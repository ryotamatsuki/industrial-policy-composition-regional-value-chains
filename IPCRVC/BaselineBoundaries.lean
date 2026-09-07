import IPCRVC.BaselinePhase2

/-!
# Boundary and high-complementarity certificates

This file closes the remaining baseline boundary cases and the symmetric high-`A`
welfare comparison from `IPCRVC-THEORY-FREEZE-2026-09-07-v1`.
-/

namespace IPCRVC

/-- Nash equilibrium is symmetric across the two otherwise identical regions. -/
theorem nash_symm (p : Params) {x1 x2 : ℝ} (hn : IsNash p x1 x2) :
    IsNash p x2 x1 := by
  rcases hn with ⟨hx1, hx2, hbr1, hbr2⟩
  exact ⟨hx2, hx1, hbr2, hbr1⟩

/-- At the decentralized threshold `A=A^N`, the threshold action is exactly one. -/
theorem q_eq_one_of_comp_eq_AN (p : Params) (hreg : p.comp = AN p) :
    q p = 1 := by
  have hden : 0 < 1 - p.alpha := one_sub_alpha_pos p
  have hreg' : p.comp = p.delta / (1 - p.alpha) := by
    simpa [AN] using hreg
  have hmul : p.comp * (1 - p.alpha) = p.delta :=
    (eq_div_iff (ne_of_gt hden)).1 hreg'
  have hq := comp_mul_q p
  nlinarith [p.comp_pos]

/-- At `A=A^N`, every feasible profile with region 1 at one is Nash. -/
theorem nash_left_one_of_comp_eq_AN (p : Params) (hreg : p.comp = AN p)
    {x2 : ℝ} (hx2 : Feasible x2) : IsNash p 1 x2 := by
  have hq : q p = 1 := q_eq_one_of_comp_eq_AN p hreg
  have hs1 : slope p 1 = 0 :=
    (slope_eq_zero_iff_eq_q p 1).2 hq.symm
  refine ⟨feasible_one, hx2, ?_, ?_⟩
  · intro y hy
    rcases lt_or_eq_of_le hx2.2 with hlt | heq
    · have hltq : x2 < q p := by
        nlinarith
      exact payoff_le_one_of_slope_pos p hy ((slope_pos_iff_lt_q p x2).2 hltq)
    · subst x2
      exact le_of_eq (payoff_eq_of_slope_zero p hs1 y 1)
  · intro y hy
    exact le_of_eq (payoff_eq_of_slope_zero p hs1 y x2)

/-- At `A=A^N`, every feasible profile with region 2 at one is Nash. -/
theorem nash_right_one_of_comp_eq_AN (p : Params) (hreg : p.comp = AN p)
    {x1 : ℝ} (hx1 : Feasible x1) : IsNash p x1 1 := by
  exact nash_symm p (nash_left_one_of_comp_eq_AN p hreg hx1)

/-- Exact Nash set at the decentralized threshold. -/
theorem nash_exact_of_comp_eq_AN (p : Params) (hreg : p.comp = AN p)
    (x1 x2 : ℝ) :
    IsNash p x1 x2 ↔
      Feasible x1 ∧ Feasible x2 ∧ (x1 = 1 ∨ x2 = 1) := by
  have hq : q p = 1 := q_eq_one_of_comp_eq_AN p hreg
  constructor
  · intro hn
    rcases hn with ⟨hx1, hx2, hbr1, hbr2⟩
    refine ⟨hx1, hx2, ?_⟩
    by_cases h2 : x2 = 1
    · exact Or.inr h2
    · have h2lt : x2 < 1 := lt_of_le_of_ne hx2.2 h2
      have h2ltq : x2 < q p := by
        nlinarith
      have hx1one : x1 = 1 :=
        eq_one_of_best_of_slope_pos p hx1 hbr1 ((slope_pos_iff_lt_q p x2).2 h2ltq)
      exact Or.inl hx1one
  · rintro ⟨hx1, hx2, hcase⟩
    rcases hcase with h1 | h2
    · subst x1
      exact nash_left_one_of_comp_eq_AN p hreg hx2
    · subst x2
      exact nash_right_one_of_comp_eq_AN p hreg hx1

/-- At the planner threshold `A=Δ`, welfare falls from `(1,0)` by an exact rectangle term. -/
theorem welfare_boundary_gap_formula (p : Params) (hreg : p.comp = p.delta)
    (x1 x2 : ℝ) :
    welfare p 1 0 - welfare p x1 x2 =
      2 * p.comp * (1 - x1) * (1 - x2) := by
  rw [welfare_formula p 1 0, welfare_formula p x1 x2]
  rw [← hreg]
  ring

/-- At `A=Δ`, `(1,0)` weakly dominates every feasible profile for the planner. -/
theorem welfare_le_10_of_comp_eq_delta (p : Params) (hreg : p.comp = p.delta)
    {x1 x2 : ℝ} (hx1 : Feasible x1) (hx2 : Feasible x2) :
    welfare p x1 x2 ≤ welfare p 1 0 := by
  have hgap := welfare_boundary_gap_formula p hreg x1 x2
  have hrect : 0 ≤ (1 - x1) * (1 - x2) :=
    mul_nonneg (sub_nonneg.mpr hx1.2) (sub_nonneg.mpr hx2.2)
  have htwoA : 0 ≤ 2 * p.comp := by
    nlinarith [p.comp_pos]
  have hnonneg : 0 ≤ (2 * p.comp) * ((1 - x1) * (1 - x2)) :=
    mul_nonneg htwoA hrect
  nlinarith

