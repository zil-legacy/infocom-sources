;"***************************************************************************"
; "game : Arthur"
; "file : IDIOT.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   05 May 1989  1:09:16  $"
; "rev  : $Revision:   1.77  $"
; "vers : 1.0"
;"---------------------------------------------------------------------------"
; "Town square/Village idiot"
; "Copyright (C) 1988 Infocom, Inc.  All rights reserved."
;"***************************************************************************"

;"---------------------------------------------------------------------------"
; "RM-TOWN-SQUARE"
;"---------------------------------------------------------------------------"

<ROOM RM-TOWN-SQUARE
	(LOC ROOMS)
	(DESC "town square")
	(FLAGS FL-LIGHTED)
	(SYNONYM SQUARE)
	(ADJECTIVE TOWN)
	(NORTH TO RM-CHURCHYARD IF LG-CHURCH-GATE IS OPEN)
	(WEST TO RM-VILLAGE-GREEN)
	(EAST TO RM-CASTLE-GATE)
	(SOUTH TO RM-TAVERN)
	(IN TO RM-TAVERN)
	(UP PER RT-FLY-UP)
	(ADJACENT <TABLE (LENGTH BYTE PURE) RM-CHURCHYARD T>)
	(GLOBAL LG-THATCH LG-CHURCH-GATE LG-TOWN LG-CASTLE RM-TAVERN RM-CHURCHYARD RM-CHURCH RM-VILLAGE-GREEN)
	(ACTION RT-RM-TOWN-SQUARE)
>

<ROUTINE RT-RM-TOWN-SQUARE ("OPT" (CONTEXT <>) "AUX" (OBJ1 <>) (OBJ2 <>) N)
	<COND
		(<MC-CONTEXT? ,M-ENTER>
			<SETG GL-PICTURE-NUM ,K-PIC-TOWN-SQUARE>
			<COND
				(<EQUAL? ,GL-WINDOW-TYPE ,K-WIN-PICT>
					<RT-UPDATE-PICT-WINDOW>
				)
			>
			<COND
				(<IN? ,TH-ARMOUR ,CH-I-KNIGHT>
					<SET OBJ1 ,TH-ARMOUR>
				)
				(<IN? ,TH-SHIELD ,CH-I-KNIGHT>
					<SET OBJ1 ,TH-SHIELD>
				)
				(<IN? ,TH-PUMICE ,CH-I-KNIGHT>
					<SET OBJ1 ,TH-PUMICE>
				)
				(<IN? ,TH-IVORY-KEY ,CH-I-KNIGHT>
					<SET OBJ1 ,TH-IVORY-KEY>
				)
			>
			<COND
				(.OBJ1
					<COND
						(<IN? ,TH-ARMOUR ,CH-IDIOT>
							<SET OBJ2 ,TH-ARMOUR>
						)
						(<IN? ,TH-SHIELD ,CH-IDIOT>
							<SET OBJ2 ,TH-SHIELD>
						)
						(<IN? ,TH-PUMICE ,CH-IDIOT>
							<SET OBJ2 ,TH-PUMICE>
						)
						(<IN? ,TH-IVORY-KEY ,CH-IDIOT>
							<SET OBJ2 ,TH-IVORY-KEY>
						)
					>
					<COND
						(.OBJ2
							<RT-IDIOT-GIVE .OBJ2 ,CH-I-KNIGHT>
						)
					>
					<RT-IDIOT-TAKE .OBJ1>
					<FSET ,CH-I-KNIGHT ,FL-BROKEN>
				)
			>
			<RFALSE>
		)
		(<MC-CONTEXT? ,M-ENTERED>
			<RT-QUEUE ,RT-I-IDIOT-MSG ,GL-MOVES>
		)
		(<MC-CONTEXT? ,M-EXIT>
			<RT-DEQUEUE ,RT-I-IDIOT-MSG>
			<RFALSE>
		)
		(<MC-CONTEXT? ,M-BEG>
			<COND
				(<NOT <RT-IS-QUEUED? ,RT-I-IDIOT-MSG>>
					<RT-QUEUE ,RT-I-IDIOT-MSG ,GL-MOVES>
				)
			>
			<SETG GL-IDIOT-MSG T>
			<RFALSE>
		)
		(<MC-CONTEXT? ,M-F-LOOK ,M-V-LOOK ,M-LOOK>
			<COND
				(<MC-CONTEXT? ,M-LOOK>
					<TELL The+verb ,WINNER "are" standing " in">
				)
				(T
					<TELL The ,WINNER walk " into">
				)
			>
			<FSET ,LG-CASTLE ,FL-SEEN>
			<FSET ,RM-TAVERN ,FL-SEEN>
			<FSET ,RM-VILLAGE-GREEN ,FL-SEEN>
			<FSET ,CH-IDIOT ,FL-SEEN>
			<THIS-IS-IT ,CH-IDIOT>
			<TELL
" the town square. The churchyard lies to the north, and the castle to the
east. To your south you see the entrance to the town's only tavern, and to
the west is the village green.||The village idiot is here, idly playing with"
			>
			<RT-IDIOT-PLAY-MSG>
			<COND
				(<OR	<MC-CONTEXT? ,M-F-LOOK ,M-V-LOOK>
						<VERB? LOOK>
					>
					<COND
						(<NOT <RT-I-IDIOT-MSG T>>
							<CRLF>
						)
					>
				)
				(T
					<CRLF>
				)
			>
			<RFALSE>
		)
		(<MC-CONTEXT? ,M-END>
			<COND
				(<AND <VERB? TRANSFORM>
						<NOT <MC-FORM? ,GL-OLD-FORM>>
					>
					<SETG GL-IDIOT-MSG <>>
					<THIS-IS-IT ,CH-IDIOT>
					<TELL
CR The ,CH-IDIOT " placidly accepts your transformation and drools on you." CR
					>
				)
			>
		)
		(.CONTEXT
			<RFALSE>
		)
	>
