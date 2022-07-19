Inductive t : nat -> Type :=
| nil : t 0
| cons : forall n, nat -> t n -> t (S n).
