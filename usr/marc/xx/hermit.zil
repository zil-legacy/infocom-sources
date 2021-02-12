"HERMIT for
		      		JOURNEY
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<ROUTINE FSET-SEEN ()
	 <FSET ,HERE ,SEEN>>

<OBJECT HIGH-PLAIN-LAKE
	(LOC HIGH-PLAIN)
	(FLAGS DONT-TAKE)
	(SDESC "lake")
	(KBD %<ASCII !\L>)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"Sunlight danced on the surface of the lake that lay before us. It
was large, perhaps three miles across, and its waters were a brilliant
blue. Much of the shoreline was rocky, but below us lay a sandy beach.
The lake sat in a bowl in the mountains, fed by alpine streams, most
of which had run dry in the summer's heat. But " ACT " pointed out
one, directly between ourselves and the lake, that still flowed.">)>)> 

<ROOM HIGH-PLAIN
      (GRAPHIC G-HIGH-PLAIN)
      (TRAVEL-COMMANDS PROCEED-COMMAND NUL-COMMAND NUL-COMMAND)
      (TEMP 0)
      (ENTER FSET-SEEN)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <TELL
"Descending from the high plain, we headed toward the near shore of
the lake. Nearing the halfway point, we stopped at a wide stream whose
waters careened down the slope and into the lake below. The sky
was dark, and a storm threatened." CR CR>
	       <TELL
"\"Look!\" Praxix cried, pointing toward the lowering clouds.
For a long time we saw nothing, but soon a great, white bird
emerged from the cloud base and soared overhead in graceful spirals." CR CR>
	       <TELL
"\"I have seen nothing like it,\" Bergon said, as the bird disappeared
into the eastern sky.">
	       <MOVE-TO ,GOLD-STREAM>)
	      (FOLLOW-SMOKE:REMOVE
	       <TELL
"We followed " D <GET-TEMP> " to the crest of the rise, where we could
see smoke rising from behind a smaller hill that lay in front of us.">
	       <MOVE-TO ,PLAIN-RIDGE>)
	      (SCOUT:REMOVE
	       <SET-TEMP ,ACTOR>
	       <TELL ACT
" went on ahead, climbing a nearby ridge in hopes of getting a better
view. ">
	       <COND (<EQUAL? ,ACTOR ,ESHER>
		      <TELL
"He ran back toward us, waving his arms and pointing to the
ridge. \"Behind the ridge!\" he said, panting. \"Smoke!\"">)
		     (T
		      <TELL
"He returned, bringing strange news. \"There is smoke rising up
from behind the ridge. I thought perhaps it was a fire, but the plume
of smoke is small and localized, as if it were coming from a hearth
or campfire. And that in itself is odd, for nobody lives up here,
at least not that I have ever come across.\"">)>
	       <ADD-TRAVEL-COMMAND ,HERE ,FOLLOW-SMOKE-COMMAND>)>)>

<COMMAND FOLLOW-SMOKE>

<ROOM PLAIN-RIDGE
      (TRAVEL-COMMANDS FOLLOW-SMOKE-COMMAND BACK-COMMAND NUL-COMMAND)
      (GRAPHIC G-PLAIN-RIDGE)
      (FLAGS ADVISE)
      (ACTION
       <ACOND ()
	      (FOLLOW-SMOKE
	       <MOVE-TO ,HERMIT-HILL
"It was a short walk to the next hill; a small hut lay before us,
its battered door flapping slowly in the breeze. It was hard to
believe that one could live in such a place, but the column of smoke
rising from the chimney convinced us otherwise.">)
	      (BACK
	       <MOVE-TO ,HIGH-PLAIN
"\"Probably a brush fire,\" Bergon said. \"The land here is a great
tinder-box. Let us move onward and see if we can't have a meal by
the lake.\"">) 
	      (GET-ADVICE:REMOVE
	       <TELL
"A stiff breeze was blowing from the north, making conversation
difficult. Bergon asked for our opinion, and we agreed that there
might be something worth exploring if we continued following the
trail of smoke.">)
	      (SCOUT:REMOVE
	       <TELL ACT
" went ahead to the top of the next hill, where he found a small
ramshackle hut with smoke rising from a chimney." CR CR>
	       <COND (<EQUAL? ,ACTOR ,MINAR>
		      <TELL
"\"The hut was not here last year,\" he said, \"I am at a loss to
understand it.\"" CR CR>)>
	       <TELL
"\"Most peculiar!\" said Praxix. \"Whom do you suppose would choose to
live here?\"">)>)>

<COMMAND (KNOCK-ON-DOOR KNOCK)>

<OBJECT HERMIT-HILL-HUT
	(LOC HERMIT-HILL)
	(FLAGS DONT-TAKE)
	(SDESC "hut")
	(KBD %<ASCII !\H>)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"The hut was small, made of rough-hewn logs. The roof was of canvas, though
so filled with rips and tears that it would hardly keep out the rain. It
was difficult to believe that someone would choose to live here, but the
evidence seemed to point in that direction." CR CR>
		 <COND (<EQUAL? ,ACTOR ,PRAXIX>
			<TELL
"\"It would take a good deal of magic to fix this place up,\" Praxix said.
\"Shall we take a closer look?\"">)
		       (<EQUAL? ,ACTOR ,ESHER>
		        <TELL
"Esher was not impressed. \"I don't see how someone living here could
be of help to anyone,\" he said.">)>)>)>

