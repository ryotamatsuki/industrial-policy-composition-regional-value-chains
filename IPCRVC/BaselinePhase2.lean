import IPCRVC.Baseline

/-!
# Lean formalization, phase 2

This file extends the baseline certification for
`IPCRVC-THEORY-FREEZE-2026-09-07-v1`.

The first phase-2 target is the paper's exact high-complementarity Nash set.
-/

namespace IPCRVC

/-- Interior threshold action `q = α + Δ/A` used in the high-`A` equilibrium set. -/
noncomputable def q (p : Params) : ℝ := p.alpha + p.delta / p.comp

/-- Multiplying `q` by `A` removes the only division in its definition. -/
theorem comp_mul_q (p : Params) :
    p.comp * q p = p.comp * p.alpha + p.delta := by
  unfold q
  field_simp [ne_of_gt p.comp_pos]
  <;> ring

/-- The threshold action is strictly positive. -/
theorem q_pos (p : Params) : 0 < q p := by
  unfold q
  have hdiv : 0 < p.delta / p.comp := div_pos p.delta_pos p.comp_pos
  linarith [p.alpha_pos]

/-- Above `A^N`, the threshold action lies strictly below one. -/
theorem q_lt_one_of_AN_lt_comp (p : Params) (hreg : AN p < p.comp) :
    q p < 1 := by
  have hden : 0 < 1 - p.alpha := one_sub_alpha_pos p
  have hreg' : p.delta / (1 - p.alpha) < p.comp := by
    simpa [AN] using hreg
  have hmul : p.delta < p.comp * (1 - p.alpha) :=
    (div_lt_iff₀ hden).1 hreg'
  have hdiv : p.delta / p.comp < 1 - p.alpha := by
    apply (div_lt_iff₀ p.comp_pos).2
    nlinarith
  unfold q
  linarith

/-- The sign of the affine payoff slope is equivalent to the rival being below `q`. -/
theorem slope_pos_iff_lt_q (p : Params) (x : ℝ) :
    0 < slope p x ↔ x < q p := by
  have hq := comp_mul_q p
  constructor
  · intro hs
    have hmul : p.comp * x < p.comp * q p := by
      unfold slope at hs
      nlinarith
    exact (mul_lt_mul_left p.comp_pos).1 hmul
  · intro hx
    have hmul : p.comp * x < p.comp * q p :=
      (mul_lt_mul_left p.comp_pos).2 hx
    unfold slope
    nlinarith

/-- The affine payoff slope is negative exactly when the rival is above `q`. -/
theorem slope_neg_iff_q_lt (p : Params) (x : ℝ) :
    slope p x < 0 ↔ q p < x := by
  have hq := comp_mul_q p
  constructor
  · intro hs
    have hmul : p.comp * q p < p.comp * x := by
      unfold slope at hs
      nlinarith
    exact (mul_lt_mul_left p.comp_pos).1 hmul
  · intro hx
    have hmul : p.comp * q p < p.comp * x :=
      (mul_lt_mul_left p.comp_pos).2 hx
    unfold slope
    nlinarith

/-- The affine payoff slope vanishes exactly at the threshold action `q`. -/
theorem slope_eq_zero_iff_eq_q (p : Params) (x : ℝ) :
    slope p x = 0 ↔ x = q p := by
  have hq := comp_mul_q p
  constructor <;> intro h
  · unfold slope at h
    nlinarith [p.comp_pos]
  · subst x
    unfold slope
    nlinarith [p.comp_pos]

/-- If the affine slope is negative, zero globally weakly dominates every feasible own share. -/
theorem payoff_le_zero_of_slope_neg (p : Params) {x y : ℝ}
    (hy : Feasible y) (hs : slope p x < 0) :
    payoff p y x ≤ payoff p 0 x := by
  rw [payoff_affine p y x, payoff_affine p 0 x]
  have hmul : y * slope p x ≤ 0 :=
    mul_nonpos_of_nonneg_of_nonpos hy.1 (le_of_lt hs)
  linarith

/-- Under a strictly negative slope, any global best response must equal zero. -/
theorem eq_zero_of_best_of_slope_neg (p : Params) {xi xj : ℝ}
    (hxi : Feasible xi)
    (hbest : ∀ y, Feasible y → payoff p y xj ≤ payoff p xi xj)
    (hs : slope p xj < 0) : xi = 0 := by
  have h := hbest 0 feasible_zero
  rw [payoff_affine p 0 xj, payoff_affine p xi xj] at h
  by_contra hne
  have hpos : 0 < xi := lt_of_le_of_ne hxi.1 (Ne.symm hne)
  have hstrict : xi * slope p xj < 0 := mul_neg_of_pos_of_neg hpos hs
  linarith

/-- At zero slope the player is indifferent among all own feasible actions. -/
theorem payoff_eq_of_slope_zero (p : Params) {xj : ℝ}
    (hs : slope p xj = 0) (y z : ℝ) :
    payoff p y xj = payoff p z xj := by
  rw [payoff_affine p y xj, payoff_affine p z xj, hs]
  ring

/-- Above `A^N`, `q` is a feasible interior action. -/
theorem feasible_q_of_AN_lt_comp (p : Params) (hreg : AN p < p.comp) :
    Feasible (q p) := by
  exact ⟨le_of_lt (q_pos p), le_of_lt (q_lt_one_of_AN_lt_comp p hreg)⟩

