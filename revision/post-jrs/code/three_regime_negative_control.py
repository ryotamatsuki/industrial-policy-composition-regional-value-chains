#!/usr/bin/env python3
"""Exact rational negative controls (NOT original scholarly theorems).

Source-inspired: Ventura (2019), JEEA, Proposition 1, with >=3 regions,
project-by-project parliamentary decisions. beta is a project's OWN-local
NET welfare; epsilon is TOTAL external welfare across other regions.
Regional parliament selects projects iff beta>=0.
National majority selects projects iff epsilon>=0 in Ventura's model.
No intervention means no publicly financed project. This is NOT a
full private-economy laissez-faire benchmark with firms and entry.

Second check is a toy linear-instrument model, NOT Miranda-Pinto's GE.
"""

from fractions import Fraction as F

def welfare(projects):
    ans = dict(no_public_project=F(0), regional_decision=F(0),
               national_parliament=F(0), first_best=F(0))
    for beta, eps in projects:
        total = beta + eps
        if beta >= 0:
            ans["regional_decision"] += total
        if eps >= 0:
            ans["national_parliament"] += total
        if total >= 0:
            ans["first_best"] += total
    return ans

cases = {
    "no_public_project": [(F(1), F(-3)), (F(-3), F(1))],
    "regional_decision": [(F(4), F(-1))],
    "national_parliament": [(F(-1), F(4))],
}
for expected, projects in cases.items():
    result = welfare(projects)
    actual = {k:v for k,v in result.items() if k != "first_best"}
    best = max(actual, key=actual.get)
    assert list(actual.values()).count(actual[best]) == 1
    assert best == expected
    assert result["first_best"] >= actual[best]
    print(expected, {k: str(v) for k,v in result.items()})

# B = [[1,1],[1,-1]]: y1=t1+t2, y2=t1-t2.
# Local govt 1 controls t1, aims y1=d1. Local govt 2 controls
# t2, aims y2=d2. Their concave utilities are -0.5*(y_i-d_i)^2.
# The unique Nash satisfies B*t=d whenever feasible, which is also
# the costless national planner's target. Thus splitting rights over
# columns DOES NOT automatically reduce aggregate feasible rank
# and does not automatically generate equilibrium inefficiency.
d1, d2 = F(2), F(0)
t1, t2 = (d1+d2)/2, (d1-d2)/2
assert (t1+t2, t1-t2) == (d1,d2)
for h in [F(-2), F(-1,3), F(1,2), F(3)]:
    # Deviating from a target matching own concave objective hurts.
    assert -((t1+h+t2-d1)**2)/2 < 0
    assert -((t1-(t2+h)-d2)**2)/2 < 0
print("policy_rights", {"B_rank": 2, "regional_NE": (t1,t2),
                        "central_target": (t1,t2)})
print("PASS: exact-fraction tests; zero original-theorem claim.")
