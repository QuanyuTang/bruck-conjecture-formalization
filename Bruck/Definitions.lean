module

public import Mathlib.Analysis.Analytic.Order
public import Mathlib.Analysis.Complex.Basic

/-! # Sharing an entire-function value with multiplicity -/

@[expose] public section

namespace Bruck

/-- Neither function is identically `a`, and their differences from `a` have equal
analytic orders at every point. -/
def SharesCM (f g : ℂ → ℂ) (a : ℂ) : Prop :=
  f ≠ (fun _ => a) ∧ g ≠ (fun _ => a) ∧
    ∀ z, analyticOrderAt (fun w => f w - a) z = analyticOrderAt (fun w => g w - a) z

end Bruck
