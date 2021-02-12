;******************************************************************************
; "game : SHERLOCK!"
; "file : VERBS3.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   28 Oct 1987 16:53:12  $"
; "rev  : $Revision:   1.50  $"
; "vers : 1.00"
;******************************************************************************

;-----------------------------------------------------------------------------
; "this file contains:"
; "   game play verb support globals"
; "   game play verb support routines"
; "   game control verb support globals"
; "   game control verb support routines"
; "   game control verbs"
;-----------------------------------------------------------------------------

;*****************************************************************************
; "Constant strings"
;*****************************************************************************

<CONSTANT K-REFERRING-MSG "[To what are you referring?]">

<CONSTANT K-DO-IT-YOURSELF-MSG "You will have to do that yourself.">

<CONSTANT K-INAPPROPRIATE-MSG "That would hardly be an appropriate thing to do.">

<CONSTANT K-HOW-TO-MSG "How do you intend to do that?">

<CONSTANT K-NO-SWIM-MSG "There is no place to swim here.">

<CONSTANT K-PROFANITY-MSG "A proper Victorian would never use such a vulgar word.">

<CONSTANT K-SUICIDE-MSG "Suicide is frowned upon in medical circles.">

<CONSTANT K-THEFT-MSG
"Thievery, outside of established limits, is frowned upon by the medical
profession."
>

<CONSTANT K-SPECIFY-DIR-MSG "[You must specify a direction.]">

<CONSTANT K-WONT-HELP-MSG " is not likely to help matters.">

;*****************************************************************************
; "game-play-verb support globals"
;*****************************************************************************

;<GLOBAL GL-BREATH-HELD? <>>				; "is player holding his breath"

<GLOBAL GL-LISTEN-OBJ:OBJECT <>>

