module

import Bruck
import Lean.Util.CollectAxioms

/-! # Transitive axiom audit of the public theorem and its definition comparisons -/

run_cmd do
  let declarations := #[``Bruck.bruck_conjecture, ``Bruck.sharesCM_iff_iteratedDeriv_vanishing,
    ``Bruck.hyperOrder_eq_limsup_circleAverage_posLog]
  let permitted := #[``propext, ``Quot.sound, ``Classical.choice]
  for declaration in declarations do
    let axioms ← Lean.collectAxioms declaration
    for axiomName in axioms do
      unless permitted.contains axiomName do
        throwError "{declaration} uses an unpermitted axiom: {axiomName}"
    Lean.logInfo m!"Axiom whitelist accepted for {declaration}: {axioms}"
