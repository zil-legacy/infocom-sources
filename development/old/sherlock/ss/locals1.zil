;******************************************************************************
; "game : SHERLOCK!"
; "file : LOCALS1.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   26 Oct 1987  7:15:02  $"
; "rev  : $Revision:   1.51  $"
; "vers : 1.00"
;******************************************************************************

;-----------------------------------------------------------------------------
; "this file contains:"
; "  object definitions for all local globals"
;-----------------------------------------------------------------------------

;-----------------------------------------------------------------------------
; "LG-BAKER-ST-DOOR"
;-----------------------------------------------------------------------------

<OBJECT LG-BAKER-ST-DOOR
   (LOC LOCAL-GLOBALS)
   (DESC "front door")
   (FLAGS FL-DOOR FL-OPENABLE FL-LOCKED)
   (SYNONYM DOOR)
   (ADJECTIVE FRONT HOLMES\' HOLMES\'S SHERLOCK)
	(GENERIC RT-GN-DOOR)
   (ACTION RT-AC-LG-BAKER-ST-DOOR)
>

;-----------------------------------------------------------------------------
; "LG-PARLOUR-DOOR"
;-----------------------------------------------------------------------------

<OBJECT LG-PARLOUR-DOOR
   (LOC LOCAL-GLOBALS)
   (DESC "parlour door")
   (FLAGS FL-DOOR FL-OPENABLE)
   (SYNONYM DOOR)
   (ADJECTIVE PARLOUR PARLOR)
	(GENERIC RT-GN-DOOR)
   (ACTION RT-AC-LG-PARLOUR-DOOR)
>

;-----------------------------------------------------------------------------
; "LG-HOLMES-STUDY-DOOR"
;-----------------------------------------------------------------------------

<OBJECT LG-HOLMES-STUDY-DOOR
   (LOC LOCAL-GLOBALS)
   (DESC "study door")
   (FLAGS FL-DOOR FL-OPENABLE FL-OPENED)
   (SYNONYM DOOR)
   (ADJECTIVE STUDY HOLMES\'S HOLMES\' SHERLOCK)
	(GENERIC RT-GN-DOOR)
   (ACTION RT-AC-LG-HOLMES-STUDY-DOOR)
>

;-----------------------------------------------------------------------------
; "LG-HOLMES-BEDROOM-DOOR"
;-----------------------------------------------------------------------------

<OBJECT LG-HOLMES-BEDROOM-DOOR
   (LOC LOCAL-GLOBALS)
   (DESC "bedroom door")
   (FLAGS FL-DOOR FL-OPENABLE FL-LOCKED)
   (SYNONYM DOOR)
   (ADJECTIVE BEDROOM HOLMES\'S HOLMES\' SHERLOCK)
	(GENERIC RT-GN-DOOR)
   (ACTION RT-AC-LG-HOLMES-BEDROOM-DOOR)
>

;-----------------------------------------------------------------------------
; "LG-BANK-VAULT-DOOR"
;-----------------------------------------------------------------------------

<OBJECT LG-BANK-VAULT-DOOR
   (LOC LOCAL-GLOBALS)
   (DESC "vault door")
   (FLAGS FL-DOOR FL-OPENABLE FL-LOCKED)
   (SYNONYM DOOR)
   (ADJECTIVE VAULT)
   (VALUE 3)
	(GENERIC RT-GN-DOOR)
   (ACTION RT-AC-LG-BANK-VAULT-DOOR)
   (DESCFCN RT-DF-LG-BANK-VAULT-DOOR)
>

;-----------------------------------------------------------------------------
; "LG-PORTCULLIS-DOOR"
;-----------------------------------------------------------------------------

;<OBJECT LG-PORTCULLIS-DOOR
   (LOC LOCAL-GLOBALS)
   (DESC "portcullis")
   (FLAGS FL-DOOR FL-OPENABLE FL-TRANSPARENT)
   (SYNONYM DOOR PORTICULLIS)
   (ADJECTIVE IRON GATE TRAITOR'S)
	(GENERIC RT-GN-DOOR)
   (ACTION RT-AC-LG-PORTCULLIS-DOOR)
>

;-----------------------------------------------------------------------------
; "LG-BAR-OF-GOLD-DOOR"
;-----------------------------------------------------------------------------

<OBJECT LG-BAR-OF-GOLD-DOOR
   (LOC LOCAL-GLOBALS)
   (DESC "door")
   (FLAGS FL-DOOR FL-OPENABLE FL-OPENED)
   (SYNONYM DOOR)
	(GENERIC RT-GN-DOOR)
   (ACTION RT-AC-LG-BAR-OF-GOLD-DOOR)
>

;-----------------------------------------------------------------------------
; "LG-LAIR-DOOR"
;-----------------------------------------------------------------------------

<OBJECT LG-LAIR-DOOR
	(LOC LOCAL-GLOBALS)
	(DESC "door")
	(FLAGS FL-DOOR FL-OPENABLE FL-LOCKED)
	(SYNONYM DOOR)
	(GENERIC RT-GN-DOOR)
	(ACTION RT-AC-LG-LAIR-DOOR)
>

;-----------------------------------------------------------------------------
; "LG-JERICHO-PARLOUR-DOOR"
;-----------------------------------------------------------------------------

<OBJECT LG-JERICHO-PARLOUR-DOOR
   (LOC LOCAL-GLOBALS)
   (DESC "door to the Jericho Parlour")
   (FLAGS FL-DOOR FL-OPENABLE)
   (SYNONYM DOOR)
   (ADJECTIVE JERICHO PARLOUR PARLOR)
	(GENERIC RT-GN-DOOR)
   (ACTION RT-AC-LG-JERICHO-PARLOUR-DOOR)
>

;-----------------------------------------------------------------------------
; "LG-BRITISH-MUSEUM-DOOR"
;-----------------------------------------------------------------------------

<OBJECT LG-BRITISH-MUSEUM-DOOR
   (LOC LOCAL-GLOBALS)
   (DESC "door")
   (FLAGS FL-DOOR FL-LOCKED FL-OPENABLE)
   (SYNONYM DOOR)
	(GENERIC RT-GN-DOOR)
   (ACTION RT-AC-LG-BRITISH-MUSEUM-DOOR)
>

;-----------------------------------------------------------------------------
; "LG-WESTMINSTER-DOOR"
;-----------------------------------------------------------------------------

<OBJECT LG-WESTMINSTER-DOOR
   (LOC LOCAL-GLOBALS)
   (DESC "Abbey door")
   (FLAGS FL-DOOR FL-LOCKED FL-OPENABLE)
   (SYNONYM DOOR)
	(GENERIC RT-GN-DOOR)
   (ACTION RT-AC-LG-WESTMINSTER-DOOR)
>

;-----------------------------------------------------------------------------
; "LG-SHOPS"
;-----------------------------------------------------------------------------

<OBJECT LG-SHOPS
   (LOC LOCAL-GLOBALS)
   (DESC "shops")
   (FLAGS FL-PLURAL)
   (SYNONYM SHOPS STORES EMPORIUMS WINDOWS WINDOW SHOP STORE)
   (ACTION RT-AC-LG-SHOPS)
   (DESCFCN RT-DF-LG-SHOPS)
>

;-----------------------------------------------------------------------------
; "LG-CROWDS"
;-----------------------------------------------------------------------------

<OBJECT LG-CROWDS
   (LOC LOCAL-GLOBALS)
   (DESC "crowds")
   (FLAGS FL-PLURAL)
   (SYNONYM CROWDS CROWD TOURISTS SHOPPERS WOMEN PEOPLE)
   (ACTION RT-AC-LG-CROWDS)
   (DESCFCN RT-DF-LG-CROWDS)
>

;-----------------------------------------------------------------------------
; "LG-WATER"
;-----------------------------------------------------------------------------

<OBJECT LG-WATER
   (LOC LOCAL-GLOBALS)
   (DESC "water")
   (FLAGS FL-NODESC FL-CONTAINER FL-OPENED FL-SURFACE)
   (SYNONYM WATER RIVER THAMES)
	(CAPACITY 100)
   (ACTION RT-AC-LG-WATER)
>

;-----------------------------------------------------------------------------
; "LG-UPSTREAM"
;-----------------------------------------------------------------------------

<OBJECT LG-UPSTREAM
   (LOC LOCAL-GLOBALS)
   (DESC "upstream")
   (FLAGS FL-NODESC)
   (SYNONYM UPSTREAM)
   (ACTION RT-AC-LG-UPSTREAM)
>

;-----------------------------------------------------------------------------
; "LG-DOWNSTREAM"
;-----------------------------------------------------------------------------

<OBJECT LG-DOWNSTREAM
   (LOC LOCAL-GLOBALS)
   (DESC "downstream")
   (FLAGS FL-NODESC)
   (SYNONYM DOWNSTREAM)
   (ACTION RT-AC-LG-DOWNSTREAM)
>

;-----------------------------------------------------------------------------
; "LG-PLAQUES"
;-----------------------------------------------------------------------------

<OBJECT LG-PLAQUES
   (LOC LOCAL-GLOBALS)
   (DESC "sign")
   (FLAGS FL-TRYTAKE FL-NOALL FL-SURFACE)
   (SYNONYM PLAQUE PLATE SIGN RELIEF)
	(CAPACITY 999)
   (ACTION RT-AC-LG-PLAQUES)
   (DESCFCN RT-DF-LG-PLAQUES)
>

;-----------------------------------------------------------------------------
; "LG-STATUES"
;-----------------------------------------------------------------------------

<OBJECT LG-STATUES
   (LOC LOCAL-GLOBALS)
   (DESC "statues")
   (FLAGS FL-TRYTAKE FL-PLURAL FL-NOALL)
   (SYNONYM GROUPINGS STATUES FIGURES SCULPTURES STATUE SCENES)
>

;-----------------------------------------------------------------------------
; "LG-WAX-STATUES"
;-----------------------------------------------------------------------------

<OBJECT LG-WAX-STATUES
   (LOC LOCAL-GLOBALS)
   (DESC "statues")
   (FLAGS FL-TRYTAKE FL-PLURAL FL-NOALL)
   (SYNONYM GROUPINGS STATUES FIGURES SCULPTURES STATUE SCENES WAX)
	(ADJECTIVE WAX)
	(GENERIC RT-GN-WAX)
   (DESCFCN RT-DF-LG-WAX-STATUES)
>

;-----------------------------------------------------------------------------
; "LG-PEDESTAL"
;-----------------------------------------------------------------------------

<OBJECT LG-PEDESTAL
   (LOC LOCAL-GLOBALS)
   (DESC "pedestal")
   (FLAGS FL-TRYTAKE FL-NOALL)
   (SYNONYM PEDESTAL)
   (DESCFCN RT-DF-LG-PEDESTAL)
>

;-----------------------------------------------------------------------------
; "LG-WINDOW"
;-----------------------------------------------------------------------------

<OBJECT LG-WINDOW
   (LOC LOCAL-GLOBALS)
   (DESC "window")
   (FLAGS FL-TRYTAKE FL-NOALL)
   (SYNONYM WINDOW)
	(ACTION RT-AC-LG-WINDOW)
   (DESCFCN RT-DF-LG-WINDOW)
>

;-----------------------------------------------------------------------------
; "LG-TOMBS"
;-----------------------------------------------------------------------------

<OBJECT LG-TOMBS
   (LOC LOCAL-GLOBALS)
   (DESC "tombs")
   (FLAGS FL-TRYTAKE FL-PLURAL FL-NOALL)
   (SYNONYM TOMBS SCULPTURES STATUES TOMB)
	(ACTION RT-AC-LG-TOMBS)
   (DESCFCN RT-DF-LG-TOMBS)
>

;-----------------------------------------------------------------------------
; "LG-HOLMES-STUDY-WINDOW"
;-----------------------------------------------------------------------------

<OBJECT LG-HOLMES-STUDY-WINDOW
   (LOC LOCAL-GLOBALS)
   (DESC "window")
   (FLAGS FL-TRYTAKE FL-NOALL FL-TRANSPARENT FL-OPENABLE)
   (SYNONYM WINDOW)
	(ADJECTIVE BOW)
   (ACTION RT-AC-LG-HOLMES-STUDY-WINDOW)
>

;-----------------------------------------------------------------------------
; "LG-STREETLIGHT"
;-----------------------------------------------------------------------------

<OBJECT LG-STREETLIGHT
   (LOC LOCAL-GLOBALS)
   (DESC "streetlight")
   (FLAGS FL-TRYTAKE FL-NOALL FL-TRANSPARENT)
   (SYNONYM LIGHT LAMP STREETLIGHT STREETLAMP STREET-LIGHT GASLIGHT GAS-LIGHT)
	(ADJECTIVE GAS)
   (ACTION RT-AC-LG-STREETLIGHT)
>

;-----------------------------------------------------------------------------
; "LG-STAIRWAY"
;-----------------------------------------------------------------------------

<OBJECT LG-STAIRWAY
   (LOC LOCAL-GLOBALS)
   (DESC "stairway")
   (FLAGS FL-TRYTAKE FL-NOALL)
   (SYNONYM STAIRWAY STAIR STAIRS STEP STEPS)
   (ACTION RT-AC-LG-STAIRWAY)
>
;-----------------------------------------------------------------------------
; "LG-SHAFT-OF-LIGHT"
;-----------------------------------------------------------------------------

<OBJECT LG-SHAFT-OF-LIGHT
	(LOC LOCAL-GLOBALS)
	(DESC "shaft of light")
	(FLAGS FL-NODESC)
	(SYNONYM SHAFT LIGHT SUNLIGHT)
	(ADJECTIVE SHAFT LIGHT SUNLIGHT)
	(ACTION RT-AC-LG-SHAFT-OF-LIGHT)
	(DESCFCN RT-DF-LG-SHAFT-OF-LIGHT)
>

;-----------------------------------------------------------------------------
; "LG-MARBLE"
;-----------------------------------------------------------------------------

<OBJECT LG-MARBLE
	(LOC LOCAL-GLOBALS)
	(DESC "marble")
	(FLAGS FL-NODESC)
	(SYNONYM MARBLE)
>

;-----------------------------------------------------------------------------
; "LG-COLUMNS"
;-----------------------------------------------------------------------------

<OBJECT LG-COLUMNS
   (LOC LOCAL-GLOBALS)
   (DESC "columns")
   (FLAGS FL-TRYTAKE FL-PLURAL FL-NOALL)
   (SYNONYM COLUMNS COLUMN)
	(ADJECTIVE PURBECK)
>

;-----------------------------------------------------------------------------
; "LG-RAVENS"
;-----------------------------------------------------------------------------

<OBJECT LG-RAVENS
	(LOC LOCAL-GLOBALS)
	(DESC "ravens")
	(FLAGS FL-NODESC FL-PLURAL FL-ALIVE FL-TRYTAKE)
	(SYNONYM RAVENS BIRDS ROOKS RAVEN ROOK BIRD)
	(ADJECTIVE FLOCK GROUP BUNCH GAGGLE)
	(SIZE 50)
	(MASS 250)
	(ACTION RT-AC-LG-RAVENS)
	(DESCFCN RT-DF-LG-RAVENS)
>

;-----------------------------------------------------------------------------
; "LG-BOATS"
;-----------------------------------------------------------------------------

<OBJECT LG-BOATS
   (LOC LOCAL-GLOBALS)
   (DESC "boats")
   (FLAGS FL-NODESC)
   (SYNONYM BOATS SHIPS)
	(ADJECTIVE PLEASURE)
	(DESCFCN RT-DF-LG-BOATS)
>

;-----------------------------------------------------------------------------
; "LG-NORTH-WALL"
;-----------------------------------------------------------------------------

<OBJECT LG-NORTH-WALL
   (LOC GLOBAL-OBJECTS)
   (DESC "wall to your north")
   (FLAGS FL-TRYTAKE FL-NOALL)
   (SYNONYM WALL)
	(ADJECTIVE NORTH)
	(GENERIC RT-GN-WALL)
   (ACTION RT-AC-LG-NORTH-WALL)
>

;-----------------------------------------------------------------------------
; "LG-SOUTH-WALL"
;-----------------------------------------------------------------------------

<OBJECT LG-SOUTH-WALL
   (LOC GLOBAL-OBJECTS)
   (DESC "wall to your south")
   (FLAGS FL-TRYTAKE FL-NOALL)
   (SYNONYM WALL)
	(ADJECTIVE SOUTH)
>

;-----------------------------------------------------------------------------
; "LG-EAST-WALL"
;-----------------------------------------------------------------------------

<OBJECT LG-EAST-WALL
   (LOC GLOBAL-OBJECTS)
   (DESC "wall to your east")
   (FLAGS FL-VOWEL FL-TRYTAKE FL-NOALL)
   (SYNONYM WALL)
	(ADJECTIVE EAST)
   (ACTION RT-AC-LG-EAST-WALL)
>

;-----------------------------------------------------------------------------
; "LG-WEST-WALL"
;-----------------------------------------------------------------------------

<OBJECT LG-WEST-WALL
   (LOC GLOBAL-OBJECTS)
   (DESC "wall to your west")
   (FLAGS FL-TRYTAKE FL-NOALL)
   (SYNONYM WALL)
	(ADJECTIVE WEST)
   (ACTION RT-AC-LG-WEST-WALL)
>

;*****************************************************************************
; "ROOM LOCAL GLOBALS"
;*****************************************************************************



;-----------------------------------------------------------------------------
; "LG-BAKER-ST"
;-----------------------------------------------------------------------------

<OBJECT LG-BAKER-ST
   (LOC LOCAL-GLOBALS)
   (DESC "Baker Street")
   (SYNONYM STREET ST)
   (ADJECTIVE 221-B 221B BAKER)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-BAKER-ST)
>

;-----------------------------------------------------------------------------
; "LG-ENTRY-HALL"
;-----------------------------------------------------------------------------

<OBJECT LG-ENTRY-HALL
   (LOC LOCAL-GLOBALS)
   (DESC "Entry Hall")
   (SYNONYM HALL HOUSE)
   (FLAGS FL-VOWEL)
   (ADJECTIVE ENTRY HOLMES\')
   (ACTION RT-AC-LG-ENTRY-HALL)
>

;-----------------------------------------------------------------------------
; "LG-PARLOUR"
;-----------------------------------------------------------------------------

<OBJECT LG-PARLOUR
   (LOC LOCAL-GLOBALS)
   (DESC "parlour")
   (SYNONYM PARLOUR PARLOR)
   (ACTION RT-AC-LG-PARLOUR)
>

;-----------------------------------------------------------------------------
; "LG-VESTIBULE"
;-----------------------------------------------------------------------------

<OBJECT LG-VESTIBULE
   (LOC LOCAL-GLOBALS)
   (DESC "vestibule")
   (SYNONYM VESTIBULE)
   (ACTION RT-AC-LG-VESTIBULE)
>

;-----------------------------------------------------------------------------
; "LG-STUDY"
;-----------------------------------------------------------------------------

<OBJECT LG-STUDY
   (LOC LOCAL-GLOBALS)
   (DESC "study")
   (SYNONYM STUDY)
   (ACTION RT-AC-LG-STUDY)
>

;-----------------------------------------------------------------------------
; "LG-BEDROOM"
;-----------------------------------------------------------------------------

<OBJECT LG-BEDROOM
   (LOC LOCAL-GLOBALS)
   (DESC "bedroom")
   (SYNONYM BEDROOM)
   (ACTION RT-AC-LG-BEDROOM)
>

;-----------------------------------------------------------------------------
; "LG-YORK-PLACE"
;-----------------------------------------------------------------------------

<OBJECT LG-YORK-PLACE
   (LOC LOCAL-GLOBALS)
   (DESC "York Place")
   (SYNONYM PLACE)
   (ADJECTIVE YORK)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-YORK-PLACE)
>

;-----------------------------------------------------------------------------
; "LG-MARYLEBONE-RD"
;-----------------------------------------------------------------------------

<OBJECT LG-MARYLEBONE-RD
   (LOC LOCAL-GLOBALS)
   (DESC "Marylebone Road")
   (SYNONYM ROAD)
   (ADJECTIVE MARYLEBONE)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-MARYLEBONE-RD)
>

;-----------------------------------------------------------------------------
; "LG-TUSSAUDS"
;-----------------------------------------------------------------------------

<OBJECT LG-TUSSAUDS
   (LOC LOCAL-GLOBALS)
   (DESC "Madame Tussaud's")
   (SYNONYM TUSSAUDS TUSSAUD\'S MUSEUM)
   (ADJECTIVE MADAME WAX)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-TUSSAUDS)
>

;-----------------------------------------------------------------------------
; "LG-CHAMBER-OF-HORRORS"
;-----------------------------------------------------------------------------

<OBJECT LG-CHAMBER-OF-HORRORS
   (LOC LOCAL-GLOBALS)
   (DESC "Chamber of Horrors")
   (SYNONYM CHAMBER HORRORS)
	(ADJECTIVE CHAMBER HORRORS)
   (ACTION RT-AC-LG-CHAMBER-OF-HORRORS)
>

;-----------------------------------------------------------------------------
; "LG-TOTTENHAM-COURT-RD"
;-----------------------------------------------------------------------------

<OBJECT LG-TOTTENHAM-COURT-RD
   (LOC LOCAL-GLOBALS)
   (DESC "Tottenham Court Rd")
   (SYNONYM ROAD)
   (ADJECTIVE TOTTENHAM COURT)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-TOTTENHAM-COURT-RD)
>

;-----------------------------------------------------------------------------
; "LG-ST-GILES-CIRCUS"
;-----------------------------------------------------------------------------

<OBJECT LG-ST-GILES-CIRCUS
   (LOC LOCAL-GLOBALS)
   (DESC "St Giles Circus")
   (SYNONYM GILES CIRCUS)
   (ADJECTIVE ST SAINT GILES)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-ST-GILES-CIRCUS)
