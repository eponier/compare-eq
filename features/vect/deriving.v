From mathcomp Require Import ssreflect ssrnat eqtype.
From deriving Require Import deriving.

Require Import type.

Fail Definition vector_indDef := [indDef for vector_rect].
