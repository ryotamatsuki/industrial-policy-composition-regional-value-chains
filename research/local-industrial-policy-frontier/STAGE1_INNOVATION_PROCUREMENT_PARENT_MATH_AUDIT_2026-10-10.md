# Stage 1 — Primary model and mathematical source audit: local innovation procurement, endogenous buyer verification
Date: 2026-10-10 JST. **Canonical verdict: NO-GO FOR CURRENT C-BUYER-INFO-IMPLEMENTATION QUESTION. STOP BEFORE STAGE 2/3.**
Theory ONLY. No empirical design, data, calibration, quantitative estimation, new welfare theorem, manuscript or venue. Research direction is independent of the original rejected Journal of Regional Science IPCRVC paper.

## 0. Research question and actual source standard
Stage 0 provisionally selected: "Does costly endogenous verification by a resource-constrained LOCAL public procurement buyer, combined with a private supplier's innovative investment, produce a materially new optimal contract/industrial entry margin not covered by Hwang (2024)?" Stage 1 was obliged to audit Hwang's equations/participation/IC, Chiappinelli et al (2025) survey, and highest-threat papers on procurement monitoring and TWO-sided agency BEFORE adding any strategic actor.

**Key audit outcome:** Hwang's original theoretical choice is already two-level public policy -> procuring agency -> innovative firms, with participation constraints, risky product choice and original contractor innovation cost. Crucially, (a) **Andreas Asseyer (2018 IJIO)** already explicitly studies a government purchaser buying innovative goods, a firm's endogenous technology investment, cost uncertainty, an optimal costly MONITORING TECHNOLOGY choice and dynamic optimal contracts; (b) **Bernd Theilen (2009 B.E. JTE)** explicitly studies a principal, delegated contracting agent, a second production agent who acquires MONITORING INFORMATION at cost, and differences between centralized/decentralized procurement; (c) **Baron–Besanko (1987)** already study monitoring technology PRECISION in government defense procurement, supplier effort, asymmetric information and risk aversion. Thus no currently identified *theorem-level* novelty can survive a bare municipal-label replacement or making monitoring a continuous scalar. Claims of originality and future mathematical results would be premature.

## 1. Hwang 2024 ORIGINAL published theoretical model, source depth full HTML at equation-adjacent textual proof
Sunjoo Hwang, "A Theoretical Analysis of Public Procurement for Innovation," KDI Journal of Economic Policy 46(2):21–43 (31 May 2024), DOI https://doi.org/10.23895/kdijep.2024.46.2.21.
Publisher full printed HTML (exact original prose; displayed formulas are external JPG image widgets not retrieved directly by source inspection): https://kdijep.org/v.46/2/21/A+Theoretical+Analysis+of+Public+Procurement+for+Innovation?view=print
Archived PDF search result exists at https://archives.kdischool.ac.kr/bitstream/11125/55055/1/A%20Theoretical%20Analysis%20of%20Public%20Procurement%20for%20Innovation.pdf but direct original PDF fetch gave JavaScript access challenge. **Do not represent equation-image text as independently visually checked.** The following formulas are reconstructed from the original adjacent published explanatory paragraphs and verified symbolically, not read from its inaccessible equation images. Definitive source-image comparison remains an evidence limit; it would matter if a positive continuation were claimed, not to negate high-level prior-art match.

Players:
- national benevolent government/principal sets four-component policy (alpha,beta,b,p);
- public buyer/SOE (agent) decides innovative procurement fraction x∈[0,1];
- suppliers choose conventional vs innovative products; innovation incurs fixed invention cost k, certification success probability theta, failure disutility rho; conventional price c, innovative cost c+delta and payment c+delta+p, quality y=m'+eps, eps mean zero variance sigma², standard quality m, Delta=m'-m>0.
- the original Hwang text explicitly says the procurement agent may ALSO be "a central or local government", not uniquely SOE! So municipality label is EXPLICITLY covered, not a new agent.
- buyer CARA/exponential utility, risk aversion gamma>0; incentive b per innovative item, quality payalpha, fixed compensation beta. Government is risk neutral; chooses policy subject to buyer and suppliers IC/IR. sigma² and product quality distribution exogenous, quality certificate assessment takes place; supplier research-investment choice already appears through entry/contractor-type decision but its effort intensity is not modeled as an interior continuous choice.

