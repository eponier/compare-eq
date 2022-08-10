Require Import type.

Lemma t_eq_dec : forall A (eq_dec : forall (x y : A), {x = y} + {x <> y}) (x y : t A),
  {x = y} + {x <> y}.
Proof.
  intros A eq_dec.
  unshelve refine (fix aux (x : t A) :=
    let aux2 (l1 : list (t A)) : forall l2, {l1 = l2} + {l1 <> l2} := _ in
    _); [|clearbody aux2].
  - decide equality.
  - decide equality.
Defined.
