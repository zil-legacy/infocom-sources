"VILLAGE for

			       ZORK ZERO
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<ROOM OUTER-BAILEY
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Outer Bailey")
      (SE TO DRAWBRIDGE IF DRAWBRIDGE IS OPEN ELSE
       "The drawbridge isn't down.")
      (SW TO GARRISON)
      (NE TO BEND)
      (NW TO PERIMETER-WALL)
      (FLAGS RLANDBIT OUTSIDEBIT ONBIT)
      (SYNONYM BAILEY)
      (ADJECTIVE OUTER)
      (GLOBAL DRAWBRIDGE MOAT)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-3 MAP-GEN-X-2>)
      (ICON OUTER-BAILEY-ICON)
      (ACTION OUTER-BAILEY-F)>

<ROUTINE OUTER-BAILEY-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This open area is a rolling meadow extending from the moat to the distant
perimeter fortifications. A drawbridge ">
		<COND (<FSET? ,DRAWBRIDGE ,OPENBIT>
		       <TELL "leads over the">)
		      (T
		       <TELL "is raised, leaving an impassable">)>
		<TELL
" moat to the southeast, and roads lead northeast, southwest, and
northwest.">)>>

<OBJECT TREE-STUMP
	(LOC OUTER-BAILEY)
	(DESC "tree stump")
	(LDESC
"A mighty, rotting tree stump spreads its roots across the bailey.")
	(SYNONYM STUMP)
	(ADJECTIVE LARGE TREE WEATHERED)
	(CAPACITY 100)
	(FLAGS CONTBIT VEHBIT SURFACEBIT OPENBIT SEARCHBIT)
	(ACTION TREE-STUMP-F)>

<GLOBAL JUMP-X 99> ;"0 means you're on the stump, 99 means you're anywhere"

<GLOBAL JUMP-Y 99> ;"0 means you're on the stump, 99 means you're anywhere"

<ROUTINE TREE-STUMP-F ("OPTIONAL" (VARG <>))
	 <COND (.VARG
		<RFALSE>)
	       (<VERB? EXAMINE>
		<TELL <GETP ,TREE-STUMP ,P?LDESC>>
		<COND (<FIRST? ,TREE-STUMP>
		       <TELL " ">
		       <RFALSE>)
		      (T
		       <CRLF>)>)
	       (<VERB? GET-NEAR>
		<PERFORM ,V?ENTER ,TREE-STUMP>
		<RTRUE>)
	       (<AND <VERB? LISTEN>
		     ,PLANT-TALKER>
		<TELL "The stump is dead and silent." CR>)
	       (<VERB? ENTER> ;"see V-LEAP"
		<SETG JUMP-X 0>
		<SETG JUMP-Y 0>
		<RFALSE>)
	       (<VERB? EXIT>
		<SETG JUMP-X 99>
		<SETG JUMP-Y 99>
		<RFALSE>)
	       (<VERB? LOOK-UNDER TAKE RAISE>
		<TELL "100 men couldn't uproot this stump!" CR>)>>

<OBJECT TREASURE-CHEST
	(LOC LOCAL-GLOBALS)
	(DESC "treasure chest")
	(SYNONYM CHEST)
	(ADJECTIVE TREASURE)
	(FLAGS TAKEBIT CONTBIT SEARCHBIT)
	(SIZE 25)
	(CAPACITY 50)>

<OBJECT CROWN
	(LOC TREASURE-CHEST)
	(DESC "gaudy crown")
	(SYNONYM CROWN)
	(ADJECTIVE GAUDY)
	(VALUE 12)
	(FLAGS TAKEBIT MAGICBIT WEARBIT)>

<ROOM PERIMETER-WALL
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Perimeter Wall")
      (SE TO OUTER-BAILEY)
      (NW PER WEST-OF-WHITE-HOUSE-ENTER-F)
      (OUT PER WEST-OF-WHITE-HOUSE-ENTER-F)
      (FLAGS RLANDBIT OUTSIDEBIT ONBIT)
      (ICON PERIMETER-WALL-ICON)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-2 MAP-GEN-X-1>)
      (ACTION PERIMETER-WALL-F)>

