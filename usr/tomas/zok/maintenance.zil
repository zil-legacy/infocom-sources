<OBJECT THE-THING
	(IN LOCAL-GLOBALS)
	(DESC "THING")
	(SYNONYM THING)
	(ADJECTIVE KJDASDH)
	(SIZE 10)
	(CAPACITY 10)
	(THINGS <PSEUDO (OTHER THING THING-F)>)
	(GENERIC THING-F)
	(DESCFCN THING-F)
	(TEXT "WKDASHDKJ")
	(ACTION THING-F)>

<ROUTINE THING-F ("OPTIONAL" (OARG <>))
	 <COND (.OARG
		<TELL ".">)
	       (T
		<TELL ".">)>>

;"--------SPACE SHIP--------"

;"ROOMS"

<ROOM SHIP-INSIDE
      (IN ROOMS)
      (DESC "Spaceship, Living Quarters")
      (NORTH TO BRIDGE)
      (SOUTH TO MAINTENANCE)
      (OUT PER SHIP-OUT)
      (WEST PER SHIP-OUT)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL SHIP-DOOR)
      (ACTION SHIP-INSIDE-F)>

<ROUTINE SHIP-INSIDE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are inside the living quarters of your ship, the S.K.S. StingRay. Through
a foreward doorway, you can see the bridge. Aft, a crawlway enters the
maintenance area. A large door, which is ">
		<COND (<FSET? ,SHIP-DOOR ,OPENBIT>
		       <TELL ,D-OPEN>)
		      (T
		       <TELL ,D-SHUT>)>
		<TELL ", exits the ship." CR CR
"Mounted to the wall near the door is a switchbox, which is ">
		<COND (<FSET? ,SWITCHBOX ,OPENBIT>
		       <TELL "open">)
		      (T
		       <TELL "closed">)>
		<TELL "." CR>)>>

<ROOM BRIDGE
      (IN ROOMS)
      (DESC "Bridge")
      (LDESC
"This is the bridge of your craft, the S.K.S. StingRay. It's small, featuring
only a control panel and pilot's seat. Above the panel is a
large, plexi-plate windshield. A doorway leads aft, to the living quarters.")
      (SOUTH TO SHIP-INSIDE)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL ENGINE)>

<ROOM MAINTENANCE
      (IN ROOMS)
      (DESC "Maintenance Crawlway")
      (NORTH TO SHIP-INSIDE)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL ENGINE)
      (ACTION MAINTENANCE-F)>

<ROUTINE MAINTENANCE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are crawling, on all fours, through a maintenance access crawlway,
surrounded on all sides by complex machinery. A forward doorway re-enters
the ship's living area. ">
		<COND (,SHIP-BUSTED
		       <TELL
"There seems to be a problem with your hyperdrive ignition." CR>)
		      (T
		       <TELL
"Everything seems to be in order." CR>)>)>>

;"GLOBALS"

<GLOBAL SHIP-BUSTED <>>

;"PSEUDO-OBJS AND GLOBAL-OBJS"

