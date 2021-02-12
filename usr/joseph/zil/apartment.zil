;<BEGIN-SEGMENT JOE>

<ROOM LIVINGROOM
	(LOC ROOMS)
	(DESC "Living room")
	(LDESC
"This is the living room. the dining room is to the north.")
	(FLAGS ONBIT)
	(NORTH TO DININGROOM)
	(ACTION LIVINGROOM-F)>

<ROUTINE LIVINGROOM-F (RARG)
	<COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are in the living room. ">)>>

<OBJECT VIDEOTAPE
	(LOC LIVINGROOM)
	(SYNONYM MOVIE TAPE VIDEO)
	(ADJECTIVE SMUT PORN)
	(DESC "Videotape ")
	(FLAGS TAKEBIT)
	(ACTION VIDEOTAPE-F)
	(FDESC
"A videotape is on the floor. ")
	(LDESC
"There is a videotape here. ")
	(SIZE 3)>

<ROUTINE VIDEOTAPE-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"This is a black rectangular box.
 A label on the side says \"Star Wars.\"">)>>


<ROOM DININGROOM
	(LOC ROOMS)
	(DESC "Dining room")
	(LDESC
"Welcome to Joe Prosser's dining room.")
	(WEST TO PANTRY IF PANTRY-DOOR IS OPEN) 
	(SOUTH TO LIVINGROOM)
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
