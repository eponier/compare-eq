Require Import type.

Lemma vector_eq_dec A (A_eqdec : forall x y : A, {x = y} + {x <> y}) :
  forall n (x y : vector A n), {x = y} + {x <> y}.
Proof. repeat decide equality. Abort.
