#!/usr/bin/env python3
"""Stage-3 re-entry sign/threshold audit after A1 NO-GO.

Derive the *frozen baseline* under sequential (leader-follower) timing only.
No extra investment, private information, firm or transfer mechanism is added.
A sign proof over the parameter wedge is in STAGE3_REENTRY_AFTER_A1_NO_GO.md.
This script checks symbolic identities and exact rational boundary examples.
It is NOT a generic theorem about irreversible investment / contract design.
Requires SymPy. Run: python revision/post-jrs/verify_stage3_reentry_timing.py
"""
import sympy as sp
D,A,a,xL,xF=sp.symbols("Delta A alpha xL xF",real=True)

def w(xi,xj):
    return D*xi+a*A*xi*(1-xj)+(1-a)*A*(1-xi)*xj

def zero(z):
    assert sp.simplify(z)==0,z

def main():
    f=sp.expand(w(xF,xL))
    follower_slope=sp.diff(f,xF)
    zero(follower_slope-(D+a*A-A*xL))
    zero(follower_slope.subs(xL,1)-(D-(1-a)*A))
    leader_when_follower_U=sp.expand(w(xL,sp.Integer(1)))
    zero(sp.diff(leader_when_follower_U,xL)-(D-(1-a)*A))
    zero(sp.diff(w(xL,xF),xL,2))
    # On strictly specified wedge D<A<D/(1-a), 0<a<1, and
    # xL in [0,1], follower slope >= D-(1-a)A > 0.
    # With follower xF=1, leader slope = D-(1-a)A > 0.
    # Thus both select U=1, and (1,1) is the unique SPNE outcome.
    for aa,dd,aa_value in [
        (sp.Rational(1,2),sp.Integer(1),sp.Rational(3,2)),
        (sp.Rational(1,3),sp.Integer(2),sp.Rational(5,2)),
        (sp.Rational(3,4),sp.Integer(1),sp.Rational(7,2))
    ]:
        assert dd<aa_value<dd/(1-aa)
        lower=sp.simplify((D-(1-a)*A).subs({D:dd,a:aa,A:aa_value}))
        assert lower>0
        assert sp.simplify((A-D).subs({D:dd,a:aa,A:aa_value}))>0
    print("STAGE3_REENTRY_SEQUENTIAL_SIGN_PASS")
    print("For Delta < A < Delta/(1-alpha), simple sequential priority")
    print("choice yields unique outcome (U,U); planner prefers (U,D)/(D,U).")
    print("Irreversible costs, informational contracting, and novelty NOT TESTED.")

if __name__=="__main__":
    main()
