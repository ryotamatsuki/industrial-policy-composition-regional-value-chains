import IPCRVC.ProductionRobustness

/-!
# Integration-threshold and endogenous-capture certificates

This file formalizes the Stage 7.5A scope restrictions on integration.

For constant capture, strict monotonicity plus existence of both crossings is enough
for strict threshold ordering. Continuity is economically natural and is one route to
establishing crossings, but once range membership/crossing existence is supplied it is
not mathematically needed for the ordering itself.

For endogenous capture, the frozen counterexample is formalized exactly:

`G(tau)=1+tau`, `lambda(tau)=1/(1+tau)^2`, `Delta=1`.

For every `tau>0`, capture is incomplete, the planner wants to switch, and the local
captured value never exceeds one. Hence incomplete capture alone does not imply a finite
local switching threshold.
-/

namespace IPCRVC

noncomputable section

/-- A planner crossing for the integration-value function. -/
def IsPlannerCrossing (G : ℝ → ℝ) (delta tau : ℝ) : Prop :=
  G tau = delta

/-- A local-government crossing under a constant capture fraction. -/
def IsLocalCrossing (G : ℝ → ℝ) (delta lambda tau : ℝ) : Prop :=
  G tau = delta / lambda

/-- Strictly increasing integration value makes the planner crossing unique. -/
theorem planner_crossing_unique {G : ℝ → ℝ} (hG : StrictMono G)
    {delta tau1 tau2 : ℝ}
    (h1 : IsPlannerCrossing G delta tau1)
    (h2 : IsPlannerCrossing G delta tau2) :
    tau1 = tau2 := by
  apply hG.injective
  exact h1.trans h2.symm

/-- Strictly increasing integration value makes the local crossing unique. -/
theorem local_crossing_unique {G : ℝ → ℝ} (hG : StrictMono G)
    {delta lambda tau1 tau2 : ℝ}
    (h1 : IsLocalCrossing G delta lambda tau1)
    (h2 : IsLocalCrossing G delta lambda tau2) :
    tau1 = tau2 := by
  apply hG.injective
  exact h1.trans h2.symm

/--
With constant incomplete capture, any two existing crossings are strictly ordered:
`tau^P < tau^N`.
-/
theorem integration_threshold_ordering {G : ℝ → ℝ} (hG : StrictMono G)
    {delta lambda tauP tauN : ℝ}
    (hdelta : 0 < delta) (hlambda : 0 < lambda) (hlambda1 : lambda < 1)
    (hP : IsPlannerCrossing G delta tauP)
    (hN : IsLocalCrossing G delta lambda tauN) :
    tauP < tauN := by
  have hvalue : G tauP < G tauN := by
    rw [hP, hN]
    exact switching_threshold_ordering hdelta hlambda hlambda1
  by_contra hnot
  have hle : tauN ≤ tauP := le_of_not_gt hnot
  have hGle : G tauN ≤ G tauP := hG.monotone hle
  linarith

/--
Range membership for both threshold values plus strict monotonicity yields unique,
strictly ordered integration thresholds.
-/
theorem integration_thresholds_of_crossings {G : ℝ → ℝ} (hG : StrictMono G)
    {delta lambda : ℝ}
    (hdelta : 0 < delta) (hlambda : 0 < lambda) (hlambda1 : lambda < 1)
    (hPexists : ∃ tauP, IsPlannerCrossing G delta tauP)
    (hNexists : ∃ tauN, IsLocalCrossing G delta lambda tauN) :
    ∃ tauP tauN,
      IsPlannerCrossing G delta tauP ∧
      IsLocalCrossing G delta lambda tauN ∧
      tauP < tauN ∧
      (∀ t, IsPlannerCrossing G delta t → t = tauP) ∧
      (∀ t, IsLocalCrossing G delta lambda t → t = tauN) := by
  rcases hPexists with ⟨tauP, hP⟩
  rcases hNexists with ⟨tauN, hN⟩
  refine ⟨tauP, tauN, hP, hN, ?_, ?_, ?_⟩
  · exact integration_threshold_ordering hG hdelta hlambda hlambda1 hP hN
  · intro t ht
    exact planner_crossing_unique hG ht hP
  · intro t ht
    exact local_crossing_unique hG ht hN

