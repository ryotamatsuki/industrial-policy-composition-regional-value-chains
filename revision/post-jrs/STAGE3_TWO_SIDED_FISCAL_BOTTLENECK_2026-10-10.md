# Stage 3 — Two-sided fiscal bottleneck and voluntary veto in regional industrial-policy specialization
Date: 2026-10-10. Pure THEORY only. Research status: CONDITIONAL GO TO ONE BOUNDED STAGE-4 HOSTILE AUDIT. Neither journal paper, novelty, full published-parent extension, nor Stage-4A proof certification has been approved. Old JRS theory freeze, manuscript, Lean and earlier negative A1/H01 results remain unchanged.

**2026-10-10 Stage-4 corrigendum:** The preceding Stage-3 description of the high-gamma veto's sensitivity to skewed regional tax shares was overly strong and is corrected under N4 below. The regional-coalition budget invariant and explicit counterexamples appear in `STAGE4_HOSTILE_THEORY_AUDIT_2026-10-10.md`. The U-shaped arithmetic itself remains valid only for the defined finite game and tax/contract class.

## 1. Closest theoretical parents — actual evidence and limits
Suga, Tawada & Yanase (2025), Hokkaido University Discussion Paper 382: the restricted production possibilities frontier is Q2=Gamma(Q1,R), with Gamma_1<0, Gamma_11<0, Gamma_1R>0. Equation (1): the policy-unrestricted upper envelope Lambda(Q1)=max_R Gamma(Q1,R) has curvature Lambda''=Gamma_11-(Gamma_1R)^2/Gamma_RR. Proposition 1 proves that sufficiently strong positive Lambda'' near the symmetric autarky optimal policy rules out symmetric Nash; the condition is equivalent to Chatterjee (2017). Full source: https://eprints.lib.hokudai.ac.jp/dspace/bitstream/2115/95136/1/DPA382.pdf (physical pages 4, 8–10). This 2025 paper is not the same as the published 2026 Suga–Yanase–Tawada paper; do not conflate the equations. Publisher abstract of Suga et al. (2026) confirms an upstream IO entry-regulation model as an application but its full published theorem is not yet inspected: https://doi.org/10.1111/sjoe.70007 .
Chatterjee (2017) already analyzes fixed education budget allocated across sectors, policies, comparative advantage and symmetry-breaking: https://doi.org/10.1016/j.jinteco.2017.08.009 .
Gregor–Šťastná (2012) already models regional complementary public inputs, local contributions, centralization and cost-sharing: https://doi.org/10.1007/s10058-012-0113-y .
Poirier (2024) already studies endogenous input-supplier links and optimal targeted industrial policy: https://ssrn.com/abstract=5052853 .
Additional source-based direct threats: Rodrik (1996) specialized input entry and government coordination subsidies https://doi.org/10.1016/0022-1996(95)01386-5 ; Volden (2007) national grant rules, subnational participation and spending choices https://doi.org/10.1093/publius/pjl022 ; Melkonyan, Banks & Wendel (2017) complementary firms' entry and two-part industry subsidy https://doi.org/10.1007/s10842-016-0242-z . Original theorem-level absorption unresolved.

## 2. New MINIMAL standalone toy model (NOT faithful parent-equation extension)
Regions 1 and 2 choose binary policy portfolio x_i in {1=upstream U, 0=downstream D}, exhausting a fixed and nontransferable unit of regional policy capacity. Any U choice earns direct real regional surplus Delta>0. If one U and one D, a private developer may produce interregional complementary surplus A>0 by paying fixed real setup cost K in (0,A). The developer receives fraction gamma in [0,1] of gross A (a reduced-form private appropriation/license share), with remaining (1-gamma)A accruing as real local factor/knowledge rents to U and D regions with shares alpha and 1-alpha, respectively. No productive match with U/U or D/D.

Central authority commits ex ante to conditional transfers (s,t), s>=0 paid to entering developer and t>=0 to D government, only when BOTH regions have differentiated verifiable policy roles AND developer invests. Gross appropriation B=s+t is financed ex post by taxes B/2 levied on each regional government on project completion. No fiscal flows on non-project histories. No distortionary tax effects; transfers cancel from national real welfare. Contract budget cap Bbar. The center does not assign either region to U or D. In a secondary voluntary phase, both regional governments may opt out and receive the old no-program U/U equilibrium.

Timing: central posts rule; regional governments choose x_i simultaneously; developer enters iff a cross-regional U-D match exists and gamma*A+s>=K, ties enter; payoffs realized. Investor outside option 0 in all histories.

Conditional match stage payoffs:
v_U = Delta + alpha*(1-gamma)*A - (s+t)/2.
v_D = (1-alpha)*(1-gamma)*A + t - (s+t)/2.
pi_firm = gamma*A + s - K.
Total real surplus v_U+v_D+pi_firm = Delta+A-K.
No match U/U payoff (Delta,Delta), aggregate 2Delta; no match D/D payoff (0,0), aggregate 0. The constrained social planner prefers differentiated roles iff A-K>Delta.

## 3. Exact incentive and participation derivation
Define h=(1-alpha)*(1-gamma)*A and entry-subsidy minimum e=max(0,K-gamma*A).
For STRICT downstream acceptance relative to U/U, v_D>Delta iff
t > s+2Delta-2h.
For developer entry, s>=e (with tie-to-entry).
For upstream government's STRICT voluntary participation relative to U/U, v_U>Delta iff
s+t < 2alpha*(1-gamma)*A.
These conditions also suffice for two mirror asymmetric profiles (U,D),(D,U) to be the ONLY pure-strategy regional Nash profiles: U's deviation to D yields D/D and zero, below v_U>Delta>0; D's deviation to U yields U/U and Delta, below v_D. U/U cannot be NE due to strictly profitable deviation to D; D/D cannot be NE due to strictly profitable deviation to U. Finite investor continuation is defined on every history.

