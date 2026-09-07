# Lean formalization

## Status

Lean is used as an independent machine-checked layer for the frozen theory
`IPCRVC-THEORY-FREEZE-2026-09-07-v1`.

Toolchain:

- Lean `v4.33.1`
- mathlib `v4.33.1`

The versions are pinned by `lean-toolchain` and `lakefile.toml`.

## Current formalized objects

The file `IPCRVC/Baseline.lean` formalizes the core two-region continuous portfolio game over `ℝ`:

- feasibility `x_i ∈ [0,1]`;
- the exact frozen local payoff;
- the affine-in-own-strategy identity;
- the global best-response implication when the payoff slope is positive;
- the decentralized threshold `A^N = Δ/(1-α)`;
- uniqueness of `(1,1)` below `A^N`;
- the aggregate welfare identity;
- global planner optimality of `(1,0)` and `(0,1)` when `A>Δ`;
- the threshold ordering `A^P < A^N`;
- the headline Priority Duplication Wedge:

```text
Δ < A < Δ/(1-α)
```

implies

```text
unique Nash equilibrium: (1,1)
coordinated fixed-capacity optima include: (1,0), (0,1)
welfare(1,1) < welfare(1,0)
```

The proof is on the full continuous strategy set. It does not replace the game by a binary restriction and does not use a local first-order-condition shortcut.

## Deliberate scope

The first Lean integration targets the submission headline theorem. The following certified paper results remain candidates for a second formalization layer:

1. exact Nash set at `A=A^N`;
2. exact high-`A` Nash set `{(1,0),(0,1),(q,q)}`;
3. exact planner set at the boundary `A=Δ`;
4. the high-`A` symmetric-equilibrium welfare gap;
5. the binary constant-capture lemma;
6. restricted CRS and alternative-matching robustness.

These are not silently treated as Lean-certified until corresponding declarations are added and CI passes.

## Running locally

```bash
lake update
lake build
```

The repository also runs a dedicated GitHub Actions Lean build. CI is configured with `--wfail`, so warnings such as `sorry` placeholders are not accepted as a successful certification artifact.

## Interpretation

Lean checks that the encoded theorem follows from the encoded assumptions. It does not establish that the economic assumptions are empirically correct, that the model is novel, or that the manuscript's institutional interpretation is valid. Those remain separate economic and literature-review questions.
