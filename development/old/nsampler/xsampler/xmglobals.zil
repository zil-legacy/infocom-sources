"GLOBALS for
		                BALLYHOO
	(c) Copyright 1986 Infocom, Inc.  All Rights Reserved."

<DIRECTIONS ;"Do not change the order of the first 8 without consulting MARC!"
 	    NORTH NE EAST SE SOUTH SW WEST NW UP DOWN IN OUT>

<GLOBAL HERE <>>

<GLOBAL LIT T>

<GLOBAL MOVES 0>

<GLOBAL SCORE 0>

;"global objects and associated routines"

<OBJECT GLOBAL-OBJECTS
	(FLAGS INVISIBLE TOUCHBIT SURFACEBIT TRYTAKEBIT OPENBIT
	       SEARCHBIT TRANSBIT WEARBIT RMUNGBIT ONBIT
	       LIGHTBIT RLANDBIT WORNBIT VEHBIT INDOORSBIT
	       LOCKEDBIT EATBIT CAGEBIT CONTBIT PERSON
	       VOWELBIT NDESCBIT DOORBIT ACTORBIT FEMALE
	       NOA AIRBIT CLEARBIT REWEARBIT)>

<OBJECT LOCAL-GLOBALS
	(IN GLOBAL-OBJECTS)
	(SYNONYM ZZMGCK)
	(DESCFCN 0)
        (GLOBAL GLOBAL-OBJECTS)
	(FDESC "F")
	(LDESC "F")
	(PSEUDO "FOOBAR" V-WALK)
	(SIZE 0)
	(TEXT "")
	(CAPACITY 0)>
;"Yes, this synonym for LOCAL-GLOBALS needs to exist... sigh"

<OBJECT ROOMS
	(IN TO ROOMS)>

<OBJECT INTDIR
	(IN GLOBAL-OBJECTS)
	(DESC "direction")
	(SYNONYM DIRECTION)
	(ADJECTIVE NORTH EAST SOUTH WEST ; "UP DOWN" NE NW SE SW)
    ;  "(NE 0)
	(SE 0)
	(SW 0)
	(NW 0)" >
	       
<OBJECT INTNUM
	(IN GLOBAL-OBJECTS)
	(SYNONYM NUMBER INTNUM)
	(SDESC "number")
	;(ACTION INTNUM-F)>

;<ROUTINE INTNUM-F ()
	 <COND (<AND ,P-DOLLAR-FLAG
		     <NOT <EQUAL? ,PRSA ,V?TAKE ,V?ASK-FOR>>
		     <EQUAL? ,WINNER ,PROTAGONIST>
		     <G? ,P-AMOUNT ,POCKET-CHANGE>>
		<TELL "You don't have that much.|">)>>

;<GLOBAL POCKET-CHANGE 1281>

;<OBJECT GLOBAL-MONEY
	(IN GLOBAL-OBJECTS)
	(SYNONYM MONEY CASH BUCKS BILL)
	(ADJECTIVE COIN COINS MY DOLLAR)
	(DESC "money")
	(FLAGS NOA)
	(ACTION GLOBAL-MONEY-F)>

;<ROUTINE GLOBAL-MONEY-F ()
	 <COND (<DONT-HANDLE? ,GLOBAL-MONEY>
		<RFALSE>)
	       (<VERB? FIND>
		<V-DIG>
		<RTRUE>)
	       (<VERB? PASS>
		<RFALSE>)
      	       (<VERB? COUNT>
		<TELL "You're carrying ">
		<PRINT-AMOUNT ,POCKET-CHANGE>
		<TELL ,PERIOD>)
	       (<VERB? EXAMINE>
		<TELL "It looks a lot like ">
		<PRINT-AMOUNT ,POCKET-CHANGE>
		<TELL ,PERIOD>)
	       (<VERB? TAKE>
		<HAVE-IT>)
	       (T
		<TELL 
"Treating your hard-earned cash this way won't get you anywhere." CR>
		<RFATAL>) >>

<OBJECT PSEUDO-OBJECT
	(DESC "pseudo")
	(ACTION ME-F)>

