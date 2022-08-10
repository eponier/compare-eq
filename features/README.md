We check what features of inductive types are supported by our approach and the alternatives.
- Type parameter: a parameter in Type (typically a container)
- Value parameter: a parameter that is not in Type
- Recursive type: a recursive occurrence in some constructor
- Nested type: another inductive (typically a container) applied to the inductive in some constructor
- Mutual inductive: the inductive is mutual
- Index: the inductive has an index
- Dependent type: a dependent type in some constructor
- Record: the type is defined using `Record`

|                 | Type parameter                     | Value parameter                    | Recursive type | Nested type                | Mutual inductive            | Index | Dependent type               | Record |
| --------------- |:----------------------------------:|:----------------------------------:|:--------------:|:--------------------------:|:---------------------------:|:-----:|:----------------------------:|:------:|
| Scheme Equality | yes                                | partial (using a section variable) | yes            | no                         | no                          | no    | no                           | yes    |
| decide equality | yes                                | yes                                | yes            | partial (manual induction) | partial (manual induction)  | no    | no                           | yes    |
| Equations       | partial (using a section variable) | yes                                | no             | no                         | no                          | no    | no                           | yes    |
| Deriving        | yes                                | yes                                | yes            | partial (manual induction) | yes (using Combined Scheme) | no    | no                           | yes    |
| Elpi Derive     | yes                                | no                                 | yes            | yes                        | no (limitation of coq-elpi) | no    | no                           | yes    |
| Elpi fast_eqb   | yes                                | yes                                | yes            | yes                        | no (limitation of coq-elpi) | no    | limited (boolean equalities) | yes    |
