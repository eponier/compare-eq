Require Import type.

Fixpoint deep_eq_dec f1 : forall f2 : forest, {f1 = f2} + {f1 <> f2}.
Proof. repeat decide equality. Defined.
