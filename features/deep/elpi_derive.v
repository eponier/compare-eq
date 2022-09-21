From elpi.apps Require Import derive.

Require Import type.

#[only(eqOK)] derive option.
#[only(eqOK)] derive list.
#[only(eqOK),verbose] derive deep.

Succeed Check deep_eq_OK.
