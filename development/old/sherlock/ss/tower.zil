;*****************************************************************************
; "game : SHERLOCK!"
; "file : TOWER.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   28 Oct 1987 17:00:32  $"
; "revs : $Revision:   1.45  $"
; "vers : 1.00"
;*****************************************************************************

;*****************************************************************************
; "THINGS1.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "TH-PASSWORD-OBJ"
;-----------------------------------------------------------------------------

<OBJECT TH-PASSWORD-OBJ
	(DESC "password")
	(SYNONYM
		PASSWORD
		SWORDFISH
		HUSH
		GIN
		PARR
		CLEVES
		ARAGON
		HOWARD
		SEYMOUR
		BOLEYN
	)
	(ACTION RT-AC-TH-PASSWORD-OBJ)
>

;*****************************************************************************
; "PLACES2.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "EAST  from RM-BYWARD-TOWER                     to RM-OUTER-WARD"
; "WEST  from RM-BYWARD-TOWER                     to RM-DRAWBRIDGE"
;-----------------------------------------------------------------------------

<ROUTINE RT-EX-RM-EXIT-BYWARD-TOWER ()
   <COND
      (<MC-PRSO? P?EAST P?IN>
			<TELL
"The guard steps into your path and says, \"I am sorry but you cannot go
in unless you can tell me the password.\"" CR
			>
			<RFALSE>
		)
      (<MC-PRSO? P?WEST P?OUT>
			<COND
				(<EQUAL? ,GL-PLACE-PRV ,RM-DRAWBRIDGE>
					<RETURN ,RM-DRAWBRIDGE>
				)
				(T
					<TELL
"The guard blocks your path and says, \"I am sorry, but I am under strict
orders not to allow anyone to leave the Tower.\"" CR
					>
					<RFALSE>
				)
			>
      )
   >
>

;*****************************************************************************
; "PEOPLE1.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "CH-TOWER-GUARD"
;-----------------------------------------------------------------------------

<OBJECT CH-TOWER-GUARD
	(LOC RM-BYWARD-TOWER)
	(DESC "beefeater")
	(FLAGS FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL FL-LOCKED FL-NODESC)
	(SYNONYM GUARD YEOMAN BEEFEATER)
	(ADJECTIVE TOWER)
	(SIZE 99)
	(CAPACITY 20)
	(ACTION RT-AC-CH-TOWER-GUARD)
	(DESCFCN RT-DF-CH-TOWER-GUARD)
>

;*****************************************************************************
; "PEOPLE2.ZIL"
;*****************************************************************************

<ROUTINE RT-AC-CH-TOWER-GUARD ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-AC "TOWER-GUARD" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<MC-THIS-WINNER?>
			<COND
				(<MC-VERB? BOLEYN CLEVES HOWARD PARR ARAGON SEYMOUR PASSWORD>
					<RFALSE>
				)
				(T
					<TELL "The guard stares at you impassively." CR>
				)
			>
		)
		(<MC-THIS-PRSI?>
			<RFALSE>
		)
		(<MC-THIS-PRSO?>
			<RFALSE>
		)
	>
>

;*****************************************************************************
; "PEOPLE3.ZIL"
;*****************************************************************************

<ROUTINE RT-DF-CH-TOWER-GUARD ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "TOWER-GUARD" .CONTEXT>
		)
		(T
		)
	>
	<RFALSE>
>

;*****************************************************************************
; "THINGS1.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "TH-MALMSEY"
;-----------------------------------------------------------------------------

<OBJECT TH-MALMSEY
   (LOC TH-BUTT-OF-MALMSEY)
   (DESC "malmsey")
   (FLAGS FL-PLURAL FL-COLLECTIVE FL-TRYTAKE FL-FOOD)
   (SYNONYM MALMSEY WINE)
   (ACTION RT-AC-TH-MALMSEY)
   (DESCFCN RT-DF-TH-MALMSEY)
>

;-----------------------------------------------------------------------------
; "TH-MALMSEY-POOL"
;-----------------------------------------------------------------------------

