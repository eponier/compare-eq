Require Import type.

Lemma t_eq_dec : forall A (eq_dec : forall x y : A, {x = y} + {x <> y}) (x y : t A), {x = y} + {x <> y}.
Proof. Time repeat decide equality. Time Qed.
