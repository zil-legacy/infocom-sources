<ROOM CRAWLWAY
      (IN ROOMS)
      (DESC "Low Crawl")
      (WEST PER CRAWL-W)
      (EAST PER CRAWL-E)
      (FLAGS RLANDBIT)
      (ACTION CRAWLWAY-F)>

<ROUTINE CRAWLWAY-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are on hands and knees in a low, narrow crawlspace, which extends
out of sight to the ">
		<COND (<EQUAL? ,CRAWL-NUM 1>
		       <TELL 
"east. The west wall, once shimmering and surreal, is now of solid brick">)
		      (<EQUAL? ,CRAWL-NUM 5>
		       <TELL 
"west. To the east, it is possible to wriggle out into a large room">)
		      (T
		       <TELL "east and west">)>
		<COND (<OR <G? ,CRAWL-NUM 1>
		           <FSET? ,TORCH ,TOUCHBIT>>
		       <TELL
". The torch's flickering flame">)
		      (T
		       <TELL
". A flaming torch, left here by some eerie coincidence,">)>
		<TELL
" casts spooky, flickering shadows on the " <GET ,WALL-TBL ,CRAWL-NUM> "
walls that surround you." CR>)>>

<GLOBAL CRAWL-NUM 1>

<GLOBAL WALL-TBL <TABLE 0
"brick" "plaster" "flagstone" "earthen" "rough-hewn rock">>

<ROUTINE CRAWL-E ()
	 <COND (<EQUAL? ,CRAWL-NUM 5>
		 <ENTER-HAZY>)
	       (T
		<TELL
"Progress is slow, but you manage to crawl some ways to the east." CR CR>
		<OBJECTS-TO-TABLE ,CRAWL-NUM>
		<SETG CRAWL-NUM <+ ,CRAWL-NUM 1>>
		<OBJECTS-TO-ROOM ,CRAWL-NUM>
		<FCLEAR ,CRAWLWAY ,TOUCHBIT>
		<RETURN ,CRAWLWAY>)>>

<ROUTINE CRAWL-W ()
	 <COND (<EQUAL? ,CRAWL-NUM 1>
		<TELL "Although once shimmering and surreal, the wall is now
of solid brick." CR>
		<RFALSE>)
	       (T
		<TELL
"Progress is slow, but you manage to crawl some ways to the west." CR CR>
		<OBJECTS-TO-TABLE ,CRAWL-NUM>
		<SETG CRAWL-NUM <- ,CRAWL-NUM 1>>
		<OBJECTS-TO-ROOM ,CRAWL-NUM>
		<FCLEAR ,CRAWLWAY ,TOUCHBIT>
		<RETURN ,CRAWLWAY>)>>

<ROUTINE OBJECTS-TO-TABLE (SLOC "AUX" TBL (CNT 0) (F <FIRST? ,CRAWLWAY>) N)
	 <SET TBL ,CRAWLWAY-OBJECTS-TABLE>
	 <REPEAT ()
		 <COND (.F <SET N <NEXT? .F>>)
		       (ELSE <RETURN>)>
		 <COND (<EQUAL? .F ,WINNER>)
		       (<FSET? .F ,TAKEBIT>
			<REPEAT ()
				<COND (<==? <GET .TBL .CNT> 0>
				       <PUT .TBL .CNT .SLOC>
				       <PUT .TBL <+ .CNT 1> .F>
				       <SET CNT <+ .CNT 2>>
				       <REMOVE .F>
				       <RETURN>)
				      (ELSE
				       <SET CNT <+ .CNT 2>>)>>)>
		 <SET F .N>>>

<ROUTINE OBJECTS-TO-ROOM (SLOC "AUX" TBL (CNT 0))
	 <SET TBL ,CRAWLWAY-OBJECTS-TABLE>
	 <REPEAT ()
		 <COND (<NOT <L? .CNT ,CRAWLWAY-OBJECT-TABLE-LENGTH>>
			<RETURN>)
		       (<EQUAL? <GET .TBL .CNT> .SLOC>
			<PUT .TBL .CNT 0>
			<MOVE <GET .TBL <+ .CNT 1>> ,CRAWLWAY>)>
		 <SET CNT <+ .CNT 2>>>>

