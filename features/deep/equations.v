From Equations Require Import Equations.

Require Import type.

(* Derive NoConfusionHom seems much slower, so we use Derive NoConfusion *)
(* Time Equations Derive NoConfusionHom for t. *)

Section list.

Variable (A : Set) (A_eqdec : EqDec A).

Inductive list := | nil | cons : A -> list -> list.

Equations Derive NoConfusion EqDec for list.

Inductive option := | None | Some : A -> option.

Equations Derive NoConfusion EqDec for option.

End list.

Succeed Equations Derive NoConfusion EqDec for deep.
(* 1 obligation remaining *)
