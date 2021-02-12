;"rooms"

;"--- pipe ---"

<ROOM PLUMBING 
      (IN ROOMS)
      (DESC "In the Plumbing")
      (LDESC "You are swimming, or rather floundering, amidst a torrent of
warm water, surging upward toward some unknown destination. You hold your
breath, in a panic.")
      (NORTH PER FLOUNDER)
      (SOUTH PER FLOUNDER)
      (EAST PER FLOUNDER)
      (WEST PER FLOUNDER)
      (UP "It's inevitable.")
      (DOWN 
"That would take more strength and swimming finesse than you've got.")
      (IN PER FLOUNDER)
      (OUT PER FLOUNDER)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL WATER PIPE)>

<ROUTINE FLOUNDER ()
	 <TELL
"You strike out in that direction, but what with the current, you do little
more than flounder about.">
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

<ROUTINE I-CURRENT ()
	 <TELL "The speeding current continues to thrust you upward">
	 <SETG PIPE-COUNT <+ ,PIPE-COUNT 1>>
	 <COND (<EQUAL? ,PIPE-COUNT 4>
		<TELL 
", and out a spout, not entirely unlike a faucet. seconds later, you hit the
ground, although not as stable as any ground you've ever hit before." CR CR>
		<MOVE ,PROTAGONIST ,WASHCLOTH>
		<SETG PLAYER-LOC 8>
		<SETG HERE ,WASHCLOTH>
		<V-LOOK>
		<DISABLE <INT I-CURRENT>>
		<ENABLE <QUEUE I-CLOTH-SINK -1>>
		<ENABLE <QUEUE I-START-WATER 0>> 
		<RTRUE>)>
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
seperating you and the choppy waters below. The cloth itself floats near">
		<DESC-TUB 12>
		<CRLF>)>>

<ROUTINE CLOTH-MOVE ()
	 <TELL
"You start to move in that direction, but give up after some waves trip you
up." CR>
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
		<FIND-LOC 12>)>>

<GLOBAL CLOTH-COUNT 0>

<ROUTINE I-CLOTH-SINK ("AUX" PART)
	 <SETG CLOTH-COUNT <+ ,CLOTH-COUNT 1>>
	 <COND (<EQUAL? ,CLOTH-COUNT 6>
		<TELL
"The washcloth is now completely out of sight beneath you. You find that
you're struggling to keep afloat in the hot churning waters of the tub."  CR 
CR>
		<DISABLE <INT I-CLOTH-SINK>>
		<PLUNGE 8>
		<RTRUE>)>
	 <TELL
"The cloth sinks a bit under the waves. The hot bath water licks at your ">
	 <SET PART <GET ,BODY-SINK-TAB ,CLOTH-COUNT>>
	 <TELL .PART  "." CR>>

<GLOBAL BODY-SINK-TAB <LTABLE
"toes" "knees" "waist" "chest" "neck">>

;"--- IN THE WATER ---"

<ROOM HOT-WATER
      (IN ROOMS)
      (DESC "In Hot Water")
      (NORTH PER TUB-EXIT-N)
      (SOUTH PER TUB-EXIT-S)
      (EAST PER TUB-EXIT-E)
      (WEST PER TUB-EXIT-W)
      (DOWN PER SWIM)
      (UP "You'll have to supply me with a direction.")
      (FLAGS ONBIT)
      (GLOBAL WATER)
      (ACTION HOT-WATER-ROOM-F)>

<ROUTINE HOT-WATER-ROOM-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You're struggling to keep afloat in the choppy waters of a bathtub, near">
		<DESC-TUB PLAYER-LOC>
		<CRLF>)>>

<ROUTINE SWIM ()
	 <TELL "You start to swim, but the choppy waves keep you at bay." CR>>

<ROUTINE PLUNGE (LOC)
	 <SETG HERE ,HOT-WATER>
	 <MOVE ,PROTAGONIST ,HOT-WATER>
	 <SETG PLAYER-LOC .LOC>
	 <ENABLE <QUEUE I-DROWN 3>>
	 <V-LOOK>>

<ROUTINE I-DROWN ()
	 <JIGS-UP
"The choppy waves drag you under, where you find yourself pulled in seventy
directions at once. Finally, much to your relief, you suck in a mouthful of
water. Maybe if humans had gills...">> 

;"--- SOAP ---"

<GLOBAL SOAP-LOC 1>

<GLOBAL WATER-HEIGHT 0>

