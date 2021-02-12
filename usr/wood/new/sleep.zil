"SLEEP for
		 	    ENCHANTER
	Copyright 1983 Infocom, Inc.  All Rights Reserved.
"

;"Not exactly Holiday Inn, much less the Ritz"

<GLOBAL LAST-SLEEP 0>

<CONSTANT MOVES-PER-DAY 86>
<CONSTANT MOVES-PER-SLEEP 42>

<ROUTINE V-TIME ("AUX" EL)
	 <SET EL </ ,TOD 10>>
	 <TELL "It would be " <GET ,TIME-TABLE .EL> " now." CR>>

<GLOBAL TIME-TABLE <TABLE
"just past dawn" 	;"6am"
"early morning"		;"8am"
"mid-morning"
"around noon"		;"12n"
"early afternoon"
"mid-afternoon"		;"4pm"
"early evening"
"mid evening"		;"8pm"
"late evening"
"midnight"		;"12m"
"in the early hours"
"pre-dawn"		;"4am"
"dawn">>

<OBJECT GLOBAL-SLEEP
	(IN GLOBAL-OBJECTS)
	(DESC "sleep")
	(SYNONYM SLEEP)
	(ACTION GLOBAL-SLEEP-F)>

<ROUTINE GLOBAL-SLEEP-F ()
	 <COND (<VERB? WALK-TO TAKE>
		<COND (<IN? ,WINNER ,BEDROOM>
		       <MOVE ,WINNER ,BED>)>
		<PERFORM ,V?SLEEP>
		<RTRUE>)
	       (<VERB? FIND> <TELL "I know your first inclination is to sleep in the gutter, but why not find a bed to sleep in?" CR>)>>
	       
<GLOBAL THIRST-COUNT 0>

<ROUTINE I-THIRST ()
	 <COND (<G? <SETG THIRST-COUNT <+ ,THIRST-COUNT 1>> 5>
		<SETG THIRST-COUNT 0>
		<QUEUE I-THIRST 40>
		<SETG WINNER ,PROTAGONIST>
		<JIGS-UP
"You pass out from the tremedous nausea of your hangover. While passing out provides relief from the hangover, it also has an unfortunate side effect -- death." <>>)
	       (T
		<TELL <GET ,THIRST-TABLE ,THIRST-COUNT> CR>
		<QUEUE I-THIRST 10>)>>

<GLOBAL THIRST-TABLE <LTABLE
"You're a little hung over now. All this drinking is giving you a bit of a headache."
"Your hang over is getting worse. Your mouth feels like it's stuffed full of cotton."
"You are very thristy now and your head is pounding. You'd better take some Tylenol soon."
"The nasuea is killing you. If you don't take some Tylenol soon you will pass out."
"Your hang over is unbearable. You are becoming delirious."
"BUG">>

<GLOBAL HUNGER-COUNT 0>

<ROUTINE I-HUNGER ()
	 <COND (<G? <SETG HUNGER-COUNT <+ ,HUNGER-COUNT 1>> 5>
		<SETG HUNGER-COUNT 0>
		<QUEUE I-HUNGER 47>
		<SETG WINNER ,PROTAGONIST>
		<JIGS-UP
"You pass out from lack of strength and die." <>>)
	       (T
		<TELL <GET ,HUNGER-TABLE ,HUNGER-COUNT> CR>
		<QUEUE I-HUNGER 10>)>>

<GLOBAL HUNGER-TABLE <LTABLE
"You're starting to twitch and shake a little. Maybe you need a smoke."
"You could really use a cigarette now."
"A nicotine fit grips you now. You try to smoke your shoelaces."
"Slobber runs down your unshaven face as you salavate over the thought of smoking a cigarette the size of the Prudential Building."
"The smallest butt of the smallest cigarette would be nice now. Your entire body shakes uncontrolably as your vision blurs, focuses, then blurs again."
"BUG">>

<ROUTINE I-TIRED ("AUX" (FORG <>))
	 <COND (<IN? ,WINNER ,BED>
		<TELL
"The bed sure is comfortable. Better than the usual gutter or card board box. You're feeling tired." CR>
		<V-SLEEP T>
		<RFATAL>)>
	 <COND (<G? ,LOAD-ALLOWED 10>
		<SETG LOAD-ALLOWED <- ,LOAD-ALLOWED 10>>)>
	 <COND (<G? ,FUMBLE-NUMBER 1>
		<SETG FUMBLE-NUMBER <- ,FUMBLE-NUMBER 1>>)>
	 <SETG FUMBLE-PROB <+ ,FUMBLE-PROB 1>>
	 <COND (<G? ,SPELL-MAX 1>
		<SETG SPELL-MAX <- ,SPELL-MAX 1>>
		<COND (<NOT <EQUAL? ,SPELL-ROOM 0>>
		       <SETG SPELL-ROOM <- ,SPELL-ROOM 1>>)>
		<COND (<EQUAL? ,SPELL-ROOM 0>
		       <SET FORG T>
		       <FORGET-SPELL ,DISPEL-SPELL>)>)>
	 <ENABLE <QUEUE I-TIRED 10>>
	 <SETG AWAKE <+ ,AWAKE 1>>
	 <COND (<G? ,AWAKE 10>
		<TELL
"You pass out from exhaustion. At least you weren't sitting on a bar stool (as usual.)" CR>
		<CRLF>
		<V-SLEEP>
		<RFATAL>)
	       (ELSE
		<TELL "You are " <GET ,TIRED-TELL ,AWAKE>>
		<COND (.FORG
		       <TELL
" and you are having a hard time remembering spells, much less remembering what they do!">)>
		<TELL "." CR>)>>

