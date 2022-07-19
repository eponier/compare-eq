Inductive t :=
| C : t2 -> t

with t2 :=
| D1 : t2
| D2 : t -> t2
.
