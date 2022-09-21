From elpi.apps Require Import feqb.

Require Import type.

Module Fail.

Elpi derive.param1 bool.
Elpi derive.param1 pred.
Elpi derive.param1 rel.
Elpi derive.param1 False.
Elpi derive.param1 not.
Elpi derive.param1 reflect.
Elpi derive.param1 eqtype.Equality.axiom.
Elpi derive.param1 eqtype.Equality.mixin_of.
Elpi derive.param1 eqtype.Equality.type.
Elpi derive.param1 eqtype.Equality.sort.
Elpi derive.param1 nat.
Elpi derive.param1 ssrnat.eqn.
Fail Elpi derive.param1 ssrnat.eqnP.

End Fail.

Inductive tuple A i := { l : list A; p : Nat.eqb (length l) i = true }.

feqb list.
feqb bool.
feqb nat.
Elpi derive.param1 Nat.eqb.
Elpi derive.param1 length.
Elpi derive.param1.trivial is_bool.
Fail feqb tuple. (* bug *)
