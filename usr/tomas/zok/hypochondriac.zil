;"*** HYPOCHONDRIAC ***"

<OBJECT KJHHDSD
	(IN GLOBAL-OBJECTS)
	(DESC "PLACEHOLDER")
	(LDESC "PLACEHOLDER")
	(FDESC "PLACEHOLDER")
	(SYNONYM KJSKDF)
	(ADJECTIVE KJHDKSHD)
	(NORTH TO KJHHDSD)
	(SOUTH TO KJHHDSD)
	(EAST TO KJHHDSD)
	(WEST TO KJHHDSD)
	(NE TO KJHHDSD)
	(NW TO KJHHDSD)
	(SE TO KJHHDSD)
	(SW TO KJHHDSD)
	(UP TO KJHHDSD)
	(DOWN TO KJHHDSD)
	(IN TO KJHHDSD)
	(OUT TO KJHHDSD)
	(DESCFCN MMMM-F)
	(SIZE 5)
	(GENERIC MMMM-F)
	(CAPACITY 5)
	(ACTION MMMM-F)
	(THINGS <PSEUDO (JHSG JHGDSF MMMM-F)>)>

<ROUTINE MMMM-F ("OPTIONAL" (OARG <>))
	 <COND (.OARG
		<RTRUE>)>>



;"---------------------- GENERAL LAYOUT ----------------------"


<ROOM BEDROOM
      (IN ROOMS)
      (DESC "Your Bedroom")
      (WEST TO BATHROOM)
      (SOUTH PER BEDROOM-EXIT)
      (OUT PER BEDROOM-EXIT)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL BEDROOM-DOOR BED ELSA TV)
      (ACTION BEDROOM-F)>

<ROUTINE BEDROOM-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"It may be a disaster area, but it's your disaster area. Like towers rising
above rubble, your bed and a low-quality stereo system loom above mounds of
papers, clothes, boxes, and elderly food scraps. Off to the west is your
bathroom, and ">
		<COND (<FSET? ,BEDROOM-DOOR ,OPENBIT>
		       <TELL
"a hallway is visible to the south, through an open doorway">)
		      (T
		       <TELL
"there is a closed door on the south wall">)>
		<TELL ". The television lights the room with an eerie glow.">
		<CRLF> <CRLF>)>>

<ROUTINE BEDROOM-EXIT ()
	 <COND (<NOT <FSET? ,BEDROOM-DOOR ,OPENBIT>>
		<TELL
"You'll have to open the door first." CR>
	        <RFALSE>)
	       (,ELSA-ON-PHONE?
		<TELL
"Cautiously, you step through your doorway." CR CR>
	      	<QUEUE BEGIN-CHASE 1>
		<RETURN ,HALLWAY>)
	       (T
		<TELL
"As you are leaving your bedroom, Elsa goose-steps up to you.|
   \"Vat arr yu doinge outt af bedt? Gett back tu bedd riht nowe!!!\"|
Forcefully, she places you back into your bedroom." CR>
		<RFALSE>)>>

<ROOM IN-BED
      (IN ROOMS)
      (DESC "In Bed")
      (LDESC
"You are lying in bed, immersed in comfy, blue and green pastel quilts,
contemplating the term 'boredom.'")
      (OUT TO BEDROOM)
      (GLOBAL BED TV)
      (FLAGS RLANDBIT ONBIT)>

<ROOM HALLWAY
      (IN ROOMS)
      (DESC "In the Hall")
      (NORTH PER BEDROOM-ENTER)
      (SOUTH PER GUEST-ROOM-ENTER)
      (EAST "That would mean certain doom.")
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL BEDROOM-DOOR ELSA GUEST-ROOM-DOOR)
      (ACTION HALLWAY-F)>

<ROUTINE HALLWAY-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are standing in the hallway, equidistant from your bedroom (to the
north), the guest room (to the south), and Elsa (to the east">
		<COND (<NOT <FSET? ,HALLWAY ,FEMALEBIT>>
		       <FSET ,HALLWAY ,FEMALEBIT>
		       <TELL ", talking on the phone">)
		      (T
		       <TELL ", rushing toward you">)>
		<TELL ")." CR>)>>

<ROUTINE GUEST-ROOM-ENTER ()
	 <TELL "You dash into the guest room, slamming the door behind
you." CR CR>
	 <FCLEAR ,GUEST-ROOM-DOOR ,OPENBIT>
	 <RETURN ,GUEST-ROOM>>

<ROUTINE BEDROOM-ENTER ()
	 <TELL
