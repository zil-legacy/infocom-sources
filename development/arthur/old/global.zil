;"***************************************************************************"
; "game : Arthur"
; "file : GLOBAL.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   02 May 1989 13:37:36  $"
; "rev  : $Revision:   1.106  $"
; "vers : 1.0"
;"---------------------------------------------------------------------------"
; "Global objects"
; "Copyright (C) 1988 Infocom, Inc.  All rights reserved."
;"***************************************************************************"

<OBJECT ROOMS
	(DESC "that")
	(FLAGS FL-NO-ARTICLE ;FL-ROOMS)
>

<OBJECT GLOBAL-OBJECTS
	(DESC "GO")
	(FDESC 0)
	(GENERIC 0)
	(GLOBAL 0)
	(OWNER 0)
	(TEXT 0)
	(THINGS 0)
	(SIZE 0 CAPACITY 0)
	(FLAGS
		FL-AIR				;  1
		FL-ALIVE				;  2
		FL-ASLEEP			;  3
		FL-AUTO-ENTER		;  4
		FL-AUTO-OPEN		;  5
		FL-BODY-PART		;  6
		FL-BROKEN			;  7
		FL-BURNABLE			;  8
		FL-BY-HAND			;  9
		FL-CLOTHING			; 10
		FL-COLLECTIVE		; 11
		FL-CONTAINER		; 12
		FL-DOOR				; 13
		FL-FEMALE			; 14
		FL-FOOD				; 15
		;FL-HAS-LDESC		; 16
		FL-HAS-SDESC		; 17
		FL-INDOORS			; 18
		FL-INVISIBLE		; 19
		FL-KEY				; 20
		FL-KNIFE				; 21
		FL-LAMP				; 22
		FL-LIGHTED			; 23
		FL-LOCKED			; 24
		FL-NO-ALL			; 25
		FL-NO-ARTICLE		; 26
		FL-NO-DESC			; 27
		FL-NO-LIST			; 28
		FL-OPEN				; 29
		FL-OPENABLE			; 30
		FL-PERSON			; 31
		FL-PLURAL			; 32
		FL-READABLE			; 33
	;	FL-ROOMS				; 34
		FL-SEARCH			; 35
		FL-SEEN				; 36
		FL-SURFACE			; 37
		FL-TAKEABLE			; 38
		FL-TOOL				; 39
		FL-TOUCHED			; 40
		FL-TRANSPARENT		; 41
		FL-TRY-TAKE			; 42
		FL-VEHICLE			; 43
		FL-VOWEL				; 44
		FL-WATER				; 45
		FL-WEAPON			; 46
		FL-WORN				; 47
		FL-YOUR				; 48
	)
>

<OBJECT LOCAL-GLOBALS
	(LOC GLOBAL-OBJECTS)
	(DESC "LG")
	(SYNONYM L.G)
	(FLAGS FL-NO-ARTICLE)
>

<OBJECT GLOBAL-HERE
	(LOC GLOBAL-OBJECTS)
	(DESC "here")
	(FLAGS FL-NO-ARTICLE)
	(SYNONYM HERE PLACE ROOM AREA)
	(ACTION RT-GLOBAL-HERE)
>

<ROUTINE RT-GLOBAL-HERE ("OPT" (CONTEXT <>) "AUX" P)
	<COND
		(,HERE
			<COND
				(<SET P <GETP ,HERE ,P?ACTION>>
					<APPLY .P .CONTEXT>
				)
			>
		)
	>
>

<OBJECT IT
	(LOC GLOBAL-OBJECTS)
	(DESC "it")
	(SYNONYM IT THIS)
	(FLAGS FL-VOWEL FL-NO-ARTICLE)
>

<OBJECT THEM
	(LOC GLOBAL-OBJECTS)
	(DESC "them")
	(SYNONYM THEM)
	(FLAGS FL-NO-ARTICLE FL-PLURAL)
>

<OBJECT INTNUM
	(LOC GLOBAL-OBJECTS)
	(DESC "number")
	(SYNONYM INT.NUM)
>

<OBJECT YOU
	(LOC GLOBAL-OBJECTS)
	(DESC "you")
	(SYNONYM YOU YOURSELF)
	(ACTION RT-YOU)
>

<ROUTINE RT-YOU ("OPT" (CONTEXT <>))
	<COND
		(.CONTEXT
			<RFALSE>
		)
		(,NOW-PRSI
			<PERFORM ,PRSA ,PRSO ,WINNER>
		)
		(T
			<PERFORM ,PRSA ,WINNER ,PRSI>
		)
	>
>

<OBJECT HER
	(LOC GLOBAL-OBJECTS)
	(SYNONYM HER)
	(DESC "her")
	(FLAGS FL-NO-ARTICLE)
>

<OBJECT HIM
	(LOC GLOBAL-OBJECTS)
	(SYNONYM HIM)
	(DESC "him")
	(FLAGS FL-NO-ARTICLE)
>

;"---------------------------------------------------------------------------"
; "TH-HUMAN-BODY"
;"---------------------------------------------------------------------------"

