# Stage 4 — Hostile theory audit of two-sided regional subsidy model (2026-10-10)

**DECISION: NO-GO AS INDEPENDENT RESEARCH PAPER; do not enter Stage 4A.** Pure THEORY only. Preserve original submitted JRS Theory Freeze / Lean / manuscripts unchanged. The Stage-3 binary-game U-shaped public appropriation infimum is arithmetically valid in its specified tax/contract class, but no independent general research contribution is established. This audit corrects the earlier tax-incidence claim, constructs an explicit alternative-contract counterexample, and identifies the voluntary formation game gap.

## 1. Inherited finite game, exact public finance
Two jurisdictions choose indivisible U (1) or D (0) allocations of one unit of policy capacity. They jointly produce A with a private developer only if U/D roles differ and the developer pays a real fixed cost K. Region i earns direct U premium Delta. The developer obtains share gamma of gross A, and the remaining regional real earnings are split alpha on U and (1-alpha) on D. The central authority offers s>=0 to the developer and t>=0 to D, conditional on completed matched production. The total B=s+t is *financed by local regions*, not a genuinely exogenous central resource. Developer invests iff gamma A+s>=K (ties enter). Both regions require their matched payoffs strictly greater than the baseline U/U income Delta to opt in.

To check sensitivity, allow the upstream jurisdiction to finance a share theta in [0,1] rather than necessarily 1/2:
vU=Delta+alpha(1-gamma)A -theta(s+t);
vD=(1-alpha)(1-gamma)A +t -(1-theta)(s+t);
pi=gamma A+s-K.

The exact identities are:
vU+vD=Delta+(1-gamma)A-s;
vU+vD+pi=Delta+A-K.

These are not identities of the actual Chatterjee, Suga, Gregor or Poirier games.

## 2. Proposition S4-1: aggregate local veto is independent of tax shares
The two regions can both STRICTLY improve on their U/U baseline only if
(1-gamma)A-s>Delta.
Firm entry requires s>=e(gamma)=max(0,K-gamma A). Thus the necessary condition is
(1-gamma)A-e(gamma)>Delta, equivalent to
min{A-K,(1-gamma)A}>Delta.

For a socially beneficial specialization A-K>Delta, this entails gamma<1-Delta/A. Under the Stage-3 exact rational values (Delta,A,K,alpha)=(1,4,11/5,1/2), this gives gamma<3/4 as NECESSARY for voluntary two-region implementation when the government cannot tax/reclaim developer rents or import outside money. Contrary to the earlier Stage-3 text, changing theta **CANNOT** overturn the gamma>=3/4 veto: regional tax/transfer redistribution does not increase summed regional resources. A Stage-3 erratum has been added.

Under unrestricted within-region redistribution and an enforceable assignment of complementary roles, the inequality is also sufficient for strict EX POST regional payoff improvements, but NOT for unique endogenous agreement formation or limited instruments. This is an elementary transferable-utility budget identity, NOT an original theorem of economic mechanism design.

## 3. Proposition S4-2: a developer-funded contingent fee defeats high-gamma implementation impossibility
Allow a contractible royalty/licensing fee f>=0 *from the developer* to the D region on successful project entry, with no s or t government subsidy. Then:
vU=Delta+alpha(1-gamma)A;
vD=(1-alpha)(1-gamma)A+f;
pi=gamma A-K-f.
Firm invests if f<=gamma A-K. D prefers the role to U/U iff f>Delta-(1-alpha)(1-gamma)A, and U strictly improves for gamma<1 and alpha>0. Any fee satisfying both yields exactly the mirror matched Nash policy profiles with developer entry, given this finite game.

Exact counterexample: Delta=1,A=4,K=11/5,alpha=1/2,gamma=9/10,f=1. Developer profit 2/5>0, each region payoff 6/5>1, joint real surplus 14/5>2, and the U/D and D/U outcomes are the only pure policy equilibria. The previous gamma>=3/4 "impossibility" is therefore not a generic industrial-policy finding. It rests on Stage 3's explicit exclusion of firm-rent recapture; merely reassigning local tax shares cannot change the local-coalition total, but an enforceable firm-funded payment can.

With fully transferable net project surplus among all three agents, a purely algebraic cooperative allocation exists whenever A-K>Delta: select small positive epsilon<(A-K-Delta)/2, give each region Delta+epsilon and give the firm the nonnegative residual A-K-Delta-2epsilon. This is the textbook transferable-utility surplus-sharing observation, conditional on enforceable contracts and role selection. It is NOT a new equilibrium formation theorem.

## 4. Proposition S4-3: low-gamma participation can depend on local tax incidence
At Delta=1,A=4,K=11/5,gamma=0,alpha=1/10, choose s=11/5,t=0. Firm enters with zero profit and a complementary project yields real welfare 14/5 versus U/U welfare 2.
For equal tax shares theta=1/2: vU=3/10<1 and vD=5/2>1; upstream refuses.
For theta=0: vU=vD=7/5>1; both strictly consent and asymmetric role profiles are the only pure policy Nash.
Thus aggregate local participation impossibility is tax-invariant, but *individual* participation can change with local fiscal incidence. The Stage-3 gamma cutoff was sufficient only for its selected parameter slice/instrument class, not all alpha.

