"VERBS for
		      SAMPLER II
	(c) Copyright 1987 Infocom, Inc.  All Rights Reserved."

;"subtitle game commands"

<GLOBAL VERBOSITY 1> ;"0 = super-brief, 1 = brief, 2 = verbose"

<ROUTINE V-VERBOSE ()
	 <SETG VERBOSITY 2>
	 <TELL "Maximum verbosity" ,PERIOD-CR CR>
	 <V-LOOK>>

<ROUTINE V-BRIEF ()
	 <SETG VERBOSITY 1>
	 <TELL "Brief descriptions" ,PERIOD-CR>>

<ROUTINE V-SUPER-BRIEF ()
	 <SETG VERBOSITY 0>
	 <TELL "Super-brief descriptions" ,PERIOD-CR>>

<GLOBAL NAUGHTY-LEVEL 0> ;"0 = tame, 1 = suggestive, 2 = lewd"

<GLOBAL AGE -1>

<ROUTINE V-TAME ()
	 <COND (<LGOP?>
		<COND (<EQUAL? ,NAUGHTY-LEVEL 0>
		       <TELL ,ALREADY-IN-MODE>)
	       	      (T
		       <SETG NAUGHTY-LEVEL 0>
	               <TELL "Tame descriptions. [Yawn.]" CR>)>)>
	 <RTRUE>>

<ROUTINE V-SUGGESTIVE ()
	 <COND (<LGOP?>
		<COND (<EQUAL? ,NAUGHTY-LEVEL 1>
		       <TELL ,ALREADY-IN-MODE>)
	       	      (T
		       <SETG NAUGHTY-LEVEL 1>
		       <TELL "Suggestive descriptions" ,PERIOD-CR>)>)>
	 <RTRUE>>

<ROUTINE V-LEWD ("AUX" (ACCEPTABLE-AGE <>))
	 <COND (<LGOP?>
		<COND (<EQUAL? ,NAUGHTY-LEVEL 2>
		       <TELL ,ALREADY-IN-MODE>
		       <RTRUE>)
	       	      (<G? ,AGE 17>
		       <SET ACCEPTABLE-AGE T>)
	       	      (T
	 	       <PUTB ,P-LEXV 0 10>
		       <TELL "What is your age? >">
	 	       <REPEAT ()
	 	 	        <READ ,P-INBUF ,P-LEXV>
		 		<CRLF>
		 		<COND (<EQUAL? <NUMBER? ,P-LEXSTART> 
						   ,W?NUMBER>
				       <COND (<L? ,P-NUMBER 18>
			       		      <SETG AGE ,P-NUMBER>
			       		      <COND (<L? ,P-NUMBER 5>
				      		     <TELL
"Precocious, aren't you! Unfortunately">)
				     		    (T
				      		     <TELL "Sorry">)>
			       <TELL
", you must be at least 18 to enter LEWD mode" ,PERIOD-CR>
			       <RETURN>)
			      (<G? ,P-NUMBER 120>
			       <TELL "Bullpuckies. Tell the truth. >">)
			      (<AND <G? ,AGE -1>
				    <L? ,AGE 19>>
			       <TELL
"Liar! You said before that you were " N ,AGE ,PERIOD-CR>
			       <RETURN>)
			      (T
			       <SETG AGE ,P-NUMBER>
			       <TELL "Acceptable age. ">
			       <SET ACCEPTABLE-AGE T>
			       <RETURN>)>)
			 (T
			  <TELL "Please tell me your age! >">)>>
		<PUTB ,P-LEXV 0 60>)>
	 <COND (.ACCEPTABLE-AGE
		<TELL "Switching to LEWD level" ,PERIOD-CR>
		<SETG NAUGHTY-LEVEL 2>)>)>
	 <RTRUE>>

<ROUTINE LGOP? ()
	 <SETG CLOCK-WAIT T>
	 <COND (<EQUAL? ,GAME-FLAG 2>
		<RTRUE>)
	       (T
		<TELL
"That's the sort of wacky, offbeat thing that would only work in the "
,LGOP-CAPS ,EXCERPT ,PERIOD-CR>
		<RFALSE>)>>

<ROUTINE NOT-IN-DEMO (STR)
	 <SETG CLOCK-WAIT T>
	 <TELL
"You could only use the " .STR " command if you were playing the real game."
CR>>

<ROUTINE V-SAVE ()
	 <NOT-IN-DEMO "SAVE">>

<ROUTINE V-RESTORE ()
	 <NOT-IN-DEMO "RESTORE">>

<ROUTINE LGOP-SCORE ()
	 <TELL "In " N ,MOVES " turn">
	 <COND (<NOT <EQUAL? ,MOVES 1>>
		<TELL "s">)>
	 <TELL
", you have achieved a score of, um, oh, call it " N ,SCORE " out of 15
points. This gives you the rank of Sandusky Stablehand" ,PERIOD-CR>>

<ROUTINE V-SCRIPT ()
	<NOT-IN-DEMO "SCRIPT">>

<ROUTINE V-UNSCRIPT ()
	<NOT-IN-DEMO "UNSCRIPT">>

<ROUTINE V-DIAGNOSE ()
	 <COND (<EQUAL? ,GAME-FLAG 1>
		<ZORK-DIAGNOSE>)
	       (<EQUAL? ,GAME-FLAG 2>
		<COND (<NOT <FSET? ,CELL ,TOUCHBIT>>
		       <TELL "You're pretty drunk">
		       <COND (<RUNNING? ,I-URGE>
		       	      <TELL ", and your bladder is about to burst">)>)
	       	      (<EQUAL? ,SUGAR-RUSH 1>
		       <TELL "You're experiencing a sugar rush">)
	       	      (T
         	       <TELL "You are in good health">)>
	 	<TELL ,PERIOD-CR>)
	       (<EQUAL? ,GAME-FLAG 3>
		<TELL
"You feel much as you'd expect, considering what you've been through" ,PERIOD-CR>)
	       (T
		<TRINITY?>
		<RTRUE>)>>

<ROUTINE V-INVENTORY ()
	 <MOVE ,POCKET ,GLOBAL-OBJECTS>
	 <COND (<FSET? ,WRISTWATCH ,WORNBIT>
		<FCLEAR ,WRISTWATCH ,WORNBIT>
		<MOVE ,WRISTWATCH ,THE-RIVER>)>    ;"TEMP PLACEHOLDER."
	 <COND (<NOT <FIRST? ,PROTAGONIST>>
		<COND (<EQUAL? ,GAME-FLAG 3>
		       <TELL "You're not holding anything">)
		      (T
		       <TELL "You are empty-handed.">)>)
	       (T
	       	<COND (<EQUAL? ,GAME-FLAG 1>
		       <SETG WINNER ,PROTAGONIST>
		       <PRINT-CONT ,WINNER>
		       <RTRUE>)> 
	        <DESCRIBE-CONTENTS ,PROTAGONIST <>>
	 	<COND (<AND <ULTIMATELY-IN? ,FLASHLIGHT>
			    <EQUAL? ,HERE ,JOES-BAR ,MENS-ROOM ,LADIES-ROOM>>
		       <TELL
" It's not clear why you've carried" A ,FLASHLIGHT " into " 'JOES-BAR ", except
that the lighting in the bathrooms isn't too reliable.">)>)>
	<COND (<IN? ,WRISTWATCH ,THE-RIVER>
	       <COND (<NOT <FIRST? ,PROTAGONIST>>
		      <TELL ", but y">)
		     (T
		      <TELL " Y">)>
	       <TELL "ou're wearing" A ,WRISTWATCH>)>
       <COND (<AND <EQUAL? ,GAME-FLAG 3> <FIRST? ,POCKET>>
	      <COND (<AND <FIRST? ,PROTAGONIST>
			  <NOT <IN? ,WRISTWATCH ,THE-RIVER>>>
		     <TELL " You also">)
		    (<AND <NOT <FIRST? ,PROTAGONIST>>
			  <IN? ,WRISTWATCH ,THE-RIVER>>
		     <TELL ". You also">)
		    (<AND <IN? ,WRISTWATCH ,THE-RIVER>
			  <FIRST? ,PROTAGONIST>>
		     <TELL ", and you">)
		    (T
		     <TELL ", but you">)>
	       <TELL " have">
	       <DESCRIBE-CONTENTS ,POCKET>
	       <TELL " in your pocket">)>
     	<COND (<EQUAL? ,GAME-FLAG 3>
	       <COND (<IN? ,WRISTWATCH ,THE-RIVER>
		      <MOVE ,WRISTWATCH ,PROTAGONIST>
		      <FSET ,WRISTWATCH ,WORNBIT>
	       	      <TELL ".">)
		     (<OR <FIRST? ,POCKET>
			  <NOT <FIRST? ,PROTAGONIST>>>
		      <TELL ".">)>
	       <MOVE ,POCKET ,PROTAGONIST>)>
        <CRLF>
        <RTRUE>>

<ROUTINE TELL-SCORE ()
	 <COND (<EQUAL? ,GAME-FLAG 1>
		<ZORK-SCORE>)
	       (<EQUAL? ,GAME-FLAG 2>
		<LGOP-SCORE>)
	       (<EQUAL? ,GAME-FLAG 3>
		<TRINITY-SCORE>)
	       (<EQUAL? ,GAME-FLAG 4>
		<WISHBRINGER-SCORE>)>>

<ROUTINE TRINITY-SCORE ()
	 <TELL "[Your score is " N ,SCORE " point">
	 <COND (<NOT <1? ,SCORE>>
	        <TELL "s">)>
	 <TELL " out of 15, in " N ,MOVES " move">
	 <COND (<NOT <EQUAL? ,MOVES 1>>
	        <TELL "s">)>
	 <TELL ". This gives you the rank of ">
	 <COND (<EQUAL? ,SCORE 15>
		<TELL "Explorer">)
	       (T
		<TELL "Tourist">)>
	 <TELL ".]" CR>>

<ROUTINE WISHBRINGER-SCORE ()
	 <TELL "[Your score is " N ,SCORE " point">
	 <COND (<NOT <1? ,SCORE>>
	        <TELL "s">)>
	 <TELL " out of 15, in " N ,MOVES " move">
	 <COND (<NOT <EQUAL? ,MOVES 1>>
	        <TELL "s">)>
	 <TELL ".]" CR>>

<ROUTINE V-NOTIFY ()
	 <COND (<TRINITY?>
		<COND (<EQUAL? ,NOTIFY? 0 1>
		       <SETG NOTIFY? 2>
		       <TELL "Score notification off" ,PERIOD-CR>)
		      (T
		       <SETG NOTIFY? 1>
	       	       <TELL "Score notification on" ,PERIOD-CR>)>)>>

<ROUTINE TRINITY? ()
	 <SETG CLOCK-WAIT T>
	 <COND (<NOT <EQUAL? ,GAME-FLAG 3>>
		<TELL
"That command won't work in this segment" ,PERIOD-CR>
		<RFALSE>)
	       (T
		<RTRUE>)>>

<ROUTINE V-QUIT ()
	 <TELL-SCORE>
	 <DO-YOU-WISH "leave the excerpt">
	 <COND (<YES?>
		<BACK-TO-MENU>)
	       (T
		<TELL CR ,OK>)>>

<ROUTINE BACK-TO-MENU ()
	 <TELL CR "Okay, returning to " D ,MENU-ROOM "..." CR>
	 <GET-CHOICE-AND-GO>
	 <SETG CLOCK-WAIT T>>

<ROUTINE RESTART-SEGMENT ()
	 <SETG CLOCK-WAIT T>
	 <TELL CR "Okay, restarting..." ,PERIOD-CR>
	 <COND (<EQUAL? ,GAME-FLAG 1>
		<GO-ZORK>)
	       (<EQUAL? ,GAME-FLAG 2>
		<GO-LGOP>)
	       (<EQUAL? ,GAME-FLAG 3>
		<GO-TRINITY>)
	       (<EQUAL? ,GAME-FLAG 4>
		<GO-TUTORIAL>)>>

<ROUTINE V-RESTART ()
	 <TELL-SCORE>
	 <DO-YOU-WISH "restart">
	 <COND (<YES?>
		<RESTART-SEGMENT>)
	       (T
		<TELL CR ,OK>)>>

<ROUTINE DO-YOU-WISH (STRING)
	 <TELL CR "Do you wish to " .STRING "? ">>

<ROUTINE YES? ("AUX" (YES T))
	 <REPEAT ()
		<TELL "(Please type YES or NO.) >">
		<READ ,P-INBUF ,P-LEXV>
		<COND (<YES-WORD <GET ,P-LEXV 1>>
		       <RETURN>)
	       	      (<OR <NO-WORD <GET ,P-LEXV 1>>
		    	   <EQUAL? <GET ,P-LEXV 1> ,W?N>>
		       <SET YES <>>
		       <RETURN>)>>
	 <COND (.YES 
		<RTRUE>)
	       (T
	        <RFALSE>)>>

<ROUTINE FINISH ("AUX" (CNT 0) QUIT?)
	 <CRLF>
	 <SETG CLOCK-WAIT T> ;"since you're not really RESTARTing" 
	 <TELL-SCORE>
	 <TELL CR
"If you'd like to play this" ,EXCERPT " again, type RESTART. Otherwise,
please type QUIT which will return you to " D ,MENU-ROOM "." CR>
	<REPEAT ()
	       <TELL "(Type RESTART or QUIT): >">
	       <PUTB ,P-LEXV 0 10>
	       <READ ,P-INBUF ,P-LEXV>
	       <PUTB ,P-LEXV 0 60>
	       <SET CNT <+ .CNT 1>>
	       <COND (<EQUAL? <GET ,P-LEXV 1> ,W?RESTAR>
	              <SET QUIT? <>>
		      <RETURN>)
	       	     (<OR <EQUAL? <GET ,P-LEXV 1> ,W?QUIT ,W?Q>
			  <G? .CNT 10>>
		      <SET QUIT? T>
		      <RETURN>)>>
	 <COND (.QUIT?
		<BACK-TO-MENU>)
	       (T
		<RESTART-SEGMENT>)>>

<ROUTINE V-STATUS ()
	 <COND (<LGOP?>
	 	<TELL "You are currently in ">
	        <COND (<EQUAL? ,NAUGHTY-LEVEL 0>
		       <TELL "tame">)
	       	      (<EQUAL? ,NAUGHTY-LEVEL 1>
		       <TELL "suggestive">)
	       	      (T
		       <TELL "lewd">)>
	 	<TELL " mode and are getting ">
	 	<COND (<EQUAL? ,VERBOSITY 0>
		       <TELL "super-brief">)
	       	      (<EQUAL? ,VERBOSITY 1>
		       <TELL "brief">)
	       	      (T
		       <TELL "verbose">)>
	 	<TELL " descriptions. ">
	 	<LGOP-SCORE>)>
	 <RTRUE>>

<GLOBAL GAME-NAMES <TABLE 0
"Zork I" "Leather Goddesses of Phobos" "Trinity" 
"The Interactive Fiction Tutorial">>

<ROUTINE V-VERSION ("AUX" (CNT 17) V)
	 <SET V <BAND <GET 0 1> *3777*>>
	 <COND (<NOT <EQUAL? ,GAME-FLAG 4>>
		<TELL "An excerpt from ">)>
	 <TELL <GET ,GAME-NAMES ,GAME-FLAG> CR
"Copyright (c) 1987 by Infocom, Inc. All rights reserved.|">
	 <COND (<NOT <EQUAL? ,GAME-FLAG 4>>
		<TELL "ZORK is a registered trademark of Infocom, Inc.|"
,LGOP-CAPS ", TRINITY, and WISHBRINGER are trademarks of Infocom, Inc.|">)>
	 <TELL "Release " N .V " / Serial number ">
	 <REPEAT ()
		 <COND (<G? <SET CNT <+ .CNT 1>> 23>
			<RETURN>)
		       (T
			<PRINTC <GETB 0 .CNT>>)>>
	 <CRLF>>

;<CONSTANT D-RECORD-ON 4>
;<CONSTANT D-RECORD-OFF -4>

;<ROUTINE V-$COMMAND ()
	 <DIRIN 1>
	 <RTRUE>>

;<ROUTINE V-$RANDOM ()
	 <COND (<NOT <PRSO? ,INTNUM>>
		<TELL "ILLEGAL" ,PERIOD-CR>)
	       (T
		<RANDOM <- 0 ,P-NUMBER>>
		<RTRUE>)>>

;<ROUTINE V-$RECORD ()
	 <DIROUT ,D-RECORD-ON> ;"all READS and INPUTS get sent to command file"
	 <RTRUE>>

;<ROUTINE V-$UNRECORD ()
	 <DIROUT ,D-RECORD-OFF>
	 <RTRUE>>

<ROUTINE V-$VERIFY ()
	 <COND (<AND <PRSO? ,INTNUM>
		     <EQUAL? ,P-NUMBER 69>>
		<TELL N ,SERIAL CR>)
	       (T
		<TELL "Verifying" ,PERIOD-CR>
	 	<COND (<VERIFY>
		       <TELL ,OK>)
	       	      (T
		       <TELL CR "** Bad **" CR>)>)>>

<CONSTANT SERIAL 0>

;<GLOBAL DEBUG <>>

;<ROUTINE V-$DEBUG ()
	 <TELL "O">
	 <COND (,DEBUG
		<SETG DEBUG <>>
		<TELL "ff">)
	       (T
		<SETG DEBUG T>
		<TELL "n">)>
	 <TELL ,PERIOD-CR>>



;"subtitle real verbs"

<ROUTINE V-ALARM ()
	 <COND (<PRSO? ,ROOMS>
		<PERFORM-PRSA ,ME>
		<RTRUE>)
	       (T
		<TELL "But" T ,PRSO " isn't asleep" ,PERIOD-CR>)>>

<ROUTINE V-ANSWER ()
	 <COND (<AND ,AWAITING-REPLY
		     <YES-WORD <GET ,P-LEXV ,P-CONT>>>
	        <V-YES>
		<STOP>)
	       (<AND ,AWAITING-REPLY
		     <NO-WORD <GET ,P-LEXV ,P-CONT>>>
		<V-NO>
		<STOP>)
	       (T
		<TELL "Nobody is awaiting your answer" ,PERIOD-CR>
	        <STOP>)>>

<ROUTINE V-ANSWER-KLUDGE ()
	 <COND (<NOUN-USED ,ME ,W?I>
		<V-INVENTORY>)
	       (T
	 	<SETG P-WON <>>
		<TELL ,NO-VERB>
		<STOP>)>>

<GLOBAL AWAITING-FAKE-ORPHAN <>>

<ROUTINE ORPHAN-VERB ()
	 <SETG AWAITING-FAKE-ORPHAN <>>
	 <RFALSE>
	 <PUT ,P-VTBL 0 ,W?ZZMGCK>
	 <PUT ,P-OVTBL 0 ,W?ANSWER>	;"maybe fix 'what do you want to'"
	 <PUT ,P-OTBL ,P-VERB ,ACT?ZZMGCK>
	 <PUT ,P-OTBL ,P-VERBN ,P-VTBL>
	 <PUT ,P-OTBL ,P-PREP1 0>
	 <PUT ,P-OTBL ,P-PREP1N 0>
	 <PUT ,P-OTBL ,P-PREP2 0>
	 <PUT ,P-OTBL 5 0>
	 <PUT ,P-OTBL ,P-NC1 1>
	 <PUT ,P-OTBL ,P-NC1L 0>
	 <PUT ,P-OTBL ,P-NC2 0>
	 <PUT ,P-OTBL ,P-NC2L 0>
	 <SETG P-OFLAG T>>

<ROUTINE V-APPLAUD ()
	 <TELL "Clap" ,PERIOD-CR>>

<ROUTINE V-APPLY ()
	 <COND (<WEARABLE? ,PRSO>
		<PERFORM ,V?WEAR ,PRSO>
		<RTRUE>)
	       (T
		<SETG AWAITING-REPLY 2>
		<QUEUE I-REPLY 2>
		<TELL "Apply" T ,PRSO " for what? A job?" CR>)>> 

;<ROUTINE PRE-SPEAK ()
	 <COND (<FSET? ,EARS ,MUNGBIT>
		<TELL ,YOU-CANT "carry on a conversation when " 'EARS " are">
		<COND (<EQUAL? ,EARS ,HAND-COVER>
		       <TELL " covered">)
		      (T
		       <TELL " plugged up">)>
		<TELL ,PERIOD-CR>
		<STOP>)>>

<ROUTINE V-ASK-ABOUT ()
	 <COND (<PRSO? ,ME>
		<PERFORM ,V?TELL ,ME>
		<RTRUE>)
	       (<FSET? ,PRSO ,ACTORBIT>
		<SETG WINNER ,PRSO>
		<PERFORM ,V?WHAT ,PRSI>
		<RTRUE>)
	       (T
		<PERFORM ,V?TELL ,PRSO>
		<RTRUE>)>>

<ROUTINE V-ASK-FOR ()
	 <TELL "Unsurprisingly," T ,PRSO " doesn't oblige" ,PERIOD-CR>>

<ROUTINE V-ASK-NO-ONE-FOR ("AUX" ACTOR)
	 <COND (<SET ACTOR <FIND-IN ,HERE ,ACTORBIT>>
		<PERFORM ,V?ASK-FOR .ACTOR ,PRSO>
		<RTRUE>)
	       (T
		<NO-ONE-HERE "ask">)>>

<ROUTINE V-BARTER-WITH ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<TELL "But" T ,PRSO " has nothing worth trading for" ,PERIOD-CR>)
	       (T
		<IMPOSSIBLES>)>>

<ROUTINE V-BARTER-FOR ()
	 <IMPOSSIBLES>>

;<ROUTINE V-BEND ()
	 <COND (<EQUAL? ,P-PRSA-WORD ,W?SPREAD>
		<COND (<FSET? ,PRSO ,ACTORBIT>
		       <V-BOARD>)
		      (T
		       <HACK-HACK "Spreading">)>)
	       (T
	        <HACK-HACK "Bending">)>>

<ROUTINE V-BITE ()
	 <HACK-HACK "Biting">>

<ROUTINE V-BLOW ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<PERFORM ,V?EAT ,PRSO>
		<RTRUE>)
	       (T
		<CANT-VERB-A-PRSO "blow">)>>

