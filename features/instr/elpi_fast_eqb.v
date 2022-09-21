From elpi.apps Require Import feqb.

Require Import type.

feqb stype.
feqb bool.
feqb Ascii.ascii.
feqb String.string.
feqb var.
feqb info.
feqb var_i.
feqb lval.
feqb assgn_tag.
feqb pexpr.
feqb list.
feqb sopn.
feqb syscall_t.
feqb prod.
feqb dir.
feqb align.
feqb iinfo.
feqb instr.

Succeed Check instr_eqb_correct.
Succeed Check instr_eqb_refl.
