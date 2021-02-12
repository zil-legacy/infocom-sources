<ZZPACKAGE "REDUCTIONS">

<ENTRY RED-FCN RED-S1 RED-S2 RED-S2A RED-S3 RED-S4 RED-S5 RED-S6 RED-S7
       RED-S7A RED-S7B
       RED-S3A RED-S8 RED-S9 RED-S10 RED-S11 RED-S12 RED-S13 RED-S14 RED-S15
       RED-NOUN-PHRASE-1 RED-NOUN-PHRASE-2 RED-NOUN-PHRASE-3 RED-ORPHAN-NOUN
       RED-NOUN-PHRASE-4 RED-NOUN-PHRASE-5 RED-NPP RED-PP RED-TOBE-PHRASE
       RED-S16 RED-ORPHAN-ADJ
       RED-PRONOUN RED-SP RED-PERS RED-ADJ* RED-PERS RED-VERB-PHRASE RED-CANDO
       RED-ORPHAN-LOC RED-ADV RED-DET RED-NOT RED-BE RED-POSSESSIVE>

<INCLUDE "BASEDEFS" "PARSERDEFS" "PARSER-BITDEFS" "FIND">

<USE "PSTACK" "NEWSTRUC" "PARSER" "PMEM">

<FILE-FLAGS MDL-ZIL?>

<DEFINE RED-ADV (N:FIX TYP:FIX)
  <COND (<0? .N> T)
	(T
	 <PARSE-ADV ,PARSE-RESULT <POP-PSTACK <DATA-STACK>>>
	 T)>>

"Generic reduction, just returns a list of frobs"
<DEFINE RED-FCN (N:FIX TYP:FIX "AUX" E)
	<DEBUG-CHECK <G? .N 1>
		     <ERROR TOO-MANY-ARGS-TO-REDUCTION!-ERRORS
			    RED-FCN>>
	<COND (<==? .N 0> T)
	      (T <POP-PSTACK <DATA-STACK>>)>>

<DEFINE RED-DET (N:FIX TYP:FIX "AUX" E)
  <COND (<0? .N> T)
	(T
	 <COND (<OR <==? <SET E <POP-PSTACK <DATA-STACK>>>
			 <FIND-WORD "THE">>
		    <==? .E <FIND-WORD "A">>
		    <==? .E <FIND-WORD "AN">>>
		.E)>)>>

<DEFINE RED-NOT (N:FIX TYP:FIX "AUX" E)
  <COND (<1? .N>
	 <COND (<==? <SET E <POP-PSTACK <DATA-STACK>>>
		     <FIND-WORD "NOT">>
		.E)>)
	(T T)>>

<DEFINE RED-BE (N:FIX TYP:FIX "AUX" E)
  <COND (<1? .N>
	 <COND (<==? <SET E <POP-PSTACK <DATA-STACK>>>
		     <FIND-WORD "BE">>
		.E)>)
	(T T)>>

<DEFINE GET-PARSE-VERB GPV (PR:PARSE-RESULT
			"AUX" (V <PARSE-VERB .PR>) (PART <PARSE-PARTICLE .PR>)
			      DATA:<OR VERB-DATA FALSE> PV:<OR FALSE TABLE>)
	<COND (<NOT <SET DATA <WORD-VERB-STUFF .V>>>
	       <COND (<WORD-SEMANTIC-STUFF .V>
		      <DEBUG-CHECK <NOT <TYPE? <WORD-SEMANTIC-STUFF .V> VWORD>>
				   <ERROR BAD-SYNONYM-FOR-VERB!-ERRORS .V>>
		      <COND (<NOT
			      <SET DATA <WORD-VERB-STUFF
					 <SET V <WORD-SEMANTIC-STUFF .V>>>>>
			     <RETURN <> .GPV>)>)>)>
	<COND (<AND .PART
		    <N==? .PART T>>
	       <COND (<SET PV <VERB-PARTICLES .DATA>>
		      <REPEAT ((LEN:FIX <ZGET .PV 0>))
		        <COND (<0? .LEN>
			       <RETURN
				<PARSER-ERROR "Particle doesn't match verb">
				.GPV>)>
			<COND (<==? <ZGET .PV <- .LEN 1>> .PART>
			       <SET V <ZGET .PV .LEN>>
			       <RETURN>)>
			<SET LEN <- .LEN 2>>>)>)>
	<PARSE-VERB .PR .V>
	<PARSE-PARTICLE .PR <>>
	.V>

<DEFINE GET-SYNTAX GS (VA:TABLE DATA:VERB-DATA PREP "AUX" NUM LEN)
  <COND (<==? .PREP 1>
	 <SET PREP <VERB-PREP .DATA>>)>
  <COND (<==? .VA <VERB-ONE .DATA>>
	 <SET NUM 1>
	 <SET LEN ,VERB-ONE-SYNTAX-LEN>)
	(T
	 <SET NUM 2>
	 <SET LEN ,VERB-TWO-SYNTAX-LEN>)>
  <REPEAT ((CT:FIX <ZGET .VA 0>) (SYN <IF-MUDDLE
				       <CHTYPE <ZREST .VA 2> VERB-SYNTAX>
				       <ZREST .VA 2>>))
    <COND (<==? .PREP
		<COND (<1? .NUM>
		       <SYNTAX-PREP .SYN 1>)
		      (T
		       <SYNTAX-PREP .SYN 2>)>>
	   <PARSE-SYNTAX ,PARSE-RESULT .SYN>
	   <PARSE-ACTION ,PARSE-RESULT <SYNTAX-ID .SYN>>
	   <RETURN .SYN .GS>)>
    <COND (<0? <SET CT <- .CT 1>>>
	   <RETURN <> .GS>)>
    <SET SYN <IF-MUDDLE <CHTYPE <ZREST .SYN .LEN> VERB-SYNTAX>
			<ZREST .SYN .LEN>>>>>

<DEFINE SETUP-POTENTIAL-ORPHAN ("OPT" A B C)
  <>>

"Reduction for case of verb with no objects.  If OK, win; otherwise,
 try defaulting (and go to case of verb with one object)/orphaning..."
<DEFINE RED-S1 (N:FIX TYP:FIX "AUX" (PR:PARSE-RESULT ,PARSE-RESULT)
		(S:PSTACK <DATA-STACK>) SYN
		VERB VA (PART <PEEK-PSTACK .S>) DATA:VERB-DATA OBJ)
    <COND (<SET VERB <GET-PARSE-VERB .PR>>
	   <SET DATA <WORD-VERB-STUFF .VERB>>
	   <COND (<G=? <VERB-ZERO .DATA>:FIX 0>
		  <PARSE-ACTION .PR <VERB-ZERO .DATA>>
		  ; "Verb can take no args, so this flies"
		  <FLUSH-PSTACK .S .N>
		  .PR)
		 (<SET VA <OR <VERB-ONE .DATA>
			      <VERB-TWO .DATA>>>
		  ; "One or two"
		  <COND (<AND <SET SYN <GET-SYNTAX .VA .DATA 1>>
			      <SET OBJ <DETERMINE-OBJ <> 1>>>
			 ; "Found an object"
			 <PUSH-PSTACK .S .OBJ>
			 <PUSH-PSTACK .S 0>
			 ; "Set it up, try next case"
			 <RED-S2 <+ .N 2> .TYP>)>)>)>>

