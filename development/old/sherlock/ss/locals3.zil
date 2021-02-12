;*****************************************************************************
; "game : SHERLOCK!"
; "file : LOCALS3.ZIL"
; "auth :   $Author:   RAB  $"
; "date :     $Date:   23 Oct 1987 20:00:46  $"
; "rev  : $Revision:   1.28  $"
; "vers : 1.00"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "this file contains:"
; "  descfcn routines for all local globals"
;-----------------------------------------------------------------------------

;-----------------------------------------------------------------------------
; "RT-DF-LG-SHOPS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-LG-SHOPS ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-DF "LG-SHOPS">
		)
		(T
		)
	>
	<TELL "The shops are closed for the Jubilee." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-LG-CROWDS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-LG-CROWDS ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-DF "LG-CROWDS">
		)
		(T
		)
	>
	<COND
		(<EQUAL? ,GL-PLACE-CUR ,RM-FLEET-STREET>
			<COND
				(<EQUAL? <RT-TIME-OF-DAY> 0>
					<TELL "They're all inside, hard at work." CR>
				)
				(T
					<TELL
"They hurry past you, intent on getting to their offices." CR
					>
				)
			>
		)
		(<EQUAL? <RT-TIME-OF-DAY> 0>
			<TELL "There are no crowds here. They're all asleep." CR>
			<RTRUE>
		)
		(<EQUAL? ,GL-PLACE-CUR ,RM-TOTTENHAM-COURT-RD ,RM-OXFORD-ST>
			<TELL "The shoppers don't appear happy that the shops are closed." CR
			>
		)
		(<EQUAL? ,GL-PLACE-CUR ,RM-TRAFALGAR-SQUARE>
			<TELL "The people are happily feeding the pigeons." CR
			>
		)
		(<EQUAL? ,GL-PLACE-CUR ,RM-GROSVENOR-PLACE>
			<TELL "The people are anxiously consulting their sight-seeing
maps." CR
			>
		)
		(<EQUAL? ,GL-PLACE-CUR ,RM-THE-STRAND>
			<COND
				(<EQUAL? <RT-TIME-OF-DAY> 3>
					<TELL "The theatre-goers are happily discussing the evening's
entertainment." CR
					>
				)
				(T
					<TELL "The crowds are trying to select a show to attend
this evening."	CR
					>
				)
			>
		)
		(T
			<COND
				(<EQUAL? <RT-TIME-OF-DAY> 2>
					<TELL "They surge around you, excited about the
sight-seeing they have planned for today." CR
					>
				)
				(<EQUAL? <RT-TIME-OF-DAY> 3>
					<TELL "They nearly trample you in their eagerness to get back
to their hotels before darkness falls." CR
					>
				)
				(<EQUAL? <RT-TIME-OF-DAY> 1>
					<TELL "They surge around you, intent on their
sight-seeing." CR
					>
				)
			>
			<RTRUE>
		)
	>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-DF-LG-PLAQUES"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-LG-PLAQUES ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-DF "LG-PLAQUES">
		)
		(T
		)
	>
	<TELL
"It looks mighty like a plaque." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-LG-WAX-STATUES"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-LG-WAX-STATUES ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-DF "LG-WAX-STATUES">
		)
		(T
		)
	>
	<COND
		(<EQUAL? ,GL-PLACE-CUR ,RM-MADAME-TUSSAUDS>
			<TELL "The statues are of King John, Sir Francis Drake, Sir
Walter Raleigh, and William the Conqueror." CR>
		)
		(<EQUAL? ,GL-PLACE-CUR ,RM-CHAMBER-OF-HORRORS>
			<TELL "The statues are of Guy Fawkes, Charles I, and Saint
Thomas Becket." CR>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-LG-PEDESTAL"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-LG-PEDESTAL ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-DF "LG-PEDESTAL">
		)
		(T
		)
	>
	<COND
		(<EQUAL? ,GL-PLACE-CUR ,RM-TRAFALGAR-SQUARE>
			<TELL "On the pedestal you see a bronze relief." CR>
		)
	>
>


;-----------------------------------------------------------------------------
; "RT-DF-LG-WINDOW"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-LG-WINDOW ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-DF "LG-WINDOW">
		)
		(T
		)
	>
	<COND
		(<EQUAL? ,GL-PLACE-CUR ,RM-221B-BAKER-ST>
			<TELL "It is a bow window, far above your head." CR>
		)
		(<EQUAL? ,GL-PLACE-CUR ,RM-SOUTH-TRANSEPT>
			<TELL "It is the largest rose window in all England">
			<COND
				(<EQUAL? <RT-TIME-OF-DAY> 1 2 3>
					<TELL ,K-BRIGHTENS-UP-MSG>
				)
			>
			<TELL "." CR>
		)
		(<EQUAL? ,GL-PLACE-CUR ,RM-NORTH-TRANSEPT>
			<TELL "It is set high in the north wall of the Abbey">
			<COND
				(<EQUAL? <RT-TIME-OF-DAY> 1 2 3>
					<TELL ,K-BRIGHTENS-UP-MSG>
				)
			>
			<TELL "." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-LG-TOMBS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-LG-TOMBS ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-LG-DF "LG-TOMBS">
		)
		(T
		)
	>
	<COND
		(<EQUAL? ,GL-PLACE-CUR ,RM-SOUTH-AMBULATORY ,RM-NORTH-AMBULATORY>
			<TELL
"There are so many of them! None stands out in particular." CR
			>
		)
		(<EQUAL? ,GL-PLACE-CUR ,RM-CONFESSOR-CHAPEL>
			<TELL
"Two of them are especially interesting. One is the tomb of Edward
The Confessor. The other is of Henry V." CR
			>
		)
		(T
			<TELL "One tomb in particular catches your eye." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-LG-SHAFT-OF-LIGHT"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-LG-SHAFT-OF-LIGHT ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-DF "LG-SHAFT-OF-LIGHT" .CONTEXT>
		)
		(T
		)
	>
	<TELL
"Well, it's not really a shaft of light. It's more like a diffused
murkiness. But any light that penetrates an English church from the outside
counts as a shaft." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-LG-RAVENS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-LG-RAVENS ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-DF "LG-RAVENS" .CONTEXT>
		)
		(T
		)
	>
	<TELL "The ravens stare at you with baleful eyes." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-LG-BOATS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-LG-BOATS ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-DF "LG-BOATS" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 0>
			<TELL CTHE ,LG-BOATS " are shrouded in fog." CR>
			<RTRUE>
		)
		(T
			<TELL CTHE ,LG-BOATS " bob merrily on the river." CR>
		)
	>
>


;*****************************************************************************
; "ROOM LOCAL GLOBALS"
;*****************************************************************************


;-----------------------------------------------------------------------------
; "RT-DF-LG-MONUMENT"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-LG-MONUMENT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-LG-DF "LG-MONUMENT">
		)
		(T
		)
	>
	<TELL
"It's a huge obelisk designed by Christopher Wren that towers
202 feet in the air." CR
	>
>

;*****************************************************************************
; "CONSTANTS"
;*****************************************************************************

<CONSTANT K-BRIGHTENS-UP-MSG
", and it brightens up an otherwise gloomy interior"
>

;*****************************************************************************
; "end of file"
;*****************************************************************************

