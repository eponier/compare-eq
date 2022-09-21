From Equations Require Import Equations.

Section sum.

Variable (L R : Set) (L_eqdec : EqDec L) (R_eqdec : EqDec R).

Inductive sum : Type :=
| inl : L -> sum| inr : R -> sum.

Equations Derive NoConfusion EqDec for sum.

End sum.

Succeed Check sum_eqdec.
