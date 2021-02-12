;*****************************************************************************
; "game : SHERLOCK!"
; "file : VERBS1.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   28 Oct 1987 16:55:00  $"
; "rev  : $Revision:   1.111  $"
; "vers : 1.00"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "this file contains:"
; "   game play pre-verbs"
; "   game play verbs"
;-----------------------------------------------------------------------------

;*****************************************************************************
; "game play pre-verbs"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "PRE-CALL"
;-----------------------------------------------------------------------------

<ROUTINE PRE-CALL ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-PRE-VERB "PRE-CALL">
		)
		(T
		)
	>
	<COND
		(<MC-PRSI? ,TH-CAB-WHISTLE>
			<RFALSE>
		)
		(<MC-PRSO? ,ROOMS>
			<COND
				(<EQUAL? ,GL-P-PRSA-WORD ,W?HAIL>
					<TELL "Greetings, O strange one." CR>
				)
				(T
					<TELL "Helllloooooooo." CR>
				)
			>
		)
		(<AND <EQUAL? <GET ,GL-P-NAMW 0> ,W?MARY>
				<EQUAL? ,GL-P-PRSA-WORD ,W?HAIL>
			>
			<TELL
"Praying isn't a bad idea. But if you really need help, simply type HINT." CR
			>
		)
		(<EQUAL? <GET ,GL-P-NAMW 0> ,W?CAB>
			<COND
				(<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
					<RT-CYOU-MSG>
					<TELL
"can't " VW " a cab while indoors." CR
					>
				)
				(<MC-HERE? <LOC ,TH-GROWLER-CAB> <LOC ,TH-HANSOM-CAB>>
					<TELL ,K-CAB-HERE-MSG CR>
				)
				(T
					<COND
						(<EQUAL? ,GL-P-PRSA-WORD ,W?HAIL>
							<RT-CYOU-MSG "wave" "waves">
							<TELL "a hand in the air">
						)
						(T
							<RT-CYOU-MSG "shout" "shouts">
							<TELL "for a few moments">
						)
					>
					<TELL
", but nothing happens. Apparently that isn't how Victorians " VW " cabs." CR
					>
				)
			>
		)
		(<OR	<MC-ISNOT? ,GL-PRSO ,FL-ALIVE>
				<NOT <RT-VISIBLE? ,GL-PRSO>>
			>
			<TELL "Nothing happens." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "PRE-DROP"
;-----------------------------------------------------------------------------

<ROUTINE PRE-DROP ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-PRE-VERB "PRE-DROP">
		)
		(T
		)
	>
	<COND
		(<OR
			<MC-PRSO? ,TH-ANCHOR>
			<IN? ,GL-PRSO ,GL-WINNER>
			>
			<RFALSE>
		)
		(<IN? ,GL-PRSO ,GLOBAL-OBJECTS>
			<RT-IMPOSSIBLE-MSG>
		)
      (<MC-IS? ,GL-PRSO ,FL-BODYPART>
			<RT-IMPOSSIBLE-MSG>
      )
		(T
			<RT-CYOU-MSG "are" "is">
			<TELL "not holding " THEO "." CR>
			<MC-RFATAL>
		)
	>
>

;-----------------------------------------------------------------------------
; "PRE-DUMB-EXAMINE"
;-----------------------------------------------------------------------------

<ROUTINE PRE-DUMB-EXAMINE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-PRE-VERB "PRE-DUMB-EXAMINE">
		)
		(T
		)
	>
	<COND
		(<PRE-EXAMINE>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "PRE-EXAMINE"
;-----------------------------------------------------------------------------

<ROUTINE PRE-EXAMINE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-PRE-VERB "PRE-EXAMINE">
		)
		(T
		)
	>
	<COND
		(<MC-F? ,GL-NOW-LIT?>
			<TELL ,K-TOO-DARK-MSG CR>
			<MC-RFATAL>
		)
		(<MC-PRSO? TH-INTDIR>
			<TELL
"You peer off into the middle distance, but then return your attention to
the matters at hand." CR
			>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "PRE-FEED"
;-----------------------------------------------------------------------------

<ROUTINE PRE-FEED ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-PRE-VERB "PRE-FEED">
		)
		(T
		)
	>
	<COND
		(<PRE-GIVE T>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "PRE-GIVE"
;-----------------------------------------------------------------------------

<ROUTINE PRE-GIVE ("OPTIONAL" (FEED? <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-PRE-VERB "PRE-GIVE">
		)
		(T
		)
	>
	<COND
		(<OR
			<MC-F? ,GL-PRSO>
			<MC-F? ,GL-PRSI>
			>
			<TELL ,K-REFERRING-MSG CR>
			<RTRUE>
		)
		(<OR
			<EQUAL? ,GL-PRSO ,GL-PRSI>
			<IN? ,GL-PRSI ,GLOBAL-OBJECTS>
			>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
		(<MC-ISNOT? ,GL-PRSI ,FL-ALIVE>
			<RT-CYOU-MSG>
			<TELL "cannot ">
			<COND
				(<MC-T? .FEED?>
					<TELL "feed ">
				)
				(T
					<TELL "give ">
				)
			>
			<TELL "anything to " A ,GL-PRSI "." CR>
			<RTRUE>
		)
		(<AND
			<MC-PRSI? CH-ME>
			<IN? ,GL-PRSO ,CH-PLAYER>
			>
			<RT-ALREADY-HAVE-PRSO-MSG>
			<RTRUE>
		)
		(<AND
			<NOT <MC-PRSI? CH-ME>>
			<RT-DONT-HAVE-MSG ,GL-PRSO>
			>
			<RTRUE>
		)
		(<AND
			<MC-IS? ,GL-PRSO ,FL-WORN>
			<IN? ,GL-PRSO ,CH-PLAYER>
			>
			<RT-TAKE-OFF-PRSO-FIRST-MSG>
			<RFALSE>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "PRE-LISTEN"
;-----------------------------------------------------------------------------

<ROUTINE PRE-LISTEN ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-PRE-VERB "PRE-LISTEN">
		)
		(T
		)
	>
	<COND
		(<IN? ,TH-COTTON-BALLS ,TH-EARS>
			<RT-CYOU-MSG>
			<TELL
"can't hear anything very clearly, but then what did you expect with those
huge wads of cotton plugging up your ears?" CR
			>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "PRE-POCKET"
;-----------------------------------------------------------------------------

<ROUTINE PRE-POCKET ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-PRE-VERB "PRE-POCKET">
		)
		(T
		)
	>
	<COND
		(<RT-IS-CHAR-NOT-PLAYER?>
			<RTRUE>
		)
		(<IN? ,GL-PRSO ,GLOBAL-OBJECTS>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
		(<IN? ,GL-PRSO ,TH-POCKET>
			<TELL CTHEO>
			<RT-IS-ARE-MSG>
			<TELL "already in " D ,TH-POCKET "." CR>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "PRE-PUT"
;-----------------------------------------------------------------------------

<ROUTINE PRE-PUT ("AUX" PTR OLOC CNT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-PRE-VERB "PRE-PUT">
		)
		(T
		)
	>
	<COND
		(<IN? ,GL-PRSO ,GLOBAL-OBJECTS>
			<RFALSE>
		)
		(<AND <NOT <MC-PRSO? ,TH-ANCHOR>>
				<NOT <IN? ,GL-PRSO ,GL-WINNER>>
			>
			<RT-CYOU-MSG "are" "is">
			<TELL "not holding " THEO "." CR>
			<MC-RFATAL>
		)
		(<MC-PRSO? TH-CLOTHES>
			<TELL ,K-INAPPROPRIATE-MSG CR>
			<RTRUE>
		)
		(<MC-PRSO? GL-PRSI>
			<TELL ,K-HOW-TO-MSG CR>
			<RTRUE>
		)
		(<MC-PRSI? TH-INTDIR TH-RIGHT TH-LEFT>
			<TELL "[You must specify an object.]" CR>
			<RTRUE>
		)
		(<MC-PRSI? TH-HANDS>
			<RT-NOT-LIKELY-MSG ,GL-PRSO "would fit very well">
			<RTRUE>
		)
		(<EQUAL? ,TH-FEET ,GL-PRSO ,GL-PRSI>
			<TELL "That would">
			<RT-WASTE-OF-TIME-MSG>
			<RTRUE>
		)
		(<EQUAL? ,TH-EARS ,GL-PRSO ,GL-PRSI>
			<RFALSE>
		)
		(<IN? ,GL-PRSI ,GLOBAL-OBJECTS>
			<RFALSE>
		)
		(<MC-PRSO? TH-HANDS>
			<RT-PERFORM ,V?REACH-IN ,GL-PRSI>
			<RTRUE>
		)
      (<MC-IS? ,GL-PRSO ,FL-BODYPART>
         <RT-IMPOSSIBLE-MSG>
         <RTRUE>
      )
		(<IN? ,GL-PRSO ,GL-PRSI>
			<TELL CTHEO>
			<RT-IS-ARE-MSG>
			<TELL "already">
			<RT-IN-ON-MSG ,GL-PRSI>
			<TELL THEI "." CR>
			<RTRUE>
		)
		(<OR
			<EQUAL? ,GL-PRSO ,GL-PRSI>
			<IN? ,GL-PRSO ,GLOBAL-OBJECTS>
			<MC-ISNOT? ,GL-PRSO ,FL-TAKEABLE>
			>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
		(<NOT <RT-ACCESSIBLE? ,GL-PRSI>>
			<RT-CANT-SEE-ANY-MSG ,GL-PRSI>
			<RTRUE>
		)
		(<AND <MC-PRSO? ,TH-STETHOSCOPE>
				<MC-IS? ,GL-PRSI ,FL-PERSON>
			>
			<RFALSE>
		)
		(<RT-CHECK-MOVE-MSG? ,GL-PRSO ,GL-PRSI>
			<RTRUE>
		)
		(<AND <MC-IS? ,GL-PRSO ,FL-WORN>
				<IN? ,GL-PRSO ,CH-PLAYER>
				<NOT <MC-PRSI? CH-ME>>
			>
			<RT-TAKE-OFF-PRSO-FIRST-MSG>
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "PRE-PUT-ON"
;-----------------------------------------------------------------------------

<ROUTINE PRE-PUT-ON ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-PRE-VERB "PRE-PUT-ON">
		)
		(T
		)
	>
	<COND
		(<PRE-PUT>
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSI ,FL-ALIVE>
			<RFALSE>
		)
		(<MC-ISNOT? ,GL-PRSI ,FL-SURFACE>
			<RT-NO-GOOD-SURFACE-MSG>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "PRE-SHOW"
;-----------------------------------------------------------------------------

<ROUTINE PRE-SHOW ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-PRE-VERB "PRE-SHOW">
		)
		(T
		)
	>
	<COND
		(<EQUAL? <> ,GL-PRSO ,GL-PRSI>
			<TELL ,K-REFERRING-MSG CR>
		)
		(<MC-PRSI? CH-ME CH-PLAYER>
			<COND
				(<RT-META-IN? ,GL-PRSO ,CH-PLAYER>
					<RT-PERFORM ,V?EXAMINE ,GL-PRSO>
				)
			>
		)
		(<OR	<EQUAL? ,GL-PRSO ,GL-PRSI>
				<IN? ,GL-PRSI ,GLOBAL-OBJECTS>
			>
			<RT-IMPOSSIBLE-MSG>
		)
		(<MC-ISNOT? ,GL-PRSI ,FL-ALIVE>
			<RT-CYOU-MSG>
			<TELL "cannot show things to " A ,GL-PRSI "." CR>
		)
;		(<MC-IS? ,GL-PRSI ,FL-ASLEEP>
			<TELL CTHEI " isn't in any condition to appreciate " THEO "." CR>
		)
;		(<AND <NOT <MC-PRSI? CH-ME>>
				<RT-DONT-HAVE-MSG ,GL-PRSO>
			>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "PRE-SHOOT"
;-----------------------------------------------------------------------------

<ROUTINE PRE-SHOOT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-PRE-VERB "PRE-SHOOT">
		)
		(T
		)
	>
	<COND
		(<NOT <MC-PRSI? <> ,TH-GUN>>
			<RT-CYOU-MSG>
			<TELL "cannot shoot anything with " THEI "." CR>
		)
		(<MC-PRSI? ,GL-PRSO>
			<TELL ,K-HOW-TO-MSG CR>
		)
		(<NOT <IN? ,TH-GUN ,CH-PLAYER>>
		 	<TELL "Clever thinking. If only you had something to shoot with!" CR>
		)
		(<MC-PRSO? CH-ME TH-EARS CH-PLAYER TH-HEAD TH-WATSONS-HEART>
			<TELL ,K-SUICIDE-MSG CR>
		)
		(<MC-IS? ,GL-PRSO ,FL-BODYPART>
			<TELL "Is this how you got sent home from the Afghan Campaign?" CR>
		)
		(<AND <NOT <MC-PRSO? TH-GUN>>
				<RT-META-IN? ,GL-PRSO ,CH-PLAYER>
			>
			<TELL ,K-DROP-IT-FIRST-MSG CR>
		)
		(<ZERO? <GETP ,TH-GUN ,P?AUX1>>
			<TELL "Click!" CR>
		)
		(T
			<PUTP ,TH-GUN ,P?AUX1 <- <GETP ,TH-GUN ,P?AUX1> 1>>
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "PRE-TAKE"
;-----------------------------------------------------------------------------

<ROUTINE PRE-TAKE ("AUX" L)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-PRE-VERB "PRE-TAKE">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? ,TH-BREATH>
			<V-INHALE>
			<RTRUE>
		)
	>
	<COND
		(<IN? ,GL-PRSO ,GLOBAL-OBJECTS>
			<RFALSE>
		)
	>
	<SET L <LOC ,GL-PRSO>>
	<COND
      (<MC-IS? ,GL-PRSO ,FL-BODYPART>
			<RT-IMPOSSIBLE-MSG>
      )
		(<AND	<MC-PRSO? ,TH-STETHOSCOPE ,TH-WATSONS-HAT>
				<MC-IS? ,GL-PRSO ,FL-WORN>
			>
			<RFALSE>
		)
		(<EQUAL? .L ,GL-WINNER>
			<RT-CYOU-MSG "are" "is">
			<TELL "already ">
			<COND
				(<MC-IS? ,GL-PRSO ,FL-WORN>
					<TELL "wearing ">
				)
				(T
					<TELL "holding ">
				)
			>
			<TELL THEO "." CR>
		)
		(<AND <MC-T? .L>
				<MC-IS? .L ,FL-CONTAINER>
				<MC-IS? .L ,FL-OPENABLE>
				<MC-ISNOT? .L ,FL-OPENED>
			>
			<RT-CYOU-MSG>
			<TELL "can't reach into " THE .L ". It is closed." CR>
		)
		(<MC-T? ,GL-PRSI>
			<COND
				(<MC-PRSO? GL-PRSI>
					<COND
						(<OR <EQUAL? <GET ,GL-P-NAMW 0> <GET ,GL-P-NAMW 1>>
								<EQUAL? <GET ,GL-P-ADJW 0> <GET ,GL-P-ADJW 1>>
							>
							<RT-IMPOSSIBLE-MSG>
						)
					>
				)
				(<MC-PRSI? CH-ME>
					<COND
						(<EQUAL? ,GL-WINNER ,CH-PLAYER>
							<RT-NOBODY-TO-ASK-MSG>
							<RTRUE>
						)
						(<NOT <EQUAL? .L ,CH-PLAYER>>
							<RT-CYOU-MSG "do not" "does not">
							<TELL "have " THEO "." CR>
						)
					>
				)
				(<AND <MC-PRSI? ,CH-BANK-GUARD>
						<EQUAL? .L ,TH-GUARDS-POCKET>
					>
					<RT-PERFORM ,V?TAKE ,GL-PRSO ,TH-GUARDS-POCKET>
				)
				(<NOT <EQUAL? .L ,GL-PRSI>>
					<TELL CTHEO>
					<RT-ISNT-ARENT-MSG>
					<RT-IN-ON-MSG ,GL-PRSI <>>
					<TELL THEI "." CR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "PRE-THROW"
;-----------------------------------------------------------------------------

<ROUTINE PRE-THROW ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-PRE-VERB "PRE-THROW">
		)
		(T
		)
	>
	<COND
		(<PRE-PUT>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "PRE-THROW-OVER"
;-----------------------------------------------------------------------------

<ROUTINE PRE-THROW-OVER ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-PRE-VERB "PRE-THROW-OVER">
		)
		(T
		)
	>
	<COND
		(<PRE-THROW>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "PRE-WATCH"
;-----------------------------------------------------------------------------

<ROUTINE PRE-WATCH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-PRE-VERB "PRE-WATCH">
		)
		(T
		)
	>
	<COND
		(<PRE-EXAMINE>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;*****************************************************************************
; "game play verbs"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "V-ADJUST"
;-----------------------------------------------------------------------------

<ROUTINE V-ADJUST ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-ADJUST">
		)
		(T
		)
	>
	<COND
		(<EQUAL? ,GL-P-PRSA-WORD ,W?ADJUST>
			<TELL CTHEO " does not need adjustment." CR>
			<RTRUE>
		)
		(T 
			<RT-CYOU-MSG>
			<TELL "cannot focus " A ,GL-PRSO "." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-ALARM"
;-----------------------------------------------------------------------------

<ROUTINE V-ALARM ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-ALARM">
		)
		(T
		)
	>
	<COND 
		(<RT-FOOLISH-TO-TALK-MSG>
			<MC-RFATAL>
		)
		(<MC-PRSO? ROOMS>
			<RT-CYOU-MSG "are" "is">
			<TELL "already wide awake." CR>
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-ALIVE>
			<COND
				(<MC-PRSO? ,CH-PLAYER ,CH-ME>
					<TELL "You are">
				)
				(T
					<TELL CTHEO " is">
				)
			>
			<TELL " already wide awake." CR>
			<RTRUE>
		)
		(T
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-ARREST"
;-----------------------------------------------------------------------------

<ROUTINE V-ARREST ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-ARREST">
		)
		(T
		)
	>
	<TELL "Unfortunately,">
	<RT-YOU-MSG "do" "does">
	<TELL "not have the authority to arrest any">
	<COND
		(<MC-IS? ,GL-PRSO ,FL-PERSON>
			<TELL "one">
		)
		(T
			<TELL "thing">
		)
	>
	<TELL "." CR>
>

;-----------------------------------------------------------------------------
; "V-ASK-ABOUT-1"
;-----------------------------------------------------------------------------

<ROUTINE V-ASK-ABOUT-1 ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-ASK-ABOUT-1">
		)
		(T
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-ASK-ABOUT"
;-----------------------------------------------------------------------------

<ROUTINE V-ASK-ABOUT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-ASK-ABOUT">
		)
		(T
		)
	>
	<COND 
		(<RT-FOOLISH-TO-TALK-MSG>
			<MC-RFATAL>
		)
		(<EQUAL? ,GL-WINNER ,GL-PRSI>
			<TELL "That would">
			<RT-WASTE-OF-TIME-MSG>
			<MC-RFATAL>
		)
		(<MC-PRSO? CH-ME>
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
; "V-ASK-FOR-1"
;-----------------------------------------------------------------------------

<ROUTINE V-ASK-FOR-1 ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-ASK-FOR-1">
		)
		(T
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-ASK-FOR"
;-----------------------------------------------------------------------------

<ROUTINE V-ASK-FOR ("AUX" WHO)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-ASK-FOR">
		)
		(T
		)
	>
	<COND 
		(<RT-FOOLISH-TO-TALK-MSG>
			<MC-RFATAL>
		)
		(<EQUAL? ,GL-WINNER ,GL-PRSI>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
		(<MC-ISNOT? ,GL-PRSI ,FL-TAKEABLE>
			<TELL
CTHE ,GL-PRSO " says, \"Unfortunately, I can't help you
with that.\"" CR
			>
			<RTRUE>
		)
		(T
			<RT-NO-RESPONSE-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-BLOW-INTO"
;-----------------------------------------------------------------------------

<ROUTINE V-BLOW-INTO ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-BLOW-INTO">
		)
		(T
		)
	>
	<COND 
		(<MC-IS? ,GL-PRSO ,FL-PERSON>
			<RT-PERFORM ,V?USE ,GL-PRSO>
			<RTRUE>
		)
		(T
			<RT-NO-POINT-MSG "Blowing">
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-BOUNCE"
;-----------------------------------------------------------------------------

<ROUTINE V-BOUNCE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-BOUNCE">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? ROOMS>
			<TELL "That would">
			<RT-WASTE-OF-TIME-MSG>
			<RTRUE>
		)
		(T
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-BOW"
;-----------------------------------------------------------------------------

<ROUTINE V-BOW ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-BOW">
		)
		(T
		)
	>
	<RT-NO-POINT-MSG "Paying respect to">
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-BURN-WITH"
;-----------------------------------------------------------------------------

<ROUTINE V-BURN-WITH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-BURN-WITH">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,GL-PRSO ,FL-BURNABLE>
			<COND
				(<AND <MC-IS? ,GL-PRSI ,FL-BURNABLE>
						<MC-IS? ,GL-PRSI ,FL-LIGHTED>
					>
					<REMOVE ,GL-PRSO>
					<TELL CTHEO " catches fire and is quickly consumed." CR>
				)
				(T
					<TELL CTHEI " is not burning." CR>
				)
			>
		)
		(T
			<RT-CYOU-MSG>
			<TELL "can't " VW " " THEI "." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-BUY"
;-----------------------------------------------------------------------------

<ROUTINE V-BUY ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-BUY">
		)
		(T
		)
	>
	<COND 
		(<NOT <RT-VISIBLE? ,GL-PRSO>>
			<RT-CANT-SEE-ANY-MSG ,GL-PRSO>
			<MC-RFATAL>
		)
		(<RT-HELD? ,GL-PRSO>
			<RT-ALREADY-HAVE-PRSO-MSG>
			<RTRUE>
		)
		(<MC-ISNOT? ,GL-PRSO ,FL-BUYABLE>
			<TELL CTHEO>
			<RT-ISNT-ARENT-MSG>
			<TELL "for sale." CR>
			<RTRUE>
		)	       
		(<AND <EQUAL? ,GL-WINNER ,CH-PLAYER>
				<IN? ,GL-PRSO ,TH-POCKET>
			>
			<RT-SAY-ITS-MSG>
			<TELL "in " THE ,TH-POCKET "." CR>
			<RTRUE>
		)
		(<MC-T? ,GL-PRSI>
			<RT-CYOU-MSG "could not" "cannot">
			<TELL "buy " THEO " with " A ,GL-PRSI "." CR>
			<RTRUE>
		)
		(T
			<RT-NO-MONEY-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-BUY-FROM"
;-----------------------------------------------------------------------------

<ROUTINE V-BUY-FROM ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-BUY-FROM">
		)
		(T
		)
	>
	<TELL "It's not for sale." CR>
	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "V-CALL"
;-----------------------------------------------------------------------------

<ROUTINE V-CALL ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-PRE-VERB "V-CALL">
		)
		(T
		)
	>
	<COND
		(<EQUAL? <LOC ,GL-PRSO> ,GL-PLACE-CUR>
			<TELL CTHEO " is right in front of you." CR>
		)
		(T
			<TELL "Nothing happens." CR>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-CAST-OFF"
;-----------------------------------------------------------------------------

<ROUTINE V-CAST-OFF ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-CAST-OFF">
		)
		(T
		)
	>
	<COND
		(<NOT <MC-PRSO? ,ROOMS ,TH-BOAT>>
			<V-DROP>
		)
		(<OR
			<IN? ,CH-PLAYER ,TH-BOAT>
			<EQUAL? <LOC ,CH-PLAYER> <LOC ,TH-BOAT>>
			>
				<RT-LAUNCH-BOAT>
		)
		(T
			<TELL
"Clever idea. Now, if only you were in a boat...." CR
 			>
 		)
 	>
 	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-CLEAN"
;-----------------------------------------------------------------------------

<ROUTINE V-CLEAN ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-CLEAN">
		)
		(T
		)
	>
	<TELL "Sorry. You get no points for neatness." CR>
	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "V-CLEAN-OFF"
;-----------------------------------------------------------------------------

<ROUTINE V-CLEAN-OFF ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-CLEAN-OFF">
		)
		(T
		)
	>
	<COND 
		(<MC-PRSO? GL-PRSI>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
		(T
			<RT-CYOU-MSG>
			<TELL "cannot">
			<PRINTB ,GL-P-PRSA-WORD>
			<TELL " " THEO " on " THEI "." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-CLIMB-DOWN"
;-----------------------------------------------------------------------------

<ROUTINE V-CLIMB-DOWN ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-CLIMB-DOWN">
		)
		(T
		)
	>
	<COND 
		(<EQUAL? ,GL-P-PRSA-WORD ,W?JUMP ,W?LEAP>
			<RT-PERFORM ,V?DIVE ,GL-PRSO>
			<RTRUE>
		)
		(<MC-PRSO? ROOMS>
			<RT-DO-WALK ,P?DOWN>
			<RTRUE>
		)
		(T
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-CLIMB-ON"
;-----------------------------------------------------------------------------

<ROUTINE V-CLIMB-ON ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-CLIMB-ON">
		)
		(T
		)
	>
	<COND
		(<EQUAL? ,GL-P-PRSA-WORD ,W?TAKE>
			<RT-NOT-LIKELY-MSG ,GL-PRSO "is looking for a fight">
			<RTRUE>
		)
		(T
			<RT-CYOU-MSG>
			<TELL "cannot ">
			<PRINTB ,GL-P-PRSA-WORD>
			<TELL " onto ">
			<RT-SAY-HIM-HER-THEM-IT-MSG>
			<TELL "." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-CLIMB-OVER"
;-----------------------------------------------------------------------------

<ROUTINE V-CLIMB-OVER ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-CLIMB-OVER">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? ROOMS>
			<V-WALK-AROUND>
			<RTRUE>
		)
		(T
			<RT-CYOU-MSG>
			<TELL "cannot climb over ">
			<RT-SAY-HIM-HER-THEM-IT-MSG>
			<TELL "." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-CLIMB-UP"
;-----------------------------------------------------------------------------

<ROUTINE V-CLIMB-UP ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-CLIMB-UP">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? ROOMS>
			<RT-DO-WALK ,P?UP>
			<RTRUE>
		)
		(T
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-CLOSE"
;-----------------------------------------------------------------------------

<ROUTINE V-CLOSE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-CLOSE">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,GL-PRSO ,FL-OPENABLE>
			<COND
            (<MC-ISNOT? ,GL-PRSO ,FL-OPENED>
					<RT-ITS-ALREADY-MSG "closed">
            )
				(<MC-IS? ,GL-PRSO ,FL-LOCKED>
					<TELL
"The door is fixed in the open position. It cannot be closed." CR
					>
				) 
				(T
					<RT-YOU-CLOSE-MSG>
				)
			>
			<RTRUE>
		)
		(T
			<RT-CANT-CLOSE-THAT-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-COUNT"
;-----------------------------------------------------------------------------

<ROUTINE V-COUNT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-COUNT">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,GL-PRSO ,FL-PLURAL>
			<RT-CYOU-MSG "become" "becomes">
			<TELL "distracted and lose">
			<COND
				(<NOT <EQUAL? ,GL-WINNER ,CH-PLAYER>>
					<TELL "s">
				)
			>
			<TELL " count." CR>
			<RTRUE>
		)
		(T
			<RT-CYOU-MSG "see" "sees">
			<TELL "only one." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-COVER"
;-----------------------------------------------------------------------------

<ROUTINE V-COVER ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-COVER">
		)
		(T
		)
	>
	<RT-PERFORM ,V?PUT-ON ,GL-PRSI ,GL-PRSO>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-CROSS"
;-----------------------------------------------------------------------------

<ROUTINE V-CROSS ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-CROSS">
		)
		(T
		)
	>
	<RT-CYOU-MSG>
	<TELL "cannot cross ">
	<RT-SAY-HIM-HER-THEM-IT-MSG>
	<TELL "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-CUT"
;-----------------------------------------------------------------------------

<ROUTINE V-CUT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-CUT">
		)
		(T
		)
	>
	<TELL "That would">
	<RT-WASTE-OF-TIME-MSG>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-DETONATE"
;-----------------------------------------------------------------------------

<ROUTINE V-DETONATE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-DETONATE">
		)
		(T
		)
	>
	<RT-IMPOSSIBLE-MSG>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-DIAGNOSE"
;-----------------------------------------------------------------------------

<ROUTINE V-DIAGNOSE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-DIAGNOSE">
		)
		(T
		)
	>
	<COND
		(<MC-ISNOT? ,GL-PRSO ,FL-ALIVE>
			<TELL "Don't be ridiculous." CR>
		)
		(<MC-IS? ,GL-PRSO ,FL-ASLEEP>
			<TELL CTHEO " is asleep." CR>
		)
		(<EQUAL? ,GL-PRSO ,CH-PLAYER ,CH-ME>
			<TELL
"You're doing fine. Now quit fooling around and get back
to solving the game." CR
			>
		)
		(T
			<TELL CTHEO " appear">
			<COND
				(<MC-ISNOT? ,GL-PRSO ,FL-PLURAL>
					<TELL "s">
				)
			>
			<TELL " to be in good health." CR>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-DIG"
;-----------------------------------------------------------------------------

<ROUTINE V-DIG ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-DIG">
		)
		(T
		)
	>
	<TELL "That would">
	<RT-WASTE-OF-TIME-MSG>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-DIG-SWP"
