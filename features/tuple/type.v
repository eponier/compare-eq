From mathcomp Require Import all_ssreflect.

Inductive tuple A i := { l : list A; p : (length l == i) = true }.
