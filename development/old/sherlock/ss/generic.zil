;*****************************************************************************
; "game : SHERLOCK!"
; "file : GENERIC.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   28 Oct 1987 15:50:50  $"
; "rev  : $Revision:   1.25  $"
; "vers : 1.00"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-GN-PAPER"
;-----------------------------------------------------------------------------

<ROUTINE RT-GN-PAPER
	(TBL "OPTIONAL" (LEN 0) "AUX" PTR OBJ PAPER
		(CONT <>) (C-PAPER <>)
		(HELD <>) (H-PAPER <>)
		(GND <>)  (G-PAPER <>)
	)

	<COND
		(<ZERO? .LEN>
			<SET LEN <GET .TBL 0>>
		)
	>
	<SET PTR <REST .TBL 2>>
	<COND
		(<INTBL? ,GL-P-IT-OBJECT .PTR .LEN>
			<TELL "[" CTHE ,GL-P-IT-OBJECT "]" CR CR>
			<RETURN ,GL-P-IT-OBJECT>
		)
		(T
			<REPEAT ()
				<COND
					(<G? .PTR <REST .TBL <* .LEN 2>>>
						<RETURN>
					)
					(T
						<SET OBJ <GET .PTR 0>>
					)
				>
				<COND
				; "If the paper is on a surface (i.e. tomb), use it."
					(<MC-IS? <LOC .OBJ> ,FL-SURFACE>
						<RETURN>
					)
				; "Check for single held paper."
					(<EQUAL? <LOC .OBJ> ,CH-PLAYER>
						<COND
							(<MC-F? .HELD>
								<SET HELD T>
								<SET H-PAPER .OBJ>
							)
							(T
								<SET H-PAPER <>>
							)
						>
					)
				; "Check for single paper on ground/floor."
					(<EQUAL? <LOC .OBJ> ,GL-PLACE-CUR>
						<COND
							(<MC-F? .GND>
								<SET GND T>
								<SET G-PAPER .OBJ>
							)
							(T
								<SET G-PAPER <>>
							)
						>
					)
				; "Find first contained paper."
					(<AND	<MC-F? .CONT>
							<MC-IS? <LOC .OBJ> ,FL-CONTAINER>
						>
						<SET CONT <LOC .OBJ>>
						<SET C-PAPER .OBJ>
					)
				; "Check for paper in a different container."
					(<AND <MC-IS? <LOC .OBJ> ,FL-CONTAINER>
							<MC-T? .CONT>
							<NOT <EQUAL? <LOC .OBJ> .CONT>>
						>
						<SET C-PAPER <>>
					)
				>
				<SET PTR <REST .PTR 2>>
			>
			<COND
				(<AND	<MC-T? .OBJ>
						<MC-IS? <LOC .OBJ> ,FL-SURFACE>
					>
					<SET PAPER .OBJ>
				)
				(<MC-T? .H-PAPER>
					<SET PAPER .H-PAPER>
				)
				(<MC-T? .G-PAPER>
					<SET PAPER .G-PAPER>
				)
				(<MC-T? .C-PAPER>
					<SET PAPER .C-PAPER>
				)
				(T
					<RFALSE>
				)
			>
			<TELL "[" CTHE .PAPER "]" CR CR>
			<RETURN .PAPER>
		)
	>		
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-GN-GEM"
;-----------------------------------------------------------------------------

