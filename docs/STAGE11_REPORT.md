# Stage 11 — Robustness / Referee Attack Gate

## Executive verdict

`GO TO JOURNAL POSITIONING`

Canonical freeze: `IPCRVC-THEORY-FREEZE-2026-09-07-v1`  
Stage 11 starting `main`: `a911a83f6c900876552657f1e7dd5b32edaa801b`  
Implementation branch: `stage11-referee-gate`

No fatal mathematical, equilibrium, benchmark, welfare-accounting, institutional-coherence, or theorem-quantifier defect was found in the frozen contribution. The baseline equilibrium and planner characterizations survive independent direct reconstruction over the full strategy domain. The Stage-7.5A restricted-function and alternative-matching scope also survives adversarial checking.

The hostile audit did identify a serious literature-positioning weakness in the Stage-10 draft: the paper discussed industrial-policy competition but omitted the classic fiscal-federalism/local-public-good literature in which interjurisdictional spillovers already create wedges between decentralized and coordinated local policy. It also omitted recent work explicitly studying public-expenditure composition under fiscal competition. Those omissions made the prose vulnerable to a false novelty claim even though the theorem itself remained correct.

This was repaired without theory change. The revised manuscript now explicitly recognizes that incomplete internalization of interjurisdictional benefits is a familiar mechanism and narrows the contribution to the fixed-capacity industrial-policy portfolio game and its exact composition-specific equilibrium characterization.

The dominant remaining risk is journal ceiling, not correctness: whether the surviving narrow contribution is sufficient for an upper-field journal must be decided in Stage 12 without expanding the theory merely to fit a preferred outlet.

---

## Referee A — Novelty and mechanism

### A1. Classic-result attack: interjurisdictional spillovers

**Attack.** The manuscript's incidence wedge may be a relabeling of the classic local-public-good result that a jurisdiction does not internalize benefits accruing elsewhere.

**Severity before repair:** `MAJOR BUT FIXABLE`.

**Evidence.** Cremer, Marchand, and Pestieau (1997) already study two communities making indivisible local-public-service investments with interjurisdictional spillovers and compare Nash provision with a social optimum. Bloch and Zenginobuz (2007) study local-public-good provision with positive spillovers and equilibrium responses as spillovers vary. Takahashi (2004) studies strategic local-government investment, coordination failure, and a national benchmark. Agrawal, Hoyt, and Wilson (2022) survey expenditure spillovers and other strategic local-policy interactions.

**Can the paper answer now?** Yes, but only by abandoning any suggestion that incomplete capture or the decentralized/coordinated wedge is itself new.

**Required fix.** Cite the fiscal-federalism/local-public-good literature directly and state that the new object is the fixed-capacity industrial-policy composition game, not the generic spillover mechanism.

**Earliest affected stage:** Stage 6/10 literature positioning, not theory.

**Certification regression?** `NO`.

**Resolved?** `YES`. Introduction and Related Literature were revised accordingly.

### A2. Composition-is-not-new attack

**Attack.** Public policy composition itself is already studied; fixed capacity does not make composition a novel concept.

**Severity before repair:** `MAJOR BUT FIXABLE`.

**Evidence.** Kikuchi, Kuzawa, and Tamai (2026) explicitly study the composition of public expenditure under fiscal competition, with public goods and public inputs distorted by fiscal and employment externalities. Existing industrial-policy models also allow sector-specific policy vectors.

**Can the paper answer now?** Yes. The contribution cannot be “governments choose composition.” It must be the exact interaction among a binding portfolio constraint, vertically complementary cross-regional activities, jurisdictional incidence, and the resulting unique-duplication interval.

**Required fix.** Add the expenditure-composition literature and narrow the contribution statement.

**Earliest affected stage:** Stage 6/10.

**Certification regression?** `NO`.

**Resolved?** `YES`.

### A3. Whole-game absorption by industrial-policy competition

**Attack.** Chen and Li (2026) and Wang et al. (2024) already contain multi-jurisdiction, multi-sector strategic industrial policy. The present model may therefore be only a two-region/two-activity simplification.

**Severity:** `MAJOR BUT FIXABLE AT POSITIONING`, not a correctness blocker.

**Evidence.** The closest industrial-policy papers already make policy vectors strategic. They do not, in the audited material, make a fixed aggregate local policy-capacity simplex the central strategic object and derive the same exact portfolio-switching configuration theorem.

