;*****************************************************************************
; "game : SHERLOCK!"
; "file : THINGS1.ZIL"
; "auth :   $Author:   RAB  $"
; "date :     $Date:   27 Oct 1987 17:38:14  $"
; "rev  : $Revision:   1.102  $"
; "vers : 1.00"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "this file contains:"
; "   object definitions of special objects"
; "   object definitions of global  objects"
; "   object definitions of generic objects"
; "   object definitions of game    objects"
;-----------------------------------------------------------------------------

;*****************************************************************************
; "special objects"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "TH-X-OBJECT, TH-Y-OBJECT, TH-Z-OBJECT"
;-----------------------------------------------------------------------------

<OBJECT TH-X-OBJECT>
<OBJECT TH-Y-OBJECT>
;<OBJECT TH-Z-OBJECT>

;-----------------------------------------------------------------------------
; "GLOBAL-OBJECTS"
;-----------------------------------------------------------------------------

<OBJECT GLOBAL-OBJECTS
   (FLAGS
      FL-ALIVE
      FL-ASLEEP
		FL-BODYPART
      FL-BROKEN
      FL-BURNABLE
      FL-BUYABLE
      FL-BYHAND
      FL-CLOTHING
      FL-COLD
		FL-COLLECTIVE
      FL-CONTAINER
      FL-DOOR
      FL-FEMALE
      FL-FOOD
		FL-HOLMES-TOLD
      FL-INDOORS
      FL-KEY
      FL-KNIFE
      FL-LAMP
      FL-LIGHTED
      FL-LOCATION
      FL-LOCKED
      FL-MONEY
      FL-NOALL
      FL-NOARTC
      FL-NODESC
      FL-OPENABLE
      FL-OPENED
      FL-PERSON
      FL-PLURAL
      FL-READABLE
		FL-SEEN
      FL-SURFACE
      FL-TAKEABLE
      FL-TOOL
      FL-TOUCHED
      FL-TRANSPARENT
      FL-TRYTAKE
      FL-VEHICLE
      FL-VOWEL
      FL-WEAPON
      FL-WORN
		FL-YOUR
      FLAG44
      FLAG45
      FLAG46
      FLAG47
      FLAG48
   )
>

;-----------------------------------------------------------------------------
; "LOCAL-GLOBALS"
;-----------------------------------------------------------------------------

<OBJECT LOCAL-GLOBALS
   (LOC GLOBAL-OBJECTS)
   (GLOBAL GLOBAL-OBJECTS)
   (SYNONYM ZZZP)
	(ADJECTIVE XXXP)
	(NORTH TO ROOMS)
	(EAST  TO ROOMS)
	(SOUTH TO ROOMS)
	(WEST  TO ROOMS)
	(NE    TO ROOMS)
	(NW    TO ROOMS)
	(SE    TO ROOMS)
	(SW    TO ROOMS)
	(IN    TO ROOMS)
	(OUT   TO ROOMS)
	(UP    TO ROOMS)
	(DOWN  TO ROOMS)
	(ACTION			0)
   (CAPACITY		0)
   (CONTFCN			0)
   (DESCFCN			0)
   (GENERIC			0)
   (VALUE			0)
   (SIZE				0)
   (MASS				0)
	(LOOKUP			0)
	(LOOKDN			0)
	(ODOR				0)
   (INSCRIPTION	0)
   (FLIPPED			0)
   (HEATED			0)
	(AUX1				0)
	(AUX2				0)
	(AUX3				0)
	(IN-ABBEY		0)
	(ADJACENT		0)
	(STRENGTH		0)
	(DEXTERITY		0)
>

;-----------------------------------------------------------------------------
; "ROOMS"
;-----------------------------------------------------------------------------

<OBJECT ROOMS
   (DESC "rooms")
   (FLAGS FL-NOARTC FL-NODESC FL-SEEN)
   (IN TO ROOMS)
>

;-----------------------------------------------------------------------------
; "TH-ROOM"
;-----------------------------------------------------------------------------

<OBJECT TH-ROOM
   (LOC GLOBAL-OBJECTS)
   (DESC "room")
   (FLAGS FL-NODESC FL-SEEN)
   (SYNONYM ROOM)
	(DESCFCN RT-DF-TH-ROOM)
>

;-----------------------------------------------------------------------------
; "TH-INTIR"
;-----------------------------------------------------------------------------

<OBJECT TH-INTDIR
   (LOC GLOBAL-OBJECTS)
   (DESC "direction")
   (FLAGS FL-NODESC FL-SEEN)
   (SYNONYM DIRECTION)
   (ADJECTIVE NORTH EAST SOUTH WEST NE NW SE SW UP DOWN IN OUT)
   (ACTION RT-AC-TH-INTDIR)
>

;-----------------------------------------------------------------------------
; "TH-NOT-HERE-OBJECT"
;-----------------------------------------------------------------------------

<OBJECT TH-NOT-HERE-OBJECT
   (DESC "that")
   (FLAGS FL-NOARTC FL-NODESC FL-SEEN)
   (ACTION RT-AC-TH-NOT-HERE-OBJECT)
>

;-----------------------------------------------------------------------------
; "TH-MINUTE"
;-----------------------------------------------------------------------------

<OBJECT TH-MINUTE
   (LOC GLOBAL-OBJECTS)
	(DESC "minute")
	(SYNONYM MINUTE MIN MINUTES MINS)
	(ADJECTIVE INTNUM)
   (ACTION RT-AC-TH-MINUTE)
>

;-----------------------------------------------------------------------------
; "TH-HOUR"
;-----------------------------------------------------------------------------

<OBJECT TH-HOUR
   (LOC GLOBAL-OBJECTS)
	(DESC "hour")
	(SYNONYM HOUR HR HOURS HRS)
	(ADJECTIVE INTNUM)
   (ACTION RT-AC-TH-HOUR)
>

;-----------------------------------------------------------------------------
; "TH-SESAME"
;-----------------------------------------------------------------------------

<OBJECT TH-SESAME
   (LOC GLOBAL-OBJECTS)
	(DESC "sesame")
	(FLAGS FL-NODESC)
	(SYNONYM SESAME)
	(ACTION RT-AC-TH-SESAME)
>

;*****************************************************************************
; "generic objects"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "TH-IT"
;-----------------------------------------------------------------------------

<OBJECT TH-IT
   (LOC GLOBAL-OBJECTS)
   (DESC "it")
   (FLAGS FL-NOARTC FL-NODESC FL-SEEN FL-VOWEL FL-TOUCHED)
   (SYNONYM IT THAT ITSELF)
>

;-----------------------------------------------------------------------------
; "TH-RIGHT"
;-----------------------------------------------------------------------------

<OBJECT TH-RIGHT
   (LOC GLOBAL-OBJECTS)
   (DESC "right")
   (FLAGS FL-NOARTC FL-NODESC FL-SEEN)
   (SYNONYM RIGHT FORWARD AHEAD CLOCKWISE)
	(ACTION RT-AC-TH-RIGHT)
>

;-----------------------------------------------------------------------------
; "TH-LEFT"
;-----------------------------------------------------------------------------

<OBJECT TH-LEFT
   (LOC GLOBAL-OBJECTS)
   (DESC "left")
   (FLAGS FL-NOARTC FL-NODESC FL-SEEN)
   (SYNONYM LEFT BACKWARD BEHIND COUNTERCL)
	(ACTION RT-AC-TH-LEFT)
>

;-----------------------------------------------------------------------------
; "TH-FLOOR"
;-----------------------------------------------------------------------------

<OBJECT TH-FLOOR
	(LOC GLOBAL-OBJECTS)
	(DESC "floor")
	(FLAGS FL-NODESC FL-SEEN FL-SURFACE)
	(SYNONYM FLOOR)
	(ACTION RT-AC-TH-FLOOR)
>

;-----------------------------------------------------------------------------
; "TH-CEILING"
;-----------------------------------------------------------------------------

<OBJECT TH-CEILING
	(LOC GLOBAL-OBJECTS)
	(DESC "ceiling")
	(FLAGS FL-NODESC FL-SEEN)
	(SYNONYM CEILING)
	(ACTION RT-AC-TH-CEILING)
   (DESCFCN RT-DF-TH-CEILING)
>

;-----------------------------------------------------------------------------
; "TH-GROUND"
;-----------------------------------------------------------------------------

<OBJECT TH-GROUND
	(LOC GLOBAL-OBJECTS)
	(DESC "ground")
	(FLAGS FL-NODESC FL-SEEN FL-SURFACE)
	(SYNONYM SURFACE GROUND GROUNDS EARTH)
	(ACTION RT-AC-TH-GROUND)
>

;-----------------------------------------------------------------------------
; "TH-SKY"
;-----------------------------------------------------------------------------

<OBJECT TH-SKY
	(LOC GLOBAL-OBJECTS)
	(DESC "sky")
	(FLAGS FL-NODESC FL-SEEN)
	(SYNONYM SKY CLOUD CLOUDS ATMOSPHERE FOG)
	(ACTION RT-AC-TH-SKY)
>

;-----------------------------------------------------------------------------
; "TH-HANDS"
;-----------------------------------------------------------------------------

<OBJECT TH-HANDS
   (LOC GLOBAL-OBJECTS)
   (DESC "hands")
   (FLAGS FL-SEEN FL-NODESC FL-TOUCHED FL-BYHAND FL-TOOL FL-PLURAL FL-BODYPART FL-YOUR FL-NOALL)
   (SYNONYM HAND HANDS PALM PALMS FINGER FINGERS THUMB THUMBS)
   (ADJECTIVE MY BARE)
	(ACTION RT-AC-TH-HANDS)
>

;-----------------------------------------------------------------------------
; "TH-FOOT"
;-----------------------------------------------------------------------------

<OBJECT TH-FOOT
   (LOC GLOBAL-OBJECTS)
   (DESC "foot")
   (FLAGS FL-SEEN FL-NODESC FL-BODYPART FL-YOUR FL-NOALL)
   (SYNONYM FOOT TOE)
   (ADJECTIVE MY BARE)
>

;-----------------------------------------------------------------------------
; "TH-WATSONS-HEART"
;-----------------------------------------------------------------------------

<OBJECT TH-WATSONS-HEART
   (LOC GLOBAL-OBJECTS)
   (DESC "heart")
   (FLAGS FL-SEEN FL-NODESC FL-BODYPART FL-YOUR FL-NOALL)
   (SYNONYM HEART HEARTBEAT)
   (ADJECTIVE MY)
	(ACTION RT-AC-TH-WATSONS-HEART)
>

;-----------------------------------------------------------------------------
; "TH-FEET"
;-----------------------------------------------------------------------------

<OBJECT TH-FEET
   (LOC GLOBAL-OBJECTS)
   (DESC "feet")
   (FLAGS FL-SEEN FL-NODESC FL-PLURAL FL-BODYPART FL-YOUR FL-NOALL)
   (SYNONYM FEET TOES)
   (ADJECTIVE MY BARE)
>

;-----------------------------------------------------------------------------
; "TH-EARS"
;-----------------------------------------------------------------------------

<OBJECT TH-EARS
   (LOC GLOBAL-OBJECTS)
   (DESC "ears")
   (FLAGS FL-SEEN FL-NODESC FL-CONTAINER FL-SURFACE FL-OPENED FL-PLURAL FL-BODYPART FL-YOUR FL-NOALL)
   (SYNONYM EAR EARS)
   (ADJECTIVE MY)
	(CAPACITY 1)
	(ACTION RT-AC-TH-EARS)
>

;-----------------------------------------------------------------------------
; "TH-HEAD"
;-----------------------------------------------------------------------------

<OBJECT TH-HEAD
	(LOC GLOBAL-OBJECTS)
	(DESC "head")
	(FLAGS FL-SEEN FL-NODESC FL-SURFACE FL-BODYPART FL-YOUR FL-NOALL)
	(SYNONYM HEAD)
	(ADJECTIVE MY)
	(ACTION RT-AC-TH-HEAD)
>

;-----------------------------------------------------------------------------
; "TH-PLAYER-BODY"
;-----------------------------------------------------------------------------

<OBJECT TH-PLAYER-BODY
	(LOC GLOBAL-OBJECTS)
	(DESC "that part of your body")
  	(SYNONYM ARM ARMS SHOULDER SHOULDERS LEG LEGS FACE MOUTH LIPS THROAT EYE EYES NOSE HAIR STOMACH BODY)
	(FLAGS FL-NOARTC FL-SEEN FL-NODESC FL-NOALL FL-BODYPART)
	(ADJECTIVE MY LEFT RIGHT)
>

;-----------------------------------------------------------------------------
; "TH-BREATH"
;-----------------------------------------------------------------------------

<OBJECT TH-BREATH
	(LOC GLOBAL-OBJECTS)
	(DESC "breath")
	(FLAGS FL-SEEN FL-NODESC FL-TRYTAKE FL-NOALL FL-YOUR FL-BODYPART)
	(SYNONYM BREATH)
	(ADJECTIVE MY DEEP)
	(ACTION RT-AC-TH-BREATH)
>

;-----------------------------------------------------------------------------
; "TH-CLOTHES"
;-----------------------------------------------------------------------------

<OBJECT TH-CLOTHES
	(LOC GLOBAL-OBJECTS)
	(DESC "clothes")
	(FLAGS FL-SEEN FL-NODESC FL-CLOTHING FL-WORN FL-YOUR FL-NOALL)
	(SYNONYM CLOTHES CLOTHING APPAREL OUTFIT)
	(SIZE 100)
	(ADJECTIVE MY)
	(ACTION RT-AC-TH-CLOTHES)
>

;-----------------------------------------------------------------------------
; "TH-WATERMARK"
;-----------------------------------------------------------------------------

<OBJECT TH-WATERMARK
	(LOC GLOBAL-OBJECTS)
	(DESC "watermark")
	(FLAGS FL-NODESC)
	(SYNONYM WATERMARK MARK)
	(ACTION RT-AC-TH-WATERMARK)
	(DESCFCN RT-DF-TH-WATERMARK)
>

