Inductive sum (L R : Type) : Type :=
| inl : L -> sum L R | inr : R -> sum L R.
