# Post-JRS substantive revision — Stage 0 REFRAME after Stage-3 re-entry NO-GO

**Date:** 2026-10-10 JST  
**Stage / canonical verdict:** `STAGE 0 REFRAME — GO TO AUDIT` (strictly **one bounded diagnostic-theory re-assessment**, not approval to resubmit).  
**Workflow:** `ryotamatsuki/research-paper-workflow main@0642846709f006bab9e387c80bd83cdf4db52460` (v2.9 candidate, no formal v2.9 release claimed).  
**Historical model:** `IPCRVC-THEORY-FREEZE-2026-09-07-v1`, unchanged; Lean certification preserved only within prior proved scope.  
**JRS:** original manuscript 1758654 desk rejected 2026-10-10, **not R&R**. No new journal selected or submission authorized.  
**Cause of re-entry:** [Stage-4 A1 NO-GO](STAGE4_A1_NO_GO.md) and [Stage-3 re-entry NO-GO](STAGE3_REENTRY_AFTER_A1_NO_GO.md).  
**Distinct reframe register:** [STAGE0_REFRAME_CANDIDATES.md](STAGE0_REFRAME_CANDIDATES.md).

## 1. Executive research decision

**Prioritize preservation and editorial reassessment of the frozen two-region theory as a SHORT, NARROWLY DIAGNOSTIC analytical paper**, rather than inventing another correction instrument after two failed revision searches. The core value hypothesis is an exact portfolio-composition equilibrium/planner **regime characterization**, not a new fiscal-externality mechanism or an implementable policy instrument. This is the *same result*, reframed for an audience willing to publish sharply bounded mathematical diagnostics.

**GO TO AUDIT** is justified solely because a certified nontrivial fixed-capacity equilibrium characterization exists, the paper has a specific falsifiable source-comparison question, and a plausible short-theory publishing format exists. It does **NOT** imply the result meets a journal's originality/importance threshold, that the previously submitted wording can be reused unchanged, that a specific editor will value an unimplemented planner benchmark, or that a manuscript can be shortened without preserving all assumptions.

**High-risk issue:** JRS explicitly considered the model too abstract and lacking a practical internalization solution. A shorter manuscript *does not fix this substance*. The necessary Stage-1/2 gate is whether a shorter **diagnostic-only** claim has a non-cosmetic paper-level reason to exist relative to classical fiscal spillovers, expenditure-composition games and related industrial-policy models. If not, choose `NO-GO FOR JOURNAL RESUBMISSION` even though the math is correct. The plan is not to search for a lower-prestige journal that will overlook the objection.

## 2. Phenomenon vs. explanation, agents and economic boundaries

**Theoretical phenomenon, not observed fact:** Within a simple two-region, two-activity complementarity game, all regional governments can locally prefer to prioritize the same upstream sector even though allocating fixed total policy capacity to complementary sectors across regions is more productive.

**Explanation within the frozen model:** fixed normalized local policy capacity; direct premium `Delta>0` to U; vertically complementary across-jurisdiction U–D output `A>0`; income capture share `alpha∈(0,1)` from upstream factor; governments maximize local real modeled surplus, not aggregate surplus; directional matching given exogenously. These are maintained assumptions, not estimated facts.

**Actors/choices:** two local governments simultaneously choose `x_i∈[0,1]` capacity share for U; D gets `1-x_i`. There is no central grant authority, bargaining, endogenous total spending, private information, private firm location, project formation or legal implementation stage. These absences are **core limitations**, not unmentioned robustness claims.

**Frozen payoff:**
```text
W_i(x_i,x_j) = b_D + Delta*x_i
 + alpha*A*x_i*(1-x_j)
 + (1-alpha)*A*(1-x_i)*x_j.
```

**Direct implication, exact restricted wedge:**
```text
Delta < A < Delta/(1-alpha)
Nash = (1,1) uniquely;
planner fixed-capacity maximizers = (1,0) and (0,1);
joint real welfare gap = A-Delta>0.
```

