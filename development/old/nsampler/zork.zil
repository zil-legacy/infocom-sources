			    "ZORK for
			    SAMPLER II
	(c) Copyright 1984 Infocom, Inc.  All Rights Reserved."

<ROUTINE GO-ZORK ()
	<SETG GAME-FLAG 1>
	<SETUP-ZORK>
	<QUEUE I-FIGHT -1>
	<PUT ,DEF1-RES 1 <REST ,DEF1 2>>
	<PUT ,DEF1-RES 2 <REST ,DEF1 4>>
	<PUT ,DEF2-RES 2 <REST ,DEF2B 2>>
	<PUT ,DEF2-RES 3 <REST ,DEF2B 4>>
	<PUT ,DEF3-RES 1 <REST ,DEF3A 2>>
	<PUT ,DEF3-RES 3 <REST ,DEF3B 2>>
	<SETG HERE ,ZORK-ROOM>
	<USL>
	<GIVE-ZORK-INSTRUCTIONS>
	<SETG HERE ,WEST-OF-HOUSE>
	<MOVE ,PROTAGONIST ,HERE>
	<THIS-IS-IT ,MAILBOX>
	<COND (<NOT <FSET? ,HERE ,TOUCHBIT>>
	       <CRLF>
	       <V-VERSION>
	       <CRLF>)>
	<V-LOOK>>

<ROUTINE SETUP-ZORK ()
	 <GENERAL-SETUP>
	 <SETG HS 0>
	 <SETG LAMP-LIFE 300>
	 <SETG T-PROB 0>
	 <SETG TROLL-FIGHT <>>
	 <SETG GRUE-DEATH <>>
	 <SETG TROLL-FLAG <>>
	 <SETG LUCKY T>
	 <SETG KITCHEN-WINDOW-FLAG 2>
	 <SETG RUG-MOVED <>>
	 <SETG GRATE-REVEALED <>>
	 <SETG FALSE-FLAG <>>
	 <MOVE ,SANDWICH-BAG ,KITCHEN-TABLE>
	 <MOVE ,BOTTLE ,KITCHEN-TABLE>
	 <MOVE ,LUNCH ,SANDWICH-BAG>
	 <MOVE ,GARLIC ,SANDWICH-BAG>
	 <MOVE ,AXE ,TROLL>
	 <MOVE ,KNIFE ,ATTIC>
	 <MOVE ,LAMP ,LIVING-ROOM>
	 <MOVE ,SWORD ,LIVING-ROOM>
	 <MOVE ,ZORK-WATER ,BOTTLE>
	 <MOVE ,ADVERTISEMENT ,MAILBOX>
	 <MOVE ,ZORK-PAINTING ,GALLERY>
	 <MOVE ,LEAVES ,GRATING-CLEARING>
	 <MOVE ,ZORK-ROPE ,ATTIC>
	 <MOVE ,TROLL ,TROLL-ROOM>
	 <MOVE ,OWNERS-MANUAL ,STUDIO>
	 <MOVE ,NEST ,UP-A-TREE>
	 <MOVE ,EGG ,NEST>
	 ;<MOVE ,CANARY ,EGG>
	 <MOVE ,BROKEN-CANARY ,EGG>
	 ;<REMOVE ,BROKEN-LAMP>
	 ;<REMOVE ,BROKEN-EGG>
	 <FSET ,TRAP-DOOR ,INVISIBLE>
	 <PUTP ,ZORK-PAINTING ,P?VALUE 4>
	 <PUTP ,ZORK-PAINTING ,P?TVALUE 6>
	 <PUTP ,ZORK-PAINTING ,P?LDESC 
		"A painting by a neglected genius is here.">
	 <PUTP ,EGG ,P?SDESC "jewel-encrusted egg">
	 <PUTP ,EGG ,P?TVALUE 5>
	 <PUTP ,LAMP ,P?SDESC "brass lantern">
	 <PUTP ,LAMP ,P?ACTION ,LANTERN>
	 <PUTP ,TROLL ,P?STRENGTH 2>
	 <PUTP ,PROTAGONIST ,P?STRENGTH 0>
	 <FSET ,ATTIC-TABLE ,NDESCBIT>>

<ROOM ZORK-ROOM
      (IN ROOMS)
      (DESC "Zork I")>

<ROUTINE GIVE-ZORK-INSTRUCTIONS ()
	 <CRLF>
	 <TELL 
"Briefly, here are the instructions for Zork I: The Great Underground
Empire. You, a treasure hunter, have heard of a nearby underground labyrinth
that contains vast amounts of treasure. Naturally, you wish to obtain as much
as possible. To measure your success in this treasure hunt, a score is kept.
You get points both for finding treasures and for placing them in the trophy
case that you will find during the story. Obstacles will lie in your way, but
you can overcome them by observation and clear thinking.|
|
You start the story in front of a large white house, with the entrance to
the underground hidden nearby. In this sample of Zork I, your
goal is to find your way underground and get past a rather nasty obstacle to
reach the main underground chambers.|
|
Happy Zorking, and h" ,HIT-RETURN "begin...">
	 <READ ,P-INBUF ,P-LEXV>>

<OBJECT BOARD
	(IN LOCAL-GLOBALS)
	(SYNONYM BOARDS BOARD)
	(DESC "board")
	(FLAGS NDESCBIT)
	(ACTION BOARD-F)>

<OBJECT WALL
	(IN GLOBAL-OBJECTS)
	(SYNONYM WALL WALLS)
	;(ADJECTIVE SURROUNDING)
	(DESC "walls")
	(FLAGS PLURALBIT)
	(ACTION WALL-F)>

<ROUTINE WALL-F ()
	 <COND (<AND <OR <PRSO? ,WALL>
		    	 <PRSI? ,WALL>>
		     <NOT <INDOORS?>>
		     <NOT <EQUAL? ,HERE ,INSIDE-GRAVE>>>
		<TELL ,YOU-CANT-SEE-ANY D ,WALL " here.">)>>

<OBJECT SONGBIRD
	(IN LOCAL-GLOBALS)
	(SYNONYM BIRD SONGBIRD)
	(ADJECTIVE SONG)
	(DESC "songbird")
	(FLAGS NDESCBIT)
	(ACTION SONGBIRD-F)>

<OBJECT WHITE-HOUSE	
	(IN LOCAL-GLOBALS)
	(SYNONYM HOUSE)
	(ADJECTIVE WHITE)
	(DESC "white house")
	(FLAGS NDESCBIT)
	(ACTION WHITE-HOUSE-F)>

<OBJECT FOREST
	(IN LOCAL-GLOBALS)
	(SYNONYM FOREST TREES PINES HEMLOCKS)
	(DESC "forest")
	(FLAGS NDESCBIT)
	(ACTION FOREST-F)>

<OBJECT TREE
	(IN LOCAL-GLOBALS)
	(SYNONYM TREE BRANCH)
	(ADJECTIVE LARGE)
	(DESC "tree")
	(FLAGS NDESCBIT CLIMBBIT)
	(ACTION TREE-F)>

<ROUTINE TREE-F ()
	 <COND (<VERB? CLIMB-DOWN>
		<DO-WALK ,P?DOWN>
		<RTRUE>)
	       (<VERB? CLIMB-UP CLIMB>
		<DO-WALK ,P?UP>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<OBJECT MOUNTAIN-RANGE
	(IN MOUNTAINS)
	(DESC "mountain range")
	(SYNONYM RANGE)
	(ADJECTIVE FLATHEAD MOUNTAIN)
	(FLAGS NDESCBIT CLIMBBIT)
	(ACTION MOUNTAIN-RANGE-F)>

<OBJECT ZORK-WATER
	(IN BOTTLE)
	(SYNONYM WATER LIQUID H2O)
	(ADJECTIVE QUANTI)
	(DESC "quantity of water")
	(FLAGS TRYTAKEBIT TAKEBIT DRINKBIT)
	(ACTION ZORK-WATER-F)
	(GENERIC GENERIC-WATER-F)
	(SIZE 4)>

<OBJECT KITCHEN-WINDOW
	(IN LOCAL-GLOBALS)
	(SYNONYM WINDOW)
	(ADJECTIVE KITCHEN SMALL)
	(DESC "kitchen window")
	(FLAGS NDESCBIT DOORBIT)
	(ACTION KITCHEN-WINDOW-F)>

<OBJECT CHIMNEY
	(IN LOCAL-GLOBALS)
	(SYNONYM CHIMNEY)
	(ADJECTIVE DARK NARROW)
	(DESC "chimney")
	(ACTION CHIMNEY-F)
	(FLAGS CLIMBBIT NDESCBIT)>

<OBJECT LUNCH
	(IN SANDWICH-BAG)
	(SYNONYM FOOD SANDWICH LUNCH DINNER)
	(ADJECTIVE HOT PEPPER)
	(DESC "lunch")
	(FLAGS TAKEBIT)
	(LDESC "A hot pepper sandwich is here.")
	(ACTION LUNCH-F)>

<OBJECT AXE
	(IN TROLL)
	(SYNONYM AXE AX)
	(ADJECTIVE BLOODY)
	(DESC "bloody axe")
	(FLAGS WEAPONBIT TRYTAKEBIT TAKEBIT NDESCBIT)
	(ACTION AXE-F)
	(SIZE 25)>

;<OBJECT BROKEN-LAMP
	(SYNONYM LAMP LANTERN)
	(ADJECTIVE BROKEN)
	(DESC "broken lantern")
	(FLAGS TAKEBIT)>

<OBJECT	SLIDE
	(IN LOCAL-GLOBALS)
	(SYNONYM CHUTE RAMP SLIDE)
	(ADJECTIVE STEEP METAL)
	(DESC "chute")
	(FLAGS CLIMBBIT)
	(ACTION SLIDE-FUNCTION)>

<OBJECT KITCHEN-TABLE
	(IN KITCHEN)
	(SYNONYM TABLE)
	(ADJECTIVE KITCHEN)
	(DESC "kitchen table")
	(FLAGS NDESCBIT CONTBIT SEARCHBIT OPENBIT SURFACEBIT)
	(CAPACITY 50)>

<OBJECT ATTIC-TABLE
	(IN ATTIC)
	(SYNONYM TABLE)
	(DESC "table")
	(FLAGS NDESCBIT CONTBIT SEARCHBIT OPENBIT SURFACEBIT)
	(CAPACITY 40)>

<OBJECT SANDWICH-BAG
	(IN KITCHEN-TABLE)
	(SYNONYM BAG SACK)
	(ADJECTIVE BROWN ELONGATED SMELLY)
	(DESC "brown sack")
	(FLAGS TAKEBIT CONTBIT SEARCHBIT ;BURNBIT)
	(FDESC
"On the table is an elongated brown sack, smelling of hot peppers.")
	(CAPACITY 15)
	(SIZE 3)
	(ACTION SANDWICH-BAG-FCN)>

<OBJECT TROPHY-CASE	;"first obj so L.R. desc looks right."
	(IN LIVING-ROOM)
	(SYNONYM CASE)
	(ADJECTIVE TROPHY)
	(DESC "trophy case")
	(FLAGS TRANSBIT CONTBIT NDESCBIT TRYTAKEBIT SEARCHBIT)
	(ACTION TROPHY-CASE-FCN)
	(CAPACITY 10000)>

<OBJECT RUG
	(IN LIVING-ROOM)
	(SYNONYM RUG CARPET)
	(ADJECTIVE LARGE ORIENTAL)
	(DESC "carpet")
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION RUG-FCN)>

<OBJECT GARLIC
	(IN SANDWICH-BAG)
	(SYNONYM GARLIC)
	(ADJECTIVE CLOVE)
	(DESC "clove of garlic")
	(FLAGS TAKEBIT)
	(ACTION GARLIC-F)>

<OBJECT TRAP-DOOR
	(IN LIVING-ROOM)
	(SYNONYM DOOR TRAPDOOR TRAP-DOOR COVER)
	(ADJECTIVE TRAP DUSTY)
	(DESC "trap door")
	(FLAGS NDESCBIT INVISIBLE DOORBIT)
	(ACTION TRAP-DOOR-FCN)>

<OBJECT BOARDED-WINDOW
	(IN LOCAL-GLOBALS)
        (SYNONYM WINDOW)
	(ADJECTIVE BOARDED)
	(DESC "boarded window")
	(FLAGS NDESCBIT)
	(ACTION BOARDED-WINDOW-FCN)>

<OBJECT FRONT-DOOR
	(IN WEST-OF-HOUSE)
	(SYNONYM DOOR)
	(ADJECTIVE FRONT BOARDED)
	(DESC "door")
	(FLAGS NDESCBIT DOORBIT)
	(ACTION FRONT-DOOR-FCN)>

<OBJECT BOTTLE
	(IN KITCHEN-TABLE)
	(SYNONYM BOTTLE CONTAINER)
	(ADJECTIVE CLEAR GLASS)
	(DESC "glass bottle")
	(FLAGS TAKEBIT TRANSBIT CONTBIT SEARCHBIT)
	(ACTION BOTTLE-FUNCTION)
	(FDESC "A bottle is sitting on the table.")
	(CAPACITY 4)>

;<OBJECT CRACK
	(IN LOCAL-GLOBALS)
	(SYNONYM CRACK)
	(ADJECTIVE NARROW)
	(DESC "crack")
	(FLAGS NDESCBIT)
	(ACTION CRACK-FCN)>

<OBJECT GRATE
	(IN LOCAL-GLOBALS)
	(SYNONYM GRATE GRATING)
	(DESC "grating")
	(FLAGS NDESCBIT INVISIBLE DOORBIT)
	(ACTION GRATE-FUNCTION)>

<OBJECT KNIFE
	(IN ATTIC-TABLE)
	(SYNONYM KNIVES KNIFE BLADE)
	(ADJECTIVE NASTY)
	(DESC "nasty knife")
	(FLAGS TAKEBIT WEAPONBIT TRYTAKEBIT)
	(FDESC "On a table is a nasty-looking knife.")
	(ACTION KNIFE-F)>

<OBJECT LAMP
	(IN LIVING-ROOM)
	(SYNONYM LAMP LANTERN LIGHT)
	(ADJECTIVE BRASS BROKEN)
	(SDESC "")
	(FLAGS TAKEBIT LIGHTBIT)
	(ACTION LANTERN)
	(FDESC "A battery-powered brass lantern is on the trophy case.")
	(LDESC "There is a brass lantern (battery-powered) here.")
	(SIZE 15)>

