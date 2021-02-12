;"***************************************************************************"
; "game : Arthur"
; "file : HINTS.ZIL"
; "auth :   $Author:   RAB  $"
; "date :     $Date:   04 May 1989 17:06:32  $"
; "revs : $Revision:   1.43  $"
; "vers : 1.0"
;"---------------------------------------------------------------------------"
; "Hints"
; "Copyright (C) 1988 Infocom, Inc.  All rights reserved."
;"***************************************************************************"

<FILE-FLAGS CLEAN-STACK?>

<GLOBAL GL-HINT-WARNING <> <> BYTE>
<GLOBAL GL-HINTS-OFF <> <> BYTE>

<SYNTAX HELP OFF OBJECT (FIND FL-ROOMS) = V-HINTS-NO>

<CONSTANT K-NO-HINTS-MSG "Hints have been disallowed for this session.">

<ROUTINE V-HINTS-NO ()
	<COND
		(<NOT <MC-PRSO? ,ROOMS>>
			<DONT-UNDERSTAND>
		)
		(T
			<SETG GL-HINTS-OFF T>
			<RT-AUTHOR-MSG ,K-NO-HINTS-MSG>
		)
	>
	<RFATAL>
>

%<DEBUG-CODE <SYNTAX $HINT = V-HINT>>

<ROUTINE V-HINT ("AUX" N (WHO <>))
	<COND
		(,GL-HINTS-OFF
			<RT-AUTHOR-MSG ,K-NO-HINTS-MSG>
		)
		(T
			<TELL
"You look inside the ball and see the hazy outline of a hint menu."
			>
			<COND
				(<NOT ,GL-HINT-WARNING>
					<SETG GL-HINT-WARNING T>
					<TELL
"||Merlin comes into the cave and says, \"You can get a hint simply by looking
in the crystal. But I know that sometimes you will be tempted to get a hint
before you really want or need to. Therefore, you may at any time during your
adventure type HINTS OFF, and I will make the crystal go dark. This will
disallow the seeking of help for the remainder of that session. If you still
want a hint now, then look once more into the crystal.\"||Merlin disappears.|"
					>
				)
				(T
					<TELL "..|">
					<INPUT 1 50 ,RT-STOP-READ>
					<DO-HINTS>
				;	<REPEAT ()
						<RT-INIT-HINT-SCREEN>
						<VERSION?
							(YZIP
								<CCURSET 5 1>
							)
							(T
								<CURSET 5 1>
							)
						>
						<RT-PUT-UP-QUESTIONS <>>	; "Put up chapters."
						<COND
							(<SET N <RT-SELECT-ONE ,GL-CHAPT-NUM>>
								<COND
									(<NOT <EQUAL? .N ,GL-CHAPT-NUM>>
										<SETG GL-QUEST-NUM 1>
									)
								>
								<SETG GL-CHAPT-NUM .N>
								<RT-PICK-QUESTION>
							)
							(T
								<RETURN>
							)
						>
					>
					<V-REFRESH <>>
				)
			>
		)
	>
	<RFATAL>
>

