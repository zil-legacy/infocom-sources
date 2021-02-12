"LAKE for
		      		JOURNEY
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<ROOM MOUNTAIN-GATE
      (TRAVEL-COMMANDS PROCEED-COMMAND NUL-COMMAND NUL-COMMAND)
      (GRAPHIC G-HIGH-GATE)
      (ENTER
       <EXECUTE () <SETG SUBGROUP-MODE T>>)
      (EXIT
       <EXECUTE () <SETG SUBGROUP-MODE <>>>)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <TELL
"We awoke with the sun, and could see now where we had come. We were
on a ridge above a high plain in the mountains, just a few hundred
feet above a large, blue-green lake. Not long after starting, we had
descended into the plain. The sky was starting to darken in the north, and
this could only mean an approaching storm.">
	       <MOVE-TO ,HIGH-PLAIN>)>)>

<OBJECT NUGGET
	(SDESC "gold nugget")
	(KBD %<ASCII !\G>)
	(FLAGS DONT-EXAMINE)>

<OBJECT GOLD-STREAM-OBJ
	(SDESC "stream")
	(KBD %<ASCII !\S>)
	(LOC GOLD-STREAM)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE
		 <UPDATE-MOVE ,NUGGET ,INVENTORY>
		 <UPDATE-MOVE ,GOLD-STREAM-OBJ>
		 <ADD-TRAVEL-COMMAND ,HERE ,LOOK-FOR-GOLD-COMMAND>
		 <FSET ,HERE ,ADVISE>
		 <TELL ACT
" bent down and ran his fingers through the icy mountain waters. He was
just about to stand when his eye caught a glimpse of a shiny object
sitting in the stream bed. Rolling up his sleeve, he reached down and
pulled up a small gold nugget. \"Yes, it's gold,\" Bergon
said, as he tested the soft metal with his teeth. \"The stream is most
likely filled with it.\"" CR CR>
		 <TELL
"The dark clouds lowered as they rolled in from the north. The winds
started to howl; it would not be long before the rains came.">)>)>

<COMMAND (LOOK-FOR-GOLD FIND-GOLD)>

<GLOBAL TORRENT-LOSER <>>

