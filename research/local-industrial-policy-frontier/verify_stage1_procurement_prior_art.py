#!/usr/bin/env python3
"""Stage-1 NEGATIVE novelty audit: algebraic source reconstructions only.

No new publication result, no global incentive-contract certification.
Source-derived Hwang (2024) marginal SOE certainty equivalent and
innovative supplier participation; Asseyer (2015 original WP) regime
comparison of computed principal payoffs. The published Asseyer 2018
model is NOT asserted to be identical to the 2015 WP.
"""
import sympy as sp
from fractions import Fraction as F

alpha, Delta, bonus, delta, p, gamma, sigma2, x = sp.symbols(
    "alpha Delta bonus delta p gamma sigma2 x", positive=True, real=True)
theta, k, rho = sp.symbols("theta k rho", positive=True, real=True)

# Hwang P1 interior, 0 < x < 1, when delta=extra supplier cost.
A = alpha * Delta + bonus - delta - p
certainty_equivalent = A*x - sp.Rational(1,2)*gamma*alpha**2*sigma2*x**2
best = sp.solve(sp.diff(certainty_equivalent,x),x)[0]
assert sp.simplify(best-A/(gamma*alpha**2*sigma2)) == 0
assert sp.simplify(sp.diff(certainty_equivalent,x,2)+gamma*alpha**2*sigma2)==0

# Innovative firm chooses type; seller expected utility must be >= 0.
eu_supplier=theta*(p-k)+(1-theta)*(-k-rho)
p_star=sp.solve(sp.Eq(eu_supplier,0),p)[0]
assert sp.simplify(p_star-(k+(1-theta)*rho)/theta)==0

# Asseyer WP Prop 4: comparison of GROSS optimal contract payoffs
# after verification expense, not a proof of its contract subgames.
gross={"investment":F(15,4),"shock":F(7,2),"none":F(3)}
assert gross["investment"]>=gross["shock"]>=gross["none"]
cost_cases=[
    ({"investment":F(1,2),"shock":F(1,2)},"investment"),
    ({"investment":F(2),"shock":F(1,10)},"shock"),
    ({"investment":F(2),"shock":F(1)},"none"),
]
for costs,winner in cost_cases:
    net={m:gross[m]-costs.get(m,F(0)) for m in gross}
    assert max(net,key=net.get)==winner,(costs,net,winner)
print("PASS source-derived algebra: Hwang interior x*, innovative firm p*")
print("PASS regime-comparison arithmetic: Asseyer WP P4 all three regimes")
print("NOT A PROOF OF NOVELTY, JOINT MORAL HAZARD OR JOURNAL PROP 2")
