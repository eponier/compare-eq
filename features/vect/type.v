Inductive vector A : nat -> Type :=
| nil : vector A 0
| cons : A -> forall n, vector A n -> vector A (S n).
