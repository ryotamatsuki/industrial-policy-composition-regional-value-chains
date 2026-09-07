import IPCRVC.Robustness

/-!
# Decentralized capacity-matching robustness

This file formalizes the local-government side of the paper's specific
alternative matching technology. The result is deliberately limited to this
exact `min`-matching rule.
-/

namespace IPCRVC

/-- Region `i`'s nonconstant payoff under the capacity-matching incidence rule. -/
def capacityLocalPayoff (delta A lambda xi xj : ℝ) : ℝ :=
  delta * xi
    + (1 - lambda) * A * min xi (1 - xj)
    + lambda * A * min (1 - xi) xj

/-- First piece of the capacity-matching local payoff. -/
theorem capacityLocalPayoff_low {delta A lambda xi xj : ℝ}
    (hpiece : xi ≤ 1 - xj) :
    capacityLocalPayoff delta A lambda xi xj =
      delta * xi + (1 - lambda) * A * xi + lambda * A * xj := by
  unfold capacityLocalPayoff
  have h2 : xj ≤ 1 - xi := by linarith
  rw [min_eq_left hpiece, min_eq_right h2]

/-- Second piece of the capacity-matching local payoff. -/
theorem capacityLocalPayoff_high {delta A lambda xi xj : ℝ}
    (hpiece : 1 - xj ≤ xi) :
    capacityLocalPayoff delta A lambda xi xj =
      delta * xi + (1 - lambda) * A * (1 - xj) + lambda * A * (1 - xi) := by
  unfold capacityLocalPayoff
  have h2 : 1 - xi ≤ xj := by linarith
  rw [min_eq_right hpiece, min_eq_left h2]

/-- If `lambda*A < delta`, every feasible own action below one is strictly worse than one. -/
theorem capacityLocalPayoff_lt_one {delta A lambda xi xj : ℝ}
    (hdelta : 0 < delta) (hA : 0 < A)
    (hlambda : 0 < lambda) (hlambda1 : lambda < 1)
    (hinc : lambda * A < delta)
    (hxi : Feasible xi) (hxj : Feasible xj) (hxi1 : xi < 1) :
    capacityLocalPayoff delta A lambda xi xj <
      capacityLocalPayoff delta A lambda 1 xj := by
  have honepiece : 1 - xj ≤ (1 : ℝ) := by linarith [hxj.1]
  have hone := capacityLocalPayoff_high
    (delta := delta) (A := A) (lambda := lambda) (xi := (1 : ℝ)) (xj := xj) honepiece
  by_cases hpiece : xi ≤ 1 - xj
  · have hlow := capacityLocalPayoff_low
      (delta := delta) (A := A) (lambda := lambda) (xi := xi) (xj := xj) hpiece
    have hc1 : 0 < delta + (1 - lambda) * A := by
      have hla : 0 < 1 - lambda := sub_pos.mpr hlambda1
      have hprod : 0 < (1 - lambda) * A := mul_pos hla hA
      linarith
    have hc2 : 0 < delta - lambda * A := sub_pos.mpr hinc
    have hg : 0 ≤ 1 - xj - xi := by linarith
    have hr : 0 ≤ xj := hxj.1
    have hgap :
        capacityLocalPayoff delta A lambda 1 xj -
          capacityLocalPayoff delta A lambda xi xj =
        (delta + (1 - lambda) * A) * (1 - xj - xi)
          + (delta - lambda * A) * xj := by
      rw [hone, hlow]
      ring
    have hsumpos :
        0 < (delta + (1 - lambda) * A) * (1 - xj - xi)
          + (delta - lambda * A) * xj := by
      by_cases hgz : 1 - xj - xi = 0
      · have hxjpos : 0 < xj := by
          nlinarith
        have ht2 : 0 < (delta - lambda * A) * xj := mul_pos hc2 hxjpos
        rw [hgz]
        simpa using ht2
      · have hgpos : 0 < 1 - xj - xi := lt_of_le_of_ne hg (Ne.symm hgz)
        have ht1 : 0 < (delta + (1 - lambda) * A) * (1 - xj - xi) :=
          mul_pos hc1 hgpos
        have ht2 : 0 ≤ (delta - lambda * A) * xj :=
          mul_nonneg (le_of_lt hc2) hr
        linarith
    nlinarith
  · have hpiece' : 1 - xj ≤ xi := le_of_not_ge hpiece
    have hhigh := capacityLocalPayoff_high
      (delta := delta) (A := A) (lambda := lambda) (xi := xi) (xj := xj) hpiece'
    have hc2 : 0 < delta - lambda * A := sub_pos.mpr hinc
    have h1xi : 0 < 1 - xi := sub_pos.mpr hxi1
    have hprod : 0 < (delta - lambda * A) * (1 - xi) := mul_pos hc2 h1xi
    have hgap :
        capacityLocalPayoff delta A lambda 1 xj -
          capacityLocalPayoff delta A lambda xi xj =
        (delta - lambda * A) * (1 - xi) := by
      rw [hone, hhigh]
      ring
    nlinarith

