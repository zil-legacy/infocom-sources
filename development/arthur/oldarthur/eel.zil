;"***************************************************************************"
; "game : Arthur"
; "file : EEL.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   05 May 1989  1:07:24  $"
; "revs : $Revision:   1.100  $"
; "vers : 1.0"
;"---------------------------------------------------------------------------"
; "Kraken Puzzle"
; "Copyright (C) 1988 Infocom, Inc.  All rights reserved."
;"***************************************************************************"

;"---------------------------------------------------------------------------"
; "RM-SHALLOWS"
;"---------------------------------------------------------------------------"

<ROOM RM-SHALLOWS
	(LOC ROOMS)
	(DESC "shallows")
	(FLAGS FL-LIGHTED FL-WATER)
	(SYNONYM SHALLOWS)
	(ADJECTIVE LAKE)
	(NORTH PER RT-EXIT-SHALLOW-1)
	(SOUTH PER RT-EXIT-SHALLOW-2)
	(OUT PER RT-EXIT-SHALLOW-1)
	(IN PER RT-EXIT-SHALLOW-2)
	(GLOBAL LG-LAKE RM-ISLAND RM-CAUSEWAY RM-FIELD-OF-HONOUR)
	(ACTION RT-RM-SHALLOWS)
>

<CONSTANT K-KRAKEN-HOLD-MSG
"You're not going anywhere with that kraken holding on to you.|">

<ROUTINE RT-RM-SHALLOWS ("OPT" (CONTEXT <>))
	<COND
		(<MC-CONTEXT? ,M-F-LOOK ,M-V-LOOK ,M-LOOK>
			<COND
				(<NOT <FSET? ,RM-MID-LAKE ,FL-WATER>>
					<COND
						(<MC-CONTEXT? ,M-LOOK>
							<TELL "You are" standing " on">
						)
						(T
							<TELL "You" walk " to">
						)
					>
					<TELL " the edge of a dry lake bed.|">
				)
				(T
					<COND
						(<MC-CONTEXT? ,M-LOOK>
							<TELL "You are" standing " in">
						)
						(T
							<COND
								(<EQUAL? ,OHERE ,RM-FIELD-OF-HONOUR>
									<TELL "You wade into">
								)
								(T
									<TELL "You swim to">
								)
							>
						)
					>
					<TELL " the shallow water near the shore of the lake. ">
					<COND
						(<MC-FORM? ,K-FORM-EEL ,K-FORM-TURTLE>
							<TELL
"Light filters down from the surface above, and the"
							>
						)
						(T
							<TELL "The">
						)
					>
					<TELL " bottom drops away sharply to the south.|">
				)
			>
			<RFALSE>
		)
		(<MC-CONTEXT? ,M-BEG>
			<COND
				(<AND <VERB? WALK>
						<IN? ,CH-KRAKEN ,RM-SHALLOWS>
						<FSET? ,CH-KRAKEN ,FL-LOCKED>
					>
					<TELL ,K-KRAKEN-HOLD-MSG>
				)
			>
		)
		(<MC-CONTEXT? ,M-ENTER>
			<COND
				(<MC-FORM? ,K-FORM-EEL>
					<SETG GL-PICTURE-NUM ,K-PIC-UNDERWATER>
				)
				(T
					<SETG GL-PICTURE-NUM ,K-PIC-SHALLOWS>
				)
			>
			<COND
				(<EQUAL? ,GL-WINDOW-TYPE ,K-WIN-PICT>
					<RT-UPDATE-PICT-WINDOW>
				)
			>
			<RFALSE>
		)
	;	(<MC-CONTEXT? ,M-EXIT>
			<COND
				(<AND <NOT <FSET? ,RM-MID-LAKE ,FL-WATER>>
						<EQUAL? ,P-WALK-DIR ,P?SOUTH>
					>
					<TELL
"The cheering mob parts on either side of you to allow you to walk to the
water's edge. Slowly, you venture out between the two walls of water that are
being held back by some magical, unseen force.  After a few moments, you
reach the center of the lake.  Here, the sunken boat rests on dry ground and
a shaft of light illuminates the sword in the stone.||The crowd follows you.|"
					>
					<RFALSE>
				)
			>
		)
		(.CONTEXT
			<RFALSE>
		)
		(<OR	<VERB? THROW THROW-OVER>
				<AND
					<VERB? PUT PUT-IN>
					<VERB-WORD? ,W?THROW ,W?TOSS ,W?HURL ,W?CHUCK ,W?FLING ,W?PITCH ,W?HEAVE>
				>
			>
			<COND
				(<MC-HERE? ,RM-SHALLOWS>
					<PERFORM ,V?DROP ,PRSO>
					<RTRUE>
				)
				(<MC-HERE? ,RM-FIELD-OF-HONOUR>
					<COND
						(<IDROP>
							<RT-THROW-INTO-ROOM-MSG ,PRSO ,RM-SHALLOWS>
						)
						(T
							<RTRUE>
						)
					>
				)
				(T
					<NOT-HERE ,PRSI>	; "not close enough"
				)
			>
		)
	>
>

<ROUTINE RT-EXIT-SHALLOW-1 ("OPT" (QUIET <>))
	<COND
		(<MC-FORM? ,K-FORM-EEL>
			<COND
				(<NOT .QUIET>
					<TELL "You can't swim any further towards shore.|">
				)
			>
			<RFALSE>
		)
		(T
			<RETURN ,RM-FIELD-OF-HONOUR>
		)
	>
>

<ROUTINE RT-EXIT-SHALLOW-2 ("OPT" (QUIET <>))
	<COND
		(<OR	<MC-FORM? ,K-FORM-EEL ,K-FORM-TURTLE>
				<NOT <FSET? ,RM-MID-LAKE ,FL-WATER>>
			>
			<RETURN ,RM-MID-LAKE>
		)
		(T
			<COND
				(<NOT .QUIET>
					<TELL ,K-WOULD-DROWN-MSG>
				)
			>
			<RFALSE>
		)
	>
>

<ROUTINE RT-THROW-INTO-ROOM-MSG (OBJ RM)
	<MOVE .OBJ .RM>
	<TELL The+verb ,WINNER "toss" the .OBJ " into" the .RM "." CR>
>

;"---------------------------------------------------------------------------"
; "RM-MID-LAKE"
;"---------------------------------------------------------------------------"

