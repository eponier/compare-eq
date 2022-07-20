We compare different tools to automatically generate equality tests and proofs.
We compare both the performance of the tools, especially on large inductives,
and the features they support (indices, dependent types, ...).

* Installation procedure

Here are the commands that I used to install the tools. It is more complicated
than it should be for the time being, as we rely on Coq 8.16 which has not been
released yet.

```
opam switch create coq.8.16 --empty
eval $(opam env --switch=coq.8.16)
opam repo add coq-released https://coq.inria.fr/opam/released
opam repo add coq-core-dev https://coq.inria.fr/opam/core-dev
opam repo add coq-extra-dev https://coq.inria.fr/opam/extra-dev
opam switch set-invariant --formula='["coq" {>= "8.16" & < "8.17.0~"}]'
opam upgrade
opam pin add https://github.com/LPCIC/coq-elpi.git#fast-eqb
opam install coq-deriving coq-equations
```
