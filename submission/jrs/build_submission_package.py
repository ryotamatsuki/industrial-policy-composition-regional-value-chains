#!/usr/bin/env python3
"""Build and verify the actual blinded JRS LaTeX/source and anonymous SI archives.

Stage-14 package QA only: this script does not alter theory or manuscript claims.
It uses an allow-list of files so internal workflow notes, Git metadata, and unblinded
submission materials cannot enter reviewer-facing archives accidentally.
"""
from __future__ import annotations

import hashlib
import os
import re
import shutil
import subprocess
import sys
import tempfile
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / "submission" / "jrs" / "build"
SOURCE_STAGE = OUT / "blinded_source"
SI_STAGE = OUT / "anonymous_supporting_information"
GENERATED = [
    ROOT / "tables" / "thresholds.tex",
    ROOT / "figures" / "phase_regions.tex",
    ROOT / "figures" / "phase_regions.svg",
]


def run(cmd: list[str], cwd: Path | None = None, capture: bool = False) -> str:
    print("+", " ".join(cmd))
    proc = subprocess.run(
        cmd,
        cwd=cwd,
        check=True,
        text=True,
        stdout=subprocess.PIPE if capture else None,
        stderr=subprocess.STDOUT if capture else None,
    )
    return proc.stdout if capture else ""


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def deterministic_outputs() -> dict[str, str]:
    run([sys.executable, "scripts/generate_outputs.py"], cwd=ROOT)
    first = {str(p.relative_to(ROOT)): sha256(p) for p in GENERATED}
    run([sys.executable, "scripts/generate_outputs.py"], cwd=ROOT)
    second = {str(p.relative_to(ROOT)): sha256(p) for p in GENERATED}
    if first != second:
        raise RuntimeError("deterministic output check failed")
    return second


def citation_audit() -> tuple[set[str], set[str]]:
    tex_files = [ROOT / "paper" / "main.tex", *sorted((ROOT / "paper" / "sections").glob("*.tex"))]
    cite_re = re.compile(r"\\cite(?:t|p|alp|author|year|yearpar)?(?:\[[^\]]*\]){0,2}\{([^}]+)\}")
    cited: set[str] = set()
    for path in tex_files:
        text = path.read_text(encoding="utf-8")
        for match in cite_re.finditer(text):
            cited.update(k.strip() for k in match.group(1).split(",") if k.strip())
    bib_text = (ROOT / "references" / "references.bib").read_text(encoding="utf-8")
    bibkey_list = re.findall(r"@\w+\{([^,]+),", bib_text)
    bibkeys = set(bibkey_list)
    missing = cited - bibkeys
    unused = bibkeys - cited
    if missing:
        raise RuntimeError(f"citation keys missing from bibliography: {sorted(missing)}")
    if unused:
        raise RuntimeError(f"uncited bibliography records remain: {sorted(unused)}")
    if len(bibkeys) != len(bibkey_list):
        raise RuntimeError("duplicate bibliography key detected")
    return cited, bibkeys


def copy_file(src: Path, dst: Path) -> None:
    dst.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(src, dst)


def build_latex(root: Path) -> Path:
    paper = root / "paper"
    build = paper / "build"
    if build.exists():
        shutil.rmtree(build)
    build.mkdir()
    run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error", "-output-directory=build", "main.tex"], cwd=paper)
    run(["bibtex", "build/main"], cwd=paper)
    # Three post-BibTeX passes are deliberately used at Stage 14 so labels,
    # citations, outlines, and floating-object cross-references reach a stable state.
    for _ in range(3):
        run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error", "-output-directory=build", "main.tex"], cwd=paper)
    log = (build / "main.log").read_text(encoding="utf-8", errors="replace")
    bad = [
        r"Citation .* undefined",
        r"Reference .* undefined",
        r"There were undefined references",
        r"There were undefined citations",
        r"Label\(s\) may have changed",
        r"Rerun to get cross-references right",
    ]
    for pattern in bad:
        if re.search(pattern, log):
            raise RuntimeError(f"LaTeX unresolved/unstable reference state: {pattern}")
    pdf = build / "main.pdf"
    if not pdf.exists() or pdf.stat().st_size == 0:
        raise RuntimeError("compiled manuscript PDF missing")
    return pdf