;[

<CONSTANT K-RETURN-SEE-HINT " RETURN = see hint">
<CONSTANT K-RETURN-SEE-HINT-LEN <LENGTH " RETURN = see hint">>

<CONSTANT K-Q-MAIN-MENU "Q = main menu">
<CONSTANT K-Q-MAIN-MENU-LEN <LENGTH "Q = main menu">>

<CONSTANT K-Q-RESUME-STORY "Q = Resume story">
<CONSTANT K-Q-RESUME-STORY-LEN <LENGTH "Q = Resume story">>

<CONSTANT K-INTELLI-HINTS "INTELLI-HINTS (tm)">
<CONSTANT K-INTELLI-HINTS-LEN <LENGTH "INTELLI-HINTS (tm)">>

<CONSTANT K-NEXT " N = Next">
<CONSTANT K-NEXT-LEN <LENGTH " N = Next">>

<CONSTANT K-PREVIOUS "P = Previous">
<CONSTANT K-PREVIOUS-LEN <LENGTH "P = Previous">>

;"zeroth (first) element is 5"
<GLOBAL GL-LINE-TABLE
	<PTABLE
		5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22
		5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22
	>
>

;"zeroth (first) element is 4"
<CONSTANT GL-COLUMN-TABLE
	<PTABLE
		3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3
	  23 23 23 23 23 23 23 23 23 23 23 23 23 23 23 23 23 23
	>
>

; "If the first argument is non-false, build a parallel impure table
   for storing the count of answers already seen; make it a constant
   under the given name."

<DEFINE20 CONSTRUCT-HINTS (COUNT-NAME "TUPLE" STUFF "AUX" (SS <>) (HL (T)) (HLL .HL) V (CL (T)) (CLL .CL) TCL TCLL)
	<REPEAT ((CT 0))
		<COND
			(<OR	<EMPTY? .STUFF>
					<TYPE? <1 .STUFF> STRING>
				>
				; "Chapter break"
				<COND
					(<NOT .SS>
						; "First one, just do setup"
						<SET SS .STUFF>
						<SET TCL (T)>
						<SET TCLL .TCL>
						<SET CT 0>
					)
					(T
						<SET V <SUBSTRUC .SS 0 <- <LENGTH .SS> <LENGTH .STUFF>>>>
						; "One chapter's worth"
						<SET HLL <REST <PUTREST .HLL (<EVAL <FORM PLTABLE !.V>>)>>>
						<COND
							(.COUNT-NAME
								<SET CLL
									<REST
										<PUTREST .CLL
											(<EVAL <FORM TABLE (BYTE) !<REST .TCL>>>)
										>
									>
								>
								<SET TCL (T)>
								<SET TCLL .TCL>
								<SET CT 0>
							)
						>
						<SET SS .STUFF>
					)
				>
				<COND
					(<EMPTY? .STUFF>
						<RETURN>
					)
				>
				<SET STUFF <REST .STUFF>>
			)
			(T
				<COND
					(.COUNT-NAME
						<COND
							(<1? <MOD <SET CT <+ .CT 1>> 2>>
								<SET TCLL <REST <PUTREST .TCLL (0)>>>
							)
						>
					)
				>
				<SET STUFF <REST .STUFF>>
			)
		>
	>
	<COND
		(.COUNT-NAME
			<EVAL
				<FORM CONSTANT .COUNT-NAME
					<EVAL <FORM PTABLE !<REST .CL>>>
				>
			>
		)
	>
	<EVAL <FORM PLTABLE !<REST .HL>>>
>

;"shows in HINT-TBL ltable which QUESTION it's on."
<GLOBAL GL-QUEST-NUM 1 <> BYTE>

;"shows in HINT-TBL ltable which CHAPTER it's on."
<GLOBAL GL-CHAPT-NUM 1 <> BYTE>

<ROUTINE RT-SELECT-ONE (N "AUX" (Q 1) P (MAX <ZGET ,K-HINT-ITEMS 0>))
	<REPEAT ((I 0))
		<COND
			(<IGRTR? I .MAX>
				<RETURN>
			)
			(<EQUAL? .N <ZGET ,K-HINT-ITEMS .I>>
				<SET Q .I>
				<RETURN>
			)
		>
	>
	<RT-NEW-CURSOR .Q>
	<REPEAT (CHR)
		<SET CHR <INPUT 1>>
		<COND
			(<EQUAL? .CHR ,K-CLICK1 ,K-CLICK2>
				<COND
					(<SET P <RT-MOUSE-SELECT>>
						<COND
							(<NOT <EQUAL? .P .Q>>
								<RT-ERASE-CURSOR .Q>
								<COND
									(<G? .P 0>
										<SET Q .P>
									)
									(<EQUAL? .P -1>	; "Clicked next"
										<COND
											(<EQUAL? .Q .MAX> ; "Wrap around on N"
												<SET Q 1>
											)
											(T
												<INC Q>
											)
										>
									)
									(<EQUAL? .P -2>	; "Clicked previous"
										<COND
											(<EQUAL? .Q 1>
												<SET Q .MAX>
											)
											(T
												<DEC Q>
											)
										>
									)
									(<EQUAL? .P -3>	; "Clicked see hint"
										<RETURN>
									)
									(<EQUAL? .P -4>	; "Clicked quit"
										<RFALSE>
									)
								>
								<RT-NEW-CURSOR .Q>
							)
						>
						<COND
							(<G? .P 0>
								<COND
									(<EQUAL? .CHR ,K-CLICK2>
										<RETURN>
									)
								>
							)
						>
					)
				>
			)
			(<EQUAL? .CHR !\Q !\q 27>
				<RFALSE>
			)
			(<EQUAL? .CHR !\N !\n ,K-DOWN>
				<RT-ERASE-CURSOR .Q>
				<COND
					(<EQUAL? .Q .MAX> ; "Wrap around on N"
						<SET Q 1>
					)
					(T
						<INC Q>
					)
				>
				<RT-NEW-CURSOR .Q>
			)
			(<EQUAL? .CHR !\P !\p ,K-UP>
				<RT-ERASE-CURSOR .Q>
				<COND
					(<EQUAL? .Q 1>
						<SET Q .MAX>
					)
					(T
						<DEC Q>
					)
				>
				<RT-NEW-CURSOR .Q>
			)
			(<EQUAL? .CHR 13 10 !\ >
				<RETURN>
			)
		>
	>
	<RETURN <GET ,K-HINT-ITEMS .Q>>
>

<ROUTINE RT-MOUSE-SELECT ("OPT" (HINT? <>) "AUX" X Y N)
	<SET Y </ <LOWCORE MSLOCY> ,GL-FONT-Y>>
	<SET X </ <LOWCORE MSLOCX> ,GL-FONT-X>>
	<COND
		(<EQUAL? .Y 2>
			<COND
				(.HINT?
					<RFALSE>
				)
				(<L? .X </ <LOWCORE SCRH> 2>>
					<RETURN -1>
				)
				(T
					<RETURN -2>
				)
			>
		)
		(<EQUAL? .Y 3>
			<COND
				(<L? .X </ <LOWCORE SCRH> 2>>
					<RETURN -3>
				)
				(T
					<RETURN -4>
				)
			>
		)
		(.HINT?
			<RFALSE>
		)
		(<AND <G=? .Y 5>
				<L=? .Y 22>
			>
			<SET N <- .Y 4>>
			<COND
				(<G=? .X 23>
					<SET N <+ .N 18>>
				)
			>
			<RETURN .N>
		)
	>
>

<ROUTINE RT-PICK-QUESTION ("AUX" N)
	<RT-INIT-HINT-SCREEN <>>
	<RT-JUSTIFY-LINE 3 ,K-RETURN-SEE-HINT ,K-J-LEFT>
	<RT-JUSTIFY-LINE 3 ,K-Q-MAIN-MENU ,K-J-RIGHT ,K-Q-MAIN-MENU-LEN>
	<VERSION?
		(YZIP
			<CCURSET 5 1>
		)
		(T
			<CURSET 5 1>
		)
	>
	<RT-PUT-UP-QUESTIONS>
	<COND
		(<SET N <RT-SELECT-ONE ,GL-QUEST-NUM>>
			<SETG GL-QUEST-NUM .N>
			<RT-DISPLAY-HINT>
			<AGAIN>
		)
	>
>

<ROUTINE RT-ERASE-CURSOR (N)
	<DEC N>
	<VERSION?
		(YZIP
			<CCURSET
				<GET ,GL-LINE-TABLE .N>
				<- <GET ,GL-COLUMN-TABLE .N> 2>
			>
		)
		(T
			<CURSET
				<GET ,GL-LINE-TABLE .N>
				<- <GET ,GL-COLUMN-TABLE .N> 2>
			>
		)
	>
	<TELL " ">	; "erase previous highlight cursor"
>

; "go back 2 spaces from question text, print cursor and flash is between
	the cursor and text"

<ROUTINE RT-NEW-CURSOR (N)
	<DEC N>
	<VERSION?
		(YZIP
			<CCURSET
				<GET ,GL-LINE-TABLE .N>
				<- <GET ,GL-COLUMN-TABLE .N> 2>
			>
		)
		(T
			<CURSET
				<GET ,GL-LINE-TABLE .N>
				<- <GET ,GL-COLUMN-TABLE .N> 2>
			>
		)
	>
	<TELL ">">	; "print the new cursor"
>

<ROUTINE RT-INVERSE-LINE ("AUX" TBL N)
	<HLIGHT ,K-H-INV>
	<SET N ,GL-SCR-WID>
	<SET TBL <REST ,K-DIROUT-TBL 2>>
	<PUTB .TBL 0 !\ >
	<COPYT .TBL <REST .TBL 1> <- .N>>
	<PRINTT .TBL .N>
	<HLIGHT ,K-H-NRM>
>

<ROUTINE RT-DISPLAY-HINT ("AUX" H MX (CNT 3) CHR (FLG T) N P CV SHIFT? COUNT-OFFS)
	<CLEAR -1>
	<VERSION?
		(YZIP
			<CSPLIT 3>
		)
		(T
			<SPLIT 3>
		)
	>
	<SCREEN ,K-S-WIN>
	<VERSION?
		(YZIP
			<CCURSET 1 1>
		)
		(T
			<CURSET 1 1>
		)
	>
	<RT-INVERSE-LINE>
	<RT-JUSTIFY-LINE 1 ,K-INTELLI-HINTS ,K-J-CENTER ,K-INTELLI-HINTS-LEN>
	<VERSION?
		(YZIP
			<CCURSET 2 1>
		)
		(T
			<CURSET 2 1>
		)
	>
	<RT-INVERSE-LINE>
	<HLIGHT ,K-H-BLD>
	<SET H <GET <GET ,K-HINTS ,GL-CHAPT-NUM> <+ ,GL-QUEST-NUM 1>>>
	; "Byte table to use for showing questions already seen"
	; "Actually a nibble table. The high four bits of each byte are for
      quest-num odd; the low for bits are for quest-num even. See SHIFT?
      and COUNT-OFFS."
	<SET CV <GET ,K-HINT-COUNTS <- ,GL-CHAPT-NUM 1>>>
	<RT-JUSTIFY-LINE 2 <GET .H 2> ,K-J-CENTER>
	<HLIGHT ,K-H-NRM>
	<VERSION?
		(YZIP
			<CCURSET 3 1>
		)
		(T
			<CURSET 3 1>
		)
	>
	<RT-INVERSE-LINE>
	<RT-JUSTIFY-LINE 3 "RETURN = see new hint" ,K-J-LEFT>
	<RT-JUSTIFY-LINE 3 "Q = see hint menu" ,K-J-RIGHT %<LENGTH "Q = see hint menu">>
	<SET MX <GET .H 0>>
	<SCREEN ,K-S-NOR>
	<CRLF>
	<SET SHIFT? <MOD ,GL-QUEST-NUM 2>>
	<SET COUNT-OFFS </ <- ,GL-QUEST-NUM 1> 2>>
	<REPEAT ((CURCX <GETB .CV .COUNT-OFFS>)
		(CURC <+ 2 <ANDB <COND (.SHIFT? <LSH .CURCX -4>) (T .CURCX)> *17*>>))
		<COND
			(<G=? .CNT .CURC>
				<RETURN>
			)
			(T
				<TELL <GET .H .CNT> CR ;CR>
				<SET CNT <+ .CNT 1>>
			)
		>
	>
	<REPEAT ()
		<COND
			(<AND .FLG <G? .CNT .MX>>
				<SET FLG <>>
				<TELL "[That's all.]" CR>
			)
			(.FLG
				<SET N <+ <- .MX .CNT> 1>>
				<TELL N .N ;" hint">
			;	<COND
					(<NOT <EQUAL? .N 1>>
						<TELL "s">
					)
				>
				<TELL " left > ">
				<SET FLG <>>
			)
		>
		<REPEAT ()
			<SET CHR <INPUT 1>>
			<COND
				(<EQUAL? .CHR ,K-CLICK1 ,K-CLICK2>
					<COND
						(<SET P <RT-MOUSE-SELECT T>>
							<COND
								(<EQUAL? .P -3>
									<SET CHR 13>
								)
								(<EQUAL? .P -4>
									<SET CHR !\Q>
								)
							>
						)
					>
				)
			>
			<COND
				(<EQUAL? .CHR !\Q !\q 27 13 10 !\ >
					<RETURN>
				)
			>
		>
		<COND
			(<EQUAL? .CHR !\Q !\q 27>
				<COND
					(.SHIFT?
						<PUTB .CV .COUNT-OFFS
							<ORB
								<ANDB <GETB .CV .COUNT-OFFS> *17*>
								<LSH <- .CNT 2> 4>
							>
						>
					)
					(T
						<PUTB .CV .COUNT-OFFS
							<ORB
								<ANDB <GETB .CV .COUNT-OFFS> *360*>
								<- .CNT 2>
							>
						>
					)
				>
				<RETURN>
			)
			(<EQUAL? .CHR 13 10 !\ >
				<COND
					(<L=? .CNT .MX>
						<SET FLG T>	;".cnt starts as 2"
						<TELL <GET .H .CNT> ;CR CR>
						; "3rd = line 7, 4th = line 9, ect"
						<COND
							(<IGRTR? CNT .MX>
								<SET FLG <>>
								<TELL "[Final hint]" CR>
							)
						>
					)
				>
			)
		>
	>
>

<CONSTANT K-HINT-ITEMS
	<TABLE
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	>
>

<ROUTINE RT-SEE-QST? (OBJ)
	<COND
		(<NOT .OBJ>
			T
		)
		(<OR	<L=? .OBJ 0>
				<G? .OBJ ,LAST-OBJECT>
			>
			<APPLY .OBJ>
		)
		(<IN? .OBJ ,ROOMS>
			<FSET? .OBJ ,FL-TOUCHED>
		)
		(T
			<FSET? .OBJ ,FL-SEEN>
		)
	>
>

<ROUTINE RT-PUT-UP-QUESTIONS ("OPT" (QST? T) "AUX" MXQ MXL)
	<COND
		(.QST?
			<SET MXQ <- <GET <GET ,K-HINTS ,GL-CHAPT-NUM> 0> 1>>
		)
		(T
			<SET MXQ <GET ,K-HINTS 0>>
		)
	>
	<SET MXL <- <LOWCORE SCRV> 1>>
	<REPEAT ((N 0) (QN 1) OBJ QST P?)
		<COND
			(<IGRTR? .N .MXQ>
				<RETURN>
			)
			(T
				<COND
					(.QST?
						<SET OBJ <GET <GET <GET ,K-HINTS ,GL-CHAPT-NUM> <+ .N 1>> 1>>
						<SET P? <RT-SEE-QST? .OBJ>>
					)
					(T
						<SET P? <>>
						<REPEAT ((I 0) (MAX <- <GET <GET ,K-HINTS .N> 0> 1>))
							<COND
								(<IGRTR? .I .MAX>
									<RETURN>
								)
								(T
									<SET OBJ <GET <GET <GET ,K-HINTS .N> <+ .I 1>> 1>>
									<COND
										(<SET P? <RT-SEE-QST? .OBJ>>
											<RETURN>
										)
									>
								)
							>
						>
					)
				>
				<COND
					(.P?
						<VERSION?
							(YZIP
								<CCURSET
									<GET ,GL-LINE-TABLE <- .QN 1>>
									<- <GET ,GL-COLUMN-TABLE <- .QN 1>> 1>
								>
							)
							(T
								<CURSET
									<GET ,GL-LINE-TABLE <- .QN 1>>
									<- <GET ,GL-COLUMN-TABLE <- .QN 1>> 1>
								>
							)
						>
						<COND
							(.QST?
								<SET QST <GET <GET <GET ,K-HINTS ,GL-CHAPT-NUM> <+ .N 1>> 2>>
							)
							(T
								<SET QST <GET <GET ,K-HINTS .N> 1>>
							)
						>
						<TELL " " .QST>
						<ZPUT ,K-HINT-ITEMS .QN .N>
						<ZPUT ,K-HINT-ITEMS 0 .QN>
						<INC QN>
					)
				>
			)
		>
	>
>

<ROUTINE RT-INIT-HINT-SCREEN ("OPTIONAL" (THIRD T))
	<CLEAR -1>
	<VERSION?
		(YZIP
			<CSPLIT <- <LOWCORE SCRV> 1>>
		)
		(T
			<SPLIT <- <LOWCORE SCRV> 1>>
		)
	>
	<SCREEN ,K-S-WIN>
	<VERSION?
		(YZIP
			<CCURSET 1 1>
		)
		(T
			<CURSET 1 1>
		)
	>
	<RT-INVERSE-LINE>
	<VERSION?
		(YZIP
			<CCURSET 2 1>
		)
		(T
			<CURSET 2 1>
		)
	>
	<RT-INVERSE-LINE>
	<VERSION?
		(YZIP
			<CCURSET 3 1>
		)
		(T
			<CURSET 3 1>
		)
	>
	<RT-INVERSE-LINE>
	<RT-JUSTIFY-LINE 1 ,K-INTELLI-HINTS ,K-J-CENTER ,K-INTELLI-HINTS-LEN>
	<RT-JUSTIFY-LINE 2 ,K-NEXT ,K-J-LEFT>
	<RT-JUSTIFY-LINE 2 ,K-PREVIOUS ,K-J-RIGHT ,K-PREVIOUS-LEN>
	<COND
		(.THIRD
			<RT-JUSTIFY-LINE 3 ,K-RETURN-SEE-HINT ,K-J-LEFT>
			<RT-JUSTIFY-LINE 3 ,K-Q-RESUME-STORY ,K-J-RIGHT ,K-Q-RESUME-STORY-LEN>
		)
	>
>

<CONSTANT K-J-LEFT 0>
<CONSTANT K-J-CENTER 1>
<CONSTANT K-J-RIGHT 2>

<ROUTINE RT-JUSTIFY-LINE (LN STR TYPE "OPTIONAL" (LEN 0) (INV T) "AUX" COL)
	<COND
		(<ZERO? .LEN>
			<COND
				(<NOT <EQUAL? .TYPE ,K-J-LEFT>>
					<DIROUT ,K-D-TBL-ON ,K-DIROUT-TBL>
					<TELL .STR>
					<DIROUT ,K-D-TBL-OFF>
					<SET LEN <GET ,K-DIROUT-TBL 0>>
				)
			>
		)
	>
	<COND
		(<EQUAL? .TYPE ,K-J-LEFT>
			<SET COL 1>
		)
		(<EQUAL? .TYPE ,K-J-CENTER>
			<SET COL </ <- ,GL-SCR-WID .LEN> 2>>
		)
		(<EQUAL? .TYPE ,K-J-RIGHT>
			<SET COL <- ,GL-SCR-WID .LEN>>
		)
	>
	<VERSION?
		(YZIP
			<CCURSET .LN .COL>
		)
		(T
			<CURSET .LN .COL>
		)
	>
	<COND
		(.INV
			<HLIGHT ,K-H-INV>
		)
	>
	<TELL .STR>
	<COND
		(.INV
			<HLIGHT ,K-H-NRM>
		)
	>
>

]

