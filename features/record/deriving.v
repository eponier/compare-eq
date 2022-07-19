From mathcomp Require Import ssreflect ssrnat eqtype.
From deriving Require Import deriving.

Require Import type.

(* cf. https://github.com/arthuraa/deriving/blob/master/tests/records.v *)

Scheme t_rect := Induction for t Sort Type.

Time Definition t_indDef := [indDef for t_rect].
Canonical t_indType := IndType t t_indDef.

Time Definition t_eqMixin := [derive eqMixin for t].
Canonical t_eqType := EqType t t_eqMixin.