<ROOM RM-MID-LAKE
	(LOC ROOMS)
	(DESC "lake")
	(FLAGS FL-LIGHTED FL-WATER)
	(EAST TO RM-LAKE-WINDOW)
	(NORTH TO RM-SHALLOWS)
	(SE TO RM-INLET)
	(SW TO RM-BOAT-ROOM)
	(GLOBAL LG-LAKE RM-SHALLOWS TH-BOAT)
	(ACTION RT-RM-MID-LAKE)
	(THINGS
		<> (ROCK ROCKS) RT-PS-ROCKS
	)
>

<ROUTINE RT-RM-MID-LAKE ("OPT" (CONTEXT <>))
	<COND
		(<MC-CONTEXT? ,M-F-LOOK ,M-V-LOOK ,M-LOOK>
			<COND
				(<NOT <FSET? ,RM-MID-LAKE ,FL-WATER>>
					<COND
						(<MC-CONTEXT? ,M-LOOK>
							<TELL
"You are" standing " in the middle of a dry lake bed." CR
							>
						)
						(T
							<THIS-IS-IT ,TH-EXCALIBUR>
							<THIS-IS-IT ,CH-LOT>
							<THIS-IS-IT ,CH-COURTIERS>
							<TELL
"The cheering mob parts on either side of you to allow you to walk to the
water's edge. Slowly, you venture out between the two walls of water that are
being held back by some magical, unseen force.  After a few moments, you
reach the center of the lake.  Here, the sunken boat rests on dry ground and
a shaft of light illuminates the sword in the stone.||Lot and the crowd
follow you." CR
							>
						)
					>
				)
				(T
					<COND
						(<MC-CONTEXT? ,M-LOOK>
							<TELL "You are" walking " in">
						)
						(T
							<TELL "You" walk " to">
						)
					>
					<TELL
" the middle of the lake. To the east, steep rocks that form the island rise
out of the water. To the southwest "
					>
					<COND
						(<IN? ,CH-KRAKEN ,RM-BOAT-ROOM>
							<TELL "the water is murky with some kind of inky fluid">
						)
						(T
							<TELL
"you see the dim outline of a sunken rowboat resting on the lake's bottom"
							>
						)
					>
					<TELL
". You feel a current flowing into the lake from the southeast.|"
					>
				)
			>
			<RFALSE>
		)
		(<MC-CONTEXT? ,M-ENTER>
			<COND
				(<FSET? ,RM-MID-LAKE ,FL-WATER>
					<SETG GL-PICTURE-NUM ,K-PIC-UNDERWATER>
				)
				(T
					<SETG GL-PICTURE-NUM ,K-PIC-BOAT-DRY>
					<MOVE ,CH-LOT ,RM-MID-LAKE>
					<MOVE ,CH-COURTIERS ,RM-MID-LAKE>	; "Mob"
				)
			>
			<COND
				(<EQUAL? ,GL-WINDOW-TYPE ,K-WIN-PICT>
					<RT-UPDATE-PICT-WINDOW>
				)
			>
			<RFALSE>
		)
		(<MC-CONTEXT? ,M-EXIT>
			<COND
				(<NOT <FSET? ,RM-MID-LAKE ,FL-WATER>>
					<TELL "The mob blocks your path." CR>
				)
			>
		)
		(<MC-CONTEXT? ,M-END>
			<COND
				(<AND <VERB? TRANSFORM>
						<NOT <FSET? ,RM-MID-LAKE ,FL-WATER>>
						<NOT <MC-FORM? ,GL-OLD-FORM>>
					>
					<TELL
"|The mob recoils in horror for a moment, and then they close in and kill
you.|"
					>
					<RT-END-OF-GAME>
				)
			>
		)
		(.CONTEXT
			<RFALSE>
		)
	>
>

;"---------------------------------------------------------------------------"
; "RM-BOAT-ROOM"
;"---------------------------------------------------------------------------"

<ROOM RM-BOAT-ROOM
	(LOC ROOMS)
	(DESC "lake")
	(FLAGS FL-LIGHTED FL-WATER)
	(NE TO RM-MID-LAKE)
	(GLOBAL LG-LAKE)
	(ACTION RT-RM-BOAT-ROOM)
>

<ROUTINE RT-RM-BOAT-ROOM ("OPT" (CONTEXT <>))
	<COND
		(<MC-CONTEXT? ,M-F-LOOK ,M-V-LOOK ,M-LOOK>
			<COND
				(<MC-CONTEXT? ,M-LOOK>
					<COND
						(<IN? ,CH-KRAKEN ,RM-BOAT-ROOM>
							<FSET ,CH-KRAKEN ,FL-SEEN>
							<THIS-IS-IT ,CH-KRAKEN>
							<THIS-IS-IT ,TH-BRACELET>
							<TELL
"You are swimming in murky waters, just to the southwest of the middle of
the lake. A giant kraken is floating nearby. His tentacles are long, thick,
and slimy, and one of them is adorned with a golden bracelet."
							>
						)
						(T
							<TELL
"You are swimming in the waters just to the southwest of the middle of the
lake. There is rowboat here that has a large hole in its side, as if it
had been deliberately sunk."
							>
						)
					>
				)
				(T
					<COND
						(<IN? ,CH-KRAKEN ,RM-BOAT-ROOM>
							<COND
								(<NOT <FSET? ,CH-KRAKEN ,FL-SEEN>>
									<FSET ,CH-KRAKEN ,FL-SEEN>
									<THIS-IS-IT ,CH-KRAKEN>
									<TELL
"Cautiously, you swim into the murky waters. Suddenly a giant kraken emerges
from the depths and floats menacingly in front of you."
									>
								)
								(T
									<THIS-IS-IT ,CH-KRAKEN>
									<TELL
"You slowly make your way back into the inky fluid, until you are once again
face to face with the giant kraken."
									>
								)
							>
						)
						(T
							<TELL
"You swim towards the rowboat. As you get closer, you can see that it has a
large hole in its side."
							>
						)
					>
				)
			>
			<COND
				(<IN? ,CH-KRAKEN ,RM-BOAT-ROOM>
					<TELL
" Below the kraken you can see the dim outline of a sunken rowboat resting on the
lake-bed."
					>
				)
			>
			<TELL " The middle of the lake lies behind you to the northeast.|">
			<RFALSE>
		)
		(<MC-CONTEXT? ,M-ENTER>
			<COND
				(<IN? ,CH-KRAKEN ,RM-BOAT-ROOM>
					<SETG GL-PICTURE-NUM ,K-PIC-KRAKEN>
				)
				(T
					<SETG GL-PICTURE-NUM ,K-PIC-BOAT>
				)
			>
			<COND
				(<EQUAL? ,GL-WINDOW-TYPE ,K-WIN-PICT>
					<RT-UPDATE-PICT-WINDOW>
				)
			>
			<RFALSE>
		)
		(.CONTEXT
			<RFALSE>
		)
	>
