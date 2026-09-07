# T2 — Priority Duplication Wedge

- Freeze: `IPCRVC-THEORY-FREEZE-2026-09-07-v1`
- Exact quantifiers: for all `Delta > 0`, `0 < alpha < 1`, and `Delta < A < Delta/(1-alpha)`.
- Exact claim: the unique pure-strategy Nash equilibrium of the baseline continuous game is `(1,1)`, while the coordinated fixed-capacity planner strictly prefers `(1,0)` or `(0,1)`.
- Equilibrium concept: pure-strategy Nash equilibrium.
- Globality: global over `[0,1]^2`; not an FOC/interior claim.
- Welfare benchmark: coordinated fixed-capacity planner, not first best.
- Proof maturity: `PROVED`.
- Stage 4A: `PASS`.
- Verification: `scripts/verify_symbolic.py`; `tests/test_regressions.py::test_r1_intermediate_wedge`.
- Allowed wording: unique decentralized priority duplication versus coordinated reallocation in a positive-measure baseline parameter region.
- Prohibited wording: coordination generally implies complete regional specialization.
