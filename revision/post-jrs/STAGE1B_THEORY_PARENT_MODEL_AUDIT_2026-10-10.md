# Stage 1B — Theory-only parent-model audit after JRS desk rejection (2026-10-10)

**Scope:** theory ONLY; NO empirical work, dataset construction, identification, econometrics or institutional data collection. Author request supersedes previous empirical-option recommendations. This is an exploratory **separate Stage-1B lane**, **not** completion of the canonical F01-only Stage-1 gate recorded in `STAGE0_REFRAME_AFTER_MECHANISM_NO_GO.md`. Historical main Theory Freeze, manuscript and Lean are untouched.

**Decision:** `GO TO ONE BOUNDED MINIMAL-MODEL KILL GATE`, with **zero** new theorem/novelty certification. Main provisional parent = Chatterjee (2017)/Suga–Yanase–Tawada (2026) comparative-advantage policy game, but the pure `fixed-budget composition` addition is **KILLED by Chatterjee (2017)**. Gregor–Šťastná (2012) is a high-danger alternate parent. Poirier (2024) is deferred until its full working paper/theorem statements are accessible. Existing F01 diagnostic journal route has a **severe independent absorption threat**, not an endorsed paper.

## 1. Editor's objection / original scientific value
JRS manuscript 1758654: Dr Florian Mayneris (2026-10-10 JST) desk-rejected for an abstract, uninternalized spillover model with no practical *what should/could internalize* intervention. Not a mathematical error finding. For a *theory-only* next paper, "practical" means a precisely specified **feasible policy instrument, relevant decision-maker, endogenous equilibrium, participation/finance and welfare implication**—not an empirical study.

Original freeze `IPCRVC-THEORY-FREEZE-2026-09-07-v1`:
```text
W_i(x_i,x_j)=b_D+Delta*x_i+alpha*A*x_i*(1-x_j)
             +(1-alpha)*A*(1-x_i)*x_j;
x_i,x_j in [0,1], Delta>0, A>0, alpha in (0,1).
```
Exact algebra (independently confirmed with SymPy):
```text
W_i=b_D+(1-alpha)*A*x_j+(Delta+alpha*A)*x_i-A*x_i*x_j
dW_i/dx_i=Delta+alpha*A-A*x_j.
W_i+W_j=2*b_D+(Delta+A)*(x_i+x_j)-2*A*x_i*x_j.
W(1,0)-W(1,1)=A-Delta.
W_i(1,1)-W_i(0,1)=Delta-(1-alpha)*A.
```
Thus individual best responses are **strategically equivalent to a standard bilinear strategic-substitutes/anti-coordination game**, after removing the term depending only on the other player's action. **Do not** remove the other-player-only term when constructing the *social welfare benchmark*; the game is only strategically equivalent, not welfare equivalent. The strict wedge is `Delta<A<Delta/(1-alpha)`: unique Nash (1,1), planner picks (1,0)/(0,1). The core discovery is a transparent threshold mismatch and should be treated as an illustrative benchmark **unless a credible new mechanism is isolated**.

## 2. Six-parent adversarial model map and source-depth
Evidence grades: **M** original paper model/proposition inspected; **WP-M** related or earlier open working paper model inspected, *not necessarily identical to journal version*; **A** primary publisher abstract only. Every paper here is a **published result or working paper** as stated; an unverified full theorem is never asserted.

