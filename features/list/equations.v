From Equations Require Import Equations.

(* Derive NoConfusionHom seems much slower, so we use Derive NoConfusion *)
(* Time Equations Derive NoConfusionHom for t. *)

Section list.

Variable (A:Set) (A_eqdec : EqDec A).

Inductive list := | nil | cons : A -> list -> list.

Time Equations Derive NoConfusion EqDec for list.

End list.

Succeed Check list_eqdec.
