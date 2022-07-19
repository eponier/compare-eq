From Equations Require Import Equations.

Require Import type.

(* Derive NoConfusionHom seems much slower, so we use Derive NoConfusion *)
(* Time Equations Derive NoConfusionHom for t. *)

Succeed Equations Derive Signature NoConfusion EqDec for t.
(* Equations leaves one unsolved obligation, meaning it failed to automatically generate everything *)