>

;-----------------------------------------------------------------------------
; "LG-OXFORD-ST"
;-----------------------------------------------------------------------------

<OBJECT LG-OXFORD-ST
   (LOC LOCAL-GLOBALS)
   (DESC "Oxford Street")
   (SYNONYM STREET ST)
   (ADJECTIVE OXFORD)
	(FLAGS FL-NOARTC FL-VOWEL)
   (ACTION RT-AC-LG-OXFORD-ST)
>

;-----------------------------------------------------------------------------
; "LG-ORCHARD-ST"
;-----------------------------------------------------------------------------

<OBJECT LG-ORCHARD-ST
   (LOC LOCAL-GLOBALS)
   (DESC "Orchard Street")
   (SYNONYM STREET ST)
   (ADJECTIVE ORCHARD)
	(FLAGS FL-NOARTC FL-VOWEL)
   (ACTION RT-AC-LG-ORCHARD-ST)
>


;-----------------------------------------------------------------------------
; "LG-AUDLEY-ST"
;-----------------------------------------------------------------------------

<OBJECT LG-AUDLEY-ST
   (LOC LOCAL-GLOBALS)
   (DESC "Audley Street")
   (SYNONYM STREET ST)
   (ADJECTIVE AUDLEY)
	(FLAGS FL-NOARTC FL-VOWEL)
   (ACTION RT-AC-LG-AUDLEY-ST)