<DEFINE RED-S2 (N:FIX TYP:FIX
		"AUX" (PR:PARSE-RESULT ,PARSE-RESULT)
		      (S:PSTACK <DATA-STACK>)
		      OBJ PART DATA:VERB-DATA OBJ2
		      SYN (VERB <PARSE-VERB .PR>))
	<COND (<==? .N 5>
	       ; "Toss the adverb..."
	       <FLUSH-PSTACK .S 1>)>
	<SET OBJ <POP-PSTACK .S>>
	<SET PART <POP-PSTACK .S>>
	<PARSE-PARTICLE .PR .PART>
	<FLUSH-PSTACK .S 2>
	<COND
	 (<SET VERB <GET-PARSE-VERB .PR>>
	  <SET DATA <WORD-VERB-STUFF .VERB>>
	  <COND (<VERB-ONE .DATA>
		 ; "Verb is happy with one argument"
		 <COND (<NOT <SET SYN <GET-SYNTAX <VERB-ONE .DATA> .DATA <>>>>
			<PARSER-ERROR "No syntax">)
		       (<SET OBJ <DETERMINE-OBJ .OBJ 1>>
			<PARSE-OBJ1 .PR .OBJ>
			.PR)>)
		(<VERB-TWO .DATA>
		 <COND (<NOT <SET SYN <GET-SYNTAX <VERB-TWO .DATA> .DATA 1>>>
			<PARSER-ERROR "No syntax">)
		       (<SET OBJ <DETERMINE-OBJ .OBJ 1>>
			<COND (<SET OBJ2
				    <DETERMINE-OBJ <> 2>>
			       <PUSH-PSTACK .S .VERB>
			       <PUSH-PSTACK .S .OBJ>
			       <PUSH-PSTACK .S .OBJ2>
			       <RED-S4 3 .TYP>)>)>)>)>>

<DEFINE RED-S2A (N:FIX TYP:FIX
		 "AUX" (S:PSTACK <DATA-STACK>)
		       (ADV <POP-PSTACK .S>) (PART <POP-PSTACK .S>)
		       (OBJ <POP-PSTACK .S>))
	; "Shuffle things so this looks like S2, then call it"
	<PUSH-PSTACK .S .PART>
	<PUSH-PSTACK .S .OBJ>
	<RED-S2 <- .N 1> .TYP>>

<DEFINE RED-S3 (N:FIX TYP:FIX
	        "AUX" (S:PSTACK <DATA-STACK>) (PR:PARSE-RESULT ,PARSE-RESULT)
		      OBJ (RLOC:PMEM <POP-PSTACK .S>) (N1:PMEM <POP-PSTACK .S>)
		      NV (PART <POP-PSTACK .S>) DATA:VERB-DATA VA SYN)
	<FLUSH-PSTACK .S <- .N 3>>
	<PARSE-PARTICLE .PR .PART>
	<COND
	 (<SET NV <GET-PARSE-VERB .PR>>
	  ; "Have a verb"
	  <SET DATA <WORD-VERB-STUFF .NV>>
	  <COND
	   (<NOT <SET VA <VERB-TWO .DATA>>>
	    ; "Verb can't take two arguments"
	    <PARSER-ERROR "Too many args to verb">)
	   (<NOT <SET SYN <GET-SYNTAX .VA .DATA <PP-PREP .RLOC>>>>
	    <PARSER-ERROR "No syntax">)
	   (<AND <SET RLOC <REDUCE-LOCATION .RLOC
				      .SYN 2>>
		 ; "Prep has to be something we can use as a second arg"
		 <SET OBJ <DETERMINE-OBJ .N1 1>>>
	    <PARSE-OBJ1 .PR .OBJ>
	    <PARSE-LOC .PR .RLOC>
	    <PARSE-OBJ2 .PR <LOCATION-OBJECT .RLOC>>
	    ;<COND (<AND <NOT <NP-QUANT .N1>>
			<G? <LENGTH <NP-OBJECTS .N1>> 1>>
		   <PARSE-ORPHAN-NOUN .PR T>
		   <PARSE-ORPHAN-ADJ .PR .N1>)>
	    <COND (<AND ;<NOT <NP-QUANT <SET N1 <LOC-OBJECT .RLOC>>>>
			;<G? <LENGTH <NP-OBJECTS .N1>> 1>
			<G? <NOUN-PHRASE-COUNT <LOCATION-OBJECT .RLOC>>:FIX 1>>
		   <PARSE-ORPHAN-LOC .PR T>
		   <OR <PARSE-ORPHAN-ADJ .PR>
		       <PARSE-ORPHAN-ADJ .PR .N1>>)>
	    .PR)>)>>

; "This is the other S3 case, so just shuffle things first..."
<DEFINE RED-S3A (N:FIX TYP:FIX
	        "AUX" (S:PSTACK <DATA-STACK>)
		      OBJ (RLOC <POP-PSTACK .S>) (PART <POP-PSTACK .S>)
		     (N1 <POP-PSTACK .S>) NV)
	<PUSH-PSTACK .S .PART>
	<PUSH-PSTACK .S .N1>
	<PUSH-PSTACK .S .RLOC>
	<RED-S3 .N .TYP>>

<DEFINE RED-S4A (N:FIX TYP:FIX
		 "AUX" (S:PSTACK <DATA-STACK>)
		       (OBJ2 <POP-PSTACK .S>) (PART <POP-PSTACK .S>)
		       (OBJ1 <POP-PSTACK .S>))
  <PUSH-PSTACK .S .PART>
  <PUSH-PSTACK .S .OBJ1>
  <PUSH-PSTACK .S .OBJ2>
  <RED-S4 .N .TYP>>

<DEFINE RED-S4 (N:FIX TYP:FIX
	        "AUX" (PR:PARSE-RESULT ,PARSE-RESULT)
		      (S:PSTACK <DATA-STACK>)
		      (N1 <POP-PSTACK .S>) (N2 <POP-PSTACK .S>) NV VA
		      OBJ1 OBJ2 SYN DATA:VERB-DATA)
	<FLUSH-PSTACK .S <- .N 3>>
	<COND
	 (<SET NV <GET-PARSE-VERB .PR>>
	  ; "Got the verb"
	  <SET DATA <WORD-VERB-STUFF .NV>>
	  <COND
	   (<NOT <SET VA <VERB-TWO .DATA>>>
	    ; "Can't do two args here"
	    <PARSER-ERROR "Too many args to verb">)
	   (<NOT <SET SYN <GET-SYNTAX .VA .DATA <>>>>
	    <PARSER-ERROR "No syntax">)
	   (<AND <SET OBJ2 <DETERMINE-OBJ .N2 2>>
		 <SET OBJ1 <DETERMINE-OBJ .N1 1>>>
	    <PARSE-OBJ1 .PR .OBJ1>
	    <PARSE-OBJ2 .PR .OBJ2>)>)
	 (T
	  <PARSER-ERROR "No verb">)>>

<DEFINE RED-S5 (N:FIX TYP:FIX "AUX" V
		(PR:PARSE-RESULT ,PARSE-RESULT)
		(S:PSTACK <DATA-STACK>))
	<PARSE-VERB .PR <SET V <FIND-WORD "WALK">>>
	<GET-SYNTAX <VERB-ONE <WORD-VERB-STUFF .V>:VERB-DATA>
		    <WORD-VERB-STUFF .V>
		    <>>
	<SET V <POP-PSTACK .S>>
	<SETG PRSO <SETG P-WALK-DIR <WORD-DIR-ID .V>>>
	<FLUSH-PSTACK .S <- .N 1>>
	.PR>

;<DEFINE RED-S6 (PR:PARSE-RESULT S:PSTACK N:FIX TYP:FIX
		"AUX" (VERB <PARSE-VERB .PR>) (VD <WORD-VERB-STUFF .VERB>)
		      (L <>) WF)
	<FLUSH-PSTACK .S 2>
	<SET L <FIND-OBJECTS <1 <VERB-SEARCH-FLAGS .VD>>
			     <1 <VERB-OBJECT-FLAGS .VD>>>>
	<COND (<AND <==? <ANDB <SET WF <WORD-FLAGS .VERB>> ,DONT-ORPHAN> 0>
		    <OR <==? <ANDB .WF ,DEFAULT-OBJECT> 0>
			<N==? <LENGTH .L> 1>>>
	       <PRINT-MANY .OUTCHAN PRINC "What do you wish to "
			   <CHTYPE <WORD-LEXICAL-WORD .VERB> STRING> "?"
			   PRMANY-CRLF>
	       <PARSE-ORPHAN-NOUN .PR T>)
	      (.L
	       <PRINT-MANY .OUTCHAN PRINC "[" <OBJECT-DESC <1 .L>> "]">
	       <PARSE-OBJ1 .PR <1 .L>>)>
	.PR>

;<DEFINE RED-S7 (PR:PARSE-RESULT S:PSTACK N:FIX TYP:FIX "AUX" TEM)
	<FLUSH-PSTACK .S 1>
	<SET TEM <RED-S-7-C .PR <POP-PSTACK .S> <POP-PSTACK .S>>>
	<FLUSH-PSTACK .S 2>
	.TEM>

