# T1 — Baseline Threshold Ordering

- Freeze: `IPCRVC-THEORY-FREEZE-2026-09-07-v1`
- Type: threshold / benchmark comparison
- Exact claim: for all `Delta > 0`, `A > 0`, and `0 < alpha < 1`, the baseline coordinated fixed-capacity threshold is `A^P = Delta` and the decentralized threshold is `A^N = Delta/(1-alpha)`, hence `A^P < A^N`.
- Strategy domain: `x_i in [0,1]`.
- Functional form: frozen baseline payoff in `THEORY_FREEZE.md`.
- Status: global baseline result.
- Proof maturity: `PROVED`.
- Stage 4A: `PASS`.
- Stage 7.5A scope: baseline closed-form theorem; no arbitrary matching/production generality implied.
- Verification: `scripts/verify_symbolic.py`; regression tests R1–R4.
- Allowed wording: strict threshold ordering in the baseline continuous portfolio game.
- Prohibited wording: generic decentralization theorem for arbitrary games.
