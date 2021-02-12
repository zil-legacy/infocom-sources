;*****************************************************************************
; "game : SHERLOCK!"
; "file : PEOPLE1.ZIL"
; "auth :   $Author:   RAB  $"
; "date :     $Date:   23 Oct 1987 20:09:34  $"
; "rev  : $Revision:   1.26  $"
; "vers : 1.00"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "this file contains:"
; "  object definitions of generic characters"
; "  object definitions of game    characters"
;-----------------------------------------------------------------------------

;*****************************************************************************
; "generic characters"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "CH-THEM"
;-----------------------------------------------------------------------------

<OBJECT CH-THEM
	(LOC GLOBAL-OBJECTS)
   (DESC "them")
   (FLAGS FL-NOARTC FL-PLURAL)
   (SYNONYM THEM THEMSELVES)
>

;-----------------------------------------------------------------------------
; "CH-ME"
;-----------------------------------------------------------------------------

<OBJECT CH-ME
   (LOC GLOBAL-OBJECTS)
	(DESC "yourself")
	(FLAGS FL-NOARTC FL-ALIVE FL-PERSON)
   (SYNONYM I ME MYSELF BODY SELF)
	(ADJECTIVE MY)
>

;-----------------------------------------------------------------------------
; "CH-YOU"
;-----------------------------------------------------------------------------

<OBJECT CH-YOU
	(LOC GLOBAL-OBJECTS)
	(DESC "myself")
	(FLAGS FL-NOARTC FL-ALIVE FL-PERSON)
	(SYNONYM YOU YOURSELF)
>

;-----------------------------------------------------------------------------
; "CH-HIM"
;-----------------------------------------------------------------------------

<OBJECT CH-HIM
	(LOC GLOBAL-OBJECTS)
   (DESC "him")
   (FLAGS FL-NOARTC FL-ALIVE FL-PERSON)
   (SYNONYM HIM HIMSELF)
>

;-----------------------------------------------------------------------------
; "CH-HER"
;-----------------------------------------------------------------------------

<OBJECT CH-HER
	(LOC GLOBAL-OBJECTS)
   (DESC "her")
   (FLAGS FL-NOARTC FL-ALIVE FL-PERSON FL-FEMALE)
   (SYNONYM HER HERSELF)
>

;-----------------------------------------------------------------------------
; "CH-PLAYER"
;-----------------------------------------------------------------------------

<OBJECT CH-PLAYER
	(DESC "you")
	(FLAGS FL-NOARTC FL-NODESC FL-ALIVE FL-PERSON)
	(SYNONYM DOCTOR WATSON)
	(ADJECTIVE DOCTOR)
	(SIZE 99)
	(MASS 0)
	(CAPACITY 60)
	(STRENGTH 999)
	(DEXTERITY 15)
	(IN-ABBEY 0)
	(ACTION RT-AC-CH-PLAYER)
	(DESCFCN RT-DF-CH-PLAYER)
>

;*****************************************************************************
; "game characters"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "CH-HOLMES"
;-----------------------------------------------------------------------------

<OBJECT CH-HOLMES
	(LOC TH-SOFA)
	(DESC "Holmes")
	(FLAGS FL-NOARTC FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL FL-ASLEEP)
	(SYNONYM HOLMES SHERLOCK DETECTIVE FRIEND COMPANION)
	(ADJECTIVE SHERLOCK)
	(SIZE 99)
	(CAPACITY 60)
	(STRENGTH 999)
	(DEXTERITY 10)
	(AUX1 0)
	(GENERIC RT-GN-HOLMES)
	(ACTION RT-AC-CH-HOLMES)
	(DESCFCN RT-DF-CH-HOLMES)
>

;-----------------------------------------------------------------------------
; "CH-MATCH-SNIFFING-DOG"
;-----------------------------------------------------------------------------

<OBJECT CH-MATCH-SNIFFING-DOG
	(LOC RM-MARYLEBONE-RD)
	(DESC "dog")
	(FLAGS FL-NODESC FL-ALIVE FL-TRYTAKE FL-NOALL)
	(SYNONYM DOG MUTT CUR)
	(ADJECTIVE TRAINED)
	(SIZE 15)
	(CAPACITY 15)
	(ACTION RT-AC-CH-MATCH-SNIFFING-DOG)
	(DESCFCN RT-DF-CH-MATCH-SNIFFING-DOG)
>

;-----------------------------------------------------------------------------
; "CH-TUSSAUDS-GUARD"
;-----------------------------------------------------------------------------

