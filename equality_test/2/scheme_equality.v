Require Import type.

Scheme Equality for tree.

Eval vm_compute in tree_beq t0 t1.
Time Eval vm_compute in tree_beq t0 t0.
Time Eval vm_compute in tree_beq t0 t1.