<ROUTINE PRE-BOARD ()
	 <COND (<IN? ,PROTAGONIST ,PRSO>
		<TELL ,LOOK-AROUND>)
	       (<ULTIMATELY-IN? ,PRSO>
		<TELL ,HOLDING-IT>)
	       (<UNTOUCHABLE? ,PRSO>
		<CANT-REACH ,PRSO>)>>

<ROUTINE V-BOARD ("AUX" (AV <LOC ,PROTAGONIST>))
	 <COND (<FSET? ,PRSO ,VEHBIT>
		<MOVE ,PROTAGONIST ,PRSO>
		<TELL "You are now ">
		<COND ;(<FSET? ,PRSO ,INBIT>
		       <TELL "i">)
		      (T
		       <TELL "o">)>
		<TELL "n" T ,PRSO ".">
		<FSET ,PRSO ,TOUCHBIT>
		<CRLF>)
	       (<FSET? ,PRSO ,ACTORBIT>
		<TELL
"Let's not beat around the bush. Come out and say what you mean" ,PERIOD-CR>)
	       (<EQUAL? <GET ,P-ITBL ,P-PREP1> ,PR?IN>
		<CANT-VERB-A-PRSO "get into">)
	       (T
		<CANT-VERB-A-PRSO "get onto">)>>

<ROUTINE V-BOARD-DIR ()
	 <RECOGNIZE>>

<ROUTINE V-BURN ()
	 <CANT-VERB-A-PRSO "burn">>

<ROUTINE V-BUY ()
	 <TELL "Sorry, there aren't any on sale here" ,PERIOD-CR>>

<ROUTINE V-BUY-WITH ()
	 <TELL
"I hadn't realized that" A ,PRSI
" was thought of as a unit of money" ,PERIOD-CR>>

<ROUTINE V-CALL ()
	 <COND ;(<EQUAL? ,HERE ,VIZICOMM-BOOTH>
		<PERFORM ,V?SET ,VIZICOMM>
		<RTRUE>)
	       (<NOT <VISIBLE? ,PRSO>>
	        <CANT-SEE ,PRSO>)
	       (T
		<PERFORM ,V?TELL ,PRSO>
		<RTRUE>)>>

<ROUTINE V-CAST-OFF ()
	 <COND (<PRSO? ,ROOMS>
		<PERFORM ,V?LAUNCH <LOC ,PROTAGONIST>>
		<RTRUE>)
	       (T
		<PERFORM ,V?TAKE-OFF ,PRSO>
		<RTRUE>)>>

<ROUTINE V-CATCH ()
	 <YUKS>>

<ROUTINE V-CHASTISE ()
	 <COND (<PRSO? ,INTDIR>
		<TELL
,YOULL-HAVE-TO "go in that direction to see what's there" ,PERIOD-CR>)
	       (T
		<TELL
"Use prepositions to indicate precisely what you want to do: LOOK AT the
object, LOOK INSIDE it, LOOK UNDER it, etc" ,PERIOD-CR>)>>

<ROUTINE V-CHEER ()
	 <COND (<PRSO? ,ROOMS>
		<TELL ,OK>)
	       (T
		<TELL "Probably," T ,PRSO " is as happy as possible" ,PERIOD-CR>)>>

<ROUTINE V-CLEAN ()
	 <SETG AWAITING-REPLY 2>
	 <QUEUE I-REPLY 2>
	 <TELL "Do you also do windows?" CR>>

<ROUTINE V-CLICK ()
	 <TELL "\"Click.\"" CR>>

<ROUTINE V-CLIMB ()
	 <COND (<PRSO? ,ROOMS>
		<DO-WALK ,P?UP>)
	       (<ULTIMATELY-IN? ,PRSO>
		<TELL ,HOLDING-IT>)
	       (T
		<IMPOSSIBLES>)>>

<ROUTINE V-CLIMB-DOWN ()
	 <COND (<PRSO? ,ROOMS>
		<DO-WALK ,P?DOWN>)
	       (<ULTIMATELY-IN? ,PRSO>
		<TELL ,HOLDING-IT>)
	       (<AND <FSET? ,PRSO ,ACTORBIT> ;"GO DOWN ON OBJECT"
		     <EQUAL? ,P-PRSA-WORD ,W?GO>>
		<PERFORM ,V?EAT ,PRSO>
		<RTRUE>)
	       (T
		<IMPOSSIBLES>)>>

<ROUTINE V-CLIMB-ON ()
	 <COND (<OR <FSET? ,PRSO ,VEHBIT>
		    <FSET? ,PRSO ,ACTORBIT>>
		<PERFORM ,V?BOARD ,PRSO>
		<RTRUE>)
	       (<ULTIMATELY-IN? ,PRSO>
		<TELL ,HOLDING-IT>)
	       (<EQUAL? <GET ,P-ITBL ,P-PREP1> ,PR?IN ;,PR?INSIDE>
		<CANT-VERB-A-PRSO "climb into">)
	       (T
		<CANT-VERB-A-PRSO "climb onto">)>>

<ROUTINE V-CLIMB-OVER ()
	 <COND (<ULTIMATELY-IN? ,PRSO>
		<TELL ,HOLDING-IT>)
	       (T
	 	<IMPOSSIBLES>)>>

<ROUTINE V-CLIMB-UP ()
	 <COND (<PRSO? ,ROOMS>
		<DO-WALK ,P?UP>)
	       (<ULTIMATELY-IN? ,PRSO>
		<TELL ,HOLDING-IT>)
	       (T
		<IMPOSSIBLES>)>>

<ROUTINE V-CLOSE ()
	 <COND (<OR <FSET? ,PRSO ,SURFACEBIT>
		    <FSET? ,PRSO ,ACTORBIT>
		    <FSET? ,PRSO ,VEHBIT>>
		<CANT-VERB-A-PRSO "close">)
	       (<OR <FSET? ,PRSO ,DOORBIT>
		    <FSET? ,PRSO ,CONTBIT>>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <FCLEAR ,PRSO ,OPENBIT>
		       <TELL "Okay," T ,PRSO " is now closed" ,PERIOD-CR>
		       <NOW-DARK?>)
		      (T
		       <TELL ,ALREADY-IS>)>)
	       (T
		<CANT-VERB-A-PRSO "close">)>>

<ROUTINE V-COME ()
	 <COND (<EQUAL? ,NAUGHTY-LEVEL 0>
		<TELL "Go" ,PERIOD-CR>)
	       (T
		<TELL "You're not even breathing hard" ,PERIOD-CR>)>>

<ROUTINE V-COPULATE ("AUX" (LOVER <>))
	 <COND (<SET LOVER <FIND-IN ,HERE ,ACTORBIT "with">>
		<PERFORM ,V?FUCK .LOVER>
		<RTRUE>)
	       (T
		<PERFORM ,V?MAKE ,LOVE>
		<RTRUE>)>>

<ROUTINE V-COUNT ()
	 <IMPOSSIBLES>>

<ROUTINE V-CRAWL-UNDER ()
	 <COND (<NOT <FSET? ,PRSO ,TAKEBIT>>
	        <TELL-HIT-HEAD>)
	       (T
		<IMPOSSIBLES>)>>

<ROUTINE V-CROSS ()
	 <V-WALK-AROUND>>

<ROUTINE V-CUT ()
	 <COND (<NOT ,PRSI>
		<IMPOSSIBLES>)
	       (T
		<TELL
"To put it bluntly, neither" T ,PRSI " nor you are very sharp" ,PERIOD-CR>)>>

<ROUTINE V-DECODE ()
	 <TELL ,YOULL-HAVE-TO "figure it out " D ,ME ,PERIOD-CR>>

<ROUTINE V-DEFLATE ()
	 <IMPOSSIBLES>>

<ROUTINE V-DIG ()
	 <WASTES>>

<ROUTINE V-DISEMBARK ()
	 <COND (<NOT ,PRSO>
		<COND (<NOT <IN? ,PROTAGONIST ,HERE>>
		       <PERFORM-PRSA <LOC ,PROTAGONIST>>
		       <RTRUE>)
		      (T
		       <TELL ,LOOK-AROUND>)>)
	       (<EQUAL? ,P-PRSA-WORD ,W?TAKE> ;"since GET OUT is also TAKE OUT"
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)
	       (<NOT <IN? ,PROTAGONIST ,PRSO>>
		<TELL ,LOOK-AROUND>
		<RFATAL>)
	       ;(<EQUAL? ,HERE ,CANAL>
		<PERFORM ,V?ENTER ,CANAL-OBJECT>
		<RTRUE>)
	       (T
		<MOVE ,PROTAGONIST ,HERE>
		<TELL "You">
		;<COND (<IN? ,SIDEKICK ,PRSO>
		       <MOVE ,SIDEKICK ,HERE>
		       <TELL " and " D ,SIDEKICK>)>
		<TELL " get o">
		<COND (<OFF-VEHICLE? ,PRSO>
		       <TELL "ff">)
		      (T
		       <TELL "ut of">)>
		<TELL T ,PRSO ".">
		;<COND (<IN? ,SIDEKICK ,SECOND-SLAB>
		       <MOVE ,SIDEKICK ,HERE>
		       <TELL " You also ">
		       <COND (,SIDEKICKS-BODY-TIED-TO-SLAB
			      <TELL "untie " D ,SIDEKICK " and help ">
		       	      <HIM-HER>)
			     (T
			      <TELL "help " D ,SIDEKICK>)>
		       <TELL " up from" T ,SECOND-SLAB ".">)>
		<CRLF>)>>

<ROUTINE V-DRESS ()
	 <COND (,PRSO
		<COND (<FSET? ,PRSO ,ACTORBIT>
		       <COND (<FSET? ,PRSO ,FEMALEBIT>
			      <TELL "Sh">)
			     (T
			      <TELL "H">)>
		       <TELL "e is already dressed." CR>)
		      (T
		       <IMPOSSIBLES>)>)
	       (T
		<SETG PRSO ,ROOMS>
		<V-GET-DRESSED>)>>

<ROUTINE V-DRINK ()
	 <COND (<FSET? ,PRSO ,DRINKBIT>
		<TELL "You sip some of the " D ,PRSO ,PERIOD-CR>)
	       (T
		<CANT-VERB-A-PRSO "drink">)>>

<ROUTINE V-DRINK-FROM ()
	 <IMPOSSIBLES>>

<ROUTINE V-DROP ()
	 <MOVE ,PRSO ,HERE>
	 <TELL "Dropped" ,PERIOD-CR>>

;<ROUTINE SPECIAL-DROP () ;"used by drop and throw"
	 <RFALSE>>

<ROUTINE V-EAT ()
	 <COND (<AND <FSET? ,PRSO ,ACTORBIT>
		     ;<NOT ,GONE-APE>
		     <NOT <EQUAL? ,NAUGHTY-LEVEL 0>>>
		<TELL 
"As you try," T ,PRSO " slaps you across the face. \"Really, we hardly know
each other.\"" CR>)
	       (T
	 	<COND (<EQUAL? ,GAME-FLAG 2>
		       <TELL
"While the foodstuffs of the universe are many and varied," A ,PRSO>
		       <COND (<FSET? ,PRSO ,PLURALBIT>
		       	      <TELL " are">)
		      	     (T
		       	      <TELL " is">)>
		       <TELL " not one of them" ,PERIOD-CR>)
		      (T
		       <TELL 
"It is doubtful that" T ,PRSO " would agree with you" ,PERIOD-CR>)>)>>

<ROUTINE V-EMPTY ("AUX" OBJ NXT)
	 <COND (<NOT ,PRSI>
		<SETG PRSI ,GROUND>)>
	 <COND (<NOT <FSET? ,PRSO ,CONTBIT>>
		<TELL ,HUH>)
	       (<NOT <FSET? ,PRSO ,OPENBIT>>
		<TELL "But" T ,PRSO " isn't open" ,PERIOD-CR>)
	       (<NOT <FIRST? ,PRSO>>
		<TELL CT ,PRSO " is already empty." CR>)
	       (<AND <PRSI? <FIRST? ,PRSO>>
		     <NOT <NEXT? ,PRSI>>>
		<TELL ,THERES-NOTHING "in" T ,PRSO " but" TR ,PRSI>)
	       ;(<IN-SPACE?>
		<TELL ,YOU-CANT "empty" T ,PRSO " without gravity!" CR>)
	       (T
		<SET OBJ <FIRST? ,PRSO>>
		<REPEAT ()
			<SET NXT <NEXT? .OBJ>>
			<COND (<NOT <EQUAL? .OBJ ,PROTAGONIST>>
			       <TELL D .OBJ ": ">
			       <COND ;(<AND <PRSI? ,TRELLIS>
					   <EQUAL? .OBJ ,LEAVES>>
				      <PERFORM ,V?PUT-ON ,LEAVES ,TRELLIS>)
				     (<FSET? .OBJ ,TAKEBIT>
				      <MOVE .OBJ ,PROTAGONIST>
				      <COND (<PRSI? ,HANDS>
					     <TELL "Taken" ,PERIOD-CR>)
					    (<PRSI? ,GROUND>
					     <PERFORM ,V?DROP .OBJ>)
					    (<FSET? ,PRSI ,SURFACEBIT>
					     <PERFORM ,V?PUT-ON .OBJ ,PRSI>)
					    (T
					     <PERFORM ,V?PUT .OBJ ,PRSI>)>)
				     (T
				      <YUKS>)>)>
			<COND (.NXT
			       <SET OBJ .NXT>)
			      (T
			       <RETURN>)>>)>>

<ROUTINE V-EMPTY-FROM ()
	 <COND (<IN? ,PRSO ,PRSI>
		<COND (<FSET? ,PRSO ,TAKEBIT>
		       <MOVE ,PRSO ,PROTAGONIST>
		       <PERFORM ,V?DROP ,PRSO>
		       <RTRUE>)
		      (T
		       <YUKS>)>)
	       (T
		<NOT-IN>)>>

<ROUTINE V-ENTER ()
	<COND (<FSET? ,PRSO ,DOORBIT>
	       <DO-WALK <OTHER-SIDE ,PRSO>>
	       <RTRUE>)
	      (<FSET? ,PRSO ,VEHBIT>
	       <PERFORM ,V?BOARD ,PRSO>
	       <RTRUE>)
	      (<FSET? ,PRSO ,ACTORBIT>
	       <PERFORM ,V?BOARD ,PRSO>
	       <RTRUE>)
	      (<NOT <FSET? ,PRSO ,TAKEBIT>>
	       <TELL-HIT-HEAD>)
	      (<ULTIMATELY-IN? ,PRSO>
	       <TELL ,HOLDING-IT>
	       <RTRUE>)
	      (T
	       <IMPOSSIBLES>)>>