<OBJECT IT
	(IN GLOBAL-OBJECTS)
	(SYNONYM IT THEM HER HIM)
	(DESC "it")
	(FLAGS VOWELBIT NARTICLEBIT NDESCBIT TOUCHBIT)>

<OBJECT NOT-HERE-OBJECT
	(DESC "it")
	(FLAGS NARTICLEBIT)
	(ACTION NOT-HERE-OBJECT-F)>

<ROUTINE NOT-HERE-OBJECT-F ("AUX" TBL (PRSO? T) OBJ (X <>))
	 <COND (<AND <PRSO? ,NOT-HERE-OBJECT>
		     <PRSI? ,NOT-HERE-OBJECT>>
		<TELL "[Those things aren't here!]" CR>
		<RTRUE>)
	       (<PRSO? ,NOT-HERE-OBJECT>
		<SET TBL ,P-PRSO>)
	       (T
		<SET TBL ,P-PRSI>
		<SET PRSO? <>>)>
	 <COND (.PRSO?
		<COND (<OR <EQUAL? ,PRSA ,V?FIND ,V?FOLLOW>
			   <EQUAL? ,PRSA ,V?WHAT ,V?WHERE ,V?WHO>
			   <EQUAL? ,PRSA ,V?WAIT-FOR ,V?WALK-TO>
			   <EQUAL? ,PRSA ,V?BUY ,V?CALL ;,V?SAY>
			   <AND <EQUAL? ,PRSO ,GIRL>
				<EQUAL? ,PRSA ,V?LISTEN>
				<IN? ,GIRL ,LOCAL-GLOBALS>>>
		       <SET X T>
		       <COND (<SET OBJ <FIND-NOT-HERE .TBL .PRSO?>>
			      <COND (<NOT <EQUAL? .OBJ ,NOT-HERE-OBJECT>>
				     <RTRUE>)>)
			     (T
			      <RFALSE>)>)>)
	       
	      (T
	       <COND (<OR <EQUAL? ,PRSA ,V?ASK-ABOUT ,V?ASK-FOR ,V?TELL-ABOUT>
		      	  <EQUAL? ,PRSA ,V?SEARCH-OBJECT-FOR>>
		      <SET X T>
		      <COND (<SET OBJ <FIND-NOT-HERE .TBL .PRSO?>>
			     <COND (<NOT <EQUAL? .OBJ ,NOT-HERE-OBJECT>>
				    <RTRUE>)>)
			    (T
			     <RFALSE>)>)>)>
;"Here is the default 'cant see any' printer"
	 <COND (.X
		<TELL ,SPECIFIC>)	       
	       (<EQUAL? ,WINNER ,PROTAGONIST>
		<TELL "[You can't ">
		<COND (<EQUAL? ,P-XNAM ,W?CONVER ,W?VOICE ,W?VOICES>
		       <TELL "hear">)
		      (T
		       <TELL "see">)>
		<COND (<NOT <NAME? ,P-XNAM>>
		       <TELL " any">)> 
		<NOT-HERE-PRINT .PRSO?>
		<TELL " here.]" CR>)
	       (<EQUAL? ,THUMB ,WINNER>
		<RFALSE>)
	       (<EQUAL? ,WINNER ,GUARD>
	        <RFALSE>)
	       (T
		<TELL "Looking confused,">
		<ARTICLE ,WINNER T>
		<TELL " says, \"I don't see">
		<COND (<NOT <NAME? ,P-XNAM>>
		       <TELL " any">)>
		<NOT-HERE-PRINT .PRSO?>
		<TELL " here!\"" CR>)>
	 <STOP>>

<ROUTINE FIND-NOT-HERE (TBL PRSO? "AUX" M-F OBJ)
;"Protocol: return T if case was handled and msg TELLed, NOT-HERE-OBJECT
  if 'can't see' msg TELLed, <> if PRSO/PRSI ready to use"
