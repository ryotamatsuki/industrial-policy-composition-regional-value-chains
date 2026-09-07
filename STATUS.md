# Project Status

## Current state

- Working title: **Industrial Policy Composition and Regional Value Chains**
- Canonical workflow: `ryotamatsuki/research-paper-workflow` v2.0
- Theory freeze: `IPCRVC-THEORY-FREEZE-2026-09-07-v1`
- Stage 4A: `GO — MATHEMATICAL ADVERSARIAL CERTIFICATION PASS`
- Stage 7.5A: `GO — GENERALITY / QUANTIFIER CERTIFICATION PASS`
- Stage 8: `THEORY FROZEN`
- Stage 9: `REPRODUCIBILITY BASELINE READY`
- Next canonical stage: **Stage 10 — Section-by-Section Paper Construction**

## Canonical theory artifact

`THEORY_FREEZE.md` was first committed in repository commit:

`16bd8c50801a5af0ec7acc740a667a26ca8dac1b`

Stage 9 starting `main` SHA:

`315a2ee43029a6617601c88149256577ea0dc342`

## Reproducibility gate

Run:

```bash
python -m pip install -r requirements.txt
make all
```

Local-equivalent Stage-9 validation passes exact symbolic checks, 8 regression/counterexample tests, deterministic output generation, and a two-pass LaTeX scaffold build.

## Change control

Any post-freeze theoretical change must identify affected equations, propositions, quantifiers, benchmark definitions, verification artifacts, literature claims, and workflow stages to re-run.
