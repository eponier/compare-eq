From mathcomp Require Import ssreflect eqtype.
From deriving Require Import deriving.

Require Import type.

Scheme word_rect := Induction for word Sort Type.

Time Definition word_indDef := [indDef for word_rect].
Canonical deep_indType := IndType deep deep_indDef.

Time Definition deep_eqMixin := [derive eqMixin for deep].
Canonical deep_eqType := EqType deep deep_eqMixin.
