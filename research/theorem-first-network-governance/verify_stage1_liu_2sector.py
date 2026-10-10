#!/usr/bin/env python3
"""Stage-1 exact source benchmark: two-sector Liu (2019) distortion centrality.

This verifies algebra in a special Cobb-Douglas vertical two-sector
network; it does NOT certify the general QJE proposition, publishable
novelty, or any multi-government equilibrium. Poirier (2025) uses a
TAX-positive policy sign while Liu (2019) uses SUBSIDY-positive.
"""
import sympy as sp

b, chi = sp.symbols("b chi", positive=True, real=True)
tau, q0, q1 = sp.symbols("tau q0 q1", real=True)
# Assume 0<b<1, chi>0; normalize final downstream nominal sales to 1.
upstream_sales = b / (1 + chi)
labor_income = (1 - b) + upstream_sales

# Liu's sectoral influence mu and Domar weights gamma.
mu = sp.Matrix([b, 1])
domar = sp.Matrix([upstream_sales / labor_income, 1 / labor_income])
xi_up = sp.factor(mu[0] / domar[0])
xi_down = sp.factor(mu[1] / domar[1])
assert sp.simplify(xi_up - (1 + chi * (1 - b))) == 0
assert sp.simplify(xi_down - labor_income) == 0
assert sp.simplify(xi_up / xi_down - (1 + chi)) == 0

# Factor wages: sector 1 sells all output from labor; sector 2 pays (1-b)
# of normalized downstream revenue as local factor income.
weighted_xi = (upstream_sales / labor_income) * xi_up + ((1 - b) / labor_income) * xi_down
assert sp.simplify(weighted_xi - 1) == 0

# First-order policy-spending derivative. "Indirect network" terms
# are proportional to baseline tau and vanish ONLY at tau=0.
spend = tau * (q0 + q1 * tau)
assert sp.simplify(sp.diff(spend, tau).subs(tau, 0) - q0) == 0
assert sp.simplify(sp.diff(spend, tau) - (q0 + 2 * q1 * tau)) == 0

# Liu's Lemma 2 / Corollary 1 cancellation, provided omega!=0, gamma!=0
omega, mu_i, gamma_i = sp.symbols("omega mu_i gamma_i", nonzero=True, real=True)
net_income_deriv = omega * (mu_i - gamma_i)
spending_deriv = omega * gamma_i
assert sp.simplify(net_income_deriv/spending_deriv-(mu_i/gamma_i-1)) == 0

print("PASS: Liu two-sector influence/Domar/xi, distortion rank, wage average")
print("PASS: lemma-to-corollary unit spending normalization")
print("PASS: zero-subsidy network-response first-order budget cancellation")
print("xi_up =", xi_up, "xi_down =", xi_down)
print("Not a full general-theorem proof; Poirier sign and regional Nash not tested.")
