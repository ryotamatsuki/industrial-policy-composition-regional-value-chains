# Post-JRS substantive revision — Stage 3: Candidate Mechanism Search

**Date:** 2026-10-10 JST  
**Stage-3 verdict:** `GO TO MINIMAL MODEL` — **one bounded attempt** with architecture A1; no originality/theorem/whole-Nash certification.  
**Workflow:** `ryotamatsuki/research-paper-workflow main@0642846709f006bab9e387c80bd83cdf4db52460` (v2.9 candidate, not tagged).  
**Prior gates:** [Stage 0 intake](STAGE0_IDEA_INTAKE.md), [Stage 1 audit](STAGE1_SOURCE_MATH_AUDIT.md), [Stage 2 novelty kill gate](STAGE2_NOVELTY_KILL_GATE.md).  
**Candidate matrix:** [Stage 3 register](STAGE3_CANDIDATE_REGISTER.md).  
**Exact-rational exploratory diagnostic:** [Stage 3 screening script](verify_stage3_screening.py).  
**Historical reference frozen:** `IPCRVC-THEORY-FREEZE-2026-09-07-v1`; no TeX, Lean or JRS submission modification.

## 1. Executive result and high-priority new literature overlap

**Research result:** from nine bounded variants of Stage-2 survivors, select **A1 (three governments, fixed portfolio capacities, two mutually exclusive private consortium projects, targeted project co-financing)** for exactly one Stage-4 attempt; downgrade the H03 governance-alone path to a nonnovel negative-control benchmark.

**Critical new source findings (not previously accounted for by the Stage-2 initial shortlist):**

