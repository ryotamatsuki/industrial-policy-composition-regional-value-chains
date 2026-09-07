"""Exact symbolic verification for the blinded reproducibility supplement."""
from sympy import symbols, simplify

bD, Delta, alpha, A = symbols("bD Delta alpha A", positive=True)
x1, x2, xj = symbols("x1 x2 xj", real=True)

def W(xi, xj_):
    return bD + Delta*xi + alpha*A*xi*(1-xj_) + (1-alpha)*A*(1-xi)*xj_

def check(name, expr):
    reduced = simplify(expr)
    if reduced != 0:
        raise AssertionError(f"{name} failed: {reduced}")
    print(f"PASS: {name}")

check("payoff difference", W(1,xj)-W(0,xj)-(Delta+alpha*A-A*xj))
Wtot = simplify(W(x1,x2)+W(x2,x1))
Wtarget = 2*bD + (Delta+A)*(x1+x2) - 2*A*x1*x2
check("welfare identity", Wtot-Wtarget)
check("planner switch gain", Wtarget.subs({x1:1,x2:0})-Wtarget.subs({x1:1,x2:1})-(A-Delta))
AN = Delta/(1-alpha)
AP = Delta
check("threshold gap identity", AN-AP-alpha*Delta/(1-alpha))
q = alpha + Delta/A
Wp = Wtarget.subs({x1:1,x2:0})
Wq = simplify(Wtarget.subs({x1:q,x2:q}))
claimed_gap = A*((1-alpha)*(1-q)+alpha*q)
check("symmetric-NE welfare gap identity", Wp-Wq-claimed_gap)
lambda_ = symbols("lambda", positive=True)
check("constant-capture threshold gap", Delta/lambda_-Delta-Delta*(1-lambda_)/lambda_)
print("ALL SYMBOLIC CHECKS PASSED")
