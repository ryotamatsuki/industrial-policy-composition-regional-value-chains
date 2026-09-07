# Stage 10 — Section-by-Section Paper Construction Report

## Verdict

`FULL DRAFT READY FOR REFEREE GATE`

Canonical freeze: `IPCRVC-THEORY-FREEZE-2026-09-07-v1`  
Stage 10 starting `main`: `7665a22b00e031596e39cca47fb5f1b9508d84bf`  
Implementation branch: `stage10-paper-construction`  
Pull request: `#2 — Stage 10: full manuscript construction`

The Stage 8 theory freeze is unchanged. `THEORY_FREEZE.md` is not part of the Stage 10 diff.

## 1. Section map

| Section | Source file | Function | Frozen inputs | Verification / evidence |
|---|---|---|---|---|
| Abstract | `paper/sections/abstract.tex` | State the composition-specific decentralization result and its scope | T1–T3, G1, robustness ledger | Full LaTeX build; claim-scope audit |
| Introduction | `paper/sections/introduction.tex` | Motivate fixed-capacity composition, state exact thresholds, distinguish contribution | T1–T3, Stage 6 novelty re-kill, Stage 7/7.5A scope | Full build; bibliography resolution; overclaim audit |
| Related Literature | `paper/sections/related_literature.tex` | Separate the contribution from subsidy competition, upstream/downstream policy, innovation coordination, and smart specialization | Stage 6 novelty ledger | Verified bibliography; citations resolve |
| Model | `paper/sections/model.tex` | State players, fixed capacity, direct surplus, Cobb–Douglas incidence, random matching, payoff | Exact Stage 8 baseline | `model/baseline.py`; symbolic payoff check; full build |
| Decentralized Equilibrium | `paper/sections/equilibrium.tex` | Derive payoff difference, best response, strategic substitutes, exact Nash set | Stage 4A T1/T3/T4 certificates | SymPy checks; regression tests; Appendix proof |
| Coordinated Benchmark and Welfare | `paper/sections/welfare.tex` | Define constrained benchmark, exact planner set, threshold ordering, Priority Duplication Wedge, welfare loss | Stage 4A T1/T2/T5/T6 | Symbolic checks; regressions; Appendix proof |
| Mechanism and Robustness | `paper/sections/robustness.tex` | Isolate constant-capture switching mechanism and certified robustness limits | Stage 7 and Stage 7.5A | G1 certificate; counterexample tests; Appendix derivations |
| Institutional Interpretation | `paper/sections/institutional_bridge.tex` | Map scarcity/complementarity to smart specialization and place-based policy without calibration claims | Stage 7 institutional ledger | Verified policy/literature sources; qualifiers retained |
| Conclusion | `paper/sections/conclusion.tex` | Restate result and limits without centralization/first-best overclaim | Claim-scope ledger | Scope audit; full build |
| Appendix | `paper/sections/appendix.tex` | Supply complete analytic proofs and robustness derivations | All certified theorem objects used in manuscript | Cross-reference build; symbolic/regression support |

## 2. Main theorem/exposition map

The mandatory Figure/Table Architecture Gate is recorded in `docs/FIGURE_TABLE_ARCHITECTURE.md`.

| Result | Primary exposition vehicle | Generated / verified source |
|---|---|---|
| Exact Nash set | Proposition | `theorem_certificates/T3_HIGH_INTEGRATION_MULTIPLICITY.md`; Appendix proof |
| Exact coordinated optimum | Proposition | `THEORY_FREEZE.md`; Appendix proof |
| `A^P < A^N` | Proposition + regime figure | `scripts/generate_outputs.py` -> `figures/phase_regions.tex` |
| Priority Duplication Wedge | Proposition + regime figure | T2 certificate + same generator |
| Threshold formulas and scope | Generated table | `scripts/generate_outputs.py` -> `tables/thresholds.tex` |
| Intermediate welfare loss `L=A-Delta` | Equation + prose | symbolic verification + Appendix proof |
| High-`A` multiplicity/inefficiency | Proposition + prose | T3 certificate + symbolic gap identity |
| Constant-capture switching wedge | Proposition | G1 certificate + Appendix proof |
| Concave CRS / CES robustness | Equations + prose | Stage 7.5A restricted-function scope |
| Alternative matching | Equations + prose | permanent scope regression + Appendix proof |

Only one regime figure and one exact threshold/scope table are required. No decorative visual is included.

## 3. Mathematical objects and traceability

### Baseline payoff

Manuscript equation:

`W_i = b_D + Delta x_i + alpha A x_i(1-x_j) + (1-alpha)A(1-x_i)x_j`.

Traceability:

- `THEORY_FREEZE.md`
- `model/baseline.py`
- `scripts/verify_symbolic.py`
- `paper/sections/model.tex`

### Decentralized threshold

`A^N = Delta/(1-alpha)`.

Traceability:

