"BALLYHOO for NSAMPLER Copyright (C)1984 Infocom, Inc."

<OBJECT CIRCUS
	(IN GLOBAL-OBJECTS)
	(DESC "circus")
	(SYNONYM CIRCUS)
       	(FLAGS NDESCBIT)>

;"RMUNGBIT = guard told your about circus/munrab"

<ROOM UNDER-STANDS
      (IN ROOMS)
      (DESC "Under the Bleachers")
      (SW TO WINGS)
      (UP PER NOT-UNDER-STANDS)
      (SOUTH "You bump into the side wall of the big top." CR)
      (FLAGS ONBIT RLANDBIT INDOORSBIT)
      (GLOBAL GRANDSTAND BIGTOP)
      (ACTION UNDER-STANDS-F)>

<ROUTINE UNDER-STANDS-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL 
"You're standing between the underside of the " D ,GRANDSTAND " and the
side wall of the " D ,BIGTOP ". Not unexpectedly, the " D ,GROUND " here
is strewn with garbage. The only exit is southwest">
		<TELL ,PERIOD>)>>

<ROUTINE NOT-UNDER-STANDS ()
	 <TELL "You're UNDER the stands, understand?" CR>
	 <SETG AWAITING-REPLY 7>
	 <ENABLE <QUEUE I-REPLY 2>>
	 <RFALSE>>

<OBJECT GARBAGE
	(IN UNDER-STANDS)
	(DESC "garbage")
	(SYNONYM GARBAGE TRASH)
	(FLAGS NDESCBIT NOA)
	(ACTION GARBAGE-F)>

