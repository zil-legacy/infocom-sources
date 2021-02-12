"DWARVES for
		      		JOURNEY
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<GLOBAL DWM-HERE 4>
<GLOBAL DWM-LOC1 6>
<GLOBAL DWM-LOC2 1>
<GLOBAL DWM-FACING 1>

<ROOM DWARF-MEETING-LOC
      (TRAVEL-COMMANDS PROCEED-COMMAND BACK-COMMAND STAND-COMMAND)
      (FLAGS UNDERGROUND DANGEROUS DONT-SCOUT)
      (ENTER
       <EXECUTE ()
		<TELL CR CR>
		<SCENE ,DWARF-MEETING>>)
      (TEMP 0)>

<ROOM CAVERN-1
      (TRAVEL-COMMANDS PROCEED-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <UPDATE-MOVE ,STORY-TOWERS ,HURTH-STORIES>
	       <MOVE-TO ,STAIR-BOTTOM
"Hurth led us down the passage, and we soon came to a wide arch leading to an
impressive stone staircase. \"These stairs lead up to the High Gate and the
Tower of the Sunset,\" he said.">)>)> 

<OBJECT DWARF-MEETING
	(ACTION
	 <EXECUTE ("AUX" DF (BK <>))
		  <COND (<ACTION? BACK>
			 <SET BK T>
			 <SETG DWM-FACING <NOT ,DWM-FACING>>
			 <SETG ACTION ,PROCEED-COMMAND>
			 <NEW-DEFAULT>
			 <TELL
"We turned around and started slowly back in the opposite direction."
CR CR>)>
		  <COND (<ACTION? SCENE-START>
			 <TELL
"As we slowly made our way down the forbidding passageway, Bergon signalled
us to stop." CR CR>
			 <TELL
"\"Do you hear that?\" he asked, indicating some faint sound
from the gloom that lay before us.">
			 <COND (<AND <EQUAL? ,KIDNAPPED ,MINAR>
				     <IN-PARTY? ,ESHER>>
				<TELL CR CR
"\"Yes, and it's a trap, no doubt set for us by our friend Minar!\" scowled
Esher.">)>
			 <RTRUE>)
			(<ACTION? STAND>
			 <SETG DWM-LOC1 <- ,DWM-LOC1 1>>
			 <SETG DWM-LOC2 <+ ,DWM-LOC2 1>>
			 <COND (<NOT <EQUAL? ,DWM-HERE ,DWM-LOC1 ,DWM-LOC2>>
				<COND (<NOT <GET-TEMP>>
				       <TELL
"As we stood our ground, it seemed that sounds could be heard behind
us as well as in front of us.">
				       <DWM-TRAPPED>)
				      (T
				       <SETG DWM-LOC1 ,DWM-HERE>
				       <DWM-HEAR>
				       ;<TELL
"We braced ourselves for attack as the sounds, now clearly footsteps,
became ever louder.">)>)
			       (T
				<DWM-HEAR>)>)
			(<ACTION? PROCEED>
			 <COND (<NOT .BK>
				<COND (<NOT <F&SET? ,HERE ,TRAPPED>>
				       <TELL
"Increasingly apprehensive, we made our way slowly down the passage." CR CR>)
				      (T
				       <TELL
"Reaching toward our weapons, we moved forward at a snail's pace; the
sounds grew louder and seemed to come from all around us!" CR CR>)>)>
			 <COND (,DWM-FACING
				<SETG DWM-HERE <+ ,DWM-HERE 1>>
				<SETG DWM-LOC2 <+ ,DWM-LOC2 1>>)
			       (T
				<SETG DWM-HERE <- ,DWM-HERE 1>>
				<SETG DWM-LOC1 <- ,DWM-LOC1 1>>)>
			 <DWM-HEAR>)
			(<AND <ACTION? CAST>
			      <OBJECT? FAR-VISION-SPELL>>
			 <COND (<ZERO? ,DWM-FACING>
				<SET DF <DIFF ,DWM-LOC2 ,DWM-HERE>>)
			       (T
				<SET DF <DIFF ,DWM-LOC1 ,DWM-HERE>>)>
			 <CAST-FAR-VISION <>>
			 <GRAPHIC ,G-DWARVES-FV>
			 <TELL CR CR
"\"There!\" said Bergon, as the fireball cast its eerie light on
a group of shadowy figures not ">
			 <COND (<EQUAL? .DF 2>
				<TELL "fifty">)
			       (<EQUAL? .DF 1>
				<TELL "twenty">)>
			 <TELL " paces away.">)
			(<ACTION? COMBAT>
			 <COND (,2ND-PASS
				<TELL
"Bergon, surprised by the aggressiveness of the Dwarves, drew
his sword, but we stayed his hand. \"Astrix said the Dwarves
were our allies,\" Praxix reminded him.">
				<REMOVE-PARTY-COMMAND ,COMBAT-COMMAND>
				<RTRUE>)>
			 <TELL
"At Bergon's signal, we started to fight, but we were surrounded and
hopelessly outnumbered. Beaten badly, we were at the Dwarves mercy.
But Agrith, their leader, stayed their hands. They bound and
blindfolded us, and marched us back to the gate at which we entered
the cavern. The heavy stone door closed behind the Dwarves and
disappeared from sight.">
			 <HINT ,HINT-DWARVES>
			 <DWM-END ,CANYON-GATE>)
			(<ACTION? RETREAT>
			 <REMOVE-PARTY-COMMAND ,RETREAT-COMMAND>
			 <TELL
"We thought of trying to escape, but were completely surrounded. We
would either have to fight these Dwarves or parley with them.">)
			(<ACTION? PARLEY>
			 <TELL
"Bergon sheathed his sword, and took a few small steps toward the Dwarf
leader.">
			 <OPTION ,BERGON ,TELL-TRUTH-COMMAND ,LIE-COMMAND>)
			(<ACTION? TELL-TRUTH>
			 <COND (,2ND-PASS
				<TELL
"\"We have journeyed here from the Sunrise Tower of Astrix, the Wizard.
He believes we may benefit in our fight with the " ,BAD-GUY " by exploring
these caverns.">
				<COND (,KIDNAPPED
				       <TELL
" We have faced many dangers on our journey, and just now one
of our party has disappeared near the gate at Bern i-Lav.">)>
				<TELL "\"" CR CR>)
			       (T
				<TELL
"\"We journey eastward to the Tower of the Sunrise, in search of the Wizard
Astrix.\"" CR CR>
				<TELL
"\"You choose a most unusual route....\"" CR CR>
				<TELL
"\"We chose not this path. One of our party disappeared near the gate by
which we entered these caverns, and we have followed his trail to this
spot.\"" CR CR>)>
			 <COND (,KIDNAPPED
				<TELL
"There was a murmur in the ranks of the Dwarves, and their leader at
last held out a bloodied garment that belonged to ">
				<TELL D ,KIDNAPPED>
				<TELL ". \"We found this
earlier. If he has been taken by the Orcs, your best hope is that he
has died!\" He paused for a long moment." CR CR>)>
			 <DWM-ESCORT-OPTION>)
			(<ACTION? LIE>
			 <TELL
"\"We travel east to meet our friends at the port of Zan.\"" CR CR>
			 <TELL
"\"If you have friends in Zan, the worse for you!\" the Dwarves' leader
spat. \"It is an evil place, a den of thieves and assassins.\" His voice
had taken on an alarmingly belligerent tone, but he quickly regained his
composure and now spoke in a quieter, more thoughtful voice. \"Yet,\"
he said, \"you are not of Orcish blood, and it is possible that you are
not enemies of the Dwarves." CR CR>
			 <TELL
"\"We do not kill in haste, as is now the fashion, but we cannot allow
you and your party to walk the halls of Reth a-Zar without an
escort.\" His eyes slowly passed over each of us, then he spoke as a
judge passing sentence." CR CR>
			 <FSET ,DWARF-MEETING ,TRAPPED>
			 <DWM-ESCORT-OPTION T>)
			(<ACTION? GET-ADVICE>
			 <FCLEAR ,HERE ,ADVISE>
			 <COND (<FSET? ,DWARF-MEETING ,SEEN>
				<TELL
"We conferred briefly to consider Agrith's offer. ">
				<COND (<IN-PARTY? ,ESHER>
				       <TELL "With the exception of
Esher, who remained convinced of Minar's evil purpose,">)
				      (T
				       <TELL "There was no dissention:">)>
				<TELL " the group was united
in favoring acceptance.">)
			       (<IN-PARTY? ,ESHER>
				<TELL
"Bergon asked the group for advice, but only Esher answered.
\"If anyone cared about my advice, we wouldn't be on this 'adventure' in
this first place.\" He was in fine form, clearly demonstrating why nobody
cared about his advice.">)>
			 <OPTION ,BERGON ,ACCEPT-COMMAND ,DECLINE-COMMAND>)
			(<OR <AND <ACTION? DECLINE> ,2ND-PASS>
			     <ACTION? ACCEPT>>
			 <COND (<ACTION? DECLINE>
				<TELL
"Bergon thought to decline, feeling some distrust toward this unknown
people. Yet, Astrix felt certain that we should come here, and Bergon
was loath to disappoint him." CR CR>)>
			 <TELL
"Bergon replied, \"You are most gracious, Agrith, and we would
be foolish indeed to decline your offer.\" Agrith bowed slightly, then
motioned to one of his men, who stepped forward. \"This is Hurth, one
of my sons. He shall be your guide through Reth a-Zar!\"" CR CR>
			 <TELL
"Agrith handed Hurth a flaming torch to help guide our way, and then the
two Dwarves embraced in their fashion. With a motion of his arm, Agrith
signalled the others to follow, and quietly he led them away into the
gloom of the cavern's depths."> 
			 <DWM-END ,CAVERN-1>
			 <PARTY-ADD ,HURTH>
			 <PRINT-CHARACTER-COMMANDS>
			 <RTRUE>)
			(<ACTION? DECLINE>
			 <TELL
"Bergon declined Agrith's offer, saying \"Our concerns and yours are not
yet joined. We shall find our way alone.\"">
			 <DWM-END ,CANYON-GATE>)>>)>

<ROUTINE DWM-ESCORT-OPTION ("OPT" (FOO <>))
	 <COND (<AND ,2ND-PASS <NOT .FOO>>
		<TELL
"\"I do not know what purpose Astrix has in mind, but I grant you
this option,\" Agrith said. \"Continue freely through these halls
with our chosen escort, or leave at once! Choose now!\"">)   
	       (T
		<TELL
"\"I, Agrith, speaking for the Dwarves, grant you this option: to continue
on your way with our chosen escort, or to leave these halls at once.
Choose now!\"">)>
	 <OPTION ,BERGON ,ACCEPT-COMMAND ,DECLINE-COMMAND ,GET-ADVICE-COMMAND>
	 <RTRUE>>

<ROUTINE DWM-END (RM)
	 <END-OPTION>
	 <SCENE <>>
	 <MOVE-TO .RM>>

<ROUTINE DIFF (N1 N2)
	 <COND (<G? .N1 .N2> <- .N1 .N2>)
	       (T <- .N2 .N1>)>>

<ROUTINE DWM-HEAR ("AUX" DL DIF DF1 DF2 (SURR <>))
	 <SET DF1 <DIFF ,DWM-LOC1 ,DWM-HERE>>
	 <SET DF2 <DIFF ,DWM-LOC2 ,DWM-HERE>>
	 <COND (<G? .DF2 .DF1>
		<SET DL ,DWM-LOC1>
		<SET DIF .DF1>)
	       (T
		<SET DL ,DWM-LOC2>
		<SET DIF .DF2>
		<SET SURR T>)>
	 <COND (<ZERO? .DIF>
		;"We've arrived at their location."
		<GRAPHIC ,G-DWARVES>
		<FSET ,DWARF-MEETING ,SEEN>
		<UPDATE-FSET ,HERE ,DONT-CAST>
		<TELL
"Our assailants had finally arrived; Dwarves they were, and heavily
armed. We joined in a tight circle, weapons drawn, and waited for the
onslaught. But they did not attack; rather, their leader, somewhat taller
and having about him an air of superiority, strode forward." CR CR>
		<TELL
"\"What business have you here in Reth a-Zar?\" he demanded. \"Come,
speak quickly, for we have no patience with strangers!\"">
		<COND (<NOT <FSET? ,TALE-RETH-A-ZAR ,EXAMINED>>
		       <TELL
" Under his breath, Praxix repeated the strange words - 'Reth a-Zar';
they seemed to hold some great meaning for our Wizard-friend, but for
us they spoke only of hopelessness and despair.">)>
		<COND (<NOT <FSET? ,TALE-RETH-A-ZAR ,EXAMINED>>
		       <UPDATE-MOVE ,TALE-RETH-A-ZAR ,PRAXIX-TALES>)>
		<MODE ,FIGHT-MODE>
		<PRINT-CHARACTER-COMMANDS>
		<CHANGE-CIT ,BERGON 1 ,NUL-COMMAND>
		<SETG OPPONENT ,DWARVES>
		<SETG COMBAT-ROUND -1>
		<RTRUE>)>
	 <COND (<OR <AND <G? .DL ,DWM-HERE> ,DWM-FACING>
		    <AND <L? .DL ,DWM-HERE> <NOT ,DWM-FACING>>>
		<TELL "Ahead of">)
	       (T
		<TELL "From somewhere behind">)>
	 <TELL " us, we could ">
	 <COND (<EQUAL? .DIF 2> <TELL "barely ">)>
	 <TELL "make out muffled noises which seemed to be coming
nearer with each passing moment.">
	 <COND (<AND .SURR <NOT <GET-TEMP>>>
		<DWM-TRAPPED>)>
	 <RTRUE>>

<ROUTINE UPDATE-REMOVE (OBJ)
	 <UPDATE-MOVE .OBJ>>

<ROUTINE UPDATE-FSET (OBJ BIT)
	 <SETG UPDATE-FLAG T>
	 <FSET .OBJ .BIT>>

<ROUTINE UPDATE-FCLEAR (OBJ BIT)
	 <SETG UPDATE-FLAG T>
	 <FCLEAR .OBJ .BIT>>

<ROUTINE UPDATE-MOVE (OBJ "OPTIONAL" (TO <>) "AUX" (L <LOC .OBJ>))
	 <SETG UPDATE-FLAG T>
	 ;<COND (<AND .TO <NOT <FIRST? .TO>>>
		<SETG UPDATE-FLAG T>)>
	 <COND (.TO <MOVE .OBJ .TO>)
	       (T
		<REMOVE .OBJ>)>
	 ;<COND (<OR <NOT .TO> <AND .L <NOT <FIRST? .L>>>>
		<SETG UPDATE-FLAG T>)>
	 <RTRUE>>

<ROUTINE DWM-TRAPPED ()
	  <SET-TEMP T>
	  <TELL CR CR
"\"They come from both sides. We are trapped!\" said Bergon, verbalizing
that which we had since
feared in our hearts. Each of us reached for his weapon, knowing battle
to be near at hand.">>
		 
<ROOM ORC-FORK
      (TRAVEL-COMMANDS LEFT-COMMAND RIGHT-COMMAND NUL-COMMAND)
      (GRAPHIC G-ORC-FORK)
      (FLAGS UNDERGROUND DANGEROUS)
      (ACTION
       <ACOND ()
	      (LEFT:REMOVE
	       <TELL
"As we moved down the left passage, we could hear sounds ahead. Hurth
waved for us to stop; then, he continued alone and reported that he
was certain that a gang of orcs were just beyond our sight." CR CR>
	       <TELL
"\"I would hate to turn that corner and find ourselves surprised by
orcs,\" Bergon whispered. \"Perhaps we will have better luck with the
right-hand passage.\" We agreed, and silently returned to the fork.">)
	      (SCOUT:REMOVE
	       <TELL ACT " made his way down both corridors, then
returned. \"This way! Quietly!\" he said, motioning toward the
right-hand passage.">)
	      (RIGHT
	       <COND (<NOT <F&SET? ,HERE ,BLACK-MIX>>
		      <TELL
"Proceeding carefully, we made our way down the passage, and there we
found the meaning of the glowing cavern wall. Not fifty yards away, the
cavern opened into a vestibule, in the middle of which stood five
grotesque figures huddling around an open fire. Bound and gagged on the
floor nearby, unmoving, was ">
		      <COND (,KIDNAPPED <TELL D ,KIDNAPPED "!" CR CR>)
			    (T <TELL "a badly beaten Dwarf!" CR CR>)>
		      <TELL
"\"Orcs!\" Hurth spat. \"Kirth en-Gilan!\"">)
		     (T
		      <TELL
"Again, we made our way to the edge of the orcs' cavern. This time, we
knew we had no alternative but to fight!">
		      <REMOVE-TRAVEL-COMMAND ,ORC-ANTE ,BACK-COMMAND>)>
	       <MOVE-TO ,ORC-ANTE>)>)>

<GLOBAL KIDNAPPED <>>

<ROOM ORC-VESTIBULE
      (TRAVEL-COMMANDS RETURN-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND)
      (ACTION
       <ACOND ()
	      (RETURN
	       <REMOVE-TRAVEL-COMMAND ,OUTSIDE-PRISON ,ENTER-COMMAND>
	       <COND (,KIDNAPPED
		      <TELL D ,KIDNAPPED " was safe">)
		     (T
		      <TELL "We had saved the Dwarf">)>
	       <TELL
", but at what cost? I shuddered at our bad fortune and
dreaded the trials that were yet to come." CR CR>
	       <TELL
"Bergon approached, and laid his hand on my shoulder. \"We must
put this behind us, " TAG ". Agrith grieves for Hurth and also for
his besieged people; we must not let either of them down.\" And taking
me by the arm, we left that field of battle." CR CR>
	       <TELL
"As we passed the fork, Bergon noticed a button of some kind mounted on
the wall with some runes above it. \"Let's hope this opens the prison
door,\" he said, and pressed it. Moving quickly, we lowered ourselves
back down into the prison, where, indeed, the door stood open. And
as we left, the door closed silently behind us.">
	       <MOVE-TO ,OUTSIDE-PRISON>)>)>

<ROOM ORC-ANTE
      (TRAVEL-COMMANDS FIGHT-COMMAND BACK-COMMAND NUL-COMMAND)
      (GRAPHIC G-ORC-ANTE)
      (FLAGS UNDERGROUND DANGEROUS ADVISE)
      (ENTER
       <EXECUTE ()
		<COND (<NOT <IN? ,ORCS ,HERE>>
		       <CHANGE-PARTY-COMMAND ,FIGHT-COMMAND
					     ,PROCEED-COMMAND>)>>)
      (ACTION
       <ACOND ()
	      (GET-ADVICE:REMOVE
	       <TELL
"There was little discussion; we would have to fight these orcs if
we were to save their captive. Hurth felt the most strongly, and I
suppose this was only natural." CR CR>
	       <TELL
"\"We must fight, but we must be careful; the orcs are fierce fighters
and we are outnumbered,\" he said.">)
	      (FIGHT
	       <SETG OPPONENT ,ORCS>
	       <SCENE ,ORC-FIGHT ,FIGHT-MODE>
	       <NUL-PARTY-COMMAND ,PARLEY-COMMAND>
	       <TELL
"Determined to rescue ">
	       <COND (,KIDNAPPED <TELL D ,KIDNAPPED>)
		     (T <TELL "the Dwarf">)>
	       <TELL ", we huddled to formulate a strategy.">)
	      (BACK
	       <MOVE-TO ,ORC-FORK
"Unwilling to risk further loss to our party, we retreated back to the
fork.">)>)>

<OBJECT ORC-FIGHT
	(ACTION
	 <ACOND ("AUX" ACT)
		(SCENE-START
		 <SETG COMBAT-ROUND -1>
		 <UPDATE-FSET ,HERE ,DONT-CAST>
		 <REMOVE-PARTY-COMMAND ,RETREAT-COMMAND>)
		(SCENE-END
		 <COND (<NOT <IN-PARTY? ,HURTH>>
			<GRAPHIC ,G-HURTH-DIES>
			<FSET ,OUTSIDE-PRISON ,TRAPPED>)>)
		(COMBAT-RESULT
		 <COND (<ZERO? ,COMBAT-ROUND>
			<GRAPHIC ,G-ORC-FIGHT>
			<FCLEAR ,HERE ,DONT-CAST>
			<CHANGE-CIT ,PRAXIX 1 ,CAST-COMMAND>
			<COND (<G? ,OFFENSIVE-RESULT 4>
			       ;"Someone is flanking"
			       <FSET ,HERE ,BLUE-MIX>
			       <TELL
"The orcs, badly confused, started to fight in both directions. One
fell to the ground, head severed by a fierce blow from Bergon's
sword.">)
			      (T
			       <ADD-PARTY-COMMAND ,RETREAT-COMMAND>
			       <CHANGE-CIT ,BERGON 1 ,NUL-COMMAND>
			       <TELL
"It was clear from the outset that our chances were not good; the orcs
were powerful fighters, and utterly fearless. Bergon was hit almost
at once by the side of a battle axe, but continued to fight in
spite of his wounds.">)>)
		       (<EQUAL? ,COMBAT-ROUND 1>
			<COND (<G? ,OFFENSIVE-RESULT 4>
			       <COND (<FSET? ,HERE ,BLUE-MIX>
				      ;"Flanked on 1st round"
				      <TELL
"Try as they might, the orcs could not recover from the two-pronged
attack. Another two were down, and except for a few scratches, our party
was unscathed and greatly emboldened by our success.">)
				     (T
				      ;"Now flanking (HURTH)"
				      <TELL
"Our change in tactics proved quite successful, as the orcs were
unprepared for our two-pronged attack. Two fell at once, while we
received no further injury.">)>)
			      (<EQUAL? ,OFFENSIVE-RESULT 4>
			       ;"Now flanking"
			       <TELL
"Our change in tactics was only partly successful, for Praxix now
was weakening and it seemed we cound not take proper advantage of the
confusion we had caused. One orc was down, slashed in the throat by
a deadly thrust from Hurth's sword, but the others fought with
undiminished zeal.">)
			      (T
			       <TELL
"Our attempts to parry the orcs' blows were failing, and soon each
of our party was wounded, making the orcs' weapons ever more punishing.
In our exasperation, we were barely able to do any damage ourselves;
the fight would soon be lost!">)>)
		       (T
			<TELL
"The victory would soon be ours; the remaining orcs were badly hurt
and their confidence wavering. Hurth struck down yet another with a mighty
blow of his sword as those remaining began to back off toward the far side
of the chamber.">)>
		 <RTRUE>)
		(CAST
		 <MAKE-BUSY ,PRAXIX>
		 <TELL
"Praxix, between blows, hoped to prepare a \"" AO "\" spell, but it didn't
appear he would get the chance to complete it.">)
		(<OR <ACTION? RETREAT>
		     <AND <ACTION? COMBAT>
			  <L? <PARTY-STATUS> 60>>>
		 <COND (,KIDNAPPED
			<HINT ,HINT-ORC-FIGHT>)>
		 <END-COMBAT <>>
		 <TELL
"We tried to continue the fight, but we were losing badly. Bergon,
fearing our complete destruction at the hands of the orcs, led us
into a retreat." CR CR>
		 <TELL
"As we passed the fork, Hurth noticed a device of some kind mounted on
the wall with some runes above it. \"Opens the prison door, but only
for a brief time,\" he said, and pressed it. Using
the rope to lower ourselves back down into the prison, we hurried
through the closing door." CR CR>
		 <TELL
"And as the door of cold stone slammed shut behind us, a terrifying scream
could be heard from inside the prison.">
		 <COND (,KIDNAPPED
			<TELL " I turned to Bergon and mouthed
the name \"" D ,KIDNAPPED "\"; we stood there in silence, but heard no more.">)
		       (T
			<TELL CR CR
			      "\"The orcs do not keep prisoners,\" Hurth said, \"Let us hurry.\"">)> 
		 <FSET ,OUTSIDE-PRISON ,TRAPPED>
		 <MOVE-TO ,OUTSIDE-PRISON>)
		(<AND <ACTION? FLANK>
		      <NOT <FSET? ,ORC-FIGHT ,SEEN>>>
		 <COND (<EQUAL? ,ACTOR ,BERGON>
			<SETG FLANK-ACTOR ,BERGON>
			<CHANGE-CIT ,HURTH 1 ,NUL-COMMAND>)
		       (T
			<SETG FLANK-ACTOR ,HURTH>
			<CHANGE-CIT ,BERGON 1 ,NUL-COMMAND>)>
		 <NEW-DEFAULT>
		 <MAKE-BUSY ,FLANK-ACTOR ,GONE-COMMAND>
		 <FSET ,ORC-FIGHT ,SEEN>
		 ;"He's flanked the orcs..."
		 <COND (<EQUAL? ,COMBAT-ROUND -1>
			<TELL
"Our best chance was to surprise the orcs, so " D ,FLANK-ACTOR " slipped away
to find a spot behind their lines. We waited a seeming eternity, and then,
with a heart-stopping scream, " D ,FLANK-ACTOR " charged at them; we held back
long enough to take the orcs entirely by surprise.">)
		       (<NOT <F&SET? ,ORC-FIGHT ,BUSY>>
			<TELL
"The fight was not going well, and " D ,FLANK-ACTOR " decided to try to flank
the orcs. But in the meantime, we were now fighting outnumbered, outclassed,
and badly hurt!">)>)
		(<AND <ACTION? COMBAT>
		      <FSET? ,ORC-FIGHT ,BUSY>>
		 <FCLEAR ,ORC-FIGHT ,BUSY>
		 <TELL
"With a heart-stopping scream, " D ,FLANK-ACTOR " charged the orcs from behind,
momentarily taking them by surprise.">)
		(<AND <ACTION? STRENGTH>
		      <FSET? ,ORC-FIGHT ,SEEN>>
		 <COND (<EQUAL? ,COMBAT-ROUND 0>
			<FSET ,ORC-FIGHT ,LIT>
			<COND (,DEBUG <TELL "[90/120]">)>
			<ADD-PARTY-OFFENSE 90>
			<ADD-PARTY-DEFENSE 120>)
		       (<OR <FSET? ,ORC-FIGHT ,LIT>
			    <NOT <FSET? ,ORC-FIGHT ,BUSY>>>
			<COND (,DEBUG <TELL "[60/80]">)>
			<ADD-PARTY-OFFENSE 60>
			<ADD-PARTY-DEFENSE 80>)>
		 <RFALSE>)>)>

<GLOBAL FLANK-ACTOR <>>
