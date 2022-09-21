Require Import List. Import ListNotations.
Require Import Recdef.
Require Import Lia.

Inductive tree : Type :=
| Node : nat -> list tree -> tree.

Function binary_tree start n { wf lt n } :=
  match n with
  | 0 => Node start []
  | S n =>
    let p := Nat.div2 n in
    match n - p with
    | 0 => Node start []
    | _ =>
      let l := binary_tree start (n-p) in
      match p with
      | 0 => Node start [l]
      | _ =>
        let r := binary_tree start p in
        Node start [l;r]
      end
    end
  end.
Proof.
  - intros; subst.
    destruct n0; [discriminate|].
    rewrite PeanoNat.Nat.sub_0_r in teq0.
    inversion teq0; subst.
    apply le_n.
  - intros; subst.
    destruct n0; [discriminate|].
    destruct n0; [discriminate|].
    inversion teq1; subst.
    destruct n0.
    + simpl. apply le_n_S, le_n_S, le_0_n.
    + apply le_n_S, le_S, le_S. apply PeanoNat.Nat.lt_div2. apply le_n_S, le_0_n.
  - intros; subst. lia.
  - Search well_founded lt. apply Wf_nat.lt_wf.
Defined.

Definition t_1024 := Eval compute in binary_tree 0 1024.
Definition t_1025 := Eval compute in binary_tree 1 1024.

From elpi.apps Require Import feqb.

feqb nat.
feqb list.
feqb tree.

Scheme Boolean Equality for tree.

Eval compute in tree_beq t_1024 t_1025.
Eval compute in tree_eqb t_1024 t_1025.
