/-
Copyright (c) 2026 Robin Langer. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Robin Langer
-/
import WarnaarGlue

/-!
# Certification

`#print axioms` on the headline results. CI runs this file and fails if the output
mentions `sorryAx` (a `sorry` reached the result) or if any report is missing (a
name failed to resolve — a vacuous "proof"). A clean report lists only Lean's
foundational axioms (`propext`, `Classical.choice`, `Quot.sound`).

Note on what "certified" means here. WarnaarGlue proves the *connecting arguments*
("glue") toward Warnaar's positivity conjectures. Two kinds of result appear, and
`#print axioms` treats them the same way — no `sorryAx` — which is exactly the
honest distinction worth making:

* **Unconditional** (`Qcw_nonneg`, `pascal_ladder`, `qbinom_inversion`): proved
  outright, from nothing but Mathlib.
* **Conditional** (`d4_positive`, `seed2_chain`): proved from explicit *named
  hypotheses* standing for published literature results (Corteel–Welsh,
  Kanade–Russell, Uncu, …). Those inputs are ordinary bound hypotheses, not
  axioms and not `sorry` — so the axiom report stays clean, and the theorem's
  statement itself carries the hypotheses it assumes. The glue is machine-checked;
  the imported literature is cited, not re-proved.
-/

-- Unconditional
#print axioms WarnaarGlue.Qcw_nonneg
#print axioms WarnaarGlue.pascal_ladder
#print axioms WarnaarGlue.qbinom_inversion

-- Conditional on explicit named literature hypotheses (see each statement)
#print axioms WarnaarGlue.d4_positive
#print axioms WarnaarGlue.seed2_chain