;-----------------------------------------------------------------------------

<ROUTINE V-DIG-SWP ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-DIG-SWP">
		)
		(T
		)
	>
	<RT-PERFORM ,V?DIG ,GL-PRSI ,GL-PRSO>
	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "V-DIVE"
;-----------------------------------------------------------------------------

<ROUTINE V-DIVE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-DIVE">
		)
		(T
		)
	>
	<COND
		(<AND <MC-PRSO? ROOMS>
				<MC-HERE? ,RM-THE-EMBANKMENT ,RM-SWAN-LANE ,RM-LONDON-BRIDGE>
			>
			<TELL "Yuck! Have you looked at that water?" CR>
		)
		(T
			<TELL "That would be a foolish thing to do." CR>
		)
	>
	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "V-DRESS"
;-----------------------------------------------------------------------------

<ROUTINE V-DRESS ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-DRESS">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? ROOMS>
			<TELL "You are already dressed." CR>
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-PERSON>
			<RT-CYOU-MSG "are" "is">
			<TELL "already dressed." CR>
			<RTRUE>
		)
		(T
			<RT-CYOU-MSG>
			<TELL "cannot dress " A ,GL-PRSO "." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-DRINK"
;-----------------------------------------------------------------------------

<ROUTINE V-DRINK ("OPTIONAL" (FROM? <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-DRINK">
		)
		(T
		)
	>
	<RT-CYOU-MSG>
	<TELL "cannot drink ">
	<COND
		(<MC-T? .FROM?>
			<TELL "from ">
		)
	>
	<TELL D ,TH-NOT-HERE-OBJECT "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-DRINK-FROM"
;-----------------------------------------------------------------------------

<ROUTINE V-DRINK-FROM ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-DRINK-FROM">
		)
		(T
		)
	>
	<V-DRINK T>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-DRIVE"
;-----------------------------------------------------------------------------

<ROUTINE V-DRIVE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-DRIVE">
		)
		(T
		)
	>
	<COND
		(<EQUAL? <LOC ,GL-WINNER> ,TH-HANSOM-CAB ,TH-GROWLER-CAB>
			<COND
				(<MC-PRSO? ,ROOMS>
					<RTRUE>
				)
				(T
					<SETG GL-WHERE-TO-PROMPT? <>>
					<TELL
"\"Sorry, guv. Could you be a little more specific?\"" CR
					>
				)
			>
		)
		(T
			<RT-CYOU-MSG "are" "is">
			<TELL "not in a cab." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-DROP"
;-----------------------------------------------------------------------------

<ROUTINE V-DROP ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-DROP">
		)
		(T
		)
	>
	<COND
		(<RT-IDROP-MSG>
			<RT-SAY-DROPPED-MSG>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-DUCK"
;-----------------------------------------------------------------------------

<ROUTINE V-DUCK ("AUX" WHO)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-DUCK">
		)
		(T
		)
	>
	<SET WHO <RT-WHO-SAYS?>>
	<COND
		(<EQUAL? .WHO ,CH-HOLMES>
			<TELL
"Holmes looks at you severely and say, \"Stop playing the fool, Watson. We
have serious work at hand.\"" CR
			>
		)
		(<EQUAL? .WHO ,CH-WIGGINS>
			<TELL
"Wiggins watches your contortions and giggles." CR
			>
		)
		(T
         <TELL
"Enjoying yourself?" CR
    		>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-DUMB-EXAMINE"
;-----------------------------------------------------------------------------

<ROUTINE V-DUMB-EXAMINE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-DUMB-EXAMINE">
		)
		(T
		)
	>
	<COND
		(<V-EXAMINE>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-EAT"
;-----------------------------------------------------------------------------

<ROUTINE V-EAT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-EAT">
		)
		(T
		)
	>
	<COND
		(<EQUAL? ,GL-WINNER ,CH-PLAYER>
			<RT-NOT-LIKELY-MSG ,GL-PRSO "would agree with you">
			<RTRUE>
		)
		(T
			<TELL "\"It" <RT-PICK-NEXT ,GL-NOT-LIKELY-TXT>
				" that " THEO " would agree with me.\"" CR
			>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-EMPTY"
;-----------------------------------------------------------------------------

<ROUTINE V-EMPTY ("OPTIONAL" (DEST <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-EMPTY">
		)
		(T
		)
	>
	<COND
		(<MC-F? .DEST>
			<SET DEST ,CH-PLAYER>
		)
	>
	<COND
		(<MC-IS? ,GL-PRSO ,FL-SURFACE>
			<RT-EMPTY-PRSO-MSG .DEST>
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-CONTAINER>
			<COND
				(<MC-IS? ,GL-PRSO ,FL-OPENED>
					<RT-EMPTY-PRSO-MSG .DEST>
					<RTRUE>
				)
			>
			<RT-ITS-CLOSED-MSG ,GL-PRSO>
			<RTRUE>
		)
		(T
			<RT-CYOU-MSG>
			<TELL "cannot possibly empty " THEO "." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-EMPTY-INTO"
;-----------------------------------------------------------------------------

<ROUTINE V-EMPTY-INTO ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-EMPTY-INTO">
		)
		(T
		)
	>
	<COND
		(<MC-PRSI? TH-HANDS CH-ME>
			<V-EMPTY ,CH-PLAYER>
		)
		(<MC-PRSI? TH-GROUND TH-FLOOR>
			<V-EMPTY ,GL-PRSI>
		)
		(<MC-IS? ,GL-PRSI ,FL-SURFACE>
			<V-EMPTY ,GL-PRSI>
		)
		(<MC-IS? ,GL-PRSI ,FL-CONTAINER>
			<COND
				(<MC-IS? ,GL-PRSI ,FL-OPENED>
					<V-EMPTY ,GL-PRSI>
				)
				(T
					<RT-ITS-CLOSED-MSG ,GL-PRSI>
				)
			>
		)
		(T
			<RT-CYOU-MSG>
			<TELL "cannot empty " THEO " into " THEI "." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-ENTER"
;-----------------------------------------------------------------------------

<ROUTINE V-ENTER ("AUX" VEH)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-ENTER">
		)
		(T
		)
	>
	<COND
		(<SET VEH <RT-FIND-IN? ,GL-PLACE-CUR ,FL-VEHICLE>>
			<COND
				(<NOT <MC-PRSO? ,ROOMS .VEH>>
				 	T
				)
				(<IN? ,GL-WINNER .VEH> 
					<RT-CYOU-MSG "are" "is">
					<TELL "already in " THE .VEH "." CR>
					<RTRUE>
				)
				(T
					<RT-PERFORM ,V?ENTER .VEH>
					<RTRUE>
				)
			>
		)
	>
	<COND
		(<MC-PRSO? ,ROOMS>
			<RT-DO-WALK ,P?IN>
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-CLOTHING>
			<TELL "[Presumably, you mean WEAR " THEO ".]" CR>
			<RT-PERFORM ,V?WEAR ,GL-PRSO>
			<RTRUE>
		)
		(T
			<RT-IMPOSSIBLE-MSG>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-ESCAPE"
;-----------------------------------------------------------------------------

<ROUTINE V-ESCAPE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-ESCAPE">
		)
		(T
		)
	>
	<V-WALK-AROUND>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-EXAMINE"
;-----------------------------------------------------------------------------

<ROUTINE V-EXAMINE ("AUX" ODF NUM)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-EXAMINE">
		)
		(T
		)
	>
	<SET ODF <GETP ,GL-PRSO ,P?DESCFCN>>
	<COND
		(<MC-T? <SET NUM <RT-HOLE? ,GL-PRSO>>>
			<TELL "There ">
			<COND
				(<EQUAL? .NUM 1>
					<TELL "is one">
				)
				(T
					<TELL "are ">
					<COND
						(<EQUAL? .NUM 2>
							<TELL "two">
						)
						(<EQUAL? .NUM 3>
							<TELL "three">
						)
						(<EQUAL? .NUM 4>
							<TELL "four">
						)
						(<EQUAL? .NUM 5>
							<TELL "five">
						)
						(T
							<TELL "six">
						)
					>
				)
			>
			<TELL " bullet hole">
			<COND
				(<G? .NUM 1>
					<TELL "s">
				)
			>
			<TELL " in " THEO "." CR>
		)
	>
	<COND
		(<AND
			<MC-T? .ODF>
			<MC-T? <APPLY .ODF>>
			>
			<MC-MAKE ,GL-PRSO ,FL-SEEN>
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-OPENABLE>
			<RT-OPEN-CLOSED-MSG>
			<CRLF>
			<MC-MAKE ,GL-PRSO ,FL-SEEN>
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-SURFACE>
			<TELL "On " THEO " can be seen ">
			<RT-PRINT-CONTENTS-2 ,GL-PRSO>
			<TELL "." CR>
			<MC-MAKE ,GL-PRSO ,FL-SEEN>
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-CONTAINER>
			<COND
				(<OR
					<MC-IS? ,GL-PRSO ,FL-OPENED>
					<MC-IS? ,GL-PRSO ,FL-TRANSPARENT>
					>
					<V-LOOK-INSIDE>
					<MC-MAKE ,GL-PRSO ,FL-SEEN>
					<RTRUE>
				)
				(T
					<RT-ITS-CLOSED-MSG ,GL-PRSO>
					<CRLF>
					<MC-MAKE ,GL-PRSO ,FL-SEEN>
					<RTRUE>
				)
			>
		)
		(<AND
			<MC-IS? ,GL-PRSO ,FL-PERSON>
			<RT-SEE-ANYTHING-IN? ,GL-PRSO>
			>
			<TELL CTHEO " is holding ">
			<RT-PRINT-CONTENTS-2 ,GL-PRSO>
			<TELL "." CR>
			<MC-MAKE ,GL-PRSO ,FL-SEEN>
			<RTRUE>
		)
		(<MC-T? .NUM>
			<RTRUE>
		)
		(T
			<RT-NOTHING-INTERESTING-MSG>
			<TELL " about " THEO "." CR>
			<MC-MAKE ,GL-PRSO ,FL-SEEN>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-EXHALE"
;-----------------------------------------------------------------------------

<ROUTINE V-EXHALE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-EXHALE">
		)
		(T
		)
	>
	<COND
		(<NOT	<MC-PRSO? TH-BREATH ROOMS>>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
		(<MC-ISNOT? ,TH-BREATH ,FL-LOCKED>
			<RT-CYOU-MSG>
			<RT-WOULD-HAVE-TO-MSG "inhale first.">
			<RTRUE>
		)
		(T
			<MC-UNMAKE ,TH-BREATH ,FL-LOCKED>
			<TELL "You begin to breathe normally." CR>
			<RT-ALARM-CLR ,RT-I-EXHALE>
			<RT-ALARM-CLR ,RT-I-INHALE>
			<RT-SMELL-ETHERIUM?>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-EXIT"
;-----------------------------------------------------------------------------

<ROUTINE V-EXIT ("AUX" VEH L)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-EXIT">
		)
		(T
		)
	>
	<COND
		(<SET VEH <RT-FIND-IN? ,GL-PLACE-CUR ,FL-VEHICLE>>
			<COND
				(<NOT <MC-PRSO? ,ROOMS .VEH>>
				 	T
				)
				(<AND <MC-PRSO? ,ROOMS>
						<MC-IS? <LOC ,GL-WINNER> ,FL-VEHICLE>
					>
					<RT-PERFORM ,V?EXIT <LOC ,GL-WINNER>>
					<RTRUE>
				)
				(<NOT <IN? ,GL-WINNER .VEH>> 
					<RT-CYOU-MSG "are" "is">
					<TELL "not in " THE .VEH "." CR>
					<RTRUE>
				)
				(T
					<RT-PERFORM ,V?EXIT .VEH>
					<RTRUE>
				)
			>
		)
	>
	<SET L <LOC ,GL-PRSO>>
	<COND
		(<MC-PRSO? ,ROOMS>
			<RT-DO-WALK ,P?OUT>
			<RTRUE>
		)
		(<AND
			<MC-IS? .L ,FL-CONTAINER>
			<RT-VISIBLE? ,GL-PRSO>
			>
			<TELL "[from " D .L "]" CR>
			<RT-PERFORM ,V?TAKE ,GL-PRSO>
			<RTRUE>
		)
		(T
			<RT-IMPOSSIBLE-MSG>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-FEED"
;-----------------------------------------------------------------------------

<ROUTINE V-FEED ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-FEED">
		)
		(T
		)
	>
	<COND
		(<EQUAL? ,GL-PRSI ,GL-WINNER>
			<RT-CYOU-MSG>
		)
		(T
		 	<TELL CTHE ,GL-PRSI " ">
		)
	>
	<TELL "cannot eat " THE ,GL-PRSO "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-FEED-SWP"
;-----------------------------------------------------------------------------

<ROUTINE V-FEED-SWP ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-FEED-SWP">
		)
		(T
		)
	>
	<RT-PERFORM ,V?FEED ,GL-PRSI ,GL-PRSO>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-FILL"
;-----------------------------------------------------------------------------

<ROUTINE V-FILL ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-FILL">
		)
		(T
		)
	>
	<RT-PERFORM ,V?PUT ,GL-PRSI ,GL-PRSO>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-FIND"
