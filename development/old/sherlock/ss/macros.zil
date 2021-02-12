;*****************************************************************************
; "game : SHERLOCK!"
; "file : MACROS.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   24 Sep 1987 21:15:56  $"
; "rev  : $Revision:   1.4  $"
; "vers : 1.00"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "default property values"
;-----------------------------------------------------------------------------

<PROPDEF VALUE			0>
<PROPDEF SIZE			0>
<PROPDEF MASS			0>
<PROPDEF CAPACITY		0>
<PROPDEF STRENGTH		10>
<PROPDEF DEXTERITY	10>
<PROPDEF AUX1			0>
<PROPDEF AUX2			0>

;*****************************************************************************
; "tell-tokens"
;*****************************************************************************

<TELL-TOKENS
	CR			<CRLF>
	N		*	<PRINTN .X>
	C		*	<PRINTC .X>
	D		*	<PRINTD .X>
	A		*	<RT-A-PRINT .X>
	AO			<RT-A-PRINT>
	THE	*	<RT-THEO-PRINT .X>
	THEO		<RT-THEO-PRINT>
	THEI		<RT-THEI-PRINT>
	CTHE	*	<RT-CTHEO-PRINT .X>
	CTHEO		<RT-CTHEO-PRINT>
	CTHEI		<RT-CTHEI-PRINT>
	VW			<RT-VW-PRINT>
	INDENT	<RT-INDENT-PRINT>
	WRAP		<RT-WRAP-PRINT>
>

;*****************************************************************************
; "defines"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "MULTIFROB"
;-----------------------------------------------------------------------------

<DEFINE MULTIFROB (X ATMS "AUX" (OO (OR)) (O .OO) (LL (T)) (L .LL) ATM)
	<REPEAT ()
		<COND
			(<EMPTY? .ATMS>
				<RETURN!-
					<COND
						(<LENGTH? .OO 1>
							<ERROR .X>
						)
						(<LENGTH? .OO 2>
							<NTH .OO 2>
						)
						(ELSE
							<CHTYPE .OO FORM>
						)
					>
				>
			)
		>
		<REPEAT ()
			<COND
				(<EMPTY? .ATMS>
					<RETURN!->
				)
			>
			<SET ATM <NTH .ATMS 1>>
			<SET L <REST <PUTREST .L
				(<COND
					(<TYPE? .ATM ATOM>
						<CHTYPE
							<COND
								(<==? .X GL-PRSA>
									<PARSE <STRING "V?" <SPNAME .ATM>>>
								)
								(<==? .X GL-P-PRSA-WORD>
									<PARSE <STRING "W?" <SPNAME .ATM>>>
								)
								(T
									.ATM
								)
							>
							GVAL
						>
					)
					(ELSE
						.ATM
					)
				>)
			>>>
			<SET ATMS <REST .ATMS>>
			<COND
				(<==? <LENGTH .LL> 4>
					<RETURN!->
				)
			>
		>
		<SET O <REST <PUTREST .O
			(<FORM EQUAL? <CHTYPE .X GVAL> !<REST .LL>>)
		>>>
		<SET LL (T)>
		<SET L .LL>
	>
>

;*****************************************************************************
; "macro definitions"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "MC-RFATAL"
;-----------------------------------------------------------------------------

<DEFMAC MC-RFATAL ()
	'<PROG () <PUSH 99> <RSTACK>>
>

;-----------------------------------------------------------------------------
; "MC-VERB?"
;-----------------------------------------------------------------------------

<DEFMAC MC-VERB? ("ARGS" ATMS)
	<MULTIFROB GL-PRSA .ATMS>
>

;-----------------------------------------------------------------------------
; "MC-VERB-WORD?"
;-----------------------------------------------------------------------------

<DEFMAC MC-VERB-WORD? ("ARGS" ATMS)
	<MULTIFROB GL-P-PRSA-WORD .ATMS>
>

;-----------------------------------------------------------------------------
; "MC-PRSO?"
;-----------------------------------------------------------------------------

<DEFMAC MC-PRSO? ("ARGS" ATMS)
	<MULTIFROB GL-PRSO .ATMS>
>

;-----------------------------------------------------------------------------
; "MC-PRSI?"
;-----------------------------------------------------------------------------

<DEFMAC MC-PRSI? ("ARGS" ATMS)
	<MULTIFROB GL-PRSI .ATMS>
>

;-----------------------------------------------------------------------------
; "MC-THIS-PRSO?"
;-----------------------------------------------------------------------------

<DEFMAC MC-THIS-PRSO? ()
	<FORM ZERO? <CHTYPE GL-NOW-PRSI? GVAL>>
>

;-----------------------------------------------------------------------------
; "MC-THIS-PRSI?"
;-----------------------------------------------------------------------------