"You dash into your bedroom, slamming the door behind you." CR CR>
	 <FCLEAR ,BEDROOM-DOOR ,OPENBIT>
	 <RETURN ,BEDROOM>> 

<ROOM GUEST-ROOM
      (IN ROOMS)
      (DESC "Guest Room")
      (LDESC
"You are in the seldom-used guest room. In sharp contrast with what you
are used to, everything seems to be in its proper, orderly place. A double
bed is neatly made, and there is plenty of wood, stacked neatly, to the
side of a wide fireplace. A door on the north wall, through which you entered,
is closed.")
      (NORTH TO HALLWAY IF GUEST-ROOM-DOOR IS OPEN)
      (GLOBAL GUEST-ROOM-DOOR FIREPLACE BED)
      (FLAGS ONBIT RLANDBIT)
      ;(ACTION GUEST-BEDROOM-F)
      (THINGS <PSEUDO (WOOD PILE WOOD-PILE-F)>)>

<ROUTINE WOOD-PILE-F ()
	 <TELL
"Don't worry about it. It's not important." CR>>

<OBJECT FIREPLACE
	(IN LOCAL-GLOBALS)
	(DESC "fireplace")
	(SYNONYM FIREPLACE PLACE)
	(ADJECTIVE FIRE)
	(FLAGS NDESCBIT)
        (ACTION FIREPLACE-F)>

<ROUTINE FIREPLACE-F ()
	 <COND (<VERB? BOARD ENTER>
		<COND (<EQUAL? ,HERE ,GUEST-ROOM>
		       <GET-IN-FIREPLACE>)
		      (T
		       <TELL
"Look around you." CR>)>)
	       (<VERB? EXIT LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,IN-FIREPLACE>
		       <TELL
"You step back out into the guest room." CR>
		       <GOTO ,GUEST-ROOM>)
		      (T
		       <TELL
"Look around you." CR>)>)>>

<ROUTINE GET-IN-FIREPLACE ()
	 <TELL
"With fleet movements, you scramble into the fireplace." CR CR>
	 <GOTO ,IN-FIREPLACE>>

<ROOM IN-FIREPLACE
      (IN ROOMS)
      (DESC "In the Fireplace")
      (LDESC
"You are sitting quite still, peering out of the fireplace. As you sit here,
you can't help feeling uneasy, as if someone were behind you, watching and
waiting. You glance back once, but see nothing unusual, except that the
nature of the rear wall of the fireplace seems to be quite odd-looking.")
      (OUT TO GUEST-ROOM)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL FIREPLACE ELSA)> 

<OBJECT GUEST-ROOM-DOOR
	(IN LOCAL-GLOBALS)
	(DESC "guest room door")
	(SYNONYM DOOR)
	(ADJECTIVE GUEST ROOM)
	(FLAGS NDESCBIT DOORBIT OPENBIT)>

