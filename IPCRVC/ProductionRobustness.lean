import IPCRVC.CapacityGame

/-!
# Restricted production-function robustness certificates

This file formalizes the restricted production-function claims frozen at Stage 7.5A.
It does not claim an arbitrary-production-function theorem.

The `RestrictedCRSAtUnit` structure records the actual function, its Frechet derivative
at the unit match, concavity on the nonnegative orthant, degree-one homogeneity on that
orthant, and positive marginal products. Euler's identity at the unit match is then
machine-derived from homogeneity and differentiability using mathlib's local Euler theorem.

For CES, the paper uses the unit-incidence identities on the admissible concavity-compatible
parameter domain. The threshold consequence is certified below.
-/

namespace IPCRVC

noncomputable section

open Set Filter

/-- Nonnegative two-input production domain. -/
def nonnegativeInputs : Set (ℝ × ℝ) := Set.Ici 0 ×ˢ Set.Ici 0

/-- The unit complementary input vector. -/
def crsUnit : ℝ × ℝ := ((1 : ℝ), (1 : ℝ))

/-- Upstream coordinate vector. -/
def crsUpstreamUnit : ℝ × ℝ := ((1 : ℝ), (0 : ℝ))

/-- Downstream coordinate vector. -/
def crsDownstreamUnit : ℝ × ℝ := ((0 : ℝ), (1 : ℝ))

/-- The unit complementary input lies in the nonnegative domain. -/
theorem crsUnit_mem_nonnegative : crsUnit ∈ nonnegativeInputs := by
  change (0 : ℝ) ≤ 1 ∧ (0 : ℝ) ≤ 1
  norm_num

/--
Restricted concave CRS technology at the unit complementary match.

Homogeneity is imposed on the economically relevant nonnegative cone. Since a neighborhood
of scalar `1` is eventually positive, this is enough for mathlib's local Euler theorem.
-/
structure RestrictedCRSAtUnit where
  F : (ℝ × ℝ) → ℝ
  L : (ℝ × ℝ) →L[ℝ] ℝ
  differentiable_unit : HasFDerivAt F L crsUnit
  concave_nonnegative : ConcaveOn ℝ nonnegativeInputs F
  homogeneous_one :
    ∀ (t : ℝ), 0 ≤ t → ∀ x ∈ nonnegativeInputs, F (t • x) = t * F x
  upstream_pos : 0 < L crsUpstreamUnit
  downstream_pos : 0 < L crsDownstreamUnit

/-- Output at the unit complementary match. -/
def crsOutputAtUnit (p : RestrictedCRSAtUnit) : ℝ := p.F crsUnit

/-- Upstream marginal product at the unit match. -/
def crsUpstreamMPAtUnit (p : RestrictedCRSAtUnit) : ℝ := p.L crsUpstreamUnit

/-- Downstream marginal product at the unit match. -/
def crsDownstreamMPAtUnit (p : RestrictedCRSAtUnit) : ℝ := p.L crsDownstreamUnit

/-- Coordinated fixed-capacity threshold under a restricted CRS technology. -/
def crsPlannerThreshold (delta : ℝ) (p : RestrictedCRSAtUnit) : ℝ :=
  delta / crsOutputAtUnit p

/-- Decentralized threshold under competitive downstream incidence. -/
def crsLocalThreshold (delta : ℝ) (p : RestrictedCRSAtUnit) : ℝ :=
  delta / crsDownstreamMPAtUnit p

/-- Nonnegative-cone degree-one homogeneity holds locally around scalar one. -/
theorem crs_homogeneous_eventually_one (p : RestrictedCRSAtUnit) :
    (fun t : ℝ => p.F (t • crsUnit)) =ᶠ[𝓝 1]
      (fun t : ℝ => t • p.F crsUnit) := by
  filter_upwards [eventually_gt_nhds (show (0 : ℝ) < 1 by norm_num)] with t ht
  have h := p.homogeneous_one t (le_of_lt ht) crsUnit crsUnit_mem_nonnegative
  simpa [smul_eq_mul] using h

/-- Euler's theorem at the unit input, derived inside Lean from homogeneity and differentiability. -/
theorem crs_derivative_apply_unit (p : RestrictedCRSAtUnit) :
    p.L crsUnit = p.F crsUnit := by
  have hid : HasDerivAt (fun t : ℝ => t) 1 1 := hasDerivAt_id (1 : ℝ)
  have h := p.differentiable_unit.apply_self_eq_smul_of_eventuallyEq
    hid (crs_homogeneous_eventually_one p)
  simpa using h

/-- The derivative at the unit vector decomposes into the two coordinate marginal products. -/
theorem crs_derivative_unit_decomposition (p : RestrictedCRSAtUnit) :
    p.L crsUnit = p.L crsUpstreamUnit + p.L crsDownstreamUnit := by
  have hpair : crsUnit = crsUpstreamUnit + crsDownstreamUnit := by
    ext <;> norm_num [crsUnit, crsUpstreamUnit, crsDownstreamUnit]
  rw [hpair, map_add]

/-- Euler identity `F(1,1)=F_u(1,1)+F_d(1,1)` derived from the CRS certificate. -/
theorem crs_euler_unit (p : RestrictedCRSAtUnit) :
    p.F crsUnit = p.L crsUpstreamUnit + p.L crsDownstreamUnit := by
  rw [← crs_derivative_unit_decomposition p]
  exact (crs_derivative_apply_unit p).symm

/-- Euler plus positive marginal products implies positive unit output. -/
theorem crs_output_pos (p : RestrictedCRSAtUnit) :
    0 < crsOutputAtUnit p := by
  unfold crsOutputAtUnit
  rw [crs_euler_unit p]
  exact add_pos p.upstream_pos p.downstream_pos

/-- Positive upstream marginal product makes downstream incidence strictly smaller than total output. -/
theorem crs_downstream_lt_output (p : RestrictedCRSAtUnit) :
    crsDownstreamMPAtUnit p < crsOutputAtUnit p := by
  unfold crsDownstreamMPAtUnit crsOutputAtUnit
  rw [crs_euler_unit p]
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

end

end IPCRVC
