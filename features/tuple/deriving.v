From mathcomp Require Import ssreflect eqtype.
From deriving Require Import deriving.

Require Import type.

Fail Definition tuple_indDef := [indDef for tuple_rect].
