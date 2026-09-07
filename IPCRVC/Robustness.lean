import IPCRVC.BaselineBoundaries

/-!
# Restricted robustness certificates

These theorems formalize only the restricted robustness statements certified in
Stage 7.5A. They are not claims about arbitrary continuous games or matching
technologies.
-/

namespace IPCRVC

/-- Coordinated net gain from the binary switch. -/
def plannerSwitchGain (delta G : ℝ) : ℝ := G - delta

/-- Reallocating jurisdiction's net gain when it captures share `lambda`. -/
def localSwitchGain (delta G lambda : ℝ) : ℝ := lambda * G - delta

/-- The coordinated binary switch is profitable exactly when total created value exceeds the loss. -/
theorem planner_switch_iff {delta G : ℝ} :
    0 < plannerSwitchGain delta G ↔ delta < G := by
  unfold plannerSwitchGain
  constructor
  · exact sub_pos.mp
  · exact sub_pos.mpr

/-- With a positive capture share, the local switch condition has threshold `delta/lambda`. -/
theorem local_switch_iff {delta G lambda : ℝ} (hlambda : 0 < lambda) :
    0 < localSwitchGain delta G lambda ↔ delta / lambda < G := by
  unfold localSwitchGain
  constructor
  · intro h
    have hmul : delta < lambda * G := sub_pos.mp h
    apply (div_lt_iff₀ hlambda).2
    simpa [mul_comm] using hmul
  · intro h
    have hmul : delta < G * lambda := (div_lt_iff₀ hlambda).1 h
    apply sub_pos.mpr
    simpa [mul_comm] using hmul

/-- Incomplete capture places the decentralized binary switching threshold strictly above the coordinated one. -/
theorem switching_threshold_ordering {delta lambda : ℝ}
    (hdelta : 0 < delta) (hlambda : 0 < lambda) (hlambda1 : lambda < 1) :
    delta < delta / lambda := by
  apply (lt_div_iff₀ hlambda).2
  have hgap : 0 < delta * (1 - lambda) :=
    mul_pos hdelta (sub_pos.mpr hlambda1)
  nlinarith

/-- The binary incomplete-capture wedge: coordination switches while the local jurisdiction does not. -/
theorem binary_switching_wedge {delta G lambda : ℝ}
    (_hdelta : 0 < delta) (hlambda : 0 < lambda) (_hlambda1 : lambda < 1)
    (hP : delta < G) (hN : G < delta / lambda) :
    0 < plannerSwitchGain delta G ∧ localSwitchGain delta G lambda < 0 := by
  constructor
  · exact (planner_switch_iff).2 hP
  · unfold localSwitchGain
    have hmul0 : G * lambda < delta := (lt_div_iff₀ hlambda).1 hN
    have hmul : lambda * G < delta := by simpa [mul_comm] using hmul0
    exact sub_neg.mpr hmul

/-- Capacity matching from the paper's second matching technology. -/
def capacityMatch (x1 x2 : ℝ) : ℝ :=
  min x1 (1 - x2) + min (1 - x1) x2

/-- The two minimum terms collapse to the absolute-value representation used in the manuscript. -/
theorem capacityMatch_eq_abs (x1 x2 : ℝ) :
    capacityMatch x1 x2 = 1 - |x1 + x2 - 1| := by
  unfold capacityMatch
  by_cases hs : x1 + x2 ≤ 1
  · have h1 : x1 ≤ 1 - x2 := by linarith
    have h2 : x2 ≤ 1 - x1 := by linarith
    rw [min_eq_left h1, min_eq_right h2]
    rw [abs_of_nonpos (by linarith)]
    ring
  · have hs' : 1 ≤ x1 + x2 := le_of_not_ge hs
    have h1 : 1 - x2 ≤ x1 := by linarith
    have h2 : 1 - x1 ≤ x2 := by linarith
    rw [min_eq_right h1, min_eq_left h2]
    rw [abs_of_nonneg (by linarith)]
    ring

/-- Coordinated objective under capacity matching, omitting constants. -/
def capacityWelfare (delta A x1 x2 : ℝ) : ℝ :=
  delta * (x1 + x2) + A * capacityMatch x1 x2

/-- On the lower branch `x1+x2≤1`, capacity-matching welfare is linear with positive slope `delta+A`. -/
theorem capacityWelfare_low {delta A x1 x2 : ℝ} (hs : x1 + x2 ≤ 1) :
    capacityWelfare delta A x1 x2 = (delta + A) * (x1 + x2) := by
  unfold capacityWelfare
  rw [capacityMatch_eq_abs]
  rw [abs_of_nonpos (by linarith)]
  ring