;<DEFINE RED-S7B (PR:PARSE-RESULT S:PSTACK N:FIX TYP:FIX "AUX" X)
	<FLUSH-PSTACK .S 1>
	<SET X <POP-PSTACK .S>>
	<SET X <RED-S-7-C .PR <POP-PSTACK .S> .X>>
	<FLUSH-PSTACK .S 2>
	.X>

<DEFINE RED-S-7-C (PR:PARSE-RESULT N1 PART "AUX" NV L)
	<COND (<AND <SET NV <GET-PARSE-VERB .PR>>
		    <SET L <DETERMINE-OBJ .N1 1>>>
	       <PARSE-OBJ1 .PR .L>
	       .PR)>>

<DEFINE RED-S7A (N:FIX TYP:FIX "AUX" N1
		 (S:PSTACK <DATA-STACK>) (PR:PARSE-RESULT ,PARSE-RESULT)
		 (ADV <POP-PSTACK .S>) (PP:PMEM <POP-PSTACK .S>)
		 VERB CAN? DATA (RES <>) SYN)
	<SET VERB <PARSE-VERB .PR>>
	<FLUSH-PSTACK .S 1>
	<SET CAN? <POP-PSTACK .S>>
	<COND (<COMPARE-WORD-TYPES <WORD-CLASSIFICATION-NUMBER <PP-PREP .PP>>
				   <GET-CLASSIFICATION PARTICLE>>
	       <PUSH-PSTACK .S .CAN?>
	       <PUSH-PSTACK .S .VERB>
	       <PUSH-PSTACK .S <PP-PREP .PP>>	; "Fake the particle"
	       <PUSH-PSTACK .S <PP-NOUN .PP>>
	       <PUSH-PSTACK .S .ADV>
	       ; "Start by trying this as a particle/noun phrase instead of a
		  prepositional phrase.  If it returns non-false, give up."
	       <SET RES <RED-S2 5 .TYP>>)>
	<COND (<NOT .RES>
	       <COND
		(<AND <SET DATA <VERB-ONE <WORD-VERB-STUFF .VERB>:VERB-DATA>>
		      <SET SYN <GET-SYNTAX .DATA <WORD-VERB-STUFF .VERB> 
					   <PP-PREP .PP>>>>
		 <COND (<SET N1 <REDUCE-LOCATION .PP .SYN 1>>
			<PARSE-LOC .PR .N1>)>)>)
	      (T
	       .RES)>
	;<COND (<TYPE? <SET N1 <HACK-PREP <POP-PSTACK .S> .PR>> LOCATION>
	       <PARSE-LOC .PR .N1>
	       <FLUSH-PSTACK .S 2>
	       <COND (<AND <NOT <NP-QUANT <SET N1 <LOCATION-OBJECT .N1>>>>
			   <G? <LENGTH <NP-OBJECTS .N1>> 1>>
		      <PARSE-ORPHAN-ADJ .PR .N1>
		      <PARSE-ORPHAN-LOC .PR T>)>
	       .PR)>>

;<DEFINE RED-S8 (PR:PARSE-RESULT S:PSTACK N:FIX TYP:FIX
		"AUX" (ADJ <POP-PSTACK .S>) TMP N1 (VERB <PARSE-VERB .PR>))
	<COND (<COND (<N==? <ANDB <WORD-FLAGS .VERB> ,FUTURE-TENSE> 0>
		      <N==? <POP-PSTACK .S> T>)
		     (<==? <POP-PSTACK .S> T>)>
	       <PARSE-ADJ .PR .ADJ>
	       <COND (<N==? <POP-PSTACK .S> 0>
		      <PARSE-FLAGS .PR <ORB <PARSE-FLAGS .PR> ,PARSE-NOT>>)>
	       <COND (<AND <NOT <NP-QUANT <SET N1 <POP-PSTACK .S>>>>
			   <G? <LENGTH <NP-OBJECTS .N1>> 1>>
		      <PARSE-ORPHAN-ADJ .PR .N1>
		      <PARSE-ORPHAN-NOUN .PR T>)>
	       <PARSE-OBJ1 .PR .N1>
	       <FLUSH-PSTACK .S 1>
	       <PARSE-QW .PR <COND (<N==? <SET TMP <POP-PSTACK .S>> 0> .TMP)>>
	       <PARSE-FLAGS .PR <ORB <PARSE-FLAGS .PR> ,PARSE-QUESTION>>
	       .PR)>>

;<DEFINE RED-S9 (PR:PARSE-RESULT S:PSTACK N:FIX TYP:FIX
		"AUX" (NOUN <POP-PSTACK .S>) TMP N1 QW (VERB <PARSE-VERB .PR>))
	<COND (<COND (<N==? <ANDB <WORD-FLAGS .VERB> ,FUTURE-TENSE> 0>
		      <N==? <POP-PSTACK .S> T>)
		     (<==? <POP-PSTACK .S> T>)>
	       <COND (<N==? <POP-PSTACK .S> T>
		      <PARSE-FLAGS .PR <ORB <PARSE-FLAGS .PR> ,PARSE-NOT>>)>
	       <SET N1 <POP-PSTACK .S>>
	       <FLUSH-PSTACK .S 1>
	       <SET QW <POP-PSTACK .S>>
	       <COND (<NOT <AND <N==? .QW T>
				<==? <NP-QUANT .N1> ,NP-QUANT-ALL>
				<NP-QUANT .TMP>>>
		      <PARSE-OBJ2 .PR .NOUN>
		      <COND (<AND <NOT <NP-QUANT .N1>>
				  <G? <LENGTH <NP-OBJECTS .N1>> 1>>
			     <PARSE-ORPHAN-ADJ .PR .N1>
			     <PARSE-ORPHAN-NOUN .PR T>)>
		      <PARSE-OBJ1 .PR .N1>
		      <PARSE-QW .PR <COND (<N==? .QW T> .QW)>>
		      <PARSE-FLAGS .PR <ORB <PARSE-FLAGS .PR> ,PARSE-QUESTION>>
		      .PR)>)>>

;<DEFINE RED-S10 (PR:PARSE-RESULT S:PSTACK N:FIX TYP:FIX
		 "AUX" N1 (VERB <PARSE-VERB .PR>))
	<COND (<COND (<N==? <ANDB <WORD-FLAGS .VERB> ,FUTURE-TENSE> 0>
		      <N==? <POP-PSTACK .S> T>)
		     (<==? <POP-PSTACK .S> T>)>
	       <COND (<N==? <POP-PSTACK .S> T>
		      <PARSE-FLAGS .PR <ORB <PARSE-FLAGS .PR> ,PARSE-NOT>>)>
	       <COND (<AND <NOT <NP-QUANT
				 <SET N1 <DETERMINE-OBJ
					  <POP-PSTACK .S> 1>>>>
			   <G? <LENGTH <NP-OBJECTS .N1>> 1>>
		      <PARSE-ORPHAN-ADJ .PR .N1>
		      <PARSE-ORPHAN-NOUN .PR T>)>
	       <PARSE-OBJ1 .PR .N1>
	       <FLUSH-PSTACK .S 1>
	       <PARSE-QW .PR <POP-PSTACK .S>>
	       <PARSE-FLAGS .PR <ORB <PARSE-FLAGS .PR> ,PARSE-QUESTION>>
	       .PR)>>