<OBJECT TH-MALMSEY-POOL
   (DESC "pool of malmsey")
   (FLAGS FL-TRYTAKE FL-FOOD)
   (SYNONYM MALMSEY WINE)
   (ACTION RT-AC-TH-MALMSEY-POOL)
   (DESCFCN RT-DF-TH-MALMSEY-POOL)
>

;-----------------------------------------------------------------------------
; "TH-BUTT-OF-MALMSEY"
;-----------------------------------------------------------------------------

<OBJECT TH-BUTT-OF-MALMSEY
   (LOC RM-BOWYER-TOWER)
   (DESC "butt of malmsey")
   (FLAGS FL-TRYTAKE FL-CONTAINER FL-OPENED FL-NODESC)
   (SYNONYM BUTT KEG BARREL)
	(ADJECTIVE BUTT KEG BARREL MALMSEY)
   (SIZE 50)
   (MASS 50)
   (CAPACITY 50)
   (ACTION RT-AC-TH-BUTT-OF-MALMSEY)
   (DESCFCN RT-DF-TH-BUTT-OF-MALMSEY)
>

;-----------------------------------------------------------------------------
; "TH-EMPTY-BUTT-OF-MALMSEY"
;-----------------------------------------------------------------------------

<OBJECT TH-EMPTY-BUTT-OF-MALMSEY
   (DESC "empty butt of malmsey")
   (FLAGS FL-TRYTAKE FL-CONTAINER FL-OPENED FL-NODESC)
   (SYNONYM BUTT KEG BARREL)
	(ADJECTIVE BUTT KEG BARREL MALMSEY)
   (SIZE 50)
   (MASS 50)
   (CAPACITY 50)
   (ACTION RT-AC-TH-EMPTY-BUTT-OF-MALMSEY)
   (DESCFCN RT-DF-TH-EMPTY-BUTT-OF-MALMSEY)
>

;-----------------------------------------------------------------------------
; "TH-GARNET"
;-----------------------------------------------------------------------------

<OBJECT TH-GARNET
	(LOC TH-EMPTY-BUTT-OF-MALMSEY)
   (DESC "garnet")
   (FLAGS FL-TAKEABLE FL-READABLE FL-SURFACE FL-MONEY)
   (SYNONYM GARNET GEM GEMS)
	(ADJECTIVE GARNET)
   (VALUE 5)
   (SIZE 1)
   (MASS 1)
   (CAPACITY 1)
	(GENERIC RT-GN-GEM)
   (ACTION RT-AC-TH-GARNET)
   (DESCFCN RT-DF-TH-GARNET)
>

;-----------------------------------------------------------------------------
; "TH-BUNG"
;-----------------------------------------------------------------------------

<OBJECT TH-BUNG
   (LOC TH-BUTT-OF-MALMSEY)
   (DESC "bung")
   (FLAGS FL-TAKEABLE FL-TRYTAKE FL-NODESC)
   (SYNONYM BUNG STOPPER CORK)
   (SIZE 3)
   (MASS 3)
   (ACTION RT-AC-TH-BUNG)
   (DESCFCN RT-DF-TH-BUNG)
>

;-----------------------------------------------------------------------------
; "TH-MACE"
;-----------------------------------------------------------------------------

<OBJECT TH-MACE
   (LOC RM-JEWEL-ROOM)
   (DESC "mace")
   (FLAGS FL-TAKEABLE FL-WEAPON)
   (SYNONYM MACE WEAPON)
   (VALUE 1)
   (SIZE 15)
   (MASS 15)
   (ACTION RT-AC-TH-MACE)
   (DESCFCN RT-DF-TH-MACE)
>

;-----------------------------------------------------------------------------
; "TH-PORTCULLIS-CHAIN"
;-----------------------------------------------------------------------------

<OBJECT TH-PORTCULLIS-CHAIN
   (LOC RM-INSIDE-TRAITORS-GATE)
   (DESC "chain")
   (FLAGS FL-TRYTAKE FL-NODESC)
   (SYNONYM CHAIN)
	(ADJECTIVE PORTCULLIS)
   (ACTION RT-AC-TH-PORTCULLIS-CHAIN)
   (DESCFCN RT-DF-TH-PORTCULLIS-CHAIN)
