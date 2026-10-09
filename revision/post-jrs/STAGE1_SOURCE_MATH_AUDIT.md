# Post-JRS substantive revision — Stage 1: Source & Mathematical Audit

**Date:** 2026-10-10 JST  
**Canonical verdict:** `GO TO NOVELTY GATE` — only the original **audited representation**, policy source boundaries, and the proposed mechanism **primitives** may proceed to Stage 2. No new mechanism, game, theorem, or journal selected.  
**Workflow pinned:** `ryotamatsuki/research-paper-workflow main@0642846709f006bab9e387c80bd83cdf4db52460` (v2.9 candidate, not a stable release).  
**Stage 0:** [Idea intake](STAGE0_IDEA_INTAKE.md), [candidate register](STAGE0_CANDIDATE_REGISTER.md), [AI provenance](STAGE0_AI_PROVENANCE.md).  
**Frozen benchmark:** [THEORY_FREEZE.md](../../THEORY_FREEZE.md), `IPCRVC-THEORY-FREEZE-2026-09-07-v1` — unchanged.  
**Sources examined:** `paper/sections/model.tex`, `equilibrium.tex`, `welfare.tex`, `institutional_bridge.tex`, `model/baseline.py`, `docs/LEAN_FORMALIZATION.md`, `docs/BENCHMARK_REGISTER.md`, JRS decision, and official OECD/EU sources below.

## 1. Executive findings and source hierarchy

1. **Mathematical baseline:** independently re-derived the main payoff, global response slope, welfare, threshold, all relevant corner values, exact high-integration welfare-gap identity and the boundary rational-parameter regressions by SymPy. No contradiction found in the audited headline identities.
2. **Important formal-proof coverage nuance:** existing Lean proof coverage does **not** include standalone formal certification of every planner-set characterization at all parameter regimes. The frozen manuscript gives analytic proofs. Do not state all planner-set claims are separately Lean certified.
3. **Underlying economic incidence:** factor income attributed to the hosting jurisdiction is a substantive ownership/incidence assumption, **not** entailed by Cobb–Douglas production alone.
4. **Main editorial gap is real:** the planner counterfactual is **not** a contract, transfer, grant, financing or governance-implementation equilibrium. Baseline includes neither a policy instrument nor participation/budget constraints.
5. **Institutional mismatch:** EU I3 Strand 1 finances innovation-actor **consortia** through project grants and advisory services, not a known budget-balanced transfer between two local governments. This distinction conditions H01–H03.
6. **Network feasibility is institutionally plausible:** EISMEA operates a Partner Search service to construct interregional consortia; whether such matching has a nontrivial theoretical effect on our game is wholly unproved.
7. **Proceed to Stage 2** to determine whether any of H01/H02/H03/H06/H07 has an economically independent mechanism not absorbed by fiscal-federalism, side-payment, grant, collective-choice, or network-matching parent theories.

Evidence labels: `DERIVED (SYMPY)`, `FROZEN-MANUSCRIPT ANALYTIC`, `FORMALLY CERTIFIED WITH BOUNDARIES`, `OFFICIAL INSTITUTIONAL FACT`, `ASSUMPTION`, `OPEN / HYPOTHESIS`. Never upgrade the last two to proof.

## 2. Canonical original game reconstructed from primitives

**Players:** 2 regional governments. **Time/information:** complete-information simultaneous move. **Strategy:** `x_i in [0,1]` share of normalized *fixed policy capacity* devoted to upstream high-direct-return activity U; complement `1-x_i` devoted to D. No sequential continuation, messages, companies-as-players, bargaining, project selection, voluntary entry or private information.

**Technology:** unit complementary U–D match produces `A` given `Y=A u^alpha d^(1-alpha)`, with `A>0`, `0<alpha<1`. Competitive unit input remuneration `alpha A` (U) and `(1-alpha)A` (D) is mapped to *hosting jurisdiction welfare* by a separate incidence/ownership assumption.