>

;-----------------------------------------------------------------------------
; "LG-HYDE-PARK-CORNER"
;-----------------------------------------------------------------------------

<OBJECT LG-HYDE-PARK-CORNER
   (LOC LOCAL-GLOBALS)
   (DESC "Hyde Park Corner")
   (SYNONYM CORNER)
   (ADJECTIVE HYDE PARK)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-HYDE-PARK-CORNER)
>

;-----------------------------------------------------------------------------
; "LG-KENSINGTON-GARDENS"
;-----------------------------------------------------------------------------

<OBJECT LG-KENSINGTON-GARDENS
   (LOC LOCAL-GLOBALS)
   (DESC "Kensington Gardens")
   (SYNONYM GARDENS)
   (ADJECTIVE KENSINGTON)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-KENSINGTON-GARDENS)
>

;-----------------------------------------------------------------------------
; "LG-TRAFALGAR-SQUARE"
;-----------------------------------------------------------------------------

<OBJECT LG-TRAFALGAR-SQUARE
   (LOC LOCAL-GLOBALS)
   (DESC "Trafalgar Square")
   (SYNONYM SQUARE)
   (ADJECTIVE TRAFALGAR)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-TRAFALGAR-SQUARE)
>

;-----------------------------------------------------------------------------
; "LG-DIOGENES-CLUB"
;-----------------------------------------------------------------------------

