"GUIDE  for
		  MILLIWAYS
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."


;<OBJECT OBJECT-OF-GAME
	(IN GLOBAL-OBJECTS)
	(DESC "object of the game")
	(SYNONYM OBJECT GAME GOAL)
	(FLAGS VOWELBIT)
	(ACTION OBJECT-OF-GAME-F)>

;<ROUTINE OBJECT-OF-GAME-F ()
	 <COND (<VERB? WHAT>
		<TELL "That's for me to know and you to find out." CR>)>>

;<OBJECT FRUSTATION
	(IN GLOBAL-OBJECTS)
	(DESC "problem")
	(SYNONYM FRUSTR PROBLE PUZZLE)
	(ACTION FRUSTRATION-F)>

;<ROUTINE FRUSTRATION-F ()
	 <COND (<VERB? ENJOY>
		<TELL ,ZEN CR>)>>


;"DONT stuff"

;<ROUTINE DONT-F ()
	 <COND (<VERB? PANIC>
		<COND (<PROB 50>
		       <TELL 
"Very clever. It looks like there's a lot you should be panicking about." CR>)
		      (T
		       <TELL
"Why not? Your position appears quite hopeless." CR>)>)
	       (<VERB? LOOK>
		<SETG DONT-FLAG <>>
		<PERFORM ,V?CLOSE ,EYES>
		<RTRUE>)
	       (<VERB? WAIT>
		<TELL "Time doesn't pass..." CR>)
	       (<VERB? TAKE>
		<TELL "Not taken." CR>)
	       (<AND <VERB? LISTEN>
		     <VISIBLE? ,POETRY>>
		<SETG DONT-FLAG <>>
		<PERFORM ,V?LISTEN ,POETRY>
		<RTRUE>)
	       (T
		<TELL "Not done." CR>)>>



;"TEA stuff"

;<GLOBAL HOLDING-NO-TEA T>

;<ROUTINE LIQUID-SPILL ()
	 <COND (<PRSI? ,FLOWERPOT ,PLANT>
		<PERFORM ,V?WATER ,PRSI ,PRSO>
		<RTRUE>)
	       (T
		<MOVE ,PRSO ,LOCAL-GLOBALS>
		<COND (<PRSO? ,BROWNIAN-SOURCE>
		       <SETG BROWNIAN-SOURCE <>>)
		      (<PRSO? ,PANEL-BLOCKER>
		       <SETG PANEL-BLOCKER <>>)>
		<TELL "It spills all over and then evaporates.">
		<COND (<PRSO? ,MINERAL-WATER>
		       <ANTI-LITTER "bottle">)
		      (T
		       <ANTI-LITTER "cup">)>
		<CRLF>)>>

;<ROUTINE ANTI-LITTER (STRING)
	 <TELL " The " .STRING
" itself vaporises, part of the Galactic Anti-Litter Program.">>

;<OBJECT TEA
	(IN PAD)
        (DESC "tea")
	(DESCFCN TEA-DESCFCN)
	(SYNONYM TEA CUP)
	(ADJECTIVE REAL NICE HOT)
	(FLAGS NARTICLEBIT TAKEBIT TRYTAKEBIT DRINKBIT)
	(ACTION TEA-F)>

;<ROUTINE TEA-DESCFCN ("OPTIONAL" X)
	 <DESCRIBE-DRINK ,TEA>>

;<ROUTINE DESCRIBE-DRINK (DRINK)
	 <TELL "There is a nice, hot cup of " D .DRINK " here." CR>>

;<ROUTINE TEA-F ()
	 <COND (<AND <VERB? TAKE>
		     <PRSO? ,TEA>>
		<MOVE ,TEA ,PROTAGONIST>
		<SETG HOLDING-NO-TEA <>>
		<TELL "no tea: Dropped." CR>)
	       (<VERB? DROP>
		<MOVE ,TEA ,HERE>
		<COND (<EQUAL? ,HERE ,ACCESS-SPACE>
		       <SETG HOLDING-NO-TEA T>
		       <V-DROP>)
		      (,HOLDING-NO-TEA
		       <TELL "Dropped." CR>)
		      (T
		       <SETG HOLDING-NO-TEA T>
		       <TELL "no tea: Taken." CR>)>)
	       (<VERB? DRINK ENJOY DRINK-FROM>
		<COND (<NOT <HELD? ,PRSO>>
		       <TELL ,NOT-HOLDING " the cup!" CR>
		       <RTRUE>)>
		<SETG SCORE <+ ,SCORE 100>>
		<MOVE ,TEA ,LOCAL-GLOBALS>
		<SETG HOLDING-NO-TEA T>
		<COND (<EQUAL? ,TEA ,BROWNIAN-SOURCE>
		       <SETG BROWNIAN-SOURCE <>>)>
		<TELL
"It is the finest tea you have ever tasted. It has almost made this
entire misadventure seem worthwhile. You experience several moments
of complete happiness and relaxation.">
		<ANTI-LITTER "cup">
		<CRLF>)
	       (<VERB? POUR THROW>
		<LIQUID-SPILL>)
	       (<VERB? EXAMINE LOOK-INSIDE>
		<TELL
,IT-LOOKS-LIKE " it has even more" ,BROWNIAN " than " D ,SUBSTITUTE "!">
		<COND (<PRSO? ,BROWNIAN-SOURCE>
		       <TELL " ">
		       <PERFORM ,V?EXAMINE ,DANGLY-BIT>
		       <RTRUE>)
		      (T
		       <CRLF>)>)>>

