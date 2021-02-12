"VERBS for
		              BALLYHOO
	(c) Copyright 1986 Infocom, Inc.  All Rights Reserved."

;"subtitle game commands"

<GLOBAL VERBOSITY 1> ;"0 = superbrief, 1 = brief, 2 = verbose"

<ROUTINE V-VERBOSE ()
	 <SETG VERBOSITY 2>
	 <TELL "Maximum verbosity." CR CR>
	 <V-LOOK>>

<ROUTINE V-SAVE ()
	 <COND (<SAVE>
	        <TELL "Ok." CR>)
	       (T
		<TELL "Failed." CR>)>>

<ROUTINE V-RESTORE ()
	 <COND (<RESTORE>
	        <TELL "Ok." CR CR>
		<V-LOOK>)
	       (T
		<TELL "Failed." CR>)>>

<ROUTINE V-SCORE ("OPTIONAL" (ASK? T))
	 <TELL "Your score is " N ,SCORE " of a possible 200, in "
	        N ,MOVES " turn">
	 <COND (<NOT <EQUAL? ,MOVES 1>>
		<TELL "s">)>
	 <TELL ,PERIOD>
	 <RFATAL>>

<ROUTINE V-SCRIPT ()
	<PUT 0 8 <BOR <GET 0 8> 1>>
	<CORP-NOTICE "begins">
	<V-VERSION>>

<ROUTINE V-UNSCRIPT ()
	<CORP-NOTICE "ends">
	<V-VERSION>
	<PUT 0 8 <BAND <GET 0 8> -2>>
	<RTRUE>>

<ROUTINE CORP-NOTICE (STRING)
	 <TELL "Here " .STRING " a transcript with Ballyhoo." CR>>
					  
<ROUTINE V-BRIEF ()
	 <SETG VERBOSITY 1>
	 <TELL "Brief descriptions." CR>>

<ROUTINE V-SUPER-BRIEF ()
	 <SETG VERBOSITY 0>
	 <TELL "Superbrief descriptions." CR>>

<ROUTINE V-DIAGNOSE ()
         <SETG AWAITING-REPLY 9>
	 <ENABLE <QUEUE I-REPLY 2>>
	 <TELL 
"Are you really so heartless as to think of your own well-being at a time
like this?" CR>>
		      
<ROUTINE V-INVENTORY ()  
	 <TELL "You have">
	 <COND (<NOT <FIRST? ,PROTAGONIST>>
		<TELL " naught">
		;<COND (<ZERO? ,POCKET-CHANGE>
		       <TELL "naught">)
		      ;(T
		       <PRINT-AMOUNT ,POCKET-CHANGE>
		       <TELL " to your name">)>
		<TELL ,PERIOD>
		<RTRUE>)
	       (T
	        <DESCRIBE-OBJECTS ,PROTAGONIST>)>
       	 <RTRUE>>

;<ROUTINE PRINT-AMOUNT (AMT)
	 <TELL "$" N </ .AMT 100> ".">
	 <SET AMT <MOD .AMT 100>>
	 <COND (<0? .AMT>
		<TELL "00">)
	       (<L? .AMT 10>
		<TELL "0" N .AMT>)
	       (T
		<TELL N .AMT>)>>

<ROUTINE V-QUIT ()
	 <V-SCORE>
	 <TELL
"Do you wish to leave the game? (Y is affirmative): ">
	 <COND (<YES?>
		<QUIT>)
	       (T
		<TELL "Ok." CR>)>>

<ROUTINE V-RESTART ()
	 <V-SCORE T>
	 <TELL "Do you wish to restart? (Y is affirmative): ">
	 <COND (<YES?>
		<TELL "Restarting." CR>
		<RESTART>
		<TELL "Failed." CR>)>>

<ROUTINE YES? ()
	 <PRINTI ">">
	 <READ ,P-INBUF ,P-LEXV>
	 <COND (<EQUAL? <GET ,P-LEXV 1> ,W?YES ,W?Y>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE FINISH ("OPTIONAL" (REPEATING <>))
	 <COND (<L? ,EGRESS-C 3>
		<CRLF>)>
	 <COND (<NOT .REPEATING>
		<V-SCORE>
		<CRLF>)>
	 <TELL-FINISH>
	 <READ ,P-INBUF ,P-LEXV>
	 <COND (<EQUAL? <GET ,P-LEXV 1> ,W?RESTAR>
	        <RESTART>
		<TELL "Failed." CR>
		<FINISH T>)
	       (<EQUAL? <GET ,P-LEXV 1> ,W?RESTOR>
		<COND (<RESTORE>
		       <TELL "Ok." CR>)
		      (T
		       <TELL "Failed." CR>
		       <FINISH T>)>)
	       (<EQUAL? <GET ,P-LEXV 1> ,W?QUIT ,W?Q>
		<QUIT>)
	       (T
		<FINISH T>)>>

<ROUTINE TELL-FINISH ()
	 <TELL
"Would you like to start over, restore a saved position, or end this session
of the game? (Type RESTART, RESTORE, or QUIT):|
|
>">>

<ROUTINE V-VERSION ("AUX" (CNT 17) V)
	 <SET V <BAND <GET 0 1> *3777*>>
	 <TELL
"BALLYHOO|
Infocom interactive fiction|
Copyright (c) 1986 by Infocom, Inc. All rights reserved.|
Release " N .V " / Serial number ">
	 <REPEAT ()
		 <COND (<G? <SET CNT <+ .CNT 1>> 23>
			<RETURN>)
		       (T
			<PRINTC <GETB 0 .CNT>>)>>
	 <CRLF>>

<ROUTINE V-$VERIFY ()
	<TELL "Verifying..." CR>
	<COND (<VERIFY>
	       <TELL "Good." CR>)
	      (T
	       <TELL CR "** Bad **" CR>)>>

<CONSTANT SERIAL 0>

;"real verbs"

<ROUTINE V-ADVANCE ()
	 <V-DIG>>

<ROUTINE V-ALARM ()
	 <COND (<PRSO? ,ROOMS>
		<PERFORM ,V?ALARM ,ME>
		<RTRUE>)
	       (T
		<TELL "But">
	        <ARTICLE ,PRSO T>
	        <TELL " isn't asleep." CR>)>>

<ROUTINE V-ANSWER ()
	 <COND (<AND ,AWAITING-REPLY
		<EQUAL? <GET ,P-LEXV ,P-CONT> ,W?YES>>
	        <V-YES>
		<STOP>)
	       (<AND ,AWAITING-REPLY
		     <EQUAL? <GET ,P-LEXV ,P-CONT> ,W?NO>>
		<V-NO>
		<STOP>)
	       (T
		<TELL "Nobody is awaiting your answer." CR>
	        <STOP>)>>

<ROUTINE V-APPLAUD ()
	 <COND (<AND <FSET? ,PRSO ,PERSON>
		     <NOT <EQUAL? ,PRSO ,DICK ,TAFT ,CROWD>>>
		<TELL "Gracefully,">
	 	<ARTICLE ,PRSO T>
	 	<TELL " takes a bow." CR>)
	       (T
		<TELL "Not surprisingly,">
		<ARTICLE ,PRSO T>
		<TELL " doesn't react." CR>)>>
	 
<ROUTINE V-ARREST ()
	 <TELL 
"Fine. Since you wield zero police power, the only thing that's getting
arrested around here is your logical faculty." CR>>

<ROUTINE V-ASK-ABOUT ()
	 <COND (<PRSO? ,ME>
		<PERFORM ,V?TELL ,ME>
		<RTRUE>)
	       (<FSET? ,PRSO ,ACTORBIT>
		<TELL "A long silence tells you that">
		<ARTICLE ,PRSO T>
		<TELL " isn't interested in talking about">
		<COND (<IN? ,PRSI ,ROOMS>
		       <TELL " that">)
		      (T
		       <ARTICLE ,PRSI T>)>
		<TELL ,PERIOD>)
	       (T
		<PERFORM ,V?TELL ,PRSO>
		<RTRUE>)>>

<ROUTINE V-ASK-FOR ()
	 <TELL "Unsurprisingly,">
	 <ARTICLE ,PRSO T>
	 <TELL " doesn't oblige." CR>>

<ROUTINE V-BALANCE ()
	 <TELL "Your knees wobble a bit." CR>>
	       		
<ROUTINE V-BITE ()
	 <HACK-HACK "Biting">>

<ROUTINE PRE-BOARD ()
	 <COND (<AND <PRSO? <LOC ,PROTAGONIST>>
		     <NOT ,IN-FRONT-FLAG>>
		<TELL ,LOOK-AROUND CR>)
	       (<AND <HELD? ,PRSO>
		     <NOT <PRSO? ,SUIT>>>
		<TELL "You're holding it!" CR>)>>

<ROUTINE V-BOARD ("AUX" AV)
	 <SET AV <LOC ,PROTAGONIST>>  
         
	 <COND (<FSET? ,PRSO ,VEHBIT>                                  
		<TELL "You are now on ">
   		<ARTICLE ,PRSO T>
		<TELL ,PERIOD>		
		<MOVE ,WINNER ,PRSO>
		<APPLY <GETP ,PRSO ,P?ACTION> ,M-ENTER>
		<RTRUE>)
	       (,IN-FRONT-FLAG
		<V-DIG>)
	       (T
	        <TELL "You can't get onto">
		<ARTICLE ,PRSO T>
		<TELL "!" CR>)>>

<ROUTINE V-BRIBE ()
	 <COND ;(<NOT ,PRSI>
		<PERFORM ,V?GIVE ,GLOBAL-MONEY ,PRSO>
		<RTRUE>)
	       (T
		<PERFORM ,V?GIVE ,PRSI ,PRSO>
		<RTRUE>)>>

<ROUTINE PRE-BUY ()
	 <TELL "But">
	 <ARTICLE ,PRSI T>
	 <TELL " isn't selling." CR>>

<ROUTINE V-BUY ()
	 <TELL "Sorry,">
	 <COND (<EQUAL? ,PRSO ,TICKET>
		<TELL " a ticket">)
	       (T
		<ARTICLE ,PRSO T>)>
	 <TELL " isn't for sale." CR>>

<ROUTINE V-CALL () ;"prso need not be in room"
	 <COND (<AND <NOT <EQUAL? <META-LOC ,PRSO> ,HERE>>
	             <NOT <EQUAL? ,PRSO ,ME>>
		     <NOT <GLOBAL-IN? ,PRSO ,HERE>>>
		<CANT-SEE ,PRSO>)
	       (T
		<PERFORM ,V?TELL ,PRSO>
		<RTRUE>)>>

;<ROUTINE V-CATCH-WITH ()
	 <PERFORM ,V?TAKE-WITH ,PRSO ,PRSI>
	 <RTRUE>>

<ROUTINE V-CHASTISE ()
	 <COND (<EQUAL? ,PRSO ,INTDIR>
		<PERFORM ,V?LOOK>
		<RTRUE>)
	       (T
		<TELL
"Use prepositions to indicate precisely what you want to do: LOOK AT the
object, LOOK INSIDE it, LOOK UNDER it, etc." CR>)>>

<ROUTINE V-CLAP ("AUX" ACTOR)
	 <COND (,PRSO
		<PERFORM ,V?RUB ,PRSO>
		<RTRUE>)
	       (<AND <EQUAL? ,HERE ,BACK-YARD>
		     <IN? ,THUMB ,HERE>>
		<SETG PRSO ,THUMB>
		<PERFORM ,V?APPLAUD ,PRSO>
		<RTRUE>)
	       (<SETG PRSO <FIND-IN ,HERE ,ACTORBIT>>		    
		<PERFORM ,V?APPLAUD ,PRSO>
		<RTRUE>)
	       (T
		<TELL "Clap!" CR>)>>

<ROUTINE V-CLEAN ()
         <TELL "But">
	 <ARTICLE ,PRSO T>
	 <TELL " isn't all that dirty." CR>>

<ROUTINE V-CLIMB-DOWN ()
	 <COND (<PRSO? ,ROOMS>
		<DO-WALK ,P?DOWN>)
	       (T
		<V-COUNT>)>>

<ROUTINE V-CLIMB-FOO ()
	 <COND (<EQUAL? ,PRSO ,INTDIR>
		<CRAWL-DIR>
		<RTRUE>)
	       (<PRSO? ,ROOMS>
		<COND (<EQUAL? ,HERE ,PLATFORM-1>
		       <DO-WALK ,P?DOWN>)
		      (T
		       <DO-WALK ,P?UP>)>)
	       ;(<EQUAL? ,PRSO ,WAGON>
		<PERFORM ,V?CLIMB-ON ,PRSO>
		<RTRUE>)
	       (T
		<V-COUNT>)>>

<ROUTINE V-CLIMB-ON ()
	 <COND (<FSET? ,PRSO ,VEHBIT>
		<PERFORM ,V?BOARD ,PRSO>
		<RTRUE>)
	       (<PRSO? ,GRANDSTAND>
		<PERFORM ,V?SIT>
		<RTRUE>)
	       (T
		<TELL "You can't climb onto">
		<ARTICLE ,PRSO T>
		<TELL ,PERIOD>)>>

<ROUTINE V-CLIMB-OVER ()
	 <V-COUNT>>

<ROUTINE V-CLIMB-UP ()
	 <COND (<PRSO? ,ROOMS>
		<DO-WALK ,P?UP>)
	       (T
		<V-INHALE>)>>

<ROUTINE V-CLOSE ()
	 <COND (<FSET? ,PRSO ,SURFACEBIT>
		<V-COUNT>)
	       (<FSET? ,PRSO ,ACTORBIT>
	        <V-COUNT>)
	       (<OR <FSET? ,PRSO ,DOORBIT>
		    <FSET? ,PRSO ,CONTBIT>>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <TELL "Okay,">
		       <ARTICLE ,PRSO T>
		       <TELL " is now closed." CR>
		       <FCLEAR ,PRSO ,OPENBIT>)
		      (T
		       <TELL ,ALREADY-CLOSED CR>)>)
	       (T
		<CANT-OPEN>)>>

;<ROUTINE PRE-COMPARE ()
 	 <COND (<OR <AND <NOT ,PRSI>
		     	 <EQUAL? 1 <GET ,P-PRSO 0>>>
		    <EQUAL? 2 <GET ,P-PRSO 0>>>	     	
		<TELL "Try typing \"COMPARE IT TO (something).\"" CR>
		<RFATAL>)>>

;<ROUTINE V-COMPARE ()
        <COND (<EQUAL? ,PRSO ,PRSI> 
	       <TELL "The self-same thing." CR>)
       	      (T 
	       <TELL "Like Rimshaw,">
	       <ARTICLE ,PRSO T>
	       <TELL " is incomparable." CR>
	       <RTRUE>)>>

<ROUTINE V-COUNT ()
	 <TELL <PICK-ONE ,IMPOSSIBLES> CR>>

<ROUTINE V-CRAWL-UNDER ()
	 <COND (<EQUAL? ,PRSO ,INTDIR>
		<CRAWL-DIR>
		<RTRUE>)
	       (<NOT <FSET? ,PRSO ,TAKEBIT>>
	        <TELL-HIT-HEAD>)
	       ;(<PRSO? ,STAND>
		<V-DIG>)
	       (T
		<V-COUNT>)>>

<ROUTINE V-CUT ()
	 <COND (<NOT ,PRSI>
		<V-INHALE>)
	       (T
		<TELL "It's doubtful the \"cutting edge\" of">
		<ARTICLE ,PRSI>
		<TELL " is adequate." CR>)>>

<ROUTINE V-DIG ()
	 <TELL <PICK-ONE ,WASTES> CR>>

<ROUTINE V-DISEMBARK ()
	 <COND (<AND <FSET? ,PRSO ,TAKEBIT> ;"since GET OUT is also TAKE OUT"
		     <EQUAL? <META-LOC ,PRSO> ,HERE>
		     <NOT <IN? ,PRSO ,HERE>>
		     <NOT <IN? ,PRSO ,PROTAGONIST>>>
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)
	       (<NOT <EQUAL? <LOC ,WINNER> ,PRSO>>
		<TELL ,LOOK-AROUND CR>
		<RFATAL>)
	       (T
 	        <TELL "You get out of the " D ,PRSO "." CR>
	        <MOVE ,WINNER ,HERE>)>>

<ROUTINE V-DRINK ()
	 <TELL "You can't drink that!" CR>>

<ROUTINE V-DRINK-FROM ()
	 <V-COUNT>>

<ROUTINE V-DRIVE ()	
	 <V-COUNT>>

<ROUTINE PRE-DROP ()
	 <COND (<IDROP>
		<RTRUE>)>>

<ROUTINE V-DROP ()
	<MOVE ,PRSO ,HERE>
	<TELL "Dropped." CR>>

<ROUTINE V-EAT ()
	 <TELL "Stuffing your face with">
	 <ARTICLE ,PRSO T>
	 <TELL " would do little to help at this point." CR>>

<ROUTINE V-EJECT ()
	 <V-COUNT>>

<ROUTINE V-EMPTY ("AUX" OBJ NXT)
	 <COND (<FSET? ,PRSO ,CONTBIT>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <SET OBJ <FIRST? ,PRSO>>
		       <COND (.OBJ
			      <REPEAT ()
				      <COND (.OBJ
					     <SET NXT <NEXT? .OBJ>>
					     <COND (<NOT <FSET? .OBJ
							  ,NARTICLEBIT>>
						    <TELL "The ">)>
					     <TELL D .OBJ ": ">
					     <PERFORM ,V?TAKE .OBJ ,PRSO>
					     <SET OBJ .NXT>)
					    (T
					     <RETURN>)>>)
			     (T
			      <TELL "It's already empty!" CR>)>)
		      (T
		       <TELL "It's closed." CR>)>)
	       (T
		<V-COUNT>)>
	 <RTRUE>>