<OBJECT TH-HUMAN-BODY
	(LOC GLOBAL-OBJECTS)
	(DESC "their body")
	(FLAGS FL-HAS-SDESC FL-NO-ARTICLE)
	(SYNONYM
		BODY
		SKIN
		ARM ARMS
		HAND HANDS
		LEG LEGS
		ANKLE ANKLES
		FOOT FEET
		HEAD
		HAIR
		EYE EYES
		EAR EARS
		NOSE
		FACE
		CHEEK CHEEKS
		LIP LIPS
		MOUTH
		NECK
		SHOULDER SHOULDERS
		CHEST
		TORSO
		BACK
	;	WAIST
	)
	(ADJECTIVE LEFT RIGHT)
	(OWNER K-BODY-OWNER-TBL)
	(GENERIC RT-GN-BODY)
	(ACTION RT-TH-HUMAN-BODY)
>

<CONSTANT K-BODY-OWNER-TBL
	<TABLE (PURE LENGTH)
		CH-BLACK-KNIGHT
		CH-BLUE-KNIGHT
		CH-CELL-GUARD
		CH-COOK
		CH-DEMON
		CH-FARMERS
		CH-GIRL
		CH-I-KNIGHT
		CH-IDIOT
		CH-LOT
		CH-MERLIN
		CH-NIMUE
		CH-PEASANT
		CH-PRISONER
		CH-RED-KNIGHT
		CH-RHYMER
		CH-SOLDIERS
	>
>

<CONSTANT K-NO-REFER-MSG "[You don't need to refer to ">

<ROUTINE RT-TH-HUMAN-BODY ("OPT" (CONTEXT <>) "AUX" (PERSON <>))
	<COND
		(.CONTEXT
			<RFALSE>
		)
		(T
			<COND
				(<AND <SET PERSON <GET-OWNER ,TH-HUMAN-BODY>>
						<NOT <VISIBLE? .PERSON>>
					>
					<NP-CANT-SEE>
				)
				(T
					<TELL ,K-NO-REFER-MSG>
					<COND
						(<EQUAL? .PERSON
								,CH-PRISONER
								,CH-DEMON
								,CH-GIRL
								,CH-PEASANT
								,CH-NIMUE
							>
							<TELL "that">
						)
						(T
							<TELL "any">
						)
					>
					<TELL " part of">
					<COND
						(.PERSON
							<TELL the .PERSON "'">
							<COND
								(<OR	<NOT <FSET? .PERSON ,FL-PLURAL>>
										<FSET? .PERSON ,FL-COLLECTIVE>
									>
									<TELL "s">
								)
							>
						)
						(T
							<TELL " their">
						)
					>
					<TELL " body.]" CR>
				)
			>
			<RFATAL>
		)
	>
>

<ROUTINE RT-GN-BODY (TBL FINDER "AUX" (PART <>))
	<REPEAT (
			(PTR <REST-TO-SLOT .TBL FIND-RES-OBJ1>)
			(N <FIND-RES-COUNT .TBL>)
		)
		<COND
			(<DLESS? N 0>
				<RFALSE>
			)
			(<NOT <SET PART <ZGET .PTR 0>>>)
			(<FSET? .PART ,FL-YOUR>
				<RETURN>
			)
			(<EQUAL? .PART ,TH-PLAYER-BODY ,TH-ANIMAL-BODY>
				<RETURN>
			)
			(<NOT <EQUAL? .PART ,TH-HUMAN-BODY>>
				<RETURN>
			)
		>
		<SET PTR <ZREST .PTR 2>>
	>
	<RETURN .PART>
>

;"---------------------------------------------------------------------------"
; "TH-PLAYER-BODY"
;"---------------------------------------------------------------------------"

<OBJECT TH-PLAYER-BODY
	(LOC GLOBAL-OBJECTS)
	(DESC "body")
	(FLAGS FL-BODY-PART FL-YOUR)
	(SYNONYM
		BODY
		SKIN
		ARM ARMS
		ANKLE ANKLES
		FOOT FEET
		HAIR
		EYE EYES
		EAR EARS
		NOSE
		FACE
		CHEEK CHEEKS
		LIP LIPS
		TONGUE
		NECK
		SHOULDER SHOULDERS
		CHEST
		TORSO
		BACK
		WAIST
	)
	(ADJECTIVE LEFT RIGHT)
	(OWNER CH-PLAYER)
	(GENERIC RT-GN-BODY)
	(ACTION RT-TH-PLAYER-BODY)
>

<ROUTINE RT-TH-PLAYER-BODY ("OPT" (CONTEXT <>))
	<COND
		(.CONTEXT
			<RFALSE>
		)
		(<AND <NOT <MC-FORM? ,K-FORM-ARTHUR>>
				<NOUN-USED? ,TH-PLAYER-BODY ,W?ARM ,W?ARMS>
			>
			<RT-NO-BODY-PART-MSG ,TH-PLAYER-BODY>
		)
		(T
			<TELL ,K-NO-REFER-MSG "that part of your body.]" CR>
			<RFATAL>
		)
	>
