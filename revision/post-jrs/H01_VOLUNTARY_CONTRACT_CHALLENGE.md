# H01 pilot — Voluntary interregional contingent compensation and contracting-rights comparison

> **FRONTIER-RESEARCH CORRECTION (2026-10-10, after this pilot):** [H01_FRONTIER_AUDIT_2026-10-10.md](H01_FRONTIER_AUDIT_2026-10-10.md) supersedes the **unqualified** continuous-action G3 “no pure SPNE” claim below. Jackson–Wilkie's original appendix warns that unrestricted/discontinuous transfer functions in continuous games can yield **off-path subgames without equilibria**; an appropriate restricted admissible transfer-function domain and its continuation existence must be established first. The **finite binary-portfolio game** remains a legitimate two-player Theorem-2 illustration; the original full continuous arbitrary-offer G3 is now **UNRESOLVED**, not fully certified. New prior-art threats: Hindriks–Myles (2003), Gregor–Šťastná (2012), Gregor (2015), Geffner et al. (2025), Heitzig (2025), Kavner (IJCAI 2026), Liu et al. (EC 2026). **The narrow G1/G2 signed finite-menu mathematics is not retracted**, only its novelty and overbroad G3 generality. Preserve this original pilot for provenance, but use the later frontier audit for current claims.