<ROUTINE PERIMETER-WALL-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Before you rises the massive stone wall which forms the first line of
defense for the castle grounds. To the northwest, the huge oak gates ">
		<COND (<FSET? ,OUTER-GATE ,OPENBIT>
		       <TELL "lie wide open, revealing dense forest beyond!">)
		      (T
		       <TELL
"are closed and reinforced, forming an impassable barrier across the road from
the southeast.">)>)>>

<ROUTINE WEST-OF-WHITE-HOUSE-ENTER-F ()
	 <COND (<FSET? ,OUTER-GATE ,OPENBIT>
		<INC-SCORE 30>
		<TELL
"You dive through the doors as the castle begins it final tremors! Landing on
soft grass, you roll to a stop, and turn to see the castle's final moments.
But, oddly, though it is collapsing, it doesn't seem to be getting destroyed.
Instead, it is merely shrinking, shrivelling... You rub your eyes in disbelief,
as the once mighty castle transforms itself into ever tinier structures. At
long last there is stillness, and the dust begins to clear" ,ELLIPSIS>
		,WEST-OF-HOUSE)
	       (<AND <IN? ,NW-SE-PASSAGE ,HERE>
		     <EQUAL? ,NW-SE-PASSAGE-DIR ,P?NW>>
		<CANT-GO>
		<RFALSE>) ;"you walk down the Magic Passage..."
	       (T
		<THIS-IS-IT ,OUTER-GATE>
		<DO-FIRST "open the gate">
		<RFALSE>)>>

<OBJECT OUTER-GATE
	(LOC PERIMETER-WALL)
	(DESC "outer gate")
	(SYNONYM GATE DOOR DOORS)
	(ADJECTIVE OUTER INCREDIBLY LARGE IRON-REINFORCED OAKEN)
	(FLAGS NDESCBIT DOORBIT VOWELBIT)
	(ACTION OUTER-GATE-F)>

<ROUTINE OUTER-GATE-F ()
	 <COND (<VERB? OPEN>
		<TELL
"It would take the power of a wizard to open these massive doors." CR>)>>

<GLOBAL END-GAME-COUNTER 0>

<ROUTINE I-END-GAME ()
	 <SETG END-GAME-COUNTER <+ ,END-GAME-COUNTER 1>>
	 <COND (<EQUAL? ,END-GAME-COUNTER 12>
		<JIGS-UP
"   The castle buildings are collapsing around you. No, \"shrinking and
changing\" would be more accurate... stone becoming wood... walls and
ceilings rushing in toward you... but before you can witness the final form of
this amazing metamorphosis, you are transformed into a large oriental rug.">)
	       (<EQUAL? ,END-GAME-COUNTER 11>
		<TELL
"   A great rumble fills the air, and the buildings around you teeter
like drunken dancers!" CR>)
	       (<EQUAL? ,END-GAME-COUNTER 9>
		<TELL
"   Boulders of rubble roll past, threatening to crush you!" CR>)
	       (<EQUAL? ,END-GAME-COUNTER 6>
		<TELL
"   As the grounds continue to shake, a multitude of rats well up from
within and flee toward the perimeter wall." CR>)
	       (<EQUAL? ,END-GAME-COUNTER 3>
		<TELL "   The ">
		<COND (<FSET? ,HERE ,OUTSIDEBIT>
		       <TELL "ground">)
		      (T
		       <TELL "floor">)>
		<TELL
" rolls and shudders, making it difficult to stay on your feet." CR>)>>

<ROOM WEST-OF-HOUSE
      (LOC ROOMS)
      (DESC "West of House")
      (REGION "(formerly) Flatheadia")
      (LDESC
"You are standing in an open field west of a white house, with a
boarded front door.|
   There is a small mailbox here.")
      (FLAGS RLANDBIT ONBIT OUTSIDEBIT)
      (ACTION WEST-OF-HOUSE-F)>

<ROUTINE WEST-OF-HOUSE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<UPDATE-STATUS-LINE>)
	       (<EQUAL? .RARG ,M-END>
		<CRLF>
		<HIT-ANY-KEY>
		<CLEAR 0>
		<CRLF>
		<MARGINAL-PIC ,EPILOGUE-LETTER <>>
		<TELL
"s you stare dumbfounded at the white house, the jester appears, laughing as
though at some supreme trick. Then, a low moaning wind begins to blow, and
slowly, ever so slowly, his appearance shifts, until you see before you a
wizard of incredible age and obvious power. His hoary visage stirs an ancient
ancestral memory. He speaks in a new voice, tired but commanding of instant
respect. \"I am Megaboz,\" he states, and your skin tingles at the presence
of a legend.|
   \"Yes, I still live. I have waited a long time for this day; to meet the
one who would guard after I am gone.|
   \"The Great Underground Empire is no more; but Quendor remains. The white
house will stand as a warning and reminder of the excesses of the Flatheads.
Some day, a new Empire may rise; you -- and your successors -- shall watch
over the land, and ensure that future Empire be benevolent. Henceforth, you
shall be known as Dungeon Master.|
   \"As promised by Decree, half the wealth of the kingdom is yours!\" Your
mind is suddenly filled with images of a vast underground Treasury, piled
with unfathomable wealth. But the image is tempered by the ironic knowledge
that you will never have use for such wealth. As the image fades, you hear
tinkling bells and the voice of the jester/Megaboz: \"Well, I'm outta here!
Over to you, Dungeon Master!\" You find yourself alone, left to ponder the
years ahead, long years of keeping watch over Quendor and searching, ever
searching, for your successor" ,ELLIPSIS>
		<FINISH>)>>

<ROOM GARRISON
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Garrison")
      (LDESC
"This is where the castle's army was quartered. The garrison fell into
disuse as all known lands fell under the rule of the Flatheads; the army
had little to do except quell an occasional tax revolt. In fact, the only
evidence of the garrison is a rusty locker. A road leads northeast.")
      (NE TO OUTER-BAILEY)
      (OUT TO OUTER-BAILEY)
      (FLAGS RLANDBIT ONBIT)
      (SYNONYM GARRISON)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-4 MAP-GEN-X-1>)
      (ICON GARRISON-ICON)>

<OBJECT LOCKER
	(LOC GARRISON)
	(DESC "locker")
	(SYNONYM LOCKER)
	(ADJECTIVE RUSTY)
	(CAPACITY 100)
	(FLAGS CONTBIT SEARCHBIT NDESCBIT)
	(ACTION LOCKER-F)>

<ROUTINE LOCKER-F ()
	 <COND (<AND <VERB? LOCK>
		     <PRSO? ,LOCKER>>
		<TELL "You don't have the right key." CR>)>>

<OBJECT POSTER
	(LOC LOCKER)
	(OWNER POSTER)
	(DESC "poster of Ursula Flathead")
	(SYNONYM POSTER URSULA FLATHEAD)
	(ADJECTIVE URSULA)
	(FLAGS TAKEBIT BURNBIT)
	(SIZE 2)
	(RESEARCH
"\"Ursula Flathead, the former Miss Miznia, has been called the 'Sex Goddess
of the GUE.' The editors would be hard-pressed to disagree with the phrase.\"")
	(ACTION POSTER-F)>

<ROUTINE POSTER-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The poster shows pin-up model Ursula Flathead (Miss Miznia, 878 GUE)
in a typical suggestive pose and minimal cover." CR>)
	       (<VERB? ROLL>
		<TELL
"You curl it into a tube, but as you let go it flattens again." CR>)>>

<OBJECT WEST-KEY
	(LOC LOCKER)
	(DESC "steel key")
	(SYNONYM KEY)
	(ADJECTIVE STEEL)
	(FLAGS TAKEBIT KEYBIT)
	(SIZE 2)>

<ROOM BEND
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Bend")
      (LDESC
"The road curves along the moat, turning southeast and southwest.")
      (SE TO VILLAGE-GATE)
      (SW TO OUTER-BAILEY)
      (FLAGS RLANDBIT OUTSIDEBIT ONBIT)
      (GLOBAL MOAT)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-2 MAP-GEN-X-3>)>

<ROOM VILLAGE-GATE
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Village Gate")
      (LDESC
"To the east, a stone arch forms the entrance to the castle's village. (The
village lies outside the castle proper but is still comfortably within the
outer perimeter wall.) The arch is flanked by two medium-sized elms, one more
gnarled than the other. The road passes under the arch; in the other direction,
it follows the moat to the northwest.")
      (NW TO BEND)
      (EAST TO SHADY-PARK)
      (FLAGS RLANDBIT OUTSIDEBIT ONBIT)
      (GLOBAL ARCH MOAT)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-3 MAP-GEN-X-4>)>

<OBJECT GNARLED-ELM
	(LOC VILLAGE-GATE)
	(DESC "gnarled elm tree")
	(SYNONYM TREE ELM)
	(ADJECTIVE GNARLED ELM)
	(FLAGS NDESCBIT PLANTBIT)
	(ACTION TREE-F)>

<OBJECT UNGNARLED-ELM
	(LOC VILLAGE-GATE)
	(DESC "ungnarled elm tree")
	(SYNONYM TREE ELM)
	(ADJECTIVE UNGNARLED ELM)
	(FLAGS NDESCBIT VOWELBIT PLANTBIT)
	(ACTION TREE-F)>

<ROOM SHADY-PARK
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Shady Park")
      (LDESC
"This grassy mall must have been a nice area at one time, but it is now
overgrown with weeds, and soiled by windblown litter. The shade comes from
a mighty elm which spreads its thick green branches over the park. A wide
east-west boulevard bisects the park, and impressive buildings flank it on
the north and south.")
      (EAST TO VILLAGE-CENTER)
      (WEST TO VILLAGE-GATE)
      (SOUTH TO CHURCH)
      (NORTH TO TAX-OFFICE)
      (FLAGS RLANDBIT OUTSIDEBIT ONBIT)
      (SYNONYM PARK)
      (ADJECTIVE SHADY)
      (GLOBAL GLOBAL-BUILDING)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-3 MAP-GEN-X-5>)
      (ICON SHADY-PARK-ICON)>

<OBJECT MIGHTY-ELM
	(LOC SHADY-PARK)
	(DESC "mighty elm tree")
	(SYNONYM TREE ELM)
	(ADJECTIVE LARGE ELM)
	(FLAGS NDESCBIT PLANTBIT)
	(ACTION TREE-F)>

<ROOM CHURCH
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Church")
      (LDESC
"This is a house of worship of Brogmoidism. The tenets of this rather silly
religion are engraved on the wall. The only exit is north.")
      (NORTH TO SHADY-PARK)
      (OUT TO SHADY-PARK)
      (FLAGS RLANDBIT ONBIT)
      (SYNONYM CHURCH)
      (GLOBAL GLOBAL-BUILDING)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-4 MAP-GEN-X-5>)
      (ICON CHURCH-ICON)>

<OBJECT TENET
	(LOC CHURCH)
	(DESC "engraved tenet")
	(SYNONYM TENET TENETS ENGRAVING)
	(ADJECTIVE ENGRAVED)
	(FLAGS NDESCBIT READBIT)
	(TEXT
"\"Thou shalt worship the Great Brogmoid to thine utmost, for upon his shoulder
rests the world -- thus he saveth us from plunging into the Great Void...\"
The tenets go on and on about the brogmoid who supports the world. It's hard to
believe that anyone EVER believed such drivel, let alone in today's enlightened
age. As the great modern thinker, Zorbius Blattus, is fond of saying, \"If a
giant brogmoid were holding up the world, where would he stand?\"")>

<ROOM TAX-OFFICE
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "URS Office")
      (LDESC
"This huge hall was the main office of the Underground Revenue Service. Until
the construction of the FrobozzCo Building, it was the largest structure in
the Empire. Here, thousands upon thousands of accountants and auditors once
sat, tabulating the proceeds from Dimwit's astronomical taxations. The only
exit is south.")
      (SOUTH TO SHADY-PARK)
      (OUT TO SHADY-PARK)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL GLOBAL-BUILDING)
      (RIDDLE
"I once heard of a bookkeeper who, while working on the accounts of the Frobozz
Magic Balloon Company, noted that the word 'balloon' has two double letters in
a row! Stretching his limited imagination to the limit, this bookkeeper
wondered if there were any words with THREE double letters in a row. He
couldn't think of one -- but I'll bet that YOU can!\"")
      (ICON URS-OFFICE-ICON)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-2 URS-ICON-LOC>)
      (ACTION TAX-OFFICE-F)>

<ROUTINE TAX-OFFICE-F (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-END>
		     <IN? ,ZORKMID-COIN ,LOCAL-GLOBALS>>
		<SETUP-ORPHAN "answer">
		<COND (<NOT <IN? ,JESTER ,HERE>>
		       <DEQUEUE I-JESTER>
		       <MOVE ,JESTER ,HERE>
		       <THIS-IS-IT ,JESTER>
		       <TELL
"   A bookkeeper is hunched over one of the desks. He looks up as you enter,
and you see that it is the jester, wearing suspenders, a bow tie, thick
eyeglasses, and a green visor.|
   \"" <GETP ,TAX-OFFICE ,P?RIDDLE> CR>)>)>>

<OBJECT BOOKKEEPER
	(LOC GLOBAL-OBJECTS)
	(DESC "bookkeeper")
	(SYNONYM BOOKKEEPER BOOKKEEPING)>

<OBJECT ZORKMID-COIN
	(LOC LOCAL-GLOBALS)
	(DESC "zorkmid coin")
	(SYNONYM ZORKMID COIN MONEY)
	(ADJECTIVE ONE ZORKMID)
	(FLAGS TRYTAKEBIT TAKEBIT READBIT)
	(SIZE 1)
	(TEXT
"The coin bears the likeness of Belwit the Flat, along with the inscriptions,
\"One Zorkmid,\" and \"699 GUE.\" On the other side, the coin depicts Egreth
Castle, and says \"In Frobs We Trust\" in several languages.")>

<ROOM VILLAGE-CENTER
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Village Center")
      (LDESC
"You are in the midst of the village. At least, at some distant time it may
have been a village. More recently, it was a bustling metropolis. Now it's a
deserted metropolis. A fantastically tall building rises just east of you and
a road heads west. To the south is a post office; to the north, beyond granite
stairs flanked by stone toads, is the Courthouse entrance.")
      (EAST TO FROBOZZCO-HQ)
      (WEST TO SHADY-PARK)
      (SOUTH TO POST-OFFICE)
      (NORTH TO COURTROOM)
      (FLAGS RLANDBIT ONBIT OUTSIDEBIT)
      (GLOBAL FROBOZZCO-BUILDING)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-3 MAP-GEN-X-7>)>

<OBJECT STONE-TOADS
	(LOC VILLAGE-CENTER)
	(OWNER STONE-TOADS)
	(DESC "pair of stone toads")
	(SYNONYM PAIR TOAD TOADS)
	(ADJECTIVE STONE)
	(FLAGS NDESCBIT)>

<ROOM COURTROOM
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Courtroom")
      (LDESC
"This is where the great jurist, Oliver Wendell Flathead, would hand down
decisions from the bench. The only exit is south.")
      (SOUTH TO VILLAGE-CENTER)
      (OUT TO VILLAGE-CENTER)
      (FLAGS RLANDBIT ONBIT)
      (SYNONYM COURTROOM)
      (GLOBAL GLOBAL-BUILDING)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-2 COURTROOM-ICON-LOC>)
      (ICON COURTROOM-ICON)>

<ROOM POST-OFFICE
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "Post Office")
      (LDESC
"Once the main branch of the Flatheadia Postal Service, this edifice now lies
in deserted silence. A doorway leads north.")
      (NORTH TO VILLAGE-CENTER)
      (OUT TO VILLAGE-CENTER)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL GLOBAL-BUILDING)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-4 MAP-GEN-X-7>)
      (ICON POST-OFFICE-ICON)>