>

;"---------------------------------------------------------------------------"
; "TH-ANIMAL-BODY"
;"---------------------------------------------------------------------------"

<OBJECT TH-ANIMAL-BODY
	(LOC GLOBAL-OBJECTS)
	(DESC "body")
	(FLAGS FL-BODY-PART FL-YOUR)
	(SYNONYM
		FUR COAT FEATHER FEATHERS
		WING WINGS
		FIN FINS
		SNOUT BEAK
		TAIL
	)
	(ADJECTIVE LEFT RIGHT FUR)
	(OWNER CH-PLAYER)
	(GENERIC RT-GN-BODY)
	(ACTION RT-TH-ANIMAL-BODY)
>

<ROUTINE RT-TH-ANIMAL-BODY ("OPT" (CONTEXT <>))
	<COND
		(.CONTEXT
			<RFALSE>
		)
		(<AND <ADJ-USED? ,TH-ANIMAL-BODY ,W?FUR>
				<NOT <NOUN-USED? ,TH-ANIMAL-BODY ,W?COAT>>
			>
			<NP-CANT-SEE>
		)
		(<AND <MC-FORM? ,K-FORM-ARTHUR>
				<NOUN-USED? ,TH-ANIMAL-BODY ,W?TAIL>
			>
			<RT-NO-BODY-PART-MSG ,TH-ANIMAL-BODY>
		)
		(<AND <NOT <MC-FORM? ,K-FORM-EEL>>
				<NOUN-USED? ,TH-ANIMAL-BODY ,W?FIN ,W?FINS>
			>
			<RT-NO-BODY-PART-MSG ,TH-ANIMAL-BODY>
		)
		(<AND <NOT <MC-FORM? ,K-FORM-OWL>>
				<OR
					<NOUN-USED? ,TH-ANIMAL-BODY ,W?WING ,W?WINGS ,W?BEAK>
					<NOUN-USED? ,TH-ANIMAL-BODY ,W?FEATHER ,W?FEATHERS>
				>
			>
			<RT-NO-BODY-PART-MSG ,TH-ANIMAL-BODY>
		)
		(<AND <NOT <MC-FORM? ,K-FORM-TURTLE>>
				<NOUN-USED? ,TH-ANIMAL-BODY ,W?SHELL>
			>
			<RT-NO-BODY-PART-MSG ,TH-ANIMAL-BODY>
		)
		(<AND <NOT <MC-FORM? ,K-FORM-BADGER>>
				<NOUN-USED? ,TH-ANIMAL-BODY ,W?FUR ,W?COAT ,W?SNOUT>
			>
			<RT-NO-BODY-PART-MSG ,TH-ANIMAL-BODY>
		)
		(T
			<TELL ,K-NO-REFER-MSG "that part of your body.]" CR>
			<RFATAL>
		)
	>
>

;"---------------------------------------------------------------------------"
; "TH-MOUTH"
;"---------------------------------------------------------------------------"

<OBJECT TH-MOUTH
	(LOC GLOBAL-OBJECTS)
	(DESC "mouth")
	(FLAGS FL-BODY-PART FL-CONTAINER FL-OPENABLE FL-YOUR)
	(SYNONYM MOUTH)
	(OWNER CH-PLAYER)
	(GENERIC RT-GN-BODY)
	(ACTION RT-TH-MOUTH)
>

<ROUTINE RT-TH-MOUTH ("OPT" (CONTEXT <>))
	<COND
		(.CONTEXT
			<RFALSE>
		)
		(,NOW-PRSI
			<COND
				(<VERB? PUT-IN>
					<PERFORM ,V?EAT ,PRSO>
					<RTRUE>
				)
			>
		)
		(<VERB? PUT PUT-IN OPEN CLOSE>
			<RT-WASTE-OF-TIME-MSG>
		)
	>
>

;"---------------------------------------------------------------------------"
; "TH-SHELL"
;"---------------------------------------------------------------------------"

<OBJECT TH-SHELL
	(LOC GLOBAL-OBJECTS)
	(DESC "shell")
	(FLAGS FL-BODY-PART FL-YOUR)
	(SYNONYM SHELL)
	(OWNER CH-PLAYER)
	(ACTION RT-TH-SHELL)
>

