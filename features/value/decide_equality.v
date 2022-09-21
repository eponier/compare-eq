Require Import type.

Lemma value_eq_dec : forall v1 v2 : value, {v1 = v2} + {v1 <> v2}.
Proof. repeat decide equality. Abort.
