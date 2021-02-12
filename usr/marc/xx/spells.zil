"SPELLS for
		      		JOURNEY
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<GLOBAL DONT-CAST-FLAG <>>

<OBJECT ALWAYS-SPELLS>

<ROUTINE PRAXIX-TOO-DANGEROUS-TO-CAST () 
	 <TELL
"Praxix thought to cast the \"" AO "\" spell, but we agreed that the
situation was far too dangerous to allow it.">
	 <CHECK-CAST-LIMIT>>

<ROUTINE CHECK-CAST-LIMIT ("AUX" (CL <GETP ,HERE ,P?CAST-LIMIT>))
	 <FSET ,ACTION-OBJECT ,TRIED>
	 <COND (<OR <FSET? ,HERE ,SINGLE-CAST>
		    <EQUAL? .CL 1>>
		<UPDATE-FSET ,HERE ,DONT-CAST>
		<SETG DONT-CAST-FLAG T>)
	       (<G? .CL 1>
		<PUTP ,HERE ,P?CAST-LIMIT <- .CL 1>>)>
	 <RTRUE>>

<ROUTINE PRAXIX-NO-CAST ()
	 <COND (<NOT ,SUBGROUP-MODE>
		<TELL
"Praxix suggested using the \"" AO "\" spell, but " <I/WE 2> " convinced him">)
	       (T
		<TELL
"Praxix' mind, working rapidly, thought of using the \"" AO "\" spell,
but he soon convinced himself">)>
	 <TELL " that it would be a waste of time under the circumstances.">
	 <CHECK-CAST-LIMIT>>

<GLOBAL RED-ROCK-COUNT 2>

<OBJECT INVISIBLE-SPELL
	(SDESC "Invisibility")
	(KBD %<ASCII !\I>)
	(TEMP 0)
	(ACTION
	 <EXECUTE ()
		  <COND (<PRE-SPELL> T)
			(T
			 <TELL
"Praxix reached into his cloak and took out the red invisibility
powder; there was enough left for at most ">
			 <TELL <GET ,INT-STR ,RED-ROCK-COUNT> " use">
			 <COND (<NOT <EQUAL? ,RED-ROCK-COUNT 1>>
				<TELL "s">)>
			 <TELL ", and this did not seem
like the best situation to waste the precious material.">
			 <CHECK-CAST-LIMIT>)>>)>

<ROUTINE CAST-INVISIBLE ("OPTIONAL" (ZT <>))
	 <SETG RED-ROCK-COUNT <- ,RED-ROCK-COUNT 1>>
	 <COND (<ZERO? ,RED-ROCK-COUNT>
		<UPDATE-REMOVE ,INVISIBLE-SPELL>
		<COND (.ZT
		       <TELL CR CR
"That was the last of the invisibility powder, and we were all sorry
to see it go.">)>)>
	 <RTRUE>> 

<OBJECT WIND-SPELL
	(LOC ALWAYS-SPELLS)
	(SDESC "Wind")
	(TEMP 0)
	(KBD %<ASCII !\W>)
	(ACTION
	 <EXECUTE ()
		  <COND (<PRE-SPELL> T)
			(T
			 <TELL
"Praxix reached into his cloak and brought forth some air essence.
As he tossed it into the air, a great wind came up, almost knocking
us off our feet. When the wind subsided, " D ,LEADER
" quite reasonably asked, \"What was that for?\"" CR CR>
			 <TELL
"\"What, the wind?\" Praxix replied. \"Oh! Just testing, just
testing.\"">
			 <CHECK-CAST-LIMIT>)>>)>

<OBJECT RAIN-SPELL
	(LOC ABOVEGROUND-SPELLS)
	(SDESC "Rain")
	(TEMP 0)
	(KBD %<ASCII !\R>)
	(ACTION
	 <EXECUTE ()
		  <COND (<PRE-SPELL> T)
			(T
			 <TELL
"Praxix reached into his cloak and brought forth a little bit of
water essence. He cast it into the air, and soon clouds gathered
and a light rain fell on us. It lasted only a minute, but it
was refreshing nonetheless.">
			 <CHECK-CAST-LIMIT>)>>)>

<ROUTINE PRE-SPELL ()
	 <COND (<OR <FSET? ,HERE ,DANGEROUS>
		    <FSET? ,SCENE-OBJECT ,DANGEROUS>>
		<PRAXIX-TOO-DANGEROUS-TO-CAST>
		<RTRUE>)
	       (<OR ,SUBGROUP-MODE
		    <EQUAL? ,PRAXIX ,LEADER>
		    <FSET? ,ACTION-OBJECT ,TRIED>>
		<PRAXIX-NO-CAST>
		<RTRUE>)>>

<OBJECT TREMOR-SPELL
	(LOC ALWAYS-SPELLS)
	(SDESC "Tremor")
	(TEMP 0)
	(KBD %<ASCII !\T>)
	(ACTION
	 <EXECUTE ()
		  <COND (<PRE-SPELL> T)
			(T
			 <TELL
"Praxix reached into his cloak and brought forth some earth essence. ">
			 <COND (<FSET? ,HERE ,UNDERGROUND>
				<TELL
"But then, fearing for the safety of the party, he replaced it.">)
			       (T
				<TELL
"As he tossed it onto the ground, there was a violent
shaking from within the earth. Fortunately, nobody was hurt by this
display of magical heroics.">)>
			 <CHECK-CAST-LIMIT>)>>)> 

<OBJECT LEVITATE-SPELL
	(LOC ALWAYS-SPELLS)
	(SDESC "Elevation")
	(TEMP 0)
	(KBD %<ASCII !\E>)
	(ACTION
	 <EXECUTE ()
		  <COND (<PRE-SPELL> T)
			(T
			 <TELL
"Perhaps as a joke, Praxix took some air essence and earth essence out
of his cloak, mixed them in his hand, and flung them at " D ,LEADER ".">
			 <TELL CR CR
"He scowled as he rose into the air about ten feet, then (a long minute later)
he slowly fell back to earth, amid a chorus of laughter from the rest of the
party. \"Works like it should!\" Praxix said, proudly. \"Do not be cross!
We may have need for such things!\"">
			 <CHECK-CAST-LIMIT>)>>)>

<OBJECT ABOVEGROUND-SPELLS>

<OBJECT FOG-SPELL
	(SDESC "Fog")
	(TEMP 0)
	(KBD %<ASCII !\F>)
	(ACTION PRAXIX-DEFAULT-CAST)>

<OBJECT MUD-SPELL
	(SDESC "Mud")
	(TEMP 0)
	(KBD %<ASCII !\M>)
	(ACTION PRAXIX-DEFAULT-CAST)>

<OBJECT LIGHTNING-SPELL
	(LOC ABOVEGROUND-SPELLS)
	(SDESC "Lightning")
	(TEMP 0)
	(KBD %<ASCII !\L>)
	(ACTION
	 <EXECUTE ()
		  <COND (<PRE-SPELL> T)
			(T
			 <TELL
"Praxix raised a finger to the wind, then took a quick glance at the sky.
The rest of us looked on in bewilderment as Praxix
removed some fire and water essences from his pouch and mixed them carefully
in his hand. Finally, he added just the smallest amount of earth essence
and cast the combination into the sky while aiming his staff at a nearby
piece of earth." CR CR>
			 <TELL
"A moment later, the sky was filled with clouds. A dull rumble of
thunder preceded a single bolt of white lightning which smote the ground
at which Praxix' staff was still pointing.">
			 <COND (<NOT <F&SET? ,LIGHTNING-SPELL ,INCAPACITATED>>
				<TELL CR CR
"Praxix, proud of his accomplishment, turned to me and said, \"It's
that tiny bit of earth essence that gives the lightning spell its
extra punch!\" Then, he turned to the others and spoke.">)>
			 <TELL CR CR
"\"It's quite exciting to watch,\" he said, \"and sometimes it is
even helpful!\"">
			 <COND (<IN-PARTY? ,ESHER>
				<TELL CR CR
"\"I assume you'll let us know when that is,\" Esher said, derisively.">
				<TELL CR CR
"Praxix frowned and replied, \"I shall make it a point that you are
the first to know.\"">)>
			 <FSET ,LIGHTNING-SPELL ,SEEN>
			 <CHECK-CAST-LIMIT>)>>)>

<ROUTINE PRAXIX-DEFAULT-CAST ()
	 <COND (<OR <FSET? ,HERE ,DANGEROUS>
		    <FSET? ,SCENE-OBJECT ,DANGEROUS>>
		<PRAXIX-TOO-DANGEROUS-TO-CAST>)
	       (T <PRAXIX-NO-CAST>)>>

<OBJECT FIRE-SPELL
	(LOC ABOVEGROUND-SPELLS)
	(SDESC "Blaze")
	(TEMP 0)
	(KBD %<ASCII !\B>)
	(ACTION
	 <EXECUTE ()
		  <COND (<PRE-SPELL> T)
			(T
			 <TELL
"Praxix took out his fire essence and cast it on the ground before
our feet. The spot burst into a white-hot flame that died out only
a few moments later." CR CR>
			 <TELL
"\"Quite useful,\" Praxix said, mainly to himself. \"Keeping away
dangerous beasts, cooking meals, warming up a cold campsite. One never
knows when a good fire will be needed!\"">
			 <CHECK-CAST-LIMIT>)>>)>	

<OBJECT UNDERGROUND-SPELLS>

<OBJECT LIGHT-SPELL
	(LOC UNDERGROUND-SPELLS)
	(SDESC "Glow")
	(TEMP 0)
	(KBD %<ASCII !\G>)
	(ACTION CAST-LIGHT)>

<OBJECT FAR-VISION-SPELL
	(LOC ALWAYS-SPELLS)
	(SDESC "Flare")
	(TEMP 0)
	(KBD %<ASCII !\F>)
	(ACTION CAST-FAR-VISION)>
		
<ROUTINE CAST-LIGHT ()
	 <COND (<NOT <FSET? ,HERE ,UNDERGROUND>>
		<TELL
"Presumably for practice, or perhaps out of boredom, Praxix removed his
pouch of magical essences and, combining two of them, applied the resulting
mixture to his staff which started to glow a faint red color." CR CR>
		<TELL
"\"Gotten me out of many a tight spot,\" he said without explanation.">
		<CHECK-CAST-LIMIT>)
	       (<AND <NOT <F&SET? ,PRAXIX ,LIT>>
		     <NOT ,SUBGROUP-MODE>>
		<TELL
"You can imagine our surprise when, in this deepest gloom, Praxix' staff
began to glow with a brilliant red light. \"I knew I had some
fire essence somewhere,\" Praxix said, blankly. \"I only hope I didn't
use too much.\"">
		<COND (<IN-PARTY? ,ESHER>
		       <TELL CR CR
"\"Some Wizard!\" replied Esher. \"Heaven help us!\"">)>
		<CHECK-CAST-LIMIT>
		<COND (<EQUAL? ,HERE ,BERN-I-LAV ,DWARF-MEETING-LOC>
		       <CAVERN-GRAPHIC>)>
		<RTRUE>)
	       (,SUBGROUP-MODE
		<TELL
"Praxix checked his staff, but a usable light was already emanating from
it. Figuring it best not to waste magical essences, he decided against
recharging it with light.">
		<CHECK-CAST-LIMIT>)
	       (T
		<TELL
"The light emanating from Praxix' staff appeared fine to us, but
Praxix took more fire and earth essence from his pouch and applied it to the
staff anyway. \"Can't be too sure.\" he said.">
		<REMOVE ,HYE-GLOW>
		<CHECK-CAST-LIMIT>)>>

<ROUTINE CAST-FAR-VISION ("OPTIONAL" (DFLT? T))
	 <COND (<NOT <F&SET? ,FAR-VISION-SPELL ,SEEN>>
		<TELL
"Praxix raised his arm before him, and from his crooked forefinger shot
a small ball of fire">
		<COND (<FSET? ,HERE ,UNDERGROUND>
		       <TELL
", illuminating the cavern walls as it sped into the gloom.">)
		      (T
		       <TELL
", disappearing into the air before him.">
		       <CHECK-CAST-LIMIT>)>)
	       (<FSET? ,HERE ,UNDERGROUND>
		<TELL
"Praxix, using his flare spell, illuminated the darkness before
us.">)
	       (T
		<TELL
"Praxix, casting his flare spell, shot a ball of fire into the
distance.">)>
	 <COND (.DFLT?
		<TELL " Unfortunately, ">
		<COND (<FSET? ,HERE ,UNDERGROUND>
		       <TELL "nothing was revealed in the gloom.">)
		      (T
		       <TELL "there was no response, and nothing new
was revealed.">)>)>
	 <RTRUE>>

<CONSTANT UNSTABLE-MIX 0>

<GLOBAL MIX-ESSENCE 0>

<GLOBAL MIX-REAGENT <>>

<COMMAND MIX O-MIX ()
	 <TELL
"Carefully, Praxix mixed the " AO " with an equal amount of ">
	 <TELL D ,ACTION-PRSI ", ">
	 <SETG MIX-ESSENCE ,ACTION-PRSI>
	 <SETG MIX-REAGENT ,ACTION-OBJECT>
	 <COND (<AND <EQUAL? ,MIX-REAGENT ,REAGENT ,BLUE-REAGENT>
		     <EQUAL? ,MIX-ESSENCE ,ESSENCE-FIRE>>
		<SETG MIXTURE ,SPECIAL-VISION-SPELL>)
	       (<AND <EQUAL? ,MIX-REAGENT ,REAGENT ,BLUE-REAGENT>
		     <EQUAL? ,MIX-ESSENCE ,ESSENCE-WATER>>
		<SETG MIXTURE ,ANIMATE-SPELL>)
	       (<AND <EQUAL? ,MIX-REAGENT ,GRAY-REAGENT>
		     <EQUAL? ,MIX-ESSENCE ,ESSENCE-AIR>>
		<SETG MIXTURE ,FOREBODING-SPELL>)
	       (<AND <EQUAL? ,MIX-REAGENT ,GRAY-REAGENT>
		     <EQUAL? ,MIX-ESSENCE ,ESSENCE-FIRE>>
		<SETG MIXTURE ,BEND-WILL-SPELL>)
	       (<AND <EQUAL? ,MIX-REAGENT ,BLACK-REAGENT>
		     <EQUAL? ,HERE ,ZAN-CAVE>>
		<COND (<EQUAL? ,MIX-ESSENCE ,ESSENCE-FIRE>
		       <SETG MIXTURE ,DARKNESS-SPELL>)
		      (<EQUAL? ,MIX-ESSENCE ,ESSENCE-WATER>
		       <SETG MIXTURE ,ILLNESS-SPELL>)
		      (<EQUAL? ,MIX-ESSENCE ,ESSENCE-EARTH>
		       <SETG MIXTURE ,COLD-SPELL>)
		      (T
		       <SETG MIXTURE ,DESPAIR-SPELL>)>)
	       (T
		<SETG MIXTURE ,UNSTABLE-MIX>)>
	 <COND (<AND <EQUAL? ,MIX-REAGENT ,BLACK-REAGENT>
		     <EQUAL? ,MIXTURE ,UNSTABLE-MIX>>
		<UPDATE-REMOVE ,BLACK-REAGENT>
		<TELL "but the strangest thing happened. The mixture
itself, along with the remaining black reagent, simply vanished into the
air." CR CR>
		<COND (<G? ,BLACK-COUNT 0>
		       <TELL
"\"It would appear that without Umber, the mixtures are powerless,\"
Praxix said. \"He possesses a great power, and his magic has harnessed
the very essence of evil! But for what purpose?\"">)>
		<RTRUE>)
	       (<AND ,MIXTURE <FSET? ,MIXTURE ,SEEN>>
		<TELL "and was soon ready to cast the mixture.">)
	       (T
		<COND (,MIXTURE
		       <FSET ,MIXTURE ,SEEN>)>
		<TELL "and was now ready to cast the unknown mix
to see what enchantment it would perform.">)>
	 <SETG MIX-DONE T>
	 <TRAVEL-COMMANDS ,PRAXIX
			  ,CAST-COMMAND
			  ,USE-MIX-COMMAND
			  ,EXAMINE-COMMAND>>

<GLOBAL MIX-DONE <>>

<COMMAND USE-MIX O-CAST-MIX ()
	 <SETG MIX-DONE <>>
	 <TRAVEL-COMMANDS ,PRAXIX
			  ,CAST-COMMAND
			  ,MIX-COMMAND
			  ,EXAMINE-COMMAND>
	 <COND (<EQUAL? ,PARTY-MODE ,FIGHT-MODE>
		<CHANGE-CIT ,PRAXIX 2 ,NUL-COMMAND>)>
	 <COND (<EQUAL? ,MIXTURE ,UNSTABLE-MIX>
		<COND (<EQUAL? ,MIX-REAGENT ,GRAY-REAGENT>
		       <FSET ,MIX-ESSENCE ,GRAY-MIX>)
		      (<EQUAL? ,MIX-REAGENT ,BLUE-REAGENT ,REAGENT>
		       <FSET ,MIX-ESSENCE ,BLUE-MIX>)
		      (T
		       <FSET ,MIX-ESSENCE ,BLACK-MIX>)>
		<TELL
"Even as Praxix cast this unknown mixture, it seemed to disintegrate
into the air." CR CR>
		<COND (,SUBGROUP-MODE
		       <TELL
"\"Blasted powders,\" he said aloud.">)
		      (<NOT <F&SET? ,MIX-REAGENT ,TRAPPED>>
		       <TELL
"\"Astrix warned us that some mixtures would be unstable,\" he said,
\"It would appear that he was right.">)
		      (T
		       <TELL
"\"Another unstable mixture,\" Praxix said with a sigh.">)>)
	       (T
		<TELL
"Praxix cast his mixture at ">
		<COND (<NOT <EQUAL? ,ACTION-OBJECT
				    ,BERGON-OBJECT
				    ,ESHER-OBJECT
				    ,MINAR-OBJECT>>
		       <TELL "the ">)>
		<TELL  AO ", but nothing appeared to
happen. \"It was worth a try,\" Praxix said, but he was clearly disappointed
with the result.">)>>

<ROUTINE O-CAST-MIX ()
	 <FIND-OBJECTS ,HERE ,DONT-CAST>
	 <FIND-OBJECTS ,PRAXIX-CAST-OBJECTS>>

<OBJECT PRAXIX-CAST-OBJECTS>

<OBJECT STAFF
	(LOC PRAXIX-CAST-OBJECTS)
	(SDESC "staff")
	(KBD %<ASCII !\S>)
	(ACTION
	 <ACOND ()
		(<AND <ACTION? USE-MIX>
		      <NOT <EQUAL? ,MIXTURE ,UNSTABLE-MIX>>>
		 <COND (<EQUAL? ,MIXTURE ,FOREBODING-SPELL>
			;"Dangerous? Foreboding?"
			<FSET ,FOREBODING-SPELL ,ENCHANTED>
			<TELL
"Praxix cast this strange new mixture at his staff, and the oddest
thing happened. Rather than the pale red glow of his \"glow\" spell,
his staff now gave off a ">
			<COND (<FSET? ,HERE ,FORBIDDING>
			       <TELL "deep red glow">)
			      (T
			       <TELL
"dim green glow which was barely perceptible to the eye">)>
			<TELL ".">
			<QUEUE RESET-FOREBODING-OBJ 5>
			<COND (<NOT <F&SET? ,STAFF ,ENCHANTED>>
			       <TELL
" We waited a while longer, but nothing further happened.">
			       <REMOVE ,HYE-FOREBODING>
			       <TELL CR CR
"\"Odd,\" Praxix said, \"Either the spell is useless, or it works in a
manner that we have not yet discovered - I wonder which.\"">)>
			<MIXTURE-CAST>
			<RTRUE>) 
		       (T
			<TELL
"Unsure of what to cast the mixture at, Praxix thought to try his staff
(it worked to produce light, after all.) Sadly, though, nothing seemed
to happen.">
			<MIXTURE-CAST>
			<RTRUE>)>)>)>

;<ROUTINE FIND-PARTY-OBJECTS ("AUX" (OFF <GET ,O-TABLE 0>) (CNT 0))
	 <REPEAT ()
		 <COND (<G? <SET CNT <+ .CNT 1>> ,PARTY-MAX>
			<RETURN>)
		       (T
			<SET OFF <+ .OFF 1>>
			<PUT ,O-TABLE .OFF <GET ,PARTY .CNT>>)>>
	 <PUT ,O-TABLE 0 .OFF>>

<GLOBAL MIXTURE 0>

<OBJECT SPECIAL-VISION-SPELL>

<OBJECT ANIMATE-SPELL>

<OBJECT FOREBODING-SPELL>

<OBJECT BEND-WILL-SPELL>

<OBJECT ILLNESS-SPELL>

<OBJECT DARKNESS-SPELL>

<OBJECT COLD-SPELL>

<OBJECT DESPAIR-SPELL>

<OBJECT REAGENT
	(SDESC "reagent")
	(LOC REAGENTS)
	(KBD %<ASCII !\R>)
	(PRSI PRSI-BLUE-POWDER)
	(FLAGS DONT-EXAMINE)>

<OBJECT BLUE-REAGENT
	(SDESC "blue reagent")
	(KBD %<ASCII !\B>)
	(PRSI PRSI-BLUE-POWDER)
	(FLAGS DONT-EXAMINE)>

<OBJECT GRAY-REAGENT
	(SDESC "gray reagent")
	(KBD %<ASCII !\G>)
	(PRSI PRSI-GRAY-POWDER)
	(FLAGS DONT-EXAMINE)>

<OBJECT BLACK-REAGENT
	(SDESC "black reagent")
	(KBD %<ASCII !\G>)
	(PRSI PRSI-BLACK-POWDER)
	(FLAGS DONT-EXAMINE)>

<ROUTINE PRSI-SETUP ("OPTIONAL" OBJ1 OBJ2 OBJ3 OBJ4 "AUX" (CNT 0))
	 <COND (<ASSIGNED? OBJ1>
		<SET CNT <+ .CNT 1>>
		<PUT ,O-TABLE <+ .CNT 5> .OBJ1>)>
	 <COND (<ASSIGNED? OBJ2>
		<SET CNT <+ .CNT 1>>
		<PUT ,O-TABLE <+ .CNT 5> .OBJ2>)>
	 <COND (<ASSIGNED? OBJ3>
		<SET CNT <+ .CNT 1>>
		<PUT ,O-TABLE <+ .CNT 5> .OBJ3>)>
	 <COND (<ASSIGNED? OBJ4>
		<SET CNT <+ .CNT 1>>
		<PUT ,O-TABLE <+ .CNT 5> .OBJ4>)>
	 <PUT ,O-TABLE 5 .CNT>
	 <PUT ,O-TABLE 0 <+ 6 .CNT>>>

<ROUTINE PRSI-BLACK-POWDER ()
	 <COND (<AND <NOT <FSET? ,ESSENCE-EARTH ,BLACK-MIX>>
		     <NOT <FSET? ,ESSENCE-WATER ,BLACK-MIX>>>
		<PRSI-SETUP ,ESSENCE-EARTH
			    ,ESSENCE-FIRE
			    ,ESSENCE-WATER
			    ,ESSENCE-AIR>)
	       (<AND <FSET? ,ESSENCE-EARTH ,BLACK-MIX>
		     <FSET? ,ESSENCE-WATER ,BLACK-MIX>>
		<PRSI-SETUP ,ESSENCE-FIRE
			    ,ESSENCE-AIR>)
	       (<FSET? ,ESSENCE-EARTH ,BLACK-MIX>
		<PRSI-SETUP ,ESSENCE-FIRE
			    ,ESSENCE-WATER
			    ,ESSENCE-AIR>)
	       (T
		<PRSI-SETUP ,ESSENCE-AIR
			    ,ESSENCE-FIRE
			    ,ESSENCE-EARTH>)>
	 <PRSI-INPUT "with">>

<ROUTINE PRSI-GRAY-POWDER ()
	 <COND (<AND <NOT <FSET? ,ESSENCE-EARTH ,GRAY-MIX>>
		     <NOT <FSET? ,ESSENCE-WATER ,GRAY-MIX>>>
		<PRSI-SETUP ,ESSENCE-EARTH
			    ,ESSENCE-FIRE
			    ,ESSENCE-WATER
			    ,ESSENCE-AIR>)
	       (<AND <FSET? ,ESSENCE-EARTH ,GRAY-MIX>
		     <FSET? ,ESSENCE-WATER ,GRAY-MIX>>
		<PRSI-SETUP ,ESSENCE-FIRE
			    ,ESSENCE-AIR>)
	       (<FSET? ,ESSENCE-EARTH ,GRAY-MIX>
		<PRSI-SETUP ,ESSENCE-FIRE
			    ,ESSENCE-WATER
			    ,ESSENCE-AIR>)
	       (T
		<PRSI-SETUP ,ESSENCE-AIR
			    ,ESSENCE-FIRE
			    ,ESSENCE-EARTH>)>
	 <PRSI-INPUT "with">>

<ROUTINE PRSI-BLUE-POWDER ()
	 ;"Yow! Change this"
	 <COND (<AND <NOT <FSET? ,ESSENCE-EARTH ,BLUE-MIX>>
		     <NOT <FSET? ,ESSENCE-AIR ,BLUE-MIX>>>
		<PRSI-SETUP ,ESSENCE-EARTH
			    ,ESSENCE-FIRE
			    ,ESSENCE-WATER
			    ,ESSENCE-AIR>)
	       (<AND <FSET? ,ESSENCE-EARTH ,BLUE-MIX>
		     <FSET? ,ESSENCE-AIR ,BLUE-MIX>>
		<PRSI-SETUP ,ESSENCE-FIRE
			    ,ESSENCE-WATER>)
	       (<FSET? ,ESSENCE-EARTH ,BLUE-MIX>
		<PRSI-SETUP ,ESSENCE-FIRE
			    ,ESSENCE-WATER
			    ,ESSENCE-AIR>)
	       (T
		<PRSI-SETUP ,ESSENCE-EARTH
			    ,ESSENCE-FIRE
			    ,ESSENCE-WATER>)>
	 <PRSI-INPUT "with">>

<OBJECT ESSENCES>

<OBJECT ESSENCE-FIRE
	(LOC ESSENCES)
	(SDESC "fire essence")
	(12DESC "fire")
	(TEMP 2)
	(COLOR 0)
	(MIX-SPELL LIGHT-SPELL FAR-VISION-SPELL TAG-POWDERS LIGHTNING-SPELL)
	(PRSI ESSENCE-PRSI)
	(KBD %<ASCII !\F>)>

<OBJECT ESSENCE-WATER
	(LOC ESSENCES)
	(SDESC "water essence")
	(12DESC "water")
	(TEMP 3)
	(COLOR 0)
	(MIX-SPELL MUD-SPELL FOG-SPELL LIGHTNING-SPELL TAG-POWDERS)
	(PRSI ESSENCE-PRSI)
	(KBD %<ASCII !\W>)>

<OBJECT ESSENCE-AIR
	(LOC ESSENCES)
	(SDESC "air essence")
	(12DESC "air")
	(TEMP 1)
	(COLOR 0)
	(MIX-SPELL LEVITATE-SPELL TAG-POWDERS FAR-VISION-SPELL FOG-SPELL)
	(PRSI ESSENCE-PRSI)
	(KBD %<ASCII !\A>)>

<OBJECT ESSENCE-EARTH
	(LOC ESSENCES)
	(SDESC "earth essence")
	(12DESC "earth")
	(TEMP 0)
	(COLOR 0)
	(MIX-SPELL TAG-POWDERS LEVITATE-SPELL LIGHT-SPELL MUD-SPELL)
	(PRSI ESSENCE-PRSI)
	(KBD %<ASCII !\E>)>

<ROUTINE ESSENCE-PRSI ()
	 <COND (<OBJECT? ESSENCE-EARTH>
		<PRSI-SETUP ,ESSENCE-AIR ,ESSENCE-FIRE ,ESSENCE-WATER>)
	       (<OBJECT? ESSENCE-AIR>
		<PRSI-SETUP ,ESSENCE-EARTH ,ESSENCE-FIRE ,ESSENCE-WATER>)
	       (<OBJECT? ESSENCE-FIRE>
		<PRSI-SETUP ,ESSENCE-EARTH ,ESSENCE-AIR ,ESSENCE-WATER>)
	       (T
		<PRSI-SETUP ,ESSENCE-EARTH ,ESSENCE-AIR ,ESSENCE-FIRE>)>
	 <PRSI-INPUT "with">>

<ROUTINE GET-SPELL (C1 C2 "AUX" TBL)
	 <SET TBL <GETPT <GETP .C1 ,P?ESSENCE> ,P?MIX-SPELL>>
	 <GET .TBL
	      <GETP <GETP .C2 ,P?ESSENCE> ,P?TEMP>>>

<ROUTINE GET-COLOR (E1 E2 "AUX" TBL)
	 <SET TBL <GETPT <GETP .E1 ,P?COLOR> ,P?MIX-COLOR>>
	 <GET .TBL
	      <GETP <GETP .E2 ,P?COLOR> ,P?TEMP>>>

<OBJECT REAGENTS>

<ROUTINE O-MIX ()
	 <COND (<EQUAL? ,ACTOR ,TAG>
		<FIND-OBJECTS ,TAG-POWDERS>)
	       (<AND <EQUAL? ,HERE ,ZAN-OUTSKIRTS>
		     <FSET? ,HERE ,SEEN>>
		<FIND-OBJECTS ,ESSENCES>)
	       (T
		<FIND-OBJECTS ,REAGENTS>)>>

<ROUTINE MIXTURE-CAST ()
	 <SETG MIX-DONE <>>
	 <TRAVEL-COMMANDS ,PRAXIX ,CAST-COMMAND ,MIX-COMMAND ,EXAMINE-COMMAND>
	 <RTRUE>>

<ROUTINE SAVE-SPELL ("OPTIONAL" (SP ,ACTION-OBJECT))
	 <COND (<NOT <GETPT .SP ,P?TEMP>>
		<TELL "[Error: No Spell TEMP]">)
	       (T
		<PUTP .SP ,P?TEMP <LOC .SP>>
		<UPDATE-MOVE .SP ,SAVED-SPELLS>)>>

<ROUTINE RESTORE-SPELLS ("AUX" F N)
	 <SET F <FIRST? ,SAVED-SPELLS>>
	 <REPEAT ()
		 <COND (<NOT .F> <RETURN>)
		       (T
			<SET N <NEXT? .F>>
			<UPDATE-MOVE .F <GETP .F ,P?TEMP>>
			<SET F .N>)>>>

<OBJECT SAVED-SPELLS>
