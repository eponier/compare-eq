We compare different tools to automatically generate equality tests and proofs.
We compare both the performance of the tools, especially on large inductives,
and the features they support (indices, dependent types, ...).

* Installation procedure

Here are the commands that can be used to install the tools, using opam.

```
opam switch create coq.8.16 --empty
eval $(opam env --switch=coq.8.16)
opam repo add coq-released https://coq.inria.fr/opam/released
opam switch set-invariant --formula='["coq" {>= "8.16" & < "8.17.0~"}]'
opam upgrade
opam pin add https://github.com/LPCIC/coq-elpi.git#fast-eqb
opam install coq-deriving coq-equations
```
