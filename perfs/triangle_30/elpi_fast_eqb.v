From elpi.apps Require Import derive.

Require Import type.

(* Should we measure the time used to derive the dependencies? *)
#[verbose] feqb nat.
Time #[only(eqbcorrect),verbose] derive t.

Succeed Check t_eqb_correct.
Succeed Check t_eqb_refl.
