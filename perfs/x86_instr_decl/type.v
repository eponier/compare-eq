From mathcomp Require Import all_ssreflect all_algebra.

Variant wsize :=
  | U8
  | U16
  | U32
  | U64
  | U128
  | U256.

(* Size in bits of the elements of a vector. *)
Variant velem := VE8 | VE16 | VE32 | VE64.

(* x86_op *)
Variant t : Type :=
  (* Data transfert *)
| MOV    of wsize              (* copy *)
| MOVSX  of wsize & wsize      (* sign-extend *)
| MOVZX  of wsize & wsize      (* zero-extend *)
| CMOVcc of wsize              (* conditional copy *)

  (* Arithmetic *)
| ADD    of wsize                  (* add unsigned / signed *)
| SUB    of wsize                  (* sub unsigned / signed *)
| MUL    of wsize                  (* mul unsigned *)
| IMUL   of wsize                             (* mul signed with truncation *)
| IMULr  of wsize   (* oprd * oprd *)         (* mul signed with truncation *)
| IMULri of wsize   (* oprd * oprd * imm *)   (* mul signed with truncation *)

| DIV    of wsize                        (* div unsigned *)
| IDIV   of wsize                        (* div   signed *)
| CQO    of wsize                               (* CWD CDQ CQO: allows sign extention in many words *)
| ADC    of wsize                 (* add with carry *)
| SBB    of wsize                 (* sub with borrow *)

| NEG	   of wsize 	                      (* negation *)

| INC    of wsize                         (* increment *)
| DEC    of wsize                         (* decrement *)

| LZCNT  of wsize             (* number of leading zero *)
  (* Flag *)
| SETcc                           (* Set byte on condition *)
| BT     of wsize                  (* Bit test, sets result to CF *)
| CLC                          (* Clear CF *)
| STC                          (* Set CF *)

  (* Pointer arithmetic *)
| LEA    of wsize              (* Load Effective Address *)

  (* Comparison *)
| TEST   of wsize                  (* Bit-wise logical and CMP *)
| CMP    of wsize                  (* Signed sub CMP *)


  (* Bitwise logical instruction *)
| AND    of wsize  (* bit-wise and *)
| ANDN   of wsize  (* bit-wise andn *)
| OR     of wsize  (* bit-wise or  *)
| XOR    of wsize  (* bit-wise xor *)
| NOT    of wsize  (* bit-wise not *)

  (* Bit shifts *)
| ROR    of wsize    (* rotation / right *)
| ROL    of wsize    (* rotation / left  *)
| RCR    of wsize    (* rotation / right with carry *)
| RCL    of wsize    (* rotation / left  with carry *)
| SHL    of wsize    (* unsigned / left  *)
| SHR    of wsize    (* unsigned / right *)
| SAL    of wsize    (*   signed / left; synonym of SHL *)
| SAR    of wsize    (*   signed / right *)
| SHLD   of wsize    (* unsigned (double) / left *)
| SHRD   of wsize    (* unsigned (double) / right *)
| MULX    of wsize  (* mul unsigned, doesn't affect arithmetic flags *)
| ADCX    of wsize  (* add with carry flag, only writes carry flag *)
| ADOX    of wsize  (* add with overflow flag, only writes overflow flag *)

| BSWAP  of wsize                     (* byte swap *)
| POPCNT of wsize    (* Count bits set to 1 *)

| PEXT   of wsize    (* parallel bits extract *)

  (* MMX instructions *)
| MOVX  of wsize 
  (* SSE instructions *)
| MOVD     of wsize (* MOVD/MOVQ to wide registers *)
| MOVV     of wsize (* MOVD/MOVQ from wide registers *)
| VMOV     of wsize 
| VMOVDQU  `(wsize)
| VPMOVSX of velem & wsize & velem & wsize (* parallel sign-extension: sizes are source, source, target, target *)
| VPMOVZX of velem & wsize & velem & wsize (* parallel zero-extension: sizes are source, source, target, target *)
| VPAND    `(wsize)
| VPANDN   `(wsize)
| VPOR     `(wsize)
| VPXOR    `(wsize)
| VPADD    `(velem) `(wsize)
| VPSUB    `(velem) `(wsize)
| VPMULL   `(velem) `(wsize)
| VPMULH   `(velem) `(wsize)   (* signed multiplication of 16-bits*)
| VPMULHU  `(velem) `(wsize)
| VPMULHRS of velem & wsize (* Packed Multiply High with Round and Scale *)
| VPMULU   `(wsize)
| VPEXTR   `(wsize)
| VPINSR   `(velem)
| VPSLL    `(velem) `(wsize)
| VPSRL    `(velem) `(wsize)
| VPSRA    `(velem) `(wsize)
| VPSLLV   `(velem) `(wsize)
| VPSRLV   `(velem) `(wsize)
| VPSLLDQ  `(wsize)
| VPSRLDQ  `(wsize)
| VPSHUFB  `(wsize)
| VPSHUFD  `(wsize)
| VPSHUFHW `(wsize)
| VPSHUFLW `(wsize)
| VPBLEND  `(velem) `(wsize)
| VPBLENDVB `(wsize)
| VPACKUS  `(velem) `(wsize)
| VPACKSS  `(velem) `(wsize)
| VSHUFPS  `(wsize)
| VPBROADCAST of velem & wsize
| VMOVSHDUP of velem & wsize (* Replicate 32-bit (“single”) high values *)
| VMOVSLDUP of velem & wsize (* Replicate 32-bit (“single”) low values *)
| VPALIGNR  `(wsize)
| VBROADCASTI128
| VPUNPCKH `(velem) `(wsize)
| VPUNPCKL `(velem) `(wsize)
| VEXTRACTI128
| VINSERTI128
| VPERM2I128
| VPERMD
| VPERMQ
| VPMOVMSKB of wsize & wsize (* source size (U128/256) & dest. size (U32/64) *)
| VPCMPEQ of velem & wsize
| VPCMPGT of velem & wsize
| VPMADDUBSW of wsize
| VPMADDWD of wsize
| VMOVLPD   (* Store low 64-bits from XMM register *)
| VMOVHPD   (* Store high 64-bits from XMM register *)
| VPMINU of velem & wsize
| VPMINS of velem & wsize
| VPMAXU of velem & wsize
| VPMAXS of velem & wsize
| VPTEST `(wsize)

(* Monitoring *)
| RDTSC   of wsize
| RDTSCP  of wsize

(* AES instructions *)
| AESDEC
| VAESDEC
| AESDECLAST
| VAESDECLAST
| AESENC
| VAESENC
| AESENCLAST
| VAESENCLAST
| AESIMC
| VAESIMC
| AESKEYGENASSIST
| VAESKEYGENASSIST 
.
