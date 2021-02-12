"COMMANDS for
		      		JOURNEY
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<DEFINE COMMAND (NAM "ARGS" LST "AUX" OBJ ACT CSPN SPN (SPF <>))
	;"**"
	<COND (<TYPE? .NAM LIST>
	       <SET CSPN <SPNAME <1 .NAM>>>
	       <SET NAM <1 .NAM>>)
	      (T
	       <SET CSPN <SPNAME .NAM>>)>
	<SET SPN <SPNAME .NAM>> 
	<COND (<EMPTY? .LST>
	       <SET OBJ 0>
	       <SET ACT V-NUL>)
	      (T
	       <SET OBJ <EVAL <1 .LST>>>
	       <COND (<EMPTY? <SET LST <REST .LST>>>
		      <SET ACT V-NUL>)
		     (<TYPE? <1 .LST> ATOM>
		      <SET ACT <1 .LST>>)
		     (T
		      <EVAL <FORM ROUTINE
				  <SET ACT <PARSE <STRING "V-" .CSPN>>>
				  !.LST>>)>)>
	<EVAL <FORM CONSTANT
		    <PARSE <STRING .CSPN "-COMMAND">>
		    <PTABLE <MAPR ,STRING
				  <FUNCTION (STR "AUX" (CHR <1 .STR>))
				       <COND (<=? .STR "NUL">
					      <MAPLEAVE " ">)
					     (<=? .STR "CANCEL">
					      <MAPLEAVE "[cancel]">)
					     (<=? .STR "GONE">
					      <MAPLEAVE "[gone]">)
					     (<=? .STR "BUSY">
					      <MAPLEAVE "[busy]">)
					     (<=? .STR "ILL">
					      <MAPLEAVE "[wounded]">)
					     (<OR .SPF <==? .STR .SPN>>
					      <SET SPF <>>
					      .CHR)
					     (<==? .CHR !\->
					      <SET SPF T>
					      <ASCII 32>)
					     (T
					      <ASCII <+ <ASCII .CHR>
							32>>)>>
				  .SPN>
			    <MAPR ,STRING
				  <FUNCTION (STR "AUX" (CHR <1 .STR>))
				       <COND (<=? .STR "NUL">
					      <MAPLEAVE " ">)
					     (<==? .CHR !\->
					      <ASCII 32>)
					     (T
					      <ASCII <+ <ASCII .CHR> 32>>)>>
				  .SPN>
			    .ACT
			    .OBJ
			    <COND (<=? .SPN "CANCEL">
				   8)
				  (T
				   <1 .SPN> ;"For KBD input")>>>>>

<SETG TEMP-COMMAND ,COMMAND>

<CONSTANT COMMAND-FULL 0>
<CONSTANT COMMAND-STR 1>
<CONSTANT COMMAND-ACTION 2>
<CONSTANT COMMAND-OBJECT 3>
<CONSTANT COMMAND-CHR 4>

<COMMAND BERGON-ROUTE>
<COMMAND PRAXIX-ROUTE>
<COMMAND TAG-ROUTE>
<COMMAND ELF-HOME>

<COMMAND FIGHT>

<COMMAND ACCEPT>
<COMMAND DECLINE>
<COMMAND GET-ADVICE <> ()
	 <TELL D ,LEADER
	       " asked the group for advice, but none was offered.">>

<COMMAND LEFT>
<COMMAND RIGHT>

<COMMAND ASK>

<COMMAND ATTACK>

<COMMAND BACK>

<COMMAND HELP <> ()
	 <TELL
"Journey is an interactive story in which you guide a party of
characters through a dangerous quest. To learn about the background of
your quest, select BACKGROUND after reading this material." CR CR>
	 <TELL
"There are two types of commands that you can give; those which are
performed for the entire party (e.g. moving from place to place, retreating
after a losing battle) and those which are performed by an individual
character (e.g. examining an object, casting a spell, mingling in a
tavern.)  Party Commands are the leftmost column of commands on
the screen; the next column lists the characters in your party;
and the three following columns are for the Individual Commands." CR CR>
	 <TELL
