Require Import type.

Fixpoint deep_eq_dec n o1 : forall o2 : ord n, {o1 = o2} + {o1 <> o2}.
Proof. decide equality. repeat decide equality. Defined.
