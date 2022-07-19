From elpi.apps Require Import derive.

Require Import type.

Time #[only(eqOK)] derive nat.
Time #[only(eqOK)] derive bool.
Time #[only(eqOK)] derive t.
(* fail to produce t_eq_OK *)
