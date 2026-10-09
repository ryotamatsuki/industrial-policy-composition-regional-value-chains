# Post-JRS Revision — Stage 2: Literature Frontier / Novelty Kill Gate

**Date:** 2026-10-10 (JST)  
**Canonical Stage-2 verdict:** `GO TO MECHANISM SEARCH` — **qualified mechanism-hypothesis survival, not certified theorem novelty**.  
**Scope:** priority candidates H01, H02, H03, H06, H07 from [Stage 0](STAGE0_CANDIDATE_REGISTER.md) and [Stage 1](STAGE1_SOURCE_MATH_AUDIT.md). H04/H05/H08 remain deferred, not killed.  
**Workflow:** `ryotamatsuki/research-paper-workflow main@0642846709f006bab9e387c80bd83cdf4db52460`, v2.9 candidate.  
**Frozen benchmark:** `IPCRVC-THEORY-FREEZE-2026-09-07-v1`, unchanged.  
**Paper type:** substantive follow-on revision following JRS's Oct 10 desk rejection, NOT an invited R&R.  
**Evidence caveat:** Public journal primary records and full accessible Ohsawa–Yang (2022) article; full six-page Hideshima–Kobayashi (1998) PDF inspected in original; many major paywalled articles only title/abstract/preprint metadata or author-repository summary, explicitly identified below. **No candidate is declared theorem-novel based on inaccessible proofs**.

## 1. Decision and strongest skeptical editor conclusion

**Kill main-contribution claims** based only on (i) a transfer that selects a pre-identified efficient portfolio; (ii) Pigouvian/matching co-financing correcting standard spillovers; (iii) assigning the original planner's objective to a joint body; (iv) attaching a network label or partner search to exogenous matching; and (v) heterogeneous opportunity costs plus a simple fiscal transfer ceiling. These are existing mechanisms or trivial applications of broader models.

**Retain two bounded paths for Stage 3 architecture search, not as proved novelty:**

- **Path A — interaction candidate H02 × H06:** feasible, centrally funded interregional project/match formation **and** regionally constrained industrial-policy composition are distinct decisions. The hypothesized nontrivial feedback is `portfolio choices → which cross-region links/project matches are viable → grant eligibility/awards and realized value-chain surplus → portfolio incentives`. The Stage-3 kill test is whether making links endogenous simply replaces `A` by a parametric `A_eff`, producing no new equilibrium or welfare result. Specific new result and proof **UNRESOLVED**.
- **Path B — conditional H03 governance alternative:** governments endogenously participate in a project-governance/role-assignment agreement, subject to actual member rights, veto or exit and externality-bearing portfolio decisions. Stage 3 must distinguish participation and rule selection from solving the old planner problem under a new name. Veto rights are a *hypothesis*, NOT verified I3 rules. Prior voluntary-coalition studies are close.

H01 may remain a **benchmark implementation instrument**, and H07 only a **diagnostic margin nested within a survivor**, if and only if it adds new strategic feedback. The revised research question is not automatically answered merely because a contract/grant can be written into payoffs.

**Canonical GO justification:** There is a concrete *candidate full-game distinction* from each best-inspected parent class: H02's central policymaker funds public input **levels** with taxes, H06's parent works on endogenous **links** without an industrial-policy portfolio/grant authority, whereas the hypothesized interaction uses both **portfolio composition and partner-match formation** with funding attached to viable complementary projects. This makes Stage-3 mechanism search worth a bounded attempt; it is NOT a conclusion that no broader prior theorem can absorb the as-yet-unsolved full model.

## 2. Application-neutral canonicalization

Frozen local payoff (drop fixed `b_D`) for 2 players choosing `x_i∈[0,1]`:

```text
W_i = (Delta + alpha*A) x_i + (1-alpha)*A*x_j - A*x_i*x_j
BR own-slope = Delta + alpha*A - A*x_j.
```

