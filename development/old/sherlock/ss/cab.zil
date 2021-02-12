;*****************************************************************************
; "game : SHERLOCK!"
; "file : CAB.ZIL"
; "auth :   $Author:   RAB  $"
; "date :     $Date:   28 Oct 1987  4:35:40  $"
; "rev  : $Revision:   1.63  $"
; "vers : 1.00"
;*****************************************************************************

;*****************************************************************************
; "PEOPLE1.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "CH-HANSOM-CABBIE"
;-----------------------------------------------------------------------------

<OBJECT CH-HANSOM-CABBIE
	(LOC TH-HANSOM-CAB)
	(DESC "hansom cabbie")
	(FLAGS FL-NODESC FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL)
	(SYNONYM CABBIE DRIVER)
	(SIZE 99)
	(ACTION RT-AC-CH-HANSOM-CABBIE)
	(DESCFCN RT-DF-CH-HANSOM-CABBIE)
>

;-----------------------------------------------------------------------------
; "CH-GROWLER-CABBIE"
;-----------------------------------------------------------------------------

<OBJECT CH-GROWLER-CABBIE
	(LOC TH-GROWLER-CAB)
	(DESC "growler cabbie")
	(FLAGS FL-NODESC FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL)
	(SYNONYM CABBIE DRIVER FLOYD)
	(SIZE 99)
	(ACTION RT-AC-CH-GROWLER-CABBIE)
	(DESCFCN RT-DF-CH-GROWLER-CABBIE)
>

;*****************************************************************************
; "PEOPLE2.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-AC-CH-HANSOM-CABBIE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-CH-HANSOM-CABBIE ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-CH-AC "CH-HANSOM-CABBIE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<MC-THIS-WINNER?>
			<COND
				(<MC-VERB? WAIT>
      			<SETG GL-WHERE-TO-PROMPT? <>>
					<SETG GL-WHERE-TO-ORPH? <>>
					<TELL "\"Right-o.\"" CR>
					<PUTP ,TH-HANSOM-CAB ,P?AUX2 1>
					<RT-ALARM-CLR ,RT-I-HANSOM-LEAVE>
					<RT-ALARM-SET-REL ,RT-I-HANSOM-LEAVE <RT-PARM-SET 0 30 0>>
				)
				(<MC-VERB? DRIVE>
					<RT-CF-TH-HANSOM-CAB>
				)
            (<MC-VERB? HELLO>
               <TELL "\"'Ello.\"" CR>
            )
            (<MC-VERB? GOODBYE>
               <TELL "\"Ta ta.\"" CR>
            )
            (<MC-VERB? THANK>
               <TELL "\"Anytime, mate.\"" CR>
            )
				(T
					<TELL
"\"Sorry, guv. All I does is drives a cab.\"" CR
					>
				)
			>
		)
		(<OR  <AND
					<MC-VERB? PAY>
					<MC-THIS-PRSO?>
				>
				<AND
					<MC-VERB? GIVE>
					<MC-THIS-PRSI?>
					<MC-IS? ,GL-PRSO ,FL-MONEY>
				>
			>
			<TELL
"\"No thanks, guv'nor. It'll go on Mr. 'Olmes' monthly account.\"" CR
			>
		)
		(<AND <MC-VERB? TELL>
				<MC-THIS-PRSO?>
				,GL-P-CONT
			>
			<RFALSE>
		)
		(<INTBL? ,GL-PRSA <REST ,GL-TALK-VERBS 2> <GET ,GL-TALK-VERBS 0>>
			<TELL
"\"Sorry, sir. No time to chat.\"" CR> 
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-CH-GROWLER-CABBIE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-CH-GROWLER-CABBIE ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-CH-AC "CH-GROWLER-CABBIE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<MC-THIS-WINNER?>
			<COND
				(<MC-VERB? WAIT>
      			<SETG GL-WHERE-TO-PROMPT? <>>
					<SETG GL-WHERE-TO-ORPH? <>>
					<TELL CTHE ,CH-GROWLER-CABBIE " says brightly, \"Okay.\"" CR>
				)
				(<MC-VERB? DRIVE>
					<RT-CF-TH-GROWLER-CAB>
				)
				(T
					<TELL
CTHE ,CH-GROWLER-CABBIE " says brightly, \"Hello,\" and looks at you expectantly." CR
					>
				)
			>
		)
		(<OR  <AND
					<MC-VERB? PAY>
					<MC-THIS-PRSO?>
				>
				<AND
					<MC-VERB? GIVE>
					<MC-THIS-PRSI?>
					<MC-IS? ,GL-PRSO ,FL-MONEY>
				>
			>
			<TELL
CTHE ,CH-GROWLER-CABBIE " says brightly, \"No thanks. I'm not in it for the
money. I just like to meet new people.\"" CR
			>
		)
		(<AND <MC-VERB? TELL>
				<MC-THIS-PRSO?>
				,GL-P-CONT
			>
			<RFALSE>
		)
		(<INTBL? ,GL-PRSA <REST ,GL-TALK-VERBS 2> <GET ,GL-TALK-VERBS 0>>
			<TELL
CTHE ,CH-GROWLER-CABBIE " says brightly, \"Hello,\" and looks at you expectantly." CR
			>
		)
	>
>

;*****************************************************************************
; "PEOPLE3.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-DF-CH-HANSOM-CABBIE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-CH-HANSOM-CABBIE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "CH-HANSOM-CABBIE">
		)
		(T
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-CH-GROWLER-CABBIE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-CH-GROWLER-CABBIE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "CH-GROWLER-CABBIE">
		)
		(T
		)
	>
	<RFALSE>
>

;*****************************************************************************
; "PUZZLES.ZIL"
;*****************************************************************************

<GLOBAL GL-WHERE-TO-PROMPT?:FLAG <>>		;"Display 'Where to?' before prompt?"
<GLOBAL GL-WHERE-TO-ORPH?:FLAG <>>			;"Orphan drive verb?"

;-----------------------------------------------------------------------------
; "Cab speed constants"
;-----------------------------------------------------------------------------

<CONSTANT K-HANSOM-TIME  2>	;"Minutes for Hansom  to travel one room."
<CONSTANT K-GROWLER-TIME 4>	;"Minutes for Growler to travel one room."

<CONSTANT K-CAB-HERE-MSG "There is a cab here already.">
<CONSTANT K-TAKE-CAB-MSG
"[To take a cab, get in and tell the cabbie to drive to your destination.]"
>

;-----------------------------------------------------------------------------
; "GL-CAB-DIST-TBL"
;-----------------------------------------------------------------------------

