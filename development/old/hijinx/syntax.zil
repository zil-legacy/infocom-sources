"SYNTAX for ANTHILL (C)1986 Infocom Inc. All Rights Reserved."

<BUZZ A AN THE IS ARE AM AND OF THEN ALL BUT EXCEPT \. \, \" 
      HERE SOME ;FRONT MR MISS MRS MONEY ; PLEASE
      YESTER GREENS CAMELO STARDU MISTY PEOPLE FEELIN TOMORR OKLAHO TONIGH>

<PREP-SYNONYM RIGHT CLOCKWISE>
<PREP-SYNONYM LEFT COUNTERCLOCKWISE> 
<PREP-SYNONYM TO TOWARD>
<PREP-SYNONYM WITH USING>
<PREP-SYNONYM THROUGH THRU>
<PREP-SYNONYM ON ONTO>
<PREP-SYNONYM IN INSIDE INTO BEYOND BETWEEN>
<PREP-SYNONYM OUT OUTSIDE>
<PREP-SYNONYM UNDER BELOW BENEATH UNDERNEATH>
<PREP-SYNONYM AROUND ALONG>
<SYNONYM ALL BOTH EVERYTHING>
<PREP-SYNONYM OVER ACROSS>

<SYNONYM NORTH N>
<SYNONYM SOUTH S>
<SYNONYM EAST E>
<SYNONYM WEST W>
<SYNONYM DOWN D>
<SYNONYM UP U>
<SYNONYM NE NORTHE>
<SYNONYM NW NORTHW>
<SYNONYM SE SOUTHE>
<SYNONYM SW SOUTHW>

<SYNTAX VERBOSE = V-VERBOSE>
<SYNTAX BRIEF = V-BRIEF>
<SYNTAX SUPER = V-SUPER-BRIEF>
<VERB-SYNONYM SUPER SUPERBRIEF>
<SYNTAX DIAGNOSE = V-DIAGNOSE>
<SYNTAX I = V-INVENTORY>
<VERB-SYNONYM I INVENTORY>
<SYNTAX QUIT = V-QUIT>
<VERB-SYNONYM QUIT Q>
<SYNTAX RESTAR = V-RESTART>
<SYNTAX RESTOR = V-RESTORE>
<SYNTAX SAVE = V-SAVE>
<SYNTAX SAVE OBJECT = V-RESCUE>
<SYNTAX SCORE = V-SCORE>
<SYNTAX SCRIPT = V-SCRIPT>
<SYNTAX TIME = V-TIME>
<VERB-SYNONYM TIME T>
<SYNTAX UNSCRIPT = V-UNSCRIPT>
<SYNTAX VERSION = V-VERSION>
<SYNTAX $VERIFY = V-$VERIFY>
<SYNTAX $VERIFY OBJECT = V-$VERIFY>
<SYNTAX \#RANDOM OBJECT = V-$RANDOM>
<SYNTAX \#COMMAND = V-$COMMAND>
<SYNTAX \#RECORD = V-$RECORD>
<SYNTAX \#UNRECORD = V-$UNRECORD>
;<SYNTAX $DEBUG = V-$DEBUG>
;<SYNTAX $TREASURE = V-$TREASURE>
;<SYNTAX $MOVES = V-$MOVES>
;<SYNTAX $HERE = V-$HERE>
;<SYNTAX $HNUM = V-$HEDGE-NUM>
;<SYNTAX $CARDS = V-$CCARDS>
;<SYNTAX $NINE = V-$NINE>
;<SYNTAX TTEN = V-TTEN>
;<SYNTAX LAZY = V-LAZY>

;<ROUTINE V-$NINE ()
	 <SETG TREASURES-FOUND 9>>

;<ROUTINE V-TTEN ()
	 <MOVE ,PARKING-METER ,LIVING-ROOM>
	 <MOVE ,CORPSE-LINE ,LIVING-ROOM>
	 <MOVE ,RUBBER-STAMP ,LIVING-ROOM>
	 <MOVE ,GRATER ,LIVING-ROOM>
	 <MOVE ,MASK ,LIVING-ROOM>
	 <MOVE ,TOUPEE ,LIVING-ROOM>
	 <MOVE ,FIRE-HYDRANT ,LIVING-ROOM>
	 <MOVE ,FINCH ,LIVING-ROOM>
	 <MOVE ,RING ,LIVING-ROOM>
	 <MOVE ,PENGUIN ,LIVING-ROOM>
	 <FSET ,FLASHLIGHT ,ONBIT>
	 <FCLEAR ,RING ,ON-MONUMENT-BIT>
	 <FSET ,DOG ,CLUTCHING-BIT>
	 <SETG BURN-DOME 0> ;"hole burned in dome"
	 <SETG TREASURES-FOUND 10>
	 <FCLEAR ,RING ,NDESCBIT>
	 <GOTO ,LIVING-ROOM>>

;<ROUTINE V-$CCARDS ()
	 <MOVE ,RED-CARD ,PLAYER>
	 <MOVE ,ORANGE-CARD ,PLAYER>
	 <MOVE ,YELLOW-CARD ,PLAYER>
	 <MOVE ,GREEN-CARD ,PLAYER>
	 <MOVE ,BLUE-CARD ,PLAYER>
	 <MOVE ,INDIGO-CARD ,PLAYER>
	 <MOVE ,VIOLET-CARD ,PLAYER>
	 <FCLEAR ,INDIGO-CARD ,INVISIBLE>
	 <FCLEAR ,GREEN-CARD ,INVISIBLE>
	 <FCLEAR ,RED-CARD ,INVISIBLE>
	 <MOVE ,PLAYER ,CELLAR>>	 

;<ROUTINE V-$TREASURE ()
	 <SETG TREASURES-FOUND 10>
	 <MOVE ,PEG-0 ,PLAYER>
	 <GOTO ,CLOSET>>

;<ROUTINE V-$HERE ()
	 <TELL D <LOC ,PLAYER> CR>
	 <TELL "Closet floor: " D ,CLOSET-FLOOR CR>>

<GLOBAL HEDGE-NUM  <>>

;<ROUTINE V-$HEDGE-NUM ()
	 <COND (,HEDGE-NUM
		<SETG HEDGE-NUM <>>)
	       (T
		<SETG HEDGE-NUM T>)>>

;<GLOBAL LAZY T>

;<ROUTINE V-LAZY ()
	 <COND (,LAZY
		<SETG HM-ROOM 388>
		<SETG LAZY <>>
		<GOTO ,HEDGE-MAZE>)
	       (T
		<SETG HM-ROOM 439>
		<SETG LAZY T>
	        <GOTO ,ENTRANCE-TO-MAZE>)>>

;<ROUTINE V-$ONHELP ()
	 <SETG HELP T>
	 <TELL
"Bugs? Bugs? We're gonna grab'em by the nose and kick'em in the ass.
We're gonna kick the hell out of 'em all the time and go through them --
like shit through a goose. Now go find those bugs." CR>
	 <SETG SONG-NUMBER <- <RANDOM 10> 1>>
	 <TELL <GET ,SONGS ,SONG-NUMBER> CR>
	 <RTRUE>>

;<ROUTINE V-$OFFHELP ()
	 <SETG HELP <>>
	 <TELL "Mo'fos routed!" CR>
	 <RTRUE>>