<OBJECT ENGINE
	(IN LOCAL-GLOBALS)
	(DESC "engine")
	(SYNONYM ENGINE MOTOR)
	(ADJECTIVE SHIP SHIPS SHIP'S)
	(FLAGS NDESCBIT)
	(ACTION ENGINE-F)>

<ROUTINE ENGINE-F ()
	 <COND (<VERB? ON>
		<TELL ,BENNY-REMINDS
"this is unwise when the outer doors of the landing bay are closed." CR>
		<RTRUE>)
	       (T
		<TELL "The " D ,ENGINE " is in the aft portion of the ship." CR>)>>

<OBJECT SWITCHBOX
	(IN SHIP-INSIDE)
        (SYNONYM BOX)
	(ADJECTIVE SWITCH)
	(DESC "switch box")
	; (LDESC "Mounted to one wall is a switchbox.")
	(FLAGS NDESCBIT)
	(ACTION SWITCHBOX-FCN)>

<ROUTINE DESCRIBE-BOX ()
	 <COND (<FSET? ,SWITCHBOX ,OPENBIT>
	 	<TELL
"Inside" T ,SWITCHBOX " are" A ,WHITE-BUTTON "," A ,BLACK-BUTTON ", and"
AR ,LEVER "The ">
	 	<COND (<FSET? ,SHIP-DOOR ,OPENBIT>
		       <TELL 
D ,LEVER " is currently in the 'up' position." CR>)
	       	      (T
		       <TELL 
D ,LEVER " is currently in the 'down' position." CR>)>)
	       (T
		<TELL "The " D ,SWITCHBOX " is closed." CR>)>>

<ROUTINE SWITCHBOX-FCN ()
	 <COND (<VERB? OPEN>
		<COND (<FSET? ,SWITCHBOX ,OPENBIT>
		       <ALREADY-OPEN>)
		      (T
		       <TELL ,OKAY "you've opened" TR ,SWITCHBOX>
		       <FSET ,SWITCHBOX ,OPENBIT>
		       <DESCRIBE-BOX>)>)
               (<VERB? CLOSE>
		<COND (<FSET? ,SWITCHBOX ,OPENBIT>
		       <TELL ,OKAY "you've closed" TR ,SWITCHBOX>
		       <FCLEAR ,SWITCHBOX ,OPENBIT>)
		      (T
		       <ALREADY-CLOSED>)>)
	       (<VERB? EXAMINE LOOK-INSIDE>
		<DESCRIBE-BOX>)>>
		
<OBJECT BLACK-BUTTON
	(IN SHIP-INSIDE)
	(SYNONYM BUTTON)
	(ADJECTIVE BLACK)
	(DESC "black button")
	(FLAGS NDESCBIT)
	(ACTION BLACK-BUTTON-F)>

<ROUTINE BLACK-BUTTON-F ()
	 <COND (<OR <NOT <EQUAL? ,HERE ,SHIP-INSIDE>>
		    <NOT <FSET? ,SWITCHBOX ,OPENBIT>>>
		<CANT-SEE-ANY ,BLACK-BUTTON>)
	       (<VERB? PUSH>
		<COND (<FSET? ,SHIP-INSIDE ,ONBIT>
		       <TELL 
"As you push" T ,BLACK-BUTTON ", the lights in this room shut off." CR>
		       <FCLEAR ,SHIP-INSIDE ,ONBIT>)
		      (T
		       <CLICK>)>)>>

<ROUTINE CLICK ()
	 <TELL "Click." CR>>

<OBJECT WHITE-BUTTON
	(IN SHIP-INSIDE)
	(SYNONYM BUTTON)
	(ADJECTIVE WHITE)
	(DESC "white button")
	(FLAGS NDESCBIT)
	(ACTION WHITE-BUTTON-F)>

<ROUTINE WHITE-BUTTON-F ()
	 <COND (<OR <NOT <EQUAL? ,HERE ,SHIP-INSIDE>>
		    <NOT <FSET? ,SWITCHBOX ,OPENBIT>>>
		<CANT-SEE-ANY ,WHITE-BUTTON>)
	       (<VERB? PUSH>
		<COND (<NOT <FSET? ,SHIP-INSIDE ,ONBIT>>
		       <TELL 
"As you push" T ,WHITE-BUTTON ", the lights in this room come on." CR>
		       <FSET ,SHIP-INSIDE ,ONBIT>)
		      (T
		       <CLICK>)>)>>

<OBJECT LEVER
	(IN SHIP-INSIDE)
	(SYNONYM LEVER)
	(DESC "lever")
	(FLAGS NDESCBIT)
	(ACTION LEVER-F)>

<ROUTINE LEVER-F ()
	 <COND (<OR <NOT <EQUAL? ,HERE ,SHIP-INSIDE>>
		    <NOT <FSET? ,SWITCHBOX ,OPENBIT>>>
		<CANT-SEE-ANY ,LEVER>)
	       (<VERB? MOVE LOWER>
		<COND (<NOT <FSET? ,SHIP-DOOR ,OPENBIT>>
		       <TELL 
"The " D ,LEVER "'s already in the 'down' position!" CR>)
		      (T
		       <TELL
"As you move" T ,LEVER " into the 'down' position, the ship's outer door
closes with a grinding sound. Shortly thereafter, you hear the click of the
gangway retracting into the ship." CR>
		       <FCLEAR ,SHIP-DOOR ,OPENBIT>)>)
	       (<VERB? PUSH RAISE>
		<COND (<NOT <FSET? ,SHIP-DOOR ,OPENBIT>>
		       <TELL
"As you move" T ,LEVER " into the 'up' position, the ship's outer door opens,
making a grinding noise. A few moments later, the gangway settles into place,
with a dull thud." CR>
		       <FSET ,SHIP-DOOR ,OPENBIT>)
		      (T
		       <TELL 
"The " D ,LEVER "'s already in the 'up' position!" CR>)>)
	       (<VERB? EXAMINE>
		<TELL "The " D ,LEVER " is currently in the ">
		<COND (<FSET? ,SHIP-DOOR ,OPENBIT>
		       <TELL "'up'">)
		      (T
		       <TELL "'down'">)>
		<TELL " position." CR>)>>

<OBJECT SHIP-TABLE
	(IN SHIP-INSIDE)
	(SYNONYM TABLE)
	(DESC "table")
	(LDESC 
"Against one wall is a metal table, surrounded by several chairs.")
	(FLAGS SURFACEBIT CONTBIT OPENBIT)
	(CAPACITY 50)>

<OBJECT SHIP-CHAIR
	(IN SHIP-INSIDE)
	(SYNONYM CHAIR SEAT)
	(DESC "chair") 
	(FLAGS NDESCBIT SURFACEBIT VEHBIT FURNITURE OPENBIT)>

<OBJECT PILOT-SEAT
	(IN BRIDGE)
	(SYNONYM CHAIR SEAT)
	(ADJECTIVE PILOT PILOT'S PILOTS)
	(DESC "pilot's seat")
        (FLAGS NDESCBIT VEHBIT FURNITURE TRANSBIT OPENBIT)>

<OBJECT CONTROL-PANEL
	(IN BRIDGE)
	(SYNONYM PANEL)
	(ADJECTIVE CONTROL)
	(DESC "control panel")
	(FLAGS NDESCBIT CONTBIT SURFACEBIT SEARCHBIT)
	(ACTION PANEL-F)>

<ROUTINE PANEL-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"This is a standard I.A.A.-approved " D ,CONTROL-PANEL
 " equipped with" A ,WHEEL ","
A ,THROTTLE-LEVER ", and a computer terminal." CR>)>>

<OBJECT WHEEL
	(IN CONTROL-PANEL)
	(SYNONYM WHEEL)
	(ADJECTIVE STEERING)
	(DESC "steering wheel")
	(FLAGS NDESCBIT)
	(ACTION WHEEL-F)>

<ROUTINE WHEEL-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"Like most " D ,WHEEL "s, this one is round." CR>)
	       (<VERB? SET>
		<DUMB-PLAYER>)>>

<OBJECT THROTTLE-LEVER
	(IN CONTROL-PANEL)
	(SYNONYM LEVER)
	(ADJECTIVE THROTTLE)
	(DESC "throttle lever")
	(FLAGS NDESCBIT)
	(ACTION THROTTLE-F)>

<ROUTINE THROTTLE-F ()
	 <COND (<VERB? PUSH MOVE RAISE LOWER>
		<DUMB-PLAYER>)>>

