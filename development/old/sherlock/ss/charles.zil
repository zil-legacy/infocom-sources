;*****************************************************************************
; "game : SHERLOCK!"
; "file : CHARLES.ZIL"
; "auth :   $Author:   RAB  $"
; "date :     $Date:   28 Oct 1987 19:34:20  $"
; "rev  : $Revision:   1.76  $"
; "vers : 1.00"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "TH-WAX-HEAD commented out of THINGS1.ZIL"
; "TH-WAX-AX commented out of THINGS1.ZIL"
; "TH-EMERALD commented out of THINGS1.ZIL"
; "TH-TORCH commented out of THINGS1.ZIL"
; "TH-TOBACCO commented out of THINGS1.ZIL"
;-----------------------------------------------------------------------------
; "RT-AC-TH-MATCH commented out of THINGS2.ZIL"
; "RT-AC-TH-TORCH commented out of THINGS2.ZIL"
; "RT-AC-TH-TOBACCO commented out of THINGS2.ZIL"
; "RT-AC-TH-PIPE commented out of THINGS2.ZIL"
; "RT-AC-TH-MAIL commented out of THINGS2.ZIL"
; "RT-AC-TH-NEWSPAPER commented out of THINGS2.ZIL"
; "RT-AC-TH-WESTMINSTER-CLUE commented out of THINGS2.ZIL"
;-----------------------------------------------------------------------------
; "RT-DF-TH-MAIL commented out of THINGS3.ZIL"
; "RT-DF-TH-NEWSPAPER commented out of THINGS3.ZIL"
; "RT-DF-TH-WESTMINSTER-CLUE commented out of THINGS3.ZIL"
; "RT-DF-TH-TOBACCO commented out of THINGS3.ZIL"
; "RT-DF-TH-PIPE commented out of THINGS3.ZIL"
; "RT-DF-TH-MATCH commented out of THINGS3.ZIL"
; "RT-DF-TH-TORCH commented out of THINGS3.ZIL"
;-----------------------------------------------------------------------------

;*****************************************************************************
; "THINGS1.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "TH-WAX-POOL"
;-----------------------------------------------------------------------------

<OBJECT TH-WAX-POOL
   (DESC "pool of wax")
   (FLAGS FL-OPENED FL-TRANSPARENT FL-CONTAINER)
   (SYNONYM POOL WAX)
   (ADJECTIVE POOL WAX)
   (SIZE 1)
   (CAPACITY 1)
	(MASS 1)
	(GENERIC RT-GN-WAX)
   (DESCFCN RT-DF-TH-WAX-POOL)
>

;-----------------------------------------------------------------------------
; "TH-WAX-HEAD"
;-----------------------------------------------------------------------------

<OBJECT TH-WAX-HEAD
   (LOC TH-CHARLES-STATUE)
   (DESC "wax head")
   (FLAGS FL-TAKEABLE FL-TRYTAKE FL-NODESC FL-NOALL)
   (SYNONYM WAX HEAD)
   (ADJECTIVE WAX HEAD)
   (SIZE 1)
   (CAPACITY 1)
	(GENERIC RT-GN-WAX)
   (ACTION RT-AC-TH-WAX-HEAD)
>

;-----------------------------------------------------------------------------
; "TH-WAX-AX"
;-----------------------------------------------------------------------------

<OBJECT TH-WAX-AX
   (LOC TH-CHARLES-STATUE)
   (DESC "axe")
   (FLAGS FL-TAKEABLE FL-VOWEL FL-NODESC FL-NOALL FL-WEAPON)
   (SYNONYM AX AXE BLADE WAX)
   (ADJECTIVE WAX)
   (SIZE 12)
	(GENERIC RT-GN-WAX)
>

;-----------------------------------------------------------------------------
; "TH-MELTED-AX"
;-----------------------------------------------------------------------------

<OBJECT TH-MELTED-AX
   (DESC "melted axe")
   (FLAGS FL-OPENED FL-TRANSPARENT FL-CONTAINER)
   (SYNONYM AXE AX WAX)
   (ADJECTIVE MELTED WAX)
   (SIZE 1)
   (CAPACITY 1)
	(MASS 1)
	(GENERIC RT-GN-WAX)
   (DESCFCN RT-DF-TH-MELTED-AX)
>

;-----------------------------------------------------------------------------
; "TH-EMERALD"
;-----------------------------------------------------------------------------

<OBJECT TH-EMERALD
   (LOC TH-WAX-POOL)
   (DESC "emerald")
   (FLAGS FL-READABLE FL-TAKEABLE FL-VOWEL FL-SURFACE FL-MONEY)
   (SYNONYM EMERALD GEM GEMS)
   (ADJECTIVE GREEN EMERALD)
   (VALUE 5)
   (SIZE 1)
   (MASS 1)
   (CAPACITY 1)
	(GENERIC RT-GN-GEM)
   (ACTION RT-AC-TH-EMERALD)
   (DESCFCN RT-DF-TH-EMERALD)
>

;-----------------------------------------------------------------------------
; "TH-TORCH"
;-----------------------------------------------------------------------------

<OBJECT TH-TORCH
   (LOC TH-FAWKES-STATUE)
   (DESC "torch")
   (FLAGS FL-BURNABLE FL-TAKEABLE FL-NODESC FL-NOALL)
   (SYNONYM TORCH)
   (SIZE 1)
   (ACTION RT-AC-TH-TORCH)
   (DESCFCN RT-DF-TH-TORCH)
>

;-----------------------------------------------------------------------------
; "TH-BURNT-TORCH"
;-----------------------------------------------------------------------------

<OBJECT TH-BURNT-TORCH
   (DESC "burnt torch")
   (FLAGS FL-TAKEABLE)
   (SYNONYM TORCH)
	(ADJECTIVE BURNT)
   (SIZE 1)
>

;-----------------------------------------------------------------------------
; "TH-BURNT-MATCH"
;-----------------------------------------------------------------------------

<OBJECT TH-BURNT-MATCH
   (DESC "burnt match")
   (FLAGS FL-TAKEABLE)
   (SYNONYM MATCH)
	(ADJECTIVE BURNT)
   (SIZE 1)
   (ACTION RT-AC-TH-BURNT-MATCH)
>

;-----------------------------------------------------------------------------
; "TH-TOBACCO"
;-----------------------------------------------------------------------------

<OBJECT TH-TOBACCO
   (LOC TH-PERSIAN-SLIPPER)
   (DESC "tobacco")
   (FLAGS FL-TAKEABLE FL-BURNABLE FL-PLURAL FL-COLLECTIVE FL-NOALL)
   (SYNONYM TOBACCO SHAG)
	(ADJECTIVE SHAG)
   (VALUE 1)
   (SIZE 1)
   (ACTION RT-AC-TH-TOBACCO)
   (DESCFCN RT-DF-TH-TOBACCO)
>

