;*****************************************************************************
; "game : SHERLOCK!"
; "file : PLACES1.ZIL"
; "auth :   $Author:   RAB  $"
; "date :     $Date:   25 Oct 1987 19:04:04  $"
; "rev  : $Revision:   1.49  $"
; "vers : 1.00"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "this file contains:"
; "  object definitions for all rooms"
;-----------------------------------------------------------------------------

;-----------------------------------------------------------------------------
; "RM-221B-BAKER-ST"
;-----------------------------------------------------------------------------

<OBJECT RM-221B-BAKER-ST
   (LOC ROOMS)
   (DESC "221-B Baker Street")
   (NORTH TO RM-YORK-PLACE)
   (SOUTH TO RM-ORCHARD-ST)
   (WEST  TO RM-ENTRY-HALL IF LG-BAKER-ST-DOOR IS OPEN)
   (IN    TO RM-ENTRY-HALL IF LG-BAKER-ST-DOOR IS OPEN)
   (FLAGS FL-LIGHTED FL-NOARTC)
	(AUX1 1)		;"Room number for cab table."
   (GLOBAL  LG-BAKER-ST-DOOR LG-CROWDS LG-HOLMES-STUDY-WINDOW
				LG-BAKER-ST LG-ENTRY-HALL LG-HOLMES-HOUSE LG-STREETLIGHT LG-WEST-WALL)
   (DESCFCN RT-DF-RM-221B-BAKER-ST)
>

;-----------------------------------------------------------------------------
; "RM-ENTRY-HALL"
;-----------------------------------------------------------------------------

<OBJECT RM-ENTRY-HALL
   (LOC ROOMS)
   (DESC "Entry hall")
	(NORTH PER RT-EX-PARLOUR-ENTRY)
   (EAST  TO RM-221B-BAKER-ST IF LG-BAKER-ST-DOOR IS OPEN)
   (UP    TO RM-VESTIBULE)
	(IN    PER RT-EX-PARLOUR-ENTRY)
   (OUT   TO RM-221B-BAKER-ST IF LG-BAKER-ST-DOOR IS OPEN)
   (FLAGS FL-INDOORS FL-LIGHTED FL-VOWEL)
   (GLOBAL  LG-BAKER-ST-DOOR LG-PARLOUR-DOOR LG-STAIRWAY
				LG-ENTRY-HALL LG-PARLOUR LG-BAKER-ST LG-HOLMES-HOUSE)
   (DESCFCN RT-DF-RM-ENTRY-HALL)
>

;-----------------------------------------------------------------------------
; "RM-PARLOUR"
;-----------------------------------------------------------------------------

<OBJECT RM-PARLOUR
	(LOC ROOMS)
	(DESC "Parlour")
   (SOUTH TO RM-ENTRY-HALL IF LG-PARLOUR-DOOR IS OPEN)
   (OUT   TO RM-ENTRY-HALL IF LG-PARLOUR-DOOR IS OPEN)
   (FLAGS FL-INDOORS FL-LIGHTED)
   (GLOBAL LG-PARLOUR-DOOR LG-PARLOUR LG-ENTRY-HALL LG-HOLMES-HOUSE)
   (DESCFCN RT-DF-RM-PARLOUR)
>

;-----------------------------------------------------------------------------
; "RM-VESTIBULE"
;-----------------------------------------------------------------------------

<OBJECT RM-VESTIBULE
   (LOC ROOMS)
   (DESC "Vestibule")
   (NORTH TO RM-HOLMES-STUDY IF LG-HOLMES-STUDY-DOOR IS OPEN)
   (IN	 TO RM-HOLMES-STUDY IF LG-HOLMES-STUDY-DOOR IS OPEN)
   (DOWN  TO RM-ENTRY-HALL)
   (FLAGS FL-INDOORS FL-LIGHTED)
   (GLOBAL LG-HOLMES-STUDY-DOOR LG-STAIRWAY LG-VESTIBULE LG-STUDY LG-HOLMES-HOUSE)
   (DESCFCN RT-DF-RM-VESTIBULE)
>

;-----------------------------------------------------------------------------
; "RM-HOLMES-STUDY"
;-----------------------------------------------------------------------------

<OBJECT RM-HOLMES-STUDY
   (LOC ROOMS)
   (DESC "Holmes's study")
   (NORTH SORRY "The fireplace is in the way.")
   (EAST	 SORRY "You would fly out the bow window.")
   (SOUTH TO RM-VESTIBULE IF LG-HOLMES-STUDY-DOOR IS OPEN)
   (IN	 TO RM-HOLMES-BEDROOM IF LG-HOLMES-BEDROOM-DOOR IS OPEN)
   (OUT	 TO RM-VESTIBULE IF LG-HOLMES-STUDY-DOOR IS OPEN)
   (WEST	 TO RM-HOLMES-BEDROOM IF LG-HOLMES-BEDROOM-DOOR IS OPEN)
   (FLAGS FL-INDOORS FL-LIGHTED FL-NOARTC)
   (GLOBAL  LG-HOLMES-STUDY-DOOR LG-HOLMES-BEDROOM-DOOR
				LG-HOLMES-STUDY-WINDOW LG-BEDROOM LG-STUDY LG-VESTIBULE LG-HOLMES-HOUSE)
	(AUX1 0)		; "Number of minutes out of study after waking Holmes."
   (DESCFCN RT-DF-RM-HOLMES-STUDY)
>

;-----------------------------------------------------------------------------
; "RM-HOLMES-BEDROOM"
;-----------------------------------------------------------------------------

<OBJECT RM-HOLMES-BEDROOM
   (LOC ROOMS)
   (DESC "Holmes's bedroom")
   (EAST	 TO RM-HOLMES-STUDY IF LG-HOLMES-BEDROOM-DOOR IS OPEN)
   (OUT	 TO RM-HOLMES-STUDY IF LG-HOLMES-BEDROOM-DOOR IS OPEN)
   (FLAGS FL-INDOORS FL-LIGHTED FL-NOARTC)
   (GLOBAL LG-HOLMES-BEDROOM-DOOR LG-BEDROOM LG-STUDY LG-HOLMES-HOUSE)
   (DESCFCN RT-DF-RM-HOLMES-BEDROOM)
>

;-----------------------------------------------------------------------------
; "RM-YORK-PLACE"
;-----------------------------------------------------------------------------

<OBJECT RM-YORK-PLACE
   (LOC ROOMS)
   (DESC "York Place")
   (NORTH PER RT-SURGE)
   (EAST	 TO RM-MARYLEBONE-RD)
   (SOUTH TO RM-221B-BAKER-ST)
   (WEST	 PER RT-SURGE)
	(AUX1 2)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-CROWDS LG-YORK-PLACE)
   (DESCFCN RT-DF-RM-YORK-PLACE)
>

;-----------------------------------------------------------------------------
; "RM-MARYLEBONE-RD"
;-----------------------------------------------------------------------------

<OBJECT RM-MARYLEBONE-RD
   (LOC ROOMS)
   (DESC "Marylebone Road")
   (NORTH PER RT-EX-RM-MATCH-SNIFFING-DOG)
   (EAST  TO RM-TOTTENHAM-COURT-RD)
   (WEST  TO RM-YORK-PLACE)
   (IN    PER RT-EX-RM-MATCH-SNIFFING-DOG)
	(AUX1 3)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-CROWDS LG-MARYLEBONE-RD LG-TUSSAUDS LG-NORTH-WALL)
   (ACTION RT-AC-RM-MARYLEBONE-RD)
   (DESCFCN RT-DF-RM-MARYLEBONE-RD)
>

;-----------------------------------------------------------------------------
; "RM-MADAME-TUSSAUDS"
;-----------------------------------------------------------------------------

<OBJECT RM-MADAME-TUSSAUDS
   (LOC ROOMS)
   (DESC "Madame Tussaud's")
   (SOUTH PER RT-EX-RM-EXIT-TUSSAUDS)
   (WEST  TO RM-CHAMBER-OF-HORRORS)
   (IN    TO RM-CHAMBER-OF-HORRORS)
   (OUT   PER RT-EX-RM-EXIT-TUSSAUDS)
   (FLAGS FL-INDOORS FL-LIGHTED FL-NOARTC)
   (GLOBAL LG-PLAQUES LG-WAX-STATUES LG-TUSSAUDS)
   (ACTION RT-AC-RM-MADAME-TUSSAUDS)
   (DESCFCN RT-DF-RM-MADAME-TUSSAUDS)
>

;-----------------------------------------------------------------------------
; "RM-CHAMBER-OF-HORRORS"
;-----------------------------------------------------------------------------