<CONSTANT CRAWLWAY-OBJECT-TABLE-LENGTH 70>     ;"currently ? takeable objects"

<GLOBAL CRAWLWAY-OBJECTS-TABLE          ;"length should be 2*number of takies"
	<TABLE 0 0 0 0 0 0 0 0 0 0
	       0 0 0 0 0 0 0 0 0 0
	       0 0 0 0 0 0 0 0 0 0
	       0 0 0 0 0 0 0 0 0 0
	       0 0 0 0 0 0 0 0 0 0
	       0 0 0 0 0 0 0 0 0 0
	       0 0 0 0 0 0 0 0 0 0>>

<OBJECT TORCH
	(IN CRAWLWAY)
	(DESC "torch")
	(SYNONYM TORCH)
	(ADJECTIVE FLAMING)
	(FLAGS NDESCBIT ONBIT LIGHTBIT TAKEBIT)
	(ACTION TORCH-F)>

<ROUTINE TORCH-F ()
	 <COND (<FSET? ,TORCH ,TOUCHBIT>
		<FCLEAR ,TORCH ,NDESCBIT>)>
	 <RFALSE>>

<OBJECT REAL-WALL
	(IN CRAWLWAY)
	(DESC "solid brick wall")
	(SYNONYM WALL)
	(ADJECTIVE SOLID BRICK)
	(FLAGS NDESCBIT)>

;"CONTRA"

<ROUTINE ENTER-HAZY ()
	 <TELL
"You step out into the room, and stand up." CR CR>
	 <COND (<NOT <FSET? ,HAZY-ROOM ,TOUCHBIT>>
		<QUEUE SEE-CONTRA 1>)>
	 <RETURN ,HAZY-ROOM>>

<ROUTINE SEE-CONTRA ()
	 <TELL
"As you rub your eyes, irritated by the smog, you begin to make out the
form of a creature, apparently the source of the smoke, reclined on a chaise
in the center of the room. He's toking slowly on the biggest cigar that you've
ever seen." CR CR
"Suddenly, he leaps to his feet, having noticed you. \"Go away!! This is a
free fire zone!! Who sent you?! What do you want?!\"|
|
Judging by the fatigues in which he's clad, you'd say that he was"
AR ,CONTRA>
	 <FCLEAR ,CONTRA ,NDESCBIT>>

<ROOM HAZY-ROOM
      (IN ROOMS)
      (DESC "Hazy Room")
      (NORTH PER ENTER-BARE-HALL)
      (WEST TO CRAWLWAY)
      (FLAGS RLANDBIT)
      ;(GLOBAL DOOR-ONE DOOR-TWO DOOR-THREE DOOR-FOUR)
      (THINGS <PSEUDO ;(DOOR ONE ONE-FAKE-F)
		      ;(DOOR TWO TWO-FAKE-F)
		      ;(DOOR THREE THREE-FAKE-F)
		      ;(DOOR FOUR FOUR-FAKE-F)
		      (CORRECT DOOR GOOD-DOOR-F)
		      (GOOD DOOR GOOD-DOOR-F)
		      (TRUE DOOR GOOD-DOOR-F)
		      (RIGHT DOOR GOOD-DOOR-F)>)
      (ACTION HAZY-ROOM-F)>

;<ROUTINE ONE-FAKE-F ()
	 <FAKE-DOOR-NAME ,DOOR-ONE>>

;<ROUTINE TWO-FAKE-F ()
	 <FAKE-DOOR-NAME ,DOOR-TWO>>

;<ROUTINE THREE-FAKE-F ()
	 <FAKE-DOOR-NAME ,DOOR-THREE>>

;<ROUTINE FOUR-FAKE-F ()
	 <FAKE-DOOR-NAME ,DOOR-FOUR>>

;<ROUTINE FAKE-DOOR-NAME (WHICH)
	 <COND (<PRSO? ,PSEUDO-OBJECT>
		<PERFORM-PRSA .WHICH ,PRSI>)
	       (<PRSI? ,PSEUDO-OBJECT>
		<PERFORM-PRSA ,PRSO .WHICH>)>>