/-- Frozen endogenous-capture counterexample: total complementary value. -/
def endogenousCounterG (tau : ℝ) : ℝ := 1 + tau

/-- Frozen endogenous-capture counterexample: local capture fraction. -/
def endogenousCounterLambda (tau : ℝ) : ℝ := 1 / (1 + tau)^2

/-- Captured complementary value in the endogenous-capture counterexample. -/
def endogenousCounterH (tau : ℝ) : ℝ :=
  endogenousCounterLambda tau * endogenousCounterG tau

/-- The counterexample's total value is strictly increasing. -/
theorem endogenousCounterG_strictMono : StrictMono endogenousCounterG := by
  intro a b hab
  unfold endogenousCounterG
  linarith

/-- On the economically relevant nonnegative domain, captured value simplifies to `1/(1+tau)`. -/
theorem endogenousCounterH_eq {tau : ℝ} (htau : 0 ≤ tau) :
    endogenousCounterH tau = 1 / (1 + tau) := by
  unfold endogenousCounterH endogenousCounterLambda endogenousCounterG
  have hne : 1 + tau ≠ 0 := by
    have hpos : 0 < 1 + tau := by linarith
    exact ne_of_gt hpos
  field_simp [hne]
  ring

/-- For positive integration, the endogenous capture fraction is strictly between zero and one. -/
theorem endogenousCounterLambda_incomplete {tau : ℝ} (htau : 0 < tau) :
    0 < endogenousCounterLambda tau ∧ endogenousCounterLambda tau < 1 := by
  have hbase : 0 < 1 + tau := by linarith
  have hden : 0 < (1 + tau)^2 := sq_pos_of_pos hbase
  constructor
  · unfold endogenousCounterLambda
    exact one_div_pos.mpr hden
  · unfold endogenousCounterLambda
    apply (div_lt_iff₀ hden).2
    have hsq : 1 < (1 + tau)^2 := by
      nlinarith [sq_nonneg tau]
    nlinarith

/-- The coordinated switch is strictly profitable for every positive integration level. -/
theorem endogenousCounter_planner_switches {tau : ℝ} (htau : 0 < tau) :
    1 < endogenousCounterG tau := by
  unfold endogenousCounterG
  linarith

/-- Captured value never exceeds `Delta=1` on the nonnegative domain. -/
theorem endogenousCounterH_le_one {tau : ℝ} (htau : 0 ≤ tau) :
    endogenousCounterH tau ≤ 1 := by
  rw [endogenousCounterH_eq htau]
  have hden : 0 < 1 + tau := by linarith
  apply (div_le_iff₀ hden).2
  nlinarith

/-- Therefore the local government never has a strict switching incentive at any finite `tau≥0`. -/
theorem endogenousCounter_no_local_switch :
    ∀ tau : ℝ, 0 ≤ tau → ¬ (1 < endogenousCounterH tau) := by
  intro tau htau hswitch
  have hle := endogenousCounterH_le_one htau
  linarith

/--
Full frozen counterexample certificate: for every `tau>0`, capture is incomplete,
the planner wants to switch, but the local government does not.
-/
theorem endogenous_capture_counterexample {tau : ℝ} (htau : 0 < tau) :
    (0 < endogenousCounterLambda tau ∧ endogenousCounterLambda tau < 1) ∧
    1 < endogenousCounterG tau ∧
    ¬ (1 < endogenousCounterH tau) := by
  refine ⟨endogenousCounterLambda_incomplete htau, ?_, ?_⟩
  · exact endogenousCounter_planner_switches htau
  · exact endogenousCounter_no_local_switch tau (le_of_lt htau)

end

end IPCRVC