>

;"---------------------------------------------------------------------------"
; "CH-KRAKEN"
;"---------------------------------------------------------------------------"

<OBJECT CH-KRAKEN
	(LOC RM-BOAT-ROOM)
	(DESC "giant kraken")
	(FLAGS FL-ALIVE FL-OPEN FL-SEARCH FL-NO-DESC)
	(SYNONYM KRAKEN OCTOPUS SQUID TENTACLE TENTACLES)
	(ADJECTIVE GIANT)
	(ACTION RT-CH-KRAKEN)
	(CONTFCN RT-CH-KRAKEN)
>

; "CH-KRAKEN flags:"
; "	FL-BROKEN - Player has shocked kraken"
; "	FL-LOCKED - Kraken has grabbed player"

<ROUTINE RT-CH-KRAKEN ("OPT" (CONTEXT <>))
	<COND
		(<AND <MC-CONTEXT? ,M-WINNER <>>
				<VERB? HELLO GOODBYE THANK>
			>
			<COND
				(<VERB? HELLO>
					<TELL "\"Forsooth, I shall greet thee not, for I liketh not thy face.\"" CR>
				)
				(<VERB? GOODBYE>
					<TELL "\"Adieu. If I seeth thee not ever anon, 'twill be over soonly.\"" CR>
				)
				(<VERB? THANK>
					<TELL "\"Thou may keepest thy thanks. A use for them have I not.\"" CR>
					<COND
						(<NOT <FSET? ,CH-PLAYER ,FL-AIR>>
							<FSET ,CH-PLAYER ,FL-AIR>
							<RT-SCORE-MSG 10 0 0 0>
						)
					>
					<RTRUE>
				)
			>
		)
		(<MC-CONTEXT? ,M-WINNER>
			<COND
				(<AND <VERB? TELL-ABOUT>
						<MC-PRSO? ,CH-PLAYER>
					>
					<RFALSE>
				)
				(T
					<TELL "\"Knave! That will I not do.\"" CR>
				)
			>
		)
		(.CONTEXT
			<RFALSE>
		)
		(,NOW-PRSI
			<RFALSE>
		)
		(<AND <VERB? TELL>
				,P-CONT
			>
		; "Message and RFATAL if don't want kraken to become winner"
			<RFALSE>
		)
		(<VERB? TALK-TO>
			<TELL "\"If thou wouldst have speak with me, spitteth it out!\"" CR>
		)
		(<VERB? ASK-ABOUT>
			<COND
				(<EQUAL? ,PRSI ,CH-KRAKEN>
					<TELL "\"I floateth like a butterfly and stingeth like a bee.\"" CR>
				)
				(<EQUAL? ,PRSI ,TH-BRACELET>
					<TELL "\"'Tis a precious ringlet, one from which I fain would not part.\"" CR>
				)
				(<MC-PRSI? ,CH-PLAYER>
					<TELL "\"I liketh not thy face.\"" CR>
				)
				(<MC-PRSI? ,TH-MASTER>
					<TELL "\"I have no master.\"" CR>
				)
				(T
					<TELL "\"I knoweth not. Catchest thou my drift?\"" CR>
				)
			>
		)
		(<VERB? ASK-FOR>
			<COND
				(<EQUAL? ,PRSI ,TH-BRACELET>
					<TELL "\"Gadzooks! Wouldst thou take from me my most prized possession?\"" CR>
				)
			>
		)
		(<VERB? ATTACK CUT>
			<COND
				(<MC-PRSI? ,TH-SWORD>
					<RT-KILL-KRAKEN>
				)
				(<OR	<VERB-WORD? ,W?BITE>
						<MC-PRSI? ,TH-MOUTH>
					>
					<TELL
"The kraken moves his tentacle out of the way and says, \"If thou thinkest
to bite me, thinkst again.\"" CR
					>
				)
				(T
					<TELL
The+verb ,WINNER "hit" the ,CH-KRAKEN " with" the ,PRSI ", but it doesn't
do any good." CR
					>
				)
			>
		)
		(<VERB? SHOCK>
			<COND
				(<NOT <FSET? ,PRSO ,FL-BROKEN>>
					<FSET ,CH-KRAKEN ,FL-BROKEN>
					<RT-QUEUE ,RT-I-KRAKEN-FOLLOW <+ ,GL-MOVES 1>>
					<TELL
"You zap the kraken. He recoils for an instant and then recovers. His
tentacles start to reach out for you and he says, \"Thou hast made a grievous
error, varlet. Now I must needs squeezeth thee until thou art dead.\"" CR
					>
				)
				(T
					<TELL
"You zap the kraken, but this time he was ready for you and he scarcely
notices. His tentacles slowly close around you and squeeze the life from
your body.|"
					>
					<RT-END-OF-GAME>
				)
			>
		)
		(<VERB? EXAMINE>
			<FSET ,CH-KRAKEN ,FL-SEEN>
			<COND
				(<NOUN-USED? ,CH-KRAKEN ,W?TENTACLE ,W?TENTACLES>
					<TELL "The kraken's tentacles are thick and slimy." CR>
				)
				(T
					<TELL
"The kraken looks like a giant octopus. His tentacles are long and slimy. One
of the tentacles is adorned by a golden bracelet." CR
					>
				)
			>
		)
		(<TOUCH-VERB?>
			<COND
				(<FSET? ,CH-KRAKEN ,FL-LOCKED>
					<TELL
The ,CH-KRAKEN " scarcely notices. His tentacles slowly close tighter and
squeeze the life from your body.|"
					>
					<RT-END-OF-GAME>
				)
				(<FSET? ,CH-KRAKEN ,FL-BROKEN>
					<TELL The ,CH-KRAKEN " scarcely notices." CR>
				)
				(T
					<TELL "\"Villain! Toucheth thee not me, lest I take ire and kill thee.\"" CR>
				)
			>
		)
	>
