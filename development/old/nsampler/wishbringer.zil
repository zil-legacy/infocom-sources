"WISHBRINGER for SAMPLER II: (C)1987 Infocom, Inc. All rights reserved."

<ROUTINE GO-TUTORIAL () 
         <SETG GAME-FLAG 4>
	 <SETUP-TUTORIAL>
	 <INTRO>
	 <QUEUE I-BARKING -1>
	 <QUEUE I-GLOBAL-HINT 6>>

<ROUTINE SETUP-TUTORIAL ()
	 <GENERAL-SETUP>
	 ;<MOVE ,UMBRELLA ,TWILIGHT-GLEN>
	 <MOVE ,BONE ,OPEN-GRAVE>
	 <MOVE ,ENVELOPE ,PROTAGONIST>
	 <MOVE ,GRAVEDIGGER ,SPOOKY-COPSE>
	 <SETG DOG-SCRIPT 0>
	 <SETG FIRST-NORTH? T>
	 <SETG FIRST-HURT? T>
	 <SETG FIRST-ENTER? T>
	 <SETG TOMB-INSPECTED? <>>
	 <SETG DONT-LEAVE-PRINTED? <>>
	 <SETG HAVENT-PRINTED-GONE? T>
	 <SETG FIRST-CANT-REACH T>
	 <SETG PRINT-CANT-REACH T>
	 <SETG STATUS-LINE-INFO-GIVEN? <>>
	 <SETG NO-BONE-WARNINGS-YET T>
	 <SETG DIGGER-SCRIPT 0>
	 <FCLEAR ,BONE ,NDESCBIT>
	 <FSET ,BONE ,RMUNGBIT>
	 <FSET ,BONE ,INVISIBLE>
	 <FSET ,POODLE ,RMUNGBIT>
	 <FSET ,GRAVEDIGGER ,NOTTALKEDTOBIT>>

<ROOM TUTORIAL-ROOM
      (IN ROOMS)
      (DESC "Tutorial")>

<OBJECT CREEPY-CORNER
	(IN ROOMS)
	(DESC "Creepy Corner")
	(LDESC
"You're in a creepy corner of the Festeron Cemetery, surrounded by silent
tombstones. An iron gate opens to the east, and a narrow lane wanders north.")
	(FLAGS ONBIT RLANDBIT)
	(GLOBAL MONUMENTS TREE SOUTH-GATE CEMETERY)
	(NORTH PER ENTER-SPOOKY-COPSE)
	(EAST PER EXIT-TO-OUTSIDE)
	(SOUTH PER TOMBS-BLOCK)
	(WEST PER TOMBS-BLOCK)
	(OUT PER EXIT-TO-OUTSIDE)
	;(PSEUDO "LANE" HERE-F)
	;(ACTION CREEPY-CORNER-F)>

<ROUTINE TOMBS-BLOCK ()
	 <THIS-IS-IT ,MONUMENTS>
	 <TELL CT ,MONUMENTS>
	 <TELL "s block your path" ,PERIOD-CR>
	 <RFALSE>>

<GLOBAL DONT-LEAVE-PRINTED? <>>

<ROUTINE EXIT-TO-OUTSIDE ()
	 <COND (<AND <NOT ,TOMB-INSPECTED?>
		     <NOT ,DONT-LEAVE-PRINTED?>>
		<SETG DONT-LEAVE-PRINTED? T>
		<TELL
"(If I were you, [which is, by the way, biologically impossible], I would
spend a little more time in the cemetery, inspecting things, and looking
around. There are still things in the cemetery that you haven't seen;
without these you won't be able to complete the Tutorial. Remember,
to see the description of a place again, type LOOK or L. To
scrutinize an object closely, LOOK AT that object, or EXAMINE it.)"
CR>
		<RFALSE>)
	       (T
		<TELL
"Whew! That cemetery sure is spooky" ,PERIOD-CR CR>
	 	<RETURN ,OUTSIDE-CEMETERY>)>>

<OBJECT SPOOKY-COPSE
	(IN ROOMS)
	(DESC "Spooky Copse")
	(FLAGS ONBIT RLANDBIT)
	(GLOBAL MONUMENTS CEMETERY)
	(NORTH PER TOMBS-BLOCK)
	(EAST PER TOMBS-BLOCK)
	(SOUTH PER COPSE-TO-CORNER)
	(WEST PER COPSE-TO-GLEN)
	(DOWN PER ENTER-GRAVE)
	(IN PER ENTER-GRAVE)
	;(PSEUDO "LANE" HERE-F)
	(ACTION SPOOKY-COPSE-F)>

<ROUTINE SPOOKY-COPSE-F (CONTEXT)
	 <COND (<EQUAL? .CONTEXT ,M-LOOK>
		<TELL 
"A copse of " D ,WILLOWS "s makes this part of" T ,CEMETERY " look really spooky. Narrow lanes wander south and west.|
|
There's an " D ,OPEN-GRAVE " nearby, freshly dug, with a " D ,MONUMENTS " erected next to it.">
		<COND (<IN? ,GRAVEDIGGER ,SPOOKY-COPSE>
		       <TELL CR CR
"An old " D ,GRAVEDIGGER " is resting under a " D ,WILLOWS ".">)>
	 	<CRLF>)
	       (<EQUAL? .CONTEXT ,M-END>
		<COND (<NOT <IN? ,GRAVEDIGGER ,SPOOKY-COPSE>>
		       <NOW-HES-GONE>)>)>>

<OBJECT TWILIGHT-GLEN
	(IN ROOMS)
	(DESC "Twilight Glen")
	(FLAGS ONBIT RLANDBIT)
	(GLOBAL MONUMENTS NORTH-GATE CEMETERY)
	(NORTH PER EXIT-TO-LAKE)
	(EAST PER RETURN-TO-COPSE)
	(SOUTH PER TOMBS-BLOCK)
	(WEST PER TOMBS-BLOCK)
	(OUT PER EXIT-TO-LAKE)
	;(PSEUDO "LANE" HERE-F)
	(ACTION TWILIGHT-GLEN-F)>

<ROUTINE TWILIGHT-GLEN-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"The trees here are so thick, it's almost too dark to see! You can make out a ">
		<COND (<FSET? ,NORTH-GATE ,OPENBIT>
		       <TELL "open ">)
		      (T
		       <TELL "closed ">)>
		<TELL
D ,NORTH-GATE ,TO-N ", and a narrow lane between" T ,MONUMENTS "s winds
off" ,TO-E "." CR>)>>

<ROUTINE EXIT-TO-LAKE ()
	 <ITS-CLOSED ,NORTH-GATE>
	 <QUEUE I-DONT-WORRY 1>
	 <RFALSE>>

<ROUTINE RETURN-TO-COPSE ()
	 <COND (<IN? ,GRAVEDIGGER ,LOCAL-GLOBALS>
		<REMOVE ,GRAVEDIGGER>)>
	 <RETURN ,SPOOKY-COPSE>>

<OBJECT NORTH-GATE
	(IN LOCAL-GLOBALS)
	(DESC "iron gate")
	(SYNONYM GATE GATES LOCK BARS)
	(ADJECTIVE IRON TALL)
	(FLAGS NDESCBIT VOWELBIT DOORBIT LOCKEDBIT)
	(ACTION NORTH-GATE-F)>

<ROUTINE NORTH-GATE-F ()
	 <THIS-IS-IT ,NORTH-GATE>
	 <COND (<VERB? OPEN UNLOCK>
		<QUEUE I-DONT-WORRY 1>
		<RFALSE>)
	       (<VERB? ENTER WALK-TO USE>
		<DO-WALK ,P?NORTH>)
	       (<GENERIC-GATE? ,NORTH-GATE>
		<RTRUE>)>>

