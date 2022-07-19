From mathcomp Require Import ssreflect eqtype.
From deriving Require Import deriving.

Require Import type.

(* I tried to write the induction principle myself, but it does not work with
   deriving. *)
Module induction_try.

(* We have to manually write the right induction behaviour *)
Section induction.

Context (A : Type) (P : t A -> Type).
Context
  (H0 : forall a, P (Leaf _ a))
  (H1 : P (Node _ nil))
  (H2 : forall a l, P (Node _ l) -> P (Node _ (a::l))).

Lemma t_rect : forall x, P x.
Proof.
  refine (fix aux x :=
    match x with
    | Leaf a => H0 a
    | Node l =>
      (fix aux0 (l : list (t A)) :=
      match l with
      | nil => H1
      | cons _ _ => H2 _ _ (aux0 _)
      end) l
    end).
Defined.

Lemma list_t_rect : forall l, P (Node _ l).
Proof.
  refine (fix aux l :=
    match l with
    | nil => H1
    | cons _ _ => H2 _ _ (aux _)
    end).
Defined.

Combined Scheme t_list_t_rect from t_rect, list_t_rect.

End induction.

End induction_try.

Module induction_done_right.

(* see https://github.com/arthuraa/deriving/blob/master/tests/nested.v *)

Section induction.

Context (A : eqType).

Definition t_rect
  (P1 : t A -> Type)
  (P2 : list (t A) -> Type)
  (HL : forall a, P1 (Leaf _ a))
  (HR : forall rs, P2 rs -> P1 (Node _ rs))
  (HN : P2 nil)
  (HC : forall r, P1 r -> forall rs, P2 rs -> P2 (cons r rs))
  : forall r, P1 r :=
  fix rose_rect r :=
    let fix seq_rose_rect rs : P2 rs :=
        match rs with
        | nil => HN
        | cons r rs => HC r (rose_rect r) rs (seq_rose_rect rs)
        end in
    match r with
    | Leaf a => HL a
    | Node rs => HR rs (seq_rose_rect rs) end.

Definition list_t_rect
  (P1 : t A -> Type)
  (P2 : list (t A) -> Type)
  (HL : forall a, P1 (Leaf _ a))
  (HR : forall rs, P2 rs -> P1 (Node _ rs))
  (HN : P2 nil)
  (HC : forall r, P1 r -> forall rs, P2 rs -> P2 (cons r rs))
  : forall rs, P2 rs :=
    fix list_t_rect rs : P2 rs :=
      match rs with
      | nil => HN
      | cons r rs => HC r (t_rect _ _ HL HR HN HC r) rs (list_t_rect rs)
      end.

Combined Scheme t_list_t_rect from t_rect, list_t_rect.

Definition t_list_t_indDef := [indDef for t_list_t_rect].
Canonical t_indType := IndType (t A) t_list_t_indDef.
Definition t_eqMixin := [derive eqMixin for t A].
Canonical rose_eqType := EqType (t A) t_eqMixin.

End induction.

End induction_done_right.
