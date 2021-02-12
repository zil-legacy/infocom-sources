"VOYAGE for
		      		JOURNEY
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<OBJECT BOAT-TWIN-ISLES
	(LOC BOAT)
	(SDESC "Twin Isles")
	(FLAGS DONT-TAKE)
	(KBD %<ASCII !\T>)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"Far off, near the southern horizon, we could see the Twin Isles of Estril
and Lethor. Between them, it seemed the sea itself grew dim and lost
definition." CR CR>
		 <TELL
"\"What do you make of that?\" " ACT " asked one of the crewmen working
nearby." CR CR>
		 <TELL
"\"Why, that's the Misty Isle,\" he responded, surprised that this was not
common knowledge. \"Sorry's the man that loses his way and enters those
sinister seas.\"">)>)>

<OBJECT BOAT-CREW
	(LOC BOAT)
	(SDESC "crew")
	(FLAGS DONT-TAKE)
	(KBD %<ASCII !\C>)
	(EXBITS PRAXIXBIT)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"Praxix, having never been to sea, was fascinated by the crew of the "
D ,CHOSEN-BOAT ". There were perhaps half a dozen of them, and each
was busily addressing himself to the various tasks and chores of
the seafaring life.">)>)>

<OBJECT BOAT-CAPTAIN
	(LOC BOAT)
	(SDESC "captain")
	(FLAGS DONT-TAKE DONT-EXAMINE)
	(KBD %<ASCII !\C>)
	(ACTION
	 <ACOND ()
		(<AND <ACTION? USE-MIX>
		      <EQUAL? ,MIXTURE ,BEND-WILL-SPELL>>
		 <COND (<EQUAL? ,CHOSEN-BOAT ,SOUTH-SEAS>
			;"Nasty captain..."
			<TELL
"I am certain now that Praxix ">
			<COND (<FSET? ,BEND-WILL-SPELL ,TRAPPED>
			       <TELL
"sensed the treachery that lurked within the
captain, for he cast the will bending spell at him. But it seemed that Praxix
was grappling with a will more powerful than his own - the will of the "
,BAD-GUY " himself. It was a losing battle - Praxix'">)
			      (T
			       <TELL
"did not anticipate the effect of the mixture he
cast upon the captain. At first, nothing seemed to happen, but soon
Praxix'">)>
			<TELL
" body soon began to writhe, and he clutched at his head as if to keep it
from splitting apart. And then, with a horrible scream, he fell to the ground
in a heap. I said nothing of this to the others, so overcome was I with
fear." CR CR>
			<FSET ,STORMY-SEAS ,TRAPPED>
			<MOVE-TO ,STORMY-SEAS>)
		       (T
			;"OK captain..."
			<TELL
"Perhaps Praxix was bored, but he decided to cast one of his mixtures at
the captain. Happily, the captain seemed not to mind the cloud of dust
that had been thrown in his face, though he did cough and sneeze a bit
for a while afterwards. As for the mixture itself, it seemed to have no
useful effect.">)>)>)> 

<OBJECT BOAT-SKY
      (LOC BOAT)
      (SDESC "sky")
      (FLAGS DONT-TAKE)
      (KBD %<ASCII !\S>)
      (EXBITS <+ ,PRAXIXBIT ,HURTHBIT>)
      (ACTION
       <ACOND ()
	      (EXAMINE:REMOVE
	       <TELL
"Above us and to the south, the sky was a brilliant blue. But a
fast-moving storm was approaching rapidly from the north. Every so
often, bolts of lightning danced among the clouds." CR CR>
	       <TELL
"\"Looks like rain,\" " ACT " said, in what turned out to be one of
the great understatements of our journey.">)>)>

<COMMAND RELAX>

<ROOM BOAT
      (TRAVEL-COMMANDS RELAX-COMMAND NUL-COMMAND NUL-COMMAND)
      (CAST-LIMIT INF)
      (GRAPHIC G-BOAT)
      (ENTER
       <EXECUTE ()
		<SAVE-SPELL ,FIRE-SPELL>
		<SAVE-SPELL ,TREMOR-SPELL>
		<TELL CR CR
"We were welcomed aboard by Captain " ,CAPTAIN ", who informed us that
the ship was ready to sail. It was nearly an hour before the sails were
raised and we were underway, but a favoring wind carried us swiftly to
the south. Soon, the faint outline of the Twin Isles appeared at the
horizon.">
		<COND (<EQUAL? ,CHOSEN-BOAT ,SOUTH-SEAS>
		       <FSET ,HERE ,FORBIDDING>
		       <CHECK-FOREBODING>)>>)
      (ACTION
       <ACOND ()
	      (RELAX
	       <MOVE-TO ,STORMY-SEAS>)
	      (CAST
	       <COND (<OBJECT? WIND-SPELL>
		      <REMOVE ,HYE-BOAT>
		      <TELL
"Praxix, feeling himself a captive, sought to amuse himself by casting
his wind spell. It was lucky that he used only a small amount of air
essence, for the resulting gale nearly capsized our craft, causing great
concern from the captain and crew." CR CR>
		      <TELL
"\"Promise you won't tell!\" Praxix said, seeing that I had observed the
whole thing.">)
		     (<OR <OBJECT? RAIN-SPELL>
			  <OBJECT? LIGHTNING-SPELL>>
		      <REMOVE ,HYE-VOYAGE>
		      <TELL
"Later, Praxix confided in me that he had considered casting the \""
AO "\" spell, but one look at the approaching clouds convinced him that
he could add nothing to what nature had in store.">)
		     (<OBJECT? LEVITATE-SPELL>
		      <REMOVE ,HYE-BOAT>
		      <TELL
"Bored to distraction by this ocean voyage, Praxix decided to get a
better look around, and cast his elevation spell on himself. Fifty
feet above decks, he gazed out toward the Twin Isles, much to the
surprise of the captain and crew, who had never seen such a magical
display before." CR CR>
		      <TELL
"\"Do you think it wise to flaunt your powers, Praxix?\" Bergon asked,
irritated at the Wizard's display." CR CR>
		      <TELL
"\"I suppose you are right,\" Praxix replied, \"but being at sea makes me
rather nervous.\"">)>)
	      (SCOUT:REMOVE
	       <MAKE-BUSY ,ACTOR ,GONE-COMMAND>
	       <TELL ACT
" then went off to explore the boat; in fact, there was little else to
do.">)>)>

<OBJECT STORMY-SEAS-BOAT
	(LOC STORMY-SEAS)
	(SDESC "boat")
	(KBD %<ASCII !\B>)
	(FLAGS DONT-TAKE)
	(EXBITS <+ ,PRAXIXBIT ,ESHERBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"The boat was badly damaged by the storm; the mizzenmast had collapsed
and fallen into the ocean; the main mast still stood, though it was
heavily weakened and appeared ready to fall under its own weight. The
main sail, though ripped, was serviceable, but the rudder had been destroyed,
making steering all but impossible." CR CR>
		 <TELL
"\"What a mess,\" said " ACT ", who had not yet recovered from the
shock." CR CR>
		 <TELL
"\"What are we to do?\" I asked, \"Not only the air is still, but - see
here - the ocean itself is perfectly still and glassy. I think I understand
why it is that people never return from this place.\"">)>)>

<COMMAND CLIMB-MAST>

<GLOBAL SPOTTED-ISLAND? <>>
<GLOBAL TRIED-CASTING-WIND? <>>

<ROOM STORMY-SEAS
      (TRAVEL-COMMANDS NUL-COMMAND NUL-COMMAND NUL-COMMAND)
      (CAST-LIMIT INF)
      (ENTER TELL-STORM)
      (FLAGS DANGEROUS DONT-SCOUT)
      (ACTION
       <ACOND ()
	      (CLIMB-MAST:REMOVE
	       <COND (,TRIED-CASTING-WIND?
		      <TELL
"I tried to locate the Misty Isle">)
		     (T
		      <TELL
"I tried to gain some view of our situation">)>
	       <TELL
" by climbing the mast, but it shook so badly as I clambered up that I became
frightened and returned to the deck." CR CR>
	       <TELL
"\"A wise decision,\" Praxix said, \"You will do us no good by falling from
the mast.\"">)
	      (PROCEED
	       <ILL-WIND>)
	      (STOP
	       <TELL
"Thinking it better to hold off for the moment, Praxix put his
air essence away and considered what to do next.">
	       <END-OPTION>)
	      (CAST
	       <COND (<OBJECT? FAR-VISION-SPELL>
		      <TELL
"It seemed worthwhile to try Praxix' flare spell, but his fireball
was enveloped by the gloom almost as it left his fingertips.">)
		     (<OBJECT? WIND-SPELL>
		      <COND (,SPOTTED-ISLAND?
			     <TELL
"Using my fix on the island as a reference, Praxix cast his wind spell
into the air. The wind blew fiercely, as the " D ,CHOSEN-BOAT " made
its way through the fog. It was only minutes later when we escaped
the fog; an island was ahead..." CR CR>
			     <TELL
"\"The Misty Isle,\" said Praxix, \"And, wouldn't you know it - it's
not even misty!\"" CR CR>
			     <COND (,DEMON-SEARCHING?
				    <DEMON-TELL>)
				   (T
				    <ISLAND-ENDING>)>)
			    (,TRIED-CASTING-WIND?
			     <REMOVE ,HYE-MIST>
			     <ILL-WIND>)
			    (T
			     <SETG TRIED-CASTING-WIND? T>
			     <TELL
"Praxix started to remove the air essence from his pouch, but
was struck with a dilemma." CR CR>
			     <TELL
"\"From which direction shall the wind blow?\" he asked me, not
expecting an answer." CR CR>
			     <TELL
"I answered anyway, trying to make light of our desperate situation.
\"Onshore,\" I said.">
			     <OPTION ,PRAXIX
				     ,PROCEED-COMMAND
				     ,STOP-COMMAND>)>)
		     (<AND <OBJECT? LEVITATE-SPELL>
			   <NOT ,SPOTTED-ISLAND?>>
		      <SETG SPOTTED-ISLAND? T>
		      <TELL
"Praxix whipped up a large batch of his elevation spell and cast it
at me. I had risen only a few dozen feet before I lost sight of the deck,
and then I climbed a long time more, terrified by the gray nothingness
that surrounded me. And then, I cleared the mist and was suspended in
the clear afternoon air. Before me, an island stood, basking in the
warmth of a cloudless sky." CR CR>
		      <GRAPHIC ,G-ABOVE-FOG>
		      <TELL
"Slowly, I descended to the deck, indicating to Praxix in which direction
the island lay." CR CR>
		      <TELL
"\"Well, well,\" he said, \"We may survive this voyage after all!\"">)>)>)>

<ROUTINE ILL-WIND ()
	 <TELL
"\"Ah, well,\" Praxix said, finishing the preparation of his wind spell,
\"it can't be any worse than sitting here in the fog!\"" CR CR>
	 <TELL
"But he was wrong - it was far worse. He flung the powder into the air, and
a gale blew. For a time, it seemed we were sailing smoothly, but then we
ran into a submerged reef. The " D ,CHOSEN-BOAT " listed, then capsized,
and I lost track of Praxix in the mist." CR CR>
	 <TELL
"But it was my good fortune to have been saved by the boat's main mast.">
	 <TELL ,WAVE-SAVE>
	 <HINT ,HINT-REEF>
	 <BAD-ENDING>>

<COMMAND STOP>

<ROUTINE TELL-STORM ()
	 <COND (<NOT <FSET? ,STORMY-SEAS ,TRAPPED>>
		<TELL
"And so we settled in; Bergon with the captain, the rest of us exploring
one part of the ship or another. ">)>
	 <TELL
"The sky had now darkened, and though
it was barely noon, it could as well have been twilight. The storm was
nearly upon us, and the sound of thunder, once distant, now rumbled
overhead." CR CR>
	 <COND (<EQUAL? ,CHOSEN-BOAT ,SOUTH-SEAS>
		<TELL
"And then, disaster struck; the crew, on the command of Captain Stegg,
drew their weapons and attacked our party, catching us entirely by
surprise. As I watched in abject horror, Bergon was butchered by a pair
of crewmen using battle axes and bludgeons.">
		<COND (<NOT <FSET? ,STORMY-SEAS ,TRAPPED>>
		       <TELL
" Praxix was soon cornered and his throat slit by another
pair of assassins.">)>
		<GRAPHIC ,G-TREACHERY>
		<COND (<G? ,PARTY-MAX 3>
		       <TELL
" As for the others, I cannot but think they met a similar fate.">)>
		<TELL CR CR
"That I was saved is a strange twist of fate, for the storm unleashed
its violence upon the ship just as I had run into a dead-end in a frantic
attempt to escape my pursuers. And just as all hope faded, a stroke of
lightning shattered the main mast, which in its fall killed my assailants
and cast me into the churning sea." CR CR>
		<TELL
"I soon lost sight of the South Seas, but again its main mast saved
my life.">
		<HINT ,HINT-SOUTH-SEAS>
		<TELL ,WAVE-SAVE>
		<BAD-ENDING>)
	       (T
		<TELL
"The seas became rough, and soon the rains fell, but Captain " ,CAPTAIN
" chose to continue onward." CR CR>
		<TELL
"The air took on a pungent aroma as lightning lit up the now darkened
sky. Crewmen cowered as the sky thundered around us." CR CR>
		<TELL
"\"Be stout, men,\" shouted the captain, as he implored his men to lower
the sails. But it was too late! A stroke of lightning shattered the
mizzenmast, which in its fall headed directly at Bergon, still standing
standing at the wheelhouse with the captain." CR CR>
		<GRAPHIC ,G-MAST-FALLS>
		<COND (<EQUAL? ,CHOSEN-BOAT ,ZEPHYR>
		       <TELL
"But Calfon, ignoring the danger to himself, pushed Bergon out of harm's
way, saving his life. The captain himself was knocked overboard, and seeing
the destruction around them, the crew abandoned ship, leaving only the ">
		       <TELL <GET ,INT-STR ,PARTY-MAX>>
		       <TELL " of us aboard.">)
		      (T
		       <TELL ,CAPTAIN
" watched as the mast struck Bergon, knocking him overboard and into
the tumultuous sea, where he was soon lost to our sight. The captain,
certain that the ship would soon capsize, ordered his men to the lifeboats.
But our group decided to remain on board, fearing to take to the seas in
such small craft." CR CR>
		       <TELL
"\"Don't be fools,\" the captain called to us as he dropped his dinghy
into the waves, \"The boat's about to capsize!\"">
		       <HINT ,HINT-ELFENTIDE>
		       <PARTY-REMOVE ,BERGON>)>
		<TELL CR CR
"It was hours later that the storm abated, but we rode it out without harm
to ourselves. The darkness lifted, but we were now approaching a wall of
fog; though we felt no wind, yet it seemed we were drawn inexorably toward
it. All too suddenly, the mist enveloped us and an eerie silence settled
over the boat." CR CR>
		<TELL
"\"The sea has borne us into the mist,\" Praxix said, staring into the
shimmering gloom. \"The Misty Isle is near at hand!\"">
		<ADD-TRAVEL-COMMAND ,HERE ,CLIMB-MAST-COMMAND>
		<GRAPHIC ,G-BOAT-FOG>)>>

<CONSTANT WAVE-SAVE
" Tossed with me into the tumult, it had split in two, its
larger piece intact and floating on the waves. Grabbing hold of that
precious flotsam, I pulled myself up and fell unconscious atop it.
The next day, the storm having passed, I was found by passing fishermen
and taken back to Zan where, after a few sleepless nights, I booked
passage to Lendros, and my home in the plains.">

<OBJECT PRAXIX-POUCH
	(SDESC "Praxix' pouch")
	(12DESC "pouch")
	(KBD %<ASCII !\P>)
	(FLAGS DONT-EXAMINE)
	(ACTION
	 <ACOND ()
		(PICK-UP
		 <UPDATE-FSET ,PRAXIX-POUCH ,DONT-TAKE>
		 <SETG TAG-HOLDING-POUCH T>
		 <TRAVEL-COMMANDS ,TAG ,MIX-COMMAND>
		 <TELL
"Lying beside Praxix was his pouch of magical powders, and, as
discreetly as I could, I picked them up. Inside the pouch were
four smaller bags, each with a different colored powder: red,
blue, yellow, and white." CR CR>
		 <TELL
"I tried to think what Praxix would do, what he was trying to
do, when he was struck down by this messenger of evil. ">
		 <COND (<FSET? ,LIGHTNING-SPELL ,SEEN>
			<TELL "And then
it occurred to me: lightning, which">)>
		 <COND (<NOT <FSET? ,LIGHTNING-SPELL ,SEEN>>
			<TELL
"I thought about the various spells that Praxix had cast during our
journey, but none seemed powerful enough. Perhaps Praxix had a spell
to call forth a bolt of lightning, but even so, I had no idea of which
combination of essences would produce it?">)
		       (<FSET? ,LIGHTNING-SPELL ,INCAPACITATED>
			<TELL ", I remembered, was a mixture
of fire and water essences, with just a pinch of earth essence.
The only problem was: which essence was which?">)
		       (T
			<TELL " I suspected would be the
combination of fire and water essences. The only problem was: which essence
was which?">
		        <COND (<FSET? ,TALE-MAGIC ,SEEN>
			       <TELL
" And was there a third essence involved, as Praxix said was
sometimes the case?">)>
			<RTRUE>)>)>)>

<GLOBAL TAG-HOLDING-POUCH <>>

<GLOBAL DEMON-COUNT -1>

<OBJECT DEMON-DEMON
	(TIME 0)
	(ACTION
	 <EXECUTE ()
		  <SETG DEMON-COUNT <+ ,DEMON-COUNT 1>>
		  <TELL CR CR>
		  <COND (<ZERO? ,DEMON-COUNT>
			 <TELL
"\"We know who you are, and we know what you seek,\" the demon continued,
\"but you will be needing a lesson in manners.\"">)
			(<EQUAL? ,DEMON-COUNT 1>
			 <TELL
"\"Let me see,\" the demon went on, \"Who, do you suppose, should receive
this lesson?\"">)
			(<EQUAL? ,DEMON-COUNT 2>
			 <SETG DEMON-VICTIM
			       <FIRST-IN-PARTY ,HURTH ,ESHER ,MINAR ,BERGON>>
			 <TELL
"\"Praxix will not do,\" the demon spat, \"I would not like
to be accused of destroying one so defenseless. No, I believe the
honor should go to " D ,DEMON-VICTIM ".\"">)
			(<EQUAL? ,DEMON-COUNT 3>
			 <TELL
"\"" D ,DEMON-VICTIM ", rise!\" the demon ordered, and, face contorted
hideously, the demon's victim stood and approached the foul monster.">)
			(T
			 <PARTY-REMOVE ,DEMON-VICTIM>
			 <TELL
"And then, the demon stretched out his arm, hand open, at " D ,DEMON-VICTIM
" and, as he slowly closed his hand, it seemed that " D ,DEMON-VICTIM " was
being squeezed mercilessly; he screamed in agony as he demon's fist closed
ever tighter. Moments later, he was dead, crushed by this awful monster
from hell." CR CR>
			 <TELL
"\"The same fate, or worse, awaits all those who seek to defy the " ,BAD-GUY
". This is but a taste of what is to follow.\" Then, he swung his arm to his
side and opened his clenched fist; " D ,DEMON-VICTIM "'s body was flung off
boat and into the ocean waters." CR CR>
			 <TELL
"Mounting the awful creature that had borne him here, he flew off into
the distant north.">
			 <END-DEMON>)>>)>

<GLOBAL DEMON-VICTIM <>>

<ROUTINE DEMON-TELL ()
	 <QUEUE DEMON-DEMON -1>
	 <REMOVE-TRAVEL-COMMAND ,HERE ,CLIMB-MAST-COMMAND>
	 <UPDATE-MOVE ,PRAXIX-OBJECT ,HERE>
	 <TELL
"We were drifting on the waves, moving ever closer to the Misty Isle,
when a dark shadow passed over the boat. Black as the darkest
caverns, it seemed to hover, formless, in the sky above us. And then,
with a terrifying scream, it dove down upon us, landing on the prow
of the boat." CR CR>
	 <TELL
"It was a huge black bird, hideous and foul, and reeking with a
noisome stench. On its back rode a man who, in form at least,
appeared to be a Wizard, though his face was masked completely by
his flowing black hood.">
	 <COND (<FSET? ,ZAN-TAVERN ,SEEN>
		<TELL
" And then, I remembered: this was the man we
had seen at the tavern; the one who had arranged for our deaths!">)>
	 <GRAPHIC ,G-DEMON>
	 <TELL CR CR
"\"At last I have found you,\" he said darkly, \"You have been most
clever to have eluded me and my associates in Zan. But, as you will
soon learn, the arm of the Dread Lord grows longer with each passing
hour and there are none who can escape his judgement.\"" CR CR>
	 <TELL
"Praxix, meanwhile, was hurriedly removing his pouch of magical essences
in the hopes of foiling this demon of darkness." CR CR>
	 <TELL
"\"Fool!\" the demon boomed, and from his fingertips shot a bolt of
red-hot flame that knocked Praxix to the ground, unconscious. \"I have no
time for parlor magicians,\" he said mockingly.">
	 <UPDATE-MOVE ,PRAXIX-POUCH ,HERE>
	 <MAKE-BUSY ,PRAXIX ,ILL-COMMAND>
	 <NEW-DEFAULT <PARTY-PCM ,TAG> 1>>

<OBJECT TAG-POWDERS
	(SDESC "mixture")
	(ACTION
	 <ACOND ()
		(CAST
		 <COND (<AND <EQUAL? ,TAG-SPELL ,LIGHTNING-SPELL>
			     <EQUAL? ,TAG-PINCH ,ESSENCE-EARTH>>
			;<GRAPHIC ,G-DEMON-KILLED>
			<TELL
"The time seemed right, so I flung the mixture of essences at the demon;
as an added touch, I grabbed Praxix' staff and pointed it at him as well. 
The clouds approached, and before the demon could react, a single bolt of
lightning was hurled from the sky, smiting the demon and the evil creature
that had borne him here." CR CR> 
			<TELL
"But as the smoking remains of these messengers of evil rose into the sky,
so did another shape, forming itself from the very ashes. Its face was
a pale gray, its eyes a fiery red." CR CR>
			<TELL
"\"You are fortunate to have defeated my servant,\" it said in a dark
whisper, \"but, after all, he was merely flesh and blood, as was the poor
creature that carried him here.\"" CR CR>
			<TELL
"And then, his eyes turned to me, and his gaze seemed to burn by skin.
\"I shall make it a point that we meet again; and then, we shall see...\"
The smoke dissipated, and the voice trailed off into nothingness." CR CR>
			<GRAPHIC ,G-EVIL-ONE>
			<TELL
"Praxix, having missed the whole thing, now regained consciousness, and
I told him what had happened." CR CR>
			<TELL
"\"Well, well,\" he said, proudly. \"We shall be making a Wizard of
you yet!\"">
			<END-DEMON>)
		       (T
			<SETG DEMON-COUNT 10>
			;"More than enough..."
			<HINT ,HINT-MAGIC>
			<TELL
"As soon as the mixture left my fingertips, I knew I had failed. For
what happened was that ">
			<COND (<EQUAL? ,TAG-SPELL ,LIGHTNING-SPELL>
			       <TELL
"the clouds gathered slowly, and a few small bolts of lightning appeared,
though they did not nearly reach the earth.">) 
			      (<EQUAL? ,TAG-SPELL ,LEVITATE-SPELL>
			       <TELL
"the demon seemed to rise into the air! I had cast a spell of elevation
on him, and he merely laughed at my futile effort.">)
			      (<EQUAL? ,TAG-SPELL ,MUD-SPELL>
			       <TELL
"the ground before us turned soft and squishy; I had cast some sort of
mud producing spell, and the demon laughed hideously at my ridiculous
effort.">)
			      (<EQUAL? ,TAG-SPELL ,LIGHT-SPELL>
			       <TELL
"the demon's cape started to glow faintly - I had cast the glow spell
my mistake!">)
			      (<EQUAL? ,TAG-SPELL ,FOG-SPELL>
			       <TELL
"a thick fog started to form around us; the demon blew it away with a
powerful breath! I had prepared the wrong mixture!">)
			      (<EQUAL? ,TAG-SPELL ,FAR-VISION-SPELL>
			       <TELL
"a fireball flew from my fingertips, passing the demon by harmlessly -
in my haste, I had prepared the wrong mixture!">)
			      (T
			       <TELL "a bug occurred in the game.">)>)>)>)>  

<OBJECT PRAXIX-OBJECT
	(SDESC "Praxix")
	(FLAGS DONT-TAKE)
	(EXBITS ESHERBIT)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL ACT
" went over to where Praxix lay and examined him thoroughly." CR CR>
		 <TELL
"\"He isn't hurt badly,\" he said." CR CR>
		 <TELL
"\"How very thoughful you are, " ACT ". I have not killed your Wizard friend
- at least not yet,\" the demon boomed. \"But now to business.\"">)>)>

<ROUTINE END-DEMON ()
	 <TELL CR CR
"The demon was gone, and we had hardly noticed that we had drifted up to
the very shore of the Misty Isle." CR CR>
	 <CLEAR-BUSY>
	 <RESTORE-TAG-COMMANDS>
	 <REMOVE ,PRAXIX-OBJECT>
	 <UPDATE-REMOVE ,PRAXIX-POUCH> 
	 <REMOVE ,DEMON-DEMON>
	 <ISLAND-ENDING>>

<GLOBAL TAG-SPELL <>>

<GLOBAL TAG-COLOR <>>

<GLOBAL TAG-PINCH <>>

<ROUTINE TAG-POWDER-MIX ("AUX" OFF)
	 <COND (<ACTION? MIX>
		<SET OFF <GETP ,ACTION-PRSI ,P?TEMP>>
		<SETG TAG-COLOR <GET <GETPT ,ACTION-OBJECT ,P?MIX-COLOR> .OFF>>
		<SETG TAG-SPELL <GET-SPELL ,ACTION-OBJECT ,ACTION-PRSI>>
		<REMOVE ,ACTION-OBJECT>
		<REMOVE ,ACTION-PRSI>
		<TELL
"Trying not to attract the attention of the demon, I quietly mixed
roughly equal amounts of " AO " and " D ,ACTION-PRSI ", and hoped
the resulting combination would create a powerful lightning spell.
In any event, it seemed I would soon find out.">
		<PUTP ,TAG-RED-POWDER ,P?PRSI <>>
		<PUTP ,TAG-BLUE-POWDER ,P?PRSI <>>
		<PUTP ,TAG-YELLOW-POWDER ,P?PRSI <>>
		<PUTP ,TAG-WHITE-POWDER ,P?PRSI <>>
		<TRAVEL-COMMANDS ,TAG ,CAST-COMMAND ,ADD-PINCH-COMMAND>)>>

<COMMAND ADD-PINCH O-ADD-PINCH ()
	 <SETG TAG-PINCH <GETP ,ACTION-OBJECT ,P?ESSENCE>>
	 <TRAVEL-COMMANDS ,TAG ,CAST-COMMAND>
	 <TELL
"Then, I added to the mixture just the smallest pinch of the " AO ".">>

<ROUTINE O-ADD-PINCH ("AUX" F)
	 <PUT ,O-TABLE 0 2>
	 <SET F <FIRST? ,TAG-POWDERS>>
	 <PUT ,O-TABLE 1 .F>
	 <COND (.F
		<PUT ,O-TABLE 2 <NEXT? .F>>)>>

<OBJECT TAG-RED-POWDER
	(LOC TAG-POWDERS)
	(SDESC "red powder")
	(KBD %<ASCII !\R>)
	(PRSI PRSI-TAG-POWDERS)
	(TEMP 0)
	(ESSENCE 0)
	(MIX-COLOR "?" "violet" "orange" "pink")
	(ACTION TAG-POWDER-MIX)>

<OBJECT TAG-BLUE-POWDER
	(LOC TAG-POWDERS)
	(SDESC "blue powder")
	(KBD %<ASCII !\B>)
	(PRSI PRSI-TAG-POWDERS)
	(TEMP 1)
	(ESSENCE 0)
	(MIX-COLOR "violet" "?" "green" "pale blue")
	(ACTION TAG-POWDER-MIX)>

<OBJECT TAG-YELLOW-POWDER
	(LOC TAG-POWDERS)
	(SDESC "yellow powder")
	(12DESC "yellow pwdr")
	(KBD %<ASCII !\Y>)
	(TEMP 2)
	(ESSENCE 0)
	(MIX-COLOR "orange" "green" "?" "pale yellow")
	(PRSI PRSI-TAG-POWDERS)
	(ACTION TAG-POWDER-MIX)>

<OBJECT TAG-WHITE-POWDER
	(LOC TAG-POWDERS)
	(SDESC "white powder")
	(KBD %<ASCII !\W>)
	(PRSI PRSI-TAG-POWDERS)
	(TEMP 3)
	(ESSENCE 0)
	(MIX-COLOR "pink" "pale blue" "pale yellow" "?")
	(ACTION TAG-POWDER-MIX)>

<ROUTINE PRSI-TAG-POWDERS ()
	 <COND (<EQUAL? ,ACTION-OBJECT ,TAG-RED-POWDER>
		<PRSI-SETUP ,TAG-BLUE-POWDER
			    ,TAG-WHITE-POWDER
			    ,TAG-YELLOW-POWDER>)
	       (<EQUAL? ,ACTION-OBJECT ,TAG-BLUE-POWDER>
		<PRSI-SETUP ,TAG-RED-POWDER
			    ,TAG-WHITE-POWDER
			    ,TAG-YELLOW-POWDER>)
	       (<EQUAL? ,ACTION-OBJECT ,TAG-WHITE-POWDER>
		<PRSI-SETUP ,TAG-RED-POWDER
			    ,TAG-BLUE-POWDER
			    ,TAG-YELLOW-POWDER>)
	       (T
		<PRSI-SETUP ,TAG-RED-POWDER
			    ,TAG-BLUE-POWDER
			    ,TAG-WHITE-POWDER>)>
	 <PRSI-INPUT "with">>