<OBJECT RM-CHAMBER-OF-HORRORS
   (LOC ROOMS)
   (DESC "Chamber of Horrors")
   (EAST  TO RM-MADAME-TUSSAUDS)
   (OUT   TO RM-MADAME-TUSSAUDS)
   (FLAGS FL-INDOORS)
   (GLOBAL LG-WAX-STATUES LG-CHAMBER-OF-HORRORS)
   (DESCFCN RT-DF-RM-CHAMBER-OF-HORRORS)
>

;-----------------------------------------------------------------------------
; "RM-TOTTENHAM-COURT-RD"
;-----------------------------------------------------------------------------

<OBJECT RM-TOTTENHAM-COURT-RD
   (LOC ROOMS)
   (DESC "Tottenham Court Road")
   (NORTH PER RT-SURGE)
   (EAST  PER RT-SURGE)
   (SOUTH TO RM-ST-GILES-CIRCUS)
   (WEST  TO RM-MARYLEBONE-RD)
	(AUX1 4)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-CROWDS LG-SHOPS LG-TOTTENHAM-COURT-RD)
   (DESCFCN RT-DF-RM-TOTTENHAM-COURT-RD)
>

;-----------------------------------------------------------------------------
; "RM-ST-GILES-CIRCUS"
;-----------------------------------------------------------------------------

<OBJECT RM-ST-GILES-CIRCUS
   (LOC ROOMS)
   (DESC "St Giles Circus")
   (NORTH TO RM-TOTTENHAM-COURT-RD)
   (EAST  TO RM-NEW-OXFORD-ST)
   (SOUTH TO RM-TRAFALGAR-SQUARE)
   (WEST  TO RM-OXFORD-ST)
   (NE    TO RM-GREAT-RUSSELL-ST)
	(AUX1 5)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-CROWDS LG-ST-GILES-CIRCUS)
   (DESCFCN RT-DF-RM-ST-GILES-CIRCUS)
>

;-----------------------------------------------------------------------------
; "RM-OXFORD-ST"
;-----------------------------------------------------------------------------

<OBJECT RM-OXFORD-ST
   (LOC ROOMS)
   (DESC "Oxford Street")
   (EAST  TO RM-ST-GILES-CIRCUS)
   (WEST  TO RM-ORCHARD-ST)
	(AUX1 6)		;"Room number for cab table."
   (FLAGS FL-NOARTC FL-VOWEL)
   (GLOBAL LG-SHOPS LG-CROWDS LG-OXFORD-ST)
   (DESCFCN RT-DF-RM-OXFORD-ST)
>

;-----------------------------------------------------------------------------
; "RM-ORCHARD-ST"
;-----------------------------------------------------------------------------

<OBJECT RM-ORCHARD-ST
   (LOC ROOMS)
   (DESC "Orchard Street")
   (NORTH TO RM-221B-BAKER-ST)
   (EAST  TO RM-OXFORD-ST)
   (SOUTH TO RM-AUDLEY-ST)
   (WEST  PER RT-SURGE)
	(AUX1 7)		;"Room number for cab table."
   (FLAGS FL-NOARTC FL-VOWEL)
   (GLOBAL LG-CROWDS LG-ORCHARD-ST)
   (DESCFCN RT-DF-RM-ORCHARD-ST)
>

;-----------------------------------------------------------------------------
; "RM-AUDLEY-ST"
;-----------------------------------------------------------------------------

<OBJECT RM-AUDLEY-ST
   (LOC ROOMS)
   (DESC "Audley Street")
   (NORTH TO RM-ORCHARD-ST)
   (SOUTH TO RM-HYDE-PARK-CORNER)
	(AUX1 8)		;"Room number for cab table."
   (FLAGS FL-NOARTC FL-VOWEL)
   (GLOBAL LG-CROWDS LG-AUDLEY-ST)
   (DESCFCN RT-DF-RM-AUDLEY-ST)
>

;-----------------------------------------------------------------------------
; "RM-HYDE-PARK-CORNER"
;-----------------------------------------------------------------------------

<OBJECT RM-HYDE-PARK-CORNER
   (LOC ROOMS)
   (DESC "Hyde Park Corner")
   (NORTH TO RM-AUDLEY-ST)
   (EAST  PER RT-SURGE)
   (SOUTH PER RT-SURGE)
   (WEST  PER RT-SURGE)
   (NE    PER RT-SURGE)
   (NW    TO RM-KENSINGTON-GARDENS)
   (SE    TO RM-GROSVENOR-PLACE)
   (SW    PER RT-SURGE)
	(AUX1 9)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-CROWDS LG-HYDE-PARK-CORNER)
   (DESCFCN RT-DF-RM-HYDE-PARK-CORNER)
>

;-----------------------------------------------------------------------------
; "RM-KENSINGTON-GARDENS"
;-----------------------------------------------------------------------------

<OBJECT RM-KENSINGTON-GARDENS
   (LOC ROOMS)
   (DESC "Kensington Gardens")
   (NORTH PER RT-SURGE)
   (EAST  PER RT-SURGE)
   (SOUTH PER RT-SURGE)
   (WEST  PER RT-SURGE)
   (NE    PER RT-SURGE)
   (NW    PER RT-SURGE)
   (SE    TO RM-HYDE-PARK-CORNER)
   (SW    PER RT-SURGE)
	(AUX1 10)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-CROWDS LG-KENSINGTON-GARDENS LG-HYDE-PARK-CORNER)
   (DESCFCN RT-DF-RM-KENSINGTON-GARDENS)
>

;-----------------------------------------------------------------------------
; "RM-TRAFALGAR-SQUARE"
;-----------------------------------------------------------------------------

<OBJECT RM-TRAFALGAR-SQUARE
   (LOC ROOMS)
   (DESC "Trafalgar Square")
   (NORTH TO RM-ST-GILES-CIRCUS)
   (EAST  PER RT-SURGE)
   (SOUTH TO RM-WHITEHALL)
   (WEST  TO RM-DIOGENES-CLUB)
	(IN    TO RM-DIOGENES-CLUB)
   (NE    TO RM-THE-STRAND)
   (SW    TO RM-THE-MALL)
   (UP    SORRY "You were thinking maybe you had wings?")
	(FLAGS FL-LIGHTED FL-NOARTC)
	(AUX1 11)		;"Room number for cab table."
   (GLOBAL LG-PLAQUES LG-CROWDS LG-PEDESTAL LG-TRAFALGAR-SQUARE LG-DIOGENES-CLUB LG-WEST-WALL)
   (DESCFCN RT-DF-RM-TRAFALGAR-SQUARE)
>

;-----------------------------------------------------------------------------
; "RM-DIOGENES-CLUB"
;-----------------------------------------------------------------------------

<OBJECT RM-DIOGENES-CLUB
   (LOC ROOMS)
   (DESC "Diogenes Club")
   (EAST  TO RM-TRAFALGAR-SQUARE)
	(OUT	 TO RM-TRAFALGAR-SQUARE)
   (FLAGS FL-INDOORS FL-LIGHTED)
	(GLOBAL LG-DIOGENES-CLUB LG-TRAFALGAR-SQUARE)
   (DESCFCN RT-DF-RM-DIOGENES-CLUB)
>

;-----------------------------------------------------------------------------
; "RM-GREAT-RUSSELL-ST"
;-----------------------------------------------------------------------------

<OBJECT RM-GREAT-RUSSELL-ST
   (LOC ROOMS)
   (DESC "Great Russell Street")
   (NORTH TO RM-BRITISH-MUSEUM IF LG-BRITISH-MUSEUM-DOOR IS OPEN)
   (EAST  PER RT-SURGE)
   (WEST  PER RT-SURGE)
   (SW    TO RM-ST-GILES-CIRCUS)
   (IN    TO RM-BRITISH-MUSEUM IF LG-BRITISH-MUSEUM-DOOR IS OPEN)
	(AUX1 12)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL  LG-BRITISH-MUSEUM-DOOR LG-PLAQUES LG-CROWDS LG-STAIRWAY LG-GREAT-RUSSELL-ST
				LG-BRITISH-MUSEUM LG-NORTH-WALL)
   (DESCFCN RT-DF-RM-GREAT-RUSSELL-ST)
>

;-----------------------------------------------------------------------------
; "RM-BRITISH-MUSEUM"
;-----------------------------------------------------------------------------