<OBJECT BENNY
	(IN BRIDGE)
	(SYNONYM COMPUTER TERMINAL BENNY BEN)
	(ADJECTIVE COMPUTER ON BOARD ON-BOARD ONBOARD)
	(DESC "Benny")
	(FLAGS NARTICLEBIT ACTORBIT NDESCBIT)
	(ACTION BENNY-F)>

<GLOBAL BENNY-SAYS "Benny, the on-board computer, says, \"">

<ROUTINE BORING-TOPIC ()
	 <TELL
D ,BENNY " starts to respond, but catches himself, realizing the pointlessness
of talking with you about such a boring topic." CR>
	 <RTRUE>>

<ROUTINE BENNY-F ()
	 <COND (<TALKING-TO? ,BENNY>
		<COND (<OR <AND <VERB? TELL-ABOUT>
			       	<PRSO? ,ME>>
			   <AND <VERB? ASK-ABOUT>
				<PRSO? ,BENNY>>>
         	       <COND (<PRSI? ,SPACE-SHIP>
		       	      <TELL ,BENNY-SAYS 
"The ship's holding together pretty well. Everything seems to be in order.\""
CR>
			      <RTRUE>)
		      	     (<PRSI? ,BENNY>
		       	      <TELL ,BENNY-SAYS
"Who, me?? Personally, I think I'm pretty neat!\"" CR>
			      <RTRUE>)
			     (T
			      <BORING-TOPIC>)>)
		      (T
		       <BORING-TOPIC>)>)
	       (<VERB? EXAMINE>
		<TELL 
D ,BENNY " is one of the latest models. You feel lucky to have acquired him
from your beurocratic boss. To input data or instructions to him, you simply
need to talk - no typing necessary." CR>)>>
	       
<ROUTINE DUMB-PLAYER ()
	 <BENNY-REMINDS>
	 <TELL "fiddling with the " D ,PRSO " accomplishes little unless the
engine is on." CR>>

<ROUTINE BENNY-REMINDS () 
	 <TELL "Benny, the on-board computer, reminds you that ">>

<OBJECT WINDOW
	(IN BRIDGE)
	(SYNONYM WINDOW WINDSHIELD SHIELD)
	(ADJECTIVE PLEXI PLATE WIND)
	(DESC "plexi-plate windshield")
	(FLAGS NDESCBIT)
	(ACTION WINDOW-F)>

<ROUTINE WINDOW-F ()
	 <COND (<VERB? LOOK-INSIDE>
		<TELL 
"You see the landing bay, in which your ship is docked." CR>)>>

;"TAKIES"

<OBJECT TOOLBOX
	(IN MAINTENANCE)
	(SYNONYM BOX TOOLBO KIT CHEST)
	(ADJECTIVE TOOL)
	(DESC "toolbox")
	(FLAGS TAKEBIT CONTBIT SEARCHBIT)
	;(ACTION TOOLBOX-F)>

<OBJECT SCREWDRIVER
	(IN TOOLBOX)
	(SYNONYM DRIVER SCREWD TOOL)
	(ADJECTIVE SCREW)
	(DESC "screwdriver")
	(FLAGS TAKEBIT)>

<OBJECT SPANNER
	(IN TOOLBOX)
	(SYNONYM SPANNER TOOL)
	(DESC "spanner")
	(FLAGS TAKEBIT)>

<OBJECT WRENCH
	(IN TOOLBOX)
	(SYNONYM WRENCH TOOL)
	(ADJECTIVE MONKEY)
	(DESC "monkey wrench")	
	(FLAGS TAKEBIT)>

<OBJECT VICE-GRIPS
	(IN TOOLBOX)
	(SYNONYM GRIPS VICE-G TOOL)
	(ADJECTIVE VICE)
	(DESC "vice-grips")
	(FLAGS TAKEBIT)>

<OBJECT NEWSPAPER
	(IN SHIP-TABLE)
	(SYNONYM NEWSPA PAPER NEWS)
	(ADJECTIVE NEWS WEEKLY GALAXY)
	(DESC "newspaper")
	(FLAGS READBIT BURNBIT TAKEBIT)
	(ACTION NEWSPAPER-F)>

<ROUTINE NEWSPAPER-F ()
	 <COND (<VERB? EXAMINE READ>
		<READ-PAPER>)>>
				
<ROUTINE READ-PAPER ()
	 <TELL
"The front page story chronicles the Sultina Gaspar Paloueta's visit to
Tuluth, the headquarters planet of the Tri-galaxy pact, a key enemy of the
Wyrrn Alliance. She and the crew of her vessel, the Camelia have come to ally
with the T.G.P. in warfare against the Wyrrn Alliance." CR>>

<OBJECT COFFEE
	(IN SHIP-TABLE)
	(SYNONYM COFFEE CUP MUG)
	(ADJECTIVE MUG CUP COFFEE)
	(DESC "cup of coffee")
	(FLAGS TAKEBIT)
	(ACTION COFFEE-F)>

<ROUTINE COFFEE-F ()
	 <COND (<VERB? DRINK>
		<TELL
"Aaah. You slowly sip" T ,COFFEE ", tossing out the styrofoam cup." CR>
		<MOVE ,COFFEE ,LOCAL-GLOBALS>)>>

<OBJECT BLASTER
	(IN PROTAGONIST)
	(SYNONYM BLASTER GUN WEAPON PISTOL)
	(ADJECTIVE MY LASER)
	(DESC "your blaster")
	(FLAGS NARTICLEBIT TAKEBIT WEAPONBIT)
 	;(ACTION BLASTER-F)>

;<ROUTINE BLASTER-F ()
	 <COND (<VERB? SHOOT>
	        <TELL>)>>

;"GENERAL ROUTINES"

<ROUTINE SHIP-ENTER ()
	 <COND (<FSET? ,SHIP-DOOR ,OPENBIT>
		<TELL "You walk up the gangway and into..." CR CR>
		<RETURN ,SHIP-INSIDE>)
	       (T
		<TELL 
"The gangway isn't in place, and the ship's door is shut!" CR >)>>

<ROUTINE SHIP-OUT ()
	 <COND (<FSET? ,SHIP-DOOR ,OPENBIT>
		<TELL 
"You walk out of your ship, down the gangway, and into..." CR CR>
		<RETURN ,LANDING-BAY-2>)
	       (T
		<TELL
"You stop yourself, realizing that the ship's outer door is shut." CR>
		<RFALSE>)>>

;"-------FIRST FLOOR-------"

;"ROOMS"

<ROOM LANDING-BAY-2
      (IN ROOMS)
      (DESC "Landing Bay")
      (NORTH TO LANDING-BAY-1)
      (SOUTH TO LANDING-BAY-3)
      (IN PER SHIP-ENTER)
      (EAST PER SHIP-ENTER)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL SHIP-DOOR SPACE-SHIP)
      (ACTION BAY-2-F)>