<OBJECT PACKAGE
	(LOC POST-OFFICE)
	(DESC "package")
	(FDESC
"A package rests on one of the counters. Although a collector has stolen
the stamp, the address is still legible.")
	(SYNONYM PACKAGE ADDRESS)
	(FLAGS TAKEBIT READBIT CONTBIT SEARCHBIT)
	(CAPACITY 12)
	(TEXT
"\"From: Belznork Gibblewitz      To: Eek Numblatz|
       F. M. Homing Pigeon Co        Int'l Curios, Inc|
       FrobozzCo Bldg, 193-E        28 Volcano View Ln|
       Flatheadia, FRV-9179         Gurth City, GTH-3791\"")>

<OBJECT PERCH
	(LOC PACKAGE)
	(DESC "ceramic perch")
	(PLURAL "perches")
	(SYNONYM PERCH WRITING PRINT LETTERING)
	(ADJECTIVE CERAMIC SMALL)
	(FLAGS TAKEBIT READBIT)
	(TEXT
"Tiny lettering says, \"Frobozz Magic Homing Pigeon Company.\"")>

<OBJECT PIGEON
	(LOC PACKAGE)
	(DESC "ceramic pigeon")
	(SYNONYM PIGEON BIRD REPRODUCTION WRITING PRINT LETTERING)
	(ADJECTIVE CERAMIC CLAY HOMING SMALL)
	(FLAGS TAKEBIT READBIT)
	(TEXT
"Tiny lettering says, \"Frobozz Magic Homing Pigeon Company.\"")
	(ACTION PIGEON-F)>

<ROUTINE PIGEON-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The pigeon, though strikingly lifelike, is merely a clay reproduction. On
the bottom is some tiny writing." CR>)
	       (<AND <VERB? TAKE>
		     <PRSO? ,PIGEON>>
		<COND (<OR <ULTIMATELY-IN? ,PIGEON>
			   <FSET? ,OUTER-GATE ,OPENBIT>
			   ,TIME-STOPPED>
		       <RFALSE>)
		      (<OR <PROB 10>
			   <G? ,P-MULT 1>>
		       <TELL
"Your eyes must be starting to play tricks on you. It almost
seemed like the clay pigeon ">
		       <COND (<IN? ,PIGEON ,HERE>
			      <TELL "hopped">)
			     (T
			      <TELL "squirmed">)>
		       <TELL " out of reach at the last second." CR>)
		      (<EQUAL? <ITAKE T> ,M-FATAL>
		       <RTRUE>)
		      (T
		       <TELL
"As you take the pigeon, you feel a dizziness, like that which one gets from
drinking Miznian wines too quickly. ">
		       <COND (<EQUAL? <META-LOC ,PERCH> ,HERE>
			      <MOVE ,PROTAGONIST ,HERE>
			      <TELL
"When the disorientation passes, you seem to have moved a few feet." CR>)
			     (T
			      <CAST-HUNGER-SPELL>
			      <TELL
"The world blurs, then darkens. You blink" ,ELLIPSIS>
			      <SETG HAND-IN-WALDO <>>
			      <MOVE-TO-PERCH ,PROTAGONIST>)>)>)
	       (<AND <VERB? PUT-ON>
		     <PRSI? ,PERCH>>
		<TELL
"There's no apparent way to put the pigeon on the perch." CR>)>>

<GLOBAL REMOVED-PERCH-LOC <>> ;"where is perch when it's REMOVEd?"

<ROUTINE MOVE-TO-PERCH (WHAT "AUX" PERCH-LOC L OFFSET RM OBJ X N)
   <SET PERCH-LOC <META-LOC ,PERCH>>
   <COND (<AND .PERCH-LOC
	       <IN? .PERCH-LOC ,ROOMS>
	       <EQUAL? <LOC ,PERCH> ,YACHT ,BATHYSPHERE>>
	  <SET PERCH-LOC <LOC ,PERCH>>)>
   <COND (,DEBUG
	  <TELL "[Calling MOVE-TO-PERCH. PERCH-LOC is ">
	  <COND (.PERCH-LOC
		 <PRINTD .PERCH-LOC>)
		(T
		 <TELL "false">)>
	  <TELL ".]" CR>)>
   <COND (.PERCH-LOC
	  <COND (<EQUAL? .WHAT ,PROTAGONIST>
		 <GOTO .PERCH-LOC>
		 <COND (<EQUAL? ,HERE ,LAKE-BOTTOM>
			<JIGS-UP ,DROWN>)>
		 <RTRUE>)
		(<EQUAL? .PERCH-LOC ,LAKE-BOTTOM>
		 <SETG CHESS-PIECE-DROWNED 1>
		 <ROB .WHAT ,LAKE-BOTTOM>
		 <REMOVE .WHAT>)
		(T
		 <COND (<OR <SET X <FIND-IN .PERCH-LOC ,WHITEBIT>>
			    <SET X <FIND-IN .PERCH-LOC ,BLACKBIT>>>
			<ROB .X .WHAT>
			<REMOVE .X>)>
		 <SET X <FIRST? .PERCH-LOC>>
		 <REPEAT () ;"have chess piece snarf all takeable objects"
			 <COND (<NOT .X>
				<RETURN>)>
			 <SET N <NEXT? .X>>
			 <COND (<AND <FSET? .X ,TAKEBIT>
				     <NOT <FSET? .X ,TRYTAKEBIT>>>
				<MOVE .X .WHAT>)>
			 <SET X .N>>
		 <MOVE .WHAT .PERCH-LOC>)>)
	 (<SET L <FIND-PERCH-IN-STORAGE-TABLE ,PERCH>>
	  <COND (<G? .L 5000>
		 <SET OFFSET ,OFFICES-W-OFFSET>
		 <SET RM ,OFFICES-WEST>)
		(<G? .L 4000>
		 <SET OFFSET ,OFFICES-E-OFFSET>
		 <SET RM ,OFFICES-EAST>)
		(<G? .L 3000>
		 <SET OFFSET ,OFFICES-S-OFFSET>
		 <SET RM ,OFFICES-SOUTH>)
		(<G? .L 2000>
		 <SET OFFSET ,OFFICES-N-OFFSET>
		 <SET RM ,OFFICES-NORTH>)
		(<G? .L 1000>
		 <SET OFFSET ,OFFICES-OFFSET>
		 <SET RM ,FROBOZZCO-OFFICES>)
		(<G? .L 399>
		 <SET OFFSET ,CONSTRUCTION-OFFSET>
		 <SET RM ,CONSTRUCTION>)
		(T
		 <SET OFFSET ,PLAIN-OFFSET>
		 <SET RM ,PLAIN>)>
	  <COND (<EQUAL? .WHAT ,PROTAGONIST>
		 <SET L <- .L .OFFSET>>
		 <COND (<EQUAL? ,HERE ,PLAIN>
			<PUT-ALL-IN-STORAGE ,PLAIN-OFFSET ,PLAIN-LOC ,PLAIN>)
		       (<EQUAL? ,HERE ,CONSTRUCTION>
			<PUT-ALL-IN-STORAGE ,CONSTRUCTION-OFFSET
					    ,CONSTRUCTION-LOC ,CONSTRUCTION>)
		       (<EQUAL? ,HERE ,FROBOZZCO-OFFICES>
			<PUT-ALL-IN-STORAGE ,OFFICES-OFFSET ,FLOOR-NUMBER
					    ,FROBOZZCO-OFFICES>)
		       (<EQUAL? ,HERE ,OFFICES-NORTH>
			<PUT-ALL-IN-STORAGE ,OFFICES-N-OFFSET ,FLOOR-NUMBER
					    ,OFFICES-NORTH>)
		       (<EQUAL? ,HERE ,OFFICES-SOUTH>
			<PUT-ALL-IN-STORAGE ,OFFICES-S-OFFSET ,FLOOR-NUMBER
					    ,OFFICES-SOUTH>)
		       (<EQUAL? ,HERE ,OFFICES-EAST>
			<PUT-ALL-IN-STORAGE ,OFFICES-E-OFFSET ,FLOOR-NUMBER
					    ,OFFICES-EAST>)
		       (<EQUAL? ,HERE ,OFFICES-WEST>
			<PUT-ALL-IN-STORAGE ,OFFICES-W-OFFSET ,FLOOR-NUMBER
					    ,OFFICES-WEST>)>
		 <COND (<EQUAL? .RM ,PLAIN>
			<SETG RANK <+ </ .L 8> 1>>
		 	<SETG FILE <+ <MOD .L 8> 1>>
			<SETG PLAIN-LOC .L>
			<COND (<AND <NOT <EQUAL? ,HERE ,PLAIN>>
				    <ULTIMATELY-IN? ,CLOAK>>
			       <MOVE ,CLOAK ,PROTAGONIST>
			       <FSET ,CLOAK ,WORNBIT>
			       <SETG CLOAK-LOC ,HERE>)>
			<GET-ALL-FROM-STORAGE .OFFSET .L .RM>)
		       (<EQUAL? .RM ,CONSTRUCTION>
			<SETG RANK <+ </ .L 8> 1>>
	 	 	<SETG FILE <+ <MOD .L 8> 1>>
			<SETG CONSTRUCTION-LOC .L>
			<GET-ALL-FROM-STORAGE .OFFSET .L .RM>)
		       (T
			<SETG FLOOR-NUMBER .L>
			<GET-ALL-FROM-OFFICE-STORAGE .L>)>
		 <GOTO .RM>)
		(T
		 <COND (<AND <EQUAL? .WHAT ,WHITE-PAWN>
			     <EQUAL? .RM ,PLAIN>
			     <L? <- .L .OFFSET> 8>> ;"promote pawn to queen"
			<ROB ,WHITE-PAWN ,WHITE-QUEEN>
			<SET WHAT ,WHITE-QUEEN>)
		       (<AND <EQUAL? .WHAT ,BLACK-PAWN>
			     <EQUAL? .RM ,PLAIN>
			     <G? <- .L .OFFSET> 55>> ;"promote pawn to queen"
			<ROB ,BLACK-PAWN ,BLACK-QUEEN>
			<SET WHAT ,BLACK-QUEEN>)>
		 <REMOVE .WHAT>
		 <REMOVE-ANY-OTHER-CHESS-PIECE-THERE .L .WHAT>
		 <CHESS-PIECE-SNARF .L .WHAT>
		 <PUT-IN-STORAGE .OFFSET .WHAT <- .L .OFFSET>>)>)
	 (<EQUAL? .WHAT ,PROTAGONIST>
	  <COND (<EQUAL? ,REMOVED-PERCH-LOC ,WATER>
		 <HLIGHT ,H-BOLD>
		 <TELL "Surrounded by Water" CR>
		 <HLIGHT ,H-NORMAL>
		 <JIGS-UP ,DROWN>)
		(<EQUAL? ,REMOVED-PERCH-LOC ,GROUND ,OUBLIETTE>
		 <TELL "You appear ">
		 <COND (<EQUAL? ,REMOVED-PERCH-LOC ,OUBLIETTE>
			<TELL "knee deep in mud" ,ELLIPSIS>
			<GOTO ,OUBLIETTE>)
		       (T
			<JIGS-UP
"several feet underground, thus saving the Undertakers Guild some work.">)>)
		(<EQUAL? ,REMOVED-PERCH-LOC ,BROGMOID>
		 <JIGS-UP
"You appear in a totally alien world, near a purple forest and a lake of
molten rock. A giant slug-shaped creatures oozes up and devours you.">)
		(T ;"perch temporarily in cauldron"
		 <JIGS-UP
"You find yourself in a gray void. The life is sucked slowly from you.">)>)
	 (<EQUAL? ,REMOVED-PERCH-LOC ,OUBLIETTE>
	  <MOVE .WHAT ,OUBLIETTE>
	  <REMOVE-ANY-OTHER-CHESS-PIECE-THERE .L .WHAT>
	  <CHESS-PIECE-SNARF .L .WHAT>)
	 (T
	  <REMOVE .WHAT>)>>

<ROUTINE FIND-PERCH-IN-STORAGE-TABLE (OBJ "AUX" (L <>) (CNT 0))
	 <COND (,DEBUG
		<TELL
"[Calling FIND-PERCH-IN-STORAGE-TABLE with " D .OBJ ".]" CR>)>
	 <REPEAT ()
	       <COND (<NOT <L? .CNT ,STORAGE-TABLE-LENGTH>>
		      <COND (<LOC .OBJ>
			     <SET L <FIND-PERCH-IN-STORAGE-TABLE <LOC .OBJ>>>)>
		      <RETURN>)
		     (<EQUAL? <GET ,STORAGE-TABLE <+ .CNT 1>> .OBJ>
		      <SET L <GET ,STORAGE-TABLE .CNT>>
		      <RETURN>)>
	       <SET CNT <+ .CNT 2>>>
	 <COND (<AND ,DEBUG
		     .L>
		<TELL "[Returning " N .L ".]" CR>)>
	 <RETURN .L>>
\
<OBJECT FROBOZZCO-BUILDING
	(LOC LOCAL-GLOBALS)
	(DESC "Frobozzco Building")
	(SYNONYM BUILDING HEADQUARTERS HQ)
	(ADJECTIVE TALL FROBOZZCO INTERNATIONAL WORLD HEADQUARTERS HQ)
	(ACTION FROBOZZCO-BUILDING-F)>

<ROUTINE FROBOZZCO-BUILDING-F ()
	 <COND (<VERB? RESEARCH>
		<PICTURED-ENTRY ,FROBOZZCO-ILL
"The FrobozzCo Building in Flatheadia, designed by Frank Lloyd Flathead and
built by the Frobozz Magic Construction Company in 781 GUE, is easily the
tallest, most impressive building in all of Quendor.">)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,VILLAGE-CENTER>
		       <TELL "Most of the building is lost in the clouds." CR>)
		      (T
		       <TELL "You're in it!" CR>)>)
	       (<VERB? ENTER>
	        <COND (<EQUAL? ,HERE ,VILLAGE-CENTER>
		       <DO-WALK ,P?EAST>)
		      (<EQUAL? ,HERE ,FROBOZZ-PHILHARMONIC-HALL>
		       <DO-WALK ,P?NORTH>)
		      (T
		       <TELL ,LOOK-AROUND>)>)
	       (<VERB? EXIT>
		<V-WALK-AROUND>)>>

<ROOM FROBOZZCO-HQ
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "FrobozzCo HQ")
      (LDESC
"You are in the lobby of FrobozzCo International's World Headquarters, an
impressive four hundred story structure. Wide stairs lead up and down; the
main exit is to the west; an emergency exit leads east.")
      (WEST TO VILLAGE-CENTER)
      (EAST TO BACK-ALLEY)
      (DOWN TO FROBOZZCO-BASEMENT)
      (UP PER FROBOZZCO-OFFICES-ENTER-F)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL STAIRS FROBOZZCO-BUILDING)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-3 MAP-GEN-X-8>)
      (ICON FROBOZZCO-HQ-ICON)>