<OBJECT RM-BRITISH-MUSEUM
   (LOC ROOMS)
   (DESC "British Museum")
   (EAST  TO RM-MANUSCRIPT-ROOM)
   (SOUTH TO RM-GREAT-RUSSELL-ST IF LG-BRITISH-MUSEUM-DOOR IS OPEN)
   (IN    TO RM-MANUSCRIPT-ROOM)
   (OUT   TO RM-GREAT-RUSSELL-ST IF LG-BRITISH-MUSEUM-DOOR IS OPEN)
   (NORTH  PER RT-SURGE)
   (WEST   PER RT-SURGE)
   (FLAGS FL-INDOORS FL-LIGHTED)
   (GLOBAL LG-BRITISH-MUSEUM-DOOR LG-STAIRWAY LG-BRITISH-MUSEUM LG-GREAT-RUSSELL-ST)
   (DESCFCN RT-DF-RM-BRITISH-MUSEUM)
>

;-----------------------------------------------------------------------------
; "RM-MANUSCRIPT-ROOM"
;-----------------------------------------------------------------------------

<OBJECT RM-MANUSCRIPT-ROOM
   (LOC ROOMS)
   (DESC "Manuscript Room")
   (WEST  TO RM-BRITISH-MUSEUM)
   (OUT  TO RM-BRITISH-MUSEUM)
   (FLAGS FL-INDOORS FL-LIGHTED)
	(GLOBAL LG-PLAQUES)
   (ACTION RT-AC-RM-MANUSCRIPT-ROOM)
   (DESCFCN RT-DF-RM-MANUSCRIPT-ROOM)
>

;-----------------------------------------------------------------------------
; "RM-GROSVENOR-PLACE"
;-----------------------------------------------------------------------------

<OBJECT RM-GROSVENOR-PLACE
   (LOC ROOMS)
   (DESC "Grosvenor Place")
   (NW    TO RM-HYDE-PARK-CORNER)
   (SE    TO RM-VICTORIA-SQUARE)
	(AUX1 13)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-CROWDS LG-GROSVENOR-PLACE)
   (DESCFCN RT-DF-RM-GROSVENOR-PLACE)
>

;-----------------------------------------------------------------------------
; "RM-VICTORIA-SQUARE"
;-----------------------------------------------------------------------------

<OBJECT RM-VICTORIA-SQUARE
   (LOC ROOMS)
   (DESC "Victoria Square")
   (EAST  TO RM-VICTORIA-STREET)
   (NE    TO RM-BUCKINGHAM-PALACE-RD)
   (NW    TO RM-GROSVENOR-PLACE)
	(AUX1 14)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-CROWDS LG-SHOPS LG-VICTORIA-SQUARE)
   (DESCFCN RT-DF-RM-VICTORIA-SQUARE)
>

;-----------------------------------------------------------------------------
; "RM-VICTORIA-STREET"
;-----------------------------------------------------------------------------

<OBJECT RM-VICTORIA-STREET
   (LOC ROOMS)
   (DESC "Victoria Street")
   (EAST  TO RM-BROAD-SANCTUARY)
   (WEST  TO RM-VICTORIA-SQUARE)
	(AUX1 15)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-CROWDS LG-SHOPS LG-PLAQUES LG-VICTORIA-ST)
   (ACTION RT-AC-RM-VICTORIA-STREET)
   (DESCFCN RT-DF-RM-VICTORIA-STREET)
>

;-----------------------------------------------------------------------------
; "RM-BROAD-SANCTUARY"
;-----------------------------------------------------------------------------

<OBJECT RM-BROAD-SANCTUARY
   (LOC ROOMS)
   (DESC "Broad Sanctuary")
   (EAST  TO RM-NAVE IF LG-WESTMINSTER-DOOR IS OPEN)
   (WEST  TO RM-VICTORIA-STREET)
   (NE    TO RM-PARLIAMENT-SQUARE)
   (IN    TO RM-NAVE IF LG-WESTMINSTER-DOOR IS OPEN)
	(AUX1 16)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-WESTMINSTER-DOOR LG-PLAQUES LG-CROWDS LG-ABBEY LG-BROAD-SANCTUARY LG-EAST-WALL)
   (DESCFCN RT-DF-RM-BROAD-SANCTUARY)
>

;-----------------------------------------------------------------------------
; "RM-PARLIAMENT-SQUARE"
;-----------------------------------------------------------------------------

<OBJECT RM-PARLIAMENT-SQUARE
   (LOC ROOMS)
   (DESC "Parliament Square")
   (NORTH TO RM-WHITEHALL)
   (EAST  PER RT-SURGE)
   (WEST  TO RM-BIRDCAGE-WALK)
   (SE    TO RM-PARLIAMENT)
   (SW    TO RM-BROAD-SANCTUARY)
   (IN    TO RM-PARLIAMENT)
	(AUX1 17)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-CROWDS LG-PARLIAMENT-SQUARE LG-HOUSES-OF-PARLIAMENT)
   (DESCFCN RT-DF-RM-PARLIAMENT-SQUARE)
>

;-----------------------------------------------------------------------------
; "RM-PARLIAMENT"
;-----------------------------------------------------------------------------

<OBJECT RM-PARLIAMENT
   (LOC ROOMS)
   (DESC "Houses of Parliament")
	(IN    PER RT-SURGE)
   (NW    TO RM-PARLIAMENT-SQUARE)
   (UP    TO RM-CLOCK-TOWER)
   (OUT   TO RM-PARLIAMENT-SQUARE)
   (FLAGS FL-INDOORS FL-LIGHTED)
	(GLOBAL LG-STAIRWAY LG-HOUSES-OF-PARLIAMENT LG-PARLIAMENT-SQUARE)
   (DESCFCN RT-DF-RM-PARLIAMENT)
>

;-----------------------------------------------------------------------------
; "RM-CLOCK-TOWER"
;-----------------------------------------------------------------------------

<OBJECT RM-CLOCK-TOWER
   (LOC ROOMS)
   (DESC "Clock Tower")
   (DOWN  TO RM-PARLIAMENT)
   (FLAGS FL-INDOORS FL-LIGHTED)
	(GLOBAL LG-STAIRWAY)
	(LOOKDN TH-SHAFT)
   (ACTION RT-AC-RM-CLOCK-TOWER)
   (DESCFCN RT-DF-RM-CLOCK-TOWER)
>

;-----------------------------------------------------------------------------
; "RM-BUCKINGHAM-PALACE-RD"
;-----------------------------------------------------------------------------

<OBJECT RM-BUCKINGHAM-PALACE-RD
   (LOC ROOMS)
   (DESC "Buckingham Palace Road")
   (NE    TO RM-QUEENS-GARDENS)
   (SW    TO RM-VICTORIA-SQUARE)
	(AUX1 18)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-CROWDS LG-BUCKINGHAM-PALACE-ROAD)
   (DESCFCN RT-DF-RM-BUCKINGHAM-PALACE-RD)
>

;-----------------------------------------------------------------------------
; "RM-QUEENS-GARDENS"
;-----------------------------------------------------------------------------

<OBJECT RM-QUEENS-GARDENS
   (LOC ROOMS)
   (DESC "Queens Gardens")
   (WEST  PER RT-EX-RM-ENTER-BUCKINGHAM-PALACE)
   (NE    TO RM-THE-MALL)
   (SE    TO RM-BIRDCAGE-WALK)
   (SW    TO RM-BUCKINGHAM-PALACE-RD)
   (IN    PER RT-EX-RM-ENTER-BUCKINGHAM-PALACE)
	(AUX1 19)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-CROWDS LG-QUEENS-GARDENS LG-BUCKINGHAM-PALACE)
   (DESCFCN RT-DF-RM-QUEENS-GARDENS)
>

;-----------------------------------------------------------------------------
; "RM-BUCKINGHAM-PALACE"
;-----------------------------------------------------------------------------

<OBJECT RM-BUCKINGHAM-PALACE
   (LOC ROOMS)
   (DESC "Buckingham Palace")
   (EAST  TO RM-QUEENS-GARDENS)
   (FLAGS FL-INDOORS FL-LIGHTED FL-NOARTC)
	(GLOBAL LG-QUEENS-GARDENS LG-BUCKINGHAM-PALACE)
   (DESCFCN RT-DF-RM-BUCKINGHAM-PALACE)
>

;-----------------------------------------------------------------------------
; "RM-BIRDCAGE-WALK"
;-----------------------------------------------------------------------------

<OBJECT RM-BIRDCAGE-WALK
   (LOC ROOMS)
   (DESC "Birdcage Walk")
   (EAST  TO RM-PARLIAMENT-SQUARE)
   (NW    TO RM-QUEENS-GARDENS)
	(AUX1 20)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-CROWDS LG-BIRDCAGE-WALK)
   (DESCFCN RT-DF-RM-BIRDCAGE-WALK)
>

;-----------------------------------------------------------------------------
; "RM-THE-MALL"
;-----------------------------------------------------------------------------