A. **Supplier equilibrium participation constraint (derived from original paragraph):**
 EU_sup = theta (p-k) + (1-theta)(-k-rho) = theta p - k - (1-theta)rho >= 0.
 Minimum payment margin p* = [k+(1-theta)rho]/theta, theta>0.
 Thus claiming that introducing an innovator's investment/participation decision is a NEW feature is false.

B. **Buyer's optimal innovative share (Hwang Proposition 1 and original prose around original eq (5)):**
in interior, x* = [alpha*Delta + b - delta - p]/[gamma*alpha²*sigma²].
This follows from maximizing the certainty-equivalent part A*x - .5*gamma*alpha²*sigma²*x² for A=alpha*Delta+b-delta-p, with [0,1] clamp; second derivative -gamma*alpha²*sigma²<0.
Prop. 1 also explicitly treats boundary x=0 and x=1; publishing an 'optimal procurement fraction' as a novel result is forbidden.

C. **Government contract (Hwang Proposition 2):** government solves max V(alpha,beta,b,p) subject to buyer IR, supplier IR and buyer procurement IC. Original published proof says buyer IR binds; supplier IR binds at p*, and government's optimal transfer/cost-risk tradeoff is characterized by Prop. 2. Do not claim that alpha, beta, b, p or optimal innovation quantity were ignored by Hwang. Source image values for Prop.2 coefficients inaccessible here; report no independent full Proposition-2 derivation, no original theorem certification.

D. **Exactly what Hwang does not explicitly solve:** a government BUYER's continuous endogenous verification PRECISION/effort and its interaction with changing private innovation quality signal precision and postaward continuation. But that statement about ONE parent is insufficient: Asseyer, Theilen, Baron–Besanko already address major parts in procurement contract and inspection contexts.

## 2. Asseyer 2018 — exact prior-art match: dynamic government procurement + innovator + costly monitoring
Andreas Asseyer, "Optimal monitoring in dynamic procurement contracts", IJIO 59 (2018), 222–252, DOI https://doi.org/10.1016/j.ijindorg.2018.03.004.
**Official publisher full summary / article sections inspected** https://www.sciencedirect.com/science/article/pii/S0167718716302375. It calls the institutional mechanism *innovation partnership*: government procures innovation-development services and future actual supply in one bundle; supplier chooses an investment in a new process; private κ innovation cost, production cost shocks, moral hazard; government optimizes monitoring innovation investment versus cost shocks and agency contract.

**Full equation-level source separately inspected:** original **JUNE 17, 2015 WORKING PAPER**, 35-page original PDF https://repec.berlinschoolofeconomics.de/bdp/wpaper/pdf/WP_2015-02.pdf . PDF pages 6 and 19 and p12 lemma 2 visually inspected with web PDF screenshot. It is an EARLIER DIFFERENT VERSION, not claimed mathematically identical to the journal-final 2018 paper, which adds/sharpens innovation partnership public-benefit dimension and result language.

2015 WP primitives: principal receives procurement value v; private firm chooses investment x∈{0,1}; privately known investment cost κ distribution F; cost after stochastic shock eps∈[0,1] is c_x(eps) with c_1<c_0, production probability q(eps), monetary transfer t; government can observe investment at cost C^i, the shock at cost C^s, both or nothing. Agent payoff t - c_x(eps)q -κ x; government gross payoff v q-t. Timing: κ revelation before contract; government monitors/contracts; firm invests; shock realizes; goods supplied. Original working PDF eq (1) **efficient investment cutoff**:
 κ* = ∫_0^{eps*_1}(v-c_1(eps)) d eps -∫_0^{eps*_0}(v-c_0(eps))d eps,
with c_x(eps*_x)=v. This is EXACT procurement innovative investment margin, no ad hoc new numerical parameter required.

2015 WP **Proposition 1**: if investment monitoring is installed, also monitoring cost shocks cannot improve the principal payoff. **Lemma 2**, p12 eq(9): under shock monitoring the investment threshold & efficient production implementing the investment-monitoring contract iff
 κ* - κ^i <= ∫_{eps*_0}^{eps*_1}(v-c_1(eps))d eps.
This condition precisely captures when investment cannot be observed but monitoring of resulting shocks substitutes.
**Proposition 4**, printed WP p19, visual checked: define Π^i, Π^s, Π^n as government payoffs GROSS of inspection costs from investing-monitoring, shock-monitoring, no monitoring. Optimal monitor maximizes {Π^i-C^i,Π^s-C^s,Π^n}; explicit 3 regime inequalities characterize exact boundaries.
For example **NO MONITORING** when C^i >= Π^i-Π^n and C^s>Π^s-Π^n. **SHOCK monitoring** when C^s <= min{C^i+Π^s-Π^i, Π^s-Π^n}. INVESTMENT monitoring when C^i < min{C^s+Π^i-Π^s, Π^i-Π^n}. Strictness and tie rules as printed; no global uniqueness of monitor decision at equalities. This already defeats "costly verification can change optimal innovation procurement and investment" as an independent research main theorem.