;<ROUTINE V-$MOVES ()
	 <SETG MOVES -1>>

<ROUTINE V-FLUSH ()
	 <COND (<AND <EQUAL? ,PRSO ,INTNUM>
		     <EQUAL? ,P-NUMBER 33>
		     <OR <ZIL?>
			 <NOT <ZERO? ,P-VMERGE>>>>
		<GOTO ,P-NMERGE>
		<V-LOOK>
		<RTRUE>)>
	 <TELL "You can't flush that." CR>
	 <RTRUE>>

;"OLD CLOCK"
;<ROUTINE V-$CLOCK ("AUX" E TICK HAND)
	 <COND (<AND <PRSO? INTNUM>
		     <NOT <ZERO? ,P-NUMBER>>>
	       <SET HAND <REST ,C-TABLE ,C-INTS>>
	       <SET E <REST ,C-TABLE ,C-TABLELEN>>
	       <REPEAT ()
		 <COND (<EQUAL? .HAND .E>
			<RETURN>)
		       (<NOT <ZERO? <GET .HAND ,C-RTN>>>
			<SET TICK <GET .HAND ,C-TICK>>
			<COND (<G? .TICK 0>
			       <SET TICK <- .TICK ,P-NUMBER>>
			       <PUT .HAND ,C-TICK .TICK>)>)>
		 <SET HAND <REST .HAND ,C-INTLEN>>>
		<SETG MOVES <+ ,MOVES ,P-NUMBER>>
		<V-TIME>
		<RTRUE>)>
	 <TELL "Scram." CR>
	 <RTRUE>>

"<SYNTAX AGAIN = V-AGAIN>
<VERB-SYNONYM AGAIN G>"

<SYNTAX ANSWER OBJECT (FIND ACTORBIT) = V-REPLY>
<SYNTAX ANSWER TO OBJECT (FIND ACTORBIT) = V-REPLY>
<VERB-SYNONYM ANSWER REPLY RESPOND ; RETORT>

; <SYNTAX APPLY OBJECT (HELD MANY) TO OBJECT = V-PUT PRE-PUT>

<SYNTAX ASK OBJECT (FIND ACTORBIT) = V-QUESTION>
<SYNTAX ASK OBJECT (FIND ACTORBIT) ABOUT OBJECT = V-ASK-ABOUT>
<SYNTAX ASK OBJECT (FIND ACTORBIT) FOR OBJECT = V-ASK-FOR>
<VERB-SYNONYM ASK QUERY INTERROGATE QUIZ QUESTION>

; <SYNTAX ASCEND = V-CLIMB-UP>
<SYNTAX ASCEND OBJECT (FIND RLANDBIT) (ON-GROUND IN-ROOM) = V-CLIMB-UP>

<SYNTAX BACK = V-WALK-AROUND>

<SYNTAX BITE OBJECT = V-BITE>

<SYNTAX BLOW OBJECT = V-BLOW-INTO>
<SYNTAX BLOW IN OBJECT = V-BLOW-INTO>
<SYNTAX BLOW THROUGH OBJECT = V-BLOW-INTO>
<SYNTAX BLOW UP OBJECT = V-MUNG ; V-INFLATE>
<SYNTAX BLOW OUT OBJECT = V-LAMP-OFF>

<SYNTAX BOARD OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-BOARD PRE-BOARD>
<VERB-SYNONYM BOARD EMBARK>

; <SYNTAX BOW TO OBJECT (FIND ACTORBIT) = V-BOW>
; <SYNTAX BOW BEFORE OBJECT (FIND ACTORBIT) = V-BOW>
; <VERB-SYNONYM BOW KNEEL GROVEL ; "GENUFLECT PROSTRATE">

<SYNTAX BREAK OBJECT (ON-GROUND IN-ROOM) = V-MUNG>
<SYNTAX BREAK OBJECT (ON-GROUND IN-ROOM HELD CARRIED)
	WITH OBJECT (HAVE HELD CARRIED) = V-MUNG>
<SYNTAX BREAK OBJECT (ON-GROUND IN-ROOM)
	OFF OBJECT (ON-GROUND IN-ROOM) = V-MUNG>
<SYNTAX BREAK DOWN OBJECT (ON-GROUND IN-ROOM HELD CARRIED)
	WITH OBJECT (HAVE HELD CARRIED) = V-MUNG>
<SYNTAX BREAK IN OBJECT (ON-GROUND IN-ROOM) = V-MUNG>
<SYNTAX BREAK IN OBJECT (ON-GROUND IN-ROOM)
	WITH OBJECT (HAVE HELD CARRIED) = V-MUNG>
<SYNTAX BREAK THROUGH OBJECT (ON-GROUND IN-ROOM) = V-MUNG>
<SYNTAX BREAK THROUGH OBJECT (ON-GROUND IN-ROOM)
	WITH OBJECT (HAVE HELD CARRIED) = V-MUNG>
<VERB-SYNONYM BREAK DESTROY DAMAGE SMASH DEMOLISH WRECK CRACK TRASH ERASE>

<SYNTAX BURN OBJECT (HELD CARRIED ON-GROUND IN-ROOM)
        WITH OBJECT (FIND FLAMEBIT) (HELD CARRIED) = V-BURN>
<SYNTAX BURN DOWN OBJECT (HELD CARRIED ON-GROUND IN-ROOM) WITH OBJECT
	(FIND FLAMEBIT) (HELD CARRIED) = V-BURN>

<SYNTAX BUY OBJECT ; (ON-GROUND IN-ROOM) = V-BUY>
<SYNTAX BUY OBJECT WITH OBJECT (HELD HAVE) = V-BUY>

;<SYNTAX BYE = V-GOODBYE>
;<SYNTAX BYE OBJECT = V-GOODBYE>
;<VERB-SYNONYM BYE GOODBYE SAYONARA ADIOS FAREWELL>

<SYNTAX CALL OBJECT = V-PHONE ;PRE-PHONE>
<SYNTAX CALL OBJECT ON OBJECT = V-PHONE ;PRE-PHONE>
<SYNTAX CALL UP OBJECT = V-PHONE ;PRE-PHONE>
<VERB-SYNONYM CALL PHONE DIAL>

<SYNTAX CLEAN OBJECT = V-CLEAN>
<SYNTAX CLEAN OFF OBJECT = V-CLEAN>
<VERB-SYNONYM CLEAN SWEEP ; WIPE BRUSH ; POLISH>

