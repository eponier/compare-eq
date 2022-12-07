From elpi.apps Require Import feqb.

Require Import type.

feqb nat.
feqb tree.

(* we run a first test that should be ignored, since there is some caching *)
Eval vm_compute in tree_eqb t0 t1.
Time Eval vm_compute in tree_eqb t0 t0.
Time Eval vm_compute in tree_eqb t0 t1.
