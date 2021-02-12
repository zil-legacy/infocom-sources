"CASTLE for

			       ZORK ZERO
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<ROOM GREAT-HALL
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Great Hall")
      (LDESC
"This is the huge central chamber of Dimwit's castle. The ceiling was
lowered at some point in the past, which helped reduce the frequency of
storm clouds forming in the upper regions of the hall. Arched openings
lead off in the four cardinal directions. A wide stair leads up to the
balcony, and an equally wide but ominously dark stair leads downward.")
      (NORTH TO ENTRANCE-HALL)
      (SOUTH TO AUDIENCE-CHAMBER)
      (EAST TO COURTYARD)
      (WEST TO FORMAL-GARDEN)
      (UP TO BALCONY)
      (DOWN PER LOWER-HALL-ENTER-F)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL STAIRS BANNER)
      (MAP-LOC <PTABLE MAIN-FLOOR-MAP-NUM MAP-GEN-Y-4 MAP-GEN-X-5>)>

<ROUTINE LOWER-HALL-ENTER-F ()
	 <COND (<OR <FSET? ,OUTER-GATE ,OPENBIT>
		    ,TIME-STOPPED>
		<TELL
"Near the bottom of the flight, the steps are blocked by
newly-fallen rubble!" CR>
		<RFALSE>)
	       (T
		,LOWER-HALL)>>

<OBJECT CALENDAR
	(DESC "calendar")
	(LDESC "A calendar for 883 GUE is lying here.")
	(SYNONYM CALENDAR)
	(FLAGS READBIT TAKEBIT)
	(SIZE 3)
	(TEXT
"[This is the \"Lives of the Twelve Flatheads Calendar\" which you can find
in your Zork Zero package.]")>

<OBJECT CALENDAR-ITEMS ;"vocab. for items in calendar pics but not in game"
	(LOC GENERIC-OBJECTS)
	(DESC "it")
	(SYNONYM POISON AX AXE COBRA SKULL KNIFE DAGGER TROPHY
	 	 STICK BALL HELMET EPAULET EPAULETTE MEDAL TEMPLATE PENCIL
		 TRIANGLE CRAYON COMPASS ELEPHANT VOLCANO BRUSH AVOCADO INKWELL
		 RAVEN STAMP CIGAR MOUSE BURNER CELERY MATCH BOWTIE)
	(ADJECTIVE HOCKEY RUBBER BUNSEN)>

<OBJECT PROCLAMATION
	(DESC "proclamation")
	(FDESC "A proclamation hangs on the wall.")
	(OWNER WALL)
	(SYNONYM PROCLAMATION DECREE)
	(FLAGS READBIT TAKEBIT BURNBIT TRYTAKEBIT)
	(SIZE 2)
	(TEXT
"\"The one who can stop the curse of Megaboz, and save the land from
destruction, shall be rewarded with half the wealth of the Empire.|
   (signed) Wurb Flathead|
            King of Quendor|
	    Protector of the Empire|
            Ruler of all the Known Lands\"")
	(ACTION PROCLAMATION-F)>

<ROUTINE PROCLAMATION-F ()
	 <COND (<AND <VERB? TAKE>
		     <FSET? ,PROCLAMATION ,TRYTAKEBIT>>
		<COND (<EQUAL? <ITAKE T> ,M-FATAL>
		       <RTRUE>)
		      (T
		       <PUTP ,PROCLAMATION ,P?OWNER <>>
		       <FCLEAR ,PROCLAMATION ,TRYTAKEBIT>
		       <TELL "You rip the decree from the wall." CR>)>)>>

<ROOM ENTRANCE-HALL
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Entrance Hall")
      (NORTH TO INNER-BAILEY IF PORTCULLIS IS OPEN ELSE
      		"The closed portcullis covers the doorway.")
      (SOUTH TO GREAT-HALL)
      (EAST TO BANQUET-HALL)
      (WEST TO PARLOR)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL PORTCULLIS)
      (RIDDLE
"Some say I fly, but I'm not a bird; I'm often wasted, or so I've heard.
Though I go on endlessly, there's never enough of me! What am I?\"")
      (MAP-LOC <PTABLE MAIN-FLOOR-MAP-NUM MAP-GEN-Y-3 MAP-GEN-X-5>)
      (ACTION ENTRANCE-HALL-F)>

<ROUTINE ENTRANCE-HALL-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is where visitors enter the castle proper, through the wide
doorway to the north. ">
		<COND (<NOT <FSET? ,PORTCULLIS ,OPENBIT>>
		       <TELL
"The doorway is currently blocked by a sturdy portcullis. ">)>
		<TELL
"Oddly, there is a doorbell on the inside of the doorway. Other doorways
lead east, west, and south.">)
	       (<AND <EQUAL? .RARG ,M-END>
		     <IN? ,JESTER ,HERE>
		     <NOT <FSET? ,PORTCULLIS ,OPENBIT>>>
		<SETUP-ORPHAN "answer">)>>

<OBJECT TIME-OBJECT
	(LOC GLOBAL-OBJECTS)
	(DESC "time")
	(SYNONYM TIME)
	(FLAGS NARTICLEBIT)>

<OBJECT DOORBELL
	(LOC ENTRANCE-HALL)
	(DESC "doorbell")
	(SYNONYM DOORBELL BELL)
	(ADJECTIVE DOOR)
	(FLAGS NDESCBIT)
	(ACTION DOORBELL-F)>

<ROUTINE DOORBELL-F ()
	 <COND (<VERB? PUSH TOUCH>
		<COND (<FSET? ,PORTCULLIS ,OPENBIT>
		       <TELL ,NOTHING-HAPPENS>)
		      (T
		       <TELL "\"Ding, dong!\"" CR>
		       <COND (<NOT <IN? ,JESTER ,HERE>>
			      <I-JESTER T>)>
		       <RTRUE>)>)>>

<OBJECT PORTCULLIS
	(LOC LOCAL-GLOBALS)
	(DESC "portcullis")
	(SYNONYM PORTCULLIS)
	(ADJECTIVE STURDY HEAVY IRON)
	(FLAGS DOORBIT)
	(ACTION PORTCULLIS-F)>

<ROUTINE PORTCULLIS-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The portcullis, which is a heavy iron latticework used to block this
entrance doorway, is ">
		<OPEN-CLOSED ,PORTCULLIS>
		<TELL ,PERIOD-CR>)
	       (<AND <VERB? OPEN>
		     <NOT <FSET? ,PORTCULLIS ,OPENBIT>>>
		<TELL
"You try to lift the portcullis, but with no effect (aside from nearly
breaking your back)." CR>)
	       (<AND <VERB? CLOSE>
		     <FSET? ,PORTCULLIS ,OPENBIT>>
		<TELL ,WONT-BUDGE>)>>

<OBJECT MOAT
	(LOC LOCAL-GLOBALS)
	(DESC "moat")
	(SYNONYM MOAT)
	(FLAGS WATERBIT)
	(ACTION MOAT-F)>

<ROUTINE MOAT-F ()
	 <COND (<AND <TOUCHING? ,MOAT>
		     <EQUAL? ,HERE ,PARAPET ,UPPER-BARBICAN>>
		<CANT-REACH ,MOAT>)>>

<ROOM INNER-BAILEY
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Inner Bailey")
      (LDESC
"You are on a narrow grassy strip between the castle (which can be entered
to the south) and the moat. A young elm grows by the side of the moat. A
causeway leads out into the moat to the northwest.")
      (SOUTH TO ENTRANCE-HALL IF PORTCULLIS IS OPEN)
      (NW TO CAUSEWAY)
      (FLAGS RLANDBIT OUTSIDEBIT ONBIT)
      (SYNONYM BAILEY)
      (ADJECTIVE INNER)
      (GLOBAL PORTCULLIS MOAT CAUSEWAY)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-7 MAP-GEN-X-6>)
      (ICON INNER-BAILEY-ICON)>

<OBJECT WORM
	(LOC INNER-BAILEY)
	(DESC "worm")
	(FDESC "A common earthworm is wriggling through the grass.")
	(SYNONYM WORM EARTHWORM PIECE RUBBER)
	(ADJECTIVE COMMON)
	(FLAGS TAKEBIT ANIMATEDBIT)
	(INANIMATE-DESC "piece of rubber")
	(WAND-TEXT "Instantly, the worm stops wriggling.")
	(ANIMATE-ROUTINE I-RUBBER-TO-WORM)
	(SIZE 1)
	(ACTION WORM-F)>

<ROUTINE WORM-F ()
	 <COND (<VERB? EAT>
		<COND (<EQUAL? ,TURNED-INTO ,ROOSTER>
		       <GOOD-MEAL ,WORM>)
		      (T
		       <TELL "Yukko!" CR>)>)
	       (<AND <VERB? RESEARCH>
		     <NOUN-USED? ,WORM ,W?WORM ,W?EARTHWORM>>
		<TELL "\"A low form of ground-dwelling animal life.\"" CR>)>>

<ROUTINE I-RUBBER-TO-WORM ()
	 <FSET ,WORM ,ANIMATEDBIT>
	 <COND (<VISIBLE? ,WORM>
		<TELL "   The worm has resumed wriggling." CR>)
	       (T
		<RFALSE>)>>

<OBJECT SMALL-ELM
	(LOC INNER-BAILEY)
	(DESC "small elm tree")
	(SYNONYM TREE ELM)
	(ADJECTIVE YOUNG SMALL ELM)
	(FLAGS NDESCBIT PLANTBIT)
	(ACTION TREE-F)>