<OBJECT LG-DIOGENES-CLUB
   (LOC LOCAL-GLOBALS)
   (DESC "Diogenes Club")
   (SYNONYM CLUB)
   (ADJECTIVE DIOGENES)
   (ACTION RT-AC-LG-DIOGENES-CLUB)
>

;-----------------------------------------------------------------------------
; "LG-GREAT-RUSSELL-ST"
;-----------------------------------------------------------------------------

<OBJECT LG-GREAT-RUSSELL-ST
   (LOC LOCAL-GLOBALS)
   (DESC "Great Russell Street")
   (SYNONYM STREET ST)
   (ADJECTIVE GREAT RUSSELL)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-GREAT-RUSSELL-ST)
>

;-----------------------------------------------------------------------------
; "LG-BRITISH-MUSEUM"
;-----------------------------------------------------------------------------

<OBJECT LG-BRITISH-MUSEUM
   (LOC LOCAL-GLOBALS)
   (DESC "British Museum")
   (SYNONYM MUSEUM)
   (ADJECTIVE BRITISH)
   (ACTION RT-AC-LG-BRITISH-MUSEUM)
>

;-----------------------------------------------------------------------------
; "LG-MANUSCRIPT-ROOM"
;-----------------------------------------------------------------------------

<OBJECT LG-MANUSCRIPT-ROOM
   (LOC LOCAL-GLOBALS)
   (DESC "Manuscript Room")
   (SYNONYM ROOM)
   (ADJECTIVE MANUSCRIPT)
   (ACTION RT-AC-LG-MANUSCRIPT-ROOM)