<ROUTINE BAY-2-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
	        <TELL
"You stand in a landing bay, designed for service and repair ships. The bay
continues north, toward the main complex, and south, toward the huge, metal
bay door. Your ship is parked at your side, the door ">
	 	<COND (<FSET? ,SHIP-DOOR ,OPENBIT>
		       <TELL ,D-OPEN ", and the gangway extended." CR>)
	       	      (T
		       <TELL ,D-SHUT ".">)>)>> 

<ROOM LANDING-BAY-1
      (IN ROOMS)
      (DESC "Landing Bay")
      (NORTH TO UNUSED-HALL IF BAY-DOOR IS OPEN)
      (SOUTH TO LANDING-BAY-2)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL BAY-DOOR)
      (ACTION BAY-1-F)>

<ROUTINE BAY-1-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
	        <TELL 
"You are inside a landing bay, which continues to the south. The strip is
particularly well-lit here. A large door, which is ">
	 	<COND (<FSET? ,BAY-DOOR ,OPENBIT>
		       <TELL ,D-OPEN ", enters the main part of the ship,">)
	       	      (T
		       <TELL ,D-SHUT ", lies">)>
	 	       <TELL
" to the north. You can see your ship, to the south, midway down the landing
strip." CR>)>>

<ROOM LANDING-BAY-3
      (IN ROOMS)
      (DESC "Landing Bay")
      (LDESC "You are standing in the southern portion of a landing bay,
designed for repair and service vessels. The bay continues to the north,
where you spot your spaceship, waiting alone, in the middle of the
landing bay. A huge door, to the south, stand between you and empty
space.")
      (NORTH TO LANDING-BAY-2)
      (SOUTH "The outer door is closed.")
      (FLAGS ONBIT RLANDBIT)>

<ROOM UNUSED-HALL
      (IN ROOMS)
      (DESC "Unused Hall")
      (SOUTH TO LANDING-BAY-1 IF BAY-DOOR IS OPEN)
      (WEST TO UNUSED-HALL-WEST)
      (EAST TO UNUSED-HALL-EAST)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL BAY-DOOR)
      (ACTION UNUSED-HALL-F)>

<ROUTINE UNUSED-HALL-F (RARG)
         <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are in the middle of an east-west hallway, probably unused for several
years. Nothing has disturbed the dust layer on the floor for quite some time.
Nothing, that is, but you. A door, to the south, is ">
	        <COND (<FSET? ,BAY-DOOR ,OPENBIT>
		       <TELL ,SEE-THRU "a landing bay">)
		      (T
		       <TELL ,D-SHUT>)>
		<TELL "." CR>)>>       

<ROOM UNUSED-HALL-EAST
      (IN ROOMS)
      (DESC "Unused Hall")
      (EAST TO STORE-ROOM IF STORE-ROOM-DOOR IS OPEN)
      (WEST TO UNUSED-HALL)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL STORE-ROOM-DOOR)
      (ACTION UNUSED-HALL-EAST-F)>

<ROUTINE UNUSED-HALL-EAST-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are in the eastern end of a long-forgotten hall, presumably for
maintenance personnel. The hall runs to the west, and a door, to the
east, ">
		<COND (<FSET? ,STORE-ROOM-DOOR ,OPENBIT>
		       <TELL "opens into a store room of sorts">)
		      (T
		       <TELL "is " ,D-SHUT>)>
		<TELL "." CR>)>>

<ROOM STORE-ROOM
      (IN ROOMS)
      (DESC "Maintenance Store Room")
      (WEST TO UNUSED-HALL-EAST IF STORE-ROOM-DOOR IS OPEN)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL STORE-ROOM-DOOR)
      (ACTION STORE-ROOM-F)>

<ROUTINE STORE-ROOM-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are in a store room, presumably once used for maintenance purposes, but
now forgotten. A door, to the west, is ">
		<COND (<FSET? ,STORE-ROOM-DOOR ,OPENBIT>
		       <TELL ,SEE-THRU "a hallway">)
		      (T
		       <TELL ,D-SHUT>)>
		<TELL "." CR>)>>

<ROOM UNUSED-HALL-WEST
      (IN ROOMS)
      (DESC "Unused Hall")
      (NORTH PER ENTER-ELEVATOR)
      (IN PER ENTER-ELEVATOR)
      (EAST TO UNUSED-HALL)
      ;(UP TO LOBBY-2) ;"FOR DEBUGGING PURPOSES"
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL ELEVATOR-DOOR CALL-BUTTON)
      (ACTION UNUSED-HALL-WEST-F)>

<ROUTINE UNUSED-HALL-WEST-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are at the western end of a long, unused hallway, probably meant for
access to the maintenance landing bay. The hall stretches off to the east.">
		<DESC-VTR-ENTRANCE "northern">)>>

;"GLOBALS"

