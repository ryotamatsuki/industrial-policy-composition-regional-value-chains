#!/usr/bin/env python3
"""Stage 1 F-RISK: exact-rational NEGATIVE CONTROL, not an original theorem.

A NATIONAL policy s and LOCAL dedicated infrastructure K interact with a
private firm's exogenous operating probability p. Local resident gross
benefit B and national nonlocal benefit S accrue if operating. Upon
failure only, infrastructure has salvage value r*K. A prior lump-sum
transfer t is free to be positive (national -> local) or negative
(local -> national); the signed contract is assumed enforceable.
This is a static risk-neutral illustrative model, NOT endogenous location,
firm exit, information, insurance, debt, or post-investment bailout.
"""
from fractions import Fraction as Q
from itertools import product

def compute(p, B, S, K, r, s):
    assert 0 <= p <= 1 and 0 <= r <= 1 and K >= 0 and s >= 0
    expected_infrastructure_cost = K * (1 - (1-p)*r)
    local0 = p*B - expected_infrastructure_cost
    national0 = p*S - s
    social = local0 + national0
    transfer_lower = -local0
    transfer_upper = national0
    return dict(c=expected_infrastructure_cost, L0=local0,
                N0=national0, W=social, t_min=transfer_lower,
                t_max=transfer_upper,
                exists_signed_transfer=transfer_lower <= transfer_upper,
                exists_nonnegative_transfer=max(Q(0), transfer_lower) <= transfer_upper)

cases = {
    "municipality_declines_socially_good_project": (Q(4,5),Q(4),Q(5),Q(5),Q(1,2),Q(1)),
    "municipality_wants_socially_bad_project":  (Q(4,5),Q(8),Q(0),Q(5),Q(1,2),Q(3)),
    "efficient_mutual_opt_out":                 (Q(2,5),Q(3),Q(3),Q(6),Q(0),Q(1))
}
for label, vals in cases.items():
    z = compute(*vals)
    if label.startswith("municipality_declines"):
        assert z["L0"] < 0 < z["W"] and z["t_min"] == Q(13,10)
        assert z["t_max"] == Q(3) and z["exists_nonnegative_transfer"]
    if label.startswith("municipality_wants"):
        assert z["L0"] > 0 > z["W"] and not z["exists_signed_transfer"]
    if label.startswith("efficient"):
        assert z["L0"] < 0 and z["W"] < 0
    print(label, {k: str(v) for k,v in z.items()})

n=0
for p,B,S,K,r,s in product(
    (Q(1,4),Q(1,2),Q(3,4)),
    (Q(0),Q(1),Q(4),Q(8)),
    (Q(-2),Q(0),Q(3),Q(7)),
    (Q(1),Q(3),Q(6)),
    (Q(0),Q(1,2),Q(1)),
    (Q(0),Q(1),Q(3))
):
    z=compute(p,B,S,K,r,s)
    # Standard transferable utility: interval [t_min,t_max] nonempty
    # iff joint incremental project surplus W >=0. This is algebra.
    assert z["exists_signed_transfer"] == (z["W"]>=0)
    n+=1
assert n==1296
print(f"PASS {n} exact grid tests; no new economic theory proven.")
