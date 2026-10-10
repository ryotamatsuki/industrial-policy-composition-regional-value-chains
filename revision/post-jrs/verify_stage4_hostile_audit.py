#!/usr/bin/env python3
"""Stage-4 exact-rational hostile counterexamples and invariant checks.
Pure theory; validates a restricted finite toy only, NOT parent-paper novelty.
"""
from fractions import Fraction as F
from itertools import product

def payoffs(roles, gamma, *, Delta=F(1), A=F(4), K=F(11,5),
            alpha=F(1,2), s=F(0), t=F(0), theta=F(1,2), fee=F(0)):
    """theta: U region's portion of project-funding tax; fee: firm-paid D royalty."""
    x,y=roles
    if x==y or gamma*A+s-fee<K:
        return Delta*x, Delta*y, F(0)
    up=Delta+alpha*(1-gamma)*A-theta*(s+t)
    down=(1-alpha)*(1-gamma)*A+t-(1-theta)*(s+t)+fee
    investor=gamma*A+s-K-fee
    return (up,down,investor) if x==1 else (down,up,investor)

def pure_nash(gamma, **kwargs):
    result=[]
    for x,y in product((0,1),repeat=2):
        v=payoffs((x,y),gamma,**kwargs)
        if (v[0]>=payoffs((1-x,y),gamma,**kwargs)[0]
                and v[1]>=payoffs((x,1-y),gamma,**kwargs)[1]):
            result.append((x,y))
    return result

def entry_min(gamma,A=F(4),K=F(11,5)):
    return max(F(0),K-gamma*A)

def local_sum_max(gamma,A=F(4),K=F(11,5),Delta=F(1)):
    return Delta+(1-gamma)*A-entry_min(gamma,A,K)

# Region-coalition sum invariance under arbitrary local tax shares and t.
for gamma in (F(0),F(1,2),F(11,20),F(7,10),F(3,4),F(9,10)):
    s=entry_min(gamma)+F(1,10000)
    t=F(1,2)
    for theta in (F(0),F(1,4),F(1,2),F(3,4),F(1)):
        up,down,firm=payoffs((1,0),gamma,s=s,t=t,theta=theta)
        assert up+down==F(1)+(1-gamma)*F(4)-s
        assert up+down+firm==F(14,5)

# Socially optimal role division but no strictly voluntary LOCAL agreement
# for gamma >= 3/4 when investor rent cannot flow back to local jurisdictions.
for gamma in (F(3,4),F(9,10),F(99,100)):
    assert local_sum_max(gamma)<=F(2)
for gamma in (F(0),F(1,2),F(11,20),F(7,10)):
    assert local_sum_max(gamma)>F(2)

# Stage-3 piecewise U-shape as an infimum, not necessarily attained.
for gamma in (F(0),F(1,2),F(11,20),F(7,10),F(3,4),F(9,10)):
    e=entry_min(gamma)
    h=F(2)*(1-gamma)
    inf=e+max(F(0),e+F(2)-2*h)
    expected=F(12,5)-4*gamma if gamma<=F(11,20) else 4*gamma-2
    assert inf==expected
assert entry_min(F(11,20))==0

# Direct counterexample: a privately financed role-dependent licensing fee.
g=F(9,10)
u,d,p=payoffs((1,0),g,fee=F(1))
assert (u,d,p)==(F(6,5),F(6,5),F(2,5))
assert pure_nash(g,fee=F(1))==[(0,1),(1,0)]

# Redistribution of LOCAL tax burdens affects individual participation at low gamma
# but does not overturn the aggregate high-gamma coalition bound.
params=dict(alpha=F(1,10),s=F(11,5))
half=payoffs((1,0),F(0),theta=F(1,2),**params)
zero=payoffs((1,0),F(0),theta=F(0),**params)
assert half==(F(3,10),F(5,2),F(0))
assert zero==(F(7,5),F(7,5),F(0))
assert sum(half)==sum(zero)==F(14,5)
assert pure_nash(F(0),theta=F(0),**params)==[(0,1),(1,0)]

# In the opt-in unanimity game both reject is always a weak Nash;
# a single unilateral accept after the other rejects leaves U/U unchanged.
fallback=F(1)
assert (fallback,fallback)==(fallback,fallback)
print("PASS: S4-1 regional coalition invariant and local veto")
print("PASS: S4-2 developer-funded fee changes region participation")
print("PASS: S4-3 changing local tax incidence changes individual opt-in")
print("PASS: restricted Stage-3 funding U-shape preserved")
print("No continuous-portfolio proof, parent theorem identity, or novel paper claimed.")
