From elpi.apps Require Import derive.

Require Import type.

Time #[only(eqOK)] derive list.
Time #[only(eqOK)] derive t.

(* or directly "Time #[only(eqOK)] derive list t" ?? *)
