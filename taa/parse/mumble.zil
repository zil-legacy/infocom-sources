<SETG ZDEBUGGING? T>
<SETG EXPAND? T>
<DEFINE DEBUG-CODE ('X "OPTIONAL" ('Y T))
	<COND (,ZDEBUGGING? .X) (ELSE .Y)>>

<SETG NEW-PARSER? T>
<LONG-WORDS?>

<VERSION EZIP>
<SETG PLUS-MODE T>

<COND (<GASSIGNED? PREDGEN>
       <PRINC "Compiling">
       <ID 0>)
      (T <PRINC "Loading">)>

<PRINC " MILLIWAYS: interactive fiction from Infocom!
">

ON!-INITIAL	"for DEBUGR"
OFF!-INITIAL
ENABLE!-INITIAL
DISABLE!-INITIAL

<SET REDEFINE T>

<OR <GASSIGNED? ZILCH>
    <SETG WBREAKS <STRING !\" !,WBREAKS>>>

<DIRECTIONS NORTH NE EAST SE SOUTH SW WEST NW UP DOWN IN OUT>

<INSERT-FILE "<TAA.PARSE>PSTACK" T>
<INSERT-FILE "<TAA.PARSE>PMEM" T>
<INSERT-FILE "<TAA.PARSE>PARSERDEFS" T>
<INSERT-FILE "<H2>MACROS" T>

<INCLUDE "BASEDEFS" "PARSERDEFS" "PARSER-BITDEFS">

<USE "PSTACK" "PMEM">

<FILE-FLAGS MDL-ZIL?>

<DEFINE RED-NPP RED (N:FIX TYP:FIX
		     "AUX" (S:PSTACK <DATA-STACK>)
			   NPP:PMEM ONPP:PMEM PP:PMEM NP (RLOC <>) CONJ)
  <COND (<==? .N 1>
	 ;"Just an NP, so nothing interesting to do"
	 <POP-PSTACK .S>)
	(<==? .N 2>
	 ; "NP/NPP followed by PP"
	 <SET PP <POP-PSTACK .S>>
	 <SET ONPP <POP-PSTACK .S>>
	 <COND (<OR <==? <PP-PREP .PP> <FIND-WORD "BUT">>
		    <==? <PP-PREP .PP> <FIND-WORD "EXCEPT">>>
		; "An exception, which isn't the same as a location"
		<COND
		 (<PMEM-TYPE? .ONPP NP>
		  ; "Can't have exceptions to an NPP"
		  <COND
		   (<NP-QUANT .ONPP>
		    ; "Doesn't make much sense otherwise"
		    <COND (<NOT <REDUCE-EXCEPTION .PP .ONPP>>
			   ; "Try to make sense of it"
			   <RETURN <> .RED>)>)
		   (T
		    <RETURN <PARSER-ERROR
			     "Only one object specified in noun phrase.">
			    .RED>)>)
		 (T
		  <RETURN <PARSER-ERROR "Too hard to understand"> .RED>)>)
	       (<NOT <SET RLOC <REDUCE-LOCATION .PP>>>
		; "Died, set up orphaning and severity"
		<RETURN <> .RED>)>
	 <COND (<NOT .RLOC> .ONPP)
	       (<PMEM-TYPE? .ONPP NP>
		; "We have NP (disguised as NPP) followed by PP,
		   so glue them together"
		<COND (<NP-LOC .ONPP>
		       <PARSER-ERROR "Two locations in noun phrase">)
		      (T
		       <NP-LOC .ONPP .RLOC>
		       .ONPP)>)
	       (T
		; "We have NPP followed by PP; NPP is only produced
		   by NP CONJ NP"
		<REPEAT ((OONPP:<OR PMEM FALSE> .ONPP) NP:PMEM)
			<COND (<NP-LOC <SET NP <NPP-NOUN .OONPP>>>
			       <RETURN
				<PARSER-ERROR "two locations in noun phrase">
				.RED>)
			      (T
			       <NP-LOC .NP .RLOC>)>
			<COND (<NOT <SET OONPP <NPP-NEXT .OONPP>>>
			       <RETURN .ONPP .RED>)>
			<COND (<PMEM-TYPE? .OONPP NP>
			       <NP-LOC .OONPP .RLOC>
			       <RETURN .ONPP .RED>)>>)>)
	(T
	 ; "Case of NPP AND NP"
	 <SET NP <POP-PSTACK .S>>
	 <COND (<OR <==? <SET CONJ <POP-PSTACK .S>> <FIND-WORD "AND">>
		    <==? .CONJ <FIND-WORD "OR">>
		    <==? .CONJ <FIND-WORD "COMMA">>>
		<COND (<AND <PMEM-TYPE? <SET NPP <POP-PSTACK .S>> NP>
			    <NP-EXCEPT .NPP>>
		       ; "Prefer all (but foo and bar) over
			  (all but foo) and bar..."
		       <RETURN <> .RED>)>
		<SET NP <PMEM-ALLOC NPP NOUN .NP>>
		<COND (<PMEM-TYPE? .NPP NP>
		       <PMEM-ALLOC NPP NEXT .NP
				   NOUN .NPP>)
		      (T
		       <REPEAT ((NN:PMEM .NPP) TEMP:<OR FALSE PMEM>)
		         <COND (<NOT <SET TEMP <NPP-NEXT .NN>>>
				<NPP-NEXT .NN .NP>
				<RETURN>)>
			 <SET NN .TEMP>>
		       .NPP)>)>)>>
