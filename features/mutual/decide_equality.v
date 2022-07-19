Require Import type.

Lemma t_eq_dec : forall (x y : t), {x = y} + {x <> y}.
Proof.
  refine (
    fix aux (x : t) := _
    with aux2 (x : t2) : forall y : t2, {x=y}+{x<>y} := _
    for aux).
  - decide equality.
  - decide equality.
Defined.
