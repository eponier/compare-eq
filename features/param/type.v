Inductive t (A : Type) :=
| C0 : t A
| C1 : A -> t A
| C2 : A -> nat -> t A
.
