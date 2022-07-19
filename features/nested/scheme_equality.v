Require Import type.

Fail Scheme Equality for t.
(* Unsupported constructor with an argument whose type is a non-parametric inductive type. Type
"list" is applied to an argument which is not a variable. *)