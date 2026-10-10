#!/usr/bin/env python3
"""Stage 2 pure-theory minimal model checks, 2026-10-10.
SymPy identities plus exact-rational examples and sampled unilateral deviations.
Not a full published-parent model replication or a novelty certification.
"""
import sympy as sp

X, x1, x2, A, Delta, alpha, t = sp.symbols(
    "X x1 x2 A Delta alpha t", positive=True, real=True
)
Y = A*X**alpha*(2-X)**(1-alpha)
pU, pD = alpha*Y/X, (1-alpha)*Y/(2-X)
Yp, Ypp = sp.diff(Y,X), sp.diff(Y,X,2)
assert sp.simplify(sp.together(Yp-(pU-pD)))==0
assert sp.simplify(sp.together(X*sp.diff(pU,X)+(2-X)*sp.diff(pD,X)))==0
assert sp.simplify(sp.together(Ypp+alpha*(1-alpha)*Y*(1/X+1/(2-X))**2))==0
R1=Delta*x1+x1*pU.subs(X,x1+x2)+(1-x1)*pD.subs(X,x1+x2)
pred=Delta+Yp.subs(X,x1+x2)+(x1-x2)*Ypp.subs(X,x1+x2)/2
assert sp.simplify(sp.together(sp.diff(R1,x1)-pred))==0

# Market-price example: Delta=1, alpha=.5, A=1.5.
params={A:sp.Rational(3,2),Delta:1,alpha:sp.Rational(1,2)}
xstar=sp.Rational(1,2)+sp.sqrt(13)/13
assert sp.simplify((Delta+Yp).subs(params).subs(X,2*xstar))==0
rstar=float(R1.subs(params).subs({x1:xstar,x2:xstar}))
for k in range(1001):
    z=sp.Rational(k,1000)
    assert float(R1.subs(params).subs({x1:z,x2:xstar})) <=rstar+1e-10

# Uniform complement-technology investment, old high-A Nash correspondence.
Ab, d, a, g=sp.Rational(3,2),sp.Integer(1),sp.Rational(1,2),sp.Rational(3,5)
Ae=Ab+g
q=a+d/Ae
Wspec=d+Ae
Wsym=2*(d+Ae)*q-2*Ae*q*q
assert q==sp.Rational(41,42)
assert Wspec-Wsym==sp.Rational(21,20)

# Budget-balanced role-contingent transfer. Replicates old H01 mechanism.
L=d-(1-a)*Ab
U=a*Ab
tstar=sp.Rational(1,2)
assert (L,U)==(sp.Rational(1,4),sp.Rational(3,4))
assert L<tstar<U
deriv1=d+a*Ab-Ab*x2-tstar*(1-x2)
assert deriv1.subs(x2,0)>0 and deriv1.subs(x2,1)>0
assert d-(1-a)*Ab-tstar<0
assert a*Ab-tstar>0 and (1-a)*Ab+tstar-d>0

print("PASS: price identities, strict-concavity formula and fiscal bounds")
print("A: symmetric efficient x*=",sp.N(xstar,12))
print("B0: A_eff=",Ae,"symmetric q=",q,"planner gap=",Wspec-Wsym)
print("B1: transfer interval",L,"<t<",U,"tested t=",tstar)
print("Novelty: NONE asserted; all are limited theoretical diagnostics.")
