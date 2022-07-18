From Equations Require Import Equations.

Require Import type.

(* Derive NoConfusionHom seems much slower, so we use Derive NoConfusion *)
Time Equations Derive NoConfusion for t.
(* Time Equations Derive NoConfusionHom for t. *)

Time Equations Derive EqDec for t.
