"LAVOS for
		      		JOURNEY
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<TEMP-COMMAND PART-TWO>
<TEMP-COMMAND PART-THREE>

<GLOBAL CHEAT <>> 

<ROOM CHEAT-ROOM
      (TRAVEL-COMMANDS PART-TWO-COMMAND PART-THREE-COMMAND NUL-COMMAND)
      (ACTION
       <ACOND ()
	      (PART-THREE
	       <CLEAR-SUBGROUP>
	       <MOVE-TO ,THREE-CONNECTOR>)
	      (PART-TWO
	       <SETG CHEAT T>
	       <CLEAR-SUBGROUP>
	       <MOVE-TO ,TWO-A-CONNECTOR>)>)>

<ROOM START-LOC
      (TRAVEL-COMMANDS START-COMMAND BACKGROUND-COMMAND CHANGE-NAME-COMMAND
			HELP-COMMAND)
      (GRAPHIC G-LAVOS)
      (ACTION
       <ACOND ()
	      (BACKGROUND:REMOVE
	       <TELL
"My story begins nearly five years ago, at the time of our first crop
failures. These things happen, of course, once in a while, but by the third
year, we knew something was badly amiss. And then, in the fourth year of
our despair, the water, too, failed us; not all at once, mind you, but by
the fifth year, there were only a few folks whose water was not foul-tasting
and disease-ridden. Many moved away, into the north country, but we soon
heard that neither had our neighbors been spared the spreading
pestilence." CR CR>
	       <TELL
"Hope was fading as the summer of that fateful year approached, and,
with no respite in sight, it was decided to seek aid beyond
our borders, from a powerful Wizard who was said to live atop the distant
Sunrise Mountain. And so a party of four departed, headed by the elder
blacksmith, Garlimon; and they were never seen again." CR CR>
	       <TELL
"But as winter reached its icy hand toward us, another group was formed
with the same slim hope of finding answers to our desperate situation.
Bergon, the carpenter, was chosen to lead the party; and Bergon
chose Praxix, the local Wizard, and Esher, a learned (but irritable)
physician, to join him. And the group chose me, " TAG ", apprentice
food merchant, to watch the supplies and to keep a diary of our journey,
which, by the fortunes of the good earth, I recount for you now.">)
	      (START
	       <SETG MAP-PATH <RANDOM 4>>
	       <CLEAR-SUBGROUP>
	       <TELL
"Our journey started on a day bright and clear, and we made quick
progress up the gently winding road that leads to the outpost town of
Lavos." CR CR>
	       <TELL
"The air was warm, but the cool north wind at our backs
reminded us that winter was near. It seemed that we had only just
started out when we arrived at the outpost town of Lavos, shortly past
noon." CR CR>
	       <TELL
"So this was Lavos! We stood in front of an old wooden storefront, that of
a provisioner. Farther down the road, the Lands End tavern
beckoned us with the promise of food and drink.">
	       <MOVE-TO ,LAVOS>)>)>

<ROOM LAVOS
      (TRAVEL-COMMANDS PROCEED-COMMAND ENTER-COMMAND NUL-COMMAND)
      (FLAGS DONT-SCOUT ADVISE)
      (GRAPHIC G-LAVOS)
      (ACTION
       <ACOND ()
	      (GET-ADVICE:REMOVE
	       <TELL
"\"I suppose,\" Bergon said with a smile, \"that we've come to our first
decision. How are we set for supplies?\"" CR CR>
	       <TELL
"\"I'm sure we're well enough supplied,\" I said
meekly. \"But I wouldn't mind looking around the shop, that is if
you wouldn't mind taking the time." CR CR>
	       <TELL
"\"Let's not disappoint " TAG ",\" Praxix said kindly, \"and who knows -
maybe we'll find something important there after all.\"">)
	      (PROCEED
	       <COND (<NOT <FSET? ,LANDS-END ,SEEN>>
		      <TELL
"We walked down the dusty road, stopping at the door of the tavern.
As we stood there, an unsavory looking man, walking from the far
end of town, passed us by and entered.">)
		     (<NOT <FSET? ,LANDS-END-TAVERN ,SEEN>>
		      <TELL
"Once again, we walked down that dusty road and stood at the door of
the tavern. Loud conversation could be heard within, and we were sorely
tempted to see what lay inside.">)
		     (T
		      <TELL
"We had seen town, such as it was, and it was now time to move
onward. ">
		      <MOVE-TO ,NEWHALL-PASS ,LEAVE-LAVOS>
		      <RTRUE>)>
	       <MOVE-TO ,LANDS-END>)
	      (ENTER
	       <FCLEAR ,HERE ,ADVISE>
	       <TELL 
"We entered the provisioner's shop, and introduced ourselves to the
proprietor, a portly man named Webba. \"Look around, look around!\"
he said, proudly, though (if the truth be told) there was not much
to be proud of. Still, this seemed to be our last chance to provision
ourselves before moving south to whatever lay beyond." CR CR>
	       <MOVE-TO ,WEBBAS
"The walls were filled with assorted foodstuffs, and an unusual map
was hanging behind the counter.">)>)>

<GLOBAL MAP-PATH 0>

<GLOBAL MAP-PATHS
	<LTABLE "lower-left" "lower-right" "upper-left" "upper-right">>

<ROOM WEBBAS
      (TEMP 0)
      (GRAPHIC G-WEBBA)
      (FLAGS PROVISIONER DONT-CAST)
      (TRAVEL-COMMANDS EXIT-COMMAND NUL-COMMAND NUL-COMMAND)
      (ENTER FSET-SEEN)
      (EXIT
       <EXECUTE ()
		<COND (<IN? ,WEBBA-MAP ,INVENTORY>
		       <FSET ,WEBBA-MAP ,DONT-EXAMINE>)>
		<CLEAR-TEMP>>)
      (ACTION
       <ACOND WEBBAS-F ()
	      (SELL
	       <FSET ,HERE ,DONT-DROP>
	       <COND (<OBJECT? WEBBA-MAP>
		      <TELL
"\"No, you just keep the map,\" Webba said, returning the money we had paid for
it. \"Looks like you'll need whatever help you can get!\"">)
		     (T
		      <TELL
"\"Oh, dear me, no!\" was Webba's reply when we tried to sell him
the " AO ". \"I'm not looking to buy anything today!\"">)>)
	      (REPLY
	       <FSET ,WEBBA-MAP ,SOLVED>
	       <TELL
ACT " started to tell of our quest, and Webba shook his head,
resigned to having lost a good customer. \"This map will
not help you. I sell this item to 'tourists' - those curious enough to
visit, but not enough to go on!\" He laughed heartily,
and told of the peculiar man who offered him the map in exchange for
a few trinkets. He thought it amusing, especially the strange rune in
the ">
	       <TELL <GET ,MAP-PATHS ,MAP-PATH>>
	       <TELL
" corner, and took the map. \"I added some runes of my own -
looks more official! No, I myself would look elsewhere for guidance.\"">
	       <END-OPTION>)
	      (IGNORE
	       <TELL
"Fearing to expose our quest, " ACT " shrugged off the question.
Webba didn't pursue the matter, looking ever more concerned.">
	       <END-OPTION>)
	      (LOOK-AROUND
	       <FSET ,HERE ,SCOUTED>
	       <TELL
"\"I think I'll just have a look around,\" " ACT " said, and he wandered
off to explore the shop.">
	       <SET-TEMP ,ACTOR>
	       <MAKE-BUSY ,ACTOR ,GONE-COMMAND>
	       <RTRUE>)
	      (EXIT
	       <TRAVEL-COMMANDS ,LAVOS ,PROCEED-COMMAND>
	       <MOVE-TO ,LAVOS
"Leaving Webba's, we returned to the road. Ahead of us was the
Lands End tavern; music and laughter could be heard within,
lightening our hearts.">)>)>

<OBJECT WEBBA-MAP
	(LOC WEBBAS)
	(SDESC "map")
	(KBD %<ASCII !\M>)
	(FLAGS DONT-DROP)
	(EXBITS PRAXIXBIT)
	(ACTION
	 <ACOND ()
		(EXAMINE
		 <COND (<EQUAL? ,HERE ,WEBBAS>
			<FSET ,WEBBA-MAP ,DONT-EXAMINE>
			<COND (<NOT <IN? ,WEBBA-MAP ,INVENTORY>>
			       <TELL
"Praxix expressed a keen interest in the map, and Webba obliged him by taking
the old parchment from the wall and, not letting it out of his grasp, holding
it up before the Wizard. ">)>
			<SINGLE-MOVE-GRAPHIC ,G-MAP>
			<TELL "The map was old and worn, and of
a land unknown to us. Suddenly looking grave, Webba asked, \"So you're
going on... to the Outlands?\"">
			<OPTION ,ACTOR ,REPLY-COMMAND ,IGNORE-COMMAND>)
		       (T
			<UPDATE-FSET ,ACTION-OBJECT ,DONT-EXAMINE>
			<TELL
"As we stood, unsure of which way to proceed, I was asked by " ACT " to
bring out the map we had bought at Webba's. Removing it from my pack,
I unfolded it and handed it to him." CR CR>
			<SINGLE-MOVE-GRAPHIC ,G-MAP>
			<COND (<NOT <EQUAL? ,HERE
					    ,ASTRIX-PATH-1
					    ,ASTRIX-PATH-2>>
			       <TELL
"His eyes darted from the map to our surroundings, and back again to the map.
Then, he slowly shook his head in the negative. \"There is
no river here; neither are we near a forest,\" he said. \"It would seem that
the map refers to someplace else.\" Discouraged, I took back the map and
returned it to my pack.">
			       <RTRUE>)>
			<TELL
"\"Yes!\" he said, knowingly. \"There is the river we crossed with the
forest behind it, and the mountains - here - lie ahead of us.\"" CR CR>
			<COND (<FSET? ,WEBBA-MAP ,SOLVED>
			       <FSET ,WEBBA-MAP ,BLUE-MIX>
			       <FSET ,ASTRIX-PATH-1 ,DONT-SCOUT>
			       <UPDATE-FSET ,ASTRIX-PATH-2 ,DONT-SCOUT>
			       <TELL
"\"What was it old Webba said about the runes?\" I asked, pointing at
the red marks which stood alongside all of the nearby paths." CR CR>
			       <TELL
"\"Peculiar man... strange rune in the... ">
			       <TELL <GET ,MAP-PATHS ,MAP-PATH>>
			       <TELL " corner!\" Praxix
said with glee. \"That's it. The path is ">
			       <COND (<AND <EQUAL? ,HERE ,ASTRIX-PATH-1>
					   <NOT <EQUAL? ,MAP-PATH 1 2>>>
				      <TELL "ahead of us and ">)
				     (<AND <EQUAL? ,HERE ,ASTRIX-PATH-2>
					   <NOT <EQUAL? ,MAP-PATH 3 4>>>
				      <TELL "behind us and ">)>
			       <TELL "to the ">
			       <COND (<EQUAL? ,MAP-PATH 1 3>
				      <TELL "left">)
				     (T
				      <TELL "right">)>
			       <TELL "!\"">)
			      (T
			       <TELL
"\"But which path is the right one?\" I asked, pointing at the red
marks which adorned each and every path." CR CR>
			       <TELL
"\"I'm afraid we cannot know,\" Praxix admitted. \"Perhaps they are
all good paths,\" he added, with little conviction.">)>)>)
		(BUY
		 <TELL
"Not knowing if it would ever be of use to us, we nevertheless decided
to buy the strange map." CR CR>
		 <COND (<GET-TEMP>
			<CLEAR-BUSY>
			<TELL
"Just then, Esher, having concluded his survey of the shop, wandered back into
our midst and stared blankly at the parchment. ">)> 
		 <CHANGE-CIT ,ESHER 1 ,NUL-COMMAND>
		 <TELL
"\"Rivers, forests, and mountains,\" ">
		 <COND (<GET-TEMP>
			<TELL "he">)
		       (T
			<TELL "Esher">)>
		 <TELL " said sourly, glancing at the map
as I stowed it away, \"Why, this place could be anywhere!\"" CR CR>
		 <TELL
"\"Yes,\" answered Praxix, \"and that is precisely where we are headed.\"">
		 <UPDATE-MOVE ,WEBBA-MAP ,INVENTORY>)>)>

<OBJECT WEBBA-FOOD
	(LOC WEBBAS)
	(SDESC "food")
	(KBD %<ASCII !\F>)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <TELL ACT
", who was by no means an expert on fine foods, browsed through the
food selection, though he could not find anything that he particularly
liked." CR CR>
		 <TELL
"\"Perhaps we should buy some of these things,\" he said, turning in
my general direction. I agreed to take a look around, though we were
not short of supplies.">)
		(BUY
		 <TELL
"I selected the most appetizing of the dry foodstuffs and
placed them in my pack; at least we wouldn't be worrying about
food for a few weeks, which was longer than we planned to be
gone.">
		 <UPDATE-MOVE ,WEBBA-FOOD>)>)>

<ROOM LANDS-END
      (TRAVEL-COMMANDS PROCEED-COMMAND ENTER-COMMAND BACK-COMMAND)
      (FLAGS DONT-SCOUT)
      (GRAPHIC G-LAVOS)
      (LOOK <EXECUTE () <RFALSE>>)
      (ENTER
       <EXECUTE ()
		<FSET ,HERE ,SEEN>
		<COND (<FSET? ,WEBBAS ,SEEN>
		       <REMOVE-TRAVEL-COMMAND ,HERE ,BACK-COMMAND>)>>) 
      (ACTION
       <ACOND ()
	      (ENTER:REMOVE
	       <MOVE-TO ,LANDS-END-TAVERN
"Perhaps for refreshment, perhaps for news from abroad, or perhaps
just to relax once more before moving on, we entered the Lands End tavern.
People of all kinds were there, mostly talking to (or shouting at) each
other in small groups. Our entrance caused something of a stir, with most
everyone stopping to take note.">)
	      (PROCEED
	       <MOVE-TO ,NEWHALL-PASS ,LEAVE-LAVOS>)
	      (BACK
	       <TELL
"\"So, this is all there is,\" Esher said, shaking his head scornfully.
\"Could be we were too hasty in judging the provisioner's shop.\"" CR CR>
	       <TELL
"\"It would not hurt to check it out,\" Bergon replied, and we were soon
on our way back through town.">
	       <REMOVE-TRAVEL-COMMAND ,HERE ,BACK-COMMAND>
	       <MOVE-TO ,LAVOS>)>)>

<CONSTANT LEAVE-LAVOS
"It was mid-afternoon when we left Lavos, heading south. The road,
which soon narrowed to a six-foot path, wound its way down into a deep
canyon, surrounded by sheer walls. After a short time, we found ourselves
at a fork in the road, the left path leading east along the foothills of the
mountains and the other continuing down the valley to the south.">

<OBJECT LANDS-END-PEOPLE
	(LOC LANDS-END-TAVERN)
	(FLAGS DONT-TAKE)
	(SDESC "customers")
	(KBD %<ASCII !\C>)
	(EXBITS PRAXIXBIT)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <COND (<GET-TEMP>
			<FSET ,ACTION-OBJECT ,EXAMINED>
			<TELL
"Praxix motioned with a nod of his head toward a particularly dark corner of
the tavern, where Esher was now conversing with someone whose face was
obscured in shadow." CR CR>
			<TELL
"\"Perhaps we shall learn something of value from our friend Esher,\" he
said.">)
		       (T
			<FSET ,HERE ,INCAPACITATED>
			<TELL
"I cannot explain why, but I felt strangely ill at ease here, as if a great
danger was lurking nearby. Praxix sensed this, but he himself was not in the
least alarmed.  \"We have not even left our lands and already you see danger
everywhere,\" he said. \"Have a">
			<COND (<FSET? ,LANDS-END-DRINKS ,SEEN>
			       <TELL "nother">)>
			<TELL " drink! Calm down!\"">)>)>)>

<OBJECT LANDS-END-DRINKS
	(LOC LANDS-END-TAVERN)
	(FLAGS DONT-EXAMINE)
	(SDESC "drinks")
	(KBD %<ASCII !\D>)
	(ACTION
	 <ACOND ()
		(BUY
		 <COND (<FSET? ,LANDS-END-DRINKS ,SEEN>
			<REMOVE ,HYE-DRINKS>
			<TELL
"I suggested that another drink might not hurt, but Bergon suggested
that I had had quite enough." CR CR>
			<TELL
"\"I wouldn't want you walking over any cliffs, or falling into
chasms,\" he said.">
			<COND (<FSET? ,HERE ,INCAPACITATED>
			       <TELL CR CR
"The Wizard looked over his shoulder toward me and shrugged, then
emptied his tankard of ale in a single gulp.">)>
			<UPDATE-MOVE ,LANDS-END-DRINKS>)
		       (T
			<FSET ,LANDS-END-DRINKS ,SEEN>
			<TELL
"Stepping up to the bar, we ordered ourselves a few tankards of ale. Though
bitter by our standards, it was nevertheless refreshing, and we passed
an hour there with idle talk about the journey that was to come.">)>)>)>

<ROOM LANDS-END-TAVERN
      (TRAVEL-COMMANDS EXIT-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS PROVISIONER DONT-CAST)
      (GRAPHIC G-TAVERN)
      (TEMP 0)
      (ENTER FSET-SEEN)
      (EXIT
       <EXECUTE () <CLEAR-TEMP>>)
      (ACTION
       <ACOND ()
	      (LOOK-AROUND
	       <TELL
"It took Esher just a few moments to become restless, and he soon slipped
away from us to mingle with the crowd." CR CR>
	       <TELL
"\"Who knows?\" he said, all but disappearing into the tavern's smoke-filled
air, \"I may even learn something useful.\"">
	       <COND (<NOT <FSET? ,LANDS-END-PEOPLE ,EXAMINED>>
		      <UPDATE-MOVE ,LANDS-END-PEOPLE ,HERE>)>
	       <SET-TEMP ,ACTOR>
	       <MAKE-BUSY ,ACTOR ,GONE-COMMAND>
	       <RTRUE>)
	      (EXIT
	       <COND (<AND <GET-TEMP> <NOT <F&SET? ,MINAR ,SEEN>>>
		      <TELL
"On our way out, Esher rejoined us, having had an intriguing
conversation with one of the locals. Before he could go on, the unsavory
man we had seen before stepped outside and pushed his way into our midst.
Bergon, flushed with anger, grabbed his sword, but Esher held him back.
\"This is the man I was telling you about,\" he said with no particular
enthusiasm." CR CR>
		      <GRAPHIC ,G-MINAR>
		      <CLEAR-BUSY>
		      <TELL ,MINAR-INTRO>
		      <OPTION ,LEADER
			      ,ACCEPT-COMMAND
			      ,DECLINE-COMMAND
			      ,GET-ADVICE-COMMAND>
		      <FSET ,HERE ,ADVISE>
		      <SETG UPDATE-FLAG T>
		      <RTRUE>)
		     (T
		      <TELL
"It was Bergon's opinion that we had tarried here long enough, so we left
the tavern, returning to the road">
		      <COND (<FSET? ,LANDS-END-DRINKS ,SEEN>
			     <TELL " refreshed, and, if I might say,
with a good, warm feeling in our bellies">)>
		      <TELL ".">
		      <MOVE-TO ,LANDS-END>)>)
	      (ACCEPT
	       <TELL D ,LEADER
" appeared troubled, but agreed to Minar's request. \"It is
against the wishes of our Elders, yet in truth we know not of our path or
of the world that lies beyond Lavos. We shall take the stranger!\"">
	       <PARTY-ADD ,MINAR>
	       <END-OPTION <>>
	       <MOVE-TO ,LANDS-END>)
	      (DECLINE
	       <TELL D ,LEADER
" thought for a moment, then spoke. \"Wiser men than ourselves have
set our number at four. Though our journey be long and its perils unknown to
us, we must not lightly bend the wishes of those who have set us upon our
way.\" And with that, he dismissed Minar, who slinked back into the tavern.">
	       <FSET ,MINAR ,SEEN>
	       <END-OPTION <>>
	       <MOVE-TO ,LANDS-END>)
	      (<AND <ACTION? GET-ADVICE>
		    <EQUAL? ,PARTY-MODE ,OPTION-MODE>>
	       <FCLEAR ,HERE ,ADVISE>
	       <TELL
"None spoke, yet all frowned, if only a little, at the prospect of bringing
this stranger into our group.">
	       <OPTION ,LEADER ,ACCEPT-COMMAND ,DECLINE-COMMAND>)>)>

<CONSTANT MINAR-INTRO
"\"I am Minar, and I have travelled often in the Outlands. You are in
great danger, whether you know it or not. If you will
have me, I offer you my services.\" Minar's eyes flickered with
a disturbing light, but saying nothing, we awaited the decision of
Bergon.">

<ROOM NEWHALL-PASS
      (TRAVEL-COMMANDS LEFT-COMMAND RIGHT-COMMAND NUL-COMMAND)
      (FLAGS ADVISE)
      (GRAPHIC G-FORK)
      (ENTER
       <EXECUTE ()
		<FCLEAR ,WEBBA-MAP ,DONT-EXAMINE>
		<ADD-TRAVEL-COMMAND ,PRAXIX ,TELL-LEGEND-COMMAND>>)
      (EXIT
       <EXECUTE () <FSET ,WEBBA-MAP ,DONT-EXAMINE>>)
      (ACTION
       <ACOND ()
	      (GET-ADVICE:REMOVE
	       <COND (<IN-PARTY? ,MINAR>
		      <TELL
"Minar spoke. \"If our goal is the Sunrise Mountain, we should have
better luck keeping to the left.\"">
		      <FSET ,HERE ,SCOUTED>
		      <UPDATE-FSET ,HERE ,DONT-SCOUT>)
		     (T
		      <TELL
"It felt like hours had passed while we stood at the fork, looking this way
and that, not knowing which would lead more quickly to our destination. Perhaps
it would not matter, yet we feared that time was critial and our decision here
crucial to our success.">)>)
	      (SCOUT:REMOVE
	       <COND (<EQUAL? ,ACTOR ,ESHER>
		      <TELL ACT
" grudgingly agreed to run on ahead and check out both paths; when he
arrived back, breathless, he seemed disinclined to speak." CR CR>
		      <TELL
"\"Well,\" Bergon prompted, expecting some sort of information to be
forthcoming." CR CR>
		      <TELL
"\"Well, how should I know,\" Esher replied, \"I've never been here
before, and they just look like paths to me. If it's advice you're
after, I say let's go left - there's less climbing that way.\"">)
		     (T
		      <UPDATE-FCLEAR ,HERE ,ADVISE>
		      <TELL
"Bergon asked Minar to scout out the paths before us, but Minar appeared
to decline." CR CR>
		      <SETG FORK-BANDITS <RANDOM 2>>
		      <TELL
"\"I have no need to scout these paths,\" he said firmly, \"for I have
travelled them many times. If we seek the Sunrise Mountain, our best
path is to the left.\"" CR CR>
		      <TELL
"\"However, these are dangerous times, and I do not trust the people
of Lavos.\" And with that, he quietly disappeared down the ">
		      <COND (<EQUAL? ,FORK-BANDITS 1>
			    <TELL "left">)
			   (T
			    <TELL "right">)>
		      <TELL "hand path. When he returned, he shook his
head knowingly." CR CR>
		      <TELL
"\"It is as I feared. Bandits lie in wait for us there; we must hope to
do better down the other path.\""> 
		      <FSET ,HERE ,SCOUTED>)>) 
	      (LEFT
	       <COND (<EQUAL? ,FORK-BANDITS 1>
		      <TELL
"Although Minar had cautioned us against taking this route, Bergon chose to
proceed">)
		     (T
		      <TELL
"We chose to remain north of the mountains, following the path which led">)>
	       <MOVE-TO ,CANYON-COUNTRY
"east through the foothills. The sun was already low in the sky, and after
an hour's march, we stopped for the night.">)
	      (RIGHT
	       <COND (<EQUAL? ,FORK-BANDITS 2>
		      <TELL
"Although Minar had cautioned us against taking this route, Bergon chose to
proceed southward, following a steeply winding path that led down
through a narrow canyon.">)
		     (T
		      <TELL
"Choosing the southern route, we descended through a steeply winding
canyon.">)>
	       <MOVE-TO ,SYLMAR
" It was now late in the day, and we soon decided to stop for the
night.">)>)>

<GLOBAL FORK-BANDITS <>>

<ROOM SYLMAR
      (TRAVEL-COMMANDS PROCEED-COMMAND BACK-COMMAND NUL-COMMAND)
      (GRAPHIC G-BEHIND-MOUNTAINS)
      (ENTER
       <EXECUTE ()
		<COND (<EQUAL? ,FORK-BANDITS 2 0>
		       <SETG OPPONENT ,BANDITS>
		       <SCENE ,BANDITS-FIGHT ,FIGHT-MODE>)>>)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <TELL
"The path curved toward the east along the foothills of the mountains,
and we were soon forced to choose between climbing higher or veering
off and into the southern valley. But there was no choice, really, since
our goal was to the east; it would be impossible to avoid the mountains, so
we started our ascent." CR CR>
	       <TELL
"The climb was long and arduous, and it was not until late in the second day
that we reached what appeared to be a plateau high in the mountains. But it
was dark, and little could be seen. And so we camped here under a starry sky;
in the morning we would see where we had come, and how far there was before
us.">
	       <NEXT-DAY 2>
	       <MOVE-TO ,MOUNTAIN-GATE>)
	      (SCOUT:REMOVE
	       <BANDITS-SCOUT>
	       <RTRUE>)
	      (BACK:REMOVE
	       <TELL
"Esher suggested returning to Lavos, but the idea was immediately quashed
by the group.">)>)>

<ROOM CANYON-COUNTRY
      (TRAVEL-COMMANDS PROCEED-COMMAND BACK-COMMAND NUL-COMMAND)
      (GRAPHIC G-CANYON)
      (ENTER
       <EXECUTE ()
		<COND (<EQUAL? ,FORK-BANDITS 1 0>
		       <SETG OPPONENT ,BANDITS>
		       <SCENE ,BANDITS-FIGHT ,FIGHT-MODE>)>>)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <MOVE-TO ,TUJUNGA-PATH
"Getting an early start, we continued along the canyon floor as
the eastern mountains were backlit by the rising sun. Our
morning's march ended at a point where a narrow path rose
along switchbacks to the crest of the mountain range that lay to our
south.">)
	      (SCOUT:REMOVE
	       <BANDITS-SCOUT>
	       <RTRUE>)
	      (BACK:REMOVE
	       <COND (<IN-PARTY? ,ESHER> <TELL D ,ESHER>)
		     (T <TELL "I">)> 
	       <TELL
" suggested returning to Lavos, but the idea was quickly quashed
by the others.">)>)>

<ROUTINE BANDITS-SCOUT ()
	 <TELL ACT
", fearful that other bandits might be near, made a quick survey of the
area, and concluded that the thugs had apparently not returned.">
	 <COND (<EQUAL? ,ACTOR ,ESHER>
		<TELL CR CR
"\"I wouldn't want to wager on it,\" he added, \"They could be waiting in
ambush farther down the trail.\"">)
	       (T
		<TELL CR CR
"\"They were only out to make trouble, but they found it instead. I don't
believe we'll be seeing them again.\"">)>>

<OBJECT CANYON-BODIES
	(FLAGS DONT-TAKE)
	(SDESC "bodies")
	(KBD %<ASCII !\B>)
	(EXBITS <+ ,PRAXIXBIT ,ESHERBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE
		 <CLEAR-EXBIT ,ACTION-OBJECT ,ACTOR>
		 <TELL ACT " examined the bodies">
		 <COND (<EQUAL? ,ACTOR ,ESHER>
			<TELL " carefully. \"They were killed with
swords or knives and their possessions are gone. I'd say they were
waylaid and robbed, probably by the same bandits we frightened off.\"">
			<TELL CR CR
"\"And perhaps not.\" added Praxix gravely, though he did not speak
what was in his mind.">
			<CLEAR-EXBIT ,ACTION-OBJECT ,PRAXIX>)
		       (T
			<TELL ", discovering nothing new.">)>)>)>

<OBJECT CANYON-CAIRN
	(FLAGS DONT-TAKE)
	(SDESC "cairn")
	(KBD %<ASCII !\C>)
	(EXBITS <+ ,PRAXIXBIT ,ESHERBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <COND (<EQUAL? ,ACTOR ,PRAXIX>
			<TELL
"At Bergon's request, Praxix looked over the cairn. \"The cairn was
made by our people, that is certain.\"">)>)>)>

<ROOM TUJUNGA-PATH
      (TRAVEL-COMMANDS PROCEED-COMMAND CLIMB-COMMAND NUL-COMMAND)
      (GRAPHIC G-CANYON)
      (ENTER
       <EXECUTE () <FCLEAR ,WEBBA-MAP ,DONT-EXAMINE>>)
      (EXIT
       <EXECUTE () <FSET ,WEBBA-MAP ,DONT-EXAMINE>>)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <NEXT-DAY>
	       <MOVE-TO ,CANYON-GATE
"The winding canyon floor climbed ever higher toward the eastern mountains,
and by late afternoon, we had reached a convenient resting place, where we
decided to camp for the night.">)
	      (SCOUT:REMOVE
	       <COND (<EQUAL? ,ACTOR ,MINAR>
		      <UPDATE-MOVE ,CANYON-CAIRN ,HERE>
		      <MOVE ,CANYON-BODIES ,HERE>
		      <TELL ACT
" was sent out to explore the area around us. What he found brought little
cheer." CR CR>
		      <TELL
"\"A rock cairn,\" he said, leading us to a shaded spot beneath a grove
of stately oaks, \"I am certain this was not here last summer, when I
camped in this same spot.\"" CR CR>
		      <TELL
"Minar's words were ominous - whatever was buried here had not lain
long in the earth. Bergon, over the objections of Praxix, decided to dig up
whatever remains lay here. It was not long before he found what he was
after - three sets of human remains, bodies mangled yet still clothed." CR CR>
		      ;<GRAPHIC ,G-CAIRN>
		      <TELL
"\"Garlimon's party!\" cried Bergon. \"But there are only three, not
four....\"" CR CR>
		      <TELL
"\"And that is but part of the mystery,\" replied Praxix, \"Who, I wonder,
took the time to bury them? Surely not the monsters that tortured and
killed them.\"">)
		     (T
		      <TELL
"Esher took a few moments to scout out the immediate area, but nothing
of interest caught his eye, excepting the few rabbits he suggested
might make a nice dinner.">)>)
	      (CLIMB
	       <TELL
"Opting for the high road, we started to climb into the southern
mountains. The path was narrow, and frequently choked with low
brush, making progress slow. By midday however, we had climbed
more than half of the distance to the ridge which hung above us. It took
the rest of the afternoon, but we finally arrived at the
ridge. We were all tired after our day of climbing, and so we camped there
for the night." CR CR>
	       <NEXT-DAY>
	       <MOVE-TO ,HIGH-PLAIN
"When we awoke, we headed east along the ridge, coming finally to
a high plain, thousands of feet above the valley below. Gentle,
rolling hills, covered in pines and firs surrounded us; but most
impressive, a large, glistening lake spread out a few thousand
paces ahead.">)>)>

<ROOM CANYON-GATE
      (TRAVEL-COMMANDS PROCEED-COMMAND NUL-COMMAND NUL-COMMAND)
      (GRAPHIC G-CANYON)
      (ENTER
       <EXECUTE ()
		<COND (<AND <NOT <IN-PARTY? ,MINAR>>
			    <NOT <IN-PARTY? ,ESHER>>>
		       ;"No kidnapping now..."
		       <ADD-PARTY-COMMAND ,COMB-AREA-COMMAND>)>>)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <MOVE-TO ,ANGELES-PATH
"After a refreshingly cool and comfortable night, we pressed on along
the path, coming finally to another path winding up into the southern
mountains.">)
	      (COMB-AREA:REMOVE
	       <TELL
"We split up into two groups in search of the Dwarves' gate; Praxix and I
went toward the hills, and ">
	       <COND (<EQUAL? ,PARTY-MAX 3>
		      <TELL "Bergon">)
		     (T
		      <TELL "the others">)>
	       <TELL " followed the canyon floor. Before
long, I found that I had wandered out of sight of Praxix.">
	       <OPTION ,TAG
		       ,LOOK-AROUND-COMMAND ,GET-HELP-COMMAND>)
	      (SCOUT:REMOVE
	       <SETG KIDNAPPED ,ACTOR>
	       <PARTY-REMOVE ,ACTOR>
	       <COND (<AND <NOT <IN-PARTY? ,ESHER>>
			   <NOT <IN-PARTY? ,MINAR>>>
		      <REMOVE-TRAVEL-COMMAND ,HERE ,PROCEED-COMMAND>)>
	       <TELL D ,LEADER " sent " ACT " off to scout around the
area, which he did. After an hour, though, he had not returned and "
D ,LEADER " was alarmed enough to set us out
searching for him. We split up into two groups; Praxix and I went
toward the hills, and ">
	       <COND (<EQUAL? ,PARTY-MAX 3>
		      <TELL "Bergon">)
		     (T
		      <TELL "the others">)>
	       <TELL " followed the canyon floor. Before
long, I found that I had wandered out of sight of Praxix.">
	       <MAKE-SUBGROUP ,TAG>
	       <OPTION ,TAG
		       ,LOOK-AROUND-COMMAND ,GET-HELP-COMMAND>)
	      (LOOK-AROUND
	       <COND (<F&SET? ,HERE ,SEEN>
		      <OPTION ,TAG ,GET-HELP-COMMAND ,RETURN-COMMAND>
		      <TELL
"Having found these peculiar runes, I explored further in hopes of
discovering more artifacts. But my search was fruitless, and I had soon
wandered back to where I had started my explorations.">)
		     (T
		      <GRAPHIC ,G-GATE-RUNES>
		      <TELL
"Ambling aimlessly along the base of a rock cliff, it seemed that
something scurried by in the brush. When I looked, nothing was there, but
my eye caught some strange lettering chiselled in the stone.">
		      <OPTION ,TAG ,LOOK-AROUND-COMMAND ,GET-HELP-COMMAND
			      ,RETURN-COMMAND>)>)
	      (GET-HELP
	       <TELL
"Wanting to share my discovery with the others, I called out, and Praxix,
following the sound of my voice, appeared
within moments. \"Well, what now?\" he began, but as if by instinct,
his eyes slowly wandered to ">
	       <COND (<FSET? ,HERE ,SEEN>
		      <TELL "the runes that I had seen before.">)
		     (T
		      <GRAPHIC ,G-GATE-RUNES>
		      <TELL "some runes that I hadn't noticed before,
chiselled in the stone.">)>
	       <TELL CR CR
"Praxix then called for ">
	       <COND (<EQUAL? ,PARTY-MAX 3> <TELL "Bergon">)
		     (T <TELL "the others">)>
	       <TELL ", who hurried to our sides." CR CR>
	       <CANYON-GATE-OPENS>)
	      (ENTER
	       <TELL
"Slowly and carefully, we went through that gate and into the darkness
that lay within. As if on some malicious cue, the gate crashed shut
behind us." CR CR>
	       <COND (<FSET? ,PRAXIX ,LIT>
		      <TELL
"We were fortunate indeed that Praxix had magically caused his staff to
glow, for the cavern itself was black as pitch.">)
		     (T
		      <COND (<IN-PARTY? ,ESHER>
			     <TELL
"\"I don't suppose we have a torch anywhere,\" said Esher, knowing fully
well that we didn't. ">)>
		      <TELL "It was dark as pitch, the
outline of the gate as invisible now as it had been earlier.">)>
	       <MOVE-TO ,BERN-I-LAV>)
	      (RETURN
	       <TELL
"Finding nothing, and filled with apprehension, I returned to our camp.
Before long the others had also returned; there was no trace of ">
	       <COND (,KIDNAPPED <TELL D ,KIDNAPPED "!">)
		     (T <TELL "a gate.">)>
	       <TELL CR CR
"Later, questioned by Praxix, I told of my explorations. He seemed to be
dozing off until I came to the point about finding the runes, when he
startled me by jumping to his feet. \"Take me!\" he commanded, and I
did." CR CR>
	       <TELL
"The old Wizard studied the runes, then called for the others.">
	       <CANYON-GATE-OPENS>)>)>

<ROUTINE CANYON-GATE-OPENS ()
	 <GRAPHIC <> ,G-GATE-OPENS ,BOTTOM-RIGHT>
	 <UPDATE-MOVE ,TALE-DWARF-GATES ,PRAXIX-TALES>
	 <TELL
"\"The runes on this rock face are quite old, and ancient
languages are not my specialty. However, these words are quite simple
to translate: This first device, 'Bern,' refers to a 'gate'; this second
one, 'i-Lav,' means 'from the plains'.\"" CR CR>
	 <TELL
"\"From the plains,\" I repeated, \"The question is, 'To where?'\"" CR CR>
	 <TELL
"\"That is a simple question - the more interesting one is 'How does it
open?'\"">
	 <COND (<IN-PARTY? ,ESHER>
		<TELL CR CR
"\"Or 'What do we do now?'\" snarled Esher as, to everyone's surprise,
a round gate appeared, then yawned wide before us.">)
	       (T
		<TELL CR CR
"This was not to be a problem, for a round gate then appeared from
nowhere and opened.">)>
	 <TELL CR CR
"Of the group, only Praxix seemed genuinely pleased by our discovery,
though he was mystified as to just how it had happened.
\"Perhaps it was something I said,\" he offered, shrugging.">
	 <END-OPTION>
	 <CLEAR-SUBGROUP>
	 <ADD-PARTY-COMMAND ,ENTER-COMMAND>
	 <RTRUE>>

<ROUTINE CAVERN-GRAPHIC ()
	 <COND (<FSET? ,PRAXIX ,LIT>
		<GRAPHIC ,G-DARK-CAVERN>)
	       (T
		<IF-BLACK-PICTURE-BORDER <CLEAR 3>>
		<IFN-BLACK-PICTURE-BORDER <GRAPHIC ,G-BLACK>>)>>

<ROOM BERN-I-LAV
      (TRAVEL-COMMANDS EXIT-COMMAND PROCEED-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND DONT-SCOUT)
      (ENTER CAVERN-GRAPHIC)
      (ACTION
       <ACOND ()
	      (EXIT:REMOVE
	       <TELL
"We groped for the gate itself, or for some device that would open it, but
to no avail.">)
	      (PROCEED
	       <COND (<NOT <FSET? ,PRAXIX ,LIT>>
		      <TELL
"I meekly suggested trying to feel our way through what ever
passage we were in, and Bergon reluctantly agreed. \"We seem to have
few other choices,\" he said." CR CR>)>
	       <MOVE-TO ,DWARF-MEETING-LOC
"Unsure of where this passage would lead, we slowly made our way through
the darkness.">)
	      (CAST
	       <COND (<OBJECT? LIGHT-SPELL>
		      <CAVERN-GRAPHIC>
		      <CAST-LIGHT>)>)>)>

;<ROOM TUJUNGA-MID
      (TRAVEL-COMMANDS CLIMB-COMMAND DESCEND-COMMAND NUL-COMMAND)
      (GRAPHIC G-MOUNTAIN-PATH)
      (ACTION
       <ACOND ()
	      (CLIMB
	       )
	      (DESCEND
	       <NEXT-DAY>
	       <REMOVE-TRAVEL-COMMAND ,TUJUNGA-PATH ,CLIMB-COMMAND>
	       <MOVE-TO ,TUJUNGA-PATH
"Bergon, feeling that we had chosen poorly in climbing this trail,
decided that we return to the canyon below; and so we descended
to the canyon floor late in the afternoon, and decided to
spend the night there before going on.">)>)>

<OBJECT FOREST-RIDGE-RIVER
	(LOC FOREST-RIDGE)
	(SDESC "river")
	(KBD %<ASCII !\R>)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"The river, across the forest, wound its way along the base of the
eastern mountains, running generally from north to south. Smooth and
gentle in places, it became a torrent of raging white waters in
others." CR CR>
		 <TELL
"\"There will be no avoiding this river if we are to reach Astrix,\" "
ACT " said.">)>)>

<ROOM FOREST-RIDGE
      (TRAVEL-COMMANDS PROCEED-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS DONT-SCOUT)
      (GRAPHIC G-FOREST-RIDGE)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <NEXT-DAY>
	       <MOVE-TO ,BITE-FOREST
"The morning was still and hazy, and we started toward the forest with
great eagerness. Praxix spotted a wide path which headed due east
toward the Sunrise Mountain, and we spent a glorious morning
beneath tall trees and a blue sky. Around midday, we came to a small
clearing, where we decided to stop for lunch.">)>)>

<ROUTINE MOVE-TO-FOREST-RIDGE ()
	 <TELL
"Looking back, we could follow the long canyon path back to the horizon,
where I imagined I could see the fork just beyond Lavos. But the view ahead
filled us with astonishment, for a vast forest stretched out before us.
Strange and dark it was, thick with tall pines, firs, and redwoods. Beyond
the forest, a wide river flowed from the north, disappearing into deep
canyons to the south. And beyond the forest, the Sunrise Mountain,
its jagged peak towering high above the surrounding mountains." CR CR>
	 <TELL
"\"Magnificent!\" Praxix said. \"We stand before the Old Forest of
legend!\"" CR CR>
	 <TELL
"\"Why, we would sing of the Old Forest in school,\" I said. \"But I never
thought the tales were true!\"" CR CR>
	 <TELL
"\"Many tales of the elder days have become wives' tales - yet they are true
just the same. And not all of the old tales are as pleasant as
that of the Forest,\" Praxix replied, sending a shiver down my spine." CR CR> 
	 ;<MOVE ,TALE-FOREST ,PRAXIX-TALES>
	 <UPDATE-MOVE ,TALE-ELVES ,PRAXIX-TALES>
	 <NEXT-DAY>
	 <MOVE-TO ,FOREST-RIDGE
"It was now dark and after a hearty meal we slept. I dreamed of the
forest that night, of brightly colored birds, and of the beautiful Wood
Elves from the stories of my childhood. The next day, we rose with
the sun.">>

<ROOM ANGELES-PATH
      (TRAVEL-COMMANDS PROCEED-COMMAND CLIMB-COMMAND NUL-COMMAND)
      (GRAPHIC G-CANYON)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <TELL
"The sun peeked behind some high clouds as we wound our way along the
floor of the canyon. Ahead, the path climbed up a tall ridge, and
we arrived there as dusk approached and stood in awe of the world
that surrounded us." CR CR>
	       <MOVE-TO-FOREST-RIDGE>)
	      (SCOUT:REMOVE
	       <COND (<EQUAL? ,ACTOR ,MINAR>
		      <TELL ACT
" went ahead, paying close attention to the trail that climbed into the
mountains. \"It is a good trail,\" he said. \"As I recall, we can follow it
to a high ridge no more than a day's climb from here.\"">)
		     (T
		      <TELL ACT
" went ahead, reporting back that the trail appeared to be passable
as far as he could see, though it might well be more than a day's climb
to the top of the ridge.\"">)>)
	      (CLIMB
	       <TELL
"The trail was steep, winding its way up the side of the hills.
At times, the trail disappeared completely, and it was necessary
to scout ahead to find the proper path. But we pressed ahead,
ever climbing until we reached a spot about halfway to what
appeared to be the top of the trail, still some thousands of paces
above us." CR CR>
	       <NEXT-DAY>
	       <MOVE-TO ,HIGH-PLAIN
"It took the rest of the afternoon to reach the top of our trail,
where we decided to set up camp for the night. We were now at
a high plain, thousands of feet above the valley below. Gentle,
rolling hills, covered in pines and firs surrounded us; but most
impressive, a large, glistening lake spread out before us in a bowl
in the mountains. Tired from the climb, we soon feel asleep beneath
a moonlit sky.">)>)>

;<ROOM ANGELES-MID
      (TRAVEL-COMMANDS CLIMB-COMMAND DESCEND-COMMAND NUL-COMMAND)
      (GRAPHIC G-MOUNTAIN-PATH)
      (ACTION
       <ACOND ()
	      (CLIMB
	       )
	      (DESCEND
	       <NEXT-DAY>
	       <REMOVE-TRAVEL-COMMAND ,ANGELES-PATH ,CLIMB-COMMAND>
	       <MOVE-TO ,ANGELES-PATH
"Fearing that the path would not lead us closer to our goal, we
chose instead to retrace our steps and return to the canyon floor,
where we spent the night under a moonlit sky.">)>)>