Thus baseline is an **affine strategic-substitutes / bilateral anti-coordination game on a square**. The welfare objective is **bilinear**; its planner chooses complementary roles at the two asymmetric corners if `A>Delta`. These generic forms, *without industry vocabulary*, expose why price-like incentives, corner role assignment and misalignment between Nash and planner are weak standalone novelty units.

Instrument/candidate game fingerprints:

| ID | Actors / endogenous moves / timing | Generic parent class | Exact hypothesized difference requiring an actual theorem |
|---|---|---|---|
| H01 | 2 players, voluntary preplay strategy-contingent transfers, then continuous actions | Normal-form endogenous contracting, side payments, mechanism design | Composition-specific nonstandard contract constraint might create distinct participation/equilibrium selection; **not shown** |
| H02 | Grant authority sets eligibility/rates, then local portfolios; financing/consortium beneficiaries explicit | Multilevel principal–agent, matching grants, fiscal federalism | Grants target *complementary match projects and composition*, not provision quantity alone; **not shown** |
| H03 | Two governments choose/enter collective role assignment with veto/participation, then portfolios | Coalition formation, club/public-goods bargaining, voting | Novel participation rule creating differentiated role commitments rather than old planner's fiat; **not shown** |
| H06 | Cross-regional links/project partners and local capacity portfolios are jointly endogenous | Pairwise stable network, directed-link noncooperative formation, matching/production networks | Link feasibility feeds back into regional priority portfolio and vice versa; **not shown** |
| H07 | Asymmetric `Delta_i`, feasible fiscal transfers `B_i`, role allocation | Assignment with limited transfers, liquidity-constrained matching | Coupled role choice and *endogenous* compensation/grant constraints; standalone ranking/ceiling result **trivial/known-class** |

Potential H02×H06 restrictions for future **Stage 3**, not imposed now: exogenously set links → an H02-like grant/portfolio problem; no central grant → H06-like link/portfolio interaction; exogenous partner mass → baseline fixed matching. One must show some full-game result **unavailable** under each restriction, with a source-checked parent-theorem comparison before adoption.

## 3. Source-verified closest-paper ledger, scope and reading depth

Use year of final publication; working-paper dates deduplicated. `M` = full accessible model/equations inspected; `P` = the actual original PDF's setup/theorem exposition inspected; `A` = official journal/repository title/abstract and bibliographic metadata; `R` = independent author/repository extended abstract. **A/R cannot justify positive theorem-level non-absorption.**