This is a **conditional theoretical inefficiency**, not proof that any observed local government has chosen the wrong industry or that these precise alternatives are legally/politically implementable. Cobb–Douglas competitive input returns are mapped to host-jurisdiction income by a separate incidence assumption. The planner is *constrained by the same two regional capacity budgets and matching technology*, not unrestricted first best.

**One-sentence falsifiable economic question for this reframe:**

> Under what complementary-production and local benefit-incidence conditions does a two-region game of **fixed-capacity industrial-policy portfolio choice** generate unique identical regional priorities despite a strictly welfare-preferred differentiated allocation?

This question **already has a mathematical answer in the frozen model**. The *publication contribution* remains a distinct unresolved question: does its complete regime correspondence materially advance understanding beyond available parent theorems, or is it a didactic special case? Both must be kept separate. Its novelty is falsifiable by an isomorphism/theorem-absorption proof using old spending-composition or fiscal-externality results.

## 3. Five materially different routes considered (no manufactured extension)

| ID | Research object and route | Novel result/evidence needed | Stage-0 disposition |
|---|---|---|---|
| F01 Diagnostic short-form theory | Original two local governments, fixed capacity, complementarity and capture, **no new actor/instrument**; distill precise thresholds, globally correct boundary regions and welfare | Nearest published game/theorem must not make exact characterization a trivial relabeling; paper-level editorial value must survive despite no implementation | **PRIMARY GO TO AUDIT** |
| F02 Expository / educational working paper | Same result as F01 but openly label as an instructive example and open replication note, not claim original discovery | No journal-level novelty required if unpublished working paper/tutorial; intellectual usefulness/documentation only | **FALLBACK if F01 fails publication-value test**; distinct objective, not a second journal-paper route |
| F03 Source-anchored descriptive institutional mapping | Actual national/interregional innovation program rules, eligible costs, consortium participants and sector/project overlaps | Authentic institution data and definitions; no counterfactual causal claim or mapping of (A,\Delta,\alpha) without support | **SEPARATE future descriptive project**; do not append to F01 simply to decorate |
| F04 Empirical test of regional priority duplication | Cross-region policy budget by **comparable upstream/downstream activities**, link incidence, exogenous incentives or timing | Identifiable panel, observation of portfolio shifts, credible causal design with interference/spatial spillovers and a defensible counterfactual | **SEPARATE empirical hypothesis**, currently NO data feasibility/identification confirmed |
| F05 Policy design evaluation of implementable coordination | One real named legal instrument/contract/conditional co-funding rule, actors and liabilities | Source-backed agent/instrument/participation constraints and independent effect on incentives/roles; a true new mechanism and prior-art audit | **SEPARATE theory/mixed project only with new evidence**; former H01/H02/H03/A1 results cannot be revived by renaming |

**Structural deduplication:** F01 and F02 share the *same mathematical content* and **must not count as two scientific contributions**. F03 is descriptive institution mapping, F04 is causal empirical analysis, and F05 is mechanism/institution design. Candidate details, source maturity and exact reopening budgets: [register](STAGE0_REFRAME_CANDIDATES.md).

## 4. Prior-art/editorial threat map (historical, needs refreshed source-depth audit)

1. **Fiscal competition and expenditure composition**: Keen & Marchand (1997) and Kikuchi, Kuzawa & Tamai (2026) study allocation of government spending across categories. The mere fact `x_i+(1-x_i)=1` is not an original mechanism.
2. **Decentralized government cross-region spillovers**: Oates and broader fiscal federalism, and classic local public-goods games. Underinternalized externalities are standard.
3. **Industrial policy with strategic multi-sector choice**: Chen & Li (2026); Wang et al. (2024), identified in [Stage-11 source audit](../../docs/STAGE11_REPORT.md). A specific closed-form threshold can still be a weak specialization rather than an independent paper.
4. **Efficient correction mechanisms**: central matching grants, endogenous side payments, coalition bargaining and network formation are well established. Stage-2 and A1's Stage-4 failure demonstrate that adding a generic institution does not repair paper-level contribution.
5. **JRS editorial decision**: its criticism is fully carried forward. F01 consciously narrows what it promises and accepts that some journals may insist on a feasible implementation mechanism.