**Date:** 2026-10-10 JST  
**Research context:** `Industrial Policy Composition and Regional Value Chains`, post-JRS desk-rejection revision lane. This is a **fresh, user-authorized bounded test** of the previously Stage-2-demoted H01 proposal, *not* a waiver of its prior-art kill, a manuscript edit, or an automatic progression from the separate F01 diagnostic short-paper Stage-0 reframe.  
**Status/verdict:** `MATHEMATICAL PILOT PASS; STANDALONE NOVELTY NO-GO; POLICY IMPLEMENTATION COMPANION CANDIDATE`. Results include an exact strict-IR transfer interval, a complete one-proposer finite-menu SPNE *example*, and a **known-parent-theorem corollary** ruling out pure contracting equilibria under an **unrestricted** two-sided offer protocol. These two protocols **are intentionally different games**. Full paper novelty, real government law, journal value and adoption into manuscript **not certified**.  
**Source/evidence:** [Original frozen theory](../../THEORY_FREEZE.md), [Stage-2 audit](STAGE2_NOVELTY_KILL_GATE.md), [2005 REStud paper and 2013 official correction](#references-and-proof-scope), [SymPy/finite-menu tests](verify_h01_voluntary_contract.py). No changes to old model, Lean or JRS submission.

## 1. Novelty problem and deliberately different contracting protocols

The JRS editor's concrete objection was that the old paper found an uninternalized externality but did not explain **what could or should internalize it**. Our test separates:

- **Implementation with a given credible contract** (`G1`): can a bilateral regionally balanced contingent payment create a **unique coordinated policy equilibrium**? YES within the original strict duplication wedge, if enforcement, monitoring, the transfer budget and a selected upstream proposer are provided.
- **Voluntary agreement formation with constrained, sequential bargaining** (`G2`): can an appointed proposer offer a contract, a recipient approve, and both then rationally choose portfolios? YES, with an explicit **finite permitted offer menu** and strict participation conditions. A continuum menu with strict acceptance needs separate boundary/tie resolution; do not assert an unqualified pure SPNE.
- **Endogenous unrestricted simultaneous side contracting** (`G3`): can both regions independently make arbitrary nonnegative **strategy-contingent** payment commitments with no ex ante mutual-signature/exclusivity rule? In the original wedge, **NO pure-transfer-offer / pure-outcome SPNE can be supportable** by a *direct specialization of Jackson–Wilkie (2005) Theorem 2*. This is **not our new contract theory**; nor does it prove absence of mixed-offer equilibria.

The contrast is economically relevant to institutional design but not itself a novel generic game-theoretic theorem. It does not authorize claiming the specific G2 signing process is used by EU I3, Japanese intergovernmental agreements, or any real jurisdiction.

## 2. Original baseline kept exactly fixed

Let `x_i∈[0,1]` and `j≠i`, `b=b_D`, `Delta>0`, `A>0`, `alpha∈(0,1)`:

```text
W_i(x_i,x_j) = b + Delta*x_i
             + alpha*A*x_i*(1-x_j)
             + (1-alpha)*A*(1-x_i)*x_j.
```

Strict inefficiency/duplication wedge `Delta<A<Delta/(1-alpha)`. Define `L := Delta-(1-alpha)*A>0`, `U := alpha*A>0`. Note `U-L=A-Delta>0`. At zero transfers `(1,1)` is unique Nash, each region's payoff is `b+Delta`; planner max is `(1,0)` or `(0,1)`, total real welfare `2b+Delta+A`. Transferability is assumed **without deadweight tax, contracting or monitoring cost**, not derived. Unit capacity `x_i` is *not* a fiscal cash account; a real government must supply an additional source of liquidity `B_i`.

## 3. G1: exact contingent transfer and global continuous best responses

Suppose a role-specific, binding contract transfers `T(x)=t*x_1*(1-x_2)` from region 1 to region 2, with `t≥0`; the match mass is publicly observable/contractible **by assumption**. Local payoffs `V_1=W_1-T`, `V_2=W_2+T` are still functions on full `[0,1]^2`, no mandatory role assignment. The public transfer is a redistribution, so `V_1+V_2=W_1+W_2`. It requires resources/liquidity and enforceability; no expenditure-side deadweight cost is assumed.

Global slopes (all own payoffs affine in own action at every rival choice):

```text
dV1/dx1 = Delta+alpha*A-A*x2-t*(1-x2);
dV2/dx2 = Delta+alpha*A-A*x1-t*x1.
```

For `0≤t≤U=alpha*A`, the first slope is strictly positive at both x2 endpoints: `Delta+alpha*A-t≥Delta>0`, and `L>0`, so x1=1 is strictly dominant. Given x1=1 the second derivative of V2 with respect to its action reduces to the global payoff slope `L-t`.

Thus **unique policy Nash** `(1,1)` for `t<L`, **all** `(1,x2)` at `t=L`, and **unique policy Nash** `(1,0)` for `L<t≤U`.

At differentiated outcome `(1,0)`, vs no-contract unique status quo `(1,1)`:

```text
region 1 gain: alpha*A-t = U-t;
region 2 gain: (1-alpha)*A+t-Delta = t-L;
sum of gains: A-Delta.
```

Consequently, **strict Pareto improvement with unique decentralized specialization** is feasible exactly if `L<t<U`. Endpoint t=U leaves region 1 indifferent in **participation payoff** (but x1=1 remains its strict action preference). Endpoint t=L leaves region 2 indifferent among **all policy x2** and cannot guarantee specialization. This is a *new equation for this specific model*, but a direct payoff-transfer surplus-splitting application of existing contracting theory, not an independent general theorem.

**Unconditional lump-sum t does not alter derivatives and cannot implement the switch**; conditionality must be contractible and binding. Ex post voluntary payment without ex ante commitment is likewise not equivalent to this instrument.

## 4. G2: genuinely voluntary offer, acceptance and continuous portfolio choice

The precise game is **three-stage**:

1. A designated upstream candidate (region 1) proposes transfer rate t from a known finite institutional menu `T_grid` (not an unrestricted function).
2. Region 2 **accepts or rejects**; if it rejects, no transfer and the original `(1,1)` Nash follows. Approval does not compel activity shares; after acceptance both governments still choose `x_i∈[0,1]` simultaneously.
3. An accepted contract is irrevocably enforced, and G1 gives the complete stage-3 continuation for every permitted offer.

For `t>L` the recipient *strictly* prefers acceptance if `t<U` because its payoff under the unique accepted Nash is `b+Delta+(t-L)`; rejecting gives `b+Delta`. At `t≤L`, acceptance gives at best the outside payoff for the recipient, and at t=L the recipient can legitimately use a **reject** rule; we fix rejection at payoff equality. Proposer anticipates those strategies.

**Explicit exact-rational SPNE witness**:

```text
Delta=1, alpha=1/2, A=3/2; L=1/4, U=3/4.
Offer menu T_grid={0,1/20,2/20,...,15/20}.
Receiver accepts if and only if the continuation gives it a
strict improvement; at the t=L tie receiver rejects.
Designated proposer chooses the smallest admissible t>L:
t*=6/20=3/10.
Region strategy Nash after acceptance: (1,0).
Net gains relative to (1,1): region 1 = 9/20;
region 2 = 1/20; sum = 1/2.
Local net payoffs without b: (29/20,21/20)=(1.45,1.05).
Total net real welfare without 2b: 5/2=2.50 (status quo 2).
```

All downstream continuous portfolio actions, proposer deviations to **all permitted offers**, participation comparisons and both transfer boundaries are covered. For `t=L`, the receiver rejects; the stage-3 continuation following an impossible/unchosen approval can select `x2=1` (an equilibrium because the recipient is indifferent). For `t<L`, stage-3 outcome remains (1,1). No competing proposal is allowed after a signed contract. A real procedural analogue could be a mutually signed and exclusive intergovernmental agreement, **if such an institution is legally available**, which is currently UNVERIFIED.

**Knife-edge warning:** If the proposer can offer *every real* t in a continuous interval, the receiver requires strictly positive gain and rejects at t=L, then the proposer's profit-maximizing offer is **not attained**: its payoff tends to `b+A` as `t↓L`, with no smallest accepted t. There is then **no pure equilibrium with an accepted contract under that specified strict-acceptance/tie rule**, without an admissible minimum increment, a positive acceptance margin, a bargaining clock, or a different weak participation selection. Conversely, if at t=L the receiver accepts and chooses D, a weak-IR pure SPNE can be supported, but the recipient is indifferent and the result is fragile. These are **distinct equilibrium refinements**, not a claim that all continuum-offer games lack equilibria.

**Policy resource condition:** the designated payer needs independent liquid funding at least `t* m` when the specialization match mass `m=1`; this is **not** automatically furnished by the unit policy-capacity normalization. If the agreement cannot commit future budgets or verify matching, the above G2 game is not a credible implementation.

## 5. G3: allowing both governments unrestricted simultaneous offers destroys pure supportability

**This is a different game, with a different transfer-action set**. Following Jackson & Wilkie (2005), each regional player in stage 1 simultaneously posts an arbitrary nonnegative transfer *function* `t_i:[0,1]^2→R_+` to the other, enforceable and based on stage-2 realized policies. There is no mutual-signature requirement or exclusion of rival side contracts. In stage 2 both choose their portfolio shares simultaneously, anticipating all commitments. The relevant notion is **supportability of a pure transfer-commitment and pure policy outcome by a subgame-perfect equilibrium**. The paper's definition also allows mixed deviations and worst continuation when calculating the solo payoff. These unrestricted contracting rights are NOT an institutional fact about public authorities.

For a unilateral payer, when the other player promises **zero** side payments, a simple permitted strategy-contingent transfer `t_i(x)=t*x_i*(1-x_j)`, `t=L+epsilon<U`, generates a **unique** continuation Nash outcome in which i plays U and j plays D, with payer payoff:

```text
u_i=b+Delta+alpha*A-(L+epsilon)=b+A-epsilon.
```

Because this continuation is unique, the Jackson–Wilkie **solo payoff** satisfies `u_i^solo ≥ b+A` as epsilon→0 for **each i** (same symmetric game, reverse roles). No claim of an attained solo maximum is made: the definition uses a supremum.

Their [Theorem 2](https://doi.org/10.1111/j.1467-937X.2005.00342.x), §3 (two-player games), supplies a **necessary condition** for pure strategy/payoff supportability: `u_i ≥ u_i^solo` for both players. But with transferable utility the maximum *actual total* surplus over the entire feasible `[0,1]^2` is `2b+Delta+A`, while:

```text
u_1^solo+u_2^solo ≥ 2b+2A;
(2b+2A) - (2b+Delta+A) = A-Delta > 0.
```

Thus no feasible policy action/payoff vector can satisfy the two solo-payoff necessary conditions. **No pure contracting/policy outcome is supportable in the unrestricted simultaneous-offer game over the strict duplication wedge.** Any possible overall equilibrium must either involve some mixing in the contracting stage or be outside the pure-supportability claim. Existence/structure of mixed-offer SPNE, and the equilibrium of any *legally restricted* bilateral-offer protocol, are **NOT** established by the theorem.

**Formal scope:** Original Jackson–Wilkie presentation takes finite stage-2 strategy sets and notes in its §2 and appendix that the results extend to continuous action spaces; the exact technical extension/regularity for unrestricted functions on the compact square is an **external theorem application that requires full Appendix check before manuscript certification**. The **binary portfolio corner-restriction** `x_i∈{0,1}` provides an immediately finite illustrative game with exactly the same lower-bound and social-surplus contradiction. However a finite-action result alone would not justify a theorem about the full continuous game without the stated extension. Stage 4A proof certification has **not** been performed.

**Corrected-literature diligence:** Jackson & Wilkie's original Theorem 5 (for three or more players) was **corrected and refuted** by the published [2013 Erratum](https://doi.org/10.1093/restud/rds039). The correction explicitly states the *other theorems remain intact*, including two-player Theorem 2. **Do not cite original Theorem 5, or the unsettled Corollaries 1 and 2, as valid general implementation statements.** Our G3 conclusion relies on **Theorem 2 only**.

## 6. Does this make a publishable new contribution?

**What has genuinely improved for the original paper:** the revised presentation can answer the editor's "what could/should internalize?" with a sharp role-contingent transfer rate, budget/contractibility assumptions, participation and the actual `offer → accept → portfolio` game. It can also caution that unconstrained mutual side-contracting may fail to produce a pure equilibrium, **explicitly as an application of Jackson–Wilkie's 2005 theorem**.

**But novelty risk is substantial:** both the positive Pareto surplus split and the negative solo-payoff contradiction are **familiar side-payment mechanisms**. The paradox between unilateral and unrestricted commitments is specifically the topic of Jackson & Wilkie (2005), including literature on refusal rights, exclusive bilateral agreements, and later staged commitments. A companion analytical application to the paper's existing portfolio game is potentially useful, but claiming "new contract formation theorem" or "first demonstration side contracting may worsen efficiency" is **not defensible**. Institution-specific additional results would need to be genuinely outside these parent theorems and auditable as realistic.

**Falsification decision:** preliminary `PASS` for mathematical feasibility of an actionable voluntary G2 coordination scheme (subject to its protocol assumptions); **`NO-GO AS A NEW STANDALONE GENERAL MECHANISM`**. An editor-facing supplementary section may be considered only after Stage 1 source/institution audit and Stage 2 parent-theorem absorption; any TeX incorporation would reopen Stage 4/4A for the new contract propositions. The existing diagnostic F01 Stage-0 plan has **not been overwritten or invalidated** by this research pilot.

### Compact future paper positioning, only if editorial gate passes

> Conditional, binding interregional transfers can implement the differentiated allocation in the original capacity-constrained industrial-policy game, but voluntary implementation depends on the **rights to propose, veto, and exclude rival contracts**, not simply aggregate positive gains. Our model pins down the payment range while acknowledging that unrestricted simultaneous offer results follow known side-payment game theory.

Do **not** claim independent original contract theory from this statement. Re-evaluate economics editor appeal versus the ongoing F01 short-paper strategy before changing manuscript.

## 7. Negative controls and hostile checks

| Check | Outcome | Scope |
|---|---|---|
| Unconditional cash transfer (no dependence on policy) | Does not change any portfolio best response | Cannot implement the original wedge |
| Conditioned payment `t=L` | Policy continuation multiplicity: x2 may be any [0,1] | Weak-IR endpoint does not guarantee specialization |
| `L<t<U` and one active signed contract | Unique `(1,0)`; both strictly better | Proven from full-interval slopes |
| `t=U` | Unique `(1,0)`; proposer weakly better than status quo | Strict proposer IR fails at endpoint |
| Receiver strict acceptance, real-continuum transfers | Best accepted offer fails attainment | No accepted pure SPNE for specified tie/refusal rule |
| Finite transfer denomination `1/20` in exact example | Unique proposer optimum `3/10` | Specific finite-menu pure SPNE exists |
| Two-sided unrestricted offers | Solo payoff lower bound sum exceeds efficient welfare | No pure supportability via known Theorem 2; **mixed equilibria untested** |
| 2013 erratum impact | Theorem 5 false; Theorem 2 unaffected | Official journal correction inspected |
| Policy resource and monitoring | No cash budget, enforceability or verification in frozen model | Institutional implementation **conditional/unverified** |
| Full paper originality | Counterpart Theorem 2 already addresses strategic contracting | **Not a new general theory result** |

## 8. Reproducibility and next authorized decision

Execute [verify_h01_voluntary_contract.py](verify_h01_voluntary_contract.py) with SymPy. Source algebra independently re-derived from `paper/sections/model.tex` and `equilibrium.tex`; runnable output verifies symbolic incentives, real-surplus accounting, continuous Nash response slopes, solo-payoff lower bound, and exact-rational grid SPNE example. The Python script does **not** purport to solve all unrestricted two-sided contract games or validate a general model beyond the derived wedge.

**Next decision:** a *bounded transfer-paper editorial challenge* must focus on two things: (i) Is credible **signed, exclusive, outcome-contingent** region-to-region payment implementable under any real institution, budget authority and measurable policy action? (ii) Would presenting the existing portfolio-wedge theorem plus **explicitly attributed** contract findings materially answer the target journal editor's originality/value concerns? If yes, schedule a separate new-theory Stage 1/2 audit of these propositions before rewriting the paper. If not, retain the report as a methodological addendum and continue the previously authorized F01 diagnostic path. No Stage-4 pass/Lean/new journal target, no branch resurrection of A1.

## References and proof scope

1. Jackson, Matthew O., and Simon Wilkie (2005), **Endogenous Games and Mechanisms: Side Payments Among Players**, *Review of Economic Studies* 72(2):543–566, DOI [10.1111/j.1467-937X.2005.00342.x](https://doi.org/10.1111/j.1467-937X.2005.00342.x). Caltech [author-hosted original](https://authors.library.caltech.edu/records/qn3rf-nmc24), fully readable [text version](https://paperzz.com/doc/7261929/endogenous-games-and-mechanisms--side-payments-among-players) inspected at definition of transfer function, solo payoff, **Theorem 2**, discussion of contract refusal and appendix continuous-action scope. Formal appendix proof's measure-theoretic details not independently verified.
2. Jackson and Wilkie (2013), **Erratum**, *Review of Economic Studies* 80(2):840–843, DOI [10.1093/restud/rds039](https://doi.org/10.1093/restud/rds039). Official journal full HTML confirms original Theorem 5 is false and other theorems unaffected.
3. Pfingsten and Wagener (1997), **Centralized vs. Decentralized Redistribution: A Case for Interregional Transfer Mechanisms**, *International Tax and Public Finance* 4:429–451, DOI [10.1023/A:1008656830324](https://doi.org/10.1023/A:1008656830324). Abstract-level institutional implementation parent; full model/proofs not checked.
4. Geffner, Oesterheld, and Conitzer (2025), **Maximizing Social Welfare with Side Payments**, [arXiv:2508.07147](https://arxiv.org/abs/2508.07147). Finite normal-form staged-commitment protocol with caps/unanimous continuation; a 2025 **preprint**, not separately certified as journal publication. Not exact G2.