<ROUTINE RT-TH-SHELL ("OPT" (CONTEXT <>))
	<COND
		(.CONTEXT
			<RFALSE>
		)
		(<NOT <MC-FORM? ,K-FORM-TURTLE>>
			<COND
				(<FSET? ,CH-PLAYER ,FL-LOCKED>
					<TELL The+verb ,CH-PLAYER "are" "n't a turtle." CR>
				)
				(T
					<NP-CANT-SEE>
				)
			>
		)
		(<VERB? ENTER>
			<COND
				(<AND <FSET? ,TH-HEAD ,FL-LOCKED>
						<FSET? ,TH-LEGS ,FL-LOCKED>
					>
					<RT-ALREADY-MSG ,CH-PLAYER "inside your shell">
				)
				(T
					<SETG CLOCK-WAIT T>
					<TELL "Most of you is already inside" the ,TH-SHELL ". Only">
					<COND
						(<AND <NOT <FSET? ,TH-HEAD ,FL-LOCKED>>
								<NOT <FSET? ,TH-LEGS ,FL-LOCKED>>
							>
							<TELL the ,TH-HEAD " and" the ,TH-LEGS " are">
						)
						(<NOT <FSET? ,TH-HEAD ,FL-LOCKED>>
							<TELL the ,TH-HEAD " is">
						)
						(T
							<TELL the ,TH-LEGS " are">
						)
					>
					<TELL " sticking out." CR>
				)
			>
		)
		(<VERB? EXIT>
			<TELL "It's not the shedding season." CR>
		)
	>
>

;"---------------------------------------------------------------------------"
; "TH-HEAD"
;"---------------------------------------------------------------------------"

<OBJECT TH-HEAD
	(LOC GLOBAL-OBJECTS)
	(DESC "head")
	(FLAGS FL-BODY-PART FL-YOUR)
	(SYNONYM HEAD)
	(OWNER CH-PLAYER)
	(GENERIC RT-GN-BODY)
	(ACTION RT-TH-HEAD)
>

; "TH-HEAD flags:"
; "	FL-LOCKED - Head is retracted"

<ROUTINE RT-TH-HEAD ("OPT" (CONTEXT <>))
	<COND
		(<AND <NOT ,NOW-PRSI>
				<MC-PRSI? <> ,ROOMS ,TH-SHELL>
				<VERB? RETRACT PUT-IN EXTEND>
			>
			<RT-RETRACT-EXTEND-MSG ,TH-HEAD>
		)
	>
>

;"---------------------------------------------------------------------------"
; "TH-LEGS"
;"---------------------------------------------------------------------------"

<OBJECT TH-LEGS
	(LOC GLOBAL-OBJECTS)
	(DESC "legs")
	(FLAGS FL-BODY-PART FL-PLURAL FL-YOUR)
	(SYNONYM LEG LEGS)
	(OWNER CH-PLAYER)
	(GENERIC RT-GN-BODY)
	(ACTION RT-TH-LEGS)
>

; "TH-LEGS flags:"
; "	FL-LOCKED - Legs are retracted"

<ROUTINE RT-TH-LEGS ("OPT" (CONTEXT <>))
	<COND
		(<MC-FORM? ,K-FORM-EEL>
			<RT-NO-BODY-PART-MSG ,TH-LEGS>
		)
		(<AND <NOT ,NOW-PRSI>
				<MC-PRSI? <> ,ROOMS ,TH-SHELL>
				<VERB? RETRACT PUT-IN EXTEND>
			>
			<RT-RETRACT-EXTEND-MSG ,TH-LEGS>
		)
	>
>

<ROUTINE RT-RETRACT-EXTEND-MSG (OBJ "AUX" RET?)
	<SET RET? <VERB? RETRACT PUT-IN>>
	<COND
		(<MC-FORM? ,K-FORM-TURTLE>
			<COND
				(.RET?
					<COND
						(<FSET? .OBJ ,FL-LOCKED>
							<RT-ALREADY-MSG .OBJ "in your shell">
							<RTRUE>
						)
						(T
							<FSET .OBJ ,FL-LOCKED>
							<TELL "You pull" the .OBJ " into">
						)
					>
				)
				(T
					<COND
						(<NOT <FSET? .OBJ ,FL-LOCKED>>
							<RT-ALREADY-MSG .OBJ "out of your shell">
							<RTRUE>
						)
						(T
							<FCLEAR .OBJ ,FL-LOCKED>
							<TELL The+verb .OBJ "emerge" " from">
						)
					>
				)
			>
			<TELL the ,TH-SHELL ".">
			<COND
				(<AND .RET?
						<EQUAL? .OBJ ,TH-HEAD>
						<IN? ,TH-BRACELET ,CH-PLAYER>
						<FSET? ,TH-BRACELET ,FL-WORN>
					>
					<MOVE ,TH-BRACELET ,HERE>
					<FCLEAR ,TH-BRACELET ,FL-WORN>
					<FCLEAR ,TH-BRACELET ,FL-TRY-TAKE>
					<FSET ,TH-BRACELET ,FL-TAKEABLE>
					<SETG GL-UPDATE-WINDOW <BOR ,GL-UPDATE-WINDOW ,K-UPD-INVT ,K-UPD-OBJS>>
					<THIS-IS-IT ,TH-BRACELET>
					<TELL " " The ,TH-BRACELET " falls to" the ,TH-GROUND ".">
				)
			>
			<COND
				(<EQUAL? .OBJ ,TH-HEAD>
					<SETG GL-UPDATE-WINDOW <BOR ,GL-UPDATE-WINDOW ,K-UPD-DESC>>
					<COND
						(<EQUAL? ,GL-WINDOW-TYPE ,K-WIN-DESC>
							<RT-UPDATE-DESC-WINDOW>
						)
					>
				)
			>
			<CRLF>
		)
		(T
			<COND
				(<NOT <MC-FORM? ,K-FORM-ARTHUR>>
					<TELL "You are" aform ". ">
				)
			>
			<TELL "You can't ">
			<COND
				(.RET?
					<TELL "retract">
				)
				(T
					<TELL "extend">
				)
			>
			<TELL the .OBJ "." CR>
		)
	>
