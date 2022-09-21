From mathcomp Require Import ssreflect ssrnat eqtype.
From deriving Require Import deriving.

Require Import type.

Time Definition vector_indDef := [indDef for vector_rect].
Canonical deep_indType := IndType deep deep_indDef.

Time Definition deep_eqMixin := [derive eqMixin for deep].
Canonical deep_eqType := EqType deep deep_eqMixin.
