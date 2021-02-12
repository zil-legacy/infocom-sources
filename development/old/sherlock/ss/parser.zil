;******************************************************************************
; "game : SHERLOCK!"
; "file : PARSER.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   27 Oct 1987 19:00:52  $"
; "rev  : $Revision:   1.55  $"
; "vers : 1.00"
;******************************************************************************

;*****************************************************************************
; "compiler required constants - none of them can be renamed"
;*****************************************************************************

<CONSTANT SH			 128>				; "held"
<CONSTANT SC			  64>				; "carried"
<CONSTANT SIR			  32>				; "in room"
<CONSTANT SOG			  16>				; "on ground"
<CONSTANT STAKE			8>				; "take"
<CONSTANT SMANY			4>				; "many"
<CONSTANT SHAVE 			2>				; "have"

<CONSTANT LAST-OBJECT	0>				; "the number of the last object"

;******************************************************************************
; "constants"
;******************************************************************************

;<CONSTANT K-CURRENCY-SYMBOL %<ASCII !\$>>

<CONSTANT K-M-BEG      1>				; "room action context begin case"
<CONSTANT K-M-ENTERING 2>				; "room action context entering case"
<CONSTANT K-M-ENTERED  3>				; "room action routine entered case"
<CONSTANT K-M-EXIT     4>				; "room action routine exit case"
<CONSTANT K-M-END      5>				; "room action routine end case"
<CONSTANT K-M-FLOOK    6>				; "???"
<CONSTANT K-M-NLOOK    7>				; "???"
<CONSTANT K-M-WINNER   8>				; "???"
<CONSTANT K-M-CONT     9>				; "for container routine general case"
<CONSTANT K-M-OBJDESC 10>				; "???"
<CONSTANT K-M-CANT    11>           ; "for container routine limitations"
<CONSTANT K-M-FATAL   99>				; "???"

<CONSTANT K-P-LEXWORDS 1>           ; "byte offset to # of entries in LEXV"
<CONSTANT K-P-LEXSTART 1>           ; "word offset to start of LEXV entries"
<CONSTANT K-P-LEXELEN  2>           ; "number of words per LEXV entry"
<CONSTANT K-P-WORDLEN  4>           ; "???"
<CONSTANT K-P-PSOFF    6>           ; "offset to parts of speech byte"
<CONSTANT K-P-P1OFF    7>           ; "offset to first parts of speech"
<CONSTANT K-P-P1BITS   3>           ; "first part of speech mask in PSOFF byte"
<CONSTANT K-P-ITBLLEN  9>           ; "???"

<CONSTANT K-P-VERB     0>				; "???"
<CONSTANT K-P-VERBN    1>				; "???"
<CONSTANT K-P-PREP1    2>				; "???"
<CONSTANT K-P-PREP1N   3>				; "???"
<CONSTANT K-P-PREP2    4>				; "???"
<CONSTANT K-P-NC1      6>				; "???"
<CONSTANT K-P-NC1L     7>				; "???"
<CONSTANT K-P-NC2      8>				; "???"
<CONSTANT K-P-NC2L     9>				; "???"

<CONSTANT K-O-PTR      0>				; "???"
<CONSTANT K-O-START    1>				; "???"
<CONSTANT K-O-LENGTH   2>				; "???"
<CONSTANT K-O-END      3>				; "???"

<CONSTANT K-P-SBITS    0>				; "???"
<CONSTANT K-P-SPREP1   1>				; "???"
<CONSTANT K-P-SPREP2   2>				; "???"
<CONSTANT K-P-SFWIM1   3>				; "???"
<CONSTANT K-P-SONUMS   3>				; "???"
<CONSTANT K-P-SFWIM2   4>				; "???"
<CONSTANT K-P-SLOC1    5>				; "???"
<CONSTANT K-P-SLOC2    6>				; "???"
<CONSTANT K-P-SACTION  7>				; "???"
<CONSTANT K-P-SYNLEN   8> 				; "???"

<CONSTANT K-P-MATCHLEN 0>				; "???"
<CONSTANT K-P-ALL      1>				; "???"
<CONSTANT K-P-ONE      2>				; "???"
<CONSTANT K-P-INHIBIT  4>				; "???"
<CONSTANT K-P-SRCBOT   2>				; "???"
<CONSTANT K-P-SRCTOP   0>				; "???"
<CONSTANT K-P-SRCALL   1>				; "???"

;******************************************************************************
; "globals"
;******************************************************************************

;<GLOBAL GL-TIME-OF-DAY:NUMBER    0> ; "0=Night, 1=Day, 2=Sunrise, 3=Sunset"
<GLOBAL GL-LAST-OUT-TOD:NUMBER   0> ; "see above"

<GLOBAL GL-NOW-LIT?:FLAG			T>	; "GL-WINNER's room lighting status"
<GLOBAL GL-ALW-LIT?:FLAG		  <>> ; "???"

<GLOBAL GL-PRSA:VERB					0>	; "???"
<GLOBAL GL-PRSI:OBJECT				0>	; "???"
<GLOBAL GL-PRSO:OBJECT				0>	; "???"

<GLOBAL GL-P-IT-OBJECT:OBJECT   <>>	; "???"
<GLOBAL GL-P-HER-OBJECT:OBJECT  <>>	; "???"
<GLOBAL GL-P-HIM-OBJECT:OBJECT  <>>	; "???"
<GLOBAL GL-P-THEM-OBJECT:OBJECT <>>	; "???"

<GLOBAL GL-P-QCONTEXT-TH:OBJECT <>>	; "???"
<GLOBAL GL-P-QCONTEXT-RM:OBJECT <>>	; "???"

<GLOBAL GL-P-TABLE:NUMBER			0>	; "???"
<GLOBAL GL-P-SYNTAX:NUMBER			0>	; "???"
<GLOBAL GL-P-LEN:NUMBER				0>	; "???"
<GLOBAL GL-P-DIR:NUMBER				0>	; "???"

<GLOBAL GL-P-GOOD:FLAG			  <>>	; "parser successful"
<GLOBAL GL-P-CONT:FLAG			  <>> ; "parser continue"
<GLOBAL GL-P-QUOT:FLAG			  <>>	; "quote"
<GLOBAL GL-P-ORPH:FLAG			  <>> ; "orphan"

<GLOBAL GL-P-MERGED				  <>>	; "???"
<GLOBAL GL-P-ACLAUSE				  <>>	; "???"
<GLOBAL GL-P-ANAM					  <>>	; "???"
<GLOBAL GL-P-AADJ					  <>>	; "???"

<GLOBAL GL-P-NCN						0>	; "???"

<GLOBAL GL-P-MULT?:FLAG			  <>>	; "???"
<GLOBAL GL-NOW-PRSI?:FLAG		  <>>	; "???"
;<GLOBAL GL-P-DOLLAR-FLAG:FLAG	  <>>	; "???"
<GLOBAL GL-P-TIME-FLAG:FLAG	  <>> ; "a time was entered ##:##:##"
<GLOBAL GL-P-GET-FLAGS				0> ; "???"
<GLOBAL GL-P-END-ON-PREP		  <>>	; "???"
<GLOBAL GL-RESERVE-PTR			  <>>	; "???"
<GLOBAL GL-P-DIRECTION				0>	; "???"
<GLOBAL GL-P-WALK-DIR:DIRECTION <>>	; "???"
<GLOBAL GL-AGAIN-DIR:DIRECTION  <>>	; "???"
<GLOBAL GL-P-DIR-WORD:WORD		  <>>	; "???"
<GLOBAL GL-P-PRSA-WORD:WORD	  <>>	; "???"
<GLOBAL GL-P-NUMBER:NUMBER		  -1>	; "???"
;<GLOBAL GL-P-AMOUNT:NUMBER			0>	; "???"
<GLOBAL GL-P-SLOCBITS				0> ; "???"
<GLOBAL GL-P-GWIMBIT					0>	; "???"
<GLOBAL GL-P-PHR						0> ; "which noun phrase is being parsed?"
<GLOBAL GL-P-AND					  <>>	; "???"
<GLOBAL GL-P-MOBY-FOUND			  <>>	; "???"
<GLOBAL GL-P-MOBY-FLAG			  <>> ; "needed only for ZIL"

;-----------------------------------------------------------------------------
; "parser tables (mostly)"
;-----------------------------------------------------------------------------

;<GLOBAL GL-INSAVE-A:TABLE   <ITABLE BYTE 81>>
;<GLOBAL GL-INSAVE-B:TABLE   <ITABLE BYTE 81>>
;<GLOBAL GL-INSAVE-C:TABLE   <ITABLE BYTE 81>>

<GLOBAL GL-P-P-LEX:TABLE    <ITABLE 59 (LEXV) 0 0>>
<GLOBAL GL-P-S-LEX:TABLE    <ITABLE 59 (LEXV) 0 0>>
<GLOBAL GL-P-T-LEX:TABLE    <ITABLE 59 (LEXV) 0 0>>

<CONSTANT K-P-INBUF-SIZE 80>
<GLOBAL GL-P-PIBUF:TABLE    <ITABLE ,K-P-INBUF-SIZE (BYTE LENGTH) 0>>
<GLOBAL GL-P-RIBUF:TABLE    <ITABLE ,K-P-INBUF-SIZE (BYTE LENGTH) 0>>

<GLOBAL GL-P-ITBL:TABLE     <TABLE 0 0 0 0 0 0 0 0 0 0>>
<GLOBAL GL-P-OTBL:TABLE     <TABLE 0 0 0 0 0 0 0 0 0 0>>
<GLOBAL GL-P-VTBL:TABLE     <TABLE 0 0 0 0>>
<GLOBAL GL-P-OVTBL:TABLE    <TABLE 0 0 0 0>>

<GLOBAL GL-OOPS-INBUF:TABLE <ITABLE ,K-P-INBUF-SIZE (BYTE LENGTH) 0>>
<GLOBAL GL-OOPS-TABLE:TABLE <TABLE <> <> <> <>>>

<GLOBAL GL-P-NAM				 <>>
<GLOBAL GL-P-XNAM				 <>>
<GLOBAL GL-P-NAMW:TABLE     <TABLE 0 0>>

<GLOBAL GL-P-ADJ				 <>>
<GLOBAL GL-P-XADJ				 <>>
<GLOBAL GL-P-ADJW:TABLE     <TABLE 0 0>>

<GLOBAL GL-P-OFW:TABLE      <TABLE 0 0>>

<CONSTANT K-P-OBJ-TBL-LEN 45>		; "Size of parser object tables."
<GLOBAL GL-P-OVERFLOW:FLAG <>>	; "Object tables overflowed."
<GLOBAL GL-P-PRSO:TABLE     <ITABLE NONE ,K-P-OBJ-TBL-LEN>>
<GLOBAL GL-P-PRSI:TABLE     <ITABLE NONE ,K-P-OBJ-TBL-LEN>>   
<GLOBAL GL-P-BUTS:TABLE     <ITABLE NONE ,K-P-OBJ-TBL-LEN>>   
<GLOBAL GL-P-MERGE:TABLE    <ITABLE NONE ,K-P-OBJ-TBL-LEN>>  
<GLOBAL GL-P-OCLAUSE:TABLE  <ITABLE NONE ,K-P-OBJ-TBL-LEN>>

<GLOBAL GL-P-TIME:TABLE     <TABLE 0 0 0>>

<GLOBAL GL-CAN-UNDO:NUMBER 0>

;*****************************************************************************
; "message tables"
;*****************************************************************************

<GLOBAL GL-HOLMES-DESC-TXT:TABLE
	<LTABLE 2
		"Holmes"
		"Your friend"
		"The detective"
		"Your companion"
	>
>

<GLOBAL GL-HOLMES-DESPAIR-TXT:TABLE
	<LTABLE 2
		"grimly"
		"sharply"
		"in despair"
		"severely"
		"for a moment"
	>
>

<GLOBAL GL-HOLMES-IMPOSSIBLE-TXT:TABLE
	<LTABLE 2
		"I thought you had more sense than that, Watson"
		"That can't be done, Watson"
		"That's impossible, Doctor"
		"You can't do that, Watson"
		"You should know better, Doctor"
		"Impossible"
		"Don't be ridiculous, Watson"
	>
>

<GLOBAL GL-WIGGINS-DESC-TXT:TABLE
	<LTABLE 2
		"Wiggins"
		"The boy"
		"The urchin"
		"Your companion"
		"Your assistant"
	>
>

<GLOBAL GL-WIGGINS-IMPOSSIBLE-TXT:TABLE
	<LTABLE 2
		"You must be out of your bleedin' mind"
		"That's ruddy impossible"
		"Not bloody likely"
		"For a toff, you're not too bright"
		"Nice try, Guv"
		"I thought doctors was smart"
	>
>

<GLOBAL GL-IMPOSSIBLE-TXT:TABLE
	<LTABLE 2
		"That's impossible"
		"You can't do that"
		"That can't be done"
		"That won't work"
		"You try, but fail"
	>
>

<GLOBAL GL-NOT-LIKELY-TXT:TABLE 
	<LTABLE 2
	 " is not likely"
	 " seems doubtful"
	 " seems unlikely"
	>
>

<GLOBAL GL-LOOKS-TXT:TABLE
	<LTABLE 2
		"looks"
		"appears"
		"seem to be"
	>
>

<GLOBAL GL-PUZZLED-TXT:TABLE
	<LTABLE 2
		"puzzled"
		"bewildered"
		"confused"
		"perplexed"
	>
>

<GLOBAL GL-BORING-TXT:TABLE
	<LTABLE 2
		"unusual"
		"interesting"
		"extraordinary"
		"special"
	>
>

<GLOBAL GL-NO-POINT-TXT:TABLE
	<LTABLE 2 
		" not do anything useful"
		" accomplish nothing"
		" have no desirable effect"
		" not be very productive"
		" serve no purpose"
		" be pointless"
	>
>

<GLOBAL GL-FOG-TXT:TABLE
	<LTABLE 2 
		"The fog swirls around you"
		"You can barely see through the thick fog"
		"The fog turns everything into an indistinct blur"
		"Wisps of fog creep along the ground"
		"The fog clings to everything like a shroud"
		"Fog blankets everything around you"
	>
>

;*****************************************************************************
; "buzz word tables"
;*****************************************************************************

<GLOBAL GL-BUZZ-TABLE:TABLE
   <PTABLE
      <PLTABLE
         <VOC "WHY" <>> <VOC "HOW" <>> <VOC "HOW\'S" <>>
         <VOC "WHEN" <>> <VOC "WHEN\'S" <>> <VOC "WOULD" <>>
         <VOC "COULD" <>> <VOC "SHOULD" <>>
      >
      <PLTABLE
         <VOC "THAT\'S" <>> <VOC "IT\'S" <>> <VOC "I\'M" <>>
         <VOC "DID" <>> <VOC "THEY\'RE" <>> <VOC "SHALL" <>>
         <VOC "DO" <>> <VOC "HAVE" <>> <VOC "ANY" <>>
         <VOC "I\'LL" <>> <VOC "WHICH" <>> <VOC "WE\'RE" <>>
         <VOC "I\'VE" <>> <VOC "WON\'T" <>> <VOC "HAS" <>>
         <VOC "YOU\'RE" <>> <VOC "HE\'S" <>> <VOC "SHE\'S" <>>
         <VOC "WILL" <>> <VOC "WERE" <>>
      >
      <PLTABLE
         <VOC "ZERO" <>> <VOC "EIGHT" <>> <VOC "NINE" <>>
         <VOC "TEN" <>> <VOC "ELEVEN" <>> <VOC "TWELVE" <>>
         <VOC "THIRTEEN" <>> <VOC "FOURTEEN" <>> <VOC "FIFTEEN" <>>
         <VOC "SIXTEEN" <>> <VOC "SEVENTEEN" <>> <VOC "EIGHTEEN" <>>
         <VOC "NINETEEN" <>> <VOC "TWENTY" <>> <VOC "THIRTY" <>>
         <VOC "FORTY" <>> <VOC "FIFTY" <>> <VOC "SIXTY" <>>
         <VOC "SEVENTY" <>> <VOC "EIGHTY" <>> <VOC "NINETY" <>>
         <VOC "HUNDRED" <>> <VOC "THOUSAND" <>> <VOC "MILLION" <>>
         <VOC "BILLION" <>>
      >
      <PLTABLE
         <VOC "QUIETLY" <>> <VOC "SILENTLY" <>> <VOC "PRIVATELY" <>>
         <VOC "CAREFULLY" <>> <VOC "SLOWLY" <>> <VOC "CLOSELY" <>>
         <VOC "CAUTIOUSLY" <>> <VOC "WARILY" <>> <VOC "GENTLY" <>>
         <VOC "QUICKLY" <>> <VOC "RAPIDLY" <>> <VOC "SWIFTLY" <>>
         <VOC "SUDDENLY" <>> <VOC "BRIEFLY" <>> <VOC "HASTILY" <>>
         <VOC "HURRIEDLY" <>> <VOC "RECKLESSLY" <>>
         <VOC "CARELESSLY" <>>
      >
      <PLTABLE
         <VOC "CURSE" <>> <VOC "GODDAMNED" <>> <VOC "CUSS" <>>
         <VOC "DAMN" <>> <VOC "SHIT" <>> <VOC "FUCK" <>>
         <VOC "SHITHEAD" <>> <VOC "BASTARD" <>> <VOC "ASS" <>>
         <VOC "FUCKING" <>> <VOC "BITCH" <>> <VOC "DAMNED" <>>
         <VOC "COCKSUCKER" <>> <VOC "FUCKED" <>> <VOC "PISS" <>>
         <VOC "CUNT" <>> <VOC "ASSHOLE" <>> <VOC "PEE" <>>
      >
      <PLTABLE
         <VOC "ZORK" <>> <VOC "XYZZY" <>> <VOC "GRUE" <>>
         <VOC "PLUGH" <>> <VOC "OZMOO" <>> <VOC "GNUSTO" <>>
         <VOC "GRUES" <>> <VOC "WISHBRINGER" <>> <VOC "FROTZ" <>>
         <VOC "MAGICK" <>> <VOC "QUENDOR" <>> <VOC "FROBOZZ" <>>
      >
   >
>

;-----------------------------------------------------------------------------
; "GL-CAPS - words to capitalize table"
;-----------------------------------------------------------------------------

<CONSTANT K-NUM-CAPS 15>
<CONSTANT K-CAPS:TABLE
   <PTABLE
      <VOC "N" <>>
      <VOC "E" <>>
      <VOC "S" <>>
      <VOC "W" <>>
		<VOC "I" <>>
      <VOC "MR" <>>
      <VOC "MRS" <>>
      <VOC "MISS" <>>
		<VOC "HOLMES" <>>
		<VOC "WATSON" <>>
		<VOC "ELIZA" <>>
		<VOC "HUDSON" <>>
		<VOC "WIGGINS" <>>
		<VOC "AKBAR" <>>
		<VOC "MORIARTY" <>>
   >
>

;-----------------------------------------------------------------------------
; "GL-SEE-VERBS - see verbs table"
;-----------------------------------------------------------------------------

<GLOBAL GL-SEE-VERBS:TABLE
   <PLTABLE
      V?LOOK
      V?EXAMINE
      V?LOOK-INSIDE
      V?LOOK-ON
      V?READ
      V?FIND
      V?SEARCH
      V?SHOW
      V?LOOK-UNDER
      V?LOOK-BEHIND
      V?LOOK-THRU 
      V?LOOK-DOWN
      V?LOOK-UP
      V?READ-TO
      V?LOOK-OUTSIDE
      V?COUNT
      V?WATCH
   	V?FOCUS-ON
      V?ADJUST
      V?POINT
   >
>

;-----------------------------------------------------------------------------
; "GL-TALK-VERBS - talk verbs table"
;-----------------------------------------------------------------------------

<GLOBAL GL-TALK-VERBS:TABLE
   <PLTABLE
      V?ALARM
      V?ASK-ABOUT
      V?ASK-FOR
      V?GOODBYE
      V?HELLO
		V?NO
		V?PASSWORD
      V?QUESTION
      V?REPLY
      V?SAY
      V?TELL
      V?TELL-ABOUT
      V?THANK
      V?WAVE-AT
      V?WHAT
      V?WHERE
      V?WHO
      V?YELL
		V?YES
   >
>

;-----------------------------------------------------------------------------
; "GL-TOUCH-VERBS - touch verbs table"
;-----------------------------------------------------------------------------

<GLOBAL GL-TOUCH-VERBS:TABLE
   <PLTABLE
      V?ADJUST
      V?BLOW-INTO
      V?BURN-WITH
      V?CLEAN
      V?CLEAN-OFF
      V?CLOSE
      V?COVER
      V?CUT
      V?DETONATE
      V?DIG
      V?DRINK
      V?DRINK-FROM
      V?EAT
      V?EMPTY-INTO
      V?FEED
      V?FILL
      V?FOLD
      V?GIVE
      V?HIT
      V?KICK
      V?LAMP-ON
      V?LAMP-OFF
      V?LIE-DOWN
		V?LIGHT-WITH
      V?LOCK
      V?LOOSEN
      V?LOWER
      V?MELT
      V?MOVE
      V?MUNG
      V?OPEN
      V?OPEN-WITH
      V?PICK
      V?PLAY
      V?PLUG
      V?PULL
      V?PUSH
      V?PUSH-TO
      V?PUT
      V?PUT-BEHIND
      V?PUT-ON
      V?PUT-UNDER
      V?RAISE
      V?REACH-IN
      V?REPAIR
      V?REPLACE
      V?RIP
      V?SCREW
      V?SCREW-WITH
      V?SHAKE
      V?SIT
      V?SPIN
      V?SQUEEZE
      V?STAND-ON
		V?STRIKE
      V?SWING
		V?TAKE
      V?TAKE-OFF
      V?TASTE
      V?TIE
      V?TOUCH
      V?TOUCH-TO
      V?TUNE-TO
      V?TURN
      V?TURN-TO
      V?UNFOLD
      V?UNLOCK
      V?UNSCREW
      V?UNPLUG
      V?UNSCREW-FROM
      V?UNTIE
      V?WIND
      V?WRAP-AROUND
   >
