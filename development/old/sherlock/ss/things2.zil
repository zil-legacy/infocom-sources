;*****************************************************************************
; "game : SHERLOCK!"
; "file : THINGS2.ZIL"
; "auth :   $Author:   RAB  $"
; "date :     $Date:   28 Oct 1987  4:36:08  $"
; "rev  : $Revision:   1.144  $"
; "vers : 1.00"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "this file contains:"
; "  action routines for generic objects"
; "  action routines for game    objects" 
;-----------------------------------------------------------------------------

;*****************************************************************************
; "routine support"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "GL-LASTFOC"
;-----------------------------------------------------------------------------

<GLOBAL GL-LASTFOC:OBJECT <>> 			; "last object focused on"

;-----------------------------------------------------------------------------
; "RT-VW-PRINT"
;-----------------------------------------------------------------------------

<ROUTINE RT-VW-PRINT ()
	<PRINTB ,GL-P-PRSA-WORD>
>

;-----------------------------------------------------------------------------
; "RT-FLOOR-GROUND"
;-----------------------------------------------------------------------------

<ROUTINE RT-FLOOR-GROUND (THING INDOORS? "AUX" OBJ NXT)
	<COND
		(<EQUAL? .INDOORS? <MC-ISNOT? ,GL-PLACE-CUR ,FL-INDOORS>>
			<RT-CANT-SEE-ANY-MSG .THING>
			<MC-RFATAL>
		)
		(<MC-THIS-PRSI?>
			<COND
				(<MC-VERB? PUT-ON PUT THROW THROW-OVER EMPTY-INTO>
					<RT-PERFORM ,V?DROP ,GL-PRSO>
				)
			>
		)
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? CROSS>
					<V-WALK-AROUND>
				)
				(<MC-VERB? EXAMINE LOOK-ON SEARCH>
					<COND
						(<APPLY <GETP .THING ,P?DESCFCN>>
							<RTRUE>
						)
					>
					<RT-REMOVE-ALL ,TH-X-OBJECT>
					<SET OBJ <FIRST? ,GL-PLACE-CUR>>
					<REPEAT ()
						<COND
							(.OBJ
								<SET NXT <NEXT? .OBJ>>
								<COND
									(<OR	<MC-IS? .OBJ ,FL-NODESC>
											<AND
												<MC-IS? .OBJ ,FL-ALIVE>
												<MC-ISNOT? .OBJ ,FL-ASLEEP>
											>
											<AND
												<MC-ISNOT? .OBJ ,FL-TAKEABLE>
												<MC-ISNOT? .OBJ ,FL-TRYTAKE>
											>
										>
										<MOVE .OBJ ,TH-X-OBJECT>
									)
								>
								<SET OBJ .NXT>
							)
							(T
								<RETURN>
							)
						>
					>
					<COND
						(<FIRST? ,GL-PLACE-CUR>
							<RT-CYOU-MSG "see" "sees">
							<RT-PRINT-CONTENTS-2 ,GL-PLACE-CUR>
						)
						(T
							<TELL
"There is nothing very " <RT-PICK-NEXT ,GL-BORING-TXT>
							>
						)
					>
					<TELL " on " THE .THING "." CR>
					<RT-MOVE-ALL ,TH-X-OBJECT ,GL-PLACE-CUR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-CEILING-SKY"
;-----------------------------------------------------------------------------

<ROUTINE RT-CEILING-SKY (THING INDOORS? "AUX" TOD)
	<COND
		(<EQUAL? .INDOORS? <MC-ISNOT? ,GL-PLACE-CUR ,FL-INDOORS>>
			<RT-CANT-SEE-ANY-MSG .THING>
			<MC-RFATAL>
		)
		(<MC-THIS-PRSI?>
			<RFALSE>
		)
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? EXAMINE LOOK-INSIDE SEARCH>
					<COND
						(<EQUAL? ,GL-PLACE-CUR ,RM-HENRY-VII-CHAPEL>
							<TELL CTHE .THING " is breathtakingly beautiful." CR>
						)
						(<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
							<TELL CTHE .THING " is high above you." CR>
							<RTRUE>
						)
						(T
							<TELL CTHE .THING>
							<SET TOD <RT-TIME-OF-DAY>>
							<COND
								(<EQUAL? .TOD 0>
									<TELL " is dark and foggy." CR>
								)
								(<EQUAL? .TOD 1>
									<TELL " is foggy, but at least there's enough light to see." CR>
								)
								(<EQUAL? .TOD 2>
									<TELL " is getting lighter." CR>
								)
								(<EQUAL? .TOD 3>
									<TELL " is getting darker." CR>
								)
							>
						)
					>
				)
				(<MC-VERB? SHOOT>
					<COND
						(<MC-ISNOT? ,GL-PLACE-CUR ,FL-INDOORS>
							<TELL
"The bullet disappears into the air." CR
							>
						)
					>
				)
			>
		)
	>
>

;*****************************************************************************
; "action routines for generic objects"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-AC-TH-FLOOR"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-FLOOR ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-FLOOR">
		)
		(T
		)
	>
	<RT-FLOOR-GROUND ,TH-FLOOR T>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-CEILING"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-CEILING ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-CEILING">
		)
		(T
		)
	>
	<RT-CEILING-SKY ,TH-CEILING T>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-GROUND"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-GROUND ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-GROUND">
		)
		(T
		)
	>
	<RT-FLOOR-GROUND ,TH-GROUND <>>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-SKY"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-SKY ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-SKY">
		)
		(T
		)
	>
	<RT-CEILING-SKY ,TH-SKY <>>
>	

