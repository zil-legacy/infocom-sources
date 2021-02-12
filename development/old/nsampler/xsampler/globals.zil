"GLOBALS for
		      SAMPLER II
	(c) Copyright 1987 Infocom, Inc.  All Rights Reserved."

<DIRECTIONS ;"Do not change the order of the first 8 without consulting MARC!"
 	    NORTH NE EAST SE SOUTH SW WEST NW UP DOWN IN OUT>

;<ADJ-SYNONYM LARGE LARGER HUGE HUGER BIG BIGGER GIANT GIGANTIC TREMENDOUS
	     MIGHTY MIGHTIER MASSIVE>

;<ADJ-SYNONYM WIDE BROAD>

;<ADJ-SYNONYM SMALL SMALLER TINY TINIER LITTLE PETITE TEENSY WEENSY>

;<ADJ-SYNONYM MY MINE>

<GLOBAL LIT T>

;<GLOBAL RANK 0>

<GLOBAL MOVES 0>

<GLOBAL SCORE 0>

;<GLOBAL BASE-SCORE 0>

<GLOBAL HERE <>>

<OBJECT GLOBAL-OBJECTS
	(SYNONYM ZZMGCK) ;"No, this synonym doesn't need to exist... sigh"
	(DESC "it")
	(FLAGS INVISIBLE TOUCHBIT SURFACEBIT TRYTAKEBIT OPENBIT SEARCHBIT
	       TRANSBIT MUNGBIT ONBIT RLANDBIT WORNBIT LIGHTBIT LOCKEDBIT
	       VEHBIT CONTBIT VOWELBIT NDESCBIT DOORBIT PARTBIT
	       ACTORBIT FEMALEBIT FREEBIT1 FREEBIT2 FREEBIT3 FREEBIT4)>

<BIT-SYNONYM MUNGBIT RMUNGBIT>
<BIT-SYNONYM FREEBIT1 WEAPONBIT>
<BIT-SYNONYM FREEBIT2 NOALL CLIMBBIT>
<BIT-SYNONYM FREEBIT3 SCOREDBIT CHILLY>
<BIT-SYNONYM FREEBIT4 SMELLEDBIT STAGGERED SEEN WESTBIT ;"FOR WIND"
			NOTTALKEDTOBIT>