; <SYNTAX CLIMB = V-CLIMB-UP>
<SYNTAX CLIMB OBJECT (ON-GROUND IN-ROOM) = V-CLIMB>
<SYNTAX CLIMB ON OBJECT ; (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-CLIMB-ON>
<SYNTAX CLIMB UP OBJECT (FIND RLANDBIT) (ON-GROUND IN-ROOM) = V-CLIMB-UP>
<SYNTAX CLIMB DOWN OBJECT (FIND RLANDBIT) (ON-GROUND IN-ROOM) = V-CLIMB-DOWN>
<SYNTAX CLIMB OVER OBJECT (FIND RLANDBIT) (ON-GROUND IN-ROOM) = V-CLIMB-OVER>
<SYNTAX CLIMB UNDER OBJECT (ON-GROUND IN-ROOM) = V-ENTER>
<SYNTAX CLIMB THROUGH OBJECT (ON-GROUND IN-ROOM) = V-ENTER>
<SYNTAX CLIMB IN OBJECT (FIND RLANDBIT) (ON-GROUND IN-ROOM) = V-ENTER>
<SYNTAX CLIMB OUT OBJECT (FIND RLANDBIT) = V-EXIT>
<VERB-SYNONYM CLIMB SCALE>

<SYNTAX CLOSE OBJECT (FIND CONTBIT) (HELD CARRIED ON-GROUND IN-ROOM)
        = V-CLOSE>
<VERB-SYNONYM CLOSE SHUT SLAM>

<SYNTAX COMPAR OBJECT TO OBJECT = V-COMPARE>

<SYNTAX COUNT OBJECT = V-COUNT>
<VERB-SYNONYM COUNT TALLY ; TABULATE>

<SYNTAX COVER OBJECT WITH OBJECT (TAKE) = V-COVER>

<SYNTAX CROSS OBJECT = V-CROSS>
<VERB-SYNONYM CROSS TRAVERSE>

<SYNTAX CUT OBJECT WITH OBJECT (CARRIED HELD) = V-CUT>
<SYNTAX CUT THROUGH OBJECT WITH OBJECT (CARRIED HELD) = V-CUT>
<SYNTAX CUT LOOSE OBJECT WITH OBJECT (CARRIED HELD) = V-CUT>
<SYNTAX CUT OBJECT LOOSE OBJECT (CARRIED HELD) = V-CUT> 
<VERB-SYNONYM CUT SLASH CLIP ; "SLICE GASH LACERATE CLEAVE SEVER SPLIT TEAR RIP"> 

; <SYNTAX DEFLATE OBJECT = V-DEFLATE>

; <SYNTAX DESCEND = V-CLIMB-DOWN>
<SYNTAX DESCEND OBJECT (FIND RLANDBIT) (ON-GROUND IN-ROOM) = V-CLIMB-DOWN>

<SYNTAX DIG IN OBJECT = V-DIG>
<SYNTAX DIG AT OBJECT = V-DIG>
<SYNTAX DIG UP OBJECT = V-DIG>
<SYNTAX DIG WITH OBJECT = V-DIG-WITH>
<SYNTAX DIG THROUGH OBJECT = V-DIG>
<SYNTAX DIG OBJECT (ON-GROUND IN-ROOM) WITH OBJECT (HELD CARRIED HAVE) = V-DIG>
<SYNTAX DIG IN OBJECT (ON-GROUND IN-ROOM) WITH OBJECT (HELD CARRIED HAVE)
	= V-DIG>
<SYNTAX DIG OBJECT (ON-GROUND IN-ROOM) IN OBJECT = V-DIG>
<VERB-SYNONYM DIG EXCAVATE>

<SYNTAX DISEMBARK OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-DISEMBARK>
<VERB-SYNONYM DISEMBARK DEBARK>

<SYNTAX DRINK OBJECT (HELD CARRIED ON-GROUND IN-ROOM) = V-DRINK>
<SYNTAX DRINK FROM OBJECT (HELD CARRIED) = V-DRINK-FROM>
<VERB-SYNONYM DRINK SIP GUZZLE ; "IMBIBE QUAFF SWILL">

<SYNTAX DROP OBJECT (HELD MANY ;HAVE) = V-DROP>
<SYNTAX DROP OBJECT (HELD MANY) DOWN OBJECT = V-PUT PRE-PUT>
<SYNTAX DROP OBJECT (HELD MANY) IN OBJECT = V-PUT PRE-PUT>
<SYNTAX DROP OBJECT (HELD MANY) ON OBJECT = V-PUT-ON PRE-PUT>
<VERB-SYNONYM DROP DUMP>

<SYNTAX EAT OBJECT (HELD CARRIED ON-GROUND IN-ROOM) = V-EAT>
<VERB-SYNONYM EAT CONSUME SWALLOW DEVOUR GOBBLE NIBBLE ; INGEST>

<SYNTAX EMPTY OBJECT (HELD CARRIED) = V-EMPTY>
<SYNTAX EMPTY OUT OBJECT (HELD CARRIED) = V-EMPTY>
<SYNTAX EMPTY OBJECT FROM OBJECT = V-TAKE PRE-TAKE>
<SYNTAX EMPTY OBJECT OUT OBJECT = V-TAKE PRE-TAKE>

<SYNTAX ENTER OBJECT (FIND RLANDBIT) = V-ENTER> ;"was V-THROUGH"
<VERB-SYNONYM ENTER ; BOARD ; EMBARK>

; <SYNTAX EXIT = V-EXIT>
<SYNTAX EXIT OBJECT (FIND RLANDBIT) = V-EXIT>
<VERB-SYNONYM EXIT DEPART SCRAM WITHDRAW ; DISEMBARK ; DEBARK>

<SYNTAX EXAMINE OBJECT (HELD CARRIED ON-GROUND IN-ROOM) ; (FIND DARKBIT)
	= V-EXAMINE PRE-EXAMINE>
<SYNTAX EXAMINE IN OBJECT (HELD CARRIED IN-ROOM ON-GROUND)
	= V-LOOK-INSIDE>
<SYNTAX EXAMINE ON OBJECT (HELD CARRIED IN-ROOM ON-GROUND) = V-LOOK-ON>
<SYNTAX EXAMINE FOR OBJECT = V-FIND>
<SYNTAX EXAMINE OBJECT (HELD CARRIED ON-GROUND IN-ROOM)
        THROUGH OBJECT (HELD CARRIED ON-GROUND IN-ROOM)
	= V-LOOK-THRU>
<SYNTAX EXAMINE OBJECT (HELD CARRIED ON-GROUND IN-ROOM)
        WITH OBJECT (HELD CARRIED ON-GROUND IN-ROOM)
	= V-LOOK-THRU>
<VERB-SYNONYM EXAMINE ; EXAM INSPECT DESCRIBE CHECK STUDY SURVEY OBSERVE WATCH SEE>

<SYNTAX EXTINGUISH OBJECT (FIND FLAMEBIT) = V-LAMP-OFF>
<VERB-SYNONYM EXTINGUISH DOUSE QUENCH SNUFF>

;<SYNTAX FEED OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) WITH OBJECT
	(HELD ; HAVE ; MANY) = V-SFEED>
;<SYNTAX FEED OBJECT (HELD ; HAVE ; MANY) TO OBJECT
	(FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-FEED PRE-FEED>
;<SYNTAX FEED OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM)
        OBJECT (HELD ; HAVE ; MANY) = V-SFEED>

<SYNTAX FILL OBJECT (FIND CONTBIT) (HELD CARRIED HAVE) = V-FILL>
<SYNTAX FILL OBJECT (FIND CONTBIT) (HELD CARRIED HAVE) WITH OBJECT = V-FILL>

<SYNTAX FIND OBJECT = V-FIND>
<VERB-SYNONYM FIND SEEK>

<SYNTAX FLUSH OBJECT = V-FLUSH>

<SYNTAX FLY = V-FLY>
<SYNTAX FLY OBJECT = V-FLY>
<SYNTAX FLY ON OBJECT = V-FLY>
<SYNTAX FLY WITH OBJECT = V-FLY>