## 5. Voluntary agreement and equilibrium selection are NOT solved
Suppose both jurisdictions must accept an agreement; if either rejects, the policy reverts to baseline U/U. Even if both strictly benefit conditional on a signed role allocation, (Reject,Reject) is always a weak Nash equilibrium of the simultaneous signing game: one unilateral acceptance does not trigger the program. (Accept,Accept) may also be Nash. Conditional policy Nash after presumed signing also comprises two mirror roles U/D and D/U. Consequently Stage 3 has shown *conditional participation inequalities*, not unique voluntary implementation, dominant-strategy acceptance, or politically feasible assignment of U and D.

## 6. Literature threat and closest theorem map
1. Rodrik (1996), Coordination Failures and Government Policy, JIE, https://doi.org/10.1016/0022-1996(95)01386-5. Specialized suppliers' coordination failure and entry subsidy already modeled. Publisher summary checked; original full proofs unavailable in this pass.
2. Volden (2007), Intergovernmental Grants: A Formal Model of Interrelated National and Subnational Political Decisions, Publius, https://doi.org/10.1093/publius/pjl022. The original publisher abstract documents a four-decision game: national grant offer and conditionality, subnational acceptance and spending/policy responses. Full theorem appendix not examined.
3. Melkonyan, Banks & Wendel (2017), Industrial Policy to Develop a Multi-Firm Industry, Journal of Industry, Competition and Trade, https://doi.org/10.1007/s10842-016-0242-z. Original full Springer HTML §§2–3.4 and principal feasibility proposition INSPECTED: two-period pioneer/second firm entry game and combinations of fixed and variable subsidies for complements/substitutes. More complex than current binary toy but not a mathematically identical game.
4. Gregor & Stastna (2012), The Decentralization Tradeoff for Complementary Spillovers, Review of Economic Design, https://doi.org/10.1007/s10058-012-0113-y. Complementary local public inputs, strategic delegation, voluntary cross-region contribution, center/local comparison. Publisher summary/older working model inspected; full journal theorem-to-theorem comparison incomplete.
5. Gregor (2015), Task divisions in teams with complementary tasks, JEBO, https://doi.org/10.1016/j.jebo.2015.06.017. Publisher full abstract/introduction show endogenous task division and monetary gift to compensate other agents; undermines claim that role specialization plus gifts is a new mechanism.

We DO NOT claim these original papers contain the exact U-shaped expression. The existing finite candidate nevertheless fails the independent research gate because its apparently new expression is just a piecewise maximum of standard entry and participant subsidy inequalities and its institutional "impossibility" dissolves when developer rent transfers are permitted.

## 7. Continuous strategy / parent fidelity
Stage 3 binary x_i in {0,1} does not extend the September 2026 x_i in [0,1] Nash results. A continuous effort version must decide whether fixed developer cost K applies to arbitrarily tiny complementary matching, whether the grant s is paid lump-sum or proportionally, and which off-path private entry is profitable. These choices affect discontinuities, best responses and existence. It is incorrect to assert the Stage-3 theorem extends continuously. No fresh continuous proof has been developed: the current candidate fails the economic novelty gate before complexity can be justified.

Suga–Yanase–Tawada's full 2026 published theory, Chatterjee's finished model, Poirier's complete supply-network theorem and relevant Gregor appendices have not all been audited. Claim neither comprehensive priority nor proved paper-level novelty. This is sufficient to STOP this candidate under the project workflow, not a universal assertion all conceivable regional industrial policy theory is exhausted.

## 8. Decisive decision and recommended research management
- Restricted binary Nash/transfer arithmetic: PASS.
- Stage-3 U-shaped gross cash appropriation: PASS under narrow model; NOT a social resource cost and NOT a novel theorem.
- Tax-share correction / aggregate local surplus invariant: PASS; Stage-3 erratum recorded.
- Exact developer-fee and asymmetric local tax-share counterexamples: PASS.
- Voluntary signed-contract equilibrium selection: NOT SOLVED.
- Continuous-policy extension / faithful published-parent derivation: NOT DONE.
- Standalone originality and editor-facing contribution: FAIL.
**Stage 4 verdict: NO-GO. NO Stage 4A, NO manuscript revision, NO target journal.**

Preserve the old certified original theory, historical unsuccessful A1/H01 experiments and current negative results. Do NOT rescue the toy by adding arbitrary extra parameters or players. If initiating an entirely separate theory research programme in future, require a theorem-level gap sourced in a specific published parent's exact model before any new Stage 3; otherwise stop the journal project. No empirical research is proposed.