<OBJECT MEMO ;"in Frobozzco Offices, at fourth floor"
	(DESC "memo")
	(SYNONYM MEMO)
	(FLAGS READBIT TAKEBIT)
	(SIZE 2)
	(TEXT
"FROM: Spaulding Flathead, Seventh Asst. Bldg. Mgr.|
TO:   All tenants|
RE:   New stairway policy|
To relieve overcrowding in the stairwells, employees who work above the 75th
floor will be given teleportation tokens. Company officers will continue to
receive teleportation tokens regardless of floor. Note: employees with tokens
will no longer be dismissed early for \"stair-climbing\" time.")>

<OBJECT INSTRUCTION-BOOKLET ;"193rd floor of FrobozzCo Bldg."
	(DESC "damaged instruction booklet")
	(SYNONYM BOOK BOOKLET INSTRUCTIONS)
	(ADJECTIVE INSTRUCTIONS DAMAGED)
	(FLAGS TAKEBIT READBIT)
	(SIZE 3)
	(TEXT
"The booklet is badly torn and faded. You can make out only a few phrases:
\"...ozz Magic Homing Pi...\" and \"...eave the perch in the location you wish
t...\" and \"...eturn warranty card within 90 d...\"")>

<ROUTINE FROBOZZCO-OFFICES-ENTER-F ()
	 <COND (<EQUAL? ,HERE ,FROBOZZCO-HQ>
		<SETG FLOOR-NUMBER 2>)
	       (T
		<SETG FLOOR-NUMBER 399>)>
	 <GET-ALL-FROM-OFFICE-STORAGE ,FLOOR-NUMBER>
	 ,FROBOZZCO-OFFICES>

