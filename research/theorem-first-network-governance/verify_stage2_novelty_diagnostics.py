#!/usr/bin/env python3
"""Stage 2 theory-only non-novelty diagnostic.
Shows a generic local-vs-national FOC identity, and that local policy
direction is unidentified by identical national network welfare alone.
THIS IS NOT a solved GE, government Nash, or academic novelty theorem.
"""
import sympy as sp
from fractions import Fraction as F

s1,s2=sp.symbols("s1 s2",real=True)
v1=sp.Function("V_1")(s1,s2)
v2=sp.Function("V_2")(s1,s2)
W=v1+v2
assert sp.simplify(sp.diff(W,s1)-sp.diff(v1,s1)-sp.diff(v2,s1))==0
assert sp.simplify(sp.diff(W,s2)-sp.diff(v1,s2)-sp.diff(v2,s2))==0

# Both incidence schemes generate identical national network surplus.
# But the regional policymaker can favor or oppose the switch.
no_switch=(F(5),F(5))
allocations={"aligned":(F(7),F(5)),
             "opposed":(F(4),F(8))}
assert sum(no_switch)==F(10)
for name, switched in allocations.items():
    national_gain=sum(switched)-sum(no_switch)
    local_gain=switched[0]-no_switch[0]
    assert national_gain==F(2)
    assert (local_gain>0)==(name=="aligned")

# Jump decomposition holds for ANY two regional income allocations.
for switched in allocations.values():
    assert (sum(switched)-sum(no_switch) ==
            (switched[0]-no_switch[0])+
            (switched[1]-no_switch[1]))
print("PASS: FOC and one-sided jump decomposition identities")
print("PASS: opposite regional policy incentives for same national gain")
print("NO welfare/Nash/novelty claim can be made without real market income incidence")
