"COMPILE/LOAD FILE for MILLIWAYS
Copyright (C) 1988 Infocom, Inc.  All rights reserved."

<SETG ZDEBUGGING? T>
<DEFINE DEBUG-CODE ('X "OPTIONAL" ('Y T))
	<COND (,ZDEBUGGING? .X) (ELSE .Y)>>

<SETG NEW-PARSER? T>
<FREQUENT-WORDS?>
<LONG-WORDS?>

<ZIP-OPTIONS UNDO>
<VERSION XZIP>

<IFFLAG (IN-ZILCH
	 <PRINC "Compiling">
	 <ID 0>)
	(T <PRINC "Loading">)>

<PRINC " MILLIWAYS: interactive fiction from Infocom!
">

ON!-INITIAL	"for ZIL debugging"
OFF!-INITIAL
ENABLE!-INITIAL
DISABLE!-INITIAL

<SET REDEFINE T>

<INSERT-FILE "DEFS">

<SETG L-SEARCH-PATH (["P" ""] !,L-SEARCH-PATH)>
<XFLOAD "P:PARSER.REST">

<INSERT-FILE "MACROS">
<INSERT-FILE "MISC">
<INSERT-FILE "SYNTAX">
<INSERT-FILE "VERBS">
<INSERT-FILE "THINGS">
<INSERT-FILE "PLACES">
<INSERT-FILE "MAGRATHEA">
<INSERT-FILE "PEOPLE">
<INSERT-FILE "GLOBAL">
<INSERT-FILE "GUIDE">

<PROPDEF SIZE 5>