;"Special-case code goes here. <MOBY-FIND .TBL> returns # of matches. If 1,
then P-MOBY-FOUND is it. You can treat the 0 and >1 cases alike or differently.
Always return RFALSE (not handled) if you have resolved the problem."
	<SET M-F <MOBY-FIND .TBL>>
	;<COND (,DEBUG
	       <TELL "[Found " N .M-F " obj]" CR>)>
	<COND (<EQUAL? 1 .M-F>
	       ;<COND (,DEBUG
		      <TELL "[Namely: " D ,P-MOBY-FOUND "]" CR>)>
	       <COND (.PRSO?
		      <SETG PRSO ,P-MOBY-FOUND>
		      <SETG P-IT-OBJECT ,PRSO>)
		     (T
		      <SETG PRSI ,P-MOBY-FOUND>)>
	       <RFALSE>)
	      (<AND <L? 1 .M-F>
		    <SET OBJ <APPLY <GETP <SET OBJ <GET .TBL 1>> ,P?GENERIC>>>>
;"Protocol: returns .OBJ if that's the one to use
  		    ,NOT-HERE-OBJECT if case was handled and msg TELLed
		    <> if WHICH-PRINT should be called"
	       ;<COND (,DEBUG
		      <TELL "[Generic: " D .OBJ "]" CR>)>
	       <COND (<EQUAL? .OBJ ,NOT-HERE-OBJECT>
		      <RTRUE>)
		     (.PRSO?
		      <SETG PRSO .OBJ>
		      <SETG P-IT-OBJECT ,PRSO>)
		     (T
		      <SETG PRSI .OBJ>)>
	       <RFALSE>)
	      (T
	       ,NOT-HERE-OBJECT)>>

<ROUTINE NOT-HERE-PRINT (PRSO?)
	 <COND (,P-OFLAG
	        <COND (,P-XADJ
		       <TELL " ">
		       <PRINTB ,P-XADJN>)>
	        <COND (,P-XNAM
		       <TELL " ">
		       <PRINTB ,P-XNAM>)>)
               (.PRSO?
	        <BUFFER-PRINT <GET ,P-ITBL ,P-NC1><GET ,P-ITBL ,P-NC1L> <>>)
               (T
	        <BUFFER-PRINT <GET ,P-ITBL ,P-NC2><GET ,P-ITBL ,P-NC2L> <>>)>>

<OBJECT LIGHT
	(IN GLOBAL-OBJECTS)
	(DESC "light")
	(SYNONYM LIGHT LIGHTS LAMP SPOTLIGHT)
	(ADJECTIVE GLARING)
	(FLAGS LIGHTBIT)
	(ACTION LIGHT-F)>

<ROUTINE LIGHT-F ()
	 <COND (<VERB? LAMP-ON LAMP-OFF>
		<TELL "You've no access to the lighting equipment." CR>)>>

<OBJECT DARKNESS
	(IN GLOBAL-OBJECTS)
	(DESC "darkness")
	(SYNONYM DARK DARKNESS)
	(FLAGS NARTICLEBIT)
        (ACTION DARKNESS-F)>

<ROUTINE DARKNESS-F ()
	 <COND (<VERB? THROUGH BOARD WALK-TO>
		<V-WALK-AROUND>)>>

<OBJECT GROUND
	(IN GLOBAL-OBJECTS)
	(SYNONYM FLOOR GROUND SAWDUST FIELD)
	(ADJECTIVE GRASSY ARENA)
	(DESC "ground")
	(ACTION GROUND-F)>

<ROUTINE GROUND-F ()
	 <COND (<VERB? CLIMB-UP CLIMB-ON CLIMB-FOO BOARD>
		<V-DIG>)
	       (<VERB? LOOK-UNDER>
		<V-COUNT>)
	       (<AND <VERB? SEARCH-OBJECT-FOR>
		     <EQUAL? ,HERE ,UNDER-STANDS>
		     <PRSO? ,GROUND>>
		<PERFORM ,V?SEARCH-OBJECT-FOR ,GARBAGE ,PRSI>
		<RTRUE>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,PLATFORM-1 ,PLATFORM-2 ,TIGHTROPE-ROOM>>
		<PERFORM ,V?LOOK-DOWN>
		<RTRUE>)
	       (<VERB? THROUGH> ;"cross"
	        <V-WALK-AROUND>)
	       (<VERB? LEAVE>
		<DO-WALK ,P?UP>)>>

