"PSTACK file for NEW PARSER
Copyright (C) 1988 Infocom, Inc.  All rights reserved."

<ZZPACKAGE "PSTACK">

<ENTRY ALLOCATE-PSTACK MAX-PSTACK-SIZE PUSH-PSTACK POP-PSTACK
       PEEK-PSTACK PSTACK FLUSH-PSTACK PSTACK-PTR
       CLEAR-PSTACK PSTACK-DATA PSTACK-EMPTY?>

<USE "NEWSTRUC">

<FILE-FLAGS ;MDL-ZIL? ZAP-TO-SOURCE-DIRECTORY?>

<MSETG MAX-PSTACK-SIZE 21 ;32>	;"STATE & DATA could be 11"

<NEWTYPE PSTACK TABLE>

<DEFMAC ALLOCATE-PSTACK () <ITABLE ,MAX-PSTACK-SIZE 0>>

<DEFMAC PSTACK-PTR ('S "OPT" 'NEW)
  <COND (<ASSIGNED? NEW>
	 <FORM ZPUT .S 0 .NEW>)
	(T
	 <CHTYPE [<FORM ZGET .S 0> FIX] ADECL>)>>

<DEFMAC PSTACK-EMPTY? ('PSTACK)
  <COND (<CHECK-VERSION? YZIP>
	 <FORM EQUAL? <- ,MAX-PSTACK-SIZE 1> <FORM PSTACK-PTR .PSTACK>>)
	(T
	 <FORM 0? <FORM PSTACK-PTR .PSTACK>>)>>

<DEFMAC CLEAR-PSTACK ('S)
  <COND (<CHECK-VERSION? YZIP>
	 <FORM PSTACK-PTR <CHTYPE [.S PSTACK] ADECL> <- ,MAX-PSTACK-SIZE 1>>)
	(T
	 <FORM PSTACK-PTR <CHTYPE [.S PSTACK] ADECL> 0>)>>

<DEFINE20 PRINT-PSTACK (S:PSTACK "OPT" (OUTCHAN:CHANNEL .OUTCHAN)
		      "AUX" (P <PSTACK-PTR .S>))
  <PRINT-MANY .OUTCHAN PRINC
	      "#PSTACK ["
	      .P
	      " [">
  <REPEAT ((D <ZREST .S 2>))
    <COND (<L=? .P 0> <RETURN>)>
    <PRIN1 <ZGET .D 0>>
    <PRINC " ">
    <SET D <ZREST .D 2>>
    <SET P <- .P 1>>>
  <PRINC "]]">>

<COND (<CHECK-VERSION? YZIP>
       <DEFMAC PUSH-PSTACK ('S 'OBJ) <FORM XPUSH .OBJ .S>>)
      (T
<GLOBAL PSTACK-WARN:NUMBER 20>
<ROUTINE PUSH-PSTACK (S:PSTACK OBJ "AUX" TMP)
  <SET TMP <+ 1 <PSTACK-PTR .S>>>
  <COND (<L=? ,MAX-PSTACK-SIZE .TMP>
	 <P-NO-MEM-ROUTINE>
	 <RFALSE>)
	(<L? ,PSTACK-WARN .TMP>
	 <SETG PSTACK-WARN .TMP>
	 <PRINTI "[PSTACK: ">
	 <PRINTN <- ,MAX-PSTACK-SIZE .TMP>>
	 <PRINTI " left!]|">)>
  <PSTACK-PTR .S .TMP>
  <ZPUT .S .TMP .OBJ>
  .S>)>

<COND (<CHECK-VERSION? YZIP>
       <DEFMAC FLUSH-PSTACK ('S "OPT" ('N 1))
	       <FORM FSTACK .N .S>>)
      (T
<ROUTINE FLUSH-PSTACK (S:PSTACK "OPT" (N:FIX 1))
	<COND (<G? 0 <SET N <- <PSTACK-PTR .S> .N>>>
	       <SET N 0>)>
	<PSTACK-PTR .S .N>
	.S>)>

<COND (<CHECK-VERSION? YZIP>
       <DEFMAC POP-PSTACK ('S "OPT" ('N 1))
	       <COND (<1? .N>
		      <FORM POP .S>)
		     (T
		      <FORM FSTACK .N .S>)>>)
      (T
<ROUTINE POP-PSTACK (S:PSTACK "OPT" (N:FIX 1) "AUX" (OBJ <PEEK-PSTACK .S>))
  <COND (<NOT <0? .N>>
	 <FLUSH-PSTACK .S .N>)>
  .OBJ>)>

<COND (<CHECK-VERSION? YZIP>
       <ROUTINE PEEK-PSTACK (S:PSTACK "OPT" (OFFS:FIX 0) "AUX" (N 0) VAL)
	       <REPEAT ()
		       <SET VAL <POP-PSTACK .S>>
		       <PUSH .VAL>
		       <INC N>
		       <COND (<DLESS? OFFS 0>
			      <RETURN>)>>
	       <REPEAT ()
		       <COND (<DLESS? N 0>
			      <RETURN>)
			     (T
			      <PUSH-PSTACK .S <POP>>)>>
	       .VAL>)
      (T
       <ROUTINE PEEK-PSTACK (S:PSTACK "OPT" (OFFS:FIX 0))
	       <ZGET .S <- <PSTACK-PTR .S> .OFFS>>>)>

<ENDPACKAGE>