**Direct surplus:** `b_D+Delta*x_i`; `Delta>0` is opportunity-cost-adjusted **real surplus**, not an arbitrary transfer or purely political return.

**Matching:** exogenously cross-region fractional/random matching, directional masses `x_i(1-x_j)`, `(1-x_i)x_j`; no project-level selection or match quality choice. The actual matching rule and returns are strong structural assumptions.

**Regional payoff**:

```text
W_i = b_D + Delta*x_i
      + alpha*A*x_i*(1-x_j)
      + (1-alpha)*A*(1-x_i)*x_j.
```

**Government objective:** maximize regional modeled real payoff. **Equilibrium:** pure Nash on the full continuous square `[0,1]^2`.

**Social benchmark:** sum of the two modeled real payoffs under **the same fixed capacity, policy instruments, matching technology and information structure**. It is a *coordinated fixed-capacity planner benchmark*, not an unrestricted first best.

No households' direct/inverse demand or separate consumer-surplus object exists in this model. Thus demand derivation, consumer surplus, firm profit maximization, SOC for a smooth interior choice, and IR/contract/KKT **are not applicable to the frozen game**. If a revision adds these objects, they require fresh explicit primitives and complete solution.

## 3. Equation-by-equation independent audit

The independent symbolic script is [verify_stage1_baseline.py](verify_stage1_baseline.py); the equivalent identities were executed separately using Python/SymPy during Stage 1. Symbolic simplification, bilinear interpolation and exact rational tests passed. This is independent of importing `model/baseline.py`, but not a new clean-room Lean proof.

| Object | Independent derived identity / exact domain | Outcome |
|---|---|---|
| Own payoff slope | `dW_i/dx_i=Delta+alpha*A-A*x_j`; own second derivative `0` | `CORRECT` |
| Global BR | `1` if `x_j<alpha+Delta/A`; `[0,1]` at equality; `0` above | `CORRECT` for feasible `x_i,x_j in [0,1]` |
| Nash threshold | `A_N=Delta/(1-alpha)`, full boundary correspondence given in frozen `equilibrium.tex` | `CORRECT`; symbolic equation support and inherited full-set analytic/Lean certification |
| Welfare sum | `2*b_D+(Delta+A)*(x1+x2)-2*A*x1*x2` | `CORRECT` |
| Planner Hessian | `[[0,-2A],[-2A,0]]`, determinant `-4A**2<0` | `CORRECT`; **neither strictly concave nor convex** globally |
| Planner globality | welfare is exact convex-weighted interpolation of 4 corner values on `[0,1]^2` | `CORRECT`; corner comparison is valid without concavity; identify equality-case edges |
| Corner welfare | `W00=2b_D`; `W10=W01=2b_D+Delta+A`; `W11=2b_D+2Delta` | `CORRECT` |
| Planner threshold | `A_P=Delta`; strict `A>Delta` gives differentiated corners; boundary `A=Delta` includes `x1=1 or x2=1` | `CORRECT` analytically; Lean coverage separately qualified |
| Duplication wedge | `Delta<A<Delta/(1-alpha)`: unique Nash `(1,1)`, strictly higher planner welfare at `(1,0)` or `(0,1)` | `CORRECT` in stated domain |
| Wedge welfare gain | `W(1,0)-W(1,1)=A-Delta` | `CORRECT` **only within stated equilibrium regime as welfare loss from duplication** |
| High-A interior candidate | `q=alpha+Delta/A in (0,1)` for `A>A_N`, with Nash profiles `(1,0),(0,1),(q,q)` | `CORRECT` with original all-equilibria coverage |
| High-A welfare gap | `W(1,0)-W(q,q)=A*((1-alpha)*(1-q)+alpha*q)>0` for `A>A_N` | `CORRECT` |
| Numerical exact threshold regression | `alpha=1/2`, `Delta=1`: `A=3/2 -> q=7/6`, `A=2 -> q=1`, `A=3 -> q=5/6` | `PASS`; note `q>1` outside high-A regime is a threshold marker, not an interior equilibrium |