>

<ROUTINE RT-KILL-KRAKEN ()
	<COND
		(<MC-HERE? ,RM-FORD>
			<MOVE ,TH-BRACELET ,RM-RIVER-1>
		)
		(T
			<MOVE ,TH-BRACELET ,RM-MID-LAKE>
		)
	>
	<REMOVE ,CH-KRAKEN>
	<FCLEAR ,CH-KRAKEN ,FL-LOCKED>
	<FCLEAR ,TH-BRACELET ,FL-TRY-TAKE>
	<FCLEAR ,TH-BRACELET ,FL-NO-DESC>
	<FSET ,TH-BRACELET ,FL-TAKEABLE>
	<RT-DEQUEUE ,RT-I-KRAKEN-FIGHT-1>
	<RT-DEQUEUE ,RT-I-KRAKEN-FIGHT-2>
	<TELL
"You hack at" the ,CH-KRAKEN " with" the ,TH-SWORD ". The tentacle bearing"
the ,TH-BRACELET " flies up into the air and lands with a plop in the deep
water. The wounded kraken immediately releases its grip on you and disappears
into the murky waters." CR
	>
	<RT-SCORE-MSG 0 5 7 4>
>

<ROUTINE RT-I-KRAKEN-FOLLOW ()
	<COND
		(<IN? ,CH-KRAKEN ,HERE>
			<TELL CR The ,CH-KRAKEN " ">
			<COND
				(<AND <MC-HERE? ,RM-SHALLOWS ,RM-FORD>
						<VERB? TRANSFORM>
						<NOT <MC-FORM? ,GL-OLD-FORM>>
					>
					<RT-QUEUE ,RT-I-KRAKEN-FIGHT-1 <+ ,GL-MOVES 1>>
					<TELL
"recoils for a moment, and then reaches out a slimy tentacle towards you. "
The ,TH-BRACELET " glistens in the sunlight." CR
					>
				)
				(T
					<TELL
"catches up to you and wraps his blood-sucking tentacles around you. Then
slowly, inexorably, he squeezes the life out of you.|"
					>
					<RT-END-OF-GAME>
				)
			>
		)
		(<NOT <FSET? ,HERE ,FL-WATER>>
		;	<RT-KRAKEN-LEAVE>
			<MOVE ,CH-KRAKEN ,RM-BOAT-ROOM>
			<FCLEAR ,CH-KRAKEN ,FL-BROKEN>
			<RFALSE>
		)
		(T
			<RT-QUEUE ,RT-I-KRAKEN-FOLLOW <+ ,GL-MOVES 1>>
			<MOVE ,CH-KRAKEN ,HERE>
			<TELL CR The ,CH-KRAKEN " follows you." CR>
		)
	>
>

;<ROUTINE RT-KRAKEN-LEAVE ()
	<MOVE ,CH-KRAKEN ,RM-BOAT-ROOM>
	<FCLEAR ,CH-KRAKEN ,FL-BROKEN>
	<TELL "disappears back into the murky depths." CR>
>

<ROUTINE RT-I-KRAKEN-FIGHT-1 ()
	<COND
		(<NOT <FSET? ,HERE ,FL-WATER>>
		;	<TELL CR The ,CH-KRAKEN " ">
		;	<RT-KRAKEN-LEAVE>
			<RFALSE>
		)
		(T
			<RT-QUEUE ,RT-I-KRAKEN-FIGHT-2 <+ ,GL-MOVES 1>>
			<FSET ,CH-KRAKEN ,FL-LOCKED>
			<TELL
"|A slimy tentacle wraps around you, and the kraken begins to squeeze." CR
			>
		)
	>
>

<ROUTINE RT-I-KRAKEN-FIGHT-2 ()
	<TELL CR The ,CH-KRAKEN " squeezes the life out of you.|">
	<RT-END-OF-GAME>
>

;"---------------------------------------------------------------------------"
; "TH-BRACELET"
;"---------------------------------------------------------------------------"

<OBJECT TH-BRACELET
	(LOC CH-KRAKEN)
	(DESC "golden bracelet")
	(FLAGS FL-TRYTAKE FL-CLOTHING FL-NO-DESC)
	(SYNONYM BRACELET BAND JEWEL JEWELS)
	(ADJECTIVE GOLDEN GOLD FINE)
	(SCORE <LSH 2 ,K-QUEST-SHIFT>)
	(SIZE 1)
	(ACTION RT-TH-BRACELET)
>

<ROUTINE RT-TH-BRACELET ("OPT" (CONTEXT <>))
	<COND
		(.CONTEXT
			<RFALSE>
		)
		(<AND <VERB? SHOCK>
				<IN? ,TH-BRACELET ,CH-KRAKEN>
			>
			<COND
				(<NOT <FSET? ,PRSO ,FL-BROKEN>>
					<FSET ,CH-KRAKEN ,FL-BROKEN>
					<RT-QUEUE ,RT-I-KRAKEN-FOLLOW <+ ,GL-MOVES 1>>
					<TELL
"You zap the kraken. He recoils for an instant and then recovers. His
tentacles start to reach out for you and he says, \"Thou hast made a grievous
error, varlet. Now I must needs squeezeth thee until thou art dead.\"" CR
					>
				)
				(T
					<TELL
"You zap the kraken, but this time he was ready for you and he scarcely
notices. His tentacles slowly close around you and squeeze the life from
your body.|"
					>
					<RT-END-OF-GAME>
				)
			>
		)
		(<AND <OR <TOUCH-VERB?> <VERB? ENTER>>
				<IN? ,PRSO ,CH-KRAKEN>
				<NOT <MC-FORM? ,K-FORM-ARTHUR>>
			>
			; "Bob"
			<TELL
"As you approach the bracelet, the kraken moves his tentacle out of your way
and says, \"Villain! Toucheth thee not me, lest I take ire and kill thee.\"" CR
			>
		)
		(<VERB? EXAMINE>
			<FSET ,TH-BRACELET ,FL-SEEN>
			<TELL
"It is a beautiful gold bracelet, inlaid with many fine jewels." CR
			>
		)
		(<AND <OR
					<VERB? ENTER>
					<AND
						<VERB? PUT-THRU>
						<MC-PRSO? ,TH-HEAD>
					>
				>
				<FSET? ,HERE ,FL-WATER>
				<MC-FORM? ,K-FORM-TURTLE ,K-FORM-EEL>
			>
			<COND
				(<MC-FORM? ,K-FORM-TURTLE>
					<COND
						(<FSET? ,TH-HEAD ,FL-LOCKED>
							; "Bob"
							<TELL
"You bump up against" the ,TH-BRACELET ", but it fails to catch on anything
since your head is inside your shell." CR
							>
						)
						(T
							<TELL
"Your head passes through" the ,TH-BRACELET " and it nestles around your
neck, up against your shell." CR
							>
							<COND
								(<NOT <FSET? ,TH-BRACELET ,FL-TOUCHED>>
									<FSET ,TH-BRACELET ,FL-TOUCHED>
									<RT-SCORE-MSG 0 3 0 1>
								)
							>
							<RT-DO-TAKE ,TH-BRACELET T>
							<FSET ,TH-BRACELET ,FL-WORN>
							<RTRUE>
						)
					>
				)
				(T
					<TELL
"You swim through" the ,TH-BRACELET ". It catches for a moment, but your body
is too slim and you pass right through it." CR
					>
				)
			>
		)
		(<VERB? CUT>
			<COND
				(<IN? ,TH-BRACELET ,CH-KRAKEN>
					<COND
						(<AND <MC-PRSI? ,TH-SWORD>
								<IN? ,TH-SWORD ,CH-PLAYER>
							>
							<RT-KILL-KRAKEN>
						)
					>
				)
			>
		)
		(<AND <VERB? TAKE>
				<IN? ,TH-BRACELET ,RM-FIELD-OF-HONOUR>
				<RT-IS-QUEUED? ,RT-I-LOT-WIN>
			>
			; "Bob"
			<TELL
"Before you can get to" the ,TH-BRACELET ", Lot snatches it up and then runs
you through with his sword.|"
			>
			<RT-END-OF-GAME>
		)
	>
