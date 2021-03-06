"BOOT for
		      Search 'n Rescue
"
<PRINC "
 *** Search 'n Rescue ***
">

ON!-INITIAL
OFF!-INITIAL	;"makes debugging possible -- pdl"

;<COND (<GASSIGNED? MUDDLE>
       <GC 0 T 5>
       <BLOAT 90000 0 0 3300 0 0 0 0 0 256>)>

<SET REDEFINE T>

<LINK '<ERRET T> "" <ROOT>>
<LINK '<INSERT-FILE "CIRCUIT.ZIL" T> "C" <ROOT>>
<LINK '<INSERT-FILE "MAINTENANCE.ZIL" T> "M" <ROOT>>
<LINK '<INSERT-FILE "VERBS.ZIL" T> "V" <ROOT>>

<OR <GASSIGNED? ZILCH>
    <SETG WBREAKS <STRING !\" !,WBREAKS>>>

<COND (<GASSIGNED? ZILCH>
       <ID 0>)>

<SETG NEW-VOC? T>

<INSERT-FILE "MISC" T>
<INSERT-FILE "PARSER" T>
<INSERT-FILE "SYNTAX" T>
<INSERT-FILE "VERBS" T>
<INSERT-FILE "GLOBALS" T>
<INSERT-FILE "MAINTENANCE" T>
<INSERT-FILE "CIRCUIT" T>

<PROPDEF SIZE 5>
<PROPDEF CAPACITY 0>