**Next audit must use full original parent equations/propositions and record exact citation/sections and reading depth**, not just titles/abstracts or claims of no exact paper title. It must map the two-player game stripped of industry labels to known strategic-substitute/anti-coordination, fixed-budget public-expenditure-composition and local public-goods models. Identify whether the global Nash/planner threshold separation is a direct general result under parameter renaming. If so, F01 should not be sent as a journal-originality claim.

## 5. Publishing-format reconnaissance: verified at Stage 0, NOT journal selection

### Letters in Spatial and Resource Sciences (LSRS): short-theory scope-check candidate

Publisher's official [journal overview](https://link.springer.com/journal/12076) explicitly welcomes shorter new theoretical/empirical results with a spatial dimension, including regional economics and regional resource allocation. Official [submission guidelines](https://link.springer.com/journal/12076/submission-guidelines) say **letters generally should be under 10 printed pages**; manuscripts exceeding this may be considered only at editorial discretion. Double-blind review and editable source files required. Official [publication options and fees](https://link.springer.com/journal/12076/how-to-publish-with-us) confirm **hybrid model** and **subscription route with no APC**; elective OA has an APC (official page lists USD 3390 at lookup; reconfirm at acceptance and note other publication/colour/service charges may need checking). **No claim of guaranteed zero total cost or acceptance**.

**Preliminary fit:** a better *format* match than a large policy paper, but a potentially severe *editorial-value* mismatch if the regime theorem is routine or fails to explain feasible coordination. Treat as **first specific format/journal to audit**, not a nominated submission.

### The Annals of Regional Science: conservative neighboring full-paper fallback