<ROUTINE RT-H-STONE-STOLEN? ()
	<RETURN <NOT <IN? ,TH-STONE ,RM-CHURCHYARD>>>
>

;<ROUTINE RT-H-LOT-ATTENTION-1? ()
	<RETURN <FSET? ,RM-GREAT-HALL ,FL-TOUCHED>>
>

<ROUTINE RT-H-LOT-ATTENTION-2? ()
	<RETURN
		<AND
			<FSET? ,RM-GREAT-HALL ,FL-TOUCHED>
			<FSET? ,TH-GAUNTLET ,FL-SEEN>
		>
	>
>

<ROUTINE RT-H-FIGHT-LOT? ()
	<RETURN <IN? ,CH-LOT ,RM-FIELD-OF-HONOUR>>
>

<ROUTINE RT-H-BEAT-LOT? ()
	<RETURN <FSET? ,CH-LOT ,FL-LOCKED>>
>

<ROUTINE RT-H-DEFEAT-LOT? ()
	<RETURN <AND <FSET? ,CH-LOT ,FL-BROKEN> <FSET? ,CH-LOT ,FL-LOCKED>>>
>

;<ROUTINE RT-H-I-KNIGHT-1? ()
	<RETURN <FSET? ,RM-MEADOW ,FL-TOUCHED>>