>

;"---------------------------------------------------------------------------"
; "CH-IDIOT"
;"---------------------------------------------------------------------------"

<OBJECT CH-IDIOT
	(LOC RM-TOWN-SQUARE)
	(DESC "idiot")
	(FLAGS FL-ALIVE FL-NO-LIST FL-OPEN FL-PERSON FL-SEARCH)
	(SYNONYM IDIOT BOY PERSON MAN FLOYD)
	(ADJECTIVE VILLAGE)
	(CONTFCN RT-CH-IDIOT)
	(ACTION RT-CH-IDIOT)
>

<CONSTANT K-IDIOT-TRADE-MSG "\"We could trade if you want.\"">

<ROUTINE RT-CH-IDIOT ("OPT" (CONTEXT <>) "AUX" OTHER (OBJ <>) N)
	<COND
		(<AND <MC-CONTEXT? ,M-WINNER <>>
				<VERB? HELLO GOODBYE THANK>
			>
			<COND
				(<VERB? HELLO>
					<SETG GL-IDIOT-MSG <>>
					<TELL
"The idiot says brightly, \"Hello!\" and looks at you expectantly." CR
					>
				)
				(<VERB? GOODBYE>
					<SETG GL-IDIOT-MSG <>>
					<TELL
"A cloud passes over the idiot's face. \"Goodbye,\" he says sadly." CR
					>
				)
				(<VERB? THANK>
					<SETG GL-IDIOT-MSG <>>
					<TELL "The idiot smiles brightly and says, \"OK.\"" CR>
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
					<RT-IDIOT-WHISPERS-MSG>
				)
			>
		)
		(<MC-CONTEXT? ,M-CONT>
			<COND
				(<AND <VERB? ASK-FOR>
						<MC-PRSO? ,CH-IDIOT>
						,NOW-PRSI
					>
					<SETG GL-IDIOT-MSG <>>
					<TELL ,K-IDIOT-TRADE-MSG CR>
				)
				(<AND <VERB? ASK-ABOUT>
						<MC-PRSO? ,CH-IDIOT>
						,NOW-PRSI
					>
					<SETG GL-IDIOT-MSG <>>
					<TELL
"\"I got" him ,PRSI " from my Invisible Playmate,\" he says, giving" him ,PRSI
" a little kick with his foot. " ,K-IDIOT-TRADE-MSG CR
					>
				)
				(<VERB? TRADE-FOR>
					<COND
						(<MC-PRSO? ,CH-IDIOT>
							<RFALSE>
						)
						(,NOW-PRSI
							<RT-IDIOT-TRADE ,PRSO ,PRSI>
						)
						(T
							<RT-IDIOT-TRADE ,PRSI ,PRSO>
						)
					>
				)
				(<TOUCH-VERB?>
					<SETG GL-IDIOT-MSG <>>
					<THIS-IS-IT ,CH-IDIOT>
					<TELL
The ,CH-IDIOT " smacks you on the head and says, \"Nasty" form ". Keep away
from my "
					>
					<COND
						(,NOW-PRSI
							<TELL D ,PRSI>
						)
						(T
							<TELL D ,PRSO>
						)
					>
					<TELL ".\"" CR>
				)
			>
		)
		(.CONTEXT
			<RFALSE>
		)
		(,NOW-PRSI
			<COND
				(<VERB? GIVE TRADE-WITH SHOW>
					<RT-IDIOT-TRADE ,PRSO>
				)
			>
		)
		(<AND <VERB? TELL>
				,P-CONT
			>
			<RFALSE>
		)
		(<VERB? EXAMINE>
			<FSET ,CH-IDIOT ,FL-SEEN>
			<TELL
"The idiot smiles back at you with a lopsided grin, and continues to play with"
			>
			<RT-IDIOT-PLAY-MSG>
			<COND
				(<NOT <RT-I-IDIOT-MSG T>>
					<CRLF>
				)
			>
			<RTRUE>
		)
		(<VERB? LISTEN>
			<RT-I-IDIOT-MSG>
		)
		(<VERB? ASK-ABOUT>
			<COND
				(<MC-PRSI? ,CH-LOT>
					<TELL "The idiot frowns and says, \"He's not a very nice man.\"" CR>
				)
				(<MC-PRSI? ,CH-MERLIN>
					<TELL
"The idiot smiles and says, \"He's silly. Sometimes he turns me into a frog.\"" CR
					>
				)
				(<MC-PRSI? ,CH-I-KNIGHT>
					<TELL "\"Sometimes he brings me presents, and we trade for them.\"" CR>
				)
				(<MC-PRSI? ,TH-SHERLOCK>
					<TELL "\"It was lots of fun. I got to drive the growler cab.\"" CR>
				)
				(<MC-PRSI? ,ZORK>
					<TELL
"\"I fell asleep in the kitchen and when I woke up, the game was over.\"" CR
					>
				)
				(<MC-PRSI? ,INFOCOM>
					<TELL "\"Somehow, I seem to fit right in.\"" CR>
				)
				(<MC-PRSI? ,CH-IDIOT>
					<TELL
"\"Hi! My name's Floyd. Ducks go quack and geese go honk. Your name's Arthur,
but I'm not supposed to know that because I'm an idiot.\"" CR
					>
				)
				(<MC-PRSI? ,CH-COOK>
					<TELL
"\"He's only there to make the game harder. But don't tell him I said so.\"" CR
					>
				)
				(T
					<RT-IDIOT-WHISPERS-MSG>
				)
			>
		)
		(<AND <SPEAKING-VERB?>
				<IN? ,CH-IDIOT ,HERE>
			>
			<RT-IDIOT-WHISPERS-MSG>
		)
		(<VERB? ASK-FOR>
			<SETG GL-IDIOT-MSG <>>
			<TELL
The+verb ,CH-IDIOT "look" " puzzled, and says, \"I'd give" him ,PRSI " to
you, but I don't have" him ,PRSI ".\"" CR
			>
		)
		(<VERB? ATTACK>
			<COND
				(<MC-FORM? ,K-FORM-ARTHUR>
					<MOVE ,CH-MERLIN ,HERE>
					<TELL
"The idiot is powerless to stop your attack, and you slay him mercilessly. "
,K-MERLIN-WASTED-MSG CR
					>
					<RT-END-OF-GAME>
				)
			>
		)
		(<VERB? EAT>
			<TELL
"You gnaw briefly on the idiot's leg, but quit when he begins to put salt
and pepper on your"
			>
			<COND
				(<MC-FORM? ,K-FORM-ARTHUR>
					<TELL "arm">
				)
				(T
					<TELL "tail">
				)
			>
			<TELL "." CR>
		)
	>
