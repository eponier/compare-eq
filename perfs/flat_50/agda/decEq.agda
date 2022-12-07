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
    C10 : t
    C11 : t
    C12 : t
    C13 : t
    C14 : t
    C15 : t
    C16 : t
    C17 : t
    C18 : t
    C19 : t
    C20 : t
    C21 : t
    C22 : t
    C23 : t
    C24 : t
    C25 : t
    C26 : t
    C27 : t
    C28 : t
    C29 : t
    C30 : t
    C31 : t
    C32 : t
    C33 : t
    C34 : t
    C35 : t
    C36 : t
    C37 : t
    C38 : t
    C39 : t
    C40 : t
    C41 : t
    C42 : t
    C43 : t
    C44 : t
    C45 : t
    C46 : t
    C47 : t
    C48 : t
    C49 : t

  instance tD : HasDesc t
           tD = deriveDesc t

  instance tDec : DecEq t
           tDec = deriveDecEq tD
