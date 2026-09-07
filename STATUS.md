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
- Primary journal: **Journal of Regional Science**
- Default fallback: **Regional Science and Urban Economics**
- Next canonical stage: **Stage 13 — Full Paper Integration**

## Canonical theory artifact

`THEORY_FREEZE.md` was first committed in repository commit:

`16bd8c50801a5af0ec7acc740a667a26ca8dac1b`

Stage 9 baseline was integrated at:

`7665a22b00e031596e39cca47fb5f1b9508d84bf`

Stage 10 full draft was integrated at:

`a911a83f6c900876552657f1e7dd5b32edaa801b`

Stage 11 hostile-referee revisions were integrated at:

`72e0ae5946aaabe99160c09bfb98126b648d1590`

## Stage 12 journal positioning

The full positioning record is `docs/STAGE12_JOURNAL_POSITIONING.md`.

Canonical submission ladder:

1. **Journal of Regional Science** — primary target.
2. **Regional Science and Urban Economics** — first automatic fallback when rejection concerns contribution magnitude/fit rather than correctness.
3. **Journal of Economic Geography, Economics section** — alternative interdisciplinary route after presentation-only economic-geography integration.
4. **The Annals of Regional Science** — safety net.

`Journal of Urban Economics` is retained only as a stretch benchmark, not as the default first submission. `Journal of Public Economics` is excluded from the current ladder because Stage 11's surviving contribution is too close to classic public-economics spillover/composition mechanisms for the likely contribution threshold.

The selection of JRS follows the certified paper rather than journal prestige. Stage 13 may change presentation, journal-specific metadata, file structure, disclosure statements, and exposition emphasis, but may not add a mechanism or enlarge theorem scope.

## Reproducibility gate

Run:

```bash
python -m pip install -r requirements.txt
make all
```

The manuscript remains subject to exact symbolic verification, permanent regression/counterexample tests, deterministic output generation, bibliography-aware LaTeX build, and unresolved-citation/reference guard.

## Change control

`IPCRVC-THEORY-FREEZE-2026-09-07-v1` remains authoritative. Any future substantive change to players, timing, strategies, payoffs, benchmark, matching, production, theorem scope, policy-budget endogeneity, or the certified novelty object requires formal theory-change control and reopening of the affected earlier stages.