#!/usr/bin/env python3
"""Stage 4: exact rational A1 parameter-slice regression (NOT a novelty proof).

For every tested subsidy schedule, enumerate each regional player's complete
one-dimensional continuation payoff envelope, including project-switch and
entry boundaries, and verify Nash status of the two role profiles.
Run: python revision/post-jrs/verify_stage4_a1_no_go.py (requires sympy).
"""
from fractions import Fraction as F
import sympy as S

D=(F(1),F(1,5),F(1,5))
A=(F(3),F(5,2))
K=F(1,10)
G=F(1,5)
W=(F(1,3),)*3

def calculate(x,t):
    m=(x[0]*(1-x[1]),x[0]*(1-x[2]))
    p=[(G*A[e]+t[e])*m[e]-K for e in (0,1)]
    e=0 if p[0]>=p[1] else 1
    if p[e]<=0:
        u=tuple(D[i]*x[i] for i in range(3))
        return -1,u,F(0),sum(u)
    u=[]
    for i in range(3):
        v=D[i]*x[i]-t[e]*m[e]*W[i]
        if i==0 or i==e+1:
            v+=(1-G)*F(1,2)*A[e]*m[e]
        u.append(v)
    return e,tuple(u),p[e],sum(u)+p[e]

def fixed_project_payoff(i,x,t,e):
    if e==-1:
        return D[i]*x[i]
    m=x[0]*(1-x[e+1])
    v=D[i]*x[i]-t[e]*m*W[i]
    if i==0 or i==e+1:
        v+=(1-G)*F(1,2)*A[e]*m
    return v

def deviation_supremum(x,t,i):
    z=S.symbols("z",real=True)
    y=list(x);y[i]=z
    m=[y[0]*(1-y[j]) for j in (1,2)]
    p=[(S.Rational(G.numerator,G.denominator)*
        S.Rational(A[e].numerator,A[e].denominator)+
        S.Rational(t[e].numerator,t[e].denominator))*m[e]-S.Rational(1,10)
        for e in (0,1)]
    pts={S.Rational(0),S.Rational(1)}
    for expression in (p[0],p[1],p[0]-p[1]):
        for root in S.solve(expression,z):
            if root.is_real and 0<root<1:
                pts.add(root)
    pts=sorted(pts)
    scores=[]
    for q in pts:
        y=list(x);y[i]=F(int(q.p),int(q.q))
        scores.append(calculate(y,t)[1][i])
    for a,b in zip(pts[:-1],pts[1:]):
        mid=(a+b)/2
        y=list(x);y[i]=F(int(mid.p),int(mid.q))
        active=calculate(y,t)[0]
        for q in (a,b):
            y=list(x);y[i]=F(int(q.p),int(q.q))
            scores.append(fixed_project_payoff(i,y,t,active))
    return max(scores)

def test_schedule(t):
    assert t[0]>=0 and t[1]>=0 and sum(t)<=F(1,5)
    candidates=[
        ((F(1),F(0),F(1)), t[1]-t[0]<=F(1,10),0,F(41,10)),
        ((F(1),F(1),F(0)), t[1]-t[0]>F(1,10),1,F(18,5))
    ]
    for x,expected_nash,project,expected_welfare in candidates:
        e,u,pi,total=calculate(x,t)
        assert e==project and total==expected_welfare
        gains=[deviation_supremum(x,t,i)-u[i] for i in range(3)]
        assert (max(gains)<=0)==expected_nash,(t,x,gains)

def main():
    schedules=[(F(0),F(0)),(F(0),F(1,10)),
               (F(0),F(11,100)),(F(0),F(1,5)),
               (F(1,10),F(1,10)),(F(1,5),F(0))]
    schedules.extend((F(i,100),F(j,100))
        for i in range(21) for j in range(21-i))
    for t in schedules:
        test_schedule(t)
    # Full-game role switch has the same real-welfare effect as the fixed-x
    # benchmark if both unselected recipients have equal direct premiums.
    a,b,d2,d3,k1,k2=S.symbols("a b d2 d3 k1 k2")
    full=(1+d3+a-k1)-(1+d2+b-k2)
    fixed=(1+a-k1)-(1+b-k2)
    assert S.expand(full-fixed)==d3-d2
    assert S.expand(full-fixed).subs({d2:S.Rational(1,5),
                                      d3:S.Rational(1,5)})==0
    print("STAGE4_RESTRICTED_SLICE_REGRESSION_PASS")
    print("Exact schedules checked:",len(schedules))
    print("Equilibrium project switch: s13-s12 > 1/10")
    print("Best social outcome: 41/10 at zero subsidy, no remedy required")
    print("Fixed-portfolio counterpart already generates welfare loss 1/2")
    print("General model/novel full-game theorem: NOT CERTIFIED")

if __name__=="__main__":
    main()