| Prior work and stable source | Closest candidate | Model/result actually observed | Reading depth and remaining boundary |
|---|---|---|---|
| [Keen & Marchand (1997), *Fiscal Competition and the Pattern of Public Spending*, JPubE 66:33–53](https://doi.org/10.1016/S0047-2727(97)00035-2); [RePEc](https://ideas.repec.org/a/eee/pubeco/v66y1997i1p33-53.html) | Baseline/H02 | Public-expenditure **composition** distortion under capital mobility; coordinated shift between public goods and productive inputs at unchanged tax rates | `A`; original already acknowledges this literature. Different production/matching portfolio is not automatically a new spending-composition theorem |
| [Pfingsten & Wagener (1997), *Centralized vs. Decentralized Redistribution*, ITPF 4:429–451](https://doi.org/10.1023/A:1008656830324) | H01 | **Necessary and sufficient** conditions for interregional transfers implementing efficient decentralised allocations as Nash equilibria in a redistribution game | `A` via publisher/RePEc; full model/propositions not accessible in this pass; forbids general “transfers implement efficiency” novelty |
| [Jackson & Wilkie (2005), *Endogenous Games and Mechanisms: Side Payments Among Players*, REStud 72:543–566](https://doi.org/10.1111/j.1467-937X.2005.00342.x); [Caltech author record](https://authors.library.caltech.edu/records/qn3rf-nmc24) | H01/H03 | Binding, **strategy-contingent preplay** transfer offers; endogenous contracting can lead to inefficient outcomes despite complete information | `A/R`; attached author PDF identified but file fetch blocked; precise full theorem mapping remains open |
| [Harstad (2007), *Harmonization and Side Payments in Political Cooperation*, AER 97:871–889](https://doi.org/10.1257/aer.97.3.871) | H01/H03/H04 | Two-region bargaining under **private information**; policy differentiation/side payments create conflicts and bargaining delay | `A`; its private-information structure differs from frozen complete info |
| [Ogawa & Wildasin (2009), *Think Locally, Act Locally*, AER 99:1206–17](https://doi.org/10.1257/aer.99.4.1206) | H01/H02 | Heterogeneous jurisdictions plus mobile capital; certain spillover equilibria already efficient **without** corrective transfers | `A`; counters any universal “externality implies grant necessary” assertion; full PDF subscription restricted |
| [Armbruster & Hintermann (2020), *Decentralization with porous borders*, ITPF 27:606–642](https://doi.org/10.1007/s10797-019-09572-7); [Unibas source](https://edoc.unibas.ch/entities/publication/63a17677-82fa-401d-b45e-04506fbef9a3) | H02 | Federal+regional government game with fiscal and technical spillovers; timing of federal commitment changes the efficacy of transfers/matching grants | `A/R`; 2019 WP is the same research lineage, not separate novelty; journal full text restricted |
| [Ohsawa & Yang (2022), *Productive effects of public spending, spillovers, and optimal matching grant rates*, HSS Communications 9:366](https://www.nature.com/articles/s41599-022-01378-z) | H02 | `n` symmetric jurisdictions, local `g_i`; utility spillover `beta`, production spillover `gamma`; central rate `m` and tax `h` in **stage 1**, local `g_i` and tax `z_i` in **stage 2**, with exact central balanced-budget condition | **`M` full-text Eq. (1)–(9), Proposition 1**. Strongest directly inspected fiscal-grant threat: generic grant rate and even differences between consumption/production spillovers are already worked out |
| [Hideshima & Kobayashi (1998), *Endogenous Coalition Formation for Local Public Goods Provision*, City Planning Review 33:19–24](https://doi.org/10.11361/journalcpij.33.19); [J-STAGE full PDF](https://www.jstage.jst.go.jp/article/journalcpij/33/0/33_19/_pdf/-char/ja) | H03 | Local government coalition membership chosen endogenously; coalition public-good supply; voluntary participation and stability/coalition-proof refinements | **`P`** six-page original PDF; relevant equations and join/exit conditions inspected on p. 3; not a vetoed sector-role project game |
| [Jackson & Wolinsky (1996), *A Strategic Model of Social and Economic Networks*, JET 71:44–74](https://doi.org/10.1006/jeth.1996.0108) | H06 | Pairwise link formation/severance, efficient network need not be stable; payoff allocation rules may support stability | `A`; full model/appendix paywalled |
| [Bala & Goyal (2000), *A Noncooperative Model of Network Formation*, Econometrica 68:1181–1229](https://doi.org/10.1111/1468-0262.00155) | H06 | Agents pay for directed links, access indirect benefits, strategic network topology and dynamic formation | `A`; author/full proofs not checked |
| [Liu (2019), *Industrial Policies in Production Networks*, QJE 134:1883–1948](https://doi.org/10.1093/qje/qjz024) | H06/H02 | Network input-output structure determines targeting incentives and distortion centrality in sectoral subsidy choice | `A/R`; theory uses network sector sizes and imperfections, not verified to solve jointly endogenous interregional cooperative project/portfolio game |
| [Kosec & Mogues (2020), *Public Investment Choices by Local and Central Governments*, WBER 34:S52–S57](https://doi.org/10.1093/wber/lhz010) | H02/H03 | Model+quasi-experimental evidence concerning devolved resource allocation across public services; agenda/sector prioritization already studied | `A/R`; no theorem-level equivalence established |
| [Chen, Deng & Ghosh (2010), *Competitive Equilibria in Matching Markets with Budgets*, arXiv:1004.2565](https://arxiv.org/abs/1004.2565) | H07 | Budget constraints can eliminate competitive equilibria/stable assignments in one-to-one matching | `A`; matching market has buyers/sellers, not two local governments' strategic portfolios |
| [van der Laan, Talman & Yang (2018), *Equilibrium in the Assignment Market under Budget Constraints*, CentER DP 2018-046](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3283074) | H07 | Cash-constrained assignment can change or destroy Walrasian equilibrium | `A`; no demonstrated exact mapping to local industrial-policy portfolios |
| [Kawase & Iwasaki (2018), *Approximately Stable Matchings With Budget Constraints*, AAAI 32](https://doi.org/10.1609/aaai.v32i1.11470) | H07 | Matching with contracts and a fixed wage budget can lack stable matching; approximate solution mechanisms | `A`; not fiscal federalism, but strongly undermines “budget blocks matching” as novel abstract mechanism |
| [Jalota, Ostrovsky & Pavone (2025), *Matching with transfers under distributional constraints*, GEB 152:313–332](https://doi.org/10.1016/j.geb.2025.05.002); [Stanford abstract](https://www.gsb.stanford.edu/faculty-research/publications/matching-transfers-under-distributional-constraints) | H07/H06 | Distributional constraints, transferable utility, existence of efficient equilibrium matching under sufficient conditions and linear-programming duality | `A`; not equal to simple fiscal-ceiling argument, but a major relevant parent class |
| [Geffner, Oesterheld & Conitzer (2025), *Maximizing Social Welfare with Side Payments*, arXiv:2508.07147](https://arxiv.org/abs/2508.07147) | H01/H03 | Recent **preprint**, staged capped-commitment and unanimous continuation can implement Pareto-improving efficient outcomes in finite games under stated conditions | `A`; peer-reviewed status **not claimed**; finite-game result cannot simply be applied to continuous portfolio game without a valid extension |
| [2024 public-goods voluntary-negotiation paper, JEBO 224:1–19](https://doi.org/10.1016/j.jebo.2024.05.007) | H03 | Voluntary participation and renegotiation can change who joins and efficient public goods provision | `A`; close governance precedent, not yet a full model-to-model comparison |
| [2024 IMF, *Industrial Policies for Innovation: A Cost-Benefit Framework*, WP/24/176](https://www.imf.org/en/publications/wp/issues/2024/08/15/industrial-policies-for-innovation-a-cost-benefit-framework-553520) | H02/H06 | Industrial policy with sector networks and real implementation frictions; targeting versus non-targeting depends on spillovers, precision and administrative capacity | `A/R`; specific regional actor/network formation not confirmed |

**Highest reading-depth sources in this pass:** Ohsawa–Yang model/equations and Hideshima–Kobayashi original PDF. **Full-text gaps:** Jackson–Wilkie, Pfingsten–Wagener, Armbruster–Hintermann, Jackson–Wolinsky, Liu, and Jalota–Ostrovsky–Pavone. Each is a further Stage-3/6 targeted reading obligation if its threatened candidate advances. No absence-of-same-formula novelty inference is licensed.

## 4. Component overlap and candidate-by-candidate hostile classification

### H01 — BILATERAL CONTINGENT TRANSFERS

**Nearest models:** Jackson–Wilkie (2005) endogenous strategy-conditioned side payments; Pfingsten–Wagener (1997) interregional efficient implementation. **Component classification:** `STRUCTURALLY VERY CLOSE` for transfers/implementation, **NOT** proven exact absorption of our unbuilt transfer-bargaining game.

**Algebraic absorption diagnostic from frozen primitives (not a new theorem):** consider *exogenously imposed* payment `t x1(1-x2)` from government 1 to 2, conditional on directed specialization. In the baseline duplication wedge `Delta<A<Delta/(1-alpha)`:

```text
Recipient deviation to D when other region U:
    Delta - (1-alpha)*A - t < 0
    <=> t > Delta - (1-alpha)*A.

Payer strict gain vs duplicated baseline:
    alpha*A - t > 0 <=> t < alpha*A.

Recipient strict gain vs duplicated baseline:
    (1-alpha)*A + t - Delta > 0
    <=> t > Delta - (1-alpha)*A.
```

Thus the simple mutually beneficial range `Delta-(1-alpha)A < t < alpha A` is nonempty iff `A>Delta`. This is essentially **redistributing the already verified positive surplus** `A-Delta`. It does not prove voluntary preplay bargaining equilibrium, source of funds, strict unique implementation under general contracts, or theorem originality.

- **KILL as main claim:** “a feasible side payment can implement the planner-preferred role allocation” or “positive aggregate gains permit Pareto-improving split,” standalone.
- **KEEP:** baseline comparison instrument only. If Stage 3 derives unexpected equilibrium bargaining failure specific to *endogenous complementary role choice*, compare it explicitly with Jackson–Wilkie/Harstad/Geffner; no unqualified publication claim.
- **Whole-game absorption:** unbuilt endogenous offer/accept **UNRESOLVED**. Exogenous implementation is a simple 2×2-type payoff correction, not a new bargaining theorem.

### H02 — CENTRAL CONDITIONAL CO-FINANCING

**Nearest model deeply inspected:** Ohsawa–Yang (2022), full equations (1)–(9). `g_i` local public spending is a scalar level; the central government chooses matching grant rate `m` and tax `h` before local provision `g_i`, and includes production and consumption spillovers. Eq. (9) derives **optimal** matching grants accounting for both types; no generic grant-level claim remains available. Armbruster–Hintermann also studies timing/commitment and grants with fiscal externalities.

**Candidate distinction that survives component comparison:** the original `x_i` is **sector composition at fixed capacity**, while I3-like conditional cofunding may be paid only to feasible **interregional complementary project pairs**. Unlike a uniform subsidy on `g_i`, its eligibility/output may depend on partner links and relative sector roles. However, this difference needs an actual economically new game and proposition; if the grant merely gives the usual missing marginal benefit, **kill**.

- **KILL as main claim:** correcting cross-border benefits via ordinary cofinancing; optimal rate changes with spillover degree; generic federal leader vs follower result.
- **RETAIN `POTENTIALLY NOVEL / UNPROVED`** only if co-financing/partner eligibility interacts with endogenous fixed-capacity sector assignment in a way that cannot be reduced to familiar Pigouvian provision grants.
- **Institutional caution:** I3 eligible-cost grants and multiactor firm/university/public consortia are not side payments between two governments; accurately specify beneficiary and financing incidence.

### H03 — JOINT GOVERNANCE / VETO / ENDOGENOUS COALITION

**Nearest full paper inspected:** Hideshima–Kobayashi (1998) studies local governments' endogenous coalition formation and social benefits from jointly provided local public goods. In its original p. 3 model, regional `W_i(G_1,...,G_n)=D_i(G)-C_i(G_i)`, coalition `s` maximizes member payoff sum over members' public-good `G_s`, and stability compares payoffs from join, leave and coalition expansion. This **is not** a policy-specific two-sector assignment, but does absorb general claims that local voluntary participation/coalition stability are unstudied. Harstad (2007) also discusses harmonization/differentiation with side payments; 2024 JEBO explores participation/renegotiation.

- **KILL:** merely replacing the planner by a shared coordination organization and stating that this achieves welfare improvement; generic coalition formation/stability claim.
- **RETAIN conditional comparator:** an actual feasible governance rule under which participation, veto, voluntary commitment and **asymmetric role assignment** induce a new game-level result. Need actual consortium rules and nontrivial equilibrium theorem.
- **Institutional caveat:** no evidence that I3 imposes two-government unanimous veto/binding asymmetric portfolio assignments. Do not attribute invented institutional rules to I3.
- **Classification:** `COMPONENT OVERLAP` with old coalitional public goods; **unresolved** exact game-level absorption because our institutional mechanism is not yet formalized.

### H06 — ENDOGENOUS PARTNER / PRODUCTION-LINK FORMATION

**Nearest models:** Jackson–Wolinsky (1996) link stability versus efficiency; Bala–Goyal (2000) decentralized link purchase/network access; Liu (2019) sectoral industrial subsidy incentives in an input-output network; IMF (2024) implementation frictions, industry innovation and network spillovers.

- **KILL:** “endogenous links may not be socially efficient”; “upstream sectors are relevant for optimal industrial policy”; “partnership creates spillovers”; or redefining `A` as `A_eff(N)` without strategic link decisions or a new result.
- **RETAIN `POTENTIALLY NOVEL / UNPROVED`:** joint local fixed-capacity priority choices **and** strategic project-link formation, particularly if funding/restrictions alter the *set of feasible complementary matches* instead of just multiplying `A`. The specific cross-effect/selection or failure mode must be derived at Stage 3/4, not assumed.
- **Classification:** `COMPONENT OVERLAP` and serious network-formation/industrial-network prior-art threat, not exact prior art for a non-specified full game.
- **Scope cost:** more agents/timing potentially expensive and old Lean coverage nontransferable. Seek a truly minimal endogenous link variable and exact negative benchmark where network link is fixed.

### H07 — HETEROGENEOUS ROLES + FISCAL CEILINGS

**Strong threats:** general assignment, liquidity and budget-constrained matching (Chen–Deng–Ghosh 2010; van der Laan–Talman–Yang 2018; Kawase–Iwasaki 2018; Jalota–Ostrovsky–Pavone 2025). These are **not** exact regional policy games, but the basic welfare-best-versus-financially-feasible assignment divergence is a familiar economic phenomenon.

Canonical frozen-game diagnostic: if the only new primitive is `Delta_i`, then `W(1,0)-W(0,1)=Delta_1-Delta_2`; the socially preferred upstream role is simply the higher direct-premium region. Adding payer cash ceiling `B_i` mechanically blocks a transfer whenever required compensation exceeds funds.

- **KILL as standalone main novelty:** “the budget constrained payment cannot fund the planner-optimal assignment”; its inequality by itself is elementary.
- **MERGE as a secondary restriction** into H01/H02 if, **and only if**, the restriction causes a new equilibrium/game-level reversal that is not a known constrained-assignment corollary.
- **Classification:** `STRUCTURALLY VERY CLOSE` at assignment/constraints **component** level; exact theorem absorption to two-region industrial-policy game not proven.

## 5. Whole-game, theorem-absorption and nested-benchmark matrix

| Candidate claim | Strongest prior theorem/result | Structural mapping attempted | Stage-2 finding |
|---|---|---|---|
| H01 payment selects differentiated role | Pfingsten–Wagener necessary/sufficient efficient transfer implementation; Jackson–Wilkie binding contingent side payments | Model generic `u_i(x_i,x_j)+t_i(x_1,x_2)`; our `t x_1(1-x_2)` is a 1-parameter strategy-dependent transfer schedule; IR window reduces to positive total surplus | `PARTIALLY ABSORBED / STANDALONE CLAIM KILLED`; endogenous preplay bargaining **not solved** and needs full paper comparison |
| H02 grant restores efficient local investment | Ohsawa–Yang optimal matching grants (Eq. 9), Armbruster–Hintermann timing | Map local scalar `g_i` to a chosen local expenditure, `s_i=m g_i`; this does **not** reproduce U–D portfolio composition or conditional bilateral project eligibility | Generic correction `PARTIALLY ABSORBED`; exact full-game absorption **UNRESOLVED** |
| H03 coalition increases welfare / stable membership | Hideshima–Kobayashi coalition formation + individual join/exit; Harstad bargaining | Map coalition members to participating governments, coalition payoff `sum_{i∈s}W_i`, outsider noncooperative; cannot assume role-coordination rule without game definition | Generic coalition claim `PARTIALLY ABSORBED`; specific veto/role game **UNRESOLVED** |
| H06 network stable ≠ efficient / sector network drives targets | Jackson–Wolinsky; Bala–Goyal; Liu 2019 | Map nodes to jurisdictions/firms, links to cross-region matches, subsidy to fixed-capacity sector choice; **links are not a strategy in the frozen paper**, so original baseline is a fixed-link restriction | Generic link/stability/sector targeting `PARTIALLY ABSORBED`; co-determined portfolios & links **UNRESOLVED / POTENTIALLY DISTINCT` |
| H07 fiscal constraint reverses role feasibility | Budget-constrained matching/assignment parent class | Direct `Delta_i` asymmetry gives corner welfare order; `B_i` places bounds on feasible transfers analogous to buyer liquidity caps | Standalone inequality `DIRECTLY ABSORBED AS ELEMENTARY CONSTRAINT LOGIC`; exact match to a named general theorem **NOT established** |

No line in this table claims a mathematically exact **full-game** isomorphism to a previous paper. **Component-level kill** is enough to reject a proposed *headline claim*; it is insufficient to declare every more elaborate prospective game already published.

## 6. Search protocol, deduplication, backward/forward and frontier

Targeted passes included the exact words `interregional transfer mechanisms`, `side payments strategy-contingent preplay`, `matching grants local public inputs production spillovers`, `fiscal competition pattern public spending`, `local government coalition formation join exit stability`, `pairwise stable network network formation`, `industrial policies production networks`, `budget-constrained assignment/transfer matching`; and application-neutral terms `two-player strategic substitutes anti-coordination`, `role assignment`, `normal-form payoff correction`, `constrained matching and liquidity`.

**Citation/author neighborhood chains actually checked at bibliographic/metadata level:**
- Ohsawa–Yang (2022) reviews Boadway et al. (1989), Zodrow–Mieszkowski (1986), Keen–Marchand (1997), Ogawa (2006) and Yang–Ohsawa (2018); the **spillovers-to-matching-grant** field is mature.
- Jackson–Wilkie published 2005 article and Caltech 2002 working paper treated as **one paper lineage**, not two new contributions.
- Armbruster–Hintermann 2019 Unibas working paper and 2020 ITPF article likewise one lineage.
- Liu (2019) compared with downstream IMF 2024 network policy framework; newer frontier includes 2025 matching with distributional constraints.
- Harstad (2007), the 2024 voluntary negotiation study, and the 2025 staged-transfer preprint constrain H01/H03 future bargaining novelty.
- **Limit:** exhaustive forward-citation/full-appendix searches of the paywalled core papers remain **UNRESOLVED**. Bibliographic metadata and selected author abstracts do not supply proof coverage. If the prospective Stage-3 result resembles them, acquire/inspect accessible full version before a positive Stage-6 claim.

**Recent frontier distinction:** Jalota et al. (2025) in *Games and Economic Behavior* is a peer-reviewed publication; Geffner et al. (2025) was found as an arXiv preprint and publication status is not assumed. Do not mistake SciSpace repository ingest dates for publication dates.

## 7. Explicit killed versus surviving claims

**KILLED as full-paper headline:**
- K01: role-specialization transfer `t` exists on a Pareto-improving interval.
- K02: ordinary matching grants restore efficient public-input provision.
- K03: voluntary local-government coalition formation is itself new.
- K04: endogenous networks may exhibit instability/underconnectedness.
- K05: fiscal budgets obstruct otherwise efficient matching or assignment.
- K06: a planner optimum alone supplies actionable local-government implementation.

**Eligible for tightly bounded Stage-3 test (no theory adopted yet):**

1. **S-A: H02 × H06 interaction**: a mechanism with (a) fixed-capacity regional priority choice, (b) cross-regional *project/link* eligibility and formation, and (c) financial intervention with actual payer/beneficiary distinction. **New strategic feedback hypothesis:** grant eligibility creates/displaces links, and links reshape optimal priority composition, possibly causing inability of uniform grants to implement the best role distribution. Stage 3 must produce a falsifiable **full-game-only** target finding; simply combining objects does not pass.
2. **S-B: H03 governance alternative**: voluntary, enforceable role-assignment institution with endogenous participation and/or veto, benchmarked against simple mandatory planner allocation and existing local-coalition games. Pursue only if verifiable institutional mechanics or a clear nontrivial game difference exists.
3. **Background tools:** H01 simple transfers; H07 asymmetric fiscal constraints — benchmark/deferred restrictions, *not* standalone paper contributions.

**Most dangerous next kill:** S-A is nothing but Armbruster–Hintermann / Ohsawa–Yang matching grant combined with Jackson–Wolinsky / Liu's network production, with no new coupling theorem. If role/match decisions collapse to `A_eff` or the grant reproduces a generic marginal externality correction, **STOP** instead of increasing model size.

## 8. Strict Stage-3 handoff and stop rule

**Stage-2 verdict:** `GO TO MECHANISM SEARCH` *for bounded falsification only* (not a scientific novelty PASS for an unbuilt game).

Stage 3 MUST:
1. Produce two **minimal distinct architectures** (S-A and S-B) with explicit actors, decision rights, timing, payoff/production primitives, feasible instruments, and relevant institution/real fiscal costs. H01 and H07 can appear only as benchmarks as above.
2. Draw `policy portfolio ↔ link formation ↔ grant eligibility` causal/strategic loop for S-A and specify exactly **one testable result** not generated in each nested model. State the parameter restriction yielding each benchmark.
3. For S-B, specify actual join/exit/veto timing and compare with existing local coalition public-good logic. Abandon if it is the original planner with a different label.
4. Reopen the **full theorem/model sections** of Jackson–Wilkie/Armbruster–Hintermann/Jackson–Wolinsky/Liu and any stronger source directly addressing the Stage-3 selected result. If inaccessible, record pending rather than mislabel `NOT ABSORBED`.
5. Apply an early **editorial-value test**: why would this new result change our understanding of feasible interregional industrial-policy coordination, not only verify an inequality?
6. **Fail closed**: if neither S-A nor S-B produces a strategically non-equivalent, economically interesting testable proposition after a short bounded search, return to Stage 0 / narrow paper, not automatic H04/H05/H08 feature accumulation. Any emerging proposition is only a **candidate** until Stage 4/4A and Stage 6 re-kill.

**No authorized changes:** baseline Theory Freeze, submitted JRS files, original Lean proofs, manuscript TeX, new funding contract assumptions, or target journal selection.

## 9. Verification and provenance

- **Direct textual full model inspection:** Ohsawa–Yang (2022) official publisher HTML and Hideshima–Kobayashi (1998) original J-STAGE PDF pages (p.1, p.3 relevant sections).
- **Bibliography/source authenticity:** reviewed journal/publisher/author sources where available and distinguished prior versions.
- **Symbolic diagnostic:** simple transfer feasibility and heterogeneous portfolio corner comparison rechecked independently; see [Stage 2 absorption diagnostics script](verify_stage2_absorption_diagnostics.py). This is **not** a new theorem/contract result.
- **Missing complete-paper proofs:** explicitly catalogued above; Stage 6 must re-kill the *actual solved results* with source depth, not inherit provisional Stage 2 conclusions.
- **No post-JRS original theory/Lean/TeX changes:** only new revision-lane Markdown/script and STATUS update.
- **AI:** GPT-6 assisted literature discovery, model-level comparison, source reading, source-to-claim mapping and drafting; author approval of a specific extension **PENDING**, neither novel mechanism nor submission guaranteed.
