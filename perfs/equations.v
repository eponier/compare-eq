From Equations Require Import Equations.

Require Import types.

(* Derive NoConfusionHom seems much slower, so we use Derive NoConfusion *)

Module Small.

Import Small.

Time Equations Derive NoConfusion for t.
(* Time Equations Derive NoConfusionHom for t. *)

Time Equations Derive EqDec for t.

End Small.


Module Medium.

Import Medium.

Time Equations Derive NoConfusion for t.
(* Time Equations Derive NoConfusionHom for t. *)

Time Equations Derive EqDec for t.

End Medium.


Module Large.

Import Large.

Time Equations Derive NoConfusion for t.
(* Time Equations Derive NoConfusionHom for t. *)

Time Equations Derive EqDec for t.

End Large.


Module VeryLarge.

Import VeryLarge.

Time Equations Derive NoConfusion for t.
(* Time Equations Derive NoConfusionHom for t. *)

Time Equations Derive EqDec for t.

End VeryLarge.