<OBJECT CH-TUSSAUDS-GUARD
	(LOC RM-MARYLEBONE-RD)
	(DESC "guard")
	(FLAGS FL-NODESC FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL)
	(SYNONYM GUARD)
	(ADJECTIVE TUSSAUDS)
	(SIZE 99)
	(CAPACITY 60)
	(ACTION RT-AC-CH-TUSSAUDS-GUARD)
	(DESCFCN RT-DF-CH-TUSSAUDS-GUARD)
>

;-----------------------------------------------------------------------------
; "CH-TRAINED-PIGEON"
;-----------------------------------------------------------------------------

<OBJECT CH-TRAINED-PIGEON
	(LOC CH-SHERMAN)
	(DESC "pigeon")
	(FLAGS FL-ALIVE FL-TAKEABLE)
	(SYNONYM PIGEON BIRD FOWL)
	(ADJECTIVE TRAINED)
	(SIZE 10)
	(VALUE 1)
	(CAPACITY 5)
	(MASS 5)
	(AUX1 0)
	(AUX2 0)
	(AUX3 0)
	(GENERIC RT-GN-PIGEON)
	(ACTION RT-AC-CH-TRAINED-PIGEON)
	(DESCFCN RT-DF-CH-TRAINED-PIGEON)
>

;-----------------------------------------------------------------------------
; "CH-SHERMAN"
;-----------------------------------------------------------------------------

<OBJECT CH-SHERMAN
	(LOC RM-SHERMANS-HOUSE)
	(DESC "Sherman")
	(FLAGS FL-NODESC FL-NOARTC FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL)
	(SYNONYM SHERMAN TRAINER TAXIDERMIST)
	(ADJECTIVE OLD)
	(SIZE 99)
	(CAPACITY 60)
	(ACTION RT-AC-CH-SHERMAN)
	(DESCFCN RT-DF-CH-SHERMAN)
>

;-----------------------------------------------------------------------------
; "CH-ABBEY-GUIDE"
;-----------------------------------------------------------------------------

;<OBJECT CH-ABBEY-GUIDE
   (DESC "verger")
   (FLAGS FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL FL-NODESC)
   (SYNONYM VERGER GUIDE)
   (ADJECTIVE ABBEY)
   (SIZE 99)
   (CAPACITY 60)
   (ACTION RT-AC-CH-ABBEY-GUIDE)
   (DESCFCN RT-DF-CH-ABBEY-GUIDE)
>

;-----------------------------------------------------------------------------
; "CH-BANK-GUARD"
;-----------------------------------------------------------------------------

<OBJECT CH-BANK-GUARD
	(LOC RM-THREADNEEDLE-ST)
	(DESC "guard")
	(FLAGS FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL FL-NODESC)
	(SYNONYM GUARD)
	(ADJECTIVE BANK)
	(SIZE 99)
	(CAPACITY 60)
	(AUX1 0)
	(ACTION RT-AC-CH-BANK-GUARD)
	(DESCFCN RT-DF-CH-BANK-GUARD)
>

;-----------------------------------------------------------------------------
; "CH-WIGGINS"
;-----------------------------------------------------------------------------
 
<OBJECT CH-WIGGINS
	(LOC RM-THREADNEEDLE-ST)
	(DESC "Wiggins")
	(FLAGS FL-NOARTC FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL FL-NODESC FL-BROKEN)
	(SYNONYM WIGGINS URCHIN BOY COMPANION)
	(SIZE 20)
	(CAPACITY 15)
	(STRENGTH 999)
	(DEXTERITY 10)
	(AUX1 0)		;"Wiggins activated = 1"
	(ACTION RT-AC-CH-WIGGINS)
	(DESCFCN RT-DF-CH-WIGGINS)
>

;-----------------------------------------------------------------------------
; "CH-ELIZA-DOOLITTLE"
;-----------------------------------------------------------------------------

<OBJECT CH-ELIZA-DOOLITTLE
	(LOC RM-COVENT-GARDEN)
	(DESC "girl")
	(FLAGS FL-ALIVE FL-PERSON FL-FEMALE FL-TRYTAKE FL-NOALL
			 FL-ASLEEP FL-NODESC)
	(SYNONYM ELIZA DOOLITTLE GIRL)
	(SIZE 99)
	(VALUE 5)
	(CAPACITY 10)
	(AUX1 0)
	(ACTION RT-AC-CH-ELIZA-DOOLITTLE)
	(DESCFCN RT-DF-CH-ELIZA-DOOLITTLE)