<OBJECT ADVERTISEMENT
	(IN MAILBOX)
	(SYNONYM ADVERTISEMENT LEAFLET BOOKLET MAIL)
	(ADJECTIVE SMALL)
	(DESC "leaflet")
	(FLAGS READBIT TAKEBIT ;BURNBIT)
	(LDESC "A small leaflet is on the ground.")
	(TEXT
"\"WELCOME TO ZORK!|
|
ZORK is a game of adventure, danger, and low cunning. In it you
will explore some of the most amazing territory ever seen by mortals.
No computer should be without one!\"")
	(SIZE 2)>

<OBJECT MAILBOX
	(IN WEST-OF-HOUSE)
	(SYNONYM MAILBOX BOX)
	(ADJECTIVE SMALL)
	(DESC "small mailbox")
	(FLAGS CONTBIT SEARCHBIT TRYTAKEBIT)
	(CAPACITY 10)
	(ACTION MAILBOX-F)>

<OBJECT ZORK-PAINTING
	(IN GALLERY)
	(SYNONYM PAINTING ART CANVAS TREASURE)
	(ADJECTIVE BEAUTI)
	(DESC "painting")
	(FLAGS TAKEBIT ;BURNBIT)
	(ACTION ZORK-PAINTING-FCN)
	(FDESC
"Fortunately, there is still one chance for you to be a vandal, for on
the far wall is a painting of unparalleled beauty.")
	(LDESC "")
	(SIZE 15)
	(VALUE 4)
	(TVALUE 6)>

<OBJECT LEAVES
	(IN GRATING-CLEARING)
	(SYNONYM LEAVES LEAF)
	(ADJECTIVE PILE)
	(DESC "pile of leaves")
	(FLAGS TAKEBIT ;BURNBIT TRYTAKEBIT)
	(ACTION LEAF-PILE)
	(LDESC "On the ground is a pile of leaves.")
	(SIZE 25)>

<OBJECT RAINBOW
	(IN LOCAL-GLOBALS)
	(SYNONYM RAINBOW)
	(DESC "rainbow")
	(FLAGS NDESCBIT CLIMBBIT)
	(ACTION RAINBOW-FCN)>

<OBJECT RIVER
	(IN LOCAL-GLOBALS)
	(DESC "river")
	(SYNONYM RIVER)
	(ADJECTIVE FRIGID)
	(ACTION RIVER-FUNCTION)
	(FLAGS NDESCBIT)>

<OBJECT ZORK-ROPE
	(IN ATTIC)
	(SYNONYM ROPE HEMP)
	(ADJECTIVE LARGE COIL)
	(DESC "rope")
	(FLAGS TAKEBIT TRYTAKEBIT)
	(ACTION ROPE-FUNCTION)
	(FDESC "A large coil of rope is lying in the corner.")
	(SIZE 10)>

<OBJECT WOODEN-DOOR
	(IN LIVING-ROOM)
	(SYNONYM DOOR LETTER WRITING)
	(ADJECTIVE WOODEN GOTHIC)
	(DESC "wooden door")
	(FLAGS READBIT NDESCBIT TRANSBIT DOORBIT)
	(ACTION FRONT-DOOR-FCN)
	(TEXT
"The engravings translate to \"This space intentionally left blank.\"")>

<OBJECT SWORD
	(IN LIVING-ROOM)
	(SYNONYM SWORD BLADE)
	(ADJECTIVE ELVISH OLD MY)
	(DESC "sword")
	(FLAGS TAKEBIT WEAPONBIT TRYTAKEBIT)
	(ACTION SWORD-FCN)
	(FDESC
"Above the trophy case hangs an elvish sword of great antiquity.")
	(SIZE 30)
	(TVALUE 0)>

<OBJECT TROLL
	(IN TROLL-ROOM)
	(SYNONYM TROLL)
	(ADJECTIVE NASTY)
	(DESC "troll")
	(FLAGS ACTORBIT OPENBIT TRYTAKEBIT)
	(ACTION TROLL-FCN)
	(LDESC
"A nasty-looking troll, brandishing a bloody axe, blocks all passages
out of the room.")
	(STRENGTH 2)>

<GLOBAL TROLL-FIGHT <>>

<OBJECT OWNERS-MANUAL
	(IN STUDIO)
	(SYNONYM MANUAL PAPER)
	(ADJECTIVE ZORK OWNERS SMALL PIECE)
	(DESC "ZORK owner's manual")
	(FLAGS READBIT TAKEBIT)
	(FDESC "Loosely attached to a wall is a small piece of paper.")
	(TEXT
"\"Congratulations!|
|
You are the privileged owner of ZORK I: The Great Underground Empire,
a self-contained and self-maintaining universe. If used and maintained
in accordance with normal operating practices for small universes, ZORK
will provide many months of trouble-free operation.\"")>

<OBJECT NEST
	(IN UP-A-TREE)
	(SYNONYM NEST)
	(ADJECTIVE BIRDS)
	(DESC "bird's nest")
	(FLAGS TAKEBIT ;BURNBIT CONTBIT OPENBIT SEARCHBIT)
	(FDESC "Beside you on the branch is a small bird's nest.")
	(CAPACITY 20)>

<OBJECT EGG
	(IN NEST)
	(SYNONYM EGG TREASURE)
	(ADJECTIVE BIRDS ENCRUSTED JEWELED BROKEN)
	(SDESC "")
	(FLAGS TAKEBIT CONTBIT SEARCHBIT)
	(ACTION EGG-OBJECT)
	(VALUE 5)
	(TVALUE 0)
	(CAPACITY 6)
	(FDESC
"In the bird's nest is a large egg encrusted with precious jewels,
apparently scavenged by a childless songbird. The egg is covered with
fine gold inlay, and ornamented in lapis lazuli and mother-of-pearl.
Unlike most eggs, this one is hinged and closed with a delicate looking
clasp. The egg appears extremely fragile.")>

;<OBJECT BROKEN-EGG
	(SYNONYM EGG TREASURE)
	(ADJECTIVE BROKEN BIRDS ENCRUSTED JEWEL)
	(DESC "broken jewel-encrusted egg")
	(FLAGS TAKEBIT CONTBIT OPENBIT)
	(CAPACITY 6)
	(TVALUE 2)
	(LDESC "There is a somewhat ruined egg here.")>

;<OBJECT CANARY  
	(IN EGG)
	(SYNONYM CANARY TREASURE)
	(ADJECTIVE CLOCKWORK GOLD GOLDEN)
	(DESC "golden clockwork canary")
	(FLAGS TAKEBIT SEARCHBIT)
	(ACTION CANARY-OBJECT)
	(VALUE 6)
	(TVALUE 4)
	(FDESC
"There is a golden clockwork canary nestled in the egg. It has ruby
eyes and a silver beak. Through a crystal window below its left
wing you can see intricate machinery inside. It appears to have
wound down.")>

<OBJECT BROKEN-CANARY
	(IN EGG)
	(SYNONYM CANARY TREASURE)
	(ADJECTIVE BROKEN CLOCKWORK GOLD GOLDEN)
	(DESC "broken clockwork canary")
	(FLAGS TAKEBIT)
	(ACTION CANARY-OBJECT)
	(TVALUE 1)
	(FDESC
"There is a golden clockwork canary nestled in the egg. It seems to
have recently had a bad experience. The mountings for its jewel-like
eyes are empty, and its silver beak is crumpled. Through a cracked
crystal window below its left wing you can see the remains of
intricate machinery. It is not clear what result winding it would
have, as the mainspring seems sprung.")>

<GLOBAL TROLL-FLAG <>>

<ROOM WEST-OF-HOUSE
      (IN ROOMS)
      (DESC "West of House")
      (LDESC
"You are standing in an open field west of a white house, with a boarded
front door.")
      (NORTH TO NORTH-OF-HOUSE)
      (SOUTH TO SOUTH-OF-HOUSE)
      (NE TO NORTH-OF-HOUSE)
      (SE TO SOUTH-OF-HOUSE)
      (WEST TO FOREST-1)
      (EAST "The door is boarded and you can't remove the boards.")
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL WHITE-HOUSE BOARD)>

<ROOM NORTH-OF-HOUSE
      (IN ROOMS)
      (LDESC
"You are facing the north side of a white house. There is no door here,
and all the windows are boarded up. To the north a narrow path winds through
the trees.")
      (DESC "North of House")
      (SW TO WEST-OF-HOUSE)
      (SE TO EAST-OF-HOUSE)
      (WEST TO WEST-OF-HOUSE)
      (EAST TO EAST-OF-HOUSE)
      (NORTH TO PATH)
      (SOUTH "The windows are all boarded.")
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL BOARDED-WINDOW BOARD WHITE-HOUSE)>

<ROOM SOUTH-OF-HOUSE
      (IN ROOMS)
      (LDESC
"You are facing the south side of a white house. There is no door here,
and all the windows are boarded.")
      (DESC "South of House")
      (WEST TO WEST-OF-HOUSE)
      (EAST TO EAST-OF-HOUSE)
      (NE TO EAST-OF-HOUSE)
      (NW TO WEST-OF-HOUSE)
      (SOUTH TO FOREST-3)
      (NORTH "The windows are all boarded.")
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL BOARDED-WINDOW BOARD WHITE-HOUSE)>

<ROOM EAST-OF-HOUSE
      (IN ROOMS)
      (DESC "Behind House")
      (NORTH TO NORTH-OF-HOUSE)
      (SOUTH TO SOUTH-OF-HOUSE)
      (SW TO SOUTH-OF-HOUSE)
      (NW TO NORTH-OF-HOUSE)
      (EAST TO CLEARING)
      (WEST PER KITCHEN-WINDOW-ENTER)
      (IN TO KITCHEN IF KITCHEN-WINDOW IS OPEN)
      (ACTION EAST-HOUSE)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL WHITE-HOUSE KITCHEN-WINDOW)>

<ROUTINE KITCHEN-WINDOW-ENTER ()
	 <COND (<NOT <FSET? ,KITCHEN-WINDOW ,OPENBIT>>
		<TELL "You'll have to open" T ,KITCHEN-WINDOW " first." CR>
		<RFALSE>)
	       (T
		<COND (<EQUAL? ,KITCHEN-WINDOW-FLAG 1>
		       <SETG KITCHEN-WINDOW-FLAG 0>
		       <SETG SCORE <+ ,SCORE 10>>)>
		<RETURN ,KITCHEN>)>> 

<ROOM FOREST-1
      (IN ROOMS)
      (LDESC
"This is a forest, with trees in all directions. To the east,
there appears to be sunlight.")
      (DESC "Forest")
      (UP "There is no tree here suitable for climbing.")
      (NORTH TO GRATING-CLEARING)
      (EAST TO PATH)
      (SOUTH TO FOREST-3)
      (WEST "You would need a machete to go further west.")
      (ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL TREE SONGBIRD WHITE-HOUSE FOREST)>

<ROOM FOREST-2
      (IN ROOMS)
      (LDESC "This is a dimly lit forest, with large trees all around.")
      (DESC "Forest")
      (UP "There is no tree here suitable for climbing.")
      (NORTH "The forest becomes impenetrable to the north.")
      (EAST TO MOUNTAINS)
      (SOUTH TO CLEARING)
      (WEST TO PATH)
      (ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL TREE SONGBIRD WHITE-HOUSE FOREST)>

<ROOM MOUNTAINS
      (IN ROOMS)
      (LDESC "The forest thins out, revealing impassable mountains.")
      (DESC "Forest")
      (UP "The mountains are impassable.")
      (NORTH TO FOREST-2)
      (EAST "The mountains are impassable.")
      (SOUTH TO FOREST-2)
      (WEST TO FOREST-2)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL TREE WHITE-HOUSE)
      (ACTION MOUNTAINS-ROOM)>

<ROOM FOREST-3
      (IN ROOMS)
      (LDESC "This is a dimly lit forest, with large trees all around.")
      (DESC "Forest")
      (UP "There is no tree here suitable for climbing.")
      (NORTH TO CLEARING)
      (EAST "The rank undergrowth prevents eastward movement.")
      (SOUTH "Storm-tossed trees block your way.")
      (WEST TO FOREST-1)
      (NW TO SOUTH-OF-HOUSE)
      (ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL TREE SONGBIRD WHITE-HOUSE FOREST)>

<ROOM PATH
      (IN ROOMS)
      (LDESC
"This is a path winding through a dimly lit forest. The path heads
north-south here. One particularly large tree with some low branches
stands at the edge of the path.")
      (DESC "Forest Path")
      (UP TO UP-A-TREE)
      (NORTH TO GRATING-CLEARING)
      (DOWN "You're already at the bottom of the tree.")
      (EAST TO FOREST-2)
      (SOUTH TO NORTH-OF-HOUSE)
      (WEST TO FOREST-1)
      (ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL TREE SONGBIRD WHITE-HOUSE FOREST)>

<ROOM UP-A-TREE
      (IN ROOMS)
      (DESC "Up a Tree")
      (DOWN TO PATH)
      (UP "You cannot climb any higher.")
      (ACTION TREE-ROOM)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL TREE FOREST SONGBIRD WHITE-HOUSE)>

<ROOM GRATING-CLEARING
      (IN ROOMS)
      (DESC "Clearing")
      (NORTH "The forest becomes impenetrable to the north.")
      (EAST TO FOREST-2)
      (WEST TO FOREST-1)
      (SOUTH TO PATH)
      (DOWN PER GRATING-EXIT)
      (ACTION CLEARING-FCN)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL WHITE-HOUSE GRATE)>

<ROUTINE GRATING-EXIT ()
	 <COND (,GRATE-REVEALED
		<TELL CT ,GRATE " is closed!" CR>
		<THIS-IS-IT ,GRATE>
		<RFALSE>)
	       (T
		<TELL ,CANT-GO CR>
		<RFALSE>)>>

<ROOM CLEARING
      (IN ROOMS)
      (LDESC
"You are in a small clearing on a well marked forest path that
extends to the east and west.")
      (DESC "Clearing")
      (UP "There is no tree here suitable for climbing.")
      (EAST TO CANYON-VIEW)
      (NORTH TO FOREST-2)
      (SOUTH TO FOREST-3)
      (WEST TO EAST-OF-HOUSE)
      (ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL TREE SONGBIRD WHITE-HOUSE FOREST)>

<GLOBAL FALSE-FLAG <>>

<ROOM KITCHEN
      (IN ROOMS)
      (DESC "Kitchen")
      (EAST TO EAST-OF-HOUSE IF KITCHEN-WINDOW IS OPEN)
      (WEST TO LIVING-ROOM)
      (OUT TO EAST-OF-HOUSE IF KITCHEN-WINDOW IS OPEN)
      (UP TO ATTIC)
      (DOWN TO STUDIO IF FALSE-FLAG ELSE
 	 "Only Santa Claus climbs down chimneys.")
      (ACTION KITCHEN-FCN)
      (FLAGS RLANDBIT ONBIT)
      (VALUE 10)
      (GLOBAL KITCHEN-WINDOW CHIMNEY STAIRS)>

<ROOM ATTIC
      (IN ROOMS)
      (LDESC "This is the attic. The only exit is a staircase leading down.")
      (DESC "Attic")
      (DOWN TO KITCHEN)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)>

<ROOM LIVING-ROOM
      (IN ROOMS)
      (DESC "Living Room")
      (EAST TO KITCHEN)
      (WEST "The door is nailed shut.")
      (DOWN PER TRAP-DOOR-EXIT)
      (ACTION LIVING-ROOM-FCN)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL STAIRS)
      (THINGS <PSEUDO ( <> NAILS NAILS-PSEUDO)
		      ( <> NAIL NAILS-PSEUDO)>)>

<ROUTINE I-BRIGHT-GLOW ()
	 <TELL "Your sword has begun to glow very brightly." CR>>

<ROUTINE I-NO-GLOW ()
	 <TELL "Your sword is no longer glowing." CR>>

<ROUTINE I-GLOW ()
	 <TELL "Your sword is glowing with a faint blue glow." CR>>

<ROUTINE TO-TROLL-ROOM ()
	 <COND (<ULTIMATELY-IN? ,SWORD ,PROTAGONIST>
		<QUEUE I-BRIGHT-GLOW 1>)>
	 <RETURN ,TROLL-ROOM>> 

<ROUTINE TO-CHASM-EAST ()
	 <COND (<ULTIMATELY-IN? ,SWORD ,PROTAGONIST>
		<QUEUE I-NO-GLOW 1>)>
	 <RETURN ,EAST-OF-CHASM>>

<ROUTINE TO-CELLAR ()
	 <COND (<ULTIMATELY-IN? ,SWORD ,PROTAGONIST>
		<QUEUE I-GLOW 1>)>
	 <RETURN ,CELLAR>>

<ROOM CELLAR
      (IN ROOMS)
      (DESC "Cellar")
      (NORTH PER TO-TROLL-ROOM)
      (SOUTH PER TO-CHASM-EAST)
      (UP TO LIVING-ROOM IF TRAP-DOOR IS OPEN)
      (WEST
"You try to ascend the ramp, but it is impossible, and you slide back down.")
      (ACTION CELLAR-FCN)
      (FLAGS RLANDBIT)
      (VALUE 25)
      (GLOBAL TRAP-DOOR SLIDE STAIRS)>

<ROOM TROLL-ROOM
      (IN ROOMS)
      (LDESC
"This is a small room with passages to the east and south and a
forbidding hole leading west. Bloodstains and deep scratches
(perhaps made by an axe) mar the walls.")
      (DESC "The Troll Room")
      (SOUTH PER TO-CELLAR)
      (EAST "The troll fends you off with a menacing gesture.")
      (WEST "The troll fends you off with a menacing gesture.")
      (FLAGS RLANDBIT)
      (ACTION TROLL-ROOM-F)>

<ROOM EAST-OF-CHASM
      (IN ROOMS)
      (LDESC
"You are on the east edge of a chasm, the bottom of which cannot be
seen. A narrow passage goes north, and the path you are on continues
to the east.")
      (DESC "East of Chasm")
      (NORTH PER TO-CELLAR)
      (EAST TO GALLERY)
      (DOWN "The chasm probably leads straight to the infernal regions.")
      (FLAGS RLANDBIT)
      (THINGS <PSEUDO ( <> CHASM CHASM-PSEUDO)>)>

<ROOM GALLERY
      (IN ROOMS)
      (LDESC
"This is an art gallery. Most of the paintings have been stolen by
vandals with exceptional taste. The vandals left through either the
north or west exits.")
      (DESC "Gallery")
      (WEST TO EAST-OF-CHASM)
      (NORTH TO STUDIO)
      (FLAGS RLANDBIT ONBIT)>

<ROOM STUDIO
      (IN ROOMS)
      (LDESC
"This appears to have been an artist's studio. The walls and floors are
splattered with paints of 69 different colors. Strangely enough, nothing
of value is hanging here. At the south end of the room is an open door
(also covered with paint). A dark and narrow chimney leads up from a
fireplace; although you might be able to get up it, it seems unlikely
you could get back down.")
      (DESC "Studio")
      (SOUTH TO GALLERY)
      (UP PER UP-CHIMNEY-FUNCTION)
      (FLAGS RLANDBIT)
      (GLOBAL CHIMNEY)
      (THINGS <PSEUDO (<> DOOR DOOR-PSEUDO)
		      (<> PAINT PAINT-PSEUDO)>)>

<ROOM END-OF-RAINBOW	;"was POG"
      (IN ROOMS)
      (LDESC
"You are on a small, rocky beach on the continuation of the Frigid
River past the Falls. The beach is narrow due to the presence of the
White Cliffs. The river canyon opens here and sunlight shines in
from above. A rainbow crosses over the falls to the east and a narrow
path continues to the southwest.")
      (DESC "End of Rainbow")
      (SW TO CANYON-BOTTOM)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL WATER RAINBOW RIVER)>

<ROOM CANYON-BOTTOM	;"was CLBOT"
      (IN ROOMS)
      (LDESC
"You are beneath the walls of the river canyon which may be climbable
here. The lesser part of the runoff of Aragain Falls flows by below.
To the north is a narrow path.")
      (DESC "Canyon Bottom")
      (UP TO CLIFF-MIDDLE)
      (NORTH TO END-OF-RAINBOW)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL WATER CLIMBABLE-CLIFF RIVER)>

<OBJECT CLIMBABLE-CLIFF
	(IN LOCAL-GLOBALS)
	(SYNONYM WALL CLIFF WALLS LEDGE)
	(ADJECTIVE ROCKY SHEER)
	(DESC "cliff")
	(ACTION CLIFF-OBJECT)
	(FLAGS NDESCBIT CLIMBBIT)>

<ROOM CLIFF-MIDDLE	;"was CLMID"
      (IN ROOMS)
      (LDESC
"You are on a ledge about halfway up the wall of the river canyon.
You can see from here that the main flow from Aragain Falls twists
along a passage which it is impossible to enter. Below you is the
canyon bottom. Above you is more cliff, which appears
climbable.")
      (DESC "Rocky Ledge")
      (UP TO CANYON-VIEW)
      (DOWN TO CANYON-BOTTOM)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL CLIMBABLE-CLIFF RIVER)>

<ROOM CANYON-VIEW	;"was CLTOP"
      (IN ROOMS)
      (LDESC
"You are at the top of the Great Canyon on its west wall. From here
there is a marvelous view of the canyon and parts of the Frigid River
upstream. Across the canyon, the walls of the White Cliffs join the
mighty ramparts of the Flathead Mountains to the east. Following the
Canyon upstream to the north, Aragain Falls may be seen, complete with
rainbow. The mighty Frigid River flows out from a great dark cavern. To
the west and south can be seen an immense forest, stretching for miles
around. A path leads northwest. It is possible to climb down into
the canyon from here.")
      (DESC "Canyon View")
      (EAST TO CLIFF-MIDDLE)
      (DOWN TO CLIFF-MIDDLE)
      (NW TO CLEARING)
      (WEST TO FOREST-3)
      (SOUTH "Storm-tossed trees block your way.")
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL CLIMBABLE-CLIFF RIVER ;RAINBOW)
      (ACTION CANYON-VIEW-F)>

<ROUTINE CANYON-VIEW-F (RARG)
	 <COND (<AND <==? .RARG ,M-BEG>
		     <VERB? LEAP>
		     <NOT ,PRSO>>
		<JIGS-UP "Nice view, lousy place to jump.">
		<RTRUE>)>>
	       
<GLOBAL HOUSE-AROUND
  <LTABLE WEST-OF-HOUSE NORTH-OF-HOUSE EAST-OF-HOUSE SOUTH-OF-HOUSE
	  WEST-OF-HOUSE>>

<GLOBAL FOREST-AROUND
  <LTABLE FOREST-1 FOREST-2 FOREST-3 PATH CLEARING FOREST-1>>

<GLOBAL IN-HOUSE-AROUND
  <LTABLE LIVING-ROOM KITCHEN ATTIC KITCHEN>>

;<GLOBAL ABOVE-GROUND
  <LTABLE WEST-OF-HOUSE NORTH-OF-HOUSE EAST-OF-HOUSE SOUTH-OF-HOUSE
	  FOREST-1 FOREST-2 FOREST-3 PATH CLEARING GRATING-CLEARING
	  CANYON-VIEW>>

;"ACTION ACTION ACTION!!"

<ROUTINE EAST-HOUSE (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are behind" T ,WHITE-HOUSE ". A path leads into"
T ,FOREST ,TO-E ". In one corner of the house there is a small "
D ,WINDOW " that is ">
		<COND (<FSET? ,KITCHEN-WINDOW ,OPENBIT>
		       <TELL "open.">)
		      (<EQUAL? ,KITCHEN-WINDOW-FLAG 2>
		       <TELL "slightly ajar.">)
		      (T
		       <TELL "closed.">)>
		<CRLF>)>>

<ROUTINE OPEN-CLOSE (OBJ STROPN STRCLS)
	 <COND (<VERB? OPEN>
		<COND (<FSET? .OBJ ,OPENBIT>
		       <TELL <PICK-ONE ,DUMMY>>)
		      (T
		       <TELL .STROPN>
		       <FSET .OBJ ,OPENBIT>)>
		<CRLF>)
	       (<VERB? CLOSE>
		<COND (<FSET? .OBJ ,OPENBIT>
		       <TELL .STRCLS>
		       <FCLEAR .OBJ ,OPENBIT>
		       T)
		      (T <TELL <PICK-ONE ,DUMMY>>)>
		<CRLF>)>>

<ROUTINE BOARD-F ()
	 <COND (<VERB? TAKE EXAMINE>
		<TELL CT ,BOARD "s are securely fastened." CR>)>>

;<ROUTINE TEETH-F ()
	 <COND (<AND <VERB? CLEAN>
		     <EQUAL? ,PRSO ,TEETH>>
		<COND (<NOT ,PRSI>
		       <TELL
"Dental hygiene is highly recommended, but I'm not sure what you want
to brush them with." CR>)
		      (T
		       <TELL "A nice idea, but with" A ,PRSI "?" CR>)>)>>

;<ROUTINE GRANITE-WALL-F () ;"not referenced, removed 2/27/85 by SEM"
	 <TELL "There is no granite wall here." CR>>

<ROUTINE SONGBIRD-F ()
	 <COND (<VERB? FIND TAKE>
		<TELL CT ,SONGBIRD " is not here but is probably nearby." CR>)
	       (<VERB? LISTEN>
		<TELL "You can't hear" T ,SONGBIRD " now." CR>)
	       (<VERB? FOLLOW>
		<TELL "It can't be followed." CR>)
	       (T
		<CANT-SEE-ANY ,SONGBIRD>)>>

<ROUTINE WHITE-HOUSE-F ()
    <COND (<EQUAL? ,HERE ,KITCHEN ,LIVING-ROOM ,ATTIC>
	   <COND (<VERB? FIND>
		  <TELL "Why not find your brains?" CR>)
		 (<VERB? WALK-AROUND>
		  <GO-NEXT ,IN-HOUSE-AROUND>
		  T)>)
	  (<NOT <OR <EQUAL? ,HERE ,EAST-OF-HOUSE ,WEST-OF-HOUSE>
		    <EQUAL? ,HERE ,NORTH-OF-HOUSE ,SOUTH-OF-HOUSE>>>
	   <COND (<VERB? FIND>
		  <COND (<EQUAL? ,HERE ,CLEARING>
			 <TELL "It seems to be" ,TO-W ,PERIOD-CR>)
			(T
			 <TELL "It was here just a minute ago...." CR>)>)
		 (T <TELL "You're not at the house." CR>)>)
	  (<VERB? FIND>
	   <TELL
"It's right in front of you. Are you blind or something?" CR>)
	  (<VERB? WALK-AROUND>
	   <GO-NEXT ,HOUSE-AROUND>
	   T)
	  (<VERB? EXAMINE>
	   <TELL
"The house is a beautiful colonial house that is painted white.
It is clear that the owners must have been extremely wealthy." CR>)
	  (<VERB? ENTER>
	   <COND (<EQUAL? ,HERE ,EAST-OF-HOUSE>
		  <COND (<FSET? ,KITCHEN-WINDOW ,OPENBIT>
			 <GOTO ,KITCHEN>)
			(T
			 <TELL CT ,WINDOW " is closed." CR>
			 <THIS-IS-IT ,KITCHEN-WINDOW>)>)
		 (T
		  <TELL "I can't see how to get in from here." CR>)>)
	  (<VERB? BURN>
	   <TELL "You must be joking." CR>)>>

<ROUTINE FOREST-F ()
	 <COND (<VERB? WALK-AROUND>
		<GO-NEXT ,FOREST-AROUND>)
	       (<VERB? DISEMBARK LEAVE>
		<TELL "You will have to specify" AR ,INTDIR>)
	       (<VERB? FIND>
		<TELL "You cannot see" T ,FOREST " for" T ,TREE "s." CR>)
	       (<VERB? LISTEN>
		<TELL "The pines and the hemlocks seem to be murmuring." CR>)>>

<ROUTINE MOUNTAIN-RANGE-F ()
	 <COND (<VERB? CLIMB CLIMB-UP CLIMB-OVER>
		<TELL "Don't you believe me? The mountains are impassable!"
		      CR>)>>

<ROUTINE GENERIC-WATER-F ()
	 <COND (<ULTIMATELY-IN? ,WATER ,HERE>
		<RETURN ,WATER>)
	       (<ULTIMATELY-IN? ,ZORK-WATER ,HERE>
		<RETURN ,ZORK-WATER>)
	       (T
		<RFALSE>)>>

<ROUTINE ZORK-WATER-F ()
	 <COND (<VERB? DRINK POUR DROP THROW>
		<COND (<FSET? ,BOTTLE ,OPENBIT>
		       <COND (<VERB? DRINK>
			      <TELL CT ,WATER " is cool and refreshing." CR>)
			     (T
			      <TELL 
CT ,WATER " splashes all over the place and evaporates." CR>)>
		       <REMOVE ,ZORK-WATER>)
		      (T
		       <TELL "You'd better open the bottle first." CR>)>)>>

<GLOBAL KITCHEN-WINDOW-FLAG 2>  ;"2 = never opened; 1=opened, not entered"

<ROUTINE KITCHEN-WINDOW-F ()
	 <COND (<VERB? OPEN CLOSE>
		;<SETG KITCHEN-WINDOW-FLAG T>
		<COND (<EQUAL? ,KITCHEN-WINDOW-FLAG 2>
		       <COND (<VERB? CLOSE>
			      <FSET ,KITCHEN-WINDOW ,OPENBIT>)> ;"KLUDGE"
		       <SETG KITCHEN-WINDOW-FLAG 1>)>
		<OPEN-CLOSE ,KITCHEN-WINDOW
"With great effort, you open the window far enough to allow entry."
"The window closes.">)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,KITCHEN-WINDOW-FLAG 2>>
		<TELL
CT ,WINDOW " is slightly ajar, but not enough to allow entry." CR>)
	       (<VERB? BOARD ENTER>
		<COND (<EQUAL? ,HERE ,KITCHEN>
		       <DO-WALK ,P?EAST>)
		      (T
		       <DO-WALK ,P?WEST>)>
		<RTRUE>)
	       (<VERB? LOOK-INSIDE>
		<TELL "You can see ">
		<COND (<EQUAL? ,HERE ,KITCHEN>
		       <TELL "a clear area leading towards" AR ,FOREST>)
		      (T
		       <TELL "what appears to be a kitchen." CR>)>)>>

<ROUTINE BOARDED-WINDOW-FCN ()
	 <COND (<VERB? OPEN>
		<TELL CT ,WINDOW "s are boarded and can't be opened." CR>)
	       (<VERB? MUNG>
		<TELL "You can't break" T ,WINDOW "s open." CR>)>>

<ROUTINE NAILS-PSEUDO ()
	 <COND (<VERB? TAKE>
		<TELL
"The nails, deeply imbedded in" T ,FRONT-DOOR ", cannot be removed." CR>)>>

;<ROUTINE CRACK-FCN ()
	 <COND (<VERB? ENTER>
		<TELL "You can't fit through the crack." CR>)>>

<ROUTINE KITCHEN-FCN (RARG)
	<COND (<EQUAL? .RARG ,M-LOOK>
	       <TELL
"You are in the kitchen of" T ,WHITE-HOUSE ". A table seems to
have been used recently for the preparation of food. A passage
leads" ,TO-W " and a dark staircase can be seen leading
upward. A dark " D ,CHIMNEY " leads down and" ,TO-E " is a small " D ,WINDOW 
" which is ">
	       <COND (<FSET? ,KITCHEN-WINDOW ,OPENBIT>
		      <TELL "open." CR>)
		     (T
		      <TELL "slightly ajar." CR>)>)
	      (<==? .RARG ,M-BEG>
	       <COND (<AND <VERB? CLIMB-UP> <PRSO? ,STAIRS>>
		      <DO-WALK ,P?UP>)
		     (<AND <VERB? CLIMB-UP> <PRSO? ,STAIRS>>
		      <TELL "There are no stairs leading down." CR>)>)>>

\

<ROUTINE TROPHY-CASE-FCN ("AUX")
    <COND (<AND <VERB? TAKE> <PRSO? ,TROPHY-CASE>>
	   <TELL
CT ,TROPHY-CASE " is securely fastened to the wall." CR>)
	  (<AND <VERB? PUT> <PRSI? ,TROPHY-CASE>
		<FSET? ,TROPHY-CASE ,OPENBIT>>
	   <COND (<G? <GETP ,PRSO ,P?TVALUE> 0>
		  <UPDATE-SCORE <GETP ,PRSO ,P?TVALUE>>)
		 (<ULTIMATELY-IN? ,EGG ,PRSO>
		  <UPDATE-SCORE <GETP ,EGG ,P?TVALUE>>)>
	   <RFALSE>)>>
	
<GLOBAL RUG-MOVED <>>

<ROUTINE LIVING-ROOM-FCN (RARG "AUX" RUG? TC)
	<COND (<EQUAL? .RARG ,M-LOOK>
	       <TELL
"You are in the living room. There is" A ,FRONT-DOOR "way" ,TO-E ","
A ,WOODEN-DOOR " with strange gothic lettering" ,TO-W ", which appears to be
nailed shut," A ,TROPHY-CASE ", ">
	       <SET RUG? ,RUG-MOVED>
	       <COND (<AND .RUG? <FSET? ,TRAP-DOOR ,OPENBIT>>
		      <TELL
		       "and a rug lying beside an open " D ,TRAP-DOOR ".">)
		     (.RUG?
		      <TELL "and a closed " D ,TRAP-DOOR " at your feet.">)
		     (<FSET? ,TRAP-DOOR ,OPENBIT>
		      <TELL "and an open " D ,TRAP-DOOR " at your feet.">)
		     (T
		      <TELL
		       "and a large oriental rug in the center of the room.">)>
	       <CRLF>
	       T)
	      ;(<EQUAL? .RARG ,M-END>
	       <COND (<OR <VERB? TAKE>
			  <AND <VERB? PUT>
			       <EQUAL? ,PRSI ,TROPHY-CASE>>>
		      <COND (<IN? ,PRSO ,TROPHY-CASE>
			     <TOUCH-ALL ,PRSO>)>
		      <SETG SCORE <+ ,BASE-SCORE <OTVAL-FROB>>>
		      <SCORE-UPD 0>
		      <RFALSE>)>)>>

<ROUTINE TOUCH-ALL (OBJ "AUX" F)
	 <SET F <FIRST? .OBJ>>
	 <REPEAT ()
		 <COND (<NOT .F> <RETURN>)
		       (T
			<FSET .F ,TOUCHBIT>
			<COND (<FIRST? .F> <TOUCH-ALL .F>)>)>
		 <SET F <NEXT? .F>>>>

;<ROUTINE OTVAL-FROB ("OPTIONAL" (O ,TROPHY-CASE) "AUX" F (SCORE 0))
	 <SET F <FIRST? .O>>
	 <REPEAT ()
		 <COND (<NOT .F> <RETURN .SCORE>)>
		 <SET SCORE <+ .SCORE <GETP .F ,P?TVALUE>>>
		 <COND (<FIRST? .F> <OTVAL-FROB .F>)>
		 <SET F <NEXT? .F>>>>

<ROUTINE TRAP-DOOR-FCN ()
    <COND (<VERB? RAISE>
	   <PERFORM ,V?OPEN ,TRAP-DOOR>
	   <RTRUE>)
	  (<AND <VERB? OPEN CLOSE>
		<EQUAL? ,HERE ,LIVING-ROOM>>
	   <OPEN-CLOSE ,PRSO
"The door reluctantly opens to reveal a rickety staircase
descending into darkness."
"The door swings shut and closes.">)
	  (<AND <VERB? LOOK-UNDER> <EQUAL? ,HERE LIVING-ROOM>>
	   <COND (<FSET? ,TRAP-DOOR ,OPENBIT>
		  <TELL
"You see a rickety staircase descending into darkness." CR>)
		 (T <TELL "It's closed." CR>)>)
	  (<EQUAL? ,HERE ,CELLAR>
	   <COND (<AND <VERB? OPEN UNLOCK>
		       <NOT <FSET? ,TRAP-DOOR ,OPENBIT>>>
		  <TELL
CT ,FRONT-DOOR " is locked from above." CR>)
		 (<AND <VERB? CLOSE> <NOT <FSET? ,TRAP-DOOR ,OPENBIT>>>
		  <FCLEAR ,TRAP-DOOR ,TOUCHBIT>
		  <FCLEAR ,TRAP-DOOR ,OPENBIT>
		  <TELL CT ,FRONT-DOOR " closes and locks." CR>)
		 (<VERB? OPEN CLOSE>
		  <TELL <PICK-ONE ,DUMMY> CR>)>)>>

<ROUTINE CELLAR-FCN (RARG)
  <COND (<EQUAL? .RARG ,M-LOOK>
	 <TELL
"You are in a dark and damp cellar with a narrow passageway leading
north, and a crawlway" ,TO-S ". On the west is the bottom of a
steep metal ramp which is unclimbable." CR>)
	(<EQUAL? .RARG ,M-ENTER>
	 <COND (<AND <FSET? ,TRAP-DOOR ,OPENBIT>
		     <NOT <FSET? ,TRAP-DOOR ,TOUCHBIT>>>
		<FCLEAR ,TRAP-DOOR ,OPENBIT>
		<FSET ,TRAP-DOOR ,TOUCHBIT>
		<TELL
CT ,TRAP-DOOR " crashes shut, and you hear someone barring it." CR CR>)>)>>

<ROUTINE CHIMNEY-F ()
	 <COND (<VERB? CLIMB CLIMB-UP CLIMB-DOWN>
		<COND (<EQUAL? ,HERE ,KITCHEN>
		       <COND (<NOT <VERB? CLIMB-UP>>
			      <TELL
"Only Santa Claus climbs down chimneys." CR>)
			     (T
			      <RFALSE>)>)
		      (T
		       <COND (<NOT <VERB? CLIMB-DOWN>>
			      <DO-WALK ,P?UP>)
			     (T
			      <RFALSE>)>)>) 
	       (<VERB? EXAMINE>
		<TELL CT ,CHIMNEY " leads ">
		<COND (<==? ,HERE ,KITCHEN>
		       <TELL "down">)
		      (T <TELL "up">)>
		<TELL "ward, and looks climbable." CR>)>>

<ROUTINE ONE-ITEM? (F)                 ;"A KLUGE, BUT SAVED TIME."
	 <COND (<ULTIMATELY-IN? ,LAMP ,PROTAGONIST>
		<MOVE ,LAMP ,ZORK-ROOM>)>
	 <COND (<NOT <NEXT? .F>>
		<SET F T>)
	       (T
		<SET F <>>)>
	 <COND (<IN? ,LAMP ,ZORK-ROOM>
		<MOVE ,LAMP ,PROTAGONIST>)>
	 <RETURN .F>>

<ROUTINE UP-CHIMNEY-FUNCTION ("AUX" F)
  <COND (<NOT <SET F <FIRST? ,WINNER>>>
	 <TELL "Going up empty-handed is a bad idea." CR>
	 <RFALSE>)
	(<ONE-ITEM? .F>
	 <COND (<NOT <FSET? ,TRAP-DOOR ,OPENBIT>>
		<FCLEAR ,TRAP-DOOR ,TOUCHBIT>)>
	 <RETURN ,KITCHEN>)
	(T
	 <TELL "You can't get up there with what you're carrying." CR>
	 <RFALSE>)>>

<ROUTINE TRAP-DOOR-EXIT ()
	 <COND (,RUG-MOVED
		<COND (<FSET? ,TRAP-DOOR ,OPENBIT>
		       <COND (<ULTIMATELY-IN? ,SWORD ,PROTAGONIST>
			      <QUEUE I-GLOW 1>)>
		       <RETURN ,CELLAR>)
		      (T
		       <TELL CT ,TRAP-DOOR " is closed." CR>
		       <THIS-IS-IT ,TRAP-DOOR>
		       <RFALSE>)>)
	       (T
		<COND (<AND <NOT ,LIT>
	             	    <EQUAL? ,GAME-FLAG 1>
		     	    ,GRUE-DEATH>
		       <JIGS-UP
"Oh, no! You have walked into the slavering fangs of a lurking grue!">)
		      (T
		       <TELL ,CANT-GO CR>
		       <RFALSE>)>)>>

<ROUTINE RUG-FCN ()
   <COND (<VERB? RAISE>
	  <COND (,RUG-MOVED
		 <TELL "The rug is too heavy to lift." CR>)
		(T
		 <TELL
"The rug is too heavy to lift, but in trying to take it you have
noticed an irregularity beneath it." CR>)>)
	 (<VERB? MOVE PUSH ROLL>
	  <COND (,RUG-MOVED
		 <TELL
"Having moved the carpet previously, you find it impossible to move
it again." CR>)
		(T
		 <TELL
"With a great effort, the rug is moved to one side of the room.
With the rug moved, the dusty cover of a closed " D ,TRAP-DOOR " appears." CR>
		 <FCLEAR ,TRAP-DOOR ,INVISIBLE>
		 <THIS-IS-IT ,TRAP-DOOR>
		 <SETG RUG-MOVED T>)>)
	 (<VERB? TAKE>
	  <TELL
"The rug is extremely heavy and cannot be carried." CR>)
	 (<AND <VERB? LOOK-UNDER>
	       <NOT ,RUG-MOVED>
	       <NOT <FSET? ,TRAP-DOOR ,OPENBIT>>>
	  <TELL "Underneath the rug is a closed " D ,TRAP-DOOR ". As you drop
the corner of the rug," T ,TRAP-DOOR " is once again concealed from view." CR>)
	 (<VERB? CLIMB-ON>
	  <COND (<AND <NOT ,RUG-MOVED>
		      <NOT <FSET? ,TRAP-DOOR ,OPENBIT>>>
		 <TELL
"You sit down. The rug seems to have an irregularity underneath it." CR>)
		(ELSE
		 <TELL "I suppose you think it's a magic carpet?" CR>)>)>>

\

"SUBTITLE TROLL"

<ROUTINE AXE-F ()
	 <COND (,TROLL-FLAG <>)
	       (T <WEAPON-FUNCTION ,AXE ,TROLL>)>>

<ROUTINE WEAPON-FUNCTION (W V)
	<COND (<NOT <IN? .V ,HERE>> <RFALSE>)
	      (<VERB? TAKE>
	       <COND (<IN? .W .V>
		      <TELL
"The " D .V " swings it out of your reach." CR>)
		     (T
		      <TELL
"The " D .W " seems white-hot. You can't hold on to it." CR>)>
	       T)>>

<ROUTINE TROLL-FCN ("OPTIONAL" (MODE <>))
	 <COND (<VERB? TELL>
		<TELL CT ,TROLL " isn't much of a conversationalist." CR>
		<SETG P-CONT <>>)
	       (<EQUAL? .MODE ,F-BUSY?>
		<COND (<IN? ,AXE ,TROLL> <>)
		      (<AND <IN? ,AXE ,HERE> <PROB 82>>
		       <FSET ,AXE ,NDESCBIT>
		       <FCLEAR ,AXE ,WEAPONBIT>
		       <MOVE ,AXE ,TROLL>
		       <PUTP ,TROLL ,P?LDESC
"A nasty-looking troll, brandishing a bloody axe, blocks
all passages out of the room.">
		       <AND <IN? ,TROLL ,HERE>
			    <TELL
CT ,TROLL ", angered and humiliated, recovers his weapon. He appears to have
an axe to grind with you." CR>>
		      T)
		     (<IN? ,TROLL ,HERE>
		      <PUTP ,TROLL ,P?LDESC
"A pathetically babbling troll is here.">
		      <TELL
CT ,TROLL ", disarmed, cowers in terror, pleading for his life in
the guttural tongue of" T ,TROLL "s." CR>
		      T)>)
	      (<EQUAL? .MODE ,F-DEAD ,F-UNCONSCIOUS>
	       <UPDATE-SCORE 5>
	       <USL>
	       <TELL
"|
A wraith slowly materializes before you and speaks: \"You have successfully
completed this" ,EXCERPT " from Zork I and are ready to fully explore the
vast world of the Great Underground Empire in the Zork Trilogy and the other
works of interactive fiction from Infocom.\" With that, he leaves you to
ponder your fate. Very odd, to say the least." CR>
	       <FINISH>)
	      (<EQUAL? .MODE ,F-FIRST?>
	       <COND (<PROB 33>
		      <SETG TROLL-FIGHT T>
		      <SETG P-CONT <>>
		      T)>)
	      (<NOT .MODE>
	       <COND (<VERB? EXAMINE>
		      <TELL <GETP ,TROLL ,P?LDESC> CR>)
		     (<OR <AND <VERB? THROW GIVE>
			       ,PRSO
			       <EQUAL? ,PRSI ,TROLL>>
			  <VERB? TAKE MOVE MUNG>>
		      <AWAKEN ,TROLL>
		      <COND (<VERB? THROW GIVE>
			     <COND (<AND <PRSO? ,AXE>
					 <IN? ,AXE ,WINNER>>
				    <TELL
CT ,TROLL " scratches his head in confusion, then takes the axe." CR>
				    <SETG TROLL-FIGHT T>
				    <MOVE ,AXE ,TROLL>
				    <RTRUE>)
				   (<PRSO? ,TROLL ,AXE>
				    <TELL
"You would have to get" T ,PRSO " first, and that seems unlikely." CR>
				    <RTRUE>)>
			     <COND (<VERB? THROW>
				    <TELL
CT ,TROLL ", who is remarkably coordinated, catches" T ,PRSO>)
				   (T
				    <TELL
CT ,TROLL ", who is not overly proud, graciously accepts the gift">)>
			     <COND (<AND <PROB 20>
					 <PRSO? ,KNIFE ,SWORD ,AXE>>
				    <REMOVE-CAREFULLY ,PRSO>
				    <TELL
" and eats it hungrily. Poor troll, he dies from an internal hemorrhage
and his carcass disappears in a sinister black fog." CR>
				    <REMOVE-CAREFULLY ,TROLL>
				    <APPLY <GETP ,TROLL ,P?ACTION> ,F-DEAD>
				    <SETG TROLL-FLAG T>)
				   (<PRSO? ,KNIFE ,SWORD ,AXE>
				    <MOVE ,PRSO ,HERE>
				    <TELL
" and, being for the moment sated, throws it back. Fortunately," T ,TROLL
" has poor control, and" T ,PRSO " falls to the floor. He does
not look pleased." CR>
				    <SETG TROLL-FIGHT T>)
				   (T
				    <TELL
" and, not having the most discriminating tastes, gleefully eats it." CR>
				    <REMOVE-CAREFULLY ,PRSO>)>)
			    (<VERB? TAKE MOVE>
			     <TELL
CT ,TROLL " spits in your face, grunting \"Better luck next time\" in a
rather barbarous accent." CR>)
			    (<VERB? MUNG>
			     <TELL
CT ,TROLL " laughs at your puny gesture." CR>)>)
		     (<VERB? LISTEN>
		      <TELL
"Every so often" T ,TROLL " says something, probably uncomplimentary, in
his guttural tongue." CR>)
		     (<AND ,TROLL-FLAG <VERB? HELLO>>
		      <TELL "Unfortunately," T ,TROLL " can't hear you." CR>)>)>>

\

"SUBTITLE GRATING/MAZE"

;<GLOBAL LEAVES-GONE <>> ;"not referenced, removed 2/27/85 by SEM"
;<GLOBAL GRUNLOCK <>> ;"not referenced, removed 2/27/85 by SEM"
<GLOBAL GRATE-REVEALED <>>

<ROUTINE LEAVES-APPEAR ()
	<COND (<AND <NOT <FSET? ,GRATE ,OPENBIT>>
	            <NOT ,GRATE-REVEALED>>
	       <COND (<VERB? MOVE TAKE>
		      <TELL
"In disturbing" T ,LEAVES "," A ,GRATE " is revealed." CR>)
		     (T <TELL
"With the leaves moved," A ,GRATE " is revealed." CR>)>
	       <FCLEAR ,GRATE ,INVISIBLE>
	       <THIS-IS-IT ,GRATE>
	       <SETG GRATE-REVEALED T>)>
	<>>

<ROUTINE LEAF-PILE ()
	<COND (<VERB? COUNT>
	       <TELL "There are 69,105 leaves here." CR>)
	      ;(<VERB? BURN>
	       <LEAVES-APPEAR>
	       <REMOVE-CAREFULLY ,PRSO>
	       <COND (<IN? ,PRSO ,HERE>
		      <TELL
"The leaves burn." CR>)
		     (T
		      <JIGS-UP
"The leaves burn, and so do you.">)>)
	      (<VERB? CUT>
	       <TELL "You rustle the leaves around, making quite a mess." CR>
	       <LEAVES-APPEAR>
	       <RTRUE>)
	      (<VERB? MOVE TAKE>
	       <COND (<VERB? MOVE>
		      <TELL "Done." CR>)>
	       <COND (,GRATE-REVEALED <RFALSE>)>
	       <LEAVES-APPEAR>
	       <COND (<VERB? TAKE> <RFALSE>)
		     (T <RTRUE>)>)
	      (<AND <VERB? LOOK-UNDER>
		    <NOT ,GRATE-REVEALED>>
	       <TELL "Underneath" T ,LEAVES " is" A ,GRATE ". As you
release the leaves," T ,GRATE " is once again concealed from view." CR>)>>
 
<ROUTINE CLEARING-FCN (RARG)
  	 <COND (<EQUAL? .RARG ,M-ENTER>
		<COND (<NOT ,GRATE-REVEALED>
		       <FSET ,GRATE ,INVISIBLE>)>)
	       (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are in a clearing, with" A ,FOREST " surrounding you on all sides. A path
leads south.">
		<COND (<FSET? ,GRATE ,OPENBIT>
		       <CRLF>
		       <TELL
"There is an open " D ,GRATE ", descending into darkness.">)
		      (,GRATE-REVEALED
		       <CRLF>
		       <TELL
"There is" A ,GRATE " securely fastened into the ground.">)>
		<CRLF>)>>

<ROUTINE GRATE-FUNCTION ()
    	 <COND (<VERB? LOCK>
		<COND (<EQUAL? ,HERE ,GRATING-CLEARING>
		       <TELL "You can't lock it from this side." CR>)>)
	       (<AND <VERB? UNLOCK> <PRSO? ,GRATE>>
		<TELL ,YOU-CANT
"unlock" A ,GRATE " with" A ,PRSI "!" CR>)
               (<VERB? PICK>
		<TELL "You can't pick the lock." CR>)
               (<VERB? OPEN CLOSE>
		<TELL CT ,GRATE " is locked." CR>)
	       (<AND <VERB? PUT> <EQUAL? ,PRSI ,GRATE>>
		<COND (<G? <GETP ,PRSO ,P?SIZE> 20>
		       <TELL "It won't fit through" TR ,GRATE>)
		      (T
		       <REMOVE ,PRSO>
		       <TELL
CT ,PRSO " goes through" T ,GRATE " into the darkness below." CR>)>)>>

<ROUTINE KNIFE-F ()
	 <COND (<VERB? TAKE>
		<FCLEAR ,ATTIC-TABLE ,NDESCBIT>
		<RFALSE>)>>

<GLOBAL LUCKY T>

;<ROUTINE WITH-TELL (OBJ) ;"not referenced, removed 2/27/85 by SEM"
	 <TELL "With " A .OBJ "?" CR>>

<ROUTINE BOTTLE-FUNCTION ("AUX" (E? <>))
  <COND (<VERB? THROW>
	 <REMOVE-CAREFULLY ,PRSO>
	 <SET E? T>
	 <TELL CT ,BOTTLE " hits the far wall and shatters." CR>)
	(<VERB? MUNG>
	 <SET E? T>
	 <REMOVE-CAREFULLY ,PRSO>
	 <TELL "A brilliant maneuver destroys" TR ,BOTTLE>)
	(<VERB? SHAKE>
	 <COND (<AND <FSET? ,PRSO ,OPENBIT> <IN? ,WATER ,PRSO>>
		<SET E? T>)>)>
  <COND (<AND .E? <IN? ,WATER ,PRSO>>
	 <TELL CT ,WATER " spills to the floor and evaporates." CR>
	 <REMOVE-CAREFULLY ,WATER>
	 T)
	(.E? <RTRUE>)>>

;<GLOBAL EGG-SOLVE <>> ;"not referenced, removed 2/27/85 by SEM"

;
<ROUTINE MOVE-ALL (FROM TO "AUX" X N) ;"not referenced, removed 2/27/85 by SEM"
	 <COND (<SET X <FIRST? .FROM>>
		<REPEAT ()
			<COND (<NOT .X> <RETURN>)>
			<SET N <NEXT? .X>>
			<FCLEAR .X ,INVISIBLE>
			<MOVE .X .TO>
			<SET X .N>>)>>

<ROUTINE FRONT-DOOR-FCN ()
	 <COND (<VERB? OPEN>
		<TELL CT ,FRONT-DOOR " cannot be opened." CR>)
	       ;(<VERB? BURN>
		<TELL
		 "You cannot burn this door." CR>)
	       (<VERB? MUNG>
		<TELL <PICK-ONE ,DOORMUNGS> CR>)
	       (<VERB? LOOK-BEHIND>
		<TELL "It won't open." CR>)>>

<GLOBAL DOORMUNGS
	<LTABLE 0 "You cannot damage this door."
	       "The door is still under warranty.">>

<ROUTINE ZORK-PAINTING-FCN ()
	 <COND (<VERB? MUNG CUT>
		<COND (<EQUAL? <GETP ,ZORK-PAINTING ,P?TVALUE> 0>
		       <TELL "It's already quite mangled, thank you." CR>
		       <RTRUE>)>
		<PUTP ,PRSO ,P?TVALUE 0>
		<FSET ,ZORK-PAINTING ,TOUCHBIT>
		<PUTP ,PRSO ,P?VALUE 0>
		<PUTP ,PRSO ,P?LDESC
"There is a worthless piece of canvas here.">
		<TELL
"Congratulations! Unlike the other vandals, who merely stole the
artist's masterpieces, you have destroyed one." CR>)
	       (<VERB? EXAMINE>
		<TELL "It's ">
		<COND (<EQUAL? <GETP ,ZORK-PAINTING ,P?TVALUE> 0>
		       <TELL 
"now a worthless piece of canvas, thanks to your handiwork">)
		      (T
		       <TELL "a painting of unparalleled beauty">)>
		<TELL ,PERIOD-CR>)>>

<ROUTINE LANTERN ()
	 <COND (<VERB? THROW>
		<TELL
"The lamp smashes onto the floor">
		<COND (<FSET? ,LAMP ,ONBIT>
		       <TELL ", and the light goes out">)>
		<TELL ,PERIOD-CR>
		<DEQUEUE I-LANTERN>
	 	<FCLEAR ,LAMP ,ONBIT>
		<FSET ,LAMP ,TOUCHBIT>
	 	<FCLEAR ,LAMP ,LIGHTBIT>
	 	<PUTP ,LAMP ,P?SDESC "broken lantern">
	 	<PUTP ,LAMP ,P?ACTION 0>
		;<REMOVE-CAREFULLY ,LAMP>
		;<MOVE ,BROKEN-LAMP ,HERE>)
	       (<VERB? ON>
		<COND (<FSET? ,LAMP ,RMUNGBIT>
		       <TELL "A burned-out lamp won't light." CR>)
		      (T
		       <QUEUE I-LANTERN -1>
		       <>)>)
	       (<VERB? OFF>
		<COND (<FSET? ,LAMP ,RMUNGBIT>
		       <TELL "The lamp has already burned out." CR>)
		      (T
		       <DEQUEUE I-LANTERN>
		       <>)>)
	       (<VERB? EXAMINE>
		<TELL "The lamp ">
		<COND (<FSET? ,LAMP ,RMUNGBIT>
		       <TELL "has burned out.">)
		      (<FSET? ,LAMP ,ONBIT>
		       <TELL "is on.">)
		      (T
		       <TELL "is turned off.">)>
		<CRLF>)>>

<ROUTINE MAILBOX-F ()
	 <COND (<VERB? TAKE>
		<TELL "It is securely anchored." CR>)>>

<GLOBAL LAMP-LIFE 300>

<ROUTINE I-LANTERN ()
	 <QUEUE I-LANTERN -1>
	 <SETG LAMP-LIFE <- ,LAMP-LIFE 1>>
	 <COND (<AND <NOT <ULTIMATELY-IN? ,LAMP ,PROTAGONIST>>
		     <NOT <IN? ,LAMP ,HERE>>>
		<COND (<EQUAL? ,LAMP-LIFE 0>
		       <LAMP-OUT>)>
		<RTRUE>)
	       (<EQUAL? ,LAMP-LIFE 100>
		<TELL "The lamp appears a bit dimmer." CR>)
	       (<EQUAL? ,LAMP-LIFE 70>
		<TELL "The lamp is definitely dimmer now." CR>)
	       (<EQUAL? ,LAMP-LIFE 15>
		<TELL "The lamp is nearly out." CR>)
	       (<EQUAL? ,LAMP-LIFE 0>
		<TELL "The lamp goes out." CR>
		<LAMP-OUT>)>>
		 
<ROUTINE LAMP-OUT ()
	 <FSET ,LAMP ,MUNGBIT>
	 <FCLEAR ,LAMP ,ONBIT>
	 <DEQUEUE I-LANTERN>>

;<ROUTINE I-LANTERN ("AUX" TICK (TBL <VALUE LAMP-TABLE>))
	 <QUEUE I-LANTERN <SET TICK <GET .TBL 0>>>
	 <LIGHT-INT ,LAMP .TBL .TICK>
	 <COND (<NOT <0? .TICK>>
		<SETG LAMP-TABLE <REST .TBL 4>>)>>

;<ROUTINE LIGHT-INT (OBJ TBL TICK)
	 <COND (<0? .TICK>
		<FCLEAR .OBJ ,ONBIT>
		<FSET .OBJ ,RMUNGBIT>)>
	 <COND (<OR <ULTIMATELY-IN? .OBJ ,PROTAGONIST> <IN? .OBJ ,HERE>>
		<COND (<0? .TICK>
		       <TELL
"You'd better have more light than from the " D .OBJ "." CR>)
		      (T
		       <TELL <GET .TBL 1> CR>)>)>>

;<ROUTINE MIN (N1 N2) ;"not referenced, removed 2/27/85 by SEM"
	 <COND (<L? .N1 .N2> .N1)
	       (T .N2)>>

<ROUTINE SWORD-FCN ("AUX" G)
	 <COND (<AND <VERB? TAKE> <EQUAL? ,WINNER ,PROTAGONIST>>
		;<QUEUE I-SWORD -1>
		<>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,CELLAR>
		       <TELL
"Your sword is glowing with a faint blue glow." CR>)
		      (<EQUAL? ,HERE ,TROLL-ROOM>
		       <TELL
"Your sword is glowing very brightly." CR>)>)>>

<ROUTINE RAINBOW-FCN ()
	 <COND (<VERB? CROSS ENTER BOARD>
		<COND (<EQUAL? ,HERE ,CANYON-VIEW>
		       <TELL "From here?!?" CR>
		       <RTRUE>)>
		<TELL "I didn't know you could walk on water vapor."
			     CR>)
	       (<VERB? LOOK-UNDER>
		<TELL "The Frigid River flows under the rainbow." CR>)>>

<ROUTINE RIVER-FUNCTION ()
	 <COND (<AND <VERB? PUT>
		     <PRSI? ,RIVER>>
		<REMOVE-CAREFULLY ,PRSO>
	        <TELL
CT ,PRSO " splashes into" T ,WATER " and is gone forever." CR>)
	       (<VERB? LEAP ENTER CROSS>
		<TELL
"A look before leaping reveals that" T ,RIVER " is wide and dangerous,
with swift currents and large, sharp, half-hidden rocks. You therefore
decide to forgo your ill-considered swim." CR>)>>

<ROUTINE TREE-ROOM (RARG "AUX" F T-PRSO)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are about 10 feet above the ground nestled among some large
branches. The nearest branch above you is above your reach." CR>)
	       (<EQUAL? .RARG ,M-BEG>
		<COND (<VERB? DROP>
		       <COND (<IDROP> <RTRUE>)
			     (<AND <PRSO? ,NEST> <IN? ,EGG ,NEST>>
			      <TELL
"The nest falls to the ground, and the egg spills out of it, seriously
damaged." CR>
			      <BREAK-EGG>
			      <RTRUE>)
			     (<PRSO? ,EGG>
			      <TELL
"The egg falls to the ground and springs open, seriously damaged.">
			      <MOVE ,EGG ,PATH>
			      <BAD-EGG>
			      <CRLF>)
			     (<NOT <PRSO? ,WINNER ,TREE>>
			      <MOVE ,PRSO ,PATH>
			      <TELL
CT ,PRSO " falls to the ground." CR>)>)
		      (<VERB? LEAP>
		       <JIGS-UP
"That was just a bit too far down.">)>)
	       (<EQUAL? .RARG ,M-ENTER> <QUEUE I-FOREST-ROOM -1>)>>

<ROUTINE EGG-OBJECT ()
	 <COND (<AND <VERB? OPEN> <PRSO? ,EGG>>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <TELL "The egg is already open." CR>)
		      (<NOT ,PRSI>
		       <TELL "You have neither the tools nor the expertise."
			     CR>)
		      (<EQUAL? ,PRSI ,HANDS>
		       <TELL "I doubt you could do that without damaging it."
			     CR>)
		      (<FSET? ,PRSI ,WEAPONBIT>
		       <PERFORM ,V?MUNG ,EGG>)
		      ;(<FSET? ,PRSO ,FIGHTBIT>
		       <TELL "Not to say that using the "
			     D ,PRSI
			     " isn't original too..." CR>)
		      (T
		       <TELL "The concept of using a "
			     D ,PRSI
			     " is certainly original." CR>
		       ;<FSET ,PRSO ,FIGHTBIT>)>)
	       (<AND <VERB? MUNG> <PRSO? EGG>>
		<TELL
"The egg is now open, but the clumsiness of your attempt has seriously
compromised its esthetic appeal.">
		<BAD-EGG>
		<CRLF>)		
	       (<VERB? CLIMB-ON>
		<TELL
"There is a noticeable crunch from beneath you, and inspection reveals
that the egg is lying open, badly damaged.">
		<BAD-EGG>
		<CRLF>)
	       (<VERB? OPEN MUNG THROW>
		<COND (<VERB? THROW> <MOVE ,PRSO ,HERE>)>
		<TELL
"Your rather indelicate handling of the egg has caused it some damage,
although you have succeeded in opening it.">
		<BAD-EGG>
		<CRLF>)>>

<ROUTINE BAD-EGG ("AUX" L)
	 <COND (<IN? ,BROKEN-CANARY ,EGG>
		<TELL " " <GETP ,BROKEN-CANARY ,P?FDESC>>)
	       (T <REMOVE-CAREFULLY ,BROKEN-CANARY>)>
	 <BREAK-EGG>
	 <RTRUE>>

<ROUTINE BREAK-EGG ()
	 <PUTP ,EGG ,P?SDESC "broken jewel-encrusted egg">
	 <FSET ,EGG ,OPENBIT>
	 <FSET ,EGG ,SCOREDBIT>
	 <PUTP ,EGG ,P?TVALUE 0>>

;<GLOBAL SING-SONG <>> ;"not referenced, removed 2/27/85 by SEM"

<ROUTINE CANARY-OBJECT ()
	 <COND (<VERB? SET>
		<TELL
"There is an unpleasant grinding noise from inside the canary." CR>)>>

<ROUTINE FOREST-ROOM? ()
	 <OR <EQUAL? ,HERE ,FOREST-1 ,FOREST-2 ,FOREST-3>
	     <EQUAL? ,HERE ,PATH ,UP-A-TREE>>>

<ROUTINE I-FOREST-ROOM ()
	 <COND (<NOT <FOREST-ROOM?>>
		<DEQUEUE I-FOREST-ROOM>
		<RFALSE>)
	       (<PROB 15>
		<TELL
"You hear in the distance the chirping of" AR ,SONGBIRD>)>>

<ROUTINE FOREST-ROOM (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER> <QUEUE I-FOREST-ROOM -1>)
	       (<EQUAL? .RARG ,M-BEG>
		<COND (<AND <VERB? CLIMB CLIMB-UP>
			    <PRSO? ,TREE>>
		       <DO-WALK ,P?UP>)>)>>

<ROUTINE MOUNTAINS-ROOM (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-BEG>
		     <VERB? CLIMB CLIMB-UP>
		     <PRSO? ,TREE>>
		<TELL 
"There is no tree here suitable for climbing." CR>)>>

<ROUTINE ROPE-FUNCTION ("AUX" RLOC)
	 <COND (<VERB? TIE>
		<TELL "You can't tie" T ,ZORK-ROPE " to that." CR>)>>

;<ROUTINE UNTIE-FROM () ;"not referenced, removed 2/27/85 by SEM"
	 <TELL "It's not attached to that!" CR>>

<ROUTINE SLIDE-FUNCTION ()
	 <COND (<OR <VERB? ENTER CLIMB-UP CLIMB-DOWN CLIMB>
		    <AND <VERB? PUT>
			 <PRSO? ,ME>>>
		<DO-WALK ,P?WEST>
		<RTRUE>)
	       (<VERB? PUT PUT-ON>
		<SLIDER ,PRSO>)>>

<ROUTINE SLIDER (OBJ)
	 <COND (<FSET? .OBJ ,TAKEBIT>
		<TELL CT .OBJ " slides to the floor, and lands at your feet"
		      ,PERIOD-CR>
		<MOVE .OBJ ,CELLAR>)
	       (T <TELL <PICK-ONE ,YUKS> CR>)>>

<ROUTINE CLIFF-OBJECT ()
	 <COND (<OR <VERB? LEAP>
		    <AND <VERB? PUT> <PRSO? ,ME>>>
		<TELL
		 "That would be very unwise. Perhaps even fatal." CR>)
	       (<EQUAL? ,PRSI ,CLIMBABLE-CLIFF>
		<COND (<VERB? PUT THROW>
		       <TELL
CT ,PRSO " tumbles end over end into" T ,RIVER " and is seen no more." CR>
		       <REMOVE-CAREFULLY ,PRSO>)>)>>

<ROUTINE SANDWICH-BAG-FCN ()
	 <COND (<AND <VERB? SMELL>
		     <IN? ,LUNCH ,PRSO>>
		<TELL "It smells of hot peppers." CR>)>>

"MORE RANDOMNESS"

<ROUTINE DOOR-PSEUDO () ;"in Studio"
	 <COND (<VERB? OPEN CLOSE>
		<TELL CT ,FRONT-DOOR " won't budge." CR>)
	       (<VERB? ENTER>
		<DO-WALK ,P?SOUTH>)>>

<ROUTINE PAINT-PSEUDO ()
	 <COND (<VERB? MUNG>
		<TELL "Some paint chips away, revealing more paint." CR>)>>


"SUBTITLE MELEE  -- seriously hacked by TJB, 2/25/87"

"melee actions (object functions for villains called with these"

<CONSTANT F-BUSY? 1>		;"busy recovering weapon?"
<CONSTANT F-DEAD 2>		;"mistah kurtz, he dead."
<CONSTANT F-UNCONSCIOUS 3>	;"into dreamland"
<CONSTANT F-CONSCIOUS 4>	;"rise and shine"
<CONSTANT F-FIRST? 5>		;"strike first?"

\

"blow results"

<CONSTANT MISSED 1>		;"attacker misses"
<CONSTANT UNCONSCIOUS 2>	;"defender unconscious"
<CONSTANT KILLED 3>		;"defender dead"
<CONSTANT LIGHT-WOUND 4>	;"defender lightly wounded"
<CONSTANT SERIOUS-WOUND 5>	;"defender seriously wounded"
<CONSTANT STAGGER 6>		;"defender staggered (miss turn)"
<CONSTANT LOSE-WEAPON 7>	;"defender loses weapon"
<CONSTANT HESITATE 8>		;"hesitates (miss on free swing)"
<CONSTANT SITTING-DUCK 9>	;"sitting duck (crunch!)"

"tables of melee results"

<GLOBAL DEF1
	<TABLE
	 MISSED MISSED MISSED MISSED
	 STAGGER STAGGER
	 UNCONSCIOUS UNCONSCIOUS
	 KILLED KILLED KILLED KILLED KILLED>>

<GLOBAL DEF2A
	<TABLE
	 MISSED MISSED MISSED MISSED MISSED
	 STAGGER STAGGER
	 LIGHT-WOUND LIGHT-WOUND
	 UNCONSCIOUS>>

<GLOBAL DEF2B
	<TABLE
	 MISSED MISSED MISSED
	 STAGGER STAGGER
	 LIGHT-WOUND LIGHT-WOUND LIGHT-WOUND
	 UNCONSCIOUS
	 KILLED KILLED KILLED>>

<GLOBAL DEF3A
	<TABLE
	 MISSED MISSED MISSED MISSED MISSED
	 STAGGER STAGGER
	 LIGHT-WOUND LIGHT-WOUND
	 SERIOUS-WOUND SERIOUS-WOUND>>

<GLOBAL DEF3B
	<TABLE
	 MISSED MISSED MISSED
	 STAGGER STAGGER
	 LIGHT-WOUND LIGHT-WOUND LIGHT-WOUND
	 SERIOUS-WOUND SERIOUS-WOUND SERIOUS-WOUND>>

<GLOBAL DEF3C
	<TABLE
	 MISSED
	 STAGGER STAGGER
	 LIGHT-WOUND LIGHT-WOUND LIGHT-WOUND LIGHT-WOUND
	 SERIOUS-WOUND SERIOUS-WOUND SERIOUS-WOUND>>

<GLOBAL DEF1-RES
	<TABLE DEF1
	       0 ;<REST ,DEF1 2>
	       0 ;<REST ,DEF1 4>>>

<GLOBAL DEF2-RES
	<TABLE DEF2A
	       DEF2B
	       0; <REST ,DEF2B 2>
	       0; <REST ,DEF2B 4>>>

<GLOBAL DEF3-RES
	<TABLE DEF3A
	       0 ;<REST ,DEF3A 2>
	       DEF3B
	       0 ;<REST ,DEF3B 2>
	       DEF3C>>

\

"useful constants"

<CONSTANT STRENGTH-MAX 7>
<CONSTANT STRENGTH-MIN 2>
<CONSTANT CURE-WAIT 30>

\

"I-FIGHT moved to DEMONS"

<ROUTINE DO-FIGHT (LEN "AUX" CNT RES ;"O OO" (OUT <>))
	<REPEAT ()
	      <SET CNT 0>
	      <REPEAT ()
		      <SET CNT <+ .CNT 1>>
		      <COND (<G? .CNT .LEN>
			     <SET RES T>
			     <RETURN T>)>
		      ;<SET OO <GET ,VILLAINS .CNT>>
		      ;<SET O <GET .OO ,V-VILLAIN>>
		      <COND (<NOT ,TROLL-FIGHT>)
			    (<APPLY <GETP ,TROLL ,P?ACTION>
				    ,F-BUSY?>)
			    (<NOT <SET RES
				       <VILLAIN-BLOW
					;.OO
					.OUT>>>
			     <SET RES <>>
			     <RETURN>)
			    (<EQUAL? .RES ,UNCONSCIOUS>
			     <SET OUT <+ 1 <RANDOM 3>>>)>>
	      <COND (.RES
		     <COND (<NOT .OUT> <RETURN>)
			   (T
			    <SET OUT <- .OUT 1>>
			    <COND (<0? .OUT> <RETURN>)>)>)
		    (T <RETURN>)>>>

\

"takes a remark, defender, and good-guy's weapon"

<ROUTINE REMARK (REMARK D W "AUX" (LEN <GET .REMARK 0>) (CNT 0) STR)
	 <REPEAT ()
	         <COND (<G? <SET CNT <+ .CNT 1>> .LEN> <RETURN>)>
		 <SET STR <GET .REMARK .CNT>>
		 <COND (<EQUAL? .STR ,F-WEP> <PRINTD .W>)
		       (<EQUAL? .STR ,F-DEF> <PRINTD .D>)
		       (T <PRINT .STR>)>>
	 <CRLF>>

"Strength of the player is a basic value (S) adjusted by his P?STRENGTH
property, which is normally 0"

<ROUTINE FIGHT-STRENGTH ("OPTIONAL" (ADJUST? T) "AUX" S)
	 <SET S
	      <+ ,STRENGTH-MIN
		 </ ,SCORE
		    </ 35
		       <- ,STRENGTH-MAX ,STRENGTH-MIN>>>>>
	 <COND (.ADJUST? <+ .S <GETP ,WINNER ,P?STRENGTH>>)(T .S)>>

<ROUTINE VILLAIN-STRENGTH (;OO
			   "AUX" ;(VILLAIN <GET .OO ,V-VILLAIN>)
			   OD TMP)
	 <SET OD <GETP ,TROLL ,P?STRENGTH>>
	 <COND (<NOT <L? .OD 0>>
		<COND (<AND ,PRSI
			    <FSET? ,PRSI ,WEAPONBIT>
			    <PRSI? ,SWORD>>
		       <SET TMP <- .OD 1>>
		       <COND (<L? .TMP 1> <SET TMP 1>)>
		       <SET OD .TMP>)>)>
	 .OD>

"find a weapon (if any) in possession of argument"

<ROUTINE FIND-WEAPON (O "AUX" W)
	 <SET W <FIRST? .O>>
	 <COND (<NOT .W>
		<RFALSE>)>
	 <REPEAT ()
		 <COND (<EQUAL? .W ,AXE ,SWORD ,KNIFE>
			<RETURN .W>)
		       (<NOT <SET W <NEXT? .W>>> <RFALSE>)>>>

\

<ROUTINE VILLAIN-BLOW (;OO OUT?
		       "AUX" ;(VILLAIN <GET .OO ,V-VILLAIN>)
		       ;(REMARKS <GET .OO ,V-MSGS>)
		       DWEAPON ATT DEF OA OD TBL RES NWEAPON)
	 <FCLEAR ,WINNER ,STAGGERED>
	 <COND (<FSET? ,TROLL ,STAGGERED>
		<TELL "The " D ,TROLL
		      " slowly regains his feet." CR>
		<FCLEAR ,TROLL ,STAGGERED>
		<RTRUE>)>
	 <SET OA <SET ATT <VILLAIN-STRENGTH>>>
	 <COND (<NOT <G? <SET DEF <FIGHT-STRENGTH>> 0>> <RTRUE>)>
	 <SET OD <FIGHT-STRENGTH <>>>
	 <SET DWEAPON <FIND-WEAPON ,WINNER>>
	 <COND (<L? .DEF 0> <SET RES ,KILLED>)
	       (T
		<COND (<1? .DEF>
		       <COND (<G? .ATT 2> <SET ATT 3>)>
		       <SET TBL <GET ,DEF1-RES <- .ATT 1>>>)
		      (<EQUAL? .DEF 2>
		       <COND (<G? .ATT 3> <SET ATT 4>)>
		       <SET TBL <GET ,DEF2-RES <- .ATT 1>>>)
		      (<G? .DEF 2>
		       <SET ATT <- .ATT .DEF>>
		       <COND (<L? .ATT -1> <SET ATT -2>)
			     (<G? .ATT 1> <SET ATT 2>)>
		       <SET TBL <GET ,DEF3-RES <+ .ATT 2>>>)>
		<SET RES <GET .TBL <- <RANDOM 9> 1>>>
		<COND (.OUT?
		       <COND (<EQUAL? .RES ,STAGGER> <SET RES ,HESITATE>)
			     (T <SET RES ,SITTING-DUCK>)>)>
		<COND (<AND <EQUAL? .RES ,STAGGER>
			    .DWEAPON
			    <PROB 25>>
		       <SET RES ,LOSE-WEAPON>)>
		<REMARK
		  <RANDOM-ELEMENT <GET ,TROLL-MELEE <- .RES 1>>>
		  ,WINNER
		  .DWEAPON>)>
	 <COND (<OR <EQUAL? .RES ,MISSED> <EQUAL? .RES ,HESITATE>>)
	       (<EQUAL? .RES ,UNCONSCIOUS>
		<SET DEF 0>)				;[]
	       (<OR <EQUAL? .RES ,KILLED>
		    <EQUAL? .RES ,SITTING-DUCK>>
		<SET DEF 0>)
	       (<EQUAL? .RES ,LIGHT-WOUND>
		<SET DEF <- .DEF 1>>
		<COND (<L? .DEF 0> <SET DEF 0>)>
		<COND (<G? ,LOAD-ALLOWED 50>
		       <SETG LOAD-ALLOWED <- ,LOAD-ALLOWED 10>>)>)
	       (<EQUAL? .RES ,SERIOUS-WOUND>
		<SET DEF <- .DEF 2>>
		<COND (<L? .DEF 0> <SET DEF 0>)>
		<COND (<G? ,LOAD-ALLOWED 50>
		       <SETG LOAD-ALLOWED <- ,LOAD-ALLOWED 20>>)>)
	       (<EQUAL? .RES ,STAGGER> <FSET ,WINNER ,STAGGERED>)
	       ( ;"T removed to prevent compiler crash"
		<AND <EQUAL? .RES ,LOSE-WEAPON> .DWEAPON>
		<MOVE .DWEAPON ,HERE>
		<COND (<SET NWEAPON <FIND-WEAPON ,WINNER>>
		       <TELL
"Fortunately, you still have" A .NWEAPON "." CR>)>)>
	 <WINNER-RESULT .DEF .RES .OD>>

<ROUTINE HERO-BLOW ("AUX" ;"OO VILLAIN" (OUT? <>) DWEAPON ATT DEF (CNT 0)
		    OA OD TBL RES NWEAPON (LEN 1 ;<GET ,VILLAINS 0>))
	 ;<REPEAT ()
		 <SET CNT <+ .CNT 1>>
		 <COND (<G? .CNT .LEN> <RETURN>)>
		 <SET OO <GET ,VILLAINS .CNT>>
		 <COND (<EQUAL? <GET .OO ,V-VILLAIN> ,PRSO>
			<RETURN>)>>
	 <SETG TROLL-FIGHT T>
	 <COND (<FSET? ,WINNER ,STAGGERED>
		<TELL
"You are still recovering from that last blow, so your attack is
ineffective." CR>
		<FCLEAR ,WINNER ,STAGGERED>
		<RTRUE>)>
	 <SET ATT <FIGHT-STRENGTH>>
	 <COND (<L? .ATT 1> <SET ATT 1>)>
	 <SET OA .ATT>
	 ;<SET VILLAIN <GET .OO ,V-VILLAIN>>
	 <COND (<0? <SET OD <SET DEF <VILLAIN-STRENGTH>>>>
		<COND (<PRSO? ,WINNER>
		       <RETURN <JIGS-UP
"Well, you really did it that time. Is suicide painless?">>)>
		<TELL "Attacking the " D ,TROLL " is pointless." CR>
		<RTRUE>)>
	 <SET DWEAPON <FIND-WEAPON ,TROLL>>
	 <COND (<OR <NOT .DWEAPON> <L? .DEF 0>>
		<TELL "The ">
		<COND (<NOT .DWEAPON> <TELL "unarmed">)
		      (T <TELL "unconscious">)>
		<TELL " " D ,TROLL
		      " cannot defend himself: he dies." CR>
		<SET RES ,KILLED>)
	       (T
		<COND (<1? .DEF>
		       <COND (<G? .ATT 2> <SET ATT 3>)>
		       <SET TBL <GET ,DEF1-RES <- .ATT 1>>>)
		      (<EQUAL? .DEF 2>
		       <COND (<G? .ATT 3> <SET ATT 4>)>
		       <SET TBL <GET ,DEF2-RES <- .ATT 1>>>)
		      (<G? .DEF 2>
		       <SET ATT <- .ATT .DEF>>
		       <COND (<L? .ATT -1> <SET ATT -2>)
			     (<G? .ATT 1> <SET ATT 2>)>
		       <SET TBL <GET ,DEF3-RES <+ .ATT 2>>>)>
		<SET RES <GET .TBL <- <RANDOM 9> 1>>>
		<COND (.OUT?
		       <COND (<EQUAL? .RES ,STAGGER> <SET RES ,HESITATE>)
			     (T <SET RES ,SITTING-DUCK>)>)>
		<COND (<AND <EQUAL? .RES ,STAGGER> .DWEAPON <PROB 25>>
		       <SET RES ,LOSE-WEAPON>)>
		<REMARK
		  <RANDOM-ELEMENT <GET ,HERO-MELEE <- .RES 1>>>
		  ,PRSO
		  ,PRSI>)>
	 <COND (<OR <EQUAL? .RES ,MISSED> <EQUAL? .RES ,HESITATE>>)
	       (<EQUAL? .RES ,UNCONSCIOUS> <SET DEF <- .DEF>>)
	       (<OR <EQUAL? .RES ,KILLED> <EQUAL? .RES ,SITTING-DUCK>>
		<SET DEF 0>)
	       (<EQUAL? .RES ,LIGHT-WOUND>
		<SET DEF <- .DEF 1>>
		<COND (<L? .DEF 0> <SET DEF 0>)>)
	       (<EQUAL? .RES ,SERIOUS-WOUND>
		<SET DEF <- .DEF 2>>
		<COND (<L? .DEF 0> <SET DEF 0>)>)
	       (<EQUAL? .RES ,STAGGER> <FSET ,PRSO ,STAGGERED>)
	       ( ;"T removed to prevent compiler crash"
		<AND <EQUAL? .RES ,LOSE-WEAPON> .DWEAPON>
		<FCLEAR .DWEAPON ,NDESCBIT>
		<FSET .DWEAPON ,WEAPONBIT>
		<MOVE .DWEAPON ,HERE>
		<THIS-IS-IT .DWEAPON>)>
	 <VILLAIN-RESULT ,PRSO .DEF .RES>>

\

<ROUTINE WINNER-RESULT (DEF RES OD)
	 <PUTP ,WINNER
	       ,P?STRENGTH
	       <COND (<0? .DEF> -10000)(T <- .DEF .OD>)>>
	 <COND (<L? <- .DEF .OD> 0>
		<QUEUE I-CURE ,CURE-WAIT>)>
	 <COND (<NOT <G? <FIGHT-STRENGTH> 0>>
		<PUTP ,WINNER ,P?STRENGTH <+ 1 <- <FIGHT-STRENGTH <>>>>>
		<JIGS-UP
"It appears that that last blow was too much for you. I'm afraid you
are dead.">
		<>)
	       (T .RES)>>

<ROUTINE VILLAIN-RESULT (VILLAIN DEF RES)
	 <PUTP .VILLAIN ,P?STRENGTH .DEF>
	 <COND (<0? .DEF>
		<SETG TROLL-FIGHT <>>
		<TELL
"Almost as soon as the " D .VILLAIN " breathes his last breath, a cloud
of sinister black fog envelops him, and when the fog lifts, the
carcass has disappeared." CR>
		<REMOVE-CAREFULLY .VILLAIN>
		<APPLY <GETP .VILLAIN ,P?ACTION> ,F-DEAD>
		.RES)
	       (<EQUAL? .RES ,UNCONSCIOUS>
		<APPLY <GETP .VILLAIN ,P?ACTION> ,F-UNCONSCIOUS>
		.RES)
	       (T .RES)>>

\

;<ROUTINE WINNING? (V "AUX" VS PS) ;"not referenced, removed 2/27/85 by SEM"
	 <SET VS <GETP .V ,P?STRENGTH>>
	 <SET PS <- .VS <FIGHT-STRENGTH>>>
	 <COND (<G? .PS 3> <PROB 90>)
	       (<G? .PS 0> <PROB 75>)
	       (<0? .PS> <PROB 50>)
	       (<G? .VS 1> <PROB 25>)
	       (T <PROB 10>)>>

<ROUTINE I-CURE ("AUX" (S <GETP ,WINNER ,P?STRENGTH>))
	 <COND (<G? .S 0> <SET S 0> <PUTP ,WINNER ,P?STRENGTH .S>)
	       (<L? .S 0> <SET S <+ .S 1>> <PUTP ,WINNER ,P?STRENGTH .S>)>
	 <COND (<L? .S 0>
		<COND (<L? ,LOAD-ALLOWED ,LOAD-MAX>
		       <SETG LOAD-ALLOWED <+ ,LOAD-ALLOWED 10>>)>
		<QUEUE I-CURE ,CURE-WAIT>)
	       (T
		<SETG LOAD-ALLOWED ,LOAD-MAX>
		<DEQUEUE I-CURE>)>>

"FIGHTS"

"messages for winner"

<CONSTANT F-WEP 0>	;"means print weapon name"
<CONSTANT F-DEF 1>	;"means print defender name (villain, e.g.)"

<GLOBAL HERO-MELEE
 <TABLE
  <LTABLE
   <LTABLE "Your " F-WEP " misses the " F-DEF " by an inch.">
   <LTABLE "A good slash, but it misses the " F-DEF " by a mile.">
   <LTABLE "You charge, but the " F-DEF " jumps nimbly aside.">
   <LTABLE "Clang! Crash! The " F-DEF " parries.">
   <LTABLE "A quick stroke, but the " F-DEF " is on guard.">
   <LTABLE "A good stroke, but it's too slow; the " F-DEF " dodges.">>
  <LTABLE
   <LTABLE "Your " F-WEP " crashes down, knocking the " F-DEF " into dreamland.">
   <LTABLE "The " F-DEF " is battered into unconsciousness.">
   <LTABLE "A furious exchange, and the " F-DEF " is knocked out!">
   <LTABLE "The haft of your " F-WEP " knocks out the " F-DEF ".">
   <LTABLE "The " F-DEF " is knocked out!">>
  <LTABLE
   <LTABLE "It's curtains for the " F-DEF " as your " F-WEP " removes his head.">
   <LTABLE "The fatal blow strikes the " F-DEF " square in the heart: He dies.">
   <LTABLE "The " F-DEF " takes a fatal blow and slumps to the floor dead.">>
  <LTABLE
   <LTABLE "The " F-DEF " is struck on the arm; blood begins to trickle down.">
   <LTABLE "Your " F-WEP " pinks the " F-DEF " on the wrist, but it's not serious.">
   <LTABLE "Your stroke lands, but it was only the flat of the blade.">
   <LTABLE "The blow lands, making a shallow gash in the " F-DEF "'s arm!">>
  <LTABLE
   <LTABLE "The " F-DEF " receives a deep gash in his side.">
   <LTABLE "A savage blow on the thigh! The " F-DEF " is stunned but can still fight!">
   <LTABLE "Slash! Your blow lands! That one hit an artery, it could be serious!">
   <LTABLE "Slash! Your stroke connects! This could be serious!">>
  <LTABLE
   <LTABLE "The " F-DEF " is staggered, and drops to his knees.">
   <LTABLE "The " F-DEF " is momentarily disoriented and can't fight back.">
   <LTABLE "The force of your blow knocks the " F-DEF " back, stunned.">
   <LTABLE "The " F-DEF " is confused and can't fight back.">
   <LTABLE "The quickness of your thrust knocks the " F-DEF " back, stunned.">>
  <LTABLE
   <LTABLE "The " F-DEF "'s weapon is knocked to the floor, leaving him unarmed.">
   <LTABLE "The " F-DEF " is disarmed by a subtle feint past his guard.">>>>

"messages for troll"

<GLOBAL TROLL-MELEE

<TABLE
 <LTABLE
  <LTABLE "The troll swings his axe, but it misses.">
  <LTABLE "The troll's axe barely misses your ear.">
  <LTABLE "The axe sweeps past as you jump aside.">
  <LTABLE "The axe crashes against the rock, throwing sparks!">>
 <LTABLE
  <LTABLE "The flat of the troll's axe hits you delicately on the head, knocking
you out. Unconscious, you are easy prey for even a half-wit troll.">>
 <LTABLE
  <LTABLE "The troll neatly removes your head.">
  <LTABLE "The troll's axe stroke cleaves you from the nave to the chops.">
  <LTABLE "The troll's axe removes your head.">>
 <LTABLE
  <LTABLE "The axe gets you right in the side. Ouch!">
  <LTABLE "The flat of the troll's axe skins across your forearm.">
  <LTABLE "The troll's swing almost knocks you over as you barely parry
in time.">
  <LTABLE "The troll swings his axe, and it nicks your arm as you dodge.">>
 <LTABLE
  <LTABLE "The troll charges, and his axe slashes you on your " F-WEP " arm.">
  <LTABLE "An axe stroke makes a deep wound in your leg.">
  <LTABLE "The troll's axe swings down, gashing your shoulder.">>
 <LTABLE
  <LTABLE "The troll hits you with a glancing blow, and you are momentarily
stunned.">
  <LTABLE "The troll swings; the blade turns on your armor but crashes
broadside into your head.">
  <LTABLE "You stagger back under a hail of axe strokes.">
  <LTABLE "The troll's mighty blow drops you to your knees.">>
 <LTABLE
  <LTABLE "The axe hits your " F-WEP " and knocks it spinning.">
  <LTABLE "The troll swings, you parry, but the force of his blow knocks your " F-WEP " away.">
  <LTABLE "The axe knocks your " F-WEP " out of your hand. It falls to the floor.">>
 <LTABLE
  <LTABLE "The troll hesitates, fingering his axe.">
  <LTABLE "The troll scratches his head ruminatively: Might you be magically
protected, he wonders?">>
 <LTABLE
  <LTABLE "Conquering his fears, the troll puts you to death.">>>>

"each table entry is:"
;<
<CONSTANT V-VILLAIN 0>	;"villain"
<CONSTANT V-BEST 1>	;"best weapon"
<CONSTANT V-BEST-ADV 2>	;"advantage it confers"
<CONSTANT V-PROB 3>	;"prob of waking if unconscious"
<CONSTANT V-MSGS 4>	;"messages for that villain"

"This table must be after TROLL-MELEE,  defined!"

<GLOBAL VILLAINS
	<LTABLE <TABLE TROLL SWORD 1 0 TROLL-MELEE>>>
>

<GLOBAL T-PROB 0>

"DEMONS"

"Fighting demon"

<ROUTINE I-FIGHT ("AUX" (FIGHT? <>) (LEN 1 ;<GET ,VILLAINS 0>)
		  CNT ;"OO O" P)
      ;<COND (,DEAD <RFALSE>)>
      <SET CNT 0>
      <REPEAT ()
	      <SET CNT <+ .CNT 1>>
	      <COND (<G? .CNT .LEN> <RETURN>)>
	      ;<SET OO <GET ,VILLAINS .CNT>>
	      <COND (<AND <IN? ,TROLL ,HERE>
			  <NOT <FSET? ,TROLL ,INVISIBLE>>>
		     <COND (<L? <GETP ,TROLL ,P?STRENGTH> 0>
			    <SET P ,T-PROB>
			    <COND (<AND <NOT <0? .P>> <PROB .P>>
				   <SETG T-PROB 0>
				   <AWAKEN ,TROLL>)
				  (T
				   <SETG T-PROB <+ .P 25>>)>)
			   (<OR ,TROLL-FIGHT
				<APPLY <GETP ,TROLL ,P?ACTION> ,F-FIRST?>>
			    <SET FIGHT? T>)>)
		    (T
		     <COND (,TROLL-FIGHT
			    <APPLY <GETP ,TROLL ,P?ACTION> ,F-BUSY?>)>
		     <FCLEAR ,WINNER ,STAGGERED>
		     <FCLEAR ,TROLL ,STAGGERED>
		     <SETG TROLL-FIGHT <>>
		     <AWAKEN ,TROLL>)>>
      <COND (<NOT .FIGHT?> <RFALSE>)>
      <DO-FIGHT .LEN>>

<ROUTINE AWAKEN (O "AUX" (S <GETP .O ,P?STRENGTH>))
	 <COND (<L? .S 0>
		<PUTP .O ,P?STRENGTH <- 0 .S>>
		<APPLY <GETP .O ,P?ACTION> ,F-CONSCIOUS>)>
	 T>

<ROUTINE ZORK-DIAGNOSE ()            ;"KLUGED TO SAVE TROUBLE."
	 <TELL "You are ">
	 <COND (<G? <- ,LOAD-MAX ,LOAD-ALLOWED> 49>
		<TELL "at death's doorstep">)
	       (<G? <- ,LOAD-MAX ,LOAD-ALLOWED> 29>
		<TELL "badly hurt">)
	       (<G? <- ,LOAD-MAX ,LOAD-ALLOWED> 0>
		<TELL "somewhat wounded">)
	       (T
		<TELL "in perfect health">)>
	 <TELL ,PERIOD-CR>>


<ROUTINE ZORK-SCORE ("OPTIONAL" (ASK? T))
	 #DECL ((ASK?) <OR ATOM FALSE>)
	 <TELL "Your score is ">
	 <TELL N ,SCORE " out of a possible 35 in " N ,MOVES>
	 <COND (<1? ,MOVES>
	        <TELL " move.">)
	       (T
		<TELL " moves.">)>
	 <TELL " This gives you the rank of ">
	 <COND (<L? ,SCORE 30>
		<TELL "Beginner">)
	       (T
		<TELL "Amateur Adventurer">)>
	 <TELL "." CR>>

;<ROUTINE RANDOMIZE-OBJECTS ("AUX" (R <>) F N L)
	 <COND (<IN? ,LAMP ,WINNER>
		<MOVE ,LAMP ,LIVING-ROOM>)>
	 <PUTP ,SWORD ,P?TVALUE 0>
	 <SET N <FIRST? ,WINNER>>
	 <SET L <GET ,ABOVE-GROUND 0>>
	 <REPEAT ()
		 <SET F .N>
		 <COND (<NOT .F> <RETURN>)>
		 <SET N <NEXT? .F>>
		 <COND (<G? <GETP .F ,P?TVALUE> 0>
			<REPEAT ()
				<COND (<NOT .R> <SET R <FIRST? ,ROOMS>>)>
				<COND (<AND <FSET? .R ,RLANDBIT>
					    <NOT <FSET? .R ,ONBIT>>
					    <PROB 50>>
				       <MOVE .F .R>
				       <RETURN>)
				      (ELSE <SET R <NEXT? .R>>)>>)
		       (ELSE
			<MOVE .F <GET ,ABOVE-GROUND <RANDOM .L>>>)>>>

;<ROUTINE STUPID-CONTAINER (OBJ STR) ;"not referenced, removed 2/27/85 by SEM"
	 <COND (<VERB? OPEN CLOSE>
		<TELL
"The " .STR " are safely inside; there's no need to do that." CR>)
	       (<VERB? LOOK-INSIDE EXAMINE>
		<TELL
"There are lots of " .STR " in there." CR>)
	       (<AND <VERB? PUT> <EQUAL? ,PRSI .OBJ>>
		<TELL
"Don't be silly. It wouldn't be" A .OBJ " anymore." CR>)>>

;<ROUTINE DUMB-CONTAINER () ;"not referenced, removed 2/27/85 by SEM"
	 <COND (<VERB? OPEN CLOSE LOOK-INSIDE>
		<TELL "You can't do that." CR>)
	       (<VERB? EXAMINE>
		<TELL "It looks pretty much like" A ,PRSO "." CR>)>>

<ROUTINE GARLIC-F ()
	 <COND (<VERB? EAT>
		<REMOVE-CAREFULLY ,PRSO>
		<TELL
"What the heck! You won't make friends this way, but nobody around
here is too friendly anyhow. Gulp!" CR>)>>

<ROUTINE LUNCH-F ()
	 <COND (<VERB? EAT>
		<REMOVE-CAREFULLY ,PRSO>
		<TELL
"Thank you very much. It really hit the spot." CR>)>> 

<ROUTINE TROLL-ROOM-F (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-ENTER>
		     <IN? ,TROLL ,HERE>>
		<THIS-IS-IT ,TROLL>)>>

<ROUTINE CHASM-PSEUDO ()
	 <COND (<OR <VERB? LEAP-OFF>
		    <ENTERING?>
		    <AND <VERB? PUT> <PRSO? ,ME>>>
		<TELL
"For a change, you look before leaping. You realize you would
never survive." CR>)
	       (<VERB? CROSS 	ENTER>
		<TELL "It's too far to jump, and there's no bridge." CR>)
	       (<VERB? LOOK-INSIDE EXAMINE>
		<TELL "It goes a long way down" ,PERIOD-CR>)
	       (<AND <VERB? PUT THROW> <EQUAL? ,PRSI ,PSEUDO-OBJECT>>
		<TELL
CT ,PRSO " drops out of sight into the chasm." CR>
		<REMOVE-CAREFULLY ,PRSO>)>>

;"ZORK-SPECIFIC TEDIUM"

<ROUTINE REMOVE-CAREFULLY (OBJ "AUX" OLIT)
	 <COND (<EQUAL? .OBJ ,P-IT-OBJECT>
		<SETG P-IT-OBJECT <>>
		;<SETG P-IT-LOC <>>)>
	 <SET OLIT ,LIT>
	 <REMOVE .OBJ>
	 <SETG LIT <LIT? ,HERE>>
	 <COND (<AND .OLIT <NOT <EQUAL? .OLIT ,LIT>>>
		<TELL "You are left in the dark..." CR>)>
	 T>

<GLOBAL DUMMY
	<LTABLE 0 
		"Look around."
	        "Too late for that."
	        "Have your eyes checked.">>

<ROUTINE GO-NEXT (TBL "AUX" VAL)
	 <COND (<SET VAL <LKP ,HERE .TBL>>
		<GOTO .VAL>)>>

<ROUTINE LKP (ITM TBL "AUX" (CNT 0) (LEN <GET .TBL 0>))
	 <REPEAT ()
		 <COND (<G? <SET CNT <+ .CNT 1>> .LEN>
			<RFALSE>)
		       (<EQUAL? <GET .TBL .CNT> .ITM>
			<COND (<EQUAL? .CNT .LEN> <RFALSE>)
			      (T
			       <RETURN <GET .TBL <+ .CNT 1>>>)>)>>>

<GLOBAL LOAD-ALLOWED 100>
<GLOBAL LOAD-MAX 100>
<GLOBAL HS 0>