- **Poirier (2024), [Industrial Policy in Endogenous Production Networks](https://ssrn.com/abstract=5052853)** already models *industrial policy and endogenous supplier-link choice*, derives optimal intervention and welfare effects. This is an **intensified novelty threat** to H02×H06. SSRN description/abstract reviewed; full paper proof comparison **PENDING**, therefore no positive whole-game novelty finding.
- **Hsieh, König & Liu (2025), [Endogenous Technology Spillovers in R&D Collaboration Networks](https://doi.org/10.1111/1756-2171.70010)** explicitly jointly endogenizes *firms' effort* and *R&D links*, gives equilibrium characterization and compares **targeted vs uniform project-link subsidies**. Full publisher HTML and result descriptions inspected, including network formation and policy section. Targeted link subsidies are **not a new research mechanism**.
- **Song & Vannetelbosch (2007), [International R&D Collaboration Networks](https://doi.org/10.1111/j.1467-9957.2007.01044.x)** already jointly studies multi-country firms' network formation, governments' R&D subsidies, subsequent investment, stability and welfare. Publication abstract and accessible manuscript extracts describe a four-stage game; complete theorem/appendix comparison **PENDING**.
- **David & Keely (2003), [Endogenous Formation of Scientific Research Coalitions](https://doi.org/10.1080/10438590303121)** directly models *research consortia applying for supra-regional network funding while also receiving regional-agency funding*. Publisher/abstract records reviewed; full original model **PENDING**.
- **Weese (2015), [Political Mergers as Coalition Formation](https://doi.org/10.3982/QE442)** combines endogenous local coalitions, national transfer incentives and asymmetric information in a formal empirically estimated setting. A strong objection to H03.

**Decision:** merely combining `industrial policy + collaboration links + central subsidies` has **no defensible novelty claim**. The narrow surviving *test* is endogenous **fixed-capacity intergovernmental sector composition** interacting with **mutually exclusive cross-jurisdictional project matching** and explicit financing/benefit incidence. If it fails to generate an independent theorem relative to those parents, terminate A1.

## 2. Scope of the actual Stage-3 search

Stage-2 authorized two paths (H02×H06 and conditional H03). Stage 3 created **nine** distinct/near-distinct controlled architecture variants, then killed/merged duplicates using actor-control-timing-feasibility-feedback criteria: see [candidate register](STAGE3_CANDIDATE_REGISTER.md). We did **not** generate an arbitrary 100-idea bank or widen to H04/H05/H08 to rescue lost novelty.

- TOP 1 / preferred for Stage-4 test: `A1` three-region, one-project investor matching/portfolio interaction.
- TOP 2 (negative nested benchmark): `A2` no project exclusivity. Not a standalone article.
- TOP 3 (separate governance control): `B1` unanimous nontransfer role assignment, **killed as main** after explicit individual-rationality check. Not an authorized second Stage-4 model.

No numerical attractiveness scores; evidence-based stage dispositions avoid unsupported precision.

## 3. Exact minimal *candidate* game A1 — exploratory, not the revised paper yet

**Players:** three regional public authorities `i=1,2,3`, one profit-maximizing private consortium/project developer, and a national grant authority. Developer profits accrue to a resident sector counted in national welfare but not automatically in any regional government's objective. Funding authority's own objective, grant choice and political economy remain *to be solved* at Stage 4.

**Timing:**

0. Grant authority **commits publicly** to an eligible-cost/project-output schedule `s=(s12,s13) >= 0` subject to an ex ante envelope `s12+s13<=B` (conservative bound, because at most one project is financed and each match mass ≤1). Taxes supporting awards have fixed regional shares `omega_i>=0`, `sum_i omega_i=1`.
1. Each of **three regional governments simultaneously** chooses `x_i ∈ [0,1]`, its fraction of a **separate normalized fixed policy capacity** allocated to upstream U; downstream D gets `1-x_i`. Direct regional real return `b_D + Delta_i x_i`, `Delta_i>0`; these are neither grant money nor taxes.
2. The private developer selects **at most one** directed cross-region project `e∈{(1,2),(1,3)}`, or `∅`, from viable proposals, maximizing **its own** net profit (rather than national welfare). Project eligibility is tied to realized complementary matching `m_e=x_1(1-x_j)`. If profit is nonpositive, no project. Ties between positive-profit projects go to (1,2) by a stated deterministic rule; all ties and discontinuities require later scrutiny.
3. Output/income and grant disbursement occur; regional taxpayers finance the grant. No automatic ex ante side payments between governments and no assumed central power to order portfolios.

**Project primitives:** for `e=(1,j)`, `A_e>0` is gross real matched output per unit, `K_e>=0` is a real project-development cost, `gamma∈(0,1)` is the project developer's share of gross output, and `alpha∈(0,1)` splits the remaining local factor-income return U versus D. In the toy, `alpha=1/2`. The gross matched output is `A_e m_e`, and developer payoff is:

```text
pi_e(x;s) = (gamma * A_e + s_e) * m_e - K_e.
e*(x;s) ∈ argmax {0, pi_12(x;s), pi_13(x;s)}.
```

Grant paid is `s_e m_e`, received only if the selected project actually operates. Regional taxes `tau_i = omega_i*s_e*m_e`; total regional taxes exactly equal developer grant receipts.

**Local-government payoff** for selected `e=(1,j)`, omitting constant `b_D`, with `k∈{1,2,3}`:

```text
u_k = Delta_k * x_k
    + (1-gamma) * A_e * m_e *
      [ alpha*1{k=1} + (1-alpha)*1{k=j} ]
    - omega_k*s_e*m_e.
```

No project: `u_k=Delta_k*x_k`. The private developer's profit is included in national, but not local-government objective. **National real welfare:**

```text
SW = sum_i u_i + max{0, pi_12, pi_13}
   = sum_i Delta_i*x_i + A_e*m_e - K_e
```

when a project `e` operates (plus `3b_D` if restoring the constant). Grant cash `+s_e*m_e` and taxes `-s_e*m_e` cancel. This is a constrained net-resource benchmark, not unrestricted first best. **Central financing efficiency cost** is set to zero in the screening game; any distortionary-tax/administration cost must be explicitly added rather than implied.

**Genuine new primitives vs original freeze:** N=3, investor with objective `pi_e`, project capacity **at most one**, endogenous directed project selection, conditional grants, costs `K_e`, tax incidence `omega_i`, local output incidence `1-gamma`, asymmetric project quality `A_e`, information/commitment order. **This is substantive theory change and invalidates straightforward inheritance of original two-region Nash/Lean proof.** The original frozen result survives only as historical benchmark; Stage 4 must explicitly construct proper nesting, not claim A1 literally is the same game.

**Prohibited interpretation:** this is an **analytically motivated hypothetical institutional analogue**, **not** an assertion that an EU I3 consortium is a single profit-maximizing project broker with one project capacity. Developer participation, actual enterprise/partner consent, grant eligibility/retention requirements, government authority and project quotas must be assessed. This model risks losing institutional fidelity despite apparent algebraic tractability.

## 4. Feedback diagram and why this is not merely A_eff

```text
National s_e and financing weights omega_i
                 |
                 v
  Regional portfolios (x1,x2,x3)  <-------+
                 |                        |
                 v                        |
  Complementary project masses m_12,m_13  |
                 |                        |
                 v                        |
  Private developer chooses e* or none    |
                 |                        |
                 v                        |
  Link-specific local production income --+
  and regional tax burden
```

A1's core **discrete switch** is between *different downstream regional partners*, not a single common scalar `A`. Exogenously fixing one project yields a different local strategic slope/network; freezing portfolios lets grants redirect investment but **eliminates endogenous governmental role switching**. Allowing both projects eliminates exclusion/crowd-out through single-project capacity. Thus a potentially nontrivial **jointly endogenous** problem remains to be solved, even though each component separately is familiar.

**Very important adverse interpretation:** even this switching might be just an ordinary procurement/subsidy-diversion result. Do not call a project-switch witness an economically novel theorem. The **genuine next target** is a necessary/sufficient *portfolio–project incentive-compatibility/implementability* region, including possible inability of a grant schedule to implement the welfare-best project assignment once regions' downstream participation is endogenous.

## 5. Nested benchmark matrix (Stage-4 mandatory)

| Benchmark | Restriction | What it can already show | What A1 must show beyond it |
|---|---|---|---|
| N0 fixed partner | Fix `e=e_bar` conditional on real availability | Regional x best responses with known project and grants | Link/partner switching interacting with portfolios |
| N1 fixed portfolio | Fix `x_i=xbar_i`, investor chooses e with grants | Standard grant-driven winning-project diversion | Endogenous reallocation of government U/D roles |
| N2 no cofinancing | `s_e=0`, keep x and e endogenous | Private link selection and strategic portfolio choices | Grant–portfolio–partner feedback and implementation failure |
| N3 no exclusivity | Each eligible profitable link can operate independently; account for project cost/fiscal financing per link | Parallel project activation and local incentives | Partner displacement caused by binding project capacity |
| N4 historical baseline | Remove third region/developer/grants, restore direct original U–D matching and local income shares; need explicit parameter map | Original 2-region priority duplication wedge | Real implementation and new partner effects, not just same wedge |

**Nuance:** N4 is a model-family reference, **not** obtained merely by substituting `s=0` or `K=0` in A1, because the private intermediary and project-selection market must also disappear and matching must be restored.

## 6. Exact rational reduced-form screening: two profile-specific Nash witnesses

File: [verify_stage3_screening.py](verify_stage3_screening.py). It was exercised in an equivalent local SymPy run. **For every government at each witness profile**, the auditor solves all unilateral project-profit indifference/activation breakpoints on `x_i∈[0,1]`, examines the actual payoff at breakpoints and the affine one-sided limits on intervals, then compares the full feasible-domain payoff with the incumbent action. This is stronger than checking only binary deviations, but it does **not** characterize the full continuous Nash correspondence or validate the grant stage's optimality.

Parameters:

```text
Delta = (1, 1/5, 1/5)
A12=3, A13=5/2; K12=K13=1/10
alpha=1/2; gamma=1/5; omega_i=1/3
s_e>=0; private developer chooses ONE profit-positive project.
```

| Grant schedule | Independently verified Nash profile in full [0,1]^3 | Operating project | National net real surplus (bD=0) |
|---|---|---|---|
| `s=(0,0)` | `(x1,x2,x3)=(1,0,1)` | `U1–D2` | `41/10 = 4.1` |
| `s=(0,1/5)` | `(x1,x2,x3)=(1,1,0)` | `U1–D3` | `18/5 = 3.6` |

**Consequence:** in this exact-rational screening example, a targeted grant changes both the project and the two nonhub regions' sectoral policy roles, and total real surplus at the exhibited equilibria falls by `1/2`. The decline is **not** a grant-counted-as-surplus accounting artifact: private project profits, local factor incomes, regional grant taxes and project resource cost all enter the welfare identity.

**Do NOT claim:** both cases have unique Nash equilibria; subsidies always reduce welfare; this proves there is a non-monotonic grant theorem; the developer's chosen partner is a real I3 process; or this result is new relative to Hsieh et al., Song–Vannetelbosch or classic subsidized matching games. All are open.

**Adversarial observation:** project switching to a worse match under a subsidy is fundamentally familiar; if Stage 4 can prove no deeper *implementation failure arising from policy-composition feedback*, this A1 path should be terminated as insufficient for a new field-journal full paper.

## 7. H03 governance negative control

With original two symmetric regions in the duplication wedge `Delta<A<Delta/(1-alpha)`, each has duplicated noncooperative payoff `b_D+Delta`. In a proposed `(U,D)` allocation without compensation or a new incidence rule, the region assigned D obtains `b_D+(1-alpha)A < b_D+Delta`. It vetoes a voluntarily imposed agreement, even though total gains `A-Delta>0`.

Thus replacing the planner by a unanimity committee without solving incentive compatibility is a **non-solution**. Adding share payments merely revives the Stage-2-killed generic H01 transfer mechanism. **B1/B2 are killed as independent research programs at Stage 3**, retained only as familiar benchmark logic. No actual EU governance veto rule is asserted.

## 8. Early editorial-value test and hostile reviewer objection

**Potential editor-facing value (unproved):** fixed-capacity industrial policy may face a *dual* coordination problem: which sector each jurisdiction prioritizes, and which partner projects are eligible and viable given those priorities. Funding a network does not automatically implement the socially best specialization; conditional grants may redirect both private project matching and local government's sectoral choices. This directly engages the JRS objection *only if the paper derives meaningful feasible policy guidance*, such as actual implementability regions/impossibility under financial and project-capacity constraints, **not** simply another welfare wedge.

**Strongest editor rejection at this stage:** Poirier (2024) already studies industrial subsidies in endogenous production networks; Hsieh, König & Liu (2025) jointly endogenize efforts and collaboration links and compare targeted link subsidies; Song & Vannetelbosch (2007) explicitly joins country subsidy choice and cross-border R&D link formation. A1 may amount to an idiosyncratically restricted three-region procurement model with a tautological grant-to-worse-project effect, while changing the original two-region model so substantially that the old main theorem no longer explains the new game. The choice of a single profit-maximizing project broker and exclusive-capacity limit also require credible justification. Until a new substantive theorem survives these threats, **publication-level novelty is not established**.

## 9. Stage-3 verdict and precise next contract

**`GO TO MINIMAL MODEL` — only one bounded model attempt using A1.** Justification: unlike the discarded mechanisms, A1 has fully specified minimal candidate payoffs, actual off-equilibrium strategic feedback, a reproducible exact-rational witness in continuous policy strategy space, explicit national fiscal accounting, and a falsifiable implementation question requiring the simultaneous endogeneity of regional portfolio and project choice. The witness does **not** itself establish scientific originality.

**Stage 4 MUST complete:**
1. Full sequential solution: private developer's project-selection correspondence, all governments' best responses over `[0,1]^3` including at project-switch surfaces/zero profits, equilibrium existence, multiplicity and full-Nash status; treatment of any discontinuity/selection rule.
2. Welfare: joint constrained planner over `x,e` and net real cost `K_e`; compare a **grant authority's implementable equilibrium objective** including regional tax incidence, appropriation `B`, and the investor's outside option. Do not identify the constrained planner as a Nash outcome.
3. Nested-game proofs N0–N3. Identify **one** theorem not available in any nested benchmark—preferably grant feasibility/compatibility, a new implementability failure or a nontrivial sign reversal from endogenous *public* priority composition.
4. A concrete institutional fidelity audit: who actually owns factor income and the developer residual; contract/firm participation; whether grants can be conditioned on realized output/project partner choice; whether exactly one project may form.
5. Whole-game/theorem red-team against **Poirier (2024), Hsieh et al. (2025), Song & Vannetelbosch (2007), David & Keely (2003), Armbruster & Hintermann (2020)**. Acquire full texts/author manuscripts where feasible. Re-search 2026 working-paper frontier.
6. Kill criterion: if the only result is ordinary grant diversion, the scalar effective-A change or added fiscal cutoffs, terminate/reframe; **do not add H04/H05/H08 to manufacture a positive result**.
7. Re-run Stage 4A mathematical/adversarial verification before any new proof is certified; later Stage 6 novelty re-kill and the new Stage-7.5 economic-contribution-completeness gate are mandatory. No author signoff or next journal selected yet.

**Original project preservation:** Stage 0–2 and this Stage-3 revision documentation reside in separate revision-lane paths. Original `THEORY_FREEZE.md`, manuscript `paper/`, `model/baseline.py`, Lean files and submission archives remain unchanged.
