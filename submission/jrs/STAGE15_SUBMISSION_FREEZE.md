# Stage 15 — Submission Freeze Record

Date: 2026-09-10  
Target journal: Journal of Regional Science (JRS)  
Theory freeze: `IPCRVC-THEORY-FREEZE-2026-09-07-v1`

## 1. Current Stage-15 status

`IN PROGRESS — AUTHOR CONFIRMATION / AUTHENTICATED PORTAL PREFLIGHT PENDING`

The validated scientific manuscript is ready for submission freeze, but the immutable final freeze must not be declared until the author-specific declarations and the authenticated JRS Research Exchange preflight are completed.

No substantive manuscript or theory change is authorized in Stage 15.

## 2. Entry gate

Stage 14 closed with no theory drift. After Stage 14, an independent Astra final hostile-referee review supplied by the author returned:

`MINOR NON-SUBSTANTIVE ISSUES ONLY — FIX WITHOUT REOPENING THEORY`

The review found no material mathematical, scope/quantifier, novelty, or JRS-fit defect and authorized Stage 15 after five bounded repairs.

The five repairs were implemented in PR #12 (`stage14r1/astra-minor-repair`) and merged to `main`:

1. equilibrium exposition now states that differentiated equilibria first appear at `A=A^N`;
2. the binary switching lemma distinguishes strict preference from indifference at equality;
3. the CES illustration states positive inputs and `rho <= 1`, `rho != 0` explicitly;
4. the Cremer bibliography record uses `Helmuth`;
5. the Lin Chen bibliography record uses BibTeX ordering `Lin, Chen`.

The generated Figure 1 wording was changed only to remove the misleading implication that differentiated equilibria first emerge for strict `A>A^N`. A first post-repair rendering exposed a label-overflow defect; the label was reformatted without changing its meaning and the final rendered figure was visually rechecked.

No payoff, strategy domain, threshold, Nash set, planner set, welfare result, proposition, proof, Lean theorem, or certified robustness quantifier changed.

## 3. Candidate canonical submission state

Candidate canonical content commit:

`cf9d9d2a342d7fa06b469f9ae6521ed33eab1763`

Git tree:

`56b975f897743754341bd7962e6d2179331befe1`

The final post-Astra QA artifact was built by the pull-request workflow at synthetic merge commit:

`39653fbb032594d44de41391445b49cc53d3ae46`

That workflow commit, the repaired branch head `96baf1d98e87ec2cec52b63e45b69f1a4bfb4619`, and merged `main` commit `cf9d9d2a342d7fa06b469f9ae6521ed33eab1763` all resolve to the same Git tree `56b975f897743754341bd7962e6d2179331befe1`. Thus the validated submission content is byte-for-byte the content merged to `main`; only commit ancestry differs.

This is a candidate submission content SHA, not yet the final Stage-15 freeze identifier. A final tag/freeze identifier must be recorded only after author and portal-only requirements are resolved.

## 4. Final post-Astra verification evidence

Final repaired branch head:

`96baf1d98e87ec2cec52b63e45b69f1a4bfb4619`

GitHub Actions:

- verification run `34408675212`: PASS;
- manuscript/package run `34408675189`: PASS;
- `make verify`: PASS;
- `make test`: PASS;
- deterministic outputs: PASS;
- fresh reproducibility gate (`make all`): PASS;
- JRS package construction and clean-extraction rebuild: PASS.

Lean sources/toolchain were not modified by the Astra repairs. The Stage-14 fresh kernel build therefore remains the operative formal-verification evidence; no new Lean claim was introduced.

Final visual QA after the repair:

- separate `Figure_1.pdf`: PASS, no label overflow/clipping;
- manuscript page containing Figure 1: PASS;
- LaTeX package QA reports no box warnings.

## 5. Candidate artifact provenance

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

## 6. Candidate final artifact inventory

Validated reviewer-facing artifacts:

1. `JRS_Manuscript_for_Peer_Review.pdf`;
2. `JRS_Blinded_LaTeX_Source.zip`;
3. `JRS_Anonymous_Supporting_Information.zip`;
4. `Figure_1.pdf`;
5. `BUILD_PROVENANCE.txt`;
6. `STAGE14_PACKAGE_BUILD.log`.

Repository-side journal files additionally include:

- `metadata.md`;
- `cover_letter.md`;
- `title_page_TEMPLATE.tex`;
- `JOURNAL_REQUIREMENTS_LEDGER.md`;
- anonymization, source-package, AI-disclosure, and supporting-information documentation.

## 7. Journal Requirements Ledger status

All material public JRS/Wiley requirements checked at Stage 14 remain resolved. Remaining `UNVERIFIED` entries are either:

- authenticated-portal-only fields/designations; or
- the optional post-acceptance OA APC amount, which is non-blocking for initial submission.

The portal-only items must be reconciled against the actual authenticated JRS submission record before final submit.

## 8. AUTHOR CONFIRMATION REQUIRED

The following facts must be explicitly confirmed by the author and must not be inferred from profile/history:

- full author name(s) and order;
- institutional affiliation(s);
- email address(es);
- ORCID(s);
- corresponding-author designation;
- present/postal address if required by the portal;
- funding statement;
- conflict-of-interest statement;
- non-AI acknowledgments or confirmation of none;
- exact ChatGPT model/version(s) and access period, plus any other materially used AI tools;
- preprint/prior-public-dissemination status;
- confirmation that this manuscript is not under consideration elsewhere;
- CRediT roles if the authenticated portal requires them.

## 9. Repository anonymity decision

The source repository is public. JRS permits preprints/public sharing but warns that public dissemination can compromise double-blind anonymity. The Stage-14 classification remains:

`PRIVATE DURING REVIEW RECOMMENDED`

Repository visibility must not be changed without explicit author authorization.

## 10. Authenticated portal preflight still required

Before final submission:

- open the actual JRS Research Exchange submission record;
- reconcile article type and every required field;
- confirm title/abstract/seven keywords and any JEL/category/editor fields;
- confirm all author data and corresponding-author designation;
- determine any CRediT, reviewer, cover-letter, graphical-abstract/highlight, or AI portal fields;
- verify double-blind title-page handling;
- upload/designate the manuscript, editable LaTeX source, Figure 1, anonymous SI, title page/author file, and cover letter as actually required;
- resolve all warnings;
- generate the portal submission PDF when offered/required;
- inspect that PDF page by page before final submit.

## 11. Freeze decision

Current verdict:

`NOT YET FROZEN — STAGE 15 IN PROGRESS`

Scientific/package blocker: `NONE`  
Author-confirmation blocker: `YES`  
Authenticated-portal blocker: `YES`  
Theory rollback required: `NO`

The next permitted changes are limited to author-confirmed metadata/declarations, authenticated-portal reconciliation, non-substantive file designation/packaging changes required by the portal, final portal-PDF inspection, and recording the immutable freeze identifier. Any substantive manuscript change reopens the affected earlier stage.