<OBJECT WALLS
	(IN GLOBAL-OBJECTS)
	(FLAGS NDESCBIT TOUCHBIT)
	(DESC "wall")
	(SYNONYM WALL WALLS)
	(ADJECTIVE SIDE)
	(ACTION WALLS-F)>

<ROUTINE WALLS-F ()
	 <COND (<EQUAL? ,HERE ,PROP-ROOM>
		<PERFORM ,PRSA ,CANVAS>
		<RTRUE>)>>

<OBJECT CEILING
	(IN GLOBAL-OBJECTS)
	(FLAGS NDESCBIT TOUCHBIT)
	(DESC "ceiling")
	(SYNONYM CEILIN ROOF)
	(ACTION CEILING-F)>

<ROUTINE CEILING-F ()
	 <COND (<VERB? LOOK-UNDER>
		<PERFORM ,V?LOOK>
		<RTRUE>)>>

<OBJECT AIR
	(IN GLOBAL-OBJECTS)
	(DESC "air")
	(SYNONYM AIR)
	(FLAGS VOWELBIT NARTICLEBIT AIRBIT)
	(ACTION AIR-F)>

<ROUTINE AIR-F ()
	 <COND (<VERB? SMELL>
		<PERFORM ,V?SMELL>
		<RTRUE>)>>

<OBJECT HANDS
	(IN GLOBAL-OBJECTS)
	(SYNONYM HANDS HAND PALM)
	(ADJECTIVE MY YOUR)
	(DESC "your hand")
	(FLAGS NDESCBIT TOUCHBIT NARTICLEBIT)
	(ACTION HANDS-F)>

<ROUTINE HANDS-F ("AUX" ACTOR)
	 <COND (<VERB? WAVE>
	        <SETG PRSO <>>
		<PERFORM ,V?WAVE-AT>
		<RTRUE>)
	       (<VERB? READ EXAMINE>
		<TELL "Your lifeline is very short." CR>)
	       (<VERB? CLAP>
		<SETG PRSO <>>
		<PERFORM ,V?CLAP>
		<RTRUE>)
	       (<AND <VERB? PUT>
		     <PRSI? ,HANDS>>
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)  
	       (<VERB? SHAKE>
		<COND (<SET ACTOR <FIND-IN ,HERE ,PERSON>>
		       <PERFORM ,V?THANK .ACTOR>
		       <RTRUE>)
		      (T
		       <TELL "Glad to meet you." CR>)>)>>

<OBJECT HEAD
	(IN GLOBAL-OBJECTS)
	(DESC "your head")
	(SYNONYM HEAD) 
	(ADJECTIVE YOUR MY)
	(FLAGS NARTICLEBIT)>

<OBJECT PROTAGONIST
	(SYNONYM PROTAG)
	(DESC "it")
	(FLAGS NDESCBIT INVISIBLE)
	(ACTION PROTAGONIST-F)>

;"RMUNGBIT = can win the DID puzzle of yes-no stuff"

<ROUTINE PROTAGONIST-F ()
	 <RFALSE>>

<ROUTINE PROTAGONIST-HACK-F ()
	 <COND (<FSET? ,MASK ,WORNBIT>
		<COND (<OR <NOT <EQUAL? ,WINNER ,PROTAGONIST>>
		           <VERB? ASK-ABOUT TELL TELL-ABOUT HELLO REPLY>>
		       <TELL "The " D ,MASK " muffles your words." CR>
		       <SETG P-IT-OBJECT ,MASK>
		       <STOP>)
		      (<AND <VERB? INHALE KISS>
			    ,PRSO>
		       <TELL "The " D ,MASK " is in the way." CR>
		       <SETG P-IT-OBJECT ,MASK>
		       <STOP>)
		      (T
		       <RFALSE>)>)
		(<AND <ENABLED? ,I-HELIUM>
		      <NOT <TALKING-TO? ,GUARD>>
		      <OR <VERB? ASK-ABOUT TELL TELL-ABOUT HELLO REPLY>
			  <NOT <EQUAL? ,WINNER ,PROTAGONIST>>>>
		 <SETG SPEAK-HELIUM T>
		 <PUTP ,PROTAGONIST ,P?ACTION ,PROTAGONIST-F>
		 <TELL
"As a squeaky voice emerges, you're surprised">
		 <COND (<AND ,PRSO
			     <NOT <EQUAL? ,PRSO ,ME>>> 
		        <TELL " but">
		 	<ARTICLE ,PRSO T>
		 	<TELL " isn't at all amused">)>
		 <TELL ,PERIOD>
		 <STOP>)>>

