From elpi.apps Require Import derive.

Require Import type.

#[only(eqOK)] derive list.
#[only(eqOK),verbose] derive tuple.

Fail Check tuple_eq_OK.
