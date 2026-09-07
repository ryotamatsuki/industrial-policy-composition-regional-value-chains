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
- Next canonical stage: **Stage 11 — Referee-Grade Adversarial Gate**

## Canonical theory artifact

`THEORY_FREEZE.md` was first committed in repository commit:

`16bd8c50801a5af0ec7acc740a667a26ca8dac1b`

Stage 9 baseline was integrated at:

`7665a22b00e031596e39cca47fb5f1b9508d84bf`

Stage 10 began from that SHA and was constructed on `stage10-paper-construction` via PR #2.

## Stage 10 manuscript gate

The complete draft contains substantive Abstract, Introduction, Related Literature, Model, Decentralized Equilibrium, Coordinated Benchmark and Welfare, Mechanism and Robustness, Institutional Interpretation, Conclusion, and Appendix proofs.

Automated gates on the Stage 10 branch pass:

- exact symbolic verification;
- 8 permanent regression/counterexample tests;
- deterministic figure/table generation;
- BibTeX-aware full LaTeX build;
- final-log guard against unresolved citations/references;
- GitHub `verification` CI;
- GitHub `manuscript-build` CI.

The required exposition map is `docs/FIGURE_TABLE_ARCHITECTURE.md`; the full construction record is `docs/STAGE10_REPORT.md`.

## Change control

Any post-freeze theoretical change must identify affected equations, propositions, quantifiers, benchmark definitions, verification artifacts, literature claims, and workflow stages to re-run. Stage 11 attacks the existing completed manuscript; it may not silently extend the frozen model.
