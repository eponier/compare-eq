Require Import type.

Lemma t_eq_dec : forall n (x y : t n), {x = y} + {x <> y}.
Proof. Time repeat decide equality. Time Qed.
