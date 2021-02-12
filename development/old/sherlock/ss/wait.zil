;*****************************************************************************
; "game : SHERLOCK!"
; "file : WAIT.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   26 Oct 1987  4:08:44  $"
; "rev  : $Revision:   1.13  $"
; "vers : 1.00"
;*****************************************************************************

;------------------------------------------------------------------------------
; "RT-NUMBER?"
;------------------------------------------------------------------------------

<ROUTINE RT-NUMBER? (PTR "AUX" TMP CNT BPTR (TPTR ,K-HRS) CHR (SUM 0) (TIM <>) ;(DOLLAR <>))
	<SET TMP <REST ,GL-P-P-LEX <* .PTR 2>>>
   <SET CNT <GETB .TMP 2>>
   <SET BPTR <GETB .TMP 3>>

   <REPEAT ()
      <COND
         (<DLESS? CNT 0>
            <RETURN>
         )
         (T
            <SET CHR <GETB ,GL-P-PIBUF .BPTR>>
            <COND
               (<EQUAL? .CHR %<ASCII !\:>>
						<PUT ,GL-P-TIME .TPTR .SUM>
						<COND
							(<EQUAL? .TPTR ,K-HRS>
								<COND
									(<G? .SUM 23>
										<RFALSE>
									)
								>
								<SET TPTR ,K-MIN>
							)
							(<EQUAL? .TPTR ,K-MIN>
								<RFALSE>
							)
							(<EQUAL? .TPTR ,K-SEC>
								<RFALSE>
							)
						>
                  <SET TIM T>
                  <SET SUM 0>
               )
               (<G? .SUM 9999>
                  <RFALSE>
               )
;					(<EQUAL? .CHR ,K-CURRENCY-SYMBOL>
						<SET DOLLAR T>
					)
               (<OR  <G? .CHR %<ASCII !\9>>
                     <L? .CHR %<ASCII !\0>>
						>
						<RFALSE>
               )
               (T
                  <SET SUM <+ <* .SUM 10> <- .CHR %<ASCII !\0>>>>
               )
            >
            <SET BPTR <+ .BPTR 1>>
         )
      >
   >
	<COND
		(<MC-T? .TIM>
			<PUT ,GL-P-TIME .TPTR .SUM>
			<COND
				(<EQUAL? .TPTR ,K-HRS>
					<RFALSE>
				)
				(<EQUAL? .TPTR ,K-MIN>
					<COND
						(<OR	<L? .SUM 0>
								<G? .SUM 59>
							>
							<RFALSE>
						)
					>
				)
				(<EQUAL? .TPTR ,K-SEC>
					<RFALSE>
				)
			>
		)
		(T
			<PUT ,GL-P-TIME ,K-HRS .SUM>
			<PUT ,GL-P-TIME ,K-MIN 0>
			<PUT ,GL-P-TIME ,K-SEC 0>
		)
	>

   <RT-CHANGE-LEXV .PTR ,W?INTNUM>

   <COND
      (<G? .SUM 9999>
         <RFALSE>
      )
      (<MC-T? .TIM>
         <SET SUM 0>
      )
   >

;	<SETG GL-P-DOLLAR-FLAG .DOLLAR>
	<SETG GL-P-TIME-FLAG .TIM>

   <COND
;		(<AND <MC-T? .DOLLAR>
				<G? .SUM 0>
			>
			<SETG GL-P-AMOUNT .SUM>
			,W?MONEY
		)
      (T
         <SETG GL-P-NUMBER .SUM>
         ,W?INTNUM
      )
   >
>

;-----------------------------------------------------------------------------
; "V-WAIT-FOR"
;-----------------------------------------------------------------------------

<ROUTINE V-WAIT-FOR ("AUX" H M S N)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-VERB "V-WAIT-FOR">
		)
		(T
		)
	>
	<COND
		(<MC-PRSO? ,TH-MINUTE ,TH-HOUR>
			<SET N ,GL-P-NUMBER>
			<COND
				(<EQUAL? .N -1>
					<SET N 1>
				)
			>
			<COND
				(<MC-PRSO? ,TH-MINUTE>
					<SET H 0>
					<SET M .N>
				)
				(T
					<SET H .N>
					<SET M 0>
				)
			>
			<SET S 0>
			<TELL "Time passes..." CR>
			<RT-CLOCK-JMP .H .M .S>
		)
		(<AND <MC-F? ,GL-P-TIME-FLAG>
				<NOT <MC-PRSO? ,TH-INTNUM>>
			>
			<RT-CYOU-MSG>
			<TELL ,K-CANT-WAIT-MSG CR>
			<MC-RFATAL>
		)
		(T
			<SET H <GET ,GL-P-TIME ,K-HRS>>
			<SET M <GET ,GL-P-TIME ,K-MIN>>
			<SET S <GET ,GL-P-TIME ,K-SEC>>
			<COND
				(<AND <MC-PRSO? ,TH-INTNUM>
						<MC-F? ,GL-P-TIME-FLAG>
					>
					<TELL "[" N .H ":00]" CR CR>
				)
			>
			<COND
				(<G? .H 23>
					<RT-CYOU-MSG>
					<TELL ,K-CANT-WAIT-MSG CR>
					<MC-RFATAL>
				)
				(<G? .H 12>
					; "24 hour notation"
					<SET H <- .H <GET ,GL-TIME ,K-HRS>>>
					<SET M <- .M <GET ,GL-TIME ,K-MIN>>>
					<SET S <- .S <GET ,GL-TIME ,K-SEC>>>
				)
				(T
					; "12 hour notation"
					<SET H
						<- .H
							<+ <MOD
									<- <GET ,GL-TIME ,K-HRS>
										1
									>
									12
								>
								1
							>
						>
					>
					<SET M <- .M <GET ,GL-TIME ,K-MIN>>>
					<SET S <- .S <GET ,GL-TIME ,K-SEC>>>
				)
			>
			<REPEAT ()
				<COND
					(<L? .S 0>
						<SET S <+ .S 60>>
						<SET M <- .M 1>>
					)
					(<G=? .S 60>
						<SET S <- .S 60>>
						<SET M <+ .M 1>>
					)
					(T
						<RETURN>
					)
				>
			>
			<REPEAT ()
				<COND
					(<L? .M 0>
						<SET M <+ .M 60>>
						<SET H <- .H 1>>
					)
					(<G=? .M 60>
						<SET M <- .M 60>>
						<SET H <+ .H 1>>
					)
					(T
						<RETURN>
					)
				>
			>
			<REPEAT ()
				<COND
					(<G=? .H 0>
						<RETURN>
					)
				>
				<SET H <+ .H 12>>
			>
			<COND
				(<AND <ZERO? .H>
						<ZERO? .M>
						<ZERO? .S>
					>
					<TELL "It is">
					<COND
						(<G? <+ <MOD <- <GET ,GL-TIME ,K-HRS> 1> 12> 1> 9>
							<TELL " ">
						)
					>
					<RT-CLK-NTI-MSG
						<BOR
							,K-NTI-HH
							,K-NTI-MM
						>
					>
					<TELL " now." CR>
					<MC-RFATAL>
				)
				(T
					<TELL "Time passes..." CR>
					<RT-CLOCK-JMP .H .M .S>
				)
			>
			<RTRUE>
		)
	>
>

;*****************************************************************************
; "Constant strings"
;*****************************************************************************

<CONSTANT K-CANT-WAIT-MSG
"can't wait for that."
>

;*****************************************************************************
; "end of file"
;*****************************************************************************