>

;"---------------------------------------------------------------------------"
; "TH-HANDS"
;"---------------------------------------------------------------------------"

<OBJECT TH-HANDS
	(LOC GLOBAL-OBJECTS)
	(FLAGS FL-BODY-PART FL-BY-HAND FL-HAS-SDESC FL-PLURAL FL-TOOL FL-WEAPON FL-YOUR)
	(SYNONYM HAND HANDS TALON TALONS CLAW CLAWS)
	(ADJECTIVE OWL BADGER)
	(OWNER CH-PLAYER)
	(GENERIC RT-GN-BODY)
	(ACTION RT-TH-HANDS)
>

<ROUTINE RT-TH-HANDS ("OPT" (CONTEXT <>) (ART <>) (CAP? <>))
	<COND
		(<MC-CONTEXT? ,M-OBJDESC>
			<COND
				(.ART
					<PRINT-ARTICLE ,TH-HANDS .ART .CAP?>
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
						(<MC-FORM? ,K-FORM-ARTHUR>
							<TELL "hands">
						)
						(<MC-FORM? ,K-FORM-OWL>
							<TELL "talons">
						)
						(<MC-FORM? ,K-FORM-BADGER>
							<TELL "claws">
						)
					>
				)
			>
		)
		(.CONTEXT
			<RFALSE>
		)
		(<AND <NOT <MC-FORM? ,K-FORM-OWL>>
				<NOUN-USED? ,TH-HANDS ,W?TALON ,W?TALONS>
			>
			<RT-NO-BODY-PART-MSG ,TH-HANDS>
		)
		(<AND <NOT <MC-FORM? ,K-FORM-BADGER>>
				<NOUN-USED? ,TH-HANDS ,W?CLAW ,W?CLAWS>
			>
			<RT-NO-BODY-PART-MSG ,TH-HANDS>
		)
		(<MC-FORM? ,K-FORM-EEL ,K-FORM-SALAMANDER ,K-FORM-TURTLE>
			<RT-NO-BODY-PART-MSG ,TH-HANDS>
		)
	>
>

<ROUTINE RT-NO-BODY-PART-MSG (OBJ "AUX" TBL CNT)
	<TELL Form "s don't have ">
	<COND
		(<NOUN-USED? .OBJ ,W?FOOT>
			<TELL "feet">
		)
		(T
			<DIROUT ,D-TABLE-ON ,K-DIROUT-TBL>
			<COND
				(,NOW-PRSI
					<NP-PRINT ,PRSI-NP>
				)
				(T
					<NP-PRINT ,PRSO-NP>
				)
			>
			<DIROUT ,D-TABLE-OFF>
			<SET TBL <ZREST ,K-DIROUT-TBL 2>>
			<SET CNT <ZGET ,K-DIROUT-TBL 0>>
			<PRINTT .TBL .CNT>
			<COND
				(<AND <NOT <NOUN-USED? .OBJ ,W?FUR ,W?HAIR ,W?SKIN>>
						<G? .CNT 0>
						<NOT <EQUAL? <GETB .TBL <- .CNT 1>> !\s>>
					>
					<TELL "s">
				)
			>
		)
	>
	<TELL "." CR>
>

;"---------------------------------------------------------------------------"
; "TH-GROUND"
;"---------------------------------------------------------------------------"

<OBJECT TH-GROUND
	(LOC GLOBAL-OBJECTS)
	(SYNONYM GROUND FLOOR DIRT)
	(FLAGS FL-HAS-SDESC FL-SEARCH FL-SURFACE)
	(ACTION RT-TH-GROUND)
>

<ROUTINE RT-TH-GROUND ("OPT" (CONTEXT <>) (ART <>) (CAP? <>))
	<COND
		(<MC-CONTEXT? ,M-OBJDESC>
			<COND
				(.ART
					<PRINT-ARTICLE ,TH-GROUND .ART .CAP?>
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
						(<FSET? ,HERE ,FL-INDOORS>
							<TELL "floor">
						)
						(<MC-HERE? ,RM-FORD ,RM-SHALLOWS>
							<TELL "bottom">
						)
						(T
							<TELL "ground">
						)
					>
				)
			>
		)
		(.CONTEXT
			<RFALSE>
		)
		(,NOW-PRSI
			<RFALSE>
		)
		(<VERB? EXAMINE LOOK-ON>
			<COND
				(<SEE-ANYTHING-IN? ,HERE>
					<TELL "You see">
					<PRINT-CONTENTS ,HERE>
					<TELL " on" the ,TH-GROUND "." CR>
				)
			>
		)
		(<VERB? LAND-ON WALK-TO>
			<COND
				(<FSET? ,HERE ,FL-AIR>
					<COND
						(<MC-HERE? ,RM-ABOVE-FOREST>
							<SETG GL-TAKEOFF-ROOM ,RM-GROVE>
						)
					>
					<RT-DO-WALK ,P?DOWN>
				)
				(T
					<RT-ALREADY-MSG ,CH-PLAYER>
					<TELL " on" the ,TH-GROUND "." CR>
					<RT-AUTHOR-OFF>
				)
			>
		)
	>