;-----------------------------------------------------------------------------

<ROUTINE V-FIND ("AUX" L)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-FIND">
		)
		(T
		)
	>
	<SET L <LOC ,GL-PRSO>>
	<COND
		(<MC-F? .L>
			<TELL ,K-DO-IT-YOURSELF-MSG CR>
			<RTRUE>
		)
		(<MC-PRSO?
				CH-ME
				CH-PLAYER
				TH-HANDS
				TH-FOOT
				TH-WATSONS-HEART
				TH-FEET
				TH-EARS
				TH-HEAD
				TH-PLAYER-BODY
				TH-BREATH
				TH-CLOTHES
			>
			<TELL "You're right here." CR>
			<RTRUE>
		)
		(<IN? ,GL-PRSO ,CH-PLAYER>
			<TELL "You're ">
			<COND
				(<MC-IS? ,GL-PRSO ,FL-WORN>
					<TELL "wearing">
				)
				(T
					<TELL "holding">
				)
			>
			<TELL " ">
			<RT-SAY-HIM-HER-THEM-IT-MSG>
			<TELL "." CR>
			<RTRUE>
		)
		(<OR
			<IN? ,GL-PRSO ,GL-PLACE-CUR>
			<AND
				<IN? ,GL-PRSO ,LOCAL-GLOBALS>
				<RT-GLOBAL-IN? ,GL-PRSO ,GL-PLACE-CUR>
				>
			>
				<RT-ITS-RIGHT-HERE-MSG>
				<RTRUE>
		)
		(<AND <OR
					<MC-IS? .L ,FL-PERSON>
					<MC-IS? .L ,FL-ALIVE>
				>
				<RT-VISIBLE? .L>
			>
			<TELL CTHE .L " has it." CR>
			<RTRUE>
		)
		(<AND
			<RT-SEE-INSIDE? .L>
			<RT-VISIBLE? .L>
			>
				<RT-SAY-ITS-MSG>
				<RT-IN-ON-MSG .L <>>
				<TELL THE .L "." CR>
				<RTRUE>
		)
		(T
			<TELL ,K-DO-IT-YOURSELF-MSG CR>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-FLIP"
;-----------------------------------------------------------------------------

<ROUTINE V-FLIP ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-FLIP">
		)
		(T
		)
	>
	<COND
		(<AND	<MC-ISNOT? ,GL-PRSO ,FL-TAKEABLE>
				<MC-ISNOT? ,GL-PRSO ,FL-TRYTAKE>
			>
			<RT-IMPOSSIBLE-MSG>
		)
		(T
			<RT-NO-POINT-MSG "Flipping">
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-FLY"
;-----------------------------------------------------------------------------

<ROUTINE V-FLY ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-FLY">
		)
		(T
		)
	>
	<RT-CYOU-MSG>
	<TELL "cannot possibly do that." CR>
>

;-----------------------------------------------------------------------------
; "V-FOCUS-ON"
;-----------------------------------------------------------------------------

<ROUTINE V-FOCUS-ON ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-FOCUS-ON">
		)
		(T
		)
	>
	<COND
		(<MC-F? ,GL-PRSI>
			<COND
				(<MC-PRSO? TH-TELESCOPE>
					<RT-IMPOSSIBLE-MSG>
				)
				(<IN? ,TH-TELESCOPE ,CH-PLAYER>
					<RT-PERFORM ,V?LOOK-THRU ,GL-PRSO ,TH-TELESCOPE>
				)
				(T
					<TELL ,K-HOW-TO-MSG CR>
				)
			>
		)
		(T
			<COND
				(<MC-PRSO? TH-TELESCOPE>
					<RT-PERFORM ,V?LOOK-THRU ,GL-PRSI ,GL-PRSO>
				)
				(T
					<RT-CYOU-MSG>
					<TELL "cannot focus " THEO " on " THEI "." CR>
				)
			>
		)
	>
	<RTRUE>
>       

;-----------------------------------------------------------------------------
; "V-FOLD"
;-----------------------------------------------------------------------------

<ROUTINE V-FOLD ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-FOLD">
		)
		(T
		)
	>
	<RT-NO-POINT-MSG "Folding">
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-FOLLOW"
;-----------------------------------------------------------------------------

<ROUTINE V-FOLLOW ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-FOLLOW">
		)
		(T
		)
	>
	<COND
		(<MC-F? ,GL-PRSO>
			<RT-CANT-SEE-ANY-MSG>
			<MC-RFATAL>
		)
	>
	<TELL "But ">
	<COND
		(<MC-PRSO? CH-ME>
			<TELL "you're right here." CR>
			<RTRUE>
		)
		(T
			<TELL THEO>
			<COND
				(<AND <MC-IS? ,GL-PRSO ,FL-PLURAL>
						<MC-ISNOT? ,GL-PRSO ,FL-COLLECTIVE>
					>
					<TELL " are">
				)
				(T
					<TELL " is">
				)
			>
			<COND
				(<OR
					<RT-VISIBLE? ,GL-PRSO>
					<IN? ,GL-PRSO ,GLOBAL-OBJECTS>
					>
						<TELL " right here">
				)
				(T
					<TELL "n't visible at the moment">
				)
			>
		)
	>
	<TELL "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-FOO"
;-----------------------------------------------------------------------------

<ROUTINE V-FOO ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-FOO">
		)
		(T
		)
	>
	<COND
		(<MC-VERB-WORD? RENT>
			<TELL CTHEO>
			<RT-ISNT-ARENT-MSG>
			<TELL "for rent." CR>
		)
		(<MC-PRSO? ,ROOMS>
			<TELL "Same to you, fella." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-GET-FOR"
;-----------------------------------------------------------------------------

<ROUTINE V-GET-FOR ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-GET-FOR">
		)
		(T
		)
	>
	<RT-PERFORM ,V?TAKE ,GL-PRSO>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-GET-FOR-SWP"
;-----------------------------------------------------------------------------

<ROUTINE V-GET-FOR-SWP ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-GET-FOR-SWP">
		)
		(T
		)
	>
	<RT-PERFORM ,V?TAKE ,GL-PRSI>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-GIN"
;-----------------------------------------------------------------------------

<ROUTINE V-GIN ("AUX" WHO)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-GIN">
		)
		(T
		)
	>
	<COND
		(<MC-HERE? ,RM-BYWARD-TOWER>
			<TELL
CTHE ,CH-TOWER-GUARD " takes a quick look around and says, \"Thanks. Don't
mind if I do,\" whereupon he whips out a hip flask and takes a quick
slug. Just as quickly, he tucks it away and resumes staring at you." CR
			>
		)
		(T
			<SET WHO <RT-WHO-SAYS?>>
			<COND
				(<EQUAL? .WHO ,CH-HOLMES>
					<TELL
"Holmes shakes his head and says, \"No drinks for you until we recover the
jewels.\"" CR
					>
				)
				(<EQUAL? .WHO ,CH-WIGGINS>
					<TELL
"Wiggins says, \"Good idea. I could use a belt.\"" CR
					>
				)
				(T
		         <TELL
"Wrong game, dummy." CR
      		   >
				)
			>
      )
	>
	<RTRUE>
>


;-----------------------------------------------------------------------------
; "V-GIVE"
;-----------------------------------------------------------------------------

<ROUTINE V-GIVE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-GIVE">
		)
		(T
		)
	>
	<COND
		(<MC-PRSI? CH-ME>
			<RT-NOBODY-TO-ASK-MSG>
		)
		(<AND	<EQUAL? ,GL-PRSI ,CH-TOWER-GUARD ,CH-PALACE-GUARD ,CH-TUSSAUDS-GUARD>
				<MC-IS? ,GL-PRSO ,FL-MONEY>
			>
			<TELL
CTHEI " doesn't even glance at " THEO ". Clearly he cannot be bribed." CR
			>
		)
		(<MC-IS? ,GL-PRSI ,FL-PERSON>
			<TELL CTHEI " shows little interest in your offer." CR>
		)
		(T
			<RT-NOT-LIKELY-MSG ,GL-PRSI "would accept your offer">
			<CRLF>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-GIVE-SWP"
;-----------------------------------------------------------------------------

<ROUTINE V-GIVE-SWP ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-GIVE-SWP">
		)
		(T
		)
	>
	<RT-PERFORM ,V?GIVE ,GL-PRSI ,GL-PRSO>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-GOODBYE"
;-----------------------------------------------------------------------------

<ROUTINE V-GOODBYE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-GOODBYE">
		)
		(T
		)
	>
	<RT-HI-BYE-MSG>
>

;-----------------------------------------------------------------------------
; "V-GUESS"
;-----------------------------------------------------------------------------

<ROUTINE V-GUESS ("AUX" WHO)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-GUESS">
		)
		(T
		)
	>
	<SET WHO <RT-WHO-SAYS?>>
	<COND
		(<EQUAL? .WHO ,CH-WIGGINS>
			<TELL
"Wiggins says, \"Mr. 'Olmes doesn't like people guessing about things.\"" CR
			>
			<RTRUE>
		)
	>
	<COND
		(<EQUAL? ,GL-WINNER ,CH-HOLMES>
			<TELL "Holmes looks at you in shock and says, \"I never">
		)
		(<EQUAL? .WHO ,CH-HOLMES>
			<TELL "Holmes shakes his head and says, \"Never">
		)
		(T
			<TELL "Holmes's words come back to you, \"Never">
		)
	>
	<TELL " guess, Watson. It is a shocking habit - destructive
to the logical faculty.\"" CR
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-HAGGLE"
;-----------------------------------------------------------------------------

<ROUTINE V-HAGGLE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-HAGGLE">
		)
		(T
		)
	>
	<COND
		(<MC-ISNOT? ,GL-PRSO ,FL-PERSON>
			<RT-CYOU-MSG>
			<TELL "cannot " VW " with " AO "." CR>
		)
		(<MC-PRSO? ,CH-HOLMES>
			<TELL "There is nothing to negotiate with " THE ,CH-HOLMES "." CR>
		)
		(<MC-PRSO? ,CH-ME ,CH-PLAYER>
			<TELL "You have nothing to negotiate." CR>
		)
		(T
			<TELL CTHEO " refuses to negotiate." CR>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-HAUL"
;-----------------------------------------------------------------------------

<ROUTINE V-HAUL ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-HAUL">
		)
		(T
		)
	>
	<TELL "You're a Doctor, not a sailor." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-HEAT"
;-----------------------------------------------------------------------------

<ROUTINE V-HEAT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-HEAT">
		)
		(T
		)
	>
	<RT-NO-POINT-MSG "Heating">
>

;-----------------------------------------------------------------------------
; "V-HEEL"
;-----------------------------------------------------------------------------

<ROUTINE V-HEEL ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-HEEL">
		)
		(T
		)
	>
	<RT-IMPOSSIBLE-MSG>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-HELLO"
;-----------------------------------------------------------------------------

