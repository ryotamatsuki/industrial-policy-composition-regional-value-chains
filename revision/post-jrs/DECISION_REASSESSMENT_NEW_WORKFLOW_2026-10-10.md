# Post-JRS (2026-10-10): Revised theory-workflow decision memo

**Verdict: CONDITIONAL GO for ONE bounded major-revision feasibility test; NO-GO for immediate paper rewrite or unchanged resubmission; STOP current manuscript if the test fails.**
This is NOT a new proven result, editorial invitation, source-exhaustiveness assertion, journal targeting, or mathematical Stage4 permit.

## 1. Exact editorial diagnosis
Original Gmail Oct 9 2026 editor Dr Florian Mayneris, Journal of Regional Science manuscript 1758654. Decision not sent to reviewers. Editor described industrial policy as important and relevant but original submission "quite abstract", noting an externality not internalized in decentralized equilibrium; it did NOT address "what should and could be done, practically, to internalize it". Editor characterized choice as editorial, not a proper quality review.
Implications: thematic importance affirmed; applied-institutional implementation is missing; mathematical error NOT asserted; NOT an R&R or invitation.

## 2. Original frozen main reviewed
Main THEORY_FREEZE and published-submission TeX, sections and proofs on GitHub main checked. Two governments have fixed industrial policy capacity; x_i upstream share and 1-x_i downstream, with
W_i=b_D+Delta*x_i+alpha*A*x_i*(1-x_j)+(1-alpha)*A*(1-x_i)*x_j.
Delta>0, A>0, alpha in (0,1). Unique (1,1) Nash in Delta<A<Delta/(1-alpha) while coordinated constrained planner selects (1,0) or (0,1). Nash transition A_N=Delta/(1-alpha), planner A_P=Delta; loss A-Delta. Original formal Lean/results validated in past workflow, not independently re-proven now. Full-payoff base static, two regions, complete information, no endogenous transfers/institutions, government finance, firm entry, contract verifiability or legislative competence. Present paper explicitly avoids claiming first-best and says choice of centralization/transfer arrangements is beyond current theorem. Editor complaint applies precisely to this missing second institutional stage.

## 3. Obvious compensation is a useful illustration but not yet new theory
In the duplication wedge, a move (1,1) to (1,0) makes the downstream region lose Delta-(1-alpha)*A and upstream region gain alpha*A relative to duplication. Feasible role-contingent payment t from upstream to downstream satisfies
Delta-(1-alpha)*A < t < alpha*A.
This interval exists exactly when A>Delta. This **has already been analytically demonstrated** in repo post-JRS H01 pilot and is a basic aggregate-surplus compensation calculation. For a restricted finite one-proposer/one-veto/one-exclusive binding contract, earlier case Delta=1,A=1.5,alpha=.5,t=.3 yields after-transfer 1.45,1.05 vs original 1,1 normalized, as repo records. NOT a general voluntary contracting equilibrium; credible promise, authority, financing, and off-path cases matter.
Thus adding elementary payments to address editor is legitimate economic interpretation but likely NOT an independent theoretical contribution sufficient for a full field-journal paper.

## 4. Cross-field frontier and adverse original papers checked
- Gregor & Stastna 2012 *Review of Economic Design*, DOI https://doi.org/10.1007/s10058-012-0113-y: 2-district complementary public inputs; decentralization/centralization, delegation, voluntary interdistrict input contributions, costs. Original abstract verified; final published mathematical propositions NOT exhaustively inspected. **Strongest direct novelty obstacle**.
- Hindriks & Myles 2003 *Journal of Public Economic Theory*, DOI https://doi.org/10.1111/1467-9779.00131: interregional transfers with policy competition, timing/precommitment and possible zero/inefficient transfers already. Original abstract and older working-paper audit in repo.
- Gregor 2015 *Journal of Economic Behavior & Organization*, DOI https://doi.org/10.1016/j.jebo.2015.06.017: complementary task division with voluntary monetary gifts, original publisher text.
- Jackson & Wilkie 2005 *Review of Economic Studies*, DOI https://doi.org/10.1111/j.1467-937X.2005.00342.x, 2013 Theorem5 erratum: unrestricted preplay side-payments. Previous repo H01 audit corrects unwarranted extension of finite-action theorems to all unrestricted continuous-action transfer functions. Preserve caveat.
- Suga Yanase Tawada, *Scandinavian Journal of Economics* vol128(3), July2026, DOI https://doi.org/10.1111/sjoe.70007, published abstract: ex ante symmetric government input policies yield endogenous asymmetric industrial comparative advantage; extensions to trade costs, upstream IO. Direct prior to newly claiming endogenous specialization of firms due to government competition. Published final full theorem not yet audited.
- Lin Chen & Li Yuxiao 2026, *Frontiers of Economics in China*, DOI https://doi.org/10.3868/s060-021-026-0001-8, original publisher abstract: industrial subsidy competition in quantitative spatial GE; central-vs-local ranking affected by market integration. Published full theorem not yet audited.
- Albertone & Lebdioui 2026 Oxford TIDE Working Paper 96, https://oxford-tide.org/2026/05/21/working-paper-96-the-regional-coordination-of-industrial-policy/ : voluntary coordinating information broker addresses overlapping sector priority and interregional specialization. Working paper/institutional model, NOT verified peer-reviewed final.
- Pylak Deegan Broekel 2025 *Regional Studies*, DOI https://doi.org/10.1080/00343404.2024.2429626: published empirical study finds regional S3 policy priority mimicry, including neighbouring/national policy strategies. **Motivation not a theorem**.
- Fajgelbaum & Gaubert, NBER WP33517 2025 and 2026 published book, https://www.nber.org/papers/w33517 : spatial targeting, labor subsidy externality corrections, limits of infrastructure as first-best substitute; second-best policies not categorically unexplored.
- OECD Industrial Policy Handbook 2026 https://www.oecd.org/en/publications/industrial-policy-handbook_ff099713-en.html: instrument design, failure diagnosis, administration, coordination across levels, feasible intervention and evaluation. **Institutional relevance, NOT theorem novelty**.
- OECD 2025 *Place-based industrial policy* DOI https://doi.org/10.1787/43edc0df-en : local-national coordination and local capability.
Repo previous 25-source frontier and 15-source H01 audit were checked and retained as negative controls. Some new references are only original abstracts; no exhaustive theorem equivalence claimed.