>

;-----------------------------------------------------------------------------
; "LG-GROSVENOR-PLACE"
;-----------------------------------------------------------------------------

<OBJECT LG-GROSVENOR-PLACE
   (LOC LOCAL-GLOBALS)
   (DESC "Grosvenor Place")
   (SYNONYM PLACE)
   (ADJECTIVE GROSVENOR)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-GROSVENOR-PLACE)
>

;-----------------------------------------------------------------------------
; "LG-VICTORIA-SQUARE"
;-----------------------------------------------------------------------------

<OBJECT LG-VICTORIA-SQUARE
   (LOC LOCAL-GLOBALS)
   (DESC "Victoria Square")
   (SYNONYM SQUARE)
   (ADJECTIVE VICTORIA)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-VICTORIA-SQUARE)
>

;-----------------------------------------------------------------------------
; "LG-VICTORIA-ST"
;-----------------------------------------------------------------------------

<OBJECT LG-VICTORIA-ST
   (LOC LOCAL-GLOBALS)
   (DESC "Victoria Street")
   (SYNONYM STREET ST)
   (ADJECTIVE VICTORIA)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-VICTORIA-ST)
>

;-----------------------------------------------------------------------------
; "LG-BROAD-SANCTUARY"
;-----------------------------------------------------------------------------

