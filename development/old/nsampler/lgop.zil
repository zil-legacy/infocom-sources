       		  	"LGOP for
		 	SAMPLER II
    (c) Copyright 1987 Infocom, Inc.  All Rights Reserved."

<ROUTINE GO-LGOP () 
	 <SETUP-LGOP>
	 <CRLF>
	 <GIVE-LGOP-INSTRUCTIONS>
	 <CRLF>
	 <SETG HERE ,WARNING>
	 <USL>
         <TELL
"Some material in this story may not be suitable for children, especially
the parts involving sex, which no one should know anything about until
reaching the age of eighteen (twenty-one in certain states). This story is
also unsuitable for censors, members of the Moral Majority, and
anyone
else who thinks that sex is dirty rather than fun.|
   The attitudes expressed and language used in this story are representative
only of the views of the author, and in no way represent the views of Infocom,
Inc. or its employees, many of whom are children, censors, and members of the
Moral Majority. (But very few of whom, based on last year's Christmas Party,
think that sex is dirty.)|
   By now, all the folks who might be offended by " ,LGOP-CAPS " have whipped
their disk out of their drive and, evidence in hand, are indignantly huffing
toward their dealer, their lawyer, or their favorite repression-oriented
politico. So... H" ,HIT-RETURN "begin!">
	 <READ ,P-INBUF ,P-LEXV>
	 <SETG HERE ,JOES-BAR>
	 ;<CLEAR-SCREEN>
	 <USL>
	 <TELL CR
"The place: Upper Sandusky, Ohio. The time: 1936. The beer: at a nickel
a mug, you don't ask for brand names. All you know is that your fifth
one tasted as bad as the first." CR CR>
	 ;<SETUP-LGOP>
	 <V-VERSION>
	 <CRLF>
	 <V-LOOK>
	 <I-URGE>>

<ROUTINE SETUP-LGOP ()
	 <SETG GAME-FLAG 2>
	 <SETG HERE ,LGOP-ROOM>
	 <SETG AGE -1>
	 <GENERAL-SETUP>
	 <REMOVE ,PIZZA>
	 <REMOVE ,MATCHBOOK>
	 <FCLEAR ,ME ,FEMALEBIT>
	 <FCLEAR ,SIDEKICK ,FEMALEBIT>
	 <MOVE ,PROTAGONIST ,JOES-BAR>
	 <MOVE ,STOOL ,LOCAL-GLOBALS>
	 <MOVE ,COMIC-BOOK ,PROTAGONIST>
	 <PUTP ,COMIC-BOOK ,P?SDESC "comic book">
	 <MOVE ,FLASHLIGHT ,PROTAGONIST>
	 <MOVE ,GARMENT ,PROTAGONIST>
	 <PUTP ,GARMENT ,P?SDESC "your overalls">
	 <PUTP ,CHOCOLATE ,P?SDESC "hunk of brown food">
	 <FSET ,GARMENT ,NARTICLEBIT>
	 <FSET ,GARMENT ,PLURALBIT>
	 <FSET ,GARMENT ,VOWELBIT>
	 <FSET ,GARMENT ,WORNBIT>
	 <MOVE ,TRAY ,OTHER-CELL>
	 <MOVE ,PAINTING ,CELL>
	 <MOVE ,BLANKET ,CELL>
	 <MOVE ,CHOCOLATE ,TRAY>
	 <MOVE ,BASKET ,SHELF>
	 <MOVE ,SCRAP-OF-PAPER ,OTHER-CELL>
	 <MOVE ,SIDEKICK ,OTHER-CELL>
	 <SETG SEX-CHOSEN <>>
	 <SETG URGE-COUNTER 0>
	 <SETG NAUGHTY-LEVEL 1>
	 <SETG TRAY-DELIVERED <>>>

<ROOM WARNING
      (IN ROOMS)
      (DESC "WARNING!")>

<ROOM LGOP-ROOM
      (IN ROOMS)
      (DESC "Leather Goddesses...")>

<ROUTINE GIVE-LGOP-INSTRUCTIONS ()
	 <TELL "You'll begin the " ,LGOP-CAPS  ,EXCERPT " in " D
,JOES-BAR ", a grubby hangout in Upper Sandusky, Ohio. Not long after
the game begins, you'll be kidnapped by minions of " D ,LGOP ", who will
bring you back to their home world as an experimental subject. The evil
Goddesses, you see, are planning to convert the Earth into a pleasure
world, and to enslave all of humanity. To complete the" ,EXCERPT ",
you'll have to escape from the clutches of the Goddesses and get
to Venus, along with anyone else you pick up along the way. You may wish
to note that the " ,LGOP-CAPS " sample is playable in any of three modes
-- tame, suggestive or lewd. You'll start out in suggestive, but you may
switch to a different \"naughtiness level\" simply by typing in TAME,
SUGGESTIVE or LEWD at any \">\" prompt.|
|
Have fun, and h" ,HIT-RETURN "begin...">
	 <READ ,P-INBUF ,P-LEXV>>

<ROOM JOES-BAR
      (IN ROOMS)
      (DESC "Joe's Bar")
      (NW PER MENS-ROOM-ENTER-F)
      (NE PER LADIES-ROOM-ENTER-F)
      (SOUTH "A gust of wind blows you back into the bar.")
      (OUT "A gust of wind blows you back into the bar.")
      (FLAGS ONBIT RLANDBIT ;INDOORSBIT NARTICLEBIT)
      (GLOBAL MENS-ROOM-OBJECT LADIES-ROOM-OBJECT WINDOW)
      (ACTION JOES-BAR-F)
      (THINGS <PSEUDO (<> DUST UNIMPORTANT-THING-F)
		      (FRONT DOOR BAR-DOOR-F)
		      (<> BAR BAR-F)>)>

<ROUTINE JOES-BAR-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"An undistinguished bar, yet the social center of Upper Sandusky. The front
door is almost lost amidst the hazy maze of neon that shrouds the
grimy glass of the south wall. " ,DOORS-MARKED>)>>

<GLOBAL DOORS-MARKED
"Doors marked \"Ladies\" and \"Gents\" lead, respectively,
northeast and northwest.">

<ROUTINE BAR-DOOR-F ()
	 <COND (<VERB? ENTER>
		<DO-WALK ,P?SOUTH>)
	       (<VERB? OPEN CLOSE>
		<TELL "It's a swinging door." ,PERIOD-CR>)
	       (<VERB? LOOK-INSIDE>
		<PERFORM-PRSA ,WINDOW>
		<RTRUE>)>>

<ROUTINE BAR-F ()
	 <COND (<VERB? LEAVE EXIT DISEMBARK>
		<DO-WALK ,P?SOUTH>)
	       (<VERB? ENTER WALK-TO BOARD>
		<TELL ,LOOK-AROUND>)
	       (<VERB? EXAMINE>
		<V-LOOK>)
	       (<VERB? SEARCH>
		<TELL ,NOTHING-NEW>)>>

<OBJECT JOE
	(IN JOES-BAR)
	(DESC "Joe")
	(SYNONYM JOE BARTENDER)
	(FLAGS ACTORBIT NDESCBIT NARTICLEBIT)
	(ACTION JOE-F)>

<ROUTINE JOE-F ()
	 <COND (<OR <VERB? TELL>
		    <AND <VERB? ASK-FOR>
			 <PRSI? ,BEER>>>
		<TELL "\"You've had enough.\"" CR>
		<STOP>)
	       (<VERB? EXAMINE>
		<TELL "Joe is bartending." CR>)>>

<OBJECT BEER
	(DESC "mug of beer")
	(SYNONYM DRINK MUG BEER)
	(ACTION BEER-F)>

<ROUTINE BEER-F ()
	 <COND (<AND <VERB? BUY>
		     <EQUAL? ,HERE ,JOES-BAR>>
		<TELL "The bartender">
		<COND (<RUNNING? ,I-URGE>
		       <TELL ", a keen judge of bladders,">)>
		<TELL " says, ">
		<PERFORM ,V?TELL ,JOE>
		<RTRUE>)>>

<OBJECT GARMENT
	(IN LOCAL-GLOBALS)
	(SDESC "your overalls")
	(SYNONYM OVERALL CLOTHES LOINCLOTH BIKINI)
	(ADJECTIVE MY YOUR BRASS TIGHT)
	(FLAGS TAKEBIT ;WEARBIT VOWELBIT NARTICLEBIT PLURALBIT)
	(ACTION GARMENT-F)>

