Require Import type.

Lemma nat_eq_dec : forall x y : nat, {x = y} + {x <> y}.
Proof. decide equality. Defined.
