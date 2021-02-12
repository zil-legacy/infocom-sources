;"rooms"

;"--- pipe ---"

<ROOM PLUMBING    ;"FIRST ROOM" 
      (IN ROOMS)
      (DESC "In the Plumbing")
      (LDESC "You are swimming, or rather floundering, amidst a torrent of
warm water, surging upward toward some unknown destination. You hold your
breath, in a panic.")
      (UP "It's inevitable.")
      (DOWN 
"That would take more strength and swimming finesse than you've got.")
      (IN PER FLOUNDER)
      (EAST PER FLOUNDER)
      (WEST PER FLOUNDER)
      (NORTH PER FLOUNDER)
      (SOUTH PER FLOUNDER)
      (OUT PER FLOUNDER)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL WATER PIPE)>

<ROUTINE FLOUNDER ()
	 <TELL
"You strike out in that direction, but what with the current, you do little
more than flounder about." CR>
	 <RFALSE>>

<OBJECT PIPE
	(IN LOCAL-GLOBALS)
	(SYNONYM PIPE PIPES PLUMBING)
	(DESC "plumbing")
	(FLAGS NDESCBIT)
	(ACTION PIPE-F)>

<ROUTINE PIPE-F ()
	 <TELL 
"It's difficult to do anything with the plumbing at the speed you're at." CR>
	 <RTRUE>>

<OBJECT WATER
	(IN LOCAL-GLOBALS)
	(SYNONYM WATER BATH)
	(ADJECTIVE BATH WARM HOT)
	(DESC "water")
	(FLAGS NDESCBIT)
	; (ACTION WATER-F)>

<ROUTINE I-CURRENT ()           ;"called by go"
	 <TELL "The speeding current continues to thrust you upward">
	 <SETG PIPE-COUNT <+ ,PIPE-COUNT 1>>
	 <COND (<EQUAL? ,PIPE-COUNT 4>
		<TELL 
", and out a spout, not entirely unlike a faucet. seconds later, you hit the
ground, although not as stable as any ground you've ever hit before." CR CR>
		<MOVE ,PROTAGONIST ,WASHCLOTH>
		<SETG PLAYER-LOC 3>
		<SETG HERE ,WASHCLOTH>
		<V-LOOK>
		<DISABLE <INT I-CURRENT>>
		<ENABLE <QUEUE I-CLOTH-SINK -1>>)>
	 <TELL "." CR>>

<GLOBAL PIPE-COUNT 1> ;"The number of turns in the pipe (4=out)"

; <ROUTINE WATER-F ()
	 >

;"--- washcloth ---"

<ROOM WASHCLOTH
      (IN ROOMS)
      (DESC "On a Washcloth")
      (NORTH PER CLOTH-MOVE)
      (SOUTH PER CLOTH-MOVE)
      (EAST PER CLOTH-MOVE)
      (WEST PER CLOTH-MOVE)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL WATER)
      (ACTION WASHCLOTH-ROOM-F)>

<ROUTINE WASHCLOTH-ROOM-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You're desperately trying to keep your balance atop a brown washcloth. Waves
moving about the tub cause the cloth to undulate as if there were nothing
separating you and the choppy waters below. The cloth itself floats near">
		<DESC-TUB 3>
		<CRLF>)>>

<ROUTINE CLOTH-MOVE ()
	 <TELL
"You start to move in that direction, but give up after the undulating cloth
bowls you over." CR>
	 <RFALSE>>

<OBJECT CLOTH-REF
	(IN WASHCLOTH)
	(SYNONYM WASHCL CLOTH)
	(ADJECTIVE BROWN WASH)
	(DESC "washcloth")
	(FLAGS NDESCBIT)
	; (ACTION CLOTH-F)>

; <ROUTINE CLOTH-F ()
	 <COND (<VERB?>
	 	<PLUNGE>
		<FIND-LOC 8>)>>

<GLOBAL CLOTH-COUNT 0> ;"how deep the cloth is. (6=sunk)"

<ROUTINE I-CLOTH-SINK ("AUX" PART)             ;"called by i-current"
	 <SETG CLOTH-COUNT <+ ,CLOTH-COUNT 1>>
	 <COND (<EQUAL? ,CLOTH-COUNT 6>
		<TELL
"The washcloth is now completely out of sight beneath you. You find that
you're really..."  CR 
CR>
		<DISABLE <INT I-CLOTH-SINK>>
		<ENABLE <QUEUE I-RUN-WATER -1>>
		<PLUNGE 3>)>
	 <TELL