<ROUTINE RT-GN-GEM
	(TBL "OPTIONAL" (LEN 0) "AUX" PTR OBJ GEM
		(CONT <>) (C-GEM <>)
		(HELD <>) (H-GEM <>)
		(GND <>)  (G-GEM <>)
	)

	<COND
		(<ZERO? .LEN>
			<SET LEN <GET .TBL 0>>
		)
	>
	<SET PTR <REST .TBL 2>>
	<COND
		(<INTBL? ,GL-P-IT-OBJECT .PTR .LEN>
			<TELL "[" CTHE ,GL-P-IT-OBJECT "]" CR CR>
			<RETURN ,GL-P-IT-OBJECT>
		)
		(<AND <MC-HERE? RM-CLOCK-TOWER>
				<IN? ,TH-SAPPHIRE ,TH-CLAPPER>
			>
			<RETURN ,TH-SAPPHIRE>
		)
		(T
			<REPEAT ()
				<COND
					(<G? .PTR <REST .TBL <* .LEN 2>>>
						<RETURN>
					)
					(T
						<SET OBJ <GET .PTR 0>>
					)
				>
				<COND
				; "Check for single held gem."
					(<EQUAL? <LOC .OBJ> ,CH-PLAYER>
						<COND
							(<MC-F? .HELD>
								<SET HELD T>
								<SET H-GEM .OBJ>
							)
							(T
								<SET H-GEM <>>
							)
						>
					)
				; "Check for single gem on ground/floor."
					(<EQUAL? <LOC .OBJ> ,GL-PLACE-CUR>
						<COND
							(<MC-F? .GND>
								<SET GND T>
								<SET G-GEM .OBJ>
							)
							(T
								<SET G-GEM <>>
							)
						>
					)
				; "Find first contained gem."
					(<AND	<MC-T? <LOC .OBJ>>
							<MC-F? .CONT>
							<MC-IS? <LOC .OBJ> ,FL-CONTAINER>
						>
						<SET CONT <LOC .OBJ>>
						<SET C-GEM .OBJ>
					)
				; "Check for gem in a different container."
					(<AND <MC-T? <LOC .OBJ>>
							<MC-IS? <LOC .OBJ> ,FL-CONTAINER>
							<MC-T? .CONT>
							<NOT <EQUAL? <LOC .OBJ> .CONT>>
						>
						<SET C-GEM <>>
					)
				>
				<SET PTR <REST .PTR 2>>
			>
			<COND
			; "Return single held gem."
				(<MC-T? .H-GEM>
					<SET GEM .H-GEM>
				)
			; "Return single gem on ground/floor."
				(<MC-T? .G-GEM>
					<SET GEM .G-GEM>
				)
			; "Return first gem in container."
				(<MC-T? .C-GEM>
					<SET GEM .C-GEM>
				)
				(T
					<RFALSE>
				)
			>
			<TELL "[" CTHE .GEM "]" CR CR>
			<RETURN .GEM>
		)
	>		
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-GN-PIGEON"
;-----------------------------------------------------------------------------

