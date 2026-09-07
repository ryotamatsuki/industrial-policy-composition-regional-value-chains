# Industrial Policy Composition and Regional Value Chains

Canonical repository for the theory paper currently titled **Industrial Policy Composition and Regional Value Chains**.

## Research question

When regional governments allocate scarce industrial-policy capacity across activities, how does incomplete local capture of cross-regional complementary value distort the composition of decentralized policy relative to coordinated policy?

## Core mechanism

> Incomplete local capture of cross-regional complementary value delays decentralized portfolio adjustment.

The authoritative theory specification is [`THEORY_FREEZE.md`](THEORY_FREEZE.md), freeze ID `IPCRVC-THEORY-FREEZE-2026-09-07-v1`.

## Reproducibility

Install the pinned Python dependencies and run the complete local gate:

```bash
python -m pip install -r requirements.txt
make all
```

Useful targets:

```bash
make verify   # exact SymPy identities
make test     # permanent regression/counterexample suite
make outputs  # deterministic tables/figure scaffold
make paper    # bibliography-aware LaTeX build
```

The repository also contains an independent Lean formalization layer. Lean `v4.33.1` and mathlib `v4.33.1` are pinned by `lean-toolchain`, `lakefile.toml`, and `lake-manifest.json`.

```bash
lake build --wfail
```

`IPCRVC/Baseline.lean` currently machine-checks the frozen payoff representation, low-regime global Nash logic, aggregate welfare, coordinated global optimality in the headline region, threshold ordering, and the continuous-strategy **Priority Duplication Wedge**:

```text
Delta < A < Delta/(1-alpha)
```

implies unique decentralized duplication `(1,1)`, coordinated fixed-capacity optima `(1,0)` and `(0,1)`, and a strict welfare improvement from reallocation. See [`docs/LEAN_FORMALIZATION.md`](docs/LEAN_FORMALIZATION.md) for the exact certified scope and the results not yet formalized in Lean.

## Canonical baseline

Two regions choose `x_i in [0,1]`, the share of fixed policy capacity allocated to the locally high-return/upstream activity. The remainder `1-x_i` goes to the complementary/downstream activity.

```text
W_i(x_i,x_j)
= b_D + Delta x_i
+ alpha A x_i(1-x_j)
+ (1-alpha) A (1-x_i)x_j
```

with `Delta > 0`, `A > 0`, and `0 < alpha < 1`.

The decentralized threshold is `A^N = Delta/(1-alpha)` and the coordinated fixed-capacity threshold is `A^P = Delta`. Hence `A^P < A^N`.

## Repository structure

```text
.
├── THEORY_FREEZE.md
├── STATUS.md
├── Makefile
├── requirements.txt
├── lean-toolchain
├── lakefile.toml
├── lake-manifest.json
├── IPCRVC.lean
├── IPCRVC/
│   └── Baseline.lean
├── model/
├── scripts/
├── tests/
├── theorem_certificates/
├── docs/
├── paper/
│   └── sections/
├── figures/
├── tables/
├── results/
├── references/
├── literature/
├── manuscript/
└── submission/
```

## Theory and claim control

- Stage 4A: `GO — MATHEMATICAL ADVERSARIAL CERTIFICATION PASS`
- Stage 7.5A: `GO — GENERALITY / QUANTIFIER CERTIFICATION PASS`
- Stage 8: `THEORY FROZEN`
- Stage 9: `REPRODUCIBILITY BASELINE READY`
- Stage 13: `INTEGRATED MANUSCRIPT READY FOR SUBMISSION QA`
- Lean headline-theorem layer: kernel build PASS on the frozen baseline

No silent theory drift is permitted. The complete allowed/prohibited claim scope is in [`docs/CLAIM_SCOPE_LEDGER.md`](docs/CLAIM_SCOPE_LEDGER.md), and the exact welfare benchmark is in [`docs/BENCHMARK_REGISTER.md`](docs/BENCHMARK_REGISTER.md).