<ROOM HERMIT-HILL
      (TRAVEL-COMMANDS KNOCK-ON-DOOR-COMMAND BACK-COMMAND NUL-COMMAND)
      (GRAPHIC G-HERMIT-HILL)
      (FLAGS DONT-SCOUT)
      (ACTION
       <ACOND ()
              (KNOCK-ON-DOOR
	       <TELL
"With Bergon in the lead, we approached the hut. But even as his raised
hand came down upon that rickety door, it appeared to open of its own
volition. We entered slowly; the hut was dark and smelled of incense. In
the far corner, one eye gone, the other opaque with cataracts, an old
man stared at us." CR CR>
	       <TELL
"I say old, though the many lines on his face were more like the scars
earned in battle than the wrinkles gathered over the long years.
We stood motionless, as though afraid to speak or perhaps unsure of what
to say. The silence was broken as the old man stood, toppling his stool,
and took a few hobbling steps toward Bergon." CR CR>
	       <TELL
"Then, staring straight into Bergon's eyes, he said, \"You come from the
far plains of Lavos, and you seek a great Wizard.\" Raising a deformed
finger, he hissed accusingly, \"It is in your eyes!\"">
	       <MOVE-TO ,HERMIT-HUT>
	       <OPTION ,BERGON ,TELL-TRUTH-COMMAND ,LIE-COMMAND>)
	      (BACK
	       <MOVE-TO ,HIGH-PLAIN
"We stood there, watching the hut, for a long while. Finally, Bergon
spoke. \"Our business is not here, but with Astrix on the Sunrise
Mountain. Let us leave this place, and continue on our chosen path.\"">)>)>

<ROUTINE END-HERMIT-OPTION ()
	 <TELL
"Fools! There is no Wizard, there is only the Enemy - and he is
strong - too strong - for the likes of you!\"" CR CR>
	 <TELL
"\"And how do you know this?\" Bergon demanded." CR CR>
	 <TELL
"The hermit retreated to his stool, and sat again in the corner.
\"I know nothing!\" he said, and sighed deeply.">
	 <END-OPTION>>

