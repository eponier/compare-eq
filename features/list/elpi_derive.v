From elpi.apps Require Import derive.

Require Import type.

#[only(eqOK),verbose] derive list.

Succeed Check list_eq_OK.