<ROOM GOLD-STREAM
      (TRAVEL-COMMANDS PROCEED-COMMAND NUL-COMMAND NUL-COMMAND)
      (GRAPHIC G-GOLD-STREAM)
      (FLAGS DONT-SCOUT DANGEROUS)
      (TEMP 0)
      (ACTION
       <ACOND ("AUX" TMP)
	      (GET-ADVICE
	       <COND (<ZERO? <GET-TEMP>>
		      <TELL
"Unsure of whether to press on or to search for more gold, Bergon
gathered us together. \"I fear the storm that is to come,\" he said,
then asked the rest of us for our opinions." CR CR>
		      <TELL
"It is true that we had not travelled here in search of gold, but gold is
a rare and valuable commodity. And thus, it was difficult to know whether
it would hurt to search just a little longer.">
		      <COND (<IN-PARTY? ,ESHER>
			     <TELL " Esher seemed to put it best. \"A little
rain won't hurt, and neither would a little gold,\" he said.">)>
		      <UPDATE-FCLEAR ,HERE ,ADVISE>)
		     (<EQUAL? <GET-TEMP> 1>
		      <TELL
"Bergon was becoming increasingly concerned. But, as earlier, the
group seemed less inclined to leave this opportunity behind.">
		      <UPDATE-FCLEAR ,HERE ,ADVISE>)>)
	      (LOOK-FOR-GOLD
	       <SET-TEMP <SET TMP <+ <GET-TEMP> 1>>>
	       <COND (<EQUAL? .TMP 1>
		      <UPDATE-FSET ,HERE ,ADVISE>
		      <TELL
"We each scanned the stream for gold, with little luck. The clouds,
dark and heavy, began to rain down upon us. \"Look!\" said Bergon,
pointing at the chain lightning off to the north. Seconds later, the
earth shook with the roar of thunder. \"It is not far now,\" he
added, as his eyes drifted to the blackening sky.">)
		     (T
		      <TELL
"Runoff from the nearby hills was forming into numerous streams,
each coursing into the main channel in which we searched in vain
for gold. Crash! A tree nearby cracked in two by a stroke of
lightning. Rain was falling now in buckets, and Bergon screamed
for us to take cover." CR CR>
		      <TELL
"Too late! We watched as a torrent flowed down the hillside,
knocking us down and washing my pack downstream. I did my
best to salvage its contents, then scrambled with the others to a
rock-sheltered spot nearby, where we waited for the storm to abate.">
		      <COND (<IN? ,DWARF-STONE ,INVENTORY>
			     <SETG TORRENT-LOSER ,DWARF-STONE>)
			    (<IN? ,WEBBA-MAP ,INVENTORY>
			     <SETG TORRENT-LOSER ,WEBBA-MAP>)>
		      <COND (,TORRENT-LOSER
			     <HINT ,HINT-GOLD>
			     <UPDATE-MOVE ,TORRENT-LOSER>)>
		      <UPDATE-FCLEAR ,HERE ,ADVISE>
		      <UPDATE-FCLEAR ,HERE ,INVENTORIED>
		      <REMOVE-PARTY-COMMAND ,LOOK-FOR-GOLD-COMMAND>)>)
	      (<AND <ACTION? INVENTORY>
		    <EQUAL? <GET-TEMP> 2>>
	       <TELL
"Frantically, I searched my pack. ">
	       <COND (,TORRENT-LOSER
		      <TELL "Over and over I looked, but it was
no use. The " D ,TORRENT-LOSER " was gone!" CR CR>
		      <TELL
"Praxix looked grim. \"This is an evil omen,\" he said. \"We shall
not be able to replace it!\"">)
		     (T
		      <TELL "Fortunately, we had lost nothing
to the storm.">)>)
	      (PROCEED
	       <COND (<L? <SET TMP <GET-TEMP>> 2>
		      <TELL
"We made our way along the stream down to the shore of the lake, as
a great downpour was loosed from the sky. The stream rose steadily,
and lightning filled the northern sky. Soon, the stream became a
wild torrent, nearly washing us aside as we rushed to take cover.
And then, as quickly as it came, the storm passed, and a wide
rainbow filled the brightening sky." CR CR>
		      <TELL
"\"That was awfully close!\" I said, checking that the contents
of my pack were secure." CR CR>)
		     (T
		      <TELL
"The storm cleared as quickly as it had arrived, and a wide rainbow
filled the brightening sky." CR CR>
		      <TELL
"\"We're lucky not to have gotten hurt!\" I said, marvelling at the
swollen stream that roared past us." CR CR>)> 
	       <MOVE-TO ,LAKE-SHORE-1
"\"Yes, it could have been far worse for us. Let us continue to
the lake,\" replied Bergon, and our party continued the last few
hundred paces to the shore of the lake.">)>)>

<GLOBAL LAKE-VICTIM <>>

<ROOM LAKE-SHORE-1
      (TRAVEL-COMMANDS PROCEED-COMMAND NUL-COMMAND NUL-COMMAND)
      (GRAPHIC G-LAKE-SHORE)
      (FLAGS ADVISE)
      (ENTER
       <EXECUTE ()
		<COND (<NOT <F&SET? ,HERE ,SEEN>>
		       <TELL CR CR
"The sun was high in the sky; no sign, not even the rainbow,
remained as testament to the deluge we had just witnessed.
It had been a while since our last meal, and talk soon turned to lunch.
Bergon strode to the shore of the glistening lake and eyed it
hungrily." CR CR>
		       <TELL
"\"Have I ever told you about my fishing days at Lendros?\" he
said. Nobody responded to this informal banter, but Bergon
persisted." CR CR>
		       <TELL
"\"How would everyone feel about some fresh lake trout?\" he asked." CR CR>
		       <TELL
"\"Oh, my, yes; that would hit the spot!\" he replied, playfully." CR CR>
		       <TELL
"Then, taking the slightest murmur from the group as a mandate, he dove
into the icy clear waters." CR CR>
		       <TELL
"He surfaced soon thereafter; though out of breath, he gasped
something about our upcoming feast">
		       <COND (<AND <NOT ,2ND-PASS>
				   <NOT <FSET? ,DWARF-MEETING ,SEEN>>>
			      <SETG LAKE-VICTIM
				    <FIRST-IN-PARTY ,MINAR ,ESHER>>
			      <TELL ". Seeing how weakened Bergon
had become, " D ,LAKE-VICTIM " pulled him from the lake and dove in to
catch our lunch himself; he never returned.">
			      <PARTY-REMOVE ,LAKE-VICTIM>)
			     (T
			      <TELL ", laughed, then dove again into the
lake. Only this time, he did not return.">
			      <SETG LAKE-VICTIM ,BERGON>
			      <PARTY-REMOVE ,BERGON>)>
		       <SETG UPDATE-FLAG T>
		       <ADD-PARTY-COMMAND ,ENTER-LAKE-COMMAND>)>>)
      (ACTION
       <ACOND ()
	      (SCOUT:REMOVE
	       <COND (<EQUAL? ,ACTOR ,ESHER>
		      <TELL "Frant">)
		     (T
		      <TELL "Method">)>
	       <TELL
"ically, " ACT " scouted the area along the shore looking for any sign
of " D ,LAKE-VICTIM ". He returned frustrated, having found no sign of our
missing friend. He did, however, find something of interest, and not far
from where we stood." CR CR>
	       <TELL
"\"There's a cave,\" he said,">
	       <COND (<EQUAL? ,ACTOR ,ESHER>
		      <TELL " panting,">)>
	       <TELL " \"just a little farther along the
shore.\"">)
	      (GET-ADVICE:REMOVE
	       <TELL D ,LEADER>
	       <COND (<EQUAL? ,LAKE-VICTIM ,BERGON>
		      <TELL ", taking charge and attempting at the same time
not to sound overly pessimistic,">)>
	       <TELL
" said, \"Perhaps " D ,LAKE-VICTIM " has been caught in a current, and
carried further along the shore.\"">
	       <TELL CR CR>
	       <COND (<EQUAL? ,LEADER ,PRAXIX>
		      <TELL "Praxix continued. \"">)
		     (T
		      <TELL
"Praxix agreed with " D ,LEADER ". \"" D ,LEADER " is right,\" he
started, \"">
		      <COND (<EQUAL? ,LEADER ,ESHER>
			     <TELL "though I am loath to admit it. T">)
			    (T
			     <TELL "t">)>)>
	       <TELL "here is no sign of " D ,LAKE-VICTIM
", and that is very odd. There is much we do not
understand, and there is much to fear; yet we may have hope!\"">
	       <RTRUE>)
	      (PROCEED
	       <MOVE-TO ,LAKE-SHORE-2
"Having little alternative, we packed our things and moved along the
shore, coming to a narrow cave through which a warm spring emptied
into the lake.">)  
	      (ENTER-LAKE
	       <TELL
"With a sense of urgency, I jumped into the cold waters and dove
vertically down along a vast rock wall which stretched out of sight
beneath me. But whereas the wall bounded my movements on one side,
the vastness of the lake stretched out before me on the other - clear
and still - and there was no sign of " D ,LAKE-VICTIM "!">
	       <MOVE-TO ,UNDERSHORE-1>)>)>

<ROOM LAKE-SHORE-2
      (TRAVEL-COMMANDS ENTER-COMMAND PROCEED-COMMAND NUL-COMMAND)
      (GRAPHIC G-LAKE-SHORE-CAVE)
      (ACTION
       <ACOND ()
	      (SCOUT:REMOVE
	       <TELL ACT
" went ahead, and told us of a warm pool he had found at the very end
of the cave." CR CR>
	       <COND (<EQUAL? ,ACTOR ,ESHER>
		      <TELL
"\"I think it's worth exploring,\" he said, \"At least, I don't have
any better ideas.\"">)
		     (T
		      <TELL
"\"We had best explore it,\" he said, \"for there seem to be few other
options available to us.\"">)>)
	      (ENTER
	       <FSET ,HERE ,DONT-SCOUT>
	       <COND (<FSET? ,LAKE-CAVE ,SEEN>
		      <REMOVE-TRAVEL-COMMAND ,HERE ,ENTER-COMMAND>
		      <REMOVE-TRAVEL-COMMAND ,LAKE-SHORE-3 ,BACK-COMMAND>
		      <TELL
"Determined not to give up hope, we again entered the cave">
		      <COND (<FSET? ,LAKE-POOL ,SEEN>
			     <TELL
", continuing down the narrow path until we reached the edge of the warm pool">
			     <MOVE-TO ,LAKE-POOL>)
			    (T
			     <MOVE-TO ,LAKE-CAVE>)>
		      <TELL ".">)
		     (T
		      <TELL
"Following the side of the warm spring into the cave, we passed through
caverns whose water-polished walls gave testimony to the torrents that
had flowed through these chambers many long years ago.">
		      <MOVE-TO ,LAKE-CAVE>)>) 
	      (PROCEED
	       <TELL
"The path along the shore soon ended, continuing instead steeply
upward into the surrounding hills. Further progress along the shore
would be impossible.">
	       <COND (<NOT <IN-PARTY? ,LAKE-VICTIM>>
		      <TELL
" If we continued now, it seemed certain we'd never see " D ,LAKE-VICTIM
" again.">)>
	       <MOVE-TO ,LAKE-SHORE-3>)>)>

<ROOM LAKE-SHORE-3
      (TRAVEL-COMMANDS PROCEED-COMMAND BACK-COMMAND NUL-COMMAND)
      (FLAGS DONT-SCOUT)
      (GRAPHIC G-LAKE-SHORE-3)
      (ENTER
       <EXECUTE ()
		<COND (<IN-PARTY? ,LAKE-VICTIM>
		       <REMOVE-PARTY-COMMAND ,BACK-COMMAND>)>>)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <COND (<NOT <IN-PARTY? ,LAKE-VICTIM>>
		      <HINT ,HINT-LAKE>
		      <TELL
"\"I am afraid we have no alternative,\" " D ,LEADER " said, \"but
to go on without " D ,LAKE-VICTIM ".\"" CR CR>)>
	       <COND (,2ND-PASS
		      <N-DAY-TREK 3>
		      <RTRUE>)>
	       <TELL
"We left the lake, climbing out of the valley and into the northeastern
hills. Following a narrow path, we marched until, late in the afternoon,
the path climbed steeply up a high ridge. We arrived as dusk approached
and stood in awe of the world that surrounded us." CR CR>
	       <MOVE-TO-FOREST-RIDGE>)
	      (BACK:REMOVE
	       <TELL
"Unwilling to leave the lake without making another attempt at finding "
D ,LAKE-VICTIM ", we retraced our steps and soon arrived back at the mouth of
the cave.">
	       <MOVE-TO ,LAKE-SHORE-2>)>)>

<ROOM LAKE-CAVE
      (TRAVEL-COMMANDS PROCEED-COMMAND BACK-COMMAND NUL-COMMAND)
      (FLAGS DONT-SCOUT)
      (ENTER FSET-SEEN)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <MOVE-TO ,LAKE-POOL
"A narrow path now led beside the gently flowing spring, and this we
followed until we came upon a deep, warm pool whose crystal clarity was a
revelation to behold.">) 
	      (BACK
	       <MOVE-TO ,LAKE-SHORE-2
"It seemed the cave would lead nowhere; and so, with hope fading
for our lost friend, we returned to the mouth of the cave.">)>)>

<ROOM LAKE-POOL
      (TRAVEL-COMMANDS PROCEED-COMMAND BACK-COMMAND ENTER-POOL-COMMAND)
      (GRAPHIC G-LAKE-POOL)
      (ENTER FSET-SEEN)
      (FLAGS UNDERGROUND ADVISE)
      (ACTION
       <ACOND ()
	      (GET-ADVICE:REMOVE
	       <COND (<OR <FSET? ,UNDERPOOL-2 ,SEEN>
			  <AND <FSET? ,UNDERPOOL-1 ,SEEN>
			       <NOT <IN-PARTY? ,ESHER>>>>
		      <TELL
"We huddled among ourselves, but few words were spoken. And yet I could see
in Praxix' eyes the desire that I once again attempt the descent.">)
		     (<FSET? ,UNDERPOOL-1 ,SEEN>
		      <TELL
"Esher felt it would be dangerous to explore the pool further, but
Praxix was more optimistic. \"This pool appears natural, yet it is clearly
the handiwork of great artisans; the search for knowledge is always
dangerous, Esher, and yet is it not the purpose of our Journey?\" he said.">)
		     (T
		      <TELL D ,LEADER
" stood a long while in thought, then asked for advice.">
		      <COND (<G? ,PARTY-MAX 2>
			     <TELL
" When none spoke, I made a rare suggestion of my own.">)>
		      <TELL " \"I
am happy to have a look underwater, if you think it would help,\" I
said.">
		      <COND (<NOT <EQUAL? ,LEADER ,PRAXIX>>
			     <TELL CR CR
"Praxix said nothing; he turned toward the pool and stared.">)>
		      <RTRUE>)>)
	      (<OR <ACTION? SCOUT>
		   <ACTION? PROCEED>>
	       <REMOVE-TRAVEL-COMMAND ,HERE ,PROCEED-COMMAND>
	       <COND (<ACTION? SCOUT>
		      <UPDATE-FSET ,HERE ,DONT-SCOUT>
		      <TELL ACT>)
		     (T
		      <TELL "Praxix, going on ahead,">)>
	       <TELL
" tried to find another path through the cave, but failed. \"This is
the end of the line,\" he said.">)
	      (BACK
	       <MOVE-TO ,LAKE-SHORE-2
"It seemed the cave would leave nowhere; and so, with hope fading
for our lost friend, we returned to the mouth of the cave.">)
	      (ENTER-POOL
	       <COND (<FSET? ,UNDERPOOL-2 ,SEEN>
		      <TELL
"For the last time, I dove into the pool, moving swiftly to the
bottom of the tube. And after some second and third thoughts,
I pulled myself around the lip of the tube, and rose to meet my
fate.">
		      <UNDERLAND-1-MOVE>)
		     (<FSET? ,UNDERPOOL-1 ,SEEN>
		      <FSET ,HERE ,ADVISE>
		      <TELL
"With Praxix' encouragement, I descended again through the warm
waters, past the start of the smooth-walled tunnel, and further
still. ">
		      <UNDERPOOL-2-MOVE>)
		     (T
		      <TELL
"It was the consensus that we search the depths of the pool in search of
whatever lay below. I volunteered, and taking a deep breath, plunged into
the warming waters." CR CR>
		      <FSET ,HERE ,ADVISE>
		      <MOVE-TO ,UNDERPOOL-1
"I descended along the rock formations which bounded the pool, admiring
the flowing forms that the water had created through the long ages.
And then, a knot formed in my stomach. For the walls surrounding
me were now smooth, like polished glass. I shuddered, thinking of
what might lie beyond.">)>)
	      (<AND <ACTION? CAST> <OBJECT? FAR-VISION-SPELL>>
	       <TELL
"Praxix was intrigued by this pool, and decided to see just how deep
it was. And so he pulled out some fire and air essence, and shot a ball of
flame into the water; it fizzled out even as it penetrated the surface.">
	       <COND (<IN-PARTY? ,ESHER>
		      <TELL " Esher raised an eyebrow;">)>
	       <TELL " I stifled a laugh." CR CR>
	       <TELL
"Praxix straightened up and, trying his best to sound sincere, said,
\"As I suspected!\"">)>)>

<ROUTINE MAKE-TAG-SUBGROUP ()
	 <MAKE-SUBGROUP ,TAG>
	 <TRAVEL-COMMANDS ,TAG ,EXAMINE-COMMAND>>

<ROUTINE UNDERPOOL-2-MOVE ()
	 <COND (<NOT ,SUBGROUP-MODE>
		<MAKE-TAG-SUBGROUP>)>
	 <MOVE-TO ,UNDERPOOL-2
"I had just about reached the limit of my descent, when I
came to the end of the tube as it opened out into what I could only
imagine was the greater part of the lake. I had to think fast: no
matter which choice I made, I would have to surface at once!">>

<OBJECT UNDERPOOL-1-WALLS
	(LOC UNDERPOOL-1)
	(FLAGS DONT-TAKE)
	(SDESC "walls")
	(KBD %<ASCII !\W>)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"The mirror-smooth walls formed a circle with a diameter of perhaps
twenty feet, easily large enough to maneuver in. But below, the
tunnel seemed to taper, and I was concerned to go farther lest I
get trapped in the constriction.">)>)> 

<ROOM UNDERPOOL-1
      (TRAVEL-COMMANDS DIVE-COMMAND SURFACE-COMMAND NUL-COMMAND)
      (GRAPHIC G-UNDERPOOL)
      (FLAGS UNDERWATER)
      (ENTER
       <EXECUTE ()
		<FSET ,HERE ,SEEN>
		<MAKE-TAG-SUBGROUP>>)
      (ACTION
       <ACOND ()
	      (DIVE
	       <UNDERPOOL-2-MOVE>)
	      (SURFACE
	       <POOL-MOVE
"Frightened and unsure of what to do next, I returned to the surface
and told my story to the others.">)>)>

<ROUTINE POOL-MOVE (STR)
	 <CLEAR-SUBGROUP>
	 <RESTORE-TAG-COMMANDS>
	 <MOVE-TO ,LAKE-POOL .STR>>

<COMMAND LEAVE-TUBE>
<COMMAND ENTER-LAKE>

<OBJECT UNDERPOOL-2-TUBE
	(LOC UNDERPOOL-2)
	(SDESC "tube")
	(KBD %<ASCII !\T>)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"Having little time, I nonetheless examined the tube. It was smooth to
the touch, and of a material completely foreign to me. Here, at the
bottom, it was only four feet across, making it difficult to maneuver.">)>)>

<ROOM UNDERPOOL-2
      (TRAVEL-COMMANDS RETURN-COMMAND LEAVE-TUBE-COMMAND NUL-COMMAND)
      (GRAPHIC G-UNDERPOOL-TUBE)
      (FLAGS UNDERWATER)
      (ENTER FSET-SEEN)
      (ACTION
       <ACOND ()
	      (LEAVE-TUBE
	       <TELL
"Now I am not a cowardly person, yet I was sorely tempted to rise back
to the surface. But some inner reserve of strength guided my actions;
I pulled myself through the lip of the tube, then rose steadily
toward the unknown." >
	       <UNDERLAND-1-MOVE>) 
	      (RETURN
	       <TELL
"Now I am not a cowardly person, though by returning to the surface
it may appear otherwise. And yet, how could I know what I might
find when I rose to the surface outside of the tube? For that matter,
I could not even be sure there was a surface to reach!" CR CR>
	       <POOL-MOVE
"And thus I returned to the safety of the pool, fully aware that my
decision might forever doom our missing friend.">)>)>

<ROUTINE UNDERLAND-1-MOVE ()
	 <COND (<NOT ,SUBGROUP-MODE>
		<MAKE-TAG-SUBGROUP>)>
	 <TELL CR CR>
	 <TELL
"Within moments, I had arrived at the surface, pulling myself out
of another, larger pool and onto a sandy area. Exhausted, yet
exhilarated, I rose to my feet and found myself standing in a wide chamber
cut from the surrounding rock; a finely carved archway led into a dimly
glowing passage. On the archway were runes quite unlike any I had ever seen
before.">
	 <TELL CR CR
"Still somewhat lightheaded from my time underwater, I walked into
the passage, which soon widened into a grander chamber adorned with colorful
banners. I thought I must be dreaming (or dead), but there
was " D ,LAKE-VICTIM ", lying on a bed of straw and covered in a heavy
woolen blanket." CR CR>
	 <MOVE-TO ,UNDERLAND-2
"And as I approached my sleeping friend, I could hear someone approach
from another corridor nearby.">>

<OBJECT UNDERLAND-RUNES
	(LOC UNDERLAND-1)
	(SDESC "runes")
	(KBD %<ASCII !\R>)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"Long flowing symbols comprised the runes on the arch, but the language
and signs were completely foreign to me.">)>)>

;<ROOM UNDERLAND-1
      (TRAVEL-COMMANDS PROCEED-COMMAND NUL-COMMAND NUL-COMMAND)
      (GRAPHIC G-NYMPH-POOL)
      (ACTION
       <ACOND ()
	      (PROCEED
	       )>)>

<COMMAND HIDE>

<OBJECT UNDERLAND-2-MINAR
	(SDESC "Minar")
	(KBD %<ASCII !\M>)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"At first, " D ,LAKE-VICTIM " appeared unnaturally still, perhaps dead. But
the blanket which covered him heaved slowly with his breath, and of this,
I was greatly relieved.">)>)>

<OBJECT UNDERLAND-2-BERGON
	(SDESC "Bergon")
	(KBD %<ASCII !\B>)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"At first, " D ,LAKE-VICTIM " appeared unnaturally still, perhaps dead. But
the blanket which covered him heaved slowly with his breath, and of this,
I was greatly relieved.">)>)>

<ROOM UNDERLAND-2
      (TRAVEL-COMMANDS HIDE-COMMAND STAND-COMMAND NUL-COMMAND)
      (GRAPHIC G-NYMPH-CHAMBER)
      (FLAGS UNDERGROUND)
      (ENTER
       <EXECUTE ()
		<COND (<EQUAL? ,LAKE-VICTIM ,MINAR>
		       <UPDATE-MOVE ,UNDERLAND-2-MINAR ,HERE>)
		      (T
		       <UPDATE-MOVE ,UNDERLAND-2-BERGON ,HERE>)>>)
      (ACTION
       <ACOND ()
	      (HIDE
	       <TELL
"Unsure of the wisdom of being seen, I returned to the passage and
waited. A short while later, a small, very thin man entered the chamber
and started to approach " D ,LAKE-VICTIM ". Then he stopped and spoke.
\"E e'la tri'le'a,\" he said. I did not understand the words, nor, for that
matter, to whom they were intended. He stood waiting, then spoke
again. \"There is no need to hide,\" he said. And so, I came out of
the shadows and approached." CR CR>
	       <MEET-LIURA>
	       <END-NYMPH-STORY>)
	      (STAND
	       <TELL
"I approached " D ,LAKE-VICTIM ", and knelt by his side. He was as alive as
I was (though I had my doubts on this score), and sleeping peacefully." CR CR>
	       <TELL
"A moment later, a small, very thin man walked into the chamber.
\"Al' li'ura fra'm'na,\" he said. His language had great beauty, though
the words were utterly foreign. It was apparent that I did not understand,
so he tried again." CR CR>
	       <MEET-LIURA>
	       <END-NYMPH-STORY>)>)>

<ROUTINE END-NYMPH-STORY ()
	 <PARTY-ADD ,LAKE-VICTIM>
	 <UPDATE-MOVE ,NYMPH-STONE ,INVENTORY>
	 <TELL
"Li'ura and I waited at " D ,LAKE-VICTIM "'s side, without speaking, until
finally, he regained consciousness. When, at last, he was able to walk,
Li'ura asked us to remain where we were, and he left the chamber." CR CR>
	 <TELL
"He returned bearing a blue amulet on the end of a golden chain, and this
he placed around my neck. \"This is a present from the Nymphs,\" he said.
\"We are aware of your quest, and hope this will aid you. I do not mean
to be a poor host, but the two of you must return now; it is forbidden to
allow you into our world.\"" CR CR>
	 <TELL
"Taking us in his arms, he plunged into the water and swiftly swam
in a complicated pattern until, in a matter of moments, we were
deposited along the shore of the lake. Li'ura waved and was gone
beneath the surface. We could see ">
	 <COND (<EQUAL? ,PARTY-MAX 3> <TELL "Praxix">)
	       (T
		<TELL "our party">)>
	 <TELL " in the distance, and were soon reunited with ">
	 <COND (<EQUAL? ,PARTY-MAX 3> <TELL "hi">)
	       (T
		<TELL "the">)>
	 <TELL "m.">
	 <CLEAR-SUBGROUP>
	 <RESTORE-TAG-COMMANDS>
	 <UPDATE-MOVE ,TALE-NYMPHS ,PRAXIX-TALES>
	 <COND (,2ND-PASS
		<TELL CR CR>
		<N-DAY-TREK 3>)
	       (T
		<MOVE-TO ,LAKE-SHORE-3>)>> 

<ROUTINE RESTORE-TAG-COMMANDS ()
	 <TRAVEL-COMMANDS ,TAG
			  ,PICK-UP-COMMAND
			  ,DROP-COMMAND
			  ,INVENTORY-COMMAND>>

<ROUTINE MEET-LIURA ()
	 <GRAPHIC ,G-LIURA>
	 <TELL
"\"I am called Li'ura,\" he said." CR CR>
	 <TELL
"\"I am called " TAG ",\" I replied, bowing slightly at the waist." CR CR>
	 <TELL
"Li'ura repeated my gesture and then spoke. \"Your friend has great luck;
he would be dead if I had not found him in the deep waters.\"" CR CR>>

<OBJECT WARM-POOL
	(SDESC "pool")
	(KBD %<ASCII !\P>)
	(LOC LAKE-POOL)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"Each of us was mesmerized by this lovely pool, whose depth appeared
infinite. " ACT " picked up a rock lying nearby and tossed
it into the water; we watched it as it fell and when it finally
disappeared from sight, we were watching still.">)>)>
 
<COMMAND ENTER-POOL>
<COMMAND DIVE>
<COMMAND SURFACE>

<ROOM UNDERSHORE-1
      (TRAVEL-COMMANDS DIVE-COMMAND SURFACE-COMMAND NUL-COMMAND)
      (FLAGS UNDERWATER)
      (ENTER
       <EXECUTE () <MAKE-SUBGROUP ,TAG> <TRAVEL-COMMANDS ,TAG ,NUL-COMMAND>>)
      (EXIT
       <EXECUTE ()
		<CLEAR-SUBGROUP>
		<RESTORE-TAG-COMMANDS>>)
      (ACTION
       <ACOND ()
	      (DIVE
	       <TELL
"Mustering my remaining strength, I dove farther along the rock
wall. Almost out of air, I caught sight of the wall's bottom some fifty
or more feet below me. \"He could not have gone this way,\" I said to
myself. \"There is not a person alive strong enough!\" And yet, gazing
into the expanse of lake before me, I could hardly imagine where else he
could have gone without leaving the slightest trace." CR CR>
	       <MOVE-TO ,LAKE-SHORE-1
"The water here, thirty feet or so below the surface, was strangely warm
and comforting, but some inner alarm awakened me to my danger. It would be
madness to go further, so I ascended to the surface.">)   
	      (SURFACE
	       <TRAVEL-COMMANDS ,LAKE-SHORE-1
				,PROCEED-COMMAND
				;,DIVE-COMMAND>
	       <TELL
"With no sign of " D ,LAKE-VICTIM ", I returned to the surface and reported
back to the group.">
	       <MOVE-TO ,LAKE-SHORE-1>)>)>  