>

<ROUTINE RT-H-I-KNIGHT-2? ()
	<RETURN
		<AND
			<FSET? ,RM-MEADOW ,FL-TOUCHED>
			<FSET? ,TH-MAGIC-RING ,FL-SEEN>
		>
	>
>

;<ROUTINE RT-H-CASTLE-1? ()
	<RETURN <FSET? ,RM-CASTLE-GATE ,FL-TOUCHED>>
>

<ROUTINE RT-H-CASTLE-2? ()
	<RETURN
		<AND
			<FSET? ,RM-CASTLE-GATE ,FL-TOUCHED>
			<FSET? ,RM-HOLE ,FL-TOUCHED>
		>
	>
>

;<ROUTINE RT-H-PASSWORD-1? ()
	<RETURN
		<AND
			<FSET? ,RM-CASTLE-GATE ,FL-TOUCHED>
		;	<NOT <FSET? ,RM-CELL ,FL-TOUCHED>>
		;	<NOT <FSET? ,RM-HALL ,FL-TOUCHED>>
		>
	>
>

<ROUTINE RT-H-PASSWORD-2? ()
	<RETURN
		<AND
			<FSET? ,RM-CASTLE-GATE ,FL-TOUCHED>
			<FSET? ,RM-CELL ,FL-TOUCHED>
		;	<NOT <FSET? ,RM-HALL ,FL-TOUCHED>>
		>
	>
>

<ROUTINE RT-H-PASSWORD-3? ()
	<RETURN
		<AND
			<FSET? ,RM-CASTLE-GATE ,FL-TOUCHED>
			<FSET? ,RM-HALL ,FL-TOUCHED>
		>
	>
>

<ROUTINE RT-H-HEARD-PASSWORD? ()
	<RETURN <FSET? ,TH-PASSWORD ,FL-TOUCHED>>
>

<ROUTINE RT-H-PRISONER-OUT? ()
	<RETURN <FSET? ,CH-PRISONER ,FL-AIR>>
>

;<ROUTINE RT-H-PRISONER-1? ()
	<RETURN
		<AND
			<FSET? ,RM-CELL ,FL-TOUCHED>
		;	<NOT <FSET? ,CH-CELL-GUARD ,FL-SEEN>>
		>
	>
>

<ROUTINE RT-H-PRISONER-2? ()
	<RETURN
		<AND
			<FSET? ,RM-CELL ,FL-TOUCHED>
			<FSET? ,CH-CELL-GUARD ,FL-SEEN>
		>
	>
>

;<ROUTINE RT-H-BRACELET-1? ()
	<RETURN
		<AND
			<FSET? ,CH-KRAKEN ,FL-SEEN>
		;	<LOC ,CH-KRAKEN>
		>
	>
>

<ROUTINE RT-H-BRACELET-2? ()
	<RETURN
		<AND
			<FSET? ,CH-KRAKEN ,FL-SEEN>
			<NOT <LOC ,CH-KRAKEN>>
		>
	>
>

<ROUTINE RT-H-HEARD-MURMUR? ()
	<RETURN <FSET? ,TH-ROCK ,FL-BROKEN>>
>

;<ROUTINE RT-H-EGG-1? ()
	<RETURN
		<AND
			<FSET? ,TH-RAVEN-EGG ,FL-SEEN>
		;	<NOT <FSET? ,TH-BRASS-EGG ,FL-SEEN>>
		>
	>