>

<ROUTINE RT-IDIOT-PLAY-MSG ("AUX" N (OBJ <>))
	<SET N <ZGET ,K-IDIOT-OBJ-TBL 0>>
	<REPEAT ((I 0) (1ST? T))
		<COND
			(<IGRTR? I .N>
				<RETURN>
			)
			(T
				<COND
					(.1ST?
						<SET 1ST? <>>
					)
					(T
						<TELL comma <NOT <EQUAL? .I .N>>>
					)
				>
				<SET OBJ <ZGET ,K-IDIOT-OBJ-TBL .I>>
				<TELL a .OBJ>
			)
		>
	>
	<TELL " that lie">
	<COND
		(<AND <EQUAL? .N 1>
				.OBJ
				<OR
					<NOT <FSET? .OBJ ,FL-PLURAL>>
					<FSET? .OBJ ,FL-COLLECTIVE>
				>
			>
			<TELL "s">
		)
	>
	<TELL " at his feet.">
>

<ROUTINE RT-IDIOT-WHISPERS-MSG ()
	<SETG GL-IDIOT-MSG <>>
	<TELL
"The idiot looks around to make sure no one is watching the two of you.
Beckoning you to come closer, he whispers in your ear,"
<RT-PICK-NEXT ,K-IDIOT-MSG-TBL> CR
	>