>

;"---------------------------------------------------------------------------"
; "TH-SKY"
;"---------------------------------------------------------------------------"

<OBJECT TH-SKY
	(LOC GLOBAL-OBJECTS)
	(SYNONYM SKY CEILING)
	(FLAGS FL-HAS-SDESC)
	(ACTION RT-TH-SKY)
>

<ROUTINE RT-TH-SKY ("OPT" (CONTEXT <>) (ART <>) (CAP? <>) "AUX" RM)
	<COND
		(<MC-CONTEXT? ,M-OBJDESC>
			<COND
				(.ART
					<PRINT-ARTICLE ,TH-SKY .ART .CAP?>
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
						(<FSET? ,HERE ,FL-INDOORS>
							<TELL "ceiling">
						)
						(T
							<TELL "sky">
						)
					>
				)
			>
		)
		(.CONTEXT
			<RFALSE>
		)
		(<VERB? ENTER WALK-TO>
			<COND
				(<FSET? ,HERE ,FL-INDOORS>
					<RFALSE>
				)
				(<SET RM <RT-FLY-UP>>
					<RT-GOTO .RM>
				)
			>
		)
		(<NOT <EVERYWHERE-VERB? <COND (,NOW-PRSI 2) (T 1)>>>
			<COND
				(<FSET? ,HERE ,FL-INDOORS>
					<COND
						(<NOUN-USED? ,TH-SKY ,W?SKY>
							<NP-CANT-SEE>
						)
					>
				)
				(T
					<COND
						(<NOUN-USED? ,TH-SKY ,W?CEILING>
							<NP-CANT-SEE>
						)
					>
				)
			>
		)
	>
>

;"---------------------------------------------------------------------------"
; "TH-HOLE"
;"---------------------------------------------------------------------------"

<OBJECT TH-HOLE
	(LOC GLOBAL-OBJECTS)
	(DESC "hole")
	(SYNONYM HOLE)
	(ACTION RT-TH-HOLE)
>

<ROUTINE RT-TH-HOLE ("OPT" (CONTEXT <>))
	<COND
		(.CONTEXT
			<RFALSE>
		)
		(<VERB? DIG>
			<PERFORM ,V?DIG ,TH-GROUND>
			<RTRUE>
		)
		(<NOT <EVERYWHERE-VERB? <COND (,NOW-PRSI 2) (T 1)>>>
			<NP-CANT-SEE>
		)
	>
>

;"---------------------------------------------------------------------------"
; "TH-WATER"
;"---------------------------------------------------------------------------"

<OBJECT TH-WATER
	(DESC "water")
	(FLAGS FL-COLLECTIVE FL-PLURAL FL-WATER)
	(SYNONYM WATER)
	(ACTION RT-TH-WATER)
>

<ROUTINE RT-TH-WATER ("OPT" (CONTEXT <>))
	<COND
		(.CONTEXT
			<RFALSE>
		)
		(<VERB? DRINK EAT>
			<TELL The+verb ,WINNER "take" " a small, refreshing sip of water." CR>
		)
	>
>

;"---------------------------------------------------------------------------"
; "TH-TIME"
;"---------------------------------------------------------------------------"

<OBJECT TH-TIME
	(LOC GENERIC-OBJECTS)
	(DESC "time")
	(SYNONYM
		TURN TURNS MINUTE MINUTES MIN
		HOUR HOURS MATINS LAUD PRIME TIERCE SEXT NONE VESPERS COMPLINE
		CHRISTMAS EVE TOMORROW MORNING XMAS
	)
	(ADJECTIVE INT.NUM CHRISTMAS TOMORROW XMAS)
>

;"---------------------------------------------------------------------------"
; "TH-BELLS"
;"---------------------------------------------------------------------------"

<OBJECT TH-BELLS
	(LOC GLOBAL-OBJECTS)
	(DESC "bells")
	(SYNONYM BELL BELLS)
	(ACTION RT-TH-BELLS)
>

<ROUTINE RT-TH-BELLS ("OPT" (CONTEXT <>))
	<COND
		(.CONTEXT
			<RFALSE>
		)
		(,NOW-PRSI
			<COND
				(<NOT <EVERYWHERE-VERB? 2>>
					<NP-CANT-SEE>
				)
			>
		)
		(<VERB? LISTEN>
			<COND
				(<EQUAL? <MOD ,GL-MOVES 180> 1>
					<TELL "The sound of the bells fades quickly." CR>
				)
			>
		)
		(<NOT <EVERYWHERE-VERB? 1>>
			<NP-CANT-SEE>
		)
	>