/-- Under the same condition, one weakly dominates every feasible own share. -/
theorem capacityLocalPayoff_le_one {delta A lambda xi xj : ℝ}
    (hdelta : 0 < delta) (hA : 0 < A)
    (hlambda : 0 < lambda) (hlambda1 : lambda < 1)
    (hinc : lambda * A < delta)
    (hxi : Feasible xi) (hxj : Feasible xj) :
    capacityLocalPayoff delta A lambda xi xj ≤
      capacityLocalPayoff delta A lambda 1 xj := by
  by_cases h1 : xi = 1
  · subst xi
    exact le_rfl
  · have hlt : xi < 1 := lt_of_le_of_ne hxi.2 h1
    exact le_of_lt (capacityLocalPayoff_lt_one hdelta hA hlambda hlambda1 hinc hxi hxj hlt)

/-- Any global best response under `lambda*A<delta` must be one. -/
theorem eq_one_of_capacity_best {delta A lambda xi xj : ℝ}
    (hdelta : 0 < delta) (hA : 0 < A)
    (hlambda : 0 < lambda) (hlambda1 : lambda < 1)
    (hinc : lambda * A < delta)
    (hxi : Feasible xi) (hxj : Feasible xj)
    (hbest : ∀ y, Feasible y →
      capacityLocalPayoff delta A lambda y xj ≤
        capacityLocalPayoff delta A lambda xi xj) :
    xi = 1 := by
  by_contra hne
  have hlt : xi < 1 := lt_of_le_of_ne hxi.2 hne
  have hstrict := capacityLocalPayoff_lt_one
    hdelta hA hlambda hlambda1 hinc hxi hxj hlt
  have hreverse := hbest 1 feasible_one
  linarith

/-- Pure-strategy Nash equilibrium for the specific capacity-matching game. -/
def IsCapacityNash (delta A lambda x1 x2 : ℝ) : Prop :=
  Feasible x1 ∧ Feasible x2 ∧
  (∀ y1, Feasible y1 →
    capacityLocalPayoff delta A lambda y1 x2 ≤ capacityLocalPayoff delta A lambda x1 x2) ∧
  (∀ y2, Feasible y2 →
    capacityLocalPayoff delta A lambda y2 x1 ≤ capacityLocalPayoff delta A lambda x2 x1)

/-- Below the local threshold, `(1,1)` is a capacity-matching Nash equilibrium. -/
theorem capacityNash_11 {delta A lambda : ℝ}
    (hdelta : 0 < delta) (hA : 0 < A)
    (hlambda : 0 < lambda) (hlambda1 : lambda < 1)
    (hinc : lambda * A < delta) :
    IsCapacityNash delta A lambda 1 1 := by
  refine ⟨feasible_one, feasible_one, ?_, ?_⟩
  · intro y hy
    exact capacityLocalPayoff_le_one hdelta hA hlambda hlambda1 hinc hy feasible_one
  · intro y hy
    exact capacityLocalPayoff_le_one hdelta hA hlambda hlambda1 hinc hy feasible_one

/-- Below the local threshold, every capacity-matching Nash equilibrium is `(1,1)`. -/
theorem capacityNash_unique {delta A lambda x1 x2 : ℝ}
    (hdelta : 0 < delta) (hA : 0 < A)
    (hlambda : 0 < lambda) (hlambda1 : lambda < 1)
    (hinc : lambda * A < delta)
    (hn : IsCapacityNash delta A lambda x1 x2) :
    x1 = 1 ∧ x2 = 1 := by
  rcases hn with ⟨hx1, hx2, hbr1, hbr2⟩
  constructor
  · exact eq_one_of_capacity_best hdelta hA hlambda hlambda1 hinc hx1 hx2 hbr1
  · exact eq_one_of_capacity_best hdelta hA hlambda hlambda1 hinc hx2 hx1 hbr2

/-- `A<delta/lambda` is exactly the positive-slope condition used in the local capacity game. -/
theorem local_threshold_implies_incidence {delta A lambda : ℝ}
    (hlambda : 0 < lambda) (hN : A < delta / lambda) :
    lambda * A < delta := by
  have hmul : A * lambda < delta := (lt_div_iff₀ hlambda).1 hN
  nlinarith

/-- Full specific-technology robustness wedge certified in the manuscript. -/
theorem capacity_matching_wedge {delta A lambda : ℝ}
    (hdelta : 0 < delta) (hA : 0 < A)
    (hlambda : 0 < lambda) (hlambda1 : lambda < 1)
    (hP : delta < A) (hN : A < delta / lambda) :
    IsCapacityNash delta A lambda 1 1 ∧
    (∀ x1 x2, IsCapacityNash delta A lambda x1 x2 → x1 = 1 ∧ x2 = 1) ∧
    (∀ x1 x2, IsCapacityPlannerOpt delta A x1 x2 ↔
      Feasible x1 ∧ Feasible x2 ∧ x1 + x2 = 1) := by
  have hinc : lambda * A < delta := local_threshold_implies_incidence hlambda hN
  refine ⟨capacityNash_11 hdelta hA hlambda hlambda1 hinc, ?_, ?_⟩
  · intro x1 x2 hn
    exact capacityNash_unique hdelta hA hlambda hlambda1 hinc hn
  · intro x1 x2
    exact capacityPlanner_exact hdelta hA hP

end IPCRVC
