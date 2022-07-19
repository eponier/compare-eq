Inductive t :=
| C : forall n, Nat.eqb n 5 = true -> t.
