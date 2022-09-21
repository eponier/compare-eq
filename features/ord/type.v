Inductive ord (m: nat) := mkOrd : forall n, n < m -> ord m.
