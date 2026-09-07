import IPCRVC.CapacityGame

/-!
# Restricted production-function robustness certificates

This file formalizes the restricted production-function claims frozen at Stage 7.5A.
It does not claim an arbitrary-production-function theorem.

The `RestrictedCRSAtUnit` structure records the actual function, its Frechet derivative
at the unit match, concavity on the nonnegative orthant, degree-one homogeneity on that
orthant, positive marginal products, and the Euler identity at the unit match.  The
threshold theorem is then derived from these certified ingredients.

For CES, the paper only uses the unit-incidence identities.  The admissible parameter
predicate retains the concavity-compatible scope; the Lean theorem certifies the unit
incidence and threshold consequence, not a global re-proof of CES concavity.
-/

namespace IPCRVC

noncomputable section

open Set

/-- Nonnegative two-input production domain. -/
def nonnegativeInputs : Set (ℝ × ℝ) := Set.Ici 0 ×ˢ Set.Ici 0

/--
Restricted CRS technology certificate at the unit complementary match.

`euler_unit` is the explicit machine-checkable Euler certificate used by the paper.
The pinned mathlib version does not supply the general homogeneous-function Euler theorem
in the form needed here, so the theorem below begins from this certified identity rather
than silently claiming Lean has re-derived Euler from the other fields.
-/
structure RestrictedCRSAtUnit where
  F : (ℝ × ℝ) → ℝ
  L : (ℝ × ℝ) →L[ℝ] ℝ
  differentiable_unit : HasFDerivAt F L ((1 : ℝ), (1 : ℝ))
  concave_nonnegative : ConcaveOn ℝ nonnegativeInputs F
  homogeneous_one :
    ∀ (t : ℝ), 0 ≤ t → ∀ x ∈ nonnegativeInputs, F (t • x) = t * F x
  upstream_pos : 0 < L ((1 : ℝ), (0 : ℝ))
  downstream_pos : 0 < L ((0 : ℝ), (1 : ℝ))
  euler_unit :
    F ((1 : ℝ), (1 : ℝ)) =
      L ((1 : ℝ), (0 : ℝ)) + L ((0 : ℝ), (1 : ℝ))

/-- Output at the unit complementary match. -/
def crsOutputAtUnit (p : RestrictedCRSAtUnit) : ℝ :=
  p.F ((1 : ℝ), (1 : ℝ))

/-- Upstream marginal product at the unit match. -/
def crsUpstreamMPAtUnit (p : RestrictedCRSAtUnit) : ℝ :=
  p.L ((1 : ℝ), (0 : ℝ))

/-- Downstream marginal product at the unit match. -/
def crsDownstreamMPAtUnit (p : RestrictedCRSAtUnit) : ℝ :=
  p.L ((0 : ℝ), (1 : ℝ))

/-- Coordinated fixed-capacity threshold under a restricted CRS technology. -/
def crsPlannerThreshold (delta : ℝ) (p : RestrictedCRSAtUnit) : ℝ :=
  delta / crsOutputAtUnit p

/-- Decentralized threshold under competitive downstream incidence. -/
def crsLocalThreshold (delta : ℝ) (p : RestrictedCRSAtUnit) : ℝ :=
  delta / crsDownstreamMPAtUnit p

/-- Euler plus positive marginal products implies positive unit output. -/
theorem crs_output_pos (p : RestrictedCRSAtUnit) :
    0 < crsOutputAtUnit p := by
  unfold crsOutputAtUnit
  rw [p.euler_unit]
  exact add_pos p.upstream_pos p.downstream_pos

/-- Positive upstream marginal product makes downstream incidence strictly smaller than total output. -/
theorem crs_downstream_lt_output (p : RestrictedCRSAtUnit) :
    crsDownstreamMPAtUnit p < crsOutputAtUnit p := by
  unfold crsDownstreamMPAtUnit crsOutputAtUnit
  rw [p.euler_unit]
  linarith [p.upstream_pos]

/-- The restricted concave-CRS incidence result: coordinated adjustment occurs at a lower threshold. -/
theorem crs_threshold_ordering {delta : ℝ} (p : RestrictedCRSAtUnit)
    (hdelta : 0 < delta) :
    crsPlannerThreshold delta p < crsLocalThreshold delta p := by
  have hF : 0 < crsOutputAtUnit p := crs_output_pos p
  have hFd : 0 < crsDownstreamMPAtUnit p := p.downstream_pos
  have hlt : crsDownstreamMPAtUnit p < crsOutputAtUnit p :=
    crs_downstream_lt_output p
  unfold crsPlannerThreshold crsLocalThreshold
  exact (div_lt_div_iff_of_pos_left hdelta hF hFd).2 hlt

/-- Concavity-compatible CES parameter domain used by the paper's explicit formula. -/
def CESAdmissible (omega rho : ℝ) : Prop :=
  0 < omega ∧ omega < 1 ∧ rho ≤ 1 ∧ rho ≠ 0

/-- CES unit output used by the robustness comparison. -/
def cesUnitOutput (_omega _rho : ℝ) : ℝ := 1

/-- CES upstream competitive incidence at the unit match. -/
def cesUnitUpstreamMP (omega : ℝ) : ℝ := omega

/-- CES downstream competitive incidence at the unit match. -/
def cesUnitDownstreamMP (omega : ℝ) : ℝ := 1 - omega

/-- The CES unit-incidence shares satisfy the degree-one Euler identity. -/
theorem ces_unit_euler (omega rho : ℝ) :
    cesUnitOutput omega rho = cesUnitUpstreamMP omega + cesUnitDownstreamMP omega := by
  simp [cesUnitOutput, cesUnitUpstreamMP, cesUnitDownstreamMP]

/-- Admissible CES weights imply strictly positive upstream and downstream unit incidence. -/
theorem ces_unit_incidence_positive {omega rho : ℝ}
    (hces : CESAdmissible omega rho) :
    0 < cesUnitUpstreamMP omega ∧ 0 < cesUnitDownstreamMP omega := by
  constructor
  · simpa [cesUnitUpstreamMP] using hces.1
  · simp only [cesUnitDownstreamMP]
    exact sub_pos.mpr hces.2.1

/-- The paper's CES downstream threshold is `Delta/(1-omega)`. -/
theorem ces_local_threshold_formula (delta omega : ℝ) :
    delta / cesUnitDownstreamMP omega = delta / (1 - omega) := by
  rfl

/-- The paper's CES coordinated threshold is `Delta`. -/
theorem ces_planner_threshold_formula (delta omega rho : ℝ) :
    delta / cesUnitOutput omega rho = delta := by
  simp [cesUnitOutput]

/-- On the admissible CES domain, the coordinated threshold is strictly below the local threshold. -/
theorem ces_threshold_ordering {delta omega rho : ℝ}
    (hdelta : 0 < delta) (hces : CESAdmissible omega rho) :
    delta / cesUnitOutput omega rho < delta / cesUnitDownstreamMP omega := by
  have hdown : 0 < 1 - omega := sub_pos.mpr hces.2.1
  have hdown1 : 1 - omega < 1 := by linarith [hces.1]
  simpa [cesUnitOutput, cesUnitDownstreamMP] using
    (switching_threshold_ordering (delta := delta) (lambda := 1 - omega)
      hdelta hdown hdown1)

end IPCRVC
