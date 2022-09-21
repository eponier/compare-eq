From mathcomp Require Import ssreflect eqtype.
From deriving Require Import deriving.

Require Import type.

Section induction.

Variable (P1 : deep -> Type).
Variable (P2 : option deep -> Type).
Variable (P3 : list (option deep) -> Type).
Variable (HD : forall l, P3 l -> P1 (D l)).
Variable (HS : forall d, P1 d -> P2 (Some d)).
Variable (HN : P2 None).
Variable (Hn : P3 nil).
Variable (Hc : forall o, P2 o -> forall l, P3 l -> P3 (o::l)).

Definition deep_rect : forall d, P1 d :=
  fix deep_rect d :=
    let fix option_deep_rect o : P2 o :=
      match o with
      | Some d => HS d (deep_rect d)
      | None => HN
      end
      in
    let fix list_deep_rect l : P3 l :=
      match l with
      | nil => Hn
      | o :: l => Hc o (option_deep_rect o) l (list_deep_rect l)
      end%list
    in
    match d with
    | D l => HD l (list_deep_rect l)
    end.

Definition option_deep_rect : forall o, P2 o :=
  fix option_deep_rect o :=
    match o with
    | Some d => HS d (deep_rect d)
    | None => HN
    end.

Definition list_deep_rect : forall l, P3 l :=
  fix list_deep_rect l :=
    match l with
    | nil => Hn
    | o :: l => Hc o (option_deep_rect o) l (list_deep_rect l)
    end%list.

Combined Scheme deep_list_option_rect from deep_rect, option_deep_rect, list_deep_rect.

End induction.

Module M2.

Section induction2.

Variable (P1 : deep -> Type).
Variable (P2 : list (option deep) -> Type).
Variable (HD : forall l, P2 l -> P1 (D l)).
Variable (HS : forall d, P1 d -> forall l, P2 l -> P2 (cons (Some d) l)).
Variable (HN : forall l, P2 l -> P2 (cons None l)).
Variable (Hn : P2 nil).

Definition deep_rect : forall d, P1 d :=
  fix deep_rect d :=
    let fix list_deep_rect l : P2 l :=
      match l with
      | nil => Hn
      | o :: l =>
        match o with
        | Some d => HS d (deep_rect d) l (list_deep_rect l)
        | None => HN l (list_deep_rect l)
        end
      end%list
    in
    match d with
    | D l => HD l (list_deep_rect l)
    end.

Definition list_deep_rect : forall l, P2 l :=
  fix list_deep_rect l :=
    match l with
    | nil => Hn
    | o :: l =>
      match o with
      | Some d => HS d (deep_rect d) l (list_deep_rect l)
      | None => HN l (list_deep_rect l)
      end
    end%list.

Combined Scheme deep_list_option_rect from deep_rect, list_deep_rect.

End induction2.

End M2.

Time Definition deep_indDef := [indDef for deep_list_option_rect].
Canonical deep_indType := IndType deep deep_indDef.

Time Definition deep_eqMixin := [derive eqMixin for deep].
Canonical deep_eqType := EqType deep deep_eqMixin.