<ROUTINE I-DONT-WORRY ()
	 <TELL
"|
(If you were really playing Wishbringer, you'd be able to go through the gate
and explore the scenery north of" T ,CEMETERY ". For the purposes of the "
,TUTORIAL ", however, the gate can't be unlocked or opened.)" CR>>

<OBJECT INSIDE-GRAVE
	(IN ROOMS)
	(DESC "Open Grave")
	(LDESC
"You're at the bottom of an open grave, surrounded by six-foot walls of
dirt.")
	(FLAGS ONBIT RLANDBIT)
	;(GLOBAL HOL)
	(NORTH PER WALL-OF-DIRT)
	(EAST PER WALL-OF-DIRT)
	(SOUTH PER WALL-OF-DIRT)
	(WEST PER WALL-OF-DIRT)
	(UP PER GRAVE-TO-COPSE)
	;(IN PER ENTER-HOLE?)
	(OUT PER GRAVE-TO-COPSE)
	;(DOWN PER ENTER-HOLE?)
	(ACTION INSIDE-GRAVE-F)
	(THINGS <PSEUDO (<> DIRT WALL-F)>)>

<ROUTINE INSIDE-GRAVE-F (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-END>
		     <NOT ,STATUS-LINE-INFO-GIVEN?>>
		<TELL-ABOUT-STATUS-LINE>
		<QUEUE I-GLOBAL-HINT 8>
		<TELL " You'll notice, by looking at the \"status line\",
that your score went up when you entered the grave. You must be on the right
track.)" CR>)>> 

<ROUTINE TELL-ABOUT-STATUS-LINE ()
	 <SETG STATUS-LINE-INFO-GIVEN? T>
	 <TELL "|
(You may have been wondering about the information on the top line of your
screen. This is known as a \"status line\" because it displays information
about your status in the game. Included is the name of the place you're in,
your score, and the number of moves you've taken so far.">>	

<ROUTINE WALL-OF-DIRT ()
	 <TELL "You just walked into a wall of dirt" ,PERIOD-CR>
	 <RFALSE>>

<ROUTINE ENTER-GRAVE ()
	 <COND (<IN? ,GRAVEDIGGER ,SPOOKY-COPSE>
		<TELL CT ,GRAVEDIGGER>
		<TELL 
" reaches into" T ,OPEN-GRAVE " and pulls you out. \"Don't go in there!\"
he cries. \"You might get buried alive!\"|
|
(It seems that entering the grave is a bad idea when the gravedigger is
around. Don't worry, though, he should be on his way at any moment.)" CR>
		<RFALSE>)>
	 <COND (,FIRST-ENTER?
		<SETG FIRST-ENTER? <>>
		<FCLEAR ,BONE ,INVISIBLE>
		<UPDATE-SCORE 2>)>
	 <ROB ,OPEN-GRAVE ,INSIDE-GRAVE>
	 <SETG TOMB-INSPECTED? T>
	 <RETURN ,INSIDE-GRAVE>>

<ROUTINE GRAVE-TO-COPSE ()
	 <COND (<AND <NOT <ULTIMATELY-IN? ,BONE ,PROTAGONIST>>
	       	     ,NO-BONE-WARNINGS-YET>
		<TELL "(I wouldn't leave that bone behind if I were you.
You'll need it if you want to complete the Tutorial!)" CR>
		<SETG NO-BONE-WARNINGS-YET <>>
		<RFALSE>)
	       (T
		<TELL
"With great difficulty, you manage to climb out of the " 
D ,OPEN-GRAVE ,PERIOD-CR CR>
	        <ROB ,INSIDE-GRAVE ,OPEN-GRAVE>
		<SETG NO-BONE-WARNINGS-YET <>>
	       ;<MOVE ,GRAVE ,INSIDE-GRAVE>
	 	<RETURN ,SPOOKY-COPSE>)>>

;<ROUTINE ARE-YOU-SURE ()
	 <TELL 
CT ,CEMETERY " is a spooky place. Are you sure you want to go in there?"
CR CR>
	 <COND (<YES?>
	        <TELL CR "You have been warned" ,PERIOD-CR CR>
		<RETURN ,CREEPY-CORNER>)
	       (T
	        <TELL "Whew! That was close" ,PERIOD-CR>
	        <RFALSE>)>>

<OBJECT CEMETERY
	(IN LOCAL-GLOBALS)
	(DESC "cemetery")
	(SYNONYM CEMETERY GRAVEYARD)
	(ADJECTIVE FESTERON)
	(FLAGS NDESCBIT)
	(ACTION CEMETERY-F)>

<ROUTINE CEMETERY-F ()
	 <COND (<VERB? EXAMINE LOOK-INSIDE FIND>
		<COND (<IN-CEMETERY?>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,OUTSIDE-CEMETERY>
		       <SEE-IT "west">)>
		<RTRUE>)
	       (<VERB? WALK-TO ENTER>
		<COND (<IN-CEMETERY?>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,OUTSIDE-CEMETERY>
		       <DO-WALK ,P?WEST>)>)>>

<ROUTINE IN-CEMETERY? ()
	 <COND (<EQUAL? ,HERE ,CREEPY-CORNER ,SPOOKY-COPSE ,TWILIGHT-GLEN>
	        <TELL "It's all around you!" CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE SEE-IT (STR)
	 <TELL ,YOU-SEE "it to the " .STR ,PERIOD-CR>>

<OBJECT MONUMENTS
	(IN LOCAL-GLOBALS)
	(DESC "tombstone")
	(SYNONYM STONES STONE TOMBST)
	(ADJECTIVE TOMB TOMBS)
	(FLAGS READBIT)
	(ACTION MONUMENTS-F)>

<ROUTINE MONUMENTS-F ()
	 <COND (<VERB? READ EXAMINE>
		<COND (<EQUAL? ,HERE ,SPOOKY-COPSE>
		       ;<TELL 
CT ,MONUMENTS " next to" T ,OPEN-GRAVE " is blank" ,PERIOD-CR>
		       <TELL 
"The inscription on the tombstone reads:|
\"The Unknown Hacker:|
     1984-1987\"" CR>
		       <COND (<AND <NOT <FSET? ,BONE ,TOUCHBIT>>
		     	           <NOT <FSET? ,INSIDE-GRAVE ,TOUCHBIT>>
		     		   <NOT ,TOMB-INSPECTED?>
				   ,DONT-LEAVE-PRINTED?>
			      <TELL "|(You're getting warm!)" CR>)
			     (T
			      <RTRUE>)>)
		      (T
		       <TELL 
"The lettering is too faded to read clearly" ,PERIOD-CR>)>)>>

<OBJECT OPEN-GRAVE
        (IN SPOOKY-COPSE)
	(DESC "open grave")
	(SYNONYM GRAVE HOLE)
	(ADJECTIVE OPEN)
	(FLAGS NDESCBIT VOWELBIT CONTBIT OPENBIT TRANSBIT)
	(CAPACITY 50)
	;(CONTFCN IN-OPEN-GRAVE)
	(ACTION OPEN-GRAVE-F)>

<ROUTINE OPEN-GRAVE-F ()
	 <COND (<VERB? WALK-TO ENTER CLIMB-DOWN CLIMB-ON BOARD>
		<DO-WALK ,P?DOWN>
		<RTRUE>)
	       ;(<VERB? EXIT CLIMB-UP DISEMBARK>
		<ALREADY-IN ,OPEN-GRAVE>
		<RTRUE>)
	       (<VERB? EXAMINE SEARCH LOOK-DOWN LOOK-INSIDE>
		<TELL "It's six feet deep and freshly dug.">
	        <COND (<FIRST? ,OPEN-GRAVE>
		       <FCLEAR ,BONE ,INVISIBLE>
		       <TELL " Inside the grave, you can see">
		       <DESCRIBE-NOTHING ,PRSO>
		       <COND (<NOT ,TOMB-INSPECTED?>
			      <SETG TOMB-INSPECTED? T>
			      <THIS-IS-IT ,BONE>
			      <QUEUE I-GLOBAL-HINT 7>
			      <TELL "|
(Good detective work. You've found something that you'll almost certainly want
to pick up. To do so, type TAKE BONE or GET THE BONE or PICK IT
UP.)" CR>)>)
		      (T
		       <CRLF>)>
		<RTRUE>)
	       (<AND <VERB? PUT THROW>
		     <EQUAL? ,PRSI ,OPEN-GRAVE>>
		<COND ;(<EQUAL? ,PRSO ,HANDS>
		       <NOTHING-EXCITING>
		       <RTRUE>)
		    ; (<G? <GETP ,PRSO ,P?SIZE> 10>
		       <TOO-LARGE ,PRSO>
		       <RTRUE>)
		      ;(<AND <EQUAL? ,PRSO ,UMBRELLA>
			    <FSET? ,UMBRELLA ,OPENBIT>>
		       <YOUD-HAVE-TO "close" ,UMBRELLA>
		       <RTRUE>)
		      (T
		       <RFALSE>)>)
	       (<GENERIC-GRAVE?>
		<RTRUE>)
	       (T
	        <RFALSE>)>>

<ROUTINE GENERIC-GRAVE? ()
	 <COND (<VERB? DIG>
		<TELL "It's deep enough already" ,PERIOD-CR>
		<RTRUE>)
	       (<VERB? CLOSE>
		<HOW?>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<OBJECT GRAVE
	(IN INSIDE-GRAVE)
	(DESC "open grave")
	(SYNONYM GRAVE HOLE TOMB)
	(ADJECTIVE OPEN)
	(FLAGS NDESCBIT VOWELBIT CONTBIT OPENBIT TRANSBIT)
	(CAPACITY 50)
	(ACTION GRAVE-F)>

<ROUTINE GRAVE-F ()
	 <COND (<VERB? ENTER WALK-TO CLIMB-DOWN BOARD>
		<TELL ,LOOK-AROUND>)
	       (<VERB? EXIT CLIMB-UP CLIMB-ON DISEMBARK LEAVE>
		<DO-WALK ,P?OUT>
		<RTRUE>)
	       (<VERB? LOOK-DOWN EXAMINE SEARCH LOOK-INSIDE>
		<V-LOOK>
		<RTRUE>)
	       (<AND <VERB? TAKE>
		     <EQUAL? ,PRSI ,GRAVE>>
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)
	       (<AND <VERB? PUT THROW>
		     <EQUAL? ,PRSI ,GRAVE>>
		<PERFORM ,V?DROP ,PRSO>
		<RTRUE>)
	       (<GENERIC-GRAVE?>
		<RTRUE>)
	       (T
	        <RFALSE>)>>

<ROUTINE ENTER-SPOOKY-COPSE ()
	 <COND (<ZERO? ,DIGGER-SCRIPT>
	        <QUEUE I-DIGGER-TALK -1>)>
	 <RETURN ,SPOOKY-COPSE>>

<ROUTINE COPSE-TO-GLEN ()
	 <COND (<IN? ,GRAVEDIGGER ,TWILIGHT-GLEN>
		<QUEUE I-BYE-DIGGER -1>)
	       (<IN? ,GRAVEDIGGER ,SPOOKY-COPSE>
		<DEQUEUE I-DIGGER-TALK>
		<QUEUE I-DIGGER-FOLLOWS -1>)>
	 <RETURN ,TWILIGHT-GLEN>>

<ROUTINE I-BYE-DIGGER ()
	 <DEQUEUE I-BYE-DIGGER>
	 <CRLF>
	 <TELL CT ,GRAVEDIGGER>
	 <TELL " is locking" T ,NORTH-GATE 
	       " from the outside as you approach.">
	 <OUT-OF-TROUBLE>> 

<ROUTINE OUT-OF-TROUBLE ()
	 <THIS-IS-IT ,GRAVEDIGGER>
	 <THIS-IS-IT ,NORTH-GATE>
	 <MOVE ,GRAVEDIGGER ,LOCAL-GLOBALS>
	 <FCLEAR ,NORTH-GATE ,OPENBIT>
         ;<FSET ,NORTH-GATE ,LOCKEDBIT>
	 <TELL 
" \"Keep out of" T ,CEMETERY
" after Dark,\" he tells you with a sly wink."
CR CR "You hear him chuckling as he disappears" ,TO-N ,PERIOD-CR>
	 <NOW-HES-GONE>>

<ROUTINE I-DIGGER-FOLLOWS ()
	 <DEQUEUE I-DIGGER-FOLLOWS>
	 <CRLF>
	 <TELL CT ,GRAVEDIGGER " follows behind you. ">
	 <TELL 
"\"What's your hurry?\" he complains.">
	;<COND (<OR <IN? ,ENVELOPE ,GRAVEDIGGER>
		    <IN? ,ENVELOPE ,SPOOKY-COPSE>>
		<MOVE ,ENVELOPE ,PROTAGONIST>
		<FORGOT>
		<TELL " he says, handing it back to you.">
		;<YOU-ARE-HOLDING ,ENVELOPE T>)
	       (T
		)>
	 <TELL CR CR 
"Throwing a shovel over his shoulder," T ,GRAVEDIGGER
" ambles through" T ,NORTH-GATE " and locks it.">
	 <OUT-OF-TROUBLE>>

;<ROUTINE FORGOT ()
	 <TELL "\"Hey! You forgot your envelope!\"">>

<ROUTINE COPSE-TO-CORNER ()
	 ;<COND (<AND <IN? ,GRAVEDIGGER ,SPOOKY-COPSE>
		     <OR <IN? ,ENVELOPE ,GRAVEDIGGER>
			 <IN? ,ENVELOPE ,SPOOKY-COPSE>>>
		<TELL CT ,GRAVEDIGGER>
		<TELL " yells, ">
		<FORGOT>
		<CRLF>
		<CRLF>)>
	 <RETURN ,CREEPY-CORNER>>

<OBJECT WILLOWS
	(IN SPOOKY-COPSE)
	(DESC "willow tree")
	(SYNONYM TREE TREES COPSE)
	(ADJECTIVE WILLOW)
	(FLAGS NDESCBIT)
	(ACTION WILLOWS-F)>

<ROUTINE WILLOWS-F ()
	 <COND (<VERB? EXAMINE>
		<TELL 
"The droopy boughs sway eerily in the breeze" ,PERIOD-CR>
		<RTRUE>)>>

;<OBJECT UMBRELLA
	(IN TWILIGHT-GLEN)
	(DESC "umbrella")
	(FDESC "There must have been a burial here recently. Somebody left their umbrella leaning up against a tombstone.")
	(SYNONYM UMBRELLA HANDLE HEAD)
        (ADJECTIVE PARROT)
	(FLAGS VOWELBIT CONTBIT TAKEBIT TRANSBIT)   ;"Okay??"
	(SIZE 10)
	(ACTION UMBRELLA-F)>

;<ROUTINE UMBRELLA-F ()
	 <COND (<VERB? EXAMINE>
		<TELL 
"The handle of" T ,UMBRELLA " is carved like a parrot's head" ,PERIOD-CR>)>>

<OBJECT HILLTOP
	(IN ROOMS)
	(DESC "Hilltop")
	(GLOBAL POST-OFFICE POST-DOOR HILL SIGN GRASS)
	(FLAGS ONBIT RLANDBIT)
	(NORTH "You'd fall down the hill if you went that way.")
	(SOUTH PER ENTER-TOWER?)
	(EAST TO OUTSIDE-COTTAGE)
	(WEST TO OUTSIDE-CEMETERY)
	(DOWN "(Which way to you want to go down the hill, east or west?)")
	(IN PER ENTER-TOWER?)
	(ACTION HILLTOP-F)>

<ROUTINE HILLTOP-F ("OPTIONAL" (CONTEXT <>))
	 <COND (<EQUAL? .CONTEXT ,M-LOOK>
		<TELL
"You're on a hilltop overlooking the seaside village of " ,FESTERON
,PERIOD-CR CR "To the south stands the " ,FESTERON " " D ,POST-OFFICE ".
It's a little brick building with a neatly-trimmed lawn. " CT ,POST-DOOR
" is closed." CR CR "Roads run down the hill" ,TO-E " and west. There's a
signpost nearby" ,PERIOD-CR>)
	       (<AND <EQUAL? .CONTEXT ,M-END>
		     <G? ,MOVES 20>
		     <NOT ,STATUS-LINE-INFO-GIVEN?>>
		<TELL-ABOUT-STATUS-LINE>
		<TELL ")" CR>
		<QUEUE I-GLOBAL-HINT 2>)>>

<OBJECT HILL
	(IN LOCAL-GLOBALS)
	(DESC "hill")
	(SYNONYM HILL HILLTOP)
	(ADJECTIVE POST OFFICE LOOKOUT)
	(FLAGS NDESCBIT)
	(ACTION HILL-F)>

<ROUTINE HILL-F ()
	 <COND (<VERB? EXAMINE LOOK-DOWN LOOK-UP>
		<V-LOOK>
		<RTRUE>)
	       ;(<EQUAL? ,HERE ,CLIFF-EDGE>
		<TOO-FAR-AWAY ,HILL>
		<RFATAL>)
	       (<VERB? CLIMB CLIMB-UP>
		<COND (<EQUAL? ,HERE ,HILLTOP>
		       <TELL ,YOURE-ALREADY "on the hill" ,PERIOD-CR>)
		      (T
		       <DO-WALK ,P?UP>)>
		<RTRUE>)
	       (<VERB? CLIMB-DOWN>
		<COND (<EQUAL? ,HERE ,HILLTOP>
		       <DO-WALK ,P?DOWN>)
		      (T
		       <TELL <PICK-ONE ,DUMMY> ,PERIOD-CR>)>
		<RTRUE>)
	       ;(T
		<YOU-DONT-NEED ,HILL>
		<RFATAL>)>>

<ROUTINE ENTER-TOWER? ()
	 <ITS-CLOSED ,POST-DOOR>
	 <RFALSE>>

<OBJECT POST-OFFICE
	(IN LOCAL-GLOBALS)
	(DESC "Post Office")
	(SYNONYM OFFICE BUILDING)
	(ADJECTIVE POST LITTLE BRICK)
	(FLAGS NDESCBIT)
	(ACTION POST-OFFICE-F)>

<ROUTINE POST-OFFICE-F ()
	 <COND (<AND <VERB? ENTER>
		     <EQUAL? ,HERE ,HILLTOP>>
		<DO-WALK ,P?SOUTH>)>>

<OBJECT POST-DOOR
	(IN LOCAL-GLOBALS)
	(DESC "Post Office door")
	(SYNONYM DOOR ENTRANCE ENTRY LOCK)
	(ADJECTIVE FRONT POST OFFICE)
	(FLAGS DOORBIT NDESCBIT LOCKEDBIT)
	;(ACTION POST-DOOR-F)>

<OBJECT OUTSIDE-CEMETERY
	(IN ROOMS)
	(DESC "Outside Cemetery")
	(GLOBAL SOUTH-GATE HILL CEMETERY)
	(FLAGS ONBIT RLANDBIT)
	(EAST TO HILLTOP)
	(UP TO HILLTOP)
	(WEST PER ENTER-CEMETERY)
	(IN PER ENTER-CEMETERY)
	(ACTION OUTSIDE-CEMETERY-F)>

<ROUTINE ENTER-CEMETERY ()
	 <TELL "You enter the cemetery" ,PERIOD-CR CR>
	 <COND (<IN? ,GRAVEDIGGER ,SPOOKY-COPSE>
		<DEQUEUE I-GLOBAL-HINT>)
	       (T
		<QUEUE I-GLOBAL-HINT 6>)>
	 <RETURN ,CREEPY-CORNER>>

<ROUTINE OUTSIDE-CEMETERY-F (CONTEXT)
	 <COND (<EQUAL? .CONTEXT ,M-LOOK>
	        <TELL 
"You are standing next to an open iron gate that leads west into the "
,FESTERON " Cemetery. A road runs east to the top of " D ,POST-OFFICE " Hill"
,PERIOD-CR>)
	       (<AND <EQUAL? .CONTEXT ,M-ENTER>
		     <NOT <FSET? ,OUTSIDE-CEMETERY ,TOUCHBIT>>>
		<QUEUE I-GLOBAL-HINT 4>)>> 

<OBJECT SOUTH-GATE
	(IN LOCAL-GLOBALS)
	(DESC "iron gate")
	(SYNONYM GATE GATES LOCK BARS)
	(ADJECTIVE IRON TALL)
	(FLAGS NDESCBIT VOWELBIT DOORBIT OPENBIT)
	(ACTION SOUTH-GATE-F)>

<ROUTINE SOUTH-GATE-F ()
	 <THIS-IS-IT ,SOUTH-GATE>
	 <COND (<VERB? ENTER WALK-TO USE>
		<COND (<EQUAL? ,HERE ,CREEPY-CORNER>
		       <DO-WALK ,P?EAST>)
		      (T
		       <DO-WALK ,P?WEST>)>
		<RTRUE>)
	       (<GENERIC-GATE? ,SOUTH-GATE>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE GENERIC-GATE? (GATE)
	 <COND (<VERB? EXAMINE>
		<TELL "The bars of the">
		<COND (<EQUAL? .GATE ,SOUTH-GATE>
		       <TELL " open ">)
		      (T
		       <TELL " closed ">)>
		<TELL 
D .GATE " are 12 feet high, and closely spaced" ,PERIOD-CR>
		<RTRUE>)
	       (<AND <VERB? CLOSE>
		     <FSET? .GATE ,OPENBIT>>
		<TELL CT .GATE>
		<TELL " is too big to close by " D ,ME ,PERIOD-CR>
		<RTRUE>)
               (T
		<RFALSE>)>>

<OBJECT OUTSIDE-COTTAGE
	(IN ROOMS)
	(DESC "Outside Cottage")
	(FLAGS ONBIT RLANDBIT)
	(GLOBAL HILL COTTAGE COTTAGE-DOOR)
	(NORTH PER NORTH-PAST-DOG?)
	(EAST PER EAST-PAST-DOG?)   ;"(IMPOSSIBLE)"
	(WEST PER WEST-PAST-DOG?)
	(UP PER WEST-PAST-DOG?)
	(IN PER EAST-PAST-DOG?)   ;"(IMPOSSIBLE)"
	(ACTION OUTSIDE-COTTAGE-F)>

<ROUTINE OUTSIDE-COTTAGE-F (CONTEXT)
	 <COND (<EQUAL? .CONTEXT ,M-ENTER>
		<SETG RESPONSE 0>
		<SETG DOG-SCRIPT 0>
		<QUEUE I-GLOBAL-HINT 6>)
	       (<EQUAL? .CONTEXT ,M-EXIT>
		<QUEUE I-GLOBAL-HINT 7>)
	       (<EQUAL? .CONTEXT ,M-LOOK>
		<TELL 
"You're outside" T ,COTTAGE " of " D ,MISS-VOSS ", the town librarian. The road
turns north toward the village, and bends upward to the summit of " D ,POST-OFFICE " Hill" ,PERIOD-CR>)>>

<ROUTINE NORTH-PAST-DOG? ()
	 <COND (<FSET? ,POODLE ,RMUNGBIT>
		<TELL CT ,POODLE " won't let you go past" ,PERIOD-CR>
		<COND (,FIRST-NORTH?
		       <SETG FIRST-NORTH? <>>
		       <TELL "|
(At the moment, the poodle will not let you walk by. To get past the dog,
you're going to have to do something to either injure it, get rid of it,
or bribe it.)" CR>)> 
		<RFALSE>)
	       (T
		<QUEUE I-WIN-TUTORIAL 1>
		<TELL "The poodle yaps a threat as you walk past." CR CR>
		<RETURN ,ROTARY-SOUTH>)>>

<ROUTINE WEST-PAST-DOG? ()
	 <COND (<NOT <FSET? ,POODLE ,RMUNGBIT>>
		<TELL "(But Festeron lies to the north!)" CR>
		<RFALSE>)
	       (T
		<TELL 
CT ,POODLE " yaps a threat as you back away" ,PERIOD-CR CR>
	        <RETURN ,HILLTOP>)>>

<OBJECT POODLE
	(IN OUTSIDE-COTTAGE)
	(DESC "poodle")
	(SYNONYM POODLE DOG MUTT)
	(ADJECTIVE TINY SMALL LITTLE MEAN)
	(FLAGS TRYTAKEBIT RMUNGBIT)
	(DESCFCN DESCRIBE-POODLE)
	(ACTION CANINE-F)>

; "RMUNGBIT means poodle has not been fed the bone"

<ROUTINE DESCRIBE-POODLE ("OPTIONAL" (CONTEXT <>))
	 <COND (.CONTEXT
		<COND (<EQUAL? .CONTEXT ,M-OBJDESC?>
		       <RTRUE>)
		      (<NOT <FSET? ,POODLE ,TOUCHBIT>>
		       ;<FSET ,POODLE ,TOUCHBIT>
		       <TELL CR 
"As you approach" T ,COTTAGE " you are greeted by the tiniest " D ,POODLE
" you've ever seen in your entire life. It charges across the street, yapping
angrily and showing its sharp little teeth.">)
		      (<NOT <FSET? ,POODLE ,RMUNGBIT>>
		       <TELL CR "A tiny " D ,POODLE
	   		     " is gnawing on a bone and watching you.">)
		      (T
		       <TELL CR "An angry " D ,POODLE
			     " is blocking your path.">)>)>>

<ROUTINE CANINE-F ("OPTIONAL" (CONTEXT <>))
	 <COND (<VERB? EXAMINE>
		<TELL CT ,POODLE>
		<TELL " is ">
		<COND (<NOT <FSET? ,POODLE ,RMUNGBIT>>
		       <TELL "watching you as it gnaws on the bone">)
		      (T
		       <TELL "tiny, mean and hungry-looking">)>
		<TELL ,PERIOD-CR>
		<RTRUE>)
	       (<VERB? WALK-AROUND>
		<DO-WALK ,P?NORTH>)     ;"TB"
	      ;(<AND <VERB? TAKE>
		     <EQUAL? ,PRSO ,POOCH>>
		<TELL CT ,POOCH>
		<MIGHT-NOT-LIKE>
		<RTRUE>)
	       (<VERB? TOUCH KISS>
		<TELL 
CT ,POODLE " would probably chew you up if you tried" ,PERIOD-CR>)
	       (<AND <VERB? GIVE THROW FEED SHOW>
		     <EQUAL? ,PRSI ,POODLE>>
		<COND (<EQUAL? ,PRSO ,BONE>
		       <POODLE-TAKES-BONE T>
		       <RTRUE>)
		      ;(<EQUAL? ,PRSO ,CHOCOLATE ; ,KITTY ,WORM>
		       <REMOVE ,PRSO>
		       <TELL "gobbles it down greedily">)
		      (T
		       <TELL CT ,POODLE " tests" T ,PRSO " with its tongue, ">
		       <MOVE ,PRSO ,OUTSIDE-COTTAGE>
		       <TELL "drops it on the road">)>
		<TELL " and turns to yap at you again" ,PERIOD-CR>
		<RTRUE>)
	       (<OR <EQUAL? ,WINNER ,POODLE>
		    <AND <VERB? TELL-ABOUT ASK-ABOUT ASK-FOR YELL TELL>
			 <PRSO? ,POODLE>>>
		<TELL CT ,POODLE " growls dangerously in reply" ,PERIOD-CR>
		<PCLEAR>
		<RFATAL>)
	       (<OR <IN-TBL? ,PRSA ,HURTVERBS ,NHVERBS>
		    <VERB? CLIMB-ON CLIMB-UP SHAKE>>
		<TELL "Are you kidding? This " D ,POODLE " is MEAN!" CR>
		<COND (<AND ,FIRST-HURT?
			    <FSET? ,POODLE ,RMUNGBIT>>
		       <SETG FIRST-HURT? <>>
		       <TELL "|
(Apparently, violence is not the answer here. You'll have to think of
some other way to get past the dog.)" CR>)>
		<RTRUE>)
	       ;(<VERB? LISTEN>
		<TELL "It ">
		<BARK-OR-ROAR>
		<TELL "s louder" ,PERIOD-CR>
		<RTRUE>)>>

<ROUTINE POODLE-TAKES-BONE ("OPTIONAL" (GIVE? <>))
	 <COND (<NOT .GIVE?>
		<CRLF>)>
	 <TELL CT ,POODLE " tests" T ,BONE " with its tongue, ">
	 <MOVE ,BONE ,OUTSIDE-COTTAGE>
	 <FSET ,BONE ,NDESCBIT>
	 <FCLEAR ,POODLE ,RMUNGBIT>
	 ;<SETG POODLE-HAPPY? T>
	 <TELL 
"lies down and begins to gnaw on it, keeping a red eye on you.|">
	 <COND (.GIVE?
		<QUEUE I-NICE-WORK 1>)
	       (T
		<I-NICE-WORK>)>
	 <UPDATE-SCORE 2>>

<ROUTINE I-NICE-WORK ()
	 <TELL 
"|(Nice work! You've bribed the poodle. It probably won't give you any more
trouble. Festeron lies to the north...)|">>

<GLOBAL DOG-SCRIPT 0>

<ROUTINE I-BARKING ()
	 <COND (<OR <NOT <EQUAL? ,HERE ,OUTSIDE-COTTAGE>>
		    <NOT <FSET? ,POODLE ,RMUNGBIT>>>
		<RFALSE>)
	       (<IN? ,BONE ,OUTSIDE-COTTAGE>
		<POODLE-TAKES-BONE>
		<RTRUE>)>
	 <SETG DOG-SCRIPT <+ ,DOG-SCRIPT 1>>
	 <THIS-IS-IT ,POODLE>
	 ;<COND (<G? ,DOG-SCRIPT 3>
		<SETG DOG-SCRIPT 1>
		<I-GLOBAL-HINT>)>
	 <CRLF>
	 <COND (<EQUAL? ,DOG-SCRIPT 1>
		<TELL
"You can smell" T ,POODLE "'s hot breath as it yaps" ,PERIOD-CR>
		<COND (<NOT <FSET? ,POODLE ,TOUCHBIT>>
		       <FSET ,POODLE ,TOUCHBIT>
		       <TELL "
|
(This is the slavering poodle that I mentioned earlier. You'll probably want
to do many things to the poodle, some of which are almost certainly not
allowed by the " ,FESTERON " chapter of the ASPCA. You could YELL AT THE
POODLE or KICK THE POODLE or perhaps LOOK AT THE POODLE.
Alternatively, you could give things to it, or feed it, or do just about
anything to it. We've tried to make sure that each game understands a huge
number of verbs and prepositions, so that your greatest challenge will be
completing the story, and not guessing which word to use.)" CR>)>
		<RTRUE>)
	       (<EQUAL? ,DOG-SCRIPT 2>
		<TELL CT ,POODLE>
		<TELL
" glares at you through eyes red with hatred" ,PERIOD-CR>)
	       (<EQUAL? ,DOG-SCRIPT 3>
		<TELL 
"You hear" T ,POODLE "'s sharp little teeth snapping as it nips your
heels" ,PERIOD-CR>)
	       (T
		<TELL CT ,POODLE>
	        <TELL 
" circles you warily, snarling and growling with menace.">
		<SETG DOG-SCRIPT 0>
		<CRLF>)>>

<OBJECT BONE
	(IN OPEN-GRAVE)
	(DESC "old bone")
	(SYNONYM BONE)
	(ADJECTIVE OLD)
	(FLAGS TAKEBIT VOWELBIT RMUNGBIT INVISIBLE)
	(VALUE 6)
	(ACTION BONE-F)>

;"RMUNGBIT = bone not discovered"

<ROUTINE BONE-F ()
	 <COND (<AND <VERB? TAKE>
		     <NOT <FSET? ,POODLE ,RMUNGBIT>>>
		<TELL "Are you kidding? This " D ,POODLE " is MEAN!" CR>)>>

<ROUTINE EAST-PAST-DOG? ()
	 <TELL
CT ,POODLE " won't let you near" TR ,COTTAGE>
	 <RFALSE>>

<OBJECT COTTAGE-DOOR
	(IN LOCAL-GLOBALS)
	(DESC "cottage door")
	(SYNONYM DOOR ENTRANCE ENTRY LOCK)
	(ADJECTIVE COTTAGE)
	(FLAGS NDESCBIT DOORBIT LOCKEDBIT)
	(ACTION COTTAGE-DOOR-F)>
	
<ROUTINE COTTAGE-DOOR-F ()
	 <COND (<TOUCHING? ,COTTAGE-DOOR>
		<TELL CT ,POODLE " won't let you near" TR ,COTTAGE>)>>
		     
<OBJECT COTTAGE
	(IN LOCAL-GLOBALS)
	(DESC "cottage")
	(SYNONYM COTTAGE HOUSE BUILDING HOME)
	(FLAGS NDESCBIT)
        (ACTION COTTAGE-F)>

<ROUTINE COTTAGE-F ()
	 <COND (<VERB? ENTER>
		<DO-WALK ,P?EAST>)
	       (<VERB? EXAMINE LOOK-INSIDE>
		<TELL 
"It's a tidy, happy-looking little place" ,PERIOD-CR>)
	       (<OR <ENTERING?> <TOUCHING? ,COTTAGE>>
		<TELL CT ,POODLE "won't let you near" TR ,COTTAGE>)>>

<OBJECT MISS-VOSS
	(DESC "Miss Voss")
	(SYNONYM VOSS WOMAN)
	(ADJECTIVE MISS)
	(FLAGS ACTORBIT NARTICLEBIT NDESCBIT)>

<GLOBAL DIGGER-SCRIPT 0>

;<GLOBAL ENVELOPE-PEERED-AT? <>>   ;"NOW ENVELOPE RMUNGBIT"

<OBJECT GRAVEDIGGER
	(IN SPOOKY-COPSE)
	(DESC "gravedigger")
	(SYNONYM GRAVEDIGGER DIGGER MAN)
	(ADJECTIVE OLD GRAVE)
	(FLAGS ACTORBIT NDESCBIT)
	(ACTION GRAVEDIGGER-F)>

<ROUTINE GRAVEDIGGER-F ("OPTIONAL" (CONTEXT <>))
	 <THIS-IS-IT ,GRAVEDIGGER>
	 <COND ;(<AND <EQUAL? ,RESPONSE 6>
		     <NOT <VERB? HELLO>>>
		<TELL "(Please type GRAVEDIGGER, HELLO.)" CR>
		<RFATAL>)
	       (<VERB? EXAMINE>
		<TELL 
"He's the town " D ,GRAVEDIGGER ", a village fixture since before you were
born" ,PERIOD-CR>)
	       (<VERB? WAVE>
		<TELL CT ,GRAVEDIGGER " winks at you slyly" ,PERIOD-CR>)
	       (<OR <EQUAL? ,WINNER ,GRAVEDIGGER>
		    <AND <VERB? HELLO TELL-ABOUT ASK-ABOUT ASK-FOR>
		         <PRSO? ,GRAVEDIGGER>>>
		<SETG DIGGER-SPOKEN? T>
		<TELL CT ,GRAVEDIGGER " doesn't respond. He seems to be a bit
hard of hearing" ,PERIOD-CR>
		<COND (<FSET? ,GRAVEDIGGER ,NOTTALKEDTOBIT>
		       <FCLEAR ,GRAVEDIGGER ,NOTTALKEDTOBIT>
		       ;<SETG RESPONSE 0>
		       <TELL "|
(Oh well. Apparently, talking to the gravedigger in this" ,EXCERPT " isn't that
important after all. In most other Infocom games, and in the other" ,EXCERPT "s
in this " ,SAMPLER ", you'll find that talking to other characters is very
helpful. This is especially true in mystery games, like Moonmist and
Ballyhoo, in which your interrogation of the various suspects is crucial to
uncovering important clues. If you like, you can wait for the gravedigger to
leave, by typing WAIT a number of times.)" CR>)>
		<RFATAL>)
	       (<VERB? FOLLOW>
		<COND (<AND <EQUAL? ,HERE ,SPOOKY-COPSE>
			    <IN? ,GRAVEDIGGER ,TWILIGHT-GLEN>>
		       <DO-WALK ,P?WEST>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,TWILIGHT-GLEN>
		       <DO-WALK ,P?NORTH>
		       <RTRUE>)>)
	       (<AND <VERB? GIVE SHOW>
		     <EQUAL? ,PRSI ,GRAVEDIGGER>>
		<COND (<EQUAL? ,PRSO ,ENVELOPE>
		       <COND (<FSET? ,ENVELOPE ,RMUNGBIT>
			      <SETG DIGGER-SPOKEN? T>
			      <TELL "I've already seen it." CR>)
			     (T
			      <FSET ,ENVELOPE ,RMUNGBIT>
			      <SETG DIGGER-SPOKEN? T>
			      <TELL 
CT ,GRAVEDIGGER " peers at the address on the "
D ,ENVELOPE ". \"Hmm,\" he mutters, handing it back to you. \"Could've sworn
I buried that woman years ago.\"">
			      <CRLF>
			      <RFATAL>)>)
		      (T
		       <SETG DIGGER-SPOKEN? T>
		       <TELL 
"\"No, thanks,\" he says, shaking his head. \"Got enough junk already.\"" CR>
		       <RTRUE>)>)>>

<ROUTINE NOW-HES-GONE ()
	 <COND (,HAVENT-PRINTED-GONE?
	 	<SETG HAVENT-PRINTED-GONE? <>>
		<QUEUE I-GLOBAL-HINT 6>
		<TELL "|
(The gravedigger, no heavy conversationalist, seems to have vanished. It's
probably all for the best; now that you're all alone, you'll have a chance to
peek around a bit.)" CR>)>>

<ROUTINE I-DIGGER-TALK ()
	 <COND (<EQUAL? ,HERE ,SPOOKY-COPSE>
		<THIS-IS-IT ,GRAVEDIGGER>
		<SETG DIGGER-SCRIPT <+ ,DIGGER-SCRIPT 1>>
	 	<COND (<EQUAL? ,DIGGER-SCRIPT 1>
		       <SETG RESPONSE 6>
		       <TELL CR CT ,GRAVEDIGGER>
		       <TELL " nods a greeting as you approach.|
|
(Characters, such as" T ,GRAVEDIGGER " just described, play a large part in
interactive fiction games, because they can carry on conversations with you.
Sometimes, you'll find that a character can give you valuable information that
will help you to solve a puzzle, or understand the story better. Other times,
the only way to get something done will be to ask another character to do it
for you. To talk to someone in an Infocom story, you can do one of many
things. You could TELL THE GRAVEDIGGER TO do something, or you could
ASK HIM ABOUT something. Alternatively, you could type something like
GRAVE DIGGER, TELL ME ABOUT THE CEMETERY or OLD MAN, KISS THE
TOMBSTONE.)"
CR>
		       ;<TELL "|
(Why not break the ice by typing GRAVEDIGGER, HELLO.)" CR>)
		      
		      (<G? ,DIGGER-SCRIPT 3>
		       <MOVE ,GRAVEDIGGER ,TWILIGHT-GLEN>
		       <DEQUEUE I-DIGGER-TALK>
		       <TELL CR "\"Got to go,\" says" T ,GRAVEDIGGER
", picking up his shovel. \"See you soon.\"|
|
The old man ambles away" ,TO-W ,PERIOD-CR>
		       <NOW-HES-GONE>)

		      ;(<IN? ,ENVELOPE ,HERE>
		       <SETG DIGGER-SCRIPT <- ,DIGGER-SCRIPT 1>>
		       <MOVE ,ENVELOPE ,PROTAGONIST>
		       <TELL CR CT ,GRAVEDIGGER>
		       <TELL " notices" T ,ENVELOPE 
" on" T ,GROUND " and picks it up. \"You dropped this">
		       <COND (<FSET? ,ENVELOPE ,RMUNGBIT> 
			      <TELL ",\" he says, handing it back to you.">
			      ;<YOU-ARE-HOLDING ,ENVELOPE T>
			      <CRLF>)
			     (T
			      <MIND-IF-I-LOOK>
			      <CRLF>
			      <PERFORM ,V?GIVE ,ENVELOPE ,GRAVEDIGGER>
			      <RTRUE>)>)
		      
		      (,DIGGER-SPOKEN?
		       <RTRUE>)
	
		      (<EQUAL? ,DIGGER-SCRIPT 2>
		       <COND (<AND <NOT <FSET? ,ENVELOPE ,RMUNGBIT>>
				   <IN? ,ENVELOPE ,PROTAGONIST>>
			      <TELL CR CT ,GRAVEDIGGER>
			      <TELL " notices" T ,ENVELOPE " you're holding. \"That's a mighty mysterious-lookin' envelope you got there">
			      <MIND-IF-I-LOOK>)
			     (T
			      <TELL
CR "\"Nice grave-diggin' weather we're havin' lately,\"" T ,GRAVEDIGGER
" notes drily" ,PERIOD-CR>)>)
		      
		      (<EQUAL? ,DIGGER-SCRIPT 3>
		       <TELL
CR "\"Couldn't ask for a nicer day for diggin' graves.\"" CR>
		       ;<COND (<AND <NOT <FSET? ,ENVELOPE ,RMUNGBIT>>
				   <IN? ,ENVELOPE ,PROTAGONIST>>
			      <THIS-IS-IT ,ENVELOPE>
			      <TELL
"Sure would like to get a closer look at that " D ,ENVELOPE>)
			     (T
			      )>)>)>>

<ROUTINE MIND-IF-I-LOOK ()
	 <THIS-IS-IT ,ENVELOPE>
	 <TELL ",\" he says." CR>>

<OBJECT ENVELOPE
	(DESC "mysterious envelope")
	(SYNONYM ENVELO MAIL LETTER)
	(ADJECTIVE MYSTER)
	(ACTION ENVELOPE-F)
	(FLAGS TAKEBIT READBIT CONTBIT)
	(VALUE 5)
	(SIZE 3)
	(CAPACITY 1)>

;"RMUNGBIT = SEEN BY GRAVEDIGGER"

<ROUTINE ENVELOPE-F ()
	 <COND (<OR <VERB? EXAMINE>
		    <AND <VERB? READ>
			 <NOT <NOUN-USED ,ENVELOPE ,W?LETTER>>
			 <NOT <NOUN-USED ,ENVELOPE ,W?MAIL>>>>
		<TELL
"The letter is addressed to the proprietor of Ye Olde Magick Shoppe in North
" ,FESTERON "." CR>)
	       (<OR <IN-TBL? ,PRSA ,HURTVERBS ,NHVERBS>
		    <VERB? OPEN READ>>
		<SETG AWAITING-REPLY 2>
		<QUEUE I-REPLY 2>
		<TELL 
"How would you like it if somebody did that to YOUR mail?" CR>)>>

;"****************** HERE BEGINS TUTORIAL STUFF. ************************"

<GLOBAL RESPONSE 0>
;"1 = expecting a LOOK
  2 = expecting INVENTORY
  3 = expecting READ SIGN
  4 = Go east, dammit"

<ROUTINE INTRO ()
	 <SETG HERE ,TUTORIAL-ROOM>
	 <USL>
	 <TELL
"|
(What follows is a " ,TUTORIAL ", designed to get you acquainted with the
interactive fiction medium. When you play an Infocom story, you take the
part of the main character. Your own thinking and imagination guide the
actions of your character through the game towards a set goal. In this "
,TUTORIAL ", a sequence taken from the game Wishbringer, you are a mail clerk
stationed just outside the seaside village of " ,FESTERON ". Your goal
is to deliver" A ,ENVELOPE " to an address in the village. That sounds easy
enough, doesn't it? Well, unfortunately, standing between you and "
,FESTERON " is a rather nasty obstacle: the town librarian's slavering
poodle.)|
|
(With that in mind, h" ,HIT-RETURN "begin the " ,TUTORIAL "...)">
	 <READ ,P-LEXV ,P-INBUF>
	 <SETG HERE ,HILLTOP>
	 <MOVE ,PROTAGONIST ,HERE>
	 <USL>
	 <CRLF>
	 ;<CRLF>
	 <V-VERSION>
	 <CRLF>
	 <V-LOOK>
	 <TELL "|
(Okay, we're underway. The description you just saw
contains lots of useful information about directions you can walk in
from here, and things you can look at, or manipulate. Should you want to
reread it later on, just type LOOK or LOOK AROUND. Try typing
that now at the \">\" prompt, and don't forget to h" ,HIT-RETURN 
"end your typing.)|">
	 <SETG RESPONSE 1>>

<ROUTINE I-RESPONSE ()
	 <DEQUEUE I-RESPONSE>
	 <TELL CR "(">
	 <COND (<EQUAL? ,RESPONSE 2>
		<SETG RESPONSE 3>
		<TELL
"That's" T ,ENVELOPE " that you're supposed to deliver to " ,FESTERON ".
By the way, you can abbreviate INVENTORY to just I to save typing.
Anyhow, you'd better be on your way. According to the description of"
T ,HILLTOP ", you can go to the east or west. Luckily, there's a
road sign to inform you of which path leads to the village. To read the
sign, you can type READ THE SIGNPOST or EXAMINE SIGN or LOOK
AT THE ROAD SIGN.)" CR>)
	       (<EQUAL? ,RESPONSE 3>
		<SETG RESPONSE 4>
	 	<TELL 
"From here on, you'll be on your own. You'll still receive plenty
of hints and encouragement, but your wits and imagination alone can
guide your character toward the goal. While you won't find any more helpful
signs in the " ,TUTORIAL ", you can type HELP at any prompt if you're at
a loss for things to do. To set off for the village, you can type
GO EAST, WALK TO THE EAST or even just E. And don't forget,
if you want to reread the description of the place you're at, you can type
LOOK.)" CR>)>>   

<GLOBAL FESTERON "Festeron">

<ROOM ROTARY-SOUTH
      (IN ROOMS)
      (DESC "Rotary South")
      (FLAGS ONBIT)
      (LDESC
"This is the south side of the Festeron Rotary. A road branches south, towards
Post Office Hill.|
|
The Festeron Public Library, famous for its museum of local historic
artifacts, stands proudly on the nearby corner.|
|
Miss Voss, the town librarian, is locking the library door as you approach.
\"Just the person I was looking for!\" she exclaims, smiling brightly.|
")>

<ROUTINE I-WIN-TUTORIAL ()
	 <SETG SCORE 15>
	 <TELL
"(Well done! You have managed to get past the poodle, and have thus completed
the " ,TUTORIAL ". [Note that if you were really playing Wishbringer now,
your adventures would only be beginning.] You're probably ready to play the
other excerpts, but if you'd like to replay the " ,TUTORIAL ", type
RESTART at the \">\" prompt below. Otherwise, type QUIT, and you'll
be returned to " D ,MENU-ROOM ", from which you can enter the
other" ,EXCERPT "s.)" CR>
	 <FINISH>>

<ROUTINE I-GLOBAL-HINT ()
	 <COND (<FSET? ,BONE ,TOUCHBIT>
		<RFALSE>)>
	 <TELL "|(">
	 <GIVE-HINT>
	 <TELL ")" CR>
	 <QUEUE I-GLOBAL-HINT 9>> 

<ROUTINE V-HELP ()
	 <COND (<EQUAL? ,GAME-FLAG 4>
		<GIVE-HINT>
		<QUEUE I-GLOBAL-HINT 9>
		<CRLF>)
	       (T
		<TELL "[The HELP command only works in the " ,TUTORIAL
" segment. In this excerpt, I'm sorry to say, you're on your own.]" CR>)>>

<ROUTINE GIVE-HINT ()
	 <COND (<NOT <FSET? ,POODLE ,RMUNGBIT>>
		<TELL "You've bribed the poodle. He won't be bothering you
any more. You're free to go north and to deliver that envelope.">)
	       (<FSET? ,BONE ,TOUCHBIT>
	        <TELL
"You need to get past a poodle. You've found a bone. And you're still stuck?"
>)
	       (<OR ,TOMB-INSPECTED?
		    <FSET? ,INSIDE-GRAVE ,TOUCHBIT>>
		<TELL
"You'll need that bone to complete the " ,TUTORIAL " segment. ">
		<COND (<NOT <EQUAL? ,HERE ,SPOOKY-COPSE ,INSIDE-GRAVE>>
		       <TELL "Return to" T ,SPOOKY-COPSE " and t">)
		      (T
		       <PRINT "T">)>
		<TELL "ype ">
		<COND (<AND <NOT <EQUAL? ,HERE ,INSIDE-GRAVE>>
			    <OR <FSET? ,INSIDE-GRAVE ,TOUCHBIT>
				<NOT ,FIRST-CANT-REACH>>>
		       <TELL "ENTER THE GRAVE THEN ">)>
		<TELL "TAKE THE BONE.">)
	       (<AND <EQUAL? ,HERE ,CREEPY-CORNER>
		     <IN? ,GRAVEDIGGER ,SPOOKY-COPSE>>
		<TELL
"There's more to" T ,CEMETERY " than just" T ,CREEPY-CORNER "! Try walking"
,TO-N ".">) 
	       (<EQUAL? ,HERE ,CREEPY-CORNER ,SPOOKY-COPSE
					,TWILIGHT-GLEN>
		<COND (<IN? ,GRAVEDIGGER ,SPOOKY-COPSE>
		       <TELL
CT ,GRAVEDIGGER " is not too interesting a fellow, but he shouldn't be around
for much longer. Just wait for a bit.">)
		      (T
		       <SETG DONT-LEAVE-PRINTED? T>
		       <TELL 
"Try reviewing the descriptions of each place in the cemetery, by typing
LOOK or L at the \">\" prompt. You'll see that one thing in
particular is mentioned quite notably, thus deserving a little extra
scrutiny. Remember, to examine an object closely, you can LOOK AT it,
or EXAMINE it.">)>)
	       (<FSET? ,CREEPY-CORNER ,TOUCHBIT>
		<TELL
"There are things in the cemetery that you still haven't discovered. Try going
back there and peeking around.">)
	       (<FSET? ,OUTSIDE-COTTAGE ,TOUCHBIT>
		<TELL "Maybe you should ">
		<COND (<EQUAL? ,HERE ,OUTSIDE-COTTAGE>
		       <TELL "walk back up the hill, and ">)>
		<TELL "explore some other places in the " ,TUTORIAL ". You
might discover something that will help you get past the poodle.">)
	       (T
		<TELL "Try going">
		<COND (<EQUAL? ,HERE ,OUTSIDE-CEMETERY>
		       <TELL " back up the hill and walking">)>
		<TELL ,TO-E ".">)>> 

<GLOBAL FIRST-NORTH? T>
<GLOBAL FIRST-HURT? T>
<GLOBAL FIRST-ENTER? T>
<GLOBAL HAVENT-PRINTED-GONE? T>
<GLOBAL FIRST-CANT-REACH T>
<GLOBAL PRINT-CANT-REACH T>
<GLOBAL STATUS-LINE-INFO-GIVEN? <>>
<GLOBAL TOMB-INSPECTED? <>>
<GLOBAL NO-BONE-WARNINGS-YET T>
<GLOBAL DIGGER-SPOKEN? <>>

<ROUTINE PROTAGONIST-F ()
	 <COND (<VERB? RESTART QUIT>
		<RFALSE>)
	       (<EQUAL? ,RESPONSE 1>
		<SETG RESPONSE 2>
		<V-LOOK>
		<CRLF>
		<TELL "(In the future, you can abbreviate
LOOK to just L if you wish. There are many other useful command
words that you may want to use. Should you want to start an" ,EXCERPT "
over, type RESTART. If you wish to stop playing an" ,EXCERPT " altogether,
typing QUIT will take you back to " D ,MENU-ROOM ". SCORE approximates
how close you are to finishing a segment,
by giving you a numeric score. The INVENTORY command is also very
useful. It lists what you're currently carrying.)|
|
(Try typing INVENTORY now.)" CR>)
	       (<EQUAL? ,RESPONSE 2>
		<QUEUE I-RESPONSE -1>
		<RFALSE>)
	      (<EQUAL? ,RESPONSE 3>
	       <QUEUE I-RESPONSE -1>
	       <RFALSE>)
	      (<AND <EQUAL? ,RESPONSE 4>
	            <OR <AND <VERB? WALK>
			     <EQUAL? ,P-WALK-DIR ,P?WEST>>
			<AND <VERB? WALK-TO>
			     <EQUAL? ,P-DIRECTION ,P?WEST>>>>
	       <SETG CLOCK-WAIT T>
	       <TELL "(But the village lies" ,TO-E "!)" CR>
	       <RFATAL>)>>
