Require Import type.

Fail Scheme Equality for t.
(* Unexpected error during scheme creation: In environment
n : nat
The term "n" has type "nat" which should be Set, Prop or Type. *)

Module M.

Section S.

Definition dummy (n : nat) := bool.

Variable (n:nat).

Inductive t := | C : dummy n -> t.

Scheme Equality for t.

End S.

Succeed Check t_eq_dec.

End M.
