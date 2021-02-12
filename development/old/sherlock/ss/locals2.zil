;*****************************************************************************
; "game : SHERLOCK!"
; "file : LOCALS2.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   28 Oct 1987 16:51:56  $"
; "rev  : $Revision:   1.58  $"
; "vers : 1.00"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "this file contains:"
; "  action routines for all local globals"
;-----------------------------------------------------------------------------

;-----------------------------------------------------------------------------
; "RT-AC-LG-BAKER-ST-DOOR"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-BAKER-ST-DOOR ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-AC "LG-BAKER-ST-DOOR">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? KNOCK>
			<COND
				(<MC-HERE? ,RM-ENTRY-HALL>
					<TELL "You are already inside." CR>
				)
				(<MC-IS? ,LG-BAKER-ST-DOOR ,FL-OPENED>
					<TELL "The door is already open." CR>
				)
				(<MC-ISNOT? ,LG-BAKER-ST-DOOR ,FL-LOCKED>
					<MC-MAKE ,LG-BAKER-ST-DOOR ,FL-OPENED>
					<MOVE ,CH-HUDSON ,RM-ENTRY-HALL>
					<RT-THIS-IS-IT ,CH-HUDSON>
					<TELL
"Mrs Hudson appears and says, \"Please come in Dr. Watson.\" She
steps back into the hall to allow room for you to pass." CR
					>
				)
				(T
					<MC-UNMAKE ,LG-BAKER-ST-DOOR ,FL-LOCKED>
					<MOVE ,CH-HUDSON ,RM-ENTRY-HALL>
					<MOVE ,CH-PLAYER ,RM-ENTRY-HALL>
					<RT-THIS-IS-IT ,CH-HUDSON>
					<TELL
"You hear a bolt sliding back and the door opens to reveal a worried
Mrs. Hudson." CR CR

"\"Oh Doctor Watson, I'm so glad to see you. It's Mr.
Holmes, sir. Three days have come and gone since he's been out of his
rooms. He won't eat and I know he hasn't slept. Now there's a visitor
who says he's here about some important government business. I tried
to send him away, but he insisted on waiting in the parlour. That's
when I sent for you. Thank God you've come.\"" CR
					>
					<RT-EXEC-RM-DESCFCN ,RM-ENTRY-HALL 1>
					<CRLF>
				)
			>
		)
		(<MC-VERB? KICK>
			<COND
				(<MC-HERE? ,RM-ENTRY-HALL>
					<RFALSE>
				)
				(<MC-ISNOT? ,LG-BAKER-ST-DOOR ,FL-OPENED>
					<TELL
"Mrs Hudson pokes her head out the door and says, \"I'm not opening the door
until you knock like a proper gentleman.\" She slams the door in your
face." CR
					>
				)
			>
		)
		(<MC-VERB? ENTER THROUGH>
			<COND
				(<MC-HERE? ,RM-221B-BAKER-ST>
					<RT-DO-WALK ,P?WEST>
				)
				(<MC-HERE? ,RM-ENTRY-HALL>
					<RT-DO-WALK ,P?EAST>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-PARLOUR-DOOR"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-PARLOUR-DOOR ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-AC "LG-PARLOUR-DOOR">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? OPEN>
			<COND
				(<MC-IS? ,CH-HOLMES ,FL-ASLEEP>
					<TELL
CTHE ,CH-HUDSON ,K-HUDSON-WORRIED-MSG CR
					>
				)
			>
		)
		(<MC-VERB? ENTER THROUGH>
			<COND
				(<MC-HERE? ,RM-PARLOUR>
					<RT-DO-WALK ,P?SOUTH>
				)
				(<MC-HERE? ,RM-ENTRY-HALL>
					<RT-DO-WALK ,P?NORTH>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-HOLMES-STUDY-DOOR"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-HOLMES-STUDY-DOOR ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-AC "LG-HOLMES-STUDY-DOOR">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER THROUGH>
			<COND
				(<MC-HERE? ,RM-VESTIBULE>
					<RT-DO-WALK ,P?NORTH>
				)
				(<MC-HERE? ,RM-HOLMES-STUDY>
					<RT-DO-WALK ,P?SOUTH>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-HOLMES-BEDROOM-DOOR"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-HOLMES-BEDROOM-DOOR ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-AC "LG-HOLMES-BEDROOM-DOOR">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER THROUGH>
			<COND
				(<MC-HERE? ,RM-HOLMES-STUDY>
					<RT-DO-WALK ,P?WEST>
				)
				(<MC-HERE? ,RM-HOLMES-BEDROOM>
					<RT-DO-WALK ,P?EAST>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-BANK-VAULT-DOOR"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-LG-BANK-VAULT-DOOR ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-AC "LG-BANK-VAULT-DOOR">
		)
		(T
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-PORTCULLIS-DOOR"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-LG-PORTCULLIS-DOOR ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-AC "LG-PORTCULLIS-DOOR">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-BAR-OF-GOLD-DOOR"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-BAR-OF-GOLD-DOOR ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-AC "LG-BAR-OF-GOLD-DOOR">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER THROUGH>
			<COND
				(<MC-HERE? ,RM-BAR-OF-GOLD>
					<RT-DO-WALK ,P?EAST>
				)
				(<MC-HERE? ,RM-SWAN-LANE>
					<RT-DO-WALK ,P?WEST>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-LAIR-DOOR"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-LAIR-DOOR ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-AC "LG-LAIR-DOOR">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<COND
				(<AND <MC-VERB? ENTER THROUGH OPEN CLOSE UNLOCK LOCK>
						<MC-ISNOT? ,CH-AKBAR ,FL-LOCKED>
						<MC-ISNOT? ,CH-AKBAR ,FL-ASLEEP>
					>
					<TELL "Akbar">
					<COND
						(<MC-IS? ,TH-WATSONS-HAT ,FL-WORN>
							<TELL " says, \"Forgive me, sir,\" and">
						)
					>
					<TELL " stops you as you move toward the door." CR>
				)
				(<AND <MC-VERB? OPEN>
						<MC-IS? ,CH-HOLMES ,FL-LOCKED>
					>
					<TELL
"Holmes calls out, \"Watson! I'm still tied up!\" You pause and look back,
torn by indecision." CR
					>
				)
				(<MC-VERB? ENTER THROUGH>
					<COND
						(<MC-HERE? ,RM-LAIR>
							<RT-DO-WALK ,P?OUT>
						)
					>
				)
				(<AND <MC-VERB? UNLOCK>
						<MC-PRSI? TH-LAIR-KEY>
						<MC-IS? ,LG-LAIR-DOOR ,FL-LOCKED>
					>
					<MC-UNMAKE ,LG-LAIR-DOOR ,FL-LOCKED>
					<RT-CYOU-MSG "unlock" "unlocks">
					<TELL THE ,LG-LAIR-DOOR "." CR>
				)
				(<AND <MC-VERB? LOCK>
						<MC-PRSI? TH-LAIR-KEY>
						<MC-ISNOT? ,LG-LAIR-DOOR ,FL-OPENED>
						<MC-ISNOT? ,LG-LAIR-DOOR ,FL-LOCKED>
					>
					<MC-MAKE ,LG-LAIR-DOOR ,FL-LOCKED>
					<RT-CYOU-MSG "lock" "locks">
					<TELL THE ,LG-LAIR-DOOR "." CR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-JERICHO-PARLOUR-DOOR"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-JERICHO-PARLOUR-DOOR ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-AC "LG-JERICHO-PARLOUR-DOOR">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER THROUGH>
			<COND
				(<MC-HERE? ,RM-SOUTH-AISLE>
					<RT-DO-WALK ,P?SOUTH>
				)
				(<MC-HERE? ,RM-JERICHO-PARLOUR>
					<RT-DO-WALK ,P?NORTH>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-SHOPS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-SHOPS ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-AC "LG-SHOPS">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? LOOK-INSIDE SEARCH>
			<TELL "The shops are all closed for the Jubilee." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-CROWDS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-CROWDS ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-AC "LG-CROWDS">
		)
		(T
		)
	>
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 0>
			<TELL "There are no tourists here. They're all asleep." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-WATER"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-WATER ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-WATER">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? ENTER LEAP>
					<COND
						(<EQUAL? ,GL-WINNER ,CH-PLAYER>
							<TELL "You may not remember this, but you can't swim." CR>
						)
						(T
							<TELL "That's not very polite." CR>
						)
					>
				)
				(<MC-VERB? DRINK>
					<TELL ,K-YUCK-MSG CR>
				)
				(<MC-VERB? EXAMINE>
					<TELL "The water is black, oily, slimy, dirty, and otherwise
unwholesome-looking." CR>
				)
			 	(<MC-VERB? LOOK-INSIDE SEARCH>
			 		<TELL
"The water is so black and oily that you can't see a thing." CR
			 		>
				)
				(<MC-VERB? REACH-IN SEARCH>
					<TELL
"Slimy things brush up against your hand, and you quickly pull it back." CR
					>
				)
				(<MC-VERB? SHOOT>
					<RT-WASTE-OF-BULLETS-MSG>
				)
			>
		)
		(<MC-THIS-PRSI?>
			<COND
				(<MC-VERB? PUT PUT-ON>
					<COND
						(<MC-IS? ,GL-PRSO ,FL-BODYPART>
							<TELL ,K-YUCK-MSG CR>
						)
						(T
							<COND
								(<MC-PRSO? ,TH-ANCHOR>
									<MOVE ,TH-ANCHOR ,LG-WATER>
								)
								(T
									<REMOVE ,GL-PRSO>
									<COND
										(<MC-PRSO? ,CH-TRAINED-PIGEON>
											<RT-KILL-PIGEON>
										)
									>
								)
							>
							<TELL "Plop." CR>
						)
					>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-UPSTREAM"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-UPSTREAM ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-AC "LG-UPSTREAM">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-DOWNSTREAM"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-DOWNSTREAM ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-AC "LG-DOWNSTREAM">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-BRITISH-MUSEUM-DOOR"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-BRITISH-MUSEUM-DOOR ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-AC "LG-BRITISH-MUSEUM-DOOR">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER THROUGH>
			<COND
				(<MC-HERE? ,RM-GREAT-RUSSELL-ST>
					<RT-DO-WALK ,P?NORTH>
				)
				(<MC-HERE? ,RM-BRITISH-MUSEUM>
					<RT-DO-WALK ,P?SOUTH>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-WESTMINSTER-DOOR"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-WESTMINSTER-DOOR ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-AC "LG-WESTMINSTER-DOOR">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER THROUGH>
			<COND
				(<MC-HERE? ,RM-BROAD-SANCTUARY>
					<RT-DO-WALK ,P?EAST>
				)
				(<MC-HERE? ,RM-NAVE>
					<RT-DO-WALK ,P?WEST>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-PLAQUES"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-PLAQUES ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-AC "LG-PLAQUES">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? TAKE>
			<TELL
"The plaque is firmly attached to the wall. You can't remove it." CR
			>
		)
		(<MC-VERB? READ EXAMINE>
			<COND
				(<EQUAL? ,GL-PLACE-CUR ,RM-BROAD-SANCTUARY>
					<SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-ABBEY>>
				)
				(<EQUAL? ,GL-PLACE-CUR ,RM-MANUSCRIPT-ROOM>
					<SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-QUIET>>
				)
				(<EQUAL? ,GL-PLACE-CUR ,RM-MADAME-TUSSAUDS>
					<SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-HORRORS>>
				)
				(<EQUAL? ,GL-PLACE-CUR ,RM-GREAT-RUSSELL-ST>
					<SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-MUSEUM>>
				)
				(<EQUAL? ,GL-PLACE-CUR ,RM-MONUMENT>
					<SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-MONUMENT>>
				)
				(<EQUAL? ,GL-PLACE-CUR ,RM-THE-BLACK-MUSEUM>
					<SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-BLIGH>>
				)
				(<EQUAL? ,GL-PLACE-CUR ,RM-THREADNEEDLE-ST>
					<SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-BANK>>
				)
				(<EQUAL? ,GL-PLACE-CUR ,RM-TOWER-ENTRANCE>
					<SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-TOWER>>
				)
				(<EQUAL? ,GL-PLACE-CUR ,RM-TRAFALGAR-SQUARE>
					<SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-NELSON>>
				)
				(<EQUAL? ,GL-PLACE-CUR ,RM-VICTORIA-STREET>
					<SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-LOITER>>
				)
				(<EQUAL? ,GL-PLACE-CUR ,RM-SWAN-LANE>
					<SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-GOLDBAR>>
				)
				(<EQUAL? ,GL-PLACE-CUR ,RM-JERUSALEM-CHAMBER>
					<SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-HENRY>>
				)
				(<EQUAL? ,GL-PLACE-CUR ,RM-BLIND-ALLEY>
					<SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-HERRING>>
				)
				(T
					<SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-BLANK>>
				)
			>
			<RT-WINDOW ,GL-WINDOW>
			<SETG GL-WINDOW <>>
			<RTRUE>
		)
		(<AND <MC-VERB? PUT PUT-ON>
				<MC-THIS-PRSI?>
			>
			<TELL "Putting anything on " THE ,LG-PLAQUES " would">
			<RT-WASTE-OF-TIME-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-WINDOW"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-WINDOW ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-AC "LG-WINDOW">
		)
		(T
		)
	>
	<COND
		(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
			<TELL CTHE ,LG-WINDOW " is too high." CR>
		)
		(<AND <MC-VERB? SHOOT>
				<MC-THIS-PRSO?>
			>
			<RT-WASTE-OF-BULLETS-MSG>			
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-TOMBS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-TOMBS ()
	<COND
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? SHOOT>
					<RT-SHOOT-DEAD-MSG>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-HOLMES-STUDY-WINDOW"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-HOLMES-STUDY-WINDOW ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-AC "LG-HOLMES-STUDY-WINDOW">
		)
		(T
		)
	>
	<COND
		(<AND <MC-VERB? SHOOT>
				<MC-THIS-PRSO?>
			>
			<RT-WASTE-OF-BULLETS-MSG>
		)
		(<IN? ,GL-WINNER ,RM-221B-BAKER-ST>
			<COND
				(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
					<TELL CTHE ,LG-HOLMES-STUDY-WINDOW " is too high." CR>
				)
				(<MC-VERB? LOOK-INSIDE SEARCH>
					<TELL
CTHE ,LG-HOLMES-STUDY-WINDOW " is too high to see in." CR
					>
				)
			>
		)
		(<IN? ,GL-WINNER ,RM-HOLMES-STUDY>
			<COND
				(<MC-VERB? LOOK-INSIDE LOOK-OUTSIDE SEARCH>
					<TELL "You look down into Baker Street." CR>
					<RT-DESCRIBE-PLACE-CONTENTS ,RM-221B-BAKER-ST>
				)
				(<MC-VERB? MUNG>
					<TELL CTHE ,LG-HOLMES-STUDY-WINDOW " is made of reinforced glass. It
can't be broken." CR
					>
				)
				(<MC-VERB? OPEN>
					<TELL CTHE ,LG-HOLMES-STUDY-WINDOW " is jammed shut. It can't
be opened." CR
					>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-STREETLIGHT"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-STREETLIGHT ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-AC "LG-STREETLIGHT">
		)
		(T
		)
	>
	<COND
		(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
			<TELL CTHE ,LG-STREETLIGHT " is too high." CR>
		)
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? SHOOT>
					<RT-WASTE-OF-BULLETS-MSG>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-STAIRWAY"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-STAIRWAY ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-AC "LG-STAIRWAY">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? CLIMB-UP>
			<RT-DO-WALK ,P?UP>
		)
		(<MC-VERB? CLIMB-DOWN>
			<RT-DO-WALK ,P?DOWN>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-SHAFT-OF-LIGHT"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-SHAFT-OF-LIGHT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-SHAFT-OF-LIGHT">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? SHOOT>
					<RT-WASTE-OF-BULLETS-MSG>
				)
			>
		)
		(<MC-THIS-PRSI?>
			<COND
				(<MC-VERB? PUT>
					<COND
						(<MC-PRSO? ,TH-MAGNIFYING-GLASS>
							<COND
								(<EQUAL? <RT-WHO-SAYS?> ,CH-HOLMES>
									<TELL
"\"Your Afghan experience is showing, Watson. The hot sun there would surely
produce rays capable, when focused, of producing a flame. Alas, our English
sun is too weak to produce such an effect.\""
									>
								)
								(T
									<TELL
"The rays from England's sun are too weak to focus."
									>
								)
							>
							<CRLF>
						)
						(<MC-PRSO?
								,TH-GREEN-PAPER
								,TH-WHITE-PAPER
								,TH-BLUE-PAPER
								,TH-ORANGE-PAPER
								,TH-YELLOW-PAPER
								,TH-BROWN-PAPER
							>
							<RFALSE>
						)
						(T
							<TELL "Putting " THEO " in " THEI>
							<RT-WASTE-OF-TIME-MSG>
						)
					>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-RAVENS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-RAVENS ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "LG-RAVENS" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<MC-THIS-WINNER?>
			<TELL CTHE ,LG-RAVENS " caw raucously in response." CR>
		)
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? TAKE>
					<TELL CTHE ,LG-RAVENS " fly out of reach." CR>
				)
				(<MC-VERB? SHOOT>
					<RT-SHOOT-BIRDS ,LG-RAVENS "staring at you">
					<RTRUE>
				)
				(<MC-VERB? LISTEN>
					<TELL "None of the ravens is quothing \"Nevermore.\"" CR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-NORTH-WALL"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-NORTH-WALL ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-AC "LG-NORTH-WALL">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? EXAMINE LOOK-ON>
			<COND
				(<MC-HERE? ,RM-GREAT-RUSSELL-ST ,RM-THREADNEEDLE-ST ,RM-MONUMENT>
					<TELL ,K-SIGN-HERE-MSG>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-EAST-WALL"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-EAST-WALL ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-AC "LG-EAST-WALL">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? EXAMINE LOOK-ON>
			<COND
				(<MC-HERE? ,RM-BROAD-SANCTUARY ,RM-BLIND-ALLEY>
					<TELL ,K-SIGN-HERE-MSG>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-WEST-WALL"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-WEST-WALL ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-AC "LG-WEST-WALL">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? EXAMINE LOOK-ON>
			<COND
				(<MC-HERE? ,RM-SWAN-LANE>
					<TELL ,K-SIGN-HERE-MSG>
				)
			>
		)
	>
>

;*****************************************************************************
; "ROOM LOCAL GLOBALS"
;*****************************************************************************




;-----------------------------------------------------------------------------
; "RT-AC-LG-BAKER-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-BAKER-ST ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-BAKER-ST">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-221B-BAKER-ST>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-ENTRY-HALL>
					<RT-DO-WALK ,P?EAST>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-221B-BAKER-ST>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-ENTRY-HALL"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-ENTRY-HALL ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-ENTRY-HALL">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-ENTRY-HALL>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-221B-BAKER-ST>
					<RT-DO-WALK ,P?WEST>
				)
				(<MC-HERE? ,RM-PARLOUR>
					<RT-DO-WALK ,P?SOUTH>
				)
				(<MC-HERE? ,RM-VESTIBULE>
					<RT-DO-WALK ,P?DOWN>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-ENTRY-HALL>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-PARLOUR"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-PARLOUR ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-PARLOUR">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-PARLOUR>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-ENTRY-HALL>
					<RT-DO-WALK ,P?NORTH>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-PARLOUR>
					<RT-DO-WALK ,P?SOUTH>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-VESTIBULE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-VESTIBULE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-VESTIBULE">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-VESTIBULE>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-HOLMES-STUDY>
					<RT-DO-WALK ,P?SOUTH>
				)
				(<MC-HERE? ,RM-ENTRY-HALL>
					<RT-DO-WALK ,P?UP>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-VESTIBULE>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-STUDY"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-STUDY ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-STUDY">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-HOLMES-STUDY>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-VESTIBULE>
					<RT-DO-WALK ,P?NORTH>
				)
				(<MC-HERE? ,RM-HOLMES-BEDROOM>
					<RT-DO-WALK ,P?EAST>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-HOLMES-STUDY>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-BEDROOM"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-BEDROOM ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-BEDROOM">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-HOLMES-BEDROOM>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-HOLMES-STUDY>
					<RT-DO-WALK ,P?WEST>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-HOLMES-BEDROOM>
					<RT-DO-WALK ,P?EAST>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-YORK-PLACE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-YORK-PLACE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-YORK-PLACE">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-YORK-PLACE>
					<RT-ALREADY-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-YORK-PLACE>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-MARYLEBONE-RD"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-MARYLEBONE-RD ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-MARYLEBONE-RD">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-MARYLEBONE-RD>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-MADAME-TUSSAUDS>
					<RT-DO-WALK ,P?SOUTH>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-MARYLEBONE-RD>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-TUSSAUDS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-TUSSAUDS ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-TUSSAUDS">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-MADAME-TUSSAUDS>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-MARYLEBONE-RD>
					<RT-DO-WALK ,P?NORTH>
				)
				(<MC-HERE? ,RM-CHAMBER-OF-HORRORS>
					<RT-DO-WALK ,P?EAST>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-MADAME-TUSSAUDS>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-CHAMBER-OF-HORRORS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-CHAMBER-OF-HORRORS ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-CHAMBER-OF-HORRORS">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-CHAMBER-OF-HORRORS>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-MADAME-TUSSAUDS>
					<RT-DO-WALK ,P?WEST>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-CHAMBER-OF-HORRORS>
					<RT-DO-WALK ,P?EAST>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-TOTTENHAM-COURT-RD"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-TOTTENHAM-COURT-RD ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-TOTTENHAM-COURT-RD">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-TOTTENHAM-COURT-RD>
					<RT-ALREADY-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-TOTTENHAM-COURT-RD>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-ST-GILES-CIRCUS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-ST-GILES-CIRCUS ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-ST-GILES-CIRCUS">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-ST-GILES-CIRCUS>
					<RT-ALREADY-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-ST-GILES-CIRCUS>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-OXFORD-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-OXFORD-ST ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-OXFORD-ST">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-OXFORD-ST>
					<RT-ALREADY-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-OXFORD-ST>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-ORCHARD-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-ORCHARD-ST ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-ORCHARD-ST">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-ORCHARD-ST>
					<RT-ALREADY-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-ORCHARD-ST>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-AUDLEY-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-AUDLEY-ST ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-AUDLEY-ST">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-AUDLEY-ST>
					<RT-ALREADY-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-AUDLEY-ST>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-HYDE-PARK-CORNER"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-HYDE-PARK-CORNER ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-HYDE-PARK-CORNER">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-HYDE-PARK-CORNER>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-KENSINGTON-GARDENS>
					<RT-DO-WALK ,P?SE>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-HYDE-PARK-CORNER>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-KENSINGTON-GARDENS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-KENSINGTON-GARDENS ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-KENSINGTON-GARDENS">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-KENSINGTON-GARDENS>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-HYDE-PARK-CORNER>
					<RT-DO-WALK ,P?NW>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-KENSINGTON-GARDENS>
					<RT-DO-WALK ,P?SE>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-TRAFALGAR-SQUARE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-TRAFALGAR-SQUARE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-TRAFALGAR-SQUARE">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-TRAFALGAR-SQUARE>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-DIOGENES-CLUB>
					<RT-DO-WALK ,P?EAST>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-TRAFALGAR-SQUARE>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-DIOGENES-CLUB"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-DIOGENES-CLUB ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-DIOGENES-CLUB">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-DIOGENES-CLUB>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-TRAFALGAR-SQUARE>
					<RT-DO-WALK ,P?WEST>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-DIOGENES-CLUB>
					<RT-DO-WALK ,P?EAST>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-GREAT-RUSSELL-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-GREAT-RUSSELL-ST ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-GREAT-RUSSELL-ST">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-GREAT-RUSSELL-ST>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-BRITISH-MUSEUM>
					<RT-DO-WALK ,P?SOUTH>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-GREAT-RUSSELL-ST>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-BRITISH-MUSEUM"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-BRITISH-MUSEUM ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-BRITISH-MUSEUM">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-BRITISH-MUSEUM>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-GREAT-RUSSELL-ST>
					<RT-DO-WALK ,P?NORTH>
				)
				(<MC-HERE? ,RM-MANUSCRIPT-ROOM>
					<RT-DO-WALK ,P?WEST>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-BRITISH-MUSEUM>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-MANUSCRIPT-ROOM"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-MANUSCRIPT-ROOM ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-MANUSCRIPT-ROOM">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-MANUSCRIPT-ROOM>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-BRITISH-MUSEUM>
					<RT-DO-WALK ,P?EAST>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-MANUSCRIPT-ROOM>
					<RT-DO-WALK ,P?WEST>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-GROSVENOR-PLACE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-GROSVENOR-PLACE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-GROSVENOR-PLACE">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-GROSVENOR-PLACE>
					<RT-ALREADY-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-GROSVENOR-PLACE>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-VICTORIA-SQUARE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-VICTORIA-SQUARE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-VICTORIA-SQUARE">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-VICTORIA-SQUARE>
					<RT-ALREADY-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-VICTORIA-SQUARE>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-VICTORIA-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-VICTORIA-ST ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-VICTORIA-ST">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-VICTORIA-STREET>
					<RT-ALREADY-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-VICTORIA-STREET>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-BROAD-SANCTUARY"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-BROAD-SANCTUARY ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-BROAD-SANCTUARY">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-BROAD-SANCTUARY>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-NAVE>
					<RT-DO-WALK ,P?WEST>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-BROAD-SANCTUARY>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-PARLIAMENT-SQUARE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-PARLIAMENT-SQUARE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-PARLIAMENT-SQUARE">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-PARLIAMENT-SQUARE>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-PARLIAMENT>
					<RT-DO-WALK ,P?NW>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-PARLIAMENT-SQUARE>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-HOUSES-OF-PARLIAMENT"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-HOUSES-OF-PARLIAMENT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-HOUSES-OF-PARLIAMENT">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-PARLIAMENT>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-PARLIAMENT-SQUARE>
					<RT-DO-WALK ,P?SE>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-PARLIAMENT>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-BUCKINGHAM-PALACE-ROAD"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-BUCKINGHAM-PALACE-ROAD ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-BUCKINGHAM-PALACE-ROAD">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-BUCKINGHAM-PALACE-RD>
					<RT-ALREADY-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-BUCKINGHAM-PALACE-RD>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-QUEENS-GARDENS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-QUEENS-GARDENS ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-QUEENS-GARDENS">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-QUEENS-GARDENS>
					<RT-ALREADY-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-QUEENS-GARDENS>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-BUCKINGHAM-PALACE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-BUCKINGHAM-PALACE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-BUCKINGHAM-PALACE">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-BUCKINGHAM-PALACE>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-QUEENS-GARDENS>
					<RT-DO-WALK ,P?WEST>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-BUCKINGHAM-PALACE>
					<RT-DO-WALK ,P?EAST>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-BIRDCAGE-WALK"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-BIRDCAGE-WALK ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-BIRDCAGE-WALK">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-BIRDCAGE-WALK>
					<RT-ALREADY-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-BIRDCAGE-WALK>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-THE-MALL"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-THE-MALL ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-THE-MALL">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-THE-MALL>
					<RT-ALREADY-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-THE-MALL>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-WHITEHALL"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-WHITEHALL ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-WHITEHALL">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-WHITEHALL>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-SCOTLAND-YARD>
					<RT-DO-WALK ,P?WEST>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-WHITEHALL>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-SCOTLAND-YARD"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-SCOTLAND-YARD ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-SCOTLAND-YARD">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-SCOTLAND-YARD ,RM-THE-BLACK-MUSEUM>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-WHITEHALL>
					<RT-DO-WALK ,P?EAST>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-SCOTLAND-YARD>
					<RT-DO-WALK ,P?WEST>
				)
				(<MC-HERE? ,RM-THE-BLACK-MUSEUM>
					<RT-DO-WALK ,P?UP>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-BLACK-MUSEUM"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-BLACK-MUSEUM ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-BLACK-MUSEUM">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-THE-BLACK-MUSEUM>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-SCOTLAND-YARD>
					<RT-DO-WALK ,P?DOWN>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-THE-BLACK-MUSEUM>
					<RT-DO-WALK ,P?UP>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-NEW-OXFORD-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-NEW-OXFORD-ST ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-NEW-OXFORD-ST">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-NEW-OXFORD-ST>
					<RT-ALREADY-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-NEW-OXFORD-ST>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-COVENT-GARDEN"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-COVENT-GARDEN ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-COVENT-GARDEN">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-COVENT-GARDEN>
					<RT-ALREADY-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-COVENT-GARDEN>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-STRAND"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-STRAND ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-STRAND">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-THE-STRAND>
					<RT-ALREADY-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-THE-STRAND>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-FLEET-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-FLEET-ST ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-FLEET-ST">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-FLEET-STREET>
					<RT-ALREADY-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-FLEET-STREET>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-THE-EMBANKMENT"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-THE-EMBANKMENT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-THE-EMBANKMENT">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-THE-EMBANKMENT>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-THAMES-ONE>
					<RT-DO-WALK ,P?NORTH>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-THE-EMBANKMENT>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-UPPER-THAMES-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-UPPER-THAMES-ST ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-UPPER-THAMES-ST">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-UPPER-THAMES-ST>
					<RT-ALREADY-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-UPPER-THAMES-ST>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-BLIND-ALLEY"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-BLIND-ALLEY ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-BLIND-ALLEY">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-BLIND-ALLEY>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-SIGN-OF-RED-HERRING>
					<RT-DO-WALK ,P?WEST>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-BLIND-ALLEY>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-THE-SIGN-OF-THE-RED-HERRING"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-THE-SIGN-OF-THE-RED-HERRING ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-THE-SIGN-OF-THE-RED-HERRING">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-SIGN-OF-RED-HERRING>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-BLIND-ALLEY>
					<RT-DO-WALK ,P?EAST>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-SIGN-OF-RED-HERRING>
					<RT-DO-WALK P?WEST>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-PINCHIN-LANE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-PINCHIN-LANE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-PINCHIN-LANE">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-PINCHIN-LANE>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-SHERMANS-HOUSE>
					<RT-DO-WALK ,P?EAST>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-PINCHIN-LANE>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-SHERMANS-HOUSE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-SHERMANS-HOUSE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-SHERMANS-HOUSE">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-SHERMANS-HOUSE>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-PINCHIN-LANE>
					<RT-DO-WALK ,P?WEST>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-SHERMANS-HOUSE>
					<RT-DO-WALK ,P?EAST>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-HOLMES-HOUSE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-HOLMES-HOUSE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-HOLMES-HOUSE">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-ENTRY-HALL ,RM-PARLOUR ,RM-VESTIBULE ,RM-HOLMES-STUDY ,RM-HOLMES-BEDROOM>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-221B-BAKER-ST>
					<RT-DO-WALK ,P?WEST>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-ENTRY-HALL>
					<RT-DO-WALK ,P?EAST>
				)
				(<MC-HERE? ,RM-PARLOUR ,RM-VESTIBULE ,RM-HOLMES-STUDY	,RM-HOLMES-BEDROOM>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-CHEAPSIDE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-CHEAPSIDE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-CHEAPSIDE">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-CHEAPSIDE>
					<RT-ALREADY-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-CHEAPSIDE>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-THREADNEEDLE-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-THREADNEEDLE-ST ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-THREADNEEDLE-ST">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-THREADNEEDLE-ST>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-BANK-OF-ENGLAND>
					<RT-DO-WALK ,P?SOUTH>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-THREADNEEDLE-ST>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-BANK"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-BANK ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-BANK">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-BANK-OF-ENGLAND ,RM-BANK-VAULT>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-THREADNEEDLE-ST>
					<RT-DO-WALK ,P?NORTH>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-BANK-OF-ENGLAND>
					<RT-DO-WALK ,P?SOUTH>
				)
				(<MC-HERE? ,RM-BANK-VAULT>
					<RT-DO-WALK ,P?EAST>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-VAULT"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-VAULT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-VAULT">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? ENTER>
					<COND
						(<MC-HERE? ,RM-BANK-VAULT>
							<RT-ALREADY-IN-ROOM-MSG>
						)
						(<MC-HERE? ,RM-BANK-OF-ENGLAND>
							<RT-DO-WALK ,P?WEST>
						)
					>
				)
				(<MC-VERB? EXIT>
					<COND
						(<MC-HERE? ,RM-BANK-VAULT>
							<RT-DO-WALK ,P?EAST>
						)
						(T
							<RT-NOT-IN-ROOM-MSG>
						)
					>
				)
				(<MC-VERB? LOOK-INSIDE SEARCH>
					<COND
						(<MC-IS? ,LG-BANK-VAULT-DOOR ,FL-OPENED>
							<RT-CYOU-MSG "see" "sees">
							<TELL "row upon row of " D ,TH-BOXES "." CR>
						)
						(T
							<TELL CTHE ,LG-BANK-VAULT-DOOR " is closed." CR>
						)
					>
				)
				(<MC-VERB? UNLOCK>
					<COND
						(<MC-IS? ,LG-BANK-VAULT-DOOR ,FL-OPENED>
							<TELL CTHE ,LG-BANK-VAULT-DOOR " is already opened." CR>
						)
						(T
							<TELL ,K-HOW-TO-MSG CR>
						)
					>
				)
				(<MC-VERB? OPEN>
					<COND
						(<MC-IS? ,LG-BANK-VAULT-DOOR ,FL-OPENED>
							<TELL "The vault door is already open." CR>
						)
						(<MC-IS? ,TH-DIAL ,FL-LOCKED>
							<TELL "The vault door is locked." CR>
						)
						(T
							<MC-MAKE ,LG-BANK-VAULT-DOOR ,FL-OPENED>
							<TELL "The vault door swings open." CR>
						)
					>
				)
				(<MC-VERB? SHOOT>
					<TELL ,K-RICOCHET-MSG CR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-KING-WILLIAM-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-KING-WILLIAM-ST ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-KING-WILLIAM-ST">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-KING-WILLIAM-ST>
					<RT-ALREADY-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-KING-WILLIAM-ST>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-MONUMENT"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-MONUMENT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-MONUMENT">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-MONUMENT>
					<TELL "You can't go inside " THEO "." CR>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-MONUMENT>
					<TELL "You're not in " THEO "." CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-LOWER-THAMES-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-LOWER-THAMES-ST ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-LOWER-THAMES-ST">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-LOWER-THAMES-ST>
					<RT-ALREADY-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-LOWER-THAMES-ST>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-LONDON-BRIDGE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-LONDON-BRIDGE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-LONDON-BRIDGE">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? ENTER>
					<COND
						(<MC-HERE? ,RM-LONDON-BRIDGE>
							<RT-ALREADY-IN-ROOM-MSG>
						)
						(<MC-HERE? ,RM-LOWER-THAMES-ST>
							<RT-DO-WALK ,P?SOUTH>
						)
						(<MC-HERE? ,RM-THAMES-THREE>
							<TELL "You can't climb onto the bridge." CR>
						)
					>
				)
				(<MC-VERB? EXIT>
					<COND
						(<MC-HERE? ,RM-LONDON-BRIDGE>
							<RT-DO-WALK ,P?NORTH>
						)
						(T
							<RT-NOT-IN-ROOM-MSG>
						)
					>
				)
				(<MC-VERB? SHOOT>
					<TELL ,K-RICOCHET-MSG CR>
				)
			>
		)
		(<MC-THIS-PRSI?>
			<COND
				(<AND <IN? ,CH-PLAYER ,TH-BOAT>
						<MC-VERB? PUT PUT-ON>
					>
					<TELL "You can't attach anything to the bridge." CR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-TOWER-ENTRANCE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-TOWER-ENTRANCE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-TOWER-ENTRANCE">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-TOWER-ENTRANCE>
					<RT-ALREADY-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-TOWER-ENTRANCE>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-SWAN-LANE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-SWAN-LANE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-SWAN-LANE">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-SWAN-LANE>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-BAR-OF-GOLD>
					<RT-DO-WALK ,P?EAST>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-SWAN-LANE>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-BAR-OF-GOLD"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-BAR-OF-GOLD ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-BAR-OF-GOLD">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-BAR-OF-GOLD>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-SWAN-LANE>
					<RT-DO-WALK ,P?WEST>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-BAR-OF-GOLD>
					<RT-DO-WALK ,P?EAST>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-LAIR"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-LAIR ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-LAIR">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-LAIR>
					<RT-ALREADY-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-LAIR>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-DRAWBRIDGE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-DRAWBRIDGE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-DRAWBRIDGE">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-DRAWBRIDGE>
					<RT-ALREADY-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-DRAWBRIDGE>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

-----------------------------------------------------------------------------
; "RT-AC-LG-TOWER"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-TOWER ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-TOWER">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE?  ,RM-BYWARD-TOWER ,RM-BLOODY-TOWER ,RM-WAKEFIELD-TOWER ,RM-JEWEL-ROOM
								,RM-DUNGEON ,RM-TORTURE-ROOM ,RM-WHITE-TOWER ,RM-BOWYER-TOWER>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-OUTER-WARD ,RM-TOWER-GREEN>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(<MC-HERE? ,RM-OUTSIDE-TRAITORS-GATE>
					<RT-DO-WALK ,P?NORTH>
				)
				(<MC-HERE? ,RM-DRAWBRIDGE ,RM-TOWER-ENTRANCE>
					<RT-DO-WALK ,P?EAST>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-BLOODY-TOWER ,RM-WAKEFIELD-TOWER ,RM-WHITE-TOWER ,RM-BOWYER-TOWER ,RM-BYWARD-TOWER>
					<RT-DO-WALK ,P?OUT>
				)
				(<MC-HERE? ,RM-DUNGEON ,RM-TORTURE-ROOM>
					<RT-DO-WALK ,P?UP>
				)
				(<MC-HERE? ,RM-JEWEL-ROOM>
					<RT-DO-WALK ,P?DOWN>
				)
				(<MC-HERE? ,RM-INSIDE-TRAITORS-GATE>
					<RT-DO-WALK ,P?SOUTH>
				)
				(<MC-HERE? ,RM-OUTER-WARD RM-TOWER-GREEN>
					<TELL ,K-SPECIFY-DIR-MSG CR>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-LG-ABBEY"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-ABBEY ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-ABBEY">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? ENTER>
			<COND
				(<MC-HERE? ,RM-NAVE>
					<RT-ALREADY-IN-ROOM-MSG>
				)
				(<MC-HERE? ,RM-BROAD-SANCTUARY>
					<RT-DO-WALK ,P?EAST>
				)
			>
		)
		(<MC-VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-NAVE>
					<RT-DO-WALK ,P?WEST>
				)
				(T
					<RT-NOT-IN-ROOM-MSG>
				)
			>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
		)
	>
>

;*****************************************************************************
; "CONSTANTS"
;*****************************************************************************

<CONSTANT K-SIGN-HERE-MSG
"There is a sign on the wall."
>

<CONSTANT K-YUCK-MSG
"Yuck! Have you looked at that stuff?"
>

;*****************************************************************************
; "end of file"
;*****************************************************************************