<ROUTINE I-RUN-WATER ()
	 <SETG WATER-HEIGHT <+ ,WATER-HEIGHT 1>>
	 <COND (<EQUAL? ,WATER-HEIGHT 22>
		<SETG WATER-HEIGHT 21>)>
	 <TELL "Water continues to pour into the tub from the faucet">
	 <COND (<G? ,WATER-HEIGHT 19>
		<TELL ", but since the tub is full, it spills down a drain
under the faucet" CR>)>
	 <TELL "." CR>
	 <COND (<EQUAL? ,HERE ,SOAP>
		<TELL
"The bar of soap, circulating with the water in the tub, moves to the "
		<GET ,SOAP-MOTION <+ ,SOAP-CNT 1>> "." CR>)>
	 <SETG SOAP-CNT <+ ,SOAP-CNT 2>>
	 <COND (<EQUAL? ,SOAP-CNT 13> <SETG SOAP-CNT 1>)> 
	 <SETG SOAP-LOC <GET ,SOAP-MOTION ,SOAP-CNT>>>
		
<ROUTINE I-START-WATER ()
	 <ENABLE <QUEUE I-RUN-WATER -1>>>

<GLOBAL SOAP-MOTION 
	<LTABLE 1 "south" 2 "south" 3 "east" 6 "north" 7 "north" 8 "west">>

<GLOBAL SOAP-CNT 5>

<ROOM SOAP
      (IN ROOMS)
      (DESC "On a Bar of Soap")
      (NORTH PER TUB-EXIT-N)
      (SOUTH PER TUB-EXIT-S)
      (EAST PER TUB-EXIT-E)
      (WEST PER TUB-EXIT-W)
      (DOWN "If you want to dive into the water, just say so.")
      (UP "Please supply me with a direction.")
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL WATER)
      (ACTION SOAP-ROOM-F)>

<ROUTINE SOAP-ROOM-F (RARG)
	 <SETG PLAYER-LOC ,SOAP-LOC>
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are standing on a bar of soap, trying hard to keep your balance on such
a slippery surface. The bar itself floats near">
		<DESC-TUB ,SOAP-LOC>
		<CRLF>)>>