"The cloth sinks a bit under the waves. The hot bath water licks at your ">
	 <SET PART <GET ,BODY-SINK-TAB ,CLOTH-COUNT>>
	 <TELL .PART  "." CR>
	 <TELL
"Water continues to pour into the tub from the faucet." CR>>

<GLOBAL BODY-SINK-TAB <LTABLE
"toes" "knees" "waist" "chest" "neck">>

;"--- IN THE WATER ---"

<GLOBAL WATER-COUNT 0>  ;"time in the water."

<ROOM HOT-WATER
      (IN ROOMS)
      (DESC "In Hot Water")
      (NORTH PER TUB-MOTION)
      (SOUTH PER TUB-MOTION)
      (EAST PER TUB-MOTION)
      (WEST PER TUB-MOTION)
      (DOWN "You swim down, but soon come back up for air.")
      (UP PER TUB-MOTION)
      (FLAGS ONBIT)
      (GLOBAL WATER)
      (ACTION HOT-WATER-ROOM-F)>

<ROUTINE HOT-WATER-ROOM-F (RARG)
	 <HW-DEBUG>
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You're struggling to keep afloat in the choppy waters of a bathtub, near">
		<DESC-TUB ,PLAYER-LOC>
		<CRLF>)>>

<ROUTINE PLUNGE (LOC)                  ;"from vehicle to hot water"
	 <SETG HERE ,HOT-WATER>
	 <MOVE ,PROTAGONIST ,HOT-WATER>
	 <SETG PLAYER-LOC .LOC>
	 <SETG WATER-COUNT 0>
	 ;<QUEUE I-DROWN -1>
	 <SET-END>
	 <V-LOOK>>

