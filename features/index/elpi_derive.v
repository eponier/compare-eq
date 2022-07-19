From elpi.apps Require Import derive.

Require Import type.

Time #[only(eqOK)] derive nat.
Time #[only(eqOK)] derive t.
(* t_eq_OK not generated *)