>

;*****************************************************************************
; "String constants"
;*****************************************************************************

<CONSTANT K-WISH-MSG "Gesundheit">

<CONSTANT K-TOO-DARK-MSG "It is too dark to see.">

<CONSTANT K-DONT-UNDERSTAND-MSG "[Please try to express that another way.]">

<CONSTANT K-BE-MORE-SPECIFIC-MSG "[You must be more specific.]">

<CONSTANT K-BE-SPECIFIC-MSG "[Be specific: what do you want to ">

<CONSTANT K-TO-COMPLETE-MSG " to complete this story.]">

;******************************************************************************
; "routines with screen output only"
;******************************************************************************

;-----------------------------------------------------------------------------
; "RT-TO-DO-THING-USE-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-TO-DO-THING-USE-MSG (STR1 STR2)
	 <TELL "[To " .STR1 " something, use the command: " .STR2 " THING.]" CR>
	 <RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-NOT-IN-SENTENCE-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-NOT-IN-SENTENCE-MSG (STR)
	 <TELL "[There are not " .STR " in that sentence.]" CR>
	 <RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-IMPOSSIBLE-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-IMPOSSIBLE-MSG ("AUX" WHO)
	<SET WHO <RT-WHO-SAYS?>>
	<COND
		(<EQUAL? .WHO ,CH-HOLMES ,CH-WIGGINS>
			<COND
				(<EQUAL? .WHO ,CH-HOLMES>
					<TELL
						<RT-PICK-NEXT ,GL-HOLMES-DESC-TXT>
						" looks at you "
						<RT-PICK-NEXT ,GL-HOLMES-DESPAIR-TXT>
						" and says, \""
						<RT-PICK-NEXT ,GL-HOLMES-IMPOSSIBLE-TXT>
					>
				)
				(<EQUAL? .WHO ,CH-WIGGINS>
					<TELL
						<RT-PICK-NEXT ,GL-WIGGINS-DESC-TXT>
						" says, \""
						<RT-PICK-NEXT ,GL-WIGGINS-IMPOSSIBLE-TXT>
					>
				)
			>
			<TELL ".\"">
		)
		(T
			<TELL <RT-PICK-NEXT ,GL-IMPOSSIBLE-TXT> ".">
		)
	>
	<CRLF>
	<RTRUE>
>
	
;-----------------------------------------------------------------------------
; "RT-NOT-LIKELY-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-NOT-LIKELY-MSG (THING STR)
	<TELL "It" <RT-PICK-NEXT ,GL-NOT-LIKELY-TXT> " that " THE .THING>
	<TELL " " .STR "." CR>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-LOOKS-PUZZLED-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-LOOKS-PUZZLED-MSG (WHO)
	<TELL CTHE .WHO " ">
	<TELL <RT-PICK-NEXT ,GL-LOOKS-TXT> " ">
	<TELL <RT-PICK-NEXT ,GL-PUZZLED-TXT> "." CR>
	<RTRUE>
>

;------------------------------------------------------------------------------
; "RT-BUZZ-WORD-MSG?"
;------------------------------------------------------------------------------

<ROUTINE RT-BUZZ-WORD-MSG? (WORD "AUX" TBL)

   <SET TBL <GET ,GL-BUZZ-TABLE 0>>
   <COND
      (<INTBL? .WORD <REST .TBL 2> <GET .TBL 0>> 
         <RT-TO-DO-THING-USE-MSG "ask about" "ASK CHARACTER ABOUT">
         <RTRUE>
      )
   >

   <SET TBL <GET ,GL-BUZZ-TABLE 1>>
   <COND
      (<INTBL? .WORD <REST .TBL 2> <GET .TBL 0>>
         <RT-WAY-TO-TALK-MSG>
         <RTRUE>
      )
   >

   <SET TBL <GET ,GL-BUZZ-TABLE 2>>
   <COND
      (<INTBL? .WORD <REST .TBL 2> <GET .TBL 0>>
         <TELL "[You do not need to use that number" ,K-TO-COMPLETE-MSG CR>
         <RTRUE>
      )
   >

   <SET TBL <GET ,GL-BUZZ-TABLE 3>>
   <COND
      (<INTBL? .WORD <REST .TBL 2> <GET .TBL 0>>
         <TELL "[You do not need to use that adverb" ,K-TO-COMPLETE-MSG CR>
         <RTRUE>
      )
   >

   <SET TBL <GET ,GL-BUZZ-TABLE 4>>
   <COND
      (<INTBL? .WORD <REST .TBL 2> <GET .TBL 0>>
         <TELL ,K-PROFANITY-MSG CR>
         <RTRUE>
      )
   >

   <SET TBL <GET ,GL-BUZZ-TABLE 5>>
   <COND
      (<INTBL? .WORD <REST .TBL 2> <GET .TBL 0>>
         <TELL ,K-WISH-MSG CR>
         <RTRUE>
      )
   >

   <RFALSE>
>

;------------------------------------------------------------------------------
; "RT-WINNER-NOT-HOLDING-MSG"
;------------------------------------------------------------------------------

<ROUTINE RT-WINNER-NOT-HOLDING-MSG ()
	<COND
		(<EQUAL? ,GL-WINNER ,CH-PLAYER>
			<TELL "You are not holding ">
			<RTRUE>
		)
		(T
			<TELL CTHE ,GL-WINNER>
			<COND
				(<MC-ISNOT? ,GL-WINNER ,FL-PLURAL>
					<TELL " does">
				)
				(T
					<TELL " do">
				)
			>
			<TELL " not have ">
			<RTRUE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-YOUD-HAVE-TO-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-YOUD-HAVE-TO-MSG (STR THING)
	<TELL "You would have to " .STR " " THE .THING " to do that." CR>
	<RT-THIS-IS-IT .THING>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-WOULD-HAVE-TO-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-WOULD-HAVE-TO-MSG ("OPTIONAL" (STR <>) (THING <>))   
	<TELL "would have to " .STR " ">
	<COND
		(<MC-T? .THING>
			<TELL THE .THING " ">
		)
	>
	<RT-THIS-IS-IT .THING>
	<RTRUE>
>

;------------------------------------------------------------------------------
; "RT-CAPITALIZE"
;------------------------------------------------------------------------------

<ROUTINE RT-CAPITALIZE (PTR)
	<COND
		(<OR	<MC-T? ,GL-P-ORPH>
				<MC-T? ,GL-P-MERGED>
				>
					<PRINTB <GET .PTR 0>>
		)
		(T
			<PRINTC <- <GETB ,GL-P-PIBUF <GETB .PTR 3>> 32>>
			<RT-WORD-PRINT <- <GETB .PTR 2> 1> <+ <GETB .PTR 3> 1>>
		)
	>
>

;------------------------------------------------------------------------------
; "RT-WORD-PRINT"
;------------------------------------------------------------------------------

<ROUTINE RT-WORD-PRINT (CNT BUF)
   <REPEAT ()
      <COND
         (<DLESS? CNT 0>
            <RTRUE>
         )
         (T
            <PRINTC <GETB ,GL-P-PIBUF .BUF>>
            <SET BUF <+ .BUF 1>>
         )
      >
   >
>

;------------------------------------------------------------------------------
; "RT-VERB-PRINT"
;------------------------------------------------------------------------------

<ROUTINE RT-VERB-PRINT ("AUX" TMP)
	<SET TMP <GET ,GL-P-ITBL ,K-P-VERBN>>
	<COND
		(<ZERO? .TMP>
			<TELL "tell">
		)
		(<ZERO? <GETB ,GL-P-VTBL 2>>
			<PRINTB <GET .TMP 0>>
		)
		(T
			<RT-WORD-PRINT <GETB .TMP 2> <GETB .TMP 3>>
			<PUTB ,GL-P-VTBL 2 0>
		)
	>
>

;------------------------------------------------------------------------------
; "RT-PREP-PRINT"
;------------------------------------------------------------------------------

<ROUTINE RT-PREP-PRINT (PREP "OPTIONAL" (SP? T) "AUX" WRD) 
	<COND
		(<AND	<MC-T? .PREP>
				<ZERO? ,GL-P-END-ON-PREP>
				>
				<COND
					(<MC-T? .SP?>
						<TELL " ">
					)
				>
				<SET WRD <RT-PREP-FIND .PREP>>
				<PRINTB .WRD>
				<COND
					(<AND	<EQUAL? ,W?SIT <GET <GET ,GL-P-ITBL ,K-P-VERBN> 0>>
							<EQUAL? ,W?DOWN .WRD>
							>
							<TELL " on">
					)
				>
				<COND
					(<AND	<EQUAL? ,W?GET <GET <GET ,GL-P-ITBL ,K-P-VERBN> 0>>
							<EQUAL? ,W?OUT .WRD>
							>
							<TELL " of">
					)
				>
				<RTRUE>
		)
	>
>

;------------------------------------------------------------------------------
; "RT-CLAUSE-PRINT"
;------------------------------------------------------------------------------

<ROUTINE RT-CLAUSE-PRINT (BPTR EPTR "OPTIONAL" (THE? T)) 
	<RT-BUFFER-PRINT <GET ,GL-P-ITBL .BPTR> <GET ,GL-P-ITBL .EPTR> .THE?>
>    

;------------------------------------------------------------------------------
; "RT-BUFFER-PRINT"
;------------------------------------------------------------------------------

<ROUTINE RT-BUFFER-PRINT (BEG END CP "AUX" (NOSP <>) WRD (FIRST?? T) (PN <>))
	<REPEAT ()
		<COND
			(<EQUAL? .BEG .END>
				<RETURN>
			)
			(T
				<COND
					(<MC-T? .NOSP>
						<SET NOSP <>>
					)
					(T
						<TELL " ">
					)
				>
				<SET WRD <GET .BEG 0>>
				<COND
					(<OR	<AND	<EQUAL? .WRD ,W?HIM>
									<NOT <RT-VISIBLE? ,GL-P-HIM-OBJECT>>
									>
							<AND	<EQUAL? .WRD ,W?HER>
									<NOT <RT-VISIBLE? ,GL-P-HER-OBJECT>>
									>
							<AND	<EQUAL? .WRD ,W?THEM>
									<NOT <RT-VISIBLE? ,GL-P-THEM-OBJECT>>
									>
							>
								<SET PN T>
					)
				>
				<COND
					(<EQUAL? .WRD ,W?PERIOD>
						<SET NOSP T>
					)
					(<AND <NOT <EQUAL? .WRD ,W?ALL>>
							<OR
								<RT-WT? .WRD ,PS?BUZZ-WORD>
								<RT-WT? .WRD ,PS?PREPOSITION>
							>
							<NOT <RT-WT? .WRD ,PS?ADJECTIVE>>
							<NOT <RT-WT? .WRD ,PS?OBJECT>>
						>
						<SET NOSP T>
					)
					(<EQUAL? .WRD ,W?ME>
						<TELL D ,CH-PLAYER>
						<SET PN T>
					)
					(<INTBL? .WRD ,K-CAPS ,K-NUM-CAPS>
						<RT-CAPITALIZE .BEG>
						<SET PN T>
					)
					(T
						<COND
							(<AND	<MC-T? .FIRST??>
									<ZERO? .PN>
									<MC-T? .CP>
									>
										<TELL "the ">
							)
						>
						<COND
							(<OR	<MC-T? ,GL-P-ORPH>
									<MC-T? ,GL-P-MERGED>
									>
										<PRINTB .WRD>
							)
							(<AND	<EQUAL? .WRD ,W?IT>
									<RT-VISIBLE? ,GL-P-IT-OBJECT>
									>
									<TELL D ,GL-P-IT-OBJECT>
							)
							(<AND	<EQUAL? .WRD ,W?HER>
									<ZERO? .PN>
									>
										<TELL D ,GL-P-HER-OBJECT>
							)
							(<AND	<EQUAL? .WRD ,W?THEM>
									<ZERO? .PN>
									>
										<TELL D ,GL-P-THEM-OBJECT>
							)
							(<AND	<EQUAL? .WRD ,W?HIM>
									<ZERO? .PN>
									>
										<TELL D ,GL-P-HIM-OBJECT>
							)
							(T
								<RT-WORD-PRINT <GETB .BEG 2> <GETB .BEG 3>>
							)
						>
						<SET FIRST?? <>>
					)
				>
			)
		>
		<SET BEG <REST .BEG ,K-P-WORDLEN>>
	>
>

;*****************************************************************************
; "routines with possible screen output"
;*****************************************************************************

;*****************************************************************************
; "routines with screen output and global mods"
;*****************************************************************************
 
;------------------------------------------------------------------------------
; "RT-DONT-KNOW-WORD-MSG"
;------------------------------------------------------------------------------

<ROUTINE RT-DONT-KNOW-WORD-MSG (PTR "AUX" BUF MSG)
	<TELL "[You can play the game from start to finish, solve all the
puzzles, get all the points, and STILL never need to use the word \"">

	<RT-WORD-PRINT <GETB <REST ,GL-P-P-LEX <SET BUF <* .PTR 2>>> 2>
		<GETB <REST ,GL-P-P-LEX .BUF> 3>
	>

	<TELL "\".]" CR>

	<PUT ,GL-OOPS-TABLE ,K-O-PTR .PTR>
	<SETG GL-P-QUOT <>>
	<SETG GL-P-ORPH <>>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-DONT-KNOW-WORD-USE-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-DONT-KNOW-WORD-USE-MSG (PTR "AUX" BUF) 
	<TELL "[This story cannot understand the word \"">

	<RT-WORD-PRINT <GETB <REST ,GL-P-P-LEX <SET BUF <* .PTR 2>>> 2>
		<GETB <REST ,GL-P-P-LEX .BUF> 3>
	>

	<TELL "\" when you use it that way.]" CR>

	<SETG GL-P-QUOT <>>
	<SETG GL-P-ORPH <>>
	<RTRUE>
>

;------------------------------------------------------------------------------
; "RT-NOBODY-TO-ASK-MSG"
;------------------------------------------------------------------------------

<ROUTINE RT-NOBODY-TO-ASK-MSG ()
   <TELL "[There is nobody here to ask.]" CR>

   <RT-P-CLEAR>
   <RTRUE>
>

;------------------------------------------------------------------------------
; "RT-TALK-TO-SELF-MSG"
;------------------------------------------------------------------------------

<ROUTINE RT-TALK-TO-SELF-MSG ()
   <TELL "[You must address characters directly.]" CR>

   <RT-P-CLEAR>
   <RTRUE>
>

;------------------------------------------------------------------------------
; "RT-WAY-TO-TALK-MSG"
;------------------------------------------------------------------------------

<ROUTINE RT-WAY-TO-TALK-MSG ()
   <TELL
"[Refer to your instruction manual for the correct way to address
characters.]" CR
	>

   <RT-P-CLEAR>
   <MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "RT-CANT-SEE-ANY-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-CANT-SEE-ANY-MSG ("OPTIONAL" (THING <>) (STRING? <>) (PRSO? T) "AUX" WRD)
	<RT-CYOU-MSG>
	<TELL "cannot ">
	<COND
		(<MC-VERB? LISTEN>
			<TELL "hear">
		)
		(<MC-VERB? SMELL>
			<TELL "smell">
		)
		(T
			<TELL "see">
		)
	>

	<COND
		(<MC-T? .STRING?>
			<TELL .THING>
		)
		(<AND <MC-T? .THING>
				<NOT <EQUAL? .THING ,TH-NOT-HERE-OBJECT>>
			>
			<TELL " ">
			<COND
				(<MC-ISNOT? .THING ,FL-NOARTC>
					<TELL "any ">
				)
			>
			<TELL D .THING>
		)
		(T
			<COND
				(<AND .THING
						<MC-PRSI? ,TH-NOT-HERE-OBJECT>
					>
					<SET PRSO? <>>
				)
			>
			<SET WRD <GET ,GL-P-NAMW <COND (.PRSO? 0) (T 1)>>>
	
			<COND
				(<NOT <INTBL? .WRD ,K-CAPS ,K-NUM-CAPS>>
					<TELL " any">
				)
			>
			<RT-NOT-HERE-PRINT .PRSO?>
;			<TELL D ,TH-NOT-HERE-OBJECT>
		)
	>

	<TELL " here." CR>

	<SETG GL-P-IT-OBJECT ,TH-NOT-HERE-OBJECT>
	<RT-P-CLEAR>
	<RTRUE>
>

;------------------------------------------------------------------------------
; "RT-TH-NOT-HERE-OBJECT"
;------------------------------------------------------------------------------

<ROUTINE RT-TH-NOT-HERE-OBJECT ("AUX" TBL (PRSO? T) OBJ ; (X <>))
	<COND
		(<AND	<MC-PRSO? TH-NOT-HERE-OBJECT>
				<MC-PRSI? TH-NOT-HERE-OBJECT>
				>
					<TELL "Those things aren't here." CR>
					<RTRUE>
		)
		(<MC-PRSO? TH-NOT-HERE-OBJECT>
			<SET TBL ,GL-P-PRSO>
		)
		(T
			<SET TBL ,GL-P-PRSI>
			<SET PRSO? <>>
		)
	>
	       
	<COND
		(<MC-T? .PRSO?>
			<COND
				(<MC-VERB? FIND WHO WHAT WHERE WAIT-FOR WAIT SAY DRIVE CALL MAKE PASSWORD>
					<SET OBJ <RT-FIND-NOT-HERE .TBL .PRSO?>>
					<COND
						(<MC-T? .OBJ>
							<COND
								(<NOT <EQUAL? .OBJ ,TH-NOT-HERE-OBJECT>>
									<MC-RFATAL>
								)
							>
						)
						(T
							<RFALSE>
						)
					>
				)
			>
		)
		(T
			<COND
				(<MC-VERB? TELL-ABOUT ASK-ABOUT ASK-FOR>
					<SET OBJ <RT-FIND-NOT-HERE .TBL .PRSO?>>
					<COND
						(<MC-T? .OBJ>
							<COND
								(<NOT <EQUAL? .OBJ ,TH-NOT-HERE-OBJECT>>
									<MC-RFATAL>
								)
							>
						)
						(T
							<RFALSE>
						)
					>
				)
			>
		)
	>
	 
	<TELL "[">
	<RT-CYOU-MSG>
	<TELL "cannot ">
	<COND
		(<MC-VERB? LISTEN>
			<TELL "hear">
		)
		(<MC-VERB? SMELL>
			<TELL "smell">
		)
		(T
			<TELL "see">
		)
	>
	<COND
		(<NOT <INTBL? ,GL-P-XNAM ,K-CAPS ,K-NUM-CAPS>>
			<TELL " any">
		)
	>
	<RT-NOT-HERE-PRINT .PRSO?>
	<TELL " here.]" CR>

	<RT-P-CLEAR>
	<MC-RFATAL>
>

;------------------------------------------------------------------------------
; "RT-FAKE-ORPHAN-MSG"
;------------------------------------------------------------------------------

<ROUTINE RT-FAKE-ORPHAN-MSG ("AUX" TMP)
   <RT-ORPHAN ,GL-P-SYNTAX <>>

   <TELL ,K-BE-SPECIFIC-MSG>

   <SET TMP <GET ,GL-P-OTBL ,K-P-VERBN>>
   <COND
      (<ZERO? .TMP>
         <TELL "tell">
      )
      (<ZERO? <GETB ,GL-P-VTBL 2>>
         <PRINTB <GET .TMP 0>>
      )
      (T
         <RT-WORD-PRINT <GETB .TMP 2> <GETB .TMP 3>>
         <PUTB ,GL-P-VTBL 2 0>
      )
   >
   <TELL "?]" CR>

   <SETG GL-P-ORPH T>
   <SETG GL-P-GOOD <>>
   <RTRUE>
>

