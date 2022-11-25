Lemma list_eq_dec : forall A (A_eq_dec : forall (x y : A), {x=y}+{x<>y})
  (x y : list A), {x = y} + {x <> y}.
Proof. decide equality. Defined.
