From elpi.apps Require Import derive.

Require Import type.

(* Should we measure the time used to derive the dependencies? *)
#[only(eqOK)] derive list.
#[only(eqOK),verbose] derive t.

Succeed Check t_eq_OK.

(* or directly "#[only(eqOK),verbose] derive list t" ?? *)