;<DEFINE RED-S11 (PR:PARSE-RESULT S:PSTACK N:FIX TYP:FIX
		 "AUX" TMP N1 (VERB <PARSE-VERB .PR>))
	<COND (<AND <TYPE? <SET TMP <POP-PSTACK .S>> LOCATION>
		    <COND (<N==? <ANDB <WORD-FLAGS .VERB> ,FUTURE-TENSE> 0>
			   <N==? <POP-PSTACK .S> T>)
			  (<==? <POP-PSTACK .S> T>)>>
	       <PARSE-LOC .PR .TMP>
	       <COND (<N==? <POP-PSTACK .S> 0>
		      <PARSE-FLAGS .PR <ORB <PARSE-FLAGS .PR> ,PARSE-NOT>>)>
	       <COND (<AND <NOT <NP-QUANT <SET N1 <POP-PSTACK .S>>>>
			   <G? <LENGTH <NP-OBJECTS .N1>> 1>>
		      <PARSE-ORPHAN-ADJ .PR .N1>
		      <PARSE-ORPHAN-NOUN .PR T>)>
	       <PARSE-OBJ1 .PR .N1>
	       <FLUSH-PSTACK .S 1>
	       <PARSE-QW .PR <COND (<N==? <SET TMP <POP-PSTACK .S>> 0> .TMP)>>
	       <PARSE-FLAGS .PR <ORB <PARSE-FLAGS .PR> ,PARSE-QUESTION>>
	       .PR)>>

;<DEFINE RED-S12 (PR:PARSE-RESULT S:PSTACK N:FIX TYP:FIX
		"AUX" (NOUN <POP-PSTACK .S>) TMP N1 QW
		      (VERB <PARSE-VERB .PR>))
	<COND (<COND (<N==? <ANDB <WORD-FLAGS .VERB> ,FUTURE-TENSE> 0>
		      <N==? <POP-PSTACK .S> T>)
		     (<==? <POP-PSTACK .S> T>)>
	       <COND (<N==? <POP-PSTACK .S> T>
		      <PARSE-FLAGS .PR <ORB <PARSE-FLAGS .PR> ,PARSE-NOT>>)>
	       <FLUSH-PSTACK .S 1>
	       <SET N1 <POP-PSTACK .S>>
	       <PARSE-OBJ2 .PR .NOUN>
	       <COND (<AND <NOT <NP-QUANT .N1>>
			   <G? <LENGTH <NP-OBJECTS .N1>> 1>>
		      <PARSE-ORPHAN-ADJ .PR .N1>
		      <PARSE-ORPHAN-NOUN .PR T>)>
	       <PARSE-OBJ1 .PR .N1>
	       .PR)>>

;<DEFINE RED-S13 (PR:PARSE-RESULT S:PSTACK N:FIX TYP:FIX
		"AUX" (ADJ <POP-PSTACK .S>) TMP N1 QW (VERB <PARSE-VERB .PR>))
	<COND (<COND (<N==? <ANDB <WORD-FLAGS .VERB> ,FUTURE-TENSE> 0>
		      <N==? <POP-PSTACK .S> T>)
		     (<==? <POP-PSTACK .S> T>)>
	       <COND (<N==? <POP-PSTACK .S> T>
		      <PARSE-FLAGS .PR <ORB <PARSE-FLAGS .PR> ,PARSE-NOT>>)>
	       <FLUSH-PSTACK .S 1>
	       <SET N1 <POP-PSTACK .S>>
	       <PARSE-ADJ .PR .ADJ>
	       <COND (<AND <NOT <NP-QUANT .N1>>
			   <G? <LENGTH <NP-OBJECTS .N1>> 1>>
		      <PARSE-ORPHAN-ADJ .PR .N1>
		      <PARSE-ORPHAN-NOUN .PR T>)>
	       <PARSE-OBJ1 .PR .N1>
	       .PR)>>

;<DEFINE RED-S14 (PR:PARSE-RESULT S:PSTACK N:FIX TYP:FIX
		 "AUX" TMP N1 (VERB <PARSE-VERB .PR>))
	<COND (<AND <TYPE? <SET TMP <POP-PSTACK .S>> LOCATION>
		    <COND (<N==? <ANDB <WORD-FLAGS .VERB> ,FUTURE-TENSE> 0>
			   <N==? <POP-PSTACK .S> T>)
			  (<==? <POP-PSTACK .S> T>)>>
	       <PARSE-LOC .PR .TMP>
	       <COND (<N==? <POP-PSTACK .S> T>
		      <PARSE-FLAGS .PR <ORB <PARSE-FLAGS .PR> ,PARSE-NOT>>)>
	       <COND (<AND <NOT <NP-QUANT <SET N1 <POP-PSTACK .S>>>>
			   <G? <LENGTH <NP-OBJECTS .N1>> 1>>
		      <PARSE-ORPHAN-ADJ .PR .N1>
		      <PARSE-ORPHAN-NOUN .PR T>)>
	       <FLUSH-PSTACK .S 1>
	       <PARSE-OBJ1 .PR .N1>
	       .PR)>>

;<DEFINE RED-S16 (PR:PARSE-RESULT S:PSTACK N:FIX TYP:FIX
		 "AUX" (OBJ <POP-PSTACK .S>) (PART <POP-PSTACK .S>)
		       (QWD <POP-PSTACK .S>))
	<COND (<AND <=? <CHTYPE <WORD-LEXICAL-WORD .PART> STRING> "ABOUT">
		    <=? <CHTYPE <WORD-LEXICAL-WORD .QWD> STRING> "WHAT">>
	       <PARSE-VERB .PR <FIND-WORD "WHAT_ABOUT">>
	       <COND (<SET OBJ <DETERMINE-OBJ .OBJ 1>>
		      <PARSE-OBJ1 .PR .OBJ>
		      .PR)>)>>

<DEFINE RED-SP (N:FIX TYP:FIX)
	<FLUSH-PSTACK <DATA-STACK> .N>
	<SETG ORPHAN-NOUN <SETG ORPHAN-LOC <SETG ORPHAN-ADJ <>>>>
	,PARSE-RESULT>



<DEFINE IREDUCE-EXCEPTION (ENP:PMEM NP:PMEM "AUX" PHRASE)
  ; "Both ENP and NP are NPs"
  <COND (<==? <NP-NAME .ENP> <FIND-WORD "ONE">>
	 ; "All books except the red one..."
	 <NP-NAME .ENP <NP-NAME .NP>>)>
  <COND (<NOT <NP-QUANT .ENP>>
	 <NP-QUANT .ENP ,NP-QUANT-ALL>)>
  <SEARCH-FLAGS %<ORB ,SEARCH-ALL ,SEARCH-MANY>>
  <DETERMINE-NP 0 0 .ENP>>

<DEFINE REDUCE-EXCEPTION RE (PP:PMEM NP:PMEM "AUX"
			  (ENP:PMEM <PP-NOUN .PP>) NOUN-PHRASE)
  <COND
   (<PMEM-TYPE? .ENP NP>
    ; "Just one thing"
    <COND (<SET NOUN-PHRASE <IREDUCE-EXCEPTION .ENP .NP>>
	   ; "Returns a noun-phrase, which we can then stuff into
	      an NPP to be stuffed into the EXCEPT slot"
	   <NP-EXCEPT .NP <PMEM-ALLOC NPP
				      NOUN .ENP
				      NOUN-PHRASE .NOUN-PHRASE>>
	   .NP)>)
   (T
    ; "NPP"
    <REPEAT (RES (NNP:<OR PMEM FALSE> .ENP))
      <COND (<SET RES <IREDUCE-EXCEPTION <NPP-NOUN .NNP> .NP>>
	     <NPP-NOUN-PHRASE .NNP .RES>)
	    (T
	     <RETURN <> .RE>)>
      <COND (<NOT <SET NNP <NPP-NEXT .NNP>>>
	     <NP-EXCEPT .NP .ENP>
	     <RETURN .NP .RE>)>>)>>

<SETG PREP-BIT <ITABLE 3>>
<GDECL (PREP-BIT) TABLE>