<ROOM FROBOZZCO-OFFICES
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "FrobozzCo Offices")
      (NORTH TO OFFICES-NORTH)
      (EAST TO OFFICES-EAST)
      (WEST TO OFFICES-WEST)
      (SOUTH TO OFFICES-SOUTH)
      (UP PER FROBOZZCO-FLOOR-F)
      (DOWN PER FROBOZZCO-FLOOR-F)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL FROBOZZCO-BUILDING)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-10>)
      (ACTION OFFICES-F)>

<ROUTINE OFFICES-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<SETG BEEN-IN-FROBOZZCO-UPPER-FLOORS T>)
	       (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are on Floor " N ,FLOOR-NUMBER " of the FrobozzCo Building. The offices
of one subsidiary or another can be entered in all four directions. Stairs
lead up and down.">)>>

<GLOBAL BEEN-IN-FROBOZZCO-UPPER-FLOORS <>>
;"for on-screen maps, since touchbit is never set in FrobozzCo office rooms"

<GLOBAL FLOOR-NUMBER 2>

<ROUTINE FROBOZZCO-FLOOR-F ()
     <COND (<AND <PRSO? ,P?UP>
		 <EQUAL? ,FLOOR-NUMBER 399>>
	    ,FROBOZZCO-PENTHOUSE)
	   (<AND <PRSO? ,P?DOWN>
		 <EQUAL? ,FLOOR-NUMBER 2>>
	    ,FROBOZZCO-HQ)
	   (T
	    <PUT-ALL-IN-STORAGE ,OFFICES-OFFSET ,FLOOR-NUMBER>
	    <PUT-ALL-IN-STORAGE ,OFFICES-N-OFFSET ,FLOOR-NUMBER ,OFFICES-NORTH>
	    <PUT-ALL-IN-STORAGE ,OFFICES-S-OFFSET ,FLOOR-NUMBER ,OFFICES-SOUTH>
	    <PUT-ALL-IN-STORAGE ,OFFICES-E-OFFSET ,FLOOR-NUMBER ,OFFICES-EAST>
	    <PUT-ALL-IN-STORAGE ,OFFICES-W-OFFSET ,FLOOR-NUMBER ,OFFICES-WEST>
	    <SETG FLOOR-NUMBER <COND (<PRSO? ,P?UP>
				      <+ ,FLOOR-NUMBER 1>)
				     (T
				      <- ,FLOOR-NUMBER 1>)>>
	    <GET-ALL-FROM-OFFICE-STORAGE ,FLOOR-NUMBER>
	    ,FROBOZZCO-OFFICES)>>

<ROUTINE GET-ALL-FROM-OFFICE-STORAGE (L)
	 <GET-ALL-FROM-STORAGE ,OFFICES-OFFSET .L ,FROBOZZCO-OFFICES>
	 <GET-ALL-FROM-STORAGE ,OFFICES-N-OFFSET .L ,OFFICES-NORTH>
	 <GET-ALL-FROM-STORAGE ,OFFICES-S-OFFSET .L ,OFFICES-SOUTH>
	 <GET-ALL-FROM-STORAGE ,OFFICES-E-OFFSET .L ,OFFICES-EAST>
	 <GET-ALL-FROM-STORAGE ,OFFICES-W-OFFSET .L ,OFFICES-WEST>>

<OBJECT T-SQUARE
	(DESC "T-square")
	(SYNONYM T-SQUARE)
	(FLAGS TAKEBIT MAGICBIT)
	(VALUE 12)>

<ROOM OFFICES-NORTH
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "FrobozzCo Offices North")
      (SOUTH TO FROBOZZCO-OFFICES)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL FROBOZZCO-BUILDING WINDOW)
      (ICON OFFICES-ICON)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-4 MAP-GEN-X-10>)
      (ACTION FROBOZZCO-OUTER-OFFICES-F)>