;-----------------------------------------------------------------------------
; "TH-THEFT"
;-----------------------------------------------------------------------------

<OBJECT TH-THEFT
	(DESC "theft")
	(FLAGS FL-NODESC)
	(SYNONYM THEFT HEIST)
	(ACTION RT-AC-TH-THEFT)
>

;-----------------------------------------------------------------------------
; "TH-JUBILEE"
;-----------------------------------------------------------------------------

<OBJECT TH-JUBILEE
	(DESC "Jubilee")
	(FLAGS FL-NODESC)
	(SYNONYM JUBILEE CELEBRATION PARADE)
	(ACTION RT-AC-TH-JUBILEE)
>

;-----------------------------------------------------------------------------
; "TH-HENRY-IV-OBJ"
;-----------------------------------------------------------------------------

<OBJECT TH-HENRY-IV-OBJ
	(DESC "Henry IV")
	(SYNONYM HENRY IV)
	(ADJECTIVE HENRY)
	(ACTION RT-AC-TH-HENRY-IV-OBJ)
>

;-----------------------------------------------------------------------------
; "TH-WELLINGTON-OBJ"
;-----------------------------------------------------------------------------

<OBJECT TH-WELLINGTON-OBJ
	(DESC "Duke of Wellington")
	(SYNONYM DUKE WELLINGTON)
	(ADJECTIVE IRON)
	(ACTION RT-AC-TH-WELLINGTON-OBJ)
>

;-----------------------------------------------------------------------------
; "TH-TOBY-OBJ"
;-----------------------------------------------------------------------------

<OBJECT TH-TOBY-OBJ
	(DESC "Toby")
	(SYNONYM TOBY HOUND BLOODHOUND DOG)
	(ACTION RT-AC-TH-TOBY-OBJ)
>

;-----------------------------------------------------------------------------
; "TH-KIDNAPPING-OBJ"
;-----------------------------------------------------------------------------