<OBJECT YOU
	(IN GLOBAL-OBJECTS)
	(SYNONYM YOU YOURSELF HIMSELF HERSELF)
	(DESC "himself or herself")
	(FLAGS NDESCBIT NARTICLEBIT)
	(ACTION YOU-F)>

<ROUTINE YOU-F ()
	 <COND (<AND <VERB? ASK-ABOUT>
		     <EQUAL? ,PRSI ,YOU>>
		<PERFORM ,V?ASK-ABOUT ,PRSO ,PRSO>
		<RTRUE>)
	       (<AND <VERB? TELL-ABOUT> 
		     <EQUAL? ,PRSI ,YOU>>
		<PERFORM ,V?TELL-ABOUT ,PRSO ,WINNER>
		<RTRUE>)>>
 
<OBJECT ME
	(IN GLOBAL-OBJECTS)
	(SYNONYM I ME MYSELF)
	(DESC "yourself")
	(FLAGS ACTORBIT TOUCHBIT NARTICLEBIT)
	(ACTION ME-F)>

<ROUTINE ME-F ("AUX" OLIT) 
	 <COND (<VERB? TELL>
	        <TELL
"Talking to yourself is a sign that it's getting late." CR>
		<STOP>)
	       (<VERB? LISTEN>
		<TELL "Yes?" CR>)
	       (<VERB? ALARM>
		<TELL ,YOU-ARE CR>)
	       (<VERB? TAKE KILL MUNG>
		<TELL ,BASKET-CASE CR>)
	       (<AND <VERB? GIVE>
		     <PRSI? ,ME>>
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)
	       (<VERB? MOVE>
		<V-WALK-AROUND>)
	       (<VERB? SEARCH>
		<V-INVENTORY>
		<RTRUE>)
	       (<VERB? FIND>
		<TELL "You're right here!" CR>)
	       (<VERB? FOLLOW>
		<V-WALK-AROUND>)>>

<OBJECT GLOBAL-ROOM
	(IN GLOBAL-OBJECTS)
	(DESC "room")
	(SYNONYM ROOM PLACE ARENA)
	(ACTION GLOBAL-ROOM-F)>