>

;-----------------------------------------------------------------------------
; "TH-SUIT-OF-ARMOUR"
;-----------------------------------------------------------------------------

<OBJECT TH-SUIT-OF-ARMOUR
   (LOC RM-DUNGEON)
   (DESC "suit of armour")
   (FLAGS FL-TAKEABLE FL-CLOTHING FL-CONTAINER FL-OPENED)
   (SYNONYM ARMOUR SUIT ARMOR)
   (ADJECTIVE SUIT ARMOUR ARMOR)
	(SIZE 100)
   (CAPACITY 999)
   (ACTION RT-AC-TH-SUIT-OF-ARMOUR)
   (DESCFCN RT-DF-TH-SUIT-OF-ARMOUR)
>

;*****************************************************************************
; "THINGS2.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-AC-TH-MALMSEY"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-MALMSEY ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-TH-AC "TH-MALMSEY">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<SETG GL-P-IT-OBJECT ,TH-MALMSEY>
		)
	>
	<COND
		(<MC-THIS-PRSI?>
			<RFALSE>
		)
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? DRINK DRINK-FROM EAT DRINK>
					<TELL ,K-TIPSY-MSG CR>
				)
				(<MC-VERB? SHOOT>
					<TELL ,K-BULLET-MSG>
					<RT-EMPTY-BUTT-MSG>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-MALMSEY-POOL"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-MALMSEY-POOL ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-TH-AC "TH-MALMSEY-POOL">
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
				(<MC-VERB? DRINK DRINK-FROM EAT TASTE>
					<TELL
"You get down on all fours and lap up some of the wine. Yuch!" CR
					>
				)
				(<MC-VERB? SHOOT>
					<RT-WHY-SHOOT-MSG>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-BUTT-OF-MALMSEY"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-BUTT-OF-MALMSEY ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-TH-AC "TH-BUTT-OF-MALMSEY">
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
				(<MC-VERB? DRINK>
					<TELL ,K-TIPSY-MSG CR>
				)
				(<MC-VERB? DRINK-FROM>
					<TELL
"You take a sip. It tastes like Malmsey." CR
					>
				)
				(<MC-VERB? FLIP>
					<TELL
CTHEO " is much too heavy to move." CR
					>
				)
				(<MC-VERB? SHOOT>
					<TELL ,K-BULLET-MSG>
					<RT-EMPTY-BUTT-MSG>
				)
				(<MC-VERB? REACH-IN>
					<RT-CYOU-MSG "stick" "sticks">
					<TELL
"an arm down into the malmsey, but"
					>
					<RT-YOU-MSG "come" "comes" T>
					<TELL "up empty." CR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-EMPTY-BUTT-OF-MALMSEY"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-EMPTY-BUTT-OF-MALMSEY ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-TH-AC "TH-EMPTY-BUTT-OF-MALMSEY">
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
				(<MC-VERB? DRINK DRINK-FROM>
					<TELL
"Too bad. All gone." CR
					>
				)
				(<MC-VERB? FLIP>
					<TELL "That would">
					<RT-WASTE-OF-TIME-MSG>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-EMPTY-BUTT-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-EMPTY-BUTT-MSG ()
	<REMOVE ,TH-MALMSEY>
	<REMOVE ,TH-BUTT-OF-MALMSEY>
	<MOVE ,TH-GARNET ,TH-EMPTY-BUTT-OF-MALMSEY>
	<MOVE ,TH-MALMSEY-POOL ,RM-BOWYER-TOWER>
	<MOVE ,TH-EMPTY-BUTT-OF-MALMSEY ,RM-BOWYER-TOWER>
	<MOVE ,TH-BUNG ,RM-BOWYER-TOWER>
	<TELL
" flies across the room and lands in the corner. " CTHE ,TH-MALMSEY " streams
out of the butt and across the floor. Soon the keg is completely empty, and
there's wine all over the floor." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-BUNG"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-BUNG ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-TH-AC "TH-BUNG">
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
				(<MC-VERB? TAKE PULL LOOSEN UNPLUG RELEASE>
					<COND
						(<IN? ,TH-BUNG ,TH-BUTT-OF-MALMSEY>
							<TELL "You can't. It's jammed in too tight." CR>
						)
					>
				)
				(<MC-VERB? PUT>
					<COND
						(<MC-PRSI? TH-EMPTY-BUTT-OF-MALMSEY>
							<TELL
"Don't you think it's pretty pointless to try to stopper up an empty keg?" CR
							>
						)
					>
				)
				(<MC-VERB? HIT>
					<COND
						(<IN? ,TH-BUNG ,TH-BUTT-OF-MALMSEY>
							<COND
								(<MC-PRSI? TH-HANDS>
									<TELL "Your hands aren't nearly strong enough
to remove the stopper by themselves." CR
									>
								)
								(<MC-PRSI? TH-MACE>
									<TELL CTHE ,TH-BUNG>
									<RT-EMPTY-BUTT-MSG>
								)
							>
						)
					>
				)
				(<MC-VERB? SHOOT>
					<COND
						(<IN? ,TH-BUNG ,TH-BUTT-OF-MALMSEY>
							<TELL ,K-BULLET-MSG>
							<RT-EMPTY-BUTT-MSG>
						)
					>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-GARNET"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-GARNET ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-TH-AC "TH-GARNET">
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
				(<RT-EXAMINE-GEM ,TH-GARNET>
					<RTRUE>
				)
				(<MC-VERB? TAKE>
					<COND
						(<IN? ,TH-GARNET ,TH-EMPTY-BUTT-OF-MALMSEY>
							<TELL
"You can't. Your shoulders are too broad, and your arms are too short
for you to reach to the bottom of the butt." CR
							>
						)
					>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-MACE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-MACE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-TH-AC "TH-MACE">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSI?>
			<COND
				(<MC-PRSO? CH-WIGGINS>
					<TELL
"Wiggins dances nimbly out of harm's way and cries, \"'Ere! Steady on,
mate!\"" CR
					>
				)
				(<AND <MC-PRSO? TH-SUIT-OF-ARMOUR>
						<MC-ISNOT? ,TH-SUIT-OF-ARMOUR ,FL-WORN>
					>
					<TELL
"Did you really think beating up on an empty suit of armour was going to
get you anywhere?" CR
					>
				)
			>
		)
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? SHOOT>
					<TELL ,K-RICOCHET-MSG CR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-PORTCULLIS-CHAIN"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-PORTCULLIS-CHAIN ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-TH-AC "TH-PORTCULLIS-CHAIN">
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
				(<MC-VERB? PULL LOWER LOOSEN PUSH-TO>
					<COND
						(<MC-IS? ,LG-PORTCULLIS-DOOR ,FL-OPENED>
							<TELL
"The gate is already up." CR
							>
						)
						(T
							<COND
								(<MC-ISNOT? ,TH-SUIT-OF-ARMOUR ,FL-WORN>
									<TELL
"You pull on the chain but the portcullis doesn't budge." CR
									>
								)
								(T
									<MC-MAKE ,LG-PORTCULLIS-DOOR ,FL-OPENED>
									<MC-MAKE ,LG-PORTCULLIS-DOOR ,FL-LOCKED>
									<TELL
"You grab the chain and lift your feet off the ground. The portcullis'
ancient mechanism creaks, but then it rises up and locks into place. When
you release the chain, the massive gate remains open." CR
									>
									<RT-UPDATE-SCORE 1>
									<RTRUE>
								)
							>
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
; "RT-AC-TH-SUIT-OF-ARMOUR"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-SUIT-OF-ARMOUR ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-TH-AC "TH-SUIT-OF-ARMOUR">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSI?>
			<COND
				(<MC-VERB? PUT>
					<TELL "That would">
					<RT-WASTE-OF-TIME-MSG>
				)
				(<AND <MC-VERB? TAKE>
						<MC-IS? ,TH-SUIT-OF-ARMOUR ,FL-WORN>
					>
					<RT-CYOU-MSG>
					<RT-WOULD-HAVE-TO-MSG "take off" ,TH-SUIT-OF-ARMOUR>
					<TELL "first." CR>
				)
			>
		)
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? TAKE>
					<TELL
"Ooof! It's too heavy to carry." CR
					>
				)
				(<MC-VERB? WEAR>
					<COND
						(<MC-ISNOT? ,TH-SUIT-OF-ARMOUR ,FL-WORN>
							<MOVE ,TH-SUIT-OF-ARMOUR ,CH-PLAYER>
							<MC-MAKE ,TH-SUIT-OF-ARMOUR ,FL-WORN>
							<TELL "You put on the suit of armour." CR>
						)
						(T
							<TELL "You're already wearing it." CR>
						)
					>
				)
				(<MC-VERB? TAKE-OFF EXIT>
					<COND
						(<MC-IS? ,TH-SUIT-OF-ARMOUR ,FL-WORN>
							<MOVE ,TH-SUIT-OF-ARMOUR ,GL-PLACE-CUR>
							<MC-UNMAKE ,TH-SUIT-OF-ARMOUR ,FL-WORN>
							<TELL "You take off the suit of armour and leave it on ">
							<COND
								(<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
									<TELL THE ,TH-FLOOR>
								)
								(T
									<TELL THE ,TH-GROUND>
								)
							>
							<TELL "." CR>
						)
						(<EQUAL? ,GL-P-PRSA-WORD ,W?LEAVE>
							<RFALSE>
						)
						(T
							<TELL "You're not wearing it." CR>
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

;*****************************************************************************
; "THINGS3.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-DF-TH-MALMSEY"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-MALMSEY ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-TH-DF "TH-MALMSEY">
		)
		(T
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-MALMSEY-POOL"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-MALMSEY-POOL ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-TH-DF "TH-MALMSEY-POOL">
		)
		(T
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-BUTT-OF-MALMSEY"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-BUTT-OF-MALMSEY ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-TH-DF "TH-BUTT-OF-MALMSEY">
		)
		(T
		)
	>
	<TELL
"It's an old wooden keg that's brimming over with malmsey and covered with
stains where the wine has spilled down the sides and leaked through the
bung." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-EMPTY-BUTT-OF-MALMSEY"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-EMPTY-BUTT-OF-MALMSEY ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-TH-DF "TH-EMPTY-BUTT-OF-MALMSEY">
		)
		(T
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-BUNG"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-BUNG ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-TH-DF "TH-BUNG">
		)
		(T
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-GARNET"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-GARNET ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-TH-DF "TH-GARNET">
		)
		(T
		)
	>
	<RT-EXAMINE-GEM ,TH-GARNET>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-MACE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-MACE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-TH-DF "TH-MACE">
		)
		(T
		)
	>
	<TELL
"It's a huge, medieval mace that some medieval knight probably used for
knocking other knights off horses." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-SUIT-OF-ARMOUR"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-SUIT-OF-ARMOUR ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-TH-DF "TH-SUIT-OF-ARMOUR">
		)
		(T
		)
	>
	<TELL
"The suit of armour was made for Henry VIII." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-PORTCULLIS-CHAIN"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-PORTCULLIS-CHAIN ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-TH-DF "TH-PORTCULLIS-CHAIN">
		)
		(T
		)
	>
	<TELL "The chain is hanging just within reach." CR>
>

;*****************************************************************************
; "LOCALS1.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "LG-PORTCULLIS-DOOR"
;-----------------------------------------------------------------------------

<OBJECT LG-PORTCULLIS-DOOR
   (LOC LOCAL-GLOBALS)
   (DESC "portcullis")
   (FLAGS FL-DOOR FL-OPENABLE FL-TRANSPARENT)
   (SYNONYM DOOR PORTCULLIS)
   (ADJECTIVE IRON GATE TRAITOR\'S)
   (VALUE 5)
   (ACTION RT-AC-LG-PORTCULLIS-DOOR)
   (DESCFCN RT-DF-LG-PORTCULLIS-DOOR)
>

;*****************************************************************************
; "LOCALS2.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-AC-LG-PORTCULLIS-DOOR"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-PORTCULLIS-DOOR ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-AC "LG-PORTCULLIS-DOOR">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? RAISE OPEN LOOSEN>
					<COND
						(<MC-IS? ,LG-PORTCULLIS-DOOR ,FL-OPENED>
							<TELL "The gate is already up." CR>
						)
						(T
							<TELL "Oomph. The portcullis is too heavy to lift." CR>
						)
					>
				)
				(<MC-VERB? LOOK-INSIDE SEARCH>
					<COND
						(<MC-IS? ,LG-PORTCULLIS-DOOR ,FL-OPENED>
							<TELL "You cannot do that, the gate is already up." CR>
						)
						(<EQUAL? ,GL-PLACE-CUR ,RM-INSIDE-TRAITORS-GATE>
							<RT-DESCRIBE-PLACE-CONTENTS ,RM-OUTSIDE-TRAITORS-GATE>
						)
						(<EQUAL? ,GL-PLACE-CUR ,RM-OUTSIDE-TRAITORS-GATE>
							<RT-DESCRIBE-PLACE-CONTENTS ,RM-INSIDE-TRAITORS-GATE>
						)
					>
				)
				(<MC-VERB? ENTER THROUGH>
					<COND
						(<MC-HERE? ,RM-INSIDE-TRAITORS-GATE>
							<RT-DO-WALK ,P?SOUTH>
						)
						(<MC-HERE? ,RM-OUTSIDE-TRAITORS-GATE>
							<RT-DO-WALK ,P?NORTH>
						)
					>
				)
				(<MC-VERB? CLOSE LOWER>
					<COND
						(<MC-IS? ,LG-PORTCULLIS-DOOR ,FL-OPENED>
							<TELL "It's jammed open." CR>
						)
					>
				)
				(<MC-VERB? SHOOT>
					<TELL ,K-RICOCHET-MSG CR>
				)
				(<MC-VERB? REACH-IN>
					<COND
						(<MC-IS? ,LG-PORTCULLIS-DOOR ,FL-OPENED>
							<RT-CYOU-MSG>
							<TELL
"can't do that. " CTHE ,LG-PORTCULLIS-DOOR " is up." CR
							>
						)
						(T
							<RT-CYOU-MSG "put" "puts">
							<TELL
THEO " through " THEI ", but can't reach anything on the other side." CR
							>
						)
					>
				)
			>
		)
		(<MC-THIS-PRSI?>
			<COND
				(<AND <MC-VERB? THROW>
						<MC-VERB-WORD? PUT>
						<MC-PRSO? TH-HANDS TH-FOOT TH-FEET>
					>
					<COND
						(<MC-IS? ,LG-PORTCULLIS-DOOR ,FL-OPENED>
							<RT-CYOU-MSG>
							<TELL
"can't do that. " CTHE ,LG-PORTCULLIS-DOOR " is up." CR
							>
						)
						(T
							<RT-CYOU-MSG "put" "puts">
							<TELL
THEO " through " THEI ", but can't reach anything on the other side." CR
							>
						)
					>
				)
			>
		)
	>		
>

;*****************************************************************************
; "LOCALS3.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-DF-LG-PORTCULLIS-DOOR"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-LG-PORTCULLIS-DOOR ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-DF "LG-PORTCULLIS-DOOR">
		)
		(T
		)
	>
	<RFALSE>
>

<CONSTANT K-TIPSY-MSG
"You start to drink the wine and get a little tipsy. But even in your
altered state of consciousness you soon realize you'll never be able
to drink all of it."
>

<CONSTANT K-BULLET-MSG
"The bullet knocks out the bung, which"
>

;*****************************************************************************
; "end of file"
;*****************************************************************************

