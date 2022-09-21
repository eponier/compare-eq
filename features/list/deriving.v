From mathcomp Require Import ssreflect eqtype.
From deriving Require Import deriving.

(* seq_indType is already defined, so to be sure that we don't rely on it,
   we redefine list *)
Inductive list A := | nil | cons : A -> list A -> list A.

Definition list_indDef A := [indDef for list_rect A].
Canonical list_indType A := IndType (list A) (list_indDef A).

Definition list_eqMixin (A : eqType) := [derive eqMixin for list A].
Canonical list_eqType (A:eqType) := EqType (list A) (list_eqMixin A).
