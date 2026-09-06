# Industrial Policy Composition and Regional Value Chains

Canonical repository for the theory paper currently titled **Industrial Policy Composition and Regional Value Chains**.

## Research question

When regional governments allocate scarce industrial-policy capacity across activities, how does incomplete local capture of cross-regional complementary value distort the composition of decentralized policy relative to coordinated policy?

## Core mechanism

> Incomplete local capture of cross-regional complementary value delays decentralized portfolio adjustment.

Each region allocates a fixed policy capacity across a locally high-return activity and a complementary activity. The complementary activity creates value across jurisdictions, but the jurisdiction undertaking it captures only part of that value. As a result, decentralized governments reallocate policy away from duplicated high-return priorities only at a higher threshold than a coordinated fixed-capacity planner.

## Canonical baseline

Two regions choose `x_i in [0,1]`, the share of fixed policy capacity allocated to the high-local-return/upstream activity. The remainder `1-x_i` goes to the complementary/downstream activity.

Baseline payoff:

```text
W_i(x_i,x_j)
= b_D + Delta x_i
+ alpha A x_i(1-x_j)
+ (1-alpha) A (1-x_i)x_j
```

with `Delta > 0`, `A > 0`, and `0 < alpha < 1`.

The decentralized threshold is

```text
A^N = Delta / (1-alpha)
```

while the coordinated fixed-capacity planner threshold is

```text
A^P = Delta.
```

Hence `A^P < A^N`. For

```text
Delta < A < Delta/(1-alpha),
```

complete priority duplication `(1,1)` is the unique Nash equilibrium, while the coordinated fixed-capacity planner reallocates toward complementary activities.

## Theory status

- Canonical workflow: `ryotamatsuki/research-paper-workflow`
- Workflow version: `v2.0`
- Stage 4A: `GO — MATHEMATICAL ADVERSARIAL CERTIFICATION PASS`
- Stage 7.5A: `GO — GENERALITY / QUANTIFIER CERTIFICATION PASS`
- Stage 8: `THEORY FROZEN — GO TO REPRODUCIBILITY SETUP`
- Freeze ID: `IPCRVC-THEORY-FREEZE-2026-09-07-v1`

The authoritative theory specification is in [`THEORY_FREEZE.md`](THEORY_FREEZE.md).

## Repository structure

```text
.
├── README.md
├── THEORY_FREEZE.md
├── model/
├── verification/
│   ├── symbolic/
│   └── regression/
├── results/
├── literature/
├── manuscript/
└── submission/
```

## Change-control rule

No silent theory drift is permitted after the Stage 8 freeze. Any change to payoffs, strategy sets, matching, production, planner benchmark, theorem quantifiers, or contribution scope must be logged and must re-run the affected workflow gates before entering the manuscript.

## Claims explicitly not made

This project does **not** claim that:

- decentralized industrial policy generically causes duplication;
- coordination always induces complete regional specialization;
- centralization is optimal;
- the planner implements the first best;
- arbitrary matching technologies preserve the theorem;
- arbitrary production functions preserve the theorem;
- the theorem holds for arbitrary numbers of regions or activities;
- incomplete capture alone guarantees a finite decentralized switching threshold.