>

<ROUTINE RT-H-EGG-2? ()
	<RETURN
		<AND
			<FSET? ,TH-RAVEN-EGG ,FL-SEEN>
			<FSET? ,TH-BRASS-EGG ,FL-SEEN>
		>
	>
>

;<ROUTINE RT-H-TOWER-1? ()
	<RETURN
		<AND
			<FSET? ,RM-TOW-CLEARING ,FL-TOUCHED>
		;	<NOT <FSET? ,TH-IVORY-KEY ,FL-SEEN>>
		>
	>
>

<ROUTINE RT-H-TOWER-2? ()
	<RETURN
		<AND
			<FSET? ,RM-TOW-CLEARING ,FL-TOUCHED>
			<FSET? ,TH-IVORY-KEY ,FL-SEEN>
		>
	>
>

;<ROUTINE RT-H-NAME-1? ()
	<RETURN
		<AND
			<FSET? ,CH-RHYMER ,FL-SEEN>
		;	<NOT <FSET? ,RM-CRACK-ROOM ,FL-TOUCHED>>
		;	<NOT <FSET? ,RM-CELLAR ,FL-SEEN>>
		>
	>
>

<ROUTINE RT-H-NAME-2? ()
	<RETURN
		<AND
			<FSET? ,CH-RHYMER ,FL-SEEN>
			<FSET? ,RM-CRACK-ROOM ,FL-TOUCHED>
		;	<NOT <FSET? ,RM-CELLAR ,FL-SEEN>>
		>
	>
>

<ROUTINE RT-H-NAME-3? ()
	<RETURN
		<AND
			<FSET? ,CH-RHYMER ,FL-SEEN>
			<FSET? ,RM-CRACK-ROOM ,FL-TOUCHED>
			<FSET? ,RM-CELLAR ,FL-SEEN>
		>
	>
>

;<ROUTINE RT-H-TUSK-1? ()
	<RETURN
		<AND
			<FSET? ,RM-NORTH-OF-CHASM ,FL-TOUCHED>
		;	<FSET? ,TH-BOAR ,FL-ALIVE>
		>
	>
>

<ROUTINE RT-H-TUSK-2? ()
	<RETURN
		<AND
			<FSET? ,RM-NORTH-OF-CHASM ,FL-TOUCHED>
			<NOT <FSET? ,TH-BOAR ,FL-ALIVE>>
		>
	>
>

<ROUTINE RT-H-SEEN-BOG? ()
	<RETURN <FSET? ,RM-BOG ,FL-SEEN>>
>

<ROUTINE RT-H-SEEN-THORNY-ISLAND? ()
	<RETURN <FSET? ,RM-THORNEY-ISLAND ,FL-SEEN>>
>

;<ROUTINE RT-H-BLACK-KNIGHT-1? ()
	<RETURN <FSET? ,CH-BLACK-KNIGHT ,FL-SEEN>>
>

<ROUTINE RT-H-BLACK-KNIGHT-2? ()
	<RETURN
		<AND
			<FSET? ,CH-BLACK-KNIGHT ,FL-SEEN>
			<FSET? ,TH-SWORD ,FL-SEEN>
		>
	>
>

<ROUTINE RT-H-BLACK-KNIGHT-3? ()
	<RETURN
		<AND
			<FSET? ,CH-BLACK-KNIGHT ,FL-SEEN>
			<FSET? ,TH-SWORD ,FL-SEEN>
			<G=? ,GL-SC-EXP 66>
		>
	>
>

;<ROUTINE RT-H-DRAGON-1? ()
	<RETURN
		<AND
			<FSET? ,CH-DRAGON ,FL-SEEN>
		;	<NOT <FSET? ,TH-WHISKY-JUG ,FL-SEEN>>
		>
	>
>

<ROUTINE RT-H-DRAGON-2? ()
	<RETURN
		<AND
			<FSET? ,CH-DRAGON ,FL-SEEN>
			<FSET? ,TH-WHISKY-JUG ,FL-SEEN>
		>
	>
>

;<ROUTINE RT-H-TALKING-DOOR-1? ()
	<RETURN
		<AND
			<FSET? ,RM-HOT-ROOM ,FL-TOUCHED>
		;	<NOT <FSET? ,RM-ICE-ROOM ,FL-TOUCHED>>
		>
	>
>

<ROUTINE RT-H-TALKING-DOOR-2? ()
	<RETURN
		<AND
			<FSET? ,RM-HOT-ROOM ,FL-TOUCHED>
			<FSET? ,RM-ICE-ROOM ,FL-TOUCHED>
		>
	>
>

<ROUTINE RT-H-SEEN-DEMON? ()
	<RETURN <NOT <FSET? ,CH-DEMON ,FL-LOCKED>>>
>

;"longest hint topic can be 17 chars"

<CONSTANT HINTS
	<CONSTRUCT-HINTS HINT-COUNTS

		"THE CHURCHYARD"

		<PLTABLE
<>
"How do I keep the soldiers from arresting me?"
"Hide where they can't see you."
"You can't hide in the church."
"Hmmm. Doesn't that gravestone look pretty big?"
"Hide behind the gravestone."
		>
		<PLTABLE
RT-H-STONE-STOLEN?
"How do I keep Lot from stealing the stone?"
"You can't."
		>
		<PLTABLE
<>
"What can I do in the church?"
"What should any chivalrous knight do when starting a quest?"
"Pray."
		>

		"KING LOT"

		<PLTABLE
<>
"Who is King Lot?"
"He is one of the many lesser kings who live in Britain. He wants to be High
King."
		>
		<PLTABLE
RM-GREAT-HALL
"Why does Lot ignore me in the great hall?"
"You are but a boy - insignificant in his eyes."
		>
		<PLTABLE
RM-GREAT-HALL
"How can I get Lot's attention?"
"You need to challenge him in the traditional way."
"Unless the next hint topic begins, \"More on getting Lot's attention,\" then
someplace in the game there is some object or information that you have not
yet discovered.  Until you do, it is unlikely that you will solve this
puzzle."
		>
		<PLTABLE
RT-H-LOT-ATTENTION-2?
"More on getting Lot's attention"
"Take the gauntlet to the Great Hall and hit Lot with it."
		>
		<PLTABLE
RT-H-FIGHT-LOT?
"How can I defeat Lot in battle?"
"Lot is a better swordsman than you."
"You'll have to resort to something other than swordplay."
"You'll have to distract him."
"Have you noticed his dominant personality characteristic?"
"Have you noticed how greedy he is?"
"Throw the bracelet on the ground."
		>
		<PLTABLE
RT-H-BEAT-LOT?
"More on defeating Lot"
"Once you have him at your mercy, you must spare his life."
		>

		"THE VILLAGE IDIOT"

		<PLTABLE