/-- On the upper branch `x1+x2≥1`, capacity-matching welfare has slope `delta-A`. -/
theorem capacityWelfare_high {delta A x1 x2 : ℝ} (hs : 1 ≤ x1 + x2) :
    capacityWelfare delta A x1 x2 = 2 * A + (delta - A) * (x1 + x2) := by
  unfold capacityWelfare
  rw [capacityMatch_eq_abs]
  rw [abs_of_nonneg (by linarith)]
  ring

/-- Under `A>delta>0`, every capacity-matching allocation is bounded by the value at total share one. -/
theorem capacityWelfare_le_max {delta A x1 x2 : ℝ}
    (hdelta : 0 < delta) (hA : 0 < A) (hAd : delta < A) :
    capacityWelfare delta A x1 x2 ≤ delta + A := by
  by_cases hs : x1 + x2 ≤ 1
  · rw [capacityWelfare_low hs]
    have hcoef : 0 ≤ delta + A := le_of_lt (add_pos hdelta hA)
    have hgap : 0 ≤ (delta + A) * (1 - (x1 + x2)) :=
      mul_nonneg hcoef (sub_nonneg.mpr hs)
    nlinarith
  · have hs' : 1 ≤ x1 + x2 := le_of_not_ge hs
    rw [capacityWelfare_high hs']
    have hcoef : 0 ≤ A - delta := le_of_lt (sub_pos.mpr hAd)
    have hgap : 0 ≤ (A - delta) * (x1 + x2 - 1) :=
      mul_nonneg hcoef (sub_nonneg.mpr hs')
    nlinarith

/-- Under `A>delta`, the maximum is attained exactly at total upstream share one. -/
theorem capacityWelfare_eq_max_iff {delta A x1 x2 : ℝ}
    (hdelta : 0 < delta) (hA : 0 < A) (hAd : delta < A) :
    capacityWelfare delta A x1 x2 = delta + A ↔ x1 + x2 = 1 := by
  constructor
  · intro heq
    by_cases hs : x1 + x2 ≤ 1
    · have hform := capacityWelfare_low (delta := delta) (A := A) hs
      have hcoef : 0 < delta + A := add_pos hdelta hA
      rw [heq] at hform
      nlinarith
    · have hs' : 1 ≤ x1 + x2 := le_of_not_ge hs
      have hform := capacityWelfare_high (delta := delta) (A := A) hs'
      have hcoef : 0 < A - delta := sub_pos.mpr hAd
      rw [heq] at hform
      nlinarith
  · intro hs
    have hsle : x1 + x2 ≤ 1 := le_of_eq hs
    rw [capacityWelfare_low hsle, hs]
    ring

/-- Exact coordinated optimum set for the paper's capacity-matching robustness exercise. -/
def IsCapacityPlannerOpt (delta A x1 x2 : ℝ) : Prop :=
  Feasible x1 ∧ Feasible x2 ∧
  ∀ y1 y2, Feasible y1 → Feasible y2 →
    capacityWelfare delta A y1 y2 ≤ capacityWelfare delta A x1 x2

/-- For `A>delta`, the exact capacity-matching planner set is `x1+x2=1`. -/
theorem capacityPlanner_exact {delta A x1 x2 : ℝ}
    (hdelta : 0 < delta) (hA : 0 < A) (hAd : delta < A) :
    IsCapacityPlannerOpt delta A x1 x2 ↔
      Feasible x1 ∧ Feasible x2 ∧ x1 + x2 = 1 := by
  constructor
  · intro hp
    rcases hp with ⟨hx1, hx2, hopt⟩
    refine ⟨hx1, hx2, ?_⟩
    have h10 : capacityWelfare delta A 1 0 = delta + A := by
      have hs : (1 : ℝ) + 0 = 1 := by norm_num
      exact (capacityWelfare_eq_max_iff hdelta hA hAd).2 hs
    have hle := hopt 1 0 feasible_one feasible_zero
    have hub := capacityWelfare_le_max (delta := delta) (A := A) (x1 := x1) (x2 := x2)
      hdelta hA hAd
    have heq : capacityWelfare delta A x1 x2 = delta + A := by
      linarith
    exact (capacityWelfare_eq_max_iff hdelta hA hAd).1 heq
  · rintro ⟨hx1, hx2, hs⟩
    refine ⟨hx1, hx2, ?_⟩
    intro y1 y2 _hy1 _hy2
    have hle := capacityWelfare_le_max (delta := delta) (A := A) (x1 := y1) (x2 := y2)
      hdelta hA hAd
    have heq := (capacityWelfare_eq_max_iff (delta := delta) (A := A)
      (x1 := x1) (x2 := x2) hdelta hA hAd).2 hs
    linarith

end IPCRVC