def pdf_metadata_and_fonts(pdf: Path) -> tuple[str, str, int]:
    info = run(["pdfinfo", str(pdf)], capture=True)
    author = ""
    pages = 0
    for line in info.splitlines():
        if line.startswith("Author:"):
            author = line.split(":", 1)[1].strip()
        if line.startswith("Pages:"):
            pages = int(line.split(":", 1)[1].strip())
    if author:
        raise RuntimeError(f"PDF Author metadata is not blank: {author!r}")
    text = run(["pdftotext", str(pdf), "-"], capture=True)
    lowered = text.lower()
    for forbidden in ("ryotamatsuki", "ryota matsuki", "github.com/ryotamatsuki"):
        if forbidden in lowered:
            raise RuntimeError(f"identifying text found in PDF: {forbidden}")
    fonts = run(["pdffonts", str(pdf)], capture=True)
    rows = [ln.split() for ln in fonts.splitlines()[2:] if ln.strip()]
    for row in rows:
        # pdffonts columns end with: emb sub uni object ID.  Font type may itself
        # contain whitespace (e.g. "Type 1"), so parse from the right rather than
        # assuming a fixed left-hand column index.
        if len(row) >= 5 and row[-5].lower() != "yes":
            raise RuntimeError(f"non-embedded font in {pdf.name}: {' '.join(row)}")
    return info, fonts, pages


def scan_anonymity(root: Path) -> None:
    forbidden = [
        re.compile(r"ryotamatsuki", re.I),
        re.compile(r"ryota\s+matsuki", re.I),
        re.compile(r"github\.com/ryotamatsuki", re.I),
    ]
    email_re = re.compile(r"[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}", re.I)
    text_suffixes = {".tex", ".bib", ".md", ".py", ".toml", ".json", ".txt", ".yml", ".yaml", ".svg"}
    for path in root.rglob("*"):
        if not path.is_file() or path.suffix.lower() not in text_suffixes:
            continue
        text = path.read_text(encoding="utf-8", errors="replace")
        for pat in forbidden:
            if pat.search(text):
                raise RuntimeError(f"author-identifying token in reviewer-facing file: {path}")
        if email_re.search(text):
            raise RuntimeError(f"email address in reviewer-facing file: {path}")
    main = (root / "paper" / "main.tex") if (root / "paper" / "main.tex").exists() else None
    if main:
        text = main.read_text(encoding="utf-8")
        m = re.search(r"\\author\{([^}]*)\}", text, re.S)
        if not m or m.group(1).strip():
            raise RuntimeError("blinded LaTeX main file has non-empty/missing explicit empty author field")


def make_source_stage() -> tuple[Path, int]:
    if SOURCE_STAGE.exists():
        shutil.rmtree(SOURCE_STAGE)
    (SOURCE_STAGE / "paper" / "sections").mkdir(parents=True)
    copy_file(ROOT / "paper" / "main.tex", SOURCE_STAGE / "paper" / "main.tex")
    for src in sorted((ROOT / "paper" / "sections").glob("*.tex")):
        copy_file(src, SOURCE_STAGE / "paper" / "sections" / src.name)
    copy_file(ROOT / "references" / "references.bib", SOURCE_STAGE / "references" / "references.bib")
    for src in GENERATED:
        copy_file(src, SOURCE_STAGE / src.relative_to(ROOT))
    scan_anonymity(SOURCE_STAGE)
    pdf = build_latex(SOURCE_STAGE)
    copy_file(pdf, SOURCE_STAGE / "paper" / "main.pdf")
    _, _, pages = pdf_metadata_and_fonts(SOURCE_STAGE / "paper" / "main.pdf")
    shutil.rmtree(SOURCE_STAGE / "paper" / "build")
    return SOURCE_STAGE / "paper" / "main.pdf", pages


def build_figure_pdf() -> Path:
    outdir = OUT / "figure_1"
    if outdir.exists():
        shutil.rmtree(outdir)
    outdir.mkdir(parents=True)
    src = (ROOT / "figures" / "phase_regions.tex").read_text(encoding="utf-8")
    start = src.index(r"\setlength{\unitlength}")
    end = src.index(r"\caption")
    body = src[start:end]
    tex = r"""\documentclass{article}
\usepackage[paperwidth=170mm,paperheight=55mm,margin=5mm]{geometry}
\pagestyle{empty}
\begin{document}
\noindent
""" + body + "\n\\end{document}\n"
    (outdir / "Figure_1.tex").write_text(tex, encoding="utf-8")
    run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error", "Figure_1.tex"], cwd=outdir)
    pdf = outdir / "Figure_1.pdf"
    pdf_metadata_and_fonts(pdf)
    return pdf