<ROUTINE TREE-F ("OPTIONAL" (ARG <>))
	 <COND (<EQUAL? .ARG ,M-WINNER>
		<PLANT-STUNNED>)
	       (<VERB? GET-NEAR>
		<TELL "You are now standing at the base of the tree." CR>)
	       (<AND <VERB? LISTEN>
		     ,PLANT-TALKER>
		<COND (<PRSO? ,MIGHTY-ELM>
		       <TELL
"The mighty elm rumbles in a voice that bespeaks great age and weariness. It
seems to be pining for its simple, happier, younger days. Most particularly,
it seems to be fondly recalling a playful squirrel named \"Rosebud.\"" CR>)
		      (<PRSO? ,SMALL-ELM>
		       <TELL
"The little elm's roots have, apparently, just reached down to a particularly
yummy patch of decayed mulch, and the young elm is humming rhapsodically about
the yumminess of the minerals therein." CR>)
		      (T
		       <TELL
"The two elms are exchanging off-color jokes, most of which seem to involve
various methods of pollen transfer." CR>)>)
	       (<VERB? CLIMB CLIMB-UP>
		<COND (<PRSO? ,SMALL-ELM>
		       <TELL
"Your weight is too much for this little tree." CR>)
		      (T
		       <TELL ,POORLY-CONFIGURED>)>)
	       (<AND <VERB? LISTEN>
		     ,PLANT-TALKER>
		<TELL
"The tree's speech is very childlike and difficult to understand, but it
seems to be fantasizing about the day when it will be tall enough to see
over the castle walls." CR>)
	       (<VERB? MEASURE>
		<TELL "You can">
		<COND (<PRSO? ,MIGHTY-ELM>
		       <TELL "'t come close to getting">)
		      (T
		       <COND (<PRSO? ,SMALL-ELM>
			      <TELL " easily">)
			     (T
			      <TELL " just barely">)>
		       <TELL " get">)>
		<TELL " your arms around the tree." CR>)>>

<ROOM CAUSEWAY
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Causeway")
      (LDESC
"You are on a peninsula of dirt and gravel which extends into the moat from
the southeast. A tall barbican towers over the end of the causeway, to the
northwest.")
      (SE TO INNER-BAILEY)
      (NW TO BARBICAN)
      (FLAGS RLANDBIT OUTSIDEBIT ONBIT)
      (SYNONYM CAUSEWAY)
      (GLOBAL MOAT BARBICAN)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-6 MAP-GEN-X-5>)
      (ICON CAUSEWAY-ICON)>

<ROOM BARBICAN
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Barbican")
      (NW TO DRAWBRIDGE IF DRAWBRIDGE IS OPEN)
      (SE TO CAUSEWAY)
      (UP TO UPPER-BARBICAN)
      (FLAGS RLANDBIT ONBIT)
      (SYNONYM BARBICAN)
      (ADJECTIVE TALL LOWER)
      (GLOBAL MOAT DRAWBRIDGE FIXED-LADDER UPPER-BARBICAN)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-4>)
      (ICON BARBICAN-ICON)
      (ACTION BARBICAN-F)>

<ROUTINE BARBICAN-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This dimly lit room is the bottom level of the gate-tower which guards the
castle's drawbridge. It lies at the tip of a peninsula into the moat; the rest
of the peninsula is to the southeast. A drawbridge to the northwest is ">
		<OPEN-CLOSED ,DRAWBRIDGE>
		<TELL ", and a ladder leads to an upper level.">)>>

<ROOM UPPER-BARBICAN
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Upper Barbican")
      (LDESC
"This upper level is key to defending the outer perimeter of the castle, with
its commanding view of the causeway, moat and baileys. The floor is filled
with \"murder holes\" for dropping heavy cannonballs onto unwanted visitors
who penetrate as far as the barbican's lower level, just below. A large cast
iron wheel is mounted in the center of the room. The only exit is a ladder
leading down.")
      (DOWN TO BARBICAN)
      (FLAGS RLANDBIT ONBIT)
      (SYNONYM BARBICAN)
      (ADJECTIVE UPPER)
      (GLOBAL FIXED-LADDER MOAT)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-4 MAP-GEN-X-4>)
      (ICON UPPER-BARBICAN-ICON)>

<OBJECT CANNONBALL
	(LOC UPPER-BARBICAN)
	(DESC "cannonball")
	(SYNONYM CANNONBALL BALL)
	(ADJECTIVE HEAVY)
	(FLAGS TAKEBIT)
	(SIZE 50)
	(ACTION CANNONBALL-F)>

<ROUTINE CANNONBALL-F ()
	 <COND (<AND <VERB? PUT-ON>
		     <EQUAL? ,P-PRSA-WORD ,W?DROP>
		     <PRSO? ,CANNONBALL>>
		<MOVE ,CANNONBALL ,HERE>
		<COND (<FSET? ,PRSI ,PARTBIT>
		       <TELL "Ouch!!!" CR>)
		      (<G? <GETP ,PRSI ,P?SIZE> 10>
		       <TELL "This has no effect." CR>)
		      (T
		       <TELL "Miraculously," T ,PRSI " survives." CR>)>)>>

<OBJECT MURDER-HOLE
	(LOC UPPER-BARBICAN)
	(DESC "murder hole")
	(SYNONYM HOLE)
	(ADJECTIVE MURDER)
	(FLAGS NDESCBIT)
	(ACTION MURDER-HOLE-F)>

<ROUTINE MURDER-HOLE-F ()
	 <COND (<VERB? LOOK-INSIDE>
		<TELL "You can just make out the barbican below." CR>)
	       (<VERB? REACH-IN>
		<TELL ,NOTHING-IN-REACH>)
	       (<AND <VERB? PUT PUT-THROUGH>
		     <PRSI? ,MURDER-HOLE>>
		<MOVE ,PRSO ,BARBICAN>
		<COND (<AND <PRSO? ,CANNONBALL>
			    <VISIBLE? ,CANDLE>
			    <FSET? ,CANDLE ,ONBIT>>
		       <COND (<NOT <ULTIMATELY-IN? ,CANDLE>>
			      <MOVE ,CANDLE ,PROTAGONIST>)>
		       <TELL
"As you drop the cannonball through the murder hole, you hear a sickening
\"splat,\" followed by a woman's scream!|
   \"Emily, what is it!\"|
   \"It's Victor -- he's been murdered!\"|
   \"I'll summon the Inspector! Ah, here he is now!\" You hear whispered
questions and answers from the room below, followed by footsteps on the
stairs. The jester enters, wearing a trenchcoat and smoking a large pipe.|
   \"I'm afraid I'm going to have to order Sgt. Duffy to place you under
arrest, sir.\" You grow dizzy with confusion, and your surroundings swirl
wildly about you" ,ELLIPSIS>
		       <GOTO ,DUNGEON>)
		      (T
		       <TELL "You hear a \"thunk\" from down below." CR>)>)>>

<OBJECT WHEEL
	(LOC UPPER-BARBICAN)
	(DESC "wheel")
	(SYNONYM WHEEL)
	(ADJECTIVE LARGE CAST IRON)
	(FLAGS NDESCBIT)
	(ACTION WHEEL-F)>

<ROUTINE WHEEL-F ()
	 <COND (<VERB? SET SET-DIR>
		<COND (<FSET? ,DRAWBRIDGE ,OPENBIT>
		       <FCLEAR ,DRAWBRIDGE ,OPENBIT>)
		      (T
		       <FSET ,DRAWBRIDGE ,OPENBIT>)>
		<FCLEAR ,BARBICAN ,TOUCHBIT>
		<ROB ,DRAWBRIDGE ,BARBICAN>
		<TELL "You hear a clattering clanking noise from below." CR>)>>

<ROOM DRAWBRIDGE
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Drawbridge")
      (SE TO BARBICAN)
      (NW TO OUTER-BAILEY)
      (FLAGS RLANDBIT ONBIT OUTSIDEBIT)
      (SYNONYM BRIDGE DRAWBRIDGE)
      (ADJECTIVE DRAW STURDY WOODEN)
      (GLOBAL DRAWBRIDGE MOAT)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-4 MAP-GEN-X-3>)
      (ICON DRAWBRIDGE-ICON)
      (ACTION DRAWBRIDGE-F)>

<ROUTINE DRAWBRIDGE-F ("OPTIONAL" RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are standing on a sturdy wooden drawbridge across a moat. ">
		<COND (<NOT ,TIME-STOPPED>
		       <TELL
"The surface of the moat roils from the thrashing of countless
ravenous beasts. ">)>
		<TELL
"The drawbridge runs from a tall barbican at the southeast to a wide meadow
at the northwest.">)
	       (.RARG
		<RFALSE>)
	       (<VERB? EXAMINE>
		<TELL "The drawbridge is ">
		<OPEN-CLOSED ,PRSO>
		<TELL ,PERIOD-CR>)
	       (<OR <AND <VERB? OPEN LOWER>
			 <NOT <FSET? ,DRAWBRIDGE ,OPENBIT>>>
		    <AND <VERB? CLOSE RAISE>
			 <FSET? ,DRAWBRIDGE ,OPENBIT>>>
		<TELL "There's no apparent way to do that." CR>)>>
\
<ROOM PARLOR
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Parlor")
      (LDESC
"This is where many of Dimwit's guests would come and sit after dinner,
for wine, conversation, and any other whim that might pop into Dimwit's
head. There are doorways to the east, west and south.")
      (EAST TO ENTRANCE-HALL)
      (SOUTH TO FORMAL-GARDEN)
      (WEST TO TORCH-ROOM)
      (FLAGS RLANDBIT ONBIT)
      (SYNONYM PARLOR)
      (MAP-LOC <PTABLE MAIN-FLOOR-MAP-NUM MAP-GEN-Y-3 MAP-GEN-X-4>)
      (ICON PARLOR-ICON)> 

<OBJECT FISH-TANK
	(LOC PARLOR)
	(DESC "fish tank")
	(SYNONYM TANK AQUARIUM)
	(ADJECTIVE FISH)
	(CAPACITY 50)
	(FLAGS CONTBIT SEARCHBIT OPENBIT TRYTAKEBIT WATERBIT)
	(ACTION FISH-TANK-F)>

<GLOBAL DESCRIBED-TANK-AS-LARGE <>>

<GLOBAL DESCRIBED-TANK-AS-SMALL <>>

<ROUTINE FISH-TANK-F ()
	 <COND (<AND <VERB? TAKE>
		     <PRSO? ,FISH-TANK>>
		<COND (,DESCRIBED-TANK-AS-SMALL
		       <TELL
"The fish tank is much too large to carry! [Okay, I was exaggerating
when I called the tank \"itsy-bitsy.\"]" CR>)
		      (T
		       <SETG DESCRIBED-TANK-AS-LARGE T>
		       <TELL
"This tank is bigger than a lot of swimming pools!" CR>)>)>>

<OBJECT SPENSEWEED
	(OWNER SPENSEWEED)
	(LOC FISH-TANK)
	(DESC "clump of spenseweed")
	(SYNONYM CLUMP SPENSEWEED WEED)
	(ADJECTIVE SPENSE)
	(FLAGS TRYTAKEBIT PLANTBIT)
	(RESEARCH
"\"A deep-rooting underwater plant. Once established, it can usually only be
removed by using certain spells of wilting. The misconception that spenseweed
is a common roadside weed has been perpetuated by grossly inaccurate entries
in the last several editions of THE LORE AND LEGENDS OF QUENDOR.\"")
	(ACTION SPENSEWEED-F)>

<ROUTINE SPENSEWEED-F ("OPTIONAL" (ARG <>))
	 <COND (<EQUAL? .ARG ,M-WINNER>
		<PLANT-STUNNED>)
	       (<AND <VERB? TAKE DIG>
		     <PRSO? ,SPENSEWEED>>
		<TELL "It's firmly rooted." CR>)
	       (<AND <VERB? LISTEN>
		     ,PLANT-TALKER>
		<TELL
"It's difficult to interpret the gurgly voice of the spenseweed, but it seems
to be fretting about the possibility of plant-eating fish being introduced into
the aquarium." CR>)>>

<OBJECT LOBSTER
	(LOC FISH-TANK)
	(DESC "lobster")
	(SYNONYM LOBSTER NUTCRACKER CRACKER)
	(ADJECTIVE NUT)
	(FLAGS TRYTAKEBIT TAKEBIT ANIMATEDBIT)
	(INANIMATE-DESC "nutcracker")
	(WAND-TEXT
"The lobster stops moving. Frozen as it is, with pincers outstretched, it looks
like nothing less than a large nutcracker. In fact, it IS a nutcracker!")
	(ANIMATE-ROUTINE I-NUTCRACKER-TO-LOBSTER)
	(ACTION LOBSTER-F)>

<ROUTINE LOBSTER-F ()
	 <COND (<AND <VERB? RESEARCH>
		     <NOUN-USED? ,LOBSTER ,W?LOBSTER>>
		<TELL "\"A common aquarium pet.\"" CR>)
	       (<AND <VERB? TAKE>
		     <FSET? ,LOBSTER ,ANIMATEDBIT>>
		<COND (,TIME-STOPPED
		       <QUEUE I-LOBSTER-PINCH -1>
		       <RFALSE>)
		      (<FSET? ,GLOVE ,WORNBIT>
		       <QUEUE I-LOBSTER-PINCH 2>
		       <MOVE ,LOBSTER ,PROTAGONIST>
		       <TELL
"Your gloved hand moves with blazing speed, lifting the lobster and
avoiding its snapping pincers." CR>)
		      (T
		       <TELL
"The lobster snaps its pincers at you. You snatch your hand away
just in time." CR>)>)
	       (<AND <VERB? EAT>
		     <FSET? ,LOBSTER ,ANIMATEDBIT>>
		<TELL
"1) It's not cooked. 2) It would probably bite your nose off if you tried. 3)
You don't have any tableware. 4) You don't have any melted butter. 5) It isn't
kosher." CR>)>>

<ROUTINE I-NUTCRACKER-TO-LOBSTER ()
	 <COND (,TIME-STOPPED
		<QUEUE I-NUTCRACKER-TO-LOBSTER 3>
		<RFALSE>)>
	 <FSET ,LOBSTER ,ANIMATEDBIT>
	 <COND (<AND <ULTIMATELY-IN? ,LOBSTER>
		     <NOT <IN? ,LOBSTER ,WALDO>>>
		<TELL
"   Youch! The nutcracker just bit you! As you drop it, you realize that it
has turned back into a lobster.">
		<COND (<EQUAL? ,HERE ,HANGING-FROM-ROOTS ,UNDER-THE-WORLD>
		       <REMOVE ,LOBSTER>
		       <TELL " The poor creature plunges into the void.">)
		      (T
		       <MOVE ,LOBSTER ,HERE>)>
		<CRLF>)
	       (<VISIBLE? ,LOBSTER>
		<TELL
"   You notice the nutcracker waving its pincers. It seems that the
nutcracker is once again a lobster." CR>)
	       (T
		<RFALSE>)>>

<ROUTINE I-LOBSTER-PINCH ()
	 <COND (,TIME-STOPPED
		<RFALSE>)>
	 <DEQUEUE I-LOBSTER-PINCH>
	 <COND (<ULTIMATELY-IN? ,LOBSTER>
		<MOVE ,LOBSTER ,HERE>
		<TELL
"   Youch! The lobster gives you a painful nip, and you drop it
like a hot potato." CR>)
	       (T
		<RFALSE>)>>

<OBJECT STARFISH
	(LOC FISH-TANK)
	(DESC "starfish")
	(PLURAL "starfish")
	(SYNONYM STARFISH FISH STAR)
	(ADJECTIVE STAR)
	(FLAGS TAKEBIT ANIMATEDBIT)
	(INANIMATE-DESC "star")
	(WAND-TEXT
"The starfish, as still as it was before, becomes even more still.")
	(ANIMATE-ROUTINE I-STAR-TO-STARFISH)
	(ACTION STARFISH-F)>

<ROUTINE STARFISH-F ()
	 <COND (<AND <VERB? RESEARCH>
		     <NOUN-USED? ,STARFISH ,W?STARFISH>>
		<TELL "\"A common aquarium pet.\"" CR>)>>

<ROUTINE I-STAR-TO-STARFISH ()
	 <COND (,TIME-STOPPED
		<QUEUE I-STAR-TO-STARFISH 3>
		<RFALSE>)>
	 <FSET ,STARFISH ,ANIMATEDBIT>
	 <COND (<VISIBLE? ,STARFISH>
		<TELL
"   With the tiniest wiggle, the star gives evidence that it is once again
a starfish." CR>)
	       (T
		<RFALSE>)>>

<ROOM TORCH-ROOM
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Torch Room")
      (LDESC
"This is a small room for the storage of torches. The torches kept here
are generally short-lived, for the purpose of brief forays into the
darker regions of the castle. To the east is the lone exit.")
      (EAST TO PARLOR)
      (OUT TO PARLOR)
      (FLAGS RLANDBIT ONBIT)
      (MAP-LOC <PTABLE MAIN-FLOOR-MAP-NUM MAP-GEN-Y-3 MAP-GEN-X-3>)
      (ICON TORCH-ROOM-ICON)>

<OBJECT BICKERING-TORCH
	(LOC TORCH-ROOM)
	(DESC "bickering torch")
	(PLURAL "torches")
	(SYNONYM TORCH TORCHES)
	(ADJECTIVE BICKERING)
	(FLAGS TAKEBIT TRYTAKEBIT)
	(ACTION BICKERING-TORCH-F)>

<ROUTINE BICKERING-TORCH-F ()
	 <COND (<VERB? TAKE>
		<QUEUE I-BICKERING-TORCH -1>
		<RFALSE>)
	       (<VERB? EXAMINE ON BURN>
		<BURNED-OUT ,BICKERING-TORCH>)>>

<ROUTINE BURNED-OUT (OBJ)
	 <TELL "The " D .OBJ " has burned out and cannot be rekindled." CR>>

<ROUTINE I-BICKERING-TORCH ()
	 <COND (,TIME-STOPPED
		<RFALSE>)
	       (<NOT <ULTIMATELY-IN? ,BICKERING-TORCH>>
		<DEQUEUE I-BICKERING-TORCH>
		<RFALSE>)
	       (<PROB 30>
		<TELL
"   The bickering torch says, \"" <PICK-ONE ,BITCHES> "\"" CR>)
	       (T
		<RFALSE>)>>

<CONSTANT BITCHES
	<LTABLE
	 0
	 "All the other torches were picking on me."
	 "Everyone likes the flickering torch better than me."
	 "I saw the guttering torch wasting oil!"
	 "How come I didn't get made out of top-quality wood like
the other torches?"
	 "The muttering torch was talking about burning down the castle.">>

<OBJECT FLICKERING-TORCH
	(LOC TORCH-ROOM)
	(SDESC "flickering torch")
	(PLURAL "torches")
	(SYNONYM TORCH TORCHES)
	(ADJECTIVE FLICKERING)
	(FLAGS TAKEBIT TRYTAKEBIT FLAMEBIT ONBIT)
	(ACTION FLICKERING-TORCH-F)>

<ROUTINE FLICKERING-TORCH-F ()
	 <COND (<AND <VERB? TAKE>
		     <FSET? ,FLICKERING-TORCH ,ONBIT>
		     <EQUAL? ,FLICKERING-TORCH-COUNT 0>>
		<SETG FLICKERING-TORCH-COUNT <+ <RANDOM 3> 9>>
		<QUEUE I-FLICKERING-TORCH -1>
		<RFALSE>)
	       (<AND <VERB? OFF>
		     <FSET? ,FLICKERING-TORCH ,ONBIT>>
		<FCLEAR ,FLICKERING-TORCH ,ONBIT>
		<FCLEAR ,FLICKERING-TORCH ,FLAMEBIT>
		<DEQUEUE I-FLICKERING-TORCH>
		<TELL "\"Pffft.\"" CR>
		<NOW-DARK?>)
	       (<AND <VERB? EXAMINE ON OFF BURN>
		     <NOT <FSET? ,FLICKERING-TORCH ,ONBIT>>>
		<BURNED-OUT ,FLICKERING-TORCH>)>>

<GLOBAL FLICKERING-TORCH-COUNT 0>

<ROUTINE I-FLICKERING-TORCH ()
	 <SETG FLICKERING-TORCH-COUNT <- ,FLICKERING-TORCH-COUNT 1>>
	 <COND (<EQUAL? ,FLICKERING-TORCH-COUNT 0>
		<PUTP ,FLICKERING-TORCH ,P?SDESC "formerly flickering torch">
		<FCLEAR ,FLICKERING-TORCH ,ONBIT>
		<FCLEAR ,FLICKERING-TORCH ,FLAMEBIT>
		<DEQUEUE I-FLICKERING-TORCH>)>
	 <COND (<NOT <VISIBLE? ,FLICKERING-TORCH>>
		<RFALSE>)
	       (<NOT <FSET? ,FLICKERING-TORCH ,ONBIT>>
		<GREAT-TORCH-ROOM-IN-THE-SKY "flick">)
	       (<PROB 40>
		<TELL
"   The flame of the flickering torch dances wildly on the
brink of extinction." CR>)
	       (T
		<RFALSE>)>>

<ROUTINE GREAT-TORCH-ROOM-IN-THE-SKY (STRING)
	 <TELL
"   The " .STRING "ering torch gives its last " .STRING "er before going to
that great Torch Room in the sky." CR>
	 <NOW-DARK?>>

<OBJECT MUTTERING-TORCH
	(LOC TORCH-ROOM)
	(DESC "muttering torch")
	(PLURAL "torches")
	(SYNONYM TORCH TORCHES)
	(ADJECTIVE MUTTERING)
	(FLAGS TAKEBIT TRYTAKEBIT)
	(ACTION MUTTERING-TORCH-F)>

<ROUTINE MUTTERING-TORCH-F ()
	 <COND (<VERB? TAKE>
		<QUEUE I-MUTTERING-TORCH -1>
		<RFALSE>)		
	       (<VERB? EXAMINE ON BURN>
		<BURNED-OUT ,MUTTERING-TORCH>)>>

<ROUTINE I-MUTTERING-TORCH ()
	 <COND (,TIME-STOPPED
		<RFALSE>)
	       (<NOT <ULTIMATELY-IN? ,MUTTERING-TORCH>>
		<DEQUEUE I-MUTTERING-TORCH>
		<RFALSE>)
	       (<PROB 30>
		<TELL
"   The muttering torch mutters something about "
<PICK-ONE ,MUTTERS> ,PERIOD-CR>)
	       (T
		<RFALSE>)>>

<CONSTANT MUTTERS
	<LTABLE
	 0
	 "human palm odors"
	 "the unfairness of existence as a torch"
	 "being held too tightly"
	 "the callous discarding of burned-out torches"
	 "the uncomfortableness of most sconces">>

<OBJECT GUTTERING-TORCH
	(LOC TORCH-ROOM)
	(SDESC "guttering torch")
	(PLURAL "torches")
	(SYNONYM TORCH TORCHES)
	(ADJECTIVE GUTTERING)
	(FLAGS TAKEBIT TRYTAKEBIT ONBIT FLAMEBIT)
	(ACTION GUTTERING-TORCH-F)>

<ROUTINE GUTTERING-TORCH-F ()
	 <COND (<AND <VERB? TAKE>
		     <FSET? ,GUTTERING-TORCH ,ONBIT>
		     <EQUAL? ,GUTTERING-TORCH-COUNT 0>>
		<SETG GUTTERING-TORCH-COUNT <+ <RANDOM 3> 9>>
		<QUEUE I-GUTTERING-TORCH -1>
		<RFALSE>)
	       (<AND <VERB? OFF>
		     <FSET? ,GUTTERING-TORCH ,ONBIT>>
		<FCLEAR ,GUTTERING-TORCH ,ONBIT>
		<FCLEAR ,GUTTERING-TORCH ,FLAMEBIT>
		<DEQUEUE I-GUTTERING-TORCH>
		<TELL "\"Pffft.\"" CR>
		<NOW-DARK?>)
	       (<AND <VERB? EXAMINE ON OFF BURN>
		     <NOT <FSET? ,GUTTERING-TORCH ,ONBIT>>>
		<BURNED-OUT ,GUTTERING-TORCH>)>>

<GLOBAL GUTTERING-TORCH-COUNT 0>

<ROUTINE I-GUTTERING-TORCH ()
	 <SETG GUTTERING-TORCH-COUNT <- ,GUTTERING-TORCH-COUNT 1>>
	 <COND (<EQUAL? ,GUTTERING-TORCH-COUNT 0>
		<PUTP ,GUTTERING-TORCH ,P?SDESC "formerly guttering torch">
		<FCLEAR ,GUTTERING-TORCH ,ONBIT>
		<FCLEAR ,GUTTERING-TORCH ,FLAMEBIT>
		<DEQUEUE I-GUTTERING-TORCH>)>
	 <COND (<NOT <VISIBLE? ,GUTTERING-TORCH>>
		<RFALSE>)
	       (<NOT <FSET? ,GUTTERING-TORCH ,ONBIT>>
		<GREAT-TORCH-ROOM-IN-THE-SKY "gutt">)
	       (<PROB 40>
		<TELL
"   The guttering torch sputters on the verge of burning out, but
then decides to keep burning for at least another minute." CR>)
	       (T
		<RFALSE>)>>

<ROOM FORMAL-GARDEN
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Formal Garden")
      (LDESC
"Dimwit designed this garden to match a fairy tale he enjoyed as a child,
and subsequent kings added their own touches, creating a hugely confusing
maze of flowers and shrubbery and statuary and trees and fountains and pools
and bridges and gazebos. Now somewhat overgrown, the garden is seemingly
endless, but you recall that the primary exits lie to the north, east, and
southwest.")
      (NORTH TO PARLOR)
      (EAST TO GREAT-HALL)
      (SW TO WEST-HALL)
      (FLAGS RLANDBIT ONBIT OUTSIDEBIT)
      (SYNONYM GARDEN)
      (ADJECTIVE FORMAL)
      (MAP-LOC <PTABLE MAIN-FLOOR-MAP-NUM MAP-GEN-Y-4 MAP-GEN-X-4>)
      (ICON FORMAL-GARDEN-ICON)
      (THINGS <> FLOWER GARDEN-FLOWER-PSEUDO)>

<ROUTINE GARDEN-FLOWER-PSEUDO ()
	 <COND (<VERB? PICK>
		<TELL "Ouch! Thorns!" CR>)>>

<OBJECT FLAMINGO
	(LOC FORMAL-GARDEN)
	(DESC "flamingo")
	(FDESC
"You spot a flash of pink amongst the flora. It's a flamingo!")
	(SYNONYM FLAMINGO BIRD ORNAMENT)
	(ADJECTIVE LAWN)
	(FLAGS TRYTAKEBIT TAKEBIT ANIMATEDBIT)
	(INANIMATE-DESC "lawn ornament")
	(WAND-TEXT "The flamingo becomes motionless.")
	(ANIMATE-ROUTINE I-ORNAMENT-TO-FLAMINGO)
	(SIZE 10)
	(ACTION FLAMINGO-F)>

<ROUTINE FLAMINGO-F ("OPT" (ARG <>))
	 <COND (<NOT <FSET? ,FLAMINGO ,ANIMATEDBIT>>
		<RFALSE>)
	       (<AND <VERB? RESEARCH>
		     <NOUN-USED? ,FLAMINGO ,W?FLAMINGO>>
		<TELL "\"A common garden animal.\"" CR>)
	       (<AND <VERB? FEED>
		     <ULTIMATELY-IN? ,BAR-OF-FOOD>>
		<PERFORM ,V?GIVE ,BAR-OF-FOOD ,FLAMINGO>
		<RTRUE>)
	       (<AND <VERB? SHOW>
		     <PRSO? ,BAR-OF-FOOD>>
		<TELL
"The flamingo feigns disinterest, but vast volumes of drool betray its
true feelings." CR>)
	       (<AND <VERB? GIVE>
		     <PRSO? ,BAR-OF-FOOD>>
		<REMOVE ,BAR-OF-FOOD>
		<TELL
"The flamingo greedily snatches" T ,BAR-OF-FOOD " in its beak and
gulps it down." CR>)
	       (,TIME-STOPPED
		<RFALSE>)
	       (<VERB? TAKE CATCH>
		<TELL
"The flamingo prances away, leaving you clutching at air." CR>)
	       (<VERB? TOUCH>
		<TELL "The bird nearly nips off a finger." CR>)>>

<ROUTINE I-ORNAMENT-TO-FLAMINGO ()
	 <COND (,TIME-STOPPED
		<QUEUE I-ORNAMENT-TO-FLAMINGO 3>
		<RFALSE>)>
	 <FSET ,FLAMINGO ,ANIMATEDBIT>
	 <COND (<VISIBLE? ,FLAMINGO>
		<TELL
"   Based on its angry squawks, the lawn ornament has returned to
its former state.">
		<COND (<AND <ULTIMATELY-IN? ,FLAMINGO>
			    <NOT <IN? ,SNAKE ,WALDO>>>
		       <MOVE ,FLAMINGO ,HERE>
		       <TELL
" The flamingo gives you a vicious peck and hops to the ground.">)>
		<CRLF>)
	       (T
		<RFALSE>)>> 

<ROOM COURTYARD
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Courtyard")
      (NORTH TO BANQUET-HALL)
      (WEST TO GREAT-HALL)
      (SE TO EAST-HALL)
      (FLAGS RLANDBIT ONBIT OUTSIDEBIT)
      (SYNONYM COURTYARD)
      (MAP-LOC <PTABLE MAIN-FLOOR-MAP-NUM MAP-GEN-Y-4 MAP-GEN-X-6>)
      (ACTION COURTYARD-F)>

<ROUTINE COURTYARD-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This open area is paved with marble and surrounded by imposing stone walls. ">
		<COND (<RUNNING? ,I-PROLOGUE>
		       <TELL
"Servants are cleaning up after a tremendous carnival">)
		      (T
		       <TELL
"Dimwit would occasionally order carnivals be set up in this court,
on totally cloudless days">)>
		<TELL
". At the distant edges of the courtyard, you can see exits to the north,
west, and southeast.">)>>

<ROOM BALCONY
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Balcony")
      (LDESC
"This wide balcony, itself larger than most castles, overlooks the Great
Hall. Banners and pennants are draped from the railing into the hall below,
which can be reached via the wide stair. A passage leads off to the south.")
      (DOWN TO GREAT-HALL)
      (SOUTH TO GALLERY)
      (FLAGS RLANDBIT ONBIT)
      (SYNONYM BALCONY)
      (GLOBAL STAIRS BANNER)
      (MAP-LOC <PTABLE MAIN-FLOOR-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-4>)
      (ICON BALCONY-ICON)>

<OBJECT BANNER
	 (LOC LOCAL-GLOBALS)
	 (DESC "banner")
	 (SYNONYM BANNER BANNERS PENNANT PENNANTS)
	 (ADJECTIVE COLORFUL)
	 (ACTION BANNER-F)>

<ROUTINE BANNER-F ()
	 <COND (<VERB? READ EXAMINE>
		<TELL
"These colorful banners display various royal crests and insignias." CR>)
	       (<VERB? CLIMB-DOWN>
		<TELL
"Okay, but for future reference, the stairs are easier" ,ELLIPSIS>
		<GOTO ,GREAT-HALL>)>>

<ROOM GALLERY
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Gallery")
      (LDESC
"Twelve large paintings cover the walls of this long, tall room. The main
exit is north, but there's also a small opening to the south.")
      (NORTH TO BALCONY)
      (SOUTH TO CLOSET)
      (FLAGS RLANDBIT ONBIT)
      (SYNONYM GALLERY)
      (MAP-LOC <PTABLE MAIN-FLOOR-MAP-NUM MAP-GEN-Y-6 MAP-GEN-X-4>)
      (ICON GALLERY-ICON)>

<OBJECT REBUS
	(LOC GALLERY)
	(DESC "rebus")
	(DESCFCN REBUS-F)
	(SYNONYM REBUS)
	(ADJECTIVE LARGE FRAMED)
	(FLAGS READBIT SEARCHBIT CONTBIT SURFACEBIT OPENBIT)
	(RESEARCH
"\"A rebus is an illustration whose component pictures spell out a word
or words, usually through the addition and subtraction of sounds or letters.
The most famous creator of rebuses was Frobesius Fublius.\"")
	(ACTION REBUS-F)>

<ROUTINE REBUS-F ("OPTIONAL" (OARG <>) "AUX" CNT)
	 <SET CNT <CCOUNT ,REBUS>>
	 <COND (.OARG
		<COND (<EQUAL? .OARG ,M-OBJDESC?>
		       <RTRUE>)>
		<TELL
"   A large framed rebus occupies a central position at the far end of
the gallery. It appears to have been recently hung.">
		<COND (<G? .CNT 1>
		       <TELL " The rebus is ">
		       <COND (<G? .CNT 3>
			      <TELL "mostly">)
			     (T
			      <TELL "partially">)>
		       <TELL " obscured by a">
		       <COND (<EQUAL? .CNT 1>
			      <TELL
"n animal -- or a representation of an animal">)
			     (T
			      <TELL
" number of animals -- or representations of animals">)>
		       <TELL " -- which appear">
		       <COND (<EQUAL? .CNT 1>
			      <TELL "s">)>
		       <TELL " to be magically layered onto its surface:">
		       <FCLEAR ,REBUS-CAMEL ,NDESCBIT>
		       <FCLEAR ,REBUS-MOUSE ,NDESCBIT>
		       <FCLEAR ,REBUS-GOOSE ,NDESCBIT>
		       <FCLEAR ,REBUS-SNAKE ,NDESCBIT>
		       <FCLEAR ,REBUS-FISH ,NDESCBIT>
		       <FCLEAR ,REBUS-SLIME-MONSTER ,NDESCBIT>
		       <D-CONTENTS ,REBUS 2>
		       <FSET ,REBUS-CAMEL ,NDESCBIT>
		       <FSET ,REBUS-MOUSE ,NDESCBIT>
		       <FSET ,REBUS-GOOSE ,NDESCBIT>
		       <FSET ,REBUS-SNAKE ,NDESCBIT>
		       <FSET ,REBUS-FISH ,NDESCBIT>
		       <FSET ,REBUS-SLIME-MONSTER ,NDESCBIT>)>
		<RTRUE>)
	       (<VERB? OPEN CLOSE>
		<TELL ,HUH>)
	       (<AND <VERB? PUT PUT-ON>
		     <PRSI? ,REBUS>>
		<TELL ,HUH>)
	       (<VERB? READ EXAMINE>
		<CLEAR -1>
		<SCREEN ,S-FULL>
		<DISPLAY <COND (<IN? ,REBUS-MOUSE ,REBUS> ,REBUS-6)
			       (<IN? ,REBUS-GOOSE ,REBUS> ,REBUS-5)
			       (<IN? ,REBUS-SLIME-MONSTER ,REBUS> ,REBUS-4)
			       (<IN? ,REBUS-CAMEL ,REBUS> ,REBUS-3)
			       (<IN? ,REBUS-SNAKE ,REBUS> ,REBUS-2)
			       (<IN? ,REBUS-FISH ,REBUS> ,REBUS-1)
			       (T ,REBUS-0)> 1 1>
		<INPUT 1>
		<V-$REFRESH>
		<RTRUE>)>>

<OBJECT REBUS-CAMEL
	(LOC REBUS)
	(DESC "flattened camel")
	(SYNONYM CAMEL ANIMAL REPRESENTATION)
	(ADJECTIVE FLATTENED LAYERED)
	(FLAGS NDESCBIT)
	(ACTION REBUS-ANIMAL-F)>

<OBJECT REBUS-MOUSE
	(LOC REBUS)
	(DESC "flattened mouse")
	(SYNONYM MOUSE ANIMAL REPRESENTATION)
	(ADJECTIVE FLATTENED LAYERED)
	(FLAGS NDESCBIT)
	(ACTION REBUS-ANIMAL-F)>

<OBJECT REBUS-SNAKE
	(LOC REBUS)
	(DESC "flattened snake")
	(SYNONYM SNAKE ANIMAL REPRESENTATION)
	(ADJECTIVE FLATTENED LAYERED)
	(FLAGS NDESCBIT)
	(ACTION REBUS-ANIMAL-F)>

<OBJECT REBUS-GOOSE
	(LOC REBUS)
	(DESC "flattened goose")
	(SYNONYM GOOSE ANIMAL REPRESENTATION)
	(ADJECTIVE FLATTENED LAYERED)
	(FLAGS NDESCBIT)
	(ACTION REBUS-ANIMAL-F)>

<OBJECT REBUS-FISH
	(LOC REBUS)
	(DESC "flattened fish")
	(SYNONYM FISH ANIMAL REPRESENTATION)
	(ADJECTIVE FLATTENED LAYERED)
	(FLAGS NDESCBIT)
	(ACTION REBUS-ANIMAL-F)>

<OBJECT REBUS-SLIME-MONSTER
	(LOC REBUS)
	(DESC "flattened slime monster")
	(SYNONYM MONSTER ANIMAL REPRESENTATION)
	(ADJECTIVE SLIME FLATTENED LAYERED)
	(FLAGS NDESCBIT)
	(ACTION REBUS-ANIMAL-F)>

<ROUTINE REBUS-ANIMAL-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The " 'PRSO " seems to be magically flattened upon the rebus surface." CR>)
	       (<VERB? TAKE MOVE>
		<TELL ,WONT-BUDGE>)
	       (<VERB? TOUCH>
		<TELL "The " 'PRSO " feels cold to the touch." CR>)>>

<OBJECT PAINTINGS
	(LOC GALLERY)
	(DESC "twelve paintings")
	(SYNONYM PAINTINGS PORTRAITS)
	(ADJECTIVE TWELVE FIRST SECOND THIRD FOURTH FIFTH SIXTH SEVENTH EIGHTH
	 	   NINTH TENTH ELEVENTH TWELVTH)
	(FLAGS NDESCBIT NARTICLEBIT TRYTAKEBIT)
	(GENERIC GENERIC-PAINTING-F)
	(OWNER WALL)
	(ACTION PAINTINGS-F)>

<ROUTINE PAINTINGS-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"These are the Leonardo Flathead's famous portraits of the Twelve
Flatheads, including his own self-portrait, which have reproduced
in many places [such as the \"Lives of the Twelve Flatheads Calendar\"
which you'll find in your Zork Zero package]." CR>)
	       (<VERB? TAKE MOVE>
		<TELL
"The portraits are all securely fastened to the wall." CR>)
	       (<VERB? COUNT>
		<TELL "12." CR>)>>

<OBJECT BABE-PORTRAIT
	(LOC GALLERY)
	(DESC "portrait of Babe Flathead")
	(SYNONYM PAINTING PORTRAIT BABE FLATHEAD)
	(ADJECTIVE BABE)
	(FLAGS NDESCBIT)
	(OWNER <TABLE (PURE LENGTH) WALL BABE-PORTRAIT>)
	(ACTION PAINTING-F)>

<OBJECT FRANK-LLOYD-PORTRAIT
	(LOC GALLERY)
	(DESC "portrait of Frank Lloyd Flathead")
	(SYNONYM PAINTING PORTRAIT FRANK LLOYD FLATHEAD)
	(ADJECTIVE FRANK LLOYD)
	(FLAGS NDESCBIT)
	(OWNER <TABLE (PURE LENGTH) WALL FRANK-LLOYD-PORTRAIT>)
	(ACTION PAINTING-F)>

<OBJECT JOHN-PAUL-PORTRAIT
	(LOC GALLERY)
	(DESC "portrait of John Paul Flathead")
	(SYNONYM PAINTING PORTRAIT JOHN PAUL FLATHEAD)
	(ADJECTIVE JOHN PAUL)
	(FLAGS NDESCBIT)
	(OWNER <TABLE (PURE LENGTH) WALL JOHN-PAUL-PORTRAIT>)
	(ACTION PAINTING-F)>

<OBJECT RALPH-WALDO-PORTRAIT
	(LOC GALLERY)
	(DESC "portrait of Ralph Waldo Flathead")
	(SYNONYM PAINTING PORTRAIT RALPH WALDO FLATHEAD)
	(ADJECTIVE RALPH WALDO)
	(FLAGS NDESCBIT)
	(OWNER <TABLE (PURE LENGTH) WALL RALPH-WALDO-PORTRAIT>)
	(ACTION PAINTING-F)>

<OBJECT LUCREZIA-PORTRAIT
	(LOC GALLERY)
	(DESC "portrait of Lucrezia Flathead")
	(SYNONYM PAINTING PORTRAIT LUCREZIA FLATHEAD)
	(ADJECTIVE LUCREZIA)
	(FLAGS NDESCBIT)
	(OWNER <TABLE (PURE LENGTH) WALL LUCREZIA-PORTRAIT>)
	(ACTION PAINTING-F)>

<OBJECT LEONARDO-PORTRAIT
	(LOC GALLERY)
	(DESC "portrait of Leonardo Flathead")
	(SYNONYM PAINTING PORTRAIT SELF-PORTRAIT LEONARDO FLATHEAD)
	(ADJECTIVE LEONARDO)
	(FLAGS NDESCBIT)
	(OWNER <TABLE (PURE LENGTH) WALL LEONARDO-PORTRAIT>)
	(ACTION PAINTING-F)>

<OBJECT THOMAS-ALVA-PORTRAIT
	(LOC GALLERY)
	(DESC "portrait of Thomas Alva Flathead")
	(SYNONYM PAINTING PORTRAIT THOMAS ALVA FLATHEAD)
	(ADJECTIVE THOMAS ALVA)
	(FLAGS NDESCBIT)
	(OWNER <TABLE (PURE LENGTH) WALL THOMAS-ALVA-PORTRAIT>)
	(ACTION PAINTING-F)>

<OBJECT JOHN-D-PORTRAIT
	(LOC GALLERY)
	(DESC "portrait of John D. Flathead")
	(SYNONYM PAINTING PORTRAIT JOHN DAVISON FLATHEAD DOWN)
	(ADJECTIVE JOHN DAVISON DOWN ;"for middle initial")
	(FLAGS NDESCBIT)
	(OWNER <TABLE (PURE LENGTH) WALL JOHN-D-PORTRAIT>)
	(ACTION PAINTING-F)>

<OBJECT JOHANN-SEBASTIAN-PORTRAIT
	(LOC GALLERY)
	(DESC "portrait of Johann Sebastian Flathead")
	(SYNONYM PAINTING PORTRAIT JOHANN SEBASTIAN FLATHEAD)
	(ADJECTIVE JOHANN SEBASTIAN)
	(FLAGS NDESCBIT)
	(OWNER <TABLE (PURE LENGTH) WALL JOHANN-SEBASTIAN-PORTRAIT>)
	(ACTION PAINTING-F)>

<OBJECT STONEWALL-PORTRAIT
	(LOC GALLERY)
	(DESC "portrait of Stonewall Flathead")
	(SYNONYM PAINTING PORTRAIT STONEWALL FLATHEAD)
	(ADJECTIVE STONEWALL)
	(FLAGS NDESCBIT)
	(OWNER <TABLE (PURE LENGTH) WALL STONEWALL-PORTRAIT>)
	(ACTION PAINTING-F)>

<OBJECT J-PIERPONT-PORTRAIT
	(LOC GALLERY)
	(OWNER <TABLE (PURE LENGTH) WALL J-PIERPONT-PORTRAIT>)
	(DESC "portrait of J. Pierpont Flathead")
	(SYNONYM PAINTING PORTRAIT J PIERPONT FLATHEAD)
	(ADJECTIVE J PIERPONT)
	(FLAGS NDESCBIT)
	(ACTION PAINTING-F)>

<OBJECT DIMWIT-PORTRAIT
	(LOC GALLERY)
	(DESC "portrait of Dimwit Flathead")
	(SYNONYM PAINTING PORTRAIT DIMWIT FLATHEAD)
	(ADJECTIVE DIMWIT)
	(FLAGS NDESCBIT)
	(GENERIC GENERIC-DIMWIT-F)
	(OWNER <TABLE (PURE LENGTH) WALL DIMWIT-PORTRAIT>)
	(ACTION PAINTING-F)>

<ROUTINE PAINTING-F ()
	 <COND (<VERB? EXAMINE TAKE MOVE>
		<PERFORM-PRSA ,PAINTINGS>)
	       (<VERB? RESEARCH>
		<TELL
"\"One of the Twelve Flatheads. For more information, we recommend Boswell
Barwell's 'The Lives of the Twelve Flatheads.'\" [Excerpts of which can be
found in the calendar from your Zork Zero package.]" CR>)>>

<ROOM CLOSET
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Closet")
      (LDESC
"You are in some sort of storage closet, which opens to the north. A ladder
leads upward.")
      (NORTH TO GALLERY)
      (UP TO ROOF)
      (FLAGS RLANDBIT ONBIT)
      (SYNONYM CLOSET)
      (GLOBAL FIXED-LADDER)
      (MAP-LOC <PTABLE MAIN-FLOOR-MAP-NUM MAP-GEN-Y-7 MAP-GEN-X-4>)>

<OBJECT CLOSET-REBUS-BUTTON
	(LOC CLOSET)
	(SDESC "blinking key-shaped button")
	(FDESC
"In the shadow of one of the shelves is a key-shaped button, which is blinking
rhythmically.")
	(SYNONYM BUTTON)
	(ADJECTIVE KEY-SHAPED BLINKING)
	(ACTION REBUS-BUTTON-F)>

<ROUTINE REBUS-BUTTON-F ()
	 <COND (<VERB? PUSH>
		<COND (<OR <FSET? ,PRSO ,TOUCHBIT>
			   ,TIME-STOPPED>
		       <TELL ,NOTHING-HAPPENS>)
		      (T
		       <FSET ,PRSO ,TOUCHBIT>
		       <PUTP ,PRSO ,P?SDESC "key-shaped button">
		       <TELL "The button produces a ">
		       <COND (<IN? ,REBUS-MOUSE ,REBUS>
			      <REMOVE ,REBUS-MOUSE>
			      <TELL "squeak">)
			     (<IN? ,REBUS-GOOSE ,REBUS>
			      <REMOVE ,REBUS-GOOSE>
			      <TELL "honk">)
			     (<IN? ,REBUS-SLIME-MONSTER ,REBUS>
			      <REMOVE ,REBUS-SLIME-MONSTER>
			      <TELL "squish">)
			     (<IN? ,REBUS-CAMEL ,REBUS>
			      <REMOVE ,REBUS-CAMEL>
			      <TELL "bray">)
			     (<IN? ,REBUS-SNAKE ,REBUS>
			      <REMOVE ,REBUS-SNAKE>
			      <TELL "hiss">)
			     (T
			      <REMOVE ,REBUS-FISH>
			      <TELL "splash">)>
		       <TELL "ing noise and stops blinking." CR>)>)>>

<OBJECT BAG
	(LOC CLOSET)
	(DESC "bag")
	(FDESC
"The shelves are all dusty and bare -- except for one small bag with some
printing on it.")
	(SYNONYM BAG PRINTING)
	(ADJECTIVE SMALL)
	(FLAGS TAKEBIT CONTBIT SEARCHBIT READBIT)
	(SIZE 2)
	(TEXT
"\"Hello, Flamingo Owner! The enclosed food provides a balanced, nutritious
diet for your flamingo. Our food is specially formulated for the finicky
flamingo. WARNING: Poisonous to humans. Another fine product of the Frobozz
Magic Flamingo Food Company.\"")
	(ACTION BAG-F)>

<ROUTINE BAG-F ()
	 <COND (<VERB? EXAMINE>
		<TELL "There's writing on the outside of the bag. ">
		<RFALSE> ;"open-closed")>>

<OBJECT BAR-OF-FOOD
	(LOC BAG)
	(OWNER BAR-OF-FOOD)
	(DESC "bar of food")
	(PLURAL "bars of food")
	(SYNONYM BAR FOOD)
	(FLAGS TAKEBIT)
	(SIZE 3)
	(ACTION BAR-OF-FOOD-F)>

<ROUTINE BAR-OF-FOOD-F ()
	 <COND (<VERB? EAT>
		<COND (<EQUAL? ,TURNED-INTO ,FLAMINGO>
		       <GOOD-MEAL ,BAR-OF-FOOD>)
		      (T
		       <JIGS-UP "Aarrgghh! Poison!">)>)>>

<ROOM ROOF
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Roof")
      (LDESC
"You stand atop the main building of the castle. A tall tower is visible to
the south, but can't be reached from here. The only exit is down a ladder.")
      (DOWN TO CLOSET)
      (FLAGS RLANDBIT ONBIT OUTSIDEBIT)
      (GLOBAL FIXED-LADDER)
      (MAP-LOC <PTABLE MAIN-FLOOR-MAP-NUM MAP-GEN-Y-7 MAP-GEN-X-3>)
      (ICON ROOF-ICON)>

<ROOM AUDIENCE-CHAMBER
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Audience Chamber")
      (LDESC
"This is a tremendous meeting room where thousands of visitors would queue up
every day for an audience with Dimwit or one of his successors. Such visitors
were usually wasting their time; Dimwit rarely had the patience to see even
one person a day. A plush red carpet leads from the main doorway on the north
wall to the golden throne, fringed with red tassles, which towers above the
floor. Behind the throne, a smaller doorway leads south.")
      (NORTH TO GREAT-HALL)
      (SOUTH TO THRONE-ROOM)
      (FLAGS RLANDBIT ONBIT)
      (SYNONYM CHAMBER)
      (ADJECTIVE AUDIENCE)
      (GLOBAL CARPET)
      (MAP-LOC <PTABLE MAIN-FLOOR-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-5>)>

<OBJECT LARGE-THRONE
	(LOC AUDIENCE-CHAMBER)
	(DESC "large golden throne")
	(SYNONYM THRONE TASSLES)
	(ADJECTIVE GOLDEN LARGE TOWERING RED)
	(CAPACITY 50)
	(FLAGS NDESCBIT VEHBIT CONTBIT OPENBIT SEARCHBIT)
	(ACTION THRONE-F)>

<ROOM THRONE-ROOM
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Throne Room")
      (NORTH TO AUDIENCE-CHAMBER)
      (SOUTH TO SECRET-PASSAGE IF SECRET-PASSAGE-OPEN)
      (FLAGS RLANDBIT ONBIT)
      (SYNONYM ROOM)
      (ADJECTIVE THRONE)
      (MAP-LOC <PTABLE MAIN-FLOOR-MAP-NUM MAP-GEN-Y-6 MAP-GEN-X-5>)
      (ICON THRONE-ROOM-ICON)
      (ACTION THRONE-ROOM-F)>

<ROUTINE THRONE-ROOM-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is a smaller version of the room to the north, meaning that a person
can walk all the way across it without stopping to rest. The throne, though
smaller and more comfortable looking, is just as gaudy. It is in this chamber
that Dimwit would meet with his \"advisors,\" raising taxes and plotting
grandiose schemes. A doorway leads north">
		<COND (,SECRET-PASSAGE-OPEN
		       <TELL ", and a secret passage is open to the south">)>
		<TELL ".">)>>

<OBJECT SCEPTRE
	(LOC THRONE-ROOM)
	(DESC "sceptre")
	(FDESC
"An overdone sceptre, ornamented with colored enamel and tapering to a sharp
point, is lying by the throne.")
	(SYNONYM SCEPTRE SCEPTER)
	(ADJECTIVE SHARP ENAMELED ORNAMENTED OVERDONE)
	(FLAGS TAKEBIT MAGICBIT)
	(SIZE 5)
	(VALUE 12)>

<OBJECT SMALL-THRONE
	(LOC THRONE-ROOM)
	(DESC "small throne")
	(SYNONYM THRONE)
	(ADJECTIVE GAUDY SMALL COMFORTABLE)
	(CAPACITY 25)
	(FLAGS NDESCBIT VEHBIT CONTBIT OPENBIT SEARCHBIT)
	(ACTION THRONE-F)>

<ROUTINE THRONE-F ("OPTIONAL" (VARG <>))
	 <COND (.VARG
		<RFALSE>)
	       (<VERB? CLIMB-UP> ;"for CLIMB UP ON THRONE"
		<PERFORM ,V?ENTER ,PRSO>
		<RTRUE>)>>

;"secret passage and beyond"

<GLOBAL SECRET-PASSAGE-DISCOVERED <>>

<GLOBAL SECRET-PASSAGE-OPEN <>>

<GLOBAL SECRET-PASSAGE-SCORE 18>

<ROOM SECRET-PASSAGE
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Secret Passage")
      (LDESC "You are in a secret passage running north and south.")
      (NORTH TO THRONE-ROOM IF SECRET-PASSAGE-OPEN ELSE
       "The passage ends at a blank wall!")
      (SOUTH TO TEE)
      (FLAGS RLANDBIT)
      (ICON SECRET-PASSAGE-ICON)
      (MAP-LOC <PTABLE SECRET-WING-MAP-NUM MAP-GEN-Y-4 MAP-GEN-X-7>)>

<OBJECT CANDLE
	(LOC SECRET-PASSAGE)
	(DESC "candle")
	(FDESC
"Although no one has entered this secret passage in years, a lit candle is
mounted here, its flame casting dancing shadows across the uneven walls.")
	(SYNONYM CANDLE)
	(FLAGS LIGHTBIT FLAMEBIT ONBIT TAKEBIT)
	(ACTION CANDLE-F)>

<ROUTINE CANDLE-F ("AUX" FLAME)
	 <COND (<VERB? EXAMINE>
		<COND (<FSET? ,CANDLE ,ONBIT>
		       <TELL "The flame burns tall and bright." CR>)
		      (T
		       <TELL "The candle has been snuffed." CR>)>)
	       (<AND <VERB? ON>
		     <NOT <FSET? ,CANDLE ,FLAMEBIT>>>
		<COND (<SET FLAME <FIND-IN ,HERE ,FLAMEBIT "with">>
		       <FSET ,CANDLE ,FLAMEBIT>
		       <FSET ,CANDLE ,ONBIT>
		       <TELL "You re-light the candle." CR>)
		      (T
		       <TELL "You have no flame to light the candle." CR>)>)>>

<ROOM TEE
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Tee")
      (LDESC
"A secret passage from the north ends here at this east-west corridor.")
      (NORTH TO SECRET-PASSAGE)
      (EAST TO TOP-OF-STAIR)
      (WEST TO FOREBUILDING)
      (FLAGS RLANDBIT)
      (ICON TEE-ICON)
      (MAP-LOC <PTABLE SECRET-WING-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-7>)>

<ROOM FOREBUILDING
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Forebuilding")
      (LDESC
"The secret passage from the east ends here. An easily defensible hallway
rises into the keep, to the southwest.")
      (EAST TO TEE)
      (SW TO DONJON)
      (UP TO DONJON)
      (FLAGS RLANDBIT)
      (MAP-LOC <PTABLE SECRET-WING-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-6>)>

<ROOM DONJON
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Donjon")
      (LDESC
"You are in the lowest level of the castle's keep. A stone stair winds
up into the keep, and a sloping passage leads northeast.")
      (NE TO FOREBUILDING)
      (DOWN TO FOREBUILDING)
      (UP TO SOLAR)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)
      (MAP-LOC <PTABLE SECRET-WING-MAP-NUM MAP-GEN-Y-6 MAP-GEN-X-5>)>

<ROOM SOLAR
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Solar")
      (LDESC
"This is the king's solar, where he would bathe and dress and meet his
most trusted advisors and intimate guests. Dim light enters through narrow,
slitted windows. The solar has obviously lain unused for many decades. The
circular stair continues up and down, and a doorway leads west.")
      (UP TO BASTION)
      (DOWN TO DONJON)
      (WEST TO DIMWITS-ROOM)
      (FLAGS RLANDBIT ONBIT)
      (SYNONYM SOLAR)
      (GLOBAL STAIRS WINDOW) 
      (RIDDLE
"You can find me at the beginning of youth, in the center of every eye,
and at the end of eternity. What am I?\"")
      (MAP-LOC <PTABLE SECRET-WING-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-5>)
      (ACTION SOLAR-F)>

<ROUTINE SOLAR-F (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-END>
		     <IN? ,EAST-KEY ,JESTER>
		     <IN? ,JESTER ,HERE>>
		<SETUP-ORPHAN "answer">)>>

<OBJECT LETTER-Y
	(LOC GLOBAL-OBJECTS)
	(DESC "the letter y")
	(SYNONYM Y)
	(ADJECTIVE LETTER)
	(FLAGS NARTICLEBIT)>

<OBJECT EAST-KEY
	(LOC SOLAR)
	(DESC "iron key")
	(FDESC
"Sitting on a cushioned window seat, illuminated by a shaft of sunlight, rests
an ancient iron key.")
	(SYNONYM KEY)
	(ADJECTIVE ANCIENT IRON)
	(FLAGS KEYBIT TAKEBIT TRYTAKEBIT VOWELBIT)
	(SIZE 2)
	(ACTION EAST-KEY-F)>

<ROUTINE EAST-KEY-F ()
	 <COND (<AND <VERB? TAKE>
		     <FSET? ,EAST-KEY ,TRYTAKEBIT>>
		<COND (<IN? ,EAST-KEY ,JESTER>
		       <TELL ,ANSWER-MY-RIDDLE>)
		      (T
		       <TELL "You begin reaching for the key..." CR>
		       <I-JESTER>)>)>>

<ROOM DIMWITS-ROOM
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Dimwit's Room")
      (LDESC
"You stare around in awe as you realize that you are within the private
bedroom of Lord Dimwit Flathead. The canopied bed alone is larger than most
of the farms in your home province. Light seeps in through slitted windows,
and doorways lead east and south.")
      (EAST TO SOLAR)
      (SOUTH TO MAGIC-CLOTHES-CLOSET)
      (FLAGS RLANDBIT)
      (SYNONYM ROOM)
      (OWNER DIMWIT)
      (GLOBAL WINDOW)
      (ICON DIMWITS-ROOM-ICON)
      (MAP-LOC <PTABLE SECRET-WING-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-4>)>

<OBJECT DIMWITS-BED
	(LOC DIMWITS-ROOM)
	(DESC "Dimwit's bed")
	(SYNONYM BED)
	(ADJECTIVE LARGE CANOPIED)
	(OWNER DIMWIT)
	(CAPACITY 250)
	(FLAGS NARTICLEBIT SEARCHBIT VEHBIT DROPBIT NDESCBIT CONTBIT
	       OPENBIT SURFACEBIT)>

<ROOM MAGIC-CLOTHES-CLOSET
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Magic Clothes Closet")
      (LDESC
"This is a small closet. Well, it's small by the standards of this castle;
in a pinch, it could probably sleep a few regiments. The only exit is north.")
      (NORTH TO DIMWITS-ROOM)
      (FLAGS RLANDBIT)
      (SYNONYM CLOSET)
      (ADJECTIVE MAGIC CLOTHES)
      (ICON MAGIC-CLOSET-ICON)
      (MAP-LOC <PTABLE SECRET-WING-MAP-NUM MAP-GEN-Y-6 MAP-GEN-X-4>)>

<OBJECT CLOAK
	(LOC MAGIC-CLOTHES-CLOSET)
	(DESC "cloak")
	(SYNONYM CLOAK LABEL WRITING)
	(ADJECTIVE MAGIC)
	(FLAGS WEARBIT TAKEBIT)
	(ACTION CLOAK-F)>

<GLOBAL CLOAK-LOC <>> ;"set to MAGIC-CLOTHES-CLOSET in GO as a default"

<ROUTINE CLOAK-F ()
	 <COND (<VERB? EXAMINE>
		<COND (<NOUN-USED? ,CLOAK ,W?CLOAK>
		       <TELL
"The colors of the cloak seem to shimmer like a Mithican chameleon. There's
a small label with writing on it." CR>)
		      (T
		       <PERFORM ,V?READ ,CLOAK>
		       <RTRUE>)>)
	       (<VERB? READ>
		<TELL "\"Frobozz Magic Cloak Company.\"" CR>)
	       (<AND <EQUAL? ,HERE ,OUBLIETTE>
		     <VERB? WEAR TAKE-OFF>>
		<TELL "There's not enough elbow room here." CR>)
	       (<AND <VERB? WEAR>
		     <NOT <EQUAL? ,HERE ,PLAIN>>
		     <NOT <FSET? ,CLOAK ,WORNBIT>>
		     <NOT <FSET? ,OUTER-GATE ,OPENBIT>>
		     <NOT ,TIME-STOPPED>>
		<FSET ,CLOAK ,WORNBIT>
		<SETG CLOAK-LOC <COND (<FSET? <LOC ,PROTAGONIST> ,TAKEBIT>
				       ,HERE)
				      (T
				       <LOC ,PROTAGONIST>)>>
		;"otherwise you can end up (for example) in toboggan in knight"
		<MOVE ,PROTAGONIST ,HERE>
		<DEQUEUE I-JESTER>
		<DEQUEUE I-BATHYSPHERE>
		<DEQUEUE I-DIRIGIBLE>
		<SETG RANK <+ </ ,PLAIN-LOC 8> 1>>
		<SETG FILE <+ <MOD ,PLAIN-LOC 8> 1>>
		<CAST-HUNGER-SPELL>
		<TELL
"As you wrap the cloak around you, the world changes" ,ELLIPSIS>
		<GOTO ,PLAIN>)
	       (<AND <VERB? TAKE-OFF>
		     <FSET? ,CLOAK ,WORNBIT>
		     <EQUAL? ,HERE ,PLAIN>>
		<FCLEAR ,CLOAK ,WORNBIT>
		<COND (<OR <EQUAL? ,CLOAK-LOC ,INQUISITION ,FISHING-VILLAGE>
			   <EQUAL? <META-LOC ,CLOAK-LOC> ,INQUISITION
				   			 ,FISHING-VILLAGE>>
		       <QUEUE I-INQUISITION -1>)
		      (<AND <EQUAL? ,CLOAK-LOC ,GONDOLA>
			    <IN? ,DIRIGIBLE ,GONDOLA>>
		       <QUEUE I-DIRIGIBLE -1>)
		      (<AND <EQUAL? ,CLOAK-LOC ,BATHYSPHERE>
			    <IN? ,BATHYSPHERE ,UNDERWATER>>
		       <QUEUE I-BATHYSPHERE -1>)>
		<QUEUE I-JESTER <+ <RANDOM 10> 10>>
		<TELL
"As the cloak is removed, the world changes again" ,ELLIPSIS>
		<GOTO ,CLOAK-LOC>
		<COND (<AND <EQUAL? ,CLOAK-LOC ,ORACLE-OBJECT>
			    <IN? ,RUBY ,DEPRESSION>> ;"yes, this is possible"
		       <TELL
"   You have only a moment to take in your surroundings. ">
		       <PERFORM ,V?ENTER ,ORACLE-OBJECT>)>
		<RTRUE>)>>

<OBJECT GLOVE
	(LOC MAGIC-CLOTHES-CLOSET)
	(DESC "glove")
	(SYNONYM GLOVE WRITING EMBROIDER)
	(ADJECTIVE TINY EMBROIDER)
	(SIZE 3)
	(FLAGS TAKEBIT WEARBIT READBIT)
	(ACTION GLOVE-F)>

<ROUTINE GLOVE-F ()
	 <COND (<VERB? EXAMINE>
		<COND (<FSET? ,GOGGLES ,WORNBIT>
		       <DISCOVER-X-RAY>
		       <TELL
"You can see your hand within the glove." CR>)
		      (<NOUN-USED? ,GLOVE ,W?GLOVE>
		       <TELL
"Tiny writing is embroidered at the edge of the glove." CR>)
		      (T
		       <PERFORM ,V?READ ,GLOVE>
		       <RTRUE>)>)
	       (<VERB? READ>
		<TELL "\"Frobozz Magic Glove Company.\"" CR>)>>

<ROOM BASTION
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Bastion")
      (LDESC
"This room occupies a taller tower rising from the corner of the keep.
The slitted windows are wider here, presumably to accomodate the weaponry
of the period. The stair winds up and down from here.")
      (UP TO PARAPET)
      (DOWN TO SOLAR)
      (FLAGS RLANDBIT ONBIT)
      (SYNONYM BASTION)
      (GLOBAL STAIRS WINDOW)
      (ICON BASTION-ICON)
      (MAP-LOC <PTABLE SECRET-WING-MAP-NUM MAP-GEN-Y-4 MAP-GEN-X-5>)>

<ROOM PARAPET
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Parapet")
      (LDESC
"You are on the roof of the tower, a virtual museum of state-of-the-art
castle defense from the eighth century. A fortified parapet, resting on
stone corbels, rims the roof. Machicolations, holes between the corbels,
allow massive weights to be dropped on invaders below. (More often, they
were dropped rather painfully on the soldier's own toe.) Crenellations
are spaced around the parapet, providing openings for armaments and
offering a commanding view of the castle grounds: the main castle just
below, and beyond the moat, the castle's village and garrison. The sole
exit is the stairway down.")
      (DOWN TO BASTION)
      (FLAGS RLANDBIT OUTSIDEBIT ONBIT)
      (SYNONYM PARAPET)
      (GLOBAL STAIRS MOAT)
      (ICON PARAPET-ICON)
      (MAP-LOC <PTABLE SECRET-WING-MAP-NUM MAP-GEN-Y-3 MAP-GEN-X-5>)
      (ACTION FLY-ROOM-F)>

<OBJECT MACHICOLATION
	(LOC PARAPET)
	(DESC "machicolation")
	(SYNONYM MACHICOLATION HOLE)
	(FLAGS NDESCBIT)
	(ACTION MACHICOLATION-F)>

<ROUTINE MACHICOLATION-F ()
	 <COND (<AND <VERB? PUT PUT-THROUGH>
		     <PRSI? ,MACHICOLATION>>
		<REMOVE ,PRSO>
		<COND (<OR <PRSO? ,PERCH>
			   <ULTIMATELY-IN? ,PERCH ,PRSO>>
		       <SETG REMOVED-PERCH-LOC ,GROUND>)>
		<TELL
"You hear a distant \"thunk,\" as" T ,PRSO " imbeds itself into the ground.
The lack of an accompanying distant \"ouch!\" would seem to indicate that
there are no invaders below." CR>)
	       (<VERB? LOOK-INSIDE>
		<TELL ,YOU-SEE " light at the bottom of the hole." CR>)
	       (<VERB? REACH-IN>
		<TELL ,NOTHING-IN-REACH>)>>

<ROOM TOP-OF-STAIR
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Top of Stair")
      (LDESC
"A secret passage from the west ends here, at the top of these dark,
cobwebby stairs.")
      (WEST TO TEE)
      (DOWN TO BOTTOM-OF-STAIR)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)
      (ICON TOP-OF-STAIR-ICON)
      (MAP-LOC <PTABLE SECRET-WING-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-8>)>

<ROOM BOTTOM-OF-STAIR
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Bottom of Stair")
      (LDESC
"You are in the center of a gloomy, north-south passage. A crude
stairway leads upward.")
      (NORTH TO OUTSIDE-CRYPT)
      (SOUTH TO DUNGEON)
      (UP TO TOP-OF-STAIR)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)
      (ICON BOTTOM-OF-STAIR-ICON)
      (MAP-LOC <PTABLE SECRET-WING-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-9>)>

<ROOM OUTSIDE-CRYPT
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Outside Crypt")
      (LDESC
"A hall from the south ends here at the entrance to a spooky crypt.")
      (SOUTH TO BOTTOM-OF-STAIR)
      (NORTH TO CRYPT)
      (IN TO CRYPT)
      (FLAGS RLANDBIT)
      (GLOBAL CRYPT)
      (MAP-LOC <PTABLE SECRET-WING-MAP-NUM MAP-GEN-Y-4 MAP-GEN-X-9>)>

<ROOM CRYPT
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Crypt")
      (UP TO CHAPEL IF TRAP-DOOR IS OPEN)
      (DOWN PER ORACLE-ENTER-F)
      (SOUTH TO OUTSIDE-CRYPT)
      (OUT TO OUTSIDE-CRYPT)
      (FLAGS RLANDBIT)
      (SYNONYM CRYPT TOMB)
      (ADJECTIVE SPOOKY UNDERGROUND)
      (GLOBAL TRAP-DOOR)
      (MAP-LOC <PTABLE SECRET-WING-MAP-NUM MAP-GEN-Y-3 MAP-GEN-X-9>)
      (ACTION CRYPT-F)>

<ROUTINE CRYPT-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"The remains of generations of royalty lie here in the underground tomb.
A passage leads off to the south. In the center of the low ceiling is a
small trap door, which is ">
		<OPEN-CLOSED ,TRAP-DOOR>
		<COND (<FSET? ,HOLEY-SLAB ,TOUCHBIT>
		       <TELL
". Barely visible beneath one of the slabs, a dark moist opening
leads downward">)>
		<TELL ".">)>>

<ROUTINE ORACLE-ENTER-F ()
	 <COND (<OR <FSET? ,OUTER-GATE ,OPENBIT>
		    ,TIME-STOPPED>
		<TELL "The hole under the slab has vanished!" CR>
		<RFALSE>)
	       (<FSET? ,HOLEY-SLAB ,TOUCHBIT>
		,ORACLE)
	       (T
		<CANT-GO>
		<RFALSE>)>>

<OBJECT FLATTEST-SLAB
	(LOC CRYPT)
	(DESC "flattest slab")
	(SYNONYM SLAB)
	(ADJECTIVE FLATTEST)
	(FLAGS NDESCBIT)
	(ACTION SLAB-F)>

<OBJECT SHORTEST-SLAB
	(LOC CRYPT)
	(DESC "shortest slab")
	(SYNONYM SLAB)
	(ADJECTIVE SHORTEST)
	(FLAGS NDESCBIT)
	(ACTION SLAB-F)>

<OBJECT LONGEST-SLAB
	(LOC CRYPT)
	(DESC "longest slab")
	(SYNONYM SLAB)
	(ADJECTIVE LONGEST)
	(FLAGS NDESCBIT)
	(ACTION SLAB-F)>

<OBJECT DUSTIEST-SLAB
	(LOC CRYPT)
	(DESC "dustiest slab")
	(SYNONYM SLAB)
	(ADJECTIVE DUSTIEST)
	(FLAGS NDESCBIT)
	(ACTION SLAB-F)>

<OBJECT DARKEST-SLAB
	(LOC CRYPT)
	(DESC "darkest slab")
	(SYNONYM SLAB)
	(ADJECTIVE DARKEST)
	(FLAGS NDESCBIT)
	(ACTION SLAB-F)>

<OBJECT OLDEST-SLAB
	(LOC CRYPT)
	(DESC "oldest slab")
	(SYNONYM SLAB)
	(ADJECTIVE OLDEST)
	(FLAGS NDESCBIT)
	(ACTION SLAB-F)>

<OBJECT NEWEST-SLAB
	(LOC CRYPT)
	(DESC "newest slab")
	(SYNONYM SLAB)
	(ADJECTIVE NEWEST)
	(FLAGS NDESCBIT)
	(ACTION SLAB-F)>

<ROUTINE SLAB-F ()
	 <COND (<AND <VERB? LOOK-UNDER>
		     <PRSO? ,HOLEY-SLAB>>
		<COND (<OR <FSET? ,OUTER-GATE ,OPENBIT>
			   ,TIME-STOPPED>
		       <DO-WALK ,P?DOWN>)
		      (T
		       <FSET ,HOLEY-SLAB ,TOUCHBIT>
		       <TELL
"Under the slab is a craggy hole, dripping with slime, leading
downward. It looks just barely large enough to enter." CR>)>)>>

<GLOBAL HOLEY-SLAB <>>

<CONSTANT SLAB-TABLE
	<PTABLE FLATTEST-SLAB
	       SHORTEST-SLAB
	       LONGEST-SLAB
	       DUSTIEST-SLAB
	       DARKEST-SLAB
	       OLDEST-SLAB
	       NEWEST-SLAB>>

<OBJECT TRAP-DOOR
	(LOC LOCAL-GLOBALS)
	(DESC "trap door")
	(SYNONYM DOOR TRAPDOOR)
	(ADJECTIVE SMALL TRAP)
	(FLAGS DOORBIT)
	(ACTION TRAP-DOOR-F)>

<ROUTINE TRAP-DOOR-F ()
	 <COND (<AND <VERB? OPEN>
		     <NOT <FSET? ,TRAP-DOOR ,OPENBIT>>
		     <EQUAL? ,HERE ,CRYPT>>
		<TELL "The trap door can't be opened from this side." CR>)>>

<ROOM DUNGEON
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Dungeon")
      (LDESC
"A century's worth of prisoners have languished in this dismal prison.
In addition to a hole in the floor, passages lead north, southeast, and
southwest.")
      (NORTH TO BOTTOM-OF-STAIR)
      (DOWN TO OUBLIETTE)
      (SE TO CELL)
      (SW TO TORTURE-CHAMBER)
      (FLAGS RLANDBIT)
      (SYNONYM DUNGEON)
      (ICON DUNGEON-ICON)
      (MAP-LOC <PTABLE SECRET-WING-MAP-NUM MAP-GEN-Y-6 MAP-GEN-X-9>)>

<OBJECT DUNGEON-HOLE
	(LOC DUNGEON)
	(DESC "hole")
	(SYNONYM HOLE)
	(ADJECTIVE SMALL)
	(FLAGS NDESCBIT)
	(OWNER GROUND)
	(ACTION DUNGEON-HOLE-F)>

<ROUTINE DUNGEON-HOLE-F ()
	 <COND (<VERB? LOOK-INSIDE>
		<COND (<LIT? ,OUBLIETTE>
		       <TELL ,SOME-LIGHT>)
		      (T
		       <TELL ,ONLY-BLACKNESS>)>)
	       (<VERB? PUT>
		<COND (<G? <GETP ,PRSO ,P?SIZE> 4>
		       <COND (<OR <PRSO? ,PERCH>
				  <ULTIMATELY-IN? ,PERCH ,PRSO>>
			      <SETG REMOVED-PERCH-LOC ,OUBLIETTE>)>
		       <REMOVE ,PRSO>)
		      (T
		       <MOVE ,PRSO ,OUBLIETTE>)>
		<TELL "Done." CR>)	
	       (<VERB? EXAMINE>
		<TELL
"It's big enough to drop through, but a return trip doesn't look
at all assured." CR>)
	       (<VERB? REACH-IN>
		<TELL ,NOTHING-IN-REACH>)
	       (<VERB? ENTER>
		<DO-WALK ,P?DOWN>)>>

<ROOM OUBLIETTE
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Oubliette")
      (UP SORRY "You're trapped.")
      (OUT SORRY "You're trapped.")
      (FLAGS RLANDBIT)
      (SYNONYM OUBLIETTE)
      (RIDDLE
"I look just like my brother; we have the same father and mother! We're
identical in every way; we were born on the very same day. I'm younger
by seconds, but as everyone reckons, I'm not a twin, and never have been.
What am I?\"")
      (MAP-LOC <PTABLE SECRET-WING-MAP-NUM MAP-GEN-Y-7 MAP-GEN-X-9>)
      (ACTION OUBLIETTE-F)>

<GLOBAL OUBLIETTE-SCORE 20>

<ROUTINE OUBLIETTE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You're trapped in a narrow prison cell accessible only from above. The
upper portion of the cell is lost in gloom. The floor is muddy, and you
sink almost to your ">
		<COND (,ALLIGATOR
		       <TELL "alligatorish nostrils.">)
		      (T
		       <TELL "knees.">)>)
	       (<AND <EQUAL? .RARG ,M-ENTER>
		     <NOT ,TIME-STOPPED>>
		<QUEUE I-JESTER 3>)
	       (<AND <EQUAL? .RARG ,M-END>
		     <IN? ,JESTER ,HERE>>
		<SETUP-ORPHAN "answer">)>>

<OBJECT TRIPLET
	(LOC GLOBAL-OBJECTS)
	(DESC "triplet")
	(SYNONYM TRIPLET TRIPLETS QUADRUPLET QUINTUPLET)>

<OBJECT SEAMANS-CAP
	(LOC OUBLIETTE)
	(DESC "seaman's cap")
	(FDESC
"The last prisoner in the oubliette must have been a sailor; an old seaman's
cap lies discarded in the corner.")
	(SYNONYM CAP HAT)
	(ADJECTIVE OLD SEAMAN\'S SEAMAN)
	(FLAGS TAKEBIT WEARBIT MAGICBIT)
	(GENERIC GENERIC-HAT-F)
	(VALUE 12)>

<ROUTINE GENERIC-HAT-F (TBL LEN)
	 <COND (<NOT <VERB? TAKE-OFF REMOVE>>
		<RFALSE>)
	       (<AND <FSET? ,HARDHAT ,WORNBIT>
		     <FSET? ,SEAMANS-CAP ,WORNBIT>>
		<RFALSE>)
	       (<FSET? ,HARDHAT ,WORNBIT>
		,HARDHAT)
	       (<FSET? ,SEAMANS-CAP ,WORNBIT>
		,SEAMANS-CAP)
	       (T
		<RFALSE>)>>

<ROOM CELL
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Cell")
      (NW TO DUNGEON)
      (OUT TO DUNGEON)
      (FLAGS RLANDBIT)
      (SYNONYM CELL)
      (ICON CELL-ICON)
      (MAP-LOC <PTABLE SECRET-WING-MAP-NUM MAP-GEN-Y-7 MAP-GEN-X-10>)
      (ACTION CELL-F)>

<ROUTINE CELL-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This cell is the height of luxury for this dungeon -- the floor isn't
covered with spikes, and there are actually a few corners which aren't
dominated by giant spiders.">
		<COND (<IN? ,COBWEBS ,HERE>
		       <TELL " " ,CELL-WALL-DESC>)>
		<TELL " The only exit is northwest.">)>>

<OBJECT GIANT-SPIDERS
	(LOC CELL)
	(DESC "giant spider")
	(SYNONYM SPIDER SPIDERS)
	(ADJECTIVE LARGE)
	(FLAGS NDESCBIT)
	(ACTION GIANT-SPIDERS-F)>

<ROUTINE GIANT-SPIDERS-F ()
	 <COND (<TOUCHING? ,GIANT-SPIDERS>
		<TELL
"There's only one thing you need to remember in connection with giant spiders:
You leave them alone, they'll leave you alone." CR>)>>

<OBJECT COBWEBS
	(LOC CELL)
	(DESC "cobwebs")
	(SYNONYM COBWEBS WEB COBWEB WEBS)
	(ADJECTIVE THICK)
	(FLAGS NDESCBIT NARTICLEBIT PLURALBIT)
	(ACTION COBWEBS-F)>

<ROUTINE COBWEBS-F ()
	 <COND (<VERB? ENTER>
		<TELL
"Walk face first into a thick wall of yukko cobwebs? Mucho disgusto! Maybe if
you cleared them away, first..." CR>)
	       (<VERB? REMOVE TAKE-WITH CLEAN MOVE>
		<COND (<AND <NOT ,PRSI>
			    <ULTIMATELY-IN? ,BROOM>>
		       <SETG PRSI ,BROOM>)>
		<COND (<NOT ,PRSI>
		       <TELL "Yuk! Bleh! Ukky-poo! T">
		       <COND (<NOT <FSET? ,GLOVE ,WORNBIT>>
			      <TELL
"hese cobwebs are way too gross to touch with your
bare hands. Furthermore, t">)>
		       <TELL
"here are way too many to clean away without some
kind of cleaning accessory." CR>)
		      (<NOT <PRSI? ,BROOM>>
		       <TELL
"Don't bother to apply for any jobs as a maid." CR>)
		      (T
		       <REMOVE ,COBWEBS>
		       <THIS-IS-IT ,FLASK>
		       <MOVE ,FLASK ,HERE>
		       <TELL
"It's a dirty job, but someone's gotta do it. You clear away most
of the cobwebs, revealing a blank wall. Sitting at the base of the
wall is a " 'FLASK "!" CR>
		       <INC-SCORE 12>)>)>>

<OBJECT FLASK
	(DESC "stoppered glass flask filled with liquid")
	(LDESC
"A stoppered glass flask with a skull-and-crossbones marking is here.
The flask is filled with some clear liquid.")
	(SYNONYM FLASK)
	(ADJECTIVE GLASS)
	(FLAGS TAKEBIT TRANSBIT READBIT MAGICBIT SEARCHBIT)
	(CAPACITY 5)
	(SIZE 5)
	(VALUE 0) ;"12 points given elsewhere"
	(TEXT "There is a skull-and-crossbones engraved on the glass.")
	(ACTION FLASK-F)>

<ROUTINE FLASK-F ()
	 <COND (<VERB? LOOK-INSIDE>
		<TELL
"You notice that objects behind the flask appear to be magnified." CR>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,PRSI ,FLASK>>
		<TELL
"The flask distorts and magnifies the " D ,PRSO ", showing details
not noticed earlier." CR "   ">
		<RFALSE>)
	       (<VERB? DRINK-FROM>
		<DO-FIRST "open" ,FLASK>)
	       (<VERB? OPEN MUNG THROW>
		<COND (<NOT <VERB? OPEN>>
		       <TELL "The flask breaks into pieces. ">)
		      (T
		       <TELL "You remove the stopper. ">)>
		<TELL
"As you pass out, you realize that the vapors from the
flask's contents are ">
		<COND (<FSET? ,CLOWN-NOSE ,WORNBIT>
		       <TELL
"potent enough to get past your clown nose, and are also quite ">)>
		<JIGS-UP "fatal.">)>>

<OBJECT LIQUID
	(LOC FLASK)
	(DESC "clear liquid")
	(SYNONYM LIQUID)
	(ADJECTIVE CLEAR)
	(FLAGS NDESCBIT)
	(ACTION LIQUID-F)>

<ROUTINE LIQUID-F ()
	 <COND (<VERB? DRINK>
		<DO-FIRST "open" ,FLASK>)>>

<ROOM TORTURE-CHAMBER
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Torture Chamber")
      (LDESC
"This room contains all your standard torture devices: an iron maiden,
a water chamber, a snake pit, a comfy chair, and so forth. The only
obvious exit is northeast.")
      (NE TO DUNGEON)
      (OUT TO DUNGEON)
      (FLAGS RLANDBIT)
      (SYNONYM CHAMBER)
      (ADJECTIVE TORTURE)
      (MAP-LOC <PTABLE SECRET-WING-MAP-NUM MAP-GEN-Y-7 MAP-GEN-X-8>)
      (ACTION TORTURE-CHAMBER-F)>

<ROUTINE TORTURE-CHAMBER-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<COND (<NOT ,METRONOME-LOC>
		       <SETG METRONOME-LOC <COND (<PROB 33> ,IRON-MAIDEN)
						 (<PROB 50> ,SNAKE-PIT)
						 (T ,WATER-CHAMBER)>>)>
		<SETG METRONOME-COUNTER 0>)
	       (<AND <EQUAL? .RARG ,M-END>
		     <FSET? ,METRONOME ,TRYTAKEBIT>>
		<SETG METRONOME-COUNTER <+ ,METRONOME-COUNTER 1>>
		<COND (<EQUAL? ,METRONOME-COUNTER 1>
		       <RFALSE>)>
		<TELL "   ">
		<COND (<EQUAL? ,METRONOME-COUNTER 2>
		       <TELL "You hear a ticking sound." CR>)
		      (<EQUAL? ,METRONOME-COUNTER 3>
		       <TELL "The ticking grows louder." CR>)
		      (<EQUAL? ,METRONOME-COUNTER 4>
		       <TELL
"The ticking is really getting to you. It seems to be
controlling your heartbeat!" CR>)
		      (T
		       <TELL
"The ticking is unbearably deafening! You run screaming from
the Torture Chamber!" CR CR>
		       <GOTO ,DUNGEON>)>)>>

<GLOBAL METRONOME-LOC <>>

<GLOBAL METRONOME-COUNTER 0>

<GLOBAL METRONOME-ON <>>

<OBJECT METRONOME
	(DESC "metronome")
	(SYNONYM METRONOME)
	(FLAGS TAKEBIT TRYTAKEBIT MAGICBIT)
	(VALUE 0) ;"12 points given elsewhere"
	(ACTION METRONOME-F)>

<ROUTINE METRONOME-F ()
	 <COND (<VERB? EXAMINE>
		<TELL "The metronome is">
		<COND (,METRONOME-ON
		       <TELL " ticking insistently." CR>)
		      (T
		       <TELL "n't on." CR>)>)
	       (<VERB? ON>
		<COND (,METRONOME-ON
		       <TELL "It is!" CR>)
		      (T
		       <SETG METRONOME-ON T>
		       <QUEUE I-METRONOME -1>
		       <TELL "The metronome begins to tick." CR>)>)
	       (<VERB? OFF>
		<COND (,METRONOME-ON
		       <SETG METRONOME-ON <>>
		       <DEQUEUE I-METRONOME>
		       <TELL "The metronome stops ticking." CR>)
		      (T
		       <TELL "It is!" CR>)>)>>

<ROUTINE I-METRONOME ("OPTIONAL" (CALLED-BY-LISTEN <>) "AUX" CNT)
	 <COND (<EQUAL? <LOC ,METRONOME> <>>
		<DEQUEUE I-METRONOME>)>
	 <COND (<VISIBLE? ,METRONOME>
		<SET CNT <+ 3 <RANDOM 30>>>
		<COND (<NOT .CALLED-BY-LISTEN>
		       <TELL "   ">)>
		<TELL "The metronome insistently declares, \"Tick">
		<REPEAT ()
			<TELL ", tick">
			<SET CNT <- .CNT 1>>
			<COND (<EQUAL? .CNT 0>
			       <RETURN>)>>
		<TELL ".\"" CR>)
	       (T
		<RFALSE>)>>

<OBJECT COMFY-CHAIR
	(LOC TORTURE-CHAMBER)
	(DESC "comfy chair")
	(SYNONYM CHAIR)
	(ADJECTIVE COMFY)
	(FLAGS NDESCBIT CONTBIT INBIT SEARCHBIT VEHBIT OPENBIT)
	(ACTION TORTURE-DEVICE-F)>

<OBJECT IRON-MAIDEN
	(LOC TORTURE-CHAMBER)
	(DESC "iron maiden")
	(SYNONYM MAIDEN)
	(ADJECTIVE IRON)
	(FLAGS NDESCBIT VOWELBIT INBIT CONTBIT SEARCHBIT VEHBIT)
	(ACTION TORTURE-DEVICE-F)>

<OBJECT WATER-CHAMBER
	(LOC TORTURE-CHAMBER)
	(DESC "water chamber")
	(SYNONYM CHAMBER)
	(ADJECTIVE WATER)
	(FLAGS NDESCBIT CONTBIT INBIT SEARCHBIT VEHBIT)
	(ACTION TORTURE-DEVICE-F)>

<OBJECT SNAKE-PIT
	(LOC TORTURE-CHAMBER)
	(DESC "snake pit")
	(SYNONYM PIT LID)
	(ADJECTIVE SNAKE)
	(FLAGS NDESCBIT CONTBIT INBIT SEARCHBIT VEHBIT)
	(ACTION TORTURE-DEVICE-F)>

<OBJECT THOUSANDS-OF-SNAKES
	(LOC SNAKE-PIT)
	(DESC "writhing mass of snakes")
	(SYNONYM SNAKE MASS)
	(ADJECTIVE WRITHING)>

<ROUTINE TORTURE-DEVICE-F ()
	 <COND (<VERB? ENTER>
		<COND (<AND <NOT <PRSO? ,COMFY-CHAIR>>
			    <NOT <FSET? ,PRSO ,OPENBIT>>>
		       <DO-FIRST "open" ,PRSO>
		       <RTRUE>)>
		<TELL "You climb into the " 'PRSO ". ">
		<COND (<PRSO? ,COMFY-CHAIR>
		       <JIGS-UP
"It's so, so comfy that you can't get up, and you sit there comfortably
until you starve to death.">)
		      (<PRSO? ,IRON-MAIDEN>
		       <JIGS-UP
"It shuts around you, piercing you with its sharp spikes.">)
		      (<PRSO? ,WATER-CHAMBER>
		       <JIGS-UP
"Immediately, the chamber locks behind you, and water begins
rhythmically dripping onto your head. Sometime later you go mad,
and rip yourself into small pieces.">)
		      (T
		       <JIGS-UP
"A thousand snakes converge on you. In their overeagerness to dine,
they skip right over the part where they kill you, and instead get
right to the part where they eat you.">)>)
	       (<VERB? EXAMINE>
		<COND (<PRSO? ,COMFY-CHAIR>
		       <TELL "It sure looks comfortable!" CR>
		       <RTRUE>)
		      (<PRSO? ,WATER-CHAMBER>
		       <TELL
"It's a small chamber where water is slowly dripped onto the victim's head
until he or she goes mad.">)
		      (<PRSO? ,IRON-MAIDEN>
		       <TELL
"It's similar to a suit of armor, except that the inside is
lined with sharp spikes.">)
		      (T
		       <COND (<NOT <FSET? ,SNAKE-PIT ,OPENBIT>>
			      <TELL "Beneath the lid of the snake pit y">)
			     (T
			      <TELL "Y">)>
		       <TELL
"ou hear the hissing of a thousand hungry snakes.">)>
		<TELL " The " 'PRSO " is ">
		<OPEN-CLOSED ,PRSO>
		<TELL ,PERIOD-CR>) 
	       (<AND <VERB? OPEN>
		     <PRSO? ,METRONOME-LOC>
		     <FSET? ,METRONOME ,TRYTAKEBIT>>
		<FCLEAR ,METRONOME ,TRYTAKEBIT>
		<MOVE ,METRONOME ,HERE>
		<FSET ,PRSO ,OPENBIT>
		<TELL
"As you open the " 'PRSO ", a metronome falls from the shadowy recesses
of the ceiling and lands with a muffled thud in the center of the room.">
		<COND (<G? ,METRONOME-COUNTER 1>
		       <TELL
" Thankfully, the fall seems to have shut it off.">)>
		<CRLF>
		<INC-SCORE 12>)
	       (<AND <VERB? OPEN>
		     ,TIME-STOPPED>
		<TELL ,WONT-BUDGE>)>>

;"west wing"

<ROOM WEST-HALL
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "West Hall")
      (WEST TO WEST-WING IF WEST-DOOR IS OPEN)
      (NE TO FORMAL-GARDEN)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL WEST-DOOR LOCK-OBJECT)
      (MAP-LOC <PTABLE MAIN-FLOOR-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-3>)
      (ACTION WEST-HALL-F)>

<ROUTINE WEST-HALL-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"The castle's newest wing can be found beyond the huge oak door which lies ">
		<OPEN-CLOSED ,WEST-DOOR>
		<TELL " to the west. The only other exit is northeast.">)>>

<OBJECT WEST-DOOR
	(LOC LOCAL-GLOBALS)
	(DESC "door")
	(SYNONYM DOOR)
	(ADJECTIVE LARGE OAK)
	(FLAGS DOORBIT LOCKEDBIT)
	(ACTION WEST-DOOR-F)>

<ROUTINE WEST-DOOR-F ()
	 <COND (<AND <VERB? UNLOCK>
		     <FSET? ,WEST-DOOR ,LOCKEDBIT>
		     <PRSI? ,WEST-KEY>>
		<FCLEAR ,WEST-DOOR ,LOCKEDBIT>
		<LOCKED-UNLOCKED ,WEST-DOOR T>)
	       (<AND <VERB? LOCK>
		     <NOT <FSET? ,WEST-DOOR ,LOCKEDBIT>>
		     <PRSI? ,WEST-KEY>>
		<FSET ,WEST-DOOR ,LOCKEDBIT>
		<LOCKED-UNLOCKED ,WEST-DOOR>)>>

<ROOM WEST-WING
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "West Wing")
      (EAST TO WEST-HALL IF WEST-DOOR IS OPEN)
      (WEST PER DIRIGIBLE-HANGAR-ENTER-F)
      (NORTH TO PEG-ROOM)
      (SOUTH TO GYM)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL WEST-DOOR LOCK-OBJECT)
      (VALUE 8)
      (MAP-LOC <PTABLE MAIN-FLOOR-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-2>)
      (ICON WEST-WING-ICON)
      (ACTION WEST-WING-F)>

<ROUTINE WEST-WING-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This wing exhibits more recent styling: smoothly dressed stone inlaid with
marble patterns. Through the ">
		<OPEN-CLOSED ,WEST-DOOR>
		<TELL
" oak door to the east lie the primary halls of the castle. Other exits lead
north, west, and south. " ,FUDGE>)>>

<GLOBAL WALNUT-OPENED <>>

<GLOBAL WALNUT-SHOWN <>>

<GLOBAL WALNUT-EATEN <>>

<GLOBAL JESTER-DISPOSED 0>

<ROUTINE DIRIGIBLE-HANGAR-ENTER-F ()
	 <COND (,WALNUT-EATEN
		,DIRIGIBLE-HANGAR)
	       (T
		<COND (<NOT <IN? ,JESTER ,HERE>>
		       <TELL "An invisible hand seems to stop you">
		       <COND (<L? <- ,MOVES ,JESTER-DISPOSED> 4>
			      <TELL
", and a familiar voice says, \"Surely you didn't think you'd be rid
of me so easily!\"" CR>)
			     (T
			      <TELL ,PERIOD-CR>)>)>
		<I-JESTER>
		<RFALSE>)>>
\ 
;"peggleboz"

<ROOM PEG-ROOM
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Peg Room")
      (OUT TO WEST-WING)
      (SOUTH TO WEST-WING)
      (NORTH TO GAMING-ROOM IF PEG-PASSAGE-OPENED)
      (FLAGS RLANDBIT ONBIT)
      (MAP-LOC <PTABLE MAIN-FLOOR-MAP-NUM MAP-GEN-Y-4 MAP-GEN-X-2>)
      (ICON PEG-ROOM-ICON)
      (ACTION PEG-ROOM-F)>

<ROUTINE PEG-ROOM-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You're in a nondescript room with an exit to the south. ">
		<COND (,PEG-PASSAGE-OPENED
		       <TELL "A previously hidden passage leads north. ">)>
		<TELL
"In the center of the room is a pegboard. Hanging on the wall are a set of
instructions.">)>>

<OBJECT PEGGLEBOZ-OBJECT
	(LOC GLOBAL-OBJECTS)
	(DESC "Peggleboz")
	(SYNONYM PEGGLEBOZ)
	(ADJECTIVE GUSTAV)
	(RESEARCH
"\"Peggleboz, a popular game of jumping pegs, is named after its creator,
Gustav Peggleboz (399 - 456 GUE).\"")
	(ACTION PEGGLEBOZ-OBJECT-F)>

<ROUTINE PEGGLEBOZ-OBJECT-F ()
	 <COND (<VERB? PLAY>
		<COND (<EQUAL? ,HERE ,PEG-ROOM>
		       <PEG-GAME>
		       <RTRUE>)
		      (T
		       <TELL
,YOU-CANT "play Peggleboz without a pegboard!" CR>)>)>>

<OBJECT PEGBOARD
	(LOC PEG-ROOM)
	(DESC "pegboard")
	(SYNONYM BOARD PEGBOARD)
	(ADJECTIVE PEG)
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION PEGBOARD-F)>

<ROUTINE PEGBOARD-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The board has 21 holes, 20 of them filled with pegs. The holes are
arranged in a roughly triangular shape." CR>)
	       (<VERB? TAKE>
		<TELL
"The pegboard is an unmovable feature of the room." CR>)>>

<OBJECT PEGBOARD-PEGS
	(LOC PEG-ROOM)
	(DESC "peg")
	(SYNONYM PEG)
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION PEGBOARD-PEGS-F)>

<ROUTINE PEGBOARD-PEGS-F ()
	 <COND (<VERB? MOVE TAKE>
		<TELL
"It would behoove you to read the instructions that are posted on the wall
here." CR>)>>

<OBJECT SET-OF-INSTRUCTIONS
	(LOC PEG-ROOM)
	(OWNER SET-OF-INSTRUCTIONS)
	(DESC "set of instructions")
	(SYNONYM SET INSTRUCTIONS RULES)
	(FLAGS NDESCBIT READBIT)
	(TEXT
"\"Rules for PEGGLEBOZ:|
1. Pegs can only move by jumping another peg.|
2. Pegs can only jump one peg per move.|
3. Pegs jumped are removed.|
4. Your goal is to end up with one peg in the starting hole.|
5. To begin, simply type PLAY PEGGLEBOZ!\"")>

<ROUTINE PEG-GAME ("AUX" (FIRST-MOVE T) (PEG-SELECTED <>) CHAR JUMPED-PEG
		         (DONT-CLEAR <>) (WON <>) CNT)
	 <CLEAR ,S-FULL>
	 <SPLIT-BY-PICTURE ,PEGGLEBOZ-SPLIT T>
	 <ADJUST-TEXT-WINDOW ,PEGGLEBOZ-BORDER-BOTTOM>
	 <SETUP-PEGGLEBOZ>
	 <REPEAT ()
		 <COND (.WON
			T)
		       (.PEG-SELECTED
			<CLEAR ,S-TEXT>
			<TELL "You are moving the peg at letter ">
			<HLIGHT ,H-BOLD>
			<TELL C <+ ,LETTER-OFFSET .PEG-SELECTED>>
			<HLIGHT ,H-NORMAL>
			<TELL
". Select the letter for the destination point of that peg, or hit ">
			<HLIGHT ,H-BOLD>
			<TELL C <+ ,LETTER-OFFSET .PEG-SELECTED>>
			<HLIGHT ,H-NORMAL>
			<TELL " again to \"unselect\" that peg.">)
		       (T
			<COND (<AND <NOT .FIRST-MOVE>
				    <NOT .DONT-CLEAR>>
			       <CLEAR ,S-TEXT>)>
			<COND (<NOT .DONT-CLEAR>
			       <COND (<EQUAL? <PEG-COUNT> 1>
				      <TELL
"Type X to exit, Y to display your moves, and Z to start again.">)
				     (T
				      <TELL
"Type the letter corresponding to the peg you'd like to move.">
				      <COND (.FIRST-MOVE
					     <SET FIRST-MOVE <>>
					     <TELL
" Type X to exit Peggleboz, Y to display your moves so far,
Z to reset the board.">)>)>)>)>
		 <SET CHAR
		      <COND (.PEG-SELECTED
			     <BLINK-WHILE-AWAITING-INPUT
				 ,UNHIGHLIGHTED-PEG ,HIGHLIGHTED-PEG
				 <GET ,BOARD-TABLE <* .PEG-SELECTED 2>>
				 <GET ,BOARD-TABLE <+ <* .PEG-SELECTED 2> 1>>
				 ,S-WINDOW>)
			    (T
			     <INPUT 1>)>>
		 <COND (<AND <G? .CHAR 96>
			     <L? .CHAR 123>> ;"convert lower to upper case"
			<SET CHAR <- .CHAR 32>>)>
		 <COND (<EQUAL? .CHAR !\X>
			<RESET-PEGBOARD>
			<INIT-SL-WITH-SPLIT ,TEXT-WINDOW-PIC-LOC>
			<CLEAR ,S-TEXT>
			<RETURN>)
		       (<EQUAL? .CHAR !\Y>
			<SET DONT-CLEAR T>
			<DISPLAY-MOVES>)
		       (<EQUAL? .CHAR !\Z>
			<RESET-PEGBOARD>
			<SET WON <>>
			<SET CNT 4>
			<SCREEN ,S-WINDOW>
			<DRAW-PEGS>
			<SCREEN ,S-TEXT>
			<CLEAR ,S-TEXT>
			<SET PEG-SELECTED <>>)
		       (<NOT .PEG-SELECTED>
			<SET PEG-SELECTED <- .CHAR 64>>
			<COND (<OR <G? .PEG-SELECTED 21>
				   <L? .PEG-SELECTED 1>>
			       <CLEAR ,S-TEXT>
			       <SOUND 1>
			       <SET PEG-SELECTED <>>
			       <SET DONT-CLEAR T>
			       <TELL
"Illegal choice. Type a letter from A thru U to select a peg. Or, type X
to exit, Y to display your moves, or Z to reset the board.">)
			      (<EQUAL? <GET ,PEG-TABLE .PEG-SELECTED> 0>
			       <CLEAR ,S-TEXT>
			       <SOUND 1>
			       <SET DONT-CLEAR T>
			       <TELL
"There's no peg at point " C <+ ,LETTER-OFFSET .PEG-SELECTED> ".">
			       <SET PEG-SELECTED <>>)>)	
		       (<EQUAL? .PEG-SELECTED <- .CHAR 64>>
			<SET DONT-CLEAR T>
			<SET PEG-SELECTED <>>
			<CLEAR ,S-TEXT>
			<TELL "Unselected.">)
		       (<SET JUMPED-PEG <LEGAL-MOVE .PEG-SELECTED .CHAR>>
			;"record move for later display"
			<PUT ,PEG-MOVE-TABLE ,PEG-MOVE-NUMBER .PEG-SELECTED>
			<PUT ,PEG-MOVE-TABLE <+ ,PEG-MOVE-NUMBER 1>
					     <- .CHAR 64>>
			<SETG PEG-MOVE-NUMBER <+ ,PEG-MOVE-NUMBER 2>>
			;"record move in storage tables"
			<PUT ,PEG-TABLE .JUMPED-PEG 0>
			<PUT ,PEG-TABLE .PEG-SELECTED 0>
			<PUT ,PEG-TABLE <- .CHAR 64> 1>
			<SCREEN ,S-WINDOW>
			<DISPLAY <GET ,PEG-BACKGROUND-PIC-TBL .PEG-SELECTED>
				 <GET ,BOARD-TABLE <* .PEG-SELECTED 2>>
				 <GET ,BOARD-TABLE <+ <* .PEG-SELECTED 2> 1>>>
			<DISPLAY <GET ,PEG-BACKGROUND-PIC-TBL .JUMPED-PEG>
				 <GET ,BOARD-TABLE <* .JUMPED-PEG 2>>
				 <GET ,BOARD-TABLE <+ <* .JUMPED-PEG 2> 1>>>
			<DISPLAY ,UNHIGHLIGHTED-PEG
				 <GET ,BOARD-TABLE <* <- .CHAR 64> 2>>
				 <GET ,BOARD-TABLE <+ <* <- .CHAR 64> 2> 1>>>
			<SET PEG-SELECTED <>>
			<SCREEN ,S-TEXT>
			<CLEAR ,S-TEXT>
			<COND (<PEGGLEBOZ-WIN-CHECK>
			       <SET WON T>
			       <SETG PEG-PASSAGE-OPENED T>
			       <SOUND 1> <SOUND 1> <SOUND 1>
			       <TELL
"A secret doorway to the north slides open. (Hit X to exit).">
			       <INC-SCORE 16>)>)>>>

<ROUTINE SETUP-PEGGLEBOZ ("AUX" (I 2))
	 <COND (<NOT <FSET? ,PEGGLEBOZ-OBJECT ,TOUCHBIT>>
		;"set up BOARD-TABLE"
		<FSET ,PEGGLEBOZ-OBJECT ,TOUCHBIT>
		<REPEAT ((TT ,PEGGLEBOZ-PIC-TABLE))
			<PICINF-PLUS-ONE <ZGET .TT 0>>
			<ZPUT ,BOARD-TABLE .I <ZGET ,PICINF-TBL 0>>
			<ZPUT ,BOARD-TABLE <+ .I 1> <ZGET ,PICINF-TBL 1>>
			<SET I <+ .I 2>>
			<COND (<G? .I 43>
			       <RETURN>)>
			<SET TT <ZREST .TT 2>>>)>
	 <SCREEN ,S-FULL>
	 <DISPLAY ,PEGGLEBOZ-BORDER 1 1>
	 <SCREEN ,S-WINDOW>
	 <DRAW-PEGS>
	 <SCREEN ,S-TEXT>>

<CONSTANT PEGGLEBOZ-PIC-TABLE
	  <PTABLE ,PEGGLEBOZ-A-LOC
		  ,PEGGLEBOZ-B-LOC
		  ,PEGGLEBOZ-C-LOC
		  ,PEGGLEBOZ-D-LOC
		  ,PEGGLEBOZ-E-LOC
		  ,PEGGLEBOZ-F-LOC
		  ,PEGGLEBOZ-G-LOC
		  ,PEGGLEBOZ-H-LOC
		  ,PEGGLEBOZ-I-LOC
		  ,PEGGLEBOZ-J-LOC
		  ,PEGGLEBOZ-K-LOC
		  ,PEGGLEBOZ-L-LOC
		  ,PEGGLEBOZ-M-LOC
		  ,PEGGLEBOZ-N-LOC
		  ,PEGGLEBOZ-O-LOC
		  ,PEGGLEBOZ-P-LOC
		  ,PEGGLEBOZ-Q-LOC
		  ,PEGGLEBOZ-R-LOC
		  ,PEGGLEBOZ-S-LOC
		  ,PEGGLEBOZ-T-LOC
		  ,PEGGLEBOZ-U-LOC>>

<CONSTANT BOARD-TABLE ;"Y and X locations of each peg spot"
	<ITABLE 44 0>>

<ROUTINE DRAW-PEGS ("AUX" (NUM 1))
	 <REPEAT ()
		 <COND (<EQUAL? <GET ,PEG-TABLE .NUM> 1>
			<DISPLAY ,UNHIGHLIGHTED-PEG
				 <GET ,BOARD-TABLE <* .NUM 2>>
				 <GET ,BOARD-TABLE <+ <* .NUM 2> 1>>>)
		       (T
			<DISPLAY <GET ,PEG-BACKGROUND-PIC-TBL .NUM>
				 <GET ,BOARD-TABLE <* .NUM 2>>
				 <GET ,BOARD-TABLE <+ <* .NUM 2> 1>>>)>
		 <COND (<G? <SET NUM <+ .NUM 1>> 21>
			<RETURN>)>>>

<CONSTANT PEG-BACKGROUND-PIC-TBL
	  <PLTABLE BACKGROUND-A
		   BACKGROUND-B
		   BACKGROUND-C
		   BACKGROUND-D
		   BACKGROUND-E
		   BACKGROUND-F
		   BACKGROUND-G
		   BACKGROUND-H
		   BACKGROUND-I
		   BACKGROUND-J
		   BACKGROUND-K
		   BACKGROUND-L
		   BACKGROUND-M
		   BACKGROUND-N
		   BACKGROUND-O
		   BACKGROUND-P
		   BACKGROUND-Q
		   BACKGROUND-R
		   BACKGROUND-S
		   BACKGROUND-T
		   BACKGROUND-U>>

<ROUTINE RESET-PEGBOARD ("AUX" CNT)
	 <SETG PEG-MOVE-NUMBER 0>
	 <PUT ,PEG-TABLE 1 1>
	 <COPYT <REST ,PEG-TABLE 2> <REST ,PEG-TABLE 4> -40>
	 <PUT ,PEG-TABLE 7 0>
	 <COPYT ,PEG-MOVE-TABLE 0 80>>

<CONSTANT PEG-TABLE
	<TABLE 0 ;"zeroth element not used"
	       1 1 1 1 1 1 0
	       1 1 1 1 1 1 1
	       1 1 1 1 1 1 1>>

<ROUTINE LEGAL-MOVE (SELECTED-PEG CHAR "AUX" TBL TBL-SPOT JUMPED-PEG)
	 <SET CHAR <- .CHAR 64>>
	 <SET TBL <GET ,LEGAL-MOVE-TABLE .SELECTED-PEG>>
         <COND (<EQUAL? <GET .TBL 0> .CHAR>
		<SET TBL-SPOT 0>)
	       (<EQUAL? <GET .TBL 2> .CHAR>
		<SET TBL-SPOT 2>)
	       (<EQUAL? <GET .TBL 4> .CHAR>
		<SET TBL-SPOT 4>)
	       (<EQUAL? <GET .TBL 6> .CHAR>
		<SET TBL-SPOT 6>)
	       (T
		<CLEAR ,S-TEXT>
		<SOUND 1>
		<TELL
"Illegal move. You can jump a peg only to a spot which is two spots away.">
		<RFALSE>)>
	 <SET JUMPED-PEG <GET .TBL <+ .TBL-SPOT 1>>>
	 <COND (<EQUAL? <GET ,PEG-TABLE .CHAR> 1> ;"already peg in destination"
		<CLEAR ,S-TEXT>
		<SOUND 1>
		<TELL
"Illegal move. There's already a peg at spot " C <+ ,LETTER-OFFSET .CHAR> ".">
		<RFALSE>)
	       (<EQUAL? <GET ,PEG-TABLE .JUMPED-PEG> 0>
		<CLEAR ,S-TEXT>
		<SOUND 1>
		<TELL
"Illegal move. There's no peg at spot "
C <+ ,LETTER-OFFSET .JUMPED-PEG> " to jump.">
		<RFALSE>)>
	 <RETURN .JUMPED-PEG>>

<CONSTANT LEGAL-MOVE-TABLE
	<PTABLE ;"0"     <PTABLE 0 0> ;"not used"
	        ;"1 = A" <PTABLE 5 3 0 0 0 0 0 0>
	        ;"2 = B" <PTABLE 4 3 0 0 0 0 0 0>
	        ;"3 = C" <PTABLE 6 4 8 5 0 0 0 0>
	        ;"4 = D" <PTABLE 2 3 9 6 11 7 0 0>
	        ;"5 = E" <PTABLE 1 3 10 7 12 8 0 0>
	        ;"6 = F" <PTABLE 3 4 8 7 14 9 16 10>
	        ;"7 = G" <PTABLE 15 10 17 11 0 0 0 0>
	        ;"8 = H" <PTABLE 3 5 6 7 16 11 18 12>
	        ;"9 = I" <PTABLE 4 6 11 10 20 14 0 0>
	       ;"10 = J" <PTABLE 5 7 12 11 0 0 0 0>
	       ;"11 = K" <PTABLE 4 7 9 10 0 0 0 0>
	       ;"12 = L" <PTABLE 5 8 10 11 21 18 0 0>
	       ;"13 = M" <PTABLE 15 14 0 0 0 0 0 0>
	       ;"14 = N" <PTABLE 6 9 16 15 0 0 0 0>
	       ;"15 = O" <PTABLE 7 10 13 14 17 16 0 0>
	       ;"16 = P" <PTABLE 6 10 8 11 14 15 18 17>
	       ;"17 = Q" <PTABLE 7 11 15 16 19 18 0 0>
	       ;"18 = R" <PTABLE 8 12 16 17 0 0 0 0>
	       ;"19 = S" <PTABLE 17 18 0 0 0 0 0 0>
	       ;"20 = T" <PTABLE 9 14 0 0 0 0 0 0>
	       ;"21 = U" <PTABLE 12 18 0 0 0 0 0 0>>>

<ROUTINE PEGGLEBOZ-WIN-CHECK ("AUX" (CNT 1) (PEG-NUM 0))
	 <COND (,PEG-PASSAGE-OPENED ;"since you can play it even after winning"
		<RFALSE>)>
	 <REPEAT ()
		 <COND (<EQUAL? .CNT 22>
			<RETURN>)>
		 <COND (<EQUAL? <GET ,PEG-TABLE .CNT> 1>
			<SET PEG-NUM <+ .PEG-NUM 1>>)>
		 <SET CNT <+ .CNT 1>>>
	 <COND (<AND <EQUAL? .PEG-NUM 1>
		     <EQUAL? <GET ,PEG-TABLE 7> 1>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE PEG-COUNT ("AUX" (CNT 1) (PEG-NUM 0))
	 <REPEAT ()
		 <COND (<EQUAL? .CNT 22>
			<RETURN>)>
		 <COND (<EQUAL? <GET ,PEG-TABLE .CNT> 1>
			<SET PEG-NUM <+ .PEG-NUM 1>>)>
		 <SET CNT <+ .CNT 1>>>
	 <RETURN .PEG-NUM>>

<CONSTANT PEG-MOVE-TABLE
	<TABLE 0 0 0 0 0 0 0 0 0 0
	       0 0 0 0 0 0 0 0 0 0
	       0 0 0 0 0 0 0 0 0 0
	       0 0 0 0 0 0 0 0 0 0>>

<CONSTANT LETTER-OFFSET <- <ASCII !\A> 1>>

<GLOBAL PEG-MOVE-NUMBER 0>

<GLOBAL PEG-PASSAGE-OPENED <>>

<ROUTINE DISPLAY-MOVES ("AUX" X Y (CNT 0))
	 <CLEAR ,S-TEXT>
	 <COND (<EQUAL? ,PEG-MOVE-NUMBER 0>
		<TELL "You haven't moved yet!">
		<RTRUE>)>
	 <FONT 4> ;"non-proportional spacing"
	 <REPEAT ()
		 <SET Y <+ </ <MOD .CNT 10> 2> 1>>
		 <SET X <+ <* </ .CNT 10> 12> 1>>
		 <CCURSET .Y .X>
		 <TELL
N <+ </ .CNT 2> 1> ") " C <+ ,LETTER-OFFSET <GET ,PEG-MOVE-TABLE .CNT>> " -> "
C <+ ,LETTER-OFFSET <GET ,PEG-MOVE-TABLE <+ .CNT 1>>>>
		 <COND (<EQUAL? .CNT <- ,PEG-MOVE-NUMBER 2>>
			<RETURN>)
		       (T
			<SET CNT <+ .CNT 2>>)>>
	 <FONT 1> ;"proportional spacing">

<ROOM GAMING-ROOM
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Gaming Room")
      (LDESC
"This is a plushly carpeted room draped in deeply hued velvets and satins.
The sole exit is south.")
      (SOUTH TO PEG-ROOM)
      (OUT TO WEST-WING)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL CARPET)
      (MAP-LOC <PTABLE MAIN-FLOOR-MAP-NUM MAP-GEN-Y-3 MAP-GEN-X-2>)
      (ACTION GAMING-ROOM-F)>

<ROUTINE GAMING-ROOM-F (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-ENTER>
		     <NOT <FSET? ,ZORKMID-BILL ,TOUCHBIT>>>
		<QUEUE I-JESTER 1>)>>

<ROOM GYM
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Gym")
      (LDESC
"Dimwit despised all forms of exercise; this room must have been a later
addition by one of his successors. Doorways lead north and southwest.")
      (NORTH TO WEST-WING)
      (SW TO STEAM-BATH)
      (FLAGS RLANDBIT ONBIT)
      (SYNONYM GYM)
      (MAP-LOC <PTABLE MAIN-FLOOR-MAP-NUM MAP-GEN-Y-6 MAP-GEN-X-2>)
      (ICON GYM-ICON)>

<OBJECT DUMBBELL
	(LOC GYM)
	(DESC "dumbbell")
	(LDESC
"A 100-ugh dumbbell is sitting here, looking heavy.")
	(SYNONYM DUMBBELL WEIGHTS SET)
	(ADJECTIVE HEAVY 100-UGH)
	(FLAGS ;PLURALBIT TAKEBIT MAGICBIT)
	(SIZE 99)
	(VALUE 12)
	(ACTION DUMBELL-F)>

<ROUTINE DUMBELL-F ()
	 <COND (<VERB? RAISE> ;"lift"
		<TELL
"You can barely get them off the ground, let alone press them." CR>)
	       (<VERB? EXAMINE>
		<TELL
"It's a set of 100-ugh weights, which look [just like the weights in the
Babe Flathead illustration which hasn't been done yet]." CR>)>>

<ROOM STEAM-BATH
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Steam Bath")
      (LDESC
"Pools, saunas, massage tables. Exit to the northeast.")
      (NE TO GYM)
      (OUT TO GYM)
      (FLAGS RLANDBIT ONBIT)
      (MAP-LOC <PTABLE MAIN-FLOOR-MAP-NUM MAP-GEN-Y-7 MAP-GEN-X-1>)>

;"east wing"

<ROOM EAST-HALL
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "East Hall")
      (EAST TO EAST-WING IF EAST-DOOR IS OPEN)
      (NW TO COURTYARD)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL EAST-DOOR LOCK-OBJECT)
      (MAP-LOC <PTABLE MAIN-FLOOR-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-7>)
      (ACTION EAST-HALL-F)>

<ROUTINE EAST-HALL-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"The castle's east wing lies through a massive door to the east, which is ">
		<OPEN-CLOSED ,EAST-DOOR>
		<TELL ". The only other exit from the hall is northwest.">)>>

<OBJECT EAST-DOOR
	(LOC LOCAL-GLOBALS)
	(DESC "door")
	(SYNONYM DOOR)
	(ADJECTIVE LARGE HEAVY OAK OAKEN)
	(FLAGS LOCKEDBIT DOORBIT)
	(ACTION EAST-DOOR-F)>

<ROUTINE EAST-DOOR-F ()
	 <COND (<AND <VERB? UNLOCK>
		     <FSET? ,EAST-DOOR ,LOCKEDBIT>
		     <PRSI? ,EAST-KEY>>
		<FCLEAR ,EAST-DOOR ,LOCKEDBIT>
		<LOCKED-UNLOCKED ,EAST-DOOR T>)
	       (<AND <VERB? LOCK>
		     <NOT <FSET? ,EAST-DOOR ,LOCKEDBIT>>
		     <PRSI? ,EAST-KEY>>
		<FSET ,EAST-DOOR ,LOCKEDBIT>
		<LOCKED-UNLOCKED ,EAST-DOOR>)>>

<ROOM EAST-WING
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "East Wing")
      (LDESC
"This wide corridor runs the length of the east wing of the castle. The
corridor ends at a large door to the west. There are openings to the north,
south and east.")
      (WEST TO EAST-HALL IF EAST-DOOR IS OPEN)
      (SOUTH TO CHAPEL)
      (NORTH TO LIBRARY)
      (EAST TO GUEST-ROOMS)
      (GLOBAL EAST-DOOR LOCK-OBJECT)
      (FLAGS RLANDBIT ONBIT)
      (VALUE 8)
      (MAP-LOC <PTABLE MAIN-FLOOR-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-8>)
      (ICON EAST-WING-ICON)>

<ROOM GUEST-ROOMS
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Guest Rooms")
      (LDESC
"This is where visitors to the castle would stay. Many stayed for decades.
Passages lead east and west.")
      (EAST TO SERVANTS-QUARTERS)
      (WEST TO EAST-WING)
      (FLAGS RLANDBIT ONBIT)
      (MAP-LOC <PTABLE MAIN-FLOOR-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-9>)>

<OBJECT WAND
	(LOC GUEST-ROOMS)
	(DESC "wand")
	(FDESC
"It seems that a wizard must have been a recent guest at the castle, since
a rather typical wizardly wand is lying here.")
	(SYNONYM WAND)
	(ADJECTIVE TYPICAL WIZARDLY INANIMATION)
	(FLAGS TAKEBIT READBIT)
	(SIZE 3)
	(ACTION WAND-F)>

<GLOBAL WAND-LIFE 5>

<ROUTINE WAND-F ()
	 <COND (<VERB? EXAMINE READ>
		<TELL
"The name \"Zapnerf\" is engraved on the wand in tiny script, followed
by the phrase \"16 minute model.\"" CR>)
	       (<AND <VERB? POINT>
		     <PRSO? ,WAND>>
		<MOVE ,WAND ,PROTAGONIST> ;"in case it's in a container"
		<COND (<PRSI? ,WAND>
		       <TELL
"Point the wand at itself!?! It isn't made of rubber!" CR>
		       <RTRUE>)
		      (,TIME-STOPPED
		       <TELL
"The wand's magic seems as frozen as time itself." CR>
		       <RTRUE>)
		      (<EQUAL? ,WAND-LIFE 0>
		       <TELL "Nothing. The wand seems to be used up." CR>
		       <RTRUE>)>
		<SETG WAND-LIFE <- ,WAND-LIFE 1>>
		<COND (<AND <GETP ,PRSI ,P?INANIMATE-DESC>
			    <FSET? ,PRSI ,ANIMATEDBIT>>
		       <COND (<PRSI? ,FOX>
			      <FSET ,PRSI ,WEARBIT>)>
		       <QUEUE <GETP ,PRSI ,P?ANIMATE-ROUTINE> 17>
		       <FCLEAR ,PRSI ,ANIMATEDBIT>
		       <FCLEAR ,PRSI ,ACTORBIT>
		       <FSET ,PRSI ,TOUCHBIT>
		       <THIS-IS-IT ,PRSI>
		       <TELL <GETP ,PRSI ,P?WAND-TEXT> CR>)
		      (<OR <FSET? ,PRSI ,BLACKBIT>
			   <FSET? ,PRSI ,WHITEBIT>>
		       <TELL
"The " D ,PRSO " seems to grow sluggish for a moment, but
there is no other effect." CR>)
		      (<PRSI? ,BEDBUG>
		       <REMOVE ,BEDBUG>
		       <TELL
"The bedbug freezes, becoming a small armored tank. You are surrounded by
racous laughter from an invisible source, and the bedbug/tank disappears!" CR>)
		      (<PRSI? ,LARGE-FLY ,LARGER-FLY ,EVEN-LARGER-FLY
			      ,LARGEST-FLY>
		       <TELL
"Zap! A bolt of magic just misses the fly. Oh, well. It seems that even
though it's large for a fly, it's small for a magic wand target." CR>)
		      (<PRSI? ,OTTO>
		       <REMOVE ,OTTO>
		       <QUEUE I-STONE-TO-OTTO 17>
		       <TELL "Otto ">
		       <COND (<AND <FSET? ,SPYGLASS ,TRYTAKEBIT>
				   <NOT <IN? ,SPYGLASS ,OTTO>>>
			      <MOVE ,SPYGLASS ,OTTO>
			      <TELL "grabs the spyglass just before he ">)>
		       <TELL
"transforms into a massive stone toad, just like the ones that flank the
Flatheadia Courthouse. His weight is now too much for even the largest of
lily pads to bear, and he sinks into the swamp with a sickening slurp." CR>)
		      (<PRSI? ,BROGMOID>
		       <TELL
"A few of the brogmoid's cells may have frozen; if the wand were twenty
bloits long, it might have a chance of affecting this enormous brogmoid." CR>)
		      (<PRSI? ,SICKLY-WITCH ,PRICKLY-WITCH>
		       <TELL
"A magical shield springs up around the witch. \"Your weak powers are
useless against us, simple adventurer!\" cackles the crone." CR>)
		      (<PRSI? ,SPENSEWEED>
		       <TELL
"No effect. Spenseweed isn't all that animate to begin with." CR>)
		      (<PRSI? ,UNICORNS>
		       <JIGS-UP
"One of the unicorns stiffens; its mate is understandably disturbed and, in an
un-unicorn-like display of temper, impales you on the tip of a pointy horn.">)
		      (<PRSI? ,ME>
		       <JIGS-UP
"You turn into a handsome statue of yourself. A pigeon swoops down, lands on
your head, and gives a pigeony whistle which translates roughly to, \"Hey,
guys, I've found a really great new statue for shitting on!\" Several thousand
additional pigeons swoop down, and you're crushed to dust under the resultant
tonnage of excrement.">)
		      (<PRSI? ,EXECUTIONER>
		       <JIGS-UP
"The executioner solidifies into a stone statue of himself! After a pair
of grunting guards finish dragging him away and a replacement executioner
arrives, you are led into a back room, where people who deserve something
even worse than hanging are taken.">)
		      (T
		       <TELL
"You feel a crackle of magical energy, but there doesn't seem to be any
effect on" TR ,PRSI>)>)>>

<ROOM SERVANTS-QUARTERS
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Servants' Quarters")
      (LDESC
"These are the spartan rooms where the servants lived (if you can actually call
this \"living\"). A passage leads west and a narrow stair spirals upward.")
      (WEST TO GUEST-ROOMS)
      (UP TO JESTERS-QUARTERS)
      (FLAGS RLANDBIT)
      (SYNONYM QUARTERS)
      (ADJECTIVE SERVANT\'S)
      (GLOBAL STAIRS)
      (MAP-LOC <PTABLE MAIN-FLOOR-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-10>)>

<ROOM CHAPEL
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Chapel")
      (LDESC
"None of the Flatheads were particularly religious, but that didn't stop
Dimwit from building the biggest chapel in all of Quendor. The exit is north,
at the rear of the chapel. Just below the altar is a small trap door.")
      (NORTH TO EAST-WING)
      (DOWN TO CRYPT IF TRAP-DOOR IS OPEN)
      (SYNONYM CHAPEL)
      (GLOBAL TRAP-DOOR)
      (FLAGS RLANDBIT ONBIT)
      (MAP-LOC <PTABLE MAIN-FLOOR-MAP-NUM MAP-GEN-Y-6 MAP-GEN-X-8>)
      (ICON CHAPEL-ICON)>

<OBJECT CHAPEL-ALTAR
	(LOC CHAPEL)
	(DESC "altar")
	(SYNONYM ALTAR)
	(FLAGS NDESCBIT VOWELBIT SURFACEBIT SEARCHBIT CONTBIT OPENBIT)>

"lower level"

<ROOM LOWER-HALL
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Lower Hall")
      (LDESC
"This large hall, barely illuminated by your light, has seen its better
days; based on the dust and debris, the lower levels of the castle probably
haven't been maintained since Dimwit's death. Stairs lead up and down; the
latter stair looks particularly forbidding. Passages head off to the north,
south, southeast, and southwest.")
      (NORTH TO LABORATORY)
      (SOUTH TO KENNELS)
      (SW TO G-U-HIGHWAY)
      (SE TO ROYAL-ZOO)
      (DOWN TO LOWEST-HALL)
      (UP TO GREAT-HALL)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)
      (MAP-LOC <PTABLE LOWER-LEVEL-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-6>)>

<ROOM LABORATORY
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Laboratory")
      (LDESC
"You have entered the lab that was affectionately known as Froblo Park.
The main exit is south, but there's a narrow doorway on the north wall.")
      (SOUTH TO LOWER-HALL)
      (NORTH TO TESTING-ROOM)
      (FLAGS RLANDBIT)
      (SYNONYM LABORATORY)
      (MAP-LOC <PTABLE LOWER-LEVEL-MAP-NUM MAP-GEN-Y-4 MAP-GEN-X-6>)
      (ICON LABORATORY-ICON)>

<OBJECT SCREWDRIVER
	(LOC LABORATORY)
	(DESC "screwdriver")
	(FDESC "Sitting on the lab bench is an old screwdriver.")
	(SYNONYM SCREWDRIVER DRIVER)
	(ADJECTIVE SCREW OLD)
	(FLAGS TAKEBIT MAGICBIT)
	(VALUE 12)>

<ROOM TESTING-ROOM
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Testing Room")
      (LDESC
"This is where certain dangerous experiments would take place. There
are two large booths, one on the left side of the room, the other on
the right side. The only exit is south.")
      (SOUTH TO LABORATORY)
      (OUT TO LABORATORY)
      (FLAGS RLANDBIT)
      (MAP-LOC <PTABLE LOWER-LEVEL-MAP-NUM MAP-GEN-Y-3 MAP-GEN-X-6>)>

<OBJECT LEFT-BOOTH
	(LOC TESTING-ROOM)
	(DESC "left booth")
	(SYNONYM BOOTH)
	(ADJECTIVE LEFT)
	(FLAGS NDESCBIT VEHBIT INBIT DROPBIT CONTBIT OPENBIT SEARCHBIT)
	(GENERIC GENERIC-BOOTH-F)
	(CAPACITY 60)
	(ACTION BOOTH-F)>

<OBJECT RIGHT-BOOTH
	(LOC TESTING-ROOM)
	(DESC "right booth")
	(SYNONYM BOOTH)
	(ADJECTIVE RIGHT)
	(FLAGS NDESCBIT VEHBIT INBIT DROPBIT CONTBIT OPENBIT SEARCHBIT)
	(GENERIC GENERIC-BOOTH-F)
	(CAPACITY 60)
	(ACTION BOOTH-F)>

<ROUTINE GENERIC-BOOTH-F (TBL LEN)
	 <COND (<IN? ,PROTAGONIST ,LEFT-BOOTH>
		,LEFT-BOOTH)
	       (<IN? ,PROTAGONIST ,RIGHT-BOOTH>
		,RIGHT-BOOTH)
	       (T
		<RFALSE>)>>

<ROUTINE BOOTH-F ("OPTIONAL" (VARG <>))
	 <COND (<AND .VARG
		     <NOT <EQUAL? .VARG ,M-ENTER>>>
		<RFALSE>)
	       (.VARG
		<COND (<FSET? ,PRSO ,TOUCHBIT>
		       <RFALSE>)
		      (T
		       <TELL " ">
		       <PERFORM ,V?EXAMINE ,PRSO>
		       <RTRUE>)>)
	       (<VERB? EXAMINE>
		<TELL
"The only feature of the booth is an ominous black button." CR>)>>

<OBJECT LEFT-BOOTH-BUTTON
	(LOC LEFT-BOOTH)
	(DESC "ominous black button")
	(SYNONYM BUTTON)
	(ADJECTIVE OMINOUS BLACK)
	(FLAGS NDESCBIT)
	(GENERIC GENERIC-BUTTON-F)
	(ACTION BOOTH-BUTTON-F)>

<OBJECT RIGHT-BOOTH-BUTTON
	(LOC RIGHT-BOOTH)
	(DESC "ominous black button")
	(SYNONYM BUTTON)
	(ADJECTIVE OMINOUS BLACK)
	(GENERIC GENERIC-BUTTON-F)
	(FLAGS NDESCBIT)
	(ACTION BOOTH-BUTTON-F)>

<ROUTINE GENERIC-BUTTON-F (TBL LEN)
	 <COND (<IN? ,PROTAGONIST ,RIGHT-BOOTH>
		,RIGHT-BOOTH-BUTTON)
	       (<IN? ,PROTAGONIST ,LEFT-BOOTH>
		,LEFT-BOOTH-BUTTON)
	       (T
		<TELL ,YOU-CANT-SEE-ANY "button here.]" CR>
		,ROOMS)>>

<GLOBAL TURNED-INTO <>>

<ROUTINE BOOTH-BUTTON-F ("AUX" OTHER-BOOTH THE-FLY)
	<COND (<VERB? PUSH>
	       <COND (,ALLIGATOR
		      <TELL "Impossible, in your current state." CR>
		      <RTRUE>)>
	       <REMOVE ,LEFT-BOOTH-BUTTON>
	       <REMOVE ,RIGHT-BOOTH-BUTTON>
	       <SET OTHER-BOOTH <COND (<IN? ,PROTAGONIST ,RIGHT-BOOTH>
				       ,LEFT-BOOTH)
				      (T
				       ,RIGHT-BOOTH)>>
	       <SET THE-FLY <FIRST? .OTHER-BOOTH>>
	       <COND (<OR <NOT .THE-FLY> ;"other booth is empty"
			  <NEXT? .THE-FLY>> ;"two things in other booth"
		      <TELL ,NOTHING-HAPPENS>)
		     (T
		      <QUEUE I-UNTURN 5>
		      <SETG TURNED-INTO .THE-FLY>
		      <DEQUEUE I-UNALLIGATOR>
		      <TELL "You turn into" A .THE-FLY>
		      <COND (<AND <EQUAL? .THE-FLY ,WORM>
				  <VISIBLE? ,ROOSTER>
				  <FSET? ,ROOSTER ,ANIMATEDBIT>>
			     <JIGS-UP
". The rooster happily nibbles you up for a snack.">)
			    (<AND <EQUAL? .THE-FLY ,ROOSTER>
				  <VISIBLE? ,FOX>
				  <FSET? ,FOX ,ANIMATEDBIT>>
			     <JIGS-UP
". The fox is only too glad to make you its dinner.">)
			    (<FIRST? ,PROTAGONIST>
			     <TELL ", dropping your possessions.">
			     <ROB ,PROTAGONIST <LOC ,PROTAGONIST>>)
			    (T
			     <TELL ".">)>
		      <CRLF>)> 
	       <MOVE ,LEFT-BOOTH-BUTTON ,LEFT-BOOTH>
	       <MOVE ,RIGHT-BOOTH-BUTTON ,RIGHT-BOOTH>)>>

<ROUTINE I-UNTURN ()
	 <TELL
"   Waves of relief. You're no longer" AR ,TURNED-INTO>
	 <SETG TURNED-INTO <>>
	 <RTRUE>>

<ROUTINE TO-SPEAK-OF (STRING)
	 <TELL "Ummm..." A ,TURNED-INTO " has no " .STRING " to speak of." CR>>

<ROUTINE GOOD-MEAL (OBJ)
	 <REMOVE .OBJ>
	 <TELL "Yum!">
	 <COND (<G? ,HUNGER-COUNT 0>
		<TELL " Your hunger fades." CR>
		<DEQUEUE I-HUNGER>
		<SETG HUNGER-COUNT 0>
		<INC-SCORE 20>)
	       (T
		<CRLF>)>>

<ROOM KENNELS
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Kennels")
      (LDESC
"This was once where the royal bloodhounds lived. Considering the size
of the leash and collar fragments scattered around, the royal bloodhounds
were BIG. Passages lead east and north.")
      (NORTH TO LOWER-HALL)
      (EAST TO ROYAL-ZOO)
      (FLAGS RLANDBIT)
      (SYNONYM KENNEL KENNELS)
      (MAP-LOC <PTABLE LOWER-LEVEL-MAP-NUM MAP-GEN-Y-6 MAP-GEN-X-6>)
      (ICON KENNELS-ICON)>

<OBJECT TOBOGGAN
	(LOC KENNELS)
	(DESC "toboggan")
	(SYNONYM TOBOGGAN SLED INSCRIPTION)
	(FLAGS TAKEBIT READBIT VEHBIT CONTBIT OPENBIT SEARCHBIT SURFACEBIT)
	(CAPACITY 30)
	(SIZE 20)
	(ACTION TOBOGGAN-F)
	(TEXT "\"Made by the Frobozz Magic Toboggan Company.\"")>

<ROUTINE TOBOGGAN-F ("OPTIONAL" VARG)
	 <COND (.VARG
		<RFALSE>)
	       (<VERB? EXAMINE>
		<COND (<NOUN-USED? ,TOBOGGAN ,W?INSCRIPTION>
		       <PERFORM ,V?READ ,TOBOGGAN>
		       <RTRUE>)
		      (T
		       <TELL
"This one-person sled bears a small inscription. ">
		       <RFALSE> ;"there's no one one the toboggan, etc.")>)
	       (<AND <VERB? ENTER>
		     <EQUAL? ,HERE ,GLACIER>>
		<MOVE ,TOBOGGAN ,MIRROR-LAKE>
		<COND (<NOT ,ENCHANTED-ORB>
		       <SETG ENCHANTED-ORB <COND (<PROB 25> ,MILKY-ORB)
						 (<PROB 33> ,SMOKY-ORB)
						 (<PROB 50> ,FIERY-ORB)
						 (T ,GLITTERY-ORB)>>)>
		<TELL
"As you sit on the toboggan, it begins to slide down the mountain, gathering
speed as it goes. The passing landscape begins to blur, and then even the blur
is gone as the icy wind forces your eyes shut. Suddenly, with a jolt like a
mighty hand grabbing you, you are still! You open your eyes" ,ELLIPSIS>
		<GOTO ,TOBOGGAN>)>>

<ROOM ROYAL-ZOO
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Royal Zoo")
      (LDESC
"Dimwit loved zoos, because he loved imprisonment of any kind -- if the
dungeons were full of prisoners he could at least get some joy from
throwing a couple of minxes behind bars. This zoo, with 69,105 cages,
is easily the largest in Quendor. There are passages to the west and
northwest, and a wide tunnel leads east.")
      (NW TO LOWER-HALL)
      (WEST TO KENNELS)
      (EAST TO WEST-SHORE)
      (FLAGS RLANDBIT)
      (SYNONYM ZOO)
      (ADJECTIVE ROYAL)
      (MAP-LOC <PTABLE LOWER-LEVEL-MAP-NUM MAP-GEN-Y-6 MAP-GEN-X-7>)
      (ICON ROYAL-ZOO-ICON)>

<OBJECT CAGE
	(LOC ROYAL-ZOO)
	(DESC "cage")
	(FDESC
"The zoo has been extensively looted; only one of the many nearby cages
still seems to be occupied.")
	(SYNONYM CAGE)
	(FLAGS CONTBIT SEARCHBIT TRANSBIT)
	(ACTION CAGE-F)>

<ROUTINE CAGE-F ()
	 <COND (<VERB? OPEN>
		<COND (<AND <IN? ,SNAKE ,CAGE>
			    <FSET? ,SNAKE ,ANIMATEDBIT>>
		       <JIGS-UP
"As you open the door, the snake, with blurring speed, strikes at your hand.
Tendrils of poison reach through your veins and grab your heart...">)
		      (T
		       <FSET ,CAGE ,TOUCHBIT>
		       <RFALSE>)>)
	       (<VERB? ENTER>
		<TELL "The cage is too small for a human." CR>)>>

<OBJECT SNAKE
	(LOC CAGE)
	(DESC "snake")
	(SYNONYM SNAKE ROPE)
	(FLAGS TAKEBIT ANIMATEDBIT)
	(INANIMATE-DESC "rope")
	(WAND-TEXT
"The snake shivers and shimmers and is then still. Too still. You approach,
tentatively at first, then with more conviction. The snake is gone, replaced
by (or turned into!) a good, heavy rope.")
	(ANIMATE-ROUTINE I-ROPE-TO-SNAKE)
	(ACTION SNAKE-F)>

<ROUTINE SNAKE-F ()
	 <COND (<AND <VERB? RESEARCH>
		     <NOUN-USED? ,SNAKE ,W?SNAKE>>
		<TELL "\"A common animal, best kept caged.\"" CR>)
	       (<FSET? ,SNAKE ,ANIMATEDBIT>
		<COND (<VERB? LET-OUT>
		       <PERFORM ,V?OPEN ,CAGE>
		       <RTRUE>)
		      (<VERB? EXAMINE MEASURE>
		       <TELL
"The snake is thin and perhaps as much as twenty feet long." CR>)>)
	       ;"clause from here on down are for the rope"
	       (<AND <VERB? TIE>
		     <PRSO? ,SNAKE>>
		<COND (<PRSI? ,SPIRE>
		       <SETG ROPE-PLACED T>
		       <MOVE ,SNAKE ,HERE>
		       <TELL
"You tie the rope to the spire, dropping the other end down the cliff face.
It reaches most of the way toward the lower ledge." CR>)
		      (T
		       <TELL ,YOU-CANT "tie the rope to" TR ,PRSI>)>)
	       (<AND <VERB? CLIMB-DOWN>
		     ,ROPE-PLACED>
		<DO-WALK ,P?DOWN>)
	       (<VERB? EXAMINE MEASURE>
		<TELL "The rope is about twenty feet long." CR>)>>

<ROUTINE I-ROPE-TO-SNAKE ("AUX" (TOLD <>))
	 <FSET ,SNAKE ,ANIMATEDBIT>
	 <COND (<VISIBLE? ,SNAKE>
	 	<SET TOLD T>
		<TELL
"   The rope ripples with increasing force. It has returned to the form of
a snake! The snake squirms with anger">
	 	<COND (<AND <EQUAL? ,HERE ,UPPER-LEDGE>
			    ,ROPE-PLACED>
		       <TELL
", uncurls from the spire, and drops out of sight!" CR>)
		      (<AND <IN? ,SNAKE ,CAGE>
			    <NOT <FSET? ,CAGE ,OPENBIT>>>
		       <TELL ,PERIOD-CR>)
	       	      (<AND <ULTIMATELY-IN? ,SNAKE>
			    <NOT <IN? ,SNAKE ,WALDO>>>
		       <JIGS-UP " and bites you viciously on the wrist.">)
		      (T
		       <COND (<FSET? <LOC ,SNAKE> ,ACTORBIT>
			      <TELL
", nearly bites" T <LOC ,SNAKE> " on the wrist, drops to the ground,">)>
		       <TELL " and wriggles quickly out of sight." CR>)>)
	       (<AND <EQUAL? ,HERE ,LOWER-LEDGE>
		     ,ROPE-PLACED>
		<SET TOLD T>
		<TELL
"   A writhing snake drops from above! It strikes out at you but, fortunately,
misses. Hissing angrily, it disappears into a narrow crack." CR>)>
	 <SETG ROPE-PLACED <>>
	 <COND (<OR <NOT <IN? ,SNAKE ,CAGE>>
		    <FSET? ,CAGE ,OPENBIT>>
		<REMOVE ,SNAKE>)>
	 <COND (.TOLD
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROOM LOWEST-HALL
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Lowest Hall")
      (LDESC
"You get the feeling that no ray of light has touched these walls in ages.
Few have even ventured down here since the curse was laid upon the castle
those many years ago. A decrepit stair leads upward, and there's an opening
to the north. The bottom of a steep, gravelly passage is visible to the
east. To the south is the most massively reinforced door you've ever seen.
A rickety ladder can take you down to even lower domains.")
      (NORTH TO PASSAGE-STORAGE-ROOM)
      (SOUTH TO VAULT IF VAULT-DOOR IS OPEN)
      (EAST SORRY "You can't get a footing on the steep, gravelly passage.")
      (UP TO LOWER-HALL)
      (FLAGS RLANDBIT)
      (DOWN TO PITS)
      (GLOBAL VAULT VAULT-DOOR LOCK-OBJECT FIXED-LADDER STAIRS)
      (MAP-LOC <PTABLE LOWER-LEVEL-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-4>)>

<OBJECT VAULT-DOOR
	(LOC LOCAL-GLOBALS)
	(DESC "vault door")
	(SYNONYM DOOR)
	(ADJECTIVE VAULT)
	(FLAGS DOORBIT LOCKEDBIT)
	(ACTION VAULT-DOOR-F)>

<ROUTINE VAULT-DOOR-F ()
	 <COND (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,LOWEST-HALL>>
		<TELL "A large dial is set into the center of the door. ">
		<RFALSE>)
	       (<AND <VERB? LOCK>
		     <NOT <FSET? ,VAULT-DOOR ,LOCKEDBIT>>>
		<TELL
"Only the castle quartermaster possesses the skill required -- and he's
probably in Borphee by now." CR>)
	       (<AND <VERB? UNLOCK>
		     <FSET? ,PRSI ,KEYBIT>>
		<TELL "This is a combination lock, not a key lock." CR>)>>

<OBJECT DIAL
	(LOC LOWEST-HALL)
	(DESC "dial")
	(SYNONYM DIAL)
	(ADJECTIVE LARGE)
	(FLAGS NDESCBIT)
	(ACTION DIAL-F)>

<GLOBAL DIAL-NUMBER 0>

<ROUTINE DIAL-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The dial is currently turned to " N ,DIAL-NUMBER ". It can be set to any
number between 1 and 2570." CR>)
	       (<AND <VERB? SET-DIR>
		     <PRSI? ,LEFT-RIGHT>>
		<PERFORM ,V?SET ,DIAL>
		<RTRUE>)
	       (<VERB? SET>
		<COND (<NOT ,PRSI>
		       <TELL
"[You must say what number to turn the dial to, as in TURN DIAL TO 920.]" CR>)
		      (<NOT <PRSI? ,INTNUM>>
		       <IMPOSSIBLES>)
		      (<OR <G? ,P-NUMBER 2570>
			   <L? ,P-NUMBER 1>>
		       <TELL "That's not one of the numbers on the dial." CR>)
		      (<EQUAL? ,DIAL-NUMBER ,P-NUMBER>
		       <TELL
"The dial is already set to " N ,P-NUMBER ,PERIOD-CR>)
		      (<AND <NOT <FSET? ,VAULT-DOOR ,OPENBIT>>
			    <NOT <FSET? ,VAULT-DOOR ,LOCKEDBIT>>>
		       <SETG DIAL-NUMBER ,P-NUMBER>
		       <FSET ,VAULT-DOOR ,LOCKEDBIT>
		       <TELL
"The tumblers tumble as the vault door re-locks." CR>)
		      (<AND <FSET? ,GLOVE ,WORNBIT>
			    <FSET? ,VAULT-DOOR ,LOCKEDBIT>>
		       <SETG DIAL-NUMBER <RANDOM 2570>>
		       <FCLEAR ,VAULT-DOOR ,LOCKEDBIT>
		       <TELL
"As you turn the dial with your gloved hand, you can almost feel the tumblers
turning as though they were an extension of your own fingers! Fascinated, you
keep spinning, and as you pass " N ,DIAL-NUMBER ", you feel a sense of tactile
perfection, and stop. A faint click ripples up your arm." CR>) 
		      (T
		       <SETG DIAL-NUMBER ,P-NUMBER>
		       <TELL
"The dial is now set to " N ,DIAL-NUMBER ,PERIOD-CR>)>)>>

<ROOM VAULT
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Vault")
      (LDESC
"This was just the vault where Dimwit stored his trifles; his valuables
were stored in a hidden vault buried seven miles under the Flathead
Mountains, accessible only by a chain of sixty-three secret teleportation
spells. The only exit is north.")
      (NORTH TO LOWEST-HALL IF VAULT-DOOR IS OPEN)
      (OUT TO LOWEST-HALL IF VAULT-DOOR IS OPEN)
      (FLAGS RLANDBIT)
      (GLOBAL VAULT-DOOR)
      (SYNONYM VAULT)
      (MAP-LOC <PTABLE LOWER-LEVEL-MAP-NUM MAP-GEN-Y-6 MAP-GEN-X-4>)
      (ICON VAULT-ICON)>

<OBJECT STOCK-CERTIFICATE
	(LOC VAULT)
	(DESC "stock certificate")
	(SYNONYM CERTIFICATE STOCK)
	(ADJECTIVE STOCK RARE)
	(FLAGS TAKEBIT BURNBIT READBIT MAGICBIT)
	(VALUE 12)
	(SIZE 2)
	(TEXT
"The certificate reads \"FrobozzCo International -- 923,130,877 shares.\"")>

<ROOM PASSAGE-STORAGE-ROOM
	(LOC ROOMS)
        (REGION "Flatheadia")
	(DESC "Passage Storage Room")
	(LDESC
"This is a tremendous warehouse where passageways and tunnels would be stored
before being installed as part of the Great Underground Empire. The only exit
is south.")
	(SOUTH TO LOWEST-HALL)
	(OUT TO LOWEST-HALL)
	(FLAGS RLANDBIT)
	(MAP-LOC <PTABLE LOWER-LEVEL-MAP-NUM MAP-GEN-Y-4 MAP-GEN-X-4>)
	(ICON PASSAGE-STORAGE-ICON)>

<OBJECT NW-SE-PASSAGE
	(LOC PASSAGE-STORAGE-ROOM)
	(DESC "northwest-southeast passage")
	(SYNONYM PASSAGE PASSAGEWAY)
	(ADJECTIVE MAGIC NW ;NORTHWEST NW-SE SLIGHTLY IRREGULAR)
	(FLAGS TAKEBIT TRYTAKEBIT)
	(DESCFCN NW-SE-PASSAGE-F)
	(SIZE 25)
	(ACTION PASSAGE-F)>

<ROUTINE NW-SE-PASSAGE-F (OARG)
	 <COND (<EQUAL? .OARG ,M-OBJDESC?>
		<RTRUE>)>
	 <TELL "   ">
	 <DESCRIBE-PASSAGE ,NW-SE-PASSAGE>>

<OBJECT N-S-PASSAGE
	(LOC PASSAGE-STORAGE-ROOM)
	(DESC "north-south passage")
	(SYNONYM PASSAGE PASSAGEWAY)
	(ADJECTIVE MAGIC NORTH-SOUTH N-S SLIGHTLY DAMAGED)
	(FLAGS TAKEBIT TRYTAKEBIT)
	(DESCFCN N-S-PASSAGE-F)
	(SIZE 25)
	(ACTION PASSAGE-F)>

<ROUTINE N-S-PASSAGE-F (OARG)
	 <COND (<EQUAL? .OARG ,M-OBJDESC?>
		<RTRUE>)>
	 <TELL "   ">
	 <DESCRIBE-PASSAGE ,N-S-PASSAGE>>

<ROUTINE PASSAGE-F ()
	 <COND (<AND <VERB? TAKE>
		     <FSET? ,PRSO ,TRYTAKEBIT>>
		<MOVE ,PRSO ,PROTAGONIST>
		<MOVE ,NOTICE ,HERE>
		<FCLEAR ,N-S-PASSAGE ,TRYTAKEBIT>
		<FCLEAR ,NW-SE-PASSAGE ,TRYTAKEBIT>
		<FSET ,PRSO ,TOUCHBIT>
		<TELL
"As you take" T ,PRSO ", a notice flutters to the ground." CR>)
	       (<VERB? EXAMINE>
		<COND (<FSET? ,PRSO ,TAKEBIT>
		       <TELL
"The passage is made out of the same material as donut holes.
Once installed, it should be wide enough to walk through, and
it's probably about a hundredth of a bloit long." CR>)
		      (T
		       <DESCRIBE-PASSAGE ,PRSO>
		       <CRLF>)>)
	       (<VERB? ENTER>
		<COND (<FSET? ,PRSO ,TAKEBIT>
		       <TELL "The passage hasn't been installed yet!" CR>)
		      (<PRSO? ,N-S-PASSAGE>
		       <DO-WALK ,N-S-PASSAGE-DIR>)
		      (T
		       <DO-WALK ,NW-SE-PASSAGE-DIR>)>)>>

<ROUTINE DESCRIBE-PASSAGE (PASSAGE)
	 <COND (<NOT <FSET? .PASSAGE ,TOUCHBIT>>
		<COND (<EQUAL? .PASSAGE ,N-S-PASSAGE>
		       <TELL
"Discarded in the corner is a north-south passage, slightly
damaged but perfectly usable.">)
		      (T
		       <TELL
"A northwest-southeast passage is lying here. It is marked as being
slightly irregular, but nobody other than one of the bureaucratic
Passage Inspectors would ever notice.">)>)
	       (<FSET? .PASSAGE ,TAKEBIT>
		<TELL
"A magic " D .PASSAGE " is just lying around in the middle
of the room, uninstalled.">)
	       (T
		<TELL "A magic " D .PASSAGE " has been installed in the ">
		<COND (<EQUAL? .PASSAGE ,N-S-PASSAGE>
		       <COND (<EQUAL? ,HERE ,CONSTRUCTION>
			      <COND (<EQUAL? <GET ,NORTH-EXITS 0>
					     <+ ,CONSTRUCTION-LOC 100>>
				     <TELL "north">)
				    (T
				     <TELL "south">)>)
			     (<EQUAL? ,N-S-PASSAGE-DIR ,P?NORTH>
			      <TELL "north">)
			     (T
			      <TELL "south">)>)
		      (T
		       <COND (<EQUAL? ,HERE ,CONSTRUCTION>
			      <COND (<EQUAL? <GET ,SE-EXITS 0>
					     <+ ,CONSTRUCTION-LOC 100>>
				     <TELL "southeast">)
				    (T
				     <TELL "northwest">)>)
			     (<EQUAL? ,NW-SE-PASSAGE-DIR ,P?NW>
			      <TELL "northwest">)
			     (T
			      <TELL "southeast">)>)>
		<TELL " wall.">)>>

<GLOBAL N-S-PASSAGE-DIR <>>

<GLOBAL NW-SE-PASSAGE-DIR <>>

<GLOBAL N-S-PASSAGE-LOC <>>

<GLOBAL NW-SE-PASSAGE-LOC <>>

<OBJECT NOTICE
	(DESC "notice")
	(SYNONYM NOTICE)
	(FLAGS TAKEBIT BURNBIT READBIT)
	(SIZE 2)
	(TEXT
"\"Hello, Builder!|
   Your Magic Passage should last you for many useful years. To install,
simply INSTALL THE PASSAGE IN THE _____ WALL. Remember, your Magic Passage,
once installed, is not removable! Please contact your dealer with any
questions or problems!|
   Another fine product of the Frobozz Magic Passage Company.\"")>

<ROOM PITS
      (LOC ROOMS)
      (DESC "Pits")
      (REGION "Flatheadia")
      (UP TO LOWEST-HALL)
      (DOWN PER BOTTOMLESS-PIT-ENTER-F)
      (FLAGS RLANDBIT UNDERGROUNDBIT)
      (GLOBAL FIXED-LADDER PITS-OBJECT)
      (MAP-LOC <PTABLE LOWER-LEVEL-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-3>)
      (ACTION PITS-F)>

<ROUTINE PITS-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This cavern, deep in the bowels of the Great Underground Empire, ">
		<DESCRIBE-PITS-FLOOR>
		<TELL ". A rickety ladder leads upward.">)>>

<ROUTINE DESCRIBE-PITS-FLOOR ()
	 <COND (<FSET? ,LANTERN ,TRYTAKEBIT>
		<TELL
"is spotted with an incredible quantity of pits. Judging from the closest of
them, the pits are bottomless">)
	       (T
		<TELL
"has a large number of bottomless pits, all of which have been filled in">
		<COND (<FSET? ,HERE ,TOUCHBIT>
		       <TELL ", except one.">)
		      (T
		       <TELL
" -- no, wait! It seems that one pit did not become filled in!">)>
		<TELL
" The open pit seems to have handholds leading downward">)>>

<ROUTINE BOTTOMLESS-PIT-ENTER-F ()
	 <COND (<FSET? ,LANTERN ,TRYTAKEBIT>
		<TELL "Entering a bottomless pit means certain death!" CR>
		<RFALSE>)
	       (T
		,LEDGE-IN-BOTTOMLESS-PIT)>>

<OBJECT PITS-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "bottomless pit")
	(SYNONYM PIT PITS)
	(ADJECTIVE BOTTOMLESS)
	(ACTION PITS-OBJECT-F)>

<ROUTINE PITS-OBJECT-F ()
	 <COND (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,PITS>>
		<TELL "The floor ">
		<DESCRIBE-PITS-FLOOR>
		<TELL ,PERIOD-CR>)
	       (<VERB? EXAMINE LOOK-INSIDE>
		<TELL "The pit looks bottomless." CR>)
	       (<AND <VERB? THROW PUT>
		     <EQUAL? ,P-PRSA-WORD ,W?THROW ,W?HURL ,W?TOSS ,W?CAST>
		     <PRSO? ,PIT-BOMB>>
		<RFALSE>) ;"handled by PIT-BOMB-F"
	       (<AND <VERB? THROW PUT>
		     <PRSI? ,PITS-OBJECT>>
		<REMOVE ,PRSO>
		<COND (<OR <PRSO? ,PERCH>
			   <ULTIMATELY-IN? ,PERCH ,PRSO>>
		       <SETG REMOVED-PERCH-LOC ,BROGMOID>)>
		<TELL
"Bottomless or not, the pit swallows"  T ,PRSO " forever." CR>)
	       (<OR <VERB? LEAP>
		    <AND <VERB? ENTER>
			 <EQUAL? ,P-PRSA-WORD ,W?JUMP ,W?LEAP>>>
		<JIGS-UP
"As you plunge down the bottomless pit, you smash against the irregular walls.
The result isn't...shall we say...pretty.">)
	       (<VERB? ENTER>
		<DO-WALK ,P?DOWN>)>>

<OBJECT LANTERN
	(LOC PITS)
	(DESC "brass lantern")
	(FDESC
"At the far end of the cavern sits an ancient battery-powered brass
lantern.")
	(SYNONYM LAMP LANTERN LIGHT MONOGRAM)
	(ADJECTIVE ANCIENT BRASS BATTERY-POWERED)
	(FLAGS TRYTAKEBIT TAKEBIT LIGHTBIT MAGICBIT READBIT)
	(SIZE 15)
	(VALUE 0) ;"12 points given elsewhere"
	(TEXT "You can barely read the worn letters: \"T. A. F.\"")
	(ACTION LANTERN-F)>

<ROUTINE LANTERN-F ()
	 <COND (<VERB? EXAMINE>
		<COND (<FSET? ,LANTERN ,TRYTAKEBIT>
		       <TELL "You can't see much from this distance." CR>)
		      (<NOUN-USED? ,LANTERN ,W?MONOGRAM>
		       <PERFORM ,V?READ ,LANTERN>
		       <RTRUE>)
		      (<NOT <FSET? ,LANTERN ,LIGHTBIT>>
		       <TELL "The lamp is either broken or burned out." CR>)
		      (T
		       <TELL
"There seems to be a faint monogram engraved on it. ">
		       <RFALSE>)>)
	       (<AND <VERB? READ>
		     <FSET? ,LANTERN ,TRYTAKEBIT>>
		<PERFORM ,V?EXAMINE ,LANTERN>
		<RTRUE>)
	       (<AND <VERB? TAKE WALK-TO>
		     <FSET? ,LANTERN ,TRYTAKEBIT>>
		<TELL
"The pits make the cavern uncrossable; ergo, you can't reach the lantern." CR>)
	       (<AND <VERB? THROW THROW-TO>
		     <PRSI? ,LANTERN>
		     <FSET? ,LANTERN ,TRYTAKEBIT>>
		<REMOVE ,PRSO>
		<COND (<OR <PRSO? ,PERCH>
			   <ULTIMATELY-IN? ,PERCH ,PRSO>>
		       <SETG REMOVED-PERCH-LOC ,BROGMOID>)>
		<TELL
"Sigh. Your throw is just short of the lamp, and" T ,PRSO " disappears into
one of the pits." CR>)
	       (<AND <VERB? THROW>
		     <PRSO? ,LANTERN>>
		<DEQUEUE I-LANTERN>
		<FCLEAR ,LANTERN ,ONBIT>
		<FCLEAR ,LANTERN ,LIGHTBIT>
		<TELL "The lamp smashes into the floor, breaking it." CR>
		<NOW-DARK?>)
	       (<VERB? ON>
		<COND (<FSET? ,LANTERN ,LIGHTBIT>
		       <QUEUE I-LANTERN -1>
		       <RFALSE>)
		      (T
		       <TELL "The lamp refuses to light." CR>)>)>>

<GLOBAL LANTERN-COUNTER 500>

<ROUTINE I-LANTERN ()
	 <COND (<NOT <FSET? ,LANTERN ,ONBIT>>
		<DEQUEUE I-LANTERN>
		<RFALSE>)>
	 <SETG LANTERN-COUNTER <- ,LANTERN-COUNTER 1>>
	 <COND (<EQUAL? ,LANTERN-COUNTER 0>
		<FCLEAR ,LANTERN ,ONBIT>
		<FCLEAR ,LANTERN ,LIGHTBIT>)>
	 <COND (<VISIBLE? ,LANTERN>
		<COND (<EQUAL? ,LANTERN-COUNTER 200 100 50 0>
		       <TELL "   The lamp ">
		       <COND (<EQUAL? ,LANTERN-COUNTER 200>
			      <TELL "appears a bit dimmer">)
			     (<EQUAL? ,LANTERN-COUNTER 100>
			      <TELL "is definitely dimmer now">)
			     (<EQUAL? ,LANTERN-COUNTER 50>
			      <TELL "is nearly out">)
			     (T
		       	      <TELL
"You'd better have more light than from the " D ,LANTERN>)>
		       <TELL ,PERIOD-CR>
		       <NOW-DARK?>)>)>
	 <RFALSE>>

<ROOM LEDGE-IN-BOTTOMLESS-PIT
      (LOC ROOMS)
      (DESC "Ledge in Bottomless Pit")
      (REGION "Region:  Unknown")
      (LDESC
"This is a wide, irregular ledge, far below the lip of the pit. The ledge
is strewn with the bones of creatures (including a few luckless humans)
who fell into the pit and landed here, to be devoured by grues. Rough
handholds, possibly natural, lead upward and downward.")
      (UP TO PITS)
      (DOWN TO MOUTH-OF-CAVE)
      (FLAGS RLANDBIT UNDERGROUNDBIT)
      (GLOBAL BONES PITS-OBJECT)
      (MAP-LOC <PTABLE LOWER-LEVEL-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-2>)
      (ICON LEDGE-IN-PIT-ICON)
      (THINGS WIDE LEDGE LEDGE-IN-PIT-PSEUDO)>

<ROUTINE LEDGE-IN-PIT-PSEUDO ()
	 <COND (<VERB? EXIT>
		<V-WALK-AROUND>)>>

<ROOM MOUTH-OF-CAVE
      (LOC ROOMS)
      (DESC "Mouth of Cave")
      (REGION "Region:  Unknown")
      (LDESC
"A narrow, slimy cave connects here with the bottomless pit, leading
roughly northeast. The handholds in the rock walls of the pit, which have
been fairly dependable down to here, seem to peter out just below you.")
      (UP TO LEDGE-IN-BOTTOMLESS-PIT)
      (DOWN SORRY "There are no more handholds!")
      (NE TO SLOPING-CAVE)
      (FLAGS RLANDBIT UNDERGROUNDBIT)
      (GLOBAL PITS-OBJECT)
      (MAP-LOC <PTABLE LOWER-LEVEL-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-1>)
      (ICON MOUTH-OF-CAVE-ICON)>

<ROOM SLOPING-CAVE
      (LOC ROOMS)
      (DESC "Sloping Cave")
      (REGION "Region:  Unknown")
      (LDESC
"You are in a cramped cave with disgustingly sticky walls which press
in against you. The cave drops sharply to the northeast, and rises
sharply to the southwest.")
      (NE TO TOP-OF-WELL)
      (DOWN TO TOP-OF-WELL)
      (SW TO MOUTH-OF-CAVE)
      (UP TO MOUTH-OF-CAVE)
      (FLAGS RLANDBIT UNDERGROUNDBIT)
      (MAP-LOC <PTABLE LOWER-LEVEL-MAP-NUM MAP-GEN-Y-4 MAP-GEN-X-2>)>

<ROOM TOP-OF-WELL
      (LOC ROOMS)
      (DESC "Top of Well")
      (REGION "Region:  Unknown")
      (LDESC
"The cave ends here at the opening of a natural well. The walls of the
well look irregular enough to climb down. The sensation of being deep
within the bowels of the earth is overpowering here; you feel as though
you are further down than anyone has ever been before.")
      (SW TO SLOPING-CAVE)
      (UP TO SLOPING-CAVE)
      (DOWN TO UNDER-THE-WORLD)
      (FLAGS RLANDBIT UNDERGROUNDBIT)
      (MAP-LOC <PTABLE LOWER-LEVEL-MAP-NUM MAP-GEN-Y-3 MAP-GEN-X-3>)>

<ROOM UNDER-THE-WORLD
      (LOC ROOMS)
      (DESC "Under the World")
      (REGION "Region:  Unknown")
      (LDESC
"This is surely the most incredible sight that any pair of eyes has ever
gazed upon: You have reached the underside of the world, which hangs above
you, an enormous slab of dirt and rock which stretches as far as you can see
in all directions! A glowing white haze stretches below you.|
   To the west, you can see the head and shoulders of a muscular brogmoid;
the rest of his body seems to be lost in the haze. As your mind adjusts to the
scale of this place, you realize that the brogmoid is tremendous beyond
description, and that he is holding the world upon his shoulder and upper
back.|
   Thanks to some hardy roots which hang below the world, it looks like you
could swing over to the shoulder of the brogmoid. Above you, a hole leads
up into the world.")
      (UP TO TOP-OF-WELL)
      (DOWN SORRY "There's nothing there -- literally.")
      (WEST TO HANGING-FROM-ROOTS)
      (FLAGS RLANDBIT ONBIT OUTSIDEBIT)
      (GLOBAL BROGMOID)
      (MAP-LOC <PTABLE LOWER-LEVEL-MAP-NUM MAP-GEN-Y-2 MAP-GEN-X-3>)
      (ACTION UNDER-THE-WORLD-F)>

<ROUTINE UNDER-THE-WORLD-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<COND (,ALLIGATOR
		       <JIGS-UP
"The well opens into a vast nothingness. You grab at a few protruding
roots, but being currently equipped with paws instead of hands, you
fail. You plunge into an abyss.">)
		      (<NOT <FSET? ,UNDER-THE-WORLD ,TOUCHBIT>>
		       <TELL
"The well suddenly opens onto a vast abyss! You grab onto a few protruding
roots, preventing a terrible fall..." CR CR>)>)>>

<ROOM HANGING-FROM-ROOTS
      (LOC ROOMS)
      (DESC "Hanging From Roots")
      (REGION "Region:  Unknown")
      (LDESC
"You are clutching some hardy tree roots, between a seemingly infinite plane
of earth above you, and a seemingly infinite haze below. To the east, a tiny
black spot indicates the opening of a well leading upward. To the west, part
of the shoulder, neck, and ear of an incredibly gigantic brogmoid fills your
view.")
      (UP SORRY "The world is in the way.")
      (DOWN SORRY "There's nothing there -- literally.")
      (WEST TO SHOULDER)
      (EAST TO UNDER-THE-WORLD)
      (FLAGS RLANDBIT ONBIT OUTSIDEBIT)
      (GLOBAL BROGMOID)
      (MAP-LOC <PTABLE LOWER-LEVEL-MAP-NUM MAP-GEN-Y-2 MAP-GEN-X-2>)
      (ICON ROOTS-ICON)>

<ROOM SHOULDER
      (LOC ROOMS)
      (DESC "Shoulder")
      (REGION "Region:  Unknown")
      (LDESC
"You have landed on a shoulder of mind-numbing dimension. The hairs of the
shoulder are like mighty trees, the pores like deep craters. Thanks to the
thickness of the hair/trees, you could probably climb up the neck to the
ear which looms above you. A series of underhanging roots make it possible
to swing off to the east.")
      (EAST TO HANGING-FROM-ROOTS)
      (UP TO EAR)
      (FLAGS RLANDBIT ONBIT OUTSIDEBIT)
      (GLOBAL BROGMOID)
      (MAP-LOC <PTABLE LOWER-LEVEL-MAP-NUM MAP-GEN-Y-2 MAP-GEN-X-1>)>

<ROOM EAR
      (LOC ROOMS)
      (DESC "Ear")
      (REGION "Region:  Unknown")
      (IN TO INNER-EAR IF EAR-PASSAGE-OPEN ELSE
       "The mound of ear fungus blocks entry into the ear.")
      (DOWN TO SHOULDER)
      (FLAGS RLANDBIT ONBIT OUTSIDEBIT)
      (GLOBAL BROGMOID)
      (MAP-LOC <PTABLE LOWER-LEVEL-MAP-NUM MAP-GEN-Y-1 MAP-GEN-X-1>)
      (ICON EAR-ICON)
      (ACTION EAR-F)>

<ROUTINE EAR-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are sitting in one of the folds of a giant ear belonging to the giant
brogmoid who is holding up the world. A wide channel leading deeper into the
ear is blocked by a virtual forest of ear fungus">
		<COND (,EAR-PASSAGE-OPEN
		       <TELL
", except for a small tunnel through the fungus which leads further in">)>
		<TELL ". The only exit is down.">)>>

<GLOBAL EAR-PASSAGE-OPEN <>>

<OBJECT EAR-FUNGUS
	(LOC EAR)
	(DESC "ear fungus")
	(SYNONYM FUNGUS FUNGI)
	(ADJECTIVE EAR)
	(FLAGS VOWELBIT NDESCBIT PLANTBIT)
	(GENERIC GENERIC-FUNGUS-F)
	(ACTION EAR-FUNGUS-F)>

<ROUTINE EAR-FUNGUS-F ("OPTIONAL" (ARG <>))
	 <COND (<EQUAL? .ARG ,M-WINNER>
		<PLANT-STUNNED>)
	       (<VERB? RESEARCH>
		<TELL
"\"A class of saprophytic parasitical plants which lack chlorophyll and are
frequently found in the less hygenic cavities of brogmoids.\"" CR>)
	       (<VERB? MOVE CLEAN PUSH KICK MUNG>
		<TELL "The fungi wall doesn't budge." CR>)
	       (<AND <VERB? LISTEN>
		     ,PLANT-TALKER>
		<COND (<EQUAL? ,FUNGUS-NUMBER 12>
		       <SETG FUNGUS-NUMBER <- <RANDOM 12> 1>>)>
		<TELL
"You hear a vast murmur of fungi, discussing such topics as the woeful lack
of moisture within this ear">
		<COND (<NOT ,EAR-PASSAGE-OPEN>
		       <TELL
". One conversation catches your attention: a family of fungi bewailing their
long lost cousin, " <GET ,FUNGUS-TABLE ,FUNGUS-NUMBER>>)>
		<TELL ,PERIOD-CR>)>>

<ROUTINE GENERIC-FUNGUS-F (STR LEN)
	 <COND (<VERB? RESEARCH>
		,EAR-FUNGUS)>>

<GLOBAL FUNGUS-NUMBER 12>

<CONSTANT FUNGUS-TABLE
	<PTABLE "Seymour"
	       "Sherman"
	       "Irving"
	       "Sammy"
	       "Myron"
	       "Boris"
	       "Melvin"
	       "Lester"
	       "Julius"
	       "Ricardo"
	       "Omar"
	       "Barnaby">>

<CONSTANT FUNGUS-WORDS
	<PTABLE <VOC "SEYMOUR" <>>
	       <VOC "SHERMAN" <>>
	       <VOC "IRVING" <>>
	       <VOC "SAMMY" <>>
	       <VOC "MYRON" <>>
	       <VOC "BORIS" <>>
	       <VOC "MELVIN" <>>
	       <VOC "LESTER" <>>
	       <VOC "JULIUS" <>>
	       <VOC "RICARDO" <>>
	       <VOC "OMAR" <>>
	       <VOC "BARNABY" <>>>>

<OBJECT BROGMOID
	(LOC LOCAL-GLOBALS)
	(DESC "giant brogmoid")
	(SYNONYM BROGMOID BROGMOIDS SHOULDER EAR TOE)
	(ADJECTIVE LARGE)
        (ACTION BROGMOID-F)>

<ROUTINE BROGMOID-F ()
	 <COND (<VERB? ENTER WALK-TO>
		<COND (<EQUAL? ,HERE ,UNDER-THE-WORLD ,HANGING-FROM-ROOTS>
		       <DO-WALK ,P?EAST>)
		      (<EQUAL? ,HERE ,SHOULDER>
		       <DO-WALK ,P?UP>)
		      (T
		       <DO-WALK ,P?IN>)>)
	       (<AND <TOUCHING? ,BROGMOID>
		     <EQUAL? ,HERE ,UNDER-THE-WORLD ,HANGING-FROM-ROOTS>>
		<CANT-REACH ,BROGMOID>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,ON-TOP-OF-THE-WORLD>
		       <TELL
"Most of the brogmoid is lost in the mists which stretch above the world." CR>)
		      (T
		       <TELL
"The brogmoid is fairly ordinary, other than the fact that it's about
a zillion times as large as any brogmoid you've ever seen before." CR>)>)
	       (<AND <VERB? CLEAN>
		     <NOUN-USED? ,BROGMOID ,W?EAR>>
		<PERFORM ,V?CLEAN ,EAR-FUNGUS>
		<RTRUE>)
	       (<AND <VERB? RESEARCH>
		     <NOUN-USED? ,BROGMOID ,W?BROGMOID ,W?BROGMOIDS>>
		<TELL
"\"In rare cases, these squat creatures can achieve the intelligence levels of
a three-year-old human. Domesticated brogmoids are tame and can even be taught
to perform simple tasks. In the wild, they can be seen in huge packs sorting
through rock piles for edible rocks. (See also BROGMOIDISM.)\"" CR>)>>

<ROOM INNER-EAR
      (LOC ROOMS)
      (DESC "Inner Ear")
      (REGION "Region:  Unknown")
      (LDESC
"You have reached the brogmoid's eardrum, which prevents any further travel
inward. A passage through a forest of fungus leads back out.")
      (IN SORRY "The membrane of the eardrum is tougher than most walls.")
      (OUT TO EAR)
      (FLAGS RLANDBIT OUTSIDEBIT)
      (MAP-LOC <PTABLE LOWER-LEVEL-MAP-NUM MAP-GEN-Y-1 EAR-ICON-LOC>)>

<OBJECT EARWAX
	(LOC INNER-EAR)
	(OWNER EARWAX)
	(DESC "hunk of brogmoid ear wax")
	(SYNONYM HUNK WAX EARWAX)
	(ADJECTIVE BROGMOID EAR)
	(FLAGS TAKEBIT)>