<GLOBAL GL-CAB-DIST-TBL:TABLE
	<PTABLE (BYTE)
		 1
		 2	 1
		 3	 2	 1
		 3	 3	 2	 1
		 2	 3	 3	 2	 1
		 1	 2	 3	 3	 2	 1
		 2	 3	 4	 4	 3	 2	 1
		 3	 4	 5	 5	 4	 3	 2	 1
		 4	 5	 6	 6	 5	 4	 3	 2	 1
		 4	 4	 3	 2	 1	 2	 3	 4	 5	 6
		 4	 4	 3	 2	 1	 2	 3	 4	 5	 6	 2
		 4	 5	 6	 6	 5	 4	 3	 2	 1	 2	 5	 6
		 5	 6	 7	 6	 5	 5	 4	 3	 2	 3	 4	 6	 1
		 6	 7	 7	 6	 5	 6	 5	 4	 3	 4	 4	 6	 2	 1
		 7	 7	 6	 5	 4	 5	 6	 5	 4	 5	 3	 5	 3	 2	 1
		 6	 6	 5	 4	 3	 4	 5	 6	 5	 6	 2	 4	 4	 3	 2	 1
		 6	 7	 6	 5	 4	 5	 5	 4	 3	 4	 3	 5	 2	 1	 2	 3	 3
		 6	 6	 5	 4	 3	 4	 5	 5	 4	 5	 2	 4	 3	 2	 3	 3	 2	 1
		 7	 7	 6	 5	 4	 5	 6	 6	 5	 6	 3	 5	 4	 3	 3	 2	 1	 2	 1
		 5	 5	 4	 3	 2	 3	 4	 5	 5	 6	 1	 3	 4	 3	 4	 4	 3	 2	 1	 2
		 5	 5	 4	 3	 2	 3	 4	 5	 6	 7	 1	 3	 5	 4	 3	 2	 1	 4	 3	 2	 2
		 4	 4	 3	 2	 1	 2	 3	 4	 5	 6	 2	 2	 6	 6	 6	 5	 4	 5	 4	 5	 3	 3
		 5	 5	 4	 3	 2	 3	 4	 5	 6	 7	 2	 3	 7	 6	 6	 5	 4	 5	 4	 5	 3	 3	 1
		 5	 5	 4	 3	 2	 3	 4	 5	 6	 7	 1	 3	 6	 5	 5	 4	 3	 4	 3	 4	 2	 2	 2	 1
		 6	 6	 5	 4	 3	 4	 5	 6	 7	 8	 2	 4	 7	 6	 6	 5	 4	 5	 4	 5	 3	 3	 3	 2	 1
		 7	 7	 6	 5	 4	 5	 6	 7	 8	 9	 3	 5	 8	 7	 7	 6	 5	 6	 5	 6	 4	 4	 4	 3	 2	 1
		 8	 8	 7	 6	 5	 6	 7	 8	 9	10	 4	 6	 9	 8	 8	 7	 6	 7	 6	 7	 5	 5	 5	 4	 3	 2	 1
		 7	 7	 6	 5	 4	 5	 6	 7	 8	 9	 3	 5	 8	 7	 7	 6	 5	 6	 5	 6	 4	 4	 4	 3	 2	 1	 2	 3
		 6	 6	 5	 4	 3	 4	 5	 6	 7	 8	 4	 4	 8	 8	 8	 7	 6	 7	 6	 7	 5	 5	 2	 3	 4	 5	 6	 6	 6
		 5	 5	 4	 3	 2	 3	 4	 5	 6	 7	 3	 3	 7	 7	 7	 6	 5	 6	 5	 6	 4	 4	 1	 2	 3	 4	 5	 5	 5	 1
		 6	 6	 5	 4	 3	 4	 5	 6	 7	 8	 4	 4	 8	 8	 8	 7	 6	 7	 6	 7	 5	 5	 2	 3	 4	 5	 5	 4	 6	 2	 1
		 7	 7	 6	 5	 4	 5	 6	 7	 8	 9	 5	 5	 9	 9	 9	 8	 7	 8	 7	 8	 6	 6	 3  4	 5	 5	 4	 3	 6	 3	 2	 1
		 8	 8	 7	 6	 5	 6	 7	 8	 9	10	 6	 6	10	10	10	 9	 8	 9	 8	 9	 7	 7	 4	 5	 5	 4	 3	 2	 5	 4	 3	 2	 1
		 9	 9	 8	 7	 6	 7	 8	 9	10	11	 5	 7	10	 9	 9	 8	 7	 8	 7	 8	 6	 6	 5	 5	 4	 3	 2	 1	 4	 5	 4	 3	 2	 1
		10	10	 9	 8	 7	 8	 9	10	11	12	 6	 8	11	10	10	 9	 8	 9	 8	 9	 7	 7	 6	 6	 5	 4	 3	 2	 5	 6	 5	 4	 3	 2	 1
		10	10	 9	 8	 7	 8	 9	10	11	12	 6	 8	11	10	10	 9	 8	 9	 8	 9	 7	 7	 6	 6	 5	 4	 3	 2	 5	 6	 5	 4	 3	 2	 1	 2
	>
>

;-----------------------------------------------------------------------------
; "GL-CAB-ROOMS"
;-----------------------------------------------------------------------------

;<GLOBAL GL-CAB-ROOMS:TABLE
	<PLTABLE
		,RM-221B-BAKER-ST
		,RM-YORK-PLACE
		,RM-MARYLEBONE-RD
		,RM-TOTTENHAM-COURT-RD
		,RM-ST-GILES-CIRCUS
		,RM-OXFORD-ST
		,RM-ORCHARD-ST
		,RM-AUDLEY-ST
		,RM-HYDE-PARK-CORNER
		,RM-KENSINGTON-GARDENS
		,RM-TRAFALGAR-SQUARE
		,RM-GREAT-RUSSELL-ST
		,RM-GROSVENOR-PLACE
		,RM-VICTORIA-SQUARE
		,RM-VICTORIA-STREET
		,RM-BROAD-SANCTUARY
		,RM-PARLIAMENT-SQUARE
		,RM-BUCKINGHAM-PALACE-RD
		,RM-QUEENS-GARDENS
		,RM-BIRDCAGE-WALK
		,RM-THE-MALL
		,RM-WHITEHALL
		,RM-NEW-OXFORD-ST
		,RM-COVENT-GARDEN
		,RM-THE-STRAND
		,RM-FLEET-STREET
		,RM-THE-EMBANKMENT
		,RM-UPPER-THAMES-ST
		,RM-BLIND-ALLEY
		,RM-PINCHIN-LANE
		,RM-CHEAPSIDE
		,RM-THREADNEEDLE-ST
		,RM-KING-WILLIAM-ST
		,RM-MONUMENT
		,RM-LOWER-THAMES-ST
		,RM-LONDON-BRIDGE
		,RM-TOWER-ENTRANCE
	>
>

;-----------------------------------------------------------------------------
; "RT-CAB-DIST"
;-----------------------------------------------------------------------------