;-----------------------------------------------------------------------------
; "RT-AC-TH-NOT-HERE-OBJECT"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-NOT-HERE-OBJECT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-NOT-HERE-OBJECT">
		)
		(T
		)
	>
	<RT-TH-NOT-HERE-OBJECT>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-INTDIR"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-INTDIR ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-INTDIR">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? SHOOT>
			<RT-WASTE-OF-BULLETS-MSG>
		)
		(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-MINUTE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-MINUTE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-MINUTE">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
		(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
		(<INTBL? ,GL-PRSA <REST ,GL-SEE-VERBS 2> <GET ,GL-SEE-VERBS 0>>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-HOUR"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-HOUR ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-HOUR">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
		(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
		(<INTBL? ,GL-PRSA <REST ,GL-SEE-VERBS 2> <GET ,GL-SEE-VERBS 0>>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-HANDS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-HANDS ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-HANDS">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<COND
				(<AND <MC-PRSI? <>>
						<MC-VERB? TAKE>
						<MC-IS? ,TH-HANDS ,FL-LOCKED>
					>
					<MC-UNMAKE ,TH-HANDS ,FL-LOCKED>
					<RT-CYOU-MSG "take" "takes">
					<TELL THE ,TH-HANDS " off of " THE ,TH-EARS "." CR>
				)
				(<MC-PRSI? ,TH-EARS>
					<COND
						(<MC-VERB? TAKE>
							<COND
								(<MC-ISNOT? ,TH-HANDS ,FL-LOCKED>
									<TELL "Your hands are not on " THE ,TH-EARS "." CR>
								)
								(T
									<MC-UNMAKE ,TH-HANDS ,FL-LOCKED>
									<RT-CYOU-MSG "take" "takes">
									<TELL THE ,TH-HANDS " off of " THE ,TH-EARS "." CR>
								)
							>
						)
						(<MC-VERB? PUT-ON>
							<COND
								(<MC-IS? ,TH-HANDS ,FL-LOCKED>
									<TELL "Your hands are already on " THE ,TH-EARS "." CR>
								)
								(T
									<MC-MAKE ,TH-HANDS ,FL-LOCKED>
									<RT-CYOU-MSG "put" "puts">
									<TELL THE ,TH-HANDS " on " THE ,TH-EARS "." CR>
								)
							>
							<RTRUE>
						)
					>
				)
			>
		)
		(<MC-THIS-PRSI?>
			<COND
				(<MC-PRSO? ,TH-EARS>
					<COND
						(<MC-VERB? COVER>
							<COND
								(<MC-IS? ,TH-HANDS ,FL-LOCKED>
									<TELL "Your hands are already on " THE ,TH-EARS "." CR>
								)
								(T
									<MC-MAKE ,TH-HANDS ,FL-LOCKED>
									<RT-CYOU-MSG "put" "puts">
									<TELL THE ,TH-HANDS " on " THE ,TH-EARS "." CR>
								)
							>
							<RTRUE>
						)
					>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-WATSONS-HEART"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-WATSONS-HEART ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-WATSONS-HEART">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? LISTEN>
			<TELL "Your heart is beating ">
			<COND
				(<MC-HERE? ,RM-BAR-OF-GOLD ,RM-LAIR ,RM-SWAN-LANE>
					<TELL "so loudly you're surprised everyone can't hear it">
				)
				(T
					<TELL "normally">	
				)
			>
			<TELL "." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-EARS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-EARS ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-EARS">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSI?>
			<COND
				(<MC-VERB? PUT>
					<COND
						(<MC-PRSO? ,TH-HANDS ,TH-STETHOSCOPE>
							<RFALSE>
						)
						(<IN? ,GL-PRSO ,TH-EARS>
							<TELL CTHEO>
							<RT-IS-ARE-MSG>
							<TELL "already in " THEI "." CR>
						)
						(<MC-PRSO? ,TH-COTTON-BALLS>
							<COND
								(<MC-IS? ,TH-STETHOSCOPE ,FL-WORN>
									<RT-CYOU-MSG>
									<RT-WOULD-HAVE-TO-MSG "take out" ,TH-STETHOSCOPE>
									<TELL "first." CR>
									<RTRUE>
								)
								(T
									<SETG GL-LISTEN-OBJ <>>
									<MOVE ,TH-COTTON-BALLS ,TH-EARS>
									<RT-CYOU-MSG "put" "puts">
									<TELL THEO " in " THEI "." CR>
								)
							>
						)
						(T
							<TELL "You cannot put that in " THE ,TH-EARS "." CR>
						)
					>
				)
				(<MC-VERB? TAKE>
					<COND
						(<MC-PRSO? ,TH-HANDS ,TH-STETHOSCOPE>
							<RFALSE>
						)
						(<NOT <IN? ,GL-PRSO ,TH-EARS>>
							<TELL CTHEO>
							<RT-ISNT-ARENT-MSG>
							<TELL "in " THEI "." CR>
						)
						(<MC-PRSO? ,TH-COTTON-BALLS>
							<COND
								(<AND <EQUAL? <FIRST? ,TH-EARS> ,GL-PRSO>
										<MC-F? <NEXT? ,GL-PRSO>>
									>
									<SETG GL-LISTEN-OBJ <>>
									<MOVE ,TH-COTTON-BALLS ,CH-PLAYER>
									<TELL "You take the cotton balls out of your ears." CR>
								)
								(T
									<RT-CYOU-MSG>
									<RT-WOULD-HAVE-TO-MSG "take out" ,TH-STETHOSCOPE>
									<TELL "first." CR>
									<RTRUE>
								)
							>
						)
						(T
							<RT-CYOU-MSG>
							<TELL "cannot take that out of " THEI "." CR>
						)
					>
				)
				(<MC-VERB? EMPTY EMPTY-INTO>
					<RT-CYOU-MSG>
					<TELL "cannot empty anything into " THEI "." CR>
				)
			>
		)
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? LOOK-INSIDE LOOK-ON EXAMINE>
					<TELL ,K-EYES-HINGED-MSG CR>
				)
				(<MC-VERB? REACH-IN SEARCH>
					<COND
						(<MC-IS? ,TH-STETHOSCOPE ,FL-WORN>
							<RT-CYOU-MSG "feel" "feels">
							<TELL THE ,TH-STETHOSCOPE "." CR>
						)
					>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-HEAD"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-HEAD ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-HEAD">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSI?>
			<RFALSE>
		)
		(<MC-THIS-PRSO?>
			<COND
				(<AND <MC-VERB? TOUCH SEARCH>
						<MC-IS? ,TH-WATSONS-HAT ,FL-WORN>
					>
					<TELL "You are wearing " THE ,TH-WATSONS-HAT "." CR>
				)
				(<MC-VERB? EXAMINE LOOK-ON>
					<TELL ,K-EYES-HINGED-MSG CR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-BREATH"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-BREATH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-BREATH">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSI?>
			<RFALSE>
		)
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? EXAMINE LOOK-INSIDE SEARCH> 
					<COND
						(<MC-IS? ,GL-PLACE-CUR ,FL-COLD>
							<TELL "It puffs like steam in the cold air." CR>
						)
						(T
							<TELL "It is not cold enough to see " D ,TH-BREATH "." CR>
						)
					>
				)
				(<MC-VERB? SMELL>
					<TELL "It smells no worse than usual." CR>
				)
				(<MC-VERB? RELEASE>
					<V-EXHALE>
				)
				(<MC-VERB? TAKE SUCK>
					<COND
						(<NOT <MC-PRSI? <> ,ROOMS>>
							<RT-IMPOSSIBLE-MSG>
						)
						(<MC-VERB-WORD? HOLD TAKE CATCH GET GRAB SUCK>
							<V-INHALE>
						)
						(T
							<TELL "You cannot " VW " " THE ,TH-BREATH "." CR>
						)
					>
				)
				(<MC-VERB? SHOOT>
					<TELL
"It's bad, but it doesn't deserve to die." CR
					>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-CLOTHES"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-CLOTHES ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-CLOTHES">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? LOOK-INSIDE SEARCH>
			<RT-PERFORM ,V?LOOK-INSIDE ,TH-POCKET>
			<RTRUE>
		)
		(<AND
			<MC-VERB? PUT>
			<MC-PRSI? TH-CLOTHES>
			>
				<TELL "[in " THE ,TH-POCKET "]">
				<RT-PERFORM ,V?PUT ,GL-PRSO ,TH-POCKET>
				<RTRUE>
		)
		(<MC-VERB? WEAR>
			<TELL "you are already wearing them." CR>
			<RTRUE>
		)
		(<MC-VERB? TAKE-OFF DROP RAISE>
			<TELL ,K-INAPPROPRIATE-MSG CR>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-WATERMARK"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-WATERMARK ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-WATERMARK">
		)
		(T
		)
	>
	<COND
		(<OR	<RT-VISIBLE? ,TH-GREEN-PAPER>
				<RT-VISIBLE? ,TH-WHITE-PAPER>
				<RT-VISIBLE? ,TH-BLUE-PAPER>
				<RT-VISIBLE? ,TH-ORANGE-PAPER>
				<RT-VISIBLE? ,TH-YELLOW-PAPER>
				<RT-VISIBLE? ,TH-BROWN-PAPER>
			>
			<COND
				(<MC-VERB? SHOOT>
					<RT-WASTE-OF-BULLETS-MSG>
				)
			>
		)
		(T
			<RT-CYOU-MSG "do" "does">
			<TELL "not see any " D ,TH-WATERMARK " here." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-THEFT"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-THEFT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-THEFT">
		)
		(T
		)
	>
	<COND
		(<NOT <INTBL? ,GL-PRSA <REST ,GL-TALK-VERBS 2> <GET ,GL-TALK-VERBS 0>>>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-JUBILEE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-JUBILEE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-JUBILEE">
		)
		(T
		)
	>
	<COND
		(<NOT <INTBL? ,GL-PRSA <REST ,GL-TALK-VERBS 2> <GET ,GL-TALK-VERBS 0>>>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-SESAME"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-SESAME ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-SESAME">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? OPEN>
			<TELL "Ali Baba you're not." CR>
			<RTRUE>
		)
		(<NOT <INTBL? ,GL-PRSA <REST ,GL-TALK-VERBS 2> <GET ,GL-TALK-VERBS 0>>>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-RIGHT"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-RIGHT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-RIGHT">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<COND
				(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
					<RT-IMPOSSIBLE-MSG>
				)
				(<INTBL? ,GL-PRSA <REST ,GL-SEE-VERBS 2> <GET ,GL-SEE-VERBS 0>>
					<RT-IMPOSSIBLE-MSG>
				)
				(<MC-VERB? SHOOT>
					<RT-IMPOSSIBLE-MSG>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-LEFT"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-LEFT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-LEFT">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<COND
				(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
					<RT-IMPOSSIBLE-MSG>
				)
				(<INTBL? ,GL-PRSA <REST ,GL-SEE-VERBS 2> <GET ,GL-SEE-VERBS 0>>
					<RT-IMPOSSIBLE-MSG>
				)
				(<MC-VERB? SHOOT>
					<RT-IMPOSSIBLE-MSG>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-PASSWORD-OBJ"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-PASSWORD-OBJ ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-PASSWORD-OBJ">
		)
		(T
		)
	>
	<COND
		(<NOT <INTBL? ,GL-PRSA <REST ,GL-TALK-VERBS 2> <GET ,GL-TALK-VERBS 0>>>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-HENRY-IV-OBJ"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-HENRY-IV-OBJ ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-HENRY-IV-OBJ">
		)
		(T
		)
	>
	<COND
		(<NOT <INTBL? ,GL-PRSA <REST ,GL-TALK-VERBS 2> <GET ,GL-TALK-VERBS 0>>>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-WELLINGTON-OBJ"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-WELLINGTON-OBJ ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-WELLINGTON-OBJ">
		)
		(T
		)
	>
	<COND
		(<NOT <INTBL? ,GL-PRSA <REST ,GL-TALK-VERBS 2> <GET ,GL-TALK-VERBS 0>>>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-TOBY-OBJ"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-TOBY-OBJ ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-TOBY-OBJ">
		)
		(T
		)
	>
	<COND
		(<NOT <INTBL? ,GL-PRSA <REST ,GL-TALK-VERBS 2> <GET ,GL-TALK-VERBS 0>>>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-KIDNAPPING-OBJ"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-KIDNAPPING-OBJ ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-KIDNAPPING-OBJ">
		)
		(T
		)
	>
	<COND
		(<NOT <INTBL? ,GL-PRSA <REST ,GL-TALK-VERBS 2> <GET ,GL-TALK-VERBS 0>>>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-AGRA-TREASURE-OBJ"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-AGRA-TREASURE-OBJ ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-AGRA-TREASURE-OBJ">
		)
		(T
		)
	>
	<COND
		(<NOT <INTBL? ,GL-PRSA <REST ,GL-TALK-VERBS 2> <GET ,GL-TALK-VERBS 0>>>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-BULLET-HOLE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-BULLET-HOLE ("AUX" (NUM 0) OFF (HOLE <>) PLACE)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-BULLET-HOLE">
		)
		(T
		)
	>
	<REPEAT ()
		<SET OFF <* .NUM 2>>
		<COND
			(<EQUAL? .NUM <GET ,GL-HOLES 0>>
				<RETURN>
			)
			(<RT-VISIBLE? <GET ,GL-HOLES <+ .OFF 1>>>
				<COND
					(<OR	<MC-F? <SET PLACE <GET ,GL-HOLES <+ .OFF 2>>>>
							<MC-HERE? .PLACE>
						>
						<SET HOLE T>
						<RETURN>
					)
				>
			)
		>
		<INC NUM>
	>
	<COND
		(<MC-F? .HOLE>
			<RT-CANT-SEE-ANY-MSG ,TH-BULLET-HOLE>
		)
		(<MC-VERB? SHOOT>
			<TELL ,K-ANNIE-OAKELEY-MSG CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-WIGGINS-BODY"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-WIGGINS-BODY ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-WIGGINS-BODY">
		)
		(T
		)
	>
	<COND
		(<NOT <RT-VISIBLE? ,CH-WIGGINS>>
			<RT-CANT-SEE-ANY-MSG "Wiggins" T>
		)
		(T
      	<TELL
"[You do not need to refer to any part of Wiggins' body.]" CR
      	>
      	<MC-RFATAL>
      )
   >
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-HOLMES-BODY"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-HOLMES-BODY ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-HOLMES-BODY">
		)
		(T
		)
	>
	<COND
		(<NOT <RT-VISIBLE? ,CH-HOLMES>>
			<RT-CANT-SEE-ANY-MSG "Holmes" T>
		)
		(T
      	<TELL
"[You do not need to refer to any part of Holmes's body.]" CR
      	>
      	<MC-RFATAL>
      )
   >
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-HUDSON-BODY"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-HUDSON-BODY ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-HUDSON-BODY">
		)
		(T
		)
	>
	<COND
		(<NOT <RT-VISIBLE? ,CH-HUDSON>>
			<RT-CANT-SEE-ANY-MSG "Mrs. Hudson" T>
		)
		(T
			<TELL
"[You do not need to refer to any part of Mrs. Hudson's body.]" CR
			>
			<MC-RFATAL>
      )
   >
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-ELIZA-BODY"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-ELIZA-BODY ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-ELIZA-BODY">
		)
		(T
		)
	>
	<COND
		(<NOT <RT-VISIBLE? ,CH-ELIZA-DOOLITTLE>>
			<RT-CANT-SEE-ANY-MSG "the girl" T>
		)
		(T
			<TELL "[You do not need to refer to">
			<RT-CLAUSE-PRINT ,K-P-NC1 ,K-P-NC1L>
			<TELL ".]" CR>
			<MC-RFATAL>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-NORTH-WALL"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-NORTH-WALL ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-NORTH-WALL">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
			<COND
				(<MC-VERB? EXAMINE LOOK-ON>
					<COND
						(<MC-HERE? ,RM-HOLMES-STUDY>
							<TELL
"There is a large fireplace set into the north wall."
							>
						)
					>
				)
			>
		)
		(T
			<TELL ,K-NOT-SEE-HERE-MSG CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-SOUTH-WALL"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-SOUTH-WALL ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-SOUTH-WALL">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
			<COND
				(<MC-VERB? EXAMINE LOOK-ON>
					<COND
						(<MC-HERE? ,RM-HOLMES-STUDY>
							<TELL
"There is a patriotic \"V.R.\" spelled out in bullet marks
on " THE ,TH-SOUTH-WALL "."
							>
						)
					>
				)
			>
		)
		(T
			<TELL ,K-NOT-SEE-HERE-MSG CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-EAST-WALL"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-EAST-WALL ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-EAST-WALL">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
			<RFALSE>
		)
		(T
			<TELL ,K-NOT-SEE-HERE-MSG CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-WEST-WALL"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-WEST-WALL ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-WEST-WALL">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
			<RFALSE>
		)
		(T
			<TELL ,K-NOT-SEE-HERE-MSG CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-WALLS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-WALLS ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-WALLS">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
			<COND
				(<MC-VERB? SHOOT>
					<SETG GL-PRSO <RT-GN-WALL>>
				)
				(<MC-VERB? EXAMINE LOOK-ON>
					<COND
						(<MC-HERE? ,RM-HOLMES-STUDY>
							<TELL "The walls are covered with pictures.">
						)
					>
				)
			>
		)
		(<MC-VERB? EXAMINE LOOK-ON>
			<COND
				(<MC-HERE? ,RM-INSIDE-TRAITORS-GATE>
					<TELL "There are some ravens perched on the wall.">
				)
			>
		)
		(<EQUAL? ,GL-PLACE-CUR ,RM-TOTTENHAM-COURT-RD ,RM-OXFORD-ST ,RM-VICTORIA-SQUARE
					,RM-VICTORIA-STREET ,RM-PARLIAMENT-SQUARE ,RM-QUEENS-GARDENS
					,RM-BUCKINGHAM-PALACE ,RM-DRAWBRIDGE ,RM-BYWARD-TOWER
					,RM-OUTER-WARD ,RM-TOWER-GREEN ,RM-OUTSIDE-TRAITORS-GATE>
			<RFALSE>
		)
		(T
			<TELL ,K-NOT-SEE-HERE-MSG CR>
		)
	>
>

;*****************************************************************************
; "action routines for game objects"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-AC-TH-POCKET"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-POCKET ()
	<COND
		(<AND <MC-VERB? PUT>
				<MC-THIS-PRSI?>
				<MC-PRSO?
					TH-PADDLE
					TH-MACE
					TH-ANCHOR
					TH-PACQUET-OF-PAPER
					TH-SUIT-OF-ARMOUR
					TH-OAR-1
					TH-OAR-2
					TH-TORCH
					TH-WAX-AX
					TH-WAX-HEAD
				>
			>
			<RT-CANT-PUT-IN-ON-MSG ,TH-POCKET>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-GUN"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-GUN ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-GUN">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? OPEN LOOK-INSIDE SEARCH>
			<TELL "The gun is jammed shut. You can't open it." CR>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-KNIFE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-KNIFE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-KNIFE">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? CUT>
			<COND
				(<MC-ISNOT? ,TH-KNIFE ,FL-OPENED>
					<TELL CTHE ,TH-KNIFE " isn't open." CR>
				)
         >
      )
		(<MC-VERB? TAKE>
			<MC-UNMAKE ,TH-KNIFE ,FL-COLD>
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-MAIL"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-TH-MAIL ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-MAIL">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-MAGNIFYING-GLASS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-MAGNIFYING-GLASS ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-MAGNIFYING-GLASS">
		)
		(T
		)
	>

; "DEB -- I put this COND in so that the gem action routine would handle"
; "looking at the gem with the magnifying glass."

	<COND
		(<MC-PRSO?
            TH-SAPPHIRE TH-EMERALD TH-OPAL
            TH-RUBY TH-TOPAZ TH-GARNET
            TH-SAPPHIRE-SCRATCH TH-EMERALD-SCRATCH TH-OPAL-SCRATCH
            TH-RUBY-SCRATCH TH-TOPAZ-SCRATCH TH-GARNET-SCRATCH
         >
			<RFALSE>
		)
	>

	<SETG GL-P-IT-OBJECT ,TH-MAGNIFYING-GLASS>

	<COND
		(<MC-THIS-PRSI?>
			<COND
				(<MC-VERB? LOOK-THRU>
					<COND
						(<NOT <IN? ,GL-PRSI ,CH-PLAYER>>
							<RT-YOUD-HAVE-TO-MSG "be holding" ,GL-PRSI>
							<RTRUE>
						)
						(<EQUAL? ,GL-PRSO ,TH-MAGNIFYING-GLASS>
							<RT-IMPOSSIBLE-MSG>
						)
						(<NOT <EQUAL? ,GL-LASTFOC ,GL-PRSO>>
							<SETG GL-LASTFOC ,GL-PRSO>
							<TELL "You train the magnifying glass on " THEO "." CR>
						)
					>
					<COND
						(<AND <MC-IS? ,GL-PRSO ,FL-PLURAL>
								<MC-ISNOT? ,GL-PRSO ,FL-COLLECTIVE>
							>
							<TELL "They appear ">
						)
						(<AND
							<MC-IS? ,GL-PRSO ,FL-PERSON>
							<MC-IS? ,GL-PRSO ,FL-FEMALE>
							>
								<TELL "She appears ">
						)
						(<AND
							<MC-IS?    ,GL-PRSO ,FL-PERSON>
							<MC-ISNOT? ,GL-PRSO ,FL-FEMALE>
							>
								<TELL "He appears ">
						)
						(T
							<TELL "It appears ">
						)
					>
					<TELL "much larger now." CR>
					<RTRUE>
				)
				(T
					<RFALSE>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<TELL CTHEO ,K-SHATTER-MSG CR>
		)
		(<MC-VERB? LOOK-INSIDE>
			<TELL "Everything appears much larger." CR>
			<RTRUE>
		)
		(<MC-VERB? ADJUST PLAY>
			<TELL "You cannot adjust a magnifying glass." CR>
			<RTRUE>
		)
;		(<MC-VERB? OPEN OPEN-WITH CLOSE REACH-IN>
			<TELL "You cannot do that with a magnifying glass." CR>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-TELESCOPE"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-TH-TELESCOPE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-TELESCOPE">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-NEWSPAPER"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-TH-NEWSPAPER ()
   <RT-DEBUG-OB-AC "TH-NEWSPAPER">
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-VIOLIN"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-VIOLIN ("AUX" WHO)
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-VIOLIN">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? PLAY>
			<COND
				(<NOT <IN? ,TH-VIOLIN ,GL-WINNER>>
					<RT-CYOU-MSG "are" "is">
					<TELL "not holding " THEO "." CR>
					<RTRUE>
				)
				(<AND <IN? ,TH-PHIAL ,CH-HOLMES>
						<MC-HERE? ,RM-HOLMES-STUDY>
					>
					<TELL "Even the grotesque noises">
					<RT-YOU-MSG "make" "makes">
					<TELL "with the violin aren't enough to
distract Holmes's attention from the phial." CR
					>
					<RTRUE>
				)
			>
			<SET WHO <RT-ANYONE-HERE?>>
			<COND
				(<MC-T? .WHO>
					<MC-MAKE .WHO ,FL-ASLEEP>
					<COND
						(<RT-ANYONE-HERE?>
							<TELL "Everyone">
						)
						(T
							<TELL CTHE .WHO>
						)
					>
					<MC-UNMAKE .WHO ,FL-ASLEEP>
					<TELL " grimaces in pain and glares at you." CR>
				)
				(T
					<TELL
"Even you cannot abide the grotesque screeches that emanate from the tortured
instrument, and you quickly stop." CR
					>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-WESTMINSTER-CLUE"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-TH-WESTMINSTER-CLUE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-WESTMINSTER-CLUE">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-PHIAL"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-PHIAL ("AUX" HITS)
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-PHIAL">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? SHOOT>
			<SET HITS <GETP ,TH-PHIAL ,P?AUX1>>
			<PUTP ,TH-PHIAL ,P?AUX1 <+ 1 .HITS>>
			<COND
				(<ZERO? .HITS>
					<TELL
"Nice shot! The phial explodes. You hear a muffled scream from downstairs
as Mrs. Hudson lets out a shriek." CR CR

,K-HOLMES-LICKS-MSG

"eyes begin to cloud over from the small dose you have
caused him to take." CR CR

,K-ANOTHER-PHIAL-MSG CR
					>
					<RTRUE>
				)
				(<EQUAL? 1 .HITS>
					<TELL
"The phial explodes. From downstairs you hear a dull thud as Mrs. Hudson
faints and hits the floor." CR CR

,K-HOLMES-LICKS-MSG

"body stiffens as the increased dosage of the drug enters
his system." CR CR

,K-ANOTHER-PHIAL-MSG CR CR

"As a doctor, you know that another dose may be fatal." CR 
 					>
 					<RTRUE>
 				)
 				(<EQUAL? 2 .HITS>
 					<TELL
"That persistent, are you? Too bad. The chill you caught from the damp air
outside causes you to sneeze just as you pull the trigger. You have shot and
killed Sherlock Holmes." CR CR

"Inspector Lestrade appears at the door and says,"

,K-PLUG-HIM-MYSELF-MSG CR CR

,K-LESTRADE-ARRESTS-MSG CR CR
 					>
 					<RT-QSR>
 				)
			>
		)
		(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
			<RT-HOLMES-HITS ,TH-PHIAL>
			<RTRUE>
		)
	>
	<RFALSE>
>


;-----------------------------------------------------------------------------
; "RT-HOLMES-HITS"
;-----------------------------------------------------------------------------

<ROUTINE RT-HOLMES-HITS (THING)
	<TELL
"Holmes is faster than you are. He moves " THE .THING " beyond your reach and
absentmindedly hits you on the head with his free hand." CR CR

"Holmes resumes staring at the phial." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-TOBACCO"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-TH-TOBACCO ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-TOBACCO">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-PIPE"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-TH-PIPE ()
   <RT-DEBUG-OB-AC "TH-PIPE">
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-MATCH"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-TH-MATCH ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-MATCH">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-GREEN-PAPER"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-GREEN-PAPER ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-GREEN-PAPER">
		)
		(T
		)
	>
   <RT-PROCESS-PAPER ,TH-GREEN-PAPER>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-WHITE-PAPER"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-WHITE-PAPER ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-WHITE-PAPER">
		)
		(T
		)
	>
   <RT-PROCESS-PAPER ,TH-WHITE-PAPER>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-BLUE-PAPER"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-BLUE-PAPER ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-BLUE-PAPER">
		)
		(T
		)
	>
   <RT-PROCESS-PAPER ,TH-BLUE-PAPER>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-ORANGE-PAPER"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-ORANGE-PAPER ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-ORANGE-PAPER">
		)
		(T
		)
	>
   <RT-PROCESS-PAPER ,TH-ORANGE-PAPER>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-YELLOW-PAPER"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-YELLOW-PAPER ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-YELLOW-PAPER">
		)
		(T
		)
	>
   <RT-PROCESS-PAPER ,TH-YELLOW-PAPER>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-BROWN-PAPER"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-BROWN-PAPER ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-BROWN-PAPER">
		)
		(T
		)
	>
   <RT-PROCESS-PAPER ,TH-BROWN-PAPER>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-ELIZABETH-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-ELIZABETH-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-ELIZABETH-TOMB">
		)
		(T
		)
	>
	<RT-PROCESS-TOMB 1>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-NEWTON-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-NEWTON-TOMB ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-NEWTON-TOMB">
		)
		(T
		)
	>
	<RT-PROCESS-TOMB 2>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-HENRY-V-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-HENRY-V-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-HENRY-V-TOMB">
		)
		(T
		)
	>
	<RT-PROCESS-TOMB 3>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-EDWARD-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-EDWARD-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-EDWARD-TOMB">
		)
		(T
		)
	>
	<RT-PROCESS-TOMB 4>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-POPE-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-POPE-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-POPE-TOMB">
		)
		(T
		)
	>
	<RT-PROCESS-TOMB 5>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-DICKENS-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-DICKENS-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-DICKENS-TOMB">
		)
		(T
		)
	>
	<RT-PROCESS-TOMB 6>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-CHAUCER-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-CHAUCER-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-CHAUCER-TOMB">
		)
		(T
		)
	>
	<RT-PROCESS-TOMB 7>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-ANNE-OF-CLEVES-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-ANNE-OF-CLEVES-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-ANNE-OF-CLEVES-TOMB">
		)
		(T
		)
	>
	<RT-PROCESS-TOMB 8>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-LITTLE-PRINCES-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-LITTLE-PRINCES-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-LITTLE-PRINCES-TOMB">
		)
		(T
		)
	>
	<RT-PROCESS-TOMB 9>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-MARY-QUEEN-OF-SCOTS-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-MARY-QUEEN-OF-SCOTS-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-MARY-QUEEN-OF-SCOTS-TOMB">
		)
		(T
		)
	>
	<RT-PROCESS-TOMB 10>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-HENRY-VII-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-HENRY-VII-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-HENRY-VII-TOMB">
		)
		(T
		)
	>
	<RT-PROCESS-TOMB 11>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-PITT-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-PITT-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-PITT-TOMB">
		)
		(T
		)
	>
	<RT-PROCESS-TOMB 12>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-VERE-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-VERE-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-VERE-TOMB">
		)
		(T
		)
	>
	<RT-PROCESS-TOMB 13>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-LAMP"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-LAMP ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-LAMP">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSI?>
			<COND
				(<MC-VERB? THROW>
					<COND
						(<G? <GETP ,GL-PRSO ,P?MASS> 5>
							<RT-BREAK-LAMP>
							<TELL CR CTHEO " ">
							<RT-LANDS-AT-YOUR-FEET-MSG>
							<RTRUE>
						)
					>
				)
				(<MC-VERB? PUT>
					<RT-LAMP-SEALED>
				)
			>
		)
		(T
			<COND
				(<MC-VERB? SHOOT KICK>
					<RT-BREAK-LAMP>
				)
				(<MC-VERB? OPEN CLOSE OPEN-WITH UNSCREW LOOK-INSIDE SEARCH
								 REACH-IN EMPTY EMPTY-INTO>
					<RT-LAMP-SEALED>
				)
				(<MC-VERB? LAMP-ON LIGHT-WITH TURN-UP>
					<COND
						(<MC-IS? ,TH-LAMP ,FL-BROKEN>
							<MC-UNMAKE ,TH-LAMP ,FL-ASLEEP>
							<TELL "Nothing happens." CR>
						)
						(<MC-ISNOT? ,TH-LAMP ,FL-ASLEEP>
							<TELL CTHE ,TH-LAMP " is already on." CR>
						)
						(T
							<MC-UNMAKE ,TH-LAMP ,FL-ASLEEP>
							<MC-MAKE ,TH-LAMP ,FL-LIGHTED>
							<TELL "You turn up the wick. " CTHE ,TH-LAMP " emits a
warm glow that lights up the area around you." CR>
						)
					>
				)
				(<MC-VERB? LAMP-OFF TURN-DOWN>
					<COND
						(<MC-IS? ,TH-LAMP ,FL-ASLEEP>
							<TELL CTHE ,TH-LAMP " is already off." CR>
						)
						(<MC-IS? ,TH-LAMP ,FL-BROKEN>
							<MC-MAKE ,TH-LAMP ,FL-ASLEEP>
							<TELL "Nothing happens." CR>
						)
						(T
							<MC-MAKE ,TH-LAMP ,FL-ASLEEP>
							<MC-UNMAKE ,TH-LAMP ,FL-LIGHTED>
							<TELL "You turn down the wick. " CTHE ,TH-LAMP " goes
dark." CR>
						)
					>
				)
				(<MC-VERB? POINT-AT SHINE-AT>
					<COND
						(<MC-IS? ,TH-LAMP ,FL-LIGHTED>
							<COND
								(<EQUAL? ,GL-PRSO ,GL-PRSI>
									<RT-CYOU-MSG>
									<TELL "can't point the light at itself." CR>
								)
								(T
									<TELL "You point " THE ,TH-LAMP " at " THEI ", but
it reveals nothing." CR>
								)
							>
						)
						(T
							<TELL CTHE ,TH-LAMP " is not on." CR>
						)
					>
				) 
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-LAMP-SEALED"
;-----------------------------------------------------------------------------

<ROUTINE RT-LAMP-SEALED ()
	<TELL
CTHE ,TH-LAMP " is firmly sealed. It can neither be opened nor closed." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-BREAK-LAMP"
;-----------------------------------------------------------------------------

<ROUTINE RT-BREAK-LAMP ()
	<COND
		(<MC-ISNOT? ,TH-LAMP ,FL-BROKEN>
			<MC-MAKE ,TH-LAMP ,FL-BROKEN>
			<TELL "It sounds as if something in " THE ,TH-LAMP " has shattered.">
			<COND
				(<MC-IS? ,TH-LAMP ,FL-LIGHTED>
					<MC-UNMAKE ,TH-LAMP ,FL-LIGHTED>
					<TELL "  " CTHE ,TH-LAMP " has gone out.">
				)
			>
			<CRLF>
		)
		(T
			<TELL CTHE ,TH-LAMP " is already broken." CR> 
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-BLACK-BAG"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-BLACK-BAG ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-BLACK-BAG">
		)
		(T
		)
	>
	<COND
		(<AND	<MC-VERB? PUT>
				<MC-THIS-PRSI?>
				<MC-PRSO?
					TH-PADDLE
					TH-MACE
					TH-ANCHOR
					TH-PACQUET-OF-PAPER
					TH-SUIT-OF-ARMOUR
					TH-OAR-1
					TH-OAR-2
					TH-TORCH
					TH-WAX-AX
					TH-LAMP
					TH-WAX-HEAD
				>
						
			>
			<TELL "You look at " THEO ". You look at the tiny bag. You look at
the tiny bag. You look at " THEO ". Slowly it dawns on you that it's just
not going to work." CR
			>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-WAX-HEAD"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-TH-WAX-HEAD ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-WAX-HEAD">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-TORCH"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-TH-TORCH ()
   <RT-DEBUG-OB-AC "TH-TORCH">
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-BOAT"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-BOAT ("OPTIONAL" (CONTEXT <>) "AUX" NUM)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-BOAT" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<AND <MC-VERB? PUSH-TO> <MC-PRSI? ,LG-WATER>>
			<RT-LAUNCH-BOAT>
			<RTRUE>
		)
		(<AND <MC-VERB? ENTER> <MC-PRSO? ,ROOMS ,TH-BOAT>>
			<COND
				(<NOT <IN? ,CH-PLAYER ,TH-BOAT>>
					<COND
						(<AND <MC-T? ,GL-PUPPY>
								<EQUAL? ,GL-WINNER ,CH-PLAYER>
							>
							<MOVE ,GL-PUPPY ,TH-BOAT>
							<TELL "You and " THE ,GL-PUPPY " get ">
						)
						(T
							<RT-CYOU-MSG "get" "gets">
						)
					>
					<TELL "into the boat." CR>
					<MOVE ,CH-PLAYER ,TH-BOAT>
					<COND
						(<MC-T? ,GL-PUPPY>
							<MOVE ,GL-PUPPY ,TH-BOAT>
						)
					>
					<MC-MAKE ,TH-BOAT ,FL-NODESC>
					<RTRUE>
				)
			>
		)
		(<AND <MC-VERB? EXIT> <MC-PRSO? ,ROOMS ,TH-BOAT>>
			<COND
				(<IN? ,CH-PLAYER ,TH-BOAT>
					<MOVE ,CH-PLAYER ,GL-PLACE-CUR>
					<COND
						(<MC-T? ,GL-PUPPY>
							<MOVE ,GL-PUPPY ,GL-PLACE-CUR>
						)
					>
					<MC-UNMAKE ,TH-BOAT ,FL-NODESC>
					<SET NUM <GETP ,TH-BOAT ,P?AUX1>>
					<COND
						(<AND <NOT <ZERO? <LOC ,TH-OPAL>>>
								<IN? ,TH-BOAT ,RM-THE-EMBANKMENT>
								<EQUAL? .NUM 0>
							>
							<TELL "As">
							<COND
								(<AND <MC-T? ,GL-PUPPY>
										<EQUAL? ,GL-WINNER ,CH-PLAYER>
									>
									<MOVE ,GL-PUPPY ,GL-PLACE-CUR>
									<TELL " you and " THE ,GL-PUPPY " get ">
								)
								(T
									<RT-YOU-MSG "get" "gets">
								)
							>
							<TELL
"out of the boat, a man storms up to you and says, \"What in
bloody 'ell are you doing with my boat?\" Without waiting for a
reply he "
							>
							<COND
								(<OR	<IN? ,TH-OAR-2 ,TH-BOAT>
										<IN? ,TH-OAR-2 ,RM-THE-EMBANKMENT>
										<RT-META-IN? ,TH-OAR-2 ,CH-PLAYER>
										<RT-META-IN? ,TH-OAR-2 ,GL-PUPPY>
									>
									<TELL "grabs the oar, ">
								)
							>
							<MOVE ,TH-BOAT ,RM-OUTSIDE-TRAITORS-GATE>
							<MOVE ,TH-ANCHOR ,LG-WATER>
							<REMOVE ,TH-OAR-1>
							<REMOVE ,TH-OAR-2>
							<PUTP ,TH-BOAT ,P?AUX1 1>
							<TELL
"jumps into the boat and rows off, muttering to himself that he'll
have to find a safer place to keep it." CR
							>
						)
						(<AND <MC-IS? ,TH-GARNET ,FL-TOUCHED>
								<IN? ,TH-BOAT ,RM-THE-EMBANKMENT>
								<EQUAL? .NUM 1>
							>
							<TELL "As">
							<COND
								(<AND <MC-T? ,GL-PUPPY>
										<EQUAL? ,GL-WINNER ,CH-PLAYER>
									>
									<MOVE ,GL-PUPPY ,GL-PLACE-CUR>
									<TELL " you and " THE ,GL-PUPPY " get ">
								)
								(T
									<RT-YOU-MSG "get" "gets">
								)
							>
							<TELL
"out of the boat, its red-faced owner runs up and
yells, \"You again?!!\" He gives you a swift kick in the rear"
							>
							<COND
								(<MC-IS? ,TH-SUIT-OF-ARMOUR ,FL-WORN>
									<TELL ", then clutches his foot in agony as it
bounces off your suit of armour"
									>
								)
							>
							<TELL "." CR CR
"The man jumps into the boat"
							>
							<COND
								(<IN? ,TH-PADDLE ,TH-BOAT>
									<TELL
" and paddles away, cursing under his breath." CR
									>							
								)
								(T
									<TELL
", launches it, and suddenly realizes he has no way to steer it. The last
you see of him, he is drifting down the Thames, screaming and shaking his
fist at you." CR
									>
								)
							>
							<REMOVE ,TH-BOAT>
							<PUTP ,TH-BOAT ,P?AUX1 2>
						)
						(<IN? ,TH-ANCHOR ,TH-BOAT>
							<TELL "As">
							<COND
								(<AND <MC-T? ,GL-PUPPY>
										<EQUAL? ,GL-WINNER ,CH-PLAYER>
									>
									<MOVE ,GL-PUPPY ,GL-PLACE-CUR>
									<TELL " you and " THE ,GL-PUPPY " get ">
								)
								(T
									<RT-YOU-MSG "get" "gets">
								)
							>
							<TELL
"out of the boat it slides out from under your foot and drifts down the
river." CR
							>
							<REMOVE ,TH-BOAT>
						)
						(T
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
							<TELL	"out of the boat." CR>
						)
					>
					<RTRUE>
				)
			>
		)
		(<AND <MC-VERB? SHOOT>
				<MC-PRSO? TH-BOAT>
			>
			<REMOVE ,TH-BOAT>
			<TELL
"Bad idea. The bullet blows a hole in the boat, which promptly sinks." CR
			>
			<COND
				(<IN? ,CH-PLAYER ,TH-BOAT>
					<TELL
CR "Unable to swim, you cling to a piece of driftwood for several
hours, wondering what kind of idiot would shoot a boat out from
under himself." CR CR

"After a while, a Scotland Yard launch pulls alongside to rescue
you. Lestrade leans over the side and offers his assistance. You
decide you're better off in the water and politely decline."  CR CR
					>
					<RT-QSR>
				)
			>
			<RTRUE>
		)  
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-OAR-1"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-OAR-1 ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-OAR-1">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? TAKE>
			<RT-CYOU-MSG "try" "tries">
			<TELL
"to extract the oar from the oarlock, but it seems to be jammed." CR
			>
			<RTRUE>
		)
		(<MC-VERB? RELEASE>
			<TELL
			<RT-CYOU-MSG "struggle" "struggles">
"with the oar for a minute or two with no success... it really
is jammed in there." CR
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-OAR-LOCK"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-OAR-LOCK ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-OAR-LOCK">
		)
		(T
		)
	>
	<COND
		(<AND <MC-VERB? PUT PUT-ON>
				<MC-THIS-PRSI?>
				<NOT <MC-PRSO? ,TH-OAR-2>>
			>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-CLAPPER"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-CLAPPER ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-CLAPPER">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? SHOOT>
			<TELL ,K-RICOCHET-MSG CR>
		)
		(<RT-IMPOSSIBLE-PUT-IN-ON-MSG ,TH-CLAPPER>
			<RTRUE>
		)
		(<MC-VERB? TOUCH TOUCH-TO TOUCH-TO-SWP>
			<COND
				(<EQUAL? <GETP ,TH-BELL ,P?AUX2> ,K-BELL-TOWARDS>
					<RFALSE>
				)
				(T
					<TELL CTHEO " is not within reach." CR>
				)
			>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-COTTON-BALLS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-COTTON-BALLS ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-COTTON-BALLS">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<SETG GL-P-IT-OBJECT ,TH-COTTON-BALLS>
			<COND
				(<MC-VERB? SHOOT>
					<RT-WASTE-OF-BULLETS-MSG>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-BELL"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-BELL ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-BELL">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? SHOOT>
			<TELL ,K-RICOCHET-MSG CR>
		)
		(<RT-IMPOSSIBLE-PUT-IN-ON-MSG ,TH-BELL>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-STETHOSCOPE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-STETHOSCOPE ("AUX" VAL)
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-STETHOSCOPE">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<COND
				(<OR	<MC-VERB? WEAR>
						<AND
							<MC-VERB? PUT>
							<MC-PRSI? ,TH-EARS>
						>
					>
					<COND
						(<MC-IS? ,TH-STETHOSCOPE ,FL-WORN>
							<TELL CTHEO>
							<RT-IS-ARE-MSG>
							<TELL "already in " THE ,TH-EARS "." CR>
						)
						(T
							<SETG GL-LISTEN-OBJ <>>
							<MC-MAKE ,TH-STETHOSCOPE ,FL-WORN>
							<MOVE ,TH-STETHOSCOPE ,CH-PLAYER>
							<RT-CYOU-MSG "put" "puts">
							<TELL THEO " in " THE ,TH-EARS "." CR>
							<SET VAL <GETP ,TH-STETHOSCOPE ,P?VALUE>>
							<COND
								(<MC-T? .VAL>
									<RT-UPDATE-SCORE .VAL>
									<PUTP ,TH-STETHOSCOPE ,P?VALUE 0>
								)
							>
							<RTRUE>
						)
					>
				)
				(<OR	<AND
							<MC-VERB? TAKE>
							<MC-PRSI? ,TH-EARS>
						>
						<AND
							<MC-VERB? TAKE-OFF>
							<MC-IS? ,TH-STETHOSCOPE ,FL-WORN>
						>
					>
					<COND
						(<MC-ISNOT? ,TH-STETHOSCOPE ,FL-WORN>
							<TELL CTHEO>
							<RT-ISNT-ARENT-MSG>
							<TELL "in " THE ,TH-EARS "." CR>
						)
						(T
							<SETG GL-LISTEN-OBJ <>>
							<MC-UNMAKE ,TH-STETHOSCOPE ,FL-WORN>
							<RT-CYOU-MSG "take" "takes">
							<TELL THEO>
							<TELL " out of " THE ,TH-EARS "." CR>
						)
					>
				)
				(<MC-VERB? DROP THROW THROW-OVER>
					<COND
						(<MC-IS? ,TH-STETHOSCOPE ,FL-WORN>
							<RT-CYOU-MSG>
							<TELL "cannot " VW " " THEO " while">
							<RT-YOU-MSG "are" "is">
							<TELL "wearing it." CR>
						)
					>
				)
				(<MC-VERB? PUT-ON>
					<COND
						(<AND <MC-IS? ,GL-PRSI ,FL-PERSON>
								<MC-IS? ,TH-STETHOSCOPE ,FL-WORN>
							>
							<RT-PERFORM ,V?LISTEN ,GL-PRSI ,GL-PRSO>
						)
					>
				)
			>
		)
		(<MC-THIS-PRSI?>
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-DIAL"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-TH-DIAL ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-DIAL">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-SAFETY-DEPOSIT-BOX"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-TH-SAFETY-DEPOSIT-BOX ()
   <RT-DEBUG-OB-AC "TH-SAFETY-DEPOSIT-BOX">
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-MALMSEY"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-TH-MALMSEY ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-MALMSEY">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-BUTT-OF-MALMSEY"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-TH-BUTT-OF-MALMSEY ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-BUTT-OF-MALMSEY">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-SUIT-OF-ARMOUR"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-TH-SUIT-OF-ARMOUR ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-SUIT-OF-ARMOUR">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-TEETER-TOTTER"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-TH-TEETER-TOTTER ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-TEETER-TOTTER">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-PORTCULLIS-CHAIN"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-TH-PORTCULLIS-CHAIN ()
   <RT-DEBUG-OB-AC "TH-PORTCULLIS-CHAIN">
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-WATSONS-HAT"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-WATSONS-HAT ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-WATSONS-HAT">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<COND
				(<OR	<AND
							<MC-VERB? PUT-ON>
							<MC-PRSI? ,TH-HEAD>
						>
						<MC-VERB? WEAR>
					>
					<COND
						(<MC-IS? ,TH-WATSONS-HAT ,FL-WORN>
							<TELL "You are already wearing " THEO "." CR>
						)
						(T
							<MC-UNMAKE ,TH-WATSONS-HAT ,FL-OPENED>
							<MC-MAKE ,TH-WATSONS-HAT ,FL-WORN>
							<TELL "You put on " THEO "." CR>
						)
					>
				)
				(<OR	<AND
							<MC-VERB? TAKE>
							<OR
								<MC-PRSI? ,TH-HEAD>
								<AND
									<MC-IS? ,TH-WATSONS-HAT ,FL-WORN>
									<MC-PRSI? <> CH-PLAYER CH-ME>
								>
							>
						>
						<MC-VERB? TAKE-OFF>
					>
					<COND
						(<MC-IS? ,TH-WATSONS-HAT ,FL-WORN>
							<MC-MAKE ,TH-WATSONS-HAT ,FL-OPENED>
							<MC-UNMAKE ,TH-WATSONS-HAT ,FL-WORN>
							<TELL "You take off " THEO>
							<COND
								(<FIRST? ,TH-WATSONS-HAT>
									<TELL ". Inside you see ">
									<RT-PRINT-CONTENTS-2 ,TH-WATSONS-HAT>
								)
							>
							<TELL "." CR>
						)
						(T
							<TELL "You are not wearing " THEO "." CR>
						)
					>
				)
				(<AND <MC-VERB? LOOK-INSIDE>
						<MC-IS? ,TH-WATSONS-HAT ,FL-WORN>
					>
					<TELL
"You can't see inside " THE ,TH-WATSONS-HAT " while it's on " THE ,TH-HEAD
"." CR
					>
				)
				(<AND <MC-VERB? REACH-IN SEARCH PUT PUT-ON>
						<MC-IS? ,TH-WATSONS-HAT ,FL-WORN>
					>
					<RT-CYOU-MSG>
					<RT-WOULD-HAVE-TO-MSG "take off" ,GL-PRSO>
					<TELL "first." CR>
					<RTRUE>
				)
			>
		)
		(<MC-THIS-PRSI?>
			<COND
				(<AND <MC-VERB? PUT>
						<MC-IS? ,TH-WATSONS-HAT ,FL-WORN>
					>
					<RT-CYOU-MSG>
					<RT-WOULD-HAVE-TO-MSG "take off" ,GL-PRSI>
					<TELL "first." CR>
					<RTRUE>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-HANSOM-CAB"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-TH-HANSOM-CAB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-HANSOM-CAB">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<TELL
"You can't get in the cab because we haven't implemented that yet." CR>
		)
		(<MC-VERB? LOOK-ON>
			<TELL "There is a cab driver sitting on the hansom." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-GROWLER-CAB"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-TH-GROWLER-CAB ()
   <RT-DEBUG-OB-AC "TH-GROWLER-CAB">
	<COND
		(<MC-VERB? ENTER>
			<TELL
"You can't get in the cab because we haven't implemented that yet." CR>
		)
		(<MC-VERB? LOOK-ON>
			<TELL "There is a cab driver sitting on the growler." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-CAB-WHISTLE"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-TH-CAB-WHISTLE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-CAB-WHISTLE">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-ELIZAS-FLOWERS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-ELIZAS-FLOWERS ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-ELIZAS-FLOWERS">
		)
		(T
		)
	>
   <COND
      (<MC-THIS-PRSI?>
         <COND
            (<MC-VERB? PUT PUT-ON>
					<RT-CANT-PUT-IN-ON-MSG ,TH-ELIZAS-FLOWERS>
            )
         >
      )
   >
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-CARNATION"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-CARNATION ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-CARNATION">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? WEAR>
					<COND
						(<EQUAL? ,GL-WINNER ,CH-PLAYER>
							<MOVE ,TH-CARNATION ,TH-LAPEL>
							<RT-CYOU-MSG "put" "puts">
							<TELL THEO " in " THE ,TH-LAPEL "." CR>
						)
						(T
							<TELL CTHE ,GL-WINNER " says, \"No thanks.\"" CR>
						)
					>
				)
				(<MC-VERB? SHOOT>
					<RT-WASTE-OF-BULLETS-MSG>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-EMERALD"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-EMERALD ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-EMERALD">
		)
		(T
		)
	>
	<RT-EXAMINE-GEM ,TH-EMERALD>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-SAPPHIRE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-SAPPHIRE ("OPTIONAL" (CONTEXT <>) "AUX" GRABS WHO)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-SAPPHIRE">
		)
		(T
		)
	>
	<SET GRABS <GETP ,TH-SAPPHIRE ,P?AUX1>>
	<COND
		(<AND <MC-THIS-PRSO?>
				<IN? ,TH-SAPPHIRE ,TH-CLAPPER>
			>
			<COND
				(<MC-VERB? TAKE>
					<COND
						(<G? .GRABS 0>
							<COND
								(<EQUAL? <GETP ,TH-BELL ,P?AUX2> ,K-BELL-TOWARDS>
									<DEC GRABS>
									<PUTP ,TH-SAPPHIRE ,P?AUX1 .GRABS>
									<COND
										(<ZERO? .GRABS>
											<RT-CYOU-MSG "remove" "removes">
											<TELL THEO " from " THE ,TH-CLAPPER "." CR>
											<MOVE ,TH-SAPPHIRE ,CH-PLAYER>
											<MC-UNMAKE ,TH-SAPPHIRE ,FL-NODESC>
											<MC-MAKE ,TH-SAPPHIRE ,FL-SEEN>
											<MC-MAKE ,TH-SAPPHIRE ,FL-TOUCHED>
											<SET WHO <RT-WHO-SAYS?>>
											<COND
												(<EQUAL? .WHO ,CH-HOLMES>
													<TELL CR
"Holmes beams at you and says, \"Good show, old fellow.\"" CR
													>
												)
											>
											<RT-UPDATE-SCORE <GETP ,TH-SAPPHIRE ,P?VALUE>>
											<PUTP ,TH-SAPPHIRE ,P?VALUE 0>
										)
										(T
											<RT-CYOU-MSG "tug" "tugs">
											<TELL "at " THEO ", but you can't quite grab
it before it swings out of reach again." CR>
										)
									>
								)
								(T
									<TELL CTHEO " is not within reach." CR>
								)
							>
							<RTRUE>
						)
					>
				)
				(<MC-VERB? HIT>
					<COND
						(<OR	<EQUAL? <GETP ,TH-BELL ,P?AUX2> ,K-BELL-TOWARDS>
								<MC-PRSI? ,TH-OAR-2>
							>
							<RT-CYOU-MSG "knock" "knocks">
							<TELL THEO " into the shaft. A long time later you hear "
THEO " shatter." CR>
							<REMOVE ,GL-PRSO>
						)
						(T
							<TELL CTHEO " is not within reach." CR>
						)
					>
					<RTRUE>
				)
				(<MC-VERB? TOUCH TOUCH-TO TOUCH-TO-SWP>
					<COND
						(<EQUAL? <GETP ,TH-BELL ,P?AUX2> ,K-BELL-TOWARDS>
							<RFALSE>
						)
						(T
							<TELL CTHEO " is not within reach." CR>
						)
					>
					<RTRUE>
				)
			>
		)
		(<AND <MC-THIS-PRSI?>
				<IN? ,TH-SAPPHIRE ,TH-CLAPPER>
			>
			<COND
				(<MC-VERB? THROW>
					<RT-CYOU-MSG "hit" "hits">
					<TELL	THEI " with " THEO ", and they both disappear into the
shaft. A long time later you hear " THEI " shatter." CR>
					<REMOVE ,GL-PRSO>
					<REMOVE ,GL-PRSI>
					<RTRUE>
				)
			>
		)
	>
	<RT-EXAMINE-GEM ,TH-SAPPHIRE>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-OPAL"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-OPAL ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-OPAL">
		)
		(T
		)
	>
	<RT-EXAMINE-GEM ,TH-OPAL>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-RUBY"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-RUBY ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-RUBY">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? TAKE>
			<COND
				(<IN? ,TH-RUBY ,TH-NELSON-STATUE>
					<TELL "You can't reach the ruby." CR>
					<RTRUE>
				)
				(<IN? ,TH-RUBY ,CH-SHERMAN>
					<RT-IMPOLITE-MSG "take things" "asking">
					<RTRUE>
				)
			>
		)
	>
	<RT-EXAMINE-GEM ,TH-RUBY>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-TOPAZ"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-TOPAZ ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-TOPAZ">
		)
		(T
		)
	>
	<RT-EXAMINE-GEM ,TH-TOPAZ>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-GARNET"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-TH-GARNET ()
   <RT-DEBUG-OB-AC "TH-GARNET">
	<RT-EXAMINE-GEM ,TH-GARNET>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-RUBY-SCRATCH"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-RUBY-SCRATCH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-RUBY-SCRATCH">
		)
		(T
		)
	>
	<RT-EXAMINE-SCRATCH ,TH-RUBY>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-EMERALD-SCRATCH"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-EMERALD-SCRATCH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-EMERALD-SCRATCH">
		)
		(T
		)
	>
	<RT-EXAMINE-SCRATCH ,TH-EMERALD>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-SAPPHIRE-SCRATCH"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-SAPPHIRE-SCRATCH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-SAPPHIRE-SCRATCH">
		)
		(T
		)
	>
	<RT-EXAMINE-SCRATCH ,TH-SAPPHIRE>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-TOPAZ-SCRATCH"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-TOPAZ-SCRATCH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-TOPAZ-SCRATCH">
		)
		(T
		)
	>
	<RT-EXAMINE-SCRATCH ,TH-TOPAZ>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-OPAL-SCRATCH"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-OPAL-SCRATCH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-OPAL-SCRATCH">
		)
		(T
		)
	>
	<RT-EXAMINE-SCRATCH ,TH-OPAL>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-GARNET-SCRATCH"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-GARNET-SCRATCH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-GARNET-SCRATCH">
		)
		(T
		)
	>
	<RT-EXAMINE-SCRATCH ,TH-GARNET>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-WATSONS-COAT"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-WATSONS-COAT ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-WATSONS-COAT">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? LOOK-INSIDE SEARCH>
					<RT-PERFORM ,V?LOOK-INSIDE ,TH-POCKET>
				)
				(<AND <MC-VERB? WEAR TAKE-OFF>
						<MC-IS? ,TH-SUIT-OF-ARMOUR ,FL-WORN>
					>
					<RT-CYOU-MSG>
					<RT-WOULD-HAVE-TO-MSG "take off" ,TH-SUIT-OF-ARMOUR>
					<TELL "first." CR>
				)
			>
		)
		(<MC-THIS-PRSI?>
			<COND
				(<MC-VERB? TAKE>
					<TELL "[from " THE ,TH-POCKET "]" CR>
					<RT-PERFORM ,V?TAKE ,GL-PRSO ,TH-POCKET>
				)
				(<MC-VERB? PUT>
					<TELL "[in " THE ,TH-POCKET "]" CR>
					<RT-PERFORM ,V?PUT ,GL-PRSO ,TH-POCKET>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-LAPEL"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-LAPEL ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-LAPEL">
		)
		(T
		)
	>
   <COND
      (<MC-THIS-PRSI?>
         <COND
            (<AND <MC-VERB? PUT PUT-ON>
                  <NOT <MC-PRSO? ,TH-CARNATION>>
               >
					<RT-CANT-PUT-IN-ON-MSG ,TH-LAPEL>
            )
         >
      )
   >
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-CLUMP-OF-MOSS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-CLUMP-OF-MOSS ("AUX" WHO)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-CLUMP-OF-MOSS">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? LOOK>
			<RT-DF-TH-CLUMP-OF-MOSS>
			<RTRUE>
		)
		(<ZERO? <RT-THAMES-TIDE>>
			<COND
				(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
					<TELL "As soon as">
					<RT-YOU-MSG "touch" "touches">
					<TELL THE ,TH-CLUMP-OF-MOSS ", it crumbles. ">
					<RT-CYOU-MSG "are" "is">
					<TELL "left holding a beautiful opal." CR>
					<MOVE ,TH-OPAL ,GL-WINNER>
					<MC-MAKE ,TH-OPAL ,FL-SEEN>
					<MC-MAKE ,TH-OPAL ,FL-TOUCHED>
					<MC-UNMAKE ,TH-OPAL ,FL-NODESC>
					<SET WHO <RT-WHO-SAYS?>>
					<COND
						(<EQUAL? .WHO ,CH-HOLMES>
							<TELL CR
"Holmes claps you on the shoulder and says, \"Capital, Watson. Capital!\"" CR
							>
						)
					>
					<RT-UPDATE-SCORE <GETP ,TH-OPAL ,P?VALUE>>
					<PUTP ,TH-OPAL ,P?VALUE 0>
					<REMOVE ,TH-CLUMP-OF-MOSS>
					<RTRUE>
				)
				(T
					<RFALSE>
				)
			>
		)
		(<MC-VERB? TAKE>
			<COND
				(<EQUAL? <RT-THAMES-TIDE> 2>
					<TELL "The clump is well beyond ">
					<RT-YOUR-MSG>
					<TELL "grasp." CR>
				)
				(T
					<RT-CYOU-MSG>
					<TELL "cannot quite reach it." CR>
				)
			>
			<RTRUE>
		)
		(<MC-VERB? HIT TOUCH TOUCH-TO CUT>
			<COND
				(<OR	<AND
							<MC-VERB? HIT TOUCH>
							<MC-PRSI? ,TH-OAR-2>
						>
						<AND
							<MC-VERB? TOUCH-TO>
							<MC-PRSO? ,TH-OAR-2>
						>
					>
					<RT-CYOU-MSG "knock" "knocks">
					<TELL
THE ,TH-CLUMP-OF-MOSS " into the water. It dissolves upon impact and reveals
a beautiful opal, which slowly sinks into the murky depths." CR
					>
					<REMOVE ,TH-CLUMP-OF-MOSS>
				)
				(T
					<RT-CYOU-MSG "try" "tries">
					<TELL "to hit the moss">
					<COND
						(<MC-VERB? TOUCH-TO>
							<TELL " with " THEO>
						)
						(<MC-T? ,GL-PRSI>
							<TELL " with " THEI>
						)
					>
					<TELL " but">
					<RT-YOU-MSG "are" "is">
					<TELL "not able to reach it." CR>
				)
			>
			<RTRUE>
		)
		(<MC-VERB? THROW>
			<COND
				(<RT-IDROP-MSG>
					<TELL
"Good throw! " CTHEO " hits the clump, knocks it loose, and everything
falls into the water. " CTHEO " sinks immediately. The moss, however,
dissolves upon impact and reveals a beautiful opal, which slowly
follows " THEO " into the murky depths." CR
					>
					<REMOVE ,TH-CLUMP-OF-MOSS>
					<REMOVE ,GL-PRSO>
				)
			>
			<RTRUE>
		)
		(<MC-VERB? SHOOT>
			<TELL
"The bullet dislodges the clump and knocks it into the water. The moss
dissolves upon impact and reveals a beautiful opal, which slowly sinks
into the murky depths." CR
			>
			<REMOVE ,TH-CLUMP-OF-MOSS>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-ANCHOR"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-ANCHOR ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-ANCHOR">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? SHOOT>
			<TELL ,K-RICOCHET-MSG CR>
		)
		(<NOT <IN? ,CH-PLAYER ,TH-BOAT>>
			<TELL ,K-MUST-BE-IN-BOAT-MSG "do that." CR>
		)
		(<MC-VERB? TAKE>
			<COND
				(<IN? ,TH-ANCHOR ,TH-BOAT>
					<TELL "Oomph! It's too heavy to carry." CR>
				)
				(T
					<MOVE ,TH-ANCHOR ,TH-BOAT>
					<TELL ,K-RAISE-ANCHOR-MSG CR>
				)
			>
		)
		(<MC-VERB? RAISE HAUL WEIGH PULL>
			<COND
				(<IN? ,TH-ANCHOR ,LG-WATER>
					<MOVE ,TH-ANCHOR ,TH-BOAT>
					<TELL ,K-RAISE-ANCHOR-MSG CR>
				)
				(T
					<TELL ,K-ANCHOR-ALREADY-OUT-MSG CR>
				)
			>
		)
		(<MC-VERB? LOWER DROP>
			<COND
				(<IN? ,TH-ANCHOR ,LG-WATER>
					<TELL "The anchor is already in the water." CR>
				)
				(T
					<MOVE ,TH-ANCHOR ,LG-WATER>
					<RT-ALARM-CLR ,RT-I-MOVE-DOWNSTREAM>
					<TELL ,K-LOWER-ANCHOR-MSG CR>
				)
			>
		)
		(<MC-VERB? THROW PUT>
			<COND
				(<MC-PRSI? ,LG-WATER>
					<MOVE ,TH-ANCHOR ,LG-WATER>
					<RT-ALARM-CLR ,RT-I-MOVE-DOWNSTREAM>
					<TELL ,K-LOWER-ANCHOR-MSG CR>
				)
				(<MC-PRSI? ,TH-BOAT>
					<MOVE ,TH-ANCHOR ,TH-BOAT>
					<TELL ,K-RAISE-ANCHOR-MSG CR>
				)
				(T
					<RT-IMPOSSIBLE-MSG>
				)
			>
		)
	>	
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-NELSON-STATUE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-NELSON-STATUE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-NELSON-STATUE">
		)
		(T
		)
	>
	<COND
		(<RT-IMPOSSIBLE-PUT-IN-ON-MSG ,TH-NELSON-STATUE>
			<RTRUE>
		)
		(<MC-VERB? LOOK-INSIDE>
			<RT-CYOU-MSG>
			<TELL "can't see inside the statue." CR>
		)
		(<MC-VERB? REACH-IN SEARCH>
			<RT-CYOU-MSG>
			<TELL "can't reach the statue." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-BUNG"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-TH-BUNG ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-BUNG">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-MACE"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-TH-MACE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-MACE">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-CROWN-JEWELS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-CROWN-JEWELS ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-CROWN-JEWELS">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<SETG GL-P-IT-OBJECT ,TH-CROWN-JEWELS>
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-ETHERIUM-AMPOULE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-ETHERIUM-AMPOULE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-ETHERIUM-AMPOULE">
		)
		(T
		)
	>
	<COND
		(<AND <MC-VERB? MUNG OPEN>
				<MC-THIS-PRSO?>
			>
			<COND
				(<NOT <IN? ,TH-ETHERIUM-AMPOULE ,GL-WINNER>>
					<RT-CYOU-MSG>
					<RT-WOULD-HAVE-TO-MSG "be holding" ,GL-PRSO>
					<TELL "to do that." CR>
					<MC-RFATAL>
				)
			>
			<MOVE ,TH-BROKEN-AMPOULE <LOC ,TH-ETHERIUM-AMPOULE>>
			<REMOVE ,TH-ETHERIUM-AMPOULE>
			<TELL "You break open the ampoule.">
			<COND
				(<MC-HERE? ,RM-BAR-OF-GOLD>
					<TELL
" The etherium fumes mix with the heavy air of the opium den. No one seems to
notice." CR
					>
				)
				(<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
					<COND
						(<RT-FIND-FLAME ,GL-PLACE-CUR>
							<TELL
" As soon as the volatile etherium comes in contact with the flame"
							>
							<COND
								(<EQUAL? ,GL-PLACE-CUR ,RM-ENTRY-HALL>
									<TELL " of the gas light">
								)
							>
							<TELL ", it explodes."

CR CR "B  O  O  M  !!!" CR CR

"You awaken several days later in the hospital. Inspector Lestrade is
there with flowers for your bedside table. He is full of news about
how he plans to solve the case. Upon hearing this, you lapse back into
a coma from which you have no particular desire to emerge." CR
							>
							<RT-QSR>
						)
						(T
							<TELL " The etherium is released into the room.">
							<COND
								(<MC-ISNOT? ,TH-BREATH ,FL-LOCKED>
									<MC-MAKE ,CH-PLAYER ,FL-ASLEEP>
									<TELL
" Suddenly, everything starts to spin. You pass out and fall to the
ground. Sometime later you awaken and stumble back to your feet." CR
									>
									<RT-CLOCK-JMP 6 0 0>
									<COND
										(<MC-HERE? ,RM-LAIR>
											<RT-DOES-MORIARTY-WIN>
										)
									>
								)
								(T
									<COND
										(<RT-ETHERIUM-EFFECT T>
											<TELL " You see everyone">
											<COND
												(<RT-VISIBLE? ,CH-HOLMES>
													<TELL " but Holmes">
												)
											>
											<TELL " pass out.">
;											<RT-LIST-PEOPLE ,GL-PEOPLE>
										)
									>
									<CRLF>
								)
							>
							<MOVE ,TH-ETHERIUM-GAS ,GL-PLACE-CUR>
							<RT-ALARM-SET-REL ,RT-I-WAKE-UP <RT-PARM-SET 6 0 0>>
						)
					>
				)
				(T
					<TELL
" The etherium fumes dissipate quickly." CR
					>
				)
			>
			<RTRUE>
		)
		(<AND <MC-VERB? SHOOT>
				<MC-THIS-PRSO?>
			>
			<TELL "Couldn't resist it, could you?"

CR CR "B  O  O  M  !!!" CR CR

"Your nerves - already fragile from the Afghan campaign - snap like a
dry twig. You collapse into a babbling pile of jello, and white-coated
attendants take you away to a nice sunlit room where Lestrade visits
on alternate Tuesdays."
			>
			<RT-QSR>
		)
		(<AND <MC-VERB? READ EXAMINE LOOK-ON>
				<MC-THIS-PRSO?>
			>
			<TELL
"The label on the ampoule reads 'Etherium. Extremely volatile. Do not open
in the presence of fire.'" CR
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-BROKEN-AMPOULE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-BROKEN-AMPOULE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-BROKEN-AMPOULE-GAS">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? SHOOT>
			<TELL CTHEO ,K-SHATTER-MSG CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-ETHERIUM-GAS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-ETHERIUM-GAS ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-ETHERIUM-GAS">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? SMELL>
			<COND
				(<RT-ACCESSIBLE? ,TH-ETHERIUM-GAS>
					<RT-SMELL-ETHERIUM?>
				)
				(T
					<RT-CYOU-MSG>
					<TELL "cannot smell it." CR>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-WASTE-OF-BULLETS-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-LAB-EQUIPMENT"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-LAB-EQUIPMENT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-LAB-EQUIPMENT">
		)
		(T
		)
	>
	<COND
		(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
			<RT-CYOU-MSG "reach" "reaches">
			<TELL "towards the equipment, but then">
			<RT-YOU-MSG "recall" "recalls" T>
			<TELL 
"Holmes's oft-repeated admonition to leave undisturbed his various
experiments, and"
			>
			<RT-YOU-MSG "quickly withdraw" "quickly withdraws" T>
			<RT-YOUR-MSG>
			<TELL "hand." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-ROPE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-ROPE ("AUX" T1 T2)
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-ROPE">
		)
		(T
		)
	>
	<SET T1 <GETP ,TH-ROPE ,P?AUX1>>
	<SET T2 <GETP ,TH-ROPE ,P?AUX2>>
	<COND
		(<MC-THIS-PRSO?>
			<COND
				(<AND <MC-VERB? TAKE>
						<NOT <EQUAL? .T1 -1>>
					>
					<TELL CTHE ,TH-ROPE " is securely bound to " THE .T1>
					<COND
						(<NOT <EQUAL? .T2 -1>>
							<TELL " and " THE .T2>
						)
					>
					<TELL "." CR>
				)
				(<AND <MC-VERB? CUT>
						<MC-PRSI? TH-KNIFE>
						<NOT <EQUAL? .T1 -1>>
					>
					<RT-CYOU-MSG "cut" "cuts">
					<TELL THE .T1>
					<PUTP ,TH-ROPE ,P?AUX1 -1>
					<MC-UNMAKE .T1 ,FL-LOCKED>
					<COND
						(<NOT <EQUAL? .T2 -1>>
							<PUTP ,TH-ROPE ,P?AUX2 -1>
							<MC-UNMAKE .T2 ,FL-LOCKED>
							<TELL " and " THE .T2>
						)
					>
					<TELL " free, and">
					<RT-YOU-MSG "are" "is">
					<TELL "left holding the rope." CR>
					<MOVE ,TH-ROPE ,GL-WINNER>
					<COND
						(<AND <MC-HERE? ,RM-LAIR>
								<EQUAL? ,CH-MORIARTY .T1 .T2>
								<MC-ISNOT? ,CH-MORIARTY ,FL-ASLEEP>
							>
							<CRLF>
							<TELL
"Bad move. As soon as he is free, Moriarty unlocks his desk and pulls out a
pistol. \"Thank you for releasing me, gentlemen,\" he says, waving the gun at
you. \"Very sporting of you.\" He glances at his pocketwatch. \"We shouldn't
have too long to wait.\" Minutes later you hear newsboys running through the
streets shouting about the resignation of the Prime Minister." CR
							>
							<RT-QSR>
						)
					>
					<RTRUE>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-LIQUID"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-LIQUID ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-LIQUID">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? SHOOT>
			<TELL "Sorry, you missed." CR>
		)
		(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
			<RT-HOLMES-HITS ,TH-LIQUID>
		)
		(<AND <MC-VERB? SMELL>
				<MC-THIS-PRSO?>
			>
			<RT-HOLMES-HITS ,TH-LIQUID>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-SYRINGE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-SYRINGE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-SYRINGE">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? SHOOT>
			<TELL ,K-ANNIE-OAKELEY-MSG CR>
		)
		(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
			<RT-HOLMES-HITS ,TH-SYRINGE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-MOROCCO-CASE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-MOROCCO-CASE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-MOROCCO-CASE">
		)
		(T
		)
	>
	<COND
		(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
			<COND
				(<MC-IS? ,CH-HOLMES ,FL-ASLEEP>
					<RT-HOLMES-HITS ,TH-MOROCCO-CASE>
					<RTRUE>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-DEAD-PIGEON"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-DEAD-PIGEON ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-DEAD-PIGEON">
		)
		(T
		)
	>
	<COND
		(<AND <MC-VERB? DROP RELEASE THROW>
				<MC-PRSO? TH-DEAD-PIGEON>
			>
			<TELL "Thud." CR>
			<MOVE ,TH-DEAD-PIGEON ,GL-PLACE-CUR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-PIGEONS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-PIGEONS ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-PIGEONS" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? ,GL-WINNER ,TH-PIGEONS>
			<TELL CTHE ,TH-PIGEONS " coo in response." CR>
			<RTRUE>
		)
		(<AND	<MC-VERB? TAKE>
				<MC-PRSO? ,TH-PIGEONS>
			>
			<TELL CTHE ,TH-PIGEONS " scurry out of reach." CR>
			<RTRUE>
		)
		(<AND <MC-VERB? SHOOT>
				<MC-PRSO? ,TH-PIGEONS>
			>
			<RT-SHOOT-BIRDS ,TH-PIGEONS "strutting around">
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-SHOOT-BIRDS"
;-----------------------------------------------------------------------------

<ROUTINE RT-SHOOT-BIRDS (THING STR)
	<TELL
CTHE .THING " all fly up into the air at the sound of the
gunshot. Fortunately, none of them was hit. They soon land
and resume " .STR "." CR
	>
>


;-----------------------------------------------------------------------------
; "RT-AC-TH-RED-GLASS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-RED-GLASS ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-RED-GLASS" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<MC-VERB? SHOOT>
			<TELL CTHEO ,K-SHATTER-MSG CR>
		)
		(<AND <MC-VERB? TAKE>
				<IN? ,TH-RUBY ,CH-SHERMAN>
			>
			<RT-IMPOLITE-MSG "take things" "asking">
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-BED"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-BED ("AUX" WHO)
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-BED">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<TELL ,K-NO-RESTING-MSG CR>
			<RTRUE>
		)
      (<MC-VERB? LOOK-UNDER>
			<SET WHO <RT-WHO-SAYS?>>
			<COND
				(<EQUAL? .WHO ,CH-HOLMES>
					<TELL
"Holmes gives you a swift kick in the rear and says, \"Watson! There are much
more important matters afoot.\"" CR
					>
				)
				(<EQUAL? .WHO ,CH-WIGGINS>
					<TELL
"Wiggins says, \"Would you get yer bleedin' arse in gear.\"" CR
					>
				)
				(T
		         <TELL
"Looking for monsters?" CR
      		   >
				)
			>
			<RTRUE>
      )
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-MATCHBOOK"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-MATCHBOOK ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-MATCHBOOK">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? READ EXAMINE LOOK-ON>
					<TELL	CR
"Tired of your dull, boring job? Tired of the whole Victorian era? Become
a detective! Apply now to the LESTRADE school
of sleuthing. In just three short days, Inspector G. Lestrade will teach
you everything he knows of the art of detection. Here are just some of the
things you'll learn." CR CR

"*** Fifteen new and exciting ways to" WRAP "say \"'Ullo! Wot's this?\"" CR
"*** Modern obfuscatory locution" WRAP "eschewel techniques." CR
"*** How to insult private detectives." CR CR

"Included in your tuition is an official Scotland Yard
notebook, and a brand new bobby pin. Just send twenty-five pounds
to the LESTRADE, that's L-E-S-T-R-A-D-E school of sleuthing. Act now, and
the Inspector will tell you how he knows that people are guilty simply
by looking at them." CR
					>
				)
				(<AND <MC-VERB? LIGHT-WITH BURN-WITH>
						<MC-THIS-PRSO?>
					>
					<COND
						(<OR	<AND	<MC-IS? ,GL-PRSI ,FL-LIGHTED>
										<MC-IS? ,GL-PRSI ,FL-BURNABLE>
								>
								<AND	<MC-PRSI? ,TH-PIPE>
										<MC-IS? ,TH-TOBACCO ,FL-LIGHTED>
								>
							>
							<TELL CTHE ,TH-MATCHBOOK " catches fire." CR>
							<MC-MAKE ,TH-MATCHBOOK ,FL-LIGHTED>
							<RT-ALARM-SET-REL ,RT-I-MATCHBOOK-OUT <RT-PARM-SET 0 1 0>>
						)
						(T
							<TELL CTHEI " is not burning." CR>
						)
					>
				)
			>
		)
		(<MC-THIS-PRSI?>
			<COND
				(<AND <MC-VERB? PUT PUT-ON>
						<NOT <MC-PRSO? ,TH-MATCH ,TH-BURNT-MATCH>>
					>
					<RT-CANT-PUT-IN-ON-MSG ,TH-MATCHBOOK>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-PICTURES"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-PICTURES ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-PICTURES">
		)
		(T
		)
	>
	<COND
      (<MC-VERB? LOOK-BEHIND>
         <TELL
"Thorough, aren't you? There's nothing there." CR
         >
      )
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-CLUE-BOOK"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-CLUE-BOOK ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-CLUE-BOOK">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? READ EXAMINE>
					<COND
						(<MC-IS? ,TH-CLUE-BOOK ,FL-OPENED>
							<RT-READ-CLUE-BOOK>
						)
						(T
							<TELL "The title is, \"Secret Writing and Invisible Inks.\"" CR>
						)
					>
					<RTRUE>
				)
				(<MC-VERB? LOOK-INSIDE SEARCH>
					<COND
						(<MC-IS? ,TH-CLUE-BOOK ,FL-OPENED>
							<TELL "The pages are yellowed with age." CR>
						)
						(T
							<RT-CYOU-MSG>
							<RT-WOULD-HAVE-TO-MSG "open it first.">
							<CRLF>
						)
					>
					<RTRUE>
				)
				(<MC-VERB? OPEN>
					<COND
						(<MC-IS? ,TH-CLUE-BOOK ,FL-OPENED>
							<TELL "The book is already open." CR>
						)
						(T
							<MC-MAKE ,TH-CLUE-BOOK ,FL-OPENED>
							<TELL "The book falls open to the introduction." CR>
						)
					>
				)
				(<MC-VERB? LIGHT-WITH BURN-WITH>
					<TELL
"Perfect example of a typically repressive Victorian mentality." CR
					>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-BOOK-PAGE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-BOOK-PAGE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-BOOK-PAGE">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? READ EXAMINE>
			<COND
				(<MC-IS? ,TH-CLUE-BOOK ,FL-OPENED>
					<RT-READ-CLUE-BOOK>
				)
				(T
					<RT-CYOU-MSG>
					<RT-WOULD-HAVE-TO-MSG "open">
					<TELL "the book first." CR>
					<RTRUE>
				)
			>
			<RTRUE>
		)
		(<MC-VERB? FLIP TURN>
			<COND
				(<MC-IS? ,TH-CLUE-BOOK ,FL-OPENED>
					<TELL
"A quick review of the remainder of the book reveals nothing interesting." CR
					>
				)
				(T
					<RT-CYOU-MSG>
					<RT-WOULD-HAVE-TO-MSG "open">
					<TELL "the book first." CR>
					<RTRUE>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-READ-CLUE-BOOK"
;-----------------------------------------------------------------------------

<ROUTINE RT-READ-CLUE-BOOK ()
	<TELL
"A few underlined sentences catch your eye." CR CR

"\"Invisible writing has a long and honorable history. It is used primarily
when it is felt that a code or cipher may be too easily broken.\"" CR CR

"\"Most invisible inks are somewhat sticky to the touch, and virtually all
of them become visible when exposed to moderate heat.\"" CR
	>
>
;-----------------------------------------------------------------------------
; "RT-AC-TH-BANK-OF-CANDLES"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-BANK-OF-CANDLES ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-BANK-OF-CANDLES">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<COND
				(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
					<TELL
"After a moment's reflection you decide to leave undisturbed
the offerings that others have left behind." CR
					>
					<RTRUE>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-PRAMS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-PRAMS ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-PRAMS">
		)
		(T
		)
	>
	<COND
		(<OR  <INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
				<MC-VERB? LOOK-INSIDE SEARCH>
			>
			<TELL
"The nannies move the prams beyond your reach and glare at you menacingly." CR
			>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-PARK-FLOWERS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-PARK-FLOWERS ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-PARK-FLOWERS">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? TAKE>
			<TELL "Please don't pick the flowers." CR>
			<RTRUE>
		)
		(<MC-VERB? SHOOT>
			<RT-WASTE-OF-BULLETS-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-ARCH"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-ARCH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-ARCH">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? SHOOT>
			<TELL ,K-RICOCHET-MSG CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-SHAFT"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-SHAFT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-SHAFT">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? EXAMINE LOOK-INSIDE LOOK-DOWN SEARCH>
			<TELL "It's a long way down." CR>
		)
		(<MC-VERB? ENTER LEAP>
			<TELL ,K-SUICIDE-MSG CR>
			<RTRUE>
		)
		(<AND <MC-VERB? PUT>
				<MC-THIS-PRSI?>
			>
			<COND
				(<MC-PRSO? ,CH-TRAINED-PIGEON>
					<RFALSE>
				)
				(T
					<REMOVE ,GL-PRSO>
					<TELL	CTHEO " disappears into the shaft. A long time later you
hear a faint \"thud.\"" CR
					>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-FIREPLACE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-FIREPLACE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-FIREPLACE">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? EXAMINE LOOK-INSIDE SEARCH>
			<TELL "In the fireplace is a roaring fire that would surely consume
anything you put into it." CR>
		)
		(<MC-VERB? ENTER LEAP>
			<TELL ,K-SUICIDE-MSG CR>
			<RTRUE>
		)
		(<AND <MC-VERB? PUT>
				<MC-PRSI? ,TH-FIREPLACE>
			>
			<COND
				(<MC-IS? ,GL-PRSO ,FL-BODYPART>
					<TELL ,K-HOT-MSG CR>
				)
				(<IN? ,GL-PRSO ,GLOBAL-OBJECTS>
					<RT-IMPOSSIBLE-MSG>
					<RTRUE>
				)
				(T
					<REMOVE ,GL-PRSO>
					<TELL	CTHEO " disappears into the fire and is immediately
consumed." CR
					>
					<COND
						(<MC-PRSO? ,CH-TRAINED-PIGEON>
							<RT-KILL-PIGEON>
						)
					>
					<RTRUE>
				)
			>
		)
		(<MC-VERB? REACH-IN>
			<TELL ,K-HOT-MSG CR>
			<RTRUE>
		)
		(<MC-VERB? SHOOT>
			<TELL ,K-RICOCHET-MSG CR>
		)
	>
>


;-----------------------------------------------------------------------------
; "RT-AC-TH-FIRE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-FIRE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-FIRE">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? EXAMINE LOOK-INSIDE SEARCH>
			<TELL "It's a roaring fire that would surely consume anything
you put into it." CR>
		)
		(<MC-VERB? ENTER LEAP>
			<TELL ,K-SUICIDE-MSG CR>
			<RTRUE>
		)
		(<AND <MC-VERB? PUT>
				<MC-PRSI? ,TH-FIRE>
			>
			<COND
				(<MC-PRSO? ,TH-HANDS ,TH-FOOT ,TH-FEET ,TH-EARS>
					<TELL ,K-HOT-MSG CR>
				)
				(<IN? ,GL-PRSO ,GLOBAL-OBJECTS>
					<RT-IMPOSSIBLE-MSG>
					<RTRUE>
				)
				(T
					<REMOVE ,GL-PRSO>
					<RT-CYOU-MSG "throw" "throws">
					<TELL	THEO " into the fire and it is immediately
consumed." CR
					>
					<COND
						(<MC-PRSO? ,CH-TRAINED-PIGEON>
							<RT-KILL-PIGEON>
						)
					>
					<RTRUE>
				)
			>
		)
		(<MC-VERB? REACH-IN>
			<TELL ,K-HOT-MSG CR>
			<RTRUE>
		)
		(<MC-VERB? SHOOT>
			<RT-WASTE-OF-BULLETS-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-GAS-LIGHT"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-GAS-LIGHT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-GAS-LIGHT">
		)
		(T
		)
	>
	<COND
		(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
			<TELL CTHE ,TH-GAS-LIGHT " is out of reach." CR>
			<RTRUE>
		)
		(<MC-VERB? SHOOT>
			<RT-WASTE-OF-BULLETS-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-CHARIOT"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-CHARIOT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-CHARIOT">
		)
		(T
		)
	>
	<COND
		(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
			<TELL CTHE ,TH-CHARIOT " is out of reach." CR>
			<RTRUE>
		)
		(<MC-VERB? SHOOT>
			<TELL ,K-ANNIE-OAKELEY-MSG CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-JEWEL-CASE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-JEWEL-CASE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-JEWEL-CASE">
		)
		(T
		)
	>
	<COND
		(<AND	<MC-VERB? LOOK-THRU>
				<MC-PRSI? ,TH-MAGNIFYING-GLASS>
			>
			<TELL "It's been wiped clean." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-ELIZAS-HEART"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-ELIZAS-HEART ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-ELIZAS-HEART">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? LISTEN>
			<RT-LISTEN-ELIZA>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-ELIZAS-MOUTH"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-ELIZAS-MOUTH ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-ELIZAS-HEART">
		)
		(T
		)
	>
	<COND
		(<NOT <AND
					<MC-VERB? PUT>
					<MC-THIS-PRSI?>
				>
			>
			<RFALSE>
		)
		(<MC-ISNOT? ,TH-ELIZAS-MOUTH ,FL-OPENED>
			<TELL THEI " is not open." CR>
		)
		(<MC-PRSO? ,TH-ORANGE-PILL ,TH-YELLOW-PILL>
			<RT-CURE-ELIZA ,GL-PRSO>
		)
		(<RT-ROOM-IN-ON-MSG? ,GL-PRSO ,GL-PRSI>
			T
		)
		(<MC-IS? ,CH-ELIZA-DOOLITTLE ,FL-ASLEEP>
			<REMOVE ,GL-PRSO>
			<RT-CYOU-MSG "put" "puts">
			<TELL THEO " into " THEI ". She swallows reflexively, gulping down "
THEO "." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-RUBBINGS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-RUBBINGS ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-RUBBINGS">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? READ>
			<RT-DF-TH-RUBBINGS>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-SOFA"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-SOFA ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-SOFA">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<TELL ,K-NO-RESTING-MSG CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-MARQUEES"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-MARQUEES ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-MARQUEES">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? READ LOOK-INSIDE LOOK-ON>
			<SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-MARQUEES>>
			<RT-WINDOW ,GL-WINDOW>
			<SETG GL-WINDOW <>>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-SUPPORTS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-SUPPORTS ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-SUPPORTS">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? SHOOT>
			<TELL ,K-RICOCHET-MSG CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-ASH"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-ASH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-ASH">
		)
		(T
		)
	>
	<COND
      (<MC-VERB? BLOW-INTO SHOOT>
			<REMOVE ,TH-ASH>
         <TELL CTHE ,TH-ASH " scatters and disappears." CR>
      )
		(<MC-VERB? HAUL>
			<TELL
"Good idea. Let's get the flake out of here." CR
			>
		)
		(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
			<REMOVE ,TH-ASH>
         <TELL "As soon as">
			<RT-YOU-MSG "try" "tries">
         <TELL "to touch the ash, it crumbles and disappears." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-CIGARETTE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-CIGARETTE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-CIGARETTE">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? SHOOT>
			<TELL ,K-ANNIE-OAKELEY-MSG CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-TURBAN"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-TURBAN ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-TURBAN">
		)
		(T
		)
	>
	<COND
		(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
			<TELL
"The native of India pulls away from you and says, \"As you must know,"
			>
			<COND
				(<MC-IS? ,TH-WATSONS-HAT ,FL-WORN>
					<TELL "honourable sir,">
				)
			>
			<TELL
" a man's head should never be uncovered. It is an affront to God.\"" CR
			>
		)
		(<MC-VERB? SHOOT>
			<RT-PERFORM ,V?SHOOT ,CH-AKBAR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-VERE-ARMOUR"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-VERE-ARMOUR ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-VERE-ARMOUR">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? SHOOT>
			<TELL ,K-RICOCHET-MSG CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-ANCHOR-CHAIN"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-ANCHOR-CHAIN ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-ANCHOR-CHAIN">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? SHOOT>
			<TELL ,K-RICOCHET-MSG CR>
		)
		(<NOT <IN? ,CH-PLAYER ,TH-BOAT>>
			<TELL ,K-MUST-BE-IN-BOAT-MSG "do that." CR>
		)
		(<MC-VERB? TAKE>
			<COND
				(<IN? ,TH-ANCHOR ,TH-BOAT>
					<TELL "Oomph! It's too heavy to carry." CR>
				)
				(T
					<MOVE ,TH-ANCHOR ,TH-BOAT>
					<TELL ,K-RAISE-ANCHOR-MSG CR>
				)
			>
		)
		(<MC-VERB? RAISE HAUL WEIGH PULL>
			<COND
				(<IN? ,TH-ANCHOR ,LG-WATER>
					<MOVE ,TH-ANCHOR ,TH-BOAT>
					<TELL ,K-RAISE-ANCHOR-MSG CR>
				)
				(T
					<TELL ,K-ANCHOR-ALREADY-OUT-MSG CR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-WAX-OBJECT-1"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-WAX-OBJECT-1 ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-WAX-OBJECT-1">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? SHOOT>
			<RT-WASTE-OF-BULLETS-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-WAX-OBJECT-2"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-WAX-OBJECT-2 ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-WAX-OBJECT-2">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? SHOOT>
			<RT-WASTE-OF-BULLETS-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-LIBRARY-OBJ"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-LIBRARY-OBJ ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-LIBRARY-OBJ">
		)
		(T
		)
	>
	<COND
		(<MC-VERB?  LOOK-INSIDE LOOK-OUTSIDE LOOK-THRU-SWP LOOK-UNDER
						LOOK-BEHIND LOOK-ON LOOK-THRU SEARCH READ>
			<TELL
"You see nothing " <RT-PICK-NEXT ,GL-BORING-TXT> "." CR
			>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-RAILING"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-RAILING ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-RAILING">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? CLIMB-OVER>
			<TELL ,K-SUICIDE-MSG CR>
			<RTRUE>
		)
		(<MC-VERB? CLIMB-ON>
			<TELL "It's much too dangerous. Besides, it wouldn't bring you
any closer to the clapper." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-OPIUM-GAS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-OPIUM-GAS ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-OPIUM-GAS">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? SMELL>
			<TELL ,K-DIZZY-MSG CR>
		)
		(<MC-VERB? BUY BUY-FROM>
			<TELL
"The proprietor eyes you for a moment and says, \"A gent the likes of
you doesn't buy what I 'ave to sell, mate. What is it you really want?\""
CR
			>
		)
		(<MC-VERB? SHOOT>
			<RT-WASTE-OF-BULLETS-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-PRODUCE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-PRODUCE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-PRODUCE">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? SMELL>
			<COND
				(<EQUAL? <RT-TIME-OF-DAY> 0>
					<TELL "The produce smells country-fresh." CR>
				)
				(T
					<TELL "The produce smells like it's been there a while." CR>
				)
			>
			<RTRUE>
		)
		(<MC-VERB? BUY BUY-FROM>
			<COND
				(<EQUAL? <GET ,GL-P-NAMW 0> ,W?FRUIT ,W?FRUITS>
					<TELL "You">
				)
				(T
					<TELL "Although the giant peas look tempting, you">
				)
			>
			<TELL
" decide to conserve your capital for more important purchases." CR
			>
		)
		(<MC-VERB? TAKE STEAL>
 			<TELL ,K-THEFT-MSG CR>
			<RTRUE>
		)
		(<MC-VERB? SHOOT>
			<RT-WASTE-OF-BULLETS-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-TRINKETS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-TRINKETS ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-TRINKETS">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? BUY BUY-FROM>
			<COND
				(<IN? ,TH-TELESCOPE ,CH-VENDOR>
					<TELL
"The vendor says, \"I've got a loverly telescope you might be interested
in, guv'nor.\"" CR
					>
				)
				(T
					<TELL
"You glance at the rest of the vendor's wares and decide you can live
without them." CR
					>
				)
			>
			<RTRUE>
		)
		(<MC-VERB? TAKE STEAL>
 			<TELL ,K-THEFT-MSG CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-GUARDS-KEYS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-GUARDS-KEYS ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-GUARDS-KEYS">
		)
		(T
		)
	>
	<COND
		(<AND <MC-VERB? LISTEN>
				<MC-THIS-PRSO?>
			>
			<TELL
CTHE ,CH-BANK-GUARD " is idly jangling some keys in his pocket." CR
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-NELSON-EYE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-NELSON-EYE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-NELSON-EYE">
		)
		(T
		)
	>
	<COND
		(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
			<TELL CTHE ,TH-NELSON-EYE " is too high." CR>
			<RTRUE>
		)
		(<MC-VERB? LOOK-INSIDE SEARCH>
			<COND
				(<NOT <RT-DF-TH-NELSON-EYE>>
					<TELL
"It is too high up to get a good look." CR
					>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<TELL ,K-ANNIE-OAKELEY-MSG CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-UNINTERESTING-OBJECT"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-UNINTERESTING-OBJECT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-UNINTERESTING-OBJECT">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? TAKE RELEASE MOVE LOOK-UNDER PUSH-TO PUSH>
			<RT-CYOU-MSG>
			<TELL
"can't seem to budge the object." CR
			>
			<RTRUE>
		)
		(<MC-VERB? MUNG SHOOT>
			<RT-CYOU-MSG>
			<TELL
"can't seem to destroy the object." CR
			>
			<RTRUE>
		)
	>
>

;*****************************************************************************
; "CONSTANTS"
;*****************************************************************************

<CONSTANT K-HOLMES-LICKS-MSG
"Holmes absentmindedly licks his fingers and then wipes his hands on his
smoking jacket. His "
>

<CONSTANT K-ANOTHER-PHIAL-MSG
"Holmes takes another phial out of his pocket and stares at it in the same
way as before."
>

<CONSTANT K-HOT-MSG
"Yeeeeeeeeeeeeeeeeeeeouch!!! Hot, hot, hot, hot..."
>

<CONSTANT K-RAISE-ANCHOR-MSG
"You raise the anchor and drop it into the boat."
>

<CONSTANT K-LOWER-ANCHOR-MSG
"You lower the anchor into the water."
>

<CONSTANT K-ANCHOR-ALREADY-OUT-MSG
"The anchor is already out of the water."
>

<CONSTANT K-MUST-BE-IN-BOAT-MSG
"You would have to be in the boat to "
>

<CONSTANT K-NOT-SEE-HERE-MSG
"You do not see that here."
>

<CONSTANT K-NO-RESTING-MSG
"This is no time for resting."
>

<CONSTANT K-DIZZY-MSG
"You begin to feel a little dizzy."
>

<CONSTANT K-LESTRADE-ARRESTS-MSG
"Lestrade arrests you and puts you in handcuffs. You will spend the rest of
your life in Dartmoor, trying to understand where you went wrong."
>

<CONSTANT K-PLUG-HIM-MYSELF-MSG
" \"I don't blame you a bit, Dr. Watson. Said \"Elementary\" one too many
times did 'e? Many's the time I've wanted to plug him myself. Still, I've
got to take you away. Come along now.\""
>

<CONSTANT K-ANNIE-OAKELEY-MSG
"Who do you think you are, Annie Oakley?"
>

<CONSTANT K-SHATTER-MSG
" shatters and disappears."
>

;*****************************************************************************
; "end of file"
;*****************************************************************************