<DEFINE REDUCE-LOCATION RL (PP:PMEM
			    "OPT" (SYN:<OR FALSE VERB-SYNTAX> <>)
			    	  (WHICH:<OR FIX FALSE> <>)
			    "AUX" (SEARCH <COND (.SYN
						 <COND (<==? .WHICH 1>
							<SYNTAX-SEARCH .SYN 1>)
						       (T
							<SYNTAX-SEARCH .SYN
								       2>)>)>)
			    	  (TEST <COND (.SYN
					       <COND
						(<==? .WHICH 1>
						 <SYNTAX-FIND .SYN 1>)
						(T
						 <SYNTAX-FIND .SYN 2>)>)>)
				  (PREP:VWORD <PP-PREP .PP>)
			          (NP:PMEM <PP-NOUN .PP>) PHRASE (RLOC <>)
			          (SEARCH-RES <SEARCH-RES>) (OBJ <>)
			          (BIT 0) (MSG <>) "VALUE" <OR PMEM FALSE>)
  <COND (<NOT .SEARCH> <SET SEARCH %<ORB ,SEARCH-HELD ,SEARCH-ON-GROUND>>)>
  <COND (<NOT .TEST> <SET TEST ,TEST-PREP>)>
  <ZPUT ,PREP-BIT 0 0>
  <ZPUT ,PREP-BIT 1 0>
  <ZPUT ,PREP-BIT 2 0>
  <COND
   (<OR <==? .PREP <FIND-WORD "BUT">>
	<==? .PREP <FIND-WORD "EXCEPT">>>
    <RETURN <PARSER-ERROR "Can't use exception as location"> .RL>)
   ;(<==? .PREP <FIND-WORD "UNDER">>
	   <SET BIT ,F?HAS-UNDER>
	   <SET MSG "No underside">)
   (<==? .PREP <FIND-WORD "ABOUT">>)
   (<==? .PREP <FIND-WORD "FOR">>)
   (<==? .PREP <FIND-WORD "TO">>)
   (<OR <==? .PREP <FIND-WORD "IN">>
	<==? .PREP <FIND-WORD "INSIDE">>>
    <SET BIT ,CONTBIT>
    <SET MSG "No inside">)
   (<==? .PREP <FIND-WORD "ON">>
    <SET BIT ,SURFACEBIT>
    <SET MSG "No surface">)
   ;(<==? .PREP <FIND-WORD "BEHIND">>
     <SET BIT ,F?HAS-BEHIND>
     <SET MSG "No backside">)
   (<OR <==? .PREP <FIND-WORD "FROM">>
	<==? .PREP <FIND-WORD "OF">>>
    <SET BIT ,SURFACEBIT>
    <ZPUT ,PREP-BIT 1 ,ACTORBIT>
    <ZPUT ,PREP-BIT 2 ,CONTBIT>
    <SET MSG "Nothing">)
   (T
    <RETURN <> .RL>)>
  <ZPUT ,PREP-BIT 0 .BIT>
  <COND (<PMEM-TYPE? .NP NP>
	 <COND (<NP-LOC .NP>
		<SET RLOC <NOUN-PHRASE-OBJ1 <LOCATION-OBJECT
					    <NP-LOC .NP>:PMEM>:PMEM>>)>
	 <MAKE-FINDER 'FINDER <FINDER>
		      'FIND-APPLIC .TEST 'FIND-RES .SEARCH-RES
		      'FIND-ADJS <NP-ADJ* .NP> 'FIND-NOUN <NP-NAME .NP>>
	 <COND (<FIND-OBJECTS <COND (<NOT .RLOC> .SEARCH)
				    (T 0)>
			      .RLOC>
		<SET OBJ <FIND-RES-OBJ1 .SEARCH-RES>>)
	       (<0? <FIND-RES-COUNT .SEARCH-RES>:FIX>
		<RETURN <PARSER-ERROR "No object for location"
				      ,PARSER-ERROR-ARG-PMEM .NP> .RL>)
	       (T
		<RETURN <PARSER-ERROR "Too many objects for location"
				      ,PARSER-ERROR-ARG-PMEM .NP>
			.RL>)>)>
  <COND (.OBJ
	 <SET PHRASE <PMEM-ALLOC NOUN-PHRASE
				 COUNT 1
				 LENGTH ,NOUN-PHRASE-MIN-LENGTH
				 OBJ1 .OBJ
				 NP1 .NP>>
	 <SET RLOC <PMEM-ALLOC LOCATION PREP .PREP OBJECT .PHRASE>>)>>

<DEFINE DO-TEST-PREP DTP (OBJ:OBJECT VERB:VWORD "AUX" (PREP ,PREP-TO-TEST)
		      (BIT:TABLE ,PREP-BIT))
  <COND (<0? <ZGET .BIT 0>:FIX> T)
	(T
	 <REPEAT ((CT 0))
	   <COND (<FSET? .OBJ <ZGET .BIT .CT>:FIX> <RETURN T .DTP>)>
	   <COND (<OR <G? <SET CT <+ .CT 1>> 2>
		      <0? <ZGET .BIT .CT>:FIX>>
		  <RETURN <> .DTP>)>>)>>

<COND (<GASSIGNED? DO-TEST-PREP> <SETG TEST-PREP <TABLE ,DO-TEST-PREP>>)>

"Decide what object(s) OBJ refers to.  If OBJ is false, we're looking to
GWIM something.  Otherwise, it's one of NP, NPP, or NOUN-PHRASE.  In the
last case, just return it, because it's already been reduced."
<DEFINE DETERMINE-OBJ DO (OBJ:<OR FALSE PMEM> NUM:FIX
			  "AUX" (VAL <>) (SEARCH-RES <SEARCH-RES>) RES
			  (SYN:VERB-SYNTAX <PARSE-SYNTAX ,PARSE-RESULT>)
			  (SEARCH-FLAGS:FIX
			   <COND (<==? .NUM 1> <SYNTAX-SEARCH .SYN 1>)
				 (T
				  <SYNTAX-SEARCH .SYN 2>)>)
			  (SEARCH-ACT:FIX
			   <COND (<==? .NUM 1> <SYNTAX-FIND .SYN 1>)
				 (T <SYNTAX-FIND .SYN 2>)>)
			  (COUNT:FIX 0))
	<COND (<NOT .OBJ>
	       <MAKE-FINDER 'FINDER <FINDER>
			    'FIND-APPLIC .SEARCH-ACT
			    'FIND-FLAGS ,FIND-FLAGS-GWIM
			    'FIND-SYNTAX .SYN
			    'FIND-WHICH .NUM
			    'FIND-RES .SEARCH-RES>
	       <COND (<FIND-OBJECTS .SEARCH-FLAGS>
		      ; "Found one thing, so be happy"
		      <SET RES <PMEM-ALLOC NOUN-PHRASE
					   LENGTH ,NOUN-PHRASE-MIN-LENGTH
					   COUNT 1
					   FLAGS ,NP-FLAG-MULTI
					   OBJ1 <FIND-RES-OBJ1 .SEARCH-RES>
					   NP1 <>>>)
		     (T
		      ; "This will return an appropriate lossage so the
			 parser will know to continue."
		      <SETUP-POTENTIAL-ORPHAN <PARSE-VERB ,PARSE-RESULT>>)>)
	      (<PMEM-TYPE? .OBJ NOUN-PHRASE>
	       ; "Already a winner, so just return it"
	       <RETURN .OBJ .DO>)
	      (<PMEM-TYPE? .OBJ NP>
	       <SEARCH-FLAGS .SEARCH-FLAGS>
	       <DETERMINE-NP .SEARCH-ACT .NUM .OBJ>)
	      (<NOT <0? <ANDB .SEARCH-FLAGS ,SEARCH-MANY>>>
	       ; "Do each noun phrase in turn, since we can take multiple
		  objects"
	       <SEARCH-FLAGS .SEARCH-FLAGS>
	       <REPEAT ((NO .OBJ))
	         <COND (<DETERMINE-NP .SEARCH-ACT .NUM .NO>
			; "Remember how many objects we have"
			<SET COUNT <+ .COUNT
				      <NOUN-PHRASE-COUNT
				       <NPP-NOUN-PHRASE .NO:PMEM>:PMEM>>>
			<COND (<NOT <SET NO <NPP-NEXT .NO:PMEM>>> <RETURN>)>)
		       (T
			<RETURN <> .DO>)>>
	       ; "Build a single noun phrase"
	       <SET RES <PMEM-ALLOC NOUN-PHRASE
				    FLAGS ,NP-FLAG-MULTI
				    LENGTH <+ ,NOUN-PHRASE-MIN-LENGTH
					      <* .COUNT 2> -2>
				    COUNT .COUNT>>
	       ; "Copy everything into the single noun phrase"
	       <REPEAT ((NO .OBJ) (RR <REST-TO-SLOT .RES NOUN-PHRASE-OBJ1>)
			PHRASE)
	         <ZSUBSTRUC <REST-TO-SLOT
			     <SET PHRASE <NPP-NOUN-PHRASE .NO:PMEM>>:PMEM
			     NOUN-PHRASE-OBJ1>
			    <* <NOUN-PHRASE-COUNT .PHRASE:PMEM> 2>
			    .RR>
		 <SET RR <ZREST .RR <* 4 <NOUN-PHRASE-COUNT .PHRASE>:FIX>>>
		 <COND (<NOT <SET NO <NPP-NEXT .NO:PMEM>>> <RETURN>)>>
	       .RES)
	      (T
	       <PARSER-ERROR "Can't use multiple objects with"
			     ,PARSER-ERROR-ARG-VWORD
			     <PARSE-VERB ,PARSE-RESULT>>)>>

