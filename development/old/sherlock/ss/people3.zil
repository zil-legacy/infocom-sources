;*****************************************************************************
; "game : SHERLOCK!"
; "file : PEOPLE3.ZIL"
; "auth :   $Author:   RAB  $"
; "date :     $Date:   28 Oct 1987  4:35:22  $"
; "rev  : $Revision:   1.34  $"
; "vers : 1.00"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "this file contains:"
; "  descfcn routines for generic characters"
; "  descfcn routines for game    characters"
;-----------------------------------------------------------------------------

;*****************************************************************************
; "descfcn routines for generic characters"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-DF-CH-PLAYER"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-CH-PLAYER ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-PLAYER" .CONTEXT>
		)
		(T
		)
	>
	<RFALSE>
>

;*****************************************************************************
; "descfcn for game characters"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-DF-CH-HOLMES"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-CH-HOLMES ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-HOLMES" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-HOLMES>
	<COND
		(<MC-IS? ,CH-HOLMES ,FL-ASLEEP>
			<TELL
				<RT-PICK-NEXT ,GL-HOLMES-DESC-TXT>
" is slouched on the sofa, lost in a black mood of
despair. He is pale and emaciated, and his sharp eyes burn with
fever. He is staring at a phial that he holds in one hand. His free
hand rests near a hypodermic syringe in a neat morocco case
at his side. You realize that he is fighting a depression brought
on by what he calls \"the dull routine of existence.\"" CR
			>
			<RTRUE>
		)
		(<MC-IS? ,CH-HOLMES ,FL-LOCKED>
			<TELL
				<RT-PICK-NEXT ,GL-HOLMES-DESC-TXT>
					,K-SECURELY-BOUND-MSG
			>
		)
		(<MC-IS? ,CH-MORIARTY ,FL-LOCKED>
			<TELL
"Despite his cool exterior, you can tell that Holmes is excited
about nearing the end of the chase"
			>
		)
		(<IN? ,CH-HOLMES ,TH-BOAT>
			<TELL
				<RT-PICK-NEXT ,GL-HOLMES-DESC-TXT>
				,K-SEASICK-MSG
			>
		)
		(<OR	<IN? ,CH-HOLMES ,TH-HANSOM-CAB>
				<IN? ,CH-HOLMES ,TH-GROWLER-CAB>
			>
			<TELL
				<RT-PICK-NEXT ,GL-HOLMES-DESC-TXT>
				,K-SITTING-QUIETLY-MSG
			>
		)
		(<IN? ,CH-HOLMES ,TH-SOFA>
			<TELL
				<RT-PICK-NEXT ,GL-HOLMES-DESC-TXT>
" is sitting on the sofa, gazing intently at you"
			>
		)
		(<MC-HERE?
				,RM-ENTRY-HALL
				,RM-PARLOUR
				,RM-VESTIBULE
				,RM-HOLMES-STUDY
				,RM-HOLMES-BEDROOM
			>
			<TELL
				<RT-PICK-NEXT ,GL-HOLMES-DESC-TXT>
				<RT-PICK-NEXT ,GL-HOLMES-HOUSE-LOOK-TXT>
			>
		)
		(<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
			<TELL
				<RT-PICK-NEXT ,GL-HOLMES-DESC-TXT>
				<RT-PICK-NEXT ,GL-HOLMES-INDOORS-LOOK-TXT>
			>
		)
		(T
			<TELL
				<RT-PICK-NEXT ,GL-HOLMES-DESC-TXT>
				<RT-PICK-NEXT ,GL-HOLMES-OUTDOORS-LOOK-TXT>
			>
		)
	>
	<TELL "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-DF-CH-MATCH-SNIFFING-DOG"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-CH-MATCH-SNIFFING-DOG ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-MATCH-SNIFFING-DOG" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-MATCH-SNIFFING-DOG>
	<TELL
CTHE ,CH-MATCH-SNIFFING-DOG " glares back at you menacingly." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-CH-TUSSAUDS-GUARD"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-CH-TUSSAUDS-GUARD ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-TUSSAUDS-GUARD" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-TUSSAUDS-GUARD>
	<TELL
