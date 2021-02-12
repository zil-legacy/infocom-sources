;*****************************************************************************
; "game : SHERLOCK!"
; "file : BANK.ZIL"
; "auth :   $Author:   RAB  $"
; "date :     $Date:   28 Oct 1987 17:47:38  $"
; "revs : $Revision:   1.89  $"
; "vers : 1.00"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "Constants"
;-----------------------------------------------------------------------------

<CONSTANT K-GEM-BOX-NUM 600>	;"Box number containing the gem."

;*****************************************************************************
; "PUZZLES.ZIL"
;*****************************************************************************

<ROUTINE RT-KIDNAP ()
	<MOVE ,CH-HOLMES ,RM-LAIR>
	<MOVE ,TH-ROPE ,CH-HOLMES>
	<MC-MAKE ,CH-HOLMES ,FL-LOCKED>
	<PUTP ,TH-ROPE ,P?AUX1 ,CH-HOLMES>
	<MC-UNMAKE ,CH-MYCROFT-HOLMES ,FL-LOCKED>
	<SETG GL-PUPPY <>>
	<TELL
CR
"Suddenly, someone grabs you from behind, pins your arms to your sides, and
covers up your head. You struggle fiercely to get loose, but to no
avail. Then you hear a voice shout, \"Let him go, we've got the other
one.\"" CR CR

"The person holding you knocks you on the head and flings you to the
ground. You lose consciousness for a few moments, and when you awake, you
are alone." CR CR

"Sherlock Holmes has been kidnapped." CR
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-WIGGINS-HELP-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-WIGGINS-HELP-MSG ()
	<TELL
CTHE ,CH-WIGGINS " says, \"I saw it all, guv'nor. But it was over before I
could lift a finger. Mr. 'Olmes was a friend to me, 'e was. And I'd do
anyfing to 'elp you get 'im back.\"" CR
	>
	<SETG GL-PUPPY ,CH-WIGGINS>
	<MC-UNMAKE ,CH-WIGGINS ,FL-NODESC>
	<MC-UNMAKE ,CH-WIGGINS ,FL-BROKEN>
	<SETG GL-PUPPY-MSG? <>>
>

;-----------------------------------------------------------------------------
; "RT-STEAL-KEY"
;-----------------------------------------------------------------------------

<ROUTINE RT-STEAL-KEY ()
	<COND
		(<MC-ISNOT? ,TH-BOX-KEY ,FL-COLD>
			<MC-MAKE ,TH-BOX-KEY ,FL-COLD>
			<MOVE ,TH-BOX-KEY ,CH-PLAYER>
			<TELL 
CTHE ,CH-WIGGINS " casually strolls past the guard and says, \"Cor
blimey. That bird isn't 'alf built, is she?\" While the guard's attention
is diverted, Wiggins' hand flashes in and out of his
pocket. Then just as casually as before, he strolls back to you,
slips something into your hand, and whispers, \"Sorry I couldn't get
everything, guv. I 'ope this is enough.\"" CR
			>
			<RT-UPDATE-SCORE <GETP ,TH-BOX-KEY ,P?VALUE>>
			<PUTP ,TH-BOX-KEY ,P?VALUE 0>
		)
		(T
			<TELL
"\"Sorry, guv. 'E'll never go for it twice.\"" CR
			>
		)
	>
	<RTRUE>
>

;*****************************************************************************
; "THINGS1.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "TH-INTNUM"
;-----------------------------------------------------------------------------

<OBJECT TH-INTNUM
   (LOC GLOBAL-OBJECTS)
   (DESC "number")
   (FLAGS FL-NODESC FL-SEEN)
   (SYNONYM INTNUM NUMBER)
	(GENERIC RT-GN-INTNUM)
	(ACTION RT-AC-TH-INTNUM)
>

;-----------------------------------------------------------------------------
; "TH-SAFETY-DEPOSIT-BOX"
;-----------------------------------------------------------------------------

<OBJECT TH-SAFETY-DEPOSIT-BOX
	(LOC RM-BANK-VAULT)
	(DESC "safety deposit box")
	(FLAGS FL-NODESC FL-CONTAINER FL-OPENABLE FL-LOCKED)
	(SYNONYM INTNUM)
	(ADJECTIVE SAFETY DEPOSIT BOX NUMBER)
	(CAPACITY 10)
	(AUX1 0)		;"Box number"
	(GENERIC RT-GN-INTNUM)
	(ACTION RT-AC-TH-SAFETY-DEPOSIT-BOX)
	(DESCFCN RT-DF-TH-SAFETY-DEPOSIT-BOX)
>

;-----------------------------------------------------------------------------
; "TH-RING"
;-----------------------------------------------------------------------------

<OBJECT TH-RING
	(DESC "ring")
	(FLAGS FL-TAKEABLE FL-NOALL FL-CLOTHING)
	(SYNONYM RING)
	(ADJECTIVE SIGNET)
	(VALUE 1)
	(SIZE 1)
	(MASS 1)
	(ACTION RT-AC-TH-RING)
	(DESCFCN RT-DF-TH-RING)
>

;-----------------------------------------------------------------------------
; "TH-SHILLING"
;-----------------------------------------------------------------------------

<OBJECT TH-SHILLING
	(LOC CH-MYCROFT-HOLMES)
	(DESC "shilling")
	(FLAGS FL-TAKEABLE FL-MONEY)
	(SYNONYM SHILLING COIN)
	(VALUE 0)
	(SIZE 1)
	(MASS 1)
	(ACTION RT-AC-TH-SHILLING)
	(DESCFCN RT-DF-TH-SHILLING)
>

;-----------------------------------------------------------------------------
; "TH-BOX-KEY"
;-----------------------------------------------------------------------------

<OBJECT TH-BOX-KEY
	(LOC TH-GUARDS-POCKET)
	(DESC "key")
	(FLAGS FL-TAKEABLE)
	(SYNONYM KEY)
	(ADJECTIVE MASTER)
	(SIZE 1)
   (VALUE 1)
	(AUX1 0)		;"Box the key is in"
	(ACTION RT-AC-TH-BOX-KEY)
	(DESCFCN RT-DF-TH-BOX-KEY)
>

;-----------------------------------------------------------------------------
; "TH-BOX-LOCK"
;-----------------------------------------------------------------------------

<OBJECT TH-BOX-LOCK
	(LOC RM-BANK-VAULT)
	(DESC "lock")
	(FLAGS FL-NODESC FL-CONTAINER FL-OPENED)
	(SYNONYM INTNUM)
	(ADJECTIVE LOCK NUMBER)
   (AUX1 0)    ;"Lock number"
	(GENERIC RT-GN-INTNUM)
	(ACTION RT-AC-TH-BOX-LOCK)
	(DESCFCN RT-DF-TH-BOX-LOCK)
>

;-----------------------------------------------------------------------------
; "TH-BOXES"
;-----------------------------------------------------------------------------

<OBJECT TH-BOXES
	(LOC RM-BANK-VAULT)
	(DESC "safety deposit boxes")
	(FLAGS FL-NODESC FL-PLURAL FL-OPENABLE FL-CONTAINER)
	(SYNONYM BOXES)
	(ADJECTIVE SAFETY DEPOSIT)
	(ACTION RT-AC-TH-BOXES)
	(DESCFCN RT-DF-TH-BOXES)
