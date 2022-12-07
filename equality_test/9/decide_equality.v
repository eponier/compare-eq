Require Import type.

Definition dec_eq : forall (x y : tree), {x=y} + {x<>y}.
Proof. decide equality. decide equality. Defined.

Eval compute in dec_eq t0 t1.
Time Eval compute in dec_eq t0 t0.
Time Eval compute in dec_eq t0 t1.
