From mathcomp Require Import ssreflect ssrnat eqtype.
From deriving Require Import deriving.

Require Import type.

(* t_rect is the recursor automatically generated by Coq *)
Fail Definition t_indDef n := [indDef for t_rect n].
