From mathcomp Require Import ssreflect eqtype.
From deriving Require Import deriving.

Require Import type.

Section induction.

Variable (P : instr -> Type) (Pc : cmd -> Type).
Variable (Hassgn   : forall (l : lval) (a : assgn_tag) (s : stype) (p : pexpr), P (Cassgn l a s p)).
Variable (Hopn     : forall (l : lvals) (a : assgn_tag) (s : sopn) (l0 : pexprs), P (Copn l a s l0)).
Variable (Hsyscall : forall (l : lvals) (s : syscall_t) (l0 : pexprs), P (Csyscall l s l0)).
Variable (Hif      : forall (p : pexpr) l, Pc l -> forall l0, Pc l0 -> P (Cif p l l0)).
Variable (Hfor     : forall (v : var_i) (p : range) (l : cmd), Pc l -> P (Cfor v p l)).
Variable (Hwhile   : forall (a : align) (l : cmd), Pc l -> forall (p : pexpr) (l0 : cmd), Pc l0 -> P (Cwhile a l p l0)).
Variable (Hcall    : forall (i : iinfo) (l : lvals) (p : info) (l0 : pexprs), P (Ccall i l p l0)).
Variable (Hnil     : Pc nil).
Variable (Hcons    : forall ii i, P i -> forall c, Pc c -> Pc (cons (ii, i) c)).

Fixpoint instr_rect i : P i :=
  let fix cmd_rect c : Pc c :=
    match c with
    | nil => Hnil
    | cons (ii, i) c => Hcons ii i (instr_rect i) c (cmd_rect c)
    end
  in
  match i with
  | Cassgn l a s p => Hassgn l a s p
  | Copn l a s l0 => Hopn l a s l0
  | Csyscall l s l0 => Hsyscall l s l0
  | Cif p l l0 => Hif p l (cmd_rect l) l0 (cmd_rect l0)
  | Cfor v p l => Hfor v p l (cmd_rect l)
  | Cwhile a l p l0 => Hwhile a l (cmd_rect l) p l0 (cmd_rect l0)
  | Ccall i l p l0 => Hcall i l p l0
  end.

Fixpoint cmd_rect c : Pc c :=
  match c with
  | nil => Hnil
  | cons (ii, i) c => Hcons ii i (instr_rect i) c (cmd_rect c)
  end.

Combined Scheme instr_cmd_rect from instr_rect, cmd_rect.

End induction.

Scheme stype_rect := Induction for stype Sort Type.
Definition stype_indDef := [indDef for stype_rect].
Canonical stype_indType := IndType stype stype_indDef.
Definition stype_eqMixin := [derive eqMixin for stype].
Canonical stype_eqType := EqType stype stype_eqMixin.

Scheme var_rect := Induction for var Sort Type.
Definition var_indDef := [indDef for var_rect].
Canonical var_indType := IndType var var_indDef.
Definition var_eqMixin := [derive eqMixin for var].
Canonical var_eqType := EqType var var_eqMixin.

Scheme var_i_rect := Induction for var_i Sort Type.
Definition var_i_indDef := [indDef for var_i_rect].
Canonical var_i_indType := IndType var_i var_i_indDef.
Definition var_i_eqMixin := [derive eqMixin for var_i].
Canonical var_i_eqType := EqType var_i var_i_eqMixin.

Definition lval_indDef := [indDef for lval_rect].
Canonical lval_indType := IndType lval lval_indDef.
Definition lval_eqMixin := [derive eqMixin for lval].
Canonical lval_eqType := EqType lval lval_eqMixin.

Definition assgn_tag_indDef := [indDef for assgn_tag_rect].
Canonical assgn_tag_indType := IndType assgn_tag assgn_tag_indDef.
Definition assgn_tag_eqMixin := [derive eqMixin for assgn_tag].
Canonical assgn_tag_eqType := EqType assgn_tag assgn_tag_eqMixin.

Definition pexpr_indDef := [indDef for pexpr_rect].
Canonical pexpr_indType := IndType pexpr pexpr_indDef.
Definition pexpr_eqMixin := [derive eqMixin for pexpr].
Canonical pexpr_eqType := EqType pexpr pexpr_eqMixin.

Definition sopn_indDef := [indDef for sopn_rect].
Canonical sopn_indType := IndType sopn sopn_indDef.
Definition sopn_eqMixin := [derive eqMixin for sopn].
Canonical sopn_eqType := EqType sopn sopn_eqMixin.

Scheme syscall_t_rect := Induction for syscall_t Sort Type.
Definition syscall_t_indDef := [indDef for syscall_t_rect].
Canonical syscall_t_indType := IndType syscall_t syscall_t_indDef.
Definition syscall_t_eqMixin := [derive eqMixin for syscall_t].
Canonical syscall_t_eqType := EqType syscall_t syscall_t_eqMixin.

Scheme dir_rect := Induction for dir Sort Type.
Definition dir_indDef := [indDef for dir_rect].
Canonical dir_indType := IndType dir dir_indDef.
Definition dir_eqMixin := [derive eqMixin for dir].
Canonical dir_eqType := EqType dir dir_eqMixin.

Scheme align_rect := Induction for align Sort Type.
Definition align_indDef := [indDef for align_rect].
Canonical align_indType := IndType align align_indDef.
Definition align_eqMixin := [derive eqMixin for align].
Canonical align_eqType := EqType align align_eqMixin.

Scheme iinfo_rect := Induction for iinfo Sort Type.
Definition iinfo_indDef := [indDef for iinfo_rect].
Canonical iinfo_indType := IndType iinfo iinfo_indDef.
Definition iinfo_eqMixin := [derive eqMixin for iinfo].
Canonical iinfo_eqType := EqType iinfo iinfo_eqMixin.

Import seq.

Time Definition instr_indDef := [indDef for instr_cmd_rect].
Canonical instr_indType := IndType instr instr_indDef.

Time Definition instr_eqMixin := [derive eqMixin for instr].
Canonical instr_eqType := EqType instr instr_eqMixin.