<ROUTINE WEARABLE? (OBJ)
	 <COND (<EQUAL? .OBJ ,WRISTWATCH>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE INDOORS? ()
	 <COND (;<OR <AND <EQUAL? ,GAME-FLAG 2>
			 <NOT <EQUAL? ,HERE ,ROOF>>>>
		<EQUAL? ,HERE ,LIVING-ROOM ,ATTIC ,KITCHEN
				  ,TROLL-ROOM ,STUDIO ,GALLERY
				  ,EAST-OF-CHASM ,CELLAR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

;<ROUTINE LIGHT-SOURCE? (OBJ)     ;"FORMERLY LIGHTBIT"
	 <COND (<EQUAL? .OBJ ,FLASHLIGHT ,LAMP>
		<RTRUE>)
	       (T
		<RFALSE>)>>

;<ROUTINE DOOR? (OBJ)    ;"SIGH. NECESSARY TO REMOVE DOORBIT."
	 <COND (<OR <EQUAL? .OBJ ,NARROW-CELL-DOOR ,WIDE-CELL-DOOR 
				,EXAM-ROOM-DOOR>
		    
		    <EQUAL? .OBJ ,KITCHEN-WINDOW ,FRONT-DOOR ,GRATE>
		    <EQUAL? .OBJ ,WOODEN-DOOR ,TRAP-DOOR>

		    <EQUAL? .OBJ ,LWDOOR>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<OBJECT LOCAL-GLOBALS
	(IN GLOBAL-OBJECTS)
	(SDESC "it")
	(LDESC "it")
	(FDESC "it")
	(DESC "it")
	(SYNONYM ZZMGCK) ;"Yes, this synonym needs to exist... sigh"
	(ADJECTIVE ZZMGCK)
	(NORTH TO LOCAL-GLOBALS)
	(SOUTH TO LOCAL-GLOBALS)
	(EAST TO LOCAL-GLOBALS)
	(WEST TO LOCAL-GLOBALS)
	(NE TO LOCAL-GLOBALS)
	(NW TO LOCAL-GLOBALS)
	(SE TO LOCAL-GLOBALS)
	(SW TO LOCAL-GLOBALS)
	(UP TO LOCAL-GLOBALS)
	(DOWN TO LOCAL-GLOBALS)
	(IN TO LOCAL-GLOBALS)
	(OUT TO LOCAL-GLOBALS)
	;(ODOR 0)
	(VALUE 0)
	(TVALUE 0)
	(GENERIC 0)
	(DESCFCN 0)
        (GLOBAL GLOBAL-OBJECTS)
	;(FDESC "F")
	;(LDESC "F")
	(SIZE 0)
	(FLAGS NDESCBIT)
	(TEXT "")
	(CAPACITY 0)
	(THINGS <PSEUDO (ZZMGCK ZZMGCK ME-F)>)>

<OBJECT ROOMS
	(IN GLOBAL-OBJECTS)
	(IN TO ROOMS)
	(DESC "it")>

<OBJECT INTDIR
	(IN GLOBAL-OBJECTS)
	(DESC "direction")
	(SYNONYM DIRECT INTDIR)
	(ADJECTIVE NORTH SOUTH EAST WEST NW NE SW SE)
	;(ACTION INTDIR-F)>

;<ROUTINE INTDIR-F ()
	 <COND (<AND <VERB? BOARD>
		     <EQUAL? ,P-PRSA-WORD ,W?RIDE>>
		<COND (<IN? ,PROTAGONIST ,STALLION>
		       <DO-WALK ,P-DIRECTION>)
		      (<IN? ,STALLION ,HERE>
		       <DO-FIRST "mount">)
		      (T
		       <TELL ,THERES-NOTHING "to ride!" CR>)>)>>

<OBJECT INTNUM
	(IN GLOBAL-OBJECTS)
	(DESC "number")
	(SYNONYM NUMBER)
	;(ADJECTIVE WIFE HUSBAND \#) ;"for things like WIFE # 375"
	;(ACTION INTNUM-F)>

;<ROUTINE INTNUM-F ()
	 <COND (<AND <ADJ-USED ,A?WIFE>
		     <OR <NOT <EQUAL? ,HERE ,INNER-HAREM>>
			 <NOT ,MALE>>
		     <NOT <PICKING-WIFE>>>
		<SETG P-WON <>>
		<TELL ,YOU-CANT-SEE-ANY "wife here!" CR>)
	       (<AND <ADJ-USED ,A?HUSBAND>
		     <OR <NOT <EQUAL? ,HERE ,INNER-HAREM>>
			 ,MALE>
		     <NOT <PICKING-WIFE>>>
		<SETG P-WON <>>
		<TELL ,YOU-CANT-SEE-ANY "husband here!" CR>)
	       (<VERB? ANSWER-KLUDGE>
		<PERFORM ,V?USE-QUOTES ,INTNUM>
		<RTRUE>)
	       (<AND <EQUAL? ,P-NUMBER ,CHOICE-NUMBER>
		     <IN? ,SULTANS-WIFE ,HERE>>
		<COND (<PRSO? ,INTNUM>
		       <PERFORM-PRSA ,SULTANS-WIFE ,PRSI>
		       <RTRUE>)
		      (T
		       <PERFORM-PRSA ,PRSO ,SULTANS-WIFE>
		       <RTRUE>)>)
	       (<OR <AND <VERB? ASK-NO-ONE-FOR PICK>
			 <IN? ,HAREM-GUARD ,HERE>>
		    <AND <VERB? ASK-FOR>
			 <PRSO? ,HAREM-GUARD>>>
		<PICK-WIFE ,INTNUM>)
	       (<AND <EQUAL? ,HERE ,VIZICOMM-BOOTH>
		     <VERB? SET>>
		<PERFORM-PRSA ,VIZICOMM>
		<RTRUE>)>>

;<ROUTINE PICKING-WIFE ()
	 <COND (<AND <VERB? ASK-NO-ONE-FOR PICK>
		     <IN? ,HAREM-GUARD ,HERE>>
		<RTRUE>)
	       (<AND <VERB? ASK-FOR>
		     <PRSO? ,HAREM-GUARD>>
		<RTRUE>)
	       (T
		<RFALSE>)>> 

<OBJECT PSEUDO-OBJECT
	(IN LOCAL-GLOBALS)
	(DESC "pseudo")	;"DESC must be 6 characters long! --pdl 3/4/86"
	(ACTION ME-F)>

<OBJECT IT
	(IN GLOBAL-OBJECTS)
	(SYNONYM IT THEM)
	(DESC "it")
	(FLAGS VOWELBIT NARTICLEBIT TOUCHBIT)>

<OBJECT HIM
	(IN GLOBAL-OBJECTS)
	(SYNONYM HIM HIMSELF)
	(DESC "him")
	(FLAGS NARTICLEBIT TOUCHBIT)>

<OBJECT HER
	(IN GLOBAL-OBJECTS)
	(SYNONYM HER HERSELF)
	(DESC "her")
	(FLAGS NARTICLEBIT TOUCHBIT)>

<OBJECT EACH-OTHER
	(IN GLOBAL-OBJECTS)
	(DESC "it")
	(SYNONYM OTHER ITSELF)
	(ADJECTIVE EACH)
	(ACTION EACH-OTHER-F)>

<ROUTINE EACH-OTHER-F ()
	 <COND (<PRSI? ,EACH-OTHER>
		<PERFORM-PRSA ,PRSO ,PRSO>
		<RTRUE>)
	       (<NOT <NOUN-USED ,PRSO ,W?ITSELF>>
		<SETG P-WON <>>
		<COND (<ADJ-USED ,PRSO ,W?EACH>
		       <CANT-USE ,A?EACH T>)
		      (T
		       <CANT-USE ,W?OTHER T>)>
		<RTRUE>)>>

<OBJECT MAN-WOMAN
	(IN GLOBAL-OBJECTS)
	(SDESC "")
	(SYNONYM MAN WOMAN)
	(ACTION MAN-WOMAN-F)>

<ROUTINE MAN-WOMAN-F ("AUX" PERSON)
	 <COND ;(<VERB? FOLLOW> ;"for YOUNG WOMAN"
		<COND (<EQUAL? ,FOLLOW-FLAG 4>
		       <TELL ,DONT-WANT-TO>)
		      (<EQUAL? ,FOLLOW-FLAG 5>
		       <DO-WALK ,P?NORTH>)
		      (<EQUAL? ,FOLLOW-FLAG 6>
		       <DO-WALK ,P?EAST>)
		      (T
		       <V-WALK-AROUND>)>)
	       (<AND <EQUAL? <GET ,P-NAMW 0> ,W?MAN> ;"MAN is the PRSO"
		     <PRSO? ,MAN-WOMAN> ;"in case PRSI is also MAN or WOMAN">
		<COND (<SET PERSON <FIND-MAN>>
		       <PERFORM-PRSA .PERSON ,PRSI>
		       <RTRUE>)
		      (T
		       <CANT-SEE ,MAN-WOMAN>)>)
	       (<AND <EQUAL? <GET ,P-NAMW 0> ,W?WOMAN> ;"WOMAN is the PRSO"
		     <PRSO? ,MAN-WOMAN> ;"in case PRSI is also MAN or WOMAN">
		<COND (<SET PERSON <FIND-WOMAN>>
		       <PERFORM-PRSA .PERSON ,PRSI>
		       <RTRUE>)
		      (T
		       <CANT-SEE ,MAN-WOMAN>)>)
	       (<AND <EQUAL? <GET ,P-NAMW 1> ,W?MAN> ;"MAN is the PRSI"
		     <PRSI? ,MAN-WOMAN> ;"in case PRSO is also MAN or WOMAN">
		<COND (<SET PERSON <FIND-MAN>>
		       <PERFORM-PRSA ,PRSO .PERSON>
		       <RTRUE>)
		      (T
		       <CANT-SEE ,MAN-WOMAN>)>)
	       (<AND <EQUAL? <GET ,P-NAMW 1> ,W?WOMAN> ;"WOMAN is the PRSI"
		     <PRSI? ,MAN-WOMAN> ;"in case PRSO is also MAN or WOMAN">
		<COND (<SET PERSON <FIND-WOMAN>>
		       <PERFORM-PRSA ,PRSO .PERSON>
		       <RTRUE>)
		      (T
		       <CANT-SEE ,MAN-WOMAN>)>)>>

<ROUTINE FIND-MAN ()
	 <PUTP ,MAN-WOMAN ,P?SDESC "man">
	 <COND ;(<IN? ,PROPRIETOR ,HERE>
		<RETURN ,PROPRIETOR>)
	       ;(<AND <VISIBLE? ,SIDEKICK>
		     ,MALE>
		<RETURN ,SIDEKICK>)
	       (T
		<RFALSE>)>>

<ROUTINE FIND-WOMAN ()
	 <PUTP ,MAN-WOMAN ,P?SDESC "woman">
	 <COND ;(<AND <VISIBLE? ,SIDEKICK>
		     <NOT ,MALE>>
		<RETURN ,SIDEKICK>)
	       (T
		<RFALSE>)>>


<OBJECT NOT-HERE-OBJECT
	(DESC "it")
	(FLAGS NARTICLEBIT)
	(ACTION NOT-HERE-OBJECT-F)>

<ROUTINE NOT-HERE-OBJECT-F ("AUX" TBL (PRSO? T) OBJ (X <>))
	 <COND (<AND <PRSO? ,NOT-HERE-OBJECT>
		     <PRSI? ,NOT-HERE-OBJECT>>
		<TELL "Those things aren't here!" CR>
		<RTRUE>)
	       ;(<AND <EQUAL? ,P-XNAM ,W?BODY>
		     <EQUAL? ,P-XADJN ,W?MY <>>>
		<COND (<PRSO? ,NOT-HERE-OBJECT>
		       <SETG PRSO ,ME>)
		      (T
		       <SETG PRSI ,ME>)>
		<RFALSE>)
	       ;(<AND <EQUAL? ,P-XNAM ,W?HAND ,W?HANDS>
		     <EQUAL? ,P-XADJN ,W?MITRE ,W?KING\'S>
		     <VERB? SHAKE TAKE>>
		<PERFORM ,V?SHAKE-WITH ,HANDS ,MITRE>
		<RTRUE>)
	       ;(<AND <OR <EQUAL? ,P-XNAM ,W?HANDS ,W?HAND ,W?PALM>
			 <EQUAL? ,P-XNAM ,W?FINGER ,W?EYE ,W?EYES>
			 <EQUAL? ,P-XNAM ,W?HEAD ,W?EARS ,W?EAR>
			 <EQUAL? ,P-XNAM ,W?LIP ,W?LIPS ,W?MOUTH>
			 <EQUAL? ,P-XNAM ,W?KNEECAP ,W?KNEE ,W?KNEES>
			 <EQUAL? ,P-XNAM ,W?NOSE ,W?NOSTRIL ,W?BALLS>
			 <EQUAL? ,P-XNAM ,W?PENIS ,W?COCK ,W?ASS>
			 <EQUAL? ,P-XNAM ,W?TITS ,W?BREAST ,W?BOSOM>
			 <EQUAL? ,P-XNAM ,W?CUNT ,W?VAGINA ,W?PUSSY>
			 <EQUAL? ,P-XNAM ,W?TIT ,W?BODY>>
		     <OR <EQUAL? ,P-XADJN ,W?TRENT ,W?TIFFAN ,W?TIFF\'S>
			 <EQUAL? ,P-XADJN ,W?GODDESSES ,W?SHAPE ,W?COUCHMATE>
			 <EQUAL? ,P-XADJN ,W?THORBAST ,W?ASSASSIN ,W?SALESMAN>
			 <EQUAL? ,P-XADJN ,W?SCIENTIST ,W?GORILLA ,W?MONKEY>
			 <EQUAL? ,P-XADJN ,W?KING\'S ,W?MITRE ,W?SULTAN>
			 <EQUAL? ,P-XADJN ,W?PROPRIETOR ,W?OWNER ,W?GUARD>
			 <EQUAL? ,P-XADJN ,W?PRINCE ,W?DAUGHTER ,W?THETA>
			 <EQUAL? ,P-XADJN ,W?BARTENDER ,W?WIFE\'S ,W?HUSBAND>
			 <EQUAL? ,P-XADJN ,W?ELYSIA ,W?ELYSIUM ,W?WOMAN>
			 <EQUAL? ,P-XADJN ,W?ROBOT ,W?BABY\'S>
			 <EQUAL? ,P-XADJN ,W?MAN\'S ,W?HIS ,W?HER>>>
		<TELL
"[Sorry. Given limited space, we can't handle everything. Therefore, you can
only refer to characters in the story, not individual body parts. For example,
you can KISS IRWIN but you can't KISS IRWIN'S ELBOW.]" CR>
		<RTRUE>)
	       (<PRSO? ,NOT-HERE-OBJECT>
		<SET TBL ,P-PRSO>)
	       (T
		<SET TBL ,P-PRSI>
		<SET PRSO? <>>)>
	 <COND (<AND .PRSO?
		     <PRSO-MOBY-VERB?>>
		<SET X T>)
	       (<AND <NOT .PRSO?>
		     <PRSI-MOBY-VERB?>>
		<SET X T>)>
	 <COND (.X ;"the verb is a moby-find verb"
		<COND (<SET OBJ <FIND-NOT-HERE .TBL .PRSO?>>
		       <COND (<NOT <EQUAL? .OBJ ,NOT-HERE-OBJECT>>
			      <RTRUE>)>)
		      (T
		       <RFALSE>)>
		<COND (<VERB? WALK-TO FOLLOW>
		       <V-WALK-AROUND>)
		      (T
		       <TELL "[" ,YOULL-HAVE-TO "be more specific.]" CR>)>)
	       (T
		<COND (<EQUAL? ,WINNER ,PROTAGONIST>
		       <TELL "You">)
		      (T
		       <TELL "Looking confused," T ,WINNER " says, \"I">)>
		<TELL " can't ">
		<COND (<EQUAL? ,P-XNAM ,W?SMELL>
		       <TELL "smell">)
		      (T
		       <TELL "see">)>
		<COND (<NOT <NAME? ,P-XNAM>>
		       <TELL " any">)> 
		<NOT-HERE-PRINT .PRSO?>
		<TELL " here!">
		<COND (<NOT <EQUAL? ,WINNER ,PROTAGONIST>>
		       <TELL "\"">)>
		<CRLF>)>
	 <STOP>>

<ROUTINE PRSO-MOBY-VERB? ()
	 <COND (<OR <EQUAL? ,PRSA ,V?WHAT ,V?WHERE>
		    <EQUAL? ,PRSA ,V?WAIT-FOR ,V?WALK-TO ,V?MAKE>
		    <EQUAL? ,PRSA ,V?BUY ,V?CALL ,V?SAY>
		    <EQUAL? ,PRSA ,V?FIND ,V?FOLLOW ,V?PHONE>
		    <EQUAL? ,PRSA ,V?USE-QUOTES ,V?ANSWER-KLUDGE>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE PRSI-MOBY-VERB? ()
	 <COND (<EQUAL? ,PRSA ,V?ASK-ABOUT ,V?ASK-FOR ,V?TELL-ABOUT>
		<RTRUE>)
	       (T
		<RFALSE>)>>

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
		      <THIS-IS-IT ,PRSO>)
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
		      <THIS-IS-IT ,PRSO>)
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
	        <BUFFER-PRINT <GET ,P-ITBL ,P-NC1> <GET ,P-ITBL ,P-NC1L> <>>)
               (T
	        <BUFFER-PRINT <GET ,P-ITBL ,P-NC2> <GET ,P-ITBL ,P-NC2L> <>>)>>

;<OBJECT LOVE ;"for MAKE LOVE TO someone"
	(IN GLOBAL-OBJECTS)
	(DESC "love")
	(SYNONYM LOVE)
	(FLAGS NARTICLEBIT)
	(ACTION LOVE-F)>

;<ROUTINE LOVE-F ("AUX" LOVER)
	 <COND (<VERB? MAKE>
	        <COND (<LGOP?>
		       <COND (<SET LOVER <FIND-IN ,HERE ,ACTORBIT "to">>
		       	      <PERFORM ,V?FUCK .LOVER>
		       	      <RTRUE>)
		      	     (T
		       	      <TELL "Alone? How odd." CR>)>)
		      (T
		       <RTRUE>)>)>>

<OBJECT GLOBAL-SLEEP
	(IN GLOBAL-OBJECTS)
	(DESC "sleep")
	(SYNONYM SLEEP NAP SNOOZE)
	(FLAGS NARTICLEBIT)
	(ACTION GLOBAL-SLEEP-F)>

<ROUTINE GLOBAL-SLEEP-F ()
	 <COND (<VERB? WALK-TO TAKE>
		<PERFORM ,V?SLEEP>
		<RTRUE>)
	       (<AND <VERB? PUT-TO>
		     <PRSI? ,GLOBAL-SLEEP>>
		<TELL "You're not a hypnotist." CR>)>>

<OBJECT GROUND
	(IN GLOBAL-OBJECTS)
	(SYNONYM FLOOR GROUND)
	(SDESC "ground")
	(ACTION GROUND-F)>

<ROUTINE GROUND-F ()
	 <COND ;(<EQUAL? ,HERE ,IN-SPACE>
		<CANT-SEE ,GROUND>
		<RTRUE>)
	       (<INDOORS?>
		<PUTP ,GROUND ,P?SDESC "floor">)
	       (T
		<PUTP ,GROUND ,P?SDESC "ground">)>
	 <COND (<VERB? EXAMINE>
		;<COND ;(<EQUAL? ,HERE ,SPAWNING-GROUND>
		       <TELL ,OOZY-WITH-SLIME CR>)
		      ;(<AND <GLOBAL-IN? ,HOLE ,HERE>
			    <NOT <HOLE-INVISIBLE>>>
		       <TELL "You notice" AR ,HOLE>)
		      ;(<EQUAL? ,HERE ,CELL>
		       <TELL "Soft. Cushiony." CR>)
		      ;(<EQUAL? ,HERE ,OTHER-CELL>
		       <TELL "Rock-hard." CR>)
		      ;(<AND <EQUAL? ,HERE ,HOLD>
		     	    <EQUAL? ,SIDEKICK-EXPLODED 1>>
		       <SPLATTERED-DESC>
		       <CRLF>)
		      ;(<IN-CATACOMBS>
		       <TELL ,CATACOMBS-WATER-DESC CR>)>)
	       ;(<AND <VERB? TOUCH>
		     <EQUAL? ,HERE ,CELL ,OTHER-CELL>>
		<PERFORM ,V?EXAMINE ,GROUND>
		<RTRUE>)
	       (<VERB? CLIMB-UP CLIMB-ON CLIMB BOARD>
		<WASTES>)
	       (<VERB? LOOK-UNDER>
		<IMPOSSIBLES>)
	       (<VERB? LEAVE>
		<DO-WALK ,P?UP>)
	       ;(<AND <VERB? LEAP STAND-ON>
		     <EQUAL? ,HERE ,ROOF>>
		<PERFORM ,V?LEAP ,ROOMS> ;"V-LEAP handles it"
		<RTRUE>)>>

;<OBJECT WALLS
	(IN GLOBAL-OBJECTS)
	(FLAGS NDESCBIT TOUCHBIT)
	(DESC "wall")
	(SYNONYM WALL WALLS)
	(ACTION WALLS-F)>

;<ROUTINE WALLS-F ()
	 <COND (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,HOLD>
		     <EQUAL? ,SIDEKICK-EXPLODED 1>>
		<SPLATTERED-DESC>
		<CRLF>)>>

<OBJECT CEILING
	(IN GLOBAL-OBJECTS)
	(FLAGS NDESCBIT TOUCHBIT)
	(DESC "ceiling")
	(SYNONYM CEILIN ROOF)
	(ADJECTIVE TOWERING)
	(ACTION CEILING-F)>

<ROUTINE CEILING-F ()
	 <COND (<NOT <INDOORS?>>
		<CANT-SEE ,CEILING>)
	       ;(<AND <VERB? ENTER>
		     <EQUAL? ,HERE ,CELL>
		     ,HOLE-OPEN>
		<DO-WALK ,P?UP>)
	       (<VERB? LOOK-UNDER>
		<PERFORM ,V?LOOK>
		<RTRUE>)>>

<OBJECT POCKET
	(IN GLOBAL-OBJECTS)
	(DESC "pocket")
	(FLAGS CONTBIT SEARCHBIT OPENBIT NDESCBIT)
	(SYNONYM POCKET)
	;(ADJECTIVE BACK)
	(CAPACITY 6)
	(ACTION POCKET-F)>

<ROUTINE POCKET-F ()
	 <COND (<NOT <EQUAL? ,GAME-FLAG 2 3>>
		<CANT-SEE-ANY ,POCKET>
		<RTRUE>) 
	       ;(<EQUAL? ,GAME-FLAG 2>
		        <COND (<VERB? LOOK-INSIDE EXAMINE>
			       <TELL "There's" A ,COMIC-BOOK " inside." CR>)
	       		      (<AND <VERB? PUT>
		     	       <PRSI? ,POCKET>>
			       <TELL "There's no room. ">
			       <PERFORM ,V?LOOK-INSIDE ,POCKET>
			       <RTRUE>)>)>>
<OBJECT ODOR
	(IN LOCAL-GLOBALS)
	(DESC "odor")
	(SYNONYM SMELL ODOR SCENT AROMA)
	(ADJECTIVE STRONG FAMILIAR FOUL HEADY PLEASANT)
	(FLAGS VOWELBIT)
	;(ACTION ODOR-F)>

;<ROUTINE ODOR-F ()
	 <COND ;(<AND <EQUAL? ,HERE ,IN-SPACE>
		     <NOT <IN? ,THORBAST ,HERE>>>
	        <TELL ,CANT-SMELL>)
	       (<AND <EQUAL? ,HERE ,MENS-ROOM ,LADIES-ROOM>
		     <RUNNING? ,I-URGE>>
		<TELL ,CANT-SMELL>)
	       ;(<AND <EQUAL? ,HERE ,PLAZA>
		     <L? ,PLAZA-COUNTER 9>>
		<TELL ,CANT-SMELL> ;"the Plaza odor comes after final prompt")
	       (<OR <VERB? SMELL>
		    <AND <VERB? EXAMINE>
			 <EQUAL? ,P-PRSA-WORD ,W?DESCRIBE>>>
		<COND (<EQUAL? ,HERE ,CLOSET ,MENS-ROOM ,LADIES-ROOM>
		       <COND (<FSET? ,HERE ,SMELLEDBIT>
			      <TELL "There is a strong odor of ">
			      <COND (<EQUAL? ,HERE ,CLOSET>
				     <TELL "mothballs">)
				    (T
				     <TELL "pizza">)>
			      <TELL " in the air." CR>)
			     (T
			      <FSET ,HERE ,SMELLEDBIT>
			      <SCRATCH-N-SNIFF>
			      <APPLY <GETP ,HERE ,P?ACTION> ,M-SMELL>
			      <CRLF>)>)
		      ;(<EQUAL? ,HERE ,INNER-HAREM>
		       <SETG HERE ,HAREM>
		       <PERFORM ,V?SMELL ,ODOR>
		       <SETG HERE ,INNER-HAREM>
		       <RTRUE>)
		      ;(<EQUAL? ,HERE ,GARDEN>
		       <NO-SCRATCH-N-SNIFF "fresh honeysuckle">)
		      (<ACCESSIBLE? ,CHOCOLATE>
		       <TELL "[the " D ,CHOCOLATE "]" CR>
		       <PERFORM ,V?SMELL ,CHOCOLATE>
		       <RTRUE>)
		      (T
		       <TELL ,CANT-SMELL>)>)>>

;<ROUTINE SCRATCH-N-SNIFF ()
	 <TELL 
"[At this point, if you were playing an actual copy of the game,
you'd be prompted to smell a spot on the scratch 'n' sniff card that
comes in each " ,LGOP-CAPS " package. Instead, please imagine that you
were sniffing the delicate aroma of ">
	 <COND (<PRSO? ,CHOCOLATE>
		<TELL "chocolate">)
	       (<EQUAL? ,HERE ,CLOSET>
		<TELL "old mothballs">)
	       (T
		<TELL "stale pepperoni pizza">)>
	 <TELL ", and h" ,HIT-RETURN "continue...]">
	 <READ ,P-INBUF ,P-LEXV>
	 <CRLF>>

<OBJECT WATER
	(IN LOCAL-GLOBALS)
	(DESC "water")
	(SYNONYM WATER FOUNTAIN POOL OASIS)
	(ADJECTIVE FRESH)
	(FLAGS NDESCBIT DRINKBIT)
	(GENERIC GENERIC-WATER-F)
	(ACTION WATER-F)>

<ROUTINE WATER-F ()
	 <COND ;(<AND <EQUAL? ,HERE ,MINARET ,DUNETOP>
		     <TOUCHING? ,WATER>>
		<CANT-REACH ,WATER>)
	       (<VERB? DRINK BUY>
		<COND (<EQUAL? ,GAME-FLAG 1>
		       <TELL
CT ,WATER " is cool and refreshing." CR>)
		      (T
		       <TELL "You're not thirsty." CR>)>)
     	      ;(<VERB? LOOK-INSIDE LOOK-UNDER EXAMINE>
		<TELL CT ,WATER " is dark and murky." CR>)
	       ;(<VERB? PASS MAKE>
		<V-PEE>)
	       (<VERB? REACH-IN>
		<TELL "Your hand is now wet." CR>)
	       (<AND <VERB? PUT-ON>
		     <PRSI? ,WATER>>
		<PERFORM ,V?PUT ,PRSO ,WATER>
		<RTRUE>)
	       ;(<GLOBAL-IN? ,CANAL-OBJECT ,HERE>
		<COND (<PRSO? ,WATER>
		       <PERFORM-PRSA ,CANAL-OBJECT ,PRSI>
		       <RTRUE>)
		      (T
		       <PERFORM-PRSA ,PRSO ,CANAL-OBJECT>
		       <RTRUE>)>)
	       ;(<AND <VERB? PUT>
		     <PRSI? ,WATER>>
		;<COND (<AND <PRSO? ,RAFT>
			    <EQUAL? ,HERE ,OASIS>>
		       <TELL "Next you'll be putting yachts in bathtubs!" CR>)
		      (<AND <PRSO? ,RAFT>
			    <IN-CATACOMBS>>
		       <PERFORM ,V?DROP ,RAFT>
		       <RTRUE>)
		      (T
		       <WASTES>)>)
	       ;(<AND <VERB? ON WALK> ;"for TURN ON WATER or RUN WATER"
		     <EQUAL? ,HERE ,MENS-ROOM ,LADIES-ROOM>>
		<PERFORM ,V?FLUSH ,TOILET>
		<RTRUE>)
	       (<VERB? BOARD ENTER CRAWL-UNDER>
		<V-SWIM>)>>

;<OBJECT SKY
	(IN GLOBAL-OBJECTS)
	(DESC "sky")
	(SYNONYM SKY)
	(ACTION SKY-F)>

;<ROUTINE SKY-F ()
	 <COND (<INDOORS?>
		<CANT-SEE ,SKY>)>>

<OBJECT HANDS
	(IN GLOBAL-OBJECTS)
	(SYNONYM HANDS HAND PALM FINGER)
	(ADJECTIVE BARE MY YOUR)
	(DESC "your hand")
	(FLAGS NDESCBIT TOUCHBIT NARTICLEBIT PARTBIT)
	(ACTION HANDS-F)>

<ROUTINE HANDS-F ("AUX" ACTOR)
	 <COND (<VERB? APPLAUD>
		<SETG PRSO <>>
		<V-APPLAUD>)  
	       (<VERB? SHAKE>
		<COND ;(<EQUAL? ,HERE ,THRONE-ROOM>
		       <PERFORM ,V?SHAKE-WITH ,HANDS ,MITRE>
		       <RTRUE>)
		      (<SET ACTOR <FIND-IN ,HERE ,ACTORBIT "with">>
		       <PERFORM ,V?SHAKE-WITH ,HANDS .ACTOR>
		       <RTRUE>)
		      (T
		       <TELL "Pleased to meet you." CR>)>)
	       (<VERB? COUNT>
		<COND (<NOUN-USED ,HANDS ,W?FINGER>
		       <TELL "Ten">)
		      (T
		       <TELL "Two">)>
		<TELL ", as usual." CR>)
	       (<VERB? CLEAN>
		<TELL "Done." CR>)
	       (<AND <VERB? TAKE-WITH>
		     <PRSI? ,HANDS>>
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)
	       ;(<AND <VERB? PUT-ON>
		     <PRSI? ,EYES>>
		<PERFORM ,V?SPUT-ON ,EYES ,HANDS>
		<RTRUE>)
	       ;(<AND <VERB? PUT-ON PUT>
		     <PRSI? ,EARS>>
		<PERFORM ,V?SPUT-ON ,EARS ,HANDS>
		<RTRUE>)
	       ;(<AND <VERB? SPUT-ON>
		     <PRSO? ,EYES ,EARS, NOSE>>
	        <COND ;(,GONE-APE
		       <TELL ,DEXTERITY>)
		      (<NOT <EQUAL? ,GAME-FLAG 2>>
		       <WASTES>)
		      (<G? <ITEMS-CARRIED> 0>
		       <TELL ,YOU-CANT "do that with " 'HANDS "s full!" CR>)
		      ;(T
		       <COND (,HAND-COVER
		       	      <TELL ,YOURE-ALREADY>)
			     (T
		       	      <SETG HAND-COVER ,PRSO>
		       	      <FSET ,PRSO ,MUNGBIT>
			      <COND (<EQUAL? ,HAND-COVER ,EARS>
				     <TELL 
"Many sounds seem muffled now that you're ">)
				    (T
		       	      	     <TELL "Okay, you're now ">)>)>
		       <TELL
"covering " D ,HAND-COVER " with " 'HANDS "s." CR>)>)>>

;<ROUTINE ITEMS-CARRIED ("AUX" X (CNT 0))
	 <SET X <FIRST? ,PROTAGONIST>>
	 <REPEAT ()
		 <COND (<NOT .X>
			<RETURN>)
		       (<AND <NOT <FSET? .X ,WORNBIT>>
			     <NOT <EQUAL? .X ,COMIC-BOOK>>>
			<SET CNT <+ .CNT 1>>)>
		 <SET X <NEXT? .X>>>
	 <RETURN .CNT>>

;<GLOBAL HAND-COVER <>>

<OBJECT HEAD
	(IN GLOBAL-OBJECTS)
	(DESC "your head")
	(SYNONYM HEAD)
	(ADJECTIVE YOUR MY)
	(FLAGS NARTICLEBIT PARTBIT)
	;(ACTION HEAD-F)>

;<ROUTINE HEAD-F ()
	 <COND (<AND <VERB? PUT-ON>
		     <PRSO? ,BLANKET>>
		<SETG AWAITING-REPLY 2>
		<QUEUE I-REPLY 2>
		<TELL "Where do you think you are, Traal?" CR>)>>

;<OBJECT EYES
	(IN GLOBAL-OBJECTS)
	(DESC "your eyes")
	(SYNONYM EYE EYES)
	(ADJECTIVE YOUR MY)
	(FLAGS NARTICLEBIT PLURALBIT PARTBIT)
	(ACTION EYES-F)>

;<ROUTINE EYES-F ()
	 <COND (<VERB? CLOSE>
		<COND (<NOT <EQUAL? ,GAME-FLAG 2>>
		       <WASTES>)
		      (<FSET? ,EYES ,MUNGBIT>
		       <COND (<EQUAL? ,EYES ,HAND-COVER>
			      <TELL ,HANDS-OVER-EYES>)
			     (T
			      <TELL 
"You already did that. Senility strikes again!" CR>)>)
		      (T
		       <FSET ,EYES ,MUNGBIT>
		       <EYES-ARE-NOW "closed">)>)
	       (<VERB? OPEN>
		<COND (<FSET? ,EYES ,MUNGBIT>
		       <COND (<EQUAL? ,EYES ,HAND-COVER>
			      <TELL ,HANDS-OVER-EYES>)
			     (T
			      <SENSE-AGAIN ,EYES>)>)
		      (T
		       <TELL "They are open!" CR>)>)>>

;<ROUTINE EYES-ARE-NOW (STRING)
	  <TELL "Your eyes are now " .STRING ,PERIOD-CR>>

;<ROUTINE OPEN-EYES-AND-REMOVE-HANDS ()
	 <FCLEAR ,EYES ,MUNGBIT>
	 <COND (,HAND-COVER
		<FCLEAR ,HAND-COVER ,MUNGBIT>
		<SETG HAND-COVER <>>)>>

;<OBJECT EARS
	(IN GLOBAL-OBJECTS)
	(DESC "your ears")
	(SYNONYM EAR EARS)
	(ADJECTIVE YOUR MY)
	(FLAGS NARTICLEBIT PLURALBIT PARTBIT)
	(ACTION EARS-F)>

;<ROUTINE EARS-F ()
	 <COND (<AND <VERB? TAKE>
		     <EQUAL? ,P-PRSA-WORD ,W?HOLD>>
		<PERFORM ,V?SPUT-ON ,EARS ,HANDS>
		<RTRUE>)
	       ;(<AND <VERB? UNCOVER>
		     <FSET? ,COTTON-BALLS ,WORNBIT>
		     <NOT ,GONE-APE>>
		<COND (<EQUAL? ,EARS ,HAND-COVER>
		       <SETG HAND-COVER <>>)>
		<PERFORM ,V?REMOVE ,COTTON-BALLS>
		<RTRUE>)>>

;<OBJECT NOSE
	(IN GLOBAL-OBJECTS)
	(DESC "your nose")
	(SYNONYM NOSE NOSTRIL)
	(ADJECTIVE YOUR MY)
	(FLAGS NARTICLEBIT PARTBIT)
	(ACTION NOSE-F)>

;<ROUTINE NOSE-F ()
	 <COND (<VERB? BLOW PICK>
		<TELL ,YECHH>)
	       (<AND <VERB? TAKE>
		     <EQUAL? ,P-PRSA-WORD ,W?HOLD>>
		<PERFORM ,V?SPUT-ON ,NOSE ,HANDS>
		<RTRUE>)
	       ;(<AND <VERB? UNCOVER>
		     <FSET? ,CLOTHES-PIN ,WORNBIT>
		     <NOT ,GONE-APE>>
		<COND (<EQUAL? ,NOSE ,HAND-COVER>
		       <SETG HAND-COVER <>>)>
		<PERFORM ,V?REMOVE ,CLOTHES-PIN>
		<RTRUE>)>>

;<OBJECT MOUTH
	(IN GLOBAL-OBJECTS)
	(DESC "your mouth")
	(SYNONYM MOUTH LIP LIPS)
	(ADJECTIVE YOUR MY)
	(FLAGS NARTICLEBIT PARTBIT)
	(ACTION MOUTH-F)>

;<ROUTINE MOUTH-F ()
	 <COND ;(<AND <VERB? CLEAN>
		     <FSET? ,LIP-BALM ,WORNBIT>>
		<PERFORM ,V?REMOVE ,LIP-BALM>
		<RTRUE>)
	       ;(<AND <VERB? EXAMINE>
		     <FSET? ,LIP-BALM ,WORNBIT>>
		<ROB ,PROTAGONIST ,TOILET>
		<MOVE ,LIP-BALM ,PROTAGONIST>
		<V-INVENTORY> ;"should say YOU HAVE LIP BALM (SMEARED...)"
		<ROB ,TOILET ,PROTAGONIST>)
	       ;(<AND <VERB? PUT>
		     <PRSI? ,MOUTH>>
		<PERFORM ,V?EAT ,PRSO>
		<RTRUE>)
	       (<VERB? OPEN>
		<TELL "This fails to catch any flies." CR>)>>

;<OBJECT KNEECAPS
	(IN GLOBAL-OBJECTS)
	(DESC "your kneecaps")
	(SYNONYM KNEECAP KNEE KNEES)
	(ADJECTIVE YOUR MY)
	(FLAGS NARTICLEBIT PLURALBIT PARTBIT)>

;<OBJECT COCK
	(IN GLOBAL-OBJECTS)
	(DESC "your naughty bits")
	(SYNONYM COCK PENIS BALLS ASS)
	(ADJECTIVE YOUR MY)
	(FLAGS NARTICLEBIT PARTBIT)
	(ACTION NAUGHTY-BITS-F)>

;<OBJECT CUNT
	(IN GLOBAL-OBJECTS)
	(DESC "your naughty bits")
	(SYNONYM CUNT VAGINA PUSSY)
	(ADJECTIVE YOUR MY)
	(FLAGS NARTICLEBIT PARTBIT)
	(ACTION NAUGHTY-BITS-F)>

;<OBJECT TITS
	(IN GLOBAL-OBJECTS)
	(DESC "your naughty bits")
	(SYNONYM TIT TITS BREAST BOSOM)
	(ADJECTIVE YOUR MY)
	(FLAGS NARTICLEBIT PLURALBIT PARTBIT)
	(ACTION NAUGHTY-BITS-F)>

;<ROUTINE NAUGHTY-BITS-F ()
	 <COND (<AND <NOUN-USED ,CUNT ,W?PUSSY>
		     <NOT <ADJ-USED ,CUNT ,W?MY>>
		     <VISIBLE? ,PAINTING>>
		<COND (<PRSO? ,CUNT>
		       <PERFORM-PRSA ,PAINTING ,PRSI>
		       <RTRUE>)
		      (T
		       <PERFORM-PRSA ,PRSI ,PAINTING>
		       <RTRUE>)>)
	       (T
	 	<TELL
"You don't need to refer to " 'COCK " to complete the "
 ,LGOP-CAPS " segment" ,PERIOD-CR>)>>

<OBJECT PROTAGONIST
	(IN WELCOME-MAT)
	(SYNONYM PROTAG)
	(DESC "it")
	(FLAGS NDESCBIT INVISIBLE ACTORBIT)
	(STRENGTH 0)
	(ACTION PROTAGONIST-F)>

<OBJECT ME
	(IN GLOBAL-OBJECTS)
	(SYNONYM I ME MYSELF SELF)
	(DESC "yourself")
	(FLAGS ;ACTORBIT TOUCHBIT NARTICLEBIT)
	(ACTION ME-F)>

<ROUTINE ME-F () 
	 <COND (<VERB? TELL>
		<TELL
"Talking to " D ,ME " is a sign of impending mental collapse." CR>
		<STOP>)
	       ;(<VERB? RELIEVE>
		<V-PEE>)
	       ;(<AND <VERB? PUT>
		     <PRSI? ,ME>
		     <NOT ,MALE>
		     <NOT <EQUAL? ,NAUGHTY-LEVEL 0>>>
		<PERFORM ,V?FUCK ,ME>
		<RTRUE>)
	       ;(<AND <VERB? TOUCH FUCK EAT>
		     <NOT <EQUAL? ,NAUGHTY-LEVEL 0>>>
		<TELL
"Encouraging such behavior would endanger the possibility of landing
a lucrative Hollywood contract to make a film of " ,LGOP-CAPS ,PERIOD-CR>)
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
	       (<VERB? EXAMINE>
		<TELL "You see nothing special about " D ,ME ,PERIOD-CR>)
	       (<VERB? KILL MUNG>
		<JIGS-UP "Done.">)
	       (<VERB? FIND WHERE>
		<TELL "You're in" TR ,HERE>)
	       (<VERB? MEASURE>
		<TELL "You don't measure up." CR>)
	       ;(<AND <VERB? UNTIE>
		     ,BODY-TIED-TO-SLAB>
		<COND (,GONE-APE
		       <PERFORM-PRSA ,YOUR-BODY>
		       <RTRUE>)
		      (T
		       <YUKS>)>)
	       ;(<AND <VERB? TIE>
		     <PRSI? ,FIRST-SLAB ,SECOND-SLAB>>
		<COND (<AND ,BODY-TIED-TO-SLAB
			    <NOT ,GONE-APE>>
		       <TELL "You are!" CR>)
		      (T
		       <TELL ,YOU-CANT "tie " D ,ME " down!" CR>)>)
	       (<VERB? FOLLOW>
		<TELL "Like most computers, I don't have legs." CR>)>>

<OBJECT GLOBAL-ROOM
	(IN GLOBAL-OBJECTS)
	(DESC "room")
	(SYNONYM ROOM PLACE LOCATI AREA)
	(ACTION GLOBAL-ROOM-F)>

<ROUTINE GLOBAL-ROOM-F ()
	 <COND (<VERB? LOOK LOOK-INSIDE EXAMINE>
		<V-LOOK>)
	       (<VERB? ENTER WALK-TO>
		<V-WALK-AROUND>)
	       (<VERB? LEAVE EXIT DISEMBARK>
		<DO-WALK ,P?OUT>)
	       (<VERB? SEARCH>
		<TELL ,NOTHING-NEW>)
	       ;(<VERB? WALK-AROUND>
                <TELL "Walking around here">
		<HO-HUM>
		<TELL " To move elsewhere, type the desired direction." CR>)
	       (<AND <VERB? PUT>
		     <PRSI? ,GLOBAL-ROOM>>
		<COND (<EQUAL? ,P-PRSA-WORD ,W?THROW>
		       <PERFORM ,V?THROW ,PRSO>
		       <RTRUE>)
		      (T
		       <PERFORM ,V?DROP ,PRSO>
		       <RTRUE>)>)>>

;<OBJECT HOUSE
	(IN LOCAL-GLOBALS)
	(DESC "house")
	(SYNONYM HOUSE HOME)
	(ADJECTIVE SMALL RICKETY MAD SCIENTIST PLASTIC)
	(ACTION HOUSE-F)>

;<ROUTINE HOUSE-F ()
	 <COND (<VERB? ENTER WALK-TO BOARD>
		<COND (<OR <EQUAL? ,HERE ,BEDROOM ,TEENSY-WEENSY-HOUSE>
			   <EQUAL? ,HERE ,LABORATORY ,LOOKS-CAN-BE-DECEIVING>>
		       <TELL ,LOOK-AROUND>)
		      (<EQUAL? ,HERE ,FRONT-DOOR>
		       <DO-WALK ,P?NORTH>)
		      (<EQUAL? ,HERE ,BACK-DOOR>
		       <DO-WALK ,P?SOUTH>)
		      (<EQUAL? ,HERE ,CLEVELAND>
		       <DO-WALK ,P?NE>)
		      (<EQUAL? ,HERE ,BEDROOM ,GARDEN>
		       <DO-WALK ,P?WEST>)>)
	       (<VERB? EXIT LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,LABORATORY ,BEDROOM>
		       <TELL ,CANT-FROM-HERE>)
		      (<EQUAL? ,HERE ,TEENSY-WEENSY-HOUSE ,LABORATORY>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND>)>)
	       (<VERB? LOOK-INSIDE>
		<COND (<EQUAL? ,HERE ,FRONT-DOOR ,BACK-DOOR ,GARDEN>
		       <TELL ,CANT-FROM-HERE>)
		      (T
		       <V-LOOK>)>)
	       (<VERB? SEARCH>
		<TELL ,NOTHING-NEW>)>>

<OBJECT SIGN
	(IN LOCAL-GLOBALS)
	(DESC "sign")
	(SYNONYM SIGN SIGNPOST POST)
	(ADJECTIVE LARGE SIGN ROAD)
	(FLAGS READBIT)
	(ACTION SIGN-F)>

<ROUTINE SIGN-F ("AUX" NUM)
	 <COND (<VERB? READ>
		<COND (<EQUAL? ,HERE ,HILLTOP>
		       <TELL
"There are two arrows on the signpost. The arrow pointing west says \"To Cemetery.\" The east arrow is marked \"To Festeron.\"" CR>)
 		      ;(<EQUAL? ,HERE ,END-OF-HALLWAY>
		       <TELL "\"Up To Observation Room.\"" CR>)
		      ;(<EQUAL? ,HERE ,OBSERVATION-ROOM>
		       <TELL "\"Down to Cells.\"" CR>)>)>>

<OBJECT STAIRS
	(IN LOCAL-GLOBALS)
	(DESC "stair")
	(SYNONYM STAIR STAIRS STAIRW STEP)
	(ADJECTIVE WINDING)
	(ACTION STAIRS-F)>

<ROUTINE STAIRS-F ()
	 <COND (<VERB? CLIMB CLIMB-UP>
		<DO-WALK ,P?UP>)
	       ;(<VERB? CLIMB-DOWN>
		<COND (<EQUAL? ,HERE ,BEDROOM>
		       <COND (<NOT <BEDROOM-EXIT-F T>>
			      <RTRUE>)>
		       <GOTO ,TEENSY-WEENSY-HOUSE>)
		      (T
		       <DO-WALK ,P?DOWN>)>)
	       (<AND <VERB? THROW>
		     <PRSI? ,STAIRS>>
		<WASTES>)>>

<OBJECT WINDOW
	(IN LOCAL-GLOBALS)
	(DESC "window")
	(SYNONYM WINDOW VIEWPORT GLASS)
	(ADJECTIVE RECTAN STAINED GLASS BARRED SMALL GRIMY)
	;(ACTION WINDOW-F)>

;<ROUTINE WINDOW-F ()
	 <COND ;(<VERB? LOOK-INSIDE>
		<COND (<EQUAL? ,HERE ,OBSERVATION-ROOM>
		       <SETG SEEN-EXAMINATION-ROOM T>
		       <TELL ,YOU-SEE " a large room below. ">
		       <EXAMINATION-ROOM-DESC T>)
		      (<EQUAL? ,HERE ,JOES-BAR>
		       <TELL
"It's raw and blowy outside. Little whirlpools of dust dance by." CR>)>)
	       ;(<VERB? OPEN>
		<TELL "It's not that kind of window." CR>)
	       ;(<VERB? CLOSE>
		<TELL ,ALREADY-IS>)
	       ;(<VERB? ENTER EXIT DISEMBARK LEAP-OFF>
		<COND (<EQUAL? ,HERE ,OBSERVATION-ROOM>
		       <DO-WALK ,P?WEST>)
		      (T
	               <DO-FIRST "open" ,WINDOW>)>)>>

;<OBJECT TREE
	(IN LOCAL-GLOBALS)
	(DESC "tree")
	(SYNONYM TREE TREES)
	(ACTION TREE-F)>

;<ROUTINE TREE-F ()
	 <COND (<VERB? CLIMB CLIMB-UP>
		<TELL "The trees are all unclimbable." CR>)>>

<ROUTINE TOUCHING? (THING)
	 <COND (<AND <PRSO? .THING>
		     <OR <EQUAL? ,PRSA ,V?TAKE ,V?TOUCH ,V?SHAKE>
			 <EQUAL? ,PRSA ,V?CLEAN ,V?KISS ,V?SWIM>
			 <EQUAL? ,PRSA ,V?PUSH ,V?CLOSE ,V?LOOK-UNDER>
			 <EQUAL? ,PRSA ,V?MOVE ,V?OPEN ,V?KNOCK>
			 <EQUAL? ,PRSA ,V?SET ,V?SHAKE ,V?RAISE>
			 <EQUAL? ,PRSA ,V?UNLOCK ,V?LOCK ,V?CLIMB-UP>
			 <EQUAL? ,PRSA ,V?CLIMB ,V?CLIMB-DOWN ,V?CLIMB-ON>
			 <EQUAL? ,PRSA ,V?BOARD ,V?ENTER ,V?ON>
			 <EQUAL? ,PRSA ,V?OFF ,V?SET ,V?THROW>
			 <EQUAL? ,PRSA ,V?TASTE ,V?RAPE>
			 <EQUAL? ,PRSA ,V?LOOK-INSIDE ,V?STAND-ON ,V?TIE>
			 <EQUAL? ,PRSA ,V?MUNG ,V?KICK ,V?KILL>
			 <EQUAL? ,PRSA ,V?KNOCK ,V?CUT>
			 <EQUAL? ,PRSA ,V?BITE ,V?PUSH>>>
		<RTRUE>)
	       (<AND <PRSI? .THING>
		     <VERB? GIVE PUT PUT-ON>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

;<ROUTINE IN-CATACOMBS ()
	 <COND (<EQUAL? ,HERE ,CATACOMBS ,WELL-BOTTOM ,LADDER-ROOM>
		<RTRUE>)
	       (<EQUAL? ,HERE ,BURIAL-CHAMBER ,FORGOTTEN-STOREHOUSE>
		<RTRUE>)
	       (T
		<RFALSE>)>>

;<ROUTINE IN-SPACE? ()
	 <COND (<OR <EQUAL? ,HERE ,HOLD ,STABLE ,AT-MAIN-HATCH>
		    <EQUAL? ,HERE ,LONG-CORRIDOR ,IN-SPACE ,SPACE-YACHT>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE CANT-SEE ("OPTIONAL" (OBJ <>) (STRING <>))
	 <SETG P-WON <>>
	 <TELL ,YOU-CANT>
	 <COND (<EQUAL? .OBJ ,ODOR>
		<TELL "smell">)
	       (T
		<TELL "see">)>
	 <COND (<OR <NOT .OBJ>
		    <AND .OBJ
			 <NOT <NAME? .OBJ>>>>
		<TELL " any">)>
	 <COND (<NOT .OBJ>
		<TELL " " .STRING>)
	       (<EQUAL? .OBJ ,PRSI>
		<PRSI-PRINT>)
	       (T
		<PRSO-PRINT>)>
	 <TELL " here." CR>
	 <STOP>>

<ROUTINE CANT-VERB-A-PRSO (STRING)
	 <TELL ,YOU-CANT .STRING A ,PRSO "!" CR>>

;<ROUTINE OPEN-YOUR-EYES! ()
	 <COND (<FSET? ,EYES ,MUNGBIT>
		<DO-FIRST "open" ,EYES>)
	       (T
		<DO-FIRST "uncover" ,EYES>)>>

;<ROUTINE NOW-TIED (OBJ)
	 <TELL "Okay," T ,PRSO " is now tied to" TR .OBJ>>

<ROUTINE TELL-HIT-HEAD ()
	 <TELL
"You bang your bean against" T ,PRSO " as you attempt this." CR>>

<ROUTINE OFF-VEHICLE? (OBJ) ;"tells to print GET OFF versus GET OUT OF"
	 <COND ;(<EQUAL? .OBJ ,STOOL ,TOILET>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE OPEN-CLOSED (OBJ)
	 <COND (<FSET? .OBJ ,OPENBIT>
		<TELL "open">)
	       (T
		<TELL "closed">)>>

<ROUTINE WEE ()
	 <SETG AWAITING-REPLY 2>
	 <QUEUE I-REPLY 2>
	 <TELL "Wasn't that fun?" CR>>

;<ROUTINE IN-YOUR-PACKAGE (STRING)
	 <TELL "[This is the " .STRING " that comes in each "
<GET ,GAME-NAMES ,GAME-FLAG> " package, more than necessitating your
purchase of that product.]">>

;<ROUTINE IN-PACKAGE ()
	 <TELL " that came in your " ,LGOP-CAPS " package.">>

;<ROUTINE HIS-HER ("OPTIONAL" (CAP-H <>))
	 <COND (.CAP-H
		<TELL "H">)
	       (T
		<TELL "h">)>
	 <COND (,MALE
		<TELL "is">)
	       (T
		<TELL "er">)>>

;<ROUTINE HER-HIS ("OPTIONAL" (CAP-H <>))
	 <COND (.CAP-H
		<TELL "H">)
	       (T
		<TELL "h">)>
	 <COND (,MALE
		<TELL "er">)
	       (T
		<TELL "is">)>>

;<ROUTINE HIM-HER ()
	 <COND (,MALE
		<TELL "him">)
	       (T
		<TELL "her">)>>

;<ROUTINE HER-HIM ()
	 <COND (,MALE
		<TELL "her">)
	       (T
		<TELL "him">)>>

;<ROUTINE HE-SHE ("OPTIONAL" (CAP <>))
	 <COND (,MALE
		<COND (.CAP
		       <TELL "H">)
		      (T
		       <TELL "h">)>)
	       (T
		<COND (.CAP
		       <TELL "Sh">)
		      (T
		       <TELL "sh">)>)>
	 <TELL "e">>

;<ROUTINE SHE-HE ("OPTIONAL" (CAP <>))
	 <COND (,MALE
		<COND (.CAP
		       <TELL "Sh">)
		      (T
		       <TELL "sh">)>)
	       (T
		<COND (.CAP
		       <TELL "H">)
		      (T
		       <TELL "h">)>)>
	 <TELL "e">>

<ROUTINE CANT-REACH (OBJ)
	 <TELL ,YOU-CANT "reach" T .OBJ>
	 <COND (<NOT <IN? ,PROTAGONIST ,HERE>>
		<TELL " from" T <LOC ,PROTAGONIST>>)>
	 <TELL ,PERIOD-CR>
	 <COND (<AND <EQUAL? .OBJ ,BONE>
		     ,PRINT-CANT-REACH>
		<SETG FIRST-CANT-REACH <>>
		<TELL "|
(Unless your arms are six feet long, you're going to have to get into the
grave in order to get the bone. To enter the grave, you can type GET INTO
THE OPEN GRAVE or ENTER THE HOLE  or just DOWN.)" CR>)
	       (T
		<RTRUE>)>>

<ROUTINE PLAYER-CANT-SEE ()
	 <COND ;(<OR <FSET? ,EYES ,MUNGBIT>
		    <EQUAL? ,HAND-COVER ,EYES>>
		<OPEN-YOUR-EYES!>)
	       (<NOT ,LIT>
		<TELL ,TOO-DARK CR>)
	       (T
		<RFALSE>)>>

<ROUTINE DO-FIRST (STRING "OPTIONAL" (OBJ <>))
	 <TELL ,YOULL-HAVE-TO .STRING>
	 <COND (.OBJ
		<TPRINT .OBJ>)>
	 <TELL " first." CR>>

<ROUTINE NOT-IN ()
	 <TELL "But" T ,PRSO " isn't ">
	 <COND (<FSET? ,PRSI ,ACTORBIT>
		<TELL "being held by">)
	       (<FSET? ,PRSI ,SURFACEBIT>
		<TELL "on">)
	       (T
		<TELL "in">)>
	 <TELL TR ,PRSI>>

;<ROUTINE NO-LID ()
	 <TELL "The " D ,PRSO " has no lid." CR>>

<ROUTINE SORE (STRING)
	 <TELL "You begin to get a sore " .STRING ,PERIOD-CR>>

<ROUTINE CANT-USE-THAT-WAY (STRING)
	 <TELL "[" ,YOU-CANT "use " .STRING " that way.]" CR>>

<ROUTINE RECOGNIZE ()
	 <SETG P-WON <>>
	 <TELL "[That sentence isn't one I recognize.]" CR>>

;<ROUTINE EXPLETIVE ()
	 <TELL " \"Oh ">
	 <COND (<EQUAL? ,NAUGHTY-LEVEL 0>
		<TELL "shucks">)
	       (<EQUAL? ,NAUGHTY-LEVEL 1>
		<TELL "damn">)
	       (T
		<TELL "shit">)>
	 <TELL "! ">>

<ROUTINE PRONOUN ()
	 <COND (<PRSO? ,ME>
		<TELL "You">)
	       (<FSET? ,PRSO ,PLURALBIT>
		<TELL "They">)
	       (<AND <FSET? ,PRSO ,FEMALEBIT>
		     <FSET? ,PRSO ,ACTORBIT>>
		<TELL "She">)
	       (<FSET? ,PRSO ,ACTORBIT>
		<TELL "He">)
	       (T
		<TELL "It">)>>

<ROUTINE REFERRING ("OPTIONAL" (HIM-HER <>))
	 <TELL "I don't see wh">
	 <COND (.HIM-HER
		<TELL "o">)
	       (T
		<TELL "at">)>
	 <TELL " you're referring to." CR>>

<ROUTINE NO-ONE-HERE (STRING)
	 <TELL "There's no one here to " .STRING ,PERIOD-CR>>

;<ROUTINE UNIMPORTANT-THING-F ()
	 <TELL "That's not important; leave it alone." CR>>

<GLOBAL TOO-DARK "It's too dark to see a thing.">

<GLOBAL YNH "You're not holding">

<GLOBAL THERES-NOTHING "There's nothing ">

<GLOBAL YOU-SEE "You can see">

<GLOBAL IT-SEEMS-THAT "It seems that">

<GLOBAL YOU-CANT-SEE-ANY "You can't see any ">

<GLOBAL YOU-CANT "You can't ">

<GLOBAL YOULL-HAVE-TO "You'll have to ">

;<GLOBAL LGOP-CAPS "LEATHER GODDESSES OF PHOBOS">

;<GLOBAL STICK-IT-IN-POCKET " stick it back in your back pocket">

<GLOBAL HIT-RETURN "it the RETURN/ENTER key to ">

;<GLOBAL SIGN-AND-STAIRS
". A sign is posted next to the stairs which lead both upwards and downwards.">

;<GLOBAL ALREADY-IN-MODE "You are already in that mode.|">

<GLOBAL LOOK-AROUND "Look around you.|">

<GLOBAL CANT-FROM-HERE "You can't do that from here.|">

<GLOBAL CANT-GO "You can't go that way.|">

<GLOBAL HOLDING-IT "You're holding it!|">

;<GLOBAL CANT-SMELL "You can't smell any odor here.|">

<GLOBAL NOUN-MISSING "[There seems to be a noun missing in that sentence.]|">

;<GLOBAL ONLY-BLACKNESS "You see only blackness.|">

<GLOBAL PERIOD-CR ".|">

;<GLOBAL ELLIPSIS "...||">

;<GLOBAL HANDS-OVER-EYES
"That would accomplish nothing, since you're covering
your eyes with your hands.|">

<GLOBAL OK "Okay.|">

<GLOBAL HUH "Huh?|">

;<GLOBAL YECHH "Yechh.|">

<GLOBAL ALREADY-IS "It already is!|">

<GLOBAL NOTHING-NEW "This reveals nothing new.|">

;<GLOBAL LOOKS-UNAPPETIZING
" looks unappetizing, but smells deliciously familiar.|">

<GLOBAL NO-VERB "[There was no verb in that sentence!]|">

<GLOBAL YOURE-ALREADY "You're already ">

<GLOBAL TO-N " to the north">
<GLOBAL TO-S " to the south">
<GLOBAL TO-E " to the east">
<GLOBAL TO-W " to the west">

<GLOBAL SAMPLER "Sampler">
<GLOBAL TUTORIAL "Tutorial">
<GLOBAL TRINITY "Trinity">
;<GLOBAL ZORK "Zork I">
<GLOBAL EXCERPT " excerpt">