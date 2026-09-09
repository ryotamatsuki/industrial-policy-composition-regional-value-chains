# JRS double-blind anonymization checklist

Stage-14 live check date: **2026-09-10**.

JRS operates double-blind peer review and explicitly warns that public preprints can compromise anonymity. Public dissemination permissibility and double-blind anonymity are separate questions.

## Blinded manuscript / source suite

- [x] `paper/main.tex` contains an explicitly empty `\author{}` field.
- [x] No author name, affiliation, email, ORCID, non-AI acknowledgment, or funding/COI identity appears in the blinded source.
- [x] No author-owned public GitHub URL appears in the blinded manuscript.
- [x] Data/code statements point to anonymous supporting information rather than an author-owned repository.
- [x] AI research-process disclosure contains no author-identifying metadata.
- [x] Figures/tables are deterministic generated objects with no author metadata.
- [x] Stage-14 package builder uses an allow-list and rejects repository-owner tokens and email addresses in reviewer-facing text files.
- [x] Stage-14 package builder rejects nonblank PDF `Author` metadata and scans extracted PDF text for author-identifying tokens.
- [x] Unblinded title page and cover letter are excluded from the blinded source archive.

## Separate title page — AUTHOR CONFIRMATION REQUIRED

Before Stage 15 freeze, complete:

- [ ] full author name(s);
- [ ] affiliation(s) where work was conducted;
- [ ] present address if applicable;
- [ ] email address(es);
- [ ] ORCID(s) — JRS requires ORCID;
- [ ] corresponding-author status;
- [x] running title under 40 characters (`Industrial Policy Portfolios`, 28 characters);
- [ ] non-AI acknowledgments or explicit confirmation that none apply;
- [ ] funding declaration;
- [ ] conflict-of-interest declaration;
- [ ] exact ChatGPT model/version(s) and access period for the AI-assisted manuscript-preparation acknowledgment.

## Anonymous supporting information

The actual generated archive is `JRS_Anonymous_Supporting_Information.zip`.

- [x] Static SI files contain no author name/affiliation/public author-owned repository URL.
- [x] Package builder copies exact Lean source/toolchain into an anonymous `lean/` folder without repository-owner metadata.
- [x] Package builder re-runs the Python symbolic/regression/counterexample checks and deterministic-output generator in the staged SI.
- [x] Package builder applies the same identifying-token/email scan to the complete generated SI tree.

## PDF properties and final visual QA

Final technical QA head: `5f49eb7c9c672024312a1db42300a9daba7760e6`.

- [x] PDF Author metadata blank (automated fatal check in package builder).
- [x] Author-identifying text absent from PDF text layer (automated fatal check).
- [x] Fonts embedded (automated fatal check).
- [x] Final CI artifact visually inspected page by page: **16/16 pages inspected**.
- [x] No clipping, broken equations, missing glyphs, unreadable figure/table text, or accidental author identification found.
- [x] Separate `Figure_1.pdf` visually inspected and readable at final artwork size.
- [x] Hyperlink border boxes removed with `\hypersetup{hidelinks}` as a formatting-only Stage-14 repair.

Final manuscript PDF SHA-256: `ed939cfcd3237127741664ca42ec0db873de9f79459fe7aef8e62ab4f87ceb1d`.

## Public development repository risk

Current repository visibility was checked through the connected GitHub account on 2026-09-10: **PUBLIC**.

The repository is author-owned and exposes the exact manuscript title. A reviewer can therefore search the title and infer authorship even when all uploaded review files are correctly blinded. JRS permits preprints/public sharing but expressly notes that such public posting may compromise anonymity.

### Stage-14 classification

**PRIVATE DURING REVIEW RECOMMENDED**

This is not a theory defect and not a journal-eligibility conflict. It is an operational anonymity risk.

Do **not** change repository visibility without explicit author authorization.

If the author elects strict double-blind mitigation, the manual action is:

`GitHub repository -> Settings -> General -> Danger Zone -> Change repository visibility -> Make private`

Keep it private for the peer-review period, then reassess public reproducibility release consistent with the article's final data/code statement.

If the author elects to keep it public, submit only the anonymous review package and accept the residual discoverability risk explicitly. The classification remains `PRIVATE DURING REVIEW RECOMMENDED`, not `MATERIAL ANONYMITY CONFLICT`, because JRS expressly permits preprints while warning about anonymity compromise.
