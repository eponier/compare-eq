From mathcomp Require Import ssreflect eqtype.
From deriving Require Import deriving.

Require Import type.

Scheme wsize_rect := Induction for wsize Sort Type.
Definition wsize_indDef := [indDef for wsize_rect].
Canonical wsize_indType := IndType wsize wsize_indDef.
Definition wsize_eqMixin := [derive eqMixin for wsize].
Canonical wsize_eqType := EqType wsize wsize_eqMixin.

Scheme velem_rect := Induction for velem Sort Type.
Definition velem_indDef := [indDef for velem_rect].
Canonical velem_indType := IndType velem velem_indDef.
Definition velem_eqMixin := [derive eqMixin for velem].
Canonical velem_eqType := EqType velem velem_eqMixin.

Scheme t_rect := Induction for t Sort Type.

Time Definition t_indDef := [indDef for t_rect].
Canonical t_indType := IndType t t_indDef.

Module nored.

(* see https://github.com/arthuraa/deriving#simplification-and-performance-issues *)
Definition t_eqMixin : Equality.mixin_of t.
Proof. Time exact [derive nored eqMixin for t]. Time Qed.

End nored.

(* Too slow

Optimize Heap. (* try to reduce the impact of making two different things in the same file *)

Time Definition t_eqMixin := [derive eqMixin for t].
Canonical t_eqType := EqType t t_eqMixin.

*)