<ROOM BATHROOM
      (IN ROOMS)
      (DESC "Bathroom")
      (LDESC
"You bathroom, equipped with all of the modern efficiencies, is small but 
habitable. Knowingly, you avoid looking in the mirror. The exit is to the
east.")
      (EAST PER RUN-TO-BEDROOM)
      (OUT PER RUN-TO-BEDROOM)
      (FLAGS ONBIT RLANDBIT)
      (THINGS <PSEUDO (<> BATH FIXTURE-F)
		      (<> TUB  FIXTURE-F)
		      (<> TOILET FIXTURE-F)
		      (<> MIRROR FIXTURE-F)
		      (<> SINK FIXTURE-F)
		      (<> SHOWER FIXTURE-F)
		      (<> JOHN FIXTURE-F)>)>

<ROUTINE RUN-TO-BEDROOM ()
	 <COND (<RUNNING? ,I-CHASE>
		<TELL
"But Elsa's hurtling mass is in the way!" CR>
		<RFALSE>)
	       (T
		<RETURN ,BEDROOM>)>>

<ROUTINE FIXTURE-F ()
	 <TELL 
"Don't bother with that; it's too early in the morning for that sort of
thing." CR>>

<OBJECT TRASH-CAN
	(IN BEDROOM)
	(DESC "trash can")
	(LDESC 
"A trash can sits neglected in one corner, a monument to futility.")
	(SYNONYM CAN)
	(ADJECTIVE TRASH GARBAGE)
	(FLAGS CONTBIT SEARCHBIT OPENBIT TRYTAKEBIT)
	(ACTION TRASH-CAN-F)>

<ROUTINE TRASH-CAN-F ()
	 <COND (<VERB? SEARCH>
		<TELL
"You sift through some of the trash, retrieving">
		<COND (<IN? ,KLEENEX ,TRASH-CAN>
		       <MOVE ,KLEENEX ,PROTAGONIST>
		       <FCLEAR ,KLEENEX ,INVISIBLE>
		       <TELL AR ,KLEENEX>)
		      (<IN? ,GOOD-CASSETTE ,TRASH-CAN>
		       <MOVE ,GOOD-CASSETTE ,PROTAGONIST>
		       <FCLEAR ,GOOD-CASSETTE ,INVISIBLE>
		       <TELL AR ,GOOD-CASSETTE>)
		      (T
		       <TELL 
" a handful of lint, which you sensitively toss back." CR>)>)
	       (<VERB? LOOK-INSIDE EXAMINE>
		<TELL "The " D ,TRASH-CAN " is
full of (quite unsurprisingly) garbage. From the
looks of the room around you, you suspect that the can is there for the
garbage's own protection." CR>)
	       (<AND <VERB? PUT>
	      	     <PRSI? ,TRASH-CAN>>
		<TELL 
"Come on now," T ,PRSO " isn't all that bad!" CR>)
	       (<VERB? TAKE>
		<TELL
"Don't worry, " D ,ELSA " will take out the trash eventually." CR>)>>

<OBJECT KLEENEX
	(IN TRASH-CAN)
	(DESC "soiled kleenex")
	(SYNONYM KLEENEX)
	(ADJECTIVE SOILED)
	(FLAGS TAKEBIT INVISIBLE)>

<OBJECT TRAY
	(IN PROTAGONIST)
	(DESC "tray of evil applesauce")
	(SYNONYM APPLES)
	(ADJECTIVE EVIL TRAY)
	(FLAGS TAKEBIT)
	(ACTION TRAY-F)>

<ROUTINE TRAY-F ()
	 <COND (<VERB? EXAMINE EAT>
		<TELL
"You suspect that " D ,ELSA " has spiked your applesauce with aspirin." CR>)>>

<OBJECT ELSA
	(IN LOCAL-GLOBALS)
	(DESC "Elsa")
	(SYNONYM ELSA MAID)
	(ADJECTIVE SWEDISH)
	(FLAGS ACTORBIT NDESCBIT NARTICLEBIT)
	(ACTION ELSA-F)>

<ROUTINE ELSA-F ()
	 <COND (<TALKING-TO? ,ELSA>
		<COND (<RUNNING? ,ELSA-ANSWERS>
		       <STOP>)
		      (<EQUAL? ,HERE ,BEDROOM ,IN-BED ,BATHROOM>
		       <TELL
"Elsa isn't here (thankfully)." CR>
		       <STOP>)
		      (T
		       <TELL
"Ignoring your words, Elsa continues to sprint toward you." CR>
		       <STOP>)>)>>

<OBJECT BEDROOM-DOOR
	(IN LOCAL-GLOBALS)
	(DESC "bedroom door")
	(SYNONYM DOOR)
	(ADJECTIVE MY BEDROOM)
	(FLAGS NDESCBIT DOORBIT)> 

<OBJECT TV
	(IN LOCAL-GLOBALS)
	(DESC "television set")
	(SYNONYM SET TUBE CHANNEL STATION)
	(ADJECTIVE BOOB TELEVISION TV)
	(FLAGS ONBIT NDESCBIT)
	(ACTION TV-F)>

<ROUTINE TV-F ()
	 <COND (<VERB? EXAMINE>
	        <TELL
"A captivating soap opera dribbles out of" TR ,TV>)
	       (<VERB? OFF SET>
		<TELL
"You can't bring yourself to; the soap opera is too captivating. Will Brad
and Monica file for divorce, or will Blake return from Mozambique and affect
a 'Palimony' suit first??" CR>)>>

<OBJECT BED
	(IN LOCAL-GLOBALS)
	(DESC "your bed")
	(SYNONYM BED)
	(ADJECTIVE MY)
	(FLAGS NDESCBIT)
	(ACTION BED-F)>

<ROUTINE BED-F ()
	 <COND (<VERB? ENTER BOARD>
		<COND (<EQUAL? ,HERE ,GUEST-ROOM>
		       <NOT-GOOD-PLACE>)
		      (T
		       <GET-IN-BED <>>
		       <RTRUE>)>)
	       (<VERB? EXIT LEAVE DISEMBARK>
		<GET-OUT-OF-BED <>>
		<RTRUE>)
	       (<VERB? CRAWL-UNDER HIDE>
		<NOT-GOOD-PLACE>)>>

<ROUTINE NOT-GOOD-PLACE ()
	 <TELL 
"That's not a very good hiding place." CR>
	 <COND (<RUNNING? ,I-CHASE>
		<DEQUEUE I-CHASE>
		<QUEUE I-CHASE 2>)>>

<ROUTINE GET-IN-BED ("OPTIONAL" (PER? T))
	 <COND (<EQUAL? ,HERE ,IN-BED>
		<TELL
"You're already in bed!" CR>
		<COND (.PER?
		       <RFALSE>)>)
	       (T
		<COND (<RUNNING? ,I-CHASE>
		       <TELL "You dive for the bed, but ">
		       <I-CHASE>)
		      (T
		       <TELL
"Gingerly, you crawl into your bed, and under the abundant quilts." CR CR>
		       <COND (.PER?
		       	      <RETURN ,IN-BED>)
		      	     (T
		       	      <GOTO ,IN-BED>)>)>)>>
		
<ROUTINE GET-OUT-OF-BED ("OPTIONAL" (PER? T))
	 <COND (<NOT <EQUAL? ,HERE ,IN-BED>>
		<TELL
"You're not in the bed!" CR>
		<COND (.PER? 
		       <RFALSE>)>)
	       (T
		<TELL
"Exercising much self-dicipline, you get out of bed." CR CR>
		<COND (<EQUAL? ,MUSIC-PLAYING -1>
		       <SETG MUSIC-PLAYING 0>
		       <QUEUE ELSA-DUCKS-IN 1>)>
	        <COND (.PER?
		       <RETURN ,BEDROOM>)
		      (T
		       <GOTO ,BEDROOM>)>)>>
 
<ROUTINE ELSA-DUCKS-IN ()
	 ;<SETG MUSIC-PLAYING 0>   ;"NOW HANDLED ABOVE."
         <TELL
CR "Elsa ducks her head in the door.|
   \"Iff yur parens' fone rlings, it for me, 'kay? My Svenske famnily kall.
Gett back tu bedd nowe!\"" CR>>

<OBJECT FAKE-WALL 
	(IN IN-FIREPLACE)
	(DESC "rear wall of the fireplace")
	(SYNONYM WALL)
	(ADJECTIVE REAR BACK SHIMMER)
	(FLAGS NDESCBIT)
	(ACTION FAKE-WALL-F)>

<ROUTINE FAKE-WALL-F ()
	 <COND (<VERB? EXAMINE LOOK-INSIDE>
		<TELL
"As you look at it closer, you feel your forehead to make sure that you
are feverless. The " D ,FAKE-WALL " appears to be shimmering slightly, as
if it weren't really there at all." CR>)
	       (<VERB? ENTER BOARD>
		<TELL
"Cautiously, in utter disbelief, you pass first a hand, then an arm, then
your whole body through" T ,FAKE-WALL "..." CR>
		<SETG SCORE <+ ,SCORE 15>>
		<RE-GO>)>>


;"---------------------- STEREO & TAPES ----------------------"


<GLOBAL MUSIC-PLAYING -1>    ;"STARTS AT -1, IS SET TO 0 WHEN YOU GET UP."

<OBJECT CASSETTE-1
	(IN CASSETTE-CASE)
	(DESC "Ozzy Frobozzborne cassette")
	(SYNONYM CASSETTE TAPE)
	(ADJECTIVE OZZY FROBOZ)
	(FLAGS TAKEBIT VOWELBIT)
	(ACTION TAPE-F)>

<OBJECT CASSETTE-2
	(IN CASSETTE-CASE)
	(DESC "Wild Frobless Banshees cassette")
	(SYNONYM CASSETTE TAPE)
	(ADJECTIVE WILD FROBLE BANSHE)
	(FLAGS TAKEBIT)
	(ACTION TAPE-F)>

<OBJECT CASSETTE-3
	(IN CASSETTE-CASE)
	(DESC "Cyclopes cassette")
	(SYNONYM CASSETTE TAPE)
	(ADJECTIVE CYCLOP)
	(FLAGS TAKEBIT)
	(ACTION TAPE-F)>

<OBJECT CASSETTE-4
	(IN CASSETTE-CASE)
	(DESC "Fleshballs (live) cassette")
	(SYNONYM CASSETTE TAPE)
	(ADJECTIVE FLESHB LIVE)
	(FLAGS TAKEBIT)
	(ACTION TAPE-F)>

<OBJECT GOOD-CASSETTE
	(IN TRASH-CAN)
	(DESC "mangled cassette")
	(SYNONYM TAPE CASSETTE)
	(ADJECTIVE JAN RISSKER TEACHE SWEDISH MANGLED)
	(FLAGS TAKEBIT TRYTAKEBIT INVISIBLE)
	(ACTION TAPE-F)>

<ROUTINE TAPE-F ()
	 <COND (<AND <VERB? TAKE REMOVE>
		     <IN? ,PRSO ,STEREO>>
		<TELL "You'll have to use the eject button." CR>)
	       (<AND <VERB? PUT>
		     <PRSI? ,STEREO>>
		<COND (<NOT <FIRST? ,STEREO>>
		       <COND (<NOT <EQUAL? ,MUSIC-PLAYING 0>>
		      	      <TELL
"You'll have to press the stop button first." CR>
			      <RTRUE>)
			     (T
			      <TELL
"Okay, you put" T ,PRSO " into the cassette slot." CR>
		       <MOVE ,PRSO ,STEREO>)>)
		      (T
		       <TELL
"You'll have to take" T <FIRST? ,STEREO> " out of the cassette slot first."
CR>)>)
	      (<VERB? EXAMINE>
	       <COND (<EQUAL? ,PRSO ,GOOD-CASSETTE>
		      <TELL
"It's label has been diligently scratched off by somebody. But you can still
make out one word, perhaps a name: \"Risskerson\"." CR>)>)>>

<OBJECT CASSETTE-CASE
	(IN BEDROOM)
	(DESC "battered case")
        (FDESC 
"Lying abandoned near the stereo is an old, battered case.")
	(SYNONYM CASE)
	(ADJECTIVE BATTER OLD)
	(CAPACITY 25)
	(FLAGS TAKEBIT SEARCHBIT CONTBIT)>

<OBJECT STEREO
	(IN BEDROOM)
	(DESC "lo-fi stereo system")
	(SYNONYM SYSTEM SPEAKER SLOT)
	(ADJECTIVE STEREO LO-FI LOW QUALITY)
	(FLAGS NDESCBIT TRYTAKEBIT CONTBIT SEARCHBIT OPENBIT)
	(ACTION STEREO-F)>

<ROUTINE STEREO-F ()
	 <COND (<VERB? ON OFF>
		<TELL
"You have long since lost track of where the power switch is. As a result," T
,STEREO " is perptually turned on." CR>)
	       (<VERB? TAKE>
		<TELL
"You'd have to be an electrician to unwire all of the stereo's cords." CR>)
	       (<VERB? EXAMINE>
		<TELL
"It's not good, but at least it's enormous. The radio doesn't work properly,
and the record player was given to GoodWill last winter. Only the tape
player remains intact, its cassette-shaped slot begging for something
loud and tasteless. Three buttons marked 'PLAY', 'STOP', and
'EJECT' are beneath the slot, along with holes where other buttons once were."
CR>)>> 

<OBJECT PLAY-BUTTON
	(IN BEDROOM)
	(DESC "'PLAY' button")
	(SYNONYM BUTTON)
	(ADJECTIVE PLAY)
	(FLAGS NDESCBIT)
	(ACTION PLAY-BUTTON-F)>

<ROUTINE PLAY-BUTTON-F ()
	 <COND (<VERB? PUSH LOWER>
		<COND (<EQUAL? ,MUSIC-PLAYING 0>
		       <TELL
"You push" T ,PLAY-BUTTON ". Immediately, a ">
		       <COND (<IN? ,GOOD-CASSETTE ,STEREO>
			      <SETG MUSIC-PLAYING 
"smooth voice speaking Swedish">)
			     (<NOT <FIRST? ,STEREO>>
			      <SETG MUSIC-PLAYING 
"high-pitched whine">)
			     (T
			      <SETG MUSIC-PLAYING
"rancid stream of heavy metal hell">)>
		       <TELL ,MUSIC-PLAYING " spews forth from speakers,
hidden deep within the trash on the floor." CR>
		       <QUEUE I-RUN-MUSIC 2>)
		      (T
		       <TELL
"The " D ,PLAY-BUTTON " is already depressed." CR>
		       <RTRUE>)>)>>

<ROUTINE I-RUN-MUSIC ()
	 <QUEUE I-RUN-MUSIC -1>
	 <COND (<EQUAL? ,HERE ,BEDROOM ,IN-BED>
	 	<TELL
CR "The " ,MUSIC-PLAYING " continues to emit from the stereo." CR>)>>

<OBJECT STOP-BUTTON
	(IN BEDROOM)
	(DESC "'STOP' button")
	(SYNONYM BUTTON)
	(ADJECTIVE STOP)
	(FLAGS NDESCBIT)
	(ACTION STOP-BUTTON-F)>

<ROUTINE STOP-BUTTON-F ()
	 <COND (<VERB? PUSH LOWER>
		<TELL
"Okay, you press the stop button. ">
		<COND (<NOT <EQUAL? ,MUSIC-PLAYING 0>>
		       <TELL 
"The " ,MUSIC-PLAYING " comes to an abrupt halt, and" T ,PLAY-BUTTON " pops
up.">
		<SETG MUSIC-PLAYING 0>
	        <COND (,ELSA-ON-PHONE?
		       <ELSA-REALIZES>)>
	        <DEQUEUE I-RUN-MUSIC>)>
		<CRLF>)>>

<OBJECT EJECT-BUTTON
	(IN BEDROOM)
	(DESC "'EJECT' button")
	(SYNONYM BUTTON)
	(ADJECTIVE EJECT)
	(FLAGS NDESCBIT)
	(ACTION EJECT-BUTTON-F)>

<ROUTINE EJECT-BUTTON-F ()
	 <COND (<VERB? PUSH LOWER>
		<COND (<NOT <EQUAL? ,MUSIC-PLAYING 0>>
		       <TELL
"You'll have to press" T ,STOP-BUTTON " first." CR>)
		      (T
		       <TELL
"Okay, you press the eject button. ">
		       <COND (<NOT <FIRST? ,STEREO>>
		       	      <CRLF>)
		      	     (T
		       	      <TELL
"The " D <FIRST? ,STEREO> " pops out of the slot and lands on the floor." CR>
		       	      <MOVE <FIRST? ,STEREO> ,BEDROOM>)>)>)>>


;"---------------------- PHONE STUFF ----------------------" 


<OBJECT PHONE
	(IN BEDROOM)
	(DESC "telephone")
	(LDESC
"Nearby the bed, a designer telephone lies on its side. Next to it is a list
of phone-numbers, printed on a yellowing piece of paper.")
	(SYNONYM PHONE TELEPH)
	(ADJECTIVE DESIGN)
	(ACTION PHONE-F)>

<ROUTINE PHONE-F ()
	 <COND (<VERB? TAKE LISTEN>
		<COND (,ELSA-ON-PHONE?
		       <TELL
"You hear Elsa attempting to carry on a conversation with the recording of
a Swedish voice, which is playing on your stereo." CR>)
		      (T 
		       <TELL
"You hear a dial tone." CR>)>)>>

<OBJECT LIST
	(IN BEDROOM)
	(DESC "yellowing phone list")
	(SYNONYM LIST PAPER)
	(ADJECTIVE YELLOW PHONE PIECE)
	(FLAGS NDESCBIT TRYTAKEBIT READBIT)
	(TEXT
"  PHONE LIST:|
ME...........547-3412|
HOME.........491-7750|
HOLLYWOOD....789-4743|
BUZZY'S RB...778-6153|
|
(Your parents wisely got you your own phone line on your thirteenth birthday.
They couldn't bear to have their line tied up all night.)")
	(ACTION LIST-F)>

<ROUTINE LIST-F ()
	 <COND (<VERB? TAKE>
		<TELL
"You'd do better leaving that near the phone." CR>)>>

;"PHONE NUMBER STUFF"

<ROUTINE NUMBER? (PTR "AUX" CNT BPTR CHR (SUM 0) (TIM <>) (EXC <>))
	 <SET CNT <GETB <REST ,P-LEXV <* .PTR 2>> 2>>
	 <SET BPTR <GETB <REST ,P-LEXV <* .PTR 2>> 3>>
	 <REPEAT ()
		 <COND (<L? <SET CNT <- .CNT 1>> 0> <RETURN>)
		       (T
			<SET CHR <GETB ,P-INBUF .BPTR>>
			<COND (<==? .CHR 58>
			       <COND (.EXC <RFALSE>)>
			       <SET TIM .SUM>
			       <SET SUM 0>)
			      (<==? .CHR 45>
			       <COND (.TIM <RFALSE>)>
			       <SET EXC .SUM>
			       <SET SUM 0>)
			      (<G? .SUM 9999>
			       <SET SUM 10000>
			       <RETURN>)
			      (<AND <L? .CHR 58> <G? .CHR 47>>
			       <SET SUM <+ <* .SUM 10> <- .CHR 48>>>)
			      (T <RFALSE>)>
			<SET BPTR <+ .BPTR 1>>)>>
	 <PUT ,P-LEXV .PTR ,W?INTNUM>
	 <PUT ,AGAIN-LEXV .PTR ,W?INTNUM>
	 <COND ;(<G? .SUM 9999> <RFALSE>)
	       (.EXC
		<SETG P-EXCHANGE .EXC>)
	       (.TIM
		<SETG P-EXCHANGE 0>
		<COND (<G? .TIM 23> <RFALSE>)
		      (<G? .TIM 19> T)
		      (<G? .TIM 12> <RFALSE>)
		      (<G? .TIM  7> T)
		      (T <SET TIM <+ 12 .TIM>>)>
		<SET SUM <+ .SUM <* .TIM 60>>>)
	       (T <SETG P-EXCHANGE 0>)>
	 <SETG P-NUMBER .SUM>
	 ,W?INTNUM>

<GLOBAL P-NUMBER 0>
<GLOBAL P-EXCHANGE 0>

<ROUTINE V-PHONE () ;("AUX" PER)
	 <COND (<NOT <EQUAL? ,HERE ,BEDROOM>>
		<TELL
"There's no phone here!" CR>)
	       (<AND ,PRSI 
                     <NOT <EQUAL? ,PRSI ,PHONE>>>
		<TELL "Too bad" T ,PRSI " isn't a telephone." CR>)
	       ;(<FSET? ,PHONE ,PHONE-DEAD-BIT>
	        <TELL "You don't hear a dial tone. The line is dead." CR>)
	       (<EQUAL? ,PRSO ,INTNUM>
	       ;<DISABLE <INT I-HANG-UP>>
		<COND (<OR <G? ,P-EXCHANGE 999>
			   <G? ,P-NUMBER 9999>>
		       <TELL
"You dialed too many numbers. Mom and Dad would kill you if you dialed out
of state!" CR>)
		      (<AND <EQUAL? ,P-EXCHANGE 0>
			    <EQUAL? ,P-NUMBER 0>>
		       <TELL
"You dial the operator, who indignantly suggests you dial 911." CR>)
		      (<AND <EQUAL? ,P-EXCHANGE 0>
			    <EQUAL? ,P-NUMBER 411>>
		       <TELL
"The information operator, in an inhuman voice, recommends you consult
your directory if you need a number." CR>)
		      (<AND <EQUAL? ,P-EXCHANGE 0>
			    <EQUAL? ,P-NUMBER 911>>
		       <TELL
"A police officer answers the phone in mid-snore saying he'll send a car right
over, then hangs up and goes back to sleep." CR> 
		       <RTRUE>)
		      (<AND <EQUAL? ,P-EXCHANGE 547>
			    <EQUAL? ,P-NUMBER 3412>>
		       <TELL
"You hear a busy signal, which is unsurprising." CR>)
		      (<AND <EQUAL? ,P-EXCHANGE 778>
			    <EQUAL? ,P-NUMBER 6153>>
			    <TELL
"You hear a busy signal. You conclude that it would be quicker to write a
letter to Buzzy than to call him." CR>)
		      (<AND <EQUAL? ,P-EXCHANGE 789>
			    <EQUAL? ,P-NUMBER 4743>>
		            <TELL
"Hollywood answers sleepily, then hangs up the phone." CR>)
                      (<AND <EQUAL? ,P-EXCHANGE 491>
			    <EQUAL? ,P-NUMBER 7750>>
		       <TELL
"You hear Elsa's voice at the other end.|
   \"Ja? Ja? Allo?\"" CR>
		       <COND (<AND <NOT <EQUAL? ,MUSIC-PLAYING 0>>
				   <IN? ,GOOD-CASSETTE ,STEREO>>
			      <CRLF>
			      <TELL "Immediately, she begins">
			      <PHONE-WIN>)
			     (T
		       	      <QUEUE ELSA-ANSWERS 2>)>)
		      (<PROB 60>
		       <TELL
"The " D ,PHONE " rings and rings, but no one answers." CR>)
		      (T
		       <TELL
"The " D ,PHONE " is answered, \"Hello? Hello? Hey, what is this, a
crank call? You made my wife cry the last time you called, you
pervert.\" You hear the receiver slammed down." CR>)>)
	      ;(<IN? ,PRSO ,ROOMS>
		<TELL ,YOU-CANT "call another room">)
	       (T
	        <TELL "You must supply a phone number for" TR ,PRSO>)>>

<ROUTINE PHONE-WIN ()
	 <COND (<EQUAL? ,HERE ,BEDROOM>
	        <TELL
" a fascinating conversation with the
smooth, Swedish voice. Luckily, you cannot make out a word of it, so you put
down the handset." CR>)>
	 <QUEUE ELSA-REALIZES 3>
	 <SETG ELSA-ON-PHONE? T>>

<ROUTINE ELSA-ANSWERS ()
	 <COND (<AND <IN? ,GOOD-CASSETTE ,STEREO>
		     <NOT <EQUAL? ,MUSIC-PLAYING 0>>>
		<TELL "You hear elsa, on the other end of the line, begin">
		<PHONE-WIN>)
	       (T
		<TELL "Hearing ">
		<COND (<NOT <EQUAL? ,MUSIC-PLAYING 0>>
		       <TELL "a " ,MUSIC-PLAYING>)
		      (<TALKING-TO? ,ELSA>
		       <TELL "your voice">)
		      (T
		       <TELL "only silence">)>
		<TELL " on the other end, Elsa slams down the receiver,
cussing loudly in Swedish." CR>)>>

<GLOBAL ELSA-ON-PHONE? <>>

<ROUTINE ELSA-REALIZES ()
	 <SETG ELSA-ON-PHONE? <>>>

<ROUTINE BEGIN-CHASE ()
	 <TELL
CR "Elsa, seeing that you're out of bed, slams the phone down, curls her upper
lip in anger, and sprints toward you." CR>
	 <QUEUE I-CHASE 1>
	 <SETG ELSA-LOC ,HALLWAY>>

<ROUTINE I-CHASE ()
	 <QUEUE I-CHASE -1>
	 <COND (<OR <EQUAL? ,ELSA-LOC ,HERE>
		    <EQUAL? ,ELSA-OLD-LOC ,HERE>>
		<CRLF>
		<COND (<OR <AND <EQUAL? ,HERE ,GUEST-ROOM>
			        <NOT <FSET? ,GUEST-ROOM-DOOR ,OPENBIT>>>
			   <AND <EQUAL? ,HERE ,BEDROOM>
			        <NOT <FSET? ,BEDROOM-DOOR ,OPENBIT>>>>
		       <TELL
"Elsa throws open the door, bursts into the room,">)
		      (T 
		       <TELL
"Elsa catches up to you">)>
		       <FAKE-JIGS-UP
" and locks her tree-stump arms around your sapling
waist. Now fully convinced of your general good health and well-being, she
dresses you, packs your lunch, and sends you off with a pat to the hindside."
>)
	       (<EQUAL? ,HERE ,GUEST-ROOM ,BEDROOM>
		<TELL
CR "You can hear Elsa trying the door in the hallway. If I were you, I'd be
looking for a very good hiding place." CR>
		<SETG ELSA-OLD-LOC ,ELSA-LOC>
		<SETG ELSA-LOC ,GUEST-ROOM>)
	       (<EQUAL? ,HERE ,IN-FIREPLACE>
		<COND (,SEARCHING? 
		       <TELL
CR "Elsa is frantically looking about. Suddenly, her eyes fall upon the
welcome sight of two Converse sneakers peeking out of the fireplace. In
horror, you retract your feet, but all too late. She moves purposefully
toward the fireplace." CR>
		       <SETG ELSA-OLD-LOC ,ELSA-LOC>
       		       <SETG ELSA-LOC ,IN-FIREPLACE>)
		      (T 
		       <TELL
CR "Elsa bursts into the guest room, and begins to look about.
You can bet she knows that you're around here somewhere." CR>
		<SETG SEARCHING? T>)>)
	       (T
		<TELL
CR "You can hear Elsa's heavy footfalls hot on your trail." CR>
		<SETG ELSA-OLD-LOC ,ELSA-LOC>
		<SETG ELSA-LOC ,HERE>)>>

<GLOBAL SEARCHING? <>>

<GLOBAL ELSA-LOC <>>

<GLOBAL ELSA-OLD-LOC <>>

<ROUTINE FAKE-JIGS-UP (DESC)
	 <TELL .DESC>
	 <TELL CR CR
"      ****  You have been sent to school  ****" CR>
	 <FINISH>>

<ROUTINE RE-GO ()
	 <DEQUEUE I-CHASE>
	 <DEQUEUE I-RUN-MUSIC>
	 <SETG GAME-NAME "OUTCAST">
	 <SETG SECOND-HALF T>
	 <CLEAR-SCREEN>
	 <CRLF> <CRLF>
	 <V-VERSION>
	 <CRLF>
	 <GOTO ,CRAWLWAY>>

<GLOBAL GAME-NAME "HYPOCHONDRIAC">

<GLOBAL SECOND-HALF <>>