<ROUTINE V-EXAMINE ()
	 <COND ;(<FSET? ,PRSO ,UNTEEDBIT>
		<TELL "It looks just like" A ,PRSO ", whatever that is" ,PERIOD-CR>)
	       (<FSET? ,PRSO ,READBIT>
		<PERFORM ,V?READ ,PRSO>)
	       (<FSET? ,PRSO ,ACTORBIT>
		<COND (<FIRST? ,PRSO>
		       <PERFORM ,V?LOOK-INSIDE ,PRSO>
		       <RTRUE>)
		      (T
		       <NOTHING-INTERESTING>
		       <TELL "about" TR ,PRSO>)>)
	       (<OR <FSET? ,PRSO ,DOORBIT>
		    <FSET? ,PRSO ,SURFACEBIT>>
		<V-LOOK-INSIDE>)
	       (<FSET? ,PRSO ,CONTBIT>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <V-LOOK-INSIDE>)
		      (T
		       <TELL "It's closed" ,PERIOD-CR>)>)
	       (<FSET? ,PRSO ,LIGHTBIT>
		<TELL "It's o">
		<COND (<FSET? ,PRSO ,ONBIT>
		       <TELL "n">)
		      (T
		       <TELL "ff">)>
		<TELL ,PERIOD-CR>)
	       (<FSET? ,PRSO ,READBIT>
		<PERFORM ,V?READ ,PRSO>
		<RTRUE>)
	       (<FSET? ,PRSO ,NARTICLEBIT>
		<SENSE-OBJECT "look">)
	       (<OR <PROB 25>
		    <PRSO? ,PSEUDO-OBJECT>>
		<TELL "Totally ordinary looking " D ,PRSO ,PERIOD-CR>)
	       (<PROB 60>
		<NOTHING-INTERESTING>
		<TELL "about" TR ,PRSO>)
	       (T
	        <PRONOUN>
		<TELL " look">
		<COND (<AND <NOT <FSET? ,PRSO ,PLURALBIT>>
			    <NOT <PRSO? ,ME>>>
		       <TELL "s">)>
		<TELL " like every other " D ,PRSO " you've ever seen" ,PERIOD-CR>)>>

<ROUTINE NOTHING-INTERESTING ()
	 <TELL ,THERES-NOTHING>
	 <COND (<PROB 25>
		<TELL "unusual">)
	       (<PROB 33>
		<TELL "noteworthy">)
	       (<PROB 50>
		<TELL "eye-catching">)
	       (T
		<TELL "special">)>
	 <TELL " ">>

<ROUTINE V-EXIT ()
	 <COND (<AND ,PRSO
		     <FSET? ,PRSO ,VEHBIT>>
		<PERFORM ,V?DISEMBARK ,PRSO>
		<RTRUE>)
	       (<NOT <IN-EXITABLE-VEHICLE?>>
		<DO-WALK ,P?OUT>)>>

<ROUTINE IN-EXITABLE-VEHICLE? ("AUX" AV)
	 <COND (,IN-PRAM?
		<PERFORM ,V?DISEMBARK ,PRAM>)
	       (T
		<RFALSE>)>>

<ROUTINE V-FEED ()
	 <COND (<ULTIMATELY-IN? ,CHOCOLATE>
		<PERFORM ,V?GIVE ,CHOCOLATE ,PRSO>
		<RTRUE>)
	       (T
	 	<TELL "You have no food for" TR ,PRSO>)>>

<ROUTINE V-FILL ()
	 <COND (<AND <FSET? ,PRSO ,CONTBIT>
		     <OR <PRSI? ,WATER>
			 <GLOBAL-IN? ,WATER ,HERE>>>
		<WASTES>)
	       (<NOT ,PRSI>
		<TELL ,THERES-NOTHING "to fill it with" ,PERIOD-CR>)
	       (T 
		<IMPOSSIBLES>)>>

<ROUTINE V-FIND ("OPTIONAL" (WHERE <>) "AUX" (L <LOC ,PRSO>))
	 <COND (<NOT .L>
		<PRONOUN>
		<TELL " could be anywhere!" CR>)
	       (<IN? ,PRSO ,PROTAGONIST>
		<TELL "You have it." CR>)
	       (<IN? ,PRSO ,HERE>
		<TELL "Right in front of you" ,PERIOD-CR>)
	       (<OR <IN? ,PRSO ,GLOBAL-OBJECTS>
		    <GLOBAL-IN? ,PRSO ,HERE>
		    <PRSO? ,PSEUDO-OBJECT>>
		<V-DECODE>)
	       (<AND <FSET? .L ,ACTORBIT>
		     <VISIBLE? .L>>
		<TELL "Looks as if" T .L " has it" ,PERIOD-CR>)
	       (<AND <FSET? .L ,CONTBIT>
		     <VISIBLE? ,PRSO>
		     <NOT <IN? .L ,GLOBAL-OBJECTS>>>
		<COND (<FSET? .L ,SURFACEBIT>
		       <TELL "O">)
		      (T
		       <TELL "I">)>
		<TELL "n" TR .L>)
	       (.WHERE
		<TELL "Beats me" ,PERIOD-CR>)
	       (T
		<V-DECODE>)>>

<ROUTINE V-FLUSH ()
	 <YUKS>>

<ROUTINE V-FOLLOW ()
	 <COND (<VISIBLE? ,PRSO>
		<TELL CT ,PRSO " is right here." CR>)
	       (<NOT <FSET? ,PRSO ,ACTORBIT>>
		<IMPOSSIBLES>)
	       (T
		<TELL "You have no idea where" T ,PRSO " is" ,PERIOD-CR>)>>