>

;"---------------------------------------------------------------------------"
; "TH-BOAT"
;"---------------------------------------------------------------------------"

<OBJECT TH-BOAT
	(LOC RM-BOAT-ROOM)
	(FLAGS FL-CONTAINER FL-HAS-SDESC FL-NO-DESC FL-OPEN FL-SEARCH)
	(SYNONYM BOAT ROWBOAT HOLE)
	(ADJECTIVE ROW)
	(CAPACITY 150)
	(ACTION RT-TH-BOAT)
>

<ROUTINE RT-TH-BOAT ("OPT" (CONTEXT <>) (ART <>) (CAP? <>))
	<COND
		(<MC-CONTEXT? ,M-OBJDESC>
			<COND
				(.ART
					<PRINT-ARTICLE ,TH-BOAT .ART .CAP?>
				)
			>
			<COND
				(<EQUAL? .ART <> ,K-ART-THE ,K-ART-A ,K-ART-ANY>
					<COND
						(.ART
							<TELL " ">
						)
					>
					<COND
						(<NOUN-USED? ,TH-BOAT ,W?HOLE>
							<TELL "hole">
						)
						(T
							<TELL "boat">
						)
					>
				)
			>
		)
		(<VERB? EXAMINE LOOK-IN>
			<COND
				(<NOUN-USED? ,TH-BOAT ,W?HOLE>
					<TELL "It's a jagged hole that looks man-made." CR>
				)
				(<NOT <IN? ,TH-BOAT ,HERE>>
					<TELL "All you can see from here is a vague outline." CR>
				)
				(T
					<TELL
"It's an old rowboat that looks as if it was deliberately sunk. It contains a
huge stone that has a magnificent sword embedded in it." CR
					>
				)
			>
		)
		(<VERB? ENTER>
			<COND
				(<FSET? ,HERE ,FL-WATER>
					<TELL
"You swim through the hole in the side of the boat, but nothing happens." CR
					>
				)
			>
		)
	>
>

;"---------------------------------------------------------------------------"
; "RM-LAKE-WINDOW"
;"---------------------------------------------------------------------------"

<ROOM RM-LAKE-WINDOW
	(LOC ROOMS)
	(DESC "lake")
	(FLAGS FL-LIGHTED FL-WATER)
	(WEST TO RM-MID-LAKE)
	(EAST PER RT-WINDOW-UP)
	(UP PER RT-WINDOW-UP)
	(ADJACENT <TABLE (PURE LENGTH BYTE) RM-UG-CHAMBER T>)
	(GLOBAL LG-WINDOW LG-LAKE RM-ISLAND)
	(ACTION RT-RM-LAKE-WINDOW)
	(THINGS
		<> (ROCK ROCKS) RT-PS-ROCKS
	)
>

<ROUTINE RT-RM-LAKE-WINDOW ("OPT" (CONTEXT <>))
	<COND
		(<MC-CONTEXT? ,M-F-LOOK ,M-V-LOOK ,M-LOOK>
			<COND
				(<MC-CONTEXT? ,M-LOOK>
					<TELL "You are" walking " near">
				)
				(T
					<TELL "You" walk " towards">
				)
			>
			<FSET ,LG-WINDOW ,FL-SEEN>
			<TELL
" the island. There is a window in the rock through which light is coming.
The middle of the lake lies behind you to the west.|"
			>
			<RFALSE>
		)
		(<MC-CONTEXT? ,M-ENTER>
			<COND
				(<IN? ,CH-NIMUE ,TH-BIER>
					<SETG GL-PICTURE-NUM ,K-PIC-WINDOW-WOMAN>
				)
				(T
					<SETG GL-PICTURE-NUM ,K-PIC-WINDOW>
				)
			>
			<COND
				(<EQUAL? ,GL-WINDOW-TYPE ,K-WIN-PICT>
					<RT-UPDATE-PICT-WINDOW>
				)
			>
			<RFALSE>
		)
		(.CONTEXT
			<RFALSE>
		)
	>
>

<CONSTANT K-ROCKS-STEEP-MSG "The rocks are too steep to climb.|">

<ROUTINE RT-WINDOW-UP ("OPT" (QUIET <>))
	<COND
		(.QUIET
			<RFALSE>
		)
		(T
			<COND
				(<MC-FORM? ,K-FORM-EEL>
					<TELL
The+verb ,WINNER "ascend" " for a quick look around, but see nothing
interesting." CR
					>
				)
				(T
					<TELL ,K-ROCKS-STEEP-MSG>
				)
			>
			<RETURN ,ROOMS>
		)
	>
