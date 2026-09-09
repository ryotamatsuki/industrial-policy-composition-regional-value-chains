# Project Status

## Current state

- Working title: **Industrial Policy Composition and Regional Value Chains**
- Canonical workflow: `ryotamatsuki/research-paper-workflow` v2.0
- Theory freeze: `IPCRVC-THEORY-FREEZE-2026-09-07-v1`
- Stage 4A: `GO — MATHEMATICAL ADVERSARIAL CERTIFICATION PASS`
- Stage 7.5A: `GO — GENERALITY / QUANTIFIER CERTIFICATION PASS`
- Stage 8: `THEORY FROZEN`
- Stage 9: `REPRODUCIBILITY BASELINE READY`
- Stage 10: `FULL DRAFT READY FOR REFEREE GATE`
- Stage 11: `GO TO JOURNAL POSITIONING`
- Stage 12: `PRIMARY JOURNAL SELECTED — GO TO INTEGRATION`
- Stage 13: `INTEGRATED MANUSCRIPT READY FOR SUBMISSION QA`
- Stage 14: `CONDITIONAL PASS — AUTHOR CONFIRMATION / AUTHENTICATED PORTAL PREFLIGHT ONLY`
- Lean formalization: `BASELINE EQUILIBRIUM + HEADLINE WEDGE + SELECTED ROBUSTNESS — FRESH KERNEL BUILD PASS`
- Lean-informed proof exposition: `COMPLETE — NO THEORY CHANGE`
- Stage-14 theory-drift verdict: `NO THEORY DRIFT`
- Primary journal: **Journal of Regional Science**
- Default fallback: **Regional Science and Urban Economics**
- Next canonical stage: **Stage 15 — Submission Freeze / Authenticated Portal Preflight**

## Canonical theory artifact

`THEORY_FREEZE.md` was first committed in repository commit:

`16bd8c50801a5af0ec7acc740a667a26ca8dac1b`

Stage 9 baseline was integrated at:

`7665a22b00e031596e39cca47fb5f1b9508d84bf`

Stage 10 full draft was integrated at:

`a911a83f6c900876552657f1e7dd5b32edaa801b`

Stage 11 hostile-referee revisions were integrated at:

`72e0ae5946aaabe99160c09bfb98126b648d1590`

Stage 12 journal positioning was integrated at:

`9e321c52cb8280d597a4f9a166345cb5ce01e2c3`

Stage 13 JRS integration was integrated at:

`ff9f47f88100682fbf1c1606263666994c5322f2`

Lean-informed proof exposition was integrated at:

`86af89ed9bda4eb821c4fa9773e19cc36ffa2430`

Stage 14 Submission QA is recorded in:

`submission/jrs/STAGE14_QA_REPORT.md`

Stage-14 branch / PR:

- branch: `stage14-submission-qa`
- PR: `#10 — Stage 14 — Submission QA`
- final technical QA head: `5f49eb7c9c672024312a1db42300a9daba7760e6`

## Lean formal verification layer

The independent formalization is documented in `docs/LEAN_FORMALIZATION.md` and implemented across the `IPCRVC/*.lean` modules.

Pinned environment:

- Lean `v4.33.1`;
- mathlib `v4.33.1`;
- resolved dependency graph in `lake-manifest.json`.

The current Lean-certified scope includes:

- feasibility on the continuous strategy set `x_i ∈ [0,1]`;
- the exact frozen local payoff and affine-in-own-strategy decomposition;
- global best-response logic over the full continuous strategy interval;
- the exact Nash set in every baseline regime:
  - `A<A^N`: unique `(1,1)`;
  - `A=A^N`: exactly the profiles with `x_1=1` or `x_2=1`;
  - `A>A^N`: exactly `(1,0)`, `(0,1)`, and `(q,q)`, with `q=alpha+Delta/A`;
- the aggregate welfare identity;
- at `A=Delta`, the exact coordinated optimum set `x_1=1` or `x_2=1`;
- for `A>Delta`, global coordinated optimality of `(1,0)` and `(0,1)`;
- threshold ordering `A^P<A^N`;
- the headline continuous-strategy Priority Duplication Wedge `Delta<A<Delta/(1-alpha)`, including uniqueness of decentralized duplication and strict welfare gain from coordinated reallocation;
- the high-`A` symmetric-equilibrium welfare gap showing `(q,q)` is strictly welfare-inferior to a differentiated coordinated optimum;
- the restricted binary incomplete-capture switching wedge `Delta<G<Delta/lambda`;
- the alternative capacity-matching identity, the exact coordinated optimum set `x_1+x_2=1`, and the unique decentralized duplication result on the stated wedge;
- the restricted differentiable concave CRS threshold result, including machine-derived Euler incidence at the unit match;
- the explicit CES unit specialization `F(1,1)=1`, `F_u(1,1)=omega`, `F_d(1,1)=1-omega`, and its threshold ordering on the frozen admissible domain;
- constant-capture integration crossing uniqueness and ordering when both crossings exist;
- the endogenous-capture counterexample showing incomplete capture alone need not generate a finite decentralized switching threshold.

