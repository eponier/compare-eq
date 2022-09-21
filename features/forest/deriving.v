From mathcomp Require Import ssreflect ssrnat eqtype.
From deriving Require Import deriving.

Require Import type.

(*
Section induction.

Variable (P1 : forest -> Type) (P2 : tree -> Type).
Variable (He : P1 empty).
Variable (Ha : forall t, P2 t -> forall f, P1 f -> P1 (add t f)).
Variable (Hn : forall n f, P1 f -> P2 (node n f)).

Fixpoint forest_rect f :=
  match f with
  | empty => He
  | add t f => Ha t (tree_rect t) f (forest_rect f)
  end
with tree_rect t :=
    match t with
    | node n f => Hn n f (forest_rect f)
    end.

Combined Scheme forest_tree_rect from forest_rect, tree_rect.

End induction.
*)

Scheme forest_rect := Induction for forest Sort Type
  with   tree_rect := Induction for tree Sort Type.

Combined Scheme forest_tree_rect from forest_rect, tree_rect.

Time Definition forest_indDef := [indDef for forest_tree_rect].
Canonical forest_indType := IndType forest forest_indDef.

Time Definition forest_eqMixin := [derive eqMixin for forest].
Canonical forest_eqType := EqType forest forest_eqMixin.