<OBJECT LG-BROAD-SANCTUARY
   (LOC LOCAL-GLOBALS)
   (DESC "Broad Sanctuary")
   (SYNONYM SANCTUARY)
   (ADJECTIVE BROAD)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-BROAD-SANCTUARY)
>

;-----------------------------------------------------------------------------
; "LG-PARLIAMENT-SQUARE"
;-----------------------------------------------------------------------------

<OBJECT LG-PARLIAMENT-SQUARE
   (LOC LOCAL-GLOBALS)
   (DESC "Parliament Square")
   (SYNONYM SQUARE)
   (ADJECTIVE PARLIAMENT)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-PARLIAMENT-SQUARE)
>

;-----------------------------------------------------------------------------
; "LG-HOUSES-OF-PARLIAMENT"
;-----------------------------------------------------------------------------

<OBJECT LG-HOUSES-OF-PARLIAMENT
   (LOC LOCAL-GLOBALS)
   (DESC "Houses of Parliament")
   (SYNONYM HOUSES PARLIAMENT)
	(ADJECTIVE HOUSES PARLIAMENT)
   (ACTION RT-AC-LG-HOUSES-OF-PARLIAMENT)
>

;-----------------------------------------------------------------------------
; "LG-BUCKINGHAM-PALACE-ROAD"
;-----------------------------------------------------------------------------

<OBJECT LG-BUCKINGHAM-PALACE-ROAD
   (LOC LOCAL-GLOBALS)
   (DESC "Buckingham Palace Road")
   (SYNONYM ROAD)
   (ADJECTIVE BUCKINGHAM PALACE)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-BUCKINGHAM-PALACE-ROAD)
>

;-----------------------------------------------------------------------------
; "LG-QUEENS-GARDENS"
;-----------------------------------------------------------------------------

<OBJECT LG-QUEENS-GARDENS
   (LOC LOCAL-GLOBALS)
   (DESC "Queens Gardens")
   (SYNONYM GARDENS)
   (ADJECTIVE QUEENS)
   (ACTION RT-AC-LG-QUEENS-GARDENS)
>

;-----------------------------------------------------------------------------
; "LG-BUCKINGHAM-PALACE"
;-----------------------------------------------------------------------------

<OBJECT LG-BUCKINGHAM-PALACE
   (LOC LOCAL-GLOBALS)
   (DESC "Buckingham Palace")
   (SYNONYM PALACE)
   (ADJECTIVE BUCKINGHAM)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-BUCKINGHAM-PALACE)
>

;-----------------------------------------------------------------------------
; "LG-BIRDCAGE-WALK"
;-----------------------------------------------------------------------------

<OBJECT LG-BIRDCAGE-WALK
   (LOC LOCAL-GLOBALS)
   (DESC "Birdcage Walk")
   (SYNONYM WALK)
   (ADJECTIVE BIRDCAGE)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-BIRDCAGE-WALK)
>

;-----------------------------------------------------------------------------
; "LG-THE-MALL"
;-----------------------------------------------------------------------------

<OBJECT LG-THE-MALL
   (LOC LOCAL-GLOBALS)
   (DESC "The Mall")
   (SYNONYM MALL)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-THE-MALL)
>

;-----------------------------------------------------------------------------
; "LG-WHITEHALL"
;-----------------------------------------------------------------------------

<OBJECT LG-WHITEHALL
   (LOC LOCAL-GLOBALS)
   (DESC "Whitehall")
   (SYNONYM WHITEHALL)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-WHITEHALL)
>

;-----------------------------------------------------------------------------
; "LG-SCOTLAND-YARD"
;-----------------------------------------------------------------------------

<OBJECT LG-SCOTLAND-YARD
   (LOC LOCAL-GLOBALS)
   (DESC "Scotland Yard")
   (SYNONYM YARD)
   (ADJECTIVE SCOTLAND)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-SCOTLAND-YARD)
>

;-----------------------------------------------------------------------------
; "LG-BLACK-MUSEUM"
;-----------------------------------------------------------------------------

<OBJECT LG-BLACK-MUSEUM
   (LOC LOCAL-GLOBALS)
   (DESC "Black Museum")
   (SYNONYM MUSEUM)
   (ADJECTIVE BLACK)
   (ACTION RT-AC-LG-BLACK-MUSEUM)
>