<ROUTINE V-FUCK ()
	 <COND (<LGOP?>
	 	<COND (<NOT ,PRSO>
		       <COND (<EQUAL? ,HERE ,JOES-BAR>
			      <SETG PRSO ,JOE>
			      <TELL "[" D ,JOE "]" CR CR>)
			     (<IN? ,SIDEKICK ,HERE>
			      <SETG PRSO ,SIDEKICK>
			      <TELL "[" D ,SIDEKICK "]" CR CR>)
			     (T
			      <TELL "There's nobody here to score with!" CR>
			      <RFATAL>)>)>
		<COND (<EQUAL? ,NAUGHTY-LEVEL 0>
		       <TELL
"Shocking! What if your mother saw you typing inputs like that?" CR>)
		      (<NOT <FSET? ,PRSO ,ACTORBIT>>
		       <TELL "Not in my game, you pansexual pervert!" CR>)
	       	      (<EQUAL? ,NAUGHTY-LEVEL 1>
		       <TELL
"Unfortunately," T ,PRSO
" doesn't seem interested, and it takes two to tango" ,PERIOD-CR>)
	       	      (T
		       <TELL
"A slap across the face alerts you that" T ,PRSO " isn't that hot to trot.
And not a goddam single cold shower in sight!" CR>)>)>
	 <RTRUE>>

<ROUTINE PRE-GIVE ()
	 <COND (<AND <VERB? GIVE>
		     <PRSO? ,HANDS>>
		<PERFORM ,V?SHAKE-WITH ,PRSI>
		<RTRUE>)
	       (<IDROP>
		<RTRUE>)>>

<ROUTINE V-GET-DRESSED ()
	 <COND (<PRSO? ,ROOMS>
		<TELL "You already are." CR>)
	       (T
		<RECOGNIZE>)>>

<ROUTINE V-GET-DRUNK ()
	 <COND (<NOT <PRSO? ,ROOMS>>
		<RECOGNIZE>)
	       (<EQUAL? ,HERE ,JOES-BAR>
		<PERFORM ,V?BUY ,BEER>
		<RTRUE>)
	       (T
		<SETG AWAITING-REPLY 2>
		<QUEUE I-REPLY 2>
		<TELL "Here?" CR>)>>

<ROUTINE V-GET-UNDRESSED ()
	 <COND (<PRSO? ,ROOMS>
		<PERFORM ,V?TAKE-OFF ,GARMENT>
		<RTRUE>)
	       (T
		<RECOGNIZE>)>>

;<ROUTINE V-GIDDYAP ()
	 <COND (<IN? ,STALLION ,HERE>
		<PERFORM ,V?KICK ,STALLION>
		<RTRUE>)
	       (T
		<TELL ,HUH>)>>

<ROUTINE V-GIVE ()
	 <COND (<FSET? ,PRSI ,ACTORBIT>
		<TELL "Briskly," T ,PRSI " refuses your offer" ,PERIOD-CR>)
	       (T
		<TELL ,YOU-CANT "give" A ,PRSO " to" A ,PRSI "!" CR>)>>

<ROUTINE V-GIVE-UP ()
	 <COND (<PRSO? ,ROOMS>
		<V-QUIT>)
	       (T
		<RECOGNIZE>)>>

<ROUTINE V-GOODBYE ()
	 <TELL "See you later" ,PERIOD-CR>>

<ROUTINE V-HELLO ()
       <COND (,PRSO
	      <TELL
"[The proper way to talk to characters in the story is PERSON, HELLO.]" CR>)
	     (T
	      <PERFORM ,V?TELL ,ME>
	      <RTRUE>)>>

<ROUTINE V-HIDE ()
	 <TELL ,YOU-CANT "hide ">
	 <COND (,PRSO
		<TELL "t">)>
	 <TELL "here" ,PERIOD-CR>>

<ROUTINE V-IN ()
	 <DO-WALK ,P?IN>>

<ROUTINE V-INFLATE ()
	 <IMPOSSIBLES>>

<ROUTINE V-INHALE ()
	 <COND (<NOT ,PRSO>
		<TELL ,OK>)
	       (<PRSO? ,ROOMS>
		<TELL "You begin to get light-headed" ,PERIOD-CR>)
	       (T
		<RECOGNIZE>)>>

<ROUTINE V-KICK ()
	 <HACK-HACK "Kicking">>

;<ROUTINE V-KILL ()
	 <TELL "Relax" ,PERIOD-CR>>

<ROUTINE V-KILL ()
	 <COND (<EQUAL? ,GAME-FLAG 1>
		<ZORK-KILL>)
	       (T
		<TELL "Relax" ,PERIOD-CR>)>>

<ROUTINE I-ASSUME (OBJ)
	 <COND (<NOT <EQUAL? ,GAME-FLAG 1>>
		<CRLF>)>
	 <TELL "[with" T .OBJ "]" CR CR>
	 <SETG PRSI .OBJ>>

<ROUTINE ZORK-KILL () 
	 <COND (<NOT ,PRSI>
		<COND (<ULTIMATELY-IN? ,SWORD ,PROTAGONIST>
		       <I-ASSUME ,SWORD>)
		      (<ULTIMATELY-IN? ,KNIFE ,PROTAGONIST>
		       <I-ASSUME ,KNIFE>)
		      (T
		       <I-ASSUME ,HANDS>)>)> 
<COND (<NOT <FSET? ,PRSO ,ACTORBIT>>
		<TELL
"I've known strange people, but fighting" A ,PRSO "?" CR>)
	       (<EQUAL? ,PRSI ,HANDS>
		<TELL
"Trying to attack" A ,PRSO " with your bare hands is suicidal" ,PERIOD-CR>)
	       (<NOT <IN? ,PRSI ,WINNER>>
		<TELL "You aren't even holding the " D ,PRSI ,PERIOD-CR>)
	       (<NOT <FSET? ,PRSI ,WEAPONBIT>>
		<TELL
"Trying to attack the " D ,PRSO " with" A ,PRSI " is suicidal" ,PERIOD-CR>)
	       (T
	        <HERO-BLOW>)>>

<ROUTINE V-KISS ()
	<TELL "\"Smack.\"" CR>>

<ROUTINE V-KISS-ON ()
	 <V-KISS>>

<ROUTINE V-KNEEL ()
	 <TELL "You begin to get a sore knee" ,PERIOD-CR>>

<ROUTINE V-KNOCK ()
	 <COND (<FSET? ,PRSO ,DOORBIT>
		<TELL "Silence answers back" ,PERIOD-CR>)
	       (T
		<HACK-HACK "Knocking on">)>>

;<ROUTINE V-KWEEPA ()
	 <COND (<IN-CATACOMBS>
		<QUEUE I-GATOR 12>)>
	 <TELL
"A Martian hawk, hearing the cry of a possible mate, flies up and begins
squawking and flapping a mating ritual. As it pauses to catch its breath,
it takes a better look at you, rubs its eyes, and flies quickly away" ,PERIOD-CR>>

<ROUTINE V-LAND ()
	 <TELL ,HUH>>

<ROUTINE V-LAUGH ()
	 <TELL "\"Tee hee.\"" CR>>

<ROUTINE V-LAUNCH ()
	 <YUKS>>

<ROUTINE V-LEAP ()
	 <COND (<OR <PRSO? ,ROOMS>
		    <NOT ,PRSO>>
		<COND (<EQUAL? ,HERE ,ROOF>
		       <JIGS-UP
"You leap, and the gravity of Phobos is so weak that you sail up, up, and away!
You achieve escape velocity and sail into the icy depths of space.">)
		      (<AND <EQUAL? ,HERE ,CLOSET>
			    <NOT <IN? ,PROTAGONIST ,STOOL>>>
		       <TELL "You still can't reach" TR ,SHELF>)
		      ;(<EQUAL? ,HERE ,ROCKY-CLIFFTOP ,MINARET>
		       <JIGS-UP "\"Aaaiieeee!\"">)
		      (T
		       <WEE>)>)
	       (<AND ,PRSO
		     <NOT <IN? ,PRSO ,HERE>>>
		<IMPOSSIBLES>)
	       (T
		<WEE>)>>

<ROUTINE V-LEAP-OFF ()
	 <COND (<FSET? ,PRSO ,VEHBIT>
		<PERFORM ,V?DISEMBARK ,PRSO>
		<RTRUE>)
	       (T
		<PERFORM ,V?LEAP ,PRSO>
		<RTRUE>)>>

<ROUTINE V-LEAVE ()
	 <COND (<NOT ,PRSO>
		<SETG PRSO ,ROOMS>)>
	 <COND (<PRSO? ,ROOMS>
		<DO-WALK ,P?OUT>)
	       (<IN? ,PROTAGONIST ,PRSO>
		<PERFORM ,V?DISEMBARK ,PRSO>
		<RTRUE>)
	       (T
		<PERFORM ,V?DROP ,PRSO>
		<RTRUE>)>>

<ROUTINE V-LICK ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<PERFORM ,V?EAT ,PRSO>
		<RTRUE>)
	       (T
		<PERFORM ,V?TASTE ,PRSO>
		<RTRUE>)>>

<ROUTINE V-LIE-DOWN ()
	 <WASTES>>

<ROUTINE V-LIMBER ()
	 <COND (<LGOP?>
		<TELL 
"Ahhh. Nothing like a little muscle-loosening" ,PERIOD-CR>)>
	 <RTRUE>>

;<ROUTINE PRE-LISTEN ()
	 <COND (<FSET? ,EARS ,MUNGBIT>
		<TELL "You hear the sound of sweating palms" ,PERIOD-CR>)>>
		      
<ROUTINE V-LISTEN ()
	 <COND (,PRSO
	 	<SENSE-OBJECT "sound">)
	       ;(<EQUAL? ,HERE ,BOUDOIR>
		<NOT-ALONE-ON-DIVAN>
		<CRLF>)
	       (T
		<TELL "You hear nothing of interest" ,PERIOD-CR>)>>

<ROUTINE V-LOCK ()
	 <YUKS>>

<ROUTINE PRE-LOOK ()
	 <COND (<AND <VERB? EXAMINE>
		     <EQUAL? ,P-PRSA-WORD ,W?DESCRIBE>
		     <PRSO? ,ODOR>>
		<RFALSE>)
	       (<PLAYER-CANT-SEE>
		<RTRUE>)>>

<ROUTINE V-LOOK ()
	 <COND (<DESCRIBE-ROOM T>
	 	<COND (<EQUAL? ,GAME-FLAG 1>
		       <DESC-CONTENTS-OF-ROOM T>)
		      (T
		       <DESCRIBE-OBJECTS>)>)>
		<RTRUE>>

;<ROUTINE UNIFORMLY-COLORED (ROOM-NAME STRING)
	 <TELL .ROOM-NAME " Room|
   This location is dim and uniformly colored, resembling what you see
when you have your " .STRING ". In fact, you have your "
.STRING ,PERIOD-CR>>

<ROUTINE V-LOOK-BEHIND ()
	 <COND (<FSET? ,PRSO ,DOORBIT>
		<PERFORM ,V?LOOK-INSIDE ,PRSO>
		<RTRUE>)>
	 <TELL "There is nothing behind" TR ,PRSO>>

<ROUTINE V-LOOK-DOWN ()
	 <COND (<PRSO? ,ROOMS>
		<PERFORM ,V?EXAMINE ,GROUND>
		<RTRUE>)
	       (T
		<PERFORM ,V?LOOK-INSIDE ,PRSO>
		<RTRUE>)>>

<ROUTINE V-LOOK-INSIDE ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<TELL ,IT-SEEMS-THAT T ,PRSO " has">
		<COND ;(<EQUAL? ,GAME-FLAG 1>
		       <TELL " ">
		       <PRINT-CONT ,PRSO>)
		      (<NOT <DESCRIBE-NOTHING ,PRSO>>
		       <TELL ,PERIOD-CR>)>
		<RTRUE>)
	       (<IN? ,PROTAGONIST ,PRSO>
		<DESCRIBE-VEHICLE>)
	       (<FSET? ,PRSO ,SURFACEBIT>
		<TELL ,YOU-SEE>
		<COND ;(<EQUAL? ,GAME-FLAG 1>
		       <TELL " ">
		       <PRINT-CONT ,PRSO>)
	       	      (<NOT <DESCRIBE-NOTHING ,PRSO>>
		       <TELL " on" TR ,PRSO>)>
		<RTRUE>)
	       (<FSET? ,PRSO ,DOORBIT>
		<TELL "All you can tell is that" T ,PRSO " is ">
		<OPEN-CLOSED ,PRSO>
		<TELL ,PERIOD-CR>)
	       (<FSET? ,PRSO ,CONTBIT>
		<COND (<SEE-INSIDE? ,PRSO>
		       <TELL ,YOU-SEE>
		       <COND ;(<EQUAL? ,GAME-FLAG 1>
			      <TELL " ">
			      <PRINT-CONT ,PRSO>)
		       	     (<NOT <DESCRIBE-NOTHING ,PRSO>>
			      <TELL " in" TR ,PRSO>)>
		       <RTRUE>)
		      (<AND <NOT <FSET? ,PRSO ,OPENBIT>>
			    <FIRST? ,PRSO>>
		       <COND (<PRE-TOUCH>
			      <RTRUE>)>
		       <PERFORM ,V?OPEN ,PRSO>
		       <RTRUE>)
		      (T
		       <DO-FIRST "open" ,PRSO>)>)
	       (<EQUAL? <GET ,P-ITBL ,P-PREP1> ,PR?IN ;,PR?INSIDE>
		<CANT-VERB-A-PRSO "look inside">)
	       (T
		<YUKS>)>>

<ROUTINE V-LOOK-OVER ()
	 <V-EXAMINE>>

<ROUTINE V-LOOK-UNDER ()
	 <COND (<ULTIMATELY-IN? ,PRSO>
		<COND (<FSET? ,PRSO ,WORNBIT>
		       <TELL "You're wearing it." CR>)
		      (T
		       <TELL ,HOLDING-IT>)>)
	       (T
		<NOTHING-INTERESTING>
		<TELL "under" TR ,PRSO>)>>

<ROUTINE V-LOOK-UP ()
	 <COND (<PRSO? ,ROOMS>
		<COND ;(<EQUAL? ,HERE ,WELL-BOTTOM>
		       <TELL ,YOU-SEE " a dot of light" ,PERIOD-CR>)
		      ;(<IN-CATACOMBS>
		       <TELL ,ONLY-BLACKNESS>)
		      (<INDOORS?>
		       <PERFORM ,V?EXAMINE ,CEILING>
		       <RTRUE>)
		      (T
		       <TELL "You begin to get a sore neck" ,PERIOD-CR>)>)
	       (T
		<PERFORM ,V?LOOK-INSIDE ,PRSO>
		<RTRUE>)>>

<ROUTINE V-LOVE ()
	 <COND (<LGOP?>
		<TELL "Not difficult, considering how lovable" T ,PRSO " ">
	 	<COND (<FSET? ,PRSO ,PLURALBIT>
		       <TELL "are">)
	       	      (T
		       <TELL "is">)>
	 	<TELL ,PERIOD-CR>)>
	 <RTRUE>>

<ROUTINE V-LOWER ()
	 <V-RAISE>>

<ROUTINE V-MAKE ()
	 <CANT-VERB-A-PRSO "make">>

<ROUTINE V-MAKE-LOVE ()
	 <COND (<PRSO? ,LOVE>
		<PERFORM ,V?FUCK ,PRSI>
		<RTRUE>)
	       (T
		<RECOGNIZE>)>>

<ROUTINE V-MAKE-OUT ("AUX" KISSEE)
	 <COND (<NOT <PRSO? ,ROOMS>>
		<SET KISSEE ,PRSO>)
	       (<NOT <SET KISSEE <FIND-IN ,HERE ,ACTORBIT "with">>>
		<SET KISSEE ,ME>)>
	 <PERFORM ,V?KISS .KISSEE>
	 <RTRUE>>

<ROUTINE V-MAKE-WITH ()
	 <V-MAKE>>

<ROUTINE V-MARRY ()
	 <YUKS>>

<ROUTINE V-MASTURBATE ()
	 <COND (<LGOP?>
		<COND (<AND ,PRSO ;"for JERK OFF OBJECT (FIND RLANDBIT)"
		     	    <NOT <PRSO? ,ROOMS>>>
		       <RECOGNIZE>)
	       	      (<EQUAL? ,NAUGHTY-LEVEL 0>
		       <SETG AWAITING-REPLY 2>
		       <QUEUE I-REPLY 2>
		       <TELL "Don't you know that this causes blindness?" CR>)
	       	      (T
		       <PERFORM ,V?FUCK ,ME>
		       <RTRUE>)>)>
	 <RTRUE>>

<ROUTINE V-MEASURE ()
	 <COND (<OR <FSET? ,PRSO ,PARTBIT>
		    <PRSO? ,ME>>
		<TELL "Usual size" ,PERIOD-CR>)
	       (T
	 	<TELL "The same size as any other " D ,PRSO ,PERIOD-CR>)>>

<ROUTINE V-MOAN ()
	 <COND (<LGOP?>
		<TELL "\"Ohhhh...\"" CR>)>
	 <RTRUE>>

<ROUTINE V-MOVE ()
	 <COND (<ULTIMATELY-IN? ,PRSO>
		<WASTES>)
	       (<LOC-CLOSED>
		<RTRUE>)
	       (<FSET? ,PRSO ,TAKEBIT>
		<TELL "Moving" T ,PRSO " reveals nothing" ,PERIOD-CR>)
	       (<EQUAL? ,P-PRSA-WORD ,W?PULL>
		<HACK-HACK "Pulling">)
	       (T
		<CANT-VERB-A-PRSO "move">)>>

<ROUTINE V-MUNG ()
	 <COND (<PRSO? ,ROOMS> ;"break out"
		<COND ;(<IN? ,PROTAGONIST ,CAGE>
		       <PERFORM-PRSA ,CAGE>
		       <RTRUE>)
		      (T
		       <TELL "Argh! Pimples!" CR>)>)
	       (T
	 	<HACK-HACK "Trying to destroy">)>>

<ROUTINE V-NO ()
	 <COND ;(<EQUAL? ,AWAITING-REPLY 1>
		<TELL "\"Too bad.\" ">
		<RIDDLE-DEATH>)
	       (<EQUAL? ,AWAITING-REPLY 2>
		<V-YES>)		
	       (T
		<YOU-SOUND "nega">)>>

<ROUTINE NO-WORD (WRD)
	 <COND (<OR <EQUAL? .WRD ,W?NO ,W?NOPE>
		    <EQUAL? .WRD ,W?NAH ,W?UH-UH>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE V-OFF ()
	 <COND (<FSET? ,PRSO ,LIGHTBIT>
		<COND (<FSET? ,PRSO ,ONBIT>
		       <FCLEAR ,PRSO ,ONBIT>
		       <TELL "Okay," T ,PRSO " is now off" ,PERIOD-CR>
		       <NOW-DARK?>)
		      (T
		       <TELL "It isn't on." CR>)>)
	       (T
		<CANT-TURN "ff">)>>

<ROUTINE V-ON ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<COND (<LGOP?>
		       <TELL 
"Hopefully, your sexy body will do the trick" ,PERIOD-CR>)>
		<RTRUE>)
	       (<FSET? ,PRSO ,LIGHTBIT>
		<COND (<FSET? ,PRSO ,ONBIT>
		       <TELL ,ALREADY-IS>)
		      (T
		       <FSET ,PRSO ,ONBIT>
		       <TELL "Okay," T ,PRSO " is now on" ,PERIOD-CR>
		       <NOW-LIT?>)>)
	       (T
		<CANT-TURN "n">)>>

<ROUTINE CANT-TURN (STRING)
	 <TELL ,YOU-CANT "turn that o" .STRING ,PERIOD-CR>>

<ROUTINE V-OPEN ()
	 <COND (<OR <FSET? ,PRSO ,SURFACEBIT>
		    <FSET? ,PRSO ,ACTORBIT>
		    <FSET? ,PRSO ,VEHBIT>>
		<IMPOSSIBLES>)
	       (<FSET? ,PRSO ,OPENBIT>
		<TELL ,ALREADY-IS>)
	       (<FSET? ,PRSO ,DOORBIT>
		<COND (<FSET? ,PRSO ,LOCKEDBIT>
		       <TELL "It's locked" ,PERIOD-CR>)
		      (T
		       <FSET ,PRSO ,OPENBIT>
		       <FSET ,PRSO ,TOUCHBIT> ;"important for CELL-DOOR desc"
		       <TELL "The " D ,PRSO " swings open" ,PERIOD-CR>)>)
	       (<FSET? ,PRSO ,CONTBIT>
		<FSET ,PRSO ,OPENBIT>
		<FSET ,PRSO ,TOUCHBIT>
		<COND (<OR <NOT <FIRST? ,PRSO>>
			   <FSET? ,PRSO ,TRANSBIT>>
		       <TELL "Opened" ,PERIOD-CR>)
		      (T
		       <TELL "Opening" T ,PRSO " reveals">
		       <COND ;(<EQUAL? ,GAME-FLAG 1>
			      <TELL " ">
			      <PRINT-CONT ,PRSO>)
			     (<NOT <DESCRIBE-NOTHING ,PRSO>>
			      	     <TELL ,PERIOD-CR>)>
		       <NOW-LIT?>)>)
	       (T
		<CANT-VERB-A-PRSO "open">)>>

<ROUTINE V-PASS () ;"for PASS WATER"
	 <TELL ,YOULL-HAVE-TO "say who you want to pass it to" ,PERIOD-CR>>

<ROUTINE V-PAY ()
	 <COND (<ULTIMATELY-IN? ,COIN ,PROTAGONIST>
		<TELL "[with" T ,COIN "]" CR CR>
		<PERFORM ,V?GIVE ,COIN ,PRSO>)
	       (<ULTIMATELY-IN? ,CREDIT-CARD ,PROTAGONIST>
		<TELL "[with" T ,CREDIT-CARD "]" CR CR>
		<PERFORM ,V?GIVE ,CREDIT-CARD ,PRSO>)
	       (T
		<TELL "You have no money." CR>)>>

<ROUTINE V-PEE ()
	 <COND (<RUNNING? ,I-URGE>
		<COND (<EQUAL? ,HERE ,MENS-ROOM ,LADIES-ROOM>
		       <DEQUEUE I-URGE>
		       <QUEUE I-KIDNAPPING 5>
		       <COND (<IN? ,PROTAGONIST ,STOOL>
			      <MOVE ,PROTAGONIST ,HERE>
			      <TELL "[getting off the stool first]" CR CR>)>
		       <TELL "Ahhh...">
		       <NOTICE-PIZZA-ODOR>)
		      (T
		       <SETG AWAITING-REPLY 3>
		       <QUEUE I-REPLY 2>
		       <TELL "What, on the floor?" CR>)>)
	       (T
		<V-SHIT T>)>>

<ROUTINE V-PEE-IN ()
	 <TELL
"Miss Manners would be shocked" ,PERIOD-CR>>

<ROUTINE V-PHONE ()
	 <COND ;(<EQUAL? ,HERE ,VIZICOMM-BOOTH>
		<V-CALL>)
	       (T
		<TELL ,YOU-CANT-SEE-ANY "phone here." CR>)>>

<ROUTINE V-PICK ()
	 <CANT-VERB-A-PRSO "pick">>

<ROUTINE V-PICK-UP ()
	 <PERFORM ,V?TAKE ,PRSO ,PRSI>
	 <RTRUE>>

;<ROUTINE V-PIN ()
	 <COND (,PRSI
		<TELL ,HUH>)
	       (<VISIBLE? ,CLOTHES-PIN>
		<PERFORM ,V?PUT-ON ,CLOTHES-PIN ,PRSO>
		<RTRUE>)
	       (T
		<TELL "You have no pin" ,PERIOD-CR>)>>

<ROUTINE V-POINT ()
	 <TELL "That would be pointless" ,PERIOD-CR>>

;<ROUTINE PRE-POUR ()
	 <COND (<IN-SPACE?>
		<TELL "There's no gravity!" CR>)>>

<ROUTINE V-POUR ()
	 <IMPOSSIBLES>>

<ROUTINE V-PUSH ()
	 <HACK-HACK "Pushing">>

<ROUTINE V-PUSH-DIR ()
	 <COND (<PRSI? ,INTDIR>
		<V-PUSH>)
	       (T
		<RECOGNIZE>)>>

<ROUTINE V-PUSH-OFF ()
	 <TELL ,HUH>>

<ROUTINE PRE-PUT ()
	 <COND (<PRSO? ,COCK ,TITS ,CUNT>
		<RFALSE> ;"NAUGHTY-BITS-F handles")
	       (<PRSI? ,GROUND>
		;<COND (<NOUN-USED ,W?STAIN ,STAIN>
		       <RFALSE>)
		      (<AND <PRSO? ,CREAM>
			    <NOT <EQUAL? <GET ,P-NAMW 0> ,W?JAR>>>
		       <RFALSE>)>
		<PERFORM ,V?DROP ,PRSO>
		<RTRUE>)
	       (<PRSO? ,HANDS>
		<COND (<AND <VERB? PUT-ON PUT>
			    <FSET? ,PRSI ,PARTBIT>>
		       <RFALSE>)
		      (<VERB? PUT>
		       <PERFORM ,V?REACH-IN ,PRSI>
		       <RTRUE>)
		      (T
		       <IMPOSSIBLES>)>)
	       (<AND <NOT <FSET? ,PRSI ,PARTBIT>>
		     <PLAYER-CANT-SEE>>		     
		<RTRUE>)
	       (<ULTIMATELY-IN? ,PRSI ,PRSO>            
                <TELL ,YOU-CANT "put" T ,PRSO>
	        <COND (<EQUAL? <GET ,P-ITBL ,P-PREP2> ,PR?ON>
		       <TELL " on">)
		      (T
		       <TELL " in">)>
		<TELL T ,PRSI " when" T ,PRSI " is already ">
		<COND (<FSET? ,PRSO ,SURFACEBIT>
		       <TELL "on">)
		      (T
		       <TELL "in">)>
		<TELL T ,PRSO "!" CR>)
	       ;(<AND <VERB? PUT-ON>
		     <PRSO? ,SOD>
		     <PRSI? ,HOLE>>
		<RFALSE>)
	       (<UNTOUCHABLE? ,PRSI>
		<CANT-REACH ,PRSI>)
	       (<IDROP>
		<RTRUE>)>>

<ROUTINE V-PUT ()
	 <COND (<AND <NOT <FSET? ,PRSI ,OPENBIT>>
		     <NOT <FSET? ,PRSI ,CONTBIT>>
		     <NOT <FSET? ,PRSI ,SURFACEBIT>>
		     <NOT <FSET? ,PRSI ,VEHBIT>>>
		<TELL ,YOU-CANT "put" T ,PRSO " in" A ,PRSI "." CR>)
	       (<OR <PRSI? ,PRSO>
		    <AND <ULTIMATELY-IN? ,PRSO>
			 <NOT <FSET? ,PRSO ,TAKEBIT>>>>
		<TELL "How can you do that?" CR>)
	       (<FSET? ,PRSI ,DOORBIT>
		<TELL ,CANT-FROM-HERE>)
	       (<AND <NOT <FSET? ,PRSI ,OPENBIT>>
		     <NOT <FSET? ,PRSI ,SURFACEBIT>>>
		<THIS-IS-IT ,PRSI>
		<DO-FIRST "open" ,PRSI>)
	       (<IN? ,PRSO ,PRSI>
		<TELL "But" T ,PRSO " is already in" TR ,PRSI>)
	       (<FSET? ,PRSI ,ACTORBIT>
		<TELL ,HUH>)
	       (<AND <G? <- <+ <WEIGHT ,PRSI> <WEIGHT ,PRSO>>
			    <GETP ,PRSI ,P?SIZE>>
		    	 <GETP ,PRSI ,P?CAPACITY>>
		     <NOT <ULTIMATELY-IN? ,PRSO ,PRSI>>>
		<TELL "There's no room ">
		<COND (<FSET? ,PRSI ,SURFACEBIT>
		       <TELL "on">)
		      (T
		       <TELL "in">)>
		<TELL T ,PRSI " for" TR ,PRSO>)
	       (<AND <NOT <ULTIMATELY-IN? ,PRSO>>
		     <EQUAL? <ITAKE> ,M-FATAL <>>>
		<RTRUE>)
	       ;(<AND <OR <PRSO? ,TORCH>
			 <ULTIMATELY-IN? ,TORCH ,PRSO>>
		     <FSET? ,TORCH ,ONBIT>
		     <PRSI? ,BASKET ,SACK>>
		<DO-FIRST "extinguish" ,TORCH>)
	       ;(<IN? ,PRSI ,ODD-MACHINE>
		<TELL ,ONLY-ONE-THING-IN-COMPARTMENT>)
	       (T
		<MOVE ,PRSO ,PRSI>
		<FSET ,PRSO ,TOUCHBIT>
		<TELL "Done" ,PERIOD-CR>)>>

<ROUTINE V-PUT-AGAINST ()
	 <WASTES>>

<ROUTINE V-PUT-BEHIND ()
	 <WASTES>>

<ROUTINE V-PUT-NEAR ()
	 <WASTES>>

<ROUTINE V-PUT-ON ()
	 <COND (<PRSI? ,ME>
		<PERFORM ,V?WEAR ,PRSO>
		<RTRUE>)
	       (<FSET? ,PRSI ,SURFACEBIT>
		<V-PUT>)
	       (T
		<TELL "There's no good surface on" TR ,PRSI>)>>

<ROUTINE V-PUT-THROUGH ()
	 <COND (<FSET? ,PRSI ,DOORBIT>
		<COND (<FSET? ,PRSI ,OPENBIT>
		       <V-THROW>)
		      (T
		       <DO-FIRST "open" ,PRSI>)>)
	       (<AND <PRSI? <LOC ,PROTAGONIST>>
		     <EQUAL? ,P-PRSA-WORD ,W?THROW ,W?TOSS ,W?HURL>>
		<SETG PRSI <>>
		<V-THROW>)
	       (T
	 	<IMPOSSIBLES>)>>

<ROUTINE V-PUT-TO ()
	 <RECOGNIZE>>

<ROUTINE V-PUT-UNDER ()
         <WASTES>>

<ROUTINE V-RAISE ()
	 <HACK-HACK "Playing in this way with">>

;<ROUTINE PRE-RAKE ()
	 <COND (<NOT <ULTIMATELY-IN? ,RAKE>>
		<TELL ,ONLY-WITH-A-RAKE>)>>

;<ROUTINE V-RAKE ()
	 <COND (<NOT ,PRSI>
		<SETG PRSI ,RAKE>)>
	 <COND (<PRSI? ,RAKE>
		<TELL "You'll never make it as a gardener" ,PERIOD-CR>)
	       (T
		<TELL ,ONLY-WITH-A-RAKE>)>>

<ROUTINE V-RAPE ()
	 <TELL "Unacceptably ungallant behavior" ,PERIOD-CR>>

<ROUTINE V-REACH-IN ("AUX" OBJ)
	 <SET OBJ <FIRST? ,PRSO>>
	 <COND (<OR <FSET? ,PRSO ,ACTORBIT>
		    <FSET? ,PRSO ,SURFACEBIT>
		    <NOT <FSET? ,PRSO ,CONTBIT>>>
		<YUKS>)
	       (<NOT <FSET? ,PRSO ,OPENBIT>>
		<DO-FIRST "open" ,PRSO>)
	       (<OR <NOT .OBJ>
		    <FSET? .OBJ ,INVISIBLE>
		    <NOT <FSET? .OBJ ,TAKEBIT>>>
		<TELL ,THERES-NOTHING "in" TR ,PRSO>)
	       (T
		<TELL "You feel something inside" TR ,PRSO>)>>

<ROUTINE V-READ ()
	 <COND (<FSET? ,PRSO ,READBIT>
		<TELL <GETP ,PRSO ,P?TEXT> CR>)
               (T
                <CANT-VERB-A-PRSO "read">)>>

<ROUTINE V-RELIEVE ()
	 <TELL ,HUH>>

<ROUTINE V-REMOVE ()
	 <COND (<WEARABLE? ,PRSO>
		<PERFORM ,V?TAKE-OFF ,PRSO>
		<RTRUE>)
	       ;(<AND <PRSO? ,HANDS>
		     ,HAND-COVER>
		<PERFORM ,V?UNCOVER ,HAND-COVER>
		<RTRUE>)
	       ;(<AND <PRSO? ,HANDS>
		     ,RAFT-HELD>
		<PERFORM ,V?DROP ,RAFT>
		<RTRUE>)
	       (T
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)>>

<ROUTINE V-REPAIR ()
	 <TELL 
"Repairing" T ,PRSO " is a job better left to professionals" ,PERIOD-CR>>

<ROUTINE V-RETURN ("AUX" ACTOR)
	 <COND (<NOT ,PRSI>
		<COND (<SET ACTOR <FIND-IN ,HERE ,ACTORBIT "to">>
		       <PERFORM ,V?GIVE ,PRSO .ACTOR>
		       <RTRUE>)
		      (T
		       <NO-ONE-HERE "return it to">)>)
	       (<FSET? ,PRSI ,ACTORBIT>
		<PERFORM ,V?GIVE ,PRSO ,PRSI>
		<RTRUE>)
	       (T
		<PERFORM ,V?PUT ,PRSO ,PRSI>
		<RTRUE>)>>

<ROUTINE V-RIP ()
	 <COND (<PRSO? ,SCRAP-OF-PAPER>
		<WASTES>)
	       (T
	 	<TELL "Unrippable" ,PERIOD-CR>)>>

<ROUTINE V-ROLL ()
	 <YUKS>>

<ROUTINE V-RUB ()
	 <PERFORM ,V?TOUCH ,PRSI ,PRSO>
	 <RTRUE>>

<ROUTINE V-SAVE-SOMETHING ()
	 <TELL "Sorry, but" T ,PRSO " is beyond help" ,PERIOD-CR>>

<ROUTINE V-SAY ("AUX" V)
	 <COND (<AND ,AWAITING-REPLY
		     <YES-WORD <GET ,P-LEXV ,P-CONT>>>
		<V-YES>
		<STOP>)
	       (<AND ,AWAITING-REPLY
		     <NO-WORD <GET ,P-LEXV ,P-CONT>>>
		<V-NO>
		<STOP>)
	       (<SET V <FIND-IN ,HERE ,ACTORBIT>>
		<TELL "You must address" T .V " directly" ,PERIOD-CR>
		<STOP>)
	       (T
		<PERFORM ,V?TELL ,ME>
		<STOP>)>>

<ROUTINE V-SCREW ()
	 <COND (<EQUAL? ,GAME-FLAG 2>
		<PERFORM ,V?FUCK ,PRSO>)
	       (T
		<TELL "You're the one with a few screws loose" ,PERIOD-CR>)>>

<ROUTINE V-UNSCREW ()
	 <TELL ,YOU-CANT "unscrew that." CR>>

<ROUTINE V-UNSCREW-FROM ()
	 <TELL ,YOU-CANT "unscrew that." CR>>

<ROUTINE V-SCORE ("AUX" ACTOR) ;"old fashioned V-SCORE is now V-STATUS"
	 <COND (<NOT <EQUAL? ,GAME-FLAG 2>>
		<TELL-SCORE>)
	       (<EQUAL? ,NAUGHTY-LEVEL 0>
		<V-STATUS>)
	       (,PRSO
		<PERFORM ,V?FUCK ,PRSO>
		<RTRUE>)
	       (<SET ACTOR <FIND-IN <LOC ,PROTAGONIST> ,ACTORBIT "with">>
		<PERFORM ,V?FUCK .ACTOR>
		<RTRUE>)
	       (T
		<NO-ONE-HERE "score with">)>>

<ROUTINE V-SEARCH ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<V-SHAKE>)
	       (<IN? ,PROTAGONIST ,PRSO>
		<DESCRIBE-VEHICLE>)
	       (<AND <FSET? ,PRSO ,CONTBIT>
		     <NOT <FSET? ,PRSO ,OPENBIT>>>
		<DO-FIRST "open" ,PRSO>)
	       (<FSET? ,PRSO ,CONTBIT>
		<TELL "You find">
		<COND ;(<EQUAL? ,GAME-FLAG 1>
		       <TELL " ">
		       <PRINT-CONT ,PRSO>)
		      (<NOT <DESCRIBE-NOTHING ,PRSO>>
		       <TELL ,PERIOD-CR>)>
		<RTRUE>)
	       (T
		<CANT-VERB-A-PRSO "search">)>>

