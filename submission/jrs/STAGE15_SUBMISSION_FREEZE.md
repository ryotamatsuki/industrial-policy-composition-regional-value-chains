# Stage 15 — Submission Freeze Record

Date: 2026-09-10  
Target journal: Journal of Regional Science (JRS)  
Theory freeze: `IPCRVC-THEORY-FREEZE-2026-09-07-v1`

## 1. Current Stage-15 status

`IN PROGRESS — AUTHOR METADATA RESOLVED / AUTHENTICATED PORTAL PREFLIGHT PENDING`

The validated scientific manuscript and the author-side submission metadata are ready. The immutable final submission freeze must not yet be declared because the authenticated JRS Research Exchange field/file-designation preflight and any portal-generated submission PDF remain outstanding.

No substantive manuscript or theory change is authorized in Stage 15.

## 2. Entry gate and Astra repair closure

Stage 14 closed with no theory drift. After Stage 14, an independent Astra final hostile-referee review returned `MINOR NON-SUBSTANTIVE ISSUES ONLY — FIX WITHOUT REOPENING THEORY`.

The five bounded repairs were implemented in PR #12 and merged to `main`:

1. equilibrium exposition now states that differentiated equilibria first appear at `A=A^N`;
2. the binary switching lemma distinguishes strict preference from indifference at equality;
3. the CES illustration states positive inputs and `rho <= 1`, `rho != 0` explicitly;
4. the Cremer bibliography record uses `Helmuth`;
5. the Lin Chen bibliography record uses BibTeX ordering `Lin, Chen`.

The generated Figure 1 wording was adjusted only to remove the misleading implication that differentiated equilibria first emerge for strict `A>A^N`. A first post-repair rendering exposed a label-overflow defect; the label was reformatted without changing meaning and the final rendered figure was visually rechecked.

No payoff, strategy domain, threshold, Nash set, planner set, welfare result, proposition, proof, Lean theorem, or certified robustness quantifier changed.

## 3. Validated scientific-content anchor

Scientific content candidate commit:

`cf9d9d2a342d7fa06b469f9ae6521ed33eab1763`

Git tree:

`56b975f897743754341bd7962e6d2179331befe1`

The final post-Astra QA artifact was built at synthetic merge commit `39653fbb032594d44de41391445b49cc53d3ae46`. That workflow commit, repaired branch head `96baf1d98e87ec2cec52b63e45b69f1a4bfb4619`, and merged `main @ cf9d9d2a...` resolve to the same Git tree. Thus the scientifically validated submission content merged to `main` is identical to the final post-Astra QA content.

Stage-15 administrative files are being added on `stage15-submission-freeze`; they do not alter the blinded scientific manuscript.

## 4. Final post-Astra verification evidence

Final repaired branch head: `96baf1d98e87ec2cec52b63e45b69f1a4bfb4619`.

GitHub Actions:

- verification run `34408675212`: PASS;
- manuscript/package run `34408675189`: PASS;
- `make verify`: PASS;
- `make test`: PASS;
- deterministic outputs: PASS;
- fresh reproducibility gate (`make all`): PASS;
- JRS package construction and clean-extraction rebuild: PASS.

Lean sources/toolchain were not modified by the Astra repairs. The Stage-14 fresh kernel build remains the operative formal-verification evidence; no new Lean claim was introduced.

Final post-Astra visual QA:

- separate `Figure_1.pdf`: PASS, no label overflow/clipping;
- manuscript page containing Figure 1: PASS;
- LaTeX package QA: no box warnings.

## 5. Reviewer-facing artifact provenance

Post-Astra JRS QA artifact digest:

`sha256:4020c9059a146e3e6d705226dd43f0269975af0afd9d152f6702194756366390`

`BUILD_PROVENANCE.txt` reports:

- PDF pages: `16`;
- cited bibliography records: `15`;
- bibliography records: `15`;
- blinded source ZIP SHA-256: `535faec023f15d7a15477e58b568ab3a18f33522a15dc69b41bdfd317767eb32`;
- anonymous SI ZIP SHA-256: `bc937656d60b40bdacd1a0418c03242f3bb4723edd756c3a8ac0c33f392f7da7`;
- peer-review manuscript PDF SHA-256: `cbef0f95c92f55faf0cdaccec51ccaf25d1d24141ac13be2401bfb4cba203ff6`;
- Figure 1 PDF SHA-256: `ece5797fbceaf40b22a68b0beb21eb89123137964a611e3b94adc3ff0718b3c7`;
- `figures/phase_regions.svg`: `4bc584a91cf9f6a22ccd78906ee70e0b76ec192921e66c6cd469145161b0b9ef`;
- `figures/phase_regions.tex`: `24b35e63379ec8b07550a236637ccbf68e05f05bb7d1ee26dde044046cba6f2d`;
- `tables/thresholds.tex`: `f7ae606af57ca54da0913a3248301ad0b39cb3b22027aa5173a8eb88aa4b7e0a`;
- LaTeX box warnings: `NONE`.

