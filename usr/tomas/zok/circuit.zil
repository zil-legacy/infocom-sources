<ROOM CIRCUIT
      (IN ROOMS)
      (DESC "Grand Circuit")
      (NORTH PER CIRCUIT-WALK)
      (SOUTH PER CIRCUIT-WALK)
      (EAST PER CIRCUIT-WALK)
      (WEST PER CIRCUIT-WALK)
      (NE PER CIRCUIT-WALK)
      (NW PER CIRCUIT-WALK)
      (SE PER CIRCUIT-WALK)
      (SW PER CIRCUIT-WALK)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL PATROL-1 CIRCUIT-DOOR BOX)
      (ACTION CIRCUIT-F)>

<GLOBAL CIRCUIT-DIRECTIONS
	<TABLE 0
"north" "northeast" "east" "southeast"
"south" "southwest" "west" "northwest"
"north" "northeast" "east" "southeast"
"south">>

<GLOBAL CIRCUIT-LOC 0>

<GLOBAL CIRCUIT-EXITS
	<TABLE 0
P?NORTH P?NE P?EAST P?SE
P?SOUTH P?SW P?WEST P?NW
P?NORTH P?NE P?EAST P?SE
P?SOUTH>>

<GLOBAL CIRCUIT-DOORS
	<TABLE 0
ROOM-1 ROOM-2 ROOM-3 ROOM-4 ROOM-5 ROOM-6 ROOM-7 ROOM-8>>

<ROUTINE CIRCUIT-F (RARG)
      	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are in a large hallway that seems to make a grand circuit of this portion
of the dreadnought. The hallway continues to the " 
<GET ,CIRCUIT-DIRECTIONS ,CIRCUIT-LOC> " and to the "
<GET ,CIRCUIT-DIRECTIONS <+ ,CIRCUIT-LOC 3>> ". To the "
<GET ,CIRCUIT-DIRECTIONS <+ ,CIRCUIT-LOC 5>> " is a">
	 	<COND (<FSET? ,CIRCUIT-DOOR ,OPENBIT>
		       <TELL "n " ,D-OPEN>)
	       	      (T
		       <TELL " " ,D-SHUT>)>
	 	<TELL " metal door. Next to the door is a " D ,BOX "." 
CR>)>>

<ROUTINE TELL-WALK (DIR)
	 <TELL
"You follow the " <GET ,CIRCUIT-DIRECTIONS .DIR> "ern corridor." CR CR>>

<ROUTINE CIRCUIT-WALK ()
	 <COND (<EQUAL? ,P-WALK-DIR <GET ,CIRCUIT-EXITS ,CIRCUIT-LOC>>
		<TELL-WALK ,CIRCUIT-LOC>
		<SETG CIRCUIT-LOC <+ ,CIRCUIT-LOC 1>>
		<FIND-BOX>
		<COND (<FSET? ,CIRCUIT-DOOR ,OPENBIT>
		       <C-DOOR-CLOSES "down the hall">)>
		<COND (<G? ,CIRCUIT-LOC 8>
		       <SETG CIRCUIT-LOC 1>)>
		<RETURN ,CIRCUIT>)
	       (<EQUAL? ,P-WALK-DIR <GET ,CIRCUIT-EXITS <+ ,CIRCUIT-LOC 3>>>
		<TELL-WALK <+ ,CIRCUIT-LOC 3>>
		<SETG CIRCUIT-LOC <- ,CIRCUIT-LOC 1>>
		<FIND-BOX>
		<COND (<FSET? ,CIRCUIT-DOOR ,OPENBIT>
		       <C-DOOR-CLOSES "down the hall">)>
		<COND (<L? ,CIRCUIT-LOC 1>
		       <SETG CIRCUIT-LOC 8>)>
		<RETURN ,CIRCUIT>)
	       (<EQUAL? ,P-WALK-DIR <GET ,CIRCUIT-EXITS <+ ,CIRCUIT-LOC 5>>>
		<CIRCUIT-EXIT>)
	       (T
		<TELL ,CANT-GO>
		<RFALSE>)>>