>

<GLOBAL GL-IDIOT-MSG:FLAG T <> BYTE>

<CONSTANT K-IDIOT-MSG-TBL
	<TABLE (PATTERN (BYTE WORD))
		<BYTE 1>
		<TABLE (PURE LENGTH)
			" \"Beware the Invisible Knight.\""
			" \"Wherever I go, there I am.\""
			" \"King Lot is a greedy goat.\""
			" \"I'm not really an idiot. I'm just extremely stupid.\""
			" \"Sometimes my invisible playmate gives me things.\""
			"|   \"Roses are red,|    Violets are blue.|    I'm schizophrenic,|    And so am I.\""
			" \"When the tough get tough, the going get going.\""
		>
	>
>

<GLOBAL GL-IDIOT-WAIT:FLAG <> <> BYTE>

<ROUTINE RT-I-IDIOT-MSG ("OPT" (SP? <>))
	<COND
		(<NOT <MC-HERE? ,RM-TOWN-SQUARE>>
			<RFALSE>
		)
		(<AND <VERB? WAIT>
				,GL-IDIOT-WAIT
			>
			<RFALSE>
		)
	>
	<COND
		(<FSET? ,CH-PLAYER ,FL-ASLEEP>
			<RT-QUEUE ,RT-I-IDIOT-MSG <+ <RT-IS-QUEUED? ,RT-I-SLEEP> 1>>
			<RFALSE>
		)
		(,GL-CLK-RUN
			<RT-QUEUE ,RT-I-IDIOT-MSG <+ ,GL-MOVES 1>>
		)
	>
	<COND
		(<VERB? WAIT>
			<SETG GL-IDIOT-WAIT T>
			;"Bob"
			<THIS-IS-IT ,CH-IDIOT>
			<TELL
"|While you wait," the ,CH-IDIOT " mumbles quietly to himself." CR
			>
			<RFALSE>
		)
		(,GL-IDIOT-MSG
			<SETG GL-IDIOT-WAIT <>>
			<THIS-IS-IT ,CH-IDIOT>
			<COND
				(,GL-CLK-RUN
					<TELL CR The ,CH-IDIOT>
				)
				(T
					<SETG GL-IDIOT-MSG <>>
					<COND
						(.SP?
							<TELL " ">
						)
					>
					<TELL He ,CH-IDIOT>
				)
			>
			<TELL " mumbles," <RT-PICK-NEXT ,K-IDIOT-MSG-TBL> CR>
		)
	>
