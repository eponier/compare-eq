Require Import type.

Fixpoint deep_eq_dec x : forall y : deep, {x = y} + {x <> y}.
Proof. repeat decide equality. Defined.
