From elpi.apps Require Import derive.

Require Import type.

#[only(eqcorrect),verbose] derive bool.
#[only(eqcorrect),verbose] derive BinNums.positive.
#[only(eqcorrect),verbose] derive BinNums.Z.
#[only(eqcorrect),verbose] derive wsize.
#[only(eqbcorrect),verbose] derive value.

Fail Check value_eq_OK.
