From elpi.apps Require Import feqb.

Require Import type.

feqb wsize.
feqb BinNums.positive.
feqb BinNums.Z.
feqb bool.
Elpi derive.param1.trivial is_bool.
Elpi derive.param1 andb.
Elpi derive.param1 comparison.
Module Import positive.
Elpi derive.param1 BinPos.Pos.compare_cont.
Elpi derive.param1 BinPos.Pos.compare.
End positive.
Elpi derive.param1 CompOpp.
Elpi derive.param1 BinInt.Z.compare.
Elpi derive.param1 BinInt.Z.leb.
Elpi derive.param1 BinInt.Z.ltb.
Elpi derive.param1 nat.
Module Import nat.
Elpi derive.param1 nat_rect.
End nat.
Elpi derive.param1 Zpower.shift_nat.
Elpi derive.param1 Zpower.two_power_nat.
Elpi derive.param1 modulus.
Elpi derive.param1 wsize_size.

feqb word.
feqb value.

Succeed Check value_eqb_correct.
Succeed Check value_eqb_refl.
