"DEFS2 for

			       ZORK ZERO
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT 0>

<INCLUDE "BASEDEFS" "PBITDEFS" "PDEFS">

<NEW-ADD-WORD "CAGES" NOUN <VOC "CAGE"> ,PLURAL-FLAG>
<NEW-ADD-WORD "STALLS" NOUN <VOC "STALL"> ,PLURAL-FLAG>
<NEW-ADD-WORD "DOORS" NOUN <VOC "DOOR"> ,PLURAL-FLAG>
<NEW-ADD-WORD "BUTTONS" NOUN <VOC "BUTTON"> ,PLURAL-FLAG>
<NEW-ADD-WORD "ORBS" NOUN <VOC "ORB"> ,PLURAL-FLAG>
<NEW-ADD-WORD "SLABS" NOUN <VOC "SLAB"> ,PLURAL-FLAG>
<NEW-ADD-WORD "WEIGHTS" NOUN <VOC "WEIGHT"> ,PLURAL-FLAG>
<NEW-ADD-WORD "ANIMALS" NOUN <VOC "ANIMAL"> ,PLURAL-FLAG>
<NEW-ADD-WORD "SNAKES" NOUN <VOC "SNAKE"> ,PLURAL-FLAG>
<NEW-ADD-WORD "KEYS" NOUN <VOC "KEY"> ,PLURAL-FLAG>
<NEW-ADD-WORD "PEGS" NOUN <VOC "PEG"> ,PLURAL-FLAG>
<NEW-ADD-WORD "POSTS" NOUN <VOC "POST"> ,PLURAL-FLAG>
<NEW-ADD-WORD "SHELLS" NOUN <VOC "SHELL"> ,PLURAL-FLAG>
<NEW-ADD-WORD "FLIES" NOUN <VOC "FLY"> ,PLURAL-FLAG>
<NEW-ADD-WORD "VIALS" NOUN <VOC "VIAL"> ,PLURAL-FLAG>
<NEW-ADD-WORD "TREES" NOUN <VOC "TREE"> ,PLURAL-FLAG>
<NEW-ADD-WORD "ELMS" NOUN <VOC "ELM"> ,PLURAL-FLAG>
<NEW-ADD-WORD "OAKS" NOUN <VOC "OAK"> ,PLURAL-FLAG>
<NEW-ADD-WORD "PINES" NOUN <VOC "PINE"> ,PLURAL-FLAG>
<NEW-ADD-WORD "WITCHES" NOUN <VOC "WITCH"> ,PLURAL-FLAG>
<NEW-ADD-WORD "PASSAGES" NOUN <VOC "PASSAGE"> ,PLURAL-FLAG>
<NEW-ADD-WORD "FLOWERS" NOUN <VOC "FLOWER"> ,PLURAL-FLAG>
<NEW-ADD-WORD "BOARDS" NOUN <VOC "BOARD"> ,PLURAL-FLAG>
<NEW-ADD-WORD "SHUTTERS" NOUN <VOC "SHUTTER"> ,PLURAL-FLAG>
<NEW-ADD-WORD "PAINTINGS" NOUN <VOC "PAINTING"> ,PLURAL-FLAG>
<NEW-ADD-WORD "PORTRAITS" NOUN <VOC "PORTRAIT"> ,PLURAL-FLAG>

<NEW-ADD-WORD "DIMWIT\'S" ADJ DIMWIT ,POSSESSIVE>
<NEW-ADD-WORD "JESTER\'S" ADJ JESTER ,POSSESSIVE>

<REPLACE-DEFINITION MOBY-FIND?
 <ROUTINE MOBY-FIND? (SEARCH)
	<COND (<OR <NOT <0? <ANDB .SEARCH ,SEARCH-MOBY ;128>>>
		   <EQUAL? ,WINNER ,EXECUTIONER>>
	       T)>>>

