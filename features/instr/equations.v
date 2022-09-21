From Equations Require Import Equations.

Require Import type.

Equations Derive NoConfusion EqDec for stype.
Equations Derive NoConfusion EqDec for bool.
Equations Derive NoConfusion EqDec for Ascii.ascii.
Equations Derive NoConfusion EqDec for String.string.
Equations Derive NoConfusion EqDec for var.
Equations Derive NoConfusion EqDec for info.
Equations Derive NoConfusion EqDec for var_i.
Equations Derive NoConfusion EqDec for lval.
Equations Derive NoConfusion EqDec for assgn_tag.
Equations Derive NoConfusion EqDec for pexpr.
(* Equations Derive NoConfusion EqDec for list. *)
Equations Derive NoConfusion EqDec for sopn.
Equations Derive NoConfusion EqDec for syscall_t.
(* Equations Derive NoConfusion EqDec for prod. *)
Equations Derive NoConfusion EqDec for dir.
Equations Derive NoConfusion EqDec for align.
Equations Derive NoConfusion EqDec for iinfo.
Equations Derive NoConfusion EqDec for instr.
Next Obligation.
  revert x y. fix IH 1.
  change (EqDec instr) in IH.
  eqdec_proof. (* secret tactic? at least not described in the manual *)
Defined.
