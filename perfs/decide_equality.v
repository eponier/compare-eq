Require Import types.


Module Small.

Import Small.

Lemma t_eq_dec : forall x y : t, {x = y} + {x <> y}.
Proof. Time decide equality. Qed.

End Small.


Module Medium.

Import Medium.

Lemma t_eq_dec : forall x y : t, {x = y} + {x <> y}.
Proof. Time decide equality. Qed.

End Medium.


Module Large.

Import Large.

Lemma t_eq_dec : forall x y : t, {x = y} + {x <> y}.
Proof. Time decide equality. Qed.

End Large.


Module VeryLarge.

Import VeryLarge.

Lemma t_eq_dec : forall x y : t, {x = y} + {x <> y}.
Proof. Time decide equality. Qed.

End VeryLarge.
