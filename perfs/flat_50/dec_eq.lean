open tactic

inductive t : Sort*
| C0 | C1 | C2 | C3 | C4 | C5 | C6 | C7 | C8 | C9
| C10 | C11 | C12 | C13 | C14 | C15 | C16 | C17 | C18 | C19
| C20 | C21 | C22 | C23 | C24 | C25 | C26 | C27 | C28 | C29
| C30 | C31 | C32 | C33 | C34 | C35 | C36 | C37 | C38 | C39
| C40 | C41 | C42 | C43 | C44 | C45 | C46 | C47 | C48 | C49
.

instance t_dec_eq : decidable_eq t :=
by mk_dec_eq_instance
