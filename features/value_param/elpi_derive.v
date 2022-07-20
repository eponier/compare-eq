From elpi.apps Require Import derive.

Require Import type.

(* Should we measure the time used to derive the dependencies? *)
#[only(eqOK)] derive nat.
#[only(eqOK)] derive bool.
Time #[only(eqOK)] derive t.

Fail Check t_eq_OK.