**Can the paper answer now?** Partly. The manuscript can identify the structural distinction but cannot turn that distinction into a larger theorem without reopening theory.

**Required fix.** Preserve the narrow novelty claim and let Stage 12 choose a journal consistent with its actual magnitude. Do not add an extension solely to raise journal prestige.

**Earliest affected stage:** Stage 12 unless new evidence establishes exact prior art.

**Certification regression?** `NO`.

**Resolved?** `RESOLVED FOR STAGE 11; JOURNAL-CEILING RISK REMAINS`.

### Referee A conclusion

The paper does not establish a new generic fiscal-externality mechanism. After repair, it makes a narrower claim: a fixed-capacity industrial-policy portfolio game produces a fully characterized interval in which both governments uniquely retain the locally attractive priority after a coordinated portfolio has already reallocated toward complementarity. That is a defensible distinction, but Stage 12 must be conservative about journal ceiling.

---

## Referee B — Assumptions, mathematics, and globality

### B1. Result-built-into-fixed-capacity attack

**Attack.** The equality `x_i + (1-x_i)=1` mechanically creates an opportunity cost. Perhaps the main result exists only because total policy is frozen.

**Severity before repair:** `MAJOR BUT FIXABLE`.

**Evidence.** Fixed capacity is explicitly listed in the theory freeze as an essential economic assumption. Removing it changes the research question from composition conditional on scarce capacity to a joint level-and-composition problem.

**Can the paper answer now?** Yes, if it treats fixed capacity as the maintained environment rather than a supposedly innocuous normalization or general fact.

**Required fix.** State that fixed capacity is not derived and that the theorem does not claim to survive endogenous total spending.

**Earliest affected stage:** Stage 10 exposition only, because the assumption was already frozen and correctly classified.

**Certification regression?** `NO`.

**Resolved?** `YES`. Model and Introduction now state this directly.

### B2. Incidence/ownership attack

**Attack.** Competitive Cobb--Douglas factor shares do not by themselves imply that each factor return belongs to the welfare of the jurisdiction hosting that factor. Cross-ownership, profit repatriation, bargaining, or transfers could alter local capture.

**Severity before repair:** `MAJOR BUT FIXABLE`.

**Evidence.** The baseline maps factor income to host-jurisdiction welfare. The general switching representation separately allows a constant local capture share `lambda` and shows the wedge disappears as local capture approaches full capture.

**Can the paper answer now?** Yes, by identifying the jurisdictional incidence mapping as an economic assumption rather than claiming that Cobb--Douglas alone settles ownership.

**Required fix.** Make the host-incidence assumption explicit and list cross-ownership/transfers/bargaining as outside the baseline.

**Earliest affected stage:** Stage 10 exposition.

**Certification regression?** `NO`.

**Resolved?** `YES`.

### B3. FOC-versus-global-equilibrium attack

**Attack.** The continuous game may rely on a local FOC or ignore corners.

**Severity:** `MINOR / REJECTED ATTACK`.

**Evidence.** The payoff is affine in own strategy over the entire compact interval. The direct payoff difference

`Delta + alpha A - A x_j`

gives the global best-response correspondence on `[0,1]`. All boundary cases `A<A^N`, `A=A^N`, and `A>A^N` are enumerated. No local solver or interiority assumption is used.

**Can the paper answer now?** Yes.

**Required fix.** None.

**Earliest affected stage:** N/A.

**Certification regression?** `NO`.

**Resolved?** `YES`.

### B4. Large finite deviation / off-branch attack

**Attack.** A large unilateral deviation might leave a regular branch and overturn the candidate equilibrium.

**Severity:** `REJECTED ATTACK`.

**Evidence.** There is no regular/interior branch restriction: the affine payoff comparison evaluates every `x_i in [0,1]`, including both corners and every finite deviation. The game is static and simultaneous; there is no downstream continuation subgame.

**Solver failure ledger.** Numerical solver required: `NO`; `None`: 0; NaN: 0; nonconvergence: 0; unresolved continuation: 0.

**Resolved?** `YES`.

### B5. Independent function-class attack

**Attack.** The restricted CRS threshold ordering might be a Cobb--Douglas artifact despite the robustness claim.

**Severity:** `REJECTED ATTACK`.

**Independent counterexample search.** Use the nonbaseline admissible technology

`F(u,d)=a u + b d`, with `a>0`, `b>0`.

This technology is differentiable, concave, homogeneous of degree one, and has positive marginal products. The audited thresholds become

`A_F^P = Delta/(a+b)` and `A_F^N = Delta/b`,

