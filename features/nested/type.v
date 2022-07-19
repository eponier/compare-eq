(* Rose tree *)
Inductive t (A : Type) := Leaf (a : A) | Node (sib : list (t A)).
