# Stage 14 — Submission QA Report

## A. Executive QA verdict

**CONDITIONAL PASS**

Stage 14 is complete. No substantive mathematical, theoretical, Lean-scope, bibliographic, figure/table, anonymity, source-package, or PDF defect remains. The paper may proceed to **Stage 15 — Submission Freeze / authenticated portal preflight**.

The conditional status is retained only because author-specific metadata/declarations have not been supplied and several fields can be known only inside the authenticated JRS Research Exchange portal. These are operational Stage-15 items, not manuscript/theory defects.

No earlier theoretical stage needs to be reopened.

## B. Canonical state

- Inspected latest `main`: `9ba1d9d2052f2e4e732380e2c4f403c7cbc65f70`
- Prompt canonical `main`: `9ba1d9d2052f2e4e732380e2c4f403c7cbc65f70`
- Difference: **NONE**
- Canonical theory freeze: `IPCRVC-THEORY-FREEZE-2026-09-07-v1`
- Target journal: **Journal of Regional Science**
- Audit date: **2026-09-10**
- Stage-14 branch: `stage14-submission-qa`
- Stage-14 PR: **#10 — Stage 14 — Submission QA**
- Final technical QA head: `5f49eb7c9c672024312a1db42300a9daba7760e6`
- GitHub Actions PR synthetic merge SHA used to build the final artifact: `f6ad877c0a0db7b3ae2b50182d12961757b2d118`
- `THEORY_FREEZE.md`: **unchanged**

All Stage-14 manuscript/package repairs were non-substantive: bibliography cleanup, disclosure/data wording, anonymity/package verification, source-package generation, CI verification, and hyperlink-border formatting.

## C. Clean-build result

Final technical head `5f49eb7c9c672024312a1db42300a9daba7760e6` received fresh successful GitHub Actions runs for all three verification layers.

| Gate | Command / CI step | Result |
|---|---|---|
| Dependency install | `python -m pip install -r requirements.txt` | PASS |
| Full repository gate | `make all` | PASS |
| Symbolic verification | `scripts/verify_symbolic.py` | PASS |
| Regression + counterexample tests | `python -m pytest -q` | PASS |
| Deterministic outputs | `scripts/generate_outputs.py` | PASS; double-generation hashes identical |
| Anonymous SI symbolic checks | SI `verify_symbolic.py` | PASS — 6 exact identities |
| Anonymous SI pytest | SI `python -m pytest -q` | PASS — 6 tests |
| Anonymous SI output regeneration | SI `generate_outputs.py` twice | PASS; hashes identical |
| LaTeX/BibTeX | `pdflatex` + `bibtex` + 3 post-BibTeX passes | PASS |
| Citation/reference stability | fatal regex gate | PASS; no unresolved/unstable refs |
| Exact upload archive clean extraction | unzip into isolated temp directory + rebuild | PASS |
| PDF metadata/font/anonymity | `pdfinfo`, `pdftotext`, `pdffonts` | PASS |
| Lean kernel build | `lake build --wfail` | PASS |

Environment recorded by CI:

- Python `3.11.16`
- repository Python dependencies: SymPy `1.14.0`, pytest `9.0.2`
- Lean toolchain: pinned `v4.33.1`
- mathlib: pinned/resolved by `lake-manifest.json`, documented as `v4.33.1`

Final package provenance:

- PDF pages: `16`
- cited bibliography records: `15`
- bibliography records: `15`
- LaTeX box warnings: `NONE`
- blinded source ZIP SHA-256: `219137eec5ae32d9f305d920843622618b4d5c5c3120e376ba732d79f6bf415d`
- anonymous SI ZIP SHA-256: `8056107c61036a91a913993f522d149b2e636eecef8777c6ff9b686dc4bfe6bb`
- manuscript PDF SHA-256: `ed939cfcd3237127741664ca42ec0db873de9f79459fe7aef8e62ab4f87ceb1d`
- Figure 1 PDF SHA-256: `da758acbd332ac3e78ae2436f35c85105c63395eeb1bb3c24de978066af240a5`

