"COMBAT for
		      		JOURNEY
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

;"Attack: offensive/defensive strength
  Status: relative strength
  Threshold: when retreat will occur"

<GLOBAL BANDITS-SPELL <>>

<OBJECT BANDITS-FIGHT
	(GRAPHIC G-BANDITS)
	(ACTION
	 <ACOND ()
		(SCENE-START
		 <TELL CR CR
"Not a minute after locating a campsite, we were suddenly attacked by a
small gang of bandits." CR CR>
		 <SETG COMBAT-ROUND -1>
		 ;"Run first round, since surprised"
		 <SURPRISE-COMBAT>)
		(SCENE-END
		 <COND (,BANDITS-SPELL
			<TELL CR CR
"It was about this time that Praxix was ready to cast his \""
D ,BANDITS-SPELL "\" spell. But looking around for the first time
since he had started, he came to the belated realization that it
was no longer necessary." CR CR>
			<COND (<IN-PARTY? ,ESHER>
			       <TELL
"\"Would we had a medal for valor,\" Esher said, patting Praxix
on the back and pouring on the sarcasm. \"I feel safer in battle just
knowing that you are with us.\"">)
			      (T
			       <TELL
"The battle was now over, and we would have to go on without the
services of our physician. Praxix performed a brief ceremony, after
which we lai our friend to rest under a tall sycamore tree, marking
the spot with a rock cairn.">)>
			<CLEAR-BUSY>)>
		 <GRAPHIC <GETP ,HERE ,P?GRAPHIC>>
		 <TELL CR CR
"It was now late, so we set up camp, and decided to take turns on guard
through the night. I dreamed that night that our group stood on a high
precipice, far above the clouds; storms surrounded us, and violent gusts
of wind nearly swept us off our feet and down into a dark abyss. And then,
the wind changed, and a gentle breeze blew, and we were carried off that
precipice, but were not afraid, and glided and soared into the ocean of
air." CR CR>
		 <TELL
"When morning came, misty and still, we packed silently and
prepared to move onward. But the dream stayed with me, and in later
days I would think of it often, sensing in it a foreshadowing of
things to come - but when, or in what manner, I could not know.">)
		(COMBAT-RESULT
		 <COND (<ZERO? ,COMBAT-ROUND>
			<COND (<EQUAL? ,FORK-BANDITS 1 2>
			       ;"Went into fight intentionally"
			       <TELL
"Having been warned of our danger, we reacted quickly and surely. I
had never been in battle before, but it was clear that Bergon
was our strongest fighter, wielding a heavy broadsword. Esher, surprisingly,
was also a good fighter, and he easily handled the sword thrusts of his
opponent. Praxix and I, however, were new to this sort of thing, and were
satisfied with merely staving off injury.">)
			      (T
			       ;"Caught off guard entirely"
			       <PARTY-REMOVE ,ESHER>
			       <TELL
"Caught completely at unawares, we watched in horror as Esher was felled
by a single blow of an attacker's club. The rest of our group, weapons
drawn, began to take the initiative and scored some deadly hits of our  
own.">)>)
		       (T
			<TELL
"The battle was ">
			<COND (<EQUAL? ,FORK-BANDITS 0>
			       <TELL "finally ">)>
			<TELL
"going well; Bergon">
			<COND (<EQUAL? ,FORK-BANDITS 1 2>
			       <TELL ", Esher,">)>
			<TELL " and Minar were making some deadly
hits with their weapons, and the bandits seemed weakened in their
resolve to fight, taking ever more to the defensive.">)>
		 <RTRUE>)
		(CAST
		 <SETG BANDITS-SPELL ,ACTION-OBJECT>
		 <TELL
"In the midst of the fighting, Praxix started preparing a spell
of some sort. It wasn't easy, though, and it appeared we would not
be seeing the spell's effects for some time.">
		 <MAKE-BUSY ,PRAXIX>
		 <NEW-DEFAULT>
		 <RTRUE>) 
		(<AND <ACTION? COMBAT>
		      <NOT <FSET? ,BANDITS-FIGHT ,SEEN>>
		      <NOT <IN-PARTY? ,MINAR>>
		      <EQUAL? ,COMBAT-ROUND 0>>
		 <FSET ,BANDITS-FIGHT ,SEEN>
		 <TELL
"As we prepared to continue the fight, it seemed that something was wrong
in the ranks of the bandits; one dropped dead in his tracks before we
had commenced." CR CR>
		 <PUTP ,BANDITS
		       ,P?STATUS
		       </ <* <GETP ,BANDITS ,P?STATUS> 3> 4>>
		 <RFALSE>)
		(FLANK
		 <TELL ACT
" tried to slip away to flank the bandits, but his movements were
watched, and therefore useless.">
		 <CHANGE-CIT ,BERGON 1 ,NUL-COMMAND>
		 <COND (<IN-PARTY? ,MINAR>
			<CHANGE-CIT ,MINAR 1 ,NUL-COMMAND>)>
		 <NEW-DEFAULT>)
		(<AND <ACTION? STRENGTH>
		      <FSET? ,BANDITS-FIGHT ,SEEN>>
		 ;"He's sniping from nearby.."
		 <ADD-PARTY-OFFENSE 40>
		 <ADD-PARTY-DEFENSE 10>
		 <RFALSE>)
		(ACCEPT
		 <TELL D ,LEADER
", still troubled, agreed. ">
		 <COND (<FSET? ,MINAR ,SEEN>
			<TELL "\"It seems we cannot be rid of you,
so you might as well join us.\" ">)>
		 <TELL "Praxix appeared uneasy with
Bergon's decision, but, as for me, I was happy to take any help
we were offered.">
		 <TRAVEL-COMMANDS ,ESHER ,EXAMINE-COMMAND>
		 <END-OPTION>
		 <END-COMBAT <>>
		 <PARTY-ADD ,MINAR>
		 <RTRUE>)
		(RETREAT
		 <REMOVE-PARTY-COMMAND ,RETREAT-COMMAND>
		 <TELL
"Bergon was about to call on us to retreat, when he realized that we
were badly defeating these bandits.">)
		(PARLEY
		 <REMOVE-PARTY-COMMAND ,PARLEY-COMMAND>
		 <TELL
"Hoping to avoid a bloody battle, we attempted to parley with the bandits,
but they declined with words hardly fit to print.">)
		(GET-ADVICE:REMOVE
		 <TELL
"The group, grateful for Minar's help, was quiet, yet none came out against
taking in this inscrutable stranger.">
		 <OPTION ,LEADER ,ACCEPT-COMMAND ,DECLINE-COMMAND>)
		(DECLINE
		 <TELL D ,LEADER
" was firm. \"We are thankful for your help, but we must ">
		 <COND (<FSET? ,MINAR ,SEEN> <TELL "again ">)>
		 <TELL
"refuse your offer. Good luck be with you!\" And, ">
		 <COND (<FSET? ,MINAR ,SEEN> <TELL "as before">)
		       (T <TELL "without further ado">)>
		 <TELL
", Minar left, disappearing into the shadows.">
		 <HINT ,HINT-MINAR>
		 <END-OPTION>
		 <END-COMBAT <>>
		 <RTRUE>)>)>

<OBJECT BANDITS
	(SDESC "bandits")
	(KBD %<ASCII !\B>)
	(ATTACK 120 60)
	(STATUS 100)
	(RETREAT 60)
	(SPECIAL-ACTION
	 <EXECUTE ()
		  <TELL CR
"The bandits, finding the fight more than they had bargained for,
retreated out of sight.">
		  <COND (<FSET? ,BANDITS-FIGHT ,SEEN>
			 <TELL " A moment later, ">
			 <COND (<FSET? ,MINAR ,SEEN>
				<TELL "Minar">)
			       (T
				<TELL
				 "the man we had seen entering the tavern">)>
			 <TELL " appeared, bow in
hand. \"I thought you might be needing some help,\" he said, grinning." CR CR>
			 <COND (<FSET? ,MINAR ,SEEN>
				<TELL
"\"My previous offer stands, and this time I would advise you to
accept it.\" He stood there, grinning all the time, waiting for our
answer.">)
			       (T
				<TELL ,MINAR-INTRO>)>
			 <OPTION ,LEADER
				 ,ACCEPT-COMMAND
				 ,DECLINE-COMMAND
				 ,GET-ADVICE-COMMAND>)
			(T
			 <END-COMBAT <>>)>
		  <RTRUE>>)>

<OBJECT DWARVES
	(SDESC "Dwarves")
	(KBD %<ASCII !\D>)
	(ATTACK 200 200)
	(STATUS 100)
	(RETREAT 0)>

<OBJECT ORCS
	(LOC ORC-ANTE)
	(FLAGS DONT-TAKE)
	(SDESC "orcs")
	(KBD %<ASCII !\O>)
	(ATTACK 170 80)
	(STATUS 100)
	(RETREAT 40)
	(SPECIAL-ACTION
	 <EXECUTE ()
		  <TELL CR
"The orcs, nearly overwhelmed, tried to withdraw, but we killed them all save
two who ran from the area, with Hurth in hot pursuit. We freed ">
		  <COND (,KIDNAPPED
			 <TELL D ,KIDNAPPED>
			 <PARTY-CHANGE ,HURTH ,KIDNAPPED>)
			(T
			 <PARTY-REMOVE ,HURTH>
			 <TELL "the Dwarf">)>
		  <TELL " from
his bonds, and he told us how he was caught at unawares by the orcs who,
having easily subdued him, brought him here." CR CR>
		  <TELL
"As we stood, tending to our wounds, a low, rumbling scream issued forth
from the passage used by the surviving orcs. We rushed down the passage
and found Hurth, slumped against the cold stone, bleeding from his
chest and head, surrounded by the bodies of the orcs who had waited
in ambush." CR CR>
		  <COND (<IN-PARTY? ,ESHER>
			 <TELL
"Esher rushed to help, but finding Hurth's wounds beyond his talents,
he turned away dejectedly. ">)>
		  <TELL "Soon, from down the cavern, we heard the
sounds of running feet; we reached for our weapons, but
were soon in the presence of Agrith and his party." CR CR>
		  <TELL
"\"The story here speaks for itself,\" he said gravely, and knelt
beside the broken body of Hurth, raising that proud head into his
arms. And then, as impossible as it sounds, the two Dwarves seemed to
speak. For a long moment, Agrith was silent, then he rose from the ground
and motioned to his men, who carried the lifeless body away." CR CR>
		  <COND (<FSET? ,DWARF-MEETING ,TRAPPED>
			 ;"Lied..."
			 <HINT ,HINT-DWARF-LIE>
			 <TELL
"\"You are free to wander these halls,\" he said, \"but I must return
to my people and prepare for the onslaught that is to come.\"">)
			(T
			 <MOVE ,DWARF-STONE ,INVENTORY>
			 <TELL
"\"We have suffered enough in Azhur na-Brem. Tell Astrix this when
you see him, and show him this token. He will know what to do.\"
Agrith took a brown stone amulet from around his neck, and gave it
to Praxix. \"I must leave you now. May the earth
give you speed.\"">)>
		  <TELL " He strode away, and we never saw him again.">
		  <REMOVE-TRAVEL-COMMAND ,OUTSIDE-PRISON ,ENTER-COMMAND>
		  <REMOVE ,PRISON-RUNES>
		  <MOVE-TO ,ORC-VESTIBULE>
		  <SCENE <>>
		  <RTRUE>>)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL ACT
" counted nine orcs, each carrying brutal weapons. We were clearly
outnumbered, though we had the element of surprise.">)>)>

<OBJECT DWARF-STONE
	(SDESC "brown amulet")
	(KBD %<ASCII !\B>)
	(FLAGS DONT-DROP)
	(STONE-NAME "Dwarf Stone")
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <TELL
"The amulet was a golden brown stone that had been set in another,
darker stone, and hung at the end of a chain of gold.">)>)>

<OBJECT NYMPH-STONE
	(SDESC "blue amulet")
	(KBD %<ASCII !\B>)
	(FLAGS DONT-DROP)
	(STONE-NAME "Nymph Stone")
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <COND (<EQUAL? ,ACTOR ,TAG> <TELL "I">)
		       (T
			<TELL ACT>)>
		 <TELL
" took a moment to admire the amulet that Li'ura had given me on behalf
of the Nymphs. In its center was a deep blue stone, whose color was like
that of the great oceans, and set in gold around the stone were many
small diamonds.">)>)>

<OBJECT ELF-STONE
	(SDESC "green amulet")
	(KBD %<ASCII !\G>)
	(FLAGS DONT-DROP)
	(STONE-NAME "Elf Stone")
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <TELL
"The stone in the amulet that N'dar had given us was a rich green, like that
of the forest itself, and hung on a single strand of some vine-like material
that was unfamiliar to me; certainly, no such thing grew back
in the plains.">)>)>

<GLOBAL OPPONENT BANDITS>

<CONSTANT COMBAT-COS 0>
<CONSTANT COMBAT-CDS 1>

<CONSTANT NUL-COMBAT-TBL <TABLE 100>>

<GLOBAL COMBAT-DAMAGE <LTABLE 0 0 0 0 0 0 0 0 0 0 0>>

<GLOBAL COMBAT-ROUND -1>

<ROUTINE STRENGTH (CHR TBL OFF)
	 </ <* <GETB .TBL .OFF> <GETP .CHR ,P?STATUS>> 100>>

<ROUTINE END-COMBAT ("OPTIONAL" (DAMAGE T))
	 <COND (.DAMAGE
		<TELL CR CR>
		<DAMAGE-REPORT>)>
	 <SCENE <>>
	 <MODE ,TRAVEL-MODE>
	 <SETG UPDATE-FLAG T>>

<COMMAND STRENGTH>

<COMMAND CLIMB>
<COMMAND DESCEND>
<COMMAND DOWN>
<COMMAND UP>

<ROUTINE SURPRISE-COMBAT ()
	 <V-COMBAT>> 

<COMMAND COMBAT <> ("AUX" (OFF 0) CMD CHR (TOS 0) (TDS 0) OOS ODS TBL)
	 <SETG COMBAT-ROUND <+ ,COMBAT-ROUND 1>>
	 <SET TBL <GETPT ,OPPONENT ,P?ATTACK>>
	 <SET OOS <STRENGTH ,OPPONENT .TBL ,COMBAT-COS>>
	 <SET ODS <STRENGTH ,OPPONENT .TBL ,COMBAT-CDS>>
	 ;"Calculate total offensive/defensive strength"
	 <SET OFF 0>
	 <REPEAT ()
		 <COND (<G? <SET OFF <+ .OFF 1>> ,PARTY-MAX>
			<RETURN>)
		       (T
			<SET CHR <GET ,PARTY .OFF>>
			<SET TBL <GETPT .CHR ,P?ATTACK>>
			<SET TOS <+ .TOS <STRENGTH .CHR .TBL ,COMBAT-COS>>>
			<SET TDS <+ .TDS <STRENGTH .CHR .TBL ,COMBAT-CDS>>>)>>
	 <PUT ,COMBAT-STRENGTHS ,CS-PARTY-OFFENSE .TOS>
	 <PUT ,COMBAT-STRENGTHS ,CS-PARTY-DEFENSE .TDS>
	 <PUT ,COMBAT-STRENGTHS ,CS-OPPONENT-OFFENSE .OOS>
	 <PUT ,COMBAT-STRENGTHS ,CS-OPPONENT-DEFENSE .ODS>
	 <SCENE-ACTION ,STRENGTH-COMMAND>
	 <DESCRIBE-COMBAT>
	 <RTRUE>>

<COMMAND COMBAT-RESULT>

<ROUTINE SCENE-ACTION (CMD)
	 <SETG ACTION .CMD>
	 <APPLY <GETP ,SCENE-OBJECT ,P?ACTION>>>

<GLOBAL COMBAT-STRENGTHS <TABLE 0 0 0 0>>

<CONSTANT CS-PARTY-OFFENSE 0>
<CONSTANT CS-PARTY-DEFENSE 1>
<CONSTANT CS-OPPONENT-OFFENSE 2>
<CONSTANT CS-OPPONENT-DEFENSE 3>

<ROUTINE ADD-PARTY-DEFENSE (NUM)
	 <PUT ,COMBAT-STRENGTHS
	      ,CS-PARTY-DEFENSE
	      <+ <GET ,COMBAT-STRENGTHS ,CS-PARTY-DEFENSE> .NUM>>>

<ROUTINE ADD-PARTY-OFFENSE (NUM)
	 <PUT ,COMBAT-STRENGTHS
	      ,CS-PARTY-OFFENSE
	      <+ <GET ,COMBAT-STRENGTHS ,CS-PARTY-OFFENSE> .NUM>>>

<CONSTANT COMBAT-RESULT-TBL
	  <TABLE "no" "trivial" "minor" "significant" "major" "grave">>

<ROUTINE COMBAT-RESULT (OS DS)
	 <MIN </ </ <* .OS 10> .DS> 4> 5>>

<ROUTINE MIN (M N)
	 <COND (<G? .N .M> .M) (T .N)>>

<ROUTINE DESCRIBE-COMBAT ("AUX" NOTELL? TOS TDS OOS ODS ORES DRES TMP)
	 <SET TOS <GET ,COMBAT-STRENGTHS ,CS-PARTY-OFFENSE>>
	 <SET TDS <GET ,COMBAT-STRENGTHS ,CS-PARTY-DEFENSE>>
	 <SET OOS <GET ,COMBAT-STRENGTHS ,CS-OPPONENT-OFFENSE>>
	 <SET ODS <GET ,COMBAT-STRENGTHS ,CS-OPPONENT-DEFENSE>>
	 <COND (,DEBUG
		<TELL "Off: " N .TOS "/" N .ODS>
		<TELL "  Def: " N .TDS "/" N .OOS>)>
	 <SETG OFFENSIVE-RESULT <COMBAT-RESULT .TOS .ODS>>
	 <SETG DEFENSIVE-RESULT <COMBAT-RESULT .OOS .TDS>>
	 <SET NOTELL? <SCENE-ACTION ,COMBAT-RESULT-COMMAND>>
	 <COND (<NOT .NOTELL?>
		<COND (<ZERO? ,COMBAT-ROUND>
		       <TELL "Our party initially took an aggressive"
			     " stance against the " D ,OPPONENT
			     ", who themselves were in "
			     <GET ,AGGRESSION-TBL <MIN </ </ <* .OOS 10>
							     .ODS> 4> 8>>
			     " posture.">)
		      (T
		       <TELL "We maintained our stance, as did the "
			     D ,OPPONENT ".">)>
		<TELL " The fighting was fierce, with ">
		<COND (<ZERO? <+ ,OFFENSIVE-RESULT ,DEFENSIVE-RESULT>>
		       <TELL "neither side hurt in the slightest">)
		      (<EQUAL? ,OFFENSIVE-RESULT ,DEFENSIVE-RESULT>
		       <TELL "both sides suffering "
			     <GET ,COMBAT-RESULT-TBL ,OFFENSIVE-RESULT>
			     " injuries in what was, at best, a stand-off">)
		      (<G? ,OFFENSIVE-RESULT ,DEFENSIVE-RESULT>
		       <TELL "the " D ,OPPONENT " ">
		       <COND (<G? ,DEFENSIVE-RESULT 3>
			      <TELL
"getting the worse beating, though we ourselves were bloodied considerably">)
			     (<G? ,OFFENSIVE-RESULT 3>
			      <TELL
"taking a beating at our hands, while we escaped with minor injury">)
			     (T
			      <TELL
"and ourselves each scoring a few hits, though it seemed that we had
the upper hand">)>)
		      (T
		       <TELL "our party ">
		       <COND (<G? ,OFFENSIVE-RESULT 3>
			      <TELL
"suffering major injury; I suppose it was some consolation that we did a
good deal of damage ourselves">)
			     (<G? ,DEFENSIVE-RESULT 3>
			      <TELL
"taking some major hits, and giving not as many back">)
			     (T
			      <TELL
"faring a bit worse than our opponent, though neither side had clearly
gained the upper hand">)>)>
		<TELL ".">)>
	 <COND (<G? ,DEFENSIVE-RESULT 0>
		<DAMAGE-PARTY ,DEFENSIVE-RESULT .NOTELL?>)>
	 <COND (<G? ,OFFENSIVE-RESULT 0>
		<DAMAGE-OPPONENT ,OFFENSIVE-RESULT .NOTELL?>)>
	 <RTRUE>> 
	 
<CONSTANT D-MAJOR 60>
<CONSTANT D-MODERATE 80>
<CONSTANT D-MINOR 90>

<GLOBAL OFFENSIVE-RESULT 0>
<GLOBAL DEFENSIVE-RESULT 0>

<CONSTANT DAMAGE-TBL
	  <LTABLE <LTABLE D-MINOR>
		  <LTABLE D-MINOR D-MINOR>
		  <LTABLE D-MODERATE D-MINOR D-MINOR>
		  <LTABLE D-MODERATE D-MODERATE D-MINOR D-MINOR>
		  <LTABLE D-MAJOR D-MODERATE D-MODERATE D-MINOR>>>  

<CONSTANT OPPONENT-DAMAGE-TBL
	  <LTABLE 95 90 80 75 70>>

<ROUTINE DAMAGE-OPPONENT (ORES NOTELL? "AUX" NST TT)
	 <PUTP ,OPPONENT
	       ,P?STATUS
	       <SET NST </ <* <GETP ,OPPONENT ,P?STATUS>
			      <GET ,OPPONENT-DAMAGE-TBL .ORES>>
			   100>>>
	 <COND (<L? .NST <GETP ,OPPONENT ,P?RETREAT>>
		<TELL CR>
		<COND (<APPLY <GETP ,OPPONENT ,P?SPECIAL-ACTION>>)
		      (T
		       <TELL CR
"The " D ,OPPONENT ", badly hurt, retreated out of sight. We had
won the battle!">
		       <END-COMBAT>)>)>>

<ROUTINE DAMAGE-PARTY (DRES NOTELL? "AUX" (OFF 0) (DOFF 1) DTBL DMAX)
	 ;"Get your sitting ducks in a row"
	 <DAMAGE-ORDER>
	 ;"Go through table, assigning damage."
	 <SET DTBL <GET ,DAMAGE-TBL .DRES>>
	 <SET DMAX <GET .DTBL 0>>
	 <REPEAT ()
		 <COND (<OR <G? .DOFF .DMAX>
			    <G? .DOFF ,PARTY-MAX>> <RETURN>)
		       (T
			<DAMAGE-CHARACTER <GET ,COMBAT-DAMAGE .OFF>
					  <GET .DTBL .DOFF>>
			<SET OFF <+ .OFF 2>>
			<SET DOFF <+ .DOFF 1>>)>>
	 <SET DOFF 0>
	 <SET OFF 100>
	 <SET DMAX 0>
	 <REPEAT ()
		 <COND (<G? <SET DOFF <+ .DOFF 1>> ,PARTY-MAX>
			<RETURN>)
		       (<L? <SET DTBL <GETP <GET ,PARTY .DOFF> ,P?STATUS>>
			    .OFF>
			<SET DMAX .DOFF>
			<SET OFF .DTBL>)>>
	 <COND (.NOTELL? T)
	       (<L? <SET DOFF <PARTY-STATUS>> 60>
		<TELL CR CR
"Our party was badly wounded, though still able to fight. \"Let's
get out of here,\" I cried, \"before we're killed!\"">)
	       ;(<L? .OFF 50>
		<TELL CR CR D <GET ,PARTY .DMAX>>
		<TELL " was faring the least well of our party,
being ">
		<TELL <DAMAGE-STATUS <GET ,PARTY .DMAX>>>
		<TELL ".">)>>

<ROUTINE DAMAGE-STATUS (CHR)
	 <GET ,DAMAGE-STATUS-TBL </ <GETP .CHR ,P?STATUS> 20>>>

<CONSTANT DAMAGE-STATUS-TBL
	  <TABLE "critically wounded" "severely wounded" "badly wounded"
		 "wounded, but strong" "slightly wounded" "unscathed">>

<ROUTINE DAMAGE-REPORT ("AUX" (OFF 0) CHR)
	 <TELL
"The battle concluded, we took a moment to check on our condition. It
appeared that ">
	 <REPEAT ()
		 <COND (<G? <SET OFF <+ .OFF 1>> ,PARTY-MAX>
			<TELL ".">
			<RETURN>)
		       (T
			<SET CHR <GET ,PARTY .OFF>>
			<COND (<EQUAL? .CHR ,TAG>
			       <TELL "I">)
			      (T
			       <TELL D .CHR>)>
			<TELL " was ">
			<TELL <DAMAGE-STATUS .CHR>>
			<COND (<EQUAL? .OFF <- ,PARTY-MAX 1>>
			       <TELL ", and ">)
			      (<NOT <EQUAL? .OFF ,PARTY-MAX>>
			       <TELL ", ">)>)>>>

<ROUTINE DAMAGE-CHARACTER (CHR TYP "AUX" NST)
	 <PUTP .CHR
	       ,P?STATUS
	       <SET NST </ <* .TYP <GETP .CHR ,P?STATUS>> 100>>>
	 <COND (,DEBUG
		<TELL CR "Damage to " D .CHR ", status:" N .NST>)>>

<ROUTINE PARTY-STATUS ("AUX" (CNT 0) (SUM 0))
	 <REPEAT ()
		 <COND (<G? <SET CNT <+ .CNT 1>> ,PARTY-MAX>
			<RETURN>)
		       (T
			<SET SUM
			     <+ .SUM <GETP <GET ,PARTY .CNT> ,P?STATUS>>>)>>
	 </ .SUM ,PARTY-MAX>>

<ROUTINE DAMAGE-ORDER ("AUX" (POFF 0) (DOFF 0) CHR TBL TMP)
	 ;"Set up table initially"
	 <REPEAT ()
		 <COND (<G? <SET POFF <+ .POFF 1>> ,PARTY-MAX>
			<RETURN>)
		       (T
			<PUT ,COMBAT-DAMAGE
			     .DOFF
			     <SET CHR <GET ,PARTY .POFF>>>
			<SET TBL <GETPT .CHR ,P?ATTACK>>
			<PUT ,COMBAT-DAMAGE
			     <+ .DOFF 1>
			     <STRENGTH .CHR .TBL ,COMBAT-CDS>>
			<SET DOFF <+ .DOFF 2>>)>>
	 ;"Sort so that weakest character comes first"
	 <PAIR-SORT ,COMBAT-DAMAGE <* ,PARTY-MAX 2>>>

<ROUTINE PAIR-SORT (TBL MAX "AUX" (OFF 0) T1 T2 TT (FLG <>))
	 ;"Simple bubble sort"
	 <REPEAT ()
		 <COND (<G? <+ .OFF 3> .MAX>
			<COND (<NOT .FLG> <RTRUE>)
			      (T
			       <SET OFF 0>
			       <SET FLG <>>)>)>
		 <COND (<G? <GET .TBL <+ .OFF 1>>
			    <GET .TBL <+ .OFF 3>>>
			<SET FLG T>
			<SET TT <REST .TBL <* .OFF 2>>>
			<SET T1 <GET .TT 0>>
			<SET T2 <GET .TT 1>>
			<PUT .TT 0 <GET .TT 2>>
			<PUT .TT 1 <GET .TT 3>>
			<PUT .TT 2 .T1>
			<PUT .TT 3 .T2>)>
		 <SET OFF <+ .OFF 2>>>>

<CONSTANT AGGRESSION-TBL
	  <TABLE "a decidedly defensive" "a defensive" "a somewhat defensive"
		 "a balanced" "an aggressive" "an agressive"
		 "a boldly aggressive" "an all-out aggressive"
		 "an almost suicidally aggressive">>

<CONSTANT CARNAGE-TBL
	  <TABLE "extremely subdued" "extremely subdued"
		 "very subdued" "very subdued"
		 "quite even" "quite even"
		 "quite fierce" "fierce"
		 "fierce" "extremely fierce and damaging"
		 "debilitating to both sides">>
		
;"To Do:

*1) Damage to parties
*2) Description of damage
*3) How quickly opponent will retreat/scatter (i.e. at what strength)
 4) Retreating; what happens?
 5) Parlay, etc.
 6) # of opponents (multiply, etc.)
"