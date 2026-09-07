# Stage 10 Figure/Table Architecture Gate

Freeze: `IPCRVC-THEORY-FREEZE-2026-09-07-v1`

No visual below may communicate a stronger claim than the certified theorem or robustness scope.

| Headline result | Economic object | Primary vehicle | Why this vehicle | Verified source / generator | Required in final paper? |
|---|---|---|---|---|---|
| Exact decentralized equilibrium set | Nash regime as `A` crosses `A^N` | Proposition 1 | Exact set and boundary cases are theorem-level objects | `theorem_certificates/T3_HIGH_INTEGRATION_MULTIPLICITY.md`, `model/baseline.py` | Yes |
| Coordinated optimum | Fixed-capacity planner regime as `A` crosses `A^P` | Proposition 2 | Exact global optimizer set is concise analytically | `THEORY_FREEZE.md`, Appendix proof | Yes |
| Threshold ordering `A^P<A^N` | Separation of coordinated and local switching thresholds | Proposition 3 + regime figure | Visual makes the positive-measure middle region immediate | `scripts/generate_outputs.py` -> `figures/phase_regions.tex` | Yes |
| Priority Duplication Wedge | Unique decentralized duplication vs coordinated reallocation | Proposition 4 + regime figure | Central contribution is a regime/configuration contrast | Same generator; `theorem_certificates/T2_PRIORITY_DUPLICATION_WEDGE.md` | Yes |
| Exact threshold formulas and scope | Baseline and constant-capture thresholds | Generated table | Exact expressions and scope distinctions are easier to audit in a table | `scripts/generate_outputs.py` -> `tables/thresholds.tex` | Yes |
| Intermediate welfare loss | `L=A-Delta` within the wedge only | Equation + prose | A second visual would be redundant and could invite extrapolation outside the certified region | `scripts/verify_symbolic.py`, Appendix proof | Yes, no separate visual |
| High-`A` multiplicity | Efficient asymmetric NE coexist with inefficient symmetric NE | Proposition 1 + prose | Exact equilibrium set already conveys the structure | `theorem_certificates/T3_HIGH_INTEGRATION_MULTIPLICITY.md` | Yes, no extra visual |
| Constant-capture switching lemma | `G^P=Delta<G^N=Delta/lambda` | Proposition 5 | Binary sufficient-condition result is one-line algebra | `theorem_certificates/G1_CONSTANT_CAPTURE_SWITCHING.md` | Yes |
| Concave CRS / CES robustness | Incidence-based threshold ordering beyond Cobb--Douglas | Concise prose/equations | No shape needs visualization; scope is more important than magnitudes | `THEORY_FREEZE.md`, symbolic checks | Yes |
| Alternative matching | Coordinated set becomes `x_1+x_2=1` | Equation + prose | A figure could falsely suggest arbitrary-matching generality | Stage-7.5A regression counterexample | Yes, no separate visual |
| Institutional mapping | Scarce priorities and complementary value chains in policy practice | Concise prose | Evidence is qualitative/institutional, not a numerical comparison | Verified bibliography and policy sources | Yes |

## Gate decision

Required quantitative exposition objects are limited to one symbolic regime figure and one exact threshold/scope table. Both are generated deterministically from frozen formulas. No decorative figure is required. The alternative-matching result is deliberately not plotted because its role is to narrow, not broaden, the baseline geographic-specialization claim.
