"MINES for
		      		JOURNEY
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<COMMAND TOMB>

<COMMAND THIS-LEVEL>

<ROOM MINE-2-W
      (TRAVEL-COMMANDS THIS-LEVEL-COMMAND DOWN-COMMAND NUL-COMMAND)
      (GRAPHIC G-MID-STAIR)
      (FLAGS UNDERGROUND DONT-SCOUT)
      (ACTION
       <ACOND ()
	      (DOWN:REMOVE
	       <TELL
"Again, we started down these dismal stairs, but were soon met with
disappointment - the walls around the stairs had crumbled, completely
blocking our path." CR CR>
	       <COND (<IN-PARTY? ,HURTH>
		      <TELL
"\"This bodes ill for us,\" said Hurth, \"if we are to reach the
lower regions. It is possible there we will find another stair at
the higher level, though I have not heard of one.\"" CR CR>)>
	       <FSET? ,HERE ,TRAPPED>
	       <TELL
"And so we trudged back up the stairs, finally reaching the landing
above.">) 
	      (THIS-LEVEL
	       <TELL
"The road started to curve toward the right here. ">
	       <COND (<IN-PARTY? ,HURTH>
		      <TELL "Hurth">)
		     (T
		      <TELL "Praxix">)>
	       <TELL ", in the lead,
held us back. \"Orcs!\" he said in a harsh whisper, \"This is very bad.
They block the road that lies ahead.\"" CR CR>
	       <TELL
"But Bergon noticed a narrow slit of a passage that lay directly before us.
\"We might avoid the orcs by taking this passage,\" he said.">
	       <MOVE-TO ,MINE-1-W>)>)>

<COMMAND ENTER-SLIT>

<ROOM MINE-1-W
      (TRAVEL-COMMANDS BACK-COMMAND ENTER-SLIT-COMMAND NUL-COMMAND)
      (GRAPHIC G-ORC-VIEW)
      (FLAGS UNDERGROUND)
      (ACTION
       <ACOND ()
	      (BACK:REMOVE
	       <TELL
"Bergon suggested that we retreat in search of a better route, but was
dissuaded by ">
	       <COND (<IN-PARTY? ,HURTH>
		      <TELL 
"Hurth. \"The principal route through this level heads to
the north up ahead; there is no point in turning back, lest we
foresake our purpose.\"">)
		     (T
		      <TELL
"Praxix. \"We have no choice, if we are to find the Stone, but to
find a path to the lower caverns.\"">)>)
	      (<OR <ACTION? ENTER-SLIT>
		   <AND <ACTION? SCOUT>
			<NOT <F&SET? ,HERE ,SCOUTED>>>>
	       <COND (<ACTION? ENTER-SLIT>
		      <REMOVE-PARTY-COMMAND ,ENTER-SLIT-COMMAND>
		      <FSET ,HERE ,SCOUTED>
		      <TELL
"Bergon motioned for us to follow the narrow passage, but Hurth suggested
caution. \"Let me scout ahead,\" he said, and crossed swiftly to the
slit.">)
		     (T
		      <UPDATE-FSET ,HERE ,DONT-SCOUT>
		      <TELL
"Rather than risking the entire party, Hurth was sent across to the
narrow passage.">)>
	       <TELL CR CR
"Returning a short while later, he reported on the situation, drawing
a map in the fine dust at our feet. \"We are here, on this east-west
path; the orcs are guarding the junction where a larger path, leading
north, crosses it. The path I took winds its way north and then
east, opening out on the northern road just a few dozen paces from
the orcs' position. There is no chance we could move that way without
attracting their attention.\"" CR CR>
	       <TELL
"Bergon stared at the crude map and was convinced. \"There is also the
chance we may be seen crossing over to the slit itself,\" he
added glumly.">
	       <SCENE ,PRAXIX-DIVERSION>)>)> 

<OBJECT PRAXIX-DIVERSION
	(GRAPHIC G-PRAXIX-DIVERSION)
	(ACTION
	 <ACOND ("AUX" TMP)
		(SCENE-START
		 <TELL CR CR
"\"I've got an idea,\" Praxix whispered; he then dashed across to
the narrow passage, and was gone.">
		 <MAKE-SUBGROUP ,PRAXIX>
		 <UPDATE-REMOVE ,LIGHT-SPELL>
		 <MOVE-TO ,PRAXIX-DIVERSION-ROOM>)
		(SCENE-END
		 <CLEAR-SUBGROUP>
		 <UPDATE-MOVE ,LIGHT-SPELL ,UNDERGROUND-SPELLS>
		 <COND (<FSET? ,REAGENT ,SOLVED>
			<TRAVEL-COMMANDS ,PRAXIX
					 ,CAST-COMMAND
					 ,MIX-COMMAND
					 ,EXAMINE-COMMAND>)
		       (T
			<TRAVEL-COMMANDS ,PRAXIX
					 ,CAST-COMMAND
					 ,EXAMINE-COMMAND>)>
		 <COND (<FSET? ,HERE ,ENCHANTED>
			<MOVE-TO ,ORC-JUNCTION>)
		       (<FSET? ,PRAXIX ,TRAPPED>
			<TELL CR CR>
			<FCLEAR ,PRAXIX ,TRAPPED>
			<TELL
"From our point of view, whatever Praxix had done was working
brilliantly. The orcs had fled, and we now gingerly entered the road
junction, expecting to find Praxix nearby. But of orcs and Praxix
there was none, and so we stood there, unsure of what to do next." CR CR>
			<TELL
"But we didn't have to wait long to find out, for the orcs were
soon rampaging back in our direction. \"Quickly! This way!\" Bergon
shouted, shepherding us down the passage that lay to the east." CR CR>
			<COND (<IN-PARTY? ,ESHER> <SET TMP ,ESHER>)
			      (<IN-PARTY? ,MINAR> <SET TMP ,MINAR>)
			      (T
			       <SET TMP ,HURTH>)>
			<TELL
"\"Wait!\" shouted " D .TMP ", \"There's Praxix!\" " D .TMP " pointed at
the Wizard who had apparently managed to sneak back through the
slit and was in danger of being cut off by the orcs before
he could reach us. And then, " D .TMP " charged at the oncoming orcs, giving
Praxix enough time to reach our side.">
			<COND (<NOT <EQUAL? .TMP ,HURTH>>
			       <TELL " But it was too late for " D .TMP ";
he was cut to pieces, and left for dead on the ground.">
			       <HINT ,HINT-DIVERSION>
			       <KILLED-OFF .TMP>)
			      (T
			       <TELL " Hurth fought brilliantly, and
was nearly cut to ribbons before arriving back at our sides.">)>
			<TELL CR CR
"With no time to lose, we sped down the eastern path. But any relief we
may have felt">
			<MOVE-TO ,MINE-1-E ,SHORT-LIVED-RELIEF>)
		       (T
			<MOVE-TO ,MINE-1-W>)>)>)>

<CONSTANT SHORT-LIVED-RELIEF
" was short-lived, as the wide path soon narrowed to the
point that we could march only in single file. Two sounds could clearly
be heard: the sound of rushing water from somewhere nearby, and far more
ominously, the pounding footfalls of orcs moving ever closer.">

<OBJECT P-D-R-ORCS
	(LOC PRAXIX-DIVERSION-ROOM)
	(SDESC "orcs")
	(FLAGS DONT-TAKE DONT-EXAMINE)>

<ROOM PRAXIX-DIVERSION-ROOM
      (TRAVEL-COMMANDS RETURN-COMMAND NUL-COMMAND NUL-COMMAND)
      (CAST-LIMIT INF)
      (FLAGS UNDERGROUND)
      (ENTER
       <EXECUTE ()
		<TELL
" Following the tunnel to the point at which it met the main road
heading off to the north, Praxix peered around the corner, spying
the orcs nearby. The road was dark, but not perfectly so, as the light
from the orcs' torches flickered dimly on the rocky walls. It would
be difficult enough to surprise these orcs, so Praxix laid down his
glowing staff in the blackness of the tunnel and stepped out into middle
of the road.">>)
      (ACTION
       <ACOND ()
	      (<AND <FSET? ,HERE ,SCOUTED>
		    <NOT <GAME-ACTION?>>>
	       ;"The orcs have been alerted."
	       <TELL
"It was only moments before the orcs were racing down the road
in Praxix' direction, howling their war-cries.">
	       <COND (<AND <ACTION? CAST> <OBJECT? LEVITATE-SPELL>>
		      <GRAPHIC ,G-CHARGING-ORCS-FROM-ABOVE>
		      <TELL " But Praxix had prepared his elevation
spell beforehand, and he rose into the air in time to marvel at the sight
of a dozen or so rampaging orcs flying down the halls beneath him and
continuing out of sight. Descending
back to earth, Praxix brushed himself off, retrieved his staff, and
nonchalantly walked back to the junction." CR CR>
		      <TELL
"\"Come along, come along!\" he said, prodding us with his staff.
\"I expect they'll be back soon enough.\"">
		      <COND (<IN-PARTY? ,HURTH>
			     <TELL CR CR
"\"I am impressed,\" said Hurth, and so were we all.">)>
		      <FSET ,HERE ,ENCHANTED>)
		     (<OR <ACTION? CAST> <ACTION? USE-MIX>>
		      <FSET ,PRAXIX ,TRAPPED>
		      <GRAPHIC ,G-CHARGING-ORCS>
		      <TELL " \"Oh, dear. I wasn't expecting this,\"
Praxix said to himself as he hurriedly tried to cast his enchantment at
the oncoming orcs. It can truly be said that the orcs were startled by
the show of thaumaturgical skills, but this was not going to hold them
for long!">)
		     (<ACTION? RETURN>
		      <FSET ,PRAXIX ,TRAPPED>
		      <GRAPHIC ,G-CHARGING-ORCS>
		      <TELL " Now, it had been Praxix' idea to quickly
retreat to the narrow passage and thereby rejoin the group. In practice,
however, he was seen by the oncoming orcs, and rather than lead them back
toward our party, he withdrew farther into the northern path. The orcs
approached with weapons drawn and a fire in their eyes.">)> 
	       <SCENE <>>
	       <RTRUE>)
	      (CAST
	       <COND (<OBJECT? LEVITATE-SPELL>
		      <SAVE-SPELL>
		      <REMOVE ,HYE-DIVERSION>
		      <TELL
"As an experiment, he cast the elevation spell on himself, and rose
into the darkness. A moment later, he located the top of the passageway with
his forehead. \"Oomph!\" he blurted out in a muffled sort of way that came
dangerously close to attracting the attention of the orcs. Biting his
lower lip and rubbing his head, he soon settled to the ground. \"Should do
nicely,\" he said to himself, and he brushed some crumbled rock off of his
clothes.">)
		     (<OR <OBJECT? FAR-VISION-SPELL>
			  <OBJECT? WIND-SPELL>
			  <OBJECT? TREMOR-SPELL>>
		      <RESTORE-SPELLS>
		      <TELL
"Praxix' plan was this: to create a diversion which would draw the entire
contingent of orcs in his direction, thereby allowing the group to
pass unseen through the junction. And so, taking the ">
		      <COND (<OBJECT? FAR-VISION-SPELL>
			     <TELL "essences of fire and air">)
			    (<OBJECT? TREMOR-SPELL>
			     <TELL "essence of earth">)
			    (T
			     <TELL "essence of air">)>
		      <TELL " from his pouch, he cast the enchantment." CR CR>
		      <TRAVEL-COMMANDS ,HERE ,RETURN-COMMAND>
		      <COND (<OBJECT? FAR-VISION-SPELL>
			     <TELL
"The ball of flame flew from his fingertips, and shot forward toward
the unsuspecting orcs, who reacted predictably by grabbing their
weapons and shouting in their guttural tongue. It was a good thing
that the fireball blinded">)
			    (<OBJECT? TREMOR-SPELL>
			     <TELL
"A great roar erupted from the earth, and the ground started to split
before him. The unsuspecting orcs were startled and frightened, and
were soon grabbing their weapons. It was lucky, though, that their
confusion distracted">)
			    (T
			     <TELL
"A cold gust of wind blew toward the unsuspecting orcs, where were very
nearly swept off their feet. It was a safe bet that their attention had
been grabbed; next it would be their weapons. Fortunately, the blowing
dust and wind distracted">)>
		      <TELL
" them enough to momentarily protect Praxix from their view.">
		      <FSET ,HERE ,SCOUTED>)>)
	      (RETURN:REMOVE
	       <COND (<NOT <FSET? ,HERE ,SCOUTED>>
		      <NEW-DEFAULT <PARTY-PCM ,PRAXIX> 1>
		      <TELL
"Sadly, though predictably, Praxix had forgotten his idea and prepared
to return to the group. Fortunately, he thought again. \"A spell,\"
he said to himself with some assurance, \"Yes, that's it. I
was going to cast a spell. Now which spell was it?\"">)>)>)>

<ROOM ORC-JUNCTION
      (TRAVEL-COMMANDS PROCEED-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND DONT-SCOUT)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <TELL
"It was with great relief that we headed away from
the junction. But the relief">
	       <TELL ,SHORT-LIVED-RELIEF CR CR>
	       <TELL
"\"I fear the orcs are somewhat more clever than we anticipated,\" Praxix
said, trying not to appear disturbed. \"Let us hope there is some escape
for us farther along the way.\"">
	       <MOVE-TO ,MINE-1-E>)>)>

<COMMAND JUMP>

<ROOM MINE-1-E
      (TRAVEL-COMMANDS PROCEED-COMMAND BACK-COMMAND NUL-COMMAND)
      (GRAPHIC G-NARROW-SLIT)
      (FLAGS UNDERGROUND DANGEROUS)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <TELL
"Ahead, the passage opened up into a wider hall, and we moved quickly
in anticipation of escape. But the hall ended blindly. All around,
the sound of water was nearly deafening, and moment by moment, the
dull thump of orc footsteps moved ever closer; it seemed that tragedy
was close at hand.">
	       <MOVE-TO ,ABOVE-FLUME>)
	      (<OR <ACTION? BACK>
		   <AND <ACTION? SCOUT>
			<NOT <F&SET? ,HERE ,SCOUTED>>>>
	       <UPDATE-FSET ,HERE ,DONT-SCOUT>
	       <REMOVE-PARTY-COMMAND ,BACK-COMMAND>
	       <COND (<ACTION? BACK>
		      <SETG ACTOR <FIRST-IN-PARTY ,HURTH ,ESHER ,PRAXIX>>)>
	       <TELL
"Rather than attempt to retrace our steps and fall into the hands of
the orcs, we sent " ACT " to quickly and quietly check out our rear.
Moments later, he returned. \"They are not far behind, but they
move more slowly and there is hope in that.\"" CR CR>
	       <TELL
"\"I fear there is another explanation,\" Praxix replied gloomily, and we
soon found out what he meant.">)>)>

<COMMAND FLUME>

<COMMAND ENTER-CLEFT>

<ROOM MINER-PASSAGE
      (TRAVEL-COMMANDS ENTER-CLEFT-COMMAND BACK-COMMAND NUL-COMMAND)
      (GRAPHIC G-MINER-PASSAGE)
      (FLAGS UNDERGROUND DONT-SCOUT)
      (ENTER FSET-SEEN)
      (ACTION
       <ACOND ()
	      (ENTER-CLEFT
	       <MOVE ,ACTIVE-MINE-WALLS ,ACTIVE-MINE>
	       <MOVE-TO ,ACTIVE-MINE>)
	      (BACK
	       <TELL
"Unable to determine the cause of the tapping, and finding only a
dead-end passage here, we returned to the ">
	       <COND (<FSET? ,OLD-MINE ,SOLVED>
		      <MOVE-TO ,MINE-LOWER-STAIR "bottom of the stairs.">)
		     (T
		      <MOVE-TO ,MINE-JUNCTION "mine junction.">)>)>)>

;"A miner, 49er..."

<COMMAND ASK-MINER O-ASK-MINER ()
	 <TELL-TALE ,ACTION-OBJECT>
	 <RTRUE>>
	 
<OBJECT ASK-MINER-OBJECTS>

<OBJECT RED-ROCK
	(SDESC "red rock")
	(KBD %<ASCII !\R>)
	(FLAGS DONT-DROP DONT-CAST)
	(ACTION
	 <ACOND ()
		(PICK-UP
		 <UPDATE-MOVE ,RED-ROCK ,INVENTORY>
		 <FSET ,RED-ROCK ,DONT-EXAMINE>
		 <FSET ,RED-ROCK ,SOLVED>
		 <TELL
"Praxix seemed very much more interested in the red rock than did the
miner, though he did not say why. Just in case, I picked up a few
small rocks and placed them in my pack for safe keeping.">)
		(EXAMINE:CLEAR
		 <TELL ACT
" reached down to pick up the red rock, but was interrupted by the
miner." CR CR>
		 <TELL
"\"That, my friend, is what you might call junk rock,\" the miner said
with an unmistakable tension in his voice. \"Pretty enough, but not worth a
tinker's damn.\"">)>)>

<OBJECT ASK-MINER-ROCKS
	(LOC ASK-MINER-OBJECTS)
	(SDESC "rocks")
	(KBD %<ASCII !\R>)
	(TEXT
	 <EXECUTE ()
		  <UPDATE-MOVE ,RED-ROCK ,HERE>
		  <TELL
"\"So what exactly is it you're mining here?\" asked " ACT ", who
was trying to get a better look at the miner's sack." CR CR>
		  <TELL
"\"Lots of things,\" he said. \"The very stuff of the earth,
if you know what I mean.\" He reached into his sack and pulled out a
few large rocks. \"Now this here is mostly gold, but I reckon you've seen
that before. And this,\" he said, holding up a shiny black stone, \"is
obsidian - fetch a good price for that in Zan, I figure.\"" CR CR>
		  <TELL
"He rummaged through his sack, dropping some small red rocks on the ground,
and announced, \"That's about it, so far anyway. But I've found silver,
platinum, even a couple of diamonds once! You never know what you'll
find around here!\"">>)>

<OBJECT ASK-MINER-ORCS
	(LOC ASK-MINER-OBJECTS)
	(SDESC "orcs")
	(KBD %<ASCII !\O>)
	(TEXT
	 <EXECUTE ()
		  <TELL ACT
" was curious about how the miner had managed to elude the orcs.
\"Could be
I'm just a lucky fella,\" he started, chuckling. \"Oh, sure, there's
orcs around, and worse things too. But these orcs aren't very clever,
if you know what I mean. And I've got some ways of protecting myself
as well. What I'd like to know is how you've eluded them!\" And with
that, he laughed again.">>)>

<ROUTINE O-ASK-MINER ()
	 <FIND-OBJECTS ,ASK-MINER-OBJECTS>>

<OBJECT MINER
	(SDESC "miner")
	(KBD %<ASCII !\M>)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <TELL ACT
" wasn't the only one looking over this strange man, for we were ">
		 <COND (<EQUAL? ,PARTY-MAX 2> <TELL "both">)
		       (T
			<TELL "all">)>
		 <TELL " filled
with curiosity. He was a short man of middle age, and badly in need of a
shave and a bath. His dark complexion seemed more in keeping with a man
from the plains or the desert than an inhabitant of these caverns, yet he
acted completely at ease in his surroundings.">)>)>

<OBJECT MINER-SACK
	(SDESC "miner's sack")
	(KBD %<ASCII !\S>)
	(ACTION
	 <ACOND ()
		(PICK-UP
		 <TELL
"\"Whoa there, son!\" the miner said, as I reached for his sack. \"You
can just leave that right there, if you don't mind.\"">
		 <FSET ,ACTION-OBJECT ,DONT-TAKE>
		 <SETG UPDATE-FLAG T>)
		(EXAMINE:CLEAR
		 <TELL ACT
" tried to get a better look at the miner's sack, but the miner was
protecting it with his body. We could tell, however, that it was a
very sturdy sack, made of burlap, and it was about half full with
rocks of some kind.">)>)>

<OBJECT ACTIVE-MINE-WALLS
	(LOC ACTIVE-MINE)
	(FLAGS DONT-TAKE)
	(SDESC "walls")
	(KBD %<ASCII !\W>)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <COND (<NOT <FSET? ,HERE ,EXAMINED>>
			<SET-TEMP ,ACTOR>
			<TELL ACT
", looking over our surroundings, made a strange discovery." CR CR>
			<TELL
"\"Look over here,\" he said, indicating an area of recent excavation
in the walls. \"">
			<COND (<EQUAL? ,ACTOR ,ESHER ,PRAXIX>
			       <TELL
"Looks like somebody's been doing some digging....\"">)
			      (T
			       <TELL
"These are the marks of an pickaxe or I am no Dwarf,\" he said.">)>)
		       (T
			<COND (<EQUAL? ,ACTOR <GET-TEMP>>
			       <TELL "Once again">)
			      (<NOT <GET-TEMP>>
			       <TELL "Confused">)
			      (T
			       <TELL "This time">)>
			<TELL ", " ACT
" examined the chamber's walls, and found some ">
			<COND (<GET-TEMP> <TELL "more loose">)
			      (T <TELL "recently broken">)>
			<TELL " rock both within
the walls and on the ground nearby." CR CR>
			<TELL
"\"What's going on here?\" ">
			<TELL D <FIRST-IN-PARTY ,BERGON ,PRAXIX>>
			<TELL " demanded of the empty room, and it
replied with a soft giggling sound that echoed through the chamber." CR CR>
			<FSET ,ACTIVE-MINE-WALLS ,DONT-EXAMINE>
			<UPDATE-MOVE ,MINER-SACK ,HERE>
			<UPDATE-MOVE ,MINER ,HERE>
			<GRAPHIC <> ,G-MINER ,TOP-LEFT>
			<FSET ,HERE ,SOLVED>
			<COND (<IN-PARTY? ,BERGON>
			       <TRAVEL-COMMANDS ,BERGON
						,GET-ADVICE-COMMAND
						,ASK-MINER-COMMAND>)
			      (T
			       <CHANGE-TRAVEL-COMMAND ,PRAXIX
						      ,CAST-COMMAND
						      ,ASK-MINER-COMMAND>)>
			<TELL
"We each spun around, but it seemed we were as alone as before. Just then,
the giggling turned to laughter, and before our eyes a grizzled man
appeared, holding a pick axe and a large sack. Rubbing the tears from his
eyes, he looked us over, and howled with laughter." CR CR>
			<TELL
"\"You are the sorriest lot I've ever seen,\" he said, restraining
himself from another bout of laughter. \"Tell me, are you folks lost
or just plain stupid?\" He wiped his nose and eyes with his right sleeve,
sniffled, and then just stood there in amused bewilderment.">)>)>)>

<ROOM ACTIVE-MINE
      (TRAVEL-COMMANDS BACK-COMMAND NUL-COMMAND NUL-COMMAND)
      (GRAPHIC G-ACTIVE-MINE)
      (FLAGS UNDERGROUND DANGEROUS DONT-SCOUT)
      (TEMP 0)
      (ENTER
       <EXECUTE ()
		<COND (<NOT <F&SET? ,HERE ,SEEN>>
		       <TELL
"As quietly as we could, we squeezed our way through the cleft and
soon came upon a wide, circular chamber with no exit other than the
one through which we had entered." CR CR>
		       <TELL
"\"I would swear the tapping came from here,\" ">
		       <COND (<IN-PARTY? ,BERGON> <TELL "Bergon">)
			     (T <TELL "Praxix">)>
		       <TELL " said." CR CR>
		       <TELL
"\"And so would I, but there's nobody here,\" I added, mystified.">)
		      (<NOT <F&SET? ,HERE ,EXAMINED>>
		       <TELL
"Once again, we made our way through the cleft and into the circular
chamber. Once again, there was nobody there." CR CR>
		       <TELL
"\"Doesn't make a bit of sense,\" ">
		       <TELL D ,PRAXIX " said.">)>>)
      (ACTION
       <ACOND ()
	      (<AND <ACTION? USE-MIX>
		    <IN? ,MINER ,HERE>>
	       <TELL
"Praxix cast the mixture at the miner but the effect was mainly that of
infuriating him." CR CR>
	       <TELL
"\"Now listen here,\" he said, wagging an arthritic finger at Praxix,
\"I ain't got time for none of that magical business, so if you are
done nosing around here, I'd appreciate some peace and quiet.\"" CR CR>
	       <MIXTURE-CAST>
	       <COND (<IN-PARTY? ,BERGON>
		      <TRAVEL-COMMANDS ,BERGON ,GET-ADVICE-COMMAND>)
		     (T
		      <CHANGE-TRAVEL-COMMAND ,PRAXIX
					     ,ASK-MINER-COMMAND
					     ,CAST-COMMAND>)>
	       <LEAVE-ACTIVE-MINE>)
	      (<AND <ACTION? ASK-MINER>
		    <NOT <F&SET? ,HERE ,BUSY>>>
	       <TELL ACT
" started to ask the miner a question, but the miner interrupted.
\"Before I answer your questions, I've got one of my own,\" he said.
\"What are you doing in my mine?\"" CR CR>
	       <TELL ACT
" replied with a condensed version of the truth, as the miner
listened in scornful disbelief." CR CR>
	       <TELL
"\"Just plain stupid,\" was his conclusion; he spat on the ground and
continued, \"Go on, ask your questions and get out. I've got lots more
work to do!\"">)
	      (BACK
	       <COND (<NOT <FSET? ,HERE ,EXAMINED>>
		      <TELL
"Baffled, we snaked our way through the narrow passage, but no sooner
did we arrive back that the tapping started again." CR CR>
		      <TELL
"\"Spirits?\" I suggested, instinctively turning back toward the
darkened slit.">
		      <MOVE-TO ,MINER-PASSAGE>)
		     (T
		      <COND (<IN-PARTY? ,BERGON>
			     <TRAVEL-COMMANDS ,BERGON ,GET-ADVICE-COMMAND>)
			    (T
			     <CHANGE-TRAVEL-COMMAND ,PRAXIX
						    ,ASK-MINER-COMMAND
						    ,CAST-COMMAND>)>
		      <LEAVE-ACTIVE-MINE>)>)>)>

<ROUTINE LEAVE-ACTIVE-MINE ()
	 <COND (<IN? ,MINER ,HERE>
		<TELL
"We were filled with curiosity about this strange miner, and had many
questions to ask him, but it seemed we had overstayed our welcome in
his mine. And so we said our good-byes and">
		<COND (<FSET? ,OLD-MINE ,SOLVED>
		       <REMOVE-TRAVEL-COMMAND ,MINE-LOWER-STAIR
					      ,LEFT-COMMAND>
		       <TELL
			", leaving the mines, returned to the bottom of the stairs.">
		       <MOVE-TO ,MINE-LOWER-STAIR>)
		      (T
		       <TRAVEL-COMMANDS ,MINE-JUNCTION
					,OLD-MINE-COMMAND
					,BACK-COMMAND>
		       <MOVE-TO ,MINE-JUNCTION
				" returned to the mine junction.">)>
		<COND (<IN? ,RED-ROCK ,INVENTORY>
		       <TELL CR CR
"\"Excellent, " TAG ", to have taken those red rocks,\" Praxix said, \"I
believe they are far more valuable than they appear. Keep them safe! I
shall tell you more when we are more at leisure.\"">)>
		<RTRUE>)
	       (T
		<TELL
"We returned to the entrance of the mine, utterly confused about the
meaning of the tapping sounds." CR CR>
		<TELL
		 "\"Do you believe in spirits?\" I asked Praxix." CR CR>
		<TELL
"\"Spirits, yes, but not spirits that go about rock mining in caverns.
There is another explanation, I am sure of that!\" he replied.">
		<REMOVE-TRAVEL-COMMAND ,MINE-JUNCTION
				       ,NEW-MINE-COMMAND>
		<MOVE-TO ,MINE-JUNCTION>)>>