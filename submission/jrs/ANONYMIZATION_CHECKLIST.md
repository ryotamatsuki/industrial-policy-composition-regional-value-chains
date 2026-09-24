# JRS double-blind anonymization checklist

Stage-14 live check date: **2026-09-10**.  
Stage-15 author/repository decision update: **2026-09-10**.

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

## Separate title page — RESOLVED IN STAGE 15

The finalized file is `submission/jrs/title_page.tex`.

- [x] full author name: Ryota Matsuki;
- [x] sole-author order;
- [x] affiliation: Independent Researcher;
- [x] location: Matsuyama, Ehime, Japan;
- [x] email: ryota.matsuki@gmail.com;
- [x] ORCID: 0009-0005-2329-531X;
- [x] corresponding author: Ryota Matsuki;
- [x] running title under 40 characters (`Industrial Policy Portfolios`, 28 characters);
- [x] non-AI acknowledgments: None;
- [x] funding: This research received no external funding;
- [x] conflict of interest: The author declares no competing interests;
- [x] AI manuscript-preparation acknowledgment: OpenAI ChatGPT (GPT-5.6, accessed September 2026).

The identity/declaration values were carried forward from the author's prior 2026 journal-submission title pages and cover letters at the author's instruction.

## Anonymous supporting information

The actual generated archive is `JRS_Anonymous_Supporting_Information.zip`.

- [x] Static SI files contain no author name/affiliation/public author-owned repository URL.
- [x] Package builder copies exact Lean source/toolchain into an anonymous `lean/` folder without repository-owner metadata.
- [x] Package builder re-runs the Python symbolic/regression/counterexample checks and deterministic-output generator in the staged SI.
- [x] Package builder applies the same identifying-token/email scan to the complete generated SI tree.

## PDF properties and visual QA

Stage-14 full PDF QA passed. After the independent Astra gate, the five bounded non-substantive repairs were rebuilt and the repaired Figure 1 and its manuscript page were visually rechecked.

Post-Astra validated content head: `96baf1d98e87ec2cec52b63e45b69f1a4bfb4619`.  
Merged candidate content: `main @ cf9d9d2a342d7fa06b469f9ae6521ed33eab1763`.  
Both resolve to Git tree `56b975f897743754341bd7962e6d2179331befe1`.

- [x] PDF Author metadata blank.
- [x] Author-identifying text absent from reviewer PDF text layer.
- [x] Fonts embedded.
- [x] Stage-14 full CI artifact visually inspected page by page: 16/16 pages.
- [x] Post-Astra manuscript/package build passed.
- [x] Post-Astra separate `Figure_1.pdf` visually inspected with no clipping/overflow.
- [x] Post-Astra manuscript page containing Figure 1 visually inspected.
- [x] LaTeX package QA reports no box warnings.

Post-Astra peer-review manuscript PDF SHA-256: `cbef0f95c92f55faf0cdaccec51ccaf25d1d24141ac13be2401bfb4cba203ff6`.

## Public development repository decision

Repository visibility: **PUBLIC**.

The repository is author-owned and exposes the exact manuscript title. A reviewer can therefore search the title and infer authorship even when all uploaded review files are correctly blinded. JRS permits preprints/public sharing but expressly notes that such public posting may compromise anonymity.

### Stage-15 author decision

**KEEP PUBLIC DURING REVIEW — EXPLICITLY SELECTED 2026-09-10.**

The author has elected to keep the repository public. No visibility change is to be made. Submit only the anonymous reviewer-facing files and accept the residual discoverability risk.

The risk classification remains `PRIVATE DURING REVIEW RECOMMENDED`, not `MATERIAL ANONYMITY CONFLICT`, because JRS permits public sharing while warning that it may compromise anonymity. The author's explicit public-repository decision controls the operational action.