>

<CONSTANT K-IDIOT-OBJ-MAX 5>	; "Max num of objs in K-IDIOT-OBJ-TBL"
<CONSTANT K-IDIOT-BYTE-MAX <* ,K-IDIOT-OBJ-MAX 2>>
<CONSTANT K-IDIOT-OBJ-TBL
	<TABLE
		1
		TH-DEAD-MOUSE
		0
		0
		0
		0
	>
>

<ROUTINE RT-IDIOT-TRADE (OBJ "OPT" (ID <>))
	<COND
		(<NOT .ID>
			<SET ID <ZGET ,K-IDIOT-OBJ-TBL <RANDOM <ZGET ,K-IDIOT-OBJ-TBL 0>>>>
		)
	>
	<COND
		(<EQUAL? .OBJ .ID>
			<SETG GL-IDIOT-MSG <>>
			<TELL The ,CH-IDIOT " looks puzzled." CR>
			<RT-AUTHOR-MSG "Stop trying to confuse the poor boy.">
		)
		(<IN? .OBJ ,CH-IDIOT>
			<SETG GL-IDIOT-MSG <>>
			<TELL
The ,CH-IDIOT " carefully exchanges" the .OBJ " with" the .ID "." CR
			>
			<RT-AUTHOR-MSG "The idiot isn't as dumb as you look.">
		)
		(<NOT <FSET? .OBJ ,FL-TAKEABLE>>
		; "Bob"
			<SETG GL-IDIOT-MSG <>>
			<TELL
The ,CH-IDIOT " says, \"Hey, you can't trade" the .OBJ ".\"" CR
			>
		)
		(<RT-NOT-HOLDING-MSG? .OBJ>
			T
		)
		(T
			<RT-IDIOT-GIVE .ID>
			<RT-IDIOT-TAKE .OBJ>
			<SETG GL-IDIOT-MSG <>>
			<TELL
"\"Oooh look! " A .OBJ "!\" " The ,CH-IDIOT " takes" the .OBJ " and gives
you" the .ID "." CR
			>
			<SETG GL-UPDATE-WINDOW <BOR ,GL-UPDATE-WINDOW ,K-UPD-INVT ,K-UPD-DESC>>
			<COND
				(<EQUAL? ,GL-WINDOW-TYPE ,K-WIN-INVT>
					<RT-UPDATE-INVT-WINDOW>
				)
				(<EQUAL? ,GL-WINDOW-TYPE ,K-WIN-DESC>
					<RT-UPDATE-DESC-WINDOW>
				)
			>
			<RTRUE>
		)
	>
>

<ROUTINE RT-IDIOT-TAKE (OBJ "AUX" N)
	<MOVE .OBJ ,CH-IDIOT>
	<FSET .OBJ ,FL-NO-LIST>
	<SET N <+ <ZGET ,K-IDIOT-OBJ-TBL 0> 1>>
	<ZPUT ,K-IDIOT-OBJ-TBL 0 .N>
	<ZPUT ,K-IDIOT-OBJ-TBL .N .OBJ>
>

<ROUTINE RT-IDIOT-GIVE (OBJ "OPT" (PERSON ,CH-PLAYER) "AUX" L N PTR)
	<MOVE .OBJ .PERSON>
	<FCLEAR .OBJ ,FL-NO-LIST>
	<SET N <ZGET ,K-IDIOT-OBJ-TBL 0>>
	<COND
		(<SET PTR <INTBL? .OBJ <ZREST ,K-IDIOT-OBJ-TBL 2> .N>>
			<COND
				(<G? <SET L <- <ZREST ,K-IDIOT-OBJ-TBL ,K-IDIOT-BYTE-MAX> .PTR>> 0>
					<COPYT <ZREST .PTR 2> .PTR .L>
				)
			>
			<ZPUT ,K-IDIOT-OBJ-TBL ,K-IDIOT-OBJ-MAX 0>
			<ZPUT ,K-IDIOT-OBJ-TBL 0 <- .N 1>>
		)
	>
>

;"***************************************************************************"
; "end of file"
;"***************************************************************************"

