From elpi.apps Require Import derive.

Require Import type.

Time #[only(eqOK)] derive nat.
Fail #[only(eqOK)] derive t.
(* Not Yet Implemented: API(env) mutual inductive *)
