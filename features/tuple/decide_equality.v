Require Import type.

Lemma tuple_eq_dec A n : forall t1 t2 : tuple A n, {t1 = t2} + {t1 <> t2}.
Proof. repeat decide equality. Abort.
