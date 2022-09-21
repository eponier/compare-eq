From elpi.apps Require Import derive.

Require Import type.

#[only(eqOK),verbose] derive nat.
#[only(eqOK),verbose] derive vector.

Fail Check vector_eq_OK.
