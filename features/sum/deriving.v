From mathcomp Require Import ssreflect eqtype.
From deriving Require Import deriving.

Require Import type.

Time Definition sum_indDef L R := [indDef for sum_rect L R].
Canonical sum_indType L R := IndType (sum L R) (sum_indDef L R).

Time Definition sum_eqMixin (L R : eqType) := [derive eqMixin for sum L R].
Canonical sum_eqType (L R : eqType) := EqType (sum L R) (sum_eqMixin L R).
