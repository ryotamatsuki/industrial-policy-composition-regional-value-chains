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
- Lean formalization: `BASELINE EQUILIBRIUM + HEADLINE WEDGE + SELECTED ROBUSTNESS — KERNEL BUILD PASS`
- Lean-informed proof exposition: `COMPLETE — NO THEORY CHANGE`
- Primary journal: **Journal of Regional Science**
- Default fallback: **Regional Science and Urban Economics**
- Next canonical stage: **Stage 14 — Submission QA**

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

## Stage 14 operational handoff

Submission QA must resolve only package/account/live-system matters:

- author name(s), affiliation(s), email(s), and ORCID(s);
- funding, conflict-of-interest, and acknowledgment declarations;
- exclusive-submission and preprint-status confirmation;
- author confirmation of the AI disclosure and responsibility for the final manuscript;
- final PDF metadata/anonymity inspection;
- decision whether to make the public development repository private during double-blind review;
- live Wiley/JRS submission-system fields and file-upload requirements.

Stage 14 may repair package defects but may not enlarge the theory or contribution.

## Reproducibility gates

Python/LaTeX/JRS package gate:

```bash
python -m pip install -r requirements.txt
make all
```

Lean formalization gate:

```bash
lake build --wfail
```

The gates cover exact symbolic verification, permanent regression/counterexample tests, deterministic outputs, the anonymous JRS supporting-information tests, bibliography-aware LaTeX build, unresolved-citation/reference checks, and the machine-checked baseline plus selected restricted robustness layer described above.

## Change control

`IPCRVC-THEORY-FREEZE-2026-09-07-v1` remains authoritative. Any future substantive change to players, timing, strategies, payoffs, benchmark, matching, production, theorem scope, policy-budget endogeneity, or the certified novelty object requires formal theory-change control and reopening of the affected earlier stages.