<ROUTINE V-HELLO ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-HELLO">
		)
		(T
		)
	>
	<RT-HI-BYE-MSG>
>

;-----------------------------------------------------------------------------
; "V-ASK-FOR-HELP"
;-----------------------------------------------------------------------------

<ROUTINE V-ASK-FOR-HELP ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-ASK-FOR-HELP">
		)
		(T
		)
	>
	<TELL "Wimp." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-HIDE"
;-----------------------------------------------------------------------------

<ROUTINE V-HIDE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-HIDE">
		)
		(T
		)
	>
	<TELL "You can run, but you cannot hide." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-HIT"
;-----------------------------------------------------------------------------

<ROUTINE V-HIT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-HIT">
		)
		(T
		)
	>
	<TELL "Attacking " THEO>
	<COND
		(<AND
			<MC-T? ,GL-PRSI>
			<NOT <MC-PRSI? TH-HANDS>>
			>
				<TELL " with " A ,GL-PRSI>
		)
	>
	<TELL ,K-WONT-HELP-MSG CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-HOLD-OVER"
;-----------------------------------------------------------------------------

<ROUTINE V-HOLD-OVER ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-HOLD-OVER">
		)
		(T
		)
	>
	<TELL "That would">
	<RT-WASTE-OF-TIME-MSG>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-HUSH"
;-----------------------------------------------------------------------------

<ROUTINE V-HUSH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-HUSH">
		)
		(T
		)
	>
	<TELL "Silence is golden." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-INHALE"
;-----------------------------------------------------------------------------

<ROUTINE V-INHALE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-INHALE">
		)
		(T
		)
	>
	<COND
		(<NOT <MC-PRSO? TH-BREATH ROOMS>>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
		(<MC-IS? ,TH-BREATH ,FL-LOCKED>
			<COND
				(<EQUAL? ,GL-P-PRSA-WORD ,W?BREATHE>
					<V-EXHALE>
				)
				(T
					<TELL "You are already holding " THE ,TH-BREATH "." CR>
				)
			>
		)
		(T
			<TELL "You take a deep breath.">
			<COND
				(<EQUAL? ,GL-PUPPY ,CH-HOLMES>
					<TELL
" " CTHE ,CH-HOLMES " notices your action and surreptitiously does likewise."
					>
				)
			>
			<CRLF>
		)
	>
	<RT-ALARM-SET-REL ,RT-I-EXHALE <RT-PARM-SET 0 2 0>>
	<MC-MAKE ,TH-BREATH ,FL-LOCKED>
	<SETG GL-CLOCK-WAIT T>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-KICK"
;-----------------------------------------------------------------------------

<ROUTINE V-KICK ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-KICK">
		)
		(T
		)
	>
	<RT-NO-POINT-MSG "Kicking">
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-KILL"
;-----------------------------------------------------------------------------

<ROUTINE V-KILL ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-KILL">
		)
		(T
		)
	>
	<TELL "Calm down." CR>
	<RTRUE>
> 

;-----------------------------------------------------------------------------
; "V-KISS"
;-----------------------------------------------------------------------------

<ROUTINE V-KISS ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-KISS">
		)
		(T
		)
	>
	<TELL "You really can't wait for the Victorian era to end, can you?" CR>
>

;-----------------------------------------------------------------------------
; "V-KNOCK"
;-----------------------------------------------------------------------------

<ROUTINE V-KNOCK ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-KNOCK">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,GL-PRSO ,FL-DOOR>
			<COND
				(<MC-IS? ,GL-PRSO ,FL-OPENED>
					<RT-ITS-ALREADY-MSG "open">
					<RTRUE>
				)
			>
			<TELL "There's no answer." CR>
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-PERSON>
			<RT-PERFORM ,V?USE ,GL-PRSO>
			<RTRUE>
		)
	>
	<TELL "That would">
	<RT-WASTE-OF-TIME-MSG>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-LEAP"
;-----------------------------------------------------------------------------

<ROUTINE V-LEAP ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-LEAP">
		)
		(T
		)
	>
	<COND
		(<NOT <MC-PRSO? ROOMS>>
			<TELL "No." CR>
			<RTRUE>
		)
		(T
			<TELL "That would">
			<RT-WASTE-OF-TIME-MSG>
			<RTRUE>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-LIE-DOWN"
;-----------------------------------------------------------------------------

<ROUTINE V-LIE-DOWN ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-LIE-DOWN">
		)
		(T
		)
	>
	<TELL "With so much at stake, resting is out of the question." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-LIGHT-WITH"
;-----------------------------------------------------------------------------

<ROUTINE V-LIGHT-WITH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-LIGHT-WITH">
		)
		(T
		)
	>
	<COND
		(<MC-PRSI? TH-LAMP>
			<COND
				(<MC-PRSI? GL-PRSO>
					<RT-IMPOSSIBLE-MSG>
					<RTRUE>
				)
			>
			<RT-PERFORM ,V?SHINE-AT ,GL-PRSI ,GL-PRSO>
			<RTRUE>
		)
	>
	<V-BURN-WITH>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-LISTEN"
;-----------------------------------------------------------------------------

<ROUTINE V-LISTEN ("AUX" (OBJ <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-LISTEN">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? ROOMS>
			<COND
				(<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
					<TELL "From afar you">
				)
				(T
					<TELL "You">
				)
			>
			<TELL " hear the sounds of the ">
			<COND
				(<IN? ,CH-PLAYER ,TH-BOAT>
					<TELL "river ">
				)
				(T
					<TELL "city ">
				)
			>
			<COND
				(<EQUAL? <RT-TIME-OF-DAY> 0>
					<TELL "at night">
				)
				(<EQUAL? <RT-TIME-OF-DAY> 1>
					<TELL "waking up">
				)
				(<EQUAL? <RT-TIME-OF-DAY> 2>
					<TELL "going about its business">
				)
				(<EQUAL? <RT-TIME-OF-DAY> 3>
					<TELL "going to sleep">
				)
			>
			<TELL "." CR>
		)
		(<NOT <MC-PRSI? <> ,TH-STETHOSCOPE ,TH-EARS>>
			<RT-CYOU-MSG>
			<TELL "cannot listen to anything with " THEI "." CR>
		)
		(<AND <MC-PRSI? ,TH-STETHOSCOPE>
				<MC-ISNOT? ,TH-STETHOSCOPE ,FL-WORN>
				>
					<TELL CTHEI " is not in " THE ,TH-EARS "." CR>
		)
		(<AND <MC-IS? ,GL-PRSO ,FL-ALIVE>
				<MC-PRSI? ,TH-STETHOSCOPE>
				>
				<TELL
"You don't need to. Your experienced eye tells you there
is nothing wrong with " THEO "." CR
				>
		)
		(T
			<TELL "At the moment, ">
         <COND
            (<MC-PRSO? ,CH-PLAYER ,CH-ME>
               <TELL "you are ">
            )
            (T
               <TELL THEO>
      			<RT-IS-ARE-MSG>
            )
         >
			<TELL "silent." CR>
			<SETG GL-LISTEN-OBJ ,GL-PRSO>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-LOCK"
;-----------------------------------------------------------------------------

<ROUTINE V-LOCK ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-LOCK">
		)
		(T
		)
	>
	<COND
		(<OR
			<MC-IS? ,GL-PRSO ,FL-OPENABLE>
			<MC-IS? ,GL-PRSO ,FL-CONTAINER>
			>
				<COND
					(<MC-IS? ,GL-PRSO ,FL-OPENED>
						<RT-YOUD-HAVE-TO-MSG "close" ,GL-PRSO>
						<RTRUE>
					)
					(<MC-IS? ,GL-PRSO ,FL-LOCKED>
						<TELL CTHEO>
						<RT-IS-ARE-MSG>
						<TELL "already locked." CR>
						<RTRUE>
					)
					(T
						<RT-THING-WONT-LOCK-MSG ,GL-PRSI ,GL-PRSO>
					)
				>
		)
		(T
			<RT-CANT-LOCK-MSG>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-LOO"
;-----------------------------------------------------------------------------

<ROUTINE V-LOO ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-LOO">
		)
		(T
		)
	>
	<TELL "There isn't one nearby. You'll just have to wait." CR>
	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "V-LOOK"
;-----------------------------------------------------------------------------

<ROUTINE V-LOOK ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-LOOK">
		)
		(T
		)
	>
	<RT-DESC-ALL <> T>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-LOOK-BEHIND"
;-----------------------------------------------------------------------------