<ROOM OFFICES-EAST
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "FrobozzCo Offices East")
      (WEST TO FROBOZZCO-OFFICES)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL FROBOZZCO-BUILDING WINDOW)
      (ICON OFFICES-ICON)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-11>)
      (ACTION FROBOZZCO-OUTER-OFFICES-F)>

<ROOM OFFICES-WEST
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "FrobozzCo Offices West")
      (EAST TO FROBOZZCO-OFFICES)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL FROBOZZCO-BUILDING WINDOW)
      (ICON OFFICES-ICON)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-5 MAP-GEN-X-9>)
      (ACTION FROBOZZCO-OUTER-OFFICES-F)>

<ROOM OFFICES-SOUTH
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "FrobozzCo Offices South")
      (NORTH TO FROBOZZCO-OFFICES)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL FROBOZZCO-BUILDING WINDOW)
      (ICON OFFICES-ICON)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-6 MAP-GEN-X-10>)
      (ACTION FROBOZZCO-OUTER-OFFICES-F)>

<ROUTINE FROBOZZCO-OUTER-OFFICES-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are in an office on floor " N ,FLOOR-NUMBER " of the FrobozzCo Building.
The office has a lovely ">
		<COND (<EQUAL? ,HERE ,OFFICES-NORTH>
		       <TELL "north">)
		      (<EQUAL? ,HERE ,OFFICES-SOUTH>
		       <TELL "south">)
		      (<EQUAL? ,HERE ,OFFICES-EAST>
		       <TELL "east">)
		      (T
		       <TELL "west">)>
		<TELL "ern exposure. The only exit is to the ">
		<COND (<EQUAL? ,HERE ,OFFICES-NORTH>
		       <TELL "south">)
		      (<EQUAL? ,HERE ,OFFICES-SOUTH>
		       <TELL "north">)
		      (<EQUAL? ,HERE ,OFFICES-EAST>
		       <TELL "west">)
		      (T
		       <TELL "east">)>
		<TELL ".">)>>