;"ACCESS BOXES"

<ROUTINE FIND-BOX ()
	 <COND (<EQUAL? ,CIRCUIT-LOC 4 8 0>
    		<PUTP ,BOX ,P?SDESC "low access box">
		<PUTP ,BOX ,P?SIZE 1>)
	       (<EQUAL? ,CIRCUIT-LOC 1 3 5 7>
		<PUTP ,BOX ,P?SDESC "advanced access box">
		<PUTP ,BOX ,P?SIZE 2>)
	       (<EQUAL? ,CIRCUIT-LOC 2 6>
		<PUTP ,BOX ,P?SDESC "high access box">
		<PUTP ,BOX ,P?SIZE 3>)>>
	       
<OBJECT BOX
	(IN LOCAL-GLOBALS)
	(SDESC "low access box")
	;(DESCFCN DESC-BOX)
	(SYNONYM BOX SCANNER)
	(ADJECTIVE LOW ADVANCED HIGH ACCESS)
	(SIZE 1)
	(ROUTINE BOX-F)>

;<ROUTINE DESC-BOX ()
	 <TELL
"Mounted by the " D ,CIRCUIT-DOOR " is a " D ,BOX "." CR>>

<ROUTINE BOX-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The " D ,BOX " encases a tiny infrared scanner." CR>)>>  