<ROUTINE GARMENT-F ()
	 <COND (<WRONG-SEX-WORD ,GARMENT ,W?LOINCLOTH ,W?BIKINI>
		<STOP>)
	       (<AND <VERB? EXAMINE>
		     <FSET? ,CELL ,TOUCHBIT>>
		<TELL
"The " D ,GARMENT ", tight but comfy,
covers only the \"bare essentials.\"" CR>)
	       (<VERB? LOOK-INSIDE>
		<TELL
"1. You|
2. A " D ,COMIC-BOOK CR>)
	       
	       (<VERB? TAKE-OFF>
		<TELL "But" T ,GARMENT>
		<COND (<FSET? ,GARMENT ,PLURALBIT>
		       <TELL " are">)
		      (T
		       <TELL " is">)>
		<TELL " so becoming!" CR>)>>

<OBJECT POCKET
	(IN GLOBAL-OBJECTS)
	(DESC "pocket")
	(FLAGS CONTBIT SEARCHBIT OPENBIT NDESCBIT)
	(SYNONYM POCKET)
	;(ADJECTIVE BACK)
	(CAPACITY 6)
	(ACTION POCKET-F)>

<ROUTINE POCKET-F ()
	 <COND (<NOT <EQUAL? ,GAME-FLAG 2 3>>
		<CANT-SEE-ANY ,POCKET>
		<RTRUE>) 
	       (<EQUAL? ,GAME-FLAG 2>
		        <COND (<VERB? LOOK-INSIDE EXAMINE>
			       <TELL "There's" A ,COMIC-BOOK " inside." CR>)
	       		      (<AND <VERB? PUT>
		     	       <PRSI? ,POCKET>>
			       <TELL "There's no room. ">
			       <PERFORM ,V?LOOK-INSIDE ,POCKET>
			       <RTRUE>)>)>>

<OBJECT COMIC-BOOK
	(IN LOCAL-GLOBALS)
	(SDESC "comic book")
	(SYNONYM BOOK RULES)
	(ADJECTIVE RULE COMIC 3-D)
	(FLAGS READBIT TAKEBIT)
	(ACTION COMIC-BOOK-F)>

<ROUTINE COMIC-BOOK-F ()
	 <COND (<AND <VERB? REMOVE TAKE BURN> ;"TAKE possible as gorilla"
		     <PRSO? ,COMIC-BOOK>>
		<TELL
"You change your mind and" ,STICK-IT-IN-POCKET " instead." CR>)
	       (<VERB? READ LOOK-INSIDE OPEN>
		<COND (<FSET? ,CELL ,TOUCHBIT>
		       <TELL
"\"Hello, Prisoner!|
   You are a captive of " 'LGOP ". As an experimental subject, your unspeakably
painful death will help our effort to enslave humanity and turn the Earth into
our private pleasure world. Consider this to be a great honor, human.\"|
   The remainder of the book covers the exacting rules of behavior expected
of a prisoner of " 'LGOP ". For example, it mentions that escapees will be
killed immediately and painfully by crack Leckbandi guards.">)
		      (T
		       <IN-YOUR-PACKAGE "3-D comic book">)>
		<TELL
" After reading it, you" ,STICK-IT-IN-POCKET ,PERIOD-CR>)>>

<OBJECT FLASHLIGHT
	(IN LOCAL-GLOBALS)
	(DESC "flashlight")
	(SYNONYM FLASHLIGHT LIGHT)
	(ADJECTIVE FLASH)
	(FLAGS TAKEBIT LIGHTBIT)
	(ACTION FLASHLIGHT-F)>

<ROUTINE FLASHLIGHT-F ()
	 <COND (<VERB? OPEN LOOK-INSIDE>
		<TELL "The " 'FLASHLIGHT " has rusted shut." CR>)
	       (<AND <VERB? POINT>
		     <FSET? ,FLASHLIGHT ,ONBIT>
		     ,PRSI>
		<TELL ,NOTHING-NEW>)>>

<ROOM MENS-ROOM
      (IN ROOMS)
      (DESC "Gents' Room")
      (SE TO JOES-BAR)
      (OUT TO JOES-BAR)
      (FLAGS ONBIT RLANDBIT ;INDOORSBIT)
      (GLOBAL TOILET ODOR WATER MENS-ROOM-OBJECT)
      ;(ODOR "pizza")
      ;(ODOR-NUMBER 1)
      (ACTION BATHROOM-F)
      (THINGS <PSEUDO (<> SINK SINK-F)>)>

<ROOM LADIES-ROOM
      (IN ROOMS)
      (DESC "Ladies' Room")
      (SW TO JOES-BAR)
      (OUT TO JOES-BAR)
      (FLAGS ONBIT RLANDBIT ;INDOORSBIT)
      (GLOBAL TOILET ODOR WATER LADIES-ROOM-OBJECT)
      ;(ODOR "pizza")
      ;(ODOR-NUMBER 1)
      (ACTION BATHROOM-F)
      (THINGS <PSEUDO (<> SINK SINK-F)>)>

<ROUTINE MENS-ROOM-ENTER-F ()
	 <COND (<NOT ,SEX-CHOSEN>
		<SETG SEX-CHOSEN T>
		<SETG MALE T>
		<MOVE ,STOOL ,MENS-ROOM>
		;<FSET ,SULTANS-WIFE ,FEMALEBIT>
		;<FSET ,HAREM-GUARD ,FEMALEBIT>
		;<FSET ,YOUNG-WOMAN ,FEMALEBIT>
		<PUTP ,SIDEKICK ,P?SDESC "Trent">
		;<PUTP ,SIDEKICKS-BODY ,P?SDESC "Trent's body">
		;<PUTP ,SPLATTERED-SIDEKICK ,P?SDESC "bits of splattered Trent">
		;<PUTP ,THORBAST ,P?SDESC "Thorbast">
		;<PUTP ,THORBAST-SWORD ,P?SDESC "his sword">
		;<PUTP ,SULTAN ,P?SDESC "Sultan">
		;<PUTP ,YOUNG-WOMAN ,P?SDESC "young woman">
		;<PUTP ,PHOTO ,P?SDESC "photo of Jean Harlow">
		;<PUTP ,HAREM ,P?ODOR "perfume">
		,MENS-ROOM)
	       (,MALE
		,MENS-ROOM)
	       (T
		<PRINTD ,MENS-ROOM>
		<WRONG-BATHROOM
"burly man in a partial state of undress unleashes a torrent of lewd remarks">
		<RFALSE>)>>

<ROUTINE LADIES-ROOM-ENTER-F ()
	 <COND (<NOT ,SEX-CHOSEN>
		<SETG SEX-CHOSEN T>
	 	<SETG MALE <>>
		<MOVE ,STOOL ,LADIES-ROOM>
		<FSET ,ME ,FEMALEBIT>
		;<FSET ,SULTAN ,FEMALEBIT>
	        <FSET ,SIDEKICK ,FEMALEBIT>
		;<FSET ,THORBAST ,FEMALEBIT>
		<PUTP ,SIDEKICK ,P?SDESC "Tiffany">
		;<PUTP ,SIDEKICKS-BODY ,P?SDESC "Tiffany's body">
		;<PUTP ,SPLATTERED-SIDEKICK ,P?SDESC
		      "bits of splattered Tiffany">
		;<PUTP ,THORBAST ,P?SDESC "Thorbala">
		;<PUTP ,THORBAST-SWORD ,P?SDESC "her sword">
		;<PUTP ,SULTAN ,P?SDESC "Sultaness">
		;<PUTP ,YOUNG-WOMAN ,P?SDESC "young man">
		;<PUTP ,PHOTO ,P?SDESC "photo of Douglas Fairbanks">
		;<PUTP ,HAREM ,P?ODOR "cologne">
		,LADIES-ROOM)
	       (,MALE
		<PRINTD ,LADIES-ROOM>
		<WRONG-BATHROOM
"female patron begins pummelling you with a purse that must
surely contain concrete">
		<RFALSE>)
	       (T
		,LADIES-ROOM)>>

<ROUTINE WRONG-BATHROOM (STRING)
	 <TELL
"|   As you enter the wrong bathroom, a " .STRING ". You hustle out.||">
	 <DESCRIBE-ROOM>>

<ROUTINE BATHROOM-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This filthy bathroom belies the existence of disinfectant. A single toilet and
sink are the only fixtures. More breathable air can be found" ,TO-S>
		<COND (<EQUAL? ,HERE ,MENS-ROOM>
		       <TELL "ea">)
		      (T
		       <TELL "we">)>
		<TELL "st.">)
	       (<EQUAL? .RARG ,M-SMELL>
		<THIS-IS-IT ,PIZZA>
		<MOVE ,PIZZA ,HERE>
		<TELL
"You trace the smell to" A ,PIZZA ", crumpled in the corner. [Incidentally,
we had some pretty putrid scents available, all of which would've seemed right
at home in a filthy restroom. In the end, we were too kind to use them --
but we were sorely tempted!]">)>>

<OBJECT MENS-ROOM-OBJECT
	(IN LOCAL-GLOBALS)
	(DESC "gents' restroom")
	(SYNONYM BATHROOM RESTROOM ROOM)
	(ADJECTIVE MEN\'S GENT\'S MENS GENTS FILTHY)
	(GENERIC GENERIC-RESTROOM-F)
	(ACTION MENS-ROOM-OBJECT-F)>

<ROUTINE MENS-ROOM-OBJECT-F ()
	 <COND (<VERB? FIND ENTER>
		<COND (<EQUAL? ,HERE ,JOES-BAR>
		       <DO-WALK ,P?NW>)
		      (T
		       <TELL ,LOOK-AROUND>)>)
	       (<VERB? WALK-TO>
		<COND (<EQUAL? ,HERE ,JOES-BAR>
		       <DO-WALK ,P?NW>)
		      (<EQUAL? ,HERE ,MENS-ROOM>
		       <V-PEE>)>)
	       (<VERB? EXIT LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,MENS-ROOM>
		       <DO-WALK ,P?SE>)
		      (T
		       <TELL ,LOOK-AROUND>)>)
	       (<VERB? LOOK-INSIDE>
		<COND (<EQUAL? ,HERE ,MENS-ROOM>
		       <TELL ,LOOK-AROUND>)
		      (T
		       <TELL ,CANT-FROM-HERE>)>)
	       (<VERB? SEARCH>
		<TELL ,NOTHING-NEW>)
	       (<VERB? USE>
		<COND (<EQUAL? ,HERE ,JOES-BAR>
		       <TELL ,LOOK-AROUND>)
		      (T
		       <V-PEE>)>)
	       (<VERB? EXAMINE>
		<TELL "Filthy." CR>)>>

<OBJECT LADIES-ROOM-OBJECT
	(IN LOCAL-GLOBALS)
	(DESC "ladies' restroom")
	(SYNONYM BATHROOM RESTROOM ROOM)
	(ADJECTIVE LADIES WOMEN FILTHY)
	(GENERIC GENERIC-RESTROOM-F)
	(ACTION LADIES-ROOM-OBJECT-F)>

<ROUTINE LADIES-ROOM-OBJECT-F ()
	 <COND (<VERB? FIND ENTER>
		<COND (<EQUAL? ,HERE ,JOES-BAR>
		       <DO-WALK ,P?NE>)
		      (T
		       <TELL ,LOOK-AROUND>)>)
	       (<VERB? WALK-TO>
		<COND (<EQUAL? ,HERE ,JOES-BAR>
		       <DO-WALK ,P?NE>)
		      (<EQUAL? ,HERE ,LADIES-ROOM>
		       <V-PEE>)>)
	       (<VERB? EXIT LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,LADIES-ROOM>
		       <DO-WALK ,P?SW>)
		      (T
		       <TELL ,LOOK-AROUND>)>)
	       (<VERB? LOOK-INSIDE>
		<COND (<EQUAL? ,HERE ,LADIES-ROOM>
		       <TELL ,LOOK-AROUND>)
		      (T
		       <TELL ,CANT-FROM-HERE>)>)
	       (<VERB? SEARCH>
		<TELL ,NOTHING-NEW>)
	       (<VERB? USE EXAMINE>
		<PERFORM-PRSA ,MENS-ROOM-OBJECT>
		<RTRUE>)>>

<ROUTINE GENERIC-RESTROOM-F ()
	 <COND (<AND <VERB? WALK-TO FIND ENTER>
		     <EQUAL? ,HERE ,JOES-BAR>>
		<TELL ,DOORS-MARKED CR>
		<RETURN ,NOT-HERE-OBJECT>)
	       (<VERB? WALK-TO>
		<V-PEE>
		<RETURN ,NOT-HERE-OBJECT>)
	       (,SEX-CHOSEN
		<COND (,MALE
		       <RETURN ,MENS-ROOM-OBJECT>)
		      (T
		       <RETURN ,LADIES-ROOM-OBJECT>)>)
	       (T
		<RFALSE>)>>

<OBJECT TOILET
	(IN LOCAL-GLOBALS)
	(DESC "toilet")
	(SYNONYM TOILET)
	(FLAGS CONTBIT OPENBIT VEHBIT)
	(CAPACITY 2)
	(ACTION TOILET-F)>

<ROUTINE TOILET-F ()
	 <COND (<VERB? PEE-IN USE>
		<V-PEE>)
	       (<VERB? CLOSE>
		<NO-LID>)
	       (<VERB? FLUSH>
		<TELL
"Probably the first fresh water to enter this john in a month." CR>)
	       (<VERB? LOOK-INSIDE EXAMINE>
		<TELL ,YECHH>)>>

<ROUTINE SINK-F ()
	 <COND (<VERB? LOOK-INSIDE EXAMINE>
		<PERFORM ,V?EXAMINE ,TOILET>
		<RTRUE>)>>

<OBJECT STOOL
	(DESC "stool")
	(SYNONYM STOOL)
	(ADJECTIVE SMALL WOODEN)
	(SIZE 50)
	(CAPACITY 20)
	(FLAGS TAKEBIT VEHBIT SURFACEBIT CONTBIT OPENBIT SEARCHBIT ;BURNBIT)
	(ACTION STOOL-F)>

<ROUTINE STOOL-F ()
	 <COND (<AND <VERB? EXAMINE>
		     <NOT <FSET? ,STOOL ,TOUCHBIT>>>
		<TELL "It's safe to take, if you receive my meaning." CR>)
	       (<VERB? BOARD CLIMB>
		<COND (<FIRST? ,STOOL>
		       <DO-FIRST "clear off" ,STOOL>)
		      ;(<IN? ,PROTAGONIST ,TREE-HOLE>
		       <MOVE ,PROTAGONIST ,HERE>
		       <TELL "Using the stool, you">
		       <AND-SIDEKICK ,HERE>
		       <TELL " climb out of the hole." CR>)>)>>

<GLOBAL MALE <>> ;"...is main character male? T =  male, <> = female."

<GLOBAL SEX-CHOSEN <>>

<GLOBAL URGE-COUNTER 0>

<ROUTINE I-URGE ()
	 <QUEUE I-URGE -1>
	 <SETG URGE-COUNTER <+ ,URGE-COUNTER 1>>
	 <DO-PARAGRAPH>
	 <COND (<EQUAL? ,URGE-COUNTER 1>
		<TELL "You feel an urge." CR>)
	       (<EQUAL? ,URGE-COUNTER 2>
		<TELL "You trace the urge to the region of your bladder." CR>)
	       (<EQUAL? ,URGE-COUNTER 3>
		<TELL
"Though operating at far below normal speed, your mind begins to conclude
that it would be best at this point to ">
		<COND (<EQUAL? ,HERE ,MENS-ROOM ,LADIES-ROOM>
		       <TELL "use the">)
		      (T
		       <TELL "find a">)>
		<TELL " bathroom." CR>)
	       (<EQUAL? ,URGE-COUNTER 4>
		<TELL
"Even if you don't care about your clothes, imagine the embarrassment!" CR>)
	       (T
		<TELL ,YOU-CANT "wait another second. ">
		<COND (<EQUAL? ,HERE ,MENS-ROOM ,LADIES-ROOM>
		       <QUEUE I-KIDNAPPING 3>
		       <DEQUEUE I-URGE>
		       <MOVE ,PROTAGONIST ,HERE>
		       <TELL
"Fortunately, you've stumbled upon a bathroom. A moment later, you are feeling
much better, although your thigh muscles are still quivering a tad.">
		       <NOTICE-PIZZA-ODOR>)
		      (T
		       <TELL
"Without going into embarrassing detail, you've made a mess. A moment later,
before even half the people in Joe's have begun tittering, a flash of green
light precedes the arrival of two VERY odd patrons. They rotate their bellies
to get a better look at you. As their mouth stalks open you find that, despite
an evolution that occurred dozens of astronomical units from Upper Sandusky,
these fellows speak in perfect midwestern English.|
   \"This one?\"|
   \"A pitiful specimen ... can't even control simple bodily functions ...
the tests would be worthless...\"|
   \"Agreed. Must've been a screw-up somewhere. Let's take this one instead.\"|
   They grab a blonde woman, whose scream is cut short by another green flash.
Three weeks later, when the Earth is invaded and everyone is enslaved by "
'LGOP ", you wonder if there was a connection." CR>
		       <FINISH>)>)>>

<OBJECT PIZZA
	(DESC "dubious slice of pizza")
	(SYNONYM SLICE PIZZA)
	(ADJECTIVE DUBIOUS AGING CRUMPLED)
	(FLAGS TRYTAKEBIT)
	(ACTION PIZZA-F)>

<ROUTINE PIZZA-F ()
	 <COND (<VERB? EAT TASTE TAKE>
		<FSET ,PIZZA ,TOUCHBIT> ;"for V-VOMIT"
		<TELL "The very thought is enough to make stronger ">
		<COND (<NOT ,MALE>
		       <TELL "wo">)>
		<TELL "men than yourself ">
		<COND (<EQUAL? ,NAUGHTY-LEVEL 0>
		       <TELL "become quite ill">)
		      (<EQUAL? ,NAUGHTY-LEVEL 1>
		       <TELL "vomit">)
		      (T
		       <TELL "puke their guts out">)>
		<TELL ,PERIOD-CR>)>>

<ROUTINE NOTICE-PIZZA-ODOR ()
	 <THIS-IS-IT ,ODOR>
	 <TELL CR
"   Now that the \"crisis\" has passed, you notice a strong and familiar
odor pervading the room." CR>>

<ROUTINE I-KIDNAPPING ()
	 <COND (<IN? ,PROTAGONIST ,STOOL>
		<MOVE ,STOOL ,CELL>)>
	 <MOVE ,PROTAGONIST ,HERE>
	 <COND (,MALE
		<PUTP ,GARMENT ,P?SDESC "brass loincloth">)
	       (T
		<PUTP ,GARMENT ,P?SDESC "brass bikini">)>
	 <PUTP ,COMIC-BOOK ,P?SDESC "rule book">
	 <FCLEAR ,GARMENT ,NARTICLEBIT>
	 <FCLEAR ,GARMENT ,VOWELBIT>
	 <FCLEAR ,GARMENT ,PLURALBIT>
	 <ROB ,PROTAGONIST ,CELL> ;"drop everything you have but..."
	 <MOVE ,GARMENT ,PROTAGONIST> ;"...your clothes..."
	 <MOVE ,COMIC-BOOK ,PROTAGONIST> ;"...and the rule book"
	 <UPDATE-SCORE 8>
	 <COND (<NOT <EQUAL? ,VERBOSITY 0>>
		<TELL
"   A brilliant flash of green light seems less unusual when followed by the
appearance of tentacled aliens, as is the case with the current flash of green
light. The tentacles wrap roughly around you as you faint.|
   After an unknown amount of time... Well, let's ">
		<COND (<EQUAL? ,NAUGHTY-LEVEL 0>
		       <TELL "be frank">)
		      (T
		       <TELL "cut the ">
		       <COND (<EQUAL? ,NAUGHTY-LEVEL 1>
			      <TELL "crap">)
			     (T
			      <TELL "bullshit">)>)>
		<TELL
". 7.3 hours later, you wake. Your head feels as if it's been run over by
several locomotives, or at least one very large locomotive, and your clothes
are now unrecognizable" ,ELLIPSIS>)>
	 <GOTO ,CELL>
	 <CELL-F ,M-END>>

<OBJECT CELL-OBJECT
	(IN LOCAL-GLOBALS)
	(DESC "cell")
	(SYNONYM CELL)
	(ADJECTIVE PRISON OTHER)
	(ACTION CELL-OBJECT-F)>

<ROUTINE CELL-OBJECT-F ()
	 <COND (<VERB? ENTER BOARD WALK-TO>
		<COND (<ADJ-USED ,CELL-OBJECT ,W?OTHER ,W?SMALL>
		       <COND (<EQUAL? ,HERE ,OTHER-CELL>
			      <TELL ,LOOK-AROUND>)
			     (<EQUAL? ,HERE ,END-OF-HALLWAY>
			      <DO-WALK ,P?SOUTH>)
			     (T
			      <TELL ,CANT-FROM-HERE>)>)
		      (<EQUAL? ,HERE ,CELL>
		       <TELL ,LOOK-AROUND>)
		      (<EQUAL? ,HERE ,END-OF-HALLWAY>
		       <DO-WALK ,P?NORTH>)
		       (T
		       <TELL ,CANT-FROM-HERE>)>)
	       (<VERB? EXIT LEAVE DISEMBARK>
		<COND (<ADJ-USED ,CELL-OBJECT ,W?OTHER ,W?SMALL>
		       <COND (<EQUAL? ,HERE ,OTHER-CELL>
			      <DO-WALK ,P?NORTH>)
			     (T
			      <TELL ,LOOK-AROUND>)>)
		      (<EQUAL? ,HERE ,CELL>
		       <DO-WALK ,P?SOUTH>)
		      (<EQUAL? ,HERE ,OTHER-CELL>
		       <DO-WALK ,P?NORTH>)
		      (T
		       <TELL ,LOOK-AROUND>)>)
	       (<AND <VERB? EXAMINE>
		     <NOT <EQUAL? ,HERE ,END-OF-HALLWAY>>>
		<V-LOOK>)
	       (<VERB? LOOK-INSIDE OPEN CLOSE>
		<COND (<EQUAL? ,HERE ,END-OF-HALLWAY>
		       <COND (<ADJ-USED ,CELL-OBJECT ,W?OTHER ,W?SMALL>
			      <PERFORM-PRSA ,NARROW-CELL-DOOR>)
			     (T
			      <PERFORM-PRSA ,WIDE-CELL-DOOR>)>)
		      (<VERB? LOOK-INSIDE>
		       <V-LOOK>)
		      (<EQUAL? ,HERE ,CELL>
		       <PERFORM-PRSA ,WIDE-CELL-DOOR>)
		      (T
		       <PERFORM-PRSA ,NARROW-CELL-DOOR>)>
		<RTRUE>)
	       (<AND <VERB? PUT>
		     <PRSI? ,CELL-OBJECT>>
		<COND (<EQUAL? ,HERE ,END-OF-HALLWAY>
		       <TELL ,CANT-FROM-HERE>)
		      (T
		       <PERFORM ,V?DROP ,PRSO>
		       <RTRUE>)>)
	       (<AND <NOT <EQUAL? ,HERE ,END-OF-HALLWAY>>
		     <PRSO? ,CELL-OBJECT>>
		<PERFORM-PRSA ,GLOBAL-ROOM ,PRSI>
		<RTRUE>)>>

<ROOM CELL
      (IN ROOMS)
      (DESC "Cell")
      (SOUTH TO END-OF-HALLWAY IF WIDE-CELL-DOOR IS OPEN)
      (OUT TO END-OF-HALLWAY IF WIDE-CELL-DOOR IS OPEN)
      (FLAGS ONBIT RLANDBIT ;INDOORSBIT)
      (GLOBAL WIDE-CELL-DOOR HOLE CELL-OBJECT)
      ;(HOLE-DESTINATION MAIN-HALL-OF-PALACE)
      (ACTION CELL-F)>

<ROUTINE CELL-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are in a large cell with a soft, cushiony floor. A wide door (">
		<COND (<FSET? ,WIDE-CELL-DOOR ,OPENBIT>
		       <TELL "now open">)
		      (<FSET? ,WIDE-CELL-DOOR ,TOUCHBIT>
		       <TELL "now closed">)
		      (T
		       <TELL "closed, naturally">)>
		<TELL ") forms the southern wall of the cell">
		<TELL ".">)
	       (<AND <EQUAL? .RARG ,M-END>
		     <NOT ,TRAY-DELIVERED>>
		<SETG TRAY-DELIVERED T>
		<MOVE ,TRAY ,HERE>
		<TELL
"   Someone thrusts a tray into your cell. A " D ,CHOCOLATE " on the tray"
,LOOKS-UNAPPETIZING>)
	       (<AND <EQUAL? .RARG ,M-END>
		     <IN? ,SIDEKICK ,HERE>
		     <NOT ,CELL-GRIPE>>
		<SETG CELL-GRIPE T>
		<TELL
"   \"What a great cell!\" says " D ,SIDEKICK ", looking around. \"Why
didn't I get a cell like this? Maybe I shouldn't have kicked that guard ">
		<COND (<EQUAL? ,NAUGHTY-LEVEL 1>
		       <TELL "below the waist ">)
		      (<EQUAL? ,NAUGHTY-LEVEL 2>
		       <TELL "in the nuts ">)>
		<TELL "when I first got here...\"" CR>)>>

<GLOBAL CELL-GRIPE <>>

<GLOBAL TRAY-DELIVERED <>>

<OBJECT BLANKET
	(IN CELL)
	(DESC "blanket")
	;(NO-T-DESC "blanke")
	(SYNONYM BLANKET)
	(FLAGS TAKEBIT ;BURNBIT)
	(ACTION BLANKET-F)>

<ROUTINE BLANKET-F ()
	 <COND ;(<FSET? ,BLANKET ,UNTEEDBIT>
		<RFALSE>)
	       (<VERB? MEASURE>
		<TELL "Small." CR>)
	       (<OR <VERB? WEAR>
		    <AND <VERB? WRAP>
			 <PRSI? ,ME>>>
		<TELL
"It's too small; your jailors must have meant it to be used as a pillow." CR>)
	       (<VERB? BOARD>
		<WASTES>)
	       (<VERB? TIE>
		<TELL "The material of the blanket is too thick to knot." CR>)
	       (<AND <VERB? PUT-ON>
		     <PRSO? ,BLANKET>
		     <NOT <FSET? ,PRSI ,SURFACEBIT>>>
		<WASTES>)>>

<OBJECT PAINTING
	(IN CELL)
	(DESC "painting")
	(FDESC "Hanging on the wall is a painting of a pussy cat.")
	;(NO-T-DESC "paining")
	(SYNONYM PAINTING PICTURE CAT)
	(ADJECTIVE PUSSY ART)
	(FLAGS TAKEBIT ;BURNBIT)
	(ACTION PAINTING-F)>

<ROUTINE PAINTING-F ()
	 <COND (<AND <VERB? EXAMINE>>
		<SETG AWAITING-REPLY 2>
		<QUEUE I-REPLY 2>
		<TELL "It's a good likeness of a pussy, but is it art?" CR>)>>

<OBJECT TRAY
	(DESC "tray")
	(SYNONYM TRAY)
	(FLAGS TAKEBIT SURFACEBIT CONTBIT OPENBIT SEARCHBIT)
	(CAPACITY 20)>

<OBJECT CHOCOLATE
	(IN TRAY)
	(SDESC "hunk of brown food")
	;(NO-T-DESC "hunk of chocolae")
	(SYNONYM FOOD HUNK CHOCOLATE CANDY)
	(ADJECTIVE BROWN LUSCIOUS MILK CREAMY)
	(FLAGS TAKEBIT)
	(ACTION CHOCOLATE-F)>

<GLOBAL CHOCOLATE-IDENTIFIED <>>

<GLOBAL SUGAR-RUSH <>>

<ROUTINE CHOCOLATE-F ()
	 <COND (<VERB? EAT>
		<COND (<NOT <ULTIMATELY-IN? ,CHOCOLATE>>
		       <TELL ,YNH " it!" CR>
		       <RTRUE>)>
		<REMOVE ,CHOCOLATE>
	 	<QUEUE I-UNRUSH 6>
		<SETG SUGAR-RUSH 1>
		<TELL "Mmmm! ">
		<COND (,CHOCOLATE-IDENTIFIED
		       <TELL "G">)
		      (T
		       <TELL "It's a piece of really g">)>
		<TELL
"ood chocolate! You feel yourself getting a sugar rush." CR>)
	       (<VERB? EXAMINE>
		<TELL "The " D ,CHOCOLATE ,LOOKS-UNAPPETIZING>)
	       (<VERB? TASTE>
		<SETG CHOCOLATE-IDENTIFIED T>
		<PUTP ,CHOCOLATE ,P?SDESC "hunk of chocolate">
		<RFALSE> ;"It tastes just like...")
	       (<AND <VERB? SMELL>
		     <NOT <FSET? ,CHOCOLATE ,SMELLEDBIT>>>
		<SETG CHOCOLATE-IDENTIFIED T>
		<FSET ,CHOCOLATE ,SMELLEDBIT>
		<PUTP ,CHOCOLATE ,P?SDESC "hunk of chocolate">
		<SCRATCH-N-SNIFF>
		<TELL "Luscious, creamy milk chocolate!" CR>)>>

<ROUTINE I-UNRUSH ()
	 <COND (<EQUAL? ,SUGAR-RUSH 1>
		<SETG SUGAR-RUSH <>>
	 	<TELL "   You feel the sugar rush ebb." CR>)
	       (T
		<SETG SUGAR-RUSH <>>
		<RFALSE>)>>

<OBJECT WIDE-CELL-DOOR
	(IN LOCAL-GLOBALS)
	(DESC "wide cell door")
	(SYNONYM DOOR)
	(ADJECTIVE NORTH WIDE CELL)
	(FLAGS DOORBIT)>

<ROOM OTHER-CELL
      (IN ROOMS)
      (DESC "Other Cell")
      (NORTH TO END-OF-HALLWAY IF NARROW-CELL-DOOR IS OPEN)
      (OUT TO END-OF-HALLWAY IF NARROW-CELL-DOOR IS OPEN)
      (FLAGS RLANDBIT ONBIT ;INDOORSBIT)
      (GLOBAL NARROW-CELL-DOOR CELL-OBJECT)
      (ACTION OTHER-CELL-F)>

<ROUTINE OTHER-CELL-F (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-ENTER>
		     <NOT <FSET? ,OTHER-CELL ,TOUCHBIT>>>
		<THIS-IS-IT ,SIDEKICK>
		<QUEUE I-BLUEPRINT 6>
		<COND (<EQUAL? ,VERBOSITY 0>
		       <RFALSE>)>
		<TELL "As you enter, a ">
		<COND (<NOT ,MALE>
		       <TELL "wo">)>
		<TELL
"man sitting limply in the shadows stiffens and rises to ">
		<HIS-HER>
		<TELL
" feet. \"A human! They got you too? I've been here a week. When you opened"
T ,FRONT-DOOR ", I figured it was a guard! Was it unlocked? I never thought
of trying it. By the way, my name's " D ,SIDEKICK ". From Alaska. I'm not too
bright, but I'm strong as an ox, and I'm great with my hands. Maybe we can
lick these Leather Goddesses together.\"" CR CR>)
	       (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are in a very tiny room with a rock-hard floor. A " 'NARROW-CELL-DOOR
,TO-N " is ">
		<OPEN-CLOSED ,NARROW-CELL-DOOR>
		<TELL ".">)>>

<OBJECT NARROW-CELL-DOOR
	(IN LOCAL-GLOBALS)
	(DESC "narrow cell door")
	(SYNONYM DOOR)
	(ADJECTIVE SOUTH NARROW CELL)
	(FLAGS DOORBIT)
	(ACTION NARROW-CELL-DOOR-F)>

<ROUTINE NARROW-CELL-DOOR-F ()
	 <COND (<AND <VERB? KNOCK>
		     <IN? ,SIDEKICK ,OTHER-CELL>
		     <NOT <EQUAL? ,HERE ,OTHER-CELL>>>
		<TELL
"A muffled voice responds, \"Beat it, you alien fruitcake freako
mutant weirdo scum!\"" CR>)>>

<OBJECT SIDEKICK
	(IN OTHER-CELL)
	(SDESC "")
	(DESCFCN SIDEKICK-F)
	(SYNONYM TIFFAN TIFF TRENT BODY)
	(ADJECTIVE TRENT TIFFAN TIFF\'S)
	(FLAGS NARTICLEBIT ACTORBIT CONTBIT OPENBIT SEARCHBIT)
	(ACTION SIDEKICK-F)>

<ROUTINE SIDEKICK-F ("OPTIONAL" (OARG <>))
	 <COND (.OARG
		<COND (<EQUAL? .OARG ,M-OBJDESC?>
		       <RTRUE>)>
		<DO-PARAGRAPH>
		<TELL D ,SIDEKICK " is here, ">
		<SIDEKICK-DESC>
		<TELL ".">)
	       (<EQUAL? ,SIDEKICK ,WINNER>
		<COND ;(<VERB? WHAT>
		       <PERFORM ,V?TELL-ABOUT ,ME ,PRSO>
		       <RTRUE>)
		      (<AND <VERB? READ>
			    <PRSO? ,SCRAP-OF-PAPER>>
		       <PERFORM ,V?TELL-ABOUT ,ME ,SCRAP-OF-PAPER>
		       <RTRUE>)
		      (<VERB? WHAT>
		       <COND (<PRSO? ,SCRAP-OF-PAPER>
			      <TELL
"\"I dunno what it means; I doodled it one night in my sleep!\"" CR>)
			     (<PRSO? ,LGOP>
			      <TELL
"\"No doubt some gang of interplanetary floozies who get their jollies
from enslaving defenseless planets. We'll stop 'em!\"" CR>)
			     (T
			      <TELL
D ,SIDEKICK " shrugs. \"What do I know? I'm from Alaska,\" ">
			      <HE-SHE>
			      <TELL
" says, in a burst of insecurity that will no doubt ease in a quarter-century
or so when Alaska becomes a state." CR>)>)
		      (<VERB? WALK>
		       <TELL "\"After you!\"" CR>)
		      (<AND <VERB? FOLLOW>
			    <PRSO? ,ME>>
		       <TELL "\"Lead on!\"" CR>)
		      (<VERB? HELLO>
		       <TELL "\"Hi!\"" CR>)
		      (<AND <VERB? GIVE>
			    <PRSI? ,ME>>
		       <SETG WINNER ,PROTAGONIST>
		       <PERFORM ,V?ASK-FOR ,SIDEKICK ,PRSO>
		       <SETG WINNER ,SIDEKICK>
		       <RTRUE>)
		      (<VERB? SGIVE>
		       <RFALSE>)
		      ;(<AND <VERB? MAKE>
			    <PRSO? ,ANTI-LGOP-MACHINE>>
		       <TELL "\"Don't crowd me.\"" CR>)
		      (T
		       <TELL D ,SIDEKICK " is ">
		       <SIDEKICK-DESC>
		       <TELL " and fails to notice that you've spoken." CR>
		       <STOP>)>)
	       (<WRONG-SEX-WORD ,SIDEKICK ,W?TRENT ,W?TIFFAN>
		<STOP>)
	       (<WRONG-SEX-WORD ,SIDEKICK ,W?TRENT ,W?TIFF>
		<STOP>)		 
	       (<VERB? EXAMINE>
		<TELL D ,SIDEKICK " is about your age">
		<COND (<NOT <EQUAL? ,NAUGHTY-LEVEL 0>>
		       <TELL
" and has a body worthy of envy: tall and well-built, with wide shoulders, ">
		       <COND (,MALE
			      <TELL "massive pectorals, and thick">)
			     (T
			      <TELL "a generous bosom, slim waist, and long">)>
		       <TELL
", tawny legs. The only minus seems to be slightly oversized feet, but even
oversized feet are a plus if you're into toe-sucking">)>
		<TELL ".">
		<COND (<FIRST? ,SIDEKICK>
		       <TELL " ">
		       <RFALSE>)
		      (T
		       <CRLF>)>)
	       (<AND <VERB? ASK-FOR>
		     <PRSO? ,SIDEKICK>>
		<COND (<ULTIMATELY-IN? ,PRSI ,SIDEKICK>
		       <MOVE ,PRSI ,PROTAGONIST>
		       <TELL "\"What's mine is yours!\"" CR>)
		      (T
		       <TELL "\"I haven't got" A ,PRSI "!\"" CR>)>)
	       (<VERB? CLIMB-ON BOARD STAND-ON CLIMB>
		<COND (<AND <EQUAL? ,HERE ,CLOSET>
			    <FIRST? ,SHELF>>
		       <TELL "Using " D ,SIDEKICK "'s shoulders, you ">
		       <ROB ,SHELF ,PROTAGONIST>
		       <TELL "get everything from" TR ,SHELF>)
		      (T
		       <WASTES>)>)
	       (<VERB? SHOW>
		<COND (<PRSO? ,SCRAP-OF-PAPER>
		       <PERFORM ,V?ASK-ABOUT ,SIDEKICK ,SCRAP-OF-PAPER>
		       <RTRUE>)>)>>

<ROUTINE SIDEKICK-DESC ()
	 <COND ;(<G? ,PLAZA-COUNTER 0>
		<TELL "busy with" T ,ANTI-LGOP-MACHINE>)
	       ;(<EQUAL? ,HERE ,BOUDOIR>
		<TELL "lying on another couch">)
	       (<PROB 33>
		<TELL "alertly surveying your surroundings">)
	       (<PROB 50>
		<TELL "doing some quick limbering exercises">)
	       (T
		<TELL "counting on ">
		<HIS-HER>
		<TELL " fingers and mumbling to ">
		<HIM-HER>
		<TELL "self">)>>

<OBJECT SCRAP-OF-PAPER
	(IN OTHER-CELL)
	(DESC "scrap of paper")
	(FDESC
"A crumpled paper lies discarded in the corner. There seems to be some
writing on it.")
	(SYNONYM SCRAP PAPER)
	(ADJECTIVE DISCARDED CRUMPLED)
	(FLAGS TAKEBIT ;BURNBIT READBIT)
	(SIZE 2)
	(TEXT
"There's a seemingly meaningless matrix of letters on the paper:|
   HESOHREBBUR|
   ILSSSIPNGEF|
   RGIUGHTHDEN|
   SNKOOBENOHP|
   FALYTMERATP|
   SHEADLIGHTO|
   SLLABNOTTOC"
;"after removing all the letters from all the words on the parts list, the
remaining letters spell HISSING FRIGHTENS FLY TRAPS")>

<ROOM END-OF-HALLWAY
	(IN ROOMS)
	(DESC "End of Hallway")
	(WEST PER EXAMINATION-ROOM-F)
	(EAST PER OTHER-END-OF-HALLWAY-F)
	(NORTH TO CELL IF WIDE-CELL-DOOR IS OPEN)
	(SOUTH TO OTHER-CELL IF NARROW-CELL-DOOR IS OPEN)
	(UP TO OBSERVATION-ROOM)
	(DOWN TO BASEMENT)
	(FLAGS RLANDBIT ONBIT ;INDOORSBIT)
	(GLOBAL SIGN WIDE-CELL-DOOR NARROW-CELL-DOOR EXAM-ROOM-DOOR
	 	CELL-OBJECT STAIRS)
	(ACTION END-OF-HALLWAY-F)>

<ROUTINE END-OF-HALLWAY-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "A " 'WIDE-CELL-DOOR " lies ">
		<OPEN-CLOSED ,WIDE-CELL-DOOR>
		<TELL ,TO-N ", and" A ,NARROW-CELL-DOOR " lies ">
		<OPEN-CLOSED ,NARROW-CELL-DOOR>
		<TELL ,TO-S ". The hallway ends at a gleaming "
'EXAM-ROOM-DOOR ,TO-W ", and continues east. Something, possibly this
very sentence, tells you that it would be dangerous to travel east or
west" ,SIGN-AND-STAIRS>)>>

<OBJECT EXAM-ROOM-DOOR
	(IN LOCAL-GLOBALS)
	(DESC "metal door")
	(SYNONYM DOOR)
	(ADJECTIVE WEST GLEAMING METAL)
	(FLAGS NDESCBIT DOORBIT)>

<GLOBAL SEEN-EXAMINATION-ROOM <>>

<ROUTINE EXAMINATION-ROOM-DESC ("OPTIONAL" (VIEWING <>))
	 <TELL "A number of hideous experiments fill th">
	 <COND (.VIEWING
		<TELL "e">)
	       (T
		<TELL "is">)>
	 <TELL " room. Their obvious purpose: studies of the human anatomy">
	 <COND (<NOT <EQUAL? ,NAUGHTY-LEVEL 1>>
		<TELL
", especially those parts rarely referred to in the New York Times">)>
	 <TELL
". A pathetic-looking human is the current subject; however, even an author as
fond of lascivious detail as this one would hesitate to describe it ">
	 <COND (<EQUAL? ,NAUGHTY-LEVEL 2>
		<TELL
"even in LEWD mode, except to mention that it involves a lot of lubricants,
some plastic tubing, and a yak." CR>)
	       (T
		<TELL "to someone who's merely in ">
		<COND (<EQUAL? ,NAUGHTY-LEVEL 0>
		       <TELL "TAME">)
		      (T
		       <TELL "SUGGESTIVE">)>
		<TELL " mode." CR>)>> 

<ROUTINE EXAMINATION-ROOM-F ()
	 <COND (<FSET? ,EXAM-ROOM-DOOR ,OPENBIT>
		<TELL "\"Examination\" Room|   ">
		<COND (,SEEN-EXAMINATION-ROOM
		       <TELL
"The experiments look even more horrible from here than from
the Observation Room window." CR>)
		      (T
		       <EXAMINATION-ROOM-DESC>)>
		<TELL
"   Before you've really gotten as sick as you know you could get, one of the">
		<LECKBANDI>
		<RFALSE>)
	       (T
		<THIS-IS-IT ,EXAM-ROOM-DOOR>
		<DO-FIRST "open" ,EXAM-ROOM-DOOR>
		<RFALSE>)>>

<ROUTINE OTHER-END-OF-HALLWAY-F ()
	 <TELL
"Other End of Hallway|
   Before you can even begin to wonder what happened to the middle of the
hallway, a guard patrol erupts from the shadows. A">
	 <LECKBANDI>
	 <RFALSE>>

<ROUTINE LECKBANDI ()
	 <JIGS-UP
" tall, neatly dressed Leckbandi tucks you under its arm. (The Leckbandi, who
evolved in the asteroid belt, all work exclusively as security guards. This
is odd, since there's not a single thing in the entire asteroid belt worth
stealing.)|
   Consulting a wrist computer, the Leckbandi punches in notable features of
your appearance: size, number of heads, lack of feathers, and so forth.
Eventually, the tiny screen flashes: \"IDENTIFICATION COMPLETED: Prisoner,
human, escaped. DISPOSITION: Death, painful, immediate.\" The Leckbandi, who,
like all Leckbandis, prides itself on its ability to follow the orders of
wrist computers, immediately and painfully kills you.">>

<ROOM BASEMENT
      (IN ROOMS)
      (DESC "Basement")
      (LDESC
"This is a moist cellar. Soft light trickles down the stairway.")
      (UP TO END-OF-HALLWAY)
      (OUT TO END-OF-HALLWAY)
      (FLAGS ONBIT RLANDBIT ;INDOORSBIT)
      (GLOBAL STAIRS)
      (THINGS <PSEUDO (<> LIGHT UNIMPORTANT-THING-F)>)>

<ROOM OBSERVATION-ROOM
      (IN ROOMS)
      (DESC "Observation Room")
      (NORTH TO CLOSET)
      (WEST
"You discover that the window makes a pleasant \"boing\" noise
when a human nose is pushed into it at approximately walking speed.")
      (IN TO CLOSET)
      (DOWN TO END-OF-HALLWAY)
      (UP TO ROOF)
      (FLAGS ONBIT RLANDBIT ;INDOORSBIT)
      (GLOBAL WINDOW SIGN STAIRS)
      (ACTION OBSERVATION-ROOM-F)
      (THINGS <PSEUDO (SMALL CLOSET CLOSET-OBJECT-F)>)>

<ROUTINE OBSERVATION-ROOM-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Calvin Coolidge once described windows as \"rectangles of glass.\" If so,
he may have been thinking about the window which fills the western wall of
this room. A tiny closet lies" ,TO-N ,SIGN-AND-STAIRS>)>>

<ROOM CLOSET
      (IN ROOMS)
      (DESC "Closet")
      (SOUTH PER CLOSET-EXIT-F)
      (OUT PER CLOSET-EXIT-F)
      (FLAGS RLANDBIT ;INDOORSBIT)
      (GLOBAL HOLE ODOR)
      (ACTION CLOSET-F)
      (THINGS <PSEUDO (SMALL CLOSET CLOSET-OBJECT-F)>)>

<ROUTINE CLOSET-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This room is barely large enough to turn around in. Just to prove
it, you turn around. As you do, you spot" A ,HOLE ", about two feet across,
seemingly painted on the floor in the corner. A shelf protrudes from one
wall, very close to the ceiling. The closet is open" ,TO-S ,PERIOD-CR>
		<TELL "   A strong odor ">
		<COND (<FSET? ,HERE ,SMELLEDBIT>
		       <TELL "of mothballs ">)>
		<TELL "pervades the closet.">
		<RTRUE>)
	       (<EQUAL? .RARG ,M-SMELL>
		<TELL
"Apparently this section of Phobos has a significant moth problem.">)>>

<ROUTINE CLOSET-EXIT-F ()
	 <TELL "Ah! Coming out of the closet, I see" ,ELLIPSIS>
	 ,OBSERVATION-ROOM>

<ROUTINE CLOSET-OBJECT-F ()
	 <COND (<VERB? ENTER WALK-TO BOARD>
		<COND (<EQUAL? ,HERE ,CLOSET>
		       <TELL ,LOOK-AROUND>)
		      (<EQUAL? ,HERE ,OBSERVATION-ROOM>
		       <DO-WALK ,P?NORTH>)>)
	       (<VERB? EXIT LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,CLOSET>
		       <DO-WALK ,P?SOUTH>)
		      (T
		       <TELL ,LOOK-AROUND>)>)
	       (<VERB? OPEN CLOSE>
		<TELL "No door" ,PERIOD-CR>)
	       (<AND <VERB? SMELL>
		     <EQUAL? ,HERE ,CLOSET>>
		<PERFORM-PRSA ,ODOR>
		<RTRUE>)
	       (<VERB? SEARCH>
		<TELL ,NOTHING-NEW>)
	       (<VERB? LOOK-INSIDE>
		<COND (<EQUAL? ,HERE ,CLOSET>
		       <V-LOOK>)
		      (T
		       <TELL ,ONLY-BLACKNESS>)>)>>

<OBJECT SHELF
	(IN CLOSET)
	(DESC "shelf")
	(SYNONYM SHELF LEDGE)
	(FLAGS SURFACEBIT SEARCHBIT CONTBIT OPENBIT NDESCBIT)
	(CAPACITY 40)
	(ACTION SHELF-F)>

<ROUTINE SHELF-F ()
	 <COND (<AND <VERB? PUT-ON PUT>
		     <PRSI? ,SHELF>
		     <NOT <IN? ,PROTAGONIST ,STOOL>>>
		<CANT-REACH ,SHELF>
		<RTRUE>)>>

<OBJECT BASKET
	(IN SHELF)
	(DESC "wicker basket")
	(SYNONYM BASKET)
	(ADJECTIVE WICKER)
	(CAPACITY 40) ;"shouldn't be able to hold more than baby and blanket"
	(FLAGS CONTBIT SEARCHBIT OPENBIT TAKEBIT ;BURNBIT)
	(ACTION BASKET-F)>

<ROUTINE BASKET-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The basket is oval-shaped. A handle spans the narrow part." CR>)
	       (<VERB? OPEN CLOSE>
		<NO-LID>)>>

<ROOM ROOF
      (IN ROOMS)
      (DESC "Roof")
      (DOWN TO OBSERVATION-ROOM)
      (IN TO OBSERVATION-ROOM)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL STAIRS HOLE)
      (ACTION ROOF-F)
      (THINGS <PSEUDO (<> ROOF ROOF-OBJECT-F)>)>

<ROUTINE ROOF-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Your view extends to the horizon, which on tiny Phobos usually means a few
hundred feet. Thrusting up into sight beyond the horizon are the arching
towers and curving domes of the notorious Pleasure Palace of " 'LGOP ". On a
wide plain between here and the palace, powerful warships are poised for the
imminent invasion of Earth.|
   Mars dominates the view, a dull red orb spanning a quarter of the sky.
Bright blue canals lace the surface, and white caps of ice are visible at
both poles.|
   A stairway leads down into the building. Near the edge, seemingly painted
onto the roof, is" A ,HOLE ". You might be able to jump to the ground, but
frankly we advise against it.">)>>

<ROUTINE ROOF-OBJECT-F ()
	 <COND (<OR <VERB? LEAP-OFF DISEMBARK>
		    <AND <VERB? TAKE-OFF>
			 <EQUAL? ,P-PRSA-WORD ,W?GET>>>
		<SETG PRSO <>>
		<V-LEAP>)
	       (<VERB? EXAMINE>
		<V-LOOK>)
	       (<VERB? SEARCH>
		<TELL ,NOTHING-NEW>)>>

<OBJECT LGOP
	(IN LOCAL-GLOBALS)
	(DESC "the Leather Goddesses of Phobos")
	(SYNONYM PHOBOS)
	(ADJECTIVE LEATHER GODDES)
	(FLAGS NDESCBIT NARTICLEBIT ACTORBIT FEMALEBIT PLURALBIT)>

;<
<GLOBAL INT-MAX 429> ;"sum of highest possible scores"

<GLOBAL EXT-MAX 9309> ;"what you tell player the maximum score is"

<ROUTINE INC-LGOP-SCORE (BASE VAR "AUX" CHANGE DIF)
	 ;<COND (.INC-RANK
		<SETG RANK <+ ,RANK 1>>)>
	 <SET CHANGE <+ <RANDOM .VAR> .BASE>>
	 <SET DIF <- <+ .BASE .VAR> .CHANGE>>
	 <SETG INT-MAX <- ,INT-MAX .DIF>>
	 <SETG EXT-MAX <+ ,INT-MAX <RANDOM <- ,EXT-MAX ,INT-MAX>>>>
	 <SETG SCORE <+ ,SCORE .CHANGE>>>
>

<ROUTINE I-BLUEPRINT ()
	 <COND (<AND <VISIBLE? ,SIDEKICK>
		     <LIT? ,HERE>
		     ;<NOT <EQUAL? <LOC ,SIDEKICK> ,SECOND-SLAB ,STALLION>>
		     ;<NOT <QUEUED? ,I-SIDEKICK-OUT-WINDOW>>>
		<MOVE ,MATCHBOOK ,PROTAGONIST>
		<TELL
"   " D ,SIDEKICK " trots over to you. \"I've got a plan to bring these
Leather Goddess jokers to their knees,\" ">
		<HE-SHE>
		<TELL " says, flipping you a " 'MATCHBOOK ". It's cover is
filled with scrawled notations.">
		<SCRAPE-UP-THESE-ITEMS>)
	       (T
		<QUEUE I-BLUEPRINT 3>
		<RFALSE>)>>

<ROUTINE SCRAPE-UP-THESE-ITEMS ()
	 <TELL
"\"If we can scrape up these items, I can whip up something that'll knock 'em
cold! A Super-Duper Anti-" <GET ,GAME-NAMES 2> " Attack Machine!!!\"" CR>>

<OBJECT MATCHBOOK
	(DESC "matchbook")
	;(NO-T-DESC "machbook")
	(SYNONYM BOOK COVER MATCHES NOTES)
	(ADJECTIVE EMPTY MATCH MATCHBOOK NOTATI)
	(FLAGS READBIT TAKEBIT BURNBIT)
	(SIZE 2)
	(ACTION MATCHBOOK-F)>

<ROUTINE MATCHBOOK-F ()
	 <COND ;(<FSET? ,MATCHBOOK ,UNTEEDBIT>
		<RFALSE>)
	       (<AND <VERB? KILL>
		     <EQUAL? ,P-PRSA-WORD ,W?STRIKE>>
		<PERFORM ,V?ON ,MATCHBOOK>
		<RTRUE>)
	       (<VERB? OPEN COUNT LOOK-INSIDE ON>
		<TELL
"You briefly open the " 'MATCHBOOK " and see that
there are no matches left." CR>)
	       (<VERB? CLOSE>
		<TELL ,ALREADY-IS>)
	       (<VERB? READ EXAMINE>
		<TELL
"Most of the scrawlings are a \"blueprint\" for a vastly complicated
device. Below that is a parts list:|
   1. a common household blender|
   2. six feet of rubber hose|
   3. a pair of cotton balls|
   4. an eighty-two degree angle|
   5. a headlight from any 1933 Ford|
   6. a white mouse|
   7. any size photo of">
		<COND (,MALE
		       <TELL " Jean Harlow|">)
		      (T
		       <TELL " Douglas Fairbanks|">)>
	        <TELL "   8. a copy of the Cleveland phone book" CR CR
"[The goal of " ,LGOP-CAPS " is to round up these eight items, and then to
defeat the evil Leather Goddesses before they are able to carry out their
evil scheme and enslave all of humanity.]" CR>)>>

<OBJECT HOLE
	(IN LOCAL-GLOBALS)
	(SDESC "black circle")
	(SYNONYM HOLE CIRCLE)
	(ADJECTIVE BLACK WHITE)
	(ACTION HOLE-F)>

;<GLOBAL HOLE-MOVE <>>

<ROUTINE HOLE-F ("AUX" OLD-HERE)
	 <COND (<VERB? STAND-ON ENTER BOARD>
		<FALL-THROUGH-HOLE>
		<RTRUE>)	       
	       (<VERB? LOOK-UNDER TAKE>
		<TELL "It's not liftable" ,PERIOD-CR>)
	       (<AND <VERB? PUT PUT-ON PUT-THROUGH>
		     <PRSI? ,HOLE>>
		<NON-DIMENSIONAL-JOURNEY>)
	       (<VERB? REACH-IN TOUCH>
		<TELL
"Your hand dwindles disorientingly to a point, like railroad tracks
vanishing toward the horizon" ,PERIOD-CR>)
	       (<VERB? EXAMINE LOOK-INSIDE>
		<TELL
"It's like staring into an eternal void of blackest infinity sucking up all
life and thought and hope and being -- or, like what you see after getting
your face smashed in a bar fight. You can pick the metaphor you're most
familiar with" ,PERIOD-CR>)>>

;<ROUTINE HOLE-INVISIBLE ()
	 <COND (<OR <AND <EQUAL? ,HERE ,GARDEN>
		     	 <NOT <FSET? ,SOD ,MUNGBIT>>>
		    <AND <EQUAL? ,HERE ,CELL>
		         <NOT ,HOLE-OPEN>>
	            <AND <EQUAL? ,HERE ,LONG-CORRIDOR>
		     	 <NOT <EQUAL? ,LONG-CORRIDOR-LOC 3>>>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE NON-DIMENSIONAL-JOURNEY ()
	 <REMOVE ,PRSO>
	 <TELL
"You get all cross-eyed trying to follow the non-dimensional journey of"
T ,PRSO " into" T ,HOLE ". When you get your eyeballs untangled again,"
T ,PRSO " is gone." CR>>

<ROOM JUNGLE
      (IN ROOMS)
      (DESC "Jungle")>

<ROUTINE FALL-THROUGH-HOLE ()
	 ;<SETG HOLE-MOVE T>
	 ;<SETG RAFT-HELD <>>
	 <SETG HERE ,JUNGLE>
	 <UPDATE-SCORE 7>
	 <MOVE ,PROTAGONIST ,HERE>
	 <USL>
	 <TELL
"You're sucked into the hole in a direction that isn't down, but neither
is it one of the other directions with which you're familiar.|
|
Jungle|
   You are surrounded by hot, steamy, primitive rain forest. Judging by the
overpowering heat, the excessive humidity, and especially by the gigantic Venus
flytrap sidling your way, you must be in the death-clogged jungles of Venus.|
   A path runs east-west through the jungle, but don't even think about going
west unless you love wading into four tons of man-eating lettuce.|
   The Venus flytrap sidles closer." CR>
	 <COND (<FSET? ,OTHER-CELL ,TOUCHBIT>
		<TELL
"   A few seconds later, you see " D ,SIDEKICK "'s left earlobe appear,
followed almost immediately by the rest of him.|
|
Suddenly and without warning, a lightbulb appears over " D ,SIDEKICK "'s
head.|
   \"Oops, I almost forgot! S">)
	       (T
		<TELL CR
"Suddenly and without warning, a confused-looking ">
		<COND (<FSET? ,SIDEKICK ,FEMALEBIT>
		       <TELL "wo">)>
		<TELL "man comes jogging up to you, almost out of breath.|
   \"Hi, my name's " D ,SIDEKICK "! You were supposed to find me back in
" D ,LGOP "' prison complex, but you never showed up. Anyhow, s">)>
	 <TELL "ome guy with glasses and a beard asked me to let you know that
you've completed this" ,EXCERPT " from " ,LGOP-CAPS "!\" ">
	 <COND (<FSET? ,SIDEKICK ,FEMALEBIT>
		<TELL "She lowers her">)
	       (T
	        <TELL "He lowers his">)>
	 <TELL " voice to a whisper and hisses, \"Promise that you'll buy
the real game so that we can whip these Goddesses before they succeed in
turning the Earth into their own, private pleasure world. You're our only
hope!\"" CR>
	 <FINISH>>