<SYNTAX FOCUS OBJECT = V-FOCUS>

;<SYNTAX FOLLOW = V-FOLLOW>
<SYNTAX FOLLOW OBJECT = V-FOLLOW>
<VERB-SYNONYM FOLLOW PURSUE CHASE>

; <SYNTAX FUCK = V-CURSE>
; <SYNTAX FUCK OBJECT (FIND ACTORBIT) = V-CURSE>
; <VERB-SYNONYM FUCK FUCKED GODDAMNED SHIT ASSHOLE SHITHEAD SCREW FUCKING
           COCKSUCKER>

<SYNTAX GIVE OBJECT (HELD ; HAVE ; MANY)
        TO OBJECT (FIND ACTORBIT) (IN-ROOM ON-GROUND) = V-GIVE PRE-GIVE>
<SYNTAX GIVE OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM)
	OBJECT (HELD ; HAVE ; MANY) = V-SGIVE>
<VERB-SYNONYM GIVE HAND DONATE DELIVER OFFER BESTOW PRESENT>

<SYNTAX GO OBJECT = V-WALK>
<SYNTAX GO IN OBJECT (FIND RLANDBIT) = V-ENTER>
<SYNTAX GO OUT OBJECT (FIND RLANDBIT) = V-EXIT>
<SYNTAX GO OVER OBJECT = V-CROSS>
<SYNTAX GO THROUGH OBJECT = V-ENTER>
<SYNTAX GO AROUND OBJECT (FIND RLANDBIT) = V-WALK-AROUND>
<SYNTAX GO BEHIND OBJECT = V-WALK-AROUND>
<SYNTAX GO UNDER OBJECT = V-ENTER>
<SYNTAX GO UP OBJECT (FIND RLANDBIT) (ON-GROUND IN-ROOM) = V-CLIMB-UP>
<SYNTAX GO DOWN OBJECT (FIND RLANDBIT) (ON-GROUND IN-ROOM) = V-CLIMB-DOWN>
<SYNTAX GO TO OBJECT = V-WALK-TO>

;<VERB-SYNONYM GOTO OBJECT = V-GOTO>

<SYNTAX HANG OBJECT = V-HANG-UP PRE-HANG-UP>
<SYNTAX HANG UP OBJECT = V-HANG-UP PRE-HANG-UP>
<SYNTAX HANG OBJECT ON OBJECT = V-HANG-UP PRE-HANG-UP>
<SYNTAX HANG UP OBJECT ON OBJECT = V-HANG-UP PRE-HANG-UP>
<SYNTAX HANG OBJECT FROM OBJECT = V-HANG-UP PRE-HANG-UP>
<SYNTAX HANG UP OBJECT FROM OBJECT = V-HANG-UP PRE-HANG-UP>

<SYNTAX HEAR OBJECT = V-LISTEN>

<SYNTAX HELLO = V-HELLO>
<SYNTAX HELLO OBJECT = V-HELLO>
<VERB-SYNONYM HELLO HI GREETINGS GREET SALUTE AFTERNOON BYE GOODBYE FAREWELL>

<SYNTAX HELP = V-HELP>
<SYNTAX HELP OBJECT = V-RESCUE>
<VERB-SYNONYM HELP AID RESCUE>

<SYNTAX HIDE OBJECT (FIND RLANDBIT) = V-HIDE>
<SYNTAX HIDE UNDER OBJECT = V-HIDE>
<SYNTAX HIDE BEHIND OBJECT = V-HIDE>
<SYNTAX HIDE OBJECT (HELD HAVE) FROM OBJECT = V-HIDE>
<SYNTAX HIDE OBJECT (HELD HAVE) BEHIND OBJECT = V-HIDE>
<SYNTAX HIDE OBJECT (HELD HAVE) UNDER OBJECT = V-HIDE>
<VERB-SYNONYM HIDE CONCEAL ; "SECRETE ENSCONCE CAMOUFLAGE">

<SYNTAX HINT = V-HELP>
<VERB-SYNONYM HINT HINTS>

; <SYNTAX INFLATE OBJECT = V-INFLATE>

<SYNTAX JUMP OBJECT (FIND RLANDBIT) = V-LEAP>
<SYNTAX JUMP ON OBJECT = V-STAND-ON>
<SYNTAX JUMP OVER OBJECT = V-LEAP>
<SYNTAX JUMP IN OBJECT (FIND RLANDBIT) = V-ENTER>
<SYNTAX JUMP OUT OBJECT (FIND RLANDBIT) = V-EXIT>
<SYNTAX JUMP FROM OBJECT = V-LEAP>
<SYNTAX JUMP OFF OBJECT = V-LEAP>
<VERB-SYNONYM JUMP LEAP DIVE ; " BOUND HURDLE VAULT " >

<SYNTAX KICK OBJECT = V-KICK>
<SYNTAX KICK IN OBJECT = V-KICK>
<SYNTAX KICK DOWN OBJECT = V-KICK>

<SYNTAX KILL OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-KILL>
<SYNTAX KILL OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM)
	WITH OBJECT (HELD CARRIED HAVE) = V-KILL>
<VERB-SYNONYM KILL MURDER SLAY HIT SLAP WHACK STRIKE STAB PUNCH WOUND
	 ATTACK ASSAULT FIGHT HURT INJURE ;"DISPATCH VANQUISH">

<SYNTAX KISS OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-KISS>
<VERB-SYNONYM KISS SMOOCH>

<SYNTAX KNOCK AT OBJECT = V-KNOCK>
<SYNTAX KNOCK ON OBJECT = V-KNOCK>
<SYNTAX KNOCK DOWN OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-KILL>
<VERB-SYNONYM KNOCK RAP POUND>

; <SYNTAX LAUNCH OBJECT (FIND VEHBIT) = V-LAUNCH>

<SYNTAX LEAVE OBJECT (FIND RLANDBIT) = V-LEAVE>
<SYNTAX LEAVE OBJECT (HELD CARRIED HAVE MANY) IN OBJECT
	(ON-GROUND IN-ROOM CARRIED ; MANY) = V-PUT PRE-PUT>
<SYNTAX LEAVE OBJECT (HELD CARRIED HAVE MANY) ON OBJECT
	(ON-GROUND IN-ROOM CARRIED ; MANY) = V-PUT-ON PRE-PUT>

; <SYNTAX LEAVE OBJECT = V-DROP>

<SYNTAX LET GO OBJECT (HELD MANY) = V-LET-GO>

<SYNTAX LIE DOWN OBJECT (FIND RLANDBIT) = V-LIE-DOWN>
<SYNTAX LIE ON OBJECT ; (FIND VEHBIT) = V-LIE-DOWN>
<SYNTAX LIE IN OBJECT ; (FIND VEHBIT) = V-LIE-DOWN>
<VERB-SYNONYM LIE RECLINE ; REPOSE>

<SYNTAX LIGHT OBJECT (HELD CARRIED TAKE) (FIND LIGHTBIT) = V-LAMP-ON>
<SYNTAX LIGHT OBJECT (HELD CARRIED ON-GROUND IN-ROOM) WITH OBJECT
	(HELD CARRIED) = V-BURN>
<VERB-SYNONYM LIGHT IGNITE> ;"ignite was formerly a synonym for BURN"

