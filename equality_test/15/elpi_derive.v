From elpi.apps Require Import derive.

Require Import type.

#[only(eqOK)] derive nat.
#[only(eqOK)] derive tree.

(* we run a first test that should be ignored, since there is some caching *)
Eval vm_compute in tree_eq t0 t1.
Time Eval vm_compute in tree_eq t0 t0.
Time Eval vm_compute in tree_eq t0 t1.
