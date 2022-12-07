module decEq where

  open import Generics

  data t : Set where
    C0 : t
    C1 : t
    C2 : t
    C3 : t
    C4 : t
    C5 : t
    C6 : t
    C7 : t
    C8 : t
    C9 : t

  instance tD : HasDesc t
           tD = deriveDesc t

  instance tDec : DecEq t
           tDec = deriveDecEq tD
