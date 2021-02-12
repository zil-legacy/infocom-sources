;<BEGIN-SEGMENT JOE>

<ROOM ROOM-ONE
	(LOC ROOMS)
	(DESC "Your room")
	(LDESC
"This is your room. The smell of antisceptic pervades the air. Like all 
hospital rooms the walls are light green")
	(FLAGS ONBIT)
	(NORTH TO HALL)
	(ACTION ROOM-ONE-F)>

<ROUTINE ROOM-ONE-F (RARG)
	<COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are your hospital room. ">)>>

<OBJECT TAPE-STRIP
	(LOC PLAYER)
	(SYNONYM STRIP)
	(ADJECTIVE WHITE)
	(DESC "Piece of tape ")
	(FLAGS TAKEBIT)
	(ACTION TAPE-STRIP-F)
	(FDESC
"You are holding a piece of tape. ")
	(LDESC
"There is a piece of tape here. ")
	(SIZE 1)>

<OBJECT TAPE-ROLL
	(LOC ROOM-ONE)
	(SYNONYM ROLL TAPE)
	(ADJECTIVE WHITE)
	(DESC "roll of tape ")
	(FLAGS TAKEBIT)
	(ACTION TAPE-ROLL-F)
	(FDESC
There is a roll of tape lying on the table. ")
	(LDESC
"There is a roll of tape here. ")
	(SIZE 1)>

<ROUTINE TAPE-STRIP-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"This is a pice of white,cotton medical tape. Like most tape, one side is
sticky. ">)>
	 <COND (<VERB? PUT>	
		<TELL
"You cover the" D,PRSO "with the tape. ">)>	
	 <FSET ,TAPE-STRIP ,SEENBIT>

<ROUTINE TAPE-ROLL-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"This is a roll of white,cotton medical tape. ">)>
	 <COND (<VERB? CUT>	
		<TELL
"You deftly cut a strip of tape from the roll ">)>	
	 <FSET ,TAPE-STRIP ,SEENBIT>
	 
<ROOM DININGROOM
	(LOC ROOMS)
	(DESC "Dining room")
	(LDESC
"Welcome to Joe Prosser's dining room.")
	(WEST TO PANTRY IF PANTRY-DOOR IS OPEN) 
	(SOUTH TO ROOM-ONE)
	(FLAGS ONBIT)
	(GLOBAL PANTRY-DOOR)
	(ACTION DININGROOM-F)>

<ROUTINE DININGROOM-F (RARG)
	<COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are in the diningroom. There is a chandelier above you, and a table to
your left">)>>

<OBJECT REMOTE-CONTROL
       (LOC DININGROOM)
       (SYNONYM REMOTE CONTROL SWITCHER CHANGER)
       (DESC "Remote Control")
       (ADJECTIVE CHROME BOX)
       (FLAGS TAKEBIT MUNGBIT SURFACEBIT)
       (ACTION REMOTE-CONTROL-F)
       (FDESC "A chrome box lies on the floor. On it is a button.")
       (LDESC "A small square box lies on the floor.")  
       (SIZE 7)>

<ROUTINE REMOTE-CONTROL-F ()
       <COND (<VERB? EXAMINE> 
	      <TELL
"On the box is a button, but there seems to be no indication of its function.
Presumably, it is a remote control device.  But what it controls is unknown.">)
              (<VERB? DROP>
              <TELL
"The box falls to the ground with a sharp \"crack,\" splitting down a seam 
in the side, and spilling out bits of plastic and metal. Now you'll never know
what it's for, dipshit.">
              <FSET ,REMOTE-CONTROL ,MUNGBIT>
	      <FSET ,BUTTON ,MUNGBIT>)>>

<OBJECT BUTTON
              (LOC REMOTE-CONTROL)
              (SYNONYM BUTTON)
              (ADJECTIVE SQUARE BLACK)
              (DESC "Button")
              (FLAGS MUNGBIT TOUCHBIT TRYTAKEBIT)
              (ACTION BUTTON-F)
              (FDESC "On the box is a square, black button.")
              (LDESC "On the box is a square, black button.")>

<ROUTINE BUTTON-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"This is just a regular square black button.">)
         (<VERB? PRESS>
                <TELL
"The box clicks. ">)>>

<ROOM PANTRY
	(LOC ROOMS)
	(DESC "Pantry ")
	(EAST TO DININGROOM IF PANTRY-DOOR IS OPEN)
	(WEST TO KITCHEN)
	(ACTION PANTRY-F)
	(FLAGS ONBIT)
	(GLOBAL PANTRY-DOOR)>

<ROUTINE PANTRY-F (RARG)
	<COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is the pantry. To the east is the dining room, and to the west is the
kitchen. ">)>>

<ROOM KITCHEN
	(LOC ROOMS)
	(DESC "Kitchen")
	(EAST TO PANTRY)
	(SOUTH TO HALL-EAST)
	(FLAGS ONBIT)
	(ACTION KITCHEN-F)>

<ROUTINE KITCHEN-F (RARG)
	<COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is the kitchen. To the east is the pantry.">)>>

<OBJECT PANTRY-DOOR
	(LOC LOCAL-GLOBALS)
	(DESC "Pantry door")
	(SYNONYM PANTRY DOOR)
  	(ADJECTIVE WOOD)
	(FLAGS OPENABLE DOORBIT NARTICLEBIT OPENBIT)
	(FDESC "A wooden door is on the west wall.")
        (LDESC "A wooden door is on the west wall.")
	(ACTION PANTRY-DOOR-F)>

<ROUTINE PANTRY-DOOR-F ()
	<COND (<VERB? LOOK>
	       (<AND <FSET? ,PANTRY-DOOR ,OPENBIT>>
		     <COND (<EQUAL? <LOC ,PANTRY-DOOR> ,HERE>
			    <TELL
"The pantry door has momentarily swung into the room. ">)
			   (T
			    <TELL
"The pantry door has swung into the other room. ">)>))
	       (T
		<TELL
"The pantry door isn't open. ">)>>

	 <COND (<VERB? OPEN>
		<COND (<EQUAL? ,HERE ,DININGROOM>	
		       <FSET ,PANTRY-DOOR ,OPENBIT>      
		       <TELL
 "You push the door open, and get a glimpse of the pantry.  Thank god this is
one of those doors with springs to keep it closed. The door pushes into the pantry" CR>)
		      (T 
		       <FSET ,PANTRY-DOOR ,OPENBIT>
		       <TELL
"The door pushes into the diningroom." CR>)>)>

<ROOM HALL-EAST
	(LOC ROOMS)
	(DESC "East end of the hall")
	(NORTH TO KITCHEN)


	(FLAGS ONBIT)
	(ACTION KITCHEN-F)>

<ROUTINE KITCHEN-F (RARG)
	<COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is the kitchen. To the east is the pantry.">)>>
