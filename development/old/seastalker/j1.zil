"COMPILE/LOAD FILE for SEASTALKER
Copyright (C) 1984 Infocom, Inc.  All rights reserved."

<COND (<GASSIGNED? PREDGEN>
       <PRINC "Compiling">
       <SETG ZSTR-ON <SETG ZSTR-OFF ,TIME>>
       <ID 0>)
      (T <PRINC "Loading">)>

<PRINC " SEASTALKER: junior-level interactive fiction from Infocom!">

ON!-INITIAL	"for DEBUGR"
OFF!-INITIAL
ENABLE!-INITIAL
DISABLE!-INITIAL

<COND (<GASSIGNED? MUDDLE>
       <BLOAT 90000 0 0 3500 0 0 0 0 0 512>)>

<SET REDEFINE T>

"<GLOBAL BIGFIX 10000>"

<OR <GASSIGNED? ZILCH>
    <SETG WBREAKS <STRING !\" !,WBREAKS>>>

<DEFINE IFILE (STR "OPTIONAL" (FLOAD? <>) "AUX" (TIM <TIME>))
	<INSERT-FILE .STR .FLOAD?>>

<DIRECTIONS ;"Do not change the order of the first eight
	      without consulting MARC! -- ENCHANTER"
 	    NORTH NE EAST SE SOUTH SW WEST NW UP DOWN IN OUT>

<IFILE "MACROS" T>
<IFILE "SYNTAX" T>
<IFILE "MAIN" T>
<IFILE "SUB" T>
<IFILE "BATTLE" T>
<IFILE "THINGS" T>
<IFILE "DOME" T>

<IFILE "PEOPLE" T>
<IFILE "PLACES" T>
<IFILE "GLOBAL" T>
<CONSTANT SERIAL 0>
<IFILE "CLOCK" T>
<ENDLOAD>
<IFILE "PARSER" T>
<IFILE "VERBS" T>
<IFILE "EVENTS" T>

<PROPDEF SIZE 5>
<PROPDEF CAPACITY 0>

<GC-MON T>
<COND (<GASSIGNED? MUDDLE>
       <GC 0 T 5>)>
