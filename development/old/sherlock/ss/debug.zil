;*****************************************************************************
; "game : SHERLOCK!"
; "file : DEBUG.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   15 Oct 1987 21:00:18  $"
; "rev  : $Revision:   1.16  $"
; "vers : 1.00"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "Include debug code?"
;-----------------------------------------------------------------------------

<COND
	(,GL-DEBUG?

;*****************************************************************************
; "debug constants"
;*****************************************************************************

;*****************************************************************************
; "debug globals"
;*****************************************************************************

<GLOBAL GL-SPACES-40 "                                        ">
 
;-----------------------------------------------------------------------------
; "GL-IT-DIRS"
;-----------------------------------------------------------------------------

<GLOBAL GL-IT-DIRS:TABLE
	<PTABLE
		P?NORTH
		P?NE
		P?EAST
		P?SE
		P?SOUTH
		P?SW
		P?WEST
		P?NW
		P?UP
		P?DOWN
		P?IN
		P?OUT
	>
>

;*****************************************************************************
; "debug support routines"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-CONTEXT-STR"
;-----------------------------------------------------------------------------
			
<ROUTINE RT-CONTEXT-STR (CONTEXT "AUX" STR)
	<COND
		(<EQUAL? .CONTEXT 0>
			<SET STR "None">
		)
		(<EQUAL? .CONTEXT 1>
			<SET STR "Begin">
		)
		(<EQUAL? .CONTEXT 2>
			<SET STR "Entering">
		)
		(<EQUAL? .CONTEXT 3>
			<SET STR "Entered">
		)
		(<EQUAL? .CONTEXT 4>
			<SET STR "Exiting">
		)
		(<EQUAL? .CONTEXT 5>
			<SET STR "End">
		)
		(<EQUAL? .CONTEXT 6>
			<SET STR "FLook">
		)
		(<EQUAL? .CONTEXT 7>
			<SET STR "NLook">
		)
		(<EQUAL? .CONTEXT 8>
			<SET STR "Winner">
		)
		(<EQUAL? .CONTEXT 9>
			<SET STR "CONTAINER">
		)
		(<EQUAL? .CONTEXT 10>
			<SET STR "Object Desc">
		)
		(<EQUAL? .CONTEXT 99>
			<SET STR "Fatal">
		)
		(T
			<SET STR "???">
		)
	>
	<RETURN .STR>
>

;-----------------------------------------------------------------------------
; "RT-DIRECTION-STR"
;-----------------------------------------------------------------------------
			
<ROUTINE RT-DIRECTION-STR (DIRECTION "AUX" STR)
	<COND
		(<EQUAL? .DIRECTION 1>
			<SET STR "N">
		)
		(<EQUAL? .DIRECTION 2>
			<SET STR "NE">
		)
		(<EQUAL? .DIRECTION 3>
			<SET STR "E">
		)
		(<EQUAL? .DIRECTION 4>
			<SET STR "SE">
		)
		(<EQUAL? .DIRECTION 5>
			<SET STR "S">
		)
		(<EQUAL? .DIRECTION 6>
			<SET STR "SW">
		)
		(<EQUAL? .DIRECTION 7>
			<SET STR "W">
		)
		(<EQUAL? .DIRECTION 8>
			<SET STR "NW">
		)
		(<EQUAL? .DIRECTION 9>
			<SET STR "UP">
		)
		(<EQUAL? .DIRECTION 10>
			<SET STR "DOWN">
		)
		(<EQUAL? .DIRECTION 11>
			<SET STR "IN">
		)
		(<EQUAL? .DIRECTION 12>
			<SET STR "OUT">
		)
		(T
			<SET STR "???">
		)
	>
	<RETURN .STR>
>

;-----------------------------------------------------------------------------
; "RT-SAY-WORD"
;-----------------------------------------------------------------------------

<ROUTINE RT-SAY-WORD (WORD)
	<COND
		(<MC-F? .WORD>
			<TELL "...">
		)
		(T
			<PRINTB .WORD>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-SAY-IT"
;-----------------------------------------------------------------------------

<ROUTINE RT-SAY-IT (OBJ "AUX" (CNT 0))
	<REPEAT ()
		<COND
			(<EQUAL? .CNT 12>
				<RETURN>
			)
			(<EQUAL? .OBJ <GET ,GL-IT-DIRS .CNT>>
				<TELL <RT-DIRECTION-STR .OBJ>>
				<RTRUE>
			)
		>
		<INC CNT>
	>
	<COND
		(<EQUAL? .OBJ ,ROOMS>
			<TELL "Rooms">
		)
		(<MC-T? .OBJ>
			<TELL D .OBJ>
		)
		(T
			<TELL "...">
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DEBUG-PARSER"
;-----------------------------------------------------------------------------

<ROUTINE RT-DEBUG-PARSER (VERBSTR)
	<COND
		(<MC-T? ,GL-DEBUG-FLAG>
			<BUFOUT <>>
			<SCREEN ,K-S-WIN>

			<CURSET 1 1>
			<TELL ,GL-SPACES-40>
			<CURSET 2 1>
			<TELL ,GL-SPACES-40>
			<CURSET 3 1>
			<TELL ,GL-SPACES-40>
			<CURSET 4 1>
			<TELL ,GL-SPACES-40>
			<CURSET 5 1>
			<TELL ,GL-SPACES-40>
			<CURSET 6 1>
			<TELL ,GL-SPACES-40>
			<CURSET 7 1>
			<TELL ,GL-SPACES-40>
			<CURSET 8 1>
			<TELL ,GL-SPACES-40>
			<CURSET 9 1>
			<TELL ,GL-SPACES-40>
			<CURSET 10 1>
			<TELL ,GL-SPACES-40>
			<CURSET 11 1>
			<TELL ,GL-SPACES-40>

			<CURSET 1 1>
			<TELL "VERB  :">
			<TELL .VERBSTR>

			<CURSET 2 1>
			<TELL "MULT? :">
			<COND
				(<MC-F? ,GL-P-MULT?>
					<TELL "F">
				)
				(T 
					<TELL "T">
				)
			>

			<CURSET 3 1>
			<TELL "WINNER:">
			<RT-SAY-IT ,GL-WINNER>

			<CURSET 4 1>
			<TELL "DIR   :">
			<RT-SAY-WORD ,GL-P-DIR-WORD>

			<CURSET 5 1>
			<TELL "PRSO  :">
			<RT-SAY-IT ,GL-PRSO>

			<CURSET 6 1>
			<TELL "PRSI  :">
			<RT-SAY-IT ,GL-PRSI>

			<CURSET 7 1>
			<TELL "A-WORD:">
			<RT-SAY-WORD ,GL-P-PRSA-WORD>

			<CURSET 8 1>
			<TELL "O-ADJ :">
			<RT-SAY-WORD <GET ,GL-P-ADJW 0>>

			<CURSET 9 1>
			<TELL "O-NOUN:">
			<RT-SAY-WORD <GET ,GL-P-NAMW 0>>

			<CURSET 10 1>
			<TELL "I-ADJ :">
			<RT-SAY-WORD <GET ,GL-P-ADJW 1>>

			<CURSET 11 1>
			<TELL "I-NOUN:">
			<RT-SAY-WORD <GET ,GL-P-NAMW 1>>

			<SCREEN ,K-S-NOR>
			<BUFOUT T>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DEBUG-XX-XX"
;-----------------------------------------------------------------------------

<ROUTINE RT-DEBUG-XX-XX (STR1 STR2 CONTEXT "AUX" STR3)
	<COND
		(<MC-T? ,GL-DEBUG-FLAG>
			<BUFOUT <>>
			<SCREEN ,K-S-WIN>

			<SET STR3 <RT-CONTEXT-STR .CONTEXT>>

			<CURSET 1 41>
			<TELL ,GL-SPACES-40>
			<CURSET 2 41>
			<TELL ,GL-SPACES-40>

			<CURSET 1 41>
			<TELL .STR1  ":" .STR2>
			<CURSET 2 41>
			<TELL "Cntx" ":" .STR3>

			<SCREEN ,K-S-NOR>
			<BUFOUT T>
		)
	>
	<RFALSE>
>

;*****************************************************************************
; "debug routines"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-DEBUG-PRE-VERB"
;-----------------------------------------------------------------------------

<ROUTINE RT-DEBUG-PRE-VERB (VERBSTR)
	<RT-DEBUG-PARSER .VERBSTR>
>

;-----------------------------------------------------------------------------
; "RT-DEBUG-VERB"
;-----------------------------------------------------------------------------

<ROUTINE RT-DEBUG-VERB (VERBSTR)
	<RT-DEBUG-PARSER .VERBSTR>
>

;-----------------------------------------------------------------------------
; "RT-DEBUG-OB-AC"
;-----------------------------------------------------------------------------

<ROUTINE RT-DEBUG-OB-AC (STR1 "OPTIONAL" (CONTEXT 0))
	<RT-DEBUG-XX-XX "OBAC" .STR1 .CONTEXT>
>

;-----------------------------------------------------------------------------
; "RT-DEBUG-OB-DF"
;-----------------------------------------------------------------------------

<ROUTINE RT-DEBUG-OB-DF (STR1 "OPTIONAL" (CONTEXT 0))
	<RT-DEBUG-XX-XX "OBDF" .STR1 .CONTEXT>
>

;-----------------------------------------------------------------------------
; "RT-DEBUG-RM-AC"
;-----------------------------------------------------------------------------

<ROUTINE RT-DEBUG-RM-AC (STR1 "OPTIONAL" (CONTEXT 0))
	<RT-DEBUG-XX-XX "RMAC" .STR1 .CONTEXT>
>

;-----------------------------------------------------------------------------
; "RT-DEBUG-RM-DF"
;-----------------------------------------------------------------------------

<ROUTINE RT-DEBUG-RM-DF (STR1 "OPTIONAL" (CONTEXT 0))
	<RT-DEBUG-XX-XX "RMDF" .STR1 .CONTEXT>
>

;-----------------------------------------------------------------------------
; "RT-DEBUG-LG-AC"
;-----------------------------------------------------------------------------

<ROUTINE RT-DEBUG-LG-AC (STR1 "OPTIONAL" (CONTEXT 0))
	<RT-DEBUG-XX-XX "LGAC" .STR1 .CONTEXT>
>

;-----------------------------------------------------------------------------
; "RT-DEBUG-LG-DF"
;-----------------------------------------------------------------------------

<ROUTINE RT-DEBUG-LG-DF (STR1 "OPTIONAL" (CONTEXT 0))
	<RT-DEBUG-XX-XX "LGDF" .STR1 .CONTEXT>
>

;-----------------------------------------------------------------------------
; "RT-DEBUG-TH-AC"
;-----------------------------------------------------------------------------

<ROUTINE RT-DEBUG-TH-AC (STR1 "OPTIONAL" (CONTEXT 0))
	<RT-DEBUG-XX-XX "THAC" .STR1 .CONTEXT>
>

;-----------------------------------------------------------------------------
; "RT-DEBUG-TH-DF"
;-----------------------------------------------------------------------------

<ROUTINE RT-DEBUG-TH-DF (STR1 "OPTIONAL" (CONTEXT 0))
	<RT-DEBUG-XX-XX "THDF" .STR1 .CONTEXT>
>

;-----------------------------------------------------------------------------
; "RT-DEBUG-CH-AC"
;-----------------------------------------------------------------------------

<ROUTINE RT-DEBUG-CH-AC (STR1 "OPTIONAL" (CONTEXT 0))
	<RT-DEBUG-XX-XX "CHAC" .STR1 .CONTEXT>
>

;-----------------------------------------------------------------------------
; "RT-DEBUG-CH-DF"
;-----------------------------------------------------------------------------

<ROUTINE RT-DEBUG-CH-DF (STR1 "OPTIONAL" (CONTEXT 0))
	<RT-DEBUG-XX-XX "CHDF" .STR1 .CONTEXT>
>

;*****************************************************************************
; "debug verbs - syntax"
;*****************************************************************************

<SYNTAX XEDEBUG = V-ENB-DEBUG>
<SYNTAX $EDEBUG = V-ENB-DEBUG>
<SYNTAX XDDEBUG = V-REFRESH>
<SYNTAX $DDEBUG = V-REFRESH>

;-----------------------------------------------------------------------------
; "End of COND"
;-----------------------------------------------------------------------------

	)
	(T
	)
>

<SYNTAX XGETLIT = V-GETLIT>
<SYNTAX $GETLIT = V-GETLIT>
<SYNTAX XGONAVE = V-GONAVE>
<SYNTAX $GONAVE = V-GONAVE>
<SYNTAX XGOLAIR = V-GOLAIR>
<SYNTAX $GOLAIR = V-GOLAIR>
<SYNTAX XGOGOLD = V-GOGOLD>
<SYNTAX $GOGOLD = V-GOGOLD>
<SYNTAX XGOBAR  = V-GOGOLD>
<SYNTAX $GOBAR  = V-GOGOLD>
<SYNTAX XGOBANK = V-GOBANK>
<SYNTAX $GOBANK = V-GOBANK>
<SYNTAX XGOCLUB = V-GOCLUB>
<SYNTAX $GOCLUB = V-GOCLUB>
<SYNTAX XGOLIZA = V-GOLIZA>
<SYNTAX $GOLIZA = V-GOLIZA>
<SYNTAX XGOTOWR = V-GOTOWR>
<SYNTAX $GOTOWR = V-GOTOWR>

<SYNTAX $REFRESH = V-REFRESH>
<SYNTAX \#COMMAND = V-COMMAND>
<SYNTAX $VERIFY = V-VERIFY>

;*****************************************************************************
; "debug verb routines"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "V-COMMAND"
;-----------------------------------------------------------------------------

<ROUTINE V-COMMAND ()
	<COND
		(<RT-IS-CHAR-NOT-PLAYER?>
			<MC-RFATAL>
		)
		(T
			<DIRIN 1>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-VERIFY"
;-----------------------------------------------------------------------------

<SYNTAX XVERIFY OBJECT = V-VERIFY>
<SYNTAX $VERIFY OBJECT = V-VERIFY>

<ROUTINE V-VERIFY ()
	<COND
		(<MC-T? ,GL-PRSO>
			<COND
				(<AND
					<MC-PRSO? TH-INTNUM>
	            <EQUAL? ,GL-P-NUMBER 87>
					>
               <TELL N ,SERIAL CR>
					<RTRUE>
				)
				(T
					<TELL ,K-DONT-UNDERSTAND-MSG CR>
				)
			>
			<RTRUE>
		)
	>
	<TELL "Verifying File" CR CR>
	<COND
		(<VERIFY> 
			<TELL "Verify successful" CR>
		)
		(T
			<TELL "Verify failed" CR>
		)
	>
	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "V-REFRESH"
;-----------------------------------------------------------------------------

<ROUTINE V-REFRESH ()
	<SETG GL-DEBUG-FLAG <>>

	<SETG GL-SPLIT-ROW  1>

	<SETG GL-SCORE-STS -1>
	<SETG GL-MOVES-STS -1>
	<SETG GL-PLACE-STS -1>

	<RT-INIT-SCREEN>
	<RT-UPDATE-STATUS-LINE>
	<RT-DESC-ALL <> T>

	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "Include debug code?"
;-----------------------------------------------------------------------------

<COND
	(,GL-DEBUG?

;-----------------------------------------------------------------------------
; "V-ENB-DEBUG"
;-----------------------------------------------------------------------------

<ROUTINE V-ENB-DEBUG ()
	<SETG GL-SPLIT-ROW 12>

	<SETG GL-SCORE-STS -1>
	<SETG GL-MOVES-STS -1>
	<SETG GL-PLACE-STS -1>

	<RT-INIT-SCREEN>
	<RT-UPDATE-STATUS-LINE>
	<RT-DESC-ALL>

	<SETG GL-DEBUG-FLAG T>
	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "End of COND"
;-----------------------------------------------------------------------------

	)
	(T
	)
>

;-----------------------------------------------------------------------------
; "V-GETLIT"
;-----------------------------------------------------------------------------

<ROUTINE V-GETLIT ()
	<TELL
"Poof! You now have \"the lamp\" and it is lit." CR CR
	>

	<MOVE ,TH-LAMP ,CH-PLAYER>

	<MC-MAKE ,TH-LAMP ,FL-LIGHTED>

	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "V-GONAVE"
;-----------------------------------------------------------------------------

<ROUTINE V-GONAVE ()
	<TELL
"Poof! You are now in the Nave." CR CR
	>

	<RT-ALARM-CLR ,RT-I-PM-QUITS>

	<RT-GOTO ,RM-NAVE>

	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "V-GOLAIR"
;-----------------------------------------------------------------------------

<ROUTINE V-GOLAIR ()
	<TELL
"Poof! You are now in the Lair." CR CR

"Moriarty, Akbar and Holmes are here. Holmes is tied up." CR CR
	>

	<RT-ALARM-CLR ,RT-I-PM-QUITS>

	<REMOVE ,TH-PHIAL>
	<MOVE ,TH-ROPE ,RM-LAIR>
	<MC-MAKE ,TH-ROPE ,FL-NODESC>
	<MC-MAKE ,CH-HOLMES ,FL-LOCKED>
	<MC-UNMAKE ,CH-HOLMES ,FL-ASLEEP>
	<PUTP ,TH-ROPE ,P?AUX1 ,CH-HOLMES>
	<PUTP ,TH-ROPE ,P?AUX2 -1>

	<MOVE ,CH-HOLMES ,RM-LAIR>
	<MOVE ,CH-AKBAR ,RM-LAIR>

	<SETG GL-PUPPY <>>

	<RT-ALARM-SET-REL ,RT-I-OUT-OF-TIME <RT-PARM-SET 0 50 0>>

	<RT-GOTO ,RM-LAIR>

	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "V-GOGOLD"
;-----------------------------------------------------------------------------

<ROUTINE V-GOGOLD ()
	<TELL
"Poof! You are now in the Bar of Gold." CR CR

"The carnation is in your lapel. You have the garnet. Holmes is not with
you." CR CR
	>

	<RT-ALARM-CLR ,RT-I-PM-QUITS>

	<MOVE ,TH-CARNATION ,TH-LAPEL>
	<MOVE ,TH-GARNET ,CH-PLAYER>

	<REMOVE ,TH-PHIAL>
	<MOVE ,TH-ROPE ,RM-LAIR>
	<MC-MAKE ,TH-ROPE ,FL-NODESC>
	<PUTP ,TH-ROPE ,P?AUX1 ,CH-HOLMES>
	<PUTP ,TH-ROPE ,P?AUX2 -1>
	<MC-MAKE ,CH-HOLMES ,FL-LOCKED>
	<MC-UNMAKE ,CH-HOLMES ,FL-ASLEEP>
	<MOVE ,CH-HOLMES ,RM-LAIR>

	<SETG GL-PUPPY <>>

	<RT-CLOCK-SET 2 0 0 1887 6 20 1>

	<RT-GOTO ,RM-BAR-OF-GOLD>

	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "V-GOBANK"
;-----------------------------------------------------------------------------

<ROUTINE V-GOBANK ()
	<TELL
"Poof! You are now in Threadneedle Street." CR CR

"You now have \"the lamp\" and it is lit. You also have the opal, the ruby,
the emerald, the sapphire and the safety deposit box key." CR CR
	> 

	<RT-ALARM-CLR ,RT-I-PM-QUITS>

	<MC-MAKE ,TH-LAMP ,FL-LIGHTED>
	<MOVE ,TH-LAMP ,CH-PLAYER>

	<MOVE ,TH-OPAL ,CH-PLAYER>
	<MOVE ,TH-RUBY ,CH-PLAYER>
	<MOVE ,TH-EMERALD ,CH-PLAYER>
	<MOVE ,TH-SAPPHIRE ,CH-PLAYER>
	<MOVE ,TH-BOX-KEY ,CH-PLAYER>

	<PUTP ,CH-BANK-GUARD ,P?AUX1 0>

	<RT-GOTO ,RM-THREADNEEDLE-ST>

	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "V-GOCLUB"
;-----------------------------------------------------------------------------

<ROUTINE V-GOCLUB ()
	<TELL
"Poof! You are now in the the Diogenes Club." CR CR

"You have the ring Sherlock gave you. Holmes is not with you." CR CR
	>

	<RT-ALARM-CLR ,RT-I-PM-QUITS>

	<REMOVE ,TH-PHIAL>
	<MOVE ,CH-HOLMES ,RM-LAIR>
	<MOVE ,TH-ROPE ,RM-LAIR>
	<MC-MAKE ,TH-ROPE ,FL-NODESC>
	<PUTP ,TH-ROPE ,P?AUX1 ,CH-HOLMES>
	<PUTP ,TH-ROPE ,P?AUX2 -1>
	<MC-MAKE ,CH-HOLMES ,FL-LOCKED>
	<MC-UNMAKE ,CH-HOLMES ,FL-ASLEEP>
	<MOVE ,TH-RING ,CH-PLAYER>

	<SETG GL-PUPPY <>>

	<RT-GOTO ,RM-DIOGENES-CLUB>

	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "V-GOLIZA"
;-----------------------------------------------------------------------------

<ROUTINE V-GOLIZA ()
	<TELL
"Poof! You are now in Covent Garden." CR CR
	>

	<RT-ALARM-CLR ,RT-I-PM-QUITS>

	<RT-GOTO ,RM-COVENT-GARDEN>

	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "V-GOTOWR"
;-----------------------------------------------------------------------------

<ROUTINE V-GOTOWR ("AUX" WORD-NUM)
	<TELL
"Poof! You are now in Byward Tower." CR CR

"You hear the Beefeater mumbling something about '"
	>
	<SET WORD-NUM <RANDOM 6>>
	<PUTP ,CH-MYCROFT-HOLMES ,P?AUX1 .WORD-NUM>
	<COND
		(<EQUAL? .WORD-NUM 1>
			<TELL "Boleyn">
		)
		(<EQUAL? .WORD-NUM 2>
			<TELL "Cleves">
		)
		(<EQUAL? .WORD-NUM 3>
			<TELL "Howard">
		)
		(<EQUAL? .WORD-NUM 4>
			<TELL "Parr">
		)
		(<EQUAL? .WORD-NUM 5>
			<TELL "Aragon">
		)
		(<EQUAL? .WORD-NUM 6>
			<TELL "Seymour">
		)
	>
	<TELL ".'" CR CR>

	<RT-ALARM-CLR ,RT-I-PM-QUITS>

	<RT-GOTO ,RM-BYWARD-TOWER>

	<MC-RFATAL>
>

;*****************************************************************************
; "end of file"
;*****************************************************************************

