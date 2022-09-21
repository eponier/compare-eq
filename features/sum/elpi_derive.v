From elpi.apps Require Import derive.

Require Import type.

#[only(eqOK),verbose] derive sum.

Succeed Check sum_eq_OK.