**Published 2018 source results (not transferred back as 2015 exact propositions):** monitoring cost shocks can substitute monitoring supplier innovation effort for intermediate innovation benefits, potentially worse no-monitoring contracting; output distortions depend on supplier hidden investments. Journal text is more detailed about direct wider social benefits of innovation and both low/high benefits causing moral hazard; do not falsely present 2015 thresholds as certified 2018 final propositions.

## 3. Theilen 2009 — an AGENT optimally invests in monitoring in public procurement
Bernd Theilen, "Monitoring Gains and Decentralization", B.E. Journal of Theoretical Economics 9(1) (2009), DOI https://doi.org/10.2202/1935-1704.1525. Original abstract/repec and publisher bibliographic result checked:
https://ideas.repec.org/a/bpj/bejtec/v9y2009i1n32.html
The theoretical procurement project has 1 principal and 2 agents. The SECOND agent invests in monitoring the FIRST agent's effort (obtains soft info). The principal chooses centralized direct contracting or delegate contracting power to a monitor agent; DECENTRALIZED organization can induce stronger monitoring and superior outcomes due to incentives, depending on monitoring cost and production importance. The article directly refers to design-build procurement. **Source depth abstract only; full theorem not read**. Strong threat to treating "civil servant's effort to verify a supplier" as distinct: public buyer agent acquiring info and principal delegation were already analyzed.
Additional close primary:
Baron & Besanko (1987) "Monitoring of Performance in Organizational Contracting: The Case of Defense Procurement," Stanford GSB working paper: https://www.gsb.stanford.edu/faculty-research/working-papers/monitoring-performance-organizational-contracting-case-defense . Supplier effort hidden, private information, imperfect monitoring; government optimal incentive contracting AND continuous monitoring PRECISION/which costs to monitor.
Alexander Rodivilov (2022), "Monitoring innovation", Games and Economic Behavior 135:297–326, DOI https://doi.org/10.1016/j.geb.2022.06.011; publisher full introduction/abstract: agent expends effort experimenting about innovative project quality, principal chooses optimal TIMING of costly monitoring; early vs late monitoring changes information rent and incentives. Full theorem not inspected but matches dynamic innovation monitoring.
Iossa & Martimort (2016), "Corruption in PPPs, incentives and contract incompleteness", IJIO 44:85-100, DOI https://doi.org/10.1016/j.ijindorg.2015.10.007: 3-tier public principal-official-private contractor with verification and hidden effort already established; do not add a third procurement official as superficial novel mechanism.

## 4. Published explicit future-research gap vs full scholarly novelty
Chiappinelli, Giuffrida & Spagnolo (2025), "Public procurement as an innovation policy: Where do we stand?" IJIO 100:103157 DOI https://doi.org/10.1016/j.ijindorg.2025.103157. Full original review accessed via original publisher HTML and Barcelona author's open 20-page PDF in Stage0. The authors explicitly call for *additional theoretical investigation of buyer–innovator relationships* with implementation frictions and limited procurement personnel. That statement is a GENERAL agenda, **not a guarantee that an original theorem can be proved by taking Hwang and adding monitoring**. The literature cited by Asseyer and Theilen already deals with costly monitoring, contractor R&D and public procurement. Additional cross-paper source mapping, not feature count, controls novelty.