<ROOM FROBOZZCO-PENTHOUSE
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "FrobozzCo Penthouse")
      (LDESC
"You have reached the top floor! On a clear day, one can see hundreds of
bloits from here; too bad it's so smoggy today. A stair leads down.")
      (DOWN PER FROBOZZCO-OFFICES-ENTER-F)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL FROBOZZCO-BUILDING WINDOW STAIRS)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-7 MAP-GEN-X-8>)
      (ICON PENTHOUSE-ICON)
      (ACTION FROBOZZCO-PENTHOUSE-F)>

<ROUTINE FROBOZZCO-PENTHOUSE-F (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-ENTER>
		     <NOT <FSET? ,FROBOZZCO-PENTHOUSE ,TOUCHBIT>>>
		<QUEUE I-JESTER 1>)>>

<ROOM FROBOZZCO-BASEMENT
      (LOC ROOMS)
      (REGION "Flatheadia")
      (DESC "FrobozzCo Basement")
      (LDESC
"The basement of the FrobozzCo Building is a place of sturdy walls, designed
to support the 400 stories above. A stair leads up and a passage heads south.")
      (UP TO FROBOZZCO-HQ)
      (SOUTH PER PHILHARMONIC-ENTER-F)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS FROBOZZCO-BUILDING)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-4 MAP-GEN-X-8>)>