>

;-----------------------------------------------------------------------------
; "CH-MYCROFT-HOLMES"
;-----------------------------------------------------------------------------

<OBJECT CH-MYCROFT-HOLMES
	(DESC "Mycroft Holmes")
	(FLAGS FL-NOARTC FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL FL-ASLEEP
			 FL-LOCKED FL-NODESC)
	(SYNONYM MYCROFT HOLMES BROTHER)
	(ADJECTIVE FAT MYCROFT)
	(SIZE 99)
	(VALUE 1)
	(CAPACITY 99)
	(AUX1 0)		; "Password number: 1-6"
	(GENERIC RT-GN-HOLMES)
;	(ACTION RT-AC-CH-MYCROFT-HOLMES)
;	(DESCFCN RT-DF-CH-MYCROFT-HOLMES)
>

;-----------------------------------------------------------------------------
; "CH-PRIME-MINISTER"
;-----------------------------------------------------------------------------

<OBJECT CH-PRIME-MINISTER
	(DESC "the Prime Minister")
	(FLAGS FL-NOARTC FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL FL-NODESC)
	(SYNONYM MINISTER OFFICIAL VISITOR)
	(ADJECTIVE PRIME)
	(SIZE 15)
	(ACTION RT-AC-CH-PRIME-MINISTER)
	(DESCFCN RT-DF-CH-PRIME-MINISTER)
>

;-----------------------------------------------------------------------------
; "CH-AKBAR"
;-----------------------------------------------------------------------------

<OBJECT CH-AKBAR
	(LOC RM-LAIR)
	(DESC "Akbar")
	(FLAGS FL-NOARTC FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL)
	(SYNONYM AKBAR)
	(SIZE 99)
	(VALUE 1)
	(CAPACITY 20)
	(ACTION RT-AC-CH-AKBAR)
	(DESCFCN RT-DF-CH-AKBAR)
>

;-----------------------------------------------------------------------------
; "CH-MORIARTY"
;-----------------------------------------------------------------------------

<OBJECT CH-MORIARTY
	(LOC RM-LAIR)
	(DESC "Moriarty")
	(FLAGS FL-NOARTC FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL)
	(SYNONYM PROFESSOR PROF MORIARTY)
	(ADJECTIVE JAMES PROFESSOR PROF)
	(SIZE 99)
	(VALUE 1)
	(CAPACITY 20)
	(ACTION RT-AC-CH-MORIARTY)
	(DESCFCN RT-DF-CH-MORIARTY)
>

;-----------------------------------------------------------------------------
; "CH-HUDSON"
;-----------------------------------------------------------------------------

<OBJECT CH-HUDSON
   (LOC RM-ENTRY-HALL)
   (DESC "Mrs. Hudson")
   (FLAGS FL-NOARTC FL-ALIVE FL-PERSON FL-FEMALE FL-TRYTAKE FL-NOALL)
   (SYNONYM MRS HUDSON HOUSEKEEPER)
	(ADJECTIVE MRS)
   (SIZE 99)
   (CAPACITY 99)
	(ACTION RT-AC-CH-HUDSON)
   (DESCFCN RT-DF-CH-HUDSON)
>

;-----------------------------------------------------------------------------
; "CH-LESTRADE"
;-----------------------------------------------------------------------------

<OBJECT CH-LESTRADE
   (DESC "Lestrade")
   (FLAGS FL-NOARTC FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL)
   (SYNONYM LESTRADE COP)
   (ADJECTIVE INSPECTOR)
;  (ACTION RT-AC-CH-LESTRADE)
;  (DESCFCN RT-DF-CH-LESTRADE)
>

;-----------------------------------------------------------------------------
; "CH-DENKEEPER"
;-----------------------------------------------------------------------------

<OBJECT CH-DENKEEPER
	(LOC RM-BAR-OF-GOLD)
	(DESC "denkeeper")
	(FLAGS FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL FL-NODESC)
	(SYNONYM DENKEEPER FRED PROPRIETOR MAN BARTENDER)
	(SIZE 99)
	(CAPACITY 20)
	(ACTION RT-AC-CH-DENKEEPER)
	(DESCFCN RT-DF-CH-DENKEEPER)
>

;-----------------------------------------------------------------------------
; "CH-LIBRARIAN"
;-----------------------------------------------------------------------------