CTHE ,CH-TUSSAUDS-GUARD " has his collar turned up against the cold. He is
pacing back and forth, puffing on a cigarette, and stamping his feet, all
in a futile effort to keep warm." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-CH-TRAINED-PIGEON"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-CH-TRAINED-PIGEON ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-TRAINED-PIGEON" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-TRAINED-PIGEON>
	<COND
		(<IN? ,CH-TRAINED-PIGEON ,CH-SHERMAN>
			<TELL D ,CH-SHERMAN " is holding " THE ,CH-TRAINED-PIGEON>
		)
		(<MC-T? <GETP ,CH-TRAINED-PIGEON ,P?AUX2>>
			<RTRUE>
		)
		(T
			<TELL CTHE ,CH-TRAINED-PIGEON>
			<COND
				(<AND <BAND <GETP ,CH-TRAINED-PIGEON ,P?AUX1> ,K-PIGEON-SHOWN-RUBY>
						<BAND <GETP ,CH-TRAINED-PIGEON ,P?AUX1> ,K-PIGEON-GET-RUBY>
					>
					<TELL " trembles with excitement">
				)
				(<OR	<BAND <GETP ,CH-TRAINED-PIGEON ,P?AUX1> ,K-PIGEON-SHOWN-RUBY>
						<BAND <GETP ,CH-TRAINED-PIGEON ,P?AUX1> ,K-PIGEON-GET-RUBY>
					>
					<TELL " looks interested">
				)
				(T
					<TELL " doesn't seem interested in anything">
				)
			>
		)
	>
	<TELL "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-DF-CH-SHERMAN"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-CH-SHERMAN ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-SHERMAN" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-SHERMAN>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-CH-ABBEY-GUIDE"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-CH-ABBEY-GUIDE ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-ABBEY-GUIDE" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-ABBEY-GUIDE>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-CH-BANK-GUARD"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-CH-BANK-GUARD ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-BANK-GUARD" .CONTEXT>
		)
		(T
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-CH-WIGGINS"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-CH-WIGGINS ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-WIGGINS" .CONTEXT>
		)
		(T
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-CH-ELIZA-DOOLITTLE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-CH-ELIZA-DOOLITTLE ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-ELIZA-DOOLITTLE" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-ELIZA-DOOLITTLE>
	<TELL
"The flower girl is lying on the ground in a dead faint. She is very
beautiful, but her clothes indicate that she must be poor." CR
	>
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
; "RT-DF-CH-PRIME-MINISTER"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-CH-PRIME-MINISTER ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-PRIME-MINISTER" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-PRIME-MINISTER>
	<TELL
"He is an elderly man with bushy eyebrows and mutton-chop whiskers." CR
	>
	<RTRUE>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-CH-AKBAR"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-CH-AKBAR ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-AKBAR" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-AKBAR>
   <TELL
"He is a tall, dark-skinned Indian who wears a white turban." CR
   >
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-DF-CH-MORIARTY"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-CH-MORIARTY ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-MORIARTY" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-MORIARTY>
	<TELL
"The Professor has a high domed forehead that rises above heavily
lidded, almost reptilian eyes." CR
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-DF-CH-HUDSON"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-CH-HUDSON ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-HUDSON" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-HUDSON>
	<COND
		(<MC-IS? ,CH-HOLMES ,FL-ASLEEP>
			<TELL "Mrs. Hudson appears agitated. She looks at you and says,
\"Mr. Holmes is upstairs, Doctor. Please see what you can do for
him.\"" CR
			>
		)
		(T
			<TELL "Mrs. Hudson appears happy that things are back to
normal." CR
			>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-DF-CH-LESTRADE"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-CH-LESTRADE ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-LESTRADE" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-LESTRADE>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-CH-DENKEEPER"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-CH-DENKEEPER ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-DENKEEPER" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-DENKEEPER>
	<TELL
"He is a scrawny character with a weasel-like face and shifty eyes." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-CH-LIBRARIAN"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-CH-LIBRARIAN ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-LIBRARIAN" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-LIBRARIAN>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-CH-BUTLER"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-CH-BUTLER ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-BUTLER" .CONTEXT>
		)
		(T
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-CH-NANNIES"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-CH-NANNIES ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-NANNIES" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-NANNIES>
	<RFALSE>
>


;-----------------------------------------------------------------------------
; "RT-DF-CH-QUEEN"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-CH-QUEEN ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-QUEEN" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-QUEEN>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-CH-HOUSEWIVES"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-CH-HOUSEWIVES ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-HOUSEWIVES" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-HOUSEWIVES>
	<COND
		(<IN? ,CH-ELIZA-DOOLITTLE ,RM-COVENT-GARDEN>
			<TELL "The women have gathered in a circle around the
girl. They keep looking at you as if they expect you to do something." CR
			>
		)
		(T
			<TELL "The housewives mill among the stalls, haggling
with merchants over prices and looking for bargains."	CR
			>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-DF-CH-PALACE-GUARD"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-CH-PALACE-GUARD ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-PALACE-GUARD" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-PALACE-GUARD>
	<TELL "Looks like any other " D ,CH-PALACE-GUARD "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-DF-CH-URCHINS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-CH-URCHINS ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-URCHINS" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-URCHINS>
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 0>
			<TELL "Despite the hour, the">
		)
		(T
			<TELL "The">
		)
	>
	<TELL " urchins are playing games in the street." CR>
	<COND
		(<MC-IS? ,CH-WIGGINS ,FL-BROKEN>
			<TELL CR ,K-URCHIN-MSG CR>
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-CH-MEMBERS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-CH-MEMBERS ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-CH-DF "CH-MEMBERS" .CONTEXT>
		)
		(T
		)
	>
	<RT-THIS-IS-IT ,CH-MEMBERS>
	<TELL CTHE ,CH-MEMBERS " are all ">
	<COND
		(<MC-ISNOT? ,CH-BUTLER ,FL-ASLEEP>
			<TELL "asleep">
		)
		(T
			<TELL "knocked out by the etherium, although it's hard to tell">
		)
	>
	<TELL "." CR>
	<RTRUE>
>

;*****************************************************************************
; "CONSTANTS"
;*****************************************************************************

<CONSTANT K-SEASICK-MSG
" looks a little green from the motion of the boat"
>

<CONSTANT K-SITTING-QUIETLY-MSG
" is sitting quietly on the seat next to you"
>

<CONSTANT K-SECURELY-BOUND-MSG
" is securely bound to a chair with a thick rope"
>

;*****************************************************************************
; "end of file"
;*****************************************************************************