<REPLACE-DEFINITION WHICH-LIST?
<ROUTINE WHICH-LIST? (NP SR "AUX" (CT <FIND-RES-COUNT .SR>)
				  (V <REST-TO-SLOT .SR FIND-RES-OBJ1>))
 <COND (<G? .CT <FIND-RES-SIZE .SR>>
	<RFALSE>)
       (<AND <EQUAL? .CT 1>
	     <EQUAL? <ZGET .V 0> ,PSEUDO-OBJECT>>
	<RFALSE>)
       ;(<EQUAL? <NP-NAME .NP> ,W?FLY ,W?FLIES>
	<RFALSE>)
       (<AND <SET NP <INTBL? ,PSEUDO-OBJECT .V .CT>>
	     <INTBL? ,PSEUDO-OBJECT <REST .NP 2>
				    <- .CT </ <+ 2 <- .NP .V>> 2>>>>
	<RFALSE>)>
 <REPEAT ()
	 <COND (<L? <SET CT <- .CT 1>> 0>
		<RFALSE>)
	       (<ACCESSIBLE? <ZGET .V 0>>
		<RTRUE>)
	       (T
		<SET V <ZREST .V 2>>)>>>>

<REPLACE-DEFINITION PSEUDO-OBJECTS

<PUTPROP THINGS PROPSPEC HACK-PSEUDOS>

<DEFINE20 HACK-PSEUDOS (LIST "AUX" (N 0) (CT 0))
  <SET LIST <REST .LIST>>
  <SET LIST
    <MAPR ,LIST
      <FUNCTION (X "AUX" L (ACT 0) (NCT 0))
        <COND (<0? .N>
	       <SET CT <+ .CT 1>>
	       <SET N 1>
	       <COND (<TYPE? <1 .X> ATOM>
		      <SET ACT 1>
		      ;<TABLE (PURE)
			     1
			     <VOC <SPNAME <1 .X>> ADJ>>)
		     (<TYPE? <1 .X> LIST>
		      <SET ACT <LENGTH <1 .X>>>
		      ;<EVAL <CHTYPE (TABLE (PURE)
				     <LENGTH <1 .X>>
				     !<MAPF ,LIST
				       <FUNCTION (Y)
				         <VOC <SPNAME .Y> ADJ>>
				       <1 .X>>) FORM>>)
		     (T
		      <SET ACT 0>)>
	       <COND (<LENGTH? .X 1>)
		     (<TYPE? <2 .X> ATOM>
		      <SET NCT 1>)
		     (<TYPE? <2 .X> LIST>
		      <SET NCT <LENGTH <2 .X>>>)
		     (T
		      <SET NCT 0>)>
	       <TABLE (PURE)
		      <BYTE .ACT> <BYTE .NCT>
		      <COND (<0? .ACT>
			     0)
			    (<==? .ACT 1>
			     <VOC <SPNAME <1 .X>> ADJ>)
			    (T
			     <EVAL <CHTYPE (TABLE (PURE)
					    ;.ACT
					    !<MAPF ,LIST
						<FUNCTION (Y)
						 <VOC <SPNAME .Y> ADJ>>
						<1 .X>>) FORM>>)>
		      <COND (<0? .NCT>
			     0)
			    (<==? .NCT 1>
			     <VOC <SPNAME <2 .X>> NOUN>)
			    (T
			     <EVAL <CHTYPE (TABLE (PURE)
					    ;.NCT
					    !<MAPF ,LIST
						<FUNCTION (Y)
						 <VOC <SPNAME .Y> NOUN>>
						<2 .X>>) FORM>>)>>)
	      (<1? .N>
	       <SET N 2>
	       <MAPRET>)
	      (T
	       <SET N 0>
	       <1 .X>)>>
      .LIST>>
  (<> <EVAL <CHTYPE (TABLE (PURE ;PATTERN ;(BYTE [REST WORD]))
		     .CT !.LIST) FORM>>)>