## 5. Compare actual courses of action under NEW staged, extension-friendly economics-value criterion
### Route 1. Short note from current baseline (F01)
Preserve already proved model, explain compensating transfer interval, compare to existing local public goods work, strengthen economics. **Pros:** low mathematical cost, model exact. **Cons:** implementation exercise may be immediate corollary and no fresh journal theory; JRS objection about practical HOW only partially addressed. **Verdict:** not recommended as primary full-length journal resubmission; a note/letters format is a secondary option after full originality audit.

### Route 2. Substantive MAJOR REVISION with economic-policy implementability as new core
Retain original baseline as exact nested case, but study **one** credible government-coordination institution/instrument (not arbitrary full-game architecture) accounting for local spending authority, genuine budget, incentives and observable outcomes. Accept valid contribution routes: G a meaningful generalization; B an economically important sharp implementation/failure boundary or counterexample; W a new policy ranking or equilibrium/welfare result in a known mathematical model class; U a meaningful unification that yields new conditional result. NEW mechanism not mandatory, yet **re-deriving a familiar transfer interval is NOT sufficient**.
Concrete Delta Card (UNPROVED): Can a specific constrained, legally credible, mutually acceptable grant/compensation/coordination scheme implement role differentiation in a nontrivial parameter domain, and does its policy ranking relative to unilateral/national alternatives change when one government cannot directly transfer/fund every role? Need locally relevant funding and verifiability restrictions and original actor outside options.
**Novelty warning:** Gregor Stastna 2012 and Hindriks Myles 2003 may already prove this class of answer. Need direct full theorem mapping first.
**Verdict:** CONDITIONAL GO for source-proposition audit plus ONE economical math/counterexample probe only; NO blanket GO to write a new manuscript.

### Route 3. STOP original journal manuscript; fork another industrial policy theory question
If Route2 probe yields only known fiscal-public-goods result, stop trying to extend the original two-region U-D paper into a full field-journal theory article. Freeze original model/Lean/negative experiments and use as working knowledge, not a failed-math retraction. Start clean from 2025/2026 economics source limitations, choose a different economic question on municipal innovation/industry policy; no random extra game parameter to save original theme.
**Verdict:** preferred FALLBACK, not immediate first choice.

## 6. Binary operational conclusion and abort contract
At present: **Do NOT immediately stop all research, but DO NOT start major TeX rewrite yet**. Authorize at most ONE bounded source-theorem and economically meaningful feasibility study. If one specific previously-unproved credible implementation/coordination/generalization result survives close paper proofs, GO to MAJOR RESTRUCTURE effectively new paper, complete Stage0-6 later under PR25 workflow. If not, **STOP existing manuscript as publication vehicle**; do not resubmit unchanged or simply add side-payments. Existing original Stage3 A1 and H01 NO-GO for their exact claims are not silently reversed.

### Minimal next action
1. Resolve Gregor–Stastna 2012 original source theorem on contributions and cost-sharing; Hindriks–Myles timing; H01 2013 erratum caveat.
2. One Applied Theory Delta Card only: exact instrument, cash sourcing, enforceability, IR/veto, timing and full best response, and **unproved novel economic conclusion** meaningful to regional economic policy. A mere ability to find t inside the existing Pareto interval is insufficient.
3. One smallest closed-form/counterexample diagnostic, prove or refute claimed policy ranking and source non-absorption. No case data or empirical project. Strict stop if no substantive economics beyond known theorem.
4. Major-revision title/structure/journal consideration only AFTER that evidence; preserve current main/frozen theory unchanged.

## 7. Why updated approach is actually different
Reject letter FIRST; exact old policy dilemma and payoff SECOND; primary rival economic theorems before modelling THIRD; permit a bounded source-grounded G/B/W/U hypothesis without requiring a new type of mathematical game; then strict actual-result theorem/field-editor reevaluation. Separate economic-theory merit, local industrial policy fit, mathematics feasibility, and editorial policy implementability. Earlier exploratory work too often tried new game ingredients OR killed extensions by source-genre analogy without proof-level comparison; new screen requires result-level absorption mapping before definitive claim-specific NO-GO.

**Source limitations:** no primary JRS reviewer reports (desk rejection); Gregor 2012 final theorem unavailable in current pass; 2026 Suga and Lin full math not checked; editor email original exact text confirmed via Gmail. All novel result ideas HYPOTHESES. No mathematical research conducted or new theorem proved in this memo.