<OBJECT RM-THE-MALL
   (LOC ROOMS)
   (DESC "The Mall")
   (NE    TO RM-TRAFALGAR-SQUARE)
   (SW    TO RM-QUEENS-GARDENS)
	(AUX1 21)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-CROWDS LG-THE-MALL)
   (DESCFCN RT-DF-RM-THE-MALL)
>

;-----------------------------------------------------------------------------
; "RM-WHITEHALL"
;-----------------------------------------------------------------------------

<OBJECT RM-WHITEHALL
   (LOC ROOMS)
   (DESC "Whitehall")
	(EAST  TO RM-SCOTLAND-YARD)
	(IN    TO RM-SCOTLAND-YARD)
   (NORTH TO RM-TRAFALGAR-SQUARE)
   (SOUTH TO RM-PARLIAMENT-SQUARE)
	(AUX1 22)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-CROWDS LG-WHITEHALL LG-SCOTLAND-YARD LG-EAST-WALL)
   (DESCFCN RT-DF-RM-WHITEHALL)
>

;-----------------------------------------------------------------------------
; "RM-SCOTLAND-YARD"
;-----------------------------------------------------------------------------

<OBJECT RM-SCOTLAND-YARD
   (LOC ROOMS)
   (DESC "Scotland Yard")
   (WEST  TO RM-WHITEHALL)
   (DOWN  TO RM-THE-BLACK-MUSEUM)
   (OUT   TO RM-WHITEHALL)
   (FLAGS FL-INDOORS FL-LIGHTED FL-NOARTC)
	(GLOBAL LG-STAIRWAY LG-WHITEHALL LG-SCOTLAND-YARD)
   (DESCFCN RT-DF-RM-SCOTLAND-YARD)
>

;-----------------------------------------------------------------------------
; "RM-THE-BLACK-MUSEUM"
;-----------------------------------------------------------------------------

<OBJECT RM-THE-BLACK-MUSEUM
   (LOC ROOMS)
   (DESC "The Black Museum")
   (UP    TO RM-SCOTLAND-YARD)
   (FLAGS FL-INDOORS FL-NOARTC)
   (GLOBAL LG-PLAQUES LG-STAIRWAY LG-BLACK-MUSEUM LG-SCOTLAND-YARD)
   (DESCFCN RT-DF-RM-THE-BLACK-MUSEUM)
>

;-----------------------------------------------------------------------------
; "RM-NEW-OXFORD-ST"
;-----------------------------------------------------------------------------

<OBJECT RM-NEW-OXFORD-ST
   (LOC ROOMS)
   (DESC "New Oxford Street")
   (EAST  TO RM-CHEAPSIDE)
   (SOUTH TO RM-COVENT-GARDEN)
   (WEST  TO RM-ST-GILES-CIRCUS)
	(AUX1 23)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-CROWDS LG-NEW-OXFORD-ST)
   (DESCFCN RT-DF-RM-NEW-OXFORD-ST)
>

;-----------------------------------------------------------------------------
; "RM-COVENT-GARDEN"
;-----------------------------------------------------------------------------

<OBJECT RM-COVENT-GARDEN
   (LOC ROOMS)
   (DESC "Covent Garden")
   (NORTH TO RM-NEW-OXFORD-ST)
   (SOUTH TO RM-THE-STRAND)
   (EAST PER RT-SURGE)
   (WEST PER RT-SURGE)
	(AUX1 24)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-COVENT-GARDEN)
   (DESCFCN RT-DF-RM-COVENT-GARDEN)
>

;-----------------------------------------------------------------------------
; "RM-THE-STRAND"
;-----------------------------------------------------------------------------

<OBJECT RM-THE-STRAND
   (LOC ROOMS)
   (DESC "The Strand")
   (NORTH TO RM-COVENT-GARDEN)
   (EAST  TO RM-FLEET-STREET)
   (WEST  PER RT-SURGE)
   (SW    TO RM-TRAFALGAR-SQUARE)
	(AUX1 25)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-CROWDS LG-STRAND)
   (DESCFCN RT-DF-RM-THE-STRAND)
>

;-----------------------------------------------------------------------------
; "RM-FLEET-STREET"
;-----------------------------------------------------------------------------

<OBJECT RM-FLEET-STREET
   (LOC ROOMS)
   (DESC "Fleet Street")
   (EAST  TO RM-BLIND-ALLEY)
   (SOUTH TO RM-THE-EMBANKMENT)
   (WEST  TO RM-THE-STRAND)
	(AUX1 26)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-CROWDS LG-FLEET-ST)
   (DESCFCN RT-DF-RM-FLEET-STREET)
>

;-----------------------------------------------------------------------------
; "RM-THE-EMBANKMENT"
;-----------------------------------------------------------------------------

<OBJECT RM-THE-EMBANKMENT
   (LOC ROOMS)
   (DESC "The Embankment")
   (NORTH PER RT-EX-LEAVE-EMBANKMENT)
   (EAST  PER RT-EX-LEAVE-EMBANKMENT)
   (SOUTH PER RT-EX-RM-LAUNCH-BOAT)
	(AUX1 27)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-WATER LG-UPSTREAM LG-DOWNSTREAM LG-CROWDS LG-THE-EMBANKMENT LG-BOATS)
   (DESCFCN RT-DF-RM-THE-EMBANKMENT)
>

;-----------------------------------------------------------------------------
; "RM-THAMES-ONE"
;-----------------------------------------------------------------------------

<OBJECT RM-THAMES-ONE
   (LOC ROOMS)
   (DESC "On the Thames")
   (NORTH PER RT-EX-RM-LAND-BOAT)
   (EAST  PER RT-EX-RM-STEER-BOAT)
   (SOUTH PER RT-EX-RM-STEER-BOAT)
   (WEST  PER RT-EX-RM-STEER-BOAT)
   (FLAGS FL-NOARTC FL-VOWEL)
   (GLOBAL LG-WATER LG-UPSTREAM LG-DOWNSTREAM LG-THE-EMBANKMENT LG-BOATS)
   (ACTION RT-AC-RM-THAMES-ONE)
   (DESCFCN RT-DF-RM-THAMES-ONE)
>

;-----------------------------------------------------------------------------
; "RM-THAMES-TWO"
;-----------------------------------------------------------------------------

<OBJECT RM-THAMES-TWO
   (LOC ROOMS)
   (DESC "On the Thames")
	(NORTH PER RT-EX-RM-LAND-BOAT)
   (EAST  PER RT-EX-RM-STEER-BOAT)
   (SOUTH PER RT-EX-RM-STEER-BOAT)
   (WEST  PER RT-EX-RM-STEER-BOAT)
   (FLAGS FL-NOARTC FL-VOWEL)
   (GLOBAL LG-WATER LG-LONDON-BRIDGE LG-UPSTREAM LG-DOWNSTREAM LG-BOATS)
   (ACTION RT-AC-RM-THAMES-TWO)
   (DESCFCN RT-DF-RM-THAMES-TWO)
>

;-----------------------------------------------------------------------------
; "RM-THAMES-THREE"
;-----------------------------------------------------------------------------

<OBJECT RM-THAMES-THREE
   (LOC ROOMS)
   (DESC "On the Thames")
	(NORTH PER RT-EX-RM-LAND-BOAT)
   (EAST  PER RT-EX-RM-STEER-BOAT)
   (SOUTH PER RT-EX-RM-STEER-BOAT)
   (WEST  PER RT-EX-RM-STEER-BOAT)
   (FLAGS FL-NOARTC FL-VOWEL)
   (GLOBAL LG-WATER LG-LONDON-BRIDGE LG-UPSTREAM LG-DOWNSTREAM LG-BOATS)
   (ACTION RT-AC-RM-THAMES-THREE)
   (DESCFCN RT-DF-RM-THAMES-THREE)
>

;-----------------------------------------------------------------------------
; "RM-THAMES-FOUR"
;-----------------------------------------------------------------------------

<OBJECT RM-THAMES-FOUR
   (LOC ROOMS)
   (DESC "On the Thames")
	(NORTH PER RT-EX-RM-LAND-BOAT)
   (EAST  PER RT-EX-RM-STEER-BOAT)
   (SOUTH PER RT-EX-RM-STEER-BOAT)
   (WEST  PER RT-EX-RM-STEER-BOAT)
   (FLAGS FL-NOARTC FL-VOWEL)
   (GLOBAL LG-WATER LG-LONDON-BRIDGE LG-UPSTREAM LG-DOWNSTREAM LG-BOATS)
   (ACTION RT-AC-RM-THAMES-FOUR)
   (DESCFCN RT-DF-RM-THAMES-FOUR)
>

;-----------------------------------------------------------------------------
; "RM-THAMES-FIVE"
;-----------------------------------------------------------------------------