;<OBJECT NO-TEA
	(IN GLOBAL-OBJECTS)
	(DESC "no tea")
	(SYNONYM TEA)
	(ADJECTIVE NO)
	(FLAGS NARTICLEBIT TRYTAKEBIT)
	(ACTION NO-TEA-F)>

;<ROUTINE NO-TEA-F ()
	 <COND (<AND <VERB? TAKE PICK-UP DROP>
		     <PRSO? ,NO-TEA>
		     <NOT <FSET? ,PARTICLE ,MUNGEDBIT>>>
		<TELL
"Your common sense tells you that you can't do that." CR>)
	       (<AND <VERB? TAKE PICK-UP>
		     <PRSO? ,NO-TEA>
		     <NOT ,HOLDING-NO-TEA>>
		<SETG HOLDING-NO-TEA T>
		<TELL "no tea: Taken." CR>)
	       (<AND <VERB? SHOW GIVE>
		     <PRSI? ,SCREENING-DOOR>>
		<RFALSE>)
	       (<AND <VERB? ASK-ABOUT>
		     <PRSO? ,GUIDE>>
		<RFALSE>)
	       (<AND <VERB? ASK-FOR>
		     <PRSO? ,NUTRIMAT>>
		<PERFORM ,V?RUB ,PAD>
		<RTRUE>)
	       (T
		<TELL
"You're talking complete nonsense; pull yourself together." CR>)>>

;<ROUTINE TEA-PRINT (OBJ) ;"tells MAIN-LOOP when to print OBJ: with VERB ALL"
	 <COND (<NOT <EQUAL? .OBJ ,TEA ,NO-TEA>>
		<RTRUE>)
	       (<VERB? SHOW>
		<RTRUE>)
	       (<EQUAL? .OBJ ,TEA>
		<COND (<VERB? TAKE>
		       <COND (<HELD? ,TEA>
			      <RTRUE>)
			     (<AND ,PRSI
				   <NOT <PRSI? <LOC ,PRSO>>>>
			      <RTRUE>)
			     (T
			      <RFALSE>)>)
		      (<AND <VERB? DROP>
			    <NOT ,HOLDING-NO-TEA>>
		       <RFALSE>)>)
	       (<AND <EQUAL? .OBJ ,NO-TEA>
		     <VERB? TAKE>
		     <NOT ,HOLDING-NO-TEA>>
		<RFALSE>)
	       (T
		<RTRUE>)>>

;"THUMB and GUIDE stuff"

<OBJECT THUMB
	(IN SATCHEL)
	(DESC "electronic Sub-Etha signaling device")
	(SYNONYM THUMB DEVICE SENSO)
	(ADJECTIVE ELECTR SUB-E SIGNAL SMALL BLACK LITTLE BLINKI)
	(SIZE 10)
	(FLAGS TAKEBIT VOWELBIT CONTBIT OPENBIT)
	(ACTION THUMB-F)>

<ROUTINE THUMB-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The " D ,THUMB " is shaped like a small fist with an extended thumb. Various
lights along its \"knuckles\" are currently ">
		<COND (<OR <IN? ,FLEET ,HERE>
			   <EQUAL? ,HERE ,AIRLOCK ,INSIDE-WHALE>>
		       <TELL
"blinking wildly, indicating a spaceship in the vicinity">)
		      (T
		       <TELL "dark">)>
		<TELL
". It has two small buttons, a red one labelled \"Call Engineer\" and a green
one labelled \"Hitchhike.\"">
		<FINE-PRODUCT>
		<TELL
" Affixed to the Thumb is a lifetime " D ,GUARANTEE "." CR>)
	       (<AND <VERB? TAKE>
		     <EQUAL? ,IDENTITY-FLAG ,FORD>
		     <IN? ,FLEET ,HERE>
		     <NOT <IN? ,THUMB ,SATCHEL>>>
		<TELL ,DRIVEN-BACK CR>)
	       (<VERB? OPEN CLOSE LOOK-INSIDE>
		<TELL "Impossible." CR>)>>

<OBJECT RED-BUTTON
	(IN THUMB)
	(DESC "red button")
	(SYNONYM BUTTON)
	(ADJECTIVE RED SMALL)
	(FLAGS NDESCBIT INTEGRALBIT)
	(SIZE 1)
	(ACTION RED-BUTTON-F)>