<DEFMAC MC-THIS-PRSI? ()
	<FORM NOT <FORM ZERO? <CHTYPE GL-NOW-PRSI? GVAL>>>
>

;-----------------------------------------------------------------------------
; "MC-HERE?"
;-----------------------------------------------------------------------------

<DEFMAC MC-HERE? ("ARGS" ATMS)
	<MULTIFROB GL-PLACE-CUR .ATMS>
>

;-----------------------------------------------------------------------------
; "MC-LISTEN?"
;-----------------------------------------------------------------------------

<DEFMAC MC-LISTEN? ("ARGS" ATMS)
	<MULTIFROB GL-LISTEN-OBJ .ATMS>
>

;-----------------------------------------------------------------------------
; "MC-PROB"
;-----------------------------------------------------------------------------

<DEFMAC MC-PROB ('BASE?)
	<FORM NOT <FORM L? .BASE? '<RANDOM 100>>>
>

;-----------------------------------------------------------------------------
; "MC-GET/B"
;-----------------------------------------------------------------------------

<DEFMAC MC-GET/B ('TBL 'PTR)
	<FORM GET .TBL .PTR>
>

;-----------------------------------------------------------------------------
; "MC-RMGL-SIZE"
;-----------------------------------------------------------------------------

<DEFMAC MC-RMGL-SIZE ('TBL)
	<FORM - <FORM / <FORM PTSIZE .TBL> 2> 1>
>

;-----------------------------------------------------------------------------
; "MC-ABS"
;-----------------------------------------------------------------------------

<DEFMAC MC-ABS ('NUM)
	<FORM COND
      (<FORM L? .NUM 0>
   	  	<FORM - 0 .NUM>
  		)
  		(T
  			.NUM
  		)
	>
>

;-----------------------------------------------------------------------------
; "MC-SPACE"
;-----------------------------------------------------------------------------

<DEFMAC MC-SPACE ()
	<FORM PRINTC 32>
>

;-----------------------------------------------------------------------------
; "MC-QUOTE?"
;-----------------------------------------------------------------------------

<DEFMAC MC-QUOTE? ()
	<FORM
		COND
			(<FORM NOT <FORM EQUAL?
					<CHTYPE GL-WINNER GVAL>
					<CHTYPE CH-PLAYER GVAL>>
					>
					    <FORM PRINTC 34>
			)
	>
> 

;-----------------------------------------------------------------------------
; "MC-MAKE"
;-----------------------------------------------------------------------------

<DEFMAC MC-MAKE ('OBJ 'FLAG)
	<FORM FSET .OBJ .FLAG>
>

;-----------------------------------------------------------------------------
; "MC-UNMAKE"
;-----------------------------------------------------------------------------

<DEFMAC MC-UNMAKE ('OBJ 'FLAG)
	<FORM FCLEAR .OBJ .FLAG>
>

;-----------------------------------------------------------------------------
; "MC-IS?"
;-----------------------------------------------------------------------------

<DEFMAC MC-IS? ('OBJ 'FLAG)
	<FORM FSET? .OBJ .FLAG>
>

;-----------------------------------------------------------------------------
; "MC-ISNOT?"
;-----------------------------------------------------------------------------

<DEFMAC MC-ISNOT? ('OBJ 'FLAG)
	<FORM NOT <FORM FSET? .OBJ .FLAG>>
>

;-----------------------------------------------------------------------------
; "MC-NOTZERO?"
;-----------------------------------------------------------------------------

<DEFMAC MC-NOTZERO? ('TERM)
	<FORM NOT <FORM ZERO? .TERM>>
>

;-----------------------------------------------------------------------------
; "MC-T?"
;-----------------------------------------------------------------------------

<DEFMAC MC-T? ('TERM)
	<FORM NOT <FORM ZERO? .TERM>>
>

;-----------------------------------------------------------------------------
; "MC-THIS-WINNER?"
;-----------------------------------------------------------------------------

<DEFMAC MC-THIS-WINNER? ()
	<FORM EQUAL? '.CONTEXT ',K-M-WINNER>
>

;-----------------------------------------------------------------------------
; "MC-F?"
;-----------------------------------------------------------------------------

<DEFMAC MC-F? ('TERM)
	<FORM ZERO? .TERM>
>

;-----------------------------------------------------------------------------
; "MC-GET-RM-EXIT-DEST"
;-----------------------------------------------------------------------------

<DEFMAC MC-GET-RM-EXIT-DEST ('PT)
	<FORM GET .PT ',K-REXIT>
>

;-----------------------------------------------------------------------------
; "MC-GET-RM-EXIT-DOOR"
;-----------------------------------------------------------------------------

<DEFMAC MC-GET-RM-EXIT-DOOR ('PT)
	<FORM GET .PT ',K-DEXITOBJ>
>

;*****************************************************************************
; "end of file"
;*****************************************************************************