<ROUTINE HAZY-ROOM-F (RARG)    
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is a small chamber, completely filled with a hazy smog. A tiny opening
in the west wall leads into a tight crawlway, and four doors, labelled one
through four, line the northern wall. A small sign is mounted in between the
second and third doors." CR>
		<COND (<NOT <EQUAL? ,CORRECT-DOOR <>>>
		       <COND (<FSET? ,CORRECT-DOOR ,OPENBIT>
			      <TELL
CR "Bright, warm light streams in from the open " D ,CORRECT-DOOR "." CR
>)>)>
		<COND (<IN? ,CONTRA ,HERE>
		       <CRLF>)>)>> 

<GLOBAL DOOR-TBL <LTABLE 0
DOOR-ONE DOOR-TWO DOOR-THREE DOOR-FOUR>>

<ROUTINE ENTER-BARE-HALL ()
	 <COND (<EQUAL? ,CORRECT-DOOR <>>
		<TELL
"You'll have to specify which door you'd like to walk through." CR>
		<RFALSE>)
	       (<FSET? ,CORRECT-DOOR ,OPENBIT>
		<TELL
"You step into the bright light streaming forth from" T ,CORRECT-DOOR
". As you wade into its midst, there is a blinding flash, and, without
any explanation, you find yourself in..." CR CR>
		<SETG SCORE <+ ,SCORE 20>>
		<RETURN ,BARE-HALL>)
	       (T
		<TELL
"You'll have to open" T ,CORRECT-DOOR " first." CR>
		<RFALSE>)>>

<OBJECT SIGN
	(IN HAZY-ROOM)
	(DESC "small sign")
	(SYNONYM SIGN)
	(ADJECTIVE SMALL)
	(FLAGS READBIT NDESCBIT)
	(TEXT
"\"Three of these doors lead to certain doom. The other door slightens the
probability of certain doom by a slim percentile. Proceed at your own risk.\""
	)>

<OBJECT DOOR-ONE
	(IN HAZY-ROOM)
	(DESC "first door")
	(SYNONYM ONE)
	(ADJECTIVE FIRST DOOR)
	(FLAGS DOORBIT NDESCBIT)
	(ACTION DOOR-F)>

<OBJECT DOOR-TWO
	(IN HAZY-ROOM)
	(DESC "second door")
	(SYNONYM TWO)
	(ADJECTIVE SECOND DOOR)
	(FLAGS DOORBIT NDESCBIT)
	(ACTION DOOR-F)>

<OBJECT DOOR-THREE
	(IN HAZY-ROOM)
	(DESC "third door")
	(SYNONYM THREE)
	(ADJECTIVE THIRD DOOR)
	(FLAGS DOORBIT NDESCBIT)
	(ACTION DOOR-F)>

<OBJECT DOOR-FOUR
	(DESC "fourth door")
	(SYNONYM FOUR)
	(ADJECTIVE FOURTH DOOR)
	(FLAGS DOORBIT NDESCBIT)
	(ACTION DOOR-F)>

<GLOBAL CORRECT-DOOR <>>

