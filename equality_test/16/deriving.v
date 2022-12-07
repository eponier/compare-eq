From mathcomp Require Import ssreflect ssrnat ssrbool eqtype.
From deriving Require Import deriving.

Require Import type.

Time Definition tree_indDef := [indDef for tree_rect].
Canonical tree_indType := IndType tree tree_indDef.

Module nored.

(* see https://github.com/arthuraa/deriving#simplification-and-performance-issues *)
Definition tree_eqMixin : Equality.mixin_of tree.
Proof. Time exact [derive nored eqMixin for tree]. Time Defined. (* -> does not reduce with QED *)

Canonical tree_eqType := EqType tree tree_eqMixin.

Eval vm_compute in t0 == t1.
Time Eval vm_compute in t0 == t0.
Time Eval vm_compute in t0 == t1.

End nored.

Optimize Heap.

Module red.

Time Definition tree_eqMixin := [derive eqMixin for tree].
Canonical tree_eqType := EqType tree tree_eqMixin.

Eval vm_compute in t0 == t1.
Time Eval vm_compute in t0 == t0.
Time Eval vm_compute in t0 == t1.

End red.
