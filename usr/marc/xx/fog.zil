"FOG for
		      		JOURNEY
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<OBJECT TANGLESCENE
	(TIME 0)
	(ACTION
	 <ACOND ()
		(CAST
		 <COND (<OBJECT? FIRE-SPELL>
			<TELL
"\"Perhaps they do not like fire,\" Praxix said, but fearing an uncontrollable
blaze, he cast only a small amount of magical powders at a nearby tree.
Sure enough, the tree recoiled as if in pain." CR CR>
			<TELL
"\"The problem is,\" Praxix said, \"that I haven't enough magical powders to
burn every tree we need to pass through. And if I use too much at one time, I
may cause a great forest fire, with even less chance of escape than we now
have!\ No,\" he said, \"there must be a better way.\"">)
		       (<OBJECT? LIGHTNING-SPELL>
			<FSET ,LIGHTNING-SPELL ,SEEN>
			<TELL
"Clouds gathered as Praxix cast his lightning spell, and as he pointed
his staff at the tree before us, a bolt of white lightning split it in
two. A few branches caught fire and instinctively withdrew, as if in
pain." CR CR>
			<COND (<NOT <F&SET? ,LIGHTNING-SPELL ,INCAPACITATED>>
			       <TELL
"Praxix, proud of his accomplishment, turned to me and said, \"It's
that tiny bit of earth essence that gives the lightning spell its
extra punch!\" Then, he turned to the others and spoke. ">)>
			<TELL
"\"Effective, but inefficient,\" Praxix declared. \"I don't have nearly
enough fire essence to strike every tree that lies before us!\"">)
		       (<OBJECT? RAIN-SPELL>
			<REMOVE ,HYE-TANGLE>
			<TELL
"Praxix cast his rain spell, and soon a heavy rain fell over the forest.
But rather than helping our condition, rather the trees seemed to strengthen
from the moisture, so much so that we now seemed more endangered than we
had been before.">)
		       (<OBJECT? FAR-VISION-SPELL>
			<TELL
"And then Praxix found the solution. Taking out a large amount of his air and
fire essences, he cast the flare enchantment in our direction of travel.
A ball of white-hot flame flew from his fingertips, and the tentacles withdrew
from the approaching fire, leaving a narrow, but clear, path in its
wake." CR CR>		
			<GRAPHIC G-TANGLEWOOD-BURNS>
			<TELL
"He wiped the thick ">
			<TELL <GET-COLOR ,ESSENCE-FIRE ,ESSENCE-AIR>>
			<TELL
" residue from his fingertips and implored us onward.
\"Come quickly,\" Praxix cried, \"Even hurt, these trees are disquieting,
and I wish to be long gone when they make their recovery.\"" CR CR>
			<SCENE <>>
			<MOVE-TO ,FOG-CAMP
"It was a long march through these tangled trees, and it was necessary
to use Praxix' magic twice again before we reached their farthest limits.
Relieved, we camped that evening under the open sky.">)>)>)>

<ROOM FOG-CAMP
      (TRAVEL-COMMANDS PROCEED-COMMAND NUL-COMMAND NUL-COMMAND)
      (ACTION
       <ACOND ()
	      (SCOUT:REMOVE
	       <TELL ACT
" tried to scout out the area, but the heavy mist made his task all
but impossible." CR CR>
	       <COND (<EQUAL? ,ACTOR ,HURTH>
		      <TELL
"\"I cannot say what lies ahead,\" he announced, \"though I have found
some heavy tracks in the mud which I fear to be orc footprints. We must be
careful, and move quietly!\"">)
		     (T
		      <TELL
"\"It's not good,\" he said, \"There are footprints in the mud just ahead,
and I doubt their owners are friendly.\"">)>)
	      (PROCEED
	       <TELL
"Early the next morning, we started again. The air was heavy with mist,
and it was difficult to see just a few paces before us. We had been moving
silently for an hour when " D ,BERGON " became alarmed." CR CR>
	       <TELL
"Gathering together, we soon learned that Praxix was missing from our
ranks. \"Praxix! Praxix!\" we called, but there was no reply, only the
sounds of the forest." CR CR>
	       <TELL
"\"Praxix! Praxix!\" The words fell only upon the deaf ears of the forest.">
	       <DIVIDER>  
	       <MAKE-SUBGROUP ,PRAXIX>
	       <MOVE-TO ,TREE-FORK>)>)>

<ROUTINE DIVIDER ("OPTIONAL" (NUM 4) "AUX" COL)
	 <TELL CR CR>
	 <SET COL </ <- ,SCREEN-WIDTH ,TEXT-WINDOW-LEFT> .NUM>>
	 <REPEAT ()
		 <COND (<L? <SET NUM <- .NUM 1>> 1> <RETURN>)
		       (T
			<WSPACE .COL>
			<TELL "*">)>>
	 <TELL CR CR>>

<COMMAND ASK-TREE O-ASK-TREE ()
	 <TELL-TALE ,ACTION-OBJECT>
	 <RTRUE>>

<ROUTINE O-ASK-TREE ()
	 <FIND-OBJECTS ,ASK-TREE-OBJECTS>>

<OBJECT ASK-TREE-OBJECTS>

<OBJECT ASK-TREE-LOCATION
	(LOC ASK-TREE-OBJECTS)
	(SDESC "location")
	(KBD %<ASCII !\L>)
	(TEXT
	 <EXECUTE ()
		  <TELL
"\"Where am I?\" Praxix asked, thinking it might help. It didn't." CR CR>
		  <TELL
"\"You're here with me,\" the tree replied." CR CR>
		  <TELL
"\"And where would that be?\" Praxix tried." CR CR>
		  <TELL
"\"In the forest?\" the tree replied uncertainly, trying his best to be
helpful." CR CR>
		  <TELL
"Praxix slumped to the ground, rubbing his head. This was shaping up to
be a miserable day, he thought. Best to leave this leaf-laden philosopher
and try to find the others.">>)> 

<OBJECT ASK-TREE-PATHS
	(LOC ASK-TREE-OBJECTS)
	(SDESC "paths")
	(KBD %<ASCII !\P>)
	(TEXT
	 <EXECUTE ()
		  <FSET ,ASK-TREE-PATHS ,SEEN>
		  <TRAVEL-COMMANDS ,HERE
				   ,MILKY-WAY-COMMAND
				   ,ROAD-TO-RUIN-COMMAND
				   ,GARDEN-PATH-COMMAND>
		  <UPDATE-REMOVE ,ACTION-OBJECT>
		  <TELL
"Hoping at least to get some useful information from this root-bound
nuisance, Praxix asked, \"Do you know where these paths lead?\"" CR CR>
		  <TELL
"\"Why, of course; on the left is the Milky Way, right in front of you is
the road to ruin, and here on the right is the garden path,\" the tree replied
matter-of-factly." CR CR>
		  <TELL
"\"I don't suppose you have a preference,\" Praxix asked with little
hope." CR CR>
		  <TELL
"\"No, I've never felt the need for one,\" the tree responded, \"I'm not
going much of anywhere.\" And with that, he shook a few branches to indicate
the limits of his movement.">>)>

<COMMAND ROAD-TO-RUIN>
<COMMAND MILKY-WAY>
<COMMAND GARDEN-PATH>

<ROOM TREE-FORK
      (TRAVEL-COMMANDS LEFT-COMMAND CENTER-COMMAND RIGHT-COMMAND)
      (GRAPHIC G-TALKING-TREE)
      (ENTER
       <EXECUTE ()
		<COND (<NOT <F&SET? ,HERE ,SEEN>>
		       <TELL
"\"Praxix! Praxix!\" the voice cried out. \"Wake up!\"" CR CR>
		       <TELL
"Praxix rose slowly and took stock of his situation. After separating
from the group, he had wandered aimlessly through the dense fog for the
better part of the morning before stopping to indulge in the tasty, red
berries that blanketed the ground beneath him. And then, he fell into
a deep and restful sleep." CR CR>
		       <TELL
"Now, someone was calling him, but who? He swung around, but found himself
alone. His head ached, and he wished for nothing more than to be left in
peace until the pain subsided." CR CR>
		       <TELL
"\"Praxix! Don't you have anything better to do,\" the voice continued,
\"than to sleep the day away?\"" CR CR>
		       <TELL
"Praxix swung around again and faced a modest-sized oak tree as it was just
finishing the preceding question. \"You know my name?\" he asked, startled
more by the personal reference than the fact that he was being addressed in
whatever fashion by the local flora." CR CR>
		       <TELL
"\"Why, of course!\" the tree replied enthusiastically. \"All trees sing your
praises.\"" CR CR>
		       <TELL
"\"They do?\" Praxix responded coyly, for he was not above flattery." CR CR>
		       <TELL
"\"Oh, my, yes! We know how you helped old Tully when his house caught fire.
And then there was the poor Helspar widow, how you helped her...\"" CR CR>
		       <TELL
"\"Yes, yes, I see,\" Praxix interrupted, not wishing to pursue the matter
further. But he did not see, at least very clearly, and his head throbbed
in much the same way that he expected the Tremor spell would cause if cast
upon his cranium.">
		       <TRAVEL-COMMANDS ,PRAXIX
					,CAST-COMMAND
					,ASK-TREE-COMMAND
					,EXAMINE-COMMAND>)>>)
      (EXIT
       <EXECUTE ()
		<TRAVEL-COMMANDS ,PRAXIX
				 ,CAST-COMMAND
				 ,MIX-COMMAND
				 ,EXAMINE-COMMAND>>)
      (ACTION
       <ACOND ()
	      (<OR <ACTION? LEFT> <ACTION? MILKY-WAY>>
	       <COND (<IN? ,TALKING-TREE ,HERE>
		      <LEAVE-TREE "left">)
		     (T
		      <TELL
"This time he took the leftmost path. ">)>
	       <TELL
"The path snaked and wound its way toward the west, ending at the
side of a river, which Praxix assumed to be the very same that
we had followed from the underground caverns. The remains of an
old building stood here, crumbling; inside, a badly rusted
mechanism sat. Praxix imagined they would be for the grinding
of grain.">
	       <MOVE-TO ,MILL>) 
	      (<OR <ACTION? CENTER> <ACTION? ROAD-TO-RUIN>>
	       <COND (<IN? ,TALKING-TREE ,HERE>
		      <LEAVE-TREE "center">)
		     (T
		      <TELL
"This time he took the center path. ">)>
	       <TELL
"It occurred to him, by the heights of the surrounding trees, that this
was once a more important thoroughfare. This was soon made more obvious
by the crumbling building foundations lying by the wayside. ">
	       <TELL ,MOAT-DESC>
	       <MOVE-TO ,OUTSIDE-MOAT>)
	      (RIGHT:REMOVE
	       <GUARDED-PATH>)
	      (GARDEN-PATH:REMOVE
	       <GUARDED-PATH>)>)>

<CONSTANT MOAT-DESC
"Soon the forest
gave way to a clearing, in the middle of which stood the ruins of a moated
castle. What little remained of the bridge hung tentatively over the
water, making any crossing a speculative affair.">

<OBJECT MILL-MACHINERY
	(SDESC "machinery")
	(KBD %<ASCII !\M>)
	(LOC MILL)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"Badly rusted from many years of disuse, the mill machinery stood as it
had for countless years. Praxix attempted to turn the great water wheel,
but it had rusted to the point of inoperability.">)>)>

<ROUTINE MILL-TO-ASTRIX ()
	 <HINT ,HINT-CASTLE>
	 <TELL
"Knowing the Sunset Mountain to be generally north and east of his
position, Praxix slowly made his way to Astrix' tower." CR CR>
	 <TELL
"The rest of us, having lost hope of reuniting with Praxix, also made
our way back, arriving the next day. But while we were glad to have
seen Praxix alive, we had failed at our quest for the Stones.">
	 <PART-TWO-ENDING>>

<ROOM MILL
      (TRAVEL-COMMANDS PROCEED-COMMAND NUL-COMMAND NUL-COMMAND)
      (GRAPHIC G-MILL)
      (ENTER FSET-SEEN)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <COND (<FSET? ,CASTLE-BRIDGE ,SEEN>
		      <MILL-TO-ASTRIX>)
		     (T
		      <TELL
"Leaving the mill, Praxix re-entered the forest, taking a more easterly
course. ">
		      <TELL ,MOAT-DESC>
		      <MOVE-TO ,OUTSIDE-MOAT>)>)>)>

<ROUTINE LEAVE-TREE (STR)
	 <TELL
"Happily ridding himself of this garrulous tree, Praxix strode off
upon the " .STR " path. What little fog remained had now cleared, and the same
could be said for the cottony feeling in his mouth and head." CR CR>>

<ROUTINE GUARDED-PATH ()
	 <COND (<IN? ,TALKING-TREE ,HERE>
		<GRAPHIC ,G-FOREST>
		<UPDATE-REMOVE ,TALKING-TREE>
		<APPLY <GETP ,HERE ,P?EXIT>>
		<LEAVE-TREE "right">)>
	 <TELL
"Before long, he approached a heavily guarded area, an armed compound of some
kind. It took only a moment to realize that this was orc territory, and that
he was in great danger. Carefully retracing his steps, he found his way
back to the fork; the talking tree was gone.">>

<OBJECT MOAT-BRIDGE
	(SDESC "bridge")
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"Praxix' eye passed along the course of the bridge. Once supported by
huge stone pillars which rose high into the air, the roadway was now
barely suspended above the water, its wooden planking rotted nearly to
non-existence.">)>)>

<OBJECT MOAT-WATER
	(SDESC "water")
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"Looking down at the moat itself was none too pleasant; the water had a
dark greenish cast, and strange red weeds covered much of the surface.
Every so often, large bubbles of air surfaced, from what source Praxix
could only imagine.">)>)>

<ROOM OUTSIDE-MOAT
      (TRAVEL-COMMANDS CROSS-COMMAND NUL-COMMAND NUL-COMMAND)
      (GRAPHIC G-MOAT)
      (ENTER
       <EXECUTE ()
	        <UPDATE-MOVE ,MOAT-BRIDGE ,HERE>
	        <UPDATE-MOVE ,MOAT-WATER ,HERE>>)
      (ACTION
       <ACOND ()
	      (CROSS
	       <TELL
"Praxix decided to explore the castle; gingerly, he made his way
across the bridge, the boards creaking and groaning with each step he
took. Halfway across, the board beneath his feet gave way, and he
was nearly over the side when his arm caught hold of a supporting brace.
Pulling himself to his feet, he realized that getting to the castle and
back again would be chancy at best.">
	       <MOVE-TO ,CASTLE-BRIDGE>)>)>

<ROOM CASTLE-BRIDGE
      (TRAVEL-COMMANDS PROCEED-COMMAND BACK-COMMAND NUL-COMMAND)
      (FLAGS DONT-CAST)
      (ENTER FSET-SEEN)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <TELL
"Resolved to go on, Praxix took greater care in crossing the final
half of the bridge, arriving with no further incident to himself.
The bridge was another matter; having had just about enough from
the long ages, it crumbled and sank into the moat." CR CR>
	       <TELL
"What remained of an ancient castle lay before him and he walked eagerly
into what would have been the courtyard. Of the four towers which had guarded
this fortress, only one stood, and that only barely; the others lay
in piles of broken stone and mortar.">
	       <MOVE-TO ,CASTLE-COURTYARD>)
	      (BACK
	       <TELL
"Not wishing to chance being trapped on the castle grounds, Praxix returned
to the safety of the near shore. ">
	       <COND (<FSET? ,MILL ,SEEN>
		      <MILL-TO-ASTRIX>) 
		     (T
		      <TELL
"Following the only path nearby, he re-entered the forest and was soon
at the edge of the river he presumed to be the same we had followed in
leaving the lower levels of the caverns. At the river's edge stood the
crumbling remains of an old mill building.">
		      <MOVE-TO ,MILL>)>)>)>

<COMMAND TOWER>

<OBJECT CASTLE-COURTYARD-RUINS
	(SDESC "ruins")
	(LOC CASTLE-COURTYARD)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"Praxix made a complete circle gazing at the remains of this castle.
Besides the fragments of three towers and the ghostly spectre of the
fourth, little remained to tell the tale of the castle's past.">)>)>

<ROOM CASTLE-COURTYARD
      (TRAVEL-COMMANDS TOWER-COMMAND MOAT-COMMAND NUL-COMMAND)
      (CAST-LIMIT 3)
      (GRAPHIC G-COURTYARD)
      (ENTER
       <EXECUTE ()
		<FSET ,HERE ,SEEN>
		<COND (<AND <OR <FSET? ,CASTLE-TOWER ,SEEN>
				,PRAXIX-SIGNAL>
			    <OR <FSET? ,CASTLE-TROVE ,SEEN>
				<AND <NOT <IN-PARTY? ,UMBER>>
				     <FSET? ,CASTLE-DUNGEON ,SEEN>>>>
		       <COND (,PRAXIX-SIGNAL
			      <TELL CR CR>
			      <PRAXIX-WAITS-FOR-PARTY>)
			     (T
			      <REMOVE-TRAVEL-COMMAND ,HERE
						     ,TOWER-COMMAND>
			      <COND (<EQUAL? <GET <GETPT ,HERE
							 ,P?TRAVEL-COMMANDS>
						  0>
					     ,NUL-COMMAND>
				     <TELL CR CR
"And so it seemed that Praxix was stranded on this man-made island,
with no means of escape and no help in sight.">)>)>)>>)
      (ACTION
       <ACOND ()
	      (<AND <ACTION? CAST>
		    <OR <OBJECT? FAR-VISION-SPELL>
			<OBJECT? LIGHTNING-SPELL>
			<OBJECT? RAIN-SPELL>>
		    <NOT ,PRAXIX-SIGNAL>>
	       <PRAXIX-SENDS-SIGNAL>)
	      (TOWER
	       <TELL
"Walking into the base of the tower, he saw two staircases, one rising
to the battlements above, the other descending beneath the ground into
darkness.">
	       <MOVE-TO ,CASTLE-BASE>)
	      (MOAT
	       <TELL
"Heading back toward the moat, Praxix surveyed the damage. Hardly a piece
of the collapsed bridge remained above the surface; there would be no
crossing here. And as for the water, it looked no more appetizing than when
he first cast his eyes upon it.">
	       <TRAVEL-COMMANDS ,HERE ,TOWER-COMMAND>
	       <UPDATE-MOVE ,MOAT-WATER ,INSIDE-MOAT>
	       <MOVE-TO ,INSIDE-MOAT>)>)>

<COMMAND MOAT>

<ROOM INSIDE-MOAT
      (TRAVEL-COMMANDS COURTYARD-COMMAND SWIM-COMMAND NUL-COMMAND)
      (CAST-LIMIT 3)
      (ACTION
       <ACOND ()
	      (<AND <ACTION? CAST>
		    <OR <OBJECT? WIND-SPELL>
			<OBJECT? LEVITATE-SPELL>>
		    <NOT <F&SET? ,HERE ,ENCHANTED>>>
	       <TELL
"Praxix considered using his magic to get him across the moat, but
first he did some figuring. And the figuring told him that he was an
odds-on favorite to land inside of the moat rather than beyond it.
Praxix was not by nature a betting man, and it seemed to him that
this would be a poor time to start." CR CR>
	       <TELL
"\"I could use a good length of rope,\" he said to a bird which had
just perched nearby. \"If the others were here, I wouldn't have this
problem, would I?\"">)
	      (<AND <ACTION? CAST>
		    <OR <OBJECT? FAR-VISION-SPELL>
			<OBJECT? LIGHTNING-SPELL>
			<OBJECT? RAIN-SPELL>>
		    <NOT ,PRAXIX-SIGNAL>>
	       <PRAXIX-SENDS-SIGNAL>)
	      (COURTYARD
	       <TELL
"There was little for Praxix to do here than wonder how he had gotten
himself into this predicament, so he returned to the courtyard.">
	       <MOVE-TO ,CASTLE-COURTYARD>)
	      (SWIM:REMOVE
	       <TELL
"It occurred to Praxix to swim across the moat, but he decided to test the
waters first. So, removing his shoe, he dipped an unwilling toe into the
moat. The first sensation he felt was warmth; then, an odd tingling
feeling gripped him. The water's surface rippled disturbingly, and Praxix
swore he felt something pincer-like grab at his toe just as he pulled
it from the water. Needless to say, Praxix gave up any thought of
subjecting other body parts to the moat."> )>)> 

<COMMAND COURTYARD>

<ROOM CASTLE-BASE
      (TRAVEL-COMMANDS UP-COMMAND DOWN-COMMAND COURTYARD-COMMAND)
      (ENTER
       <EXECUTE ()
		<COND (<OR <NOT <FSET? ,CASTLE-TOWER ,SEEN>>
			   <NOT <FSET? ,CASTLE-DUNGEON ,SEEN>>>
		       <REMOVE-PARTY-COMMAND ,COURTYARD-COMMAND>)>>)
      (ACTION
       <ACOND ()
	      (UP
	       <COND (<FSET? ,CASTLE-TOWER ,SEEN>
		      <REMOVE-TRAVEL-COMMAND ,HERE ,UP-COMMAND>)>
	       <TELL "Praxix">
	       <COND (<IN-PARTY? ,UMBER>
		      <TELL ", with Umber in tow,">)>
	       <TELL
" climbed the crumbling stairs and was soon atop the tower.">
	       <MOVE-TO ,CASTLE-TOWER>)
	      (DOWN
	       <CASTLE-DUNGEON-MOVE>)
	      (COURTYARD
	       <TELL
"From there, it was a short walk back to the courtyard.">
	       <MOVE-TO ,CASTLE-COURTYARD>)>)>

<ROUTINE CASTLE-DUNGEON-MOVE ()
	 <TELL
"Climbing down the darkened stairway, Praxix">
	 <COND (<IN-PARTY? ,UMBER> <TELL " and Umber">)>
	 <TELL " soon reached the level
below, a dungeon of crumbling prison cells. The oppressive
moisture and the passage of time had taken a heavy toll on the
wooden prison doors, which stood open in ghostly silence.">
	 <MOVE-TO ,CASTLE-DUNGEON>>

<ROOM CASTLE-TOWER
      (TRAVEL-COMMANDS DOWN-COMMAND NUL-COMMAND NUL-COMMAND)
      (CAST-LIMIT 3)
      (ENTER
       <EXECUTE ()
		<COND (<NOT <F&SET? ,HERE ,SEEN>>
		       <GRAPHIC ,G-UMBER>
		       <TELL 
" Much to his surprise, he was not alone, for a man was already there,
leaning over a battlement and staring toward the distant horizon. As
Praxix approached, the man turned and greeted him with unrestrained
enthusiasm, as though he were a dear friend long absent and presumed
dead." CR CR>
		       <TELL
"\"Ah, Praxix, my friend! We meet again!\" he said." CR CR>
		       <TELL
"Praxix approached this too cheerful young man of whom he had no particular
recollection. \"Does this mean we have met before?\" he asked." CR CR>
		       <TELL
"\"Yes we have, though you were somewhat - what's the word -
confused?\" he replied, and leaned forward towards Praxix' mouth,
sniffing." CR CR>
		       <TELL
"\"Indeed?\" said Praxix, eyebrows raised." CR CR>
		       <TELL
"\"No. I think I meant to say 'incoherent.' ">
		       <COND (,ASK-TREE-PATHS
			      <TELL
"First, you told all sorts of odd stories about yourself, and then you asked
some questions. Told you about these ruins, as a matter of fact.">)
			     (T
			      <TELL
"You told me all sorts of stories about yourself, then ran off.">)>
		       <TELL
" I don't mean to be getting personal, seeing as how we've
just barely met, but I'd be staying away from those berries if I were
you. At least early in the day.\"" CR CR>
		       <TELL
"\"Ah, yes. I do remember,\" Praxix admitted, turning the faintest shade
of red. There was no talking tree, he realized; only a vivid
hallucination brought upon, apparently, by the berries he had indulged
in earlier in the day." CR CR>
		       <TELL
"\"I don't know about you, but I could use a little company. May I join
you?\" the man asked.">
		       <OPTION ,PRAXIX ,ACCEPT-COMMAND ,DECLINE-COMMAND>)>>)
      (ACTION
       <ACOND ("AUX" (CNT 0) CHR)
	      (DOWN
	       <COND (<OR <FSET? ,CASTLE-TROVE ,SEEN>
			  <AND <FSET? ,CASTLE-DUNGEON ,SEEN>
			       <NOT <IN-PARTY? ,UMBER>>>> 
		      <MOVE-TO ,CASTLE-BASE
"Finding nothing more of interest there, Praxix again descended the
stairs, coming to the base of the tower.">)
		     (T
		      <CASTLE-DUNGEON-MOVE>)>)
	      (ACCEPT
	       <TELL
"There seemed to be no harm in this, so Praxix assented." CR CR>
	       <PARTY-CHANGE ,TAG ,UMBER>
	       <FSET ,UMBER ,SUBGROUP>
	       <SETG UPDATE-FLAG T>
	       <TELL
"\"Name's Umber,\" the man said by way of belated introduction, \"and
I'm pleased to meet you.\" He put out his hand, and smiled broadly, reminding
Praxix of the used merchandise sellers whom he despised so deeply." CR CR>
	       <TELL
"\"What have I done?\" Praxix asked the heavens with upraised hands.
\"Trapped up here with... with...\" He paused, choosing his words with care.
\"With my party out there,\" he said, moving his hands across the broad
expanse of forest that lay before him." CR CR>
	       <TELL
"\"Don't they know you're here?\" Umber asked, once again smiling." CR CR>
	       <TELL
"A brilliant thought crossed Praxix' mind, then left as quickly as it had
entered. \"No, we were separated in the fog this morning.\"" CR CR>
	       <TELL
"\"Ah. Did I hear you say 'trapped'?\" Umber asked, smile waning." CR CR>
	       <TELL
"\"Yes, trapped. The bridge collapsed as I crossed it. So unless you're
up for a swim in the moat...,\" was Praxix' reply, and it left Umber at
a loss for words and smiles.">
	       <END-OPTION>)
	      (DECLINE
	       <HINT ,HINT-UMBER>
	       <TELL
"\"I'm sorry, but I think not,\" Praxix replied as graciously as
possible." CR CR>
	       <TELL
"\"Well, then. Perhaps we shall meet again!\" the young man replied,
and walked out of sight." CR CR>
	       <TELL
"\"And perhaps not,\" Praxix said, with a wave of his hand. He heaved
a sigh of relief, and pondered what he should do next.">
	       <END-OPTION>)
	      (<AND <ACTION? CAST>
		    <OR <OBJECT? FAR-VISION-SPELL>
			<OBJECT? LIGHTNING-SPELL>
			<OBJECT? RAIN-SPELL>>
		    <NOT ,PRAXIX-SIGNAL>>
	       <PRAXIX-SENDS-SIGNAL>)>)>

<ROUTINE PRAXIX-SENDS-SIGNAL ("AUX" CHR CNT)
	 <TELL "And there, standing ">
	 <COND (<EQUAL? ,HERE ,CASTLE-COURTYARD>
		<TELL "in the middle of the courtyard">)
	       (<EQUAL? ,HERE ,INSIDE-MOAT>
		<TELL "at the edge of the moat">)
	       (T
		<TELL "on top of that high tower">)>
	 <TELL ", Praxix removed his pouch
of magical essences and cast the \"" AO "\" spell into the air." CR CR>
	 <COND (<OBJECT? FAR-VISION-SPELL>
		<TELL
		 "The ball of flame shot out toward the horizon.">)
	       (<OBJECT? LIGHTNING-SPELL>
		<FSET ,LIGHTNING-SPELL ,SEEN>
		<TELL
"Dark clouds gathered round the castle, and soon bolts of lightning were
hitting the darkened earth.">)
	       (T
		<TELL
"Clouds gathered from nowhere, heavily laden with moisture. And then, the
rain started to fall, a heavy, soaking rain.">)>
	 <TELL " Praxix ">
	 <COND (<EQUAL? ,HERE ,CASTLE-COURTYARD ,INSIDE-MOAT>
		<TELL "watched, impassively">)
	       (T
		<TELL
"leaned over the edge of the turret, and stared off into the forest">)>
	 <TELL ", wondering whether there was anyone there to notice.">
	 <SETG PRAXIX-SIGNAL ,ACTION-OBJECT>
	 <SETG PRAXIX-SIGNAL-ROOM ,HERE>
	 ;"Make subgroup of the rest..."
	 <SETG SUBGROUP-MODE T>
	 <SETG UPDATE-FLAG T>
	 <REPEAT ()
		 <COND (<G? <SET CNT <+ .CNT 1>> ,PARTY-MAX>
			<RETURN>)
		       (<EQUAL? <SET CHR <GET ,PARTY .CNT>> ,PRAXIX>
			<FCLEAR .CHR ,SUBGROUP>)
		       (T
			<FSET .CHR ,SUBGROUP>)>>
	 <MOVE-TO ,GROUP-FOREST>>

<GLOBAL PRAXIX-SIGNAL <>>

<GLOBAL PRAXIX-SIGNAL-ROOM <>>

<COMMAND TO-BRIDGE>

<ROOM CASTLE-TROVE
      (TRAVEL-COMMANDS BACK-COMMAND NUL-COMMAND NUL-COMMAND)
      (GRAPHIC G-TROVE)
      (ENTER FSET-SEEN)
      (CAST-LIMIT 2)
      (ACTION
       <ACOND ()
	      (BACK
	       <TRAVEL-COMMANDS ,CASTLE-BASE ,UP-COMMAND ,COURTYARD-COMMAND>
	       <COND (<NOT <IN? ,SIXTH-STONE ,PRAXIX>>
		      <TELL
"Declining the offer to take some of the stones, ">)>
	       <TELL "Praxix suggested he had
seen enough; the two then ascended the stairs, arriving back at the
base of the turret.">
	       <COND (,PRAXIX-SIGNAL
		      <TELL
" They then took the few short steps back to the courtyard.">
		      <MOVE-TO ,CASTLE-COURTYARD>)
		     (T
		      <MOVE-TO ,CASTLE-BASE>)>)
	      (<AND <ACTION? USE-MIX>
		    <EQUAL? ,MIXTURE ,SPECIAL-VISION-SPELL>
		    <OBJECT? STONE-PILE>>
	       <MOVE ,SIXTH-STONE ,PRAXIX>
	       <UPDATE-REMOVE ,STONE-PILE>
	       <TELL
"Praxix cast his mixture at the pile of stones, and for
an instant, it appeared that nothing would happen. And then, slowly, from
the middle of the pile, a dim glow appeared, strengthening with each
passing moment. He scrambled onto the pile, shovelling stones away with his
bare hands until the source of light was revealed. It was a small black
stone, perfectly round, and glowing with a powerful dark light." CR CR>
	       <GRAPHIC <> ,G-TROVE-STONE ,G-TROVE-STONE-WHERE>
	       <TELL
"\"The Earth Stone,\" he said, under his breath, taking the black stone
and placing it inside his cloak." CR CR>
	       <TELL
"\"Pardon me,\" Umber said, \"but did you just say 'Erstin'? I once knew
a man with that name, but I wouldn't think he'd be an acquaintance of
yours.\"" CR CR>
	       <TELL
"\"Yes, of course,\" Praxix mumbled, without knowing why. But it
seemed to have the desirable effect of ending the conversation, as Umber could
find nothing beyond a befuddled \"Ah\" to reply.">
	       <MIXTURE-CAST>)>)>

<OBJECT SIXTH-STONE
	(SDESC "black stone")
	(KBD %<ASCII !\B>)
	(FLAGS DONT-DROP DONT-EXAMINE)>	

<OBJECT STONE-PILE
	(LOC CASTLE-TROVE)
	(SDESC "stones")
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <TELL
"There were thousands upon thousands of stones in the chest, of all
colors, shapes, and sizes. A profitable business for Umber, to be
sure." CR CR>
		 <TELL
"\"Not too valuable, I would say,\" Umber said, picking up a few more
of the stones. \"But don't let the townsfolk know it!\"">)>)>	 

<OBJECT CASTLE-DUNGEON-CELLS
	(LOC CASTLE-DUNGEON)
	(FLAGS DONT-TAKE)
	(SDESC "cells")
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"Praxix went through each of the cells in the dungeon, finding only rusted
chains and manacles. Perhaps there had been prisoners here in days long past,
but their remains would long since have turned to dust.">)>)>	

<ROOM CASTLE-DUNGEON
      (TRAVEL-COMMANDS UP-COMMAND NUL-COMMAND NUL-COMMAND)
      (GRAPHIC G-DUNGEON)
      (ENTER
       <EXECUTE ()
		<FSET ,HERE ,SEEN>
		<COND (<AND <IN-PARTY? ,UMBER>
			    <NOT <F&SET? ,HERE ,SCOUTED>>>
		       <TELL CR CR
"The dungeons were dark and damp, but Umber was as cheerful as ever.
\"There are many secrets in these dungeons,\" he said. \"If you
give me your word you will tell no one, I will show you my favorite.\"" CR CR>
		       <TELL
"Praxix agreed, and Umber led him to the farthest of the dungeon cells.
Then, he removed one of the blocks in the cell wall, and reached for an
unseen lever that was hidden behind. As he did so, the entire wall slid
aside, revealing a large chamber." CR CR>
		       <TELL
"The chamber was bare, save the rusted manacles hanging from the walls,
but in the center sat a large chest, brimming with precious stones." CR CR>
		       <TELL
"\"I see you have been here before,\" Praxix said, with the slightest
hint of sarcasm." CR CR>
		       <TELL
"\"Many times,\" Umber responded, \"I make my living selling
these stones. I figure it's safer to leave the bulk of them here so
that folks back in town don't get too suspicious. Every week or so, I
come here and pick up a few dozen.\"">
		       <MOVE-TO ,CASTLE-TROVE>)>>)
      (ACTION
       <ACOND ()
	      (UP
	       <TELL
"Disappointed at having found nothing of interest, Praxix climbed the
crumbling stairs and was soon ">
	       <COND (<NOT <FSET? ,CASTLE-TOWER ,SEEN>>
		      <TELL "atop the tower.">
		      <MOVE-TO ,CASTLE-TOWER>)
		     (T
		      <TELL "back at ground level.">
		      <MOVE-TO ,CASTLE-BASE>)>)>)>

<OBJECT TALKING-TREE
	(LOC TREE-FORK)
	(SDESC "talking tree")
	(KBD %<ASCII !\T>)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL ACT
" examined the talking tree skeptically, walking around it as an art expert
would a hideous piece of sculpture, but finally arrived at the
inescapable conclusion that this was indeed a talking tree, about seven
feet in height, neatly trimmed, and covered in wide, oddly-shapen leaves.">)>)>