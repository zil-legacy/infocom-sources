"PRISON for
		      		JOURNEY
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

;"What is a fantasy game without a maze, anyway?"

<ROOM OUTSIDE-PRISON
      (TRAVEL-COMMANDS PROCEED-COMMAND BACK-COMMAND NUL-COMMAND)
      (GRAPHIC G-PRISON-RUNES)
      (ENTER FSET-SEEN)
      (FLAGS UNDERGROUND DONT-SCOUT)
      (ACTION
       <ACOND ()
	      (BACK
	       <MOVE-TO ,STAIR-BOTTOM
"It was a short walk back to the stairs, and we prepared to make the
long ascent.">)
	      (PROCEED
	       <TELL
"We continued our march through the long passage. ">
	       <COND (<IN-PARTY? ,HURTH>
		      <TELL
"\"We have come nearly to the eastern extent of the Reth a-Zar, where the
Bern i-Fen leads to the Old Forest,\" Hurth said." CR CR>)
		     (T
		      <TELL
"\"My sense is that we are nearing the Forest Gate,\" Praxix said." CR CR>)>
	       <MOVE-TO ,DARK-EVIL-CAVERN
"\"That sounds fine to me,\" I exclaimed, \"What I wouldn't give to see the
sunshine again!\"">)
	      (ENTER
	       <COND (<FSET? ,HERE ,TRAPPED>
		      <TELL
"I suggested returning to the prison, but we decided against it.
\"">
		      <COND (,KIDNAPPED <TELL D ,KIDNAPPED>)
			    (T <TELL "My kinsman">)>
		      <TELL
" is dead,\" Hurth said, gently. \"The orcs do not keep
prisoners, except for the sport of torture. In any event, they
will expect our return, and lie in wait for us. Let us continue,
that his death will not have been in vain.\"">)
		     (T
		      <MOVE-TO ,PRISON>)>)>)>

<ROOM DARK-EVIL-CAVERN
      (TRAVEL-COMMANDS PROCEED-COMMAND BACK-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND DANGEROUS)
      (CAST-LIMIT INF)
      (ENTER
       <EXECUTE ()
		<TELL CR CR
"Bergon laughed, as did Praxix, but there was another sound also, cold and
rumbling, like distant thunder; and it came from before us.">
		<COND (<IN-PARTY? ,HURTH>
		       <TELL CR CR
"\"I know not what lies before us,\" Hurth said, \"yet I know
that many evils, having long inhabited the deepest places of the earth,
now boldly tread even on the Dwarves' hallowed lands.\"">)>>)
      (TEMP 0)
      (ACTION
       <ACOND ("AUX" TMP)
	      (<OR <ACTION? PROCEED> <ACTION? BACK>>
	       <SET-TEMP <SET TMP <+ <GET-TEMP> 1>>>
	       <COND (<EQUAL? .TMP 1>
		      <TELL
"A cold wind chilled us to the bone as we inched our way ">
		      <COND (<ACTION? BACK>
			     <TELL "back ">)>
		      <TELL "through
the cavern." CR CR>
		      <TELL
"\"Praxix! Look!\" I cried, pointing at the Wizard's staff. The staff
still glowed a pale red, but it seemed that the light it cast
was different; duller, perhaps, or somehow less potent.">)
		     (<EQUAL? .TMP 2>
		      <TELL
"On we went, as the now frigid air grew colder still with each tentative
step. Praxix' staff was now glowing a deep red, and its light was barely
enough to see by." CR CR>
		      <TELL
"\"Something's here,\" I whispered, as the air grew stale, then acrid. I
stumbled backward, tripped, and fell against the ground.">
		      <REMOVE-PARTY-COMMAND ,PROCEED-COMMAND>
		      <COND (<IN-PARTY? ,HURTH>
			     <TELL CR CR
"\"This is an evil day,\" said Hurth. \"I hope there is time yet for us to
make our escape.\"">)>
		      <RTRUE>)
		     (T
		      <REMOVE-PARTY-COMMAND ,BACK-COMMAND>
		      <TELL
"Moving back through the darkening gloom, the evil presence drew
ever closer. But Praxix stood his ground, saying, \"We must not allow
this evil to endanger the other Dwarves. Run now, while I teach this
thing a lesson!\" It was sheer bravado, but Praxix was insistent.
\"Fly,\" he shouted. \"I shall join you soon!\"" CR CR>
		      <TELL
"Bergon agreed that there was nothing we could do but get ourselves
into more trouble, so we retreated to the stairs to await Praxix'
return.">
		      <SCENE ,PRAXIX-VS-EVIL>)>)
	      (<AND <ACTION? CAST> <OBJECT? LIGHT-SPELL>>
	       <TELL
"Praxix applied more fire essence to the end of his staff, but the
light grew dimmer, not brighter. \"Most peculiar,\" he said.">)
	      (<AND <ACTION? CAST> <OBJECT? TREMOR-SPELL>>
	       <TELL
"The thought crossed Praxix' mind to cast a tremor spell, isolating
this dark presence. But the tremor spell was always unpredictable,
and the entire party might be placed in jeopardy.">)
	      (<AND <ACTION? CAST> <OBJECT? FAR-VISION-SPELL>>
	       <CAST-FAR-VISION <>>
	       <TELL
" But it seemed that the ball of flame, rather than expelling the
darkness before it, was wholly enveloped by it. \"I fear to think
what evil can consume the very light,\" Praxix said.">)>)>

<OBJECT PRAXIX-VS-EVIL
	(TEMP 0)
	(ACTION
	 <ACOND ("AUX" TMP)
		(SCENE-START
		 <FSET ,PRAXIX-VS-EVIL ,SEEN>
		 <TRAVEL-COMMANDS ,PRAXIX ,CAST-COMMAND ,EXAMINE-COMMAND>
		 <MAKE-SUBGROUP ,PRAXIX>
		 <NEW-DEFAULT <PARTY-PCM ,PRAXIX> 1>)
		(SCENE-END
		 <TRAVEL-COMMANDS ,PRAXIX
				  ,CAST-COMMAND
				  <COND (<NOT ,PART-TWO>
					 ,TELL-LEGEND-COMMAND)
					(,MIX-DONE
					 ,USE-MIX-COMMAND)
					(<NOT <FSET? ,REAGENT ,SOLVED>>
					 ,NUL-COMMAND)
					(T
					 ,MIX-COMMAND)>
				  ,EXAMINE-COMMAND>
		 <CLEAR-SUBGROUP>)
		(CAST
		 <PUTP ,PRAXIX-VS-EVIL
		       ,P?TEMP
		       <SET TMP <+ <GETP ,PRAXIX-VS-EVIL ,P?TEMP> 1>>>
		 <COND (<OR <EQUAL? .TMP 3>
			    <AND <OBJECT? TREMOR-SPELL>
				 <NOT <EQUAL? .TMP 1>>>>
			<TELL "Finally, ">)
		       (<EQUAL? .TMP 1>
			<COND (<NOT <OBJECT? TREMOR-SPELL>>
			       <TELL "First, ">)>)
		       (T
			<TELL "Then, ">)>
		 <COND (<OR <OBJECT? FIRE-SPELL>
			    <OBJECT? LIGHT-SPELL>
			    <OBJECT? FAR-VISION-SPELL>>
			<TELL
"Praxix pulled out some magic essences and prepared to cast
his enchantment. But it was no use! The dark presence negated the
spell even as it was cast.">)
		       (<OBJECT? WIND-SPELL>
			<TELL
"pulling out some air essence, he cast that spell toward the
unseen evil, but this barely slowed its inexorable approach.">)
		       (<OBJECT? LEVITATE-SPELL>
			<PRAXIX-NO-CAST>)
		       (<OBJECT? TREMOR-SPELL>
			<TELL
"Praxix removed some earth essence and
cast it upon the stone before his feet. At once,
the earth began to shake, and Praxix slowly backed away. An instant
later, the roof of the cavern collapsed before him, knocking him off
his feet. He retreated to the ">
			<COND (<NOT ,PART-TWO>
			       <TELL "bottom of the ">)>
			<TELL "stairs, where we
were anxiously awaiting his return.">
			<COND (<NOT ,PART-TWO>
			       <TELL CR CR
"\"I believe we are safe, at least for the moment. ">
			       <COND (<FSET? ,MINAR ,DONT-DROP>
				      <TELL "Minar was right;
we are beset by dangers. ">)>
			       <TELL
"And now, I must rest.\" And with that, Praxix
lowered himself to the floor, and fell into a deep sleep.">)>
			<COND (<AND <IN-PARTY? ,ESHER> <NOT ,PART-TWO>>
			       <TELL CR CR
"\"He is a fine Wizard,\" Esher admitted, \"though he knows more than
he speaks.\"" CR CR>
			       <TELL
"\"Far better than the contrary,\" Bergon replied. Esher appeared to miss
the slight, and it was just as well.">)>
			<COND (<NOT ,PART-TWO>
			       <TELL CR CR
"It was now late, and we were all hungry and tired. I took out some
provisions and we ate a small meal before retiring for the night. We
woke early the next morning, well rested for another day in the
caverns.">
			       <NEXT-DAY>)>  
			<SCENE <>>
			<FSET ,HERE ,ENCHANTED>
			<COND (,PART-TWO
			       <TRAVEL-COMMANDS ,MINE-STAIR ,DOWN-COMMAND>
			       <MOVE-TO ,MINE-STAIR>)
			      (T
			       <TRAVEL-COMMANDS ,OUTSIDE-PRISON
						,BACK-COMMAND
						<COND (<AND <FSET? ,PRISON-RUNES
							      ,EXAMINED>
							    <NOT <FSET? ,PRISON ,SEEN>>>
						       ,ENTER-COMMAND)
						      (T
						       ,NUL-COMMAND)>>
			       <MOVE-TO ,STAIR-BOTTOM>)>
			<FSET ,HERE ,DANGEROUS>
			<RTRUE>)>
		 <COND (<EQUAL? .TMP 3>
			<TELL CR CR
"The core of the evil itself was upon Praxix, and it took all of
his strength to escape it. He fled back to the stairs, where he joined
with the rest of the party." CR CR>
			<TELL
"\"I cannot stop this thing,\" he said, breathlessly. \"We must flee
these halls!\"" CR CR>
			<SCENE <>>
			<COND (<IN-PARTY? ,HURTH>
			       <TELL "Hurth">)
			      (T
			       <TELL "Bergon">)>
			<TELL " shepherded us ">
			<COND (,PART-TWO
			       <TELL 
"down the stairs. \"It may be safer below, though
I fear we there is no safety in these halls anymore.\"" CR CR>
			       <MOVE-TO ,MINE-2-W "2W">)
			      (T
			       <TELL "up the stairs">
			       <COND (<IN-PARTY? ,HURTH>
				      <TELL ". \"I did not say so before, but
there is Dwarvish door here.\" And then, speaking a word of command,
an unseen door sealed off the stairs. \"We have long dreaded this day,
but we are not unprepared. The lower chambers are now sealed; I fear that
we shall never see them again.\" He held back tears as he guided us up
the stairs to a nearby landing.">)
				     (T
				      <HINT ,HINT-DARK-PRESENCE>
				      <TELL
" and to a nearby landing." CR CR>
				      <TELL
"\"We will not be safe at the lower levels,\" he said. \"Our best hope is
to leave these caverns through the High Gate. I pray the Dwarves are safe
from whatever it is that pursues us!\"">)>
			       <TELL CR CR
"From the landing, it was another four or five hours to the junction
of two stairs">
			       <COND (<NOT <FSET? ,STAIR-JUNCTION ,SEEN>>
				      <COND (<IN-PARTY? ,HURTH>
					     <TELL
". \"The stair to the left leads to the Tower of the Sunset;
the stair to the right leads to the High Gate,\" Hurth said. \"If
we intend to reach the Tower, we should start now. It is a much
longer climb.\"">)
					    (T
					     <TELL "; neither was marked.">)>)>
			       <REMOVE-TRAVEL-COMMAND ,STAIR-JUNCTION
						      ,DOWN-COMMAND>
			       <MOVE-TO ,STAIR-JUNCTION>)>)>
		 <RTRUE>)>)>
		 
<OBJECT PRISON-RUNES
	(SDESC "runes")
	(KBD %<ASCII !\R>)
	(LOC OUTSIDE-PRISON)
	(FLAGS DONT-TAKE)
	(EXBITS <+ ,PRAXIXBIT ,HURTHBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <FSET ,ACTION-OBJECT ,EXAMINED>
		 <ADD-TRAVEL-COMMAND ,HERE ,ENTER-COMMAND>
		 <COND (<NOT <EQUAL? ,ACTOR ,HURTH>>
			<TELL ACT
" examined the runes, but found he had no memory of such symbols. Hurth,
who had been watching this with some amusement,">)
		       (T
			<TELL ACT
" looked at the runes briefly, then">)>
		 <TELL
" said \"The runes say 'prison'\. And
now that I look more closely, I can see a door here.\" We tried
to find the door, but Hurth interrupted. \"It is a Dwarvish door;
you will not find it.\"">)>)>

<ROOM PRISON
      (TRAVEL-COMMANDS LEFT-COMMAND RIGHT-COMMAND NUL-COMMAND)
      (GRAPHIC G-PRISON)
      (CAST-LIMIT 3)
      (FLAGS UNDERGROUND ADVISE DANGEROUS)
      (TEMP 0)
      (ENTER
       <EXECUTE ()
		<FSET ,HERE ,SEEN>
		<TELL
"Hurth approached the door and spoke a Dwarvish command of opening.
The massive door obliged without a sound, and we entered a large
vestibule; the door closed behind us, becoming invisible." CR CR>
		<TELL
"\"These Dwarvish doors take some getting used to!\" I said,
thinking of the gate through which we entered these caverns." CR CR>
		<TELL
"\"Do not be alarmed,\" said Hurth. \"Watch!\" Hurth called out a
command, but no door appeared. He laughed nervously, then called
out a few dozen more foreign words the last few of which seemed rather
more like expletives than commands." CR CR>
		<COND (<IN-PARTY? ,ESHER>
		       <TELL
"\"Well?\" Esher prompted, but Hurth was deep in thought. ">)>
		<TELL "Bergon,
trying his best to control his temper, paced to the center of the
vestibule, and looked down the dark corridors which led off to our
left and right.">>)
      (ACTION
       <ACOND ("AUX" TMP F)
	      (<AND <ACTION? CAST>
		    <OBJECT? FAR-VISION-SPELL>>
	       <CAST-FAR-VISION <>>
	       <PRISON-SOLVED>
	       <COND (<IN-PARTY? ,ESHER>
		      <TELL CR CR
"\"Well, that was useful!\" Esher said, in his most sarcastic voice.
It seemed that Praxix would respond with some clever retort">)
		     (T
		      <TELL CR CR
"The ball of flame was soon out of sight, and nothing had been learned.
It seemed that Praxix was about to make another suggestion">)>
	       <TELL ", when his
face became contorted with fear. \"Down!\" he shouted, pushing us to
the ground.">
	       <GRAPHIC ,G-PRISON-FV>
	       <TELL CR CR
"\"What the...?\" started Bergon, catching sight of the ball of flame
that raced toward us. As it continued down the far corridor, we pulled
ourselves to our feet. \"It would seem,\" Praxix said blankly, \"that
following these corridors will be a tiring proposition!\"" CR CR>
	       <TELL
"He cast his gaze upward, then produced another ball of flame which he
flung upwards. As it rose, it outlined a passage about a dozen feet
above us. \"I suggest marching that way!\" he said, and raised a crooked
finger above his head.">)
	      (<AND <ACTION? SCOUT>
		    <NOT <FSET? ,HERE ,SOLVED>>>
	       <TELL ACT
" walked down the passage, turning a corner. A few minutes later, he
returned, reporting only that the passage did quite a lot of twisting
and turning. \"As to where it leads,\" he said, \"your guess is as good
as mine.\"">
	       <UPDATE-FSET ,HERE ,DONT-SCOUT>)
	      (GET-ADVICE:REMOVE
	       <COND (<L? <GET-TEMP> 2>
		      <TELL
"We huddled among ourselves and agreed that it would be best to ">
		      <COND (<ZERO? .TMP> <TELL "explore">)
			    (T
			     <TELL "continue exploring">)>
		      <TELL " the caverns.">)
		     (<NOT <F&SET? ,HERE ,EXAMINED>>
		      <TELL
"\"I don't think we're making much progress.\" I said, looking
at our familiar surroundings.">)>)
	      (<AND <ACTION? DROP>
		    <NOT <FSET? ,HERE ,SOLVED>>>
	       <UPDATE-MOVE ,ACTION-OBJECT ,HERE>
	       <FSET ,HERE ,DONT-DROP>
	       <TELL
"The caverns looked suspiciously like a maze of some kind to me,
so I surreptitiously dropped the " AO " on the ground to help
mark our location.">)
	      (UP:REMOVE
	       <TELL
"We looked up into the darkness, but could discern nothing. 'Up'
may have been our only alternative, as Praxix said, but getting there
would be another matter.">)
	      (<AND <ACTION? CAST>
		    <OBJECT? LEVITATE-SPELL>>
	       <COND (<NOT <FSET? ,HERE ,SOLVED>>
		      <TELL
"It may be that Praxix knew something we didn't, because he reached into
his cloak and started to put together one of his magical preparations.
Next thing I knew, I was rising into the air! My ascent, exhilarating
as it was, was cut short as I bumped my head into the rock that lay
above us. A few moments later, I descended to the ground.">)
		     (T
		      <TELL
"Praxix now drew some magical powder from his cloak, motioned me
a few steps to my left, then cast the preparation onto me. I climbed into
the air, coming finally to a landing which I grabbed tightly onto
(for fear of going even higher!) Once the elevation spell had
worn off, I released my grip of the rock slab and pulled myself
to my feet. Lowering my rope, ">
		      <COND (<IN? ,OBJ-ROPE ,HERE>
			     <TELL "which Bergon had to throw back
up to me, ">
			     <UPDATE-MOVE ,OBJ-ROPE ,INVENTORY>)>
		      <TELL "I brought the others up to the
landing where I stood." CR CR>
		      <MOVE-TO ,ORC-FORK
"At the landing was a passage, and this we followed until we came finally
to a fork; both left and right paths seemed
evil and foreboding. Perhaps it was some illusion or trick of the eye,
but the walls along the right-hand path seemed to glow eerily.">)>)
	      (<OR <ACTION? PROCEED>
		   <ACTION? BACK>
		   <ACTION? LEFT>
		   <ACTION? RIGHT>>
	       <SET-TEMP <+ <SET TMP <GET-TEMP>> 1>>
	       <COND (<ZERO? .TMP>
		      <TELL
"It seemed pointless to remain here, so we started down the long and
winding corridor. I felt almost dizzy from the turning by the time
we arrived at another vestibule about five minutes later. It looked
much the same as the previous one; and the passage continued farther
into the darkness.">
		      <TRAVEL-COMMANDS ,HERE ,PROCEED-COMMAND ,BACK-COMMAND>)
		     (<EQUAL? .TMP 1>
		      <TELL
"Again, we marched down the corridor, twisting and turning, turning
and twisting, and again coming to a vestibule, beyond which the
passage continued.">
		      <COND (<IN-PARTY? ,ESHER>
			     <TELL
" \"Brother Hurth, do you think we are making any
progress?\" Esher asked. Hurth, embarrassed, did not respond.">)>
		      <RTRUE>)
		     (T
		      <TELL
"Once again, we marched through the passage, and once again we
arrived at a similar vestibule.">)>
	       <COND (<SET F <FIRST? ,HERE>>
		      ;"There is something on the ground here."
		      <TELL CR CR
"Just then, I noticed that the ">
		      <TELL D .F>
		      <TELL " that I had dropped was sitting on the
ground by our feet! Excitedly, I told the others of my discovery and
replaced it in my pack.">
		      <UPDATE-MOVE .F ,INVENTORY>
		      <TELL CR CR
"Praxix shook his head slowly. \"As I had suspected - we are in a prison
after all. Perhaps this will shed more light on our predicament!\"" CR CR>
		      <SETG ACTION-OBJECT ,FAR-VISION-SPELL>
		      <PERFORM ,CAST-COMMAND>)>
	       <RTRUE>)>)>

<ROUTINE PRISON-SOLVED ()
	 <UPDATE-FCLEAR ,HERE ,ADVISE>
	 <FSET ,HERE ,SOLVED>
	 <TRAVEL-COMMANDS ,HERE ,UP-COMMAND>>