;-----------------------------------------------------------------------------
; "LG-NEW-OXFORD-ST"
;-----------------------------------------------------------------------------

<OBJECT LG-NEW-OXFORD-ST
   (LOC LOCAL-GLOBALS)
   (DESC "New Oxford Street")
   (SYNONYM STREET ST)
   (ADJECTIVE NEW OXFORD)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-NEW-OXFORD-ST)
>

;-----------------------------------------------------------------------------
; "LG-COVENT-GARDEN"
;-----------------------------------------------------------------------------

<OBJECT LG-COVENT-GARDEN
   (LOC LOCAL-GLOBALS)
   (DESC "Covent Garden")
   (SYNONYM GARDEN)
   (ADJECTIVE COVENT)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-COVENT-GARDEN)
>

;-----------------------------------------------------------------------------
; "LG-STRAND"
;-----------------------------------------------------------------------------

<OBJECT LG-STRAND
   (LOC LOCAL-GLOBALS)
   (DESC "Strand")
   (SYNONYM STRAND)
   (ACTION RT-AC-LG-STRAND)
>

;-----------------------------------------------------------------------------
; "LG-FLEET-ST"
;-----------------------------------------------------------------------------

<OBJECT LG-FLEET-ST
   (LOC LOCAL-GLOBALS)
   (DESC "Fleet Street")
   (SYNONYM STREET ST)
   (ADJECTIVE FLEET)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-FLEET-ST)
>

;-----------------------------------------------------------------------------
; "LG-THE-EMBANKMENT"
;-----------------------------------------------------------------------------

<OBJECT LG-THE-EMBANKMENT
   (LOC LOCAL-GLOBALS)
   (DESC "The Embankment")
   (SYNONYM EMBANKMENT)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-THE-EMBANKMENT)
>

;-----------------------------------------------------------------------------
; "LG-UPPER-THAMES-ST"
;-----------------------------------------------------------------------------

<OBJECT LG-UPPER-THAMES-ST
   (LOC LOCAL-GLOBALS)
   (DESC "Upper Thames Street")
   (SYNONYM STREET ST)
   (ADJECTIVE UPPER THAMES)
	(FLAGS FL-NOARTC FL-VOWEL)
   (ACTION RT-AC-LG-UPPER-THAMES-ST)
>

;-----------------------------------------------------------------------------
; "LG-BLIND-ALLEY"
;-----------------------------------------------------------------------------

<OBJECT LG-BLIND-ALLEY
   (LOC LOCAL-GLOBALS)
   (DESC "Blind Alley")
   (SYNONYM ALLEY)
   (ADJECTIVE BLIND)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-BLIND-ALLEY)
>

;-----------------------------------------------------------------------------
; "LG-THE-SIGN-OF-THE-RED-HERRING"
;-----------------------------------------------------------------------------

<OBJECT LG-THE-SIGN-OF-THE-RED-HERRING
   (LOC LOCAL-GLOBALS)
   (DESC "old pub")
   (SYNONYM HERRING)
   (ADJECTIVE OLD PUB RED)
	(FLAGS FL-VOWEL)
   (ACTION RT-AC-LG-THE-SIGN-OF-THE-RED-HERRING)
>

;-----------------------------------------------------------------------------
; "LG-PINCHIN-LANE"
;-----------------------------------------------------------------------------

<OBJECT LG-PINCHIN-LANE
   (LOC LOCAL-GLOBALS)
   (DESC "Pinchin Lane")
   (SYNONYM LANE)
   (ADJECTIVE PINCHIN)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-PINCHIN-LANE)
>

;-----------------------------------------------------------------------------
; "LG-SHERMANS-HOUSE"
;-----------------------------------------------------------------------------

<OBJECT LG-SHERMANS-HOUSE
   (LOC LOCAL-GLOBALS)
   (DESC "Sherman's house")
   (SYNONYM HOUSE)
   (ADJECTIVE SHERMAN\')
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-SHERMANS-HOUSE)
>

;-----------------------------------------------------------------------------
; "LG-HOLMES-HOUSE"
;-----------------------------------------------------------------------------

<OBJECT LG-HOLMES-HOUSE
   (LOC LOCAL-GLOBALS)
   (DESC "house")
   (SYNONYM HOUSE)
   (ADJECTIVE HOLMES\' HOLMES\'S)
   (ACTION RT-AC-LG-HOLMES-HOUSE)
>

;-----------------------------------------------------------------------------
; "LG-CHEAPSIDE"
;-----------------------------------------------------------------------------

<OBJECT LG-CHEAPSIDE
   (LOC LOCAL-GLOBALS)
   (DESC "Cheapside")
   (SYNONYM CHEAPSIDE)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-CHEAPSIDE)
>

;-----------------------------------------------------------------------------
; "LG-THREADNEEDLE-ST"
;-----------------------------------------------------------------------------

<OBJECT LG-THREADNEEDLE-ST
   (LOC LOCAL-GLOBALS)
   (DESC "Threadneedle Street")
   (SYNONYM STREET ST)
   (ADJECTIVE THREADNEEDLE)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-THREADNEEDLE-ST)
>

;-----------------------------------------------------------------------------
; "LG-BANK"
;-----------------------------------------------------------------------------

<OBJECT LG-BANK
   (LOC LOCAL-GLOBALS)
   (DESC "Bank of England")
   (SYNONYM BANK ENGLAND)
   (ACTION RT-AC-LG-BANK)