<ROUTINE GLOBAL-ROOM-F ()
	 <COND (<VERB? LOOK LOOK-INSIDE EXAMINE>
		<V-LOOK>
		<RTRUE>)
	       (<VERB? THROUGH WALK-TO ENTER>
		<COND (<AND <PRSO? ,RING>
			    <EQUAL? ,HERE ,WINGS>>
		       <DO-WALK ,P?NORTH>)
		      (T
		       <V-WALK-AROUND>)>)
	       (<VERB? LEAVE EXIT>
		<DO-WALK ,P?OUT>)
	       (<VERB? WALK-AROUND>
                <TELL
"Walking around here reveals nothing new. To move elsewhere, just type
the desired direction." CR>)
	       (<VERB? LAMP-ON>
		<PERFORM ,V?LAMP-ON ,LIGHT>
		<RTRUE>)>>

<OBJECT VOICES
	(IN GLOBAL-OBJECTS)
	(DESC "conversation")
	(SYNONYM CONVER VOICES VOICE)
	(ADJECTIVE HIGH HIGH-)
	(FLAGS NDESCBIT INVISIBLE CLEARBIT)
	(ACTION VOICES-F)>

<ROUTINE VOICES-F ("AUX" ACTOR)
	 <COND (<VERB? LISTEN>
		<COND (<RUNNING? ,I-MEET>
		       <COND (<EQUAL? ,MEET-COUNTER 7 8>
			      <RTRUE>)
			     (T
			      <TELL "They're too muffled." CR>)>)
		      (<EQUAL? <META-LOC ,THUMB> ,HERE>
		       <PERFORM ,V?LISTEN ,THUMB>
		       <RTRUE>)
		      (<ZERO? <GET ,P-ADJW 0>>
		       <CANT-SEE ,VOICES>)
		      (T
		       <CANT-SEE <> "the midget">)>)
	       (<VERB? TALK-INTO>
		<COND (<IN? ,GUARD ,HERE>
		       <COND (<ENABLED? ,I-HELIUM>
			      <PERFORM ,V?HELLO ,GUARD>
			      <RTRUE>)
			     (T
			      <TELL 
"The guard turns his head toward you but seems unmoved by your falsetto
performance." CR>)>)
		     (<SET ACTOR <FIND-IN ,HERE ,PERSON>> ;"me isn't person"
		      <TELL 
"Hardly amused, " D .ACTOR " ignores your performance." CR>)
		     (<SET ACTOR <FIND-IN ,HERE ,ACTORBIT>>
		      <PERFORM ,V?TELL .ACTOR>
		      <RTRUE>)
		     (T
		      <PERFORM ,V?TELL ,ME>
		      <RTRUE>)>)
	        (T
		 <CANT-SEE ,VOICES>)>>

<ROUTINE TALKING-TO? (ACTOR)
	 <COND (<OR <ASKING? .ACTOR>
		    <EQUAL? ,WINNER .ACTOR>>
		<RTRUE>)
	       (<AND <VERB? TELL TELL-ABOUT HELLO WAVE-AT REPLY YELL ALARM>
		     <EQUAL? ,PRSO .ACTOR>>
	        <RTRUE>) 
	       (T
		<RFALSE>)>>

<ROUTINE ASKING? (ACTOR)
	 <COND (<AND <VERB? ASK-ABOUT ASK-FOR>
		     <EQUAL? ,PRSO .ACTOR>>
	        <RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE TOUCHING? (THING)
	 <COND (<AND <TOUCHING-VERB?>
       		     <EQUAL? ,PRSO .THING>>
		<RTRUE>)
	       (<HURT? .THING>
		<RTRUE>)
	       (<AND <PRSI? .THING>
		     <VERB? SHOW GIVE PUT PUT-ON>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE TOUCHING-VERB? ()
	 <COND (<OR <EQUAL? ,PRSA ,V?TAKE ,V?RUB ,V?SHAKE>
		    <EQUAL? ,PRSA ,V?SPIN ,V?CLEAN ,V?KISS>
		    <EQUAL? ,PRSA ,V?PUSH ,V?CLOSE ,V?LOOK-UNDER>
	            <EQUAL? ,PRSA ,V?MOVE ;,V?TAKE-WITH ,V?OPEN ,V?KNOCK>
		    <EQUAL? ,PRSA ,V?SET ,V?SHAKE ,V?RAISE>
		    <EQUAL? ,PRSA ,V?UNLOCK ,V?LOCK ,V?CLIMB-UP>
		    <EQUAL? ,PRSA ,V?CLIMB-FOO ,V?CLIMB-DOWN ,V?CLIMB-ON>
		    <EQUAL? ,PRSA ,V?BOARD ,V?THROUGH ,V?LAMP-ON>
		    <EQUAL? ,PRSA ,V?BITE ,V?KICK ,V?KILL>
		    <EQUAL? ,PRSA ,V?MUNG ,V?PUSH>
		    <EQUAL? ,PRSA ,V?LEAP ,V?LAMP-OFF ,V?PUT>
		    <EQUAL? ,PRSA ,V?PUT-ON ,V?SEARCH ,V?LOOK-INSIDE>
		    <EQUAL? ,PRSA ,V?POUR ,V?EAT>>
		<RTRUE>)	
	       (T
		<RFALSE>)>>

<ROUTINE DISTURB? (THING)
	 <COND (<OR <TOUCHING? .THING>
		    <TALKING-TO? .THING>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE HURT? (THING)
	 <COND (<AND <OR <EQUAL? ,PRSA ,V?MUNG ,V?KICK ,V?KILL>
			 <EQUAL? ,PRSA ,V?KNOCK ,V?CUT>
			 <EQUAL? ,PRSA ,V?BITE ,V?PUSH>>
		     <EQUAL? ,PRSO .THING>>
		<RTRUE>)
	       ;(<AND <VERB? THROW>
		     <EQUAL? ,PRSI .THING>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE CANT-REACH (THING)
	 <TELL "You can't reach">
	 <ARTICLE .THING T>
	 <COND (<EQUAL? .THING ,NIMROD ,ELSIE>
		<TELL ", luckily." CR>)
	       (T
		<TELL ,PERIOD>)>
	 <RTRUE>>

<ROUTINE CANT-SEE ("OPTIONAL" (OBJ <>) (STRING <>))
	<TELL "[You can't ">
	<COND (<AND .OBJ
		    <EQUAL? .OBJ ,VOICES>>
	       <TELL "hear">)
	      (T
	       <TELL "see">)>
	<COND (.OBJ		       
	       <COND (<NOT <AND <EQUAL? .OBJ ,PRSO>
				<NAME? <GET ,P-NAMW 0>>>>
		      <TELL " any">)>)>
	<COND (<NOT .OBJ>
	       <TELL " " .STRING>)
	      (<EQUAL? .OBJ ,PRSI>
	       <PRSI-PRINT>)
	      (T
	       <PRSO-PRINT>)>
       <TELL " here.]" CR>
       <SETG P-WON <>>
       <STOP>>

<ROUTINE YOU-CANT-USE (STRING)
	 <TELL "[You can't use " .STRING " that way.]" CR>>

<ROUTINE CANT-OPEN ()
	 <COND (<VERB? OPEN CLOSE>	
		<TELL "You can't ">	
		<COND (<VERB? OPEN>
		       <TELL "open">)
		      (T
		       <TELL "close">)>
		<ARTICLE ,PRSO>
		<TELL ,PERIOD>)>>

<ROUTINE CARRIAGE-RETURNS (CNT)
	 <REPEAT ()
		 <CRLF>
	         <SET CNT <- .CNT 1>>
		 <COND (<0? .CNT>
			<RTRUE>)>>>

<ROUTINE TELL-HIT-HEAD ()
	 <TELL "You hit your head against">
	 <ARTICLE ,PRSO T>
	 <TELL " as you attempt this." CR>>

<ROUTINE IS-NOUN? (TEST-NOUN)            ;"prso"         ;"prsi"
	 <COND (<EQUAL? .TEST-NOUN <GET ,P-NAMW 0> <GET ,P-NAMW 1>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE IS-ADJ? (TEST-ADJ)
	 <COND (<EQUAL? .TEST-ADJ <GET ,P-ADJW 0> <GET ,P-ADJW 1>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE TELL-SEE-MANUAL ()
	 <TELL 
"[Please consult your manual for the correct way to talk to characters.]" CR>>

<GLOBAL LOOK-AROUND "Look around you.">

<GLOBAL YAWNS <LTABLE 0 "unusual" "interesting" "extraordinary" "special">>

<GLOBAL ALREADY-OPEN "It's already open.">

<GLOBAL ALREADY-CLOSED "It's already closed.">

<GLOBAL TOO-DARK "It's too dark to see.">

<GLOBAL CANT-GO "You can't go that way.">

<GLOBAL NOT-HOLDING "You're not holding">

<GLOBAL UNBALANCED "Confirmed. You are a completely unbalanced person. ">

<GLOBAL HIGH-ABOVE " high above the arena floor">

<GLOBAL YOU-SEE "You can see">

<GLOBAL YOU-ARE "You already are.">

<GLOBAL REFERRING "[It's unclear what you're referring to.]">

<GLOBAL BASKET-CASE "You're not a basket case. Yet.">

<GLOBAL PERIOD ".|">

<GLOBAL NO-TALENT "This bit of gymnastics is beyond your talent.">

<GLOBAL SPECIFIC "You'll have to be more specific.|">

<GLOBAL BAD-SENTENCE "[That sentence isn't one I recognize.]">

<GLOBAL BEAT-IT "\"Show's over. Beat it, sucker.\"|">

<GLOBAL EMPTY "It's empty">