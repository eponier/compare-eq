From elpi.apps Require Import derive.

Require Import type.

#[only(eqOK),verbose] derive BinNums.positive.
#[only(eqOK),verbose] derive BinNums.Z.
Elpi derive.eq word.
Elpi derive.eqOK word.
#[only(eqOK),verbose] derive word.
#[only(eqOK)] derive list.
#[only(eqOK),verbose] derive deep.

Succeed Check deep_eq_OK.
