Require Import type.

Lemma deep_eq_dec A n : forall t1 t2 : tuple A n, {t1 = t2} + {t1 <> t2}.
Proof. decide equality. repeat decide equality. Defined.
