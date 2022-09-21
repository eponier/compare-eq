From elpi.apps Require Import feqb.

Require Import type.

(* Should we measure the time used to derive the dependencies? *)
feqb nat.
Elpi derive.param1.trivial is_nat.
feqb bool.
Elpi derive.param1.trivial is_bool.
Elpi derive.param1 Nat.eqb.
#[verbose] feqb t.

Succeed Check t_eqb_correct.
Succeed Check t_eqb_refl.