so

`A_F^N - A_F^P = Delta a/[b(a+b)] > 0`.

The sign cannot be reversed within this test. More generally, the paper's stated restricted-class proof uses Euler's identity and `F_u(1,1)>0`, exactly matching the certified domain.

**Required fix.** None.

**Certification regression?** `NO`.

### B6. Alternative-matching attack

**Attack.** Random matching may mechanically force complete specialization.

**Severity:** `REJECTED AS A FATAL ATTACK; SCOPE LIMIT CONFIRMED`.

**Evidence.** Under the certified min-capacity matching technology, decentralized duplication remains unique for `A<Delta/lambda`, while the coordinated optimum for `A>Delta` is the entire set `x_1+x_2=1`, which includes interior portfolios. Thus exact complete specialization is not robust, but delayed decentralized reallocation is preserved.

**Required fix.** Continue to state only reallocation away from duplication as the robust claim.

**Certification regression?** `NO`.

### Referee B conclusion

The mathematics is unusually transparent and survives full-domain attack. The price of that transparency is that fixed capacity and jurisdictional incidence are essential, not incidental. The revised manuscript now says so explicitly.

---

## Referee C — Welfare, institutions, and benchmark

### C1. Welfare-is-mechanical attack

**Attack.** The welfare gain may be an artifact of counting local revenues as social surplus or summing transfers.

**Severity before repair:** `MAJOR BUT FIXABLE`.

**Evidence.** The freeze defines `Delta` as opportunity-cost-adjusted real surplus, not a fiscal transfer, and the complementary terms are real production output allocated across jurisdictions. Summing regional payoffs therefore does not double-count the cross-regional output. However, the model excludes tax financing, administration, consumer margins outside modeled production surplus, and cross-jurisdiction transferability.

**Can the paper answer now?** Yes, by labeling the object precisely as aggregate modeled real surplus rather than an unrestricted welfare measure.

**Required fix.** Clarify the accounting scope in the Welfare section and policy prose.

**Earliest affected stage:** Stage 10 exposition.

**Certification regression?** `NO`.

**Resolved?** `YES`.

### C2. Planner-benchmark attack

**Attack.** The planner may be mislabeled as first best.

**Severity:** `REJECTED ATTACK`.

**Evidence.** The manuscript explicitly fixes each region's capacity, instruments, information, production, and matching and calls the object the “coordinated fixed-capacity planner benchmark.” It explicitly says this is not an unrestricted first best.

**Required fix.** None.

**Certification regression?** `NO`.

### C3. Policy-centralization attack

**Attack.** The welfare wedge does not prove that policy should be centralized.

**Severity:** `REJECTED ATTACK`.

**Evidence.** Introduction, Institutional Interpretation, and Conclusion explicitly exclude administrative costs, local-information advantages, and endogenous intergovernmental institutions and do not recommend centralization. Coordination could in principle be achieved through institutions not modeled here.

**Resolved?** `YES`.

### C4. Institutional fixed-budget literalism

**Attack.** Real governments do not have exactly one unit of immutable policy capacity.

**Severity:** `MINOR AFTER REPAIR`.

**Evidence.** Smart-specialization and related priority-setting programs require concentration on a limited set of priorities; the model uses this as an opportunity-cost environment, not a literal accounting claim.

**Required fix.** Maintain the “stylized prioritization” language and avoid asserting a literal hard budget identity in the data.

**Resolved?** `YES`.

### Referee C conclusion

The planner and welfare language is correctly constrained. The paper establishes an internal coordination loss over modeled real-surplus components, not an unrestricted social-optimum or centralization theorem.

---

## Referee D — Journal fit, exposition, and claim scope

### D1. Abstract/general-switching inflation

**Attack.** “A general switching representation” could be read as a theorem over general continuous portfolio games, while Stage 7.5A certifies only a binary configuration comparison.

**Severity before repair:** `MINOR`.

**Required fix.** Replace “general” with “binary” and retain the explicit scope statement in Robustness.

**Certification regression?** `NO`.

**Resolved?** `YES`.

### D2. Threshold wording in the Introduction

**Attack.** Saying that “a decentralized government switches at `A^N`” can obscure the fact that, above the threshold, differentiated and symmetric equilibria coexist.

**Severity before repair:** `MINOR`.

**Required fix.** Describe `A^N` as the point at which the decentralized equilibrium set changes/differentiated equilibria appear, while preserving the exact high-`A` multiplicity result.