<OBJECT SPACE-SHIP
	(IN LOCAL-GLOBALS)
	(DESC "your space ship")
	(SYNONYM STINGRAY SHIP SPACESH)
	(ADJECTIVE SKS SPACE STAR MY)
	(FLAGS NDESCBIT NARTICLEBIT TRYTAKEBIT)
	(ACTION SPACE-SHIP-FCN)>

<ROUTINE SPACE-SHIP-FCN ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The ship is tiny, designed for repairing and maintaining only small
spaceliners and cargo ships." CR>)>>

;"DOORS"

<OBJECT BAY-DOOR
	(IN LOCAL-GLOBALS)
	(DESC "door")
	(SYNONYM DOOR)
	(FLAGS DOORBIT NDESCBIT)>

<OBJECT SHIP-DOOR
	(IN LOCAL-GLOBALS)
	(DESC "door")
	(SYNONYM DOOR)
	(ADJECTIVE SHIP SPACE MY)
	(FLAGS DOORBIT NDESCBIT)
	(ACTION SHIP-DOOR-F)>

<ROUTINE SHIP-DOOR-F ()
	 <COND (<VERB? OPEN CLOSE>
		<TELL ,CANT-BUDGE "ship's door." CR>)>>

<OBJECT BAY-3-DOOR
	(IN LANDING-BAY-3)
	(SYNONYM DOOR DOORS)
	(ADJECTIVE HUGE)
	(DESC "door")
	(FLAGS NDESCBIT DOORBIT)
	(ACTION BAY-3-DOOR-F)>

<ROUTINE BAY-3-DOOR-F ()
	 <COND (<VERB? OPEN>
		<TELL ,CANT-BUDGE "outer door." CR>
		<RTRUE>)>>

<OBJECT STORE-ROOM-DOOR
	(IN LOCAL-GLOBALS)
	(DESC "door")
	(SYNONYM DOOR)
	(ADJECTIVE STORE ROOM)
	(FLAGS NDESCBIT DOORBIT)> 
 
;"TAKIES"

<OBJECT FLASHLIGHT
	(IN STORE-ROOM)
	(SYNONYM LIGHT LAMP FLASHL TORCH)
	(ADJECTIVE FLASH DUSTY)
	(DESC "dusty flashlight")
	(FLAGS LIGHTBIT TAKEBIT)
	(ACTION LIGHT-F)>

<ROUTINE LIGHT-F ()
	 <COND (<VERB? ON>
		<COND (<FSET? ,FLASHLIGHT ,ONBIT>
		       <TELL "It already is.">
		       <RTRUE>)
		      (T
		       <TELL 
"You switch on" T ,FLASHLIGHT ", which projects a bright beam of light." CR>
		       <FSET ,FLASHLIGHT ,ONBIT>)>)
	       (<VERB? OFF>
		<COND (<FSET? ,FLASHLIGHT ,ONBIT>
		       <TELL "You switch" T ,FLASHLIGHT " off." CR>
		       <FCLEAR ,FLASHLIGHT ,ONBIT>)
		      (T
		       <TELL "The " D ,FLASHLIGHT " isn't on." CR>
		       <RTRUE>)>)>>

;"------SECOND FLOOR------"

;"ROOMS"

<ROOM MAINTENANCE-HALL-NORTH
      (IN ROOMS)
      (DESC "Maintenance Hallway")
      (NORTH PER ENTER-ELEVATOR)
      (IN PER ENTER-ELEVATOR)
      (SOUTH TO MAINTENANCE-HALL)
      (WEST PER MCC-ENTER-F)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL CALL-BUTTON ELEVATOR-DOOR MCC-DOOR)
      (ACTION MAINTENANCE-HALL-NORTH-F)>

<ROUTINE MAINTENANCE-HALL-NORTH-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL 
"This is the north end of a well-used hallway, which stretches off to the
south.">
		<DESC-VTR-ENTRANCE "northern">

		<TELL "Another door, ">
		<COND (<FSET? ,MCC-DOOR ,OPENBIT>
		      <TELL ,D-OPEN>)
		     (T
		      <TELL ,D-SHUT>)>
		<TELL 
", lies to the west. A sign above the door reads: \"Maintenance Control Core\"
." CR>)>>
		       
<ROOM MAINTENANCE-HALL
      (IN ROOMS)
      (DESC "Maintenance Hallway")
      (LDESC
"You're midway down a long, well-used maintenance hallway, stretching north and
south.")
      (NORTH TO MAINTENANCE-HALL-NORTH)
      (SOUTH TO MAINTENANCE-HALL-SOUTH)
      (FLAGS ONBIT RLANDBIT)>

<ROOM MAINTENANCE-HALL-SOUTH
      (IN ROOMS)
      (DESC "Maintenance Hallway")
      (NORTH TO MAINTENANCE-HALL)
      ;(EAST TO MAINTENANCE-BAY IF MB-DOOR IS OPEN)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL MB-DOOR)
      (ACTION MAINTENANCE-HALL-SOUTH-F)>

<ROUTINE MAINTENANCE-HALL-SOUTH-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You're at the south end of a long hallway. A door, to the east, is ">
		<COND (<FSET? ,MB-DOOR ,OPENBIT>
		       <TELL ,SEE-THRU "a landing bay">)
		      (T
		       <TELL ,D-SHUT>)>
		<TELL "." CR>)>>

;"DOORS"

<OBJECT MB-DOOR
	(IN LOCAL-GLOBALS)
	(SYNONYM DOOR)
	(ADJECTIVE MAINTE BAY)
	(DESC "door")
	(FLAGS NDESCBIT DOORBIT OPENBIT)>

<OBJECT MCC-DOOR
	(IN LOCAL-GLOBALS)
	(SYNONYM DOOR)
	(ADJECTIVE MAINTE CONTROL CORE)
	(DESC "maintenance control core door")
	(FLAGS DOORBIT NDESCBIT)>

;"ROUTINES"

