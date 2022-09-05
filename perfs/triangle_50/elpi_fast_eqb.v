From elpi.apps Require Import derive.

Require Import type.

(* Should we measure the time used to derive the dependencies? *)
#[verbose] feqb nat.
Time #[verbose] feqb t.

Succeed Check t_eqb_correct.
Succeed Check t_eqb_refl.
