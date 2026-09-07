import Mathlib

/-!
# Lean formalization of the IPCRVC baseline

This file formalizes the core analytical claims in
`IPCRVC-THEORY-FREEZE-2026-09-07-v1`.

Notation mapping to the paper:
* `p.delta` = `Δ`
* `p.alpha` = `α`
* `p.comp` = `A` (cross-regional complementarity)
* `AN p` = `A^N = Δ/(1-α)`
* `AP p` = `A^P = Δ`

The first certification target is the headline Priority Duplication Wedge:
for `Δ < A < Δ/(1-α)`, `(1,1)` is the unique Nash equilibrium while
`(1,0)` and `(0,1)` are coordinated fixed-capacity optima.
-/

namespace IPCRVC

structure Params where
  bD : ℝ
  delta : ℝ
  alpha : ℝ
  comp : ℝ
  delta_pos : 0 < delta
  alpha_pos : 0 < alpha
  alpha_lt_one : alpha < 1
  comp_pos : 0 < comp

/-- Feasible policy shares lie in the closed unit interval. -/
def Feasible (x : ℝ) : Prop := 0 ≤ x ∧ x ≤ 1

@[simp] theorem feasible_zero : Feasible 0 := by
  constructor <;> norm_num

@[simp] theorem feasible_one : Feasible 1 := by
  constructor <;> norm_num

/-- Regional payoff from the frozen baseline model. -/
def payoff (p : Params) (xi xj : ℝ) : ℝ :=
  p.bD + p.delta * xi
    + p.alpha * p.comp * xi * (1 - xj)
    + (1 - p.alpha) * p.comp * (1 - xi) * xj

/-- Coefficient on own policy share in the affine payoff representation. -/
def slope (p : Params) (xj : ℝ) : ℝ :=
  p.delta + p.alpha * p.comp - p.comp * xj

/-- Aggregate modeled real surplus used by the coordinated fixed-capacity benchmark. -/
def welfare (p : Params) (x1 x2 : ℝ) : ℝ :=
  payoff p x1 x2 + payoff p x2 x1

/-- A pure-strategy Nash equilibrium on `[0,1]^2`. -/
def IsNash (p : Params) (x1 x2 : ℝ) : Prop :=
  Feasible x1 ∧ Feasible x2 ∧
  (∀ y1, Feasible y1 → payoff p y1 x2 ≤ payoff p x1 x2) ∧
  (∀ y2, Feasible y2 → payoff p y2 x1 ≤ payoff p x2 x1)

/-- Global coordinated optimum with the same fixed strategy sets as the decentralized game. -/
def IsPlannerOpt (p : Params) (x1 x2 : ℝ) : Prop :=
  Feasible x1 ∧ Feasible x2 ∧
  ∀ y1 y2, Feasible y1 → Feasible y2 → welfare p y1 y2 ≤ welfare p x1 x2

/-- Decentralized threshold `A^N`. -/
def AN (p : Params) : ℝ := p.delta / (1 - p.alpha)

/-- Coordinated threshold `A^P`. -/
def AP (p : Params) : ℝ := p.delta

/-- The paper's affine-in-own-strategy identity. -/
theorem payoff_affine (p : Params) (xi xj : ℝ) :
    payoff p xi xj = payoff p 0 xj + xi * slope p xj := by
  unfold payoff slope
  ring

/-- Endpoint difference equals the own-strategy slope. -/
theorem payoff_one_sub_zero (p : Params) (xj : ℝ) :
    payoff p 1 xj - payoff p 0 xj = slope p xj := by
  rw [payoff_affine p 1 xj]
  ring

/-- If the affine slope is positive, `1` globally weakly dominates every feasible own share. -/
theorem payoff_le_one_of_slope_pos (p : Params) {x y : ℝ}
    (hy : Feasible y) (hs : 0 < slope p x) :
    payoff p y x ≤ payoff p 1 x := by
  rw [payoff_affine p y x, payoff_affine p 1 x]
  have hmul : y * slope p x ≤ (1 : ℝ) * slope p x :=
    (mul_le_mul_right hs).2 hy.2
  linarith

