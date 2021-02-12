;******************************************************************************
; "game : SHERLOCK!"
; "file : BOOT.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   27 Oct 1987 18:57:42  $"
; "rev  : $Revision:   1.44  $"
; "vers : 1.00"
;******************************************************************************

;******************************************************************************
; "constants"
;******************************************************************************

; "hardware control codes"

<CONSTANT K-S-NOR 0>
<CONSTANT K-S-WIN 1>

<CONSTANT K-H-NRM 0>
<CONSTANT K-H-INV 1>
<CONSTANT K-H-BLD 2>
<CONSTANT K-H-ITL 4>

<CONSTANT K-D-SCR-ON   1>
<CONSTANT K-D-SCR-OFF -1>
<CONSTANT K-D-PRN-ON   2>
<CONSTANT K-D-PRN-OFF -2>
<CONSTANT K-D-TBL-ON   3>
<CONSTANT K-D-TBL-OFF -3>
<CONSTANT K-D-REC-ON   4>
<CONSTANT K-D-REC-OFF -4>

; "exit type codes"

<CONSTANT K-UEXIT 2>							; "uncond"
<CONSTANT K-NEXIT 3>							; "no exit"
<CONSTANT K-PEXIT 4>							; "cond via routine"
<CONSTANT K-CEXIT 5>							; "cond via obj"
<CONSTANT K-DEXIT 6>							; "cond via door"

; "exit type object access codes"

<CONSTANT K-REXIT    0>						; "destination"
<CONSTANT K-NEXITSTR 0>						; "no exit text"
<CONSTANT K-PEXITRTN 0>						; "via routine text"
<CONSTANT K-CEXITFLG 4>						; "via obj object"
<CONSTANT K-CEXITSTR 1>						; "via obj text"
<CONSTANT K-DEXITOBJ 1>						; "via door object"
<CONSTANT K-DEXITSTR 2>						; "via door text"

;******************************************************************************
; "globals"
;******************************************************************************

;-----------------------------------------------------------------------------
; "game verbs table"
;-----------------------------------------------------------------------------

<GLOBAL GL-GAME-VERBS:TABLE
   <PLTABLE
      V?DESC-LEVEL
      V?QUIT
		V?RESTART
      V?DIAGNOSE
      V?INVENTORY
		V?NOTIFY
      V?SAVE
      V?RESTORE
      V?SCRIPT
      V?VERSION
   >
>

;-----------------------------------------------------------------------------
; "misc"
;-----------------------------------------------------------------------------

<GLOBAL GL-DEBUG-FLAG:FLAG  <>>			; "debug flag"

<GLOBAL GL-SPLIT-ROW:NUMBER  1>			; "screen split row"
<GLOBAL GL-ALLSCREEN:NUMBER  0>			; "width of full screen"
<GLOBAL GL-MIDSCREEN:NUMBER  0>			; "width of half screen"

<GLOBAL GL-DESC-LEVEL:NUMBER 2>			; "verbosity level (0 1 2)"

<GLOBAL GL-CLOCK-DSP:FLAG   <>>			; "clock display flag"
<GLOBAL GL-CLOCK-FMT:NUMBER  0>			; "clock display format"

<GLOBAL GL-SCORE-DSP:FLAG   <>>			; "score display flag"
<GLOBAL GL-SCORE-MSG:FLAG    T>			; "score message flag"
<GLOBAL GL-SCORE-MAX:NUMBER  0>			; "score maximum count"
<GLOBAL GL-SCORE-CUR:NUMBER  0>			; "score current count"
<GLOBAL GL-SCORE-STS:NUMBER  0>			; "score status  count"

<GLOBAL GL-MOVES-DSP:FLAG   <>>			; "move display flag" 
<GLOBAL GL-MOVES-CUR:NUMBER  0> 			; "move current count" 
<GLOBAL GL-MOVES-STS:NUMBER  0> 			; "move status  count" 

<GLOBAL GL-PLACE-CUR:OBJECT  0>			; "current  player location"
<GLOBAL GL-PLACE-PRV:OBJECT  0>			; "previous player location"
<GLOBAL GL-PLACE-STS:OBJECT  0>			; "status   player location"

<GLOBAL GL-WINNER:OBJECT     0> 			; "current character"

<GLOBAL GL-PUPPY:OBJECT     <>>			; "object to follow player"
<GLOBAL GL-PUPPY-MSG?:FLAG   T>			; "Give default puppy message?"

<GLOBAL GL-YES-IBUF:TABLE					; "for RT-GET-YES-NO"
	<ITABLE BYTE 12>>
<GLOBAL GL-YES-LEXV:TABLE					; "for RT-GET-YES-NO"
	<ITABLE BYTE 10>>

<GLOBAL GL-BLANK-LOC 						; "for erasing stat line location"
	"                                   "
>
<GLOBAL GL-CLOSED-OBJECT:OBJECT <>>		; "Closed object preventing touch."
<GLOBAL GL-IN-OUT:FLAG <>>					; "T=Inside, <>=Outside"
<GLOBAL GL-LOC-TRAIL:TABLE <ITABLE 10 0>>	; "Temporary table used by RT-SEEABLE? and RT-TOUCHABLE?"

;*****************************************************************************
; "routines with no screen output"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-META-LOC"
;-----------------------------------------------------------------------------

<ROUTINE RT-META-LOC (OBJ)
   <REPEAT ()
      <COND
         (<MC-F? .OBJ>
            <RFALSE>
         )
         (<IN? .OBJ ,GLOBAL-OBJECTS>
   			<RETURN ,GLOBAL-OBJECTS>
         )
         (<IN? .OBJ ,ROOMS>
            <RETURN .OBJ>
         )
         (T
            <SET OBJ <LOC .OBJ>>
         )
      >
   >
>

;-----------------------------------------------------------------------------
; "RT-META-IN?"
;-----------------------------------------------------------------------------

<ROUTINE RT-META-IN? (OBJ1 OBJ2)
	<REPEAT ()
		<COND
			(<OR <MC-F? .OBJ1>
				  <IN? .OBJ1 ,ROOMS>
				  <IN? .OBJ1 ,LOCAL-GLOBALS>
				>
				<RFALSE>
			)
			(<EQUAL? .OBJ1 .OBJ2>
				<RTRUE>
			)
		>
		<SET OBJ1 <LOC .OBJ1>>
	>
>

;------------------------------------------------------------------------------
; "RT-GLOBAL-IN?"
;------------------------------------------------------------------------------

