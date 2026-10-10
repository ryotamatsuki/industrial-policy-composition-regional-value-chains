# Candidate 2 — Integrated Abstract–Introduction–Conclusion Frontier Lineage (2026-10-11)

**Status: source-grounded frontier genealogy, not a theorem proof or a comprehensive bibliographic negative certificate.** Owner correctly requested that each article's **Abstract**, **Introduction/Related Work**, **Theorems**, **Conclusion/Open Problems** be connected **ACROSS PAPERS**, with follow-up resolutions flagged. Earlier PR #36 located AAAI 2026 Conjecture 1, but did not create a multi-article section-by-section evidence matrix. This file corrects that omission; no paper rewrite or mathematical novelty GO.

## I. Three complementary layers of evidence (mandatory protocol)

For every original paper:
- **Abstract:** contribution as authors advertise; NEVER automatically interpret novelty as proved.
- **Introduction / Related work:** exact PARENT and *difference* — topology (undirected/directed), choice sets (binary/continuous), sharing capacity (unlimited/k), beneficiaries (all/selected), payoffs (best-shot/general), welfare (cost/utility), information and equilibria. Record citations and section/line/page.
- **Conclusion / Discussion:** explicitly OPEN and PROPOSED future variants separately; generic 'future work' != a mathematical conjecture; locate version/date of claim.
- **Mathematical propositions:** verified theorem definitions, inequalities and restrictions; do not conflate `PoS_k` **worst case over graphs** and `PoS_k(D)` pointwise for each graph.
- **Temporal cross-check:** FOR EACH open problem, search later paper's ABSTRACT→INTRO→MAIN RESULT→DISCUSSION to mark `SOLVED`, `PARTIALLY SOLVED`, `OPEN at latest checked paper`, `SPECULATIVE`, `UNKNOWN—literature not exhausted`. Duplicate preprints and journal versions count as same research line, not separate discoveries.

## II. Interlinked article passport table (section-specific primary evidence)

