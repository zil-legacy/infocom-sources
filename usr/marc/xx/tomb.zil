"TOMB for
		      		JOURNEY
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<OBJECT MINE-HOLE-CRACK
	(LOC MINE-HOLE)
	(SDESC "crack")
	(KBD %<ASCII !\C>)
	(FLAGS DONT-TAKE)
	(EXBITS <+ ,ESHERBIT ,HURTHBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <COND (,TRAPPED-IN-HOLE
			<TELL ACT
" stood at the edge of the broken rock, and peered down at ">
			<TELL D ,TRAPPED-IN-HOLE>
			<TELL ". \"Don't worry,\" he said, \"I shall
think of something.\"">)
		       (T
			<TELL ACT
" picked up a small stone, and dropped it through the crack. A long
second later, it hit the surface below." CR CR>
			<TELL
"Doing some simple calculations in my head, I came up with an estimate
of the drop. \"I'd say at least twenty feet, perhaps more,\" I said.
\"Our rope might be long enough to lower someone down there.\"">)>)>)>

<ROOM MINE-HOLE
      (TRAVEL-COMMANDS BACK-COMMAND DOWN-COMMAND NUL-COMMAND)
      (GRAPHIC G-MINE-HOLE)
      (FLAGS UNDERGROUND DONT-SCOUT ADVISE DONT-DROP DANGEROUS)
      (ENTER FSET-SEEN)
      (TEMP 0)
      (ACTION
       <ACOND ("AUX" TMP)
	      (<AND <ACTION? CAST>
		    <OBJECT? LEVITATE-SPELL>
		    <SET TMP <GET-TEMP>>>
	       <COND (<EQUAL? .TMP ,PRAXIX>
		      <CLEAR-TEMP>
		      <TELL
"Having assured himself that there was nothing further of interest there,
Praxix cast a spell of elevation on himself, and he quickly rose from the
hole.">)
		     (T
		      <HINT ,HINT-HOLE>
		      <TELL
"Praxix removed the proper essences from his pouch, and cast them
through the hole toward the floor below. But the spell would not
work over such distances; " D .TMP " rose but a foot, then returned
to where he had stood." CR CR>
		      <TELL
"\"I feared it would be so,\" he said. \"I do not know how we shall
retrieve him now.\"">)>)
	      (<AND <ACTION? CAST>
		    <EQUAL? <GET-TEMP> ,PRAXIX>>
	       <TELL
"This was no time for games, but Praxix later confided in me that he had
thought to try out his \"" AO "\" spell; he didn't, of course, for it would
have been more an embarrassment than anything else.">)
	      (BACK
	       <COND (,HOLE-VICTIM
		      <TELL
"Fearing that " D ,HOLE-VICTIM " was dead, and not wishing to endanger the
rest of our party, we reluctantly decided to leave him behind. No words were
spoken as we quietly shuffled out of the chamber and into the vestibule that
lay outside.">
		      <MOVE-TO ,GATE-JUNCTION>
		      <RTRUE>)
		     (<AND <SET TMP <GET-TEMP>>
			   <NOT <EQUAL? .TMP ,PRAXIX>>>
		      <SETG HOLE-VICTIM .TMP>
		      <KILLED-OFF .TMP>
		      <TELL
"Seeing no reasonable alternative, we decided to leave the chamber with "
D .TMP " still trapped inside the darkened hole." CR CR>
		      <TELL
"\"Hurry!\" " D .TMP " pleaded. \"I do not wish to become too friendly
with my roommate here, if you know what I mean!\"" CR CR>
		      <TELL
"\"We shall return as quickly as we can,\" ">
		      <TELL D ,LEADER>
		      <TELL " said, but our hearts
were heavy - it might never be possible to retrieve our lost friend." CR CR>)>
	       <COND (<IN? ,IRON-KEY ,INVENTORY>
		      <REMOVE-TRAVEL-COMMAND ,GATE-JUNCTION
					     ,CRUDE-PATH-COMMAND>)>
	       <COND (<EQUAL? .TMP ,PRAXIX>
		      <TELL <I/WE 2 T>
" started to leave, almost forgetting about " <MY/OUR> " friend in the
hole below " <MY/OUR> " feet. \"Hey! What about me?\" he said, quickly
rustling up an elevation spell and rising back out of the hole." CR CR>)>
	       <MOVE-TO ,GATE-JUNCTION
"And so we retreated to the vestibule, wondering which
path we should take next.">)
	      (<OR <ACTION? ESHER> <ACTION? HURTH> <ACTION? PRAXIX>>
	       <COND (<ACTION? ESHER>
		      <SET TMP ,ESHER>)
		     (<ACTION? HURTH>
		      <SET TMP ,HURTH>)
		     (T
		      <SET TMP ,PRAXIX>)>
	       <TELL
"After a moment's thought, " D ,LEADER " selected ">
	       <COND (<EQUAL? .TMP ,LEADER> <TELL "himself">)
		     (T <TELL D .TMP>)>
	       <TELL " to make the
descent. Praxix removed some earth and fire essences from his pouch
and applied them to ">
	       <COND (<EQUAL? .TMP PRAXIX>
		      <TELL
"his cloak, causing it to glow faintly; then, he handed
his staff to me. \"If I come into trouble below, I expect this will be
of more use to you">)
		     (T
		      <TELL D .TMP
"'s cloak, causing it to glow faintly. \"At least you will have some
light for your descent">)>
	       <TELL ",\" he said." CR CR
"Taking out our rope, " <I/WE 2> " securely tied one end around " D .TMP
"'">
	       <COND (<NOT <EQUAL? .TMP ,PRAXIX>>
		      <TELL "s">)>
	       <TELL
" waist, and slowly lowered him down into the darkened hole. When
we had reached the rope's end, " D .TMP " was still not at the bottom." CR CR>
	       <TELL
"\"It would seem to be about ten feet down from here,\" he said. \"I can't
tell much else for now.\"">
	       <END-OPTION> ;"Previous one of Leader's"
	       <OPTION .TMP ,JUMP-COMMAND ,RETURN-COMMAND>
	       <SET-TEMP .TMP>)
	      (JUMP
	       <REMOVE-TRAVEL-COMMAND ,HERE ,DOWN-COMMAND>
	       <TELL D <SET TMP <GET-TEMP>>
" decided to fall from the rope to the floor below. He landed with a crash,
and " <I/WE 2> " feared he had been injured. \"Only some loose rock,\" he
said, a little shakily, \"I am fine. Time to do some exploring.\"" CR CR>
	       <TELL
"Leaving " <MY/OUR 2> " view, " D .TMP " spent what seemed to be an eternity
scouting out his surroundings. When he again became visible, " <I/EACH 2>
" breathed a sigh of relief." CR CR>
	       <GRAPHIC <> ,G-MINE-FIND ,TOP-LEFT>
	       <TELL
"\"I've found a friend,\" he said, smiling, \"an old friend!\" He held up
to " <MY/OUR 2> " view a decayed human skull. \"Quite the worse for wear. I
would say he's been here quite a few years. Found this alongside,\" he
said, tossing up an iron key. \"Nothing else here, I'm afraid.\"" CR CR>
	       <FSET ,MINE-HOLE-CRACK ,DONT-EXAMINE>
	       <COND (<IN-PARTY? ,BERGON>
		      <TELL
"\"What do you think?\" Bergon asked, holding up the key." CR CR>)>
	       <TELL
"\"Perhaps he dropped the key, then went in after it and got trapped,\" I
suggested.">
	       <COND (<NOT <EQUAL? .TMP ,PRAXIX>>
		      <SETG TRAPPED-IN-HOLE .TMP>
		      <PUTP ,MINE-HOLE-CRACK ,P?EXBITS ,PRAXIXBIT>
		      <TELL CR CR
"\"I don't mean to be rude, but has anyone figured out how I'm to get out
of here?\" " D .TMP " asked anxiously. In fact, we had not.">)>
	       <END-OPTION>
	       <UPDATE-MOVE ,IRON-KEY ,INVENTORY>)
	      (RETURN
	       <SETG PREVIOUS-HOLE <GET-TEMP>>
	       <TELL
"\"Pull me back up!\" " D <GET-TEMP> " shouted from the darkness, and we did.
\"Too dangerous,\" he continued when he had been pulled through the hole,
\"It would be impossible to reach the rope again.\"">
	       <CLEAR-TEMP>
	       <END-OPTION>)
	      (GET-ADVICE:REMOVE
	       <TELL
"\"I suggest we find out what's down there,\" Praxix offered.">)
	      (DOWN
	       <UPDATE-FCLEAR ,HERE ,ADVISE>
	       <COND (,PREVIOUS-HOLE
		      <REMOVE-TRAVEL-COMMAND ,HERE ,DOWN-COMMAND>)>
	       <TELL
"It was decided that we should try sending someone down the hole, though it
might be quite dangerous. ">
	       <TELL D ,LEADER>
	       <TELL
" thought a moment before deciding who would make the attempt.">
	       <COND (<AND <IN-PARTY? ,ESHER>
			   <IN-PARTY? ,HURTH>
			   <NOT <EQUAL? ,PREVIOUS-HOLE ,ESHER ,HURTH>>>
		      <COND (<EQUAL? ,PREVIOUS-HOLE ,PRAXIX>
			     <OPTION ,LEADER
				     ,ESHER-COMMAND
				     ,HURTH-COMMAND>)
			    (T
			     <OPTION ,LEADER
				     ,ESHER-COMMAND
				     ,HURTH-COMMAND
				     ,PRAXIX-COMMAND>)>)
		     (<AND <IN-PARTY? ,ESHER>
			   <NOT <EQUAL? ,PREVIOUS-HOLE ,ESHER>>>
		      <COND (<EQUAL? ,PREVIOUS-HOLE ,PRAXIX>
			     <OPTION ,LEADER
				     ,ESHER-COMMAND>)
			    (T
			     <OPTION ,LEADER
				     ,ESHER-COMMAND
				     ,PRAXIX-COMMAND>)>)
		     (<AND <IN-PARTY? ,HURTH>
			   <NOT <EQUAL? ,PREVIOUS-HOLE ,HURTH>>>
		      <COND (<EQUAL? ,PREVIOUS-HOLE ,PRAXIX>
			     <OPTION ,LEADER
				     ,HURTH-COMMAND>)
			    (T
			     <OPTION ,LEADER
				     ,HURTH-COMMAND
				     ,PRAXIX-COMMAND>)>)
		     (T
		      <TELL CR CR>
		      <SETG ACTION ,PRAXIX-COMMAND>
		      <AGAIN>)>)>)>

<GLOBAL PREVIOUS-HOLE <>>

<GLOBAL TRAPPED-IN-HOLE <>>

<OBJECT IRON-KEY
	(SDESC "key")
	(KBD %<ASCII !\K>)
	(FLAGS DONT-DROP)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <COND (<EQUAL? ,ACTOR <GET-TEMP>>
			<TELL ACT
" asked us to look over the key more closely. We did, reporting back into
the hole that it had no markings, and, given its enormous size, must have
been intended for a door of similar proportions.">)
		       (T
			<TELL ACT
" took the key and looked it over. It was ludicrously large and without
markings; the door it was intended to open would presumably match it in
proportions.">)>)>)>

<COMMAND ESHER>

<COMMAND BERGON>

<COMMAND HURTH>

<COMMAND PRAXIX>

<ROOM TOMB
      (TRAVEL-COMMANDS BACK-COMMAND NUL-COMMAND NUL-COMMAND)
      (CAST-LIMIT 3)
      (GRAPHIC G-VAULT)
      (FLAGS UNDERGROUND)
      (ENTER FSET-SEEN)
      (ACTION
       <ACOND () 
	      (BACK
	       <COND (<IN? ,SPIRIT-STONE ,INVENTORY>
		      <TELL
"With the Spirit Stone in hand, we returned to the bottom of the
stairs.">)
		     (T
		      <TELL
"We could not fathom the meaning of the vault and runes, and it seemed
we never would. And so, we returned to the stairs." CR CR>
		      <TELL
"\"I cannot help but feel,\" Praxix said, \"that the tomb is not what
it appears. Something that perfect cannot have been placed here without
purpose.\"">)>
	       <REMOVE-TRAVEL-COMMAND ,MINE-LOWER-STAIR ,RIGHT-COMMAND>
	       <MOVE-TO ,MINE-LOWER-STAIR>)
	      (<AND <ACTION? USE-MIX>
		    <EQUAL? ,MIXTURE ,SPECIAL-VISION-SPELL>
		    <OBJECT? TOMB-VAULT>>
	       <FSET ,SPECIAL-VISION-SPELL ,SEEN>
	       <TELL <I/WE 2 T>
" stood in silence as Praxix cast the strange mixture at the
vault. The powder appeared to wrap itself about the iron casing,
which began to glow with a pale-blue light. And then the entire
vault became translucent, and its borders soft and ill-defined.
In a matter of moments, the once formidable structure lost all
substance, dissolving into the thin air!" CR CR>
	       <TELL
"\"A powerful illusion,\" said Praxix, himself awe-struck, \"and
it appears the spell has broken it.\"" CR CR>
	       <TELL
"But no sooner had Praxix spoken than another ghostly image appeared
where the vault had stood - far smaller it was, and oblong in shape. The image
shimmered before us as it struggled to acquire an earthly substance." CR CR>
	       <TELL "\"A coffin!\" ">
	       <COND (<IN-PARTY? ,HURTH> <TELL "Hurth">)
		     (T <TELL "Praxix">)>
	       <TELL " whispered; and there we stood, dumbfounded, before
a blue marble casket that now sat on the ground before us.">
	       <UPDATE-REMOVE ,TOMB-VAULT>
	       <UPDATE-REMOVE ,TOMB-RUNES>
	       <UPDATE-MOVE ,TOMB-COFFIN ,HERE> 
	       <GRAPHIC <> ,G-COFFIN ,G-COFFIN-WHERE>
	       <MIXTURE-CAST>)>)>

<OBJECT TOMB-COFFIN
	(SDESC "coffin")
	(KBD %<ASCII !\C>)
	(FLAGS DONT-TAKE)
	(EXBITS <+ ,HURTHBIT ,PRAXIXBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <TELL ACT
" took a tentative step forward and touched the polished stone with his
hand. Breathlessly, he lifted the lid and stood there, frozen with
fear. \"">
		 <COND (<EQUAL? ,ACTOR ,PRAXIX>
			<TELL
"Why, this is quite remarkable,\" he said excitedly.">)
		       (T
			<TELL
"I cannot believe it,\" he said in a perfect monotone.">)>
		 <TELL CR CR
"It was impossible, and to this day we have not found an explanation
for what we discovered within: a Dwarvish body, perfectly preserved
through the long years. He wore a long, white robe which appeared to
glisten in the light of Praxix' staff. Around his neck, a round white
stone hung at the end of a golden chain.">
		 <COND (<IN-PARTY? ,HURTH>
			<TELL CR CR
"\"Cedrith!\" gasped Hurth, stumbling backward.">)>
		 <UPDATE-MOVE ,SPIRIT-STONE ,HERE>)>)>

<OBJECT SPIRIT-STONE
	(SDESC "white stone")
	(KBD %<ASCII !\W>)
	(FLAGS DONT-DROP)
	(ACTION
	 <ACOND ()
		(<OR <ACTION? EXAMINE> <ACTION? PICK-UP>>
		 <UPDATE-FSET ,SPIRIT-STONE ,DONT-EXAMINE>
		 <UPDATE-MOVE ,SPIRIT-STONE ,INVENTORY>
		 <COND (<ACTION? PICK-UP> <TELL "I">)
		       (T <TELL ACT>)>
		 <TELL
" took the white stone from around the neck of Cedrith and held it up
before him." CR CR>
		 <TELL
"\"It is weightless, or so it seems,\" ">
		 <COND (<ACTION? PICK-UP> <TELL "I">)
		       (T <TELL "he">)>
		 <TELL " said, suddenly filled with fear.">
		 <COND (<NOT <EQUAL? ,PRAXIX ,ACTOR>>
			<TELL CR CR>)
		       (T <TELL " ">)>
		 <TELL "\"It is not of this world!\"">
		 <COND (<NOT <EQUAL? ,PRAXIX ,ACTOR>>
			<TELL " Praxix responded, taking it in his hand.">)>
		 <TELL CR CR
"\"If I heard Astrix correctly, this stone is one of the Two.">
		 <COND (<FSET? ,STORY-CEDRITH ,EXAMINED>
			<TELL
" Cedrith's prize,\" Praxix said, holding up the white stone.">)
		       (T
			<TELL "\"">)>
		 <TELL
" He handed it to me, and I placed it securely in my pack.">
		 <RTRUE>)>)>

<OBJECT TOMB-RUNES
	(SDESC "runes")
	(KBD %<ASCII !\R>)
	(LOC TOMB)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <COND (<NOT <IN-PARTY? ,HURTH>>
			<TELL ACT
" walked over to the runes but discovered little. \"They
seem to be Dwarvish,\" he said, \"but I could not even attempt
to translate them.\"">
			<RTRUE>)>
		 <COND (<NOT <EQUAL? ,ACTOR ,HURTH>>
			<TELL ACT
" walked over to the runes and, thinking them Dwarvish, called Hurth
over to help in the translation.">)
		       (T
			<TELL
"Hurth moved closer to the runes and began to inspect them.">)>
		 <TELL
" \"These runes are similar to Dwarvish, but in some peculiar dialect,\"
he said." CR CR>
		 <TELL
"\"Or perhaps an early forerunner of present-day Dwarvish,\" Praxix
suggested." CR CR>
		 <TELL
"\"Yes, that would explain much. The runes say something like
'Herein the Legacy of Dwarves.' I wonder what it can mean.\"">)>)>

<OBJECT TOMB-VAULT
	(SDESC "vault")
	(KBD %<ASCII !\V>)
	(LOC TOMB)
	(FLAGS DONT-TAKE)
	(EXBITS <+ ,HURTHBIT ,PRAXIXBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <TELL
"The vault appeared impenetrable, of a brilliantly polished metal the
likes of which we had never seen before." CR CR>
		 <COND (<EQUAL? ,ACTOR ,HURTH>
			<TELL
"\"I know of no Dwarvish craft such as this,\" Hurth said, \"This is
some lost art or work of magic.\"">)
		       (T
			<TELL
"\"There is no craftsman that can make such a thing,\" " ACT " said, \"It is
too...perfect!\"">)>)>)>