"Still needs to handle OF, orphaning..."
<DEFINE DETERMINE-NP DN (SEARCH-ACT:<OR FIX TABLE> WHICH:FIX OBJ:PMEM
			 "AUX" (SEARCH-FLAGS:FIX <SEARCH-FLAGS>)
			       (SYN:<OR VERB-SYNTAX FALSE>
				<COND (<0? .WHICH> <>)
				      (T <PARSE-SYNTAX ,PARSE-RESULT>)>)
			       (ROBJ:PMEM .OBJ) (RLOC:<OR FALSE PMEM> <>)
			       QUANT:<OR FIX FALSE> OWNER
			       (SEARCH-RES <SEARCH-RES>) (RES <>) COUNT:FIX)
  <COND (<PMEM-TYPE? .OBJ NPP>
	 <SET ROBJ <NPP-NOUN .OBJ>>)>
  <COND (<SET RLOC <NP-LOC .ROBJ>>
	 <SET RLOC <NOUN-PHRASE-OBJ1 <LOCATION-OBJECT .RLOC>:PMEM>>)>
  <COND (<SET OWNER <NP-OWNER .ROBJ>>
	 <COND (<NOT .RLOC>
		<SEARCH-FLAGS ,SEARCH-ALL>
		<ZPUT ,FIND-OWNER 1 ,ACTORBIT ;,PERSON>
		<ZPUT ,FIND-OWNER 2 ,CONTBIT>
		<COND (<SET OWNER <DETERMINE-NP ,FIND-OWNER 0 .OWNER>>
		       <SET RLOC <NOUN-PHRASE-OBJ1 .OWNER:PMEM>>)>)>)>
  <SET QUANT <NP-QUANT .ROBJ>>
  <COND (<AND .QUANT
	      <G? .QUANT ,NP-QUANT-A>
	      <0? <ANDB .SEARCH-FLAGS ,SEARCH-MANY>>>
	 <RETURN <PARSER-ERROR "Can't use multiple objects with" 
		      ,PARSER-ERROR-ARG-VWORD <PARSE-VERB ,PARSE-RESULT>> .DN>)
	(T
	 <MAKE-FINDER 'FINDER <FINDER>
		      'FIND-APPLIC .SEARCH-ACT 'FIND-QUANT .QUANT
		      'FIND-SYNTAX .SYN 'FIND-WHICH .WHICH
		      'FIND-RES .SEARCH-RES
		      'FIND-ADJS <NP-ADJ* .ROBJ> 'FIND-NOUN <NP-NAME .ROBJ>
		      'FIND-EXCEPTIONS <NP-EXCEPT .ROBJ>>
	 <FIND-OBJECTS .SEARCH-FLAGS .RLOC>
	 <COND (<0? <SET COUNT <FIND-RES-COUNT .SEARCH-RES>>>
		<SET RES <PMEM-ALLOC NOUN-PHRASE
				     LENGTH ,NOUN-PHRASE-MIN-LENGTH
				     COUNT 1
				     OBJ1 <>
				     NP1 .ROBJ>>)
	       (<OR <1? .COUNT>
		    .QUANT>
		<SET RES <PMEM-ALLOC NOUN-PHRASE
				     FLAGS <COND (.QUANT ,NP-FLAG-MULTI)
						 (T 0)>
				     LENGTH <+ <* .COUNT 2>
					       ,NOUN-PHRASE-MIN-LENGTH
					       -2>
				     COUNT .COUNT>>
		<REPEAT ((V <REST-TO-SLOT .SEARCH-RES FIND-RES-COUNT>)
			 (DV <REST-TO-SLOT .RES NOUN-PHRASE-OBJ1>))
		   <ZPUT .DV 0 <ZGET .V 0>>
		   <ZPUT .DV 1 .ROBJ>
		   <COND (<L? <SET COUNT <- .COUNT 1>> 1>
			  <RETURN>)>
		   <SET DV <ZREST .DV 4>>
		   <SET V <ZREST .V 2>>>
		.RES)
	       (T
		<SETUP-POTENTIAL-ORPHAN>)>)>
  <COND (<AND .RES <PMEM-TYPE? .OBJ NPP>>
	 <NPP-NOUN-PHRASE .OBJ .RES>)>
  .RES>

<CONSTANT FIND-OWNER:TABLE
	  <TABLE (LENGTH) 0 0>>



<DEFINE RED-PERS (N:FIX TYP:FIX "AUX" X:PMEM
		  (S:PSTACK <DATA-STACK>)
		  (SEARCH-RES:TABLE <SEARCH-RES>) NP) 
	<COND
	 (<==? .N 2>
	  <COND (<==? <POP-PSTACK .S> <FIND-WORD "COMMA">>
		 <SET X <POP-PSTACK .S>>
		 <PARSE-VERB ,PARSE-RESULT <FIND-WORD "TELL">>
		 ; "Of one object..."
		 <GET-SYNTAX <VERB-ONE
			      <WORD-VERB-STUFF <FIND-WORD "TELL">>:VERB-DATA>
			     <WORD-VERB-STUFF <FIND-WORD "TELL">>
			     <>>
		 <COND
		  (<SET NP <DETERMINE-OBJ .X 1>>
		   <PARSE-CHOMPER ,PARSE-RESULT
				  <NOUN-PHRASE-OBJ1 .NP>>
		   <COND (<0? <P-LEN>>
			  <P-CONT <>>)>
		   <COND (<PERFORM <PARSE-ACTION ,PARSE-RESULT>
				   <NOUN-PHRASE-OBJ1 .NP>>
			  <SETG WINNER <PARSE-CHOMPER ,PARSE-RESULT>>)>)>)>)
	 (ELSE T)>>

<DEFINE RED-TOBE-PHRASE (N:FIX TYP:FIX)
	<PARSE-VERB-LEXV ,PARSE-RESULT ,TLEXV>
	<PARSE-VERB ,PARSE-RESULT <POP-PSTACK <DATA-STACK>>>>

<DEFINE RED-VERB-PHRASE (N:FIX TYP:FIX
			 "AUX" (S:PSTACK <DATA-STACK>)
			       (PR:PARSE-RESULT ,PARSE-RESULT)
			       (A1 <POP-PSTACK .S>) (VERB <POP-PSTACK .S>)
			       (A2 <POP-PSTACK .S>))
	; "Just punt adverbs for now..."
	  <PARSE-VERB .PR .VERB>
	  <PARSE-VERB-LEXV .PR ,TLEXV>
	  <PARSE-ADV .PR <COND (<N==? .A1 T>
				<OR <WORD-SEMANTIC-STUFF .A1> .A1>)
			       (<N==? .A2 T>
				<OR <WORD-SEMANTIC-STUFF .A2> .A2>)>>
	  T>

"Basic NP reduction.  Doesn't do any checking at this level, just copies
 everything into a structure for later use."