<ROUTINE I-DROWN ()
	 <SETG WATER-COUNT <+ ,WATER-COUNT 1>>
	 <COND (<EQUAL? ,WATER-COUNT 3>
		<TELL
"You are beginning to struggle to stay above the water level. You'd better
start thinking about getting 'ashore' fast!" CR>)
	       (<EQUAL? ,WATER-COUNT 5>
		<TELL
"You are losing the struggle. The soapy water has begun to find its way
into your mouth and nostrils!" CR>)
	       (<EQUAL? ,WATER-COUNT 6>
		<JIGS-UP
"The choppy waves drag you under, where you find yourself pulled in seventy
directions at once. Finally, much to your relief, you suck in a mouthful of
water. Maybe if humans had gills...">)>> 

<ROUTINE TUB-MOTION ()
	 <DO-SWIM ,P-DIRECTION>>

<ROUTINE DO-SWIM (DIR)
	 <COND (<AND <EQUAL? ,PLAYER-LOC 1>
		     <EQUAL? .DIR P?NORTH P?WEST P?UP>>
		<CLIMB-OUT ,LEDGE-NW>)
	       (<AND <EQUAL? ,PLAYER-LOC 13>
		     <EQUAL? .DIR P?SOUTH P?WEST P?UP>>
		<CLIMB-OUT ,LEDGE-SW>)
	       (<AND <EQUAL? ,PLAYER-LOC 2>
		     <EQUAL? .DIR P?NORTH P?UP>>
		<COND (<L? ,WATER-LEVEL 21>
		       <TELL
"The faucet is too high out of reach." CR>)
		      (T
		       <TELL
"You struggle to pull yourself up onto the faucet, but the stainless
steel is much too slippery to grasp." CR>)>
		<RFALSE>) 
	       (<AND <EQUAL? ,PLAYER-LOC 15>
		     <EQUAL? .DIR P?SOUTH P?EAST P?UP>>
		<CLIMB-OUT ,LEDGE-SE>)
	       (<AND <EQUAL? ,PLAYER-LOC 3>
		     <EQUAL? .DIR P?NORTH P?EAST P?UP>>
		<CLIMB-OUT ,LEDGE-NE>)
	       (<AND <EQUAL? ,PLAYER-LOC 14>
		     <EQUAL? .DIR P?SOUTH P?UP>>
		<CLIMB-OUT ,LEDGE-S>)
	       (T
		<IN-TUB-SWIM .DIR>)>>

<ROUTINE CLIMB-OUT (EXIT)
	 <TELL "You grope for the porcelain ledge,">
	 <COND (<G? ,WATER-HEIGHT 20>
		<TELL " and">
	        <COND (<EQUAL? ,WATER-COUNT 5>
		       <TELL 
", by using the last reserves of your strength,">)>
		<TELL " pull yourself up onto a ledge." CR>
	        <RETURN .EXIT>)
	       (T
		<TELL " but it is too far out of reach." CR>
		<RTRUE>)>>

<ROUTINE IN-TUB-SWIM (DIR)
	 <COND (<EQUAL? ,WATER-COUNT 5>
		<TELL
"You make a few desperate strokes in that direction, but don't get far." CR>
		<RFALSE>)
	       (<AND <EQUAL? ,FAUCET-ON T>
		     <EQUAL? ,END "NORTH">>
		<TELL
"You strike out in that direction, but the huge waves all about batter you
back to where you started." CR>
		<RFALSE>)
	       (<AND <EQUAL? ,DRAIN-OPEN T>
		     <EQUAL? ,PLAYER-LOC 2>>
		<TELL
"You try in desperation to swim out of the whirlpool, but the suction from the
drain below is too strong." CR>
		<RFALSE>) 
	       (<EQUAL? .DIR P?NORTH>
		<SETG PLAYER-LOC <- ,PLAYER-LOC 3>>)
	       (<EQUAL? .DIR P?SOUTH>
		<SETG PLAYER-LOC <+ ,PLAYER-LOC 3>>)
      	       (<EQUAL? .DIR P?EAST>
		<SETG PLAYER-LOC <+ ,PLAYER-LOC 1>>)
	       (T
		<SETG PLAYER-LOC <- ,PLAYER-LOC 1>>)>
	 <SET-END>
	 <TELL
"You manage to make some headway through the smooth waters..." CR CR>
	 <V-LOOK>
	 <RFALSE>>

<ROUTINE SET-END ()
	 <COND (<L? ,PLAYER-LOC 7>
      		<SETG END "NORTH">)
	       (<G? ,PLAYER-LOC 9>
		<SETG END "SOUTH">)
	       (T
		<SETG END "MIDDLE">)>>

;"water control"

<ROUTINE HW-DEBUG ()
	 <TELL "Debugging info:" CR>
	 <TELL "PLAYER-LOC: " N ,PLAYER-LOC CR>
	 <TELL "END       : " ,END CR>
	 <TELL "FAUCET-ON : ">
	 <COND (<EQUAL? ,FAUCET-ON T>
	       	<TELL "T">)
	       (T
		<TELL "<>">)>
	 <TELL CR "DRAIN-OPEN: ">
	 <COND (<EQUAL? ,DRAIN-OPEN T>
		<TELL "T">)
	       (T
		<TELL "<>">)>
	 <TELL CR "HERE      : " D ,HERE CR>
	 <TELL "WATER-HEIGHT: " N ,WATER-HEIGHT CR>>

<GLOBAL WATER-HEIGHT 5>

<GLOBAL END "NORTH">

<GLOBAL HAND-SWOOP "Suddenly, and without warning, a massive hand swoops over from a bank of steam and">

<ROUTINE I-RUN-WATER ()
	 <TELL "I-RUN-WATER CALLED, CAPTAIN.">
	 <SETG WATER-HEIGHT <+ ,WATER-HEIGHT 1>>
         <COND (<EQUAL? ,END "NORTH">
		<COND (<EQUAL? ,WATER-HEIGHT 20>
		       <TELL ,HAND-SWOOP
 " turns off the faucet. Water is no longer pouring into the tub." CR>
		       <DISABLE <INT I-RUN-WATER>>
		       <SETG FAUCET-ON <>>)
	       	      (T
		       <TELL
"Water continues to pour into the tub from the faucet." CR>)>)
	       (T
		<COND (<EQUAL? ,WATER-HEIGHT 20>
		       <TELL
"Inexplicably, the ominous rumblings cease, and the water current slows down."
CR>
		       <DISABLE <INT I-RUN-WATER>>
		       <SETG FAUCET-ON <>>)
		      (T
		       <TELL
"The roar of water pouring into the tub fills your ears." CR>)>)>>
		
<ROUTINE DEPTH? ("AUX" DPT)
	 <SET DPT ,WATER-HEIGHT>
	 <COND (<EQUAL? ,HERE ,HOT-WATER>
		<COND (<G? ,PLAYER-LOC 12>
		       <SET DPT <- .DPT 4>>)
		      (<G? ,PLAYER-LOC 9>
		       <SET DPT <- .DPT 3>>)
		      (<G? ,PLAYER-LOC 6>
		       <SET DPT <- .DPT 2>>)
		      (<G? ,PLAYER-LOC 3>
		       <SET DPT <- .DPT 1>>)>)>
	 <RETURN .DPT>>
		       
<ROUTINE I-DRAIN-TUB ("AUX" DPT)
	 <SETG WATER-HEIGHT <- ,WATER-HEIGHT 1>>
         <SET DPT <DEPTH?>>
	 <COND (<EQUAL? ,FAUCET-ON <>>
	 	<COND (<EQUAL? ,WATER-HEIGHT 5>
		       <COND (<EQUAL? ,END "NORTH">
			      <TELL ,HAND-SWOOP
" closes the drain, turning the water back on." CR>)
		      	     (T
		              <TELL
"Inexplicably, water stops draining from the tub, and once again, you hear
the ominous roar of hot water rushing in through the faucet." CR>)>
		       <SETG DRAIN-OPEN <>>
		       <SETG FAUCET-ON T>
		       <SETG WATER-HEIGHT 6>
		       <ENABLE <QUEUE I-RUN-WATER -1>>)>)>>
	       
;<COND (<G? .DPT 0>
		       <TELL "Water continues to drain out of the tub.">
		       <COND (<EQUAL? .DPT 1>
		       	      <TELL
" You now find that you can stand up on the porcelain floor of the tub.">)
		      	     (<L? .DPT 4>
		       	      <TELL
" You can now clearly see the tub's floor, only a few feet below.">)>
			      <CRLF>)
	       		     (<EQUAL? .DPT 0>
			      <TELL
"The last of the hot water drains away from your ankles." CR>)> 

<OBJECT FAUCET
	(IN HOT-WATER)
	(DESC "faucet")
	(SYNONYM FAUCET)
	(FLAGS NDESCBIT)
	(ACTION FAUCET-F)>

<GLOBAL FAUCET-ON T>

<ROUTINE FAUCET-F ()
	 <COND (<OR <AND <VERB? TURN>
			 <EQUAL? ,FAUCET-ON <>>>
		    <VERB? LAMP-ON OPEN>>
		<COND (<EQUAL? ,FAUCET-ON T>
		       <TELL "But the faucet is already on!" CR>
		       <RFATAL>)
		      (T
		       <SETG FAUCET-ON T>
		       <ENABLE <QUEUE I-RUN-WATER -1>>
		       <TELL "The faucet's on." CR>
		       <RTRUE>)>)
	       (<OR <AND <VERB? TURN>
			 <EQUAL? ,FAUCET-ON T>>
		    <VERB? LAMP-OFF CLOSE>> 
		<COND (<EQUAL? ,FAUCET-ON <>>
		       <TELL"The faucet's already off!" CR>
		       <RFATAL>)
		      (T
		       <DISABLE <INT I-RUN-WATER>>
		       <SETG FAUCET-ON <>>
		       <TELL "You shut off the faucet." CR>
		       <RTRUE>)>)>>

<GLOBAL DRAIN-OPEN <>>

<ROUTINE DRAIN-F ()
	 <COND (<VERB? LAMP-ON OPEN>
		<COND (<EQUAL? ,DRAIN-OPEN T>
		       <TELL "But the drain is already open!" CR>
		       <RFATAL>)
		      (T
		       <SETG DRAIN-OPEN T>
		       <ENABLE <QUEUE I-DRAIN-TUB -1>>
		       <TELL "The drain's open." CR>
		       <RTRUE>)>)
	       (<VERB? LAMP-OFF CLOSE> 
		<COND (<EQUAL? ,DRAIN-OPEN <>>
		       <TELL"The drain's already closed!" CR>
		       <RFATAL>)
		      (T
		       <DISABLE <INT I-DRAIN-TUB>>
		       <SETG DRAIN-OPEN <>>
		       <TELL "You close the drain." CR>
		       <RTRUE>)>)>>

<OBJECT DRAIN
	(IN HOT-WATER)
	(SYNONYM DRAIN)
	(DESC "drain")
	(FLAGS NDESCBIT)
	(ACTION DRAIN-F)>



<ROUTINE DESC-TUB (VEH-LOC)
	 <TELL " a ">
	 <COND (<EQUAL? .VEH-LOC 5 8 11>
		<TELL "middle of the tub.">)
	       (T
	 	<COND (<EQUAL? .VEH-LOC 1 3 13 15>
      		       <TELL "corner of the tub. Porcelain walls">)
	       	      (T
		       <TELL "side of the tub. A porcelain wall">)>
	 	<TELL ", to the ">
	 	<COND (<EQUAL? .VEH-LOC 1>
		       <TELL "north and west">)
	       	      (<EQUAL? .VEH-LOC 4 7 10>
		       <TELL "west">)
	       	      (<EQUAL? .VEH-LOC 13>
		       <TELL "south and west">)
	       	      (<EQUAL? .VEH-LOC 15>
		       <TELL "south and east">)
	       	      (<EQUAL? .VEH-LOC 6 9 12>
		       <TELL "east">)
	       	      (<EQUAL? .VEH-LOC 3>
		       <TELL "north and east">)
	       	      (<EQUAL? .VEH-LOC 2>
		       <TELL "north">)
	       	      (T
		       <TELL "south">)>
	 	<COND (<EQUAL? .VEH-LOC 1 3 13 15>
		       <TELL ", are ">)
	       	      (T
		       <TELL ", is ">)>
	 	<COND (<G? ,WATER-HEIGHT 20>
		       <TELL 
"almost covered with water, and easily within reach. Atop the walls is a ">
		       <COND (<EQUAL? .VEH-LOC 2>
			      <TELL "faucet">
			      <COND (<EQUAL? ,FAUCET-ON T>
				     <TELL
", from which a gush of water issues">)>)
			     (<OR <EQUAL? .VEH-LOC 4 7 10>
				  <EQUAL? .VEH-LOC 6 9 12>>
			      <TELL "thin handhold of a ledge">)
			     (T
			      <TELL "wide ledge">)>)
	       	      (<G? ,WATER-HEIGHT 15>
		       <TELL "rising, some ways above you">)
	       	      (<G? ,WATER-HEIGHT 10>
		       <TELL "looming, a good ways over your head">)
	       	      (T
		       <TELL "towering, high overhead">)>
	 	<TELL ".">)>>
	        
<ROUTINE THIN-PATH ()
	 <TELL
"You start off along the ledge, but thin becomes thinner, and before long you
find yourself at a dead end. You walk back to the ledge.">
	 <RFALSE>>

<ROUTINE LEDGE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You stand on a white porcelain ledge, surveying the ">
		<COND (<EQUAL? ,FAUCET-ON T>
		       <TELL "choppy">)
		      (T
		       <TELL "placid">)>
		<TELL " waters of the bathtub.">
		<COND (<EQUAL? ,END "NORTH">
		       <TELL
" A huge, stainless steel faucet forms the ">
		       <COND (<EQUAL? ,HERE ,LEDGE-NW>
			      <TELL "east">)
			     (T
			      <TELL "west">)>
		       <TELL "ern boundary of this area.">)
		      (<EQUAL? ,HERE ,LEDGE-S>
		       <TELL " Triangular ledges lie to the east and west, and
to the south lay the cavernous maws of a plastic soap dish.">)
		      (T
		       <TELL " A path leads ">
		       <COND (<EQUAL? ,HERE ,LEDGE-SW>
			      <TELL "east">)
			     (T
			      <TELL "west">)>
		       <TELL
" to another ledge, similar in all ways to this one.">)>
		<COND (<NOT <EQUAL? ,HERE ,LEDGE-S>>
		       <TELL " A thin path heads ">
		       <COND (<EQUAL? ,HERE ,LEDGE-NW ,LEDGE-NE>
			      <TELL "south">)
			     (T
			      <TELL "north">)>
		       <TELL " out of sight, tapering along the way.">)>
		<CRLF>)>>

<ROOM LEDGE-NW
      (IN ROOMS)
      (DESC "On a Ledge")
      (EAST "The faucet blocks your path.")
      (SOUTH PER THIN-PATH)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL WATER)
      (ACTION LEDGE-F)>

<ROOM LEDGE-NE
      (IN ROOMS)
      (DESC "On a Ledge")
      (WEST "The faucet blocks your path.")
      (SOUTH PER THIN-PATH)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL WATER)
      (ACTION LEDGE-F)>

<ROOM LEDGE-NW
      (IN ROOMS)
      (DESC "On a Ledge")
      (EAST TO LEDGE-S)
      (NORTH PER THIN-PATH)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL WATER)
      (ACTION LEDGE-F)>

<ROOM LEDGE-S
      (IN ROOMS)
      (DESC "On a Thin Ledge")
      (WEST TO LEDGE-SW)
      (NORTH "If you want to dive in again, just say so.")
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL WATER)
      (ACTION LEDGE-F)>

<ROOM LEDGE-NW
      (IN ROOMS)
      (DESC "On a Ledge")
      (WEST TO LEDGE-S)
      (NORTH PER THIN-PATH)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL WATER)
      (ACTION LEDGE-F)>

<GLOBAL PLAYER-LOC 0>