From mathcomp Require Import ssreflect ssrnat eqtype.
From deriving Require Import deriving.

Require Import type.

(* cf. https://github.com/arthuraa/deriving/blob/master/tests/mutual.v *)

Scheme t_rect2  := Induction for t  Sort Type
  with t2_rect2 := Induction for t2 Sort Type.

Combined Scheme t_t2_rect from t_rect2, t2_rect2.

Time Definition t_indDef := [indDef for t_t2_rect].
Canonical t_indType := IndType t t_indDef.

Time Definition t_eqMixin := [derive eqMixin for t].
Canonical t_eqType := EqType t t_eqMixin.