**Globality and boundary method:** the private payoff is affine in own `x_i`, so the slope sign certifies the *full-interval* global best response. For the planner, the welfare expression is bilinear; use the exact convex weights `(1-x1)(1-x2)`, `x1(1-x2)`, `(1-x1)x2`, `x1x2` on the four corner values. At `A=Delta`, all feasible profiles with `x1=1` or `x2=1` are optima. At `A=A_N`, the Nash set is likewise the union of these faces. Do not omit these cases.

**Concavity caution:** the social Hessian is indefinite: this is **not** a concave planner program. Any later differentiable extensions must explicitly redo global corner/interior/constraint verification. Do not assume old interpolation applies after nonlinear grants/costs.

### Stage-1 diagnostic identities for candidate primitives — NOT extension proofs

1. An exogenously imposed *pure* transfer `t*x1*(1-x2)` from region 1 to 2 cancels from `W1+W2` **algebraically**. This does not establish feasible public budgets, no distortionary financing, contractability, IR, voluntary bargaining, equilibrium selection, or real-world grant equivalence. The transfer with administrative/resource cost would not cancel completely.
2. If `Delta_1 != Delta_2` is introduced *only as a diagnostic* in direct payoffs while keeping symmetric matching and A, then `W(1,0)-W(0,1)=Delta_1-Delta_2`. A larger upstream direct premium makes that region the planner-preferred upstream provider between these two pure-role assignments. This is a trivial identity, **not** a new theorem, and is a high-risk absorption/simplicity diagnostic for H07.
3. Regional cash financing limits `B_i` do **not** already exist inside `x_i in [0,1]`. Adding `B_i` requires a financing account, creditor/taxpayer incidence, budget timing and resource-cost interpretation, not merely an extra inequality.

## 4. Parameter, payoff-incidence and welfare audit

| Primitive | Physical/economic meaning | Validation and caveat |
|---|---|---|
| `x_i` | share of **capacity to prioritize/support**, not identified cash subsidy or literal public budget | stylized `ASSUMPTION`; fiscal source cannot simply be charged against it |
| `Delta` | real local differential in U vs D surplus | `ASSUMPTION` as modeled; heterogeneous `Delta_i` requires new certification |
| `A` | value of one matched complementary unit | `ASSUMPTION`; not estimated from I3/project metrics |
| `alpha` | competitive U-input earnings fraction at a unit U–D match | `CORRECT` in Cobb–Douglas at unit match; jurisdiction capture requires extra incidence assumption |
| `lambda` | restricted alternate capture in binary switching lemma | prior Lean-certified under its exact binary-only scope, not unrestricted continuous game |
| `b_D` | real baseline D surplus | sums to `2b_D`, constant across compared policy regimes |
| `t` / `B_i` / co-financing rate | **absent** from original baseline | `OPEN`; separate cash vs real cost/benefit and source of grants before setting payoffs |
| matching rule | directional expected mass as product of shares | `ASSUMPTION`; incompatible with treating actual consortium match formation as free endogenous choice |

**Welfare comparability:** incumbent and coordinated profiles share the same production/matching environment, real accounting, two-region population and fixed capacity. Hence the wedge is internally comparable. However, original welfare excludes financing deadweight cost, administrative costs, transfers, private firm behavior and redistributional weights. A cash transfer can redistribute measured surplus without increasing it. A grant can entail real opportunity costs even if recipients count the grant as revenue; do not count public funding as extra real production.

**Participation and feasibility:** absent from the original game; do not label `planner-optimal` as `self-enforcing` or `voluntarily acceptable`. Endogenous choice of institution/contract is separate from Nash in portfolios.

**Lean evidence boundary:** [docs/LEAN_FORMALIZATION.md](../../docs/LEAN_FORMALIZATION.md) explicitly states the whole continuous Nash set and headline wedge are machine-certified; however standalone formal claims of planner uniqueness for `A<Delta` and global set exhaustion for `A>Delta` are **not** currently in Lean. Neither are full global CES concavity nor arbitrary matching/network results. Stage 1 did **not** run a fresh Lean build and did **not** certify any extension.