| Node, research lineage | Abstract / what authors claim | Introduction / their exact parents and structural delta | Conclusion/open question | Later answer and current confidence |
|---|---|---|---|---|
| **Bramoullé & Kranton (2007), JET 135:478–494**, original publisher record https://doi.org/10.1016/j.jet.2006.12.006 (bibliographic original; full intro/conclusion not reaudited here) | Public good provision depends on network topology; equilibria with specialization/free riders | Undirected network; normal public goods provision and free riding, no endogenous capacity-limited nomination | **NOT READ** in this audit; do not invent author-stated gap | Gerke et al 2024 expressly name BK 2007 as main PARENT and add capacity-constrained nominations. Confidence A on 2007 / FULL on successor intro. |
| **Gerke, Gutin, Hwang & Neary (2024 final JET 219:105844)** https://doi.org/10.1016/j.jet.2024.105844 ; full AUTHOR VERSION arXiv v4 (June 2023) https://arxiv.org/pdf/1905.01693 **P for version intro & conclusion** | Agents choose contribution AND a limited subset of neighbours; existence of specialized pure equilibria; increasing capacity can perversely lower efficiency | Author PDF introduction pp.2–6 (PDF pp.1–5): extends BK by capacity-specific nominations, exogenous UNDIRECTED network; explicit questions of specialized NE existence, role shifts and efficiency as capacity relaxes | Author PDF Conclusion pp.33–34 (PDF pp.32–33): explicitly proposes **co-evolving network formation and subsequent behavior, allowing arbitrary nomination changes**, and other interaction types where sharing need not help the recipient. Existing dynamics in their paper are restricted; not a formal author-stated conjecture. | Deligkas et al 2026 adds DIRECTED links + uniform capacity k in STATIC simultaneous game; DOES NOT, on inspected model, solve endogenous co-evolution over time. **OPEN-WINDOW HYPOTHESIS only**, needs dynamic-network-game parent search beyond this family. Journal-final conclusion might differ: author version vs published final NOT verified identical. |
| **Papadimitriou & Peng (2023), GEB 139:161–179** https://doi.org/10.1016/j.geb.2023.02.002 ; https://arxiv.org/abs/2106.00718 **A/M original publisher abstract and 2026 successor's introduction** | Directed networks, GENERAL objective functions, pure existence NP-hard, mixed PPAD-hard, divisible variant and bounded-treewidth algorithms | Directed neighbors and Nash computation; **NO k-constrained nomination** in the successor’s marked comparison. This is a separate axis from Gerke 2024's undirected limited shareability | Published final discussion exact future work **NOT yet verified**; do not call every unused parameter an open problem | Deligkas 2026 Intro §1 says the intersection **directed + capacity k** was the missing equilibrium existence/complexity problem, and provides results (Thm 3–6). **THAT 2023/2024 intersection is SOLVED in its modeled class as of 2026**, not a new frontier. |
| **Gilboa & Nisan (2022) → Gilboa (ICALP 2024)** final https://doi.org/10.4230/LIPIcs.ICALP.2024.73 , original abstract **A** | 2022 posed complexity classification for finite utility best-response patterns; 2024 proves NP-complete every finite nonmonotone pattern, completing classification | Adjacent algorithmic equilibrium complexity, NOT the 2026 k-PoS conjecture | ICALP 2024 explicitly says it **answers the 2022 open problem** and completes an old finite-pattern question | **SOLVED NEGATIVE CONTROL**; never sell this old open problem as 2026 frontier. |
| **Deligkas, Gutin, Jones, Neary & Yeo (AAAI 2026, 40(20):16821–16828)** https://doi.org/10.1609/aaai.v40i20.38726 ; full original author HTML https://arxiv.org/html/2511.11475v1 **P main text** | Capacity-limited shareability `k`, directed networks; near complete classification of NE existence, computational complexity and social-efficiency ratios | **Intro §1 paragraphs 3–10:** explicitly synthesizes BK 2007 undirected public goods, Gerke 2024 limited **undirected** sharing, Papadimitriou–Peng 2023 **directed** general NE complexity; its contribution is the **crossing** of these two dimensions, with constrained nomination, binary buying and best-shot payoff `c∈(0,1)`. **Theorems 3–6** cover equilibrium/complexity; **Theorem 8** proves `k ≤ PoS_k ≤ k + 1/(k+1)`; **Theorem 9** proves exact `PoS_1=1`; pure `PoA_k=k+1`, mixed PoS/PoA established. | **Discussion §6** explicitly says only unresolved case in their own analysis is **Conjecture 1** (original HTML lines 341–345): proposed `PoS_k=k` as a WORST-CASE over digraphs admitting pure NE, **not** pointwise equality for every graph. For `k=2`, current proven range `2 ≤ PoS_2 ≤ 2+1/3`. | Search on exact paper title, conjecture label, authors, PoS sharing, through **2026-10-11** located no clearly resolving subsequent original study. This is **NOT a proof of global absence**. First priority **one limited PoS bound probe for k=2**, not proving old results anew. |

Primary excerpt anchoring for 2026 source: §1 Introduction lines 53–80 (its two parent axes), §2 definitions 81–110 (global PoS_k vs instance), §5 Theorem8/conjecture lines 280–350, §6 Discussion lines 451–453. Full exact source https://arxiv.org/html/2511.11475v1 .
Gerke 2024 author-v4 original PDF pages: intro 2–6; conclusion 33–34, https://arxiv.org/pdf/1905.01693 . Its JET final abstract confirmed https://www.sciencedirect.com/science/article/pii/S0022053124000504 .

## III. Citation-graph edges and research status

```text
Bramoullé–Kranton 2007 [UNDIRECTED public good]
  ├─ Gerke et al 2024 JET [UNDIRECTED + CAPACITY k + nomination]
  │    ├─ solved: specialized pure equilibrium existence; perverse shareability/efficiency
  │    └─ proposed FUTURE: endogenous nomination-network dynamics, alternative signed spillovers
  └─ Papadimitriou–Peng 2023 GEB [DIRECTED + general payoff/complexity]
       └─ old finite-response complexity gap -> Gilboa 2024 ICALP [SOLVED]

Gerke (capacity) + Papadimitriou–Peng (direction)
  -> Deligkas et al 2026 AAAI [DIRECTED + CAPACITY k, best-shot, static]
     ├─ SOLVED: pure-NE existence complexity dichotomies / sufficient classes
     ├─ SOLVED: mixed existence and complexity; pure PoA and mixed ratios
     ├─ SOLVED: global pure PoS when k=1 (Theorem 9)
     └─ OPEN AUTHOR CONJECTURE: global worst-case pure PoS_k exact k for k>=2
         └─ cheapest new proof candidate: k=2 restricted topology / analytic lemma
```

