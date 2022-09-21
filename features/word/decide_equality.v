Require Import type.

Fixpoint deep_eq_dec ws w1 : forall w2 : word ws, {w1 = w2} + {w1 <> w2}.
Proof. decide equality. repeat decide equality. Defined.
