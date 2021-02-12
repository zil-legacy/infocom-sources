;*****************************************************************************
; "game : SHERLOCK!"
; "file : GAME.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   20 Oct 1987 17:18:26  $"
; "rev  : $Revision:   1.11  $"
; "vers : 1.00"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "compilation banner"
;-----------------------------------------------------------------------------

<PRINC "
******************************************************************************
******************************* SHERLOCK 1.00 ********************************
******************************************************************************
">

;-----------------------------------------------------------------------------
; "xzip enable code"
;-----------------------------------------------------------------------------

<VERSION XZIP>

;-----------------------------------------------------------------------------
; "do not change any of the following"
;-----------------------------------------------------------------------------

ON!-INITIAL
OFF!-INITIAL
ENABLE!-INITIAL
DISABLE!-INITIAL

<COND
	(<GASSIGNED? MUDDLE>
		<BLOAT 90000 0 0 3300 0 0 0 0 0 256>
	)
>

<SET REDEFINE T>

<SETG SIBREAKS ".,\"!?">

<OR <GASSIGNED? ZILCH>
	<SETG WBREAKS <STRING !\" !,WBREAKS>>
>

<COND
	(<GASSIGNED? PREDGEN>
		<SETG ZSTR-ON <SETG ZSTR-OFF ,TIME>>
		<ID 0>
	)
>

;-----------------------------------------------------------------------------
; "Include debug code?"
;-----------------------------------------------------------------------------

<SETG GL-DEBUG? <>>

;-----------------------------------------------------------------------------
; "Look for frequent words"
;-----------------------------------------------------------------------------

<FREQUENT-WORDS?>

;-----------------------------------------------------------------------------
; "Reserve memory for UNDO if possible."
;-----------------------------------------------------------------------------

<SETG USE-UNDO? T>

;-----------------------------------------------------------------------------
; "game files"
;-----------------------------------------------------------------------------

<INSERT-FILE "MACROS"     T>

<INSERT-FILE "GO"         T>

<INSERT-FILE "DEBUG"      T>

<INSERT-FILE "HINTS"      T>
<INSERT-FILE "WINDOW"     T>
<INSERT-FILE "CAB"        T>
<INSERT-FILE "WAIT"       T>
<INSERT-FILE "TOWER"      T>
<INSERT-FILE "SCOPE"      T>
<INSERT-FILE "ELIZA"      T>
<INSERT-FILE "CHARLES"    T>
<INSERT-FILE "BANK"       T>

<INSERT-FILE "PUZZLES"    T>
<INSERT-FILE "GENERIC"    T>

<INSERT-FILE "LOCALS3"    T>
<INSERT-FILE "LOCALS2"    T>
<INSERT-FILE "LOCALS1"    T>

<INSERT-FILE "PEOPLE3"    T>
<INSERT-FILE "PEOPLE2"    T>
<INSERT-FILE "PEOPLE1"    T>

<INSERT-FILE "PLACES3"	  T>
<INSERT-FILE "PLACES2"    T>
<INSERT-FILE "PLACES1"    T>

<INSERT-FILE "THINGS3"    T>
<INSERT-FILE "THINGS2"    T>
<INSERT-FILE "THINGS1"    T>

<INSERT-FILE "VERBS3"     T>
<INSERT-FILE "VERBS2"     T>
<INSERT-FILE "VERBS1"     T>

<INSERT-FILE "SYNTAX"     T>

<INSERT-FILE "SCHED"      T>
<INSERT-FILE "BOOT"       T>
<INSERT-FILE "PARSER"     T>

;*****************************************************************************
; "end of file"
;*****************************************************************************

