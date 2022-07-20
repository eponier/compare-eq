From elpi.apps Require Import derive.

Require Import type.

(* This uses elpi.1.14.1 because it's the last version compatible with branch
   fast_eqb. I used a different switch to install this version of coq-elpi,
   I hope it does not distort the benchmark. *)

Fail #[only(eqbcorrect)] derive t.
(* Not Yet Implemented: API(env) mutual inductive *)
