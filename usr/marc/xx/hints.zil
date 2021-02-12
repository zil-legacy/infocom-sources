"HINTS for
		      		JOURNEY
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<ROUTINE HINT (H) <MOVE .H ,HINTS>>

<COMMAND MUSINGS <> ("AUX" TMP STR)
	 <IFFLAG (YFLAG <CLEAR 2>) (T <WCLEAR>)>
	 <COND (,GAME-WON?
		<HAVE-YOU-EVER-TRIED?>
		<RTRUE>)>
	 <TELL
"The following marginal notes appeared in " TAG "'s account of the
Journey:" CR CR>
	 <TELL
"[Warning: " TAG " gave great thought to the events he witnessed during his
Journey and was able to deduce the solutions to many of the mysteries and
puzzles that faced his party during those dark days. If you would prefer
to solve these mysteries for yourself, you are encouraged to do so, without
reference to the musings contained herein.]" CR> 
	 <IFN-YFLAG <WFORCE>>
	 ;<REMOVE-TRAVEL-COMMAND ,HERE ,MUSINGS-COMMAND>
	 <REPEAT ()
		 <PUT ,O-TABLE 0 0>
		 <FIND-OBJECTS ,HINTS>
		 <SET TMP <GET ,O-TABLE 0>>
		 <COND (<ZERO? .TMP>
			<REMOVE-TRAVEL-COMMAND ,HERE ,MUSINGS-COMMAND>
			<CLEAR-FIELDS>
			<NEW-DEFAULT>
			<RTRUE>)>
		 <SET TMP <+ .TMP 1>>
		 <PUT ,O-TABLE .TMP ,CANCEL-OBJECT>
		 <PUT ,O-TABLE 0 .TMP>
		 <CLEAR-FIELDS>
		 <BOLD-CURSOR 1 1 <GET-COMMAND ,MUSINGS-COMMAND>>
		 <PRINT-COLUMNS>
		 <REPEAT ()
			 <COMMAND-OBJECT-INPUT>
			 <TELL CR>
			 <COND (<EQUAL? ,ACTION-OBJECT ,CANCEL-OBJECT>
				<CLEAR-FIELDS>
				<NEW-DEFAULT>
				<RTRUE>)
			       (<APPLY <GETP ,ACTION-OBJECT ,P?ACTION>>
				<COND (<ZERO? <LOC ,ACTION-OBJECT>>
				       <TELL CR>
				       <IFN-YFLAG <WFORCE>>
				       <RETURN>)>)
			       (<SET STR <GETP ,ACTION-OBJECT ,P?NUDGE>>
				<PUTP ,ACTION-OBJECT ,P?NUDGE <>>
				<TELL .STR>)
			       (T
				<TELL <GETP ,ACTION-OBJECT ,P?SOLUTION>>
				<UPDATE-REMOVE ,ACTION-OBJECT>
				<RETURN>)>
			 <TELL CR>
			 <IFN-YFLAG <WFORCE>>>>>

<OBJECT HINTS>

<OBJECT HINT-NIGHTFANG
	(SDESC "Nightfang")
	(KBD %<ASCII !\N>)
	(ACTION
	 <EXECUTE ()
		  <UPDATE-REMOVE ,HINT-NIGHTFANG>
		  <TELL
"I have always wondered whether we could have saved " D ,BITE-VICTIM " from
the deadly bite of the Nightfang.">
		  <COND (<FSET? ,ELFSTREAM-1 ,SEEN>
			 <TELL
" Could the woman at the stream have helped if I had approached her?">)
			(T
			 <TELL
" Would it have helped if I had followed the stream?">)>
		  <TELL
" Was there someplace else Praxix could have explored?">>)>

<OBJECT HINT-RIVER
	(SDESC "River")
	(KBD %<ASCII !\R>)
	(NUDGE
"We should have known better than to try crossing a swiftly flowing river.")
	(SOLUTION
"Perhaps we could have launched the raft further upstream.")>

