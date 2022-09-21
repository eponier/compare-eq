From elpi.apps Require Import derive.

Require Import type.

#[verbose] derive value.
Elpi derive bool.
Elpi derive BinNums.positive.
Elpi derive BinNums.Z.
Elpi derive wsize.
Elpi derive.param1 andb.

Elpi derive.param1 comparison.
Elpi derive.param1 BinPos.Pos.compare_cont.
Elpi derive.param1 BinPos.Pos.compare.
Elpi derive.param1 CompOpp.
Module Import Z.
Elpi derive.param1 BinInt.Z.compare.
End Z.

Elpi derive.param1 BinInt.Z.leb.
Elpi derive.param1 BinInt.Z.ltb.
Elpi derive.param1 nat.
Module Import M.
Elpi derive.param1 nat_rect.
End M.
Elpi derive.param1 Zpower.shift_nat.
Elpi derive.param1 Zpower.two_power_nat.
Elpi derive.param1 modulus.
Elpi derive.param1 wsize_size.
Elpi derive.param1 word.
Elpi derive.param1 value.
Elpi derive.induction value.

Elpi derive word.
Elpi derive.eq value.
Elpi derive.eqcorrect value.
#[only(eqOK),verbose] derive BinNums.positive.
#[only(eqOK),verbose] derive BinNums.Z.
Elpi derive.eq word.
Elpi derive.eqOK word.
#[only(eqOK),verbose] derive word.
#[only(eqOK)] derive list.
#[only(eqOK),verbose] derive deep.

Succeed Check deep_eq_OK.
