Definition N := 24.

Inductive tree : Type :=
| Leaf : tree
| Node : nat -> tree -> tree -> tree.

Fixpoint binary_tree c n :=
  match n with
  | 0 => Leaf
  | S n =>
    let t := binary_tree c n in
    Node c t t
  end.

Definition t0 := Eval vm_compute in binary_tree 0 N.
Definition t1 := Eval vm_compute in binary_tree 1 N.
