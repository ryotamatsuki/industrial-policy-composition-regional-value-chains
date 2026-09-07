# Regression Tests

Permanent regression tests inherited from Stage 4A and Stage 7.5A.

## R1 — Intermediate wedge

```text
alpha = 0.5
Delta = 1
A = 1.5
```

Expected: unique Nash equilibrium `(1,1)`; coordinated optima `(1,0)` and `(0,1)`.

## R2 — Nash threshold

```text
alpha = 0.5
Delta = 1
A = 2
```

Expected Nash set: `x_1=1 or x_2=1`.

## R3 — High-integration multiplicity

```text
alpha = 0.5
Delta = 1
A = 3
q = 5/6
```

Expected Nash set: `(1,0)`, `(0,1)`, `(5/6,5/6)`. The symmetric equilibrium is welfare-inferior.

## R4 — Vanishing incidence wedge

As `alpha -> 0`, verify `A^N -> A^P = Delta`.

## R5 — Endogenous-capture overclaim counterexample

```text
G(tau) = 1 + tau
lambda(tau) = 1/(1+tau)^2
Delta = 1
```

Expected: planner prefers reallocation for `tau>0`; local captured value never exceeds `Delta`, so no finite decentralized switching threshold exists.

## R6 — Complete-specialization overclaim counterexample

With

```text
M(x_1,x_2) = 1 - |x_1+x_2-1|,
```

for sufficiently strong complementarity, every `x_1+x_2=1` is coordinated-optimal, including `(1/2,1/2)`.

These tests must remain in all later verification implementations. A change that invalidates one requires explicit theory change-control rather than deletion of the test.
