From Equations Require Import Equations.
Set Equations With UIP. (* this was the missing bit *)

Require Import type.

(* Derive NoConfusionHom seems much slower, so we use Derive NoConfusion *)
(* Time Equations Derive NoConfusionHom for t. *)

Equations Derive NoConfusion EqDec for t.
Succeed Check t_eqdec.
