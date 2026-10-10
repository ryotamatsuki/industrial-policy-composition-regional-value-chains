# Stage 2 — two minimal theory models: full-game derivations and novelty kill gate (2026-10-10)

**Research scope:** pure economic theory only. NO empirical work, no dataset, no calibration, no causal identification. This is an exploratory Stage-2 continuation of Stage-1B parent audit, NOT a certified extension of the actual Suga/Chatterjee, Gregor–Šťastná or Poirier published equations. Original 2026-09-07 THEORY_FREEZE.md, Lean and JRS submission remain unchanged. H01 and A1 negative findings are binding.

**Verdict:** Neither toy model passes the **independent contribution** gate. **NO-GO for manuscript construction or a Stage-4 theorem freeze based on these two models.** The *research question* remains conditionally open for one source-anchored general-equilibrium / incomplete-markets model, AFTER retrieving exact closest-parent model equations and specifying a result that cannot be absorbed by their propositions. This is not an unconditional continuation order.

## 1. Why these models are bounded adversarial diagnostics, not parent-equation extensions
Chatterjee (2017) already allocates a fixed education budget between categories and proves conditions for policy symmetry-breaking in trade. Suga, Yanase & Tawada (2026) already study free-trade policy symmetry-breaking, trade costs, multi-good and an input-output/entry application. Gregor & Šťastná (2012) already study local complementary public inputs, centralization/decentralization, voluntary transfers and cost sharing. Keen & Marchand (1997) already show distorted public expenditure *composition*. Poirier (2024) already includes endogenous supplier choice and optimal industry subsidies. The actual complete Chatterjee/Suga, Gregor published appendix and Poirier equations/theorem-to-theorem embedding are not wholly verified; **do not claim our models reproduce their game**.

Relevant original sources:
- https://doi.org/10.1016/j.jinteco.2017.08.009
- https://doi.org/10.1111/sjoe.70007
- https://doi.org/10.1007/s10058-012-0113-y
- https://doi.org/10.1016/S0047-2727(97)00035-2
- https://ssrn.com/abstract=5052853

## 2. Model A: competitive pricing of interregional vertically complementary capacity (market-completeness negative control)
Two jurisdictions choose x_i in [0,1] under fixed local policy capacity 1; U_i=x_i and D_i=1-x_i. A single perfectly competitive integrated final-good sector can freely source U and D services across both jurisdictions at no trade friction. Let X=x_1+x_2, D=2-X. Output:
Y(X) = A X^alpha (2-X)^(1-alpha), A>0, alpha in (0,1).
For X in (0,2), competitive CRS factor prices are p_U=alpha Y/X and p_D=(1-alpha)Y/(2-X), with zero production profit. Each jurisdiction receives all earnings on its locally owned capacity plus its quasi-linear real direct-premium Delta*x_i, Delta>0:
V_i(x_i,x_j)=Delta*x_i+x_i*p_U(X)+(1-x_i)*p_D(X).
Aggregate real welfare is S=V_1+V_2=Delta*X+Y(X). All local property rights, cost accounting and market clearing are explicitly assumed. This model CHANGES the original directional random matching and local capture assumptions; comparing output levels across the models is not valid. At X=0 or 2, define incomes by the continuous limit Y=0 (unilateral introduction of the missing input strictly improves payoff).

**Analytical identities (symbolically independently checked):**
Y'=p_U-p_D;
X*p_U'+(2-X)*p_D'=0;
Y''=-alpha(1-alpha)*Y*[1/X+1/(2-X)]^2 <0;
dV_i/dx_i=Delta+Y'(X)+[(x_i-x_j)/2]*Y''(X).
In particular, if x_i>x_j then its own derivative is strictly BELOW the other government's derivative.

**Proposition A-1 (complete pure Nash; a property of THIS diagnostic model).**
For any A,Delta>0 and 0<alpha<1, there exists a unique X* in (0,2) solving Delta+Y'(X*)=0, and the unique pure-strategy Nash profile is x_1=x_2=X*/2. This profile also maximizes constrained aggregate real surplus S, while the planner's allocation set is ALL x_1+x_2=X* with each x_i in [0,1]. Proof: Y''<0 and Y'(0+)=+infinity, Y'(2-)=-infinity. For the symmetric candidate, if a region reduces x_i below X*/2, both Delta+Y'(X)>0 and [(x_i-x_j)/2]Y''>0; if it increases x_i above, both terms negative, so the candidate is its unique global best response. For any putative asymmetric equilibrium x_i>x_j, unilateral-optimality conditions imply dV_i/dx_i>=0 (larger x_i, possibly 1) and dV_j/dx_j<=0 (smaller x_j, possibly 0). But the exact marginal order dV_i/dx_i<dV_j/dx_j contradicts these inequalities. Both homogeneous extreme corners are non-equilibria by profitable unilateral introduction of missing input, completing the boundary proof. Because S is strictly concave in X, the symmetric equilibrium is planner-optimal.

Exact benchmark alpha=1/2, Delta=1, A=3/2 (values satisfying the strict duplication wedge in the OLD model): X*=1+2/sqrt(13), x*=1/2+1/sqrt(13) approx 0.7773501. **Old model** at these parameters yields NE (1,1), planner (1,0)/(0,1). **New pooled competitive market** instead has an efficient symmetric equilibrium. THIS IS NOT a contradiction because the market ownership/matching technology differs. Nor is it publication originality: competitive factor-price/internalization is a familiar general-equilibrium channel. **Verdict A = NO-GO.** The substantive warning is that a naïve 'add market-clearing prices' extension may eliminate rather than deepen the frozen welfare wedge.

