;*****************************************************************************
; "game : SHERLOCK!"
; "file : PLACES2.ZIL"
; "auth :   $Author:   RAB  $"
; "date :     $Date:   28 Oct 1987  4:31:22  $"
; "rev  : $Revision:   1.72  $"
; "vers : 1.00"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "this file contains:"
; "  action routines for all rooms"
; "  exit   routines for all rooms"
;-----------------------------------------------------------------------------

;*****************************************************************************
; "action and exit support routines"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-SURGE"
;-----------------------------------------------------------------------------

<ROUTINE RT-SURGE ()
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 0>
			<TELL
"The fog is so thick that even your light cannot
penetrate it, so you retrace your steps." CR
			>
			<RFALSE>
		)
		(T
			<TELL "Surging crowds of ">
			<COND
				(<EQUAL? ,GL-PLACE-CUR ,RM-KENSINGTON-GARDENS>
					<TELL "haughty nannies">
				)
				(<EQUAL? ,GL-PLACE-CUR ,RM-COVENT-GARDEN>
					<TELL "housewives intent on a bargain">
				)
				(T
					<TELL "tourists">
				)
			>
			<TELL " block your path." CR>
			<RFALSE>
		)
	>
>

;*****************************************************************************
; "action routines for rooms"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-AC-RM-MARYLEBONE-RD"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-RM-MARYLEBONE-RD ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-RM-AC "RM-MARYLEBONE-RD" .CONTEXT>
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-RM-MADAME-TUSSAUDS"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-RM-MADAME-TUSSAUDS ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-RM-AC "RM-MADAME-TUSSAUDS" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<AND <EQUAL? .CONTEXT ,K-M-ENTERED>
				<MC-ISNOT? ,TH-TOBACCO ,FL-ASLEEP>
				<MC-IS? ,TH-TOBACCO ,FL-LIGHTED>
			>
			<RT-UPDATE-SCORE 1>
			<MC-MAKE ,TH-TOBACCO ,FL-ASLEEP>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-AC-RM-MANUSCRIPT-ROOM"