<ROUTINE V-LOOK-BEHIND ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-LOOK-BEHIND">
		)
		(T
		)
	>
	<COND
		(<MC-F? ,GL-NOW-LIT?>
			<TELL ,K-TOO-DARK-MSG CR>
			<MC-RFATAL>
		)
		(<MC-IS? ,GL-PRSO ,FL-DOOR>
			<COND
				(<MC-IS? ,GL-PRSO ,FL-OPENED>
					<RT-CANT-SEE-MUCH-MSG>
				)
				(T
					<RT-ITS-CLOSED-MSG ,GL-PRSO>
				)
			>
			<RTRUE>
		)
		(T
			<TELL "There's nothing behind " THEO "." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-LOOK-DOWN"
;-----------------------------------------------------------------------------

<ROUTINE V-LOOK-DOWN ("AUX" (X <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-LOOK-DOWN">
		)
		(T
		)
	>
	<COND
		(<MC-F? ,GL-NOW-LIT?>
			<TELL ,K-TOO-DARK-MSG CR>
			<MC-RFATAL>
		)
		(<MC-PRSO? ROOMS>
			<SET X <GETP ,GL-PLACE-CUR ,P?LOOKDN>>
			<COND
				(<MC-T? .X>
					<RT-PERFORM ,V?EXAMINE .X>
				)
				(T
					<RT-NOTHING-INTERESTING-MSG>
					<TELL " down there." CR>
				)
			>
			<RTRUE>
		)
		(T
			<TELL "You cannot look down " AO "." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-LOOK-INSIDE"
;-----------------------------------------------------------------------------

<ROUTINE V-LOOK-INSIDE ("AUX" ODF)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-LOOK-INSIDE">
		)
		(T
		)
	>
	<COND
		(<MC-T? .ODF>
			<COND
				(<MC-T? <APPLY .ODF>>
					<RTRUE>
				)
			>
		)
	>
	<COND
		(<MC-F? ,GL-NOW-LIT?>
			<TELL ,K-TOO-DARK-MSG CR>
			<MC-RFATAL>
		)
		(<MC-IS? ,GL-PRSO ,FL-PERSON>
			<RT-YOURE-NOT-A-MSG "surgeon">
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-ALIVE>
			<RT-YOURE-NOT-A-MSG "veterinarian">
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-CONTAINER>
			<COND
				(<AND
					<MC-ISNOT? ,GL-PRSO ,FL-OPENED>
					<MC-ISNOT? ,GL-PRSO ,FL-TRANSPARENT>
					>
						<RT-YOUD-HAVE-TO-MSG "open" ,GL-PRSO>
						<RTRUE>
				)
				(T
					<TELL "In " THEO " you see ">
					<RT-PRINT-CONTENTS-2 ,GL-PRSO>
					<TELL "." CR>
				)
			>
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-DOOR>
			<COND
				(<MC-IS? ,GL-PRSO ,FL-OPENED>
					<RT-CANT-SEE-MUCH-MSG>
				)
				(T
					<RT-ITS-CLOSED-MSG ,GL-PRSO>
				)
			>
			<RTRUE>
		)
		(T
			<TELL "You cannot look inside " AO "." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-LOOK-ON"
;-----------------------------------------------------------------------------

<ROUTINE V-LOOK-ON ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-LOOK-ON">
		)
		(T
		)
	>
	<COND
		(<MC-F? ,GL-NOW-LIT?>
			<TELL ,K-TOO-DARK-MSG CR>
			<MC-RFATAL>
		)
		(<MC-IS? ,GL-PRSO ,FL-SURFACE>
			<TELL "On " THEO " you see ">
			<RT-PRINT-CONTENTS-2 ,GL-PRSO>
			<TELL "." CR>
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-READABLE>
			<TELL CTHEO " has something written on it." CR>
			<RTRUE>
		)
		(T
			<RT-NOTHING-INTERESTING-MSG>
			<TELL " on " THEO "." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-LOOK-OUTSIDE"
;-----------------------------------------------------------------------------

<ROUTINE V-LOOK-OUTSIDE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-LOOK-OUTSIDE">
		)
		(T
		)
	>
	<COND
		(<MC-F? ,GL-NOW-LIT?>
			<TELL ,K-TOO-DARK-MSG CR>
			<MC-RFATAL>
		)
		(<MC-PRSO? ROOMS>
			<COND
				(<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
					<RT-NOTHING-INTERESTING-MSG>
					<TELL " outside." CR>
				)
				(T
					<TELL "You are outside." CR>
				)
			>
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-DOOR>
			<COND
				(<MC-IS? ,GL-PRSO ,FL-OPENED>
					<RT-CANT-SEE-MUCH-MSG>
				)
				(T
					<RT-ITS-CLOSED-MSG ,GL-PRSO>
				)
			>
			<RTRUE>
		)
		(T
			<TELL "You cannot look out of " AO "." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-LOOK-THRU"
;-----------------------------------------------------------------------------

<ROUTINE V-LOOK-THRU ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-LOOK-THRU">
		)
		(T
		)
	>
	<COND
		(<MC-F? ,GL-NOW-LIT?>
			<TELL ,K-TOO-DARK-MSG CR>
			<MC-RFATAL>
		)
		(<AND	<EQUAL? ,GL-P-PRSA-WORD ,W?EXAMINE ,W?X>
				<MC-PRSI? ,TH-STETHOSCOPE>
				<MC-IS? ,GL-PRSO ,FL-PERSON>
			>
			<RT-PERFORM ,V?LISTEN ,GL-PRSO ,GL-PRSI>
		)
		(<AND
			<MC-T? ,GL-PRSI>
			<MC-ISNOT? ,GL-PRSI ,FL-TRANSPARENT>
			>
				<TELL "You can't look through " THEI "." CR>
				<RTRUE>
		)
		(<AND
			<MC-T? ,GL-PRSI>
			<MC-IS? ,GL-PRSI ,FL-TRANSPARENT>
			>
			<RT-NOTHING-INTERESTING-MSG>
			<TELL " through " THEI "." CR>
			<RTRUE>
		)
		(T
			<RT-NOTHING-INTERESTING-MSG>
			<TELL "at all." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-LOOK-THRU-SWP"
;-----------------------------------------------------------------------------

<ROUTINE V-LOOK-THRU-SWP ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-LOOK-THRU-SWP">
		)
		(T
		)
	>
	<RETURN <RT-PERFORM ,V?LOOK-THRU ,GL-PRSI ,GL-PRSO>>
>

;-----------------------------------------------------------------------------
; "V-LOOK-UNDER"
;-----------------------------------------------------------------------------

<ROUTINE V-LOOK-UNDER ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-LOOK-UNDER">
		)
		(T
		)
	>
	<COND
		(<MC-F? ,GL-NOW-LIT?>
			<TELL ,K-TOO-DARK-MSG CR>
			<MC-RFATAL>
		)
		(<IN? ,GL-PRSO ,CH-PLAYER>
			<TELL "You are already ">
			<COND
				(<MC-IS? ,GL-PRSO ,FL-WORN>
					<TELL "wearing">
				)
				(T
					<TELL "holding">
				)
			>
			<TELL " that." CR>
			<RTRUE>
		)
		(T
			<RT-NOTHING-INTERESTING-MSG>
			<TELL " under " THEO "." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-LOOK-UP"
;-----------------------------------------------------------------------------

<ROUTINE V-LOOK-UP ("AUX" (X <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-LOOK-UP">
		)
		(T
		)
	>
	<COND
		(<MC-F? ,GL-NOW-LIT?>
			<TELL ,K-TOO-DARK-MSG CR>
			<MC-RFATAL>
		)
		(<MC-PRSO? ROOMS>
			<SET X <GETP ,GL-PLACE-CUR ,P?LOOKUP>>
			<COND
				(<MC-T? .X>
					<RT-PERFORM ,V?EXAMINE .X>
				)
				(T
					<RT-NOTHING-INTERESTING-MSG>
					<TELL " up there." CR>
				)
			>
			<RTRUE>
		)
		(T
			<TELL "You cannot look up " AO "." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-LOOSEN"
;-----------------------------------------------------------------------------

<ROUTINE V-LOOSEN ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-LOOSEN">
		)
		(T
		)
	>
	<TELL "That would">
	<RT-WASTE-OF-TIME-MSG>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-LOWER"
;-----------------------------------------------------------------------------

<ROUTINE V-LOWER ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-LOWER">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? ROOMS>
			<RT-DO-WALK ,P?DOWN>
			<RTRUE>
		)
		(T
			<V-RAISE>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-LAND"
;-----------------------------------------------------------------------------

<ROUTINE V-LAND ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-LAND">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? ,ROOMS>
			<COND
				(<IN? ,CH-PLAYER ,TH-BOAT>
					<RT-LAND-BOAT>
				)
				(T
					<TELL "Very good. Next week, we'll learn the word for
water." CR
					>
				)
			>
			<RTRUE>
		)
		(<MC-PRSO? ,TH-BOAT>
			<COND
				(<IN? ,CH-PLAYER ,TH-BOAT>
					<RT-LAND-BOAT>
				)
				(T
					<TELL ,K-MUST-BE-IN-BOAT-MSG "land it." CR>
				)
			>
		)
		(T
			<TELL "You can't land " THEO "!" CR>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-LAND-BOAT"
;-----------------------------------------------------------------------------

<ROUTINE RT-LAND-BOAT ()
	<COND
		(<IN? ,TH-BOAT ,RM-THE-EMBANKMENT>
			<TELL "The boat is already on the Embankment." CR>
		)
		(<IN? ,TH-BOAT ,RM-OUTSIDE-TRAITORS-GATE>
			<TELL "The boat is already at Traitors Gate." CR>
		)
		(<NOT <IN? ,TH-ANCHOR ,TH-BOAT>>
			<TELL
"You can't land the boat. The anchor seems to be doing its job." CR
			>
		)
		(<IN? ,TH-BOAT ,RM-THAMES-ONE>
			<TELL "You land the boat on the embankment." CR>
			<MOVE ,TH-BOAT ,RM-THE-EMBANKMENT>
			<RT-ALARM-CLR ,RT-I-MOVE-DOWNSTREAM>
		)
		(<IN? ,TH-BOAT ,RM-THAMES-FOUR>
			<TELL "You land the boat outside Traitors Gate." CR>
			<MOVE ,TH-BOAT ,RM-OUTSIDE-TRAITORS-GATE>
			<RT-ALARM-CLR ,RT-I-MOVE-DOWNSTREAM>
		)
		(T
			<TELL
"There doesn't seem to be any place to land the boat." CR
			>
			<RT-ALARM-CLR ,RT-I-MOVE-DOWNSTREAM>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-LAMP-OFF"
;-----------------------------------------------------------------------------

<ROUTINE V-LAMP-OFF ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-LAMP-OFF">
		)
		(T
		)
	>
	<V-LAMP-ON T>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-LAMP-ON"
;-----------------------------------------------------------------------------

<ROUTINE V-LAMP-ON ("OPTIONAL" (OFF? <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-LAMP-ON">
		)
		(T
		)
	>
	<RT-CYOU-MSG>
	<TELL "couldn't " VW " that ">
	<COND
		(<AND .OFF?
				<MC-VERB-WORD? CLOSE SHUT TURN>
			>
			<TELL "off">
		)
		(<AND .OFF?
				<MC-VERB-WORD? BLOW PUT>
			>
			<TELL "out">
		)
		(<AND <NOT .OFF?>
				<MC-VERB-WORD? TURN>
			>
			<TELL "on">
		)
	>
	<COND
		(<NOT <EQUAL? ,GL-PRSI <> ,TH-HANDS>>
			<TELL ", " D ,GL-PRSI " or no " D ,GL-PRSI>
		)
	>
	<TELL "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-LAUNCH"
;-----------------------------------------------------------------------------

<ROUTINE V-LAUNCH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-LAUNCH">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? ,ROOMS>
			<COND
				(<OR
					<IN? ,CH-PLAYER ,TH-BOAT>
					<EQUAL? <LOC ,CH-PLAYER> <LOC ,TH-BOAT>>
					>
						<RT-LAUNCH-BOAT>
				)
				(T
					<TELL
"That usually works better when one is in a boat." CR
					>
				)
			>
			<RTRUE>
		)
		(<MC-PRSO? ,TH-BOAT>
		  	<RT-LAUNCH-BOAT>
		)
		(T
			<TELL
"You can't launch " THEO ". Perhaps you meant to throw it?" CR
			>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-LAUNCH-BOAT"
;-----------------------------------------------------------------------------

<ROUTINE RT-LAUNCH-BOAT ()
	<COND
		(<NOT <IN? ,TH-ANCHOR ,TH-BOAT>>
			<RT-THIS-IS-IT ,TH-ANCHOR>
			<TELL
"The anchor is restraining the boat." CR
			>
		)
		(<NOT <IN? ,CH-PLAYER ,TH-BOAT>>
			<TELL
"You push the boat into the Thames, and then watch as it slowly floats
away. Too bad you weren't in it." CR
			>
			<REMOVE ,TH-BOAT>
		)
		(<IN? ,TH-BOAT ,RM-THE-EMBANKMENT>
			<TELL
"The boat slips away from the Embankment. You are now in the middle of
the Thames." CR
			>
			<MOVE ,TH-BOAT ,RM-THAMES-ONE>
		)
		(<IN? ,TH-BOAT ,RM-OUTSIDE-TRAITORS-GATE>
			<TELL
"The boat slips out into the river." CR
			>
			<MOVE ,TH-BOAT ,RM-THAMES-FOUR>
		)
		(T
			<TELL
"You are already on the Thames. You don't need to launch the
boat again." CR
			>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-MAKE"
;-----------------------------------------------------------------------------

<ROUTINE V-MAKE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-MAKE">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? ,TH-RUBBINGS>
			<TELL
"[To make a rubbing, put a blank piece of paper on a tomb, and then rub
the paper with the crayon.]" CR
			>
			<MC-RFATAL>
		)
		(T
			<TELL ,K-HOW-TO-MSG CR>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-MARX"
;-----------------------------------------------------------------------------

<ROUTINE V-MARX ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-MARX">
		)
		(T
		)
	>
	<COND
		(<EQUAL? ,GL-P-PRSA-WORD ,W?MARX>
			<TELL "Cocoanuts." CR>
		)
		(<EQUAL? ,GL-P-PRSA-WORD ,W?CHICO>
			<TELL
"Wattsa matta you? You needa de password? I sell it you." CR
			>
		)
		(<EQUAL? ,GL-P-PRSA-WORD ,W?GROUCHO>
			<TELL "Say the secret woid, and the guy will let you in." CR>
		)
		(<EQUAL? ,GL-P-PRSA-WORD ,W?GUMMO>
			<TELL "This isn't a trivia game. Get back to work." CR>
		)
		(<EQUAL? ,GL-P-PRSA-WORD ,W?HARPO>
			<CRLF>
		)
		(<EQUAL? ,GL-P-PRSA-WORD ,W?ZEPPO>
			<TELL
"Did you really think saying \"Zeppo\" was going to get you anywhere?" CR
			>
		)
		(<EQUAL? ,GL-P-PRSA-WORD ,W?PUNT>
			<TELL
"But it's not even fourth down!" CR
			>
		)
		(<EQUAL? ,GL-P-PRSA-WORD ,W?HUM ,W?WHISTLE ,W?SING>
			<TELL
"You " VW " tunelessly for a few moments until you remember that
you're tone deaf and know next to nothing about music." CR
			>
		)
		(<EQUAL? ,GL-P-PRSA-WORD ,W?ECHO>
			<TELL "ECHO...Echo...echo...." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-MELT"
;-----------------------------------------------------------------------------

<ROUTINE V-MELT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-MELT">
		)
		(T
		)
	>
	<TELL ,K-HOW-TO-MSG CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-MOVE"
;-----------------------------------------------------------------------------

<ROUTINE V-MOVE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-MOVE">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? ROOMS>
			<V-WALK-AROUND>
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-TAKEABLE>
			<TELL "Moving " THEO " would" <RT-PICK-NEXT ,GL-NO-POINT-TXT> "." CR>
			<RTRUE>
		)
		(T
			<TELL "You cannot possibly move " THEO "." CR>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-MUNG"
;-----------------------------------------------------------------------------

<ROUTINE V-MUNG ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-MUNG">
		)
		(T
		)
	>
	<RT-NO-POINT-MSG "Trying to destroy">
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-OPEN"
;-----------------------------------------------------------------------------

<ROUTINE V-OPEN ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-OPEN">
		)
		(T
		)
	>
	<COND
		(<MC-ISNOT? ,GL-PRSO ,FL-OPENABLE>
			<RT-CANT-OPEN-PRSO-MSG>
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-OPENED>
			<RT-ITS-ALREADY-MSG "open">
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-LOCKED>
			<RT-OBJECT-IS-LOCKED-MSG>
			<RTRUE>
		)
		(T
			<RT-YOU-OPEN-MSG>
			<COND
				(<MC-IS? ,GL-PRSO ,FL-CONTAINER>
               <COND
                  (<MC-F? ,GL-NOW-LIT?>
                     <TELL
"It is too dark to see inside." CR
                     >
                  )
                  (T
							<TELL "Inside you see ">
							<RT-PRINT-CONTENTS-2 ,GL-PRSO>
							<TELL "." CR>
                  )
               >
				)
			>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-OPEN-WITH"
;-----------------------------------------------------------------------------

<ROUTINE V-OPEN-WITH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-OPEN-WITH">
		)
		(T
		)
	>
	<COND
		(<NOT <MC-IS? ,GL-PRSO ,FL-OPENABLE>>
			<RT-CANT-OPEN-PRSO-MSG>
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-OPENED>
			<RT-ITS-ALREADY-MSG "open">
			<RTRUE>
		)
	>
	<RT-CYOU-MSG>
	<TELL "cannot " VW " " THEO " with " THEI "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-PADDLE"
;-----------------------------------------------------------------------------

<ROUTINE V-PADDLE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-PADDLE">
		)
		(T
		)
	>
	<COND
		(<IN? ,GL-WINNER ,TH-BOAT>
			<COND
				(<MC-PRSO? ,TH-BOAT ,TH-INTDIR>
					<TELL ,K-BETTER-SUCCESS-MSG CR>
				)
				(T
					<V-HIT>
				)
			>
		)
		(<MC-PRSO? ,TH-INTDIR>
			<RT-CYOU-MSG "are" "is">
			<TELL
"not in a boat." CR
			>
		)
		(T
			<V-HIT>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-PADDLE-WITH"
;-----------------------------------------------------------------------------

<ROUTINE V-PADDLE-WITH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-PADDLE-WITH">
		)
		(T
		)
	>
	<COND
		(<MC-PRSI? ,TH-VIOLIN>
			<TELL
"How could you even THINK of using such a beautiful instrument in such a
manner?" CR
			>
		)
		(<IN? ,GL-WINNER ,TH-BOAT>
			<COND
				(<MC-PRSO? ,TH-INTDIR>
					<RT-CYOU-MSG "are" "is">
					<TELL "not in a boat." CR>
				)
				(T
					<TELL ,K-BETTER-SUCCESS-MSG CR>
				)
			>
		)
		(<MC-PRSO? ,TH-INTDIR>
			<RT-CYOU-MSG>
			<TELL "can't paddle anywhere with " THEI "." CR>
		)
		(T
			<V-HIT>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-PASSWORD"
;-----------------------------------------------------------------------------

<ROUTINE V-PASSWORD ("AUX" WRD)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-PASSWORD">
		)
		(T
		)
	>
	<SET WRD <GET ,GL-P-NAMW 0>>
	<COND
		(<EQUAL? .WRD ,W?SWORDFISH>
			<RT-PERFORM ,V?SWORDFISH>
		)
		(<EQUAL? .WRD ,W?PARR>
			<RT-PERFORM ,V?PARR>
		)
		(<EQUAL? .WRD ,W?CLEVES>
			<RT-PERFORM ,V?CLEVES>
		)
		(<EQUAL? .WRD ,W?ARAGON>
			<RT-PERFORM ,V?ARAGON>
		)
		(<EQUAL? .WRD ,W?HOWARD>
			<RT-PERFORM ,V?HOWARD>
		)
		(<EQUAL? .WRD ,W?SEYMOUR>
			<RT-PERFORM ,V?SEYMOUR>
		)
		(<EQUAL? .WRD ,W?BOLEYN>
			<RT-PERFORM ,V?BOLEYN>
		)
		(<EQUAL? .WRD ,W?GIN>
			<RT-PERFORM ,V?GIN>
		)
		(T
			<TELL "No it isn't." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-PAY"
;-----------------------------------------------------------------------------

<ROUTINE V-PAY ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-PAY">
		)
		(T
		)
	>
	<RT-PERFORM ,V?GIVE ,GL-PRSI ,GL-PRSO>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-PICK"
;-----------------------------------------------------------------------------

<ROUTINE V-PICK ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-PICK">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,GL-PRSO ,FL-OPENABLE>
			<RT-YOURE-NOT-A-MSG "locksmith">
		)
		(T
			<RT-IMPOSSIBLE-MSG>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-PLAY"
;-----------------------------------------------------------------------------

<ROUTINE V-PLAY ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-PLAY">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? ROOMS>
			<TELL "That would">
			<RT-WASTE-OF-TIME-MSG>
		)
		(T
			<RT-NO-POINT-MSG "Playing with">
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-PLUG"
;-----------------------------------------------------------------------------

<ROUTINE V-PLUG ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-PLUG">
		)
		(T
		)
	>
	<RT-CYOU-MSG>
	<TELL "cannot ">
	<PRINTB ,GL-P-PRSA-WORD>
	<TELL " " THEO " into ">
	<COND
		(<MC-T? ,GL-PRSI>
			<TELL THEI>
		)
		(T
			<TELL "anything">
		)
	>
	<TELL "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-POCKET"
;-----------------------------------------------------------------------------

<ROUTINE V-POCKET ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-POCKET">
		)
		(T
		)
	>
	<RT-PERFORM ,V?PUT ,GL-PRSO ,TH-POCKET>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-POINT"
;-----------------------------------------------------------------------------

<ROUTINE V-POINT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-POINT">
		)
		(T
		)
	>
	<RT-NO-POINT-MSG "Pointing at">
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-POINT-AT"
;-----------------------------------------------------------------------------

<ROUTINE V-POINT-AT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-POINT-AT">
		)
		(T
		)
	>
	<RT-NO-POINT-MSG "Pointing">
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-POINT-AT-SWP"
;-----------------------------------------------------------------------------

<ROUTINE V-POINT-AT-SWP ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-POINT-AT-SWP">
		)
		(T
		)
	>
	<RT-NO-POINT-MSG "Pointing">
	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "V-POUR"
;-----------------------------------------------------------------------------

<ROUTINE V-POUR ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-POINT">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? TH-HANDS>
			<TELL "[To do that, just DROP EVERYTHING.]" CR>
			<MC-RFATAL>
		)
		(<MC-PRSO? TH-POCKET>
			<RT-YOUD-HAVE-TO-MSG "take off" ,TH-CLOTHES>
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-SURFACE>
			<RT-EMPTY-PRSO-MSG ,TH-GROUND>
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-CONTAINER>
			<COND
				(<MC-IS? ,GL-PRSO ,FL-OPENED>
					<RT-EMPTY-PRSO-MSG ,TH-GROUND>
					<RTRUE>
				)
			>
			<RT-ITS-CLOSED-MSG>
			<RTRUE>
		)
		(T
			<RT-CYOU-MSG>
			<TELL "cannot empty ">
			<RT-SAY-HIM-HER-THEM-IT-MSG>
			<TELL "." CR>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-POUR-FROM"
;-----------------------------------------------------------------------------

<ROUTINE V-POUR-FROM ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-POUR-FROM">
		)
		(T
		)
	>
	<COND
		(<MC-PRSI? TH-HANDS>
			<RT-PERFORM ,V?DROP ,GL-PRSO>
			<RTRUE>
		)
		(<MC-PRSI? TH-POCKET>
			<RT-YOUD-HAVE-TO-MSG "take off" ,TH-CLOTHES>
			<RTRUE>
		)
		(<AND
			<NOT <MC-IS? ,GL-PRSI ,FL-CONTAINER>>
			<NOT <MC-IS? ,GL-PRSI ,FL-SURFACE>>
			>
				<TELL "You cannot">
				<PRINTB ,GL-P-PRSA-WORD>
				<TELL " things from " A ,GL-PRSI "." CR>
				<RTRUE>
		)
		(<AND
			<MC-IS? ,GL-PRSI ,FL-CONTAINER>
		  	<NOT <MC-IS? ,GL-PRSI ,FL-OPENED>>
		  	>
				<RT-ITS-CLOSED-MSG ,GL-PRSI>
				<RTRUE>
		)
		(<IN? ,GL-PRSO ,GL-PRSI>
			<COND
				(<MC-IS? ,GL-PRSO ,FL-TAKEABLE>
					<TELL CTHEO " ">
					<RT-LANDS-AT-YOUR-FEET-MSG>
					<RTRUE>
				)
			>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
		(T
			<TELL CTHEO " isn't in " THEI "." CR>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-PRAY"
;-----------------------------------------------------------------------------

<ROUTINE V-PRAY ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-PRAY">
		)
		(T
		)
	>
	<TELL "Good idea. You could use the help." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-PULL"
;-----------------------------------------------------------------------------

<ROUTINE V-PULL ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-PULL">
		)
		(T
		)
	>
	<RT-NO-POINT-MSG "Pulling on">
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-PUSH"
;-----------------------------------------------------------------------------

<ROUTINE V-PUSH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-PUSH">
		)
		(T
		)
	>
	<RT-NO-POINT-MSG "Pushing around">
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-PUSH-TO"
;-----------------------------------------------------------------------------

<ROUTINE V-PUSH-TO ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-PUSH-TO">
		)
		(T
		)
	>
	<COND
		(<AND
			<MC-PRSO? TH-HANDS>
			<MC-T? ,GL-PRSI>
			>
				<RT-PERFORM ,V?REACH-IN ,GL-PRSI>
				<RTRUE>
		)
	>
	<RT-CYOU-MSG>
	<TELL "cannot push " THEO " around like that." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-PUT"
;-----------------------------------------------------------------------------

