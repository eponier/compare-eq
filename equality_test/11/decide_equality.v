Require Import type.

Definition dec_eq : forall (x y : tree), {x=y} + {x<>y}.
Proof. decide equality. decide equality. Defined.

Eval vm_compute in if dec_eq t0 t1 then true else false.
Time Eval vm_compute in if dec_eq t0 t0 then true else false.
Time Eval vm_compute in if dec_eq t0 t1 then true else false.