**Resolved?** `YES`.

### D3. Figure/table scope inflation

**Attack.** The regime figure may visually imply a general theorem.

**Severity:** `REJECTED ATTACK`.

**Evidence.** The generated figure uses exact symbolic thresholds and its caption explicitly restricts interpretation to the frozen two-region/two-activity baseline. The generated threshold table separately labels the binary switching lemma's scope.

**Resolved?** `YES`.

### D4. Insufficient-contribution / wrong-journal attack

**Attack.** Once the classic fiscal-externality literature is acknowledged, the surviving contribution may be too narrow for a top public-economics or urban-economics outlet.

**Severity:** `MAJOR JOURNAL-POSITIONING RISK`, not a Stage-11 correctness failure.

**Evidence.** The paper's strongest new object is the fixed-capacity industrial-policy portfolio equilibrium and exact Priority Duplication Wedge. The primitive incidence logic is familiar. There is no broad N-region theorem, endogenous policy-budget result, or implementation theorem.

**Can the paper answer now?** Not by honest exposition alone. Whether the contribution clears a journal's novelty/importance bar is a positioning decision. Adding theory solely to target a higher-ranked journal would violate the workflow.

**Required fix.** Stage 12 must choose the journal based on the surviving narrow contribution and explicitly compare plausible outlets by fit and contribution threshold.

**Earliest affected stage:** Stage 12.

**Certification regression?** `NO`.

**Resolved?** `OPEN FOR STAGE 12 BY DESIGN`.

---

## Independent equilibrium/globality re-audit

The baseline is a static simultaneous game, so the sequential-continuation checklist is not applicable. There is no downstream subgame, off-path history, active-set continuation, or numerical solver.

A direct reconstruction independent of the repository's solver path starts from the primitive payoff:

`W_i = b_D + Delta x_i + alpha A x_i(1-x_j) + (1-alpha)A(1-x_i)x_j`.

Collecting the terms in `x_i` gives

`W_i = constant(x_j) + x_i[Delta + alpha A - A x_j]`.

Therefore the coefficient signs determine the global optimum over the whole interval `[0,1]`, not merely a local candidate. Solving the two best-response correspondences reproduces the exact certified Nash sets in all three parameter regimes.

For the planner, direct summation gives

`W = 2b_D + (Delta+A)(x_1+x_2) - 2A x_1 x_2`.

Because this is bilinear on `[0,1]^2`, evaluating corners plus flat-edge boundary cases reproduces the exact planner sets. This reconstruction confirms that no omitted interior maximum or finite boundary deviation overturns T1--T3.

**Result:** `PASS`.

---

## Independent quantifier/function-class re-audit

### Headline baseline claims

- T1 threshold ordering: exact domain `Delta>0`, `0<alpha<1`; `PASS`.
- T2 unique duplication wedge: exact domain `Delta<A<Delta/(1-alpha)`; `PASS`.
- T3 high-`A` multiplicity: exact domain `A>Delta/(1-alpha)`; `PASS`.
- Boundary equality cases are stated separately; no strict/weak inflation found.

### Restricted CRS claim

The manuscript does not claim arbitrary production functions. An admissible nonbaseline linear CRS function was deliberately chosen to try to reverse the ordering; it preserves the ordering strictly. The general proof uses precisely the stated differentiability, degree-one homogeneity, and positive marginal-product conditions.

### Alternative matching

The manuscript does not claim arbitrary matching robustness and explicitly records that complete specialization fails under the alternative matching rule. The robust statement is narrower and survives.

### Endogenous capture

The permanent counterexample in the freeze correctly blocks the stronger claim that incomplete capture alone guarantees a finite decentralized threshold.

**Result:** `PASS`.

---

## Solver-failure / unresolved-continuation ledger

| Item | Count / state |
|---|---|
| Numerical equilibrium solver | Not used |
| Solver `None` | 0 |
| NaN/invalid branch | 0 |
| Nonconvergence | 0 |
| Discarded material deviation | 0 |
| Off-path continuation | Not applicable |
| `UNRESOLVED` continuation | 0 |
| `NUMERICAL_FAILURE` | 0 |

---

## Certification-regression ledger

No Stage-4A or Stage-7.5A certification regression was found.

- No new profitable corner/boundary deviation.
- No off-path or solver-failure path exists in the static analytic baseline.
- No admissible function inside the stated restricted CRS class reversed the threshold ordering.
- No manuscript first-best terminology drift.
- No arbitrary-matching or arbitrary-N/K quantifier inflation.
- The only scope wording issue (“general switching representation”) was expositional and has been narrowed to “binary switching representation”; the theorem statement itself was already correctly scoped.

