# Canonical Theory Freeze

**Project:** Industrial Policy Composition and Regional Value Chains  
**Freeze ID:** `IPCRVC-THEORY-FREEZE-2026-09-07-v1`  
**Freeze date:** 2026-09-07  
**Canonical workflow:** `ryotamatsuki/research-paper-workflow` v2.0  
**Stage 4A:** `GO — MATHEMATICAL ADVERSARIAL CERTIFICATION PASS`  
**Stage 7.5A:** `GO — GENERALITY / QUANTIFIER CERTIFICATION PASS`  
**Stage 8:** `THEORY FROZEN — GO TO REPRODUCIBILITY SETUP`

This file is the canonical theoretical specification. Later writing, code, robustness work, or journal positioning may not silently alter the object below.

## 1. Research question

When regional governments allocate scarce industrial-policy capacity across activities, how does incomplete local capture of cross-regional complementary value distort the composition of decentralized policy relative to coordinated policy?

## 2. Contribution statement

The paper identifies a composition-specific decentralization failure in industrial policy. When governments allocate fixed policy capacity between activities that generate cross-regional complementary value, a jurisdiction undertaking the complementary activity may capture only part of the surplus it creates. Decentralized governments therefore reallocate policy away from locally high-return priorities only at a strictly higher threshold than a coordinated fixed-capacity planner.

Canonical one-line mechanism:

> **Incomplete local capture of cross-regional complementary value delays decentralized portfolio adjustment.**

## 3. Players, timing, information

- Regions/local governments: `i in {1,2}`.
- Static simultaneous-move game.
- Complete information.
- Each government chooses its portfolio once.
- No strategic pricing, quantity, entry, migration, or contracting stage is part of the baseline game.

## 4. Strategy sets and fixed policy capacity

Each region has normalized total industrial-policy capacity equal to 1.

- `x_i in [0,1]`: share allocated to the locally high-return/upstream activity U.
- `1-x_i`: share allocated to the complementary/downstream activity D.

The fixed-capacity constraint is a **core economic assumption**, not merely a normalization.

## 5. Direct local return

Let `b_D` denote the direct real value of the complementary/downstream activity and let

```text
Delta = b_U - b_D > 0.
```

Thus the direct local surplus in region `i` is

```text
b_D + Delta x_i.
```

`Delta` is interpreted as an opportunity-cost-adjusted real local/social value premium (e.g. productivity, real value added, real wage surplus, genuine agglomeration return). It is **not** automatically interpretable as a pure fiscal transfer, political prestige, or accounting revenue.

## 6. Baseline cross-regional production

Baseline production technology:

```text
Y = A u^alpha d^(1-alpha),
```

with

```text
A > 0,
0 < alpha < 1.
```

At the unit complementary match `(u,d)=(1,1)`, output is `A`. Under competitive CRS incidence, the upstream side receives `alpha A` and the downstream side receives `(1-alpha)A`.

## 7. Baseline matching

The mass of cross-region complementary matches is:

```text
x_i(1-x_j)
```

for U in region `i` matched with D in region `j`, and

```text
(1-x_i)x_j
```

for the reverse direction.

## 8. Canonical local payoff

For `j != i`, the frozen payoff is

```text
W_i(x_i,x_j)
= b_D + Delta x_i
+ alpha A x_i(1-x_j)
+ (1-alpha)A(1-x_i)x_j.
```

Any change to this payoff is a post-freeze theoretical change.

## 9. Equilibrium concept

Pure-strategy Nash equilibrium on `[0,1]^2`.

Define

```text
q = alpha + Delta/A.
```

The global payoff difference is

```text
W_i(1,x_j) - W_i(0,x_j)
= Delta + alpha A - A x_j.
```

Hence the global best-response correspondence is

```text
BR_i(x_j) = 1              if x_j < q,
            [0,1]          if x_j = q,
            0              if x_j > q.
```

The baseline portfolio game therefore exhibits strategic substitutes.

## 10. Decentralized threshold and exact Nash set

Define

```text
A^N = Delta/(1-alpha).
```

### 10.1 Low complementarity

If

```text
0 < A < A^N,
```

then the unique Nash equilibrium is

```text
(x_1,x_2) = (1,1).
```

### 10.2 Boundary

If

```text
A = A^N,
```

then the Nash set is exactly

```text
{(x_1,x_2) in [0,1]^2 : x_1 = 1 or x_2 = 1}.
```

### 10.3 High complementarity

If

```text
A > A^N,
```

then the exact Nash set is

```text
{(1,0), (0,1), (q,q)}.
```

## 11. Welfare benchmark

The relevant social object is

```text
W = W_1 + W_2
  = 2b_D + (Delta + A)(x_1+x_2) - 2A x_1 x_2.
```

The planner chooses `(x_1,x_2) in [0,1]^2` while holding fixed total policy capacity, the policy instrument set, information, production, and matching technology.

Canonical benchmark label:

> **coordinated fixed-capacity planner benchmark**

Do **not** call this `first best` or `unrestricted social optimum`.

## 12. Planner threshold and exact planner set