<OBJECT RM-THAMES-FIVE
   (LOC ROOMS)
   (DESC "On the Thames")
	(NORTH PER RT-EX-RM-LAND-BOAT)
   (EAST  PER RT-EX-RM-STEER-BOAT)
   (SOUTH PER RT-EX-RM-STEER-BOAT)
   (WEST  PER RT-EX-RM-STEER-BOAT)
   (FLAGS FL-NOARTC FL-VOWEL)
   (GLOBAL LG-WATER LG-UPSTREAM LG-DOWNSTREAM LG-BOATS)
   (ACTION RT-AC-RM-THAMES-FIVE)
   (DESCFCN RT-DF-RM-THAMES-FIVE)
>

;-----------------------------------------------------------------------------
; "RM-UPPER-THAMES-ST"
;-----------------------------------------------------------------------------

<OBJECT RM-UPPER-THAMES-ST
   (LOC ROOMS)
   (DESC "Upper Thames Street")
   (EAST  TO RM-LOWER-THAMES-ST)
   (WEST  TO RM-THE-EMBANKMENT)
	(AUX1 28)		;"Room number for cab table."
   (FLAGS FL-NOARTC FL-VOWEL)
   (GLOBAL LG-CROWDS LG-UPPER-THAMES-ST)
   (DESCFCN RT-DF-RM-UPPER-THAMES-ST)
>

;-----------------------------------------------------------------------------
; "RM-BLIND-ALLEY"
;-----------------------------------------------------------------------------

<OBJECT RM-BLIND-ALLEY
   (LOC ROOMS)
   (DESC "Blind Alley")
   (EAST  TO RM-SIGN-OF-RED-HERRING)
   (WEST  TO RM-FLEET-STREET)
   (IN    TO RM-SIGN-OF-RED-HERRING)
	(AUX1 29)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL  LG-CROWDS LG-BLIND-ALLEY LG-THE-SIGN-OF-THE-RED-HERRING
				LG-PLAQUES LG-EAST-WALL)
   (DESCFCN RT-DF-RM-BLIND-ALLEY)
>

;-----------------------------------------------------------------------------
; "RM-SIGN-OF-RED-HERRING"
;-----------------------------------------------------------------------------

<OBJECT RM-SIGN-OF-RED-HERRING
   (LOC ROOMS)
   (DESC "The Sign of the Red Herring")
   (WEST  TO RM-BLIND-ALLEY)
   (OUT   TO RM-BLIND-ALLEY)
   (FLAGS FL-INDOORS FL-LIGHTED FL-NOARTC)
	(GLOBAL LG-THE-SIGN-OF-THE-RED-HERRING LG-BLIND-ALLEY)
   (DESCFCN RT-DF-RM-SIGN-OF-RED-HERRING)
>

;-----------------------------------------------------------------------------
; "RM-PINCHIN-LANE"
;-----------------------------------------------------------------------------

<OBJECT RM-PINCHIN-LANE
   (LOC ROOMS)
   (DESC "Pinchin Lane")
   (NORTH TO RM-CHEAPSIDE)
   (WEST  TO RM-SHERMANS-HOUSE)
   (IN    TO RM-SHERMANS-HOUSE)
	(AUX1 30)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-CROWDS LG-PINCHIN-LANE LG-SHERMANS-HOUSE LG-WEST-WALL)
   (DESCFCN RT-DF-RM-PINCHIN-LANE)
>

;-----------------------------------------------------------------------------
; "RM-SHERMANS-HOUSE"
;-----------------------------------------------------------------------------

<OBJECT RM-SHERMANS-HOUSE
   (LOC ROOMS)
   (DESC "Sherman's House")
   (EAST  TO RM-PINCHIN-LANE)
   (OUT   TO RM-PINCHIN-LANE)
   (FLAGS FL-INDOORS FL-LIGHTED FL-ASLEEP FL-NOARTC)
	(GLOBAL LG-SHERMANS-HOUSE LG-PINCHIN-LANE)
   (ACTION RT-AC-RM-SHERMANS-HOUSE)
   (DESCFCN RT-DF-RM-SHERMANS-HOUSE)
>

;-----------------------------------------------------------------------------
; "RM-CHEAPSIDE"
;-----------------------------------------------------------------------------

<OBJECT RM-CHEAPSIDE
   (LOC ROOMS)
   (DESC "Cheapside")
   (EAST  TO RM-THREADNEEDLE-ST)
   (SOUTH TO RM-PINCHIN-LANE)
   (WEST  TO RM-NEW-OXFORD-ST)
	(AUX1 31)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-CROWDS LG-CHEAPSIDE)
   (DESCFCN RT-DF-RM-CHEAPSIDE)
>

;-----------------------------------------------------------------------------
; "RM-THREADNEEDLE-ST"
;-----------------------------------------------------------------------------

<OBJECT RM-THREADNEEDLE-ST
   (LOC ROOMS)
   (DESC "Threadneedle Street")
   (NORTH PER RT-EX-ENTER-BANK-OF-ENGLAND)
   (IN    PER RT-EX-ENTER-BANK-OF-ENGLAND)
   (WEST  TO RM-CHEAPSIDE)
   (SE    TO RM-KING-WILLIAM-ST)
	(AUX1 32)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
	(GLOBAL LG-PLAQUES LG-CROWDS LG-THREADNEEDLE-ST LG-BANK LG-NORTH-WALL)
   (ACTION RT-AC-RM-THREADNEEDLE-ST)
   (DESCFCN RT-DF-RM-THREADNEEDLE-ST)
>

;-----------------------------------------------------------------------------
; "RM-BANK-OF-ENGLAND"
;-----------------------------------------------------------------------------

<OBJECT RM-BANK-OF-ENGLAND
   (LOC ROOMS)
   (DESC "Bank of England")
   (SOUTH PER RT-EX-RM-EXIT-BANK-OF-ENGLAND)
   (OUT   PER RT-EX-RM-EXIT-BANK-OF-ENGLAND)
   (WEST  TO RM-BANK-VAULT IF LG-BANK-VAULT-DOOR IS OPEN)
   (IN    TO RM-BANK-VAULT IF LG-BANK-VAULT-DOOR IS OPEN)
   (FLAGS FL-INDOORS FL-LIGHTED)
   (GLOBAL LG-BANK-VAULT-DOOR LG-BANK LG-THREADNEEDLE-ST LG-VAULT)
   (DESCFCN RT-DF-RM-BANK-OF-ENGLAND)
>

;-----------------------------------------------------------------------------
; "RM-BANK-VAULT"
;-----------------------------------------------------------------------------

<OBJECT RM-BANK-VAULT
   (LOC ROOMS)
   (DESC "Bank Vault")
   (EAST  TO RM-BANK-OF-ENGLAND IF LG-BANK-VAULT-DOOR IS OPEN)
   (OUT   TO RM-BANK-OF-ENGLAND IF LG-BANK-VAULT-DOOR IS OPEN)
   (FLAGS FL-INDOORS FL-LIGHTED)
   (GLOBAL LG-BANK-VAULT-DOOR LG-BANK LG-VAULT)
   (DESCFCN RT-DF-RM-BANK-VAULT)
>

;-----------------------------------------------------------------------------
; "RM-KING-WILLIAM-ST"
;-----------------------------------------------------------------------------

<OBJECT RM-KING-WILLIAM-ST
   (LOC ROOMS)
   (DESC "King William Street")
   (NW    TO RM-THREADNEEDLE-ST)
   (SE    TO RM-MONUMENT)
	(AUX1 33)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-CROWDS LG-KING-WILLIAM-ST)
   (DESCFCN RT-DF-RM-KING-WILLIAM-ST)
>

;-----------------------------------------------------------------------------
; "RM-MONUMENT"
;-----------------------------------------------------------------------------

<OBJECT RM-MONUMENT
   (LOC ROOMS)
   (DESC "The Monument")
;  (EAST  TO RM-TOWER-STREET)
   (SOUTH TO RM-LOWER-THAMES-ST)
   (NW    TO RM-KING-WILLIAM-ST)
	(AUX1 34)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-PLAQUES LG-CROWDS LG-MONUMENT LG-NORTH-WALL) 
   (DESCFCN RT-DF-RM-MONUMENT)
>

;-----------------------------------------------------------------------------
; "RM-LOWER-THAMES-ST"
;-----------------------------------------------------------------------------

<OBJECT RM-LOWER-THAMES-ST
   (LOC ROOMS)
   (DESC "Lower Thames Street")
   (NORTH TO RM-MONUMENT)
   (EAST  TO RM-TOWER-ENTRANCE)
   (SOUTH TO RM-LONDON-BRIDGE)
   (WEST  TO RM-UPPER-THAMES-ST)
   (DOWN  TO RM-SWAN-LANE)
	(AUX1 35)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-CROWDS LG-STAIRWAY LG-LOWER-THAMES-ST)
   (DESCFCN RT-DF-RM-LOWER-THAMES-ST)