Validated reviewer-facing artifacts:

1. `JRS_Manuscript_for_Peer_Review.pdf`;
2. `JRS_Blinded_LaTeX_Source.zip`;
3. `JRS_Anonymous_Supporting_Information.zip`;
4. `Figure_1.pdf`;
5. `BUILD_PROVENANCE.txt`;
6. `STAGE14_PACKAGE_BUILD.log`.

## 6. Author identity and declarations — RESOLVED

At the author's instruction, Stage 15 reused the consistent author/declaration record from prior 2026 journal submissions rather than requesting the same information again.

Final author-side defaults:

- author: `Ryota Matsuki`;
- order: sole author;
- affiliation: `Independent Researcher`;
- location: `Matsuyama, Ehime, Japan`;
- postal code if required: `790-0853`;
- email: `ryota.matsuki@gmail.com`;
- ORCID: `0009-0005-2329-531X`;
- corresponding author: `Ryota Matsuki`;
- funding: `This research received no external funding.`;
- competing interests: `The author declares no competing interests.`;
- non-AI acknowledgments: `None.`;
- exclusive submission: `The manuscript is original and is not under consideration elsewhere.`;
- AI technology/access period: `OpenAI ChatGPT (GPT-5.6, accessed September 2026)`;
- other materially used AI tools: none identified in the project/submission record.

If the live portal uses materially different attestation wording, the portal wording controls and must be reconciled before submission.

## 7. Title page and cover letter

Final Stage-15 files:

- `submission/jrs/title_page.tex`;
- `submission/jrs/cover_letter.md`.

The title page contains the resolved author/corresponding-author data, running title, acknowledgments, AI manuscript-preparation acknowledgment, funding statement, and conflict-of-interest statement.

Independent Stage-15 LaTeX rendering check of `title_page.tex`:

- compilation: PASS;
- pages: `1`;
- overfull/underfull box defects: none detected;
- visual inspection: PASS;
- locally rendered title-page PDF SHA-256: `8281196e23096914859a510c6e884135d5b1322b3cbe7a227ef78bf79fd38da5`.

The PDF hash above is QA evidence for the Stage-15 source at the time of inspection; the canonical upload derivative will be regenerated/frozen after the portal's accepted title-page format/designation is known.

## 8. Public repository / prior dissemination decision — RESOLVED

Repository visibility is **PUBLIC**.

The author expressly selected on 2026-09-10:

`KEEP PUBLIC DURING REVIEW`

No repository-visibility change is authorized. The residual discoverability risk under JRS double-blind review is accepted. Reviewer-facing uploaded files remain fully anonymized.

Prior-dissemination wording for portal reconciliation:

- a public GitHub research repository containing project/manuscript materials exists and will remain public;
- no separate formal preprint has been identified in the project record.

If the portal asks broadly about prior public posting rather than specifically about preprints, answer in a manner that discloses the public GitHub repository rather than answering an unqualified `No`.

## 9. CRediT default if requested

If the JRS portal enables or requires CRediT, use the established single-author role set:

- Conceptualization;
- Methodology;
- Formal analysis;
- Software;
- Validation;
- Visualization;
- Writing — original draft;
- Writing — review & editing.

Portal enablement remains to be checked.

## 10. Journal Requirements Ledger status

All material public JRS/Wiley requirements checked at Stage 14 remain resolved. Remaining `UNVERIFIED` entries are either authenticated-portal-only fields/designations or the optional post-acceptance OA APC amount, which is non-blocking for initial submission.

There is no remaining author-metadata blocker based on the existing submission record and the author's Stage-15 instruction.

## 11. Authenticated portal preflight still required

Before final freeze/submission:

- open the actual JRS Research Exchange submission record;
- reconcile the exact article-type dropdown;
- confirm title, abstract, seven keywords, and any JEL/category/editor fields;
- confirm author identity, ORCID, email, affiliation, and corresponding-author designation against the portal;
- determine CRediT, reviewer suggestion/exclusion, cover-letter designation, graphical abstract/highlights, and portal-specific AI fields;
- reconcile the exact prior-publication/preprint/public-posting question with the public GitHub repository fact;
- verify double-blind title-page handling;
- designate/upload manuscript, editable LaTeX source, Figure 1, anonymous SI, title page/author file, and cover letter as actually required;
- resolve all portal warnings;
- generate the portal submission PDF when offered/required;
- inspect that PDF page by page before final submit.

## 12. Freeze decision

Current verdict:

`NOT YET FROZEN — AUTHENTICATED PORTAL PREFLIGHT ONLY`

Scientific/package blocker: `NONE`  
Author-metadata/declaration blocker: `NONE`  
Repository-visibility decision blocker: `NONE`  
Authenticated-portal blocker: `YES`  
Theory rollback required: `NO`

The next permitted changes are limited to authenticated-portal reconciliation, non-substantive file designation/packaging changes required by the portal, final portal-PDF inspection, and recording the immutable freeze identifier. Any substantive manuscript change reopens the affected earlier stage.
