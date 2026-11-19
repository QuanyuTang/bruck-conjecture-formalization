module

public import Mathlib.Analysis.Analytic.Order
public import Mathlib.Analysis.Calculus.Deriv.Basic
public import Mathlib.Analysis.Complex.ValueDistribution.CharacteristicFunction
public import Mathlib.Order.LiminfLimsup

/-!
# Brück's conjecture

The characteristic is the Nevanlinna characteristic at infinity.
For an entire function it is the circle average of the positive logarithm
of the norm. Positive integer hyper-orders and infinite hyper-order are excluded.
-/

@[expose] public section

open Filter
open scoped ENNReal

namespace Bruck

/-- Two functions share a value with multiplicities when the shifted functions
are nontrivial and their local analytic orders agree everywhere. -/
def SharesCM (f g : ℂ → ℂ) (a : ℂ) : Prop :=
  f ≠ (fun _ => a) ∧ g ≠ (fun _ => a) ∧
    ∀ z, analyticOrderAt (fun w => f w - a) z = analyticOrderAt (fun w => g w - a) z

/-- The limsup of the logarithmic growth exponent. -/
noncomputable def logOrder (F : ℝ → ℝ) : ℝ≥0∞ :=
  limsup (fun r => ENNReal.ofReal (Real.log (F r) / Real.log r)) atTop

/-- The limsup of the double logarithm of the characteristic divided by `log r`. -/
noncomputable def hyperOrder (f : ℂ → ℂ) : ℝ≥0∞ :=
  logOrder (fun r => Real.log (ValueDistribution.characteristic f ⊤ r))

/-- Brück's conjecture for entire functions sharing a value with their first derivative. -/
theorem bruck_conjecture {f : ℂ → ℂ} (hf : Differentiable ℂ f)
    (hnon : ¬ ∀ z, f z = f 0) (a : ℂ) (hshare : SharesCM f (deriv f) a)
    (hfinite : hyperOrder f < ⊤)
    (hnotint : ∀ n : ℕ, 0 < n → hyperOrder f ≠ (n : ℝ≥0∞)) :
    ∃ c : ℂ, c ≠ 0 ∧ ∀ z, deriv f z - a = c * (f z - a) := by
  sorry

end Bruck
