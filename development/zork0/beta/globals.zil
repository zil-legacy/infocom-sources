"GLOBALS for

			       ZORK ZERO
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<INCLUDE "BASEDEFS" "FIND" "PDEFS">

<ADJ-SYNONYM LARGE HUGE BIG GIANT GIGANTIC TREMENDOUS MIGHTY  MASSIVE ENORMOUS
	     ;"LARGER HUGER BIGGER MIGHTIER">

<ADJ-SYNONYM SMALL SMALLER TINY TINIER LITTLE PETITE TEENSY WEENSY>

<ADJ-SYNONYM MY MINE>

<GLOBAL LIT T>

<GLOBAL MOVES 0>

<GLOBAL SCORE 0>

<GLOBAL HERE:OBJECT BANQUET-HALL>

<OBJECT GLOBAL-OBJECTS
	;(SYNONYM ZZMGCK) ;"No, this synonym doesn't need to exist... sigh"
	(DESC "it")
	(FLAGS INVISIBLE TOUCHBIT SURFACEBIT TRYTAKEBIT OPENBIT SEARCHBIT
	       TRANSBIT WEARBIT ONBIT LIGHTBIT RLANDBIT WORNBIT INTEGRALBIT
	       VEHBIT OUTSIDEBIT CONTBIT VOWELBIT LOCKEDBIT NDESCBIT DOORBIT
	       ACTORBIT PARTBIT INBIT FEMALEBIT KLUDGEBIT DROPBIT BURNBIT
	       ORBBIT FLAMEBIT NALLBIT KEYBIT UNDERGROUNDBIT)>

<OBJECT LOCAL-GLOBALS
	(LOC GLOBAL-OBJECTS)
	(DESC "it")
	;(SYNONYM ZZMGCK)
	;(DESCFCN 0)
        ;(GLOBAL GLOBAL-OBJECTS)
	;(FDESC "F")
	;(LDESC "F")
	;(SIZE 0)
	;(TEXT "")
	;(CAPACITY 0)
	;(GENERIC ME-F)>

<OBJECT ROOMS
	;(IN TO ROOMS)
	(DESC "it")>

<OBJECT INTNUM
	(LOC GLOBAL-OBJECTS)
	(DESC "number")
	(SYNONYM NUMBER NUMBERS INT.NUM)
	(ADJECTIVE INT.NUM INT.TIM)
	(ACTION INTNUM-F)>

<ROUTINE INTNUM-F ("AUX" X)
	 <COND (<AND <EQUAL? ,HERE ,CONSTRUCTION>
		     <NOUN-USED? ,INTNUM ,W?NUMBER>>
		<TELL
"The number engraved on the wall is \"" N ,CONSTRUCTION-LOC ".\"" CR>)>>

<OBJECT IT
	(LOC GLOBAL-OBJECTS)
	(SYNONYM IT ;THEM)
	(DESC "it")
	(FLAGS VOWELBIT NARTICLEBIT TOUCHBIT)>

<OBJECT HIM
	(LOC GLOBAL-OBJECTS)
	(SYNONYM HIM HIMSELF)
	(DESC "him")
	(FLAGS NARTICLEBIT TOUCHBIT)>

<OBJECT HER
	(LOC GLOBAL-OBJECTS)
	(SYNONYM HER HERSELF)
	(DESC "her")
	(FLAGS NARTICLEBIT TOUCHBIT)>

<OBJECT LEFT-RIGHT
	(LOC GLOBAL-OBJECTS)
	(DESC "that way")
	(SYNONYM LEFT RIGHT)
	(FLAGS NARTICLEBIT)
	(ACTION LEFT-RIGHT-F)>

<ROUTINE LEFT-RIGHT-F ()
	 <COND (<VERB? CHASTISE> ;"LOOK LEFT or LOOK RIGHT"
		<TELL "You see nothing unusual." CR>)
	       (<VERB? WALK WALK-TO ENTER>
		<COND (<AND <EQUAL? ,HERE ,WEIRD-PASSAGEWAY>
			    <NOUN-USED? ,LEFT-RIGHT ,W?LEFT>
			    <EQUAL? ,TOWER-BEATEN ,PYRAMID-ROOM-LEFT>>
		       <DO-WALK ,P?WEST>)
		      (<AND <EQUAL? ,HERE ,WEIRD-PASSAGEWAY>
			    <NOUN-USED? ,LEFT-RIGHT ,W?RIGHT>
			    <EQUAL? ,TOWER-BEATEN ,PYRAMID-ROOM-RIGHT>>
		       <DO-WALK ,P?EAST>)
		      (<EQUAL? ,HERE ,TESTING-ROOM>
		       <PERFORM ,V?ENTER
				<COND (<NOUN-USED? ,LEFT-RIGHT ,W?RIGHT>
				       ,RIGHT-BOOTH)
				      (T
				       ,LEFT-BOOTH)>>)
		      (T
		       <V-WALK-AROUND>)>)
	       (<VERB? SET>
		<TELL "You turn ninety degrees, with little effect." CR>)>>

<OBJECT GRUE
	(LOC GLOBAL-OBJECTS)
	(SYNONYM GRUE GRUES)
	(ADJECTIVE LURKING SINISTER HUNGRY SILENT)
	(DESC "lurking grue")
	(RESEARCH
"\"The grue was once a sinister, lurking presence in the dark places of the
earth. Its favorite diet was adventurers, but its insatiable appetite was
tempered by its fear of light. No grue was ever seen by the light of day,
and few ever survived its fearsome jaws to tell the tale.\"|
   The encyclopedia goes on to say, \"Grues were eradicated from the face of
the world during the time of Entharion, many by his own hand and his legendary
blade Grueslayer. Although it has now been many a century since the last grue
sighting, old hags still delight in scaring children by telling them that
grues still lurk in the bottomless pits of the Empire, and will one day lurk
forth again.\"") 
	(ACTION GRUE-F)>

<ROUTINE GRUE-F ()
	 <COND (<VERB? EXAMINE FIND>
		<COND (<FSET? ,LANTERN ,TRYTAKEBIT>
		       <TELL
"Don't be silly! There haven't been grues around for centuries!" CR>)
		      (T
		       <TELL
"There is no grue here, but I'm sure there is at least one lurking
in the darkness nearby.">
		       <COND (<AND <FIND-IN ,PROTAGONIST ,ONBIT>
				   <NOT <FSET? ,HERE ,ONBIT>>>
			      <TELL
" I wouldn't let my light go out if I were you!" CR>)>)>)>>

<OBJECT SAILOR
	(LOC GLOBAL-OBJECTS)
	(DESC "sailor")
	(SYNONYM SAILOR)>

<OBJECT GLOBAL-SLEEP
	(LOC GLOBAL-OBJECTS)
	(DESC "sleep")
	(SYNONYM SLEEP NAP SNOOZE)
	(FLAGS NARTICLEBIT)
	(ACTION GLOBAL-SLEEP-F)>

<ROUTINE GLOBAL-SLEEP-F ()
	 <COND (<VERB? WALK-TO TAKE>
		<V-SLEEP>)
	       (<AND <VERB? PUT-TO>
		     <PRSI? ,GLOBAL-SLEEP>>
		<COND (<PRSO? ,BEDBUG>
		       <TELL "You sing a brief lullaby. ">
		       <REMOVE-BEDBUG "hear">)
		      (T
		       <TELL "You're not a hypnotist." CR>)>)>>

<OBJECT LULLABY
	(LOC GLOBAL-OBJECTS)
	(DESC "lullaby")
	(SYNONYM LULLABY LULLABYE SONG)
	(ACTION LULLABY-F)>