| Closest parent | Verified scope, essential equilibrium mechanism | Threat to proposed new claim | Source depth / limitation |
|---|---|---|---|
| Keen & Marchand (1997), *Fiscal competition and the pattern of public spending*, **JPubE** | In a capital-mobility fiscal competition game, decentralized government choices distort the **composition** of public spending (public inputs vs public goods), even if tax rates are held fixed. Coordinated spending reallocation improves welfare. | "Policy composition rather than spending level" and "decentralization distorts sectoral priorities" **already existed**. | A, publisher abstract. https://doi.org/10.1016/S0047-2727(97)00035-2 |
| Chatterjee (2017), *Endogenous comparative advantage, gains from trade and symmetry-breaking*, **JIE** | Two initially symmetric countries choose policies that influence comparative advantage. The *education-policy application explicitly allocates a fixed education budget between higher and primary education*. Symmetry breaking and welfare comparisons are established. Earlier 2013/14 WP Proposition 7 discusses own-policy convex aggregate income; published article may have revisions. | **Directly kills** Suga + 'fixed budget composition' as a standalone originality claim; equilibrium specialization and sectoral split already coexist. | WP-M, publicly readable UNSW working paper, pp.14–19; published article abstract primary. https://doi.org/10.1016/j.jinteco.2017.08.009 ; https://scispace.com/pdf/endogenous-comparative-advantage-gains-from-trade-and-g19eu9gsw8.pdf |
| Gregor & Šťastná (2012), *The decentralization tradeoff for complementary spillovers*, **Review of Economic Design** | Two districts, district-specific public inputs, CES-like complementarity of local and spill-in inputs, decentralized/centralized choice, voluntary cross-district contributions, cost division and strategic delegation. Older open 2011 WP explicitly defines effective inputs `((1-kappa)x,kappa*y)` and vice versa and complementary aggregator. | **High absorption risk** for pure bilateral complementary public goods, specialization, transfers, voluntary contributions and centralization. | WP-M for intro and model setup; exact final published theorem appendices **not comprehensively verified**. https://doi.org/10.1007/s10058-012-0113-y ; https://www.econstor.eu/bitstream/10419/83312/1/656762438.pdf |
| Suga, Yanase & Tawada (2026), *Endogenous comparative advantage via symmetry-breaking policy equilibrium*, **Scandinavian Journal of Economics** | Two-country Ricardian policy game; identical governments choose different productive public-good levels in free-trade PSNE. Published abstract reports trade costs, multi-good setup **and an upstream input-output linkage/entry-regulation application**. Related 2025 authors' WP gives a *PPF-curvature* sufficient symmetry-breaking condition (its Proposition 1). | Neither comparative advantage formation, symmetric-country asymmetry, nor generic IO links is novel. Need a **policy-budget × interregional vertical-production-feedback** theorem not implied by parent. | A for 2026 final, **M only for distinct 2025 sibling WP**, not a proof that their equations coincide. https://doi.org/10.1111/sjoe.70007 ; https://eprints.lib.hokudai.ac.jp/dspace/bitstream/2115/95136/1/DPA382.pdf |
| Poirier (2024), *Industrial policy in endogenous production networks*, **working paper/SSRN** | Endogenous supplier choices, production-network externalities, welfare-effect decomposition, optimal sector targeting with and without imperfections. | Network formation + industrial policy or grants is **already occupied**; a second regional government and fixed policy budgets must change a primary theorem, not merely an investor's link choice. | A only; full working-paper equations/propositions not accessed in this pass. https://ssrn.com/abstract=5052853 |
| Liu (2019), *Industrial Policies in Production Networks*, **QJE** | A sufficient statistic for the value of sector targeting arises from production-network distortions; upstream sectors can merit subsidies. | Generic 'subsidize upstream sectors because of input-output complementarities' not novel. | Publisher/academic index model/contribution abstract only; full theorem absorption pending. https://doi.org/10.1093/qje/qjz024 |

**Additional non-counted high-threat:** Suga et al (2025) PPF paper `2025-382`, *Chatterjee (2017)* (already counted), Gregor (2016) *A three-stage model of inter-jurisdictional public spending spillovers* identifies strategically equivalent spillover models; Matsuyama (2002) symmetry-breaking and Amir–Garcia–Knauff (2010) diagonal nonconcavity; public-spending composition further revisited by Kikuchi, Kuzawa & Tamai (2026, first-online 2025). These make simple feature additions particularly dangerous.

## 3. Corrected four-route research verdict

**R1. Original F01 short diagnostic** = `HIGH-RISK / NO-GO IF NO FURTHER ORIGINALITY EVIDENCE`. Bilinear payoff strategically equivalent to standard two-action anti-coordination; planner gap is a one-line threshold. Keen–Marchand already targets expenditure composition. Mathematical correctness and Lean coverage are not editorial novelty. Do not issue a journal recommendation or shorten yet.

**R2. Direct Gregor extension with fixed regional budget and simple transfers** = `NO-GO AS HEADLINE`. Parent already has complementary public inputs, endogenous foreign-input donations, specialization and cost splitting; adding a capacity constraint or transfer interval alone risks generic Kuhn–Tucker/prescription mechanics. Reopen only if **a qualitatively different strategic feedback and an independently derived welfare/implementation result** survives full published-parent comparison.