**Certification regression count: `0`.**

---

## Consolidated severity table

| Attack | Pre-repair severity | Final state | Theory change? |
|---|---|---|---|
| Classic local-public-good spillover prior art omitted | MAJOR BUT FIXABLE | RESOLVED | No |
| Public-expenditure composition prior art omitted | MAJOR BUT FIXABLE | RESOLVED | No |
| Whole-game absorption by industrial-policy competition | MAJOR positioning risk | Stage 12 risk | No |
| Fixed capacity is result-driving | MAJOR BUT FIXABLE | RESOLVED by explicit scope | No |
| Host-jurisdiction incidence / ownership | MAJOR BUT FIXABLE | RESOLVED by explicit assumption | No |
| Welfare is transfer accounting | MAJOR BUT FIXABLE | RESOLVED | No |
| FOC/corner/globality | FATAL if true | ATTACK REJECTED | No |
| Restricted CRS generality false | FATAL if true | ATTACK REJECTED | No |
| Random-matching dependence | MAJOR | Scope-limited robustness survives | No |
| First-best benchmark drift | MAJOR if true | ATTACK REJECTED | No |
| Abstract “general” wording | MINOR | RESOLVED | No |
| High-`A` threshold wording | MINOR | RESOLVED | No |
| Upper-field-journal sufficiency | MAJOR positioning risk | OPEN FOR STAGE 12 | No |

---

## Required fixes and earliest affected stage

All fixes required to pass Stage 11 are bounded exposition/literature changes and have been implemented on `stage11-referee-gate`:

1. Add classic interjurisdictional-spillover and local-policy literature — Stage 10 literature repair.
2. Add explicit public-expenditure-composition prior art — Stage 10 literature repair.
3. Recalibrate novelty: no claim that incomplete capture itself is new — Stage 10 prose repair.
4. Identify fixed capacity as a maintained economic environment, not a derived or innocuous assumption — Stage 10 prose repair.
5. Identify the mapping from factor income to jurisdictional welfare as an incidence assumption and flag cross-ownership/transfers/bargaining as outside the baseline — Stage 10 prose repair.
6. Label the welfare object as aggregate modeled real surplus within the fixed-capacity benchmark — Stage 10 prose repair.
7. Replace broad “general switching representation” wording with the certified binary-switch scope — Stage 10 prose repair.

No Stage 4--8 theory stage is reopened.

---

## Theory-change implications

`NONE`.

The Stage 11 changes do not alter:

- players or timing;
- strategy sets;
- fixed capacity;
- payoffs;
- production or matching primitives;
- equilibrium concept;
- planner feasible set;
- theorem statements or quantifiers;
- threshold values;
- regression-test expectations.

`THEORY_FREEZE.md` remains unchanged.

---

## Resolved versus unresolved attacks

### Resolved

- mathematical/globality attacks;
- boundary and multiplicity attacks;
- restricted-function generality attack;
- benchmark terminology attack;
- welfare-accounting ambiguity;
- fixed-capacity assumption framing;
- jurisdictional-incidence framing;
- classic spillover-literature omission;
- expenditure-composition-literature omission;
- abstract/Introduction scope wording.

### Unresolved by design

Only journal ceiling remains unresolved. The paper may be publishable and correct while still being too narrow for an aspirational upper-field outlet. Stage 12 must make that judgment without modifying the certified result.

---

## Final Stage-11 verdict

`GO TO JOURNAL POSITIONING`

The manuscript has no unresolved fatal attack and no certification regression. The surviving contribution is narrower than the Stage-10 literature framing initially suggested, but it remains mathematically correct, institutionally interpretable, and distinct at the model/result level after the classic prior art is acknowledged.

## Stage-12 contract

Stage 12 must:

1. position the paper using the post-audit narrow contribution, not the generic incomplete-capture mechanism;
2. explicitly price the journal-ceiling risk created by the classic fiscal-externality literature;
3. compare plausible outlets by actual fit with regional industrial policy, fiscal federalism, regional science, and applied theory;
4. avoid selecting an aspirational journal if its contribution threshold would require adding a new mechanism or expanding theorem scope;
5. preserve `IPCRVC-THEORY-FREEZE-2026-09-07-v1` and all Stage-7.5A scope limits.