/-- `(1,0)` is a Nash equilibrium above the decentralized threshold. -/
theorem nash_10_of_AN_lt_comp (p : Params) (hreg : AN p < p.comp) :
    IsNash p 1 0 := by
  have hq0 : 0 < q p := q_pos p
  have hq1 : q p < 1 := q_lt_one_of_AN_lt_comp p hreg
  refine ⟨feasible_one, feasible_zero, ?_, ?_⟩
  · intro y hy
    exact payoff_le_one_of_slope_pos p hy ((slope_pos_iff_lt_q p 0).2 hq0)
  · intro y hy
    exact payoff_le_zero_of_slope_neg p hy ((slope_neg_iff_q_lt p 1).2 hq1)

/-- By symmetry, `(0,1)` is a Nash equilibrium above the decentralized threshold. -/
theorem nash_01_of_AN_lt_comp (p : Params) (hreg : AN p < p.comp) :
    IsNash p 0 1 := by
  have hq0 : 0 < q p := q_pos p
  have hq1 : q p < 1 := q_lt_one_of_AN_lt_comp p hreg
  refine ⟨feasible_zero, feasible_one, ?_, ?_⟩
  · intro y hy
    exact payoff_le_zero_of_slope_neg p hy ((slope_neg_iff_q_lt p 1).2 hq1)
  · intro y hy
    exact payoff_le_one_of_slope_pos p hy ((slope_pos_iff_lt_q p 0).2 hq0)

/-- The symmetric interior threshold profile `(q,q)` is also Nash above `A^N`. -/
theorem nash_qq_of_AN_lt_comp (p : Params) (hreg : AN p < p.comp) :
    IsNash p (q p) (q p) := by
  have hqf := feasible_q_of_AN_lt_comp p hreg
  have hs : slope p (q p) = 0 := (slope_eq_zero_iff_eq_q p (q p)).2 rfl
  refine ⟨hqf, hqf, ?_, ?_⟩
  · intro y hy
    rw [payoff_eq_of_slope_zero p hs y (q p)]
  · intro y hy
    rw [payoff_eq_of_slope_zero p hs y (q p)]

/-- Every Nash equilibrium above `A^N` is one of the paper's three stated profiles. -/
theorem nash_mem_three_of_AN_lt_comp (p : Params) (hreg : AN p < p.comp)
    {x1 x2 : ℝ} (hn : IsNash p x1 x2) :
    (x1 = 1 ∧ x2 = 0) ∨
    (x1 = 0 ∧ x2 = 1) ∨
    (x1 = q p ∧ x2 = q p) := by
  rcases hn with ⟨hx1, hx2, hbr1, hbr2⟩
  have hq0 : 0 < q p := q_pos p
  have hq1 : q p < 1 := q_lt_one_of_AN_lt_comp p hreg
  rcases lt_trichotomy x2 (q p) with h2lt | h2eq | h2gt
  · have hx1one : x1 = 1 :=
      eq_one_of_best_of_slope_pos p hx1 hbr1 ((slope_pos_iff_lt_q p x2).2 h2lt)
    have hs2 : slope p 1 < 0 := (slope_neg_iff_q_lt p 1).2 hq1
    have hx2zero : x2 = 0 := by
      subst x1
      exact eq_zero_of_best_of_slope_neg p hx2 hbr2 hs2
    exact Or.inl ⟨hx1one, hx2zero⟩
  · have hx1q : x1 = q p := by
      rcases lt_trichotomy x1 (q p) with h1lt | h1eq | h1gt
      · have hx2one : x2 = 1 :=
          eq_one_of_best_of_slope_pos p hx2 hbr2 ((slope_pos_iff_lt_q p x1).2 h1lt)
        exfalso
        nlinarith
      · exact h1eq
      · have hx2zero : x2 = 0 :=
          eq_zero_of_best_of_slope_neg p hx2 hbr2 ((slope_neg_iff_q_lt p x1).2 h1gt)
        exfalso
        nlinarith
    exact Or.inr (Or.inr ⟨hx1q, h2eq⟩)
  · have hx1zero : x1 = 0 :=
      eq_zero_of_best_of_slope_neg p hx1 hbr1 ((slope_neg_iff_q_lt p x2).2 h2gt)
    have hs2 : 0 < slope p 0 := (slope_pos_iff_lt_q p 0).2 hq0
    have hx2one : x2 = 1 := by
      subst x1
      exact eq_one_of_best_of_slope_pos p hx2 hbr2 hs2
    exact Or.inr (Or.inl ⟨hx1zero, hx2one⟩)

/-- Exact high-`A` Nash set from Proposition 1 of the paper. -/
theorem nash_exact_of_AN_lt_comp (p : Params) (hreg : AN p < p.comp)
    (x1 x2 : ℝ) :
    IsNash p x1 x2 ↔
      ((x1 = 1 ∧ x2 = 0) ∨
       (x1 = 0 ∧ x2 = 1) ∨
       (x1 = q p ∧ x2 = q p)) := by
  constructor
  · intro hn
    exact nash_mem_three_of_AN_lt_comp p hreg hn
  · intro h
    rcases h with h10 | hrest
    · rcases h10 with ⟨rfl, rfl⟩
      exact nash_10_of_AN_lt_comp p hreg
    · rcases hrest with h01 | hqq
      · rcases h01 with ⟨rfl, rfl⟩
        exact nash_01_of_AN_lt_comp p hreg
      · rcases hqq with ⟨rfl, rfl⟩
        exact nash_qq_of_AN_lt_comp p hreg

end IPCRVC