>

;-----------------------------------------------------------------------------
; "RM-LONDON-BRIDGE"
;-----------------------------------------------------------------------------

<OBJECT RM-LONDON-BRIDGE
   (LOC ROOMS)
   (DESC "London Bridge")
   (NORTH TO RM-LOWER-THAMES-ST)
   (SOUTH PER RT-SURGE)
	(AUX1 36)		;"Room number for cab table."
   (FLAGS FL-NOARTC)
   (GLOBAL LG-WATER LG-LONDON-BRIDGE LG-CROWDS LG-BOATS)
   (ACTION RT-AC-RM-LONDON-BRIDGE)
   (DESCFCN RT-DF-RM-LONDON-BRIDGE)
>

;-----------------------------------------------------------------------------
; "RM-TOWER-STREET"
;-----------------------------------------------------------------------------

;<OBJECT RM-TOWER-STREET
   (LOC ROOMS)
   (DESC "Tower Street")
   (WEST  TO RM-MONUMENT)
   (SE    TO RM-TOWER-ENTRANCE)
   (FLAGS FL-NOARTC)
   (GLOBAL LG-CROWDS)
   (ACTION RT-AC-RM-TOWER-STREET)
   (DESCFCN RT-DF-RM-TOWER-STREET)
>

;-----------------------------------------------------------------------------
; "RM-TOWER-ENTRANCE"
;-----------------------------------------------------------------------------

<OBJECT RM-TOWER-ENTRANCE
   (LOC ROOMS)
   (DESC "Tower of London entrance")
   (EAST  TO RM-DRAWBRIDGE)
   (WEST  TO RM-LOWER-THAMES-ST)
;  (NW    TO RM-TOWER-STREET)
	(AUX1 37)		;"Room number for cab table."
   (GLOBAL LG-PLAQUES LG-TOWER LG-TOWER-ENTRANCE)
   (DESCFCN RT-DF-RM-TOWER-ENTRANCE)
>

;-----------------------------------------------------------------------------
; "RM-SWAN-LANE"
;-----------------------------------------------------------------------------

<OBJECT RM-SWAN-LANE
   (LOC ROOMS)
   (DESC "Swan Lane")
   (WEST  TO RM-BAR-OF-GOLD IF LG-BAR-OF-GOLD-DOOR IS OPEN)
   (UP    TO RM-LOWER-THAMES-ST)
   (IN    TO RM-BAR-OF-GOLD IF LG-BAR-OF-GOLD-DOOR IS OPEN)
   (FLAGS FL-NOARTC)
   (GLOBAL  LG-BAR-OF-GOLD-DOOR LG-PLAQUES LG-STAIRWAY LG-WATER LG-UPSTREAM LG-DOWNSTREAM
				LG-SWAN-LANE LG-BAR-OF-GOLD LG-WEST-WALL LG-BOATS)
   (ACTION RT-AC-RM-SWAN-LANE)
   (DESCFCN RT-DF-RM-SWAN-LANE)
>

;-----------------------------------------------------------------------------
; "RM-BAR-OF-GOLD"
;-----------------------------------------------------------------------------

<OBJECT RM-BAR-OF-GOLD
   (LOC ROOMS)
   (DESC "Bar of Gold")
   (EAST  TO RM-SWAN-LANE IF LG-BAR-OF-GOLD-DOOR IS OPEN)
   (OUT   TO RM-SWAN-LANE IF LG-BAR-OF-GOLD-DOOR IS OPEN)
   (FLAGS FL-INDOORS FL-LIGHTED)
   (GLOBAL LG-BAR-OF-GOLD-DOOR LG-BAR-OF-GOLD LG-SWAN-LANE)
   (ACTION RT-AC-RM-BAR-OF-GOLD)
   (DESCFCN RT-DF-RM-BAR-OF-GOLD)
>

;-----------------------------------------------------------------------------
; "RM-LAIR"
;-----------------------------------------------------------------------------

<OBJECT RM-LAIR
   (LOC ROOMS)
   (DESC "Lair")
   (NORTH TO RM-LONDON-BRIDGE IF LG-LAIR-DOOR IS OPEN)
   (OUT   TO RM-LONDON-BRIDGE IF LG-LAIR-DOOR IS OPEN)
   (FLAGS FL-INDOORS FL-LIGHTED)
	(GLOBAL LG-LAIR LG-LAIR-DOOR)
   (ACTION RT-AC-RM-LAIR)
   (DESCFCN RT-DF-RM-LAIR)
>

;-----------------------------------------------------------------------------
; "RM-NAVE"
;-----------------------------------------------------------------------------

<OBJECT RM-NAVE
   (LOC ROOMS)
   (DESC "Nave")
   (EAST  TO RM-SANCTUARY)
   (SOUTH TO RM-SOUTH-AISLE)
   (WEST  TO RM-BROAD-SANCTUARY IF LG-WESTMINSTER-DOOR IS OPEN)
   (NE    TO RM-NORTH-TRANSEPT)
   (SE    TO RM-SOUTH-TRANSEPT)
   (OUT   TO RM-BROAD-SANCTUARY IF LG-WESTMINSTER-DOOR IS OPEN)
   (FLAGS FL-INDOORS FL-LIGHTED)
   (GLOBAL LG-WESTMINSTER-DOOR LG-TOMBS LG-ABBEY LG-MARBLE LG-COLUMNS)
   (ACTION RT-AC-RM-NAVE)
   (DESCFCN RT-DF-RM-NAVE)
>

;-----------------------------------------------------------------------------
; "RM-SOUTH-AISLE"
;-----------------------------------------------------------------------------

<OBJECT RM-SOUTH-AISLE
   (LOC ROOMS)
   (DESC "South Aisle")
   (EAST  TO RM-SOUTH-TRANSEPT)
   (NORTH TO RM-NAVE)
   (SOUTH TO RM-JERICHO-PARLOUR IF LG-JERICHO-PARLOUR-DOOR IS OPEN)
   (IN    TO RM-JERICHO-PARLOUR IF LG-JERICHO-PARLOUR-DOOR IS OPEN)
   (SE    TO RM-NORTH-CLOISTER)
   (FLAGS FL-INDOORS FL-LIGHTED)
   (GLOBAL LG-JERICHO-PARLOUR-DOOR LG-TOMBS LG-ABBEY LG-COLUMNS)
   (DESCFCN RT-DF-RM-SOUTH-AISLE)
>

;-----------------------------------------------------------------------------
; "RM-JERICHO-PARLOUR"
;-----------------------------------------------------------------------------

<OBJECT RM-JERICHO-PARLOUR
   (LOC ROOMS)
   (DESC "Jericho Parlour")
   (NORTH TO RM-SOUTH-AISLE IF LG-JERICHO-PARLOUR-DOOR IS OPEN)
   (OUT   TO RM-SOUTH-AISLE IF LG-JERICHO-PARLOUR-DOOR IS OPEN)
   (WEST  TO RM-JERUSALEM-CHAMBER)
   (IN    TO RM-JERUSALEM-CHAMBER)
   (FLAGS FL-INDOORS FL-LIGHTED)
   (GLOBAL LG-JERICHO-PARLOUR-DOOR LG-ABBEY LG-JERUSALEM-CHAMBER)
   (DESCFCN RT-DF-RM-JERICHO-PARLOUR)
>

;-----------------------------------------------------------------------------
; "RM-JERUSALEM-CHAMBER"
;-----------------------------------------------------------------------------

<OBJECT RM-JERUSALEM-CHAMBER
   (LOC ROOMS)
   (DESC "Jerusalem Chamber")
   (EAST  TO RM-JERICHO-PARLOUR)
   (OUT   TO RM-JERICHO-PARLOUR)
   (FLAGS FL-INDOORS FL-LIGHTED)
	(GLOBAL LG-PLAQUES LG-ABBEY LG-JERUSALEM-CHAMBER)
   (DESCFCN RT-DF-RM-JERUSALEM-CHAMBER)
>

;-----------------------------------------------------------------------------
; "RM-NORTH-CLOISTER"
;-----------------------------------------------------------------------------

<OBJECT RM-NORTH-CLOISTER
   (LOC ROOMS)
   (DESC "North Cloister")
   (NW    TO RM-SOUTH-AISLE)
   (FLAGS FL-INDOORS FL-LIGHTED)
	(GLOBAL LG-ABBEY)
   (DESCFCN RT-DF-RM-NORTH-CLOISTER)
