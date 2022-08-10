From elpi.apps Require Import derive.

Require Import type.

#[only(eqOK),verbose] derive bool.
#[only(eqOK),verbose] derive nat.
#[only(eqOK),verbose] derive t.

Succeed Check t_eq_OK.