<GLOBAL AWAKE -1>

<ROUTINE V-DIAGNOSE ()
	 <COND (<L? ,AWAKE 0>
		<TELL "You are as wide awake as you will ever be. Might as well keep playing">)
	       (T <TELL "You are " <GET ,TIRED-TELL ,AWAKE>>)>
	 <TELL ". You ">
	 <TELL <GET ,THIRST-TELL ,THIRST-COUNT>>
	 <TELL " and you are ">
	 <TELL <GET ,HUNGER-TELL ,HUNGER-COUNT>>
	 <TELL "." CR>>

<GLOBAL HUNGER-TELL <TABLE
"don't want a smoke now"
"are considering never smoking again"
"figure one cigarette couldn't hurt now"
"could smoke half a pack"
"could smoke two packs"
"would smoke your socks now -- if you had any,"
"feel faint. Your knees wooble">>

<GLOBAL THIRST-TELL <TABLE
"filler"
"filler"
"filler"
"filler"
"filler"
"filler">>

<GLOBAL TRIED-TELL <TABLE
"filler"
"filler"
"filler"
"filler"
"filler"
"filler"
"filler"
"filler"
"filler"
"filler"
"filler">>

<GLOBAL BED-WARNING <>>

<ROUTINE V-SLEEP ("OPTIONAL" (TOLD? <>) "AUX" TILL-TIRED MUNGED?)
	 <SET TILL-TIRED <- ,MOVES-PER-DAY <- ,MOVES ,LAST-SLEEP>>>
	 <COND (<EQUAL? ,HERE ,REAL-STAIR ,PIT>
		<TELL "To sleep here would be fatal!" CR>)
	       (<G? .TILL-TIRED 10>
		<TELL
"You settle down to sleep, but you really aren't tired, so you
thrash around for a while and then give up." CR>)
	       (<EQUAL? ,HERE ,ENGINE-ROOM ,CLOSET ,SE-TOWER>
		<TELL "You try to sleep but it's too noisy." CR>)
	       (<AND <EQUAL? ,HERE ,BEDROOM>
		     <NOT <IN? ,WINNER ,BED>>
		     <NOT ,BED-WARNING>>
		<SETG BED-WARNING T>
		<TELL
"You might try getting into the bed first. It would be more comfortable." CR>)
	       (ELSE
		<COND (<AND <G? .TILL-TIRED 0>
			    <IN? ,WINNER ,BED>
			    <NOT .TOLD?>>
		       <TELL
"You're not all that tired, but the bed is very comfortable." CR>)>
		<SETG REAL-SPELL-MAX <+ ,REAL-SPELL-MAX 1>>
		<SETG SPELL-MAX ,REAL-SPELL-MAX>
		<SETG SPELL-ROOM ,SPELL-MAX>
		<SETG LAST-SLEEP ,MOVES>
		<SETG MOVES <+ ,MOVES ,MOVES-PER-SLEEP>>
		<SETG TOD <MOD <+ ,TOD ,MOVES-PER-SLEEP> 128>>
		<SETG LOAD-ALLOWED ,LOAD-MAX>
		<SETG FUMBLE-NUMBER 7>
		<SETG FUMBLE-PROB 8>
		<ENABLE <QUEUE I-TIRED ,MOVES-PER-DAY>>
		<SETG AWAKE -1>
		<FORGET-ALL>
		<SET MUNGED? <FSET? ,HERE ,RMUNGBIT>>
		<I-MUNG-ROOM <>>
		<I-MUNG-ROOM <>>
		<I-MUNG-ROOM <>>
		<COND (<AND <NOT .MUNGED?>
			    <FSET? ,HERE ,RMUNGBIT>>
		       <TELL
"You fall asleep quickly and begin to dream. The dream turns into a
nightmare of decay and desolation, as your surroundings turn grey and
lifeless. You feel a great weight, like a pile of ashes, constricting
your movements, and then you bolt awake!" CR>
		       <RTRUE>)
		      (<AND <IN? ,WINNER ,BED>
			    <NOT <IN? ,BEDPOST-BUTTON ,BED>>
			    <G? ,CHARM-POINT 0>>
		       <MOVE ,BEDPOST-BUTTON ,BED>
		       <TELL
"You fall asleep quickly, the bed being so comfortable. You dream as
well, of this very room. A beautiful damsel, obviously noble, is
standing by the bed holding a scroll in one hand and resting the other
on the bedpost. Turning to block your view, she does something you can't
see. Then she gets in bed and turns out the light, but before she does
you can see she is no longer carrying the scroll... You wake." CR>
		       <RTRUE>)>
		<TELL
"Ah, sleep! It's been a long day, indeed. The rest will do you good.
">
		<COND (<IN? ,WINNER ,BED>
		       <TELL "You make yourself comfortable on the bed">)
		      (<OUTSIDE? ,HERE>
		       <TELL "You spread your cloak under the open sky">)
		      (T <TELL "You spread your cloak on the floor">)>
		<TELL " and drift off, renewing your powers
and refreshing your mind ... Time passes as you snore blissfully." CR>
	 <CRLF>
	 <COND (<AND <OUTSIDE? ,HERE>
		     <NOT ,PROTECTED-FROM-EVIL>
		     <PROB ,MOLESTED>>
		<COND (<PROB ,MUNCHED>
		       <JIGS-UP
"You sleep blissfully, unaware of the evil creatures lurking in the
darkness. Unaware, that is, until one of them sets upon you with nasty
sharp teeth.">
		       <RFATAL>)
		      (ELSE
		       <ROB ,WINNER>
		       <ROB ,HERE>
		       <TELL
"You don't sleep too well, and you awake at least once with the feeling
that something has jostled you in the dark." CR>)>)
	       (<AND <NOT <EQUAL? ,GALLERY-POINT 0>>
		     <NOT ,GALLERY-DREAM>>
		<SETG GALLERY-DREAM T>
		<TELL
"After a while, your sleep is disturbed by a strange dream. You are
wandering in a darkened place, for you have no light or other
possessions. You feel that you are being watched! You are surrounded by
faces, their eyes following you. They drift in and out, staring at you
with proud indifference. One face, brightly lit (unlike the rest), draws
you closer and closer. As you touch it, you wake." CR>)
	       (<AND <NOT <EQUAL? ,GALLERY-POINT 0>> <PROB 70>>
		<TELL
"Your sleep is disturbed by the strange dream of an earlier night. You are
in the dark, with no light or other possessions. You are surrounded by
many faces, their eyes following you. The one brightly lit face beckons
you closer and closer. You wake, convinced that the dream holds a message
for you." CR>)
	       (<AND <NOT ,DOOR-KULCAD>
		     <NOT ,DOOR-DREAM>
		     <FSET? ,DOOR-REALITY ,INVISIBLE>>
		<SETG DOOR-DREAM T>
		<TELL
"You dream of a nondescript room in which a cartoonish figure casually opens
a simple wooden door and ascends the flight of stairs which lies behind. The
scene fades to black, but you awaken in a cold sweat." CR>)
	       (<AND ,DOOR-KULCAD <NOT ,DOOR-DREAM-2>>
		<SETG DOOR-DREAM-2 T>
		<TELL
"You dream of climbing in an unfamiliar place. You seem to climb forever,
beyond reason. A fleeting hope arises in you, and you search furiously in
your spell book and possessions for something. After a moment, you become
frantic as you realize that you don't have it! You bolt awake in a cold
sweat." CR>)
	       (<AND <NOT ,PROTECTED-FROM-EVIL>
		     <PROB 50>>
		<ROB ,HERE ,WARLOCK-TOWER>
		<COND (<PROB 50> <ROB ,WINNER ,WARLOCK-TOWER>)>
		<COND (<NOT <==? ,HERE <LOC ,WINNER>>>
		       <ROB <LOC ,WINNER> ,WARLOCK-TOWER>)>
		<TELL
"You sleep fitfully. At one point it seems that some evil presence is searching
nearby. The tense feeling passes, but it's replaced by one of foreboding." CR>)
	       (<PROB 50>
		<TELL
"You sleep uneventfully, dreamlessly, and awake refreshed." CR>)
	       (ELSE
		<TELL <PICK-ONE ,DREAMS>>
		<TELL " You awaken." CR>)>)>>

<GLOBAL DOOR-DREAM-2 <>>

<GLOBAL DOOR-DREAM <>>

<GLOBAL GALLERY-DREAM <>>

<GLOBAL MOLESTED 20>
<GLOBAL MUNCHED 45>

<GLOBAL DREAMS <LTABLE 0

"You dream of being pursued through a dank cavern. Something is behind
you, something horrible that you can't turn to face. It gets closer and
closer, and you can feel its hot breath on your neck. You turn and see
your mother-in-law."

"You dream of an idyllic scene in the Abt court yard, a picnic of wood-sprites, dryads and a water-cooler full of screwdrivers."

"You dream of Krill. He works feverishly in an evilly lit workroom. He
is working a conjuration of great complexity and power, and the room is
strewn with the noisome components of this horrific casting. Krill chants
words of awful power as he works."

"You dream you are at the Bay Tower Room. Penguins in formal dress are are waiting tables. One penguin comes over to your table and hands you the wine list."

"You dream of a river of Pina Coladas. Great grey hippopotami act as
gigantic swizle sticks, bellowing and splashing, and twitching their
ears.">>

