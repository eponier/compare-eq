Require Import type.

Fixpoint word_eq_dec ws w1 : forall w2 : word ws, {w1 = w2} + {w1 <> w2}.
Proof. repeat decide equality. Abort.