## 5. Parent-by-parent absorption table
| Question / alleged "novelty" | Hwang24 | Asseyer18 | Theilen09 | Baron-Besanko87 | Rodivilov22 | Evidence / gate |
|---|---|---|---|---|---|---|
| Buyer public authority / local procurement agent | YES (says local buyer acceptable) | YES government buyer | YES principal plus delegated agent | YES government | general principal | EXACT COMPONENT PRIOR |
| Endogenous contractor innovation/quality and participation | YES (supplier choice, fixed k, success theta) | YES (private κ; investment x) | production efforts | YES supplier effort | YES innovative learning effort | EXACT COMPONENT PRIOR |
| Contract risk and induced procurement quantity | YES Prop1/2 | YES output/production q contract | YES design-build contracting | YES linear incentive contract | YES innovation timing | EXACT COMPONENT PRIOR |
| Costly project/investment verification | NO continuous buyer effort | YES costly monitor and 3 policies | YES delegated monitoring effort | YES technology/precision choice | YES costly optimal monitoring timing | EXACT/VERY CLOSE PRIOR |
| Monitor invest versus monitor later shock | not solved | **2018 journal main** | not original focus | precursor monitoring input | time comparative | EXACT PRIOR |
| Officer's endogenous labor precision as a SINGLE separate choice | no | costs/technology exogenously specified alternatives | monitoring effort ENDOGENOUS via agent | endogenous monitoring precision | monitoring timing | HIGH THREAT |
| Number of contracts crowds finite officer hours AND contractor innovation responds AND geographic local public balance changes | NO verified exact full game | no verified exact full game | no verified full | no verified full | no verified full | **UNRESOLVED**, NOT YET A HYPOTHESIZED UNIQUE THEOREM |
| Independent result existing only for locality or municipal budgets | Hwang says local agent admissible | public authority generic | public procurement generic | government buyer generic | general | **NONE IDENTIFIED** |

### Application-neutral "absorption test"
Erase "municipality" and "startup" labels. Basic selected question becomes:
Principal delegates an innovative procurement choice to a buyer agent with a costly observation/screening decision; supplier takes hidden innovation action; agency designs compensation with hidden info and finite budget.
This is a canonical nested principal–agent/monitoring/adverse-selection programme with specific matches above. No discovered theorem changes when "local" replaces "national"; local residents' welfare, region-exclusive assets, tax base or an intergovernmental mechanism are NOT already part of candidate. Introducing "staff budget" at the end would make another exogenous constraint and may be a textbook crowding/monitoring-capacity comparative static.

**Non-novel algebraic identity** illustrating trivial combination:
Hwang's marginal buyer procurement rule (interior):
x*= (αΔ+b−δ−p)/(γ α²σ²), clipped [0,1].
Hwang's supplier IR: p*= (k+(1−θ)ρ)/θ.
Asseyer selects monitor action m∈{none,shock,investment} maximizing Π_m−C_m. Replacing fixed σ² with σ²(e) for staff verification effort e at convex cost C(e) creates a generic maximization/FOC; **alone** no new economic mechanism or proof. A SymPy code file verifies these identities and the payoff ordering only; not a journal-theorem derivation.

## 6. Stage 1 negative novelty verdict and honest limitations
**NO-GO for current Stage0 C-BUYER-INFO-IMPLEMENTATION.** The strongest opponent is **Asseyer 2018**, not merely Hwang 2024. Theilen 2009 and Baron–Besanko 1987 independently preempt endowed/contracted monitoring incentives and precision. A "three-sided government officer and innovator with finite monitoring hours" model is a combination of already-solved contract frictions until a concrete nonabsorbed proposition is specified. No model construction/Stage2 originality certification/Stage3/Stage4 authorized.

This verdict is about the **specific proposed paper** and failure to identify a defensible new theorem; NOT a claim that all municipal innovation procurement problems are fully solved. Theilen (2009) full equations and Hwang JPG Prop2 exact coefficients were not readable in this pass, and Asseyer 2018 final mathematics not completely accessible; these evidence limits mean one cannot prove exact mathematical equivalence of full articles. They are sufficient to kill the SIMPLE proposed mechanism given its current novelty unit.

Future new Stage0 should select ONE particular *proposition* from a verified original parent, rather than bolting monitoring onto Hwang; original 2015 Asseyer monitoring-cost substitution theorem or Hwang Prop2 principal risk-sharing could be valid NEW source anchors, but a genuinely new economic question and falsifiable welfare consequence must be proposed at that time. Do not reopen generic staff-constraint theme automatically.

## 7. Source/provenance register
2026-10-10, OpenAI GPT-6: published Hwang primary HTML model/Prop1/Prop2 explanatory text; Asseyer 2015 ORIGINAL full 35pp paper text and screenshots p6/p12/p19, and 2018 publisher final summary/sections; Theilen 2009 original abstract; Baron–Besanko 1987 Stanford working paper abstract; Rodivilov 2022 GEB publisher abstract+intro; IJIO Chiappinelli 2025 review full publisher view and earlier open PDF; and IJIO Iossa-Martimort 2016 original abstract. All author's future primary-source checking and independent human referee verification pending. Symbolic microcheck (algebra only) run by Python/SymPy separately. No journal-selected novelty, equilibrium theorem, new contract, empirical work or theoretical freeze.
