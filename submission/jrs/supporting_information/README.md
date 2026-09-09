# Anonymous reproducibility supplement

This supporting-information package reproduces the analytical identities, regression/counterexample checks, deterministic figure/table source files, and machine-checkable Lean source used in the manuscript **Industrial Policy Composition and Regional Value Chains**. It contains no author names, affiliations, author-owned repository URLs, or intentionally identifying metadata.

The Stage-14 package builder copies the exact canonical Lean source and pinned Lean toolchain files into the generated anonymous archive; the canonical files are not duplicated in version control.

## Environment

Python 3.11+ is recommended. The Python dependencies are pinned to:

- SymPy 1.14.0;
- pytest 9.0.2.

Install dependencies:

```bash
python -m pip install -r requirements.txt
```

The included Lean source is pinned to Lean 4.33.1 and the mathlib revision resolved by `lake-manifest.json`.

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

## Deterministic exposition outputs

```bash
python generate_outputs.py
```

This recreates the source files for the manuscript's regime figure and exact threshold/scope table under local `figures/`, `tables/`, and `results/` directories. Stage-14 package QA runs this generator twice and requires byte-identical output hashes.

## Lean source

The generated submission archive contains a `lean/` directory with:

- `IPCRVC.lean` and all current `IPCRVC/*.lean` modules;
- `lean-toolchain`;
- `lakefile.toml`;
- `lake-manifest.json`.

From that directory, the formalization is checked with:

```bash
lake build --wfail
```

The Lean layer certifies only the documented encoded claims. It does not replace the manuscript's analytical proofs and does not certify results outside the recorded formalization boundary.

## Python files

- `model/baseline.py` — baseline payoffs, thresholds, best responses, Nash check, and planner corner comparison.
- `verify_symbolic.py` — exact SymPy identities.
- `tests/test_regressions.py` — headline/boundary regression tests.
- `tests/test_claim_scope_counterexamples.py` — permanent counterexamples limiting claim scope.
- `generate_outputs.py` — deterministic figure/table source generator.
- `requirements.txt` — pinned Python dependencies.

The code and proof sources are reproducibility aids. The proofs in the manuscript remain the authority for the analytical results.