;*****************************************************************************
; "routines with possible screen output and global mods"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-I-SUN-UP-DOWN-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-I-SUN-UP-DOWN-MSG ("AUX" TOD)
	<COND
		(<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
			<RFALSE>
		)
		(<EQUAL? <RT-CLOCK-CMP 6 30 0> 0>
			<RT-ALARM-SET-REL ,RT-I-SUN-UP-DOWN-MSG <RT-PARM-SET 0 30 0>>
			<SETG GL-LAST-OUT-TOD 1>
			<TELL CR
"Visibility increases in the gathering light of the new day."
			>
			<COND
				(<NOT <EQUAL? ,GL-PLACE-CUR ,RM-THAMES-ONE ,RM-THAMES-TWO ,RM-THAMES-THREE ,RM-THAMES-FOUR ,RM-THAMES-FIVE>>
					<TELL " Tourists are beginning to crowd into the streets.">
				)
			>
			<CRLF>
		)
		(<EQUAL? <RT-CLOCK-CMP 7 0 0> 0>
			<RT-ALARM-SET-REL ,RT-I-SUN-UP-DOWN-MSG <RT-PARM-SET 12 30 0>>
			<SETG GL-LAST-OUT-TOD 2>
			<TELL CR
"The sun comes up, as much as it ever comes up in England." CR
			>
			<RFALSE>
		)
		(<EQUAL? <RT-CLOCK-CMP 19 30 0> 0>
			<RT-ALARM-SET-REL ,RT-I-SUN-UP-DOWN-MSG <RT-PARM-SET 0 30 0>>
			<SETG GL-LAST-OUT-TOD 3>
			<TELL CR
"Daylight begins to fade. Soon it will be dark." CR
			>
		)
		(<EQUAL? <RT-CLOCK-CMP 20 0 0> 0>
			<RT-ALARM-SET-REL ,RT-I-SUN-UP-DOWN-MSG <RT-PARM-SET 10 30 0>>
			<SETG GL-LAST-OUT-TOD 0>
			<TELL CR
"Darkness falls and the mists come in." CR
			>
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-TIME-OF-DAY-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-TIME-OF-DAY-MSG ("AUX" TOD)
	<SET TOD <RT-TIME-OF-DAY>>
	<COND
		(<NOT <MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>>
			<COND
				(<NOT <EQUAL? ,GL-LAST-OUT-TOD .TOD>>
					<CRLF>
					<CRLF>
					<RT-CYOU-MSG "notice" "notices">
					<TELL "that ">
				 	<COND
				 		(<EQUAL? .TOD 1>
		 					<TELL
"the sky is lighter. Soon it will be sunrise." CR
							>
						)
						(<EQUAL? .TOD 2>
							<TELL
"the sun has risen... as much as it ever does in England." CR
							>
						)
						(<EQUAL? .TOD 3>
							<TELL
"the setting sun marks the end of another day. Soon it will be dark." CR
							>
						)
						(T
							<TELL
"the sun has set and the mists have rolled in." CR
							>
						)
					>
				)
			>
			<SETG GL-LAST-OUT-TOD .TOD>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-TIME-OF-DAY"
;-----------------------------------------------------------------------------

<ROUTINE RT-TIME-OF-DAY ("AUX" (TOD <>))
	<COND
		(<EQUAL? <RT-CLOCK-CMP 6 30 0> 1>
			<SET TOD 0>
		)
		(<EQUAL? <RT-CLOCK-CMP 7 0 0> 1>
			<SET TOD 1>
		)
		(<EQUAL? <RT-CLOCK-CMP 19 30 0> 1>
			<SET TOD 2>
		)
		(<EQUAL? <RT-CLOCK-CMP 20 0 0> 1>
			<SET TOD 3>
		)
		(T
			<SET TOD 0>
		)
	>
	<RETURN .TOD>
>

;------------------------------------------------------------------------------
; "RT-SPOKEN-TO-MSG"
;------------------------------------------------------------------------------

<ROUTINE RT-SPOKEN-TO-MSG (WHO)
   <COND
      (<OR  <NOT <EQUAL? .WHO ,GL-P-QCONTEXT-TH>>
            <NOT <EQUAL? ,GL-PLACE-CUR ,GL-P-QCONTEXT-RM>>
			>
			<SETG GL-P-QCONTEXT-TH .WHO>
			<SETG GL-P-QCONTEXT-RM <LOC .WHO>>
			<RT-THIS-IS-IT .WHO>
			<TELL "[spoken to " THE .WHO "]" CR>
      )
   >
   <RTRUE>
>

;------------------------------------------------------------------------------
; "RT-NO-OTHER?"
;------------------------------------------------------------------------------

<ROUTINE RT-NO-OTHER? ("OPTIONAL" (FEMALE? <>) "AUX" OBJ)
	<SET OBJ <FIRST? ,GL-PLACE-CUR>>
	<REPEAT ()
		<COND
			(<MC-F? .OBJ>
				<RETURN>
			)
			(T
				<COND
					(<AND <NOT <EQUAL? .OBJ ,GL-WINNER>>
							<MC-IS? .OBJ ,FL-PERSON>
						>
						<COND
							(<AND	<MC-T? .FEMALE?>
									<MC-IS? .OBJ ,FL-FEMALE>
								>
								<RETURN>
							)
							(<AND	<MC-F? .FEMALE?>
									<MC-ISNOT? .OBJ ,FL-FEMALE>
								>
								<RETURN>
							)
						>
					)
				>
				<SET OBJ <NEXT? .OBJ>>
			)
		>
	>

	<COND
		(<MC-F? .OBJ>
			<RFALSE>
		)
		(T
			<RT-LOOKS-PUZZLED-MSG ,GL-WINNER>
			<TELL "To whom are you referring?" CR>
			<RTRUE>
      )
   >
>

;------------------------------------------------------------------------------
; "RT-SYNTAX-CHECK"
; "Perform syntax matching operations, using GL-P-ITBL as the source of"
; "the verb and adjectives for this input.  Returns false if no"
; "syntax matches, and does it's own orphaning.  If return is true,"
; "the syntax is saved in GL-P-SYNTAX"
;------------------------------------------------------------------------------
 
<ROUTINE RT-SYNTAX-CHECK ("AUX" SYN LEN NUM OBJ (DRIVE1 <>) (DRIVE2 <>)
									PREP VERB) 
	<SET VERB <GET ,GL-P-ITBL ,K-P-VERB>>
	<COND
		(<ZERO? .VERB>
			<RT-NOT-IN-SENTENCE-MSG "any verbs">
			<RFALSE>
		)
	>
	<SET SYN <GET ,VERBS <- 255 .VERB>>>
	<SET LEN <GETB .SYN 0>>
	<SET SYN <REST .SYN>>
	<REPEAT ()
		<SET NUM <BAND <GETB .SYN ,K-P-SBITS> ,K-P-SONUMS>>
		<COND
			(<G? ,GL-P-NCN .NUM>
				T
			)
			(<AND	<NOT <L? .NUM 1>>
					<ZERO? ,GL-P-NCN>
					<OR	<ZERO? <SET PREP <GET ,GL-P-ITBL ,K-P-PREP1>>>
							<EQUAL? .PREP <GETB .SYN ,K-P-SPREP1>>
							>
					>
						<SET DRIVE1 .SYN>
			)
			(<EQUAL? <GETB .SYN ,K-P-SPREP1> <GET ,GL-P-ITBL ,K-P-PREP1>>
				<COND
					(<AND	<EQUAL? .NUM 2>
							<EQUAL? ,GL-P-NCN 1>
							>
								<SET DRIVE2 .SYN>
					)
					(<EQUAL? <GETB .SYN ,K-P-SPREP2> <GET ,GL-P-ITBL ,K-P-PREP2>>
						<RT-SYNTAX-FOUND .SYN>
						<RTRUE>
					)
				>
			)
		>
		<COND
			(<DLESS? LEN 1>
				<COND
					(<OR	<MC-T? .DRIVE1>
							<MC-T? .DRIVE2>
							>
								<RETURN>
					)
					(T
						<TELL ,K-DONT-UNDERSTAND-MSG CR>
						<RFALSE>
					)
				>
			)
			(T
				<SET SYN <REST .SYN ,K-P-SYNLEN>>
			)
		>
	>
	<COND
		(<AND	<MC-T? .DRIVE1>
				<SET OBJ	<RT-GET-WHAT-I-MEAN
					<GETB .DRIVE1 ,K-P-SFWIM1>
			      <GETB .DRIVE1 ,K-P-SLOC1>
			      <GETB .DRIVE1 ,K-P-SPREP1>>>
				>
				<PUT ,GL-P-PRSO ,K-P-MATCHLEN 1>
				<PUT ,GL-P-PRSO 1 .OBJ>
				<RT-SYNTAX-FOUND .DRIVE1>
				<RTRUE>
		)
		(<AND	<MC-T? .DRIVE2>
				<SET OBJ <RT-GET-WHAT-I-MEAN
					<GETB .DRIVE2 ,K-P-SFWIM2>
					<GETB .DRIVE2 ,K-P-SLOC2>
					<GETB .DRIVE2 ,K-P-SPREP2>>>
				>
				<PUT ,GL-P-PRSI ,K-P-MATCHLEN 1>
				<PUT ,GL-P-PRSI 1 .OBJ>
				<RT-SYNTAX-FOUND .DRIVE2>
				<RTRUE>
		)
		(<EQUAL? .VERB ,ACT?FIND ; ,ACT?WHAT>
			<TELL ,K-DO-IT-YOURSELF-MSG CR>
			<RFALSE>
		)
		(T
			<COND
				(<EQUAL? ,GL-WINNER ,CH-PLAYER>
					<RT-ORPHAN .DRIVE1 .DRIVE2>
					<TELL "[Wh">
				)
				(T
					<TELL "[Your command was not complete. Type wh">
				)
			>
			<COND
				(<EQUAL? .VERB ,ACT?WALK ,ACT?GO>
					<TELL "ere">
				)
				(<OR	<AND	<MC-T? .DRIVE1>
								<EQUAL? <GETB .DRIVE1 ,K-P-SFWIM1> ,FL-PERSON>
								>
						<AND	<MC-T? .DRIVE2>
								<EQUAL? <GETB .DRIVE2 ,K-P-SFWIM2> ,FL-PERSON>
								>
						>
							<TELL "om">
				)
				(T
					<TELL "at">
				)
			>
			<COND
				(<EQUAL? ,GL-WINNER ,CH-PLAYER>
					<TELL " do you want to ">
				)
				(T
					<TELL " you want " THE ,GL-WINNER " to ">
				)
			>
			<RT-VERB-PRINT>
			<COND
				(<MC-T? .DRIVE2>
					<RT-CLAUSE-PRINT ,K-P-NC1 ,K-P-NC1L>
				)
			>
			<SETG GL-P-END-ON-PREP <>>
			<RT-PREP-PRINT
				<COND
					(<MC-T? .DRIVE1>
						<GETB .DRIVE1 ,K-P-SPREP1>
					)
					(T
						<GETB .DRIVE2 ,K-P-SPREP2>
					)
				>
			>
			<COND
				(<EQUAL? ,GL-WINNER ,CH-PLAYER>
						<SETG GL-P-ORPH T>
						<TELL "?]" CR>
				)
				(T
					<SETG GL-P-ORPH <>>
					<TELL ".]" CR>
				)
			>
			<RFALSE>
		)
	>
>

;------------------------------------------------------------------------------
; "RT-CLAUSE"
; "scan through a noun phrase, leaving a pointer to its starting location"
;------------------------------------------------------------------------------

<ROUTINE RT-CLAUSE (PTR VAL WRD "AUX" OFF NUM (ANDFLG <>) (FIRST?? T) NW (LW 0))
                     <SET OFF <* <- ,GL-P-NCN 1> 2>>
   <COND
      (<MC-T? .VAL>
         <PUT ,GL-P-ITBL <SET NUM <+ ,K-P-PREP1 .OFF>> .VAL>
         <PUT ,GL-P-ITBL <+ .NUM 1> .WRD>
         <SET PTR <+ .PTR ,K-P-LEXELEN>>
      )
      (T
         <SETG GL-P-LEN <+ ,GL-P-LEN 1>>
      )
   >

   <COND
      (<ZERO? ,GL-P-LEN>
         <SETG GL-P-NCN <- ,GL-P-NCN 1>>
         <RETURN -1>
      )
   >

   <PUT ,GL-P-ITBL <SET NUM <+ ,K-P-NC1 .OFF>> <REST ,GL-P-P-LEX <* .PTR 2>>>

   <COND
      (<EQUAL? <GET ,GL-P-P-LEX .PTR> ,W?THE ,W?A ,W?AN>
         <PUT ,GL-P-ITBL .NUM <REST <GET ,GL-P-ITBL .NUM> 4>>
      )
   >

   <REPEAT ()
      <COND
         (<L? <SETG GL-P-LEN <- ,GL-P-LEN 1>> 0>
            <PUT ,GL-P-ITBL <+ .NUM 1> <REST ,GL-P-P-LEX <* .PTR 2>>>
            <RETURN -1>
         )
      >

      <COND
         (<RT-BUZZ-WORD-MSG? <SET WRD <GET ,GL-P-P-LEX .PTR>>>
            <RFALSE>
         )
         (<OR  <MC-T? .WRD>
               <SET WRD <RT-NUMBER? .PTR>>
;              <SET WRD <NAME? .PTR>>
               >
               <COND
                  (<ZERO? ,GL-P-LEN>
                     <SET NW 0>
                  )
                  (T
                     <SET NW <GET ,GL-P-P-LEX <+ .PTR ,K-P-LEXELEN>>>
                  )
               >
;              <COND
                  (<AND <EQUAL? .WRD ,W?OF>
                        <EQUAL? <GET ,GL-P-ITBL ,K-P-VERB>
                           ,ACT?MAKE ,ACT?TAKE>
                        >
                           <RT-CHANGE-LEXV .PTR ,W?WITH>
                           <SET WRD ,W?WITH>
                  )
               >
               <COND
                  (<AND <EQUAL? .WRD ,W?PERIOD>
                        <OR   <EQUAL? .LW ,W?MR ,W?MRS ,W?MISS>
                              <EQUAL? .LW ,W?DR>
                              >
                        >
                           <SET LW 0>
                  )
                  (<EQUAL? .WRD ,W?AND ,W?COMMA>
                     <SET ANDFLG T>
                  )
                  (<EQUAL? .WRD ,W?ALL ,W?BOTH ,W?EVERYTHING>
                     <COND
                        (<EQUAL? .NW ,W?OF>
                           <SETG GL-P-LEN <- ,GL-P-LEN 1>>
                           <SET PTR <+ .PTR ,K-P-LEXELEN>>
                        )
                     >
                  )
                  (<OR  <EQUAL? .WRD ,W?THEN ,W?PERIOD>
                        <AND  <RT-WT? .WRD ,PS?PREPOSITION>
                              <GET ,GL-P-ITBL ,K-P-VERB>
                              <NOT .FIRST??>
                              >
                        >
								<SETG GL-P-LEN <+ ,GL-P-LEN 1>>
								<PUT ,GL-P-ITBL
								<+ .NUM 1>
								<REST ,GL-P-P-LEX <* .PTR 2>>>
								<RETURN <- .PTR ,K-P-LEXELEN>>
						)
						(<AND <MC-T? .ANDFLG>
								<OR	<ZERO? <GET ,GL-P-ITBL ,K-P-VERBN>>
										<RT-VERB-DIR-ONLY? .WRD>
										>
								>
									<SET PTR <- .PTR 4>>
									<RT-CHANGE-LEXV <+ .PTR 2> ,W?THEN>
									<SETG GL-P-LEN <+ ,GL-P-LEN 2>>
						)
						(<RT-WT? .WRD ,PS?OBJECT>
							<COND
								(<AND	<G? ,GL-P-LEN 0>
										<EQUAL? .NW ,W?OF>
										<NOT <EQUAL? .WRD ,W?ALL ,W?EVERYTHING>>
										>
											<PUT ,GL-P-OFW <- ,GL-P-NCN 1> .WRD>
								)
								(<AND <RT-WT? .WRD ,PS?ADJECTIVE>
										<MC-T? .NW>
										<RT-WT? .NW ,PS?OBJECT>
										>
											T
								)
								(<AND	<ZERO? .ANDFLG>
										<NOT <EQUAL? .NW ,W?BUT ,W?EXCEPT>>
										<NOT <EQUAL? .NW ,W?AND ,W?COMMA>>
										>
											<PUT ,GL-P-ITBL <+ .NUM 1>
												<REST ,GL-P-P-LEX <* <+ .PTR 2> 2>>
											>
											<RETURN .PTR>
								)
								(T
									<SET ANDFLG <>>
								)
							>
						)
						(<AND <OR	<MC-T? ,GL-P-MERGED>
										<MC-T? ,GL-P-ORPH>
										<MC-T? <GET ,GL-P-ITBL ,K-P-VERB>>
										>
								<OR	<RT-WT? .WRD ,PS?ADJECTIVE>
										<RT-WT? .WRD ,PS?BUZZ-WORD>
										>
								>
						)
						(<AND	<MC-T? .ANDFLG>
								<ZERO? <GET ,GL-P-ITBL ,K-P-VERB>>
								>
									<SET PTR <- .PTR 4>>
									<RT-CHANGE-LEXV <+ .PTR 2> ,W?THEN>
									<SETG GL-P-LEN <+ ,GL-P-LEN 2>>
						)
						(<RT-WT? .WRD ,PS?PREPOSITION>
							T
						)
						(T
							<RT-DONT-KNOW-WORD-USE-MSG .PTR>
							<RFALSE>
						)
					>
			)
			(T
				<RT-DONT-KNOW-WORD-MSG .PTR>
				<RFALSE>
			)
		>
		<SET LW .WRD>
		<SET FIRST?? <>>
		<SET PTR <+ .PTR ,K-P-LEXELEN>>
	>
>

;------------------------------------------------------------------------------
; "RT-GET-WHAT-I-MEAN"
;------------------------------------------------------------------------------

<ROUTINE RT-GET-WHAT-I-MEAN (GBIT LBIT PREP "AUX" OBJ)
	<COND
		(<EQUAL? .GBIT ,FL-LOCATION>
			<RETURN ,ROOMS>
		)
		(<AND	<MC-T? ,GL-P-IT-OBJECT>
				<MC-IS? ,GL-P-IT-OBJECT .GBIT>
				>
					<TELL "[" THE ,GL-P-IT-OBJECT "]" CR>
					<RETURN ,GL-P-IT-OBJECT>
		)
	>
	<SETG GL-P-GWIMBIT .GBIT>
	<SETG GL-P-SLOCBITS .LBIT>
	<PUT ,GL-P-MERGE ,K-P-MATCHLEN 0>
	<COND
		(<RT-GET-OBJECT ,GL-P-MERGE <>>
			<SETG GL-P-GWIMBIT 0>
			<COND
				(<EQUAL? <GET ,GL-P-MERGE ,K-P-MATCHLEN> 1>
					<SET OBJ <GET ,GL-P-MERGE 1>>
					<COND
						(<AND	<EQUAL? ,GL-WINNER ,CH-PLAYER>
								<NOT <EQUAL? .OBJ ,TH-HANDS>>
								>
									<TELL "[">
									<COND
										(<RT-PREP-PRINT .PREP <>>
											<MC-SPACE>
										)
									>
									<TELL THE .OBJ>
									<TELL "]" CR>
						)
					>
					<RETURN .OBJ>
				)
			>
		)
		(T
			<SETG GL-P-GWIMBIT 0>
			<RFALSE>
		)
	>
>

;*****************************************************************************
; "routines with no screen output"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-P-CLEAR"
;-----------------------------------------------------------------------------

<ROUTINE RT-P-CLEAR ()
	 <SETG GL-P-CONT <>>
	 <SETG GL-P-QUOT <>>
	 <RTRUE>
>

;------------------------------------------------------------------------------
; "RT-PICK-NEXT"
;------------------------------------------------------------------------------

<ROUTINE RT-PICK-NEXT (TBL "AUX" CNT STR)
	<SET CNT <GET .TBL 1>>
	<SET STR <GET .TBL .CNT>>       
	<INC CNT>
	<COND
		(<G? .CNT <GET .TBL 0>>
			<SET CNT 2>
		)
	>
	<PUT .TBL 1 .CNT>
	<RETURN .STR>
>

;------------------------------------------------------------------------------
; "RT-QCONTEXT-GOOD?"
;------------------------------------------------------------------------------

<ROUTINE RT-QCONTEXT-GOOD? ()
	<COND
		(<AND	<MC-T? ,GL-P-QCONTEXT-TH>
				<MC-IS? ,GL-P-QCONTEXT-TH ,FL-PERSON>
				<EQUAL? ,GL-PLACE-CUR ,GL-P-QCONTEXT-RM>
				<RT-VISIBLE? ,GL-P-QCONTEXT-TH>
				>
					<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-FIND-PERSON"
;-----------------------------------------------------------------------------

<ROUTINE RT-FIND-PERSON (THING "AUX" OBJ OBJ1 (WHO-P <>) (WHO-A <>))
	<SET OBJ <FIRST? .THING>>
	<REPEAT ()
		<COND
			(<ZERO? .OBJ>
				<RETURN>
			)
			(<MC-IS? .OBJ ,FL-PERSON>
            <COND
               (<AND <MC-ISNOT? .OBJ ,FL-PLURAL>
							<NOT <EQUAL? .OBJ ,CH-PLAYER ,GL-WINNER>>
						>
						<COND
							(<MC-IS? .OBJ ,FL-ASLEEP>
								<SET WHO-A .OBJ>
							)
							(<EQUAL? .OBJ ,GL-PUPPY>
								<SET WHO-P .OBJ>
							)
							(T
								<RETURN>
							)
						>
               )
            >
			)
         (<OR  <MC-IS? .OBJ ,FL-SURFACE>
               <AND
                  <MC-IS? .OBJ ,FL-CONTAINER>
                  <MC-IS? .OBJ ,FL-OPENED>
               >
            >
            <SET OBJ1 .OBJ>
            <COND
               (<SET OBJ <RT-FIND-PERSON .OBJ>>
						<COND
							(<MC-IS? .OBJ ,FL-ASLEEP>
								<SET WHO-A .OBJ>
							)
							(<EQUAL? .OBJ ,GL-PUPPY>
								<SET WHO-P .OBJ>
							)
							(T
								<RETURN>
							)
						>
               )
            >
            <SET OBJ .OBJ1>
         )
      >
		<SET OBJ <NEXT? .OBJ>>
	>
	<COND
		(<MC-T? .OBJ>
			<RETURN .OBJ>
		)
		(<MC-T? .WHO-P>
			<RETURN .WHO-P>
		)
		(<MC-T? .WHO-A>
			<RETURN .WHO-A>
		)
	>
	<RFALSE>
>

;------------------------------------------------------------------------------
; "RT-ANYONE-HERE?"
;------------------------------------------------------------------------------

<ROUTINE RT-ANYONE-HERE? ()
	<COND
		(<RT-QCONTEXT-GOOD?>
			<RETURN ,GL-P-QCONTEXT-TH>
		)
		(T
			<RETURN <RT-FIND-PERSON ,GL-PLACE-CUR>>
		)
	>
>

;------------------------------------------------------------------------------
; "RT-MOVE-ALL"
;------------------------------------------------------------------------------

<ROUTINE RT-MOVE-ALL (FROM TO "AUX" OBJ NXT)
	<SET OBJ <FIRST? .FROM>>
	<REPEAT ()
		<COND
			(<ZERO? .OBJ>
				<RTRUE>
			)
		>
		<SET NXT <NEXT? .OBJ>>
		<MOVE .OBJ .TO>
		<SET OBJ .NXT>
	>
	<RTRUE>
>

;------------------------------------------------------------------------------
; "RT-GOT?"
;------------------------------------------------------------------------------

<ROUTINE RT-GOT? (OBJ)
	<COND
		(<ZERO? .OBJ>
			<RFALSE>
		)
		(<AND	<EQUAL? ,GL-WINNER ,CH-PLAYER>
				<IN? .OBJ ,TH-POCKET>
				>
					<RTRUE>
		)
		(<RT-HELD? .OBJ>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;------------------------------------------------------------------------------
; "RT-HELD?"
;------------------------------------------------------------------------------

<ROUTINE RT-HELD? (OBJ "AUX" L)
	<COND
		(<ZERO? .OBJ>
			<RFALSE>
		)
		(<AND	<NOT <MC-IS? .OBJ ,FL-TAKEABLE>>
				<NOT <MC-IS? .OBJ ,FL-TRYTAKE>>
				>
					<RFALSE>
		)
	>
	<SET L <LOC .OBJ>>
	<COND
		(<EQUAL? .L <> ,ROOMS ,GLOBAL-OBJECTS>
			<RFALSE>
		)
		(<EQUAL? .L ,GL-WINNER>
			<RTRUE>
		)
		(<AND	<EQUAL? ,GL-WINNER ,CH-PLAYER>
				<EQUAL? .L ,TH-POCKET>
				>
					<RFALSE>
		)
		(T
			<RT-HELD? .L>
		)
	>
>

;------------------------------------------------------------------------------
; "RT-THIS-IS-IT"
;------------------------------------------------------------------------------

<ROUTINE RT-THIS-IS-IT (OBJ)
   <COND
      (<OR  <EQUAL? .OBJ <> ,CH-PLAYER ,TH-NOT-HERE-OBJECT>
            <EQUAL? .OBJ ,TH-INTDIR ,TH-INTNUM>
            <EQUAL? .OBJ ,TH-LEFT ,TH-RIGHT>
            >
               <RTRUE>
      )
      (<AND <MC-VERB? WALK WALK-TO>
            <EQUAL? .OBJ ,GL-PRSO>
            >
               <RTRUE>
      )
		(<AND	<MC-IS? .OBJ ,FL-PERSON>
				<MC-IS? .OBJ ,FL-FEMALE>
				>
		         <SETG GL-P-HER-OBJECT .OBJ>
		         <RTRUE>
      )
		(<AND	<MC-IS? .OBJ ,FL-PERSON>
				<MC-ISNOT? .OBJ ,FL-FEMALE>
				>
		         <SETG GL-P-HIM-OBJECT .OBJ>
		         <RTRUE>
      )
		(<MC-IS? .OBJ ,FL-COLLECTIVE>
         <SETG GL-P-THEM-OBJECT .OBJ>
         <SETG GL-P-IT-OBJECT .OBJ>
         <RTRUE>
		)
      (<MC-IS? .OBJ ,FL-PLURAL>
         <SETG GL-P-THEM-OBJECT .OBJ>
         <RTRUE>
      )
      (T
         <SETG GL-P-IT-OBJECT .OBJ>
         <RTRUE>
      )
   >
>

;------------------------------------------------------------------------------
; "RT-CHANGE-LEXV"
;------------------------------------------------------------------------------

<ROUTINE RT-CHANGE-LEXV (PTR WRD "OPTIONAL" (PTRS? <>) "AUX" X Y Z)
   <COND
      (<MC-T? .PTRS?>
         <SET X <+ 2 <* 2 <- .PTR ,K-P-LEXELEN>>>>
         <SET Y <GETB ,GL-P-P-LEX .X>>
         <SET Z <+ 2 <* 2 .PTR>>>
         <PUTB ,GL-P-P-LEX .Z .Y>
         <PUTB ,GL-P-S-LEX .Z .Y>
         <SET Y <GETB ,GL-P-P-LEX <+ 1 .X>>>
         <SET Z <+ 3 <* 2 .PTR>>>
         <PUTB ,GL-P-P-LEX .Z .Y>
         <PUTB ,GL-P-S-LEX .Z .Y>
      )
   >
   <PUT ,GL-P-P-LEX .PTR .WRD>
   <PUT ,GL-P-S-LEX .PTR .WRD>
   <RTRUE>
>

;------------------------------------------------------------------------------
; "RT-WT?"
;  "Check whether word pointed at by PTR is the correct part of speech."
;  "The second argument is the part of speech (,PS?<part of speech>).  The"
;  "3rd argument (,P1?<part of speech>), if given, causes the value"
;  "for that part of speech to be returned."
;------------------------------------------------------------------------------
 
<ROUTINE RT-WT? (PTR BIT "OPTIONAL" (B1 5) "AUX" (OFFS ,K-P-P1OFF) TYP)
   <COND
      (<BTST <SET TYP <GETB .PTR ,K-P-PSOFF>> .BIT>
         <COND
            (<G? .B1 4>
               <RTRUE>
            )
            (T
               <SET TYP <BAND .TYP ,K-P-P1BITS>>
               <COND
                  (<NOT <EQUAL? .TYP .B1>>
                     <SET OFFS <+ .OFFS 1>>
                  )
               >
               <GETB .PTR .OFFS>
            )
         >
      )
   >
>

;------------------------------------------------------------------------------
; "RT-VERB-DIR-ONLY?"
;------------------------------------------------------------------------------

<ROUTINE RT-VERB-DIR-ONLY? (WRD)
   <COND
      (<AND <NOT <RT-WT? .WRD ,PS?OBJECT>>
            <NOT <RT-WT? .WRD ,PS?ADJECTIVE>>
            <OR   <RT-WT? .WRD ,PS?DIRECTION>
                  <RT-WT? .WRD ,PS?VERB>
                  >
            >
               <RTRUE>
      )
      (T
         <RFALSE>
      )
   >
>

;------------------------------------------------------------------------------
; "RT-STUFF"
; "for AGAIN purposes, put contents of one LEXV table into another"
;------------------------------------------------------------------------------

<ROUTINE RT-STUFF (DEST SRC "OPTIONAL" (MAX 29)
                  "AUX" (PTR ,K-P-LEXSTART) (CTR 1) BPTR)
   <PUTB .DEST 0 <GETB .SRC 0>>
   <PUTB .DEST 1 <GETB .SRC 1>>
   <REPEAT ()
      <PUT .DEST .PTR <GET .SRC .PTR>>
      <SET BPTR <+ <* .PTR 2> 2>>
      <PUTB .DEST .BPTR <GETB .SRC .BPTR>>
      <SET BPTR <+ <* .PTR 2> 3>>
      <PUTB .DEST .BPTR <GETB .SRC .BPTR>>
      <SET PTR <+ .PTR ,K-P-LEXELEN>>
      <COND
         (<IGRTR? CTR .MAX>
            <RETURN>
         )
      >
   >
>

;------------------------------------------------------------------------------
; "RT-INBUF-STUFF"
; "put contents of one INBUF into another"
;------------------------------------------------------------------------------

;<ROUTINE RT-INBUF-STUFF (DEST SRC "AUX" CNT)
;  <SET CNT <- <GETB .SRC 0> 1>>
	<SET CNT <GETB .SRC 0>>
	<COPYT .SRC .DEST .CNT>
;  <REPEAT ()
      <PUTB .DEST .CNT <GETB .SRC .CNT>>
      <COND
         (<DLESS? CNT 0>
            <RTRUE>
         )
      >
   >
> 

;------------------------------------------------------------------------------
; "RT-INBUF-ADD"
; "put the word in the positions specified from GL-P-PIBUF to the end of"
; "GL-OOPS-INBUF, leaving the appropriate pointers in GL-P-S-LEX"
;------------------------------------------------------------------------------

<ROUTINE RT-INBUF-ADD (LEN BEG SLOT "AUX" DBEG (CTR 0) TMP)
   <SET TMP <GET ,GL-OOPS-TABLE ,K-O-END>>
   <COND
      (<MC-T? .TMP>
         <SET DBEG .TMP>
      )
      (T
         <SET DBEG <+ <GETB ,GL-P-S-LEX
            <SET TMP <GET ,GL-OOPS-TABLE ,K-O-LENGTH>>>
			     <GETB ,GL-P-S-LEX <+ .TMP 1>>>>
      )
   >

   <PUT ,GL-OOPS-TABLE ,K-O-END <+ .DBEG .LEN>>

   <REPEAT ()
      <PUTB ,GL-OOPS-INBUF <+ .DBEG .CTR>
         <GETB ,GL-P-PIBUF <+ .BEG .CTR>>>
      <INC CTR>
      <COND
         (<EQUAL? .CTR .LEN>
            <RETURN>
         )
      >
   >

   <PUTB ,GL-P-S-LEX .SLOT .DBEG>
   <PUTB ,GL-P-S-LEX <- .SLOT 1> .LEN>
   <RTRUE>
>

;------------------------------------------------------------------------------
; "RT-NUMBER?"
;------------------------------------------------------------------------------

;<ROUTINE RT-NUMBER? (PTR "AUX" TMP CNT BPTR (TPTR ,K-HRS) CHR (SUM 0) (TIM <>) (DOLLAR <>))
	<SET TMP <REST ,GL-P-P-LEX <* .PTR 2>>>
   <SET CNT <GETB .TMP 2>>
   <SET BPTR <GETB .TMP 3>>

   <REPEAT ()
      <COND
         (<L? <SET CNT <- .CNT 1>> 0>
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
               (<EQUAL? .CHR ,K-CURRENCY-SYMBOL>
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
			<COND
				(<OR	<L? .SUM 1>
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
	<SET TIM T>
	<SET SUM 0>

   <RT-CHANGE-LEXV .PTR ,W?INTNUM>

   <COND
      (<G? .SUM 9999>
         <RFALSE>
      )
      (<MC-T? .TIM>
         <SET SUM 0>
      )
   >

   <SETG GL-P-DOLLAR-FLAG .DOLLAR>
	<SETG GL-P-TIME-FLAG .TIM>

   <COND
      (<AND <MC-T? .DOLLAR>
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

;------------------------------------------------------------------------------
; "RT-ACLAUSE-WIN"
;------------------------------------------------------------------------------

<ROUTINE RT-ACLAUSE-WIN (ADJ "AUX" X) 
   <PUT ,GL-P-ITBL ,K-P-VERB <GET ,GL-P-OTBL ,K-P-VERB>>
   <SET X <+ ,GL-P-ACLAUSE 1>>
   <RT-CLAUSE-COPY ,GL-P-OTBL ,GL-P-OTBL ,GL-P-ACLAUSE .X
      ,GL-P-ACLAUSE .X .ADJ
	>
   <AND <MC-T? <GET ,GL-P-OTBL ,K-P-NC2>> <SETG GL-P-NCN 2>>
   <SETG GL-P-ACLAUSE <>>
   <RTRUE>
>

;------------------------------------------------------------------------------
; "RT-NCLAUSE-WIN"
;------------------------------------------------------------------------------

<ROUTINE RT-NCLAUSE-WIN ()
   <RT-CLAUSE-COPY ,GL-P-ITBL ,GL-P-OTBL ,K-P-NC1 ,K-P-NC1L
      ,GL-P-ACLAUSE <+ ,GL-P-ACLAUSE 1>
	>
   <AND <MC-T? <GET ,GL-P-OTBL ,K-P-NC2>> <SETG GL-P-NCN 2>>
	<SETG GL-P-ACLAUSE <>>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-ORPHAN-VERB"
;-----------------------------------------------------------------------------

<ROUTINE RT-ORPHAN-VERB (VERB PREVERB)
	<PUT ,GL-P-VTBL	0				.VERB>

	<PUT ,GL-P-OTBL	,K-P-VERB	.PREVERB>
	<PUT ,GL-P-OTBL	,K-P-VERBN	,GL-P-VTBL>
	<PUT ,GL-P-OTBL	,K-P-PREP1	0>
	<PUT ,GL-P-OTBL	,K-P-PREP1N	0>
	<PUT ,GL-P-OTBL	,K-P-PREP2	0>
	<PUT ,GL-P-OTBL	5 				0>
	<PUT ,GL-P-OTBL	,K-P-NC1		1>
	<PUT ,GL-P-OTBL	,K-P-NC1L	0>
	<PUT ,GL-P-OTBL	,K-P-NC2		0>
	<PUT ,GL-P-OTBL	,K-P-NC2L	0>

	<SETG GL-P-ORPH	T>
>

;------------------------------------------------------------------------------
; "RT-ORPHAN"
;------------------------------------------------------------------------------

<ROUTINE RT-ORPHAN (D1 D2 "AUX" (CNT -1)) 
	<COND
		(<ZERO? ,GL-P-MERGED>
			<PUT ,GL-P-OCLAUSE ,K-P-MATCHLEN 0>
		)
	>
	<PUT ,GL-P-OVTBL 0 <GET ,GL-P-VTBL 0>>
	<PUTB ,GL-P-OVTBL 2 <GETB ,GL-P-VTBL 2>>
	<PUTB ,GL-P-OVTBL 3 <GETB ,GL-P-VTBL 3>>
	<REPEAT ()
		<COND
			(<IGRTR? CNT ,K-P-ITBLLEN>
				<RETURN>
			)
			(T
				<PUT ,GL-P-OTBL .CNT <GET ,GL-P-ITBL .CNT>>
			)
		>
	>
	<COND
		(<EQUAL? ,GL-P-NCN 2>
			<RT-CLAUSE-COPY ,GL-P-ITBL ,GL-P-OTBL ,K-P-NC2 ,K-P-NC2L ,K-P-NC2 ,K-P-NC2L>
		)
	>
	<COND
		(<NOT <L? ,GL-P-NCN 1>>
			<RT-CLAUSE-COPY ,GL-P-ITBL ,GL-P-OTBL ,K-P-NC1 ,K-P-NC1L ,K-P-NC1 ,K-P-NC1L>
		)
	>
	<COND
		(<MC-T? .D1>
			<PUT ,GL-P-OTBL ,K-P-PREP1 <GETB .D1 ,K-P-SPREP1>>
			<PUT ,GL-P-OTBL ,K-P-NC1 1>
		)
		(<MC-T? .D2>
			<PUT ,GL-P-OTBL ,K-P-PREP2 <GETB .D2 ,K-P-SPREP2>>
			<PUT ,GL-P-OTBL ,K-P-NC2 1>
		)
	>
> 

;------------------------------------------------------------------------------
; "RT-ORPHAN-MERGE"
;------------------------------------------------------------------------------

<ROUTINE RT-ORPHAN-MERGE ("AUX" (CNT -1) TEMP VERB BEG END (ADJ <>) WRD) 
	<SETG GL-P-ORPH <>>
	<COND
		(<OR	<EQUAL? <RT-WT? <SET WRD <GET <GET ,GL-P-ITBL ,K-P-VERBN> 0>>
					,PS?VERB ,P1?VERB> <GET ,GL-P-OTBL ,K-P-VERB>>
				<RT-WT? .WRD ,PS?ADJECTIVE>
				>
					<SET ADJ T>
		)
		(<RT-WT? <SET WRD <GET <GET ,GL-P-ITBL ,K-P-VERBN> 0>>
			,PS?ADJECTIVE ;,P1?ADJECTIVE>
				<SET ADJ T>
		)
		(<AND	<RT-WT? .WRD ,PS?OBJECT ;,P1?OBJECT>
				<ZERO? ,GL-P-NCN>
				<MC-T? <SET VERB <GET ,GL-P-ITBL ,K-P-VERB>>> ; "ADDED 8/24/87 PER SWG"
				>
					<PUT ,GL-P-ITBL ,K-P-VERB 0>
					<PUT ,GL-P-ITBL ,K-P-VERBN 0>
					<PUT ,GL-P-ITBL ,K-P-NC1 <REST ,GL-P-P-LEX 2>>
					<PUT ,GL-P-ITBL ,K-P-NC1L <REST ,GL-P-P-LEX 6>>
					<SETG GL-P-NCN 1>
		)
	>
	<COND
		(<AND	<MC-T? <SET VERB <GET ,GL-P-ITBL ,K-P-VERB>>>
				<ZERO? .ADJ>
				<NOT <EQUAL? .VERB <GET ,GL-P-OTBL ,K-P-VERB>>>
				>
					<RFALSE>
		)
		(<EQUAL? ,GL-P-NCN 2>
			<RFALSE>
		)
		(<EQUAL? <GET ,GL-P-OTBL ,K-P-NC1> 1>
			<COND
				(<OR	<EQUAL? <SET TEMP <GET ,GL-P-ITBL ,K-P-PREP1>>
							<GET ,GL-P-OTBL ,K-P-PREP1>>
						<ZERO? .TEMP>
						>
							<COND
								(<MC-T? .ADJ>
									<PUT ,GL-P-OTBL ,K-P-NC1 <REST ,GL-P-P-LEX 2>>
									<COND
										(<ZERO? <GET ,GL-P-ITBL ,K-P-NC1L>>
											<PUT ,GL-P-ITBL ,K-P-NC1L <REST ,GL-P-P-LEX 6>>
										)
									>
									<COND
										(<ZERO? ,GL-P-NCN>
											<SETG GL-P-NCN 1>
										)
									>
								)
								(T
									<PUT ,GL-P-OTBL ,K-P-NC1 <GET ,GL-P-ITBL ,K-P-NC1>>
;									<PUT ,GL-P-OTBL ,K-P-NC1L <GET ,GL-P-ITBL ,K-P-NC1L>>
								)
							>
							<PUT ,GL-P-OTBL ,K-P-NC1L <GET ,GL-P-ITBL ,K-P-NC1L>>
				)
				(T
					<RFALSE>
				)
			>
		)
		(<EQUAL? <GET ,GL-P-OTBL ,K-P-NC2> 1>
			<COND
				(<OR	<EQUAL? <SET TEMP <GET ,GL-P-ITBL ,K-P-PREP1>>
							<GET ,GL-P-OTBL ,K-P-PREP2>>
						<ZERO? .TEMP>
						>
							<COND
								(<MC-T? .ADJ>
									<PUT ,GL-P-ITBL ,K-P-NC1 <REST ,GL-P-P-LEX 2>>
									<COND
										(<ZERO? <GET ,GL-P-ITBL ,K-P-NC1L>>
											<PUT ,GL-P-ITBL ,K-P-NC1L <REST ,GL-P-P-LEX 6>>
										)
									>
								)
							>
							<PUT ,GL-P-OTBL ,K-P-NC2 <GET ,GL-P-ITBL ,K-P-NC1>>
							<PUT ,GL-P-OTBL ,K-P-NC2L <GET ,GL-P-ITBL ,K-P-NC1L>>
							<SETG GL-P-NCN 2>
				)
				(T
					<RFALSE>
				)
			>
		)
		(<MC-T? ,GL-P-ACLAUSE>
			<COND
				(<AND	<NOT <EQUAL? ,GL-P-NCN 1>> <NOT .ADJ>>
						<SETG GL-P-ACLAUSE <>
						>
							<RFALSE>
				)
				(T
					<SET BEG <GET ,GL-P-ITBL ,K-P-NC1>>
					<COND
						(<MC-T? .ADJ>
							<SET BEG <REST ,GL-P-P-LEX 2>>
							<SET ADJ <>>
						)
					>
					<SET END <GET ,GL-P-ITBL ,K-P-NC1L>>
					<REPEAT ()
						<SET WRD <GET .BEG 0>>
						<COND
							(<EQUAL? .BEG .END>
								<COND
									(<MC-T? .ADJ>
										<RT-ACLAUSE-WIN .ADJ>
										<RETURN>
									)
									(T
										<SETG GL-P-ACLAUSE <>> <RFALSE>
									)
								>
							)
							(<AND ;	<ZERO? .ADJ>
										<OR   <AND 	<BTST <GETB .WRD ,K-P-PSOFF> ,PS?ADJECTIVE>
														<RT-ADJ-CHECK .WRD .ADJ>
													>
												<EQUAL? .WRD ,W?ALL ,W?EVERYTHING>
											>
									>
										<SET ADJ .WRD>
							)
;							(<EQUAL? .WRD ,W?ONE>
								<RT-ACLAUSE-WIN .ADJ>
								<RETURN>
							)
							(<BTST <GETB .WRD ,K-P-PSOFF> ,PS?OBJECT>
								<COND
									(<EQUAL? .WRD ,GL-P-ANAM>
										<RT-ACLAUSE-WIN .ADJ>
									)
									(T
										<RT-NCLAUSE-WIN>
									)
								>
								<RETURN>
							)
						>
						<SET BEG <REST .BEG ,K-P-WORDLEN>>
						<COND
							(<ZERO? .END>
								<SET END .BEG>
								<SETG GL-P-NCN 1>
								<PUT ,GL-P-ITBL ,K-P-NC1 <BACK .BEG 4>>
								<PUT ,GL-P-ITBL ,K-P-NC1L .BEG>
							)
						>
					>
				)
			>
		)
	>

	<PUT ,GL-P-VTBL 0 <GET ,GL-P-OVTBL 0>>
	<PUTB ,GL-P-VTBL 2 <GETB ,GL-P-OVTBL 2>>
	<PUTB ,GL-P-VTBL 3 <GETB ,GL-P-OVTBL 3>>
	<PUT ,GL-P-OTBL ,K-P-VERBN ,GL-P-VTBL>
	<PUTB ,GL-P-VTBL 2 0>

;	<AND <NOT <EQUAL? <GET ,GL-P-OTBL ,K-P-NC2> 0>> <SETG GL-P-NCN 2>>

	<REPEAT ()
		<COND
			(<G? <SET CNT <+ .CNT 1>> ,K-P-ITBLLEN>
				<SETG GL-P-MERGED T>
				<RTRUE>
			)
			(T
				<PUT ,GL-P-ITBL .CNT <GET ,GL-P-OTBL .CNT>>
			)
		>
	>
   T
>



;-----------------------------------------------------------------------------
; "RT-ADJ-CHECK    Per SWG 8/27/87"
;-----------------------------------------------------------------------------

<ROUTINE RT-ADJ-CHECK (WRD ADJ)
	<COND
		(<EQUAL? .WRD ,W?BROWN ,W?BLUE>
			<RTRUE>
		)
		(<ZERO? .ADJ>
			<RTRUE>
		)
	>
>

;------------------------------------------------------------------------------
; "RT-CLAUSE-COPY"
;------------------------------------------------------------------------------

<ROUTINE RT-CLAUSE-COPY (SRC DEST SRCBEG SRCEND DESTBEG DESTEND
									"OPTIONAL" (INSRT <>) "AUX" BEG END)

	<SET BEG <GET .SRC .SRCBEG>>
	<SET END <GET .SRC .SRCEND>>
	<PUT .DEST .DESTBEG <REST ,GL-P-OCLAUSE
		<+ <* <GET ,GL-P-OCLAUSE ,K-P-MATCHLEN> ,K-P-LEXELEN> 2>>>

	<REPEAT ()
		<COND
			(<EQUAL? .BEG .END>
				<PUT .DEST .DESTEND <REST ,GL-P-OCLAUSE
					<+ 2 <* <GET ,GL-P-OCLAUSE ,K-P-MATCHLEN> ,K-P-LEXELEN>>>>
				<RETURN>
			)
			(T
				<COND
					(<AND	<MC-T? .INSRT>
							<EQUAL? ,GL-P-ANAM <GET .BEG 0>>
							>
								<RT-CLAUSE-ADD .INSRT>
					)
				>
				<RT-CLAUSE-ADD <GET .BEG 0>>
			)
		>
		<SET BEG <REST .BEG ,K-P-WORDLEN>>
	>
>

;------------------------------------------------------------------------------
; "RT-CLAUSE-ADD"
;------------------------------------------------------------------------------

<ROUTINE RT-CLAUSE-ADD (WRD "AUX" PTR) 
	<SET PTR <+ <GET ,GL-P-OCLAUSE ,K-P-MATCHLEN> 2>>
	<PUT ,GL-P-OCLAUSE <- .PTR 1> .WRD>
	<PUT ,GL-P-OCLAUSE .PTR 0>
	<PUT ,GL-P-OCLAUSE ,K-P-MATCHLEN .PTR>
>
 
;------------------------------------------------------------------------------
; "RT-PREP-FIND"
;------------------------------------------------------------------------------

<ROUTINE RT-PREP-FIND (PREP "AUX" (CNT 0) SIZE) 
	<SET SIZE <* <GET ,PREPOSITIONS 0> 2>>
	<REPEAT ()
		<COND
			(<IGRTR? CNT .SIZE>
				<RFALSE>
			)
			(<EQUAL? <GET ,PREPOSITIONS .CNT> .PREP>
				<RETURN <GET ,PREPOSITIONS <- .CNT 1>>>
			)
		>
	>
>
 
;------------------------------------------------------------------------------
; "RT-SYNTAX-FOUND"
;------------------------------------------------------------------------------

<ROUTINE RT-SYNTAX-FOUND (SYN) 
	<SETG GL-P-SYNTAX .SYN>
	<SETG GL-PRSA <GETB .SYN ,K-P-SACTION>>
>
 
;------------------------------------------------------------------------------
; "RT-BUT-MERGE"
;------------------------------------------------------------------------------

<ROUTINE RT-BUT-MERGE (TBL "AUX" LEN BUTLEN (CNT 1) (MATCHES 0) OBJ NTBL) 
	<SET LEN <GET .TBL ,K-P-MATCHLEN>>
	<PUT ,GL-P-MERGE ,K-P-MATCHLEN 0>
	<REPEAT ()
		<COND
			(<DLESS? LEN 0>
				<RETURN>
			)
		>
		<SET OBJ <GET .TBL .CNT>>
		<COND
			(<INTBL? .OBJ <REST ,GL-P-BUTS 2> <GET ,GL-P-BUTS 0>>
;				<ZMEMQ <SET OBJ <GET .TBL .CNT>> ,GL-P-BUTS>
				T
			)
			(T
				<PUT ,GL-P-MERGE <+ .MATCHES 1> .OBJ>
				<SET MATCHES <+ .MATCHES 1>>
			)
		>
		<SET CNT <+ .CNT 1>>
	>
	<PUT ,GL-P-MERGE ,K-P-MATCHLEN .MATCHES>
	<SET NTBL ,GL-P-MERGE>
	<SETG GL-P-MERGE .TBL>
	.NTBL
>

;------------------------------------------------------------------------------
; "RT-SNARF-OBJECTS"
;------------------------------------------------------------------------------

<ROUTINE RT-SNARF-OBJECTS ("AUX" PTR) 
	<COND
		(<MC-T? <SET PTR <GET ,GL-P-ITBL ,K-P-NC1>>>
			<SETG GL-P-PHR 0>
			<SETG GL-P-SLOCBITS <GETB ,GL-P-SYNTAX ,K-P-SLOC1>>
			<OR	<RT-SNARF .PTR <GET ,GL-P-ITBL ,K-P-NC1L> ,GL-P-PRSO>
					<RFALSE>
					>
			<OR	<ZERO? <GET ,GL-P-BUTS ,K-P-MATCHLEN>>
					<SETG GL-P-PRSO <RT-BUT-MERGE ,GL-P-PRSO>>
					>
		)
	>
	<COND
		(<MC-T? <SET PTR <GET ,GL-P-ITBL ,K-P-NC2>>>
			<SETG GL-P-PHR 1>
			<SETG GL-P-SLOCBITS <GETB ,GL-P-SYNTAX ,K-P-SLOC2>>
			<OR	<RT-SNARF .PTR <GET ,GL-P-ITBL ,K-P-NC2L> ,GL-P-PRSI>
					<RFALSE>
					>
			<COND
				(<MC-T? <GET ,GL-P-BUTS ,K-P-MATCHLEN>>
					<COND
						(<EQUAL? <GET ,GL-P-PRSI ,K-P-MATCHLEN> 1>
							<SETG GL-P-PRSO <RT-BUT-MERGE ,GL-P-PRSO>>
						)
						(T
							<SETG GL-P-PRSI <RT-BUT-MERGE ,GL-P-PRSI>>
						)
					>
				)
			>
		)
	>
	<RTRUE>
>

;------------------------------------------------------------------------------
; "RT-SNARF"
;------------------------------------------------------------------------------

<ROUTINE RT-SNARF (PTR EPTR TBL "AUX" (BUT <>) LEN WV WRD NW (WAS-ALL? <>)
							ONEOBJ)

	<SETG GL-P-AND <>>
	<COND
		(<EQUAL? ,GL-P-GET-FLAGS ,K-P-ALL>
			<SET WAS-ALL? T>
		)
	>
	<SETG GL-P-GET-FLAGS 0>
	<PUT ,GL-P-BUTS ,K-P-MATCHLEN 0>
	<PUT .TBL ,K-P-MATCHLEN 0>
	<SET WRD <GET .PTR 0>>
	<REPEAT ()
		<COND
			(<EQUAL? .PTR .EPTR>
				<SET WV <RT-GET-OBJECT <OR .BUT .TBL>>>
				<COND
					(<MC-T? .WAS-ALL?>
						<SETG GL-P-GET-FLAGS ,K-P-ALL>
					)
				>
				<RETURN .WV>
			)
			(T
				<COND
					(<==? .EPTR <REST .PTR ,K-P-WORDLEN>>
						<SET NW 0>
					)
					(T
						<SET NW <GET .PTR ,K-P-LEXELEN>>
					)
				>
				<COND
					(<EQUAL? .WRD ,W?ALL ,W?BOTH ,W?EVERYTHING>
						<SETG GL-P-GET-FLAGS ,K-P-ALL>
						<COND
							(<EQUAL? .NW ,W?OF>
								<SET PTR <REST .PTR ,K-P-WORDLEN>>
							)
						>
					)
					(<EQUAL? .WRD ,W?BUT ,W?EXCEPT>
						<OR <RT-GET-OBJECT <OR .BUT .TBL>> <RFALSE>>
						<SET BUT ,GL-P-BUTS>
						<PUT .BUT ,K-P-MATCHLEN 0>
					)
					(<RT-BUZZ-WORD-MSG? .WRD>
						<RFALSE>
					)
					(<EQUAL? .WRD ,W?A ; ,W?ONE>
						<COND
							(<ZERO? ,GL-P-ADJ>
								<SETG GL-P-GET-FLAGS ,K-P-ONE>
								<COND
									(<EQUAL? .NW ,W?OF>
										<SET PTR <REST .PTR ,K-P-WORDLEN>>
									)
								>
							)
							(T
								<SETG GL-P-NAM .ONEOBJ>
								<OR <RT-GET-OBJECT <OR .BUT .TBL>> <RFALSE>>
								<AND <ZERO? .NW> <RTRUE>>
							)
						>
					)
					(<AND	<EQUAL? .WRD ,W?AND ,W?COMMA>
							<NOT <EQUAL? .NW ,W?AND ,W?COMMA>>
							>
							<SETG GL-P-AND T>
							<OR <RT-GET-OBJECT <OR .BUT .TBL>> <RFALSE>>
							T
					)
					(<RT-WT? .WRD ,PS?BUZZ-WORD>
					)
					(<EQUAL? .WRD ,W?AND ,W?COMMA>
					)
					(<EQUAL? .WRD ,W?OF>
						<COND
							(<ZERO? ,GL-P-GET-FLAGS>
								<SETG GL-P-GET-FLAGS ,K-P-INHIBIT>
							)
						>
					)
					(<AND	<RT-WT? .WRD ,PS?ADJECTIVE>
							<ZERO? ,GL-P-ADJ>
							<NOT <EQUAL? .NW ,W?OF>>
							>
							<SETG GL-P-ADJ .WRD>
					)
					(<RT-WT? .WRD ,PS?OBJECT ;,P1?OBJECT>
						<SETG GL-P-NAM .WRD>
						<SET ONEOBJ .WRD>
					)
				>
			)
		>
		<COND
			(<NOT <EQUAL? .PTR .EPTR>>
				<SET PTR <REST .PTR ,K-P-WORDLEN>>
				<SET WRD .NW>
			)
		>
	>
>
 
;------------------------------------------------------------------------------
; "RT-GET-OBJECT"
;------------------------------------------------------------------------------

<ROUTINE RT-GET-OBJECT (TBL "OPTIONAL" (VRB T) "AUX" BTS LEN XBITS TLEN
									(GCHECK <>) (OLEN 0) OBJ ADJ X)
	<SET XBITS ,GL-P-SLOCBITS>
	<SET TLEN <GET .TBL ,K-P-MATCHLEN>>
;	<COND
		(<MC-T? ,DEBUG?>
			<TELL "[GETOBJ: TLEN=" N .TLEN "]" CR>
		)
	>
	<COND
		(<BTST ,GL-P-GET-FLAGS ,K-P-INHIBIT>
			<RTRUE>
		)
	>
	<SET ADJ ,GL-P-ADJ>
	<COND
		(<AND	<ZERO? ,GL-P-NAM>
				<MC-T? ,GL-P-ADJ>
				>
				<COND
					(<RT-WT? ,GL-P-ADJ ,PS?OBJECT>
						<SETG GL-P-NAM ,GL-P-ADJ>
						<SETG GL-P-ADJ <>>
					)
					(<SET BTS <RT-WT? ,GL-P-ADJ ,PS?DIRECTION ,P1?DIRECTION>>
						<SETG GL-P-ADJ <>>
						<PUT .TBL ,K-P-MATCHLEN 1>
						<PUT .TBL 1 ,TH-INTDIR>
						<SETG GL-P-DIRECTION .BTS>
						<RTRUE>
					)
				>
		)
	>
	<COND
		(<AND	<ZERO? ,GL-P-NAM>
				<ZERO? ,GL-P-ADJ>
				<NOT <EQUAL? ,GL-P-GET-FLAGS ,K-P-ALL>>
				<ZERO? ,GL-P-GWIMBIT>
				>
					<COND
						(<MC-T? .VRB> 
							<RT-NOT-IN-SENTENCE-MSG "enough nouns">
						)
					>
					<RFALSE>
		)
	>
	<COND
		(<OR	<NOT <EQUAL? ,GL-P-GET-FLAGS ,K-P-ALL>>
				<ZERO? ,GL-P-SLOCBITS>
				>
					<SETG GL-P-SLOCBITS -1>
		)
	>
	<SETG GL-P-TABLE .TBL>
	<PROG ()
;		<COND
			(<MC-T? ,DEBUG?>
				<TELL "[GETOBJ: GCHECK=" N .GCHECK "]" CR>
			)
		>
		<COND
			(<MC-T? .GCHECK>
;				<COND
					(<MC-T? ,DEBUG?>
						<TELL "[GETOBJ: calling RT-GLOBAL-CHECK]" CR>
					)
				>
				<RT-GLOBAL-CHECK .TBL>
			)
			(T
				<COND
					(<MC-T? ,GL-NOW-LIT?>
						<MC-UNMAKE ,CH-PLAYER ,FL-TRANSPARENT>
						<RT-DO-SL ,GL-PLACE-CUR ,SOG ,SIR>
						<MC-MAKE ,CH-PLAYER ,FL-TRANSPARENT>
					)
				>
				<RT-DO-SL ,CH-PLAYER ,SH ,SC>
			)
		>
	<SET LEN <- <GET .TBL ,K-P-MATCHLEN> .TLEN>>
;	<COND
		(<MC-T? ,DEBUG?>
			<TELL "[GETOBJ: LEN=" N .LEN "]" CR>
		)
	>
	<COND
		(<BTST ,GL-P-GET-FLAGS ,K-P-ALL>
		)
		(<AND	<BTST ,GL-P-GET-FLAGS ,K-P-ONE>
				<MC-T? .LEN>
				>
				<COND
					(<NOT <EQUAL? .LEN 1>>
						<PUT .TBL 1 <GET .TBL <RANDOM .LEN>>>
							<TELL "[How about " THE <GET .TBL 1> "?]" CR>
					)
				>
				<PUT .TBL ,K-P-MATCHLEN 1>
		)
		(<OR	<G? .LEN 1>
				<AND	<ZERO? .LEN>
						<NOT <EQUAL? ,GL-P-SLOCBITS -1>>
						>
				>
					<COND
						(<EQUAL? ,GL-P-SLOCBITS -1>
							<SETG GL-P-SLOCBITS .XBITS>
							<SET OLEN .LEN>
							<PUT .TBL ,K-P-MATCHLEN <- <GET .TBL ,K-P-MATCHLEN> .LEN>>
							<AGAIN>
						)
						(T
							<PUT ,GL-P-NAMW ,GL-P-PHR ,GL-P-NAM>
							<PUT ,GL-P-ADJW ,GL-P-PHR ,GL-P-ADJ>
							<COND
								(<ZERO? .LEN>
									<SET LEN .OLEN>
								)
							>
							<COND
								(<AND <MC-T? ,GL-P-NAM>
									<SET OBJ <GET .TBL <+ .TLEN 1>>>
									<SET OBJ <APPLY <GETP .OBJ ,P?GENERIC> .TBL .LEN>>>
									<COND
										(<EQUAL? .OBJ ,TH-NOT-HERE-OBJECT>
											<RFALSE>
										)
									>
									<PUT .TBL 1 .OBJ>
									<PUT .TBL ,K-P-MATCHLEN 1>
									<SETG GL-P-NAM <>>
									<SETG GL-P-ADJ <>>
									<RTRUE>
								)
								(<AND	<MC-T? .VRB>
										<NOT <EQUAL? ,GL-WINNER ,CH-PLAYER>>>
											<TELL ,K-DONT-UNDERSTAND-MSG CR>
											<RFALSE>
								)
								(<AND	<MC-T? .VRB>
										<MC-T? ,GL-P-NAM>
										>
											<RT-WHICH-PRINT .TLEN .LEN .TBL>
											<SETG GL-P-ACLAUSE
												<COND
													(<EQUAL? .TBL ,GL-P-PRSO>
														,K-P-NC1
													)
													(T
														,K-P-NC2
													)
												>
											>
											<SETG GL-P-AADJ ,GL-P-ADJ>
											<SETG GL-P-ANAM ,GL-P-NAM>
											<RT-ORPHAN <> <>>
											<SETG GL-P-ORPH T>
								)
								(<MC-T? .VRB>
									<RT-NOT-IN-SENTENCE-MSG "enough nouns">
								)
							>
							<SETG GL-P-NAM <>>
							<SETG GL-P-ADJ <>>
							<RFALSE>
						)
					>
		)
		(<AND	<ZERO? .LEN>
				<MC-T? .GCHECK>
				>
					<PUT ,GL-P-NAMW ,GL-P-PHR ,GL-P-NAM>
					<PUT ,GL-P-ADJW ,GL-P-PHR ,GL-P-ADJ>
					<COND
						(<MC-T? .VRB>
							<SETG GL-P-SLOCBITS .XBITS>
							<COND
								(<OR	<MC-T? ,GL-NOW-LIT?>
										<INTBL? ,GL-PRSA <REST ,GL-TALK-VERBS 2> <GET ,GL-TALK-VERBS 0>>
										>
											<RT-OBJ-FOUND ,TH-NOT-HERE-OBJECT .TBL>
											<SETG GL-P-XNAM ,GL-P-NAM>
											<SETG GL-P-NAM <>>
											<SETG GL-P-XADJ ,GL-P-ADJ>
											<SETG GL-P-ADJ <>>
											<RTRUE>
								)
								(T
									<TELL ,K-TOO-DARK-MSG CR>
								)
							>
						)
					>
					<SETG GL-P-NAM <>>
					<SETG GL-P-ADJ <>>
					<RFALSE>
		)
		(<ZERO? .LEN>
			<SET GCHECK T>
;			<COND
				(<MC-T? ,DEBUG?>
					<TELL "[GETOBJ: GCHECK set to " N .GCHECK "]" CR>
				)
			>
			<AGAIN>
		)
	>
	<SET X <GET .TBL <+ .TLEN 1>>>
	<COND
		(<AND	<MC-T? ,GL-P-ADJ>
				<ZERO? ,GL-P-NAM>
				<MC-T? .X>
				>
					<TELL "[" THE .X "]" CR CR>
		)
	>
	<SETG GL-P-SLOCBITS .XBITS>
	<PUT ,GL-P-NAMW ,GL-P-PHR ,GL-P-NAM>
	<PUT ,GL-P-ADJW ,GL-P-PHR ,GL-P-ADJ>
	<SETG GL-P-NAM <>>
	<SETG GL-P-ADJ <>>
	<RTRUE>>
>

;------------------------------------------------------------------------------
; "RT-MOBY-FIND"
; "This RT-MOBY-FIND works in both ZIL and ZIP"
;------------------------------------------------------------------------------

<ROUTINE RT-MOBY-FIND (TBL "AUX" (OBJ 1) LEN FOO NAM ADJ)
	<SET NAM ,GL-P-NAM>
	<SET ADJ ,GL-P-ADJ>
	<SETG GL-P-NAM ,GL-P-XNAM>
	<SETG GL-P-ADJ ,GL-P-XADJ>
;	<COND
		(<MC-T? ,DEBUG?>
			<TELL "[RT-MOBY-FIND called, GL-P-NAM = ">
			<PRINTB ,GL-P-NAM>
			<TELL "]" CR>
		)
	>
	<PUT .TBL ,K-P-MATCHLEN 0>
	%<COND
		(<GASSIGNED? ZILCH>	;<NOT <ZERO? <GETB 0 18>>>
			'<PROG ()
				<REPEAT ()
					<COND
						(<AND	; <SET FOO <META-LOC .OBJ T>>
								; <NOT <IN? .OBJ ,ROOMS>>
								<SET FOO <RT-THIS-IT? .OBJ>>
								>
									<SET FOO <RT-OBJ-FOUND .OBJ .TBL>>
						)
					>
					<COND
						(<IGRTR? OBJ ,LAST-OBJECT>
							<RETURN>
						)
					>
				>
			>
		)
		(T
			'<PROG ()
				<SETG GL-P-SLOCBITS -1>
				<SET FOO <FIRST? ,ROOMS>>
				<REPEAT ()
					<COND
						(<ZERO? .FOO>
							<RETURN>
						)
						(T
							<RT-SEARCH-LIST .FOO .TBL ,K-P-SRCALL T>
							<SET FOO <NEXT? .FOO>>
						)
					>
				>
				<RT-DO-SL ,LOCAL-GLOBALS 1 1 .TBL T>
				<RT-SEARCH-LIST ,ROOMS .TBL ,K-P-SRCTOP T>
			>
		)
	>
	<COND
		(<EQUAL? <SET LEN <GET .TBL ,K-P-MATCHLEN>> 1>
			<SETG GL-P-MOBY-FOUND <GET .TBL 1>>
		)
	>
	<SETG GL-P-NAM .NAM>
	<SETG GL-P-ADJ .ADJ>
	<RETURN .LEN>
>

;------------------------------------------------------------------------------
; "RT-WHICH-PRINT"
;------------------------------------------------------------------------------

<ROUTINE RT-WHICH-PRINT (TLEN LEN TBL "AUX" OBJ RLEN)
	<SET RLEN .LEN>
	<TELL "Which">
	<COND
		(<OR	<MC-T? ,GL-P-ORPH>
				<MC-T? ,GL-P-MERGED>
				<MC-T? ,GL-P-AND>
				>
					<TELL " ">
					<PRINTB ,GL-P-NAM>
		)
		(<EQUAL? .TBL ,GL-P-PRSO>
			<RT-CLAUSE-PRINT ,K-P-NC1 ,K-P-NC1L <>>
		)
		(T
			<RT-CLAUSE-PRINT ,K-P-NC2 ,K-P-NC2L <>>
		)
	>
	<TELL " do you mean,">
	<REPEAT ()
		<SET TLEN <+ .TLEN 1>>
		<SET OBJ <GET .TBL .TLEN>>
		<TELL " " THE .OBJ>
		<COND
			(<EQUAL? .LEN 2>
				<COND
					(<NOT <EQUAL? .RLEN 2>>
						<TELL ",">
					)
				>
				<TELL " or">
			)
			(<G? .LEN 2>
				<TELL ",">
			)
		>
		<COND
			(<L? <SET LEN <- .LEN 1>> 1>
				<TELL "?" CR>
				<RETURN>
			)
		>
	>
>

;------------------------------------------------------------------------------
; "RT-GLOBAL-CHECK"
;------------------------------------------------------------------------------

<ROUTINE RT-GLOBAL-CHECK (TBL "AUX" LEN RMG RMGL (CNT 0) OBJ OBITS FOO) 
	<SET LEN <GET .TBL ,K-P-MATCHLEN>>
	<SET OBITS ,GL-P-SLOCBITS>
	<COND
		(<SET RMG <GETPT ,GL-PLACE-CUR ,P?GLOBAL>>
			<SET RMGL <MC-RMGL-SIZE .RMG>>
;			<COND
				(<MC-T? ,DEBUG?>
					<TELL "[GLBCHK: (LG) RMGL=" N .RMGL "]" CR>
				)
			>
			<REPEAT ()
				<SET OBJ <MC-GET/B .RMG .CNT>>
				<COND
					(<FIRST? .OBJ>
						<RT-SEARCH-LIST .OBJ .TBL ,K-P-SRCALL>
					)
				>
				<COND
					(<RT-THIS-IT? .OBJ>
						<RT-OBJ-FOUND .OBJ .TBL>
					)
				>
				<COND
					(<IGRTR? CNT .RMGL>
						<RETURN>
					)
				>
			>
		)
	>
	<COND
		(<EQUAL? <GET .TBL ,K-P-MATCHLEN> .LEN>
			<SETG GL-P-SLOCBITS -1>
			<SETG GL-P-TABLE .TBL>
			<RT-DO-SL ,GLOBAL-OBJECTS 1 1>
			<SETG GL-P-SLOCBITS .OBITS>
			<COND
				(<ZERO? <GET .TBL ,K-P-MATCHLEN>>
					<COND
						(<MC-VERB?	EXAMINE LOOK-ON LOOK-INSIDE FIND FOLLOW
										EXIT SEARCH SMELL WALK-TO THROUGH WAIT-FOR WAIT>
								<RT-DO-SL ,ROOMS 1 1>
						)
					>
				)
			>
		)
	>
>

;------------------------------------------------------------------------------
; "RT-DO-SL"
;------------------------------------------------------------------------------

<ROUTINE RT-DO-SL (OBJ BIT1 BIT2 "AUX" BITS) 
	<COND
		(<BTST ,GL-P-SLOCBITS <+ .BIT1 .BIT2>>
			<RT-SEARCH-LIST .OBJ ,GL-P-TABLE ,K-P-SRCALL>
		)
		(T
			<COND
				(<BTST ,GL-P-SLOCBITS .BIT1>
					<RT-SEARCH-LIST .OBJ ,GL-P-TABLE ,K-P-SRCTOP>
				)
				(<BTST ,GL-P-SLOCBITS .BIT2>
					<RT-SEARCH-LIST .OBJ ,GL-P-TABLE ,K-P-SRCBOT>
				)
				(T
					<RTRUE>
				)
			>
		)
	>
>

;------------------------------------------------------------------------------
; "RT-SEARCH-LIST"
;------------------------------------------------------------------------------

<ROUTINE RT-SEARCH-LIST (OBJ TBL LVL)
;	<COND
		(<EQUAL? .OBJ ,GLOBAL-OBJECTS>
			<SET GLOB T>
		)
		(T
			<SET GLOB <>>
		)
	>
	<SET OBJ <FIRST? .OBJ>>
	<COND
		(<MC-T? .OBJ>
			<REPEAT ()
;				<COND
					(<AND	<MC-T? .GLOB>
							<MC-T? ,DEBUG?>
							>
								<TELL "[SRCLST: OBJ=" D .OBJ "]" CR>
					)
				>
				<COND
					(<AND	<NOT <EQUAL? .LVL ,K-P-SRCBOT>>
							<GETPT .OBJ ,P?SYNONYM>
							<RT-THIS-IT? .OBJ>
							>
								<RT-OBJ-FOUND .OBJ .TBL>
					)
				>
				<COND
					(<AND	<OR	<NOT <EQUAL? .LVL ,K-P-SRCTOP>>
;									<MC-IS? .OBJ ,SEARCHBIT>
									<MC-IS? .OBJ ,FL-SURFACE>
									<MC-IS? .OBJ ,FL-PERSON>
									>
							<FIRST? .OBJ>
							<RT-SEE-INSIDE? .OBJ>
;							<OR	<RT-SEE-INSIDE? .OBJ>
									<MC-IS? .OBJ ,FL-SURFACE>
									<MC-IS? .OBJ ,FL-OPENED>
									<MC-IS? .OBJ ,FL-TRANSPARENT>
									<MC-T? ,GL-P-MOBY-FLAG>
									<AND	<MC-IS? .OBJ ,FL-PERSON>
											<NOT <EQUAL? .OBJ ,CH-PLAYER>>
											>
									>
;							<NOT <EQUAL? .OBJ ,CH-PLAYER ,LOCAL-GLOBALS>>
							>
								<RT-SEARCH-LIST .OBJ .TBL
									<COND
										(<OR	<MC-IS? .OBJ ,FL-SURFACE>
												<MC-IS? .OBJ ,FL-PERSON>
												>
													,K-P-SRCALL
										)
										(<AND <MC-IS? .OBJ ,FL-CONTAINER>
												<OR <MC-IS? .OBJ ,FL-OPENED>
													 <MC-IS? .OBJ ,FL-TRANSPARENT>
												>
											>
											,K-P-SRCALL
										)
;										(<MC-IS? .OBJ ,SEARCHBIT>
											,K-P-SRCALL
										)
										(T
											,K-P-SRCTOP
										)
									>
								>
					)
				>
				<SET OBJ <NEXT? .OBJ>>
				<COND
					(<ZERO? .OBJ>
						<RETURN>
					)
				>
			>
		)
	>
>

;------------------------------------------------------------------------------
; "RT-THIS-IT?"
;------------------------------------------------------------------------------

<ROUTINE RT-THIS-IT? (OBJ "AUX" SYNS) 
	<COND
;		(<FSET? .OBJ ,INVISIBLE>
			<RFALSE>
		)
		(<AND	<MC-T? ,GL-P-NAM>
				<OR	<NOT <SET SYNS <GETPT .OBJ ,P?SYNONYM>>>
						<NOT <INTBL? ,GL-P-NAM .SYNS </ <PTSIZE .SYNS> 2>>>
;							<ZMEMQ ,GL-P-NAM .SYNS <- </ <PTSIZE .SYNS> 2> 1>>
						>
				>
					<RFALSE>
		)
		(<AND	<MC-T? ,GL-P-ADJ>
				<OR	<NOT <SET SYNS <GETPT .OBJ ,P?ADJECTIVE>>>
						<NOT <INTBL? ,GL-P-ADJ .SYNS </ <PTSIZE .SYNS> 2>>>
;							<ZMEMQ ,GL-P-ADJ .SYNS <MC-RMGL-SIZE .SYNS>>
						>
				>
					<RFALSE>
		)
		(<AND	<MC-T? ,GL-P-GWIMBIT>
				<NOT <FSET? .OBJ ,GL-P-GWIMBIT>>
				>
					<RFALSE>
		)
	>
	<RTRUE>
>

;------------------------------------------------------------------------------
; "RT-OBJ-FOUND"
;------------------------------------------------------------------------------

<ROUTINE RT-OBJ-FOUND (OBJ TBL "AUX" PTR) 
	<SET PTR <+ <GET .TBL ,K-P-MATCHLEN> 1>>
	<COND
		(<G=? .PTR ,K-P-OBJ-TBL-LEN>
			<SETG GL-P-OVERFLOW T>
			<RFALSE>
		)
		(<L? .PTR ,K-P-OBJ-TBL-LEN>
			<SETG GL-P-OVERFLOW <>>
			<PUT .TBL .PTR .OBJ>
			<PUT .TBL ,K-P-MATCHLEN .PTR>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-ITAKE"
;-----------------------------------------------------------------------------

<ROUTINE RT-ITAKE ("OPTIONAL" (VB T) "AUX" L)
	<COND
		(<OR	<MC-F? ,GL-PRSO>
				<MC-F? <LOC ,GL-PRSO>>
				>
					<RT-CANT-SEE-ANY-MSG>
					<RFALSE>
		)
	>
	<SET L <LOC ,GL-PRSO>>
	<RT-THIS-IS-IT ,GL-PRSO>
	<COND
		(<MC-ISNOT? ,GL-PRSO ,FL-TAKEABLE>
			<COND
				(<MC-T? .VB>
					<RT-IMPOSSIBLE-MSG>
				)
			>
			<RFALSE>
		)
		(<AND	<MC-IS? .L ,FL-CONTAINER>
				<MC-IS? .L ,FL-OPENABLE>
				<MC-ISNOT? .L ,FL-OPENED>
				>
					<COND
						(<MC-T? .VB>
							<RT-YOUD-HAVE-TO-MSG "open" .L>
						)
					>
					<RFALSE>
		)
		(<AND	<NOT <IN? .L ,GL-WINNER>>
				<RT-OBJ-TOO-HEAVY? ,GL-PRSO ,GL-WINNER>
				>
					<COND
						(<MC-T? .VB>
							<TELL CTHEO " is too heavy." CR>
						)
					>
					<RFALSE>
		)
		(<RT-OBJ-TOO-MANY? ,GL-PRSO ,GL-WINNER>
			<COND
				(<MC-T? .VB>
					<RT-CYOU-MSG "are" "is">
					<TELL "holding too much already." CR>
				)
			>
			<RFALSE>
		)
		(T
			<MC-MAKE ,GL-PRSO ,FL-SEEN>
			<MC-MAKE ,GL-PRSO ,FL-TOUCHED>
			<MC-UNMAKE ,GL-PRSO ,FL-NODESC>
			<MC-UNMAKE ,GL-PRSO ,FL-NOALL>
			<MOVE ,GL-PRSO ,GL-WINNER>
			<RETURN .L>
		)
	>
>
 
;------------------------------------------------------------------------------
; "RT-ITAKE-CHECK"
;------------------------------------------------------------------------------

<ROUTINE RT-ITAKE-CHECK (TBL BITS "AUX" (PTR 1) LEN OBJ L GOT)
	<SET LEN <GET .TBL ,K-P-MATCHLEN>>
	<COND
		(<ZERO? .LEN>
			<RTRUE>
		)
		(<OR	<BTST .BITS ,SHAVE>
				<BTST .BITS ,STAKE>
			>
			<REPEAT ()
				<SET OBJ <GET .TBL .PTR>>
				<COND
					(<EQUAL? .OBJ ,TH-IT>
						<COND
							(<NOT <RT-ACCESSIBLE? ,GL-P-IT-OBJECT>>
								<TELL ,K-BE-MORE-SPECIFIC-MSG CR>
								<RFALSE>
							)
						>
						<SET OBJ ,GL-P-IT-OBJECT>
					)
					(<EQUAL? .OBJ ,CH-THEM>
						<COND
							(<NOT <RT-ACCESSIBLE? ,GL-P-THEM-OBJECT>>
								<TELL ,K-BE-MORE-SPECIFIC-MSG CR>
								<RFALSE>
							)
						>
						<SET OBJ ,GL-P-THEM-OBJECT>
					)
					(<EQUAL? .OBJ ,CH-HER>
						<COND
							(<NOT <RT-ACCESSIBLE? ,GL-P-HER-OBJECT>>
								<TELL ,K-BE-MORE-SPECIFIC-MSG CR>
								<RFALSE>
							)
						>
						<SET OBJ ,GL-P-HER-OBJECT>
					)
					(<EQUAL? .OBJ ,CH-HIM>
						<COND
							(<NOT <RT-ACCESSIBLE? ,GL-P-HIM-OBJECT>>
								<TELL ,K-BE-MORE-SPECIFIC-MSG CR>
								<RFALSE>
							)
						>
						<SET OBJ ,GL-P-HIM-OBJECT>
					)
				>

				<COND
					(<AND	<NOT <EQUAL? .OBJ ,TH-POCKET ,TH-HANDS ,TH-FOOT ,TH-FEET>>
							<NOT <EQUAL? .OBJ ,CH-ME ,CH-YOU ,ROOMS ,TH-PLAYER-BODY>>
							<NOT <EQUAL? .OBJ ,TH-INTDIR ,TH-RIGHT ,TH-LEFT>>
							<NOT <RT-HELD? .OBJ>>
						>
						<SETG GL-PRSO .OBJ>
						<SET L <LOC .OBJ>>
						<COND
							(<ZERO? .L>
								<SET GOT <>>
							)
							(<AND	<MC-IS? .OBJ ,FL-TRYTAKE>
									<NOT <MC-IS? .OBJ ,FL-TAKEABLE>>
								>
								<SET GOT <>>
							)
							(<NOT <EQUAL? ,GL-WINNER ,CH-PLAYER>>
								<SET GOT <>>
							)
							(<AND	<RT-META-IN? .L ,GL-WINNER>
									<ZERO? ,GL-P-MULT?>
									<BTST .BITS ,STAKE>
									<RT-ITAKE <>>
								>
								<SET GOT T>
							)
							(<AND	<EQUAL? .L ,GL-WINNER>
									<BTST .BITS ,SHAVE>
								>
								<SET GOT T>
							)
							(T
								<SET GOT <>>
							)
						>
						<COND
							(<AND	<ZERO? .GOT>
;									<NOT <EQUAL? .L ,TH-POCKET>>
									<BTST .BITS ,SHAVE>
								>
								<RT-WINNER-NOT-HOLDING-MSG>
								<COND
									(<AND	<EQUAL? .LEN .PTR>
											<MC-T? ,GL-P-MULT?>
										>
										<TELL "all of those things">
									)
									(<EQUAL? .OBJ ,TH-NOT-HERE-OBJECT>
										<SETG GL-P-IT-OBJECT .OBJ>
										<TELL D .OBJ>
									)
									(T
										<RT-THIS-IS-IT .OBJ>
										<COND
											(<MC-IS? .OBJ ,FL-PLURAL>
												<TELL "any " D .OBJ>
											)
											(T
												<TELL A .OBJ>
											)
										>
									)
								>
								<TELL "." CR>
								<RFALSE>
							)
							(<AND	<MC-T? .GOT>
									<BTST .BITS ,STAKE>
									<EQUAL? ,GL-WINNER ,CH-PLAYER>
								>
								<TELL "[taking " THE .OBJ>
								<COND
									(<MC-T? .L>
										<COND
											(<MC-IS? .L ,FL-CONTAINER>
												<TELL " out of ">
											)
											(<MC-IS? .L ,FL-SURFACE>
												<TELL " off ">
											)
											(T
												<TELL " from ">
											)
										>
										<TELL THE .L>
									)
								>
								<TELL " first]." CR>
							)
						>
					)
				>
				<COND
					(<IGRTR? PTR .LEN>
						<RTRUE>
					)
				>
			>
		)
	>
	<RTRUE>
>
			
;------------------------------------------------------------------------------
; "RT-MANY-CHECK"
;------------------------------------------------------------------------------

<ROUTINE RT-MANY-CHECK ("AUX" (LOSS <>) TMP) 
	<COND
		(<AND	<G? <GET ,GL-P-PRSO ,K-P-MATCHLEN> 1>
				<NOT <BTST <GETB ,GL-P-SYNTAX ,K-P-SLOC1> ,SMANY>>
				>
					<SET LOSS 1>
		)
		(<AND	<G? <GET ,GL-P-PRSI ,K-P-MATCHLEN> 1>
				<NOT <BTST <GETB ,GL-P-SYNTAX ,K-P-SLOC2> ,SMANY>>
				>
					<SET LOSS 2>
		)
	>
	<COND
		(<MC-T? .LOSS>
			<TELL	"[You cannot refer to more than one object at a time with \"">
			<SET TMP <GET ,GL-P-ITBL ,K-P-VERBN>>
			<COND
				(<ZERO? .TMP>
					<TELL "tell">
				)
				(<OR <MC-T? ,GL-P-ORPH>
					<MC-T? ,GL-P-MERGED>>
					<PRINTB <GET .TMP 0>>
				)
				(T
					<RT-WORD-PRINT <GETB .TMP 2> <GETB .TMP 3>>
				)
			>
			<TELL ".\"]" CR>
			<RFALSE>
		)
		(T
			<RTRUE>
		)
	>
>

;------------------------------------------------------------------------------
; "RT-IS-LIT?"
;------------------------------------------------------------------------------

<ROUTINE RT-IS-LIT? ("OPTIONAL" (RM <>) (RMFLG T) "AUX" OHERE (LIT <>))
	<COND
		(<MC-F? .RM>
			<SET RM ,GL-PLACE-CUR>
		)
	>
	<COND
		(<AND	<MC-T? .RMFLG>
				<MC-IS? .RM ,FL-LIGHTED>
				>
					<RTRUE>
		)
		(<AND	<MC-T? ,GL-ALW-LIT?>
		 		<EQUAL? ,GL-WINNER ,CH-PLAYER>
				>
					<RTRUE>
		)
	>
	<COND
		(<MC-ISNOT? .RM ,FL-INDOORS>
			<COND
				(<MC-NOTZERO? <RT-TIME-OF-DAY>>
					<RTRUE>
				)
			>
		)
	>
	<SETG GL-P-GWIMBIT ,FL-LIGHTED>
	<SET OHERE ,GL-PLACE-CUR>
	<SETG GL-PLACE-CUR .RM>
	<PUT ,GL-P-MERGE ,K-P-MATCHLEN 0>
	<SETG GL-P-TABLE ,GL-P-MERGE>
	<SETG GL-P-SLOCBITS -1>
	<COND
		(<EQUAL? .OHERE .RM>
			<RT-DO-SL ,GL-WINNER 1 1>
			<COND
				(<AND	<NOT <EQUAL? ,GL-WINNER ,CH-PLAYER>>
						<IN? ,CH-PLAYER .RM>
						>
							<RT-DO-SL ,CH-PLAYER 1 1>
				)
			>
		)
	>
	<RT-DO-SL .RM 1 1>
	<COND
		(<G? <GET ,GL-P-TABLE ,K-P-MATCHLEN> 0>
			<SET LIT T>
		)
	>
	<SETG GL-PLACE-CUR .OHERE>
	<SETG GL-P-GWIMBIT 0>

	<RETURN .LIT>
>

;------------------------------------------------------------------------------
; "RT-FIND-NOT-HERE"
;------------------------------------------------------------------------------

<ROUTINE RT-FIND-NOT-HERE (TBL PRSO? "AUX" M-F OBJ)
	<SET M-F <RT-MOBY-FIND .TBL>>
	<COND
		(<ZERO? .M-F>
			<TELL "[There is no">
			<RT-NOT-HERE-PRINT .PRSO?>
			<TELL " in this story.]" CR>
			<RTRUE>
		)
		(<EQUAL? .M-F 1>
			<COND
				(<MC-T? .PRSO?>
					<SETG GL-PRSO ,GL-P-MOBY-FOUND>
				)
				(T
					<SETG GL-PRSI ,GL-P-MOBY-FOUND>
				)
			>
			<RFALSE>
		)
		(<AND	<G? .M-F 1>
				<SET OBJ <APPLY <GETP <SET OBJ <GET .TBL 1>> ,P?GENERIC> .TBL>>
				>
					<COND
						(<EQUAL? .OBJ ,TH-NOT-HERE-OBJECT>
							<RTRUE>
						)
						(<MC-T? .PRSO?>
							<SETG GL-PRSO .OBJ>
						)
						(T
							<SETG GL-PRSI .OBJ>
						)
					>
					<RFALSE>
		)
		(<MC-VERB? ASK-ABOUT TELL-ABOUT ASK-FOR SAY DRIVE CALL MAKE WHO WHAT WHERE FIND FOLLOW TELL PASSWORD>
			<RFALSE>
		)
		(<ZERO? .PRSO?>
			<RT-CYOU-MSG>
			<TELL "would not find any">
			<RT-NOT-HERE-PRINT .PRSO?>
			<TELL " there." CR>
			<RTRUE>
		)
		(T
			,TH-NOT-HERE-OBJECT
		)
	>
>

;------------------------------------------------------------------------------
; "RT-NOT-HERE-PRINT"
;------------------------------------------------------------------------------

<ROUTINE RT-NOT-HERE-PRINT ("OPTIONAL" (PRSO? <>))
	<COND
		(<OR	<MC-T? ,GL-P-ORPH>
				<MC-T? ,GL-P-MERGED>
				>
				<COND
					(<MC-T? ,GL-P-XADJ>
						<PRINTC 32>
						<PRINTB ,GL-P-XADJ>
					)
				>
				<COND
					(<MC-T? ,GL-P-XNAM>
						<PRINTC 32>
						<PRINTB ,GL-P-XNAM>
					)
				>
		)
		(<MC-T? .PRSO?>
			<RT-BUFFER-PRINT <GET ,GL-P-ITBL ,K-P-NC1>
			<GET ,GL-P-ITBL ,K-P-NC1L> <>>
		)
		(T
			<RT-BUFFER-PRINT <GET ,GL-P-ITBL ,K-P-NC2>
			<GET ,GL-P-ITBL ,K-P-NC2L> <>>
		)
	>
>

;------------------------------------------------------------------------------
; "RT-SAVE-INPUT"
; "input save buffers; first byte hold length of string, zero if none"
;------------------------------------------------------------------------------

;<ROUTINE RT-SAVE-INPUT ("AUX" (TOKENS 1) (LPTR 4) (EPTR 1) (SPTR 1) (PER <>)
								SAVLEN CNT WLEN WPTR X)
	<SET SAVLEN <GETB ,GL-P-P-LEX 1>>
	<COND
		(<ZERO? .SAVLEN>
			<RFALSE>
		)
	>
	 
; "rotate next table into position"

	<SET X ,GL-INSAVE-C>
	<SETG GL-INSAVE-C ,GL-INSAVE-B>
	<SETG GL-INSAVE-B ,GL-INSAVE-A>
	<SETG GL-INSAVE-A .X>
	 
; "copy last input line into GL-INSAVE-A"
	 
	<REPEAT ()
		<SET X <GET ,GL-P-P-LEX .EPTR>>
		<COND
			(<EQUAL? .X ,W?COMMA>
				<SET PER <>>
				<PUTB ,GL-INSAVE-A .SPTR 44>
				<COND
					(<IGRTR? SPTR 79>
						<RETURN>
					)
				>
			)
			(<EQUAL? .X ,W?QUOTE>
				T
;				<SET PER <>>
;				<PUTB ,GL-INSAVE-A .SPTR 34>
;				<COND
					(<IGRTR? SPTR 79>
						<RETURN>
					)
				>
			)
			(<EQUAL? .X ,W?PERIOD ,W?? ,W?\!>
				<COND
					(<ZERO? .PER>
						<SET PER T>
						<PUTB ,GL-INSAVE-A .SPTR 
							<COND
								(<EQUAL? .X ,W?PERIOD>
									46
								)
								(<EQUAL? .X ,W??>
									63
								)
								(T
									33
								)
							>
						>
						<COND
							(<IGRTR? SPTR 79>
								<RETURN>
							)
						>
					)
				>
			)
; "move word to GL-INSAVE-A"
			(T
				<COND
					(<AND	<G? .TOKENS 1>
							<L? .SPTR 80>> 
							<PUTB ,GL-INSAVE-A .SPTR 32>		; "add a space"
							<INC SPTR>
					)
				>
				<SET WLEN <GETB ,GL-P-P-LEX .LPTR>>
				<SET PER <>>
				<SET WPTR <GETB ,GL-P-P-LEX <+ .LPTR 1>>>	; "char ptr"
				<SET CNT 1> 										; "init # chars moved"
				<REPEAT ()
					<SET X <GETB ,GL-P-PIBUF .WPTR>>
						<COND
							(<AND <G? .X 96>						; "all caps"
									<L? .X 123>
									>
									<SET X <- .X 32>>
							)
						>
						<PUTB ,GL-INSAVE-A .SPTR .X>			; "move char"
						<INC WPTR>									; "point to next char"
						<COND
							(<OR	<IGRTR? SPTR 79>				; "overflow?"
									<IGRTR? CNT .WLEN>			; "word done?"
									>
										<RETURN>
							)
						>
				>
			)
		>
		<SET LPTR <+ .LPTR 4>>				; "update GL-P-P-LEX pointers"
		<SET EPTR <+ .EPTR 2>>
		<COND
			(<G? .SPTR 79>						; "overflowed?"
				<SET SPTR 79>					; "back up and exit"
				<RETURN>
			)
			(<IGRTR? TOKENS .SAVLEN>		; "exit if no more tokens"
				<RETURN>
			)
		>
	>
	<PUTB ,GL-INSAVE-A 0 <- .SPTR 1>> 	; "remember length of line"
	<RTRUE>
>

;------------------------------------------------------------------------------
; "RT-PERFORM"
;------------------------------------------------------------------------------

<ROUTINE RT-PERFORM (A "OPTIONAL" (O <>) (I <>) "AUX" W-ROOM W-LOC I-LOC O-LOC V OA OO OI ONP WHO)

;	#DECL ((A) FIX (O) <OR FALSE OBJECT FIX> (I) <OR FALSE OBJECT>)

; "beg - winner is not person processing"

	<COND
		(<MC-ISNOT? ,GL-WINNER ,FL-ALIVE>
			<RT-NOT-LIKELY-MSG ,GL-WINNER "would respond">
			<RT-P-CLEAR>
			<MC-RFATAL>
		)
	>

; "beg - verb is a 'see' processing"

	<COND
		(<AND
			<INTBL? .A <REST ,GL-SEE-VERBS 2> <GET ,GL-SEE-VERBS 0>>
			<MC-F? ,GL-NOW-LIT?>
			>
			<TELL ,K-TOO-DARK-MSG CR>
			<MC-RFATAL>
		)
	>

; "save certain globals as locals for potential recursive call of rt-perform"

	<SET OA ,GL-PRSA>
	<SET OO ,GL-PRSO>
	<SET OI ,GL-PRSI>
	<SET ONP ,GL-NOW-PRSI?>

; "set up some locals need below"

	<SET WHO <RT-ANYONE-HERE?>>
	<SET V 0>

; "beg - verb is not walk check"

	<COND
		(<NOT <EQUAL? .A ,V?WALK>>

; "beg - is gl-winner equal ch-player processing"

			<COND
				(<AND
					<EQUAL? ,GL-WINNER ,CH-PLAYER>
					<MC-VERB? WHO WHAT WHERE>
					>
					<COND
						(<ZERO? .WHO>
							<RT-NOBODY-TO-ASK-MSG>
							<MC-RFATAL>
						)
						(T
							<SETG GL-WINNER .WHO>
							<RT-SPOKEN-TO-MSG .WHO>
						)
					>
				)

; "DEB - Supply person for ASK FOR OBJECT and ASK ABOUT OBJECT."

				(<AND <EQUAL? ,GL-WINNER ,CH-PLAYER>
						<MC-VERB? ASK-FOR-1 ASK-ABOUT-1>
						>
						<COND
							(<MC-F? .WHO>
								<RT-NOBODY-TO-ASK-MSG>
								<MC-RFATAL>
							)
							(T
								<RT-SPOKEN-TO-MSG .WHO>
								<SETG GL-PRSI ,GL-PRSO>
								<SETG GL-PRSO .WHO>
								<COND
									(<MC-VERB? ASK-FOR-1>
										<SETG GL-PRSA ,V?ASK-FOR>
									)
									(<MC-VERB? ASK-ABOUT-1>
										<SETG GL-PRSA ,V?ASK-ABOUT>
									)
								>
								<SET A ,GL-PRSA>
								<SET O ,GL-PRSO>
								<SET I ,GL-PRSI>
							)
						>
				)

				(<AND	<EQUAL? ,GL-WINNER ,CH-PLAYER>
						<EQUAL? .O ,CH-ME>
						<MC-VERB? TELL TELL-ABOUT ASK-ABOUT ASK-FOR QUESTION REPLY THANK YELL HELLO GOODBYE SAY ALARM PASSWORD>
						>
						<COND
							(<ZERO? .WHO>
								<RT-TALK-TO-SELF-MSG>
								<MC-RFATAL>
							)
							(T
								<SETG GL-WINNER .WHO>
								<RT-SPOKEN-TO-MSG .WHO>
							)
						>
				)
			>
			<COND
				(<EQUAL? ,CH-YOU .I .O>
					<COND
						(<EQUAL? ,GL-WINNER ,CH-PLAYER>
							<COND
								(<ZERO? .WHO>
									<RT-TALK-TO-SELF-MSG>
									<MC-RFATAL>
								)
								(T
									<SETG GL-WINNER .WHO>
									<RT-SPOKEN-TO-MSG .WHO>
								)
							>
						)
						(T
							<SETG GL-P-QCONTEXT-TH ,GL-WINNER>
							<SETG GL-P-QCONTEXT-RM ,GL-PLACE-CUR>
							<SET WHO ,GL-WINNER>
						)
					>
					<COND
						(<EQUAL? .I ,CH-YOU>
							<SET I .WHO>
						)
					>
					<COND
						(<EQUAL? .O ,CH-YOU>
							<SET O .WHO>
						)
					>
				)
			>
			<COND
				(<AND	<EQUAL? ,TH-IT .I .O>
						<NOT <RT-ACCESSIBLE? ,GL-P-IT-OBJECT>>
						>
						<COND
							(<ZERO? .I>
								<RT-FAKE-ORPHAN-MSG>
							)
							(T
								<RT-CANT-SEE-ANY-MSG ,GL-P-IT-OBJECT>
							)
						>
						<MC-RFATAL>
				)
			>
			<COND
				(<EQUAL? ,CH-THEM .I .O>
					<COND
						(<RT-VISIBLE? ,GL-P-THEM-OBJECT>
							<COND
								(<EQUAL? ,CH-THEM .O>
									<SET O ,GL-P-THEM-OBJECT>
								)
							>
							<COND
								(<EQUAL? ,CH-THEM .I>
									<SET I ,GL-P-THEM-OBJECT>
								)
							>
						)
						(T
							<COND
								(<ZERO? .I>
									<RT-FAKE-ORPHAN-MSG>
								)
								(T
									<RT-CANT-SEE-ANY-MSG ,GL-P-THEM-OBJECT>
								)
							>
							<MC-RFATAL>
						)
					>
				)
			>
			<COND
				(<EQUAL? ,CH-HER .I .O>
					<COND
						(<RT-VISIBLE? ,GL-P-HER-OBJECT>
							<COND
								(<AND	<EQUAL? ,GL-P-HER-OBJECT ,GL-WINNER>
										<RT-NO-OTHER? T>
										>
											<MC-RFATAL>
								)
							>
							<COND
								(<EQUAL? ,CH-HER .O>
									<SET O ,GL-P-HER-OBJECT>
								)
							>
							<COND
								(<EQUAL? ,CH-HER .I>
									<SET I ,GL-P-HER-OBJECT>
								)
							>
						)
						(T
							<COND
								(<ZERO? .I>
									<RT-FAKE-ORPHAN-MSG>
								)
								(T 
									<RT-CANT-SEE-ANY-MSG ,GL-P-HER-OBJECT>
								)
							>
							<MC-RFATAL>
						)
					>
				)
			>
			<COND
				(<EQUAL? ,CH-HIM .I .O>
					<COND
						(<RT-VISIBLE? ,GL-P-HIM-OBJECT>
							<COND
								(<AND	<EQUAL? ,GL-P-HIM-OBJECT ,GL-WINNER>
										<RT-NO-OTHER?>
										>
										<MC-RFATAL>
								)
							>
							<COND
								(<EQUAL? ,CH-HIM .O>
									<SET O ,GL-P-HIM-OBJECT>
								)
							>
							<COND
								(<EQUAL? ,CH-HIM .I>
									<SET I ,GL-P-HIM-OBJECT>
								)
							>
						)
						(T
							<COND
								(<ZERO? .I>
									<RT-FAKE-ORPHAN-MSG>
								)
								(T 
									<RT-CANT-SEE-ANY-MSG ,GL-P-HIM-OBJECT>
								)
							>
							<MC-RFATAL>
						)
					>
				)
			>
			<COND
				(<EQUAL? .O ,TH-IT>
					<SET O ,GL-P-IT-OBJECT>
				)
			>
			<COND
				(<EQUAL? .I ,TH-IT>
					<SET I ,GL-P-IT-OBJECT>
				)
			>
		)
	>

; "end - verb is not walk check"

; "FCW - temp fix for TAKE OBJECT syntax to supply implied FROM object"

	<COND
		(<AND
			<EQUAL? .A ,V?TAKE>
			<MC-T? .O>
			<MC-F? .I>
			<MC-T? <LOC .O>>
			>
			<SET I <LOC .O>>
		)
	>

; "set globals to action, o-object, i-object"
	
	<SETG GL-PRSA .A>
	<SETG GL-PRSI .I>
	<SETG GL-PRSO .O>

; "beg - verb is not walk and o-object or i-object is th-not-here-object processing"

	<COND
		(<AND
			<NOT <EQUAL? .A ,V?WALK>>
			<EQUAL? ,TH-NOT-HERE-OBJECT .O .I>
			>
				<COND
					(<SET V <APPLY ,RT-TH-NOT-HERE-OBJECT>>
						<SETG GL-P-GOOD <>>
					)
				>
		)
	>

; "update the various 'it' object global variables"

;	<RT-THIS-IS-IT ,GL-PRSI>	; "SWG thinks this should be enabled"
										; "RAB thinks this should'nt be enabled"
	<RT-THIS-IS-IT ,GL-PRSO>

; "set locals to the (possibly new) global o-object and i-object"

	<SET I ,GL-PRSI>
	<SET O ,GL-PRSO>
	<COND
		(<EQUAL? .O ,ROOMS>
			<SET O <>>
		)
	>
	
; "set local W-LOC to location of winner (may be an object)"
; "set local W-ROOM to room in which player exists"

	<SET W-LOC <LOC ,GL-WINNER>>
	<COND
		(<OR
			<MC-IS? .W-LOC ,FL-VEHICLE>
			<MC-IS? .W-LOC ,FL-CONTAINER>
			<MC-IS? .W-LOC ,FL-SURFACE>
			>
			<SET W-ROOM <LOC .W-LOC>>
		)
		(T
			<SET W-ROOM .W-LOC>
		)
	>

; "if v is 0 call the winner action routine with the winner context"

	<COND
		(<ZERO? .V>
			<SET V <APPLY <GETP ,GL-WINNER ,P?ACTION> ,K-M-WINNER>>
		)
	>

; "if v is 0 call the winner location action routine with the beg context"

	<COND
		(<ZERO? .V>
			<SET V <APPLY <GETP .W-ROOM ,P?ACTION> ,K-M-BEG>>
		)
	>

; "if v is 0 call the pre-action routine"

	<COND
		(<ZERO? .V>
			<SET V <APPLY <GET ,PREACTIONS .A>>>
		)
	>

; "beg - player is in vehicle/container processing"

	<COND
		(<AND
			<ZERO? .V>
			<EQUAL? ,GL-WINNER ,CH-PLAYER>
			<OR
				<MC-IS? .W-LOC ,FL-VEHICLE>
				<MC-IS? .W-LOC ,FL-CONTAINER>
				<MC-IS? .W-LOC ,FL-SURFACE>
			>
		 >
			<SET V <APPLY <GETP .W-LOC ,P?CONTFCN> ,K-M-CANT>>
		)
	>

; "end - player is in vehicle/container processing"

; "if v is 0 AND verb is:"
; "   tell-about OR ask-about OR ask-for OR walk"
; "then:"
; "   skip o-object container routine processing"
; "   skip i-object action    routine processing"
; "   skip i-object container routine processing"

	<COND
		(<AND
			<ZERO? .V>
			<NOT <EQUAL? .A ,V?WALK>>
			<NOT <EQUAL? .A ,V?TELL-ABOUT ,V?ASK-ABOUT ,V?ASK-FOR>>
		 >

			<COND
				(<AND
					<MC-T? .I>
					<SET I-LOC <LOC .I>>
					<OR
						<MC-IS? .I-LOC ,FL-VEHICLE>
						<MC-IS? .I-LOC ,FL-CONTAINER>
						<MC-IS? .I-LOC ,FL-SURFACE>
						>
					>
					 	<SETG GL-NOW-PRSI? T>
					 	<SET V <APPLY <GETP .I-LOC ,P?CONTFCN> ,K-M-CONT>>
				)
			>

			<COND
				(<AND
					<MC-T? .O>
					<SET O-LOC <LOC .O>>
					<OR
						<MC-IS? .O-LOC ,FL-VEHICLE>
						<MC-IS? .O-LOC ,FL-CONTAINER>
						<MC-IS? .O-LOC ,FL-SURFACE>
						>
					>
				 	<SETG GL-NOW-PRSI? <>>
				 	<SET V <APPLY <GETP .O-LOC ,P?CONTFCN> ,K-M-CONT>>
				)
			>

			<COND
				(<MC-T? .I>
					<SETG GL-NOW-PRSI? T>
					<SET V <APPLY <GETP .I ,P?ACTION>>>
				)
			>

		)
	>

; "if v is 0 & verb is not walk & there is an o-object call o-object action routine"

	<COND
		(<AND
			<ZERO? .V>
			<MC-T? .O>
			<NOT <EQUAL? .A ,V?WALK>>
			>
			<SETG GL-NOW-PRSI? <>>
			<SET V <APPLY <GETP .O ,P?ACTION>>>
		)
	>
	
; "if v is 0 call verb routine"

	<COND
		(<ZERO? .V>
			<SET V <APPLY <GET ,ACTIONS .A>>>
		)
	>

; "if v is 0 call the location action routine with the end context"

	<COND
		(<ZERO? .V>
			<SET V <APPLY <GETP .W-LOC ,P?ACTION> ,K-M-END>>
		)
	>

; "restore globals from locals saved for potential recursive call"
	
	<SETG GL-PRSA .OA>
	<SETG GL-PRSO .OO>
	<SETG GL-PRSI .OI>
	<SETG GL-NOW-PRSI? .ONP>

; "return value of first routine above which returned other than zero"
 
	<RETURN .V>
>

;-----------------------------------------------------------------------------
; "RT-SET-GL-PLACE-CUR"
;-----------------------------------------------------------------------------

<ROUTINE RT-SET-GL-PLACE-CUR ()
	<COND
		(<MC-IS? <LOC ,GL-WINNER> ,FL-VEHICLE>
			<SETG GL-PLACE-CUR <LOC <LOC ,GL-WINNER>>>
		)
		(T
			<SETG GL-PLACE-CUR <LOC ,GL-WINNER>>
		)
	>
>

;------------------------------------------------------------------------------
; "RT-PARSER"
; "Grovel down the input finding the verb, prepositions, and noun clauses."
; "If the input is <direction> or <walk> <direction>, fall out immediately"
; "setting PRSA to ,V?WALK and PRSO to <direction>.  Otherwise, perform"
; "all required orphaning, syntax checking, and noun clause lookup."
;------------------------------------------------------------------------------

<ROUTINE RT-PARSER ("AUX" (PTR ,K-P-LEXSTART) WRD (VAL 0) (VERB <>) (OF-FLAG <>)
		             (LEN 0) (DIR <>) (NW 0) (LW 0) (CNT 0) OWINNER OMERGED (TMP1 0))
	<REPEAT ()
		<COND
			(<G? .CNT ,K-P-ITBLLEN>
				<RETURN>
			)
			(<MC-F? ,GL-P-ORPH>
				<PUT ,GL-P-OTBL .CNT <GET ,GL-P-ITBL .CNT>>
			)
		>
		<PUT ,GL-P-ITBL .CNT 0>
		<INC CNT>
	>

	<SETG GL-P-NAM			<>>
	<SETG GL-P-ADJ			<>>
	<SETG GL-P-XNAM		<>>
	<SETG GL-P-XADJ		<>>
	<SETG GL-P-DIR-WORD	<>>

	<COND
		(<MC-F? ,GL-P-ORPH>
			<PUT ,GL-P-NAMW 0 <>>
			<PUT ,GL-P-NAMW 1 <>>
			<PUT ,GL-P-ADJW 0 <>>
			<PUT ,GL-P-ADJW 1 <>>
			<PUT ,GL-P-OFW  0 <>>
			<PUT ,GL-P-OFW  1 <>>
		)
	>

	<SET OMERGED ,GL-P-MERGED>
	<SET OWINNER ,GL-WINNER>

	<SETG GL-P-MERGED			<>>
	<SETG GL-P-END-ON-PREP	<>>

	<PUT ,GL-P-PRSO ,K-P-MATCHLEN 0>
	<PUT ,GL-P-PRSI ,K-P-MATCHLEN 0>
	<PUT ,GL-P-BUTS ,K-P-MATCHLEN 0>

	<COND
		(<AND <ZERO? ,GL-P-QUOT>
				<NOT <EQUAL? ,GL-WINNER ,CH-PLAYER>>
			>
				<SETG GL-WINNER ,CH-PLAYER>
				<RT-SET-GL-PLACE-CUR>
				<SETG GL-NOW-LIT? <RT-IS-LIT?>>
		)
	>

   <COND
      (<MC-T? ,GL-RESERVE-PTR>
         <SET PTR ,GL-RESERVE-PTR>
         <RT-STUFF ,GL-P-P-LEX ,GL-P-T-LEX>
         <COPYT ,GL-P-RIBUF ,GL-P-PIBUF ,K-P-INBUF-SIZE>
         <COND
            (<AND <MC-T? ,GL-DESC-LEVEL>
                  <EQUAL? ,CH-PLAYER ,GL-WINNER>
                  >
                     <CRLF>
            )
          >
	       <SETG GL-RESERVE-PTR <>>
	       <SETG GL-P-CONT <>>
      )
      (<MC-T? ,GL-P-CONT>
         <SET PTR ,GL-P-CONT>
         <SETG GL-P-CONT <>>
         <COND
            (<AND <MC-T? ,GL-DESC-LEVEL>
                  <EQUAL? ,CH-PLAYER ,GL-WINNER>
                  >
                     <CRLF>
            )
         >
      )
      (T
         <SETG GL-WINNER ,CH-PLAYER>
         <SETG GL-P-QUOT <>>
         <RT-SET-GL-PLACE-CUR>
         <SETG GL-NOW-LIT? <RT-IS-LIT?>>

			<COND
				(<BTST <LOWCORE FLAGS> 4>
					<LOWCORE FLAGS <BAND <LOWCORE FLAGS> -5>>
					<RT-INIT-SCREEN>
				)
			>
			<RT-UPDATE-STATUS-LINE>
			<COND
				(,GL-WHERE-TO-PROMPT?
					<TELL CR "\"Where to, guv'nor?\"" CR>
				)
			>
			<COND
				(,GL-WHERE-TO-ORPH?
					<RT-ORPHAN-VERB ,W?DRIVE ,ACT?DRIVE>
				)
			>
         <TELL CR ">">

         <PUTB ,GL-P-P-LEX 0 59>
			<PUTB ,GL-P-PIBUF 1 0>
         <READ ,GL-P-PIBUF ,GL-P-P-LEX>
;        <RT-SAVE-INPUT>
      )
   >

   <SETG GL-P-LEN <GETB ,GL-P-P-LEX ,K-P-LEXWORDS>>
;  <PUT ,GL-P-P-LEX <+ 1 <* ,GL-P-LEN ,K-P-LEXELEN>> 0>

; "if quote is first token, ignore it"
; "ignore boring first words"

   <COND
      (<EQUAL? <GET ,GL-P-P-LEX .PTR>
				,W?QUOTE
				,W?PERIOD
				,W?THEN
				,W?PLEASE
				,W?SO
			>
         <SET PTR <+ .PTR ,K-P-LEXELEN>>
         <SETG GL-P-LEN <- ,GL-P-LEN 1>>
      )
   >

	<SET TMP1 <GET ,GL-P-P-LEX .PTR>>

; "if first word is GO followed by a verb, ignore it"

   <COND
      (<AND <L? 1 ,GL-P-LEN>
            <EQUAL? <GET ,GL-P-P-LEX .PTR> ,W?GO>
            <SET NW <GET ,GL-P-P-LEX <+ .PTR ,K-P-LEXELEN>>>
            <RT-WT? .NW ,PS?VERB ;,P1?VERB>
            >
               <SET PTR <+ .PTR ,K-P-LEXELEN>>
               <SETG GL-P-LEN <- ,GL-P-LEN 1>>
      )
   >

   <COND
      (<ZERO? ,GL-P-LEN>
         <TELL "[What?]" CR>
         <RFALSE>
      )
	>
	<COND
		(<EQUAL? <GET ,GL-P-P-LEX .PTR> ,W?UNDO>
			<V-UNDO>
			<RFALSE>
		)
		(T
			<SETG GL-CAN-UNDO <ISAVE>>
			<COND
				(<EQUAL? ,GL-CAN-UNDO 2>
					<V-REFRESH>
					<TELL "[UNDO completed.]" CR>
					<AGAIN>
				)
			>
		)
	>
	<COND
      (<EQUAL? <GET ,GL-P-P-LEX .PTR> ,W?OOPS W?O>
         <COND
            (<EQUAL? <GET ,GL-P-P-LEX <+ .PTR ,K-P-LEXELEN>>
             ,W?PERIOD ,W?COMMA>
               <SET PTR <+ .PTR ,K-P-LEXELEN>>
               <SETG GL-P-LEN <- ,GL-P-LEN 1>>
            )
         >
         <COND
            (<NOT <G? ,GL-P-LEN 1>>
               <TELL "[You cannot use OOPS that way.]" CR>
               <RFALSE>
            )
            (<GET ,GL-OOPS-TABLE ,K-O-PTR>
               <COND
                  (<G? ,GL-P-LEN 2>
                     <TELL "[Only the first word after OOPS is used.]" CR>
                  )
               >
               <PUT ,GL-P-S-LEX <GET ,GL-OOPS-TABLE ,K-O-PTR>
                  <GET ,GL-P-P-LEX <+ .PTR ,K-P-LEXELEN>>>
               <SETG GL-WINNER .OWINNER>
               <RT-INBUF-ADD <GETB ,GL-P-P-LEX <+ <* .PTR ,K-P-LEXELEN> 6>>
                  <GETB ,GL-P-P-LEX <+ <* .PTR ,K-P-LEXELEN> 7>>
                  <+ <* <GET ,GL-OOPS-TABLE ,K-O-PTR> ,K-P-LEXELEN> 3>
               >
               <RT-STUFF ,GL-P-P-LEX ,GL-P-S-LEX>
               <SETG GL-P-LEN <GETB ,GL-P-P-LEX ,K-P-LEXWORDS>>
               <SET PTR <GET ,GL-OOPS-TABLE ,K-O-START>>
               <COPYT ,GL-OOPS-INBUF ,GL-P-PIBUF ,K-P-INBUF-SIZE>
            )
            (T
               <PUT ,GL-OOPS-TABLE ,K-O-END <>>
               <TELL "[There was no word to replace in that sentence.]" CR>
               <RFALSE>
            )
         >
      )
      (T
         <PUT ,GL-OOPS-TABLE ,K-O-END <>>
      )
   >

   <COND
      (<EQUAL? <GET ,GL-P-P-LEX .PTR> ,W?AGAIN ,W?G>
         <COND
            (<OR  <MC-T? ,GL-P-ORPH>
                  <ZERO? ,GL-P-GOOD>
                  <ZERO? <GETB ,GL-OOPS-INBUF 1>>
                  >
                     <TELL "[You cannot use AGAIN that way.]" CR>
                     <RFALSE>
            )
            (<G? ,GL-P-LEN 1>
               <COND
                  (<OR  <EQUAL? <GET ,GL-P-P-LEX <+ .PTR ,K-P-LEXELEN>>
                  		   ,W?PERIOD ,W?COMMA ,W?THEN>
                        <EQUAL? <GET ,GL-P-P-LEX <+ .PTR ,K-P-LEXELEN>>
                           ,W?AND>
                        >
                           <SET PTR <+ .PTR <* 2 ,K-P-LEXELEN>>>
                           <PUTB ,GL-P-P-LEX ,K-P-LEXWORDS
                           <- <GETB ,GL-P-P-LEX ,K-P-LEXWORDS> 2>>
                  )
                  (T
                     <TELL ,K-DONT-UNDERSTAND-MSG CR>
                     <RFALSE>
                  )
               >
            )
            (T
               <SET PTR <+ .PTR ,K-P-LEXELEN>>
               <PUTB ,GL-P-P-LEX ,K-P-LEXWORDS 
               <- <GETB ,GL-P-P-LEX ,K-P-LEXWORDS> 1>>
            )
         >

         <COND
            (<G? <GETB ,GL-P-P-LEX ,K-P-LEXWORDS> 0>
               <RT-STUFF ,GL-P-T-LEX ,GL-P-P-LEX>
               <COPYT ,GL-P-PIBUF ,GL-P-RIBUF ,K-P-INBUF-SIZE>
               <SETG GL-RESERVE-PTR .PTR>
            )
            (T
               <SETG GL-RESERVE-PTR <>>
            )
         >

;        <SETG GL-P-LEN <GETB ,GL-P-S-LEX ,K-P-LEXWORDS>>

; "Following cond per discussion with SWG."
			<COND
				(<RT-VISIBLE? .OWINNER>
		         <SETG GL-WINNER .OWINNER>
				)
				(T
					<TELL CTHE .OWINNER " is not here anymore." CR>
					<RFALSE>
				)
			>

         <SETG GL-P-MERGED .OMERGED>
         <COPYT ,GL-OOPS-INBUF ,GL-P-PIBUF ,K-P-INBUF-SIZE>
         <RT-STUFF ,GL-P-P-LEX ,GL-P-S-LEX>
         <SET CNT -1>
         <SET DIR ,GL-AGAIN-DIR>

         <REPEAT ()
            <COND
               (<IGRTR? CNT ,K-P-ITBLLEN>
                  <RETURN>
               )
               (T
                  <PUT ,GL-P-ITBL .CNT <GET ,GL-P-OTBL .CNT>>
               )
            >
         >
      )
      (T
; "This COND created around the SETG per SWG to prevent the number value from
	disappearing when the parser orphans something. I.e. Which # do you mean?"
			<COND
				(<NOT ,GL-P-ORPH>
		         <SETG GL-P-NUMBER -1>
				)
			>
         <RT-STUFF ,GL-P-S-LEX ,GL-P-P-LEX>
         <COPYT ,GL-P-PIBUF ,GL-OOPS-INBUF ,K-P-INBUF-SIZE>
         <PUT ,GL-OOPS-TABLE ,K-O-START .PTR>
         <PUT ,GL-OOPS-TABLE ,K-O-LENGTH <* 4 ,GL-P-LEN>>
         <SET LEN <* 2 <+ .PTR <* ,K-P-LEXELEN <GETB ,GL-P-P-LEX ,K-P-LEXWORDS>>>>>
         <PUT ,GL-OOPS-TABLE ,K-O-END <+ <GETB ,GL-P-P-LEX <- .LEN 1>> <GETB ,GL-P-P-LEX <- .LEN 2>>>>
         <SETG GL-RESERVE-PTR <>>
         <SET LEN ,GL-P-LEN>
         <SETG GL-P-DIR <>>
         <SETG GL-P-NCN 0>
         <SETG GL-P-GET-FLAGS 0>
         <PUT ,GL-P-ITBL ,K-P-VERBN 0>

         <REPEAT ()
            <COND
               (<L? <SETG GL-P-LEN <- ,GL-P-LEN 1>> 0>
                  <SETG GL-P-QUOT <>>
                  <RETURN>
               )
               (<RT-BUZZ-WORD-MSG? <SET WRD <GET ,GL-P-P-LEX .PTR>>>
                  <RFALSE>
               )
               (<OR  <MC-T? .WRD>
                     <SET WRD <RT-NUMBER? .PTR>>
;                    <SET WRD <NAME? .PTR>>
                     >
                        <COND
                           (<0? ,GL-P-LEN>
                              <SET NW 0>
                           )
                           (T
                              <SET NW <GET ,GL-P-P-LEX <+ .PTR ,K-P-LEXELEN>>>
                           )
                        >
                        <COND
                           (<AND <EQUAL? .WRD ,W?TO>
                                 <EQUAL? .VERB ,ACT?TELL ,ACT?ASK>
                                 >
                                    <PUT ,GL-P-ITBL ,K-P-VERB ,ACT?TELL>
;                                   <SET VERB ,ACT?TELL>
                                    <SET WRD ,W?QUOTE>
                           )
                           (<AND <EQUAL? .WRD ,W?THEN ; ,W?PERIOD>
;                                <NOT <EQUAL? .NW ,W?THEN ,W?PERIOD>>
                                 <G? ,GL-P-LEN 0>
                                 <ZERO? .VERB>
                                 <ZERO? ,GL-P-QUOT>
                                 >
                                    <PUT ,GL-P-ITBL ,K-P-VERB ,ACT?TELL>
                                    <PUT ,GL-P-ITBL ,K-P-VERBN 0>
                                    <SET WRD ,W?QUOTE>
												<SETG GL-P-ORPH <>> ; "PER SWG 8/28/87"
                           )
                           (<AND <EQUAL? .WRD ,W?PERIOD>
                                 <OR   <EQUAL? .LW ,W?MR ,W?MRS ,W?MISS>
                                       <EQUAL? .LW ,W?DR>
                                       >
                                 >
                                    <SETG GL-P-NCN <- ,GL-P-NCN 1>>
                                    <RT-CHANGE-LEXV .PTR .LW T>
                                    <SET WRD .LW>
                                    <SET LW 0>
                           )
                        >
                        <COND
;                          (<AND <EQUAL? .WRD ,W?PERIOD>
                                 <EQUAL? .LW ,W?DR ,W?MR ,W?MRS>
                                 >
                                    <SET LW 0>
                           )
                           (<EQUAL? .WRD ,W?THEN ,W?PERIOD ,W?QUOTE>
                              <COND
                                 (<EQUAL? .WRD ,W?QUOTE>
                                    <COND
                                       (<MC-T? ,GL-P-QUOT>
                                          <SETG GL-P-QUOT <>>
                                       )
                                       (T
                                          <SETG GL-P-QUOT T>
                                       )
                                    >
                                 )
                              >
                              <OR   <ZERO? ,GL-P-LEN>
                                    <SETG GL-P-CONT <+ .PTR ,K-P-LEXELEN>>>
                              <PUTB ,GL-P-P-LEX ,K-P-LEXWORDS ,GL-P-LEN>
                              <RETURN>
                           )
                           (<AND <SET VAL
                                    <RT-WT? .WRD ,PS?DIRECTION ,P1?DIRECTION>
                                 >
                                 <EQUAL? .VERB <> ,ACT?WALK ,ACT?GO>
                                 <OR   <EQUAL? .LEN 1>
                                       <AND  <EQUAL? .LEN 2>
                                             <EQUAL? .VERB ,ACT?WALK ,ACT?GO>
                                             >
                                       <AND  <EQUAL? .NW ,W?THEN ,W?PERIOD ,W?QUOTE>
                                             <G? .LEN 1 ;2>
                                             >
;                                      <AND  <EQUAL? .NW ,W?PERIOD>
                                             <G? .LEN 1>
                                             >
                                       <AND  <MC-T? ,GL-P-QUOT>
                                             <EQUAL? .LEN 2>
                                             <EQUAL? .NW ,W?QUOTE>
                                       >
                                       <AND  <G? .LEN 2>
                                             <EQUAL? .NW ,W?COMMA ,W?AND>
                                             >
                                       >
                                 >
                                    <SET DIR .VAL>
                                    <SETG GL-P-DIR-WORD .WRD>
                                    <COND
                                       (<EQUAL? .NW ,W?COMMA ,W?AND>
                                          <RT-CHANGE-LEXV <+ .PTR ,K-P-LEXELEN>
                                             ,W?THEN>
                                       )
                                    >
                                    <COND
                                       (<NOT <G? .LEN 2>>
                                          <SETG GL-P-QUOT <>>
                                          <RETURN>
                                       )
                                    >
                           )
                           (<AND <SET VAL <RT-WT? .WRD ,PS?VERB ,P1?VERB>>
                                 <ZERO? .VERB>
                                 >
	                                 <SETG GL-P-PRSA-WORD .WRD>
                                    <SET VERB .VAL>
                                    <PUT ,GL-P-ITBL ,K-P-VERB .VAL>
                                    <PUT ,GL-P-ITBL ,K-P-VERBN ,GL-P-VTBL>
                                    <PUT ,GL-P-VTBL 0 .WRD>
                                    <PUTB ,GL-P-VTBL 2 <GETB ,GL-P-P-LEX <SET TMP1 <+ <* .PTR 2> 2>>>>
                                    <PUTB ,GL-P-VTBL 3 <GETB ,GL-P-P-LEX <+ .TMP1 1>>>
                           )
									(<OR	<SET VAL <RT-WT? .WRD ,PS?PREPOSITION 0>>
											<EQUAL? .WRD ,W?A ,W?EVERYTHING>
											<EQUAL? .WRD ,W?BOTH ,W?ALL>
											<RT-WT? .WRD ,PS?ADJECTIVE>
											<RT-WT? .WRD ,PS?OBJECT>
											>
                                    <COND
                                       (<AND <G? ,GL-P-LEN 1>
                                             <EQUAL? .NW ,W?OF>
                                             <NOT <EQUAL? .VERB
;                                               ,ACT?MAKE ,ACT?TAKE>>
                                             <ZERO? .VAL>
                                             <NOT <EQUAL? .WRD ,W?A>>
                                             <NOT <EQUAL? .WRD ,W?ALL ,W?BOTH
                                                ,W?EVERYTHING>>
                                             >
;                                               <COND
                                                   (<EQUAL? .WRD ,W?BOTTOM>
                                                      <SET BOTTOM T>
                                                   )
                                                >
                                                <PUT ,GL-P-OFW ,GL-P-NCN .WRD>
                                                <SET OF-FLAG T>
                                       )
                                       (<AND <MC-T? .VAL>
                                             <OR   <ZERO? ,GL-P-LEN>
                                                   <EQUAL? .NW ,W?THEN ,W?PERIOD>
                                                   >
                                             >
                                                <SETG GL-P-END-ON-PREP T>
                                                <COND
                                                   (<L? ,GL-P-NCN 2>
                                                      <PUT ,GL-P-ITBL ,K-P-PREP1 .VAL>
                                                      <PUT ,GL-P-ITBL ,K-P-PREP1N .WRD>
                                                   )
                                                >
                                       )
                                       (<EQUAL? ,GL-P-NCN 2>
                                          <TELL	"[There are too many nouns in that sentence.]" CR>
                                          <RFALSE>
                                       )
                                       (T
                                          <SETG GL-P-NCN <+ ,GL-P-NCN 1>>
                                          <OR   <SET PTR <RT-CLAUSE .PTR .VAL .WRD>>
                                                <RFALSE>
                                                >
                                          <COND
                                             (<L? .PTR 0>
                                                <SETG GL-P-QUOT <>>
                                                <RETURN>
                                             )
                                          >
                                       )
                                    >
                           )
                           (<EQUAL? .WRD ,W?OF>
                              <COND
                                 (<OR  <ZERO? .OF-FLAG>
                                       <EQUAL? .NW ,W?PERIOD ,W?THEN>
                                       >
                                          <RT-DONT-KNOW-WORD-USE-MSG .PTR>
                                          <RFALSE>
                                 )
                                 (T
                                    <SET OF-FLAG <>>
                                 )
                              >
                           )
                           (<RT-WT? .WRD ,PS?BUZZ-WORD>
                           )
                           (<AND <EQUAL? .VERB ,ACT?TELL>
                                 <RT-WT? .WRD ,PS?VERB ;,P1?VERB>
                                 >
                                 <RT-WAY-TO-TALK-MSG>
                                 <RFALSE>
                           )
                           (T
                              <RT-DONT-KNOW-WORD-USE-MSG .PTR>
                              <RFALSE>
                           )
                        >
               )
               (T
                  <RT-DONT-KNOW-WORD-MSG .PTR>
                  <RFALSE>
               )
            >
            <SET LW .WRD>
            <SET PTR <+ .PTR ,K-P-LEXELEN>>
         >
      )
   >

	<PUT ,GL-OOPS-TABLE ,K-O-PTR <>>

	<COND
      (<MC-T? .DIR>
         <SETG GL-PRSA ,V?WALK>
         <SETG GL-P-WALK-DIR .DIR>
         <SETG GL-AGAIN-DIR .DIR>
         <SETG GL-PRSO .DIR>
         <SETG GL-P-ORPH <>>
         <RTRUE>
      )
   >

	<SETG GL-P-WALK-DIR <>>
	<SETG GL-AGAIN-DIR <>>

   <COND
      (<AND <MC-T? ,GL-P-ORPH>
            <RT-ORPHAN-MERGE>
            >
               <SETG GL-WINNER .OWINNER>
      )
   >

   <COND
      (<AND <RT-SYNTAX-CHECK>
            <RT-SNARF-OBJECTS>
            <RT-MANY-CHECK>
            <RT-ITAKE-CHECK ,GL-P-PRSO <GETB ,GL-P-SYNTAX ,K-P-SLOC1>>
            <RT-ITAKE-CHECK ,GL-P-PRSI <GETB ,GL-P-SYNTAX ,K-P-SLOC2>>
            >
               <RTRUE>
      )
   >

>

;******************************************************************************
; "end of file"
;******************************************************************************

