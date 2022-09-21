From Equations Require Import Equations.

Require Import type.

(* we need to use NoConfusionHom and not NoConfusion *)
Equations Derive Signature NoConfusionHom EqDec for t.

Succeed Check t_eqdec.
