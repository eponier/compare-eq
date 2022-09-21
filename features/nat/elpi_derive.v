From elpi.apps Require Import derive.

Require Import type.

#[only(eqOK),verbose] derive nat.

Succeed Check nat_eq_OK.