CH-IDIOT
"Why is the idiot in the Town Square?"
"The idiot is a metaphor for the angst of the human condition. He has
positioned himself in the Town Square as a silent protest against man's
inhumanity to man, and as a constant reminder of society's responsibility to
care for its intellectually inferior elements."
"Actually, he just likes it there."
		>
		<PLTABLE
CH-IDIOT
"How can I get things from the idiot?"
"The idiot isn't too bright."
"He has no concept of value."
"He'll trade you anything he's got for anything you've got."
		>

		"THE TAVERN"

		<PLTABLE
RM-TAVERN
"Are the farmers important?"
"Without farmers there would be no crops, and eventually everyone would die."
"Oh! You mean in the GAME?"
"Yes."
"Their conversation provides an important clue."
		>
		<PLTABLE
RM-TAV-KITCHEN
"Do I have to get into the locked cupboard?"
"Is the Queen English?"
"Are wild bears Catholic?"
"Does the Pope....(well, never mind)."
"Yes."
		>
		<PLTABLE
RM-TAV-KITCHEN
"How do I get into the locked cupboard?"
"Have you asked the cook to open it for you?"
"Of course, he's such a jerk that he probably wouldn't help you."
"The wooden key opens the locked cupboard."
"Have you asked the cook where the key is?"
"Oh yeah. We forgot. He's a jerk."
"Do not read the next clue until you have paid a visit to Merlin."
"Have you asked the bird about the key?"
"Turn yourself into an owl and see what the bird has to say."
"(But wait until that jerk leaves the room.)"
		>

		"INVISIBLE KNIGHT"

		<PLTABLE
RM-MEADOW
"How can I get back what the invisible knight steals?"
"He trades away some of the things he steals to another character in the game."
"The other character is the idiot."
"You can trade with the idiot for whatever he has."
"The Invisible Knight will keep the rest of your possessions until you track
him to his lair."
"Unless the next hint topic begins, \"More on the invisible knight,\" then
someplace in the game, there is some object or information that you have not
yet discovered.  Until you do, it is unlikely that you will solve this
puzzle."
		>
		<PLTABLE
RT-H-I-KNIGHT-2?
"More on the invisible knight"
"Think of the Invisible Knight as an unseen force."
"Go to the meadow and rub the magic ring."
		>

		"THE BRASS EGG"

		<PLTABLE
CH-I-KNIGHT
"What is the solution to the invisible knight's riddle?"
"This is the first clue"
"This is the second clue"
"This is the third clue"
"This is the fourth clue"
"Examine the first four clues carefully"
"The first four clues form a sequence"
"The clue after the first four clues would be the fifth clue"
"Look at the last two letters of the words in the first four clues"
"The letters the knight is looking for are TH (as in fifTH)"
		>

		"MERLIN'S BAG"

		<PLTABLE
TH-BAG
"What is the magic of Merlin's bag?"
"No matter what you put into it, it never fills up."
		>

		"ENTERING THE CASTLE"

		<PLTABLE
RM-CASTLE-GATE
"How can I get into the castle?"
"Give the guard at the gate the password."
		>
		<PLTABLE
RT-H-CASTLE-2?
"More on getting into the castle"
"You must go down the badger hole to get into the castle."
"Push the stone."
		>
		<PLTABLE
RM-CASTLE-GATE		; "(has the guard blocked entry or exit)"
"How can I get the password?"
"Strangely enough, you will have to get into the castle before you can learn
the password."
"Don't read the next hint until you have visited Merlin."
"You need to turn yourself into an animal in order to get into the castle."
"You must enter the castle as a badger."
"Unless the next hint topic begins, \"More on getting the password,\" then
you should come back after you've explored more thoroughly as a badger."
		>
		<PLTABLE
RT-H-PASSWORD-2?
"More on getting the password"
"Have you listened to the farmers in the tavern?"
"The \"He\" they are referring to is Lot."
"The poem they are referring to is in your documentation."
"Lot announces the password every canonical hour."
"You have to be where you can hear Lot set the password."
"You have to be somewhere other than in the Great Hall."
"Unless the next hint topic begins, \"Still more on getting the password,\"
then you should come back after you have escaped from the cell."
		>
		<PLTABLE
RT-H-PASSWORD-3?
"Still more on getting the password"
"Have you found the dark passage yet?"
"Perhaps the small chamber bears closer examination."
"Look behind the tapestry in the small chamber at the end of the hall."
"The next hint will be the very last hint on how to get the password."
"Wait behind the throne until the canonical hour changes. You will hear Lot
announce a verse and a line. That line is the password."
		>
		<PLTABLE
RT-H-HEARD-PASSWORD?
"How do I use the password?"
"In your documentation, you will find a poem about King Lot. Look up the
verse and line that you overheard from Lot. Then go to the guard and repeat
that line using the following format:|   >Say \"Correct line from poem\""
		>

		"LEAVING THE CASTLE"

		<PLTABLE
RM-HALL
"How do I get out of the underground corridor?"
"Forget the guard at the top of the stairs. He'll kill you every time."
"Look around the small chamber."
"How about that tapestry."
"Look behind the tapestry."
		>
		<PLTABLE
RM-PASSAGE-1
"How do I get out of the dark passage?"
"If you emerge from behind the throne, you'll always get killed."
"You'll have to get through that fire somehow."
"Gee....what animal was it that walks through fire?"
"Turn yourself into a salamander."
		>
		<PLTABLE
RM-CAS-KITCHEN
"How do I get the prisoner through the fire?"
"The prisoner can't turn himself into a salamander."
"You can't turn him into a salamander."
"It looks like you'll have to put out that fire."
"Push over the barrel of water."
		>
		<PLTABLE
RT-H-PRISONER-OUT?
"How do I get the prisoner past the guard at the gate?"
"Give the guard the password."
"See the hints on getting and using the password."
		>

		"THE CELL"

		<PLTABLE
RM-CELL
"Do I need to free the prisoner?"
"It would be the chivalrous thing to do."
"Yes. You need to free the prisoner."
		>
		<PLTABLE
RM-CELL
"How do I free the prisoner?"
"The chains and the padlock can't be broken."
"You have to unlock the padlock."
"Guards generally have keys to padlocks."
"Have you asked the prisoner about the guards?"
"Call the guard."
		>
		<PLTABLE
RT-H-PRISONER-2?
"More on freeing the prisoner"
"Did we mention that you should hide behind the door before you call the guard?"
"Did we mention that you will have to hit the guard in order to get the key?"
"Did we mention that you need to use the stone in order to knock out the guard?"
"Are you sick of us forgetting to mention things?"
		>

		"THE RED KNIGHT"

		<PLTABLE
CH-RED-KNIGHT
"How do I get past the red knight?"
"Give him what he wants."
		>

		"THE BADGER MAZE"

		<PLTABLE
RM-BADGER-TUNNEL
"Do I have to go through the badger maze?"
"Yes."
		>
		<PLTABLE