>

<ROUTINE RT-PS-ROCKS ("OPT" (CONTEXT <>) (ART <>) (CAP? <>))
	<COND
		(<MC-CONTEXT? ,M-OBJDESC>
			<FSET ,PSEUDO-OBJECT ,FL-PLURAL>
			<FCLEAR ,PSEUDO-OBJECT ,FL-VOWEL>
			<COND
				(.ART
					<PRINT-ARTICLE ,PSEUDO-OBJECT .ART .CAP?>
				)
			>
			<COND
				(<EQUAL? .ART <> ,K-ART-THE ,K-ART-A ,K-ART-ANY>
					<COND
						(.ART
							<TELL " ">
						)
					>
					<TELL "rocks">
				)
			>
		)
		(<MC-HERE? ,RM-MID-LAKE>
			<THIS-IS-IT ,PSEUDO-OBJECT>
			<COND
				(<OR  <TOUCH-VERB?>
						<VERB? EXAMINE ENTER>
					>
					<TELL "The rocks lie well to the east." CR>
				)
			>
		)
		(<VERB? EXAMINE>
			<THIS-IS-IT ,PSEUDO-OBJECT>
			<TELL "The sheer rocks rise straight out of the water." CR>
		)
		(<VERB? ENTER>
			<THIS-IS-IT ,LG-WINDOW>
			<TELL "The window is firmly sealed. It can't be opened." CR>
		)
		(<VERB? CLIMB-ON CLIMB-UP CLIMB-OVER>
			<THIS-IS-IT ,PSEUDO-OBJECT>
			<TELL ,K-ROCKS-STEEP-MSG>
		)
	>
>

;"---------------------------------------------------------------------------"
; "LG-WINDOW"
;"---------------------------------------------------------------------------"

<OBJECT LG-WINDOW
	(LOC LOCAL-GLOBALS)
	(DESC "window")
	(SYNONYM WINDOW)
	(ACTION RT-LG-WINDOW)
>

<ROUTINE RT-LG-WINDOW ("OPT" (CONTEXT <>))
	<COND
		(.CONTEXT
			<RFALSE>
		)
		(<VERB? EXAMINE LOOK-THRU LOOK-IN>
			<FSET ,LG-WINDOW ,FL-SEEN>
			<COND
				(<MC-HERE? ,RM-LAKE-WINDOW>
					<FSET ,RM-UG-CHAMBER ,FL-SEEN>
					<FSET ,TH-BIER ,FL-SEEN>
					<TELL "Through the window you see an underground chamber. ">
					<COND
						(<IN? ,CH-NIMUE ,TH-BIER>
							<FSET ,CH-NIMUE ,FL-SEEN>
							<TELL
"Lying on a bier in the middle of the chamber is a beautiful woman." CR
							>
						)
						(T
							<TELL
"In the middle of the chamber is an empty bier." CR
							>
						)
					>
				)
				(T
					<TELL "Through the window you see only water." CR>
				)
			>
		)
		(<VERB? OPEN ENTER>
			<TELL "The window is firmly sealed. It can't be opened." CR>
		)
		(<VERB? BREAK>
			<TELL The ,WINNER " can't break the window." CR>
		)
	>
>

;"---------------------------------------------------------------------------"
; "RM-INLET"
;"---------------------------------------------------------------------------"

<ROOM RM-INLET
	(LOC ROOMS)
	(DESC "lake")
	(FLAGS FL-LIGHTED FL-WATER)
	(NE TO RM-RIVER-3)
	(NW TO RM-MID-LAKE)
	(GLOBAL LG-LAKE RM-RIVER-3)
	(ACTION RT-RM-INLET)
>

<ROUTINE RT-RM-INLET ("OPT" (CONTEXT <>))
	<COND
		(<MC-CONTEXT? ,M-F-LOOK ,M-V-LOOK ,M-LOOK>
			<TELL
"You are swimming in the lake, near where a river enters it from the
northeast. The middle of the lake lies to the northwest.|"
			>
			<RFALSE>
		)
		(<MC-CONTEXT? ,M-ENTER>
			<SETG GL-PICTURE-NUM ,K-PIC-UNDERWATER>
			<COND
				(<EQUAL? ,GL-WINDOW-TYPE ,K-WIN-PICT>
					<RT-UPDATE-PICT-WINDOW>
				)
			>
			<RFALSE>
		)
		(.CONTEXT
			<RFALSE>
		)
	>
>

;"---------------------------------------------------------------------------"
; "LG-LAKE"
;"---------------------------------------------------------------------------"

<OBJECT LG-LAKE
	(LOC LOCAL-GLOBALS)
	(DESC "lake")
	(SYNONYM LAKE WATER)
	(ACTION RT-LG-LAKE)
>

