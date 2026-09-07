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
- Next canonical stage: **Stage 12 — Journal Positioning**

## Canonical theory artifact

`THEORY_FREEZE.md` was first committed in repository commit:

`16bd8c50801a5af0ec7acc740a667a26ca8dac1b`

Stage 9 baseline was integrated at:

`7665a22b00e031596e39cca47fb5f1b9508d84bf`

Stage 10 full draft was integrated at:

`a911a83f6c900876552657f1e7dd5b32edaa801b`

Stage 11 began from that SHA on `stage11-referee-gate`.

## Stage 11 hostile referee gate

The full audit is recorded in `docs/STAGE11_REPORT.md`.

Key conclusions:

- no fatal mathematical/global-equilibrium attack;
- no Stage-4A or Stage-7.5A certification regression;
- no benchmark-definition failure;
- no unresolved solver or continuation failure;
- restricted CRS and alternative-matching scope survives independent attack;
- classic fiscal-federalism/local-public-good spillover prior art materially narrows the novelty claim;
- public-expenditure-composition prior art is now explicitly distinguished;
- fixed policy capacity is retained as an essential maintained environment rather than presented as an innocuous normalization;
- jurisdictional incidence/ownership assumptions and welfare-accounting scope are now explicit;
- the remaining major uncertainty is journal ceiling, which is assigned to Stage 12 rather than addressed by prestige-driven theory expansion.

## Reproducibility gate

Run:

```bash
python -m pip install -r requirements.txt
make all
```

The Stage 11 manuscript remains subject to the same symbolic verification, permanent regression tests, deterministic output generation, bibliography-aware LaTeX build, and unresolved-citation/reference guard.

## Change control

Stage 11 made literature and exposition repairs only. `THEORY_FREEZE.md` is unchanged. Any future substantive change to players, timing, strategies, payoffs, benchmark, matching, production, theorem scope, or policy-budget endogeneity requires formal theory-change control and reopening of the affected earlier stages.
