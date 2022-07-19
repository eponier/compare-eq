Require Import type.

Lemma t_eq_dec : forall (x y : t), {x = y} + {x <> y}.
Proof. Fail decide equality. Abort.
