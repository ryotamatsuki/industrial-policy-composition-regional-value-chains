# Stage 0 — Candidate B: asymmetric network portfolios, exact potential, and equilibrium boundaries (2026-10-10)

**Status:** mathematical RED TEAM + bounded Delta Card; not a novel existence theorem, Stage 4 mathematical certification, or article. Separate **SCHOLARLY THEORETICAL MERIT** from **CURRENT INDUSTRIAL-POLICY FIT**. The original model permits continuous portfolio shares `x_i∈[0,1]` — these are genuine pure strategies, NOT randomizations. Evidence flags M original main argument, A abstract; X exact hand-checkable derivation but not independent adversarial certification.

## B0 — Early falsification of initial T1 headline

**Old unproved suggestion:** 'asymmetrical vertical production links destroy the potential, maybe destroy existence of pure Nash'. The implication **is FALSE for the original continuous own-linear payoff family**, regardless of network direction. If player strategy sets stay compact and convex, each payoff remains continuous and **affine in own `x_i`**, hence quasiconcave; the **Debreu–Fan–Glicksberg** pure-equilibrium existence theorem applies. See MIT 14.126 Lecture 1 2024 (exact theorem statement), https://ocw.mit.edu/courses/14.126-game-theory-spring-2024/mit14_126_s24_lecture_1_solution-concepts.pdf , and original Glicksberg (1952), https://doi.org/10.1090/s0002-9939-1952-0046638-5 . No graph potential is necessary for existence. **This explicitly supersedes the Stage-F T1 formulation** and must NOT be described as an open equilibrium-existence problem.

Further, any finite binary-strategy game extended multilinearly over `[0,1]^n` has fractional pure Nash equilibria corresponding to mixed equilibria of the discrete game. This does not mean physically choosing a budget share is behaviorally identical to randomizing indivisible projects, only algebraically identical in the stipulated multilinear payoffs.

## B1 — Precise network extension and exact mathematical checks

Let directed nonnegative `w_ij` denote a U-in-i to D-in-j feasible production match. To retain the frozen rent-incidence technology `α` and `1−α`, set

```math
W_i=b_D+Δ x_i+A∑_{j≠i}[α w_ij x_i(1−x_j)+(1−α)w_ji(1−x_i)x_j],
```

`Δ>0, A>0, α∈(0,1), x_i∈[0,1]`. The full derivative is

```math
g_i(x_{−i})=∂W_i/∂x_i=Δ+α A ∑_j w_ij−A∑_j[αw_ij+(1−α)w_ji]x_j.
```

Mixed-derivative symmetry required for a differentiable **exact potential** becomes

```math
∂²W_i/(∂x_i∂x_j)−∂²W_j/(∂x_j∂x_i)=−A(2α−1)(w_ij−w_ji).
```

Thus this family has an exact potential on the full strategy product exactly when `(2α−1)(w_ij−w_ji)=0` for each unordered edge pair. **No exact potential ≠ no pure Nash.** Weighted/ordinal potential may still exist for other parameters; do not claim universal nonexistence.

**Hand-checkable 3-node directed-cycle counterexample to CORNER existence only:** set `w_12=w_23=w_31=1`, all reverse weights zero, `A=1`, `α=1/4`, `Δ=1/5`. Then

```math
g_i=9/20−(1/4)x_{i+1}−(3/4)x_{i−1},
```

indices modulo 3. For every vertex binary `x∈{0,1}^3`, region i prefers `x_i=1` if its incoming predecessor is `0`, but `x_i=0` if its incoming predecessor is `1`, regardless of successor (since `0<Δ<(1−2α)A=1/2`). An odd cycle therefore has **NO binary/corner Nash equilibrium**. However `x^*=(9/20,9/20,9/20)` sets all slopes to ZERO, so **IS a pure Nash equilibrium of the continuous portfolio game**. Checked by exact rational exhaustive enumeration of all eight corners and direct zero-gradient substitution.

**Novelty check:** Such binary-vs-fractional correspondence is already a consequence of classical Nash mixing and graphical anti-coordination results, **not** an original publishable theorem. It is an adversarial counterexample to a tempting but invalid future thesis.

## B2 — Nearest original theorem passports / literature absorption

