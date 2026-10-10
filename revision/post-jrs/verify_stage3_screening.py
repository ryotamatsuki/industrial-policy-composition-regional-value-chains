#!/usr/bin/env python3
"""Stage-3 diagnostic only: exact-rational one-project matching game.

Tests global unilateral deviations at TWO profiles, not all equilibria, not
new theorem novelty. Run: python revision/post-jrs/verify_stage3_screening.py
"""
import sympy as s
Q=s.Rational; z=s.symbols("z",real=True)
D=[Q(1),Q(1,5),Q(1,5)]
A=[Q(3),Q(5,2)]
edges=[(0,1),(0,2)]
def margins(x,g):
    return [s.expand((A[e]/5+g[e])*x[0]*(1-x[j])-Q(1,10))
            for e,(_,j) in enumerate(edges)]
def payoff(k,x,e,g):
    v=D[k]*x[k]
    if e is None:return s.expand(v)
    i,j=edges[e];m=x[i]*(1-x[j])
    v-=g[e]*m/3
    if k==i:v+=Q(2,5)*A[e]*m
    if k==j:v+=Q(2,5)*A[e]*m
    return s.expand(v)
def result(x,g):
    p=margins(x,g);e=0 if p[0]>=p[1] else 1
    if p[e]<=0:return None,[payoff(k,x,None,g) for k in range(3)],s.Integer(0)
    return e,[payoff(k,x,e,g) for k in range(3)],p[e]
def best(k,x,g):
    xx=list(x);xx[k]=z;p=margins(xx,g);breaks={Q(0),Q(1)}
    for f in (p[0],p[1],p[0]-p[1]):
        for root in s.solve(f,z):
            if root.is_real and 0<root<1:breaks.add(root)
    b=sorted(breaks);v=[]
    for point in b:
        xx[k]=point;v.append(result(xx,g)[1][k])
    for l,h in zip(b[:-1],b[1:]):
        xx[k]=(l+h)/2;e=result(xx,g)[0]
        xx[k]=z;f=payoff(k,xx,e,g)
        v.extend([f.subs(z,l),f.subs(z,h)])
    return max(v)
def check(x,g):
    e,local,firm=result(x,g)
    assert all(s.simplify(best(k,x,g)-local[k])<=0 for k in range(3))
    total=s.simplify(sum(local)+firm);i,j=edges[e];m=x[i]*(1-x[j])
    assert s.simplify(total-sum(D[k]*x[k] for k in range(3))-A[e]*m+Q(1,10))==0
    return e,total
def main():
    a=check((Q(1),Q(0),Q(1)),(Q(0),Q(0)))
    b=check((Q(1),Q(1),Q(0)),(Q(0),Q(1,5)))
    assert a==(0,Q(41,10)) and b==(1,Q(18,5))
    print("STAGE3_WITNESS_PASS: grant shifts private project and regional roles")
    print("Welfare difference:",a[1]-b[1],"; novelty and all-NE set UNRESOLVED")
if __name__=="__main__":main()