<ROUTINE RED-BUTTON-F ()
	 <COND (<VERB? PUSH>
		<COND (<NOT <HELD? ,THUMB>>
		       <PERFORM ,V?PUSH ,GREEN-BUTTON>
		       <RTRUE>)
		      (<IN? ,ENGINEER ,HERE>
		       <TELL
"Another " D ,ENGINEER " zips up, spots the first one, looks confused,
and leaves again." CR>)
		      (T
		       <MOVE ,ENGINEER ,HERE>
		       <MOVE ,BIKE ,HERE>
		       <ENABLE <QUEUE I-ENGINEER 2>>
		       <TELL
"With a screech of ion brakes a " ,SCC " Repair Robot pulls up on a bike
from out of the Sub-Etha." CR>)>)>>

<OBJECT GREEN-BUTTON
	(IN THUMB)
	(DESC "green button")
	(SYNONYM BUTTON)
	(ADJECTIVE GREEN SMALL HITCHH)
	(FLAGS NDESCBIT INTEGRALBIT)
	(SIZE 1)
	(ACTION GREEN-BUTTON-F)>

<ROUTINE GREEN-BUTTON-F ()
	 <COND (<VERB? PUSH>
		<COND (<NOT <HELD? ,THUMB>>
		       <TELL ,NOT-HOLDING " the " D ,THUMB "." CR>
		       <SETG P-IT-OBJECT ,THUMB>)
		      (<AND <EQUAL? ,IDENTITY-FLAG ,FORD>
			    <IN? ,FLEET ,HERE>>
		       <MOVE ,THUMB ,HERE>
		       <TELL ,THUMB-FUMBLE CR>)
		      (<FSET? ,THUMB ,MUNGEDBIT>
		       <TELL "The" ,THUMB-CLICKS CR>)
		      (<IN? ,FLEET ,HERE>
		       <COND (<EQUAL? ,DRUNK-LEVEL 3>
			      <TELL
"Lights whirl sickeningly around your head, the ground arches away beneath
your feet, and every atom of your being is scrambled, an experience you're
probably going to have to get used to. You are in..." CR CR>
			      <LEAVE-EARTH>
			      <GOTO ,DARK>)
			     (T
			      <TELL "A" ,BEAM>
			      <JIGS-UP
" is certainly a shock to the system. Too bad you didn't consume
enough alcohol to withstand it.">
			      <RTRUE>)>)
		      (<EQUAL? ,HERE ,AIRLOCK ,INSIDE-WHALE>
		       <TELL
"Every molecule in your body gets pulled away from every other molecule.
Then suddenly they snap back together again like elastic, and you find,
with a dizzy head and very sore molecules, that you are in..." CR CR>
		       <SETG HEART-PROB 100>
		       <GOTO ,DARK>)
		      (T
		       <FSET ,THUMB ,MUNGEDBIT>
		       <TELL
"The Thumb winks and flashes for a second. Nothing further happens." CR>)>)>>

<OBJECT GUARANTEE
	(IN THUMB)
	(DESC "guarantee")
	(SYNONYM GUARAN WARRAN PLAQUE)
	(ADJECTIVE LIFETI)
	(FLAGS NDESCBIT INTEGRALBIT)
	(SIZE 2)
	(ACTION GUARANTEE-F)>

<ROUTINE GUARANTEE-F ()
	 <COND (<VERB? READ EXAMINE>
		<TELL
"The lifetime " D ,GUARANTEE " states that the Thumb will be repaired on site
by trained " ,SCC " Field Engineers." CR>)>>

<OBJECT ENGINEER
	(IN LOCAL-GLOBALS) ;"just for the purpose of MOBY-FIND"
	(DESC "Engineer robot")
	(SYNONYM ROBOT ENGINE)
	(ADJECTIVE ENGINE)
	(FLAGS VOWELBIT ACTORBIT CONTBIT OPENBIT SEARCHBIT)
	(ACTION ENGINEER-F)>

<ROUTINE ENGINEER-F ()
	 <COND (<EQUAL? ,ENGINEER ,WINNER>
		<ENABLE <QUEUE I-ENGINEER 2>>
		<COND (<AND <VERB? TELL-ABOUT>
			    <PRSO? ,ME>>
		       <SETG WINNER ,PROTAGONIST>
		       <PERFORM ,V?ASK-ABOUT ,ENGINEER ,PRSI>
		       <SETG WINNER ,ENGINEER>
		       <RTRUE>)
		      (<VERB? HELLO>
		       <SETG WINNER ,PROTAGONIST>
		       <PERFORM ,V?HELLO ,ENGINEER>
		       <SETG WINNER ,ENGINEER>
		       <RTRUE>)
		      (<AND <VERB? REPAIR>
			    <PRSO? ,THUMB>>
		       <COND (<IN? ,THUMB ,ENGINEER>
			      <TELL "\"I'm doing my best...\"" CR>
			      <RTRUE>)>
		       <SETG WINNER ,PROTAGONIST>
		       <MOVE ,THUMB ,PROTAGONIST>
		       <PERFORM ,V?GIVE ,THUMB ,ENGINEER>
		       <SETG WINNER ,ENGINEER>
		       <RTRUE>)
		      (<VERB? REPAIR>
		       <TELL "\"I repair only " D ,THUMB "s!\"" CR>)
		      (<AND <VERB? YES>
			    <EQUAL? ,AWAITING-REPLY 12>>
		       <V-YES>)
		      (<AND <VERB? NO>
			    <EQUAL? ,AWAITING-REPLY 12>>
		       <V-NO>)
		      (T
		       <TELL
"\"Can't chat, pal, I'm attending to an important repair call.\"" CR>
		       <FUCKING-CLEAR>)>)
	       (<AND <VERB? GIVE SHOW>
		     <PRSO? ,THUMB>>
		<COND (<FSET? ,THUMB ,MUNGEDBIT>
		       <ENABLE <QUEUE I-ENGINEER 2>>
		       <SETG THUMB-SHOWN 1>
		       <MOVE ,THUMB ,ENGINEER>
		       <TELL
"The " D ,ENGINEER " takes it, looks at it with horror, shakes his head, sighs,
and says \"Who sold you this then?\"" CR CR>
		       <PRINTI ">">
		       <READ ,P-INBUF ,P-LEXV>
		       <TELL
"The " D ,ENGINEER " ignores your reply and shakes the Thumb despondently.
\"This is a model 13X,\" he says. \"Not meant for this sort of job. Anyway,
it's discontinued. Can't get the parts.\"" CR>)
		      (T
		       <MOVE ,THUMB ,PROTAGONIST>
		       <ENGINEER-LEAVE>
		       <TELL
"The " D ,ENGINEER " takes the Thumb, shakes it, looks it up and down.
\"Seems to be working OK to me. Unusual for a 13X.\" He hands it back
and" ,ROARS-OFF "." CR>)>)
	       (<AND <VERB? GIVE SHOW>
		     <PRSO? ,GUARANTEE>>
		<COND (<NOT <FSET? ,THUMB ,MUNGEDBIT>>
		       <PERFORM ,V?GIVE ,THUMB ,ENGINEER>
		       <RTRUE>)>
		<FCLEAR ,THUMB ,MUNGEDBIT>
		<ENGINEER-LEAVE>
		<MOVE ,THUMB ,PROTAGONIST>
		<COND (<EQUAL? ,THUMB-SHOWN 0>
		       <TELL
"The " D ,ENGINEER " looks quizzically at the " D ,GUARANTEE " and says it's
expired but he'll see what he can do. " ,FIDDLES "\"Can't promise anything.\"
He" ,ROARS-OFF "." CR>)
		      (T
		       <SETG THUMB-SHOWN 0>
		       <TELL
"The " D, ENGINEER " looks at it sceptically. \"Guaranteed to work normally for
life,\" he mutters. \"Well, it's perfectly normal for a 13X to break down. And
this one's reached the end of its life anyway. But I'll see what I can do.\""
CR CR ,FIDDLES "\"Best I can do for a 13X on an expired " D ,GUARANTEE ",\" he
says. \"Can't promise anything.\" He" ,ROARS-OFF "." CR>)>)>>

<GLOBAL ENGINEER-COUNTER 0>

<GLOBAL THUMB-SHOWN 0>

<ROUTINE ENGINEER-LEAVE ()
	 <COND (<IN? ,THUMB ,ENGINEER>
		<COND (<IN? ,ENGINEER ,HERE>
		       <MOVE ,THUMB ,PROTAGONIST>)
		      (T
		       <MOVE ,THUMB <LOC ,ENGINEER>>)>)>
	 <MOVE ,ENGINEER ,LOCAL-GLOBALS>
	 <MOVE ,BIKE ,LOCAL-GLOBALS>
	 <DISABLE <INT I-ENGINEER>>
	 <SETG THUMB-SHOWN 0>
	 <SETG ENGINEER-COUNTER 0>>

<ROUTINE I-ENGINEER ()
	 <ENABLE <QUEUE I-ENGINEER -1>>
	 <SETG ENGINEER-COUNTER <+ ,ENGINEER-COUNTER 1>>
	 <COND (<NOT <IN? ,ENGINEER ,HERE>>
		<ENGINEER-LEAVE>
		<RFALSE>)>
	 <CRLF>
	 <COND (<EQUAL? ,THUMB-SHOWN 1>
		<SETG THUMB-SHOWN 2>
		<TELL
"The " D ,ENGINEER " ignores you completely. \"See, this is the model with
the 5kz booster,\" he says. \"Hopeless.\" He shakes his head grimly." CR>)
	       (<EQUAL? ,THUMB-SHOWN 2>
		<TELL
"The " D ,ENGINEER " ignores you. \"What you want, you see, is one of the new
Mk7's. Only you can't get them. Out of stock till Zarkmas. Sorry.\" He">
		<COND (<IN? ,THUMB ,ENGINEER>
		       <TELL " gives the defunct Thumb back and">)>
		<ENGINEER-LEAVE>
		<TELL ,ROARS-OFF "." CR>)
	       (<EQUAL? ,ENGINEER-COUNTER 1>
		<SETG AWAITING-REPLY 12>
		<ENABLE <QUEUE I-REPLY 2>>
		<TELL
"The " D, ENGINEER " looks around. \"Somebody call the repair service?\"" CR>)
	       (<EQUAL? ,ENGINEER-COUNTER 2>
		<TELL
"The " D ,ENGINEER " looks impatient and guns the throttle of his cycle." CR>)
	       (T
		<ENGINEER-LEAVE>
		<TELL
"\"Probably a kid playing around with someone else's Thumb,\" grumbles the "
D ,ENGINEER " and" ,ROARS-OFF "." CR>)>>

<OBJECT BIKE
	(IN LOCAL-GLOBALS) ;"for purposes of MOBY-FIND"
	(DESC "bike")
	(SYNONYM BIKE CYCLE)
	(ADJECTIVE ION)
	(FLAGS NDESCBIT TRYTAKEBIT)>

<OBJECT GUIDE
	(IN PLAYER)
	(DESC "The Hitchhiker's Guide")
	(DESCFCN GUIDE-DESCFCN)
	(SYNONYM COPY GUIDE)
	(ADJECTIVE HITCHH SUB-E)
	(SIZE 10)
	(FLAGS NARTICLEBIT TAKEBIT READBIT)
	(TEXT "Try: CONSULT GUIDE ABOUT (something).")
	(ACTION GUIDE-F)>

<ROUTINE GUIDE-DESCFCN ("OPTIONAL" X)
	 <TELL "There is a copy of " ,GUIDE-NAME " here." CR>>

<ROUTINE GUIDE-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The Guide is a Mark II model. Its only resemblance to the Mark IV pictured
in the brochure in your game package is the large, friendly \"Don't Panic!\"
on its cover.|
|
The Guide is a Sub-Etha Relay. You can use it to tap information from a huge
and distant data bank by consulting the Guide about some item or subject." CR>)
	       (<AND <VERB? ASK-ABOUT>
		     <PRSO? ,GUIDE>>
		<COND (<FSET? ,TOWEL ,WORNBIT>
		       <TELL ,WITH-TOWEL CR>
		       <RTRUE>)
		      (<PRSI? ,ACCESS-SPACE>
		       <TELL
"Suddenly, agents of the " ,AGENCY " pop in using Sub-Etha belts, rough you up
a bit, tell you there's no such thing as the " ,AGENCY " and never to consult "
D ,GUIDE " about the " ,AGENCY " again; then they leave." CR>
		       <RTRUE>)>
		<TELL
"The Guide checks through its Sub-Etha-Net database and eventually comes
up with the following entry:" CR CR>
		<COND (<PRSI? ,GUIDE>
		       <TELL
D ,GUIDE " is a wholly remarkable product." ,ALREADY-KNOW-THAT CR>)
		      (<PRSI? ,DANGLY-BIT ,SMALL-RECEPTACLE ,LARGE-PLUG
			      ,SMALL-PLUG ,GREEN-BUTTON ,RED-BUTTON>
		       <TELL "Part of">
		       <COND (<AND <PRSI? ,LARGE-PLUG>
				   <NOT <IN? ,LARGE-PLUG ,SPARE-DRIVE>>>
			      <ARTICLE ,SPARE-DRIVE>)
			     (T
			      <ARTICLE <LOC ,PRSI>>)>
		       <TELL "." CR>)
		      (<PRSI? ,WAR-CHAMBER>
		       <TELL
"If you have to consult the Guide about that, you're probably in serious
shape. Consult a medic instead." CR>)
		      (<PRSI? ,DAMOGRAN>
		       <TELL
D ,DAMOGRAN " is a planet whose surface is mostly water. It is a favourite
spot for Presidential dedication ceremonies" ,ALSO-SEE "France." CR>)
		      (<PRSI? ,CLIFF>
		       <TELL
"France is the largest landmass on the planet " D ,DAMOGRAN "." CR>)
		      (<PRSI? ,HEART-OF-GOLD>
		       <TELL
"There is absolutely no such spaceship as " D ,HEART-OF-GOLD " and anything
you've ever read in this spot to the contrary was just a prank.|
   -- " ,AGENCY CR>) 
		      (<PRSI? ,POETRY>
		       <TELL
D ,POETRY " is so awful that even the Sarkopsi of Burphon XII, whose religion
strictly forbids the taking of one's life, consider suicide a preferable
alternative to a " D ,POETRY " reading." CR>)
		      (<PRSI? ,VOGON-CAPTAIN ,FLEET>
		       <TELL
"Vogons, whose specialties are bureaucracy and planet-smashing, are the most
unpleasant race in the Galaxy. They wouldn't think twice about throwing someone
into space, and wouldn't lift a finger to save their own grandmother from the "
D ,BEAST ,ALSO-SEE D ,POETRY " and the " D ,BEAST "." CR>)
		      (<PRSI? ,BEER ,PUB>
		       <TELL
"Alcohol, in addition to its familiar enjoyable effects, also helps cushion
the shock of" ,BEAM "s." CR>)
		      (<PRSI? ,BRIDGE>
		       <TELL
"The best randomness generator is simple" ,BROWNIAN ". Any hot gas or
liquid is a good source." CR>)
		      (<PRSI? ,GALLEY>
		       <TELL
"The " ,SCC " incompetently produces a wide range of inefficient and unreliable
high-tech machinery. However, thanks to SCC's ruthless marketing division, this
junk accounts for over 95% of the high-tech machinery sold in the Galaxy.
(SCC's marketing division will be the first against the wall when the
revolution comes.)" CR>)
		      (<PRSI? ,PANTRY>
		       <TELL
"Thirty million generations of philosophers have debated the definition of
intelligence. The most popular definition appears in the " ,SCC " android
manuals: \"Intelligence is the ability to reconcile totally contradictory
situations without going completely bonkers -- for example, having a stomach
ache and not having a stomach ache at the same time, holding a hole without
the doughnut, having good luck and bad luck simultaneously, or seeing a real
estate agent waive his fee.\"" CR>)
		      (<PRSI? ,SCREENING-DOOR>
		       <TELL
"These " ,SCC " doors screen visitors for such qualities as intelligence
and ability to time travel" ,ALSO-SEE ,SCC ", " ,GPP ", Intelligence,
and Time Travel." CR>)
		      (<PRSI? ,HATCHWAY ,MARVIN ,EDDIE>
		       <TELL
,GPP " are a misguided attempt by the " ,SCC " to make their machines behave
more like people. Among the more miserable failures: paranoid-depressive
robots and over-protective computers." CR>)
		      (<PRSI? ,DARK>
		       <TELL
"A must for the serious hitchhiker, peril-sensitive sunglasses darken at the
first hint of danger, thus shielding the wearer from seeing anything alarming.
Recommended brand: Joo Janta." CR>)   
		      (<PRSI? ,RAMP>
		       <TELL
"According to legend, Magrathea was a planet that amassed incredible wealth by
manufacturing " D ,OTHER-PLANETS ". The legends also mention it as the setting
of the very eagerly awaited second Infocom Hitchhiker's game." CR>)
		      (<PRSI? ,ENGINE-ROOM ,MAIN-DRIVE ,SPARE-DRIVE>
		       <TELL
"Scientists have long known how to produce FINITE amounts of improbability,
using a " ,FIG ", an " D ,PLOTTER " and a good source of" ,BROWNIAN ".
Recently, however, they have learned to generate INFINITE amounts, thanks to
the invention of the In" ,FIG ". It is rumored that an" ,IID ", based on this
new generator, is currently under development" ,ALSO-SEE D ,PLOTTER " and"
,BROWNIAN "." CR>)
		      (<PRSI? ,PLOTTER>
		       <TELL
"The " D ,PLOTTER " is one of the primary application devices of
Improbability Physics." CR>)
		      (<PRSI? ,PEANUTS ,HOLD>
		       <TELL
"Sources of protein, such as the common peanut, are carried by all serious
hitchhikers. Protein loss occurs in" ,BEAM "s and you will become groggy
unless you replace it immediately." CR>)
		      (<PRSI? ,NUTRIMAT ,NUT-COM-INTERFACE>
		       <TELL
"A typically unreliable " ,SCC " product, the " D ,NUTRIMAT " analyses
the user's neural paths to provide the (supposedly) ideal offering. Its
computing power is frankly abysmal, so the optional computer interface
is a good thing to go for.">
		       <CRLF>)
		      (<PRSI? ,POCKET-FLUFF ,JACKET-FLUFF
			      ,SATCHEL-FLUFF ,CUSHION-FLUFF>
		       <TELL
"Fluff is interesting stuff: a deadly poison on Bodega Minor, the diet staple
of Frazelon V, the unit of currency on the moons of the Blurfoid system, and
the major crop of the laundry supplies planet, Blastus III.|
One ancient legend claims that four pieces of fluff lie scattered around the
Galaxy; each forming one-quarter of the seedling of a tree with amazing
properties, the sole survivor of the tropical planet Fuzzbol (Footnote 8).|
The ultimate source of fluff is still a mystery, with the scientific community
torn between the Big Lint Bang theory and the White Lint Hole theory." CR>) 
		      (<OR <PRSI? ,ZAPHOD>
			   <AND <PRSI? ,ME>
				<EQUAL? ,IDENTITY-FLAG ,ZAPHOD>>>
		       <TELL D ,ZAPHOD " is the current" ,PRESIDENT "." CR>) 
		      (<PRSI? ,BABEL-FISH>
		       <TELL
"A mind-bogglingly improbable creature. A " D ,BABEL-FISH ", when placed in
one's ear, allows one to understand any language." CR>)
		      (<PRSI? ,TOWEL>
		       <TELL
"A towel is the most useful thing (besides the Guide) a Galactic hitchhiker
can have. Its uses include travel, combat, communications, protection from the
elements, hand-drying and reassurance. Towels have great symbolic value, with
many associated points of honour. Never mock the towel of another, even if it
has little pink and blue flowers on it. Never do something to somebody else's
towel that you would not want them to do to yours. And, if you borrow the towel
of another, you MUST return it before leaving their world." CR>)
		      (<PRSI? ,THUMB ,GUARANTEE>
		       <TELL
"The Electronic Sub-Etha Auto Hitching Thumb is a wonderful thing, but should
not be mistreated. If used while a ship is near, you will be transported there.
If no ship is in the vicinity, you will place a heavy strain on the Thumb's
logic circuits, which could lead to malfunction. The Thumb carries the usual "
,SCC " lifetime " D ,GUARANTEE "s." CR>)
		      (<PRSI? ,MINERAL-WATER>
		       <TELL
"A strong body of opinion holds that this is not water at all, despite the
claims on the label about how pure the spring is, and all that tosh about
sparkling babbling brooks and so on. There is something highly suspect about
the water on Santraginus Five, as anyone who's ever met any of their fish
will tell you." CR>)
		      (<PRSI? ,BEAST>
		       <TELL
"The " D ,BEAST " is a mind-bogglingly stupid animal. It has almost no capacity
for learning from experience and is therefore surprised by virtually everything
that happens to it. Here is an example of how stupid it is: it thinks that if
you can't see it, it can't see you.|
Its behaviour would be quite endearing if it wasn't spoilt by this one
thing: it is the most violently carnivorous creature in the Galaxy. Avoid,
avoid, avoid." CR>)
		      (<PRSI? ,FRONT-PORCH>
		       <TELL
"A thoroughly unpleasant means of travelling which involves tearing you apart
in one place and slamming you back together in another. (Of course, it's
better than the older method, where disassembled people would be transmitted
down phone lines and arrive in a garbled and sometimes completely disconnected
state.) You should have a drink or two or three before going through one"
,ALSO-SEE "Galaxia Woonbeam, Alcohol, and Protein." CR>)
		      (<PRSI? ,FRONT-OF-HOUSE>
		       <TELL
"Galaxia Woonbeam is the author of \"Slimmer's Guide to Weightloss During
Matter Disassembly Transition.\" This text is currently the subject of the
biggest suit for criminal negligence damages in history and is unavailable
at this time." CR>)
		      (<PRSI? ,ENTRY-BAY>
		       <TELL
"The best drink in existence; somewhat like having your brains smashed out by
a slice of lemon wrapped around a large gold brick." CR>)
		      (<PRSI? ,THIRD-PLANET ,MAZE>
		       <TELL "Mostly harmless." CR>)
		      (<PRSI? ,COUNTRY-LANE>
		       <TELL ,SPACE-TEXT CR>)
		      (<FSET? ,PRSI ,TOOLBIT>
		       <TELL
"The editor responsible for entries under this heading has been out to lunch
for a couple of years but is expected back soon, at which point there will be
rapid updates. Until then, don't panic, unless your situation is really a life
or death one, in which case, sure, go ahead, panic." CR>)
		      (<PRSI? ,BEDROOM ,RIFLES ,BLASTER ,TEA ,NO-TEA ,BEAST-GUN
			      ,SUBSTITUTE ,AFT-CORRIDOR ,AIRLOCK ,INSIDE-WHALE>
		       <TELL
"Sorry, that portion of our Sub-Etha database was accidentally deleted last
night during a wild office party. The lost data will be restored as soon as
we find someone who knows where the back-up tapes are kept, if indeed any
are kept at all." CR>)
		      (T
		       <TELL
"That is one of the Great Unanswered Questions. For a list of the others,
consult the Guide." CR>)>)>>

<GLOBAL SPACE-TEXT
"If you hyperventilate and then empty your lungs, you will last about thirty
seconds in the vacuum of space. However, because space is so vastly hugely
mind-bogglingly big, getting picked up by another ship within those thirty
seconds is almost infinitely improbable.">

<ROUTINE TELL-ME-HOW ()
	 <TELL "You must tell me how to do that to">
	 <ARTICLE ,PRSO>
	 <TELL "." CR>>

<ROUTINE OUT-OF-FIRST (VEHICLE)
	 <TELL "You'll have to get out of the " D .VEHICLE " first." CR>>

<ROUTINE PRIVATE (STRING)
	 <TELL
"You can't. It's not yours. It's " .STRING "'s and it's private." CR>>

<ROUTINE NOT-VERY-GOOD (STRING)
	 <TELL "It's not a very good " .STRING ", is it?" CR>>

<ROUTINE FACTOR (STRING)
	 <TELL
" at an improbability factor of 2 to the " .STRING "th power to 1 against.">>

<ROUTINE REMOVING-BIT ()
	 <TELL "(removing the " D ,DANGLY-BIT " first)" CR>>

<ROUTINE PART-OF ()
	 <TELL "You can't --">
	 <ARTICLE ,PRSO T>
	 <TELL " is an integral part of">
	 <ARTICLE <LOC ,PRSO> T>
	 <TELL "." CR>>

<ROUTINE BUT-THAT-MAN (STRING)
	 <TELL
"Pointing toward Prosser, " .STRING " \"But that man ">
	 <COND (,HOUSE-DEMOLISHED
		<TELL "just knocked">)
	       (T
		<TELL "wants to knock">)>
	 <TELL " my house down!\"">>

<ROUTINE CUSHION ()
	 <TELL
" cushion your system against the coming shock of the" ,BEAM ".">>

<ROUTINE FINE-PRODUCT ()
	 <TELL " It bears a small label which reads \"Another fine product
of the " ,SCC ".\"">>

<ROUTINE MAKE-WAY-FOR ()
	 <TELL
" a " D ,FLEET " unexpectedly arrives and demolishes the Earth to make way
for a new hyperspace bypass." CR>>

<ROUTINE OWN-FEET ()
	 <TELL "You are now on your feet." CR>>

<GLOBAL DOWN-WELL "It goes down well.">

<GLOBAL NOT-PLUGGED "It's not plugged into anything!">

<GLOBAL LYING-ABOUT-EXIT "(We were lying about the exit to port.) ">

<GLOBAL ROARS-OFF " roars off on his ion bike into the Sub-Etha">

<GLOBAL FIDDLES
"He fiddles with the Thumb for a moment or two before handing it back. ">

<GLOBAL LOOK-AROUND "Look around you.">

<GLOBAL TOO-DARK "It's too dark to see!">

<GLOBAL CANT-GO "You can't go that way.">

<GLOBAL YOU-ARE "You already are!">

<GLOBAL ALREADY-OPEN "It is already open.">

<GLOBAL ALREADY-CLOSED "It is already closed.">

<GLOBAL REFERRING "I don't see what you're referring to.">

<GLOBAL WHILE-LYING "You can't do that while you're lying down!">

<GLOBAL WITH-TOWEL "With a towel wrapped around your head!?!">

<GLOBAL ZEN "A brave, Zen-like effort. It fails.">

<GLOBAL BULLDOZER-PILES "The bulldozer piles into the side of your home.">

<GLOBAL IT-LOOKS-LIKE "It looks like">

<GLOBAL CLAWS " its tungsten carbide Vast-Pain claws">

<GLOBAL PRESIDENT " President of the Galaxy">

<GLOBAL SCC "Sirius Cybernetics Corporation">

<GLOBAL BEAM " matter transference beam">

<GLOBAL FLEET-PLUNGES "The battle fleet plunges toward Earth and">

<GLOBAL ABOVE-NOISE "He can't hear you above the noise." >

<GLOBAL BATTLE-SHORTS " black jewelled battle shorts, ">

<GLOBAL CLOUD-OF-STEAM " in a cloud of green, sweet-smelling steam. ">

<GLOBAL GUIDE-NAME "The Hitchhiker's Guide to the Galaxy">

<GLOBAL ALREADY-KNOW-THAT 
" But then again you must already know that, since you bought one.">

<GLOBAL THUMB-CLICKS " Thumb merely makes a few feeble clicking noises.">

<GLOBAL BROWNIAN " Brownian motion">

<GLOBAL ASK-ABOUT-OBJECT "\"Oh...you're trying to figure that out also? The
manual's not much help, is it? By the way, do you know your score? I don't.
My computer doesn't have a status line.\"">

<GLOBAL DRIVEN-BACK "You struggle to reach the Thumb, but the wind is too
fierce and you are driven back.">

<GLOBAL GUARDS-REALIZE "A wisp of an inkling of a thought penetrates the
three-inch thickness of solid bone surrounding the guards' very tiny brains
that something suspicious is going on. ">

<GLOBAL GETTING-CLOSE " You're getting close, though.">

<GLOBAL GPP "Genuine People Personalities">

<GLOBAL ALSO-SEE ". Also see the entries on ">

<GLOBAL JUST-AS 
"Just as the Beast is trying to work out where you've disappeared to, it ">

<GLOBAL BUDGE "It won't budge.">

<GLOBAL BEAST-DESC
"You notice the Beast's Lasero-Zap eyes, its Swivel Shear Teeth, and its
several dozen tungsten carbide Vast-Pain claws, forged in the sun furnaces
of Zangrijad. It has skin like a motorway and breath like a 747.">

<GLOBAL NOT-HOLDING "You're not holding">

<GLOBAL WITH-PASSION
" with passion, and ignores a passing microscopic space fleet.">

<GLOBAL DIALLING-TONE " A moment later, the dialing tone is suddenly cut off.
Glancing through the window you can't help but notice the large old oak tree of
which you are particularly fond crashing down through the phone cable.">

<GLOBAL ANNOUNCEMENT "\"Announcement, announcement. This is ">

<GLOBAL HANDS-OFF "The barman snaps \"Hands off until you pay for it!\"">

<GLOBAL ARRESTED "Do you want to get arrested for indecent exposure?">

<GLOBAL AGENCY "Galactic Security Agency">

<GLOBAL LOST-PLANET " the legendary lost planet of Magrathea">

<GLOBAL DONT-MIX
"Despite your hangover, you recall that Zaphod and water don't mix.">

<GLOBAL CROWD-CHEERS "The crowd cheers wildly! It thinks you're terrific.">

<GLOBAL HUMANS "Humans are so depressingly ">

<GLOBAL EYE-STALK "electronic eye stalk shoots up from the hood, ">

<GLOBAL SLOWLY-DAWNS
" Slowly it dawns on the creature that someone is trying to make a fool
of it. It starts to look for you again.">

<GLOBAL IID " Infinite Improbability Drive">

<GLOBAL FIG "finite Improbability Generator">

<GLOBAL ROBOT-FLIES-IN
"A small upper-half-of-the-room cleaning robot flies into the room, ">

<GLOBAL ON-OTHER-SIDE "standing on the other side">

<GLOBAL MOP " the manual override receptacle">

<GLOBAL NICE-DAY "t's a bright morning, the sun is shining, the birds are
singing, the meadows are blooming">

<GLOBAL GET-RID " you've been trying to get rid of it for years.">

<GLOBAL THUMB-FUMBLE "You fumble with the Thumb as you hold onto the tree
against the fierce wind. It falls to the ground near Arthur's feet.">

<GLOBAL ENGAGED " all circuits are currently engaged by the ">