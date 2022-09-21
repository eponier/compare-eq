Require Import type.

Lemma sum_eq_dec L R
  (L_eq_dec : forall l1 l2 : L, {l1=l2}+{l1<>l2})
  (R_eq_dec : forall r1 r2 : R, {r1=r2}+{r1<>r2}) :
  forall x1 x2 : sum L R, {x1 = x2} + {x1 <> x2}.
Proof. decide equality. Defined.