>

;-----------------------------------------------------------------------------
; "LG-VAULT"
;-----------------------------------------------------------------------------

<OBJECT LG-VAULT
   (LOC LOCAL-GLOBALS)
   (DESC "vault")
   (SYNONYM VAULT)
   (ACTION RT-AC-LG-VAULT)
	(DESCFCN RT-DF-LG-VAULT)
>

;-----------------------------------------------------------------------------
; "LG-KING-WILLIAM-ST"
;-----------------------------------------------------------------------------

<OBJECT LG-KING-WILLIAM-ST
   (LOC LOCAL-GLOBALS)
   (DESC "King William Street")
   (SYNONYM STREET ST)
   (ADJECTIVE KING WILLIAM)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-KING-WILLIAM-ST)
>

;-----------------------------------------------------------------------------
; "LG-MONUMENT"
;-----------------------------------------------------------------------------

<OBJECT LG-MONUMENT
   (LOC LOCAL-GLOBALS)
   (DESC "Monument")
   (SYNONYM MONUMENT OBELISK)
   (ACTION RT-AC-LG-MONUMENT)
   (DESCFCN RT-DF-LG-MONUMENT)
>

;-----------------------------------------------------------------------------
; "LG-LOWER-THAMES-ST"
;-----------------------------------------------------------------------------

<OBJECT LG-LOWER-THAMES-ST
   (LOC LOCAL-GLOBALS)
   (DESC "Lower Thames Street")
   (SYNONYM STREET ST)
   (ADJECTIVE LOWER THAMES)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-LOWER-THAMES-ST)
>

;-----------------------------------------------------------------------------
; "LG-LONDON-BRIDGE"
;-----------------------------------------------------------------------------

<OBJECT LG-LONDON-BRIDGE
   (LOC LOCAL-GLOBALS)
   (DESC "London Bridge")
   (FLAGS FL-NODESC FL-SURFACE FL-NOARTC)
   (SYNONYM BRIDGE)
	(ADJECTIVE LONDON)
	(CAPACITY 100)
   (ACTION RT-AC-LG-LONDON-BRIDGE)
>

;-----------------------------------------------------------------------------
; "LG-TOWER-ENTRANCE"
;-----------------------------------------------------------------------------

<OBJECT LG-TOWER-ENTRANCE
   (LOC LOCAL-GLOBALS)
   (DESC "entrance to the Tower")
   (SYNONYM ENTRANCE)
   (FLAGS FL-VOWEL)
   (ACTION RT-AC-LG-TOWER-ENTRANCE)
>

;-----------------------------------------------------------------------------
; "LG-SWAN-LANE"
;-----------------------------------------------------------------------------

<OBJECT LG-SWAN-LANE
   (LOC LOCAL-GLOBALS)
   (DESC "Swan Lane")
   (SYNONYM LANE)
	(ADJECTIVE SWAN)
	(FLAGS FL-NOARTC)
   (ACTION RT-AC-LG-SWAN-LANE)
>

;-----------------------------------------------------------------------------
; "LG-BAR-OF-GOLD"
;-----------------------------------------------------------------------------

<OBJECT LG-BAR-OF-GOLD
   (LOC LOCAL-GLOBALS)
   (DESC "Bar of Gold")
   (SYNONYM BAR GOLD)
	(ADJECTIVE BAR GOLD)
   (ACTION RT-AC-LG-BAR-OF-GOLD)
>

;-----------------------------------------------------------------------------
; "LG-LAIR"
;-----------------------------------------------------------------------------

<OBJECT LG-LAIR
   (LOC LOCAL-GLOBALS)
   (DESC "lair")
   (SYNONYM LAIR)
   (ACTION RT-AC-LG-LAIR)
>

;-----------------------------------------------------------------------------
; "LG-DRAWBRIDGE"
;-----------------------------------------------------------------------------

<OBJECT LG-DRAWBRIDGE
   (LOC LOCAL-GLOBALS)
   (DESC "Drawbridge")
	(FLAGS FL-SURFACE)
   (SYNONYM DRAWBRIDGE)
   (ACTION RT-AC-LG-DRAWBRIDGE)
>

;-----------------------------------------------------------------------------
; "LG-TOWER"
;-----------------------------------------------------------------------------

<OBJECT LG-TOWER
   (LOC LOCAL-GLOBALS)
	(DESC "Tower")
	(SYNONYM TOWER LONDON)
	(ADJECTIVE TOWER LONDON)
	(ACTION RT-AC-LG-TOWER)
>

;-----------------------------------------------------------------------------
; "LG-ABBEY"
;-----------------------------------------------------------------------------

<OBJECT LG-ABBEY
   (LOC LOCAL-GLOBALS)
	(DESC "Abbey")
	(SYNONYM ABBEY)
	(ADJECTIVE WESTMINSTER)
   (FLAGS FL-VOWEL)
	(ACTION RT-AC-LG-ABBEY)
>

;-----------------------------------------------------------------------------
; "LG-JERUSALEM-CHAMBER"
;-----------------------------------------------------------------------------

<OBJECT LG-JERUSALEM-CHAMBER
   (LOC LOCAL-GLOBALS)
   (DESC "Jerusalem Chamber")
   (SYNONYM CHAMBER)
	(ADJECTIVE JERUSALEM)
>

;*****************************************************************************
; "end of file"
;*****************************************************************************

