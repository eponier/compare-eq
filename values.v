Require Import ZArith Bool.
From mathcomp Require Import ssrnat.
From elpi.apps Require Import derive.

(* 5 changes w.r.t. the original values.v:
   - is_true -> = true
   - "Inductive word" instead of "Definition word"
   - no "comRingType" involved
   - is_sarr = false -> is_not_sarr = true
   - no Varr case, since the array type is not an eqType
*)

Module Import Word.

Definition modulus nbits := two_power_nat nbits.

(* we don't support [is_true], so let's inline it!
Record word (nbits : nat) : Set := mkWord
  { toword : Z;  _ : is_true ((0 <=? toword) && (toword <? modulus nbits))%Z }.
*)

Record word (nbits : nat) : Set := mkWord
  { toword : Z;  _ : (0 <=? toword)%Z && (toword <? modulus nbits)%Z = true }.

#[only(eqbcorrect,param1_trivial)] derive bool.
#[only(eqbcorrect)] derive nat.
#[only(eqbcorrect)] derive positive.
#[only(eqbcorrect)] derive Z.

Elpi derive.param1 andb.
Elpi derive.param1 comparison.
Elpi derive.param1 Pos.compare_cont.
Module Import Pos.
Elpi derive.param1 Pos.compare.
End Pos.
Elpi derive.param1 CompOpp.
Elpi derive.param1 Z.compare.
Elpi derive.param1 Z.leb.
Elpi derive.param1 Z.ltb.
Elpi derive.param1 nat_rect.
Elpi derive.param1 shift_nat.
Elpi derive.param1 two_power_nat.
Elpi derive.param1 modulus.
#[only(eqbcorrect)] derive word.

Check word_eqb_correct : forall (nbits : nat) (w1 w2 : word nbits), word_eqb _ _ w1 w2 -> w1 = w2.
Check word_eqb_refl : forall (nbits : nat) (w : word nbits), word_eqb _ _ w w.

End Word.

Variant wsize :=
  | U8
  | U16
  | U32
  | U64
  | U128
  | U256.

Definition nat7   : nat := 7.
Definition nat15  : nat := nat7.+4.+4.
Definition nat31  : nat := nat15.+4.+4.+4.+4.
Definition nat63  : nat := nat31.+4.+4.+4.+4.+4.+4.+4.+4.
Definition nat127 : nat := nat63.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.
Definition nat255 : nat := nat127.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.+4.

Definition wsize_size_minus_1 (s: wsize) : nat :=
  match s with
  | U8   => nat7
  | U16  => nat15
  | U32  => nat31
  | U64  => nat63
  | U128 => nat127
  | U256 => nat255
  end.

(* we don't support Definition, so let's introduce another inductive *)
(* Definition word sz := Word.word (wsize_size_minus_1 sz).+1. *)
Inductive word (ws : wsize) := | mkWord : Word.word (wsize_size_minus_1 ws).+1 -> word.

#[only(eqbcorrect)] derive wsize.
Elpi derive.param1 nat7.
Elpi derive.param1 nat15.
Elpi derive.param1 nat31.
Elpi derive.param1 nat63.
Elpi derive.param1 nat127.
Elpi derive.param1 nat255.
Elpi derive.param1 wsize_size_minus_1.
#[only(eqbcorrect)] derive word.

Variant stype : Set :=
| sbool
| sint
| sarr  of positive
| sword of wsize.

(* we support only "= true", so let's negate the predicate *)
(* Definition is_sarr t := if t is sarr _ then true else false. *)
Definition is_not_sarr t := if t is sarr _ then false else true.

Variant value : Type :=
  | Vbool  :> bool -> value
  | Vint   :> Z    -> value
(* WArray.array is not an eqType, so we must remove this case *)
(*   | Varr   : forall len, WArray.array len -> value *)
  | Vword  : forall s, word s -> value
(*   | Vundef : forall (t:stype), is_sarr t = false -> value. *)
  | Vundef : forall (t:stype), is_not_sarr t = true -> value.
Arguments Vundef _ _ : clear implicits.

#[only(eqbcorrect)] derive stype.
(* Elpi derive.param1 is_sarr. *)
Elpi derive.param1 is_not_sarr.
#[only(eqbcorrect),verbose] derive value.

Check value_eqb_correct : forall (v1 v2:value), value_eqb v1 v2 -> v1 = v2.
Check value_eqb_refl : forall (v:value), value_eqb v v.