The current formalization deliberately does **not** claim Lean certification of:

- a standalone theorem proving uniqueness of the baseline coordinated optimum `(1,1)` for `A<Delta`;
- a standalone theorem proving exhaustion of the baseline high-`A` coordinated optimum set by only `(1,0)` and `(0,1)`;
- global concavity of the explicit CES formula over its full economic domain;
- arbitrary matching technologies, arbitrary continuous portfolio games, or arbitrary numbers of regions/activities.

The manuscript analytically proves the full baseline planner characterization; the first two bullets above are formalization-coverage limits, not gaps in the frozen analytic theorem.

Lean is an additional verification layer only. It does not alter `IPCRVC-THEORY-FREEZE-2026-09-07-v1` or replace the novelty, welfare-interpretation, incidence, and journal-fit audits.

## Stage 13 JRS integration

The complete integration record is `docs/STAGE13_REPORT.md`.

Stage 13 performs presentation-only integration for JRS:

- JRS-facing abstract below 250 words;
- exactly seven keywords plus JEL metadata;
- authorless blinded main manuscript;
- separate title-page template with running title and author-specific declaration fields;
- mandatory data-availability statement adapted to a theory/code paper;
- detailed Wiley-consistent AI-use disclosure;
- explicit figure/table signposting;
- anonymous reviewer-facing reproducibility supplement;
- JRS cover-letter and metadata drafts;
- double-blind anonymization checklist;
- anonymous supplement execution added to `make all` / manuscript CI.

No model, payoff, strategy, threshold, theorem, quantifier, benchmark, or certified novelty claim is changed. `IPCRVC-THEORY-FREEZE-2026-09-07-v1` remains authoritative.

## Stage 14 Submission QA closure

Stage 14 re-opened current JRS/Wiley instructions on 2026-09-10 and completed fresh submission QA rather than relying on Stage-13 notes.

Completed gates include:

- fresh Python dependency install;
- `make all`;
- symbolic verification;
- regression and negative/counterexample tests;
- deterministic figure/table regeneration;
- anonymous supporting-information execution;
- bibliography integrity checks;
- LaTeX/BibTeX and stable cross-reference checks;
- actual blinded source ZIP construction;
- clean extraction and recompilation of the exact upload layout;
- PDF metadata/anonymity/font checks;
- fresh `lake build --wfail`;
- every-page visual inspection of the 16-page final review PDF;
- separate Figure 1 visual inspection;
- live JRS/Wiley requirements ledger refresh.

Final technical package provenance:

- manuscript PDF SHA-256: `ed939cfcd3237127741664ca42ec0db873de9f79459fe7aef8e62ab4f87ceb1d`;
- blinded source ZIP SHA-256: `219137eec5ae32d9f305d920843622618b4d5c5c3120e376ba732d79f6bf415d`;
- anonymous SI ZIP SHA-256: `8056107c61036a91a913993f522d149b2e636eecef8777c6ff9b686dc4bfe6bb`;
- Figure 1 PDF SHA-256: `da758acbd332ac3e78ae2436f35c85105c63395eeb1bb3c24de978066af240a5`;
- PDF pages: `16`;
- LaTeX box warnings: `NONE`.

Stage-14 repairs were package/presentation only. No theory change occurred.

Remaining items are expressly moved to Stage 15:

- author name/order, affiliation, email, ORCID, and corresponding-author confirmation;
- funding, conflict-of-interest, and acknowledgments confirmation;
- exact ChatGPT model/version(s) and access period for the disclosure;
- preprint/prior-dissemination and exclusive-submission confirmation;
- decision on temporary repository privacy during double-blind review;
- authenticated JRS Research Exchange field/file-designation preflight;
- final portal-generated PDF inspection and immutable submission freeze.

## Reproducibility gates

Python/LaTeX/JRS package gate:

```bash
python -m pip install -r requirements.txt
make all
python submission/jrs/build_submission_package.py
```

Lean formalization gate:

```bash
lake build --wfail
```

All of these gates passed fresh in Stage 14.

## Change control

`IPCRVC-THEORY-FREEZE-2026-09-07-v1` remains authoritative. Any future substantive change to players, timing, strategies, payoffs, benchmark, matching, production, theorem scope, policy-budget endogeneity, or the certified novelty object requires formal theory-change control and reopening of the affected earlier stages.

Stage 15 is restricted to author-confirmed metadata/declarations, authenticated portal reconciliation, file designation/upload, final generated-PDF inspection, provenance capture, and submission freeze. No substantive manuscript or theory change is permitted.