; "FL-OPENED = player exited room while librarian was talking to him"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-RM-MANUSCRIPT-ROOM ("OPTIONAL" (CONTEXT <>) "AUX" VALUE)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-AC "RM-MANUSCRIPT-ROOM" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<AND <IN? ,CH-LIBRARIAN ,RM-MANUSCRIPT-ROOM>
				<MC-ISNOT? ,CH-LIBRARIAN ,FL-ASLEEP>
			>
			<COND
				(<AND <EQUAL? .CONTEXT ,K-M-ENTERED>
						<MC-IS? ,CH-LIBRARIAN ,FL-OPENED>
					>
					<TELL CR
CTHE ,CH-LIBRARIAN " says, \"Welcome back! I have more interesting things to
tell you!\"" CR
					>
					<RTRUE>
				)
				(<EQUAL? .CONTEXT ,K-M-EXIT>
					<TELL
"As you leave the librarian calls out, \"Must you be going? I have
so many other interesting things to tell you.\"" CR CR
					>
					<MC-MAKE ,CH-LIBRARIAN ,FL-OPENED>
				)
				(<EQUAL? .CONTEXT ,K-M-BEG>
					<COND
						(<OR
							<MC-VERB? WALK EXIT> 
							<INTBL? ,GL-PRSA <REST ,GL-GAME-VERBS 2> <GET ,GL-GAME-VERBS 0>>
							>
								<RFALSE>
						)
						(<MC-VERB? WAIT LISTEN>
							<TELL "The librarian says ">
							<COND
								(<IN? ,TH-COTTON-BALLS ,TH-EARS>
									<TELL "softly">
								)
								(T
									<TELL "loudly">
								)
							>
							<TELL ", ">
							<RT-LIBRARIAN-SAYS-MSG>
							<RTRUE>
						)
						(<MC-VERB? HUSH>
							<TELL
"The librarian stops in midsentence and gets an embarrassed look on
his face. \"Oh, I say. I'm sorry to have rambled on like this, but I do
so enjoy speaking with visitors. I get them so seldom, you know. Thank
you for listening.\"" CR CR

"He leaves the room, mumbling something to himself about the articulation of
the third joint of the hind leg of an extinct species of dung beetle." CR
							>
							<REMOVE ,CH-LIBRARIAN>
							<RTRUE>
						)
						(<MC-VERB? LOOK>
							<RT-DESC-ALL <> T>
							<TELL CR "As you look around, the librarian says ">
							<COND
								(<IN? ,TH-COTTON-BALLS ,TH-EARS>
									<TELL "softly">
								)
								(T
									<TELL "loudly">
								)
							>
							<TELL ", ">
							<RT-LIBRARIAN-SAYS-MSG>
							<RTRUE>
						)
						(<AND <MC-VERB? TELL>
								<MC-PRSO? ,CH-LIBRARIAN>
							>
							<RFALSE>
						)
						(<EQUAL? ,GL-P-PRSA-WORD ,W?ECHO>
							<TELL
"The librarian pauses for a second as if he is finally going to stop
talking...but then he continues "
							>
							<COND
								(<IN? ,TH-COTTON-BALLS ,TH-EARS>
									<TELL "quietly">
								)
								(T
									<TELL "noisily">
								)
							>
							<TELL " and says, ">
							<RT-LIBRARIAN-SAYS-MSG>
							<RTRUE>
						)
						(<INTBL? ,GL-PRSA <REST ,GL-TALK-VERBS 2> <GET ,GL-TALK-VERBS 0>>
							<TELL
"The librarian interrupts you as you attempt to speak, and "
							>
							<COND
								(<IN? ,TH-COTTON-BALLS ,TH-EARS>
									<TELL "whispers">
								)
								(T
									<TELL "says">
								)
							>
							<TELL ", ">
							<RT-LIBRARIAN-SAYS-MSG>
							<MC-RFATAL>
						)
						(T
							<TELL "The librarian launches off into another
speech, and it distracts you from what you wanted to do. ">
							<RT-LIBRARIAN-SAYS-MSG>
							<RTRUE>
						)
					>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-RM-VICTORIA-STREET"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-RM-VICTORIA-STREET ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-RM-AC "RM-VICTORIA-STREET" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<MC-VERB? WAIT>
			<COND
				(<MC-ISNOT? ,RM-VICTORIA-STREET ,FL-ASLEEP>
					<MC-MAKE ,RM-VICTORIA-STREET ,FL-ASLEEP>
					<TELL
"After a few moments, a constable strolls by, bops you on the head
with his billy club, and says, \"Move along, you.\"" CR
					>
					<RTRUE>
				)
				(T
					<TELL
"The same constable as before walks by and says, \"You again? That's it,
mate. Come along with me.\" He bops you on the head again and arrests you
on a charge of vagrancy." CR CR

"You spend the night in gaol, and in the morning Inspector Lestrade drops
by to tell you that there has been a mix-up in the paper-work and you are
to be deported to Australia the following day. He gives you a letter to
deliver to his sister in Melbourne and wishes you luck." CR CR
					>
					<RT-QSR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-RM-CLOCK-TOWER"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-RM-CLOCK-TOWER ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-RM-AC "RM-CLOCK-TOWER" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<NOT <RT-ALARM-SET? ,RT-I-SWING-BELL>>
			<RT-ZERO-SECONDS>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-AC-RM-THAMES-ONE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-RM-THAMES-ONE ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-AC "RM-THAMES-ONE" .CONTEXT>
		)
		(T
		)
	>
	<RT-PROCESS-BOAT-ON-THAMES>
>

;-----------------------------------------------------------------------------
; "RT-AC-RM-THAMES-TWO"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-RM-THAMES-TWO ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-AC "RM-THAMES-TWO" .CONTEXT>
		)
		(T
		)
	>
	<RT-PROCESS-BOAT-ON-THAMES>
>

;-----------------------------------------------------------------------------
; "RT-AC-RM-THAMES-THREE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-RM-THAMES-THREE ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-AC "RM-THAMES-THREE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<OR
			<AND <MC-VERB? EXAMINE LOOK-UNDER> <MC-PRSO? ,LG-LONDON-BRIDGE>>
			<AND <MC-VERB? LOOK-UP> <MC-PRSO? ,ROOMS ,LG-LONDON-BRIDGE>>
			>
				<TELL