## D. Mathematical/Lean consistency

**Theory drift verdict: `NO THEORY DRIFT`**

Direct comparison against `THEORY_FREEZE.md` confirms no change to:

- payoff;
- strategy set;
- parameter domains;
- `A^P` / `A^N` thresholds;
- exact baseline Nash sets;
- complete analytical baseline planner sets;
- wedge welfare result;
- binary-switching scope;
- integration quantifiers;
- CRS scope;
- CES scope;
- alternative matching scope.

All current `IPCRVC/*.lean` modules and the umbrella `IPCRVC.lean` were inspected. `docs/LEAN_FORMALIZATION.md` matches the actual declarations. The manuscript does not describe as Lean-certified any result beyond the encoded scope.

The following remain correctly documented as Lean coverage boundaries rather than theorem defects:

1. no standalone Lean theorem for uniqueness of baseline planner `(1,1)` at `A<Delta`;
2. no standalone Lean theorem exhausting the high-`A` planner set to only `(1,0),(0,1)`;
3. no global Lean proof of CES concavity;
4. no arbitrary matching/region/activity theorem.

Fresh `lake build --wfail`: **PASS**.

## E. Figure/table QA

The Stage-10/13 architecture remains exactly one regime figure and one threshold/scope table. No new central visual was added.

- both are generated from verified source;
- thresholds exactly match `A^P=Delta` and `A^N=Delta/(1-alpha)`;
- Figure 1 correctly isolates the Priority Duplication Wedge;
- Table 1 correctly distinguishes baseline continuous results from the binary switching result;
- deterministic regeneration passed twice in both canonical and anonymous-SI generators;
- all figure/table references resolve;
- captions match actual scope;
- Figure 1 does not rely on color;
- separate `Figure_1.pdf` was generated from the same source;
- fonts are embedded;
- manuscript rendering and separate Figure 1 were visually inspected and are readable.

Result: **PASS**.

## F. Bibliography/reference QA

- every in-text citation resolves;
- every remaining bibliography entry is cited;
- no duplicate bibliography key remains;
- no stale placeholder/fabricated citation was found;
- closest and material references were rechecked against source/publisher metadata;
- DOI metadata was checked where present;
- JRS Free Format permits the current consistent initial author-year style.

One verified but unused NBER entry, `GoldbergEtAl2024`, was removed because it was not cited anywhere in the manuscript. This was a bibliography-only cleanup and changed no claim or literature positioning.

The Stage-14 package builder now fails on missing cited keys, uncited bibliography entries, duplicate keys, unresolved LaTeX citations, or unresolved references.

Result: **PASS**.

## G. Refreshed JRS Requirements Ledger

Full evidence-bearing details are preserved in `submission/jrs/JOURNAL_REQUIREMENTS_LEDGER.md`.

