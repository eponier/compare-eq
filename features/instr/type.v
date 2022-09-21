Require Import PArith String.

(* All the types are simplified wrt the original ones in Jasmin *)
Variant stype := sbool.

Record var := Var {
  vtype: stype;
  vname : string
}.

Record var_i := VarI {
  v_var : var;
  v_info : positive
}.

Inductive lval := Lvar : var_i -> lval.
Notation lvals := (list lval).

Inductive assgn_tag := AT_none.

Inductive pexpr := Pbool : bool -> pexpr.
Notation pexprs := (list pexpr).

Inductive sopn := Onop.

Variant syscall_t := RandomBytes : positive -> syscall_t.

Variant dir := UpTo | DownTo.
Notation range := (dir * pexpr * pexpr)%type.

Variant align := | Align | NoAlign.

Variant iinfo := | InlineFun | DoNotInline.

Notation funname := positive.
Notation info := positive.

Reserved Notation "'cmd'".

Inductive instr :=
| Cassgn : lval -> assgn_tag -> stype -> pexpr -> instr
| Copn : lvals -> assgn_tag -> sopn -> pexprs -> instr
| Csyscall : lvals -> syscall_t -> pexprs -> instr
| Cif : pexpr -> cmd -> cmd -> instr
| Cfor : var_i -> range -> cmd -> instr
| Cwhile : align -> cmd -> pexpr -> cmd -> instr
| Ccall : iinfo -> lvals -> funname -> pexprs -> instr
where "'cmd'" := (list (info * instr)).