**R3. Chatterjee/Suga comparative advantage + vertical cross-region input-output complementarity + local fixed-budget composition** = `CONDITIONAL PRIORITY FOR ONE MINIMAL-MODEL FALSIFICATION`. Important: (a) Chatterjee already has *fixed-budget split*; (b) Suga final already has IO linkages; (c) Suga 2025 companion's curvature result may already absorb a proposed symmetry/non-symmetry theorem. Surviving candidate is **cross-region price/wage/production incidence jointly interacting with government budget share and a precisely financed policy response**. No theorem/GO claimed.

**R4. Poirier endogenous network + strategic competing governments** = `DEFER`. Need exact microfoundations and uniqueness/existence/optimal-policy theorems from complete source; prior A1 three-region grant broker was rejected because its grant-diversion result persisted with government portfolios fixed. Adding another government without a full-game-only comparative static is insufficient.

## 4. Next theory-only minimal model test contract
**Question:** Can a vertical-input general-equilibrium policy game generate a *new* region-of-parameters in which (i) trade/production incentives favor country specialization in the Chatterjee/Suga parent, but (ii) fiscal incidence and bounded *portfolio* allocation sustain duplicated priorities; and (iii) a legally/conceptually well-defined conditional intergovernmental co-financing instrument achieves a constrained-Pareto improvement *that does not arise in fixed-portfolio, fixed-network or pure transfer benchmarks*?

**Proposed architecture, NOT yet a solved extension of published equations:**
1. Two governments i=1,2, simultaneously pick `x_i in [0,1]` with a binding *real* budget `B_i`. Allocate `B_i*x_i` to upstream productivity and `B_i*(1-x_i)` to downstream productivity.
2. Competitive producers in U and D; D requires U intermediate inputs across borders, with endogenous intermediate prices and supplier or region shares. Specify technologies, market clearing, consumer preferences, wages and lump-sum budget finance **before** writing government payoffs. No ad hoc addition of the old `alpha*A` term to Suga's real-income objective.
3. Choice/financing of a central, conditional *verifiable cross-region production* matching grant occurs before government portfolios (if present); central finances it from an explicitly specified common budget/tax. Either solve voluntary participation and fiscal feasibility, or clearly designate the policy as central rule rather than fake bilateral transfer.
4. Backward induction: prices and production conditional on `(x_1,x_2)`; local policy Nash (all deviations); constrained social planner with **same B_i, production and trade technology**; central instrument with equilibrium under all relevant histories.

**Required nested kills**: N0 no U–D interregional trade; N1 portfolios frozen; N2 production links fixed; N3 binding budget replaced with separable spending choice; N4 no central instrument; N5 no local revenue incidence/fully internalized real benefits. Main result must disappear under a theoretically relevant benchmark, **and** be absent from the closest parent theorem. Just seeing different thresholds when adding parameters is not sufficient.

**Candidate conjectures to falsify (NOT results):**
- `C1`: budgeted policy shares and vertical trade prices generate a non-monotone transition between symmetric duplication and asymmetric specialization not captured by Chatterjee/Suga curvature.
- `C2`: cross-region co-financing improves the *constrained* planner objective on a nonempty region **only because** local policy shares and private linkage re-optimize together.
- `C3`: an implementable instrument with a common total cash cap selects one of multiple socially efficient role assignments without unbounded contracts or off-equilibrium undefined continuation.

**Hard STOP** if a claimed 'novel' mechanism is explained by (a) Chatterjee's policy-budget application, (b) Suga's PPF/symmetry-breaking result or upstream-link example, (c) Gregor public-input transfers, (d) Keen–Marchand fiscal composition, (e) Poirier supplier-switching, or (f) simple transfer feasibility/KKT. Record negative findings rather than enlarging the model.

## 5. Epistemic/provenance limits
- Independent mathematical calculations above only concern the **old frozen game**. No new Suga/Gregor/Poirier policy equilibria have been solved or certified.
- Chatterjee 2013/14 preprint full-model statements were inspected; 2017 published summary verifies broad contribution, but differences to final are unresolved.
- 2026 published Suga full-text journal equations, Gregor 2012 published full appendices and Poirier 2024 60-page paper model/theorems have not all been retrieved. **A source-depth audit is NOT complete**; no 'literature novelty proved' claim.
- No empirical datasets, calibration, causal inference, industrial priority observations, or journal targeting in this theory-only request.
- Does not change original historical JRS freeze/status, previous A1 NO-GO or the separate F01 canonical Stage-0 pathway.
