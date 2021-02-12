"STAIR for
		      		JOURNEY
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<GLOBAL STAIR-TO-PRISON? <>>

<ROOM STAIR-BOTTOM
      (TRAVEL-COMMANDS PROCEED-COMMAND UP-COMMAND NUL-COMMAND)
      (GRAPHIC G-D-STAIR-BOTTOM)
      (ENTER FSET-SEEN)
      (FLAGS UNDERGROUND DONT-SCOUT)
      (ACTION
       <ACOND ()
	      (UP
	       <TELL
"We climbed for hours as we made our way up the gently winding stair, then
paused for refreshment. It seemed the stairs would go on forever">
	       <COND (<IN-PARTY? ,HURTH>
		      <TELL ", but
Hurth reassured us, saying, \"We are now at the half-way point to the
High Gate and the Tower of the Sunset!\"">)
		     (T
		      <TELL ".">)>
	       <TELL CR CR>
	       <COND (<FSET? ,HERE ,TRAPPED>
		      <REMOVE-TRAVEL-COMMAND ,STAIR-JUNCTION ,DOWN-COMMAND>)>
	       <COND (<IN-PARTY? ,HURTH>
		      <TELL
"Hurth was right: a few hours later, we arrived at a junction of two
stairways. \"The stair to the left leads to the Tower of the Sunset;
the stair to the right leads to the High Gate,\" Hurth said. \"If
we intend to reach the Tower, we should start now. It is a much
longer climb.\"">)
		     (T
		      <TELL
"After climbing for a few hours more, we arrived at the junction
of two stairways; neither was marked.">)>
	       <MOVE-TO ,STAIR-JUNCTION>)
	      (PROCEED
	       <COND (<IN-PARTY? ,HURTH>
		      <TELL "With Hurth">)
		     (T
		      <TELL "With " D ,LEADER>)>
	       <COND (<NOT ,STAIR-TO-PRISON?>
		      <SETG STAIR-TO-PRISON? T>)
		     (T
		      <FSET ,HERE ,TRAPPED>
		      <REMOVE-TRAVEL-COMMAND ,HERE ,PROCEED-COMMAND>)>
	       <COND (<NOT <FSET? ,OUTSIDE-PRISON ,SEEN>>
		      <TELL
" in the lead, we continued into the dark caverns. After
an hour's march, we came to a place in which a single word, in runes, was
carved into the stone.">)
		     (T
		      <TELL
" leading the way, we again marched to the spot at which runes were
carved into the stone.">)>
	       <MOVE-TO ,OUTSIDE-PRISON>)>)>

<ROOM STAIR-JUNCTION
      (TRAVEL-COMMANDS LEFT-COMMAND RIGHT-COMMAND DOWN-COMMAND)
      (GRAPHIC G-STAIR-JUNCTION)
      (FLAGS UNDERGROUND DONT-SCOUT)
      (ENTER FSET-SEEN)
      (ACTION
       <ACOND ()
	      (RIGHT
	       <TELL
"After another hour's climb, the stairs ended blindly. ">
	       <COND (<IN-PARTY? ,HURTH>
		      <TELL
"\"We have come to the Bern i-Zar,\" Hurth said, motioning to the
blank wall that stood before us." CR CR>
		      <TELL
"\"It figures,\" I blurted out; Hurth laughed gently, then spoke
the word of command that opened the gate.">)
		     (T
		      <TELL
"Praxix approached the blank wall that lay before us, and sure
enough, a gate appeared, then opened." CR CR>
		      <TELL
"\"I don't believe I ever will get used to these gates,\" I said,
and Praxix smiled.">)>  
	       <MOVE-TO ,BERN-I-DEN>)
	      (LEFT
	       <COND (<FSET? ,STAIR-CHASM ,SEEN>
		      <REMOVE-TRAVEL-COMMAND ,HERE ,LEFT-COMMAND>
		      <TELL
"Again, we made the strenuous and dizzying climb to the crumbling
stairs." CR CR>
		      <TELL
"\"I am not inclined to do this again,\" Bergon said, panting. \"Let
us find some way across the chasm or explore elsewhere.\"">)
		     (T
		      <TELL
"The left stair rose in tighter and tighter spirals, the
air thinning as we went. Not long before we had hoped to
reach the top, the stairs had crumbled and an abyss, perhaps
ten paces wide, yawned before us. Beyond that, the stairs
continued their seemingly endless climb.">)>
	       <MOVE-TO ,STAIR-CHASM>)
	      (DOWN:REMOVE
	       <TELL
"Unsure of whether we had seen all there was to see in the lower parts
of the caverns, we determined to return to the bottom of the stairs and
continue our explorations."> 
	       <MOVE-TO ,STAIR-BOTTOM>)>)>

<ROOM BERN-I-DEN
      (TRAVEL-COMMANDS EXIT-COMMAND DOWN-COMMAND NUL-COMMAND)
      (GRAPHIC G-STAIR-GATE)
      (FLAGS UNDERGROUND DONT-SCOUT)
      (ACTION
       <ACOND ()
	      (EXIT
	       <UPDATE-REMOVE ,TALE-BERN-I-ELAN>
	       <TELL
"We stepped out of the Bern i-Zar, the Mountain Gate, late in the
evening. It was a cold, windy night, filled with countless stars.">
	       <COND (<IN-PARTY? ,HURTH>
		      <TELL CR CR
"Hurth stood at the gate. \"I cannot go on, as much as I might
wish it; this is the command of Agrith. And yet, you are good
friends and shall always be welcome in these halls.\" He
embraced us all in the Dwarf-fashion, turned, and started back
into the gate. \"May the earth give you speed!\" he said as
the great door closed behind him.">)
		     (<IN-PARTY? ,MINAR>
		      <TELL CR CR
"Our camp had been long silent when Minar spoke. \"I grieve for
the Dwarf,\" he said, \"though I knew him not. He was a brave man,
and his reckless murder will not go unavenged.\"" CR CR>
		      <TELL
"\"The success of our journey will be our best revenge,\" replied
Bergon. \"And I hope it will bring Hurth peace.\"">)>
	       <TELL CR CR
"We spoke much of Hurth that evening, as we lay there beneath
the moonlit sky.">
	       <COND (<NOT <IN-PARTY? ,HURTH>>
		      <TELL
" Praxix said, \"The Dwarves believe that after death, their souls
rise up into the heavens as shooting stars.\"" CR CR>
		      <TELL
"It seemed I laid awake for hours that night, eyes fixed on that twinkling
firmament, but I saw no shooting stars and, happily, I drifted off into
sleep.">)
		     (T
		      <PARTY-REMOVE ,HURTH>)>
	       <COND (<NOT <FSET? ,OUTSIDE-PRISON ,SEEN>>
		      <HINT ,HINT-PRISON>)
		     (<NOT <FSET? ,PRISON ,SEEN>>
		      <HINT ,HINT-RUNES>)>
	       <COND (<AND <FSET? ,STAIR-CHASM ,SEEN>
			   <NOT <FSET? ,FAR-CHASM ,SEEN>>>
		      <HINT ,HINT-CHASM>)>
	       <NEXT-DAY>
	       <COND (<AND ,2ND-PASS
			   <FSET? ,HIGH-PLAIN ,SEEN>>
		      <TELL CR CR>
		      <N-DAY-TREK 4>
		      <RTRUE>)>
	       <MOVE-TO ,MOUNTAIN-GATE>)
	      (DOWN:REMOVE
	       <TELL
"Uncertain of whether we had explored enough of these caverns, we decended
to the junction of the two stairs.">
	       <MOVE-TO ,STAIR-JUNCTION>)>)>

<GLOBAL FLOATER <>>

<ROOM STAIR-CHASM
      (TRAVEL-COMMANDS CROSS-COMMAND DOWN-COMMAND NUL-COMMAND)
      (GRAPHIC G-STAIR-CHASM)
      (CAST-LIMIT 3)
      (FLAGS UNDERGROUND ADVISE)
      (ENTER FSET-SEEN)
      (ACTION
       <ACOND ()
	      (<AND <ACTION? CAST>
		    <OBJECT? WIND-SPELL>>
	       <COND (<FSET? ,HERE ,ENCHANTED>
		      <FCLEAR ,HERE ,ENCHANTED>
		      <GRAPHIC <> ,G-CROSS-STAIR-CHASM ,TOP-LEFT>
		      <COND (<EQUAL? ,FLOATER ,ESHER>
			     <TELL
"As Esher turned slowly above us, screaming monosyllables at our
Wizard-friend, Praxix was busily measuring out some air
essence. \"Have no fear! You'll be down in a moment!\" he said.
Then, pausing for a second, he smiled broadly and added some more.
With a sharp flick of the wrist, Praxix cast the potent dust
at our floating comrade, who quite literally flew across the
abyss in a gale-force wind." CR CR>
			     <TELL
"\"What did I say?\" shouted Praxix at the Esher-heap that
scowlingly stumbled to his feet on the other side. Bergon,
unwilling to see this conversation progress, tossed Esher
our">)
			    (T
			     <TELL
"\"Do not be alarmed, Bergon!\" Praxix said, as he measured out some
air essence. \"It will just be a moment.\" And then, casting the
powder at our floating leader, a great wind came up and carried
him across the abyss. We tossed Bergon the">)>
		      <TELL
" rope, and it was not long before we were united on the
far side of the chasm.">
		      <COND (<EQUAL? ,FLOATER ,BERGON>
			     <TELL CR CR
"\"Unconventional,\" Bergon said, as Praxix joined him, \"but quite
effective!\"">)>
		      <MOVE-TO ,FAR-CHASM>)
		     (<NOT <F&SET? ,HERE ,SCOUTED>>
		      <FSET ,HERE ,DEAD>
		      <TELL
"I don't know what Praxix was thinking when he removed some
air essence from his pouch and tossed it at Bergon. A fierce
wind came up and blew Bergon to the edge of the abyss; it
was only quick thinking ">
		      <COND (<IN-PARTY? ,ESHER>
			     <TELL "by Esher">)>
		      <FSET ,HERE ,GRAY-MIX>
		      <TELL " that saved him from plunging
down into that bottomless void. Bergon was quite displeased,
though his temper was restrained. \"Let us be a little more
careful with our magic,\" he said.">)
		     (T
		      <TELL
"Praxix gave Bergon a look saying \"How about trying the
wind spell again?\" Bergon shot back a look saying, in effect, \"I
will murder you if you do.\"">)>)
	      (<AND <FSET? ,HERE ,ENCHANTED>
		    <ESHER-TO-EARTH>>
	       <RTRUE>)
	      (GET-ADVICE:REMOVE
	       <TELL
"Bergon asked for our advice; he himself thought of trying to jump
across, but got a negative reaction. Praxix suggested that he might
have some magic that would help, and this was greeted with some
measure of skepticism. Overall, no consensus was achieved.">)
	      (CROSS:REMOVE
	       <FSET ,HERE ,DEAD>
	       <TELL
"Bergon, being the most athletic of the group, thought he might try
jumping across the gap, then use the rope to bring the rest of
us along." CR CR>
	       <COND (<IN-PARTY? ,ESHER>
		      <TELL
"For once, Esher's pessimism was hard to fault. \"You can't get
a running start; the footing's no good; and the stairs at the
other end appear to turn a corner. Otherwise, you've got a fine
idea.\" Bergon reluctantly agreed.">)
		     (T
		      <TELL
"It didn't take long, however, to convince him that this would be
far too dangerous to attempt.">)>)
	      (SCOUT:REMOVE
	       <TELL ACT
" suggested trying to scout out an alternative way up the stairs,
but this was felt to be fruitless.">)
	      (<AND <ACTION? CAST>
		    <OBJECT? LEVITATE-SPELL>>
	       <FSET ,HERE ,DEAD>
	       <COND (<IN-PARTY? ,ESHER>
		      <SETG FLOATER ,ESHER>)
		     (T
		      <SETG FLOATER ,BERGON>)>
	       <COND (<FSET? ,HERE ,BLUE-MIX>
		      <TELL
"Praxix again levitated " D ,FLOATER " with his elevation spell." CR CR>
		      <TELL
"\"Not again!\" " D ,FLOATER " protested, but there was little he could do
suspended there, ten feet above our heads.">)
		     (T
		      <TELL "Praxix, ">
		      <COND (<FSET? ,HERE ,GRAY-MIX>
			     <TELL "though chastened">)
			    (T
			     <TELL "on his own">)>
		      <TELL
", decided to try a little magic to get us across.
Pulling some earth and air essences from his concealed pouch, Praxix mixed
them, then cast the mixture onto " D ,FLOATER "." CR CR>
		      <TELL
"\"Hey, wait a minute!\" he said as he rose ten feet into the air
before us.">)>
	       <FSET ,HERE ,ENCHANTED>
	       <FSET ,HERE ,BLUE-MIX>)
	      (CAST
	       <PRAXIX-NO-CAST>)
	      (DOWN
	       <COND (<FSET? ,HERE ,DEAD>
		      <TELL
"Having tried our best to cross the chasm, we admitted defeat; slowly,">)
		     (T
		      <TELL
"It seemed pointless to attempt the crossing; slowly,">)>
	       <TELL " we made our way
back down to the junction of the stairs.">
	       <MOVE-TO ,STAIR-JUNCTION>)>)>

<ROOM FAR-CHASM
      (TRAVEL-COMMANDS UP-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND)
      (ENTER FSET-SEEN)
      (ACTION
       <ACOND ()
	      (UP
	       <TELL
"We continued climbing up the narrow stairs, and finally climbed through
the heavy oak door which led into the Sunset Tower." CR CR>
	       <TELL
"The view was magnificent! The sun was just setting, and the western sky
was ablaze with colors reflected by the high wispy clouds at the
horizon. To the east, far-off and shrouded in cloud, stood this mighty
tower's twin: the Sunrise Tower">
	       <COND (,2ND-PASS
		      <TELL ", home of Astrix.">)
		     (T
		      <TELL" where, it was said, we would find
a mighty ally in the Wizard Astrix. To the north, beyond a desert-like
plain, the sky was strangely dark and seemingly choked by a heavy,
black cloud.">)>
	       <COND (<IN-PARTY? ,HURTH>
		      <TELL CR CR
"\"Our fathers would come to this place to meditate at day's end and
pray for the day when we should leave this world,\" Hurth said. \"Only
Agrith comes here now, and less frequently than in the past. The
world is changing; even this strong tower will not survive what is to
come!\"">)>
	       <MOVE-TO ,SUNSET-TOWER>)>)>

<OBJECT SUNRISE-MOUNTAIN
	(LOC SUNSET-TOWER)
	(SDESC "Sunrise Mt.")
	(KBD %<ASCII !\S>)
	(FLAGS DONT-TAKE)
	(EXBITS PRAXIXBIT)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL ACT
" looked more closely at the Sunrise Mountain, and the path we would
eventually take to reach the Tower which stood atop the highest crag.
It seemed that four paths wound their way up from the shore of the
great river, but there was no indication of which would be the best
to take.">)>)> 

<OBJECT SUNRISE-TOWER-OBJECT
	(LOC SUNSET-TOWER)
	(SDESC "Sunrise Tower")
	(12DESC "Sunrise Twr.")
	(KBD %<ASCII !\S>)
	(FLAGS DONT-TAKE)
	(EXBITS <+ ,HURTHBIT ,PRAXIXBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL ACT
" took a long look at the Sunrise Tower, and motioned for us to do
likewise. \"What do you make of that?\" he said, pointing at a dark
shadow which seemed to be circling the hooded tower." CR CR>
		 <COND (<AND <IN-PARTY? ,HURTH>
			     <NOT <EQUAL? ,ACTOR ,HURTH>>>
			<TELL "Hurth, whose vision">)
		       (<IN-PARTY? ,HURTH>
			<TELL "Bergon, whose vision (besides Hurth's)">)
		       (T
			<TELL "Bergon, whose vision">)>
		 <TELL
" was the most acute in our party, peered at
the darkening Tower and said, \"If it weren't so far away, I would
say it was a bird. But at this distance...\" He paused, shaking his
head, then gazed at the shadow yet again. \"It cannot be!\"" CR CR>
		 <TELL
"Praxix did not agree. \"There are many creatures that cannot be,
and yet are. We have seen them ourselves; we have ">
		 <COND (<NOT <IN-PARTY? ,HURTH>>
			<TELL "had ">)>
		 <TELL
"one among us! No, Bergon; doubt not your judgement.\"">)>)>  

<ROOM SUNSET-TOWER
      (TRAVEL-COMMANDS DOWN-COMMAND NUL-COMMAND NUL-COMMAND)
      (GRAPHIC G-SUNSET-TOWER)
      (CAST-LIMIT 2)
      (ENTER
       <EXECUTE ()
		<COND (,2ND-PASS
		       <REMOVE ,SUNRISE-MOUNTAIN>
		       <UPDATE-REMOVE ,SUNRISE-TOWER-OBJECT>)>>)
      (ACTION
       <ACOND ()
	      (SCOUT:REMOVE
	       <TELL ACT
" searched the tower, finding what appeared to be a spyglass of some
kind. It was old and delicately crafted, but many of its lenses were broken,
making it more a thing of beauty than an object to be used." CR CR>
	       <TELL
"\"It is a work of art,\" Praxix said, \"far more valuable than it
would appear. Such handiworks are rare these days; it is a shame that
we cannot put it to good use.\"">
	       <COND (<EQUAL? ,ACTOR ,ESHER>
		      <TELL CR CR
"\"And just how would we put a broken spyglass to use?\" " ACT " asked,
placing it down on a dusty shelf nearby.">)
		     (<EQUAL? ,ACTOR ,MINAR>
		      <TELL CR CR
"\"A shame indeed,\" replied Minar, and placed the spyglass down on a
nearby shelf.">)>
	       <FSET ,SUNSET-TOWER ,SOLVED>
	       <UPDATE-MOVE ,SPYGLASS ,HERE>)
	      (<AND <ACTION? CAST>
		    <OBJECT? FAR-VISION-SPELL>>
	       <UPDATE-FSET ,HERE ,DONT-CAST>
	       <REMOVE ,HYE-TOWER>
	       <TELL
"Praxix thought to signal Astrix using his flare enchantment and
so he sent a ball of flame screaming toward
the Sunrise Mountain. And then it seemed that a second ball of flame
shot out of the Sunrise Tower! When they met, perhaps three-fourths of
the way across, the resulting explosion lit the darkening sky with its
blue-white flame and caused the mountains to shudder." CR CR>
	       <TELL
"\"It seems we are expected,\" Praxix said.">) 
	      (DOWN
	       <NEXT-DAY>
	       <TRAVEL-COMMANDS ,STAIR-JUNCTION
				,RIGHT-COMMAND
				,DOWN-COMMAND>
	       <MOVE-TO ,STAIR-JUNCTION
"It was late, so we decided to spend the night in the tower and in fact
did not arise until the next afternoon, so tired were we from the
arduous climb. It was nearly time for dinner when we started down the stairs.
With the help
of Praxix' magic, we easily crossed the gaping chasm, and before long
arrived back at the stair junction.">)>)>

<OBJECT SPYGLASS
	(SDESC "spyglass")
	(FLAGS DONT-EXAMINE NEVER-DROP)
	(KBD %<ASCII !\S>)
	(ACTION
	 <ACOND ()
		(PICK-UP
		 <TELL
"Although wiser minds than I had concluded that the spyglass was unfit
for use, I was nonetheless taken by its beauty, and quietly placed it in my
pack. I do not think the others noticed, or, if they did, they said
nothing.">
		 <UPDATE-MOVE ,SPYGLASS ,INVENTORY>)>)> 

<ROUTINE ESHER-TO-EARTH ()
	 <FCLEAR ,HERE ,ENCHANTED>
	 <TELL
"Slowly, " D ,FLOATER " descended back to the stairs. \"Don't ever do
that again!\" he shouted. Praxix shrugged, unconcerned in
the least." CR CR>
	 <RFALSE>>




