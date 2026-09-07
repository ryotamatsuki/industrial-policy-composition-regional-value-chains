import IPCRVC.ProductionRobustness

/-!
# CES production-function robustness

This file strengthens the Stage 7.5A CES robustness check by formalizing the CES
production function itself,

`F(u,d) = [omega * u^rho + (1-omega) * d^rho]^(1/rho)`,

using `Real.rpow`.  It then derives the two unit marginal products from the actual
formula rather than taking the incidence shares as primitive.

The file does not claim a global Lean proof of CES concavity.  `CESAdmissible` retains
the concavity-compatible economic parameter restriction frozen in Stage 7.5A; the
machine-checked claims here are the unit output, the two unit partial derivatives, and
the resulting threshold ordering.
-/

namespace IPCRVC

noncomputable section

open scoped Real

/-- CES production function on real inputs.  The economic application uses positive inputs. -/
def cesProduction (omega rho u d : ℝ) : ℝ :=
  (omega * u ^ rho + (1 - omega) * d ^ rho) ^ (1 / rho)

/-- CES output at the unit complementary match is one. -/
theorem cesProduction_unit (omega rho : ℝ) :
    cesProduction omega rho 1 1 = 1 := by
  simp [cesProduction]

/-- The upstream CES slice has unit derivative `omega`. -/
theorem ces_upstream_hasDerivAt_unit {omega rho : ℝ} (hrho : rho ≠ 0) :
    HasDerivAt (fun u : ℝ => cesProduction omega rho u 1) omega 1 := by
  have hpow : HasDerivAt (fun u : ℝ => u ^ rho) rho 1 := by
    simpa using
      (Real.hasDerivAt_rpow_const (x := (1 : ℝ)) (p := rho) (Or.inl one_ne_zero))
  have hinner :
      HasDerivAt (fun u : ℝ => omega * u ^ rho + (1 - omega)) (omega * rho) 1 := by
    simpa using (hpow.const_mul omega).add_const (1 - omega)
  have hinner_ne : omega * (1 : ℝ) ^ rho + (1 - omega) ≠ 0 := by
    norm_num
  have hout := hinner.rpow_const (p := 1 / rho) (Or.inl hinner_ne)
  convert hout using 1
  · funext u
    simp [cesProduction]
  · simp
    field_simp [hrho]

/-- The downstream CES slice has unit derivative `1-omega`. -/
theorem ces_downstream_hasDerivAt_unit {omega rho : ℝ} (hrho : rho ≠ 0) :
    HasDerivAt (fun d : ℝ => cesProduction omega rho 1 d) (1 - omega) 1 := by
  have hpow : HasDerivAt (fun d : ℝ => d ^ rho) rho 1 := by
    simpa using
      (Real.hasDerivAt_rpow_const (x := (1 : ℝ)) (p := rho) (Or.inl one_ne_zero))
  have hinner :
      HasDerivAt (fun d : ℝ => omega + (1 - omega) * d ^ rho) ((1 - omega) * rho) 1 := by
    simpa using (hpow.const_mul (1 - omega)).const_add omega
  have hinner_ne : omega + (1 - omega) * (1 : ℝ) ^ rho ≠ 0 := by
    norm_num
  have hout := hinner.rpow_const (p := 1 / rho) (Or.inl hinner_ne)
  convert hout using 1
  · funext d
    simp [cesProduction]
  · simp
    field_simp [hrho]

/-- The actual CES formula reproduces the unit incidence shares used in Stage 7.5A. -/
theorem ces_formula_unit_incidence {omega rho : ℝ} (hces : CESAdmissible omega rho) :
    deriv (fun u : ℝ => cesProduction omega rho u 1) 1 = omega ∧
    deriv (fun d : ℝ => cesProduction omega rho 1 d) 1 = 1 - omega := by
  constructor
  · exact (ces_upstream_hasDerivAt_unit hces.2.2.2).deriv
  · exact (ces_downstream_hasDerivAt_unit hces.2.2.2).deriv

/--
Using the actual CES production formula and its downstream marginal product, the
coordinated fixed-capacity threshold is strictly below the decentralized threshold.
-/
theorem ces_formula_threshold_ordering {delta omega rho : ℝ}
    (hdelta : 0 < delta) (hces : CESAdmissible omega rho) :
    delta / cesProduction omega rho 1 1 <
      delta / deriv (fun d : ℝ => cesProduction omega rho 1 d) 1 := by
  rw [cesProduction_unit]
  rw [(ces_downstream_hasDerivAt_unit hces.2.2.2).deriv]
  have hdown : 0 < 1 - omega := sub_pos.mpr hces.2.1
  have hdown1 : 1 - omega < 1 := by linarith [hces.1]
  simpa using switching_threshold_ordering hdelta hdown hdown1

end

end IPCRVC