<ROUTINE V-ENTER ("AUX" VEHICLE)
	 <COND (<SET VEHICLE <FIND-IN ,HERE ,VEHBIT>>
		<PERFORM ,V?BOARD .VEHICLE>
		<RTRUE>)
	       (T
	        <DO-WALK ,P?IN>)>>
	
<ROUTINE V-EXAMINE ()
	 <COND (<OR <FSET? ,PRSO ,DOORBIT>
		    <FSET? ,PRSO ,SURFACEBIT>>
		<V-LOOK-INSIDE>)
	       (<AND <FSET? ,PRSO ,CONTBIT>
		     <NOT <FSET? ,PRSO ,ACTORBIT>>
		     <NOT <EQUAL? ,PRSO ,COAT>>>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <V-LOOK-INSIDE>)
		      (T
		       <TELL "It's closed." CR>)>)
	       (<FSET? ,PRSO ,CLEARBIT>
		<TELL "It's invisible, naturally." CR>)
	       (<PRSO? ,HEAD>
		<TELL "That would involve quite a contortion." CR>)
	       (T
	        <TELL "You see nothing " <PICK-ONE ,YAWNS> " about">
		<ARTICLE ,PRSO T>
		<TELL ".">
		<CRLF>)>>

<ROUTINE V-EXAMINE-THROUGH ()
	 <TELL "This reveals nothing new." CR>>

<ROUTINE V-EXIT ()
	 <COND (<AND ,PRSO
		     <FSET? ,PRSO ,VEHBIT>>
		<PERFORM ,V?DISEMBARK ,PRSO>
		<RTRUE>)
	       (T
		<DO-WALK ,P?OUT>)>>

<ROUTINE V-FEED ("AUX" (FOOD <>))
		<TELL "You have nothing to feed">
		<ARTICLE ,PRSO T>
		<TELL " with." CR>>

<ROUTINE V-FILL ()
	 <COND (<NOT ,PRSI>
		<COND (<EQUAL? ,HERE ,CON-AREA>
		       <PERFORM ,V?FILL ,PRSO ,GLOBAL-WATER>
		       <RTRUE>)
		      (<AND <FSET? ,PRSO ,CONTBIT>
			    <NOT <ZERO? <GETP ,PRSO ,P?CAPACITY>>>>
		       <TELL "There's nothing to fill it with." CR>)
		      (T
		       <V-COUNT>)>)
	       (<EQUAL? ,PRSI ,GLOBAL-WATER>
		<COND (<NOT <EQUAL? ,HERE ,CON-AREA>>
		       <CANT-SEE ,GLOBAL-WATER>)
		      (T
		       <V-COUNT>)>)
	       (T 
		<V-COUNT>)>>

<ROUTINE V-FIND ("OPTIONAL" (WHERE <>) "AUX" (L <LOC ,PRSO>))
	 <COND ;(<PRSO? ,HANDS ,HEAD ,EARS ,TEETH ,EYES>
		<TELL "Are you sure">
		<ARTICLE ,PRSO T>
		<TELL " is lost?" CR>)
	       (<PRSO? ,ME>
		<TELL "You're in">
		<ARTICLE ,HERE T>
		<TELL ,PERIOD>)
	       (<IN? ,PRSO ,PROTAGONIST>
		<TELL "You have it!" CR>)
	       (<AND <PRSO? KEY>
		     <FSET? ,KEY ,TRYTAKEBIT>>
		<WHERE-FIND .WHERE>)
	       (<IN? ,PRSO ,HERE>		     
		<TELL "Right in front of you." CR>)
	       (<OR <IN? ,PRSO ,GLOBAL-OBJECTS>
		    <GLOBAL-IN? ,PRSO ,HERE>>
		<TELL "You figure it out!" CR>)
	       (<AND <FSET? .L ,ACTORBIT>
		     <VISIBLE? .L>>
		<TELL "As far as you can tell,">
		<ARTICLE .L T>
		<TELL " has it." CR>)
	       (<AND <FSET? .L ,CONTBIT>
		     <VISIBLE? ,PRSO>
		     <NOT <IN? .L ,GLOBAL-OBJECTS>>>
		<TELL "It's in">
		<ARTICLE .L T>
		<TELL ,PERIOD>)
	       (T
		<WHERE-FIND .WHERE>)>>

<ROUTINE WHERE-FIND ("OPTIONAL" (WHERE <>))
	 <COND (.WHERE
		<TELL "Beats me." CR>)
	       (T
		<TELL "You'll have to do that yourself." CR>)>>

<ROUTINE V-FIRST-LOOK ()
	 <COND (<DESCRIBE-ROOM>
		<COND (<EQUAL? ,VERBOSITY 1 2>
		       <DESCRIBE-OBJECTS>)>)>>

<ROUTINE V-FOLLOW ()
	 <COND (<IN? ,PRSO ,HERE>
		<TELL "But">
		<ARTICLE ,PRSO T>
		<TELL " is right here!" CR>)
	       (<NOT <FSET? ,PRSO ,ACTORBIT>>
		<V-COUNT>)
	       (T
		<WHICH-WAY>
		<WHICH-WAY>
		<CRLF>)>>

<ROUTINE WHICH-WAY ()
	 <TELL "Which way did ">
	 <COND (<FSET? ,PRSO ,FEMALE>
	 	<TELL "s">)>
	 <TELL "he go? ">>

<GLOBAL FOLLOW-FLAG <>>

<ROUTINE I-FOLLOW ()
	 <SETG FOLLOW-FLAG <>>
	 <RFALSE>>

<ROUTINE PRE-GIVE ()
	 <COND (<AND <VERB? GIVE>
		     <PRSO? ,HANDS>>
		<PERFORM ,V?SHAKE-WITH ,PRSI>
		<RTRUE>)
	       (<IDROP>
		<RTRUE>)>>