<DEFINE TEST-THINGS (RM F
		     "AUX" CT (RMG <GETP .RM ,P?THINGS>) (RMGL <GET .RMG 0>))
 <SET RMG <REST .RMG 2>>
 <COND (<T? <SET CT <FIND-ADJS .F>>>
	<SET CT <ADJS-COUNT .CT>>)>
 <REPEAT (TTBL (NOUN <FIND-NOUN .F>) XCT
	       (V <REST-TO-SLOT <FIND-ADJS .F> ADJS-COUNT 1>))
  <SET TTBL <GET .RMG 0 ;1>>
  <COND (<AND <OR <EQUAL? .NOUN ;<> ,W?ONE>
		  <AND <1? <SET XCT <GETB .TTBL 1>>>
		       <EQUAL? .NOUN <ZGET .TTBL 2>>>
		  <INTBL? .NOUN <ZGET .TTBL 2> .XCT>>
	      <OR <0? .CT>
		  <AND <1? <SET XCT <GETB .TTBL 0>>>
		       <EQUAL? <ZGET .V 0> <ZGET .TTBL 1>>>
		  <INTBL? <ZGET .V 0> <ZGET .TTBL 1> .XCT>>
	      <OR <NOT <FIND-OF .F>>
		  <AND <EQUAL? 1 <FIND-RES-COUNT ,OWNER-SR-HERE>>
		       <EQUAL? ,PSEUDO-OBJECT <FIND-RES-OBJ1 ,OWNER-SR-HERE>>
		       <EQUAL? ,LAST-PSEUDO-LOC .RM>
		       <EQUAL? <GETP ,PSEUDO-OBJECT ,P?ACTION> <GET .RMG 1>>>>>
	 <SETG LAST-PSEUDO-LOC .RM>
	 <PUTP ,PSEUDO-OBJECT ,P?ACTION <GET .RMG 1 ;2>>
	 <SET V <ZBACK <GETPT ,PSEUDO-OBJECT ,P?ACTION> 7>>
	 <COPYT .NOUN .V 6>
	 <COND (<BTST <WORD-FLAGS .NOUN> ,PLURAL-FLAG>
		<FSET ,PSEUDO-OBJECT ,PLURALBIT>)
	       (T
		<FCLEAR ,PSEUDO-OBJECT ,PLURALBIT>)>
	 <ADD-OBJECT ,PSEUDO-OBJECT .F>
	 <RFALSE>)>
  <SET RMG <ZREST .RMG 4 ;6>>
  <COND (<L? <SET RMGL <- .RMGL 1>> 1>
	 <RTRUE>)>>>

<GLOBAL LAST-PSEUDO-LOC:OBJECT <>>

<OBJECT PSEUDO-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "pseudoxxx")
	(ACTION 0)	;"no other properties!">>

<REPLACE-DEFINITION INVALID-OBJECT?
<ROUTINE INVALID-OBJECT? (OBJ)
	 <COND (<EVERYWHERE-VERB?>
		<RFALSE>)>
	 <COND (<AND <EQUAL? .OBJ ,CEILING>
		     <FSET? ,HERE ,OUTSIDEBIT>
		     <NOT <EQUAL? ,HERE ,ROOF ,PARAPET>>>
		<RTRUE>)
	       (<AND <EQUAL? .OBJ ,LOCK-OBJECT>
		     <NOUN-USED? ,LOCK-OBJECT ,W?KEYHOLE>
		     <EQUAL? ,HERE ,LOWEST-HALL>>
		<RTRUE>)
	       (<AND <EQUAL? .OBJ ,WALL>
		     <FSET? ,HERE ,OUTSIDEBIT>
		     <NOT <EQUAL? ,W?ONE <FIND-NOUN ,FINDER>>>
		     <NOT <EQUAL? ,HERE ,PERIMETER-WALL>>>
		<RTRUE>)
	       (T
		<RFALSE>)>>>

<END-SEGMENT>
