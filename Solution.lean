module

public import Bruck.Main

/-! # Verified solution to the independent Brück conjecture statement -/

public section

open scoped ENNReal

namespace Bruck

/-- Brück's conjecture for entire functions sharing a value with their first derivative. -/
theorem bruck_conjecture {f : ℂ → ℂ} (hf : Differentiable ℂ f)
    (hnon : ¬ ∀ z, f z = f 0) (a : ℂ) (hshare : SharesCM f (deriv f) a)
    (hfinite : hyperOrder f < ⊤)
    (hnotint : ∀ n : ℕ, 0 < n → hyperOrder f ≠ (n : ℝ≥0∞)) :
    ∃ c : ℂ, c ≠ 0 ∧ ∀ z, deriv f z - a = c * (f z - a) :=
  bruck hf hnon a hshare hfinite hnotint

end Bruck