<ROUTINE MCC-ENTER-F ()
	 <COND (<NOT <FSET? ,MCC-DOOR ,OPENBIT>>
		<TELL "The " D ,MCC-DOOR " isn't open." CR>
		<RTRUE>)
	       (T
		<JIGS-UP
"You enter the maintenance control core. Guards, not recognizing your clothing
as that of the Wyrrn Alliance, set upon you with questions. It doesn't take
them long to figure out what you're up to.">
		<RTRUE>)>>

;"ELEVATOR STUFF"


<GLOBAL VTR-LIST
	<TABLE 0
<> <> <>
MAINT-VTR
<> <> <> <>>>  ;"ADD YOUR ELEVATOR TO THE LIST AND INCREMENT FIELD 1"

;<GLOBAL VTR-X
	 <TABLE 0
"" ;"ADJECTIVE LIST FOR ELEVATOR"
<> ;"DOOR OPEN"
""  ;"EXIT DIR NAME (IE 'north')"
P?XXX ;"EXIT DIRECTION"
x  ;"FLOOR NUMBER"
x  ;"LOWEST FLOOR"
x  ;"HIGHEST FLOOR"
,FOO ;"FLOOR 1 EXIT"   "" ;"EXIT DESC FOR SEE-THRU"
,FOO ;"FLOOR 2 EXIT"   "" ;"EXIT DESC FOR SEE-THRU"
,FOO ;"FLOOR 3 EXIT"   "" ;"EXIT DESC FOR SEE-THRU"
,FOO ;"FLOOR 4 EXIT"   "" ;"EXIT DESC FOR SEE-THRU"
,FOO ;"FLOOR 5 EXIT"   "" ;"EXIT DESC FOR SEE-THRU"
,FOO ;"FLOOR 6 EXIT"   "" ;"EXIT DESC FOR SEE-THRU"
>>

<GLOBAL MAINT-VTR
	 <TABLE 0
"grubby, dimly-lit"
<>
"south"
P?SOUTH
2
1
3
UNUSED-HALL-WEST   "dimly-lit hallway"
MAINTENANCE-HALL-NORTH   "well-lit hallway"
ROOM-4   "brightly-lit lobby"
<>   <>
<>   <>
<>   <>
>>

;"Global table-coordinate names"

<GLOBAL ADJ 1>  <GLOBAL DOOROPEN 2>  <GLOBAL EXITNAM 3>  <GLOBAL EXITDIR 4>
<GLOBAL CURFLR 5>  <GLOBAL LOFLR 6>  <GLOBAL HIFLR 7> 

<ROUTINE FLR-DESC ()
	 <TELL <GET ,VTR <+ 7 <* 2 ,HERE-FLOOR>>>>> 

<ROUTINE FLR-EXIT ()
	 <RETURN <GET ,VTR <+ 6 <* 2 ,HERE-FLOOR>>>>>

<ROUTINE VTR-DEBUGGER ()
	 <TELL "VTR DEBUGGING:|
|
ADJECTIVES: " <GET ,VTR ,ADJ> CR "EXIT: " <GET ,VTR ,EXITNAM> CR
"HERE-FOOR: " N ,HERE-FLOOR CR
"CURRENT FLOOR: " N <GET ,VTR ,CURFLR> CR "DOOR OPEN?: ">
	 <COND (<GET ,VTR ,DOOROPEN>
		<TELL "YES">)
	       (T
		<TELL "NO">)>
	 <CRLF>>

<ROUTINE NEAR-ELEVATOR? (WHICH)
	 ;<TELL "ROOM CHECKED: " D <GET .WHICH <+ 6 <* 2 ,HERE-FLOOR>>> CR>
	 ;<TELL "WHICH: " <GET .WHICH ,ADJ> CR>
	 ;<TELL "HERE-FLOOR: " N ,HERE-FLOOR CR>
	 <COND (<EQUAL? ,HERE <GET .WHICH <+ 6 <* 2 ,HERE-FLOOR>>> ,ELEVATOR>
		;<TELL "NEAR!">
	       	<RETURN T>)
	       (T
		;<TELL "NOT NEAR.">
		<RETURN <>>)>>

;<ROUTINE PUT-BUTTONS ("AUX" CNT)
	 <SET CNT 1>
	 <REPEAT ()
		 <MOVE <GET ,BUTTON-TBL .CNT> ,LOCAL-GLOBALS>
		 <COND (<EQUAL? .CNT 6>
			<RETURN>)
		       (T
			<SET CNT <+ .CNT 1>>)>>
	 <SET CNT <GET ,VTR ,LOFLR>>
	 <REPEAT ()
		 <MOVE <GET ,BUTTON-TBL .CNT> ,ELEVATOR>
		 <TELL D <GET ,BUTTON-TBL .CNT>>
		 <COND (<EQUAL? .CNT <GET ,VTR ,HIFLR>>
			<RETURN>)
		       (T
			<SET CNT <+ .CNT 1>>)>>>

<ROUTINE PUT-BUTTONS ()
	 <MOVE ,BUTTON-1 ,ELEVATOR>
	 <MOVE ,BUTTON-2 ,ELEVATOR>
	 <MOVE ,BUTTON-3 ,ELEVATOR>>

<ROUTINE SET-VTR (WHICH)
	 <SETG VTR <GET ,VTR-LIST .WHICH>>
	 <PUT-BUTTONS>>

;<ROUTINE SET-VTR ("AUX" CNT MAX)
	 <SET MAX <+ <GET ,VTR-LIST 1> 1>>  ;"+1 TO ALLOW FOR TBLSIZ FIELD"
	 <TELL "SET-VTR MAX IS " N .MAX>
	 <SET CNT 2>
	 <REPEAT ()
		 <COND (<NEAR-ELEVATOR? <GET ,VTR-LIST .CNT>>
		        <SETG VTR <GET ,VTR-LIST .CNT>>
			<PUT-BUTTONS>
			<TELL "VTR SET, JACKSON." CR>
			<RETURN>)
		       (T
		        <SET CNT <+ .CNT 1>>
		        <COND (<EQUAL? .CNT <+ .MAX 1>>
			       <SETG VTR <>>
			       <RETURN>)>)>>>