>

;"---------------------------------------------------------------------------"
; "TH-NAME"
;"---------------------------------------------------------------------------"

<OBJECT TH-NAME
	(LOC GENERIC-OBJECTS)
	(DESC "name")
	(SYNONYM NAME)
	(OWNER K-NAME-OWNER-TBL)
>

<CONSTANT K-NAME-OWNER-TBL
	<TABLE (PURE LENGTH)
		CH-PLAYER
		CH-BLACK-KNIGHT
		CH-BLUE-KNIGHT
		CH-CELL-GUARD
		CH-COOK
		CH-DEMON
		CH-DRAGON
		CH-FARMERS
		CH-GIRL
		CH-I-KNIGHT
		CH-IDIOT
		CH-KRAKEN
		CH-LOT
		CH-MERLIN
		CH-NIMUE
		CH-PEASANT
		CH-PRISONER
		CH-RED-KNIGHT
		CH-RHYMER
		CH-SOLDIERS
	>
>

;"---------------------------------------------------------------------------"
; "TH-MAGIC"
;"---------------------------------------------------------------------------"

<OBJECT TH-MAGIC
	(LOC GENERIC-OBJECTS)
	(DESC "magic")
	(SYNONYM MAGIC)
>

;"---------------------------------------------------------------------------"
; "TH-RIOTHAMUS"
;"---------------------------------------------------------------------------"

<OBJECT TH-RIOTHAMUS
	(LOC GENERIC-OBJECTS)
	(DESC "Riothamus")
	(SYNONYM RIOTHAMUS)
>

;"---------------------------------------------------------------------------"
; "TH-MOTHER"
;"---------------------------------------------------------------------------"

<OBJECT TH-MOTHER
	(LOC GENERIC-OBJECTS)
	(DESC "mother")
	(SYNONYM MOTHER MOM)
	(OWNER K-NAME-OWNER-TBL)
>

;"---------------------------------------------------------------------------"
; "TH-SHERLOCK"
;"---------------------------------------------------------------------------"

<OBJECT TH-SHERLOCK
	(LOC GENERIC-OBJECTS)
	(DESC "Sherlock")
	(SYNONYM SHERLOCK HOLMES)
	(ADJECTIVE SHERLOCK)
>

;"---------------------------------------------------------------------------"
; "TH-JOUST"
;"---------------------------------------------------------------------------"

<OBJECT TH-JOUST
	(LOC GENERIC-OBJECTS)
	(DESC "joust")
	(SYNONYM JOUST JOUSTING)
>

;"---------------------------------------------------------------------------"
; "LG-WALL"
;"---------------------------------------------------------------------------"

<OBJECT LG-WALL
	(LOC LOCAL-GLOBALS)
	(DESC "wall")
	(FLAGS FL-SURFACE)
	(SYNONYM WALL WALLS)
	(ADJECTIVE STONE NORTH SOUTH EAST WEST)
	(ACTION RT-LG-WALL)
>

<CONSTANT K-ROMAN-FORT-MSG "The wall is part of the old roman fort.">

<ROUTINE RT-LG-WALL ("OPT" (CONTEXT <>) "AUX" COUNT)
	<COND
		(.CONTEXT
			<RFALSE>
		)
		(,NOW-PRSI
			<COND
				(<VERB? PUT>
					<TELL "There isn't a place for" the ,PRSO " on the wall." CR>
				)
			>
		)
		(<VERB? EXAMINE READ>
			<FSET ,LG-WALL ,FL-SEEN>
			<COND
				(<MC-HERE? ,RM-CHURCHYARD ,RM-TOWN-SQUARE>
					<TELL "It is a high stone wall." CR>
				)
				(<MC-HERE? ,RM-TAVERN>
					<TELL "Eerie shadows dance and leap across the walls." CR>
				)
				(<MC-HERE? ,RM-CRACK-ROOM>
					<TELL ,K-WALL-LETTERS-MSG CR>
				)
				(<MC-HERE? ,RM-CELLAR>
					<RT-CELLAR-MSG>
				)
				(<MC-HERE? ,RM-CELL ,RM-HOLE>
					<TELL ,K-ROMAN-FORT-MSG>
					<COND
						(<NOT <FSET? ,TH-CELL-STONE ,FL-LOCKED>>
							<TELL
" There is a hole in it where a stone has been pushed out."
				         >
						)
					>
					<CRLF>
				)
				(<MC-HERE? ,RM-SMITHY ,RM-CASTLE-GATE ,RM-PARADE-AREA>
					<TELL ,K-ROMAN-FORT-MSG CR>
				)
				(<MC-HERE? ,RM-CRYSTAL-CAVE>
					<TELL "The walls seem to shimmer with their own light." CR>
				)
				(<MC-HERE? ,RM-ICE-ROOM>
					<TELL "The walls are lined with ice." CR>
				)
				(<MC-HERE? ,RM-LANDING>
					<COND
						(<NOT <ADJ-USED? ,LG-WALL ,W?NORTH ,W?EAST ,W?SOUTH>>
							<TELL "There is a crack in the west wall." CR>
						)
					>
				)
				(<MC-HERE? ,RM-TOWN-GATE ,RM-VILLAGE-GREEN>
					<TELL
"It's an old stone wall that was built by the Romans to encircle the town." CR
					>
				)
				(<MC-HERE? ,RM-BADGER-TUNNEL>
					<RT-NUM-MARKS-MSG>
				)
			>
		)
		(<AND <VERB? CLIMB-UP CLIMB-ON CLIMB-OVER>
				<MC-HERE? ,RM-CHURCHYARD ,RM-TOWN-SQUARE>
			>
			<COND
				(<MC-FORM? ,K-FORM-SALAMANDER>
					<RT-WASTE-OF-TIME-MSG>
				)
				(T
					<TELL The ,LG-WALL " is too high to " vw "." CR>
				)
			>
		)
		(<VERB? LOOK-BEHIND>
			<RT-YOU-CANT-MSG "look behind">
		)
		(<AND <VERB? EAT>
				<MC-HERE? ,RM-ICE-ROOM>
			>
			<TELL ,K-EAT-ICE-MSG CR>
		)
		(<AND <TOUCH-VERB?>
				<MC-HERE? ,RM-ICE-ROOM>
			>
			<TELL "The rock-solid ice remains unaffected by your actions." CR>
		)
	>
