"""Baseline objects for the blinded reproducibility supplement."""
from __future__ import annotations

from dataclasses import dataclass
from math import isclose
from typing import Tuple

FREEZE_ID = "IPCRVC-THEORY-FREEZE-2026-09-07-v1"

@dataclass(frozen=True)
class Params:
    delta: float
    alpha: float
    A: float
    bD: float = 0.0

    def validate(self) -> None:
        if not self.delta > 0:
            raise ValueError("delta must be strictly positive")
        if not (0 < self.alpha < 1):
            raise ValueError("alpha must lie strictly between 0 and 1")
        if not self.A > 0:
            raise ValueError("A must be strictly positive")

def local_payoff(x_i: float, x_j: float, p: Params) -> float:
    p.validate()
    if not (0 <= x_i <= 1 and 0 <= x_j <= 1):
        raise ValueError("strategies must lie in [0,1]")
    return (p.bD + p.delta*x_i + p.alpha*p.A*x_i*(1-x_j)
            + (1-p.alpha)*p.A*(1-x_i)*x_j)

def welfare(x1: float, x2: float, p: Params) -> float:
    return local_payoff(x1, x2, p) + local_payoff(x2, x1, p)

def payoff_slope(x_j: float, p: Params) -> float:
    p.validate()
    if not 0 <= x_j <= 1:
        raise ValueError("x_j must lie in [0,1]")
    return p.delta + p.alpha*p.A - p.A*x_j

def q(p: Params) -> float:
    p.validate()
    return p.alpha + p.delta/p.A

def planner_threshold(p: Params) -> float:
    p.validate()
    return p.delta

def decentralized_threshold(p: Params) -> float:
    p.validate()
    return p.delta/(1-p.alpha)

def best_response(x_j: float, p: Params, tol: float = 1e-12) -> Tuple[float, float]:
    s = payoff_slope(x_j, p)
    if s > tol:
        return (1.0, 1.0)
    if s < -tol:
        return (0.0, 0.0)
    return (0.0, 1.0)

def is_nash(x1: float, x2: float, p: Params, tol: float = 1e-10) -> bool:
    for xi, xj in ((x1, x2), (x2, x1)):
        lo, hi = best_response(xj, p, tol=tol)
        if xi < lo-tol or xi > hi+tol:
            return False
    return True

def planner_corner_optima(p: Params, tol: float = 1e-10):
    corners = [(0.0,0.0),(1.0,0.0),(0.0,1.0),(1.0,1.0)]
    vals = {c: welfare(*c, p) for c in corners}
    vmax = max(vals.values())
    return tuple(c for c,v in vals.items() if isclose(v, vmax, abs_tol=tol, rel_tol=tol))