RM-BADGER-TUNNEL
"How do I get through the badger maze?"
"The maze can be mapped."
"Although you cannot carry anything as a badger, you can still map the maze."
"You need some way to distinguish one room from another."
"You need to find a unique way to mark each room."
"What natural tools does a badger have?"
"Use your claws to mark each room."
"When you enter the first room, put one claw mark on the wall. When you enter
the next room, put two claw marks on the wall. Keep doing that and you will
soon be able to map the entire maze."
"The next two hints will give you the exact directions through the maze."
"From the smithy, go down, south, up, down, and up."
"From Thorney Island, go down, north, north, and up."
		>

		"THORNEY ISLAND"

		<PLTABLE
RM-THORNEY-ISLAND
"How can I remove the hawthorn sprig from my fur?"
"You can't reach it with your claws."
"When you change back to human form, the sprig will fall to the ground."
		>
		<PLTABLE
RM-THORNEY-ISLAND
"What else can I do on the island?"
"Lie on the beach?"
"Sing 'Goodbye My Thorney Island Baby'?"
"Nothing."
		>

		"THE JOUST"

		<PLTABLE
CH-BLUE-KNIGHT
"How do I start the joust?"
"First you'll have to find some armour...."
"Then of course you'll need a shield...."
"And you'll need to polish the shield...."
"With the pumice stone...."
"And then get on the horse."
		>
		<PLTABLE
CH-BLUE-KNIGHT
"How do I win the joust?"
"The blue knight seems to place a great deal of importance on honourable behaviour."
"Don't think of the joust as a fight. Think of it as a gentleman's sport,
with gentleman's rules and conventions."
"A gentleman wouldn't truly try to hurt another gentleman."
"Have you noticed where the blue knight always ends up aiming?"
"The blue knight will always end up aiming at your body."
"You must always end up shielding your body...."
"And you must always end up aiming at his body."
		>

		"THE CONKERS"

		<PLTABLE
RM-CHESTNUT-PATH
"Why do the enchanted trees throw conkers at me?"
"They don't need a reason. They're enchanted."
		>
		<PLTABLE
RM-CHESTNUT-PATH
"How do I survive the attack of the enchanted trees?"
"You can't destroy the trees."
"Find a way to protect yourself."
"Your armour and shield can't quite protect all of your body."
"Turn into a turtle."
"Retract your head and legs into your shell."
"Wait until the trees stop throwing the conkers."
		>

		"THE KRAKEN"

		<PLTABLE
CH-KRAKEN
"Do I need the bracelet?"
"Yes."
		>
		<PLTABLE
CH-KRAKEN
"How do I get the bracelet?"
"The Kraken won't give it to you."
"You'll have to take it from him."
"You'll have to use violence."
"You'll have to cut it off with your sword."
"You can't carry a sword while you're swimming."
"If you can't get the sword to the kraken, you'll have to get the kraken to
the sword."
"If you zap the kraken as an eel, he'll start to chase you."
"Leave the sword in the ford or the shallows."
"Zap the kraken and go back to where you left the sword. Change back to human
form, take the sword, and cut off the bracelet."
		>
		<PLTABLE
RT-H-BRACELET-2?
"More on getting the bracelet"
"Think of the bracelet as a hoop."
"Swim through the bracelet."
"Swim through the bracelet as a turtle."
"Take the bracelet to the shallows or the ford and then pull your head inside
your shell."
		>

		"THE GLADE"

		<PLTABLE
RM-GLADE
"What is rustling in the undergrowth?"
"Perhaps it is something that is afraid of you."
"Maybe you should hide somewhere."
"Hide behind the rock."
		>
		<PLTABLE
RT-H-HEARD-MURMUR?
"What is the murmuring below the rock?"
"Listen to it."
"It's a leprechaun complaining about something."
		>
		<PLTABLE
CH-LEPRECHAUN
"How do I catch the leprechaun?"
"Listen to the murmuring from below the rock."
"Don't read the next clue until you have opened the cupboard in the tavern."
"The leprechaun is complaining about the lack of spice in his Irish stew."
"Leave the spice in the glade, then hide behind the rock."
"Catch the leprechaun while he is looking at the bottle of spice."
		>

		"THE RAVEN"

		<PLTABLE
CH-RAVEN
"Where is the raven's egg?"
"Where do ravens usually keep eggs?"
"It's in the raven's nest."
"The nest is at the top of the tall tree in the grove."
		>
		<PLTABLE
TH-RAVEN-EGG
"How can I get the gold egg out of the nest?"
"You need to get into the nest...."
"Then you need to distract the raven long enough to get the egg."
"Unless the next hint topic begins, \"More on getting the gold egg,\" then
someplace in the game, there is some object or information that you have not
yet discovered.  Until you do, it is unlikely that you will solve this
puzzle."
		>
		<PLTABLE
RT-H-EGG-2?
"More on getting the gold egg"
"The raven likes bright objects."
"The bird may even think the brass egg is real."
"Drop the brass egg in the grove."
"Fly up to the nest."
"Push the egg out of the nest."
"Get out of there before the raven kills you."
		>

		"THE IVORY TOWER"

		<PLTABLE
RM-TOW-CLEARING
"How do I get into the ivory tower?"
"You need a key."
"Unless the next hint topic begins, \"More on getting into the tower,\" then
someplace in the game, there is some object or information that you have not
yet discovered.  Until you do, it is unlikely that you will solve this
puzzle."
		>
		<PLTABLE
RT-H-TOWER-2?
"More on getting into the tower"
"The Blue Knight gave you an ivory key. Use it."
		>
		<PLTABLE
CH-RHYMER
"How can I find out the man's name?"
"It isn't Rumplestiltskin."
"Magical creatures who have secret names usually have an irresistable urge to
write it down somewhere."
"There's more than one room on this floor of the tower."
"Crawl through the crack in the wall on the landing."
		>
		<PLTABLE
RT-H-NAME-2?
"More on the secret name"
"The letters on the wall of the abandoned room are a cryptogram."
"The key to cryptogram is somewhere else."
		>
		<PLTABLE
RT-H-NAME-3?
"Still more on the secret name"
"Think of the writing on the cellar wall as two strings of letters, rather
than words."
"The writing on the cellar wall is the key to the cryptogram in the abandoned
room."
"It is a substitution cypher."
"Every letter that appears in the phrase AMHTIR AMU SMOTUS also appears in
the name RIOTHAMUS."
"Substitute the letters in the phrase AMHTIR AMU SMOTUS with the letters
in SAYMOTHER that appear above the corresponding letters in RIOTHAMUS."
"For example, the 'S' of SAYMOTHER appears directly above the 'R' of
RIOTHAMUS, so wherever you see an 'R' in AMHTIR AMU SMOTUS, substitute
the letter 'S.'"
"The man's name is Thomas The Rhymer."
		>
		<PLTABLE
RM-CELLAR
"What is in the cellar?"
"It's too dark to see."
"Actually, it's only too dark for a human to see."
"Turn yourself into an owl."
		>

		"THE BOAR"

		<PLTABLE
TH-BOAR
"How do I get across the chasm?"
"You can't jump over it."
"Don't read the next clue until you have visited Merlin."
"Fly over the chasm as an owl."
		>
		<PLTABLE