<ROUTINE V-PUT ("AUX" L)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-PUT">
		)
		(T
		)
	>
	<SET L <LOC ,GL-PRSO>>
	<COND
		(<EQUAL? .L ,GLOBAL-OBJECTS>
			<TELL "That would">
			<RT-WASTE-OF-TIME-MSG>
		)
      (<MC-IS? ,GL-PRSO ,FL-BODYPART>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
      )
		(<MC-PRSI? ,TH-FLOOR ,TH-GROUND>
			<MOVE ,GL-PRSO ,GL-PLACE-CUR>
			<COND
				(<MC-T? ,GL-P-MULT?>
					<TELL "Done." CR>
				)
				(T
					<RT-CYOU-MSG "put" "puts">
					<TELL THEO>
					<RT-IN-ON-MSG ,GL-PRSI>
					<TELL THEI "." CR>
				)
			>
			<RTRUE>
		)
		(<OR
			<MC-F? .L>
			<AND
				<MC-T? ,GL-PRSI>
				<MC-ISNOT? ,GL-PRSI ,FL-SURFACE>
				<MC-ISNOT? ,GL-PRSI ,FL-CONTAINER>
				<MC-ISNOT? ,GL-PRSI ,FL-OPENED>
				<MC-ISNOT? ,GL-PRSI ,FL-OPENABLE>
				>
			>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
		(<AND <MC-ISNOT? ,GL-PRSI ,FL-OPENED>
				<MC-ISNOT? ,GL-PRSI ,FL-SURFACE>
			>
			<TELL CTHEI>
			<RT-ISNT-ARENT-MSG ,GL-PRSI>
			<TELL "open." CR>
			<RTRUE>
		)
		(<RT-ROOM-IN-ON-MSG? ,GL-PRSO ,GL-PRSI>
			T
		)
		(<NOT <EQUAL? .L ,GL-WINNER>>
			<TELL "Maybe">
			<RT-YOU-MSG>
			<TELL "should take " THEO>
			<RT-OUT-OFF-MSG .L>
			<TELL THE .L " first." CR>
			<RTRUE>
		)
		(T
			<MOVE ,GL-PRSO ,GL-PRSI>
			<MC-MAKE ,GL-PRSO ,FL-TOUCHED>
			<COND
				(<AND <MC-IS? ,GL-PRSI ,FL-CONTAINER>
			         <RT-PUT-OUT ,GL-PRSO>
					>
					<RTRUE>
				)
				(<MC-T? ,GL-P-MULT?>
					<TELL "Done." CR>
				)
				(T
					<RT-CYOU-MSG "put" "puts">
					<TELL THEO>
					<RT-IN-ON-MSG ,GL-PRSI>
					<TELL THEI "." CR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-PUT-BEHIND"
;-----------------------------------------------------------------------------

<ROUTINE V-PUT-BEHIND ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-PUT-BEHIND">
		)
		(T
		)
	>
	<TELL "That hiding place is too obvious." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-PUT-ON"
;-----------------------------------------------------------------------------

<ROUTINE V-PUT-ON ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-PUT-ON"> 
		)
		(T
		)
	>
	<COND
		(<MC-PRSI? CH-ME>
			<RT-PERFORM ,V?WEAR ,GL-PRSO>
			<RTRUE>
		)
	>
	<V-PUT>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-PUT-UNDER"
;-----------------------------------------------------------------------------

<ROUTINE V-PUT-UNDER ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-PUT-UNDER">
		)
		(T
		)
	>
	<RT-CYOU-MSG>
	<TELL "cannot put anything under ">
	<RT-SAY-HIM-HER-THEM-IT-MSG>
	<TELL "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-QUESTION"
;-----------------------------------------------------------------------------

<ROUTINE V-QUESTION ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-QUESTION">
		)
		(T
		)
	>
	<COND
		(<EQUAL? ,GL-WINNER ,CH-PLAYER>
			<RT-TO-DO-THING-USE-MSG "ask about" "ASK CHARACTER ABOUT">
			<MC-RFATAL>
		)
	>
	<RT-NO-RESPONSE-MSG>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-RAISE"
;-----------------------------------------------------------------------------

<ROUTINE V-RAISE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-RAISE">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? ROOMS>
			<V-STAND>
			<RTRUE>
		)
		(T
			<RT-NO-POINT-MSG "Toying in this way with">
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-RAPE"
;-----------------------------------------------------------------------------

<ROUTINE V-RAPE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-RAPE">
		)
		(T
		)
	>
	<TELL "What a wholesome idea." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-REACH-IN"
;-----------------------------------------------------------------------------

<ROUTINE V-REACH-IN ("AUX" OBJ)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-REACH-IN">
		)
		(T
		)
	>
	<SET OBJ <FIRST? ,GL-PRSO>>
	<COND
		(<OR
			<MC-IS? ,GL-PRSO ,FL-PERSON>
			<MC-IS? ,GL-PRSO ,FL-ALIVE>
			>
				<RT-YOURE-NOT-A-MSG "surgeon">
				<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-DOOR>
			<COND
				(<MC-IS? ,GL-PRSO ,FL-OPENED>
					<TELL "You reach into " THEO ", but experience nothing "
					<RT-PICK-NEXT ,GL-BORING-TXT> "." CR>
					<RTRUE>
				)
			>
			<RT-ITS-CLOSED-MSG>
			<RTRUE>
		)
		(<NOT <MC-IS? ,GL-PRSO ,FL-CONTAINER>>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
		(<NOT <MC-IS? ,GL-PRSO ,FL-OPENED>>
			<TELL "It's not open." CR>
			<RTRUE>
		)
		(<OR
			<MC-F? .OBJ>
			<NOT <MC-IS? .OBJ ,FL-TAKEABLE>>
			>
				<COND
					(<AND <MC-IS? ,GL-PRSO ,FL-PLURAL>
							<MC-ISNOT? ,GL-PRSO ,FL-COLLECTIVE>
						>
						<TELL "They're">
					)
					(T
						<TELL "It's">
					)
				>
				<TELL " empty." CR>
				<RTRUE>
		)
		(T
			<SETG GL-P-IT-OBJECT .OBJ>
			<TELL "You ">
			<COND
				(<MC-PRSO? ,TH-EARS>
					<TELL "put your hands to ">
				)
				(T
					<TELL "reach into ">
				)
			>
			<TELL THEO ". There's something in there." CR>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-READ"
;-----------------------------------------------------------------------------

<ROUTINE V-READ ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-READ">
		)
		(T
		)
	>
	<COND
		(<MC-F? ,GL-NOW-LIT?>
			<TELL ,K-TOO-DARK-MSG CR>
			<MC-RFATAL>
		)
		(<NOT <MC-IS? ,GL-PRSO ,FL-READABLE>>
			<RT-HOW-READ-MSG>
			<TELL "?" CR>
			<RTRUE>
		)
		(T
			<TELL "There's nothing written on it." CR>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-READ-TO"
;-----------------------------------------------------------------------------

<ROUTINE V-READ-TO ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-READ-TO">
		)
		(T
		)
	>
	<COND
		(<MC-F? ,GL-NOW-LIT?>
			<TELL ,K-TOO-DARK-MSG CR>
			<MC-RFATAL>
		)
		(<NOT <MC-IS? ,GL-PRSO ,FL-READABLE>>
			<RT-HOW-READ-MSG>
			<TELL " to " A ,GL-PRSI "?" CR>
			<RTRUE>
		)
		(<EQUAL? ,GL-WINNER ,CH-PLAYER>
			<RT-NOT-LIKELY-MSG ,GL-PRSI "would appreciate your reading">
			<RTRUE>
		)
		(T
			<TELL "Maybe you ought to do it." CR>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-READ-TO-SWP"
;-----------------------------------------------------------------------------

<ROUTINE V-READ-TO-SWP ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-READ-TO-SWP">
		)
		(T
		)
	>
	<RT-PERFORM ,V?READ-TO ,GL-PRSI ,GL-PRSO>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-REFUSE"
;-----------------------------------------------------------------------------

<ROUTINE V-REFUSE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-REFUSE">
		)
		(T
		)
	>
	<COND
		(<NOT <MC-IS? ,GL-PRSO ,FL-TAKEABLE>>
			<TELL "That would">
			<RT-WASTE-OF-TIME-MSG>
			<RTRUE>
		)
	>
	<TELL "How could you turn down such a tempting " D ,GL-PRSO "?" CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-RELEASE"
;-----------------------------------------------------------------------------

<ROUTINE V-RELEASE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-RELEASE">
		)
		(T
		)
	>
	<COND
		(<IN? ,GL-PRSO ,GL-WINNER>
			<RT-PERFORM ,V?DROP ,GL-PRSO>
			<RTRUE>
		)
		(T
			<COND
				(<MC-PRSO? CH-ME>
					<TELL "You aren't ">
				)
				(T
					<TELL CTHEO>
					<RT-ISNT-ARENT-MSG>
				)
			>
			<TELL "confined by anything." CR>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-REPAIR"
;-----------------------------------------------------------------------------

<ROUTINE V-REPAIR ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-REPAIR">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? CH-ME>
			<TELL "You aren't ">
		)
		(T
			<TELL CTHEO>
			<RT-ISNT-ARENT-MSG>
		)
	>
	<TELL "in need of repair." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-REPLACE"
;-----------------------------------------------------------------------------

<ROUTINE V-REPLACE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-REPLACE">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? CH-ME>
			<TELL "Easily done." CR>
			<RTRUE>
		)
		(T
			<TELL CTHEO " doesn't need replacement." CR>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-REPLY"
;-----------------------------------------------------------------------------

<ROUTINE V-REPLY ("AUX" WHO)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-REPLY">
		)
		(T
		)
	>
	<COND
		(<RT-FOOLISH-TO-TALK-MSG>
			<MC-RFATAL>
		)
	>
	<RT-NO-RESPONSE-MSG>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-RESCUE"
;-----------------------------------------------------------------------------

<ROUTINE V-RESCUE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-RESCUE">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? CH-ME>
			<COND
				(<EQUAL? ,GL-WINNER ,CH-PLAYER>
					<V-ASK-FOR-HELP>
					<RTRUE>
				)
			>
			<TELL ,K-HOW-TO-MSG CR>
			<RTRUE>
		)
	>
	<TELL CTHEO>
	<COND
		(<AND <MC-IS? ,GL-PRSO ,FL-PLURAL>
				<MC-ISNOT? ,GL-PRSO ,FL-COLLECTIVE>
			>
			<TELL " do">
		)
		(T
			<TELL " does">
		)
	>
	<TELL "n't need any help." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-RIDE"
;-----------------------------------------------------------------------------

<ROUTINE V-RIDE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-RIDE">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,GL-PRSO ,FL-ALIVE>
			<RT-NOT-LIKELY-MSG ,GL-PRSO "wants to play piggyback">
			<RTRUE>
		)
		(T
			<TELL "You cannot ride that." CR>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-RING"
;-----------------------------------------------------------------------------

<ROUTINE V-RING ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-RING">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? TH-BELL>
			<COND
				(<RT-ALARM-SET? ,RT-I-SWING-BELL>
					<TELL "The bell is already ringing." CR>
				)
				(T
					<TELL "The bell is too heavy for you to move,
but your effort makes it vibrate softly." CR>
				)
			>
		)
		(T
			<RT-IMPOSSIBLE-MSG>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-RIP"
;-----------------------------------------------------------------------------

<ROUTINE V-RIP ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-RIP">
		)
		(T
		)
	>
	<TELL "That would">
	<RT-WASTE-OF-TIME-MSG>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-ROB"
;-----------------------------------------------------------------------------

<ROUTINE V-ROB ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-ROB">
		)
		(T
		)
	>
	<RT-PERFORM ,V?STEAL ,GL-PRSI ,GL-PRSO>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-ROW"
;-----------------------------------------------------------------------------

<ROUTINE V-ROW ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-ROW">
		)
		(T
		)
	>
	<COND
		(<IN? ,CH-PLAYER ,TH-BOAT>
			<TELL
"You'd have better success if you launched the boat first." CR
			>
		)
		(<MC-PRSO? ,TH-INTDIR>
			<RT-CYOU-MSG "are" "is">
			<TELL "not in a boat." CR>
		)
		(T
			<RT-IMPOSSIBLE-MSG>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-RUB"
;-----------------------------------------------------------------------------

;<ROUTINE V-RUB ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-RUB">
		)
		(T
		)
	>
	<RT-NO-POINT-MSG "Rubbing">
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-RUB-WITH"
;-----------------------------------------------------------------------------

<ROUTINE V-RUB-WITH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-RUB-WITH">
		)
		(T
		)
	>
	<RT-NO-POINT-MSG "Rubbing">
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-SAY"
;-----------------------------------------------------------------------------

<ROUTINE V-SAY ("AUX" WRD)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-SAY">
		)
		(T
		)
	>
	<COND
		(<EQUAL? ,GL-WINNER ,CH-PLAYER>
			<COND
				(<RT-ANYONE-HERE?>
					<SET WRD <GET ,GL-P-NAMW 0>>
					<COND
						(<EQUAL? .WRD ,W?SWORDFISH>
							<RT-PERFORM ,V?SWORDFISH>
						)
						(<EQUAL? .WRD ,W?PARR>
							<RT-PERFORM ,V?PARR>
						)
						(<EQUAL? .WRD ,W?CLEVES>
							<RT-PERFORM ,V?CLEVES>
						)
						(<EQUAL? .WRD ,W?ARAGON>
							<RT-PERFORM ,V?ARAGON>
						)
						(<EQUAL? .WRD ,W?HOWARD>
							<RT-PERFORM ,V?HOWARD>
						)
						(<EQUAL? .WRD ,W?SEYMOUR>
							<RT-PERFORM ,V?SEYMOUR>
						)
						(<EQUAL? .WRD ,W?BOLEYN>
							<RT-PERFORM ,V?BOLEYN>
						)
						(<EQUAL? .WRD ,W?GIN>
							<RT-PERFORM ,V?GIN>
						)
						(T
							<RT-WAY-TO-TALK-MSG>
						)
					>
					<RTRUE>
				)
			>
			<RT-TALK-TO-SELF-MSG>
			<RTRUE>
		)
	>
	<RT-NO-RESPONSE-MSG>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-SCREW"
;-----------------------------------------------------------------------------

<ROUTINE V-SCREW ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-SCREW">
		)
		(T
		)
	>
	<TELL "You cannot screw " THEO " into " THEI "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-SCREW-WITH"
;-----------------------------------------------------------------------------

<ROUTINE V-SCREW-WITH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-SCREW-WITH">
		)
		(T
		)
	>
	<RT-NOT-LIKELY-MSG ,GL-PRSI "could help you do that">
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-SEARCH"
;-----------------------------------------------------------------------------

<ROUTINE V-SEARCH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-SEARCH">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,GL-PRSO ,FL-CONTAINER>
			<COND
				(<AND
					<NOT <MC-IS? ,GL-PRSO ,FL-OPENED>>
					<NOT <MC-IS? ,GL-PRSO ,FL-TRANSPARENT>>
					>
						<RT-YOUD-HAVE-TO-MSG "open" ,GL-PRSO>
						<RTRUE>
				)
				(T
					<TELL "You see ">
					<RT-PRINT-CONTENTS-2 ,GL-PRSO>
					<TELL " inside " THEO "." CR>
				)
			>
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-SURFACE>
			<TELL "You see ">
			<RT-PRINT-CONTENTS-2 ,GL-PRSO>
			<TELL " on " THEO "." CR>
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-PERSON>
			<RT-PERFORM ,V?USE ,GL-PRSO>
			<RTRUE>
		) 
		(T
			<RT-NOTHING-INTERESTING-MSG>
			<TELL "." CR>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-SELL"
;-----------------------------------------------------------------------------

<ROUTINE V-SELL ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-SELL">
		)
		(T
		)
	>
	<COND
		(<NOT <EQUAL? ,GL-WINNER ,CH-PLAYER>>
			<RT-NOT-LIKELY-MSG ,GL-WINNER "is interested in selling anything">
			<RTRUE>
		)
		(<MC-PRSI? GL-PRSO CH-ME GL-WINNER>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
		(<NOT <MC-IS? ,GL-PRSI ,FL-PERSON>>
			<RT-NOT-LIKELY-MSG ,GL-PRSI "would buy anything">
			<RTRUE>
		)
	>
	<RT-YOURE-NOT-A-MSG "salesperson">
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-SELL-SWP"
;-----------------------------------------------------------------------------

<ROUTINE V-SELL-SWP ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-SELL-SWP">
		)
		(T
		)
	>
	<RT-PERFORM ,V?SELL ,GL-PRSI ,GL-PRSO>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-SHAKE"
;-----------------------------------------------------------------------------

<ROUTINE V-SHAKE ("AUX" X)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-SHAKE">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,GL-PRSO ,FL-PERSON>
			<RT-PERFORM ,V?ALARM ,GL-PRSO>
		)
		(<AND
			<NOT <MC-IS? ,GL-PRSO ,FL-TAKEABLE>>
			<NOT <MC-IS? ,GL-PRSO ,FL-TRYTAKE>>
			>
				<RT-NO-POINT-MSG "Shaking">
		)
		(T
			<TELL "That would">
			<RT-WASTE-OF-TIME-MSG>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-SHINE-AT"
;-----------------------------------------------------------------------------

<ROUTINE V-SHINE-AT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-SHINE-AT">
		)
		(T
		)
	>
	<TELL "You cannot illuminate anything with " A ,GL-PRSO "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-SHINE-AT-SWP"
;-----------------------------------------------------------------------------

<ROUTINE V-SHINE-AT-SWP ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-SHINE-AT-SWP">
		)
		(T
		)
	>
	<RT-PERFORM ,V?SHINE-AT ,GL-PRSI ,GL-PRSO>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-SHOOT"
;-----------------------------------------------------------------------------

<ROUTINE V-SHOOT ("AUX" NUM)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-SHOOT">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? TH-GUN>
		  	<TELL "BANG!! The bullet barely misses your foot." CR>
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-PERSON>
			<TELL
