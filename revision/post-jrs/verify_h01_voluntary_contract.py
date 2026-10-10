#!/usr/bin/env python3
"""H01 pilot: voluntary bilateral compensation on the frozen 2-region game.

These exact symbolic tests check an institution-specific example plus the
primitive inequalities needed to apply Jackson--Wilkie (2005) Theorem 2.
They are NOT a novelty certificate, unrestricted-contract-game solver, or
legal proof of enforceability. Requires SymPy.
"""
import sympy as sp
from fractions import Fraction as F

D,A,a,t,x,y,e=sp.symbols("Delta A alpha t x1 x2 epsilon",positive=True)
b=sp.symbols("b_D",real=True)

def w(z,r):
    return b+D*z+a*A*z*(1-r)+(1-a)*A*(1-z)*r

w1,w2=w(x,y),w(y,x)
T=t*x*(1-y)
u1,u2=w1-T,w2+T
L=D-(1-a)*A
U=a*A

def eq(lhs,rhs):
    assert sp.simplify(lhs-rhs)==0,(lhs,rhs)

def main():
    eq(sp.diff(u1,x),D+a*A-A*y-t*(1-y))
    eq(sp.diff(u2,y),D+a*A-A*x-t*x)
    eq(sp.diff(u1,x).subs(y,1),L)
    eq(sp.diff(u2,y).subs(x,1),L-t)
    eq(u1.subs({x:1,y:0})-w1.subs({x:1,y:1}),U-t)
    eq(u2.subs({x:1,y:0})-w2.subs({x:1,y:1}),t-L)
    eq(U-L,A-D)
    eq(u1+u2,w1+w2)
    eq(w1.subs({x:1,y:0})+w2.subs({x:1,y:0}),2*b+D+A)
    eq(w1.subs({x:1,y:1})+w2.subs({x:1,y:1}),2*b+2*D)
    eq(u1.subs({x:1,y:0,t:L+e}),b+A-e)
    eq(u2.subs({x:1,y:0,t:L+e}),b+D+e)
    eq(2*(b+A)-(2*b+D+A),A-D)
    witness={D:sp.Integer(1),A:sp.Rational(3,2),a:sp.Rational(1,2)}
    low=sp.simplify(L.subs(witness));upper=sp.simplify(U.subs(witness))
    assert (low,upper)==(sp.Rational(1,4),sp.Rational(3,4))
    # Test the entire recipient response correspondence at several boundaries.
    for tt,expected in ((sp.Rational(1,8),"UU"),(sp.Rational(1,4),"weak"),
                        (sp.Rational(1,2),"UD"),(sp.Rational(3,4),"UD")):
        params=witness|{t:tt,b:sp.Integer(0)}
        assert sp.diff(u1,x).subs({y:0}).subs(params)>0
        assert sp.diff(u1,x).subs({y:1}).subs(params)>0
        z=sp.diff(u2,y).subs({x:1}).subs(params)
        assert ("UU" if z>0 else "UD" if z<0 else "weak")==expected
    # Fully specified three-stage finite-offer protocol: sender chooses from
    # grid {0,1/20,...,3/4}; receiver vetoes unless strictly better than
    # baseline, including boundary rejection as the indifference selection.
    # If accepted, there is NO subsequent counteroffer, and stage-3 actions
    # satisfy the unique post-transfer continuous-strategy Nash equilibrium.
    menu=[F(k,20) for k in range(16)]
    lower=F(1,4);maxcomp=F(3,4)
    pay1={z:F(1)+maxcomp-z if z>lower else F(1) for z in menu}
    choice=max(menu,key=lambda z:pay1[z])
    assert choice==F(3,10)
    assert pay1[choice]==F(29,20)
    pay2=F(1)+choice-lower
    assert pay2==F(21,20)
    assert pay1[choice]+pay2==F(5,2)
    print("PASS symbolic unilateral portfolio best responses, strict IR interval")
    print("PASS exact welfare transfer cancellation and positive social wedge")
    print("PASS individual solo payoff supremum at least b_D+A")
    print("PASS solo sums exceed max feasible welfare by A-Delta")
    print("PASS finite-offer SPNE witness: t=0.30, net (1.45,1.05), SW=2.50")
    print("NOTE free simultaneous commitment non-supportability uses")
    print("     Jackson--Wilkie (2005) Theorem 2; NOT a new general theorem.")
    print("NOTE no pure continuum strict-acceptance optimum absent boundary")
    print("     tie resolution or a positive payment increment.")
if __name__=="__main__":
    main()
