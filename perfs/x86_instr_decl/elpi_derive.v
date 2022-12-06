From elpi.apps Require Import derive.

Require Import type.

#[only(eqOK)] derive wsize.
#[only(eqOK)] derive velem.
Time #[only(eqOK),verbose] derive t.

Succeed Check t_eq_OK.
