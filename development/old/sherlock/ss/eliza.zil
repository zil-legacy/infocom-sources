;*****************************************************************************
; "game : SHERLOCK!"
; "file : ELIZA.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   26 Oct 1987  4:07:18  $"
; "revs : $Revision:   1.34  $"
; "vers : 1.00"
;*****************************************************************************

;*****************************************************************************
; "THINGS1.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "TH-BLUE-PILL-BOTTLE"
;-----------------------------------------------------------------------------

<OBJECT TH-BLUE-PILL-BOTTLE
	(LOC TH-BLACK-BAG)
	(DESC "blue bottle")
	(FLAGS FL-CONTAINER FL-OPENABLE FL-READABLE FL-TAKEABLE)
	(SYNONYM BOTTLE BOTTLES LABEL)
	(ADJECTIVE BLUE)
	(SIZE 3)
	(MASS 2)
	(CAPACITY 2)
	(GENERIC RT-GN-BOTTLE)
	(ACTION RT-AC-TH-BLUE-PILL-BOTTLE)
>

;-----------------------------------------------------------------------------
; "TH-BROWN-BILL-BOTTLE"
;-----------------------------------------------------------------------------

<OBJECT TH-BROWN-PILL-BOTTLE
	(LOC TH-BLACK-BAG)
	(DESC "brown bottle")
	(FLAGS FL-CONTAINER FL-OPENABLE FL-READABLE FL-TAKEABLE)
	(SYNONYM BOTTLE BOTTLES LABEL)
	(ADJECTIVE BROWN) 
	(SIZE 3)
	(MASS 2)
	(CAPACITY 2)
	(GENERIC RT-GN-BOTTLE)
	(ACTION RT-AC-TH-BROWN-PILL-BOTTLE)
>

;-----------------------------------------------------------------------------
; "TH-ORANGE-PILL"
;-----------------------------------------------------------------------------

<OBJECT TH-ORANGE-PILL
	(LOC TH-BLUE-PILL-BOTTLE)
	(DESC "orange pill")
	(FLAGS FL-TAKEABLE FL-READABLE FL-FOOD FL-VOWEL)
	(SYNONYM PILL PILLS)
	(ADJECTIVE ORANGE)
	(SIZE 1)
	(MASS 1)
	(GENERIC RT-GN-PILL)
	(ACTION RT-AC-TH-ORANGE-PILL)
	(DESCFCN RT-DF-TH-ORANGE-PILL)
>

;-----------------------------------------------------------------------------
; "TH-YELLOW-PILL"
;-----------------------------------------------------------------------------

<OBJECT TH-YELLOW-PILL
	(LOC TH-BROWN-PILL-BOTTLE)
	(DESC "yellow pill")
	(FLAGS FL-TAKEABLE FL-READABLE FL-FOOD)
	(SYNONYM PILL PILLS)
	(ADJECTIVE YELLOW)
	(SIZE 1)
	(MASS 1)
	(GENERIC RT-GN-PILL)
	(ACTION RT-AC-TH-YELLOW-PILL)
	(DESCFCN RT-DF-TH-YELLOW-PILL)
>

;*****************************************************************************
; "THINGS2.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-AC-TH-BLUE-PILL-BOTTLE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-BLUE-PILL-BOTTLE ("OPTIONAL" (CONTEXT<>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-TH-AC "TH-BLUE-PILL-BOTTLE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? READ EXAMINE LOOK-ON>
					<TELL
