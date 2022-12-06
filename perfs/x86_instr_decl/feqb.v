From elpi.apps Require Import feqb.

Require Import type.

feqb wsize.
feqb velem.
Time #[verbose] feqb t.

Succeed Check t_eqb_correct.
Succeed Check t_eqb_refl.