>

;"---------------------------------------------------------------------------"
; "LG-STAIRS"
;"---------------------------------------------------------------------------"

<OBJECT LG-STAIRS
	(LOC LOCAL-GLOBALS)
	(DESC "stairs")
	(SYNONYM STAIRS STAIRCASE)
	(ACTION RT-LG-STAIRS)
>

<ROUTINE RT-LG-STAIRS ("OPT" (CONTEXT <>))
	<COND
		(.CONTEXT
			<RFALSE>
		)
		(<VERB? CLIMB-UP CLIMB-ON>
			<RT-DO-WALK ,P?UP>
		)
		(<VERB? CLIMB-DOWN DISMOUNT>
			<RT-DO-WALK ,P?DOWN>
		)
	>
>

;"---------------------------------------------------------------------------"
; "LG-PATH"
;"---------------------------------------------------------------------------"

<OBJECT LG-PATH
	(LOC LOCAL-GLOBALS)
	(DESC "path")
	(SYNONYM PATH)
	(ADJECTIVE NORTH NE EAST SE SOUTH SW WEST NW)
	(ACTION RT-LG-PATH)
>

<ROUTINE RT-LG-PATH ("OPT" (CONTEXT <>))
	<COND
		(.CONTEXT
			<RFALSE>
		)
		(<MC-HERE? ,RM-FIELD-OF-HONOUR>
			<COND
				(<FSET? ,RM-MID-LAKE ,FL-WATER>
					<COND
						(<NOT <EVERYWHERE-VERB? <COND (,NOW-PRSI 2) (T 1)>>>
							<NP-CANT-SEE>
						)
					>
				)
				(<VERB? ENTER>
					<RT-DO-WALK ,P?SOUTH>
				)
				(<VERB? EXAMINE>
					<TELL
"The path leads between two walls of water into the middle of the lake." CR
					>
				)
			>
		)
		(<MC-HERE? ,RM-FOOT-OF-MOUNTAIN>
			<COND
				(<VERB? ENTER>
					<RT-DO-WALK ,P?NE>
				)
				(<VERB? EXAMINE LOOK-UP>
					<TELL "It is dangerously narrow, and perilously steep." CR>
				)
			>
		)
		(<VERB? ENTER WALK-TO>
			<COND
				(<ADJ-USED? ,LG-PATH ,W?NORTH>
					<RT-DO-WALK ,P?NORTH>
				)
				(<ADJ-USED? ,LG-PATH ,W?NE>
					<RT-DO-WALK ,P?NE>
				)
				(<ADJ-USED? ,LG-PATH ,W?EAST>
					<RT-DO-WALK ,P?EAST>
				)
				(<ADJ-USED? ,LG-PATH ,W?SE>
					<RT-DO-WALK ,P?SE>
				)
				(<ADJ-USED? ,LG-PATH ,W?SOUTH>
					<RT-DO-WALK ,P?SOUTH>
				)
				(<ADJ-USED? ,LG-PATH ,W?SW>
					<RT-DO-WALK ,P?SW>
				)
				(<ADJ-USED? ,LG-PATH ,W?WEST>
					<RT-DO-WALK ,P?WEST>
				)
				(<ADJ-USED? ,LG-PATH ,W?NW>
					<RT-DO-WALK ,P?NW>
				)
				(T
				;	<SETG CLOCK-WAIT T>
					<TELL ,K-WHICH-DIR-MSG>
					<RFATAL>
				)
			>
		)
	>
>

;"***************************************************************************"
; "end of file"
;"***************************************************************************"

