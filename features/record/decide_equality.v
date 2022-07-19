Require Import type.

Lemma t_eq_dec : forall (x y : t), {x = y} + {x <> y}.
Proof. Time repeat decide equality. Time Qed.