<ROUTINE RT-CAB-DIST (HERE THERE "AUX" NUM1 NUM2 (PTR 0) TMP)
	<SET NUM1 <GETP .HERE ,P?AUX1>>
	<SET NUM2 <GETP .THERE ,P?AUX1>>
	<COND
;		(<OR	<ZERO? .NUM1>
				<ZERO? .NUM2>
			>
			<TELL "*** ERROR: Missing room number ***" CR D .HERE " to " D .THERE "." CR>
			<RETURN 0>
		)
		(<OR	<EQUAL? .HERE .THERE>
				<EQUAL? .NUM1 .NUM2>
			>
			<RETURN 0>
		)
	>

	<COND
		(<L? .NUM1 .NUM2>
			<SET TMP .NUM1>
			<SET NUM1 .NUM2>
			<SET NUM2 .TMP>
		)
	>
	<SET NUM1 <- .NUM1 2>>
	<REPEAT ()
		<COND
			(<L? .NUM1 1>
				<RETURN>
			)
			(T
				<SET PTR <+ .PTR .NUM1>>
				<DEC NUM1>
			)
		>
	>
	<SET PTR <+ .PTR <- .NUM2 1>>>
	<RETURN <GETB ,GL-CAB-DIST-TBL .PTR>>
>

;-----------------------------------------------------------------------------
; "RT-I-CAB-ARRIVE"
;-----------------------------------------------------------------------------