"To select a command of either type, simply use the arrow-keys on your
keyboard to reposition the highlighted
command on the screen (the \"cursor\") until that cursor rests on the
command you desire; then hit RETURN. Alternatively, if you are using
a mouse, move it such that the arrow on the screen is pointing to that
command; then click your mouse button." CR CR>
	 <TELL
"If you are using the keyboard, use the spacebar as a shortcut
to move between the Party Commands and the Individual Commands. Also,
typing the first letter of a command or object name will select that
command or object." CR CR>
	 <TELL "Have fun!">
	 <NEW-DEFAULT 2 -1>>

<COMMAND BACKGROUND>

<COMMAND BUSY>

<COMMAND ILL>

<COMMAND GONE>

<COMMAND BUY O-TAKE ()
	 <TELL "We bought the " AO " and packed it away.">
	 <FSET ,ACTION-OBJECT ,DONT-EXAMINE>
	 <UPDATE-MOVE ,ACTION-OBJECT ,INVENTORY>
	 <RTRUE>>

<COMMAND CAST O-CAST () <RFALSE>>

<ROUTINE O-CAST ()
	 <COND (<EQUAL? ,ACTOR ,TAG>
		<PUT ,O-TABLE 0 1>
		<PUT ,O-TABLE 1 ,TAG-POWDERS>
		<RTRUE>)>
	 <FIND-OBJECTS ,ALWAYS-SPELLS>
	 <COND (<FSET? ,HERE ,UNDERGROUND>
		<FIND-OBJECTS ,UNDERGROUND-SPELLS>)
	       (T
		<FIND-OBJECTS ,ABOVEGROUND-SPELLS>)>>

<COMMAND FEEL-AROUND>

<COMMAND DEFEND>

<COMMAND DROP O-DROP ()
	 <COND (<FSET? ,ACTION-OBJECT ,DONT-DROP>
		<REMOVE ,HYE-DROP>
		<FOOL-DROP>)
	       (T
		<UPDATE-MOVE ,ACTION-OBJECT ,HERE>
		<TELL
"Having no more need for the " AO ", we discarded it.">)>
	 <UPDATE-FSET ,HERE ,DONT-DROP>>

<ROUTINE O-DROP ()
	 <FIND-OBJECTS ,INVENTORY ;,NEVER-DROP>>

<COMMAND ENTER>

<COMMAND EXAMINE O-EXAMINE ()
	 <COND (<GETPT ,ACTION-OBJECT ,P?EXBITS>
		<CLEAR-EXBIT ,ACTION-OBJECT ,ACTOR>)
	       (T
		<FSET ,ACTION-OBJECT ,DONT-EXAMINE>)>
	 <TELL ACT " examined the " AO ", but found nothing of interest.">>

<ROUTINE CLEAR-EXBIT (OBJ CHR)
	 <SETG UPDATE-FLAG T>
	 <PUTP .OBJ
	       ,P?EXBITS
	       <BAND <GETP .OBJ ,P?EXBITS>
		     <BCOM <GETP .CHR ,P?CBIT>>>>>

<ROUTINE FIND-EXAMINE (OBJ "AUX" F CNT)
	 <SET F <FIRST? .OBJ>>
	 <REPEAT ()
		 <COND (<OR <NOT .F>
			    <EQUAL? .CNT 9>>
			<RETURN>)
		       (<AND <NOT <FSET? .F ,DONT-EXAMINE>>
			     <OR <NOT <GETPT .F ,P?EXBITS>>
				 <BTST <GETP .F ,P?EXBITS>
				       <GETP ,ACTOR ,P?CBIT>>>>
			<SET CNT <+ <GET ,O-TABLE 0> 1>>
			<PUT ,O-TABLE .CNT .F>
			<PUT ,O-TABLE 0 .CNT>)>
		 <SET F <NEXT? .F>>>>

<ROUTINE O-EXAMINE ()
	 <FIND-EXAMINE ,HERE>
	 <COND (<OR <NOT ,SUBGROUP-MODE>
		    <FSET? ,TAG ,SUBGROUP>>
		<FIND-EXAMINE ,INVENTORY>)>
	 <RTRUE>>

<COMMAND EXIT>

<COMMAND TELL-STORY O-TELL-LEGEND ()
	 <TELL-TALE ,ACTION-OBJECT>
	 <RTRUE>>

<COMMAND TELL-LEGEND O-TELL-LEGEND ()
	 <TELL-TALE ,ACTION-OBJECT>
	 <RTRUE>>

<ROUTINE O-TELL-LEGEND ()
	 <COND (<OR <FSET? ,HERE ,DANGEROUS>
		    <FSET? ,SCENE-OBJECT ,DANGEROUS>>
		<RTRUE>)
	       (<EQUAL? ,ACTOR ,PRAXIX>
		<FIND-OBJECTS ,PRAXIX-TALES>)
	       (<EQUAL? ,ACTOR ,HURTH>
		<FIND-OBJECTS ,HURTH-STORIES>)
	       (<EQUAL? ,ACTOR ,UMBER>
		<FIND-OBJECTS ,UMBER-STORIES>)>>

<COMMAND TELL-TRUTH>
<COMMAND LIE>

<COMMAND (FOLLOW-STREAM STREAM)>
<COMMAND APPROACH>
<COMMAND STAY-HIDDEN>
<COMMAND FOLLOW>

<COMMAND SCENE-START>
<COMMAND SCENE-END>

<COMMAND LOOK-AROUND>
<COMMAND GET-HELP>
<COMMAND RETURN>

;<ROUTINE MAPP (FCN "OPTIONAL" ARG "AUX" (CNT 0))
	 <REPEAT ()
		 <COND (<G? <SET CNT <+ .CNT 1>> ,PARTY-MAX>
			<RTRUE>)
		       (<ASSIGNED? ARG>
			<APPLY .FCN <GET ,PARTY .CNT> .ARG>)
		       (T
			<APPLY .FCN <GET ,PARTY .CNT>>)>>>

<COMMAND IGNORE>

<COMMAND INVENTORY <> ("AUX" F)
	 <TELL "I checked our provisions at that point and found,
in addition to the basic necessities of food and shelter, ">
	 <COND (<NOT <LIST-CONTENTS ,INVENTORY>>
		<TELL "nothing">)>
	 <UPDATE-FSET ,HERE ,INVENTORIED>
	 <TELL ".">>

<ROUTINE LIST-CONTENTS (OBJ "AUX" (F <FIRST? .OBJ>) N)
	 <COND (<NOT .F> <RFALSE>)>
	 <REPEAT ()
		 <COND (<NOT .F> <RETURN>)
		       (T
			<TELL "a " D .F>
			<COND (<SET F <NEXT? .F>>
			       <TELL ", ">
			       <COND (<NOT <NEXT? .F>> <TELL "and ">)>)>)>>> 

<COMMAND LIFT>

<COMMAND MOVE>

<COMMAND NUL <> () <RFALSE>>

<COMMAND PARLEY>

<COMMAND PARRY>

<COMMAND PERSUADE>

<COMMAND PROCEED>

<COMMAND REPLY>

<COMMAND RETREAT <> ()
	 <END-COMBAT>
	 <TELL "We retreated out of range of attack.">>

<COMMAND SCOUT <> ()
	 <UPDATE-FSET ,HERE ,DONT-SCOUT>
	 <TELL ACT
" scouted out the area, but found nothing new of interest.">>

<COMMAND FLANK>

<COMMAND SELL O-SELL ()
	 <TELL
"[Not implemented.]">>

<ROUTINE O-SELL ()
	 <COND (<EQUAL? ,HERE ,LANDS-END-TAVERN> <RTRUE>)
	       (T
		<O-DROP>)>>

<COMMAND SURRENDER>

<COMMAND PICK-UP O-TAKE ()
	 <FSET ,ACTION-OBJECT ,DONT-EXAMINE>
	 <UPDATE-MOVE ,ACTION-OBJECT ,INVENTORY>
	 <TELL "We decided to take the " AO ", so I put it in my pack for
safekeeping.">>

<ROUTINE O-TAKE ()
	 <FIND-OBJECTS ,HERE ,DONT-TAKE>>

<COMMAND TELL>

<COMMAND SPLIT-UP>

<COMMAND COMB-AREA>

<COMMAND START>

<COMMAND STAND>

<COMMAND UPSTREAM>
<COMMAND DOWNSTREAM>
<COMMAND SWIM>

<COMMAND BUILD-RAFT <> ()
	 <FSET ,RAFT ,SEEN>
	 <APPLY <GETP ,HERE ,P?ENTER>>
	 <TELL "There was ">
	 <COND (<FSET? ,RAFT ,TRAPPED>
		<TELL "still ">)>
	 <TELL
"no suitable way of crossing the river on foot, so we determined to
build a raft. The early part of the afternoon was spent gathering large
branches, and it was then a simple matter to bind them together with some of
the rope we had been carrying. We then carved ourselves oars, and were
soon ready to give the river crossing a">
	 <COND (<F&SET? ,RAFT ,TRAPPED> <TELL "nother">)>
	 <TELL " try.">>
	 
<COMMAND LAUNCH-RAFT <> ()
	 <TELL
"\"This would seem as good a spot as any,\" ">
	 <COND (<IN-PARTY? ,BERGON> <TELL "Bergon">)
	       (T 
		<TELL "Praxix">)>
	 <TELL " said, indicating the
spot where we would launch the raft." CR CR>
	 <TELL
"This met with general approval, and, having boarded the raft, we used our
crude oars to push ourselves out into the current.">
	 <PUTP ,IN-RIVER ,P?TEMP <GET-TEMP>>
	 <MOVE-TO ,IN-RIVER>>

<COMMAND CROSS>
<COMMAND CENTER>

<COMMAND SAVE <> ("OPTIONAL" (CAN? T) "AUX" SV)
	 <COND (<EQUAL? <SET SV <SAVE>> 1>
	        <TELL "[Ok.]">)
	       (<EQUAL? .SV 2>
		<TELL "[Ok.]">)
	       (T
		<TELL "[Failed.]">)>
	 <REFRESH-CHECK>
	 <COND (.CAN? <V-CANCEL T>)>
	 <RTRUE>>

<COMMAND RESTORE <> ("OPTIONAL" (CAN? T))
	 <COND (<RESTORE>
	        <TELL "[Ok.]">)
	       (T
		<TELL "[Failed.]">)>
	 <REFRESH-CHECK>
	 <COND (.CAN? <V-CANCEL T>)>
	 <RTRUE>>

<GLOBAL SAVED-GAME-ROOM <>>

<GLOBAL GAME-MODE <>>

<GLOBAL SAVED-GAME-MODE <>>

<GLOBAL SAVED-PARTY-COMMANDS <LTABLE 0 0 0 0 0 0>>

<ROUTINE SAVE-PARTY-COMMANDS ()
	 <COPYT ,PARTY-COMMANDS ,SAVED-PARTY-COMMANDS 12>>

<ROUTINE RESTORE-PARTY-COMMANDS ()
	 <COPYT ,SAVED-PARTY-COMMANDS ,PARTY-COMMANDS 12>
	 <PRINT-COLUMNS T>>

<COMMAND GAME <> ("AUX" T)
	 <SETG GAME-MODE T>
	 <SETG SAVED-GAME-ROOM ,HERE>
	 <SETG SAVED-GAME-MODE ,PARTY-MODE>
	 <SAVE-PARTY-COMMANDS>
	 <MOVE-TO ,GAME-ROOM <> T <>>
	 <CLEAR-FIELDS>
	 <SETG UPDATE-FLAG <>>
	 <RNUL>>

<ROOM GAME-ROOM
      (TRAVEL-COMMANDS SAVE-COMMAND RESTORE-COMMAND
		       END-SESSION-COMMAND CONTROLS-COMMAND)>

<COMMAND START-OVER <> ()
	 <RESTART>>

<COMMAND QUIT <> ()
	 <CLEAR -1>
	 <QUIT>>

<COMMAND END-SESSION <> ()
	 <MOVE-TO ,END-SESSION-ROOM <> T <>>
	 <RNUL>>

<ROOM END-SESSION-ROOM
      (TRAVEL-COMMANDS QUIT-COMMAND START-OVER-COMMAND NUL-COMMAND)>

<COMMAND CONTROLS <> ()
	 <COND (,SCRIPTING-FLAG
		<CHANGE-TRAVEL-COMMAND ,CONTROLS-ROOM
				       ,SCRIPT-ON-COMMAND
				       ,SCRIPT-OFF-COMMAND>)
	       (T
		<CHANGE-TRAVEL-COMMAND ,CONTROLS-ROOM
				       ,SCRIPT-OFF-COMMAND
				       ,SCRIPT-ON-COMMAND>)>
	 <MOVE-TO ,CONTROLS-ROOM <> T <>>
	 <RNUL>>

<COMMAND VERSION <> ()
	 <TELL
	  "JOURNEY: Part I of the Golden Age Trilogy." CR>
	 <TELL
	  "Created by Marc Blank" CR>
	 <TELL
	  "Illustrations by Donald Langosy" CR>
	 <TELL
	  "(c) Copyright 1988 by Infocom, Inc." CR>
	 <TELL
	  "All rights reserved." CR>
	 <TELL
	  "JOURNEY is a trademark of Infocom, Inc." CR>
	 <TELL-GAME-ID>
	 <V-CANCEL T>>

<COMMAND CHECK-DISK <> ()
	 <TELL-GAME-ID>
	 <TELL CR "[Verifying.]" CR>
	 <COND (<VERIFY>
		<TELL "Ok.">)
	       (T
		<TELL "** Bad **">)>
	 <V-CANCEL T>>

<COMMAND SCRIPT-OFF <> ()
	 <SETG SCRIPTING-FLAG <>>
	 <DIROUT -2>
	 <V-CANCEL>>

<COMMAND SCRIPT-ON <> ()
	 <MOVE-TO ,SCRIPT-ON-ROOM <> T <>>>

<COMMAND COMMANDS <> ()
	 <SETG SCRIPTING-FLAG T>
	 <SETG DONT-SCRIPT-INPUT <>>
	 <DIROUT 2>
	 <V-CANCEL>>

<COMMAND NO-COMMANDS <> ()
	 <SETG SCRIPTING-FLAG T>
	 <SETG DONT-SCRIPT-INPUT T>
	 <DIROUT 2>
	 <V-CANCEL>>

<ROOM SCRIPT-ON-ROOM
      (TRAVEL-COMMANDS COMMANDS-COMMAND NO-COMMANDS-COMMAND NUL-COMMAND)>

<COMMAND REFRESH <> ()
	 <REFRESH-SCREEN>
	 <LOWCORE FLAGS <BAND <LOWCORE FLAGS> -5>>
	 <V-CANCEL>>

<ROOM CONTROLS-ROOM
      (TRAVEL-COMMANDS SCRIPT-ON-COMMAND REFRESH-COMMAND
		       VERSION-COMMAND CHECK-DISK-COMMAND)>
	 
<COMMAND CANCEL <> ("OPTIONAL" (RT? <>))
	 <MOVE-TO ,SAVED-GAME-ROOM <> <> <>>
	 <MODE ,SAVED-GAME-MODE <> T>
	 <RESTORE-PARTY-COMMANDS>
	 <SMART-DEFAULT>
	 <SETG GAME-MODE <>>
	 ;"**"
	 <SETG UPDATE-FLAG <>>
	 <PRINT-CHARACTER-COMMANDS>
	 <COND (.RT? <RTRUE>)
	       (T <RNUL>)>>

<ROUTINE RNUL ()
	 <SETG ACTION ,NUL-COMMAND>
	 <RTRUE>>

<GLOBAL PARTY-COMMANDS
	<LTABLE
START-COMMAND BACKGROUND-COMMAND HELP-COMMAND NUL-COMMAND GAME-COMMAND>> 

<ROUTINE GAME-ACTION? ()
	 <COND (<OR <EQUAL? ,ACTION
			    ,GAME-COMMAND
			    ,SAVE-COMMAND
			    ,RESTORE-COMMAND>
		    <EQUAL? ,ACTION
			    ,CANCEL-COMMAND
			    ,CONTROLS-COMMAND
			    ,SCRIPT-ON-COMMAND>>
		<RTRUE>)>>
		    
<GLOBAL NAME-TBL <TABLE 0 0 0 0 0 0>>
<GLOBAL TAG-NAME <TABLE 0 0 0 0>>
<GLOBAL TAG-NAME-LENGTH 0>

<COMMAND CHANGE-NAME <>
	 ("AUX" (OFF 0) CHR LN (COL ,NAME-COLUMN) TBL (CNT 0) MAX)
	 <SET MAX 8>
	 <REMOVE-TRAVEL-COMMAND ,HERE ,CHANGE-NAME-COMMAND>
	 <IF-YFLAG <SELECT-SCREEN 1>>
	 <GCURSET <SET LN <+ ,COMMAND-START-LINE <PARTY-PCM ,TAG>>>
		  .COL>
	 <IFFLAG (<N==? MVER MAC>
		  <HLIGHT ,H-INVERSE>)>
	 <REPEAT ()
		 <COND (<G? <SET CNT <+ .CNT 1>> .MAX>
			<RETURN>)
		       (T
			<PRINTC !\->)>>
	 <GCURSET .LN .COL>
	 <SET TBL <REST ,NAME-TBL 2>>
	 <REPEAT ()
		 <COND (<EQUAL? <SET CHR <INPUT 1>> 13>
			<COND (<ZERO? .OFF>
			       <SETG UPDATE-FLAG T>
			       <RETURN>)
			      (T
			       ;"Do the change"
			       <ZWSTR ,NAME-TBL .OFF 2 ,TAG-NAME>
			       <SETG TAG-NAME-LENGTH .OFF>
			       <IF-YFLAG <SELECT-SCREEN 2>>
			       <IFFLAG (<N==? MVER MAC>
					<HLIGHT ,H-NORMAL>)>
			       <SETG UPDATE-FLAG T>
			       ;<PUT ,TAG-ROUTE-COMMAND
				    ,COMMAND-CHR
				    <GETB ,NAME-TBL 2>>
			       <RTRUE>)>)
		       (<EQUAL? .CHR ,DELETE-KEY ,BACK-SPACE ,LEFT-ARROW>
			<COND (<ZERO? .OFF>
			       <SOUND 1>
			       <AGAIN>)
			      (T
			       <GCURSET .LN .COL>
			       <PRINTC !\->
			       <SET COL <- .COL 1>>
			       <GCURSET .LN .COL>
			       <PRINTC !\->
			       <SET OFF <- .OFF 1>>
			       <GCURSET .LN .COL>)>)
		       (<OR <AND <NOT <L? .CHR !\A>> <NOT <G? .CHR !\Z>>>
			    <AND <NOT <L? .CHR !\a>> <NOT <G? .CHR !\z>>>>
			<COND (<EQUAL? .OFF .MAX>
			       <SOUND 1>
			       <AGAIN>)
			      (<AND <ZERO? .OFF>
				    <AND <NOT <L? .CHR !\a>>
					 <NOT <G? .CHR !\z>>>>
			       <SET CHR <- .CHR 32>>)
			      (<AND <G? .OFF 0>
				    <AND <NOT <L? .CHR !\A>>
					 <NOT <G? .CHR !\Z>>>>
			       <SET CHR <+ .CHR 32>>)>
			<PUTB .TBL .OFF .CHR>
			<SET OFF <+ .OFF 1>>
			<PRINTC .CHR>
			<SET COL <+ .COL 1>>
			<GCURSET .LN .COL>)
		       (T <SOUND 1>)>>
	 <IFFLAG (<N==? MVER MAC>
		  <HLIGHT ,H-NORMAL>)>
	 <IF-YFLAG <SELECT-SCREEN 2>>
	 <RNUL>>
	 