<OBJECT TH-KIDNAPPING-OBJ
	(DESC "kidnapping")
	(SYNONYM KIDNAPPING ABDUCTION ATTACK)
	(ADJECTIVE HOLMES\' HOLMES\'S SHERLOCK)
	(ACTION RT-AC-TH-KIDNAPPING-OBJ)
>

;-----------------------------------------------------------------------------
; "TH-AGRA-TREASURE-OBJ"
;-----------------------------------------------------------------------------

<OBJECT TH-AGRA-TREASURE-OBJ
	(DESC "Agra treasure")
	(FLAGS FL-VOWEL FL-MONEY)
	(SYNONYM AGRA TREASURE)
	(ADJECTIVE AGRA)
	(ACTION RT-AC-TH-AGRA-TREASURE-OBJ)
>

;-----------------------------------------------------------------------------
; "TH-BULLET-HOLE"
;-----------------------------------------------------------------------------

<OBJECT TH-BULLET-HOLE
	(LOC GLOBAL-OBJECTS)
	(DESC "bullet hole")
	(SYNONYM HOLE HOLES)
	(ADJECTIVE BULLET)
	(ACTION RT-AC-TH-BULLET-HOLE)
>

;-----------------------------------------------------------------------------
; "TH-WIGGINS-BODY"
;-----------------------------------------------------------------------------

<OBJECT TH-WIGGINS-BODY
	(LOC GLOBAL-OBJECTS)
	(DESC "Wiggins")
  	(SYNONYM ARM ARMS SHOULDER SHOULDERS LEG LEGS HAND HANDS FOOT FEET HEAD FACE MOUTH LIPS THROAT EYE EYES EAR EARS
				NOSE HAIR HEART STOMACH BODY CLOTHES)
	(ADJECTIVE WIGGINS\' LEFT RIGHT)
	(GENERIC RT-GN-BODY)
	(FLAGS FL-NOARTC FL-NODESC)
	(ACTION RT-AC-TH-WIGGINS-BODY)
>

;-----------------------------------------------------------------------------
; "TH-HOLMES-BODY"
;-----------------------------------------------------------------------------

<OBJECT TH-HOLMES-BODY
	(LOC GLOBAL-OBJECTS)
	(DESC "Holmes")
	(SYNONYM ARM ARMS SHOULDER SHOULDERS LEG LEGS HAND HANDS FOOT FEET HEAD FACE MOUTH LIPS THROAT EYE EYES EAR EARS
				NOSE HAIR HEART STOMACH BODY CLOTHES)
	(ADJECTIVE HOLMES\' HOLMES\'S LEFT RIGHT)
	(GENERIC RT-GN-BODY)
	(FLAGS FL-NOARTC FL-NODESC)
	(ACTION RT-AC-TH-HOLMES-BODY)
>

;-----------------------------------------------------------------------------
; "TH-HUDSON-BODY"
;-----------------------------------------------------------------------------

<OBJECT TH-HUDSON-BODY
	(LOC GLOBAL-OBJECTS)
	(DESC "Mrs. Hudson")
	(SYNONYM ARM ARMS SHOULDER SHOULDERS LEG LEGS HAND HANDS FOOT FEET HEAD FACE MOUTH LIPS THROAT EYE EYES EAR EARS
				NOSE HAIR HEART STOMACH BODY CLOTHES)
	(ADJECTIVE HUDSON\'S LEFT RIGHT)
	(GENERIC RT-GN-BODY)
	(FLAGS FL-NOARTC FL-NODESC)
	(ACTION RT-AC-TH-HUDSON-BODY)
>

;-----------------------------------------------------------------------------
; "TH-ELIZA-BODY"
;-----------------------------------------------------------------------------

<OBJECT TH-ELIZA-BODY
	(LOC GLOBAL-OBJECTS)
	(DESC "girl")
	(SYNONYM ARM ARMS SHOULDER SHOULDERS LEG LEGS HAND HANDS FOOT FEET HEAD FACE LIPS THROAT EYE EYES EAR EARS
				NOSE HAIR STOMACH BODY CLOTHES)
	(ADJECTIVE HER ELIZA\'S GIRL\'S)
	(GENERIC RT-GN-BODY)
	(FLAGS FL-NODESC)
	(ACTION RT-AC-TH-ELIZA-BODY)
>

;-----------------------------------------------------------------------------
; "TH-NORTH-WALL"
;-----------------------------------------------------------------------------

<OBJECT TH-NORTH-WALL
   (LOC GLOBAL-OBJECTS)
   (DESC "north wall")
   (FLAGS FL-TRYTAKE FL-NOALL)
   (SYNONYM WALL)
	(ADJECTIVE NORTH)
	(GENERIC RT-GN-WALL)
   (ACTION RT-AC-TH-NORTH-WALL)
>

;-----------------------------------------------------------------------------
; "TH-SOUTH-WALL"
;-----------------------------------------------------------------------------

<OBJECT TH-SOUTH-WALL
   (LOC GLOBAL-OBJECTS)
   (DESC "south wall")
   (FLAGS FL-TRYTAKE FL-NOALL)
   (SYNONYM WALL)
	(ADJECTIVE SOUTH)
	(GENERIC RT-GN-WALL)
   (ACTION RT-AC-TH-SOUTH-WALL)
>

;-----------------------------------------------------------------------------
; "TH-EAST-WALL"
;-----------------------------------------------------------------------------

<OBJECT TH-EAST-WALL
   (LOC GLOBAL-OBJECTS)
   (DESC "east wall")
   (FLAGS FL-VOWEL FL-TRYTAKE FL-NOALL)
   (SYNONYM WALL)
	(ADJECTIVE EAST)
	(GENERIC RT-GN-WALL)
   (ACTION RT-AC-TH-EAST-WALL)
>

;-----------------------------------------------------------------------------
; "TH-WEST-WALL"
;-----------------------------------------------------------------------------

<OBJECT TH-WEST-WALL
   (LOC GLOBAL-OBJECTS)
   (DESC "west wall")
   (FLAGS FL-TRYTAKE FL-NOALL)
   (SYNONYM WALL)
	(ADJECTIVE WEST)
	(GENERIC RT-GN-WALL)
   (ACTION RT-AC-TH-WEST-WALL)
>

;-----------------------------------------------------------------------------
; "TH-WALLS"
;-----------------------------------------------------------------------------

<OBJECT TH-WALLS
   (LOC GLOBAL-OBJECTS)
   (DESC "walls")
   (FLAGS FL-TRYTAKE FL-NOALL FL-PLURAL)
   (SYNONYM WALLS)
   (ACTION RT-AC-TH-WALLS)
>

;*****************************************************************************
; "game objects"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "TH-POCKET"
;-----------------------------------------------------------------------------

<OBJECT TH-POCKET
   (LOC TH-WATSONS-COAT)
   (DESC "pocket")
   (FLAGS FL-SEEN FL-NODESC FL-CONTAINER FL-OPENED FL-YOUR FL-NOALL)
   (SYNONYM POCKET POCKETS)
   (ADJECTIVE MY SIDE)
   (CAPACITY 10)
	(ACTION RT-AC-TH-POCKET)
>

;-----------------------------------------------------------------------------
; "TH-GUN"
;-----------------------------------------------------------------------------

<OBJECT TH-GUN
   (LOC TH-MANTELPIECE)
   (DESC "pistol")
   (FLAGS FL-TAKEABLE FL-WEAPON)
   (SYNONYM GUN PISTOL REVOLVER)
   (SIZE 5)
	(MASS 10)
   (CAPACITY 0)
	(AUX1 6)
   (ACTION RT-AC-TH-GUN)
   (DESCFCN RT-DF-TH-GUN)
>

;-----------------------------------------------------------------------------
; "TH-KNIFE"
;-----------------------------------------------------------------------------

<OBJECT TH-KNIFE
   (LOC TH-MANTELPIECE)
   (DESC "knife")
; "FL-COLD means the knife is stuck to the mail."
   (FLAGS FL-TAKEABLE FL-WEAPON FL-KNIFE FL-OPENABLE FL-OPENED FL-COLD)
   (SYNONYM KNIFE JACKKNIFE)
   (SIZE 5)
   (ACTION RT-AC-TH-KNIFE)
   (DESCFCN RT-DF-TH-KNIFE)
>

;-----------------------------------------------------------------------------
; "TH-MAIL"
;-----------------------------------------------------------------------------

<OBJECT TH-MAIL
   (LOC TH-MANTELPIECE)
   (DESC "mail")
   (FLAGS FL-PLURAL FL-COLLECTIVE FL-TAKEABLE FL-READABLE
			 FL-BURNABLE FL-OPENABLE)
   (SYNONYM MAIL LETTER LETTERS)
   (ADJECTIVE HOLMES\' HOLMES\'S)
   (SIZE 5)
   (ACTION RT-AC-TH-MAIL)
   (DESCFCN RT-DF-TH-MAIL)
>

;-----------------------------------------------------------------------------
; "TH-MAGNIFYING-GLASS"
;-----------------------------------------------------------------------------

<OBJECT TH-MAGNIFYING-GLASS
   (LOC TH-BEDSIDE-TABLE)
   (DESC "magnifying glass")
   (FLAGS FL-TAKEABLE FL-TRANSPARENT)
   (SYNONYM GLASS LENS)
   (ADJECTIVE MAGNIFYING HOLMES\' HOLMES\'S)
   (VALUE 1)
   (SIZE 5)
   (MASS 4)
   (ACTION RT-AC-TH-MAGNIFYING-GLASS)
   (DESCFCN RT-DF-TH-MAGNIFYING-GLASS)
>

;-----------------------------------------------------------------------------
; "TH-NEWSPAPER"
;-----------------------------------------------------------------------------

<OBJECT TH-NEWSPAPER
   (LOC RM-HOLMES-STUDY)
   (DESC "newspaper")
   (FLAGS FL-TAKEABLE FL-READABLE FL-BURNABLE FL-SURFACE)
   (SYNONYM NEWSPAPER PAPER PAPERS TIMES RAG)
	(ADJECTIVE NEWSPAPER TIMES RAG NEWS)
   (VALUE 1)
   (SIZE 5)
	(CAPACITY 10)
	(GENERIC RT-GN-PAPER)
   (ACTION RT-AC-TH-NEWSPAPER)
   (DESCFCN RT-DF-TH-NEWSPAPER)
>

;-----------------------------------------------------------------------------
; "TH-PAGE"
;-----------------------------------------------------------------------------

;<OBJECT TH-PAGE
	(LOC TH-NEWSPAPER)
	(DESC "newspaper page")
	(FLAGS FL-READABLE FL-BURNABLE FL-SURFACE FL-NODESC FL-NOALL)
	(SYNONYM PAGE)
	(ADJECTIVE NEWSPAPER PAPER TIMES RAG)
	(SIZE 2)
	(ACTION RT-AC-TH-PAGE)
>

;-----------------------------------------------------------------------------
; "TH-VIOLIN"
;-----------------------------------------------------------------------------

<OBJECT TH-VIOLIN
   (LOC RM-HOLMES-STUDY)
   (DESC "violin")
   (FLAGS FL-TAKEABLE)
   (SYNONYM VIOLIN FIDDLE)
   (SIZE 5)
   (ACTION RT-AC-TH-VIOLIN)
   (DESCFCN RT-DF-TH-VIOLIN)
>

;-----------------------------------------------------------------------------
; "TH-WESTMINSTER-CLUE"
;-----------------------------------------------------------------------------

<OBJECT TH-WESTMINSTER-CLUE
   (LOC CH-PRIME-MINISTER)
   (DESC "clue paper")
   (FLAGS FL-TAKEABLE FL-READABLE FL-BURNABLE)
   (SYNONYM PAPER PAPERS VERSE POEM)
	(ADJECTIVE CLUE)
   (SIZE 1)
	(FLIPPED 0)
	(GENERIC RT-GN-PAPER)
   (ACTION RT-AC-TH-WESTMINSTER-CLUE)
   (DESCFCN RT-DF-TH-WESTMINSTER-CLUE)
>

;-----------------------------------------------------------------------------
; "TH-PHIAL"
;-----------------------------------------------------------------------------

<OBJECT TH-PHIAL
   (LOC CH-HOLMES)
   (DESC "phial")
   (FLAGS FL-TRYTAKE FL-CONTAINER FL-TRANSPARENT FL-NOALL)
   (SYNONYM PHIAL VIAL)
   (SIZE 1)
	(AUX1 0)
   (ACTION RT-AC-TH-PHIAL)
>

;-----------------------------------------------------------------------------
; "TH-TOBACCO"
;-----------------------------------------------------------------------------

;<OBJECT TH-TOBACCO
   (LOC TH-PERSIAN-SLIPPER)
   (DESC "tobacco")
   (FLAGS FL-NOARTC FL-TAKEABLE FL-NOALL FL-BURNABLE FL-COLLECTIVE)
   (SYNONYM TOBACCO SHAG)
   (VALUE 1)
   (SIZE 1)
   (ACTION RT-AC-TH-TOBACCO)
   (DESCFCN RT-DF-TH-TOBACCO)
>

;-----------------------------------------------------------------------------
; "TH-PERSIAN-SLIPPER"
;-----------------------------------------------------------------------------

<OBJECT TH-PERSIAN-SLIPPER
   (LOC TH-MANTELPIECE)
   (DESC "persian slipper")
   (FLAGS FL-TAKEABLE FL-CONTAINER FL-OPENED)
   (SYNONYM SLIPPER)
   (ADJECTIVE PERSIAN)
   (SIZE 5)
   (CAPACITY 2)
>

;-----------------------------------------------------------------------------
; "TH-PIPE"
;-----------------------------------------------------------------------------

<OBJECT TH-PIPE
   (LOC TH-MANTELPIECE)
   (DESC "pipe")
   (FLAGS FL-TAKEABLE FL-CONTAINER FL-OPENED)
   (SYNONYM PIPE MEERSCHAUM)
	(VALUE 1)
   (SIZE 5)
   (CAPACITY 1)
   (ACTION RT-AC-TH-PIPE)
   (DESCFCN RT-DF-TH-PIPE)
>

;-----------------------------------------------------------------------------
; "TH-MATCH"
;-----------------------------------------------------------------------------

<OBJECT TH-MATCH
   (LOC TH-MATCHBOOK)
   (DESC "match")
   (FLAGS FL-TAKEABLE FL-BURNABLE)
   (SYNONYM MATCH)
   (SIZE 1)
   (ACTION RT-AC-TH-MATCH)
   (DESCFCN RT-DF-TH-MATCH)
>

;-----------------------------------------------------------------------------
; "TH-WAX-HEAD"
;-----------------------------------------------------------------------------

;<OBJECT TH-WAX-HEAD
   (LOC TH-CHARLES-STATUE)
   (DESC "Charles' head")
   (FLAGS FL-NOARTC FL-TRYTAKE FL-TAKEABLE FL-NODESC)
   (SYNONYM HEAD)
   (ADJECTIVE CHARLES\' WAX)
   (VALUE 1)
   (SIZE 5)
   (CAPACITY 1)
   (ACTION RT-AC-TH-WAX-HEAD)
   (DESCFCN RT-DF-TH-WAX-HEAD)
>

;-----------------------------------------------------------------------------
; "TH-WAX-AX"
;-----------------------------------------------------------------------------

;<OBJECT TH-WAX-AX
   (LOC TH-CHARLES-STATUE)
   (DESC "axe")
   (FLAGS FL-TAKEABLE FL-NODESC FL-WEAPON)
   (SYNONYM AX BLADE AXE)
   (ADJECTIVE CHARLES\' WAX)
   (SIZE 5)
   (ACTION RT-AC-TH-WAX-AX)
   (DESCFCN RT-DF-TH-WAX-AX)
>

;-----------------------------------------------------------------------------
; "TH-TORCH"
;-----------------------------------------------------------------------------

;<OBJECT TH-TORCH
   (LOC TH-FAWKES-STATUE)
   (DESC "torch")
   (FLAGS FL-TAKEABLE FL-SURFACE FL-BURNABLE)
   (SYNONYM TORCH)
   (SIZE 5)
   (ACTION RT-AC-TH-TORCH)
   (DESCFCN RT-DF-TH-TORCH)
>

;-----------------------------------------------------------------------------
; "TH-TELESCOPE in SCOPE.ZIL"
;-----------------------------------------------------------------------------

;<OBJECT TH-TELESCOPE
   (LOC TH-BLIGH-BOAT)
   (DESC "telescope")
   (FLAGS FL-TAKEABLE FL-TRANSPARENT)
   (SYNONYM TELESCOPE SCOPE)
   (VALUE 1)
   (SIZE 5)
   (MASS 1)
   (ACTION RT-AC-TH-TELESCOPE)
   (DESCFCN RT-DF-TH-TELESCOPE)
>

;-----------------------------------------------------------------------------
; "TH-BOAT"
;-----------------------------------------------------------------------------

<OBJECT TH-BOAT
   (LOC RM-THE-EMBANKMENT)
   (DESC "old boat")
   (FLAGS FL-VOWEL FL-VEHICLE FL-CONTAINER FL-OPENED)
   (SYNONYM BOAT ROWBOAT DINGHY)
	(ADJECTIVE OLD)
   (SIZE 50)
   (CAPACITY 999)
	(AUX1 0)
   (ACTION RT-AC-TH-BOAT)
	(CONTFCN RT-CF-TH-BOAT)
   (DESCFCN RT-DF-TH-BOAT)
>

;-----------------------------------------------------------------------------
; "TH-OAR-1"
;-----------------------------------------------------------------------------

<OBJECT TH-OAR-1
   (LOC TH-BOAT)
   (DESC "weathered old oar")
   (FLAGS FL-TAKEABLE FL-NOALL)
   (SYNONYM OAR)
   (ADJECTIVE OLD WEATHERED)
   (SIZE 20)
	(GENERIC RT-GN-OAR)
   (ACTION RT-AC-TH-OAR-1)
   (DESCFCN RT-DF-TH-OAR-1)
>

;-----------------------------------------------------------------------------
; "TH-OAR-2"
;-----------------------------------------------------------------------------

<OBJECT TH-OAR-2
   (LOC TH-BLIGH-BOAT)
   (DESC "Captain Bligh's oar")
   (FLAGS FL-NOARTC FL-TAKEABLE FL-NOALL)
   (SYNONYM OAR)
   (ADJECTIVE CAPTAIN\'S BLIGH\'S)
	(VALUE 1)
   (SIZE 20)
	(GENERIC RT-GN-OAR)
>

;-----------------------------------------------------------------------------
; "TH-CLAPPER"
;-----------------------------------------------------------------------------

<OBJECT TH-CLAPPER
   (LOC TH-BELL)
   (DESC "clapper")
   (FLAGS FL-NODESC FL-TRYTAKE FL-SURFACE)
   (SYNONYM CLAPPER)
   (ACTION RT-AC-TH-CLAPPER)
   (DESCFCN RT-DF-TH-CLAPPER)
>

;-----------------------------------------------------------------------------
; "TH-COTTON-BALLS"
;-----------------------------------------------------------------------------

<OBJECT TH-COTTON-BALLS
	(LOC TH-BLUE-PILL-BOTTLE)
   (DESC "cotton balls")
   (FLAGS FL-PLURAL FL-TAKEABLE)
   (SYNONYM BALL BALLS COTTONBALL)
	(ADJECTIVE COTTON)
   (SIZE 1)
   (ACTION RT-AC-TH-COTTON-BALLS)
   (DESCFCN RT-DF-TH-COTTON-BALLS)
>

;-----------------------------------------------------------------------------
; "TH-BELL"
;-----------------------------------------------------------------------------

<OBJECT TH-BELL
   (LOC RM-CLOCK-TOWER)
   (DESC "Big Ben")
   (FLAGS FL-NODESC FL-NOARTC FL-TRYTAKE FL-CONTAINER FL-OPENED FL-NOALL)
   (SYNONYM BEN BELL)
   (ADJECTIVE BIG)
   (SIZE 50)
   (MASS 50)
   (CAPACITY 0)
	(AUX1 0)		; "Number of times to ring Big Ben."
	(AUX2 0)		; "Bell position. K-BELL-AWAY."
   (ACTION RT-AC-TH-BELL)
   (DESCFCN RT-DF-TH-BELL)
>

;-----------------------------------------------------------------------------
; "TH-STETHOSCOPE"
;-----------------------------------------------------------------------------

<OBJECT TH-STETHOSCOPE
   (LOC TH-WATSONS-HAT)
   (DESC "stethoscope")
   (FLAGS FL-CLOTHING FL-TAKEABLE)
   (SYNONYM STETHOSCOPE SS STETH)
	(ADJECTIVE MY)
   (VALUE 1)
   (SIZE 1)
   (ACTION RT-AC-TH-STETHOSCOPE)
   (DESCFCN RT-DF-TH-STETHOSCOPE)
>

;-----------------------------------------------------------------------------
; "TH-DIAL"
;-----------------------------------------------------------------------------

<OBJECT TH-DIAL
   (LOC LG-BANK-VAULT-DOOR)
   (DESC "dial")
   (FLAGS FL-NODESC FL-READABLE FL-LOCKED)
   (SYNONYM DIAL)
	(AUX1 0)
	(AUX2 0)
   (ACTION RT-AC-TH-DIAL)
   (DESCFCN RT-DF-TH-DIAL)
>

;-----------------------------------------------------------------------------
; "TH-MALMSEY"
;-----------------------------------------------------------------------------

;<OBJECT TH-MALMSEY
   (LOC TH-BUTT-OF-MALMSEY)
   (DESC "malmsey")
   (FLAGS FL-NODESC FL-PLURAL FL-COLLECTIVE FL-TRYTAKE FL-FOOD)
   (SYNONYM MALMSEY WINE)
   (CAPACITY 200)
   (ACTION RT-AC-TH-MALMSEY)
   (DESCFCN RT-DF-TH-MALMSEY)
>

;-----------------------------------------------------------------------------
; "TH-BUTT-OF-MALMSEY"
;-----------------------------------------------------------------------------

;<OBJECT TH-BUTT-OF-MALMSEY
   (LOC RM-BOWYER-TOWER)
   (DESC "butt of malmsey")
   (FLAGS FL-NODESC FL-TRYTAKE FL-CONTAINER FL-OPENED)
   (SYNONYM BUTT)
   (SIZE 50)
   (MASS 50)
   (CAPACITY 50)
   (ACTION RT-AC-TH-BUTT-OF-MALMSEY)
   (DESCFCN RT-DF-TH-BUTT-OF-MALMSEY)
>

;-----------------------------------------------------------------------------
; "TH-SUIT-OF-ARMOUR"
;-----------------------------------------------------------------------------

;<OBJECT TH-SUIT-OF-ARMOUR
   (LOC RM-DUNGEON)
   (DESC "suit of armour")
   (FLAGS FL-NODESC FL-TAKEABLE FL-CLOTHING FL-CONTAINER FL-OPENED)
   (SYNONYM ARMOUR)
   (ADJECTIVE SUIT)
   (CAPACITY 999)
   (ACTION RT-AC-TH-SUIT-OF-ARMOUR)
   (DESCFCN RT-DF-TH-SUIT-OF-ARMOUR)
>

;-----------------------------------------------------------------------------
; "TH-TEETER-TOTTER"
;-----------------------------------------------------------------------------

;<OBJECT TH-TEETER-TOTTER
   (LOC RM-OUTSIDE-BELL-TOWER)
   (DESC "teeter-totter")
   (FLAGS FL-TRYTAKE FL-SURFACE)
   (SYNONYM TOTTER SAW SEE-SAW TEETER-TOTTER)
   (ADJECTIVE TEETER SEE)
   (SIZE 5)
   (MASS 5)
   (CAPACITY 5)
   (ACTION RT-AC-TH-TEETER-TOTTER)
   (DESCFCN RT-DF-TH-TEETER-TOTTER)
>

;-----------------------------------------------------------------------------
; "TH-PORTCULLIS-CHAIN"
;-----------------------------------------------------------------------------

;<OBJECT TH-PORTCULLIS-CHAIN
   (LOC RM-INSIDE-TRAITORS-GATE)
   (DESC "chain")
   (FLAGS FL-NODESC FL-TRYTAKE)
   (SYNONYM CHAIN)
   (ACTION RT-AC-TH-PORTCULLIS-CHAIN)
   (DESCFCN RT-DF-TH-PORTCULLIS-CHAIN)
>

;-----------------------------------------------------------------------------
; "TH-WATSONS-HAT"
;-----------------------------------------------------------------------------

<OBJECT TH-WATSONS-HAT
   (LOC CH-PLAYER)
   (DESC "hat")
   (FLAGS FL-TAKEABLE FL-SEEN FL-CLOTHING FL-WORN FL-CONTAINER FL-YOUR)
   (SYNONYM HAT BOWLER)
   (SIZE 5)
   (CAPACITY 2)
   (ACTION RT-AC-TH-WATSONS-HAT)
   (DESCFCN RT-DF-TH-WATSONS-HAT)
>

;-----------------------------------------------------------------------------
; "TH-HANSOM-CAB"
;-----------------------------------------------------------------------------

;<OBJECT TH-HANSOM-CAB
   (DESC "hansom cab")
   (FLAGS FL-VEHICLE FL-CONTAINER FL-TRYTAKE)
   (SYNONYM CAB)
   (ADJECTIVE HANSOM)
   (CAPACITY 999)
   (ACTION RT-AC-TH-HANSOM-CAB)
   (DESCFCN RT-DF-TH-HANSOM-CAB)
>

;-----------------------------------------------------------------------------
; "TH-GROWLER-CAB"
;-----------------------------------------------------------------------------

;<OBJECT TH-GROWLER-CAB
   (DESC "growler cab")
   (FLAGS FL-VEHICLE FL-CONTAINER FL-TRYTAKE)
   (SYNONYM CAB)
   (ADJECTIVE GROWLER)
   (CAPACITY 999)
   (ACTION RT-AC-TH-GROWLER-CAB)
   (DESCFCN RT-DF-TH-GROWLER-CAB)
>

;-----------------------------------------------------------------------------
; "TH-CAB-WHISTLE"
;-----------------------------------------------------------------------------

;<OBJECT TH-CAB-WHISTLE
   (DESC "whistle")
   (FLAGS FL-TAKEABLE FL-CLOTHING FL-WORN)
   (SYNONYM WHISTLE)
   (SIZE 1)
   (MASS 1)
   (ACTION RT-AC-TH-CAB-WHISTLE)
   (DESCFCN RT-DF-TH-CAB-WHISTLE)
>

;-----------------------------------------------------------------------------
; "TH-ELIZAS-FLOWERS"
;-----------------------------------------------------------------------------

<OBJECT TH-ELIZAS-FLOWERS
   (LOC CH-ELIZA-DOOLITTLE)
   (DESC "flowers")
   (FLAGS FL-PLURAL FL-CONTAINER FL-OPENED FL-TAKEABLE)
   (SYNONYM FLOWERS FLOWER)
   (ADJECTIVE HER ELIZA\'S GIRL\'S)
   (SIZE 5)
   (ACTION RT-AC-TH-ELIZAS-FLOWERS)
>

;-----------------------------------------------------------------------------
; "TH-CARNATION"
;-----------------------------------------------------------------------------

<OBJECT TH-CARNATION
   (DESC "carnation")
   (FLAGS FL-TAKEABLE FL-CLOTHING)
   (SYNONYM CARNATION FLOWER)
   (ADJECTIVE GIRL\'S ELIZA\'S)
	(VALUE 5)
   (SIZE 1)
   (MASS 1)
   (ACTION RT-AC-TH-CARNATION)
>

;-----------------------------------------------------------------------------
; "TH-EMERALD"
;-----------------------------------------------------------------------------

;<OBJECT TH-EMERALD
   (LOC TH-WAX-HEAD)
   (DESC "emerald")
   (FLAGS FL-VOWEL FL-TAKEABLE FL-READABLE FL-SURFACE FL-MONEY)
   (SYNONYM EMERALD GEM GEMS)
   (ADJECTIVE EMERALD GREEN)
   (VALUE 5)
   (SIZE 1)
   (MASS 1)
   (CAPACITY 1)
	(GENERIC RT-GN-GEM)
   (ACTION RT-AC-TH-EMERALD)
   (DESCFCN RT-DF-TH-EMERALD)
>

;-----------------------------------------------------------------------------
; "TH-SAPPHIRE"
;-----------------------------------------------------------------------------

<OBJECT TH-SAPPHIRE
   (LOC TH-CLAPPER)
   (DESC "sapphire")
   (FLAGS FL-TAKEABLE FL-READABLE FL-NODESC FL-SURFACE FL-MONEY)
   (SYNONYM SAPPHIRE GEM GEMS)
	(ADJECTIVE SAPPHIRE BLUE)
   (VALUE 5)
   (SIZE 1)
   (CAPACITY 1)
	(AUX1 2)		; "Number of grabs left to remove from clapper."
	(GENERIC RT-GN-GEM)
   (ACTION RT-AC-TH-SAPPHIRE)
   (DESCFCN RT-DF-TH-SAPPHIRE)
>

;-----------------------------------------------------------------------------
; "TH-OPAL"
;-----------------------------------------------------------------------------

<OBJECT TH-OPAL
   (DESC "opal")
   (FLAGS FL-VOWEL FL-TAKEABLE FL-READABLE FL-SURFACE FL-MONEY)
   (SYNONYM OPAL GEM GEMS)
	(ADJECTIVE OPAL)
   (VALUE 5)
   (SIZE 1)
   (MASS 1)
   (CAPACITY 1)
	(GENERIC RT-GN-GEM)
   (ACTION RT-AC-TH-OPAL)
   (DESCFCN RT-DF-TH-OPAL)
>

;-----------------------------------------------------------------------------
; "TH-RUBY"
;-----------------------------------------------------------------------------

<OBJECT TH-RUBY
   (LOC TH-NELSON-STATUE)
   (DESC "ruby")
   (FLAGS FL-TAKEABLE FL-READABLE FL-SURFACE FL-MONEY)
   (SYNONYM RUBY GEM GEMS)
   (ADJECTIVE RUBY RED)
   (VALUE 5)
   (SIZE 1)
   (MASS 1)
   (CAPACITY 1)
	(GENERIC RT-GN-GEM)
   (ACTION RT-AC-TH-RUBY)
   (DESCFCN RT-DF-TH-RUBY)
>

;-----------------------------------------------------------------------------
; "TH-TOPAZ"
;-----------------------------------------------------------------------------

<OBJECT TH-TOPAZ
   (LOC TH-SAFETY-DEPOSIT-BOX)
   (DESC "topaz")
   (FLAGS FL-TAKEABLE FL-READABLE FL-SURFACE FL-MONEY)
   (SYNONYM TOPAZ GEM GEMS)
	(ADJECTIVE TOPAZ)
   (VALUE 5)
   (SIZE 1)
   (MASS 1)
   (CAPACITY 1)
	(GENERIC RT-GN-GEM)
   (ACTION RT-AC-TH-TOPAZ)
   (DESCFCN RT-DF-TH-TOPAZ)
>

;-----------------------------------------------------------------------------
; "TH-GARNET"
;-----------------------------------------------------------------------------

;<OBJECT TH-GARNET
   (LOC TH-BUTT-OF-MALMSEY)
   (DESC "garnet")
   (FLAGS FL-NODESC FL-TAKEABLE FL-READABLE FL-SURFACE FL-MONEY)
   (SYNONYM GARNET GEM GEMS)
   (VALUE 5)
   (SIZE 1)
   (MASS 1)
   (CAPACITY 1)
	(GENERIC RT-GN-GEM)
   (ACTION RT-AC-TH-GARNET)
   (DESCFCN RT-DF-TH-GARNET)
>

;-----------------------------------------------------------------------------
; "TH-RUBY-SCRATCH"
;-----------------------------------------------------------------------------

<OBJECT TH-RUBY-SCRATCH
	(LOC TH-RUBY)
	(DESC "ruby's scratch")
	(FLAGS FL-NODESC FL-READABLE FL-NOALL)
	(SYNONYM SCRATCH)
	(ADJECTIVE RUBY RUBY\'S)
	(GENERIC RT-GN-SCRATCH)
	(ACTION RT-AC-TH-RUBY-SCRATCH)
	(DESCFCN RT-DF-TH-RUBY-SCRATCH)
>

;-----------------------------------------------------------------------------
; "TH-SAPPHIRE-SCRATCH"
;-----------------------------------------------------------------------------

<OBJECT TH-SAPPHIRE-SCRATCH
	(LOC TH-SAPPHIRE)
	(DESC "sapphire's scratch")
	(FLAGS FL-NODESC FL-READABLE FL-NOALL)
	(SYNONYM SCRATCH)
	(ADJECTIVE SAPPHIRE)
	(GENERIC RT-GN-SCRATCH)
	(ACTION RT-AC-TH-SAPPHIRE-SCRATCH)
	(DESCFCN RT-DF-TH-SAPPHIRE-SCRATCH)
>

;-----------------------------------------------------------------------------
; "TH-EMERALD-SCRATCH"
;-----------------------------------------------------------------------------

<OBJECT TH-EMERALD-SCRATCH
	(LOC TH-EMERALD)
	(DESC "emerald's scratch")
	(FLAGS FL-NODESC FL-READABLE FL-NOALL FL-VOWEL)
	(SYNONYM SCRATCH)
	(ADJECTIVE EMERALD EMERALD\'S)
	(GENERIC RT-GN-SCRATCH)
	(ACTION RT-AC-TH-EMERALD-SCRATCH)
	(DESCFCN RT-DF-TH-EMERALD-SCRATCH)
>

;-----------------------------------------------------------------------------
; "TH-OPAL-SCRATCH"
;-----------------------------------------------------------------------------

<OBJECT TH-OPAL-SCRATCH
	(LOC TH-OPAL)
	(DESC "opal's scratch")
	(FLAGS FL-NODESC FL-READABLE FL-NOALL FL-VOWEL)
	(SYNONYM SCRATCH)
	(ADJECTIVE OPAL OPAL\'S)
	(GENERIC RT-GN-SCRATCH)
	(ACTION RT-AC-TH-OPAL-SCRATCH)
	(DESCFCN RT-DF-TH-OPAL-SCRATCH)
>

;-----------------------------------------------------------------------------
; "TH-TOPAZ-SCRATCH"
;-----------------------------------------------------------------------------

<OBJECT TH-TOPAZ-SCRATCH
	(LOC TH-TOPAZ)
	(DESC "topaz's scratch")
	(FLAGS FL-NODESC FL-READABLE FL-NOALL)
	(SYNONYM SCRATCH)
	(ADJECTIVE TOPAZ TOPAZ\'S)
	(GENERIC RT-GN-SCRATCH)
	(ACTION RT-AC-TH-TOPAZ-SCRATCH)
	(DESCFCN RT-DF-TH-TOPAZ-SCRATCH)
>

;-----------------------------------------------------------------------------
; "TH-GARNET-SCRATCH"
;-----------------------------------------------------------------------------

<OBJECT TH-GARNET-SCRATCH
	(LOC TH-GARNET)
	(DESC "garnet's scratch")
	(FLAGS FL-NODESC FL-READABLE FL-NOALL)
	(SYNONYM SCRATCH)
	(ADJECTIVE GARNET GARNET\'S)
	(GENERIC RT-GN-SCRATCH)
	(ACTION RT-AC-TH-GARNET-SCRATCH)
	(DESCFCN RT-DF-TH-GARNET-SCRATCH)
>

;-----------------------------------------------------------------------------
; "TH-PACQUET-OF-PAPER"
;-----------------------------------------------------------------------------

<OBJECT TH-PACQUET-OF-PAPER
   (LOC RM-NORTH-CLOISTER)
   (DESC "pacquet of paper")
   (FLAGS FL-TAKEABLE FL-CONTAINER FL-OPENABLE FL-READABLE)
   (SYNONYM PACQUET PACK PAPER PACKET)
	(ADJECTIVE PACK PAPER PACKET PACQUET)
   (VALUE 1)
   (SIZE 5)
	(AUX1 0)
   (CAPACITY 10)
	(GENERIC RT-GN-BOX)
>

;-----------------------------------------------------------------------------
; "TH-GREEN-PAPER"
;-----------------------------------------------------------------------------

<OBJECT TH-GREEN-PAPER
   (LOC TH-PACQUET-OF-PAPER)
   (DESC "green piece of paper")
   (FLAGS FL-TAKEABLE FL-SURFACE FL-READABLE FL-BURNABLE)
   (SYNONYM PAPER PAPERS)
   (ADJECTIVE PIECE GREEN)
   (SIZE 1)
   (INSCRIPTION 0)
   (FLIPPED 0)
   (HEATED 0)
   (CAPACITY 11)
	(GENERIC RT-GN-PAPER)
	(ACTION RT-AC-TH-GREEN-PAPER)
>

;-----------------------------------------------------------------------------
; "TH-WHITE-PAPER"
;-----------------------------------------------------------------------------

<OBJECT TH-WHITE-PAPER
   (LOC TH-PACQUET-OF-PAPER)
   (DESC "white piece of paper")
   (FLAGS FL-TAKEABLE FL-SURFACE FL-READABLE FL-BURNABLE)
   (SYNONYM PAPER PAPERS)
   (ADJECTIVE PIECE WHITE)
   (SIZE 1)
   (INSCRIPTION 0)
   (FLIPPED 0)
   (HEATED 0)
   (CAPACITY 11)
	(GENERIC RT-GN-PAPER)
   (ACTION RT-AC-TH-WHITE-PAPER)
>

;-----------------------------------------------------------------------------
; "TH-BLUE-PAPER"
;-----------------------------------------------------------------------------

<OBJECT TH-BLUE-PAPER
   (LOC TH-PACQUET-OF-PAPER)
   (DESC "blue piece of paper")
   (FLAGS FL-READABLE FL-SURFACE FL-TAKEABLE FL-BURNABLE)
   (SYNONYM PAPER PAPERS)
   (ADJECTIVE PIECE BLUE)
   (SIZE 1)
   (INSCRIPTION 0)
   (FLIPPED 0)
   (HEATED 0)
   (CAPACITY 11)
	(GENERIC RT-GN-PAPER)
   (ACTION RT-AC-TH-BLUE-PAPER)
>

;-----------------------------------------------------------------------------
; "TH-ORANGE-PAPER"
;-----------------------------------------------------------------------------

<OBJECT TH-ORANGE-PAPER
   (LOC TH-PACQUET-OF-PAPER)
   (DESC "orange piece of paper")
   (FLAGS FL-READABLE FL-SURFACE FL-TAKEABLE FL-BURNABLE)
   (SYNONYM PAPER PAPERS)
   (ADJECTIVE PIECE ORANGE)
   (SIZE 1)
   (INSCRIPTION 0)
   (FLIPPED 0)
   (HEATED 0)
   (CAPACITY 11)
	(GENERIC RT-GN-PAPER)
   (ACTION RT-AC-TH-ORANGE-PAPER)
>

;-----------------------------------------------------------------------------
; "TH-YELLOW-PAPER"
;-----------------------------------------------------------------------------

<OBJECT TH-YELLOW-PAPER
   (LOC TH-PACQUET-OF-PAPER)
   (DESC "yellow piece of paper")
   (FLAGS FL-READABLE FL-SURFACE FL-TAKEABLE FL-BURNABLE)
   (SYNONYM PAPER PAPERS)
   (ADJECTIVE PIECE YELLOW)
   (SIZE 1)
   (INSCRIPTION 0)
   (FLIPPED 0)
   (HEATED 0)
   (CAPACITY 11)
	(GENERIC RT-GN-PAPER)
   (ACTION RT-AC-TH-YELLOW-PAPER)
>

;-----------------------------------------------------------------------------
; "TH-BROWN-PAPER"
;-----------------------------------------------------------------------------

<OBJECT TH-BROWN-PAPER
   (LOC TH-PACQUET-OF-PAPER)
   (DESC "brown piece of paper")
   (FLAGS FL-READABLE FL-SURFACE FL-TAKEABLE FL-BURNABLE)
   (SYNONYM PAPER PAPERS)
   (ADJECTIVE PIECE BROWN)
   (SIZE 1)
   (INSCRIPTION 0)
   (FLIPPED 0)
   (HEATED 0)
   (CAPACITY 11)
	(GENERIC RT-GN-PAPER)
   (ACTION RT-AC-TH-BROWN-PAPER)
>

;-----------------------------------------------------------------------------
; "TH-BANK-OF-CANDLES"
;-----------------------------------------------------------------------------

<OBJECT TH-BANK-OF-CANDLES
	(LOC RM-EVANGELIST-CHAPEL)
	(DESC "bank of candles")
   (FLAGS FL-NODESC FL-LIGHTED FL-BURNABLE FL-TRYTAKE)
	(SYNONYM BANK CANDLES CANDLE FLAME)
   (ADJECTIVE BANK CANDLES)
   (ACTION RT-AC-TH-BANK-OF-CANDLES)
>

;-----------------------------------------------------------------------------
; "TH-CRAYON"
;-----------------------------------------------------------------------------

<OBJECT TH-CRAYON
   (LOC RM-NORTH-CLOISTER)
   (DESC "crayon")
   (FLAGS FL-TAKEABLE)
   (SYNONYM CRAYON)
   (VALUE 1)
   (SIZE 1)
   (DESCFCN RT-DF-TH-CRAYON)
>

;-----------------------------------------------------------------------------
; "TH-WATSONS-COAT"
;-----------------------------------------------------------------------------

<OBJECT TH-WATSONS-COAT
   (LOC CH-PLAYER)
   (DESC "coat")
   (FLAGS FL-CLOTHING FL-SEEN FL-TAKEABLE FL-WORN FL-CONTAINER FL-OPENED FL-YOUR)
   (SYNONYM COAT)
   (SIZE 5)
   (CAPACITY 15)
   (ACTION RT-AC-TH-WATSONS-COAT)
   (DESCFCN RT-DF-TH-WATSONS-COAT)
>

;-----------------------------------------------------------------------------
; "TH-LAPEL"
;-----------------------------------------------------------------------------

<OBJECT TH-LAPEL
   (LOC TH-WATSONS-COAT)
   (DESC "lapel")
   (FLAGS FL-SEEN FL-NODESC FL-CONTAINER FL-OPENED FL-NOALL FL-TRYTAKE FL-YOUR)
   (SYNONYM LAPEL)
   (SIZE 3)
   (CAPACITY 3)
   (ACTION RT-AC-TH-LAPEL)
>

;-----------------------------------------------------------------------------
; "TH-EDWARD-TOMB"
;-----------------------------------------------------------------------------

<OBJECT TH-EDWARD-TOMB
   (LOC RM-CONFESSOR-CHAPEL)
   (DESC "Edward the Confessor's tomb")
   (FLAGS FL-NODESC FL-NOARTC FL-READABLE FL-SURFACE FL-TRYTAKE FL-VOWEL FL-NOALL)
   (SYNONYM TOMB CONFESSOR INSCRIPTION)
   (ADJECTIVE EDWARD EDWARD\'S)
   (SIZE 5)
   (CAPACITY 1)
   (ACTION RT-AC-TH-EDWARD-TOMB)
   (DESCFCN RT-DF-TH-EDWARD-TOMB)
>

;-----------------------------------------------------------------------------
; "TH-ELIZABETH-TOMB"
;-----------------------------------------------------------------------------

<OBJECT TH-ELIZABETH-TOMB
   (LOC RM-NORTH-CHAPEL-AISLE)
   (DESC "Elizabeth I's tomb")
   (FLAGS FL-NODESC FL-NOARTC FL-READABLE FL-SURFACE FL-TRYTAKE FL-VOWEL FL-NOALL)
   (SYNONYM TOMB INSCRIPTION ELIZABETH MARY TUDOR)
   (ADJECTIVE ELIZABETH I I\'S MARY)
   (SIZE 5)
   (CAPACITY 1)
   (ACTION RT-AC-TH-ELIZABETH-TOMB)
   (DESCFCN RT-DF-TH-ELIZABETH-TOMB)
>

;-----------------------------------------------------------------------------
; "TH-NEWTON-TOMB"
;-----------------------------------------------------------------------------

<OBJECT TH-NEWTON-TOMB
   (LOC RM-NAVE)
   (DESC "Sir Isaac Newton's tomb")
   (FLAGS FL-NODESC FL-NOARTC FL-READABLE FL-SURFACE FL-TRYTAKE FL-NOALL)
   (SYNONYM TOMB INSCRIPTION SARCOPHAGUS)
   (ADJECTIVE NEWTON\'S)
   (SIZE 5)
   (CAPACITY 1)
   (ACTION RT-AC-TH-NEWTON-TOMB)
   (DESCFCN RT-DF-TH-NEWTON-TOMB)
>

;-----------------------------------------------------------------------------
; "TH-HENRY-V-TOMB"
;-----------------------------------------------------------------------------

<OBJECT TH-HENRY-V-TOMB
   (LOC RM-CONFESSOR-CHAPEL)
   (DESC "Henry V's tomb")
   (FLAGS FL-NODESC FL-NOARTC FL-READABLE FL-SURFACE FL-TRYTAKE FL-NOALL)
   (SYNONYM HENRY TOMB INSCRIPTION COFFIN EFFIGY V)
   (ADJECTIVE HENRY HENRY\'S V V\'S)
   (SIZE 5)
   (CAPACITY 1)
   (ACTION RT-AC-TH-HENRY-V-TOMB)
   (DESCFCN RT-DF-TH-HENRY-V-TOMB)
>

;-----------------------------------------------------------------------------
; "TH-POPE-TOMB"
;-----------------------------------------------------------------------------

<OBJECT TH-POPE-TOMB
   (LOC RM-SOUTH-AISLE)
   (DESC "Alexander Pope's tomb")
   (FLAGS FL-NODESC FL-NOARTC FL-READABLE FL-SURFACE FL-TRYTAKE FL-NOALL)
   (SYNONYM TOMB INSCRIPTION)
   (ADJECTIVE POPE POPE\'S)
   (SIZE 5)
   (CAPACITY 1)
   (ACTION RT-AC-TH-POPE-TOMB)
   (DESCFCN RT-DF-TH-POPE-TOMB)
>

;-----------------------------------------------------------------------------
; "TH-DICKENS-TOMB"
;-----------------------------------------------------------------------------

<OBJECT TH-DICKENS-TOMB
   (LOC RM-SOUTH-TRANSEPT)
   (DESC "Charles Dickens' tomb")
   (FLAGS FL-NODESC FL-NOARTC FL-READABLE FL-SURFACE FL-TRYTAKE FL-NOALL)
   (SYNONYM TOMB INSCRIPTION)
   (ADJECTIVE DICKENS DICKENS\')
   (SIZE 5)
   (CAPACITY 1)
   (ACTION RT-AC-TH-DICKENS-TOMB)
   (DESCFCN RT-DF-TH-DICKENS-TOMB)
>

;-----------------------------------------------------------------------------
; "TH-CHAUCER-TOMB"
;-----------------------------------------------------------------------------

<OBJECT TH-CHAUCER-TOMB
   (LOC RM-POETS-CORNER)
   (DESC "Geoffrey Chaucer's tomb")
   (FLAGS FL-NODESC FL-NOARTC FL-READABLE FL-SURFACE FL-TRYTAKE FL-NOALL)
   (SYNONYM TOMB INSCRIPTION SARCOPHAGUS)
   (ADJECTIVE CHAUCER CHAUCER\'S)
   (SIZE 5)
   (CAPACITY 1)
   (ACTION RT-AC-TH-CHAUCER-TOMB)
   (DESCFCN RT-DF-TH-CHAUCER-TOMB)
>

;-----------------------------------------------------------------------------
; "TH-ANNE-OF-CLEVES-TOMB"
;-----------------------------------------------------------------------------

<OBJECT TH-ANNE-OF-CLEVES-TOMB
   (LOC RM-SANCTUARY)
   (DESC "Anne of Cleve's tomb")
   (FLAGS FL-NODESC FL-NOARTC FL-READABLE FL-SURFACE FL-TRYTAKE FL-VOWEL FL-NOALL)
   (SYNONYM TOMB INSCRIPTION ANNE CLEVES)
   (ADJECTIVE ANNE CLEVES CLEVES\' ANNE\'S ANNES)
   (SIZE 5)
   (CAPACITY 1)
   (ACTION RT-AC-TH-ANNE-OF-CLEVES-TOMB)
   (DESCFCN RT-DF-TH-ANNE-OF-CLEVES-TOMB)
>

;-----------------------------------------------------------------------------
; "TH-INNOCENTS-TOMB"
;-----------------------------------------------------------------------------

<OBJECT TH-LITTLE-PRINCES-TOMB
   (LOC RM-INNOCENTS-CORNER)
   (DESC "tomb of the Little Princes in the Tower")
   (FLAGS FL-NODESC FL-READABLE FL-SURFACE FL-TRYTAKE FL-NOALL)
   (SYNONYM TOMB URN INSCRIPTION SARCOPHAGUS)
   (ADJECTIVE LITTLE PRINCES PRINCES\')
   (SIZE 5)
   (CAPACITY 1)
   (ACTION RT-AC-TH-LITTLE-PRINCES-TOMB)
   (DESCFCN RT-DF-TH-LITTLE-PRINCES-TOMB)
>

;-----------------------------------------------------------------------------
; "TH-MARY-QUEEN-OF-SCOTS-TOMB"
;-----------------------------------------------------------------------------

<OBJECT TH-MARY-QUEEN-OF-SCOTS-TOMB
   (LOC RM-SOUTH-CHAPEL-AISLE)
   (DESC "Mary, Queen of Scots' tomb")
   (FLAGS FL-NODESC FL-NOARTC FL-READABLE FL-SURFACE FL-TRYTAKE FL-NOALL)
   (SYNONYM TOMB INSCRIPTION SARCOPHAGUS MARY SCOTS EFFIGY)
   (ADJECTIVE MARY SCOTS SCOTS\' MARY\'S QUEEN)
   (SIZE 5)
   (CAPACITY 1)
   (ACTION RT-AC-TH-MARY-QUEEN-OF-SCOTS-TOMB)
   (DESCFCN RT-DF-TH-MARY-QUEEN-OF-SCOTS-TOMB)
>

;-----------------------------------------------------------------------------
; "TH-HENRY-VII-TOMB"
;-----------------------------------------------------------------------------

<OBJECT TH-HENRY-VII-TOMB
   (LOC RM-HENRY-VII-CHAPEL)
   (DESC "Henry VII's tomb")
   (FLAGS FL-NODESC FL-NOARTC FL-READABLE FL-SURFACE FL-TRYTAKE FL-NOALL)
   (SYNONYM TOMB INSCRIPTION ELIZABETH YORK HENRY VII)
   (ADJECTIVE HENRY VII HENRY\'S VII\'S ELIZABETH YORK)
   (SIZE 5)
   (CAPACITY 1)
   (ACTION RT-AC-TH-HENRY-VII-TOMB)
   (DESCFCN RT-DF-TH-HENRY-VII-TOMB)
>

;-----------------------------------------------------------------------------
; "TH-PITT-TOMB"
;-----------------------------------------------------------------------------

<OBJECT TH-PITT-TOMB
   (LOC RM-NORTH-TRANSEPT)
   (DESC "Pitt the Younger's tomb")
   (FLAGS FL-NODESC FL-NOARTC FL-READABLE FL-SURFACE FL-TRYTAKE FL-NOALL)
   (SYNONYM TOMB INSCRIPTION)
   (ADJECTIVE PITT YOUNGER PITT\'S)
   (SIZE 5)
   (CAPACITY 1)
   (ACTION RT-AC-TH-PITT-TOMB)
   (DESCFCN RT-DF-TH-PITT-TOMB)
>

;-----------------------------------------------------------------------------
; "TH-FIGURES"
;-----------------------------------------------------------------------------

<OBJECT TH-FIGURES
   (LOC RM-NORTH-TRANSEPT)
   (DESC "allegorical figures")
   (FLAGS FL-NODESC FL-NOALL FL-VOWEL FL-PLURAL)
   (SYNONYM FIGURES FIGURE)
   (ADJECTIVE ALLEGORICAL)
   (DESCFCN RT-DF-TH-FIGURES)
>

;-----------------------------------------------------------------------------
; "TH-VERE-TOMB"
;-----------------------------------------------------------------------------

<OBJECT TH-VERE-TOMB
   (LOC RM-EVANGELIST-CHAPEL)
   (DESC "Sir Francis Vere's tomb")
   (FLAGS FL-NODESC FL-NOARTC FL-READABLE FL-SURFACE FL-TRYTAKE FL-NOALL)
   (SYNONYM TOMB INSCRIPTION EFFIGY) 
   (ADJECTIVE VERE VERE\'S)
   (SIZE 5)
   (CAPACITY 1)
   (ACTION RT-AC-TH-VERE-TOMB)
   (DESCFCN RT-DF-TH-VERE-TOMB)
>

;-----------------------------------------------------------------------------
; "TH-LAMP"
;-----------------------------------------------------------------------------

<OBJECT TH-LAMP
   (LOC TH-BEDSIDE-TABLE)
   (DESC "lamp")
   (FLAGS FL-LAMP FL-ASLEEP FL-TAKEABLE)
   (SYNONYM LAMP LANTERN LIGHT)
   (ADJECTIVE BRASS LIGHT)
   (VALUE 3)
   (SIZE 5)
   (MASS 4)
   (ACTION RT-AC-TH-LAMP)
   (DESCFCN RT-DF-TH-LAMP)
>

;-----------------------------------------------------------------------------
; "TH-CLUMP-OF-MOSS"
;-----------------------------------------------------------------------------

<OBJECT TH-CLUMP-OF-MOSS
   (LOC RM-THAMES-THREE)
   (DESC "clump of moss")
   (FLAGS FL-CONTAINER FL-NODESC FL-OPENED FL-TAKEABLE FL-TRYTAKE)
   (SYNONYM MOSS CLUMP)
   (ADJECTIVE CLUMP MOSS)
   (SIZE 5)
   (CAPACITY 1)
   (ACTION RT-AC-TH-CLUMP-OF-MOSS)
   (DESCFCN RT-DF-TH-CLUMP-OF-MOSS)
>

;-----------------------------------------------------------------------------
; "TH-BLIGH-BOAT"
;-----------------------------------------------------------------------------

<OBJECT TH-BLIGH-BOAT
   (LOC RM-THE-BLACK-MUSEUM)
   (DESC "Captain Bligh's boat")
   (FLAGS FL-NODESC FL-CONTAINER FL-OPENED FL-TRYTAKE FL-NOARTC FL-NOALL)
   (SYNONYM BOAT ROWBOAT)
   (ADJECTIVE BLIGH BLIGH\'S)
   (SIZE 50)
   (CAPACITY 999)
   (DESCFCN RT-DF-TH-BLIGH-BOAT)
>

;-----------------------------------------------------------------------------
; "TH-ANCHOR"
;-----------------------------------------------------------------------------

<OBJECT TH-ANCHOR
   (LOC LG-WATER)
   (DESC "anchor")
   (FLAGS FL-TRYTAKE FL-TAKEABLE FL-VOWEL)
   (SYNONYM ANCHOR)
   (SIZE 5)
   (MASS 5)
   (ACTION RT-AC-TH-ANCHOR)
   (DESCFCN RT-DF-TH-ANCHOR)
>

;-----------------------------------------------------------------------------
; "TH-NELSON-STATUE"
;-----------------------------------------------------------------------------

<OBJECT TH-NELSON-STATUE
   (LOC TH-NELSON-COLUMN)
   (DESC "statue of Admiral Lord Nelson")
   (FLAGS FL-NODESC FL-CONTAINER FL-TRYTAKE FL-NOALL)
   (SYNONYM NELSON STATUE)
   (ADJECTIVE NELSON ADMIRAL LORD NELSON\'S)
   (CAPACITY 5)
   (ACTION RT-AC-TH-NELSON-STATUE)
   (DESCFCN RT-DF-TH-NELSON-STATUE)
>

;-----------------------------------------------------------------------------
; "TH-BUNG"
;-----------------------------------------------------------------------------

;<OBJECT TH-BUNG
   (LOC TH-BUTT-OF-MALMSEY)
   (DESC "bung")
   (FLAGS FL-TAKEABLE FL-TRYTAKE)
   (SYNONYM BUNG STOPPER CORK)
   (SIZE 5)
   (MASS 3)
   (ACTION RT-AC-TH-BUNG)
   (DESCFCN RT-DF-TH-BUNG)
>

;-----------------------------------------------------------------------------
; "TH-MACE"
;-----------------------------------------------------------------------------

;<OBJECT TH-MACE
   (LOC RM-JEWEL-ROOM)
   (DESC "mace")
   (FLAGS FL-TAKEABLE FL-WEAPON FL-NOALL)
   (SYNONYM MACE)
   (SIZE 15)
   (MASS 15)
   (ACTION RT-AC-TH-MACE)
   (DESCFCN RT-DF-TH-MACE)
>

;-----------------------------------------------------------------------------
; "TH-CROWN-JEWELS"
;-----------------------------------------------------------------------------

<OBJECT TH-CROWN-JEWELS
   (LOC TH-MORIARTY-DESK)
   (DESC "Crown Jewels")
   (FLAGS FL-PLURAL FL-TAKEABLE FL-TRYTAKE FL-MONEY)
   (SYNONYM JEWELS REGALIA DIAMOND SCEPTRE)
   (ADJECTIVE CROWN)
   (VALUE 10)
   (SIZE 10)
   (MASS 10)
   (ACTION RT-AC-TH-CROWN-JEWELS)
   (DESCFCN RT-DF-TH-CROWN-JEWELS)
>

;-----------------------------------------------------------------------------
; "TH-LAIR-KEY"
;-----------------------------------------------------------------------------

<OBJECT TH-LAIR-KEY
	(LOC TH-MORIARTY-DESK)
	(DESC "Moriarty's key")
	(FLAGS FL-KEY FL-TAKEABLE FL-NOARTC)
	(SYNONYM KEY)
	(ADJECTIVE MORIARTY)
	(SIZE 1)
>

;-----------------------------------------------------------------------------
; "TH-ETHERIUM-AMPOULE"
;-----------------------------------------------------------------------------

<OBJECT TH-ETHERIUM-AMPOULE
   (LOC TH-WORKBENCH)
   (DESC "ampoule of etherium")
   (FLAGS FL-CONTAINER FL-OPENABLE FL-TAKEABLE FL-VOWEL FL-READABLE)
   (SYNONYM AMPOULE ETHERIUM AMPULE LABEL)
	(ADJECTIVE ETHERIUM)
   (SIZE 2)
   (MASS 1)
   (ACTION RT-AC-TH-ETHERIUM-AMPOULE)
>

;-----------------------------------------------------------------------------
; "TH-LAB-EQUIPMENT"
;-----------------------------------------------------------------------------

<OBJECT TH-LAB-EQUIPMENT
   (LOC TH-WORKBENCH)
   (DESC "laboratory equipment")
   (FLAGS FL-TRYTAKE FL-PLURAL FL-NOALL)
   (SYNONYM EQUIPMENT BEAKERS TESTUBES PIPETTES EXPERIMENT)
	(ADJECTIVE LABORATORY LAB)
   (ACTION RT-AC-TH-LAB-EQUIPMENT)
   (DESCFCN RT-DF-TH-LAB-EQUIPMENT)
>

;-----------------------------------------------------------------------------
; "TH-BROKEN-AMPOULE"
;-----------------------------------------------------------------------------

<OBJECT TH-BROKEN-AMPOULE
	(DESC "broken ampoule")
	(FLAGS FL-TAKEABLE FL-READABLE)
	(SYNONYM AMPOULE AMPULE)
	(ADJECTIVE BROKEN ETHERIUM)
	(SIZE 2)
	(MASS 1)
   (ACTION RT-AC-TH-BROKEN-AMPOULE)
>

;-----------------------------------------------------------------------------
; "TH-ETHERIUM-GAS"
;-----------------------------------------------------------------------------

<OBJECT TH-ETHERIUM-GAS
	(LOC TH-ETHERIUM-AMPOULE)
	(DESC "etherium")
	(FLAGS FL-TRANSPARENT FL-NODESC FL-VOWEL)
	(SYNONYM GAS ETHERIUM)
	(ACTION RT-AC-TH-ETHERIUM-GAS)
	(DESCFCN RT-DF-TH-ETHERIUM-GAS)
>

;-----------------------------------------------------------------------------
; "TH-MANTELPIECE"
;-----------------------------------------------------------------------------

<OBJECT TH-MANTELPIECE
   (LOC RM-HOLMES-STUDY)
   (DESC "mantelpiece")
   (FLAGS FL-NODESC FL-SURFACE FL-TRYTAKE FL-NOALL)
   (SYNONYM MANTELPIECE MANTEL SHELF MANTLEPIECE MANTLE)
   (SIZE 50)
   (CAPACITY 50)
>

;-----------------------------------------------------------------------------
; "TH-WORKBENCH"
;-----------------------------------------------------------------------------

<OBJECT TH-WORKBENCH
   (LOC RM-HOLMES-BEDROOM)
   (DESC "workbench")
   (FLAGS FL-NODESC FL-SURFACE FL-TRYTAKE FL-NOALL)
   (SYNONYM WORKBENCH BENCH)
	(ADJECTIVE WORK)
   (SIZE 50)
   (CAPACITY 50)
>

;-----------------------------------------------------------------------------
; "TH-BLACK-BAG"
;-----------------------------------------------------------------------------

<OBJECT TH-BLACK-BAG
   (LOC CH-PLAYER)
   (DESC "black bag")
   (FLAGS FL-CONTAINER FL-SEEN FL-OPENABLE FL-TAKEABLE)
   (SYNONYM BAG)
   (ADJECTIVE BLACK MEDICAL)
   (SIZE 15)
   (CAPACITY 999)
   (ACTION RT-AC-TH-BLACK-BAG)
   (DESCFCN RT-DF-TH-BLACK-BAG)
>

;-----------------------------------------------------------------------------
; "TH-CHARLES-STATUE"
;-----------------------------------------------------------------------------

<OBJECT TH-CHARLES-STATUE
   (LOC RM-CHAMBER-OF-HORRORS)
   (DESC "statue of Charles I")
   (FLAGS FL-NODESC FL-SURFACE FL-TRYTAKE FL-NOALL)
   (SYNONYM CHARLES CHARLES\' STATUE I WAX)
   (ADJECTIVE CHARLES WAX)
	(GENERIC RT-GN-WAX)
   (DESCFCN RT-DF-TH-CHARLES-STATUE)
>

;-----------------------------------------------------------------------------
; "TH-WILLIAM-STATUE"
;-----------------------------------------------------------------------------

<OBJECT TH-WILLIAM-STATUE
   (LOC RM-MADAME-TUSSAUDS)
   (DESC "statue of William the Conqueror")
   (FLAGS FL-NODESC FL-SURFACE FL-TRYTAKE FL-NOALL)
   (SYNONYM WILLIAM CONQUEROR STATUE WAX)
   (ADJECTIVE WILLIAM WAX WILLIAM\'S)
	(GENERIC RT-GN-WAX)
   (DESCFCN RT-DF-TH-WILLIAM-STATUE)
>

;-----------------------------------------------------------------------------
; "TH-WALTER-STATUE"
;-----------------------------------------------------------------------------

<OBJECT TH-WALTER-STATUE
   (LOC RM-MADAME-TUSSAUDS)
   (DESC "statue of Sir Walter Raleigh")
   (FLAGS FL-NODESC FL-SURFACE FL-TRYTAKE FL-NOALL)
   (SYNONYM WALTER RALEIGH STATUE WAX)
   (ADJECTIVE SIR WALTER RALEIGH WAX WALTER\'S RALEIGH\'S)
	(GENERIC RT-GN-WAX)
   (DESCFCN RT-DF-TH-WALTER-STATUE)
>

;-----------------------------------------------------------------------------
; "TH-ELIZABETH-STATUE"
;-----------------------------------------------------------------------------

<OBJECT TH-ELIZABETH-STATUE
   (LOC RM-MADAME-TUSSAUDS)
   (DESC "figure of Queen Elizabeth")
   (FLAGS FL-NODESC FL-SURFACE FL-TRYTAKE FL-NOALL)
   (SYNONYM FIGURE ELIZABETH WAX)
   (ADJECTIVE QUEEN)
	(GENERIC RT-GN-WAX)
   (DESCFCN RT-DF-TH-ELIZABETH-STATUE)
>

;-----------------------------------------------------------------------------
; "TH-THOMAS-STATUE"
;-----------------------------------------------------------------------------

<OBJECT TH-THOMAS-STATUE
   (LOC RM-CHAMBER-OF-HORRORS)
   (DESC "statue of Saint Thomas Becket")
   (FLAGS FL-NODESC FL-SURFACE FL-TRYTAKE FL-NOALL)
   (SYNONYM THOMAS BECKET STATUE WAX)
   (ADJECTIVE SAINT THOMAS BECKET WAX BECKET\'S)
	(GENERIC RT-GN-WAX)
   (DESCFCN RT-DF-TH-THOMAS-STATUE)
>

;-----------------------------------------------------------------------------
; "TH-DRAKE-STATUE"
;-----------------------------------------------------------------------------

<OBJECT TH-DRAKE-STATUE
   (LOC RM-MADAME-TUSSAUDS)
   (DESC "statue of Sir Francis Drake")
   (FLAGS FL-NODESC FL-SURFACE FL-TRYTAKE FL-NOALL)
   (SYNONYM FRANCIS DRAKE STATUE WAX)
   (ADJECTIVE SIR FRANCIS DRAKE WAX DRAKE\'S)
	(GENERIC RT-GN-WAX)
   (DESCFCN RT-DF-TH-DRAKE-STATUE)
>

;-----------------------------------------------------------------------------
; "TH-JOHN-STATUE"
;-----------------------------------------------------------------------------

<OBJECT TH-JOHN-STATUE
   (LOC RM-MADAME-TUSSAUDS)
   (DESC "statue of King John")
   (FLAGS FL-NODESC FL-SURFACE FL-TRYTAKE FL-NOALL)
   (SYNONYM JOHN STATUE WAX)
   (ADJECTIVE KING JOHN WAX JOHN\'S)
	(GENERIC RT-GN-WAX)
   (DESCFCN RT-DF-TH-JOHN-STATUE)
>

;-----------------------------------------------------------------------------
; "TH-FAWKES-STATUE"
;-----------------------------------------------------------------------------

<OBJECT TH-FAWKES-STATUE
   (LOC RM-CHAMBER-OF-HORRORS)
   (DESC "statue of Guy Fawkes")
   (FLAGS FL-NODESC FL-SURFACE FL-TRYTAKE FL-NOALL)
   (SYNONYM FAWKES STATUE WAX)
   (ADJECTIVE GUY WAX FAWKES\' GUY\'S)
	(GENERIC RT-GN-WAX)
   (DESCFCN RT-DF-TH-FAWKES-STATUE)
>

;-----------------------------------------------------------------------------
; "TH-NELSON-COLUMN"
;-----------------------------------------------------------------------------

<OBJECT TH-NELSON-COLUMN
   (LOC RM-TRAFALGAR-SQUARE)
   (DESC "Nelson's Column")
   (FLAGS FL-NODESC FL-READABLE FL-SURFACE FL-NOARTC FL-TRYTAKE FL-NOALL)
   (SYNONYM COLUMN MONUMENT)
   (ADJECTIVE NELSON NELSON\'S)
   (SIZE 100)
   (MASS 100)
   (CAPACITY 100)
   (DESCFCN RT-DF-TH-NELSON-COLUMN)
>

;-----------------------------------------------------------------------------
; "TH-ROPE"
;-----------------------------------------------------------------------------

<OBJECT TH-ROPE
   (LOC RM-LAIR)
   (DESC "rope")
   (FLAGS FL-TAKEABLE FL-NOALL)
   (SYNONYM ROPE)
   (SIZE 15)
   (MASS 3)
	(AUX1 -1)		; "First person tied up."
	(AUX2 -1)		; "Second person tied up."
   (ACTION RT-AC-TH-ROPE)
   (DESCFCN RT-DF-TH-ROPE)
>

;-----------------------------------------------------------------------------
; "TH-LIQUID"
;-----------------------------------------------------------------------------

<OBJECT TH-LIQUID
   (LOC TH-PHIAL)
   (DESC "clear, colourless liquid")
   (SYNONYM LIQUID DRUG COCAINE)
	(ADJECTIVE CLEAR COLOURLESS)
   (SIZE 1)
	(AUX1 0)
   (ACTION RT-AC-TH-LIQUID)
   (DESCFCN RT-DF-TH-LIQUID)
>

;-----------------------------------------------------------------------------
; "TH-SYRINGE"
;-----------------------------------------------------------------------------

<OBJECT TH-SYRINGE
   (LOC TH-MOROCCO-CASE)
   (DESC "syringe")
   (SYNONYM SYRINGE NEEDLE)
   (ADJECTIVE HYPODERMIC)
   (SIZE 1)
   (CAPACITY 5)
   (ACTION RT-AC-TH-SYRINGE)
>

;-----------------------------------------------------------------------------
; "TH-MOROCCO-CASE"
;-----------------------------------------------------------------------------

<OBJECT TH-MOROCCO-CASE
   (LOC TH-SOFA)
   (FLAGS FL-OPENED FL-CONTAINER FL-NOALL FL-TAKEABLE FL-OPENABLE)
   (DESC "morocco case")
   (SYNONYM CASE)
   (ADJECTIVE MOROCCO)
   (SIZE 5)
   (ACTION RT-AC-TH-MOROCCO-CASE)
>

;-----------------------------------------------------------------------------
; "TH-DEAD-PIGEON"
;-----------------------------------------------------------------------------

<OBJECT TH-DEAD-PIGEON
	(DESC "dead pigeon")
	(FLAGS FL-TAKEABLE)
	(SYNONYM PIGEON BIRD FOWL)
	(ADJECTIVE DEAD)
	(SIZE 5)
	(VALUE 0)
	(CAPACITY 0)
	(MASS 5)
	(GENERIC RT-GN-PIGEON)
	(ACTION RT-AC-TH-DEAD-PIGEON)
>

;-----------------------------------------------------------------------------
; "TH-RED-GLASS"
;-----------------------------------------------------------------------------

<OBJECT TH-RED-GLASS
	(DESC "red piece of glass")
	(FLAGS FL-TAKEABLE)
	(SYNONYM GLASS)
	(ADJECTIVE RED)
	(SIZE 5)
	(ACTION RT-AC-TH-RED-GLASS)
	(DESCFCN RT-DF-TH-RED-GLASS)
>

;-----------------------------------------------------------------------------
; "TH-PIGEONS"
;-----------------------------------------------------------------------------

<OBJECT TH-PIGEONS
	(LOC RM-TRAFALGAR-SQUARE)
	(DESC "pigeons")
	(FLAGS FL-NODESC FL-PLURAL FL-ALIVE FL-TRYTAKE)
	(SYNONYM PIGEONS BIRDS)
	(ADJECTIVE FLOCK GROUP BUNCH GAGGLE)
	(SIZE 50)
	(MASS 250)
	(ACTION RT-AC-TH-PIGEONS)
	(DESCFCN RT-DF-TH-PIGEONS)
>

;-----------------------------------------------------------------------------
; "TH-BEDSIDE-TABLE"
;-----------------------------------------------------------------------------

<OBJECT TH-BEDSIDE-TABLE
   (LOC RM-HOLMES-BEDROOM)
   (DESC "bedside table")
   (FLAGS FL-NODESC FL-SURFACE FL-TRYTAKE)
   (SYNONYM TABLE NIGHTSTAND)
	(ADJECTIVE BEDSIDE)
   (SIZE 15)
   (CAPACITY 50)
>

;-----------------------------------------------------------------------------
; "TH-BED"
;-----------------------------------------------------------------------------

<OBJECT TH-BED
   (LOC RM-HOLMES-BEDROOM)
   (DESC "bed")
   (FLAGS FL-NODESC FL-SURFACE FL-TRYTAKE FL-NOALL)
   (SYNONYM BED)
	(ADJECTIVE SHERLOCK HOLMES\' HOLMES\'S)
   (SIZE 15)
   (CAPACITY 999)
   (ACTION RT-AC-TH-BED)
>

;-----------------------------------------------------------------------------
; "TH-MATCHBOOK"
;-----------------------------------------------------------------------------

<OBJECT TH-MATCHBOOK
   (LOC RM-PARLOUR)
   (DESC "matchbook")
   (FLAGS FL-CONTAINER FL-TAKEABLE FL-OPENABLE FL-READABLE FL-BURNABLE)
   (SYNONYM BOOK MATCHES MATCHBOOK)
   (VALUE 1)
   (SIZE 5)
   (CAPACITY 1)
   (ACTION RT-AC-TH-MATCHBOOK)
>

;-----------------------------------------------------------------------------
; "TH-PICTURES"
;-----------------------------------------------------------------------------

<OBJECT TH-PICTURES
   (LOC RM-HOLMES-BEDROOM)
   (DESC "pictures")
   (FLAGS FL-NODESC FL-PLURAL FL-TRYTAKE)
   (SYNONYM PICTURES CRIMINAL PICTURE CRIMINALS)
   (ACTION RT-AC-TH-PICTURES)
   (DESCFCN RT-DF-TH-PICTURES)
>

;-----------------------------------------------------------------------------
; "TH-PADDLE"
;-----------------------------------------------------------------------------

<OBJECT TH-PADDLE
   (LOC RM-INSIDE-TRAITORS-GATE)
   (DESC "paddle")
   (FLAGS FL-TAKEABLE)
   (SYNONYM PADDLE)
   (VALUE 1)
	(SIZE 15)
>

;-----------------------------------------------------------------------------
; "TH-OAR-LOCK"
;-----------------------------------------------------------------------------

<OBJECT TH-OAR-LOCK
	(LOC TH-BOAT)
	(DESC "oarlock")
	(FLAGS FL-NODESC FL-CONTAINER FL-OPENED)
	(SYNONYM OARLOCK)
	(CAPACITY 100)
   (ACTION RT-AC-TH-OAR-LOCK)
>

;-----------------------------------------------------------------------------
; "TH-CLUE-BOOK"
;-----------------------------------------------------------------------------

<OBJECT TH-CLUE-BOOK
	(LOC TH-LIBRARY-TABLE)
	(DESC "old book")
	(FLAGS FL-CONTAINER FL-OPENABLE FL-TAKEABLE FL-SURFACE FL-BURNABLE FL-READABLE)
	(SYNONYM BOOK)
	(ADJECTIVE OLD)
	(SIZE 5)
   (ACTION RT-AC-TH-CLUE-BOOK)
   (DESCFCN RT-DF-TH-CLUE-BOOK)
>

;-----------------------------------------------------------------------------
; "TH-BOOK-PAGE"
;-----------------------------------------------------------------------------

<OBJECT TH-BOOK-PAGE
	(LOC TH-CLUE-BOOK)
	(DESC "book page")
	(FLAGS FL-READABLE FL-BURNABLE FL-SURFACE FL-NODESC FL-NOALL)
	(SYNONYM PAGE INTRODUCTION)
	(ADJECTIVE BOOK)
	(SIZE 2)
	(ACTION RT-AC-TH-BOOK-PAGE)
	(DESCFCN RT-DF-TH-BOOK-PAGE)
>

;-----------------------------------------------------------------------------
; "TH-PRAMS"
;-----------------------------------------------------------------------------

<OBJECT TH-PRAMS
	(LOC RM-KENSINGTON-GARDENS)
	(DESC "prams")
	(FLAGS FL-CONTAINER FL-OPENABLE FL-NODESC FL-PLURAL)
	(SYNONYM PRAMS PERAMBULATOR PRAM)
	(CAPACITY 20)
   (ACTION RT-AC-TH-PRAMS)
>

;-----------------------------------------------------------------------------
; "TH-PARK-FLOWERS"
;-----------------------------------------------------------------------------

<OBJECT TH-PARK-FLOWERS
	(LOC RM-KENSINGTON-GARDENS)
	(DESC "flowers")
	(FLAGS FL-TRYTAKE FL-NODESC FL-PLURAL)
	(SYNONYM FLOWERS FLOWER ROSE ROSES DAISIES PETUNIAS
				PEONIES MARIGOLDS DAFFODILS)
   (ACTION RT-AC-TH-PARK-FLOWERS)
   (DESCFCN RT-DF-TH-PARK-FLOWERS)
>

;-----------------------------------------------------------------------------
; "TH-ARCH"
;-----------------------------------------------------------------------------

<OBJECT TH-ARCH
	(LOC RM-HYDE-PARK-CORNER)
	(DESC "arch")
	(FLAGS FL-NODESC FL-VOWEL FL-NOALL)
	(SYNONYM ARCH)
   (ACTION RT-AC-TH-ARCH)
   (DESCFCN RT-DF-TH-ARCH)
>

;-----------------------------------------------------------------------------
; "TH-SHAFT"
;-----------------------------------------------------------------------------

<OBJECT TH-SHAFT
	(LOC RM-CLOCK-TOWER)
	(DESC "shaft")
	(FLAGS FL-NODESC FL-CONTAINER FL-NOALL)
	(SYNONYM SHAFT)
   (CAPACITY 999)
   (ACTION RT-AC-TH-SHAFT)
>

;-----------------------------------------------------------------------------
; "TH-FIREPLACE"
;-----------------------------------------------------------------------------

<OBJECT TH-FIREPLACE
	(LOC RM-HOLMES-STUDY)
	(DESC "fireplace")
	(FLAGS FL-NODESC FL-CONTAINER FL-OPENED FL-NOALL)
	(SYNONYM FIREPLACE)
   (CAPACITY 50)
	(ACTION RT-AC-TH-FIREPLACE)
>

;-----------------------------------------------------------------------------
; "TH-FIRE"
;-----------------------------------------------------------------------------

<OBJECT TH-FIRE
	(LOC TH-FIREPLACE)
	(DESC "fire")
	(FLAGS FL-NODESC FL-BURNABLE FL-LIGHTED FL-NOALL)
	(SYNONYM FIRE FLAME)
	(ACTION RT-AC-TH-FIRE)
>

;-----------------------------------------------------------------------------
; "TH-GAS-LIGHT"
;-----------------------------------------------------------------------------

<OBJECT TH-GAS-LIGHT
	(LOC RM-ENTRY-HALL)
	(DESC "gas light")
	(FLAGS FL-NODESC FL-BURNABLE FL-LIGHTED FL-NOALL)
	(SYNONYM LIGHT GASLIGHT)
	(ADJECTIVE GAS)
	(ACTION RT-AC-TH-GAS-LIGHT)
>

;-----------------------------------------------------------------------------
; "TH-CHARIOT"
;-----------------------------------------------------------------------------

<OBJECT TH-CHARIOT
	(LOC RM-HYDE-PARK-CORNER)
	(DESC "chariot")
	(FLAGS FL-NODESC)
	(SYNONYM CHARIOT)
	(ACTION RT-AC-TH-CHARIOT)
>

;-----------------------------------------------------------------------------
; "TH-LIBRARY-TABLE"
;-----------------------------------------------------------------------------

<OBJECT TH-LIBRARY-TABLE
   (LOC RM-MANUSCRIPT-ROOM)
   (DESC "table")
   (FLAGS FL-NODESC FL-SURFACE FL-TRYTAKE)
   (SYNONYM TABLE)
   (SIZE 15)
   (CAPACITY 50)
>

;-----------------------------------------------------------------------------
; "TH-JEWEL-CASE"
;-----------------------------------------------------------------------------

<OBJECT TH-JEWEL-CASE
   (LOC RM-JEWEL-ROOM)
   (DESC "jewel case")
   (FLAGS FL-NODESC FL-CONTAINER FL-TRYTAKE FL-OPENED FL-NOALL)
   (SYNONYM CASE)
	(ADJECTIVE JEWEL)
   (SIZE 15)
   (CAPACITY 50)
   (ACTION RT-AC-TH-JEWEL-CASE)
   (DESCFCN RT-DF-TH-JEWEL-CASE)
>

;-----------------------------------------------------------------------------
; "TH-INSTRUMENTS"
;-----------------------------------------------------------------------------

<OBJECT TH-INSTRUMENTS
	(LOC RM-TORTURE-ROOM)
	(DESC "instruments of torture")
	(FLAGS FL-TRYTAKE FL-NODESC FL-PLURAL)
	(SYNONYM INSTRUMENTS)
>

;-----------------------------------------------------------------------------
; "TH-ELIZAS-HEART"
;-----------------------------------------------------------------------------

<OBJECT TH-ELIZAS-HEART
	(LOC CH-ELIZA-DOOLITTLE)
	(DESC "girl's heart")
	(FLAGS FL-NODESC)
	(SYNONYM HEART HEARTBEAT)
	(ADJECTIVE HER ELIZA\'S GIRL\'S)
	(GENERIC RT-GN-BODY)
   (ACTION RT-AC-TH-ELIZAS-HEART)
   (DESCFCN RT-DF-TH-ELIZAS-HEART)
>

;-----------------------------------------------------------------------------
; "TH-ELIZAS-MOUTH"
;-----------------------------------------------------------------------------

<OBJECT TH-ELIZAS-MOUTH
	(LOC CH-ELIZA-DOOLITTLE)
	(DESC "girl's mouth")
	(FLAGS FL-NODESC FL-CONTAINER FL-OPENED FL-OPENABLE)
	(SYNONYM MOUTH)
	(ADJECTIVE HER ELIZA\'S GIRL\'S)
	(CAPACITY 1)
	(GENERIC RT-GN-BODY)
   (ACTION RT-AC-TH-ELIZAS-MOUTH)
>

;-----------------------------------------------------------------------------
; "TH-DIAGRAM"
;-----------------------------------------------------------------------------

<OBJECT TH-DIAGRAM
	(LOC RM-NAVE)
	(DESC "diagram")
	(FLAGS FL-NODESC)
	(SYNONYM DIAGRAM SYSTEM)
	(ADJECTIVE SOLAR)
>

;-----------------------------------------------------------------------------
; "TH-RUBBINGS"
;-----------------------------------------------------------------------------

<OBJECT TH-RUBBINGS
	(LOC RM-NORTH-CLOISTER)
	(DESC "rubbings")
	(FLAGS FL-NODESC FL-PLURAL FL-READABLE)
	(SYNONYM RUBBING RUBBINGS)
	(ADJECTIVE BRASS)
	(ACTION RT-AC-TH-RUBBINGS)
   (DESCFCN RT-DF-TH-RUBBINGS)
>

;-----------------------------------------------------------------------------
; "TH-SOFA"
;-----------------------------------------------------------------------------

<OBJECT TH-SOFA
   (LOC RM-HOLMES-STUDY)
   (DESC "sofa")
   (FLAGS FL-NODESC FL-SURFACE FL-TRYTAKE FL-NOALL)
   (SYNONYM SOFA COUCH SETEE)
   (SIZE 15)
   (CAPACITY 999)
   (ACTION RT-AC-TH-SOFA)
>

;-----------------------------------------------------------------------------
; "TH-NEWTON-STATUE"
;-----------------------------------------------------------------------------

<OBJECT TH-NEWTON-STATUE
   (LOC TH-NEWTON-TOMB)
   (DESC "statue of Sir Isaac Newton")
   (FLAGS FL-NODESC FL-TRYTAKE FL-NOALL)
   (SYNONYM STATUE)
   (ADJECTIVE NEWTON NEWTON\'S)
   (DESCFCN RT-DF-TH-NEWTON-STATUE)
>

;-----------------------------------------------------------------------------
; "TH-CHERUBS"
;-----------------------------------------------------------------------------

<OBJECT TH-CHERUBS
   (LOC TH-NEWTON-TOMB)
   (DESC "cherubs")
   (FLAGS FL-NODESC FL-TRYTAKE FL-NOALL)
   (SYNONYM CHERUB CHERUBS ANGELS ANGEL)
   (ADJECTIVE NEWTON NEWTON\'S)
   (DESCFCN RT-DF-TH-CHERUBS)
>

;-----------------------------------------------------------------------------
; "TH-MARQUEES"
;-----------------------------------------------------------------------------

<OBJECT TH-MARQUEES
	(LOC RM-THE-STRAND)
	(DESC "marquees")
	(FLAGS FL-NODESC FL-PLURAL FL-NOALL FL-READABLE)
	(SYNONYM MARQUEES THEATRES THEATRE MARQUEE THEATER THEATERS)
   (ACTION RT-AC-TH-MARQUEES)
   (DESCFCN RT-DF-TH-MARQUEES)
>

;-----------------------------------------------------------------------------
; "TH-PANELLING"
;-----------------------------------------------------------------------------

<OBJECT TH-PANELLING
	(LOC RM-JERUSALEM-CHAMBER)
	(DESC "walls")
	(FLAGS FL-NODESC FL-NOALL FL-PLURAL)
	(SYNONYM PANELLING OAK CEDAR TAPESTRIES)
>

;-----------------------------------------------------------------------------
; "TH-SUPPORTS"
;-----------------------------------------------------------------------------

<OBJECT TH-SUPPORTS
	(LOC RM-THAMES-THREE)
	(DESC "supports")
	(FLAGS FL-NODESC FL-PLURAL FL-NOALL)
	(SYNONYM SUPPORTS SUPERSTRUCTURE CROSSBARS STRUTS)
   (ACTION RT-AC-TH-SUPPORTS)
>

;-----------------------------------------------------------------------------
; "TH-ASH"
;-----------------------------------------------------------------------------

<OBJECT TH-ASH
	(LOC RM-MADAME-TUSSAUDS)
	(DESC "ash")
	(FLAGS FL-NODESC FL-NOALL FL-ASLEEP FL-TAKEABLE FL-VOWEL FL-PLURAL FL-COLLECTIVE)
	(SYNONYM SPECK ASH)
   (ADJECTIVE TRICHINOPOLY FLAKE SPECK)
   (ACTION RT-AC-TH-ASH)
   (DESCFCN RT-DF-TH-ASH)
>

;-----------------------------------------------------------------------------
; "TH-CIGARETTE"
;-----------------------------------------------------------------------------

<OBJECT TH-CIGARETTE
	(LOC CH-TUSSAUDS-GUARD)
	(DESC "cigarette")
	(FLAGS FL-LIGHTED FL-BURNABLE FL-TRYTAKE)
	(SYNONYM CIGARETTE CIGARET)
	(ADJECTIVE GUARD\'S)
   (ACTION RT-AC-TH-CIGARETTE)
>

;-----------------------------------------------------------------------------
; "TH-TURBAN"
;-----------------------------------------------------------------------------

<OBJECT TH-TURBAN
	(LOC CH-AKBAR)
	(DESC "turban")
	(FLAGS FL-NODESC FL-NOALL)
	(SYNONYM TURBAN)
   (ACTION RT-AC-TH-TURBAN)
>

;-----------------------------------------------------------------------------
; "TH-KNIGHTS"
;-----------------------------------------------------------------------------

<OBJECT TH-KNIGHTS
   (LOC TH-VERE-TOMB)
   (DESC "knights")
   (FLAGS FL-NODESC FL-TRYTAKE FL-NOALL FL-PLURAL)
   (SYNONYM KNIGHTS KNIGHT)
>

;-----------------------------------------------------------------------------
; "TH-VERE-ARMOUR"
;-----------------------------------------------------------------------------

<OBJECT TH-VERE-ARMOUR
   (LOC TH-VERE-TOMB)
   (DESC "armour")
   (FLAGS FL-NODESC FL-TRYTAKE FL-NOALL FL-PLURAL FL-COLLECTIVE)
   (SYNONYM SUIT ARMOUR ARMOR)
	(ADJECTIVE SUIT ARMOUR ARMOR)
   (ACTION RT-AC-TH-VERE-ARMOUR)
>

;-----------------------------------------------------------------------------
; "TH-ANCHOR-CHAIN"
;-----------------------------------------------------------------------------

<OBJECT TH-ANCHOR-CHAIN
	(LOC TH-BOAT)
	(DESC "anchor chain")
	(FLAGS FL-NODESC FL-CONTAINER FL-OPENED FL-VOWEL)
	(SYNONYM CHAIN)
	(SIZE 5)
	(ADJECTIVE ANCHOR)
   (ACTION RT-AC-TH-ANCHOR-CHAIN)
>

;-----------------------------------------------------------------------------
; "TH-WAX-OBJECT-1 (IN MADAME TUSSAUDS)"
;-----------------------------------------------------------------------------

<OBJECT TH-WAX-OBJECT-1
   (LOC RM-MADAME-TUSSAUDS)
   (DESC "that part of the statue")
   (FLAGS FL-TRYTAKE FL-NOALL FL-NODESC FL-NOARTC)
   (SYNONYM	SAND BOWLS CLOAK MUD MEADOW WAX)
	(ADJECTIVE WAX)
	(GENERIC RT-GN-WAX)
   (ACTION RT-AC-TH-WAX-OBJECT-1)
   (DESCFCN RT-DF-TH-WAX-OBJECT-1)
>

;-----------------------------------------------------------------------------
; "TH-WAX-OBJECT-2 (IN CHAMBER OF HORRORS)"
;-----------------------------------------------------------------------------

<OBJECT TH-WAX-OBJECT-2
   (LOC RM-CHAMBER-OF-HORRORS)
   (DESC "that part of the statue")
   (FLAGS FL-TRYTAKE FL-NOALL FL-NODESC FL-NOARTC)
   (SYNONYM BARREL BARRELS BLOCK EXECUTIONER MUD KNIGHTS
				KNIGHT SWORD SWORDS ALTAR GUNPOWDER WAX)
	(ADJECTIVE WAX)
	(GENERIC RT-GN-WAX)
   (ACTION RT-AC-TH-WAX-OBJECT-2)
   (DESCFCN RT-DF-TH-WAX-OBJECT-2)
>

;-----------------------------------------------------------------------------
; "TH-LIBRARY-OBJ"
;-----------------------------------------------------------------------------

<OBJECT TH-LIBRARY-OBJ
   (LOC RM-MANUSCRIPT-ROOM)
   (DESC "things in the library")
   (FLAGS FL-TRYTAKE FL-NOALL FL-NODESC FL-PLURAL FL-READABLE)
   (SYNONYM DESK BOOKS CASES CASE BOOKSHELVES BOOKCASE)
	(ADJECTIVE DUSTY)
   (ACTION RT-AC-TH-LIBRARY-OBJ)
   (DESCFCN RT-DF-TH-LIBRARY-OBJ)
>

;-----------------------------------------------------------------------------
; "TH-RAILING"
;-----------------------------------------------------------------------------

<OBJECT TH-RAILING
   (LOC RM-CLOCK-TOWER)
   (DESC "railing")
   (FLAGS FL-NODESC FL-SURFACE FL-TRYTAKE FL-NOALL)
   (SYNONYM RAILING RAIL)
   (SIZE 50)
   (CAPACITY 50)
   (ACTION RT-AC-TH-RAILING)
>

;-----------------------------------------------------------------------------
; "TH-OPIUM-GAS"
;-----------------------------------------------------------------------------

<OBJECT TH-OPIUM-GAS
	(LOC RM-BAR-OF-GOLD)
	(DESC "opium")
	(FLAGS FL-TRANSPARENT FL-NODESC FL-VOWEL FL-BUYABLE FL-PLURAL FL-COLLECTIVE)
	(SYNONYM GAS OPIUM FUMES)
	(ACTION RT-AC-TH-OPIUM-GAS)
	(DESCFCN RT-DF-TH-OPIUM-GAS)
>

;-----------------------------------------------------------------------------
; "TH-PRODUCE"
;-----------------------------------------------------------------------------

<OBJECT TH-PRODUCE
   (LOC RM-COVENT-GARDEN)
   (DESC "produce")
   (FLAGS FL-NODESC FL-TRYTAKE FL-NOALL FL-BUYABLE FL-PLURAL FL-COLLECTIVE)
   (SYNONYM PRODUCE APPLES ORANGES FRUIT FRUITS VEGETABLES PEAS)
	(ADJECTIVE GIANT)
   (SIZE 50)
   (ACTION RT-AC-TH-PRODUCE)
   (DESCFCN RT-DF-TH-PRODUCE)
>

;-----------------------------------------------------------------------------
; "TH-TRINKETS"
;-----------------------------------------------------------------------------

<OBJECT TH-TRINKETS
   (LOC CH-VENDOR)
   (DESC "trinkets")
   (FLAGS FL-TRYTAKE FL-BUYABLE FL-PLURAL FL-NODESC FL-NOALL)
   (SYNONYM TRINKETS BAUBLES TRINKET)
	(SIZE 15)
   (ACTION RT-AC-TH-TRINKETS)
   (DESCFCN RT-DF-TH-TRINKETS)
>

;-----------------------------------------------------------------------------
; "TH-GUARDS-KEYS"
;-----------------------------------------------------------------------------

<OBJECT TH-GUARDS-KEYS
	(LOC TH-GUARDS-POCKET)
	(DESC "keys")
	(FLAGS FL-TAKEABLE FL-PLURAL)
	(SYNONYM KEYS)
	(ADJECTIVE GUARD\'S)
	(ACTION RT-AC-TH-GUARDS-KEYS)
	(DESCFCN RT-DF-TH-GUARDS-KEYS)
>

;-----------------------------------------------------------------------------
; "TH-MORIARTY-DESK"
;-----------------------------------------------------------------------------

<OBJECT TH-MORIARTY-DESK
   (LOC RM-LAIR)
   (DESC "desk")
   (FLAGS FL-TRYTAKE FL-NOALL FL-NODESC FL-SURFACE)
   (SYNONYM DESK TABLE)
	(ADJECTIVE MORIARTY)
   (SIZE 15)
   (CAPACITY 50)
>

;-----------------------------------------------------------------------------
; "TH-NELSON-EYE"
;-----------------------------------------------------------------------------

<OBJECT TH-NELSON-EYE
   (LOC TH-NELSON-COLUMN)
   (DESC "Nelson's blind eye")
   (FLAGS FL-NOARTC FL-NODESC FL-TRYTAKE FL-NOALL)
   (SYNONYM EYE)
   (ADJECTIVE NELSON ADMIRAL LORD NELSON\'S BLIND)
   (ACTION RT-AC-TH-NELSON-EYE)
   (DESCFCN RT-DF-TH-NELSON-EYE)
>

;-----------------------------------------------------------------------------
; "TH-UNINTERESTING-OBJECT"
;-----------------------------------------------------------------------------

<OBJECT TH-UNINTERESTING-OBJECT
   (LOC RM-SIGN-OF-RED-HERRING)
   (DESC "uninteresting object")
   (FLAGS FL-NODESC FL-TRYTAKE)
   (SYNONYM OBJECT)
	(ADJECTIVE UNINTERESTING)
   (ACTION RT-AC-TH-UNINTERESTING-OBJECT)
   (DESCFCN RT-DF-TH-UNINTERESTING-OBJECT)
>

;*****************************************************************************
; "end of file"
;*****************************************************************************

