#!/usr/bin/env python3
"""Stage 3 two-bottleneck fiscal model: exact-rational four-profile game audit.
Exploratory pure-theory screening, NOT published-parent replication or novelty proof.
"""
from fractions import Fraction as F
from itertools import product

DELTA, A, K, ALPHA = F(1), F(4), F(11, 5), F(1, 2)
EPS = F(1, 10000)
GAMMAS = [F(0), F(1, 5), F(1, 2), F(11, 20), F(7, 10), F(3, 4), F(9, 10), F(99, 100)]

def terms(gamma):
    e = max(F(0), K - gamma * A)
    h = (1 - ALPHA) * (1 - gamma) * A
    t_inf = max(F(0), e + 2 * DELTA - 2 * h)
    b_inf = e + t_inf
    return e, t_inf, b_inf

def payoffs(x, gamma, s, t):
    x1, x2 = x
    if x1 == x2 or gamma * A + s < K:
        return (DELTA*x1, DELTA*x2, F(0), False)
    b = s + t
    upstream = DELTA + ALPHA * (1-gamma)*A - b/2
    downstream = (1-ALPHA)*(1-gamma)*A + t - b/2
    investor = gamma*A+s-K
    if x1:
        return (upstream, downstream, investor, True)
    return (downstream, upstream, investor, True)

def pure_nash(gamma,s,t):
    profiles=list(product((0,1), repeat=2))
    out=[]
    for x in profiles:
        v=payoffs(x,gamma,s,t)
        if v[0]>=payoffs((1-x[0],x[1]),gamma,s,t)[0] and v[1]>=payoffs((x[0],1-x[1]),gamma,s,t)[1]:
            out.append(x)
    return out

assert DELTA+A-K == F(14,5)
assert DELTA+A-K-2*DELTA == F(4,5)
for gamma in GAMMAS:
    e, t_inf, b_inf = terms(gamma)
    expected = F(12,5)-4*gamma if gamma<=F(11,20) else 4*gamma-2
    assert b_inf==expected
    assert pure_nash(gamma,F(0),F(0)) == [(1,1)]
    # Make both entry and downstream STRICT even when the minimum is attained.
    s=e+EPS
    h=(1-ALPHA)*(1-gamma)*A
    t=max(F(0),s+2*DELTA-2*h)+EPS
    assert pure_nash(gamma,s,t)==[(0,1),(1,0)]
    up,down,profit,active=payoffs((1,0),gamma,s,t)
    assert active and profit>0 and down>DELTA and up>0
    assert up+down+profit==DELTA+A-K
    voluntarily_both_better=up>DELTA and down>DELTA
    assert voluntarily_both_better==(gamma<F(3,4))
    fiscal_ir_cap=2*ALPHA*(1-gamma)*A
    assert (b_inf<fiscal_ir_cap)==(gamma<F(3,4))
    print("gamma",gamma,"s_inf",e,"t_inf",t_inf,"B_inf",b_inf,
          "IRcap",fiscal_ir_cap,"NE",pure_nash(gamma,s,t),
          "strict voluntary",voluntarily_both_better)
assert terms(F(11,20))[2]==F(1,5)
print("PASS exact four-profile Nash, national welfare, appropriation U shape and voluntary veto.")
print("Scope: binary toy, no general continuous-strategy or publication novelty result.")