The lower INFIMUM on gross government outlays for entry plus the downstream incentive is
B_inf(gamma)=e+max(0,e+2Delta-2(1-alpha)*(1-gamma)*A).
Because D's inequality is strict, infima on the binding downstream branch are NOT attained: actual s,t require epsilon slack. For that branch, a strictly voluntary contract can be implemented with appropriations cap Bbar iff
Bbar > B_inf(gamma) AND B_inf(gamma)<2alpha*(1-gamma)*A,
assuming role verification/central commitment and entry tie-rule. Increasing Bbar cannot fix the second condition because upstream government pays half the conditional subsidy budget.

## 4. Fully solved exact-rational parameter slice and DOUBLE THRESHOLD
Let Delta=1, A=4, K=11/5, alpha=1/2, gamma in [0,1).
Social constrained welfare U/D =14/5 versus U/U=2, gain 4/5>0, independent of gamma by construction.
Without any central grant: UNIQUE policy Nash U/U for every gamma. If gamma<11/20 private link does not enter even after one government deviates to D; if gamma>=11/20 the developer can enter, but D local return h=2(1-gamma)<=9/10 <Delta so no downstream deviation is profitable.

Private entry minimum e=max(0,11/5-4gamma). The D-region grant INFIMUM is t_inf=1/5 for gamma in [0,11/20], and t_inf=4gamma-2 for gamma in [11/20,1).
Therefore:
B_inf=12/5-4gamma for gamma in [0,11/20];
B_inf=4gamma-2 for gamma in [11/20,1).
This gross funding requirement decreases then increases, with its sole minimum B_inf=1/5 at gamma=11/20. Derivatives: -4 then +4. This is a U-shaped **cash appropriation requirement, NOT real deadweight fiscal cost**; the welfare gain 4/5 is unchanged across gamma.

Voluntary upstream IR requires B<4(1-gamma). Under the efficient-planner condition A-K>Delta, this is feasible near B_inf exactly for 0<=gamma<3/4. At gamma>=3/4 STRICT upstream opt-in is impossible for ANY nonnegative conditional firm/downstream subsidies financed 50/50, despite the constrained aggregate social gain 4/5. The mechanism may still produce differentiated Nash under mandatory central precommitment but cannot be called voluntary. At gamma=3/4 upstream is at best indifferent at a NONATTAINABLE downstream-strict threshold.

Table of budget INFIMA:
gamma=0: e=11/5, t_inf=1/5, B_inf=12/5, voluntary yes.
gamma=1/2: e=1/5, t_inf=1/5, B_inf=2/5, voluntary yes.
gamma=11/20: e=0, t_inf=1/5, B_inf=1/5, voluntary yes.
gamma=7/10: e=0, t_inf=4/5, B_inf=4/5, voluntary yes.
gamma=3/4: e=0, t_inf=1, B_inf=1, voluntary NO.
gamma=9/10: e=0, t_inf=8/5, B_inf=8/5, voluntary NO.
Check accompanying exact-Fraction Python test, with epsilon=1/10000, all four binary profiles, every unilateral deviation, welfare identities and opt-in classifications.

## 5. Hostile controls / explicit NONNOVELTY warning
N0 no grants: duplication unique on exact slice.
N1 governments' portfolios frozen: only private firm entry incentive survives; minimum s declines with gamma, U shape absent.
N2 private firm automatically enters: only regional D-role compensation survives; its minimum rises with gamma, U shape absent.
N3 full two-sided choice and limited finance: U shape and voluntary-veto cutoff occur.
N4 CORRECTION (Stage 4): Skewing the LOCAL tax burden or making LOCAL-only upstream rebates CANNOT overturn the high-gamma coalition veto, because the sum of local payoffs is invariant to domestic redistribution and equals Delta+(1-gamma)*A-s. Reclaiming developer profit/royalties or introducing GENUINELY external funds can overturn it, by changing local total resources. Changing local tax shares can, however, change feasibility at low gamma. See STAGE4_HOSTILE_THEORY_AUDIT_2026-10-10.md.
N5 original continuous x_i in [0,1]: NOT analyzed; finite binary game is a nontrivial structural departure.
N6 actual trade prices, wages, GE firm entry/location/supplier choice: NOT analyzed.
N7 binding voluntary sign-and-role-selection equilibrium: no unique role assignment theorem established.

The U shape is an elementary piecewise-linear composition of two standard incentive constraints. Its existence under two stages is not a novelty proof. Rodrik (1996), Volden (2007), Melkonyan et al. (2017), Gregor (2012), and work on government contracting/industry entry must be attacked at original model/theorem level. Absence of exact prior title is not evidence of novelty. This result is PROVED only inside this stylized binary toy, not a Suga/Poirier extension and not a journal-worthy discovery yet.

## 6. Gate decision
Stage 3: CONDITIONAL GO TO A SINGLE BOUNDED STAGE-4 hostile theory-origin and policy-competence test; no new manuscript, Theory Freeze, Stage-4A, Lean claim or journal selection. First compare exact primary parent theorems. Require ONE additional nonmechanical general result that survives a plausible continuous-portfolio extension AND a justified industrial-contract microfoundation. If the apparent U-shape/veto theorem is ordinary double-threshold subsidy arithmetic, issue NO-GO and preserve negative results rather than adding another arbitrary layer.