<OBJECT GLOVE-1
	(IN ROOM-4)
	(SYNONYM GLOVE GLOVES PATTERN)
	(ADJECTIVE COPPER COLORE)
	(DESC "copper-colored glove")
	(FDESC 
"Lying discarded, or perhaps misplaced, on the floor is a copper-colored
glove.")
	(FLAGS TAKEBIT WEARBIT)
	(ACTION GLOVE-F)>

<OBJECT GLOVE-2
	(IN ROOM-4)
	(SYNONYM GLOVE)
	(ADJECTIVE SILVER COLORE)
	(DESC "silver-colored glove")
	(FLAGS TAKEBIT WEARBIT)
	(ACTION GLOVE-F)>

<OBJECT GLOVE-3
	(IN ROOM-4)
	(DESC "gold-colored glove")
	(SYNONYM GLOVE)
	(ADJECTIVE GOLD COLORE)
	(FLAGS TAKEBIT WEARBIT)
	(ACTION GLOVE-F)>

<ROUTINE GLOVE-F ()
	 <COND (<VERB? WEAR>
		<COND (<FSET? ,PRSO ,WORNBIT>
		       <TELL "You already are." CR>
		       <RTRUE>)
		      (T
		       <COND (<OR <FSET? ,GLOVE-1 ,WORNBIT>
				  <FSET? ,GLOVE-2 ,WORNBIT>
			          <FSET? ,GLOVE-3 ,WORNBIT>>
			      <TELL
"You'll have to remove the other glove your wearing first." CR>)>)
		      (T
		       <TELL "Okay, you're wearing the glove." CR>
		       <FSET ,PRSO ,WORNBIT>
		       <RTRUE>)>)
	       (<VERB? TAKE-OFF>
		<COND (<FSET? ,PRSO ,WORNBIT>
		       <TELL "Okay, you've removed the glove." CR>
		       <FCLEAR ,PRSO ,WORNBIT>
		       <RTRUE>)
		      (T
		       <TELL "But you aren't wearing the glove!" CR>
		       <RTRUE>)>)
	       (<VERB? EXAMINE>
		<TELL
"This is an extremely thin, " D ,PRSO ", owing its color to fine strands of
metal woven into the fabric." CR>)
	       (<VERB? WAVE-NEAR PUT>
		<COND (<PRSI? ,BOX>
		       <WAVE-GLOVE>)
		      (T
		       <TELL "Nothing happens." CR>)>)>>

<ROUTINE WAVE-GLOVE ("AUX" WHICH)
	 <COND (<FSET? ,GLOVE-1 ,WORNBIT> 
		<SET WHICH 2>)
	       (<FSET? ,GLOVE-2 ,WORNBIT>
		<SET WHICH 3>)
	       (<FSET? ,GLOVE-3 ,WORNBIT>
		<SET WHICH 4>)
	       (T
		<SET WHICH 1>)>
	 <COND (<AND <NOT <FSET? ,CIRCUIT-DOOR ,OPENBIT>>
		     <G? .WHICH <GETP ,BOX ,P?SIZE>>>
		<OPEN-CIRCUIT-DOOR>)
	       (T
		<TELL "Nothing happens." CR>)>>

<ROUTINE OPEN-CIRCUIT-DOOR ()
	 <TELL
,WHOOSH "the " D ,CIRCUIT-DOOR " slides open." CR>
	 <FSET ,CIRCUIT-DOOR ,OPENBIT>
	 <QUEUE I-CLOSE-CIRCUIT-DOOR 2>>

<ROUTINE I-CLOSE-CIRCUIT-DOOR ()
	 <TELL
,WHOOSH "the " D ,CIRCUIT-DOOR " slides shut." CR>
	 <FCLEAR ,CIRCUIT-DOOR ,OPENBIT>>

<GLOBAL WHOOSH "With a whooshing sound, ">

<ROUTINE SET-CIRCUIT-LOC ("AUX" CNT)
	 <SET CNT 1>
	 <REPEAT ()
	         <COND (<EQUAL? ,HERE <GET ,CIRCUIT-DOORS .CNT>>
			<SETG CIRCUIT-LOC .CNT>
			;<TELL "LOC = " N .CNT CR> ;"debugging only"
			<RETURN>)
		       (T
			<SET CNT <+ .CNT 1>>
			<COND (<EQUAL? .CNT 9>
			       <SETG CIRCUIT-LOC 1>
			       <RETURN>)>)>>>

<ROOM ROOM-1
      (IN ROOMS)
      (DESC "Room 1")
      (NE PER ENTER-CIRCUIT)
      (GLOBAL CIRCUIT-DOOR BOX)
      (FLAGS ONBIT RLANDBIT)>

<ROOM ROOM-2
      (IN ROOMS)
      (DESC "Room 2")
      (EAST PER ENTER-CIRCUIT)
      (GLOBAL CIRCUIT-DOOR BOX)
      (FLAGS ONBIT RLANDBIT)>

<ROOM ROOM-3
      (IN ROOMS)
      (DESC "Room 3")
      (SE PER ENTER-CIRCUIT)
      (GLOBAL CIRCUIT-DOOR BOX)
      (FLAGS ONBIT RLANDBIT)>

<ROOM ROOM-4
      (IN ROOMS)
      (DESC "Maintenance Lobby")
      (IN PER ENTER-ELEVATOR)
      (NORTH PER ENTER-ELEVATOR)
      (SOUTH PER ENTER-CIRCUIT)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL ELEVATOR-DOOR CALL-BUTTON CIRCUIT-DOOR BOX)
      (ACTION MAINT-LOBBY-F)
      ;(THINGS <PSEUDO (<> MAGAZINES NOT-IMPORTANT)   ;"TO BE IMPLEMENTED"
		      (<> DESK NOT-IMPORTANT)>)>

<ROUTINE NOT-IMPORTANT ()
	 <TELL
"That's not important; leave it alone." CR>>

<ROUTINE MAINT-LOBBY-F (RARG)
	 <COND (<EQUAL? .RARG M-LOOK>
	 	<TELL 
"You are in a lobby of some kind, furnished with comfortable couches,
and a desk, onto which some magazines have been rudely thrusted.">
		<TELL
" A " D ,CIRCUIT-DOOR ", to the south, is ">
		<COND (<FSET? ,CIRCUIT-DOOR ,OPENBIT>
		       <TELL ,SEE-THRU "a brightly-lit hallway">)
		      (T
		       <TELL ,D-SHUT>)>
		<TELL ". Next to the door is a " D ,BOX ".">
		<DESC-VTR-ENTRANCE "northern">)>>

<OBJECT COUCH
	(IN ROOM-4)
	(SYNONYM COUCH SEAT)
	;(ADJECTIVE COMFY COMFORTABLE)
	(DESC "couch")
	(FLAGS NDESCBIT SURFACEBIT OPENBIT FURNITURE VEHBIT)>

<ROOM ROOM-5
      (IN ROOMS)
      (DESC "Room 5")
      (SW PER ENTER-CIRCUIT)
      (GLOBAL CIRCUIT-DOOR BOX)
      (FLAGS ONBIT RLANDBIT)>

<ROOM ROOM-6
      (IN ROOMS)
      (DESC "Room 6")
      (WEST PER ENTER-CIRCUIT)
      (GLOBAL CIRCUIT-DOOR BOX)
      (FLAGS ONBIT RLANDBIT)>

<ROOM ROOM-7
      (IN ROOMS)
      (DESC "Room 7")
      (NW PER ENTER-CIRCUIT)
      (GLOBAL CIRCUIT-DOOR BOX)
      (FLAGS ONBIT RLANDBIT)>

<ROOM ROOM-8
      (IN ROOMS)
      (DESC "Room 8")
      (NORTH PER ENTER-CIRCUIT)
      (GLOBAL CIRCUIT-DOOR BOX)
      (FLAGS ONBIT RLANDBIT)>

<OBJECT CIRCUIT-DOOR
	(IN LOCAL-GLOBALS)
	(DESC "reinforced metal door")
	(SYNONYM DOOR)
	(ADJECTIVE REINFO METAL)
	(FLAGS DOORBIT NDESCBIT)
	(ACTION CIRCUIT-DOOR-F)>

<ROUTINE CIRCUIT-DOOR-F ()
	 <COND (<VERB? OPEN PUSH MOVE>
		<TELL ,CANT-BUDGE D ,CIRCUIT-DOOR CR>)>>

<ROUTINE C-DOOR-CLOSES (WHERE)
	 <TELL
"As you walk " .WHERE ", the " D ,CIRCUIT-DOOR " closes with a whooshing
sound." CR CR>
	 <DEQUEUE I-CLOSE-CIRCUIT-DOOR>
	 <FCLEAR ,CIRCUIT-DOOR ,OPENBIT>>

<ROUTINE ENTER-CIRCUIT ()
	 <COND (<FSET? ,CIRCUIT-DOOR ,OPENBIT>
		<C-DOOR-CLOSES "through the door">
		<SET-CIRCUIT-LOC>
		<QUIT-ELEVATOR>
		<FIND-BOX>
		<RETURN ,CIRCUIT>)
	       (T
		<TELL
"But the " D ,CIRCUIT-DOOR " isn't open!" CR>
		<RFALSE>)>>

<ROUTINE CIRCUIT-EXIT ("AUX" EXIT-LOC)
	 <COND (<FSET? ,CIRCUIT-DOOR ,OPENBIT>
	 	<C-DOOR-CLOSES "through the door">
		<SET-VTR ,CIRCUIT-LOC>
	 	<SET EXIT-LOC ,CIRCUIT-LOC>
  		<SETG CIRCUIT-LOC 0>
		<FIND-BOX>
	 	<RETURN <GET ,CIRCUIT-DOORS .EXIT-LOC>>)
	       (T
		<TELL "The " D ,CIRCUIT-DOOR " isn't open." CR>
		<RFALSE>)>>

;"------ PATROLS ------"

;"--PAT-1-- (CIRCUIT AREA)"

<OBJECT PATROL-1
	(IN LOCAL-GLOBALS)
	(SYNONYM GUARD GUARDS MEN)
	(ADJECTIVE PATROL ARMED)
	(DESC "patrol of armed guards")
	(FLAGS ACTORBIT ;SHOOTBIT NDESCBIT)
	;(ACTION PATROL-1-F)> 
 

