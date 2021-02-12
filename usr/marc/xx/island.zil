"ISLAND for
		      		JOURNEY
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<GLOBAL GAME-WON? <>>

<ROUTINE ISLAND-ENDING ()
	 <TELL
"We stepped off the boat, and onto the shore. The sky was a brilliant
blue, and not a cloud could be seen. Before us, high upon a hill,
stood a grand castle, whose high turrets rose hundreds of feet
into the air. Our steps were quick and light as we climbed to the
castle door." CR CR>
	 <COND (<EQUAL? ,PARTY-MAX 5>
		<TELL
"Even as we arrived at the threshold, the door opened, and we were greeted
by a hooded man in a blue and silver robe. Casting the hood from his face,
we stood in awe at what we had seen." CR CR>
		<TELL ,IT-IS-I-ASTRIX CR CR>
		<TELL
"And then Astrix led us into a large and elegant chamber, in the center
of which stood a table. Around the table sat six men; each, like Astrix, in
robes of blue and silver. But there was something unearthly about them,
and their very forms seemed to shimmer." CR CR>
		<GRAPHIC ,G-WIZARDS>
		<TELL
"\"These are the last of my race,\" Astrix said, \"You see, the Wizards
led a great and successful struggle against the " ,BAD-GUY "s many ages ago.
And then, their work done, they left the world you know,
creating an island apart from it. Venturing forth little into the world,
they have been sundered from it, and are now unable to return. I, of all
the Wizards, remained in the world, befriending the races that now walk in
freedom upon it.\"" CR CR>
		<TELL
"\"Yet not all of the " ,BAD-GUY "s were destroyed, and one remained deep
within the earth, patiently awaiting the day he might again rule. That day has
come, and though the Wizards care greatly for the world, and would give their
lives to save it, yet they cannot.\"" CR CR>
		<TELL
"\"Our hope lay in finding those who might, through their strength of
intellect, courage, and character, take the ancient Stones and harness
their powers for the final destruction of Evil. And there have
been others before you; one group that you know, four more before them.
All have failed, and, yet, in our despair, you have come!\"" CR CR>
		<TELL
"\"Behold,\" said Astrix, holding up a large stone of perfect clarity.
The six rose in silence as Astrix presented the Anvil to me." CR CR>
		<TELL
"\"I believe this is yours!\" he said, proudly. \"Now, come. There is
much to do!\"">
		<DIVIDER>
		<TELL
"We stayed a long while at the castle, for the wisdom of the Wizards was
great, and there was much to learn before we could challenge the " ,BAD-GUY
". But that, then, is another story, and as I write these words, I can only
pray that I may live to see it written." CR CR>
		<SETG GAME-WON? T>
		<ENDING>)
	       (T
		<TELL
"The massive door opened as if by magic. Before us, the entrance
hall led down a long, oak-panelled corridor to a large and elegant
chamber. Inside, a solitary man sat, head down, at huge banquet
table." CR CR>
		<TELL
"He turned to us slowly, and cast his hood from his face. We stood
awestruck by the sight." CR CR>
		<TELL ,IT-IS-I-ASTRIX CR CR>
		<TELL
"\"We had hoped you were the ones,\" he said with a sigh." CR CR>
		<GRAPHIC ,G-ALMOST>
		<TELL
"\"We?\" I said, again gazing around the empty chamber." CR CR>
		<TELL
"\"It does not matter anymore,\" he said, ignoring the question.
\"You have found the Stones, and are by any
accounting brave, resourceful, and wise. But the ">
		<TELL <GET ,INT-STR ,PARTY-MAX>>
		<TELL " of you that remain are not strong
enough to battle the " ,BAD-GUY ". I am sorry indeed - not only for yourselves,
but for your fallen friends, for all that must abide the Darkness that is
to come, and, sadder still, for those of us who, unable to act, are
constrained to watch what is to follow." CR CR>
		<TELL
"\"Go, now, return to your families and friends. For the storm will
come swiftly, and all will be changed.\"" CR CR>
		<TELL
"And though we had a thousand questions, we could sense that Astrix was
too distracted to answer. He led us from the castle, and ">
		<TELL <GET ,INT-STR ,PARTY-MAX>>
		<TELL
" eagles came at his command, and they bore us back to our
lands, far to the north.">
		<BAD-ENDING>)>>
	 
<ROUTINE BAD-ENDING ()
	 <DIVIDER>
	 <TELL ,I-SIT-ALONE CR CR>
	 <ENDING>> 

<CONSTANT IT-IS-I-ASTRIX
"\"Yes,\" the familiar voice said warmly, \"It is I, Astrix.\"">


 