<ROUTINE V-SET ()
	 <COND (<PRSO? ,ROOMS>
		<WEE>)
	       ;(<AND <PRSO? ,INTDIR>
		     <EQUAL? <LOC ,PROTAGONIST> ,BARGE ,RAFT>>
		<PERFORM-PRSA <LOC ,PROTAGONIST> ,INTNUM>
		<RTRUE>)
	       (<NOT ,PRSI>
		<COND (<FSET? ,PRSO ,TAKEBIT>
		       <HACK-HACK "Turning">)
		      (T
		       <TELL ,YNH TR ,PRSO>)>)
	       (T
		<IMPOSSIBLES>)>>

<ROUTINE V-SGIVE ()
	 <PERFORM ,V?GIVE ,PRSI ,PRSO>
	 <RTRUE>>

<ROUTINE V-SHAKE ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<TELL "That wouldn't be polite" ,PERIOD-CR>)
	       (T
		<HACK-HACK "Shaking">)>>

<ROUTINE V-SHAKE-WITH ()
	 <COND (<NOT <PRSO? ,HANDS>>
		<RECOGNIZE>)
	       (<NOT <FSET? ,PRSI ,ACTORBIT>>
		<TELL "I don't think" T ,PRSI " even has hands" ,PERIOD-CR>)
	       (T
		<PERFORM ,V?THANK ,PRSI>
		<RTRUE>)>>

<ROUTINE V-SHIT ("OPTIONAL" (NUMBER-ONE <>))
	 <COND (<LGOP?>
	 	<TELL "You don't have to go ">
	 	<COND (.NUMBER-ONE
		       <TELL "wee-wee">)
	       	      (T
		       <TELL "poo-poo">)>
	 	<TELL " at the moment" ,PERIOD-CR>)>
	 <RTRUE>>

<ROUTINE V-SHOW ()
	 <TELL "It doesn't look like" T ,PRSI " is interested" ,PERIOD-CR>>

<ROUTINE V-SHUT-UP ()
	 <COND (<PRSO? ,ROOMS>
		<TELL "[I hope you're not addressing me...]" CR>)
	       (T
		<PERFORM ,V?CLOSE ,PRSO>
		<RTRUE>)>>

<ROUTINE V-SIGH ()
	 <TELL "\"Ahhhh...\"" CR>>

<ROUTINE V-SINK ()
	 <IMPOSSIBLES>>

<ROUTINE V-SIT ("AUX" VEHICLE)
	 <COND (<SET VEHICLE <FIND-IN ,HERE ,VEHBIT>>
		<PERFORM ,V?BOARD .VEHICLE>
		<RTRUE>)
               (T
		<WASTES>)>>

<ROUTINE V-SLEEP ()
	 <TELL "You're not tired" ,PERIOD-CR>>

