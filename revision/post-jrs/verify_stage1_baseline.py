#!/usr/bin/env python3
"""Independent symbolic audit of the *frozen* IPCRVC baseline for post-JRS Stage 1.

Run: python revision/post-jrs/verify_stage1_baseline.py
Requirements: sympy
This does NOT verify any proposed extension, is not a Lean proof,
and does not modify model/baseline.py or the historical theory freeze.
"""
import sympy as sp

alpha, A, Delta, bD, x1, x2, t = sp.symbols(
    "alpha A Delta bD x1 x2 t", real=True
)

def frozen_payoff(xi, xj):
    # Written from economic primitives, not imported from canonical model/baseline.py.
    return bD + Delta*xi + alpha*A*xi*(1-xj) + (1-alpha)*A*(1-xi)*xj

w1 = frozen_payoff(x1, x2)
w2 = frozen_payoff(x2, x1)
W = sp.expand(w1+w2)
q = alpha+Delta/A

def exact_zero(expr):
    assert sp.simplify(expr) == 0, sp.simplify(expr)

def run():
    # Pure simultaneous game, complete info, continuous [0,1] choices.
    exact_zero(sp.diff(w1,x1) - (Delta+alpha*A-A*x2))
    exact_zero(sp.diff(w1,x1,2))
    exact_zero(sp.diff(w2,x2) - (Delta+alpha*A-A*x1))
    exact_zero(W - (2*bD+(Delta+A)*(x1+x2)-2*A*x1*x2))
    assert sp.hessian(W,(x1,x2)) == sp.Matrix([[0,-2*A],[-2*A,0]])
    exact_zero(sp.det(sp.hessian(W,(x1,x2))) + 4*A**2)
    exact_zero(
        W.subs({x1:1,x2:0}) - W.subs({x1:1,x2:1}) - (A-Delta)
    )
    exact_zero(
        W.subs({x1:1,x2:0}) - W.subs({x1:q,x2:q})
        - A*((1-alpha)*(1-q)+alpha*q)
    )
    C = {
        (0,0): W.subs({x1:0,x2:0}),
        (1,0): W.subs({x1:1,x2:0}),
        (0,1): W.subs({x1:0,x2:1}),
        (1,1): W.subs({x1:1,x2:1})
    }
    # Convex-combination proof of global planner comparison.
    interpolated = sum([
        (1-x1)*(1-x2)*C[(0,0)],
        x1*(1-x2)*C[(1,0)],
        (1-x1)*x2*C[(0,1)],
        x1*x2*C[(1,1)]
    ])
    exact_zero(W-interpolated)
    # Exact rational phase regression examples.
    for av, dv, aa, expected_q in [
        (sp.Rational(3,2),1,sp.Rational(1,2),sp.Rational(7,6)),
        (2,1,sp.Rational(1,2),1),
        (3,1,sp.Rational(1,2),sp.Rational(5,6))
    ]:
        assert sp.simplify(q.subs({A:av,Delta:dv,alpha:aa})-expected_q)==0
    # Stage 1 only: elementary identities for proposed instrument-class primitives.
    # This proves neither contract formation nor implementation.
    w1trans=w1-t*x1*(1-x2)
    w2trans=w2+t*x1*(1-x2)
    exact_zero(w1trans+w2trans-W)
    D1,D2=sp.symbols("Delta1 Delta2",real=True)
    asymmetric_W=2*bD+D1*x1+D2*x2+A*(x1+x2-2*x1*x2)
    exact_zero(asymmetric_W.subs({x1:1,x2:0})-
               asymmetric_W.subs({x1:0,x2:1})-(D1-D2))
    print("STAGE1_BASELINE_SYMBOLIC_PASS")
    print("affine payoff, all planner corners, threshold/gap identities,")
    print("indefinite social Hessian, transfer cancellation, asymmetric role identity: PASS")
    print("New extension equilibrium/novelty/institutional validity: NOT TESTED")

if __name__ == "__main__":
    run()
