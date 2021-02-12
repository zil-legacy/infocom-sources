"COMPILE/LOAD FILE for M3
Copyright (C) 1984 Infocom, Inc.  All rights reserved."

<REPEAT (CHR)
	<PRINC "Debugging? (Y or N): " ,OUTCHAN>
	<SET CHR <TYI>>
	<COND (<MEMQ .CHR "Yy ">
	       <PRINC " Debugging!
" ,OUTCHAN>
	       <RETURN <SETG DEBUGGING? T>>)
	      (<MEMQ .CHR "Nn">
	       <PRINC " No debugging!
" ,OUTCHAN>
	       <RETURN <SETG DEBUGGING? <>>>)
	      (ELSE
	       <PRINC " ??
" ,OUTCHAN>)>>

<DEFINE DEBUG-CODE ('X "OPTIONAL" ('Y T))
	<COND (,DEBUGGING? .X)(ELSE .Y)>>

<COND (<GASSIGNED? PREDGEN>
       <PRINC "Compiling">
       <ID 0>)
      (T <PRINC "Loading">)>

<PRINC " Suspect: An INTERLOGIC Mystery
">

<BLOAT 90000 0 0 3500 0 0 0 0 0 512>

<SET REDEFINE T>

;<GLOBAL BIGFIX 10000>

<OR <GASSIGNED? ZILCH>
    <SETG WBREAKS <STRING !\" !,WBREAKS>>>

<DEFINE IFILE (STR "OPTIONAL" (FLOAD? <>) "AUX" (TIM <TIME>))
	<INSERT-FILE .STR .FLOAD?>>

<DIRECTIONS NORTH SOUTH EAST WEST NE NW SE SW UP DOWN IN OUT>

<CONSTANT SERIAL 0>
<PROPDEF SIZE 5>
<PROPDEF CAPACITY 0>

<COND (<GASSIGNED? PREDGEN>
       <SETG ZSTR-ON <SETG ZSTR-OFF ,TIME>>)>

<IFILE "MACROS" T>
<IFILE "SYNTAX" T>

%<DEBUG-CODE <IFILE "DEBUG" T>>

<IFILE "PARSER" T>
<ENDLOAD> ;"ZILCH ignores this, of course"
<IFILE "CLOCK" T>
<IFILE "MAIN" T>
<IFILE "GOAL" T>
<IFILE "VERBS" T>
<IFILE "PLACES" T>
<IFILE "PEOPLE" T>
<IFILE "THINGS" T>
<IFILE "EVENTS" T>

<GC-MON T>
<GC 0 T 5>