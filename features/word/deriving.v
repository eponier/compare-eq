From mathcomp Require Import ssreflect eqtype.
From deriving Require Import deriving.

Require Import type.

Scheme word_rect := Induction for word Sort Type.

Fail Definition word_indDef := [indDef for word_rect].