<ROUTINE DESC-TUB (VEH-LOC)
	 <TELL " a ">
	 <COND (<OR <EQUAL? .VEH-LOC 1 4>
		    <EQUAL? .VEH-LOC 5 8>>
		<TELL "corner of the tub. Porcelain walls">)
	       (T
		<TELL "side of the tub. A porcelain wall">)>
	 <TELL ", to the ">
	 <COND (<EQUAL? .VEH-LOC 1>
		<TELL "north and west">)
	       (<EQUAL? .VEH-LOC 2 3>
		<TELL "west">)
	       (<EQUAL? .VEH-LOC 4>
		<TELL "south and west">)
	       (<EQUAL? .VEH-LOC 5>
		<TELL "south and east">)
	       (<EQUAL? .VEH-LOC 6 7>
		<TELL "east">)
	       (<EQUAL? .VEH-LOC 8>
		<TELL "north and east">)>
	 <COND (<OR <EQUAL? .VEH-LOC 1 4>
		    <EQUAL? .VEH-LOC 5 8>>
		<TELL ", are ">)
	       (T
		<TELL ", is ">)>
	 <COND (<G? ,WATER-HEIGHT 20>
		<TELL 
"almost covered with water, and easily within reach. Atop the walls is a
ledge">)
	       (<G? ,WATER-HEIGHT 15>
		<TELL "rising, some ways above you">)
	       (<G? ,WATER-HEIGHT 10>
		<TELL "looming, a good ways over your head">)
	       (T
		<TELL "towering, high overhead">)>
	 <TELL ".">>
	        
<ROUTINE TUB-EXIT-N ()
	 <COND (<EQUAL? ,PLAYER-LOC 1 8>
		<COND (<G? ,WATER-HEIGHT 20>
		       <TELL 
"You grope for the wall and pull yourself up onto a ledge." CR>
		       <COND (<EQUAL? ,PLAYER-LOC 8>
			      <RETURN ,LEDGE-NE>)
			     (T
			      <RETURN ,LEDGE-NW>)>)
		      (T
		       <TELL
"You grope for the wall, but it is too far out of reach." CR>
		       <RTRUE>)>)
	       (T
		<TELL 
"There's nothing there but water. If you want to go for a swim, just say so." CR>)>>

<ROUTINE TUB-EXIT-S ()
	 <COND (<EQUAL? ,PLAYER-LOC 4 5>
		<COND (<G? ,WATER-HEIGHT 20>
		       <TELL 
"You grope for the wall and pull yourself up onto a ledge." CR>
		       <COND (<EQUAL? ,PLAYER-LOC 5>
			      <RETURN ,LEDGE-SE>)
			     (T
			      <RETURN ,LEDGE-SW>)>)
		      (T
		       <TELL
"You grope for the wall, but it is too far out of reach." CR>
		       <RTRUE>)>)
	       (T
		<TELL 
"There's nothing but water there. If you want to go for a swim, just say so."
 CR>)>>

<ROUTINE TUB-EXIT-E ()
	 <COND (<EQUAL? ,PLAYER-LOC 1 5>
		<COND (<G? ,WATER-HEIGHT 20>
		       <TELL 
"You grope for the wall and pull yourself up onto a ledge." CR>
		       <COND (<EQUAL? ,PLAYER-LOC 8>
			      <RETURN ,LEDGE-NE>)
			     (T
			      <RETURN ,LEDGE-SE>)>)
		      (T
		       <TELL
"You grope for the wall, but it is too far out of reach." CR>
		       <RTRUE>)>)
	       (<EQUAL? ,PLAYER-LOC 6 7>
		<TELL 
"You reach for the wall, but there seems to be no ledge above it." CR>
		<RFALSE>)
	       (T
		<TELL 
"There's nothing but water there. If you want to go for a swim, just say so."
 CR>)>>

<ROUTINE TUB-EXIT-W ()
	 <COND (<EQUAL? ,PLAYER-LOC 1 4>
		<COND (<G? ,WATER-HEIGHT 20>
		       <TELL 
"You grope for the wall and pull yourself up onto a ledge." CR>
		       <COND (<EQUAL? ,PLAYER-LOC 1>
			      <RETURN ,LEDGE-NW>)
			     (T
			      <RETURN ,LEDGE-SW>)>)
		      (T
		       <TELL
"You grope for the wall, but it is too far out of reach." CR>
		       <RTRUE>)>)
	       (<EQUAL? ,PLAYER-LOC 2 3>
		<TELL
"You reach for the wall, but there seems to be no ledge above it." CR>
		<RFALSE>)
	       (T
		<TELL 
"There's nothing but water there. If you want to go for a swim, just say so."
 CR>)>>

<ROOM LEDGE-NW
      (IN ROOMS)
      (DESC "On a Ledge")
      (LDESC 
"You are standing on a porcelain ledge, surveying the bathtub. The ledge seems
to continue to the east. To the south, you can re-enter the bathtub waters.")
      (EAST TO LEDGE-NE)
      (SOUTH "Wait!! That routine hasn't been written yet!!")
      ; (SOUTH PER NW-LEDGE-EXIT)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL WATER)>

<ROOM LEDGE-SW
      (IN ROOMS)
      (DESC "On a Ledge")
      (LDESC 
"You are standing on a porcelain ledge, surveying the bathtub. The ledge seems
to continue to the east. To the south, you can re-enter the bathtub waters.")
      (EAST TO LEDGE-SE)
      (NORTH "Wait!! That routine hasn't been written yet!!")
      ; (SOUTH PER NW-LEDGE-EXIT)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL WATER)>

<ROOM LEDGE-SE
      (IN ROOMS)
      (DESC "On a Ledge")
      (LDESC 
"You are standing on a porcelain ledge, on the southern side of the bathtub.
The ledge seems to continue to the west. To the north, you can re-enter the
bathtub waters.")
      (EAST TO LEDGE-SE)
      (NORTH "Wait!! That routine hasn't been written yet!!")
      ; (SOUTH PER NW-LEDGE-EXIT)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL WATER)>

; <ROUTINE I-LEDGE-SEE ()
	 <COND (<EQUAL? <GET ,SOAP-MOTION <+ ,SOAP-CNT 2>> ,HERE>
		<TELL
"The bar of soap, pushed by the current from the faucet, is circulating past
the ledge." CR>)>>
	  
; <ROUTINE LEDGE-EXIT ()
	 <TELL "You leap off of the ledge, landing..." CR>
	 <COND (<EQUAL? ,PLAYER-LOC ,SOAP-LOC>
		<MOVE ,PROTAGONIST ,SOAP>
		<SETG ,HERE ,SOAP>
		<DISABLE <INT I-LEDGE-SEE>>)>>

		 
<ROOM LEDGE-NE
      (IN ROOMS)
      (DESC "On a Ledge")
      (LDESC 
"You are standing on a porcelain ledge, surveying the bathtub. The ledge seems
to continue to the west. To the south, you can re-enter the bathtub waters.")
      (EAST TO LEDGE-NE)
      (SOUTH "Wait! That routine hasn't been written yet!!")
      ; (SOUTH PER NW-LEDGE-EXIT)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL WATER)>

<GLOBAL PLAYER-LOC 0>