Define

```text
A^P = Delta.
```

- If `A < Delta`, the unique coordinated optimum is `(1,1)`.
- If `A = Delta`, the optimum set is `{x_1=1 or x_2=1}`.
- If `A > Delta`, the exact coordinated optima are `(1,0)` and `(0,1)`.

## 13. Headline Theorem T1 — Threshold ordering

For all

```text
Delta > 0,
0 < alpha < 1,
A > 0,
```

we have

```text
A^P = Delta < Delta/(1-alpha) = A^N.
```

**Status:** `PROVED`  
**Stage 4A:** `PASS`

## 14. Headline Theorem T2 — Priority Duplication Wedge

For all

```text
Delta > 0,
0 < alpha < 1,
Delta < A < Delta/(1-alpha),
```

- `(1,1)` is the **unique** Nash equilibrium;
- the coordinated fixed-capacity planner strictly prefers `(1,0)` or `(0,1)`.

This is a positive-measure region with unique decentralized priority duplication and coordinated reallocation.

**Status:** `PROVED`  
**Stage 4A:** `PASS`

## 15. Headline Theorem T3 — High-integration multiplicity

For

```text
A > Delta/(1-alpha),
```

Nash equilibria are exactly

```text
(1,0), (0,1), (q,q).
```

The asymmetric differentiated equilibria are coordinated-optimal; the symmetric interior equilibrium is not.

**Status:** `PROVED`  
**Stage 4A:** `PASS`

## 16. Intermediate-region welfare loss

Within

```text
Delta < A < Delta/(1-alpha),
```

the welfare loss from decentralized duplication is

```text
L = A - Delta > 0.
```

This formula is not licensed outside the intermediate region.

## 17. Certified general switching lemma

Separate from the continuous baseline game, consider a binary configuration switch with:

- local premium `Delta > 0`;
- total complementary value `G > 0`;
- local capture fraction `lambda in (0,1)` for the jurisdiction that undertakes the complementary activity.

The coordinated switch is desirable iff

```text
G > Delta,
```

while the local government switches iff

```text
lambda G > Delta.
```

Hence

```text
G^P = Delta < Delta/lambda = G^N.
```

**Classification:** `SUFFICIENT-CONDITION SWITCHING THEOREM`  
**Not** a general continuous-portfolio theorem.

## 18. Integration version

If `G=G(tau)` is continuous and strictly increasing, `lambda in (0,1)` is constant, and both `Delta` and `Delta/lambda` lie in the range of `G`, then unique thresholds satisfy

```text
G(tau^P) = Delta,
G(tau^N) = Delta/lambda,
```

and

```text
tau^P < tau^N.
```

If the second crossing does not exist, the decentralized switch may never occur.

## 19. Endogenous capture share

If `lambda=lambda(tau)`, define

```text
H(tau)=lambda(tau)G(tau).
```

Planner switch condition:

```text
G(tau) > Delta.
```

Local switch condition:

```text
H(tau) > Delta.
```

Incomplete capture alone does **not** guarantee a finite decentralized threshold. A finite ordered threshold pair requires suitable monotonicity/crossing conditions for `G` and `H`.

## 20. Restricted production-function robustness

A certified restricted-class extension uses

```text
Y = A F(u,d),
```

where `F` is:

- differentiable;
- concave;
- homogeneous of degree one;
- `F_u(1,1)>0`;
- `F_d(1,1)>0`.

Under competitive factor pricing,

```text
A^P = Delta/F(1,1),
A^N = Delta/F_d(1,1),
```

and Euler's theorem plus `F_u>0` implies

```text
A^P < A^N.
```

**Classification:** `RESTRICTED FUNCTION-CLASS RESULT`.

## 21. CES robustness

For an admissible concave CES technology

```text
F(u,d)=[omega u^rho + (1-omega)d^rho]^(1/rho),
```

with `0<omega<1` and a concavity-compatible parameter domain,

```text
F_d(1,1)=1-omega,
```

so

```text
A^N = Delta/(1-omega).
```

**Classification:** `ANALYTIC ROBUSTNESS`.

## 22. Alternative matching robustness

Alternative matching technology:

```text
M(x_1,x_2)
= min{x_1,1-x_2} + min{1-x_1,x_2}
= 1 - |x_1+x_2-1|.
```

In the certified intermediate region, decentralized policy remains at `(1,1)`, while the coordinated optimum reallocates to the set

```text
x_1+x_2=1.
```

Thus the robust message is **reallocation away from excessive duplication**, not complete regional specialization.

**Classification:** `SPECIFIC ANALYTIC ROBUSTNESS`.

## 23. Essential vs tractability assumptions

### Essential economic assumptions

1. Scarce/fixed policy capacity.
2. Positive local direct premium `Delta>0`.
3. Positive cross-regional complementary value.
4. Incomplete local capture (`lambda<1` in the general switch representation).

### Baseline tractability assumptions

1. Two regions.
2. Two activities.
3. Symmetric direct premium.
4. Random cross-region matching.
5. Cobb-Douglas CRS technology.
6. Complete information.
7. Simultaneous policy choice.
8. Unit-capacity normalization.