[Publisher journal overview](https://link.springer.com/journal/168) and historic Stage-12 positioning suggest broad regional-science relevance; existing paper's abstractness/novelty is still an issue. Whether it offers an appropriate note category and subscription/no-APC choice must be confirmed at Stage 1/12, not inferred from LSRS policy.

### Regional Studies, Regional Science: short-paper option but fee caveat

[Regional Studies Association journal page](https://www.regionalstudies.org/publication/regional-studies-regional-science/) confirms short papers and interdisciplinary regional science, but **gold open access** with an APC subject to waivers/discount eligibility. This is **not** an assumed no-fee backup. Recent publisher [journal page](https://www.tandfonline.com/journals/rsrs20) confirms OA charges.

### Papers in Regional Science / Regional Science Policy & Practice: current APC exposure

[Regional Science Association International](https://regionalscience.org/) reports both Gold OA with headline APCs **USD 2,740 PiRS**, **USD 1,596 RSPP**, subject to institutional agreements, editorial waivers and membership benefits. Not automatic zero-fee destinations. RSPP's practical-policy orientation also may exacerbate absence of a *could/should* implementation result.

**Stage-0 publication decision:** no acceptance-rate estimates, no fee claims about unverified journals, no fabricated short-communication acceptance, **NO specific submission journal selected**. For an actual paper, perform Stage-1 format/fees/fit audit, then rigorous Stage-2 closest-theorem re-kill, and only then manuscript shortening and formal Stage-12 positioning; do not bypass workflow because prior JRS Stage 12 is historical.

## 6. Candidate short paper's editorial-value statement and its adversarial rebuttal

**Provisional, defensible claim, provided Stage 2 confirms distinction**:

> With each region facing a binding *composition*, rather than spending-level, constraint, a precise interval of complementary cross-region production admits a unique duplicated regional priority even though the same fixed capacity would yield higher joint welfare when differentiated; the full continuous action and boundary-equilibrium cases are characterized exactly.

**NOT claimed:** first theory of policy externalities, original phenomenon of spending-composition distortion, general policy intervention, real regional duplication data, empirical validation, or an unbounded first-best theorem.

**Skeptical editor:** A generic 2-player anti-coordination game and a constrained planner naturally have distinct thresholds. The existence of a positive measure wedge is elementary once payoffs are affine and spillovers uninternalized, and a familiar result in public expenditure composition. Shortening and switching to a more accommodating journal do not make this a new scientific insight. Real policymakers cannot implement the benchmark simply by being shown it.

**Falsification criterion:** if nearest published general game reproduces the same BR/unique duplication/planner wedge via a trivial specialization, or if two short recent LSRS theory papers already provide stronger/less abstract contributions than this with no meaningful editorial value case, **NO-GO** F01. Then F02 can remain a transparent research note, or F03–F05 can become genuinely separate projects given data/institutions, but not an unapproved journal manuscript.

## 7. What makes the institutional phenomenon researchable (but is NOT yet verified)

To pursue F03/F04/F05 separately, require government budget and industrial classification crosswalks (an actual upstream/downstream split, not generic "innovation"), policy priority changes before/after coordination, cross-region input-output/ownership/incidence and value-chain links, consortium/funder eligibility and contracts, data temporal coverage, and explicit treatment of spillovers across regions when choosing an empirical counterfactual. OECD place-based industrial policy and EU I3 descriptions in [original Stage-0 report](STAGE0_IDEA_INTAKE.md) are a starting-point **policy motivation**, not evidence the frozen wedge is present or causally identified.

## 8. Exact Stage-1 handoff and stop budget

**Stage 0 verdict: `GO TO AUDIT` (F01 ONLY).** The Stage-1 task is now a **source/math/editorial audit** of the certified original paper under a diagnostic-only, maximum-10-printed-page *hypothesis*, not automatic Stage 2/12 passage.

The bounded Stage-1 work package must:
1. Confirm frozen original theorems, theorem-coverage caveats and exact limits (mostly inherited and source-reproduced; **no new Lean certificate claimed**).
2. Read the strongest application-neutral parent math, focusing **at most 6 full original papers**: Keen & Marchand (1997); Kikuchi, Kuzawa & Tamai (2026); nearest fiscal local public-goods full-text parent; and 2–3 industrial-policy fixed-budget/spatial theory neighbors as Stage-11 record supports. For any inaccessible article, record `SOURCE DEPTH INSUFFICIENT` rather than claiming absence of absorption.
3. Test one actual journal issue's 2–3 recent *short pure theory* pieces if available; check why this theorem is (or is not) field-relevant, not merely technically correct. Run LSRS fee/page scope check against current official guidance and inspect current recent content.
4. Produce a **counterfactual 8–10 printed-page outline**, not new manuscript: old theorem and assumptions, one graph/table if warranted, policy interpretation explicitly diagnosis-only, appendix/proof location/constraints. Length is a plan, not a claim the current PDF fits.
5. Give a hard decision: if F01 has no distinguishing result or cannot form an editor-facing two-sentence contribution statement despite already certified math, `NO-GO` for journal resubmission. Do not continue to a new lower journal merely because it is cheaper.
6. Preserve JRS decision, original submitted PDF/TeX, old freeze, original Lean proofs, and all failed A1/reentry reports. F01 is **an editorial/research interpretation lane**, not the substantive extension that was killed.
7. Stage 2 only if F01 survives Stage 1; perform explicit theorem-absorption audit. Independent journal-positioning Stage 12 later; no declaration of LSRS as first target now.

**Stop budget:** one Stage-1 source audit over <=6 major theory parents and <=3 short recent comparison articles, **no new game/calibration/empirical data acquisition**, no automatic repeated mechanism-idea search. If no satisfactory editorial case emerges, record NO-GO rather than expand scope.

## 9. AI provenance and author's responsibility

Material assistance used: GPT-6 (ChatGPT), connected GitHub for historical files/workflow, public web search for 2026 journal scopes/fees, source synthesis and selection framing. Sources/limits documented within sections and [candidate register](STAGE0_REFRAME_CANDIDATES.md). AI-generated journal-fit and novelty assessments are provisional; no independent referee endorsed F01 and no external editor pre-cleared it. The author has authorized this Stage-0 reframe through “next stage” following explicit Stage-3 route; **no specific publication target, novel claim, author signoff or new submission authorized**. Existing [AI provenance](STAGE0_AI_PROVENANCE.md) should append this record in subsequent stages, not overwrite history.
