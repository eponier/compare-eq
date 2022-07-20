From elpi.apps Require Import derive.

Require Import type.

(* This uses elpi.1.14.1 because it's the last version compatible with branch
   fast_eqb. I used a different switch to install this version of coq-elpi,
   I hope it does not distort the benchmark. *)

(* Should we measure the time used to derive the dependencies? *)
#[only(eqbcorrect)] derive bool.
#[only(eqbcorrect)] derive nat.
#[only(eqbcorrect),verbose] derive t.

Succeed Check t_eqb_correct.
Succeed Check t_eqb_refl.
