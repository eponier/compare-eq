From Equations Require Import Equations.

Require Import type.

Derive NoConfusion EqDec for tree.

Eval vm_compute in if tree_eqdec t0 t1 then true else false.
Time Eval vm_compute in if tree_eqdec t0 t0 then true else false.
Time Eval vm_compute in if tree_eqdec t0 t1 then true else false.