>

;-----------------------------------------------------------------------------
; "RM-SOUTH-TRANSEPT"
;-----------------------------------------------------------------------------

<OBJECT RM-SOUTH-TRANSEPT
   (LOC ROOMS)
   (DESC "South Transept")
   (EAST  TO RM-POETS-CORNER)
   (WEST  TO RM-SOUTH-AISLE)
   (NW    TO RM-NAVE)
   (FLAGS FL-INDOORS FL-LIGHTED)
	(GLOBAL LG-WINDOW LG-TOMBS LG-ABBEY LG-SHAFT-OF-LIGHT LG-COLUMNS)
   (DESCFCN RT-DF-RM-SOUTH-TRANSEPT)
>

;-----------------------------------------------------------------------------
; "RM-NORTH-TRANSEPT"
;-----------------------------------------------------------------------------

<OBJECT RM-NORTH-TRANSEPT
   (LOC ROOMS)
   (DESC "North Transept")
   (EAST  TO RM-EVANGELIST-CHAPEL)
   (SW    TO RM-NAVE)
   (FLAGS FL-INDOORS FL-LIGHTED)
	(GLOBAL LG-WINDOW LG-TOMBS LG-ABBEY LG-SHAFT-OF-LIGHT LG-COLUMNS)
   (DESCFCN RT-DF-RM-NORTH-TRANSEPT)
>

;-----------------------------------------------------------------------------
; "RM-POETS-CORNER"
;-----------------------------------------------------------------------------

<OBJECT RM-POETS-CORNER
   (LOC ROOMS)
   (DESC "Poets' Corner")
   (NORTH TO RM-SOUTH-AMBULATORY)
   (WEST  TO RM-SOUTH-TRANSEPT)
   (FLAGS FL-INDOORS FL-LIGHTED FL-NOARTC)
	(GLOBAL LG-TOMBS LG-ABBEY)
   (DESCFCN RT-DF-RM-POETS-CORNER)
>

;-----------------------------------------------------------------------------
; "RM-SOUTH-AMBULATORY"
;-----------------------------------------------------------------------------

<OBJECT RM-SOUTH-AMBULATORY
   (LOC ROOMS)
   (DESC "South Ambulatory")
   (EAST  TO RM-SOUTH-CHAPEL-AISLE)
   (NORTH TO RM-SANCTUARY)
   (SOUTH TO RM-POETS-CORNER)
   (NE    TO RM-HENRY-VII-CHAPEL)
   (FLAGS FL-INDOORS FL-LIGHTED)
	(GLOBAL LG-TOMBS LG-ABBEY LG-COLUMNS)
   (DESCFCN RT-DF-RM-SOUTH-AMBULATORY)
>

;-----------------------------------------------------------------------------
; "RM-SANCTUARY"
;-----------------------------------------------------------------------------

<OBJECT RM-SANCTUARY
   (LOC ROOMS)
   (DESC "Sanctuary")
   (NORTH TO RM-NORTH-AMBULATORY)
   (SOUTH TO RM-SOUTH-AMBULATORY)
   (WEST  TO RM-NAVE)
   (FLAGS FL-INDOORS FL-LIGHTED)
	(GLOBAL LG-TOMBS LG-ABBEY LG-COLUMNS)
   (DESCFCN RT-DF-RM-SANCTUARY)
>

;-----------------------------------------------------------------------------
; "RM-NORTH-AMBULATORY"
;-----------------------------------------------------------------------------

<OBJECT RM-NORTH-AMBULATORY
   (LOC ROOMS)
   (DESC "North Ambulatory")
   (EAST  TO RM-NORTH-CHAPEL-AISLE)
   (NORTH TO RM-EVANGELIST-CHAPEL)
   (SOUTH TO RM-SANCTUARY)
   (SE    TO RM-HENRY-VII-CHAPEL)
   (FLAGS FL-INDOORS FL-LIGHTED)
	(GLOBAL LG-TOMBS LG-ABBEY LG-COLUMNS)
   (DESCFCN RT-DF-RM-NORTH-AMBULATORY)
>

;-----------------------------------------------------------------------------
; "RM-EVANGELIST-CHAPEL"
;-----------------------------------------------------------------------------

<OBJECT RM-EVANGELIST-CHAPEL
   (LOC ROOMS)
   (DESC "Evangelist Chapel")
   (SOUTH TO RM-NORTH-AMBULATORY)
   (WEST  TO RM-NORTH-TRANSEPT)
   (FLAGS FL-INDOORS FL-LIGHTED FL-VOWEL)
	(GLOBAL LG-TOMBS LG-ABBEY LG-MARBLE)
   (ACTION RT-AC-RM-EVANGELIST-CHAPEL)
   (DESCFCN RT-DF-RM-EVANGELIST-CHAPEL)
>

;-----------------------------------------------------------------------------
; "RM-HENRY-VII-CHAPEL"
;-----------------------------------------------------------------------------

<OBJECT RM-HENRY-VII-CHAPEL
   (LOC ROOMS)
   (DESC "Henry VII Chapel")
   (NORTH TO RM-NORTH-CHAPEL-AISLE)
   (SOUTH TO RM-SOUTH-CHAPEL-AISLE)
   (WEST  TO RM-CONFESSOR-CHAPEL)
   (IN    TO RM-CONFESSOR-CHAPEL)
   (NE    TO RM-INNOCENTS-CORNER)
   (NW    TO RM-NORTH-AMBULATORY)
   (SW    TO RM-SOUTH-AMBULATORY)
   (FLAGS FL-INDOORS FL-LIGHTED)
	(GLOBAL LG-TOMBS LG-ABBEY)
   (ACTION RT-AC-RM-HENRY-VII-CHAPEL)
   (DESCFCN RT-DF-RM-HENRY-VII-CHAPEL)
>

;-----------------------------------------------------------------------------
; "RM-CONFESSOR-CHAPEL"
;-----------------------------------------------------------------------------

<OBJECT RM-CONFESSOR-CHAPEL
   (LOC ROOMS)
   (DESC "Confessor Chapel")
   (EAST  TO RM-HENRY-VII-CHAPEL)
   (OUT   TO RM-HENRY-VII-CHAPEL)
   (FLAGS FL-INDOORS FL-LIGHTED)
	(GLOBAL LG-TOMBS LG-ABBEY)
   (DESCFCN RT-DF-RM-CONFESSOR-CHAPEL)
>

;-----------------------------------------------------------------------------
; "RM-SOUTH-CHAPEL-AISLE"
;-----------------------------------------------------------------------------

<OBJECT RM-SOUTH-CHAPEL-AISLE
   (LOC ROOMS)
   (DESC "South Chapel Aisle")
   (WEST  TO RM-SOUTH-AMBULATORY)
   (NORTH TO RM-HENRY-VII-CHAPEL)
   (FLAGS FL-INDOORS FL-LIGHTED)
	(GLOBAL LG-TOMBS LG-ABBEY LG-MARBLE)
   (DESCFCN RT-DF-RM-SOUTH-CHAPEL-AISLE)
>

;-----------------------------------------------------------------------------
; "RM-NORTH-CHAPEL-AISLE"
;-----------------------------------------------------------------------------

<OBJECT RM-NORTH-CHAPEL-AISLE
   (LOC ROOMS)
   (DESC "North Chapel Aisle")
   (EAST  TO RM-INNOCENTS-CORNER)
   (WEST  TO RM-NORTH-AMBULATORY)
   (SOUTH TO RM-HENRY-VII-CHAPEL)
   (FLAGS FL-INDOORS FL-LIGHTED)
	(GLOBAL LG-TOMBS LG-ABBEY LG-MARBLE)
   (DESCFCN RT-DF-RM-NORTH-CHAPEL-AISLE)
>

;-----------------------------------------------------------------------------
; "RM-INNOCENTS-CORNER"
;-----------------------------------------------------------------------------

<OBJECT RM-INNOCENTS-CORNER
   (LOC ROOMS)
   (DESC "Innocents Corner")
   (WEST  TO RM-NORTH-CHAPEL-AISLE)
   (SW    TO RM-HENRY-VII-CHAPEL)
   (FLAGS FL-INDOORS FL-LIGHTED FL-NOARTC FL-VOWEL)
	(GLOBAL LG-TOMBS LG-ABBEY)
   (DESCFCN RT-DF-RM-INNOCENTS-CORNER)
>

;-----------------------------------------------------------------------------
; "RM-DRAWBRIDGE"
;-----------------------------------------------------------------------------

