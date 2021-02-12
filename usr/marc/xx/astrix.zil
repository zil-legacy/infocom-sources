"ASTRIX for
		      		JOURNEY
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<GLOBAL ASTRIX-TRAP <>>

<ROOM ASTRIX-PATH-1
      (TRAVEL-COMMANDS PROCEED-COMMAND LEFT-COMMAND RIGHT-COMMAND)
      (ENTER
       <EXECUTE ()
		<FCLEAR ,WEBBA-MAP ,DONT-EXAMINE>>)
      (ACTION
       <ACOND ("AUX" FIP)
	      (SCOUT:REMOVE
	       <ASTRIX-SCOUT>)
	      (PROCEED
	       <COND (<EQUAL? ,MAP-PATH 1 2>
		      <REMOVE-TRAVEL-COMMAND ,HERE ,PROCEED-COMMAND>)>
	       <MOVE-TO ,ASTRIX-PATH-2
"It was now mid-day, and our path had become steep and narrow, though
we were headed directly at the Sunrise Mountain and the high tower of
Astrix. We approached a fork in the path, and stopped to take a brief
meal.">)  
	      (LEFT:REMOVE
	       <COND (<EQUAL? ,MAP-PATH 1>
		      <CHOSE-RIGHT-PATH>
		      <RTRUE>)>
	       <SET FIP <SPARE-VICTIM>>
	       <TELL
"We took the leftmost path, but soon came upon a swampy area.">
	       <COND (<AND .FIP <NOT ,ASTRIX-TRAP>>
		      <SETG ASTRIX-TRAP T>
		      <PARTY-REMOVE .FIP>
		      <HINT ,HINT-QUICKSAND>
		      <TELL
" Praxix shouted, \"Wait! Quicksand!\", but " D .FIP " had gone too
far and was rapidly sinking into the undulating earth. I took out
our rope, and tossed it to him, but it would not reach. Praxix,
taking out some magic essences, attempted spell after spell, but
it was no good." CR CR>
		      <TELL
"Head sinking below the surface, " D .FIP " gave out a frenzied cry,
and then was gone!" CR CR>
		      <UPDATE-FSET ,HERE ,DONT-SCOUT>
		      <HAPPENED-QUICKLY .FIP>)
		     (T
		      <TELL
" I was about to continue when Praxix grabbed me. \"Wait! Quicksand!\"
he said, \"This must not be the path!\" And so we returned to
make another choice.">)>) 
	      (RIGHT:REMOVE
	       <COND (<EQUAL? ,MAP-PATH 2>
		      <CHOSE-RIGHT-PATH>
		      <RTRUE>)>
	       <SET FIP <SPARE-VICTIM>>
	       <TELL
"Taking the right-hand path, we climbed steeply for a short while,
but the path ended abruptly. ">
	       <COND (<AND .FIP <NOT ,ASTRIX-TRAP>>
		      <SETG ASTRIX-TRAP T>
		      <PARTY-REMOVE .FIP>
		      <HINT ,HINT-MTN-LION>
		      <TELL D .FIP " started clambering up the
rock, and was struck from behind by a hidden mountain lion,
killing him instantly. The lion stood there before us, protecting
his kill. Praxix, quickly taking some fire essence from his pouch,
cast it upon the lion, engulfing him in flame." CR CR>
		      <TELL
"We buried poor " D .FIP " there, with Praxix performing the burial
ritual. And then, we returned to our former path in silence.">)
		     (T
		      <TELL "\"We shall be spending the next week
climbing rock,\" Praxix said, \"I suggest trying another path.\"
I agreed, and we were soon back to our former path.">)>)
	      (SCOUT:REMOVE
	       <ASTRIX-SCOUT>)>)>

<ROUTINE ASTRIX-SCOUT ()
	 <COND (<EQUAL? ,ACTOR ,ESHER>
		<TELL ACT
" was sent to scout out the various paths, and returned a short while
later. \"They all seem to lead up the mountain,\" he said. \"Perhaps
it does not matter which one we take.\"">)
	       (T
		<TELL ACT
" went ahead to scout the various paths, and returned a short while
later. \"I have not been this far east in my travels,\" he said, \"I
sense great danger here; I wish we did not have to guess which path
to take up the mountain.\"">)>
	 <TELL CR CR
"\"I fear that such a powerful Wizard as Astrix would try to defend
himself against unwanted visitors,\" Praxix ">
	 <COND (<EQUAL? ,ACTOR ,ESHER>
		<TELL "countered">)
	       (T
		<TELL "said, echoing Minar's concerns">)>
	 <TELL ". \"We must choose carefully.\"">>

<ROUTINE SPARE-VICTIM ()
	 <COND (<AND <IN-PARTY? ,MINAR>
		     <FSET? ,DWARF-MEETING ,SEEN>>
		,MINAR)
	       (<IN-PARTY? ,ESHER> ,ESHER)
	       (<AND <IN-PARTY? ,BERGON>
		     <FSET? ,DWARF-MEETING ,SEEN>
		     <FSET? ,HIGH-PLAIN ,SEEN>> ,BERGON)>>

<ROOM ASTRIX-PATH-2
      (TRAVEL-COMMANDS LEFT-COMMAND RIGHT-COMMAND BACK-COMMAND)
      (ACTION
       <ACOND ("AUX" FIP)
	      (BACK
	       <COND (<EQUAL? ,MAP-PATH 3 4>
		      <REMOVE-TRAVEL-COMMAND ,HERE ,BACK-COMMAND>)>
	       <TELL
"\"Perhaps we have been hasty,\" Praxix said, \"in coming this far
along the path.\"" CR CR>
	       <TELL
"\"I don't think it would hurt to retrace our steps,\" I
volunteered, pleased to have been offered the Wizard's advice." CR CR>
	       <TELL
"There was no objection, and we were soon back at the previous crossing
of the paths.">
	       <MOVE-TO ,ASTRIX-PATH-1>)
	      (LEFT:REMOVE
	       <COND (<EQUAL? ,MAP-PATH 3>
		      <CHOSE-RIGHT-PATH>
		      <RTRUE>)>
	       <TELL
"The left-hand path wound its way steeply up the side of the mountain.">
	       <SET FIP <SPARE-VICTIM>>
	       <COND (<AND .FIP <NOT ,ASTRIX-TRAP>>
		      <SETG ASTRIX-TRAP T>
		      <PARTY-REMOVE .FIP>
		      <HINT ,HINT-AVALANCHE>
		      <TELL
" Praxix shouted, \"Down! Rocks!\" but " D .FIP " did not move
quickly enough. A large rock, hitting him on the head, knocked him
off the path, and down into a deep gully." CR CR>
		      <UPDATE-FSET ,HERE ,DONT-SCOUT>
		      <HAPPENED-QUICKLY .FIP>)
		     (T
		      <TELL
" I was about to continue when Praxix grabbed me, pulling me out of the
path of some large falling rocks. \"Let us try another path,\" he said,
and this seemed the prudent thing to do. And so we returned to
make another choice.">)>)
	      (RIGHT:REMOVE
	       <COND (<EQUAL? ,MAP-PATH 4>
		      <CHOSE-RIGHT-PATH>
		      <RTRUE>)>
	       <TELL
"The right-hand path wound its way steeply up the side of the mountain.">
	       <SET FIP <SPARE-VICTIM>>
	       <COND (<AND .FIP <NOT ,ASTRIX-TRAP>>
		      <SETG ASTRIX-TRAP T>
		      <PARTY-REMOVE .FIP>
		      <HINT ,HINT-AVALANCHE>
		      <TELL
" Praxix shouted, \"Down! Rocks!\" but " D .FIP " did not move
quickly enough. A large rock, hitting him on the head, knocked him
off the path, and down into a deep gully." CR CR>
		      <UPDATE-FSET ,HERE ,DONT-SCOUT>
		      <HAPPENED-QUICKLY .FIP>)
		     (T
		      <TELL
" I was about to continue when Praxix grabbed me, pulling me out of the
path of some large falling rocks. \"Let us try another path,\" he said,
and this seemed the prudent thing to do. And so we returned to
make another choice.">)>)
	      (SCOUT:REMOVE
	       <TELL
"Quickly checking out the two paths, " ACT " could find no indication of which
would be the best path to Astrix.">)>)>

<ROUTINE HAPPENED-QUICKLY (FIP)
	 <TELL
"It had happened so quickly, we stood in stunned silence, staring at
the place where " D .FIP " had met his end. \"We have come so far;
this is a tragic blow!\" Praxix said, then performed a brief burial
ritual. We returned to our erstwhile path, but no words were spoken.">>

<ROUTINE CHOSE-RIGHT-PATH ()
	 <FSET ,WEBBA-MAP ,DONT-EXAMINE>
	 <MOVE-TO ,ASTRIX-TOWER-1>>

<ROOM ASTRIX-TOWER-1
      (TRAVEL-COMMANDS NUL-COMMAND NUL-COMMAND NUL-COMMAND)
      ;(GRAPHIC G-ASTRIX)
      (ENTER
       <EXECUTE ("AUX" (CNT <STONE-COUNT>) STN)
		<SETG 2ND-PASS T>
		<COND (<IN? ,HERMIT-POWDER ,INVENTORY>
		       <FSET ,HERMIT-POWDER ,INCAPACITATED>)>
		<TELL
"For six long hours, we climbed steeply up the side of the
Sunrise Mountain, and thus we came to the high tower of Astrix, the
Wizard. No sooner had we arrived, than the tower's massive oak door
opened." CR CR>
		<TELL
"\"I have been following your progress with great interest,\"
the Wizard said, stroking his stringy gray beard. \"You are
a very resourceful group, that is certain!\"" CR CR>
		<TELL
"His voice became dark and he seemed to wince from some unseen injury.
\"The question is: Have you mettle enough to make siege on the " ,BAD-GUY
" himself?\" And then, smiling, the darkness fell from his voice, and
he answered his own question, \"We shall see, I suppose; we shall
see.\"" CR CR>
		<GRAPHIC ,G-ASTRIX>
		; "Per TAA 6/30/88"
		<TELL
"Leading us to his hearth, he sat us in a semi-circle around the
blazing fire and spoke. \"There is a story I must tell, a story of
Seven Stones. Created in a time lost to living memory, these Stones
contained the very strength and essence of our world. Of the Seven,
Four were entrusted to the races of men who could use them best:
Elves, Dwarves, Nymphs, and Wizards.\"" CR CR>
		<TELL
"\"These are the Four: the Elf Stone, green as the forests of old, and the
Dwarf Stone, brown as the caverns of Forn a-klamen; the Nymph Stone,
blue as the deep waters of M'nera, and the Wizard Stone, red as the
dark fire of Serdi.\"" CR CR>
		<TELL
"\"The four races are now sundered, and the Four have long
been kept apart, but now, with the " ,BAD-GUY " rearing his misshapen head
in our lands, we must bring them together again. For with them, we can
hope to find the Two, and then, finally, the One with
whose help we can destroy all Evil.\"" CR CR>
		<TELL
"\"For it is told that having the Four, it is possible to find the Two;
so, also, do the Two give witness to their master, the One that in elder
days was called the Anvil!\"" CR CR>	       
	       <COND (<G? .CNT 0>
		      <TELL
"\"Do they look anything like this?\" I asked, sheepishly, holding
up the " D <SET STN <FIRST-STONE>> " to Astrix' view." CR CR>
		      <TELL
"\"You are more resourceful than I had ever imagined!\" he said,
grinning widely, \"Yes, this is the ">
		      <TELL <STONE-NAME .STN>>
		      <TELL ".\"" CR CR>)>
	       <COND (<G? .CNT 1>
		      <TELL
"\"Oh,\" I said. \"And th">
		      <COND (<EQUAL? .CNT 2>
			     <TELL "is">)
			    (T
			     <TELL "ese">)>
		      <TELL "...?\"" CR CR>
		      <TELL
"\"My word! You have been busy!\" Astrix said, and slapped me heartily
on the back. \"Well now!\"" CR CR>)>
	       <SETG PASS-1-STONES .CNT>
	       <COND (<EQUAL? .CNT 3>
		      <ASTRIX-SHOWS-STONE>
		      <RTRUE>)>
	       <COND (<NOT <FSET? ,DWARF-MEETING ,SEEN>>
		      <TELL
"Astrix sat in deep thought, then spoke again. \"I am certain the
Dwarves who still walk the dark caverns can be of help to us. I know
of a gate...,\" Astrix said, and he proceeded to tell us where
we might find entrance to the Dwarves' kingdom." CR CR>
		      <TELL
"We trekked for five days until we reached the spot Astrix
had sent us to; ironically, we were not far from the fork at
Lavos where we had started our journey.">
		      <NEXT-DAY 5>
		      <TRAVEL-COMMANDS ,CANYON-GATE>
		      <MOVE-TO ,CANYON-GATE>)
		     (<NOT <FSET? ,HIGH-PLAIN ,SEEN>>
		      <TELL
"\"There is a place,\" Astrix began, \"a place high in the
mountains where we may find help in our cause.\" He gave
us directions, and sent us on our way." CR CR>
		      <TELL
"We trekked for three days until we reached the high plain to which
Astrix had sent us. Below, a large, clear lake sat in a bowl in
the mountains.">
		      <NEXT-DAY 3>
		      <MOVE-TO ,HIGH-PLAIN>)
		     (T
		      <FSET ,ASTRIX-TOWER-2 ,BLACK-MIX>
		      <MOVE-TO ,ASTRIX-TOWER-2>)>>)>

<ROUTINE STONE-COUNT ("AUX" (OBJ <FIRST? ,INVENTORY>) (CNT 0))
	 <REPEAT ()
		 <COND (<NOT .OBJ> <RETURN .CNT>)
		       (<EQUAL? .OBJ ,DWARF-STONE ,ELF-STONE ,NYMPH-STONE>
			<SET CNT <+ .CNT 1>>)>
		 <SET OBJ <NEXT? .OBJ>>>>

<ROUTINE STONE-NAME (STN)
	 <GETP .STN ,P?STONE-NAME>> 

<ROUTINE FIRST-STONE ("AUX" (OBJ <FIRST? ,INVENTORY>))
	 <REPEAT ()
		 <COND (<NOT .OBJ> <RFALSE>)
		       (<EQUAL? .OBJ ,DWARF-STONE ,ELF-STONE ,NYMPH-STONE>
			<RETURN .OBJ>)>
		 <SET OBJ <NEXT? .OBJ>>>>

<ROUTINE N-DAY-TREK (NUM)
	 <NEXT-DAY .NUM>
	 <TELL
"The next morning, we started the long trek back to Astrix' Tower,
and I'm happy to report that we arrived there ">
	 <TELL <GET ,INT-STR .NUM>>
	 <TELL " days later without serious incident." CR CR>
	 <MOVE-TO ,ASTRIX-TOWER-2>>

<CONSTANT INT-STR
	  <LTABLE "one" "two" "three" "four" "five">>

<GLOBAL PASS-1-STONES 0>

<ROOM ASTRIX-TOWER-2
      (TRAVEL-COMMANDS NUL-COMMAND NUL-COMMAND NUL-COMMAND)
      (ENTER
       <EXECUTE ("AUX" (CNT <STONE-COUNT>))
		<GRAPHIC ,G-ASTRIX>
		<COND (<FSET? ,HERE ,BLACK-MIX>
		       <TELL
"Astrix now looked grave.">)
		      (<FSET? ,STAIR-BOTTOM ,SEEN>
		       <TELL
"Astrix greeted us heartily when we returned. \"How has your journey
gone? What news have you found?\" he asked.">
		       <COND (<G? .CNT ,PASS-1-STONES>
			      <TELL CR CR
"We told him of our doings, and showed him the stone">
			      <COND (<G? <- .CNT ,PASS-1-STONES> 1>
				     <TELL "s">)>
			      <TELL " we had obtained." CR CR>
			      <COND (<EQUAL? .CNT 3>
				     <ASTRIX-SHOWS-STONE>
				     <RTRUE>)
				    (T
				     <TELL
" \"This is good,\" he said, but he looked disappointed.">)>)
			     (T
			      <TELL CR CR
"We told Astrix of our adventures, but he seemed disappointed.">)>)>
		<TELL
" \"I am afraid we will need the three Stones,\" he said, \"if we are to
defeat the Enemy.\"" CR CR>
		<TELL
"\"Three stones?\" I said, quizzically, \"You said there were four
Sisters?\"">
		<TELL CR CR
"\"And so there are,\" Astrix said, holding out a fiery red stone. \"This is
the Wizard Stone! I had hoped it would be of use in our war against the "
,BAD-GUY ".\"" CR CR> 
		<PART-ONE-BAD-ENDING>>)>

<ROUTINE PART-ONE-BAD-ENDING ("OPTIONAL" (ONE? <>))
	 <TELL
"\"I fear we are now without hope. The ">
	 <COND (.ONE? <TELL "Anvil is">)
	       (T
		<TELL "remaining stones are">)>
	 <TELL " beyond our
grasp! Get back to your lands that you may join your families before the Storm
arrives. Flee these lands lest you be swept away!\"" CR CR>
	 <TELL
"And then, from the north, came a mocking laugh carried on an icy wind.
We covered our ears, but Astrix ran to his high balcony and cursed the "
,BAD-GUY " in the languages of old. But the laugh was not stilled;
and Astrix, overcome by a great madness, leapt from his great tower and
plunged to his death....">
	 <BAD-ENDING>>

<CONSTANT I-SIT-ALONE
"I often sit alone and think of those days; and I long to know what has
become of my many friends who have long since fled across the southern
seas. I do not know for whom I write this chronicle, yet it seems
best that it be told, for soon there will be none who can remember,
none who can dream of what was, and someday yet will be.">

<ROUTINE ENDING ()
	 <TELL "[The End]" CR>
	 <CLEAR-SUBGROUP>
	 <SETG SUBGROUP-MODE T>
	 <MOVE-TO ,ENDING-ROOM>>

<ROOM ENDING-ROOM
      (TRAVEL-COMMANDS QUIT-COMMAND RESTORE-COMMAND START-OVER-COMMAND
       		       MUSINGS-COMMAND)
      (ENTER
       <EXECUTE ()
		<COND (,GAME-WON?
		       <CHANGE-PARTY-COMMAND ,GAME-COMMAND ,CREDITS-COMMAND>)
		      (T
		       <REMOVE-PARTY-COMMAND ,GAME-COMMAND>)>
		<COND (<AND <NOT ,GAME-WON?> <NOT <FIRST? ,HINTS>>>
		       <REMOVE-TRAVEL-COMMAND ,HERE ,MUSINGS-COMMAND>)>>)>

<COMMAND CREDITS <> ()
	 <REMOVE-TRAVEL-COMMAND ,HERE ,CREDITS-COMMAND>
	 <TELL
"Journey would not have been possible if not for the efforts of a few special
people, whom I am honored to acknowledge. First among these is Donald Langosy,
who conceived and executed the original illustrations that bring the Journey
to life. Coordinating both the illustrations and the testing effort was Joe
Prosser, who was ably assisted by Craig Fields, Patricia Pizer, Tyler
Gore and Kurt Boutin, all from Infocom's testing department. Finally, I must
single out the efforts of Tim Anderson, one of my original Zork
co-authors, for the nearly thankless task which he has happily performed: the
implementation of Infocom's new graphic development system." CR CR>
	 <TELL
"Marc Blank, August 1988">>

<GLOBAL KILLED-TBL <TABLE 0 0 0 0 0>>

<ROUTINE KILLED-OFF (CHR "AUX" TMP)
	 <PARTY-REMOVE .CHR>
	 <PUT ,KILLED-TBL <SET TMP <+ <GET ,KILLED-TBL 0> 1>> .CHR>
	 <PUT ,KILLED-TBL 0 .TMP>>

<ROUTINE ASTRIX-SHOWS-STONE ()
	 <TELL
"Astrix took the three stones, and it seemed they were basked in a warm red
light, as if from a glowing ember. \"I have some surprises of my own,\"
he said, and revealed to us the glowing Wizard Stone, which he had
long possessed. \"It is beautiful, is it not, " TAG "? Not since the day
it was cut from the living earth has such a sight been witnessed!\"" CR CR>
	 <GRAPHIC <> ,G-FOUR-STONES ,BOTTOM-LEFT>
	 <COND (<AND <G? ,PARTY-MAX 3>
		     <IN-PARTY? ,BERGON>>
		<TELL
"Astrix turned silent and stared into the glowing Stones. When, at last,
the trance was broken, he spoke again. \"The Two are revealed to me; one
lies deep within the earth, the other in an Elvish place - very old, and
long forgotten. More than that, I cannot say.\"" CR CR> 
		<COND (<EQUAL? ,PARTY-MAX 5>
		       <PARTY-REMOVE ,MINAR>
		       <TELL
"Minar now spoke. \"I am grateful that you have allowed me to journey with
you to this place,\" he began, \"but I must return now to the plains, for
there is much to be done. At the least, I shall report to the people on your
safe arrival at the Sunrise Tower! Good luck to you all; perhaps our paths
shall cross again.\" And, though we tried to persuade him otherwise, Minar
turned and left Astrix' high tower and started on the lonely road toward
home." ;"where, I am happy to report, he lives to this day." CR CR>)>
		<MOVE-TO ,TWO-A-CONNECTOR>)
	       (T
		<TELL
"\"Yes, you have all done well, but perhaps not well enough, for you have lost
enough of your party that the search for the remaining Stones is
pointless.">
		<COND (<NOT <IN-PARTY? ,BERGON>>
		       <TELL " It is particularly sad that you lost your
leader, Bergon.">)>
		<TELL "\"" CR CR>
		<PART-ONE-BAD-ENDING>)>>
