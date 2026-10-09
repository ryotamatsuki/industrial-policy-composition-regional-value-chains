#!/usr/bin/env python3
"""Stage-2 novelty *absorption diagnostics*, NOT a model-extension theorem or proof.

Runs with sympy. Independently reconstructs the frozen two-region fixed-capacity
payoff and the elementary consequences of an EXOGENOUS contingent transfer.
Demonstrating these identities helps reject weak novelty claims, but does not
certify preplay bargaining, budget feasibility, contract enforcement, or an
economics literature originality claim.
"""
import sympy as sp

D, A, alpha, t, d1, d2 = sp.symbols("D A alpha t d1 d2", real=True)
x1,x2 = sp.symbols("x1 x2", real=True)

def w(xi,xj,delta):
    return delta*xi+alpha*A*xi*(1-xj)+(1-alpha)*A*(1-xi)*xj

W1 = w(x1,x2,D)
W2 = w(x2,x1,D)
T = t*x1*(1-x2)
# Explicitly imposed direction: government 1 pays government 2 if (U,D).
W1t,W2t = W1-T,W2+T

def eq(lhs,rhs):
    diff=sp.simplify(lhs-rhs)
    assert diff == 0, diff

def run():
    eq(W1t+W2t,W1+W2)
    eq(sp.diff(W2t,x2).subs({x1:1}),D-(1-alpha)*A-t)
    eq(sp.diff(W1t,x1).subs({x2:0}),D+alpha*A-t)
    eq(W1t.subs({x1:1,x2:0})-W1.subs({x1:1,x2:1}),alpha*A-t)
    eq(W2t.subs({x1:1,x2:0})-W2.subs({x1:1,x2:1}),(1-alpha)*A+t-D)
    eq((W1+W2).subs({x1:1,x2:0})-(W1+W2).subs({x1:1,x2:1}),A-D)
    eq(sp.simplify(alpha*A-(D-(1-alpha)*A)),A-D)
    asym=w(x1,x2,d1)+w(x2,x1,d2)
    eq(asym.subs({x1:1,x2:0})-asym.subs({x1:0,x2:1}),d1-d2)
    # Exact rational witness inside duplication wedge:
    # Delta=1, alpha=1/2, A=3/2, t=1/2.
    witness={D:sp.Integer(1),alpha:sp.Rational(1,2),A:sp.Rational(3,2),t:sp.Rational(1,2)}
    assert sp.simplify((D-(1-alpha)*A).subs(witness))>0
    assert sp.simplify((A-D).subs(witness))>0
    assert sp.simplify((t-(D-(1-alpha)*A)).subs(witness))>0
    assert sp.simplify((alpha*A-t).subs(witness))>0
    print("STAGE2_ELEMENTARY_ABSORPTION_DIAGNOSTICS_PASS")
    print("Cross-jurisdictional transfer cancellation: PASS")
    print("IR/payment interval equals positive fixed-capacity welfare gain: PASS")
    print("Heterogeneous corner ranking Delta1-Delta2: PASS")
    print("Voluntary preplay equilibrium, grant financing, network formation, novelty: NOT TESTED")

if __name__=="__main__":
    run()
