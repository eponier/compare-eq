From mathcomp Require Import all_ssreflect.
From Equations Require Import Equations.
Set Equations With UIP.

Section list.

Variable (A : Set) (A_eqdec : EqDec A).

Inductive list := nil | cons : A -> list -> list.

Derive NoConfusion EqDec for list.

Fixpoint length (l : list) : nat :=
  match l with
  | nil => 0
  | cons _ l' => (length l').+1
  end.

End list.

Section tuple.

Variable (A : Set) (A_eqdec : EqDec A).

Inductive tuple i := { l : list A; p : (length _ l == i) = true }.

(* Derive NoConfusionHom seems much slower, so we use Derive NoConfusion *)
(* Time Equations Derive NoConfusionHom for t. *)

(* Equations Derive NoConfusion EqDec for bool.
Equations Derive NoConfusion EqDec for nat. *)
Time Equations Derive NoConfusion EqDec for tuple.

End tuple.

Succeed Check tuple_eqdec.