<OBJECT RM-DRAWBRIDGE
   (LOC ROOMS)
   (DESC "Drawbridge")
   (EAST  TO RM-BYWARD-TOWER)
   (WEST  TO RM-TOWER-ENTRANCE)
	(GLOBAL LG-TOWER LG-DRAWBRIDGE) 
   (DESCFCN RT-DF-RM-DRAWBRIDGE)
>

;-----------------------------------------------------------------------------
; "RM-BYWARD-TOWER"
;-----------------------------------------------------------------------------

<OBJECT RM-BYWARD-TOWER
   (LOC ROOMS)
   (DESC "Byward Tower")
   (EAST  PER RT-EX-RM-EXIT-BYWARD-TOWER)
   (WEST  PER RT-EX-RM-EXIT-BYWARD-TOWER)
   (IN	 PER RT-EX-RM-EXIT-BYWARD-TOWER)
   (OUT	 PER RT-EX-RM-EXIT-BYWARD-TOWER)
   (FLAGS FL-LOCKED FL-LIGHTED)
	(GLOBAL LG-TOWER)
   (DESCFCN RT-DF-RM-BYWARD-TOWER)
>

;-----------------------------------------------------------------------------
; "RM-OUTER-WARD"
;-----------------------------------------------------------------------------

<OBJECT RM-OUTER-WARD
   (LOC ROOMS)
   (DESC "Outer Ward")
   (NORTH TO RM-BLOODY-TOWER)
   (SOUTH TO RM-INSIDE-TRAITORS-GATE)
   (WEST  TO RM-BYWARD-TOWER)
   (FLAGS FL-VOWEL)
	(GLOBAL LG-TOWER LG-RAVENS)
   (DESCFCN RT-DF-RM-OUTER-WARD)
>

;-----------------------------------------------------------------------------
; "RM-BLOODY-TOWER"
;-----------------------------------------------------------------------------

<OBJECT RM-BLOODY-TOWER
   (LOC ROOMS)
   (DESC "Bloody Tower")
   (NORTH TO RM-TOWER-GREEN)
   (SOUTH TO RM-OUTER-WARD)
   (OUT   TO RM-TOWER-GREEN)
   (FLAGS FL-INDOORS FL-LIGHTED)
	(GLOBAL LG-TOWER)
   (DESCFCN RT-DF-RM-BLOODY-TOWER)
>

;-----------------------------------------------------------------------------
; "RM-OUTSIDE-BELL-TOWER"
;-----------------------------------------------------------------------------

;<OBJECT RM-OUTSIDE-BELL-TOWER
   (LOC ROOMS)
   (DESC "Outside Bell Tower")
   (NW    TO RM-TOWER-GREEN)
   (FLAGS FL-NOARTC FL-VOWEL)
	(GLOBAL LG-TOWER LG-RAVENS)
   (DESCFCN RT-DF-RM-OUTSIDE-BELL-TOWER)
>

;-----------------------------------------------------------------------------
; "RM-WAKEFIELD-TOWER"
;-----------------------------------------------------------------------------

<OBJECT RM-WAKEFIELD-TOWER
   (LOC ROOMS)
   (DESC "Wakefield Tower")
   (NW    TO RM-TOWER-GREEN)
   (UP    TO RM-JEWEL-ROOM)
   (OUT   TO RM-TOWER-GREEN)
   (FLAGS FL-INDOORS FL-LIGHTED)
	(GLOBAL LG-STAIRWAY LG-TOWER)
   (DESCFCN RT-DF-RM-WAKEFIELD-TOWER)
>

;-----------------------------------------------------------------------------
; "RM-JEWEL-ROOM"
;-----------------------------------------------------------------------------

<OBJECT RM-JEWEL-ROOM
   (LOC ROOMS)
   (DESC "Jewel Room")
   (DOWN  TO RM-WAKEFIELD-TOWER)
   (FLAGS FL-INDOORS FL-LIGHTED)
	(GLOBAL LG-STAIRWAY LG-TOWER)
   (DESCFCN RT-DF-RM-JEWEL-ROOM)
>

;-----------------------------------------------------------------------------
; "RM-DUNGEON"
;-----------------------------------------------------------------------------

<OBJECT RM-DUNGEON
   (LOC ROOMS)
   (DESC "Dungeon")
   (UP    TO RM-WHITE-TOWER)
   (FLAGS FL-INDOORS FL-LIGHTED)
	(GLOBAL LG-STAIRWAY LG-TOWER)
   (DESCFCN RT-DF-RM-DUNGEON)
>

;-----------------------------------------------------------------------------
; "RM-TORTURE-ROOM"
;-----------------------------------------------------------------------------

<OBJECT RM-TORTURE-ROOM
   (LOC ROOMS)
   (DESC "Torture Room")
   (UP    TO RM-BOWYER-TOWER)
   (FLAGS FL-INDOORS FL-LIGHTED)
	(GLOBAL LG-STAIRWAY LG-TOWER)
   (DESCFCN RT-DF-RM-TORTURE-ROOM)
>

;-----------------------------------------------------------------------------
; "RM-WHITE-TOWER"
;-----------------------------------------------------------------------------

<OBJECT RM-WHITE-TOWER
   (LOC ROOMS)
   (DESC "White Tower")
   (WEST  TO RM-TOWER-GREEN)
   (DOWN  TO RM-DUNGEON)
   (OUT   TO RM-TOWER-GREEN)
   (FLAGS FL-INDOORS FL-LIGHTED)
	(GLOBAL LG-STAIRWAY LG-TOWER)
   (DESCFCN RT-DF-RM-WHITE-TOWER)
>

;-----------------------------------------------------------------------------
; "RM-TOWER-GREEN"
;-----------------------------------------------------------------------------

<OBJECT RM-TOWER-GREEN
   (LOC ROOMS)
   (DESC "Tower Green")
   (EAST  TO RM-WHITE-TOWER)
   (SOUTH TO RM-BLOODY-TOWER)
   (NE    TO RM-BOWYER-TOWER)
   (SE    TO RM-WAKEFIELD-TOWER)
;  (SW    TO RM-OUTSIDE-BELL-TOWER)
	(GLOBAL LG-TOWER LG-RAVENS)
   (DESCFCN RT-DF-RM-TOWER-GREEN)
>

;-----------------------------------------------------------------------------
; "RM-BOWYER-TOWER"
;-----------------------------------------------------------------------------

<OBJECT RM-BOWYER-TOWER
   (LOC ROOMS)
   (DESC "Bowyer Tower")
   (SW    TO RM-TOWER-GREEN)
   (DOWN  TO RM-TORTURE-ROOM)
   (OUT   TO RM-TOWER-GREEN)
   (FLAGS FL-INDOORS FL-LIGHTED)
	(GLOBAL LG-STAIRWAY LG-TOWER)
   (DESCFCN RT-DF-RM-BOWYER-TOWER)
>

;-----------------------------------------------------------------------------
; "RM-INSIDE-TRAITORS-GATE"
;-----------------------------------------------------------------------------

<OBJECT RM-INSIDE-TRAITORS-GATE
   (LOC ROOMS)
   (DESC "Inside Traitors Gate")
   (NORTH TO RM-OUTER-WARD)
   (OUT   TO RM-OUTSIDE-TRAITORS-GATE IF LG-PORTCULLIS-DOOR IS OPEN)
   (SOUTH TO RM-OUTSIDE-TRAITORS-GATE IF LG-PORTCULLIS-DOOR IS OPEN)
   (FLAGS FL-NOARTC FL-VOWEL)
   (GLOBAL LG-PORTCULLIS-DOOR LG-TOWER LG-RAVENS LG-SOUTH-WALL)
   (DESCFCN RT-DF-RM-INSIDE-TRAITORS-GATE)
>

;-----------------------------------------------------------------------------
; "RM-OUTSIDE-TRAITORS-GATE"
;-----------------------------------------------------------------------------

<OBJECT RM-OUTSIDE-TRAITORS-GATE
   (LOC ROOMS)
   (DESC "Outside Traitors Gate")
   (IN    TO RM-INSIDE-TRAITORS-GATE IF LG-PORTCULLIS-DOOR IS OPEN)
   (NORTH TO RM-INSIDE-TRAITORS-GATE IF LG-PORTCULLIS-DOOR IS OPEN)
   (SOUTH PER RT-EX-RM-LAUNCH-BOAT)
   (FLAGS FL-NOARTC FL-VOWEL)
   (GLOBAL  LG-WATER LG-UPSTREAM LG-DOWNSTREAM LG-LONDON-BRIDGE LG-PORTCULLIS-DOOR
				LG-TOWER LG-NORTH-WALL LG-BOATS)
   (DESCFCN RT-DF-RM-OUTSIDE-TRAITORS-GATE)
>

;*****************************************************************************
; "end of file"
;*****************************************************************************