<ROUTINE RT-GN-PIGEON (TBL "OPTIONAL" (LEN 0))
	<COND
		(<MC-ISNOT? ,CH-TRAINED-PIGEON ,FL-ALIVE>
			<TELL "[" CTHE ,TH-DEAD-PIGEON "]" CR CR>
			<RETURN ,TH-DEAD-PIGEON>
		)
		(T
			<TELL "[" CTHE ,CH-TRAINED-PIGEON "]" CR CR>
			<RETURN ,CH-TRAINED-PIGEON>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-GN-OAR"
;-----------------------------------------------------------------------------

<ROUTINE RT-GN-OAR (TBL "OPTIONAL" (LEN 0))
	<COND
		(<EQUAL? ,GL-P-IT-OBJECT ,TH-OAR-1 ,TH-OAR-2>
			<TELL "[" CTHE ,GL-P-IT-OBJECT "]" CR CR>
			<RETURN ,GL-P-IT-OBJECT>
		)
		(T
			<TELL "[" CTHE ,TH-OAR-2 "]" CR CR>
			<RETURN ,TH-OAR-2>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-GN-BOX"
;-----------------------------------------------------------------------------

<ROUTINE RT-GN-BOX (TBL "OPTIONAL" (LEN 0) "AUX" PTR)
	<COND
		(<ZERO? .LEN>
			<SET LEN <GET .TBL 0>>
		)
	>
	<SET PTR <REST .TBL 2>>
	<COND
		(<INTBL? ,GL-P-IT-OBJECT .PTR .LEN>
			<TELL "[" CTHE ,GL-P-IT-OBJECT "]" CR CR>
			<RETURN ,GL-P-IT-OBJECT>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-GN-HOLMES"
;-----------------------------------------------------------------------------

<ROUTINE RT-GN-HOLMES (TBL "OPTIONAL" (LEN 0))
	<COND
		(<AND <MC-HERE? ,RM-DIOGENES-CLUB>
				<NOT <IN? ,CH-MYCROFT-HOLMES ,RM-DIOGENES-CLUB>>
			>
			<RETURN ,CH-MYCROFT-HOLMES>
		)
		(T
			<RETURN ,CH-HOLMES>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-GN-ROOM"
;-----------------------------------------------------------------------------

;<ROUTINE RT-GN-ROOM (TBL "OPTIONAL" (LEN 0) "AUX" PT PTS STR OBJ (RM <>) DIR TMP)
	<TELL
"Because the generic room routine has not yet been
implemented, you are about to get a series of unfortunate messages." CR CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-GN-DOOR"
;-----------------------------------------------------------------------------

<ROUTINE RT-GN-DOOR (TBL "OPTIONAL" (LEN 0) "AUX" PTR (OBJ <>) (DOOR <>))
	<COND
		(<ZERO? .LEN>
			<SET LEN <GET .TBL 0>>
		)
	>
	<SET PTR <REST .TBL 2>>
	<REPEAT ()
		<COND
			(<G? .PTR <REST .TBL <* .LEN 2>>>
				<RETURN>
			)
			(T
				<SET OBJ <GET .PTR 0>>
			)
		>
		<COND
			(<MC-VERB? OPEN>
				<COND
					(<MC-ISNOT? .OBJ ,FL-OPENED>
						<COND
							(<MC-F? .DOOR>
								<SET DOOR .OBJ>
							)
							(T
								<RFALSE>
							)
						>
					)
				>
			)
			(<MC-VERB? CLOSE>
				<COND
					(<MC-IS? .OBJ ,FL-OPENED>
						<COND
							(<MC-F? .DOOR>
								<SET DOOR .OBJ>
							)
							(T
								<RFALSE>
							)
						>
					)
				>
			)
		>
		<SET PTR <REST .PTR 2>>
	>
	<COND
		(<MC-T? .DOOR>
			<TELL "[" CTHE .DOOR "]" CR CR>
		)
	>
	<RETURN .DOOR>
>

;-----------------------------------------------------------------------------
; "RT-GN-BOTTLE"
;-----------------------------------------------------------------------------

<ROUTINE RT-GN-BOTTLE (TBL "OPTIONAL" (LEN 0) "AUX" PTR OBJ (BOTTLE <>))
	<COND
		(<ZERO? .LEN>
			<SET LEN <GET .TBL 0>>
		)
	>
	<SET PTR <REST .TBL 2>>
	<REPEAT ()
		<COND
			(<G? .PTR <REST .TBL <* .LEN 2>>>
				<RETURN>
			)
			(T
				<SET OBJ <GET .PTR 0>>
			)
		>
		<COND
			(<OR	<AND
						<MC-VERB? OPEN>
						<MC-THIS-PRSO?>
						<MC-ISNOT? .OBJ ,FL-OPENED>
					>
					<AND
						<MC-VERB? CLOSE>
						<MC-THIS-PRSO?>
						<MC-IS? .OBJ ,FL-OPENED>
					>
					<AND
						<MC-VERB? PUT>
						<MC-THIS-PRSI?>
						<MC-IS? .OBJ ,FL-OPENED>
					>
				>
				<COND
					(<MC-F? .BOTTLE>
						<SET BOTTLE .OBJ>
					)
					(T
						<RFALSE>
					)
				>
			)
		>
		<SET PTR <REST .PTR 2>>
	>
	<COND
		(<MC-T? .BOTTLE>
			<TELL "[" CTHE .BOTTLE "]" CR CR>
		)
	>
	<RETURN .BOTTLE>
>

;-----------------------------------------------------------------------------
; "RT-GN-PILL"
;-----------------------------------------------------------------------------

<ROUTINE RT-GN-PILL (TBL "OPTIONAL" (LEN 0) "AUX" PTR OBJ (PILL <>))
	<COND
		(<ZERO? .LEN>
			<SET LEN <GET .TBL 0>>
		)
	>
	<SET PTR <REST .TBL 2>>
	<COND
		(<INTBL? ,GL-PRSA <REST ,GL-TOUCH-VERBS 2> <GET ,GL-TOUCH-VERBS 0>>
			<REPEAT ()
				<COND
					(<G? .PTR <REST .TBL <* .LEN 2>>>
						<RETURN>
					)
					(T
						<SET OBJ <GET .PTR 0>>
					)
				>
				<COND
					(<RT-ACCESSIBLE? .OBJ>
						<COND
							(<MC-F? .PILL>
								<SET PILL .OBJ>
							)
							(T
								<RFALSE>
							)
						>
					)
				>
				<SET PTR <REST .PTR 2>>
			>
		)
	>
	<COND
		(<MC-T? .PILL>
			<TELL "[" CTHE .PILL "]" CR CR>
		)
	>
	<RETURN .PILL>
>

;-----------------------------------------------------------------------------
; "RT-GN-WALL"
;-----------------------------------------------------------------------------

<ROUTINE RT-GN-WALL ("OPTIONAL" TBL (LEN 0) "AUX" NUM WALL)
	<SET NUM <RANDOM 4>>
	<COND
		(<EQUAL? .NUM 1>
			<SET WALL ,TH-NORTH-WALL>
		)
		(<EQUAL? .NUM 2>
			<SET WALL ,TH-SOUTH-WALL>
		)
		(<EQUAL? .NUM 3>
			<SET WALL ,TH-EAST-WALL>
		)
		(<EQUAL? .NUM 4>
			<SET WALL ,TH-WEST-WALL>
		)
	>
	<RETURN .WALL>
>

;-----------------------------------------------------------------------------
; "RT-GN-BODY"
;-----------------------------------------------------------------------------

<ROUTINE RT-GN-BODY (TBL "OPTIONAL" (LEN 0) "AUX" PTR (OBJ <>))
	<COND
		(<ZERO? .LEN>
			<SET LEN <GET .TBL 0>>
		)
	>
	<SET PTR <REST .TBL 2>>
	<REPEAT ()
		<COND
			(<ZERO? .LEN>
				<RETURN>
			)
			(<MC-IS? <SET OBJ <GET .PTR 0>> ,FL-BODYPART>
				<RETURN>
			)
		>
		<SET PTR <REST .PTR 2>>
		<DEC LEN>
	>
	<RETURN .OBJ>
>

;-----------------------------------------------------------------------------
; "RT-GN-SCRATCH"
;-----------------------------------------------------------------------------

<ROUTINE RT-GN-SCRATCH
	(TBL "OPTIONAL" (LEN 0) "AUX" PTR OBJ SCRATCH
		(CONT <>) (C-SCRATCH <>)
		(HELD <>) (H-SCRATCH <>)
		(GND <>)  (G-SCRATCH <>)
	)

	<COND
		(<ZERO? .LEN>
			<SET LEN <GET .TBL 0>>
		)
	>
	<SET PTR <REST .TBL 2>>
	<COND
		(<INTBL? ,GL-P-IT-OBJECT .PTR .LEN>
			<TELL "[" CTHE ,GL-P-IT-OBJECT "]" CR CR>
			<RETURN ,GL-P-IT-OBJECT>
		)
		(<EQUAL? ,GL-P-IT-OBJECT ,TH-RUBY>
			<TELL "[" CTHE ,TH-RUBY-SCRATCH "]" CR CR>
			<RETURN ,TH-RUBY-SCRATCH>
		)
		(<EQUAL? ,GL-P-IT-OBJECT ,TH-EMERALD>
			<TELL "[" CTHE ,TH-EMERALD-SCRATCH "]" CR CR>
			<RETURN ,TH-EMERALD-SCRATCH>
		)
		(<EQUAL? ,GL-P-IT-OBJECT ,TH-SAPPHIRE>
			<TELL "[" CTHE ,TH-SAPPHIRE-SCRATCH "]" CR CR>
			<RETURN ,TH-SAPPHIRE-SCRATCH>
		)
		(<EQUAL? ,GL-P-IT-OBJECT ,TH-OPAL>
			<TELL "[" CTHE ,TH-OPAL-SCRATCH "]" CR CR>
			<RETURN ,TH-OPAL-SCRATCH>
		)
		(<EQUAL? ,GL-P-IT-OBJECT ,TH-TOPAZ>
			<TELL "[" CTHE ,TH-TOPAZ-SCRATCH "]" CR CR>
			<RETURN ,TH-TOPAZ-SCRATCH>
		)
		(<EQUAL? ,GL-P-IT-OBJECT ,TH-GARNET>
			<TELL "[" CTHE ,TH-GARNET-SCRATCH "]" CR CR>
			<RETURN ,TH-GARNET-SCRATCH>
		)
		(T
			<REPEAT ()
				<COND
					(<G? .PTR <REST .TBL <* .LEN 2>>>
						<RETURN>
					)
					(T
						<SET OBJ <GET .PTR 0>>
					)
				>
				<COND
				; "Check for single held gem."
					(<EQUAL? <LOC <LOC .OBJ>> ,CH-PLAYER>
						<COND
							(<MC-F? .HELD>
								<SET HELD T>
								<SET H-SCRATCH .OBJ>
							)
							(T
								<SET H-SCRATCH <>>
							)
						>
					)
				; "Check for single gem on ground/floor."
					(<EQUAL? <LOC <LOC .OBJ>> ,GL-PLACE-CUR>
						<COND
							(<MC-F? .GND>
								<SET GND T>
								<SET G-SCRATCH .OBJ>
							)
							(T
								<SET G-SCRATCH <>>
							)
						>
					)
				; "Find first contained gem."
					(<AND	<MC-T? <LOC <LOC .OBJ>>>
							<MC-F? .CONT>
							<MC-IS? <LOC <LOC .OBJ>> ,FL-CONTAINER>
						>
						<SET CONT <LOC <LOC .OBJ>>>
						<SET C-SCRATCH .OBJ>
					)
				; "Check for gem in a different container."
					(<AND <MC-T? <LOC <LOC .OBJ>>>
							<MC-IS? <LOC <LOC .OBJ>> ,FL-CONTAINER>
							<MC-T? .CONT>
							<NOT <EQUAL? <LOC <LOC .OBJ>> .CONT>>
						>
						<SET C-SCRATCH <>>
					)
				>
				<SET PTR <REST .PTR 2>>
			>
			<COND
			; "Return single held gem."
				(<MC-T? .H-SCRATCH>
					<SET SCRATCH .H-SCRATCH>
				)
			; "Return single gem on ground/floor."
				(<MC-T? .G-SCRATCH>
					<SET SCRATCH .G-SCRATCH>
				)
			; "Return first gem in container."
				(<MC-T? .C-SCRATCH>
					<SET SCRATCH .C-SCRATCH>
				)
				(T
					<RFALSE>
				)
			>
			<TELL "[" CTHE .SCRATCH "]" CR CR>
			<RETURN .SCRATCH>
		)
	>		
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-GN-INTNUM"
;-----------------------------------------------------------------------------

<ROUTINE RT-GN-INTNUM (TBL "OPTIONAL" (LEN 0))
	<COND
		(<MC-VERB? WAIT WAIT-FOR>
			<RETURN ,TH-INTNUM>
		)
		(T
			<RETURN ,TH-SAFETY-DEPOSIT-BOX>
		)
	>
>

;*****************************************************************************
; "end of file"
;*****************************************************************************