<ROUTINE LULLABY-F ("AUX" ACTOR)
	 <COND (<VERB? SING>
		<COND (<NOT ,PRSI>
		       <COND (<IN? ,BEDBUG ,HERE>
			      <SETG PRSI ,BEDBUG>)
			     (<SET ACTOR <FIND-IN ,HERE ,ACTORBIT>>
			      <SETG PRSI .ACTOR>)
			     (T
			      <TELL
"[If you put me to sleep, you'd have a heck of a time communicating with the
game! By the way, don't expect any offers from the Borphee Opera Company.]" CR>
			      <RTRUE>)>)>
		<COND (<PRSI? ,BEDBUG>
		       <PERFORM ,V?PUT-TO ,BEDBUG ,GLOBAL-SLEEP>
		       <RTRUE>)
		      (<FSET? ,PRSI ,ACTORBIT>
		       <TELL
"Despite your best rendition," T ,PRSI " remains awake." CR>)
		      (T
		       <TELL
"Amazingly," T ,PRSI " is now motionless! You must have put
it right to sleep! Incredible! What a talent!" CR>)>)>>

<OBJECT GROUND
	(LOC GLOBAL-OBJECTS)
	(SYNONYM FLOOR GROUND SAND)
	(SDESC "ground")
	(ACTION GROUND-F)>

<ROUTINE GROUND-F ()
	 <SET-GROUND-DESC>
	 <COND (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,OUBLIETTE>
		       <TELL "Mud. Squishy mud." CR>)
		      (<EQUAL? ,HERE ,PITS>
		       <PERFORM ,V?EXAMINE ,PITS-OBJECT>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,TIGHT-SQUEEZE>
		       <TELL
"You see a man-sized opening through which cool air seems flow." CR>)>)
	       (<VERB? LOOK-UNDER>
		<IMPOSSIBLES>)
	       (<VERB? CLIMB-UP CLIMB-ON CLIMB ENTER>
		<WASTES>)
	       (<VERB? LEAVE>
		<DO-WALK ,P?UP>)>>

<ROUTINE SET-GROUND-DESC ()
	 <COND (<FSET? ,HERE ,OUTSIDEBIT>
		<PUTP ,GROUND ,P?SDESC "ground">)
	       (<FSET? ,HERE ,DESERTBIT>
		<PUTP ,GROUND ,P?SDESC "sand">)
	       (T
		<PUTP ,GROUND ,P?SDESC "floor">)>>

<OBJECT GLOBAL-HOLE ;"exists entirely so player can type DIG HOLE"
	(LOC GLOBAL-OBJECTS)
	(DESC "hole")
	(SYNONYM HOLE)
	(ACTION GLOBAL-HOLE-F)>

<ROUTINE GLOBAL-HOLE-F ()
	 <COND (<AND <VERB? DIG>
		     <PRSO? ,GLOBAL-HOLE>>
		<COND (,PRSI
		       <COND (<PRSI? ,SHOVEL>
			      <PERFORM-PRSA ,GROUND ,SHOVEL>)
			     (<ULTIMATELY-IN? ,SHOVEL>
			      <TELL "[with the shovel]" CR>
			      <PERFORM-PRSA ,PRSI ,SHOVEL>)
			     (T
			      <TELL "[with your hands]" CR>
			      <PERFORM-PRSA ,PRSI ,HANDS>)>)
		      (<ULTIMATELY-IN? ,SHOVEL>
		       <TELL "[with the shovel]" CR>
		       <PERFORM-PRSA ,GROUND ,SHOVEL>)
		      (T
		       <TELL "[with your hands]" CR>
		       <PERFORM-PRSA ,GROUND ,HANDS>)>)
	       (<HANDLE ,GLOBAL-HOLE>
		<CANT-SEE ,GLOBAL-HOLE>)>>

<OBJECT CARPET
	(LOC LOCAL-GLOBALS)
	(DESC "carpet")
	(SYNONYM CARPET CARPETING)
	(ADJECTIVE PLUSH RED)
	(ACTION CARPET-F)>

<ROUTINE CARPET-F ()
	 <COND (<VERB? MOVE LOOK-UNDER RAISE ROLL>
		<TELL
"The carpet is quite well attached to the floor." CR>)>>

<OBJECT WALL
	(LOC GLOBAL-OBJECTS)
	(DESC "wall")
	(SYNONYM WALL WALLS)
	(ADJECTIVE NORTH ;N ;NORTHEAST NE EAST ;E ;SOUTHEAST SE
	 	   SOUTH ;S ;SOUTHWEST SW WEST ;W ;NORTHWEST NW
		   REAR FAR)
	(FLAGS NDESCBIT TOUCHBIT)
	(ACTION WALL-F)>

<ROUTINE WALL-F ("AUX" (CNT 0))
   <COND (<VERB? READ EXAMINE>
	  <COND (<EQUAL? ,HERE ,CHURCH>
		 <PERFORM ,V?READ ,TENET>
		 <RTRUE>)
		(<AND <EQUAL? ,HERE ,CELL>
		      <IN? ,COBWEBS ,CELL>>
		 <TELL ,CELL-WALL-DESC CR>)>)
	 (<AND <VERB? CLEAN>
	       <EQUAL? ,HERE ,CELL>
	       <ADJ-USED? ,WALL ,W?REAR>
	       <IN? ,COBWEBS ,CELL>>
	  <PERFORM ,V?CLEAN ,COBWEBS>
	  <RTRUE>)
	 (<VERB? THROW-OVER>
	  <COND (<EQUAL? ,HERE ,PERIMETER-WALL>
		 <TELL
"Babe Flathead himself couldn't toss something over this towering wall!" CR>)
		(T
		 <TELL "The wall joins the ceiling!" CR>)>)
	 (<AND <VERB? PUT PUT-ON>
	       <PRSO? ,N-S-PASSAGE ,NW-SE-PASSAGE>>
	  <COND (<ADJ-USED? ,WALL <>>
		 <SETG P-WON <>>
		 <TELL
"[You didn't specify which wall you meant: EAST WALL for example.]" CR>)
		(<OR <AND <PRSO? ,N-S-PASSAGE>
			  <NOT <ADJ-USED? ,WALL ,W?NORTH ,W?N>>
			  <NOT <ADJ-USED? ,WALL ,W?SOUTH ,W?S>>>
		     <AND <PRSO? ,NW-SE-PASSAGE>
			  <NOT <ADJ-USED? ,WALL ,W?NORTHWEST ,W?NW>>
			  <NOT <ADJ-USED? ,WALL ,W?SOUTHEAST ,W?SE>>>>
		 <TELL
,YOU-CANT "install the passage on that wall--it's" AR ,PRSO>)
		(<PASSAGE-THERE>
		 <RTRUE>)
		(<OR <EQUAL? ,HERE ,GONDOLA ,HOLD>
		     <EQUAL? <LOC ,PROTAGONIST> ,YACHT ,BATHYSPHERE>>
		 <TELL
"A built-in safety feature prevents the passage from being
installed in a vehicle." CR>)
		(T
		 <MOVE ,PRSO ,HERE>
		 <FCLEAR ,PRSO ,TAKEBIT>
		 <TELL "There's now a passage leading ">
		 <COND (<PRSO? ,N-S-PASSAGE>
			<COND (<EQUAL? ,HERE ,CONSTRUCTION>
			       <SETG N-S-PASSAGE-LOC ,CONSTRUCTION-LOC>)>
			<COND (<ADJ-USED? ,WALL ,W?NORTH ,W?N>
			       <SETG N-S-PASSAGE-DIR ,P?NORTH>
			       <COND (<AND <EQUAL? ,HERE ,CONSTRUCTION>
					   <NOT <L? ,CONSTRUCTION-LOC 8>>>
				      ;"second clause in predicate: can't go
 				        north from the top Construction row"
				      <PUT ,NORTH-EXITS 0
					   <+ ,CONSTRUCTION-LOC 100>>)>
			       ;"so passage appears at room at other end"
			       <REPEAT ()
				 <COND (<EQUAL? <GET ,STORAGE-TABLE .CNT> 0>
					<PUT ,STORAGE-TABLE .CNT
					     <+ <- ,CONSTRUCTION-LOC 8>
						,CONSTRUCTION-OFFSET>>
					<PUT ,STORAGE-TABLE
					     <+ .CNT 1> ,N-S-PASSAGE>
					<RETURN>)
				       (T
					<SET CNT <+ .CNT 2>>)>>
			       <TELL "nor">)
			      (T
			       <SETG N-S-PASSAGE-DIR ,P?SOUTH>
			       <COND (<AND <EQUAL? ,HERE ,CONSTRUCTION>
					   <NOT <G? ,CONSTRUCTION-LOC 55>>>
				      ;"last clause in predicate: you can't
				        go south from bottom Construction row"
				      <PUT ,NORTH-EXITS 0
					   <+ ,CONSTRUCTION-LOC 108>>)>
				     ;"so passage appears at room at other end"
				     <REPEAT ()
				       <COND (<EQUAL?
					           <GET ,STORAGE-TABLE .CNT> 0>
					      <PUT ,STORAGE-TABLE .CNT
						   <+ <+ ,CONSTRUCTION-LOC 8>
						      ,CONSTRUCTION-OFFSET>>
					      <PUT ,STORAGE-TABLE
						   <+ .CNT 1> ,N-S-PASSAGE>
					      <RETURN>)
					     (T
					      <SET CNT <+ .CNT 2>>)>>
				     <TELL "sou">)>
			<TELL "th from the room." CR>)
		       (T
			<COND (<EQUAL? ,HERE ,CONSTRUCTION>
			       <SETG NW-SE-PASSAGE-LOC
				     ,CONSTRUCTION-LOC>)>
			<COND (<ADJ-USED? ,WALL ,W?NORTHWEST ,W?NW>
			       <SETG NW-SE-PASSAGE-DIR ,P?NW>
			       <COND (<AND <EQUAL? ,HERE ,CONSTRUCTION>
				       	   <NOT <OR <EQUAL?
						      <MOD ,CONSTRUCTION-LOC 8>
						      0>
						    <L? ,CONSTRUCTION-LOC 8>>>>
				      ;"last predicate clause: you can't go NW
				        from top or west rows of Construction" 
				      <PUT ,SE-EXITS 0
					   <+ ,CONSTRUCTION-LOC 91>>)>
			       ;"so passage appears at room at other end"
			       <REPEAT ()
				 <COND (<EQUAL? <GET ,STORAGE-TABLE .CNT> 0>
					<PUT ,STORAGE-TABLE .CNT
					     <+ <- ,CONSTRUCTION-LOC 9>
						,CONSTRUCTION-OFFSET>>
					<PUT ,STORAGE-TABLE
					     <+ .CNT 1> ,NW-SE-PASSAGE>
					<RETURN>)
				       (T
					<SET CNT <+ .CNT 2>>)>>
			       <TELL "northwe">)
			      (T
			       <SETG NW-SE-PASSAGE-DIR ,P?SE>
			       <COND (<AND <EQUAL? ,HERE ,CONSTRUCTION>
				       	   <NOT <OR <EQUAL?
						      <MOD ,CONSTRUCTION-LOC 8>
						      7>
						   <G? ,CONSTRUCTION-LOC 55>>>>
				      ;"last predicate clause: you can't go SE
				        from bottom or east rows of Const site"
				      <PUT ,SE-EXITS 0
					   <+ ,CONSTRUCTION-LOC 100>>)>
			       ;"so passage appears at room at other end"
			       <REPEAT ()
				 <COND (<EQUAL? <GET ,STORAGE-TABLE .CNT> 0>
					<PUT ,STORAGE-TABLE .CNT
					     <+ <+ ,CONSTRUCTION-LOC 9>
						,CONSTRUCTION-OFFSET>>
					<PUT ,STORAGE-TABLE
					     <+ .CNT 1> ,NW-SE-PASSAGE>
					<RETURN>)
				       (T
					<SET CNT <+ .CNT 2>>)>>
			       <TELL "southea">)>
			<TELL "st from the room." CR>)>)>)>>

<ROUTINE PASSAGE-THERE ("AUX" (PASSAGE? <>))
	 <COND (<ADJ-USED? ,WALL ,W?NORTH ,W?N>
		<COND (<EQUAL? ,HERE ,PEG-ROOM>
		       <COND (<NOT ,PEG-PASSAGE-OPENED>
			      <REPELLED "north">
			      <SET PASSAGE? ,M-FATAL>)
			     (T
		       	      <SET PASSAGE? <>>)>)
		      (<EQUAL? ,HERE ,CONSTRUCTION>
		       <COND (<INTBL? ,NORTH-EXITS ,CONSTRUCTION-LOC 11>
			      <SET PASSAGE? T>)>)
		      (<GETPT ,HERE ,P?NORTH>
		       <SET PASSAGE? T>)>)
	       (<ADJ-USED? ,WALL ,W?SOUTH ,W?S>
		<COND (<EQUAL? ,HERE ,CONSTRUCTION>
		       <COND (<INTBL? ,NORTH-EXITS <+ ,CONSTRUCTION-LOC 8> 11>
			      <SET PASSAGE? T>)>)
		      (<EQUAL? ,HERE ,THRONE-ROOM>
		       <COND (<NOT ,SECRET-PASSAGE-OPEN>
			      <REPELLED "south">
			      <SET PASSAGE? ,M-FATAL>)
			     (T
		       	      <SET PASSAGE? <>>)>)
		      (<GETPT ,HERE ,P?SOUTH>
		       <SET PASSAGE? T>)>)
	       (<ADJ-USED? ,WALL ,W?NORTHWEST ,W?NW>
		<COND (<EQUAL? ,HERE ,CONSTRUCTION>
		       <COND (<INTBL? ,SE-EXITS <- ,CONSTRUCTION-LOC 9> 7>
			      <SET PASSAGE? T>)>)
		      (<EQUAL? ,HERE ,PERIMETER-WALL>
		       <SET PASSAGE? <>>)
		      (<GETPT ,HERE ,P?NW>
		       <SET PASSAGE? T>)>)
	       (<ADJ-USED? ,WALL ,W?SOUTHEAST ,W?SE>
		<COND (<EQUAL? ,HERE ,CONSTRUCTION>
		       <COND (<INTBL? ,SE-EXITS ,CONSTRUCTION-LOC 7>
			      <SET PASSAGE? T>)>)
		      (<GETPT ,HERE ,P?SE>
		       <SET PASSAGE? T>)>)>
	 <COND (<EQUAL? .PASSAGE? ,M-FATAL> ;"handled earlier in routine"
		<RTRUE>)
	       (.PASSAGE?
		<TELL "There's already an exit in that direction!" CR>
		<RTRUE>)
	       (T
	 	<RFALSE>)>>

<ROUTINE REPELLED (STRING)
	 <TELL
"Strangely, the passage seems repelled by the " .STRING " wall, as though
two inconsistent types of magic were at work in the same place." CR>>

<OBJECT GLOBAL-PASSAGE
	(LOC GLOBAL-OBJECTS)
	(DESC "passage")
	(SYNONYM PASSAGE PASSAGEWAY TUNNEL)
	(ADJECTIVE GLOOMY DARK SECRET HIDDEN WIDE NARROW LOW STEEP SLOPING
	 	   DUSTY UNEVEN WINDING FORBIDDING GRAVELLY HALF-BURIED
		   HIGHWAY POORLY-DUG)
	(ACTION GLOBAL-PASSAGE-F)>

<ROUTINE GLOBAL-PASSAGE-F ()
	 <COND (<VERB? ENTER>
		<V-WALK-AROUND>)>>

<OBJECT CEILING
	(LOC GLOBAL-OBJECTS)
	(FLAGS NDESCBIT TOUCHBIT)
	(DESC "ceiling")
	(SYNONYM CEILING ROOF)
	(ADJECTIVE LOW HIGH)
	(ACTION CEILING-F)>

<ROUTINE CEILING-F ()
	 <COND (<AND <NOUN-USED? ,CEILING ,W?ROOF>
		     <EQUAL? ,HERE ,ROOF ,PARAPET>>
		<COND (<VERB? THROW-FROM>
		       <REMOVE ,PRSO>
		       <COND (<OR <PRSO? ,PERCH>
				  <ULTIMATELY-IN? ,PERCH ,PRSO>>
			      <SETG REMOVED-PERCH-LOC ,GROUND>)>
		       <TELL
"You hear a \"splat\" as" T ,PRSO " sinks into the ground far below." CR>)
		      (<PRSO? ,CEILING>
		       <PERFORM-PRSA ,GLOBAL-HERE ,PRSI>)
		      (T
		       <PERFORM-PRSA ,PRSO ,GLOBAL-HERE>)>)
	       (<AND <FSET? ,HERE ,OUTSIDEBIT>
		     <HANDLE ,CEILING>>
		<CANT-SEE ,CEILING>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,BARBICAN>
		       <TELL
"It's too gloomy in here to make out any of the features of the ceiling." CR>)
		      (<EQUAL? ,HERE ,MEGABOZ-HUT>
		       <TELL ,MEGABOZ-CEILING-DESC CR>)>)
	       (<VERB? LOOK-UNDER>
		<PERFORM ,V?LOOK>
		<RTRUE>)>>

<OBJECT WATER
	(LOC GLOBAL-OBJECTS)
	(DESC "water")
	(SYNONYM WATER WATERS GLOOP GLOOPS)
	(ADJECTIVE ONE TWO THREE FOUR FIVE SIX SEVEN EIGHT NINE ;TEN INT.NUM)
	(FLAGS NARTICLEBIT)
	(GENERIC GENERIC-VIAL-WATER-F)
	(ACTION WATER-F)>

<ROUTINE WATER-F ("AUX" X)
	 <COND (<SET X <FIND-WATER>>
		T)
	       (<AND <VISIBLE? ,LARGE-VIAL>
		     <VISIBLE? ,SMALL-VIAL>
		     <G? ,LARGE-VIAL-GLOOPS 0>
		     <G? ,SMALL-VIAL-GLOOPS 0>>
		<TELL ,WHICH-WATER>
		<RTRUE>)
	       (<AND <VISIBLE? ,LARGE-VIAL>
		     <G? ,LARGE-VIAL-GLOOPS 0>>
		<SET X ,LARGE-VIAL>)
	       (<AND <VISIBLE? ,SMALL-VIAL>
		     <G? ,SMALL-VIAL-GLOOPS 0>>
		<SET X ,SMALL-VIAL>)
	       (<NOT <HANDLE ,WATER>>
		<RFALSE>)
	       (T
		<TELL ,YOU-CANT-SEE-ANY "water here.]" CR>
		<RTRUE>)>
	 <COND (<AND <VERB? COUNT>
		     <NOUN-USED? ,WATER ,W?GLOOPS>>
		<COND (<VISIBLE? ,LARGE-VIAL>
		       <TELL "The large vial ">
		       <COND (<EQUAL? ,LARGE-VIAL-GLOOPS 0>
			      <TELL "is empty">)
			     (T
			      <TELL "contains " N ,LARGE-VIAL-GLOOPS " gloop">
			      <COND (<NOT <EQUAL? ,LARGE-VIAL-GLOOPS 1>>
				     <TELL "s">)>)>
		       <COND (<VISIBLE? ,SMALL-VIAL>
			      <TELL ". ">)
			     (T
			      <TELL ,PERIOD-CR>)>)>
		<COND (<VISIBLE? ,SMALL-VIAL>
		       <TELL "The small vial ">
		       <COND (<EQUAL? ,SMALL-VIAL-GLOOPS 0>
			      <TELL "is empty">)
			     (T
			      <TELL "contains " N ,SMALL-VIAL-GLOOPS " gloop">
			      <COND (<NOT <EQUAL? ,SMALL-VIAL-GLOOPS 1>>
				     <TELL "s">)>)>
		       <TELL ,PERIOD-CR>)>)
	       (<AND <VERB? FILL>
		     <PRSO? ,SMALL-VIAL ,LARGE-VIAL>>
		<COND (<EQUAL? .X ,LARGE-VIAL>
		       <PERFORM ,V?FILL ,PRSO ,LARGE-VIAL>
		       <RTRUE>)
		      (<EQUAL? .X ,SMALL-VIAL>
		       <PERFORM ,V?FILL ,PRSO ,SMALL-VIAL>
		       <RTRUE>)
		      (T
		       <RFALSE> ;"handled by VIAL-F")>)
	       (<AND <VERB? REMOVE>
		     <NOUN-USED? ,WATER ,W?GLOOP ,W?GLOOPS>
		     <OR <VISIBLE? ,LARGE-VIAL>
			 <VISIBLE? ,SMALL-VIAL>>>
		<COND (<AND <VISIBLE? ,LARGE-VIAL>
			    <VISIBLE? ,SMALL-VIAL>>
		       <COND (<AND ,LARGE-VIAL-GLOOPS
				   ,SMALL-VIAL-GLOOPS>
			      <TELL "There's water in both vials." CR>
			      <RTRUE>)
			     (,LARGE-VIAL-GLOOPS
			      <SETG PRSI ,LARGE-VIAL>)
			     (,SMALL-VIAL-GLOOPS
			      <SETG PRSI ,SMALL-VIAL>)
			     (T
			      <TELL "Neither vial contains water!" CR>
			      <RTRUE>)>)
		      (<VISIBLE? ,LARGE-VIAL>
		       <SETG PRSI ,LARGE-VIAL>)
		      (T
		       <SETG PRSI ,SMALL-VIAL>)>
		<PERFORM ,V?EMPTY-FROM ,WATER ,PRSI>
		<RTRUE>)
	       (<VERB? DRINK>
		<TELL "You're not thirsty." CR>)
	       (<VERB? LOOK-INSIDE LOOK-UNDER EXAMINE>
		<TELL "You see nothing of interest." CR>)
	       (<VERB? REACH-IN TOUCH>
		<TELL "Your hand is now wet">
		<COND (<EQUAL? ,HERE ,OASIS>
		       <TELL " and cold">)>
		<TELL ,PERIOD-CR>)
	       (<AND <VERB? PUT PUT-ON>
		     <PRSI? ,WATER>>
		<COND (<IN? ,PROTAGONIST ,BATHYSPHERE>
		       <TELL
"You can't reach the water -- the bathysphere is closed! (Fortunately.)" CR>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,PARLOR>
		       <MOVE ,PRSO ,FISH-TANK>)
		      (<EQUAL? ,HERE ,LAKE-FLATHEAD>
		       <MOVE ,PRSO ,LAKE-BOTTOM>)
		      (T
		       <COND (<OR <PRSO? ,PERCH>
				  <ULTIMATELY-IN? ,PERCH ,PRSO>>
			      <SETG REMOVED-PERCH-LOC ,WATER>)>
		       <REMOVE ,PRSO>)>
		<TELL "With a \"p">
		<COND (<AND <PRSO? ,CANDLE ,GUTTERING-TORCH ,FLICKERING-TORCH>
			    <FSET? ,PRSO ,ONBIT>>
		       <FCLEAR ,PRSO ,ONBIT>
		       <FCLEAR ,PRSO ,FLAMEBIT>
		       <COND (<PRSO? ,GUTTERING-TORCH>
			      <DEQUEUE I-GUTTERING-TORCH>)
			     (<PRSO? ,FLICKERING-TORCH>
			      <DEQUEUE I-FLICKERING-TORCH>)>
		       <TELL "ffft">)
		      (T
		       <TELL "lunk">)>
		<TELL ",\"" T ,PRSO " sinks into the water." CR>)
	       (<VERB? ENTER SWIM>
		<COND (<EQUAL? .X ,SWAMP>
		       <TELL
"You're already ankle-deep in the swampy water, which is yucky enough." CR>)
		      (<EQUAL? .X ,FRIGID-RIVER>
		       <TELL
"The Frigid River is known for its unpredictable currents." CR>)
		      (<EQUAL? .X ,FLATHEAD-OCEAN>
		       <TELL
"The pounding surf would kill you in a moment." CR>)
		      (<EQUAL? .X ,LAKE-FLATHEAD>
		       <TELL
"These waters are known for their hungry denizens." CR>)
		      (<EQUAL? .X ,STREAM-OBJECT>
		       <DO-WALK ,P?WEST>)
		      (<EQUAL? .X ,OASIS-OBJECT>
		       <TELL
"Only a Polar Gumffbeast could swim in such cold water!" CR>)
		      (<EQUAL? .X ,FISH-TANK>
		       <COND (,DESCRIBED-TANK-AS-LARGE
			      <TELL
"There's no way you could fit into this fish tank! [All right, I'll admit
that I went a little overboard when I described the fish tank as \"bigger
than a swimming pool.\"]" CR>)
			     (T
			      <SETG DESCRIBED-TANK-AS-SMALL T>
			      <TELL
"What? Swim in an itsy-bitsy fish tank like this one?!?" CR>)>)
		      (<EQUAL? .X ,MOAT>
		       <COND (,ALLIGATOR
		       	      <JIGS-UP
"The much, much larger alligator who lives in the moat apparently considers
this a territorial invasion.">)
			     (T
		       	      <TELL
"Not recommended. Moats tend to populated with big, nasty alligators." CR>)>)>)
	       (<PRSO? ,WATER>
		<PERFORM-PRSA .X ,PRSI>)
	       (T
		<PERFORM-PRSA ,PRSO .X>)>>

<ROUTINE FIND-WATER ()
	 <COND (<GLOBAL-IN? ,MOAT ,HERE>
		<RETURN ,MOAT>)
	       (<EQUAL? ,HERE ,STREAM>
		<RETURN ,STREAM-OBJECT>)
	       (<EQUAL? ,HERE ,PARLOR>
		<RETURN ,FISH-TANK>)
	       (<EQUAL? ,HERE ,RIVERS-END>
		<RETURN ,FRIGID-RIVER>)
	       (<GLOBAL-IN? ,FLATHEAD-OCEAN ,HERE>
		<RETURN ,FLATHEAD-OCEAN>)
	       (<OR <EQUAL? ,HERE ,LAKE-FLATHEAD>
		    <GLOBAL-IN? ,LAKE-FLATHEAD ,HERE>>
		<RETURN ,LAKE-FLATHEAD>)
	       (<GLOBAL-IN? ,SWAMP ,HERE>
		<RETURN ,SWAMP>)
	       (<GLOBAL-IN? ,FJORD ,HERE>
		<RETURN ,FJORD>)
	       (<EQUAL? ,HERE ,OASIS>
		<RETURN ,OASIS-OBJECT>)
	       (T
		<RFALSE>)>>

<OBJECT SMALL-VIAL-WATER
	(DESC "water in the small vial")
	(SYNONYM WATER GLOOP GLOOPS)
	(ADJECTIVE ONE TWO THREE FOUR INT.NUM)
	(FLAGS NARTICLEBIT)
	(GENERIC GENERIC-VIAL-WATER-F)
	(ACTION VIAL-WATER-F)>

<OBJECT LARGE-VIAL-WATER
	(DESC "water in the large vial")
	(SYNONYM WATER GLOOP GLOOPS)
	(ADJECTIVE ONE TWO THREE FOUR FIVE SIX SEVEN EIGHT NINE INT.NUM)
	(FLAGS NARTICLEBIT)
	(GENERIC GENERIC-VIAL-WATER-F)
	(ACTION VIAL-WATER-F)>

<ROUTINE VIAL-WATER-F ()
	 <COND (<AND <VERB? TAKE>
		     <EQUAL? ,P-PRSA-WORD ,W?REMOVE>>
		<PERFORM ,V?EMPTY-FROM ,WATER
			 <COND (<PRSO? ,LARGE-VIAL-WATER> ,LARGE-VIAL)
			       (T ,SMALL-VIAL)>>)>>

<ROUTINE GENERIC-VIAL-WATER-F (SR F "AUX" ADJ VB)
	 <COND (<SET ADJ <FIND-ADJS .F>>
		<SET ADJ <CONVERT-NUMBER .ADJ>>)>
	 <COND (<L? ,LARGE-VIAL-GLOOPS .ADJ>
		<COND (<L? ,SMALL-VIAL-GLOOPS .ADJ>
		       <RETURN <>>)
		      (T
		       <RETURN ,SMALL-VIAL-WATER>)>)
	       (T
		<COND (<L? ,SMALL-VIAL-GLOOPS .ADJ>
		       <RETURN ,LARGE-VIAL-WATER>)
		      (T
		       <RETURN <>>)>)
	       ;(<AND <EQUAL? <SET VB <PARSE-ACTION ,PARSE-RESULT>> ,V?POUR>
		      <PRSI? ,LARGE-VIAL>>
		<RETURN ,SMALL-VIAL-WATER>)
	       ;(<AND <EQUAL? .VB ,V?POUR>
		     <PRSI? ,SMALL-VIAL>>
		<RETURN ,LARGE-VIAL-WATER>)
	       ;(<AND <EQUAL? .VB ,V?EMPTY-FROM>
		     <PRSI? ,LARGE-VIAL>>
		<RETURN ,LARGE-VIAL-WATER>)
	       ;(<AND <EQUAL? .VB ,V?EMPTY-FROM>
		     <PRSI? ,SMALL-VIAL>>
		<RETURN ,SMALL-VIAL-WATER>)
	       ;(<GLOBAL-IN? ,WATER ,HERE>
		<RETURN ,WATER>)
	       ;(<AND <VISIBLE? ,SMALL-VIAL-WATER>
		     <VISIBLE? ,LARGE-VIAL-WATER>>
		<TELL ,WHICH-WATER>
		<RETURN ,ROOMS>)
	       ;(T
		<RETURN ,WATER>)>
	 ;<RFALSE>>

;<OBJECT SKY
	(LOC GLOBAL-OBJECTS)
	(DESC "sky")
	(SYNONYM SKY)
	(ACTION SKY-F)>

;<ROUTINE SKY-F ()
	 <COND (<AND <NOT <FSET? ,HERE ,OUTSIDEBIT>>
		     <HANDLE ,SKY>>
		<CANT-SEE ,SKY>)>>

<CONSTANT BODY-PART-OWNERS
	<TABLE (PURE LENGTH) PROTAGONIST DIMWIT JESTER EXECUTIONER
	       		     SICKLY-WITCH PRICKLY-WITCH>>

<OBJECT HANDS
	(LOC GLOBAL-OBJECTS)
	(SYNONYM HANDS HAND PALM FINGER FINGERS)
	(ADJECTIVE BARE YOUR)
	(DESC ;"your " "hands")
	(OWNER BODY-PART-OWNERS ;PROTAGONIST)
	(FLAGS NDESCBIT PLURALBIT TOUCHBIT ;NARTICLEBIT PARTBIT)
	(ACTION HANDS-F)>

<ROUTINE HANDS-F ("AUX" ACTOR)
	 <COND (<VERB? CLEAN>
		<WASTES>)  
	       (<VERB? SHAKE>
		<COND (<SET ACTOR <FIND-IN ,HERE ,ACTORBIT "with">>
		       <PERFORM ,V?SHAKE-WITH ,HANDS .ACTOR>
		       <RTRUE>)
		      (T
		       <TELL "There's no one here to shake hands with." CR>)>)
	       (<VERB? COUNT>
		<COND (<NOUN-USED? ,HANDS ,W?FINGER ,W?FINGERS>
		       <TELL "Ten">)
		      (T
		       <TELL "Two">)>
		<TELL ", as usual." CR>)
	       (<AND <VERB? OPEN CLOSE>
		     ,HAND-IN-WALDO>
		<PERFORM-PRSA ,WALDO>
		<RTRUE>)
	       (<VERB? REMOVE TAKE-OFF>
		<COND (,HAND-IN-WALDO
		       <SETG HAND-IN-WALDO <>>
		       <TELL "You withdraw your hand." CR>)
		      (,FINGER-ON-STRAW
		       <SETG FINGER-ON-STRAW <>>
		       <SETG ELIXIR-TRAPPED <>>
		       <TELL
"You remove your finger from the end of the straw." CR>)
		      (T
		       <TELL
"To quote an old song, \"The hand bone's connected to the
wrist bone...\"" CR>)>)
	       (<AND <VERB? PUT-ON>
		     <PRSO? ,GLOVE>>
		<PERFORM ,V?WEAR ,GLOVE>
		<RTRUE>)
	       (<AND <VERB? TAKE-WITH>
		     <PRSI? ,HANDS>>
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)
	       (<AND <VERB? SNAP>
		     <NOUN-USED? ,HANDS ,W?FINGER ,W?FINGERS>
		     <NOT ,TIME-STOPPED>>
		<COND (<IN? ,PROTAGONIST ,SMALL-THRONE>
		       <COND (,SECRET-PASSAGE-OPEN
			      <SETG SECRET-PASSAGE-OPEN <>>
			      <SETG COMPASS-CHANGED T>
			      <TELL "The secret passage closes!" CR>)
			     (,SECRET-PASSAGE-DISCOVERED
			      <SETG SECRET-PASSAGE-OPEN T>
			      <SETG COMPASS-CHANGED T>
			      <TELL "The secret passage opens once again." CR>)
			     (T
			      <SETG SECRET-PASSAGE-OPEN T>
			      <SETG SECRET-PASSAGE-DISCOVERED T>
			      <SETG COMPASS-CHANGED T>
			      <TELL
"Behind the throne, accompanied by a puff of dust, a secret passage grinds
open, leading south into darkness!">
			      <COND (<IN? ,JESTER ,HERE>
				     <TELL
" The jester applauds you, howling with mysterious delight.">)>
			      <CRLF>
			      <INC-SCORE ,SECRET-PASSAGE-SCORE>
			      <SETG SECRET-PASSAGE-SCORE 0>
			      <RTRUE>)>)
		      (T
		       <TELL "\"Snap!\"" CR>)>)
	       ;(<AND <VERB? PUT-ON>
		     <PRSI? ,EYES>>
		<PERFORM ,V?SPUT-ON ,EYES ,HANDS>
		<RTRUE>)
	       ;(<AND <VERB? PUT-ON PUT>
		     <PRSI? ,EARS>>
		<PERFORM ,V?SPUT-ON ,EARS ,HANDS>
		<RTRUE>)>>

<OBJECT FEET
	(LOC GLOBAL-OBJECTS)
	(SYNONYM FEET FOOT TOE TOES)
	(ADJECTIVE YOUR)
	(DESC ;"your " "feet")
	(OWNER BODY-PART-OWNERS ;PROTAGONIST)
	(FLAGS NDESCBIT PLURALBIT TOUCHBIT ;NARTICLEBIT PARTBIT)>

<OBJECT HEAD
	(LOC GLOBAL-OBJECTS)
	(DESC "head" ;"your head")
	(SYNONYM HEAD)
	(OWNER BODY-PART-OWNERS ;PROTAGONIST)
	(FLAGS ;NARTICLEBIT PARTBIT)>

<OBJECT EYES
	(LOC GLOBAL-OBJECTS)
	(DESC ;"your " "eyes")
	(SYNONYM EYE EYES)
	(ADJECTIVE MY ORACLE\'S AMULET\'S FIRST SECOND THIRD FOURTH
	 	   ONE TWO THREE FOUR)
	(OWNER BODY-PART-OWNERS ;PROTAGONIST)
	(FLAGS ;NARTICLEBIT PLURALBIT PARTBIT)
	(ACTION EYES-F)>

<ROUTINE EYES-F ("AUX" WHOSE-EYE)
	 <COND (<ADJ-USED? ,EYES ,W?MY>
		<SET WHOSE-EYE ,PROTAGONIST>)
	       (<ADJ-USED? ,EYES ,W?ORACLE\'S>
		<SET WHOSE-EYE ,ORACLE-OBJECT>)
	       (<ADJ-USED? ,EYES ,W?AMULET\'S>
		<SET WHOSE-EYE ,AMULET>)
	       (<EQUAL? ,HERE ,ORACLE>
		<SET WHOSE-EYE ,ORACLE-OBJECT>)
	       (<VISIBLE? ,AMULET>
		<SET WHOSE-EYE ,AMULET>)
	       (T
		<SET WHOSE-EYE ,PROTAGONIST>)>
	 <COND (<AND <OR <ADJ-USED? ,EYES ,W?THREE ,W?FOUR>
		     	 <ADJ-USED? ,EYES ,W?THIRD ,W?FOURTH>>
		     <EQUAL? .WHOSE-EYE ,PROTAGONIST>>
		<CANT-SEE ,EYES>)
	       (<VERB? COUNT>
		<COND (<EQUAL? .WHOSE-EYE ,PROTAGONIST>
		       <TELL
"Two, unless you've been careless with pointy sticks lately." CR>)
		      (T
		       <TELL "Four." CR>)>)
	       (<AND <VERB? OPEN CLOSE>
		     <EQUAL? .WHOSE-EYE ,ORACLE-OBJECT ,AMULET>>
		<TELL "There's no way to do that yourself." CR>)
	       (<VERB? CLOSE>
		<PERFORM ,V?SLEEP>
		<RTRUE>)
	       (<VERB? OPEN>
		<TELL "Your eyes ARE open!" CR>)>>

;<OBJECT EARS
	(LOC GLOBAL-OBJECTS)
	(DESC ;"your " "ears")
	(SYNONYM EAR EARS)
	(ADJECTIVE YOUR)
	(OWNER BODY-PART-OWNERS ;PROTAGONIST)
	(FLAGS ;NARTICLEBIT PLURALBIT PARTBIT)>

<OBJECT NOSE
	(LOC GLOBAL-OBJECTS)
	(DESC ;"your " "nose")
	(SYNONYM NOSE NOSTRIL)
	(ADJECTIVE YOUR)
	(OWNER BODY-PART-OWNERS ;PROTAGONIST)
	(FLAGS ;NARTICLEBIT PARTBIT)
	(ACTION NOSE-F)>

<ROUTINE NOSE-F ()
	 <COND (<VERB? PICK>
		<TELL "Oh, gross!" CR>)>>

<OBJECT MOUTH
	(LOC GLOBAL-OBJECTS)
	(DESC ;"your " "mouth")
	(SYNONYM MOUTH)
	(ADJECTIVE YOUR)
	(OWNER BODY-PART-OWNERS ;PROTAGONIST)
	(FLAGS ;NARTICLEBIT PARTBIT)
	(ACTION MOUTH-F)>

<ROUTINE MOUTH-F ()
	 <COND (<AND <VERB? PUT>
		     <PRSI? ,MOUTH>>
		<COND (<PRSO? ,DRINKING-STRAW>
		       <TELL
"Other than perhaps satisfying some primitive phallic urge of yours, this
accomplishes nothing. [If you want to drink something with the straw, just
try DRINK THING WITH STRAW!]" CR>)
		      (T
		       <PERFORM ,V?EAT ,PRSO>
		       <RTRUE>)>)
	       (<VERB? ENTER>
		<TELL "That would involve quite a contortion!" CR>)>>

<OBJECT PROTAGONIST
	(LOC BANQUET-HALL)
	;(SYNONYM PROTAGONIST)
	(DESC "it")
	(SIZE 1) ;"since routine WEIGHT adds PROTAGONIST weight to load"
	(FLAGS NDESCBIT ;INVISIBLE ;ACTORBIT TRANSBIT SEARCHBIT
  ;"last BIT added at Stu's suggestion for JESTER, TAKE thing you're holding")
	;(ACTION PROTAGONIST-F)>

;<ROUTINE PROTAGONIST-F ("OPT" (ARG <>))
	 <RFALSE>>

<OBJECT ME
	(LOC GLOBAL-OBJECTS)
	(SYNONYM ;I ME MYSELF SELF ;YOU ;YOURSELF)
	(DESC "yourself")
	(FLAGS ;ACTORBIT TOUCHBIT NARTICLEBIT)
	(RESEARCH
"Son of a gun! There's no entry about you! This is one worthless
encyclopedia, huh? Why, you're about as famous as they come! At
least a third of the people in your village have heard of you, for
instance...")
	(ACTION ME-F)>

<ROUTINE ME-F () 
	 <COND (<VERB? TELL YELL>
		<TELL
"Talking to yourself is a sign of impending mental collapse." CR>
		<STOP>)
	       (<VERB? ALARM>
		<TELL "You are already awake." CR>)
	       (<VERB? EXAMINE>
		<V-DIAGNOSE>)
	       (<AND <VERB? GIVE>
		     <PRSI? ,ME>>
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)
	       (<AND <VERB? SHOW>
		     <PRSI? ,ME>>
		<PERFORM ,V?EXAMINE ,PRSO>
		<RTRUE>)
	       (<VERB? MOVE>
		<V-WALK-AROUND>)
	       (<VERB? SEARCH>
		<V-INVENTORY>
		<RTRUE>)
	       (<VERB? KILL MUNG>
		<JIGS-UP "Done.">)
	       (<VERB? FIND>
		<TELL "You're in" TR ,HERE>)>>

<OBJECT GLOBAL-HERE
	(LOC GLOBAL-OBJECTS)
	(DESC "room")
	(SYNONYM ROOM PLACE LOCATION HALL AREA THERE HERE)
	(ACTION GLOBAL-HERE-F)>

<ROUTINE GLOBAL-HERE-F ()
	 <COND (<VERB? LOOK LOOK-INSIDE EXAMINE>
		<V-LOOK>)
	       (<VERB? ENTER WALK-TO>
		<COND (<EQUAL? ,HERE ,LAKE-FLATHEAD>
		       <PERFORM ,V?SWIM ,LAKE-FLATHEAD>
		       <RTRUE>)
		      (T
		       <TELL ,LOOK-AROUND>)>)
	       (<VERB? LEAVE EXIT>
		<DO-WALK ,P?OUT>)
	       (<VERB? SEARCH>
		<TELL ,NOTHING-NEW>)
	       (<AND <VERB? PUT>
		     <PRSI? ,GLOBAL-HERE>>
		<COND (<EQUAL? ,P-PRSA-WORD ,W?THROW>
		       <PERFORM ,V?THROW ,PRSO>
		       <RTRUE>)
		      (T
		       <PERFORM ,V?DROP ,PRSO>
		       <RTRUE>)>)>>

<OBJECT GLOBAL-BUILDING
	(LOC LOCAL-GLOBALS)
	(DESC "building")
	(SYNONYM BUILDING CLUSTER)
	(ADJECTIVE NEW SMALL STONE IMPRESSIVE)
	(ACTION GLOBAL-BUILDING-F)>

<ROUTINE GLOBAL-BUILDING-F ()
	 <COND (<AND <VERB? ENTER>
		     <EQUAL? ,HERE ,FISHING-VILLAGE ,WHARF>>
		<DO-WALK ,P?NORTH>)
	       (<VERB? EXIT LEAVE>
		<DO-WALK ,P?OUT>)>>

<OBJECT ARCH
	(LOC LOCAL-GLOBALS)
	(DESC "arch")
	(SYNONYM ARCH ARCHWAY)
	(ADJECTIVE STONE CRUMBLING)
	(FLAGS VOWELBIT)
	(ACTION ARCH-F)>

<ROUTINE ARCH-F ()
	 <COND (<VERB? ENTER>
		<V-WALK-AROUND>)>>

<OBJECT WINDOW
	(LOC LOCAL-GLOBALS)
	(DESC "window")
	(SYNONYM WINDOW WINDOWS GLASS PANE PANES)
	(ADJECTIVE NARROW WIDER SLITTED GLASS BROKEN WINDOW)
	(FLAGS NDESCBIT)
	(ACTION WINDOW-F)>

<ROUTINE WINDOW-F ()
	 <COND (<VERB? LOOK-INSIDE>
		<COND (<EQUAL? ,HERE ,GONDOLA>
		       <COND (<EQUAL? ,DIRIGIBLE-COUNTER 0>
			      <TELL "The dirigible is moored in a hangar." CR>)
			     (<EQUAL? ,DESTINATION ,SMALLER-HANGAR>
			      <TELL
<GET ,DIRIGIBLE-TRIP-DESCS <- ,DIRIGIBLE-COUNTER 2>> CR>)
			     (T
			      <TELL
<GET ,DIRIGIBLE-TRIP-DESCS <- 5 ,DIRIGIBLE-COUNTER>> CR>)>)
		      (<EQUAL? ,HERE ,DIMWITS-ROOM ,BASTION ,SOLAR>
		       <TELL
"The window offers a splendid view of the castle grounds." CR>)
		      (<EQUAL? ,HERE ,HOTHOUSE>
		       <TELL "You see a ruined castle." CR>)
		      (<EQUAL? ,HERE ,FROBOZZCO-PENTHOUSE
			       	     ,OFFICES-NORTH ,OFFICES-SOUTH
				     ,OFFICES-EAST ,OFFICES-WEST>
		       <COND (<OR <EQUAL? ,HERE ,FROBOZZCO-PENTHOUSE>
				  <G? ,FLOOR-NUMBER 20>>
			      <TELL
"You can't see much; the air is pretty smoggy today." CR>)
			     (T
		       	      <TELL
"The window offers a good view of Flatheadia." CR>)>) 
		      (T
		       <TELL "Bug 29." CR>)>)
	       (<VERB? OPEN CLOSE>
		<COND (<EQUAL? ,HERE ,HOTHOUSE>
		       <TELL "There's not much left of the windows." CR>)
		      (<EQUAL? ,HERE ,DIMWITS-ROOM ,BASTION ,SOLAR>
		       <TELL
"The window is just a narrow slit in the stone wall; there's no way
to open or close it." CR>)
		      (T
		       <TELL "The window is unopenable." CR>)>)
	       (<VERB? ENTER EXIT LEAP-OFF>
		<COND (<EQUAL? ,HERE ,HOTHOUSE>
		       <TELL
"You cut yourself to ribbons on the broken glass." CR>)
		      (<EQUAL? ,HERE ,DIMWITS-ROOM ,BASTION ,SOLAR>
		       <TELL
"These slitted windows are narrower than your body." CR>)
		      (T
		       <DO-FIRST "open" ,WINDOW>)>)
	       (<VERB? PUT-THROUGH>
		<COND (<EQUAL? ,HERE ,HOTHOUSE ,DIMWITS-ROOM ,SOLAR ,BASTION>
		       <REMOVE ,PRSO>
		       <TELL
"You hear a \"splat\" as" T ,PRSO " sinks into the ">
		       <COND (<EQUAL? ,HERE ,HOTHOUSE>
			      <COND (<OR <PRSO? ,PERCH>
					 <ULTIMATELY-IN? ,PERCH ,PRSO>>
				     <SETG REMOVED-PERCH-LOC ,WATER>)>
			      <TELL "swamp outside">)
			     (T
			      <COND (<OR <PRSO? ,PERCH>
					 <ULTIMATELY-IN? ,PERCH ,PRSO>>
				     <SETG REMOVED-PERCH-LOC ,GROUND>)>
			      <TELL"ground far below">)>
		       <TELL ,PERIOD-CR>)
		      (T
		       <DO-FIRST "open" ,WINDOW>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,HOTHOUSE>>
		<TELL "Many of the window panes are shattered." CR>)>>

<OBJECT LOCK-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "lock")
	(SYNONYM LOCK KEYHOLE HOLE)
	(ADJECTIVE LARGE BASIC COMBINATION KEY)
	(ACTION LOCK-OBJECT-F)>

<ROUTINE LOCK-OBJECT-F ()
	 <COND (<AND <NOUN-USED? ,LOCK-OBJECT ,W?KEYHOLE>
		     <EQUAL? ,HERE ,LOWEST-HALL>>
		<CANT-SEE ,LOCK-OBJECT>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,LOWEST-HALL>
		       <TELL "It's a large combination dial lock." CR>)
		      (T
		       <TELL "It's your basic keyhole lock." CR>)>)
	       (<VERB? LOOK-INSIDE>
		<TELL
"You see nothing of interest, you shameless Peeping Tom you." CR>)
	       (<VERB? PICK>
		<TELL "You have neither the tools nor the expertise." CR>)
	       (<AND <VERB? OPEN UNLOCK LOCK>
		     <PRSO? ,LOCK-OBJECT>>
		<COND (<GLOBAL-IN? ,EAST-DOOR ,HERE>
		       <PERFORM-PRSA ,EAST-DOOR ,PRSI>)
		      (<GLOBAL-IN? ,WEST-DOOR ,HERE>
		       <PERFORM-PRSA ,WEST-DOOR ,PRSI>)
		      (<GLOBAL-IN? ,VAULT-DOOR ,HERE>
		       <PERFORM-PRSA ,VAULT-DOOR ,PRSI>)
		      (<EQUAL? ,HERE ,ATTIC>
		       <PERFORM-PRSA ,TRUNK ,PRSI>)>)>>

<OBJECT SIGN
	(LOC LOCAL-GLOBALS)
	(DESC "sign")
	(SYNONYM SIGN)
	(ADJECTIVE LARGE EYE-CATCHING)
	(FLAGS READBIT)
	(ACTION SIGN-F)>

<ROUTINE SIGN-F ("AUX" NUM)
	 <COND (<VERB? READ EXAMINE>
		<COND (<EQUAL? ,HERE ,EXIT>
		       <TELL
"\"ROCKVILLE ESTATES: The new, prestigious address for the discriminating
Young Underground Professional|
64 units, Occupancy Spring 881|
Frobozz Magic Construction Company|
Quizbo Frotzwit, Managing Foreman\"" CR>)
		      (<EQUAL? ,HERE ,CROSSROADS>
		       <TELL
"\"JUNCTION of GUH-90 and GUH-95|
NORTH: Flatheadia, 1 bloit|
SOUTH: Shadowland, 15 bloits|
       Royal Museum, 17 bloits|
       Fublio Valley, 90 bloits|
EAST:  White Cliffs Beach, 4 bloits|
       Flood Control Dam #3, 4 bloits|
       Aragain Falls, 5 bloits|
WEST:  Port Foozle, 9 bloits|
       Quilbozza Beach, 9 bloits\"" CR>)
		      (<EQUAL? ,HERE ,FISHING-VILLAGE>
		       <TELL "\"Sinners: Enter here for purification!\"" CR>)
		      (<EQUAL? ,HERE ,INQUISITION>
		       <TELL
"\"Sinners, take note!|
1. We cannot execute everyone at once! Please take a number!|
2. Everyone is permitted a final request.|
3. Tell the executioner your request when your number is called.|
4. If we cannot grant your final wish, we shall be quick and merciful. We
will behead you.|
5. If we CAN grant your final wish, we will hang you. Please note that this
is slow and excrutiatingly painful.\"" CR>)
		      (<EQUAL? ,HERE ,NORTH-OF-ANTHAR>
		       <TELL
"\"We've got as many refugees from the Eastlands as we can handle!
Go somewhere else!\"" CR>)
		      (<EQUAL? ,HERE ,MINE-ENTRANCE>
		       <TELL "\"Warning! Falling rock zone!\"" CR>)
		      (<EQUAL? ,HERE ,TOLL-PLAZA>
		       <TELL
"\"Exact Change Only: 1 Zorkmid (coins only).\" Below
the sign is a basket." CR>)
		      (<EQUAL? ,HERE ,OUTSIDE-HOVEL>
		       <TELL "\"Korboz the Magnificent\"" CR>)
		      (<EQUAL? ,HERE ,OUTSIDE-SHACK>
		       <TELL
"\"Warning! This shack is protected against looting by powerful magic!\"" CR>)
		      (<EQUAL? ,HERE ,WARNING-ROOM>
		       <TELL
"\"Warning! This area is populated by three races: the Veritassi (who always
tell the truth), the Prevaricons (who always lie), and the Wishyfoo (who
alternate with every statement). Be aware that visitors to Veritass and
Prevaricon areas are immediately fed to ravenous hellhounds.\"" CR>)
		      (T
		       <TELL "Bug 49">)>)>>

<OBJECT STAIRS
	(LOC LOCAL-GLOBALS)
	(DESC "stair")
	(SYNONYM FLIGHT STAIR STAIRS STAIRWAY STEP STEPS STAIRCASE GANGWAY)
	(ADJECTIVE STEEP OMINOUS DARK WIDE STONE CIRCULAR WINDING SPIRAL
	 	   COBWEBBY CRUDE FORBIDDING DECREPIT)
	(ACTION STAIRS-F)>

<ROUTINE STAIRS-F ()
	 <COND (<VERB? CLIMB CLIMB-UP>
		<DO-WALK ,P?UP>)
	       (<VERB? CLIMB-DOWN>
		<DO-WALK ,P?DOWN>)>>

<OBJECT FIXED-LADDER
	(LOC LOCAL-GLOBALS)
	(DESC "ladder")
	(SYNONYM LADDER)
	(ADJECTIVE RICKETY)
	(ACTION FIXED-LADDER-F)>

<ROUTINE FIXED-LADDER-F ()
	 <COND (<VERB? CLIMB CLIMB-UP>
		<DO-WALK ,P?UP>)
	       (<VERB? CLIMB-DOWN>
		<DO-WALK ,P?DOWN>)
	       (<VERB? TAKE>
		<TELL "The ladder is attached to the wall." CR>)>>

<OBJECT BONES
	(LOC LOCAL-GLOBALS)
	(OWNER BONES)
	(DESC "pile of old bones")
	(SYNONYM BONE BONES PILE CREATURE ADVENTURER SKELETON SKELETONS)
	(ADJECTIVE ADVENTURER CREATURE OLD)
	(FLAGS NDESCBIT)
	(ACTION BONES-F)>

<ROUTINE BONES-F ()
	 <COND (<VERB? TAKE SEARCH MOVE>
		<TELL "Let the dead lie in peace." CR>)>>

;"status line stuff"

;<CONSTANT S-TEXT 0>       ;"<SCREEN 0> puts cursor in text part of screen"
;<CONSTANT S-WINDOW 1>     ;"<SCREEN 1> puts cursor in window part of screen"
;<CONSTANT H-NORMAL 0>     ;"<HLIGHT 0> returns printing to normal (default)"
;<CONSTANT H-INVERSE 1>    ;"<HLIGHT 1> sets printing mode to inverse video"
;<CONSTANT H-BOLD 2>      ;"<HLIGHT 2> sets printing mode to bold, else normal"
;<CONSTANT H-ITALIC 4>    ;"<HLIGHT 4> italicizes, else underline, else normal"
;<CONSTANT D-SCREEN-ON 1> ;"<DIROUT 1> turns on printing to the screen"
;<CONSTANT D-SCREEN-OFF -1>;"<DIROUT -1> turns off printing to the screen"
;<CONSTANT D-PRINTER-ON 2> ;"<DIROUT 2> turns on printing to the printer"
;<CONSTANT D-PRINTER-OFF -2>;"<DIROUT -2> turns off printing to the printer"
;<CONSTANT D-TABLE-ON 3>   ;"<DIROUT 3 .TABLE> turns on printing to that table"
;<CONSTANT D-TABLE-OFF -3> ;"<DIROUT -3> turns off printing to that table"
;<CONSTANT D-RECORD-ON 4>  ;"<DIROUT 4> sends READs and INPUTs to record file"
;<CONSTANT D-RECORD-OFF -4>;"<DIROUT -4> stops sending READ and INPUT to file"

<ROUTINE CLEAR-BORDER ("AUX" X Y)
   <PICINF-PLUS-ONE ,TEXT-WINDOW-PIC-LOC>
   <WINPOS ,S-WINDOW 1 1>
   <SET Y <ZGET ,PICINF-TBL 0>>
   <SET X <ZGET ,PICINF-TBL 1>>
   <WINSIZE ,S-WINDOW .Y <LOWCORE HWRD>>
   <CLEAR 1>
   <COND (<G? .X 1>
	  <WINPOS ,S-WINDOW <+ .Y 1> 1>
	  <WINSIZE ,S-WINDOW <- <LOWCORE VWRD> .Y> .X>
	  <CLEAR 1>
	  <WINPOS ,S-WINDOW <+ .Y 1> <+ <- <LOWCORE HWRD> .X> 1>>
	  <CLEAR 1>)>
   <SETG STATUS-LINE-SCORE -1>
   <SETG OLD-REGION <>>
   <SETG OLD-HERE <>>
   <SETG COMPASS-CHANGED T>>

; "Make text window extend to bottom of screen (more or less) or to
   top of bottom edge of border, depending..."
<ROUTINE ADJUST-TEXT-WINDOW (ID "AUX" (SCRY <LOWCORE VWRD>) WINY (ADJ 0))
	 <COND (.ID
		<PICINF .ID ,PICINF-TBL>
		<SET ADJ <ZGET ,PICINF-TBL 0>>)>
	 <SET WINY <- .SCRY <- <WINPROP ,S-TEXT ,WTOP> 1> .ADJ>>
	 <SET WINY <* ,FONT-Y </ .WINY ,FONT-Y>>>
	 <WINSIZE ,S-TEXT .WINY <WINPROP ,S-TEXT ,WWIDE>>>

;"Normal sizes/positions of windows 0 and 1."
<ROUTINE SPLIT-BY-PICTURE (ID "OPT" (CLEAR-SCREEN? <>) "AUX" Y X YS XS)
	 <SETG CURRENT-SPLIT .ID>
	 <COND (.CLEAR-SCREEN?
		<CLEAR -1>)>
	 <PICINF .ID ,PICINF-TBL>
	 <WINPOS ,S-TEXT <+ <SET Y <ZGET ,PICINF-TBL 0>> 1>
		 <COND (,BORDER-ON <+ <SET X <ZGET ,PICINF-TBL 1>> 1>)
		       (T 1)>>
	 <WINSIZE ,S-TEXT <- <LOWCORE VWRD> .Y>
		  <COND (,BORDER-ON <- <LOWCORE HWRD> <* .X 2>>)
			(T <* ,WIDTH ,FONT-X>)>>
	 <WINPOS ,S-WINDOW 1 1>
	 <WINSIZE ,S-WINDOW .Y <LOWCORE HWRD>>>

<ROUTINE INIT-SL-WITH-SPLIT (WHICH "OPT" (DONT-CLEAR <>) "AUX" YFUDGE)
    <COND (.DONT-CLEAR
	   <SET YFUDGE <- <WINPROP ,S-TEXT ,WHIGH> <WINPROP ,S-TEXT ,WYPOS>>>)>
    <COND (.WHICH
	   <SETG CURRENT-SPLIT .WHICH>)>
    <INIT-STATUS-LINE .DONT-CLEAR>
    <COND (.DONT-CLEAR
	   <CURSET <- <WINPROP ,S-TEXT ,WHIGH> .YFUDGE> 1>)>>

<REPLACE-DEFINITION STATUS-LINE
;"gets called only at START of game unless otherwise"
<ROUTINE INIT-STATUS-LINE ("OPT" (DONT-CLEAR <>) "AUX" (NUM 1) X Y)
	 <SETG OLD-HERE <>>
	 <SETG OLD-REGION <>>
	 <SETG STATUS-LINE-SCORE -1>
	 <SETG COMPASS-CHANGED T>
	 <COND (<NOT .DONT-CLEAR>
		<CLEAR -1>)>
	 <SPLIT-BY-PICTURE ,CURRENT-SPLIT>
	 <COND (<EQUAL? ,CURRENT-SPLIT ,TEXT-WINDOW-PIC-LOC>
		<ADJUST-TEXT-WINDOW 0>)
	       (<EQUAL? ,CURRENT-SPLIT ,FANUCCI-SPLIT>
		<ADJUST-TEXT-WINDOW ,FANUCCI-BORDER-BOTTOM>
		<RTRUE>)
	       (T
		<ADJUST-TEXT-WINDOW ,PEGGLEBOZ-BORDER-BOTTOM>
		<RTRUE>)>
	 <SCREEN ,S-FULL>
	 <COND (,BORDER-ON
		<DISPLAY <SET-BORDER> 1 1>)
	       (T
		<HLIGHT ,H-INVERSE>
		<INVERSE-LINE 1>
		<INVERSE-LINE 2>
		<INVERSE-LINE 3>
		<INVERSE-LINE 4>)>
	 <SCREEN ,S-WINDOW>
	 <FONT 4> ;"non-proportional"
	 <PICINF-PLUS-ONE ,HERE-LOC>
	 <CURSET <+ <GET ,PICINF-TBL 0> ,FONT-Y> <GET ,PICINF-TBL 1>>
	 <COND (<OR <EQUAL? <LOWCORE INTID> ,DEC-20>
		    <NOT ,BORDER-ON>>
		<HLIGHT ,H-INVERSE>)>
	 <COLOR 1 -1>
	 <TELL "Moves:">
	 <PICINF-PLUS-ONE ,REGION-LOC>
	 <CURSET <+ <GET ,PICINF-TBL 0> ,FONT-Y>
		 <- <GET ,PICINF-TBL 1> <* ,FONT-X 10>>>
	 <TELL "Score:">
	 <COLOR 1 1>
	 <FONT 1> ;"proportional"
	 <COND (<EQUAL? <LOWCORE INTID> ,DEC-20>
		<HLIGHT ,H-NORMAL>)>
	 <SCREEN ,S-TEXT>
	 <RFALSE>>>

<ROUTINE SET-BORDER ()
	 <COND (<AND <EQUAL? ,HERE ,GONDOLA>
		     <G? ,DIRIGIBLE-COUNTER 0>>
		<RETURN ,OUTSIDE-BORDER>)
	       (<EQUAL? ,HERE ,FORMAL-GARDEN ,COURTYARD>
		<RETURN ,CASTLE-BORDER>)
	       (<EQUAL? ,HERE ,BARBICAN ,UPPER-BARBICAN ,GARRISON>
		<RETURN ,OUTSIDE-BORDER>)
	       (<FSET? ,HERE ,OUTSIDEBIT>
		<RETURN ,OUTSIDE-BORDER>)
	       (<FSET? ,HERE ,UNDERGROUNDBIT>
		<RETURN ,UNDERGROUND-BORDER>)
	       (T
		<RETURN ,CASTLE-BORDER>)>>

<ROUTINE PRINT-SPACES (CNT)
	 <REPEAT ()
		 <COND (<L? <SET CNT <- .CNT 1>> 0>
			<RETURN>)
		       (T
			<PRINTC 32>)>>>

<CONSTANT SLINE <ITABLE NONE 41 ;82>>

<GLOBAL OLD-HERE <>> ;"is set to present HERE room."

<GLOBAL OLD-REGION <>>

<GLOBAL STATUS-LINE-SCORE -1> ;"if start at 0, STATUS-LINE never puts up the 0"

<GLOBAL WIDTH 0>

<GLOBAL COMPASS-CHANGED T>

<CONSTANT TITLE-SCREEN-PICTURE 1>

<GLOBAL CURRENT-SPLIT <>> ;"set to TEXT-WINDOW-PIC-LOC in GO"
;"tells REFRESH etc. whether the screen is normal, a jester game, or whatever"

;"call v-$refresh to during game if want to clear junk"
<ROUTINE UPDATE-STATUS-LINE ()
	 <SCREEN ,S-WINDOW>
	 <FONT 4> ;"non-proportional"
	 <COND (<OR <EQUAL? <LOWCORE INTID> ,DEC-20>
		    <NOT ,BORDER-ON>>
		<HLIGHT ,H-INVERSE>)>
	 <PICINF ,HERE-LOC ,PICINF-TBL>
	 <CURSET <GET ,PICINF-TBL 0> <GET ,PICINF-TBL 1>>
	 <COLOR 1 -1>
	 <COND (<NOT <EQUAL? ,HERE ,OLD-HERE>> ;"Print loc if it's a new loc"
		<SETG OLD-HERE ,HERE>
		<PICINF-PLUS-ONE ,HERE-LOC>
		<CURSET <GET ,PICINF-TBL 0> <GET ,PICINF-TBL 1>>
		<PRINT-SPACES 23>
		<CURSET <GET ,PICINF-TBL 0> <GET ,PICINF-TBL 1>>
		<COND (<EQUAL? ,HERE ,G-U-MOUNTAIN>
		       <TELL "Great Undergd. Mountain">)
		      (<EQUAL? ,HERE ,G-U-SAVANNAH>
		       <TELL "Great Undergd. Savannah">)
		      (<EQUAL? ,HERE ,G-U-HIGHWAY>
		       <TELL "Great Undergd. Highway">)
		      (T
		       <TELL D ,HERE>)>)>
	 <COND (<NOT <EQUAL? <GETP ,HERE ,P?REGION> ,OLD-REGION>>
		<SETG OLD-REGION <GETP ,HERE ,P?REGION>>
		<PICINF-PLUS-ONE ,REGION-LOC>
		<CURSET <GET ,PICINF-TBL 0>
			<- <GET ,PICINF-TBL 1> <* ,FONT-X 23>>>
		<PRINT-SPACES 23>
		<DIROUT ,D-TABLE-ON ,SLINE> ;"start printing to buffer"
		<PUT ,SLINE 0 0>
		<TELL ,OLD-REGION>
		<DIROUT ,D-TABLE-OFF>
		<CURSET <GET ,PICINF-TBL 0>
			<- <GET ,PICINF-TBL 1> <* ,FONT-X <GET ,SLINE 0>>>>
		<TELL ,OLD-REGION>)>
	 <PICINF-PLUS-ONE ,HERE-LOC>
	 <CURSET <+ <GET ,PICINF-TBL 0> ,FONT-Y>
		 <+ <GET ,PICINF-TBL 1> <* ,FONT-X 8>>>
	 <PRINT-SPACES 5>
	 <CURSET <+ <GET ,PICINF-TBL 0> ,FONT-Y>
		 <+ <GET ,PICINF-TBL 1> <* ,FONT-X 8>>>
	 <PRINTN ,MOVES>
	 <COND (<NOT <EQUAL? ,SCORE ,STATUS-LINE-SCORE>> ;"score changed?"
	        <SETG STATUS-LINE-SCORE ,SCORE>
		<PICINF-PLUS-ONE ,REGION-LOC>
	 	<CURSET <+ <GET ,PICINF-TBL 0> ,FONT-Y>
			<- <GET ,PICINF-TBL 1> <* ,FONT-X 4>>>
		<PRINT-SPACES 4>
		<CURSET <+ <GET ,PICINF-TBL 0> ,FONT-Y>
			<- <GET ,PICINF-TBL 1>
			   <* ,FONT-X <COND (<OR <G? ,SCORE 999>
			   		         <L? ,SCORE -99>> 4)
					    (<OR <G? ,SCORE 99>
						 <L? ,SCORE -9>> 3)
					    (<OR <G? ,SCORE 9>
						 <L? ,SCORE 0>> 2)
					    (T 1)>>>>
		<PRINTN ,SCORE>)>
	 <COLOR 1 1>
	 <COND (<OR <EQUAL? <LOWCORE INTID> ,DEC-20>
		    <NOT ,BORDER-ON>>
		<HLIGHT ,H-NORMAL>)>
	 <COND (<AND ,COMPASS-CHANGED
		     ,BORDER-ON>
		<SETG COMPASS-CHANGED <>>
		<PICINF-PLUS-ONE ,COMPASS-PIC-LOC>
		<DRAW-COMPASS-ROSE ,P?NORTH ,N-HIGHLIGHTED ,N-UNHIGHLIGHTED>
		<DRAW-COMPASS-ROSE ,P?NE ,NE-HIGHLIGHTED ,NE-UNHIGHLIGHTED>
		<DRAW-COMPASS-ROSE ,P?EAST ,E-HIGHLIGHTED ,E-UNHIGHLIGHTED>
		<DRAW-COMPASS-ROSE ,P?SE ,SE-HIGHLIGHTED ,SE-UNHIGHLIGHTED>
		<DRAW-COMPASS-ROSE ,P?SOUTH ,S-HIGHLIGHTED ,S-UNHIGHLIGHTED>
		<DRAW-COMPASS-ROSE ,P?SW ,SW-HIGHLIGHTED ,SW-UNHIGHLIGHTED>
		<DRAW-COMPASS-ROSE ,P?WEST ,W-HIGHLIGHTED ,W-UNHIGHLIGHTED>
		<DRAW-COMPASS-ROSE ,P?NW ,NW-HIGHLIGHTED ,NW-UNHIGHLIGHTED>)>
	 <FONT 1> ;"proportional"
	 <SCREEN ,S-TEXT>
	 <RFALSE>>

<ROUTINE DRAW-COMPASS-ROSE (DIR HIGHLIGHT-PIC UNHIGHLIGHT-PIC)
	 <DISPLAY <COND (<AND <SHOW-DIRECTION? ,HERE .DIR <>>
			      ,LIT>
			 .HIGHLIGHT-PIC)
			(T
			 .UNHIGHLIGHT-PIC)>
		  <GET ,PICINF-TBL 0>
		  <GET ,PICINF-TBL 1>>>

<ROUTINE SHOW-DIRECTION? (RM DIR "OPTIONAL" (MAPPING T) "AUX" PTS)
	 <COND (<DELTA? ,HERE>
		<COND (<AND <EQUAL? ,HERE ,DELTA-1>
			    <EQUAL? .DIR ,P?SOUTH>
			    .MAPPING> ;"interferes with FROM ORACLE arrow"
		       <RFALSE>)
		      (T
		       <RTRUE>)>)
	       (<EQUAL? ,HERE ,CONSTRUCTION>
		<COND (<OR
			<AND <EQUAL? .DIR ,P?NORTH>
			     <INTBL? ,CONSTRUCTION-LOC ,NORTH-EXITS 11>>
			<AND <EQUAL? .DIR ,P?NE>
			     <INTBL? ,CONSTRUCTION-LOC ,NE-EXITS 17>>
			<AND <EQUAL? .DIR ,P?EAST>
			     <INTBL? ,CONSTRUCTION-LOC ,EAST-EXITS 15>>
			<AND <EQUAL? .DIR ,P?SE>
			     <INTBL? ,CONSTRUCTION-LOC ,SE-EXITS 7>>
			<AND <EQUAL? .DIR ,P?SOUTH>
			     <INTBL? <+ ,CONSTRUCTION-LOC 8> ,NORTH-EXITS 11>>
			<AND <EQUAL? .DIR ,P?SW>
			     <INTBL? <+ ,CONSTRUCTION-LOC 7> ,NE-EXITS 17>>
			<AND <EQUAL? .DIR ,P?WEST>
			     <INTBL? <- ,CONSTRUCTION-LOC 1> ,EAST-EXITS 15>>
			<AND <EQUAL? .DIR ,P?NW>
			     <INTBL? <- ,CONSTRUCTION-LOC 9> ,SE-EXITS 7>>>
		       <RTRUE>)
		      (T
		       <RFALSE>)>)
	       (<EQUAL? ,HERE ,PLAIN>
		<COND (<OR <AND <EQUAL? .DIR ,P?NORTH ,P?NE ,P?NW>
				<EQUAL? ,RANK 1>>
			   <AND <EQUAL? .DIR ,P?EAST ,P?NE ,P?SE>
				<EQUAL? ,FILE 8>>
			   <AND <EQUAL? .DIR ,P?SOUTH ,P?SE ,P?SW>
				<EQUAL? ,RANK 8>>
			   <AND <EQUAL? .DIR ,P?WEST ,P?SW ,P?NW>
				<EQUAL? ,FILE 1>>>
		       <RFALSE>)
		      (T
		       <RTRUE>)>)
	       (<AND <SET PTS <GETPT .RM .DIR>>
		     <NOT <EQUAL? <PTSIZE .PTS> ,NEXIT>>>
		<COND (<AND <EQUAL? .RM ,THRONE-ROOM>
			    <EQUAL? .DIR ,P?SOUTH>
	       	    	    <NOT ,SECRET-PASSAGE-OPEN>>
		       <RFALSE>)
		      (<AND <EQUAL? .RM ,G-U-MOUNTAIN>
			    <EQUAL? .DIR ,P?NORTH>
			    <IN? ,BOULDER ,HERE>>
		       <RFALSE>)
		      (<AND <EQUAL? .RM ,HOLLOW>
			    <EQUAL? .DIR ,P?SOUTH>
			    <NOT ,IRON-MINE-OPEN>>
		       <RFALSE>)
		      (<AND <EQUAL? .RM ,PEG-ROOM>
			    <EQUAL? .DIR ,P?NORTH>
			    <NOT ,PEG-PASSAGE-OPENED>>
		       <RFALSE>)
		      (<AND <EQUAL? .RM ,RUINED-HALL>
			    <EQUAL? .DIR ,P?EAST>
			    <NOT ,SECRET-ROOM-REVEALED>>
		       <RFALSE>)
		      (<EQUAL? .RM ,WEIRD-PASSAGEWAY>
		       <COND (<AND <EQUAL? .DIR ,P?NORTH>
			    	   <NOT <EQUAL? ,TOWER-BEATEN ,PYRAMID-ROOM>>
			    	   <NOT <FSET? ,PYRAMID-ROOM ,TOUCHBIT>>>
			      <RFALSE>)
			     (<AND <EQUAL? .DIR ,P?EAST>
			    	   <NOT <EQUAL? ,TOWER-BEATEN
						,PYRAMID-ROOM-RIGHT>>
				   <NOT <FSET? ,PYRAMID-ROOM-RIGHT ,TOUCHBIT>>>
			      <RFALSE>)
			     (<AND <EQUAL? .DIR ,P?WEST>
			    	   <NOT <EQUAL? ,TOWER-BEATEN
						,PYRAMID-ROOM-LEFT>>
			    	   <NOT <FSET? ,PYRAMID-ROOM-LEFT ,TOUCHBIT>>>
			      <RFALSE>)
			     (T
			      <RTRUE>)>)
		      (<NOT .MAPPING>
		       <RTRUE>)
		      (<AND <EQUAL? .RM ,COURTROOM>
			    <EQUAL? .DIR ,P?SOUTH>>
		       <RFALSE>)
		      (<AND <EQUAL? .RM ,TAX-OFFICE>
			    <EQUAL? .DIR ,P?SOUTH>>
		       <RFALSE>)
		      (<AND <EQUAL? .RM ,JESTERS-QUARTERS>
			    <EQUAL? .DIR ,P?SOUTH>>
		       <RFALSE>)
		      (<AND <EQUAL? .RM ,BASE-OF-MOUNTAIN>
			    <EQUAL? .DIR ,P?EAST>>
		       <RFALSE>)
		      (<AND <EQUAL? .RM ,G-U-MOUNTAIN>
			    <EQUAL? .DIR ,P?WEST>>
		       <RFALSE>)
		      (<AND <EQUAL? .RM ,FOOTHILLS>
			    <EQUAL? .DIR ,P?SOUTH>>
		       <RFALSE>)
		      (<AND <EQUAL? .RM ,BASE-OF-MOUNTAINS>
			    <EQUAL? .DIR ,P?NORTH>>
		       <RFALSE>)
		      (T
		       <RTRUE>)>)
	       (T
		<RFALSE>)>>

<ROUTINE SAY-HERE ("AUX" X)
	 <TELL D ,HERE>
	 <SET X <LOC ,PROTAGONIST>>
	 <COND (<IN? ,PROTAGONIST ,CARD-TABLE>
		<TELL ", at" T .X>)
	       (<AND <NOT <EQUAL? .X ,HERE>>
		     <FSET? .X ,VEHBIT>>
		<TELL ", ">
		<COND (<FSET? .X ,INBIT>
		       <TELL "i">)
		      (T
		       <TELL "o">)>
		<TELL "n" T .X>)
	       (,UNDER-TABLE
		<TELL ", under the table">)>
	 <RTRUE>>

;<ROUTINE CENTER (STRING LINE-NUM)
	 <DIROUT ,D-TABLE-ON ,SLINE> ;"start printing to buffer"
	 <PUT ,SLINE 0 0>
	 <TELL .STRING>
	 <DIROUT ,D-TABLE-OFF>
	 <CCURSET .LINE-NUM </ <- ,WIDTH <GET ,SLINE 0>> 2>>
	 <TELL .STRING>>

;<ROUTINE ITALICIZE (STR "OPTIONAL" (NO-CAPS? <>)
			"AUX" LEN (PTR 2) CHAR ;(SCRIPTING-ON <>))
	 ;<COND (<BTST <LOWCORE FLAGS> 1>
		<SET SCRIPTING-ON T>)>
	 ;<COND (.SCRIPTING-ON
		<DIROUT ,D-PRINTER-OFF>)>
	 <DIROUT ,D-SCREEN-OFF>
	 <DIROUT ,D-TABLE-ON ,SLINE>
	 <TELL .STR>
	 <DIROUT ,D-TABLE-OFF>
	 ;<COND (.SCRIPTING-ON
		<DIROUT ,D-PRINTER-ON>)>
	 ;<COND (<NOT <VERB? SCRIPT UNSCRIPT>>
		<DIROUT ,D-SCREEN-ON>)>
	 <DIROUT ,D-SCREEN-ON>
	 <SET LEN <+ <GET ,SLINE 0> 1>>
	 <COND (<EQUAL? .LEN 1>
		<RTRUE>)
	       (<OR <ZERO? <LOWCORE SERIAL>>  ; "ZIL?"
		    <BAND <LOWCORE ZVERSION> 8>> ; "ITALICS BIT SET?"
		<HLIGHT ,H-ITALIC>
		<REPEAT ()
			<SET CHAR <GETB ,SLINE .PTR>>
			<COND (<EQUAL? .CHAR 32> ; "SPACE?"
			       <HLIGHT ,H-NORMAL>
			       <PRINTC 32>
			       <HLIGHT ,H-ITALIC>)
			      (T
			       <PRINTC .CHAR>)>
			<COND (<EQUAL? .PTR .LEN>
			       <RETURN>)
			      (T
			       <SET PTR <+ .PTR 1>>)>>
		<HLIGHT ,H-NORMAL>)
	       (.NO-CAPS?
		<TELL .STR>)
	       (T                       ; "NO ITALICS, CAPITALIZE"
		<REPEAT ()
			<SET CHAR <GETB ,SLINE .PTR>>
			<COND (<AND <G? .CHAR 96>
				    <L? .CHAR 123>>
			       <SET CHAR <- .CHAR 32>>)>
			<PRINTC .CHAR>
			<COND (<EQUAL? .PTR .LEN>
			       <RETURN>)
			      (T
			       <SET PTR <+ .PTR 1>>)>>)>>

;<ROUTINE SEEING? (OBJ)
	 <COND (<AND <PRSO? .OBJ>
		     <EQUAL? ,PRSA 
		 ,V?EXAMINE ,V?LOOK ,V?LOOK-INSIDE ,V?READ ,V?FIND
		 ,V?SEARCH ,V?SHOW ,V?LOOK-UNDER ,V?LOOK-BEHIND 
		 ,V?LOOK-DOWN ,V?COUNT ,V?POINT>>
	        <RTRUE>)
	       (T
	        <RFALSE>)>>

<ROUTINE TOUCHING? (THING)
	 <COND (<AND <PRSO? .THING>
		     <EQUAL? ,PRSA ,V?TAKE ,V?TOUCH ,V?SHAKE ,V?CLEAN ,V?KISS
			           ,V?SWIM ,V?PUSH ,V?CLOSE ,V?LOOK-UNDER
				   ,V?MOVE ,V?OPEN ,V?KNOCK ,V?SET ,V?SHAKE
				   ,V?RAISE ,V?UNLOCK ,V?LOCK ,V?CLIMB-UP
				   ,V?CLIMB ,V?CLIMB-DOWN ,V?CLIMB-ON ,V?ON
				   ,V?ENTER ,V?OFF ,V?TASTE ,V?THROW ,V?TIE
				   ,V?LOOK-INSIDE ,V?STAND-ON ,V?MUNG ,V?KICK
				   ,V?KILL ,V?KNOCK ,V?CUT ,V?BITE ,V?PUSH
				   ,V?LOOK-BEHIND ,V?REACH-IN>>
		<RTRUE>)
	       (<AND <PRSI? .THING>
		     <VERB? GIVE PUT PUT-ON>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE HANDLE (OBJ) ;"used by action routines before calling CANT-SEE"
	 <COND (<OR <AND <EQUAL? .OBJ ,PRSO>
			 <EVERYWHERE-VERB? 1>>
		    <AND <EQUAL? .OBJ ,PRSI>
			 <EVERYWHERE-VERB? 2>>>
		<RFALSE>)
	       (T
		<RTRUE>)>>

;"this routine is fucked. When prsi is passed, PRSO is often printed. Fucked"
<ROUTINE CANT-SEE ("OPTIONAL" (OBJ <>) (STRING <>))
	 <SETG P-WON <>>
	 <TELL "[" ,YOU-CANT "see">
	 <COND (<OR <NOT .OBJ>
		    <AND .OBJ
			 <NOT <CAPITAL-NOUN? .OBJ>>>>
		<TELL " any">)>
	 <COND (<NOT .OBJ>
		<TELL " " .STRING>)
	       (<EQUAL? .OBJ ,PRSI>
		<PRSI-PRINT>)
	       (T
		<PRSO-PRINT>)>
	 <TELL " here.]" CR>
	 <STOP>>

<ROUTINE PRSO-PRINT ("AUX" PTR)
	 <COND (<OR ;,P-MERGED
		    <NOUN-USED? ,PRSO ,W?IT>
		    ;<EQUAL? <GET <SET PTR <GET ,P-ITBL ,P-NC1>> 0> ,W?IT>>
		<TELL " " D ,PRSO>)
	       (T
		<TELL !\ >
		<NP-PRINT <GET-NP ,PRSO>>
		;<BUFFER-PRINT .PTR <GET ,P-ITBL ,P-NC1L> <>>)>>

<ROUTINE PRSI-PRINT ("AUX" PTR)
	 <COND (<OR ;,P-MERGED
		    <NOUN-USED? ,PRSI ,W?IT>
		    ;<EQUAL? <GET <SET PTR <GET ,P-ITBL ,P-NC2>> 0> ,W?IT>>
		<TELL " " D ,PRSI>)
	       (T
		<TELL !\ >
		<NP-PRINT <GET-NP ,PRSI>>
		;<BUFFER-PRINT .PTR <GET ,P-ITBL ,P-NC2L> <>>)>>

<ROUTINE CANT-VERB-A-PRSO (STRING)
	 <TELL ,YOU-CANT .STRING A ,PRSO "!" CR>>

;<ROUTINE NOW-TIED (OBJ)
	 <TELL "Okay," T ,PRSO " is now tied to" TR .OBJ>>

<ROUTINE TELL-HIT-HEAD ()
	 <TELL
"You hit your head against" T ,PRSO " as you attempt this feat." CR>>

<ROUTINE OPEN-CLOSED (OBJ)
	 <COND (<FSET? .OBJ ,OPENBIT>
		<TELL "open">)
	       (T
		<TELL "closed">)>>

;<ROUTINE IN-YOUR-PACKAGE (STRING)
	 <TELL "This is the " .STRING " that came in your package.">>

<ROUTINE CANT-REACH (OBJ)
	 <COND (<AND ,HAND-IN-WALDO
		     <NOT <EQUAL? .OBJ ,WALDO>>
		     <IN? .OBJ ,HERE>>
		<TELL "The waldo doesn't seem capable of that." CR>)
	       (,UNDER-TABLE
		<TELL
,YOULL-HAVE-TO "get out from under the table in order to reach it." CR>)
	       (T
	 	<TELL ,YOU-CANT "reach" T .OBJ>
	 	<COND (<NOT <IN? ,PROTAGONIST ,HERE>>
		       <TELL " from" T <LOC ,PROTAGONIST>>)>
		<TELL ,PERIOD-CR>)>>

;<ROUTINE EAGERLY-ACCEPTS ()
	 <MOVE ,PRSO ,PRSI>
	 <TELL "Eagerly," T ,PRSI " accepts" T ,PRSO>>

;<ROUTINE NOT-ON-GROUND (VEHICLE)
	 <TELL "But" T .VEHICLE " isn't on the ground!" CR>>

<ROUTINE DO-FIRST (STRING "OPTIONAL" (OBJ <>))
	 <TELL ,YOULL-HAVE-TO .STRING>
	 <COND (.OBJ
		<TPRINT .OBJ>)>
	 <TELL " first." CR>>

<ROUTINE NOT-IN ()
	 <TELL "But" T-IS-ARE ,PRSO "not ">
	 <COND (<FSET? ,PRSI ,ACTORBIT>
		<TELL "being held by">)
	       (<FSET? ,PRSI ,SURFACEBIT>
		<TELL "on">)
	       (T
		<TELL "in">)>
	 <TELL TR ,PRSI>>

<ROUTINE PART-OF ()
	 <TELL
,YOU-CANT "--" T-IS-ARE ,PRSO "an integral part of" TR <LOC ,PRSO>>>

;<ROUTINE CHANGE-OBJECT (OLD NEW)
	 <COND (<PRSO? .OLD>
		<PERFORM ,PRSA .NEW ,PRSI>)
	       (T
		<PERFORM ,PRSA ,PRSO .OLD>)>
	 <RTRUE>>

;<ROUTINE CANT-USE-THAT-WAY (STRING)
	 <TELL "[" ,YOU-CANT "use " .STRING " that way.]" CR>>

<ROUTINE RECOGNIZE ()
	 <SETG P-WON <>>
	 <TELL
"[Sorry, but I don't understand. Please rephrase that or try
something else.]" CR>>

<ROUTINE PRONOUN ()
	 <COND (<PRSO? ,ME>
		<TELL "You">)
	       (<AND <PRSO? ,WHITE-CASTLE>
		     <NOT <NOUN-USED? ,WHITE-CASTLE ,W?MAN>>>
		<TELL "It">)
	       (<FSET? ,PRSO ,PLURALBIT>
		<TELL "They">)
	       (<FSET? ,PRSO ,FEMALEBIT>
		<TELL "She">)
	       (<FSET? ,PRSO ,ACTORBIT>
		<TELL "He">)
	       (T
		<TELL "It">)>>

;<ROUTINE DONT-F ()
	 <COND (<VERB? WAIT>
		<TELL "Time doesn't pass..." CR>)
	       (<VERB? TAKE>
		<TELL "Not taken." CR>)
	       (T
		<TELL "Not done." CR>)>>

;<ROUTINE REFERRING ("OPTIONAL" (HIM-HER <>))
	 <TELL "It's not clear wh">
	 <COND (.HIM-HER
		<TELL "o">)
	       (T
		<TELL "at">)>
	 <TELL " you're referring to." CR>>

<ROUTINE NO-ONE-HERE (STRING)
	 <TELL "There's no one here to " .STRING ,PERIOD-CR>>

;<ROUTINE UNIMPORTANT-THING-F ()
	 <TELL "That's not important; leave it alone." CR>>

<ROUTINE HIT-ANY-KEY ("OPTIONAL" (STRING <>))
	 <TELL "[Hit any key to ">
	 <COND (.STRING
		<TELL "begin playing " .STRING>)
	       (T
		<TELL "continue">)>
	 <TELL ".]">
	 <INPUT 1>>

<ROUTINE LOCKED-UNLOCKED (OBJ "OPTIONAL" (UN <>))
	 <TELL "A faint click indicates that" T .OBJ " is now ">
	 <COND (.UN
		<TELL "un">)>
	 <TELL "locked." CR>>

<ROUTINE CANT-TURN (STRING)
	 <TELL ,YOU-CANT "turn that o" .STRING ,PERIOD-CR>>

<ROUTINE YOU-MUST-TELL-ME ()
	 <TELL "You must tell me how to do that to" AR ,PRSO>>

<ROUTINE GRUE-PIT-WARNING ()
	 <COND (<AND <NOT <IN? ,PROTAGONIST ,BATHYSPHERE>>
		     <NOT ,TIME-STOPPED>>
	 	<TELL " You are likely to ">
	 	<COND (<FSET? ,LANTERN ,TRYTAKEBIT>
		       <TELL "fall into a bottomless pit.">)
		      (T
		       <TELL "be eaten by a grue.">)>)>
	 <CRLF>>

<ROUTINE DARK-DEATH ()
	 <TELL "Oh, no! You have ">
	 <COND (<FSET? ,LANTERN ,TRYTAKEBIT>
		<TELL "fallen into a bottomless pit">)
	       (T
		<TELL "walked into the slavering fangs of a lurking grue">)>
	 <JIGS-UP "!">>

<CONSTANT TOO-DARK "It's too dark to see a thing.">

<CONSTANT YNH "You're not holding">

<CONSTANT THERES-NOTHING "There's nothing ">

<CONSTANT YOU-SEE "You can see">

<CONSTANT IT-SEEMS-THAT "It seems that">

<CONSTANT YOU-CANT-SEE-ANY "[You can't see any ">

<CONSTANT YOU-CANT "You can't ">

<CONSTANT YOULL-HAVE-TO "You'll have to ">

<CONSTANT LOOK-AROUND "Look around you.|">

<CONSTANT CANT-FROM-HERE "You can't do that from here.|">

<CONSTANT HOLDING-IT "You're holding it!|">

<CONSTANT PERIOD-CR ".|">

<CONSTANT ELLIPSIS "...||">

<CONSTANT FAILED "Failed.|">

<CONSTANT OK "Okay.|">

<CONSTANT HUH "Huh?|">

<CONSTANT NOTHING-HAPPENS "Nothing happens.|">

<CONSTANT ALREADY-IS "It already is!|">

<CONSTANT NOTHING-NEW "This reveals nothing new.|">

<CONSTANT ONLY-BLACKNESS "You see only blackness.|">

<CONSTANT NO-VERB "[There was no verb in that sentence!]|">

<CONSTANT WEARING-IT "You're wearing it!|">

<CONSTANT YACHT-MOORED "; the royal yacht is moored at the dock">

<CONSTANT WHICH-WATER
"[You'll have to specify which water you mean by referring to the vial
that contains it.]|">

<CONSTANT MEGABOZ-CEILING-DESC
"In the center of the ceiling, a small trap door is visible.">

<CONSTANT CELL-WALL-DESC "Thick cobwebs obscure the rear wall.">

<CONSTANT POORLY-CONFIGURED 
"You nearly make it, but the branches are just too poorly configured for
climbing.|">

<CONSTANT CANNOT-TRAVEL "\"I regret that I cannot travel that way.\"|">

<CONSTANT ANSWER-MY-RIDDLE "\"You'll have to answer my riddle first!\"|">

<CONSTANT SOME-LIGHT "You can see some light through the crack.|">

<CONSTANT TYPE-A-NUMBER "Please type a number between 1 and ">

<CONSTANT DROWN
"   Since you have no diving gear, and you are not amphibious, you drown
in a swift but still unpleasant fashion.">

<CONSTANT FUDGE "A faint smell of fudge hangs in the air.">

<CONSTANT TALK-TO-BROGMOID
"The brogmoid could no more hear your shouting than you could hear the
shouting of a bacterium.|">

<CONSTANT ALREADY-AT "You're already at the ">

<CONSTANT WITCH-REMOVES-JESTER
" Immediately, the witches begin beating at the jester with brushes and
broomsticks. \"Scat, you filthy jester, scat!\" He vanishes hastily.|">

<CONSTANT NO-ON-HERE "There's no one here by that name.|">

<CONSTANT NOTHING-IN-REACH
"You reach in as far as you can, but feel nothing.|">

<CONSTANT WONT-BUDGE "It won't budge.|">