>

;-----------------------------------------------------------------------------
; "TH-GUARDS-POCKET"
;-----------------------------------------------------------------------------

<OBJECT TH-GUARDS-POCKET
	(LOC CH-BANK-GUARD)
	(DESC "guard's pocket")
	(FLAGS FL-NODESC FL-CONTAINER FL-OPENED FL-TRYTAKE)
	(SYNONYM POCKET)
	(ADJECTIVE GUARD\'S)
	(CAPACITY 10)
	(ACTION RT-AC-TH-GUARDS-POCKET)
	(DESCFCN RT-DF-TH-GUARDS-POCKET)
>

;*****************************************************************************
; "THINGS2.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-AC-TH-INTNUM"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-INTNUM ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-TH-AC "TH-INTNUM" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<MC-VERB? WAIT-FOR WAIT VERIFY>
			<RFALSE>
		)
		(<MC-VERB? SHOOT>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
		(<NOT <MC-HERE? ,RM-BANK-VAULT>>
			<COND
				(<EQUAL? ,GL-P-NUMBER -1>
					<RT-CYOU-MSG "do" "does">
					<TELL "not see that here." CR>
				)
				(T
					<RT-CYOU-MSG "do" "does">
					<TELL "not need to use a number here." CR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-SHILLING"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-SHILLING ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-TH-AC "TH-SHILLING" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSI?>
			<RFALSE>
		)
		(<MC-THIS-PRSO?>
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-RING"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-RING ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-TH-AC "TH-RING" .CONTEXT>
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
				(<MC-VERB? WEAR>
					<TELL "It's the wrong size." CR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-BOX-KEY"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-BOX-KEY ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-TH-AC "TH-BOX-KEY" .CONTEXT>
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
				(<MC-VERB? TURN>
					<COND
						(<IN? ,TH-BOX-KEY ,TH-BOX-LOCK>
							<COND
								(<EQUAL? <GETP ,TH-BOX-KEY ,P?AUX1> ,K-GEM-BOX-NUM>
									<COND
										(<MC-IS? ,TH-SAFETY-DEPOSIT-BOX ,FL-OPENED>
											<TELL "The box is already open." CR>
										)
										(T
											<PUTP ,TH-SAFETY-DEPOSIT-BOX ,P?AUX1 <GETP ,TH-BOX-LOCK ,P?AUX1>>
											<RT-CYOU-MSG "open" "opens">
											<TELL "the box with the key.">
											<COND
												(<FIRST? ,TH-SAFETY-DEPOSIT-BOX>
													<TELL " Inside you see ">
													<RT-PRINT-CONTENTS-2 ,TH-SAFETY-DEPOSIT-BOX>
													<TELL ".">
												)
											>
											<MC-MAKE ,TH-SAFETY-DEPOSIT-BOX ,FL-OPENED>
											<MC-UNMAKE ,TH-SAFETY-DEPOSIT-BOX ,FL-LOCKED>
											<CRLF>
										)
									>
								)
								(T
									<RT-CYOU-MSG "open" "opens">
									<TELL ,K-NOTHING-INSIDE-MSG>
									<RT-YOU-MSG "lock" "locks">
									<TELL "it back up again." CR>
								)
							>
						)
					>
				)
				(<MC-VERB? READ>
					<TELL "It says, \"Master.\"" CR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-BOX-LOCK"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-BOX-LOCK ("OPTIONAL" (CONTEXT <>) "AUX" NUM)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-TH-AC "TH-BOX-LOCK" .CONTEXT>
		)
		(T
		)
	>
   <COND
		(<EQUAL? ,GL-P-NUMBER -1>
			<COND
				(<ZERO? <GETP ,TH-BOX-LOCK ,P?AUX1>>
					<TELL ,K-SPECIFY-MSG "lock by number." CR>
               <RTRUE>
				)
			>
		)
		(<OR	<L? ,GL-P-NUMBER 1>
				<G? ,GL-P-NUMBER 1000>
			>
			<TELL "There is no lock number " N ,GL-P-NUMBER "." CR>
         <RTRUE>
		)
		(T
			<PUTP ,TH-BOX-LOCK ,P?AUX1 ,GL-P-NUMBER>
		)
   >
	<SET NUM <GETP ,TH-BOX-LOCK ,P?AUX1>>
	<COND
		(<MC-THIS-PRSI?>
			<COND
				(<MC-VERB? PUT>
					<COND
						(<MC-PRSO? ,TH-BOX-KEY>
							<MOVE ,TH-BOX-KEY ,TH-BOX-LOCK>
							<PUTP ,TH-BOX-KEY ,P?AUX1 <GETP ,TH-BOX-LOCK ,P?AUX1>>
							<TELL "The key fits nicely." CR>
						)
                  (T
							<RT-CANT-PUT-IN-ON-MSG>
						)
					>
				)
				(<MC-VERB? TAKE>
					<COND
						(<NOT <MC-PRSO? ,TH-BOX-KEY>>
							<RFALSE>
						)
						(<IN? ,TH-BOX-KEY ,TH-BOX-LOCK>
							<MOVE ,TH-BOX-KEY ,GL-WINNER>
							<PUTP ,TH-BOX-KEY ,P?AUX1 0>
							<TELL "The key comes out smoothly." CR>
						)
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
; "RT-AC-TH-SAFETY-DEPOSIT-BOX"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-SAFETY-DEPOSIT-BOX ("OPTIONAL" (CONTEXT <>) "AUX" NUM)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-TH-AC "TH-SAFETY-DEPOSIT-BOX" .CONTEXT>
		)
		(T
		)
	>
   <COND
		(<EQUAL? ,GL-P-NUMBER -1>
			<COND
				(<ZERO? <GETP ,TH-SAFETY-DEPOSIT-BOX ,P?AUX1>>
					<TELL ,K-SPECIFY-MSG "box by number." CR>
               <RTRUE>
				)
			>
		)
		(<OR	<L? ,GL-P-NUMBER 1>
				<G? ,GL-P-NUMBER 1000>
			>
			<TELL "There is no box number " N ,GL-P-NUMBER "." CR>
         <RTRUE>
		)
		(T
			<PUTP ,TH-SAFETY-DEPOSIT-BOX ,P?AUX1 ,GL-P-NUMBER>
		)
   >
	<SET NUM <GETP ,TH-SAFETY-DEPOSIT-BOX ,P?AUX1>>
	<COND
		(<MC-THIS-PRSI?>
			<COND
				(<MC-VERB? TAKE PUT FILL EMPTY-INTO POUR-FROM>
					<COND
						(<OR	<NOT <EQUAL? .NUM ,K-GEM-BOX-NUM>>
								<MC-ISNOT? ,TH-SAFETY-DEPOSIT-BOX ,FL-OPENED>
							>
							<TELL CTHEI " is closed." CR>
						)
					>
				)
			>
		)
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? UNLOCK OPEN OPEN-WITH>
					<COND
						(<NOT <MC-PRSI? <> ,TH-BOX-KEY>>
							<RT-CYOU-MSG>
							<TELL "can't " VW " " THEO " with " THEI "." CR>
						)
						(<AND	<NOT <IN? ,TH-BOX-KEY ,GL-WINNER>>
								<NOT <EQUAL? .NUM <GETP ,TH-BOX-KEY ,P?AUX1>>>
							>
							<RT-CYOU-MSG "do" "does">
							<TELL "not have the key." CR>
						)
						(<EQUAL? .NUM ,K-GEM-BOX-NUM>
							<COND
								(<MC-IS? ,TH-SAFETY-DEPOSIT-BOX ,FL-OPENED>
									<TELL "It is already open." CR>
								)
								(T
									<RT-CYOU-MSG "open" "opens">
									<TELL "the box with the key.">
									<COND
										(<FIRST? ,TH-SAFETY-DEPOSIT-BOX>
											<TELL " Inside you see ">
											<RT-PRINT-CONTENTS-2 ,TH-SAFETY-DEPOSIT-BOX>
											<TELL ".">
										)
									>
									<MC-MAKE ,TH-SAFETY-DEPOSIT-BOX ,FL-OPENED>
									<MC-UNMAKE ,TH-SAFETY-DEPOSIT-BOX ,FL-LOCKED>
									<CRLF>
								)
							>
						)
						(T
							<RT-CYOU-MSG "open" "opens">
							<TELL ,K-NOTHING-INSIDE-MSG>
							<RT-YOU-MSG "lock" "locks">
							<TELL "it back up again." CR>
						)
					>
					<RTRUE>
				)
				(<MC-VERB? LOCK CLOSE>
					<COND
						(<EQUAL? .NUM ,K-GEM-BOX-NUM>
							<COND
								(<MC-ISNOT? ,TH-SAFETY-DEPOSIT-BOX ,FL-OPENED>
									<TELL ,K-CLOSED-AND-LOCKED-MSG CR>
								)
								(T
									<RT-CYOU-MSG "close and lock" "closes and locks">
									<TELL "the box with the key.">
									<MC-UNMAKE ,TH-SAFETY-DEPOSIT-BOX ,FL-OPENED>
									<MC-MAKE ,TH-SAFETY-DEPOSIT-BOX ,FL-LOCKED>
									<CRLF>
								)
							>
						)
						(T
							<TELL ,K-CLOSED-AND-LOCKED-MSG CR>
						)
					>
					<RTRUE>
				)
				(<MC-VERB? READ>
					<TELL N <GETP ,TH-SAFETY-DEPOSIT-BOX ,P?AUX1> CR>
				)
				(<MC-VERB? LOOK-INSIDE SEARCH>
					<COND
						(<OR	<NOT <EQUAL? .NUM ,K-GEM-BOX-NUM>>
								<MC-ISNOT? ,TH-SAFETY-DEPOSIT-BOX ,FL-OPENED>
							>
							<TELL CTHEO " is closed." CR>
						)
						(T
							<TELL "Inside " THEO>
							<RT-YOU-MSG "see" "sees">
							<RT-PRINT-CONTENTS-2 ,TH-SAFETY-DEPOSIT-BOX>
							<TELL "." CR>
						)
					>
				)
				(<MC-VERB? EMPTY REACH-IN>
					<COND
						(<OR	<NOT <EQUAL? .NUM ,K-GEM-BOX-NUM>>
								<MC-ISNOT? ,TH-SAFETY-DEPOSIT-BOX ,FL-OPENED>
							>
							<TELL CTHEO " is closed." CR>
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
; "RT-AC-TH-DIAL"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-DIAL ("OPTIONAL" (CONTEXT <>) "AUX" (LOCK? 0) WHO PTS)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-TH-AC "TH-DIAL" .CONTEXT>
		)
		(T
		)
	>

	<COND
		(<ZERO? <GETP ,TH-DIAL ,P?AUX1>>
			<PUTP ,TH-DIAL ,P?AUX1 ,TH-RIGHT>
		)
	>

	<COND
		(<MC-THIS-PRSI?>
			<RFALSE>
		)
		(<MC-THIS-PRSO?>
			<COND
				(<AND <MC-VERB? TUNE-TO>
						<NOT <MC-PRSI? <> TH-LEFT TH-RIGHT>>
					>
					<RT-CYOU-MSG>
					<TELL "can't " VW " " THE ,TH-DIAL " to " THEI "." CR>
				)
				(<MC-VERB? TUNE-TO SPIN TURN>
					<COND
						(<MC-PRSI? <> TH-LEFT TH-RIGHT TH-HANDS>
							<COND
								(<MC-ISNOT? ,TH-STETHOSCOPE ,FL-WORN>
									<SET LOCK? 1>
									<TELL "The dial turns smoothly." CR>
								)
								(<NOT <MC-LISTEN? ,TH-DIAL ,LG-BANK-VAULT-DOOR ,LG-VAULT>>
									<SET LOCK? 1>
									<TELL "The dial turns quietly." CR>
								)
								(<IN? ,TH-COTTON-BALLS ,TH-EARS>
									<SET LOCK? 1>
									<TELL "The dial turns with a series of muffled clicks." CR>
								)
								(<MC-IS? ,LG-BANK-VAULT-DOOR ,FL-OPENED>
									<SET LOCK? 2>
									<TELL "Clunk." CR>
								)
								(<NOT <EQUAL? <GETP ,TH-DIAL ,P?AUX1> ,GL-PRSI>>
									<SET LOCK? 1>
									<TELL "Clunk." CR>
								)
								(T
									<PUTP ,TH-DIAL ,P?AUX2 <+ <GETP ,TH-DIAL ,P?AUX2> 1>>
								)
							>
							<COND
								(<EQUAL? .LOCK? 1>
									T
								)
								(<EQUAL? <GETP ,TH-DIAL ,P?AUX2> 1>
									<PUTP ,TH-DIAL ,P?AUX1 ,TH-RIGHT>
									<TELL "Whirr." CR>
								)
								(<EQUAL? <GETP ,TH-DIAL ,P?AUX2> 2>
									<PUTP ,TH-DIAL ,P?AUX1 ,TH-LEFT>
									<TELL "Click." CR>
								)
								(<EQUAL? <GETP ,TH-DIAL ,P?AUX2> 3>
									<PUTP ,TH-DIAL ,P?AUX1 ,TH-RIGHT>
									<TELL "Click." CR>
								)
								(<EQUAL? <GETP ,TH-DIAL ,P?AUX2> 4>
									<PUTP ,TH-DIAL ,P?AUX1 ,TH-RIGHT>
									<TELL "Whirr." CR>
								)
								(<EQUAL? <GETP ,TH-DIAL ,P?AUX2> 5>
									<SET LOCK? 2>
									<TELL "Click. Kerchunk. The vault door swings open." CR>
									<SET WHO <RT-WHO-SAYS?>>
									<COND
										(<EQUAL? .WHO ,CH-HOLMES>
											<TELL CR
"Holmes says, \"Splendid, Watson. The net is drawing ever tighter
around our quarry.\"" CR
											>
										)
									>
									<SET PTS <GETP ,LG-BANK-VAULT-DOOR ,P?VALUE>>
									<COND
										(<NOT <ZERO? .PTS>>
											<RT-UPDATE-SCORE .PTS>
											<PUTP ,LG-BANK-VAULT-DOOR ,P?VALUE 0>
										)
									>
								)
							>
						)
						(T
							<RT-IMPOSSIBLE-MSG>
						)
					>
					<COND
						(<EQUAL? .LOCK? 1>
							<PUTP ,TH-DIAL ,P?AUX1 0>
							<PUTP ,TH-DIAL ,P?AUX2 0>
						)
						(<EQUAL? .LOCK? 2>
							<PUTP ,TH-DIAL ,P?AUX1 -1>
							<PUTP ,TH-DIAL ,P?AUX2 -1>
							<MC-UNMAKE ,LG-BANK-VAULT-DOOR ,FL-LOCKED>
							<MC-MAKE ,LG-BANK-VAULT-DOOR ,FL-OPENED>
						)
					>
					<RTRUE>
				)
				(<MC-VERB? SHOOT>
					<TELL ,K-RICOCHET-MSG CR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-BOXES"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-BOXES ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-BOXES">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? UNLOCK LOCK OPEN CLOSE READ>
			<TELL ,K-SPECIFY-MSG "box by number." CR>
			<MC-RFATAL>
		)
		(<MC-VERB? SHOOT>
			<TELL ,K-RICOCHET-MSG CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-GUARDS-POCKET"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-GUARDS-POCKET ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-AC "TH-GUARDS-POCKET">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? LOOK-INSIDE EXAMINE SEARCH>
			<RT-CYOU-MSG>
			<TELL "can't see inside the guard's pocket." CR>
			<RTRUE>
		)
		(<MC-VERB? PUT>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
		(<MC-VERB? TAKE EMPTY REACH-IN STEAL>
			<TELL
CTHE ,CH-BANK-GUARD " slaps the offending hand away and says, \"Keep your
hands to yourself, mate.\"" CR
			>
			<RTRUE>
		)
	>
>

;*****************************************************************************
; "THINGS3.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-DF-TH-SHILLING"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-SHILLING ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-TH-DF "TH-SHILLING" .CONTEXT>
		)
		(T
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-RING"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-RING ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-TH-DF "TH-RING" .CONTEXT>
		)
		(T
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-BOX-KEY"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-BOX-KEY ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-TH-DF "TH-BOX-KEY" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<OR  <IN? ,TH-BOX-KEY ,TH-GUARDS-POCKET>
				<IN? ,TH-BOX-KEY ,CH-BANK-GUARD>
			>
			<RT-CYOU-MSG>
			<TELL
"can't see it. The guard has it." CR
			>
			<RTRUE>
		)
		(T
			<TELL
CTHE ,TH-BOX-KEY " has the word \"Master\" written on it." CR
			>
		)
	>
>
	
;-----------------------------------------------------------------------------
; "RT-DF-TH-BOX-LOCK"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-BOX-LOCK ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-TH-DF "TH-BOX-LOCK" .CONTEXT>
		)
		(T
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-SAFETY-DEPOSIT-BOX"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-SAFETY-DEPOSIT-BOX ("OPTIONAL" (CONTEXT <>) "AUX" NUM)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-TH-DF "TH-SAFETY-DEPOSIT-BOX" .CONTEXT>
		)
		(T
		)
	>
	<SET NUM <GETP ,TH-SAFETY-DEPOSIT-BOX ,P?AUX1>>
	<TELL "It looks the same as all the other boxes">
;	<COND
		(<EQUAL? .NUM ,K-GEM-BOX-NUM>
			<TELL ", although the lock looks somewhat newer">
		)
	>
	<TELL "." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-DIAL"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-DIAL ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-TH-DF "TH-DIAL" .CONTEXT>
		)
		(T
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-BOXES"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-BOXES ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-DF "TH-BOXES">
		)
		(T
		)
	>
	<TELL
"There are rows and rows of safety deposit boxes, all alike, numbered from 1
to 1,000." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-GUARDS-POCKET"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-GUARDS-POCKET ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-DF "TH-GUARDS-POCKET">
		)
		(T
		)
	>
	<RFALSE>
>

;*****************************************************************************
; "PEOPLE2.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-AC-CH-BANK-GUARD"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-CH-BANK-GUARD ("OPTIONAL" (CONTEXT <>) "AUX" GEMCNT OBJ)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-CH-AC "CH-BANK-GUARD" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-BANK-GUARD>
	<COND
		(<RT-TELL-ABOUT? ,CH-BANK-GUARD>
			<SET OBJ
				<COND
					(<MC-VERB? WHO WHAT>
						,GL-PRSO
					)
					(T
						,GL-PRSI
					)
				>
			>
			<TELL ,K-GUARD-IGNORES-MSG CR>
		)
		(<RT-WHO-WHAT-FAIL?>
			<MC-RFATAL>
		)
		(<MC-THIS-WINNER?>
			<COND
				(<MC-VERB? GIVE>
					<COND
						(<MC-PRSO? ,TH-BOX-KEY ,TH-GUARDS-KEYS>
							<TELL ,K-SORRY-MATE-MSG CR>
						)
						(<MC-PRSO? TH-OPAL TH-RUBY TH-SAPPHIRE TH-EMERALD>
							<TELL ,K-ILL-HOLD-IT-MSG CR>
						)
					>
				)
				(T
					<TELL ,K-GUARD-IGNORES-MSG CR>
				)
			>
		)
		(<MC-THIS-PRSI?>
			<COND
				(<MC-VERB? GIVE>
					<COND
						(<MC-PRSO? TH-OPAL TH-RUBY TH-SAPPHIRE TH-EMERALD>
							<MOVE ,GL-PRSO ,CH-BANK-GUARD>
							<MC-MAKE ,GL-PRSO ,FL-NOALL>
							<SET GEMCNT <GETP ,CH-BANK-GUARD ,P?AUX1>>
							<INC GEMCNT>
							<PUTP ,CH-BANK-GUARD ,P?AUX1 .GEMCNT>
							<COND
								(<EQUAL? .GEMCNT 1>
									<TELL
"\"Now this is very nice. But I think I would need more than just one to make
letting you in worth my while. I'll hold this for you until you come back.\"" CR
									>
								)
								(<EQUAL? .GEMCNT 2>
									<TELL
"\"This is even more beautiful than the other one. But it isn't worth taking
the risk for only two of them.\"" CR
									>
								)
								(<EQUAL? .GEMCNT 3>
									<TELL
"\"One more and you're in.\"" CR
									>
								)
								(<EQUAL? .GEMCNT 4>
									<TELL
CTHE ,CH-BANK-GUARD " looks furtively up and down the street. Then he
whispers to you out of the side of his mouth, \"Good enough. Go on in.\"" CR
									>
									<RT-UPDATE-SCORE 3>
								)
							>
							<RTRUE>
						)
						(<MC-PRSO? TH-BOX-KEY>
							<MOVE ,TH-BOX-KEY ,TH-GUARDS-POCKET>
							<TELL
CTHE ,CH-BANK-GUARD " looks surprised and says, \"Ta, mate. I didn't know
I dropped it. I'll have to keep it in a safer place.\" He puts the key
into one of his inside pockets." CR
							>
						)
						(<MC-PRSO? TH-RED-GLASS>
							<TELL
CTHE ,CH-BANK-GUARD " looks at it carefully and then hands it back
to you, saying, \"For a moment there, I thought this was a ruby. But
it's only a piece of glass.\"" CR CR

,K-MORE-VALUABLE-MSG CR
							>
						)
						(T
							<TELL
CTHE ,CH-BANK-GUARD " examines what you are offering and then declines
your bribe." CR CR

,K-MORE-VALUABLE-MSG CR
							>
						)
					>
				)
				(<MC-VERB? TAKE>
					<COND
						(<MC-PRSO? TH-OPAL TH-RUBY TH-SAPPHIRE TH-EMERALD>
							<TELL ,K-ILL-HOLD-IT-MSG CR>
						)
						(<MC-PRSO? ,TH-BOX-KEY ,TH-GUARDS-KEYS>
							<TELL ,K-SORRY-MATE-MSG CR>
						)
						(<MC-PRSO? CH-BANK-GUARD>
							<TELL CTHE ,CH-BANK-GUARD ,K-MUST-WEIGH-MSG CR>
						)
					>
				)
				(<MC-VERB? SHOW>
					<COND
						(<MC-PRSO? TH-OPAL TH-RUBY TH-SAPPHIRE TH-EMERALD TH-RED-GLASS>
							<TELL "\"My, what a loverly gem!\"" CR>
						)
						(<MC-PRSO? TH-BOX-KEY>
							<MOVE ,TH-BOX-KEY ,TH-GUARDS-POCKET>
							<TELL
CTHE ,CH-BANK-GUARD " looks surprised and says, \"Oh! Thank you. I must have
dropped it. I'll be sure to keep it in a safer place.\" He takes the key and
puts it in one of his inside pockets." CR 
							>
						)
					>
				)
			>
		)
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? TAKE>
					<COND
						(<MC-PRSI? <>>
							<TELL CTHE ,CH-BANK-GUARD ,K-MUST-WEIGH-MSG CR>
						)
					>
				)
				(<MC-VERB? ASK-FOR>
					<COND
						(<MC-PRSI? ,TH-BOX-KEY ,TH-GUARDS-KEYS>
							<TELL ,K-SORRY-MATE-MSG CR>
						)
						(<MC-PRSI? TH-OPAL TH-RUBY TH-SAPPHIRE TH-EMERALD>
							<TELL ,K-ILL-HOLD-IT-MSG CR>
						)
					>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-CH-WIGGINS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-CH-WIGGINS ("OPTIONAL" (CONTEXT <>) OBJ)
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-AC "CH-WIGGINS" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-WIGGINS>
	<COND
		(<RT-TELL-ABOUT? ,CH-WIGGINS>
			<SET OBJ
				<COND
					(<MC-VERB? WHO WHAT>
						,GL-PRSO
					)
					(T
						,GL-PRSI
					)
				>
			>
			<COND
				(<MC-IS? ,CH-WIGGINS ,FL-ASLEEP>
					<RT-NO-CONDITION-MSG ,CH-WIGGINS>
				)
				(<AND <MC-VERB? WHO>
						<EQUAL? .OBJ ,CH-WIGGINS>
					>
					<TELL
"\"I'm Wiggins, 'ead o' the Baker Street Irregulars.\"" CR
					>
				)
				(<EQUAL? .OBJ ,CH-HOLMES>
					<TELL "\"E's a good man, guv'nor. Best as ever was.\"" CR>
				)
				(T
               <TELL "\"Beats me. What do you think?\"" CR>
				)
			>
		)
		(<RT-WHO-WHAT-FAIL?>
			<MC-RFATAL>
		)
		(<MC-THIS-WINNER?>
			<COND
				(<MC-IS? ,CH-WIGGINS ,FL-ASLEEP>
					<RT-NO-CONDITION-MSG ,CH-WIGGINS>
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
            (<MC-VERB? WHERE>
               <TELL "\"Beats me. What do you think?\"" CR>
            )
				(<ZERO? <GETP ,CH-WIGGINS ,P?AUX1>>
					<TELL CTHE ,CH-WIGGINS ,K-WOUNDED-PRIDE-MSG CR>
				)
				(<MC-VERB? ENTER>
					<COND
						(<MC-PRSO? TH-BUTT-OF-MALMSEY>
							<COND
								(<IN? ,CH-WIGGINS ,TH-BUTT-OF-MALMSEY>
									<TELL
"He's already up to his ears in malmsey." CR
									>
								)
								(T
									<MC-MAKE ,CH-WIGGINS ,FL-COLD>
									<TELL
"Wiggins dutifully climbs into the full butt of malmsey and has a
nice bath and gets out again." CR
									>
								)
							>
						)
						(<MC-PRSO? TH-EMPTY-BUTT-OF-MALMSEY>
							<COND
								(<IN? ,CH-WIGGINS ,TH-EMPTY-BUTT-OF-MALMSEY>
									<TELL
"He's already in it." CR
									>
								)
								(<IN? ,TH-GARNET ,TH-EMPTY-BUTT-OF-MALMSEY>
									<MOVE ,TH-GARNET ,CH-PLAYER>
									<RT-THIS-IS-IT ,TH-GARNET>
									<MC-MAKE ,CH-WIGGINS ,FL-COLD>
									<MC-MAKE ,TH-GARNET ,FL-SEEN>
									<MC-MAKE ,TH-GARNET ,FL-TOUCHED>
									<MC-UNMAKE ,TH-GARNET ,FL-NODESC>
									<TELL
"Wiggins climbs into the empty butt of malmsey, gets the gem, gets
out and gives it to you." CR
									>
									<RT-UPDATE-SCORE <GETP ,TH-GARNET ,P?VALUE>>
									<PUTP ,TH-GARNET ,P?VALUE 0>
									<RTRUE>
								)
								(T
									<TELL
"Wiggins says, \"Once was enough, thank you.\"" CR
									>
								)
							>
						)
						(<MC-PRSO? TH-HANSOM-CAB TH-GROWLER-CAB TH-BOAT>
							<COND
								(<IN? ,CH-HOLMES ,RM-LAIR>
									<COND
										(<IN? ,CH-PLAYER ,GL-PRSO>
											<TELL "Wiggins climbs in next to you." CR>
										)
										(T
											<TELL ,K-AFTER-YOU-MSG CR>
										)
									>
									<SETG GL-PUPPY ,CH-WIGGINS>
									<MC-UNMAKE ,CH-WIGGINS ,FL-NODESC>
									<MC-UNMAKE ,CH-WIGGINS ,FL-BROKEN>
								)
								(T
									<TELL ,K-CANT-LEAVE-MSG CR>
								)
							>
						)
						(<MC-PRSO? LG-WATER>
							<TELL
"\"I ain't no bleedin' mermaid. Besides, bathing ain't 'ealthy.\"" CR
							>
						)
					>
				)
				(<MC-VERB? TAKE STEAL>
					<COND
						(<AND <MC-PRSO? TH-GARNET>
								<IN? ,TH-GARNET ,TH-EMPTY-BUTT-OF-MALMSEY>
							>
							<MOVE ,TH-GARNET ,CH-PLAYER>
							<RT-THIS-IS-IT ,TH-GARNET>
							<MC-MAKE ,CH-WIGGINS ,FL-COLD>
							<MC-MAKE ,TH-GARNET ,FL-SEEN>
							<MC-MAKE ,TH-GARNET ,FL-TOUCHED>
							<MC-UNMAKE ,TH-GARNET ,FL-NODESC>
							<TELL CTHE ,CH-WIGGINS>
							<COND
								(<NOT <IN? ,CH-WIGGINS ,TH-EMPTY-BUTT-OF-MALMSEY>>
									<TELL " climbs into the empty butt of malsey,">
								)
							>
							<TELL " gets the gem, gets out, and gives it to you." CR>
							<RT-UPDATE-SCORE <GETP ,TH-GARNET ,P?VALUE>>
							<PUTP ,TH-GARNET ,P?VALUE 0>
							<RTRUE>
						)
						(<OR  <MC-PRSO? ,TH-GUARDS-POCKET ,TH-BOX-KEY ,TH-GUARDS-KEYS>
								<MC-PRSI? ,TH-GUARDS-POCKET ,CH-BANK-GUARD>
							>
							<RT-STEAL-KEY>
							<RTRUE>
						)
						(<MC-VERB? STEAL>
							<TELL
"\"I would if I could, guv. But I don't see 'ow to do it.\"" CR
							>
						)
					>
				)
				(<AND	<MC-VERB? ROB>
						<MC-PRSO? ,CH-BANK-GUARD>
					>
					<RT-STEAL-KEY>
				)
				(<MC-VERB? EMPTY REACH-IN SEARCH>
					<COND
						(<OR  <MC-PRSO? ,TH-GUARDS-POCKET ,CH-BANK-GUARD>
								<MC-PRSI? ,TH-GUARDS-POCKET ,CH-BANK-GUARD>
							>
							<RT-STEAL-KEY>
							<RTRUE>
						)
						(T
							<TELL
"\"I would if I could, guv. But I don't see 'ow to do it.\"" CR
							>
						)
					>
				)
				(<MC-VERB? FOLLOW>
					<COND
						(<MC-PRSO? ,CH-ME ,CH-PLAYER>
							<COND
								(<IN? ,CH-HOLMES ,RM-LAIR>
									<TELL
"\"After you, guv.\"" CR
									>
									<SETG GL-PUPPY ,CH-WIGGINS>
									<MC-UNMAKE ,CH-WIGGINS ,FL-NODESC>
									<MC-UNMAKE ,CH-WIGGINS ,FL-BROKEN>
								)
								(T
									<TELL ,K-CANT-LEAVE-MSG CR>
								)
							>
						)
						(T
							<TELL
"\"I'm not a bleedin' bloodhound.\"" CR
							>
						)
					>
				)
				(<MC-VERB? WAIT>
					<COND
						(<EQUAL? ,GL-PUPPY ,CH-WIGGINS>
							<SETG GL-PUPPY <>>
							<TELL
"\"Right. I'm glued to this spot.\"" CR
							>
						)
						(T
							<TELL
"\"Whatever you say, guv.\"" CR
							>
						)
					>
				)
				(<MC-VERB? EXIT>
					<COND
						(<EQUAL? ,GL-PUPPY ,CH-WIGGINS>
							<SETG GL-PUPPY <>>
							<TELL	,K-CAN-LEAVE-MSG CR>
						)
						(T
							<TELL	,K-CAN-LEAVE-MSG CR>
						)
					>
				)
				(<AND <MC-VERB? PULL>
						<MC-PRSO? ,TH-PORTCULLIS-CHAIN>
					>
					<TELL
"\"I can't reach it, guv.\"" CR
					>
				)
				(T
					<TELL
"Wiggins looks at you and scratches his head." CR
					>
				)
			>
		)
		(<MC-THIS-PRSI?>
			<COND
				(<MC-VERB? GIVE>
					<COND
						(<MC-IS? ,CH-WIGGINS ,FL-ASLEEP>
							<RT-NO-CONDITION-MSG ,CH-WIGGINS "accept your offer">
						)
						(<MC-PRSO? ,TH-SHILLING>
							<MOVE ,TH-SHILLING ,CH-WIGGINS>
							<MC-MAKE ,TH-SHILLING ,FL-NOALL>
							<PUTP ,CH-WIGGINS ,P?AUX1 1>
							<TELL
"Wiggins looks at " THE ,TH-SHILLING " and then at you. After a few
moments he stuffs it deep into the recesses of his clothing and says, \"I'm
all yours. Wot's the plan?\"" CR
							>
						)
						(<MC-PRSO?
								,TH-EMERALD
								,TH-SAPPHIRE
								,TH-RUBY
								,TH-OPAL
								,TH-TOPAZ
								,TH-GARNET
								,TH-POUND-NOTE
								,TH-SIXPENCE
							>
							<TELL
"Wiggins glances at your offer and" ,K-WOUNDED-PRIDE-MSG CR
							>
						)
						(T
							<TELL
"Wiggins looks at the item you have handed him and then returns it
to you. Clearly it was not of interest to him." CR
							>
						)
					>
					<RTRUE>
				)
				(<AND <MC-VERB? TAKE>
						<MC-PRSO? ,TH-SHILLING>
					>
					<COND
						(<MC-IS? ,CH-WIGGINS ,FL-ASLEEP>
							<TELL "He must have hidden it very well. ">
							<RT-CYOU-MSG>
							<TELL "can't find it." CR>
						)
						(T
							<TELL "Sorry, guv'nor. A deal's a deal." CR>
						)
					>
				)
			>
		)
		(<MC-THIS-PRSO?>
			<COND
            (<MC-VERB? SMELL>
					<COND
						(<MC-IS? ,CH-WIGGINS ,FL-COLD>
							<TELL ,K-EAU-DE-MSG CR>
						)
						(T
							<TELL "Yuck. Eau de urchin." CR>
						)
					>
            )
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-CH-MYCROFT-HOLMES"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-CH-MYCROFT-HOLMES ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-CH-AC "CH-MYCROFT-HOLMES" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-MYCROFT-HOLMES>
	<COND
		(<MC-THIS-WINNER?>
			<RFALSE>
		)
		(<MC-THIS-PRSI?>
			<RFALSE>
		)
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? ASK-FOR ASK-ABOUT>
					<TELL
"\"I sorry, What were you saying? I couldn't hear you because my stomach was
making very loud hungry noises. I haven't eaten in over three hours!\"" CR
					>
					<RTRUE>
				)
				(T
					<RFALSE>
				)
			>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-CH-BUTLER"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-CH-BUTLER ("OPTIONAL" (CONTEXT <>) "AUX" WORD-NUM)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-CH-AC "CH-BUTLER" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-BUTLER>
	<COND
      (<MC-THIS-WINNER?>
         <COND
				(<MC-IS? ,CH-BUTLER ,FL-ASLEEP>
					<RT-NO-CONDITION-MSG ,CH-BUTLER>
				)
            (<MC-VERB? HELLO>
               <TELL "\"">
					<COND
						(<EQUAL? <RT-TIME-OF-DAY> 0>
							<TELL "How do you do?">
						)
						(<EQUAL? <RT-TIME-OF-DAY> 1 2>
							<TELL "Good day.">
						)
						(<EQUAL? <RT-TIME-OF-DAY> 3>
							<TELL "Good evening.">
						)
					>
               <TELL "\"" CR>
            )
            (<MC-VERB? GOODBYE>
               <TELL "\"">
					<COND
						(<EQUAL? <RT-TIME-OF-DAY> 0>
							<TELL "Good night">
						)
						(<EQUAL? <RT-TIME-OF-DAY> 1 2>
							<TELL "Good day">
						)
						(<EQUAL? <RT-TIME-OF-DAY> 3>
							<TELL "Good evening">
						)
					>
               <TELL ".\"" CR>
            )
            (<MC-VERB? THANK>
               <TELL "\"You're quite welcome.\"" CR>
            )
				(<AND <MC-VERB? WHO>
						<MC-PRSO? ,CH-BUTLER>
					>
					<TELL
"\"I am one of the staff of this fine establishment.\"" CR
					>
				)
				(<MC-VERB? WHO WHAT WHERE>
					<TELL
"\"I'm far too discrete to respond.\"" CR
					>
				)
				(<MC-VERB? YES NO>
					<TELL
CTHE ,CH-BUTLER " looks at you expectantly." CR
					>
				)
            (T
               <TELL
"\"I'm afraid I am unable to do that.\"" CR
               >
            )
         >
      )
      (<MC-THIS-PRSO?>
         <COND
				(<MC-VERB? ASK-FOR ASK-ABOUT>
					<COND
						(<MC-IS? ,CH-BUTLER ,FL-ASLEEP>
							<RT-NO-CONDITION-MSG ,CH-BUTLER>
						)
						(<MC-PRSI? CH-MYCROFT-HOLMES>
							<COND
								(<MC-IS? ,CH-MYCROFT-HOLMES ,FL-LOCKED>
									<TELL
"\"I am very sorry but Mr. Mycroft Holmes is not available at this time.
Perhaps you would care to come back later?\"" CR
									>
								)
								(<MC-IS? ,CH-MYCROFT-HOLMES ,FL-ASLEEP>
									<MC-UNMAKE ,CH-MYCROFT-HOLMES ,FL-ASLEEP>
									<TELL
"The butler listens to you and then leaves. He comes back shortly." CR CR

"\"Mr. Mycroft Holmes requires that you offer some token to verify that you
are indeed the person you claim to be. Give whatever it is to me and I will
take it to him.\"" CR
									>
								)
								(T
									<TELL
"The butler listens politely but insists that he can do nothing more for you
than to deliver the token to Mr. Mycroft Holmes." CR
									>
								)
							>
						)
						(<MC-PRSI? ,CH-HOLMES>
							<TELL
"\"I am afraid that I know the younger Mr. Holmes only by his somewhat
colourful reputation.\"" CR
							>
						)
						(<MC-PRSI? ,CH-BUTLER>
							<TELL
"\"I am well, sir. Thank you for asking.\"" CR
							>
						)
						(<MC-PRSI? ,CH-PLAYER ,CH-ME>
							<TELL
"He looks down his nose at you and sniffs, \"I don't believe we've been
introduced.\"" CR
							>
						)
						(<MC-PRSI? ,CH-MEMBERS>
							<TELL
"\"They seem livlier than ususual for this time of year.\"" CR
							>
						)
						(<MC-PRSI? ,RM-DIOGENES-CLUB>
							<TELL
"The butler coughs deferentially, \"It is one of the most exclusive
clubs in London, sir.\" He glances at your clothes. \"Membership is by
invitation only.\"" CR
							>
						)
						(<MC-IS? ,GL-PRSI ,FL-PERSON>
							<COND
								(<MC-IS? ,GL-PRSI ,FL-PLURAL>
									<TELL
"\"Unfortunately, I can say nothing about them.\"" CR
									>
								)
								(<MC-IS? ,GL-PRSI ,FL-FEMALE>
									<TELL
"\"I am sorry but I can tell you nothing about her.\"" CR
									>
								)
								(T
									<TELL
"\"Much to my regret I can tell you nothing about him.\"" CR
									>
								)
							>
						)
						(T
							<TELL
"\"I'm afraid I wouldn't know anything about that.\"" CR
							>
						)
					>
				)
         >
      )
      (<MC-THIS-PRSI?>
         <COND
				(<MC-VERB? GIVE>
					<COND
						(<MC-IS? ,CH-BUTLER ,FL-ASLEEP>
							<RT-NO-CONDITION-MSG ,CH-BUTLER "accept your offer">
						)
						(<MC-IS? ,CH-MYCROFT-HOLMES ,FL-LOCKED>
							<TELL
"The butler politely declines to take the gift you have offered." CR
							>
						)
						(<MC-IS? ,CH-MYCROFT-HOLMES ,FL-ASLEEP>
							<TELL
"The butler refuses to take the item you have offered and asks if you
have come to speak with someone here in the club." CR
							>
						)
						(<MC-PRSO? TH-RING>
							<MC-MAKE ,CH-MYCROFT-HOLMES ,FL-SEEN>
							<MC-MAKE ,CH-MYCROFT-HOLMES ,FL-LOCKED>
							<REMOVE ,TH-RING>
							<TELL ,K-BUTLER-ACCEPTS-MSG CR CR

"After a few moments, Mycroft Holmes appears. He looks very worried." CR CR 

"\"Sherlock warned me that you might come,\" he says. \"And the fact
that you are here indicates that he is indeed in trouble. I believe that
in order to solve this mystery, you are going to have to go to the Tower
of London. It will be closed, but you can give the password '"
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
							<TELL
"' to the guard at the Byward Tower. He will let
you in. Good luck.\"" CR CR

"Mycroft pauses before he goes and looks at you meditatively, as if
trying to decide if he can put his faith in you to rescue his
brother. After a moment he gives his head an unconscious nod, then
turns around and disappears back into the club." CR
							>
							<RT-UPDATE-SCORE 1>
							<RTRUE>
						)
						(T
							<TELL ,K-BUTLER-ACCEPTS-MSG CR CR

"The butler soon returns looking concerned." CR CR

"\"I am sorry but Mr. Mycroft Holmes says this will not do. Do you have
anything else?\"" CR
							>
						)
					>
				)
         >
      )
	>
>

;*****************************************************************************
; "PEOPLE3.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-DF-CH-BANK-GUARD"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-CH-BANK-GUARD ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-CH-DF "CH-BANK-GUARD" .CONTEXT>
		)
		(T
		)
	>
	<TELL
CTHE ,CH-BANK-GUARD " is lounging against the wall, idly jangling some keys
in his pocket and waiting for girls to walk by." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-CH-WIGGINS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-CH-WIGGINS ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-WIGGINS" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-WIGGINS>
	<COND
		(<MC-IS? ,CH-WIGGINS ,FL-BROKEN>
			<MC-UNMAKE ,CH-WIGGINS ,FL-BROKEN>
			<MC-UNMAKE ,CH-WIGGINS ,FL-NODESC>
			<MC-MAKE ,CH-WIGGINS ,FL-SEEN>
			<TELL
"After staring at his dirty face for a few moments, you suddenly
recognize the boy. He is Wiggins, the head of the Baker Street
Irregulars, which is Holmes's unofficial army of street urchins
who \"go everywhere and do everything.\"" CR
			>
		)
	>
	<TELL
		<RT-PICK-NEXT ,GL-WIGGINS-DESC-TXT>
	>
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
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-DF-CH-MYCROFT-HOLMES"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-CH-MYCROFT-HOLMES ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-MYCROFT-HOLMES" .CONTEXT>
		)
		(T
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-CH-BUTLER"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-CH-BUTLER ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-BUTLER" .CONTEXT>
		)
		(T
		)
	>
	<RFALSE>
>

;*****************************************************************************
; "LOCALS2.ZIL"
;*****************************************************************************
	
;-----------------------------------------------------------------------------
; "RT-AC-LG-BANK-VAULT-DOOR"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-LG-BANK-VAULT-DOOR ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-AC "LG-BANK-VAULT-DOOR" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<MC-VERB? OPEN>
			<COND
				(<MC-IS? ,LG-BANK-VAULT-DOOR ,FL-OPENED>
					<TELL "The vault door is already open." CR>
				)
				(<MC-IS? ,LG-BANK-VAULT-DOOR ,FL-LOCKED>
					<TELL "The vault door is locked." CR>
				)
				(T
					<MC-MAKE ,LG-BANK-VAULT-DOOR ,FL-OPENED>
					<TELL "The vault door swings open." CR>
				)
			>
		)
		(<MC-VERB? CLOSE>
			<COND
				(<MC-ISNOT? ,LG-BANK-VAULT-DOOR ,FL-OPENED>
					<TELL "The vault door is already closed." CR>
				)
				(T
					<MC-UNMAKE ,LG-BANK-VAULT-DOOR ,FL-OPENED>
					<MC-MAKE ,LG-BANK-VAULT-DOOR ,FL-LOCKED>
					<PUTP ,TH-DIAL ,P?AUX1 0>
					<PUTP ,TH-DIAL ,P?AUX2 0>
					<TELL "The vault door swings closed and locks">
					<COND
						(<IN? ,CH-PLAYER ,RM-BANK-VAULT>
							<TELL " you in. Whoops!" CR CR>
							<RT-QSR>
						)
						(T
							<TELL "." CR>
						)
					>
				)
			>
		)
		(<MC-VERB? ENTER THROUGH>
			<COND
				(<MC-HERE? ,RM-BANK-VAULT>
					<RT-DO-WALK ,P?EAST>
				)
				(<MC-HERE? ,RM-BANK-OF-ENGLAND>
					<RT-DO-WALK ,P?WEST>
				)
			>
		)
		(<MC-VERB? LOOK-INSIDE>
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
		(<MC-VERB? SHOOT>
			<TELL ,K-RICOCHET-MSG CR>
		)
	>
>

;*****************************************************************************
; "LOCALS3.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-DF-LG-BANK-VAULT-DOOR"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-LG-BANK-VAULT-DOOR ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-DF "LG-BANK-VAULT-DOOR" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? ,GL-PLACE-CUR ,RM-BANK-OF-ENGLAND>
			<RT-OPEN-CLOSED-MSG ,LG-BANK-VAULT-DOOR>
			<CRLF> <CRLF>
			<TELL "In the middle of the door you see a big shiny dial." CR>
			<RTRUE>
		)
		(T
			<RT-OPEN-CLOSED-MSG ,LG-BANK-VAULT-DOOR>
			<CRLF> <CRLF>
			<TELL "The inside of the door is shiny and flat." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-LG-VAULT"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-LG-VAULT ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-DF "LG-VAULT" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? ,GL-PLACE-CUR ,RM-BANK-OF-ENGLAND>
			<COND
				(<MC-IS? ,LG-BANK-VAULT-DOOR ,FL-OPENED>
					<RT-DF-RM-BANK-VAULT 3>
					<RT-DESCRIBE-PLACE-CONTENTS ,RM-BANK-VAULT>
					<RTRUE>
				)
				(T
					<TELL
"It's a huge, reinforced-steel door that's set firmly into the wall."
CR CR
"In the middle of the door you see a big shiny dial." CR
					>
				)
			>
		)
		(T
			<RT-DF-RM-BANK-VAULT 3>
			<RT-DESCRIBE-PLACE-CONTENTS ,RM-BANK-VAULT>
			<RTRUE>
		)
	>
>

;*****************************************************************************
; "CONSTANTS"
;*****************************************************************************

<CONSTANT K-BUTLER-ACCEPTS-MSG
"The butler accepts the item and asks you to wait while he takes it to Mr.
Mycroft Holmes."
>

<CONSTANT K-MUST-WEIGH-MSG
" must weigh twice what you do. You won't be able to lift him."
>

<CONSTANT K-NOTHING-INSIDE-MSG
"the box with the key. You rummage around inside for a few moments
but discover nothing that would help you, so"
>

<CONSTANT K-FIDGETING-MSG
" is fidgeting nervously on the seat next to you"
>

<CONSTANT K-SPECIFY-MSG
"You must specify a particular "
>

<CONSTANT K-SORRY-MATE-MSG
"\"Sorry, mate. I've me own plans, you know.\""
>

<CONSTANT K-ENJOYING-RIDE-MSG
" looks like he is enjoying the boat ride"
>

<CONSTANT K-ILL-HOLD-IT-MSG
"\"Don't worry. I'll hold it for you.\""
>

<CONSTANT K-CLOSED-AND-LOCKED-MSG
"It is already closed and locked."
>

<CONSTANT K-MORE-VALUABLE-MSG
"\"If you expect me to let you in there, you'll have to offer me something a
lot more valuable than that.\""
>

<CONSTANT K-RICOCHET-MSG
"The bullet ricochets wildly."
>

<CONSTANT K-EAU-DE-MSG
"Mmmmmm. Eau de malmsey."
>

<CONSTANT K-CAN-LEAVE-MSG
"\"You can leave if you want to, guv. I'm waiting right here.\""
>

<CONSTANT K-AFTER-YOU-MSG
"\"After you, guv.\""
>

<CONSTANT K-CANT-LEAVE-MSG
"Wiggins sidles up next to you and whispers, \"I'd like to, guv. But Mr.
'Olmes done give me clear instructions not to leave this spot. Is there
anyfing else I can do for you?\""
>

<CONSTANT K-WOUNDED-PRIDE-MSG
" says with wounded pride, \"Sorry, guv. Me and Mr. 'Olmes has a deal. One
shilling's me price. Nothing more. Nothing less.\""
>

<CONSTANT K-GUARD-IGNORES-MSG
"The guard ignores you."
>

;*****************************************************************************
; "end of file"
;*****************************************************************************