/-- Under a strictly positive slope, any global best response must equal `1`. -/
theorem eq_one_of_best_of_slope_pos (p : Params) {xi xj : ℝ}
    (hxi : Feasible xi)
    (hbest : ∀ y, Feasible y → payoff p y xj ≤ payoff p xi xj)
    (hs : 0 < slope p xj) : xi = 1 := by
  have h := hbest 1 feasible_one
  rw [payoff_affine p 1 xj, payoff_affine p xi xj] at h
  have hmul : (1 : ℝ) * slope p xj ≤ xi * slope p xj := by
    linarith
  have h1le : (1 : ℝ) ≤ xi := (mul_le_mul_right hs).1 hmul
  exact le_antisymm hxi.2 h1le

/-- `1-α` is positive under the frozen parameter restrictions. -/
theorem one_sub_alpha_pos (p : Params) : 0 < 1 - p.alpha := by
  linarith [p.alpha_lt_one]

/-- Below `A^N`, the affine slope is strictly positive against every feasible rival share. -/
theorem slope_pos_of_comp_lt_AN (p : Params)
    (hreg : p.comp < AN p) {x : ℝ} (hx : Feasible x) :
    0 < slope p x := by
  have hden : 0 < 1 - p.alpha := one_sub_alpha_pos p
  have hreg' : p.comp < p.delta / (1 - p.alpha) := by
    simpa [AN] using hreg
  have hmul : p.comp * (1 - p.alpha) < p.delta :=
    (lt_div_iff₀ hden).1 hreg'
  have hxA : p.comp * x ≤ p.comp := by
    have h := mul_le_mul_of_nonneg_left hx.2 (le_of_lt p.comp_pos)
    simpa using h
  unfold slope
  nlinarith

/-- `(1,1)` is a Nash equilibrium throughout the low-`A` regime. -/
theorem nash_11_of_comp_lt_AN (p : Params) (hreg : p.comp < AN p) :
    IsNash p 1 1 := by
  refine ⟨feasible_one, feasible_one, ?_, ?_⟩
  · intro y hy
    exact payoff_le_one_of_slope_pos p hy
      (slope_pos_of_comp_lt_AN p hreg feasible_one)
  · intro y hy
    exact payoff_le_one_of_slope_pos p hy
      (slope_pos_of_comp_lt_AN p hreg feasible_one)

/-- Below `A^N`, every Nash equilibrium is `(1,1)`. -/
theorem nash_unique_of_comp_lt_AN (p : Params) (hreg : p.comp < AN p)
    {x1 x2 : ℝ} (hn : IsNash p x1 x2) : x1 = 1 ∧ x2 = 1 := by
  rcases hn with ⟨hx1, hx2, hbr1, hbr2⟩
  constructor
  · exact eq_one_of_best_of_slope_pos p hx1 hbr1
      (slope_pos_of_comp_lt_AN p hreg hx2)
  · exact eq_one_of_best_of_slope_pos p hx2 hbr2
      (slope_pos_of_comp_lt_AN p hreg hx1)

/-- Closed-form aggregate welfare identity from the paper. -/
theorem welfare_formula (p : Params) (x1 x2 : ℝ) :
    welfare p x1 x2 =
      2 * p.bD + (p.delta + p.comp) * (x1 + x2) - 2 * p.comp * x1 * x2 := by
  unfold welfare payoff
  ring

/-- Aggregate welfare is symmetric in the two regions. -/
theorem welfare_symm (p : Params) (x1 x2 : ℝ) :
    welfare p x1 x2 = welfare p x2 x1 := by
  rw [welfare_formula p x1 x2, welfare_formula p x2 x1]
  ring