<ROUTINE V-GET-DOWN ()
	 <COND (<PRSO? ,ROOMS>
		<DO-WALK ,P?DOWN>)
	       (T
		<PERFORM ,V?TAKE-OFF ,PRSO>
		<RTRUE>)>>

<ROUTINE V-GIVE ()
	 <COND (<AND <FSET? ,PRSI ,ACTORBIT>
		     <NOT <EQUAL? ,PRSI ,TAFT>>>
	        <TELL "Briskly,">
		<ARTICLE ,PRSI T>
		<TELL " refuses your offer." CR>)
	       (T
		<TELL "You can't give">
		<ARTICLE ,PRSO>
		<TELL " to">
		<ARTICLE ,PRSI>
		<TELL "!" CR>)>>

<ROUTINE V-HELLO ()
       <COND (<AND ,PRSO
	           <FSET? ,PRSO ,ACTORBIT>>
	      <TELL "\"Hello.\"" CR>
	      <STOP>)
	     (,PRSO
	      <PERFORM ,V?TELL ,PRSO>
	      <RTRUE>)
	     (T
	      <PERFORM ,V?TELL ,ME>
	      <RTRUE>)>>

<ROUTINE V-HELP ()
	 <TELL
"If you're really stuck, maps and hint booklets are available from your
dealer, or via mail order with the form that came in your package." CR>>

<ROUTINE V-HIDE ()
	 <COND (<AND <NOT ,PRSO>
		     <IN? ,TAFT ,HERE>
		     <RUNNING? ,I-MEET>>
		<PERFORM ,V?HIDE-BEHIND ,TAFT>
		<RTRUE>)
	       (T
		<COND (<AND <EQUAL? ,HERE ,PROP-ROOM>
			    <PRSO? ,TAFT>>
		       <TELL "There's no need to">)
		      (T
		       <TELL "You can't">)>
		<TELL " hide ">
		<COND (,PRSO
		       <TELL "t">)>
		<TELL "here." CR>)>>

<ROUTINE V-HIDE-BEHIND ()
	 <COND (,HIDING
		<TELL ,YOU-ARE CR>
		<RTRUE>)		
	       (T
		<V-DIG>)>>

<ROUTINE V-INHALE ()
	 <COND (<PRSO? ,AIR>
		<TELL "Deep-breathing -- good for the health." CR>)
	       (T
	        <V-COUNT>)>>

<ROUTINE V-KICK ()
	 <HACK-HACK "Flailing your leg at">>

<ROUTINE V-KILL ()
	 <COND (<AND <FSET? ,PRSO ,ACTORBIT>
		     <NOT <EQUAL? ,PRSO ,TAFT ,THUMB>>>
		<TELL "Thinking of your own safety, you refrain." CR>)
	       (T
		<TELL <PICK-ONE ,YUKS> CR>)>>

<ROUTINE V-KNOCK ()
	 <COND (<FSET? ,PRSO ,DOORBIT>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <PERFORM ,V?OPEN ,PRSO>
		       <RTRUE>)
		      (T
		       <TELL "Silence answers back." CR>)>)
	       (T
		<HACK-HACK "Knocking on">)>>

<ROUTINE V-KISS ()
	<COND (<AND <FSET? ,PRSO ,PERSON>
		    <NOT <EQUAL? ,PRSO ,TAFT>>>
	       <TELL "It would be totally out of character for">
	       <ARTICLE ,PRSO T>
	       <TELL " to be smooching with you right now." CR>
	       <RTRUE>)
	      (<AND <FSET? ,PRSO ,ACTORBIT>
		    <NOT <FSET? ,PRSO ,PERSON>>>
	       <TELL
"The ASPCA has taken people to court for lesser offences!" CR>)
	      (T
	       <TELL "Kissed." CR>)>>

<ROUTINE V-LAMP-OFF ()
	 <TELL "You can't turn that off." CR>>

<ROUTINE V-LAMP-ON ()
	 <TELL "You can't turn that on." CR>>

<ROUTINE V-LEAP ()
	 <COND (<AND ,PRSO
		     <NOT <IN? ,PRSO ,HERE>>>
		<V-COUNT>)
	       (<AND ,PRSO
		     <FSET? ,PRSO ,PERSON>>
		<PERFORM ,V?KILL ,PRSO>
		<RTRUE>) 
	       (T
		<TELL "Your feet barely leave the ground." CR>)>>

<ROUTINE V-LEAP-OFF ()
	 <COND (<FSET? ,PRSO ,VEHBIT>
		<PERFORM ,V?DISEMBARK ,PRSO>
		<RTRUE>)
	       (T
		<PERFORM ,V?LEAP ,PRSO>
		<RTRUE>)>>

<ROUTINE V-LEAN ()
	 <COND (<EQUAL? ,HERE ,TIGHTROPE-ROOM>
		<COND (<AND <RUNNING? ,I-TREMBLE>
			    <EQUAL? ,P-DIRECTION ,P?SOUTH ,P?NORTH>>
		       <COND (<OR <AND <EQUAL? ,P-DIRECTION ,P?SOUTH>
			               <NOT ,LEAN-NORTH?>>
				  <AND <EQUAL? ,P-DIRECTION ,P?NORTH>
				       ,LEAN-NORTH?>>
			      <TELL ,UNBALANCED>
		      	      <FLYING>		      
		      	      <TELL "And you fall ...">
		      	      <FALL-DOWN>
			      <RTRUE>)
			     (<PROB 40>
			      <TELL 
"Overly cautious, you don't put enough of " D ,ME " in that " D ,INTDIR "."
CR>)
			     (T
			      <TELL "You overcompensate, and are now">
			      <LEANING>
			      <COND (,LEAN-NORTH?
				     <LEAN>)
				    (T
				     <LEAN T>)>)>)
		     (T
		      <FLYING>
		      <TELL "You drop like a quail ...">
		      <FALL-DOWN>
		      <RTRUE>)>)
	       (T
		<V-DIG>)>>
			      		
<ROUTINE V-LEAVE ()
	 <COND (<NOT ,PRSO>
		<SETG PRSO ,ROOMS>)>
	 <COND (<PRSO? ,ROOMS>
		<DO-WALK ,P?OUT>)
	       (<FSET? ,PRSO ,VEHBIT>
		<PERFORM ,V?DISEMBARK ,PRSO>
		<RTRUE>)
	       (T
		<PERFORM ,V?DROP ,PRSO>
		<RTRUE>)>>

<ROUTINE V-LIE-DOWN ()
	 <TELL "There's no time for that." CR>>

<ROUTINE V-LISTEN ()
	 <TELL "At the moment,">
	 <ARTICLE ,PRSO T>
	 <TELL " makes no sound." CR>>

<ROUTINE PRE-LOCK ()
	 <COND (<AND <NOT <FSET? ,PRSO ,DOORBIT>>
		     <NOT <EQUAL? ,PRSO ,LION-CAGE>>>
		<V-COUNT>
		<RTRUE>)>
	 <COND (<PRSI? ,KEY>
		<RFALSE>)
	       (T
		<TELL "The " D ,PRSO " cannot be ">
		<COND (<VERB? UNLOCK>
		       <TELL "un">)>
		<TELL "locked with">
		<COND (,PRSI
		       <ARTICLE ,PRSI T>)
		      (T
		       <TELL " " D ,HANDS>)>
		<TELL ,PERIOD>)>
	 <RTRUE>>

<ROUTINE V-LOCK ()
	 <COND (<FSET? ,PRSO ,DOORBIT>
		<COND (<FSET? ,PRSO ,LOCKEDBIT>
		       <TELL "It already is." CR>)
		      (T
	               <FSET ,PRSO ,LOCKEDBIT>
		       <TELL
"Okay, the " D ,PRSO " is now locked." CR>)>)
	       (T
		<TELL <PICK-ONE ,YUKS> CR>)>>

<ROUTINE V-LOOK ()
	 <DESCRIBE-ROOM T>
	 <DESCRIBE-OBJECTS>>

<ROUTINE V-LOOK-BEHIND ()
	 <COND (<FSET? ,PRSO ,DOORBIT>
		<PERFORM ,V?LOOK-INSIDE ,PRSO>
		<RTRUE>)>
	 <TELL "There is nothing ">
	 <COND (<PRSO? ,CHUTE>
		<TELL "on the other side of">)
	       (T
		<TELL "behind">)>
	 <ARTICLE ,PRSO T>
	 <TELL ,PERIOD>>

<ROUTINE V-LOOK-DOWN ()
	 <COND (<NOT ,LIT>
		<TELL ,TOO-DARK CR>)
	       (<EQUAL? ,HERE ,TIGHTROPE-ROOM ,PLATFORM-1 ,PLATFORM-2>
	        <TELL 
"First lesson of a wire walker: NEVER look down. ">
		<COND (<IN? ,NET ,RING>
		       <TELL 
"However, you trust the net is in place.">)>
		<CRLF>)
	       (<PRSO? ,ROOMS>
		<PERFORM ,V?EXAMINE ,GROUND>
		<RTRUE>)
	       (T
		<PERFORM ,V?LOOK-INSIDE ,PRSO>
		<RTRUE>)>>

<ROUTINE V-LOOK-INSIDE ()
	 <COND (<PRSO? ,LIGHT ,DARKNESS>
		<PERFORM ,V?EXAMINE ,PRSO>
		<RTRUE>)
	       (<FSET? ,PRSO ,ACTORBIT>
		<TELL "There is nothing special to be seen." CR>)
	       (<FSET? ,PRSO ,SURFACEBIT>
		<COND (<PRSO? <LOC ,WINNER>>
		       <DESCRIBE-VEHICLE>
		       <RTRUE>)
		      (T
	               <TELL ,YOU-SEE>
		       <PRINT-CONTENTS ,PRSO>
		       <TELL " on">
		       <ARTICLE ,PRSO T>
		       <TELL ,PERIOD>)>)
	       (<FSET? ,PRSO ,DOORBIT>
		<TELL "All you can tell is that">
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <ARTICLE ,PRSO T>
		       <TELL " is open.">)
		      (T
		       <ARTICLE ,PRSO T>
		       <TELL " is closed.">)>
		<CRLF>)
	       (<AND <FSET? ,PRSO ,CONTBIT>
		     <NOT <PRSO? ,BALLOON>>>
		<COND (<PRSO? <LOC ,WINNER>>
		       <DESCRIBE-VEHICLE>
		       <RTRUE>)
		      (<SEE-INSIDE? ,PRSO>
		       <COND (<FIRST? ,PRSO>
			      <TELL ,YOU-SEE>
			      <PRINT-CONTENTS ,PRSO>
			      <COND (<EQUAL? ,PRSO ,RING>
				     <TELL " on">)
				    (T
				     <TELL " in">)>
			      <ARTICLE ,PRSO T>)
			     (T
			      <TELL ,EMPTY>)>
		       <TELL ,PERIOD>)
		      (<AND <NOT <FSET? ,PRSO ,OPENBIT>>
			    <FIRST? ,PRSO>>
		       <PERFORM ,V?OPEN ,PRSO>
		       <RTRUE>)
		      (T
		       <TELL "It seems that">
		       <ARTICLE ,PRSO T>
		       <TELL " is closed." CR>)>)
	       (T
		<TELL "You can't do that." CR>)>>

<ROUTINE V-LOOK-ON ()
	 <COND (<FSET? ,PRSO ,SURFACEBIT>
		<PERFORM ,V?LOOK-INSIDE ,PRSO>)
	       (T
		<PERFORM ,V?EXAMINE ,PRSO>
	 	<RTRUE>)>> 

<ROUTINE V-LOOK-OUTSIDE ()
	 <COND (<OR <FSET? ,PRSO ,DOORBIT>
		    <FSET? ,PRSO ,TRANSBIT>>
		<PERFORM ,V?LOOK-INSIDE ,PRSO>
		<RTRUE>)
	       (T
		<V-LOOK>
		<RTRUE>)>>

