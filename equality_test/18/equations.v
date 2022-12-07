From Equations Require Import Equations.

Require Import type.

Derive NoConfusion EqDec for tree.

Eval vm_compute in tree_eqdec t0 t1.
Time Eval vm_compute in tree_eqdec t0 t0.
Time Eval vm_compute in tree_eqdec t0 t1.