<ROUTINE GARBAGE-F ()
	 <COND (<VERB? SEARCH SEARCH-OBJECT-FOR EXAMINE DIG MOVE LOOK-UNDER
		       LOOK-INSIDE>
		<COND (<IN? ,TICKET ,LOCAL-GLOBALS>
	               <MOVE ,TICKET ,HERE>
	               <SETG P-IT-OBJECT ,TICKET>
		       <SETG SCORE <+ ,SCORE 10>>
		       <TELL 
"Your foray into " D ,GARBAGE " reclamation pays off, as you turn up
the unmarked ticket of some luckless circus-goer." CR>)
	       	      (<VERB? EXAMINE>
		       <RFALSE>)
		      (T
		       <TELL "You merely raise a stench." CR>)>)
	       (<VERB? CLEAN>
	        <V-DIG>)
	       (<VERB? SMELL>
		<TELL 
"It smells vaguely of " <PICK-ONE ,FOODS> " and " <PICK-ONE ,FOODS> "." CR>)>>

<OBJECT GRANDSTAND
	(IN LOCAL-GLOBALS)
	(DESC "grandstand")
	(SYNONYM SEATS SEAT STAND STANDS)
	(ADJECTIVE GRANDSTAND BLEACHER)
	(FLAGS NDESCBIT)
	(ACTION GRANDSTAND-F)>
	
<ROUTINE GRANDSTAND-F ()
	 <COND (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,UNDER-STANDS>>
		<SETG PRSO ,ROOMS>
		<PERFORM ,V?LOOK-UP ,PRSO>
		<RTRUE>)	       
	       (<VERB? CLIMB-UP CLIMB-FOO THROUGH BOARD>
		<COND (<EQUAL? ,HERE ,RING>
		       <DO-WALK ,P?NORTH>)
		      (T
		       <DO-WALK ,P?UP>)>)
	       (<VERB? CLIMB-DOWN>
		<COND (<EQUAL? ,HERE ,UNDER-STANDS>
		       <DO-WALK ,P?UP>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? BOARD>
		<COND (<EQUAL? ,HERE ,UNDER-STANDS ,WINGS>
		       <DO-WALK ,P?UP>)
		      (<EQUAL? ,HERE ,RING>
		       <DO-WALK ,P?NORTH>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)>>		      

<GLOBAL FOODS
	<LTABLE 0  
	 "tofu"
	 "popcorn"
	 "peanuts"
	 "cotton candy"
	 "granola bars"
	 "yogurt"
	 "New Coke"	
	 "Old Coke">>

<OBJECT CROWD 
	(IN WINGS)
	(DESC "crowd")
	(SYNONYM CROWD PEOPLE)
	(FLAGS ACTORBIT PERSON NDESCBIT)
	(ACTION CROWD-F)>

<ROUTINE CROWD-F ()
	 <COND (<VERB? FOLLOW>
		<COND (<AND <EQUAL? ,HERE ,CON-AREA>
			    <NOT <FSET? ,BESIDE-BIGTOP ,TOUCHBIT>>>
		       <DO-WALK ,P?EAST>)
		      (<AND <EQUAL? ,HERE ,WINGS>
			    <NOT <FSET? ,CON-AREA ,TOUCHBIT>>>
	               <DO-WALK ,P?SOUTH>)>)
	       (<OR <AND <EQUAL? ,HERE ,WINGS>
		         <NOT <FSET? ,CON-AREA ,TOUCHBIT>>>
		    <AND <EQUAL? ,HERE ,CON-AREA>
			 <RUNNING? I-BOOST>>>
		<TELL "The " D ,CROWD "'s gone ">
	 		 <COND (<EQUAL? ,HERE ,CON-AREA>
			        <TELL "east">)
	       		       (T      
			        <TELL "south">)>)>>

<OBJECT BIGTOP 
	(IN LOCAL-GLOBALS)
	(DESC "big top")
	(SYNONYM TOP TENT WALL BIGTOP)
	(ADJECTIVE BIG SIDE CANVAS)
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION BIGTOP-F)>

<ROUTINE BIGTOP-F ()
	 <COND (<VERB? CRAWL-UNDER BOARD>
       	        <TENT-BOUND>)
	       (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,CON-AREA ,WINGS ,BESIDE-BIGTOP>
		       <DO-WALK ,P?NORTH>)
		      (<OR <EQUAL? ,HERE ,WINGS ,RING>
			   <EQUAL? ,HERE ,UNDER-STANDS>>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? LEAVE EXIT DISEMBARK>
		<COND (<EQUAL? ,HERE ,WINGS ,RING>
		       <DO-WALK ,P?SOUTH>)
		      (<EQUAL? ,HERE ,UNDER-STANDS>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)		      
	       (<VERB? EXAMINE>
      		<TELL
"Soiled by endless miles of travel and heavily patched in places, the
wide blue-and-white stripes nevertheless rise up to ">
		<COND (<FSET? ,HERE ,INDOORSBIT>
		       <TELL 
"meet at the top of the towering center pole." CR>)
		      (T
		       <TELL "the black sky above." CR>)>)>>

<OBJECT CENTER-POLE 
	(IN LOCAL-GLOBALS)
	(DESC "center pole")
	(SYNONYM POLE)
	(ADJECTIVE CENTER)
	(FLAGS NDESCBIT)
	(ACTION CENTER-POLE-F)>

<ROUTINE CENTER-POLE-F ()
	 <COND (<AND <TOUCHING? ,CENTER-POLE>
		     <NOT <EQUAL? ,HERE ,RING>>>
		<CANT-REACH ,CENTER-POLE>)
	       (<VERB? CLIMB-FOO CLIMB-UP CLIMB-ON>
		<TELL 
"You barely get off the " D ,GROUND " before you slide back down." CR>)>>

<OBJECT RING-OBJECT 
	(IN LOCAL-GLOBALS)
	(DESC "ring")
	(ADJECTIVE SECOND PERFOR)
	(SYNONYM RING)
	(FLAGS NDESCBIT)
	(ACTION RING-OBJECT-F)>

<ROUTINE RING-OBJECT-F ()
	 <COND (<IS-NOUN? ,W?SECOND>
		<PERFORM ,PRSA ,LION-CAGE ,PRSI>
		<RTRUE>)
	       (T
		<GLOBAL-ROOM-F>)>>

<OBJECT POLE
	(IN NEAR-WAGON)
	(DESC "fiberglass pole")
	(FDESC 
"Part of a narrow pole is sticking out from under the wagon.")
	(SYNONYM POLE)
	(ADJECTIVE FIBERGLASS NARROW)
	(FLAGS TAKEBIT)	
	(SIZE 80)>

<OBJECT BALLOON
	(IN PLATFORM-2)
	(DESC "balloon")
	(FDESC 
"Floating against the ceiling of the big top is a helium balloon.")	
	(SYNONYM BALLOON)
	(ADJECTIVE RED HELIUM)
	(FLAGS TAKEBIT TRANSBIT CONTBIT)	
        (SIZE 4)
	(ACTION BALLOON-F)>

<ROUTINE BALLOON-F ()
	<COND (<VERB? TAKE>
	       <FSET ,BALLOON ,TOUCHBIT>
	       <MOVE ,BALLOON ,PROTAGONIST>
	       <TELL
"You grab the helium-filled balloon at the frill where it is tied. The
balloon gives a constant upward tug at your fingertips." CR>)
	      (<VERB? EXAMINE>
	       <TELL "It's a bright red balloon which is ">
	       <COND (<FSET? ,BALLOON ,OPENBIT>
		      <TELL "untied">)
		     (T
		      <TELL "tied closed">)>
	       <TELL " and filled with helium." CR>)
	      (<OR <VERB? DROP THROW PUT>
		   <EQUAL? ,P-PRSA-WORD ,W?FREE>>	        
	       <BALLOON-FLIGHT>
	       <CRLF>)
	      (<VERB? UNTIE OPEN>
	       <COND (<NOT <HELD? ,BALLOON>>
		      <TELL ,NOT-HOLDING " the " D ,BALLOON "." CR>)
		     (<NOT <FSET? ,BALLOON ,OPENBIT>>
		      <FSET ,BALLOON ,OPENBIT>
		      <TELL 
"You untie the end of the " D ,BALLOON ", holding it closed." CR>)
		     (<AND <VERB? OPEN>
			   <FSET? ,BALLOON ,OPENBIT>>
		      <FSET ,BALLOON ,OPENBIT>
		      <BALLOON-FLIGHT>
		      <CRLF>)
		     (T
		      <TELL "It isn't tied." CR>)>)
	       (<AND <VERB? TIE CLOSE>
		     <NOT ,PRSI>>
		<COND (<FSET? ,BALLOON ,OPENBIT>
		       <FCLEAR ,BALLOON ,OPENBIT>
		       <TELL 
"Okay, the " D ,BALLOON " is once again tied closed." CR>)
		      (T
		       <TELL "It is." CR>)>)
	       (<VERB? INHALE>
		<TELL 
"It would be safer to inhale what's IN the balloon." CR>)
		(<HURT? ,BALLOON>
		 <TELL "You manage to puncture it. ">
		 <MOVE ,BALLOON ,LOCAL-GLOBALS>
		 <BALLOON-FLIGHT>
		 <CRLF>)>>

<ROUTINE BALLOON-FLIGHT ()
	 <FSET ,BALLOON ,TOUCHBIT>
	 <MOVE ,BALLOON ,LOCAL-GLOBALS>
	 <COND (<AND <NOT <FSET? ,BALLOON ,OPENBIT>>
		     <NOT <HURT? ,BALLOON>>>
		<TELL 
"The " D ,BALLOON " flies up and ">
                     <COND (<NOT <FSET? ,HERE ,INDOORSBIT>> 
	                    <TELL
"disappears into the night sky.">
			    <RTRUE>)
       		           (T
			    <TELL 
"gets punctured on the " D ,CEILING ". ">)>)>
		<TELL
"With helium spitting out of it, the fink zips wildly through the air
and disappears. ">>

<OBJECT HELIUM
	(IN BALLOON)
	(DESC "helium")
	(SYNONYM HELIUM)
	(FLAGS NDESCBIT NARTICLEBIT AIRBIT CLEARBIT)
	(SIZE 2)
	(ACTION HELIUM-F)>

<ROUTINE HELIUM-F ()
	 <COND (<VERB? INHALE>
		<COND (<FSET? ,BALLOON ,OPENBIT>
		       <MOVE ,BALLOON ,LOCAL-GLOBALS>
		       <MOVE ,HELIUM ,LOCAL-GLOBALS>
		       <ENABLE <QUEUE I-HELIUM 2>>
		       <TELL
"The " D ,BALLOON " shrinks rapidly before your eyes as your chest
expands and tightens ... then it slips from your grasp! ">
		       <BALLOON-FLIGHT>
		       <TELL 
"You manage to momentarily hold the helium in your lungs." CR>
		       <PUTP ,PROTAGONIST ,P?ACTION ,PROTAGONIST-HACK-F>)
		      (T
		       <TELL "But the " D ,BALLOON " is tied closed." CR>)>)
		(<VERB? DROP>
		 <V-COUNT>)>>
 		 
<ROUTINE I-HELIUM ()
	 <DISABLE <INT I-HELIUM>>
	 <COND (<NOT ,SPEAK-HELIUM>
		<TELL CR "You exhale your lungsful of helium." CR>)>
	 <RFALSE>>

<OBJECT NET
	(IN RING)
	(DESC "safety net")
	(SYNONYM NET)
	(ADJECTIVE SAFETY)
	(FLAGS NDESCBIT CONTBIT OPENBIT SURFACEBIT SEARCHBIT VEHBIT)
	(ACTION NET-F)>

<ROUTINE NET-F ("OPTIONAL" (RARG <>))
	 <COND (<EQUAL? .RARG ,M-BEG>
		<COND (<AND <VERB? WALK>
			    <EQUAL? ,P-WALK-DIR ,P?DOWN ,P?OUT>>
		       <PERFORM ,V?DISEMBARK ,NET>
		       <RTRUE>)
		      (<VERB? WALK>		     
		       <TELL 
"You'll have to get out of the " D ,NET " first." CR>)
		      (<VERB? LEAP>
		       <TELL
"After bouncing about the net a while you appreciate that much more the
talent of the Genatossio Brothers." CR>)>)
	       (.RARG
		<RFALSE>)
	       (<VERB? OPEN CLOSE>
		<CANT-OPEN>)
	       (<AND <VERB? DISEMBARK CLIMB-DOWN>
		     <EQUAL? <LOC ,PROTAGONIST> ,NET>>
		<MOVE ,PROTAGONIST ,HERE>
		<TELL 
"You climb out of the " D ,NET " with a bounce in your step." CR>)>> 

<OBJECT GLOBAL-NET
	(IN GLOBAL-OBJECTS)
	(DESC "safety net")
	(SYNONYM NET)
	(ADJECTIVE SAFETY)
	(ACTION GLOBAL-NET-F)>

<ROUTINE GLOBAL-NET-F ()
	 <COND (<DONT-HANDLE? ,GLOBAL-NET>
		<RFALSE>)
	       (<OR <IN? ,NET ,LOCAL-GLOBALS>
		    <AND <IN? ,NET ,RING>
		         <NOT <EQUAL? ,HERE ,TIGHTROPE-ROOM ,PLATFORM-1
				      ,PLATFORM-2>>>>
		<CANT-SEE <> "the net">)
	       (<VERB? LOOK-INSIDE EXAMINE>
		<PERFORM ,V?LOOK-DOWN>
		<RTRUE>)
	       (<AND <VERB? PUT>
		     <PRSI? ,GLOBAL-NET>>
		<PERFORM ,V?DROP ,PRSO>
		<RTRUE>)
	       (<VERB? LEAP THROUGH BOARD>
		<SETG HERE ,PLATFORM-1>
		<PERFORM ,V?LEAP-OFF ,PLATFORM>
		<RTRUE>)
	       (<TOUCHING? ,GLOBAL-NET>
		<CANT-REACH ,NET>)>>

<ROOM WINGS  
      (IN ROOMS)
      (DESC "In the Wings")
      (NORTH TO RING)
      (IN TO RING)
      (SOUTH TO CON-AREA)
      (OUT TO CON-AREA)      
      (UP PER STANDS-ENTER)
      (NE PER STANDS-ENTER)
      (FLAGS ONBIT RLANDBIT INDOORSBIT)
      (GLOBAL BIGTOP GRANDSTAND RING-OBJECT CENTER-POLE)
      (ACTION WINGS-F)>

<ROUTINE WINGS-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
	        <TELL 
"The " D ,BIGTOP " can be entered to the north and exited to the south. ">
	        <COND (<EQUAL? ,MEET-COUNTER 10>
		       <CRLF> <CRLF>)>
		<TELL
"To the northeast, the grandstand">
		<COND (<EQUAL? ,MEET-COUNTER 10> ;"IE, HEARD MEETING"
		       <TELL 
" has been retracted slightly, revealing a passage">)			      
		      (T
		       <TELL " begins its precipitous rise">)>
		<TELL ,PERIOD>) 
	       (<AND <EQUAL? .RARG ,M-BEG>
		     <VERB? WAIT>>
		<TELL 
"Very theatrical of you, waiting in the wings. Expect no awards, however. ">
		<RFALSE>)
	       (<AND <EQUAL? .RARG ,M-END>
		     <OR <EQUAL? ,MEET-COUNTER 10>
			 <FSET? ,POLE ,TOUCHBIT>>
		     <IN? ,NET ,RING>>
		<ENABLE <QUEUE I-FOLLOW 2>>
		<SETG FOLLOW-FLAG 14>
		<SETG P-IT-OBJECT ,JIM>		
		<MOVE ,NET ,LOCAL-GLOBALS>
		<FCLEAR ,RING ,TOUCHBIT>
		<TELL CR 
"A roustabout who is wearing a pair of headphones and carrying a large net
over his shoulder passes you and exits the " D ,BIGTOP "." CR>)>>

<ROUTINE STANDS-ENTER ()
	 <COND (<AND <EQUAL? ,MEET-COUNTER 10>
		     <EQUAL? ,P-WALK-DIR ,P?NE>>
	        <RETURN ,UNDER-STANDS>)
	       (T
		<WALK-INTO-STANDS>
	        <RFALSE>)>> 

<ROUTINE WALK-INTO-STANDS ()
	 <TELL 
"Climbing up into the deserted and littered grandstands produces a
disorienting sense of deja vu. You make a headachy descent down the
steps." CR>
	 <RFALSE>>

<ROOM RING  
      (IN ROOMS)
      (DESC "Performance Ring")
      (UP PER UP-LADDER)
      (NORTH PER WALK-INTO-STANDS)
      (EAST PER WALK-INTO-STANDS)
      (SOUTH TO WINGS)
      (OUT TO WINGS)
      (WEST "The cage door is closed.")
      (IN "The cage door is closed.")      
      (FLAGS ONBIT RLANDBIT INDOORSBIT)
      (GLOBAL LADDER LION-DOOR BIGTOP LION-CAGE GRANDSTAND RING-OBJECT
	      TIGHTROPE-OBJECT CENTER-POLE)
      (ACTION RING-F)>

<ROUTINE RING-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL 
"This is the arena's oval-shaped performance ring which ">
		<COND (<IN? ,NET ,RING>
                       <TELL 	       
"is occupied by a sagging, rectangular ">)
		      (T
		       <TELL
"appears deathly quiet without its circus atmosphere. Also missing is
its ">)> 
                <TELL
D ,NET ". A rope ladder dangles to within a foot of the " D ,GROUND ".">
		<CRLF> <CRLF>
		<TELL 
"Just west lies the entrance to a large, round cage that completely
encircles the second of the two rings. To the south the " D ,BIGTOP "'s
vaulted wing leads out into the open air. The arena's rickety grandstands
rise steeply north and east.">
		<CRLF>)>>
		
<ROOM PLATFORM-1 
	(IN ROOMS)
	(DESC "Platform")
	(FLAGS ONBIT RLANDBIT INDOORSBIT)
     	(EAST PER PLATFORM-EXIT-F)
	(DOWN PER DOWN-LADDER)
	(UP PER CLIMB-GUY)
        (GLOBAL TIGHTROPE-OBJECT LADDER PLATFORM CENTER-POLE BIGTOP) 
	(GROUND-LOC RING)
	(ACTION PLATFORM-1-F)>

<ROUTINE PLATFORM-1-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<PLATFORM-ROOM-DESC>
		<CRLF>)>>

<ROUTINE CLIMB-GUY ()	
	<TELL ,NO-TALENT CR>
	<RTRUE>>

<ROOM PLATFORM-2  
	(IN ROOMS)
	(DESC "Platform")
	(FLAGS ONBIT RLANDBIT INDOORSBIT)
     	(WEST PER PLATFORM-EXIT-F)
	(GLOBAL PLATFORM TIGHTROPE-OBJECT BIGTOP CENTER-POLE)
	(GROUND-LOC RING)
	(ACTION PLATFORM-2-F)>

<ROUTINE PLATFORM-2-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<PLATFORM-ROOM-DESC>
		<CRLF>)>>

<ROUTINE PLATFORM-ROOM-DESC ()
	 <TELL 
"You're standing on a small, unstable platform which is suspended"
,HIGH-ABOVE " by guy wires converging on it from all directions. ">
	 <COND (<EQUAL? ,HERE ,PLATFORM-1>
		<TELL "A rope ladder dangles from the platform and t">)
	       (T
		<TELL "T">)>
	<TELL "he tightrope stretches ">
         <COND (<EQUAL? ,HERE ,PLATFORM-1>
		<TELL "east">)
	       (T
	        <TELL "west">)>
	 <TELL " to the opposite platform.">>

<GLOBAL HEADING-EAST? <>>

<GLOBAL ON-ROPE 0>

<ROOM TIGHTROPE-ROOM
	(IN ROOMS)
	(DESC "Walking a Tightrope")
	(FLAGS ONBIT RLANDBIT INDOORSBIT)
	(EAST PER ACROSS-ROPE)
	(WEST PER ACROSS-ROPE)
      	(GLOBAL PLATFORM TIGHTROPE-OBJECT BIGTOP CENTER-POLE)
	(GROUND-LOC RING)
	(ACTION TIGHTROPE-ROOM-F)>

<ROUTINE TIGHTROPE-ROOM-F (RARG)
	  <COND (<EQUAL? .RARG ,M-LOOK>
		 <TELL "You are standing, ">
		 <COND (<HELD? ,POLE>			    
			<TELL "poised">)
		       (T
		        <TELL "perched " <PICK-ONE ,DANGERS>>)>
		 <TELL 
,HIGH-ABOVE ", " <GET ,ROPES ,ON-ROPE> " across the " D ,TIGHTROPE-OBJECT ".">
		 <CRLF>)
		(<EQUAL? .RARG ,M-BEG>
		 <COND (<OR <VERB? LEAP LEAP-OFF WEAR>
		            <AND <VERB? WALK>
			         <EQUAL? ,P-WALK-DIR ,P?DOWN>>
			    <AND <VERB? DROP THROW>
			         <PRSO? ,POLE>>>
                      	<TELL ,UNBALANCED>
		      	<FLYING>		      
		      	<TELL "And you fall ...">
		      	<FALL-DOWN>)>)>>

<GLOBAL DANGERS 
	<LTABLE 0 
	"perilously"
	"nakedly"
	"precariously"
	"dubiously">>

<GLOBAL ROPES
	<PLTABLE  
	 "a couple of baby steps"
	 "just part of the way"
	 "about midway"
	 "most of the way"
	 "nearly all the way">>

<OBJECT TIGHTROPE-OBJECT
	(IN LOCAL-GLOBALS)
	(DESC "tightrope")
	(SYNONYM ROPE WIRE TIGHTR HIGH-)
	(ADJECTIVE TIGHT HIGH)
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION TIGHTROPE-OBJECT-F)>
	
<ROUTINE TIGHTROPE-OBJECT-F ()
	 <COND (<AND <EQUAL? ,HERE ,RING>
		     <TOUCHING? ,TIGHTROPE-OBJECT>>
		<CANT-REACH ,TIGHTROPE-OBJECT>)
	       (<VERB? CLIMB-ON TAKE>
		<TELL ,NO-TALENT CR>)
	       (<AND <VERB? THROUGH BOARD WALK-TO CLIMB-ON>
		     <EQUAL? ,HERE ,PLATFORM-1 ,PLATFORM-2 ,TIGHTROPE-ROOM>>
		<COND (<OR <EQUAL? ,HERE ,PLATFORM-1>
		            ,HEADING-EAST?>
		       <DO-WALK ,P?EAST>)
		      (<OR <EQUAL? ,HERE ,PLATFORM-2>
		           <AND <EQUAL? ,HERE ,TIGHTROPE-ROOM>
				<NOT ,HEADING-EAST?>>>
		       <DO-WALK ,P?WEST>)>)>>		      

<OBJECT GUY-WIRES
	(IN GLOBAL-OBJECTS)
	(DESC "apparatus")
	(SYNONYM WIRES WIRE APPARATUS)
	(ADJECTIVE GUY)
	(FLAGS NDESCBIT VOWELBIT)
	(ACTION GUY-WIRES-F)>

<ROUTINE GUY-WIRES-F ()
         <COND (<NOT <SEE-WIRES?>>
		<CANT-SEE <> "the guy wires">
		<STOP>)
	       (<AND <NOT <EQUAL? ,HERE ,PLATFORM-1 ,PLATFORM-2>>
		     <TOUCHING? ,GUY-WIRES>>
		<CANT-REACH ,GUY-WIRES>)
	       (<VERB? CLIMB-UP CLIMB-FOO CLIMB-ON>
		<TELL ,NO-TALENT CR>)>>

<ROUTINE SEE-WIRES? ()
	 <COND (<OR <EQUAL? ,HERE ,PLATFORM-1 ,PLATFORM-2 ,TIGHTROPE-ROOM>
	            <EQUAL? ,HERE ,RING>>
		<RTRUE>)
	       (T
		<RFALSE>)>>  

<OBJECT PLATFORM
	(IN LOCAL-GLOBALS)
	(DESC "platform")
	(SYNONYM PLATFORM)
	(ADJECTIVE SMALL UNSTABLE OPPOSITE)
	(FLAGS NDESCBIT)
	(ACTION PLATFORM-F)>

<ROUTINE PLATFORM-F ()
	 <COND (<IS-ADJ? ,W?OPPOSITE>
		<COND (<VERB? WALK-TO THROUGH>
		       <COND (<OR ,HEADING-EAST?
				  <EQUAL? ,HERE ,PLATFORM-1>>
			      <DO-WALK ,P?EAST>)
			     (<EQUAL? ,HERE ,PLATFORM-2>
			      <DO-WALK ,P?WEST>)>)
		      (<TOUCHING? ,PLATFORM>
		       <CANT-REACH ,PLATFORM>)>) 
	       (<AND <VERB? LOOK-ON>
		     <EQUAL? ,HERE ,PLATFORM-1 ,PLATFORM-2>>
		<V-LOOK>
		<RTRUE>)
	       (<VERB? PUT-ON>
		<COND (<EQUAL? ,HERE ,PLATFORM-1 ,PLATFORM-2>
		       <PERFORM ,V?DROP ,PRSO>
		       <RTRUE>)
		      (T
		       <CANT-REACH ,PLATFORM>)>)
	       (<VERB? THROUGH WALK-TO BOARD>
		<COND (<EQUAL? ,HERE ,PLATFORM-1 ,PLATFORM-2>
		       <TELL ,LOOK-AROUND CR>)
		      (<EQUAL? ,HERE ,TIGHTROPE-ROOM>
		       <COND (,HEADING-EAST?
			      <DO-WALK ,P?EAST>)
			     (T
			      <DO-WALK ,P?WEST>)>)
		      (T	     
	       	       <CANT-SEE ,PLATFORM>)>)
	       (<VERB? LEAP LEAP-OFF>
		<COND (<AND <EQUAL? ,HERE ,TIGHTROPE-ROOM>
		            <VERB? LEAP-OFF>>
		       <TELL ,LOOK-AROUND CR>)		      
		      (T
		       <TELL ,UNBALANCED>
		       <FLYING>		      
		       <TELL "And you fall ...">
		       <FALL-DOWN>)>)>>

<ROUTINE PLATFORM-EXIT-F ()
         <COND (<FSET? ,SUIT ,WORNBIT>
		<TELL "You're not dressed for wire-walking." CR>
		<RFALSE>)
	       (<NOT <HELD? ,POLE>>
		<ENABLE <QUEUE I-TREMBLE <+ 2 <RANDOM 3>>>>)>
 	 <COND (<EQUAL? ,P-WALK-DIR ,P?EAST>
		<SETG HEADING-EAST? T>)
	       (T
		<SETG HEADING-EAST? <>>)>
	 <SETG ON-ROPE 1>
	 <FCLEAR ,TIGHTROPE-ROOM ,TOUCHBIT>
	 <RETURN ,TIGHTROPE-ROOM>>

<GLOBAL LEAN-NORTH? <>>

<GLOBAL TREMBLE-C 0>

<ROUTINE I-TREMBLE ()
	 <SETG TREMBLE-C <+ ,TREMBLE-C 1>>
         <ENABLE <QUEUE I-TREMBLE -1>>
	 <COND (<EQUAL? ,TREMBLE-C 4>
		<TELL
"You're really fighting it now, the high wire starts acting like a jump rope. ">
	        <FLYING>
	        <CRLF>
		<TELL <PICK-ONE ,FALL-GAG>>
	        <TELL " right before you plummet ...">
                <FALL-DOWN>)
	       (<AND <G? ,TREMBLE-C 1>
		     <NOT <VERB? LEAN>>>
		<TELL 
"You're still out of balance, " <PICK-ONE ,LEANS> " now, to the ">
	        <COND (,LEAN-NORTH?
		       <TELL "north." CR>)
		      (T
		       <TELL "south." CR>)>
		<RTRUE>)
	       (<EQUAL? ,TREMBLE-C 1>
		<TELL "You find " D ,ME>	        
		<LEANING>
		<COND (<PROB 50>
		       <LEAN T>)
		      (T
		       <LEAN>)>)>>

<ROUTINE LEANING ()
	 <TELL " leaning " <PICK-ONE ,LEANS> " to the">>

<ROUTINE LEAN ("OPTIONAL" (NORTH? <>))
	 <COND (.NORTH?
		<TELL " north">	               
	        <SETG LEAN-NORTH? T>)
	       (T
		<TELL " south">
	        <SETG LEAN-NORTH? <>>)>
	 <TELL ,PERIOD>>
	       
<GLOBAL LEANS 
	<LTABLE 0 
	"almost imperceptibly"
	"just a hair"
	"quite noticeably"
	"radically">>

<GLOBAL FALL-GAG
	<LTABLE 0 
	"You're doing a pretty good Elvis"
	"Flailing away to regain some balance, you nearly slip a disk">>

<ROUTINE FLYING ("AUX" OBJ)
	 <COND (<SET OBJ <FIRST? ,PROTAGONIST>>
	        <COND (<NEXT? .OBJ>
		       <TELL "Everything you're holding">)
		      (T
		       <TELL "Oops,">
		       <ARTICLE .OBJ T>)>
	        <TELL " goes flying. ">)
	       (T
		<RFALSE>)>>

<ROUTINE FALL-DOWN ()
	 <DISABLE <INT I-TREMBLE>>
	 <SETG TREMBLE-C 0>
	 <SETG LEAN-NORTH? <>>
	 <FCLEAR ,TIGHTROPE-OBJECT ,RMUNGBIT>
	 <FCLEAR ,TIGHTROPE-ROOM ,TOUCHBIT>
	 <CARRIAGE-RETURNS 14>
	 <COND (<NOT <IN? ,NET ,RING>>
		<JIGS-UP 1 "... to an inglorious circus death.">
		<RTRUE>)
	       (T
		<SETG HERE ,RING>
		<ROB ,PROTAGONIST ,RING>
		<MOVE ,PROTAGONIST ,NET>
	        <TELL
"... deeply into the " D ,NET ", which heaves you high into the air ... then 
catches you back down." CR>)>>

<ROUTINE ACROSS-ROPE ()
	 <COND (<OR <AND <EQUAL? ,P-WALK-DIR ,P?WEST>
		          ,HEADING-EAST?>
	      	    <AND <EQUAL? ,P-WALK-DIR ,P?EAST>
			 <NOT ,HEADING-EAST?>>>
                <TELL
"A bold attempt to excite the arena seats! ">		
		<FLYING>
	        <TELL "You sink ...">
		<FALL-DOWN>
		<RFALSE>)               
	       (<RUNNING? ,I-TREMBLE>
		<COND (<0? ,TREMBLE-C>
		       <TELL "A quiver shoots through your leading foot,">)
		      (<EQUAL? ,TREMBLE-C 2 3>
		       <TELL "Your trailing foot begins to quake,">)
		      (T
		       <TELL "You're too unstable." CR>
		       <RFALSE>)>
		<TELL " stopping you dead on the wire." CR>
		<RFALSE>)
	       (<NOT <EQUAL? ,ON-ROPE 5>>
		<SETG ON-ROPE <+ ,ON-ROPE 1>>
	        <TELL "You take a couple of tentative steps across the wire">
		<COND (<EQUAL? ,ON-ROPE 3>
		       <TELL ", reaching the halfway point">)>
 		<TELL " ..." CR>
	       	<RETURN ,TIGHTROPE-ROOM>)
	       (T 
	        <RETURN <PLATFORM-RETURN>>)>>

<ROUTINE PLATFORM-RETURN ("AUX" FOO)
	 <COND (,HEADING-EAST?
		<SET FOO ,PLATFORM-2>)
	       (T
	        <SET FOO ,PLATFORM-1>)>
	 <SETG ON-ROPE 0>
	 <DISABLE <INT I-TREMBLE>>
	 <SETG HEADING-EAST? <>>
	 <COND (<AND <EQUAL? .FOO ,PLATFORM-2>
		     <NOT <FSET? ,PLATFORM-2 ,TOUCHBIT>>>
		<SETG SCORE <+ ,SCORE 10>>
		<TELL 
"\"Ta Daaaaaaaaaaa.\" Those familiar notes from tonight's show reverberate
through your body in triumph." CR CR>)>
	 <RETURN .FOO>>

;" *** Lion stuff *** "

<OBJECT LION-CAGE 
	(IN LOCAL-GLOBALS)
	(DESC "lions' den")
	(SYNONYM DEN CAGE BAR BARS)
	(ADJECTIVE LIONS LION\'S ROUND LION)
	(FLAGS NDESCBIT)
	(ACTION LION-CAGE-F)>

;"RMUNGBIT = can see that lion stand has been moved"

<ROUTINE LION-CAGE-F ()
	 <COND (<VERB? UNLOCK LOCK OPEN CLOSE>
		<PERFORM ,PRSA ,LION-DOOR ,PRSI>
		<RTRUE>)
	       (<VERB? LOOK-INSIDE>
		<TELL ,YOU-SEE  
" a pair of sleepyheaded lions resting on their haunches in the sawdust. ">
		<TELL
"There is an enclosed " D ,STAND " in the " D ,LION-CAGE ".">
		<CRLF>)
	       (<AND <VERB? PUT>
		     <PRSI? ,LION-CAGE>
		     <NOT <IDROP>>>
		<COND (<AND <G? <GETP ,PRSO ,P?SIZE> 25>
			    <NOT <EQUAL? ,PRSO ,POLE>>>
		       <SETG PRSI ,LION-CAGE>
		       <TELL-CLOSELY-SPACED>
		       <SETG PRSI ,LION-CAGE>)		      
		      (T		       
		       <V-DIG>)>)
	      (<VERB? REACH-IN>
       	       <TELL "There is nothing within your reach." CR>)
	      (<VERB? CLIMB-ON CLIMB-FOO CLIMB-UP>
	       <PERFORM ,V?CLIMB-UP ,LION-CAGE>
	       <RTRUE>)
	      (<VERB? BOARD ENTER THROUGH>
	       <COND (<EQUAL? ,HERE ,RING>
		      <DO-WALK ,P?WEST>)>)
	      (<VERB? LEAVE EXIT DISEMBARK>
	       <TELL ,LOOK-AROUND>)>>

<OBJECT STAND 
	(IN RING)
	(DESC "lion stand")
	(SYNONYM STAND PEDESTAL)
	(ADJECTIVE ENCLOSED LION)
	(FLAGS TAKEBIT SURFACEBIT CONTBIT OPENBIT SEARCHBIT NDESCBIT
	       RMUNGBIT)
	(SIZE 90)
	(CAPACITY 50)
	(ACTION STAND-F)>

;"NDESCBIT = stand is IN RING but is described as in den
	     On den-f m-enter, if ndescbit is set it's moved
	     to DEN"

<ROUTINE STAND-F ()
	 <COND (<VERB? OPEN CLOSE>
		<CANT-OPEN>)
	       (<VERB? EXAMINE>
		<TELL 
"The " D ,STAND " is a red three-foot-high, cylindrical pedestal. " CRLF>
       		<RTRUE>)
	       (<VERB? LOOK-ON>
 	        <TELL "There's nothing on the stand." CR>) 
	       (<AND <EQUAL? ,HERE ,RING>
		     <TOUCHING? ,STAND>>
	        <CANT-REACH ,STAND>)>>

<OBJECT NIMROD
	(IN RING)
	(DESC "shaggy lion")
	(SYNONYM LION CAT MANE ANIMAL) 
	(ADJECTIVE BIG SHAGGY BLOND)	
	(FLAGS ACTORBIT NDESCBIT)
	(ACTION NIMROD-F)
	(SIZE 100)>

<ROUTINE NIMROD-F ()
	 <COND (<TALKING-TO? ,NIMROD>
		<TALK-TO-LION>
		<STOP>)
	       (<VERB? EXAMINE>
		<TELL 
"The lion wags its salivating tongue in stride, at times giving off a
deep-throated purr." CR>)
	       (<OR <AND <VERB? THROW>
		         <PRSI? ,ELSIE>>
		    <AND <VERB? GIVE SHOW>
		         <HELD? ,PRSO>>>
		<PERFORM ,V?PUT ,PRSO ,LION-CAGE>
		<RTRUE>)>>

<ROUTINE TALK-TO-LION ()
	 <TELL "The big cat pays you no heed." CR>>

<OBJECT ELSIE
	(IN RING)
	(DESC "smooth-bodied lion")
	(SYNONYM LION CAT ANIMAL)
	(ADJECTIVE BIG SMOOTH)
	(FLAGS ACTORBIT NDESCBIT FEMALE)
	(ACTION ELSIE-F)
	(SIZE 100)>
 
<ROUTINE ELSIE-F ()
	 <COND (<TALKING-TO? ,ELSIE>
		<TALK-TO-LION>
		<STOP>) 
	       (<VERB? EXAMINE>
       	        <TELL 
"With each stride the cat's muscle-laden shoulder bones pivot up and
down in tandem." CR>)
	       (<OR <AND <VERB? THROW>
		         <PRSI? ,ELSIE>>
	  	    <AND <VERB? GIVE SHOW>
		         <HELD? ,PRSO>>>
		<PERFORM ,V?PUT ,PRSO ,LION-CAGE>
		<RTRUE>)>>

<OBJECT LION-NAME
        (IN RING)
	(DESC "lion")
	(SYNONYM ELSIE NIMROD LIONS CATS)
	(ADJECTIVE CAT BIG)
	(FLAGS NDESCBIT)
	(ACTION LION-NAME-F)>

;"rmungbit = guard told me about lion-name, showing face"

<ROUTINE LION-NAME-F ()
         <COND (<DONT-HANDLE? ,LION-NAME>
		<RFALSE>)
	       (T
		<COND (<VERB? EXAMINE>
		       <TELL 
"You glance at each lion and realize that, b">)			       
	              (T
		       <TELL "B">)>
		<TELL  
"ecause you were outside the " D ,BIGTOP " stuck waiting in line when the
lions were introduced, you're not certain who is who. You'll have to refer
to each as the " D ,NIMROD " or the " D ,ELSIE "." CR>
		<STOP>)>>

<OBJECT LION-DOOR
	(IN LOCAL-GLOBALS)
	(DESC "cage door")
	(SYNONYM DOOR GATE LOCK)
	(ADJECTIVE CAGE)
	(FLAGS DOORBIT NDESCBIT LOCKEDBIT CAGEBIT)>
 
<ROOM CLOWN-ALLEY
	(IN ROOMS)>

<ROOM CON-AREA  
	(IN ROOMS)
	(DESC "Connection")	
	(NORTH TO WINGS)
	(SOUTH TO NEAR-WAGON)
	(WEST TO BESIDE-BIGTOP)
	(EAST PER TURNSTILE-EXIT)
	(SW TO BACK-YARD)
	(IN TO WINGS)
	(FLAGS ONBIT RLANDBIT)
	(GLOBAL BIGTOP BANNER TURNSTILE SLOT)
	(ACTION CON-AREA-F)>

<ROUTINE CON-AREA-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>	
	   	<TELL
"This area of matted-down crabgrass lies between the vaulted " D ,BIGTOP
" entrance to the north and the enticements of the midway to the east, where
a " D ,BANNER " hangs crookedly above a " D ,TURNSTILE ". There is a " 
D ,FOUNTAIN " near the side wall of the tent. You can enter the night to 
the west and south." CR>)			      
	       (<EQUAL? .RARG ,M-ENTER>		
		<COND (<EQUAL? ,P-WALK-DIR ,P?SOUTH ,P?OUT>
		       <TELL 
"You emerge into the warm night air of summer." CR CR>
	   	       <COND (<NOT <FSET? ,CON-AREA ,TOUCHBIT>>
	               	      <MOVE ,CROWD ,CON-AREA>
			      <ENABLE <QUEUE I-BOOST -1>>)>)>)>>

<OBJECT BANNER
	(IN LOCAL-GLOBALS)
	(DESC "sagging banner")
	(SYNONYM BANNER)
	(ADJECTIVE SAGGING)
	(FLAGS NDESCBIT)
	(ACTION BANNER-F)>

<ROUTINE BANNER-F ()
	 <COND (<VERB? READ EXAMINE>
		<CRLF>
		<COND (<EQUAL? ,HERE ,CON-AREA>	
		       <TELL "\"TO SIDESHOWS">)
		      (T
		       <TELL "\"THIS WAY TO THE EGRESS">)>
		<TELL "\"" CR>)
	       (<TOUCHING? ,BANNER>
		<CANT-REACH ,BANNER>)>>

<OBJECT FOUNTAIN
	(IN CON-AREA)
	(DESC "drinking fountain")
	(SYNONYM FOUNTAIN SPOUT)
	(ADJECTIVE DRINKING)
	(FLAGS NDESCBIT)
	(ACTION FOUNTAIN-F)>

<ROUTINE FOUNTAIN-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"It's your standard " D ,FOUNTAIN ", with a button next to the spout." CR>)
	       (<VERB? DRINK-FROM>
		<PERFORM ,V?PUSH ,BUTTON>
		<RTRUE>)>>

<OBJECT BUTTON
	(IN CON-AREA)
	(DESC "button")
	(SYNONYM BUTTON)
	(FLAGS NDESCBIT)
	(ACTION BUTTON-F)>

<ROUTINE BUTTON-F ()
	 <COND (<VERB? PUSH>		
	        <COND (<RUNNING? ,I-BOOST>
		       <COND (<EQUAL? ,BOOST-COUNTER 3>
			      <SETG HELPED-THUMB T>
			      <THUMB-DRINKS>
			      <BOOST-EXIT>)
			     (T
			      <TELL "Somebody else is ahead of you." CR>)>)
		      (<PROB 50>
		       <TELL 
"A jet of water hits you square in the eye." CR>)
		      (T
		       <TELL
"The sip of water is refreshing on this hot night." CR>)>)>>

<OBJECT GLOBAL-WATER
	(IN GLOBAL-OBJECTS)
	(DESC "water")
	(SYNONYM DRINK WATER)
	(FLAGS NDESCBIT)
	(ACTION GLOBAL-WATER-F)>

<ROUTINE GLOBAL-WATER-F ()
	 <COND (<EQUAL? ,HERE ,CON-AREA>
		<COND (<VERB? TAKE DRINK TASTE>
		       <PERFORM ,V?PUSH ,BUTTON>
		       <RTRUE>)
		      (T
		       <RFALSE>)>)
	       (T
	        <CANT-SEE ,GLOBAL-WATER>)>>

<ROOM BACK-YARD
      (IN ROOMS)
      (DESC "Back Yard")
      (NORTH TO BESIDE-BIGTOP)
      (SOUTH PER TURNSTILE-EXIT)
      (EAST TO NEAR-WAGON)
      (WEST TO PROP-ROOM)
      (NE TO CON-AREA)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL TURNSTILE FENCE)
      (ACTION BACK-YARD-F)>

<ROUTINE BACK-YARD-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL 
"You're standing in front of the " D ,TURNSTILE " entrance to a fenced-in
area, which is south. To the west stands a droopy tent, and the field
continues north and east." CR>)
	       (<AND <EQUAL? .RARG ,M-ENTER>
		     <ZERO? ,CLOWN-EXIT-COUNTER>
		     <NOT <RUNNING? ,I-BOOST>>
		     <NOT <FSET? ,BURNED-CAGE ,RMUNGBIT>>>
		<FSET ,BURNED-CAGE ,RMUNGBIT>
		<MOVE ,JOEY ,BACK-YARD>
		<MOVE ,FLOWER ,THUMB>
		<ENABLE <QUEUE I-CLOWN-EXIT -1>>)
	       (<EQUAL? .RARG ,M-BEG>
		<COND (<AND <RUNNING? ,I-CLOWN-EXIT>
		     	    <VERB? WALK>
		     	    <HELD? ,THUMB>>
		       <SETG CLOWN-EXIT-COUNTER 7>
		       <TELL 
"The midget becomes restless in your arms, halting your stroll." CR>)>)>>

<GLOBAL CLOWN-EXIT-COUNTER 0> ;"REMEMBER, adds one at begin. of INT"

<GLOBAL THUMB-THRU <>>

<ROUTINE I-CLOWN-EXIT ("AUX" (NOT-HOLDING <>))
	 <COND (<NOT <HELD? ,THUMB>>	
		<SET NOT-HOLDING T>)>
	 <SETG CLOWN-EXIT-COUNTER <+ 1 ,CLOWN-EXIT-COUNTER>>
	 <COND (<NOT <EQUAL? ,HERE ,BACK-YARD>>
		<SETG CLOWN-EXIT-COUNTER 8>)>
	 <COND (<EQUAL? ,CLOWN-EXIT-COUNTER 1>
		<MOVE ,THUMB ,BACK-YARD>
	        <RTRUE>)
	       (<EQUAL? ,CLOWN-EXIT-COUNTER 2>
	        <MOVE ,JOEY ,CLOWN-ALLEY>
		<SETG FOLLOW-FLAG 2>
		<ENABLE <QUEUE I-FOLLOW 2>>
		<COND (<NOT ,HELPED-THUMB>
		       <SETG CLOWN-EXIT-COUNTER 7>)>
		<TELL CR 
"The tall clown, whom you now recognize as Chuckles, barks a hello into the
cage. You hear an electronic buzz from the " D ,TURNSTILE " and Chuckles
passes through.">)
	       (<AND <EQUAL? ,CLOWN-EXIT-COUNTER 3>
		     .NOT-HOLDING>
		<TELL CR
D ,THUMB " performs an impromptu handstand.">)
	       (<AND <EQUAL? ,CLOWN-EXIT-COUNTER 4>
		     .NOT-HOLDING>
		<TELL CR 
D ,THUMB " belts out a few verses of a Russian folk song in his high-pitched,
squeaky voice while standing on his head.">)
	       (<AND <EQUAL? ,CLOWN-EXIT-COUNTER 5>
		     .NOT-HOLDING>
		<TELL CR 
"The midget performer does several cartwheels in a figure-eight pattern around
the grass field.">)
	       (<AND <EQUAL? ,CLOWN-EXIT-COUNTER 6>
		     .NOT-HOLDING>
		<TELL CR 
"In front of you, " D ,THUMB " terminates his acrobatics on one knee with
a grand gesture of his small arms.">) 
	       (<AND <EQUAL? ,CLOWN-EXIT-COUNTER 7>
		     .NOT-HOLDING>
		<TELL CR 
 D ,THUMB " is pausing to rest.">)
	       (<EQUAL? ,CLOWN-EXIT-COUNTER 8>
		<DISABLE <INT I-CLOWN-EXIT>>
		<COND (<EQUAL? ,HERE ,BACK-YARD>
		       <COND (<HELD? ,THUMB>
			      <TELL CR
"Wriggling out of your hold, ">)
			     (T
			      <CRLF>)>
	               <TELL
D ,THUMB ", in his squeaky and high-pitched voice, says \"Hello Harry\" toward
the " D ,BURNED-CAGE ". You hear a buzzing sound from the " D ,TURNSTILE " as
the midget reaches up to its lowest rung and passes through ..." CR>)>
		<SETG THUMB-THRU T>
		<DISABLE <INT I-TURNSTILE>>
		<SETG FOLLOW-FLAG 2>
		<ENABLE <QUEUE I-FOLLOW 2>>
	        <MOVE ,FLOWER ,LOCAL-GLOBALS>
		<MOVE ,THUMB ,CLOWN-ALLEY>
		<MOVE ,JOEY ,CLOWN-ALLEY>
		<RTRUE>)
	       (T
		<RFALSE>)>
	 <CRLF>>

<OBJECT CHUTE
	(IN BESIDE-BIGTOP)
	(DESC "barred passage")
	(SYNONYM PASSAGE CHUTE BAR BARS)
	(ADJECTIVE BARRED)
	(DESCFCN CHUTE-DESC)
	(FLAGS CONTBIT OPENBIT TRANSBIT)
	(CAPACITY 500)
	(ACTION CHUTE-F)>

<ROUTINE CHUTE-DESC ("OPTIONAL" X)
	 <TELL 
"About waist-high, a barred passage for wild animals extends several yards
out from the " D ,BIGTOP ".">>

<ROUTINE CHUTE-F ("OPTIONAL" (RARG <>))
	 <COND (<VERB? EXAMINE LOOK-INSIDE>
		<COND (<AND <OR <IS-NOUN? ,W?BAR>
			        <IS-NOUN? ,W?BARS>>
			    <VERB? EXAMINE>>
		        <RFALSE>)>)
	       (<VERB? BOARD THROUGH ENTER>
		<TELL-CLOSELY-SPACED T>)
	       (<VERB? FOLLOW>
		<TELL "It leads right into the " D ,BIGTOP "." CR>)
	      (<VERB? OPEN CLOSE>
	       <TELL "The rusty grate is inside the " D ,BIGTOP "." CR>)
	      (<VERB? WALK-AROUND>
	       <PERFORM ,V?LOOK-BEHIND ,CHUTE>
	       <RTRUE>)
	      (<AND <VERB? PUT>
		    <PRSI? ,CHUTE>>
	       <COND (<PRSO? ,BALLOON>
		      <RFALSE>)
		     (<AND <G? <GETP ,PRSO ,P?SIZE> 20>
			   <NOT <EQUAL? ,PRSO ,POLE>>>
		      <TELL-CLOSELY-SPACED>)		      
		     (T
		      <MOVE ,PRSO ,CHUTE>
		      <TELL "You slip">
		      <ARTICLE ,PRSO T>
		      <TELL " into the " D ,CHUTE "." CR>)>)>>

<ROOM BESIDE-BIGTOP
      (IN ROOMS)
      (DESC "Beside the Big Top")       
      (SOUTH TO BACK-YARD)
      (NORTH "You bump into the side wall of the big top.")
      (SE TO NEAR-WAGON)
      (EAST TO CON-AREA)
      (WEST "It's too dark and unfamiliar out there.")
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL BIGTOP)
      (ACTION BESIDE-BIGTOP-F)>

<ROUTINE BESIDE-BIGTOP-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You're standing next to the " D ,BIGTOP ", which is gently flapping in the
warm breeze." CR>)>>

;"Wagon and office stuff"

<ROOM NEAR-WAGON
      (IN ROOMS)
      (DESC "Near White Wagon")
      (NORTH TO CON-AREA)
      (SOUTH PER EGRESS-EXIT)
      (OUT PER EGRESS-EXIT)
      (NW TO BESIDE-BIGTOP)
      (EAST "The office door is closed.")
      (IN "The office door is closed.")
      (WEST TO BACK-YARD)
      (NE "A chain link fence stops you.")
      (GLOBAL OFFICE-DOOR BANNER FENCE WAGON)
      (FLAGS ONBIT RLANDBIT)
      (ACTION NEAR-WAGON-F)>

<ROUTINE NEAR-WAGON-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are standing on a gentle upslope of the grassy field, next to a rather
imposing trailer whose door is closed to the east. In dark panorama, the
field continues north and west -- and south, where a large banner has been
erected." CR>)>>

<GLOBAL EGRESS-C 0>

<ROUTINE EGRESS-EXIT ()
	 <SETG EGRESS-C <+ ,EGRESS-C 1>>
	 <COND (<EQUAL? ,EGRESS-C 1>
		<SETG AWAITING-REPLY 10>
		<ENABLE <QUEUE I-ARGUMENT 2>>
		<TELL 
"Are you sure you're mentally and otherwise prepared to meet up with
an " D ,EGRESS "?" CR>  
		<RFALSE>)
	       (<EQUAL? ,EGRESS-C 2>
		<SETG AWAITING-REPLY 11>
		<ENABLE <QUEUE I-ARGUMENT 2>>
		<TELL 
"Then you're fully aware of the ferociousness of this rare mammalian species,
right?" CR>
		<RFALSE>)
	       (<EQUAL? ,EGRESS-C 3>
		<DISABLE <INT I-ARGUMENT>>
		<SETG AWAITING-REPLY 12>
		<ENABLE <QUEUE I-REPLY 2>>
		<TELL
"Alright, so you know all about " D ,EGRESS "es. But do you really want to
leave the circus in all of its mystery and all of its pageantry behind?" CR>
		<RFALSE>)
	       (<G? ,EGRESS-C 3>
		<DISABLE <INT I-ARGUMENT>>
		<SETG AWAITING-REPLY <>>
		<FINISH>)>>

<ROUTINE I-ARGUMENT ()
	 <COND (<OR <EQUAL? ,P-WALK-DIR ,P?SOUTH>
		    <AND <EQUAL? ,AWAITING-REPLY 10>
			 <VERB? YES>>
		    <AND <EQUAL? ,AWAITING-REPLY 11>
			 <VERB? NO>>>
		<RTRUE>)
	       (T
		<SETG AWAITING-REPLY <>>
	 	<SETG EGRESS-C 0>)>>

<OBJECT WAGON
	(IN LOCAL-GLOBALS)
	(DESC "white wagon")
	(SYNONYM WAGON TRAILER LOGO)
	(ADJECTIVE WHITE)
	(FLAGS NDESCBIT)
	(ACTION WAGON-F)>

<ROUTINE WAGON-F ()
	 <COND (<AND <VERB? EXAMINE READ>
		     <EQUAL? ,HERE ,NEAR-WAGON>>
		<TELL
"The familiar logo for \"The Travelling Circus That Time Forgot, Inc.\" is
emblazoned across the long side of the " D ,WAGON>
	        <COND (<IS-NOUN? ,W?LOGO>
		       <TELL ,PERIOD>
		       <RTRUE>)>
		<TELL ". The closed " D ,OFFICE-DOOR " is at the east.">)
	       (<VERB? PUT-ON>
		<V-DIG>)
	       (<VERB? WALK-AROUND LOOK-BEHIND>
		<TELL "A " D ,FENCE " prevents this">
		<TELL ,PERIOD>)
	       (<VERB? KNOCK>
		<PERFORM ,V?KNOCK ,OFFICE-DOOR>
		<RTRUE>)
	       (<VERB? WALK-TO THROUGH ENTER BOARD>
		<DO-WALK ,P?IN>)
	       (<AND <VERB? LOOK-UNDER>
		     <NOT <FSET? ,POLE ,TOUCHBIT>>
		     <IN? ,POLE ,HERE>>
		<TELL <GETP ,POLE ,P?FDESC> CR>
		<RTRUE>)>> 

<OBJECT FENCE 
	(IN LOCAL-GLOBALS)
	(DESC "chain link fence")
	(SYNONYM FENCE)
	(ADJECTIVE CHAIN LINK)
	(FLAGS NDESCBIT)
	(ACTION FENCE-F)>

<ROUTINE FENCE-F ()
	 <COND (<VERB? CLIMB-UP CLIMB-FOO CLIMB-ON CLIMB-OVER>
	 	<TELL
"Though hastily constructed, the " D ,FENCE " succeeds as a barrier." CR>)
	       (<VERB? THROUGH WALK-TO ENTER>
		<DO-WALK ,P?NE>)>>

<ROUTINE DONT-HANDLE? (PERSON) ;"or thing"
	 <COND (<AND <EQUAL? .PERSON ,PRSO>
		     <VERB? FIND FOLLOW WHAT WHERE WALK-TO CALL>>
		<RTRUE>)
	       (<AND <EQUAL? .PERSON ,PRSI>
		     <VERB? ASK-ABOUT TELL-ABOUT ASK-FOR>>
		<RTRUE>)>>

<OBJECT OFFICE-DOOR
	(IN LOCAL-GLOBALS)
	(DESC "office door")
	(SYNONYM DOOR LOCK)
	(ADJECTIVE OFFICE)
	(FLAGS NDESCBIT DOORBIT LOCKEDBIT VOWELBIT)
	(ACTION OFFICE-DOOR-F)>

<ROUTINE OFFICE-DOOR-F ()
	 <COND (<VERB? KNOCK>
		<TELL 
D ,MUNRAB " pops his head out of his office, scowls at you for a moment,
then withdraws, shutting the door." CR>)>>

<OBJECT BURNED-CAGE
	(IN BACK-YARD)
	(DESC "burned cage")
	(SYNONYM CAGE BOOTH)
	(ADJECTIVE BURNED)
	(FLAGS NDESCBIT)
	(ACTION BURNED-CAGE-F)>

;"RMUNGBIT is set when on Back-yard M-enter, when I-CLOWN-EXIT starts"

<ROUTINE BURNED-CAGE-F ()
	 <COND (<VERB? LOOK-INSIDE>
		<TELL ,YOU-SEE 
" the silhouette of a man sitting quietly in semidarkness." CR>)
	       (<AND <VERB? PUT>
		     <PRSI? ,BURNED-CAGE>>
		<TELL "The guard hands">
		<ARTICLE ,PRSO T>
		<TELL " back to you." CR>)
	       (<VERB? EXAMINE>
		<TELL 
"The fire-damaged cage, perhaps once the home of some big jungle cat, has been
converted into some kind of vertical booth." CR>)
	       (<VERB? OPEN ENTER BOARD THROUGH>
	        <TELL 
"Your attempt merely rattles the cage, and the " D ,GUARD " growls at you to
back off." CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<GLOBAL GUARD-C 0>

<OBJECT GUARD
	(IN BACK-YARD)
	(DESC "guard")
	(SYNONYM GUARD HARRY SILHOETTE MAN)
	(ADJECTIVE BLIND)
	(FLAGS ACTORBIT NDESCBIT PERSON CONTBIT SEARCHBIT OPENBIT)
	(ACTION GUARD-F)>

;"rmungbit = guard told you about being a first of may, cant talk to others"

<ROUTINE GUARD-F ()
      	 <COND (<AND <TALKING-TO? ,GUARD>
		     <NOT <VERB? WAVE-AT ALARM>>
		     <ENABLED? ,I-HELIUM>>
		<SETG SCORE <+ ,SCORE 10>>
		<SETG SPEAK-HELIUM T>
		<ENABLE <QUEUE I-TURNSTILE 2>>
	        <TELL 
"The sound of your high-pitched, lighter-than-air voice is startling to "
D ,ME ", but very familiar to the " D ,GUARD ". You can hear an
electromechanical buzzing sound from the " D ,TURNSTILE "." CR> 
		<STOP>)
	       (<EQUAL? ,GUARD ,WINNER>
                <COND (<AND <VERB? TELL-ABOUT>
	                    <PRSO? ,ME>>			   
	               <SETG WINNER ,PROTAGONIST>
	               <PERFORM ,V?ASK-ABOUT ,GUARD ,PRSI>
	               <SETG WINNER ,GUARD>
	               <RTRUE>)
		      (<VERB? WHO WHAT>
		       <SETG WINNER ,PROTAGONIST>
		       <PERFORM ,V?ASK-ABOUT ,GUARD ,PRSO>
		       <SETG WINNER ,GUARD>
		       <RTRUE>)
		      (<AND <VERB? RUB>
		       	    <HELD? ,PRSO ,PROTAGONIST>>
		       <SETG WINNER ,PROTAGONIST>
		       <PERFORM ,V?GIVE ,PRSO ,GUARD>
		       <SETG WINNER ,GUARD>
		       <RTRUE>)
		      (<AND <VERB? WHERE>
			    <PRSO? ,GIRL>>
		       <SETG WINNER ,PROTAGONIST>
		       <PERFORM ,V?ASK-ABOUT ,GUARD ,PRSO>
		       <SETG WINNER ,GUARD>
		       <RTRUE>)
		      (<VERB? HELLO THANK>
	               <SETG WINNER ,PROTAGONIST>
	               <PERFORM ,PRSA ,GUARD>
	               <SETG WINNER ,GUARD>
	               <RTRUE>)
		      (<AND <VERB? YES>
			    <EQUAL? ,AWAITING-REPLY 6>>
		       <V-YES>)
		      (<AND <VERB? NO>
			    <EQUAL? ,AWAITING-REPLY 6>>
		       <V-NO>)
		      (T 
		       <TELL "The guard just sits quietly in his cage." CR>
		       <STOP>)>)
	      (<HURT? ,GUARD>
	       <JIGS-UP 5  
"You are suddenly skewered by a white cane honed to needle-sharpness.">)
	      (<VERB? EXAMINE>
	       <TELL 
,YOU-SEE " the shadowy outline of a man who's wearing a dark " D ,SUNGLASSES
"." CR>)
	      (<AND <VERB? GIVE>
	       	    <PRSI? ,GUARD>>
		      <TELL 
"While you're still holding">
	       	      <ARTICLE ,PRSO T>
	       	      <TELL 
", the guard moves his hands gently over it and says, ">
		      <TELL "\"Feels like">		
	       	      <COND (<EQUAL? ,PRSO ,TAFT>
			     <TELL " cardboard">)
			    (T
			     <ARTICLE ,PRSO>)>
	       	      <TELL " to me.\"" CR>)
	      (<AND <VERB? SHOW>
		    <PRSI? ,GUARD>>
	       <TELL
"Not surprisingly, the " D ,GUARD " is oblivious to">
	       <ARTICLE ,PRSO T>
	       <TELL ,PERIOD>)
	      (<VERB? THANK>
	       <TELL "The " D ,GUARD " nods slowly." CR>)
	      (<VERB? HELLO>
	       <TELL "\"Well, good evening to you.\"" CR>)
	      (<AND <VERB? ASK-ABOUT>
		    <PRSO? ,GUARD>>
	       <COND (<PRSI? ,GIRL>
		       <COND (<FSET? ,PROTAGONIST ,RMUNGBIT> ;"won puzzle"
		       	      <TELL "The " D ,GUARD " remains silent." CR>)
		      	     (T
		       	      <ENABLE <QUEUE I-DID 2>>
		       	      <SETG AWAITING-REPLY 6>
		       	      <TELL
"\"But you already asked me about her, right?\"" CR>)>)
		     (<PRSI? ,THUMB>
		      <TELL
"\"A very popular attraction, small but charismatic.\"" CR>) 
		     (<AND <PRSI? ,JOEY>
			   <NOT <FSET? ,JOEY ,RMUNGBIT>>>
		      <FSET ,JOEY ,RMUNGBIT>
		      <TELL
"\"A very accomplished performer, takes a lot of pride in his craft.
Until...\" The " D ,GUARD " stops himself." CR>)  
		     (<PRSI? ,CIRCUS ,MUNRAB>
		      <COND (<FSET? ,CIRCUS ,RMUNGBIT>
			     <TELL "\"I've given my opinion.\"" CR>)
			    (T
			     <FSET ,CIRCUS ,RMUNGBIT>
			     <TELL 
"He suddenly blurts out, \"Well I can tell you this is one circus that's
headed for the barn. It's that doggone " D ,MUNRAB " and his vainglorious
dreams. They're not panning out for him, and the more he puts the squeeze
on all of us, the more dangerous this lot becomes.\"" CR>)>) 
		     (<PRSI? ,JIM>
		      <TELL
"\"Yea, sad story. Just another guy who fell out the social safety net, if
you will, and landed in the circus. And not on his feet either. So " D ,MUNRAB
" overworks him, has him living in a cage. That's the life here, that's the
circus life for the most.\"" CR>) 
		     (<PRSI? ,BURNED-CAGE>
	              <TELL "\"It's home.\"" CR>)
		    (<PRSI? ,LION-NAME ,ELSIE ,NIMROD ,GUARD ,SUNGLASSES>
		     <COND (<FSET? ,LION-NAME ,RMUNGBIT>
			    <TELL 
"\"I would rather not talk any further about my past life with the
lions.\"" CR>)
			   (T
			    <FSET ,LION-NAME ,RMUNGBIT>
			    <TELL 
"After a moment of tense silence, the guard impulsively tears off his
sunglasses and thrusts his head forward into the light. You flinch at the
sight of a slashing scar which engulfs both eye sockets.| 
|
The guard calms back down. \"Nimrod did this to me. He refuses the
whip, unlike Elsie, who is controlled only by the whip.\"" CR>)>)
		      (T
		       <TELL "\"I really can't say.\"" CR>
		       <RTRUE>)>
	       <SETG GUARD-C <+ ,GUARD-C 1>>
	       <COND (<AND <NOT <FSET? ,GUARD ,RMUNGBIT>>
			   <G? ,GUARD-C 2>			   
			   <NOT <ENABLED? ,I-DID>>
			   <NOT <PRSI? ,LION-NAME ,NIMROD ,ELSIE>>>
		      <FSET ,GUARD ,RMUNGBIT> 
		      <TELL CR 
"The guard breathes a sigh, and continues, \"I don't need eyeballs to size
up a First of May like you. Listen to me, if you think you're going to sport
around the lot asking a bunch of questions and expect answers, forget
it. These people are in no mood for lot loafers.\"" CR>)>
	       <RTRUE>)>>

<GLOBAL SPEAK-HELIUM <>>

<OBJECT SUNGLASSES
	(IN GUARD)
	(DESC "pair of sunglasses")
	(SYNONYM PAIR SUNGLASSES GLASSES)
	(ADJECTIVE DARK)
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION SUNGLASSES-F)>

<ROUTINE SUNGLASSES-F ()
	 <COND (<VERB? TAKE>
		<TELL "You can't, since that would be blind theft." CR>)>>

<OBJECT TURNSTILE
	(IN LOCAL-GLOBALS)
	(DESC "turnstile")
	(SYNONYM TURNSTILE STILE)
	(ADJECTIVE TURN)
	(FLAGS NDESCBIT)
	(ACTION TURNSTILE-F)>

<ROUTINE TURNSTILE-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"It's the fish skeleton type, with three sets of horizontal ribs extending
from a vertical spine.">
		<COND (<EQUAL? ,HERE ,CON-AREA>
		       <TELL 
" Built into the " D ,TURNSTILE " is a " D ,SLOT ".">)>
		<CRLF>)
	       (<AND <VERB? PUT>
		     <PRSO? TICKET>>
		<COND (<EQUAL? ,HERE ,CON-AREA>
		       <PERFORM ,V?PUT ,TICKET ,SLOT>
		       <RTRUE>)
		      (T
		       <CANT-SEE <> "the slot">)>)
	       (<VERB? CLIMB-OVER CLIMB-ON CLIMB-UP CLIMB-FOO LEAP>
		<TELL "You cannot scale the " D ,TURNSTILE "." CR>)
	       (<VERB? OPEN SET PUSH THROUGH WALK-TO MOVE>
		<COND (<EQUAL? ,HERE ,BACK-YARD>
		       <DO-WALK ,P?SOUTH>)
		      (<EQUAL? ,HERE ,CON-AREA>
		       <DO-WALK ,P?EAST>)>)>>

<OBJECT PSEUDO-TURNSTILE     ;"so can have a descfcn, turnstile is in loc-glo"
	(IN BACK-YARD)
	(DESC "turnstile")
	(SYNONYM SKELETON)
	(ADJECTIVE FISH)
	(DESCFCN PSEUDO-TURNSTILE-DESC)
       	(ACTION TURNSTILE-F)>

<ROUTINE PSEUDO-TURNSTILE-DESC ("OPTIONAL" X)
	 <TELL
"Adjacent to the turnstile to your south is a vertical cage.">>

<OBJECT SLOT
	(IN LOCAL-GLOBALS)
	(DESC "narrow slot")
	(SYNONYM SLOT HOLE)
	(ADJECTIVE NARROW)
	(FLAGS NDESCBIT CONTBIT OPENBIT)
	(ACTION SLOT-F)>

<ROUTINE SLOT-F ()
	 <COND (<AND <VERB? PUT>
		     <PRSI? ,SLOT>>
		<COND (<PRSO? ,TICKET>		       
		       <TELL 
"You feed " D ,TICKET " into the slot, but it's immediately rejected. Perhaps
in the real Ballyhoo game, the ticket would get you into the midway." CR>)
		      (T
		        <TELL "The slot is not configured to accept">
		        <ARTICLE ,PRSO T>
			<TELL ,PERIOD>)>)
		(<VERB? EXAMINE>
		 <TELL "The " D ,SLOT " is a few inches long." CR>)
	        (<VERB? LOOK-INSIDE>
		 <TELL "It's dark." CR>)
		(<VERB? OPEN CLOSE>
		 <V-COUNT>)>>

<ROUTINE I-TURNSTILE ()
	 <DISABLE <INT I-TURNSTILE>>
	 <COND (<EQUAL? ,HERE ,BACK-YARD>
		<TELL CR "The " D ,TURNSTILE " goes \"click.\"" CR>)>
	 <RFALSE>>

<ROUTINE TURNSTILE-EXIT ()
	 <COND (<ENABLED? ,I-TURNSTILE>
       		<TELL-PASS-TURNSTILE>
		<TELL "YOU WINNNNNNNNN">
		<TELL-FINISH>
		<RTRUE>)
	       (T
		<TELL 
"The " D ,TURNSTILE " won't budge." CR>
		<RFALSE>)>>

<ROUTINE TELL-PASS-TURNSTILE ()
	 <TELL "You pass through the creaky " D ,TURNSTILE>
	 <COND (<AND <RUNNING? ,I-CLOWN-EXIT>
		     <NOT <IN? ,THUMB ,CLOWN-ALLEY>>>
		<SETG CLOWN-EXIT-COUNTER 7>
		<TELL " right behind a scrambling " D ,THUMB>)>
	 <TELL "." CR CR>>

<ROOM PROP-ROOM
      (IN ROOMS)
      (DESC "Inside Prop Tent")
      (EAST PER EXIT-PROP-ROOM)
      (OUT PER EXIT-PROP-ROOM)
      (SOUTH PER PLEAT-EXIT)
      (FLAGS ONBIT RLANDBIT INDOORSBIT)
      (ACTION PROP-ROOM-F)
      (GLOBAL CANVAS)>

<ROUTINE PROP-ROOM-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<COND (<EQUAL? ,MEET-COUNTER 0>		            
		       <ENABLE <QUEUE I-MEET 1>>)>)
	       (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This dimly lighted tent houses a ragtag collection of outrageous props
and wacky devices, including a midget automobile that's garaged in here.">
		<CRLF>)
	       (<EQUAL? .RARG ,M-BEG>
	        <COND (<AND ,HIDING		     
		       	    <RUNNING? ,I-MEET>
		       	    <G? ,MEET-COUNTER 1>
			    <OR <DISTURB? ,MUNRAB>
			   	<DISTURB? ,DICK>
			   	<VERB? WALK STAND DISEMBARK TAKE>>>
	               <END-MEETING>)
		      (<AND <IN? ,MUNRAB ,HERE>
			    <VERB? EXAMINE>
			    <EQUAL? ,PRSO ,MUNRAB ,DICK>>
		       <TELL "You take a peek ... " CR CR>
		       <RFALSE>)>)>>  

<ROUTINE PLEAT-EXIT ()
	 <COND (<RUNNING? ,I-MEET>
		<EXIT-PROP-ROOM>
		<RFALSE>)
	       (T
		<TELL ,CANT-GO>)>      ;"too dark in this corner"
	 	<CRLF>
		<RFALSE>>

<ROUTINE EXIT-PROP-ROOM ()
	 <COND (<L? ,MEET-COUNTER 7>
		<COND (<OR <RUNNING? ,I-MEET>
			   <EQUAL? ,MEET-COUNTER 0 1>>
		       <COND (<EQUAL? ,MEET-COUNTER 0 1>
		       	      <TELL
"Taft's eyes follow your movement, halting you unsettlingly.">)
		      	     (T
		       	      <TELL 
"Realizing you could be facing trespassing charges, you hesitate.">)>
		       <CRLF>
		       <RFALSE>)>)
	       (T
	        <RETURN ,BACK-YARD>)>>

<OBJECT MASK
	(IN BESIDE-BIGTOP)
	(DESC "clown mask")
	(FDESC 
"A cheap plastic clown mask, having been carelessly dropped here, is
lying face-up on the ground.")
	(SYNONYM MASK)
	(ADJECTIVE CLOWN)
	(FLAGS TAKEBIT WEARBIT)
	(SIZE 15)	
	(ACTION MASK-F)>

<ROUTINE MASK-F ()
	 <SETG P-IT-OBJECT ,MASK>	 
	 <COND (<AND <VERB? EXAMINE>
		     <FSET? ,MASK ,WORNBIT>>
		<TELL "You're wearing it!" CR>)
	       (<VERB? WEAR>
		<PUTP ,PROTAGONIST ,P?ACTION ,PROTAGONIST-HACK-F>
		<FSET ,MASK ,WORNBIT>
		<TELL "You put on the " D ,MASK "." CR>) 
	       (<AND <VERB? LOOK-INSIDE>
		     <FSET? ,MASK ,WORNBIT>>
		<TELL ,YOU-ARE CR>)>>

<OBJECT SUIT
	(IN PROP-ROOM)
	(DESC "gorilla suit")
	(LDESC "Lying here in a heap is a gorilla suit.")
	(SYNONYM SUIT)
	(ADJECTIVE GORILLA)
	(FLAGS TAKEBIT WEARBIT)
	(SIZE 30)
	(ACTION SUIT-F)>

<ROUTINE SUIT-F ()
	 <COND (<AND <VERB? LOOK-INSIDE>
		     <FSET? ,SUIT ,WORNBIT>>
		<PERFORM ,V?LOOK-UNDER ,SUIT>
		<RTRUE>)
	       (<VERB? LOOK-INSIDE>
		<TELL "There's nothing in it." CR>)	       
	       (<AND <VERB? PUT>
		     <PRSI? ,SUIT>>
		<TELL <PICK-ONE ,WASTES> CR>)
	       (<AND <VERB? WEAR BOARD REMOVE TAKE-OFF DISEMBARK>
		     <FSET? ,SUIT ,WORNBIT>>
		<TELL "You laboriously climb ">
	 	<COND (<VERB? WEAR BOARD>
	       	       <MOVE ,SUIT ,PROTAGONIST>
		       <FSET ,SUIT ,WORNBIT>
		       <TELL "into">)
	       	      (T
		       <FCLEAR ,SUIT ,WORNBIT>
		       <TELL "out of">)>
		<TELL " the heavy, itchy " D ,SUIT "." CR>)
	       (<VERB? EXAMINE>
		<TELL
"It's a 3-H " D ,SUIT " -- heavy, hairy and headless." CR>)>>
		       		      
<OBJECT CAR
	(IN PROP-ROOM)
	(DESC "midget car")
	(SYNONYM CAR AUTO AUTOMOBILE SEAT)
	(ADJECTIVE SMALL MIDGET)
	(FLAGS TRYTAKEBIT OPENBIT CONTBIT SEARCHBIT NDESCBIT)	
	(ACTION CAR-F)>

<ROUTINE CAR-F ()
	 <COND (<VERB? OPEN CLOSE>
		<V-COUNT>)
	       (<VERB? EXAMINE SMELL>
		<COND (<NOT <EQUAL? ,P-PRSA-WORD ,W?SMELL>>
		       <TELL
"The tiny car, just a slice of lemon, is in pretty bad shape. ">)>
	        <TELL "It smells of gasoline and burnt oil." CR>)
	       (<AND <PRSI? ,CAR>
		     <VERB? PUT PUT-ON>>
		<V-DIG>)
	       (<VERB? LOOK-INSIDE>
		<TELL 
"It's a one-seater, sporting only an ignition switch on the dash board."
CR>)
	       (<VERB? BOARD THROUGH ENTER CLIMB-ON DRIVE>
		<COND (<FSET? ,CAR ,RMUNGBIT>
		       <TELL ,BASKET-CASE CR>)
		      (T
		       <FSET ,CAR ,RMUNGBIT>
		       <TELL
"Only a basket case or a child would fit in there." CR>)>)
	       (<VERB? LAMP-ON>
		<PERFORM ,PRSA ,SWITCH>
		<RTRUE>)>>

<OBJECT SWITCH
	(IN PROP-ROOM)
	(DESC "ignition switch")
	(SYNONYM SWITCH)
	(ADJECTIVE IGNITION)
	(FLAGS NDESCBIT VOWELBIT)
	(ACTION SWITCH-F)>

<ROUTINE SWITCH-F ()
	 <COND (<VERB? LAMP-ON SET PUSH THROW>
		<COND (<IN? ,MUNRAB ,HERE>
		       <TELL "That surely will get you caught." CR>)
		      (<NOT <FSET? ,SWITCH ,RMUNGBIT>>
		       <FSET ,SWITCH ,RMUNGBIT>
		       <TELL 
"The " D ,CAR " chugs violently for a couple of seconds, lets out a big bang,
then dies." CR>)
		      (<PROB 35>
		       <TELL 
"The " D ,CAR " backfires loudly and comically." CR>)
		      (T
		       <TELL "Nothing happens." CR>)>)>>
		      
<GLOBAL DID-C 0>

<ROUTINE I-DID ()
	 <ENABLE <QUEUE I-DID -1>>
	 <SETG DID-C <+ ,DID-C 1>>
	 <COND (<VERB? YES NO>
		<RFALSE>)
	       (T
		<FCLEAR ,PROTAGONIST ,RMUNGBIT> ;"cant win did puzzle"
		<SETG DID-C 0>
		<SETG AWAITING-REPLY <>>
		<DISABLE <INT I-DID>>)>>
	       
<OBJECT TAFT
	(IN PROP-ROOM)
	(DESC "figure of President Taft")	
	(DESCFCN TAFT-DESC)
	(SYNONYM TAFT PROP CHARACTER FIGURE)
	(ADJECTIVE PRESIDENT WILLIAM HOWARD CARDBOARD)
	(FLAGS TAKEBIT ACTORBIT PERSON)
	(SIZE 50)
	(ACTION TAFT-F)>

<ROUTINE TAFT-DESC ("OPTIONAL" X)
         <TELL "President William Howard Taft is here.">>

;"RMUNGBIT = character is now known as cardboard, not human"

<ROUTINE TAFT-F ()
	 <COND (<AND <VERB? EXAMINE>
		     <NOT <HELD? ,TAFT>>>
		<TELL
"The imposing " D ,TAFT " stands quite still." CR>)
               (<TALKING-TO? ,TAFT>
		<TELL 
"He remains silent, unimpeachably frozen." CR>
		<STOP>)
	       (<OR <TOUCHING? ,TAFT>
		    <VERB? WALK-AROUND LOOK-BEHIND>>
	        <COND (<NOT <FSET? ,TAFT ,RMUNGBIT>>
		       <FSET ,TAFT ,RMUNGBIT>
		       <TELL
"Taft wobbles slightly, revealing himself to be nothing but a cardboard
character, a mere prop." CR>)
		      (T
		       <RFALSE>)>)
		(<AND <VERB? HIDE-BEHIND>
		      <NOT ,HIDING>
		      <RUNNING? ,I-MEET>>
		 <HIDE-BEHIND-TAFT>)>> 
		
<ROUTINE HIDE-BEHIND-TAFT ("OPTIONAL" (FORCED <>))
	 <COND (.FORCED
		<TELL "Fear motivates you to">
	        <SETG MEET-COUNTER 7>)
	       (T
	        <TELL "You">
		<SETG MEET-COUNTER 6>)>
	 <COND (<HELD? ,TAFT>
		<MOVE ,TAFT ,HERE>
		<TELL " set Taft down then">)>
	 <SETG HIDING T>
	 <FSET ,TAFT ,NDESCBIT>
	 <TELL " crouch behind the cardboard character." CR>
	 <RTRUE>>

<GLOBAL HIDING <>>

<GLOBAL MEET-COUNTER 0> ;"they ENTER prop-tent on number 7; LEAVE on 9"

<ROUTINE I-MEET ()
	 <ENABLE <QUEUE I-MEET -1>>
	 <FCLEAR ,VOICES ,INVISIBLE>
	 <SETG MEET-COUNTER <+ ,MEET-COUNTER 1>>
	 <COND (<OR <EQUAL? ,MEET-COUNTER 1 3>
	            <EQUAL? ,MEET-COUNTER 6>>
		<TELL CR
"You can hear muffled voices coming from outside"> 
		<COND (<NOT <EQUAL? ,MEET-COUNTER 1>>
		       <TELL ", getting louder and nearer">)>
		<COND (<EQUAL? ,MEET-COUNTER 1>
		       <TELL 
" and see two ominous shadows cast against the side wall of the tent">)>
		<TELL ".">
		<COND (<EQUAL? ,MEET-COUNTER 3>
		       <TELL 
" You feel the childish embarrassment of being trapped.">)>
	       <CRLF>)
	       (<EQUAL? ,MEET-COUNTER 5>
		<TELL CR 
"You hear one voice say, \"Let's duck in here.\"" CR>)
	       (<EQUAL? ,MEET-COUNTER 7>
		<MOVE ,MUNRAB ,PROP-ROOM>
	     	<MOVE ,DICK ,PROP-ROOM>
		<COND (<NOT ,HIDING>
		       <CRLF>
		       <HIDE-BEHIND-TAFT T>)>
	        <TELL CR 
"From behind the " D ,TAFT " you hear footsteps enter the tent, a pause,
then hushed conversation." CR>
		<RTRUE>)
	       (<EQUAL? ,MEET-COUNTER 8>
		<COND (<NOT <AND <VERB? LISTEN>
				 <PRSO? ,VOICES>>>
		       <CRLF>)>
		<TELL 
"\"So, Munrab, what is it? Why have you called me here?\"| 
|
\"Listen, Detective, I've had a terrible day in your lousy little town, so
let me be brief. Receipts have been down all month, tonight's concession
sales were especially small, the towners were tightfisted, they nearly
leveled my grandstand, and on top of that somebody's kidnapped my daughter,
Chelsea. That's where you come in. Here's the most recent picture of her
-- a pretty good likeness in my opinion.\"|
|
\"" D ,MUNRAB ", why are we whispering?\"" CR>)
	       (<EQUAL? ,MEET-COUNTER 9>
		<END-MEETING>)>>

<ROUTINE END-MEETING ()
	 <DISABLE <INT I-MEET>>	 
	 <FSET ,VOICES ,INVISIBLE>
	 <FCLEAR ,WINGS ,TOUCHBIT> ;"NEW PASSAGE"
	 <FCLEAR ,TAFT ,NDESCBIT>
	 <COND (<EQUAL? ,MEET-COUNTER 9>
		<COND (<NOT <AND <VERB? LISTEN>
			         <PRSO? ,VOICES>>>
		       <CRLF>)>
		<TELL
"\"I don't know, because it's a mystery I guess. Anyhow, it's not because
I suspect any of my own people here on the lot.\" There's a pause. \"I've
got a pretty loyal crew here. Sure, I work the guys a fair amount, but hey,
no one joins the circus expecting a holiday.\"|
|
Lacking all passion and professionalism, the detective replies, \"I'll
suspect who you want me to suspect. You're paying the bill.\"|
|
\"Here, see, the language of this ransom note clearly shows that it's not
an inside job. Detective, I don't know what kind of crazies are running
loose in this town, but I'm afraid harm might come to my daughter if the
police were to show up. God knows this circus doesn't need that kind of
publicity, anyway. So I'm relying on you and you alone.\"|
|
\"I'd better hold on to that note, Munrab.\"|
|
\"Alright, then get going.\"|
|
You can hear " D ,MUNRAB " and the " D ,DICK " ">)
	       (T
	        <TELL 
D ,MUNRAB " and the " D ,DICK " notice you and they ">)>
	 <TELL "hustle out of the tent">
	 <MOVE ,MUNRAB ,CLOWN-ALLEY>	 
	 <MOVE ,DICK ,CLOWN-ALLEY>
	 <COND (<AND ,HIDING
		     <NOT <VERB? STAND>>>
		<TELL ". You stand up.">)
	       (T
		<TELL ".">)>
	 <SETG P-IT-OBJECT ,MUNRAB>
	 <SETG HIDING <>>
	 <SETG MEET-COUNTER 10> ;"I.E., can get to under the stands now"
	 <SETG FOLLOW-FLAG 13>
	 <ENABLE <QUEUE I-FOLLOW 2>>
	 <CRLF>
	 <STOP>>

<OBJECT MUNRAB
	(IN CLOWN-ALLEY)
	(DESC "Mr. Munrab")
	(SYNONYM MUNRAB OWNER MAN)
	(ADJECTIVE MR CIRCUS)
	(FLAGS ACTORBIT NARTICLEBIT PERSON NDESCBIT OPENBIT CONTBIT SEARCHBIT)
	(ACTION MUNRAB-F)>

<ROUTINE MUNRAB-F ()
	 <COND (<AND <EQUAL? ,HERE ,PROP-ROOM>
		     <TOUCHING? ,MUNRAB>>
		<CANT-REACH ,MUNRAB>)
	       (<AND <VERB? LISTEN>
		     <EQUAL? ,HERE ,PROP-ROOM>>
	        <PERFORM ,V?LISTEN ,VOICES>
	        <RTRUE>)
	       (<VERB? EXAMINE>
		<TELL 
"He gives off the dual expressions of indigestion and indignation." CR>) 
	      (<VERB? FOLLOW>
	       <COND (<EQUAL? ,FOLLOW-FLAG 13>
		      <DO-WALK ,P?EAST>)>)>>

<OBJECT DICK
	(IN LOCAL-GLOBALS)
	(DESC "detective")
      	(DESCFCN DICK-DESC)
	(SYNONYM DETECTIVE MAN DRUNK)
     	(FLAGS ACTORBIT PERSON CONTBIT OPENBIT SEARCHBIT NDESCBIT)
    	(ACTION DICK-F)>

<ROUTINE DICK-DESC ("OPTIONAL" X)
	 <TELL "The " D ,DICK " is here.">>

<ROUTINE DICK-F ()
	 <COND (<EQUAL? ,WINNER ,DICK>
                <COND (<VERB? WHERE>
		       <PERFORM ,V?ASK-ABOUT ,DICK ,PRSO>
		       <RTRUE>)
		      (<OR <VERB? HELLO>
			   <AND <VERB? TELL-ABOUT>
	                        <PRSO? ,ME>>>
	               <SETG WINNER ,PROTAGONIST>
	               <PERFORM ,V?ASK-ABOUT ,DICK ,MUNRAB> ;"to any default"
	               <SETG WINNER ,DICK>
	               <RTRUE>)>)
	      (<AND <EQUAL? ,HERE ,PROP-ROOM>
		    <TOUCHING? ,DICK>>
	       <CANT-REACH ,DICK>)
	      (<VERB? EXAMINE>
	       <TELL
"Wearing a " D ,COAT " and looking otherwise disheveled, he appears to have
some kind of " D ,MONKEY " on his back.">
	       <CRLF>)
	      (<VERB? FOLLOW>
	       <COND (<EQUAL? ,FOLLOW-FLAG 13>
		      <DO-WALK ,P?EAST>)>)>>

<OBJECT MONKEY 
        (IN DICK) 
	(DESC "monkey")
	(SYNONYM MONKEY)
	(FLAGS NDESCBIT ACTORBIT)
	(ACTION MONKEY-F)>

<ROUTINE MONKEY-F ()
	 <COND (<AND <IN? ,MONKEY ,DICK>
		     <IN? ,DICK ,HERE>>
		<TELL
"Obviously, the " D ,DICK " doesn't ACTUALLY have a " D ,MONKEY "
on his back. This is merely a metaphor indicating \"obsession\" or
\"addiction\"; in the detective's case, the latter." CR>)>>

<OBJECT COAT
	(IN DICK)
	(DESC "rumpled trenchcoat")
      	(SYNONYM TRENCH COAT)
     	(ADJECTIVE RUMPLED TRENCH)
	(FLAGS CONTBIT NDESCBIT SEARCHBIT TRYTAKEBIT OPENBIT)
    	(SIZE 15)
	(CAPACITY 10)
	(ACTION COAT-F)>

<ROUTINE COAT-F ()
	 <COND (<OR <TOUCHING? ,COAT>
		    <VERB? LOOK-INSIDE>>
		<CANT-REACH ,DICK>)>>

<ROUTINE IN-PACKAGE (OBJ)
         <TELL "[A replica of">
	 <ARTICLE .OBJ T>
	 <TELL " is included in the Ballyhoo game package.]" CR>>

<OBJECT CANVAS
	(IN LOCAL-GLOBALS)
	(DESC "canvas wall")
	(SYNONYM PLEATS WALL PLEAT TENT)
	(ADJECTIVE PLEATED DARK CANVAS SHADOW)
	(FLAGS NDESCBIT)
        (GENERIC GEN-TENT)
	(ACTION CANVAS-F)>

<ROUTINE CANVAS-F ()   
	 <COND (<VERB? EXAMINE>
		<COND (<AND <RUNNING? ,I-MEET>
			    <IS-ADJ? ,W?SHADOW>>
		       <TELL "Very ominous." CR>)
		      (<AND <NOT <FSET? ,CANVAS ,RMUNGBIT>>
			    <EQUAL? ,HERE ,PROP-ROOM>>
		       <RFALSE>)
		      (T
	       	       <TELL 
"The " D ,CANVAS " is deeply shadowed by its many pleats." CR>)>)
	       (<VERB? WALK-TO BOARD THROUGH CRAWL-UNDER>
		<TELL
"This side of the tent is too dark and shadowy to make out the confines
of the " D ,CANVAS "." CR>)>>

<ROUTINE GEN-TENT ()
	 <COND (<EQUAL? ,HERE ,PROP-ROOM>
		<RETURN ,CANVAS>)
	       (T
		<RETURN ,BIGTOP>)>>

<ROUTINE TENT-BOUND ()
	 <TELL 
"The " D ,PRSO " appears securely bound here." CR>>

<OBJECT GIRL 
	(IN LOCAL-GLOBALS)
	(DESC "Chelsea")
	(SYNONYM GIRL CHELSEA)
	(ADJECTIVE LITTLE)
	(FLAGS PERSON ACTORBIT NARTICLEBIT FEMALE)>

<OBJECT THUMB
	(IN CON-AREA)
	(DESC "Comrade Thumb")
	(DESCFCN THUMB-DESCFCN)
	(SYNONYM THUMB MIDGET MAN GENERAL)
	(ADJECTIVE COMRAD MIDGET LITTLE)
	(FLAGS ACTORBIT PERSON NARTICLEBIT TAKEBIT NDESCBIT CONTBIT OPENBIT
	       SEARCHBIT)
	(SIZE 70)
	(ACTION THUMB-F)>

<ROUTINE THUMB-F ()
	 <COND (<EQUAL? ,THUMB ,WINNER>
		<COND (<VERB? HELLO>
		       <SETG WINNER ,PROTAGONIST>
		       <PERFORM ,V?HELLO ,THUMB>
		       <SETG WINNER ,THUMB>
		       <RTRUE>)
		      (<AND <VERB? TELL-ABOUT>
			    <PRSO? ,ME>>
		       <SETG WINNER ,PROTAGONIST>
		       <PERFORM ,V?ASK-ABOUT ,THUMB ,ME>
		       <SETG WINNER ,THUMB>
		       <RTRUE>)>)
	       (<VERB? HELLO WAVE-AT>
		<TELL 
"He gives you a slow and dramatic wave, as if to a great audience." CR>)
	       (<TALKING-TO? ,THUMB>		     
		<TELL 
"Unable to comprehend what you're saying, he shrugs his shoulders." CR>
		<STOP>)
	       (<VERB? EXAMINE>
		<COND (<RUNNING? ,I-CLOWN-EXIT>
		       <TELL
"He rolls his eyes back in a theatrical way." CR>)
	       	      (T
		       <TELL
"You see nothing " <PICK-ONE ,YAWNS> " about " D ,THUMB " (except that he's
about two feet high)." <CRLF>>)>)
	       (<AND <VERB? LISTEN>
		     <EQUAL? ,CLOWN-EXIT-COUNTER 4>
		     <NOT <HELD? ,THUMB>>>
		<TELL
"It's certainly not the hit parade." CR>)
	       (<AND <VERB? DROP GIVE THROW PUT>		     
		     <PRSO? ,THUMB>>
		<TELL "He squirms out of your hold">
		<SETG CLOWN-EXIT-COUNTER 7>
		<MOVE ,THUMB ,HERE>
		<TELL ,PERIOD>)
	       (<OR <AND <VERB? RAISE PICK-UP>
			 <NOT ,PRSI>>
		    <AND <VERB? RAISE>
			 <EQUAL? ,PRSI ,FOUNTAIN ,BUTTON>>>		 
		<COND (<RUNNING? ,I-BOOST>
		       <SETG HELPED-THUMB T>
		       <TELL "Once elevated, ">
		       <THUMB-DRINKS>
		       <BOOST-EXIT>)
		      (T
		       <PERFORM ,V?TAKE ,THUMB>
		       <RTRUE>)>)
	       (<AND <VERB? TAKE>
		     <PRSO? ,THUMB>>
	        <COND (<RUNNING? ,I-BOOST>
		       <PERFORM ,V?RAISE ,THUMB>
		       <RTRUE>)
		      (<AND <RUNNING? ,I-CLOWN-EXIT>
			    <NOT ,HELPED-THUMB>>
		       <TELL 
"As you reach down, he scampers between your legs">
		       <TELL ,PERIOD>)
		      (<AND <RUNNING? ,I-CLOWN-EXIT>
			    <EQUAL? <ITAKE> T>>
		       <COND (<G? ,CLOWN-EXIT-COUNTER 3>
			      <SETG CLOWN-EXIT-COUNTER 3>)>
		       <MOVE ,FLOWER ,THUMB>
		       <TELL 
"As you put your hands on the midget, for an instant he squirms, then,
deciding you mean no harm, relaxes in your grip and you're able to lift
him.|
|
You notice him wearing a daisy in the lapel of his uniform." CR>
		       <RTRUE>)>
		<RTRUE>)
	       (<VERB? MOVE>
		<V-DIG>)
	       (<VERB? FOLLOW>
		<COND (<EQUAL? ,FOLLOW-FLAG 1>
		       <DO-WALK ,P?WEST>)
		      (<EQUAL? ,FOLLOW-FLAG 2>
		       <COND (<EQUAL? ,HERE ,BACK-YARD>
			      <DO-WALK ,P?SOUTH>)
			     (T
			      <DO-WALK ,P?WEST>)>)>)>>

<ROUTINE THUMB-DESCFCN ("OPTIONAL" X)
	 <TELL D ,THUMB " is here.">>

<ROUTINE THUMB-DRINKS ()
	 <TELL D ,THUMB " slurps his fill of " D ,GLOBAL-WATER ". He then
plops down, gives you a quick salute,">>

<OBJECT UNIFORM
	(IN THUMB)
	(DESC "uniform")
	(SYNONYM UNIFORM)
	(ADJECTIVE RUSSIAN GENERAL)
	(FLAGS NDESCBIT TRYTAKEBIT VOWELBIT)	
	(ACTION UNIFORM-F)>

<ROUTINE UNIFORM-F ()
	 <COND (<AND <IN? ,UNIFORM ,THUMB>
		     <VERB? TAKE REMOVE>>		
		<TELL D ,THUMB " is not that kind of performer." CR>)>>

<OBJECT FLOWER
	(IN LOCAL-GLOBALS)
	(DESC "flower")
	(SYNONYM FLOWER DAISY)
	(FLAGS NDESCBIT TRYTAKEBIT)	
	(ACTION FLOWER-F)>

<ROUTINE FLOWER-F ()
	 <COND (<VERB? EXAMINE TAKE PICK RUB SMELL>
		<COND (<FSET? ,FLOWER ,RMUNGBIT>
		       <TELL 
"You're not going to fall for that trick twice." CR>
		       <RTRUE>)
		      (<NOT <VERB? SMELL>>
		       <TELL "As you reach for it, t">)
		      (T
		       <TELL "T">)>
		<FSET ,FLOWER ,RMUNGBIT>
		<TELL		
"he daisy spritzes some water in your face, and " D ,THUMB "'s cherubic
face lets out a squeal of delight." CR>)>>

<GLOBAL BOOST-COUNTER 0>

<GLOBAL HELPED-THUMB <>>

<ROUTINE I-BOOST ()
	 <SETG BOOST-COUNTER <+ ,BOOST-COUNTER 1>>
	 <COND (<EQUAL? ,BOOST-COUNTER 7>
		<BOOST-EXIT>)
	       (T
	        <COND (<EQUAL? ,HERE ,CON-AREA>
		       <CRLF>
		       <COND (<EQUAL? ,BOOST-COUNTER 1>
			      <TELL
"The last of the crowd just now trickles eastward through the " 
D ,TURNSTILE ".|
|
A midget decked out in a Russian general's uniform is standing before">)
		             (<EQUAL? ,BOOST-COUNTER 2>
	                      <TELL
"The little general gets up on his tiptoes in front of">)
	                     (<EQUAL? ,BOOST-COUNTER 3>
		              <TELL 
"Attempting to do a pull-up, Comrade Thumb manages to sprawl himself onto" >)
	            	     (<EQUAL? ,BOOST-COUNTER 4>
		              <TELL
"Straining his neck to reach the spout, the midget gropes for the button,
loses his grip and plops to the " D ,GROUND " before" >)
	                    (<EQUAL? ,BOOST-COUNTER 5>
		             <TELL
"The midget looks up at you sadly, then at">)
	                    (<EQUAL? ,BOOST-COUNTER 6>
		             <TELL
"Comrade Thumb flaps his little arms once in frustration,">
                             <BOOST-EXIT>
			     <RFALSE>)>
	              <TELL " the " D ,FOUNTAIN "." CR>)
		     (T
		      <RFALSE>)>)>>

<ROUTINE BOOST-EXIT ()
	 <MOVE ,THUMB ,LOCAL-GLOBALS>	 
	 <DISABLE <INT I-BOOST>>
	 <MOVE ,CROWD ,CLOWN-ALLEY>
	 <COND (<AND <EQUAL? ,HERE ,CON-AREA>
		     <L? ,BOOST-COUNTER 7>>
		<TELL " and waddles off into the darkness." CR>
		<SETG FOLLOW-FLAG 1>
		<ENABLE <QUEUE I-FOLLOW 2>>)>
	 <RTRUE>> 

<OBJECT JOEY
	(IN LOCAL-GLOBALS)
	(DESC "Chuckles")
	(DESCFCN JOEY-DESC)
	(SYNONYM CHUCKLES CLOWN MAN)
	(ADJECTIVE LANKY TALL)
	(FLAGS ACTORBIT PERSON NARTICLEBIT CONTBIT OPENBIT SEARCHBIT)
	(ACTION JOEY-F)>

;"RMUNGBIT = asked guard about him"

<ROUTINE JOEY-DESC ("OPTIONAL" X)
	 <COND (<EQUAL? ,HERE ,BACK-YARD>
		<TELL
"A tall and lanky clown in baggy pants trudges out of the ">
		<COND (<EQUAL? ,P-WALK-DIR ,P?EAST>
		       <TELL D ,DARKNESS>)
		      (T
		       <TELL "tent">)>
		<TELL
" and toward the " D ,TURNSTILE ". " D ,THUMB " follows behind.">)>>

<ROUTINE JOEY-F ()
      	 <COND (<EQUAL? ,WINNER ,JOEY>
                <COND (<AND <VERB? TELL-ABOUT>
	                    <PRSO? ,ME>>
	               <SETG WINNER ,PROTAGONIST>
	               <PERFORM ,V?ASK-ABOUT ,JOEY ,PRSI>
	               <SETG WINNER ,JOEY>
	               <RTRUE>)
	              (<VERB? HELLO>
	               <SETG WINNER ,PROTAGONIST>
	               <PERFORM ,V?HELLO ,JOEY>
	               <SETG WINNER ,JOEY>
	               <RTRUE>)
		      (T
		       <TELL ,BEAT-IT>
                       <STOP>)>)                 ;"end of winner"
	       (<AND <TALKING-TO? ,JOEY>
		     <NOT <VERB? TELL>>>
	    	<TELL ,BEAT-IT>
		<STOP>)
	       (<VERB? FOLLOW>
		<COND (<EQUAL? ,FOLLOW-FLAG 2>
		       <DO-WALK ,P?SOUTH>)>)>>

<OBJECT KEY
	(IN LOCAL-GLOBALS)
	(DESC "key")
	(SYNONYM KEY)>

<OBJECT JIM
	(IN LOCAL-GLOBALS)
	(DESC "roustabout")
	(SYNONYM ROUSTABOUT)
     	(FLAGS ACTORBIT PERSON CONTBIT OPENBIT SEARCHBIT)
    	(ACTION JIM-F)>

<ROUTINE JIM-F ()
	 <COND (<AND <VERB? FOLLOW>
		     <EQUAL? ,FOLLOW-FLAG 14>>
		<DO-WALK ,P?SOUTH>)>>
		      
<OBJECT DUFFY
	(IN LOCAL-GLOBALS)
	(DESC "Sgt. Duffy")     	
	(SYNONYM DUFFY)
	(ADJECTIVE SGT SERGEANT)
	(FLAGS ACTORBIT PERSON NARTICLEBIT)
	(ACTION DUFFY-F)>

<ROUTINE DUFFY-F ()
	 <COND (<AND <EQUAL? ,PRSI ,DUFFY>
		     <VERB? ASK-ABOUT TELL-ABOUT ASK-FOR>>
		<RFALSE>)
	       (T
		<TELL "This isn't his usual beat." CR>)>>

<OBJECT TICKET
	(IN LOCAL-GLOBALS)
	(DESC "your ticket")
	(SYNONYM TICKET)
	(ADJECTIVE MY YOUR)
	(LDESC "Your ticket lies here.")
	(FLAGS TAKEBIT CONTBIT OPENBIT NARTICLEBIT)
        (SIZE 2)
	(ACTION TICKET-F)>

<ROUTINE TICKET-F ()
	 <COND (<OR <VERB? PUSH PUNCH CUT>
		    <VERB? LOOK-INSIDE EXAMINE READ>>
		<IN-PACKAGE ,TICKET>
       		<RTRUE>)
	       (T
		<RFALSE>)>>

<OBJECT EGRESS
	(IN GLOBAL-OBJECTS)
	(DESC "egress")
	(SYNONYM EGRESS)
	(FLAGS NDESCBIT VOWELBIT)
	(ACTION EGRESS-F)>

<ROUTINE EGRESS-F ()
	 <COND (<VERB? WHAT>
		<TELL
"You'd have to see it to believe it." CR>)	
	       (<VERB? WALK-TO>
		<DO-WALK ,P?OUT>)>>

<OBJECT LADDER
	(IN LOCAL-GLOBALS)
	(DESC "ladder")
	(SYNONYM LADDER)
	(ADJECTIVE ROPE SMALL)
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION LADDER-F)>

<ROUTINE LADDER-F ()
	 <COND (<VERB? TAKE>
		<COND (<EQUAL? ,P-PRSA-WORD ,W?TAKE ,W?GET ,W?REMOVE>
		       <TELL "It's not takeable." CR>)
		      (T
		       <PERFORM ,V?CLIMB-FOO ,LADDER>)>
		<RTRUE>)			   
	       (<AND <VERB? UNTIE TAKE-WITH>
		     <PRSI? ,POLE>>
		<PERFORM ,V?UNTIE ,LADDER>
		<RTRUE>)
	       (<VERB? CLIMB-UP CLIMB-FOO>
		<DO-WALK ,P?UP>)
	       (<VERB? CLIMB-DOWN>
	        <DO-WALK ,P?DOWN>)>>

<ROUTINE CLIMB? ("AUX" X (TO-GROUND? T) (GROUND <>))
	 <COND (<CANT-CLIMB?>		     		
	        <SET X <FIRST? ,PROTAGONIST>>
		<REPEAT ()
			<COND (<AND <NOT <FSET? .X ,WORNBIT>>
			            <NOT <EQUAL? .X ,BALLOON>>>
			       <RETURN>)
			      (T
			       <SET X <NEXT? .X>>)>>
		<COND (<SET GROUND <GETP ,HERE ,P?GROUND-LOC>>
		       <MOVE .X .GROUND>)
		      (T
		       <SET TO-GROUND? <>>
		       <MOVE .X ,HERE>)>
		<TELL 
"Trying to grip the " D ,LADDER ", you fumble away">
		<ARTICLE .X T>
		<COND (.TO-GROUND?
		       <TELL " and it falls to the ground below">)>
		<TELL ,PERIOD>
		<RTRUE>)
	       (T		 
		<RFALSE>)>>

<ROUTINE UP-LADDER ()
	 <COND (<NOT <CLIMB?>>
	 	<TELL-CLIMBING>
		<COND (<EQUAL? ,HERE ,RING>
		       <RETURN ,PLATFORM-1>)>)
	      (T
	       <RFALSE>)>>

<ROUTINE DOWN-LADDER ()
	 <COND (<NOT <CLIMB?>>
	 	<TELL-CLIMBING>
		<COND (<EQUAL? ,HERE ,PLATFORM-1>
		       <RETURN ,RING>)>)
	       (T
		<RFALSE>)>>

<ROUTINE CANT-CLIMB? ()
	 <COND (<AND <OR <G? <CCOUNT ,PROTAGONIST> 2>	
		         <G? <WEIGHT ,PROTAGONIST> 30>>
		     <NOT <HELD? ,POLE>>>
		<RTRUE>)
	       (<AND <HELD? ,POLE>
		     <G? <CCOUNT ,PROTAGONIST> 1>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE TELL-CLIMBING ()
	 <TELL "You grasp the " D ,LADDER " firmly and climb ">
	 <COND (<EQUAL? ,P-WALK-DIR ,P?UP>
		<TELL "up">)
	       (T
		<TELL "down">)>
	 <TELL " ..." CR CR>>

<ROUTINE TELL-CLOSELY-SPACED ("OPTIONAL" (PRSO? <>))	
         <TELL "The bars of the ">
	 <COND (.PRSO?
		<TELL D ,PRSO>)
	       (,PRSI
   		<TELL D ,PRSI>)
	       (T
		<TELL "thing">)>
	 <TELL " are too closely spaced." CR>>

<ROUTINE CRAWL-DIR ()
	 <COND (<EQUAL? ,P-PRSA-WORD ,W?CRAWL>
		<DO-WALK ,P-DIRECTION>)
      	       (<GLOBAL-IN? ,BIGTOP ,HERE>
		<PERFORM ,V?CRAWL-UNDER ,BIGTOP>)
	       (T
		<CANT-SEE ,BIGTOP>)>
	 <RTRUE>>