From Equations Require Import Equations.

Require Import type.

(* Derive NoConfusionHom seems much slower, so we use Derive NoConfusion *)
(* Time Equations Derive NoConfusionHom for t. *)

Succeed Equations Derive NoConfusion EqDec for t.
(* Equations leaves one unsolved obligation, meaning it failed to automatically generate everything *)

Module list.

Section list.

(* If we call Equations inside a section, A is a Set, and we assume EqDec A,
   then this works, but this seems really complex for a simple type like list. *)
Context (A : Set) (eq_dec : EqDec A).

Inductive list := | nil | cons : A -> list -> list.

Derive NoConfusion EqDec for list.

End list.

Succeed Check list_eqdec.

End list.