Two regions and two activities are **not** certified as innocuous generalizations and remain part of the baseline theorem domain.

## 24. Institutional interpretation

Approved mappings include:

- Smart Specialisation priority allocation;
- interregional innovation investment;
- regional cluster policy;
- cross-regional supply/value chains;
- place-based industrial policy;
- regional GX/industrial-cluster policy.

The model does not claim that actual governments literally satisfy a one-unit hard equality. The institutional content is that governments face scarce policy resources/attention and must prioritize among competing domains.

## 25. Closest-paper distinction

Existing work already studies local industrial-policy competition, sector-specific subsidies, upstream/downstream policy, regional duplication, division of labor, coordination, and integration effects.

The surviving novelty claim is narrowly:

> **A fixed-capacity policy-composition game in which incomplete local capture of cross-regional complementary value generates a strict wedge between decentralized and coordinated portfolio-switching thresholds.**

No broader novelty claim is canonical.

## 26. Explicitly prohibited stronger claims

Do not claim that:

- decentralized industrial policy generically causes duplication;
- coordination always induces complete regional specialization;
- centralization is optimal;
- the coordinated benchmark is the first best;
- arbitrary matching technologies preserve the theorem;
- arbitrary production functions preserve the theorem;
- the theorem holds for arbitrary numbers of regions or activities;
- incomplete capture alone guarantees a finite decentralized switching threshold;
- integration always eliminates the coordination problem;
- every high-`A` Nash equilibrium is efficient;
- industrial-policy competition itself is the novelty;
- regional duplication itself is the novelty;
- upstream/downstream industrial policy itself is the novelty.

## 27. Stage 4A theorem-certificate register

| ID | Object | Status |
|---|---|---|
| T1 | Threshold ordering | PASS / PROVED |
| T2 | Intermediate priority duplication wedge | PASS / PROVED |
| T3 | High-A exact Nash set | PASS / PROVED |
| T4 | Nash boundary at `A=A^N` | PASS / PROVED |
| T5 | Planner boundary at `A=Delta` | PASS / PROVED |
| T6 | Not every high-A NE is efficient | PASS / PROVED negative result |

## 28. Stage 7.5A claim-scope register

| Claim | Frozen scope |
|---|---|
| Continuous exact equilibrium | Baseline payoff only |
| Constant-lambda switch lemma | Binary configuration comparison |
| Integration thresholds | Monotone `G`, constant `lambda`, crossings exist |
| Endogenous capture | Additional monotonicity/crossing conditions required |
| CRS production | Differentiable concave CRS, positive marginal products |
| CES | Admissible concave parameter domain |
| Capacity matching | Exact stated alternative only |
| Arbitrary matching | Not claimed |
| Arbitrary number of regions/activities | Not claimed |
| Complete regional specialization | Baseline-specific |

## 29. Solver and continuation ledger

- Numerical equilibrium solver required: `NO`.
- Baseline solution: analytic closed form.
- Off-path continuation: `NOT APPLICABLE`.
- `UNRESOLVED`: 0.
- `NUMERICAL_FAILURE`: 0.
- Material discarded branch: 0.

## 30. Permanent regression tests

### R1 — Intermediate wedge

```text
alpha = 0.5
Delta = 1
A = 1.5
```

Expected: unique NE `(1,1)`; coordinated optima `(1,0)` and `(0,1)`.

### R2 — Nash threshold

```text
alpha = 0.5
Delta = 1
A = 2
```

Expected Nash set: `x_1=1 or x_2=1`.

### R3 — High-integration multiplicity

```text
alpha = 0.5
Delta = 1
A = 3
q = 5/6
```

Expected Nash set: `(1,0)`, `(0,1)`, `(5/6,5/6)`. The symmetric equilibrium is welfare-inferior.

### R4 — Vanishing incidence wedge

As `alpha -> 0`, verify `A^N -> A^P = Delta`.

### R5 — Endogenous-lambda overclaim counterexample

```text
G(tau)=1+tau
lambda(tau)=1/(1+tau)^2
Delta=1
```

The planner prefers reallocation for `tau>0`, but local captured value `lambda(tau)G(tau)=1/(1+tau)` never exceeds `Delta`.

### R6 — Complete-specialization overclaim counterexample

Under capacity matching `M=1-|x_1+x_2-1|`, high complementarity makes all profiles satisfying `x_1+x_2=1` coordinated-optimal, including `(1/2,1/2)`.

## 31. Theory change control

No silent theory drift is permitted.

Any post-freeze change must record:

1. what changed;
2. why;
3. affected equations;
4. affected propositions;
5. affected theorem quantifiers;
6. affected planner/benchmark definitions;
7. affected verification;
8. affected literature claims;
9. workflow stages that must be re-run.

Changes to payoff, strategy set, matching, timing, production, equilibrium concept, or planner problem require reopening Stage 4/4A and all affected downstream gates. Changes only to theorem scope/generality require at least Stage 7.5A re-certification before a new freeze.
