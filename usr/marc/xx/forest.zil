"FOREST for
		      		JOURNEY
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<GLOBAL BITE-VICTIM <>>
<GLOBAL BITE-VICTIM-OBJECT <>>

;<ROUTINE SCENARIO-A? ()
	 <COND (<AND <NOT <FSET? ,HIGH-PLAIN ,SEEN>>
		     <NOT <FSET? ,DWARF-MEETING ,SEEN>>>
		<RTRUE>)>>

<ROOM BITE-FOREST
      (TRAVEL-COMMANDS COMB-AREA-COMMAND SPLIT-UP-COMMAND NUL-COMMAND)
      (FLAGS ADVISE DONT-SCOUT DANGEROUS)
      (ENTER
       <EXECUTE ()
		<COND (<NOT <F&SET? ,HERE ,SEEN>>
		       <COND (<IN-PARTY? ,MINAR>
			      ;<AND <SCENARIO-A?>
				   <IN-PARTY? ,MINAR>>
			      <SETG BITE-VICTIM ,MINAR>
			      <SETG BITE-VICTIM-OBJECT ,MINAR-OBJECT>)
			     (<IN-PARTY? ,ESHER>
			      <SETG BITE-VICTIM ,ESHER>
			      <SETG BITE-VICTIM-OBJECT ,ESHER-OBJECT>)
			     (T
			      <TELL CR CR
"The warm afternoon air lifted our hearts, and we were soon marching
eastward again through the towering forest. It was nearly sunset when
we came upon the shore of a great river." CR CR>
			      <TELL
"\"We are nearly there,\" Praxix said, gazing ahead at the Sunset
Mountain and the mysterious tower that stood precariously atop it.">
			      <MOVE-TO ,RIVER-2>
			      <RTRUE>)>
		       <TELL CR CR
"And then, without warning, a large snake lunged at ">
		       <TELL D ,BITE-VICTIM ", grabbing him by the
leg. ">
		       <COND (<IN-PARTY? ,BERGON>
			      <TELL "Bergon">)
			     (T
			      <TELL "Esher">)>
		       <TELL
", reacting instinctively, killed the snake with a single blow
of his sword">
		       <COND (<IN-PARTY? ,BERGON>
			      <TELL "; " D ,BITE-VICTIM>)
			     (T
			      <TELL " and">)>
		       <TELL " collapsed against a tree." CR CR>
		       <GRAPHIC ,G-NIGHTFANG>
		       <TELL
"\"The snake,\" he started, grimacing with pain. \"Nightfang....\" His
voice trailed off, and his eyes took on a glazed, vacant look." CR CR>
		       <TELL
"\"But that cannot be! I thought Nightfang were nocturnal, like the
Starstalker!\" I said, hopefully."
			CR CR>
		       <TELL
"\"And you were right,\" replied Praxix. \"They were nocturnal. ">
		       <COND (<IN-PARTY? ,BERGON>
			      <TELL "Bergon, t">)
			     (T
			      <TELL "T">)>
		       <TELL "his man
will die unless we can find some westflake root. There is little time!\"">
		       <UPDATE-MOVE ,BITE-VICTIM-OBJECT ,HERE>
		       <FSET ,BITE-VICTIM ,INCAPACITATED>
		       <MAKE-BUSY ,BITE-VICTIM ,ILL-COMMAND>)
		      (T
		       <COND (<IN? ,WOOD-ELF ,HERE>
			      <CHANGE-PARTY-COMMAND ,TAG-ROUTE-COMMAND
						    ,ELF-HOME-COMMAND>)>
		       <COND (<FSET? ,BITE-VICTIM ,INCAPACITATED>
			      <GRAPHIC ,G-NIGHTFANG>
			      <COND (<AND <NOT ,SUBGROUP-MODE>
					  <NOT <IN-PARTY? ,BITE-VICTIM>>>
				     <PARTY-ADD ,BITE-VICTIM>)>
			      <UPDATE-MOVE ,BITE-VICTIM-OBJECT ,HERE>
			      <MAKE-BUSY ,BITE-VICTIM ,ILL-COMMAND>)>
		       <COND (<NOT <FSET? ,BERGON ,TRAPPED>>
			      <REMOVE-PARTY-COMMAND
			           ,BERGON-ROUTE-COMMAND>)>)>>)
      (EXIT
       <EXECUTE ()
		<COND (<AND <NOT ,SUBGROUP-MODE>
			    ,BITE-VICTIM
			    <FSET? ,BITE-VICTIM ,INCAPACITATED>>
		       <PARTY-REMOVE ,BITE-VICTIM>)>>)
      (ACTION
       <ACOND ()
	      (ELF-HOME
	       <COND (<FSET? ,BERGON ,TRAPPED>
		      <FSET ,BERGON ,DEAD>)>
	       <COND (<FSET? ,WOOD-ELF ,TRAPPED>
		      ;"She's gone by now..."
		      <TELL
"Doing as V'ren had told us, I retraced my steps to the pool. V'ren
was waiting there for us, and led us">)
		     (T
		      <TELL
"V'ren led us to the pool at which we had met, then">)>
	       <TELL " through twisty
forest paths until we reached a small clearing. \"This is the Elf
Home,\" she said, without words. \"Home of our Mothers since the
beginning of all things.\"" CR CR>
	       <MOVE-TO ,ELF-HOME
"I looked up, and was amazed to see the trees filled with what could
best be described as hammocks. \"This is where we live - in the trees,\" V'ren
explained.">)
	      (TAG-ROUTE
	       <COND (<FSET? ,BERGON ,TRAPPED>
		      <FSET ,BERGON ,DEAD>)>
	       <TELL
"I retraced my earlier steps, ">
	       <COND (<NOT <FSET? ,ELFSTREAM-1 ,SEEN>>
		      <TELL
"but this time we decided to follow the stream.">
		      <MOVE-TO ,ELFSTREAM
" After about fifty paces, the stream coursed
over a small waterfall and into a shallow pool.">)
		     (T
		      <MOVE-TO ,ELFSTREAM
"and found myself back at the waterfall
and pool. It was deserted, with no sign of what had been there before.">)>)
	      (BERGON-ROUTE
	       ;"Because he's trapped..."
	       <COND (<IN? ,WOOD-ELF ,HERE>
		      <FSET ,WOOD-ELF ,TRAPPED>
		      <TELL
"We decided to follow Bergon's route in hopes of discovering his
fate. V'ren said she could not come with us, but that we were
welcome at the Elf Home. \"Come to the pool where we met,\" she
said to me, \"and we shall meet again!\" And with that, she sped into the
forest." CR CR>)> 
	       <MOVE-TO ,TANGLEWOOD
"We moved swiftly, even as the forest grew thicker and more
sinister. As the twisted trees closed in around us, we saw Bergon,
his body contorted by the undulating tentacles that
had surrounded him.">)
	      (PRAXIX-ROUTE
	       <COND (<FSET? ,BERGON ,TRAPPED>
		      <FSET ,BERGON ,DEAD>)>
	       <COND (<IN? ,WOOD-ELF ,HERE>
		      <TELL
"As we prepared to leave, V'ren explained that
she must return to the Elf Home, but that we could find her
anytime by returning to the pool at which we had first met.
\"Good luck in your travels,\" she said without speech, and
swiftly disappeared into the forest." CR CR>)>
	       <TELL
"Praxix led the way, and we soon arrived at the glade he had found
nearby.">
	       <COND (<NOT <F&SET? ,FOREST-GLADE ,SEEN>>
		      <TELL
" But, just as he was explaining his decision to go no farther, he stumbled
over a tree stump that had been hidden in the knee-high grass!">)
		     (<NOT <F&SET? ,GLADE-STUMP ,SEEN>>
		      <COND (<FSET? ,FOREST-GLADE ,SEEN>
			     <TELL CR CR
"\"Here's the stump that I walked into before,\" he said, giving
it a">
			     <COND (<FSET? ,GLADE-STUMP ,EXAMINED>
				    <TELL
"nother rap with his staff.">)
				   (T
				    <TELL
" rap with his staff.">)>)>
		      <COND (<IN? ,WESTFLAKE-ROOT ,PRAXIX>
			     <TELL " \"Taught it a lesson!\" he added,
pointing to its broken remains and the passage leading downward.">)
			    (T
			     <TELL " This, oddly, produced a hollow tone.">)>)>
	       <MOVE-TO ,FOREST-GLADE>)
	      (<AND <ACTION? EXAMINE> <OBJECT? BITE-VICTIM-OBJECT>>
	       <UPDATE-FSET ,BITE-VICTIM-OBJECT ,DONT-EXAMINE>
	       <TELL ACT
" examined " D ,BITE-VICTIM ". \"Unless we find the antidote, he will be
dead before the sun sets.\"">
	       <COND (<IN-PARTY? ,BERGON>
		      <TELL " Bergon gazed up at the sky and frowned.">)>
	       <RTRUE>)
	      (<AND <ACTION? GET-ADVICE>
		    <FSET? ,BITE-VICTIM ,INCAPACITATED>>
	       <UPDATE-FCLEAR ,HERE ,ADVISE>
	       <TELL
"Unsure of how to save " D ,BITE-VICTIM ", Bergon asked for our advice. Praxix
felt we had no alternative but to split up in search of the lifesaving
root. I agreed, though I was fearful at the prospect of exploring this
forest on my own.">)  
	      (SPLIT-UP
	       <TELL
"It was agreed that we split up the group in search of the elusive
westflake root, and ">
	       <UPDATE-FCLEAR ,HERE ,ADVISE>
	       <COND (<IN-PARTY? ,BERGON>
		      <TELL "Bergon indicated">)
		     (T
		      <TELL "we decided on">)>
	       <TELL " the paths we should follow." CR CR>
	       <COND (<AND <IN-PARTY? ,BERGON>
			   <NOT <FSET? ,DWARF-MEETING ,SEEN>>>
		      <TELL
"\"I shall remain here to tend to " D ,BITE-VICTIM ". Now go,
and return before sunset! Do not wander far!\" he commanded.">
		      <COND (<AND <IN-PARTY? ,ESHER>
				  <NOT <EQUAL? ,BITE-VICTIM ,ESHER>>>
			     <TELL
" But Esher would not leave, preferring to do what he could to
keep Minar comfortable. And thus it was that Praxix and I went our
separate ways into the forest.">)>)
		     (<IN-PARTY? ,BERGON>
		      <TELL
"\"We will meet back here before sunset! Don't wander too far!\" he
said.">)
		     (T
		      <TELL
"\"We must meet back before sunset. Go quickly!\" Praxix said.">)>
	       <COND (<AND <IN-PARTY? ,BERGON>
			   <FSET? ,DWARF-MEETING ,SEEN>>
		      <DIVIDER>
		      ;<TELL CR CR "Bergon's Story" CR CR>
		      <TELL
"Choosing for himself the most difficult path, Bergon strode off into
the thickening forest to our west.">
		      <FSET ,BERGON-SEARCH ,SEEN>
		      <SCENE ,BERGON-SEARCH>)
		     (T
		      <SCENE ,PRAXIX-SEARCH>)>)
	      (COMB-AREA:REMOVE
	       <TELL
"We spent many frantic minutes searching the area for some westflake
root, but to no avail. " D ,BITE-VICTIM " was now seemingly paralyzed; only the
infrequent blinking of his eyes gave any clue that he remained alive.">)>)>

<OBJECT BERGON-SEARCH
	(GRAPHIC
"Bergon enters the Tanglewood.")
	(ACTION
	 <ACOND ()
		(SCENE-START
		 <MAKE-SUBGROUP ,BERGON>
		 <CHANGE-TRAVEL-COMMAND ,BERGON
					,GET-ADVICE-COMMAND ,EXAMINE-COMMAND>
		 <MOVE-TO ,TANGLEWOOD-1>)>)>

<OBJECT TANGLE-TREES-1
	(SDESC "trees")
	(KBD %<ASCII !\T>)
	(LOC TANGLEWOOD-1)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL ACT
" stopped to admire the surrounding pine and alder. But up ahead, the forest
appeared darker and more forebidding.">)>)>

<ROOM TANGLEWOOD
      (TRAVEL-COMMANDS RETURN-COMMAND NUL-COMMAND NUL-COMMAND)
      (CAST-LIMIT 2)
      (FLAGS DONT-SCOUT)
      (ENTER
       <EXECUTE ()
		<MOVE ,HYE-TANGLE ,HAVE-YOU-EVER>>)
      (ACTION
       <ACOND ()
	      (RETURN
	       <MOVE-TO ,BITE-FOREST>
	       <COND (<FSET? ,BERGON ,TRAPPED>
		      <TELL
"Unable to help Bergon, and with the snake-trees moving ever closer,">)
		     (T
		      <TELL
"Carrying Bergon on our shoulders,">)>
	       <TELL " we retreated to the safety of our camp.">
	       <COND (<FSET? ,BERGON ,DEAD>
		      <HINT ,HINT-TANGLETREES>
		      <TELL CR CR
"We buried Bergon there, after a short ritual performed by Praxix.">)
		     (<NOT <FSET? ,BERGON ,TRAPPED>>
		      <CLEAR-BUSY>
		      <COND (<FSET? ,BITE-VICTIM ,INCAPACITATED>
			     <TELL CR CR
"Bergon regained his strength quickly; he looked at " D ,BITE-VICTIM " and
frowned. \"We must do something quickly, or he will die!\"">)
			    (T
			     <TELL CR CR
"It had been a long and frightening day; the sun had set, and we fell into
a deep and dreamless sleep.">
			     <NEXT-DAY>)>)>)
	      (<AND <ACTION? CAST>
		    <OBJECT? LEVITATE-SPELL>>
	       <TELL
"Praxix tried using his spell of elevation, but the trees' grip was
too strong.">)
	      (<AND <ACTION? CAST>
		    <OBJECT? FIRE-SPELL>>
	       <TELL
"Praxix started to reach for his fire and earth essence, but he stopped
himself. \"Not the best place for a bonfire,\" he said softly.">) 
	      (<AND <ACTION? CAST>
		    <OR <OBJECT? LIGHTNING-SPELL>
			<OBJECT? FAR-VISION-SPELL>>>
	       <COND (<IN? ,WESTFLAKE-ROOT ,PRAXIX>
		      <TELL "For the second time that day, ">)>
	       <TELL
"Praxix put his magic to good use! ">
	       <COND (<OBJECT? LIGHTNING-SPELL>
		      <FSET ,LIGHTNING-SPELL ,SEEN>
		      <TELL 
"He mixed together the essences of fire and water, then added just a pinch
of earth essence. Just moments after casting the mixture, clouds gathered
around him, and the sky turned black. He motioned with his
staff at the deadly tree and a bolt of white lightning struck it, splitting it
down the middle. A few branches caught fire, and instinctively withdrew,
as if in pain.">
		      <COND (<NOT <F&SET? ,LIGHTNING-SPELL ,INCAPACITATED>>
			     <TELL CR CR
"Praxix, proud of his accomplishment, turned to me and whispered that it
was the pinch of earth essence that really gives the lightning spell its
added punch. But however the magic had been prepared, its effect was
profound.">)>) 
		     (T
		      <TELL
"Praxix prepared his flare enchantment, and cast it at the tree before
us. The ball of flame sped through the forest before us, and the tentacles
withdrew, as if in pain, clearing a path in its wake.">)>
	       <TELL
" The tentacles loosened, we retrieved Bergon from their deadly
embrace.">
	       <FCLEAR ,BERGON ,TRAPPED>
	       <COND (<FSET? ,BERGON ,DEAD>
		      <TELL
" But it was too late; Bergon was dead!">)
		     (T
		      <PARTY-ADD ,BERGON>
		      <MAKE-BUSY ,BERGON ,ILL-COMMAND>
		      <TELL CR CR
"\"They don't much care for fire,\" Praxix mused, \"Let's get away before
they recover!\"">)>
	       <RTRUE>)
	      (<AND <ACTION? EXAMINE>
		    <OBJECT? BERGON-OBJECT>>
	       <TELL ACT
" looked Bergon over; he was unconscious. The tentacles were
slowly, inexorably, squeezing the life out of him!">)>)>

<ROOM TANGLEWOOD-1
      (TRAVEL-COMMANDS PROCEED-COMMAND RETURN-COMMAND NUL-COMMAND)
      (FLAGS DANGEROUS DONT-SCOUT DONT-CAST)
      (GRAPHIC G-TANGLEWOOD)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <TELL "As ">
	       <COND (<NOT ,SUBGROUP-MODE> <TELL "w">)
		     (T <TELL "h">)>
	       <TELL
"e continued, the forest grew increasingly dark and foreboding.
The stately stands of pine and alder were gone, replaced by shorter,
more twisted trees that seemed to choke the very life out of the
forest. A rustling noise filled ">
	       <COND (<NOT ,SUBGROUP-MODE> <TELL "our">)
		     (T <TELL "his">)>
	       <TELL " ears, and the trees seemed to
writhe with a hypnotic motion, but the air was still, with no hint of
a breeze.">
	       <MOVE-TO ,TANGLEWOOD-2>)
	      (RETURN
	       <COND (<NOT ,SUBGROUP-MODE>
		      <TANGLE-NO-RETURN>)
		     (T
		      <START-PRAXIX-SEARCH
"With little hope of finding the westflake in this direction">)>)>)>

<ROUTINE TANGLE-NO-RETURN ()
	 <SETG TANGLE-TWO-B T>
	 <REMOVE-PARTY-COMMAND ,RETURN-COMMAND>
	 <TELL
"I suggested turning back, but both Praxix and Bergon disagreed." CR CR>
	 <COND (,A-B-FLAG
		<TELL
"\"Going back into the caverns is not an alternative,\" Bergon said." CR CR>
		<TELL
"Praxix concurred. \"Indeed. We are fortunate enough to have found the one
way out; I do not relish the thought of finding another.\"">)
	       (T
		<TELL
"\"No, this is the path we have chosen,\" he said firmly. \"I feel we
are heading in the direction Astrix would have wished.\"" CR CR>
		<TELL
"\"Yes,\" Praxix said, \"I sense we have made a good choice, whether or
not it was the one Astrix had in mind.\"">)>>

<GLOBAL TANGLE-TWO-B <>>

<ROUTINE MOVE-TO-ELF-HOME ()
	 <TELL
"Then, taking me by the hand, she led us through twisty
forest paths until we reached a small clearing. \"This is the Elf
Home,\" she said, without words. \"Home of our Mothers for all
the long ages.\"" CR CR>
	 <MOVE-TO ,ELF-HOME
"I looked up, and was amazed to see the trees filled with what seemed
to be hammocks. \"This is where we live - in the trees,\" V'ren
explained.">>

<ROUTINE START-PRAXIX-SEARCH (STR)
	 <TELL .STR ", Bergon headed back toward camp.">
	 <SCENE ,PRAXIX-SEARCH>>

<OBJECT TANGLE-TREES-2
	(SDESC "trees")
	(KBD %<ASCII !\T>)
	(LOC TANGLEWOOD-2)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <COND (<NOT ,SUBGROUP-MODE>
			<TELL "W">)
		       (T
			<TELL "H">)> 
		 <TELL
"e looked around, but could find no source of the rustling noises,
except for the trees themselves.">
		 <COND (<IN-PARTY? ,BERGON>
			<TELL CR CR
"\"Argh!\" Bergon cried, seeing a fox twisted until nearly unrecognizable
by the strangling branches.">)>
		 <RTRUE>)>)>

<ROOM TANGLEWOOD-2
      (TRAVEL-COMMANDS PROCEED-COMMAND RETURN-COMMAND NUL-COMMAND)
      (FLAGS DANGEROUS DONT-SCOUT)
      (GRAPHIC G-TANGLEWOOD)
      (ENTER
       <EXECUTE ()
		<COND (<AND ,PART-TWO ,TANGLE-TWO-B>
		       <TRAVEL-COMMANDS ,HERE ,PROCEED-COMMAND>)>>)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <TELL
"The gnarled trees were soon too thick to penetrate, and ">
	       <COND (<IN-PARTY? ,BERGON> <TELL "Bergon">)
		     (T
		      <TELL D <FIRST-IN-PARTY ,ESHER ,MINAR, HURTH ,PRAXIX>>)> 
	       <TELL " finally
unsheathed his sword, hacking at the undulating branches. But the branches
did not break; they sloughed off, falling to the ground in a pool
of steamy green slime. The air was now steamy, and the wavy branches
seemed to taunt at ">
	       <COND (<NOT ,SUBGROUP-MODE> <TELL "us">)
		     (T <TELL "him">)>
	       <TELL ", goading ">
	       <COND (<NOT ,SUBGROUP-MODE> <TELL "us">)
		     (T <TELL "him">)>
	       <TELL " onward into their unrelenting grasp.">
	       <MOVE-TO ,TANGLEWOOD-3>)
	      (RETURN
	       <COND (<NOT ,SUBGROUP-MODE>
		      <REMOVE-TRAVEL-COMMAND ,HERE ,RETURN-COMMAND>
		      <TANGLE-NO-RETURN>)
		     (T
		      <START-PRAXIX-SEARCH
"Discouraged, and making little progress">)>)>)>

<OBJECT TANGLE-TREES-3
	(SDESC "trees")
	(KBD %<ASCII !\T>)
	(LOC TANGLEWOOD-3)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <TELL ACT
" turned, but the choking trees were everywhere. Escape would be difficult,
if not impossible!">)>)>

<ROOM TANGLEWOOD-3
      (TRAVEL-COMMANDS PROCEED-COMMAND RETURN-COMMAND NUL-COMMAND)
      (CAST-LIMIT INF)
      (FLAGS DANGEROUS DONT-SCOUT)
      (GRAPHIC G-TANGLEWOOD)
      (ENTER
       <EXECUTE ()
		<COND (<AND ,PART-TWO ,TANGLE-TWO-B>
		       <TRAVEL-COMMANDS ,HERE ,PROCEED-COMMAND>)>>)
      (ACTION
       <ACOND ()
	      (PROCEED:REMOVE
	       <COND (<NOT ,SUBGROUP-MODE> <TELL "We">)
		     (T
		      <TELL "Bergon">)>
	       <TELL
" tried to move forward, but it was no use. The growth was too thick!">)
	      (RETURN
	       <COND (<NOT ,SUBGROUP-MODE>
		      <TELL
"Sensing our peril, we tried to retreat, but the trees had closed in
behind us. A branch rested on Bergon's">)
		     (T
		      <TELL
"Bergon, sensing his peril, tried to move back, but the trees had closed in
behind him. A branch rested on his">)>
	       <TELL " shoulder, writhing and undulating as it spread itself
around his arms and chest. The trees were closing in, and ">
	       <COND (<NOT ,SUBGROUP-MODE>
		      <TELL "we were trapped!">
		      <REMOVE-TRAVEL-COMMAND ,HERE ,RETURN-COMMAND>)
		     (T
		      <TELL "Bergon was trapped!">
		      <FSET ,BERGON ,TRAPPED>
		      <PARTY-REMOVE ,BERGON>
		      <SCENE ,PRAXIX-SEARCH>)>)>)>

<OBJECT PRAXIX-SEARCH
	(ACTION
	 <ACOND ()
		(SCENE-START
		 <DIVIDER>
		 <COND (<FSET? ,BERGON ,TRAPPED>
			<TELL
"Praxix fared much better; leaving camp, he entered">)
		       (<NOT <IN-PARTY? ,BERGON>>
			<TELL
"Praxix chose to explore">)
		       (T
			<TELL
"Bergon sent Praxix off to explore">)>
		 <TELL " the forest that lay to the east, and
it was not long before he came to the edge of a grassy glade.">
		 <CHANGE-TRAVEL-COMMAND ,BERGON
					,EXAMINE-COMMAND ,GET-ADVICE-COMMAND>
		 <MAKE-SUBGROUP ,PRAXIX>
		 <REMOVE-TRAVEL-COMMAND ,PRAXIX ,TELL-LEGEND-COMMAND>
		 <MOVE-TO ,FOREST-GLADE-EDGE>)>)>

<ROOM FOREST-GLADE-EDGE
      (TRAVEL-COMMANDS PROCEED-COMMAND RETURN-COMMAND NUL-COMMAND)
      (GRAPHIC G-FOREST)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <TELL
"He had entered the glade and was moving swiftly through the knee-high
grasses and wildflowers, when he walked straight into a tree stump that
had been hidden in the undergrowth. Stifling a scream, Praxix rubbed his
injured leg." CR CR>
	       <TELL
"\"What an absurd place to leave a stump,\" he said, petulantly.">
	       <MOVE-TO ,FOREST-GLADE>)
	      (RETURN
	       <TELL
"Praxix, unconvinced that westflake would be found here, returned
to camp.">
	       <SCENE ,TAG-SEARCH>)>)>

<OBJECT GLADE-STUMP
	(SDESC "stump")
	(KBD %<ASCII !\S>)
	(LOC FOREST-GLADE)
	(FLAGS DONT-TAKE)
	(EXBITS PRAXIXBIT)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <TELL
"Praxix inspected this misplaced piece of tree; then, as if to vent his anger,
he rapped it with his staff, producing a hollow tone. \"Now, that is odd!\" he
said, rubbing his still sore foot. Looking more closely now, he was unable to
find any sign of how it might open.">)>)>

<ROOM FOREST-GLADE
      (TRAVEL-COMMANDS PROCEED-COMMAND RETURN-COMMAND NUL-COMMAND)
      (CAST-LIMIT 2)
      (GRAPHIC G-GLADE)
      (ENTER
       <EXECUTE ()
		<PUTP ,HERE ,P?CAST-LIMIT 2>
		<COND (<FSET? ,GLADE-STUMP ,ENCHANTED>
		       <ADD-PARTY-COMMAND ,DOWN-COMMAND>)> 
		<FSET ,FOREST-GLADE ,SEEN>>)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <REMOVE-PARTY-COMMAND ,PROCEED-COMMAND>
	       <COND (,SUBGROUP-MODE
		      <TELL
"Limping slightly, Praxix continued on his way; before long, the terrain
fell into a deep glen. \"Never get back in time!\" he said to
himself, and returned to the glade.">
		      <FSET ,HERE ,DONT-SCOUT>)
		     (<FSET? ,BITE-VICTIM ,INCAPACITATED>
		      <TELL
"We walked to the far end of the glade; the terrain sloped
down sharply. \"No time to go farther!\" Praxix said, and he
was right. It was nearly sunset, and " D ,BITE-VICTIM " was close to death.">)
		     (T
		      <UPDATE-FSET ,HERE ,DONT-SCOUT>
		      <TELL
"The terrain ahead of us appeared unpromising, so we decided
to take a different route.">)>) 
	      (SCOUT:REMOVE
	       <COND (<FSET? ,BITE-VICTIM ,INCAPACITATED>
		      <TELL ACT
" went ahead to the far end of the glade, where the terrain sloped
down sharply. \"No time to go farther!\" he said, and he
was right. It was nearly sunset, and " D ,BITE-VICTIM " was close to death.">)
		     (T
		      <TELL ACT
" checked out the far end of the glade, but returned with the report that the
terrain appeared unpromising.">
		      <REMOVE-TRAVEL-COMMAND ,HERE ,PROCEED-COMMAND>
		      <RTRUE>)>)
	      (RETURN
	       <COND (,SUBGROUP-MODE
		      <TELL
"Finding no sign of westflake, Praxix returned to our camp.">
		      <SCENE ,TAG-SEARCH>)
		     (T
		      <TELL
"We returned to our camp, having found nothing "> 
		      <COND (<FSET? ,BITE-VICTIM ,INCAPACITATED>
			     <TELL
"which could help our ailing friend">)
			    (T
			     <TELL
"useful along the route that Praxix had taken">)>
		      <TELL ".">
		      <REMOVE-TRAVEL-COMMAND ,BITE-FOREST
					     ,PRAXIX-ROUTE-COMMAND>
		      <MOVE-TO ,BITE-FOREST>)>)
	      (DOWN
	       <COND (<NOT ,SUBGROUP-MODE>
		      <MOVE-TO ,UNDERFOREST-2
"We lowered ourselves down into the hole; it was dark and damp,
and had a peculiar odor.">)
		     (T
		      <MOVE-TO ,UNDERFOREST-2
"Praxix tried to lower himself down gracefully, but having nothing with
which to support himself, he fell unceremoniously to the bottom of a dark and
damp hole.">)>) 
	      (<AND <ACTION? CAST>
		    <OR <OBJECT? LIGHTNING-SPELL>
			<OBJECT? FIRE-SPELL>
			<OBJECT? TREMOR-SPELL>>
		    <NOT <F&SET? ,GLADE-STUMP ,ENCHANTED>>>
	       <UPDATE-FSET ,GLADE-STUMP ,DONT-EXAMINE>
	       <ADD-PARTY-COMMAND ,DOWN-COMMAND>
	       <COND (<OBJECT? LIGHTNING-SPELL>
		      <FSET ,LIGHTNING-SPELL ,SEEN>
		      <TELL
"Praxix carefully prepared a mixture of water and fire essences; then, he
added just the slightest pinch of earth essence. He cast the mixture
into the air and lifted his staff; from nowhere, clouds gathered and soon the
sky was twilight-dark. Then, a single bolt of lightning fell from the
sky, splitting the stump in two, and">)
		     (<OBJECT? TREMOR-SPELL>
		      <TELL
"Praxix removed some earth essence from his pouch and cast it at the
stump; the earth trembled briefly and the stump split in two">)
		     (T
		      <TELL
"Praxix removed a small handful of fire essence from his cloak and
spread it over the stump. Within moments, the stump was afire;
it burned itself out a few moments later,">)>
	       <TELL
" revealing a passage below. \"Not bad! Not bad!\" he said, and he peered
into the darkness below.">
	       <COND (<AND <NOT ,SUBGROUP-MODE>
			   <OBJECT? LIGHTNING-SPELL>
			   <NOT <F&SET? ,LIGHTNING-SPELL ,INCAPACITATED>>>
		      <TELL CR CR
"Praxix, proud of his accomplishment, turned to me and whispered that it
was the pinch of earth essence that really gives the lightning spell its
added punch. But however the magic had been prepared, its effect was
profound.">)>
	       <PUTP ,HERE ,P?GRAPHIC ,G-STUMP>
	       <GRAPHIC ,G-STUMP>)>)>

<COMMAND AWAY>

<ROOM UNDERFOREST-2
      (TRAVEL-COMMANDS UP-COMMAND FEEL-AROUND-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND)
      (CAST-LIMIT INF)
      (ENTER
       <EXECUTE () 
		<COND (<FSET? ,PRAXIX ,LIT>
		       <GRAPHIC ,G-WARREN ;,G-FOREST-TUNNEL>
		       <TELL CR CR
"With the aid of Praxix' enchanted staff, ">
		       <COND (,SUBGROUP-MODE <TELL "h">)
			     (T <TELL "w">)>
		       <TELL "e could see that the
passage led both back toward our camp and away.">
		       <ADD-PARTY-COMMAND ,AWAY-COMMAND>
		       <CHANGE-PARTY-COMMAND ,FEEL-AROUND-COMMAND
					     ,BACK-COMMAND>)
		      (T
		       <UPDATE-FSET ,HERE ,DONT-SCOUT>
		       <CAVERN-GRAPHIC>)>
		<COND (<AND <FSET? ,PRAXIX ,LIT>
			    <NOT ,SUBGROUP-MODE>
			    <NOT <FSET? ,BITE-VICTIM ,INCAPACITATED>>>
		       ;<REMOVE-PARTY-COMMAND ,BACK-COMMAND>
		       <CHANGE-PARTY-COMMAND ,AWAY-COMMAND
					     ,PROCEED-COMMAND>)>>)
      (ACTION
       <ACOND ()
	      (AWAY
	       <REMOVE-PARTY-COMMAND ,AWAY-COMMAND>
	       <TELL
"Praxix absentmindedly started to head away from our camp, when he
remembered ">
	       <TELL D ,BITE-VICTIM "'s plight." CR CR>
	       <TELL
"\"There will be time for this later,\" he said, scolding himself, and
quickly retraced his steps to his starting point.">)
	      (UP
	       <COND (,SUBGROUP-MODE
		      <REMOVE-PARTY-COMMAND ,UP-COMMAND>
		      <TELL
"Try as he might, Praxix couldn't climb out of this hole
he had dug for himself.">)
		     (T
		      <MOVE-TO ,FOREST-GLADE
"It wasn't easy, but we managed to lift ourselves out of the
hole and back into the glade.">)>)
	      (PROCEED
	       <COND (<NOT <FSET? ,PRAXIX ,LIT>>
		      <TELL
"We decided to explore this underground tunnel, but without light, the
prospects were dim.">)
		     (T
		      <MOVE-TO ,WARREN
"With Praxix' staff to guide us, we made our way down the tunnel,
entering a small chamber. Moss and lichen lined the tunnel, and the
dampness here soon became oppressive. Before us, the passage
continued into the darkness.">)>)
	      (<AND <ACTION? CAST>
		    <OBJECT? LIGHT-SPELL>
		    <NOT <F&SET? ,PRAXIX ,LIT>>>
	       <UPDATE-FCLEAR ,HERE ,DONT-SCOUT>
	       <COND (<AND <NOT ,SUBGROUP-MODE>
			   <NOT <FSET? ,BITE-VICTIM ,INCAPACITATED>>>
		      <COND (<FSET? ,HERE ,DEAD>
			     <ADD-PARTY-COMMAND ,PROCEED-COMMAND>)
			    (T
			     <CHANGE-PARTY-COMMAND ,FEEL-AROUND-COMMAND
						   ,PROCEED-COMMAND>)>)
		     (T
		      <COND (<FSET? ,HERE ,DEAD>
			     <ADD-PARTY-COMMAND ,BACK-COMMAND>)
			    (T
			     <CHANGE-PARTY-COMMAND ,FEEL-AROUND-COMMAND
						   ,BACK-COMMAND>)>
		      <ADD-PARTY-COMMAND ,AWAY-COMMAND>)>
	       <TELL
"It took some doing, but Praxix managed to fumble through his pouch and
remove some fire and earth essence. He applied it to his staff, causing it
to glow a dull red. ">
	       <COND (,SUBGROUP-MODE <TELL "H">)
		     (T
		       <TELL "W">)>
	       <TELL "e could now see
that he was in a tunnel, with passages leading in two directions, though
only one of these would head in the direction of camp.">
	       <GRAPHIC ,G-WARREN ;,G-FOREST-TUNNEL>)
	      (<AND <ACTION? CAST>
		    <OBJECT? FAR-VISION-SPELL>>
	       <TELL
"Praxix, with his flare spell, lit the walls of the tunnel,
revealing that it was covered with a mossy, plantlike material, and that it
spread out far in both directions.">)
	      (BACK
	       <TELL
"Using his staff for light, ">
	       <COND (,SUBGROUP-MODE
		      <TELL D ,PRAXIX>)
		     (T
		      <TELL "we">)>
	       <TELL 
" continued down the tunnel in the direction of camp.">
	       <COND (<FSET? ,BITE-VICTIM ,INCAPACITATED>
		      <TELL " Casually scanning the walls, ">
		      <COND (,SUBGROUP-MODE
			     <TELL "he">)
			    (T
			     <TELL "we">)>
		      <TELL
" recognized the plant that almost completely surrounded ">
		      <COND (,SUBGROUP-MODE
			     <TELL "him">)
			    (T
			     <TELL "us">)>
		      <TELL ": westflake! ">
		      <COND (<NOT ,SUBGROUP-MODE>
			     <TELL D ,PRAXIX>)
			    (T
			     <TELL "He">)>
		      <TELL
" gathered some of the root for " D ,BITE-VICTIM ", placing it in his
cloak.">)>
	       <COND (<NOT ,SUBGROUP-MODE>
		      <TELL " We">)
		     (T
		      <TELL " He">)>
	       <TELL
" continued down the tunnel, coming eventually to a ladder carved into the
earth and rising into a hollowed-out tree stump!">
	       <COND (,SUBGROUP-MODE
		      <TELL " The sound of a
voice (or was it voices) could be heard just above, and Praxix
eagerly pulled himself up the ladder.">
		      <MOVE ,WESTFLAKE-ROOT ,PRAXIX>
		      <SCENE ,TAG-SEARCH>)
		     (T
		      <TELL
" We raised ourselves out of the stump; we were back at our camp.">
		      <COND (<FSET? ,BITE-VICTIM ,INCAPACITATED>
			     <MOVE-TO ,BITE-FOREST>
			     <TELL CR CR
"Praxix rushed over to " D ,BITE-VICTIM " and bound the westflake root over
his wound. ">
			     <GRAPHIC ,G-PRAXIX-HEALS-BITE>
			     <BITE-VICTIM-BITE-HEALED>)
			    (T
			     <TELL CR CR
"\"As I suspected, this route leads only back to our camp,\" Praxix said.
\"Come, let us see what lies at the other end of the tunnel.\"" CR CR>
			     <TELL
"In a matter of moments, we had climbed back down into the tunnel,
retracing our steps to our point of entry in the glade. ">
			     <MOVE-TO ,WARREN
"With Praxix' staff to guide us, we made our way down the tunnel,
entering a small chamber. Moss and lichen lined the tunnel, and the
dampness here soon became oppressive. Before us, the passage
continued into the darkness.">)>
		      <RTRUE>)>)
	      (FEEL-AROUND
	       <REMOVE-PARTY-COMMAND ,FEEL-AROUND-COMMAND>
	       <FSET ,HERE ,DEAD>
	       <TELL "Though ">
	       <COND (,SUBGROUP-MODE <TELL "h">)
		     (T <TELL "w">)>
	       <TELL "e could not see, it was clear by feeling around that ">
	       <COND (,SUBGROUP-MODE <TELL "he was">)
		     (T <TELL "we were">)>
	       <TELL " in some sort of tunnel. Without any light, movement
would be painfully slow and uncomfortable.">)>)>

<OBJECT WESTFLAKE-ROOT
	(SDESC "westflake")
	(KBD %<ASCII !\W>)>

<OBJECT TAG-SEARCH
	(ACTION
	 <ACOND ()
		(SCENE-START
		 <DIVIDER>
		 <COND (<AND <IN-PARTY? ,BERGON>
			     <NOT <FSET? ,BERGON ,TRAPPED>>>
			<TELL
"\"" TAG ", you search the forest to the north,\" Bergon said, and
that was what I did">)
		       (T
			<TELL
"I headed out into the forest that lay to the north">)>
		 <TELL
", though I was filled with apprehension at the
thought of exploring on my own." CR CR>
		 <TELL
"But the forest was beautiful, and the air cool and fresh. Up ahead,
the sound of flowing water could be heard ever more clearly, and I
followed that sound until I came upon a small stream, which took off at
an angle to my path.">
		 <ADD-TRAVEL-COMMAND ,PRAXIX ,TELL-LEGEND-COMMAND>
		 <MAKE-TAG-SUBGROUP>
		 <MOVE-TO ,ELFWOOD-2>)>)>

<ROUTINE SEARCH-END ("AUX" TMP)
	 <CLEAR-SUBGROUP>
	 <RESTORE-TAG-COMMANDS>
	 <SCENE <>>
	 ;"Go through the possible outcomes..."
	 <TELL CR CR>
	 ;"First, the healing part (if any are successful)"
	 <COND (<IN? ,WOOD-ELF ,HERE>
		;"Tag has brought her back..."
		<TELL
"We arrived a short time later; " D ,BITE-VICTIM " appeared lifeless, though he
was breathing slowly. The Wood Elf strode to his side, placed
her spindled arm on his wound, and entered a trance-like state." CR CR>
		<COND (<IN? ,WESTFLAKE-ROOT ,PRAXIX>
		       ;"His root is not needed now..."
		       <PRAXIX-STUMP-APPEARANCE>)
		      (T
		       ;"He returns anyway..."
		       <TELL
"Praxix returned, empty-handed, and started toward " D ,BITE-VICTIM ". After
just a few steps, he ">)>
		<TELL
"stopped, startled by the sight of my new friend." CR CR>
		<TELL
"\"You have done well, " TAG "! Very well indeed!\" I blushed, for it wasn't
often this Wizard handed out compliments. \"There are but few Wood
Elves left in this world, and lucky is the day we meet one!\"" CR CR>
		<TELL
"We approached " D ,BITE-VICTIM " and watched in silence as the Wood
Elf healed him with her touch. ">
		<GRAPHIC ,G-ELF-HEALS-BITE>
		<BITE-VICTIM-BITE-HEALED>) 
	       (<IN? ,WESTFLAKE-ROOT ,PRAXIX>
		;"Praxix has the root..."
		<PRAXIX-STUMP-APPEARANCE>
		<TELL
"knelt at his side, binding the westflake root onto the wound. ">
		<GRAPHIC ,G-PRAXIX-HEALS-BITE>
		<BITE-VICTIM-BITE-HEALED>)
	       (T
		;"Esher is in BIG trouble..."
		<HINT ,HINT-NIGHTFANG>
		<TELL
"Praxix and I arrived back at the same time, neither having found any
westflake root. " D ,BITE-VICTIM " was motionless, eyes staring without
seeing.">)>
	 ;"Now, where is Bergon?"
	 <SET TMP ,ELF-HOME-COMMAND>
	 <COND (<NOT <IN? ,WOOD-ELF ,HERE>>
		<SET TMP ,TAG-ROUTE-COMMAND>)>
	 <COND (<FSET? ,BERGON ,TRAPPED>
		<TRAVEL-COMMANDS ,HERE
				 ,BERGON-ROUTE-COMMAND
				 ,PRAXIX-ROUTE-COMMAND
				 .TMP>)
	       (T
		<TRAVEL-COMMANDS ,HERE
				 ,PRAXIX-ROUTE-COMMAND
				 .TMP>)>
	 <COND (<FSET? ,BERGON ,TRAPPED>
		;"In bad shape, that's where!"
		<TELL CR CR>
		<COND (<FSET? ,BITE-VICTIM ,BUSY>
		       ;"This is turning into a lousy day!"
		       <TELL
"As if things were not bad enough, Bergon was missing. We waited
until nearly sunset, and still he had not returned.">)
		      (T
		       ;"Could be worse..."
		       <TELL
"Surprisingly, it was Esher who first noticed Bergon's absence. We
decided to wait, but by sunset, there was still no sign of him.">)>
		<TELL CR CR
"\"It is not like Bergon to be late. I fear something has happened
to him,\" Praxix said; he was tired now, and filled with concern.">)
	       (<AND <FSET? ,BITE-VICTIM ,BUSY>
		     <IN-PARTY? ,BERGON>>
		;"Returned, nothing found. Esher's in trouble."
		<TELL CR CR>
		<COND (<FSET? ,BERGON-SEARCH ,SEEN>
		       <TELL
"Bergon arrived a short time later; he, too, had failed to find
the westflake root. ">)>
		<TELL "We stood over our friend, but no words were
spoken; we had failed!">)
	       (<AND <IN-PARTY? ,BERGON> <FSET? ,BERGON-SEARCH ,SEEN>>
		;"All's well that ends well."
		<TELL CR CR
"Bergon, who had missed all of the excitement, returned a short
time later, and, relieved at " D ,BITE-VICTIM "'s condition, told
of his adventures.">)>
	 ;"Tag tells about wood elves, if he hasn't..."
	 <COND (<AND <FSET? ,ELFSTREAM-1 ,SEEN>
		     <NOT <IN? ,WOOD-ELF ,HERE>>>
		;"He's at least seen them..."
		<TELL CR CR "Thinking that it ">
		<COND (<FSET? ,BITE-VICTIM ,INCAPACITATED>
		       <TELL "somehow might help">)
		      (<FSET? ,BERGON ,TRAPPED>
		       <TELL "might be helpful (though it didn't
seem relevant to the problem of finding Bergon)">)
		      (T
		       <TELL "might be important">)>
		<TELL ", I told ">
		<COND (<AND <OR <FSET? ,BERGON ,TRAPPED>
				<NOT <IN-PARTY? ,BERGON>>>
			    <FSET? ,BITE-VICTIM ,INCAPACITATED>>
		       <TELL D ,PRAXIX>)
		      (T
		       <TELL "the others">)>
		<TELL " about my adventure at the edge of the stream.">
		<COND (<FSET? ,WOOD-ELF ,SEEN>
		       <TELL
"Praxix was delighted! \"Wood Elves! Well, then! This is indeed our lucky
day! Take us to them!\"">)>
		<RTRUE>)
	       (<IN? ,WOOD-ELF ,HERE>
		<TELL CR CR
"I thought this might be a good time for introductions, so I presented
the Wood Elf to the others. \"I am happy to introduce...\" I started,
but came up empty, and the Elf placed her hand on my shoulder.
\"V'ren, of the House of G'lor.\" The voice was mine; the words, hers.
\"And, if you wish, I shall take you to the Elf Home.\"">)>
	 <RTRUE>>

<ROUTINE BITE-VICTIM-BITE-HEALED ()
	 <UPDATE-MOVE ,BITE-VICTIM-OBJECT>
	 <FCLEAR ,BITE-VICTIM ,INCAPACITATED>
	 <UPDATE-FCLEAR ,BITE-FOREST ,ADVISE>
	 <MAKE-UNBUSY ,BITE-VICTIM>
	 <FCLEAR ,BITE-VICTIM-OBJECT ,DONT-EXAMINE>
	 <TELL
"It seemed a long while, though it was still light when " D ,BITE-VICTIM
"'s eyes regained their sight and his body stirred. \"What are you all looking
at?\" he said, blankly, and even Praxix' lips turned up into a smile.">
	 <COND (<EQUAL? ,BITE-VICTIM ,ESHER>
		<TELL CR CR
"\"We are looking at one very poor excuse for a physician,\" he said.">)>
	 <RTRUE>>

<ROUTINE PRAXIX-STUMP-APPEARANCE ()
	 <TELL
"Just then, from out of nowhere, it seemed that Praxix rose from the
ground! I was mesmerized by the sight, and stood there, speechless.
\"Don't just stand there!\" he shouted, \"Help an old man up!\"" CR CR>
	 <TELL
"Embarrassed, I helped him out of a hollowed-out stump that had been
inconspicuously sitting nearby. But before I could ask him how he had gotten
there, he rushed toward " D ,BITE-VICTIM ", then ">>

<ROOM ELFWOOD-2
      (TRAVEL-COMMANDS PROCEED-COMMAND FOLLOW-STREAM-COMMAND RETURN-COMMAND)
      (ENTER FSET-SEEN)
      (GRAPHIC G-FOREST)
      (ACTION
       <ACOND ()
	      (PROCEED:REMOVE
	       <FSET ,HERE ,EXAMINED>
	       <TELL
"As I continued along the path, smoke
billowed into the sky and I feared to continue lest the forest be ablaze.">)
	      (FOLLOW-STREAM
	       <COND (<FSET? ,HERE ,EXAMINED>
		      <TELL
"Rather than giving up, I chose to follow the stream in search for
the needed root.">)
		     (T
		      <TELL
"Moving quickly and scanning the ground for any sign of westflake, I
chose to follow the stream.">)>
	       <MOVE-TO ,ELFSTREAM-1
" After about fifty paces, the stream coursed
over a small waterfall and into a shallow pool, where, to my surprise,
a young woman was sitting, with her back toward me. I hid myself behind
a rock, unsure of whether to reveal myself.">)
	      (RETURN
	       <MOVE-TO ,BITE-FOREST
"Unable to find any westflake root, I returned to camp.">
	       <SEARCH-END>)>)>

<OBJECT WOOD-ELF
	(SDESC "woman")
	(KBD %<ASCII !\W>)
	(FLAGS DONT-TAKE)
	(LOC ELFSTREAM-1)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <FSET ,WOOD-ELF ,EXAMINED>
		 <COND (<FSET? ,WOOD-ELF ,SEEN>
			<TELL
"Having recovered from the shock of that first look, I looked at
this creature again and I began to feel her age and wisdom, and even
sense a beauty that lay beneath her tree-like exterior.">)
		       (T
			<TELL
"The woman was slender, with long flowing hair. I could not see
her face, yet some warm inner feeling was touched by her gentle
grace.">)>)>)>

<ROOM ELFSTREAM-1
      (TRAVEL-COMMANDS APPROACH-COMMAND STAY-HIDDEN-COMMAND RETURN-COMMAND)
      ;(GRAPHIC G-WATERFALL)
      (ENTER
       ;FSET-SEEN
       <EXECUTE ()
		<FSET ,HERE ,SEEN>
		<IFFLAG (<==? MVER MAC>
			 <GRAPHIC ,G-WATERFALL-NO-ELF
				  ,G-WATERFALL ,BOTTOM-RIGHT>
			 ;<GRAPHIC-STAMP ,G-WATERFALL ,BOTTOM-RIGHT>)
			(T
			 <GRAPHIC ,G-WATERFALL>)>>)
      (ACTION
       <ACOND ()
	      (APPROACH
	       <COND (<NOT <FSET? ,WOOD-ELF ,SEEN>>
		      <TELL
"I approached cautiously, hoping not to startle her. But as I neared,
she sensed my presence, stood, and turned toward me...." CR CR>
		      <TELL
"I gasped, stumbling backward onto the ground, and twisting my ankle.
She was hideous, her face
leathery and brown, more like a gnarled tree than a person.
She stretched her spindled arms toward me, and opened her eyes for
the first time: clear, large, and fathomless.">
		      <GRAPHIC ,G-ELF>
		      <REMOVE-PARTY-COMMAND ,STAY-HIDDEN-COMMAND>
		      <FSET ,WOOD-ELF ,SEEN>
		      <UPDATE-FCLEAR ,WOOD-ELF ,DONT-EXAMINE>)
		     (T
		      <TELL
"As if under some hypnotic spell, I rose and hobbled toward this creature of
the forest. Standing before her, I stared into the depths of her
eyes and began to cry. She reached out her arm, and as she
touched my shoulder, a powerful warmth surged
through me; and, to my amazement, my ankle was healed." CR CR>
		      <TELL
"I thanked her and she smiled, though she seemed not to understand my
words. My thoughts went to " D ,BITE-VICTIM>
		      <TELL ", and I could see him as I left
him - staring at us through dying eyes. And this creature, this woman, felt
my pain and, without words, asked me to take her to where " D ,BITE-VICTIM>
		      <MOVE-TO ,BITE-FOREST
" lay. We sped back through the forest, racing against the snake's deadly
poison.">
		      <UPDATE-MOVE ,WOOD-ELF ,HERE>
		      <FSET ,WOOD-ELF ,DONT-EXAMINE>
		      <SEARCH-END>)>)    
	      (STAY-HIDDEN
	       <COND (<NOT <F&SET? ,WOOD-ELF ,SCOUTED>>
		      <TELL
"I waited there, mesmerized by the beauty of this forest dweller.
After a few moments, two people came into view from further downstream
but it was late in the afternoon, and
the rays of the setting sun made it impossible to see them clearly.
The woman motioned to the newcomers, who then returned to the forest.">)
		     (T
		      <TELL
"Then the woman rose and followed the stream out of sight into the
forest.">
		      <REMOVE-PARTY-COMMAND ,APPROACH-COMMAND>
		      <CHANGE-PARTY-COMMAND ,STAY-HIDDEN-COMMAND
					    ,FOLLOW-COMMAND>)>)
	      (FOLLOW
	       <MOVE-TO ,BITE-FOREST
"I decided to follow the mysterious woman, but soon lost track of her
as she sped along the course of the stream. It was now late, and
I had no choice but to return to camp.">
	       <SEARCH-END>)   
	      (RETURN
	       <COND (<FSET? ,WOOD-ELF ,SEEN>
		      <MOVE-TO ,BITE-FOREST
"Though my ankle was hurt, I stumbled and crawled my way back to camp.">)
		     (T
		      <MOVE-TO ,BITE-FOREST
"It was getting late, so I returned to camp with the intention of telling
the others about these forest people.">)>
	       <SEARCH-END>)>)>

<ROOM ELFSTREAM
      (TRAVEL-COMMANDS PROCEED-COMMAND RETURN-COMMAND NUL-COMMAND)
      (GRAPHIC G-WATERFALL-NO-ELF)
      (ENTER
       <EXECUTE ()
		<COND (<IN? ,WOOD-ELF ,BITE-FOREST>
		       <TRAVEL-COMMANDS ,HERE ,ELF-HOME-COMMAND>)
		      (<OR <NOT <FSET? ,BITE-VICTIM ,INCAPACITATED>>
			   <FSET? ,BITE-VICTIM ,DEAD>>
		       <TRAVEL-COMMANDS ,HERE ,PROCEED-COMMAND>)>>)
      (ACTION
       <ACOND ()
	      (ELF-HOME
	       <TELL
"We called out for V'ren, who quickly arrived at the side of the pool. ">
	       <MOVE-TO-ELF-HOME>)
	      (PROCEED
	       <TELL
"The pool was refreshingly cool, and we drank from it contentedly.
When it was time to continue, we chose to follow the stream, and
found we were surrounded by grotesque-looking creatures: tall and
thin, with gnarled skin that belonged more on a tree than a
person." CR CR>
	       <TELL
"\"Wood Elves,\" Praxix exclaimed with delight. \"Long have I lived
without hope of meeting them!\"" CR CR>
	       <TELL
"One of the Elves approached and spoke to us without words, but rather
directly into our hearts. Her name, she said, was V'ren. She sensed
our purpose, and welcomed us to the Old Forest. \"If you wish, I
shall take you to the Elf Home,\" she said, and we readily accepted
the offer." CR CR>
	       <MOVE-TO-ELF-HOME>)
	      (RETURN
	       <TELL
		"We returned to our camp at nightfall">
	       <FSET? ,BITE-VICTIM ,INCAPACITATED>
	       <HINT ,HINT-NIGHTFANG>
	       <FCLEAR ,BITE-VICTIM ,INCAPACITATED>
	       <FSET ,BITE-VICTIM ,DEAD>
	       <TELL ", full of despair and hopelessness.
Praxix went over to where " D ,BITE-VICTIM " lay. \"We are too late!\" he said
softly. \"Too late!\"" CR CR>
	       <TELL
"I was barely able to hold back tears as we lifted our fallen friend
and placed him in the cold earth. Praxix incanted an ancient and
sorrowful song as we covered him with dirt and placed a burial cairn
over the spot. Exhausted, we fell into a deep sleep.">    
	       <NEXT-DAY>
	       <MOVE ,BITE-VICTIM-CAIRN ,HERE>
	       <UPDATE-MOVE ,BITE-VICTIM-OBJECT>
	       <MOVE-TO ,BITE-FOREST>)>)> 

<OBJECT BITE-VICTIM-CAIRN
	(SDESC "cairn")
	(KBD %<ASCII !\C>)
	(FLAGS DONT-TAKE)>
			
<OBJECT ELF-HOME-ELVES
	(LOC ELF-HOME)
	(SDESC "Elves")
	(KBD %<ASCII !\E>)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"\"Look,\" " ACT " said, pointing out the Elves that were everywhere -
climbing down trees, grabbing axes and crude buckets; soon, all would be
heading north to fight the advancing blaze.">)>)>

<OBJECT ELF-HOME-FIRE
	(LOC ELF-HOME)
	(FLAGS DONT-TAKE)
	(SDESC "fire")
	(KBD %<ASCII !\F>)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL ACT
" pointed toward the north, where the sky was filled with a dark, billowing
smoke. Every
few moments, a flash of red flame could be seen lapping at the tree tops
in the distance.">)>)>

<ROOM ELF-HOME
      (TRAVEL-COMMANDS FOLLOW-ELVES-COMMAND PROCEED-COMMAND NUL-COMMAND)
      (GRAPHIC G-ELF-HOME)
      (FLAGS ADVISE DANGEROUS)
      (ENTER
       <EXECUTE ()
		<COND (<NOT <FSET? ,FOREST-FIRE ,SEEN>>
		       <TELL CR CR
"We talked among ourselves, marvelling at this ancient place, when
three Elves rushed into the clearing. No sound did they speak, but
their cries filled our ears. \"Fire!\" they said. \"Death and
destruction!\"" CR CR>
		       <TELL
"Across the way, an older Elf clambered down from his tree-hammock.
\"Awake! Awake!\" he cried, and dozens of Elves were soon marching
to the north, where smoke could be seen in the treetops.">
		       <COND (<FSET? ,ELFWOOD-2 ,EXAMINED>
			      <TELL CR CR
"\"This is the fire I saw before,\" I exclaimed, \"when I was searching
for westflake for " D ,BITE-VICTIM "!\"" CR CR>
			      <TELL
"\"The fire moves quickly, then,\" Praxix said. \"We are all in danger
here!\"">)>
		       <RTRUE>)
		      (T
		       <REMOVE-PARTY-COMMAND ,FOLLOW-ELVES-COMMAND>)>>)
      (ACTION
       <ACOND ()
	      (GET-ADVICE:REMOVE
	       <TELL
"We talked among ourselves, but could reach no consensus.">
	       <COND (<IN-PARTY? ,BITE-VICTIM>
		      <TELL " " D ,BITE-VICTIM " felt
strongly that we must help the Elves, if it were at all possible.
Praxix was unsure; he could sense how near we were to the eastern
mountains and Astrix, and was wary of the delay.">)>
	       <RTRUE>)
	      (FOLLOW-ELVES
	       <COND (<IN-PARTY? ,BITE-VICTIM>
		      <TELL D ,BITE-VICTIM 
" reacted quickly. \"We must help these Elves, if it is at all within our
power to do so.\"" CR CR>)>
	       <MOVE-TO ,FOREST-FIRE
"\"The fire from the north threatens us all. Let us go!\" Praxix said,
and we were on our way to the northernmost parts of their forest,
where tall flames lapped at the trees, and dark, acrid smoke filled the
air.">)
	      (PROCEED
	       <COND (<FSET? ,BERGON ,DEAD>
		      <HINT ,HINT-TANGLETREES>
		      <TELL
"We prepared to leave the forest, but were soon accosted by V'ren and two
other Elves. \"I have tragic news for you. One of our scouts has located
your friend; he had been strangled by the Tangle Trees into whose forest he
had wandered. We have buried him here, among our bravest brethren. I am
sorry.\"" CR CR>
		      <TELL
"This was tragic news indeed, and we were greatly saddened by the loss
of our leader. \"I feared this when he did not return last evening,\" Praxix
said, \"He shall be sorely missed.\"" CR CR>)  
		     (T
		      <TELL
"Unsure of how to help, we decided to continue with our quest. ">)>
	       <TELL
"With V'ren guiding us, we soon came to the eastern edge of the forest, at
the shore of a great river. \"Be well,\" V'ren said. \"I must return
to help my people.\" And with that, she turned and ran back into
the forest.">
	       <COND (<NOT <IN? ,ELF-STONE ,INVENTORY>>
		      <HINT ,HINT-ELVES>)>
	       <MOVE-TO ,RIVER-2>)
	      (SCOUT:REMOVE
	       <TELL ACT
" rushed ahead with the Elves, and soon returned. \"It is a great fire,
borne by the north wind,\" he reported. \"It won't be long until we
are in danger here!\"">)>)>

<ROUTINE F&SET? (OBJ BIT)
	 <COND (<FSET? .OBJ .BIT> T)
	       (T
		<FSET .OBJ .BIT>
		<RFALSE>)>>

<OBJECT FOREST-FIRE-FIRE
	(LOC FOREST-FIRE)
	(SDESC "fire")
	(KBD %<ASCII !\F>)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"A wall of flame stood before us, consuming everything in its path. As
if part of a conspiracy, the wind blew harder now, pushing the blaze
toward the Elves' home a few mere miles downwind.">
		 <COND (<EQUAL? ,ACTOR ,PRAXIX>
			<TELL CR CR
"\"These Elves are in great danger,\" Praxix said. \"We must do something
now or leave, lest we be destroyed with them.\"">)
		       (T
			<TELL CR CR
"\"We must retreat from here,\" " ACT " said. \"It is not safe!\"">)>)>)>

<OBJECT FOREST-FIRE-ELVES
	(LOC FOREST-FIRE)
	(SDESC "Elves")
	(KBD %<ASCII !\E>)
	(FLAGS DONT-TAKE)
	(EXBITS <+ ,ESHERBIT ,PRAXIXBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"Hundreds of Elves were here, trying desperately to fight the onrushing
fire with buckets of water. Others were clearing brush and opening a wide
trench, hoping to stop the flames at the trench line." CR CR>
		 <COND (<IN-PARTY? ,ESHER>
			<TELL
"\"They'll never hold back the fire,\" Esher said, and it was hard to
disagree. Praxix stood there in silent thought, eyes fixed on the
approaching flames.">)>
		 <RTRUE>)>)>

<ROOM FOREST-FIRE
      (TRAVEL-COMMANDS RETURN-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS DANGEROUS DONT-SCOUT)
      (CAST-LIMIT 2)
      (GRAPHIC G-FOREST-FIRE)
      (ENTER FSET-SEEN)
      (ACTION
       <ACOND ()
	      (RETURN
	       <MOVE-TO ,ELF-HOME
"We watched in horror as the flames approached, and finally we
retreated back to the Elf Home, where V'ren was waiting for us.
\"You must leave!\" she said. \"I can sense the importance of
your quest; do not risk what you have travelled so very far for
on account of the Elves!\"">)
	      (CAST
	       <COND (<OBJECT? RAIN-SPELL>
		      <GRAPHIC ,G-FIRE-RAINS>
		      <TELL
"Seeing little choice, Praxix removed most of his stock of water essence
and cast it into the sky. The sky was obscured in smoke, yet the
approaching storm could be felt in the air. Lightning danced through
the clouds, and the roar of thunder soon filled the sky. All at once,
the clouds burst, dropping a drenching rain on us. So violent was it,
that many Elves were carried off by the rushing water. It was as though
the rains would never end, and Praxix appeared somewhat embarrassed." CR CR>
		      <TELL
"\"Perhaps I did not need so much,\" he said, \"but these things are
quite unpredictable; one must take into account such variables as the
winds, the temperature, the time of year, the altitude...\"" CR CR>
		      <COND (<IN-PARTY? ,ESHER>
			     <TELL
"\"The expertise of the Wizard who cast it?\" Esher added." CR CR>
			     <TELL
"\"Harumph!\" was Praxix' reply, and as if to second his rejoinder, ">)
			    (T
			     <TELL "But happily ">)>
		      <TELL "the
rains suddenly stopped, and the sky partially cleared. The fire had
been extinguished!" CR CR>
		      <TELL
"There was much cleaning up to do, and we each did what we could to
help. And then, tired and dirty, we returned to the Elf Home where
we bathed, and went off to sleep." CR CR>
		      <NEXT-DAY>
		      <UPDATE-REMOVE ,RAIN-SPELL>
		      ;<REMOVE ,HYE-RIVER>
		      <MOVE-TO ,ELF-HOME-2>)
		     (<OR <OBJECT? LIGHTNING-SPELL>
			  <OBJECT? FIRE-SPELL>>
		      <REMOVE ,HYE-FIRE>
		      <COND (<OBJECT? LIGHTNING-SPELL>
			     <FSET ,LIGHTNING-SPELL ,SEEN>)>
		      <TELL
"Call it absentmindedness or call it, well, worse, but Praxix now
attempted to fight fire with fire as he
cast his \"" AO "\" spell at the onrushing flames. Fortunately, he
was unobserved by the others and his spell did little damage, but I
began to have my doubts as to the stability of our wizardly friend.">)
		     (<OBJECT? TREMOR-SPELL>
		      <TELL
"Praxix took some earth essence and flung it at the earth before him.
The earth shook, and the ground opened up before us. But this small
rift would hold the fire only a short time." CR CR>
		      <TELL ,PRAXIX-HASNT-GOT-ENOUGH>)
		     (<OBJECT? WIND-SPELL>
		      <TELL
"Praxix took some air essence from his pouch and flung it at the
approaching flames. A new, southern wind fought with the cold
north wind, and the Elves were cheered by the slowing progress
of the fire. But Praxix' magical wind departed within the hour,
and the fire continued its relentless approach." CR CR>
		      <TELL ,PRAXIX-HASNT-GOT-ENOUGH>)>)>)>

<CONSTANT PRAXIX-HASNT-GOT-ENOUGH
"Reaching back into his pouch, Praxix said, mournfully, \"I haven't enough
magical essence to last us the afternoon.\"">

<ROOM ELF-HOME-2
      (TRAVEL-COMMANDS NUL-COMMAND NUL-COMMAND NUL-COMMAND)
      (ENTER
       <EXECUTE ()
		<TELL
"When we awoke the next morning, a great feast had been prepared for
us - breads, berries, fruits, and many foods we had never seen
before. After eating heartily, the food was taken away, and we were
led to the Elf leader, who sat upon a tall wooden throne." CR CR>
		<TELL
"\"I am N'dar,\" he began, \"and I thank you on behalf of the Elves.
We have not seen the last of these scourges from the north, and I
am keenly aware that your quest is our quest also.\"" CR CR>
		<MOVE ,ELF-STONE ,INVENTORY>
		<COND (<FSET? ,BERGON ,DEAD>
		       <HINT ,HINT-TANGLETREES>
		       <TELL
"\"This is a day for rejoicing, but I am afraid that I have tragic news for
you. One of our scouts has located your friend; he had been strangled by the
Snaketrees into whose forest he had wandered. We have buried him here,
among our bravest brethren. I am indeed sorry.\"" CR CR>)>
		<TELL
"Then, he stood and took a green amulet from around his neck. \"This
is our most precious possession. It is said that it held great power once;
perhaps, it shall again.\" And, so saying, he called Praxix forward and
placed it around the Wizard's neck." CR CR>
		<TELL
"Thanking N'dar, we prepared to leave. V'ren seemed saddened, but
said nothing as she led us east through the forest and to the edge of a
great river." CR CR>
		<COND (<NOT <IN? ,ELF-STONE ,INVENTORY>>
		       <HINT ,HINT-ELVES>)>
		<MOVE-TO ,RIVER-2
"\"I must leave now,\" she said, and turning her back, she ran into
the forest.">>)>

<COMMAND FOLLOW-ELVES>
<COMMAND STAY>

;"Another maze! Yow! Are we writing a Zork yet?"

;"To be here, Praxix' staff must be lit, at least initially."

<OBJECT WARREN-WALLS
	(LOC WARREN)
	(SDESC "walls")
	(KBD %<ASCII !\W>)
	(FLAGS DONT-TAKE)
	(EXBITS PRAXIXBIT)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"The walls here were slimy to the touch, and covered in green
mosses and lichens.  Life flourished here, though it was not the
sort of life that was happily endured: spiders, slugs,
toads, worms, lizards, and maggots. But not all of us were
disheartened." CR CR>
		 <TELL
"\"If I were a maker of magic potions,\" Praxix said, wistfully, \"I
should have a field day here!\"">
		 <COND (<IN-PARTY? ,ESHER>
			<TELL CR CR
"Esher shook his head in disbelief. \"Yes,\" he said with indelicate
sarcasm, \"A lovely spot for a party. Now, why don't you make yourself
useful and get us out of here? Damned Wizard...\" His voice trailed off to
a whining whisper.">)>
		 <RTRUE>)>)> 

<ROOM WARREN
      (TRAVEL-COMMANDS PROCEED-COMMAND BACK-COMMAND UP-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND DANGEROUS ADVISE)
      (CAST-LIMIT INF)
      (GRAPHIC G-WARREN)
      (TEMP 0)
      (ACTION
       <ACOND ("AUX" TMP)
	      (DROP
	       <TELL
"I thought to drop something as an aid in mapping this labyrinth,
but realized we had too few items to spare in case we got lost.">)
	      (CAST
	       <COND (<OBJECT? LIGHT-SPELL>
		      <COND (<OR <ZERO? <MOD .TMP 4>>
				 <ZERO? <MOD .TMP 3>>>
			     <TELL
"Preferring to see where we were going, Praxix pulled more fire
and earth essences
from his pouch and applied them to his staff, causing it to glow more
brightly. \"If we don't leave this water-logged prison soon, I shan't
be able to do this often!\" he said.">)
			    (<ZERO? <MOD .TMP 5>>
			     <TELL
"Praxix fumbled for some fire and earth essence, which he applied to the
end of
his staff. Soon it was glowing again with a pale red glow.">)
			    (<G? ,WARREN-COUNT 12>
			     <TELL
"\"This,\" Praxix said petulantly, \"is ridiculous. I refuse to
use more precious essences on this festering sore of a tunnel!\" He
put his pouch away, and stood there, fuming.">
			     <RTRUE>)
			    (T
			     <TELL
"Fearing that his staff's light was fading in the dampness, Praxix
applied some additional fire and earth essence, making it brighten
somewhat.">)>
		      <CLEAR-TEMP>)
		     (<OBJECT? FAR-VISION-SPELL>
		      <CAST-FAR-VISION <>>
		      <TELL " But little was illuminated. ">
		      <COND (<OR <NOT <FSET? ,HERE ,EXAMINED>>
				 <NOT <IN-PARTY? ,ESHER>>>
			     <TELL "\"I fear
we shall have little help in getting ourselves out of this maze!\"
he said.">)
			    (T
			     <TELL "\"I think that should put
your fears to rest, Esher,\" he said." CR CR>
			     <TELL
"\"Not really. It gives rise to new ones,\" he replied, leading me to
wonder whether Esher in fact had a sense of humor after all.">
			     <TRAVEL-COMMANDS ,HERE
					      ,UP-COMMAND>)>)
		     (<OBJECT? TREMOR-SPELL>
		      <TELL
"Thinking perhaps that a good jolt would lead us back into the
forest, Praxix cast his tremor spell. The results were not spectacular;
I was covered in a mossy slime, and Bergon's head received a pile
of hard-packed mud. \"Oh, dear!\" was all that Praxix could think
to say.">)>)
	      (GET-ADVICE:REMOVE
	       <TELL ACT
" looked to each of us, but none had any good ideas on how to escape
this soggy underground nest of twisting passages." CR CR>
	       <TELL
"\"Then we had best continue,\" Bergon said, \"There must be an exit
somewhere!\" We were beginning to have our doubts.">)
	      (<OR <ACTION? PROCEED> <ACTION? BACK>
		   <ACTION? LEFT> <ACTION? RIGHT>>
	       <SET-TEMP <SET TMP <+ <GET-TEMP> 1>>>
	       <COND (<AND <EQUAL? .TMP 1> <ACTION? BACK>>
		      <TELL
"Hoping to avoid getting lost in what appeared to be an underground
labyrinth, we turned back and were surprised to find two
passages behind us, one leading left and the other right." CR CR>
		      <COND (<NOT <F&SET? ,HERE ,DEAD>>
			     <TELL ,OH-DEAR-MAZE>)
			    (T
			     <TELL ,OH-DEAR-MAZE-2>)>
		      <TRAVEL-COMMANDS ,HERE
				       ,LEFT-COMMAND
				       ,RIGHT-COMMAND
				       ,UP-COMMAND>)
		     (T
		      <COBBLE-WARREN-DESC>
		      <COND (<EQUAL? .TMP 1>
			     <COND (<NOT <F&SET? ,HERE ,DEAD>>
				    <TELL CR CR ,OH-DEAR-MAZE>)
				   (T
				    <TELL CR CR ,OH-DEAR-MAZE-2>)>)
			    (<ZERO? <MOD .TMP 3>>
			     <COND (<L? ,WARREN-COUNT 5>
				    <TELL CR CR
"\"Blast the dampness,\" growled Praxix, as his staff started
growing dim. \"Never in my long years have I seen this!
Soon we shall be growing moss!\"">)
				   (T
				    <TELL CR CR
"\"Not again!\" Praxix said, wearily, as his staff again started
to grow dim from the extreme humidity. \"Toads will be leaping
from our clothes if we don't find our way out soon.\"">)>)
			    (<ZERO? <MOD .TMP 4>>
			     <TELL CR CR
"Praxix' staff glowed with an ever fainter light; soon, it would
be impossible to see the way before us.">)
			    (<ZERO? <MOD .TMP 5>>
			     <FCLEAR ,PRAXIX ,LIT>
			     <TELL CR CR
"Just then, Praxix' staff went out, and the tunnel went dark.
Dark, that is, except for the pale light of day faintly peeking
its way through the cracks in a hole just above us." CR CR>
			     <TELL
"\"Well, I'll be!\" said Praxix, with a smile. \"It seems that
sometimes, darkness is the best light to see by!\"">
			     <TRAVEL-COMMANDS ,HERE ,UP-COMMAND>
			     <GRAPHIC ,G-WARREN-LIGHT>
			     <RTRUE>)>
		      <TRAVEL-COMMANDS ,HERE
				       ,LEFT-COMMAND
				       ,RIGHT-COMMAND
				       ,BACK-COMMAND
				       ,UP-COMMAND>)>)
	      (SCOUT:REMOVE
	       <TELL
"We thought to send " ACT " ahead, but were fearful of getting lost,
so we decided to stay together until we could find a way out.">)
	      (UP
	       <COND (<AND <NOT <FSET? ,PRAXIX ,LIT>>
			   <ZERO? <MOD .TMP 5>>>
		      <COND (<IN? ,WOOD-ELF ,BITE-FOREST>
			     <TRAVEL-COMMANDS ,ELFSTREAM-1
					      ,ELF-HOME-COMMAND>)
			    (T
			     <TRAVEL-COMMANDS ,ELFSTREAM-1
					      ,PROCEED-COMMAND>)>
		      <TELL
"With an exit in sight, we happily climbed out of the warren ">
		      <COND (<FSET? ,ELFSTREAM-1 ,SEEN>
			     <TELL
"and found ourselves alongside the pool and waterfall where I had first seen
the Wood Elf.">)
			    (T
			     <TELL
" at a place where a gently flowing stream cascades over a small waterfall
and into a shallow pool.">)>
		      <MOVE-TO ,ELFSTREAM>)
		     (T
		      <REMOVE-PARTY-COMMAND ,UP-COMMAND>
		      <TELL
"Hoping to find some way out, we tried feeling our way around the top of
the tunnel, but the thick growth above us made this all but impossible.
There might be a way out up there, but it was unlikely we were going
to find it.">)>)>)>
		         

<CONSTANT OH-DEAR-MAZE
"\"Oh, dear,\" said Praxix. \"I hope this isn't one of those underground
mazes.\"">

<CONSTANT OH-DEAR-MAZE-2
"\"Oh, dear,\" said Praxix. \"This is becoming rather tiresome.\"">

<CONSTANT WARREN-TBL-1
	  <LTABLE 0
		  "Selecting"
		  "Opting for"
		  "Choosing this time">> 

<CONSTANT WARREN-TBL-2
	  <LTABLE 0
		  "the results were discouragingly the same."
		  "this brought us to another similar spot."
		  "it was no good; it seemed that we were lost in
an endless maze of mossy sameness.">>

<ROUTINE TELL-WARREN-DIR ()
	 <COND (<ACTION? LEFT> <TELL "left path">)
	       (<ACTION? RIGHT> <TELL "path to the right">)
	       (<ACTION? PROCEED> <TELL "path before us">)
	       (T <TELL "path behind us">)>>

<GLOBAL WARREN-COUNT 0>

<ROUTINE COBBLE-WARREN-DESC ("AUX" (TMP <GET-TEMP>))
	 <SETG WARREN-COUNT <+ ,WARREN-COUNT 1>>
	 <COND (<AND <G? .TMP 1> <PROB 50>>
		<TELL <PICK-ONE ,WARREN-TBL-1>>
		<TELL " the ">
		<TELL-WARREN-DIR>
		<TELL
", we went a short way before coming to another junction.">)
	       (<NOT <EQUAL? <MOD .TMP 5> 1>>
		<TELL "This time, we went down the ">
		<TELL-WARREN-DIR>
		<TELL ", but ">
		<TELL <PICK-ONE ,WARREN-TBL-2>>)
	       (T
		<TELL "I had the unpleasant feeling that it little mattered,
but we started along the ">
		<TELL-WARREN-DIR>
		<TELL " and soon came to a similar spot.">
		<COND (<EQUAL? .TMP 1>
		       <TELL CR CR
"Sure enough, it now seemed that similar passages were leading off in all
directions.">)>)>
	 <COND (<AND <EQUAL? ,WARREN-COUNT 2>
		     <G? <GETP ,PRISON ,P?TEMP> 1>>
		<FSET ,HERE ,EXAMINED>
		<COND (<IN-PARTY? ,ESHER>
		       <TELL CR CR
"Esher, who had been unusually silent, said \"I have the strange
feeling I've been here before,\" no doubt referring to the Dwarves'
prison. Then, putting two and two together and achieving five, he
added, \"We have gone nowhere!\"" CR CR>
		       <TELL
"Praxix corrected him, though it wasn't easy.">)
		      (T
		       <TELL CR CR
"I offered the suggestion that our situation seemed familiar,
thinking of the Dwarves' prison, but Praxix disagreed.">)>
		<TELL " \"I have been looking
carefully at these passages, and I believe they are not the same.
If you wish, we can try using the flare enchantment, but I
already know the result.">)>>