<DEFINE RED-NOUN-PHRASE-1 (N:FIX TYP:FIX
			   "AUX" NP:PMEM
				 NAME DET (QUANT ,NP-QUANT-NONE)
				 (S:PSTACK <DATA-STACK>) ADJ)
  <COND (<NOT <0? <ANDB <WORD-FLAGS <SET NAME <POP-PSTACK .S>>> ,PLURAL-FLAG>>>
	 <SET QUANT ,NP-QUANT-PLURAL>
	 <SET NAME <WORD-SEMANTIC-STUFF .NAME>>)>
  <COND (<==? <SET ADJ <POP-PSTACK .S>> 1>
	 <SET ADJ <>>)>
  <SET NP <PMEM-ALLOC NP NAME .NAME ADJ* .ADJ>>
  <COND (<==? <SET DET <POP-PSTACK .S>> T>)
	(<OR <==? .DET <FIND-WORD "A">>
	     <==? .DET <FIND-WORD "AN">>
	     <==? .DET <FIND-WORD "ANY">>>
	 ; "Could be fascist and check for a previous QUANT-PLURAL here"
	 <SET QUANT ,NP-QUANT-A>)>
  <NP-QUANT .NP .QUANT>
  .NP>

"Reduction for FOO OF BARS"
<DEFINE RED-NOUN-PHRASE-2 (N:FIX TYP:FIX
			   "AUX" (S:PSTACK <DATA-STACK>)
				 (ONP:PMEM <POP-PSTACK .S>) NP:PMEM)
  <COND
   (<==? <POP-PSTACK .S> <FIND-WORD "OF">>
    <SET NP <POP-PSTACK .S>>
    <COND (<AND <NP-QUANT .NP>
		<NOT <NP-NAME .NP>>
		<NOT <NP-ADJ* .NP>>>
	   ; "This is ``ALL OF THE BOOKS'', so treat it just like ALL BOOKS"
	   <NP-QUANT .ONP <NP-QUANT .NP>>)
	  (T
	   <NP-OF .NP .ONP>)>
    .NP)>>

"Reduction for case of a quantity by itself"
<DEFINE RED-NOUN-PHRASE-3 (N:FIX TYP:FIX
			   "AUX" (Q <POP-PSTACK <DATA-STACK>>) NP)
  <PMEM-ALLOC NP QUANT <GET-QUANTITY .Q>>>

<DEFINE GET-QUANTITY (Q:VWORD)
  <COND (<==? .Q <FIND-WORD "ALL">>
	 ,NP-QUANT-ALL)
	(<==? .Q <FIND-WORD "BOTH">>
	 ,NP-QUANT-BOTH)
	(<OR <==? .Q <FIND-WORD "ANY">>
	     <==? .Q <FIND-WORD "ONE">>>
	 ,NP-QUANT-A)
	(<==? .Q <FIND-WORD "SOME">>
	 ,NP-QUANT-SOME)
	;(<==? .Q <FIND-WORD "NONE">>
	 ,NP-QUANT-NOTHING)>>

"Quantity followed by a noun phrase:  all red books"
<DEFINE RED-NOUN-PHRASE-4 (N:FIX TYP:FIX
			   "AUX" OQ (S:PSTACK <DATA-STACK>)
			   (NP:PMEM <POP-PSTACK .S>)
			   (Q <POP-PSTACK .S>))
  <COND (<AND <N==? <SET OQ <NP-QUANT .NP>> ,NP-QUANT-NONE>
	      <N==? .OQ ,NP-QUANT-PLURAL>>
	 <PARSER-ERROR "Don't understand two quantities for one noun phrase.">)
	(T
	 ; "We don't distinguish between ALL THE BOOKS and ALL THE BOOK..."
	 <NP-QUANT .NP <GET-QUANTITY .Q>>
	 .NP)>>

<DEFINE RED-NOUN-PHRASE-5 (N:FIX TYP:FIX
			   "AUX" (NP:PMEM <POP-PSTACK <DATA-STACK>>)
				 (PNP:PMEM <POP-PSTACK <DATA-STACK>>))
  <NP-OWNER .NP .PNP>
  .NP>

;<DEFINE RED-PRONOUN (PR:PARSE-RESULT S:PSTACK N:FIX TYP:FIX
		     "AUX" (PRON:VWORD <POP-PSTACK .S>) (PV <PARSE-VERB .PR>)
			   (VF <>) (PF <WORD-FLAGS .PRON>) (OBJ <>))
	<COND (<AND .PV <==? <WORD-CLASSIFICATION-NUMBER .PV>
			     <GET-CLASSIFICATION TOBE>>>
	       <SET VF <WORD-FLAGS .PV>>)>
	<COND (<N==? <ANDB .PF ,FIRST-PERSON-SINGULAR> 0>
	       <COND (<OR <NOT .VF> <N==? <ANDB .VF ,FIRST-PERSON-SINGULAR> 0>>
		      <SET OBJ <CHTYPE [<> (,WINNER!-OBJECTS)] NOUN-PHRASE>>)>)
	      (<N==? <ANDB .PF ,FIRST-PERSON-PLURAL> 0>
	       <COND (<OR <NOT .VF> <N==? <ANDB .VF ,FIRST-PERSON-PLURAL> 0>>
		      <SET OBJ <CHTYPE [,QUANT-STRUNG
					(,WINNER!-OBJECTS ,MACHINE!-OBJECTS)]
				       NOUN-PHRASE>>)>)
	      (<N==? <ANDB .PF ,SECOND-PERSON> 0>
	       <COND (<OR <NOT .VF> <N==? <ANDB .VF ,SECOND-PERSON> 0>>
		      <SET OBJ <CHTYPE [<> (<COND (<PARSE-CHOMPER .PR>)
						  (T ,MACHINE!-OBJECTS)>)]
				       NOUN-PHRASE>>)>)
	      (<N==? <ANDB .PF ,THIRD-PERSON-SINGULAR> 0>
	       <COND (<OR <NOT .VF>
			  <N==? <ANDB .VF ,THIRD-PERSON-SINGULAR> 0>>
		      <COND (<AND ,THING-PN <N==? <ANDB .PF ,THING-PNF> 0>>
			     <SET OBJ ,THING-PN>)
			    (<AND ,PERSON-PN <N==? <ANDB .PF ,PERSON-PNF> 0>>
			     <SET OBJ ,PERSON-PN>)>)>)
	      (<N==? <ANDB .PF ,THIRD-PERSON-PLURAL> 0>
	       <COND (<OR <NOT .VF>
			  <N==? <ANDB .VF ,THIRD-PERSON-PLURAL> 0>>
		      <COND (,THINGS-PN <SET OBJ ,THINGS-PN>)>)>)>
	.OBJ>

"Basic top-level noun phrase reduction"
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

<DEFINE RED-PP PP (N:FIX TYP:FIX
		"AUX" (S:PSTACK <DATA-STACK>)
		      (NOUN:PMEM <POP-PSTACK .S>) (PREP:<OR VWORD FALSE> <>))
  <COND (<==? .N 2>
	 <SET PREP <POP-PSTACK .S>>)
	(<==? <POP-PSTACK .S> <FIND-WORD "OF">>
	 <COND (<==? <SET PREP <POP-PSTACK .S>> <FIND-WORD "OUT">>
		<SET PREP <FIND-WORD "FROM">>)
	       (<NOT <COMPARE-WORD-TYPES <WORD-CLASSIFICATION-NUMBER .PREP>
					 <GET-CLASSIFICATION PREP>>>
		<RETURN
		 <PARSER-ERROR "Can't use particle as preposition"
			      ,PARSER-ERROR-ARG-VWORD .PREP> .PP>)>)>
  <COND (.PREP <PMEM-ALLOC PP PREP .PREP NOUN .NOUN>)>>

<DEFINE RED-POSSESSIVE RP (N:FIX TYP:FIX
			   "AUX" (S:PSTACK <DATA-STACK>))
  <COND (<==? .N 3>
	 <COND (<N==? <POP-PSTACK .S> <FIND-WORD "S">>
		<FLUSH-PSTACK .S 2>
		<RETURN <PARSER-ERROR "Don't understand contractions here">
			.RP>)>)>
  <COND (<N==? <POP-PSTACK .S> <FIND-WORD "APOSTROPHE">>
	 <FLUSH-PSTACK .S 1>
	 <RETURN <PARSER-ERROR "Don't understand at all"> .RP>)>
  <POP-PSTACK .S>>

