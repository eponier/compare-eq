From elpi.apps Require Import derive.

Require Import type.

#[only(eqOK),verbose] derive stype.
#[only(eqOK),verbose] derive bool.
#[only(eqOK),verbose] derive Ascii.ascii.
#[only(eqOK),verbose] derive String.string.
#[only(eqOK),verbose] derive var.
#[only(eqOK),verbose] derive info.
#[only(eqOK),verbose] derive var_i.
#[only(eqOK),verbose] derive lval.
#[only(eqOK),verbose] derive assgn_tag.
#[only(eqOK),verbose] derive pexpr.
#[only(eqOK),verbose] derive list.
#[only(eqOK),verbose] derive sopn.
#[only(eqOK),verbose] derive syscall_t.
#[only(eqOK),verbose] derive prod.
#[only(eqOK),verbose] derive dir.
#[only(eqOK),verbose] derive align.
#[only(eqOK),verbose] derive iinfo.
#[only(eqOK),verbose] derive instr.

Succeed Check instr_eq_OK.