<ROUTINE V-LOOK-UNDER ()
	 <COND (<HELD? ,PRSO>
		<COND (<FSET? ,PRSO ,WORNBIT>
		       <TELL "You're wearing it!" CR>)
		      (T
		       <TELL "You're holding it!" CR>)>)
	       (T
		<TELL "There's nothing eye-catching under">
		<ARTICLE ,PRSO T>
		<TELL ,PERIOD>)>>

<ROUTINE V-LOOK-UP ()
	 <COND (<NOT ,LIT>
		<TELL ,TOO-DARK CR>)
	       (<PRSO? ,ROOMS>
		<COND (<NOT <FSET? ,HERE ,INDOORSBIT>>
		       <TELL "The sky is an inky black.">
		       <CRLF>)
		      (<EQUAL? ,HERE ,RING>
       		       <TELL 
,YOU-SEE " the supporting apparatus for the " D ,TIGHTROPE-OBJECT "." CR>)
		      (<EQUAL? ,HERE ,UNDER-STANDS>
		       <TELL 
"From here the " D ,GRANDSTAND " resembles a huge venetian blind, letting in
broad panels of hazy light." CR>)
		      (<AND <EQUAL? ,HERE ,PLATFORM-2>
			    <NOT <FSET? ,BALLOON ,TOUCHBIT>>>
		       <TELL <GETP ,BALLOON ,P?FDESC> CR>)
		      (T
		       <PERFORM ,V?EXAMINE ,CEILING>
		       <RTRUE>)>)
	       (T
		<PERFORM ,V?LOOK-INSIDE ,PRSO>
		<RTRUE>)>>

<ROUTINE V-LOWER ()
	 <V-RAISE>>

<ROUTINE V-MAKE ()
	 <TELL "You can't make">
	 <ARTICLE ,PRSO>
	 <TELL "!" CR>>

<ROUTINE V-MOVE ()
	 <COND (<HELD? ,PRSO>
		<TELL "Why juggle objects?" CR>)
	       (<LOC-CLOSED>
		<RTRUE>)
	       (<OR <FSET? ,PRSO ,TAKEBIT>
		    <FSET? ,PRSO ,TRYTAKEBIT>>
		<TELL "Moving">
		<ARTICLE ,PRSO T>
		<TELL " reveals nothing." CR>)
	       (T
		<TELL "You can't move">
		<ARTICLE ,PRSO T>
		<TELL ,PERIOD>)>>

<ROUTINE V-MUNG ()
	 <HACK-HACK "Trying to break">>

<ROUTINE V-NO ()
	 <COND (<EQUAL? ,AWAITING-REPLY 6>
		<COND (<EQUAL? ,DID-C 0>		       
		       <TELL "\"Of course you did now, didn't you?\"">)
		      (T		       
		       <TELL "\"Did so.\"">)>
		<FCLEAR ,PROTAGONIST ,RMUNGBIT> ;"Can't win Did puzzle"
		<CRLF>)
	       (<EQUAL? ,AWAITING-REPLY 7>
		<TELL "Quit your " D ,GRANDSTAND "ing." CR>)
	       (<EQUAL? ,AWAITING-REPLY 9>
		<TELL "We didn't think so." CR>)
	       (<EQUAL? ,AWAITING-REPLY 10>
		<SETG AWAITING-REPLY 11>
		<V-YES>)
	       (<EQUAL? ,AWAITING-REPLY 11>
		<DO-WALK ,P?SOUTH>)
	       (<EQUAL? ,AWAITING-REPLY 12>
		<SETG EGRESS-C 0>
		<TELL "That's the spirit." CR>)
	       (<EQUAL? ,AWAITING-REPLY 13>
		<TELL "Then think of one." CR>)
	       (T
		<TELL "You sound rather negative." CR>)>>
	                    
<ROUTINE V-OPEN ("AUX" F STR)
	 <COND (<FSET? ,PRSO ,SURFACEBIT>
		<V-COUNT>)
	       (<FSET? ,PRSO ,ACTORBIT>
		<V-COUNT>)
	       (<FSET? ,PRSO ,CONTBIT>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <TELL ,ALREADY-OPEN CR>)
		      (T
		       <FSET ,PRSO ,OPENBIT>
		       <FSET ,PRSO ,TOUCHBIT>
		       <COND (<OR <NOT <FIRST? ,PRSO>>
				  <FSET? ,PRSO ,TRANSBIT>>
			      <TELL "Opened." CR>)
			     (T
			      <TELL "Opening">
			      <ARTICLE ,PRSO T>
			      <TELL " reveals">
			      <PRINT-CONTENTS ,PRSO>
			      <TELL ,PERIOD>)>)>)
	       (<FSET? ,PRSO ,DOORBIT>             ;"see above clause"
		<COND (<AND <VERB? OPEN>
		            <EQUAL? ,PRSI ,KEY>>
	               <PERFORM ,V?UNLOCK ,PRSO ,KEY>
		       <RTRUE>)
	       	      (<NOT <FSET? ,PRSO ,LOCKEDBIT>>
		       <COND (<NOT <FSET? ,PRSO ,OPENBIT>>
			      <FSET ,PRSO ,OPENBIT>
			      <TELL "The " D ,PRSO " swings open." CR>)
			     (T
			      <TELL "It's already open." CR>)>)
		      (T
		       <TELL "The " D ,PRSO " is locked." CR>)>)
	       (T
		<CANT-OPEN>)>>

<ROUTINE V-PASS ("AUX" ACTOR)
	 <COND (<OR <FSET? ,PRSO ,TAKEBIT>
		    ;<EQUAL? ,PRSO ,INTNUM ,GLOBAL-MONEY>>
		<COND (<OR <SET ACTOR <FIND-IN ,HERE ,ACTORBIT>>
			   <SET ACTOR <FIND-IN ,PROTAGONIST ,ACTORBIT>>>
		       <TELL "(to">
		       <ARTICLE .ACTOR T>
		       <TELL ")" CR>
		       <PERFORM ,V?GIVE ,PRSO .ACTOR>
		       <RTRUE>)
		      (T
		       <V-COUNT>)>)
	       (T
		<SETG IN-FRONT-FLAG T>
		<PERFORM ,V?BOARD ,PRSO>
		<RTRUE>)>>

<ROUTINE V-PICK ()
	 <COND (<FSET? ,PRSO ,DOORBIT>
		<TELL "You're no locksmith." CR>)
	       (T
		<V-COUNT>)>>

<ROUTINE V-PICK-UP ()
	 <PERFORM ,V?TAKE ,PRSO ,PRSI>
	 <RTRUE>>

<ROUTINE V-PLAY ()
	 <V-COUNT>>

<ROUTINE V-POUR ()
	 <V-INHALE>>

<ROUTINE V-PUNCH ()
	 <PERFORM ,V?KILL ,PRSO>
	 <RTRUE>>

<ROUTINE V-PUSH ()
	 <COND (<AND <PRSO? ,POLE>
		     <NOT <FSET? ,POLE ,TOUCHBIT>>>
		<PERFORM ,V?TAKE ,POLE>
		<RTRUE>)
	       (<EQUAL? ,P-PRSA-WORD ,W?PULL>
		<HACK-HACK "Pulling">)	       
	       (T
		<HACK-HACK "Pushing">)>>

<ROUTINE PRE-PUT ()
	 <COND (<PRSI? ,GROUND>
	        <PERFORM ,V?DROP ,PRSO>
		<RTRUE>)
	       (<AND <VERB? PUT>
		     <EQUAL? ,HERE ,CON-AREA>
		     <PRSO? ,GLOBAL-WATER>
		     ,PRSI>
		<PERFORM ,V?FILL ,PRSI ,GLOBAL-WATER>
		<RTRUE>)
	       (<PRSO? ,HANDS>
		<COND (<VERB? PUT>
		       <PERFORM ,V?REACH-IN ,PRSI>
		       <RTRUE>)
		      (T
		       <V-COUNT>)>)
	       (<HELD? ,PRSI ,PRSO>
;"formerly <PRSO? <LOC ,PRSI>> but that only checked down one level"
		<TELL "You can't put">
		<ARTICLE ,PRSO T>
		<TELL " in">
		<ARTICLE ,PRSI T>
		<TELL " when">
		<ARTICLE ,PRSI T>
		<TELL " is already in">
		<ARTICLE ,PRSO T>
		<TELL "!" CR>)
	       (,IN-FRONT-FLAG
		<V-DIG>)
	       (<IDROP>
		<RTRUE>)>>

<ROUTINE V-PUT ()
	 <COND (<AND <NOT <FSET? ,PRSI ,OPENBIT>>
		     <NOT <FSET? ,PRSI ,DOORBIT>>
		     <NOT <FSET? ,PRSI ,CONTBIT>>
		     <NOT <FSET? ,PRSI ,SURFACEBIT>>
		     <NOT <FSET? ,PRSI ,VEHBIT>>>
		<TELL "You can't put">
		<ARTICLE ,PRSO T>
		<TELL " in">
		<ARTICLE ,PRSI>
		<TELL "!" CR>
		<RTRUE>)
	       (<FSET? ,PRSI ,ACTORBIT>
		<V-COUNT>)
	       (<OR <PRSI? ,PRSO>
		    <AND <HELD? ,PRSO>
			 <NOT <FSET? ,PRSO ,TAKEBIT>>>>
		<TELL "How can you do that?" CR>)
	       (<AND <NOT <FSET? ,PRSI ,OPENBIT>>
		     <NOT <FSET? ,PRSI ,SURFACEBIT>>>
		<TELL "Inspection reveals that">
		<ARTICLE ,PRSI T>
		<TELL " isn't open." CR>
		<SETG P-IT-OBJECT ,PRSI>)
	       (<IN? ,PRSO ,PRSI>
		<TELL "But">
		<ARTICLE ,PRSO T>
		<TELL " is already in">
		<ARTICLE ,PRSI T>
		<TELL ,PERIOD>)
	       (<G? <- <+ <WEIGHT ,PRSI> <GETP ,PRSO ,P?SIZE>>
		       <GETP ,PRSI ,P?SIZE>>
		    <GETP ,PRSI ,P?CAPACITY>>
		<COND (<AND <FSET? ,PRSI ,VEHBIT>
			    <NOT <EQUAL? ,PRSI ,STAND>>>
		       <V-DIG>)
		      (T
		       <TELL "There's no room ">
		       <COND (<FSET? ,PRSO ,SURFACEBIT>
			      <TELL "on">)
			     (T
			      <TELL "in">)>
		       <TELL " the " D ,PRSI " for">
		       <ARTICLE ,PRSO T>
		       <TELL ,PERIOD>)>)
	       (<AND <NOT <HELD? ,PRSO>>
		     <EQUAL? <ITAKE> ,M-FATAL <>>>
		<RTRUE>)
	       (T
		<MOVE ,PRSO ,PRSI>
		<FSET ,PRSO ,TOUCHBIT>
		<TELL "Done." CR>)>>

<ROUTINE V-PUT-BEHIND ()
	 <V-DIG>>

<ROUTINE V-PUT-ON ()
	 <COND (<OR <PRSI? ,ME>
		    <AND <PRSI? ,HEAD>
		         <PRSO? ,MASK>>>
		<PERFORM ,V?WEAR ,PRSO>
		<RTRUE>)
	       (<FSET? ,PRSI ,SURFACEBIT>
		<V-PUT>)
	       (<AND <FSET? ,PRSI ,PERSON>
		     <NOT <EQUAL? ,PRSI ,TAFT ,DICK>>>
		<TELL "Perturbed,">
		<ARTICLE ,PRSI T>
		<TELL " stays your mischievous hand." CR>)
	       (<AND <FSET? ,PRSO ,WEARBIT>
		     <FSET? ,PRSI ,ACTORBIT>>
		<TELL "The " D ,PRSO " isn't">
		<ARTICLE ,PRSI T>
	        <TELL "'s style." CR>)
	       (T
		<TELL "There's no good surface on">
		<ARTICLE ,PRSI T>
		<TELL ,PERIOD>)>>

