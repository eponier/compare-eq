From mathcomp Require Import ssreflect ssrnat eqtype.
From deriving Require Import deriving.

Require Import type.

(* cf. https://github.com/arthuraa/deriving/blob/master/tests/records.v *)

Scheme t_rect := Induction for t Sort Type.

Time Definition t_indDef := [indDef for t_rect].
Canonical t_indType := IndType t t_indDef.

Module nored.

(* see https://github.com/arthuraa/deriving#simplification-and-performance-issues *)
Definition t_eqMixin : Equality.mixin_of t.
Proof. Time exact [derive nored eqMixin for t]. Time Qed.

End nored.

Optimize Heap. (* try to reduce the impact of making two different things in the same file *)

Time Definition t_eqMixin := [derive eqMixin for t].
Canonical t_eqType := EqType t t_eqMixin.
