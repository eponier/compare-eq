open tactic

inductive t : Sort*
| C0 | C1 | C2 | C3 | C4 | C5 | C6 | C7 | C8 | C9
.

instance t_dec_eq : decidable_eq t :=
by mk_dec_eq_instance
