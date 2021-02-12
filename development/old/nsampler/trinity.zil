"TRINITY for SAMPLER II: (C)1987 Infocom, Inc. All rights reserved."
 			
<ROUTINE GO-TRINITY ()
	 <SETG GAME-FLAG 3>
	 <SETUP-TRINITY>
	 <QUEUE I-CRANE-APPEARS -1>
	 <QUEUE I-BWOMAN -1>
	 <QUEUE I-AIR-RAID -1>
	 <QUEUE I-BOY -1>
	 <GIVE-TRINITY-INSTRUCTIONS>
	 <PCLEAR>
	 <SETG HERE ,PAL-GATE>
	 <MOVE ,PROTAGONIST ,HERE>
	 <SETG WINNER ,PROTAGONIST>
	 <TELL CR
"Sharp words between the superpowers. Tanks in East Berlin. And now, reports
the BBC, rumors of a satellite blackout. It's enough to spoil your continental
breakfast.|
|
But the world will have to wait. This is the last day of your $599 London
Getaway Package, and you're determined to soak up as much of that authentic
English ambience as you can. So you've left the tour bus behind, ditched the
camera and escaped to Hyde Park for a contemplative stroll through the " 
D ,GARDENS ,PERIOD-CR CR>
	 <V-VERSION>
	 <CRLF>
	 <V-LOOK>>

<ROUTINE SETUP-TRINITY ()
	 <GENERAL-SETUP>
 	 <MOVE ,COIN ,POCKET>
	 <MOVE ,CREDIT-CARD ,POCKET>
	 <MOVE ,POCKET ,PROTAGONIST>
	 ;<REMOVE ,SCOIN>
	 <MOVE ,GBAG ,BWOMAN>
	 <MOVE ,WRISTWATCH ,PROTAGONIST>
	 <REMOVE ,CRANE>
	 <REMOVE ,BAG>
	 ;<REMOVE ,EBAG>
	 <REMOVE ,RUBY>
	 <MOVE ,GNOMON ,DIAL>
	 <MOVE ,BALL ,BEDS>
	 <MOVE ,PARASOL ,JWOMAN>
	 <REMOVE ,MEEP>
	 <MOVE ,BOY ,AT-TERRACE>
	 <MOVE ,WAND ,AT-TERRACE>
	 <MOVE ,SDISH ,AT-TERRACE>
	 <MOVE ,PRAM ,LION-GATE>
	 <FSET ,WRISTWATCH ,CHILLY>
	 <FSET ,RUBY ,CHILLY>
	 <FSET ,BWOMAN ,NDESCBIT>
	 <FSET ,CRANE ,NDESCBIT>
	 <FSET ,TRINITY-TREE ,NDESCBIT>
	 <FSET ,GNOMON ,NDESCBIT>
	 <FCLEAR ,GNOMON ,FEMALEBIT>
	 <FCLEAR ,TRINITY-TREE ,FEMALEBIT>
	 <FSET ,WRISTWATCH ,WORNBIT>
	 <FSET ,COIN ,TAKEBIT>
	 <FSET ,GNOMON ,NOALL>
	 <FSET ,AT-TERRACE ,NOALL>
	 <FSET ,BWOMAN ,ACTORBIT>
	 <FCLEAR ,PRAM ,NDESCBIT>
	 <FCLEAR ,BALL ,NDESCBIT>
	 <PUTP ,BWOMAN ,P?FDESC "An aged woman is selling crumbs nearby.">
	 <PUTP ,CRANE ,P?SDESC "paper bird">
	 ;<PUTP ,CRANE ,P?FDESC "">
	 <PUTP ,PRAM ,P?DESCFCN ,DESCRIBE-PRAM>
	 <PUTP ,PRAM ,P?ACTION ,PRAM-F>
	 <PUTP ,PRAM ,P?SDESC "perambulator">
	 <PUTP ,WIND ,P?SDESC "east wind">
	 <PUTP ,BAG ,P?SDESC "bag of crumbs">
	 <PUTP ,COIN ,P?SDESC "seven-sided coin">
	 <SETG RAID? 0>
	 <SETG FREEZE? <>>
	 <SETG HOURS 15>
	 <SETG MINUTES 30>
	 <SETG MEEP-ROOM <>>
	 <SETG SECONDS 0>
	 <SETG HCNT 7>
	 <SETG BACTION 0>
	 ;<SETG OSIGN 0>
	 <SETG CCNT 5>
	 ;<SETG APPETITE 0>
	 <SETG IN-PRAM? <>>
	 <SETG NOTIFY? 0>
	 <SETG LAYAWAY 3>
	 <SETG RUBYROOM <>>>

<ROOM TRINITY-ROOM
      (IN ROOMS)
      (DESC "Trinity")>

<ROUTINE GIVE-TRINITY-INSTRUCTIONS ()
	 <SETG HERE ,TRINITY-ROOM>
	 <USL>
	 <CRLF>
	 <TELL
"It's the last day of your London vacation. Unfortunately, it's also the
first day of World War III. Only thirty minutes remain before an H-bomb
vaporizes the city ... and you with it. Hopeless? There is one thing that
might save you -- a way to escape into another dimension. To complete this"
,EXCERPT ", you'll have to locate and walk through this dimensional exit.|
|
Good luck, and h" ,HIT-RETURN "to begin...">  
	 <READ ,P-INBUF ,P-LEXV>>

<ROOM PAL-GATE
        (IN ROOMS)
	(DESC "Palace Gate")
	(FLAGS ONBIT RLANDBIT)
	(GLOBAL GPRAM IFENCE PIGEONS NANNIES CHILDREN TOURISTS BABIES)
	(NORTH TO BROAD-WALK)
	(NE TO WABE)
	(EAST TO FLOWER-WALK)
	(SE PER IFENCE-BLOCKS)
	(SOUTH PER EXIT-GARDEN)
	(SW PER IFENCE-BLOCKS)
	(WEST PER IFENCE-BLOCKS)
	(NW PER IFENCE-BLOCKS)
	(OUT PER EXIT-GARDEN)
	(IN PER WHICH-WAY-IN)
	(ACTION PAL-GATE-F)>

<ROUTINE PAL-GATE-F (CONTEXT)
	 <COND (<EQUAL? .CONTEXT ,M-LOOK>
		<TELL "A tide of " D ,GPRAM " surges ">
		<COND (<ZERO? ,RAID?>
		       <TELL "north along the crowded " 
			     D ,BROAD-WALK ". Shad">)
		      (T
		       <TELL "through the mob around the Gate. Desert">)>
		<TELL "ed glades stretch away" ,TO-N
"east, and a hint of color marks the western edge of" TR ,FLWALK>
		<RTRUE>)
	       (<EQUAL? .CONTEXT ,M-EXIT>
		<COND (<NOT <FSET? ,WIND ,TOUCHBIT>>
		       <FSET ,WIND ,TOUCHBIT>
		       <TELL CT ,WIND 
" makes it difficult to walk straight" ,PERIOD-CR CR>)>
		<COND (<MISSED-MEEP?>
		       <CRLF>)>
		<RTRUE>)
	       (T
		<RFALSE>)>> 

<ROUTINE EXIT-GARDEN ()
	 <COND (<T? ,IN-PRAM?>
		<PERFORM ,V?EXIT ,PRAM>
		<RFALSE>)>
	 <TELL "A surge of ">
	 <SAY-TOURISTS>
	 <BLOCKS-YOUR-PATH>
	 <RFALSE>>

<ROUTINE SAY-TOURISTS ()
	 <COND (<T? ,RAID?>
		<TELL "frightened ">)>
	 <COND (<PROB 50>
		<COND (<ZERO? ,RAID?>
		       <TELL "offended ">)>
		<TELL D ,NANNIES>
		<RTRUE>)>
	 <COND (<ZERO? ,RAID?>
		<TELL "babbling ">)>
	 <TELL D ,TOURISTS>
	 <RTRUE>>

<ROOM FLOWER-WALK
	(IN ROOMS)
	(DESC "Flower Walk")
	(FLAGS ONBIT RLANDBIT)
	(GLOBAL GPRAM PIGEONS NANNIES CHILDREN TOURISTS BABIES)
	(NORTH TO LAN-WALK)
	(NE "There's no need to trample on the flowers.")
	(EAST PER EXIT-GARDEN)
	(SE "There's no need to trample on the flowers.")
	(SOUTH 
"You're already as close as anyone wants to get to the Albert Memorial.")
	(SW "There's no need to trample on the flowers.")
	(WEST TO PAL-GATE)
	(NW TO WABE)
	(OUT PER GARDEN-OUT)
	(ACTION FLOWER-WALK-F)>