| Topic | Current rule | Official source | Access date | Status | Action |
|---|---|---|---|---|---|
| Aims & Scope | analytical/theoretical regional research is within scope | JRS Overview | 2026-09-10 | PASS | none |
| Article type | current ordinary papers use `RESEARCH ARTICLE` | JRS current journal page | 2026-09-10 | PASS | confirm exact portal dropdown |
| Submission platform | Research Exchange / Wiley Authors | JRS Author Guidelines | 2026-09-10 | PASS | authenticated preflight |
| Submission fee | no submission fee | JRS Author Guidelines | 2026-09-10 | PASS | none |
| Initial formatting | Free Format Submission | JRS Author Guidelines | 2026-09-10 | PASS | none |
| LaTeX | ReX supports LaTeX source suite + review PDF | Wiley LaTeX guidance | 2026-09-10 | PASS | clean-extraction build passed |
| Review model | double blind | JRS Author Guidelines | 2026-09-10 | PASS | maintain anonymous review files |
| Preprint policy | allowed, but may compromise anonymity | JRS Author Guidelines | 2026-09-10 | PASS | author confirms actual status |
| Separate title page | required author/affiliation/acknowledgment information | JRS Author Guidelines | 2026-09-10 | PASS | author completion in Stage 15 |
| Running title | <40 characters | JRS Author Guidelines | 2026-09-10 | PASS | 28 chars |
| ORCID | required | JRS Author Guidelines | 2026-09-10 | PASS | AUTHOR CONFIRMATION |
| Corresponding author | required contact/designation | JRS/Wiley workflow | 2026-09-10 | PASS | AUTHOR CONFIRMATION |
| Abstract | <=250 words | JRS Author Guidelines | 2026-09-10 | PASS | 162-word Stage-14 count |
| Keywords | exactly seven | JRS Author Guidelines | 2026-09-10 | PASS | none |
| JEL | not stated as mandatory in public guide | JRS Author Guidelines | 2026-09-10 | UNVERIFIED | portal preflight only |
| References | APA journal style; Free Format permits consistent initial style | JRS Author Guidelines | 2026-09-10 | PASS | none |
| Figures | initial embedding allowed; original/separate artwork supported | JRS + Wiley figure guidance | 2026-09-10 | PASS | Figure 1 PDF supplied |
| Figure quality | readable line art, embedded fonts, suitable file | Wiley figure guidance | 2026-09-10 | PASS | none |
| Tables | titled/cited/readable | JRS Author Guidelines | 2026-09-10 | PASS | none |
| Supporting information | separate, labelled, final-format responsibility | JRS/Wiley SI guidance | 2026-09-10 | PASS | portal designation preflight |
| Data Availability | required | JRS Author Guidelines | 2026-09-10 | PASS | theory/no-dataset DAS adopted |
| Entirely theoretical DAS | no-data template permitted | Wiley Data Policy | 2026-09-10 | PASS | none |
| Code statement | no separate public JRS mandate identified | JRS/Wiley | 2026-09-10 | NOT APPLICABLE | voluntary reproducibility statement retained |
| AI use | substantive use disclosed; human accountable | Wiley ethics | 2026-09-10 | PASS | exact model/version/access period author-confirmed in Stage 15 |
| AI disclosure location | research-process vs drafting/editing placement distinguished | Wiley AI Guidelines | 2026-09-10 | PASS | split disclosure implemented |
| AI authorship | prohibited | Wiley ethics | 2026-09-10 | PASS | none |
| Funding | disclose applicable source/none | JRS Author Guidelines | 2026-09-10 | PASS | AUTHOR CONFIRMATION |
| Competing interests | disclose conflict/none | JRS Author Guidelines | 2026-09-10 | PASS | AUTHOR CONFIRMATION |
| Acknowledgments | separate title-page handling under blind review | JRS Author Guidelines | 2026-09-10 | PASS | AUTHOR CONFIRMATION |
| Ethics/consent | applicable only where relevant | JRS Author Guidelines | 2026-09-10 | NOT APPLICABLE | pure theory |
| CRediT | JRS public mandate not stated | Wiley CRediT | 2026-09-10 | UNVERIFIED | portal preflight only |
| Exclusive submission | originality/overlap rule applies | Wiley ethics/JRS | 2026-09-10 | PASS | AUTHOR CONFIRMATION |
| Suggested reviewers | public guide does not establish mandatory field | JRS Author Guidelines | 2026-09-10 | UNVERIFIED | portal preflight; do not invent |
| Opposed reviewers | public guide does not establish mandatory field | JRS Author Guidelines | 2026-09-10 | UNVERIFIED | portal preflight |
| Editor/section/category | public mandatory field not specified | JRS Author Guidelines | 2026-09-10 | UNVERIFIED | portal preflight |
| Cover-letter portal designation | public mandatory status not specified | JRS Author Guidelines | 2026-09-10 | UNVERIFIED | portal preflight |
| Graphical abstract/highlights | no public JRS requirement identified | JRS Author Guidelines | 2026-09-10 | UNVERIFIED | portal preflight; do not create unless required |
| Submission package size | source package/SI size guidance | Wiley figure/SI guidance | 2026-09-10 | PASS | script-enforced |
| Submission fee vs APC | submission fee zero; OA APC optional | JRS Author Guidelines | 2026-09-10 | PASS | none |
| Optional OA APC exact amount | post-acceptance journal price list | Wiley APC page/list | 2026-09-10 | UNVERIFIED | non-blocking; recheck at OA election |
| Mandatory publication/page/color charge | none identified in current JRS guide | JRS Author Guidelines | 2026-09-10 | PASS | none |
| Licensing | copyright agreement or OA CC choice after acceptance | JRS/Wiley licensing | 2026-09-10 | PASS | post-acceptance |

