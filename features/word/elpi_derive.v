From elpi.apps Require Import derive.

Require Import type.

#[only(eqOK),verbose] derive BinNums.positive.
#[only(eqOK),verbose] derive BinNums.Z.
#[only(eqOK),verbose] derive word.

Fail Check word_eq_OK.
