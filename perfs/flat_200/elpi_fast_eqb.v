From elpi.apps Require Import derive.

Require Import type.

#[only(eqbcorrect),verbose] derive t.

Succeed Check t_eqb_correct.
Succeed Check t_eqb_refl.