No material **public/non-portal initial-submission requirement** remains unresolved. Remaining `UNVERIFIED` items are authenticated-portal-only fields or optional post-acceptance OA pricing.

## H. Review model / anonymity

- blinded manuscript: PASS;
- separate unblinded title page: structurally prepared; author values pending;
- anonymous supplement: PASS;
- PDF Author metadata: blank;
- PDF text layer: no author-owned identifying token;
- reviewer-facing source archives: author/token/email scan PASS;
- public repository: currently PUBLIC.

Public repository classification:

**PRIVATE DURING REVIEW RECOMMENDED**

JRS permits preprints/public sharing but warns that public posting may compromise double-blind anonymity. The public author-owned repository exposes the exact manuscript title, so discoverability risk is real even though the submitted files themselves are properly blinded.

No repository visibility change was made. If the author chooses strict anonymity, the manual action is repository `Settings -> General -> Danger Zone -> Change repository visibility -> Make private` for the review period.

This is not a `MATERIAL ANONYMITY CONFLICT` and does not invalidate the manuscript package.

## I. Initial-submission/source-package QA

Actual Stage-14 generated reviewer package:

1. `JRS_Manuscript_for_Peer_Review.pdf`
2. `JRS_Blinded_LaTeX_Source.zip`
3. `Figure_1.pdf`
4. `JRS_Anonymous_Supporting_Information.zip`

The blinded LaTeX archive uses an allow-list and contains only the manuscript source/dependencies needed for submission. It excludes internal research notes, workflow files, Git metadata, title page, cover letter, public repository URL, correspondence, and author-identifying material.

The exact ZIP was extracted into an isolated temporary directory and rebuilt with LaTeX/BibTeX. The extracted build reproduced a 16-page manuscript with blank Author metadata, embedded fonts, stable citations/references, and no box warnings.

Result: **PASS**.

## J. Declarations

- **Funding:** policy requirement verified; value = `AUTHOR CONFIRMATION REQUIRED`.
- **COI:** policy requirement verified; value = `AUTHOR CONFIRMATION REQUIRED`.
- **CRediT:** `PORTAL PREFLIGHT`; public JRS mandate not established.
- **Data:** PASS; no empirical dataset, theory-specific DAS.
- **Code:** PASS; anonymous code/reproducibility package supplied voluntarily and consistently.
- **Ethics/consent:** NOT APPLICABLE.
- **Acknowledgments:** non-AI content = `AUTHOR CONFIRMATION REQUIRED`; drafting/editing AI acknowledgment template prepared.
- **AI use:** PASS for policy/content/placement; exact ChatGPT model/version(s) and access period = `AUTHOR CONFIRMATION REQUIRED` before freeze.
- **Preprint/prior dissemination:** policy verified; actual facts = `AUTHOR CONFIRMATION REQUIRED`.
- **Exclusive submission:** policy verified; actual attestation = `AUTHOR CONFIRMATION REQUIRED`.

The AI tool is not listed as an author and AI outputs are not treated as evidence.

## K. Metadata/portal fields

### Publicly verified

- title;
- running title;
- abstract limit;
- exactly seven keywords;
- current Research Article category usage;
- double-blind structure;
- title-page author information categories;
- ORCID requirement;
- DAS;
- funding/COI requirement;
- supporting-information handling.

### Author confirmation required before Stage-15 freeze

- author name/order;
- affiliation(s);
- email(s);
- ORCID(s);
- corresponding author;
- funding;
- COI;
- acknowledgments;
- exact AI model/version(s) and access period;
- preprint/prior-dissemination status;
- exclusive-submission confirmation.

