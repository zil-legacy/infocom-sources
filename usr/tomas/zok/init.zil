;"INIT SHIP FOR TREK DT"


"USER COMMAND READING"

<GLOBAL P-LEXV <ITABLE 59 (<BYTE LENGTH> <BYTE ZERO>) 0 <BYTE 0> <BYTE 0>>>
<GLOBAL P-INBUF <ITABLE 127 (BYTE LENGTH) 0>>


<ROUTINE PRINT-BUFFER (BUF "AUX" CHR)
	 <REPEAT ()
		 <SET CHR <GETB .BUF 1>>
		 <COND (<ZERO? .CHR> <RETURN>)
		       (ELSE <PRINTC .CHR>)>
		 <SET BUF <REST .BUF>>>>

<ROUTINE COPY-BUFFER (BUF "OPT" (L 2) "AUX" CHR)
	 <PUTB ,CMD-INBUF .L %<ASCII !\ >>
	 <SET L <+ .L 1>>
	 <REPEAT ()
		 <SET CHR <GETB .BUF 1>>
		 <PUTB ,CMD-INBUF .L .CHR>
		 <COND (<EQUAL? .CHR 0 13 10> <RETURN>)>
		 <SET L <+ .L 1>>
		 <SET BUF <REST .BUF>>>
	 .L>

;"MAIN STUFF"

<GLOBAL SHIP-NAME "">

<GLOBAL RACE "">

<GLOBAL EXP 0>

<GLOBAL POWER 500>

<ROUTINE SCRAMBLE (NUM)
         <SET NUM (.NUM + 382)>
	 <SET NUM (.NUM * -3)>>
	 
<ROUTINE GO ()
         <TELL
"Initialize a starship, for TREK DT~
~
  Ship name: ">
	 <READ ,P-INBUF ,P-LEXV>
         <COPY-BUFFER ,P-INBUF>
         <TELL CR
"  Ship nationality:~
     (<T>erran, <R>omulan, <K>lingon): ">
	 	

<ROUTINE TREK-COMMAND ("AUX" LEXV:TABLE CNT:FIX ID:FIX WHO:<OR FALSE OBJECT>
		       TBL:<OR FALSE TABLE>)
	 <SET CNT <GETB ,CMD-LEXV 1>>
	 <SET ID <MAKE-ID <GETB ,CMD-INBUF 1>>>
	 <COND (<NOT .ID>
		<NEXT-MESSAGE>
		<TELL "**BAD ID: " N <GETB ,CMD-INBUF 1> CR>)
	       (ELSE
		<COND (<NOT <SET WHO <NTH ,PLAYERS .ID>>>
		       <PUT ,PLAYERS .ID <SET WHO <NEW-SHIP .ID>>>)>
		<SET LEXV <REST ,CMD-LEXV 6>>
		<COND (<SET TBL
			    <INTBL? <GET .LEXV 0>
				    <REST ,TREK-TABLE 2>
				    <GET ,TREK-TABLE 0>>>
		       <APPLY <GET .TBL 1> .WHO <REST .LEXV 4> <- .CNT 1>>)
		      (ELSE
		       <NEXT-MESSAGE>
		       <TELL "**BAD MESSAGE: \"">
		       <PRINT-BUFFER ,CMD-INBUF>
		       <TELL "\" **" CR>)>)>>

\

<GLOBAL TREK-TABLE
	<LTABLE <VOC "E" BUZZ>  TREK-ENTER
		<VOC "H" BUZZ>  TREK-TALK
		<VOC "M" BUZZ>  TREK-MOVE
		<VOC "P" BUZZ>	TREK-PHASER
		<VOC "T" BUZZ>  TREK-TORP
		<VOC "Q" BUZZ>  TREK-QUIT>>

  