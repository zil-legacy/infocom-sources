"M4 for
		              BALLYHOO
	(c) Copyright 1984 Infocom, Inc.  All Rights Reserved."

<PRINC "
 *** J3: Interactive Mystery ***

">

ON!-INITIAL	"for DEBUGR"
OFF!-INITIAL
ENABLE!-INITIAL
DISABLE!-INITIAL

<COND (<GASSIGNED? MUDDLE>
       <GC 0 T 5>
       <BLOAT 90000 0 0 3300 0 0 0 0 0 256>)>

<SET REDEFINE T>

<OR <GASSIGNED? ZILCH>
    <SETG WBREAKS <STRING !\" !,WBREAKS>>>

<OR <GASSIGNED? INSERT-CRUFTY>
    <DEFINE INSERT-CRUFTY (STR) <INSERT-FILE .STR T>>>

<COND (<GASSIGNED? PREDGEN>
       <ID 0>)>

<COND (<GASSIGNED? PREDGEN>
	       <SETG ZSTR-ON <SETG ZSTR-OFF ,TIME>>)>

<INSERT-FILE "XMMISC" T>
<INSERT-FILE "XMPARSER" T>
<INSERT-FILE "XMSYNTAX" T>
<INSERT-FILE "XMVERBS" T>
<INSERT-FILE "XMGLOBALS" T>
<INSERT-FILE "XMBALLYHOO" T>

<PROPDEF SIZE 5>
<PROPDEF CAPACITY 0>