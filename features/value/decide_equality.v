Require Import type.

Lemma deep_eq_dec : forall v1 v2 : value, {v1 = v2} + {v1 <> v2}.
Proof. decide equality. Defined.
