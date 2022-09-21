From mathcomp Require Import ssreflect eqtype.
From deriving Require Import deriving.

Require Import type.

Scheme value_rect := Induction for value Sort Type.

(* we cannot derive from word, so we are stuck... *)

Fail Definition value_indDef := [indDef for value_rect].