| Parent original | Already established | Reading status / immediate absorption |
|---|---|---|
| Debreu–Fan–Glicksberg, originals 1952, e.g. Glicksberg https://doi.org/10.1090/s0002-9939-1952-0046638-5 | Convex compact strategies, joint continuous payoffs, quasiconcavity in own action **imply pure NE** | Original bibliographic verified, theorem checked via MIT lecture (full original proof not audited). **DIRECTLY ABSORBS claimed pure NE existence**. |
| Monderer & Shapley (1996), *Potential Games*, https://doi.org/10.1006/game.1996.0044 | Exact potential and its equilibrium existence link | Original lemma already reviewed in Stage F; **absorbs** symmetric simple network case. |
| Kun, Powers & Reyzin (2013), *Anti-Coordination Games and Stable Graph Colorings*, https://arxiv.org/abs/1308.3258 | Binary-color anti-coordination, stable graph coloring, PoA, and directed case | Original preprint text/abstract, graph-game standard; **near-absorbs corner-game cycle claim**. |
| Apt, Simon & Wojtczak (2022), *Coordination Games on Weighted Directed Graphs*, *Mathematics of Operations Research* 47:995–1025, https://doi.org/10.1287/moor.2021.1159 | Directed weighted graph equilibrium existence, failures, finite improvement and computational hardness in **COORDINATION** games (same color bonus). | Original publisher abstract; model is coordination, NOT directly identical to our dissimilar-color complementary production. Do NOT treat entire theorem as direct absorption without map. |
| Liu (2018), *Directed graphical structure, Nash equilibrium, and potential games*, *Operations Research Letters* 46:273–277, https://doi.org/10.1016/j.orl.2018.02.002 | Structural cycle criterion for universally guaranteeing pure equilibrium across all games sharing influence graph, plus generalized ordinal potential | Publisher original abstract and introduction checked; does not claim that every game with cycles lacks equilibrium. |
| Passacantando & Raciti (2024), *Some properties of a class of Network Games with strategic complements or substitutes*, https://doi.org/10.1142/9789811267048_0023 | Representation of unique equilibrium for a parametric game on bounded strategy spaces, plus comparison to optimum and PoA. | Author manuscript intro and publisher chapter abstract; restrictions/theorems still need full direct comparison. |
| Carosi & Monaco (2018), *Generalized Graph k-Coloring Games*, https://doi.org/10.1007/978-3-319-94776-1_4 | Directed/general weighted coloring with node bonuses and welfare/coordination issues in related literature | Source theorem formal mapping **not verified** in this Stage0; prior StageF abstract excerpt only. |
| Deligkas, Eiben, Gutin, Neary & Yeo (2023 WP), *Complexity of Efficient Outcomes in Binary-Action Polymatrix Games*, https://arxiv.org/abs/2305.07124 | Efficient welfare outcomes, max-weight digraph partitions, binary polymatrix anti-coordination/coordination optimization complexities | Original preprint abstract only; important welfare / computation threat. |

## B3 — Delta Card after killing original T1 thesis

**Only defensible new question:** If geographically meaningful **indivisible capacity/project choice**, threshold matching technology or another documented non-quasiconcavity is introduced, can one give a *sharp, economically meaningful* graph restriction or an equilibrium/welfare bound **strictly stronger than** the known binary anti-coordination/polymatrix results, while retaining the frozen model as a special limiting/benchmark case? Alternative generalization could be a genuine theorem on existence under **weaker than standard quasiconcavity conditions** with explicit economics application, but nothing like this is yet produced.

**Important:** indivisible regions and odd directed cycles by themselves are known graphical-game counterexamples, not a novel extension. Any threshold/sector count added merely to evade Debreu–Fan–Glicksberg is ad hoc and must be excluded. An original proof of existence or unique robust equilibrium under economically justified new constraints remains a candidate **only if** it defeats the actual parent theorem and gives new economic comprehension.

- **UNPROVED result B-H1:** a sharp classification of a legitimate *policy-capacity* game by its actual directed technological linkage parameters, possibly distinguishing integral (single indivisible project) vs fractional (divisible support) equilibrium and a welfare or implementability consequence not reducible to ordinary graph coloring or mixed-game facts. No prediction of its truth.
- **One binding change to test at Stage1:** an authentically indivisible minimum-efficient-scale innovation/industrial policy project (`x_i∈{0,1}` as a substantively justified instrument constraint), *not* a nominal graph arrow.
- **Parent/absorption attack:** show whether the new game is literally a weighted digraph anti-coordination/polymatrix game with color-specific bonuses and whether known stable coloring / exact partition lemmas settle the proposed statement. If yes, **KILL B-H1 even if its real-world motivation is new**.
- **Economic interpretation:** local budget indivisibility can make the noncooperative equilibrium structure differ from divisibility; *which and why* matters to implementation. National welfare gains NOT asserted.
- **Scholarly theory value:** potentially valuable IF a source-unabsorbed general theorem; **fit:** DIRECT/ADJACENT but not necessarily full regional-policy paper; journal family JME / Economic Theory / JET conditional on result (not selected).
- **Budget:** 1 tightly scoped actual original-text comparison with Kun directed propositions, Carosi/Monaco model and Passacantando/Raciti uniqueness domain; 1 minimum symbolic counterexample/proof attempt; no new large nonlinear model or manuscript.
- **STOP** if parent theorem directly settles it or only the binary-vs-fractional Nash-mixing correspondence survives. More network nodes or proof restyling cannot revive it.

**Stage 0 B verdict:** **NO-GO for original loss-of-potential/NE-existence T1 question** because DFG proves existence for all this continuous family; **CONDITIONAL REFRAME** for a *separate*, economics-motivated indivisible-project theorem search, not yet a verified distinct frontier. Record theoretical potential, project fit, originality uncertainty and journal fit independently.