;*****************************************************************************
; "game-play-verb support routines"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-CANT-SEE-MUCH-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-CANT-SEE-MUCH-MSG ()
	<RT-CYOU-MSG>
	<TELL "cannot see much from here." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-NO-MONEY-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-NO-MONEY-MSG ()
	<RT-CYOU-MSG "do not" "does not">
	<TELL "have any money." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-IN-VEHICLE-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-IN-VEHICLE-MSG ()
	<COND
		(<OR  <IN? ,CH-PLAYER ,TH-HANSOM-CAB>
				<IN? ,CH-PLAYER ,TH-GROWLER-CAB>
			>
			<TELL " in a cab ">
		)
		(<IN? ,CH-PLAYER ,TH-BOAT>
			<TELL " in a boat ">
		)
		(T
			<TELL " standing ">
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DRIVE-WALK-MSG?"
;-----------------------------------------------------------------------------

<ROUTINE RT-DRIVE-WALK-MSG? ()
	<COND
		(<OR  <IN? ,CH-PLAYER ,TH-HANSOM-CAB>
				<IN? ,CH-PLAYER ,TH-GROWLER-CAB>
			>
			<TELL " drive ">
		)
		(T
			<TELL " walk ">
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-ALREADY-IN-ROOM-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-ALREADY-IN-ROOM-MSG ()
	<TELL "You are already in " THEO "." CR>
>

;-----------------------------------------------------------------------------
; "RT-NOT-IN-ROOM-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-NOT-IN-ROOM-MSG ()
	<TELL "You are not in " THEO "." CR>
>

;-----------------------------------------------------------------------------
; "RT-OBJECT-IS-LOCKED-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-OBJECT-IS-LOCKED-MSG ()
	<RT-CYOU-MSG>
	<TELL "cannot do that. It is locked." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-NOTHING-INTERESTING-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-NOTHING-INTERESTING-MSG ()
	<RT-CYOU-MSG "do" "does">
	<TELL "not see anything " <RT-PICK-NEXT ,GL-BORING-TXT>>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-WASTE-OF-TIME-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-WASTE-OF-TIME-MSG ()
	<TELL <RT-PICK-NEXT ,GL-NO-POINT-TXT> "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-FOG-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-FOG-MSG ()
	<TELL <RT-PICK-NEXT ,GL-FOG-TXT> "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-ITS-RIGHT-HERE-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-ITS-RIGHT-HERE-MSG ()
	<RT-SAY-ITS-MSG>
	<TELL "right here in front of you." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-WHO-WHAT-WHERE-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-WHO-WHAT-WHERE-MSG ()
	<COND
		(<RT-FOOLISH-TO-TALK-MSG>
			<RTRUE>
		)
		(T
			<RT-NO-RESPONSE-MSG
				<COND
					(<MC-VERB? WHO WHAT WHERE>
						,GL-WINNER
					)
				>
			>
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-HI-BYE-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-HI-BYE-MSG ()
	<COND
		(<RT-FOOLISH-TO-TALK-MSG>
			<MC-RFATAL>
		)
		(<MC-PRSO? ROOMS>
			<RT-TALK-TO-SELF-MSG>
			<RTRUE>
		)
		(T
			<RT-NO-RESPONSE-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-NO-RESPONSE-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-NO-RESPONSE-MSG ("OPTIONAL" (WHO <>))
	<COND
		(<MC-F? .WHO>
			<SET WHO ,GL-PRSO>
		)
	>
	<TELL CTHE .WHO>
	<COND
		(<MC-IS? .WHO ,FL-PLURAL>
			<TELL " do">
		)
		(T
			<TELL " does">
		)
	>
	<TELL " not respond." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-TAKE-OFF-PRSO-FIRST-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-TAKE-OFF-PRSO-FIRST-MSG ()
	<TELL "[taking off " THEO " first]" CR>
	<MC-UNMAKE ,GL-PRSO ,FL-WORN>
	<COND
		(<MC-PRSO? ,TH-WATSONS-HAT>
			<MC-MAKE ,TH-WATSONS-HAT ,FL-OPENED>
		)
		(<MC-PRSO? ,TH-SUIT-OF-ARMOUR>
			<MOVE ,TH-SUIT-OF-ARMOUR ,GL-PLACE-CUR>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-SAY-DROPPED-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-SAY-DROPPED-MSG ()
	<COND
		(<MC-T? ,GL-P-MULT?>
			<TELL "Dropped." CR>
			<RTRUE>
		)
		(T
			<RT-CYOU-MSG "drop" "drops">
			<TELL THEO "." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-FOOLISH-TO-TALK-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-FOOLISH-TO-TALK-MSG ()
	<COND
		(<EQUAL? ,GL-PRSO <> ,ROOMS>
			<RFALSE>
		)
		(<MC-ISNOT? ,GL-PRSO ,FL-ALIVE>
			<RT-NOT-LIKELY-MSG ,GL-PRSO "would respond">
			<RT-P-CLEAR>
			<RTRUE>
		)
		(<MC-PRSO? CH-ME GL-PRSI GL-WINNER>
			<TELL "That would">
			<RT-WASTE-OF-TIME-MSG>
			<RT-P-CLEAR>
			<RTRUE>
		)
		(T
			<RT-THIS-IS-IT ,GL-PRSO>
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-PRSO-SLIDES-OFF-PRSI-MSG"
;-----------------------------------------------------------------------------

;<ROUTINE RT-PRSO-SLIDES-OFF-PRSI-MSG ()
	<TELL CTHEO " slide">
	<COND
		(<OR	<MC-ISNOT? ,GL-PRSO ,FL-PLURAL>
				<MC-IS? ,GL-PRSO ,FL-COLLECTIVE>
			>
			<TELL "s">
		)
	>
	<TELL " off " THEI " and ">
	<RT-LANDS-AT-YOUR-FEET-MSG>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-YOU-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-YOU-MSG ("OPTIONAL" (WRD1 <>) (WRD2 <>) (PRONOUN? <>))
	<COND
		(<EQUAL? ,GL-WINNER ,CH-PLAYER>
			<TELL " you ">
			<COND
				(<MC-T? .WRD1>
					<TELL .WRD1 " ">
				)
			>
		)
		(T
			<TELL " ">
			<COND
				(.PRONOUN?
					<COND
						(<AND <MC-IS? ,GL-WINNER ,FL-PLURAL>
								<MC-ISNOT? ,GL-WINNER ,FL-COLLECTIVE>
							>
							<TELL "they">
						)
						(<MC-IS? ,GL-WINNER ,FL-PERSON>
							<COND
								(<MC-IS? ,GL-WINNER ,FL-FEMALE>
									<TELL "she">
								)
								(T
									<TELL "he">
								)
							>
						)
						(T
							<TELL "it">
						)
					>
				)
				(T
					<TELL THE ,GL-WINNER>
				)
			>
			<TELL " ">
			<COND
				(<MC-T? .WRD2>
					<TELL .WRD2 " ">
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-CYOU-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-CYOU-MSG ("OPTIONAL" (WRD1 <>) (WRD2 <>) (PRONOUN? <>))
	<COND
		(<EQUAL? ,GL-WINNER ,CH-PLAYER>
			<TELL "You ">
			<COND
				(<MC-T? .WRD1>
					<TELL .WRD1 " ">
				)
			>
		)
		(T
			<COND
				(.PRONOUN?
					<COND
						(<AND <MC-IS? ,GL-WINNER ,FL-PLURAL>
								<MC-ISNOT? ,GL-WINNER ,FL-COLLECTIVE>
							>
							<TELL "They">
						)
						(<MC-IS? ,GL-WINNER ,FL-PERSON>
							<COND
								(<MC-IS? ,GL-WINNER ,FL-FEMALE>
									<TELL "She">
								)
								(T
									<TELL "He">
								)
							>
						)
						(T
							<TELL "It">
						)
					>
				)
				(T
					<TELL CTHE ,GL-WINNER>
				)
			>
			<TELL " ">
			<COND
				(<MC-T? .WRD2>
					<TELL .WRD2 " ">
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-ITS-ALREADY-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-ITS-ALREADY-MSG (STR)
	<TELL "It is already " .STR "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-YOURE-NOT-A-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-YOURE-NOT-A-MSG (STR)
	<TELL "You're a general practitioner, not a " .STR "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-NO-POINT-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-NO-POINT-MSG (STR)
	<TELL .STR " " THEO " would" <RT-PICK-NEXT ,GL-NO-POINT-TXT> "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-IS-ARE-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-IS-ARE-MSG ("OPTIONAL" (THING <>))
	<COND
		(<MC-F? .THING>
			<SET THING ,GL-PRSO>
		)
	>
	<COND
		(<AND <MC-IS? .THING ,FL-PLURAL>
				<MC-ISNOT? .THING ,FL-COLLECTIVE>
			>
			<TELL " are ">
		)
		(T
			<TELL " is ">
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-ISNT-ARENT-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-ISNT-ARENT-MSG ("OPTIONAL" (THING <>))
	<COND
		(<MC-F? .THING>
			<SET THING ,GL-PRSO>
		)
	>
	<COND
		(<AND <MC-IS? .THING ,FL-PLURAL>
				<MC-ISNOT? .THING ,FL-COLLECTIVE>
			>
			<TELL " are not ">
		)
		(T
			<TELL " is not ">
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-SAY-ITS-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-SAY-ITS-MSG ("OPTIONAL" (THING <>))
	<COND
		(<MC-F? .THING>
			<SET THING ,GL-PRSO>
		)
	>
	<COND
		(<AND <MC-IS? .THING ,FL-PLURAL>
				<MC-ISNOT? .THING ,FL-COLLECTIVE>
			>
			<TELL "They are ">
			<RTRUE>
		)
		(<AND	<MC-IS? .THING ,FL-PERSON>
				<MC-IS? .THING ,FL-FEMALE>
				>
					<TELL "She is ">
					<RTRUE>
		)
		(<AND	<MC-IS? .THING ,FL-PERSON>
				<MC-ISNOT? .THING ,FL-FEMALE>
				>
					<TELL "He is ">
					<RTRUE>
		)
		(T
			<TELL "It is ">
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-SAY-HIM-HER-THEM-IT-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-SAY-HIM-HER-THEM-IT-MSG ("OPTIONAL" (THING <>))
	<COND
		(<MC-F? .THING>
			<SET THING ,GL-PRSO>
		)
	>
	<COND
		(<EQUAL? .THING ,CH-PLAYER ,CH-ME>
			<COND
				(<EQUAL? ,GL-WINNER ,CH-PLAYER ,CH-ME>
					<TELL "yourself">
				)
				(T
					<TELL "you">
				)
			>
		)
		(<AND <MC-IS? .THING ,FL-PLURAL>
				<MC-ISNOT? .THING ,FL-COLLECTIVE>
			>
			<TELL "them">
		)
		(<MC-IS? .THING ,FL-PERSON>
			<COND
				(<MC-IS? .THING ,FL-FEMALE>
					<TELL "her">
				)
				(T
					<TELL "him">
				)
			>
		)
		(T
			<TELL "it">
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-YOUR-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-YOUR-MSG ("OPTIONAL" (THING <>))
	<COND
		(<MC-F? .THING>
			<SET THING ,GL-WINNER>
		)
	>
	<COND
		(<EQUAL? .THING ,CH-PLAYER ,CH-ME>
			<TELL "your ">
		)
		(<AND <MC-IS? .THING ,FL-PLURAL>
				<MC-ISNOT? .THING ,FL-COLLECTIVE>
			>
			<TELL "their ">
		)
		(<MC-IS? .THING ,FL-PERSON>
			<COND
				(<MC-IS? .THING ,FL-FEMALE>
					<TELL "her ">
				)
				(T
					<TELL "his ">
				)
			>
		)
		(T
			<TELL "its ">
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-ITS-CLOSED-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-ITS-CLOSED-MSG ("OPTIONAL" (THING <>))
	<COND
		(<MC-F? .THING>
			<SET THING ,GL-PRSO>
		)
	>
	<TELL CTHE .THING>
	<RT-IS-ARE-MSG .THING>
	<TELL "closed." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-WHY-SHOOT-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-WHY-SHOOT-MSG ("OPTIONAL" (OBJ <>))
	<COND
		(<MC-F? .OBJ>
			<SET OBJ ,GL-PRSO>
		)
	>
	<TELL "Why would">
	<RT-YOU-MSG>
	<TELL "want to shoot the poor, little, innocent " D .OBJ "?" CR>
>

;-----------------------------------------------------------------------------
; "RT-HOW-READ-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-HOW-READ-MSG ("OPTIONAL" (THING <>))
	<COND
		(<MC-F? .THING>
			<SET THING ,GL-PRSO>
		)
	>
	<TELL "How can">
	<RT-YOU-MSG>
   <TELL "read " A .THING>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-ALREADY-HAVE-PRSO-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-ALREADY-HAVE-PRSO-MSG ("OPTIONAL" (THING <>))
	<COND
		(<MC-F? .THING>
			<SET THING ,GL-PRSO>
		)
	>
	<RT-CYOU-MSG "already have" "already has">
	<TELL A .THING "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-CANT-OPEN-PRSO-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-CANT-OPEN-PRSO-MSG ("OPTIONAL" (THING <>))
	<COND
		(<MC-F? .THING>
			<SET THING ,GL-PRSO>
		)
	>
	<RT-CYOU-MSG>
	<TELL "could not possibly open " THE .THING "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-CANT-SEE-FROM-HERE-MSG"
;-----------------------------------------------------------------------------

;<ROUTINE RT-CANT-SEE-FROM-HERE-MSG ("OPTIONAL" (THING <>))
	<COND
		(<MC-F? .THING>
			<SET THING ,GL-PRSO>
		)
	>
	<RT-CYOU-MSG>
	<TELL "cannot see " THE .THING " from here." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-CANT-CLOSE-THAT-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-CANT-CLOSE-THAT-MSG ("OPTIONAL" (THING <>))
	<COND
		(<MC-F? .THING>
			<SET THING ,GL-PRSO>
		)
	>
	<RT-CYOU-MSG>
	<TELL "cannot close ">
	<COND
		(<MC-T? .THING>
			<TELL THE .THING>
		)
		(T
			<TELL D ,TH-NOT-HERE-OBJECT>
		)
	>
	<TELL "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-NO-GOOD-SURFACE-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-NO-GOOD-SURFACE-MSG ("OPTIONAL" (THING <>))
	<COND
		(<MC-F? .THING>
			<SET THING ,GL-PRSI>
		)
	>
	<TELL "There is no good surface on " THE .THING "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-LANDS-AT-YOUR-FEET-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-LANDS-AT-YOUR-FEET-MSG ("OPTIONAL" (THING <>))
	<COND
		(<MC-F? .THING>
			<SET THING ,GL-PRSO>
		)
	>
	<TELL "land">
	<COND
		(<OR	<MC-ISNOT? .THING ,FL-PLURAL>
				<MC-IS? .THING ,FL-COLLECTIVE>
			>
			<TELL "s">
		)
	>
	<TELL " at your feet." CR>
	<MOVE .THING ,GL-PLACE-CUR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-OPEN-CLOSED-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-OPEN-CLOSED-MSG ("OPTIONAL" (THING <>))
	<COND
		(<MC-F? .THING>
			<SET THING ,GL-PRSO>
		)
	>
	<TELL CTHE .THING>
	<RT-IS-ARE-MSG .THING>
	<COND
		(<MC-IS? .THING ,FL-OPENED>
			<TELL "open">
		)
		(T
			<TELL "closed">
		)
	>
	<TELL ".">
	<RTRUE>
>


;-----------------------------------------------------------------------------
; "RT-YOU-OPEN-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-YOU-OPEN-MSG ("OPTIONAL" (THING <>))
	<COND
		(<MC-F? .THING>
			<SET THING ,GL-PRSO>
		)
	>
	<MC-MAKE .THING ,FL-OPENED>
	<RT-CYOU-MSG "open" "opens">
	<TELL THE .THING "." CR>
>

;-----------------------------------------------------------------------------
; "RT-YOU-CLOSE-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-YOU-CLOSE-MSG ("OPTIONAL" (THING <>))
	<COND
		(<MC-F? .THING>
			<SET THING ,GL-PRSO>
		)
	>
	<MC-UNMAKE .THING ,FL-OPENED>
	<RT-CYOU-MSG "close" "closes">
	<TELL THE .THING "." CR>
>

;-----------------------------------------------------------------------------
; "RT-IN-ON-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-IN-ON-MSG ("OPTIONAL" (THING <>) (SPACE? T))
	<COND
		(<MC-F? .THING>
			<SET THING ,GL-PRSO>
		)
	>
	<COND
		(<MC-T? .SPACE?>
			<TELL " ">
		)
	>
	<COND
		(<MC-IS? .THING ,FL-SURFACE>
			<TELL "on">
		)
		(<MC-IS? .THING ,FL-CONTAINER>
			<TELL "in">
		)
		(T
			<TELL "held by">
		)
	>
	<TELL " ">
>

;-----------------------------------------------------------------------------
; "RT-CIN-CON-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-CIN-CON-MSG ("OPTIONAL" (THING <>))
	<COND
		(<MC-F? .THING>
			<SET THING ,GL-PRSO>
		)
	>
	<COND
		(<MC-IS? .THING ,FL-SURFACE>
			<TELL "On ">
		)
		(<MC-IS? .THING ,FL-CONTAINER>
			<TELL "In ">
		)
		(T
			<TELL "Held by ">
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-OUT-OFF-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-OUT-OFF-MSG ("OPTIONAL" (THING <>))
	<COND
		(<MC-F? .THING>
			<SET THING ,GL-PRSO>
		)
	>
	<COND
		(<MC-IS? .THING ,FL-SURFACE>
			<TELL " off of ">
		)
		(<MC-IS? .THING ,FL-CONTAINER>
			<TELL " out of ">
		)
		(T
			<TELL " from ">
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-CANT-LOCK-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-CANT-LOCK-MSG ("OPTIONAL" (UN? <>) (THING <>))
	<COND
		(<MC-F? .THING>
			<SET THING ,GL-PRSO>
		)
	>
	<RT-CYOU-MSG>
	<TELL "cannot ">
	<COND
		(<MC-T? .UN?>
			<TELL "un">
		)
	>
	<TELL "lock " A .THING "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-THING-WONT-LOCK-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-THING-WONT-LOCK-MSG (THING CLOSED-THING "OPTIONAL" (UN? <>))
	<RT-CYOU-MSG>
	<TELL "cannot ">
	<COND
		(<MC-T? .UN?>
			<TELL "un">
		)
	>
	<TELL "lock " THE .CLOSED-THING " with " THE .THING "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-DONT-HAVE-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-DONT-HAVE-MSG (OBJ "AUX" L O)
	<SET L <LOC .OBJ>>
	<COND
		(<MC-F? .L>
			T
		)
		(<EQUAL? .L ,GL-WINNER>
			<RFALSE>
		)
		(<AND
			<IN? .L ,CH-PLAYER>
			<EQUAL? ,GL-WINNER ,CH-PLAYER>
			>
				<SET O ,GL-PRSO>
				<SETG GL-PRSO .OBJ>
				<COND
					(<RT-ITAKE <>>
						<TELL "[taking " THEO>
						<RT-OUT-OFF-MSG .L>
						<TELL THE .L " first]" CR>
						<SETG GL-PRSO .O>
						<RT-THIS-IS-IT ,GL-PRSO>
						<RFALSE>
					)
					(T
						<SETG GL-PRSO .O>
						<RT-CYOU-MSG>
						<RT-WOULD-HAVE-TO-MSG "take" .OBJ>
						<RT-OUT-OFF-MSG .L>
						<TELL THE .L " first." CR>
						<RTRUE>
					)
				>
		)
	>
	<RT-WINNER-NOT-HOLDING-MSG>
	<COND
		(<MC-T? .OBJ>
			<COND
;				(<AND <MC-IS? .OBJ ,FL-PLURAL>
						<MC-ISNOT? .OBJ ,FL-NOARTC>
					>
					<TELL "any " D .OBJ>
				)
				(T
					<TELL THE .OBJ>
				)
			>
		)
		(T
			<TELL THE ,TH-NOT-HERE-OBJECT>
		)
	>
	<TELL "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-ROOM-IN-ON-MSG?"
;-----------------------------------------------------------------------------

<ROUTINE RT-ROOM-IN-ON-MSG? (OBJ1 OBJ2)
	<COND
		(<RT-OBJ-TOO-LARGE? .OBJ1 .OBJ2>
			<TELL "There is not enough room">
			<RT-IN-ON-MSG .OBJ2>
			<TELL THE .OBJ2 "." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-IMPOSSIBLE-PUT-IN-ON-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-IMPOSSIBLE-PUT-IN-ON-MSG ("OPTIONAL" OBJ)
	<COND
		(<MC-F? .OBJ>
			<SET OBJ ,GL-PRSI>
		)
	>
	<COND
		(<AND <MC-VERB? PUT PUT-ON>
				<MC-PRSI? .OBJ>
			>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-CANT-PUT-IN-ON-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-CANT-PUT-IN-ON-MSG ("OPTIONAL" OBJ)
	<COND
		(<MC-F? .OBJ>
			<SET OBJ ,GL-PRSI>
		)
	>
	<COND
		(<AND <MC-VERB? PUT PUT-ON>
				<MC-PRSI? .OBJ>
			>
			<RT-CYOU-MSG>
			<TELL "cannot put " THEO " ">
			<COND
				(<MC-IS? ,GL-PRSO ,FL-CONTAINER>
					<TELL "in">
				)
				(<MC-IS? ,GL-PRSO ,FL-SURFACE>
					<TELL "on">
				)
				(<MC-VERB? PUT>
					<TELL "in">
				)
				(T
					<TELL "on">
				)
			>
			<TELL " " THEI "." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-CHECK-MOVE-MSG?"
;-----------------------------------------------------------------------------

<ROUTINE RT-CHECK-MOVE-MSG? (SRC DEST "AUX" PTR OLOC CNT)
	<COND
		(<MC-T? .DEST>
			<SET PTR ,GL-LOC-TRAIL>
			<SET OLOC .DEST>
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
					(<EQUAL? .OLOC .DEST>
						<RETURN>
					)
				>
			>
			<COND
				(<INTBL? .SRC ,GL-LOC-TRAIL .CNT>
					<RT-CYOU-MSG>
					<TELL "cannot put " THE .SRC>
               <RT-IN-ON-MSG .SRC>
               <TELL "itself, or">
					<RT-IN-ON-MSG .SRC>
					<TELL "something that is already">
					<RT-IN-ON-MSG .SRC>
					<TELL "it." CR>
					<RTRUE>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-EMPTY-PRSO-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-EMPTY-PRSO-MSG (DEST "AUX" OBJ NXT X)
	<SET OBJ <FIRST? ,GL-PRSO>>

	<COND
		(<MC-F? .OBJ>
			<TELL "There is nothing">
			<RT-IN-ON-MSG ,GL-PRSO>
			<TELL THEO "." CR>
			<RTRUE>
		)
	>

	<SETG GL-P-MULT? T>

	<REPEAT ()
		<COND
			(<MC-F? .OBJ>
				<RETURN>
			)
		>
		<TELL CTHE .OBJ ": ">
		<SET NXT <NEXT? .OBJ>>
		<COND
			(<EQUAL? .DEST ,CH-PLAYER>
				<SET X <RT-PERFORM ,V?TAKE .OBJ ,GL-PRSO>>
				<COND
					(<EQUAL? .X ,K-M-FATAL>
						<RETURN>
					)
				>
			)
			(<EQUAL? .DEST ,TH-GROUND ,TH-FLOOR>
				<COND
					(<AND <MC-IS? ,GL-PRSO ,FL-PLURAL>
							<MC-ISNOT? ,GL-PRSO ,FL-COLLECTIVE>
						>
						<TELL "They ">
					)
					(T
						<TELL "It ">
					)
				>
				<RT-LANDS-AT-YOUR-FEET-MSG>
			)
			(<RT-ROOM-IN-ON-MSG? .OBJ .DEST>
				T
			)
			(<RT-CHECK-MOVE-MSG? .OBJ .DEST>
				<RETURN>
			)
			(T
				<MOVE .OBJ .DEST>
				<TELL "Done." CR>
			)
		>
		<SET OBJ .NXT>
	>

	<SETG GL-P-MULT? <>>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-IDROP-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-IDROP-MSG ("AUX" L)
	<SET L <LOC ,GL-PRSO>>
	<COND
		(<OR	<MC-F? .L>
				<MC-PRSO? GL-WINNER CH-ME>
			>
			<RT-IMPOSSIBLE-MSG>
			<RFALSE>
		)
		(<NOT <EQUAL? .L ,GL-WINNER>>
			<RT-CYOU-MSG>
			<RT-WOULD-HAVE-TO-MSG "take" ,GL-PRSO>
			<RT-OUT-OFF-MSG .L>
			<TELL THE .L " first." CR>
			<RFALSE>
		)
		(<AND <MC-IS? ,GL-PRSO ,FL-WORN>
				<IN? ,GL-PRSO ,GL-WINNER>
			>
			<RT-TAKE-OFF-PRSO-FIRST-MSG>
		)
	>
	<MOVE ,GL-PRSO <LOC ,GL-WINNER>>
	<RTRUE>
>	

;-----------------------------------------------------------------------------
; "RT-PRINT-CONTENTS-1"
;-----------------------------------------------------------------------------

<ROUTINE RT-PRINT-CONTENTS-1 (THING "AUX" OBJ (CNT 0) TMP)
	<RT-MOVE-NODESC-OBJS .THING ,TH-Y-OBJECT>
	<SET OBJ <FIRST? .THING>>
	<REPEAT ()
		<COND
			(<MC-F? .OBJ>
				<RETURN>
			)
		>
		<MC-MAKE .OBJ ,FL-SEEN>
		<TELL "  " A .OBJ>
		<COND
			(<MC-IS? .OBJ ,FL-LIGHTED>
				<TELL " (providing light)">
			)
		>
		<TELL "." CR>
		<INC CNT>
		<SET OBJ <NEXT? .OBJ>>
	>
	<COND
		(<ZERO? .CNT>
			<TELL "  nothing." CR>
		)
	>
	<RT-MOVE-ALL ,TH-Y-OBJECT .THING>

	<SET OBJ <FIRST? .THING>>
	<REPEAT ()
		<COND
			(<MC-F? .OBJ>
				<RETURN>
			)
			(T
				<COND
					(<RT-SEE-INSIDE? .OBJ>
						<RT-PRINT-CONTENTS-3 .OBJ>
					)
				>
				<SET OBJ <NEXT? .OBJ>>
			)
		>
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-PRINT-CONTENTS-2"
;-----------------------------------------------------------------------------

<ROUTINE RT-PRINT-CONTENTS-2 (THING "AUX" OBJ (CNT 0))
	<RT-MOVE-NODESC-OBJS .THING ,TH-Y-OBJECT>
	<SET OBJ <FIRST? .THING>>
	<REPEAT ()
		<COND
			(<MC-F? .OBJ>
				<RETURN>
			)
		>
		<MC-MAKE .OBJ ,FL-SEEN>
		<TELL A .OBJ>
		<COND
			(<MC-IS? .OBJ ,FL-LIGHTED>
				<TELL " (providing light)">
			)
		>
		<INC CNT>
		<SET OBJ <NEXT? .OBJ>>
		<COND
			(<MC-T? .OBJ>
				<COND
					(<MC-F? <NEXT? .OBJ>>
						<TELL " and ">
					)
					(T
						<TELL ", ">
					)
				>
			)
		>
	>
	<COND
		(<ZERO? .CNT>
		 	<TELL "nothing">
		)
	>
	<RT-MOVE-ALL ,TH-Y-OBJECT .THING>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-PRINT-CONTENTS-3"
;-----------------------------------------------------------------------------

<ROUTINE RT-PRINT-CONTENTS-3 (THING "AUX" OBJ (FIRST T) (CNT 0))
	<SET OBJ <FIRST? .THING>>
	<REPEAT ()
		<COND
			(<MC-F? .OBJ>
				<RETURN>
			)
			(<MC-ISNOT? .OBJ ,FL-NODESC>
				<COND
					(<MC-T? .FIRST>
						<SET FIRST <>>
						<RT-CIN-CON-MSG <LOC .OBJ>>
						<TELL THE <LOC .OBJ> " you see:" CR>
					)
				>
				<TELL "  " A .OBJ CR>
			)
		>
		<SET OBJ <NEXT? .OBJ>>
	>

	<SET OBJ <FIRST? .THING>>
	<REPEAT ()
		<COND
			(<MC-F? .OBJ>
				<RETURN>
			)
			(T
				<COND
					(<RT-SEE-INSIDE? .OBJ>
						<RT-PRINT-CONTENTS-3 .OBJ>
					)
				>
				<SET OBJ <NEXT? .OBJ>>
			)
		>
	>
>

;-----------------------------------------------------------------------------
; "RT-DO-WALK"
;-----------------------------------------------------------------------------

<ROUTINE RT-DO-WALK (DIR1 "OPTIONAL" (DIR2 <>) (DIR3 <>) "AUX" X)
	<SETG GL-P-WALK-DIR .DIR1>
	<SET X <RT-PERFORM ,V?WALK .DIR1>>
	<COND
		(<AND <MC-T? .DIR2>
				<NOT <EQUAL? .X <> ,K-M-FATAL>>
			>
			<SETG GL-P-WALK-DIR .DIR2>
			<SET X <RT-PERFORM ,V?WALK .DIR2>>
			<COND
				(<AND <MC-T? .DIR3>
						<NOT <EQUAL? .X <> ,K-M-FATAL>>
					>
					<SETG GL-P-WALK-DIR .DIR3>
					<SET X <RT-PERFORM ,V?WALK .DIR3>>
				)
			>
		)
	>
	<RETURN .X>
>

;-----------------------------------------------------------------------------
; "RT-WHO-SAYS?"
;-----------------------------------------------------------------------------

<ROUTINE RT-WHO-SAYS? ()
	<COND
		(<AND <MC-HERE? <RT-META-LOC ,CH-HOLMES>>
				<MC-ISNOT? ,CH-HOLMES ,FL-ASLEEP>
				<MC-ISNOT? ,CH-HOLMES ,FL-LOCKED>
			>
			<RETURN ,CH-HOLMES>
		)
		(<AND <MC-HERE? <RT-META-LOC ,CH-WIGGINS>>
				<MC-ISNOT? ,CH-WIGGINS ,FL-ASLEEP>
				<MC-ISNOT? ,CH-WIGGINS ,FL-LOCKED>
			>
			<RETURN ,CH-WIGGINS>
		)
		(T
			<RFALSE>
		)
	>
>

;*****************************************************************************
; "game-control-verb support globals"
;*****************************************************************************

;*****************************************************************************
; "game-control-verb support routines"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-TRANSCRIPT"
;-----------------------------------------------------------------------------

<ROUTINE RT-TRANSCRIPT (STR)
	<DIROUT ,K-D-SCR-OFF>
	<TELL CR "Transcript: " .STR CR>
	<RT-VERSION-MSG>
	<DIROUT ,K-D-SCR-ON>
>

;-----------------------------------------------------------------------------
; "RT-QSR"
;-----------------------------------------------------------------------------

<ROUTINE RT-QSR ("AUX" KEY)
	<TELL "The game is no longer afoot." CR CR>

	<REPEAT ()
		<TELL "Do you wish to: (1) Quit, (2) Restart, (3) Restore">
		<COND
			(<MC-T? ,GL-CAN-UNDO>
				<TELL ", (4) Undo">
			)
		>
		<TELL " ?" CR>
		<SET KEY <INPUT 1>>
		<COND
			(<EQUAL? .KEY 49>
				<QUIT>
				<TELL "Quit failed." CR>
			)
			(<EQUAL? .KEY 50>
				<RESTART>
				<TELL "Restart failed." CR>
			)
			(<EQUAL? .KEY 51>

				<COND
					(<MC-T? ,GL-DEBUG-FLAG>
						<V-REFRESH>
					)
				>

				<RT-P-CLEAR>
				<PUTB ,GL-OOPS-INBUF 1 0>

				<RESTORE>
				<TELL "Restore failed." CR>
			)
			(<AND <EQUAL? .KEY 52>
					<MC-T? ,GL-CAN-UNDO>
				>
				<V-UNDO>
			)
		>	
	>
>

;*****************************************************************************
; "game control verbs"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "V-YES"
;-----------------------------------------------------------------------------

<ROUTINE V-YES ()
	<TELL ,K-GOOD-SHOW-MSG CR>
	<MC-RFATAL>
> 

;-----------------------------------------------------------------------------
; "V-NO"
;-----------------------------------------------------------------------------

<ROUTINE V-NO ()
	<TELL ,K-PITY-MSG CR>
	<MC-RFATAL>
> 

;-----------------------------------------------------------------------------
; "V-DESC-LEVEL"
;-----------------------------------------------------------------------------

<ROUTINE V-DESC-LEVEL ()
	<COND
		(<RT-IS-CHAR-NOT-PLAYER?>
			<MC-RFATAL>
		)
	>
	<TELL "[">
	<COND
		(<MC-VERB-WORD? VERBOSE>
			<SETG GL-DESC-LEVEL 2>
			<TELL "Verbose">
		)
		(<MC-VERB-WORD? BRIEF>
			<SETG GL-DESC-LEVEL 1>
			<TELL "Brief">
		)
		(<MC-VERB-WORD? SUPER SUPERBRIEF>
			<SETG GL-DESC-LEVEL 0>
			<TELL "Super brief">
		)
	>
	<TELL " descriptions]" CR>
	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "V-QUIT"
;-----------------------------------------------------------------------------

<ROUTINE V-QUIT ()
	<COND
		(<RT-IS-CHAR-NOT-PLAYER?>
			<MC-RFATAL>
		)
	>
	<TELL "[Your score is " N ,GL-SCORE-CUR " out of " N ,GL-SCORE-MAX ", which
earns you a ranking of " <RT-RANK-STR ,GL-SCORE-CUR> ".]" CR CR
	>
	<TELL "Are you sure you want to quit?">
	<COND
		(<RT-GET-YES-NO?>
			<QUIT>
			<TELL "Quit failed." CR>
			<MC-RFATAL>
		)
		(T
			<TELL CR "Continuing." CR>
			<MC-RFATAL>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-RESTART"
;-----------------------------------------------------------------------------
		      
<ROUTINE V-RESTART ()
	<COND
		(<RT-IS-CHAR-NOT-PLAYER?>
			<MC-RFATAL>
		)
	>
	<TELL "Are you sure you want to restart?">
	<COND
		(<RT-GET-YES-NO?>
			<RESTART>
			<TELL "Restart failed." CR>
			<MC-RFATAL>
		)
		(T
			<TELL CR "Continuing." CR>
			<MC-RFATAL>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-SAVE"
;-----------------------------------------------------------------------------

<ROUTINE V-SAVE ("AUX" X WHO)
	<COND
		(<RT-IS-CHAR-NOT-PLAYER?>
			<MC-RFATAL>
		)
	>

	<SET WHO <RT-WHO-SAYS?>>
	<COND
		(<EQUAL? .WHO ,CH-HOLMES>
			<TELL
CTHE ,CH-HOLMES " nods in approval and says, \"A wise move, Watson. These are
dangerous times.\"" CR CR
			>
		)
		(<EQUAL? .WHO ,CH-WIGGINS>
			<TELL
CTHE ,CH-WIGGINS " glances around in alarm and says, \"Do you know somefing I
don't know?\"" CR CR
			>
		)
	>
		
	<COND
		(<MC-T? ,GL-DEBUG-FLAG>
			<V-REFRESH>
		)
	>

	<SETG GL-SCORE-STS  -1>
	<SETG GL-MOVES-STS  -1>
   <SETG GL-PLACE-STS  -1>

	<RT-P-CLEAR>
	<PUTB ,GL-OOPS-INBUF 1 0>

	<SET X <SAVE>>
	<COND
		(<OR	<EQUAL? .X 2>
				<BTST <LOWCORE FLAGS> 4>
			>
			<LOWCORE FLAGS <BAND <LOWCORE FLAGS> -5>>

			<RT-INIT-SCREEN>
			<RT-UPDATE-STATUS-LINE>
		)
	>
	<COND
		(<ZERO? .X>
			<TELL "Save failed." CR>
			<MC-RFATAL>
		)
		(<EQUAL? .X 1>
			<TELL "Save completed." CR>
			<MC-RFATAL>
		)
		(T
			<TELL "Restore completed." CR CR>

			<SET WHO <RT-WHO-SAYS?>>
			<COND
				(<EQUAL? .WHO ,CH-HOLMES>
					<TELL
CTHE ,CH-HOLMES " looks up and says impatiently, \"Where have you been,
Watson? We have work to do.\"" CR CR
					>
				)
				(<EQUAL? .WHO ,CH-WIGGINS>
					<TELL
CTHE ,CH-WIGGINS " jumps nervously and then says, \"Crikey! You scared me.
Don't sneak up on people that way.\"" CR CR
					>
				)
			>

			<RT-DESC-ALL <> T>

			<MC-RFATAL>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-RESTORE"
;-----------------------------------------------------------------------------

<ROUTINE V-RESTORE ()
	<COND
		(<RT-IS-CHAR-NOT-PLAYER?>
			<MC-RFATAL>
		)
	>

	<COND
		(<MC-T? ,GL-DEBUG-FLAG>
			<V-REFRESH>
		)
	>

	<RT-P-CLEAR>
	<PUTB ,GL-OOPS-INBUF 1 0>

	<RESTORE>
	<TELL "Restore failed." CR>
	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "V-SCRIPT"
;-----------------------------------------------------------------------------

<ROUTINE V-SCRIPT ()
	<COND
		(<RT-IS-CHAR-NOT-PLAYER?>
			<MC-RFATAL>
		)
	>
	<TELL "[Scripting ">
	<COND
		(<MC-VERB-WORD? SCRIPT>
			<TELL "on">
		)
		(T
			<TELL "off">
		)
	>
	<TELL "]" CR>
	<COND
		(<MC-VERB-WORD? SCRIPT>
			<DIROUT ,K-D-PRN-ON>
			<RT-TRANSCRIPT "ON">
		)
		(T
			<RT-TRANSCRIPT "OFF">
			<DIROUT ,K-D-PRN-OFF>
		)
	>
	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "V-VERSION"
;-----------------------------------------------------------------------------

<ROUTINE V-VERSION ()
	<COND
		(<RT-IS-CHAR-NOT-PLAYER?>
			<MC-RFATAL>
		)
	>
	<RT-VERSION-MSG>
	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "V-INVENTORY"
;-----------------------------------------------------------------------------

<ROUTINE V-INVENTORY ("AUX" (POCKET <>) PLOC OBJ NXT OLDIT)
	<COND
		(<RT-IS-CHAR-NOT-PLAYER?>
			<MC-RFATAL>
		)
	>

; "get and save current 'it' object"

	<SET OLDIT ,GL-P-IT-OBJECT>

; "get and save pointer to first object in pocket and then remove pocket"

	<SET PLOC <LOC ,TH-POCKET>>
	<SET POCKET <FIRST? ,TH-POCKET>>
	<REMOVE ,TH-POCKET>
 
; "save all objects being worn in the TH-X-OBJECT object"

	<SET OBJ <FIRST? ,CH-PLAYER>>
	<REPEAT ()
		<COND
			(<MC-F? .OBJ>
				<RETURN>
			)
			(T
				<SET NXT <NEXT? .OBJ>>
				<COND
					(<MC-IS? .OBJ ,FL-WORN>
						<MOVE .OBJ ,TH-X-OBJECT>
					)
				>
				<SET OBJ .NXT>
			)
		>
	>

; "describe what player is wearing"

	<COND
		(<FIRST? ,TH-X-OBJECT>
			<TELL "You are wearing:" CR>
			<RT-PRINT-CONTENTS-1 ,TH-X-OBJECT>
		)
	>

; "describe what is in pocket"

	<COND
		(<MC-IS? ,TH-WATSONS-COAT ,FL-WORN>
			<TELL "Your pocket contains:" CR>
			<RT-PRINT-CONTENTS-1 ,TH-POCKET>
		)
	>

; "describe what player is holding"	

	<TELL "You are holding:" CR>
	<RT-PRINT-CONTENTS-1 ,CH-PLAYER>

; "describe any objects in/on any container/surface objects the player has"

;	<SET OBJ <FIRST? ,CH-PLAYER>>
;	<REPEAT ()
		<COND
			(<MC-F? .OBJ>
				<RETURN>
			)
			(T
				<COND
					(<AND	<RT-SEE-INSIDE? .OBJ>
							<RT-SEE-ANYTHING-IN? .OBJ>
						>
						<RT-CIN-CON-MSG .OBJ>
						<TELL THE .OBJ " you see:" CR>
						<RT-PRINT-CONTENTS-1 .OBJ>
					)
				>
				<SET OBJ <NEXT? .OBJ>>
			)
		>
	>
	
; "move all worn objects saved in the TH-X-OBJECT object back to player"

	<RT-MOVE-ALL ,TH-X-OBJECT ,CH-PLAYER>

; "move the pocket object back to it's original location"

	<MOVE ,TH-POCKET .PLOC>

; "restore the previous 'it' object"

	<SETG GL-P-IT-OBJECT .OLDIT>

; "return fatal"

	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "V-NOTIFY"
;-----------------------------------------------------------------------------

<ROUTINE V-NOTIFY ()
	<COND
		(<RT-IS-CHAR-NOT-PLAYER?>
			<MC-RFATAL>
		)
	>
	<SETG GL-SCORE-MSG <NOT ,GL-SCORE-MSG>>
	<TELL "[Score Notification ">
	<COND
		(,GL-SCORE-MSG
			<TELL "Enabled">
		)
		(T
			<TELL "Disabled">
		)
	>
	<TELL "]" CR>
	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "V-SCORE"
;-----------------------------------------------------------------------------

<ROUTINE V-SCORE ()
	<COND
		(<RT-IS-CHAR-NOT-PLAYER?>
			<MC-RFATAL>
		)
	>
	<TELL
"[You have " N ,GL-SCORE-CUR " out of " N ,GL-SCORE-MAX " points, which earns
you a ranking of " <RT-RANK-STR ,GL-SCORE-CUR> ".]" CR
	>
	<MC-RFATAL>
>

<CONSTANT K-GOOD-SHOW-MSG
"\"Good show!\""
>

<CONSTANT K-PITY-MSG
"\"Pity.\""
>

;-----------------------------------------------------------------------------
; "V-UNDO"
;-----------------------------------------------------------------------------

<ROUTINE V-UNDO ()
	<SETG GL-PLACE-STS 0>
	<COND
		(<ZERO? <IRESTORE>>
			<TELL "[UNDO failed.]" CR>
		)
		(T
			<TELL "[UNDO is not available.]" CR>
		)
	>
>

;*****************************************************************************
; "end of file"
;*****************************************************************************