## 5. Official policy-source and institution-feasibility audit

The exact primary sources were inspected during Stage 1. These are verified **institutional/descriptive** inputs, not observations of inefficient duplication, estimated parameters, program causal effects or an equilibrium implementation proof.

| Source | Verified source content | Licensed interpretation | Unsupported jump / next check |
|---|---|---|---|
| [OECD 2025 Place-based industrial policy](https://www.oecd.org/en/publications/place-based-industrial-policy_43edc0df-en.html), June 27, 2025 | Emphasizes national priorities aligned with heterogeneous local capabilities and multilevel policy coordination | Local policy heterogeneity and joint national-regional sector choices motivate model | Does not identify a specific Nash wedge or direct transfer mechanism |
| [OECD 2026 Targeting places in national industrial strategies](https://www.oecd.org/en/publications/targeting-places-in-national-industrial-strategies_284fcc80-en.html), Oct 9, 2026 | Diagnostic framework: what a place can efficiently do, links to other regions/sectors, policy lever to use | Motivates H02/H07 and explicit role identification | A policy design framework is not data proving regional asymmetric opportunity costs/liquidity |
| [EU Regulation 2021/1058 Article 13](https://eur-lex.europa.eu/eli/reg/2021/1058/2025-09-20/eng) | ERDF-backed I3 instrument supports commercialisation/scale-up of interregional innovation and value chains, administered via Commission's direct/indirect management | Institutional basis for consortium/grant model H02 | **NOT** legal authority for arbitrary horizontal local-government side payments or compulsory regional role specialization |
| [EISMEA 2025–2027 I3 Work Programme, pp. 2, 5](https://interregional-innovation-investments.ec.europa.eu/media/96/download?node_id=56) | I3 serves multi-actor consortia (SMEs, public authorities, universities, intermediaries), chiefly SME beneficiaries; can distribute funding via coordinators or third parties; rate **up to 70% eligible project cost**, and **up to 100% for Financial Support to Third Parties** | Actual conditional grant/project co-financing; potentially portfolio of sub-projects; H02 viable institutional **analogue** | Not bilateral budget-balanced compensatory payment; funding eligibility and firm beneficiaries change actor/financing model; not universal 70% rate |
| [2026 I3 Strand 1 call](https://eismea.ec.europa.eu/funding-opportunities/calls-proposals/interregional-innovation-investments-strand-1-i3-2026-inv1_en) | Invests in shared/complementary Smart Specialisation priorities via cross-regional innovation consortia | Supports institutional motivation for coordinated complementary investment | Specific contracting clauses, voting/veto rights, and detailed evaluation rules **not verified** by the sources inspected |
| [EISMEA Partner Search launch, Mar 12, 2026](https://eismea.ec.europa.eu/news/launch-new-i3-instrument-partner-search-tool-build-stronger-interregional-innovation-consortia-2026-03-12_en) | Public tool to find cross-border consortium partners, filter by technology/region/Smart Specialisation etc. | Strong source for *partner identification and consortium formation as active margins* (H06) | Existence of matchmaking tool does **not** prove endogenous welfare gains or strategic stability |
| [I3 Observatory 2026](https://interregional-innovation-investments.ec.europa.eu/news/new-publication-i3-instrument-observatory-report-2026) | Reports activity, consortia, value-chain outcomes of program | Descriptive background | Self-reported/selected-project outcomes not causal identification, no estimate of baseline `A, Delta, alpha` |

**Important correction of possible modeling ambiguity:** I3 `co-financing up to 70%` means EU pays part of *eligible costs*; it is **not** a 70% region-to-region redistribution of modeled real `A`, nor a fixed-capacity share `x_i=0.7`. The institution's primary implementing actors include enterprises; public administrations are eligible partners, not the only two players. If the revised paper insists that its game literally describes I3, it must account for these distinctions instead of asserting equivalence.

**H03 legal/governance concern:** existence of a consortium is verified. **Voting/veto structure, binding cross-government priority-assignment agreement, and enforceability** remain unverified. Stage 2 must avoid presuming these as actual I3 provisions.

## 6. Hypothesis-by-hypothesis audit of primitive consistency

| ID | Relevance to original mechanism | Economic primitive that **must** be defined | Stage-1 status | Precise Stage-2 parent-class / absorption challenge |
|---|---|---|---|---|
| H01 bilateral transfer | Preserves 2 govs and original portfolios if instrument stage precedes choice | Payer/recipient, contingent payment, source of funds, real vs cash benefit, budget balance, voluntary participation, credible commitment, bargaining timeline | `PRIMITIVES UNSPECIFIED; INSTITUTIONAL ANALOGUE WEAK` | Existing interregional transfer/side-payment theorems; distinguish exogenous implementation from endogenous contract choice |
| H02 central grant | Retains composition choices but adds payer and fiscal resource/accounting constraints | Third actor/funding authority, transfer base (eligible costs vs observed outcomes), matching share, source/MCF of public funds, firm/consortium beneficiary and local government response, grant timing | `INSTITUTIONAL SUPPORT STRONG; MODEL NOT SOLVED` | Known conditional/matching grants and Pigouvian correction; fixed-capacity vs financing crowd-out |
| H03 collective rules | Can preserve original resource objective but changes who has control | Collective decision right, bindingness, aggregation/vote, veto/agenda, outside option, effect on individual government choice and payoff | `COOPERATION SUPPORTED; VETO/BINDING RULE NOT VERIFIED` | Mere planner restatement vs voluntary public-goods club, unanimity bargaining, agenda voting |
| H06 endogenous matching | Closely tied to value-chain complementarity; changes production/matching primitive | Partners as agents or strategic links, match/quality technology, feasibility and investment costs, search/matching sequence, agent objective | `PARTNER SEARCH OBSERVED; EQUILIBRIUM LINK UNPROVED` | Classical network formation/matching/assignment games; reparameterization of A is not novelty |
| H07 asymmetry + fiscal ceiling | Changes direct premium and grant/payment feasibility | Delta_i and ownership incidence, fixed capacity vs cash ceiling, which jurisdiction can pay, binding liquidity, who receives financing, participation and planner constrained set | `ROLE-ORDER IDENTITY VERIFIED; STRATEGIC RESULT UNVERIFIED` | Mechanical corner ranking, assignment with liquidity constraints, potential redundancy with H01/H02 |
| H04/H05/H08 | Not first-tranche hypotheses | Respectively private type, irreversible state/history, strategic private investment | `DEFERRED` | Reactivate only on precise evidence/pivot justification |

**Source-evidence ordering:** H02 and H06 are *closer to the verified I3 mechanisms* than H01 or H03's veto story. This is **not** a Stage-3 economic-model selection and says nothing by itself about formal novelty. H07 may be layered only if it yields a genuinely new strategic effect beyond financing an otherwise known transfer theorem.

## 7. Required correctness classification of inherited claims

| Claim | Classification | Reason |
|---|---|---|
| Baseline payoff/response/Nash threshold/wedge | `CORRECT` | Independently symbolic checked with certified historical game |
| Planner welfare and exactly defined fixed-capacity comparison | `CORRECT` | Bilinear interpolation and corner comparison valid; NOT unrestricted optimum |
| Baseline incidence from Cobb–Douglas derivative | `CORRECT BUT ECONOMICALLY AD HOC` for **host-jurisdiction ownership mapping** | Competitive factor shares are derivable but recipient jurisdiction must be assumed |
| Fixed unit policy capacity | `CORRECT BUT ECONOMICALLY AD HOC` as maintained economic abstraction | Not a universal observed government budget restriction |
| Product-share cross-region matching | `CORRECT BUT ECONOMICALLY AD HOC` as deliberately selected technology | Endogenous partner search changes it, so robustness is not universal |
| All planner regimes Lean-certified | `INCORRECT` if broadly claimed | Repository expressly excludes two standalone planner-set certificates; analytic result remains valid |
| `A-Delta` welfare gain as unconditional equilibrium loss | `INCORRECT` if stated outside wedge | At higher A multiple Nash profiles and differing welfare |
| Planner outcome implies implementable local-government policy | `INCORRECT` if inferred | No coordination institution, timing, contracting or financing in source game |
| OECD/I3 evidence proves inefficient priority duplication | `INCORRECT` if inferred | Institutional descriptions are not causal evidence |
| Candidate H01/H02/H03/H06/H07 generates new mechanism | `AMBIGUOUS / NOT TESTED` | Stage 1 cannot approve novelty or a new equilibrium |

These error classifications address **hypothetical overclaims**, not assertions the original manuscript necessarily made. The original source already warned against first-best, general matching and centralization overclaims.

## 8. Surviving precise questions and staged contract

**Stage-1 residual research question:** Given a certified fixed-capacity complementarity wedge and real-world use of conditional investment grants/consortium formation, which feasible **contracting, central financing, collective governance or endogenous partner formation** game can alter regional portfolio choices in a non-obvious way, and which results—if any—are not direct instances of known fiscal-federalism or network-formation theory?

**Stage-2 novelty work must:**

1. For H01, compare exactly formalized contract timing, budget balance, IR and endogenous offer/accept with known interregional transfer and side-payment games. Kill any claim that mere cancellation or simple `t` bounds are original.
2. For H02, read baseline matching-grant/fiscal-federalism theorems and identify whether fixed policy composition yields a *new* crowd-out/role-switching condition, rather than a standard co-financing subsidy.
3. For H03, distinguish **endogenous governance choice** from the omniscient planner and examine whether the presumed contract/veto mechanism is institutionally supported.
4. For H06, read partner matching/network formation results and test whether introducing actual project links changes the payoff/game class or merely the scalar `A`.
5. For H07, map heterogeneous assignment and liquidity ceilings to existing assignment/transfer theorems. **Use the diagnostic identity `W10-W01=Delta1-Delta2` as a warning, not a publication claim.**
6. Carry forward H04/H05/H08 as deferred, not killed. If all first-tranche options are absorbed, no feature-accumulation rescue: stop, narrow as a diagnostic paper, or return to Stage 0.
7. For policy facts, use official I3 work-programme co-financing and beneficiary identities; do not model a 2-government bilateral transfer as the actual I3 grant. Verify primary participation/agreement/veto text before claiming governance rules.
8. Perform literature-level **source/model/theorem** comparisons, not novelty based on keyword searches or different application labels.

**Stage 1 verdict: `GO TO NOVELTY GATE`.** This licenses only a source-grounded canonical starting point and literature frontier investigation. It does **not** validate external reality of the original theorem, a particular revision direction, a model change, or a new journal target.

## 9. Provenance / completed work

- **Python/SymPy:** independent baseline reconstruction and exact identities executed, PASS. The archival standalone equivalent is [verify_stage1_baseline.py](verify_stage1_baseline.py); source reproducibility on GitHub does not imply the new file was executed in GitHub Actions.
- **EU law/official sources:** Article 13 of Regulation 2021/1058, I3 2025–2027 Work Programme, EISMEA 2026 call and Partner Search, plus OECD 2025/2026 sources inspected, with scope limitations recorded.
- **Formal/CI:** no fresh Lean kernel build or CI claim; existing certified proof boundaries inherited as documented.
- **Novelty:** no new-model novelty conclusion. Existing baseline novelty characterization inherited as historical record only.
- **AI provenance:** AI-assisted GitHub/source reading, symbolic reconstruction, institutional search and reporting; independent original author verification of new architecture/instrument remains **PENDING**.
- **No source edits:** previous theory freeze, manuscript TeX, submission bundle, existing formal verification and original model functions unchanged.
