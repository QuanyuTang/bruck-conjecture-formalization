module

import Solution
import Lean.Util.CollectAxioms

/-! # Transitive axiom audit of the theorem submitted to Comparator -/

run_cmd do
  let declaration := ``Bruck.bruck_conjecture
  let permitted := #[``propext, ``Quot.sound, ``Classical.choice]
  let axioms ← Lean.collectAxioms declaration
  for axiomName in axioms do
    unless permitted.contains axiomName do
      throwError "{declaration} uses an unpermitted axiom: {axiomName}"
  Lean.logInfo m!"Axiom whitelist accepted for {declaration}: {axioms}"