<OBJECT HERMIT-POWDER
	(SDESC "pouch")
	(KBD %<ASCII !\P>)
	(ACTION
	 <ACOND ()
		(EXAMINE
		 <COND (<EQUAL? ,ACTOR ,TAG>
			<TELL
"I decided to check on the contents of the hermit's pouch and found
five bags of powders, much like those used by Praxix. Presumably,
Praxix would want to examine them himself.">) 
		       (<NOT <EQUAL? ,ACTOR ,PRAXIX>>
			<TELL ACT
" looked in the pouch, opened it, and sniffed its contents.
\"Powders of some sort, I would guess,\" he said." CR CR>
			<TELL
"Praxix snatched the pouch from " ACT>)
		       (T
			<TELL
"Praxix took the pouch, opened it,">)>
		 <FSET ,HERMIT-POWDER ,SEEN>
		 <UPDATE-MOVE ,HERMIT-POWDER>
		 <TELL
" and reached inside. Nodding his head knowingly, he pulled five smaller
packets from the pouch, and said, \"Magical
powders. Garlimon was quite resourceful to have salvaged these from
the carnage of his party. Perhaps it is the reason he has survived
this long.\" And then, examining the contents of each packet, he
continued. \"The four basic essences are here: fire, air, earth, and
water. But this fifth powder...\" His voice trailed off as he gazed
intently at the blue-green powder">
		 <COND (,PART-TWO
		        <COND (<NOT <F&SET? ,REAGENT ,SOLVED>>
			       <TRAVEL-COMMANDS ,PRAXIX
						,CAST-COMMAND
						,MIX-COMMAND
						,EXAMINE-COMMAND>)>
			<TELL ". \"This must be the reagent that
Astrix told us about. How silly of me to have forgotten to examine
Garlimon's pouch sooner!\"">)
		       (T
			<COND (<EQUAL? ,HERE ,HIGH-PLAIN>
			       <TELL
", then turned his eyes back toward the hermit's hut">)>
			<TELL ". \"I have never seen this
before. Ah, well! Perhaps Astrix will know it.\"">)>
		 <TELL " And with that, he placed
the powders among his own.">)>)>

<OBJECT HERMIT-HUT-HERMIT
	(LOC HERMIT-HUT)
	(FLAGS DONT-TAKE)
	(SDESC "hermit")
	(KBD %<ASCII !\H>)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"Old and stooped, the hermit looked at us through his single weary eye.
He wore a tattered and bloody cloak, in a style not unlike that used by
our people in the plains." CR CR>
		 <TELL
"\"Your accent sounds familiar,\" " ACT " said. \"Have you travelled in
our lands?\" The hermit seemed taken aback by " ACT "'s offhand comment,
though he did not respond.">)>)>

<ROOM HERMIT-HUT
      (TRAVEL-COMMANDS EXIT-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS DONT-CAST DANGEROUS)
      (GRAPHIC G-HERMIT)
      (ACTION
       <ACOND ()
	      (EXIT
	       <COND (<FSET? ,HERE ,SCOUTED>
		      <UPDATE-MOVE ,HERMIT-POWDER ,INVENTORY>
		      <TELL
"We shuffled out of the hut, and Garlimon hobbled to the door as
we made our way back to our path. \"Begone!\" he cried, and threw
a small leather pouch at our feet. \"Who knows? Perhaps this will help
you where you are going!\" He cackled, then slammed the door behind
us. Curious as to what we had been given, I bent down and picked
up the pouch." CR CR>
		      <MOVE-TO ,HIGH-PLAIN
"\"He was a great man; the misfortunes of his party are a heavy load
to bear,\" Bergon said, and we made our way in silence to the high
plain.">)
		     (T
		      <TELL
"We left the hut in silence and returned to the high plain." CR CR>
		      <MOVE-TO ,HIGH-PLAIN
"\"He is a strange man,\" Bergon said. \"I have the peculiar feeling
that we have met before.\" He laughed, saying, \"Perhaps at the old
Ale House, at the bar!\"">)>)
	      (CAST
	       <TELL
"Praxix reached toward his cloak, but Bergon stayed his hand. \"Not now!\"
he said.">)
	      (TELL-TRUTH
	       <TELL
"\"We have journeyed from Lavos, as you say; we ">
	       <COND (,2ND-PASS
		      <TELL
"have enlisted the aid of the great Wizard Astrix, and our efforts are
now joined with his own.\"" CR CR>)
		     (T
		      <TELL
"seek the Wizard Astrix, to seek his aid.\"" CR CR "\"">)>
	       <END-HERMIT-OPTION>)
	      (LIE
	       <TELL
"\"We seek no Wizard; we are...\"" CR CR>
	       <TELL
"\"You are liars!\" he roared. \"I know who you are; I know what you
are. ">
	       <END-HERMIT-OPTION>)
	      (SCOUT:REMOVE
	       <UPDATE-FSET ,HERMIT-HUT-HERMIT ,DONT-EXAMINE>
	       <TELL ACT
", meanwhile, had been discreetly eyeing the hut when he caught a glimpse
of a broadsword lying behind the door. He picked it up, and, still unseen,
showed it to Bergon, who turned his back to examine it." CR CR>
	       <TELL
"\"A fine weapon!\" Bergon said, unsheathing the sword and
holding it out toward the hermit. \"The finest
of its kind; forged at Hervish, judging by its style, and fashioned by a
great craftsman.\" We thought it odd for Bergon to be ranting on about this
undistinguished looking weapon, but we were wholly unprepared for
what followed." CR CR>
	       <TELL
"\"Garlimon,\" Bergon said warmly, and reached out for the hermit." CR CR>
	       <TELL
"But the hermit spurned Bergon's hand. \"Yes. Garlimon. What of it?\" he
scowled, \"You seek Astrix; I sought him also. And I see you've gotten
further than I - so far!\" He lifted his cane, and waved it at us
menacingly. \"You are in great danger - all of you! You will die at
His hand! You will all die!\"" CR CR>
	       <TELL
"Garlimon was mad! He stumbled backward, clutching a rotting table,
and stared wildly at us. \"Leave me!\" he demanded. \"Leave this place
at once!\"">)>)>
       