def make_si_stage() -> Path:
    if SI_STAGE.exists():
        shutil.rmtree(SI_STAGE)
    srcroot = ROOT / "submission" / "jrs" / "supporting_information"
    shutil.copytree(srcroot, SI_STAGE, ignore=shutil.ignore_patterns("__pycache__", ".pytest_cache", "figures", "tables", "results"))
    # Add the exact machine-checkable Lean source to the reviewer-facing archive without
    # duplicating the canonical files in version control.
    lean = SI_STAGE / "lean"
    for name in ("IPCRVC.lean", "lean-toolchain", "lakefile.toml", "lake-manifest.json"):
        copy_file(ROOT / name, lean / name)
    for src in sorted((ROOT / "IPCRVC").glob("*.lean")):
        copy_file(src, lean / "IPCRVC" / src.name)
    (lean / "README.md").write_text(
        "# Lean source included with the anonymous supplement\n\n"
        "The files in this directory are byte-for-byte copies of the canonical Lean 4 source used for the paper. "
        "The pinned toolchain is Lean 4.33.1 with mathlib resolved by `lake-manifest.json`.\n\n"
        "From this directory, run:\n\n```bash\nlake build --wfail\n```\n\n"
        "The formalization certifies only the scope documented in the manuscript/reproducibility README; "
        "it is an additional verification layer and does not replace the analytical proofs.\n",
        encoding="utf-8",
    )
    scan_anonymity(SI_STAGE)
    run([sys.executable, "verify_symbolic.py"], cwd=SI_STAGE)
    run([sys.executable, "-m", "pytest", "-q"], cwd=SI_STAGE)
    run([sys.executable, "generate_outputs.py"], cwd=SI_STAGE)
    generated = [SI_STAGE / "tables" / "thresholds.tex", SI_STAGE / "figures" / "phase_regions.tex", SI_STAGE / "figures" / "phase_regions.svg"]
    first = {str(p.relative_to(SI_STAGE)): sha256(p) for p in generated}
    run([sys.executable, "generate_outputs.py"], cwd=SI_STAGE)
    second = {str(p.relative_to(SI_STAGE)): sha256(p) for p in generated}
    if first != second:
        raise RuntimeError("anonymous SI deterministic output check failed")
    scan_anonymity(SI_STAGE)
    return SI_STAGE


def write_zip(src: Path, dst: Path) -> None:
    if dst.exists():
        dst.unlink()
    with zipfile.ZipFile(dst, "w", compression=zipfile.ZIP_DEFLATED) as zf:
        for path in sorted(src.rglob("*")):
            if path.is_file():
                zf.write(path, path.relative_to(src))


def clean_extract_build(source_zip: Path) -> tuple[int, str]:
    with tempfile.TemporaryDirectory(prefix="jrs-stage14-") as td:
        extract = Path(td)
        with zipfile.ZipFile(source_zip) as zf:
            zf.extractall(extract)
        scan_anonymity(extract)
        pdf = build_latex(extract)
        _, _, pages = pdf_metadata_and_fonts(pdf)
        log = (extract / "paper" / "build" / "main.log").read_text(encoding="utf-8", errors="replace")
        warnings = [ln.strip() for ln in log.splitlines() if "Overfull \\hbox" in ln or "Underfull \\hbox" in ln]
        return pages, "\n".join(warnings)


def main() -> None:
    OUT.mkdir(parents=True, exist_ok=True)
    hashes = deterministic_outputs()
    cited, bibkeys = citation_audit()
    manuscript_pdf, stage_pages = make_source_stage()
    figure_pdf = build_figure_pdf()
    make_si_stage()

    source_zip = OUT / "JRS_Blinded_LaTeX_Source.zip"
    si_zip = OUT / "JRS_Anonymous_Supporting_Information.zip"
    write_zip(SOURCE_STAGE, source_zip)
    write_zip(SI_STAGE, si_zip)
    pages, warnings = clean_extract_build(source_zip)
    if pages != stage_pages:
        raise RuntimeError(f"page-count drift after clean extraction: {stage_pages} -> {pages}")

    copy_file(manuscript_pdf, OUT / "JRS_Manuscript_for_Peer_Review.pdf")
    copy_file(figure_pdf, OUT / "Figure_1.pdf")

    if source_zip.stat().st_size >= 500 * 1024 * 1024:
        raise RuntimeError("LaTeX source archive exceeds Wiley 500 MB package guidance")
    if si_zip.stat().st_size >= 10 * 1024 * 1024:
        raise RuntimeError("supporting-information archive exceeds Wiley 10 MB per-file guidance")

    provenance = [
        "Stage 14 JRS submission-package build provenance",
        f"GITHUB_SHA={os.environ.get('GITHUB_SHA', 'LOCAL')}",
        f"Python={sys.version.split()[0]}",
        f"PDF_pages={pages}",
        f"cited_bibliography_records={len(cited)}",
        f"bib_records={len(bibkeys)}",
        f"source_zip_sha256={sha256(source_zip)}",
        f"si_zip_sha256={sha256(si_zip)}",
        f"manuscript_pdf_sha256={sha256(OUT / 'JRS_Manuscript_for_Peer_Review.pdf')}",
        f"figure_pdf_sha256={sha256(OUT / 'Figure_1.pdf')}",
        "deterministic_outputs=" + ",".join(f"{k}:{v}" for k, v in sorted(hashes.items())),
        "latex_box_warnings=" + (warnings.replace("\n", " | ") if warnings else "NONE"),
    ]
    (OUT / "BUILD_PROVENANCE.txt").write_text("\n".join(provenance) + "\n", encoding="utf-8")
    print("Stage 14 source-package verification PASS")
    print("\n".join(provenance))


if __name__ == "__main__":
    main()