<OBJECT BASEMENT-REBUS-BUTTON
	(LOC FROBOZZCO-BASEMENT)
	(SDESC "blinking key-shaped button")
	(FDESC
"In a dark corner, a blinking button catches your eye. It seems to be in the
shape of a key.")
	(SYNONYM BUTTON)
	(ADJECTIVE KEY-SHAPED BLINKING)
	(ACTION REBUS-BUTTON-F)>

<ROUTINE PHILHARMONIC-ENTER-F ()
	 <TELL
"The passage takes you from the FrobozzCo Building back into
the castle. It widens" ,ELLIPSIS>
	 ,FROBOZZ-PHILHARMONIC-HALL>

<ROUTINE FROBOZZCO-BASEMENT-ENTER-F ()
	 <TELL
"The passage narrows as it leaves the castle, then widens again as it
enters" ,ELLIPSIS>
	 ,FROBOZZCO-BASEMENT>

<ROOM BACK-ALLEY
      (LOC ROOMS)
      (DESC "Back Alley")
      (REGION "Flatheadia")
      (LDESC
"This is a grungy, foul-smelling lane. A large building can be entered
to the west, and a much smaller one to the north.")
      (NORTH TO MAGIC-SHOP)
      (WEST TO FROBOZZCO-HQ)
      (FLAGS RLANDBIT ONBIT OUTSIDEBIT)
      (SYNONYM ALLEY)
      (ADJECTIVE BACK)
      (GLOBAL FROBOZZCO-BUILDING GLOBAL-BUILDING)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-3 MAP-GEN-X-9>)
      (ICON BACK-ALLEY-ICON)>

<ROOM MAGIC-SHOP
      (LOC ROOMS)
      (DESC "Magic Shop")
      (REGION "Flatheadia")
      (LDESC
"Perhaps this was once a thriving shop, but now, like the rest of Flatheadia,
it lies deserted, gutted by looters. The exit is south.")
      (SOUTH TO BACK-ALLEY)
      (OUT TO BACK-ALLEY)
      (FLAGS RLANDBIT ONBIT)
      (SYNONYM SHOP STORE)
      (ADJECTIVE MAGIC)
      (GLOBAL GLOBAL-BUILDING)
      (MAP-LOC <PTABLE VILLAGE-AREA-MAP-NUM MAP-GEN-Y-2 MAP-GEN-X-9>)
      (ICON MAGIC-SHOP-ICON)>

<OBJECT RING
	(LOC MAGIC-SHOP)
	(OWNER RING)
	(DESC "ring of ineptitude" ;"ring of spasticity")
	(FDESC
"The only thing the looters ignored was a ring. Not surprising, as it is a
ring of ineptitude. Fun at parties, but not good for much else.")
	(SYNONYM RING INEPTITUDE ;SPASTICITY)
	(FLAGS TAKEBIT WEARBIT)
	(SIZE 1)
	(ACTION RING-F)>

<ROUTINE RING-F ("AUX" AV)
	 <COND (<VERB? WEAR>
		<SET AV <LOC ,PROTAGONIST>>
		<FSET ,RING ,WORNBIT>
		<TELL "As you slip the ring onto your finger, you clumsily ">
		<COND (<EQUAL? ,HERE ,UNDER-THE-WORLD ,HANGING-FROM-ROOTS
			       ,LEDGE-IN-BOTTOMLESS-PIT ,MOUTH-OF-CAVE>
		       <TELL "lose your grip, and plunge downward. ">
		       <PERFORM ,V?LEAP ,ROOMS>
		       <RTRUE>)
		      (T
		       <TELL "drop everything you were holding.">
		       <ROB ,PROTAGONIST
			    <COND (<FSET? .AV ,DROPBIT> .AV)
				  (T ,HERE)>
			    T ;"T arg tells ROB not to drop worn items">
		       <CRLF>)>)>>