<ROUTINE RT-LG-LAKE ("OPT" (CONTEXT <>))
	<COND
		(.CONTEXT
			<RFALSE>
		)
		(,NOW-PRSI
			<COND
				(<OR	<VERB? THROW THROW-OVER>
						<AND
							<VERB? PUT PUT-IN>
							<VERB-WORD? ,W?THROW ,W?TOSS ,W?HURL ,W?CHUCK ,W?FLING ,W?PITCH ,W?HEAVE>
						>
					>
					<COND
						(<MC-HERE? ,RM-SHALLOWS>
							<COND
								(<NOUN-USED? ,LG-LAKE ,W?LAKE>
									<COND
										(<NOT <IDROP>>
											<RTRUE>
										)
										(T
; "Bob - Do you want >THROW FOO INTO LAKE to remove it?"
											<REMOVE ,PRSO>
											<SETG GL-UPDATE-WINDOW <BOR ,GL-UPDATE-WINDOW ,K-UPD-INVT>>
											<TELL
The+verb ,WINNER "heave" the ,PRSO " into the depths of the lake." CR
											>
										)
									>
								)
								(T
									<PERFORM ,V?DROP ,PRSO>
									<RTRUE>
								)
							>
						)
						(<MC-HERE? ,RM-FIELD-OF-HONOUR>
							<COND
								(<NOT <IDROP>>
									<RTRUE>
								)
								(T
									<RT-THROW-INTO-ROOM-MSG ,PRSO ,RM-SHALLOWS>
								)
							>
						)
						(T
							<NOT-HERE ,PRSI>	; "not close enough"
						)
					>
				)
				(<VERB? PUT PUT-IN>
					<COND
						(<MC-HERE? ,RM-SHALLOWS>
							<PERFORM ,V?DROP ,PRSO>
							<RTRUE>
						)
						(T
							<NOT-HERE ,PRSI>	; "not close enough"
						)
					>
				)
				(<VERB? EMPTY>
					<COND
						(<MC-HERE? ,RM-SHALLOWS>
							<PERFORM ,PRSA ,PRSO ,HERE>
						)
						(T
							<NOT-HERE ,PRSI>	; "not close enough"
						)
					>
				)
			>
		)
		(<VERB? DRINK DRINK-FROM EAT>
			<COND
				(<FSET? ,HERE ,FL-WATER>
					<TELL
The+verb ,WINNER "take" " a small, refreshing sip of water." CR
					>
				)
				(T
					<NOT-HERE ,LG-RIVER>		; "not close enough."
				)
			>
		)
		(<VERB? ENTER WALK-TO>
			<COND
				(<MC-HERE? ,RM-FIELD-OF-HONOUR ,RM-SHALLOWS>
					<RT-DO-WALK ,P?SOUTH>
				)
			>
		)
		(<VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-SHALLOWS>
					<RT-DO-WALK ,P?NORTH>
				)
			>
		)
		(<VERB? EXAMINE>
			<FSET ,LG-LAKE ,FL-SEEN>
			<COND
				(<FSET? ,HERE ,FL-WATER>
					<PERFORM ,V?LOOK>
					<RTRUE>
				)
				(T
					<FSET ,RM-ISLAND ,FL-SEEN>
					<TELL
"It a large lake with an island in the middle of it. A causeway leads out to
the island."
					>
					<COND
						(<NOT <FSET? ,RM-MID-LAKE ,FL-WATER>>
							<TELL
" A magical force is holding back the waters of the lake on either side of a
dry path that leads south"
							>
							<COND
								(<NOT <MC-HERE? ,RM-FIELD-OF-HONOUR>>
									<TELL " from" the ,RM-FIELD-OF-HONOUR>
								)
							>
							<TELL ".">
						)
					>
					<CRLF>
				)
			>
		)
	>
>

;"---------------------------------------------------------------------------"
; "LG-RIVER"
;"---------------------------------------------------------------------------"

<OBJECT LG-RIVER
	(LOC LOCAL-GLOBALS)
	(DESC "river")
	(SYNONYM RIVER WATER)
	(ACTION RT-LG-RIVER)
>

<ROUTINE RT-LG-RIVER ("OPT" (CONTEXT <>))
	<COND
		(.CONTEXT
			<RFALSE>
		)
		(,NOW-PRSI
			<COND
				(<OR	<VERB? THROW THROW-OVER>
						<AND
							<VERB? PUT PUT-IN>
							<VERB-WORD? ,W?THROW ,W?TOSS ,W?HURL ,W?CHUCK ,W?FLING ,W?PITCH ,W?HEAVE>
						>
					>
					<COND
						(<MC-HERE? ,RM-FORD ,RM-EAST-OF-FORD ,RM-WEST-OF-FORD>
							<COND
								(<NOT <IDROP>>
									<RTRUE>
								)
								(<MC-PRSO? ,TH-APPLE>
									<MOVE ,PRSO ,RM-SHALLOWS>
									<TELL
The ,PRSO " quickly" verb ,PRSO "float" " down the river and out of sight." CR
									>
								)
								(T
; "Bob - Do you want >THROW FOO INTO RIVER to remove it?"
									<REMOVE ,PRSO>
									<TELL
The+verb ,WINNER "heave" the ,PRSO " into the depths of the river." CR
									>
								)
							>
						)
						(T
							<NOT-HERE ,PRSI>	; "not close enough"
						)
					>
				)
				(<VERB? PUT PUT-IN>
					<COND
						(<MC-HERE? ,RM-FORD>
							<PERFORM ,V?DROP ,PRSO>
							<RTRUE>
						)
						(T
							<NOT-HERE ,PRSI>	; "not close enough"
						)
					>
				)
				(<VERB? EMPTY>
					<COND
						(<MC-HERE? ,RM-FORD>
							<PERFORM ,PRSA ,PRSO ,HERE>
						)
						(T
							<NOT-HERE ,PRSI>	; "not close enough"
						)
					>
				)
			>
		)
		(<VERB? DRINK DRINK-FROM EAT>
			<COND
				(<FSET? ,HERE ,FL-WATER>
					<TELL
The+verb ,WINNER "take" " a small, refreshing sip of water." CR
					>
				)
				(T
					<NOT-HERE ,LG-RIVER>		; "not close enough."
				)
			>
		)
		(<VERB? ENTER WALK-TO>
			<COND
				(<MC-HERE? ,RM-FORD>
					<RT-DO-WALK ,P?SOUTH>
				)
				(<MC-HERE? ,RM-INLET>
					<RT-DO-WALK ,P?NE>
				)
				(<MC-HERE? ,RM-EAST-OF-FORD>
					<RT-DO-WALK ,P?WEST>
				)
				(<MC-HERE? ,RM-WEST-OF-FORD>
					<RT-DO-WALK ,P?EAST>
				)
			>
		)
		(<VERB? EXIT>
			<COND
				(<MC-HERE? ,RM-RIVER-1>
					<RT-DO-WALK ,P?NORTH>
				)
				(<MC-HERE? ,RM-RIVER-3>
					<RT-DO-WALK ,P?SW>
				)
				(<MC-HERE? ,RM-FORD>
					<V-WALK-AROUND>
				)
			>
		)
	>
>

;"---------------------------------------------------------------------------"
; "RM-RIVER-3"
;"---------------------------------------------------------------------------"

<ROOM RM-RIVER-3
	(LOC ROOMS)
	(DESC "river")
	(FLAGS FL-LIGHTED FL-WATER)
	(NORTH TO RM-RIVER-2)
	(SW TO RM-INLET)
	(GLOBAL LG-RIVER RM-INLET)
	(ACTION RT-RM-RIVER-3)
	(THINGS
		<> (MINNOW MINNOWS) RT-PS-MINNOWS
   )
>