**Crucial insight:** A conclusion can mark an opportunity, but a *later paper may have already claimed and solved it*. Conversely, a paper can solve most of a parent's missing dimension and leave a sharply defined residual conjecture. Our source search and future proof agenda should follow *citation edges and theorems*, not adjacency of words or novelty-by-journal.

## IV. Candidate-specific research cards after AIC integration

**C2-PoS (priority)**:
- EXACT parent theorem: AAAI26 Theorem 8 (bound), conjecture 1 (tightness), Theorem9 (k=1 only).
- Smallest nontrivial claim: either prove the worst-case upper bound `PoS_2 ≤ 2` for a **clearly stated nontrivial directed graph class admitting PNE**, where no earlier parent already proves it, or find a valid digraph with `pn_2(D)/b_2(D)>2` which falsifies global conjecture. Neither result presently exists; complexity of enumeration potentially large. For a STRICT SUBCLASS, require prior-art search proving not a trivial corollary of general bound or obvious constructions.
- Specification lock: directed graph D, binary buy/abstain and exactly `min(k,d^+(i))` nominations by buyers, `c∈(0,1)`, equilibrium `pn_k(D)`, optimum number buyers `b_k(D)`, worst-case `PoS_k = sup_D pn_k(D)/b_k(D)` **conditional on existence**. Don't confuse socially optimal with all players buying, and don't assume a pure NE exists for arbitrary digraphs.
- Proof choices: extremal buyer-set exchange, charging/matching bound extending Theorem9 k=1, graph structural characterizations from Theorem5, counterexample enumeration; **an exhaustive finite n scan alone is evidence not proof**.
- Falsifier: published newer solution, tautological subclass proof, only numerical up-to-n pattern, incorrectly normalized individual ratio.
- Novelty status: AUTHOR-EXPLICIT open conjecture as of March2026, no later known direct solution located in bounded Oct11 search, no new lemma yet.
- Scholarly value: potentially significant ALG GAME THEORY/general economic games, but not necessarily JME or JET without economic interpretation; project-fit OUTSIDE regional industrial policy, **do not mark academic NO-GO for mismatch**.

**C2-DYN (secondary potential)**:
- Gerke author-version Conclusion suggests endogenous evolution of nomination subgraphs and behavior after unilateral nominations; later 2026 AAAI static model does NOT itself resolve that direction.
- Not an explicit fully stated mathematical conjecture; absent downstream dynamic adaptive network games comparison, **do not call it unstudied**. Could be application-rich but diffuse and larger than C2-PoS.
- STOP if ordinary stochastic stability/endogenous formation already applies without new economics.

## V. Standard workflow correction beyond this one topic

Future full frontier reports must produce all 5 fields per source: `ABSTRACT_CONTRIBUTION`, `INTRO_PARENT_DIFF`, `NAMED_THEOREM_ASSUMPTIONS`, `CONCLUSION_OPEN`, `LATER_RESOLUTION`, each with original version, precise page/section, confidence `P/M/A/W`, exact duplicate-version and post-publication search. Required synthesis: *directed time-stamped graph edges* `PARENT_OF`, `RELAXES_ASSUMPTION`, `RESOLVES`, `PARTIAL`, `CONFLICTS`, `CONJECTURES`; the graph defines source-backed **unresolved frontier windows**, not an aspirational list of topics. Only after this task -> Stage0 single Delta Card and a constrained proof/counterexample probe. Multiple directions can coexist: theory academic merit and current-project fit independently.

**Honest overall verdict:** Earlier pipeline was insufficiently systematic across abstracts, intros and conclusions; **this document builds the necessary genealogical baseline for candidate2**. Conjecture1 is better evidenced than vague claim 'add directed network'; its open status is **source-dated, not guaranteed worldwide**. No mathematical novelty claim / full proof yet. Candidate2 remains a bounded research-worthy exploration.