"You shoot and kill " THE ,GL-PRSO ". Inspector Lestrade "
			>
			<COND
				(<IN? ,CH-PLAYER ,TH-BOAT>
   				<TELL "pulls up alongside you in a Scotland Yard launch">
				)
				(T
	   			<TELL "appears out of nowhere">
				)
			>
			<TELL " and says,">
			<COND
				(<MC-PRSO? ,CH-HOLMES>
   				<TELL ,K-PLUG-HIM-MYSELF-MSG>
			   )
   			(T
	      		<TELL
" \"You may be on our side, doctor, but killing people is still against the law.
I'm afraid I'm going to have to arrest you.\""
               >
   			)
			>
         <TELL CR CR ,K-LESTRADE-ARRESTS-MSG CR CR>
			<RT-QSR>
		)
		(<MC-PRSO?
				TH-SAPPHIRE
				TH-EMERALD
				TH-OPAL
				TH-RUBY
				TH-TOPAZ
				TH-GARNET
			>
			<REMOVE ,GL-PRSO>
			<TELL "You shoot " THEO ", which shatters and disappears." CR>
		)
		(<MC-PRSO?
				TH-SAPPHIRE-SCRATCH
				TH-EMERALD-SCRATCH
				TH-OPAL-SCRATCH
				TH-RUBY-SCRATCH
				TH-TOPAZ-SCRATCH
				TH-GARNET-SCRATCH
			>
			<TELL
"You shoot " THE <LOC ,GL-PRSO> ", which shatters and disappears." CR
			>
			<REMOVE <LOC ,GL-PRSO>>
		)
		(<MC-PRSO? ,TH-SHAFT ,TH-FIRE ,TH-FIREPLACE>
			<TELL "The bullet disappears into " THEO "." CR>
		)
		(<MC-PRSO? ,TH-INTNUM ,TH-INTDIR>
			<RT-IMPOSSIBLE-MSG>
		)
		(<MC-IS? ,GL-PRSO ,FL-PLURAL>
			<TELL "There are so many of them, you don't know where to begin." CR>
		)
		(<MC-IS? ,GL-PRSO ,FL-MONEY>
			<TELL
"You take aim at " THEO ", but your frugal nature prevents you from going
through with it." CR
			>
		)
		(T
			<SET NUM <GET ,GL-HOLES 0>>
			<PUT ,GL-HOLES <+ <* .NUM 2> 1> ,GL-PRSO>
			<COND
				(<EQUAL? <LOC ,GL-PRSO> ,LOCAL-GLOBALS ,GLOBAL-OBJECTS>
					<PUT ,GL-HOLES <+ <* .NUM 2> 2> ,GL-PLACE-CUR>
				)
			>
			<PUT ,GL-HOLES 0 <+ .NUM 1>>
			<TELL "The bullet puts a neat hole in " THEO "." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-SHOOT-SWP"
;-----------------------------------------------------------------------------

<ROUTINE V-SHOOT-SWP ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-SHOOT-SWP">
		)
		(T
		)
	>
	<RT-PERFORM ,V?SHOOT ,GL-PRSI ,GL-PRSO>
	<RTRUE>
>
	
;-----------------------------------------------------------------------------
; "V-SHOW"
;-----------------------------------------------------------------------------

<ROUTINE V-SHOW ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-SHOW">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,GL-PRSI ,FL-ASLEEP>
			<TELL CTHEI " is in no condition to appreciate " THEO "." CR>
		)
		(<MC-PRSI? CH-ME CH-PLAYER>
			<RT-PERFORM ,V?EXAMINE ,GL-PRSO>
		)
		(T
			<TELL CTHEI " glances at " THEO ", but makes no comment." CR>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-SHOW-SWP"
;-----------------------------------------------------------------------------

<ROUTINE V-SHOW-SWP ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-SHOW-SWP">
		)
		(T
		)
	>
	<RT-PERFORM ,V?SHOW ,GL-PRSI ,GL-PRSO>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-SIT"
;-----------------------------------------------------------------------------

<ROUTINE V-SIT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-SIT">
		)
		(T
		)
	>
	<COND
		(<OR
			<MC-PRSO? ROOMS TH-GROUND TH-FLOOR>
			<MC-IS? ,GL-PRSO ,FL-SURFACE>
			>
				<TELL ,K-NO-RESTING-MSG CR>
		)
		(T
			<RT-IMPOSSIBLE-MSG>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-SMELL"
;-----------------------------------------------------------------------------

<ROUTINE V-SMELL ("AUX" (OBJ <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-SMELL">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? ROOMS TH-SKY>
			<SET OBJ <GETP ,GL-PLACE-CUR ,P?ODOR>>
			<COND
				(<MC-F? .OBJ>
					<TELL "You do not smell anything " <RT-PICK-NEXT ,GL-BORING-TXT> "." CR>
					<RTRUE>
				)
				(T
					<RT-PERFORM ,V?SMELL .OBJ>
					<RTRUE>
				)
			>
		)
		(<MC-PRSO? ,TH-BUNG ,TH-MALMSEY ,TH-MALMSEY-POOL ,TH-BUTT-OF-MALMSEY
						,TH-EMPTY-BUTT-OF-MALMSEY ,TH-GARNET>
				<TELL ,K-EAU-DE-MSG CR>
		)
		(T
			<TELL "It smells just like " A ,GL-PRSO "." CR>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-SMOKE"
;-----------------------------------------------------------------------------

<ROUTINE V-SMOKE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-SMOKE">
		)
		(T
		)
	>
	<RT-CYOU-MSG>
	<TELL "cannot smoke " THEO "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-SPIN"
;-----------------------------------------------------------------------------

<ROUTINE V-SPIN ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-SPIN">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? ROOMS>
			<TELL ,K-DIZZY-MSG CR>
			<RTRUE>
		)
		(T
			<TELL "You cannot spin ">
			<RT-SAY-HIM-HER-THEM-IT-MSG>
			<TELL "." CR>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-SQUEEZE"
;-----------------------------------------------------------------------------

<ROUTINE V-SQUEEZE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-SQUEEZE">
		)
		(T
		)
	>
	<TELL "That would">
	<RT-WASTE-OF-TIME-MSG>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-STAND"
;-----------------------------------------------------------------------------

<ROUTINE V-STAND ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-STAND">
		)
		(T
		)
	>
	<TELL "You are already standing." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-STAND-ON"
;-----------------------------------------------------------------------------

<ROUTINE V-STAND-ON ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-STAND-ON">
		)
		(T
		)
	>
	<TELL "Standing on " THEO " would">
	<RT-WASTE-OF-TIME-MSG>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-STAND-UNDER"
;-----------------------------------------------------------------------------

<ROUTINE V-STAND-UNDER ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-STAND-UNDER">
		)
		(T
		)
	>
	<RT-IMPOSSIBLE-MSG>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-STEAL"
;-----------------------------------------------------------------------------

<ROUTINE V-STEAL ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-STEAL">
		)
		(T
		)
	>
	<TELL ,K-THEFT-MSG CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-STRIKE"
;-----------------------------------------------------------------------------

<ROUTINE V-STRIKE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-STRIKE">
		)
		(T
		)
	>
	<V-HIT>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-SUCK"
;-----------------------------------------------------------------------------

<ROUTINE V-SUCK ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-SUCK">
		)
		(T
		)
	>
	<TELL ,K-PROFANITY-MSG CR>
	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "V-SWIM"
;-----------------------------------------------------------------------------

<ROUTINE V-SWIM ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-SURFACE">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? ROOMS>
			<COND
				(<MC-HERE? ,RM-THE-EMBANKMENT ,RM-SWAN-LANE ,RM-LONDON-BRIDGE>
					<TELL "Yuck! Have you looked at that water?" CR>
				)
				(T
					<TELL ,K-NO-SWIM-MSG CR>
					<RTRUE>
				)
			>
		)
		(<AND
			<MC-PRSO? TH-INTDIR>
			<MC-T? ,GL-P-DIRECTION>
			<EQUAL? ,GL-WINNER ,CH-PLAYER>
			>
				<TELL "You cannot ">
				<PRINTB ,GL-P-PRSA-WORD>
				<TELL " that way from here." CR>
				<RTRUE>
		)
		(T
			<RT-IMPOSSIBLE-MSG>
		)
	> 
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-SWING"
;-----------------------------------------------------------------------------

<ROUTINE V-SWING ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-SWING">
		)
		(T
		)
	>
	<COND
		(<MC-F? ,GL-PRSI>
			<TELL "That would">
			<RT-WASTE-OF-TIME-MSG>
			<RTRUE>
		)
		(T
			<RT-PERFORM ,V?KILL ,GL-PRSI ,GL-PRSO>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-TAKE"
;-----------------------------------------------------------------------------

<ROUTINE V-TAKE ("AUX" L)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-TAKE">
		)
		(T
		)
	>
	<COND
		(<EQUAL? ,GLOBAL-OBJECTS <LOC ,GL-PRSO> <LOC ,GL-PRSI>>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-WORN>
			<RT-PERFORM ,V?TAKE-OFF ,GL-PRSO>
			<RTRUE>
		)
	>
	<SET L <RT-ITAKE>>
	<COND
		(<MC-T? .L>
			<COND
				(<MC-T? ,GL-P-MULT?>
					<TELL "Taken." CR>
				)
				(<OR
					<MC-IS? .L ,FL-CONTAINER>
					<MC-IS? .L ,FL-SURFACE>
					<MC-IS? .L ,FL-PERSON>
					<MC-IS? .L ,FL-ALIVE>
					>
						<RT-CYOU-MSG "take" "takes">
						<TELL THEO>
						<RT-OUT-OFF-MSG .L>
						<TELL THE .L "." CR>
				)
				(T
					<RT-CYOU-MSG "take" "takes">
					<TELL THEO "." CR>
				)
			>
			<SET L <GETP ,GL-PRSO ,P?VALUE>>
			<COND
				(<MC-T? .L>
					<PUTP ,GL-PRSO ,P?VALUE 0>
					<RT-UPDATE-SCORE .L>
					<RT-UPDATE-STATUS-LINE>
				)
			>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-TAKE-OFF"
;-----------------------------------------------------------------------------

<ROUTINE V-TAKE-OFF ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-TAKE-OFF">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? TH-CLOTHES TH-FEET>
			<TELL ,K-INAPPROPRIATE-MSG CR>
			<RTRUE>
		)
		(<MC-IS? ,GL-PRSO ,FL-TAKEABLE>
			<COND
				(<AND
					<IN? ,GL-PRSO ,GL-WINNER>
					<MC-IS? ,GL-PRSO ,FL-WORN>
					>
					<MC-UNMAKE ,GL-PRSO ,FL-WORN>
					<TELL "You take off " THEO "." CR>
					<COND
						(<AND <MC-PRSO? ,TH-WATSONS-HAT>
								<RT-VISIBLE? ,CH-AKBAR>
							>
							<TELL
CR "Akbar averts his gaze, disconcerted by your sacreligious action." CR
							>
						)
					>
					<RTRUE>
				)
				(T
					<RT-PERFORM ,V?TAKE ,GL-PRSO>
					<RTRUE>
				)
			>
		)
		(<MC-IS? ,GL-PRSO ,FL-VEHICLE>
			<RT-PERFORM ,V?EXIT ,GL-PRSO>
			<RTRUE>
		)
		(T
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-TAKE-WITH"
;-----------------------------------------------------------------------------

<ROUTINE V-TAKE-WITH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-TAKE-WITH">
		)
		(T
		)
	>
	<TELL ,K-HOW-TO-MSG CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-TASTE"
;-----------------------------------------------------------------------------

<ROUTINE V-TASTE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-TASTE">
		)
		(T
		)
	>
	<RT-PERFORM ,V?EAT ,GL-PRSO>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-TELL"
;-----------------------------------------------------------------------------

<ROUTINE V-TELL ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-TELL">
		)
		(T
		)
	>
	<COND
		(<RT-FOOLISH-TO-TALK-MSG>
			<MC-RFATAL>
		)
		(<MC-PRSO? CH-ME>
			<COND
				(<EQUAL? ,GL-WINNER ,CH-PLAYER>
					<RT-TALK-TO-SELF-MSG>
					<RTRUE>
				)
				(T
					<RT-NO-RESPONSE-MSG>
					<RTRUE>
				)
			>
		)
		(T
			<SETG GL-P-QCONTEXT-TH ,GL-PRSO>
			<SETG GL-P-QCONTEXT-RM <LOC ,GL-PRSO>>
			<COND
				(<MC-T? ,GL-P-CONT>
					<SETG GL-WINNER ,GL-PRSO>
					<RT-THIS-IS-IT ,GL-PRSO>
					<SETG GL-CLOCK-WAIT T>
					<RTRUE>
				)
				(T
					<RT-NO-RESPONSE-MSG>
					<RTRUE>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-TELL-ABOUT"
;-----------------------------------------------------------------------------

<ROUTINE V-TELL-ABOUT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-TELL-ABOUT">
		)
		(T
		)
	>
	<COND
		(<RT-WHO-WHAT-WHERE-MSG>
			<MC-RFATAL>
		)
		(T
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-TELL-WHO"
;-----------------------------------------------------------------------------

<ROUTINE V-TELL-WHO ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-TELL-WHO">
		)
		(T
		)
	>
	<TELL "You must use TELL ME ABOUT SOMETHING or TELL CHARACTER ABOUT SOMETHING." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-THANK"
;-----------------------------------------------------------------------------

<ROUTINE V-THANK ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-THANK">
		)
		(T
		)
	>
	<COND
		(<MC-F? <RT-ANYONE-HERE?>>
			<TELL "[There's nobody here to thank.]" CR>
			<RTRUE>
		)
		(<EQUAL? ,GL-WINNER ,CH-PLAYER>
			<COND
				(<MC-PRSO? CH-ME>
					<TELL "Patting yourself on the back" ,K-WONT-HELP-MSG CR>
					<RTRUE>
				)
				(<MC-IS? ,GL-PRSO ,FL-ASLEEP>
					<TELL CTHEO " isn't in any condition to accept your thanks." CR>
				)
				(T
					<TELL "\"You're welcome.\"" CR>
					<RTRUE>
				)
			>
		)
		(T
			<RT-FOOLISH-TO-TALK-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-THROUGH"
;-----------------------------------------------------------------------------

<ROUTINE V-THROUGH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-THROUGH">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? ROOMS>
			<RT-DO-WALK ,P?IN>
			<RTRUE>
		)
		(T
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-THROW"
;-----------------------------------------------------------------------------

<ROUTINE V-THROW ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-THROW">
		)
		(T
		)
	>
	<COND
		(<AND <MC-VERB-WORD? PUT>
				<MC-PRSO? TH-HANDS TH-FOOT TH-FEET>
			>
			<COND
				(<MC-IS? ,GL-PRSI ,FL-DOOR>
					<COND
						(<MC-IS? ,GL-PRSI ,FL-OPENED>
							<RT-CYOU-MSG "put" "puts">
							<TELL
THEO " through " THEI ", but can't reach anything on the other side." CR
							>
						)
						(T
							<TELL CTHEI " is closed." CR>
						)
					>
				)
				(T
					<RT-IMPOSSIBLE-MSG>
				)
			>
		)
		(<IN? ,GL-PRSO ,GLOBAL-OBJECTS>
			<RT-IMPOSSIBLE-MSG>
		)
		(<RT-IDROP-MSG>
			<COND
				(<AND <MC-IS? ,CH-HOLMES ,FL-ASLEEP>
						<MC-PRSI? ,CH-HOLMES ,TH-PHIAL, TH-SYRINGE ,TH-MOROCCO-CASE>
					>
					<COND
						(<MC-PRSO? TH-KNIFE>
							<COND
								(<MC-PRSI? ,CH-HOLMES>
									<TELL "Holmes absentmindedly dodges the knife">
								)
								(<MC-PRSI? ,TH-PHIAL ,TH-SYRINGE ,TH-MOROCCO-CASE>
									<TELL "Holmes casually moves " THEI " out of
harm's way"						
									>
								)
							>
							<TELL " and resumes staring at the phial." CR>
							<RTRUE>
						)
						(T
							<TELL "Holmes absentmindedly catches " THEO " with his
free hand and bops you over the head with it before letting it fall to the
ground. He then resumes staring at the phial." CR
							>
							<RTRUE>
						)
					>
				)
			>
			<TELL CTHEO " misses " THEI " by a mile and lands on the ">
			<COND
				(<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
					<TELL D ,TH-FLOOR>
				)
				(T
					<TELL D ,TH-GROUND>
				)
			>
			<TELL " nearby." CR>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-THROW-SWP"
;-----------------------------------------------------------------------------

<ROUTINE V-THROW-SWP ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-THROW-SWP">
		)
		(T
		)
	>
	<RT-PERFORM ,V?THROW ,GL-PRSI ,GL-PRSO>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-THROW-OVER"
;-----------------------------------------------------------------------------

<ROUTINE V-THROW-OVER ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-THROW-OVER">
		)
		(T
		)
	>
	<TELL "That would">
	<RT-WASTE-OF-TIME-MSG>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-TIE"
;-----------------------------------------------------------------------------

<ROUTINE V-TIE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-TIE">
		)
		(T
		)
	>
	<RT-CYOU-MSG>
	<TELL "cannot possibly tie " THEO>
	<COND
		(<MC-T? ,GL-PRSI>
			<TELL " to " THEI>
		)
	>
	<TELL "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-TIE-UP"
;-----------------------------------------------------------------------------

<ROUTINE V-TIE-UP ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-TIE-UP">
		)
		(T
		)
	>
	<RT-CYOU-MSG>
	<TELL "cannot tie up ">
	<COND
		(<MC-PRSI? <> ,ROOMS>
			<TELL "that">
		)
		(T
			<TELL "anything with " THEI>
		)
	>
	<TELL "." CR>
>


;-----------------------------------------------------------------------------
; "V-TIP"
;-----------------------------------------------------------------------------

<ROUTINE V-TIP ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-TIP">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,GL-PRSO ,FL-PERSON>
			<RT-CYOU-MSG "whisper" "whispers">
			<TELL "confidentially, \"Buy low, sell high.\"" CR CR
CTHEO " does not look impressed." CR
			>
			<RTRUE>
		)
		(T
			<RT-CYOU-MSG>
			<TELL "can't do that." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-TOUCH"
;-----------------------------------------------------------------------------

<ROUTINE V-TOUCH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-TOUCH">
		)
		(T
		)
	>
	<RT-NO-POINT-MSG "Fiddling with">
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-TOUCH-TO"
;-----------------------------------------------------------------------------