<OBJECT HINT-LAKE
	(SDESC "Lake")
	(KBD %<ASCII !\L>)
	(ACTION
	 <EXECUTE ()
		  <COND (<NOT <FSET? ,LAKE-POOL ,SEEN>>
			 <TELL
"In retrospect, I do not know why we did not fully explore the cave we found
near the lake.">)
			(T
			 <TELL
"In retrospect, I do not understand our hesitation to fully explore the
depths of the pool.">)>
		  <TELL
" Perhaps if we had, " D ,LAKE-VICTIM " would be alive today.">
		  <UPDATE-MOVE ,HINT-LAKE>>)>

<OBJECT HINT-ELVES
	(SDESC "Elf Home")
	(KBD %<ASCII !\E>)
	(ACTION
	 <EXECUTE ()
		  <UPDATE-REMOVE ,HINT-ELVES>
		  <COND (<FSET? ,FOREST-FIRE ,SEEN>
			 <TELL
"I regret that, in our haste to find Astrix, we did not try to help the
Elves try to contain the great fire that burned to the north.">)
			(T
			 <TELL
"I regret that we could not help the Elves with their fire; perhaps
Praxix could have used his magic to help them defend themselves.">)>>)>

<OBJECT HINT-DWARVES
	(SDESC "Dwarves")
	(KBD %<ASCII !\D>)
	(SOLUTION
"I don't know why Bergon decided we should fight the Dwarves; though they
surprised us and were formidably armed, they did not attack, but rather
appeared anxious to talk.")>

<OBJECT HINT-DWARF-LIE
	(SDESC "Dwarves")
	(KBD %<ASCII !\D>)
	(SOLUTION
"I wish we had been able to enlist the aid of the Dwarves in our quest.
Perhaps we got off on the wrong foot with them.")>

<OBJECT HINT-RUNES
	(SDESC "Runes")
	(KBD %<ASCII !\R>)
	(SOLUTION
"When we were in the Dwarvish caverns, I feel we might have paid closer
attention to the runes that were inscribed on the walls.")>

<OBJECT HINT-ORC-FIGHT
	(SDESC "Orc Fight")
	(KBD %<ASCII !\O>)
	(NUDGE
"Did we fight to our best advantage? I think not.")
	(SOLUTION
"Perhaps things would have gone differently if we had gained the element
of surprise by sending one of our party to flank the orcs.")>	 
	  
<OBJECT HINT-AVALANCHE
	(SDESC "Avalanche")
	(KBD %<ASCII !\A>)
	(ACTION HINT-MAP)>

<OBJECT HINT-QUICKSAND
	(SDESC "Quicksand")
	(KBD %<ASCII !\Q>)
	(ACTION HINT-MAP)>

<OBJECT HINT-MTN-LION
	(SDESC "Mtn. Lion")
	(KBD %<ASCII !\M>)
	(ACTION HINT-MAP)>	

<ROUTINE HINT-MAP ()
	 <COND (<FSET? ,WEBBA-MAP ,SOLVED>
		<TELL
"I think we paid too little attention to the Webba's map
back in Lavos. Its markings might have helped us avoid the grizzly
scene at the Sunrise Mountain.">)
	       (<IN? ,WEBBA-MAP ,INVENTORY>
		<TELL
"We never did find out what the red markings on the map we bought at
Webba's meant. Perhaps if we had talked to him, he could have explained.">)
	       (T
		<TELL
"I don't know how we might have avoided the grizzly scene at the Sunrise
Mountain. We had no map, and all paths seemed similar. Perhaps it was
unavoidable.">)>
	 <UPDATE-REMOVE ,ACTION-OBJECT>>

<OBJECT HINT-TANGLETREES
	(SDESC "Snaketrees")
	(KBD %<ASCII !\S>)
	(SOLUTION
"It has always struck me as odd that Bergon would continue onward into
the grips of those deadly trees. But then, Bergon was a headstrong man,
and a brave leader.")>

<OBJECT HINT-MINAR
	(SDESC "Minar")
	(KBD %<ASCII !\M>)
	(SOLUTION
"I did not like his looks, yet in hindsight it seems that we would have been
well served by taking the stranger, Minar, into our party.")>

<OBJECT HINT-GOLD
	(SDESC "Storm")
	(KBD %<ASCII !\S>)
	(SOLUTION
"I should have expressed my misgivings at the time, but I have never
understood why we spent time looking for gold; all the gold in the world,
after all, would not save our lands from the destruction that was sure
to come if we failed in our mission.")>

<OBJECT HINT-PRISON
	(SDESC "Caverns")
	(KBD %<ASCII !\C>)
	(SOLUTION
"Did we explore enough in the Dwarvish caverns? After all, the passage at the
bottom of the stairs continued onward, and yet we never thought to explore,
so anxious were we to leave those dark, Dwarvish caverns.")>

<OBJECT HINT-CHASM
	(SDESC "Chasm")
	(KBD %<ASCII !\C>)
	(NUDGE
"We failed to get across the chasm, but perhaps we did not do enough. Praxix'
magic might have worked. But how?")
	(SOLUTION
"What if Praxix had elevated someone with his elevation spell, then blew
him across the chasm with his wind spell? Farfetched, perhaps, but it may
well have been worth a try.")>

<OBJECT HINT-DARK-PRESENCE
	(SDESC "Dark Evil")
	(KBD %<ASCII !\D>)
	(NUDGE
"Praxix failed to hold back the dark presence we felt in the caverns. I
wish there had been some spell that Praxix could have used to stop its
progress.")
	(SOLUTION
"What if Praxix had tried using his Tremor spell? Might that not have
stopped the dark presence, or at least slowed it down?")>	 

<OBJECT HINT-ORC-TRAP
	(SDESC "Orc Trap")
	(KBD %<ASCII !\O>)
	(ACTION
	 <EXECUTE ()
		  <COND (<NOT ,A-B-FLAG>
			 <TELL
"Perhaps taking the northern path in the forest would have prevented
us from walking into the orcs' trap.">
			 <UPDATE-REMOVE ,HINT-ORC-TRAP>)
			(<NOT <FSET? ,MINE-JUNCTION ,SEEN>>
			 <TELL
"Why we did not fully explore the lower chambers remains a mystery.">
			 <UPDATE-REMOVE ,HINT-ORC-TRAP>)
			(<NOT <F&SET? ,ACTIVE-MINE ,SOLVED>>
			 <TELL
"We never did discover the meaning of the tapping sounds in the mine.
I feel they were significant. It may have been worthwhile to check
them out again.">)
			(<FSET? ,RED-ROCK ,SOLVED>
			 <TELL
"I'm certain the red rock I recovered from the mine was the key to the
miner's disappearances! Could we have used it to save " D ,TRAP-VICTIM
" from the orcs?">
			 <COND (<NOT <FSET? ,RED-ROCK ,DEAD>>
				<TELL
" I think I had the rocks with me, though I would have had to check
my inventory to be sure.">)>
			 <UPDATE-REMOVE ,HINT-ORC-TRAP>)
			(<NOT <IN? ,RED-ROCK ,ACTIVE-MINE>>
			 <TELL
"Did we fail to pay close enough attention to the mine itself;
did we examine everything?">
			 <UPDATE-REMOVE ,HINT-ORC-TRAP>)
			(T
			 <TELL
"The miner surely knew many things. Did we ask him enough questions?
Did he somehow hold the key to our futures?">
			 <UPDATE-REMOVE ,HINT-ORC-TRAP>)>>)>

<OBJECT HINT-CASTLE
	(SDESC "Castle")
	(KBD %<ASCII !\C>)
	(SOLUTION
"It seemed unlike Praxix to fail to explore the castle because the bridge
appeared too flimsy; but we were all frightened then, mostly of the unknown.
I must not judge him too harshly.")>

<OBJECT HINT-UMBER
	(SDESC "Umber")
	(KBD %<ASCII !\U>)
	(SOLUTION
"Why did Praxix refuse Umber's offer to join him? Pride? Stubborness? I
suppose we shall never know.")>

<OBJECT HINT-DUNGEON
	(SDESC "Castle")
	(KBD %<ASCII !\C>)
	(SOLUTION
"I have never understood why Praxix failed to explore the entire grounds of
the castle. I suppose I never shall.")>

<OBJECT HINT-VAULT
	(SDESC "Vault")
	(KBD %<ASCII !\V>)
	(ACTION
	 <EXECUTE ()
		  <COND (<FSET? ,REAGENT ,SOLVED>
			 <TELL
"We never did discover the power of the reagent we had found. Astrix
said that mixing it with magical essences would provide greater
magical powers. Could a mixture have helped us get into the
vault?">
			 <UPDATE-REMOVE ,HINT-VAULT>)
			(<NOT <F&SET? ,HINT-VAULT ,EXAMINED>>
			 <TELL
"I feel the key to many things lies in the blue-green reagent that
Astrix told us about. We never found it, and this, perhaps, was
our greatest problem.">)
			(T <HINT-REAGENT ,HINT-VAULT>)>>)>

<OBJECT HINT-WOUNDS
	(SDESC "Wounds")
	(KBD %<ASCII !\W>)
	(ACTION
	 <EXECUTE ()
		  <COND (<FSET? ,REAGENT ,SOLVED>
			 <TELL
"We never did discover the power of the reagent we had found. Astrix
said that mixing it with magical essences would provide greater
magical powers. Could a mixture have helped us heal our wounds?">
			 <UPDATE-REMOVE ,HINT-WOUNDS>)
			(<NOT <F&SET? ,HINT-WOUNDS ,EXAMINED>>
			 <TELL
"I feel the key to many things lies in the blue-green reagent that
Astrix told us about. We never found it, and this, perhaps, was
our greatest problem.">)
			(T <HINT-REAGENT ,HINT-WOUNDS>)>>)>

<OBJECT HINT-STONES
	(SDESC "Stone Pile")
	(KBD %<ASCII !\S>)
	(ACTION
	 <EXECUTE ()
		  <COND (<AND <FSET? ,REAGENT ,SOLVED>
			      <NOT <F&SET? ,HINT-STONES ,SEEN>>>
			 <TELL
"I don't know for certain, but I suspect that one of the Stones was
hidden in the large pile that Praxix found in the castle dungeon. It
would take forever, I suppose, to have looked at every one, and even
then, how would it be distinguished? Was there some magic in Praxix'
possession that might have revealed it to him?">)
			(<FSET? ,REAGENT ,SOLVED>
			 <TELL
"We never did discover the power of the reagent we had found. Astrix
said that mixing it with magical essences would provide greater
magical powers. Could a mixture have helped us find the Stone I
suspect lay among the thousands?">
			 <UPDATE-REMOVE ,HINT-STONES>)
			(<NOT <F&SET? ,HINT-STONES ,EXAMINED>>
			 <TELL
"I feel the key to many things lies in the blue-green reagent that
Astrix told us about. We never found it, and this, perhaps, was
our greatest problem.">)
			(T <HINT-REAGENT ,HINT-STONES>)>>)>

<ROUTINE HINT-REAGENT (H)
	 <COND (<NOT <FSET? ,HIGH-PLAIN ,SCOUTED>>
		<TELL
"I think back, trying to piece together what we never explored, what
things we might have done. And then I think of that high ridge in the
mountains, high above the lake. We left there abruptly; was there
more to be seen there?">
		<REMOVE-HINT-REAGENT .H>)
	       (<NOT <F&SET? ,HERMIT-HUT ,SCOUTED>>
		<TELL
"And what of the hut and the hermit that lived inside? Did we explore
it? Did we learn what secrets may lie inside?">
		<REMOVE-HINT-REAGENT .H>)>>

<ROUTINE REMOVE-HINT-REAGENT (H)
	 <UPDATE-REMOVE .H>>

<OBJECT HINT-DIVERSION
	(SDESC "Diversion")
	(KBD %<ASCII !\D>)
	(SOLUTION
"I regret deeply the loss of our friend while saving Praxix. It would
seem that Praxix' idea was better than its execution. His magic got
the attention of the orcs, to be sure; but was there not other magic
that would have placed him outside of harm's way?")>

<OBJECT HINT-TREMOR
	(SDESC "Orc Fight")
	(KBD %<ASCII !\O>)
	(NUDGE
"We were trapped there, and it seems there was no alternative to
fighting the orcs to the bitter end. Yet Praxix seemed not altogether
convinced we were stuck there. And what of the water sounds nearby?")
	(SOLUTION
"I wonder what would have happened if Praxix had cast his tremor spell
at that point. Surely it could not have hurt!")>	 

<OBJECT HINT-DOOR
	(SDESC "Door")
	(KBD %<ASCII !\D>)
	(ACTION
	 <EXECUTE ()
		  <COND (<NOT <F&SET? ,MINE-HOLE ,SEEN>>
			 <TELL
"We never got through the door; neither did we finish exploring all
of the passageways nearby. This could well have been a mistake.">)
			(T
			 <TELL
"What was at the bottom of that dark hole? Was it too dangerous to
explore?">)>
		  <UPDATE-REMOVE ,HINT-DOOR>>)>

<OBJECT HINT-HOLE
	(SDESC "Hole")
	(KBD %<ASCII !\H>)
	(SOLUTION
"It seems obvious now that Praxix should have been sent into that dark
hole. How did we expect anyone else to get back out?")>

<OBJECT HINT-OLD-MINE
	(SDESC "Old Mine")
	(KBD %<ASCII !\O>)
	(ACTION
	 <EXECUTE ()
		  <COND (<NOT <F&SET? ,HINT-OLD-MINE ,SEEN>>
			 <TELL
"I do not see how this tragedy could have been avoided. If we were to
get the reagent we needed, what alternative did we have?">)
			(T <HINT-REAGENT ,HINT-OLD-MINE>)>>)>

<OBJECT HINT-INN
	(SDESC "Inn")
	(KBD %<ASCII !\I>)
	(ACTION HINT-MURDER)>

<OBJECT HINT-CAMPGROUND
	(SDESC "Campground")
	(KBD %<ASCII !\C>)
	(ACTION HINT-MURDER)>

<ROUTINE HINT-MURDER ()
	 <COND (<NOT <F&SET? ,ACTION-OBJECT ,SEEN>>
		<TELL
"We were warned by Astrix to be careful in Zan; clearly, someone knew
we were coming and knew how to find us.">)
	       (T
		<TELL
"How did they know we'd be staying at the ">
		<COND (<EQUAL? ,ACTION-OBJECT ,HINT-INN>
		       <TELL "inn">)
		      (T
		       <TELL "campground">)>
		<TELL "? ">
		<COND (<FSET? ,INN ,SEEN>
		       <TELL
"They asked at the inn, of course. We should have known not to trust
the innkeeper; knowing now what I did not know then, I'm sure we could have
fooled them.">)
		      (T
		       <TELL
"They may have checked at the inn and found out we were not staying there.
I suppose it would not have been hard to figure out that we had camped
outside of town.">)>
		<UPDATE-REMOVE ,ACTION-OBJECT>)>>

<OBJECT HINT-SOUTH-SEAS
	(SDESC "South Seas")
	(KBD %<ASCII !\S>)
	(SOLUTION
"As I look back, there were quite a few hints that this was the wrong boat to
choose. But, there must have been some sign, some help, to have guided us to
a better decision.")>

<OBJECT HINT-ELFENTIDE
	(SDESC "Elfentide")
	(KBD %<ASCII !\E>)
	(SOLUTION
"There was no avoiding the storm, and I cannot imagine a crew handling
themselves better. What a horrible sight to watch as our friend was struck
by the falling mast; would that the captain had acted! But how could we
have known - was there some sign to have guided us to a better decision?")> 

<OBJECT HINT-REEF
	(SDESC "Reef")
	(KBD %<ASCII !\R>)
	(NUDGE
"The mast would surely have broken if I had tried to get above the mist.
Was there another way of rising above it?")
	(SOLUTION
"Could Praxix have helped? Could he have elevated me? We shall never know.")>

<OBJECT HINT-JAIL
	(SDESC "Jail")
	(KBD %<ASCII !\J>)
	(ACTION
	 <EXECUTE ()
		  <COND (<NOT <F&SET? ,HINT-JAIL ,SEEN>>
			 <TELL
"We were trapped in the jail with no escape possible. There is no one to
blame, nothing we could have done.">
			 <RTRUE>)
			(<FSET? ,GRAY-REAGENT ,SOLVED>
			 <TELL
"I wonder about the gray reagent we had bought. Could some mixture
have helped us? If so, we would have done better to experiment before
getting caught!">)
			(<NOT <FSET? ,CURIO-SHOP ,SCOUTED>>
			 <TELL
"And yet, we did not explore everywhere in town. Not the curio shop,
at any rate.">)
			(<FSET? ,GRAY-STONE ,TRAPPED>
			 <TELL
"But why was Praxix so ornery; why didn't he ask to see some of the things
that were for sale in the curio shop? There might have been something
useful there.">)
			(<NOT <FSET? ,GRAY-STONE ,EXAMINED>>
			 <TELL
"Alas that we did not try to buy the gray stone. Later, Praxix confided
that it was a magical reagent, and its magic could have helped us.">)
			(<NOT <F&SET? ,HINT-JAIL ,SOLVED>>
			 <TELL
"Alas that we had nothing to trade for the gray stone. It was certainly
a magical reagent, and might have helped us escape from jail.">
			 <RTRUE>)
			(<NOT <FSET? ,STAIR-CHASM ,SEEN>>
			 <TELL
"I think back to all we had accomplished, everything we had seen: was there
any place we did not explore? Yes! The left stair in the caverns; but now
I will never know what lay along that path.">)
			(<NOT <FSET? ,FAR-CHASM ,SEEN>>
			 <TELL
"The chasm between the broken stairs! I don't know why, but it occurs to me
that we never found a way across. Could that have helped?">)
			(<NOT <FSET? ,SUNSET-TOWER ,SOLVED>>
			 <TELL
"The Sunset Tower: why do I feel that we have missed simething there? Was
there something hidden there?">)
			(T
			 <TELL
"The spyglass! Of course! Praxix said it was a priceless treasure!">)>
		  <UPDATE-REMOVE ,HINT-JAIL>>)>

<OBJECT HINT-FOG
	(SDESC "Demon")
	(KBD %<ASCII !\D>)
	(NUDGE
"Praxix was surprisingly absentminded in not figuring out the proper
mixture to create fog; I can think of at least two ways he might not
have resorted to guessing.")
	(SOLUTION
"First, he might have guessed at which two elements, in combination, would
most likely yield fog; second, he might have realized that there were only
two combinations whose effects he did not already know.")> 
	 
<OBJECT HINT-MAGIC
	(SDESC "Demon")
	(KBD %<ASCII !\D>)
	(ACTION
	 <EXECUTE ()
		  <COND (<NOT <F&SET? ,HINT-MAGIC ,BLUE-MIX>>
			 <TELL
"The fearsome demon was our final undoing. If I had only come up with
the proper mixture! And yet I am certain that I had seen or heard things
that could have helped me discover the relationship between the spells
and their colors. But what?">)
			(<NOT <FSET? ,TALE-MAGIC ,EXAMINED>>
			 <TELL
"First of all, I never had Praxix tell me about magic - that certainly
would have been useful!">
			 <UPDATE-REMOVE ,HINT-MAGIC>)
			(<NOT <F&SET? ,HINT-MAGIC ,GRAY-MIX>>
			 <TELL
"Yes, I recall having noted the color on Praxix' hands after casting
'Flare' to get us through the snaketrees.">)
			(T
			 <TELL
"The solution should be obvious; between what Praxix said to me about magic
and the color on his fingers, all I need now is a little common sense.">
			 <UPDATE-REMOVE ,HINT-MAGIC>)>>)>

<OBJECT HINT-MUDWARGS
	(SDESC "Mudwargs")
	(KBD %<ASCII !\M>)
	(ACTION
	 <EXECUTE ()
		  <COND (<NOT <FSET? ,BLACK-REAGENT ,SEEN>>
			 <TELL
"It was foolish to attempt to get past the mudwargs. Why didn't we stay
with Umber and seek his advice?">)
			(,BLACK-COUNT
			 <TELL
"The black reagent frightened Praxix, I am sure. Nevertheless, he might
have experimented more with the various combinations of mixtures.">)
			(T
			 <TELL
"I will never understand why Praxix never experimented with the black
reagent. Perhaps he had his reasons, but I have never understood what
they could be.">)>
		  <UPDATE-REMOVE ,HINT-MUDWARGS>>)>
	

;"Have you ever tried...."

<ROUTINE HAVE-YOU-EVER-TRIED? ("AUX" F)
	 <TELL
"At the end of the account of the Journey, the following was written in "
TAG "'s hand." CR CR>
	 <TELL
"I wonder what would have happened if..." CR>
	 <SET F <FIRST? ,HAVE-YOU-EVER>>
	 <TELL CR "... " <GETP .F ,P?SOLUTION>>
	 <REMOVE .F>
	 <COND (<FIRST? ,HAVE-YOU-EVER>
		<CHANGE-PARTY-COMMAND ,MUSINGS-COMMAND ,MORE-COMMAND>)
	       (T
		<REMOVE-PARTY-COMMAND ,MUSINGS-COMMAND>)>>

<COMMAND MORE <> ("AUX" F)
	 <SET F <FIRST? ,HAVE-YOU-EVER>>
	 <TELL CR "... " <GETP .F ,P?SOLUTION>>
	 <REMOVE .F>
	 <COND (<NOT <FIRST? ,HAVE-YOU-EVER>>
		<REMOVE-PARTY-COMMAND ,MORE-COMMAND>)>
	 <RTRUE>>

<OBJECT HAVE-YOU-EVER>

<OBJECT HYE-DRINKS
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"I had ordered one too many drinks at the tavern in Lavos.")>

<OBJECT HYE-DROP
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"I had tried dropping the rope, or something else of importance.")>

<OBJECT HYE-SPELLS
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix had used his magic when no magic was needed.")>

<OBJECT HYE-FIRE
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix had cast Blaze or Lightning at the Elves' fire.")>

<OBJECT HYE-RIVER
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix had cast Rain when we were on the raft in the river. It occurs to
me that he might not have had enough left after putting out the Elves'
fire, though.")>

<OBJECT HYE-GLOW
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix cast Glow on his already glowing staff.")>

<OBJECT HYE-TOWER
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix had cast Flare at the top of the Sunset Tower.")>

<OBJECT HYE-DIVERSION
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix had experimented with his Elevation spell before diverting the
orcs.")>

<OBJECT HYE-TANGLE
	;(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix had cast Rain in the grove of snaketrees.")>

<OBJECT HYE-INNKEEPER
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix had used the mind bending mixture on the innkeeper.")>

<OBJECT HYE-VOYAGE
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix had cast Rain or Lightning during our ocean voyage.")>

<OBJECT HYE-FOREBODING
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"we had figured out the meaning of the mixture of gray reagent and
air essence.")>

<OBJECT HYE-JAIL
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix had made me invisible in the jail cell and then gotten the
sheriff's attention.")>

<OBJECT HYE-MIST
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix had used his Wind spell when we were afloat in the mist
before knowing in which direction the Misty Isle lay.")>    

<OBJECT HYE-BOAT
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix had used his Wind or Elevation spells on the boat before
the storm.")>

<OBJECT HYE-STEAL
	(LOC HAVE-YOU-EVER)
	(SOLUTION
"Praxix had tried to steal the gray stone, rather than trading the
spyglass for it.")>