"The label on the bottle reads: \"Digitalis leaf. For tachycardia and
other accelerated arrhythmias.\"" CR
					>
				)
				(<MC-VERB? SHOOT>
					<REMOVE ,TH-BLUE-PILL-BOTTLE>
					<TELL CTHEO ,K-SHATTER-MSG CR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-BROWN-PILL-BOTTLE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-BROWN-PILL-BOTTLE ("OPTIONAL" (CONTEXT<>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-TH-AC "TH-BROWN-PILL-BOTTLE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? READ EXAMINE LOOK-ON>
					<TELL
"The label on the bottle reads: \"Belladonna. For bradycardia and
other decelerated arrhythmias.\"" CR
					>
				)
				(<MC-VERB? SHOOT>
					<REMOVE ,TH-BROWN-PILL-BOTTLE>
					<TELL CTHEO ,K-SHATTER-MSG CR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-ORANGE-PILL"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-ORANGE-PILL ("OPTIONAL" (CONTEXT<>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-TH-AC "TH-ORANGE-PILL" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? SHOOT>
					<REMOVE ,TH-ORANGE-PILL>
					<TELL CTHEO ,K-SHATTER-MSG CR>
				)
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-AC-TH-YELLOW-PILL"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-TH-YELLOW-PILL ("OPTIONAL" (CONTEXT<>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-TH-AC "TH-YELLOW-PILL" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<MC-THIS-PRSO?>
			<COND
				(<MC-VERB? SHOOT>
					<REMOVE ,TH-YELLOW-PILL>
					<TELL CTHEO ,K-SHATTER-MSG CR>
				)
			>
		)
	>
>

;*****************************************************************************
; "THINGS3.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-DF-TH-ORANGE-PILL"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-ORANGE-PILL ("OPTIONAL" (CONTEXT<>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-TH-DF "TH-ORANGE-PILL" .CONTEXT>
		)
		(T
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-YELLOW-PILL"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-YELLOW-PILL ("OPTIONAL" (CONTEXT<>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-TH-DF "TH-YELLOW-PILL" .CONTEXT>
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
; "RT-AC-CH-ELIZA-DOOLITTLE"
;-----------------------------------------------------------------------------

<ROUTINE RT-AC-CH-ELIZA-DOOLITTLE ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-AC "CH-ELIZA-DOOLITTLE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<MC-THIS-WINNER?>
			<TELL
CTHE ,CH-ELIZA-DOOLITTLE " is unconscious. She cannot do anything." CR
			>
			<RTRUE>
		)
		(<OR	<AND
					<MC-VERB? LISTEN>
					<MC-THIS-PRSO?>
				>
				<AND
					<MC-VERB? USE-ON TOUCH-TO>
					<MC-PRSO? ,TH-STETHOSCOPE>
					<MC-THIS-PRSI?>
				>
				<AND
					<MC-VERB? DIAGNOSE>
					<MC-THIS-PRSO?>
				>
				<AND
					<MC-VERB? LOOK-THRU>
					<EQUAL? ,GL-P-PRSA-WORD ,W?EXAMINE>
					<MC-THIS-PRSO?>
					<MC-PRSI? ,TH-STETHOSCOPE>
				>
			>
			<RT-LISTEN-ELIZA>
		)
		(<MC-VERB? GIVE FEED>
			<RT-CURE-ELIZA ,GL-PRSO>
		)
		(<MC-VERB? TAKE RAISE>
			<COND
				(<MC-PRSO? TH-ELIZAS-FLOWERS>
					<TELL ,K-OUTRAGED-CROWD-MSG CR>
					<RTRUE>
				)
				(<MC-PRSO? CH-ELIZA-DOOLITTLE>
					<TELL
"The girl is too sick to be moved." CR
					>
					<RTRUE>
				)
				(T
					<RFALSE>
				)
			>
		)
		(<MC-VERB? RESCUE>
			<TELL
"A noble thought, worthy of someone who has taken the Hippocratic oath." CR
			>
			<RTRUE>
		)
		(<MC-VERB? ALARM>
			<TELL
"Your medical expertise tells you she's not just asleep. It's more serious
than that." CR
			>
			<RTRUE>
		)
		(<MC-VERB? SEARCH>
			<TELL ,K-OUTRAGED-CROWD-MSG CR>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;*****************************************************************************
; "PUZZLES.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-LISTEN-ELIZA"
;-----------------------------------------------------------------------------

<ROUTINE RT-LISTEN-ELIZA ()
	<COND
		(<IN? ,TH-COTTON-BALLS ,TH-EARS>
			<RT-CYOU-MSG>
			<TELL
"cannot hear a thing with " THE ,TH-COTTON-BALLS " in " THE ,TH-EARS "." CR
			>
		)
		(<MC-IS? ,TH-STETHOSCOPE ,FL-WORN>
			<COND
				(<ZERO? <GETP ,CH-ELIZA-DOOLITTLE ,P?AUX1>>
					<COND
						(<MC-PROB 50>
							<PUTP ,CH-ELIZA-DOOLITTLE ,P?AUX1 1>
						)
						(T
							<PUTP ,CH-ELIZA-DOOLITTLE ,P?AUX1 2>
						)
					>
				)
			>
			<COND
				(<EQUAL? <GETP ,CH-ELIZA-DOOLITTLE ,P?AUX1> 1>
					<TELL
"Her heartbeat is incredibly fast." CR
					>
				)
				(<EQUAL? <GETP ,CH-ELIZA-DOOLITTLE ,P?AUX1> 2>
					<TELL
"Her heartbeat is incredibly slow." CR
					>
				)
			>
		)
		(<OR	<MC-PRSO? ,TH-STETHOSCOPE>
				<MC-PRSI? ,TH-STETHOSCOPE>
			>
			<RT-CYOU-MSG "are" "is">
			<TELL "not wearing " THE ,TH-STETHOSCOPE "." CR>
		)
		(T
			<TELL
"The city noises are too loud for you to make an accurate diagnosis." CR
			>
		)		
	>
>

;-----------------------------------------------------------------------------
; "RT-CURE-ELIZA"
;-----------------------------------------------------------------------------

<ROUTINE RT-CURE-ELIZA (CURE)
	<COND
		(<EQUAL? .CURE ,TH-ORANGE-PILL>
			<REMOVE ,TH-ORANGE-PILL>
			<COND
				(<EQUAL? <GETP ,CH-ELIZA-DOOLITTLE ,P?AUX1> 1>
					<PUTP ,CH-ELIZA-DOOLITTLE ,P?AUX1 3>
				)
				(T
					<PUTP ,CH-ELIZA-DOOLITTLE ,P?AUX1 4>
				)
			>
			<TELL
"You give her " THE .CURE "." CR CR
			>
		)
		(<EQUAL? .CURE ,TH-YELLOW-PILL>
			<REMOVE ,TH-YELLOW-PILL>
			<COND
				(<EQUAL? <GETP ,CH-ELIZA-DOOLITTLE ,P?AUX1> 2>
					<PUTP ,CH-ELIZA-DOOLITTLE ,P?AUX1 3>
				)
				(T
					<PUTP ,CH-ELIZA-DOOLITTLE ,P?AUX1 4>
				)
			>
			<TELL
"You give her " THE .CURE "." CR CR
			>
		)
		(T
			<TELL
"That would not do her much good." CR
			>
			<RTRUE>
		)
	>
	<COND
		(<EQUAL? <GETP ,CH-ELIZA-DOOLITTLE ,P?AUX1> 3>
			<MOVE ,TH-CARNATION ,TH-LAPEL>
			<REMOVE ,CH-ELIZA-DOOLITTLE>
			<MC-UNMAKE ,CH-ELIZA-DOOLITTLE ,FL-ASLEEP>
			<TELL
"Nothing happens for a moment, but then her eyelids flutter briefly and
she opens her eyes." CR CR

"The crowd breaks into applause, and they help her to her feet. When she
is standing, she smiles at you shyly and puts a lovely carnation in your
lapel as a gesture of thanks." CR CR

"Just then, a distinguished-looking gentleman appears on the scene, takes
her by the arm, and says, \"Come, Eliza. We mustn't be late for the
ball.\"" CR CR

"He escorts her away, but as she leaves, she glances back at you once
more with a grateful expression in her lovely eyes." CR
			>
			<RT-UPDATE-SCORE <GETP ,TH-CARNATION ,P?VALUE>>
			<PUTP ,TH-CARNATION ,P?VALUE 0>
			<RTRUE>
		)
		(<EQUAL? <GETP ,CH-ELIZA-DOOLITTLE ,P?AUX1> 4>
			<MC-UNMAKE ,CH-ELIZA-DOOLITTLE ,FL-ALIVE>
			<TELL
"Nothing happens for a moment, but then suddenly her body goes limp. It
must have been the wrong pill." CR CR

"By this time, the large crowd has gathered the attention of the
police. Inspector Lestrade pushes his way through the crowd, sees the
dead girl, and says, \"I'm sorry, Doctor Watson. I know you must have
tried to save her. I'm afraid you'll have to come along with me to fill
out the death certificate.\"" CR CR

"Unfortunately, by the time you finish filling out the forms associated
with the girl's death, the news of theft of the jewels leaks to the
press, and all is lost." CR CR
			>
			<RT-QSR>
		)
	>
>

;*****************************************************************************
; "CONSTANTS"
;*****************************************************************************

<CONSTANT K-OUTRAGED-CROWD-MSG
"The crowd is outraged that you would try to rob the ailing girl, and
they beat you about the head and shoulders with their shopping bags."
>

;*****************************************************************************
; "end of file"
;*****************************************************************************