<GLOBAL VTR-NUMS
	<TABLE 0
"one" "two" "three" "four" "five" "six">>

<GLOBAL BUTTON-TBL
	<TABLE 0
BUTTON-1 BUTTON-2 BUTTON-3 BUTTON-4 BUTTON-5 BUTTON-6>>

<GLOBAL HERE-FLOOR 1> ;"THE PLAYER'S FLOOR"

<GLOBAL BUTTON-PUSHED 0>  ;"THE NUMBER OF THE BUTTON PUSHED (0 IF NONE)"

<GLOBAL VTR ,MAINT-VTR> ;"WHICH ELEVATOR IS CURRENTLY BEING ACCESSED."

<ROOM ELEVATOR
      (IN ROOMS)
      (DESC "Elevator")
      (OUT PER VTR-EXIT-F)
      (SOUTH PER VTR-EXIT-F)
      (NORTH PER VTR-EXIT-F)
      (EAST PER VTR-EXIT-F)
      (WEST PER VTR-EXIT-F)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL ELEVATOR-DOOR)
      (ACTION ELEVATOR-F)>

<ROUTINE ELEVATOR-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL 
"You are inside a " <GET ,VTR ,ADJ> " elevator compartment. A sliding door,
to the " <GET ,VTR ,EXITNAM> " is ">
		<COND (<GET ,VTR ,DOOROPEN>
		       <TELL ,SEE-THRU> <FLR-DESC>)
		      (T
		       <TELL ,D-SHUT>)>
		<TELL ". On one wall is a set of buttons, numbered from "
<GET ,VTR-NUMS <GET ,VTR ,LOFLR>> " to " <GET ,VTR-NUMS <GET ,VTR ,HIFLR>>
". ">
		<COND (<G? ,BUTTON-PUSHED 0>
		       <TELL
"(The " <GET ,VTR-NUMS ,BUTTON-PUSHED> " button is lit up.) ">)>
		<CRLF>)>> 

<OBJECT BUTTON-1
	(IN LOCAL-GLOBALS)
	(SYNONYM ONE)
	(ADJECTIVE BUTTON FIRST)
	(DESC "first button")
	(FLAGS NDESCBIT)
	(ACTION BUTTON-F)>

<OBJECT BUTTON-2
	(IN LOCAL-GLOBALS)
	(SYNONYM TWO)
	(ADJECTIVE BUTTON SECOND)
	(DESC "second button")
	(FLAGS NDESCBIT)
	(ACTION BUTTON-F)>

<OBJECT BUTTON-3
	(IN LOCAL-GLOBALS)
	(SYNONYM THREE)
	(ADJECTIVE BUTTON THIRD)
	(DESC "third button")
	(FLAGS NDESCBIT)
	(ACTION BUTTON-F)>

<OBJECT BUTTON-4
	(IN LOCAL-GLOBALS)
	(SYNONYM FOUR)
	(ADJECTIVE BUTTON FOURTH)
	(DESC "fourth button")
	(FLAGS NDESCBIT)
	(ACTION BUTTON-F)>

<OBJECT BUTTON-5
	(IN LOCAL-GLOBALS)
	(SYNONYM FIVE)
	(ADJECTIVE BUTTON FIFTH)
	(DESC "fifth button")
	(FLAGS NDESCBIT)
	(ACTION BUTTON-F)>

<OBJECT BUTTON-6
	(IN LOCAL-GLOBALS)
	(SYNONYM SIX)
	(ADJECTIVE BUTTON SIXTH)
	(DESC "sixth button")
	(FLAGS NDESCBIT)
	(ACTION BUTTON-F)>

<GLOBAL BUTTON-LIT? <>>

<OBJECT CALL-BUTTON
	(IN LOCAL-GLOBALS)
	(DESC "elevator call button")
	(SYNONYM BUTTON)
	(ADJECTIVE ELEVATOR CALL)
	(FLAGS NDESCBIT)
	(ACTION CALL-BUTTON-F)>

<ROUTINE CALL-BUTTON-F ()
	 ;<SET-VTR>
	 <COND (<VERB? PUSH>
		;<SET-VTR>
		<COND (<OR ,BUTTON-LIT?
			   <GET ,VTR ,DOOROPEN>>
		       <CLICK>)
		      (<EQUAL? <GET ,VTR ,CURFLR> ,HERE-FLOOR>
		       <OPEN-VTR-DOOR>
		       <RTRUE>)
		      (T
		       ;<PUT ,VTR ,CALLED T>
		       <TELL
"As you press " D ,CALL-BUTTON ", it lights up, and you hear a whirring noise
from far ">
		       <COND (<L? <GET ,VTR ,CURFLR> ,HERE-FLOOR>
			      <TELL "below">)
			     (T
			      <TELL "above">)>
		       <TELL "." CR>
		       <PUT ,VTR ,CURFLR ,HERE-FLOOR>
		       <SETG BUTTON-LIT? T>
		       <QUEUE OPEN-VTR-DOOR 3>
		       <RTRUE>)>)>>
		
<OBJECT ELEVATOR-DOOR
	(IN LOCAL-GLOBALS)
	(DESC "elevator door")
	(SYNONYM DOOR)
	(ADJECTIVE SLIDING ELEVATOR)
	(FLAGS NDESCBIT)
	(ACTION ELEVATOR-DOOR-F)>