<ROUTINE DOOR-F ()
	 <COND (<VERB? ENTER>
		<DO-WALK ,P?NORTH>)
      	       (<VERB? OPEN LOOK-INSIDE>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <TELL
"But" T ,PRSO " is already open!" CR>
		       <RTRUE>) 
		      (<EQUAL? ,CORRECT-DOOR ,PRSO>
		       <TELL
"You open" T ,CORRECT-DOOR ", revealing an area of intense light beyond. The "
D ,CONTRA " looks peeved, and covers his eyes with his hand annoyedly." CR>
		       <FSET ,CORRECT-DOOR ,OPENBIT>
		       <RTRUE>)
		      (T
		       <TELL "You open" T ,PRSO>
		       <JIGS-UP
 ", and are sucked into a fiery inferno, which had been
quietly waiting next door, hoping to devour you. You've just made it
very happy, but in doing so...">)>)>>

<ROUTINE GOOD-DOOR-F ()
	 <COND (<PRSI? ,PSEUDO-OBJECT>
		<PERFORM-PRSA ,PRSO ,FAKE-DOORS>)
	       (<PRSO? ,PSEUDO-OBJECT>
		<PERFORM-PRSA ,FAKE-DOORS ,PRSI>)>>

<OBJECT FAKE-DOORS
	(IN HAZY-ROOM)
	(DESC "correct door")
	;(SYNONYM DOOR)
	;(ADJECTIVE GOOD CORRECT TRUE RIGHT)
	(FLAGS NDESCBIT FAKEBIT)
	(ACTION FAKE-DOORS-F)>

<ROUTINE FAKE-DOORS-F ()
	 <COND (<PRSO? ,FAKE-DOORS>
		<COND (<NOT <EQUAL? ,CORRECT-DOOR <>>>
		       <PERFORM ,PRSA ,CORRECT-DOOR>)
		      (T
		       <TELL "Which door?" CR>)>)
	       (<PRSI? ,FAKE-DOORS>
		<COND (<NOT <EQUAL? ,CORRECT-DOOR <>>>
		       <PERFORM-PRSA ,PRSO ,CORRECT-DOOR>)
		      (T
		       <TELL "Which door?" CR>)>)>>

<OBJECT CIGAR
	(IN CONTRA)
	(DESC "cigar")
	(SYNONYM CIGAR)
	(ADJECTIVE BIG HUGE)
	(FLAGS TRYTAKEBIT ONBIT LIGHTBIT NDESCBIT)
        (ACTION CIGAR-F)>

<ROUTINE CIGAR-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The stuff that carpet-freshener commercials are made of." CR>)>>

<OBJECT CONTRA
	(IN HAZY-ROOM)  
	(DESC "Contra")
	(LDESC "The Contra is here, glaring at you and holding his nose.")
	(SYNONYM CONTRA CAT)
	(ADJECTIVE FELINE)
	(FLAGS NDESCBIT ACTORBIT OPENBIT SEARCHBIT CONTBIT;"FOR TORCH")
	(CAPACITY 300)
	(ACTION CONTRA-F)>

<GLOBAL CONTRA-FOLLOW <>> 

<ROUTINE CONTRA-F ()
	 <COND (<EQUAL? ,WINNER ,CONTRA>
		<TALK-TO-CONTRA ,DONT-FLAG>
		<STOP>)
	       (<VERB? EXAMINE>
		<TELL
"He seems to be a Contra, though he's more feline in appearance than you
had imagined the legendary freedom-fighters to be. For one thing, some of
his whiskers are at least two feet long, and they swirl and revolve about
each other, like plasma in a glass globe. He scrutinizes you, through large,
red eyes, as his cigar burns slowly toward his mouth." CR>)>>

<ROUTINE SET-CORRECT-DOOR ()
	 <SETG CORRECT-DOOR <PICK-ONE ,DOOR-TBL>>>

<ROUTINE TALK-TO-CONTRA (DONT)
	 <COND (.DONT
		<COND (<AND <OR <VERB? WALK> <EQUAL? ,PRSA ,V?WALK>>
		            <EQUAL? ,P-DIRECTION ,P?NORTH>
			    <EQUAL? ,HERE ,HAZY-ROOM>
			    <EQUAL? ,CORRECT-DOOR <>>>
		       <SET-CORRECT-DOOR>
		       <FSET ,CORRECT-DOOR ,OPENBIT>
		       <TELL
"\"Why not?! Do you think I'm scared to?? Watch this, you sickly mongrel!!\"|
|
Glaring at you, he throws open" T ,CORRECT-DOOR " and walks off to the north.
Moments later, he returns, smirking visibly." CR>)
		      (<OR <AND <VERB? DROP GIVE THROW>
				<IN? ,PRSO ,CONTRA>
				<PRSI? <> ,ROOMS ,ME>>
			   <AND <VERB? SGIVE>
				<PRSO? ,ME>
				<IN? ,PRSI ,CONTRA>>>
				
		       <TELL
"The " D ,CONTRA " looks incensed, and splutters, \"Oh?? And why shouldn't
I?!?\" With that, he hurls" T ,PRSO " to the floor, gives it a good stomp,
and glares at you indignantly." CR>
		       <MOVE ,PRSO ,HERE>
		       <FCLEAR ,PRSO ,TRYTAKEBIT>
		       <FSET ,PRSO ,TAKEBIT>
		       <FCLEAR ,PRSO ,NDESCBIT>)
		      (<AND <VERB? TELL-ABOUT>
			    <PRSO? ,ME>>
			<COND (<AND <OR <PRSI? ,FAKE-DOORS>
				 	<PRSI? ,PSEUDO-OBJECT>>
				    <EQUAL? ,CORRECT-DOOR <>>>
			       <SET-CORRECT-DOOR>
			       <TELL
"\"Why, are you too much of a snob to listen to me?!? Well, I guess I'll spare
telling you that the correct door is" T ,CORRECT-DOOR ".\"" CR>)
			      (T
			       <TELL
"Just to be rude, he tells you about it anyways. You are not enlightened." CR>)>)
		      (<AND <VERB? WHAT>
		       	    <PRSO? ,FAKE-DOORS>>
		       <PERFORM ,V?TELL-ABOUT ,ME ,FAKE-DOORS>)
		      (<VERB? TAKE>
		       <TELL
"\"Oho!! I suppose you expect me to just ignore" T ,PRSO " as if it didn't
exist! Well, sickling, I happen to be a collector!!\" Grinning, he takes"
TR ,PRSO>
		       <MOVE ,PRSO ,CONTRA>
		       <FSET ,PRSO ,NDESCBIT>
		       <FSET ,PRSO ,TRYTAKEBIT>
		       <FCLEAR ,PRSO ,TAKEBIT>)  
		      (<AND <VERB? FOLLOW>
			    <PRSO? ,ME>>
		       <TELL
"\"What, and just let you walk away?? You've insulted me countless times,
ingrate!!\"" CR>
		       <SETG CONTRA-FOLLOW T>)
		      (T
		       <TELL
"He does so anyways, just to spite you. Snickering, he ">
		       <COND (<OR <VERB? WALK LEAVE EXIT>
				  <VERB? ENTER>>
			      <TELL "returns and ">)>
		      <TELL 
"begins to twiddle his thumbs precociously, eying you hatefully." CR>)>)
	       (T
		<COND (<AND <VERB? TELL-ABOUT>
		            <PRSO? ,ME>>
		       <COND (<PRSI? ,FAKE-DOORS>
			      <TELL
"\"I wouldn't tell you which door was the correct one, even if you got down
on your flimsy, disgusting knees and begged me!!\"" CR>)
			     (T
			      <TELL
"\"Shut up, you filthy scumbag!\"" CR>)>) 
		      (<VERB? TAKE>
		       <COND (<IN? ,PRSO ,PROTAGONIST>
			      <TELL
"\"What? and lighten YOUR load?! Hah!\" He spits at your feet." CR>)
			     (T
			      <TELL
"\"Who's gonna make me, monkey boy?\""CR>)>)
		      (<VERB? DROP GIVE THROW>
		       <TELL
"\"I laugh at your disgusting arrogance, vile scum!\"" CR>)
		      (<AND <VERB? FOLLOW>
			    <PRSO? ,ME>>
		       <TELL
"\"I might, were it not for the ugly, putrid stench!\"" CR>
		       <SETG CONTRA-FOLLOW <>>)
		      (T
		       <TELL
"He merely chuckles. Suddenly, and in a practiced fashion, he wipes away his
grin and ennunciates, \"You ugly groinoid! All my life I've been rudely
contradicting YOUR type. What do you expect me to do just stop?!? Hah!\""
CR>)>)>>
		       
;"DONT stuff"

<ROUTINE DONT-F ()
	 <COND (,DEBUG
		<TELL "DONT-F CALLED, MAESTRO." CR>)>
	 <COND (<TALKING-VERB?>
		<SETG SPECIAL-CASE-DONT T>
		<RFALSE>)
	       (<VERB? WAIT>
		<TELL "Time doesn't pass..." CR>
		<STOP>)
	       (<VERB? TAKE>
		<TELL "Not taken." CR>
		<STOP>)
	       (T
		<TELL "Not done." CR>
		<STOP>)>>

<ROUTINE TALKING-VERB? ()
	 <COND (<OR <VERB? ASK-ABOUT ASK-FOR TELL HELLO>
		    <AND <FSET? ,WINNER ,ACTORBIT>
			 <NOT <EQUAL? ,WINNER ,PROTAGONIST>>>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

;<GLOBAL AGAIN-USED <>>
;<GLOBAL L-DONT-FLAG <>>
<GLOBAL SPECIAL-CASE-DONT <>>

<OBJECT CHAISE
	(IN HAZY-ROOM)
	(DESC "Contra's chaise")
	(SYNONYM CHAISE CHAIR)
	(ADJECTIVE CONTRA)
	(FLAGS NDESCBIT VEHBIT OPENBIT SEARCHBIT CONTBIT)
	(ACTION CHAISE-F)>
	
<ROUTINE CHAISE-F ()
	 <COND (<VERB? BOARD>
		<TELL
"The " D ,CONTRA " is outraged by this behavior; he swats you away from"
TR ,CHAISE>)>>

;"NEW STUFF"

<ROOM BARE-HALL
      (IN ROOMS)
      (DESC "Store Room")
      (LDESC "You stand in a room amidst several bins loaded high with
stored goods, apparently saved for an unpleasant drought or lengthy
winter. A rickety wooden ladder leads upward through a hole in the
ceiling, through which a little light streams in.")
      (UP TO TREE-FLOOR-ONE)
      (SOUTH "Although you came from the south, you can't make out any
exit there.")
      (FLAGS ONBIT RLANDBIT)
      (THINGS <PSEUDO (<> NUT NUT-F)
		      (<> BERRY NUT-F)
		      (<> ACORN NUT-F)
		      (<> NUTS NUTS-F)
		      (<> ACORNS NUTS-F)
		      (<> BERRIES NUTS-F)>)
      (GLOBAL LADDER)>

<OBJECT BINS
	(IN BARE-HALL)
	(DESC "bins")
	(SYNONYM BIN BINS)
	(ADJECTIVE STORAGE)
	(FLAGS CONTBIT OPENBIT SEARCHBIT NDESCBIT)
	(ACTION BINS-F)>

<ROUTINE BINS-F ()
	 <COND (<VERB? EXAMINE LOOK-INSIDE>
		<TELL
"The storage bins are loaded high with various nuts, berries and acorns." CR
>)>>

<ROUTINE NUTS-F ()
	 <TELL
"You'd better leave them where they are. They belong to someone else." CR>>

<ROUTINE NUT-F ()
   	 <TELL
"You'd better leave it alone. It belongs to someone else." CR>>

<OBJECT LADDER
	(IN LOCAL-GLOBALS)
	(DESC "rickety wooden ladder")
	(SYNONYM LADDER)
	(ADJECTIVE RICKETY WOODEN)
	(FLAGS NDESCBIT)
	(ACTION LADDER-F)>

<ROUTINE LADDER-F ()
	 <COND (<VERB? CLIMB-UP>
		<DO-WALK ,P?UP>)
	       (<VERB? CLIMB-DOWN>
		<DO-WALK ,P?DOWN>)
	       (<VERB? CLIMB>
		<COND (<EQUAL? ,HERE ,BARE-HALL>
		       <DO-WALK ,P?UP>)
		      (<EQUAL? ,HERE ,TREE-FLOOR-TWO>
		       <DO-WALK ,P?DOWN>)
		      (T
		       <TELL
"You'll have to specify whether you'd like to climb up or down." CR>)>)>>

<ROOM TREE-FLOOR-ONE
      (IN ROOMS)
      (DESC "In the Tree")
      (LDESC "This cramped, but cozy area has been carved out of the
inside of an aging tree. It seems to be a sort of kitchen - living room
- dining area, as much so as can be expected of a closet-sized space. A
chair and table are its only furnishings, although a row of cabinets lines
one wall. You may climb up or down, thanks to a rickety, wooden ladder
which is affixed to one wall.")
      (DOWN TO BARE-HALL)
      (UP TO TREE-FLOOR-TWO)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL LADDER)>

<OBJECT TREE-CHAIR
	(IN TREE-FLOOR-ONE)
	(DESC "chair")
	(SYNONYM CHAIR SEAT)
	(FLAGS VEHBIT OPENBIT NDESCBIT SEARCHBIT CONTBIT)>

<OBJECT TREE-TABLE
	(IN TREE-FLOOR-ONE)
	(DESC "table")
	(SYNONYM TABLE)
	(FLAGS CONTBIT SEARCHBIT OPENBIT NDESCBIT SURFACEBIT)>

<OBJECT CABINET
	(IN TREE-FLOOR-ONE)
	(DESC "one of the cabinets")
	(SYNONYM CABINE)
	(ADJECTIVE ONE)
	(FLAGS CONTBIT NDESCBIT SEARCHBIT)>

<ROOM TREE-FLOOR-TWO
      (IN ROOMS)
      (DESC "In the Tree")
      (LDESC "This hollowed-out area must be a sleeping room for the
inhabitant of this dwelling. A round mattress, stuffed with goose down,
occupies most of the floor, leaving space to climb down the ladder, or exit
the premises through a wide knothole on the east wall, through which sunlight
pours in.")
      (DOWN TO TREE-FLOOR-ONE)
      (UP "You'll have to climb onto the branch if you expect to climb any
higher.")
      (EAST TO BRANCH)
      (FLAGS ONBIT RLANDBIT)
      (GLOBAL LADDER KNOT-HOLE)>

<OBJECT MATTRESS
	(IN TREE-FLOOR-TWO)
	(DESC "mattress")
	(SYNONYM MATTRE BED)
	(ADJECTIVE ROUND SOFT GOOSE)
	(FLAGS NDESCBIT VEHBIT CONTBIT SEARCHBIT OPENBIT)>

<OBJECT KNOT-HOLE
	(IN LOCAL-GLOBALS)
	(DESC "wide knothole")
	(SYNONYM HOLE KNOTHO)
	(ADJECTIVE KNOT WIDE)
	(FLAGS OPENBIT NDESCBIT)
	(ACTION KNOT-HOLE-F)>

<ROUTINE KNOT-HOLE-F ()
	 <COND (<VERB? ENTER EXIT DISEMBARK>
		<COND (<EQUAL? ,HERE ,TREE-FLOOR-TWO>
		       <DO-WALK ,P?EAST>)
		      (T
		       <DO-WALK ,P?WEST>)>)>>

<ROOM BRANCH
      (IN ROOMS)
      (DESC "Out on a Limb")
      (LDESC "You stand, quivering ever so slightly, on a wide, sturdy
branch, fifty feet or so above the ground, where a path runs past the
tree. Although the trees branches are numerous, you fear that a descent
might be difficult. It may be easier to climb upward, however, as
notches have been cut in the side of the tree, forming a ladder of
sorts. To the west, you may reenter the tree through the wide
knothole.")
      (DOWN TO FOREST)
      (WEST TO TREE-FLOOR-TWO)
      (IN TO TREE-FLOOR-TWO)
      (UP PER TO-IN-BRANCHES)
      (GLOBAL KNOT-HOLE)
      (FLAGS ONBIT RLANDBIT)>

<ROUTINE TO-IN-BRANCHES ()
	 <COND (<EQUAL? ,CHUK-ENTRANCE 1>
		<QUEUE I-CHUK-APPEARS -1>)>
	 <RETURN ,IN-BRANCHES>>

<ROOM IN-BRANCHES
      (IN ROOMS)
      (DESC "Near the Tree Top")
      (LDESC "The view from here is spectacular. The forest around you is
composed of hundreds of tall, magnificent oaks, their abundant leaves
rippling with the warm breeze. It seems that no end to the forest is in
sight, although you can make out a thin, winding trail running north and
south past the tree in which you stand.")
      (DOWN PER TO-BRANCH-F)
      (UP "You'd have to be very small and even more agile in order to climb
any higher.")
      (FLAGS ONBIT RLANDBIT)>

<ROUTINE TO-BRANCH-F ()
	 <COND (<EQUAL? ,CHUK-ENTRANCE 2>
		<TELL "A noise makes you hesitate." CR>
		<RFALSE>)
	       (T
		<RETURN ,BRANCH>)>>

<OBJECT CHUK
	(IN IN-BRANCHES)
	(SDESC "squirrel")
	(SYNONYM SQUIRREL CHUK)
	(FLAGS ACTORBIT NDESCBIT CONTBIT SEARCHBIT OPENBIT)
	(ACTION CHUK-F)>

<ROUTINE CHUK-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"When poised on his hind-legs," T ,CHUK " stands about five-feet tall. His
fur is a golden brown, with some traces of red near his ears and neck.
Although" T ,CHUK " is rather nervous and twitchy, he does posess a vaguely
noble aura." CR>)
	       (<VERB? GIVE>
		<TELL "Politely,"
T ,CHUK " thanks you, but insists that" T ,PRSO " would be of more use
to you than to him." CR>)
	       (<EQUAL? ,WINNER ,CHUK>
		<COND (<VERB? HELLO>
		       <TELL
"Good-naturedly, " T ,CHUK " nods to you in greeting." CR>)
		     (<AND <VERB? TELL-ABOUT>
			   <PRSO? ,ME>>
		      <COND (<PRSI? TALE>
			     <TELL
"\"" T ,TALE " is a series of poems and stories about the Way Things Were
and the Way Things Will Be. These poems and songs have been recited and
passed along since time began. In " D ,TALE ", there is mention of
person creatures, like yourself, who possessed awesome powers of insight
and intellect.\"" CR>)>)
		     (T
		      <COND (<EQUAL? ,CHUK-ENTRANCE 0>
			     <TELL "Chuk">)
			    (T
			     <TELL "The squirrel">)>
		      <TELL 
" cocks his head to the side slightly, demonstrating some understanding,
but he stays silent." CR>)>)>>
		 
<OBJECT TALE
	(IN GLOBAL-OBJECTS)
	(DESC "The Tale")
	(SYNONYM TALE)
	(FLAGS NARTICLEBIT)>

<GLOBAL CHUK-ENTRANCE 1>

<ROUTINE I-CHUK-APPEARS ()
	 <CRLF>
	 <COND (<AND <VERB? WALK WALK-TO>
		     <NOT <EQUAL? ,CHUK-ENTRANCE 1>>>
		<MOVE ,CHUK ,HERE>
		<TELL "The " D ,CHUK " follows you ">
		<COND (<EQUAL? ,HERE ,BRANCH>
		       <TELL "down to the branch">)
		      (<EQUAL? ,HERE ,TREE-FLOOR-TWO>
		       <TELL "through the knothole and into the tree">)>
		<COND (<PROB 50>
		       <TELL ", patiently">)
		      (T
		       <TELL ", with soft strides">)>
		<TELL ". ">)>
	 <COND (<EQUAL? ,CHUK-ENTRANCE 1>
		<TELL 
"You hear a faint scrabbling noise from the other side of the tree." CR>)
	       (<EQUAL? ,CHUK-ENTRANCE 2>
		<MOVE ,CHUK ,HERE>
		<TELL
"The scrabbling sound gets louder and more apparent, until suddenly a large,
furry head appears, followed by the body of a squirrel -- although much
bigger than any squirrel's body that you can remember seeing. The creature
stops short, crumples its nose minutely, and cocks its head. \"Whiskers! A
person creature! Just like in " D ,TALE "! Greetings, o' bipedal apparition.\""
CR>)  
	       (<EQUAL? ,CHUK-ENTRANCE 3>
		<TELL "\"Wait until the other squirrel-kin see you!\" Its
voice is a bit squeaky and rough-hewn, with a dash of British accent." CR>)
	       (<EQUAL? ,CHUK-ENTRANCE 4>
		<DEQUEUE I-CHUK-APPEARS>
		<PUTP ,CHUK ,P?SDESC "Chuk">
		<FSET ,CHUK ,NARTICLEBIT>
		<SETG CHUK-ENTRANCE 0>
		<TELL
"\"Oh, for shame! Off I went, forgetting my manners again, like a kitten!
My name is Chuk, and this is my home. It's not as big as one of the Elders',
but it's warm and dry. What's mine is yours, noble one.\"" CR>)>
	 <SETG CHUK-ENTRANCE <+ ,CHUK-ENTRANCE 1>>>

<ROOM FOREST
      (IN ROOMS)
      (DESC "Forest, on a path")
      (LDESC "Up to branch.")
      (UP TO BRANCH)
      (FLAGS ONBIT RLANDBIT)>