<ROUTINE RT-GLOBAL-IN? (OBJ1 OBJ2 "AUX" TBL)
	<SET TBL <GETPT .OBJ2 ,P?GLOBAL>>
	<COND
		(<MC-F? .TBL>
			<RFALSE>
		)
		(<INTBL? .OBJ1 .TBL </ <PTSIZE .TBL> 2>>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-SEE-INSIDE?"
;-----------------------------------------------------------------------------

<ROUTINE RT-SEE-INSIDE? (THING)
	<COND
		(<MC-F? .THING>
			<RFALSE>
		)
		(<MC-T? ,GL-P-MOBY-FLAG>
			<RTRUE>
		)	       
		(<MC-IS? .THING ,FL-SURFACE>
			<RTRUE>
		)
      (<AND	<MC-IS? .THING ,FL-CONTAINER>
				<OR
					<MC-IS? .THING ,FL-OPENED>
					<MC-IS? .THING ,FL-TRANSPARENT>
				>
			>
			<RTRUE>
		)
      (<AND	<MC-IS? .THING ,FL-VEHICLE>
				<OR
					<MC-IS? .THING ,FL-OPENED>
					<MC-IS? .THING ,FL-TRANSPARENT>
				>
			>
			<RTRUE>
		)
		(<AND	<OR
					<MC-IS? .THING ,FL-PERSON>
					<MC-IS? .THING ,FL-ALIVE>
				>
				<NOT <EQUAL? .THING ,CH-PLAYER>>
			>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;------------------------------------------------------------------------------
; "RT-SEE-ANYTHING-IN?"
;------------------------------------------------------------------------------

<ROUTINE RT-SEE-ANYTHING-IN? (THING "AUX" OBJ)
	<SET OBJ <FIRST? .THING>>
	<REPEAT ()
		<COND
			(<MC-F? .OBJ>
				<RFALSE>
			)
			(<AND	<MC-ISNOT? .OBJ ,FL-NODESC>
					<NOT <EQUAL? .OBJ ,GL-WINNER>>
				>
				<RTRUE>
			)
			(T
				<SET OBJ <NEXT? .OBJ>>
			)
		>
	>
>

;-----------------------------------------------------------------------------
; "RT-VISIBLE?"
;-----------------------------------------------------------------------------

;<ROUTINE RT-VISIBLE? (OBJ "AUX" L)
	<COND
		(<EQUAL? .OBJ <> ,TH-NOT-HERE-OBJECT>
			<RFALSE>
		)
	>
	<SET L <LOC .OBJ>>
	<COND
		(<EQUAL? .L <> ,GLOBAL-OBJECTS>
			<RFALSE>
		)
		(<EQUAL? .L ,GL-PLACE-CUR ,CH-PLAYER ,GL-WINNER>
			<RTRUE>
		)
		(<AND <EQUAL? .L ,LOCAL-GLOBALS>
				<RT-GLOBAL-IN? .OBJ ,GL-PLACE-CUR>
				>
					<RTRUE>
		)
		(<AND <RT-SEE-INSIDE? .L>
				<RT-VISIBLE? .L>
				>
					<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-ACCESSIBLE?"
;-----------------------------------------------------------------------------

;<ROUTINE RT-ACCESSIBLE? (OBJ)
	<COND
		(<EQUAL? .OBJ <> ,TH-NOT-HERE-OBJECT>
			<RFALSE>
		)
		(<EQUAL? <RT-META-LOC .OBJ> ,GL-WINNER ,GL-PLACE-CUR ,GLOBAL-OBJECTS>
			<RTRUE>
		)
		(<RT-VISIBLE? .OBJ>
			<RTRUE>
		)
		(T 
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-VISIBLE?"
;-----------------------------------------------------------------------------

<ROUTINE RT-VISIBLE? (OBJ "AUX" WLOC OLOC (CLSD-PTR <>) PTR (CNT 0) TBL END)
	<COND
		(<MC-F? .OBJ>
			<SETG GL-CLOSED-OBJECT <>>
			<RFALSE>
		)
		(<EQUAL? .OBJ ,ROOMS>
			<RTRUE>
		)
	>
	<SET PTR ,GL-LOC-TRAIL>
	<SET OLOC .OBJ>
	<REPEAT ()
		<PUT .PTR 0 .OLOC>
		<INC CNT>
		<COND
			(<OR <MC-F? .OLOC>
				  <IN? .OLOC ,ROOMS>
				  <IN? .OLOC ,LOCAL-GLOBALS>
				  <IN? .OLOC ,GLOBAL-OBJECTS>
				>
				<RETURN>
			)
		>
		<SET OLOC <LOC .OLOC>>
		<SET PTR <REST .PTR 2>>
		<COND
			(<AND <MC-T? .OLOC>
					<MC-ISNOT? .OLOC ,FL-OPENED>
					<MC-ISNOT? .OLOC ,FL-TRANSPARENT>
					<MC-ISNOT? .OLOC ,FL-SURFACE>
					<MC-ISNOT? .OLOC ,FL-ALIVE>
					<NOT <IN? .OLOC ,ROOMS>>
					<MC-F? .CLSD-PTR>
				>
				<SET CLSD-PTR .PTR>
			)
		>
	>

	<SET PTR <>>
	<SET WLOC ,GL-WINNER>
	<REPEAT ()
		<COND
			(<SET PTR <INTBL? .WLOC ,GL-LOC-TRAIL .CNT>>
				<RETURN>
			)
			(<MC-F? .WLOC>
				<RFALSE>
			)
			(<IN? .WLOC ,ROOMS>
				<RETURN>
			)
			(<AND <MC-ISNOT? .WLOC ,FL-OPENED>
					<MC-ISNOT? .WLOC ,FL-TRANSPARENT>
					<MC-ISNOT? .WLOC ,FL-SURFACE>
					<MC-ISNOT? .WLOC ,FL-ALIVE>
					<NOT <IN? .WLOC ,ROOMS>>
				>
				<RFALSE>
			)
		>
		<SET WLOC <LOC .WLOC>>
	>

	<COND
		(<AND <MC-T? .WLOC>
				<IN? .WLOC ,ROOMS>
				<MC-F? .PTR>
			>
			<SET TBL <GETPT .WLOC ,P?GLOBAL>>
			<COND
				(<MC-T? .TBL>
					<SET END <REST .TBL <PTSIZE .TBL>>>
					<REPEAT ()
						<COND
							(<G=? .TBL .END>
								<RETURN>
							)
							(<SET PTR <INTBL? <GET .TBL 0> ,GL-LOC-TRAIL .CNT>>
								<RETURN>
							)
						>
						<SET TBL <REST .TBL 2>>
					>
				)
			>
		)
	>

	<COND
		(<AND <MC-T? .WLOC>
				<IN? .WLOC ,ROOMS>
				<MC-F? .PTR>
			>
			<SET TBL <FIRST? ,GLOBAL-OBJECTS>>
			<REPEAT ()
				<COND
					(<MC-F? .TBL>
						<RETURN>
					)
					(<SET PTR <INTBL? .TBL ,GL-LOC-TRAIL .CNT>>
						<RETURN>
					)
				>
				<SET TBL <NEXT? .TBL>>
			>
		)
	>

	<COND
		(<MC-F? .PTR>
			<RFALSE>
		)
		(<AND <MC-T? .CLSD-PTR>
				<G? .PTR .CLSD-PTR>
			>
			<RFALSE>
		)
		(T
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-ACCESSIBLE?"
;-----------------------------------------------------------------------------

<ROUTINE RT-ACCESSIBLE? (OBJ "AUX" WLOC OLOC (CLSD-PTR <>) PTR (CNT 0) TEMP TBL END)
	<COND
		(<MC-F? .OBJ>
			<SETG GL-CLOSED-OBJECT <>>
			<RFALSE>
		)
		(<EQUAL? .OBJ ,ROOMS>
			<RTRUE>
		)
	>
	<SET PTR ,GL-LOC-TRAIL>
	<SET OLOC .OBJ>
	<REPEAT ()
		<PUT .PTR 0 .OLOC>
		<INC CNT>
		<COND
			(<OR <MC-F? .OLOC>
				  <IN? .OLOC ,ROOMS>
				  <IN? .OLOC ,LOCAL-GLOBALS>
				  <IN? .OLOC ,GLOBAL-OBJECTS>
				>
				<RETURN>
			)
		>
		<SET OLOC <LOC .OLOC>>
		<SET PTR <REST .PTR 2>>
		<COND
			(<AND <MC-T? .OLOC>
					<MC-ISNOT? .OLOC ,FL-OPENED>
					<MC-ISNOT? .OLOC ,FL-SURFACE>
					<MC-ISNOT? .OLOC ,FL-ALIVE>
					<NOT <IN? .OLOC ,ROOMS>>
				>
				<SETG GL-CLOSED-OBJECT .OLOC>
				<SETG GL-IN-OUT T>
				<COND
					(<MC-F? .CLSD-PTR>
						<SET CLSD-PTR .PTR>
					)
				>
			)
		>
	>

	<SET PTR <>>
	<SET WLOC ,GL-WINNER>
	<REPEAT ()
		<COND
			(<MC-F? .WLOC>
				<SETG GL-CLOSED-OBJECT <>>
				<SETG GL-IN-OUT <>>
				<RFALSE>
			)
			(<SET PTR <INTBL? .WLOC ,GL-LOC-TRAIL .CNT>>
				<RETURN>
			)
			(<IN? .WLOC ,ROOMS>
				<RETURN>
			)
		>
		<SET WLOC <LOC .WLOC>>
		<COND
			(<AND <MC-ISNOT? .WLOC ,FL-OPENED>
					<MC-ISNOT? .WLOC ,FL-SURFACE>
					<MC-ISNOT? .WLOC ,FL-ALIVE>
					<NOT <IN? .WLOC ,ROOMS>>
				>
				<SETG GL-CLOSED-OBJECT .WLOC>
				<SETG GL-IN-OUT <>>
				<RFALSE>
			)
		>
	>

	<COND
		(<AND <MC-T? .WLOC>
				<IN? .WLOC ,ROOMS>
				<MC-F? .PTR>
			>
			<SET TBL <GETPT .WLOC ,P?GLOBAL>>
			<COND
				(<MC-T? .TBL>
					<SET END <REST .TBL <PTSIZE .TBL>>>
					<REPEAT ()
						<COND
							(<G=? .TBL .END>
								<RETURN>
							)
							(<SET PTR <INTBL? <GET .TBL 0> ,GL-LOC-TRAIL .CNT>>
								<RETURN>
							)
						>
						<SET TBL <REST .TBL 2>>
					>
				)
			>
		)
	>

	<COND
		(<AND <MC-T? .WLOC>
				<IN? .WLOC ,ROOMS>
				<MC-F? .PTR>
			>
			<SET TBL <FIRST? ,GLOBAL-OBJECTS>>
			<REPEAT ()
				<COND
					(<MC-F? .TBL>
						<RETURN>
					)
					(<SET PTR <INTBL? .TBL ,GL-LOC-TRAIL .CNT>>
						<RETURN>
					)
				>
				<SET TBL <NEXT? .TBL>>
			>
		)
	>

	<COND
		(<MC-F? .PTR>
			<RFALSE>
		)
		(<AND <MC-T? .CLSD-PTR>
				<G? .PTR .CLSD-PTR>
			>
			<RFALSE>
		)
		(T
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-CANT-TOUCH-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-CANT-TOUCH-MSG (OBJ CLSD IN-OUT)
	<RT-CYOU-MSG>
	<TELL "cannot " VW " " THE .OBJ>
	<COND
		(<MC-T? .CLSD>
			<TELL " because ">
			<COND
				(<AND <MC-IS? .OBJ ,FL-PLURAL>
						<MC-ISNOT? .OBJ ,FL-COLLECTIVE>
					>
					<TELL "they are">
				)
				(T
					<TELL "it is">
				)
			>
			<TELL " ">
			<COND
				(<MC-T? .IN-OUT>
					<TELL "inside">
				)
				(T
					<TELL "outside">
				)
			>
			<TELL " " THE .CLSD ", which is closed">
		)
	>
	<TELL "." CR>
>

;-----------------------------------------------------------------------------
; "RT-DONT-ALL?"
;-----------------------------------------------------------------------------

<ROUTINE RT-DONT-ALL? (O I "AUX" L)
	<SET L <LOC .O>>
	<COND 
		(<OR	<MC-F? .L>
				<EQUAL? .O .I>
				>
					<RTRUE>
		)
		(<MC-IS? .O ,FL-BODYPART>
			<RTRUE>
		)
		(<MC-IS? .O ,FL-NOALL>
			<RTRUE>
		)
		(<MC-VERB? TAKE>
			<COND
				(<AND <MC-F? .I>
						<RT-META-IN? .O ,GL-WINNER>
					>						
				 	<RTRUE>
				)
				(<AND	<MC-ISNOT? .O ,FL-TAKEABLE>
						<MC-ISNOT? .O ,FL-TRYTAKE>
						>
							<RTRUE>
				)
				(<AND	<MC-IS? .L ,FL-CONTAINER>
						<MC-ISNOT? .L ,FL-OPENED>
						>
							<RTRUE>
				)
				(<MC-T? .I>
					<COND
						(<NOT <EQUAL? .L .I>>
							<RTRUE>
						)
						(<RT-SEE-INSIDE? .I>
							<RFALSE>
						)
						(T
							<RTRUE>
						)
					>
				)
				(<OR	<EQUAL? .L ,GL-PLACE-CUR>
						<RT-SEE-INSIDE? .L>
						>
							<RFALSE>
				)
				(T
					<RTRUE>
				)
			>
		)
		(<MC-VERB? DROP PUT PUT-ON THROW THROW-OVER>
			<COND
				(<EQUAL? .O ,TH-POCKET>
					<RTRUE>
				)
				(<EQUAL? .L ,TH-POCKET>
					<RTRUE>
				)
				(<MC-IS? .O ,FL-WORN>
					<RTRUE>
				)
				(<EQUAL? .L ,GL-WINNER>
					<RFALSE>
				)
				(T
					<RTRUE>
				)
			>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-RESET-THEM"
;-----------------------------------------------------------------------------

<ROUTINE RT-RESET-THEM ()
	<COND
		(<NOT <RT-VISIBLE? ,GL-P-IT-OBJECT>>
			<SETG GL-P-IT-OBJECT ,TH-NOT-HERE-OBJECT>
		)
	>
	<COND
		(<NOT <RT-VISIBLE? ,GL-P-THEM-OBJECT>>
			<SETG GL-P-THEM-OBJECT ,TH-NOT-HERE-OBJECT>
		)
	>
	<COND
		(<NOT <RT-VISIBLE? ,GL-P-HIM-OBJECT>>
			<SETG GL-P-HIM-OBJECT ,TH-NOT-HERE-OBJECT>
		)
	>
	<COND
		(<NOT <RT-VISIBLE? ,GL-P-HER-OBJECT>>
			<SETG GL-P-HER-OBJECT ,TH-NOT-HERE-OBJECT>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-TOTAL-SIZE-IN-OBJ"
;-----------------------------------------------------------------------------

<ROUTINE RT-TOTAL-SIZE-IN-OBJ (OBJ1 "AUX" OBJ (TOTSIZ 0))
	<SET OBJ <FIRST? .OBJ1>>
	<REPEAT ()
		<COND
			(<MC-F? .OBJ>
				<RETURN>
			)
			(T
				<SET TOTSIZ <+ .TOTSIZ <GETP .OBJ ,P?SIZE>>>
			)
		>
		<SET OBJ <NEXT? .OBJ>>
	>
	<RETURN .TOTSIZ>
>

;-----------------------------------------------------------------------------
; "RT-TOTAL-MASS-OF-OBJ"
;-----------------------------------------------------------------------------

<ROUTINE RT-TOTAL-MASS-OF-OBJ (OBJ1 "AUX" OBJ (TOTMAS 0))
	<SET OBJ <FIRST? .OBJ1>>
	<REPEAT ()
		<COND
			(<MC-F? .OBJ>
				<RETURN>
			)
			(T
				<SET TOTMAS <+ .TOTMAS <RT-TOTAL-MASS-OF-OBJ .OBJ>>>
			)
		>
		<SET OBJ <NEXT? .OBJ>>
	>
	<SET TOTMAS <+ .TOTMAS <GETP .OBJ1 ,P?MASS>>>
	<RETURN .TOTMAS>
>

;-----------------------------------------------------------------------------
; "RT-TOTAL-COUNT-IN-OBJ"
;-----------------------------------------------------------------------------

<ROUTINE RT-TOTAL-COUNT-IN-OBJ (OBJ1 "AUX" OBJ (TOTCNT 0))
	<SET OBJ <FIRST? .OBJ1>>
	<REPEAT ()
		<COND
			(<MC-F? .OBJ>
				<RETURN>
			)
         (<AND <MC-IS? .OBJ ,FL-WORN>
               <IN? .OBJ ,CH-PLAYER>
            >
            T
         )
         (<MC-IS? .OBJ ,FL-BODYPART>
            T
         )
			(T
				<INC TOTCNT>
			)
		>
		<SET OBJ <NEXT? .OBJ>>
	>
	<RETURN .TOTCNT>
>

;-----------------------------------------------------------------------------
; "RT-OBJ-TOO-LARGE?"
;-----------------------------------------------------------------------------

<ROUTINE RT-OBJ-TOO-LARGE? (OBJ1 OBJ2)
	<G?
		<+ <GETP .OBJ1 ,P?SIZE> <RT-TOTAL-SIZE-IN-OBJ .OBJ2>>
		<GETP .OBJ2 ,P?CAPACITY>
	>
>

;-----------------------------------------------------------------------------
; "RT-OBJ-TOO-HEAVY?"
;-----------------------------------------------------------------------------

<ROUTINE RT-OBJ-TOO-HEAVY? (OBJ1 OBJ2)
	<G? 
		<+ <RT-TOTAL-MASS-OF-OBJ .OBJ1> <RT-TOTAL-MASS-OF-OBJ .OBJ2>>
		<GETP .OBJ2 ,P?STRENGTH>
	>
>

;-----------------------------------------------------------------------------
; "RT-OBJ-TOO-MANY?"
;-----------------------------------------------------------------------------

<ROUTINE RT-OBJ-TOO-MANY? (OBJ1 OBJ2)
	<G?
		<+ 1 <RT-TOTAL-COUNT-IN-OBJ .OBJ2>>
		<GETP .OBJ2 ,P?DEXTERITY>
	>
>

;-----------------------------------------------------------------------------
; "RT-REMOVE-ALL"
;-----------------------------------------------------------------------------

<ROUTINE RT-REMOVE-ALL (OBJ1 "AUX" OBJ NXT (CNT 0))
	<SET OBJ <FIRST? .OBJ1>>
	<REPEAT ()
		<COND
			(<MC-F? .OBJ>
				<RETURN>
			)
		>
		<SET NXT <NEXT? .OBJ>>
		<REMOVE .OBJ>
		<INC CNT>
		<SET OBJ .NXT>
	>
	<RETURN .CNT>
>

;-----------------------------------------------------------------------------
; "RT-MOVE-ALL-BUT-WORN"
;-----------------------------------------------------------------------------

<ROUTINE RT-MOVE-ALL-BUT-WORN (OBJ1 OBJ2 "AUX" OBJ NXT (CNT 0))
	<SET OBJ <FIRST? .OBJ1>>
	<REPEAT ()
		<COND
			(<MC-F? .OBJ>
				<RETURN>
			)
		>
		<SET NXT <NEXT? .OBJ>>
		<COND
			(<AND	<MC-ISNOT? .OBJ ,FL-WORN>
					<NOT <EQUAL? .OBJ ,TH-POCKET>>
					>
						<MOVE .OBJ .OBJ2>
						<INC CNT>
			)
		>
		<SET OBJ .NXT>
	>
	<RETURN .CNT>
>

;-----------------------------------------------------------------------------
; "RT-MOVE-NODESC-OBJS"
;-----------------------------------------------------------------------------

<ROUTINE RT-MOVE-NODESC-OBJS (OBJ1 OBJ2 "AUX" OBJ NXT (CNT 0)) 
	<SET OBJ <FIRST? .OBJ1>>
	<REPEAT ()
		<COND
			(<MC-F? .OBJ>
				<RETURN>
			)
		>
		<SET NXT <NEXT? .OBJ>>
		<COND
			(<MC-IS? .OBJ ,FL-NODESC>
				<MOVE .OBJ .OBJ2>
				<INC CNT>
			)
		>
		<SET OBJ .NXT>
	>
	<RETURN .CNT>
>

;-----------------------------------------------------------------------------
; "RT-FIND-IN?"
;-----------------------------------------------------------------------------

<ROUTINE RT-FIND-IN? (OBJ1 FLG "AUX" OBJ) 
	<SET OBJ <FIRST? .OBJ1>>
	<REPEAT ()
		<COND
			(<MC-F? .OBJ>
				<RFALSE>
			)
			(<MC-IS? .OBJ .FLG>
				<RETURN .OBJ>
			)
		>
		<SET OBJ <NEXT? .OBJ>>
	>
>

;******************************************************************************
; "tell token output routines"
;******************************************************************************

;-----------------------------------------------------------------------------
; "RT-A-PRINT"
;-----------------------------------------------------------------------------

<ROUTINE RT-A-PRINT ("OPTIONAL" (O <>))
   <COND
      (<MC-F? .O>
         <SET O ,GL-PRSO>
      )
   >
   <COND
      (<MC-ISNOT? .O ,FL-NOARTC>
         <COND
				(<MC-IS? .O ,FL-YOUR>
					<TELL "your ">
				)
            (<AND	<MC-IS?    .O ,FL-PLURAL>
						<MC-ISNOT? .O ,FL-PERSON>
						>
      			      <TELL "some ">
            )
            (<AND	<MC-IS? .O ,FL-PLURAL>
						<MC-IS? .O ,FL-PERSON>
						>
      			      <TELL "the ">
            )
		      (<MC-IS? .O ,FL-VOWEL>
               <TELL "an ">
            )
		      (T
               <TELL "a ">
            )
         >
      )
   >
   <TELL D .O>
   <RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-THEO-PRINT"
;-----------------------------------------------------------------------------

<ROUTINE RT-THEO-PRINT ("OPTIONAL" (O <>))
   <COND
      (<MC-F? .O>
         <SET O ,GL-PRSO>
      )
   >
   <COND
      (<MC-ISNOT? .O ,FL-NOARTC>
			<COND
				(<MC-IS? .O ,FL-YOUR>
					<TELL "your ">
				)
				(T
		         <TELL "the ">
				)
			>
      )
   >
   <TELL D .O>
   <RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-CTHEO-PRINT"
;-----------------------------------------------------------------------------

<ROUTINE RT-CTHEO-PRINT ("OPTIONAL" (O <>))
   <COND
      (<MC-F? .O>
         <SET O ,GL-PRSO>
      )
   >
	<COND
		(<MC-ISNOT? .O ,FL-NOARTC>
			<COND
				(<MC-IS? .O ,FL-YOUR>
					<TELL "Your ">
				)
				(T
		   		<TELL "The ">
				)
			>
		)
	>
	<TELL D .O>
   <RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-THEI-PRINT"
;-----------------------------------------------------------------------------

<ROUTINE RT-THEI-PRINT ("OPTIONAL" (I <>))
   <COND
      (<MC-F? .I>
         <SET I ,GL-PRSI>
      )
   >
   <COND
      (<MC-ISNOT? .I ,FL-NOARTC>
			<COND
				(<MC-IS? .I ,FL-YOUR>
					<TELL "your ">
				)
				(T
		         <TELL "the ">
				)
			>
      )
   >
   <TELL D .I>
   <RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-CTHEI-PRINT"
;-----------------------------------------------------------------------------

<ROUTINE RT-CTHEI-PRINT	("OPTIONAL" (I <>))
   <COND
      (<MC-F? .I>
         <SET I ,GL-PRSI>
      )
   >
	<COND
		(<MC-ISNOT? .I ,FL-NOARTC>
			<COND
				(<MC-IS? .I ,FL-YOUR>
					<TELL "Your ">
				)
				(T
					<TELL "The ">
				)
			>
		)
	>
   <TELL D .I>
   <RTRUE>
>

;*****************************************************************************
; "routines with screen output AND keyboard input"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-GET-ANY-KEY"
;-----------------------------------------------------------------------------

<ROUTINE RT-GET-ANY-KEY ("AUX" X)
	<TELL "[Press any key.]" CR>
	<SET X <INPUT 1>>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-GET-YES-NO?"
;-----------------------------------------------------------------------------

<ROUTINE RT-GET-YES-NO? ("AUX" WORD)
	<REPEAT ()
		<TELL CR "Please type YES or NO > ">
		<PUTB ,GL-YES-LEXV 0 4>
		<PUTB ,GL-YES-IBUF 1 0>
		<READ ,GL-YES-IBUF ,GL-YES-LEXV>
		<SET WORD <GET ,GL-YES-LEXV ,K-P-LEXSTART>>
		<COND
			(<ZERO? <GETB ,GL-YES-LEXV ,K-P-LEXWORDS>>
				T
			)
			(<MC-T? .WORD>
				<COND
					(<EQUAL? .WORD ,W?Y ,W?YES>
						<RTRUE>
					)
					(<EQUAL? .WORD ,W?N ,W?NO>
						<RFALSE>
					)
				>
			)
		>
	>
>

;*****************************************************************************
; "routines with possible screen output"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-IS-CHAR-NOT-PLAYER?"
;-----------------------------------------------------------------------------

<ROUTINE RT-IS-CHAR-NOT-PLAYER? ()
	<COND
		(<EQUAL? ,GL-WINNER ,CH-PLAYER>
			<RFALSE>
		)
	>
	<TELL "[You cannot tell characters to do that.]" CR>
	<RTRUE>
>

;*****************************************************************************
; "routines with screen output"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-PRINT-SPACES"
;-----------------------------------------------------------------------------

<ROUTINE RT-PRINT-SPACES (N) 
	<REPEAT ()
		<COND
   		(<L? <SET N <- .N 1>> 0>
   			<RTRUE>
   		)
   		(T
   			<TELL " ">
   		)
		>
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-INIT-SCREEN"
;-----------------------------------------------------------------------------

<ROUTINE RT-INIT-SCREEN ()
	<CLEAR -1>
	<SPLIT ,GL-SPLIT-ROW>

	<SCREEN ,K-S-WIN>
	<BUFOUT <>>
	<HLIGHT ,K-H-INV>

	<CURSET ,GL-SPLIT-ROW 1>
	<RT-PRINT-SPACES ,GL-ALLSCREEN>

	<COND
		(<MC-T? ,GL-MOVES-DSP>
			<CURSET ,GL-SPLIT-ROW <+ 0 <- ,GL-ALLSCREEN ,K-STAT-M-POS>>>
			<TELL "Moves:">
		)
	>

	<COND
		(<MC-T? ,GL-SCORE-DSP>
			<CURSET ,GL-SPLIT-ROW <+ 0 <- ,GL-ALLSCREEN ,K-STAT-S-POS>>>
			<TELL "Score:">
		)
	>

	<HLIGHT ,K-H-NRM>
	<BUFOUT T>
	<SCREEN ,K-S-NOR>

	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-UPDATE-STATUS-LINE"
;-----------------------------------------------------------------------------

<ROUTINE RT-UPDATE-STATUS-LINE ()

	<BUFOUT <>>
	<SCREEN ,K-S-WIN>
	<HLIGHT ,K-H-INV>

	<COND
		(<NOT <EQUAL? ,GL-PLACE-CUR ,GL-PLACE-STS>>
			<CURSET ,GL-SPLIT-ROW 2>
			<TELL ,GL-BLANK-LOC>
			<CURSET ,GL-SPLIT-ROW 2>
			<COND
				(<RT-SAY-ROOM-NAME-IF-LIT>
					<SETG GL-PLACE-STS ,GL-PLACE-CUR>
				)
				(T
					<SETG GL-PLACE-STS -1>
				)
			>
		)
	>

	<COND
		(<AND	<MC-T? ,GL-MOVES-DSP>
				<NOT <EQUAL? ,GL-MOVES-CUR ,GL-MOVES-STS>>
			>
				<SETG GL-MOVES-STS ,GL-MOVES-CUR>
				<CURSET ,GL-SPLIT-ROW <+ 6 <- ,GL-ALLSCREEN ,K-STAT-M-POS>>>
				<COND
					(<L? ,GL-MOVES-CUR    10>
						<TELL "    ">
					)
					(<L? ,GL-MOVES-CUR   100>
						<TELL "   ">
					)
					(<L? ,GL-MOVES-CUR  1000>
						<TELL "  ">
					)
					(<L? ,GL-MOVES-CUR 10000>
						<TELL " ">
					)			  
				>
				<TELL N ,GL-MOVES-CUR>
		)
	>

	<COND
		(<AND	<MC-T? ,GL-SCORE-DSP>
				<NOT <EQUAL? ,GL-SCORE-CUR ,GL-SCORE-STS>>
			>
				<SETG GL-SCORE-STS ,GL-SCORE-CUR>
				<CURSET ,GL-SPLIT-ROW <+ 6 <- ,GL-ALLSCREEN ,K-STAT-S-POS>>>
				<COND
					(<L? ,GL-SCORE-CUR    10>
						<TELL "    ">
					)
					(<L? ,GL-SCORE-CUR   100>
						<TELL "   ">
					)
					(<L? ,GL-SCORE-CUR  1000>
						<TELL "  ">
					)
					(<L? ,GL-SCORE-CUR 10000>
						<TELL " ">
					)
				>
				<TELL N ,GL-SCORE-CUR>
		)
	>

	<COND
		(<MC-T? ,GL-CLOCK-DSP>
			<CURSET ,GL-SPLIT-ROW <+  0 <- ,GL-ALLSCREEN ,K-STAT-T-POS>>>
			<RT-CLK-DOW-MSG 5>
			<CURSET ,GL-SPLIT-ROW <+ 10 <- ,GL-ALLSCREEN ,K-STAT-T-POS>>>
			<RT-CLK-NTI-MSG 7>
		)
	>

	<HLIGHT ,K-H-NRM>
	<BUFOUT T>
	<SCREEN ,K-S-NOR>
   <RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-GAMETITLE-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-GAMETITLE-MSG ()
	<TELL "Sherlock!" CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-COPYRIGHT-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-COPYRIGHT-MSG ()
	<TELL "Copyright 1987 Infocom, Inc." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-TRADEMARK-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-TRADEMARK-MSG ()
	<TELL "*** Trademark Message ***" CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-ID-MSG"
;-----------------------------------------------------------------------------
 
<ROUTINE RT-ID-MSG ()
	<TELL "Interpreter " N <GETB 0 30>>
	<TELL " Version " C <GETB 0 31>>
	<TELL " Release " N <BAND <GET 0 1> *3777*> CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-SERIAL-NO-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-SERIAL-NO-MSG ("AUX" (CNT 17))
	<TELL "Serial Number ">
	<REPEAT ()
		<COND
			(<G? <SET CNT <+ .CNT 1>> 23>
				<RETURN>
			)
			(T
				<TELL C <GETB 0 .CNT>>
			)
		>
	>
	<CRLF>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-VERSION-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-VERSION-MSG ()
	<HLIGHT ,K-H-BLD>

	<RT-GAMETITLE-MSG>
	<RT-COPYRIGHT-MSG>
	<RT-TRADEMARK-MSG>
	<RT-ID-MSG>
	<RT-SERIAL-NO-MSG>

	<HLIGHT ,K-H-NRM>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-REFER-TO-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-REFER-TO-MSG ()
	 <TELL "[To what are you referring?]" CR>
	 <RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-SAY-ROOM-NAME-IF-LIT"
;-----------------------------------------------------------------------------

<ROUTINE RT-SAY-ROOM-NAME-IF-LIT ()
   <COND
      (<MC-T? ,GL-NOW-LIT?>
   		<TELL D ,GL-PLACE-CUR>
			<RTRUE>
      )
      (T
   		<TELL "Darkness">
			<RFALSE>
      )
   >
>

;-----------------------------------------------------------------------------
; "RT-DESCRIBE-PLACE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DESCRIBE-PLACE ("OPTIONAL" (PLACE <>) (LOOK <>))

; "if no place is passed as an argument use gl-place-cur"

	<COND
		(<MC-F? .PLACE>
			<SET PLACE ,GL-PLACE-CUR>
		)
	>

; "check if this place is lit"

	<COND
		(<MC-F? <RT-IS-LIT? .PLACE T>>
			<TELL ,K-TOO-DARK-MSG CR>
			<RTRUE>
		)
	>

; "display room description (DESC) in bold"

	<HLIGHT ,K-H-BLD>
	<TELL D .PLACE CR CR>
	<HLIGHT ,K-H-NRM>

; "determine description context"

	<COND
		(<MC-T? .LOOK>
			<RT-EXEC-RM-DESCFCN .PLACE 3>
		)
		(<MC-ISNOT? .PLACE ,FL-TOUCHED>
			<MC-MAKE .PLACE ,FL-TOUCHED>
			<RT-EXEC-RM-DESCFCN .PLACE 1>
		)
		(<EQUAL? ,GL-DESC-LEVEL 2>
			<RT-EXEC-RM-DESCFCN .PLACE 2>
		)
		(<EQUAL? ,GL-DESC-LEVEL 1>
			<RTRUE>
		)
		(<EQUAL? ,GL-DESC-LEVEL 0>
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-EXEC-RM-DESCFCN"
;-----------------------------------------------------------------------------

<ROUTINE RT-EXEC-RM-DESCFCN (PLACE CONTEXT "AUX" DF)
	<SET DF <GETP .PLACE ,P?DESCFCN>>
	<RETURN <NOT <APPLY .DF .CONTEXT>>>
>

;-----------------------------------------------------------------------------
; "RT-DESC-PL-CONT-1"
;-----------------------------------------------------------------------------

<ROUTINE RT-DESC-PL-CONT-1 (SURFACE CNT "AUX" OBJ NXT FIRST)
	<SET OBJ <FIRST? .SURFACE>>
	<SET FIRST T>
	<REPEAT ()
		<COND
			(<MC-F? .OBJ>
				<RETURN>
			)
			(<OR <MC-IS? .OBJ ,FL-NODESC>
				  <EQUAL? .OBJ ,GL-PUPPY>
				>
				<SET OBJ <NEXT? .OBJ>>
				<AGAIN>
			)
			(<MC-T? .FIRST>
				<COND
					(<G? .CNT 0>
						<TELL " ">
					)
					(T
						<CRLF>
					)
				>
				<TELL "You see ">
				<SET FIRST <>>
			)
		>
		<TELL A .OBJ>
		<INC CNT>
		<SET OBJ <NEXT? .OBJ>>
		<REPEAT ()
			<COND
				(<MC-F? .OBJ>
					<RETURN>
				)
				(<AND <MC-ISNOT? .OBJ ,FL-NODESC>
						<NOT <EQUAL? .OBJ ,GL-PUPPY>>
					>
					<RETURN>
				)
			>
			<SET OBJ <NEXT? .OBJ>>
		>
		<COND
			(<MC-T? .OBJ>
				<SET NXT <NEXT? .OBJ>>
				<REPEAT ()
					<COND
						(<MC-F? .NXT>
							<RETURN>
						)
						(<AND <MC-ISNOT? .NXT ,FL-NODESC>
								<NOT <EQUAL? .NXT ,GL-PUPPY>>
							>
							<RETURN>
						)
					>
					<SET NXT <NEXT? .NXT>>
				>
				<COND
					(<MC-F? .NXT>
						<TELL " and ">
					)
					(T
						<TELL ", ">
					)
				>
			)
			(T
				<COND
					(<NOT <IN? .SURFACE ,ROOMS>>
						<TELL " on " THE .SURFACE>
					)
				>
				<TELL ".">
			)
		>
	>

	<SET OBJ <FIRST? .SURFACE>>
	<REPEAT ()
		<COND
			(<MC-F? .OBJ>
				<RETURN>
			)
			(<MC-IS? .OBJ ,FL-SURFACE>
				<SET CNT <RT-DESC-PL-CONT-1 .OBJ .CNT>>
			)
		>
		<SET OBJ <NEXT? .OBJ>>
	>
	<RETURN .CNT>
>

;-----------------------------------------------------------------------------
; "RT-DESCRIBE-PLACE-CONTENTS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DESCRIBE-PLACE-CONTENTS ("OPTIONAL" (PLACE <>) (LOOK <>) "AUX" OBJ PREV (CNT 0) LIGHT)

; "if no place is passed as an argument use gl-place-cur"

	<COND
		(<MC-F? .PLACE>
			<SET PLACE ,GL-PLACE-CUR>
		)
	>

; "describe each object"

	<COND
		(<MC-T? <RT-DESC-PL-CONT-1 .PLACE 0>>
			<CRLF>
		)
	>
	<RTRUE>
>




;-----------------------------------------------------------------------------
; "RT-DESC-ALL"
;-----------------------------------------------------------------------------

<ROUTINE RT-DESC-ALL ("OPTIONAL" (PLACE <>) (LOOK <>))
	<COND
		(<RT-DESCRIBE-PLACE .PLACE .LOOK>
			<RT-DESCRIBE-PLACE-CONTENTS .PLACE .LOOK>
		)
	>
	<COND
		(<MC-F? ,GL-PUPPY-MSG?>
			<SETG GL-PUPPY-MSG? T>
		)
		(<MC-T? ,GL-PUPPY>
			<COND
				(<EQUAL? ,GL-PUPPY ,CH-HOLMES>
					<TELL	CR
						<RT-PICK-NEXT ,GL-HOLMES-DESC-TXT>
					>
					<COND
						(<MC-T? .LOOK>
							<COND
								(<IN? ,CH-HOLMES ,TH-BOAT>
									<TELL ,K-SEASICK-MSG>
								)
								(<OR <IN? ,CH-HOLMES ,TH-HANSOM-CAB>
									  <IN? ,CH-HOLMES ,TH-GROWLER-CAB>
									>
										<TELL ,K-SITTING-QUIETLY-MSG>
								)
								(<MC-HERE?
										,RM-ENTRY-HALL
										,RM-PARLOUR
										,RM-VESTIBULE
										,RM-HOLMES-STUDY
										,RM-HOLMES-BEDROOM
									>
									<TELL
										<RT-PICK-NEXT ,GL-HOLMES-HOUSE-LOOK-TXT>
									>
								)
								(<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
									<TELL
										<RT-PICK-NEXT ,GL-HOLMES-INDOORS-LOOK-TXT>
									>
								)
								(T
									<TELL
										<RT-PICK-NEXT ,GL-HOLMES-OUTDOORS-LOOK-TXT>
									>
								)
							>
							<TELL "." CR>
						)
						(<EQUAL? ,GL-DESC-LEVEL 2 1>
							<COND
								(<MC-HERE?
										,RM-ENTRY-HALL
										,RM-PARLOUR
										,RM-VESTIBULE
										,RM-HOLMES-STUDY
										,RM-HOLMES-BEDROOM
									>
									<TELL
										<RT-PICK-NEXT ,GL-HOLMES-HOUSE-ENTER-TXT>
									>
								)
								(<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
									<TELL
										<RT-PICK-NEXT ,GL-HOLMES-INDOORS-ENTER-TXT>
									>
								)
								(T
									<TELL
										<RT-PICK-NEXT ,GL-HOLMES-OUTDOORS-ENTER-TXT>
									>
								)
							>
							<TELL "." CR>
						)
					>
				)
				(<EQUAL? ,GL-PUPPY ,CH-WIGGINS>
					<TELL	CR
						<RT-PICK-NEXT ,GL-WIGGINS-DESC-TXT>
					>
					<COND
						(<MC-T? .LOOK>
							<COND
								(<IN? ,CH-WIGGINS ,TH-BOAT>
									<TELL ,K-ENJOYING-RIDE-MSG>
								)
								(<OR <IN? ,CH-WIGGINS ,TH-HANSOM-CAB>
									  <IN? ,CH-WIGGINS ,TH-GROWLER-CAB>
									>
										<TELL ,K-FIDGETING-MSG>
								)
								(T
									<TELL
										<RT-PICK-NEXT ,GL-WIGGINS-LOOK-TXT>
									>
								)
							>
							<TELL "." CR>
						)
						(<EQUAL? ,GL-DESC-LEVEL 2 1>
							<TELL <RT-PICK-NEXT ,GL-WIGGINS-ENTER-TXT> "." CR>
						)
					>
				)
			>
		)
	>
	<RTRUE>
>

<GLOBAL GL-HOLMES-INDOORS-LOOK-TXT:TABLE
	<LTABLE 2
		"'s brow is furrowed in intense concentration"
		" is pacing back and forth nervously"
		"'s eyes are half-closed, but they miss nothing"
		" is looking around with interest"
		" appears lost in deep thought"
		"'s lean, severe face gives away none of his thoughts"
		" is here, awaiting your next move"
	>
>

<GLOBAL GL-HOLMES-INDOORS-ENTER-TXT:TABLE
	<LTABLE 2
		" trails along after you"
		" walks into the room alongside you"
		" enters and begins pacing back and forth nervously"
		" follows you"
		" joins you and starts looking around with interest"
		" drifts in after you, apparently lost in thought"
	>
>

<GLOBAL GL-HOLMES-HOUSE-LOOK-TXT:TABLE
	<LTABLE 2
		" is pacing back and forth nervously"
		" appears lost in thought"
		" is here, awaiting your next move"
	>
>

<GLOBAL GL-HOLMES-HOUSE-ENTER-TXT:TABLE
	<LTABLE 2
		" walks into the room alongside you"
		" enters and begins pacing back and forth nervously"
		" drifts in after you, apparently lost in thought"
	>
>

<GLOBAL GL-HOLMES-OUTDOORS-LOOK-TXT:TABLE
	<LTABLE 2
		" is staring at the sky, as if he might find a clue there"
		" is looking around with interest"
		" is pacing back and forth nervously"
		"'s lean, severe face gives away none of his thoughts"
		" appears lost in thought"
		" is here"
		"'s eyes are half-closed, but they miss nothing"
	>
>

<GLOBAL GL-HOLMES-OUTDOORS-ENTER-TXT:TABLE
	<LTABLE 2
		" walks alongside you"
		" trails along after you"
		" follows you and begins pacing back and forth nervously"
		" joins you and starts looking around with interest"
		" follows you"
		" drifts along after you, apparently lost in thought"
	>
>

<GLOBAL GL-WIGGINS-LOOK-TXT:TABLE
	<LTABLE 2
		" is shifting his weight from one foot to the other"
		" appears eager to help"
		" is standing around, waiting for you to do something"
		" is looking around with interest"
		" is here"
		" appears fascinated by everything"
	>
>

<GLOBAL GL-WIGGINS-ENTER-TXT:TABLE
	<LTABLE 2
		" follows you"
		" walks alongside you"
		" joins you and starts looking around with interest"
		" drifts along after you"
	>
>


;-----------------------------------------------------------------------------
; "RT-GOTO"
;-----------------------------------------------------------------------------

<ROUTINE RT-GOTO (NEWPLACE "AUX" X NEWLIT? OLDPLACE AMP? SS?)

	<SET OLDPLACE ,GL-PLACE-CUR>

	<MOVE ,CH-PLAYER .NEWPLACE>
	<SETG GL-PLACE-CUR .NEWPLACE>

	<SET NEWLIT? <RT-IS-LIT?>>

	<MOVE ,CH-PLAYER .OLDPLACE>
	<SETG GL-PLACE-CUR .OLDPLACE>

	<COND
		(<MC-F? .NEWLIT?>
			<TELL "You start off into the ">
			<COND
				(<MC-IS? .NEWPLACE ,FL-INDOORS>
					<TELL "darkness">
				)
				(T
					<TELL "fog">
				)
			>
			<TELL ", but think better of it when you realize you have no light
to guide your way." CR
			>
			<RTRUE>
		)
	>

	<SET X <APPLY <GETP ,GL-PLACE-CUR ,P?ACTION> ,K-M-EXIT>>

	<COND
		(<AND <MC-ISNOT? .OLDPLACE ,FL-INDOORS>
				<MC-ISNOT? .NEWPLACE ,FL-INDOORS>
			>
			<RT-CLOCK-JMP 0 5 0>
		)
	>

	<SETG GL-PLACE-PRV .OLDPLACE>
	<SETG GL-PLACE-CUR .NEWPLACE>

	<SETG GL-NOW-LIT? <RT-IS-LIT?>>

	<MOVE ,CH-PLAYER ,GL-PLACE-CUR>

	<SET X <APPLY <GETP ,GL-PLACE-CUR ,P?ACTION> ,K-M-ENTERING>>

	<COND
		(<MC-T? ,GL-PUPPY>
			<MOVE ,GL-PUPPY <LOC ,CH-PLAYER>>
		)
	>

	<RT-DESC-ALL>

	<SET AMP?
		<AND
			<IN? ,TH-ETHERIUM-AMPOULE ,CH-PLAYER>
			<NOT <EQUAL? <RT-ANYONE-HERE?> <> ,CH-HOLMES>>
		>
	>
	<SET SS? <MC-IS? ,TH-STETHOSCOPE ,FL-WORN>>

	<COND
		(<AND <EQUAL? <RT-WHO-SAYS?> ,CH-HOLMES>
				<OR .AMP? .SS?>
			>
			<TELL CR "Holmes ">
			<COND
				(.AMP?
					<TELL
"takes you aside and whispers, \"Watson, you must keep the ampoule hidden"
					>
					<COND
						(.SS?
							<TELL
", and take that ridiculous thing out of your ears"
							>
						)
					>
				)
				(.SS?
					<TELL
"says, \"Watson, take that ridiculous thing out of your ears"
					>
				)
			>
			<TELL ".\"" CR>
		)
	>

	<SET X <APPLY <GETP ,GL-PLACE-CUR ,P?ACTION> ,K-M-ENTERED>>

	<RT-RESET-THEM>

	<RT-SMELL-ETHERIUM?>		;"Check if etherium is in the room."

	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-RANK-STR"
;-----------------------------------------------------------------------------

<ROUTINE RT-RANK-STR (PTS)
	<COND
		(<L? .PTS 1>
			<RETURN "Chief Superintendant of Scotland Yard">
		)
		(<L? .PTS 21>
			<RETURN "Inspector">
		)
		(<L? .PTS 41>
			<RETURN "Detective">
		)
		(<L? .PTS 61>
			<RETURN "Lieutenant">
		)
		(<L? .PTS 81>
			<RETURN "Sergeant">
		)
		(<L? .PTS 91>
			<RETURN "Private">
		)
		(<L? .PTS 100>
			<RETURN "Patrolman">
		)
		(T
			<RETURN "Consulting Detective">
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-NEW-SCORE-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-NEW-SCORE-MSG (PTS)
	<HLIGHT ,K-H-BLD>

	<COND
		(<MC-T? ,GL-SCORE-MSG>
			<TELL CR "[Your score just went up by " N .PTS " point">
			<COND
				(<G? .PTS 1>
					<TELL "s">
				)
			>
			<TELL
". The total is now " N ,GL-SCORE-CUR " out of " N ,GL-SCORE-MAX ".]" CR>
		)
	>

	<HLIGHT ,K-H-NRM>
>

;-----------------------------------------------------------------------------
; "RT-UPDATE-SCORE"
;-----------------------------------------------------------------------------

<ROUTINE RT-UPDATE-SCORE ("OPTIONAL" (PTS 1))
	<SETG GL-SCORE-CUR <+ ,GL-SCORE-CUR .PTS>>
	<RT-NEW-SCORE-MSG .PTS>
>

;-----------------------------------------------------------------------------
; "RT-UPDATE-MOVES"
;-----------------------------------------------------------------------------

<ROUTINE RT-UPDATE-MOVES ("OPTIONAL" (MVS 1))
	<COND
		(<MC-T? ,GL-CLOCK-WAIT>
;			<SETG GL-CLOCK-WAIT <>>		; "RT-CLOCK-INC does this."
			<RFALSE>
		)
		(<MC-T? ,GL-CLOCK-STOP>
			<RFALSE>
		)
	>

	<SETG GL-MOVES-CUR <+ ,GL-MOVES-CUR .MVS>>
>

;-----------------------------------------------------------------------------
; "RT-UPDATE-CLOCK"
;-----------------------------------------------------------------------------

<ROUTINE RT-UPDATE-CLOCK ("OPTIONAL" (HRS 0) (MIN 0) (SEC 0))
	<COND
		(<OR	<MC-NOTZERO? .HRS>
				<MC-NOTZERO? .MIN>
				<MC-NOTZERO? .SEC>
				>
					<RT-CLOCK-INC-SET .HRS .MIN .SEC>
		)
	>
	<RT-CLOCK-INC>
>

;-----------------------------------------------------------------------------
; "RT-DO-MAIN-LOOP"
;-----------------------------------------------------------------------------

<ROUTINE RT-DO-MAIN-LOOP ("AUX" X)
	<REPEAT ()
		<SET X <RT-MAIN-LOOP>>
	>
>

;-----------------------------------------------------------------------------
; "RT-MAIN-LOOP"
;-----------------------------------------------------------------------------

<ROUTINE RT-MAIN-LOOP ("AUX" ICNT OCNT NUM CNT OBJ TBL (V <>)
								PTBL OBJ1 TMP X)
   <SET CNT 0>
   <SET OBJ <>>
   <SET PTBL T>

   <COND
      (<NOT <MC-HERE? GL-P-QCONTEXT-RM>>
         <SETG GL-P-QCONTEXT-TH <>>
      )
   >

   <SETG GL-P-GOOD <RT-PARSER>>

   <COND
      (<MC-T? ,GL-P-GOOD>
         <SET ICNT <GET ,GL-P-PRSI ,K-P-MATCHLEN>>
         <SET OCNT <GET ,GL-P-PRSO ,K-P-MATCHLEN>>
         <COND
            (<AND	<MC-T? ,GL-P-IT-OBJECT>
						<RT-ACCESSIBLE? ,GL-P-IT-OBJECT>
					>
         	   <SET TMP <>>
         		<REPEAT ()
            		<COND
                     (<G? <SET CNT <+ .CNT 1>> .ICNT>
                         <RETURN>
                     )
                     (T
                        <COND
                           (<EQUAL? <GET ,GL-P-PRSI .CNT> ,TH-IT>
                              <PUT ,GL-P-PRSI .CNT ,GL-P-IT-OBJECT>
                              <SET TMP T>
                              <RETURN>
                           )
                        >
                     )
                  >
               >

        		   <COND
                  (<ZERO? .TMP>
                     <SET CNT 0>
                     <REPEAT ()
                        <COND
                           (<G? <SET CNT <+ .CNT 1>> .OCNT>
                              <RETURN>
                           )
                           (T
                              <COND
                                 (<EQUAL? <GET ,GL-P-PRSO .CNT> ,TH-IT>
                                    <PUT ,GL-P-PRSO .CNT ,GL-P-IT-OBJECT>
                                    <RETURN>
                                 )
                              >
                           )
                        >
                     >
                  )
               >
     		   	<SET CNT 0>
				)
         >

         <SET NUM
            <COND
               (<ZERO? .OCNT>
                  .OCNT
               )
               (<G? .OCNT 1>
                  <SET TBL ,GL-P-PRSO>
         			<COND
                     (<ZERO? .ICNT>
                        <SET OBJ <>>
                     )
                     (T
                        <SET OBJ <GET ,GL-P-PRSI 1>>
                     )
                  >
         			.OCNT
               )
               (<G? .ICNT 1>
                  <SET PTBL <>>
                  <SET TBL ,GL-P-PRSI>
                  <SET OBJ <GET ,GL-P-PRSO 1>>
         			.ICNT
               )
               (T
                  1
               )
            >
         >
         <COND
            (<AND	<ZERO? .OBJ>
						<EQUAL? .ICNT 1>
					>
					<SET OBJ <GET ,GL-P-PRSI 1>>
            )
         >

         <COND
            (<MC-VERB? WALK>
               <SET V <RT-PERFORM ,GL-PRSA ,GL-PRSO>>
            )
            (<ZERO? .NUM>
      		   <COND
                  (<ZERO? <BAND <GETB ,GL-P-SYNTAX ,K-P-SBITS> ,K-P-SONUMS>>
                     <SET V <RT-PERFORM ,GL-PRSA>>
                     <SETG GL-PRSO <>>
                  )
                  (<ZERO? ,GL-NOW-LIT?>
                     <RT-P-CLEAR>
                     <TELL ,K-TOO-DARK-MSG CR>
                  )
		            (T
		               <RT-P-CLEAR>
		               <TELL "[There isn't anything to ">
		               <SET TMP <GET ,GL-P-ITBL ,K-P-VERBN>>
		               <COND
		                  (<INTBL? ,GL-PRSA <REST ,GL-TALK-VERBS 2> <GET ,GL-TALK-VERBS 0>>
		   			         <TELL "talk to">
		                  )
		                  (<OR	<MC-T? ,GL-P-MERGED>
										<MC-T? ,GL-P-ORPH>
									>
									<PRINTB <GET .TMP 0>>
		                  )
						      (T
		         			   <SET V <RT-WORD-PRINT <GETB .TMP 2>
								   <GETB .TMP 3>>>
		                  )
		               >
		               <TELL ".]" CR>
		               <SET V <>>
		            )
		         >
		      )
		      (T
		         <SET X 0>
				   <SETG GL-P-MULT? <>>
				   <COND
		            (<G? .NUM 1>
		               <SETG GL-P-MULT? T>
		            )
		         >
				   <SET TMP <>>
				   <REPEAT ()
		            <COND
		               (<G? <SET CNT <+ .CNT 1>> .NUM>
		                  <COND
		                     (<G? .X 0>
		                        <TELL "[The ">
		                        <COND
		                           (<NOT <EQUAL? .X .NUM>>
		                              <TELL "other ">
		                           )
		                        >
						            <TELL "object">
		                        <COND
		                           (<NOT <EQUAL? .X 1>>
		                              <TELL "s">
		                           )
		                        >
						            <TELL " that you mentioned ">
		                        <COND
		                           (<NOT <EQUAL? .X 1>>
		                              <TELL "are">
		                           )
		            					(T
		                              <TELL "is">
		                           )
		                        >
		                        <TELL "n't here.]" CR>
		                     )
		                     (<ZERO? .TMP>
		                        <RT-REFER-TO-MSG>
		                     )
		                  >
		                  <RETURN>
		               )
		               (T
		                  <COND
		                     (<MC-T? .PTBL>
		                        <SET OBJ1 <GET ,GL-P-PRSO .CNT>>
		                     )
		                     (T
		                        <SET OBJ1 <GET ,GL-P-PRSI .CNT>>
		                     )
		                  >
		               	<COND
		                     (<OR	<G? .NUM 1>
											<EQUAL? <GET <GET ,GL-P-ITBL ,K-P-NC1> 0>
		                           	,W?ALL ,W?EVERYTHING>
											>
			                        <COND
			                           (<EQUAL? .OBJ1 ,TH-NOT-HERE-OBJECT>
			                  		      <INC X>
			                  		      <AGAIN>
			                           )
			                           (<AND	<EQUAL? ,GL-P-GET-FLAGS ,K-P-ALL>
				                  			   <RT-DONT-ALL? .OBJ1 .OBJ>
													>
													<AGAIN>
			                           )
					                     (<NOT <RT-ACCESSIBLE? .OBJ1>>
			                  		      <AGAIN>
			                           )
			                           (<EQUAL? .OBJ1 ,CH-PLAYER>
			                  		      <AGAIN>
			                           )
			                           (T
			                              <COND
			                                 (<EQUAL? .OBJ1 ,TH-IT>
			                                    <TELL CTHE ,GL-P-IT-OBJECT>
			                                 )
			                                 (T
			                                    <TELL CTHE .OBJ1>
			                                 )
			                              >
			                              <TELL ": ">
			                           )
			                        >
		                     )
		                  >
		                  <SET TMP T>
		                  <SETG GL-PRSO
		                     <COND
		                        (<MC-T? .PTBL>
		                           .OBJ1
		                        )
		                        (T
		                           .OBJ
		                        )
		                     >
		                  >
		                  <SETG GL-PRSI
		                     <COND
		                        (<MC-T? .PTBL>
		                           .OBJ
		                        )
		                        (T
		                           .OBJ1
		                        )
		                     >
		                  >

								; "DEB -- Do real visibility or accessibility tests here."

								<COND
									(<OR <INTBL? ,GL-PRSA <REST ,GL-SEE-VERBS 2> <GET ,GL-SEE-VERBS 0>>
										  <INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
										>
										<COND
											(<AND <MC-T? ,GL-PRSO>
													<NOT <RT-VISIBLE? ,GL-PRSO>>
												>
												<RT-CANT-SEE-ANY-MSG ,GL-PRSO>
												<AGAIN>
											)
											(<AND <MC-T? ,GL-PRSI>
													<NOT <RT-VISIBLE? ,GL-PRSI>>
												>
												<RT-CANT-SEE-ANY-MSG ,GL-PRSI>
												<AGAIN>
											)
										>
									)
								>
								<COND
									(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
										<COND
											(<AND <MC-T? ,GL-PRSO>
													<NOT <RT-ACCESSIBLE? ,GL-PRSO>>
												>
												<RT-CANT-TOUCH-MSG ,GL-PRSO ,GL-CLOSED-OBJECT ,GL-IN-OUT>
												<AGAIN>
											)
											(<AND <MC-T? ,GL-PRSI>
													<NOT <RT-ACCESSIBLE? ,GL-PRSI>>
												>
												<RT-CANT-TOUCH-MSG ,GL-PRSI ,GL-CLOSED-OBJECT ,GL-IN-OUT>
												<AGAIN>
											)
										>
									)
								>

								; "DEB -- End real visibility and accessibility tests."

		                  <SET V <RT-PERFORM ,GL-PRSA ,GL-PRSO ,GL-PRSI>>
		                  <COND
		                     (<EQUAL? .V ,K-M-FATAL>
		                        <RETURN>
		                     )
		                  >
		               )
		            >
		         >
					<COND
						(,GL-P-OVERFLOW
							<TELL
CR "[Note: There are so many objects here that a few may have been overlooked.
Please double check to make sure you have accomplished what you intended.]"
CR
							>
						)
					>
		      )
		   >

         <COND
            (<EQUAL? .V ,K-M-FATAL>
               <SETG GL-P-CONT <>>
            )
         >
      )
	   (T
         <SETG GL-P-CONT <>>
      )
   >

   <COND
      (<AND <MC-T? ,GL-P-GOOD>
				<NOT <EQUAL? .V ,K-M-FATAL>>
				<NOT <INTBL? ,GL-PRSA <REST ,GL-GAME-VERBS 2> <GET ,GL-GAME-VERBS 0>>>
			>

			<RT-UPDATE-MOVES>
			<RT-UPDATE-CLOCK>
;			<RT-EVENT-CHK>
			<RT-ALARM-CHK>
      )
   >

	<RT-TIME-OF-DAY-MSG>

   <SETG GL-PRSA <>>
   <SETG GL-PRSO <>>
   <SETG GL-PRSI <>>

   <RFALSE>
>

;******************************************************************************
; "end of file"
;******************************************************************************

