"ZORK2 for
		      Zork: The Wizard of Frobozz
		 The Great Underground Empire (Part 2)
	(c) Copyright 1981 Infocom, Inc.  All Rights Reserved.
"

<BLOAT 70000 0 0 2700 0 0 0 0 0 256>

<SET REDEFINE T>

<GLOBAL BIGFIX 10000>

<OR <GASSIGNED? ZILCH>
    <SETG WBREAKS <STRING !\" !,WBREAKS>>>

<OR <GASSIGNED? INSERT-CRUFTY>
    <DEFINE INSERT-CRUFTY (STR) <IFILE .STR T>>>

<DEFINE IFILE (STR "OPTIONAL" (FLOAD? <>) "AUX" (TIM <TIME>))
	<INSERT-FILE .STR .FLOAD?>>

<PRINC "Loader/ ZORK II: The Wizard of Frobozz
">

<COND (<GASSIGNED? PREDGEN>
       <ID 0>)>

<IFILE "DUNGEON" T>

<PROPDEF SIZE 5>
<PROPDEF CAPACITY 0>
<PROPDEF VALUE 0>

<IFILE "SYNTAX" T>
<ENDLOAD>
<IFILE "MACROS" T>
<IFILE "CLOCK" T>
<IFILE "MAIN" T>
<IFILE "PARSER" T>
<IFILE "DEMONS" T>
<INSERT-CRUFTY "CRUFTY">
<IFILE "VERBS" T>
<IFILE "ACTIONS" T>

<GC 0 T>

<DEFINE CNT (STR OBL)
	<PRINC .STR>
	<PRIN1 <MAPF ,+ ,LENGTH .OBL>>
	<CRLF>>



