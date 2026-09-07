# Lean formalization

## Status

Lean is used as an independent machine-checked layer for the frozen theory
`IPCRVC-THEORY-FREEZE-2026-09-07-v1`.

Toolchain:

- Lean `v4.33.1`
- mathlib `v4.33.1`

The toolchain and resolved dependency graph are pinned by `lean-toolchain`, `lakefile.toml`, and `lake-manifest.json`.

CI runs:

```bash
lake build --wfail
```

so warnings and `sorry` placeholders are not accepted as a successful certification artifact.

## Certified baseline continuous game

`IPCRVC/Baseline.lean`, `IPCRVC/BaselinePhase2.lean`, and `IPCRVC/BaselineBoundaries.lean` formalize the frozen two-region continuous portfolio game over `ℝ`.

Lean-certified objects include:

- feasibility `x_i ∈ [0,1]`;
- the exact frozen local payoff;
- the affine-in-own-strategy identity;
- global positive-, negative-, and zero-slope best-response logic on the full continuous strategy set;
- `A^N = Δ/(1-α)` and `A^P = Δ`;
- the exact Nash set in every baseline regime:
  - `A < A^N`: unique `(1,1)`;
  - `A = A^N`: exactly the profiles with `x_1=1` or `x_2=1`;
  - `A > A^N`: exactly `(1,0)`, `(0,1)`, and `(q,q)`, where `q=α+Δ/A`;
- the aggregate welfare identity;
- the exact coordinated fixed-capacity planner set in every baseline regime:
  - `A < Δ`: unique `(1,1)`;
  - `A = Δ`: exactly the profiles with `x_1=1` or `x_2=1`;
  - `A > Δ`: exactly `(1,0)` and `(0,1)`;
- threshold ordering `A^P < A^N`;
- the headline Priority Duplication Wedge

```text
Δ < A < Δ/(1-α)
```

with unique Nash equilibrium `(1,1)`, coordinated optima `(1,0)` and `(0,1)`, and strict welfare gain from reallocation;
- the high-`A` symmetric-equilibrium welfare gap showing `(q,q)` is strictly welfare-inferior to the differentiated coordinated optimum.

The Nash proofs quantify over all feasible deviations in `[0,1]`. They do not replace the continuous game by a binary restriction and do not use a local first-order-condition shortcut.

## Certified restricted robustness

`IPCRVC/Robustness.lean` formalizes the Stage-7.5A binary switching result at its deliberately restricted scope:

- planner switch iff `G>Δ`;
- local switch iff `λG>Δ`, equivalently `G>Δ/λ` when `λ>0`;
- `0<λ<1` implies `Δ<Δ/λ`;
- for `Δ<G<Δ/λ`, coordination switches while the local jurisdiction does not.

This is a binary configuration-switch theorem, not a general continuous-game theorem.

The same file formalizes the specific alternative capacity-matching technology

```text
M(x_1,x_2)
= min{x_1,1-x_2} + min{1-x_1,x_2}
= 1 - |x_1+x_2-1|.
```

For `A>Δ`, Lean proves that the exact coordinated optimum set is

```text
x_1+x_2=1
```

subject to feasibility.

`IPCRVC/CapacityGame.lean` formalizes the decentralized side of this same matching technology. Under

```text
Δ < A < Δ/λ,
0 < λ < 1,
```

Lean proves:

```text
unique decentralized Nash equilibrium: (1,1)
exact coordinated optimum set: x_1+x_2=1.
```

Thus the manuscript's restricted conclusion—reallocation away from duplication rather than general complete specialization—is machine checked for this exact alternative matching rule.

## Deliberate remaining scope

The following manuscript results are not yet treated as Lean-certified:

1. the differentiable concave CRS production-function incidence extension;
2. the concave-CES specialization of that incidence result;
3. the monotone integration-index inverse-threshold statement for `G(τ)`;
4. the endogenous-capture counterexample as a Lean declaration.

They remain analytically and regression-tested in the existing reproducibility layer, but should not be described as Lean-certified until corresponding declarations are added and CI passes.

No theorem is claimed for arbitrary matching technologies, arbitrary continuous portfolio games, or arbitrary numbers of regions/activities.

## Running locally

```bash
lake update
lake build --wfail
```

## Interpretation

Lean checks that the encoded theorem follows from the encoded assumptions. It does not establish that the economic assumptions are empirically correct, that the model is novel, that the incidence assumptions are institutionally accurate, or that the manuscript's journal positioning is valid. Those remain separate economic and literature-review questions.