<OBJECT CH-LIBRARIAN
	(LOC RM-MANUSCRIPT-ROOM)
	(DESC "lonely librarian")
	(FLAGS FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL FL-NODESC)
	(SYNONYM LIBRARIAN MAN)
	(ADJECTIVE LONELY)
	(SIZE 99)
	(CAPACITY 99)
	(ACTION RT-AC-CH-LIBRARIAN)
	(DESCFCN RT-DF-CH-LIBRARIAN)
>

;-----------------------------------------------------------------------------
; "CH-BUTLER"
;-----------------------------------------------------------------------------

<OBJECT CH-BUTLER
	(LOC RM-DIOGENES-CLUB)
	(DESC "butler")
	(FLAGS FL-NODESC FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL)
	(SYNONYM BUTLER MAN)
	(SIZE 99)
	(CAPACITY 99)
	(ACTION RT-AC-CH-BUTLER)
	(DESCFCN RT-DF-CH-BUTLER)
>

;-----------------------------------------------------------------------------
; "CH-NANNIES"
;-----------------------------------------------------------------------------

<OBJECT CH-NANNIES
	(LOC RM-KENSINGTON-GARDENS)
	(DESC "nannies")
	(FLAGS FL-NODESC FL-PLURAL FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL)
	(SYNONYM NANNIES)
	(SIZE 99)
	(CAPACITY 99)
	(ACTION RT-AC-CH-NANNIES)
	(DESCFCN RT-DF-CH-NANNIES)
>

;-----------------------------------------------------------------------------
; "CH-QUEEN"
;-----------------------------------------------------------------------------

<OBJECT CH-QUEEN
	(LOC RM-BUCKINGHAM-PALACE)
	(DESC "Queen Victoria")
	(FLAGS FL-NOARTC FL-PERSON FL-ALIVE
						  FL-TRYTAKE FL-NOALL FL-FEMALE)
	(SYNONYM QUEEN VICTORIA)
	(ADJECTIVE QUEEN)
	(SIZE 99)
	(CAPACITY 99)
;	(ACTION RT-AC-CH-QUEEN)
;	(DESCFCN RT-DF-CH-QUEEN)
>

;-----------------------------------------------------------------------------
; "CH-HOUSEWIVES"
;-----------------------------------------------------------------------------

<OBJECT CH-HOUSEWIVES
	(LOC RM-COVENT-GARDEN)
	(DESC "women")
	(FLAGS FL-NODESC FL-PLURAL FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL)
	(SYNONYM HOUSEWIVES WIVES WOMEN PEOPLE CROWDS CROWD SHOPPERS)
	(SIZE 99)
	(CAPACITY 99)
	(ACTION RT-AC-CH-HOUSEWIVES)
	(DESCFCN RT-DF-CH-HOUSEWIVES)
>

;-----------------------------------------------------------------------------
; "CH-PALACE-GUARD"
;-----------------------------------------------------------------------------

<OBJECT CH-PALACE-GUARD
	(LOC RM-QUEENS-GARDENS)
	(DESC "Palace guard")
	(FLAGS FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL)
	(SYNONYM GUARD)
	(ADJECTIVE PALACE)
	(SIZE 99)
	(CAPACITY 20)
	(ACTION RT-AC-CH-PALACE-GUARD)
	(DESCFCN RT-DF-CH-PALACE-GUARD)
>

;-----------------------------------------------------------------------------
; "CH-URCHINS"
;-----------------------------------------------------------------------------

<OBJECT CH-URCHINS
	(LOC RM-THREADNEEDLE-ST)
	(DESC "urchins")
	(FLAGS FL-NODESC FL-PLURAL FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL)
	(SYNONYM URCHINS)
	(SIZE 99)
	(CAPACITY 99)
	(ACTION RT-AC-CH-URCHINS)
	(DESCFCN RT-DF-CH-URCHINS)
>

;-----------------------------------------------------------------------------
; "CH-MEMBERS"
;-----------------------------------------------------------------------------

<OBJECT CH-MEMBERS
	(LOC RM-DIOGENES-CLUB)
	(DESC "members")
	(FLAGS FL-NODESC FL-PLURAL FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL)
	(SYNONYM MEMBERS)
	(ADJECTIVE CLUB AGING)
	(SIZE 99)
	(CAPACITY 99)
	(ACTION RT-AC-CH-MEMBERS)
	(DESCFCN RT-DF-CH-MEMBERS)
>

;*****************************************************************************
; "end of file"
;*****************************************************************************