<ROUTINE V-PUT-OUTSIDE ()
	 <V-DIG>>

<ROUTINE V-PUT-UNDER ()
         <V-DIG>>

<ROUTINE V-RAISE ()
	 <HACK-HACK "Playing in this way with">>

<ROUTINE V-REACH-IN ("AUX" OBJ)
	 <SET OBJ <FIRST? ,PRSO>>
	 <COND (<OR <FSET? ,PRSO ,ACTORBIT>
		    <FSET? ,PRSO ,SURFACEBIT>
		    <NOT <FSET? ,PRSO ,CONTBIT>>>
		<TELL <PICK-ONE ,YUKS> CR>)
	       (<NOT <FSET? ,PRSO ,OPENBIT>>
		<TELL "It's not open." CR>)
	       (<OR <NOT .OBJ>
		    <FSET? .OBJ ,INVISIBLE>
		    <NOT <FSET? .OBJ ,TAKEBIT>>>
		<TELL "There's nothing in">
		<ARTICLE ,PRSO T>
		<TELL ,PERIOD>)
	       (T
		<TELL "You reach into">
		<ARTICLE ,PRSO T>
		<TELL " and feel something." CR>
		<SETG P-IT-OBJECT <FIRST? ,PRSO>>
		<RTRUE>)>>

<ROUTINE PRE-READ ()
	 <COND (<NOT ,LIT>
		<TELL ,TOO-DARK CR>)
	       (<PRSO? HEAD>
		<PERFORM ,V?RUB ,HEAD>
		<RTRUE>)
	       (<AND ,PRSI
		     <NOT <FSET? ,PRSI ,TRANSBIT>>>
		<TELL "How does one look through">
		<ARTICLE ,PRSI>
		<TELL "?" CR>)>>

<ROUTINE V-READ ()
         <TELL "How can you read">
	 <ARTICLE ,PRSO>
	 <TELL "?" CR>>

<ROUTINE V-RELEASE ()
	 <COND (<PRSO? ,ROOMS>
		<V-COUNT>)
	       (T
		<PERFORM ,V?DROP ,PRSO>
		<RTRUE>)>>

<ROUTINE V-REMOVE ()
	 <COND (<FSET? ,PRSO ,WEARBIT>
		<PERFORM ,V?TAKE-OFF ,PRSO>
		<RTRUE>)
	       (T
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)>>

<ROUTINE V-REPLY ()
	 <TELL "It is hardly likely that">
	 <ARTICLE ,PRSO T>
	 <TELL " is interested." CR>
	 <STOP>>

<ROUTINE V-RUB ()
	 <COND (<LOC-CLOSED>
		<RTRUE>)
	       (<PRSO? ,HEAD>
		<TELL 
"You feel the bumps but lack the interpretive skills of the phrenologist." CR>)
	       (T
		<HACK-HACK "Fiddling with">)>>

<ROUTINE V-SAVE-SOMETHING ()
	 <COND (<AND <RUNNING? ,I-BOOST>
		     <IN? ,THUMB ,HERE>>
		<PERFORM ,V?RAISE ,THUMB>
		<RTRUE>)
	       (T
		<TELL "Sorry, but">
	 	<ARTICLE ,PRSO T>
	 	<TELL " is beyond help." CR>)>>

<ROUTINE V-SEARCH ()
	 <COND (<AND <FSET? ,PRSO ,PERSON>
		     <NOT <EQUAL? ,PRSO ,TAFT ,CROWD>>>
		<TELL "It seems">
		<ARTICLE ,PRSO T>
		<TELL 
" isn't the sort of person who'd allow such a frisking without a search
warrant." CR>
		<RTRUE>)
	       (<FSET? ,PRSO ,CONTBIT>
		<COND (<PRSO? <LOC ,WINNER>>
		       <DESCRIBE-VEHICLE>
		       <RTRUE>)
		      (<NOT <FSET? ,PRSO ,OPENBIT>>
		       <TELL-OPEN-FIRST>
		       <RTRUE>)
		      (<AND <FIRST? ,PRSO>
			    <NOT <FSET? <FIRST? ,PRSO> ,NDESCBIT>>>
		       <TELL ,YOU-SEE>
		       <PRINT-CONTENTS ,PRSO>
		       <TELL ,PERIOD>
		       <RTRUE>)>)>
	 <TELL "You find nothing unusual." CR>>

<ROUTINE V-SEARCH-OBJECT-FOR ()
	 <COND (<FSET? ,PRSO ,PERSON>
		<PERFORM ,V?SEARCH ,PRSO>)
	       (<AND <FSET? ,PRSO ,CONTBIT>
		     <NOT <FSET? ,PRSO ,OPENBIT>>>
		<TELL-OPEN-FIRST>)
	       (<OR <IN? ,PRSI ,PRSO>
		    <IN? ,PRSI ,HERE>>
		<TELL "Very observant. There "
			<COND (<FSET? ,PRSI ,FEMALE> "she")
			      (<FSET? ,PRSI ,PERSON> "he")
			      (T "it")>
			" is." CR>)
	       (T 
		<TELL "You don't find">
		<ARTICLE ,PRSI T>
		<TELL " there." CR>)>>

<ROUTINE TELL-OPEN-FIRST ()
	 <TELL "You'll have to open">
	 <ARTICLE ,PRSO T>
	 <TELL " first." CR>>

<ROUTINE V-SET ()
	 <COND (<PRSO? ,ROOMS>
		<COND (<EQUAL? ,HERE ,TIGHTROPE-ROOM>	
		       <COND (,HEADING-EAST?
			      <DO-WALK ,P?WEST>)
			     (T
			      <DO-WALK ,P?EAST>)>)
		      (T
		       <TELL <PICK-ONE ,WASTES> CR>)>)
	       (<NOT ,PRSI>
	        <COND (<FSET? ,PRSO ,TAKEBIT>
		       <HACK-HACK "Turning">)
		      (T
		       <TELL ,NOT-HOLDING>
		       <ARTICLE ,PRSO T>
		       <TELL ,PERIOD>)>)
	       (T
		<V-COUNT>)>>

<ROUTINE V-SGIVE ()
	 <PERFORM ,V?GIVE ,PRSI ,PRSO>
	 <RTRUE>>

<ROUTINE V-SHAKE ("AUX" X)
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<TELL "Be real." CR>)
	       (T
		<HACK-HACK "Shaking">)>>

<ROUTINE V-SHAKE-WITH ()
	 <COND (<NOT <PRSO? ,HANDS>>
		<V-TELL-TIME>)
	       (<NOT <FSET? ,PRSI ,ACTORBIT>>
		<TELL "But">
		<ARTICLE ,PRSI T>
		<TELL " doesn't even have hands." CR>)
	       (T
		<PERFORM ,V?THANK ,PRSI>
		<RTRUE>)>>
	       
<ROUTINE V-SHOW ()
	 <TELL "It's doubtful">
	 <ARTICLE ,PRSI T>
	 <TELL " is interested." CR>>

<ROUTINE V-SIT ("AUX" VEHICLE)
	 <COND (<SET VEHICLE <FIND-IN ,HERE ,VEHBIT>>
		<PERFORM ,V?BOARD .VEHICLE>
		<RTRUE>)
               (T
		<V-DIG>)>>

<ROUTINE V-SKIP ()
	 <TELL "Wasn't that fun?" CR>>

<ROUTINE V-SLEEP ()
	 <TELL "Temporary insomnia prevents this." CR>>

<ROUTINE V-SMELL ()
	 <COND (<NOT ,PRSO>
		<TELL "You smell nothing " <PICK-ONE ,YAWNS> "." CR>)
	       (T
		<TELL "It smells just like">
	 	<ARTICLE ,PRSO>
	 	<TELL ,PERIOD>)>>

<ROUTINE V-SMILE ()
         <TELL "How nice." CR>>

<ROUTINE V-SPIN ()
	 <TELL "You can't spin that!" CR>>     

<ROUTINE V-SPUT-ON ()
         <PERFORM ,V?PUT-ON ,PRSI ,PRSO>
	 <RTRUE>>

<ROUTINE V-SSHOW ()
	 <PERFORM ,V?SHOW ,PRSI ,PRSO>
	 <RTRUE>>

<ROUTINE V-STAND ()
	 <COND (<AND ,PRSO
		     <NOT <EQUAL? ,PRSO ,ROOMS>>>
		<V-DIG>)
	       (<FSET? <LOC ,WINNER> ,VEHBIT>
		<PERFORM ,V?DISEMBARK <LOC ,WINNER>>
		<RTRUE>)
	       (T
		<TELL "You are already standing." CR>)>>

<ROUTINE V-STAND-ON ()
	 <V-DIG>>

<ROUTINE V-STELL ()
	 <PERFORM ,V?TELL ,PRSI>
	 <RTRUE>>

<ROUTINE V-STOP ()
	 <TELL <PICK-ONE ,YUKS> CR>>

<ROUTINE PRE-TAKE ()
	 <COND (<EQUAL? ,PRSO ,PSEUDO-OBJECT>
		<RFALSE>)
	       (<LOC-CLOSED>
		<RTRUE>)
	       (<OR <AND <EQUAL? ,PRSI <LOC ,PRSO>>
			 <NOT <VERB? TAKE-WITH>>>
		    <EQUAL? ,PRSO ,MONKEY ,FLOWER>>
		<RFALSE>)
	       (<AND <EQUAL? ,PRSO ,KEY>
		     <EQUAL? ,PRSI ,KEY>>
		<RFALSE>)
	       (<AND ,PRSI
		     <VERB? TAKE>
		     <PRSI? POLE>>
		<PERFORM ,V?TAKE-WITH ,PRSO ,POLE>
		<RTRUE>)
	       (<OR <IN? ,PRSO ,PROTAGONIST>
		    <AND <HELD? ,PRSO>
			 <NOT <FSET? ,PRSO ,TAKEBIT>>>>
		<COND (<FSET? ,PRSO ,WORNBIT>
		       <TELL "You are already wearing it." CR>)
		      (T
		       <HAVE-IT>)>)
	       (,PRSI
		<COND (<VERB? TAKE-WITH>
		       <COND (<PRSI? ,HANDS>
			      <PERFORM ,V?TAKE ,PRSO>
			      <RTRUE>)
		       	     (<AND <NOT <HELD? ,PRSI>>
				   ;<NOT <EQUAL? ,PRSI ,GLOBAL-MONEY>>>
			      <TELL ,NOT-HOLDING>
			      <ARTICLE ,PRSI T>
			      <TELL ,PERIOD>
			      <RTRUE>)			     
			     (<HELD? ,PRSO>
			      <HAVE-IT>)
			     (T
			      <RFALSE>)>)
		      (<PRSO? ,ME>
		       <PERFORM ,V?DROP ,PRSI>
		       <RTRUE>)
		      (<AND <EQUAL? ,HERE ,CON-AREA>
			    <PRSO? ,GLOBAL-WATER>>
		       <RFALSE>)
		      (<NOT <PRSI? <LOC ,PRSO>>>			    
		       <TELL "But">
		       <ARTICLE ,PRSO T>
		       <TELL " isn't ">
		       <COND (<FSET? ,PRSI ,ACTORBIT>
			       <TELL "being held by">)
			     (<FSET? ,PRSI ,SURFACEBIT>
			      <TELL "on">)
			     (T
			      <TELL "in">)>
		       <ARTICLE ,PRSI T>
		       <TELL ,PERIOD>)
		      (T
		       <SETG PRSI <>>
		       <RFALSE>)>)
	       (<PRSO? <LOC ,WINNER>>
		<TELL "You are on it!" CR>)>>

