From elpi.apps Require Import derive.

Require Import types.


Module Small.

Import Small.

Time #[only(eqOK)] derive t.

End Small.


Module Medium.

Import Medium.

Time #[only(eqOK)] derive t.

End Medium.


Module Large.

Import Large.

Time #[only(eqOK)] derive t.

End Large.


Module VeryLarge.

Import VeryLarge.

Time #[only(eqOK)] derive t.

End VeryLarge.