;*****************************************************************************
; "THINGS2.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-AC-TH-MATCH"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-MATCH ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-MATCH">
		)
		(T
		)
	>
	<COND
		(<AND <MC-VERB? LIGHT-WITH BURN-WITH STRIKE>
				<MC-PRSO? ,TH-MATCH>
			>
			<COND
				(<MC-IS? ,TH-MATCH ,FL-LIGHTED>
					<TELL CTHEO " is already lit." CR>
				)
				(<MC-ISNOT? ,TH-MATCH ,FL-BURNABLE>
					<TELL CTHEO " is burned out." CR>
				)
				(<OR <MC-PRSI? ,TH-HANDS>
					  <AND <MC-IS? ,GL-PRSI ,FL-LIGHTED>
							 <MC-IS? ,GL-PRSI ,FL-BURNABLE>
					  >
					>
					<MC-MAKE ,TH-MATCH ,FL-LIGHTED>
					<RT-ALARM-SET-REL ,RT-I-MATCH-OUT <RT-PARM-SET 0 2 0>>
					<MOVE ,TH-MATCH ,GL-WINNER>
					<TELL CTHEO " flares to life." CR>
				)
			>
		)
		(<MC-VERB? LAMP-OFF>
			<COND
				(<MC-ISNOT? ,TH-MATCH ,FL-LIGHTED>
					<TELL CTHEO " isn't lit." CR>
				)
				(T
					<MC-UNMAKE ,TH-MATCH ,FL-LIGHTED>
					<MC-UNMAKE ,TH-MATCH ,FL-BURNABLE>
					<MOVE ,TH-BURNT-MATCH <LOC ,TH-MATCH>>
					<REMOVE ,TH-MATCH>
					<RT-ALARM-CLR ,RT-I-MATCH-OUT>
					<RT-CYOU-MSG "blow" "blows">
					<TELL "out the match." CR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-BURNT-MATCH"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-BURNT-MATCH ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-BURNT-MATCH">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? LAMP-OFF>
			<TELL CTHEO " is already burned out." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-TORCH"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-TORCH ("OPTIONAL" (CONTEXT <>) "AUX" WHO)
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-TORCH">
		)
		(T
		)
	>
	<COND
		(<AND <MC-VERB? MELT HEAT LIGHT-WITH BURN-WITH>
				<MC-PRSI? ,TH-TORCH>
			>
			<COND
				(<MC-ISNOT? ,TH-TORCH ,FL-LIGHTED>
					<TELL CTHE ,TH-TORCH " is not lit." CR>
				)
				(<MC-PRSO? ,TH-WAX-HEAD>
					<REMOVE ,TH-WAX-HEAD>
					<MOVE ,TH-WAX-POOL ,GL-PLACE-CUR>
					<RT-THIS-IS-IT ,TH-EMERALD>
					<TELL
CTHEO " melts into a pool of wax on the floor. You see
something glittering in the wax." CR
					>
				)
				(<MC-PRSO? ,TH-WAX-AX>
					<REMOVE ,TH-WAX-AX>
					<MOVE ,TH-MELTED-AX ,GL-PLACE-CUR>
					<TELL CTHEO " melts into a pool of wax on the floor." CR>
				)
				(<MC-ISNOT? ,GL-PRSO ,FL-BURNABLE>
					<RT-CYOU-MSG>
					<TELL "cannot " VW " " THEO " with " THEI "." CR>
				)
			>
		)
		(<AND <MC-VERB? LIGHT-WITH BURN-WITH>
				<MC-PRSO? ,TH-TORCH>
			>
			<COND
				(<MC-IS? ,TH-TORCH ,FL-LIGHTED>
					<TELL CTHEO " is already lit." CR>
				)
				(<AND <MC-PRSI? ,TH-TOBACCO ,TH-PIPE>
						<MC-IS? ,TH-TOBACCO ,FL-LIGHTED>
					>
					<TELL CTHEI " does not put out enough heat to light " THEO "." CR>
				)
				(<MC-ISNOT? ,GL-PRSI ,FL-BURNABLE>
					<RT-CYOU-MSG>
					<TELL "cannot light " THEO " with " THEI "." CR>
				)
				(<MC-ISNOT? ,GL-PRSI ,FL-LIGHTED>
					<TELL CTHEI " is not burning." CR>
				)
				(T
					<TELL CTHEO " catches fire quickly." CR>
					<MC-MAKE ,TH-TORCH ,FL-LIGHTED>
					<RT-ALARM-SET-REL ,RT-I-TORCH-OUT <RT-PARM-SET 1 0 0>>
					<SET WHO <RT-WHO-SAYS?>>
					<COND
						(<EQUAL? .WHO ,CH-HOLMES>
							<TELL CR
"Holmes looks at you and says, \"An ingenious solution, Watson. My
compliments, old chap.\"" CR
							>
						)
					>
					<RT-UPDATE-SCORE 4>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-LIGHT-PIPE"
;-----------------------------------------------------------------------------

<ROUTINE RT-LIGHT-PIPE (FIRE)
	<COND
		(<MC-ISNOT? .FIRE ,FL-BURNABLE>
			<RT-CYOU-MSG>
			<TELL "cannot light " THEO " with " THEI "." CR>
		)
		(<MC-ISNOT? .FIRE ,FL-LIGHTED>
			<TELL CTHE .FIRE " is not burning." CR>
		)
		(<MC-IS? ,TH-TOBACCO ,FL-LIGHTED>
			<TELL CTHEO " is already lit." CR>
		)
		(<IN? ,TH-TOBACCO ,TH-PIPE>
			<MC-MAKE ,TH-TOBACCO ,FL-LIGHTED>
			<RT-ALARM-SET-REL ,RT-I-PIPE-OUT <RT-PARM-SET 0 15 0>>
			<TELL "After a few puffs, " THEO " fires right up." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-TOBACCO"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-TOBACCO ("OPTIONAL" (CONTEXT <>) "AUX" I)
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-TOBACCO">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<SETG GL-P-IT-OBJECT ,TH-TOBACCO>
		)
	>
	<COND
		(<AND <MC-VERB? LIGHT-WITH BURN-WITH>
				<MC-PRSO? ,TH-TOBACCO>
			>
			<COND
				(<MC-PRSI? <> ,TH-HANDS>
					<SET I ,TH-MATCH>
				)
				(T
					<SET I ,GL-PRSI>
				)
			>
			<COND
				(<NOT <IN? .I ,GL-WINNER>>
					<RT-CYOU-MSG "are" "is">
					<TELL "not holding " A .I "." CR>
				)
				(<NOT <IN? ,TH-PIPE ,GL-WINNER>>
					<RT-CYOU-MSG "are" "is">
					<TELL "not holding " THE ,TH-PIPE "." CR>
				)
				(<MC-IS? ,TH-TOBACCO ,FL-LIGHTED>
					<TELL CTHEO " is already lit." CR>
				)
				(<RT-LIGHT-PIPE .I>
					<RTRUE>
				)
				(T
					<TELL CTHEO " " ,K-SMOULDERS-MSG CR>
				)
			>
		)
		(<AND <MC-VERB? TAKE>
				<MC-IS? ,TH-TOBACCO ,FL-LIGHTED>
			>
			<TELL "Yeeeeouch! That's hot!" CR>
		)
;		(<AND <MC-VERB? LIGHT-WITH BURN-WITH>
				<MC-PRSI? ,TH-TOBACCO>
				<MC-IS? ,GL-PRSO ,FL-BURNABLE>
			>
			<COND
				(<MC-PRSO? ,TH-TORCH>
					<RFALSE>
				)
				(<MC-ISNOT? ,TH-TOBACCO ,FL-LIGHTED>
					<TELL CTHEI " is not lit." CR>
				)
				(<MC-IS? ,GL-PRSO ,FL-LIGHTED>
					<TELL CTHEO " is already burning." CR>
				)
				(<MC-PRSO? ,TH-NEWSPAPER ,TH-WESTMINSTER-CLUE ,TH-MAIL>
					<TELL CTHEO " lights right up." CR>
					<MC-MAKE ,GL-PRSO ,FL-LIGHTED>
					<COND
						(<MC-PRSO? ,TH-NEWSPAPER>
							<RT-ALARM-SET-REL ,RT-I-NEWSPAPER-OUT <RT-PARM-SET 0 3 0>>
						)
						(<MC-PRSO? ,TH-WESTMINSTER-CLUE>
							<RT-ALARM-SET-REL ,RT-I-CLUE-OUT <RT-PARM-SET 0 3 0>>
						)
						(<MC-PRSO? ,TH-MAIL>
							<RT-ALARM-SET-REL ,RT-I-MAIL-OUT <RT-PARM-SET 0 3 0>>
						)
					>
				)
				(T
					<TELL "Unfortunately, " THEI " doesn't put out enough heat to
light " THEO "." CR>
				)
			>
		)
		(<MC-VERB? SMOKE>
			<COND
				(<MC-IS? ,TH-TOBACCO ,FL-LIGHTED>
					<TELL ,K-BRAND-MSG CR>
				)
				(T
					<TELL CTHEO " is not lit." CR>
				)
			>
		)
		(<MC-VERB? SMELL>
			<TELL
"The shag has a strong, but pleasant smell." CR
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-PIPE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-PIPE ("OPTIONAL" (CONTEXT <>) "AUX" I DEST)
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-PIPE">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? LIGHT-WITH BURN-WITH>
					<COND
						(<MC-PRSI? <> ,TH-HANDS>
							<SET I ,TH-MATCH>
						)
						(T
							<SET I ,GL-PRSI>
						)
					>
					<COND
						(<NOT <IN? .I ,GL-WINNER>>
							<RT-CYOU-MSG "are" "is">
							<TELL "not holding " A .I "." CR>
						)
						(<NOT <IN? ,TH-PIPE ,GL-WINNER>>
							<RT-CYOU-MSG "are" "is">
							<TELL "not holding " THE ,TH-PIPE "." CR>
						)
						(<MC-IS? ,TH-TOBACCO ,FL-LIGHTED>
							<TELL CTHEO " is already lit." CR>
						)
						(<RT-LIGHT-PIPE .I>
							<RTRUE>
						)
						(<FIRST? ,TH-PIPE>
							<RT-CYOU-MSG>
							<TELL "cannot light " THE <FIRST? ,TH-PIPE> " in " THE ,TH-PIPE "." CR>
						)
						(T
							<TELL "There is nothing in the pipe to light." CR>
						)
					>
				)
				(<MC-VERB? SMOKE>
					<COND
						(<MC-IS? ,TH-TOBACCO ,FL-LIGHTED>
							<TELL ,K-BRAND-MSG CR>
						)
						(T
							<TELL CTHEO " is not lit." CR>
						)
					>
				)
				(<AND <MC-VERB? EMPTY-INTO POUR>
						<IN? ,TH-TOBACCO ,TH-PIPE>
						<MC-IS? ,TH-TOBACCO ,FL-LIGHTED>
					>
					<COND
						(<MC-VERB? POUR>
							<MC-UNMAKE ,TH-TOBACCO ,FL-LIGHTED>
							<MOVE ,TH-TOBACCO ,GL-PLACE-CUR>
							<TELL CTHE ,TH-TOBACCO " falls to ">
							<COND
								(<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
									<TELL THE ,TH-FLOOR>
								)
								(T
									<TELL THE ,TH-GROUND>
								)
							>
							<TELL ", " ,K-SMOULDERS-MSG CR>
						)
						(<MC-VERB? EMPTY-INTO>
							<COND
								(<RT-ROOM-IN-ON-MSG? ,TH-TOBACCO ,GL-PRSI>
									<RTRUE>
								)
								(<RT-CHECK-MOVE-MSG? ,TH-TOBACCO ,GL-PRSI>
									<RTRUE>
								)
								(T
									<MC-UNMAKE ,TH-TOBACCO ,FL-LIGHTED>
									<MOVE ,TH-TOBACCO ,GL-PRSI>
									<TELL CTHE ,TH-TOBACCO " falls ">
									<COND
										(<MC-IS? ,GL-PRSI ,FL-CONTAINER>
											<TELL "into">
										)
										(T
											<TELL "onto">
										)
									>
									<TELL " " THEI ", " ,K-SMOULDERS-MSG CR>
								)
							>
						)
					>
				)
			>
		)
		(<MC-THIS-PRSI?>
			<COND
				(<AND <MC-VERB? PUT>
						<NOT <MC-PRSO? ,TH-TOBACCO>>
					>
					<TELL "Putting " THEO " in " THEI " would">
					<RT-WASTE-OF-TIME-MSG>
				)
				(<AND <MC-VERB? POUR-FROM>
						<MC-PRSO? TH-TOBACCO>
						<IN? ,TH-TOBACCO ,TH-PIPE>
						<MC-IS? ,TH-TOBACCO ,FL-LIGHTED>
					>
					<MC-UNMAKE ,TH-TOBACCO ,FL-LIGHTED>
					<MOVE ,TH-TOBACCO ,GL-PLACE-CUR>
					<TELL CTHEO " falls to ">
					<COND
						(<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
							<TELL THE ,TH-FLOOR>
						)
						(T
							<TELL THE ,TH-GROUND>
						)
					>
					<TELL ", " ,K-SMOULDERS-MSG CR>
				)
;				(<AND <MC-VERB? LIGHT-WITH BURN-WITH>
						<MC-THIS-PRSI?>
						<MC-IS? ,GL-PRSO ,FL-BURNABLE>
					>
					<COND
						(<MC-PRSO? ,TH-TORCH>
							<RFALSE>
						)
						(<MC-ISNOT? ,TH-TOBACCO ,FL-LIGHTED>
							<TELL CTHEI " is not lit." CR>
						)
						(<MC-IS? ,GL-PRSO ,FL-LIGHTED>
							<TELL CTHEO " is already burning." CR>
						)
						(<MC-PRSO? ,TH-NEWSPAPER ,TH-WESTMINSTER-CLUE ,TH-MAIL>
							<TELL CTHEO " lights right up." CR>
							<MC-MAKE ,GL-PRSO ,FL-LIGHTED>
							<COND
								(<MC-PRSO? ,TH-NEWSPAPER>
									<RT-ALARM-SET-REL ,RT-I-NEWSPAPER-OUT <RT-PARM-SET 0 3 0>>
								)
								(<MC-PRSO? ,TH-WESTMINSTER-CLUE>
									<RT-ALARM-SET-REL ,RT-I-CLUE-OUT <RT-PARM-SET 0 3 0>>
								)
								(<MC-PRSO? ,TH-MAIL>
									<RT-ALARM-SET-REL ,RT-I-MAIL-OUT <RT-PARM-SET 0 3 0>>
								)
							>
						)
						(T
							<TELL
"Unfortunately, " THEI " doesn't put out enough heat to light " THEO "." CR
							>
						)
					>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-MAIL"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-MAIL ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-MAIL">
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<SETG GL-P-IT-OBJECT ,TH-MAIL>
		)
	>
	<COND
		(<MC-VERB? READ EXAMINE LOOK-ON LOOK-INSIDE OPEN SEARCH OPEN-WITH>
			<TELL
"You should not read other people's mail." CR
			>
		)
		(<MC-VERB? CLOSE>
			<TELL
"The mail hasn't been opened." CR
			>
		)
		(<AND <MC-VERB? TAKE>
				<MC-IS? ,TH-KNIFE ,FL-COLD>
			>
			<MC-UNMAKE ,TH-KNIFE ,FL-COLD>
			<MOVE ,TH-KNIFE ,GL-WINNER>
			<TELL "[Taking the knife first]">
			<COND
				(,GL-P-MULT?
					<TELL " ">
				)
				(T
					<CRLF>
				)
			>
			<RFALSE>
		)
		(<AND <MC-VERB? LIGHT-WITH BURN-WITH>
				<MC-THIS-PRSO?>
			>
			<COND
				(<MC-IS? ,TH-MAIL ,FL-LIGHTED>
					<TELL CTHEO " is already lit." CR>
				)
				(<AND	<MC-ISNOT? ,GL-PRSI ,FL-BURNABLE>
						<NOT <MC-PRSI? ,TH-PIPE>>
					>
					<RFALSE>
				)
				(<OR	<AND	<MC-IS? ,GL-PRSI ,FL-LIGHTED>
								<MC-IS? ,GL-PRSI ,FL-BURNABLE>
						>
						<AND	<MC-PRSI? ,TH-PIPE>
								<MC-IS? ,TH-TOBACCO ,FL-LIGHTED>
						>
					>
					<TELL CTHE ,TH-MAIL " lights up." CR>
					<MC-MAKE ,TH-MAIL ,FL-LIGHTED>
					<RT-ALARM-SET-REL ,RT-I-MAIL-OUT <RT-PARM-SET 0 3 0>>
				)
				(T
					<TELL CTHEI " is not burning." CR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-NEWSPAPER"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-NEWSPAPER ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-NEWSPAPER">
		)
		(T
		)
	>
	<COND
		(<NOT <MC-VERB?
					READ
					READ-TO
					SHOW
					LIGHT-WITH
					BURN-WITH
					GIVE
					TELL-ABOUT
				>
			>
			<RFALSE>
		)
		(<NOT <IN? ,TH-NEWSPAPER ,CH-PLAYER>>
			<TELL "The newspaper will not leap into your hand by itself." CR>
		)
		(<MC-VERB? READ>
			<RT-READ-NEWSPAPER>
		)
		(<OR	<AND
					<MC-VERB? READ-TO SHOW GIVE>
					<MC-THIS-PRSO?>
				>
				<AND
					<MC-VERB? TELL-ABOUT>
					<MC-THIS-PRSI?>
				>
			>
			<COND
				(<MC-ISNOT? ,GL-PRSI ,FL-PERSON>
					<RFALSE>
				)
				(<OR	<MC-IS? ,TH-NEWSPAPER ,FL-ASLEEP>
						<MC-IS? ,TH-NEWSPAPER ,FL-OPENED>
					>
					<RT-READ-NEWSPAPER>
					<CRLF>
				)
			>
			<COND
				(<OR	<AND
							<MC-VERB? READ-TO SHOW GIVE>
							<MC-PRSI? ,CH-HOLMES>
						>
						<AND
							<MC-VERB? TELL-ABOUT>
							<MC-PRSO? ,CH-HOLMES>
						>
					>
					<COND
						(<MC-IS? ,CH-HOLMES ,FL-ASLEEP>
							<RT-WAKE-UP-HOLMES>
							<COND
								(<MC-VERB? GIVE>
									<MOVE ,TH-NEWSPAPER ,CH-HOLMES>
								)
							>
							<RTRUE>
						)
;						(T
							<TELL "\"Don't be tedious, Watson. You have ">
							<COND
								(<MC-VERB? READ-TO>
									<TELL "read">
								)
								(<MC-VERB? SHOW>
									<TELL "shown">
								)
								(<MC-VERB? GIVE>
									<TELL "given">
								)
								(<MC-VERB? TELL-ABOUT>
									<TELL "mentioned">
								)
							>
							<TELL " that to me already.\"" CR>
						)
					>
				)
				(T
					<TELL CTHEI " does not seem to be interested." CR>
				)
			>
		)
		(<AND <MC-VERB? LIGHT-WITH BURN-WITH>
				<MC-THIS-PRSO?>
			>
			<COND
				(<MC-IS? ,TH-NEWSPAPER ,FL-LIGHTED>
					<TELL CTHEO " is already lit." CR>
				)
				(<AND	<MC-ISNOT? ,GL-PRSI ,FL-BURNABLE>
						<NOT <MC-PRSI? ,TH-PIPE>>
					>
					<RFALSE>
				)
				(<OR	<AND	<MC-IS? ,GL-PRSI ,FL-LIGHTED>
								<MC-IS? ,GL-PRSI ,FL-BURNABLE>
						>
						<AND	<MC-PRSI? ,TH-PIPE>
								<MC-IS? ,TH-TOBACCO ,FL-LIGHTED>
						>
					>
					<TELL CTHE ,TH-NEWSPAPER " lights up." CR>
					<MC-MAKE ,TH-NEWSPAPER ,FL-LIGHTED>
					<RT-ALARM-SET-REL ,RT-I-NEWSPAPER-OUT <RT-PARM-SET 0 3 0>>
					<RTRUE>
				)
				(T
					<TELL CTHEI " is not burning." CR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-PAGE"
;-----------------------------------------------------------------------------

;<ROUTINE RT-AC-TH-PAGE ("OPTIONAL" (CONTEXT <>))
	<COND
		(<MC-VERB? READ READ-TO SHOW GIVE TELL-ABOUT BURN-WITH LIGHT-WITH EXAMINE>
			<COND
				(<MC-THIS-PRSO?>
					<SETG GL-PRSO ,TH-NEWSPAPER>
				)
				(<MC-THIS-PRSI?>
					<SETG GL-PRSI ,TH-NEWSPAPER>
				)
			>
			<RT-AC-TH-NEWSPAPER>
		)
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? FLIP TURN>
					<COND
						(<MC-ISNOT? ,TH-NEWSPAPER ,FL-OPENED>
							<MC-MAKE ,TH-NEWSPAPER ,FL-OPENED>
							<PUTP ,TH-NEWSPAPER ,P?FLIPPED 0>
							<RT-CYOU-MSG "open" "opens">
							<TELL THE ,TH-NEWSPAPER "." CR>
						)
						(T
							<MC-UNMAKE ,TH-NEWSPAPER ,FL-OPENED>
							<PUTP ,TH-NEWSPAPER ,P?FLIPPED 1>
							<RT-CYOU-MSG "turn" "turns">
							<TELL THE ,TH-PAGE "." CR>
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
; "RT-AC-TH-WESTMINSTER-CLUE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-WESTMINSTER-CLUE ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-WESTMINSTER-CLUE">
		)
		(T
		)
	>
	<COND
		(<MC-VERB? READ EXAMINE>
			<COND
				(<NOT <IN? ,TH-WESTMINSTER-CLUE ,CH-PLAYER>>
					<TELL "The paper will not leap into your hand by itself." CR>
				)
				(<ZERO? <GETP ,TH-WESTMINSTER-CLUE ,P?FLIPPED>>
					<TELL
INDENT "Mortality, behold and fear!" CR
INDENT "What a change of flesh is here!" CR
INDENT "Think how many royal bones" CR
INDENT "Sleep within this heap of stones:" CR
INDENT "Here they lie, had realms and lands," CR
INDENT "Who now want strength" WRAP "to stir their hands." CR CR>

					<TELL INDENT ,K-ASTERISK-MSG CR CR>

					<TELL
INDENT "For two-score years I reigned alone," CR
INDENT "A virgin queen on England's throne." CR
INDENT "My navy caused Armada's shame," CR
INDENT "And with me died the Tudor name." CR CR

INDENT ,K-ASTERISK-MSG CR CR

INDENT "The apple sorely tempted Eve," CR
INDENT "And Tell another aimed to cleave." CR
INDENT "But when one fell, it showed to me," CR
INDENT "The mighty pull of gravity." CR CR

INDENT ,K-ASTERISK-MSG CR CR

INDENT "My father, it was said, would die," CR
INDENT "Beneath the Holy City's sky." CR
INDENT "Jerusalem his body claimed," CR
INDENT "And it is after him I'm named." CR CR

INDENT ,K-ASTERISK-MSG CR CR

INDENT ,K-ASTERISK-MSG CR CR

INDENT "O stately Holmes of England," CR
INDENT "In Baker Street abide." CR
INDENT "For even you must surely fail," CR
INDENT "To save your country's pride." CR
					>
				)
				(T
					<TELL
"This side appears to be blank." CR
					>
				)
			>
		)
		(<AND <MC-VERB? LIGHT-WITH BURN-WITH>
				<MC-THIS-PRSO?>
			>
			<COND
				(<MC-IS? ,TH-WESTMINSTER-CLUE ,FL-LIGHTED>
					<TELL CTHEO " is already lit." CR>
				)
				(<AND	<MC-ISNOT? ,GL-PRSI ,FL-BURNABLE>
						<NOT <MC-PRSI? ,TH-PIPE>>
					>
					<RFALSE>
				)
				(<OR	<AND
							<MC-IS? ,GL-PRSI ,FL-LIGHTED>
							<MC-IS? ,GL-PRSI ,FL-BURNABLE>
						>
						<AND
							<MC-PRSI? ,TH-PIPE>
							<MC-IS? ,TH-TOBACCO ,FL-LIGHTED>
						>
					>
					<TELL CTHE ,TH-WESTMINSTER-CLUE " lights up." CR>
					<MC-MAKE ,TH-WESTMINSTER-CLUE ,FL-LIGHTED>
					<RT-ALARM-SET-REL ,RT-I-CLUE-OUT <RT-PARM-SET 0 3 0>>
				)
				(T
					<TELL CTHEI " is not burning." CR>
				)
			>
			<RTRUE>
		)
		(<MC-VERB? FLIP>
			<COND
				(<NOT <IN? ,TH-WESTMINSTER-CLUE ,GL-WINNER>>
					<RT-CYOU-MSG "are" "is">
					<TELL "not holding " THE ,TH-WESTMINSTER-CLUE "." CR>
				)
				(T
					<PUTP ,TH-WESTMINSTER-CLUE ,P?FLIPPED <- 1 <GETP ,TH-WESTMINSTER-CLUE ,P?FLIPPED>>>
					<RT-CYOU-MSG "turn" "turns">
					<TELL THE ,TH-WESTMINSTER-CLUE " over." CR CR>
	 			)
	 		>
	 	)
		(<AND	<MC-VERB? LOOK-THRU>
				<MC-PRSI? ,TH-MAGNIFYING-GLASS>
			>
			<TELL "It's been wiped clean." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "Constants"
;-----------------------------------------------------------------------------

<CONSTANT K-HOLMES-HEAD?	1>		; "Has Holmes made comment about Charles I head?"
<CONSTANT K-HOLMES-GEM?		2>		; "Has Holmes made comment about gem?"

;-----------------------------------------------------------------------------
; "RT-AC-TH-WAX-HEAD"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-WAX-HEAD ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-AC "TH-WAX-HEAD">
		)
		(T
		)
	>
	<COND
		(<IN? ,TH-WAX-HEAD ,TH-CHARLES-STATUE>
			<COND
				(<MC-VERB? TAKE UNSCREW UNSCREW-FROM>
					<MOVE ,TH-WAX-HEAD ,GL-WINNER>
					<MC-MAKE ,TH-WAX-HEAD ,FL-SEEN>
					<MC-UNMAKE ,TH-WAX-HEAD ,FL-NODESC>
					<MC-UNMAKE ,TH-WAX-HEAD ,FL-NOALL>
					<RT-CYOU-MSG "take" "takes">
					<TELL THE ,TH-WAX-HEAD "." CR>
				)
				(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
					<MC-MAKE ,TH-WAX-HEAD ,FL-SEEN>
					<TELL CTHE ,TH-WAX-HEAD " wobbles slightly.">
					<COND
						(<MC-F? <BAND <GETP ,CH-HOLMES ,P?AUX1> ,K-HOLMES-HEAD?>>
							<TELL " " THE ,CH-HOLMES " says, \"Even when he was alive,
he didn't have his head screwed on right.\"">
							<PUTP ,CH-HOLMES ,P?AUX1
								<BOR
									<GETP ,CH-HOLMES ,P?AUX1>
									,K-HOLMES-HEAD?
								>
							>
						)
					>
					<CRLF>
				)
			>
		)
		(<AND <MC-VERB? MELT HEAT>
				<MC-THIS-PRSO?>
				<OR
					<AND
						<MC-IS? ,GL-PRSI ,FL-BURNABLE>
						<MC-IS? ,GL-PRSI ,FL-LIGHTED>
					>
					<AND
						<MC-PRSI? ,TH-PIPE>
						<MC-IS? ,TH-TOBACCO ,FL-LIGHTED>
					>
				>
					
			>
			<TELL CTHEO " softens, but " THEI " does not put out enough heat to
melt it." CR
			>
		)
		(<MC-VERB? MUNG KILL OPEN>
			<RT-CYOU-MSG>
			<TELL "can't break into the head." CR>
		)
	>
>

;*****************************************************************************
; "THINGS3.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-DF-TH-WAX-POOL"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-WAX-POOL ("OPTIONAL" (CONTEXT <>))
	<COND
		(<NOT <FIRST? ,TH-WAX-POOL>>
			<TELL "Looks like any other " D ,TH-WAX-POOL "." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-MELTED-AX"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-MELTED-AX ("OPTIONAL" (CONTEXT <>))
	<COND
		(<NOT <FIRST? ,TH-MELTED-AX>>
			<TELL "Looks like any other " D ,TH-MELTED-AX "." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-MAIL"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-MAIL ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-MAIL">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,TH-MAIL ,FL-LIGHTED>
			<TELL CTHE ,TH-MAIL " is burning." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-NEWSPAPER"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-NEWSPAPER ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-NEWSPAPER">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,TH-NEWSPAPER ,FL-LIGHTED>
			<TELL CTHE ,TH-NEWSPAPER " is burning." CR>
		)
		(T
			<TELL "It's the newspaper that came in your game package." CR>
		)			
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-WESTMINSTER-CLUE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-WESTMINSTER-CLUE ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-WESTMINSTER-CLUE">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,TH-MAIL ,FL-LIGHTED>
			<TELL CTHE ,TH-MAIL " is burning." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-TOBACCO"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-TOBACCO ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-TOBACCO">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,TH-TOBACCO ,FL-LIGHTED>
			<TELL CTHE ,TH-TOBACCO " is burning." CR>
		)
		(T
			<TELL "It's Holmes's favorite brand of shag tobacco." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-PIPE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-PIPE ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-PIPE">
		)
		(T
		)
	>
	<COND
		(<AND <MC-IS? ,TH-TOBACCO ,FL-LIGHTED>
				<IN? ,TH-TOBACCO ,TH-PIPE>
			>
			<TELL "Smoke gently wafts from " THE ,TH-PIPE "." CR>
		)
		(T
			<TELL "It is an old and oily black clay pipe, the companion of
Holmes's deepest meditations." CR
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-MATCH"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-MATCH ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-MATCH">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,TH-MATCH ,FL-LIGHTED>
			<TELL CTHE ,TH-MATCH " is burning." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-TORCH"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-TORCH ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-TORCH">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,TH-TORCH ,FL-LIGHTED>
			<TELL CTHE ,TH-TORCH " is burning." CR>
		)
	>
>

;*****************************************************************************
; "PLACES2.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-GUARD-TAKE-ITEM"
;-----------------------------------------------------------------------------

<ROUTINE RT-GUARD-TAKE-ITEM (OBJ1 "OPTIONAL" (OBJ2 <>) (OBJ3 <>) "AUX" STR)
	<TELL CTHE ,CH-TUSSAUDS-GUARD " says, \"I'm sorry, but " THE .OBJ1>
	<COND
		(<AND .OBJ2 .OBJ3>
			<TELL ", " THE .OBJ2 " and " THE .OBJ3 " are">
			<SET STR "them">
		)
		(<MC-T? .OBJ2>
			<TELL " and " THE .OBJ2 " are">
			<SET STR "them">
		)
		(T
			<TELL " is">
			<SET STR "it">
		)
	>
	<TELL
" not to be removed.\" He takes " .STR " and returns " .STR " to the proper
place." CR CR
	>
>

;-----------------------------------------------------------------------------
; "RT-GUARD-STOP-ENTRANCE"
;-----------------------------------------------------------------------------

<ROUTINE RT-GUARD-STOP-ENTRANCE ("OPTIONAL" (OBJ <>) "AUX" WHO)
	<SET WHO <RT-WHO-SAYS?>>
	<TELL
CTHE ,CH-MATCH-SNIFFING-DOG " barks loudly and " THE
,CH-TUSSAUDS-GUARD " says, \"Seeing as how it's you, "
	>
	<COND
		(<EQUAL? .WHO ,CH-HOLMES>
			<TELL "Mr. Holmes">
		)
		(T
			<TELL "Doctor Watson">
		)
	>
	<TELL
", I don't mind letting you in. But as you know we are very afraid of
fire here, so we have trained this dog to detect matches or open
flames. I'm afraid I can't allow you"
	>
	<COND
		(<EQUAL? .WHO ,CH-HOLMES ,CH-WIGGINS>
			<TELL " or your companion">
		)
	>
	<TELL " to enter until ">
	<COND
		(<AND .OBJ
				<OR
					<IN? .OBJ ,CH-PLAYER>
					<AND
						,GL-PUPPY
						<IN? .OBJ ,GL-PUPPY>
					>
				>
			>
			<TELL THE .OBJ>
		)
		(T
			<TELL "the item">
			<COND
				(<NOT .OBJ>
					<TELL "s">
				)
			>
			<TELL " to which the dog objects">
		)
	>
	<TELL " ha">
	<COND
		(.OBJ
			<TELL "s">
		)
		(T
			<TELL "ve">
		)
	>
	<TELL " been discarded.\"" CR>
>

;-----------------------------------------------------------------------------
; "RT-AC-RM-MARYLEBONE-RD"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-RM-MARYLEBONE-RD ("OPTIONAL" (CONTEXT <>) "AUX" OBJ (FLAME <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-RM-AC "RM-MARYLEBONE-RD" .CONTEXT>
		)
		(T
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "SOUTH from RM-MADAME-TUSSAUDS                  to RM-MARYLEBONE-RD"
;-----------------------------------------------------------------------------

<ROUTINE RT-EX-RM-EXIT-TUSSAUDS ("AUX" IN1 IN2 IN3 TORCH)
	<COND
		(<AND <EQUAL? ,GL-PRSO ,P?SOUTH ,P?OUT>
				<MC-HERE? ,RM-MADAME-TUSSAUDS>
			>
			<SET IN1
				<COND
					(<OR	<RT-META-IN? ,TH-TORCH ,GL-WINNER>
							<RT-META-IN? ,TH-TORCH ,GL-PUPPY>
						>
						<SET TORCH ,TH-TORCH>
					)
					(<OR	<RT-META-IN? ,TH-BURNT-TORCH ,GL-WINNER>
							<RT-META-IN? ,TH-BURNT-TORCH ,GL-PUPPY>
						>
						<SET TORCH ,TH-BURNT-TORCH>
					)
				>
			>
			<SET IN2
				<OR
					<RT-META-IN? ,TH-WAX-HEAD ,GL-WINNER>
					<RT-META-IN? ,TH-WAX-HEAD ,GL-PUPPY>
				>
			>
			<SET IN3
				<OR
					<RT-META-IN? ,TH-WAX-AX ,GL-WINNER>
					<RT-META-IN? ,TH-WAX-AX ,GL-PUPPY>
				>
			>
			<COND
				(<AND .IN1 .IN2 .IN3>
					<RT-GUARD-TAKE-ITEM ,TH-TORCH ,TH-WAX-HEAD ,TH-WAX-AX>
				)
				(<AND .IN1 .IN2>
					<RT-GUARD-TAKE-ITEM ,TH-TORCH ,TH-WAX-HEAD>
				)
				(<AND .IN1 .IN3>
					<RT-GUARD-TAKE-ITEM ,TH-TORCH ,TH-WAX-AX>
				)
				(<AND .IN2 .IN3>
					<RT-GUARD-TAKE-ITEM ,TH-WAX-HEAD ,TH-WAX-AX>
				)
				(<MC-T? .IN1>
					<RT-GUARD-TAKE-ITEM ,TH-TORCH>
				)
				(<MC-T? .IN2>
					<RT-GUARD-TAKE-ITEM ,TH-WAX-HEAD>
				)
				(<MC-T? .IN3>
					<RT-GUARD-TAKE-ITEM ,TH-WAX-AX>
				)
			>
			<COND
				(<MC-T? .IN1>
					<MOVE .TORCH ,TH-FAWKES-STATUE>
					<MC-MAKE .TORCH ,FL-NODESC>
					<COND
						(<MC-IS? .TORCH ,FL-LIGHTED>
							<RT-ALARM-CLR ,RT-I-TORCH-OUT>
							<RT-I-TORCH-OUT>
							<MC-MAKE ,TH-BURNT-TORCH ,FL-NODESC>
						)
					>
				)
			>
			<COND
				(<MC-T? .IN2>
					<MOVE ,TH-WAX-HEAD ,TH-CHARLES-STATUE>
					<MC-MAKE ,TH-WAX-HEAD ,FL-NODESC>
				)
			>
			<COND
				(<MC-T? .IN3>
					<MOVE ,TH-WAX-AX ,TH-CHARLES-STATUE>
					<MC-MAKE ,TH-WAX-AX ,FL-NODESC>
				)
			>
			<RETURN ,RM-MARYLEBONE-RD>
		)
	>
>

;-----------------------------------------------------------------------------
; "NORTH from RM-MARYLEBONE-RD                    to RM-MADAME-TUSSAUDS"
;-----------------------------------------------------------------------------

<ROUTINE RT-EX-RM-MATCH-SNIFFING-DOG ("AUX" OBJ (FLAME? <>) (FIRST T) LAMP? MATCH?)
	<COND
		(<AND <EQUAL? ,GL-PRSO ,P?NORTH ,P?IN>
				<MC-HERE? ,RM-MARYLEBONE-RD>
         >
			<REPEAT ()
				<SET OBJ <FIRST? ,GL-WINNER>>
				<REPEAT ()
					<COND
						(<MC-F? .OBJ>
							<RETURN>
						)
						(<AND <MC-IS? .OBJ ,FL-BURNABLE>
								<MC-IS? .OBJ ,FL-LIGHTED>
								<NOT <EQUAL? .OBJ ,TH-TOBACCO>>
							>
							<SET FLAME? .OBJ>
							<RETURN>
						)
					>
					<SET OBJ <NEXT? .OBJ>>
				>
				<COND
					(<AND <MC-F? .FLAME?>
							<MC-T? .FIRST>
							<MC-T? ,GL-PUPPY>
						>
						<SET OBJ <FIRST? ,GL-PUPPY>>
						<SET FIRST <>>
					)
					(T
						<RETURN>
					)
				>
			>
			<COND
				(<OR	<SET MATCH?
							<AND
								<OR
									<RT-META-IN? ,TH-MATCH ,CH-PLAYER>
									<RT-META-IN? ,TH-MATCH ,GL-PUPPY>
								>
								<MC-IS? ,TH-MATCH ,FL-BURNABLE>
							>
						>
						<SET LAMP?
							<OR
								<RT-META-IN? ,TH-LAMP ,CH-PLAYER>
								<RT-META-IN? ,TH-LAMP ,GL-PUPPY>
							>
						>
						.FLAME?
					>
					<SET OBJ
						<COND
							(<AND <NOT .MATCH?> <NOT .LAMP?>>
								.FLAME?
							)
							(<AND <NOT .MATCH?> <NOT .FLAME?>>
								,TH-LAMP
							)
							(<AND <NOT .LAMP?> <NOT .FLAME?>>
								,TH-MATCH
							)
						>
					>
					<RT-GUARD-STOP-ENTRANCE .OBJ>
					<RFALSE>
				)
			>
			<COND
				(<OR	<MC-F? <LOC ,TH-WAX-HEAD>>
						<MC-F? <LOC ,TH-WAX-AX>>
					>
					<TELL
"The guard blocks your path and says, \"Oh no you don't, laddie. When I let
you in earlier you made a proper mess of my museum. I won't let you do that
again.\" After you promise to pay for the damage and plead with him for a few
moments, he finally steps aside." CR CR
					>
				)
			>
			<RETURN ,RM-MADAME-TUSSAUDS>
		)
	>
>

;*****************************************************************************
; "PUZZLES.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-PUT-OUT"
;-----------------------------------------------------------------------------

<ROUTINE RT-PUT-OUT (THING)
   <COND
      (<MC-ISNOT? .THING ,FL-BURNABLE>
         <RFALSE>
		)
		(<MC-ISNOT? .THING ,FL-LIGHTED>
         <RFALSE>
      )
      (<EQUAL? .THING ,TH-MATCH>
         <RT-ALARM-CLR ,RT-I-MATCH-OUT>
         <RT-I-MATCH-OUT>
      )
      (<EQUAL? .THING ,TH-PIPE>
         <RT-ALARM-CLR ,RT-I-PIPE-OUT>
         <RT-I-PIPE-OUT>
      )
      (<EQUAL? .THING ,TH-TORCH>
         <RT-ALARM-CLR ,RT-I-TORCH-OUT>
         <RT-I-TORCH-OUT>
      )
      (<EQUAL? .THING ,TH-NEWSPAPER>
         <RT-ALARM-CLR ,RT-I-NEWSPAPER-OUT>
         <RT-I-NEWSPAPER-OUT>
      )
      (<EQUAL? .THING ,TH-WESTMINSTER-CLUE>
         <RT-ALARM-CLR ,RT-I-CLUE-OUT>
         <RT-I-CLUE-OUT>
      )
      (<EQUAL? .THING ,TH-MAIL>
         <RT-ALARM-CLR ,RT-I-MAIL-OUT>
         <RT-I-MAIL-OUT>
      )
      (<EQUAL? .THING ,TH-MATCHBOOK>
         <RT-ALARM-CLR ,RT-I-MATCHBOOK-OUT>
         <RT-I-MATCHBOOK-OUT>
      )
      (T
         <REMOVE .THING>
         <MC-UNMAKE .THING ,FL-LIGHTED>
         <MC-UNMAKE .THING ,FL-BURNABLE>
			<TELL CTHE .THING " burns up and disappears." CR>
      )
   >
>

;-----------------------------------------------------------------------------
; "RT-I-MATCH-OUT"
;-----------------------------------------------------------------------------

<ROUTINE RT-I-MATCH-OUT ("AUX" (RESULT <>))
	<COND
		(<RT-VISIBLE? ,TH-MATCH>
			<TELL CR CTHE ,TH-MATCH " flickers and dies." CR>
			<SET RESULT T>
		)
	>
	<MC-UNMAKE ,TH-MATCH ,FL-LIGHTED>
	<MC-UNMAKE ,TH-MATCH ,FL-BURNABLE>
	<MOVE ,TH-BURNT-MATCH <LOC ,TH-MATCH>>
	<REMOVE ,TH-MATCH>
	<RETURN .RESULT>
>

;-----------------------------------------------------------------------------
; "RT-I-PIPE-OUT"
;-----------------------------------------------------------------------------

<ROUTINE RT-I-PIPE-OUT ("AUX" (RESULT <>))
	<COND
		(<RT-VISIBLE? ,TH-TOBACCO>
			<TELL CR CTHE ,TH-PIPE " has gone out." CR>
		)
	>
	<MC-UNMAKE ,TH-TOBACCO ,FL-LIGHTED>
	<MC-UNMAKE ,TH-TOBACCO ,FL-BURNABLE>
	<REMOVE ,TH-TOBACCO>
	<RETURN .RESULT>
>

;-----------------------------------------------------------------------------
; "RT-I-TORCH-OUT"
;-----------------------------------------------------------------------------

<ROUTINE RT-I-TORCH-OUT ("AUX" (RESULT <>))
	<COND
		(<RT-VISIBLE? ,TH-TORCH>
			<TELL CR CTHE ,TH-TORCH " sputters and dies." CR>
			<SET RESULT T>
		)
	>
	<MC-UNMAKE ,TH-TORCH ,FL-LIGHTED>
	<MC-UNMAKE ,TH-TORCH ,FL-BURNABLE>
	<MOVE ,TH-BURNT-TORCH <LOC ,TH-TORCH>>
	<REMOVE ,TH-TORCH>
	<RETURN .RESULT>
>

;-----------------------------------------------------------------------------
; "RT-I-NEWSPAPER-OUT"
;-----------------------------------------------------------------------------

<ROUTINE RT-I-NEWSPAPER-OUT ("AUX" (RESULT <>))
	<COND
		(<RT-VISIBLE? ,TH-NEWSPAPER>
			<TELL CR CTHE ,TH-NEWSPAPER " disappears into a cloud of fine ash." CR>
			<SET RESULT T>
		)
	>
	<MC-UNMAKE ,TH-NEWSPAPER ,FL-LIGHTED>
	<MC-UNMAKE ,TH-NEWSPAPER ,FL-BURNABLE>
	<REMOVE ,TH-NEWSPAPER>
	<RETURN .RESULT>
>

;-----------------------------------------------------------------------------
; "RT-I-CLUE-OUT"
;-----------------------------------------------------------------------------

<ROUTINE RT-I-CLUE-OUT ("AUX" (RESULT <>))
	<COND
		(<RT-VISIBLE? ,TH-WESTMINSTER-CLUE>
			<TELL CR CTHE ,TH-WESTMINSTER-CLUE " disappears in a puff of oily black smoke." CR>
			<SET RESULT T>
		)
	>
	<MC-UNMAKE ,TH-WESTMINSTER-CLUE ,FL-LIGHTED>
	<MC-UNMAKE ,TH-WESTMINSTER-CLUE ,FL-BURNABLE>
	<REMOVE ,TH-WESTMINSTER-CLUE>
	<RETURN .RESULT>
>

;-----------------------------------------------------------------------------
; "RT-I-MAIL-OUT"
;-----------------------------------------------------------------------------

<ROUTINE RT-I-MAIL-OUT ("AUX" (RESULT <>))
	<COND
		(<RT-VISIBLE? ,TH-MAIL>
			<TELL CR CTHE ,TH-MAIL " disappears in a flash of light." CR>
			<SET RESULT T>
		)
	>
	<MC-UNMAKE ,TH-MAIL ,FL-LIGHTED>
	<MC-UNMAKE ,TH-MAIL ,FL-BURNABLE>
	<REMOVE ,TH-MAIL>
	<RETURN .RESULT>
>

;-----------------------------------------------------------------------------
; "RT-I-MATCHBOOK-OUT"
;-----------------------------------------------------------------------------

<ROUTINE RT-I-MATCHBOOK-OUT ("AUX" (RESULT <>))
	<COND
		(<RT-VISIBLE? ,TH-MATCHBOOK>
			<TELL CR CTHE ,TH-MATCHBOOK " burns up and disappears." CR>
			<SET RESULT T>
		)
	>
	<MC-UNMAKE ,TH-MATCHBOOK ,FL-LIGHTED>
	<MC-UNMAKE ,TH-MATCHBOOK ,FL-BURNABLE>
	<REMOVE ,TH-MATCHBOOK>
	<RETURN .RESULT>
>

;*****************************************************************************
; "VERBS1.ZIL"
;*****************************************************************************

<ROUTINE PRE-LIGHT-WITH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-PRE-VERB "PRE-LIGHT-WITH">
		)
		(T
		)
	>
	<COND
		(<AND <NOT <MC-PRSO? ,TH-MATCH ,TH-TOBACCO>>
				<NOT <IN? ,GL-PRSO ,GL-WINNER>>
			>
			<RT-CYOU-MSG>
			<RT-WOULD-HAVE-TO-MSG "be holding" ,GL-PRSO>
			<TELL "to light ">
			<COND
				(<AND <MC-IS? ,GL-PRSO ,FL-PLURAL>
						<MC-ISNOT? ,GL-PRSO ,FL-COLLECTIVE>
					>
					<TELL "them">
				)
				(T
					<TELL "it">
				)
			>
			<TELL "." CR>
		)
	>
>

;*****************************************************************************
; "GENERIC.ZIL"
;*****************************************************************************

<ROUTINE RT-GN-WAX (TBL "OPTIONAL" (LEN 0))
	<RETURN ,LG-WAX-STATUES>
>

;*****************************************************************************
; "CONSTANTS"
;*****************************************************************************


<CONSTANT K-BRAND-MSG
"It's not your brand, but it's pleasant nonetheless."
>

<CONSTANT K-SMOULDERS-MSG
"smoulders for a few seconds, then goes out."
>

;*****************************************************************************
; "end of file"
;*****************************************************************************