<ROUTINE FLOWER-WALK-F (CONTEXT)
	 <COND (<EQUAL? .CONTEXT ,M-LOOK>
		<TELL "Gaily colored flower beds line the walks bending north
and west, filling the air with a gentle fragrance. A little path leads
northwest, between" T ,TREE "s" ,PERIOD-CR>
		<COND (<SEE-ANYTHING-IN? ,BEDS>
		       <CRLF>
		       <LOOK-IN-BEDS>)>
		<TELL CR "The spires of" T ,MEMORIAL 
		      " are all too visible" ,TO-S ". ">
		<COND (<ZERO? ,RAID?>
		       <TELL "Passing " D ,TOURISTS 
			     " hoot with laughter at the dreadful sight; "
			     D ,NANNIES 
			     " hide their faces and roll quickly away" ,PERIOD-CR>
		       <RTRUE>)>
		<TELL "Frightened " D ,TOURISTS 
		      " are scattering in every " D ,INTDIR ,PERIOD-CR>
		<RTRUE>)
	       (<AND <EQUAL? .CONTEXT ,M-EXIT>
		     <MISSED-MEEP?>>
		<CRLF>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE GARDEN-OUT ()
	 <COND (<T? ,IN-PRAM?>
		<PERFORM ,V?EXIT ,PRAM>
		<RFALSE>)>
	 <WHICH-WAY-OUT>
	 <RFALSE>>

<ROOM BROAD-WALK
	(IN ROOMS)
	(DESC "Broad Walk")
	(FLAGS ONBIT RLANDBIT)
        (GLOBAL GBAG GPRAM PIGEONS NANNIES TOURISTS BABIES CHILDREN)
	(NORTH TO LION-GATE)
        (NE TO AT-TERRACE)
	(EAST TO ROUND-POND)
	(SE TO WABE)
	(SOUTH TO PAL-GATE)
	(SW PER IFENCE-BLOCKS)
	(WEST PER VICTORIA-BLOCKS)
	(NW PER IFENCE-BLOCKS)
	(OUT PER GARDEN-OUT)
	(ACTION BROAD-WALK-F)>

<ROUTINE BROAD-WALK-F (CONTEXT)
	 <COND (<EQUAL? .CONTEXT ,M-LOOK>
	        <TELL
"A brooding " D ,VICTORIA " faces east, where" T ,WATER "s of" T ,RPOND 
" sparkle in the afternoon sun. Your eyes follow the crowded " D ,BROAD-WALK
" north and south until its borders are lost amid the ">
		<COND (<T? ,RAID?>
		       <TELL "fleeing ">)
		      (T
		       <TELL "bustle of ">)>
		<TELL D ,GPRAM
". Small paths curve northeast and southeast,">
		<TWEEN-TREES>
		<RTRUE>)
	       (<EQUAL? .CONTEXT ,M-EXIT>
		<COND (<MISSED-MEEP?>
		       <CRLF>)>
		<COND (<OR <IN? ,COIN ,BWOMAN>
			   <IN? ,BAG ,BWOMAN>>
		       <SETG LAYAWAY 1>)>
		<BWOMAN-CRY>
		<CRLF>
		<RTRUE>)
	       (<EQUAL? .CONTEXT ,M-ENTERED>
		<SETG P-HER-OBJECT ,BWOMAN>
		<FSET ,BWOMAN ,SEEN>
		<COND (<FSET? ,BWOMAN ,NDESCBIT>
		       <FCLEAR ,BWOMAN ,NDESCBIT>
		       <TELL CR "A cloud of " D ,PIGEONS
" fills the air! They circle overhead and congregate around a nearby bench, where an aged woman is selling bags of crumbs.|
|
\"Feed the birds! Thirty p!\" Her voice quavers with heartbreak" ,PERIOD-CR>
		       <RTRUE>)>
		<RFALSE>)
	       (T
		<RFALSE>)>>

<ROOM ROUND-POND
	(IN ROOMS)
	(DESC "Round Pond")
	(FLAGS ONBIT RLANDBIT)
        (GLOBAL GPRAM PIGEONS LNWALK NANNIES CHILDREN TOURISTS BABIES)
	(NORTH TO AT-TERRACE)
	(NE TO LAN-GATE)
	(EAST TO LAN-WALK)
	(SE PER EXIT-GARDEN)
	(SOUTH TO WABE)
	(SW PER EXIT-GARDEN)
	(WEST TO BROAD-WALK)
	(NW TO LION-GATE)
	(OUT PER GARDEN-OUT)
	(IN "Swimming in the Round Pond is strictly forbidden.")
	(ACTION ROUND-POND-F)>

<ROUTINE ROUND-POND-F (CONTEXT)
	 <COND (<EQUAL? .CONTEXT ,M-LOOK>
		<TELL "Ducks and swans bob on the sparkling surface of the "
D ,RPOND ". They share  with a">
		<COND (<T? ,RAID?>
		       <TELL " deserted">)
		      (T
		       <TELL "n impressive">)>
		<TELL " fleet of " D ,BOAT>
		<COND (<ZERO? ,RAID?>
		       <TELL 
", directed by the excited shouts of " D ,CHILDREN>)>
		<COND (<FIRST? ,RPOND>
		       <TELL 
". You also see" A ,CRANE " floating within reach">)>
		<TELL 
".|
|
Crowded paths radiate from the Pond in many " D ,INTDIR "s" ,PERIOD-CR>
		<RTRUE>)
	       (<AND <EQUAL? .CONTEXT ,M-EXIT>
		     <MISSED-MEEP?>>
		<CRLF>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROOM WABE
	(IN ROOMS)
	(DESC "The Wabe")
	(FLAGS ONBIT RLANDBIT)
        (NORTH PER WABE-N)
	(NE PER WABE-NE)
	(EAST PER THICKET-BLOCKS)
	(SE PER WABE-SE)
	(SOUTH PER THICKET-BLOCKS)
	(SW PER WABE-SW)
	(WEST PER THICKET-BLOCKS)
	(NW PER WABE-NW)
	(OUT PER WABE-OUT)
	(IN PER WHICH-WAY-IN)
	(ACTION WABE-F)
	(GLOBAL PIGEONS ROSE SYMBOLS)>
	
<ROUTINE WABE-F (CONTEXT)
	 <COND (<EQUAL? .CONTEXT ,M-LOOK>
		<TELL "This grassy " D ,TRINITY-CLEARING
" is only twenty feet across, and perfectly circular. Paths wander off in many " D ,INTDIR "s through the surrounding " D ,THICKET ,PERIOD-CR>
		<RTRUE>)
	       (<AND <EQUAL? .CONTEXT ,M-EXIT>
		     <MISSED-MEEP?>>
		<CRLF>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE WABE-OUT ()
	 <COND (<T? ,IN-PRAM?>
		<PERFORM ,V?EXIT ,PRAM>
		<RFALSE>)>
	 <WHICH-WAY-OUT>
	 <RFALSE>>

<ROUTINE WABE-N ()
	 <COND (<FSET? ,GNOMON ,FEMALEBIT>
		<RETURN ,ROUND-POND>)>
	 <WOBBLE>
	 <RFALSE>>

<ROUTINE WABE-NE ()
	 <COND (<FSET? ,GNOMON ,FEMALEBIT>
		<RETURN ,LAN-WALK>)>
	 <WOBBLE>
	 <RFALSE>>
		
<ROUTINE WABE-SE ()
	 <COND (<FSET? ,GNOMON ,FEMALEBIT>
		<RETURN ,FLOWER-WALK>)>
	 <WOBBLE>
	 <RFALSE>>

<ROUTINE WABE-SW ()
	 <COND (<FSET? ,GNOMON ,FEMALEBIT>
		<RETURN ,PAL-GATE>)>
	 <WOBBLE>
	 <RFALSE>>

<ROUTINE WABE-NW ()
	 <COND (<FSET? ,GNOMON ,FEMALEBIT>
		<RETURN ,BROAD-WALK>)>
	 <WOBBLE>
	 <RFALSE>>

<ROUTINE WOBBLE ()
	 <FSET ,GNOMON ,FEMALEBIT>
	 <TELL "A noise makes you hesitate.|
|
For a moment, nothing happens. Then" T ,WIND " puffs through the "
D ,TRINITY-CLEARING ", and" T ,GNOMON " on" T ,DIAL
" wobbles with a faint scrape" ,PERIOD-CR>
	 <RTRUE>>

<ROOM LION-GATE
	(IN ROOMS)
	(DESC "Black Lion Gate")
	(FLAGS ONBIT RLANDBIT)
        (GLOBAL GPRAM PIGEONS IFENCE NANNIES TOURISTS BABIES CHILDREN)
	(NORTH PER EXIT-GARDEN)
	(NE PER IFENCE-BLOCKS)
	(EAST TO AT-TERRACE)
	(SE TO ROUND-POND)
	(SOUTH TO BROAD-WALK)
	(SW PER IFENCE-BLOCKS)
	(WEST PER IFENCE-BLOCKS)
	(NW PER IFENCE-BLOCKS)
	(IN PER WHICH-WAY-IN)
	(OUT PER EXIT-GARDEN)
	(ACTION LION-GATE-F)>

<ROUTINE LION-GATE-F (CONTEXT)
	 <COND (<EQUAL? .CONTEXT ,M-LOOK>
		<TELL "Nannies and " D ,TOURISTS " hurry through the "
		      D ,LGATE>
		<COND (<ZERO? ,RAID?>
		       <TELL 
" to join" T ,GPRAM " rolling south down" T ,BWALK>)>
		<TELL ". Less crowded paths wind east along an "
D ,IFENCE ", and southeast">
		<TWEEN-TREES>
		<RTRUE>)
	       (<AND <EQUAL? .CONTEXT ,M-EXIT>
		     <MISSED-MEEP?>>
		<CRLF>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROOM LAN-GATE
	(IN ROOMS)
	(DESC "Lancaster Gate")
	(FLAGS ONBIT RLANDBIT)
	(GLOBAL GPRAM PIGEONS IFENCE NANNIES CHILDREN TOURISTS BABIES)
        (NORTH PER EXIT-GARDEN) 
	(NE PER IFENCE-BLOCKS)
	(EAST PER EXIT-GARDEN)
	(SE PER EXIT-GARDEN)
	(SOUTH PER S-LAN-GATE)
	(SW PER SW-LAN-GATE)
	(WEST PER W-LAN-GATE)
	(NW PER IFENCE-BLOCKS)
	(IN PER WHICH-WAY-IN)
	;(UP PER NO-FOOTHOLDS)
	(OUT PER EXIT-GARDEN)
	(ACTION LAN-GATE-F)>

<ROUTINE NO-FOOTHOLDS ()
	 <TELL ,YOU-CANT "find any good footholds" ,PERIOD-CR>
	 <RFALSE>>

<ROUTINE LAN-GATE-F (CONTEXT)
	 <COND (<EQUAL? .CONTEXT ,M-LOOK>
		<TELL "A crooked old tree shades" T ,GPRAM
		      " as they ">
		<COND (<ZERO? ,RAID?>
		       <TELL "roll south down" T ,LNWALK>)
		      (T
		       <TELL "flee">)>
		<TELL ". Shady paths lead west along an " D ,IFENCE
		      ", and southwest">
		<TWEEN-TREES>
		<RTRUE>)
	       (<AND <EQUAL? .CONTEXT ,M-ENTERED>
		     <NOT <FSET? ,JWOMAN ,SEEN>>>
		<FSET ,JWOMAN ,SEEN>
		<FCLEAR ,JWOMAN ,NDESCBIT>
		<QUEUE I-BLOW 2>
		<SETG P-HER-OBJECT ,JWOMAN>
		<SETG P-IT-OBJECT ,PARASOL>
		<TELL CR "There's an " D ,JWOMAN 
" under" T ,TREE ", struggling to open an " D ,PARASOL ". The stiff "
D ,WIND " isn't making it easy for her" ,PERIOD-CR>)
	       (<AND <EQUAL? .CONTEXT ,M-EXIT>
		     <MISSED-MEEP?>>
		<CRLF>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE TWEEN-TREES ("OPTIONAL" (CR T))
	 <TELL " between" T ,GTREES>
	 <COND (<T? .CR>
		<PRINT ,PERIOD-CR>)>
	 <RTRUE>>

<ROUTINE S-LAN-GATE ()
	 <COND (<SEE-JWOMAN?>
		<RFALSE>)>
	 <RETURN ,LAN-WALK>>

<ROUTINE W-LAN-GATE ()
	 <COND (<SEE-JWOMAN?>
		<RFALSE>)>
	 <RETURN ,AT-TERRACE>>

<ROUTINE SW-LAN-GATE ()
	 <COND (<SEE-JWOMAN?>
		<RFALSE>)>
	 <RETURN ,ROUND-POND>>

<ROUTINE SEE-JWOMAN? ()
	 <COND (<FSET? ,JWOMAN ,CHILLY>
		<RFALSE>)>
	 <TELL "You begin to walk past" T ,JWOMAN ", but ">
	 <COND (<NOT <FSET? ,JWOMAN ,TOUCHBIT>>
	        <TELL "stop in your tracks" ,PERIOD-CR CR>
		<PERFORM ,V?EXAMINE ,JWOMAN>
		<RTRUE>)>
	 <TELL "pause for a moment" ,PERIOD-CR>
	 <RTRUE>>

<ROOM LAN-WALK
	(IN ROOMS)
	(DESC "Lancaster Walk")
	(FLAGS ONBIT RLANDBIT)
        (NORTH TO LAN-GATE)
	(NE PER WALK-ON-GRASS)
	(EAST PER WALK-ON-GRASS)
	(SE PER WALK-ON-GRASS)
	(SOUTH TO FLOWER-WALK)
	(SW TO WABE)
	(WEST TO ROUND-POND)
	(NW TO AT-TERRACE)
	(OUT PER GARDEN-OUT)
        (ACTION LAN-WALK-F)
	(THINGS <PSEUDO (<> BIKES BIKES-PSEUDO-F)
			(<> BICYCLES BIKES-PSEUDO-F)
			(YOUNG COUPLE BIKES-PSEUDO-F)>)
	(GLOBAL GRASS GPRAM PIGEONS NANNIES CHILDREN TOURISTS BABIES)>

<ROUTINE BIKES-PSEUDO-F ()
	 <COND (<OR <PRSI? ,PSEUDO-OBJECT>
		    <PRSO? ,PSEUDO-OBJECT>>
		<TELL ,YOU-CANT "see them anymore" ,PERIOD-CR>)>>

<ROUTINE LAN-WALK-F (CONTEXT)
	 <COND (<EQUAL? .CONTEXT ,M-LOOK>
	        <TELL "An impressive " D ,ENERGY 
" of a horse and rider dominates this ">
		<COND (<ZERO? ,RAID?>
		       <TELL "bustling ">)>
		<TELL 
"intersection. The Walk continues north and south; lesser paths curve off in many " D ,INTDIR "s.|
|
A broad field of " D ,GRASS 
", meticulously manicured, extends" ,TO-E ". Beyond it you can see the " 
D ,LWATER " glittering">
		<TWEEN-TREES>
		<RTRUE>)
	       (<AND <EQUAL? .CONTEXT ,M-EXIT>
		     <MISSED-MEEP?>>
		<CRLF>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE WALK-ON-GRASS ()
	 <COND (<FSET? ,NOTICE ,TOUCHBIT>
		<GRASS-STOPS-YOU "As your feet touch the grass">
		<RFALSE>)>
	 <READ-NOTICE-FIRST>
	 <RFALSE>>

<ROUTINE READ-NOTICE-FIRST ()
	 <FSET ,NOTICE ,TOUCHBIT>
	 <SETG P-IT-OBJECT ,NOTICE>
	 <TELL "Take a moment to read" T ,NOTICE " first" ,PERIOD-CR>
	 <RTRUE>>

<ROOM AT-TERRACE
	(IN ROOMS)
	(DESC "Inverness Terrace")
	(FLAGS ONBIT RLANDBIT NOALL VOWELBIT)
        (NORTH PER IFENCE-BLOCKS)
	(NE PER IFENCE-BLOCKS)
	(NW PER IFENCE-BLOCKS)
	(OUT PER EXIT-GARDEN)
	(EAST TO LAN-GATE)
	(IN PER WHICH-WAY-IN)
	(SE TO LAN-WALK)
	(SOUTH TO ROUND-POND)
	(SW TO BROAD-WALK)
	(WEST TO LION-GATE)
	(ACTION AT-TERRACE-F)
	(GLOBAL GPRAM PIGEONS NANNIES CHILDREN TOURISTS BABIES IFENCE)>

;"NOALL = can't see a bubble."

<ROUTINE AT-TERRACE-F (CONTEXT)
	 <COND (<EQUAL? .CONTEXT ,M-LOOK>
		<TELL "Crowded walkways lead east and west along an "
D ,IFENCE ". Narrow paths wander south into the Gardens" ,PERIOD-CR> 
		<RTRUE>)
	       (<AND <EQUAL? .CONTEXT ,M-EXIT>
		     <MISSED-MEEP?>>
		<CRLF>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROOM LONG-WATER
	(IN ROOMS)
	(DESC "Long Water")
	(FLAGS ONBIT RLANDBIT)
        (NORTH PER DONT-MISS-MISSILE)
	(NE PER DONT-MISS-MISSILE)
	(EAST PER SWIM-IN-LWATER)
	(SE PER DONT-MISS-MISSILE)
	(SOUTH PER DONT-MISS-MISSILE)
	(SW PER DONT-MISS-MISSILE)
	(WEST PER DONT-MISS-MISSILE)
	(NW PER DONT-MISS-MISSILE)
	(OUT PER WHICH-WAY-OUT)
	(IN PER SWIM-IN-LWATER)
	(ACTION LONG-WATER-F)
	(GLOBAL PIGEONS BEACH MISSILE LWDOOR)>

<ROUTINE LONG-WATER-F (CONTEXT)
	 <COND (<EQUAL? .CONTEXT ,M-LOOK>
		<TELL 
"You're on a shady path that winds along the western shore of the " 
D ,LWATER ". Looking south, you can see the graceful arch of a bridge, and beyond it the cool expanse of" T ,RIVER " Serpentine" ,PERIOD-CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE SWIM-IN-LWATER ()
         <TELL "You ">
	 <COND (<EQUAL? ,P-PRSA-WORD ,W?JUMP ,W?LEAP>
		<PRINTB ,P-PRSA-WORD>)
	       (T
		<TELL "wade">)>
	 <TELL " into the cool, dark water" ,PERIOD-CR CR>
	 <RETURN ,IN-WATER>>

<ROUTINE DONT-MISS-MISSILE ()
	 <COND (<L? ,HCNT 6>
		<TELL "The spectacle on" T ,LWATER 
		      " has you frozen ">)
	       (T
		<SETG HCNT 6>
		<TELL "You begin to move away, but stop dead ">)>
	 <TELL "in your tracks" ,PERIOD-CR>
	 <I-LONDON-HOLE>
	 <RFALSE>>

<ROUTINE MISSED-MEEP? ()
	 <COND (<AND <VISIBLE? ,RUBY>
		     <NOT <FSET? ,RUBY ,TOUCHBIT>>>
		<FCLEAR ,RUBY ,CHILLY>
		<I-RUBY <>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROOM IN-WATER
	(IN ROOMS)
	(DESC "Wading")
	(FLAGS ONBIT RLANDBIT)
        (NORTH PER BEACH-TOO-FAR)
	(NE PER BEACH-TOO-FAR)
	(EAST PER ENTER-HOLE)
	(SE PER BEACH-TOO-FAR)
	(SOUTH PER BEACH-TOO-FAR)
	(SW PER BEACH-TOO-FAR)
	(WEST PER EXIT-WATER)
	(NW PER BEACH-TOO-FAR)
	(OUT PER EXIT-WATER)
	(DOWN "The water isn't deep enough here.")
	(IN PER ENTER-HOLE)
	(GLOBAL MISSILE LWDOOR BEACH PIGEONS)
	(ACTION IN-WATER-F)>

<ROUTINE IN-WATER-F (CONTEXT)
	 <COND (<EQUAL? .CONTEXT ,M-LOOK>
		<TELL "You're standing knee-deep in" T ,LWATER
		      ", not far from the western shore">
		<COND (<FSET? ,LWDOOR ,TOUCHBIT>
		       <TELL
". Looking east, you can see a " D ,LWDOOR
" hovering just above the surface">)>
		<PRINT ,PERIOD-CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE ENTER-HOLE ()
	 <COND (<FSET? ,LWDOOR ,TOUCHBIT>
		<GO-INTO-LWDOOR>
		<RFALSE>)>
	 <BEACH-TOO-FAR>
	 <RFALSE>>

<ROUTINE BEACH-TOO-FAR ()
	 <TELL CT ,BEACH " is too far away in that " D ,INTDIR ,PERIOD-CR>
	 <RFALSE>>

<ROUTINE EXIT-WATER ()
	 <TELL "You wade back to" TR ,BEACH CR>
	 <RETURN ,LONG-WATER>>

"*** JAPANESE WOMAN ***"

<OBJECT JWOMAN
	(IN LAN-GATE)
	(DESC "old woman")
	(FDESC "An old woman is standing under the tree.")
	(FLAGS NDESCBIT FEMALEBIT VOWELBIT ACTORBIT)
	(SYNONYM WOMAN LADY FACE)
	(ADJECTIVE OLD JAPANESE ORIENTAL)
	(ACTION JWOMAN-F)>

"CHILLY = gone."

<ROUTINE JWOMAN-F ("OPTIONAL" (CONTEXT <>))
	 <COND (<FSET? ,JWOMAN ,CHILLY>
		<SETG P-HER-OBJECT ,NOT-HERE-OBJECT>
		<COND (<VERB? FOLLOW FIND WHERE>
		       <TELL "You'd never find her in this crowd" ,PERIOD-CR>)
		      (T
		       <GONE-NOW ,JWOMAN>)>
		<RFATAL>)>
	 <FSET ,JWOMAN ,TOUCHBIT>
	 <COND (<NOT <VERB? EXAMINE SEARCH>>
		<TELL "You begin to ">
		<COND (<AND <PRSO? ,JWOMAN>
		     	    <IN-TBL? ,PRSA ,TALKVERBS ,NTVERBS>>
		       <TELL "address" T ,JWOMAN
			     ", but suddenly fall silent">)
		      (T
		       <TELL "approach" T ,JWOMAN
			     ", but stop in your tracks">)>
		<TELL ,PERIOD-CR CR>)>
	 <TELL "Her face is wrong.|
|
You look a little closer and shudder to " D ,ME ". The "
"entire left side of her head is scarred with deep red lesions, twisting her oriental features into a hideous mask. She must have been in an accident or something" ,PERIOD-CR>
	 <DEQUEUE I-BLOW>
	 <I-BLOW>
	 <PCLEAR>
	 <RFATAL>>
	        
"*** BIRD WOMAN ***"

<OBJECT BWOMAN
	(IN BROAD-WALK)
	(DESC "bird woman")
	(FDESC "")
	(FLAGS NDESCBIT ACTORBIT FEMALEBIT)
	(SYNONYM WOMAN LADY)
	(ADJECTIVE BIRD OLD)
	(ACTION BWOMAN-F)>

"NDESCBIT = unseen, SEEN = just referenced."
	      
<ROUTINE DIN-DROWNS ()
	 <TELL "The din of ">
	 <COND (<ZERO? ,RAID?>
		<TELL "cooing " D ,PIGEONS>)
	       (T
		<TELL D ,SIRENS>)>
	 <TELL " drowns out your words" ,PERIOD-CR>
	 <RTRUE>>

<ROUTINE BWOMAN-F ("OPTIONAL" (CONTEXT <>) "AUX" (Y <>) CNT TBL X)
	 <COND (<EQUAL? ,WINNER ,BWOMAN>
		<COND (<T? ,RAID?>
		       <DIN-DROWNS>
		       <RTRUE>)
		      (<VERB? ASK-ABOUT>
		       <COND (<PRSO? ME>
		       	      <TELL "\"Why not tell me about "
			     	    T ,PRSI " " D ,ME "?\" scoffs" 
		                    TR ,BWOMAN>
		              <RTRUE>)>
		       <BWOMAN-SNORTS>
		       ;<PCLEAR>
		       <RTRUE>)
		      (<AND <VERB? TELL-ABOUT>
			    <PRSO? ,ME>>
		       <ASK-BWOMAN-ABOUT ,PRSI>
		       <RTRUE>) 
		      (<VERB? WHAT WHERE>
		       <ASK-BWOMAN-ABOUT ,PRSO>
		       ;<PCLEAR>
		       <RTRUE>)
		      (<AND <VERB? SGIVE SSHOW>
			    <PRSI? GBAG>>
		       <COND (<PRSO? ME>
			      <NOT-A-FARTHING>
			      <RTRUE>)>
		       <BWOMAN-SNORTS>
		       <RTRUE>)
		      (<AND <VERB? GIVE SHOW>
			    <PRSO? GBAG>>
		       <COND (<PRSI? ME>
			      <NOT-A-FARTHING>
			      <RTRUE>)>
		       <BWOMAN-SNORTS>
		       <RTRUE>)>
		<DIN-DROWNS>
		<RTRUE>)
	       (<PRSI? ,BWOMAN>
		<COND (<VERB? THROW>
		       <BAD-COO>
		       <RTRUE>)
		      (<VERB? GIVE SHOW>
		       <FSET ,BWOMAN ,SEEN>
		       <COND (<T? ,RAID?>
			      <TELL 
"She's too frightened to respond" ,PERIOD-CR>
			      <RTRUE>)
			     (<AND <PRSO? COIN>
				   <NOT <FSET? ,COIN ,MUNGBIT>>>
			      ;<REMOVE ,COIN>
			      <MOVE ,GBAG ,LOCAL-GLOBALS>
			      ;<FCLEAR ,COIN ,TAKEBIT>
			      <FSET ,COIN ,MUNGBIT>
			      <FSET ,COIN ,SCOREDBIT>
			      <PUTP ,COIN ,P?SDESC "small coin">
			      <MOVE ,COIN ,BWOMAN>
			      <SETG P-IT-OBJECT ,COIN>
			      <MOVE ,BAG ,BWOMAN>
			      <TELL "\"Bless yer,\" coos" T ,BWOMAN
", taking your money with a practiced snatch. \"Twenty p's the change.\" She holds out a " 
D ,BAG " and a " D ,COIN " for you" ,PERIOD-CR>
			      <UPDATE-SCORE 2>
			      <RTRUE>)
			     (<PRSO? COIN>    ;"MUNGED = SMALL COIN."
			      <NOT-A-FARTHING>
			      <RTRUE>)
			     (<PRSO? CREDIT-CARD>
			      <TELL
"\"I ain't Harrod's, dearie. Thirty p.\"" CR>
			      <RTRUE>)
			     (<VERB? SHOW>
			      <RFALSE>)>
		       <TELL CT ,PRSI 
" shakes her head. \"Keep it, dearie.\"" CR>
		      <RTRUE>)>
		<RFALSE>)
	       (<VERB? EXAMINE>
		<COND (<ZERO? ,RAID?>
		       <TELL 
"You get the feeling that she's been selling crumbs on this same bench, year after year, since well before you were born. Her face is lined with care for her feathered charges, who perch on her round shoulders without fear" ,PERIOD-CR>
		       <RTRUE>)>
		<TELL
"She's obviously terrified by all the sirens and commotion" ,PERIOD-CR>
		<RTRUE>)
	       (<VERB? ASK-ABOUT>
		<ASK-BWOMAN-ABOUT ,PRSI>
		<RTRUE>)
	       (<VERB? ASK-FOR>
		<COND (<T? ,RAID?>
		       <DIN-DROWNS>
		       <RTRUE>)>
		<FSET ,BWOMAN ,SEEN>
		<COND (<PRSI? GBAG BAG>
		       <TELL "\"A rare bargain at thirty p.\"" CR>
		       <RTRUE>)
		      (<FSET? ,PRSI ,TAKEBIT>
		       <TELL "\"I ain't got no " D ,PRSI ", ducky.\"" CR>
		       <RTRUE>)>
		<TELL "\"I couldn't give you that!\" laughs the "
		       D ,PRSO ,PERIOD-CR>
		<RTRUE>)
	       (<IN-TBL? ,PRSA ,HURTVERBS ,NHVERBS>
		<BAD-COO>
		<RTRUE>)>>

<ROUTINE BAD-COO ()
	 <TELL 
"A threatening coo from the pigeons changes your mind" ,PERIOD-CR>>

<ROUTINE NOT-A-FARTHING ()
	 <TELL "\"Thirty p, not a farthing less.\"" CR>
	 <RTRUE>>

<ROUTINE BWOMAN-SNORTS ("AUX" (Q <>))
	 <FSET ,BWOMAN ,SEEN>
	 <COND (<PROB 50>
		<SET Q T>
		<TELL CT ,BWOMAN " snorts ruefully. ">)>
	 <TELL "\"You're daft!\"">
	 <COND (<OR <T? .Q>
		    <PROB 50>>
		<CRLF>
		<RTRUE>)>
	 <TELL " snorts" TR ,BWOMAN>
	 <RTRUE>>

<ROUTINE ASK-BWOMAN-ABOUT (OBJ "AUX" (Q <>) CNT TBL X V)
	 <FSET ,BWOMAN ,SEEN>
	 
       ;"Check list of interesting subjects."
	 
	 <SET V <VISIBLE? .OBJ>>
	 <SET CNT <GET ,BWOMAN-SUBJECTS 0>>
	 <REPEAT ()
		 <SET TBL <GET ,BWOMAN-SUBJECTS .CNT>>
		 <SET X <GET .TBL 0>>
		 <COND (<EQUAL? .X .OBJ>
			<COND (<AND <ZERO? .V>
				    <FSET? .OBJ ,TAKEBIT>>
			       T)
			      (T
			       ;<FSET .OBJ ,TOLD>
			       <TELL "\"" <GET .TBL 1>>
			       <COND (<PROB 50>
			       	      <TELL ".\"" CR>
			       	      <RTRUE>)>
			       <TELL ",\" replies" TR ,BWOMAN>
		               <RTRUE>)>)>
		 <COND (<DLESS? CNT 1>
			<RETURN>)>>
	 
       ; "Default for other items she might know about."

	 <COND (<EQUAL? .OBJ ,WRISTWATCH>
		<TELL CT ,BWOMAN>
		<COND (<NOUN-USED ,WRISTWATCH ,W?TIME>
		       <TELL " sighs. \"Time.\"" CR>
		       <RTRUE>)>
		<TELL " sniffs. \"Looks cheap.\"" CR>
		<RTRUE>)
	       (<EQUAL? .OBJ ,CRANE>
		<TELL "\"">
		<COND (<FSET? ,CRANE ,MUNGBIT>
		       <TELL "Looks a bit ragged to me">)
		      (T
		       <TELL "Tidy bit o' foldin', that">)>
		<TELL ".\"" CR>
		<RTRUE>) 
       	       (<EQUAL? .OBJ ,RUBY>
		;<FSET .OBJ ,TOLD>
		<TELL CT ,BWOMAN>
		<COND (<EQUAL? ,RUBYROOM ,BROAD-WALK>
		       <TELL 
" gives you a sad smile. \"Not to worry, dear,\" she sighs. \"Ye'll get it back by and by.\"" CR>
		       <RTRUE>)>
		<TELL 
" peers at you closely. \"'Ave ye seen one?\" she whispers. \"Wouldn't let it out o' my sight if I was you.\"" CR>
		<RTRUE>)
	       (<EQUAL? .OBJ ,MEEP>
		;<FSET .OBJ ,TOLD>
		<TELL CT ,BWOMAN>
		<COND (<EQUAL? ,RUBYROOM ,BROAD-WALK>
		       <TELL " giggles. \"Fast, ain't he?\"" CR>
		       <RTRUE>)>
		<TELL 
" gives you a sharp look, but doesn't reply" ,PERIOD-CR>
		<RTRUE>)
	       (<OR <T? .V>
		    <IN? .OBJ ,GLOBAL-OBJECTS>
		    <GLOBAL-IN? .OBJ ,BROAD-WALK>>
		;<FSET .OBJ ,TOLD>
		<COND (<PROB 50>
		       <SET Q T>
		       <TELL CT ,BWOMAN " shrugs. ">)>
	 	<TELL "\"">
		<COND (<PROB 50>
		       <TELL "You know as much as I do">)
		      (T
		       <TELL "Don't know nothin' you don't">)>
		<COND (<PROB 50>
		       <TELL ", hon">)>
		<COND (<OR <T? .Q>
		    	   <PROB 50>>
		       <TELL ".\"" CR>
		       <RTRUE>)>
	 	<TELL ",\" shrugs" TR ,BWOMAN>
		<RTRUE>)>
	 
       ; "Default for all other cases."
	 
	 <COND (<PROB 50>
		<SET Q T>
		<TELL CT ,BWOMAN " scowls. ">)>
	 <TELL "\"Don't know what you're talkin' 'bout, ducky">
	 <COND (<OR <T? .Q>
		    <PROB 50>>
		<TELL ".\"" CR>
		<RTRUE>)>
	 <TELL ",\" scowls" TR ,BWOMAN>
	 <RTRUE>>	 

<GLOBAL BWOMAN-SUBJECTS
	<PLTABLE
      	 ;<PTABLE BALL
"Football! Sorry, hon, I'm too old to play">
	 <PTABLE GRPOND
"It's just east o' here">
	 <PTABLE LWATER
"A short walk east">
	 ;<PTABLE VICTORIA
"Princess Louise carved it all herself, she did">
	 <PTABLE GBAG
"Lovely bread crumbs, only thirty p a bag">
	 <PTABLE BAG
"Lovely bread crumbs, only thirty p a bag">
	 ;<PTABLE GNOMON
"A lovely bit o' metal! And so useful. Hold onto it, ducky">
	 <PTABLE PIGEONS
"'Ave ye ever seen such beauties? So loyal. And so, so hungry">
	 ;<PTABLE SCOIN
"That's yer change, ducky. Twenty p out of fifty">
	 <PTABLE CREDIT-CARD
"I ain't Harrod's, dearie. Thirty p">
	 ;<PTABLE PRAM
"All prams lead to Kensington Gardens, they say">
	 ;<PTABLE BOY
"Lots o' boys around here, dearie">
	 ;<PTABLE GRASS
"Humph!\" she sniffs. \"Never touch the stuff">
	 <PTABLE PARASOL
"Ain't seen one like it in a long while">
	 ;<PTABLE MEMORIAL
"Ghastly, ain't he? Everyone laughs">
	 <PTABLE BWOMAN
"Me?\" The woman laughs and gestures at the pigeons. \"Here's all there is to know about me">>> 

<OBJECT BOY
	(IN AT-TERRACE)
	(DESC "boy")
	(FLAGS ACTORBIT TRYTAKEBIT NOALL)
	(SYNONYM BOY CHILD KID)
	(ADJECTIVE YOUNG)
	(DESCFCN DESCRIBE-BOY)
	;(GENERIC GENERIC-KID-F)
	(ACTION BOY-F)>
	 
;<ROUTINE GENERIC-KID-F (TBL)
	 <COND (<FSET? ,HERE ,WINDY>
		<RETURN ,BOY>)
	       (<EQUAL? ,W?BOY ,P-NAM ,P-XNAM>
		<RETURN ,GIANT>)
	       (T
		<RFALSE>)>>

;"SEEN = Pope quote shown, CHILLY = gone."

<ROUTINE DESCRIBE-BOY ("OPTIONAL" (CONTEXT <>))
	 <COND (.CONTEXT
		<COND (<EQUAL? .CONTEXT ,M-OBJDESC?>
		       <RTRUE>)>
		<TELL CR 
"A young boy sits nearby, listening to a pair of " D ,PHONES
" and idly blowing " D ,SBUBBLE "s. There's a dish full of soapy water
by his side.">)>>

<ROUTINE BOY-F ("OPTIONAL" (CONTEXT <>))
	 <COND (<FSET? ,BOY ,CHILLY>
		<GONE-NOW ,BOY>
		<RFATAL>) 
	       (<PRSI? ,BOY>
		<COND (<VERB? GIVE SHOW FEED>
		       <TELL			
"The boy is too preoccupied with his music to notice your offer" ,PERIOD-CR>
		       <RTRUE>)>
		<RFALSE>)
	       (<AND <VERB? FOLLOW WHERE>
		     <FSET? ,PRSO ,CHILLY>>
		<TELL "You'd never find him in this crowd" ,PERIOD-CR>
		<RTRUE>)
	       (<VERB? EXAMINE>
		<I-BOY <>>
		<RTRUE>)
               (<VERB? WAVE YELL>
		<TELL CT ,PRSO " does his best to ignore you" ,PERIOD-CR>
		<RTRUE>)
	       (<VERB? LISTEN>
		<HEAR-GIANT-MUSIC>
		<RTRUE>)
	       (<VERB? ALARM TOUCH KICK KNOCK KISS KILL MUNG
		       MOVE PUSH RAISE TAKE SHAKE>
		<ANNOY-BOY>
		<RTRUE>)
	       (<IN-TBL? ,PRSA ,TALKVERBS ,NTVERBS>
		<TELL 
CT ,BOY " doesn't respond, as if he can't hear you" ,PERIOD-CR>
		<PCLEAR>
		<RFATAL>)
	       (T
		<RFALSE>)>>
								        
<ROUTINE HEAR-GIANT-MUSIC ()
	 <TELL 
"You hear faint, rhythmic music coming from" TR ,PHONES>
	 <RTRUE>>

;<ROUTINE RAPE-SCOUT ()
	 <TELL 
"There's a name for people who do things like that to boys" ,PERIOD-CR>
	 <RTRUE>>

"*** ROADRUNNER ***"

<ROUTINE GENERIC-BIRD-F (TBL "AUX" (PTR 6) OBJ)
	 <COND (<OR <EQUAL? ,W?ROADRU ,P-NAM ,P-XNAM>
		    <EQUAL? ,W?BIRD ,P-NAM ,P-XNAM>>
		<RETURN ,MEEP>)>
	 <REPEAT ()
		 <SET OBJ <GET ,ALLBIRDS .PTR>>
		 <COND (<OR <EQUAL? ,P-IT-OBJECT .OBJ>
			    <VISIBLE? .OBJ>>
			<RETURN>)
		       (<DLESS? PTR 0>
			<RFALSE>)>>
	 <RETURN .OBJ>> 
      
<GLOBAL ALLBIRDS
	<PTABLE CRANE MEEP ;POND-BIRDS PIGEONS>>

<OBJECT MEEP
	;(IN GLOBAL-OBJECTS)
	(DESC "roadrunner")
	(FLAGS NDESCBIT TRYTAKEBIT ACTORBIT NOALL)
	(SYNONYM BIRD ROADRU RUNNER)
	(ADJECTIVE ROAD)
	(GENERIC GENERIC-BIRD-F)
	(ACTION MEEP-F)>

<ROUTINE MEEP-F ()
	 <COND (<VERB? FIND FOLLOW WHERE>
		<TELL
"You've no idea where" T ,MEEP " is now." CR>)
	       (T
		<TELL
CT ,MEEP " is gone now." CR>)>>

<OBJECT TRINITY-PATH
	(IN GLOBAL-OBJECTS)
	(DESC "path")
	(FLAGS NDESCBIT TRYTAKEBIT NOALL)
	(SYNONYM PATH PATHS TRAIL TRAILS)
	(GENERIC GENERIC-WALK-F)
	(ACTION TRINITY-PATH-F)>

<ROUTINE TRINITY-PATH-F ()
	 <COND (<NOT <EQUAL? ,GAME-FLAG 3>>
		<CANT-SEE-ANY ,TRINITY-PATH>
		<RTRUE>)
	       (<VERB? LOOK-DOWN LOOK-UP LOOK-BEHIND>
		<CANT-SEE-MUCH>
		<RTRUE>)
	       (<VERB? EXAMINE SEARCH COUNT>
		<V-LOOK>
		<RTRUE>)
	       (<OR <ENTERING?>
		    <EXITING?>
		    <VERB? FOLLOW CROSS STAND-ON CLIMB-OVER CLIMB-UP
			   CLIMB-DOWN TAKE USE>>
		<V-WALK-AROUND>
		<RTRUE>)
	       (<IN-TBL? ,PRSA ,PUTVERBS ,NUMPUTS>
		<PERFORM ,V?DROP ,PRSO>
		<RTRUE>)
	       (T
		<RFALSE>)>>		       

<OBJECT SKY
	(IN GLOBAL-OBJECTS)
	(DESC "sky")
	(FLAGS NDESCBIT)
	(SYNONYM SKY CLOUD CLOUDS AIR)
	(ACTION SKY-F)>

<ROUTINE SKY-F ()
	 <COND (<INDOORS?>
		<CANT-SEE-FROM-HERE ,SKY>
		<RFATAL>)
	       ;(<EQUAL? ,HERE IN-ORBIT ON-SAT>
		<COND (<STARS-F>
		       <RTRUE>)>
		<RFALSE>)>
	 <COND (<VERB? EXAMINE LOOK-INSIDE SEARCH>
		<TELL CT ,SKY " is ">
		<TELL "bright with sunshine" ,PERIOD-CR>
		<RTRUE>)
	       (<OR <TOUCHING? ,PRSO>
		    <ENTERING?>>
		<IMPOSSIBLES>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<OBJECT GARDENS
	(IN GLOBAL-OBJECTS)
	(DESC "Kensington Gardens")
	(FLAGS NDESCBIT NARTICLEBIT)
	(SYNONYM GARDEN GARDEN)
	(ADJECTIVE KENSIN)
	(ACTION GARDENS-F)>

<ROUTINE GARDENS-F ()
	 <COND (<NOT <EQUAL? ,GAME-FLAG 3>>
		<CANT-SEE-ANY ,GARDENS>
	        <RTRUE>) 
	       (<VERB? EXAMINE LOOK-INSIDE SEARCH LOOK>
		<V-LOOK>
		<RTRUE>)
	       (<ENTERING?>
		<ALREADY-IN>
		<RTRUE>)
	       (<EXITING?>
		<COND (<EQUAL? ,HERE ,LION-GATE ,LAN-GATE ,PAL-GATE 
					,AT-TERRACE>
		       <DO-WALK ,P?OUT>
		       <RTRUE>)>
		<V-WALK-AROUND>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<OBJECT WRISTWATCH
	(IN LOCAL-GLOBALS)
	(DESC "wristwatch")
	(SYNONYM WRISTWATCH WATCH CLOCK TIME)
	(ADJECTIVE WRIST MY DIGITAL)
	(FLAGS TAKEBIT ;WEARBIT WORNBIT CHILLY)
	(SIZE 1)
	;(GENERIC GENERIC-CLOCK-F)
	(ACTION WRISTWATCH-F)>

<ROUTINE WRISTWATCH-F ()
	 <COND (<NOT <VISIBLE? ,WRISTWATCH>>
		<TELL ,YOU-CANT "see your " D ,WRISTWATCH " anywhere." CR>
		<RFATAL>)
	       ;(<PRSI? ,WRISTWATCH>
		<COND (<IN-TBL? ,PRSA ,PUTVERBS ,NUMPUTS>
		       <PRSO-SLIDES-OFF-PRSI>
		       <RTRUE>)>
		<RFALSE>)
	       (<VERB? READ EXAMINE USE>
		<TELL "Your " D ,WRISTWATCH>
		<TELL-TIME>
		<RTRUE>)
	       (<VERB? OPEN SET>
		<TELL "You forgot how to operate your electronic " D ,PRSO
	       " long ago" ,PERIOD-CR>
		<RTRUE>)
	       ;(<VERB? SET>
		<COND (<PRSI? INTNUM INTDIR>
		       <FORGOT-HOW>
		       <RTRUE>)>
		<IMPOSSIBLES>
		<RTRUE>)
	       ;(<VERB? CLOSE>
		<ITS-ALREADY "closed">
		<RTRUE>)>>
		     		       
<OBJECT COIN
	(IN LOCAL-GLOBALS)
	(SDESC "")
	(SIZE 0)
	(FLAGS TAKEBIT)
	(SYNONYM COIN P PENCE MONEY)
	(ADJECTIVE SEVEN SIDED FIFTY TWENTY CHANGE) 
	(ACTION COIN-F)>

;"MUNGBIT = 20P COIN (FORMERLY SCOIN)  SCOREDBIT = LAYAWAY DECing"

<ROUTINE COIN-F ("AUX" STR)
	 <COND (<FSET? ,COIN ,MUNGBIT>
		<SET STR "twenty">)
	       (T
		<SET STR "fifty">)>
	 <COND (<AND <VERB? TAKE>
		     <FSET? ,COIN ,SCOREDBIT>>
		<SETG LAYAWAY 3>
		<FCLEAR ,COIN ,SCOREDBIT>
		<RFALSE>) 
	       (<VERB? EXAMINE READ>
		<TELL "It's standard British currency, worth " .STR " pence">
		<PRINT ,PERIOD-CR>)
	       ;(<AND <VERB? SET>
		     <EQUAL? ,PRSI <> ,HANDS>
		     <EQUAL? ,P-PRSA-WORD ,W?FLIP>>
		<COND (<DONT-HAVE? ,PRSO>
		       <RTRUE>)
		      (<PROB 50>
		       <TELL "Heads" ,PERIOD-CR>
		       <RTRUE>)>
		<TELL "Tails" ,PERIOD-CR>
		<RTRUE>)>>

<OBJECT CREDIT-CARD
	(IN LOCAL-GLOBALS)
	(DESC "credit card")
	(FLAGS TAKEBIT)
	(SIZE 0)
	;(MASS 0)
	(SYNONYM CARD CODES)
	(ADJECTIVE CREDIT CHARGE)
	(ACTION CREDIT-CARD-F)>

 <ROUTINE CREDIT-CARD-F ()
	 <COND (<VERB? EXAMINE READ>
		<TELL 
CT ,PRSO " is embossed with the usual codes. It expires tomorrow" ,PERIOD-CR>)>>

<OBJECT PIGEONS
	(IN LOCAL-GLOBALS)
	(DESC "birds")
	(FLAGS NDESCBIT PLURALBIT TRYTAKEBIT)
	(SYNONYM PIGEON BIRDS BIRD SWAN)
	(ADJECTIVE STARVI HUNGRY SWANS DUCK DUCKS MALLAR)
	(GENERIC GENERIC-BIRD-F)
	(ACTION PIGEONS-F)>

<CONSTANT PIGEON 1>
<CONSTANT DUCK 2>
<CONSTANT MALLARD 3>

<ROUTINE WHICH-BIRD ()
	 <COND (<EQUAL? ,HERE ,IN-WATER ,LWATER>
		<RETURN ,MALLARD>)
	       (<AND <EQUAL? ,HERE ,ROUND-POND>
		<NOT <NOUN-USED ,PIGEONS ,W?PIGEON>>>
		<RETURN ,DUCK>)
	       (T
		<RETURN ,PIGEON>)>>

<ROUTINE PIGEONS-F ()
	 <COND (<VERB? EXAMINE>
		<TELL CT ,PRSO " stare back at you hungrily" ,PERIOD-CR>
		<RTRUE>)
	       (<FEED-THE-BIRDS?>
		<RTRUE>)	       
	       (<VERB? LISTEN>
		<TELL CT ,PRSO " ">
		<COND (<EQUAL? <WHICH-BIRD> ,PIGEON>
		       <TELL "coo">)
		      (T
		       <TELL "honk">)>
		<TELL " incessantly" ,PERIOD-CR>)
	       (<AND <IN-TBL? ,PRSA ,TALKVERBS ,NTVERBS>
		     <EQUAL? ,WINNER ,PIGEONS>>
		<TELL CT ,PIGEONS " ">
		<COND (<EQUAL? <WHICH-BIRD> ,PIGEON>
		       <TELL "coo">)
		      (T
		       <TELL "honk">)>
		<TELL " in reply" ,PERIOD-CR>
		<PCLEAR>
		<RFATAL>)
	       (<OR <TOUCHING? ,PRSO>
		    <ENTERING?>>
		<TELL CT ,PIGEONS " deftly avoid you" ,PERIOD-CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE FEED-THE-BIRDS? ()
	 <COND (<NOT ,PRSI>
		<COND (<ULTIMATELY-IN? ,BAG ,PROTAGONIST>
		       <PERFORM-PRSA ,BAG ,PIGEONS>)>)
	       (<PRSO? ,PIGEONS>
		<RFALSE>)
	       (<VERB? GIVE FEED>
		<COND (<PRSO? BAG>
		       <TAKE-CRUMBS>
		       <RTRUE>)
		      (T
		       <NOT-LIKELY ,PRSI
			"would be impressed by your offer">)>
		<RTRUE>)
	       (<AND <VERB? THROW>
		     <PRSO? BAG>
		     <T? ,CCNT>>
		<TAKE-CRUMBS>
		<RTRUE>)
	       (<VERB? SHOW>
		<TELL CT ,PRSO>
		<COND (<PRSO? BAG>
		       <COND (<EQUAL? <WHICH-BIRD> ,PIGEON>
			      <TELL " strut">)
			     (T
			      <TELL " swim">)>
		       <TELL " about excitedly at the sight of ">)
		      (T
		       <TELL " don't seem to care about ">)>
		<TELL TR ,PRSO>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<OBJECT FLWALK
	(IN GLOBAL-OBJECTS)
	(DESC "Flower Walk")
	(FLAGS NDESCBIT)
	(SYNONYM WALK PATH)
	(ADJECTIVE FLOWER)
	(GENERIC GENERIC-WALK-F)
	(ACTION FLWALK-F)>

<ROUTINE FLWALK-F ()
	 <COND (<NOT <EQUAL? ,HERE ,PAL-GATE ,FLOWER-WALK>>
		<CANT-SEE-ANY>
		<RFATAL>)
	       ;(<HANDLE-PLACE? ,FLOWER-WALK <> <> <> ,PAL-GATE>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<OBJECT PGATE
	(IN PAL-GATE)
	(DESC "Palace Gate")
	(FLAGS NDESCBIT)
	(SYNONYM GATE)
	(ADJECTIVE PALACE)
	;(GENERIC GENERIC-GATE-F)
	(ACTION PGATE-F)>

<ROUTINE PGATE-F ()
	 <COND (<HANDLE-GATES?>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<OBJECT BLGATE
	(IN LION-GATE)
	(DESC "Black Lion Gate")
	(FLAGS NDESCBIT)
	(SYNONYM GATE)
	(ADJECTIVE BLACK LION)
	;(GENERIC GENERIC-GATE-F)
	(ACTION BLGATE-F)>

<ROUTINE BLGATE-F ()
	 <COND (<HANDLE-GATES?>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<OBJECT LGATE
	(IN LAN-GATE)
	(DESC "Lancaster Gate")
	(FLAGS NDESCBIT)
	(SYNONYM GATE)
	(ADJECTIVE LANCASTER)
	;(GENERIC GENERIC-GATE-F)
	(ACTION LGATE-F)>

<ROUTINE LGATE-F ()
	 <COND (<HANDLE-GATES?>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE HANDLE-GATES? ()
	 <COND (<OR <PRSI? ,PGATE>
		    <PRSI? ,LGATE>
		    <PRSI? ,BLGATE>>
		<RFALSE>)
	       (<OR <ENTERING?>
		    <EXITING?>
		    <VERB? CROSS>>
		<DO-WALK ,P?OUT>
		<RTRUE>)
	       (<VERB? CLIMB-OVER CLIMB-ON CLIMB-UP LEAP>
		<TOURISTS-SNICKER>
		<RTRUE>)
	       (<VERB? OPEN>
		<ITS-ALREADY "open">
		<RTRUE>)
	       (<VERB? LOOK-INSIDE>
		<V-LOOK>
		<RTRUE>)
	       (<VERB? EXAMINE LOOK-INSIDE>
		<DESCRIBE-GATE>
		<RTRUE>)
	       (<VERB? CLOSE>
		<TELL ,YOU-CANT "do that. ">
		<DESCRIBE-GATE>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE DESCRIBE-GATE ()
	 <TELL "The gate is swarming with ">
	 <SAY-TOURISTS>
	 <TELL ,PERIOD-CR>
	 <RTRUE>>

<ROUTINE TOURISTS-SNICKER ()
	 <TELL "Passersby ">
	 <COND (<ZERO? ,RAID?>
		<TELL "snicker at">)
	       (T
		<TELL "ignore">)>
	 <TELL " your hopeless attempt" ,PERIOD-CR>
	 <RTRUE>>

<OBJECT IFENCE
	(IN LOCAL-GLOBALS)
	(DESC "iron fence")
	(FLAGS NDESCBIT VOWELBIT)
	(SYNONYM FENCE)
	(ADJECTIVE IRON METAL)
	(ACTION IFENCE-F)>

<ROUTINE IFENCE-F ()
	 <COND (<PRSI? ,IFENCE>
		;<COND (<VERB? THROW-OVER>
		       <WASTES>
		       <RTRUE>)>
		<RFALSE>)
	       (<VERB? EXAMINE>
		<TELL CT ,PRSO " is quite high" ,PERIOD-CR>
		<RTRUE>)
	       (<VERB? LOOK-INSIDE LOOK-BEHIND>
		<CANT-SEE-MUCH>
		<RTRUE>)
	       (<VERB? CLIMB-OVER CLIMB-ON LEAP ENTER>
		<TOURISTS-SNICKER>
		<RTRUE>)
	       (<EXITING?>
		<NOT-IN>
		<RTRUE>)
	       (T
		<RFALSE>)>>
		
<OBJECT LNWALK
	(IN GLOBAL-OBJECTS)
	(DESC "Lancaster Walk")
	(FLAGS NDESCBIT)
	(SYNONYM WALK)
	(ADJECTIVE LANCASTER)
	(GENERIC GENERIC-WALK-F)
	(ACTION LNWALK-F)>

<ROUTINE GENERIC-WALK-F (TBL)
	 <COND (<EQUAL? ,P-IT-OBJECT ,FLWALK ,LNWALK ,BWALK>
		<RETURN ,P-IT-OBJECT>)
	       (<EQUAL? ,HERE ,LAN-WALK ,LAN-GATE>
		<RETURN ,LNWALK>)
	       (<EQUAL? ,HERE ,FLOWER-WALK>
		<RETURN ,FLWALK>)
	       (<EQUAL? ,HERE ,BROAD-WALK ,PAL-GATE ,LION-GATE>
		<RETURN ,BWALK>)
	       (T
		<RETURN ,TRINITY-PATH>)>>	

<ROUTINE LNWALK-F ()
	 <COND (<NOT <EQUAL? ,HERE ,LAN-WALK ,LAN-GATE ,FLOWER-WALK 
				,ROUND-POND>>
		<CANT-SEE-ANY>
		<RFATAL>)
	       ;(<HANDLE-PLACE? ,LAN-WALK ,LAN-GATE ,LONG-WATER ,FLOWER-WALK
			       ,ROUND-POND>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<OBJECT TERRACE
	(IN GLOBAL-OBJECTS)
	(DESC "Inverness Terrace")
	(FLAGS NDESCBIT VOWELBIT)
	(SYNONYM TERRACE)
	(ADJECTIVE INVERNESS)
	(ACTION TERRACE-F)>

<ROUTINE TERRACE-F ()
	 <COND (<NOT <EQUAL? ,HERE ,AT-TERRACE>>
		<CANT-SEE-ANY>
		<RFATAL>)
	       ;(<HERE-F>
		<RTRUE>)
	       (T
		<RFALSE>)>>
	  
<OBJECT LWATER
	(IN GLOBAL-OBJECTS)
	(DESC "Long Water")
	(FLAGS NDESCBIT SURFACEBIT CONTBIT OPENBIT)
	(SYNONYM WATER LAKE RIVER)
	(ADJECTIVE LONG SERPENTINE)
	(CAPACITY 100)
	(GENERIC TRINITY-WATER-F)
	(ACTION LWATER-F)>
		
<ROUTINE TRINITY-WATER-F (TBL)
	 <COND (<EQUAL? ,P-IT-OBJECT ,RPOND ,GRPOND ,LWATER>		    
		<RETURN ,P-IT-OBJECT>)
	       (<EQUAL? ,HERE ,ROUND-POND>
		<RETURN ,RPOND>)
	       (<OR <EQUAL? ,HERE ,LAN-WALK LONG-WATER IN-WATER>
		    <EQUAL? ,W?LONG ,P-ADJ ,P-XADJ>>
		<RETURN ,LWATER>)
	       (<OR <EQUAL? ,HERE ,BROAD-WALK>
		    <EQUAL? ,W?ROUND ,P-ADJ ,P-XADJ>>
		<RETURN ,GRPOND>)
	       (T
		<REFERRING>
		<RETURN ,NOT-HERE-OBJECT>)>>	       

<ROUTINE LWATER-F ()
	 <COND ;(<NOT <EQUAL? ,GAME-FLAG 3>>
		<CANT-SEE-ANY ,LWATER>)
	       (<VERB? FIND>
		<COND (<EQUAL? ,HERE ,LONG-WATER ,IN-WATER>
		       <ITS-RIGHT-HERE>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,LAN-WALK>
		       <SEE-IT-SPARKLE>
		       <RTRUE>)>
		<V-WALK-AROUND>
		<RTRUE>)
	       (<NOT <EQUAL? ,HERE ,LAN-WALK ,IN-WATER ,LONG-WATER>>
		<CANT-SEE-ANY>
		<RFATAL>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,LONG-WATER>
		       <OPAQUE-WATER>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,IN-WATER>
		       <V-LOOK>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,LAN-WALK>
		       <SEE-IT-SPARKLE>
		       <RTRUE>)>
		<CANT-SEE-FROM-HERE ,LWATER>
		<RTRUE>)
	       (<VERB? LOOK-INSIDE LOOK-UNDER SEARCH>
		<COND (<EQUAL? ,HERE ,LONG-WATER ,IN-WATER>
		       <OPAQUE-WATER>
		       <RTRUE>)>
		<CANT-SEE-FROM-HERE ,LWATER>
		<RTRUE>)
	       (<ENTERING?>
		<COND (<EQUAL? ,HERE ,LONG-WATER ,LAN-WALK>
		       <DO-WALK ,P?EAST>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,IN-WATER>
		       <ALREADY-IN>
		       <RTRUE>)>
		<V-WALK-AROUND>
		<RTRUE>)
	       (<EXITING?>
		<COND (<EQUAL? ,HERE ,IN-WATER>
		       <DO-WALK ,P?WEST>
		       <RTRUE>)>
		<NOT-IN>
		<RTRUE>)
	       (<NOT <EQUAL? ,HERE ,LONG-WATER ,IN-WATER>>
		<TELL ,CANT-FROM-HERE>
		<RTRUE>)
	       (<VERB? SWIM LEAP CLIMB-DOWN>
		<DO-WALK <COND (<EQUAL? ,HERE ,LONG-WATER> ,P?EAST)
			       (T ,P?DOWN)>>
		<RTRUE>)
	       (<HANDLE-WATER?>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE SEE-IT-SPARKLE ()
	 <TELL "You can see it sparkling">
	 <TWEEN-TREES <>>
	 <TELL ,TO-E ,PERIOD-CR>
	 <RTRUE>>

<OBJECT GRPOND
	(IN GLOBAL-OBJECTS)
	(DESC "Round Pond")
	(FLAGS NDESCBIT SURFACEBIT OPENBIT CONTBIT)
	(SYNONYM POND WATER)
	(ADJECTIVE ROUND)
	(GENERIC TRINITY-WATER-F)
	(ACTION GRPOND-F)>

<ROUTINE GRPOND-F ()
	 <COND (<NOT <EQUAL? ,GAME-FLAG 3>>
		<CANT-SEE-ANY ,GRPOND>
		<RFATAL>) 
	       (<VERB? FIND>
		<COND (<EQUAL? ,HERE ,BROAD-WALK>
		       <TELL ,YOU-SEE "it" ,TO-E ,PERIOD-CR>
		       <RTRUE>)>
		<V-WALK-AROUND>
		<RTRUE>)
	       (<NOT <EQUAL? ,HERE ,BROAD-WALK ,LAN-WALK ,LAN-GATE ,AT-TERRACE
			    ,LION-GATE ,WABE>>
		<CANT-SEE-ANY>
		<RFATAL>)
	       (<ENTERING?>
		<DO-WALK <COND (<EQUAL? ,HERE ,BROAD-WALK> ,P?EAST)
			       (<EQUAL? ,HERE ,LAN-WALK> ,P?WEST)
			       (<EQUAL? ,HERE ,AT-TERRACE> ,P?SOUTH)
			       (<EQUAL? ,HERE ,WABE> ,P?NORTH)
			       (<EQUAL? ,HERE ,LION-GATE> ,P?SE)
			       (T ,P?SW)>>
		<RTRUE>)
	       (T
		<TELL ,CANT-FROM-HERE>
		<RTRUE>)>>

<OBJECT RPOND
	(IN ROUND-POND)
	(DESC "Round Pond")
	(FLAGS NDESCBIT SURFACEBIT CONTBIT OPENBIT)
	(CAPACITY 100)
	(SYNONYM POND WATER)
	(ADJECTIVE ROUND)
	(GENERIC TRINITY-WATER-F)
	(ACTION RPOND-F)>

<ROUTINE RPOND-F ()
	 <COND (<VERB? EXAMINE>
		<TELL "Ducks and swans paddle between the ">
		<COND (<T? ,RAID?>
		       <TELL "deserted ">)>
		<TELL D ,BOAT " of" TR ,CHILDREN>
		<RTRUE>)
	       (<VERB? EXAMINE LOOK-INSIDE SEARCH>
		<TELL "Aside from the birds and boats, you see">
		<COND (<FIRST? ,PRSO>
		       <TELL A ,CRANE>)
		      (T
		       <TELL " nothing">)>
		<TELL " on" TR ,PRSO>
		<RTRUE>)
	       (<VERB? DRINK DRINK-FROM TASTE>
		<TELL "The sight of a ">
		<COND (<T? ,RAID?>
		       <TELL "frightened ">)>
		<TELL 
"child relieving itself in the pond changes your mind." CR>)
	       (<OR <GETTING-INTO?>
		    <VERB? SWIM>>
		<DO-WALK ,P?IN>
		<RTRUE>)
	       (<HANDLE-WATER?>
		<RTRUE>)
	       (T
		<RFALSE>)>>
	       
<ROUTINE HANDLE-WATER? ()
	 <COND (<OR <PRSI? ,LWATER>
		<PRSI? ,RPOND>>
		<COND (<VERB? TAKE>			   
		       <RFALSE>)
		      (<IN-TBL? ,PRSA ,PUTVERBS ,NUMPUTS>
		       <REMOVE ,PRSO>
		       <TELL CT ,PRSO>
		       <COND (<PRSO? CRANE BALL>
		       	      <TELL " floats away ">)
		      	     (T
		       	      <TELL " disappears ">)>
		       <SAY-IN-WATER>
		       <RTRUE>)
		      (<OR <VERB? FILL>
			   <TOUCHING? ,PRSO>>
		       <SPLASHES>
		       <RTRUE>)>
		<RFALSE>)
	       (<VERB? LOOK-UNDER>
		<OPAQUE-WATER>
		<RTRUE>)
	       (<EXITING?>
		<NOT-IN>
		<RTRUE>)
	       (<VERB? CLOSE OPEN>
		<IMPOSSIBLES>
		<RTRUE>)
	       (<VERB? DRINK DRINK-FROM>
		<TELL CT ,PRSO>
		<ISNT-ARENT>
		<TELL "very clean" ,PERIOD-CR>
		<RTRUE>)
	       (<VERB? EAT BITE>
		<IMPOSSIBLES>
		<RTRUE>)
	       (<TOUCHING? ,PRSO>
		<SPLASHES>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE OPAQUE-WATER ()
	 <TELL "Little can be seen ">
	 <SAY-IN-WATER>
	 <RTRUE>>

<ROUTINE SAY-IN-WATER ()
	 <TELL "in the dark water" ,PERIOD-CR>
	 <RTRUE>>

<OBJECT CRANE
	(SDESC "")
	(FLAGS TAKEBIT READBIT NDESCBIT)
	(SYNONYM PAPER BIRD CRANE WORD)
	(ADJECTIVE FOLDED PAPER ORIGAMI WORDS CRUMPLED PIECE)
	(SIZE 7)
	;(MASS 1)
	(GENERIC GENERIC-BIRD-F)
	(ACTION CRANE-F)>

"NDESCBIT = timing flag, RUNGBIT = crumpled, SEEN = just referenced."

<ROUTINE CRANE-F ()
	 <FSET ,CRANE ,SEEN>
	 <COND (<PRSI? ,CRANE>
		<RFALSE>)
	       (<FSET? ,CRANE ,MUNGBIT>
		<HANDLE-OPEN-CRANE>)
	       (<VERB? REPAIR CLOSE>
		<ITS-ALREADY "folded quite nicely, thank you">
		<RTRUE>)
	       (<VERB? EXAMINE>
		<TELL CT ,PRSO " is ">
		<TELL "skillfully folded from a piece of paper. Something is
written between the folds" ,PERIOD-CR>
		<RTRUE>)
	       (<VERB? READ EXAMINE LOOK-INSIDE SEARCH>
		<YOUD-HAVE-TO "unfold" ,PRSO>
		<RTRUE>)
	       (<VERB? OPEN>
		<COND ;(<AND <VERB?>
			    <NOT <PRSI? HANDS>>>
		       <TELL "You don't need" T ,PRSI
			     " to do that" ,PERIOD-CR>
		       <RTRUE>)
		      (<NOT <IN? ,PRSO ,PROTAGONIST>>
		       <YOUD-HAVE-TO "be holding" ,PRSO>
		       <RTRUE>)
		      ;(<CRANE-LIT?>
		       <RTRUE>)>
		<PUTP ,CRANE ,P?SDESC "piece of paper">
		;<REMOVE ,PRSO>
		;<SETG P-IT-OBJECT ,OCRANE>
		<TELL "You gently ">
		<PRINTB ,P-PRSA-WORD>
		<TELL T ,PRSO " to its full size" ,PERIOD-CR>
		<FSET ,CRANE ,MUNGBIT>
	      ; <STOP-TWINKLE?>
		<RTRUE>)
	       (<VERB? CUT RIP MUNG>
		<TELL "And ruin this lovely paper crane? Unthinkable" ,PERIOD-CR>
		<RTRUE>)
	       (<AND <VERB? TAKE>
		     <NOT <FSET? ,PRSO ,TOUCHBIT>>>
		<COND (<ITAKE>
		       <TELL "You lean over the edge of" T ,RPOND
", and pluck" T ,PRSO " out of" TR ,WATER>
		       ;<UPDATE-SCORE 2>)>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE HANDLE-OPEN-CRANE ()
	 <COND (<VERB? READ EXAMINE LOOK-INSIDE>
		<TELL 
"The words \"Long Water, Four O'Clock\" are scrawled on the " 
D ,PRSO ,PERIOD-CR>
		;<RTRUE>)
	       ;(<VERB? WRAP-AROUND>
	        <COND (<PRSI? PRSO>
		       <EQUAL? <GET ,P-NAMW 1> ,W?BIRD ,W?CRANE ,W?ORIGAMI>
		       <FUMBLE>
		       <RTRUE>)>
		<WASTES>
		<RTRUE>)
	       (<VERB? MUNG KILL CUT RIP KICK SHAKE>
		;<COND (<PRSO? OCRANE>
		       <RUIN-LOVELY-CRANE>
		       <RTRUE>)>
		<WASTES>
		<RTRUE>)
	       (<VERB? OPEN>
		<ITS-ALREADY "unfolded">
		<RTRUE>)
	       (<VERB? REPAIR CLOSE>
		<TELL "Your fumbling attempt to ">
	        <PRINTB ,P-PRSA-WORD>
		<TELL " the paper back into a bird fails" ,PERIOD-CR>)>>

;<OBJECT POND-BIRDS
	(IN ROUND-POND)
	(DESC "wild birds")
	(FLAGS NDESCBIT PLURALBIT)
	(SYNONYM BIRDS BIRD DUCKS DUCK)
	(ADJECTIVE WILD SWAN SWANS)	;"SIGH"
	(GENERIC GENERIC-BIRD-F)
	(ACTION POND-BIRDS-F)>

;<ROUTINE POND-BIRDS-F ()
	 <COND (<VERB? EXAMINE>
		<TELL CT ,PRSO " stare back at you coolly" ,PERIOD-CR>
		<RTRUE>)
	       (<FEED-THE-BIRDS?>
		<RTRUE>)
	       (<VERB? LISTEN>
		<TELL CT ,PRSO " honk incessantly" ,PERIOD-CR>
		<RTRUE>)
	       (<AND <THIS-PRSO?>
		     <IN-TBL? ,PRSA ,TALKVERBS ,NTVERBS>>
		<TELL CT ,POND-BIRDS " honk in reply" ,PERIOD-CR>
		<PCLEAR>
		<RFATAL>)
	       (<TOUCHING? ,PRSO>
		<TELL CT ,POND-BIRDS " paddle out of reach" ,PERIOD-CR>
		<RTRUE>)
	       (T
		<RFALSE>)>> 

<OBJECT BOAT 
	(IN ROUND-POND)
	(DESC "toy boats")
	(FLAGS TRYTAKEBIT NDESCBIT PLURALBIT)
	(SYNONYM BOAT BOATS TOYS)
	(ADJECTIVE TOY)
	(ACTION BOAT-F)>

<ROUTINE BOAT-F ()
	 <COND (<VERB? EXAMINE>
		<TELL CT ,PRSO 
" are crafted of paper and sticks. They bob freely among the swans and
ducks, who can barely conceal their outrage" ,PERIOD-CR>
		<RTRUE>)
	       (<VERB? SWIM WALK-TO FOLLOW SIT LIE-DOWN ENTER>
		<DO-WALK ,P?IN>
		<RTRUE>)
	       (<TOUCHING? ,PRSO>
		<TELL CT ,BOAT " are far out of reach" ,PERIOD-CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>
	 	
<OBJECT DIAL
	(IN WABE)
	(DESC "sundial")
	(FLAGS TRYTAKEBIT SURFACEBIT NOALL)
	(CAPACITY 6)
	(SYNONYM SUNDIAL DIAL FACE SHADOW)
	(ADJECTIVE SUN HANDSOME ANTIQUE GOLDEN)
        (DESCFCN DESCRIBE-DIAL)
	(ACTION DIAL-F)>

"TOUCHBIT = quote given."

<ROUTINE DESCRIBE-DIAL (CONTEXT)
	 <COND (.CONTEXT
		<COND (<EQUAL? .CONTEXT ,M-OBJDESC?>
		       <RTRUE>)>
		<TELL CR 
"A shaft of golden sunlight falls across a handsome antique "
D ,DIAL ", erected at the exact center of" T ,TRINITY-CLEARING ".">)>>
	       
<ROUTINE DIAL-F ("AUX" (G <>) (D ,DIAL))
	 <COND (<AND <IN? ,GNOMON .D>
		     <FSET? ,GNOMON ,NDESCBIT>>
		<SET G T>)>
	 <COND (<NOUN-USED ,DIAL ,W?SHADOW>
		<COND (<ZERO? .G>
		       <TELL ,YOU-CANT "see the shadow now" ,PERIOD-CR>
		       <RFATAL>)
		      (<VERB? EXAMINE READ LOOK-INSIDE SEARCH>
		       <TELL 
"The shadow is creeping slowly towards the first symbol" ,PERIOD-CR>
		       ;<READ-DIAL>
		       ;<PRINT ,PERIOD-CR>
		       <RTRUE>)
		      (<IN-TBL? ,PRSA ,MOVEVERBS ,NMVERBS>
		       <HOW?>
		       <RTRUE>)
		      (<ENTERING?>
		       <V-WALK-AROUND>
		       <RTRUE>)>)>
	 <COND (<PRSI? ,DIAL>
		<RFALSE>)
	       (<VERB? EXAMINE READ>
		<TELL "The perimeter of" T ,PRSO
" is inscribed with seven curious " D ,SYMBOLS
" and a " D ,ROSE ", with the legend \"">
	 	<TELL "TEMPUS EDAX RERUM">
	       	<TELL "\" emblazoned across the bottom. A ">
	 	<COND (<ZERO? .G>
		       <TELL D ,DIAL-HOLE 
			     " is set into the center of the dial">)
	       	      (T
		       <TELL "triangular " D ,GNOMON " casts a fingerlike
shadow that is creeping slowly towards the first symbol">
		       ;<READ-DIAL>)>
	 	;<COND (<SEE-ANYTHING-IN? ,PRSO>
		       <TELL ". You also see ">
		       <DESCRIBE-CONTENTS ,PRSO>
		       <TELL " lying on top">)>
	 	<PRINT ,PERIOD-CR>
	 	;<COND (<NOT <FSET? ,PRSO ,TOUCHBIT>>
		       <FSET ,PRSO ,TOUCHBIT>
		       <DO-QUOTE <COND (<PRSO? DIAL> ,CARROLL)
				       (T ,RIMBAUD)>>
		       <RFATAL>)>
		<RTRUE>)
	       (<VERB? TAKE MOVE PUSH RAISE UNTIE
		       UNSCREW UNSCREW-FROM TAKE-WITH LOOK-UNDER>
		<TELL CT ,PRSO " is firmly set into" T ,GROUND>
      		<TELL ". It cannot be moved" ,PERIOD-CR>
		<RTRUE>)
	       ;(<VERB? LOOK-UNDER LOOK-BEHIND>
		<LOOK-UNDER-DIAL>
		<RTRUE>)
	       (T
		<RFALSE>)>>

;<ROUTINE READ-DIAL ()
	 <COND (<EQUAL? ,HERE ,WABE>
		<TELL " is creeping slowly towards">)>
	 <TELL " the " <GET ,SYMBOL-NAMES ,OSIGN> " symbol">
	 <RTRUE>>

;<GLOBAL SYMBOL-NAMES
	<PTABLE "first" "first" "second" "second"
	        "third" "third" "fourth" "fourth" 
		"fifth" "fifth" "sixth" "sixth"
	        "seventh" "seventh" ; "seventh">>

<OBJECT DIAL-HOLE
	(IN DIAL)
	(DESC "threaded hole")
	(FLAGS NDESCBIT NOALL CONTBIT OPENBIT)
	(CAPACITY 0)
	(SIZE 0)
	(SYNONYM HOLE)
	(ADJECTIVE THREAD)
	(ACTION DIAL-HOLE-F)>

<ROUTINE DIAL-HOLE-F ()
	 <COND (<HANDLE-HOLE? ,DIAL>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE HANDLE-HOLE? (D)
	 <COND (<AND <IN? ,GNOMON .D>
		     <FSET? ,GNOMON ,NDESCBIT>>
		<CANT-SEE-ANY>
		<RFATAL>)
	       (<PRSI? ,DIAL-HOLE>
		<COND (<VERB? PUT SCREW>
		       <COND (<PRSO? GNOMON>
		       	      <PERFORM ,V?SCREW ,GNOMON .D>
		       	      <RTRUE>)>
		       <TELL CT ,PRSO>
	 	       <IS-ARE>
	 	       <TELL "too big to fit in" TR ,PRSI>)
		      (<VERB? PUT-ON>
		       <PERFORM ,V?PUT-ON ,PRSO .D>
		       <RTRUE>)>
		<RFALSE>)
	       (<VERB? EXAMINE LOOK-INSIDE>
		<TELL 
"The hole has a left-handed thread, and is set in the center of the dial"
 ,PERIOD-CR>)
	       (<VERB? REACH-IN>
		<TELL CT ,DIAL-HOLE " is too small" ,PERIOD-CR>
		<RTRUE>)
	       ;(<VERB? COVER>
		<PERFORM ,V?PUT-ON ,PRSO .D>
		<RTRUE>)
	       (<IN-TBL? ,PRSA ,MOVEVERBS ,NMVERBS>
		<IMPOSSIBLES>
		<RTRUE>)>>

<OBJECT ROSE
	(IN LOCAL-GLOBALS)
	(DESC "compass rose")
	(FLAGS NDESCBIT TRYTAKEBIT NOALL READBIT)
	(SYNONYM ROSE HEADIN)
	(ADJECTIVE COMPAS)
	(ACTION ROSE-F)>

<ROUTINE ROSE-F ()
	 <COND (<VERB? EXAMINE READ>
		<TELL CT ,PRSO " on the dial appears quite ordinary">
		<TELL ,PERIOD-CR>
		<RTRUE>)
	       (<HANDLE-GLYPHS?>
		<RTRUE>)
	       (T
		<RFALSE>)>>
			   
<OBJECT SYMBOLS
	(IN LOCAL-GLOBALS)
	(DESC "symbols")
	(FLAGS NDESCBIT TRYTAKEBIT NOALL READBIT PLURALBIT)
	(SYNONYM SYMBOL ALPHA OMEGA)
	(ADJECTIVE SEVEN FIRST SECOND THIRD FOURTH FIFTH SIXTH SEVENT)
	(ACTION SYMBOLS-F)>

;"ONE-SEVEN, LAST, ALPHA-???  removed -- TB"

<ROUTINE SYMBOLS-F ()
	 <COND (<VERB? EXAMINE READ LOOK-INSIDE SEARCH LOOK-UP>
		<TELL "The seven " D ,PRSO 
" are arranged in a circle. The series begins with a Greek omega and runs
clockwise around the dial, ending with a Greek alpha." CR>)
	       (<VERB? COUNT>
		<TELL "There are exactly seven" ,PERIOD-CR>
		<RTRUE>)
	       (<AND <VERB? POINT SET>
		     <PRSI? ,SYMBOLS>>
		<IMPOSSIBLES>
		<RTRUE>)
	       (<HANDLE-GLYPHS?>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE HANDLE-GLYPHS? ()
	 <COND (<PRSI? ,SYMBOLS>
		<COND (<VERB? PUT THROW>
		       ;<COND (<EQUAL? ,HERE ,ON-GNOMON>
		       	      <PERFORM ,PRSA ,PRSO ,BDIAL>
		       	      <RTRUE>)>
		       <PERFORM ,PRSA ,PRSO ,DIAL>
		       <RTRUE>)>
		<RFALSE>)
	       (<IN-TBL? ,PRSA ,MOVEVERBS ,NMVERBS>
		<IMPOSSIBLES>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<OBJECT GNOMON
	(IN DIAL)
	(DESC "gnomon")
	(FLAGS TAKEBIT NOALL NDESCBIT)
	(SYNONYM GNOMON METAL BOLT)
	(ADJECTIVE TRIANG THREAD)
	(SIZE 4)
	;(VALUE 1)
	(ACTION GNOMON-F)>

"NDESCBIT = gnomon screwed into face plate, FEMALEBIT = noticed wobble."

<ROUTINE GNOMON-F ()
	 <COND (<NOUN-USED ,GNOMON ,W?BOLT>
		<COND (<FSET? ,GNOMON ,NDESCBIT>
		       <CANT-SEE-ANY>
		       <RFATAL>)
	       	      (<PRSI? ,GNOMON>
		       <RFALSE>)
		      (<VERB? EXAMINE>
		       <TELL "The bolt has a left-handed thread, and">
		       <ATTACHED-TO>
		       <RTRUE>)
	       	      (<AND <VERB? UNSCREW-FROM>
			    <PRSO? PRSI>>
		       <TELL "The bolt">
		       <ATTACHED-TO>
		       <RTRUE>)
		      (<VERB? TAKE MOVE PUSH RAISE LOWER UNTIE
			      TAKE-OFF SHAKE KILL KICK KNOCK SWING UNSCREW>
		       <TELL "The bolt">
		       <ATTACHED-TO>
		       <RTRUE>)>)>
	 <COND (<PRSI? ,GNOMON>
		<RFALSE>)
	       (<VERB? EXAMINE>
		<TELL 
"It's a triangular piece of metal, about a quarter-inch thick and four inches long">
		<COND (<FSET? ,GNOMON ,NDESCBIT>
		       <TELL ", screwed into the center of" T ,DIAL>)
		      (T
		       <TELL ".A long bolt is welded to the bottom">)>
		<PRINT ,PERIOD-CR>
		<RTRUE>)
	       (<AND <VERB? UNSCREW SET UNSCREW-FROM>
		     <FSET? ,PRSO ,NDESCBIT>>
		<COND (<VERB? UNSCREW-FROM>
		       <COND (<NOT <PRSI? DIAL DIAL-HOLE>>
		       	      <RFALSE>)>)
		      (<NOT <EQUAL? ,PRSI <> ,HANDS>>
		       <NOT-LIKELY ,PRSI "would help you move the gnomon">
		       <RTRUE>)>
		<FSET ,PRSO ,FEMALEBIT>
		<FCLEAR ,PRSO ,NDESCBIT>
		<FCLEAR ,PRSO ,NOALL>
		<TELL 
"You can feel" T ,PRSO " getting more and more wobbly as you turn">
		;<PRINTB ,P-PRSA-WORD>
		<TELL
" it. A final twist, and it falls with a clatter onto the face of the "
D ,DIAL ,PERIOD-CR>
		<RTRUE>)
	       (<AND <VERB? SCREW PUT>
		     <PRSI? ,DIAL>>
		<COND (<IN? ,GNOMON ,DIAL>
		       <PERFORM ,V?UNSCREW ,GNOMON>
		       <RTRUE>)
		      (T
		       <MOVE ,GNOMON ,DIAL>
		       <FSET ,GNOMON ,NDESCBIT>
		       <TELL "You screw the gnomon into the dial." CR>)>)
	       (<AND <VERB? TAKE TOUCH MOVE UNTIE PUSH SHAKE
			    RAISE KNOCK SWING KICK>
		     <FSET? ,PRSO ,NDESCBIT>>
		<FSET ,PRSO ,FEMALEBIT>
		<TELL CT ,PRSO " on the dial wobbles loosely when you ">
		<COND (<VERB? TOUCH PUSH KICK KNOCK SHAKE SWING>
		       <PRINTB ,P-PRSA-WORD>)
		      (T
		       <TELL "try to move">)>
		<TELL " it" ,PERIOD-CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<OBJECT BEDS
	(IN FLOWER-WALK)
	(DESC "flowers")
	(FLAGS NDESCBIT PLURALBIT SURFACEBIT CONTBIT OPENBIT)
	(SYNONYM BEDS BED BLOSSO)
        (ADJECTIVE FLOWER)
	(CAPACITY 50)
	(ACTION BEDS-F)>

<ROUTINE BEDS-F ()
	 <COND (<OR <AND <PRSI? ,BEDS>
		         <IN-TBL? ,PRSA ,PUTVERBS ,NUMPUTS>>
		    <VERB? MUNG KILL KICK SHAKE DIG UNTIE>>
	        <TELL 
"That would make the flower beds appear most untidy" ,PERIOD-CR>)
	       (<PRSI? ,BEDS>
		<RFALSE>)
	       (<VERB? EXAMINE LOOK-INSIDE SEARCH>
		<COND (<FIRST? ,PRSO>
		       <LOOK-IN-BEDS>
		       <RTRUE>)>
		<TELL "The flowers are lovely to behold" ,PERIOD-CR>)
	       (<VERB? TAKE PICK>
		<TELL 
"Flower-picking in" T ,GARDENS " is strictly forbidden" ,PERIOD-CR>)
	       (<GETTING-INTO?>
		<DO-WALK ,P?EAST>
		<RTRUE>)
	       (<EXITING?>
		<NOT-IN>
		<RTRUE>)
	       (<VERB? SMELL>
		<TELL 
"The air is filled with a delicate fragrance" ,PERIOD-CR>)
	       (T
		<RFALSE>)>>

<ROUTINE LOOK-IN-BEDS ()
	 <TELL 
"You can see" A ,BALL " half-hidden among the blossoms" ,PERIOD-CR>>

<OBJECT THICKET
	(IN WABE)
	(DESC "thicket")
	(FLAGS NDESCBIT TRYTAKEBIT NOALL)
	(SYNONYM THICKET THORNS BUSH BUSHES)
	(ADJECTIVE DENSE THICK)
	(ACTION THICKET-F)>

<ROUTINE THICKET-F ()
	 <COND (<VERB? EXAMINE LOOK-INSIDE LOOK-DOWN SEARCH LOOK>
		<TELL "The surrounding " D ,PRSO 
		      " is dense and full of thorns" ,PERIOD-CR>
		<RTRUE>)
	       (<EXITING?>
		<V-WALK-AROUND>
		<RTRUE>)
	       (<OR <ENTERING?>
		    <TOUCHING? ,PRSO>>
		<TELL "Ouch! The " D ,THICKET
		      " is full of thorns" ,PERIOD-CR>
		<RTRUE>)
	       (<AND <PRSO? ,THICKET>
		     <IN-TBL? ,PRSA ,MOVEVERBS ,NMVERBS>>
		<IMPOSSIBLES>
		<RTRUE>)
	       (T
		<RFALSE>)>>
		       
<OBJECT TRINITY-CLEARING
	(IN WABE)
	(DESC "clearing")
	(FLAGS NDESCBIT)
	(SYNONYM CLEARING WABE CENTER PLOT)
	(ADJECTIVE ROUND CIRCULAR GRASS GRASSY)>

"TOUCHBIT = clearing referenced as WABE."

<OBJECT MEMORIAL
	(IN GLOBAL-OBJECTS)
	(DESC "Albert Memorial")
	(FLAGS NDESCBIT VOWELBIT)
	(SYNONYM MEMORIAL MONUMENT EDIFICE SPIRES)
	(ADJECTIVE ALBERT HIDEOUS)
	(ACTION MEMORIAL-F)>

<ROUTINE MEMORIAL-F ()
	 <COND (<NOT <EQUAL? ,HERE ,FLOWER-WALK>>
		<CANT-SEE-ANY>
		<RFATAL>)
	       (<VERB? EXAMINE LOOK-INSIDE READ>
		<COND (<FSET? ,MEMORIAL ,TOUCHBIT>
		       <TELL ,YOU-CANT
"bear to look at" T ,MEMORIAL " a moment longer.">)
		      (T
		       <FSET ,MEMORIAL ,TOUCHBIT>
		       <TELL
"Your London guide book warned you that" T ,PRSO
" was ugly, but nothing could have prepared you for this embarrassing spectacle!">)>
		<CRLF>
		<RTRUE>)
	       (<GETTING-INTO?>
		<DO-WALK ,P?SOUTH>
		<RTRUE>)
	       (<TOUCHING? ,PRSO>
		<TELL ,CANT-FROM-HERE>
		<RTRUE>)
	       (<EXITING?>
		<WHICH-WAY-OUT>
		<RTRUE>)
	       (T
		<RFALSE>)>>
		 
<OBJECT BWALK
	(IN GLOBAL-OBJECTS)
	(DESC "Broad Walk")
	(FLAGS NDESCBIT)
	(SYNONYM WALK)
	(ADJECTIVE BROAD)
	(GENERIC GENERIC-WALK-F)
	(ACTION BWALK-F)>

<ROUTINE BWALK-F ()
	 <COND (<NOT <EQUAL? ,HERE ,BROAD-WALK ,PAL-GATE ,LION-GATE 
			,ROUND-POND>>
		<CANT-SEE-ANY>
		<RFATAL>)>>
		      
<OBJECT VICTORIA
	(IN BROAD-WALK)
	(DESC "statue of Queen Victoria")
	(FLAGS NDESCBIT)
	(SYNONYM STATUE FIGURE MONUMENT VICTOR)
	(ADJECTIVE STATUE BROODING QUEEN)
	(ACTION VICTORIA-F)>

<ROUTINE VICTORIA-F ()
	 <COND (<VERB? EXAMINE>
		<TELL "She wasn't much to look at" ,PERIOD-CR>
		<RTRUE>)
	       (<ENTERING?>
		<DO-WALK ,P?WEST>
		<RTRUE>)
	       (<GETTING-INTO?>
		<TOURISTS-SNICKER>
		<RTRUE>)
	       (T
		<RFALSE>)>>
		       		       
<OBJECT BAG
	(SDESC "")
	(FLAGS TAKEBIT CONTBIT OPENBIT)
	(CAPACITY 0)
	(SIZE 3)
	(SYNONYM BAG CRUMBS)
	(GENERIC GENERIC-BAG-F)
	(ADJECTIVE BAG SACK PAPER BREAD OLD STALE DRY HANDFUL)
	(ACTION BAG-F)>

"SEEN = seen by roadrunner. CHILLY = empty"

<GLOBAL CCNT 5> "# handfuls of crumbs left in BAG"
;<GLOBAL APPETITE 0> "Meep takes 4 moves to eat entire bag." 

<ROUTINE SAID-CRUMBS? ()
	 <COND (<NOT <IN? ,BAG ,PROTAGONIST>>
		<RFALSE>)
	       (<AND <PRSO? ,BAG>
		     <NOUN-USED ,BAG ,W?BAG ,W?SACK>>
		<RFALSE>)
	       (<AND <PRSI? ,BAG>
		     <NOUN-USED ,BAG ,W?BAG ,W?SACK>>
		<RFALSE>)
	       (<ADJ-USED ,BAG ,W?PAPER>
		<RFALSE>)
	       (<NOUN-USED ,BAG ,W?CRUMBS ,W?BREAD>
		<RTRUE>)
	       (<ADJ-USED ,BAG ,W?HANDFUL>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE CRUMBS? (X)
	 <COND (<OR <EQUAL? .X ,W?CRUMBS ,W?BREAD ,W?HANDFUL>
		    <EQUAL? .X ,W?FEED ,W?FOOD>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE BAG-F ()
	 <COND (<FSET? ,BAG ,CHILLY>         ;"EMPTY"
		<COND (<OR <SAID-CRUMBS?>
			   <VERB? POUR EMPTY>>
		       <TELL "There are no more crumbs in" TR ,BAG>
		       <RFATAL>)
		      (<VERB? LOOK-INSIDE EXAMINE>
		       <TELL CT ,BAG " is empty" ,PERIOD-CR>)
		      (<AND <VERB? PUT>
			    <PRSI? ,BAG>>
		       <YUKS>)
		      (<VERB? CLOSE>
		       <TELL CT ,PRSO " refuses to stay closed.">)
		      (<VERB? BUY>
		       <TRY-BUY>)
		      (T
		       <RFALSE>)>
		<RTRUE>)
	       (<PRSI? ,BAG>
		<COND (<AND <VERB? POUR>                    
		     	    <PRSO? PRSI>>
		       <COND (<OR <CRUMBS? <GET ,P-NAMW 1>>
				  <NOUN-USED ,BAG ,W?BAG ,W?SACK>
				  <EQUAL? <GET ,P-ADJW 0> ,W?PAPER>>
			      <IMPOSSIBLES>
			      <RTRUE>)>
		       <EMPTY-OUT-BAG>
		       <RTRUE>)
		      (<VERB? PUT PUT-ON>
		       <COND (<G? <GETP ,PRSO ,P?SIZE> 1>
		       	      <YOUD-HAVE-TO "empty out" ,BAG>
		       	      <RTRUE>)>
		       <TELL "You'd probably lose" T ,PRSO
		      	     " in the crumbs if you did" ,PERIOD-CR>
		       <RTRUE>)>
		<RFALSE>)
	       (<VERB? BUY>
		<TRY-BUY>
		<RTRUE>)
	       ;(<AND <VERB? BUY-FROM>
		     <PRSI? BWOMAN>>
		<PERFORM ,V?BUY ,PRSO>
		<RTRUE>)
	       (<VERB? EMPTY>
		<COND (<NOT ,PRSI>
		       <SETG PRSI ,GROUND>)>
		<COND (<PRSI? PRSO>
		       <IMPOSSIBLES>
		       <RTRUE>)
		      (<PRSI? POCKET>
		       <TELL "You try to empty" T ,PRSO " into " 
D ,POCKET ", but crumbs pile up around the edges">
		       <DROP-CRUMBS>
		       <RTRUE>)
		      (<PRSI? PRAM>
		       ;<CRUMBS-INTO-PRAM>
		       <COND (<NOT <FSET? ,PRSI ,OPENBIT>>
		              <YOUD-HAVE-TO "open" ,PRSI>
			      <RTRUE>)
	       		     (<T? ,IN-PRAM?>
			      <YOUD-HAVE-TO "get out of" ,PRSI>
			      <RTRUE>)>
		       <SAY-CRUMBS-FALL>
		       <TELL " and tumble into the open " D ,PRSI ".|
|
In moments, the pram is covered with greedy " D ,PIGEONS
"! Soon there's not a crumb to be seen" ,PERIOD-CR CR>
		       <COND (<FSET? ,RUBY ,SEEN>
			      <RTRUE>)>
		       <GET-RUBY T>
		       <TELL 
"As you brush the last few " D ,PIGEONS " off the pram ">
	  	       <NOTICE-RUBY>
		       <RTRUE>)
		      (<OR <PRSI? GROUND>
			   <FSET? ,PRSI ,SURFACEBIT>
			   <AND <FSET? ,PRSI ,CONTBIT>
			        <FSET? ,PRSI ,OPENBIT>>>
		       <EMPTY-OUT-BAG>
		       <RTRUE>)>
	        <RFALSE>)
	       (<VERB? EMPTY POUR>
		<COND (<DONT-HAVE? ,PRSO>
		       <RTRUE>)>
		<EMPTY-OUT-BAG>
		<RTRUE>)
	       (<VERB? SHAKE>
		<TELL "Bread crumbs jitter in" TR ,PRSO>
		<RTRUE>)
	       (<VERB? SMELL>
		<TELL "The crumbs in the bag smell a bit stale" ,PERIOD-CR>
		<RTRUE>)
	       (<AND <VERB? REACH-IN DIG>
		     <EQUAL? ,PRSI <> ,HANDS>>
		<FEEL-RUBY>
		<RTRUE>)
	       (<SAID-CRUMBS?>
		<COND (<VERB? EXAMINE>
		       <TELL "The bread crumbs look old and stale. ">
		       <LOOK-IN-BAG>
		       <RTRUE>)
	       	      (<VERB? TAKE DROP PUT PUT-ON THROW PUT-UNDER PUT-BEHIND>
		       <TAKE-CRUMBS>
		       <RTRUE>)
	       	      ;(<AND <VERB? TOUCH>
		     	    <EQUAL? ,PRSI <> ,HANDS>>
		       <FEEL-RUBY>
		       <RTRUE>)
	       	      ;(<VERB? KISS>
		       <FEEL-STALE>
		       <RTRUE>)
		      (<VERB? DRINK DRINK-FROM>
		       <IMPOSSIBLES>
		       <RTRUE>)
		      (<VERB? EAT TASTE BITE>
		       <TELL "You grab ">
		       <SAY-HANDFUL>
		       <TELL 
" and cram them into your mouth. " CT ,PIGEONS " look on hungrily" ,PERIOD-CR>
		       <COND (<NOT <FSET? ,RUBY ,SEEN>>
		       	      <GET-RUBY>
		       	      <TELL CR 
"As you munch the bread, your teeth clamp down on something hard. Ouch! You spit out the particle with a muffled curse.|
|
A brilliant ruby lands ">
			      <COND (<ZERO? ,IN-PRAM?>
			      	     <TELL "at your feet" ,PERIOD-CR>
			      	     <RTRUE>)>
		       	      <TELL "on the ground" ,PERIOD-CR>)>
		       <RTRUE>)>
		<RFALSE>)
	       (<VERB? LOOK-INSIDE SEARCH>
		<LOOK-IN-BAG>
		<RTRUE>)
	       (<VERB? MUNG KILL CUT RIP>
		<COND (<DONT-HAVE? ,PRSO>
		       <RTRUE>)>
		<TELL "Maybe you should empty" T ,PRSO " first" ,PERIOD-CR>)
	       (<VERB? DROP>
		<TELL "Dropped" ,PERIOD-CR>
		<MOVE ,BAG ,HERE>
		<PIGEONS-EAT-BAG>)
	       (<VERB? THROW>
		<TELL "Thrown" ,PERIOD-CR>
		<MOVE ,BAG ,HERE>
		<PIGEONS-EAT-BAG>)
	       (<VERB? CLOSE>
		<TELL CT ,PRSO " refuses to stay closed" ,PERIOD-CR>)>>

<ROUTINE PIGEONS-EAT-BAG ()
	 <EMPTY-BAG>
	 <SETG P-IT-OBJECT ,PIGEONS>
	 <TELL CT ,PIGEONS 
" flock eagerly around the bag. Soon the bread crumbs are history" ,PERIOD-CR>
	 <COND (<NOT <FSET? ,RUBY ,SEEN>>
		<GET-RUBY>
		<TELL CR "As the birds wander away ">
		<NOTICE-RUBY>)>
	 <RTRUE>>

;<ROUTINE CRUMBS-INTO-PRAM ()
	  <RTRUE>> 

<ROUTINE SAY-CRUMBS-FALL ()
	 <EMPTY-BAG>
	 <TELL "Bread crumbs fall out of the bag">
	 <RTRUE>>

<ROUTINE EMPTY-OUT-BAG ()
	 <SAY-CRUMBS-FALL>
	 <DROP-CRUMBS>
	 <RTRUE>>

<ROUTINE LOOK-IN-BAG ()
	 <TELL "There">
	 <COND (<EQUAL? ,CCNT 1>
		<TELL "'s only one more handful">)
	       (T
		<TELL " are ">
		<COND (<EQUAL? ,CCNT 2 3>
		       <TELL "a couple of">)
		      (T
		       <TELL "several">)>
		<TELL " handfuls">)>
	 <TELL " left in" TR ,BAG>
	 <RTRUE>>

<ROUTINE EMPTY-BAG ()
         ;<SETG APPETITE 0>
	 <SETG CCNT 0>
	 <PUTP ,BAG ,P?SDESC "paper bag">
	 <FSET ,BAG ,CHILLY>>

<ROUTINE SAY-HANDFUL ()
	 <DEC CCNT>
	 <COND (<ZERO? ,CCNT>
		<EMPTY-BAG>
		<TELL "the last ">)
	       (T
		<TELL "a ">)>
	 <TELL "handful of crumbs">
	 <RTRUE>>

<ROUTINE FEEL-RUBY ()
	 <TELL "The crumbs in the bag feel dry and stale" ,PERIOD-CR>
	 <COND (<FSET? ,RUBY ,SEEN>
		<RTRUE>)>
	 <GET-RUBY>
	 <TELL CR 
"As you rummage through the crumbs, your fingers brush against something solid. A brilliant ruby slips out of the bag and falls to the ground." CR>
	 <RTRUE>>

<ROUTINE TAKE-CRUMBS ()
	 <COND (<L? ,CCNT 1>
		<TELL
"There are no more crumbs left in the bag." CR>
		<RFATAL>)>
	 <TELL "You take ">
	 <SAY-HANDFUL>
	 <TELL " out of the bag. ">
	 <COND (<AND <VERB? PUT PUT-ON THROW PUT-UNDER
			    PUT-BEHIND>
		     <PRSO? BAG>>
	        <TELL "But before you can ">
		<COND (<VERB? PUT PUT-ON PUT-UNDER PUT-BEHIND>
		       <TELL "put them ">
		       <COND (<VERB? PUT>
			      <TELL "in ">)
			     (<VERB? PUT-ON>
			      <TELL "on ">)
			     (<VERB? PUT-UNDER>
			      <TELL "under ">)
			     (T
			      <TELL "behind ">)>)
		      (<VERB? THROW>
		       <TELL "throw them ">
		       <COND (<VERB? THROW>
			      <TELL "at ">)
			     (T
		       	      <TELL "over ">)>)>
		<TELL T ,PRSI ", they ">)
	       (T
		<TELL "They ">)>
	 <TELL "fall between your fingers">
	 <DROP-CRUMBS>
	 <RTRUE>>

<ROUTINE DROP-CRUMBS ()
	 <TELL " and tumble ">
	 <COND (<T? ,IN-PRAM?>
		<TELL "out of" T ,PRAM>)
	       (T
		<TELL "across" T ,GROUND>)>
	 <COND (<NOT <FSET? ,RUBY ,SEEN>>
		<GET-RUBY>		
		<TELL ".|
|
As the ">
		<COND (<OR <T? ,IN-PRAM?>
			   <EQUAL? ,HERE ,WABE>>
		       <TELL "breeze scatters ">)
		      (T
		       <TELL "swans and ducks gobble down ">)>
		<TELL "the crumbs, ">
		<NOTICE-RUBY>
		<RTRUE>)
	       (<ZERO? ,LIT?>
		<PRINT ,PERIOD-CR>
		<RTRUE>)
	       (T
		<TELL ", where the breeze blows them all away" ,PERIOD-CR>)>
	 <RTRUE>>

<ROUTINE NOTICE-RUBY ()
	 <TELL "a glint of red catches your eye. Frowning, you ">
	 <COND (<IN? ,RUBY ,PRAM>
		<TELL "peer inside">)
	       (<ZERO? ,IN-PRAM?>
		<TELL "stoop down">)
	       (T
		<TELL "peer over the edge of" T ,PRAM>)>
	 <TELL " for a closer look... and gasp with astonishment!|
|
The ruby ">
	 <COND (<IN? ,RUBY ,PRAM>
		<TELL "in the pram">)
	       (<ZERO? ,IN-PRAM?>
		<TELL "at your feet">)
	       (T
		<TELL "on the ground">)>
	 <TELL " is bigger than a walnut, with finely cut facets that sparkle with crimson fire. It must have been in" TR ,BAG>
	 <RTRUE>>

<OBJECT GBAG
	(IN BWOMAN)
	(DESC "bag")
	(FLAGS NDESCBIT TRYTAKEBIT NOALL)
	(SYNONYM BAG BAGS CRUMBS BREAD)
	(ADJECTIVE BREAD BAG)
	(GENERIC GENERIC-BAG-F)
	(ACTION GBAG-F)>

<ROUTINE GENERIC-BAG-F ()
	 <RETURN ,BAG>>

<ROUTINE GBAG-F ()
	 <COND (<PRSI? ,GBAG>
		<COND (<IN-TBL? ,PRSA ,PUTVERBS ,NUMPUTS>
		       <PERFORM ,V?GIVE ,PRSO ,BWOMAN>
		       <RTRUE>)>
		<RFALSE>)
	       (<VERB? BUY>
		<TRY-BUY>
		<RTRUE>)
	       ;(<AND <VERB? BUY-FROM>
		     <PRSI? BWOMAN>>
		<PERFORM ,V?BUY ,PRSO>
		<RTRUE>)
	       (<VERB? EXAMINE LOOK-INSIDE SEARCH>
		<TELL "The bags are full of bread crumbs" ,PERIOD-CR>
		<RTRUE>)
	       (<TOUCHING? ,PRSO>
		<NO-TOUCHIN>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE NO-TOUCHIN ()
	 <FSET ,BWOMAN ,SEEN>
	 <TELL 
"The woman slaps " D ,HANDS " away. \"No touchin' the merchandise!\"" CR>
	 <RTRUE>>

<ROUTINE TRY-BUY ()
	 <COND (<NOT <EQUAL? ,HERE ,BROAD-WALK>>
		<TELL "There's nobody here to sell you any" ,PERIOD-CR>
		<RTRUE>)
	       (<PRSI? COIN CREDIT-CARD>
		<PERFORM ,V?GIVE ,PRSI ,BWOMAN>
		<RTRUE>)
	       (<T? ,PRSI>
		<FSET ,BWOMAN ,SEEN>
		<TELL CT ,BWOMAN " scowls. \"I ain't no pawn shop!\"" CR>
		<RTRUE>)
	       (<OR <ULTIMATELY-IN? ,COIN ,PROTAGONIST>
		    <ULTIMATELY-IN? ,COIN ,POCKET>>
		<BUY-WITH ,COIN>
		<RTRUE>)
	       (<OR <ULTIMATELY-IN? ,CREDIT-CARD ,PROTAGONIST>
		    <ULTIMATELY-IN? ,CREDIT-CARD ,POCKET>>
		<BUY-WITH ,CREDIT-CARD>
		<RTRUE>)
	       (T
		<TELL "You don't have any money" ,PERIOD-CR>)>
	 <RTRUE>>

<ROUTINE BUY-WITH (THING)
	 <I-ASSUME .THING>
	 <PERFORM ,V?GIVE .THING ,BWOMAN>
	 <RTRUE>>

<ROUTINE GET-RUBY ("OPTIONAL" (P <>))
	 <FSET ,RUBY ,SEEN>
	 <MOVE ,RUBY <COND (<ZERO? .P> ,HERE) (T ,PRAM)>>
	 <SETG P-IT-OBJECT ,RUBY>
	 <QUEUE I-RUBY -1>
	 <RTRUE>>

<OBJECT RUBY
	(DESC "ruby")
	(FLAGS CHILLY TAKEBIT)
	(FDESC "A ruby is lying at your feet.")
	(SYNONYM RUBY JEWEL STONE GEM)
	(ADJECTIVE RED CRIMSON RUBY BRILLIANT BRIGHT)
	;(VALUE 1)
	(SIZE 0)
	(ACTION RUBY-F)>

"SEEN = found, CHILLY = delay timer."

<ROUTINE RUBY-F ()
	 <COND (<PRSI? ,RUBY>
		<RFALSE>)
	       (<VERB? EXAMINE LOOK-INSIDE>
		<TELL 
"Its finely cut edges sparkle with crimson fire" ,PERIOD-CR>)
	       (<TOUCHING? ,RUBY>
	        <FSET ,RUBY ,TOUCHBIT>
		<TELL "As you reach down to touch the ruby, ">
		<MEEP-GETS-RUBY>
		<RTRUE>)>>	

<OBJECT GPRAM
	(IN LOCAL-GLOBALS)
	(DESC "perambulators")
	(FLAGS NDESCBIT PLURALBIT CONTBIT OPENBIT)
	(SYNONYM PERAMB PRAM PRAMS CARRIA)
	(ADJECTIVE BABY)
	(GENERIC GENERIC-PRAM-F)
	(ACTION GPRAM-F)>

<ROUTINE GPRAM-F ()
	 <COND (<VERB? EXAMINE LOOK-INSIDE SEARCH>
		<TELL "They're probably full of British babies" ,PERIOD-CR>
		<RTRUE>)
	       (<HANDLE-BABES?>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE GENERIC-PRAM-F (TABLE)
	 <RETURN ,PRAM>>

<OBJECT PRAM
	(IN LION-GATE)
	(SDESC "")
        (FLAGS TRYTAKEBIT CONTBIT)
	(SYNONYM PERAMB PRAM CARRIA STROLL)
	(ADJECTIVE BABY BROKEN)
	(CAPACITY 30)
	(DESCFCN DESCRIBE-PRAM)
	(ACTION PRAM-F)>
		
;"MUNGBIT = BROKEN"

<ROUTINE DESCRIBE-PRAM ("OPTIONAL" (CONTEXT <>))
	 <COND (<FSET? ,PRAM ,MUNGBIT>
		<RFALSE>) 
	       (<NOT .CONTEXT>
		<RFALSE>)
	       (<EQUAL? .CONTEXT ,M-OBJDESC?>
		       <RTRUE>)>
	 <TELL CR "A careless nanny has left her " D ,PRAM " unattended.">
	 <COND (<AND <FIRST? ,PRAM>
		     <FSET? ,PRAM ,OPENBIT>>
		<TELL " Inside it you see">
		<DESCRIBE-NOTHING ,PRAM T>)>
	 <RTRUE>>

<GLOBAL IN-PRAM? <>>

<ROUTINE PRAM-F ()
	 <COND (<PRSI? ,PRAM>
		<COND (<IN-TBL? ,PRSA ,PUTVERBS ,NUMPUTS>
		       <COND (<NOT <FSET? ,PRAM ,OPENBIT>>
			      <ITS-CLOSED ,PRAM>)
			     (<PRSO? ME>
			      <PERFORM ,V?ENTER ,PRAM>
			      <RTRUE>)
			     (<AND <PRSO? BAG>
				   <NOT <FSET? ,BAG ,CHILLY>>>
			      <COND (<NOT <SAID-CRUMBS?>>
				     <MOVE ,BAG ,PRAM>)>
			      <PIGEONS-EAT-BAG>
			      <RTRUE>)>)>
		<RFALSE>)
	       (<AND <VERB? EXAMINE LOOK-INSIDE SEARCH>
		     <T? ,IN-PRAM?>>
		<TELL "Aside from " D ,ME ", you see">
		<COND (<NOT <DESCRIBE-NOTHING ,PRSO>>
		       <TELL ".">)>
		;<CRLF>
	        ;<TELL " in" TR ,PRAM>
		;<RTRUE>)
	       
	       (<VERB? ENTER BOARD CLIMB-ON SIT LIE-DOWN CLIMB-UP STAND-ON 
							STAND>
		<COND (<AND <T? ,IN-PRAM?>
			    <NOT <VERB? STAND-ON>>>
		       <ALREADY-IN>
		       <RTRUE>)
		      (<NOT <FSET? ,PRSO ,OPENBIT>>
		       <YOUD-HAVE-TO "open" ,PRSO>
		       <RTRUE>)
		      (<VERB? STAND-ON STAND>
		       <COND (<ZERO? ,IN-PRAM?>
			      <TELL "You clamber into" T ,PRSO 
" and slowly rise to your feet, knees wobbling">)
			     (T
			      ;<SETG O-HERE <>>
		       	      <SETG IN-PRAM? <>>
		       	      <FCLEAR ,PRSO ,NDESCBIT>
			      <TELL 
"With wobbling knees, you slowly rise to your feet">)>
		       <TELL ,PERIOD-CR CR>
		       <TELL "CRASH!">
		       <TELL 
" The pram skitters away and deposits you on the ground">
		       <COND (<AND <ZERO? ,RAID?>
				   <NOT <EQUAL? ,HERE ,WABE>>>
			      <TELL ", much to the amusement of passersby">)>
		       <TELL 
".|
|
With as much dignity as possible, you rise to your feet and discipline the pram with an angry kick" ,PERIOD-CR>
		       <RTRUE>)
		      (<VISIBLE? ,RUBY>
		       <TELL "You start to climb into" T ,PRSO
			     ", but stop short as ">
		       <MEEP-GETS-RUBY>
		       <RTRUE>)
		      (T
		       <SETG IN-PRAM? T>
		       <FSET ,PRSO ,NDESCBIT>
		       ;<SETG OLD-HERE <>>
		       <TELL "With great difficulty, ">
		       <COND (<AND <ZERO? ,RAID?>
				   <NOT <EQUAL? ,HERE ,WABE>>>
		              <TELL
"and much to the amusement of passersby, ">)>
		       <TELL "you jam " D ,ME " into the unfortunate "
			     D ,PRSO ,PERIOD-CR>)>
		<RTRUE>)
	       
	       (<OR <EXITING?>
		    <VERB? CLIMB-DOWN LEAP>>
		<COND (<ZERO? ,IN-PRAM?>
		       <TELL "You're not in" TR ,PRAM>)
		      (T
		       <SETG IN-PRAM? <>>
		       <FCLEAR ,PRSO ,NDESCBIT>
		       ;<SETG OLD-HERE <>>
		       <TELL "Gratefully, you clamber out of the cramped "
			     D ,PRSO ,PERIOD-CR>)>
		<RTRUE>)
	       (<VERB? PUSH PUSH-DIR>
		<COND (<OR <AND <PRSI? GRASS LWATER>
				<EQUAL? ,HERE ,LAN-WALK>>
			   <AND <PRSI? GRPOND>
				<EQUAL? ,HERE ,BROAD-WALK>>>
		       <DO-WALK ,P?EAST>
		       <RTRUE>)		      
		      (<PRSI? INTDIR>
		       <MOVE ,PRAM ,PROTAGONIST>
		       <DO-WALK ,P-DIRECTION>
		       <MOVE ,PRAM ,HERE>
		       <PUTP ,PRAM ,P?DESCFCN 0>
		       <RTRUE>)>
		<V-WALK-AROUND>)
	       (<VERB? TAKE RAISE>
		<TELL ,YOU-CANT "lift the clumsy " D ,PRSO ,PERIOD-CR>
		<RTRUE>)
	       (<VERB? MOVE PUSH SET>
		<TELL
"[To move" T ,PRSO ", simply push it in the desired " D ,INTDIR
"; for example, PUSH THE PERAMBULATOR TO THE SOUTH or PULL PRAM EAST.]" CR>
		<RTRUE>)
	       (<AND <VERB? UNTIE>
		     <T? ,PRSI>
		     <NOT <EQUAL? ,P-PRSA-WORD ,W?UNTIE ,W?PRY>>>
		<COND (<G? <GETP ,PRSO ,P?SIZE> 2>
		       <TELL CT ,PRSO " rolls a few feet, then stops" ,PERIOD-CR>
		       <RTRUE>)>
		<NOT-LIKELY ,PRSI "would move the pram very far">
		<RTRUE>)
	       (<AND <VERB? CLOSE>
		     <T? ,IN-PRAM?>>
		<CANT-WHILE-IN-PRAM>
		<RTRUE>)
	       (<AND <VERB? KICK SHAKE RAPE>
		     <ZERO? ,IN-PRAM?>
		     <NOT <EQUAL? ,HERE ,WABE>>>
		<COND (<ZERO? ,RAID?>
		       <TELL "Pass">)
		      (T
		       <TELL "Flee">)>
		<TELL "ing " D ,NANNIES " look on in horror" ,PERIOD-CR>
		<RTRUE>)>>

<ROUTINE CANT-WHILE-IN-PRAM ()
	 <TELL 
"That'd be easier to do if you got out of the pram first" ,PERIOD-CR>
	 <RTRUE>>

<ROUTINE BPRAM-F ()
	 <COND (<PRSI? ,PRAM>
		<COND (<IN-TBL? ,PRSA ,PUTVERBS ,NUMPUTS>
		       <PRSO-SLIDES-OFF-PRSI>
		       <RTRUE>)>
		<RFALSE>)
	       (<VERB? EXAMINE>
		<TELL CT ,PRAM
" is lying on its side, bent and useless" ,PERIOD-CR>
		<RTRUE>)
	       (<VERB? TAKE RAISE>
		<TELL CT ,PRSO
" topples over on its side again. It's quite useless" ,PERIOD-CR>
		<RTRUE>)
	       (<VERB? PUSH-DIR MOVE PUSH>
		<TELL CT ,PRSO 
"'s days of carefree rolling are over" ,PERIOD-CR>
		<RTRUE>)
	       (<VERB? OPEN CLOSE>
		<TELL "The top of" T ,PRAM
		      " is hopelessly broken" ,PERIOD-CR>
		<RTRUE>)
	       (<VERB? ENTER CLIMB-ON SIT LIE-DOWN CLIMB-UP STAND-ON STAND>
		<TELL CT ,PRSO " would never support you now" ,PERIOD-CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>		      

<OBJECT NOTICE
	(IN LAN-WALK)
	(DESC "notice")
	(FDESC "A printed notice is stuck into the grass.")
	(FLAGS READBIT TRYTAKEBIT)
	(SYNONYM SIGN NOTICE WORDS PRINTING)
	(ADJECTIVE PRINTED)
	(ACTION NOTICE-F)>

"TOUCHBIT = warning given."

<ROUTINE NOTICE-F ()
	 <COND (<VERB? EXAMINE READ>
		<FSET ,NOTICE ,TOUCHBIT>
		<TELL "The words ">
		<TELL "DO NOT WALK ON THE GRASS">
		<TELL " are sternly printed on" TR ,NOTICE>
		<RTRUE>)
	       (<OR <TOUCHING? ,PRSO>
		    <ENTERING?>>
		<COND (<FSET? ,NOTICE ,TOUCHBIT>
		       <GRASS-STOPS-YOU "As you approach the notice">
		       <RFATAL>)>
		<READ-NOTICE-FIRST>
		<RFATAL>)
	       (T
	       	<RFALSE>)>>

<OBJECT GRASS
	(IN LOCAL-GLOBALS)
	(DESC "grass")
	(FLAGS NDESCBIT TRYTAKEBIT NOALL SURFACEBIT)
	(CAPACITY 100)
	(SYNONYM GRASS GRASSES LAWN FIELD)
	(ADJECTIVE BROAD LUSH MANICURED)
	(ACTION GRASS-F)>

"TOUCHBIT = attacked, SEEN = bikes seen, CHILLY = heard."

<ROUTINE GRASS-F ()
	 <COND (<INDOORS?>
		<CANT-SEE-ANY ,GRASS>
		<RFATAL>)
	       (<NOT <EQUAL? ,HERE ,LAN-WALK>>
		<COND (<GROUND-F>
		       <RTRUE>)>
		<RFALSE>)
	       (<PRSI? ,GRASS>
		<COND (<IN-TBL? ,PRSA ,PUTVERBS ,NUMPUTS>
		       <FSET ,PRSI ,CHILLY>
		       <REMOVE ,PRSO>
		       <TELL CT ,PRSO
" lands on" T ,GRASS " with a gentle thud.|
|
You hear a mutter of sinister little voices and a brief rustling sound.
When you look again," T ,PRSO " is gone without a trace!" CR>
		       <RTRUE>)>
		<RFALSE>)
	       (<VERB? EXAMINE LOOK-INSIDE SEARCH>
		<TELL "It seems innocent enough" ,PERIOD-CR>
		<RTRUE>)
	       (<VERB? CROSS CLIMB-ON ENTER WALK-TO CLIMB-OVER
		       STAND-ON SIT LIE-DOWN LEAP WALK-AROUND>
		<COND (<FSET? ,NOTICE ,TOUCHBIT>
		       <GRASS-STOPS-YOU "As your feet touch the grass">
		       <RFATAL>)>
		<READ-NOTICE-FIRST>
		<RFATAL>)
	       (<AND <EQUAL? ,PRSI <> ,HANDS>
		     <VERB? TAKE TOUCH CUT RIP MOVE UNTIE DIG
			    LOOK-UNDER MUNG KILL SHAKE REACH-IN PICK
			    KISS KICK>> 
		<COND (<FSET? ,NOTICE ,TOUCHBIT>
		       <GRASS-STOPS-YOU "As you bend to touch the grass">
		       <RFATAL>)>
		<READ-NOTICE-FIRST>
		<RFATAL>)
	       (<AND <VERB? LISTEN>
		     <FSET? ,PRSO ,CHILLY>>
		<FCLEAR ,PRSO ,CHILLY>
		<TELL
"You hear tiny voices giggling \"Shh! Shh! Quiet!\" for a moment. Then
everything is quiet" ,PERIOD-CR>)
	       (T
		<RFALSE>)>>
	        
<ROUTINE GRASS-STOPS-YOU (STR "OPTIONAL" (UMB? <>))
	 <FSET ,GRASS ,CHILLY>
	 <COND (<NOT <FSET? ,GRASS ,TOUCHBIT>>
		<FSET ,GRASS ,TOUCHBIT>
		<TELL 
.STR " you sense a strange motion around you. Looking down, you watch with
horror as" T ,GRASS " begins to ripple and writhe with vegetable
indignance!" CR CR>)>
	 <TELL 
"Angry green stalks whip around your legs, pull you to the ground and drag you, kicking and screaming, back to the paved surface"
" of" TR ,LNWALK CR 
"A chorus of offended little voices subsides as you regain your footing">
	 <COND (<OR <T? .UMB?>
		    <AND <HELD? ,PARASOL>
			 <FSET? ,PARASOL ,OPENBIT>>>
		<AND-SNAP>
		<RTRUE>)>
	 <PRINT ,PERIOD-CR>
	 <COND (<NOT <FSET? ,GRASS ,SEEN>>
		<FSET ,GRASS ,SEEN>
		<QUEUE I-BIKES 2>)>
	 <RTRUE>>

<OBJECT ENERGY
	(IN LAN-WALK)
	(DESC "sculpture")
	(FLAGS NDESCBIT)
	(SYNONYM SCULPTURE STATUE ENERGY PLAQUE)
	(ADJECTIVE PHYSICAL IMPRESSIVE HORSE RIDER)
	(ACTION ENERGY-F)>

<ROUTINE ENERGY-F ()
	 <COND (<VERB? EXAMINE READ>
		<TELL "According to a plaque," T ,PRSO " is called ">
		<TELL "PHYSICAL ENERGY.">
		<CRLF>
		<RTRUE>)
	       (<GETTING-INTO?>
		<TELL CT ,ENERGY "'s design would make that difficult" ,PERIOD-CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>
		  
<OBJECT BALL
        (IN BEDS)
	(DESC "soccer ball")
	(FLAGS TAKEBIT)
        (SYNONYM BALL FOOTBALL)
        (ADJECTIVE ABANDONED SOCCER FOOT)
	(SIZE 7)
	;(MASS 5)
	(VALUE 1)
	(ACTION BALL-F)>

<ROUTINE BALL-F ()
	 <COND (<PRSI? ,BALL>
		<COND (<AND <VERB? THROW>
		     	    <PRSO? PARASOL>
		     	    <IN? ,PRSI ,TRINITY-TREE>>
		       <TREE-SWITCH>
		       <RTRUE>)>
		<RFALSE>)
	       (<IN? ,PRSO ,TRINITY-TREE>
		<COND (<AND <T? ,PRSI>
		     	    <VERB? KILL UNTIE TAKE TAKE-WITH TOUCH
				   SHAKE>>
		       <NICE-TRY>
	               <RTRUE>)
	       	      (<TOUCHING? ,PRSO>
		       <CANT-REACH ,BALL>
		       <RTRUE>)>
		<RFALSE>)
	       (<VERB? KICK TOUCH SHAKE>
		<TELL "You ">
		<PRINTB ,P-PRSA-WORD>
		<TELL T ,PRSO>
		<COND (<VERB? KICK>
		       <TELL " around">)>
		<TELL " for a few moments, but ">
		<COND (<EQUAL? ,HERE ,WABE>
		       <TELL "there's nobody here ">)
		      (T
		       <TELL "nobody stops ">)>
		<TELL "to admire your athletic prowess" ,PERIOD-CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>
	       
<OBJECT PARASOL
	(IN JWOMAN)
	(DESC "umbrella")
	(FLAGS NDESCBIT VOWELBIT TAKEBIT OPENBIT SURFACEBIT)
	(SYNONYM UMBRELLA BROLLY SLOGAN HANDLE)
	(SIZE 10)
	;(MASS 7)
	(ACTION PARASOL-F)>

<ROUTINE PARASOL-F ()
	 <COND (<IN? ,PARASOL ,JWOMAN>
		<TELL "You approach" T ,PARASOL
		      " in" T ,JWOMAN "'s hands, but stop short" ,PERIOD-CR CR>
		<PERFORM ,V?EXAMINE ,JWOMAN>
		<RTRUE>)
	       (<PRSI? ,PARASOL>
		<COND (<VERB? THROW>
		       <COND (<AND <PRSO? BALL>
			    	   <IN? ,PRSI ,TRINITY-TREE>>
		       	      <TREE-SWITCH>
		       	      <RTRUE>)>
		       <TELL CT ,PRSO " glances off" T ,PRSI " and ">
		       <LANDS-AT-YOUR-FEET>
		       <COND (<IN? ,PRSI ,TRINITY-TREE>
		       	      <TELL CR CT ,PRSI 
			       " teeters uncertainly for a moment" ,PERIOD-CR>)>
		       <RTRUE>)
		      (<VERB? PUT PUT-ON>
		       <COND (<IN? ,PRSI ,TRINITY-TREE>
		       	      <CANT-REACH ,PRSI>
		       	      <RTRUE>)>
		       <PRSO-SLIDES-OFF-PRSI>
		       <RTRUE>)> 
		<RFALSE>)
	       ;(<AND <VERB? FILL>
		     <FSET? ,PRSI ,WATERY>>
		<SPLASHES>
		<RTRUE>)
	       (<VERB? FIND FOLLOW>
		<COND (<VISIBLE? ,PARASOL>
		       <ITS-RIGHT-HERE>
		       <RTRUE>)>
		<CANT-SEE-ANY>
		<RTRUE>)
	       (<VERB? EXAMINE LOOK-INSIDE>
		<TELL CT ,PRSO>
		<COND (<IN? ,PRSO ,TRINITY-TREE>
		       <TELL 
" dangles in" T ,TREE " overhead, high out of reach. It">)
		      (T
		       <TELL "'">)>
		<TELL "s handle is carved in the shape of a parrot's head">
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <TELL ", and the ">
		       <READ-SLOGAN>
		       <RTRUE>)>
		<PRINT ,PERIOD-CR>
		<RTRUE>)	       
	       (<VERB? READ EXAMINE>
		<COND (<IN? ,PRSO ,TRINITY-TREE>
		       <TELL ,CANT-FROM-HERE>
		       <RTRUE>)
		      (<FSET? ,PRSO ,OPENBIT>
		       <TELL "The ">
		       <READ-SLOGAN>
		       <RTRUE>)>
		<YOUD-HAVE-TO "open" ,PRSO>
		<RTRUE>)	       
	       (<IN? ,PRSO ,TRINITY-TREE>
		<COND (<AND <T? ,PRSI>
		     	    <VERB? KILL UNTIE TAKE TAKE-WITH TOUCH
				   SHAKE>>
		       <NICE-TRY>
	               <RTRUE>)
		      (<TOUCHING? ,PRSO>
		       <CANT-REACH ,PARASOL>
		       <RTRUE>)>
		<RFALSE>)
	       (<AND <VERB? TAKE>
		     <NOT <FSET? ,PRSO ,SEEN>>>
		<COND (<ITAKE>
		       <FSET ,PRSO ,SEEN>
		       <TELL "As you pick up" T ,PRSO
" and smooth the wrinkles, you notice a touristy slogan printed around the outside: \"All Prams Lead to " D ,GARDENS ".\"" CR>
		       <UPDATE-SCORE 5>)>
		<RTRUE>)	       
	       ;(<VERB? STAND-UNDER>
		<COND (<NOT <IN? ,PARASOL ,PROTAGONIST>>
		       <YOUD-HAVE-TO "be holding" ,PRSO>
		       <RTRUE>)
		      (<NOT <FSET? ,PRSO ,OPENBIT>>
		       <ITS-CLOSED>
		       <RTRUE>)
		      (T
		       <ALREADY-DOING-THAT>)>
		<RTRUE>)	       
	       (<AND <VERB? OPEN>
		     <EQUAL? ,PRSI <> ,HANDS>>
		<COND (<DONT-HAVE? ,PRSO>
		       <RTRUE>)
		      (<FSET? ,PRSO ,OPENBIT>
		       <ITS-ALREADY "open">
		       <RTRUE>)>
		
		<TELL 
CT ,WIND " fills" T ,PRSO " the moment you open it. You">
		
		<COND (<ZERO? ,IN-PRAM?>
		       <TELL "'">)
		      (T
		       <MOVE ,PRAM ,PROTAGONIST>
		       <TELL " and your " D ,PRAM " a">)>
		<TELL "re blown helplessly ">
	 	<COND (<FSET? ,WIND ,WESTBIT>
		       <TELL "ea">)
	       	      (T
		       <TELL "we">)>
	 	<TELL "stward">
		<COND (<EQUAL? ,HERE ,LAN-GATE ,LION-GATE ,AT-TERRACE>
		       <COND (<AND <EQUAL? ,HERE ,LION-GATE ,AT-TERRACE>
				   <FSET? ,WIND ,WESTBIT>>
		              <COND (<EQUAL? ,HERE ,LION-GATE>
				     <TELL " past " D ,TERRACE>)>
			      <SETG HERE ,LAN-GATE>
		              <MOVE ,PROTAGONIST ,HERE>
		              <TELL " to" T ,LGATE ", where">)
			     (<AND <EQUAL? ,HERE ,LAN-GATE ,AT-TERRACE>
				   <NOT <FSET? ,WIND ,WESTBIT>>>
			      <COND (<EQUAL? ,HERE ,LAN-GATE>
				     <TELL " past " D ,TERRACE>)>
			      <SETG HERE ,LION-GATE>
			      <MOVE ,PROTAGONIST ,HERE>
			      <TELL " to" T ,BLGATE ", where">)
			     (T
			      <TELL " until">)>
		       <TELL " you collide with a crowd of ">
		       <SAY-TOURISTS>)
		      
		      (<EQUAL? ,HERE ,WABE>
		       <TELL " until you plow into" T ,THICKET>)
		      
		      (<EQUAL? ,HERE ,PAL-GATE ,FLOWER-WALK>
		       <COND (<AND <EQUAL? ,HERE ,PAL-GATE>
				   <FSET? ,WIND ,WESTBIT>>
			      <SETG HERE ,FLOWER-WALK>
			      <MOVE ,PROTAGONIST ,HERE>
			      <TELL " to" T ,FLWALK ", where">)
			     (<AND <EQUAL? ,HERE ,FLOWER-WALK>
				   <NOT <FSET? ,WIND ,WESTBIT>>>
			      <SETG HERE ,PAL-GATE>
			      <MOVE ,PROTAGONIST ,HERE>
			      <TELL " to" T ,PAL-GATE ", where">)
			     (T
			      <TELL " until">)>
		       <TELL " you careen into the ">
		       <COND (<EQUAL? ,HERE ,FLOWER-WALK>
			      <TELL "flower beds">)
			     (T
			      <SAY-TOURISTS>)>)
		      
		      (<FSET? ,WIND ,WESTBIT> 
		       <COND (<EQUAL? ,HERE ,BROAD-WALK ,ROUND-POND>
			      <COND (<EQUAL? ,HERE ,BROAD-WALK>
				     <TELL " past" T ,RPOND>)>
			      <COND (<ZERO? ,IN-PRAM?>
				     <SETG HERE ,LAN-WALK>
		                     <MOVE ,PROTAGONIST ,HERE>)>
			      <TELL " to" T ,LNWALK 
				    ", where you roll">)>
		       
		       <TELL " onto" TR ,GRASS CR>
		       <COND (<T? ,IN-PRAM?>
			      <GO-TO-LONG-WATER>
			      <RFATAL>)>
		       <GRASS-STOPS-YOU "As you stumble across the lawn" T>
		       <COND (<NOT ,IN-PRAM?>
			      <CRLF>
			      <V-LOOK>)>
		       <RFATAL>)
		      (T
		       <COND (<EQUAL? ,HERE ,LAN-WALK ,ROUND-POND>
			      <COND (<EQUAL? ,HERE ,LAN-WALK>
				     <TELL " past" T ,RPOND>)>
			      <SETG HERE ,BROAD-WALK>
			      <MOVE ,PROTAGONIST ,BROAD-WALK>
			      <TELL " to" T ,BROAD-WALK ", where">)
			     (T
			      <TELL " until">)>
		       <TELL " you careen into" T ,VICTORIA>)>
		
		<COND (<T? ,IN-PRAM?>
		       ;<SETG OLD-HERE <>>
		       <SETG IN-PRAM? <>>
		       <FCLEAR ,PRAM ,NDESCBIT>
		       <MOVE ,PRAM ,HERE>
		       <ROB ,PRAM ,HERE>
		       ;<COND (<FSET? ,WRISTWATCH ,WORNBIT>
			      <MOVE ,WRISTWATCH ,PROTAGONIST>)>
		       <TELL " and tumble out of" T ,PRAM>)>
		<PRINT ,PERIOD-CR>
		<PAIN-REGAIN>
		<COND (<NOT ,IN-PRAM?>     
		       <CRLF>
		       <GOTO ,HERE>)> 
		<RFATAL>)
	       (<VERB? CLOSE>
		<COND (<DONT-HAVE? ,PRSO>
		       <RTRUE>)
		      (<NOT <FSET? ,PRSO ,OPENBIT>>
		       <ITS-ALREADY "closed">
		       <RTRUE>)
		      (T
		       <RFALSE>)>)     
	       (T
		<RFALSE>)>>

<ROUTINE READ-SLOGAN ()
       ; <FSET ,PRSO ,SEEN>
	 <TELL 
"slogan \"All prams lead to" T ,GARDENS "\" is printed around the
outside" ,PERIOD-CR>>

<ROUTINE TREE-SWITCH ()
	 <MOVE ,PRSO ,TRINITY-TREE>
	 <FSET ,PRSO ,NDESCBIT>
	 <MOVE ,PRSI ,LAN-GATE>
	 <FCLEAR ,PRSI ,NDESCBIT>
	 <SETG P-IT-OBJECT ,PRSI>
	 <TELL CT ,PRSO 
" lodges itself in" T ,TREE " beside" T ,PRSI ".|
|
The " D ,PRSI 
" teeters uncertainly for a moment, then tumbles out of" T ,TREE " and lands at your feet" ,PERIOD-CR>
	 <RTRUE>>

<ROUTINE NICE-TRY ()
	 <TELL "Nice try. Unfortunately, ">
	 <COND (<EQUAL? ,PRSI ,HANDS <>>
		<TELL "your arm">)
	       (T
		<TELL T ,PRSI>)>
	 <TELL " isn't long enough to reach" TR ,PRSO>
	 <RTRUE>>

<ROUTINE GO-TO-LONG-WATER ()
	 <SETG IN-PRAM? <>>
	 <FCLEAR ,PRAM ,NDESCBIT>
	 <SETG FREEZE? T>
	 <SETG MINUTES 59>
	 ;<SETG HOURS 15>
	 <SETG SECONDS 45>
	 <SETG HERE ,LONG-WATER>
	 <MOVE ,PROTAGONIST ,HERE>
	 <MOVE ,PRAM ,HERE>
	 <ROB ,PRAM ,HERE>
	 <ROB ,PROTAGONIST ,HERE>
	 <COND (<FSET? ,WRISTWATCH ,WORNBIT>
		<MOVE ,WRISTWATCH ,PROTAGONIST>)>
	 <MOVE ,POCKET ,PROTAGONIST>
	 <MOVE ,PARASOL ,PROTAGONIST>
	 ;<REMOVE ,PRAM>
	 <FSET ,PRAM ,MUNGBIT>
	 <PUTP ,PRAM ,P?ACTION ,BPRAM-F>
	 <PUTP ,PRAM ,P?SDESC "broken perambulator">
	 <COND (<AND <IN? ,CRANE ,HERE>
		     <NOT <FSET? ,CRANE ,MUNGBIT>>>
		;<REMOVE ,CRANE>
		;<MOVE ,BAD-CRANE ,HERE>
	        <FCLEAR ,CRANE ,TOUCHBIT>
		<PUTP ,CRANE ,P?SDESC "crumpled piece of paper">
		<FSET ,CRANE ,MUNGBIT>
		<QUEUE I-TELL-CRANE 1>)>
	 ;<DEQUEUE I-MEEP>
	 ;<DEQUEUE I-AIR-RAID>
	 ;<DEQUEUE I-BWOMAN>
	 ;<DEQUEUE I-BOY>
	 ;<COND (<NOT <IN? ,WAND ,GIANT>>
		<MOVE ,WAND ,GIANT>)>
	 ;<DEQUEUE I-CRANE-APPEARS>
	 ;<DEQUEUE I-BIKES>
	 <KILL-INTERRUPTS>
	 <QUEUE I-LONDON-HOLE -1>
	 ;<FCLEAR ,WIND ,WESTBIT>
	 <TELL 
"You zoom down a long slope, barely missing several trees and boulders. Peering over the top of the "
D ,PRAM ", you see" T ,LWATER
" coming closer and closer. Unable to stop, and too stupid to let go of the "
D ,PARASOL ", you bravely close your eyes and pinch your nose shut" ,PERIOD-CR CR>
	 <TELL "CRASH!" CR CR>
	 ;<CLEAR-SCREEN>
       	 <V-LOOK>
	 <QUEUE I-UP-SCORE 1>
	 <PAIN-REGAIN>
	 ;<CRLF>
	 <RTRUE>>

<ROUTINE I-UP-SCORE ()
	 <UPDATE-SCORE 3>>

<ROUTINE I-TELL-CRANE ()
	 <TELL "Your paper bird didn't survive the crash very well. All that's left of it is a crumpled piece of paper." CR>>

<ROUTINE PAIN-REGAIN ()
	 <TELL CR "Painfully, you regain your footing">
	 <AND-SNAP>
	 <RTRUE>>

<ROUTINE AND-SNAP ()
	 <FCLEAR ,PARASOL ,OPENBIT>
	 <TELL " and snap" T ,PARASOL " shut" ,PERIOD-CR>
	 <RTRUE>>

<OBJECT TRINITY-TREE
	(IN LAN-GATE)
	(DESC "tree")
	(FLAGS NDESCBIT CONTBIT OPENBIT)
	(CAPACITY 100)
	(SYNONYM TREE BRANCH LEAVES)
	(ADJECTIVE TREE CROOKE OLD)
	(DESCFCN DESCRIBE-TREE)
	(ACTION TRINITY-TREE-F)>

<ROUTINE DESCRIBE-TREE ("OPTIONAL" (CONTEXT <>) "AUX" X)
	 <COND (<NOT .CONTEXT>
		<RFALSE>)>
	 <COND (<EQUAL? .CONTEXT ,M-OBJDESC?>
		       <RTRUE>)>
	 <SET X <FIRST? ,TRINITY-TREE>>
	 <TELL CR "A">
	 <COND (<FSET? .X ,VOWELBIT>
		<TELL "n">)>
         <TELL " " D .X " is wedged in the branches overhead.">
	 <RTRUE>>

<ROUTINE TRINITY-TREE-F ("AUX" (ST 0) WORD)
	 <COND (<PRSI? TRINITY-TREE>
		<COND (<IN-TBL? ,PRSA ,PUTVERBS ,NUMPUTS>
		       <TELL CT ,PRSO " tumbles out of the tree and ">
		       <LANDS-AT-YOUR-FEET>
		       <RTRUE>)>
		<RFALSE>)
	       (<VERB? EXAMINE LOOK-INSIDE SEARCH LOOK-UP>
		<TELL "It's quite a nice tree, actually">
		<SET WORD <FIRST? ,TRINITY-TREE>>
		<COND (<T? .WORD>
		       <TELL ", except for" T .WORD 
			     " wedged in its branches">)>
		<PRINT ,PERIOD-CR>
		<RTRUE>)
	       (<VERB? ENTER CLIMB-ON CLIMB-UP CLIMB-OVER SIT LIE-DOWN
		       STAND-ON STAND REACH-IN>
		<NO-FOOTHOLDS>    
		<RTRUE>)
	       (<OR <EXITING?>
		    <VERB? LEAP CLIMB-DOWN>>
		<NOT-IN>
		<RTRUE>)
	       (<VERB? SHAKE KILL KNOCK PUSH MOVE UNTIE SWING>
		<SET WORD <GET ,P-NAMW 0>>
		<TELL "The ">
		<PRINTB .WORD>
		<TELL " move">
		<COND (<NOT <EQUAL? .WORD ,W?BRANCH ,W?LEAVES>>
		       <TELL "s">)>
		<TELL " ever so slightly">
		<SET WORD <FIRST? ,TRINITY-TREE>>
		<COND (<T? .WORD>
		       <TELL "," T .WORD " not at all">)>
		<PRINT ,PERIOD-CR>
		<RTRUE>)
	       ;(<VERB? STAND-UNDER>
		<TELL ,YOURE-ALREADY "under the tree" ,PERIOD-CR>
		<RTRUE>)
	       (<VERB? OPEN CLOSE>
		<IMPOSSIBLES>
		<RTRUE>)
	       (T
		<RFALSE>)>> 
		 
<OBJECT PAN
	(IN LONG-WATER)
	(DESC "statue")
	(FDESC "A charming statue stands nearby.")
	(SYNONYM STATUE SCULPTURE PAN BOY)
	(ADJECTIVE CHARMING PETER PIPES)
	(ACTION PAN-F)>

<ROUTINE PAN-F ()
	 <COND (<VERB? EXAMINE READ>
		<TELL CT ,PAN 
" portrays a carefree little boy playing a set of pipes" ,PERIOD-CR>
		<RTRUE>)
	       (<VERB? CLIMB-ON CLIMB-OVER CLIMB-UP SIT STAND-ON ENTER
		       LIE-DOWN>
		<TELL CT ,PAN "'s design prevents this" ,PERIOD-CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>
		 
<OBJECT SIRENS
	(IN GLOBAL-OBJECTS)
	(DESC "sirens")
	(FLAGS NDESCBIT PLURALBIT)
	(SYNONYM SIRENS SIREN WAIL)
	(ADJECTIVE AIR\-RAID AIR RAID)
	(ACTION SIRENS-F)>

<ROUTINE SIRENS-F ()
	 <COND (<OR <ZERO? ,RAID?>
		    <T? ,FREEZE?>>
		<TELL ,YOU-CANT "hear any at the moment" ,PERIOD-CR>
		<RFATAL>)
	       (<VERB? LISTEN>
		<TELL CT ,PRSO " rise and fall with fateful urgency" ,PERIOD-CR>
		<RTRUE>)
	       (<VERB? WALK-TO FOLLOW>
		<V-WALK-AROUND>
		<RTRUE>)
	       ;(<IN-TBL? ,PRSA ,SEEVERBS ,NSVERBS>
		<CANT-SEE-MUCH>
		<RTRUE>)
	       (<TOUCHING? ,PRSO>
		<TELL ,CANT-FROM-HERE>
		<RTRUE>)
	       (T
		<RFALSE>)>>
		       
<OBJECT MISSILE
	(IN LOCAL-GLOBALS)
	(DESC "missile")
	(FLAGS NDESCBIT)
	(SYNONYM MISSILE ROCKET CONE)
	(ADJECTIVE LARGE SILVER METAL NOSE NUCLEAR SOVIET RUSSIAN)
	(ACTION MISSILE-F)>

"TOUCHBIT = missile noticed."

<ROUTINE MISSILE-F ()
	 <COND (<NOT <FSET? ,MISSILE ,TOUCHBIT>>
		<CANT-SEE-ANY ,MISSILE>
		<RFATAL>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HCNT 5>
		       <I-LONDON-HOLE <>> ; "No CR."
		       <RTRUE>)>
		<TELL "The ">
		<COND (<L? ,HCNT 6>
		       <TELL "slowly falling ">)
		      (T
		       <TELL "floating ">)>
		<TELL D ,MISSILE
" is impressively large, sixty or seventy feet from nose to tail, aiming straight downward. A crimson hammer and sickle are lovingly painted on the hull."
		      CR>
		<RTRUE>)
	       ;(<VERB? CLIMB-ON CLIMB-OVER RIDE SIT STAND-ON LIE-DOWN>
		<THIS-IS-NOT "Dr. Strangelove">
		<RTRUE>)
	       (<TOUCHING? ,PRSO>
		<TELL ,CANT-FROM-HERE>
		<RTRUE>)
	       (T
		<RFALSE>)>>
		      
<OBJECT LWDOOR
	(IN LOCAL-GLOBALS)
	(DESC "white door")
	(FLAGS NDESCBIT OPENBIT DOORBIT)
	(SYNONYM DOOR DOORWAY PORTAL)
	(ADJECTIVE WHITE)
	(ACTION LWDOOR-F)>

"TOUCHBIT = door seen."

<ROUTINE LWDOOR-F ()
	 <COND (<NOT <FSET? ,LWDOOR ,TOUCHBIT>>
		<CANT-SEE-ANY ,LWDOOR>
		<RFATAL>)
	       (<PRSI? ,LWDOOR>
		<RFALSE>)
	       (<VERB? EXAMINE LOOK-INSIDE SEARCH>
		<TELL 
"Looking directly at" T ,PRSO " makes you uneasy. It's as if your eyes can't decide whether it's really there or not" ,PERIOD-CR>)
	       (<OR <ENTERING?>
		    <VERB? SWIM>>
		<COND (<EQUAL? ,HERE ,IN-WATER>
		       <GO-INTO-LWDOOR>
		       <RTRUE>)>
		<TELL ,CANT-FROM-HERE>
		<RTRUE>)
	       ;(<EXITING?>
		<NOT-IN>
		<RTRUE>)
	       (<VERB? CLOSE>
		<TELL ,CANT-FROM-HERE>
		<RTRUE>)
	       (<AND <NOT <EQUAL? ,HERE ,IN-WATER>>
		     <TOUCHING? ,PRSO>>
		<TELL ,CANT-FROM-HERE>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE GO-INTO-LWDOOR ()
	 <TELL "You wade up to the door" ,PERIOD-CR>
	 <UPDATE-SCORE 4>
	 <USL>
	 <TELL "|
All color abruptly drains from the landscape. Trees, sky and sun flatten
into a spherical shell, with you at the very center. A hissing in your
ears becomes a rumble, then a roar as the walls of the shell collapse
inward, faster and faster.|
|
[You have escaped to another dimension, and have completed the " ,TRINITY
,EXCERPT ". If you were playing the real game right now, you'd have just
entered a secret universe -- a plane between fantasy and reality, filled
with curious artifacts and governed by its own logic. " ,TRINITY " leads you
on a journey back to the dawn of the atomic age ... and puts the course
of history in your hands.]" CR>
	 <FINISH>>

<OBJECT WIND
	(IN GLOBAL-OBJECTS)
	(SDESC "")
	(FLAGS NDESCBIT)
	(SYNONYM WIND BREEZE GUST)
	(ADJECTIVE WEST EAST WESTER EASTER)
	;(GENERIC GENERIC-WIND-F)
	(ACTION WIND-F)>

<ROUTINE WIND-STOPPED (DIR)
	 <TELL "The " .DIR "sterly wind seems to have stopped" ,PERIOD-CR>>  

<ROUTINE WIND-F ()
	 <COND (<NOT <EQUAL? ,GAME-FLAG 3>>
		<CANT-SEE-ANY>
		<RTRUE>)
	       (<AND <ADJ-USED ,WIND ,W?EAST ,W?EASTER>
		     <FSET? ,WIND ,WESTBIT>>
		<WIND-STOPPED "ea">
		<RTRUE>)
	       (<AND <ADJ-USED ,WIND ,W?WESTER ,W?WEST>
		     <NOT <FSET? ,WIND ,WESTBIT>>>
		<WIND-STOPPED "we">
		<RTRUE>)
	      (<PRSI? ,WIND>
		<RFALSE>)
	       (<VERB? EXAMINE>
		<TELL ,YOU-CANT "see wind!" CR>
		<RTRUE>)
	       (<AND <VERB? LISTEN TOUCH>
		     <EQUAL? ,PRSI <> ,HANDS>>
		<TELL "It blows briskly through the trees" ,PERIOD-CR>
		<RTRUE>)
	       (<VERB? SMELL>
		<TELL "It smells unusually fresh" ,PERIOD-CR>
		<RTRUE>)
	       (<VERB? ON OFF>
		<IMPOSSIBLES>
	        <RTRUE>)
	       (T
		<RFALSE>)>>
		
"EVENTS"


;<GLOBAL CLOCK-WAIT? <>>
;<GLOBAL CLOCK-HAND <>>
<GLOBAL HOURS 15>
<GLOBAL MINUTES 30>
<GLOBAL SECONDS 0>
<GLOBAL FREEZE? <>>
<GLOBAL NOTIFY? 0>
;<GLOBAL QUIET? <>>

<ROUTINE I-BLOW ("AUX" (ST 0))
	 <FCLEAR ,TRINITY-TREE ,NDESCBIT>
	 <MOVE ,PARASOL ,TRINITY-TREE>
	 <FCLEAR ,PARASOL ,OPENBIT>
	 <SETG P-HER-OBJECT ,NOT-HERE-OBJECT>
	 <SETG P-IT-OBJECT ,PARASOL>
	 <FSET ,JWOMAN ,CHILLY>
	 <FSET ,JWOMAN ,NDESCBIT>
	 <TELL CR "A strong gust of wind snatches" T ,PARASOL
" out of" T ,JWOMAN
"'s hands and sweeps it into the branches of the tree.|
|
The woman circles the tree a few times, gazing helplessly upward. That "
D ,PARASOL 
" obviously means a lot to her, for a wistful tear is running down her cheek. But nobody except you seems to notice her loss.|
|
After a few moments," T ,JWOMAN
" dries her eyes, gives the tree a vicious little kick and shuffles away down" TR ,LNWALK>
	 <RTRUE>>

<ROUTINE I-CRANE-APPEARS ()
	 <COND (<NOT <EQUAL? ,HERE ,ROUND-POND>>
		<RFALSE>)
	       (<FSET? ,CRANE ,NDESCBIT>     ; "Buys one move"
		<FCLEAR ,CRANE ,NDESCBIT>
		;<FSET ,CRANE ,TOUCHBIT>
		<RFALSE>)
	       (T
		<DEQUEUE I-CRANE-APPEARS>
		<MOVE ,CRANE ,RPOND>
		<SETG P-IT-OBJECT ,CRANE>
		<TELL 
CR "One of" T ,BOAT " on" T ,RPOND " catches your eye. " CT ,WIND 
" blows it closer, and you realize that the white sails are actually wings.
It's a folded " D ,CRANE ", floating just within reach" ,PERIOD-CR>
		<RTRUE>)>>

<GLOBAL LAYAWAY 3>

<ROUTINE I-BWOMAN ("AUX" (COIN? <>) (BAG? <>) (BOTH? <>))
	 
	 <COND (<NOT <EQUAL? ,HERE ,BROAD-WALK>>
		<RFALSE>)>
	 
	 <SETG P-HER-OBJECT ,BWOMAN>
	 <COND (<T? ,RAID?>
		<COND (<FSET? ,BWOMAN ,SEEN>
		       <FCLEAR ,BWOMAN ,SEEN>
		       <RFALSE>)
		      (<PROB 50>
		       <RFALSE>)>
		<CRLF>
		<BWOMAN-CRY>
		<RTRUE>)>
	 <COND (<IN? ,COIN ,BWOMAN>
		<SETG P-IT-OBJECT ,COIN>
		<SET COIN? T>)>
	 <COND (<IN? ,BAG ,BWOMAN>
		<SETG P-IT-OBJECT ,BAG>
		<SET BAG? T>)>
	 <COND (<AND <ZERO? .BAG?>
		     <ZERO? .COIN?>>
		<COND (<FSET? ,BWOMAN ,SEEN>
		       <FCLEAR ,BWOMAN ,SEEN>
		       <RFALSE>)
		      (<PROB 50>
		       <RFALSE>)>
		<CRLF>
		<BWOMAN-CRY>
	        <RTRUE>)
	       (<AND <T? .BAG?>
		     <T? .COIN?>>
		<SET BOTH? T>)>
	 <SETG LAYAWAY <- ,LAYAWAY 1>>
	 <COND (<ZERO? ,LAYAWAY>
		<FSET ,BWOMAN ,SEEN>
		<TELL CR CT ,BWOMAN " shrugs and ">
		<COND (<OR <T? .BOTH?>
			   <T? .COIN?>>
		       <REMOVE ,COIN>
		       <COND (<T? .BAG?>
			      <REMOVE ,BAG>)>
		       <TELL "pockets your change">)
		      (T
		       <REMOVE ,BAG>
		       <TELL "puts your bag away">)>
		<TELL ". \"Keep ">
		<COND (<T? .BOTH?>
		       <TELL "'em">)
		      (T
		       <TELL "it">)>
		<TELL " myself,\" she mutters" ,PERIOD-CR>
		<RTRUE>)
	       (T
		<FSET ,BWOMAN ,SEEN>
		<CRLF>
		<COND (<EQUAL? ,LAYAWAY 1>
		       <TELL CT ,BWOMAN " tugs your sleeve impatiently. ">)>
		<TELL "\"Take yer ">
		<COND (<AND <T? .COIN?>
			    <T? .BAG?>>
		       <TELL "bag and change">)
		      (<T? .BAG?>
		       <TELL "bag">)
		      (T
		       <TELL "change">)>
		<TELL ", guv'ner">
		<COND (<EQUAL? ,LAYAWAY 1>
		       <TELL "! Ain't got all day">)>
		<TELL "!\"" CR>)>
	 <RTRUE>>

<ROUTINE BWOMAN-CRY ("AUX" (X 0))
	 <COND (<T? ,RAID?>
		<SET X 1>)>
	 <FSET ,BWOMAN ,SEEN>
	 <TELL "\"" <PICK-NEXT <GET ,BWOMAN-CRIES .X>> "!\"">
	 <COND (<PROB 50>
		<TELL <PICK-NEXT <GET ,BWOMAN-CRIES 2>> "s" T ,BWOMAN>
		<PRINTC 46>)>
	 <CRLF>
	 <RTRUE>> 
		
<GLOBAL BWOMAN-CRIES
	<PTABLE
	 <LTABLE 2
	 	 "Thirty p! Thirty p a bag"
	         "Feed the hungry birds"
	 	 "Thirty p for the starving birds"
	 	 "Thirty p"
	 	 "Feed the birds">
	 <LTABLE 2
	 	 "Sirens! The sirens"
	 	 "Lord, have mercy"
	 	 "What to do, what to do">
	 <LTABLE 2
		 " crie" " holler" " call" " yell">>>

<ROUTINE I-RUBY ("OPTIONAL" (CR T))
	 <COND (<FSET? ,RUBY ,CHILLY>	 ; "1-move delay."
		<FCLEAR ,RUBY ,CHILLY>
		<RFALSE>)
	       (<NOT <VISIBLE? ,RUBY>>
		<RFALSE>)
	       (T
		<COND (<ZERO? .CR>
		       <TELL "As you start to move away ">)
		      (T
		       <TELL CR "All at once ">)>
		<MEEP-GETS-RUBY>
		<RTRUE>)>>
		
<GLOBAL RUBYROOM <>>

<ROUTINE MEEP-GETS-RUBY ()
	 <SETG RUBYROOM ,HERE>
	 <FCLEAR ,RUBY ,CHILLY>
	 <FSET ,RUBY ,TOUCHBIT>
	 <DEQUEUE I-RUBY>
	 <QUEUE I-MEEP -1>
	 <SETG P-IT-OBJECT ,NOT-HERE-OBJECT>
	 <MOVE ,MEEP ,HERE>
	 <TELL "a very large bird races out ">
	 <COND (<EQUAL? ,HERE ,WABE>
		<TELL "of" T ,THICKET>)
	       (T
		<TELL "from behind a tree">)>
	 <TELL ". It ">
	 <COND (<IN? ,RUBY ,PRAM>
		<TELL "leaps into the open pram, ">)>
	 <TELL "snatches away" T ,RUBY " with its beak">
	 <COND (<IN? ,RUBY ,PRAM>
		T)
	       (<NOT <EQUAL? ,HERE ,WABE>>
		<TELL ", " <PICK-NEXT <GET ,MEEP-TABLE 0>>>)
	       (T
		<TELL ", scoots between your legs">)>
	 <MOVE ,RUBY ,MEEP>
	 <MOVE-MEEP>
	 <COND (<EQUAL? ,HERE ,BROAD-WALK>
		;<FCLEAR ,MEEP ,TOLD>
		;<FCLEAR ,RUBY ,TOLD>
		<TELL CR "\"It's time!\" shrieks" TR ,BWOMAN>)>
	 <COND (<NOT <FSET? ,WIND ,WESTBIT>>
		<PUTP ,WIND ,P?SDESC "west wind">
		<FSET ,WIND ,WESTBIT>
		<TELL CR "The east wind" 
" softens to a whisper and dies away.|
|
Blowing leaves settle to the ground, and the trees are still. Then a fresh gust blows in from the west" ,PERIOD-CR>)>
	 <RTRUE>>

<ROUTINE I-MEEP ()
	 <COND (<NOT <EQUAL? ,HERE ,MEEP-ROOM>>
		<RFALSE>)>
	 <TELL CR 
"The large bird you saw before is here! You catch a glimpse of the " 
D ,RUBY " in its beak as it " <PICK-NEXT <GET ,MEEP-TABLE 0>>>
	 <MOVE-MEEP>
	 <RTRUE>>

<ROUTINE I-MEEP-TAKES-OFF ()
	 <COND (<EQUAL? ,MEEP-ROOM <>>
		<REMOVE ,MEEP>)
	       (T
		<MOVE ,MEEP ,MEEP-ROOM>)>>

<GLOBAL MEEP-TABLE
	<PTABLE
	 <LTABLE 2
	 	 "zigzags through a group of tourists" 
	 	 "races between the wheels of a perambulator"
	 	 "dodges a startled nanny">
	 <PTABLE
	         <PTABLE BROAD-WALK "east" ROUND-POND>
		 <PTABLE ROUND-POND "east" LAN-WALK>
		 <PTABLE LION-GATE "southeast" ROUND-POND>
		 <PTABLE LAN-GATE "south" LAN-WALK>
		 <PTABLE PAL-GATE "east" FLOWER-WALK>
		 <PTABLE FLOWER-WALK "north" LAN-WALK>
		 <PTABLE AT-TERRACE "southeast" LAN-WALK>
		 <PTABLE WABE "northeast" LAN-WALK>
		 <PTABLE LONG-WATER "west" LAN-WALK>
		 <PTABLE IN-WATER "west" LAN-WALK>
		 0>
	 ;<LTABLE 2
		 "is eyeing you with interest"
		 "struts around the top of the toadstool"
		 "cocks its head to watch you"
		 "adjusts the ruby in its beak">
	 ;<LTABLE 2
	 	 "scampers around your feet"
	 	 "scratches impatiently on the ground"
	 	 "looks up at you inquisitively"
	 	 "emits a brief squawk"
		 "watches every move you make"	 	 
	 	 "scoots between your legs"
		 "is eyeing you with interest">
	 ;<LTABLE 2
		 "prance" "hop" "race" "strut">
	 ;<LTABLE 2
		 "cocks its head intelligently"
		 "listens intently"
		 "obviously understands you">
	 ;<LTABLE 2
		 "doesn't respond"
		 "decides to ignore you"
		 "chooses not to respond"
		 "pays you no heed">>>

<GLOBAL MEEP-ROOM <>>

;<ROUTINE I-MEEP-HELP ()
	 <QUEUE I-MEEP-HELP -1>
	 <TELL "[The meep is now at ">
	 <COND (<NOT ,MEEP-ROOM>
		<TELL "Long Water">)
	       (T
		<TELL D ,MEEP-ROOM ".">)>
	 <COND (<NOT <EQUAL? <LOC ,MEEP> ,MEEP-ROOM>>
		<TELL 
" Temporarily, he's also referencable from " D <LOC ,MEEP> ".">)>
	 <TELL " The meep flag is currently ">
	 <COND (,MEEP-FLAG
		<TELL "on">)
	       (T
		<TELL "shut off">)>
	 <TELL ".]" CR>> 

<ROUTINE MOVE-MEEP ("AUX" (CNT 0) X TBL)
	 <PCLEAR>
	 <SETG P-IT-OBJECT ,NOT-HERE-OBJECT>
	 <TELL " and disappears to the ">
	 <QUEUE I-MEEP-TAKES-OFF 2>
	 <COND (<NOT <IN? ,MEEP ,HERE>>
		<MOVE ,MEEP ,HERE>)>
	 <COND (<EQUAL? ,HERE ,LAN-WALK>
		<SETG MEEP-ROOM <>>
		<TELL "east">)
	       (T
		<SET X <GET ,MEEP-TABLE 1>>
		<REPEAT ()
		 	<SET TBL <GET .X .CNT>>
		 	<COND ; (<ZERO? .TBL> ; "Delete when debugged."
			         <TELL "[BUG!]" CR>
			         <RTRUE>)
		       	      (<EQUAL? ,HERE <GET .TBL 0>>
		               <SETG MEEP-ROOM <GET .TBL 2>>
			       <TELL <GET .TBL 1>>
			       <RETURN>)>
		 	<INC CNT>>)>
	 <COND (<NOT <FSET? ,TRINITY-TREE ,FEMALEBIT>>
		<FSET ,TRINITY-TREE ,FEMALEBIT>
		<TELL 
". If you didn't know better, you'd swear that bird was a " D ,MEEP>)>
	 <PRINT ,PERIOD-CR>
	 <RTRUE>>
	 
;<ROUTINE I-FMEEP ()
	 <COND (<NOT <EQUAL? ,HERE ,ON-ISLE>>
		<RFALSE>)
	       (<FSET? ,TS6-DOOR ,OPENBIT>
		<DEQUEUE I-FMEEP>
		<MEEP-TO-ZERO>
		<TELL CR ,CTHEMEEP
"gives you a curt nod of acknowledgement. Then it flutters off" T ,TS6
", prances through the open door and disappears" ,PERIOD-CR>
		<RTRUE>)
	       (<FSET? ,MEEP ,SEEN>
		<FCLEAR ,MEEP ,SEEN>
		<RFALSE>)
	       (<PROB 50>
		<RFALSE>)>
	 <FSET ,MEEP ,SEEN>
	 <TELL CR ,CTHEMEEP <PICK-NEXT <GET ,MEEP-TABLE 2>> ,PERIOD-CR>
	 <RTRUE>>
	       
<GLOBAL RAID? 0>

<ROUTINE I-AIR-RAID ("AUX" (Q <>))
	 <COND (<ZERO? ,RAID?>
		<COND (<AND <EQUAL? ,MINUTES 57>
			    <EQUAL? ,SECONDS 45>>
		       <PUTP ,BWOMAN ,P?FDESC 
"A forgotten woman, too aged to run, is sitting nearby.">
		       <SETG RAID? 10>)
		      (T
		       <RFALSE>)>)>
	 <COND (<EQUAL? ,HERE ,WABE>
		<SET Q T>)>
	 <SETG RAID? <- ,RAID? 1>>
	 <CRLF>
	 <COND (<EQUAL? ,RAID? 9>
		<FSET ,TRINITY-TREE ,TOUCHBIT>
		<TELL "A steady drone begins to rise above" T ,WIND
". As it grows louder and more insistent, you recognize a sound
you've heard only in old war movies. Air-raid sirens" ,PERIOD-CR>
		;<DO-QUOTE ,THOREAU>
		<RTRUE>)
	       
	       (<EQUAL? ,RAID? 8>
		<TELL "Another siren joins the first">
		<COND (<ZERO? .Q>
		       <TELL 
". Tourists search the sky, eyes wide with apprehension">)>
		<PRINT ,PERIOD-CR>
		<COND (<AND <EQUAL? ,HERE ,AT-TERRACE>
			    <IN? ,BOY ,HERE>>
		       <TELL CR "The boy slowly pulls his " D ,PHONES 
" off and glances furtively around. Then he picks up the dish and races off between the prams" ,PERIOD-CR>
		       <LAST-BUBBLE>)>
		<BOY-SCRAMS>
		<RTRUE>)
	       
	       (<EQUAL? ,RAID? 7>
		<TELL "Sirens are howling all around you">
		<COND (<ZERO? .Q>
		       <TELL 
". Children, sensing fear in the air, begin to whimper for their " 
D ,NANNIES>)>
		<PRINT ,PERIOD-CR>
		<RTRUE>)
	       
	       (<EQUAL? ,RAID? 6>
		<TELL "Confused shouts can be heard in the distance">
		<COND (<ZERO? .Q>
		       <TELL ". Worried " D ,NANNIES " turn their " D ,GPRAM
                             " toward the gates">)>
		<PRINT ,PERIOD-CR>
		<RTRUE>)
	       
	       (<EQUAL? ,RAID? 5>
		<TELL 
"Police and fire alarms join in the rising din">
		<COND (<ZERO? .Q>
		       <TELL
" as the crowd rushes to escape the open sky of the Gardens">)>
		<PRINT ,PERIOD-CR>
		<RTRUE>)
	       
	       (<EQUAL? ,RAID? 4>
		<TELL 
"Distant megaphones can be heard barking orders">
		<COND (<ZERO? .Q>
		       <TELL ". Frightened " D ,TOURISTS 
" and screaming " D ,GPRAM " flee in every " D ,INTDIR>)>
		<PRINT ,PERIOD-CR>
		<RTRUE>)
	       
	       (<EQUAL? ,RAID? 3>
		<TELL
"A round of gunfire drowns out the wailing " D ,SIRENS>
		<COND (<ZERO? .Q>
		       <TELL
". Tourists cover their heads and trample one another in blind panic">)>
		<PRINT ,PERIOD-CR>
		<RTRUE>)
	       
	       (<EQUAL? ,RAID? 2>
		<TELL CT ,GROUND
" trembles with the roar of jet interceptors">
		<COND (<ZERO? .Q>
		       <TELL
". Terror-stricken " D ,TOURISTS " dive for cover">)>
		<PRINT ,PERIOD-CR>
		<RTRUE>)
	       
	       (<EQUAL? ,RAID? 1>
		<TELL CT ,WIND>
	 	<JIGS-UP
" falls silent, and a new star flashes to life over the doomed city.">)>
	 <RTRUE>> 

<GLOBAL HCNT 7>

<ROUTINE I-LONDON-HOLE ("OPTIONAL" (CR? T))
	 <DEC HCNT>
	 <COND (<NOT <EQUAL? ,HERE ,LONG-WATER ,IN-WATER>>
		<RFALSE>)
	       (<T? .CR?>
		<CRLF>)>
	 <COND (<EQUAL? ,HCNT 6>
		<TELL 
CT ,WIND " is still. Everything is very quiet" ,PERIOD-CR>
		<RTRUE>)
	       
	       (<EQUAL? ,HCNT 5>
		;<PUTP ,LONG-WATER ,P?OVERHEAD ,MISSILE>
		;<PUTP ,IN-WATER ,P?OVERHEAD ,MISSILE>
		<FSET ,MISSILE ,TOUCHBIT>
		<SETG P-IT-OBJECT ,MISSILE>
		<TELL 
"A gleam overhead catches your eye.|
|
Oh, dear. A " D ,MISSILE " is hanging motionless in the sky" ,PERIOD-CR>
		<RTRUE>)
	       
	       (<EQUAL? ,HCNT 4>
		<FSET ,LWDOOR ,TOUCHBIT>
		;<PUTP ,LONG-WATER ,P?SEE-E ,LWDOOR>
		;<PUTP ,IN-WATER ,P?SEE-E ,LWDOOR>
		<SETG P-IT-OBJECT ,LWDOOR>
		<TELL CT ,MISSILE
" isn't completely motionless. It's falling very, very slowly towards the " 
D ,LWATER ,PERIOD-CR CR "Your eyes follow" T ,MISSILE 
"'s trajectory downward, where you notice another peculiar phenomenon. It looks like a " 
D ,LWDOOR ", suspended just above the surface of" TR ,WATER>
		<RTRUE>)
	       
	       (<EQUAL? ,HCNT 3>
		<TELL 
"A flock of ravens glides into view! They circle over the "
D ,LWATER " and disappear through the open " D ,LWDOOR ,PERIOD-CR CR CT ,MISSILE 
" continues its slow descent" ,PERIOD-CR>
		<RTRUE>)
	       
	       (<EQUAL? ,HCNT 2>
		<TELL "Swans and ducks paddle through the open " 
D ,LWDOOR ", vanishing without a trace" ,PERIOD-CR CR CT ,MISSILE 
" is only a few dozen yards above" TR ,FRONT-DOOR>
		<RTRUE>)
	       
	       (<EQUAL? ,HCNT 1>
		<TELL 
"A log is being pushed across" T ,LWATER 
" by a pair of mallards. Its surface is crowded with squirrels, chipmunks
and other inhabitants of the " 
D ,GARDENS ", including" T ,MEEP " you met before">
		<ENTICINGLY>
		<TELL " as the log sails through" TR ,LWDOOR CR
		      CT ,MISSILE " is closing in fast" ,PERIOD-CR>
		<RTRUE>)>
	 
	 <TELL
CT ,MISSILE "'s nose nudges into" T ,LWDOOR ". Then a searing glare
envelops" T ,LWATER>
	 <JIGS-UP
 ", and you discover what it feels like to be vaporized in extreme slow motion.">>   
			       			       
<GLOBAL BACTION 0>

"0 = giant dips stick, 1 = blows bubble, 2 = listens to music."

<ROUTINE I-BUBBLES ()
	 <COND (<ZERO? ,BACTION>
		<CRLF>
		<BOY-DIPS>
		<PRINT ,PERIOD-CR>
		<RTRUE>)
	       (<EQUAL? ,BACTION 1>
		<CRLF>
		<BOY-BLOWS-BUBBLE>
		<PRINT ,PERIOD-CR>
		<RTRUE>)
	       (T
		<CRLF>
		<BOY-WAITS>)>
	 <RTRUE>>

<ROUTINE I-BOY ("OPTIONAL" (CR T))
	 <COND (<NOT <EQUAL? ,HERE ,AT-TERRACE>>
		<SETG BACTION 0>
		<RFALSE>)
	       (<T? .CR>
		<CRLF>)>
	 <COND (<ZERO? ,BACTION>
		<BOY-DIPS>
		<PRINT ,PERIOD-CR>
		<RTRUE>)
	       (<EQUAL? ,BACTION 1>
		<BOY-BLOWS-BUBBLE>
		<PRINT ,PERIOD-CR>
		<RTRUE>)
	       (T
		<BOY-WAITS>)>
	 <RTRUE>>

<ROUTINE BOY-DIPS ()
	 <INC BACTION>
	 <TELL CT ,BOY " dips" T ,WAND 
	       " in the dish and swishes it around">
	 <RTRUE>>

<ROUTINE BOY-BLOWS-BUBBLE ()
	 <INC BACTION>
	 <FCLEAR ,HERE ,NOALL>
	 <TELL CT ,BOY " pulls" T ,WAND 
" out of the dish, puts it to his lips and blows a big " D ,SBUBBLE>
	 <RTRUE>>

<ROUTINE BOY-WAITS ()
	 <COND (<EQUAL? ,BACTION 2>
		<SETG BACTION 0>)>
	 <TELL CT ,BOY <PICK-NEXT ,BOY-BOPS> " to the headphone music">
	 <FSET ,HERE ,NOALL>
	 <TELL " as" T ,SBUBBLE>
	 <COND (<NOT <FSET? ,BOY ,SEEN>>
		<FSET ,BOY ,SEEN>
		<SAY-POP>
		<PRINT ,PERIOD-CR>
		;<DO-QUOTE ,POPE>
		<RTRUE>)
	       (<PROB 50>
		<TELL " floats away" ,PERIOD-CR>
		<RTRUE>)
	       (T
		<SAY-POP>
		<PRINT ,PERIOD-CR>)>
	 <RTRUE>>

<ROUTINE SAY-POP ()
	 <TELL " bursts with a flabby pop">>

<GLOBAL BOY-BOPS
	<LTABLE 2 
	" snaps his fingers"
	" bobs his head"
        " kicks his feet"
	" hums softly">>

;"SPECIFIC TRINITY KERNAL"

;<CONSTANT NHAVERBS 12> "Number of HAVEVERBS."

;<GLOBAL HAVEVERBS
	<TABLE 0 V?DROP V?PUT V?PUT-ON V?GIVE V?SHOW V?FEED V?THROW
	        V?PUT-UNDER V?PUT-BEHIND V?TAKE-WITH
	        V?OPEN V?CLOSE>>

<CONSTANT NTVERBS 13> "Number of TALKVERBS."

<GLOBAL TALKVERBS
	<TABLE 0
	 V?TELL V?TELL-ABOUT V?ASK-ABOUT V?ASK-FOR V?WHAT V?WHERE
	 V?ALARM V?HELLO V?GOODBYE V?SAY V?YELL V?THANK V?WAVE>>

;<CONSTANT NTOUCHES 48> "Number of TOUCHVERBS"

;<GLOBAL TOUCHVERBS
	<TABLE 0
	 V?TAKE V?TAKE-OFF V?PUT V?PUT-ON V?PUT-UNDER V?PUT-BEHIND
	 V?EMPTY V?REACH-IN V?TOUCH V?KILL V?KICK V?MOVE V?PUSH
	 V?PUSH-DIR V?LOWER V?RAISE V?SHAKE V?SWING V?OPEN V?CLOSE
	 V?LOCK V?UNLOCK V?SCREW V?UNSCREW V?TIE V?UNTIE V?ON V?OFF
	 V?CUT V?RIP V?MUNG V?DIG V?FILL V?DEFLATE V?CLEAN V?REPAIR
	 V?FLUSH V?PICK V?UNSCREW-FROM V?GIVE V?STAND-ON
	 V?SIT V?LIE-DOWN V?EAT V?BITE V?TASTE V?DRINK V?DRINK-FROM>>

<CONSTANT NHVERBS 13> "Number of HURTVERBS."

<GLOBAL HURTVERBS
	<TABLE 0
	 V?KICK V?KILL V?MUNG V?KNOCK V?KICK V?CUT V?RIP V?BITE V?RAPE
	 V?SUCK V?SHAKE V?UNDRESS V?PUSH>>

<CONSTANT NUMPUTS 6> "# PUTVERBS."

<GLOBAL PUTVERBS
	<TABLE 0 V?PUT V?PUT-ON V?PUT-UNDER V?PUT-BEHIND V?THROW
	        V?EMPTY>>

<CONSTANT NMVERBS 11> "Number of MOVEVERBS."

<GLOBAL MOVEVERBS
	<TABLE 0
	 V?TAKE V?TAKE-OFF V?MOVE V?PUSH V?RAISE V?LOWER V?SHAKE V?OPEN
	 V?CLOSE V?POINT V?SWING>>

<ROUTINE GETTING-INTO? ()
	 <COND (<OR <ENTERING?>
		    <VERB? CLIMB-ON CLIMB-UP CLIMB-OVER CROSS STAND-ON SIT
		           LIE-DOWN CLIMB-DOWN>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE ENTERING? ()
	 <COND (<VERB? BOARD WALK-TO ENTER FOLLOW LEAP USE>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE EXITING? ()
	 <COND (<VERB? DISEMBARK EXIT LEAVE TAKE-OFF>
		<RTRUE>)
	       (T
		<RFALSE>)>>

;<ROUTINE HANDLE-PLACE? (INSIDE "OPTIONAL" (N <>) (E <>) (S <>) (W <>)
			                  (OUT <>) "AUX" (CNT 0))
	 <COND (<T? .N>
		<INC CNT>)>
	 <COND (<T? .E>
	        <INC CNT>)>
	 <COND (<T? .S>
		<INC CNT>)>
	 <COND (<T? .W>
	        <INC CNT>)>
       ; <COND (<T? .OUT>
		<INC CNT>)>
	 <COND (<VERB? EXAMINE LOOK-INSIDE LOOK-DOWN SEARCH>
		<COND (<EQUAL? ,HERE .INSIDE>
		       <V-LOOK>)
		      (T
		       <CANT-SEE-MUCH>)>
		<RTRUE>)
	       (<VERB? ENTER WALK-TO>
		<COND (<EQUAL? ,HERE .INSIDE>
		       <ALREADY-IN>)
		      (<EQUAL? ,HERE .N>
		       <DO-WALK ,P?SOUTH>)
		      (<EQUAL? ,HERE .E>
		       <DO-WALK ,P?WEST>)
		      (<EQUAL? ,HERE .S>
		       <DO-WALK ,P?NORTH>)
		      (<EQUAL? ,HERE .W>
		       <DO-WALK ,P?EAST>)
		      (<EQUAL? ,HERE .OUT>
		       <DO-WALK ,P?IN>)
		      (T
		       <V-WALK-AROUND>)>
		<RTRUE>)
	       (<EXITING?>
		<COND (<NOT <EQUAL? ,HERE .INSIDE>>
		       <NOT-IN>)
		      (<G? .CNT 1>
		       <V-WALK-AROUND>)
		      (T
		       <DO-WALK ,P?OUT>)>
		<RTRUE>)
	       (<AND <PRSO?>
		     <IN-TBL? ,PRSA ,MOVEVERBS ,NMVERBS>>
		<IMPOSSIBLES>
		<RTRUE>)
	       (<AND <NOT <EQUAL? ,HERE .INSIDE>>
		     <TOUCHING? ,PRSO>>
		<TELL ,CANT-FROM-HERE>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE CANT-SEE-ANY ("OPTIONAL" (THING <>))
	 <COND (<NOT .THING>
	       <SET THING ,PRSO>)>
	 <TELL ,YOU-CANT-SEE-ANY D .THING " here!" CR>>

<ROUTINE NOUN-USED (OBJ WORD1 "OPTIONAL" (WORD2 <>) "AUX" O I)
	 <SET O <GET ,P-NAMW 0>>
	 <SET I <GET ,P-NAMW 1>>
	 ;<SET OOF <GET ,P-OFW 0>>
	 ;<SET IOF <GET ,P-OFW 1>>
	 <COND (<OR <AND <EQUAL? .OBJ ,PRSO>
			 <EQUAL? .WORD1 .O ;.OOF>>
		    <AND <EQUAL? .OBJ ,PRSI>
			 <EQUAL? .WORD1 .I ;.IOF>>>
		<RTRUE>)
	       (<ZERO? .WORD2>
		<RFALSE>)
	       (<OR <AND <EQUAL? .OBJ ,PRSO>
			 <EQUAL? .WORD2 .O ;.OOF>>
		    <AND <EQUAL? .OBJ ,PRSI>
			 <EQUAL? .WORD2 .I ;.IOF>>>
		<RTRUE>)
	       ;(<ZERO? .WORD3>
		<RFALSE>)
	       ;(<OR <AND <EQUAL? .OBJ ,PRSO>
			 <EQUAL? .WORD3 .O ;.OOF>>
		    <AND <EQUAL? .OBJ ,PRSI>
			 <EQUAL? .WORD3 .I ;.IOF>>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE ADJ-USED (OBJ WORD1 "OPTIONAL" (WORD2 <>) "AUX" O I)
	 <SET O <GET ,P-ADJW 0>>
	 <SET I <GET ,P-ADJW 1>>
	 <COND (<OR <AND <EQUAL? .OBJ ,PRSO>
			 <EQUAL? .O .WORD1>>
		    <AND ,PRSI
			 <EQUAL? .OBJ ,PRSI>
			 <EQUAL? .I .WORD1>>>
		<RTRUE>)
	       (<ZERO? .WORD2>
		<RFALSE>)
	       (<OR <AND <EQUAL? .OBJ ,PRSO>
			 <EQUAL? .O .WORD2>>
		    <AND ,PRSI
			 <EQUAL? .OBJ ,PRSI>
			 <EQUAL? .I .WORD2>>>
		<RTRUE>)
	       ;(<ZERO? .WORD3>
		<RFALSE>)
	       ;(<OR <AND <EQUAL? .OBJ ,PRSO>
			 <EQUAL? .O .WORD3>>
		    <AND ,PRSI
			 <EQUAL? .OBJ ,PRSI>
			 <EQUAL? .I .WORD3>>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE PCLEAR ()
	 <SETG P-CONT <>>
	 <SETG QUOTE-FLAG <>>
	 <RTRUE>>

<ROUTINE LANDS-AT-YOUR-FEET ("OPTIONAL" (OBJ <>))
	 <COND (<ZERO? .OBJ>
		<SET OBJ ,PRSO>)>
	 <COND (<HERE? IN-WATER>
		<REMOVE .OBJ>
		;<TELL T .OBJ " ">
		<COND (<OR <EQUAL? .OBJ ,CRANE>
			   <EQUAL? .OBJ ,BAG>
			   <AND <EQUAL? .OBJ ,PARASOL>
				<FSET? .OBJ ,OPENBIT>>>
		       <TELL "float">
		       <COND (<NOT <FSET? .OBJ ,PLURALBIT>>
			      <TELL "s">)>
		       <TELL " away across ">)
		      (T
		       <TELL "disappear">
		       <COND (<NOT <FSET? .OBJ ,PLURALBIT>>
			      <TELL "s">)>
		       <TELL " into ">)>
		<TELL TR ,LWATER>
		<RTRUE>)
	       (T
		<MOVE .OBJ ,HERE>
		<TELL "land">
		<COND (<NOT <FSET? .OBJ ,PLURALBIT>>
		       <TELL "s">)>
		<TELL " at your feet" ,PERIOD-CR>)>
	 <RTRUE>>

<ROUTINE PRSO-SLIDES-OFF-PRSI ()
	 <TELL CT ,PRSO " slide">
	 <COND (<NOT <FSET? ,PRSO ,PLURALBIT>>
		<TELL "s">)>
	 <TELL " off" T ,PRSI " and ">
	 <LANDS-AT-YOUR-FEET>
	 <RTRUE>>

<ROUTINE ITS-ALREADY (STR)
	 <TELL "It's already " .STR ,PERIOD-CR>
	 <RTRUE>>

<ROUTINE DONT-HAVE? (OBJ "AUX" L O)
	 <SET L <LOC .OBJ>>
	 <COND (<ZERO? .L>
		T)
	       (<EQUAL? .L ,WINNER>
		<RFALSE>)
	       (<AND <IN? .L ,PROTAGONIST>
		     <EQUAL? ,WINNER ,PROTAGONIST>>
	      	<SET O ,PRSO>
		<SETG PRSO .OBJ>
		<COND (<ITAKE <>>
		       <TELL "[taking" T ,PRSO>
		       <COND (<FSET? .L ,CONTBIT>
			      <TELL " out of ">)
			     (T
			      <TELL " off ">)>
		       <TELL T .L " first]" CR CR>
		       <SETG PRSO .O>
		       <THIS-IS-IT ,PRSO>
		       <RFALSE>)
		      (T
		       <SETG PRSO .O>
		       <TELL "You'd have to take" T .OBJ " ">
	               <COND (<FSET? .L ,SURFACEBIT>
		              <TELL "off">)
		             (T
		              <TELL "out">)>
	               <TELL " of" T .L " first" ,PERIOD-CR>
		       <RTRUE>)>)>
	 <WINNER-NOT-HOLDING>
	 <COND (<T? .OBJ>
		<COND (<FSET? .OBJ ,PLURALBIT>
		       <TELL " any ">)>
		<TELL T .OBJ>)
	       (T
		<TELL " " D ,NOT-HERE-OBJECT>)>
	 <PRINT ,PERIOD-CR>
	 <RTRUE>>

<ROUTINE ITS-CLOSED ("OPTIONAL" (OBJ <>))
	 <COND (<ZERO? .OBJ>
		<SET OBJ ,PRSO>)>
	 <THIS-IS-IT .OBJ>
	 <TELL CT .OBJ>
	 <IS-ARE .OBJ>
	 <TELL "closed" ,PERIOD-CR>
	 <RTRUE>>

<ROUTINE YOUD-HAVE-TO (STR THING)
	 <THIS-IS-IT .THING>
	 <TELL "You'd have to " .STR>
	 <TELL T .THING " to do that" ,PERIOD-CR>
	 <RTRUE>>

<ROUTINE UPDATE-SCORE ("OPTIONAL" (PTS 1) (CR T))
	 <SETG SCORE <+ ,SCORE .PTS>>
	 <COND (<AND <EQUAL? ,GAME-FLAG 4>
		     <EQUAL? ,HERE ,INSIDE-GRAVE> ;"Only TAKE BONE in grave"
		     <EQUAL? ,PRSO ,BONE>>
		<QUEUE I-GLOBAL-HINT 16>
		<TELL "|
(Congratulations! You earned another " N .PTS " points by taking the bone!)"
CR>)>
	 <COND (<EQUAL? ,NOTIFY? 2>
	        <RTRUE>)
	       (<T? .CR>
		<CRLF>)>
	 <TELL "[Your score just went up by " N .PTS " point">
	 <COND (<NOT <EQUAL? .PTS 1>>
		<TELL "s">)>
	 <TELL ". The total is now " N ,SCORE " out of 15.]">
	 <CRLF>
	 <COND (<ZERO? ,NOTIFY?>
		<SETG NOTIFY? 1>
		<TELL CR
"[NOTE: You can turn score notification on or off at any time with the NOTIFY command.]" CR>)>
	 <RFATAL>>

<ROUTINE HELD? (OBJ)
	 <COND (<ULTIMATELY-IN? .OBJ ,PROTAGONIST>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE CANT-SEE-MUCH ()
	 <TELL
"Little can be seen from where you're standing" ,PERIOD-CR>>

;<ROUTINE ALREADY-DOING-THAT ()
         <TELL
,YOURE-ALREADY "doing that" ,PERIOD-CR>>

<ROUTINE LAST-BUBBLE ()
	 <COND (<EQUAL? ,BACTION 1 2>
		<TELL CR 
"His last bubble floats away over the treetops" ,PERIOD-CR>)>
	 <RTRUE>>

<ROUTINE BOY-SCRAMS ()
	 <FSET ,BOY ,NDESCBIT>
	 <FSET ,BOY ,CHILLY>
	 <SETG P-HIM-OBJECT ,NOT-HERE-OBJECT>
	 <REMOVE ,SDISH>
	 <SETG P-IT-OBJECT ,NOT-HERE-OBJECT>
	 <FSET ,HERE ,NOALL>
	 <DEQUEUE I-BOY>
	 <SETG BACTION 0>
	 <REMOVE ,WAND>
	 <RTRUE>>

<ROUTINE ENTICINGLY ()
	 <TELL ". The ruby in its beak gleams enticingly">
	 <RTRUE>>

<ROUTINE SPLASHES ("OPTIONAL" (OBJ <>))
	 <COND (<ZERO? .OBJ>
		<TELL "Water">)
	       (T
		<TELL CT .OBJ>)>
	 <TELL " splashes all over the place" ,PERIOD-CR>
	 <RTRUE>>

"PICK-NEXT expects an LTABLE of strings, with an initial element of 2."

<ROUTINE PICK-NEXT (TBL "AUX" CNT STR)
	 <SET CNT <GET .TBL 1>>
       	 <SET STR <GET .TBL .CNT>>       
	 <INC CNT>
	 <COND (<G? .CNT <GET .TBL 0>>
		<SET CNT 2>)>
	 <PUT .TBL 1 .CNT>
	 <RETURN .STR>>

<ROUTINE NOT-LIKELY (THING STR)
	 <TELL "It isn't likely that" T .THING " " .STR ,PERIOD-CR>>

;<GLOBAL LIKELIES 
	<LTABLE 2
	 " isn't likely"
	 " seems doubtful"
	 " seems unlikely"
	 "'s unlikely"
	 "'s not likely"
	 "'s doubtful">>

<ROUTINE ALREADY-IN ("OPTIONAL" (THING <>) (ON? <>))
	 <COND (<ZERO? .THING>
		<SET THING ,PRSO>)>
	 <THIS-IS-IT .THING>
	 <TELL ,YOURE-ALREADY>
	 <COND (<T? .ON?>
		<TELL "on ">)
	       (T
		<TELL "in ">)>
	 <TELL T .THING ,PERIOD-CR>
	 <RTRUE>>

<ROUTINE WHICH-WAY-OUT ()
	 <WHICH-WAY "out">
	 <RFALSE>>

<ROUTINE WHICH-WAY (STR)
	 <TELL "[Which way do you want to go " .STR "?]" CR>
	 <RTRUE>>

<ROUTINE HOW? ()
         <TELL "How do you expect to do that?" CR>>

<ROUTINE ATTACHED-TO ()
	 <TELL " is firmly attached to" TR ,GNOMON>
	 <RTRUE>>

<ROUTINE ISNT-ARENT ("OPTIONAL" (THING <>))
	 <COND (<ZERO? .THING>
		<SET THING ,PRSO>)>
	 <COND (<FSET? .THING ,PLURALBIT>
		<TELL " aren't ">)
	       (T
		<TELL " isn't ">)>
	 <RTRUE>>

<ROUTINE IS-ARE ("OPTIONAL" (THING <>))
	 <COND (<ZERO? .THING>
		<SET THING ,PRSO>)>
	 <COND (<FSET? .THING ,PLURALBIT>
		<TELL " are ">)
	       (T
		<TELL " is ">)>
	 <RTRUE>>

;<GLOBAL FIXTURES
	<PTABLE
	 <LTABLE 2 "firm" "permanent" "immovab" "secure">
	 <LTABLE 2 "attached" "affixed">>>

<ROUTINE HANDLE-BABES? ()
	 <COND (<OR <TOUCHING? ,PRSO>
		    ;<IN-TBL? ,PRSA ,SEEVERBS ,NSVERBS>
		    <ENTERING?>>
		<TELL "The ">
		<COND (<T? ,RAID?>
		       <TELL "frightened ">)
		      (T
		       <TELL "suspicious ">)>
		<TELL D ,NANNIES " won't let you near" ,PERIOD-CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE TELL-TIME ("AUX" H)
         <SETG CLOCK-WAIT T>
	 <TELL " says it's ">
	 <SET H <COND (<G? ,HOURS 12>
		       <- ,HOURS 12>)
	       	      (<ZERO? ,HOURS>
		       12)
		      (T
		       ,HOURS)>>
	 <TELL N .H ":">
	 <COND (<L? ,MINUTES 10>
		<TELL "0">)>
         <TELL N ,MINUTES ":">
         <COND (<L? ,SECONDS 10>
		<TELL "0">)>
	 <TELL N ,SECONDS>
	 <COND (<G? ,HOURS 11>
		<TELL " pm">)
	       (T
		<TELL " am">)>
	 <PRINT ,PERIOD-CR>
	 <RTRUE>>

<ROUTINE ANNOY-BOY ()
	 <TELL "\"Aow!\"|
|
The startled boy leaps backward at your approach, splashing water all
over the place. \"Stupid git!\" he cries (in an intriguing Cockney accent).
Then he retrieves the empty dish, pockets the wand and disappears between the
prams, glaring at you over his shoulder" ,PERIOD-CR>
	 <LAST-BUBBLE>
	 <BOY-SCRAMS>
	 <RTRUE>>

<ROUTINE GONE-NOW (OBJ)
	 <SETG P-IT-OBJECT ,NOT-HERE-OBJECT>
	 <TELL CT .OBJ " you saw here before is gone now" ,PERIOD-CR>
	 <RTRUE>>

<OBJECT GTREES
	(IN GLOBAL-OBJECTS)
	(DESC "trees")
	(FLAGS NDESCBIT TRYTAKEBIT NOALL PLURALBIT)
	(SYNONYM TREES TREE)
	(ACTION GTREES-F)>

<ROUTINE GTREES-F ()
	 <COND (<NOT <EQUAL? ,GAME-FLAG 3 4>>
		<CANT-SEE-ANY>
		<RTRUE>)  
	       (<VERB? EXAMINE LOOK-INSIDE SEARCH>
		<TELL CT ,GTREES " sway in the brisk wind" ,PERIOD-CR>)
	       (<VERB? LISTEN>
		<TELL CT ,PRSO " hiss and groan in the wind" ,PERIOD-CR>)
	       (<AND <VERB? CLIMB CLIMB-ON CLIMB-UP ENTER BOARD>
		     <PRSO? ,GTREES>>
		;<TELL "Tree-climbing is strictly prohibited in the "
		      D ,GARDENS "; except for " D ,CHILDREN
		      ", of course" ,PERIOD-CR>
		<NO-FOOTHOLDS>
		<RTRUE>)
	       (<VERB? EXIT LEAVE CLIMB-DOWN LEAP>
		<NOT-IN>
		<RTRUE>)
	       ;(<VERB? STAND-UNDER>
		<COND (<HERE? WABE>
		       <TELL ,YOURE-ALREADY "under" TR ,PRSO>
		       <RTRUE>)>
		<V-WALK-AROUND>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<OBJECT BENCH
	(IN BROAD-WALK)
	(DESC "bench")
	(FLAGS NDESCBIT TRYTAKEBIT NOALL SURFACEBIT)
	(SYNONYM BENCH SEAT)
	(ACTION BENCH-F)>

<ROUTINE BENCH-F ()
	 <COND (<PRSI? ,BENCH>
		<COND (<VERB? PUT-ON PUT EMPTY>
		       <PERFORM ,V?GIVE ,PRSO ,BWOMAN>
		       <RTRUE>)>
		<RFALSE>)
	       (<VERB? EXAMINE LOOK-INSIDE>
		<TELL CT ,BWOMAN " is sitting on it" ,PERIOD-CR>
		<RTRUE>)
	       (<VERB? SIT ENTER LIE-DOWN CLIMB-ON CLIMB-OVER
		       STAND-ON CLIMB-UP TAKE>
		<TELL "\"No room!\" cries" T ,BWOMAN
		      ", pushing you away" ,PERIOD-CR>
		<RTRUE>)
	       (<VERB? EMPTY>
		<NO-TOUCHIN>
		<RTRUE>)
	       (<VERB? EXIT TAKE-OFF LEAVE>
		<NOT-IN>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE WINNER-NOT-HOLDING ()
	 <COND (<EQUAL? ,WINNER ,PROTAGONIST>
		<TELL "You're not holding">
		<RTRUE>)>
	 <TELL CT ,WINNER " do">
	 <COND (<NOT <FSET? ,WINNER ,PLURALBIT>>
		<TELL "es">)>
	 <TELL "n't have">
	 <RTRUE>>

<ROUTINE ITS-RIGHT-HERE ()
	 <TELL "It's right here in front of you" ,PERIOD-CR>
	 <RTRUE>>

;<ROUTINE GOT? (OBJ)
	 <COND (<ZERO? .OBJ>
		<RFALSE>)
	       (<AND <EQUAL? ,WINNER ,PROTAGONIST>
		     <EQUAL? ,GAME-FLAG 3>
		     <IN? .OBJ ,POCKET>>
		<RTRUE>)
	       (<HELD? .OBJ>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE CANT-SEE-FROM-HERE (THING)
	 <TELL ,YOU-CANT "see" T .THING " from here" ,PERIOD-CR>>

<ROUTINE SEE-ANYTHING-IN? (THING "AUX" OBJ)
	 <SET OBJ <FIRST? .THING>>
	 <REPEAT ()
		 <COND (<ZERO? .OBJ>
			<RFALSE>)
		       (<AND <NOT <FSET? .OBJ ,NDESCBIT>>
			     <NOT <EQUAL? .OBJ ,WINNER>>>
			<RTRUE>)
		       (T
			<SET OBJ <NEXT? .OBJ>>)>>
	 <RFALSE>>

<OBJECT NANNIES
	(IN LOCAL-GLOBALS)
	(DESC "nannies")
	(FLAGS NDESCBIT TRYTAKEBIT NOALL PLURALBIT ACTORBIT)
	(SYNONYM NANNIE NANNY LADIES WOMEN)
	(ADJECTIVE NURSE NURSES)
	(ACTION NANNIES-F)>

<ROUTINE NANNIES-F ()
	 <COND (<PRSI? ,NANNIES>
		<COND (<VERB? GIVE SHOW FEED>
		       <TOO-HAUGHTY>
		       <RTRUE>)>
		<RFALSE>)
	       (<VERB? EXAMINE LOOK-INSIDE>
		<TELL CT ,PRSO>
		<COND (<ZERO? ,RAID?>
		       <TELL " stare back at you haughtily" ,PERIOD-CR>
		       <RTRUE>)>
		<TELL " are scattering in every " D ,INTDIR ,PERIOD-CR>
		<RTRUE>) 
	       (<IN-TBL? ,PRSA ,TALKVERBS ,NTVERBS>
		<TOO-HAUGHTY>
		<PCLEAR>
		<RFATAL>)
	       (<TOUCHING? ,NANNIES>
		<TELL "The very idea!" CR>
		<RTRUE>)
	       ;(<VERB? COUNT>
		<TELL "There are almost as many " D ,PRSO
		      " as there are " D ,CHILDREN ,PERIOD-CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

;<ROUTINE TOUCH-T? ()
	 <COND (<VERB? KISS TOUCH CLIMB-ON CLIMB-OVER TASTE EAT
		       BITE RAPE SHAKE KNOCK MUNG KICK KILL SUCK TAKE SMELL>
	        <RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE TOO-HAUGHTY ()
	 <TELL CT ,NANNIES " are much too ">
	 <COND (<ZERO? ,RAID?>
		<TELL "haughty ">)
	       (T
		<TELL "frightened ">)>
	 <TELL "to acknowledge your presence" ,PERIOD-CR>
	 <RTRUE>>

<OBJECT CHILDREN
	(IN LOCAL-GLOBALS)
	(DESC "children")
	(FLAGS NDESCBIT TRYTAKEBIT NOALL ACTORBIT PLURALBIT)
	(SYNONYM CHILDREN KIDS CHILD KID)
	(ACTION CHILDREN-F)>
	       
<ROUTINE CHILDREN-F ()
	 <COND (<VERB? EXAMINE LOOK-INSIDE>
		<COND (<ZERO? ,RAID?>
		       <TELL "It makes you smile to watch them play" ,PERIOD-CR>
		       <RTRUE>)>
		<TELL CT ,PRSO " are as frightened as their " 
		      D ,NANNIES ,PERIOD-CR>
		<RTRUE>)>
	 <RETURN <HANDLE-CHARGES?>>>

<OBJECT TOURISTS
	(IN LOCAL-GLOBALS)
	(DESC "tourists")
	(FLAGS NDESCBIT TRYTAKEBIT NOALL PLURALBIT ACTORBIT)
	(SYNONYM TOURIS CROWD PEOPLE MOB)
	(ADJECTIVE PASSING)
	(ACTION TOURISTS-F)>

<ROUTINE TOURISTS-F ()
	 <COND (<PRSI? ,TOURISTS>
		<COND (<VERB? GIVE SHOW FEED>
		       <T-SNOBS>
		       <RTRUE>)>
		<RFALSE>)
	       (<VERB? EXAMINE LOOK-INSIDE>
		<COND (<ZERO? ,RAID?>
		       <TELL CT ,PRSO " look a lot like you do" ,PERIOD-CR>
		       <RTRUE>)>
		<TELL "The terrified " D ,PRSO " are stumbling in every " 
		      D ,INTDIR ,PERIOD-CR>
		<RTRUE>) 
	       (<IN-TBL? ,PRSA ,TALKVERBS ,NTVERBS>
		<T-SNOBS>  
		<PCLEAR>
		<RFATAL>)
	       (<TOUCHING? ,TOURISTS>
		<TELL 
"A tourist whacks you over the head with a Japanese camera">
		<COND (<T? ,RAID?>
		       <TELL " as she runs past">)>
		<TELL ". Ouch!" CR>
		<RTRUE>)
	       ;(<VERB? COUNT>
		<TELL "Far too many" ,PERIOD-CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE T-SNOBS ()
	 <COND (<ZERO? ,RAID?>
		<TELL CT ,TOURISTS
" shy away from you. They certainly aren't very friendly" ,PERIOD-CR>
		<RTRUE>)>
	 <TOO-BUSY-RUNNING>
	 <RTRUE>>

<OBJECT BABIES
	(IN LOCAL-GLOBALS)
	(DESC "babies")
	(FLAGS NDESCBIT ACTORBIT PLURALBIT TRYTAKEBIT NOALL)
	(SYNONYM BABIES BABY INFANT)
	(ACTION BABIES-F)>

<ROUTINE BABIES-F ()
	 <COND (<VERB? LISTEN>
		<TELL "This is supposed to be a vacation" ,PERIOD-CR>
		<RTRUE>)
	       (<HANDLE-BABES?>
		<RTRUE>)>
	 <RETURN <HANDLE-CHARGES?>>>

<ROUTINE HANDLE-CHARGES? ()
	 <COND (<OR <PRSI? ,BABIES>
		    <PRSI? ,CHILDREN>>
		<COND (<VERB? GIVE SHOW FEED>
		       <EARSHOT>
		       <RTRUE>)>
		<RFALSE>)
	       (<IN-TBL? ,PRSA ,TALKVERBS ,NTVERBS>
		<EARSHOT>
		<PCLEAR>
		<RFATAL>)
	       (<TOUCHING? ,PRSO>
		<TELL "A nanny whacks you over the head with her "
		      D ,PARASOL>
		<COND (<T? ,RAID?>
		       <TELL " as she runs past">)>
		<TELL ". Ouch!" CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE EARSHOT ()
	 <COND (<ZERO? ,RAID?>
	        <TELL "The suspicious " D ,NANNIES 
		      " quickly pull" T ,CHILDREN
		      " out of earshot" ,PERIOD-CR>
		<RTRUE>)>
	 <TOO-BUSY-RUNNING>
	 <RTRUE>>

<ROUTINE TOO-BUSY-RUNNING ()
	 <TELL "Everybody's too busy running to heed you" ,PERIOD-CR>
	 <RTRUE>>

<OBJECT BEACH
	(IN LOCAL-GLOBALS)
	(DESC "shore")
	(FLAGS NDESCBIT)
	(SYNONYM SHORE SHORELINE)
	(ADJECTIVE EDGE CURVE FAR OPPOSITE)
	(ACTION BEACH-F)>

<ROUTINE BEACH-F ()
	 <COND (<PRSI? ,BEACH>
		<COND (<IN-TBL? ,PRSA ,PUTVERBS ,NUMPUTS>
		       <PERFORM ,V?DROP ,PRSO>
		       <RTRUE>)>
		<RFALSE>)
	       (<VERB? EXAMINE> 
		<V-LOOK>
		<RTRUE>)
	       (<OR <ENTERING?>
		    <VERB? STAND-ON>>
		<ALREADY-IN ,PRSO T>
		<RTRUE>)
	       (<OR <EXITING?>
		    <VERB? FOLLOW CROSS CLIMB-OVER CLIMB-UP CLIMB-DOWN>>
		<V-WALK-AROUND>
		<RTRUE>)
	       ;(<VERB? SIT LIE-DOWN>
		<TELL "This is no time for catching rays" ,PERIOD-CR>
		<RTRUE>)
	       ;(<VERB? LOOK-INSIDE LOOK-UNDER DIG SEARCH REACH-IN 
		       MOVE PUSH>
		<TELL 
"Sifting through the sand reveals nothing special" ,PERIOD-CR>)
	       ;(<VERB? KICK KILL SHAKE>
		<WASTES>)>>

<OBJECT WAND
	(IN BOY)
	(DESC "bubble wand")
	(FLAGS NDESCBIT TRYTAKEBIT NOALL)
	(SYNONYM WAND STICK HOOP HOOPS)
	(ADJECTIVE FLAT PLASTIC BUBBLE)
	(ACTION WAND-F)>

<ROUTINE WAND-F ()
	 <COND (<PRSI? ,WAND>
		<RFALSE>)
	       (<VERB? EXAMINE>
		<TELL 
"It's a flat plastic stick, with hoops molded onto each end for blowing "
D ,SBUBBLE "s" ,PERIOD-CR>
		<RTRUE>)
	       (<TOUCHING? ,PRSO>
		<ANNOY-BOY>)>>

<OBJECT SDISH
	(IN AT-TERRACE)
	(DESC "dish")
	(FLAGS NDESCBIT TRYTAKEBIT CONTBIT OPENBIT)
	(CAPACITY 5)
	(SYNONYM DISH BOWL WATER LIQUID)
	(ADJECTIVE SOAP SOAPY WHITE)
	(ACTION SDISH-F)>

<ROUTINE SDISH-F ()
	 <COND (<PRSI? ,SDISH>
		<COND (<TOUCHING? ,PRSO>
		       <ANNOY-BOY>
		       <RTRUE>)>
		<RFALSE>)
	       (<VERB? EXAMINE LOOK-INSIDE SEARCH>
		<TELL 
CT ,PRSO " is filled to the brim with soapy water" ,PERIOD-CR>)
	       (<VERB? EMPTY>
		<SPLASHES>
		<RTRUE>)
	       (<VERB? OPEN CLOSE>
		<IMPOSSIBLES>
		<RTRUE>)
	       (<TOUCHING? ,PRSO>
		<ANNOY-BOY>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<OBJECT PHONES
	(IN AT-TERRACE)
	(DESC "headphones")
	(FLAGS NDESCBIT TRYTAKEBIT NOALL PLURALBIT)
	(SYNONYM PHONES HEADPHONES EARPHONES MUSIC)
	(ADJECTIVE HEAD EAR STEREO)
	(ACTION PHONES-F)>

"TOUCHED = phones mentioned in room description."

<ROUTINE PHONES-F ()
	 <COND (<PRSI? ,PHONES>
		<RFALSE>)
	       (<VERB? LISTEN>
		<HEAR-GIANT-MUSIC>
		<RTRUE>)
	       (<TOUCHING? ,PRSO>
		<ANNOY-BOY>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE IFENCE-BLOCKS ()
	 <BLOCKS-YOUR-PATH ,IFENCE>
	 <RFALSE>>

<ROUTINE VICTORIA-BLOCKS ()
	 <BLOCKS-YOUR-PATH ,VICTORIA>
	 <RFALSE>>

<ROUTINE THICKET-BLOCKS ()
	 <BLOCKS-YOUR-PATH ,THICKET>
	 <RFALSE>>

<ROUTINE BLOCKS-YOUR-PATH ("OPTIONAL" (OBJ <>))
	 <COND (<T? .OBJ>
		<THIS-IS-IT .OBJ>
		<TELL CT .OBJ>)>
	 <TELL " blocks your path" ,PERIOD-CR>>

<ROUTINE WHICH-WAY-IN ()
	 <WHICH-WAY "in">
	 <RFALSE>>

<OBJECT SBUBBLE
	(IN GLOBAL-OBJECTS)
	(DESC "soap bubble")
	(FLAGS NDESCBIT)
	(SYNONYM BUBBLE)
	(ADJECTIVE SOAP IRIDESCENT COLORS)
	;(GENERIC GENERIC-BUBBLE-F)
	(ACTION SBUBBLE-F)>

"NOALL in room = bubble not visible."

<ROUTINE SBUBBLE-F ()
	 <COND (<PRSI? SBUBBLE>
		<RFALSE>)
	       (<VERB? BLOW INFLATE>
		<TELL 
"You don't have a bubble-blowing " D ,WAND ,PERIOD-CR>)
	       (<OR <NOT <EQUAL? ,HERE ,AT-TERRACE>>
		    <FSET? ,HERE ,NOALL>>
		<TELL ,YOU-CANT "see any at the moment" ,PERIOD-CR>
		<RFATAL>)
	       (<VERB? EXAMINE>
		<TELL CT ,PRSO " shimmers with iridescent color" ,PERIOD-CR>)
	       (<VERB? LOOK-INSIDE SEARCH>
		<TELL CT ,PRSO " is filled with air" ,PERIOD-CR>)
	       (<VERB? FOLLOW>
		<V-WALK-AROUND>)
	       (<TOUCHING? ,PRSO>
		<TELL CT ,PRSO " is floating high out of reach" ,PERIOD-CR>)>>

<ROUTINE I-BIKES ()
	 <QUEUE I-BIKES -1>
	 <COND (<HERE? LAN-WALK>
	        <DEQUEUE I-BIKES>
		;<FSET ,BIKES ,SEEN>
		<TELL CR
"A young couple zooms down" T ,LAN-WALK
" on bicycles. You watch them roll across the grass and disappear into the crowd" ,PERIOD-CR>
		<RTRUE>)>
	 <RFALSE>>

<ROUTINE IN-TBL? (X TBL LEN)
	 <REPEAT ()
		 <COND (<DLESS? LEN 0>
			<RFALSE>)
		       (<EQUAL? <GET .TBL .LEN> .X>
			<RTRUE>)>>>
