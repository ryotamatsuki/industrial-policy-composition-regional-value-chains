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
- for `A>Δ`, global coordinated optimality of `(1,0)` and `(0,1)`;
- at `A=Δ`, the exact coordinated optimum set `x_1=1` or `x_2=1`;
- threshold ordering `A^P < A^N`;
- the headline Priority Duplication Wedge

```text
Δ < A < Δ/(1-α)
```

with unique Nash equilibrium `(1,1)`, coordinated optima `(1,0)` and `(0,1)`, and strict welfare gain from reallocation;
- the high-`A` symmetric-equilibrium welfare gap showing `(q,q)` is strictly welfare-inferior to a differentiated coordinated optimum.

The Nash proofs quantify over all feasible deviations in `[0,1]`. They do not replace the continuous game by a binary restriction and do not use a local first-order-condition shortcut.

### Baseline planner coverage boundary

The manuscript analytically proves the exact coordinated planner set in all three regimes. The current Lean declarations certify the boundary exact set at `A=Δ` and certify global optimality of `(1,0)` and `(0,1)` for `A>Δ`, but they do **not** currently contain standalone theorems proving:

- uniqueness of `(1,1)` for `A<Δ`; or
- exhaustion of the planner set by only `(1,0)` and `(0,1)` for `A>Δ`.

Accordingly, repository documentation must not describe the exact planner set in every regime as fully Lean-certified. This coverage distinction does not change the frozen manuscript theorem or its analytic proof.

## Certified binary switching mechanism

`IPCRVC/Robustness.lean` formalizes the Stage-7.5A binary switching result at its deliberately restricted scope:

- planner switch iff `G>Δ`;
- local switch iff `λG>Δ`, equivalently `G>Δ/λ` when `λ>0`;
- `0<λ<1` implies `Δ<Δ/λ`;
- for `Δ<G<Δ/λ`, coordination switches while the local jurisdiction does not.

This is a binary configuration-switch theorem, not a general continuous-game theorem.

## Certified alternative matching robustness

`IPCRVC/Robustness.lean` formalizes the specific alternative capacity-matching technology

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

## Certified restricted CRS production result

`IPCRVC/ProductionRobustness.lean` records a restricted production technology with:

- a production function `F`;
- a Fréchet derivative at `(1,1)`;
- concavity on the nonnegative orthant;
- degree-one homogeneity on that orthant;
- positive upstream and downstream marginal products.

Using primitives available in the pinned mathlib revision, Lean derives the radial Euler identity from homogeneity and differentiability and then obtains

```text
F(1,1)=F_u(1,1)+F_d(1,1).
```

Positive upstream marginal product implies

```text
F(1,1)>F_d(1,1)>0,
```

and Lean certifies the restricted threshold ordering

```text
Δ/F(1,1) < Δ/F_d(1,1).
```

This is a restricted function-class result. It is not an arbitrary-production-function theorem.

## Certified CES unit specialization

`IPCRVC/CESRobustness.lean` formalizes the CES formula itself using `Real.rpow`:

```text
F(u,d)=[ω u^ρ + (1-ω)d^ρ]^(1/ρ).
```

Lean derives from that formula:

- `F(1,1)=1`;
- the upstream unit derivative `F_u(1,1)=ω`;
- the downstream unit derivative `F_d(1,1)=1-ω`;
- the resulting threshold ordering on the frozen admissible parameter domain.

The file does **not** contain a global Lean proof that the CES function is concave over its full economic domain. Concavity remains a maintained admissibility restriction in this specialization.

## Certified integration-threshold statements

`IPCRVC/IntegrationRobustness.lean` formalizes the constant-capture integration result at the exact Stage-7.5A scope.

If `G` is strictly increasing and both crossings exist,

```text
G(τ^P)=Δ,
G(τ^N)=Δ/λ,
```

then Lean proves:

- uniqueness of each crossing;
- `τ^P < τ^N` when `0<λ<1` and `Δ>0`.

Continuity is not used for the ordering once crossing existence is supplied. It may instead serve, with suitable range or endpoint conditions, as an analytic route to establishing existence.

## Certified endogenous-capture counterexample

The same file formalizes the frozen counterexample

```text
G(τ)=1+τ,
λ(τ)=1/(1+τ)^2,
Δ=1.
```

For every `τ>0`, Lean proves incomplete capture and planner switching. On `τ≥0`, it proves

```text
λ(τ)G(τ)=1/(1+τ) ≤ 1,
```

so the local government never has a strict switching incentive at any finite nonnegative `τ`.

This certifies the negative scope result: incomplete capture alone does not guarantee a finite decentralized switching threshold.

## Deliberate remaining scope

The following should not be described as Lean-certified unless additional declarations are added and CI passes:

1. uniqueness of the baseline coordinated optimum `(1,1)` for `A<Δ` as a standalone Lean theorem;
2. exact exhaustion of the baseline coordinated optimum set by `(1,0)` and `(0,1)` for `A>Δ` as a standalone Lean theorem;
3. global concavity of the explicit CES formula on its full admissible economic domain;
4. any theorem for arbitrary matching technologies, arbitrary continuous portfolio games, or arbitrary numbers of regions/activities.

These limits concern formalization coverage, not changes to the frozen analytic theory.

## Running locally

```bash
lake update
lake build --wfail
```

## Interpretation

The main baseline equilibrium characterizations, the headline Priority Duplication Wedge, and selected restricted robustness results are formalized and kernel-checked in Lean 4.

Lean checks that the encoded theorem follows from the encoded assumptions. It does not establish that the economic assumptions are empirically correct, that the model is novel, that the incidence assumptions are institutionally accurate, or that the manuscript's journal positioning is valid. Those remain separate economic and literature-review questions.