<SYNTAX LISTEN OBJECT (FIND RLANDBIT) = V-LISTEN>
<SYNTAX LISTEN TO OBJECT (HELD CARRIED ON-GROUND IN-ROOM) 
	= V-LISTEN>
<SYNTAX LISTEN IN OBJECT (HELD CARRIED ON-GROUND IN-ROOM)
        = V-LISTEN>
<SYNTAX LISTEN FOR OBJECT (HELD CARRIED ON-GROUND IN-ROOM)
	= V-LISTEN>

<SYNTAX LOCK OBJECT (ON-GROUND IN-ROOM) = V-LOCK>
<SYNTAX LOCK OBJECT (ON-GROUND IN-ROOM) WITH OBJECT (HELD HAVE) = V-LOCK>

<SYNTAX LOOK = V-LOOK>
<SYNTAX LOOK AROUND OBJECT (FIND RLANDBIT) = V-LOOK>
<SYNTAX LOOK DOWN OBJECT (FIND RLANDBIT) = V-LOOK-DOWN>
<SYNTAX LOOK UP OBJECT (FIND RLANDBIT) = V-LOOK-UP>
<SYNTAX LOOK OBJECT (HELD CARRIED ON-GROUND IN-ROOM) = V-CHASTISE>
<SYNTAX LOOK AT OBJECT (HELD CARRIED ON-GROUND IN-ROOM) ; (FIND DARKBIT)
	= V-EXAMINE PRE-EXAMINE>
<SYNTAX LOOK THROUGH OBJECT (HELD CARRIED ON-GROUND IN-ROOM)
	= V-LOOK-INSIDE>
<SYNTAX LOOK UNDER OBJECT = V-LOOK-UNDER>
<SYNTAX LOOK BEHIND OBJECT = V-LOOK-BEHIND>
<SYNTAX LOOK IN OBJECT (HELD CARRIED ON-GROUND IN-ROOM) = V-LOOK-INSIDE>
<SYNTAX LOOK ON OBJECT (HELD CARRIED ON-GROUND IN-ROOM) = V-LOOK-ON>
<SYNTAX LOOK AT OBJECT (HELD CARRIED ON-GROUND IN-ROOM) THROUGH OBJECT
	= V-LOOK-THRU>
<SYNTAX LOOK OUT OBJECT = V-LOOK-INSIDE>
<SYNTAX LOOK FOR OBJECT = V-FIND>
<VERB-SYNONYM LOOK L STARE GAZE PEER PEEK>

<SYNTAX LOWER OBJECT = V-LOWER>

;<SYNTAX MELT OBJECT WITH OBJECT (HELD CARRIED ON-GROUND IN-ROOM) = V-MELT>
;<VERB-SYNONYM MELT LIQUIFY DISSOLVE THAW>

<SYNTAX MOVE OBJECT (FIND RLANDBIT) (ON-GROUND IN-ROOM) = V-MOVE>
<SYNTAX MOVE OBJECT (ON-GROUND IN-ROOM) OBJECT = V-PUSH-TO>
<SYNTAX MOVE OBJECT (ON-GROUND IN-ROOM) TO OBJECT = V-PUSH-TO>
<SYNTAX MOVE OBJECT (ON-GROUND IN-ROOM) DOWN OBJECT = V-PUSH-DOWN>
<SYNTAX MOVE UP OBJECT (ON-GROUND IN-ROOM) = V-ROLL-UP>
<VERB-SYNONYM MOVE SHIFT ROLL ; DISLOCATE>

; <SYNTAX NO = V-NO>
; <VERB-SYNONYM NO NAY NEGATIVE NOPE NAW>

