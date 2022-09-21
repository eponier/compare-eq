From Equations Require Import Equations.

Section vector.

Variable (A : Set) (A_eqdec : EqDec A).

Inductive vector : nat -> Type :=
| nil : vector 0
| cons : A -> forall n, vector n -> vector (S n).

(* we need to use NoConfusionHom and not NoConfusion *)
Derive Signature NoConfusionHom EqDec for vector.

End vector.

Succeed Check vector_eqdec.
