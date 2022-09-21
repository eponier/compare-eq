Require Import ZArith Bool.

Variant wsize :=
  | U8
  | U16
  | U32
  | U64
  | U128
  | U256.

Definition wsize_size (s : wsize) : nat :=
  match s with
  | U8 => 8
  | U16 => 16
  | U32 => 32
  | U64 => 64
  | U128 => 128
  | U256 => 256
  end.

Definition modulus nbits := two_power_nat nbits.

Record word (nbits : wsize) := mkWord {
  w : Z;
  _ : (0 <=? w)%Z && (w <? modulus (wsize_size nbits))%Z = true
}.