## 3. Model B0: uniform public productivity enhancement in original fixed-capacity matching game
Maintain the exact OLD payoff and strategies, but add a central, uniformly accessible public enhancement g>=0 to matching effectiveness, so A_g=A+g. A fixed tax finance / real resource cost C(g) is charged ex ante and independent of local portfolio choices; net aggregate welfare subtracts C(g). This does NOT represent an output-contingent regional transfer or a complete production-network equilibrium.

As soon as A_g>Delta/(1-alpha), the exact Nash set is {(1,0),(0,1),(q,q)} where q=alpha+Delta/A_g in (0,1). The constrained planner prefers (1,0)/(0,1), as A_g>Delta; the inefficient symmetric interior equilibrium is NOT removed. A fixed C(g) cancels in comparisons at the same g. Proof: the known original high-A theorem applies with A replaced by A_g; there is no new economic theorem.

Exact example alpha=1/2, Delta=1, A=3/2, g=3/5: A_g=21/10, q=41/42, surplus at (q,q) (before common central real cost) =41/20; at (1,0) =31/10; difference =21/20. An uniform efficiency enhancement can make differentiation Nash-feasible without uniquely implementing it. **Verdict B0 = NO-GO, absorbed by existing old theorem.**

## 4. Model B1: a targeted contingent transfer with actual fiscal cap (H01 replication / negative control)
Within old strict duplication wedge Delta<A<Delta/(1-alpha), let a binding, role-contingent transfer be T=t*x_1*(1-x_2), paid BY region 1 TO region 2 (not created free resources), with cap 0<=T<=t<=Bbar. Region 1 payoff =W_1-T, region 2 payoff =W_2+T. Total modeled real welfare remains W_1+W_2; the money transfer cancels.

Set L=Delta-(1-alpha)*A>0. For a strictly Pareto-improving, unique policy equilibrium (1,0), it suffices that L<t<alpha*A:
- Region 1's unilateral slope Delta+alpha*A - A*x_2 - t*(1-x_2) is >0 for EVERY x_2 in [0,1] (positive at both endpoints: Delta+alpha*A-t>0 and L>0); hence x_1=1 strictly dominates.
- With x_1=1, region 2's unilateral slope =L-t<0; x_2=0 uniquely responds.
- Relative to old (1,1), payoff improvements are alpha*A-t>0 for region 1 and t-L>0 for region 2.
- A feasible strictly implementing t exists under the escrow ceiling Bbar iff Bbar>L, since alpha*A>L is equivalent to A>Delta. At t=L region 2 is indifferent; no unique implementation from this argument.
Exact example Delta=1,alpha=1/2,A=3/2: L=1/4, alpha*A=3/4; t=1/2 yields net gains 1/4 for each government. This is precisely the old H01 pilot idea (known fiscal contracting and voluntary-transfer parent literature); a chosen dedicated proposer/veto protocol is STILL required to claim voluntary agreement. National/local legal authority to promise the transfer and budget appropriations NOT verified. **Verdict B1 = NO-GO as a NEW result.** This is a useful implementation appendix illustration, not a manuscript headline.

## 5. Nested-model kill tests and actual scientific disposition

| Test | A price-mediated pooled market | B uniform investment / targeted transfer |
|---|---|---|
| Fixed portfolios | GE technology still produces a national maximum; no emergent novel distortion | B0 equilibrium selection disappears only trivially; B1 interval standard |
| Fixed private network / market | Parent market completeness is doing the entire A result; not the old exogenous cross-region match | No endogenous private network exists |
| Drop fiscal/ownership accounting | A no longer has exact aggregate S; not a valid robustness result | Transfer cancellation or C(g) would be misaccounted |
| No instrument | A remains efficient under symmetric price capture | B0 reverts to OLD theorem; B1 reverts to OLD wedge |
| Theorem absorbed by parent/older result? | YES, conceptually competitive-price internalization; exact current toy result internally proved only | YES, exact frozen high-A theorem or H01 contract threshold |
| Full-game-only economic contribution? | NO | NO |

**Stage 2 verdict: both candidate minimal models are mathematically tractable, and neither yields an independently defensible contribution. DO NOT combine them into an oversized model merely to manufacture complexity.** This only rejects THESE architectures, not all conceivable modifications of Suga, Gregor or Poirier.

## 6. Conditional next theory-only gate (not authorized as a submitted paper)
If pursuing one more bounded exploratory Stage-3, FIRST read exact final-parent equations/propositions for Chatterjee, Suga (including its upstream IO application and online appendix), Gregor and Poirier. Then specify ONE genuine incomplete-market / cross-region noncontractible input transaction / fiscal-budget incidence primitive and one hypothesized theorem whose result vanishes when (i) prices fully remunerate all marginal input contributions, (ii) policy shares are fixed, or (iii) conditional fiscal commitment is absent. Do not simply introduce a parameter named 'spillover' into payoffs.

For any new candidate require full off-path firm/household optimization, market clearing, regional decision incentives, participation, fiscal accounting, existence, welfare benchmark, and a prior-paper theorem-absorption test. If not, STOP the journal project and keep the original frozen theorem as public replication research, not a forced new journal submission.

## 7. Reproducibility and epistemic limits
Independent SymPy verification and an exact-rational example checker are in [verify_stage2_minimal_models.py](verify_stage2_minimal_models.py). Numerical best-response sampling complements but does not replace the global analytic proofs above. No Lean proof or full GitHub CI was run; no mathematics in existing frozen manuscript was changed. Two stylized games are NOT faithful extensions of published parent equations and neither merits novelty certification.