<ROUTINE HAVE-IT ()
	 <TELL "You already have ">
	 <COND (<PRSO? ,THUMB>
		<TELL "him">)	
	       (T
	        <TELL "it">)>
         <TELL ,PERIOD>>

<ROUTINE V-TAKE ()
	 <COND (<EQUAL? <ITAKE> T>
		<TELL "Taken." CR>)>
	 <RTRUE>>

<ROUTINE V-TAKE-OFF ()
	 <COND (<FSET? ,PRSO ,WORNBIT>
		<FCLEAR ,PRSO ,WORNBIT>
		<TELL "Okay, you're no longer wearing">
		<ARTICLE ,PRSO T>
		<TELL ,PERIOD>
		<COND (<PRSO? ,MASK>
		       <PUTP ,PROTAGONIST ,P?ACTION ,PROTAGONIST-F>)>
		<RTRUE>)
	       (<FSET? ,PRSO ,VEHBIT>
		<PERFORM ,V?DISEMBARK ,PRSO>
		<RTRUE>)
	       (<PRSO? ,BIGTOP ,PLATFORM>
		<COND (<EQUAL? ,HERE ,PLATFORM>
		       <DO-WALK ,P?DOWN>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>
		<RTRUE>)
	       (<FSET? ,PRSO ,WEARBIT>
		<TELL "You aren't wearing that!" CR>)
	       (T
		<V-DIG>)>>

<ROUTINE V-TAKE-WITH ()
	 <TELL "Well,">
	 <ARTICLE ,PRSI T>
	 <TELL " is of little use in obtaining">
	 <ARTICLE ,PRSO T>
	 <TELL ,PERIOD>>

<ROUTINE V-TALK-INTO ()
	 <V-COUNT>>

<ROUTINE V-TASTE ()
	 <TELL "Yuck!" CR>>

<ROUTINE V-TELL ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<COND (,P-CONT
		       <SETG WINNER ,PRSO>
		       <SETG HERE <LOC ,WINNER>>
		       <RTRUE>)
		      (T
		       <TELL "Hmmm ...">
		       <ARTICLE ,PRSO T>
		       <COND (<EQUAL? ,PRSO ,GUARD>
			      <TELL " appears willing to listen to you">)
			     (T
			      <TELL
" looks at you expectantly, as if you seemed to be about to talk">)>
		       <TELL ,PERIOD>)>)
	       (T
		<TELL "You can't talk to">
		<ARTICLE ,PRSO>
		<TELL "!" CR>
		<STOP>)>>

<ROUTINE V-TELL-ABOUT ()
	 <COND (<PRSO? ,ME>
		<PERFORM ,V?WHAT ,PRSI>
		<RTRUE>)
	       (T
		<TELL "It doesn't look like">
		<ARTICLE ,PRSO T>
		<TELL " is interested." CR>)>>

<ROUTINE V-TELL-TIME ()
	 <TELL ,BAD-SENTENCE CR>>

<ROUTINE V-TELL-NAME ()
	 <V-TELL-TIME>>

<ROUTINE V-THANK ()
	 <COND (<AND ,PRSO
		     <FSET? ,PRSO ,PERSON>>		     
		<TELL "You're more than welcome." CR>)
	       (T
		<TELL <PICK-ONE ,YUKS> CR>)>>

<ROUTINE V-THROUGH ("AUX" M)
	<COND (<FSET? ,PRSO ,DOORBIT>
	       <DO-WALK <OTHER-SIDE ,PRSO>>
	       <RTRUE>)
	      (<FSET? ,PRSO ,VEHBIT>
	       <PERFORM ,V?BOARD ,PRSO>
	       <RTRUE>)
	      (<PRSO? ,INTDIR>
	       <PERFORM ,V?WALK ,PRSO>
	       <RTRUE>)
	      (<NOT <FSET? ,PRSO ,TAKEBIT>>
	       <TELL-HIT-HEAD>)
	      (<IN? ,PRSO ,WINNER>
	       <PERFORM ,V?EXAMINE ,HEAD>
	       <RTRUE>)
	      (T
	       <V-INHALE>)>>

<ROUTINE PRE-THROW ()
	 <COND (<IDROP>
		<RTRUE>)>>

<ROUTINE V-THROW ()
	 <COND (<AND ,PRSI
		     <NOT <EQUAL? ,PRSI ,GROUND>>>
		<MOVE ,PRSO ,HERE>
		<TELL "Your aim is way off,">
		<ARTICLE ,PRSO T>
		<TELL " goes sailing by." CR>)
	       (<GETP ,HERE ,P?GROUND-LOC>
		<PERFORM ,V?THROW-OFF ,PRSO ,LION-CAGE>
		<RTRUE>)
	       (T
		<MOVE ,PRSO ,HERE>
		<TELL "Thrown." CR>)>>

<ROUTINE V-THROW-OFF ()
	 <COND (<AND <GETP ,HERE ,P?GROUND-LOC>
		     <EQUAL? ,PRSI ,PLATFORM>>
		<MOVE ,PRSO <GETP ,HERE ,P?GROUND-LOC>>
	        <TELL "It falls to the ground below." CR>)
	       (T
		<V-COUNT>)>>

<ROUTINE V-TIE ()
	 <TELL "You can't tie">
	 <ARTICLE ,PRSO>
	 <COND (,PRSI
		 <TELL " to">
		 <ARTICLE ,PRSI>)>
	 <TELL ,PERIOD>>

<ROUTINE V-UNLOCK ()
	 <COND (<FSET? ,PRSO ,DOORBIT>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <PERFORM ,V?LOCK ,PRSO ,PRSI>
		       <RTRUE>)
		      (<FSET? ,PRSO ,LOCKEDBIT>
		       <FCLEAR ,PRSO ,LOCKEDBIT>
		       <TELL 
"The " D ,PRSO " is now unlocked." CR>)
		      (T
	               <TELL
"But the " D ,PRSO " isn't locked." CR>)>)
		 (T
		  <TELL <PICK-ONE ,YUKS> CR>)>>

<ROUTINE V-UNTIE ()
	 <V-INHALE>>

<ROUTINE V-VAULT ()
	 <COND (<AND <NOT ,PRSI>
		     <NOT <HELD? ,POLE>>>
		<TELL "You have no pole." CR>)
	       (<OR <EQUAL? ,PRSI ,POLE>
		    <AND <NOT ,PRSI>
			 <HELD? ,POLE>
			 <NOT <HELD? ,PRSO>>
			 <NOT <FSET? ,PRSO ,TAKEBIT>>>>
		<TELL 
"You carefully mark off the steps leading up to">
		<ARTICLE ,PRSO T>
	        <TELL 
" but, right before the approach, you're psyched out by the image of " D ,ME
" in a full body-cast." CR>)
	      (T
	       <V-COUNT>)>> 
		
<ROUTINE V-WALK ("AUX" PT PTS STR OBJ RM)
	 <COND (<NOT ,P-WALK-DIR>
		<PERFORM ,V?WALK-TO ,PRSO>
		<RTRUE>)
	       (<SET PT <GETPT ,HERE ,PRSO>>
		<COND (<EQUAL? <SET PTS <PTSIZE .PT>> ,UEXIT>
		       <GOTO <GETB .PT ,REXIT>>)
		      (<EQUAL? .PTS ,NEXIT>
		       <TELL <GET .PT ,NEXITSTR> CR>
		       <RFATAL>)
		      (<EQUAL? .PTS ,FEXIT>
		       <COND (<SET RM <APPLY <GET .PT ,FEXITFCN>>>
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
			      <TELL ,CANT-GO CR>
			      <RFATAL>)>)
		      (<EQUAL? .PTS ,DEXIT>
		       <COND (<FSET? <SET OBJ <GETB .PT ,DEXITOBJ>> ,OPENBIT>
			      <GOTO <GETB .PT ,REXIT>>)
			     (<SET STR <GET .PT ,DEXITSTR>>
			      <TELL .STR CR>
			      <SETG P-IT-OBJECT .OBJ>
			      <RFATAL>)
			     (T
			      <TELL "The " D .OBJ " is closed." CR>
			      <SETG P-IT-OBJECT .OBJ>
			      <RFATAL>)>)>)
	       (T
		<COND (<PRSO? ,P?OUT ,P?IN>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,CANT-GO CR>)>
		<RFATAL>)>>

<ROUTINE V-WALK-AROUND ()
	 <SETG AWAITING-REPLY 13>
	 <ENABLE <QUEUE I-REPLY 2>>
	 <TELL "Did you have any particular direction in mind?" CR>>

<ROUTINE V-WALK-OVER ()
	 <COND (<PRSO? ,CHUTE>
		<PERFORM ,V?LOOK-BEHIND ,CHUTE>
		<RTRUE>)
	       (T
		<PERFORM ,V?THROUGH ,PRSO>
		<RTRUE>)>>

<ROUTINE V-WALK-TO ()
	 <COND (,PRSO
		<COND (<EQUAL? ,PRSO ,INTDIR>
		       <DO-WALK ,P-DIRECTION>
		       <RTRUE>)
		      (T
		       <V-FOLLOW>)>)
	       (T
		<V-WALK-AROUND>)>>

<ROUTINE V-WAIT ("OPTIONAL" (NUM 3))
	 <TELL "Time passes..." CR>
	 <REPEAT ()
		 <COND (<L? <SET NUM <- .NUM 1>> 0>
			<RETURN>)
		       (<CLOCKER>
			<RETURN>)>>
	 <SETG CLOCK-WAIT T>>

<ROUTINE V-WAIT-FOR ()
	 <TELL "You may be waiting quite a while." CR>>

<ROUTINE V-WAIT-IN ()
	 <COND (<EQUAL? <LOC ,PROTAGONIST> ,PRSO>
		<V-WAIT>)
	       (<FSET? ,PRSO ,VEHBIT>
		<PERFORM ,V?BOARD ,PRSO>
		<RTRUE>)
	       (T
		<V-COUNT>)>>

<ROUTINE V-WAVE ()
	 <V-INHALE>>

<ROUTINE V-WAVE-AT ()
	 <COND (<NOT ,PRSO>
		<V-SMILE>)
	       (T
		<TELL "Despite your friendly nature,">
		<ARTICLE ,PRSO T>
		<TELL " isn't likely to respond." CR>)>>

