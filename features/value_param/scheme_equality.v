Require Import type.

Fail Scheme Equality for t.
(* Unexpected error during scheme creation: In environment
n : nat
The term "n" has type "nat" which should be Set, Prop or Type. *)
