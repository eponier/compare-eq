From elpi.apps Require Import feqb.

Require Import type.

(* Should we measure the time used to derive the dependencies? *)
feqb nat.
#[verbose] feqb t.

Succeed Check t_eqb_correct.
Succeed Check t_eqb_refl.
