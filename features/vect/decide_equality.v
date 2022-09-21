Require Import type.

Lemma deep_eq_dec A (A_eqdec : forall x y : A, {x = y} + {x <> y}) :
  forall n (x y : vector A n), {x = y} + {x <> y}.
Proof. decide equality. repeat decide equality. Defined.