;<ROUTINE PRE-SMELL ()
	 <COND (<FSET? ,NOSE ,MUNGBIT>
		<TELL ,YOU-CANT "smell a thing with " 'NOSE " blocked" ,PERIOD-CR>)>>

<ROUTINE V-SMELL ()
	 <COND (<NOT ,PRSO>
		<PERFORM-PRSA ,ODOR>
		<RTRUE>)
	       (T
		<SENSE-OBJECT "smell">)>>

<ROUTINE SENSE-OBJECT (STRING)
	 <PRONOUN>
	 <TELL " " .STRING>
	 <COND (<AND <NOT <FSET? ,PRSO ,PLURALBIT>>
		     <NOT <PRSO? ,ME>>>
		<TELL "s">)>
	 <TELL " just like" AR ,PRSO>>

<ROUTINE V-SPUT-ON ()
         <PERFORM ,V?PUT-ON ,PRSI ,PRSO>
	 <RTRUE>>

<ROUTINE V-SRUB ()
	 <PERFORM ,V?RUB ,PRSI ,PRSO>
	 <RTRUE>>

<ROUTINE V-SSHOW ()
	 <PERFORM ,V?SHOW ,PRSI ,PRSO>
	 <RTRUE>>

<ROUTINE V-STAND ()
	 <COND (<EQUAL? ,P-PRSA-WORD ,W?HOLD> ;"for HOLD UP OBJECT"
		<WASTES>)
	       ;(<AND <EQUAL? ,P-PRSA-WORD ,W?GET>
		     <PRSO? ,ROOMS>
		     <EQUAL? ,HERE ,INNER-HAREM ,BOUDOIR>
		     <EQUAL? ,NAUGHTY-LEVEL 2>
		     ,MALE>
		<TELL ,YOURE-ALREADY "quite hard" ,PERIOD-CR>)
	       (<FSET? <LOC ,PROTAGONIST> ,VEHBIT>
		<PERFORM ,V?DISEMBARK <LOC ,PROTAGONIST>>
		<RTRUE>)
	       (<AND ,PRSO
		     <FSET? ,PRSO ,TAKEBIT>>
		<WASTES>)
	       ;(<AND <EQUAL? ,HERE ,INNER-HAREM>
		     <NOT <EQUAL? ,NAUGHTY-LEVEL 0>>>
		<TELL D ,SULTANS-WIFE " tugs you back down" ,PERIOD-CR>)
	       (T
		<TELL ,YOURE-ALREADY "standing" ,PERIOD-CR>)>>

<ROUTINE V-STAND-ON ()
	 <COND (<PRSO? ,STOOL>
		<PERFORM ,V?BOARD ,STOOL>
		<RTRUE>)
	       (T
	  	<WASTES>)>>

<ROUTINE V-STELL ()
	 <PERFORM ,V?TELL ,PRSI>
	 <RTRUE>>

<ROUTINE V-STHROW ()
	 <PERFORM ,V?THROW-TO ,PRSI ,PRSO>
	 <RTRUE>>

<ROUTINE V-SUCK ()
	 <COND (<OR <FSET? ,PRSO ,ACTORBIT>
		    <EQUAL? ,NAUGHTY-LEVEL 0>>
		<PERFORM ,V?EAT ,PRSO>
		<RTRUE>)
	       (T
		<COND (<LGOP?>
		       <SETG AWAITING-REPLY 2>
		       <QUEUE I-REPLY 2>
		       <TELL "Done. Some turn-on, huh?" CR>)>
		<RTRUE>)>>

<ROUTINE V-SUCKLE ()
	 <IMPOSSIBLES>>

<ROUTINE V-SWIM ()
	 <COND (<OR <PRSO? ,WATER>
		    <AND <NOT ,PRSO>
		    	 <GLOBAL-IN? ,WATER ,HERE>>>
		<TELL "This is no time for">)
	       (T
		<TELL "Your head must be">)>
	 <TELL " swimming" ,PERIOD-CR>>

<ROUTINE V-SWING ()
	 <COND (,PRSI
		<PERFORM ,V?KILL ,PRSI ,PRSO>
		<RTRUE>)
	       (T
		<TELL "\"Whoosh.\"" CR>)>>

<ROUTINE V-SWRAP ()
	 <PERFORM ,V?WRAP ,PRSI ,PRSO>
	 <RTRUE>>

<ROUTINE PRE-TAKE ()
	 <COND ;(<AND <PRSO? ,HANDS>
		     ,PRSI
		     <PRSI? ,HAND-COVER>>
		<PERFORM ,V?UNCOVER ,HAND-COVER>
		<RTRUE>)
	       (<AND <NOT <FSET? ,PRSO ,PARTBIT>>
		     <PLAYER-CANT-SEE>>
		<RTRUE>)
	       (<LOC-CLOSED>
		<RTRUE>)
	       (<IN? ,PROTAGONIST ,PRSO>
		<TELL "You can't while you're ">
		<COND ;(<FSET? ,PRSO ,INBIT>
		       <TELL "i">)
		      (T
		       <TELL "o">)>
		<TELL "n it." CR>)
	       (<OR <IN? ,PRSO ,PROTAGONIST>
		    <AND <ULTIMATELY-IN? ,PRSO>
			 <NOT <FSET? ,PRSO ,TAKEBIT>>>>
		<COND (<AND <PRSO? ,COMIC-BOOK>
			    <PRSI? ,POCKET>>
		       <RFALSE>)
		      (<FSET? ,PRSO ,WORNBIT>
		       <TELL ,YOURE-ALREADY "wearing">)
		      (T
		       <TELL "You already have">)>
		<TELL T ,PRSO ,PERIOD-CR>)
	       ;(<AND ,HAND-COVER
		     <NOT <PRSO? ,EYES ,EARS, NOSE>>>
		<TELL
,YOU-CANT "pick up anything while using " 'HANDS "s to cover" TR ,HAND-COVER>)
	       (<NOT ,PRSI>
		<RFALSE>)
	       (<IN? ,PRSO ,PRSI>
		<RFALSE>)
	       (<PRSO? ,ME>
		<PERFORM ,V?DROP ,PRSI>
		<RTRUE>)
	       (<NOT <IN? ,PRSO ,PRSI>>
		<NOT-IN>)
	       (T
		<SETG PRSI <>>
		<RFALSE>)>>

<ROUTINE V-TAKE ()
	 <COND (<EQUAL? <ITAKE> T>
		<TELL "Taken" ,PERIOD-CR>
		<COND (<AND <G? <GETP ,PRSO ,P?VALUE> 0>
		     	    <NOT <FSET? ,PRSO ,SCOREDBIT>>>
		       <UPDATE-SCORE <GETP ,PRSO ,P?VALUE> T>
		       <FSET ,PRSO ,SCOREDBIT>)>
		<COND (<AND <ULTIMATELY-IN? ,EGG ,PRSO>
		     	    <NOT <FSET? ,EGG ,SCOREDBIT>>>
		       <UPDATE-SCORE <GETP ,EGG ,P?VALUE> T>
		       <FSET ,EGG ,SCOREDBIT>)>)>>

<ROUTINE V-TAKE-A-LEAK ()
	 <COND (<PRSO? ,ROOMS>
		<V-PEE>)
	       (T
		<RECOGNIZE>)>>

<ROUTINE V-TAKE-A-SHIT ()
	 <COND (<PRSO? ,ROOMS>
		<V-SHIT>)
	       (T
		<RECOGNIZE>)>>

<ROUTINE V-TAKE-OFF ()
	 <COND (<PRSO? ,ROOMS>
		<COND (<EQUAL? ,P-PRSA-WORD ,W?GET>
		       <COND (<FSET? <LOC ,PROTAGONIST> ,VEHBIT>
			      <TELL "[of" T <LOC ,PROTAGONIST> "]" CR CR>
			      <PERFORM ,V?DISEMBARK <LOC ,PROTAGONIST>>
			      <RTRUE>)
			     (<EQUAL? ,NAUGHTY-LEVEL 0>
			      <V-STAND>)
			     (T
			      <PERFORM ,V?FUCK ,ME>
			      <RTRUE>)>)
		      (T
		       <YUKS>)>)
	       (<FSET? ,PRSO ,WORNBIT>
		<FCLEAR ,PRSO ,WORNBIT>
		<TELL "Okay, you're no longer wearing" TR ,PRSO>)
	       (<FSET? ,PRSO ,VEHBIT>
		<PERFORM ,V?DISEMBARK ,PRSO>
		<RTRUE>)
	       (T
		<TELL "You aren't wearing" TR ,PRSO>)>>

<ROUTINE V-TAKE-WITH ()
	 <TELL "Sorry," T ,PRSI " is no help in getting" TR ,PRSO>>

<ROUTINE V-TASTE ()
	 <SENSE-OBJECT "taste">>

<ROUTINE V-TELL ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
      		<COND (,P-CONT
		       <SETG WINNER ,PRSO>
		       <SETG CLOCK-WAIT T>
		       <RTRUE>)
		      (T
		       <TELL
"Hmmm ..." T ,PRSO " looks at you expectantly,
as if you seemed to be about to talk" ,PERIOD-CR>)>)
	       (T
		<CANT-VERB-A-PRSO "talk to">
		<STOP>)>>

<ROUTINE V-TELL-ABOUT ()
	 <COND (<PRSO? ,ME>
		<PERFORM ,V?WHAT ,PRSI>
		<RTRUE>)
	       (T
		<PERFORM ,V?SHOW ,PRSI ,PRSO>
		<RTRUE>)>>

<ROUTINE V-THANK ()
	 <COND (<NOT ,PRSO>
		<TELL "[Just doing my job.]" CR>)
	       (<FSET? ,PRSO ,ACTORBIT>
		<TELL "\"You're welcome.\"" CR>)
	       (T
		<IMPOSSIBLES>)>>

<ROUTINE V-THROW ()
	 <COND (<PRSI? ,GROUND>
		<PERFORM ,V?DROP ,PRSO>)
	       (,PRSI
		<MOVE ,PRSO ,HERE>
		<TELL "You missed" ,PERIOD-CR>)
	       (T
		<MOVE ,PRSO ,HERE>
		<TELL "Thrown" ,PERIOD-CR>)>>

<ROUTINE V-THROW-TO ()
	 <COND (<FSET? ,PRSI ,ACTORBIT>
		<PERFORM ,V?GIVE ,PRSO ,PRSI>
		<RTRUE>)
	       (T
		<PERFORM ,V?THROW ,PRSO ,PRSI>
		<RTRUE>)>>

<ROUTINE V-THROW-UP ()
	 <COND (<PRSO? ,ROOMS>
		<V-VOMIT>)
	       (T
		<PERFORM ,V?THROW ,PRSO>
		<RTRUE>)>>

<ROUTINE V-TIE ()
	 <COND (<AND <OR <FSET? ,PRSO ,ACTORBIT>
			 <FSET? ,PRSI ,ACTORBIT>>
		     <NOT <EQUAL? ,NAUGHTY-LEVEL 0>>>
		<TELL "Kinky!" CR>
		<RTRUE>)
	       (<AND <EQUAL? ,P-PRSA-WORD ,W?TIE>
		     <EQUAL? ,GAME-FLAG 2>>
		<TELL
"You've tied" T ,PRSO "! In the third quarter, with forty seconds on the
clock, the score is " D ,PRSO " 17, player 17!!! But seriously, folks, y">)
	       (T <TELL "Y">)>
	 <TELL "ou can't tie" TR ,PRSO>>

<ROUTINE V-TIE-TOGETHER ()
	 <IMPOSSIBLES>>

<ROUTINE V-TIME ()
	 <COND (<TRINITY?>
		<PERFORM ,V?EXAMINE ,WRISTWATCH>)>>

<ROUTINE PRE-TOUCH ()
	 <COND (<UNTOUCHABLE? ,PRSO>
		<CANT-REACH ,PRSO>)>>

<ROUTINE V-TOUCH ()
	 <COND (<LOC-CLOSED>
		<RTRUE>)
	       (<EQUAL? ,NAUGHTY-LEVEL 0>
		<HACK-HACK "Touching">)
	       (T
		<HACK-HACK "Fondling">)>>

<ROUTINE V-UNCOVER ()
	 <COND ;(<PRSO? ,HAND-COVER>
		<SENSE-AGAIN ,HAND-COVER>
		<SETG HAND-COVER <>>
		<RTRUE>)
	       (<FSET? ,PRSO ,ACTORBIT>
		<PERFORM ,V?UNDRESS ,OBJECT>
		<RTRUE>)
	       (T
		<COND (<FSET? ,PRSO ,PLURALBIT>
		       <TELL "They're">)
		      (<AND <FSET? ,PRSO ,FEMALEBIT>
			    <FSET? ,PRSO ,ACTORBIT>>
		       <TELL "She's">)
		      (<FSET? ,PRSO ,ACTORBIT>
		       <TELL "He's">)
		      (T
		       <TELL "It's">)>
		<TELL " not covered." CR>)>>

;<ROUTINE SENSE-AGAIN (BODY-PART) 
	 <FCLEAR .BODY-PART ,MUNGBIT>
	 <TELL "You can once again sense with" TR .BODY-PART>>

<ROUTINE V-UNDRESS ()
	 <COND (,PRSO
		<COND (<FSET? ,PRSO ,ACTORBIT>
		       <PERFORM ,V?FUCK ,PRSO>
		       <RTRUE>)
		      (T
		       <IMPOSSIBLES>)>)
	       (T
		<SETG PRSO ,ROOMS>
		<V-GET-UNDRESSED>)>>

<ROUTINE V-UNLOCK-WITH-HANDS ()
	 <TELL "[With " D ,HANDS "s]" CR CR>
	 <PERFORM ,V?UNLOCK ,PRSO ,HANDS>> 

<ROUTINE V-UNLOCK ()
	 <COND (,PRSI
		<IMPOSSIBLES>)
	       (<FSET? ,PRSO ,DOORBIT>
		<TELL "But" T ,PRSO " isn't locked" ,PERIOD-CR>)
	       (T
		<YUKS>)>>

<ROUTINE V-UNROLL ()
	 <IMPOSSIBLES>>

<ROUTINE V-UNTIE ()
	 <IMPOSSIBLES>>

<ROUTINE V-USE ()
	 <TELL
,YOULL-HAVE-TO "be more specific about how you want to use" TR ,PRSO>>

<ROUTINE V-USE-QUOTES ()
	 <TELL
"If you don't want to address a character, but instead would like to just say
something aloud, type SAY \"<something>\".">>

<ROUTINE V-VOMIT ()
	 <COND (<LGOP?>
		<COND (<AND <IN? ,PIZZA ,HERE>
		     	    <FSET? ,PIZZA ,TOUCHBIT>>
		       <TELL 
"Just keep trying to eat that " D ,PIZZA ,PERIOD-CR>)
	       	      (T
		       <TELL
"You stick a finger down your throat, but to no avail" ,PERIOD-CR>)>)>
	 <RTRUE>>

<ROUTINE V-WALK ("AUX" AV VEHICLE PT PTS STR OBJ RM)
	 <SET AV <LOC ,PROTAGONIST>>
	 <COND (<NOT ,P-WALK-DIR>
		<PERFORM ,V?WALK-TO ,PRSO>
		<RTRUE>)
	       (<AND <PRSO? ,P?OUT>
		     <IN-EXITABLE-VEHICLE?>>
		<RTRUE>)
	       (<AND <PRSO? ,P?DOWN>
		     <EQUAL? .AV ,STOOL>>
		<PERFORM ,V?DISEMBARK .AV>
		<RTRUE>)
	       (<AND <PRSO? ,P?IN>
		     <NOT <GETPT ,HERE ,P?IN>>
		     <SET VEHICLE <FIND-IN ,HERE ,VEHBIT>>
		     <NOT <ULTIMATELY-IN? .VEHICLE>>>
		<PERFORM ,V?BOARD .VEHICLE>
		<RTRUE>)
	       (,IN-PRAM?
		<MOVE ,PROTAGONIST ,PRAM>
		<NOT-GOING-ANYWHERE>
		<MOVE ,PROTAGONIST ,HERE>
		<RFATAL>)
	       (<FSET? .AV ,VEHBIT>
      		<NOT-GOING-ANYWHERE>)
	       ;(<OR <FSET? ,EYES ,MUNGBIT>
		    <EQUAL? ,HAND-COVER ,EYES>>
		<OPEN-YOUR-EYES!>
		<RFATAL>)
	       (<SET PT <GETPT ,HERE ,PRSO>>
		<COND (<EQUAL? <SET PTS <PTSIZE .PT>> ,UEXIT>
		       <GOTO <GETB .PT ,REXIT>>)
		      (<EQUAL? .PTS ,NEXIT>
		       <TELL <GET .PT ,NEXITSTR> CR>
		       <RFATAL>)
		      (<EQUAL? .PTS ,FEXIT>
		       <COND (<SET RM <APPLY <GET .PT ,FEXITFCN>>>
			      <COND (<EQUAL? .RM ,ROOMS> ;"catacombs fake-move"
				     <RTRUE>)>
			      <GOTO .RM>)
			     (T
			      <RFATAL>)>)
		      (<EQUAL? .PTS ,CEXIT>
		       <COND (<VALUE <GETB .PT ,CEXITFLAG>>
			      <GOTO <GETB .PT ,REXIT>>)
			     (<SET STR <GET .PT ,CEXITSTR>>
			      <TELL .STR CR>
			      <RFATAL>)
			     (T
			      <COND (<NOT <GRUE-KILL?>>
			      	     <TELL ,CANT-GO>
			      	     <RFATAL>)>)>)
		      (<EQUAL? .PTS ,DEXIT>
		       <COND (<FSET? <SET OBJ <GETB .PT ,DEXITOBJ>> ,OPENBIT>
			      <GOTO <GETB .PT ,REXIT>>)
			     (<SET STR <GET .PT ,DEXITSTR>>
			      <THIS-IS-IT .OBJ>
			      <TELL .STR CR>
			      <RFATAL>)
			     (T
			      <THIS-IS-IT .OBJ>
			      <DO-FIRST "open" .OBJ>
			      <RFATAL>)>)>)
	       (T
		<COND (<PRSO? ,P?OUT ,P?IN>
		       <V-WALK-AROUND>)
		      ;(<OR <EQUAL? ,HERE ,WELL-BOTTOM ,FORGOTTEN-STOREHOUSE>
			   <EQUAL? ,HERE ,BURIAL-CHAMBER ,LADDER-ROOM>>
		       <TELL
"You wade into the dark, but find no passage in that direction" ,PERIOD-CR>)
		      (T
		       <COND (<NOT <GRUE-KILL?>>
		       	      <TELL ,CANT-GO>
		       	      <RFATAL>)>)>)>>

<ROUTINE GRUE-KILL? ()
	 <COND (<AND <NOT ,LIT>
	             <EQUAL? ,GAME-FLAG 1>
		     ,GRUE-DEATH>
		     <JIGS-UP
"Oh, no! You have walked into the slavering fangs of a lurking grue!">)
	       (T
		<RFALSE>)>>

<ROUTINE NOT-GOING-ANYWHERE ("AUX" AV)
	 <SET AV <LOC ,PROTAGONIST>>
	 <TELL "You're not going anywhere until you get ">
	 <COND (<OFF-VEHICLE? .AV>
		<TELL "off">)
	       (T
		<TELL "out of">)>
	 <TELL TR .AV>
	 <RFATAL>>

<ROUTINE V-WALK-AROUND ()
	 <SETG AWAITING-REPLY 2>
	 <QUEUE I-REPLY 2>
	 <TELL "Did you have any particular direction in mind?" CR>>

<ROUTINE V-WALK-TO ()
	 <COND (<EQUAL? ,PRSO ,INTDIR>
		<DO-WALK ,P-DIRECTION>)
	       (T
		<V-WALK-AROUND>)>>

<ROUTINE V-WAIT ("OPTIONAL" (NUM 3))
	 <COND (<EQUAL? ,GAME-FLAG 3>
		<SET NUM 4>)>
	 <TELL "Time passes.." ,PERIOD-CR>
	 <REPEAT ()
		 <COND (<L? <SET NUM <- .NUM 1>> 0>
			<RETURN>)
		       (<CLOCKER>
			<RETURN>)>>
	 <SETG CLOCK-WAIT T>>

<ROUTINE V-WAIT-FOR ()
	 <COND (<VISIBLE? ,PRSO>
		<V-FOLLOW>)
	       (T
	 	<TELL "You may be waiting quite a while" ,PERIOD-CR>)>>

<ROUTINE V-WAVE ()
	 <TELL "How nice" ,PERIOD-CR>>

<ROUTINE V-WEAR ()
         <COND (<NOT <WEARABLE? ,PRSO>>
		<CANT-VERB-A-PRSO "wear">)
	       (T
		<TELL "You're ">
		<COND (<FSET? ,PRSO ,WORNBIT>
		       <TELL "already">)
		      (T
		       <MOVE ,PRSO ,PROTAGONIST>
		       <FSET ,PRSO ,WORNBIT>
		       <TELL "now">)>
		<TELL " wearing" TR ,PRSO>)>>

<ROUTINE V-WHAT ()
	 <TELL "Good question" ,PERIOD-CR>>

<ROUTINE V-WHERE ()
	 <V-FIND T>>

<ROUTINE V-WHIP ()
	 <COND (<EQUAL? ,NAUGHTY-LEVEL 0>
		<V-KILL>)
	       (T
	 	<TELL "Oooo! S & M! Love it!!!" CR>)>>

<ROUTINE V-WRAP ()
	 <WASTES>>

<ROUTINE V-YELL ()
	 <SORE "throat">
	 <STOP>>

<ROUTINE I-REPLY ()
	 <SETG AWAITING-REPLY <>>
	 <RFALSE>>

<GLOBAL AWAITING-REPLY <>>

<ROUTINE V-YES ()
	 <COND (<EQUAL? ,AWAITING-REPLY 2>
		<TELL "That was just a rhetorical question" ,PERIOD-CR>)
	       (<EQUAL? ,AWAITING-REPLY 3>
		<V-PEE-IN>) 
	       (T
	 	<YOU-SOUND "posi">)>>

<ROUTINE YOU-SOUND (STRING)
	 <TELL "You sound rather " .STRING "tive" ,PERIOD-CR>>

<ROUTINE YES-WORD (WRD)
	 <COND (<OR <EQUAL? .WRD ,W?YES ,W?Y ,W?YUP>
		    <EQUAL? .WRD ,W?OK ,W?OKAY ,W?SURE>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

;"subtitle object manipulation"

<ROUTINE ITAKE ("OPTIONAL" (VB T) "AUX" ;CNT OBJ)
	 <COND (<NOT <FSET? ,PRSO ,TAKEBIT>>
		<COND (.VB
		       <YUKS>)>
		<RFATAL>)
	       (<PRE-TOUCH>
		<RFATAL>)
	       ;(<AND <NOT <ULTIMATELY-IN? ,PRSO>>
		     <G? <+ <WEIGHT ,PRSO> <WEIGHT ,PROTAGONIST>> 100>>
		<COND (.VB
		       <TELL
"It's too heavy, considering your current load" ,PERIOD-CR>)>
		<RFATAL>)
	       (<G? <CCOUNT ,PROTAGONIST> 10>
		<COND (.VB
		       <TELL
,YOURE-ALREADY "juggling as many items as you could possibly carry" ,PERIOD-CR>)>
		<RFATAL>)>
	 <FSET ,PRSO ,TOUCHBIT>
	 <COND (<PRSO? BONE>
		<SETG PRINT-CANT-REACH <>>)>
	 <FCLEAR ,PRSO ,NDESCBIT>
	 <COND (<IN? ,PROTAGONIST ,PRSO>
		<RFALSE> ;"Hope this is right -- pdl 4/22/86")>
	 <COND (<IN? ,PRSO ,TROPHY-CASE>
		<COND (<ULTIMATELY-IN? ,EGG ,PRSO>
		       <SETG SCORE <- ,SCORE <GETP ,EGG ,P?TVALUE>>>)
		      (T
		       <SETG SCORE <- ,SCORE <GETP ,PRSO ,P?TVALUE>>>)>)>
	 <MOVE ,PRSO ,PROTAGONIST>
	 <RTRUE>>

;"IDROP is called by PRE-GIVE and PRE-PUT.
  IDROP acts directly as PRE-DROP, PRE-THROW and PRE-PUT-THROUGH."

<ROUTINE IDROP ()
	 <COND (<PRSO? ,COCK ,CUNT ,TITS>
		<RFALSE>)
	       (<PRSO? ,POCKET>
		<IMPOSSIBLES>)
	       (<PRSO? ,HANDS>
		<COND (<VERB? DROP THROW GIVE>
		       <IMPOSSIBLES>)
		      (T
		       <RFALSE>)>)
	       (<AND <PRSO? ,HEAD>
		     <VERB? PUT>
		     <PRSI? ,HOLE>>
		<TELL "Hey wow! Vertigo city!" CR>)
	       (<AND <PRSO? ,ME>
		     <VERB? PUT>
		     <FSET? ,PRSI ,ACTORBIT>>
		<PERFORM ,V?BOARD ,PRSI>
		<RTRUE>)
	       (<AND <PRSI? ,ME>
		     <VERB? PUT>
		     <FSET? ,PRSO ,ACTORBIT>>
		<PERFORM ,V?BOARD ,PRSO>
		<RTRUE>)
	       ;(<AND <VERB? PUT PUT-THROUGH>
		     <PRSO? ,SHEET>
		     <PRSI? ,WINDOW>>
		<RFALSE>)
	       ;(<PRSO? ,HAND-COVER> ;"for LET GO OF NOSE"
		<PERFORM ,V?UNCOVER ,PRSO>
		<RTRUE>)
	       ;(<AND <PRSO? ,NOSE>
		     <PRSI? ,CLOTHES-PIN>> ;"for PUT NOSE IN PIN"
		<RFALSE>)
	       (<AND <EQUAL? ,GAME-FLAG 4>
		     <PRSO? ,ENVELOPE>>
		<TELL
"(You'd be better off keeping" T ,ENVELOPE ". It's your responsiblity to
deliver it safely to Festeron.)" CR>
		<RTRUE>)
	       (<AND <EQUAL? ,HERE ,IN-WATER>
		     <VERB? DROP>>
		<PERFORM ,V?PUT ,PRSO ,LWATER>)
	       ;(<AND <PRSO? ,BONE>
		     <EQUAL? ,HERE ,OUTSIDE-COTTAGE>
		     <VERB? DROP>>
		<PERFORM ,V?GIVE ,BONE ,POODLE>)
	       (<PRSO? ,COMIC-BOOK>
		<COND (<PRSI? ,POCKET>
		       <TELL ,ALREADY-IS>)
		      (T
		       <PERFORM ,V?REMOVE ,COMIC-BOOK>
		       <RTRUE>)>)
	       (<NOT <ULTIMATELY-IN? ,PRSO>>
		<COND (<OR <PRSO? ,ME>
			   <FSET? ,PRSO ,PARTBIT>>
		       <IMPOSSIBLES>)
		      ;(<AND <PRSO? ,SOD>
			    <PRSI? ,HOLE>>
		       <RFALSE>)
		      (T
		       <TELL
"That's easy for you to say since you don't even have" TR ,PRSO>)>
		<RFATAL>)
	       (<AND <NOT <IN? ,PRSO ,PROTAGONIST>>
		     <FSET? <LOC ,PRSO> ,CONTBIT>
		     <NOT <FSET? <LOC ,PRSO> ,OPENBIT>>>
		<DO-FIRST "open" <LOC ,PRSO>>)
	       (<FSET? ,PRSO ,WORNBIT>
		<DO-FIRST "remove" ,PRSO>)
	      ;(<EQUAL? ,HERE ,UP-A-TREE>
		<RTRUE>) 
	       (T
		<FSET ,PRSO ,TOUCHBIT>
		<RFALSE>)>>

<ROUTINE CCOUNT	(OBJ "AUX" (CNT 0) X)
	 <COND (<SET X <FIRST? .OBJ>>
		<REPEAT ()
			<COND (<NOT <FSET? .X ,WORNBIT>>
			       <SET CNT <+ .CNT 1>>)>
			<COND (<NOT <SET X <NEXT? .X>>>
			       <RETURN>)>>)>
	 .CNT>

;"Gets SIZE of supplied object, recursing to nth level."
<ROUTINE WEIGHT (OBJ "AUX" CONT (WT 0))
	 <COND (<SET CONT <FIRST? .OBJ>>
		<REPEAT ()
			<SET WT <+ .WT <WEIGHT .CONT>>>
			<COND (<NOT <SET CONT <NEXT? .CONT>>>
			       <RETURN>)>>)>
	 <+ .WT <GETP .OBJ ,P?SIZE>>>

;"subtitle describers"

<ROUTINE DO-PARAGRAPH ("OPTIONAL" (PRINT-CR T))
	 <COND (<EQUAL? ,GAME-FLAG 2>
		<TELL "   ">)
	       (T
		<COND (<OR .PRINT-CR <EQUAL? ,GAME-FLAG 3>
				     <EQUAL? ,GAME-FLAG 2>
				     <EQUAL? ,GAME-FLAG 4>>
		       <CRLF>)>)>>

<ROUTINE DESCRIBE-ROOM ("OPTIONAL" (VERB-IS-LOOK <>)
			"AUX" (FIRST-VISIT <>) (NUM 0))
	 <COND (<NOT ,LIT>
		<COND (<EQUAL? ,GAME-FLAG 1>
		       <TELL "It is pitch black.">
		       <DO-GRUE> <CRLF>
		       <RFALSE>)
		      (T
		       <TELL ,TOO-DARK>
		       <COND (<EQUAL? ,HERE ,CLOSET>
		       	      <TELL 
" There's a distinctive odor here, though.">)>
		       <CRLF>
		       <RFALSE> ;"so DESCRIBE-CONTENTS not called")>)>
	 <COND (<NOT <FSET? ,HERE ,TOUCHBIT>>
		<FSET ,HERE ,TOUCHBIT>
		<SET FIRST-VISIT T>)>
	 <TELL D ,HERE>
	 <COND (,IN-PRAM? <TELL ", in" T ,PRAM>)>
	 <COND (<FSET? <LOC ,PROTAGONIST> ,VEHBIT>
		     ;<NOT ,DONT-PRINT-VEHICLE>
		<TELL ", ">
		<COND ;(<FSET? <LOC ,PROTAGONIST> ,INBIT>
		       <TELL "i">)
		      (T
		       <TELL "o">)>
		<TELL "n" T <LOC ,PROTAGONIST>>)>
	 <CRLF>
	 <COND (<OR .VERB-IS-LOOK
		    <EQUAL? ,VERBOSITY 2>
		    <AND .FIRST-VISIT
			 <EQUAL? ,VERBOSITY 1>>>
		<DO-PARAGRAPH <>>
		<COND (<NOT <APPLY <GETP ,HERE ,P?ACTION> ,M-LOOK>>
		       <TELL <GETP ,HERE ,P?LDESC>>
		       <COND (<NOT <EQUAL? ,GAME-FLAG 2>>
			      <CRLF>)>)>
		<COND (<EQUAL? ,GAME-FLAG 2> <CRLF>)>)>
	 <RTRUE>>

;"Print FDESCs, then DESCFCNs and LDESCs, then everything else. DESCFCNs
must handle M-OBJDESC? by RTRUEing (but not printing) if the DESCFCN would
like to handle printing the object's description. RFALSE otherwise. DESCFCNs
are responsible for doing the beginning-of-paragraph indentation."

<ROUTINE DESCRIBE-OBJECTS ("AUX" O STR (1ST? T) (AV <LOC ,WINNER>))
	 <SET O <FIRST? ,HERE>>
	 <COND (<NOT .O>
		<RFALSE>)>
	 <REPEAT () ;"FDESCS and MISC."
		 <COND (<NOT .O>
			<RETURN>)
		       (<AND <DESCRIBABLE? .O>
			     <NOT <FSET? .O ,TOUCHBIT>>
			     <SET STR <GETP .O ,P?FDESC>>>
			<DO-PARAGRAPH <>>
			<TELL .STR>
			<COND (<FSET? .O ,CONTBIT>
			       <DESCRIBE-CONTENTS .O T <+ ,D-ALL? ,D-PARA?>>)>
			<CRLF>)>
		 <SET O <NEXT? .O>>>
	 <SET O <FIRST? ,HERE>>
	 <SET 1ST? T>
	 <REPEAT () ;"DESCFCNS"
		 <COND (<NOT .O>
			<RETURN>)
		       (<OR <NOT <DESCRIBABLE? .O>>
			    <AND <GETP .O ,P?FDESC>
				 <NOT <FSET? .O ,TOUCHBIT>>>>
			T)
		       (<AND <SET STR <GETP .O ,P?DESCFCN>>
			     <SET STR <APPLY .STR ,M-OBJDESC>>>
			<COND (<AND <FSET? .O ,CONTBIT>
				    <N==? .STR ,M-FATAL>>
			       <DESCRIBE-CONTENTS .O T <+ ,D-ALL? ,D-PARA?>>)>
			<CRLF>)
		       (<SET STR <GETP .O ,P?LDESC>>
			<DO-PARAGRAPH <>>
			<TELL .STR>
			<COND (<FSET? .O ,CONTBIT>
			       <DESCRIBE-CONTENTS .O T <+ ,D-ALL? ,D-PARA?>>)>
			<CRLF>)>
		 <SET O <NEXT? .O>>>
	 <DESCRIBE-CONTENTS ,HERE <> 0>
	 <COND (<AND .AV <NOT <EQUAL? ,HERE .AV>>>
		<DESCRIBE-CONTENTS .AV <> 0>)>>

<CONSTANT D-ALL? 1> ;"print everything?"
<CONSTANT D-PARA? 2> ;"started paragraph?"

"<DESCRIBE-CONTENTS ,OBJECT-WHOSE-CONTENTS-YOU-WANT-DESCRIBED
		    level: -1 means only top level
			    0 means top-level (include crlf)
			    1 for all other levels
			    or string to print
		    all?: t if not being called from room-desc >"

<ROUTINE DESCRIBE-CONTENTS (OBJ "OPTIONAL" (LEVEL -1) (ALL? ,D-ALL?)
			    "AUX" (F <>) N (1ST? T) (IT? <>)
			    (START? <>) (TWO? <>) (PARA? <>))
  <COND (<EQUAL? .LEVEL 2> ;"what is level 2?"
	 <SET LEVEL T>
	 <SET PARA? T>
	 <SET START? T>)
	(<BTST .ALL? ,D-PARA?>
	 <SET PARA? T>)>
  <SET N <FIRST? .OBJ>>
  <COND (<OR .START?
	     <IN? .OBJ ,ROOMS>
	     <FSET? .OBJ ,ACTORBIT>
	     <AND <FSET? .OBJ ,CONTBIT>
		  <OR <FSET? .OBJ ,OPENBIT>
		      <FSET? .OBJ ,TRANSBIT>>
		  <FSET? .OBJ ,SEARCHBIT>
		  .N>>
	 <REPEAT ()
	  <COND (<OR <NOT .N>
		     <AND <DESCRIBABLE? .N>
			  <OR <BTST .ALL? ,D-ALL?>
			      <SIMPLE-DESC? .N>>>>
		 <COND
		  (.F
		   <COND
		    (.1ST?
		     <SET 1ST? <>>
		     <COND (<EQUAL? .LEVEL <> T>
			    <COND (<NOT .START?>
				   <COND (<NOT .PARA?>
					  <COND (<NOT <EQUAL? .OBJ
							      ,PROTAGONIST>>
						;<TELL " 4 ">
						 <DO-PARAGRAPH <>>
;"4--You can see a foo here or Sitting on the foo is a... ")>
					  <SET PARA? T>)
					 (<EQUAL? .LEVEL T>
					  <TELL " ">)>
				   <COND (<EQUAL? .OBJ ,HERE>
					  <TELL ,YOU-SEE>)
					 (<EQUAL? .OBJ ,PROTAGONIST>
					  <TELL "You have">)
					 (<FSET? .OBJ ,SURFACEBIT>
					  <TELL "Sitting on" T .OBJ " is">)
					 (T
					  <TELL "It looks like" T .OBJ>
					  <COND (<FSET? .OBJ ,ACTORBIT>
						 <TELL " has">)
						(T
				     	         <TELL " contains">)>)>)>)
			   (<NOT <EQUAL? .LEVEL -1>>
			    <TELL .LEVEL>)>)
		    (T
		     <COND ;(<EQUAL? ,GAME-FLAG 1>
			    <TELL CR "  ">)
			   (.N
			    <TELL ",">)
			   (T
			    <TELL " and">)>)>
		   <TELL A .F>
		   <COND (<FSET? .F ,WORNBIT>
			  <COND ;(<EQUAL? .F ,LIP-BALM>
				 <TELL " (smeared all over your lips)">)
				;(<EQUAL? .F ,COTTON-BALLS>
				 <TELL " (stuffed in " 'EARS ")">)
				;(<EQUAL? .F ,CLOTHES-PIN>
				 <TELL " (pinned to " 'NOSE ")">)
				(T
				 <TELL " (being worn)">)>)
			 (<FSET? .F ,ONBIT>
			  <TELL " (providing light)">)
			(<EQUAL? .F ,COMIC-BOOK>
			  <TELL " (stuck in your back pocket)">)>
		   <COND (<AND <NOT .IT?> <NOT .TWO?>>
			  <SET IT? .F>)
			 (T
			  <SET TWO? T>
			  <SET IT? <>>)>)>
		 <SET F .N>)>
	  
	  <COND (.N
		 <SET N <NEXT? .N>>)>
	  <COND (<AND <NOT .F>
		      <NOT .N>>
		 <COND (<AND .IT?
			     <NOT .TWO?>>
			<THIS-IS-IT .IT?>)>
		 <COND (<AND .1ST? .START?>
			;<SET 1ST? <>>
			<TELL " nothing">
			<RFALSE>)>
		 <COND (<AND <NOT .1ST?>
			     <EQUAL? .LEVEL <> T>>
			<COND (<EQUAL? .OBJ ,HERE>
			       <TELL " here">)>
			<TELL ".">)>
		 <RETURN>)>>
	 <SET F <FIRST? .OBJ>>
	 <REPEAT ()
		 <COND (<NOT .F>
			<RETURN>)
		       (<AND <FSET? .F ,CONTBIT>
			     <DESCRIBABLE? .F T>
			     <OR <BTST .ALL? ,D-ALL?>
				 <SIMPLE-DESC? .F>>>
			<COND (<DESCRIBE-CONTENTS .F T
						  <COND (.PARA?
							 <+ ,D-ALL? ,D-PARA?>)
							(T
							 ,D-ALL?)>>
			       <SET 1ST? <>>
			       <SET PARA? T>)>)>
		 <SET F <NEXT? .F>>>
	 <COND (<AND <NOT .1ST?>
		     <EQUAL? .LEVEL <> T>
		     <EQUAL? .OBJ ,HERE <LOC ,WINNER>>>
		<CRLF>)>
	 <NOT .1ST?>)>>

<ROUTINE DESCRIBABLE? (OBJ "OPT" (CONT? <>))
	 <COND (<FSET? .OBJ ,INVISIBLE>
		<RFALSE>)
	       (<EQUAL? .OBJ ,WINNER>
		<RFALSE>)
	       (<AND <EQUAL? .OBJ <LOC ,WINNER>>
		     <NOT <EQUAL? ,HERE <LOC ,WINNER>>>>
		<RFALSE>)
	       (<AND <NOT .CONT?>
		     <FSET? .OBJ ,NDESCBIT>>
		<RFALSE>)	       
	       ;(<AND <EQUAL? .OBJ ,RAFT ,BARGE>
		     <EQUAL? ,HERE ,CANAL>
		     <NOT <ULTIMATELY-IN? .OBJ>>
		     <NOT <IN? .OBJ ,BARGE>>
	             <NOT <EQUAL? ,RAFT-LOC-NUM ,BARGE-LOC-NUM>>>
		<RFALSE>)
	       (T
		<RTRUE>)>>

<ROUTINE SIMPLE-DESC? (OBJ "AUX" STR)
	 <COND (<AND <GETP .OBJ ,P?FDESC>
		     <NOT <FSET? .OBJ ,TOUCHBIT>>>
		<RFALSE>)
	       (<AND <SET STR <GETP .OBJ ,P?DESCFCN>>
		     <APPLY .STR ,M-OBJDESC?>>
		<RFALSE>)
	       (<GETP .OBJ ,P?LDESC>
		<RFALSE>)
	       (T
		<RTRUE>)>>

<ROUTINE DESCRIBE-VEHICLE () ;"for LOOK AT/IN vehicle when you're in it"
	 <TELL "Other than " D ,ME ", you can see"> 
	 <COND (<NOT <DESCRIBE-NOTHING ,PRSO>>
		<COND ;(<FSET? ,PRSO ,INBIT>
		       <TELL " in">)
		      (T
		       <TELL " on">)>
		<TELL TR ,PRSO>)>
	 <RTRUE>>

<ROUTINE DESCRIBE-NOTHING (OBJ "OPTIONAL" (NO-CR? <>))
	 <COND (<DESCRIBE-CONTENTS .OBJ 2>
	 	<COND (<AND <NOT <IN? ,PROTAGONIST .OBJ>>
			    <NOT .NO-CR?>>
		       <CRLF>)>
		<RTRUE>)
	       (T ;"nothing"
		<RFALSE>)>>

;"subtitle movement and death"

<CONSTANT REXIT 0>
<CONSTANT UEXIT 1>
<CONSTANT NEXIT 2>
<CONSTANT FEXIT 3>
<CONSTANT CEXIT 4>
<CONSTANT DEXIT 5>

<CONSTANT NEXITSTR 0>
<CONSTANT FEXITFCN 0>
<CONSTANT CEXITFLAG 1>
<CONSTANT CEXITSTR 1>
<CONSTANT DEXITOBJ 1>
<CONSTANT DEXITSTR 1>

<ROUTINE GOTO (NEW-LOC "OPTIONAL" (DONT-DESCRIBE-SIDEKICK <>) "AUX" OLD-HERE
		 X)
	 <SET X <APPLY <GETP ,HERE ,P?ACTION> ,M-EXIT>>
	 <SET OLD-HERE ,HERE>
	 ;<OPEN-EYES-AND-REMOVE-HANDS>
	 <MOVE ,PROTAGONIST .NEW-LOC>
	 <COND (<IN? .NEW-LOC ,ROOMS>
		<SETG HERE .NEW-LOC>)
	       (T
		<SETG HERE <LOC .NEW-LOC>>)>
	 <SETG LIT <LIT? ,HERE>>
	 <COND (<NOT <GRUE-KILL?>>
	       	<APPLY <GETP ,HERE ,P?ACTION> ,M-ENTER>
	 	<COND (<AND <EQUAL? ,GAME-FLAG 1>
		     	    <NOT ,LIT>>
		       <TELL "You have moved into a dark place" ,PERIOD-CR>)>
		<COND (<AND <DESCRIBE-ROOM>
		            <NOT <EQUAL? ,VERBOSITY 0>>>
		       <COND (<IN? ,PRAM ,PROTAGONIST>
		       	      <TELL
 CR CT ,PRAM " rolls to a stop" ,PERIOD-CR>)>
		       <COND (<EQUAL? ,GAME-FLAG 1>
		       	      <DESC-CONTENTS-OF-ROOM T>)
			     (T
		       	      <DESCRIBE-OBJECTS>)>)>
		<COND (<AND <IN? ,SIDEKICK .OLD-HERE>
		            <IN? ,PROTAGONIST ,HERE>
		            <NOT .DONT-DESCRIBE-SIDEKICK>>
		       <SIDEKICK-FOLLOWS-YOU>)>
		<SET X <APPLY <GETP ,HERE ,P?ACTION> ,M-ENTERED>>
	 	<RTRUE>)>>

<ROUTINE SIDEKICK-FOLLOWS-YOU ()
	 <MOVE ,SIDEKICK <LOC ,PROTAGONIST>>
	 <NORMAL-SIDEKICK-FOLLOW>>

<ROUTINE NORMAL-SIDEKICK-FOLLOW ()
	 <DO-PARAGRAPH>
	 <TELL D ,SIDEKICK <PICK-ONE ,FOLLOWS> CR>>

;<GLOBAL SIDEKICK-PARTS
	<LTABLE
	 0
	 "earlobe"
	 "nose"
	 "big toe"
	 "elbow"
	 "left buttock">>

<GLOBAL FOLLOWS
	<LTABLE
	 0
	 " trails along."
	 " follows you."
	 " enters just a few steps behind you."
	 " loyally stays at your side.">>

<ROUTINE JIGS-UP ("OPTIONAL" (DESC <>))
	 <COND (<NOT .DESC>
		<SET DESC "">)>
         <TELL .DESC>
	 <COND (<EQUAL? ,GAME-FLAG 3>
		<TRINITY-DEATH>)
	       (T
	 	<TELL CR CR
"      ****  You have died  ****" CR>)>
	 <FINISH>>

<ROOM THE-RIVER
      (IN ROOMS)
      (DESC "The River")>

<ROUTINE TRINITY-DEATH ()
	 <SETG HERE ,THE-RIVER>
	 <USL>
	 ;<CLEAR-SCREEN>
	 <TELL CR CR
"The River|
|
You're on a lifeless strip of sand beside a great " D ,RIVER ". " CT ,WATER
" is unnaturally dark and still; ribbons of mist coil across its surface like
fingers, obscuring what lies beyond.|
|
As you peer across" T ,RIVER " you notice a lone vessel gliding out of the fog.
You can make out a dark oarsman at the stern.|
|
The oarsman guides his dory to a soundless landing. Something in the way he
crooks his skeletal finger compels you to board. You surrender a silver coin
you didn't know you had, take a seat and wait patiently for your first glimpse
of the opposite shore.|
">>

;"subtitle useful utility routines"

<ROUTINE ACCESSIBLE? (OBJ "AUX" L) ;"revised 2/18/86 by SEM"
	 <COND (<NOT .OBJ>
		<RFALSE>)>
	 <SET L <LOC .OBJ>>
	 <COND (<FSET? .OBJ ,INVISIBLE>
		<RFALSE>)
	       (<EQUAL? .OBJ ,PSEUDO-OBJECT>
		<COND (<EQUAL? ,LAST-PSEUDO-LOC ,HERE>
		       <RTRUE>)
		      (T
		       <RFALSE>)>)
	       (<NOT .L>
		<RFALSE>)
	       (<EQUAL? .L ,GLOBAL-OBJECTS>
		<RTRUE>)
	       (<AND <EQUAL? .L ,LOCAL-GLOBALS>
		     <GLOBAL-IN? .OBJ ,HERE>>
		<RTRUE>)
	       (<NOT <EQUAL? <META-LOC .OBJ> ,HERE>>
		<RFALSE>)
	       (<EQUAL? .L ,WINNER ,HERE>
		<RTRUE>)
	       (<AND <FSET? .L ,OPENBIT>
		     <ACCESSIBLE? .L>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE VISIBLE? (OBJ "AUX" L) ;"revised 5/2/84 by SEM and SWG"
	 <COND (<NOT .OBJ>
		<RFALSE>)>
	 <SET L <LOC .OBJ>>
	 <COND (<ACCESSIBLE? .OBJ>
		<RTRUE>)
	       (<AND <SEE-INSIDE? .L>
		     <VISIBLE? .L>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE UNTOUCHABLE? (OBJ)
;"figures out whether, due to vehicle-related locations, object is touchable"
	 <COND (<NOT .OBJ>
		<RFALSE>)
	       ;"next four clauses are special cases for LGOP"
	       (<OR <ULTIMATELY-IN? .OBJ ,SHELF>
		    <EQUAL? .OBJ ,SHELF>>
		<COND (<IN? ,PROTAGONIST ,STOOL>
		       <RFALSE>)
		      (T
		       <RTRUE>)>)
	       (<AND <ULTIMATELY-IN? .OBJ ,OPEN-GRAVE>
		     <EQUAL? ,HERE ,SPOOKY-COPSE>>
		<RTRUE>)
	       (<ULTIMATELY-IN? .OBJ ,POODLE>
		<TELL
"The poodle bares its nasty little teeth, and you pull back your hand" ,PERIOD-CR>
	        <RFATAL>)
	       (<IN? ,PROTAGONIST ,HERE>
		<RFALSE>)
	       (T
		<RTRUE>)>>

<ROUTINE META-LOC (OBJ)
	 <REPEAT ()
		 <COND (<NOT .OBJ>
			<RFALSE>)
		       (<IN? .OBJ ,GLOBAL-OBJECTS>
			<RETURN ,GLOBAL-OBJECTS>)>
		 <COND (<IN? .OBJ ,ROOMS>
			<RETURN .OBJ>)
		       (T
			<SET OBJ <LOC .OBJ>>)>>>

<ROUTINE OTHER-SIDE (DOBJ "AUX" (P 0) TEE) ;"finds room on others side of door"
	 <REPEAT ()
		 <COND (<L? <SET P <NEXTP ,HERE .P>> ,LOW-DIRECTION>
			<RETURN <>>)
		       (T
			<SET TEE <GETPT ,HERE .P>>
			<COND (<AND <EQUAL? <PTSIZE .TEE> ,DEXIT>
				    <EQUAL? <GETB .TEE ,DEXITOBJ> .DOBJ>>
			       <RETURN .P>)>)>>>

<ROUTINE ULTIMATELY-IN? (OBJ "OPTIONAL" (CONT <>)) ;"formerly HELD?"
	 <COND (<NOT .CONT>
		<SET CONT ,WINNER>)>
	 <COND (<NOT .OBJ>
		<RFALSE>)
	       (<IN? .OBJ .CONT>
		<RTRUE>)
	       (<IN? .OBJ ,ROOMS>
		<RFALSE>)
	       ;(<IN? .OBJ ,GLOBAL-OBJECTS>
		<RFALSE>)
	       (T
		<ULTIMATELY-IN? <LOC .OBJ> .CONT>)>>

<ROUTINE SEE-INSIDE? (OBJ)
	 <AND .OBJ
	      <NOT <FSET? .OBJ ,INVISIBLE>>
	      <OR <FSET? .OBJ ,TRANSBIT>
	          <FSET? .OBJ ,OPENBIT>>>>

<ROUTINE GLOBAL-IN? (OBJ1 OBJ2 "AUX" TEE)
	 <COND (<SET TEE <GETPT .OBJ2 ,P?GLOBAL>>
		<ZMEMQB .OBJ1 .TEE <- <PTSIZE .TEE> 1>>)>>

<ROUTINE FIND-IN (WHERE FLAG-IN-QUESTION
		  "OPTIONAL" (STRING <>) "AUX" OBJ RECURSIVE-OBJ)
	 <SET OBJ <FIRST? .WHERE>>
	 <COND (<NOT .OBJ>
		<RFALSE>)>
	 <REPEAT ()
		 <COND (<AND <FSET? .OBJ .FLAG-IN-QUESTION>
			     <NOT <FSET? .OBJ ,INVISIBLE>>>
			<COND (.STRING
			       <TELL "[" .STRING T .OBJ "]" CR CR>)>
			<RETURN .OBJ>)
		       (<SET RECURSIVE-OBJ <FIND-IN .OBJ .FLAG-IN-QUESTION>>
			<RETURN .RECURSIVE-OBJ>)
		       (<NOT <SET OBJ <NEXT? .OBJ>>>
			<RETURN <>>)>>>

;<ROUTINE DIRECTION? (OBJ)
	 <COND (<OR <EQUAL? .OBJ ,P?NORTH ,P?SOUTH ,P?EAST>
		    <EQUAL? .OBJ ,P?WEST ,P?NE ,P?NW>
		    <EQUAL? .OBJ ,P?SE ,P?SW>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE NOW-DARK? ()
	 <COND (<AND ,LIT
		     <NOT <LIT? ,HERE>>>
		<SETG LIT <>>
		<DO-PARAGRAPH <>>
		<TELL "It is now too dark to see.">
		<DO-GRUE> <CRLF>)>>

<ROUTINE DO-GRUE ()
	 <COND (<EQUAL? ,GAME-FLAG 1>
		<SETG GRUE-DEATH T>
		<TELL " You are likely to be eaten by a grue.">)>>

<GLOBAL GRUE-DEATH <>>

<OBJECT GRUE
	(IN GLOBAL-OBJECTS)
	(SYNONYM GRUE)
	(ADJECTIVE LURKING SINISTER HUNGRY SILENT)
	(DESC "lurking grue")
	(ACTION GRUE-FUNCTION)>

<ROUTINE GRUE-FUNCTION ()
          <COND (<VERB? WHAT EXAMINE>
	   	 <TELL
"The grue is a sinister, lurking presence in the dark places of the
earth. Its favorite diet is adventurers, but its insatiable
appetite is tempered by its fear of light. No grue has ever been
seen by the light of day, and few have survived its fearsome jaws
to tell the tale" ,PERIOD-CR>)
	  	(<VERB? FIND>
	   	 <TELL
"There is no grue here, but I'm sure there is at least one lurking
in the darkness nearby. I wouldn't let my light go out if I were
you!" CR>)
	       (<VERB? LISTEN>
	   	<TELL
"It makes no sound but is always lurking in the darkness nearby" ,PERIOD-CR>)>>

<ROUTINE NOW-LIT? ()
	 <COND (<AND <NOT ,LIT>
		     <LIT? ,HERE>>
		<SETG LIT T>
		<CRLF>
		<V-LOOK>)>>

<ROUTINE LOC-CLOSED ("AUX" (L <LOC ,PRSO>))
	 <COND (<AND <FSET? .L ,CONTBIT>
		     <NOT <FSET? .L ,OPENBIT>>
		     <FSET? ,PRSO ,TAKEBIT>>
		<DO-FIRST "open" .L>)
	       (T
		<RFALSE>)>>

<ROUTINE DO-WALK (DIR)
	 <SETG P-WALK-DIR .DIR>
	 <PERFORM ,V?WALK .DIR>>

<ROUTINE STOP ()
	 <SETG P-CONT <>>
	 <SETG QUOTE-FLAG <>>
	 <RFATAL>>

<ROUTINE ROB (WHO "OPTIONAL" (WHERE <>) "AUX" N X)
	 <SET X <FIRST? .WHO>>
	 <REPEAT ()
		 <COND (<ZERO? .X>
			<RETURN>)>
		 <SET N <NEXT? .X>>
		 <COND (<FSET? .X ,TAKEBIT>
		        <MOVE .X .WHERE>)>       ;"A WEE REWRITE -- TJB"
		 <SET X .N>>>

<ROUTINE WRONG-SEX-WORD (OBJ MALE-WORD FEMALE-WORD)
	 <COND (<NOT ,SEX-CHOSEN>
		<RFALSE>)
	       (<OR <AND ,MALE
			 <NOUN-USED .OBJ .FEMALE-WORD>>
		    <AND <NOT ,MALE>
			 <NOUN-USED .OBJ .MALE-WORD>>>
		<TELL "There's no">
		<COND (<EQUAL? .OBJ ,SIDEKICK>
		       <TELL " one by that name">)
		      (<PRSO? .OBJ>
		       <PRSO-PRINT>)
		      (T
		       <PRSI-PRINT>)>
		<TELL " here.">
		<COND (<NOT <EQUAL? ,NAUGHTY-LEVEL 0>>
		       <TELL
" [I see you've been playing both as a male and as a female! I guess
you're the type who goes both ways, eh? Nudge, nudge, wink, wink!]">)>
		<SETG P-WON <>>
		<CRLF>)
	       (T
		<RFALSE>)>>

<ROUTINE HACK-HACK (STR)
	 <TELL .STR T ,PRSO>
	 <HO-HUM>>

<ROUTINE HO-HUM ()
	 <TELL <PICK-ONE ,HO-HUM-LIST> CR>>

<GLOBAL HO-HUM-LIST
	<LTABLE
	 0 
	 " doesn't do anything."
	 " accomplishes nothing."
	 " has no desirable effect.">>		 

<ROUTINE YUKS ()
	 <TELL <PICK-ONE ,YUK-LIST> CR>>

<GLOBAL YUK-LIST
	<LTABLE
	 0 
	 "What a concept."
         "Nice try."
	 "You've gotta be kidding."
	 "Think again.">>

<ROUTINE IMPOSSIBLES ()
	 <TELL <PICK-ONE ,IMPOSSIBLE-LIST> CR>>

<GLOBAL IMPOSSIBLE-LIST
	<LTABLE
	 0
	 "Fat chance."
	 "Preposterous!"
	 "Dream on."
	 ;"Prepossible!"
	 "It's the looney bin for you!"
	 "You have lost your mind.">>

<ROUTINE WASTES ()
	 <COND (<EQUAL? ,GAME-FLAG 2>
		<TELL <PICK-ONE ,WASTE-LIST> CR>)
	       (T
		<WASTE-OF-TIME>)>>

<ROUTINE WASTE-OF-TIME ()
	 <TELL "That would be a " <PICK-ONE ,USELESSNESS> "." CR>>

<GLOBAL USELESSNESS
	<LTABLE 0
	 "waste of time"
	 "useless effort"
	 "pointless thing to do">>

<GLOBAL WASTE-LIST
	<LTABLE 0
"A bigger waste of time than selling green cheese to the man in the moon."
"It's not worth it. Believe me."
"Useless. Unhelpful. Non-productivish. Ineffectivoid."
"There's another turn down the drain."
"Why bother?">>

;"ZORK DESCRIBERS YANKED IN TO SAVE TROUBLE."

<ROUTINE PRINT-CONT (OBJ "OPTIONAL" (V? <>) (LEVEL 0)
		     "AUX" Y 1ST? SHIT AV STR (PV? <>) (INV? <>))
	 <COND (<NOT <SET Y <FIRST? .OBJ>>> <RTRUE>)>
	 <COND (<AND <SET AV <LOC ,WINNER>> <FSET? .AV ,VEHBIT>>
		T)
	       (ELSE <SET AV <>>)>
	 <SET 1ST? T>
	 <SET SHIT T>
	 <COND (<EQUAL? ,WINNER .OBJ <LOC .OBJ>>
		<SET INV? T>)
	       (ELSE
		<REPEAT ()
			<COND %<COND ;(<==? ,ZORK-NUMBER 2>
				      '(<NOT .Y>
					<COND (<AND <0? .LEVEL>
						    <==? ,SPELL? ,S-FANTASIZE>
						    <PROB 20>>
					       <TELL "There is a "
						     <PICK-ONE ,FANTASIES>
						     " here" ,PERIOD-CR>
					       <SET 1ST? <>>)>
					<RETURN>))
				     (ELSE
				      '(<NOT .Y>
					<RETURN>))>
			      (<EQUAL? .Y .AV> <SET PV? T>)
			      (<EQUAL? .Y ,WINNER>)
			      (<AND <NOT <FSET? .Y ,INVISIBLE>>
				    <NOT <FSET? .Y ,TOUCHBIT>>
				    <SET STR <GETP .Y ,P?FDESC>>>
			       <COND (<NOT <FSET? .Y ,NDESCBIT>>
				      <TELL .STR CR>
				      <SET SHIT <>>
				      ;<SET 1ST? <>>)>
			       <COND (<AND <SEE-INSIDE? .Y>
					   <NOT <GETP <LOC .Y> ,P?DESCFCN>>
					   <FIRST? .Y>>
				      <COND (<PRINT-CONT .Y .V? 0>
					     <SET 1ST? <>>)>)>)>
			<SET Y <NEXT? .Y>>>)>
	 <SET Y <FIRST? .OBJ>>
	 <REPEAT ()
		 <COND (<NOT .Y>
			<COND (<AND .PV? .AV <FIRST? .AV>>
			       <SET LEVEL <+ .LEVEL 1>> ;"not in Zork III"
			       <PRINT-CONT .AV .V? .LEVEL>)>
			<RETURN>)
		       (<EQUAL? .Y .AV ,PROTAGONIST>)
		       (<AND <NOT <FSET? .Y ,INVISIBLE>>
			     <OR .INV?
				 <FSET? .Y ,TOUCHBIT>
				 <NOT <GETP .Y ,P?FDESC>>>>
			<COND (<NOT <FSET? .Y ,NDESCBIT>>
			       <COND (.1ST?
				      <COND (<FIRSTER .OBJ .LEVEL>
					     <COND (<L? .LEVEL 0>
						    <SET LEVEL 0>)>)>
				      <SET LEVEL <+ 1 .LEVEL>>
				      <SET 1ST? <>>)>
			       <COND (<L? .LEVEL 0> <SET LEVEL 0>)>
			       <DESCRIBE-OBJECT .Y .V? .LEVEL>)
			      (<AND <FIRST? .Y> <SEE-INSIDE? .Y>>
			       <SET LEVEL <+ .LEVEL 1>> ;"not in Zork III"
			       <PRINT-CONT .Y .V? .LEVEL>
			       <SET LEVEL <- .LEVEL 1>> ;"not in Zork III")>)>
		 <SET Y <NEXT? .Y>>>
	 <COND (<AND .1ST? .SHIT> <RFALSE>) (T <RTRUE>)>>

<ROUTINE FIRSTER (OBJ LEVEL)
	 <COND (<EQUAL? .OBJ ,TROPHY-CASE>
		<COND (<NOT <FIRST? .OBJ>>
		       <CRLF> <RTRUE>)
		      (T
		       <TELL
"Your collection of treasures consists of:" CR>)>)
	       (<EQUAL? .OBJ ,WINNER>
		<TELL "You are carrying:" CR>)
	       (<NOT <IN? .OBJ ,ROOMS>>
		<COND (<G? .LEVEL 0>
		       <TELL <GET ,INDENTS .LEVEL>>)>
		<COND (<FSET? .OBJ ,SURFACEBIT>
		       <TELL "Sitting on the " D .OBJ " is: " CR>)
		      (<FSET? .OBJ ,ACTORBIT>
		       <TELL "The " D .OBJ " is holding: " CR>)
		      (T
		       <TELL "The " D .OBJ " contains:" CR>)>)>>

<GLOBAL DESC-OBJECT <>>

<ROUTINE DESCRIBE-OBJECT (OBJ V? LEVEL "AUX" (STR <>) AV)
	 <SETG DESC-OBJECT .OBJ>
	 <COND (<AND <0? .LEVEL>
		     <APPLY <GETP .OBJ ,P?DESCFCN> ,M-OBJDESC>>
		<RTRUE>)
	       (<AND <0? .LEVEL>
		     <OR <AND <NOT <FSET? .OBJ ,TOUCHBIT>>
			      <SET STR <GETP .OBJ ,P?FDESC>>>
			 <SET STR <GETP .OBJ ,P?LDESC>>>>
		<TELL .STR>)
	       (<0? .LEVEL>
		<TELL "There is a " D .OBJ " here">
		<COND (<FSET? .OBJ ,ONBIT>
		       <TELL " (providing light)">)>
		<TELL ".">)
	       (T
		<TELL <GET ,INDENTS .LEVEL>>
		<TELL "A " D .OBJ>
		<COND (<FSET? .OBJ ,ONBIT>
		       <TELL " (providing light)">)
		      (<AND <FSET? .OBJ ,WORNBIT>
			    <IN? .OBJ ,WINNER>>
		       <TELL " (being worn)">)>)>
	 <COND (<AND <0? .LEVEL>
		     <SET AV <LOC ,WINNER>>
		     <FSET? .AV ,VEHBIT>>
		<TELL " (outside the " D .AV ")">)>
	 <CRLF>
	 <COND (<AND <SEE-INSIDE? .OBJ> <FIRST? .OBJ>>
		<PRINT-CONT .OBJ .V? .LEVEL>)>>

<ROUTINE DESC-CONTENTS-OF-ROOM ("OPTIONAL" (V? <>))
	 <SET V? <OR .V?
		     <EQUAL? ,VERBOSITY 2>>>
	 <COND (<FIRST? ,HERE>
		<PRINT-CONT ,HERE .V? -1>)
	       (T
		<CRLF>)>>

<GLOBAL INDENTS
	<TABLE ""
	       "  "
	       "    "
	       "      "
	       "        "
	       "          ">>