<ROUTINE V-TOUCH-TO ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-TOUCH-TO">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? TH-HANDS>
			<RT-PERFORM ,V?TOUCH ,GL-PRSI>
			<RTRUE>
		)
	>
	<RT-CYOU-MSG "put" "puts">
	<TELL THEO " next to " THEI ", but nothing " <RT-PICK-NEXT ,GL-BORING-TXT> " happens." CR>
	<RTRUE>
>	 

;-----------------------------------------------------------------------------
; "V-TOUCH-TO-SWP"
;-----------------------------------------------------------------------------

<ROUTINE V-TOUCH-TO-SWP ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-TOUCH-TO-SWP">
		)
		(T
		)
	>
	<RT-PERFORM ,V?TOUCH-TO ,GL-PRSI ,GL-PRSO>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-TRANSLATE"
;-----------------------------------------------------------------------------

<ROUTINE V-TRANSLATE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-TRANSLATE">
		)
		(T
		)
	>
	<TELL ,K-HOW-TO-MSG CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-TUNE-TO"
;-----------------------------------------------------------------------------

<ROUTINE V-TUNE-TO ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-TUNE-TO">
		)
		(T
		)
	>
	<RT-IMPOSSIBLE-MSG>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-TURN"
;-----------------------------------------------------------------------------

<ROUTINE V-TURN ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-TURN">
		)
		(T
		)
	>
	<COND
		(<AND
			<MC-ISNOT? ,GL-PRSO ,FL-TAKEABLE>
			<MC-ISNOT? ,GL-PRSO ,FL-TRYTAKE>
			>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
		(T
			<RT-NO-POINT-MSG "Turning">
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-TURN-DOWN"
;-----------------------------------------------------------------------------

<ROUTINE V-TURN-DOWN ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-TURN-DOWN">
		)
		(T
		)
	>
	<V-REFUSE>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-TURN-TO"
;-----------------------------------------------------------------------------

<ROUTINE V-TURN-TO ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-TURN-TO">
		)
		(T
		)
	>
	<COND
		(<RT-VISIBLE? ,GL-PRSO>
			<RT-PERFORM ,V?WATCH ,GL-PRSO>
			<RTRUE>
		)
		(T
			<RT-CYOU-MSG "do not" "does not">
			<TELL "see " THEO "." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-TURN-UP"
;-----------------------------------------------------------------------------

<ROUTINE V-TURN-UP ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-TURN-UP">
		)
		(T
		)
	>
	<V-LOOK-UNDER>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-UNDRESS"
;-----------------------------------------------------------------------------

<ROUTINE V-UNDRESS ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-UNDRESS">
		)
		(T
		)
	>
	<COND
		(<OR
			<MC-PRSO? ROOMS>
			<MC-IS? ,GL-PRSO ,FL-PERSON>
			>
			<TELL ,K-INAPPROPRIATE-MSG CR>
			<RTRUE>
		)
		(T
			<RT-CYOU-MSG>
			<TELL "cannot undress " A ,GL-PRSO "." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-UNFOLD"
;-----------------------------------------------------------------------------

<ROUTINE V-UNFOLD ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-UNFOLD">
		)
		(T
		)
	>
	<TELL CTHEO>
	<RT-ISNT-ARENT-MSG>
	<TELL "folded up." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-UNLOCK"
;-----------------------------------------------------------------------------

<ROUTINE V-UNLOCK ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-UNLOCK">
		)
		(T
		)
	>
	<COND
		(<OR
			<MC-IS? ,GL-PRSO ,FL-OPENABLE>
			<MC-IS? ,GL-PRSO ,FL-CONTAINER>
			>
				<COND
					(<OR
						<MC-IS? ,GL-PRSO ,FL-OPENED>
						<NOT <MC-IS? ,GL-PRSO ,FL-LOCKED>>
						>
							<TELL CTHEO>
							<RT-ISNT-ARENT-MSG>
							<TELL "locked." CR>
							<RTRUE>
					)
					(T
						<RT-THING-WONT-LOCK-MSG ,GL-PRSI ,GL-PRSO T>
						<RTRUE>
					)
				>
		)
		(T
			<RT-CANT-LOCK-MSG T>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-UNPLUG"
;-----------------------------------------------------------------------------

<ROUTINE V-UNPLUG ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-UNPLUG">
		)
		(T
		)
	>
	<TELL CTHEO>
	<RT-ISNT-ARENT-MSG>
	<TELL "connected to ">
	<COND
		(<MC-T? ,GL-PRSI>
			<TELL THEI>
		)
		(T
			<TELL "anything">
		)
	>
	<TELL "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-UNSCREW"
;-----------------------------------------------------------------------------

<ROUTINE V-UNSCREW ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-UNSCREW">
		)
		(T
		)
	>
	<RT-CYOU-MSG>
	<TELL "cannot unscrew " THEO>
	<COND
		(<NOT <MC-PRSI? TH-HANDS>>
			<TELL ", with or without " THEI>
		)
	>
	<TELL "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-UNSCREW-FROM"
;-----------------------------------------------------------------------------

<ROUTINE V-UNSCREW-FROM ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-UNSCREW-FROM">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? GL-PRSI>
			<RT-IMPOSSIBLE-MSG>
			<RTRUE>
		)
		(<NOT <IN? ,GL-PRSO ,GL-PRSI>>
			<COND
				(<MC-IS? ,GL-PRSI ,FL-ALIVE>
					<TELL CTHEI " does not have " THEO "." CR>
					<RTRUE>
				)
			>
			<TELL CTHEO>
			<RT-ISNT-ARENT-MSG>
			<RT-IN-ON-MSG ,GL-PRSI <>>
			<TELL THEI "." CR>
			<RTRUE>
		)
		(T
			<RT-CYOU-MSG>
			<TELL "cannot unscrew " THEO "." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-UNTIE"
;-----------------------------------------------------------------------------

<ROUTINE V-UNTIE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-UNTIE">
		)
		(T
		)
	>
	<RT-CYOU-MSG>
	<TELL "cannot untie " A ,GL-PRSO "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-USE"
;-----------------------------------------------------------------------------

<ROUTINE V-USE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-USE">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,GL-PRSO ,FL-PERSON>
			<TELL CTHEO " might resent that." CR>
			<RTRUE>
		)
		(T
			<TELL "[You must specify what you want to do with " THEO ".]" CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-USE-ON"
;-----------------------------------------------------------------------------

<ROUTINE V-USE-ON ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-USE-ON">
		)
		(T
		)
	>
	<TELL "Using " THEO " on " THEI " would">
	<RT-WASTE-OF-TIME-MSG>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-WAIT"
;-----------------------------------------------------------------------------

<ROUTINE V-WAIT ("AUX" H M S N)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-WAIT">
		)
		(T
		)
	>
	<COND
		(<EQUAL? ,GL-P-NUMBER -1>
			<SET N 1>
		)
		(T
			<SET N ,GL-P-NUMBER>
		)
	>
	<COND
		(<MC-PRSO? ,TH-MINUTE>
			<SET H 0>
			<SET M .N>
		)
		(<MC-PRSO? ,TH-HOUR>
			<SET H .N>
			<SET M 0>
		)
		(<MC-PRSO? ,TH-INTNUM>
			<SET H 0>
			<SET M .N>
			<TELL "[" N .M " minute">
			<COND
				(<NOT <EQUAL? .M 1>>
					<TELL "s">
				)
			>
			<TELL "]" CR CR>
		)
		(<NOT <MC-PRSO? ,ROOMS>>
			<RT-CYOU-MSG>
			<TELL "can't wait for that." CR>
			<RTRUE>
		)
		(T
			<SET H 0>
			<SET M 10>
		)
	>
	<SET S 0>
	<TELL "Time passes..." CR>
	<RT-CLOCK-JMP .H .M .S>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-WAIT-FOR"
;-----------------------------------------------------------------------------

;<ROUTINE V-WAIT-FOR ("AUX" H M S)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-WAIT-FOR">
		)
		(T
		)
	>
	<COND
		(<MC-F? ,GL-P-TIME-FLAG>
			<RT-CYOU-MSG>
			<TELL "can't wait for that." CR>
			<RTRUE>
		)
		(T
			<SET H <GET ,GL-P-TIME ,K-HRS>>
			<SET M <GET ,GL-P-TIME ,K-MIN>>
			<SET S <GET ,GL-P-TIME ,K-SEC>>
			<COND
				(<G? .H 12>
					; "24 hour notation"
					<COND
						(<EQUAL? <RT-CLOCK-CMP .H .M .S> 1>
							<TELL "That time is already past." CR>
							<RTRUE>
						)
					>
					<SET H <- <GET ,GL-TIME ,K-HRS> .H>>
					<SET M <- <GET ,GL-TIME ,K-MIN> .M>>
					<SET S <- <GET ,GL-TIME ,K-SEC> .S>>
				)
				(T
					; "12 hour notation"
					<COND
						(<OR	<EQUAL? <RT-CLOCK-CMP .H .M .S> 1>
								<EQUAL? <RT-CLOCK-CMP <+ .H 12> .M .S> 1>
							>
							<TELL "That time is already past." CR>
							<RTRUE>
						)
					>
					<SET H <- <+ <MOD <- <GET ,GL-TIME ,K-HRS> 1> 12> 1> .H>>
					<SET M <- <GET ,GL-TIME ,K-MIN> .M>>
					<SET S <- <GET ,GL-TIME ,K-SEC> .S>>
				)
			>
			<TELL "Time passes..." CR>
			<RT-CLOCK-JMP .H .M .S>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-WALK"
;-----------------------------------------------------------------------------

<ROUTINE V-WALK ("AUX" PT PTS STR OBJ RM)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-WALK">
		)
		(T
		)
	>
	<SET PT <GETPT ,GL-PLACE-CUR ,GL-PRSO>>
	<COND
		(<MC-F? ,GL-P-WALK-DIR>
			<TELL "[You must specify a direction.]" CR>
		)
		(<MC-T? .PT>
			<SET PTS <PTSIZE .PT>>
			<COND
				(<EQUAL? .PTS ,K-UEXIT>
					<SET RM <MC-GET-RM-EXIT-DEST .PT>>
					<RT-GOTO .RM>
					<RTRUE>
				)
				(<EQUAL? .PTS ,K-NEXIT>
					<SET STR <GET .PT ,K-NEXITSTR>>
					<TELL .STR CR>
					<MC-RFATAL>
				)
				(<EQUAL? .PTS ,K-PEXIT>
					<SET RM <APPLY <GET .PT ,K-PEXITRTN>>>
					<COND
						(<MC-T? .RM>
							<RT-GOTO .RM>
							<RTRUE>
						)
						(T
							<MC-RFATAL>
						)
					>
				)
				(<EQUAL? .PTS ,K-CEXIT>
					<COND
						(<VALUE <GETB .PT ,K-CEXITFLG>>
							<SET RM <MC-GET-RM-EXIT-DEST .PT>>
							<RT-GOTO .RM>
							<RTRUE>
						)
					>
					<SET STR <GET .PT ,K-CEXITSTR>>
					<COND
						(<MC-T? .STR>
							<TELL .STR CR>
							<MC-RFATAL>
						)
						(T
							<RT-CYOU-MSG>
							<TELL "cannot go that way." CR>
							<MC-RFATAL>
						)
					>
				)
				(<EQUAL? .PTS ,K-DEXIT>
					<SET OBJ <MC-GET-RM-EXIT-DOOR .PT>>
					<SET STR <GET .PT ,K-DEXITSTR>>
					<COND
						(<MC-IS? .OBJ ,FL-OPENED>
							<SET RM <MC-GET-RM-EXIT-DEST .PT>>
							<RT-GOTO .RM>
							<RTRUE>
						)
						(<MC-T? .STR>
							<TELL .STR " (" D .OBJ ")." CR>
							<MC-RFATAL>
						)
						(T
							<TELL "The door is not open." CR>
							<MC-RFATAL>
						)
					>
				)
			>
		)
		(<AND
			 <EQUAL? ,GL-P-WALK-DIR ,P?OUT>
			 <MC-ISNOT? ,GL-PLACE-CUR ,FL-INDOORS>
			 >
				<RT-CYOU-MSG "are" "is">
				<TELL "already outside." CR>
				<MC-RFATAL>
		)
		(<AND
			 <EQUAL? ,GL-P-WALK-DIR ,P?IN>
			 <MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
			 >
				<RT-CYOU-MSG "are" "is">
				<TELL "already inside." CR>
				<MC-RFATAL>
		)
		(T
			<TELL "You cannot go that way." CR>
			<MC-RFATAL>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-WALK-AROUND"
;-----------------------------------------------------------------------------

<ROUTINE V-WALK-AROUND ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-WALK-AROUND">
		)
		(T
		)
	>
	<TELL "[Which way do you want to go?]" CR>
	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "V-WALK-TO"
;-----------------------------------------------------------------------------

<ROUTINE V-WALK-TO ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-WALK-TO">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? TH-INTDIR>
			<RT-DO-WALK ,GL-P-DIRECTION>
			<RTRUE>
		)
		(<MC-PRSO? TH-RIGHT TH-LEFT>
			<TELL ,K-BE-MORE-SPECIFIC-MSG CR>
			<RTRUE>
		)
		(T
			<V-FOLLOW>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-WATCH"
;-----------------------------------------------------------------------------

<ROUTINE V-WATCH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-WATCH">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,GL-PRSO ,FL-PERSON>
			<TELL CTHEO>
			<RT-ISNT-ARENT-MSG>
			<TELL "doing anything " <RT-PICK-NEXT ,GL-BORING-TXT>>
		)
		(T
			<TELL "Nothing " <RT-PICK-NEXT ,GL-BORING-TXT> " is happening">
		)
	>
	<TELL "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-WAVE-AT"
;-----------------------------------------------------------------------------

<ROUTINE V-WAVE-AT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-WAVE-AT">
		)
		(T
		)
	>
	<COND
		(<RT-WHO-WHAT-WHERE-MSG>
			<MC-RFATAL>
		)
		(T
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-WEAR"
;-----------------------------------------------------------------------------

<ROUTINE V-WEAR ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-WEAR">
		)
		(T
		)
	>
	<COND
		(<OR	<AND
					<IN? ,GL-PRSO ,GL-WINNER>
					<MC-IS? ,GL-PRSO ,FL-WORN>
				>
				<MC-PRSO? TH-CLOTHES>
			>
			<RT-CYOU-MSG "are" "is">
			<TELL "already wearing " THEO "." CR>
			<RTRUE>
		)
		(<MC-ISNOT? ,GL-PRSO ,FL-CLOTHING>
			<RT-CYOU-MSG>
			<TELL "cannot wear " THEO "." CR>
			<RTRUE>
		)
		(<RT-DONT-HAVE-MSG ,GL-PRSO>
			<RTRUE>
		)
		(T
			<MC-MAKE ,GL-PRSO ,FL-WORN>
			<RT-CYOU-MSG "put" "puts">
			<TELL "on " THEO "." CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-WEDGE"
;-----------------------------------------------------------------------------

<ROUTINE V-WEDGE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-WEDGE">
		)
		(T
		)
	>
	<RT-PERFORM ,V?LOOSEN ,GL-PRSI ,GL-PRSO>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-WEIGH"
;-----------------------------------------------------------------------------

<ROUTINE V-WEIGH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-WEIGH">
		)
		(T
		)
	>
	<TELL "You haven't got any scales to weigh things with." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-WHAT"
;-----------------------------------------------------------------------------

<ROUTINE V-WHAT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-WHAT">
		)
		(T
		)
	>
	<COND
		(<RT-WHO-WHAT-WHERE-MSG>
			<MC-RFATAL>
		)
		(T
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-WHERE"
;-----------------------------------------------------------------------------

<ROUTINE V-WHERE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-WHERE">
		)
		(T
		)
	>
	<COND
		(<RT-WHO-WHAT-WHERE-MSG>
			<MC-RFATAL>
		)
		(T
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-WHO"
;-----------------------------------------------------------------------------

<ROUTINE V-WHO ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-WHO">
		)
		(T
		)
	>
	<COND
		(<RT-WHO-WHAT-WHERE-MSG>
			<MC-RFATAL>
		)
		(T
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "V-WIND"
;-----------------------------------------------------------------------------

<ROUTINE V-WIND ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-WIND">
		)
		(T
		)
	>
	<RT-CYOU-MSG>
	<TELL "cannot wind " A ,GL-PRSO "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-WRAP-AROUND"
;-----------------------------------------------------------------------------

<ROUTINE V-WRAP-AROUND ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-WRAP-AROUND">
		)
		(T
		)
	>
	<RT-CYOU-MSG>
	<TELL "could not possibly ">
	<PRINTB ,GL-P-PRSA-WORD>
	<TELL " " THEO " around " THEI "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-WRAP-AROUND-SWP"
;-----------------------------------------------------------------------------

<ROUTINE V-WRAP-AROUND-SWP ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-WRAP-AROUND-SWP">
		)
		(T
		)
	>
	<RT-PERFORM ,V?WRAP-AROUND ,GL-PRSI ,GL-PRSO>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "V-YELL"
;-----------------------------------------------------------------------------

<ROUTINE V-YELL ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-YELL">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? ROOMS>
			<COND
				(<EQUAL? ,GL-P-PRSA-WORD ,W?CRY>
					<TELL
"Awww. Don't cry. You'll figure it out eventually." CR 
					>
					<RTRUE>
				)
				(T
					<TELL
"The idea of the primal scream as a technique to relieve
anxiety will not be discovered for eighty years. But if it makes you
feel better, go right ahead." CR 
					>
					<RTRUE>
				)
			>
		)
		(T
			<RT-NOT-LIKELY-MSG ,GL-PRSO "would respond">
			<RTRUE>
		)
	>
>

;*****************************************************************************
; "CONSTANTS"
;*****************************************************************************

<CONSTANT K-BETTER-SUCCESS-MSG
"You'd have better success if you launched the boat first."
>


;*****************************************************************************
; "end of file"
;*****************************************************************************