"You see nothing of interest"
				>
				<COND
					(<IN? ,TH-CLUMP-OF-MOSS ,RM-THAMES-THREE>
						<MC-MAKE ,TH-CLUMP-OF-MOSS ,FL-SEEN>
						<MC-MAKE ,TH-SUPPORTS ,FL-SEEN>
						<TELL
", other than a clump of moss lodged among the supports overhead." CR
						>
					)
					(T
						<TELL "." CR>
					)
				>
				<RT-PROCESS-BOAT-ON-THAMES>
				<RTRUE>
		)
		(T
			<RT-PROCESS-BOAT-ON-THAMES>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-RM-THAMES-FOUR"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-RM-THAMES-FOUR ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-AC "RM-THAMES-FOUR" .CONTEXT>
		)
		(T
		)
	>
	<RT-PROCESS-BOAT-ON-THAMES>
>

;-----------------------------------------------------------------------------
; "RT-AC-RM-THAMES-FIVE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-RM-THAMES-FIVE ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-AC "RM-THAMES-FIVE" .CONTEXT>
		)
		(T
		)
	>
	<RT-PROCESS-BOAT-ON-THAMES>
>

;-----------------------------------------------------------------------------
; "RT-AC-RM-SHERMANS-HOUSE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-RM-SHERMANS-HOUSE ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-RM-AC "RM-SHERMANS-HOUSE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT ,K-M-ENTERED>
			<COND
; "If the house is asleep, then the player has entered it for the first time,
	and Sherman should not act -- DEB"
				(<MC-IS? ,RM-SHERMANS-HOUSE ,FL-ASLEEP>
					<MC-UNMAKE ,RM-SHERMANS-HOUSE ,FL-ASLEEP>
					<RFALSE>
				)