<ROUTINE PRE-WEAR ()
	 <COND (<NOT <FSET? ,PRSO ,WEARBIT>>
		<TELL "You can't wear">
		<ARTICLE ,PRSO T>
		<TELL ,PERIOD>
		<RTRUE>)
	       (<FSET? ,PRSO ,WORNBIT>
		<TELL "You're already wearing">
		<ARTICLE ,PRSO T>
		<TELL "!" CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE V-WEAR ()
         <MOVE ,PRSO ,PROTAGONIST>
         <FSET ,PRSO ,WORNBIT>
	 <TELL "You are now wearing">
	 <ARTICLE ,PRSO T>
	 <TELL ,PERIOD>>

<ROUTINE V-WHAT ()
	 <COND (<NOT ,PRSO>
		<TELL "That's what." CR>)
	       (T
		<TELL "Good question." CR>)>
	 <STOP>>

<ROUTINE V-WHERE ()
	 <COND (,PRSO
		<V-FIND T>)
	       (T
		<TELL "Right here." CR>)>>

<ROUTINE V-WHO ()
	 <COND (<NOT ,PRSO>
		<TELL "You." CR>)
	       (<FSET? ,PRSO ,ACTORBIT>
		<PERFORM ,V?WHAT ,PRSO>
		<RTRUE>)
	       (T
		<TELL "That's not a person!" CR>)>>

<ROUTINE V-WHY ()
	 <TELL "Why not?" CR>>

<ROUTINE V-YELL ()
	 <TELL "You begin to get a sore throat." CR>
	 <STOP>>

<ROUTINE I-REPLY ()
	 <SETG AWAITING-REPLY <>>
	 <RFALSE>>

<GLOBAL AWAITING-REPLY <>>

<ROUTINE V-YES ("AUX" VEH)
	 <SET VEH <LOC ,PROTAGONIST>>
	 <COND
	       
	       (<EQUAL? ,AWAITING-REPLY 6>
		<COND (<NOT <EQUAL? ,DID-C 0>>
		       <FSET ,PROTAGONIST ,RMUNGBIT>
		       <TELL 
"\"Did not ... Er, um ... Well, I guess I didn't answer that question
before. All I can say is that I haven't seen the kid all evening.\"" CR>)
		      (T
		       <TELL "\"Thought you'd see it my way.\"" CR>
		       <SETG DID-C 0>
		       <DISABLE <INT I-DID>>)>)
	       (<EQUAL? ,AWAITING-REPLY 7>
		<TELL "Real brainy of you." CR>)
	       (<EQUAL? ,AWAITING-REPLY 9>
		<TELL "For shame." CR>)
	       (<EQUAL? ,AWAITING-REPLY 10 12>
	        <DO-WALK ,P?SOUTH>)
	       (<EQUAL? ,AWAITING-REPLY 11>
	        <SETG EGRESS-C 0>
		<TELL 
"Then you'd be helpless against this dangerous beast." CR>)
	       (<EQUAL? ,AWAITING-REPLY 13>
		<TELL "Then supply it." CR>)
	       (T
	        <TELL "Yes?" CR>)>>
         
;"subtitle object manipulation"

<ROUTINE ITAKE ("OPTIONAL" (VB T) "AUX" ;CNT OBJ)
	 <COND (<NOT <FSET? ,PRSO ,TAKEBIT>>
		<COND (.VB
		       <V-INHALE>)>
		<RFATAL>)	       
	       (<NOT <IN? <LOC ,PRSO> ,WINNER>>
		<COND (<G? <+ <WEIGHT ,PRSO> <WEIGHT ,WINNER>> 100>
		       <COND (.VB
			      <TELL "Your load would be too heavy." CR>)>
		       <RFATAL>)
		      (<G? <CCOUNT ,WINNER> 9>
		       <COND (.VB
			      <TELL "You're holding too much already." CR>)>
		       <RFATAL>)>)>
	 <MOVE ,PRSO ,PROTAGONIST>
	 <FSET ,PRSO ,TOUCHBIT>
	 <FCLEAR ,PRSO ,NDESCBIT>
	 <RTRUE>>

;"IDROP is called by these routines: PRE-DROP, PRE-GIVE, PRE-PUT, PRE-THROW"

<ROUTINE IDROP ()                     ;"revised 7/19/84 by SEM"
	 <COND (<PRSO? ,HANDS ,HELIUM ,HEAD>
		<COND (<OR <VERB? DROP THROW GIVE>
			   <AND <PRSO? ,HELIUM ,HEAD>
			        <VERB? PUT PUT-ON>>>
		       <V-COUNT>)		      
		      (T
		       <RFALSE>)>)
	       ;(<OR <PRSO? ,GLOBAL-MONEY>
		    <AND <PRSO? ,INTNUM>
			 ,P-DOLLAR-FLAG>>
		    <COND (<AND <VERB? GIVE>
			        <PRSI? ,GUARD>>
			   <TELL
"\"Hey, you'd better take better care of your money, especially around
here.\"" CR>)
			  (<AND <VERB? GIVE>
			        <FSET? ,PRSI ,PERSON>
				<NOT <EQUAL? ,PRSI ,TAFT>>>
			   <TELL "Disdainfully,">
			   <ARTICLE ,PRSI T>
			   <TELL " rejects your cash payment." CR>)
			  (<AND <EQUAL? ,PRSI ,SLOT>
				<VERB? PUT>>			      
			   <RFALSE>)
			  (T
			   <TELL "You can't afford to." CR>)>)
	       ;(<PRSO? ,INTNUM>
		<COND (,PRSI
		       <PERFORM ,PRSA ,PRSO ,GLOBAL-MONEY>)
		      (T
		       <PERFORM ,PRSA ,GLOBAL-MONEY>)>
		<RTRUE>)
	       (<NOT <HELD? ,PRSO>>
		<TELL "That's easy for you to say since you don't even have">
		<ARTICLE ,PRSO T>
		<TELL ,PERIOD>)
      	       (<AND <EQUAL? ,HERE ,TIGHTROPE-ROOM>
	             <NOT <PRSO? ,BALLOON>>
		     <NOT <EQUAL? ,PRSI ,PLATFORM>>
		     <NOT <VERB? GIVE>>
		     <NOT <FSET? ,PRSO ,WORNBIT>>>
		<MOVE ,PRSO ,RING>
		<TELL "It falls">
		<COND (<IN? ,NET ,RING>
		       <TELL 
", luckily for the sake of whoever may later dive into the net,">)>
	        <TELL " to the " D ,GROUND " below." CR>)
	       (<AND <NOT <IN? ,PRSO ,WINNER>>
		     <FSET? <LOC ,PRSO> ,CONTBIT>
		     <NOT <FSET? <LOC ,PRSO> ,OPENBIT>>>
		<TELL "Impossible because">
		<ARTICLE <LOC ,PRSO> T>
		<TELL " is closed." CR>)
	       (<AND <VERB? PUT-ON>
		     <PRSI? ,ME>>
		<PERFORM ,V?WEAR ,PRSO>
		<RTRUE>)
	       (<FSET? ,PRSO ,WORNBIT>
		<REMOVE-FIRST>)
	       (T
		<RFALSE>)>>

<ROUTINE REMOVE-FIRST ("OPTIONAL" (OBJ <>))
	 <TELL "You'll have to remove ">
	 <COND (.OBJ
		<TELL "the " D .OBJ>)
	       (T
		<TELL "it">)>
	 <TELL " first." CR>>

<ROUTINE CCOUNT	(OBJ "AUX" (CNT 0) X)
	 <COND (<SET X <FIRST? .OBJ>>
		<REPEAT ()
			<COND (<NOT <FSET? .X ,WORNBIT>>
				  ;<NOT <EQUAL? .X ,BABEL-FISH>>
			       <SET CNT <+ .CNT 1>>)>
			<COND (<NOT <SET X <NEXT? .X>>>
			       <RETURN>)>>)>
	 .CNT>

;"Gets SIZE of supplied object, recursing to nth level."

<ROUTINE WEIGHT (OBJ "AUX" CONT (WT 0))
	 <COND (<SET CONT <FIRST? .OBJ>>
		<REPEAT ()
			<COND (<AND <EQUAL? .OBJ ,PLAYER>
				    <FSET? .CONT ,WORNBIT>>
			       <SET WT <+ .WT 1>>)
			              ;"worn things shouldn't count"
			      (<AND <EQUAL? .OBJ ,PLAYER>
				    <FSET? <LOC .CONT> ,WORNBIT>>
			       <SET WT <+ .WT 1>>)
			              ;"things in worn things shouldn't count"
			      (<EQUAL? .OBJ ,PLAYER>
				  ;<EQUAL? .CONT ,BABEL-FISH>
			       <SET WT <+ .WT 1>>)
			              ;"the babel fish shouldn't count"
			      (T
			       <SET WT <+ .WT <WEIGHT .CONT>>>)>
			<COND (<NOT <SET CONT <NEXT? .CONT>>> <RETURN>)>>)>
	 <+ .WT <GETP .OBJ ,P?SIZE>>>

;"subtitle describers"

<ROUTINE DESCRIBE-ROOM ("OPTIONAL" (LOOK? <>) "AUX" V? STR AV)
	 <SET V? <OR .LOOK? <EQUAL? ,VERBOSITY 2>>>
	 <COND (<NOT ,LIT>
		<TELL "It is pitch black.">
		<CRLF>
		<RETURN <>>)>
	 <COND (<NOT <FSET? ,HERE ,TOUCHBIT>>
		<FSET ,HERE ,TOUCHBIT>
		<SET V? T>)>
	 <COND (<IN? ,HERE ,ROOMS>
		<COND (<AND <NOT <EQUAL? ,HERE ,TIGHTROPE-ROOM>>
			    <NOT <ZERO? ,VERBOSITY>>>
		       <TELL D ,HERE>)>
	        <SET AV <LOC ,WINNER>>
		<COND (<AND <NOT <FSET? .AV ,VEHBIT>>
		            <NOT ,HIDING>
			    <NOT <EQUAL? ,HERE ,TIGHTROPE-ROOM>>>
		       <CRLF>)>)>
	 <COND (<OR .LOOK?
		    <EQUAL? ,VERBOSITY 1 2>>
		<COND (,HIDING
		       <TELL ", hiding behind the " D ,TAFT CR>)
		      (<FSET? .AV ,VEHBIT>
		       <COND (<EQUAL? .AV ,NET>
			      <TELL ", in the ">)
			     (T
			      <TELL ", on the ">)>
		       <TELL D .AV>
		       <CRLF>)>
		<COND (<AND .V? <APPLY <GETP ,HERE ,P?ACTION> ,M-LOOK>>
		       <RTRUE>)
		      (<AND .V? <SET STR <GETP ,HERE ,P?LDESC>>>
		       <TELL .STR CR>)
		      (T
		       <APPLY <GETP ,HERE ,P?ACTION> ,M-FLASH>)>
		<COND (<AND <NOT <EQUAL? ,HERE .AV>>
			    <FSET? .AV ,VEHBIT>>
		       <APPLY <GETP .AV ,P?ACTION> ,M-LOOK>)>)>
	 T>

<OBJECT C-OBJECT>

<ROUTINE PRINT-CONTENTS (THING "OPTIONAL" (ARTICLE-T? <>) 
			       "AUX" OBJ NXT (1ST? T) (IT? <>) (TWO? <>))
	 <SET OBJ <FIRST? .THING>>
	 <REPEAT ()
		<COND (.OBJ
		       <SET NXT <NEXT? .OBJ>>
		       <COND (<OR <FSET? .OBJ ,INVISIBLE>
				  <FSET? .OBJ ,NDESCBIT> ;"was semied"
				  <EQUAL? .OBJ ,WINNER>>
			      <MOVE .OBJ ,C-OBJECT>)>
		       <SET OBJ .NXT>)
		      (T
		       <RETURN>)>>
	 <SET OBJ <FIRST? .THING>>
	 <COND (<NOT .OBJ>
		<TELL " nothing " <PICK-ONE ,YAWNS>>)
	       (T
		<REPEAT ()
		        <COND (.OBJ
		               <SET NXT <NEXT? .OBJ>>
		               <COND (.1ST?
			              <SET 1ST? <>>)
			             (T
			              <COND (.NXT
				             <TELL ",">)
				            (T
				             <TELL " and">)>)>
		               <ARTICLE .OBJ .ARTICLE-T?>
			       <COND (<AND <NOT .IT?>
				           <NOT .TWO?>>
			              <SET IT? .OBJ>)
			             (T
			              <SET TWO? T>
			              <SET IT? <>>)>
		               <SET OBJ .NXT>)
			      (T
		               <COND (<AND .IT?
				           <NOT .TWO?>>
			              <SETG P-IT-OBJECT .IT?>)>
		               <RETURN>)>>)>
	 <ROB ,C-OBJECT .THING>>

<OBJECT X-OBJECT>

<ROUTINE DESCRIBE-OBJECTS ("OPTIONAL" (THING <>)
			   "AUX" OBJ NXT STR (1ST? T) (TWO? <>) (IT? <>)
			         (ANY? <>))
	 <COND (<ZERO? .THING>
		<SET THING ,HERE>)>
	 <COND (<NOT ,LIT>
	        <TELL ,TOO-DARK CR>
	        <RTRUE>)>
       
      ; "Hide invisible objects"

	<SET OBJ <FIRST? .THING>>
	<COND (<ZERO? .OBJ>
	       <RTRUE>)>
	
	<REPEAT ()
		<COND (.OBJ
		       <SET NXT <NEXT? .OBJ>>
		       <COND (<OR <FSET? .OBJ ,INVISIBLE>
				  <FSET? .OBJ ,NDESCBIT>
				  <EQUAL? .OBJ ,WINNER>
				  <EQUAL? .OBJ <LOC ,PROTAGONIST>>> ;"added JO"
			      <MOVE .OBJ ,DUMMY-OBJECT>)>
		       <SET OBJ .NXT>)
		      (T
		       <RETURN>)>>
	
      ; "Apply all FDESCs and eliminate those objects"
	
	<SET OBJ <FIRST? .THING>>
	<REPEAT ()
		<COND (<AND .OBJ
			    <EQUAL? .THING ,HERE>>
		       <SET NXT <NEXT? .OBJ>>
		       <SET STR <GETP .OBJ ,P?FDESC>>
		       <COND (<AND .STR
				   <NOT <FSET? .OBJ ,TOUCHBIT>>>
			      <TELL CR .STR CR>
			      <MOVE .OBJ ,DUMMY-OBJECT>)>
		       <SET OBJ .NXT>)
		      (T
		       <RETURN>)>>

       ;"Apply all LDESC's and eliminate those objects"

       <SET OBJ <FIRST? .THING>>
       <REPEAT ()
		<COND (<AND .OBJ
			    <EQUAL? .THING ,HERE>>
		       <SET NXT <NEXT? .OBJ>>
		       <SET STR <GETP .OBJ ,P?LDESC>>
		       <COND (.STR
		              <TELL CR .STR CR>
			      <MOVE .OBJ ,DUMMY-OBJECT>)>
		       <SET OBJ .NXT>)
		      (T
		       <RETURN>)>>

	; "Apply all DESCFCNs and hide those objects"
	
       <SET OBJ <FIRST? .THING>>
       <REPEAT ()
		<COND (<AND .OBJ
			    <EQUAL? .THING ,HERE>>
		       <SET NXT <NEXT? .OBJ>>
		       ;<SET STR <GETP .OBJ ,P?DESCFCN>>
		       <COND (<GETP .OBJ ,P?DESCFCN>
		              <CRLF>
			      <APPLY <GETP .OBJ ,P?DESCFCN> ,M-OBJDESC>
			      <CRLF>
			      <MOVE .OBJ ,DUMMY-OBJECT>)>
		       <SET OBJ .NXT>)
		      (T
		       <RETURN>)>>
     
       ; "Print whatever's left in a nice sentence"
	
	<SET OBJ <FIRST? .THING>>
	<COND (.OBJ
	       <REPEAT ()
		       <COND (.OBJ
		              <SET NXT <NEXT? .OBJ>>
		              <COND (.1ST?
			             <SET 1ST? <>>
			           ; <CRLF>
			             <COND (<EQUAL? .THING ,HERE>
					    <CRLF>
					    <COND (.NXT
				                   <TELL ,YOU-SEE>)
				                   (T
				                    <TELL "There's">)>)>)
			            (T
			             <COND (.NXT
					    <TELL ",">)
				           (T
				            <TELL " and">)>)>
			      <ARTICLE .OBJ>
			      <COND (<FSET? .OBJ ,WORNBIT>
			             <TELL " (being worn)">)>	
			      <COND (<AND <SEE-INSIDE? .OBJ>
				          <SEE-ANYTHING-IN? .OBJ>>
			             <MOVE .OBJ ,X-OBJECT>)>
		              <COND (<AND <NOT .IT?>
				          <NOT .TWO?>>
			             <SET IT? .OBJ>)
			            (T
			             <SET TWO? T>
			             <SET IT? <>>)>
		              <SET OBJ .NXT>)
		             (T
		              <COND (<AND .IT?
				          <NOT .TWO?>>
			             <SETG P-IT-OBJECT .IT?>)>
			      <COND (<EQUAL? .THING ,HERE>
				     <TELL " here">)>
			      <TELL ".">
			      <SET ANY? T>
		              <RETURN>)>>)>
	<SET OBJ <FIRST? ,X-OBJECT>>
	<REPEAT ()
		<COND (<ZERO? .OBJ>
		       <RETURN>)>
		<COND (<FSET? .OBJ ,SURFACEBIT>
		       <TELL CR CR "On">)
		      (T
		       <TELL CR CR "Inside">)>
		<ARTICLE .OBJ T>
		<TELL " you see">
		<PRINT-CONTENTS .OBJ>
		<TELL ".">
		<SET OBJ <NEXT? .OBJ>>>
	<COND (.ANY?
	       <CRLF>)>
	<ROB ,X-OBJECT .THING>
	<ROB ,DUMMY-OBJECT .THING>>

<ROUTINE SEE-ANYTHING-IN? (THING "AUX" OBJ NXT (ANY? <>))
	 <SET OBJ <FIRST? .THING>>
	 <REPEAT ()
		 <COND (.OBJ
			<COND (<AND <NOT <FSET? .OBJ ,INVISIBLE>>
				    <NOT <FSET? .OBJ ,NDESCBIT>>
				    <NOT <EQUAL? .OBJ ,WINNER>>>
			       <SET ANY? T>
			       <RETURN>)>
			<SET OBJ <NEXT? .OBJ>>)
		       (T
			<RETURN>)>>
	 <RETURN .ANY?>>

<ROUTINE DESCRIBE-VEHICLE () ;"for LOOK AT vehicle when you're in it"
	 <MOVE ,PROTAGONIST ,ROOMS>
	 <COND (<FIRST? ,PRSO>
		<PRINT-CONTENTS ,PRSO>
		<TELL ,PERIOD>)
	       (T
		<TELL ,EMPTY " (not counting you)." CR>)>
	 <MOVE ,PROTAGONIST ,PRSO>>


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

<ROUTINE GOTO (RM "OPTIONAL" (V? T))
	 <MOVE ,PROTAGONIST .RM>
	 <SETG HERE .RM>
	 <SETG LIT <LIT? ,HERE>>
	 <APPLY <GETP ,HERE ,P?ACTION> ,M-ENTER>
	 <COND (<AND .V?
		     <EQUAL? ,HERE .RM>>
		<V-FIRST-LOOK>)>
	 <RTRUE>>

<ROUTINE JIGS-UP (NUM DESC)
	 <TELL .DESC>	       
	 <TELL-DIED>
	 <TELL 
"Well not quite died. The doctors do what they can, but as the debts rise
and the prognosis dips you take the only avenue left -- and sell " D ,ME 
" to the circus.|
|
As \"The Human " <GET ,FREAKS .NUM> ",\" you enjoy top billing as a popular
midway attraction, garnering fame to rival that of nineteenth century oddity
John Merrick.|
|
Still, as the fingers of the Great Unwashed poke at your benumbed hide,
you contemplate how this fate might have been thwarted.">
	 <CRLF>
	 <FINISH>>
	
<GLOBAL FREAKS
     	<PLTABLE
	"Platypus"
	"Eelworm"
	"Croissant"
	"Corkscrew"
	"Armadillo">>
	
<ROUTINE TELL-DIED ()
	 <TELL CR CR
"    ****  You have died  ****" CR CR>>

;"subtitle useful utility routines"

<ROUTINE ACCESSIBLE? (OBJ "AUX" (L <LOC .OBJ>)) ;"can player TOUCH object?"
	 ;"revised 5/2/84 by SEM and SWG"
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

<ROUTINE VISIBLE? (OBJ "AUX" (L <LOC .OBJ>)) ;"can player SEE object"
	 ;"revised 5/2/84 by SEM and SWG"
	 <COND (<ACCESSIBLE? .OBJ>
		<RTRUE>)
	       (<AND <SEE-INSIDE? .L>
		     <VISIBLE? .L>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

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

<ROUTINE HELD? (OBJ "OPTIONAL" (CONT <>))
	 <COND (<NOT .CONT>
		<SET CONT ,WINNER>)>
	 <COND (<NOT .OBJ>
		<RFALSE>)
	       (<IN? .OBJ .CONT>
		<RTRUE>)
	       (<IN? .OBJ ,ROOMS>
		<RFALSE>)
	       (<IN? .OBJ ,GLOBAL-OBJECTS>
		<RFALSE>)
	       (T
		<HELD? <LOC .OBJ> .CONT>)>>

<ROUTINE SEE-INSIDE? (OBJ)
	 <AND .OBJ
	      <NOT <FSET? .OBJ ,INVISIBLE>>
	      <OR <FSET? .OBJ ,TRANSBIT>
	          <FSET? .OBJ ,OPENBIT>>>>

<ROUTINE GLOBAL-IN? (OBJ1 OBJ2 "AUX" TEE)
	 <COND (<SET TEE <GETPT .OBJ2 ,P?GLOBAL>>
		<ZMEMQB .OBJ1 .TEE <- <PTSIZE .TEE> 1>>)>>

<ROUTINE FIND-IN (WHERE WHAT "AUX" W)
	 <SET W <FIRST? .WHERE>>
	 <COND (<NOT .W>
		<RFALSE>)>
	 <REPEAT ()
		 <COND (<FSET? .W .WHAT>
			<RETURN .W>)
		       (<NOT <SET W <NEXT? .W>>>
			<RETURN <>>)>>>

<ROUTINE LOC-CLOSED ()
	 <COND (<AND <FSET? <LOC ,PRSO> ,CONTBIT>
		     <NOT <FSET? <LOC ,PRSO> ,OPENBIT>>
		     <FSET? ,PRSO ,TAKEBIT>>
		<TELL "But">
		<ARTICLE <LOC ,PRSO> T>
		<TELL " is closed!" CR>
		<RTRUE>)
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
		 <COND (<AND <EQUAL? .WHERE ,BIGTOP>
			     <FSET? .X ,WORNBIT>>
			<FSET .X ,REWEARBIT>)>
		 <COND (<AND <EQUAL? .WHERE ,PROTAGONIST>
			     <FSET? .X ,REWEARBIT>>
			<FSET .X ,WORNBIT>)
		       (T
		        <FCLEAR .X ,WORNBIT>)>
		 <MOVE .X .WHERE>
		 <SET X .N>>>

<ROUTINE HACK-HACK (STR)
	 <TELL .STR>
	 <ARTICLE ,PRSO T>
	 <TELL <PICK-ONE ,HO-HUM> CR>>

<ROUTINE ARTICLE (OBJ "OPTIONAL" (THE <>))
	 <COND (<NOT .OBJ>
		<SET OBJ ,NOT-HERE-OBJECT>)>
	 <COND (<NOT <FSET? .OBJ ,NARTICLEBIT>>
		<COND (.THE
		       <TELL " the">)
		      (<FSET? .OBJ ,NOA>
		       <TELL " " D .OBJ>
		       <RTRUE>)
		      (<FSET? .OBJ ,VOWELBIT>
		       <TELL " an">)
		      (T
		       <TELL " a">)>)>
	 <TELL " " D .OBJ>>

<GLOBAL HO-HUM
	<LTABLE 0 
	 " doesn't do anything."
	 " accomplishes nothing."
	 " has no desirable effect.">>		 

<GLOBAL YUKS
	<LTABLE 0 
	 "What a concept."
         "Nice try."
	 "You can't be serious."
	 "Not bloody likely.">>

<GLOBAL IMPOSSIBLES
	<LTABLE 0 
	 "Fiddle-de-dee! Rot! Rubbish! Figs!"
	 "Absolutely insane."
	 "There you go again ..."
	 "Humbug.">>

<GLOBAL WASTES
	<LTABLE 0 
	  "Complete waste of time."
	  "Useless. Utterly useless."
	  "Not in the least bit helpful.">>