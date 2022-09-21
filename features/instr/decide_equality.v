Require Import type.

Fixpoint instr_eq_dec i1 : forall i2 : instr, {i1 = i2} + {i1 <> i2}.
Proof. repeat decide equality. Defined.
