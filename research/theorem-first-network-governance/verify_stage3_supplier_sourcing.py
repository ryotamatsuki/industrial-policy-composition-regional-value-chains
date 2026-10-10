#!/usr/bin/env python3
"""Stage 3 exact-rational diagnostic: governments invest then private buyers relink.
This is a negative novelty test, NOT a full Poirier GE or publication theorem.
"""
from fractions import Fraction as F
from itertools import product

PROFILES=tuple(product((0,1),repeat=2))

def solve(h,k,domestic_only=False):
    assert 0<h<1 and k>0
    def continuation(g):
        costs=[];links=[]
        for buyer in range(2):
            quotes=[F(2)-g[s]+(h if s!=buyer else F(0)) for s in range(2)]
            origin=buyer if domestic_only else min(range(2),key=lambda s:(quotes[s],s!=buyer))
            links.append(origin)
            costs.append(quotes[origin])
        u=tuple(F(2)-costs[i]-k*g[i] for i in range(2))
        return tuple(links),u,sum(u)
    results={g:continuation(g) for g in PROFILES}
    nash=[]
    for g in PROFILES:
        if all(results[g][1][i] >=
            results[tuple(1-x if j==i else x for j,x in enumerate(g))][1][i]
            for i in range(2)):nash.append(g)
    best=max(r[2] for r in results.values())
    planner=[g for g,r in results.items() if r[2]==best]
    return results,nash,planner

total=0
for hn in range(1,10):
    h=F(hn,10)
    for kn in range(1,31):
        k=F(kn,10)
        if k in (h,F(1),2-h):continue
        r,ne,pl=solve(h,k)
        ene=([(1,1)] if k<h else ([(0,1),(1,0)] if k<1 else [(0,0)]))
        epl=([(1,1)] if k<h else ([(0,1),(1,0)] if k<2-h else [(0,0)]))
        assert ne==ene,(h,k,ne)
        assert pl==epl,(h,k,pl)
        assert r[(0,0)][2]==0
        assert r[(1,0)][2]==2-h-k
        assert r[(1,1)][2]==2-2*k
        if 1<k<2-h:
            _,fixed_ne,fixed_pl=solve(h,k,domestic_only=True)
            assert fixed_ne==fixed_pl==[(0,0)]
        total+=1

r,ne,pl=solve(F(1,4),F(6,5))
assert ne==[(0,0)] and pl==[(0,1),(1,0)]
assert r[(1,0)][2]==F(11,20)
assert r[(1,0)][0]==(0,0) and r[(0,1)][0]==(1,1)
print("PASS",total,"exact-rational nonboundary regimes, complete deviations")
print("PASS fixed-domestic nested benchmark and welfare gap 11/20")
print("NO-GO: established public-goods free-riding mechanism, not a novel theorem")