<DEFINE RED-ADJ* (N:FIX TYP:FIX
		  "AUX" A1 A2 CT)
  ; "We die after four adjectives for now, since we don't have arbitrary
     storage allocation.  Other possibilities exist for the future..."
  <COND (<0? .N> 1)
	(T
	 <SET A2 <POP-PSTACK <DATA-STACK>>>
	 <COND (<==? <SET A1 <POP-PSTACK <DATA-STACK>>> 1>
		<SET A1 <PMEM-ALLOC ADJ*>>)>
	 <COND (<L? <SET CT <ADJ*-COUNT .A1:PMEM>>:FIX ,ADJ*-MAX-COUNT>
		; "Make sure the adjective isn't already here..."
		<REPEAT ((VV:<PRIMTYPE TABLE>
			  <REST-TO-SLOT .A1:PMEM ADJ*-COUNT 1>)
			 (TCT:FIX <ADJ*-COUNT .A1:PMEM>)
			 (AD <WORD-ADJ-ID .A2>))
		  <COND (<0? .TCT>
			 <ZPUT .VV 0 .A2>
			 <ADJ*-COUNT .A1 <+ .CT 1>>
			 <RETURN>)>
		  <COND (<==? .AD <WORD-ADJ-ID <ZGET .VV 0>>>
			 <RETURN>)>
		  <SET VV <ZREST .VV 2>>
		  <SET TCT <- .TCT 1>>>)>
	 .A1)>>

<DEFINE RED-CANDO (N:FIX TYP:FIX "AUX" TMP (NOTFL <>)
		   (S:PSTACK <DATA-STACK>) (PR:PARSE-RESULT ,PARSE-RESULT))
	<COND (<==? .N 0> T)
	      (<==? .N 1> <PARSE-SUBJ .PR <POP-PSTACK .S>>)
	      (ELSE
	       <COND (<N==? <POP-PSTACK .S> T> <SET NOTFL T>)>
	       <PARSE-SUBJ .PR <POP-PSTACK .S>>
	       <PARSE-QUERY .PR <NEGATE? <POP-PSTACK .S> .NOTFL>>
	       <PARSE-QW .PR <COND (<N==? <SET TMP <POP-PSTACK .S>> T> .TMP)>>
	       T)>>

;<DEFINE NEGATE? (X:VWORD NOT)
	<COND (.NOT
	       <CHTYPE [<TRANSFORM <WORD-LEXICAL-WORD .X>>
			<WORD-CLASSIFICATION-NUMBER .X>
			<WORD-FLAGS .X>
			<WORD-SEMANTIC-STUFF .X>] VWORD>)
	      (ELSE .X)>>

;<DEFINE TRANSFORM (X:STRING)
	<COND (<=? .X "CAN"> "CAN'T")
	      (<=? .X "DO"> "DON'T")
	      (<=? .X "DID"> "DIDN'T")
	      (<=? .X "DOES"> "DOESN'T")
	      (<=? .X "MAY"> "MAYN'T")
	      (<=? .X "CANN'T"> "CAN")
	      (<=? .X "DON'T"> "DO")
	      (<=? .X "DIDN'T"> "DID")
	      (<=? .X "DOESN'T"> "DOES")
	      (<=? .X "MAYN'T"> "MAY")>>

;"Try to handle orphans"

;<DEFINE RED-ORPHAN-NOUN (PR:PARSE-RESULT S:PSTACK N:FIX TYP:FIX "AUX" NP)
	<COND (<OR ,ORPHAN-NOUN ,ORPHAN-ADJ>
	       <SET NP <DETERMINE-OBJ <POP-PSTACK .S> 1>>
	       <COND (<G? <LENGTH <NP-OBJECTS .NP>> 1>
		      <COND (,ORPHAN-LOC <PARSE-ORPHAN-LOC ,ORPHAN-NOUN T>)>
		      <PARSE-ORPHAN-ADJ ,ORPHAN-NOUN .NP>
		      <PARSE-ORPHAN-NOUN ,ORPHAN-NOUN T>)
		     (,ORPHAN-LOC
		      <PRINT-MANY .OUTCHAN PRINC
				  "Where do you wish to "
				  <CHTYPE
				   <WORD-LEXICAL-WORD
				    <PARSE-VERB ,ORPHAN-NOUN>> STRING>
				  " " <OBJECT-DESC <1 <NP-OBJECTS .NP>>>
				  "?" PRMANY-CRLF>)>
	       .NP)>>

;<DEFINE RED-ORPHAN-LOC (PR:PARSE-RESULT S:PSTACK N:FIX TYP:FIX
			"AUX" (LOC <POP-PSTACK .S>) NP)
	<COND (,ORPHAN-LOC
	       <SET LOC <HACK-PREP .LOC ,ORPHAN-LOC>>
	       <SET NP <LOCATION-OBJECT .LOC>>
	       <PARSE-LOC ,ORPHAN-LOC .LOC>
	       <COND (<G? <LENGTH <NP-OBJECTS .NP>> 1>
		      <PARSE-ORPHAN-ADJ ,ORPHAN-LOC .NP>
		      <PARSE-ORPHAN-LOC ,ORPHAN-LOC T>)
		     (ELS
		      <PARSE-ORPHAN-LOC ,ORPHAN-LOC <>>)>
	       .LOC)>>

;<DEFINE RED-ORPHAN-ADJ (PR:PARSE-RESULT S:PSTACK N:FIX TYP:FIX
			"AUX" (L ()) ADJ (NOUN-P ,ORPHAN-ADJ))
	<COND (.NOUN-P
	       <REPEAT (ST)
		       <COND (<L? <SET N <- .N 1>> 0> <RETURN .L>)>
		       <SET ST <POP-PSTACK .S>>
		       <COND (<N==? .ST T> <SET L (.ST !.L)>)>>
	       <REAL-RED-O-A .L .NOUN-P T>)>>

;<DEFINE REAL-RED-O-A (ADJ:LIST NOUN-P:NOUN-PHRASE NOISY
		      "AUX" L (PR:PARSE-RESULT <OR ,ORPHAN-NOUN ,ORPHAN-LOC>))
	<SET L
	     <MAPF ,LIST
		   <FUNCTION (OBJ:OBJECT)
			<COND (<MAPF <>
				     <FUNCTION (ADJ:VWORD)
					  <COND (<NOT
						  <CHECK-ADJ .ADJ .OBJ .PR>>
						 <MAPLEAVE <>>)
						(ELSE T)>>
				     .ADJ>
			       .OBJ)
			      (ELSE <MAPRET>)>>
		   <NP-OBJECTS .NOUN-P>>>
	<PARSE-ORPHAN-NOUN .PR <>>
	<PARSE-ORPHAN-ADJ .PR <>>
	<PARSE-ORPHAN-LOC .PR <>>
	<COND (<EMPTY? .L>
	       <FALSE-STRING
		<PRIMARY-NAME <1 <NP-OBJECTS .NOUN-P>>> .ADJ>)
	      (ELSE
	       <NP-OBJECTS .NOUN-P .L>
	       <COND (<G? <LENGTH .L> 1>
		      <COND (,ORPHAN-NOUN <PARSE-ORPHAN-NOUN .PR T>)
			    (ELSE <PARSE-ORPHAN-LOC .PR T>)>
		      <PARSE-ORPHAN-ADJ .PR ,ORPHAN-ADJ>
		      <COND (,ORPHAN-LOC <PARSE-ORPHAN-LOC .PR T>)>)
		     (<AND ,ORPHAN-LOC ,ORPHAN-NOUN .NOISY>
		      <PRINT-MANY .OUTCHAN PRINC
				  "Where do you wish to "
				  <WORD-LEXICAL-WORD <PARSE-VERB ,ORPHAN-NOUN>>
				  " " <OBJECT-DESC <1 .L>> "?"
				  PRMANY-CRLF>
		      <PARSE-ORPHAN-LOC .PR T>
		      <PARSE-OBJ1 ,ORPHAN-NOUN .NOUN-P>)>
	       .NOUN-P)>>

;<DEFINE FALSE-STRING (N:VWORD LADJ:LIST)
	<CHTYPE (<STRING "There is no "
			 <MAPF ,STRING
			       <FUNCTION (A:VWORD)
				    <MAPRET <WORD-LEXICAL-WORD .A> " ">>
			       .LADJ>
			 <WORD-LEXICAL-WORD .N>
			 " here">) FALSE>>

<ENDPACKAGE>