- Stage 4A theorem certificates
- `theorem_certificates/T1_THRESHOLD_ORDERING.md`
- `paper/sections/equilibrium.tex`
- Appendix proof

### Coordinated threshold

`A^P = Delta` under the coordinated fixed-capacity planner benchmark.

Traceability:

- `docs/BENCHMARK_REGISTER.md`
- `paper/sections/welfare.tex`
- Appendix proof

### Priority Duplication Wedge

For `Delta < A < Delta/(1-alpha)`, `(1,1)` is the unique Nash equilibrium while `(1,0)` and `(0,1)` are the coordinated optima.

Traceability:

- `theorem_certificates/T2_PRIORITY_DUPLICATION_WEDGE.md`
- regression test R1
- `paper/sections/welfare.tex`
- Appendix proof

### General switching lemma

`G^P=Delta < Delta/lambda = G^N`, `0<lambda<1`, for the certified binary configuration comparison only.

Traceability:

- `theorem_certificates/G1_CONSTANT_CAPTURE_SWITCHING.md`
- `docs/CLAIM_SCOPE_LEDGER.md`
- `paper/sections/robustness.tex`

## 4. Literature/reference checks

The Stage 10 bibliography contains verified records used for the paper's actual literature and institutional claims, including:

- Chen and Li (2026), local industrial-policy competition;
- Tian, Wang, and Zhang (2027; online 2026), local specialization and bottom-up industrial policy;
- Wang, Xu, Yang, and Zhu (2024), multi-economy/multi-sector strategic industrial policy;
- Fischer (2017) and Fischer, Greaker, and Rosendahl (2018), upstream/downstream strategic policy;
- Borota Milicevic et al. (2026), innovation-policy coordination;
- Foray, Eichler, and Keller (2021), smart-specialization policy design;
- OECD (2025), place-based industrial policy;
- EISMEA (2026), Interregional Innovation Investments.

The Introduction and Related Literature explicitly avoid claiming novelty for industrial-policy competition, duplication, upstream/downstream policy, or coordination per se.

## 5. Build and verification gates

On the Stage 10 branch, the following automated gates pass together:

1. exact SymPy identities: `PASS`;
2. permanent pytest regression/counterexample suite: `8 passed`;
3. deterministic table/figure generation: `PASS`;
4. bibliography-aware LaTeX sequence: `pdflatex -> bibtex -> pdflatex -> pdflatex`: `PASS`;
5. unresolved citation/reference guard on the final LaTeX log: required before merge;
6. GitHub `verification` workflow: `SUCCESS`;
7. GitHub `manuscript-build` workflow: `SUCCESS` on the full draft prior to the final log guard.

The final post-guard CI run is the merge gate.

## 6. Figure/table generation

`make outputs` deterministically generates:

- `figures/phase_regions.tex` — symbolic baseline regime map using the exact thresholds `A^P=Delta` and `A^N=Delta/(1-alpha)`;
- `figures/phase_regions.svg` — browser-readable companion, explicitly non-authoritative;
- `tables/thresholds.tex` — exact threshold formulas and certified scope;
- `results/generated_manifest.json` — provenance manifest.

No hand-entered numerical result is used in the manuscript.

## 7. Scope controls retained in the draft

The manuscript does not claim:

- a first best;
- optimal centralization;
- generic duplication under decentralization;
- complete regional specialization under arbitrary matching;
- arbitrary production-function robustness;
- arbitrary numbers of regions or activities;
- a finite local integration threshold from incomplete capture alone;
- efficiency of every high-complementarity equilibrium.

The endogenous-capture counterexample and the alternative-matching counterexample are retained in the prose/proofs as permanent limits on exposition.

## 8. Remaining manuscript gaps

No mathematical, citation, cross-reference, or exposition-architecture blocker remains for Stage 11.

Items intentionally deferred because they are not Stage 10 theory-construction requirements:

- author/affiliation metadata;
- journal-specific formatting and word/page optimization;
- journal-specific cover material and submission metadata;
- final target-journal positioning.

These items must not be used to alter the frozen theory.

## 9. Stage 11 contract

Stage 11 must conduct a hostile full-manuscript referee audit. It should attack, rather than extend, the completed draft on at least:

1. whether fixed policy capacity is economically substantive rather than payoff engineering;
2. whether the incidence interpretation of `alpha`/`lambda` is defensible;
3. whether the Priority Duplication Wedge is nontrivial relative to the closest literature;
4. whether the random-matching baseline is sufficiently motivated given the alternative-matching robustness;
5. whether welfare accounting of `Delta` remains a real-surplus concept throughout the prose;
6. whether the Introduction overstates generality relative to Stage 7.5A;
7. whether every proposition, boundary case, proof, table, and figure matches the certified domain;
8. whether the manuscript is sufficiently substantive for a full upper-field-journal paper without adding a new mechanism.

Stage 11 may recommend exposition repairs or a diagnosed rollback, but may not add an unmotivated extension merely to increase perceived sophistication.
