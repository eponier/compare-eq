From elpi.apps Require Import derive.

Require Import type.

(* Should we measure the time used to derive the dependencies? *)
#[only(eqOK)] derive nat.
#[only(eqOK)] derive bool.
#[only(eqOK),verbose] derive t.

Fail Check t_eq_OK.

Module M.

Section S.

Inductive dummy (n : nat) := C0 : bool -> dummy.

Variable (n:nat).

Inductive t := | C : dummy n -> t.

#[only(eqOK),verbose] derive dummy.
#[only(eqOK),verbose] derive t.

Fail Check t_eqOK.

End S.

End M.
