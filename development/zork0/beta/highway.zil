"HIGHWAY for

			       ZORK ZERO
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<ROOM G-U-HIGHWAY
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Great Underground Highway")
      (LDESC
"This is the northern terminus of one of the branches of the Great Underground
Highway system, one of the ambitious construction projects conceived by King
Duncanthrax and executed by the Frobozz Magic Cave Company. A tunnel leads
northeast.")
      (NE TO LOWER-HALL)
      (SOUTH TO EXIT)
      (FLAGS RLANDBIT UNDERGROUNDBIT)
      (MAP-LOC <PTABLE LOWER-LEVEL-MAP-NUM MAP-GEN-Y-6 MAP-GEN-X-5>)
      (ICON G-U-HIGHWAY-ICON)>

<ROOM EXIT
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Exit")
      (LDESC
"A wide underground road runs north and south. There's an eye-catching sign
next to a tunnel leading west.")
      (WEST TO FIELD-OFFICE)
      (NORTH TO G-U-HIGHWAY)
      (SOUTH TO CROSSROADS)
      (FLAGS RLANDBIT UNDERGROUNDBIT)
      (GLOBAL SIGN)
      (MAP-LOC <PTABLE LOWER-LEVEL-MAP-NUM MAP-GEN-Y-7 MAP-GEN-X-5>)
      (ICON EXIT-ICON)>

<ROOM CROSSROADS
      (LOC ROOMS)
      (REGION "Somewhere Along the GUH")
      (DESC "Crossroads")
      (LDESC
"You stand at the junction of two underground highways, one north-south
and the other east-west. A sign hangs in the center of the junction.")
      (NORTH TO EXIT)
      (SOUTH TO TOLL-PLAZA)
      (EAST TO CAVE-IN)
      (WEST TO POTHOLES)
      (FLAGS RLANDBIT UNDERGROUNDBIT)
      (GLOBAL SIGN)
      (MAP-LOC <PTABLE PORT-FOOZLE-MAP-NUM MAP-GEN-Y-3 MAP-GEN-X-7>)
      (ICON CROSSROADS-ICON)>

<ROOM CAVE-IN
      (LOC ROOMS)
      (DESC "Cave-In")
      (REGION "Somewhere Along the GUH")
      (LDESC
"Just ahead, the roof of the highway tunnel has collapsed, creating a dead
end. (Decades of non-maintenance of the Empire's infrastructure are taking
their toll.) Your only choice is to return to the west.")
      (WEST TO CROSSROADS)
      (OUT TO CROSSROADS)
      (FLAGS RLANDBIT UNDERGROUNDBIT)
      (MAP-LOC <PTABLE PORT-FOOZLE-MAP-NUM MAP-GEN-Y-3 MAP-GEN-X-8>)
      (ACTION CAVE-IN-F)>

<ROUTINE CAVE-IN-F (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-END>
		     <IN? ,PIT-BOMB ,LOCAL-GLOBALS>
		     <NOT <IN? ,JESTER ,HERE>>
		     ,LIT>
		<SETUP-ORPHAN "answer">
		<MOVE ,JESTER ,HERE>
		<THIS-IS-IT ,JESTER>
		<DEQUEUE I-JESTER>
		<TELL
"   The jester is here. \"I'm glad you decided to drop in! As you see, the
ceiling decided to drop in some time ago.\" He sits cross-legged on a piece
of rubble. \"Time for a guessing contest. If you can guess my middle name,
I'll give you a prize for winning this game!\"" CR>)>>

<OBJECT PIT-BOMB
	(LOC LOCAL-GLOBALS)
	(DESC "anti-pit bomb")
	(FDESC "Sitting on a piece of rubble is an anti-pit bomb.")
        (SYNONYM BOMB LABEL)
	(ADJECTIVE BOTTOMLESS ANTI-PIT)
	(FLAGS TAKEBIT READBIT VOWELBIT)
	(TEXT
"\"Is your cavern infested with bottomless pits? If so, this anti-pit bomb is
the answer to your prayers! Instructions: simply enter the pitted room and
throw the bomb. All pit-filling agents are harmless; no protective gear is
required!|
Another fine product of the Frobozz Magic Bottomless Pit Bomb Company.\"")
	(ACTION PIT-BOMB-F)>

<ROUTINE PIT-BOMB-F ()
	 <COND (<VERB? EXAMINE>
		<TELL "The grenade-sized bomb bears a large label." CR>)
	       (<VERB? THROW>
		<REMOVE ,PIT-BOMB>
		<TELL
"The bomb silently explodes into a growing cloud of
bottomless-pit-filling agents. ">
		<COND (<EQUAL? ,HERE ,PITS>
		       <COND (<NOT ,LIT>
			      <JIGS-UP
"You hear the pits filling in, accompanied by the sound of a legion of
slavering creatures lurking forth. Unhindered by the darkness, they
converge on you, with sharp fangs and ravenous appetites.">)
			     (T
		       	      <FCLEAR ,LANTERN ,TRYTAKEBIT>
		       	      <FCLEAR ,PITS ,TOUCHBIT>
		       	      <TELL
"As the pits fill in, from the bottom up, dark and sinister forms well up and
lurk quickly into the shadows. Uncountable hordes of the creatures emerge, and
your light glints momentarily off slavering fangs. Gurgling noises come from
every dark corner as the last of the pits becomes filled in." CR>
			      <INC-SCORE 12>
			      <CRLF>
			      <V-LOOK>)>)
		      (T
		       <TELL
"The agents, finding no bottomless pits here, disperse." CR>)>)>>

<ROOM TOLL-PLAZA
      (LOC ROOMS)
      (DESC "Toll Plaza")
      (REGION "Somewhere Along the GUH")
      (NORTH TO CROSSROADS)
      (SOUTH TO FISSURE-EDGE IF TOLL-GATE IS OPEN)
      (FLAGS RLANDBIT UNDERGROUNDBIT)
      (SYNONYM PLAZA)
      (ADJECTIVE TOLL)
      (GLOBAL SIGN)
      (MAP-LOC <PTABLE PORT-FOOZLE-MAP-NUM MAP-GEN-Y-4 MAP-GEN-X-7>)
      (ICON TOLL-PLAZA-ICON)
      (ACTION TOLL-PLAZA-F)>

<ROUTINE TOLL-PLAZA-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You have reached one of numerous Great Underground Highway system tolls. ">
		<COND (<FSET? ,TOLL-GATE ,OPENBIT>
		       <TELL "The gate lies open to the south">)
		      (T
		       <TELL "A closed toll gate spans the road">)>
		<TELL
". The toll booth is unoccupied, but a sign next to the gate indicates
an \"exact change\" option.">)>>

<OBJECT TOLL-BOOTH
	(LOC TOLL-PLAZA)
	(DESC "toll booth")
	(SYNONYM BOOTH)
	(ADJECTIVE TOLL)
	(FLAGS NDESCBIT)
	(ACTION TOLL-BOOTH-F)>

<ROUTINE TOLL-BOOTH-F ()
	 <COND (<VERB? ENTER>
		<TELL "An invisible force stops you." CR>)
	       (<VERB? EXAMINE>
		<TELL
"The booth is unmanned, but there is an \"exact change\" basket on
the side of the booth.\"" CR>)>>

<OBJECT TOLL-GATE
	(LOC TOLL-PLAZA)
	(DESC "toll gate")
	(SYNONYM GATE)
	(ADJECTIVE TOLL)
	(FLAGS NDESCBIT DOORBIT)
	(ACTION TOLL-GATE-F)>

<ROUTINE TOLL-GATE-F ()
	 <COND (<OR <AND <VERB? OPEN>
			 <NOT <FSET? ,TOLL-GATE ,OPENBIT>>>
		    <AND <VERB? CLOSE>
			 <FSET? ,TOLL-GATE ,OPENBIT>>>
		<TELL ,WONT-BUDGE>)>>

<OBJECT BASKET
	(LOC TOLL-PLAZA)
	(DESC "exact change basket")
	(SYNONYM BASKET)
	(ADJECTIVE EXACT CHANGE)
	(FLAGS VOWELBIT NDESCBIT CONTBIT OPENBIT SEARCHBIT)
	(ACTION BASKET-F)>

<ROUTINE BASKET-F ()
	 <COND (<VERB? CLOSE>
		<TELL ,HUH>)
	       (<AND <VERB? PUT>
		     <PRSO? ,ZORKMID-COIN>>
		<REMOVE ,ZORKMID-COIN>
		<FSET ,TOLL-GATE ,OPENBIT>
		<TELL
"\"Bink!\" The toll gate opens, and a poorly maintained sign lights up
momentarily, saying \"T ANK Y U!\"" CR>
		<INC-SCORE 14>)>>

<ROOM FISSURE-EDGE
      (LOC ROOMS)
      (DESC "Fissure's Edge")
      (REGION "Somewhere Along the GUH")
      (LDESC
"To the south, the road is rent by a wide fissure, the reminder of a recent
quake. Judging by the footprints in the dust, many travellers have reached
this point, only to turn around and head back to the north. The quake has
also opened a narrow crack in the eastern wall of the tunnel; you might be
able to squeeze into it.")
      (NORTH TO TOLL-PLAZA)
      (EAST TO TIGHT-SQUEEZE)
      (SOUTH SORRY "The fissure is uncrossable.")
      (FLAGS RLANDBIT UNDERGROUNDBIT)
      (MAP-LOC <PTABLE PORT-FOOZLE-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-7>)
      (ICON FISSURES-EDGE-ICON)
      (THINGS NARROW CRACK FISSURE-CRACK-PSEUDO)>

<ROUTINE FISSURE-CRACK-PSEUDO ()
	 <COND (<VERB? EXAMINE>
		<TELL "You could probably squeeze into it." CR>)
	       (<VERB? LOOK-INSIDE>
		<COND (<LIT? ,TIGHT-SQUEEZE>
		       <TELL ,SOME-LIGHT>)
		      (T
		       <TELL ,ONLY-BLACKNESS>)>)
	       (<VERB? ENTER>
		<DO-WALK ,P?EAST>)>>

<ROOM TIGHT-SQUEEZE
      (LOC ROOMS)
      (DESC "Tight Squeeze")
      (REGION "Region:  Unknown")
      (LDESC
"You are in a narrow fissure which widens to the west. A cool breeze seems
to blow upon you from below.")
      (WEST TO FISSURE-EDGE)
      (DOWN TO ORB-ROOM)
      (FLAGS RLANDBIT UNDERGROUNDBIT)
      (MAP-LOC <PTABLE PORT-FOOZLE-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-8>)>

<ROOM ORB-ROOM
      (LOC ROOMS)
      (DESC "Orb Room")
      (REGION "Region:  Unknown")
      (LDESC
"The air is chilly, the walls are covered with ice, and the floor is piled
high with crystal spheres of varying sizes and colors; most are chipped or
shattered. Your light reveals no visible exits, although a trickle of warm,
dry air caresses you from above.")
      (UP TO TIGHT-SQUEEZE)
      (OUT TO TIGHT-SQUEEZE)
      (FLAGS RLANDBIT UNDERGROUNDBIT)
      (MAP-LOC <PTABLE PORT-FOOZLE-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-9>)
      (ICON ORB-ROOM-ICON)>

<OBJECT PILE-OF-ORBS
	(LOC ORB-ROOM)
	(OWNER PILE-OF-ORBS)
	(DESC "pile of orbs")
	(SYNONYM PILE ORBS)
	(ADJECTIVE CHIPPED SHATTERED)
	(FLAGS TRYTAKEBIT NDESCBIT CONTBIT OPENBIT SEARCHBIT SURFACEBIT)
	(GENERIC GENERIC-ORB-F)
	(RESEARCH "\"(See ZILBEETHA)\"")
	(ACTION PILE-OF-ORBS-F)>

<ROUTINE PILE-OF-ORBS-F ("AUX" (TOOK-ORB <>))
	 <COND (<AND <VERB? TAKE>
		     <NOT <NOUN-USED? ,PILE-OF-ORBS ,W?PILE>>>
		<COND (<VISIBLE? ,FIERY-ORB>
		       <SET TOOK-ORB T>
		       <TELL D ,FIERY-ORB ": ">
		       <PERFORM ,V?TAKE ,FIERY-ORB>)>
		<COND (<VISIBLE? ,GLITTERY-ORB>
		       <SET TOOK-ORB T>
		       <TELL D ,GLITTERY-ORB ": ">
		       <PERFORM ,V?TAKE ,GLITTERY-ORB>)>
		<COND (<VISIBLE? ,MILKY-ORB>
		       <SET TOOK-ORB T>
		       <TELL D ,MILKY-ORB ": ">
		       <PERFORM ,V?TAKE ,MILKY-ORB>)>
		<COND (<VISIBLE? ,SMOKY-ORB>
		       <SET TOOK-ORB T>
		       <TELL D ,SMOKY-ORB ": ">
		       <PERFORM ,V?TAKE ,SMOKY-ORB>)>
		<COND (.TOOK-ORB
		       <RTRUE>)
		      (T
		       <RFALSE>)>)>>

<OBJECT MILKY-ORB
	(LOC PILE-OF-ORBS)
	(DESC "milky orb")
	(SYNONYM ORB)
	(ADJECTIVE MILKY WHITE)
	(FLAGS TAKEBIT)
	(GENERIC GENERIC-ORB-F)
	(ACTION ORB-F)>

<OBJECT FIERY-ORB
	(LOC PILE-OF-ORBS)
	(DESC "fiery orb")
	(SYNONYM ORB)
	(ADJECTIVE FIERY ORANGE)
	(FLAGS TAKEBIT)
	(GENERIC GENERIC-ORB-F)
	(ACTION ORB-F)>

<OBJECT SMOKY-ORB
	(LOC PILE-OF-ORBS)
	(DESC "smoky orb")
	(SYNONYM ORB)
	(ADJECTIVE SMOKY GRAY)
	(FLAGS TAKEBIT)
	(GENERIC GENERIC-ORB-F)
	(ACTION ORB-F)>

<OBJECT GLITTERY-ORB
	(LOC PILE-OF-ORBS)
	(DESC "glittery orb")
	(SYNONYM ORB)
	(ADJECTIVE GLITTERY GOLD GOLDEN)
	(FLAGS TAKEBIT)
	(GENERIC GENERIC-ORB-F)
	(ACTION ORB-F)>

<ROUTINE ORB-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The orb is a sphere of lustrous crystal without imperfection.">
		<COND (<NOT ,TIME-STOPPED>
		       <TELL " ">
		       <PERFORM ,V?LOOK-INSIDE ,PRSO>
		       <RTRUE>)
		      (T
		       <CRLF>)>)
	       (<VERB? LOOK-INSIDE>
		<COND (,TIME-STOPPED
		       <TELL "The sphere has">)
		      (T
		       <TELL
"Deep within the cool, smooth surface of the orb
lies an ever-shifting dance of ">
		       <COND (<PRSO? ,GLITTERY-ORB>
			      <TELL "sparkling stars">)
			     (<PRSO? ,FIERY-ORB>
			      <TELL "flickering flames">)
			     (<PRSO? ,SMOKY-ORB>
			      <TELL "swirling smoke">)
			     (T
			      <TELL "milky mists">)>
		       <TELL ", giving the sphere">)>
		<TELL " a generally ">
		<COND (<PRSO? ,GLITTERY-ORB>
		       <TELL "golden">)
		      (<PRSO? ,FIERY-ORB>
		       <TELL "orange">)
		      (<PRSO? ,SMOKY-ORB>
		       <TELL "gray">)
		      (T
		       <TELL "white">)>
		<TELL " complexion." CR>)
	       (<AND <VERB? MUNG>
		     <PRSO? ,MILKY-ORB ,FIERY-ORB ,SMOKY-ORB ,GLITTERY-ORB>>
		<REMOVE ,PRSO>
		<TELL "You ">
		<COND (<PRSO? ,MILKY-ORB>
		       <TELL "feel a puff of cool, caressing air">)
		      (<PRSO? ,FIERY-ORB>
		       <TELL "feel a hot dry blast of air">)
		      (<PRSO? ,SMOKY-ORB>
		       <TELL "smell a dry burnt odor">)
		      (T
		       <TELL "see a burst of twinkling lights">)>
		<TELL " as the orb is shattered to dust." CR>)>>

<ROUTINE GENERIC-ORB-F (TBL LEN)
	 <COND (<AND <INTBL? ,PILE-OF-ORBS <REST .TBL 2> .LEN>
		     <EQUAL? ,HERE ,ORB-ROOM>>
		,PILE-OF-ORBS ;"you must have used noun ORBS")
	       (T
		<RFALSE>)>>

<ROOM POTHOLES
      (LOC ROOMS)
      (DESC "Potholes")
      (REGION "Somewhere Along the GUH")
      (LDESC
"The road, which runs east to west, is in bad shape here, pitted with
holes and ruts.")
      (EAST TO CROSSROADS)
      (WEST TO REST-STOP)
      (FLAGS RLANDBIT UNDERGROUNDBIT)
      (MAP-LOC <PTABLE PORT-FOOZLE-MAP-NUM MAP-GEN-Y-3 MAP-GEN-X-6>)>

<ROOM REST-STOP
      (LOC ROOMS)
      (DESC "Rest Stop")
      (REGION "Somewhere Along the GUH")
      (LDESC
"By the north side of the road is a rest stop, closed and boarded up. The road
continues east and southwest.")
      (EAST TO POTHOLES)
      (SW TO FORK)
      (FLAGS RLANDBIT UNDERGROUNDBIT)
      (MAP-LOC <PTABLE PORT-FOOZLE-MAP-NUM MAP-GEN-Y-3 MAP-GEN-X-5>)
      (ICON REST-STOP-ICON)
      (THINGS REST STOP REST-STOP-PSEUDO)>

<ROUTINE REST-STOP-PSEUDO ()
	 <COND (<VERB? EXAMINE ENTER>
		<TELL "The rest stop is all shuttered up." CR>)
	       (<VERB? SEARCH>
		<TELL "You're outside it!" CR>)>>

<ROOM FORK
      (LOC ROOMS)
      (DESC "Fork")
      (REGION "Somewhere Along the GUH")
      (LDESC
"The tunnel forks here, with roads leading northeast, west, and southwest.")
      (NE TO REST-STOP)
      (WEST TO FISHY-ODOR)
      (SW TO SALTY-SMELL)
      (FLAGS RLANDBIT UNDERGROUNDBIT)
      (MAP-LOC <PTABLE PORT-FOOZLE-MAP-NUM MAP-GEN-Y-4 MAP-GEN-X-4>)
      (ICON FORK-ICON)>

<ROOM FISHY-ODOR
      (LOC ROOMS)
      (DESC "Fishy Odor")
      (REGION "Port Foozle")
      (LDESC
"The tunnel narrows toward a spot of light to the west. The stench of dead,
rotting fish hangs in the air.")
      (EAST TO FORK)
      (WEST TO FISHING-VILLAGE)
      (FLAGS RLANDBIT UNDERGROUNDBIT)
      (MAP-LOC <PTABLE PORT-FOOZLE-MAP-NUM MAP-GEN-Y-4 MAP-GEN-X-3>)
      (ICON FISHY-ODOR-ICON)>

<ROOM SALTY-SMELL
      (LOC ROOMS)
      (DESC "Salty Smell")
      (REGION "Port Foozle")
      (LDESC
"The tunnel from the northeast is narrower here, and pervaded with the scent
of the sea. You can hear breakers to the southwest.")
      (NE TO FORK)
      (SW TO QUILBOZZA-BEACH)
      (FLAGS RLANDBIT UNDERGROUNDBIT)
      (MAP-LOC <PTABLE PORT-FOOZLE-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-3>)>

<ROOM FISHING-VILLAGE
      (LOC ROOMS)
      (DESC "Fishing Village")
      (REGION "Port Foozle")
      (LDESC
"This once-busy port, on the shore of the Great Sea, lies deserted. A tunnel
opens to the east, the shoreline can be followed south along the ocean's edge,
and a wharf juts into the harbor to the west. A newly constructed stone
building lies to the north; an eye-catching sign has been erected next to its
entrance.")
      (EAST TO FISHY-ODOR)
      (WEST TO WHARF)
      (SOUTH TO SANDBAR)
      (NORTH TO INQUISITION)
      (IN TO INQUISITION)
      (FLAGS RLANDBIT ONBIT OUTSIDEBIT)
      (GLOBAL SIGN FLATHEAD-OCEAN WHARF GLOBAL-BUILDING)
      (MAP-LOC <PTABLE PORT-FOOZLE-MAP-NUM MAP-GEN-Y-4 MAP-GEN-X-2>)
      (ICON FISHING-VILLAGE-ICON)
      (ACTION FISHING-VILLAGE-F)>

<ROUTINE FISHING-VILLAGE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<COND (<NOT <FSET? ,FISHING-VILLAGE ,TOUCHBIT>>
		       <SETG INQUISITION-NUMBER <RANDOM 100>>
		       <SETG NUMBER-ON-LINE <+ <RANDOM 3> 2>>)>
		<QUEUE I-INQUISITION -1>)>>

<ROUTINE I-INQUISITION ("AUX" (NEW-PERSONS 0) (DOABLE <>))
	 <COND (<NOT <EQUAL? ,HERE ,INQUISITION ,FISHING-VILLAGE>>
		<DEQUEUE I-INQUISITION>
		<RFALSE>)
	       (<OR <L? ,NUMBER-ON-LINE 3>
		    <AND <PROB 75>
			 <EQUAL? ,NUMBER-ON-LINE 3>>
		    <AND <PROB 50>
			 <EQUAL? ,NUMBER-ON-LINE 4>>
		    <AND <PROB 25>
			 <EQUAL? ,NUMBER-ON-LINE 5>>>
		<SET NEW-PERSONS <COND (<PROB 50> 1)
				       (<PROB 80> 2)
				       (T 3)>>
		<SETG NUMBER-ON-LINE <+ ,NUMBER-ON-LINE .NEW-PERSONS>>)>
	 <SETG INQUISITION-NUMBER <+ ,INQUISITION-NUMBER 1>>
	 <COND (<AND <EQUAL? ,HERE ,FISHING-VILLAGE>
		     <G? .NEW-PERSONS 0>>
	        <TELL "   A trollish guard drags ">
		<COND (<EQUAL? .NEW-PERSONS 1>
		       <TELL "someone">)
		      (<EQUAL? .NEW-PERSONS 2>
		       <TELL "two people">)
		      (T
		       <TELL "three people">)>
		<TELL ", kicking and screaming, into the stone building." CR>
		<RTRUE>)
	       (<AND <EQUAL? ,HERE ,INQUISITION>
		     <G? .NEW-PERSONS 0>>
		<TELL "   A trollish guard drags in ">
		<COND (<EQUAL? .NEW-PERSONS 1>
		       <TELL "someone">)
		      (<EQUAL? .NEW-PERSONS 2>
		       <TELL "two people">)
		      (T
		       <TELL "three people">)>
		<TELL ", who obediently take">
		<COND (<EQUAL? .NEW-PERSONS 1>
		       <TELL "s a number">)
		      (T
		       <TELL " numbers">)>
		<TELL " from the number dispenser." CR>)>
	 <COND (<EQUAL? ,HERE ,INQUISITION>
		<COND (<AND <G? ,NUMBER-TAKEN 0>
			    <G? ,INQUISITION-NUMBER ,NUMBER-TAKEN>>
		       <JIGS-UP
"   The executioner says, \"Well, we can't wait around forever; we've got
thousands to execute! Hang 'em!\" You swing.">)>
		<TELL
"   The executioner calls out, \"Number " N ,INQUISITION-NUMBER "!\" and ">
		<COND (<EQUAL? ,INQUISITION-NUMBER ,NUMBER-TAKEN>
		       <TELL "looks at you with an ugly grin">)
		      (T
		       <SETG NUMBER-ON-LINE <- ,NUMBER-ON-LINE 1>>
		       <TELL
"a bedraggled man steps forward. \"Executioner, ">
		       <COND (<PROB 50>
			      <SET DOABLE T>
			      <TELL <PICK-ONE ,DOABLE-REQUESTS>>)
			     (T
			      <TELL <PICK-ONE ,UNDOABLE-REQUESTS>>)>
		       <TELL ",\" he croaks. The executioner says, \"">
		       <COND (.DOABLE
			      <TELL
"Done!\" and the man is led to the gallows and hung from the neck until dead">)
			     (T
			      <TELL
"Sorry, can't do that.\" The man is placed on the block, and a moment
later his head is rolling away">)>)>
		<TELL ,PERIOD-CR>)>>

<CONSTANT DOABLE-REQUESTS
	<LTABLE
	 0
	 "sing a song"
	 "kick me"
	 "kiss me">>

<CONSTANT UNDOABLE-REQUESTS
	<LTABLE
	 0
	 "give me a thousand zorkmids"
	 "give me Ursula Flathead"
	 "send me to Antharia">>

<GLOBAL INQUISITION-NUMBER 0> ;"next!"

<GLOBAL NUMBER-ON-LINE 0>

<GLOBAL NUMBER-TAKEN 0>

<GLOBAL INQUISITION-SCORE 25>

<ROOM INQUISITION
      (LOC ROOMS)
      (DESC "Inquisition")
      (REGION "Port Foozle")
      (SOUTH SORRY "A trollish guard blocks the exit. \"No one leave!\"")
      (OUT SORRY "A trollish guard blocks the exit. \"No one leave!\"")
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL SIGN GLOBAL-BUILDING)
      (MAP-LOC <PTABLE PORT-FOOZLE-MAP-NUM MAP-GEN-Y-3 MAP-GEN-X-2>)
      (ACTION INQUISITION-F)>

<ROUTINE INQUISITION-F (RARG "AUX" OWINNER)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<COND (<NOT <FSET? ,INQUISITION ,TOUCHBIT>>
		       <TELL
"Extremist religions spring up whenever an empire collapses. The Inquisitors
believe the impending doom was caused by widespread sinning, but that the gods
can be placated if every person in the kingdom is executed." CR "   ">)>
		<TELL
"This is one of the Inquisitors' execution sites. A hooded executioner,
dripping with sweat and blood, stands between a gallows and a block. "
N ,NUMBER-ON-LINE " people are queued up in front of the executioner. ">
		<COND (<G? ,NUMBER-TAKEN 0>
		       <TELL "You are ">
		       <COND (<EQUAL? <- ,NUMBER-TAKEN ,INQUISITION-NUMBER> 7>
			      <TELL "seventh">)
			     (<EQUAL? <- ,NUMBER-TAKEN ,INQUISITION-NUMBER> 6>
			      <TELL "sixth">)
			     (<EQUAL? <- ,NUMBER-TAKEN ,INQUISITION-NUMBER> 5>
			      <TELL "fifth">)
			     (<EQUAL? <- ,NUMBER-TAKEN ,INQUISITION-NUMBER> 4>
			      <TELL "fourth">)
			     (<EQUAL? <- ,NUMBER-TAKEN ,INQUISITION-NUMBER> 3>
			      <TELL "third">)
			     (<EQUAL? <- ,NUMBER-TAKEN ,INQUISITION-NUMBER> 2>
			      <TELL "second">)
			     (T
			      <TELL "first">)>
		       <TELL " on line. ">)>
		<TELL
"Near the end of the line is a number dispenser. A large sign fills one wall.
The only exit is south.">)
	       (<EQUAL? .RARG ,M-END>
		<COND (<EQUAL? ,INQUISITION-SCORE 0> ;"already solved it"
		       <TELL
"   The executioner spots you. \"Get that joker outta here!\" Guards fling
you back onto the street." CR CR>
		       <GOTO ,FISHING-VILLAGE>
		       <RTRUE>)>
		<SET OWINNER ,WINNER>
		<SETG WINNER ,EXECUTIONER> ;"see SEE-INSIDE?"
		<COND (<VISIBLE? ,PIGEON>
		       <TELL
"   One of the guards says, \"Sorry, you'll have to leave your pigeon
outside.\" He grabs it and ">
		       <COND (<EQUAL? <META-LOC ,PERCH> ,HERE>
			      <MOVE ,PIGEON ,FISHING-VILLAGE>
			      <TELL "tosses it outside">)
			     (T
			      <MOVE ,PIGEON <META-LOC ,PERCH>>
			      <TELL
"looks stunned as he recedes and vanishes, along with the pigeon">)>
		       <TELL ,PERIOD-CR>)>
		<COND (<VISIBLE? ,CLOAK>
		       <MOVE ,CLOAK ,FISHING-VILLAGE>
		       <TELL
"   A particularly surly-looking guard says, \"Check your cloak in our coat
room, haw haw haw.\" He grabs the cloak and kicks it through the door." CR>)>
		<SETG WINNER .OWINNER>
		<COND (<L? ,NUMBER-TAKEN -2>
		       <JIGS-UP
"   The guard loses his patience and skewers you.">)
		      (<L? ,NUMBER-TAKEN 1>
		       <COND (<NOT <EQUAL? ,NUMBER-TAKEN 0>>
			      <TELL
"   A guard pokes you with his spear. \"Hey, take a number.\"" CR>)>
		       <SETG NUMBER-TAKEN <- ,NUMBER-TAKEN 1>>)>)>>

<OBJECT TICKET
	(LOC INQUISITION)
	(DESC "ticket")
	(SYNONYM TICKET NUMBER)
	(OWNER PROTAGONIST)
	(FLAGS TAKEBIT READBIT TRYTAKEBIT NDESCBIT BURNBIT)
	(SIZE 1)
	(ACTION TICKET-F)>

<ROUTINE TICKET-F ()
	 <COND (<AND <VERB? TAKE>
		     <EQUAL? ,HERE ,INQUISITION>>
		<COND (<NOT <G? ,NUMBER-TAKEN 0>>
		       <SETG NUMBER-TAKEN
			     <+ ,INQUISITION-NUMBER ,NUMBER-ON-LINE>>
		       <FCLEAR ,TICKET ,NDESCBIT>
		       <FCLEAR ,TICKET ,TRYTAKEBIT>
		       <MOVE ,TICKET ,PROTAGONIST>
		       <TELL "You get number " N ,NUMBER-TAKEN ,PERIOD-CR>)
		      (<NOUN-USED? ,TICKET ,W?NUMBER>
		       <TELL
"A guard lightly bludgeons your hand. \"One number per person!\"" CR>)>)
	       (<VERB? READ EXAMINE>
		<COND (<FSET? ,TICKET ,NDESCBIT>
		       <TELL "You haven't taken one yet!" CR>)
		      (T
		       <TELL
"The ticket has a large number \"" N ,NUMBER-TAKEN "\" on it. In smaller
type, it says, \"Frobozz Magic Inquisition Numbered Ticket Company.\"" CR>)>)>>

<OBJECT BOX
	(LOC INQUISITION)
	(DESC "box")
	(PLURAL "boxes")
	(FDESC
"One of the sinners has apparently dropped a box here. The box has some
writing on it.")
	(SYNONYM BOX WRITING)
	(ADJECTIVE SMALL)
	(FLAGS TAKEBIT CONTBIT READBIT SEARCHBIT)
	(SIZE 3)
	(CAPACITY 3)
	(TEXT
"\"Squid Repellent! Contents: 1 pellet. Dissolves slowly in water, keeps
squid away for hours! Another fine product of the Frobozz Magic Squid
Repellent Company.\"")>

<OBJECT SQUID-REPELLENT
	(LOC BOX)
	(OWNER SQUID-REPELLENT)
	(DESC "pellet of squid repellent")
	(SYNONYM PELLET REPELLENT)
	(ADJECTIVE LARGE SQUID)
	(FLAGS TAKEBIT)
	(SIZE 1)
	(ACTION SQUID-REPELLENT-F)>

<ROUTINE SQUID-REPELLENT-F ()
	 <COND (<VERB? TASTE SMELL>
		<TELL "Not being a squid, you're not repelled." CR>)>>

<OBJECT EXECUTIONER
	(LOC INQUISITION)
	(DESC "executioner")
	(SYNONYM EXECUTIONER MAN)
	(FLAGS ACTORBIT VOWELBIT NDESCBIT ANIMATEDBIT)
	(ACTION EXECUTIONER-F)>

<ROUTINE EXECUTIONER-F ("OPT" (ARG <>))
	 <COND (<EQUAL? .ARG ,M-WINNER>
		<COND (<EQUAL? ,NUMBER-TAKEN ,INQUISITION-NUMBER>
		       <COND (<OR <AND <VERB? BEHEAD>
				       <PRSO? ,ME>>
				  <AND <VERB? CUT>
				       <PRSO? ,HEAD>
				       <ADJ-USED? ,HEAD ,W?MY <>>>>
			      <TELL
"The executioner says, \"Hey, sure! Easy request! I can behead ya!\" Then a
confused look creeps over his face. \"But if I behead ya, then I done granted
yer last wish, and I gotta hang ya! But if I hang ya, I ain't granted yer wish,
and I gotta behead ya! But...\" He trails off. \"Guards, throw this wise guy
outta here!\" Guards surround you and escort you out." CR>
			      <INC-SCORE ,INQUISITION-SCORE>
		       	      <SETG INQUISITION-SCORE 0>
			      <CRLF>
			      <GOTO ,FISHING-VILLAGE>)
			     (<DOABLE-REQUEST>
			      <JIGS-UP
"\"Done!\" You learn that hanging is as excrutiatingly painful as promised.">)
			     (<OR <UNDOABLE-REQUEST>
				  <PROB 50>>
			      <JIGS-UP
"\"Sorry, can't do that.\" You learn that beheading is
indeed quite quick and painless.">)
			     (T
			      <JIGS-UP
"\"Done!\" You learn that hanging is as excrutiatingly painful as promised.">)>)
		      (T
		       <TELL "\"Shut up until your number is called!\"" CR>
		       <STOP>)>)>>

<ROUTINE DOABLE-REQUEST ()
	 <COND (<AND <VERB? KISS KICK KILL HANG>
		     <PRSO? ,ME>>
		<RTRUE>)
	       (<AND <VERB? SING>
		     <PRSO? ,LULLABY>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE UNDOABLE-REQUEST ()
	 <COND (<AND <VERB? GIVE>
		     <PRSO? ,ME>
		     <PRSI? ,POSTER ,THOUSAND-ZORKMIDS>>
		<RTRUE>)
	       (<AND <VERB? SEND UNTIE>
		     <PRSO? ,ME>>
		<RTRUE>)
	       (<AND <VERB? POINT>
		     <PRSO? ,WAND>
		     <PRSI? ,ME>>
		<RTRUE>)
	       (<AND <VERB? WEAR>
		     <PRSO? RING>>
		<RTRUE>)
	       (<AND <VERB? KILL>
		     <PRSO? ,EXECUTIONER>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<OBJECT THOUSAND-ZORKMIDS
	(LOC LOCAL-GLOBALS)
	(DESC "lots of zorkmids")
	(SYNONYM ZORKMIDS)
	(ADJECTIVE HUNDRED THOUSAND MILLION INT.NUM)
	(FLAGS NARTICLEBIT)>

<ROOM WHARF
      (LOC ROOMS)
      (DESC "Wharf")
      (REGION "Port Foozle")
      (LDESC
"This wharf extends into the harbor from a village to the east. Along the the
north side of the wharf, a building rests on piers over the water.")
      (EAST TO FISHING-VILLAGE)
      (NORTH TO CASINO)
      (WEST SORRY "The wharf ends a few steps to the west.")
      (FLAGS RLANDBIT ONBIT OUTSIDEBIT)
      (SYNONYM WHARF)
      (GLOBAL GLOBAL-BUILDING)
      (MAP-LOC <PTABLE PORT-FOOZLE-MAP-NUM MAP-GEN-Y-4 MAP-GEN-X-1>)
      (ICON WHARF-ICON)>

<ROOM CASINO
      (LOC ROOMS)
      (DESC "Casino")
      (REGION "Port Foozle")
      (LDESC
"This is the Port Foozle Casino, once a world-famous gambling spot, but
now deserted and showing the effects of years of ocean storms. The casino
has been heavily looted; only a single card table seems untouched. An exit
leads south.")
      (SOUTH TO WHARF)
      (OUT TO WHARF)
      (FLAGS RLANDBIT ONBIT)
      (SYNONYM CASINO)
      (GLOBAL GLOBAL-BUILDING)
      (MAP-LOC <PTABLE PORT-FOOZLE-MAP-NUM MAP-GEN-Y-3 MAP-GEN-X-1>)
      (ACTION CASINO-F)>

<ROUTINE CASINO-F (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-END>
		     <IN? ,BROOM ,LOCAL-GLOBALS>
		     <NOT <IN? ,JESTER ,HERE>>>
		<MOVE ,JESTER ,HERE>
		<DEQUEUE I-JESTER>
		<THIS-IS-IT ,JESTER>
		<TELL "   You do a ">
		<COND (<L? <- ,MOVES ,JESTER-DISPOSED> 4>
		       <TELL "triple">)
		      (T
		       <TELL "double">)>
		<TELL
" take as you notice the jester at the card table, grandly shuffling a thick
deck. \"I don't wear any Gucci, I can't dance the hootchy-kootchy, I've never
been good at the old smoochie-woochie, but I sure am a whiz at Double Fanucci!
When I start to deal, the tension is real; if you can stand the heat, pull up
a seat!\" He motions for you to sit down at the table." CR>)>>

<OBJECT DOUBLE-FANUCCI
	(LOC GLOBAL-OBJECTS)
	(DESC "Double Fanucci")
	(SYNONYM FANUCCI FANNUCCI)
	(ADJECTIVE DOUBLE)
	(RESEARCH
"\"Legend has it that Double Fanucci (or Fannucci) was invented by the deposed
Zilbo III in the late seventh century. A game of tremendous complexity and
almost infinite rules, King Mumberthrax proclaimed it the national sport of
the Empire in 761 GUE. The annual Double Fanucci Championships, held in
Borphee during early autumn, frequently leave thousands homeless.\"")
	(ACTION DOUBLE-FANUCCI-F)>

<ROUTINE DOUBLE-FANUCCI-F ()
	 <COND (<VERB? PLAY>
		<COND (<AND <EQUAL? ,HERE ,CASINO>
			    <IN? ,JESTER ,HERE>
			    <IN? ,BROOM ,LOCAL-GLOBALS>>
		       <COND (<EQUAL? <LOC ,PROTAGONIST> ,CARD-TABLE>
			      <FANUCCI-START>)
			     (T
			      <PERFORM ,V?ENTER ,CARD-TABLE>)>
		       <RTRUE>)
		      (T
		       <TELL
"You don't have a pack of Fanucci cards; besides, there's no solitaire
version of Double Fanucci." CR>)>)>>

<OBJECT CARD-TABLE
	(LOC CASINO)
	(DESC "card table")
	(SYNONYM TABLE)
	(ADJECTIVE CARD)
	(FLAGS NDESCBIT SURFACEBIT CONTBIT OPENBIT SEARCHBIT VEHBIT)
	(CAPACITY 50)
	(ACTION CARD-TABLE-F)>

<ROUTINE CARD-TABLE-F ("OPTIONAL" VARG)
	 <COND (<AND <EQUAL? .VARG ,M-ENTER>
		     <IN? ,BROOM ,LOCAL-GLOBALS>>
		<FANUCCI-START>)>>

<ROUTINE FANUCCI-START ("AUX" MARGIN)
	 <TELL
" The jester begins dealing. \"We'll be playing according to Revised Miznian
Rules, Seventh-Level Amendments, with these exceptions: no side-handling after
an underfunded discard, two draws after a Skybreaker, and an extra muttonation
if the conditions of Rule 17.4.1.B are met. Oh, also all the house rules
adopted by the Fanucci Casino Rebuilding Act of 817." CR CR>
	 <HIT-ANY-KEY "Double Fanucci">
	 <SPLIT-BY-PICTURE ,FANUCCI-SPLIT T>
	 <ADJUST-TEXT-WINDOW ,FANUCCI-BORDER-BOTTOM>
	 <CLEAR ,S-FULL>
	 <PICK-RANK 0>
	 <PUT ,FANUCCI-CARD-TABLE 1 <RANDOM 15>>
	 <PICK-RANK 2>
	 <PUT ,FANUCCI-CARD-TABLE 3 <RANDOM 15>>
	 <PICK-RANK 4>
	 <PUT ,FANUCCI-CARD-TABLE 5 <RANDOM 15>>
	 <PICK-RANK 6>
	 <PUT ,FANUCCI-CARD-TABLE 7 <RANDOM 15>>
	 <PICK-RANK 8>
	 <PUT ,FANUCCI-CARD-TABLE 9 <RANDOM 15>>
	 <SETG JESTER-SCORE 0>
	 <SETG YOUR-SCORE 0>
	 <SETG FANUCCI-PLAYS 0>
	 <SETUP-FANUCCI>
	 <FANUCCI>
	 <SCREEN ,S-WINDOW>
	 <FONT 1> ;"proportional"
	 <SCREEN ,S-TEXT>
	 <CRLF> <CRLF>
	 <HIT-ANY-KEY>
	 ;"else, when you play again, the cards aren't drawn"
	 <PUT ,DRAW-CARDS-TABLE 0 1>
	 <PUT ,DRAW-CARDS-TABLE 1 1>
	 <PUT ,DRAW-CARDS-TABLE 2 1>
	 <PUT ,DRAW-CARDS-TABLE 3 1>
	 <PUT ,DRAW-CARDS-TABLE 4 1>
	 <INIT-SL-WITH-SPLIT ,TEXT-WINDOW-PIC-LOC>>

<ROUTINE SETUP-FANUCCI ("AUX" MARGIN
			CARD-NUM-Y DISCARD-X CARD-NUM-1-X CARD-SPACE)
	 <SCREEN ,S-FULL>
	 <DISPLAY ,FANUCCI-BORDER 1 1>
	 <SCREEN ,S-WINDOW>
	 <FONT 4> ;"non-proportional"
	 <PICINF-PLUS-ONE ,JESTER-SCORE-LOC>
	 <CURSET <GET ,PICINF-TBL 0> <GET ,PICINF-TBL 1>>
	 <TELL "Jester's Score:">
	 <PICINF-PLUS-ONE ,YOUR-SCORE-LOC>
	 <CURSET <GET ,PICINF-TBL 0> <GET ,PICINF-TBL 1>>
	 <TELL "Your Score:">
	 <PICINF-PLUS-ONE ,FANUCCI-DISCARD-LOC>
	 <SET CARD-NUM-Y <ZGET ,PICINF-TBL 0>>
	 <SET DISCARD-X <ZGET ,PICINF-TBL 1>>
	 <PICINF-PLUS-ONE ,FANUCCI-CARD-1-LOC>
	 <SET CARD-NUM-1-X <ZGET ,PICINF-TBL 1>>
	 <PICINF ,FANUCCI-CARD-SPACE ,PICINF-TBL>
	 <SET CARD-SPACE <ZGET ,PICINF-TBL 1>>
	 <UPDATE-SCORES>
	 <DRAW-CARDS>
	 <CURSET .CARD-NUM-Y .DISCARD-X>
	 <TELL "DISCARD">
	 <CURSET .CARD-NUM-Y .CARD-NUM-1-X>
	 <TELL "1">
	 <CURSET .CARD-NUM-Y <+ .CARD-NUM-1-X .CARD-SPACE>>
	 <TELL "2">
	 <CURSET .CARD-NUM-Y <+ .CARD-NUM-1-X <* .CARD-SPACE 2>>>
	 <TELL "3">
	 <CURSET .CARD-NUM-Y <+ .CARD-NUM-1-X <* .CARD-SPACE 3>>>
	 <TELL "4">
	 <PICINF-PLUS-ONE ,FANUCCI-MENU-LOC>
	 <CURSET <GET ,PICINF-TBL 0> <GET ,PICINF-TBL 1>>
	 <TELL " DRAW         REVERSE      COMBINE      SINGLE-PLAY  IONIZE">
	 <CURSET <+ <GET ,PICINF-TBL 0> ,FONT-Y> <GET ,PICINF-TBL 1>>
	 <TELL " DISCARD      TRUMP        PASS         DOUBLE-PLAY  CHEAT">
	 <CURSET <+ <GET ,PICINF-TBL 0> <* ,FONT-Y 2>> <GET ,PICINF-TBL 1>>
	 <TELL " DIVIDE       UNDERTRUMP   OVERPASS     MUTTONATE    RESIGN">
	 <SCREEN ,S-TEXT>
	 <CURSET 1 1>>

<CONSTANT FANUCCI-PIC-LOCS
	  <PTABLE ,FANUCCI-DISCARD-PIC-LOC
		  ,FANUCCI-1-PIC-LOC
		  ,FANUCCI-2-PIC-LOC
		  ,FANUCCI-3-PIC-LOC
		  ,FANUCCI-4-PIC-LOC>>

<ROUTINE DRAW-CARDS ("AUX" X (CNT 0))
	 <REPEAT ()
		 <COND (<L=? .CNT 4>
			<SET X <ZGET ,FANUCCI-PIC-LOCS .CNT>>)
		       (T
			<SET X <ZGET ,FANUCCI-PIC-LOCS 4>>)>
		 <PICINF-PLUS-ONE .X>
		 <SET X <GET ,PICINF-TBL 1>>
		 <COND (<EQUAL? .CNT 5>
			<RETURN>)
		       (<EQUAL? <GET ,DRAW-CARDS-TABLE .CNT> 1>
			<PUT ,DRAW-CARDS-TABLE .CNT 0>
			<DRAW-CARD .X <* .CNT 2> <+ <* .CNT 2> 1>>)>
		 <SET CNT <+ .CNT 1>>>>

<CONSTANT PICTURE-CARD-PROB 20>

<ROUTINE PICK-RANK (NUM)
	 <PUT ,FANUCCI-CARD-TABLE .NUM <COND (<PROB ,PICTURE-CARD-PROB>
					      <+ 11 <RANDOM 9>>)
					     (T
					      <RANDOM 11>)>>>

<CONSTANT FANUCCI-FACE-CARD-PIC-TBL
	  <PTABLE ,FANUCCI-GRANOLA
		  ,FANUCCI-LOBSTER
		  ,FANUCCI-SNAIL
		  ,FANUCCI-JESTER
		  ,FANUCCI-HOURGLASS
		  ,FANUCCI-LIGHT
		  ,FANUCCI-BEAUTY
		  ,FANUCCI-DEATH
		  ,FANUCCI-GRUE>>

<ROUTINE DISPLAY-OFFSET (PIC Y X OFFPIC)
  <PICINF .OFFPIC ,PICINF-TBL>
  <DISPLAY .PIC <+ <ZGET ,PICINF-TBL 0> .Y> <+ <ZGET ,PICINF-TBL 1> .X>>>

<ROUTINE DRAW-CARD (X RANK SUIT "AUX" Y PIC)
	 <SET RANK <GET ,FANUCCI-CARD-TABLE .RANK>>
         <SET SUIT <GET ,FANUCCI-CARD-TABLE .SUIT>>
	 <SET Y <GET ,PICINF-TBL 0>>
         <COND (<EQUAL? .RANK 0>
	        <DISPLAY ,FANUCCI-CARD-BACK .Y .X>)
	       (<G? .RANK 11>
	        <SET PIC <ZGET ,FANUCCI-FACE-CARD-PIC-TBL <- .RANK 12>>>
		<DISPLAY .PIC .Y .X>)
	       (T
	        <DISPLAY ,FANUCCI-CARD .Y .X>
		<DISPLAY-OFFSET <GET ,RANK-PIC-TBL .RANK> .Y .X
				,FANUCCI-RANK-PIC-LOC>
		<DISPLAY-OFFSET <GET ,RANK-REV-TBL .RANK> .Y .X
				,FANUCCI-REV-RANK-PIC-LOC>
		<DISPLAY-OFFSET <GET ,SUIT-PIC-TBL .SUIT> .Y .X
				,FANUCCI-SUIT-PIC-LOC>
		<DISPLAY-OFFSET <GET ,SUIT-REV-TBL .SUIT> .Y .X
				,FANUCCI-REV-SUIT-PIC-LOC>)>>

<ROUTINE FANUCCI ("AUX" X Y PTR)
	 <PICINF-PLUS-ONE ,FANUCCI-MENU-LOC>
	 <SET X <GET ,PICINF-TBL 1>>
	 <SET Y <GET ,PICINF-TBL 0>>
	 <SET PTR 0>
	 <BOLD-MOVE .X .Y .PTR>
	 <CLEAR ,S-TEXT>
	 <TELL
"Use the arrow keys -- or the U, D, L and R keys -- to highlight a play, then
hit the RETURN/ENTER key. Or, if you have a mouse, you can use that to select
your play.">
	 <REPEAT ()
		 <COND (<PICK-PLAY .X .Y .PTR> ;"rtrues if resigned"
			<RETURN>)>
		 <COND (<EQUAL? ,FANUCCI-WIN-COUNT 3>
			<MOVE ,BROOM ,CARD-TABLE>
			<REMOVE-JESTER>
			<SETG YOUR-SCORE <+ ,YOUR-SCORE 1000>>
			<TELL
"\"Great Zilbo's Ghost! Three undertrumps after a Trebled Fromp discard!
That's indefensible!\" In the time-honored tradition of Double Fanucci
matches, the jester leaps over the card table to congratulate you. \"You've
swept me away! You've truly cleaned up today!\" He rifles through his wallet
and removes a broom, which he lays on the card table. \"Here are your
winnings!\" In a wink, the jester is gone.\"" CR>
			<INC-SCORE 18>
			<RETURN>)>
		 <SCREEN ,S-WINDOW>
		 <DRAW-CARDS>
		 <UPDATE-SCORES>
		 <SCREEN ,S-TEXT>
		 <COND (<SCORE-DIFFERENTIAL-CHECK>
			<RETURN>)>
		 <JESTER-PLAY>
		 <SCREEN ,S-WINDOW>
		 <DRAW-CARDS>
		 <SETG FANUCCI-PLAYS <+ ,FANUCCI-PLAYS 1>>
		 <UPDATE-SCORES>
		 <SCREEN ,S-TEXT>
		 <COND (<SCORE-DIFFERENTIAL-CHECK>
			<RETURN>)>>>

<ROUTINE UPDATE-SCORES ()
	 <PICINF-PLUS-ONE ,JESTER-SCORE-LOC>
	 <CURSET <GET ,PICINF-TBL 0> <+ <GET ,PICINF-TBL 1> <* ,FONT-X 16>>>
	 <COND (<L? ,JESTER-SCORE 10>
		<TELL " 00">)
	       (<L? ,JESTER-SCORE 100>
	        <TELL " 0">)
	       (<L? ,JESTER-SCORE 1000>
		<TELL " ">)>
	 <TELL N ,JESTER-SCORE>
	 <PICINF-PLUS-ONE ,YOUR-SCORE-LOC>
	 <CURSET <GET ,PICINF-TBL 0> <+ <GET ,PICINF-TBL 1> <* ,FONT-X 12>>>
	 <COND (<L? ,YOUR-SCORE 10>
		<TELL " 00">)
	       (<L? ,YOUR-SCORE 100>
	        <TELL " 0">)
	       (<L? ,YOUR-SCORE 1000>
	        <TELL " ">)>
	 <TELL N ,YOUR-SCORE>>

<ROUTINE SCORE-DIFFERENTIAL-CHECK ()
	 <COND (<G? ,JESTER-SCORE ,YOUR-SCORE>
		<COND (<G? <- ,JESTER-SCORE ,YOUR-SCORE> 1241>
		       <TELL "\"My">)
		      (T
		       <RFALSE>)>)
	       (T
		<COND (<G? <- ,YOUR-SCORE ,JESTER-SCORE> 1241>
		       <TELL "\"Your">)
		      (T
		       <RFALSE>)>)>
	 <TELL
" lead exceeds 1241 points,\" the jester explains, \"so by Rules Committee
Amendment #493, the game is suspended and must be replayed in its entirety,
except during a Frotz Moon or in a six-player game where at least three of
the players are of Mithican ancestry.\"|
   The jester sighs. \"It's always ironic to play for so long without reaching
a decision. I'm sure that the great humorist, O'Flathead, would get a chuckle
out of our predicament.\"" CR>
	 <RTRUE>>

<GLOBAL JESTER-CARDS 4>

<GLOBAL JESTER-DISCARD-FROMP-PROB 0>

<GLOBAL FANUCCI-WIN-COUNT 0>

<CONSTANT DRAW-CARDS-TABLE ;"tells DRAW-CARDS which cards have changed"
	<TABLE 1 1 1 1 1>>

<CONSTANT JESTER-LAST-CARD
	<TABLE 0 0>>

<CONSTANT FROMP-SUIT 15>

<CONSTANT TREBLED-RANK 11>

<ROUTINE JESTER-PLAY ("AUX" PLAY-NUM RANK SUIT NUM)
	 <TELL "|   Your opponent stares at his " N ,JESTER-CARDS " card">
	 <COND (<NOT <EQUAL? ,JESTER-CARDS 1>>
		<TELL "s">)>
	 <TELL ", pondering his move. ">
	 <HIT-ANY-KEY>
	 <CLEAR ,S-TEXT>
	 <TELL "The jester ">
	 <COND (<OR <L? ,JESTER-CARDS 2>
		    <AND <EQUAL? ,JESTER-CARDS 2>
			 <PROB 67>>
		    <AND <EQUAL? ,JESTER-CARDS 2>
			 <PROB 33>>>
		<SETG JESTER-CARDS <+ ,JESTER-CARDS 1>>
		<TELL "decides to draw. He seems ">
		<COND (<PROB 8>
		       <TELL "extremely ">)>
		<COND (<PROB 50>
		       <TELL "delighted">)
		      (T
		       <TELL "dismayed">)>
		<TELL " by his new card.">)
	       (T
		<SETG JESTER-CARDS <- ,JESTER-CARDS 1>>
		<SETG JESTER-DISCARD-FROMP-PROB
		      <+ ,JESTER-DISCARD-FROMP-PROB 2>>
		<TELL "proceeds to ">
		;<COND (,DEBUG
		       <TELL
"[DISCARD-FROMP-PROB is " N ,JESTER-DISCARD-FROMP-PROB "%] ">)>
		<COND (<PROB ,JESTER-DISCARD-FROMP-PROB>
		       <SETG JESTER-DISCARD-FROMP-PROB 0>
		       <SET PLAY-NUM 1>
		       <SET SUIT ,FROMP-SUIT>
		       <SET RANK ,TREBLED-RANK>)
		      (T
		       <SET PLAY-NUM <RANDOM 12>>
		       ;"jester should never draw (here), cheat, or resign"
		       <SET SUIT <RANDOM 15>>
		       <SET RANK <COND (<PROB ,PICTURE-CARD-PROB>
					<+ 11 <RANDOM 9>>)
				       (T
					<RANDOM 11>)>>)>
		<PUT ,JESTER-LAST-CARD 0 .RANK>
		<PUT ,JESTER-LAST-CARD 1 .SUIT>
		<SET NUM <MOD <* .PLAY-NUM .SUIT .RANK> 17>>
		<COND (<EQUAL? .PLAY-NUM 1>
		       <PUT ,DRAW-CARDS-TABLE 0 1>
		       <PUT ,FANUCCI-CARD-TABLE 0 .RANK>
		       <PUT ,FANUCCI-CARD-TABLE 1 .SUIT>)>
		<TELL
<GET ,FANUCCI-PLAY-TABLE-LC .PLAY-NUM> " " <GET ,FANUCCI-RANK-TABLE .RANK>>
		<COND (<NOT <G? .RANK 11>>
		       <TELL " " <GET ,FANUCCI-SUIT-TABLE .SUIT>>)>
		<TELL ". He " <GET ,JESTER-PLAY-TABLE .NUM> " ">
		<FANUCCI-SCORE <GET ,JESTER-PLAY-SCORES .NUM>>)>>

<CONSTANT JESTER-PLAY-TABLE
	<PTABLE
"shrugs. \"Just a simple Borphee Bluff.\""
"smiles. \"A devilish Kovalli Hustle, don't you think?\""
"shudders. \"Babe would turn over in his grave if he could see my playing.\""
"looks satisfied. \"That ought to up the ante toward a Doubleton Duck.\""
"resists an urge to spike his cards. \"You fell for my Festeron Finesse! I get Honors!\""
"shouts, \"Whangdoogle! Four to the kitty! Minor ruff!\" and massages the resulting torn shoulder muscle."
"kicks himself. \"I should've revoked a Singleton in the third frame!\""
"snickers at you. \"Bet you didn't see that Segmented Shuffle coming!\""
"complains. \"Shy Openers! All I get are Shy Openers!\""
"applauds with delight. \"Zilbo's Half-Renege! I love it!\""
"sighs. \"I came so close to a Full Foozle Progression.\""
"produces two large mallard ducks out of thin air, thus Royal Bidding
his play."
"takes a third of the deck and burns it. \"Unlimited Singleton Bids for
the rest of the game!\""
"invokes the Grand Slam clause and reshuffles the deck. \"Slice and Call,\"
he claims."
"exhales a deep breath. \"I wasn't sure I'd have time for that Inside
Duo-Trick.\""
"gulps. \"I came close to having to invoke the Golden Fromp clause!\""
"scowls. \"An Unrejuvenated Slamboozle!\" To repent, he changes shape
to a hawk, then a milk cow, then a large carpenter ant, and finally back
to a jester. \"Full repentance; losses halved,\" he states.">>

<CONSTANT JESTER-PLAY-SCORES
	<PTABLE -10
	       -78
	       44
	       -21
	       -95
	       -31
	       22
	       -42
	       34
	       -56
	       -4
	       -28
	       -16
	       -37
	       -25
	       15
	       -22>>

<ROUTINE PICK-PLAY (X Y PTR "AUX" KEY TOP LEFT)
	 <PICINF-PLUS-ONE ,FANUCCI-MENU-LOC>
	 <SET TOP <GET ,PICINF-TBL 0>>
	 <SET LEFT <GET ,PICINF-TBL 1>>
         <BOLD-MOVE .X .Y .PTR>
	 <REPEAT ()
		 <SET KEY <INPUT 1>>
		 <COND (<OR <EQUAL? .KEY ,UP-ARROW>
			    <EQUAL? .KEY !\U !\u>>
			<COND (<EQUAL? .Y .TOP>
			       <CLEAR ,S-TEXT>
			       <SOUND 1>
			       <TELL ,ALREADY-AT "top row!">)
			      (T
			       <UNBOLD-MOVE .X .Y .PTR>
			       <SET Y <- .Y ,FONT-Y>>
			       <SET PTR <- .PTR 1>>
			       <BOLD-MOVE .X .Y .PTR>)>)
		       (<OR <EQUAL? .KEY ,DOWN-ARROW>
			    <EQUAL? .KEY !\D !\d>>
			<COND (<EQUAL? .Y <+ .TOP <* ,FONT-Y 2>>>
			       <CLEAR ,S-TEXT>
			       <SOUND 1>
			       <TELL ,ALREADY-AT "bottom row!">)
			      (T
			       <UNBOLD-MOVE .X .Y .PTR>
			       <SET Y <+ .Y ,FONT-Y>>
			       <SET PTR <+ .PTR 1>>
			       <BOLD-MOVE .X .Y .PTR>)>)
		       (<OR <EQUAL? .KEY ,LEFT-ARROW>
			    <EQUAL? .KEY !\L !\l>>
			<COND (<EQUAL? .X .LEFT>
			       <CLEAR ,S-TEXT>
			       <SOUND 1>
			       <TELL ,ALREADY-AT "left-most column!">)
			      (T
			       <UNBOLD-MOVE .X .Y .PTR>
			       <SET X <- .X <* ,FONT-X 13>>>
			       <SET PTR <- .PTR 3>>
			       <BOLD-MOVE .X .Y .PTR>)>)
		       (<OR <EQUAL? .KEY ,RIGHT-ARROW>
			    <EQUAL? .KEY !\R !\r>>
			<COND (<EQUAL? .X <+ .LEFT <* ,FONT-X 52>>>
			       <CLEAR ,S-TEXT>
			       <SOUND 1>
			       <TELL ,ALREADY-AT "right-most column!">)
			      (T
			       <UNBOLD-MOVE .X .Y .PTR>
			       <SET X <+ .X <* ,FONT-X 13>>>
			       <SET PTR <+ .PTR 3>>
			       <BOLD-MOVE .X .Y .PTR>)>)
		       (<EQUAL? .KEY 10 13> ;"RETURN/ENTER key"
			<COND (<EQUAL? <PLAY-SELECTED .PTR> T> ;"resign"
			       <RTRUE>)
			      (T
			       <UNBOLD-MOVE .X .Y .PTR>
			       <RFALSE>)>)
		       (T
			<CLEAR ,S-TEXT>
			<SOUND 1>
			<TELL
"Use the arrow keys to highlight a play, or hit RETURN/ENTER to select
the currently highlighted play.">)>>>

<ROUTINE UNBOLD-MOVE (X Y PTR)
	 <SCREEN ,S-WINDOW>
	 <CURSET .Y <- .X 1>>
	 <TELL " " <GET ,FANUCCI-PLAY-TABLE .PTR>>
	 <SCREEN ,S-TEXT>>

<ROUTINE BOLD-MOVE (X Y PTR)
	 <SCREEN ,S-WINDOW>
	 <CURSET .Y <- .X 1>>
	 <HLIGHT ,H-BOLD>
	 <TELL ">" <GET ,FANUCCI-PLAY-TABLE .PTR>>
	 <HLIGHT ,H-NORMAL>
	 <SCREEN ,S-TEXT>>

<ROUTINE PLAY-SELECTED (PTR "AUX" CNT X NUM)
	 <COND (<EQUAL? .PTR 14> ;"resign"
		<CLEAR ,S-TEXT>
		<TELL "\"W">
		<COND (<G? ,FANUCCI-PLAYS 5>
		       <TELL "he">)
		      (T
		       <TELL "o">)>
		<TELL "w!\" says the jester. \"">
		<COND (<G? ,FANUCCI-PLAYS 5>
		       <TELL
"You really had me on the ropes at a few points there!\"">)
		      (T
		       <TELL
"I wasn't expecting such an early resignation! I'm amazed by my own
Fanucci prowess!\"">)>
		<RTRUE>)
	       (<EQUAL? .PTR 13> ;"cheat"
		<COND (<PROB 50>
		       <CHEAT-RESULT ,CHEAT-WINS>)
		      (T
		       <CHEAT-RESULT ,CHEAT-LOSSES>)>)
	       (<EQUAL? .PTR 0> ;"draw"
		<SET CNT 0>
		<REPEAT ()
			<COND (<EQUAL? <GET ,FANUCCI-CARD-TABLE .CNT> 0>
			       <PUT ,DRAW-CARDS-TABLE </ .CNT 2> 1>
			       <PICK-RANK .CNT>
			       <PUT ,FANUCCI-CARD-TABLE
				    <+ .CNT 1> <RANDOM 15>>
			       <CLEAR ,S-TEXT>
			       <TELL "You draw ">
			       <PRINT-CARD-NAME .CNT>
			       <TELL ".">
			       <RETURN>)
			      (<EQUAL? .CNT 8>
			       <CLEAR ,S-TEXT>
			       <TELL
"The jester snickers. \"You've no empty slot; you forfeit your shot!\"">
			       <RETURN>)>
			<SET CNT <+ .CNT 2>>>)
	       (<AND <EQUAL? <GET ,FANUCCI-CARD-TABLE 2> 0>
		     <EQUAL? <GET ,FANUCCI-CARD-TABLE 4> 0>
		     <EQUAL? <GET ,FANUCCI-CARD-TABLE 6> 0>
		     <EQUAL? <GET ,FANUCCI-CARD-TABLE 8> 0>>
		<CLEAR ,S-TEXT>
		<SOUND 1>
		<TELL
"You can't " <GET ,FANUCCI-PLAY-TABLE-LC .PTR>
" just now; you have no drawn cards!">)
	       (T
		<CLEAR ,S-TEXT>
		<TELL
"Use your mouse or type the number of the card you'd like to "
<GET ,FANUCCI-PLAY-TABLE-LC .PTR> ".">
		<REPEAT ()
		       <SET X <INPUT 1>>
		       <COND (<OR <AND <EQUAL? .X !\1>
				       <EQUAL? <GET ,FANUCCI-CARD-TABLE 2> 0>>
				  <AND <EQUAL? .X !\2>
				       <EQUAL? <GET ,FANUCCI-CARD-TABLE 4> 0>>
				  <AND <EQUAL? .X !\3>
				       <EQUAL? <GET ,FANUCCI-CARD-TABLE 6> 0>>
				  <AND <EQUAL? .X !\4>
				       <EQUAL? <GET ,FANUCCI-CARD-TABLE 8> 0>>>
			      <CLEAR ,S-TEXT>
			      <SOUND 1>
			      <TELL
"You can't " <GET ,FANUCCI-PLAY-TABLE-LC .PTR>
" that card; it hasn't been drawn yet!">)
			     (<EQUAL? .X !\1>
			      <SET X 2>
			      <RETURN>)
			     (<EQUAL? .X !\2>
			      <SET X 4>
			      <RETURN>)
			     (<EQUAL? .X !\3>
			      <SET X 6>
			      <RETURN>)
			     (<EQUAL? .X !\4>
			      <SET X 8>
			      <RETURN>)
			     (T
			      <CLEAR ,S-TEXT>
			      <SOUND 1>
			      <TELL ,TYPE-A-NUMBER "4.">)>>
		<SET NUM <MOD <* <GET ,FANUCCI-CARD-TABLE .X>
				 <GET ,FANUCCI-CARD-TABLE <+ .X 1>>
				 .PTR> 37>>
		<COND (<EQUAL? .PTR 5> ;"undertrump"
		       <COND (<G? ,FANUCCI-WIN-COUNT 0>
			      <SETG FANUCCI-WIN-COUNT
				    <+ ,FANUCCI-WIN-COUNT 1>>
			      <COND (<EQUAL? ,FANUCCI-WIN-COUNT 3>
				     ;"go straight to win-text"
				     <RFALSE>)>)
			     (<AND <EQUAL? <GET ,JESTER-LAST-CARD 0>
					   ,TREBLED-RANK>
				   <EQUAL? <GET ,JESTER-LAST-CARD 1>
					   ,FROMP-SUIT>>
			      <SETG FANUCCI-WIN-COUNT 1>)>)
		      (T
		       <SETG FANUCCI-WIN-COUNT 0>)>
		<COND (<EQUAL? <GET ,FANUCCI-SCORES .NUM> 0>
		       <SETG FANUCCI-WIN-COUNT 0>
		       ;"else you can win Fanucci after this response"
		       <TELL
"   The jester is outraged! \"You can't "
<GET ,FANUCCI-PLAY-TABLE-LC .PTR> " ">
		       <PRINT-CARD-NAME .X>
		       <COND (<PROB 6>
			      <TELL " when ">
			      <PRINT-CARD-NAME 0>
			      <TELL " is showing on the Discard Pile!">)
			     (T
			      <TELL " " <GET ,JESTER-RESPONSES .NUM>>)>)
		      (T
		       <CLEAR ,S-TEXT>
		       <TELL "You " <GET ,FANUCCI-PLAY-TABLE-LC .PTR> " ">
		       <PRINT-CARD-NAME .X>
		       <TELL ". The jester " <GET ,JESTER-RESPONSES .NUM> " ">
		       <FANUCCI-SCORE <GET ,FANUCCI-SCORES .NUM>>
		       <COND (<EQUAL? .PTR 1> ;"move card to discard pile"
			      <PUT ,DRAW-CARDS-TABLE 0 1>
			      <PUT ,FANUCCI-CARD-TABLE 0
				   <GET ,FANUCCI-CARD-TABLE .X>>
			      <PUT ,FANUCCI-CARD-TABLE 1
				   <GET ,FANUCCI-CARD-TABLE <+ .X 1>>>)>
		       <PUT ,DRAW-CARDS-TABLE </ .X 2> 1>
		       <PUT ,FANUCCI-CARD-TABLE .X 0>
		       <PUT ,FANUCCI-CARD-TABLE <+ .X 1> 0>)>)>
	 <RFALSE>>

<ROUTINE PRINT-CARD-NAME (CNT)
	 <TELL <GET ,FANUCCI-RANK-TABLE <GET ,FANUCCI-CARD-TABLE .CNT>>>
	 <COND (<L? <GET ,FANUCCI-CARD-TABLE .CNT> 12>
		<TELL " " <GET ,FANUCCI-SUIT-TABLE
			   <GET ,FANUCCI-CARD-TABLE <+ .CNT 1>>>>)>>

<CONSTANT FANUCCI-PLAY-TABLE
      ;"space after word overwrites pixels left by bold-word on certain micros"
	<PTABLE "DRAW "
	        "DISCARD "
		"DIVIDE "
		"REVERSE "
	        "TRUMP "
	        "UNDERTRUMP "
		"COMBINE "
	        "PASS "
	        "OVERPASS "
		"SINGLE-PLAY "
	        "DOUBLE-PLAY "
	        "MUTTONATE "
		"IONIZE "
	        "CHEAT "
	        "RESIGN ">>

<CONSTANT FANUCCI-PLAY-TABLE-LC
       <PTABLE "draw"
	       "discard"
	       "divide"
	       "reverse"
	       "trump"
	       "undertrump"
	       "combine"
	       "pass"
	       "overpass"
	       "single-play"
	       "double-play"
	       "muttonate"
	       "ionize"
	       "cheat"
	       "resign">>

<CONSTANT RANK-PIC-TBL
      <PTABLE ;0 <> ;"unused"
	      ;1 FANUCCI-4
	      ;2 FANUCCI-5
	      ;3 FANUCCI-6
	      ;4 FANUCCI-7
	      ;5 FANUCCI-8
	      ;6 FANUCCI-9
	      ;7 FANUCCI-0
	      ;8 FANUCCI-INFINITY
	      ;9 FANUCCI-1
	     ;10 FANUCCI-2
	     ;11 FANUCCI-3>>

<CONSTANT RANK-REV-TBL
      <PTABLE ;0 <> ;"unused"
	      ;1 FANUCCI-RV-4
	      ;2 FANUCCI-RV-5
	      ;3 FANUCCI-RV-6
	      ;4 FANUCCI-RV-7
	      ;5 FANUCCI-RV-8
	      ;6 FANUCCI-RV-9
	      ;7 FANUCCI-RV-0
	      ;8 FANUCCI-RV-INFINITY
	      ;9 FANUCCI-RV-1
	     ;10 FANUCCI-RV-2
	     ;11 FANUCCI-RV-3>>

<CONSTANT FANUCCI-RANK-TABLE
       <PTABLE ;0 <> ;"unused"
	      ;1 "the Four of"
	      ;2 "the Five of"
	      ;3 "the Six of"
	      ;4 "the Seven of"
	      ;5 "the Eight of"
	      ;6 "the Nine of"
	      ;7 "the Naught of"
	      ;8 "Infinite"
	      ;9 "Singled"
	     ;10 "Doubled"
	     ;11 "Trebled"
	     ;12 "Granola"
	     ;13 "the Lobster"
	     ;14 "the Snail"
	     ;15 "the Jester"
	     ;16 "Time"
	     ;17 "Light"
	     ;18 "Beauty"
	     ;19 "Death"
	     ;20 "the Grue">>

<CONSTANT SUIT-PIC-TBL
       <PTABLE ;0 <> ;"unused"
	       ;1 FANUCCI-INKBLOTS
	       ;2 FANUCCI-PLUNGERS
	       ;3 FANUCCI-BUGS
	       ;4 FANUCCI-ZURFS
	       ;5 FANUCCI-EARS
	       ;6 FANUCCI-TOPS
	       ;7 FANUCCI-RAIN
	       ;8 FANUCCI-HIVES
	       ;9 FANUCCI-FACES
	      ;10 FANUCCI-MAZES
	      ;11 FANUCCI-LAMPS
	      ;12 FANUCCI-TIME
	      ;13 FANUCCI-BOOKS
	      ;14 FANUCCI-SCYTHES
	      ;15 FANUCCI-FROMPS>>

<CONSTANT SUIT-REV-TBL
       <PTABLE ;0 <> ;"unused"
	       ;1 FANUCCI-RV-INKBLOTS
	       ;2 FANUCCI-RV-PLUNGERS
	       ;3 FANUCCI-RV-BUGS
	       ;4 FANUCCI-RV-ZURFS
	       ;5 FANUCCI-RV-EARS
	       ;6 FANUCCI-RV-TOPS
	       ;7 FANUCCI-RV-RAIN
	       ;8 FANUCCI-RV-HIVES
	       ;9 FANUCCI-RV-FACES
	      ;10 FANUCCI-RV-MAZES
	      ;11 FANUCCI-RV-LAMPS
	      ;12 FANUCCI-RV-TIME
	      ;13 FANUCCI-RV-BOOKS
	      ;14 FANUCCI-RV-SCYTHES
	      ;15 FANUCCI-RV-FROMPS>>

<CONSTANT FANUCCI-SUIT-TABLE
	  <PTABLE ;0 <> ;"unused"
		  ;1 "Inkblots"
		  ;2 "Plungers"
		  ;3 "Bugs"
		  ;4 "Zurfs"
		  ;5 "Ears"
		  ;6 "Tops"
		  ;7 "Rain"
		  ;8 "Hives"
		  ;9 "Faces"
		 ;10 "Mazes"
		 ;11 "Lamps"
		 ;12 "Time"
		 ;13 "Books"
		 ;14 "Scythes"
		 ;15 "Fromps">>

<CONSTANT FANUCCI-CARD-TABLE
	<TABLE <> <> ;"discard card"
	       <> <> ;"card 1"
	       <> <> ;"card 2"
	       <> <> ;"card 3"
	       <> <> ;"card 4">>

<GLOBAL YOUR-SCORE 0>

<GLOBAL JESTER-SCORE 0>

<GLOBAL FANUCCI-PLAYS 0>

<ROUTINE CHEAT-RESULT (TBL "AUX" CNT X PTS)
	 <SET CNT <GET .TBL 0>>
	 <SET X <- <* <RANDOM .CNT> 2> 1>>
	 <SET PTS <GET .TBL <+ .X 1>>>
	 <CLEAR ,S-TEXT>
	 <TELL <GET .TBL .X> " ">
	 <FANUCCI-SCORE .PTS>>

<ROUTINE FANUCCI-SCORE (PTS)
	 <COND (<G? .PTS 0>
		<COND (<AND <PROB </ ,YOUR-SCORE 10>>
			    <G? ,JESTER-SCORE .PTS>>
		       <SETG JESTER-SCORE <- ,JESTER-SCORE .PTS>>
		       <TELL "The jester loses">)
		      (T
		       <SETG YOUR-SCORE <+ ,YOUR-SCORE .PTS>>
		       <TELL "You gain">)>)
	       (T
		<SET PTS <* .PTS -1>>
		<COND (<AND <PROB </ ,JESTER-SCORE 10>>
		       	    <G? ,YOUR-SCORE .PTS>>
		       <SETG YOUR-SCORE <- ,YOUR-SCORE .PTS>>
		       <TELL "You lose">)
		      (T
		       <SETG JESTER-SCORE <+ ,JESTER-SCORE .PTS>>
		       <TELL "The jester gains">)>)>
	 <TELL " " N .PTS " points.">>

<CONSTANT CHEAT-WINS
	<PTABLE 3
"You catch the jester looking out the window, and take the opportunity to
alter the scores."
45
"You distract the jester by faking a muscle cramp."
23
"You successfully slip a card out of your sleeve."
19>>

<CONSTANT CHEAT-LOSSES
	<PTABLE 3
"The jester seems to doze off for a moment, and you try to take advantage by
fudging the scores. However, the jester stirs, and in your haste you help the
jester instead of yourself!"
-60
"The jester catches you marking the cards, and assesses a stiff penalty."
-47
"You substitute a card from the middle of the deck, but the new card places
you in an even worse position!"
-33>>

<CONSTANT JESTER-RESPONSES
	<PTABLE
"during the middle third of Mumberber!\""
"before a New Sun!\""
"in a two-person game!\""
"cries, \"Daring move!\""
"looks bored. \"The old Oddzio Gambit.\""
"says, \"A gutsy play!\""
"applauds. \"A brilliant Festeron Feint!\""
"sneers. \"A transparent maneuver.\""
"shakes his head. \"A poorly executed Antharian Attack.\""
"exclaims, \"A skillful finesse!\""
"is obviously impressed. \"A spectacular Bloodworm Defense!\""
"sniffs. \"A weak response.\""
"smiles mysteriously. \"An unusual Balsawood Convention!\""
"looks impressed. \"That was a stroke of genius!\""
"taps his fingers impatiently. \"A typical Egreth Convention.\""
"whispers, \"Crude, but effective.\""
"tips his hat to you. \"A well-executed Zilbo Standard!\""
"looks unimpressed. \"Just a lucky stroke!\""
"smirks. \"A poorly timed Forborn Chisel, wouldn't you say?\""
"laughs. \"That was a sign of panic on your part, if you ask me.\""
"peruses your move. \"Ah, yes. The Accardi Variation. I haven't seen that one in a while.\""
"bows his head with respect. \"You're a regular Fanuccimeister, eh?\""
"salutes you. \"A well-timed Frotz Factor! Bravo!\""
"scratches his head. \"A thoroughly mystifying maneuver.\""
"yawns. \"The dependable Zibble Ploy.\""
"laughs derisively. \"An amateurish blunder!\""
"says, \"A classic Frotzen Ploy.\""
"shrugs. \"Oh, well... If people never made mistakes, they wouldn't put
erasers on pencils...\""
"looks at you with scorn. \"A lukewarm Porridge Variation.\""
"blinks. Then blinks again. \"Now I've seen EVERYTHING!\""
"nods knowingly. \"An obvious Fublian Gambit.\""
"offers you some advice. \"Remember the words of Leo 'the Lip' Flathead: 'Nice
guys finish last.'\""
"under Miznian rules!\""
"without a note from your doctor!\""
"except after a third-level Hamster Substitution!\""
"in a coastal city without first eating the rind of a burnt casaba melon!\""
"chortles gratingly. \"Who taught you how to play cards? Vanna Flathead?\"">>

<CONSTANT FANUCCI-SCORES
	<PTABLE 0
	       0
	       0
	       24
	       10
	       28
	       41
	       -12
	       -81
	       37
	       54
	       -29
	       17
	       66
	       -35
	       14
	       18
	       13
	       -79
	       -41
	       -15
	       60
	       64
	       -99
	       10
	       -73
	       12
	       -55
	       -20
	       -77
	       -11
	       -14
	       0
	       0
	       0
	       0
	       -38>>

<OBJECT BROOM
	(LOC LOCAL-GLOBALS)
	(DESC "broom")
	(SYNONYM BROOM)
	(SIZE 10)
	(FLAGS TAKEBIT)>

<ROOM SANDBAR
      (LOC ROOMS)
      (DESC "Sandbar")
      (REGION "Port Foozle")
      (LDESC
"You are on a wide sandbar, which almost certainly vanishes at high tide.
The only ways off the sandbar are to the north and south.")
      (NORTH TO FISHING-VILLAGE)
      (SOUTH TO QUILBOZZA-BEACH)
      (FLAGS RLANDBIT ONBIT OUTSIDEBIT)
      (SYNONYM SANDBAR)
      (GLOBAL FLATHEAD-OCEAN)
      (MAP-LOC <PTABLE PORT-FOOZLE-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-2>)>

<ROOM QUILBOZZA-BEACH
      (LOC ROOMS)
      (DESC "Quilbozza Beach")
      (REGION "Port Foozle")
      (LDESC
"You are on a wide beach of fine pinkish-white sand. The ocean stretches
west to the horizon. Due to the low tide, it looks as if you could travel
north. In addition, tunnels open to the northeast and southeast.")
      (NORTH TO SANDBAR)
      (NE TO SALTY-SMELL)
      (SE TO WARNING-ROOM)
      (FLAGS RLANDBIT ONBIT OUTSIDEBIT)
      (SYNONYM BEACH)
      (ADJECTIVE QUILBOZZA)
      (GLOBAL FLATHEAD-OCEAN)
      (RESEARCH
"\"Quilbozza, just south of Port Foozle, is considered the nicest beachfront
in the eastlands, if not all of Quendor.\"")
      (MAP-LOC <PTABLE PORT-FOOZLE-MAP-NUM MAP-GEN-Y-6 MAP-GEN-X-2>)
      (ICON QUILBOZZA-BEACH-ICON)
      (ACTION QUILBOZZA-BEACH-F)>

<ROUTINE QUILBOZZA-BEACH-F (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-END>
		     <PROB 40>>
		<TELL "   A wave crashes against the beach." CR>)>>

<ROOM WARNING-ROOM
      (LOC ROOMS)
      (DESC "Warning Room")
      (REGION "Port Foozle")
      (LDESC
"You are in a tunnel which curves northwest and northeast. The tunnel rises
at the latter end, and passes a large, eye-catching sign.")
      (NW TO QUILBOZZA-BEACH)
      (DOWN TO QUILBOZZA-BEACH)
      (NE TO ROOM-OF-THREE-DOORS)
      (UP TO ROOM-OF-THREE-DOORS)
      (FLAGS RLANDBIT UNDERGROUNDBIT)
      (GLOBAL SIGN)
      (ICON WARNING-ROOM-ICON)
      (MAP-LOC <PTABLE PORT-FOOZLE-MAP-NUM MAP-GEN-Y-7 MAP-GEN-X-3>)>

<ROOM ROOM-OF-THREE-DOORS
      (LOC ROOMS)
      (DESC "Room of Three Doors")
      (REGION "Port Foozle")
      (SW TO WARNING-ROOM)
      (OUT TO WARNING-ROOM)
      (IN SORRY "Pick a door... any door...")
      (FLAGS RLANDBIT UNDERGROUNDBIT)
      (MAP-LOC <PTABLE PORT-FOOZLE-MAP-NUM MAP-GEN-Y-6 MAP-GEN-X-4>)
      (ICON ROOM-OF-3-DOORS-ICON)
      (ACTION ROOM-OF-THREE-DOORS-F)>

<GLOBAL VERITASSI-DOOR <>>

<GLOBAL PREVARICON-DOOR <>>

<GLOBAL WISHYFOO-DOOR <>>

<GLOBAL WRITING-CHANGED <>>

<ROUTINE ROOM-OF-THREE-DOORS-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Before you are three doors: left, center, and right. All three doors are
closed, and have writing on them. In addition, a tunnel leads southwest.">)
	       (<AND <EQUAL? .RARG ,M-END>
		     ,WRITING-CHANGED>
		<SETG WRITING-CHANGED <>>
		<TELL
"   The writing on the doors appears to have changed since the last time
you were here." CR>)
	       (<EQUAL? .RARG ,M-ENTER>
		<COND (<FSET? ,ROOM-OF-THREE-DOORS ,TOUCHBIT>
		       <SETG WRITING-CHANGED T>)>
		<COND (<PROB 33>
		       <SETG VERITASSI-DOOR ,LEFT-DOOR>
		       <COND (<PROB 50>
			      <SETG PREVARICON-DOOR ,RIGHT-DOOR>
			      <SETG WISHYFOO-DOOR ,CENTER-DOOR>)
			     (T
			      <SETG PREVARICON-DOOR ,CENTER-DOOR>
			      <SETG WISHYFOO-DOOR ,RIGHT-DOOR>)>)
		      (<PROB 50>
		       <SETG VERITASSI-DOOR ,RIGHT-DOOR>
		       <COND (<PROB 50>
			      <SETG PREVARICON-DOOR ,LEFT-DOOR>
			      <SETG WISHYFOO-DOOR ,CENTER-DOOR>)
			     (T
			      <SETG PREVARICON-DOOR ,CENTER-DOOR>
			      <SETG WISHYFOO-DOOR ,LEFT-DOOR>)>)
		      (T
		       <SETG VERITASSI-DOOR ,CENTER-DOOR>
		       <COND (<PROB 50>
			      <SETG PREVARICON-DOOR ,LEFT-DOOR>
			      <SETG WISHYFOO-DOOR ,RIGHT-DOOR>)
			     (T
			      <SETG PREVARICON-DOOR ,RIGHT-DOOR>
			      <SETG WISHYFOO-DOOR ,LEFT-DOOR>)>)>)>>

<OBJECT LEFT-DOOR
	(LOC ROOM-OF-THREE-DOORS)
	(DESC "left door")
	(SYNONYM DOOR DOORS WRITING)
	(ADJECTIVE LEFT FIRST)
	(FLAGS DOORBIT NDESCBIT)
	(ACTION THREE-DOORS-F)>

<OBJECT RIGHT-DOOR
	(LOC ROOM-OF-THREE-DOORS)
	(DESC "right door")
	(SYNONYM DOOR DOORS WRITING)
	(ADJECTIVE RIGHT THIRD)
	(FLAGS DOORBIT NDESCBIT)
	(ACTION THREE-DOORS-F)>

<OBJECT CENTER-DOOR
	(LOC ROOM-OF-THREE-DOORS)
	(DESC "center door")
	(SYNONYM DOOR DOORS WRITING)
	(ADJECTIVE CENTER MIDDLE SECOND)
	(FLAGS DOORBIT NDESCBIT)
	(ACTION THREE-DOORS-F)>

<ROUTINE THREE-DOORS-F ()
	 <COND (<VERB? READ>
		<TELL
"\"Attention:|
1. This door does not lead to Prevaricon territory.|
2. The ">
		<COND (<PRSO? ,VERITASSI-DOOR>
		       <TELL D ,PREVARICON-DOOR " does not lead to Wishyfoo">)
		      (<PRSO? ,PREVARICON-DOOR>
		       <TELL D ,WISHYFOO-DOOR " does not lead to Wishyfoo">)
		      (T
		       <TELL D ,VERITASSI-DOOR " does not lead to Veritassi">)>
		<TELL " territory.\"" CR>)
	       (<VERB? OPEN ENTER>
		<TELL
"As you open it, a strong draft sucks you through the doorway. You stumble
down a steep incline" ,ELLIPSIS>
		<COND (<PRSO? ,WISHYFOO-DOOR>
		       <GOTO ,WISHYFOO-TERRITORY>)
		      (T
		       <HLIGHT ,H-BOLD>
		       <COND (<PRSO? ,VERITASSI-DOOR>
			      <TELL "Veritassi">)
			     (T
			      <TELL "Prevaricon">)>
		       <TELL " Territory" CR>
		       <HLIGHT ,H-NORMAL>
		       <JIGS-UP
"   You are immediately fed to ravenous hellhounds.">)>)>>

<ROOM WISHYFOO-TERRITORY
      (LOC ROOMS)
      (DESC "Wishyfoo Territory")
      (REGION "Port Foozle")
      (LDESC
"You are in a medium-sized cavern, which appears to have been recently
occupied. The steep passage which brought you here leads southwest. Also,
a passage just large enough to fit through leads downward.")
      (SW SORRY "The passage is too steep to climb back.")
      (UP SORRY "The passage is too steep to climb back.")
      (DOWN TO FORK)
      (FLAGS RLANDBIT UNDERGROUNDBIT)
      (VALUE 6)
      (MAP-LOC <PTABLE PORT-FOOZLE-MAP-NUM WISHYFOO-ICON-LOC MAP-GEN-X-4>)
      (ICON WISHYFOO-ICON)>

<OBJECT SHOVEL
	(LOC WISHYFOO-TERRITORY)
	(DESC "shovel")
	(SYNONYM SHOVEL)
	(SIZE 20)
	(FLAGS TAKEBIT)>