<ROUTINE RT-I-CAB-ARRIVE ("AUX" (CAB <>) (PLACE <>) NUM SCORE)
	<SET NUM <GETP ,TH-CAB-WHISTLE ,P?AUX1>>
	<SET PLACE <GETP ,TH-CAB-WHISTLE ,P?AUX2>>
	<PUTP ,TH-CAB-WHISTLE ,P?AUX1 0>
	<PUTP ,TH-CAB-WHISTLE ,P?AUX2 0>
	<COND
		(<AND <MC-HERE? .PLACE>
				<NOT <MC-VERB? WALK>>
			>
			<COND
				(<EQUAL? .NUM 1>
					<SET CAB ,TH-GROWLER-CAB>
					<SET SCORE 0>
					<RT-ALARM-SET-REL ,RT-I-GROWLER-LEAVE <RT-PARM-SET 0 5 0>>
					<RT-REMOVE-ALL ,TH-GROWLER-CAB>
					<MOVE ,CH-GROWLER-CABBIE ,TH-GROWLER-CAB>
					<MC-MAKE ,CH-GROWLER-CABBIE ,FL-SEEN>
				)
				(<EQUAL? .NUM 2>
					<SET CAB ,TH-HANSOM-CAB>
					<SET SCORE 5>
					<RT-ALARM-SET-REL ,RT-I-HANSOM-LEAVE <RT-PARM-SET 0 5 0>>
					<RT-REMOVE-ALL ,TH-HANSOM-CAB>
					<MOVE ,CH-HANSOM-CABBIE ,TH-HANSOM-CAB>
					<MC-MAKE ,CH-HANSOM-CABBIE ,FL-SEEN>
				)
				(T
					<RFALSE>
				)
			>
			<TELL CR "A " D .CAB " pulls up beside you." CR>
			<MOVE .CAB ,GL-PLACE-CUR>
			<COND
				(<ZERO? <GETP .CAB ,P?AUX1>>
					<PUTP .CAB ,P?AUX1 1>
					<COND
						(<NOT <ZERO? .SCORE>>
							<RT-UPDATE-SCORE .SCORE>
						)
					>
				)
			>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-I-HANSOM-LEAVE"
;-----------------------------------------------------------------------------

<ROUTINE RT-I-HANSOM-LEAVE ()
	<COND
		(<NOT <MC-HERE? ,RM-VICTORIA-SQUARE>>
			<COND
				(<RT-VISIBLE? ,TH-HANSOM-CAB>
					<TELL CTHE ,TH-HANSOM-CAB " drives off." CR>
				)
			>
			<MOVE ,TH-HANSOM-CAB ,RM-VICTORIA-SQUARE>
			<RT-REMOVE-ALL ,TH-HANSOM-CAB>
			<MOVE ,CH-HANSOM-CABBIE ,TH-HANSOM-CAB>
			<SETG GL-NOW-LIT? <RT-IS-LIT?>>
		)
	>
	<PUTP ,TH-HANSOM-CAB ,P?AUX2 0>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-I-HANSOM-TO?"
;-----------------------------------------------------------------------------

<ROUTINE RT-I-HANSOM-TO? ()
	<COND
		(<IN? ,CH-PLAYER ,TH-HANSOM-CAB>
			<TELL
"\"Where to mister?\"" CR
			>
			<RT-ALARM-SET-REL ,RT-I-HANSOM-TO? <RT-PARM-SET 0 1 0>>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-I-GROWLER-LEAVE"
;-----------------------------------------------------------------------------

<ROUTINE RT-I-GROWLER-LEAVE ()
	<COND
		(<NOT <MC-HERE? ,RM-OXFORD-ST>>
			<COND
				(<RT-VISIBLE? ,TH-GROWLER-CAB>
					<TELL CTHE ,TH-GROWLER-CAB " drives off." CR>
				)
			>
			<MOVE ,TH-GROWLER-CAB ,RM-OXFORD-ST>
			<RT-REMOVE-ALL ,TH-GROWLER-CAB>
			<MOVE ,CH-GROWLER-CABBIE ,TH-GROWLER-CAB>
			<SETG GL-NOW-LIT? <RT-IS-LIT?>>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-I-GROWLER-TO?"
;-----------------------------------------------------------------------------

<ROUTINE RT-I-GROWLER-TO? ()
	<COND
		(<IN? ,CH-PLAYER ,TH-GROWLER-CAB>
			<TELL CR
"Suddenly the cabbie - who seems to have a low threshold of boredom - pipes
up and says, \"I know where we can go!\"" CR CR

,K-WILD-RIDE-MSG CR CR
			>
			<RT-MOVE-GROWLER>
			<RT-ALARM-SET-REL ,RT-I-GROWLER-TO? <RT-PARM-SET 0 5 0>>
			<RT-DESC-ALL>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-MOVE-HANSOM"
;-----------------------------------------------------------------------------

<ROUTINE RT-MOVE-HANSOM ("OPTIONAL" (ROOM <>) MIN)
	<COND
		(<MC-HERE? .ROOM>
			<TELL "We're already here, guv." CR>
		)
		(<MC-T? .ROOM>
			<SETG GL-WHERE-TO-PROMPT? <>>
			<SETG GL-WHERE-TO-ORPH? <>>
			<MOVE ,TH-HANSOM-CAB .ROOM>
			<SET MIN <* <RT-CAB-DIST ,GL-PLACE-CUR .ROOM> ,K-HANSOM-TIME>>
			<SETG GL-PLACE-PRV ,GL-PLACE-CUR>
			<SETG GL-PLACE-CUR .ROOM>
;			<RT-ALARM-CLR ,RT-I-HANSOM-TO?>
			<TELL
"\"Right-o.\"" CR CR
			>
			<RT-ALARM-CLR ,RT-I-HANSOM-LEAVE>
			<COND
				(<IN? ,CH-PLAYER ,TH-HANSOM-CAB>
					<SETG GL-PUPPY-MSG? <>>
					<TELL "The cab speeds through the streets, ">
					<COND
						(<EQUAL? <RT-TIME-OF-DAY> 1 2 3>
							<TELL "deftly weaving in and out of the
jubilee traffic and ">
						)
					>
					<TELL "whizzing past famous landmarks. Only a few minutes
later, you arrive at your destination." CR CR
					>
					<RT-DESC-ALL>
				)
				(T
					<TELL
"The cab drives off." CR
					>
					<SETG GL-NOW-LIT? <RT-IS-LIT?>>
					<RT-ALARM-SET-REL ,RT-I-HANSOM-LEAVE <RT-PARM-SET 0 30 0>>
				)
			>
			<RT-CLOCK-JMP 0 .MIN 0>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-MOVE-GROWLER"
;-----------------------------------------------------------------------------

<ROUTINE RT-MOVE-GROWLER ("AUX" ROOM NUM MIN)
	<SET NUM <RANDOM 37>>
	<COND
		(<EQUAL? .NUM 1>
			<SET ROOM ,RM-AUDLEY-ST>
		)
		(<EQUAL? .NUM 2>
			<SET ROOM ,RM-221B-BAKER-ST>
		)
		(<EQUAL? .NUM 3>
			<SET ROOM ,RM-BIRDCAGE-WALK>
		)
		(<EQUAL? .NUM 4>
			<SET ROOM ,RM-BLIND-ALLEY>
		)
		(<EQUAL? .NUM 5>
			<SET ROOM ,RM-BROAD-SANCTUARY>
		)
		(<EQUAL? .NUM 6>
			<SET ROOM ,RM-BUCKINGHAM-PALACE-RD>
		)
		(<EQUAL? .NUM 7>
			<SET ROOM ,RM-CHEAPSIDE>
		)
		(<EQUAL? .NUM 8>
			<SET ROOM ,RM-COVENT-GARDEN>
		)
		(<EQUAL? .NUM 9>
			<SET ROOM ,RM-THE-EMBANKMENT>
		)
		(<EQUAL? .NUM 10>
			<SET ROOM ,RM-FLEET-STREET>
		)
		(<EQUAL? .NUM 11>
			<SET ROOM ,RM-GREAT-RUSSELL-ST>
		)
		(<EQUAL? .NUM 12>
			<SET ROOM ,RM-GROSVENOR-PLACE>
		)
		(<EQUAL? .NUM 13>
			<SET ROOM ,RM-HYDE-PARK-CORNER>
		)
		(<EQUAL? .NUM 14>
			<SET ROOM ,RM-KENSINGTON-GARDENS>
		)
		(<EQUAL? .NUM 15>
			<SET ROOM ,RM-KING-WILLIAM-ST>
		)
		(<EQUAL? .NUM 16>
			<SET ROOM ,RM-LONDON-BRIDGE>
		)
		(<EQUAL? .NUM 17>
			<SET ROOM ,RM-LOWER-THAMES-ST>
		)
		(<EQUAL? .NUM 18>
			<SET ROOM ,RM-THE-MALL>
		)
		(<EQUAL? .NUM 19>
			<SET ROOM ,RM-MARYLEBONE-RD>
		)
		(<EQUAL? .NUM 20>
			<SET ROOM ,RM-MONUMENT>
		)
		(<EQUAL? .NUM 21>
			<SET ROOM ,RM-NEW-OXFORD-ST>
		)
		(<EQUAL? .NUM 22>
			<SET ROOM ,RM-OXFORD-ST>
		)
		(<EQUAL? .NUM 23>
			<SET ROOM ,RM-ORCHARD-ST>
		)
		(<EQUAL? .NUM 24>
			<SET ROOM ,RM-PARLIAMENT-SQUARE>
		)
		(<EQUAL? .NUM 25>
			<SET ROOM ,RM-PINCHIN-LANE>
		)
		(<EQUAL? .NUM 26>
			<SET ROOM ,RM-QUEENS-GARDENS>
		)
		(<EQUAL? .NUM 27>
			<SET ROOM ,RM-ST-GILES-CIRCUS>
		)
		(<EQUAL? .NUM 28>
			<SET ROOM ,RM-THE-STRAND>
		)
		(<EQUAL? .NUM 29>
			<SET ROOM ,RM-THREADNEEDLE-ST>
		)
		(<EQUAL? .NUM 30>
			<SET ROOM ,RM-TOTTENHAM-COURT-RD>
		)
		(<EQUAL? .NUM 31>
			<SET ROOM ,RM-TOWER-ENTRANCE>
		)
		(<EQUAL? .NUM 32>
			<SET ROOM ,RM-TRAFALGAR-SQUARE>
		)
		(<EQUAL? .NUM 33>
			<SET ROOM ,RM-UPPER-THAMES-ST>
		)
		(<EQUAL? .NUM 34>
			<SET ROOM ,RM-VICTORIA-STREET>
		)
		(<EQUAL? .NUM 35>
			<SET ROOM ,RM-VICTORIA-SQUARE>
		)
		(<EQUAL? .NUM 36>
			<SET ROOM ,RM-WHITEHALL>
		)
		(<EQUAL? .NUM 37>
			<SET ROOM ,RM-YORK-PLACE>
		)
		(T
			<TELL "This is odd..." CR>
			<SET ROOM ,RM-KENSINGTON-GARDENS>
		)
	>
	<MOVE ,TH-GROWLER-CAB .ROOM>
	<SET MIN <* <RT-CAB-DIST ,GL-PLACE-CUR .ROOM> ,K-GROWLER-TIME>>
	<SETG GL-PLACE-PRV ,GL-PLACE-CUR>
	<SETG GL-PLACE-CUR .ROOM>
	<SETG GL-PUPPY-MSG? <>>
	<RT-CLOCK-JMP 0 .MIN 0>
>

;-----------------------------------------------------------------------------
; "RT-CF-TH-HANSOM-CAB"
;-----------------------------------------------------------------------------

<ROUTINE RT-CF-TH-HANSOM-CAB ("OPTIONAL" (CONTEXT <>) "AUX" WRD ADJ)
	<COND
		(<IN? ,CH-PLAYER ,TH-HANSOM-CAB>
			<SETG GL-WHERE-TO-PROMPT? T>
			<SETG GL-WHERE-TO-ORPH? T>
		)
	>
	<COND
		(<AND <MC-VERB? WALK>
				<EQUAL? ,GL-P-WALK-DIR ,P?OUT>
			>
			<RT-PERFORM ,V?EXIT ,TH-HANSOM-CAB>
		)
		(<OR	<AND
					<MC-VERB? WALK>
					<EQUAL? ,GL-WINNER ,CH-PLAYER>
				>
				<AND
					<MC-VERB? ENTER>
					<NOT <MC-PRSO? ,TH-HANSOM-CAB>>
				>
			>
			<RT-CYOU-MSG>
			<RT-WOULD-HAVE-TO-MSG "get out of" ,TH-HANSOM-CAB>
			<TELL "first." CR>
			<RTRUE>
		)
		(<MC-VERB? DRIVE>
			<SET WRD <GET ,GL-P-NAMW 0>>
			<SET ADJ <GET ,GL-P-ADJW 0>>
			<COND
				(<MC-PRSO? ,LG-AUDLEY-ST>
					<RT-MOVE-HANSOM ,RM-AUDLEY-ST>
				)
				(<MC-PRSO? ,LG-BAKER-ST ,LG-ENTRY-HALL>
					<RT-MOVE-HANSOM ,RM-221B-BAKER-ST>
				)
				(<MC-PRSO? ,LG-BIRDCAGE-WALK>
					<RT-MOVE-HANSOM ,RM-BIRDCAGE-WALK>
				)
				(<MC-PRSO? ,LG-BLIND-ALLEY ,LG-THE-SIGN-OF-THE-RED-HERRING>
					<RT-MOVE-HANSOM ,RM-BLIND-ALLEY>
				)
				(<MC-PRSO? ,LG-BROAD-SANCTUARY ,LG-ABBEY>
					<RT-MOVE-HANSOM ,RM-BROAD-SANCTUARY>
				)
				(<MC-PRSO? ,LG-BUCKINGHAM-PALACE-ROAD>
					<RT-MOVE-HANSOM ,RM-BUCKINGHAM-PALACE-RD>
				)
				(<MC-PRSO? ,LG-CHEAPSIDE>
					<RT-MOVE-HANSOM ,RM-CHEAPSIDE>
				)
				(<MC-PRSO? ,LG-COVENT-GARDEN>
					<RT-MOVE-HANSOM ,RM-COVENT-GARDEN>
				)
				(<MC-PRSO? ,LG-THE-EMBANKMENT ,LG-WATER>
					<RT-MOVE-HANSOM ,RM-THE-EMBANKMENT>
				)
				(<MC-PRSO? ,LG-FLEET-ST>
					<RT-MOVE-HANSOM ,RM-FLEET-STREET>
				)
				(<MC-PRSO? ,LG-GREAT-RUSSELL-ST ,LG-BRITISH-MUSEUM>
					<RT-MOVE-HANSOM ,RM-GREAT-RUSSELL-ST>
				)
				(<MC-PRSO? ,LG-GROSVENOR-PLACE>
					<RT-MOVE-HANSOM ,RM-GROSVENOR-PLACE>
				)
				(<MC-PRSO? ,LG-HYDE-PARK-CORNER>
					<RT-MOVE-HANSOM ,RM-HYDE-PARK-CORNER>
				)
				(<MC-PRSO? ,LG-KENSINGTON-GARDENS>
					<RT-MOVE-HANSOM ,RM-KENSINGTON-GARDENS>
				)
				(<MC-PRSO? ,LG-KING-WILLIAM-ST>
					<RT-MOVE-HANSOM ,RM-KING-WILLIAM-ST>
				)
				(<MC-PRSO? ,LG-LONDON-BRIDGE>
					<RT-MOVE-HANSOM ,RM-LONDON-BRIDGE>
				)
				(<MC-PRSO? ,LG-LOWER-THAMES-ST ,LG-BAR-OF-GOLD ,LG-SWAN-LANE>
					<RT-MOVE-HANSOM ,RM-LOWER-THAMES-ST>
				)
				(<MC-PRSO? ,LG-THE-MALL>
					<RT-MOVE-HANSOM ,RM-THE-MALL>
				)
				(<MC-PRSO? ,LG-MARYLEBONE-RD ,LG-TUSSAUDS>
					<RT-MOVE-HANSOM ,RM-MARYLEBONE-RD>
				)
				(<OR	<AND
							<EQUAL? .WRD ,W?MONUMENT>
							<EQUAL? .ADJ <>>
						>
						<MC-PRSO? ,LG-MONUMENT>
					>
					<RT-MOVE-HANSOM ,RM-MONUMENT>
				)
				(<MC-PRSO? ,LG-NEW-OXFORD-ST>
					<RT-MOVE-HANSOM ,RM-NEW-OXFORD-ST>
				)
				(<OR	<AND
							<EQUAL? .WRD ,W?STREET ,W?ST>
							<EQUAL? .ADJ ,W?OXFORD>
						>
						<MC-PRSO? ,LG-OXFORD-ST>
					>
					<RT-MOVE-HANSOM ,RM-OXFORD-ST>
				)
				(<MC-PRSO? ,LG-ORCHARD-ST>
					<RT-MOVE-HANSOM ,RM-ORCHARD-ST>
				)
				(<MC-PRSO? ,LG-PARLIAMENT-SQUARE ,LG-HOUSES-OF-PARLIAMENT ,TH-BELL>
					<RT-MOVE-HANSOM ,RM-PARLIAMENT-SQUARE>
				)
				(<MC-PRSO? ,LG-PINCHIN-LANE ,LG-SHERMANS-HOUSE>
					<RT-MOVE-HANSOM ,RM-PINCHIN-LANE>
				)
				(<MC-PRSO? ,LG-QUEENS-GARDENS ,LG-BUCKINGHAM-PALACE>
					<RT-MOVE-HANSOM ,RM-QUEENS-GARDENS>
				)
				(<MC-PRSO? ,LG-ST-GILES-CIRCUS>
					<RT-MOVE-HANSOM ,RM-ST-GILES-CIRCUS>
				)
				(<MC-PRSO? ,LG-STRAND>
					<RT-MOVE-HANSOM ,RM-THE-STRAND>
				)
				(<MC-PRSO? ,LG-THREADNEEDLE-ST ,LG-BANK>
					<RT-MOVE-HANSOM ,RM-THREADNEEDLE-ST>
				)
				(<MC-PRSO? ,LG-TOTTENHAM-COURT-RD>
					<RT-MOVE-HANSOM ,RM-TOTTENHAM-COURT-RD>
				)
				(<MC-PRSO? ,LG-TOWER-ENTRANCE ,LG-TOWER ,LG-DRAWBRIDGE>
					<RT-MOVE-HANSOM ,RM-TOWER-ENTRANCE>
				)
				(<MC-PRSO? ,LG-TRAFALGAR-SQUARE ,LG-DIOGENES-CLUB>
					<RT-MOVE-HANSOM ,RM-TRAFALGAR-SQUARE>
				)
				(<MC-PRSO? ,LG-UPPER-THAMES-ST>
					<RT-MOVE-HANSOM ,RM-UPPER-THAMES-ST>
				)
				(<MC-PRSO? ,LG-VICTORIA-ST>
					<RT-MOVE-HANSOM ,RM-VICTORIA-STREET>
				)
				(<MC-PRSO? ,LG-VICTORIA-SQUARE>
					<RT-MOVE-HANSOM ,RM-VICTORIA-SQUARE>
				)
				(<MC-PRSO? ,LG-WHITEHALL ,LG-SCOTLAND-YARD>
					<RT-MOVE-HANSOM ,RM-WHITEHALL>
				)
				(<MC-PRSO? ,LG-YORK-PLACE>
					<RT-MOVE-HANSOM ,RM-YORK-PLACE>
				)
			>
		)
		(<MC-VERB? STAND STAND-ON LEAP>
			<TELL ,K-ENOUGH-ROOM-MSG CR>
			<RTRUE>
		)
		(<MC-VERB? SIT>
			<TELL "You're already seated." CR>
			<RTRUE>
		)
		(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
			<COND
				(<MC-PRSO? <> ,ROOMS>
					T
				)
				(<IN? ,GL-PRSO ,GLOBAL-OBJECTS>
					T
				)
				(<NOT <RT-META-IN? ,GL-PRSO ,TH-HANSOM-CAB>>
					<RT-CYOU-MSG>
					<TELL "cannot reach " THEO "." CR>
					<RTRUE>
				)
			>
			<COND
				(<MC-PRSI? <> ,ROOMS>
					<RFALSE>
				)
				(<IN? ,GL-PRSI ,GLOBAL-OBJECTS>
					<RFALSE>
				)
				(<NOT <RT-META-IN? ,GL-PRSI ,TH-HANSOM-CAB>>
					<RT-CYOU-MSG>
					<TELL "cannot reach " THEI "." CR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-CF-TH-GROWLER-CAB"
;-----------------------------------------------------------------------------

<ROUTINE RT-CF-TH-GROWLER-CAB ("OPTIONAL" (CONTEXT <>))
	<COND
		(<IN? ,CH-PLAYER ,TH-GROWLER-CAB>
			<SETG GL-WHERE-TO-PROMPT? T>
			<SETG GL-WHERE-TO-ORPH? T>
		)
	>
	<COND
		(<AND <MC-VERB? WALK>
				<EQUAL? ,GL-P-WALK-DIR ,P?OUT>
			>
			<RT-PERFORM ,V?EXIT ,TH-GROWLER-CAB>
		)
		(<OR	<AND
					<MC-VERB? WALK>
					<EQUAL? ,GL-WINNER ,CH-PLAYER>
				>
				<AND
					<MC-VERB? ENTER>
					<NOT <MC-PRSO? ,TH-GROWLER-CAB>>
				>
			>
			<RT-CYOU-MSG>
			<RT-WOULD-HAVE-TO-MSG "get out of" ,TH-GROWLER-CAB>
			<TELL "first." CR>
			<RTRUE>
		)
		(<MC-VERB? DRIVE>
			<TELL
"\"Oh good! I've never been THERE before.\"" CR CR
			>
			<SETG GL-WHERE-TO-PROMPT? <>>
			<SETG GL-WHERE-TO-ORPH? <>>
			<RT-MOVE-GROWLER>
			<RT-ALARM-CLR ,RT-I-GROWLER-TO?>
			<RT-ALARM-CLR ,RT-I-GROWLER-LEAVE>
			<COND
				(<IN? ,CH-PLAYER ,TH-GROWLER-CAB>
					<SETG GL-PUPPY-MSG? <>>
					<TELL ,K-WILD-RIDE-MSG CR CR>
					<RT-ALARM-SET-REL ,RT-I-GROWLER-TO? <RT-PARM-SET 0 5 0>>
					<RT-DESC-ALL>
				)
				(T
					<TELL "The cab drives off." CR>
					<SETG GL-NOW-LIT? <RT-IS-LIT?>>
					<RT-ALARM-SET-REL ,RT-I-GROWLER-LEAVE <RT-PARM-SET 0 30 0>>
				)
			>
			<RTRUE>
		)
		(<MC-VERB? STAND STAND-ON LEAP>
			<TELL ,K-ENOUGH-ROOM-MSG CR>
			<RTRUE>
		)
		(<MC-VERB? SIT>
			<TELL "You're already seated." CR>
			<RTRUE>
		)
		(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
			<COND
				(<MC-PRSO? <> ,ROOMS>
					T
				)
				(<IN? ,GL-PRSO ,GLOBAL-OBJECTS>
					T
				)
				(<NOT <RT-META-IN? ,GL-PRSO ,TH-GROWLER-CAB>>
					<RT-CYOU-MSG>
					<TELL "cannot reach " THEO "." CR>
					<RTRUE>
				)
			>
			<COND
				(<MC-PRSI? <> ,ROOMS>
					<RFALSE>
				)
				(<IN? ,GL-PRSI ,GLOBAL-OBJECTS>
					<RFALSE>
				)
				(<NOT <RT-META-IN? ,GL-PRSI ,TH-HANSOM-CAB>>
					<RT-CYOU-MSG>
					<TELL "cannot reach " THEI "." CR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-BLOW-WHISTLE"
;-----------------------------------------------------------------------------

<ROUTINE RT-BLOW-WHISTLE ("AUX" WHO WHO2 L)
	<COND
		(<MC-HERE? <LOC ,TH-HANSOM-CAB> <LOC ,TH-GROWLER-CAB>>
			<TELL ,K-CAB-HERE-MSG CR>
		)
		(T
			<TELL "Tweeeeeeeeee!" CR>
			<COND
				(<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
					<SET WHO <RT-ANYONE-HERE?>>
					<COND
						(<MC-IS? .WHO ,FL-ASLEEP>
							<COND
								(<EQUAL? .WHO ,CH-HOLMES>
									<TELL ,K-HOLMES-DISTRACTION-MSG CR>
								)
							>
						)
						(<MC-T? .WHO>
							<SET L <LOC .WHO>>
							<REMOVE .WHO>
							<SET WHO2 <RT-ANYONE-HERE?>>
							<COND
								(<AND .WHO2
										<MC-ISNOT? .WHO2 ,FL-ASLEEP>
									>
									<TELL "Everyone holds their hands to their ">
								)
								(T
									<TELL CTHE .WHO " holds ">
									<RT-YOUR-MSG .WHO>
									<TELL "hands to ">
									<RT-YOUR-MSG .WHO>
								)
							>
							<MOVE .WHO .L>
							<TELL "ears and glares at you." CR>
						)
					>
				)
				(<NOT <MC-HERE?
							,RM-TOWER-GREEN
							,RM-OUTER-WARD
							,RM-BYWARD-TOWER
							,RM-INSIDE-TRAITORS-GATE
							,RM-OUTSIDE-TRAITORS-GATE
							,RM-DRAWBRIDGE
							,RM-THAMES-ONE
							,RM-THAMES-TWO
							,RM-THAMES-THREE
							,RM-THAMES-FOUR
							,RM-THAMES-FIVE
							,RM-SWAN-LANE
						>
					>
					<PUTP ,TH-CAB-WHISTLE ,P?AUX1
						<+ <GETP ,TH-CAB-WHISTLE ,P?AUX1> 1>
					>
					<PUTP ,TH-CAB-WHISTLE ,P?AUX2 ,GL-PLACE-CUR>
					<COND
						(<NOT <RT-ALARM-SET? ,RT-I-CAB-ARRIVE>>
							<RT-ALARM-SET-REL ,RT-I-CAB-ARRIVE <RT-PARM-SET 0 1 0>>
						)
					>
				)
			>
		)
	>
	<RTRUE>
>

;*****************************************************************************
; "THINGS1.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "TH-HANSOM-CAB"
;-----------------------------------------------------------------------------

<OBJECT TH-HANSOM-CAB
	(LOC RM-VICTORIA-SQUARE)
   (DESC "hansom cab")
   (FLAGS FL-VEHICLE FL-CONTAINER FL-TRYTAKE FL-OPENED FL-LIGHTED)
   (SYNONYM CAB)
   (ADJECTIVE HANSOM)
   (CAPACITY 999)
	(AUX1 0)		;"Called before?"
	(AUX2 0)		;"Waiting?"
   (ACTION RT-AC-TH-HANSOM-CAB)
   (DESCFCN RT-DF-TH-HANSOM-CAB)
	(CONTFCN RT-CF-TH-HANSOM-CAB)
>

;-----------------------------------------------------------------------------
; "TH-GROWLER-CAB"
;-----------------------------------------------------------------------------

<OBJECT TH-GROWLER-CAB
	(LOC RM-OXFORD-ST)
   (DESC "growler cab")
   (FLAGS FL-VEHICLE FL-CONTAINER FL-TRYTAKE FL-OPENED FL-LIGHTED)
   (SYNONYM CAB)
   (ADJECTIVE GROWLER)
   (CAPACITY 999)
	(AUX1 0)		; "Called before?"
   (ACTION RT-AC-TH-GROWLER-CAB)
   (DESCFCN RT-DF-TH-GROWLER-CAB)
	(CONTFCN RT-CF-TH-GROWLER-CAB)
>

;-----------------------------------------------------------------------------
; "TH-CAB-WHISTLE"
;-----------------------------------------------------------------------------

<OBJECT TH-CAB-WHISTLE
	(LOC CH-PLAYER)
   (DESC "whistle")
   (FLAGS FL-TAKEABLE FL-CLOTHING FL-WORN)
   (SYNONYM WHISTLE)
   (SIZE 1)
   (MASS 1)
	(AUX1 0)		; "Number of whistle blows"
	(AUX2 0)		; "Place for cab to arrive"
   (ACTION RT-AC-TH-CAB-WHISTLE)
   (DESCFCN RT-DF-TH-CAB-WHISTLE)
>

;*****************************************************************************
; "THINGS2.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-AC-TH-HANSOM-CAB"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-HANSOM-CAB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-HANSOM-CAB">
		)
		(T
		)
	>
	<COND
		(<AND <MC-VERB? ENTER>
				<MC-PRSO? ,ROOMS ,TH-HANSOM-CAB>
			>
			<COND
				(<MC-IS? ,TH-SUIT-OF-ARMOUR ,FL-WORN>
					<TELL ,K-HEAVY-ARMOUR-MSG CR>
				)
				(<NOT <IN? ,GL-WINNER ,TH-HANSOM-CAB>>
					<MOVE ,GL-WINNER ,TH-HANSOM-CAB>
					<COND
						(<AND <MC-T? ,GL-PUPPY>
								<EQUAL? ,GL-WINNER ,CH-PLAYER>
							>
							<MOVE ,GL-PUPPY ,TH-HANSOM-CAB>
							<TELL "You and " THE ,GL-PUPPY " get ">
						)
						(T
							<RT-CYOU-MSG "get" "gets">
						)
					>
					<MC-MAKE ,TH-HANSOM-CAB ,FL-NODESC>
					<RT-ALARM-CLR ,RT-I-HANSOM-LEAVE>
					<PUTP ,TH-HANSOM-CAB ,P?AUX2 0>
;					<RT-ALARM-SET-REL ,RT-I-HANSOM-TO? <RT-PARM-SET 0 5 0>>
					<SETG GL-WHERE-TO-PROMPT? T>
					<SETG GL-WHERE-TO-ORPH? T>
					<TELL "into the cab." CR>
				)
			>
		)
		(<AND <MC-VERB? EXIT>
				<MC-PRSO? ,ROOMS ,TH-HANSOM-CAB>
			>
			<COND
				(<IN? ,CH-PLAYER ,TH-HANSOM-CAB>
					<MOVE ,GL-WINNER ,GL-PLACE-CUR>
					<COND
						(<AND <MC-T? ,GL-PUPPY>
								<EQUAL? ,GL-WINNER ,CH-PLAYER>
							>
							<MOVE ,GL-PUPPY ,GL-PLACE-CUR>
							<TELL "You and " THE ,GL-PUPPY " get ">
						)
						(T
							<RT-CYOU-MSG "get" "gets">
						)
					>
					<TELL "out of the cab.">
					<MC-UNMAKE ,TH-HANSOM-CAB ,FL-NODESC>
					<COND
						(<AND	<ZERO? <GETP ,TH-HANSOM-CAB ,P?AUX2>>
								<NOT <IN? ,CH-PLAYER ,TH-HANSOM-CAB>>
								<OR
									<MC-F? ,GL-PUPPY>
									<NOT <IN? ,GL-PUPPY ,TH-HANSOM-CAB>>
								>
								<NOT <MC-HERE? ,RM-VICTORIA-SQUARE>>
							>
							<TELL " After">
							<RT-YOU-MSG "get" "gets">
							<TELL "out, it drives off.">
							<MOVE ,TH-HANSOM-CAB ,RM-VICTORIA-SQUARE>
							<RT-REMOVE-ALL ,TH-HANSOM-CAB>
							<MOVE ,CH-HANSOM-CABBIE ,TH-HANSOM-CAB>
							<RT-ALARM-CLR ,RT-I-HANSOM-LEAVE>
;							<RT-ALARM-CLR ,RT-I-HANSOM-TO?>
							<SETG GL-NOW-LIT? <RT-IS-LIT?>>
						)
					>
					<SETG GL-WHERE-TO-PROMPT? <>>
					<SETG GL-WHERE-TO-ORPH? <>>
					<CRLF>
				)
			>
		)
		(<MC-VERB? LOOK-ON>
			<TELL "There is a cab driver sitting on the hansom." CR>
		)
		(<AND <MC-VERB? TAKE PUSH-TO>
				<MC-THIS-PRSO?>
			>
			<TELL ,K-TAKE-CAB-MSG CR>
			<MC-RFATAL>
		)
		(<MC-VERB? SHOOT>
			<RT-WASTE-OF-BULLETS-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-GROWLER-CAB"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-GROWLER-CAB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-GROWLER-CAB">
		)
		(T
		)
	>
	<COND
		(<AND <MC-VERB? ENTER>
				<MC-PRSO? ,ROOMS ,TH-GROWLER-CAB>
			>
			<COND
				(<MC-IS? ,TH-SUIT-OF-ARMOUR ,FL-WORN>
					<TELL ,K-HEAVY-ARMOUR-MSG CR>
				)
				(<NOT <IN? ,GL-WINNER ,TH-GROWLER-CAB>>
					<MOVE ,GL-WINNER ,TH-GROWLER-CAB>
					<COND
						(<AND <MC-T? ,GL-PUPPY>
								<EQUAL? ,GL-WINNER ,CH-PLAYER>
							>
							<MOVE ,GL-PUPPY ,TH-GROWLER-CAB>
							<TELL "You and " THE ,GL-PUPPY " get ">
						)
						(T
							<RT-CYOU-MSG "get" "gets">
						)
					>
					<MC-MAKE ,TH-GROWLER-CAB ,FL-NODESC>
					<RT-ALARM-CLR ,RT-I-GROWLER-LEAVE>
					<RT-ALARM-SET-REL ,RT-I-GROWLER-TO? <RT-PARM-SET 0 5 0>>
					<SETG GL-WHERE-TO-PROMPT? T>
					<SETG GL-WHERE-TO-ORPH? T>
					<TELL "into the cab." CR>
				)
			>
		)
		(<AND <MC-VERB? EXIT>
				<MC-PRSO? ,ROOMS ,TH-GROWLER-CAB>
			>
			<COND
				(<IN? ,CH-PLAYER ,TH-GROWLER-CAB>
					<MOVE ,GL-WINNER ,GL-PLACE-CUR>
					<COND
						(<AND <MC-T? ,GL-PUPPY>
								<EQUAL? ,GL-WINNER ,CH-PLAYER>
							>
							<MOVE ,GL-PUPPY ,GL-PLACE-CUR>
							<TELL "You and " THE ,GL-PUPPY " get ">
						)
						(T
							<RT-CYOU-MSG "get" "gets">
						)
					>
					<TELL "out of the cab.">
					<MC-UNMAKE ,TH-GROWLER-CAB ,FL-NODESC>
					<COND
						(<AND	<NOT <IN? ,CH-PLAYER ,TH-GROWLER-CAB>>
								<OR
									<MC-F? ,GL-PUPPY>
									<NOT <IN? ,GL-PUPPY ,TH-GROWLER-CAB>>
								>
								<NOT <MC-HERE? ,RM-OXFORD-ST>>
							>
							<TELL " After">
							<RT-YOU-MSG "get" "gets">
							<TELL "out, it drives off.">
							<MOVE ,TH-GROWLER-CAB ,RM-OXFORD-ST>
							<RT-REMOVE-ALL ,TH-GROWLER-CAB>
							<MOVE ,CH-GROWLER-CABBIE ,TH-GROWLER-CAB>
							<RT-ALARM-CLR ,RT-I-GROWLER-LEAVE>
							<RT-ALARM-CLR ,RT-I-GROWLER-TO?>
							<SETG GL-NOW-LIT? <RT-IS-LIT?>>
						)
					>
					<SETG GL-WHERE-TO-PROMPT? <>>
					<SETG GL-WHERE-TO-ORPH? <>>
					<CRLF>
				)
			>
		)
		(<MC-VERB? LOOK-ON>
			<TELL "There is a cab driver sitting on the growler." CR>
		)
		(<AND <MC-VERB? TAKE PUSH-TO>
				<MC-THIS-PRSO?>
			>
			<TELL ,K-TAKE-CAB-MSG CR>
			<MC-RFATAL>
		)
		(<MC-VERB? SHOOT>
			<RT-WASTE-OF-BULLETS-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-CAB-WHISTLE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-CAB-WHISTLE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-CAB-WHISTLE">
		)
		(T
		)
	>
	<COND
		(<AND <MC-VERB? BLOW-INTO>
				<MC-THIS-PRSO?>
			>
			<RT-BLOW-WHISTLE>
		)
		(<AND	<MC-VERB? CALL>
				<MC-THIS-PRSI?>
			>
			<COND
				(<MC-PRSO? ,TH-HANSOM-CAB>
					<RT-BLOW-WHISTLE>
					<COND
						(<RT-ALARM-SET? ,RT-I-CAB-ARRIVE>
							<RT-CLOCK-INC-SET 0 2 0>
							<RT-BLOW-WHISTLE>
						)
					>
					<RTRUE>
				)
				(<MC-PRSO? ,TH-GROWLER-CAB>
					<RT-BLOW-WHISTLE>
					<COND
						(<RT-ALARM-SET? ,RT-I-CAB-ARRIVE>
							<RT-CLOCK-INC-SET 0 2 0>
						)
					>
					<RTRUE>
				)
				(<EQUAL? <GET ,GL-P-NAMW 0> ,W?CAB>
					<RT-BLOW-WHISTLE>
				)
				(T
					<RT-CYOU-MSG>
					<TELL "can't " VW " " AO " with " THEI "." CR>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-WASTE-OF-BULLETS-MSG>
		)
	>
>

;*****************************************************************************
; "THINGS3.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-DF-TH-HANSOM-CAB"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-HANSOM-CAB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-HANSOM-CAB">
		)
		(T
		)
	>
	<TELL
"It is a small cab with two wheels and room for only two persons,
drawn by a single horse." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-GROWLER-CAB"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-GROWLER-CAB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-GROWLER-CAB">
		)
		(T
		)
	>
	<TELL
"It is a large cab with four wheels and room for four persons,
drawn by a single horse." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-CAB-WHISTLE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-CAB-WHISTLE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-CAB-WHISTLE">
		)
		(T
		)
	>
	<RFALSE>
>

;*****************************************************************************
; "CONSTANTS"
;*****************************************************************************

<CONSTANT K-ENOUGH-ROOM-MSG
"There isn't enough room in the cab to do that."
>

<CONSTANT K-HOLMES-DISTRACTION-MSG
"Holmes ignores the distraction and resumes staring at the phial."
>

<CONSTANT K-WILD-RIDE-MSG
"After a wild ride through the streets of London, the cab finally careens
to a halt and the cabbie says brightly, \"Here we are!\""
>

;*****************************************************************************
; "end of file"
;*****************************************************************************