/-- Any feasible profile with the first component one ties `(1,0)` at `A=Δ`. -/
theorem welfare_eq_10_of_comp_eq_delta_left_one (p : Params)
    (hreg : p.comp = p.delta) (x2 : ℝ) :
    welfare p 1 x2 = welfare p 1 0 := by
  have hgap := welfare_boundary_gap_formula p hreg 1 x2
  simp at hgap
  linarith

/-- Any feasible profile with the second component one ties `(1,0)` at `A=Δ`. -/
theorem welfare_eq_10_of_comp_eq_delta_right_one (p : Params)
    (hreg : p.comp = p.delta) (x1 : ℝ) :
    welfare p x1 1 = welfare p 1 0 := by
  have hgap := welfare_boundary_gap_formula p hreg x1 1
  simp at hgap
  linarith

/-- Exact coordinated fixed-capacity optimum set at the planner threshold `A=Δ`. -/
theorem planner_exact_of_comp_eq_delta (p : Params) (hreg : p.comp = p.delta)
    (x1 x2 : ℝ) :
    IsPlannerOpt p x1 x2 ↔
      Feasible x1 ∧ Feasible x2 ∧ (x1 = 1 ∨ x2 = 1) := by
  constructor
  · intro hp
    rcases hp with ⟨hx1, hx2, hopt⟩
    refine ⟨hx1, hx2, ?_⟩
    by_contra hnot
    have hx1ne : x1 ≠ 1 := by
      intro h
      exact hnot (Or.inl h)
    have hx2ne : x2 ≠ 1 := by
      intro h
      exact hnot (Or.inr h)
    have hx1lt : x1 < 1 := lt_of_le_of_ne hx1.2 hx1ne
    have hx2lt : x2 < 1 := lt_of_le_of_ne hx2.2 hx2ne
    have hpos1 : 0 < 1 - x1 := sub_pos.mpr hx1lt
    have hpos2 : 0 < 1 - x2 := sub_pos.mpr hx2lt
    have hrect : 0 < (1 - x1) * (1 - x2) := mul_pos hpos1 hpos2
    have htwoA : 0 < 2 * p.comp := by
      nlinarith [p.comp_pos]
    have hgap_pos : 0 < (2 * p.comp) * ((1 - x1) * (1 - x2)) :=
      mul_pos htwoA hrect
    have hgap := welfare_boundary_gap_formula p hreg x1 x2
    have hstrict : welfare p x1 x2 < welfare p 1 0 := by
      nlinarith
    have hreverse := hopt 1 0 feasible_one feasible_zero
    linarith
  · rintro ⟨hx1, hx2, hcase⟩
    refine ⟨hx1, hx2, ?_⟩
    intro y1 y2 hy1 hy2
    have hle := welfare_le_10_of_comp_eq_delta p hreg hy1 hy2
    rcases hcase with h1 | h2
    · subst x1
      have heq := welfare_eq_10_of_comp_eq_delta_left_one p hreg x2
      linarith
    · subst x2
      have heq := welfare_eq_10_of_comp_eq_delta_right_one p hreg x1
      linarith

/-- Exact paper formula for the welfare loss at the symmetric high-`A` equilibrium. -/
theorem welfare_10_sub_qq_formula (p : Params) :
    welfare p 1 0 - welfare p (q p) (q p) =
      p.comp * ((1 - p.alpha) * (1 - q p) + p.alpha * q p) := by
  have hq := comp_mul_q p
  have hdelta : p.delta = p.comp * q p - p.comp * p.alpha := by
    nlinarith
  rw [welfare_formula p 1 0, welfare_formula p (q p) (q p)]
  rw [hdelta]
  ring

/-- The symmetric interior equilibrium is strictly welfare-inferior above `A^N`. -/
theorem welfare_qq_lt_10_of_AN_lt_comp (p : Params) (hreg : AN p < p.comp) :
    welfare p (q p) (q p) < welfare p 1 0 := by
  have hq0 : 0 < q p := q_pos p
  have hq1 : q p < 1 := q_lt_one_of_AN_lt_comp p hreg
  have h1a : 0 < 1 - p.alpha := one_sub_alpha_pos p
  have h1q : 0 < 1 - q p := sub_pos.mpr hq1
  have ht1 : 0 < (1 - p.alpha) * (1 - q p) := mul_pos h1a h1q
  have ht2 : 0 < p.alpha * q p := mul_pos p.alpha_pos hq0
  have hsum : 0 < (1 - p.alpha) * (1 - q p) + p.alpha * q p :=
    add_pos ht1 ht2
  have hprod : 0 < p.comp * ((1 - p.alpha) * (1 - q p) + p.alpha * q p) :=
    mul_pos p.comp_pos hsum
  have hgap := welfare_10_sub_qq_formula p
  nlinarith

end IPCRVC