### Authenticated portal only

- exact article-type dropdown;
- JEL field/requiredness;
- CRediT enablement;
- suggested/opposed reviewers;
- editor/section/category;
- cover-letter designation;
- graphical abstract/highlights;
- portal-specific AI, funding, data, prior-publication, and originality prompts.

No portal field has been invented.

## L. Fees / OA / licensing

- Submission fee: **none**.
- Mandatory page charge: **none identified in current JRS public guide**.
- Mandatory color charge: **none identified in current JRS public guide**.
- Mandatory publication charge: **none identified**.
- Open access: optional hybrid OA after acceptance; APC is not a submission fee.
- Exact optional JRS APC: defer to the then-current official Wiley price list at OA election; not material to initial submission.
- Licensing: standard copyright agreement or available Creative Commons OA license after acceptance, subject to JRS/funder rules.

Result for initial-submission readiness: **PASS**.

## M. PDF visual QA

Final CI artifact manuscript PDF:

- page count: **16**;
- every page inspected visually: **16/16**;
- Figure 1 inspected in manuscript and as separate artwork;
- Table 1 readable and within margins;
- equations and Greek characters render correctly;
- propositions/proofs readable;
- Appendix structure clear;
- bibliography clean;
- no clipping;
- no missing glyphs;
- no material bad page break;
- no overfull/underfull box warning (`NONE` in provenance);
- manuscript visibly anonymous;
- hyperlink border boxes discovered during visual QA were removed via `\hypersetup{hidelinks}` and the final CI artifact was re-inspected.

Result: **PASS**.

## N. Package inventory

Reviewer-facing Stage-14 package:

1. `JRS_Manuscript_for_Peer_Review.pdf`
2. `JRS_Blinded_LaTeX_Source.zip`
3. `Figure_1.pdf`
4. `JRS_Anonymous_Supporting_Information.zip`

The anonymous SI contains:

- baseline model code;
- symbolic verification;
- regression tests;
- negative/counterexample tests;
- deterministic figure/table generator;
- pinned Python requirements;
- exact current Lean source modules;
- `IPCRVC.lean` umbrella import;
- Lean toolchain/lake files;
- anonymous README and generated outputs.

Stage-15 unblinded/portal objects still to complete:

- final title page;
- final cover letter signature/author declarations;
- author/affiliation/ORCID portal records;
- funding/COI/acknowledgments;
- confirmed AI version/access-period disclosure;
- portal attestations.

## O. Remaining blockers

- **MATERIAL FAIL:** NONE.
- **PACKAGE FIX:** NONE.
- **AUTHOR CONFIRMATION:** author metadata, ORCID, corresponding author, funding, COI, acknowledgments, AI version/access period, preprint/prior dissemination, exclusive submission.
- **PORTAL PREFLIGHT:** exact authenticated Research Exchange fields/designations listed in Section K.

No mathematical, reproducibility, Lean, bibliography, figure/table, source-package, anonymity-file, or PDF-visual blocker remains.

## P. Stage 15 contract

Stage 15 may now:

1. obtain and insert author-confirmed metadata and declarations;
2. decide whether to make the public repository private during review;
3. open the authenticated JRS Research Exchange submission record;
4. reconcile actual portal fields/file designations with `JOURNAL_REQUIREMENTS_LEDGER.md`;
5. upload the audited reviewer-facing files without changing their substantive content;
6. complete title-page/cover-letter author fields;
7. generate and inspect any portal-produced review PDF;
8. record final SHA, hashes, portal submission ID/date, and immutable submission freeze.

Stage 15 may **not** alter the payoff, strategy, parameters, theorem statements, exact Nash/planner sets, robustness quantifiers, novelty claim, coordinated fixed-capacity interpretation, or central figure/table architecture.

If the authenticated portal reveals a new controlling requirement, make only the smallest non-substantive compliance repair and rerun the affected Stage-14 checks before freezing. Any substantive issue must reopen the earliest affected research stage.

**Stage-14 close state: `CONDITIONAL PASS` -> proceed to Stage 15.**