RM-NORTH-OF-CHASM
"How do I get the tusk from the boar?"
"You'll have to kill the boar."
"You can't kill it with your bare hands."
"And it looks too big to kill with a conventional weapon."
"So maybe you could poison it."
"Gee. If only there were a poison apple in the game."
"But wait! What luck! There IS a poison apple - conveniently located just
east of the ford."
"That's really all you need to know, unless you're having difficulty getting
the apple to where the boar is - in which case, read on."
"Well, first you'll have to get the apple safely out of the Badlands, which
is covered in a separate hint topic."
"But once you've done that, you've still got to get the apple to the other
side of the chasm."
"Of course, the chasm really isn't all that wide."
"Throw the apple over the chasm."
		>
		<PLTABLE
RT-H-TUSK-2?
"More on getting the tusk"
"Have you tried pulling the tusk out?"
"Cut off the tusk with the sword."
"Then throw everything back over the chasm."
		>

		"THE COTTAGE"

		<PLTABLE
RM-COTTAGE
"What's wrong with the peasant?"
"He has passed out from the cold."
		>
		<PLTABLE
RM-COTTAGE
"How do I awaken the peasant?"
"He has passed out from the cold."
"You need to warm him up."
"The fire has gone out."
"You need to restart the fire."
"You need some new fuel for the fire."
"Peat is a good fuel."
"Go to the bog and cut some peat."
"Use the slean."
		>

		"THE BOG"

		<PLTABLE
RT-H-SEEN-BOG?
"How do I get through the bog?"
"You need expert guidance."
"Ask the peasant in the cottage."
		>
		<PLTABLE
RT-H-SEEN-THORNY-ISLAND?
"How do I get to the island in the middle of the bog?"
"You can't get to it from the bog."
"You can't get to it from the air."
"Do not read the next clue until you are really stumped."
"You have to solve the badger maze to get to the island."
		>

		"THE BLACK KNIGHT"

		<PLTABLE
CH-BLACK-KNIGHT
"How can I get past the black knight?"
"You'll have to defeat him in battle."
"You'll need a good weapon."
"Unless the next hint topic begins, \"More on getting past the black knight,\"
then someplace in the game there is some object or information that you have
not yet discovered.  Until you do, it is unlikely that you will solve this
puzzle."
		>
		<PLTABLE
RT-H-BLACK-KNIGHT-2?
"More on getting past the black knight"
"You have to attack the knight with your sword."
"Unless the next hint topic begins, \"Still more on getting past the black
knight,\" then you don't have enough experience to defeat him yet."
		>
		<PLTABLE
RT-H-BLACK-KNIGHT-3?
"Still more on getting past the black knight"
"You now have all the experience you need to defeat the black knight."
"However, you have to do more than simply attack him."
"The black knight is enchanted."
"Have you looked at him?"
"The medallion is the source of his enchanted power."
"Wait until you have knocked the sword from his hand, then cut off the medallion."
		>

		"THE DRAGON"

		<PLTABLE
CH-DRAGON
"How can I kill the dragon?"
"You can't."
		>
		<PLTABLE
CH-DRAGON
"How can I get past the dragon?"
"Unless the next hint topic begins, \"More on getting past the dragon,\" then
someplace in the game there is some object or information that you have not
yet discovered.  Until you do, it is unlikely that you will solve this
puzzle."
		>
		<PLTABLE
RT-H-DRAGON-2?
"More on getting past the dragon."
"Does the dragon remind you of anyone?"
"Like someone who would rather be in Philadelphia?"
"Like someone known for his alcoholic intake?"
"Give him the jug of whisky."
		>

		"THE APPARITIONS"

		<PLTABLE
TH-GHOSTS
"How can I kill the apparitions?"
"You can't. They're already dead."
		>
		<PLTABLE
TH-GHOSTS
"How can I stop the apparitions from killing me?"
"The apparitions aren't real."
"They are being created in your mind by an evil force."
"If you leave them alone, they'll leave you alone."
		>

		"THE BASILISK"

		<PLTABLE
CH-BASILISK
"How can I stop the basilisk from killing me?"
"The basilisk turns everything it sees into stone."
"Perhaps if it caught a glimpse of itself...."
"Like in a mirror, perhaps..."
"Or something that was sort of like a mirror."
"Point your shield at the basilisk."
		>

		"THE ICE ROOM"

		<PLTABLE
RM-ICE-ROOM
"What can I do in the ice room?"
"Make ice cream?"
"Freeze things."
"See the hints for the Hot Room."
		>

		"THE HOT ROOM"

		<PLTABLE
RM-HOT-ROOM
"How can I get past the talking door?"
"Just say the word and the door will open."
"Oh yeah. We forgot. You can't talk."
"Unless the next hint topic begins, \"More on getting past the talking door,\"
then someplace in the game there is some object or information that you
have not yet discovered.  Until you do, it is unlikely that you will solve
this puzzle."
		>
		<PLTABLE
RT-H-TALKING-DOOR-2?
"More on getting past the talking door"
"It sure is hot in here."
"Real hot."
"Hot enough to melt almost anything."
"Especially ice."
"Especially ice that contained a frozen word."
"Like Nudd."
"Go to the ice room, say \"Nudd,\" catch the block of ice before it falls,
and bring it back to the hot room."
		>

		"THE DEMON'S LAIR"

		<PLTABLE
RM-DEMON-HALL
"Should I free the girl?"
"Have you tried kissing her?"
"Take our word for it. You don't want to free her."
"She's not what she pretends to be."
"If you show her that you know who she is, her disguise will disappear."
"She's really the demon himself."
"Either attack her, or address her as Nudd."
		>
		<PLTABLE
RT-H-SEEN-DEMON?
"How do I get out of the demon's lair alive?"
"Well, you could turn down the demon's deal and simply leave."
"Of course, in that case you wouldn't get the fleece."
"It looks as if you'll have to accept his offer."
"But perhaps you could outsmart him."
"Like if you fulfilled the letter - but not the spirit - of the contract."
"All you have to do is open the manacles."
"He didn't say anything about not being able to close them again."
"Of course, you'd have to open them one at a time."
		>

		"THE UNDERGROUND CHAMBER"

		<PLTABLE
CH-NIMUE
"Who is the sleeping woman?"
"She is Nimue. The Lady of the Lake."
		>
		<PLTABLE
CH-NIMUE
"How can I break the enchantment?"
"You must heed Merlin's message in the documentation."
		>

		"THE ENDGAME"

		<PLTABLE
RT-H-DEFEAT-LOT?
"I've defeated King Lot. Now what?"
"Remember the instructions of the lady of the lake?"
"Call Nimue."
		>

		"THE MEANING OF LIFE"

		<PLTABLE
<>
"What is the meaning of life?"
"Gee. We were sorta hoping you'd know."
		>
		<PLTABLE
<>
"How high is up?"
"Twice as far as half way."
		>
	>
>

;"***************************************************************************"
; "end of file"
;"***************************************************************************"