<ROUTINE ELEVATOR-DOOR-F ()
	 ;<SET-VTR>
	 <COND (<VERB? OPEN CLOSE>
		<TELL ,CANT-BUDGE "the elevator door." CR>)
	       (<VERB? EXAMINE>
		<TELL "The " D ,ELEVATOR-DOOR " is ">
		<COND (<GET ,VTR ,DOOROPEN>
		       <TELL ,D-OPEN>)
		      (T
		       <TELL ,D-SHUT>)>
		<TELL "." CR>)>>

<ROUTINE SHUT-VTR-DOOR ()
	 <COND (<NEAR-ELEVATOR? ,VTR>
	 	<TELL
"The " D ,ELEVATOR-DOOR " quietly slides shut." CR>)>
	 <PUT ,VTR ,DOOROPEN <>>>

<ROUTINE OPEN-VTR-DOOR ()
	 <SETG BUTTON-LIT? <>>
	 ;<SETG BUTTON-PUSHED 0> ;"NOW HANDLED IN I-ELEVATOR-ARRIVE"
	 <COND (<NEAR-ELEVATOR? ,VTR>
		<TELL
"The " D ,ELEVATOR-DOOR " quietly slides open">
	 <COND (<EQUAL? ,HERE ,ELEVATOR>
		<TELL ", revealing ">
		<FLR-DESC>)>
	 <TELL "." CR>)> 
	 <PUT ,VTR ,DOOROPEN T>
	 <QUEUE SHUT-VTR-DOOR 4>>

<ROUTINE DRIVE-ELEVATOR ("AUX" DISTANCE)
	 <COND (<GET ,VTR ,DOOROPEN>
		<SHUT-VTR-DOOR>)>
	 <TELL
"Machinery begins to whirr softly, and the elevator starts to glide ">
       	 <COND (<G? ,HERE-FLOOR ,BUTTON-PUSHED>
		<TELL "down">)
	       (T	
		<TELL "up">)>
	 <TELL "ward." CR>
	 <DEQUEUE SHUT-VTR-DOOR>
	 <SET DISTANCE <* <- ,HERE-FLOOR ,BUTTON-PUSHED> 2>>
	 <COND (<L? .DISTANCE 1>
		<SET DISTANCE <* .DISTANCE -1>>)> 
	 <QUEUE I-ELEVATOR-ARRIVE <+ .DISTANCE 1>>>

<ROUTINE I-ELEVATOR-ARRIVE ()
	 <TELL
"The elevator slows down and comes to a stop. ">
	 <SETG HERE-FLOOR ,BUTTON-PUSHED>
	 <SETG BUTTON-PUSHED 0>
	 <PUT ,VTR ,CURFLR ,HERE-FLOOR>
	 <OPEN-VTR-DOOR>>

<ROUTINE BUTTON-ALREADY-PUSHED ()
	 <TELL
"A warning light appears. You've already pushed one of the buttons." CR>> 

<ROUTINE SAME-FLOOR ()
	 <TELL
"Nothing happens. (The elevator's already at that floor.)" CR>>

<ROUTINE BUTTON-F ("AUX" BUTTON)
	 <COND (<EQUAL? ,PRSO ,BUTTON-1>
		<SET BUTTON 1>)
	       (<EQUAL? ,PRSO ,BUTTON-2>
		<SET BUTTON 2>)
	       (<EQUAL? ,PRSO ,BUTTON-3>
	        <SET BUTTON 3>)
	       (<EQUAL? ,PRSO ,BUTTON-4>
		<SET BUTTON 4>)
	       (<EQUAL? ,PRSO ,BUTTON-5>
		<SET BUTTON 5>)
	       (T
		<SET BUTTON 6>)>
	 <COND (<VERB? PUSH>
		<COND (<EQUAL? ,BUTTON-PUSHED 0>
		       <COND (<EQUAL? <GET ,VTR ,CURFLR> .BUTTON>
		              <COND (<GET ,VTR ,DOOROPEN>
				     <SAME-FLOOR>)
				    (T 
				     <OPEN-VTR-DOOR>)>)
			     (T
			      <SETG BUTTON-PUSHED .BUTTON>
			      <DRIVE-ELEVATOR>)>)
		      (T
		       <BUTTON-ALREADY-PUSHED>)>)>>

<ROUTINE VTR-EXIT-F ()
	 <COND (<EQUAL? ,P-WALK-DIR P?OUT <GET ,VTR ,EXITDIR>>
		<COND (<GET ,VTR ,DOOROPEN>
		       <FLR-EXIT>)
		      (T
		       <TELL
"You decide not to. (The " D ,ELEVATOR-DOOR "'s closed, dummy.)" CR>
		       <RFALSE>)>)
	       (T
		<TELL ,CANT-GO>)>>

<ROUTINE QUIT-ELEVATOR ()
	 <SETG BUTTON-LIT? <>>
	 <PUT ,VTR ,DOOROPEN <>>>

<ROUTINE ENTER-ELEVATOR ()
	 <COND (<GET ,VTR ,DOOROPEN>
		<RETURN ,ELEVATOR>)
	       (T
	        <TELL
"The sliding door is closed." CR>
		<RFALSE>)>>

<ROUTINE DESC-VTR-ENTRANCE (DIR)
	 ;<SET-VTR>
	 <TELL
" A sliding door, on the " .DIR " wall, is ">
	 <COND (<GET ,VTR ,DOOROPEN>
		<TELL ,SEE-THRU "a tiny compartment">)
	       (T
		<TELL ,D-SHUT>)>
	 <TELL ". A button">
	 <COND (,BUTTON-LIT?
		<TELL ", currently lit,">)>
	 <TELL " is mounted by the sliding door." CR>>

;"GLOBAL EXPRESSIONS"

<GLOBAL CANT-BUDGE "You can't even budge the ">

<GLOBAL D-OPEN "open">

<GLOBAL D-SHUT "closed">

<GLOBAL SEE-THRU "open, and through it you can see ">

<GLOBAL OKAY "Okay, ">