; "If the house is not asleep, then the player has entered it more than once,
	and Sherman should act based on whether or not the trained pigeon is alive
	-- DEB"
				(<MC-IS? ,CH-TRAINED-PIGEON ,FL-ALIVE>
					<TELL CR
"Sherman says, \"Welcome back. It's a pleasure to see you again.\"" CR
					>
					<RT-THIS-IS-IT ,CH-SHERMAN>
				)
				(T
					<RT-SHERMAN-RAGE T>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-RM-THREADNEEDLE-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-RM-THREADNEEDLE-ST ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-RM-AC "RM-THREADNEEDLE-ST" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<AND <EQUAL? .CONTEXT ,K-M-BEG>
				<IN? ,CH-HOLMES ,RM-LAIR>
				<MC-ISNOT? ,TH-TOPAZ ,FL-LOCKED>
			>
			<RT-WIGGINS-HELP-MSG>
			<CRLF>
			<MC-MAKE ,TH-TOPAZ ,FL-LOCKED>
		)
		(<AND <EQUAL? .CONTEXT ,K-M-ENTERED>
				<EQUAL? ,GL-PLACE-PRV ,RM-BANK-OF-ENGLAND>
				<MC-ISNOT? ,TH-TOPAZ ,FL-ASLEEP>
			>
			<RT-KIDNAP>
			<MC-MAKE ,TH-TOPAZ ,FL-ASLEEP>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-AC-RM-LONDON-BRIDGE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-RM-LONDON-BRIDGE ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-RM-AC "RM-LONDON-BRIDGE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<OR
			<AND <MC-VERB? LOOK-UNDER> <MC-PRSO? ,LG-LONDON-BRIDGE>>
			<AND <MC-VERB? LOOK-DOWN> <MC-PRSO? ,ROOMS ,LG-LONDON-BRIDGE>>
			>
			<TELL
"You see the Thames flowing slowly by, just as it has done for centuries past." CR
			>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-RM-TOWER-STREET"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-RM-TOWER-STREET ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-RM-AC "RM-TOWER-STREET" .CONTEXT>
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-RM-SWAN-LANE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-RM-SWAN-LANE ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-RM-AC "RM-SWAN-LANE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<AND <EQUAL? .CONTEXT ,K-M-ENTERED>
				<EQUAL? ,GL-PLACE-PRV ,RM-BAR-OF-GOLD>
				<IN? ,CH-WIGGINS ,RM-SWAN-LANE>
			>
			<TELL
CR
CTHE ,CH-WIGGINS " says, \"Blimey!! I didn't think you would make it
out of there alive.\"" CR
			>
			<SETG GL-PUPPY ,CH-WIGGINS>
			<MC-UNMAKE ,CH-WIGGINS ,FL-NODESC>
			<MC-UNMAKE ,CH-WIGGINS ,FL-BROKEN>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-RM-BAR-OF-GOLD"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-RM-BAR-OF-GOLD ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-RM-AC "RM-BAR-OF-GOLD" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<AND	<EQUAL? .CONTEXT ,K-M-ENTERING>
				<EQUAL? ,GL-PUPPY ,CH-WIGGINS>
			>
			<TELL THE ,CH-WIGGINS " says, \"You must be stark raving
bonkers. That's the most dangerous place in London. I'll wait
out here, thank you very much!\"" CR CR
			>
			<SETG GL-PUPPY <>>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-RM-LAIR"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-RM-LAIR ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-RM-AC "RM-LAIR" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT ,K-M-ENTERED>
			<SETG GL-PUPPY ,CH-HOLMES>
		)
	>
	<COND
		(<MC-VERB? TAKE>
			<COND
				(<MC-PRSO? ,TH-BREATH>
					<RFALSE>
				)
				(<MC-IS? ,GL-PRSO ,FL-WORN>
					<RFALSE>
				)
				(<AND <MC-ISNOT? ,CH-MORIARTY ,FL-LOCKED>
						<MC-ISNOT? ,CH-MORIARTY ,FL-ASLEEP>
					>
					<COND
						(<RT-META-IN? ,GL-PRSO ,GL-WINNER>
							<RT-ALARM-SET-REL ,RT-I-TAKE-WATSONS-STUFF <RT-PARM-SET 0 1 0>>
							<MOVE ,GL-PRSO ,GL-WINNER>
							<TELL
"Moriarty's normally emotionless features dissolve in rage. He shouts at
Akbar, \"Why didn't you take that from him when you brought him
in?\"" CR CR

"The outburst startles Akbar into momentary inaction, but he quickly recovers
and starts to come towards you with a violent look in his eyes." CR
							>
						)
						(T
							<TELL "Akbar steps in your way">
                     <COND
                        (<MC-IS? ,TH-WATSONS-HAT ,FL-WORN>
                           <TELL ", says, \"Pardon me, honourable sir,\"">
                        )
                     >
                     <TELL " and stops you from taking " THEO "." CR>
						)
					>
				)
			>
		)
		(<AND <MC-VERB? RELEASE>
				<MC-PRSO? TH-BREATH>
			>
			<RFALSE>
		)
		(<MC-VERB? UNTIE RELEASE>
			<COND
				(<MC-IS? ,GL-PRSO ,FL-LOCKED>
					<COND
						(<MC-IS? ,CH-AKBAR ,FL-ASLEEP>
				  			<MC-UNMAKE ,GL-PRSO ,FL-LOCKED>
							<RT-CYOU-MSG "untie" "unties">
							<TELL THEO>
							<COND
								(<EQUAL? ,GL-PRSO <GETP ,TH-ROPE ,P?AUX1>>
									<PUTP ,TH-ROPE ,P?AUX1 <GETP ,TH-ROPE ,P?AUX2>>
									<PUTP ,TH-ROPE ,P?AUX2 -1>
									<COND
										(<EQUAL? <GETP ,TH-ROPE ,P?AUX1> -1>
											<MOVE ,TH-ROPE ,CH-PLAYER>
											<MC-UNMAKE ,TH-ROPE ,FL-NODESC>
											<TELL ", keeping " THE ,TH-ROPE>
										)
									>
								)
								(<EQUAL? ,GL-PRSO <GETP ,TH-ROPE ,P?AUX2>>
									<PUTP ,TH-ROPE ,P?AUX2 -1>
								)
							>
							<TELL "." CR>
							<COND
								(<MC-PRSO? ,CH-MORIARTY ,CH-AKBAR>
									<CRLF>
									<COND
										(<EQUAL? ,GL-PRSO ,CH-MORIARTY>
											<TELL
"Bad move. As soon as he is free, Moriarty"
											>
										)
										(T
											<TELL	
"Akbar immediately unties Moriarty, who"
											>
										)
									>
									<TELL
" unlocks his desk and pulls out a pistol. \"Thank you for releasing
me, gentlemen,\" he says, waving the gun at you. \"Very sporting of
you.\" He glances at his pocketwatch. \"We shouldn't have too long to
wait.\" Minutes later you hear newsboys running through the
streets shouting about the resignation of the Prime Minister." CR
									>
									<RT-QSR>
								)
							>
							<RTRUE>
						)
						(T
							<RT-ROPE-MSG>
						)
					>
				)
				(<MC-VERB? RELEASE>
					<RFALSE>
				)
				(T
					<TELL CTHEO " isn't tied up." CR>
				)
			>
		)
		(<AND <MC-VERB? TIE-UP>
				<NOT <MC-PRSI? TH-ROPE ROOMS>>
			>
			<RT-IMPOSSIBLE-MSG>
		)
		(<MC-VERB? TIE TIE-UP>
			<COND
				(<RT-VISIBLE? ,TH-ROPE>
					<COND
						(<MC-IS? ,CH-AKBAR ,FL-ASLEEP>
							<COND
								(<EQUAL? <GETP ,TH-ROPE ,P?AUX1> -1>
									<PUTP ,TH-ROPE ,P?AUX1 ,GL-PRSO>
								)
								(<EQUAL? <GETP ,TH-ROPE ,P?AUX2> -1>
									<PUTP ,TH-ROPE ,P?AUX2 ,GL-PRSO>
								)
								(T
									<TELL CTHE ,TH-ROPE " is not long enough." CR>
									<RTRUE>
								)
							>
							<COND
								(<EQUAL? ,GL-PRSI ,ROOMS>
									<SETG GL-PRSI <>>
								)
							>
							<MOVE ,TH-ROPE ,GL-PLACE-CUR>
							<MC-MAKE ,TH-ROPE ,FL-NODESC>
							<MC-MAKE ,GL-PRSO ,FL-LOCKED>
							<COND
								(<MC-PRSI? <> ,TH-ROPE>
									<RT-CYOU-MSG "tie" "ties">
									<TELL "up " THEO "." CR>
								)
								(<NOT <EQUAL? <GETP ,TH-ROPE ,P?AUX2> -1>>
									<RT-CYOU-MSG "tie" "ties">
									<TELL
"up " THEO ", but " THE ,TH-ROPE " is not long enough to tie up " THEI
" as well." CR
									>
								)
								(T
									<MC-MAKE ,GL-PRSI ,FL-LOCKED>
									<TELL "You tie " THEO " to " THEI "." CR>
								)
							>
						)
						(T
							<RT-ROPE-MSG>
						)
					>
				)
				(T
					<TELL "You don't have " A ,TH-ROPE "." CR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-RM-NAVE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-RM-NAVE ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-RM-AC "RM-NAVE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT ,K-M-ENTERED>
			<PUTP ,CH-PLAYER ,P?IN-ABBEY T>
		)
		(<EQUAL? .CONTEXT ,K-M-EXIT>
			<PUTP ,CH-PLAYER ,P?IN-ABBEY <>>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-AC-RM-EVANGELIST-CHAPEL"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-RM-EVANGELIST-CHAPEL ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-RM-AC "RM-EVANGELIST-CHAPEL" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT ,K-M-BEG>
		   <RT-PAPER-WARMING ,TH-WHITE-PAPER>
		   <RT-PAPER-WARMING ,TH-BLUE-PAPER>
		   <RT-PAPER-WARMING ,TH-ORANGE-PAPER>
		   <RT-PAPER-WARMING ,TH-YELLOW-PAPER>
		   <RT-PAPER-WARMING ,TH-BROWN-PAPER>
		   <RT-PAPER-WARMING ,TH-GREEN-PAPER>
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-RM-HENRY-VII-CHAPEL"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-RM-HENRY-VII-CHAPEL ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-RM-AC "RM-HENRY-VII-CHAPEL" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<MC-VERB? LOOK-UP>
			<TELL ,K-BREATH-TAKING-MSG CR>
		)
	>
>

;*****************************************************************************
; "exit routines"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "NORTH from RM-THREADNEEDLE-ST                  to RM-BANK-OF-ENGLAND"
;-----------------------------------------------------------------------------

<ROUTINE RT-EX-ENTER-BANK-OF-ENGLAND ()
   <COND
		(<L? <GETP ,CH-BANK-GUARD ,P?AUX1> 4>
			<TELL 
"The guard stops you as you try to enter. \"Excuse me, sir. You can't go
in there. And don't even THINK about trying to bribe me.\"" CR
			>
			<RT-THIS-IS-IT ,CH-BANK-GUARD>
			<RFALSE>
		)
		(<IN? ,TH-BOX-KEY ,TH-GUARDS-POCKET>
			<TELL
"Holmes takes you to one side and whispers, \"It is obvious, dear fellow, that
it would be pointless to enter the bank with no means of unlocking anything we
may find inside.\"" CR
			>
			<RFALSE>
		)
      (T
			<COND
				(<IN? ,CH-BANK-GUARD ,RM-THREADNEEDLE-ST>
					<TELL
"As soon as you enter, the guard leaves." CR CR
					>
					<REMOVE ,CH-BANK-GUARD>
				)
			>
			<RETURN ,RM-BANK-OF-ENGLAND>
      )
   >
>

;-----------------------------------------------------------------------------
; "WEST  from RM-QUEENS-GARDENS                   to RM-BUCKINGHAM-PALACE"
; "IN    from RM-QUEENS-GARDENS                   to RM-BUCKINGHAM-PALACE"
;-----------------------------------------------------------------------------

<ROUTINE RT-EX-RM-ENTER-BUCKINGHAM-PALACE ()
   <COND
      (<AND <EQUAL? ,GL-PRSO ,P?WEST ,P?IN>
         	<MC-HERE? ,RM-QUEENS-GARDENS>
         >
			<TELL
CTHE ,CH-PALACE-GUARD " steps into your path and says, \"I'm sorry, but I've
been instructed to let no one into the Palace unless I receive certain items
of interest to the Crown.\"" CR
			>
			<RFALSE>
      )
   >
>

;-----------------------------------------------------------------------------
; "SOUTH from RM-BANK-OF-ENGLAND                  to RM-THREADNEEDLE-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-EX-RM-EXIT-BANK-OF-ENGLAND ()
	<RETURN ,RM-THREADNEEDLE-ST>
>

;-----------------------------------------------------------------------------
; "EAST  from RM-BYWARD-TOWER                     to RM-OUTER-WARD"
; "WEST  from RM-BYWARD-TOWER                     to RM-DRAWBRIDGE"
;-----------------------------------------------------------------------------

;<ROUTINE RT-EX-RM-EXIT-BYWARD-TOWER ()
   <COND
      (<AND
         <EQUAL? ,GL-PRSO ,P?EAST>
         <MC-HERE? ,RM-BYWARD-TOWER>
         >
            <RETURN ,RM-OUTER-WARD>
      )
      (<AND
         <EQUAL? ,GL-PRSO ,P?WEST>
         <MC-HERE? ,RM-BYWARD-TOWER>
         >
            <RETURN ,RM-DRAWBRIDGE>
      )
   >
>

;-----------------------------------------------------------------------------
; "SOUTH from RM-MADAME-TUSSAUDS                  to RM-MARYLEBONE-RD"
;-----------------------------------------------------------------------------

;<ROUTINE RT-EX-RM-EXIT-TUSSAUDS ("AUX" IN1 IN2)
	<COND
		(<AND <EQUAL? ,GL-PRSO ,P?SOUTH ,P?OUT>
				<MC-HERE? ,RM-MADAME-TUSSAUDS>
			>
			<RETURN ,RM-MARYLEBONE-RD>
		)
	>
>

;-----------------------------------------------------------------------------
; "NORTH from RM-MARYLEBONE-RD                    to RM-MADAME-TUSSAUDS"
;-----------------------------------------------------------------------------

;<ROUTINE RT-EX-RM-MATCH-SNIFFING-DOG ("AUX" OBJ (FLAME <>))
	<COND
		(<AND <EQUAL? ,GL-PRSO ,P?NORTH ,P?IN>
				<MC-HERE? ,RM-MARYLEBONE-RD>
         >
			<RETURN ,RM-MADAME-TUSSAUDS>
		)
	>
>

;-----------------------------------------------------------------------------
; "EAST,SOUTH,WEST from RM-THAMES-ONE"
; "EAST,SOUTH,WEST from RM-THAMES-TWO"
; "EAST,SOUTH,WEST from RM-THAMES-THREE"
; "EAST,SOUTH,WEST from RM-THAMES-FOUR"
; "EAST,SOUTH,WEST from RM-THAMES-FIVE"
;-----------------------------------------------------------------------------

<ROUTINE RT-EX-RM-STEER-BOAT ()
	<RT-ALARM-CLR ,RT-I-MOVE-DOWNSTREAM>
   <TELL
"[To move the boat, ROW or PADDLE in a given direction, or LAND it.]" CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "NORTH from RM-THAMES-ONE                       to RM-THE-EMBANKMENT"
; "NORTH from RM-THAMES-FOUR                      to RM-OUTSIDE-TRAITORS-GATE"
;-----------------------------------------------------------------------------

<ROUTINE RT-EX-RM-LAND-BOAT ()
	<TELL "[Land the Boat.]" CR>
	<RT-LAND-BOAT>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "SOUTH from RM-THE-EMBANKMENT                   to RM-THAMES-ONE"
; "SOUTH from RM-OUTSIDE-TRAITORS-GATE            to RM-THAMES-FOUR"
;-----------------------------------------------------------------------------

<ROUTINE RT-EX-RM-LAUNCH-BOAT ()
	<COND
		(<IN? ,CH-PLAYER ,TH-BOAT>
			<TELL "[Launch the Boat.]" CR>
			<RT-LAUNCH-BOAT>
		)
		(T
			<TELL
"The last man who tried walking on water was killed by a bunch of Romans. Why
don't you play it safe and use a boat?" CR
			>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "NORTH from RM-ENTRY-HALL                       to RM-PARLOUR"
;-----------------------------------------------------------------------------

<ROUTINE RT-EX-PARLOUR-ENTRY ()
	<COND
		(<MC-IS? ,CH-HOLMES ,FL-ASLEEP>
			<TELL
CTHE ,CH-HUDSON ,K-HUDSON-WORRIED-MSG CR
			>
			<RFALSE>
		)
		(<MC-ISNOT? ,LG-PARLOUR-DOOR ,FL-OPENED>
			<TELL CTHE ,LG-PARLOUR-DOOR " is closed." CR>
			<RFALSE>
		)
		(<AND <MC-PRSO? ,P?NORTH ,P?IN>
				<MC-HERE? ,RM-ENTRY-HALL>
         >
			<RETURN ,RM-PARLOUR>
		)
	>
>

;-----------------------------------------------------------------------------
; "NORTH from RM-THE-EMBANKMENT                   to RM-FLEET-STREET"
; "EAST  from RM-THE-EMBANKMENT                   to RM-UPPER-THAMES-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-EX-LEAVE-EMBANKMENT ()
	<COND
		(<MC-IS? ,TH-SUIT-OF-ARMOUR ,FL-WORN>
			<TELL ,K-HEAVY-ARMOUR-MSG CR>
			<RFALSE>
		)
		(<AND <EQUAL? ,GL-PRSO ,P?NORTH>
				<MC-HERE? ,RM-THE-EMBANKMENT>
			>
			<RETURN ,RM-FLEET-STREET>
		)
		(<AND <EQUAL? ,GL-PRSO ,P?EAST>
				<MC-HERE? ,RM-THE-EMBANKMENT>
			>
			<RETURN ,RM-UPPER-THAMES-ST>
		)
	>
>

;*****************************************************************************
; "CONSTANTS"
;*****************************************************************************

<CONSTANT K-HEAVY-ARMOUR-MSG
"You cannot take another step in that heavy suit of armour."
>

;*****************************************************************************
; "end of file"
;*****************************************************************************