<ROUTINE RT-RM-RIVER-3 ("OPT" (CONTEXT <>))
	<COND
		(<MC-CONTEXT? ,M-F-LOOK ,M-V-LOOK ,M-LOOK>
			<COND
				(<MC-CONTEXT? ,M-LOOK>
					<TELL "You are" walking " in">
				)						
				(T
					<TELL "You" walk>
					<COND
						(<EQUAL? ,OHERE ,RM-INLET>
							<TELL " against the current into">
						)
						(T
							<TELL " with the current down">
						)
					>
				)
			>
			<TELL
" the river, where it takes a bend from the north to the southwest."
			>
			<COND
				(<NOT <MC-CONTEXT? ,M-LOOK>>
					<TELL " A school of minnows scurries out of your way">
					<COND
						(<IN? ,TH-MINNOW ,RM-RIVER-3>
							<FSET ,TH-MINNOW ,FL-SEEN>
							<RT-QUEUE ,RT-I-MINNOW <+ ,GL-MOVES 1>>
							<TELL ", but ">
							<COND
								(<MC-FORM? ,K-FORM-EEL>
									<TELL "a " ,K-TASTY-MSG>
								)
							>
							<TELL "one lags behind">
						)
					>
					<TELL ".">
				)
			>
			<CRLF>
			<RETURN <NOT <MC-CONTEXT? ,M-LOOK>>>
		)
		(<MC-CONTEXT? ,M-ENTER>
			<SETG GL-PICTURE-NUM ,K-PIC-UNDERWATER>
			<COND
				(<EQUAL? ,GL-WINDOW-TYPE ,K-WIN-PICT>
					<RT-UPDATE-PICT-WINDOW>
				)
			>
			<COND
				(<NOT <FSET? ,TH-MINNOW ,FL-LOCKED>>
					<MOVE ,TH-MINNOW ,RM-RIVER-3>
					<RT-QUEUE ,RT-I-MINNOW <+ ,GL-MOVES 1>>
				)
			>
			<RFALSE>
		)
		(.CONTEXT
			<RFALSE>
		)
	>
>

<ROUTINE RT-PS-MINNOWS ("OPT" (CONTEXT <>) (ART <>) (CAP? <>))
	<COND
		(<MC-CONTEXT? ,M-OBJDESC>
			<FSET ,PSEUDO-OBJECT ,FL-PLURAL>
			<FCLEAR ,PSEUDO-OBJECT ,FL-VOWEL>
			<COND
				(.ART
					<PRINT-ARTICLE ,PSEUDO-OBJECT .ART .CAP?>
				)
			>
			<COND
				(<EQUAL? .ART <> ,K-ART-THE ,K-ART-A ,K-ART-ANY>
					<COND
						(.ART
							<TELL " ">
						)
					>
					<TELL "minnows">
				)
			>
		)
		(.CONTEXT
			<RFALSE>
		)
		(<NOT <EVERYWHERE-VERB? <COND (,NOW-PRSI 2) (T 1)>>>
			<THIS-IS-IT ,PSEUDO-OBJECT>
			<TELL "All">
			<COND
				(<IN? ,TH-MINNOW ,RM-RIVER-3>
					<THIS-IS-IT ,TH-MINNOW>
					<TELL " but one">
				)
			>
			<TELL " of the minnows are gone." CR>
		)
	>
>

;"---------------------------------------------------------------------------"
; "RM-RIVER-2"
;"---------------------------------------------------------------------------"

<ROOM RM-RIVER-2
	(LOC ROOMS)
	(DESC "river")
	(FLAGS FL-LIGHTED FL-WATER)
	(NORTH TO RM-RIVER-1)
	(SOUTH TO RM-RIVER-3)
	(GLOBAL LG-RIVER)
	(ACTION RT-RM-RIVER-1)
>

;"---------------------------------------------------------------------------"
; "RM-RIVER-1"
;"---------------------------------------------------------------------------"

<ROOM RM-RIVER-1
	(LOC ROOMS)
	(DESC "river")
	(FLAGS FL-LIGHTED FL-WATER)
	(NORTH TO RM-FORD)
	(SOUTH TO RM-RIVER-2)
	(GLOBAL LG-RIVER RM-FORD)
	(ACTION RT-RM-RIVER-1)
>

<ROUTINE RT-RM-RIVER-1 ("OPT" (CONTEXT <>))
	<COND
		(<MC-CONTEXT? ,M-F-LOOK ,M-V-LOOK ,M-LOOK>
			<TELL
"You are" walking " in the river, which flows from north to south.|"
			>
			<RFALSE>
		)
		(<MC-CONTEXT? ,M-ENTER>
			<SETG GL-PICTURE-NUM ,K-PIC-UNDERWATER>
			<COND
				(<EQUAL? ,GL-WINDOW-TYPE ,K-WIN-PICT>
					<RT-UPDATE-PICT-WINDOW>
				)
			>
			<RFALSE>
		)
		(.CONTEXT
			<RFALSE>
		)
	>
>

;"---------------------------------------------------------------------------"
; "RM-ABOVE-LAKE"
;"---------------------------------------------------------------------------"

<ROOM RM-ABOVE-LAKE
	(LOC ROOMS)
	(DESC "above the lake")
	(FLAGS FL-AIR FL-LIGHTED)
	(DOWN PER RT-FLY-DOWN)
	(NORTH TO RM-ABOVE-FIELD)
	(UP SORRY K-NO-HIGHER-MSG)
	(GLOBAL LG-LAKE RM-ISLAND RM-FIELD-OF-HONOUR)
	(ACTION RT-RM-ABOVE-LAKE)
>

<ROUTINE RT-RM-ABOVE-LAKE ("OPT" (CONTEXT <>))
	<COND
		(<MC-CONTEXT? ,M-F-LOOK ,M-V-LOOK ,M-LOOK>
			<FSET ,LG-LAKE ,FL-SEEN>
			<FSET ,RM-FIELD-OF-HONOUR ,FL-SEEN>
			<TELL
"You are hovering over the lake. Below you to the north you see the Field of
Honour.|"
			>
			<RFALSE>
		)
		(<MC-CONTEXT? ,M-ENTER>
			<SETG GL-PICTURE-NUM ,K-PIC-AIR-SCENE>
			<COND
				(<EQUAL? ,GL-WINDOW-TYPE ,K-WIN-PICT>
					<RT-UPDATE-PICT-WINDOW>
				)
			>
			<RFALSE>
		)
		(.CONTEXT
			<RFALSE>
		)
	>
>

;"***************************************************************************"
; "end of file"
;"***************************************************************************"