<SYNTAX OPEN OBJECT (FIND DOORBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	= V-OPEN>
<SYNTAX OPEN UP	OBJECT (FIND DOORBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	= V-OPEN>
<SYNTAX OPEN OBJECT (FIND DOORBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	WITH OBJECT ; (FIND TOOLBIT) (ON-GROUND IN-ROOM HELD CARRIED HAVE)
	= V-OPEN>
<VERB-SYNONYM OPEN UNSEAL PRY>

; <SYNTAX PAY OBJECT (FIND ACTORBIT) WITH OBJECT (HELD CARRIED) = V-PAY>
; <VERB-SYNONYM PAY BRIBE ENTICE ; RENUMERATE>

<SYNTAX PICK OBJECT = V-PICK>
<SYNTAX PICK OBJECT WITH OBJECT = V-PICK>
<SYNTAX PICK UP OBJECT (FIND TAKEBIT) (ON-GROUND MANY) = V-TAKE PRE-TAKE>

<SYNTAX PLAY = V-PLAY>
<SYNTAX PLAY OBJECT = V-PLAY>
<SYNTAX PLAY ON OBJECT = V-PLAY>
<SYNTAX PLAY OBJECT ON OBJECT = V-PLAY>

; <SYNTAX PLUG OBJECT WITH OBJECT = V-PLUG>
; <VERB-SYNONYM PLUG GLUE ;PATCH REPAIR FIX CLOG>

;<SYNTAX POINT AT OBJECT = V-POINT>
;<SYNTAX POINT OBJECT AT OBJECT = V-POINT>
;<SYNTAX POINT TO OBJECT = V-POINT>
;<VERB-SYNONYM POINT AIM>

<SYNTAX POKE OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM)
	WITH OBJECT (HELD CARRIED HAVE) = V-MUNG>
<VERB-SYNONYM POKE JAB BLIND>

;<SYNTAX POUR OBJECT (HELD CARRIED) = V-POUR>
;<SYNTAX POUR OUT OBJECT (HELD CARRIED) = V-POUR>
<SYNTAX POUR OBJECT (HELD CARRIED) ON OBJECT = V-POUR>
<SYNTAX POUR OBJECT (HELD CARRIED) FROM OBJECT = V-POUR>
<SYNTAX POUR OBJECT (HELD CARRIED) IN OBJECT = V-POUR>
<SYNTAX POUR OUT OBJECT (HELD CARRIED) IN OBJECT = V-POUR>
<VERB-SYNONYM POUR DRIP SPILL SPRINKLE>

<SYNTAX PRAY = V-HELP>

<SYNTAX PULL OBJECT (ON-GROUND IN-ROOM) = V-PULL>
<SYNTAX PULL ON OBJECT (ON-GROUND IN-ROOM) = V-PULL>
<SYNTAX PULL UP OBJECT (ON-GROUND IN-ROOM) = V-RAISE>
<SYNTAX PULL DOWN OBJECT = V-LOWER>
<SYNTAX PULL OBJECT DOWN OBJECT (FIND RLANDBIT) = V-LOWER>
<SYNTAX PULL OBJECT (FIND TAKEBIT) OUT OBJECT (ON-GROUND IN-ROOM)
	= V-TAKE PRE-TAKE>
<VERB-SYNONYM PULL TUG DRAG SHOVE YANK>

<SYNTAX PUSH OBJECT (IN-ROOM ON-GROUND) = V-PUSH>
<SYNTAX PUSH ON OBJECT (IN-ROOM ON-GROUND) = V-PUSH>

<SYNTAX PUSH OBJECT (ON-GROUND IN-ROOM)
        UP OBJECT (IN-ROOM ON-GROUND) = V-PUSH-TO>
<SYNTAX PUSH UP OBJECT (IN-ROOM ON-GROUND) = V-PUSH-UP>

<SYNTAX PUSH OBJECT (ON-GROUND IN-ROOM)
        DOWN OBJECT (IN-ROOM ON-GROUND) = V-PUSH-DOWN>
<SYNTAX PUSH DOWN OBJECT (IN-ROOM ON-GROUND) = V-PUSH-DOWN>

<SYNTAX PUSH OBJECT (IN-ROOM ON-GROUND) OBJECT = V-PUSH-TO>
<SYNTAX PUSH OBJECT (IN-ROOM ON-GROUND) TO OBJECT = V-PUSH-TO>
;<SYNTAX PUSH OBJECT (IN-ROOM ON-GROUND) IN OBJECT = V-PUSH-TO>
<SYNTAX PUSH OBJECT UNDER OBJECT = V-PUT-UNDER>
;<SYNTAX PUSH OVER OBJECT (IN-ROOM ON-GROUND) = V-TIP>
<VERB-SYNONYM PUSH PRESS THRUST NUDGE RING>

<SYNTAX PUT OBJECT (HELD CARRIED HAVE MANY) IN OBJECT
	(ON-GROUND IN-ROOM HELD CARRIED ; MANY) = V-PUT PRE-PUT>
<SYNTAX PUT OBJECT (HELD CARRIED HAVE MANY) DOWN OBJECT
	(ON-GROUND IN-ROOM HELD CARRIED ; MANY) = V-PUT PRE-PUT>
<SYNTAX PUT OBJECT (HELD CARRIED HAVE MANY) ON OBJECT
	(ON-GROUND IN-ROOM HELD CARRIED ; MANY) = V-PUT-ON PRE-PUT>
<SYNTAX PUT OBJECT (HELD CARRIED HAVE MANY) OVER OBJECT
	(ON-GROUND IN-ROOM HELD CARRIED ; MANY) = V-PUT-ON PRE-PUT>
<SYNTAX PUT DOWN OBJECT (HELD CARRIED HAVE MANY) = V-DROP>
<SYNTAX PUT OBJECT (HELD MANY HAVE CARRIED) UNDER OBJECT
	(ON-GROUND IN-ROOM HELD CARRIED ; MANY) = V-PUT-UNDER> 
<SYNTAX PUT ON OBJECT (ON-GROUND IN-ROOM HELD CARRIED ; MANY) = V-WEAR>
<SYNTAX PUT OBJECT (HELD CARRIED MANY HAVE) BEHIND OBJECT
	(ON-GROUND IN-ROOM HELD CARRIED ; MANY) = V-PUT-BEHIND>
<SYNTAX PUT OUT OBJECT (ON-GROUND IN-ROOM CARRIED HELD) = V-LAMP-OFF>
<VERB-SYNONYM PUT STUFF DIP LOAD INSERT THREAD PLACE LAY WEDGE FORCE STASH>

<SYNTAX RAISE OBJECT = V-RAISE>
<SYNTAX RAISE UP OBJECT = V-RAISE>
<VERB-SYNONYM RAISE LIFT ELEVATE HOIST>

<SYNTAX RAPE OBJECT (FIND ACTORBIT) = V-RAPE>
<VERB-SYNONYM RAPE MOLEST DEFILE>

<SYNTAX REACH IN OBJECT (ON-GROUND IN-ROOM) = V-REACH-IN>
<SYNTAX REACH THROUGH OBJECT (ON-GROUND IN-ROOM) = V-REACH-IN>

<SYNTAX READ OBJECT (FIND READBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	= V-READ>
<SYNTAX READ OBJECT (FIND READBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	THROUGH OBJECT = V-LOOK-THRU>
<SYNTAX READ OBJECT (FIND READBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	TO OBJECT = V-READ-TO>
<VERB-SYNONYM READ SKIM>

<SYNTAX RELEASE OBJECT (MANY HELD) = V-LET-GO>

<SYNTAX REMOVE OBJECT (FIND WORNBIT) = V-REMOVE>
<SYNTAX REMOVE OBJECT FROM OBJECT = V-REMOVE-FROM>
<VERB-SYNONYM REMOVE DOFF SHED>

<SYNTAX REPLACE OBJECT = V-REPLACE>

<SYNTAX RESET OBJECT = V-RESET>

<SYNTAX RIDE OBJECT = V-RIDE>
<SYNTAX RIDE IN OBJECT = V-RIDE>
<SYNTAX RIDE ON OBJECT = V-RIDE>

<SYNTAX SAY OBJECT (FIND RLANDBIT) = V-SAY>
; <SYNTAX SAY TO OBJECT (FIND ACTORBIT) (IN-ROOM) = V-TELL>
<VERB-SYNONYM SAY TALK SPEAK UTTER ; "PROCLAIM MAYBE">

<SYNTAX SCRAPE OFF OBJECT = V-SCRAPE-OFF>
<SYNTAX SCRAPE OBJECT OFF OBJECT = V-SCRAPE-OFF>

<SYNTAX SEARCH OBJECT = V-SEARCH>
<SYNTAX SEARCH IN OBJECT = V-SEARCH>
<SYNTAX SEARCH FOR OBJECT = V-FIND>
<SYNTAX SEARCH UNDER OBJECT = V-LOOK-UNDER>
<VERB-SYNONYM SEARCH RUMMAGE FRISK RANSACK>

; <SYNTAX SEND FOR OBJECT = V-SEND>

<SYNTAX SHAKE OBJECT = V-SHAKE>
<VERB-SYNONYM SHAKE JOSTLE RATTLE>

;<SYNTAX SHARPEN OBJECT WITH OBJECT ; (FIND TOOLBIT) (HAVE) = V-SHARPEN>
;<VERB-SYNONYM SHARPEN HONE>

<SYNTAX SHOOT OBJECT (HELD CARRIED ON-GROUND IN-ROOM) = V-SHOOT>
<SYNTAX SHOOT OBJECT (HELD CARRIED ON-GROUND IN-ROOM) AT OBJECT = V-SHOOT>
<SYNTAX SHOOT OBJECT WITH OBJECT (HELD CARRIED ON-GROUND IN-ROOM) = V-SSHOOT>
<VERB-SYNONYM SHOOT FIRE ; DISCHARGE>

<SYNTAX SHOW OBJECT TO OBJECT (FIND ACTORBIT) = V-SHOW>
<SYNTAX SHOW OBJECT (FIND ACTORBIT) OBJECT = V-SSHOW>

<SYNTAX SIT OBJECT (FIND RLANDBIT) (ON-GROUND IN-ROOM) = V-SIT> 
<SYNTAX SIT ON OBJECT (ON-GROUND IN-ROOM) = V-SIT>
<SYNTAX SIT DOWN OBJECT (FIND RLANDBIT) (ON-GROUND IN-ROOM) = V-SIT>
<SYNTAX SIT IN OBJECT ; (FIND VEHBIT) 
	(ON-GROUND IN-ROOM) = V-ENTER>
<SYNTAX SIT AT OBJECT = V-SIT>
<VERB-SYNONYM SIT SQUAT>

<SYNTAX SKI = V-WALK-AROUND PRE-SKI>
<SYNTAX SKI OBJECT = V-SKI PRE-SKI>
<SYNTAX SKI DOWN OBJECT = V-SKI PRE-SKI>

; <SYNTAX SKIP = V-SKIP>
; <VERB-SYNONYM SKIP HOP CAVORT GAMBOL>

<SYNTAX SLEEP = V-SLEEP>
<SYNTAX SLEEP IN OBJECT (IN-ROOM ON-GROUND) = V-LIE-DOWN ; V-BOARD>
<SYNTAX SLEEP ON OBJECT (IN-ROOM ON-GROUND) = V-LIE-DOWN ; V-BOARD>
<VERB-SYNONYM SLEEP NAP SNOOZE REST>

; <SYNTAX SLIDE OBJECT = V-PUSH>
; <SYNTAX SLIDE OBJECT UNDER OBJECT = V-PUT-UNDER>
; <SYNTAX SLIDE OBJECT (IN-ROOM ON-GROUND) OBJECT = V-PUSH-TO>
; <SYNTAX SLIDE OBJECT (IN-ROOM ON-GROUND) TO OBJECT = V-PUSH-TO>

<SYNTAX SMELL OBJECT (FIND RLANDBIT) = V-SMELL>
<VERB-SYNONYM SMELL SNIFF ; WHIFF>

<SYNTAX SPLICE OBJECT = V-SPLICE>
<SYNTAX SPLICE OBJECT WITH OBJECT = V-SPLICE>

<SYNTAX SQUEEZE OBJECT = V-SQUEEZE>
<SYNTAX SQUEEZE OBJECT (HELD) ON OBJECT = V-PUT PRE-PUT>
<VERB-SYNONYM SQUEEZE SQUASH CRUSH>

<SYNTAX STAND = V-STAND>
<SYNTAX STAND UP OBJECT (FIND RLANDBIT) = V-STAND>
<SYNTAX STAND ON OBJECT = V-STAND-ON>
<SYNTAX STAND UNDER OBJECT = V-STAND-UNDER>
<VERB-SYNONYM STAND RISE>

<SYNTAX STOP OBJECT = V-LAMP-OFF>

;<SYNTAX STRIKE OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) WITH OBJECT
	(HELD CARRIED HAVE) = V-KILL>
;<SYNTAX STRIKE OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-KILL>

<SYNTAX SWIM = V-SWIM>
<SYNTAX SWIM OBJECT = V-SWIM>
<SYNTAX SWIM IN OBJECT = V-SWIM>
<SYNTAX SWIM TO OBJECT = V-SWIM>
<SYNTAX SWIM DOWN OBJECT (FIND RLANDBIT) = V-SWIM-DOWN>
<SYNTAX SWIM UP OBJECT (FIND RLANDBIT) = V-SWIM-UP>
<VERB-SYNONYM SWIM BATHE>

<SYNTAX SWING OBJECT ;(HELD CARRIED HAVE) = V-SWING>
<SYNTAX SWING OBJECT (HELD CARRIED HAVE)
	AT OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-SWING>

<SYNTAX SWING ON OBJECT = V-CLIMB-ON>

<SYNTAX TAKE OBJECT (FIND TAKEBIT) (ON-GROUND IN-ROOM MANY) 
	= V-TAKE PRE-TAKE>
<SYNTAX TAKE IN OBJECT (FIND RLANDBIT) (ON-GROUND IN-ROOM) = V-ENTER>
<SYNTAX TAKE OUT OBJECT = V-DISEMBARK>
<SYNTAX TAKE ON OBJECT (ON-GROUND IN-ROOM) = V-CLIMB-ON>
<SYNTAX TAKE UP OBJECT (FIND RLANDBIT) = V-RAISE>
;<SYNTAX TAKE OBJECT (FIND TAKEBIT) (;CARRIED IN-ROOM MANY)
	WITH OBJECT (HELD) = V-TAKE-WITH PRE-TAKE>
<SYNTAX TAKE OBJECT (FIND TAKEBIT) (IN-ROOM CARRIED MANY)
	OUT OBJECT = V-TAKE PRE-TAKE>
<SYNTAX TAKE OBJECT (FIND TAKEBIT) (IN-ROOM CARRIED MANY)
	OFF OBJECT = V-TAKE PRE-TAKE>
<SYNTAX TAKE OBJECT (FIND TAKEBIT) (IN-ROOM CARRIED MANY)
	FROM OBJECT = V-TAKE PRE-TAKE>
<SYNTAX TAKE OBJECT (FIND TAKEBIT) (IN-ROOM CARRIED MANY)
	IN OBJECT = V-TAKE PRE-TAKE>
<SYNTAX TAKE OBJECT (FIND TAKEBIT) (IN-ROOM CARRIED MANY)
	ON OBJECT = V-TAKE PRE-TAKE>
<SYNTAX TAKE OFF OBJECT = V-TAKE-OFF>
<VERB-SYNONYM TAKE GRAB CATCH GET HOLD CARRY SEIZE STEAL CONFISCATE SNATCH>

<SYNTAX TASTE OBJECT = V-TASTE>

<SYNTAX TELL OBJECT (FIND ACTORBIT) (IN-ROOM) = V-TELL>
<SYNTAX TELL OBJECT (FIND ACTORBIT) (IN-ROOM) ABOUT OBJECT = V-TELL>

;<SYNTAX THANK OBJECT = V-THANK> ;"SEM?"
;<SYNTAX THANK = V-THANK>
;<VERB-SYNONYM THANK THANKS ; MERCI>

<SYNTAX THROW OBJECT (HELD MANY CARRIED HAVE) = V-THROW PRE-PUT>
<SYNTAX THROW OBJECT (HELD MANY CARRIED HAVE)
	AT OBJECT (ON-GROUND IN-ROOM) = V-THROW PRE-PUT>
<SYNTAX THROW OBJECT (HELD MANY CARRIED HAVE)
	TO OBJECT (ON-GROUND IN-ROOM) = V-THROW PRE-PUT>
<SYNTAX THROW OBJECT (HELD MANY CARRIED HAVE) OFF OBJECT = V-THROW-OFF>
<SYNTAX THROW OBJECT (HELD MANY CARRIED HAVE) OVER OBJECT = V-THROW-OFF>
<SYNTAX THROW OBJECT (HELD MANY CARRIED HAVE)
	THROUGH OBJECT (ON-GROUND IN-ROOM) = V-PUT PRE-PUT>
<SYNTAX THROW OBJECT (HELD MANY CARRIED HAVE) DOWN OBJECT
	(ON-GROUND IN-ROOM) = V-PUSH-DOWN>
<SYNTAX THROW OBJECT (HELD MANY CARRIED HAVE) IN OBJECT
	(ON-GROUND IN-ROOM) = V-PUT PRE-PUT>
<SYNTAX THROW OBJECT (HELD MANY CARRIED HAVE) ON OBJECT
	(ON-GROUND IN-ROOM) = V-PUT PRE-PUT>
<SYNTAX THROW OBJECT (HELD MANY CARRIED HAVE) OUT OBJECT
	(ON-GROUND IN-ROOM) = V-PUT PRE-PUT>
<VERB-SYNONYM THROW HURL CHUCK TOSS FLING PITCH>

<SYNTAX TIE OBJECT (HELD CARRIED HAVE) TO OBJECT = V-TIE>
<SYNTAX TIE UP OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) WITH OBJECT
	; (FIND TOOLBIT) (ON-GROUND IN-ROOM HELD CARRIED HAVE) = V-TIE-UP>
<VERB-SYNONYM TIE FASTEN SECURE HOOK ATTACH>

;<SYNTAX TIP OVER OBJECT (ON-GROUND IN-ROOM) = V-TIP>
;<SYNTAX TIP OBJECT (ON-GROUND IN-ROOM) = V-TIP>

<SYNTAX TOUCH OBJECT ; (FIND DARKBIT) = V-RUB>
<SYNTAX TOUCH OBJECT WITH OBJECT = V-RUB>
<VERB-SYNONYM TOUCH FEEL PAT PET RUB DISTURB>

; <SYNTAX TUCK IN OBJECT WITH OBJECT (HELD HAVE) = V-COVER>
; <SYNTAX TUCK OBJECT (HELD HAVE) AROUND OBJECT = V-PUT PRE-PUT>

<SYNTAX TURN OBJECT = V-TURN>
<SYNTAX TURN OBJECT (ON-GROUND IN-ROOM) TO OBJECT = V-TURN>
<SYNTAX TURN OBJECT (ON-GROUND IN-ROOM) OBJECT = V-TURN>
<SYNTAX TURN OBJECT (ON-GROUND IN-ROOM) LEFT OBJECT (FIND RLANDBIT) = V-TURN-LEFT>
<SYNTAX TURN OBJECT (ON-GROUND IN-ROOM) RIGHT OBJECT (FIND RLANDBIT) = V-TURN-RIGHT>
;<SYNTAX TURN OBJECT FOR OBJECT = V-TURN>
<SYNTAX TURN OBJECT WITH OBJECT ; (FIND TOOLBIT) (HAVE) = V-TURN>
<SYNTAX TURN ON OBJECT (FIND LIGHTBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	= V-LAMP-ON>
<SYNTAX TURN OFF OBJECT ;(FIND ONBIT)
	(HELD CARRIED ON-GROUND IN-ROOM) = V-LAMP-OFF>
<VERB-SYNONYM TURN TWIST FACE ROTATE FLIP SET SPIN WHIRL ;GYRATE>

<SYNTAX UNLOCK ;(FIND LOCKEDBIT) OBJECT (ON-GROUND IN-ROOM) = V-UNLOCK>
 
<SYNTAX UNLOCK OBJECT (ON-GROUND IN-ROOM) 
	WITH OBJECT (FIND TOOLBIT HELD HAVE) = V-UNLOCK>

<SYNTAX UNROLL OBJECT (ON-GROUND IN-ROOM HELD CARRIED) = V-UNROLL>

<SYNTAX UNTIE OBJECT (ON-GROUND IN-ROOM HELD CARRIED) = V-UNTIE>
;<SYNTAX UNTIE OBJECT (ON-GROUND IN-ROOM)
        WITH OBJECT (FIND TOOLBIT) (HAVE) = V-UNLOCK>
<SYNTAX UNTIE OBJECT (ON-GROUND IN-ROOM HELD CARRIED) FROM OBJECT = V-UNTIE>
<VERB-SYNONYM UNTIE FREE UNFASTEN UNATTACH UNHOOK UNDO DETACH>

<SYNTAX USE OBJECT = V-USE>
<VERB-SYNONYM USE EMPLOY EXPLOIT>

<SYNTAX WAIT = V-WAIT>
<SYNTAX $WAIT OBJECT = V-$WAIT>
<SYNTAX WAIT FOR OBJECT = V-WAIT-FOR>
<VERB-SYNONYM WAIT LOITER Z>

<SYNTAX WAKE OBJECT (FIND RLANDBIT) = V-ALARM>
<SYNTAX WAKE UP OBJECT (FIND RLANDBIT) = V-ALARM>
<VERB-SYNONYM WAKE AWAKE AWAKEN SURPRISE STARTLE ROUSE>

<SYNTAX WALK = V-WALK-AROUND>
<SYNTAX WALK OBJECT = V-WALK>
<SYNTAX WALK IN OBJECT (FIND RLANDBIT) = V-ENTER>
<SYNTAX WALK OUT OBJECT (FIND RLANDBIT) = V-EXIT>
<SYNTAX WALK ON OBJECT = V-STAND-ON>
<SYNTAX WALK OVER OBJECT = V-CROSS>
<SYNTAX WALK THROUGH OBJECT = V-ENTER>
<SYNTAX WALK AROUND OBJECT (FIND RLANDBIT) = V-WALK-AROUND>
<SYNTAX WALK BEHIND OBJECT = V-WALK-AROUND>
<SYNTAX WALK UNDER OBJECT = V-ENTER>
<SYNTAX WALK UP OBJECT (FIND RLANDBIT) (ON-GROUND IN-ROOM) = V-CLIMB-UP>
<SYNTAX WALK DOWN OBJECT (FIND RLANDBIT) (ON-GROUND IN-ROOM) = V-CLIMB-DOWN>
<SYNTAX WALK TO OBJECT = V-WALK-TO>
<SYNTAX WALK OFF OBJECT = V-DISEMBARK>
<VERB-SYNONYM WALK RUN PROCEED STEP ADVANC TRUDGE HIKE TRAMP CRAWL SKIP HOP>

<SYNTAX WATER OBJECT = V-WATER PRE-WATER>
<SYNTAX WATER OBJECT WITH OBJECT (HAVE) = V-WATER PRE-WATER>

; <SYNTAX WAVE OBJECT (FIND ACTORBIT) = V-WAVE>
<SYNTAX WAVE AT OBJECT ; (FIND ACTORBIT) = V-WAVE-AT>
<SYNTAX WAVE TO OBJECT ; (FIND ACTORBIT) = V-WAVE-AT>
; <SYNTAX WAVE OBJECT (HELD CARRIED) AT OBJECT = V-WAVE-AT> 
<VERB-SYNONYM WAVE NOD SMILE LAUGH GRIN SNEER ; "MOTION BRANDISH BECKON" >

<SYNTAX WEAR OBJECT = V-WEAR>
<VERB-SYNONYM WEAR DON>

;<SYNTAX WHAT OBJECT = V-WHAT>
;<SYNTAX WHAT ABOUT OBJECT = V-WHAT-ABOUT>
;<VERB-SYNONYM WHAT WHATS WHAT\'S>

; <SYNTAX WHERE OBJECT = V-WHERE>
; <VERB-SYNONYM WHERE WHERES>

; <SYNTAX WHO OBJECT = V-WHO>
; <VERB-SYNONYM WHO WHOS>

; <SYNTAX WHY = V-WHY>
; <SYNTAX WHY OBJECT = V-WHY>

<SYNTAX YELL OBJECT (FIND RLANDBIT) = V-YELL>
<SYNTAX YELL AT OBJECT = V-YELL>
<SYNTAX YELL TO OBJECT = V-YELL>
<VERB-SYNONYM YELL SCREAM SHOUT HOWL>

<SYNTAX YES = V-HELLO>
<SYNTAX YES OBJECT (FIND ACTORBIT) = V-HELLO>
<VERB-SYNONYM YES Y AYE OK OKAY SURE YUP AFFIRM POSITI NO NAY NEGATIVE NOPE NAW>
