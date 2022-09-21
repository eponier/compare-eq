From mathcomp Require Import ssreflect eqtype.
From deriving Require Import deriving.

Require Import type.

Scheme value_rect := Induction for value Sort Type.

Time Definition value_indDef := [indDef for value_rect].
Canonical deep_indType := IndType deep deep_indDef.

Time Definition deep_eqMixin := [derive eqMixin for deep].
Canonical deep_eqType := EqType deep deep_eqMixin.
