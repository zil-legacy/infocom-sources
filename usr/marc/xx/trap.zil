"TRAP for
		      		JOURNEY
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<GLOBAL TRAP-VICTIM <>>

<ROOM GROUP-FOREST
      (TRAVEL-COMMANDS PROCEED-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS DONT-SCOUT)
      (GRAPHIC G-FOREST)
      (ENTER
       <EXECUTE ()
		<COND (<IN-PARTY? ,UMBER>
		       <PARTY-CHANGE ,UMBER ,TAG>
		       <FSET ,TAG ,SUBGROUP>)>
		<COND (,A-B-FLAG
		       <SETG TRAP-VICTIM
			     <FIRST-IN-PARTY ,BERGON ,ESHER ,MINAR>>)
		      (T
		       <SETG TRAP-VICTIM
			     <FIRST-IN-PARTY ,ESHER ,MINAR>>)>
		<DIVIDER>
		<TELL
"\"There!\" " CHR ,TRAP-VICTIM " cried, pointing to the ">
		<COND (<EQUAL? ,PRAXIX-SIGNAL ,FAR-VISION-SPELL>
		       <TELL "ball of flame speeding away from an
unseen spot">)
		      (<EQUAL? ,PRAXIX-SIGNAL ,LIGHTNING-SPELL>
		       <TELL "bolts of lightning striking the ground
somewhere">)
		      (T
		       <TELL "sheets of rain falling on a small piece
of ground somewhere">)>
		<TELL
" to the north. \"It's Praxix, sending us a signal!\"" CR CR>
		<TELL
"It had been six hours or more since we had separated from Praxix, and
we were losing hope of finding him again. The sighting of this magical
manifestation raised our spirits, and we prepared to make our way in his
direction.">
		<NEW-DEFAULT>>)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <TELL
"It wasn't long before we were on our way toward what we presumed to be
Praxix' location. The forest had thinned out somewhat, and we walked
with ease through the leaf-covered ground. " CHR ,LEADER " was in the
lead, and our spirits were high." CR CR>
	       <TELL
"But all this changed in a moment, as " CHR ,TRAP-VICTIM " tripped an
invisible cord, setting off a trap. A net, hidden under the mat of fallen
leaves, rose up from the ground, entangling him and lifting him high into the
air. Before " <I/WE 2> " had time to react, the guttural voices of orcs could
be heard nearby, moving in " <MY/OUR 2> " direction.">		
	       <PARTY-REMOVE ,TRAP-VICTIM>
	       <MOVE-TO ,TRAP-SITE>)>)>

<COMMAND FREE-HIM>

<COMMAND TO-PRAXIX>

<COMMAND FOLLOW-ORCS>

<ROOM TRAP-SITE
      (TRAVEL-COMMANDS FREE-HIM-COMMAND HIDE-COMMAND NUL-COMMAND)
      (GRAPHIC G-ORC-TRAP)
      (FLAGS DONT-SCOUT ADVISE)
      (ACTION
       <ACOND ()
	      (GET-ADVICE:REMOVE
	       <TELL
"In discussing our course of action, we were inclined to pursue the faint
hope of rescuing " D ,TRAP-VICTIM " from his captors.">
	       <TELL CR CR
"\"I'm afraid " D ,TRAP-VICTIM " may not survive the orcs long
enough for us to find Praxix,\" I said.">)
	      (TO-PRAXIX
	       <LEAVE-VICTIM-WITH-ORCS>)
	      (FOLLOW-ORCS
	       <TELL
"Subtlety of movement not being among their strengths, it was a
simple matter to find the orcs' camp, not far from where the
trap had been set. As " <I/WE> " approached, a noisome odor permeated the air,
in itself a sign that orcs were near. When " <I/WE> " arrived, " <I/WE>
" found that dozens
of orcs were here, perhaps hundreds, living in abject squalor, either out in
the open or in makeshift tents of rotten cloth. There was no sign
of " D ,TRAP-VICTIM ".">
	       <MOVE-TO ,OUTSIDE-ORC-CAMP>)
	      (<OR <ACTION? FREE-HIM> <ACTION? HIDE>>
	       <COND (<ACTION? FREE-HIM>
		      <TELL
"\"Quickly!\" " D ,TRAP-VICTIM " said, \"The orcs are almost here!\"" CR CR>
		      <TELL
"Hurrying to cut the heavily intertwined layers of rope, " <I-WAS/WE-WERE 2>
" swiftly running out of time. The orcs were nearly upon " <ME/US 2> ", and "
<I/WE 2> " would be badly outnumbered. Having little choice">)
		     (T
		      <TELL
"With little chance of helping " D ,TRAP-VICTIM " before the orcs
arrived">)>
	       <TELL
", " <I/WE 2> " hid in the brush nearby, waiting for a better opportunity to
help. It was a matter of moments before a half-dozen orcs arrived, armed to
the teeth." CR CR>
	       <TELL
"Laughing and taunting, the hideous creatures poked and prodded
our friend while " <I/WE 2> " could do nothing more than watch in horror.
Finally, they took him down and bound him, then led him off into the forest.">
	       <TRAVEL-COMMANDS ,HERE
				,TO-PRAXIX-COMMAND
				,FOLLOW-ORCS-COMMAND>)>)>

<COMMAND ENTER-CAMP>

<COMMAND USE O-USE ()
	 <TELL
"There was little of the red rock left, and this did not appear to
be a good time to use it.">>

<ROUTINE O-USE ()
	 <PUT ,O-TABLE 0 1>
	 <PUT ,O-TABLE 1 ,RED-ROCK>>

<ROOM OUTSIDE-ORC-CAMP
      (TRAVEL-COMMANDS ENTER-CAMP-COMMAND TO-PRAXIX-COMMAND NUL-COMMAND)
      (GRAPHIC G-OUTSIDE-ORC-CAMP)
      (FLAGS DANGEROUS ADVISE)
      (ENTER FSET-SEEN)
      (ACTION
       <ACOND ()
	      (GET-ADVICE:REMOVE
	       <TELL ACT
" asked for advice, and between us we thought up a few suggestions, all bad.
We would certainly be massacred if we attempted storming the orc camp, and even
then we could not know where " D ,TRAP-VICTIM " was being held.">
	       <COND (<FSET? ,ACTIVE-MINE ,SOLVED>
		      <TELL
"\"I wish I knew how the miner did it,\" I said, wistfully thinking back to
his magical disappearances.">)>
	       <RTRUE>) 
	      (<AND <ACTION? INVENTORY>
		    <NOT <F&SET? ,HERE ,EXAMINED>>>
	       <TELL
"The situation appeared grim, and I wondered if there might be anything
in my pack which would help.">
	       <COND (<IN? ,RED-ROCK ,INVENTORY>
		      <FSET ,RED-ROCK ,DEAD>
		      <TELL
" To my astonishment, I came up literally empty-handed, for as I pulled my
hand from the pack, I found it to be entirely transparent. And then I
put two pieces together: the disappearing miner and the pieces of red rock
that had inadvertantly fallen from his sack." CR CR>
		      <TELL
"Reaching back into the pack, I noticed that one of the red rocks had crumbled
to a fine powder. \"A magical reagent!\" I said to myself, proud to have
made such an important discovery. \"Praxix will be pleased - if we find him,
that is.\"">
		      <TRAVEL-COMMANDS ,TAG
				       ,PICK-UP-COMMAND
				       ,USE-COMMAND
				       ,INVENTORY-COMMAND>)
		     (T
		      <TELL
" It appeared there was not; ">
		      <COND (<FSET? ,ACTIVE-MINE ,SOLVED>
			     <TELL
"how I wished we had found the secret to the miner's disappearing trick.
It would certainly come in handy just about now!">)
			    (T
			     <TELL
"I sighed deeply, certain that " D ,TRAP-VICTIM " was beyond help.">)>)>)
	      (USE
	       <SETG RED-ROCK-COUNT <- ,RED-ROCK-COUNT 1>>
	       <RESTORE-TAG-COMMANDS>
	       <TELL
"Determined to save " D ,TRAP-VICTIM ", I took one of the two red rocks
in my pack and pummelled it into a fine powder which I then spread across
my body. In a matter of moments, I was completely invisible! Not
knowing how long the powder would work, I moved quickly into the heart of
the orcs' camp." CR CR>
	       <TELL
"It took quite a while, but I finally found " D ,TRAP-VICTIM ", bound and
gagged inside a tent alongside the cooking area." CR CR>
	       <TELL
"\"Psst! " D ,TRAP-VICTIM "!\" I whispered from just beside his right ear.
He nearly jumped out of his bonds at the sound of my voice." CR CR>
	       <TELL
"\"Mmgmm rumggm,\" he said frantically through his gag." CR CR>
	       <TELL
"\"Calm down,\" I said, \"I'm just invisible.\" It didn't take long to
free him, but we now faced a difficult decision.">  
	       <PARTY-ADD ,TRAP-VICTIM>
	       <MAKE-SUBGROUP ,TAG ,TRAP-VICTIM>
	       <MOVE-TO ,ORCS-CAMP>)
	      (SCOUT:REMOVE
	       <TELL ACT
" went off to scout out the orcs camp. A few minutes later, he
returned." CR CR>
	       <TELL
"\"Lots of orcs,\" he said, panting, \"but no sign of " D ,TRAP-VICTIM
". He's probably being held in one of the tents.\"">)
	      (ENTER-CAMP:REMOVE
	       <TELL
"One thought was to enter the orcs' camp, and attempt to find our
captured friend. But the odds of success were staggeringly small;
after all, " <I-WAS/WE-WERE 2> " not invisible! No, that would not work, but "
<I/WE 2> " felt that there must be some strategy that would.">)
	      (TO-PRAXIX
	       <LEAVE-VICTIM-WITH-ORCS>)>)>

<ROUTINE LEAVE-VICTIM-WITH-ORCS ()
	 <HINT ,HINT-ORC-TRAP>
	 <TELL D ,TRAP-VICTIM
" was finished; the orcs did not keep prisoners, except for
the amusement of their torture. It was a difficult decision, but
there was no alternative - ">
	 <TELL <I/WE 2>>
	 <REJOIN-AT-CASTLE
" marched in the direction of Praxix' signal">>

<COMMAND USE-RED-ROCK>
<COMMAND RUN-FOR-IT>

<ROOM ORCS-CAMP
      (TRAVEL-COMMANDS USE-RED-ROCK-COMMAND RUN-FOR-IT-COMMAND NUL-COMMAND)
      (GRAPHIC G-ORC-TENT)
      (FLAGS DANGEROUS ADVISE)
      (ENTER
       <EXECUTE ()
		<CIT ,TAG ,GET-ADVICE-COMMAND>>)
      (ACTION
       <ACOND ()
	      (GET-ADVICE:REMOVE
	       <TELL
"First, I looked out from the tent and, indeed, the coast was clear. But
how long would that last? It seemed safest to use the red rock, but it
was the last one I had, and I feared using the last of this potent
magic. After all, what would Praxix say?" CR CR>
	       <TELL
"\"You have done well in getting this far, \"" D ,TRAP-VICTIM " said,
\"Use your instincts and I'm sure we will survive.\"">)
	      (USE-RED-ROCK
	       <SETG RED-ROCK-COUNT <- ,RED-ROCK-COUNT 1>>
	       <UPDATE-REMOVE ,RED-ROCK>
	       <TELL
"Taking the last of the red rocks from my pack, I crushed it into a
powder and spread it over " D ,TRAP-VICTIM ", who obligingly disappeared.
Leaving the orcs' camp had been as simple as entering, and we were soon out
of danger. Not long afterward, we reappeared.">  
	       <TRAP-VICTIM-SAVED>)
	      (RUN-FOR-IT
	       <TELL
"Hoping to save as much reagent as possible, we waited for an opportune
moment, then dashed into the safety of the nearby trees. Certain we had
not been seen, we put some more distance between ourselves and the orcs."> 
	       <TRAP-VICTIM-SAVED>)>)>

<ROUTINE TRAP-VICTIM-SAVED ()
	 <TELL CR CR
"\"Thank you, " TAG ",\" " D ,TRAP-VICTIM " said, placing his arm around
my shoulder. \"I hope the orcs are not too disappointed; it seems I was
expected for dinner!\" We laughed, but then " D ,TRAP-VICTIM "'s face turned
grim." CR CR>
	 <TELL
"\"I am afraid the orcs have seen Praxix' signal as well,\" he said.
\"We had best move quickly; I would hate to have them arrive first!\"" CR CR>
	 <REJOIN-AT-CASTLE
"I retraced my steps from the orcs' camp, and we found our way back to our
starting point. Moving as quickly and quietly as possible in the direction
of Praxix' signal">>

<ROUTINE REJOIN-AT-CASTLE (STR)
	 <TELL .STR
", " <I/WE 2> " came within
the hour to the edge of a large clearing, inside of which stood the ruins of
an ancient castle.">
	 <COND (<IN-PARTY? ,BERGON>
		<TELL CR CR
"\"Praxix is here,\" Bergon said, \"I can feel it.\"">)>
	 <DIVIDER>
	 <COND (<FSET? ,UMBER ,SUBGROUP>
		<PARTY-CHANGE ,TAG ,UMBER>
		<MAKE-SUBGROUP ,PRAXIX ,UMBER>)
	       (T
		<MAKE-SUBGROUP ,PRAXIX>)>
	 <TELL
"Praxix laughed to himself. What were the odds, he thought, of the signal
being seen by the others? It little mattered, for there was little else
for him to do.">
	 <COND (<IN? ,SIXTH-STONE ,PRAXIX>
		<TELL CR CR>
		<PRAXIX-WAITS-FOR-PARTY>) 
	       (T
		<MOVE-TO ,PRAXIX-SIGNAL-ROOM>)>>

<ROUTINE PRAXIX-WAITS-FOR-PARTY ()
	 <COND (<IN? ,SIXTH-STONE ,PRAXIX>
		<UPDATE-MOVE ,SIXTH-STONE ,INVENTORY>
		<TELL
"In truth, he had already done extremely well; the Stone was his. ">)>
	 <TELL "All that
was left was to wait and hope. Sitting down at the side of the moat, he ">
	 <COND (<IN-PARTY? ,UMBER>
		<TELL "and Umber ">)>
	 <TELL "rested">
	 <COND (<IN-PARTY? ,UMBER>
		<TELL "; hoping to avoid any further conversation with Umber,
Praxix feigned sleep">)>
	 <TELL ".">
	 <DIVIDER>
	 <GRAPHIC ,G-PARTY-RESCUES-PRAXIX>
	 <COND (<IN-PARTY? ,UMBER>
		<TELL "They were both">)
	       (T
		<TELL "He was">)>
	 <TELL
" awakened by the sound of my voice. \"Praxix! Wake up!\"
I shouted from across the moat. Using our rope, " <I/WE 2> " rescued ">
	 <COND (<IN-PARTY? ,UMBER> <TELL "them">)
	       (T
		<TELL "him">)>
	 <TELL " from the castle, and we were soon reunited." CR CR>
	 <COND (<NOT <FSET? ,CASTLE-TROVE ,SEEN>>
		<HINT ,HINT-DUNGEON>)
	       (<NOT <IN? ,SIXTH-STONE ,INVENTORY>>
		<HINT ,HINT-STONES>)>
	 <COND (<IN-PARTY? ,UMBER>
		<PARTY-CHANGE ,UMBER ,TAG>
		<TELL
"Although we asked him to join us, Umber seemed in a hurry to return
to Zan and profit from his pillage of the castle." CR CR>
		<TELL
"\"Perhaps we shall meet again some day,\" he said to Praxix, and
without further ado retreated into the forest." CR CR>
		<TELL
"\"Interesting fellow,\" Praxix said, \"though I believe I preferred
him as a tree.\"" CR CR>)>
	 <CLEAR-SUBGROUP>
	 <COND (,A-B-FLAG
		<TELL
"Praxix listened with great interest as " <I/WE 2> " told of "
<MY/OUR 2> " adventures.">
		<COND (<FSET? ,RED-ROCK ,SOLVED>
		       <TELL CR CR
"\"Tell me, " TAG ",\" Praxix said, \"Have you got the red rocks you
took from the mines?\"" CR CR>
		       <COND (<IN? ,RED-ROCK ,INVENTORY>
			      <TELL
"I said that I did, and, rummaging through my pack, retrieved what
remained, giving them to Praxix." CR CR>)
			     (T
			      <TELL
"I admitted that I did not, having used them both in saving " D ,TRAP-VICTIM
" from almost certin death at the hands of the orcs." CR CR>
			      <TELL
"\"Then you have used them well,\" Praxix replied reassuringly, \"I
would happily take " D ,TRAP-VICTIM " over any number of magical
spells.\" And yet, I sensed Praxix' disappointment over not having
this powerful magic at his disposal.">)>
		       <UPDATE-REMOVE ,RED-ROCK>
		       <COND (<EQUAL? ,RED-ROCK-COUNT 2>
			      <TELL
"\"As you may have guessed, the miner used these rocks to make himself
invisible,\" Praxix continued, putting the rocks in his cloak, \"An
invisibility spell may well come in useful!\"">
			      <COND (<FSET? ,OUTSIDE-ORC-CAMP ,SEEN>
				     <TELL CR CR
"\"It might have saved " D ,TRAP-VICTIM ",\" I said, frustrated at
having ">
				     <COND (<FSET? ,RED-ROCK ,DEAD>
					    <TELL "not used them.">)
					   (T
					    <TELL
"having forgotten that I had been carrying them. \"If only I had
understood!\"">)>
				     <TELL CR CR
"\"Do not be so hard on yourself, " TAG ",\" Praxix replied, \"Only
a Wizard could have known the secret of the red rock.\"">)>)
			     (<EQUAL? ,RED-ROCK-COUNT 1>
			      <TELL
"\"As you have discovered, these rocks are the key to the miner's
'disappearances,'\" Praxix continued, putting the red rock in his cloak,
\"An invisibility spell may be useful again some day!\"">)>
		       <TELL CR CR>)
		      (T
		       <TELL " ">)>
		<TELL
"And then, we started back to Astrix in his Sunrise Tower.">
		<PART-TWO-ENDING>)
	       (T
		<TELL
"\"It is good we have found you, Praxix,\" Bergon said, \"for we
have still not found the Dwarvish gate that Astrix has sent us to
find.\"" CR CR>
		<TELL
"\"My sense is that is due west of here,\" Praxix responded, and
there were none to dispute his instinct." CR CR>
		<TELL
"Following Praxix' advice, we marched west, coming to a path which
led directly to the place Astrix had described, the Bern i-Fen. And
here, under a cloudy sky, we camped for the night.">
		<NEXT-DAY>
		<MOVE-TO ,FOREST-GATE>)>> 

<ROUTINE PART-TWO-ENDING ()
	 <TELL CR CR
"Astrix was fascinated by our account of our adventures,">
	 <COND (<AND <IN? ,SPIRIT-STONE ,INVENTORY>
		     <IN? ,SIXTH-STONE ,INVENTORY>>
		<TELL
" and delighted that we had found the Two stones." CR CR>
		<COND (<L? ,PARTY-MAX 5>
		       <TELL
"\"But this is not enough,\" Astrix said. \"The last stone, the Anvil,
will be the most difficult to obtain, and your party has not the strength
in numbers to accomplish the deed. Alas that you have come so far only to be
defeated at the end!\"" CR CR>
		       <PART-ONE-BAD-ENDING T>)
		      (T
		       <TELL
"\"I believe, for the first time, that we may be able to end the Darkness
that comes from the north,\" Astrix said. \"The Sisters we have, and the
Two; one last task awaits you!\"" CR CR>
		       <MOVE-TO ,THREE-CONNECTOR>)>)
	       (T
		<TELL " but frankly disappointed." CR CR>
		<COND (<OR <IN? ,SPIRIT-STONE ,INVENTORY>
			   <IN? ,SIXTH-STONE ,INVENTORY>>
		       <TELL
"\"You have done well to find even one of the Two, but I fear it is
not">)
		      (T
		       <TELL
"\"You have failed in finding the Two; even had you found one of them,
I fear it would not be">)>
		<TELL " enough,\" Astrix said. ">
		<PART-ONE-BAD-ENDING>)>>
