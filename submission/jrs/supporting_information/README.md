# Anonymous reproducibility supplement

This supporting-information package reproduces the analytical identities and regression/counterexample checks used in the manuscript **Industrial Policy Composition and Regional Value Chains**. It contains no author names, affiliations, repository URLs, or other intentionally identifying metadata.

## Environment

Python 3.11+ is recommended.

Install dependencies:

```bash
python -m pip install -r requirements.txt
```

## Symbolic checks

```bash
python verify_symbolic.py
```

Expected result: six exact symbolic identities pass, covering the local payoff difference, aggregate welfare identity, planner switch gain, threshold gap, high-complementarity symmetric-equilibrium welfare gap, and constant-capture threshold gap.

## Regression and scope tests

Run from this directory:

```bash
python -m pytest -q
```

Expected result: six tests pass. Four preserve headline and boundary cases of the baseline model. Two preserve negative scope results: endogenous capture does not by itself guarantee a finite local switching threshold, and alternative capacity matching prevents a general claim of complete coordinated specialization.

## Files

- `model/baseline.py` — baseline payoffs, thresholds, best responses, Nash check, and planner corner comparison.
- `verify_symbolic.py` — exact SymPy identities.
- `tests/test_regressions.py` — headline/boundary regression tests.
- `tests/test_claim_scope_counterexamples.py` — permanent counterexamples limiting claim scope.
- `requirements.txt` — pinned Python dependencies.

The code is a reproducibility aid. The proofs in the manuscript remain the authority for the analytical results.