/-- If `A > Δ`, `(1,0)` globally maximizes the coordinated fixed-capacity objective. -/
theorem welfare_le_10_of_delta_lt_comp (p : Params) (hreg : p.delta < p.comp)
    {x1 x2 : ℝ} (hx1 : Feasible x1) (hx2 : Feasible x2) :
    welfare p x1 x2 ≤ welfare p 1 0 := by
  rw [welfare_formula p x1 x2, welfare_formula p 1 0]
  by_cases hs : x1 + x2 ≤ 1
  · have hcoef : 0 ≤ p.delta + p.comp := le_of_lt (add_pos p.delta_pos p.comp_pos)
    have hgap : 0 ≤ (p.delta + p.comp) * (1 - (x1 + x2)) :=
      mul_nonneg hcoef (sub_nonneg.mpr hs)
    have hprod : 0 ≤ 2 * p.comp * x1 * x2 := by
      positivity
    nlinarith
  · have hs' : 1 ≤ x1 + x2 := le_of_not_ge hs
    have hrect : 0 ≤ (1 - x1) * (1 - x2) :=
      mul_nonneg (sub_nonneg.mpr hx1.2) (sub_nonneg.mpr hx2.2)
    have ht : 0 ≤ x1 + x2 - 1 := sub_nonneg.mpr hs'
    have had : 0 ≤ p.comp - p.delta := le_of_lt (sub_pos.mpr hreg)
    have h1 : 0 ≤ (p.comp - p.delta) * (x1 + x2 - 1) :=
      mul_nonneg had ht
    have hc : 0 ≤ 2 * p.comp := by positivity
    have h2 : 0 ≤ (2 * p.comp) * ((1 - x1) * (1 - x2)) :=
      mul_nonneg hc hrect
    nlinarith

/-- `(1,0)` is a coordinated fixed-capacity optimum whenever `A > Δ`. -/
theorem planner_10_of_delta_lt_comp (p : Params) (hreg : p.delta < p.comp) :
    IsPlannerOpt p 1 0 := by
  refine ⟨feasible_one, feasible_zero, ?_⟩
  intro y1 y2 hy1 hy2
  exact welfare_le_10_of_delta_lt_comp p hreg hy1 hy2

/-- By regional symmetry, `(0,1)` is also a coordinated optimum whenever `A > Δ`. -/
theorem planner_01_of_delta_lt_comp (p : Params) (hreg : p.delta < p.comp) :
    IsPlannerOpt p 0 1 := by
  refine ⟨feasible_zero, feasible_one, ?_⟩
  intro y1 y2 hy1 hy2
  calc
    welfare p y1 y2 = welfare p y2 y1 := welfare_symm p y1 y2
    _ ≤ welfare p 1 0 := welfare_le_10_of_delta_lt_comp p hreg hy2 hy1
    _ = welfare p 0 1 := welfare_symm p 1 0

/-- Exact welfare difference between coordinated differentiation and duplication. -/
theorem welfare_10_sub_11 (p : Params) :
    welfare p 1 0 - welfare p 1 1 = p.comp - p.delta := by
  rw [welfare_formula p 1 0, welfare_formula p 1 1]
  ring

/-- The coordinated threshold lies strictly below the decentralized threshold. -/
theorem threshold_ordering (p : Params) : AP p < AN p := by
  have hden : 0 < 1 - p.alpha := one_sub_alpha_pos p
  have hprod : 0 < p.delta * p.alpha := mul_pos p.delta_pos p.alpha_pos
  have hmul : p.delta * (1 - p.alpha) < p.delta := by
    nlinarith
  apply (lt_div_iff₀ hden).2
  simpa [AP, AN] using hmul

/--
The headline Priority Duplication Wedge, formalized directly on the continuous strategy set.
No binary-strategy restriction or local FOC argument is used.
-/
theorem priority_duplication_wedge (p : Params)
    (hP : p.delta < p.comp) (hN : p.comp < AN p) :
    IsNash p 1 1 ∧
    (∀ x1 x2, IsNash p x1 x2 → x1 = 1 ∧ x2 = 1) ∧
    IsPlannerOpt p 1 0 ∧
    IsPlannerOpt p 0 1 ∧
    welfare p 1 1 < welfare p 1 0 := by
  refine ⟨nash_11_of_comp_lt_AN p hN, ?_,
    planner_10_of_delta_lt_comp p hP, planner_01_of_delta_lt_comp p hP, ?_⟩
  · intro x1 x2 hn
    exact nash_unique_of_comp_lt_AN p hN hn
  · have hgap := welfare_10_sub_11 p
    nlinarith

end IPCRVC
