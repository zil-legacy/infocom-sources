"SYNTAX for
			      STATIONFALL
	(c) Copyright 1987 Infocom, Inc.  All Rights Reserved."

<BUZZ A AN THE IS ARE AM AND OF THEN ALL ;ONE BUT EXCEPT \. \, \" PLEASE
      THIS THAT PRY HERE SOME MORE G AGAIN OOPS>

<PREP-SYNONYM TO TOWARD>
<PREP-SYNONYM WITH USING>
<PREP-SYNONYM THROUGH THRU>
<PREP-SYNONYM ON ONTO>
<PREP-SYNONYM OUT OUTSIDE>
<PREP-SYNONYM IN INSIDE INTO>
<PREP-SYNONYM UNDER BELOW BENEATH UNDERNEATH>
<PREP-SYNONYM AROUND ALONG>
<PREP-SYNONYM OVER ACROSS>

<SYNONYM ALL BOTH EVERYT>

<SYNONYM NORTH N FORE F>
<SYNONYM SOUTH S AFT>
<SYNONYM EAST E STARBOARD SB>
<SYNONYM WEST W PORT P>
<SYNONYM DOWN D DOWNSTAIRS>
<SYNONYM UP U UPSTAIRS>
<SYNONYM NW NORTHWEST>
<SYNONYM NE NORTHE>
<SYNONYM SW SOUTHWEST>
<SYNONYM SE SOUTHE>

;"game commands"

<SYNTAX VERBOSE = V-VERBOSE>

<SYNTAX BRIEF = V-BRIEF>

<SYNTAX SUPER = V-SUPER-BRIEF>
<VERB-SYNONYM SUPER SUPERBRIEF>

<SYNTAX DIAGNO = V-DIAGNOSE>

<SYNTAX INVENT = V-INVENTORY>
<VERB-SYNONYM INVENT I>

<SYNTAX QUIT = V-QUIT>
<VERB-SYNONYM QUIT Q>

<SYNTAX RESTAR = V-RESTART>

<SYNTAX RESTOR = V-RESTORE>

<SYNTAX SAVE = V-SAVE>

<SYNTAX SCORE = V-SCORE>
<VERB-SYNONYM SCORE STATUS>

<SYNTAX SCRIPT = V-SCRIPT>

<SYNTAX UNSCRIPT = V-UNSCRIPT>

<SYNTAX VERSION = V-VERSION>

<SYNTAX \#RANDOM OBJECT = V-$RANDOM>

<SYNTAX \#COMMAND = V-$COMMAND>

<SYNTAX \#RECORD = V-$RECORD>

<SYNTAX \#UNRECORD = V-$UNRECORD>

<SYNTAX $VERIFY = V-$VERIFY>
<SYNTAX $VERIFY OBJECT = V-$VERIFY>

<SYNTAX $DEBUG = V-$DEBUG>

<SYNTAX $STATION = V-$STATION>

<SYNTAX $KEY = V-$KEY>

;"subtitle real verbs"

<SYNTAX ANSWER = V-ANSWER>
<VERB-SYNONYM ANSWER REPLY>

<SYNTAX APPLAUD = V-APPLAUD>
<SYNTAX APPLAUD OBJECT = V-APPLAUD>
<VERB-SYNONYM APPLAUD CLAP>

<SYNTAX APPLY OBJECT (HELD TAKE) = V-APPLY>
<SYNTAX APPLY OBJECT (HELD MANY) TO OBJECT = V-PUT-ON PRE-PUT>

<SYNTAX APPROA OBJECT = V-WALK-TO>

<SYNTAX ASK OBJECT (FIND ACTORBIT) ABOUT OBJECT = V-ASK-ABOUT>
<SYNTAX ASK OBJECT (FIND ACTORBIT) ON OBJECT = V-ASK-ABOUT>
<SYNTAX ASK OBJECT (FIND ACTORBIT) FOR OBJECT = V-ASK-FOR>

<SYNTAX ATTACK OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-KILL PRE-MUNG>
<SYNTAX ATTACK OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM)
	WITH OBJECT (HELD CARRIED HAVE) = V-KILL PRE-MUNG>
<VERB-SYNONYM ATTACK KILL FIGHT HIT SLAY SLAP STRIKE STAB>

<SYNTAX ATTRACT OBJECT WITH OBJECT (HELD CARRIED HAVE) = V-ATTRACT>

<SYNTAX BITE OBJECT = V-BITE>

<SYNTAX BLOW OUT OBJECT (FIND ONBIT) (TAKE) = V-OFF PRE-TOUCH>

<SYNTAX BOARD OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-ENTER PRE-ENTER>

<SYNTAX BURN OBJECT = V-BURN PRE-TOUCH>
<SYNTAX BURN UP OBJECT = V-BURN PRE-TOUCH>
<SYNTAX BURN OBJECT WITH OBJECT (HAVE) = V-BURN PRE-TOUCH>
<SYNTAX BURN UP OBJECT WITH OBJECT (HAVE) = V-BURN PRE-TOUCH>

;<SYNTAX BUY OBJECT = V-BUY> 
;<SYNTAX BUY OBJECT FROM OBJECT = V-BUY>
;<SYNTAX BUY OBJECT WITH OBJECT = V-BUY-WITH>
;<VERB-SYNONYM BUY PURCHASE>

<SYNTAX CALL OBJECT = V-CALL>
<SYNTAX CALL TO OBJECT = V-CALL>

<SYNTAX CATCH OBJECT (ON-GROUND IN-ROOM) = V-CATCH>
<SYNTAX CATCH OBJECT (ON-GROUND IN-ROOM) IN OBJECT = V-CATCH>
<SYNTAX CATCH OBJECT (ON-GROUND IN-ROOM) WITH OBJECT = V-CATCH>
<VERB-SYNONYM CATCH TRAP>

<SYNTAX CIRCLE OBJECT = V-WALK-AROUND>

<SYNTAX CLIMB OBJECT (ON-GROUND IN-ROOM) = V-CLIMB-UP>
<SYNTAX CLIMB ON OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-CLIMB-ON>
<SYNTAX CLIMB UP OBJECT (FIND RLANDBIT) (ON-GROUND IN-ROOM) = V-CLIMB-UP>
<SYNTAX CLIMB DOWN OBJECT (FIND RLANDBIT) (ON-GROUND IN-ROOM) = V-CLIMB-DOWN>
<SYNTAX CLIMB OUT OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-DISEMBARK>
<SYNTAX CLIMB OFF OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-DISEMBARK>
;<SYNTAX CLIMB OVER OBJECT (ON-GROUND IN-ROOM) = V-CLIMB-OVER>
<SYNTAX CLIMB IN OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-ENTER PRE-ENTER>
<SYNTAX CLIMB THROUGH OBJECT = V-ENTER PRE-ENTER>
<SYNTAX CLIMB UNDER OBJECT = V-CRAWL-UNDER>
<VERB-SYNONYM CLIMB SCALE>

<SYNTAX CLOSE OBJECT (FIND DOORBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	= V-CLOSE PRE-TOUCH>
<SYNTAX CLOSE OFF OBJECT (FIND ACTIVEBIT) (TAKE) = V-OFF PRE-TOUCH>
<VERB-SYNONYM CLOSE SHUT SEAL>

<SYNTAX COME WITH OBJECT = V-FOLLOW>

<SYNTAX COMFORT OBJECT (FIND ACTORBIT) = V-COMFORT>

<SYNTAX COMPAR OBJECT WITH OBJECT = V-COMPARE>
<SYNTAX COMPAR OBJECT TO OBJECT = V-COMPARE>

<SYNTAX CONNECT OBJECT TO OBJECT = V-CONNECT>
<VERB-SYNONYM CONNECT ATTACH>

<SYNTAX COVER OBJECT WITH OBJECT (HELD MANY) = V-SPUT-ON>

<SYNTAX COUNT OBJECT = V-COUNT>

<SYNTAX CROSS OBJECT = V-CROSS>
<VERB-SYNONYM CROSS FORD>

<SYNTAX CRUMPL OBJECT (HELD CARRIED HAVE) = V-CRUMPLE>

<SYNTAX DEMOLI OBJECT (ON-GROUND IN-ROOM) = V-MUNG PRE-MUNG>
<SYNTAX DEMOLI OBJECT WITH OBJECT (HELD CARRIED TAKE) = V-MUNG PRE-MUNG>
<SYNTAX DEMOLI OUT OBJECT (FIND RLANDBIT) = V-MUNG PRE-MUNG>
<SYNTAX DEMOLI DOWN OBJECT = V-MUNG PRE-MUNG>
<VERB-SYNONYM DEMOLI DESTRO DAMAGE BREAK SMASH WRECK POP>

<SYNTAX DESCEN OBJECT (ON-GROUND IN-ROOM) = V-CLIMB-DOWN>

<SYNTAX DIG IN OBJECT = V-DIG>
<SYNTAX DIG THROUGH OBJECT = V-DIG>

<SYNTAX DISCONNECT OBJECT = V-DISCONNECT>
<SYNTAX DISCONNECT OBJECT FROM OBJECT = V-DISCONNECT>
<VERB-SYNONYM DISCONNECT DETACH UNPLUG>

<SYNTAX DISEMBARK = V-DISEMBARK>
<SYNTAX DISEMBARK OBJECT (ON-GROUND IN-ROOM) = V-DISEMBARK>
<VERB-SYNONYM DISEMBARK DEBARK DISMOUNT>

<SYNTAX DRESS = V-DRESS>
<SYNTAX DRESS OBJECT = V-DRESS>

<SYNTAX DRILL OBJECT = V-DRILL PRE-DRILL>
<SYNTAX DRILL IN OBJECT = V-DRILL PRE-DRILL>
<SYNTAX DRILL OBJECT WITH OBJECT = V-DRILL PRE-DRILL>
<SYNTAX DRILL THROUGH OBJECT = V-DRILL PRE-DRILL>
<SYNTAX DRILL THROUGH OBJECT WITH OBJECT = V-DRILL PRE-DRILL>
<SYNTAX DRILL OBJECT IN OBJECT = V-DRILL-HOLE>

;<SYNTAX DRIVE OBJECT = V-DRIVE>
;<SYNTAX DRIVE OBJECT OBJECT = V-DRIVE-DIR>

<SYNTAX DROP OBJECT (HELD MANY HAVE) = V-DROP IDROP>
<SYNTAX DROP OBJECT (HELD MANY) DOWN OBJECT = V-PUT PRE-PUT>
<SYNTAX DROP OBJECT (HELD MANY) IN OBJECT = V-PUT PRE-PUT>
<SYNTAX DROP OBJECT (HELD MANY) ON OBJECT = V-PUT-ON PRE-PUT>
<VERB-SYNONYM DROP DUMP RELEASE>

<SYNTAX EAT OBJECT (HELD CARRIED ON-GROUND IN-ROOM) = V-EAT PRE-EAT>
<SYNTAX EAT OBJECT FROM OBJECT = V-EAT PRE-EAT>
<SYNTAX EAT FROM OBJECT = V-EAT-FROM> 
<VERB-SYNONYM EAT DRINK SWALLOW DEVOUR INGEST GOBBLE>

<SYNTAX EMPTY OBJECT (HAVE TAKE) = V-EMPTY PRE-TOUCH>
<SYNTAX EMPTY OUT OBJECT (HAVE TAKE) = V-EMPTY PRE-TOUCH>
<SYNTAX EMPTY OBJECT (HAVE TAKE) OVER OBJECT = V-EMPTY PRE-TOUCH>
<SYNTAX EMPTY OBJECT (HAVE TAKE) ON OBJECT = V-EMPTY PRE-TOUCH>
<SYNTAX EMPTY OBJECT (HAVE TAKE) IN OBJECT = V-EMPTY PRE-TOUCH>
<SYNTAX EMPTY OBJECT (HAVE TAKE) TO OBJECT = V-EMPTY PRE-TOUCH>
<SYNTAX EMPTY OBJECT (MANY) FROM OBJECT (HAVE TAKE) = V-EMPTY-FROM>
<SYNTAX EMPTY OBJECT (MANY) OUT OBJECT (HAVE TAKE) = V-EMPTY-FROM>
<SYNTAX EMPTY OBJECT (HAVE TAKE) THROUGH OBJECT = V-EMPTY-FROM>

<SYNTAX ENTER = V-IN>
<SYNTAX ENTER OBJECT = V-ENTER>

<SYNTAX EXAMINE OBJECT (HELD CARRIED ON-GROUND IN-ROOM)	= V-EXAMINE PRE-LOOK>
;<SYNTAX EXAMINE IN OBJECT (HELD CARRIED IN-ROOM ON-GROUND)
	= V-LOOK-INSIDE PRE-LOOK>
;<SYNTAX EXAMINE ON OBJECT (HELD CARRIED IN-ROOM ON-GROUND)
	= V-LOOK-INSIDE PRE-LOOK>
;<SYNTAX EXAMINE FOR OBJECT = V-FIND>
<VERB-SYNONYM EXAMINE INSPECT DESCRIBE STUDY OBSERVE WATCH>

<SYNTAX EXERCISE = V-EXERCISE>

<SYNTAX EXIT = V-EXIT>
<SYNTAX EXIT OBJECT = V-EXIT>
<VERB-SYNONYM EXIT DEPART WITHDR>

<SYNTAX EXTINGUISH OBJECT (FIND ACTIVEBIT) (TAKE) = V-OFF PRE-TOUCH>
<VERB-SYNONYM EXTINGUISH DEACTIVATE STOP>

<SYNTAX FEED OBJECT (FIND ACTORBIT) = V-FEED>
<SYNTAX FEED OBJECT (MANY HELD HAVE) TO OBJECT (FIND ACTORBIT) (ON-GROUND)
	= V-GIVE PRE-GIVE>
<SYNTAX FEED OBJECT (FIND ACTORBIT) (ON-GROUND) OBJECT (MANY HELD HAVE)
	= V-SGIVE>

<SYNTAX FILL OBJECT (FIND CONTBIT) (HELD CARRIED HAVE) = V-FILL>
<SYNTAX FILL OBJECT (FIND CONTBIT) (HELD CARRIED HAVE) WITH OBJECT = V-FILL>

<SYNTAX FIND OBJECT = V-FIND>
<VERB-SYNONYM FIND SEEK>

<SYNTAX FIX OBJECT = V-FIX>
<SYNONYM FIX REPAIR>

<SYNTAX FLATTEN OBJECT = V-FLATTEN>
<VERB-SYNONYM FLATTEN UNCRUMPLE STRAIGHTEN>

<SYNTAX FOLLOW OBJECT = V-FOLLOW>
<VERB-SYNONYM FOLLOW PURSUE CHASE>

<SYNTAX FOOTNOTE OBJECT = V-FOOTNOTE>

<SYNTAX GREET OBJECT (FIND ACTORBIT) = V-GREET>

<SYNTAX GO OBJECT = V-WALK>
<SYNTAX GO IN OBJECT = V-ENTER>
<SYNTAX GO OUT OBJECT = V-ENTER>
<SYNTAX GO THROUGH OBJECT = V-ENTER>
<SYNTAX GO AROUND OBJECT (FIND RLANDBIT) = V-WALK-AROUND>
<SYNTAX GO UNDER OBJECT = V-CRAWL-UNDER>
<SYNTAX GO BEHIND OBJECT = V-HIDE>
<SYNTAX GO UP OBJECT (ON-GROUND IN-ROOM) = V-CLIMB-UP>
<SYNTAX GO DOWN OBJECT (ON-GROUND IN-ROOM) = V-CLIMB-DOWN>
<SYNTAX GO TO OBJECT = V-WALK-TO>
<SYNTAX GO AWAY OBJECT (FIND RLANDBIT) = V-LEAVE>
<SYNTAX GO WITH OBJECT = V-FOLLOW>

<SYNTAX HAND OBJECT (MANY HELD HAVE) TO OBJECT (FIND ACTORBIT) (ON-GROUND)
	= V-GIVE PRE-GIVE>
<SYNTAX HAND OBJECT (FIND ACTORBIT) (ON-GROUND) OBJECT (MANY HELD HAVE)
	= V-SGIVE>
<SYNTAX HAND UP OBJECT (FIND RLANDBIT) = V-GIVE-UP>
<SYNTAX HAND OBJECT (MANY HELD HAVE) BACK OBJECT (FIND ACTORBIT) (ON-GROUND)
	= V-GIVE PRE-GIVE>
<VERB-SYNONYM HAND GIVE SELL DONATE OFFER>

<SYNTAX HEAR OBJECT = V-LISTEN>

<SYNTAX HELLO = V-HELLO>
<SYNTAX HELLO OBJECT = V-HELLO>
<VERB-SYNONYM HELLO HI>

<SYNTAX HELP = V-HELP>
<SYNTAX HELP OBJECT = V-SAVE-SOMETHING>
<VERB-SYNONYM HELP HINT HINTS>

<SYNTAX HIDE = V-HIDE>
<SYNTAX HIDE UNDER OBJECT = V-HIDE>
<SYNTAX HIDE BEHIND OBJECT = V-HIDE>

<SYNTAX HUG OBJECT (FIND ACTORBIT) = V-HUG PRE-TOUCH>

<SYNTAX JUMP = V-LEAP>
<SYNTAX JUMP OVER OBJECT = V-LEAP>
<SYNTAX JUMP IN OBJECT = V-ENTER>
<SYNTAX JUMP FROM OBJECT = V-LEAP-OFF>
<SYNTAX JUMP OFF OBJECT = V-LEAP-OFF>
<SYNTAX JUMP ON OBJECT = V-STAND-ON>
<SYNTAX JUMP OUT OBJECT = V-LEAP-OFF>
<SYNTAX JUMP THROUGH OBJECT = V-ENTER>
<SYNTAX JUMP UP OBJECT (FIND RLANDBIT) = V-LEAP>
<SYNTAX JUMP DOWN OBJECT (FIND RLANDBIT)  = V-LEAP>
<SYNTAX JUMP TO OBJECT = V-LEAP>
<VERB-SYNONYM JUMP LEAP DIVE VAULT>

<SYNTAX KICK OBJECT = V-KICK PRE-TOUCH>

<SYNTAX KISS OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-KISS PRE-TOUCH>

<SYNTAX KNOCK ON OBJECT (FIND DOORBIT) = V-KNOCK>
<SYNTAX KNOCK AT OBJECT (FIND DOORBIT) = V-KNOCK>
<SYNTAX KNOCK DOWN OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM)
	= V-KILL PRE-MUNG>
<VERB-SYNONYM KNOCK RAP>

<SYNTAX LAUNCH OBJECT = V-LAUNCH>

<SYNTAX LEAVE = V-LEAVE>
<SYNTAX LEAVE OBJECT = V-LEAVE>
<SYNTAX LEAVE OBJECT (HELD MANY) IN OBJECT = V-PUT PRE-PUT>
<SYNTAX LEAVE OBJECT (HELD MANY) ON OBJECT = V-PUT-ON PRE-PUT>

<SYNTAX LET GO OBJECT (HELD MANY HAVE) = V-DROP IDROP>

<SYNTAX LIE ON OBJECT (FIND VEHBIT) = V-LIE-DOWN>
<SYNTAX LIE IN OBJECT (FIND VEHBIT) = V-LIE-DOWN>
<SYNTAX LIE DOWN OBJECT (FIND RLANDBIT) = V-LIE-DOWN>

<SYNTAX LIGHT OBJECT (FIND LIGHTBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	= V-ON PRE-TOUCH>

<SYNTAX LISTEN = V-LISTEN>
<SYNTAX LISTEN TO OBJECT = V-LISTEN>

<SYNTAX LOCK OBJECT = V-LOCK>
<SYNTAX LOCK OBJECT (ON-GROUND IN-ROOM) WITH OBJECT = V-LOCK>

<SYNTAX LOOK = V-LOOK>
<SYNTAX LOOK AROUND OBJECT (FIND RLANDBIT) = V-LOOK>
<SYNTAX LOOK DOWN OBJECT (FIND RLANDBIT) = V-LOOK-DOWN PRE-LOOK>
<SYNTAX LOOK UP OBJECT (FIND RLANDBIT) = V-LOOK-UP PRE-LOOK>
<SYNTAX LOOK AT OBJECT (HELD CARRIED ON-GROUND IN-ROOM) = V-EXAMINE PRE-LOOK>
<SYNTAX LOOK THROUGH OBJECT = V-LOOK-INSIDE PRE-LOOK>
<SYNTAX LOOK OUT OBJECT = V-LOOK-INSIDE PRE-LOOK>
<SYNTAX LOOK UNDER OBJECT = V-LOOK-UNDER PRE-LOOK>
<SYNTAX LOOK BEHIND OBJECT = V-LOOK-BEHIND PRE-LOOK>
<SYNTAX LOOK IN OBJECT (HELD CARRIED ON-GROUND IN-ROOM)
	= V-LOOK-INSIDE PRE-LOOK>
<SYNTAX LOOK ON OBJECT = V-EXAMINE PRE-LOOK>
<SYNTAX LOOK TO OBJECT = V-EXAMINE PRE-LOOK>
<SYNTAX LOOK FOR OBJECT = V-FIND>
<SYNTAX LOOK OVER OBJECT = V-LOOK-OVER PRE-LOOK>
<SYNTAX LOOK OBJECT = V-CHASTISE>
<VERB-SYNONYM LOOK L>

<SYNTAX LOWER OBJECT = V-LOWER>

<SYNTAX MAYBE = V-MAYBE>

<SYNTAX MEASURE OBJECT = V-MEASURE>

<SYNTAX MOVE OBJECT (ON-GROUND IN-ROOM) = V-MOVE PRE-TOUCH>
<SYNTAX MOVE OBJECT OBJECT = V-PUSH-DIR>
<SYNTAX MOVE AROUND OBJECT (FIND RLANDBIT) = V-WALK-AROUND>
<SYNTAX MOVE UP OBJECT (ON-GROUND IN-ROOM) = V-RAISE PRE-TOUCH>
<SYNTAX MOVE IN OBJECT = V-MOVE PRE-TOUCH>
<SYNTAX MOVE OBJECT TO OBJECT = V-MOVE PRE-TOUCH>
<VERB-SYNONYM MOVE PULL LEAD>

<SYNTAX NO = V-NO>
<VERB-SYNONYM NO NOPE UH-UH NAH>

<SYNTAX OPEN OBJECT (FIND DOORBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	= V-OPEN PRE-TOUCH>
<SYNTAX OPEN UP	OBJECT (FIND DOORBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	= V-OPEN PRE-TOUCH>
<SYNTAX OPEN OBJECT (FIND DOORBIT) (HELD CARRIED ON-GROUND IN-ROOM)
	WITH OBJECT (ON-GROUND IN-ROOM HELD CARRIED HAVE) = V-OPEN PRE-TOUCH>
<VERB-SYNONYM OPEN UNSEAL>

;<SYNTAX PAY FOR OBJECT = V-BUY>

<SYNTAX PICK OBJECT = V-PICK>
<SYNTAX PICK OBJECT WITH OBJECT = V-PICK>
<SYNTAX PICK UP OBJECT (FIND TAKEBIT) (ON-GROUND MANY) = V-PICK-UP PRE-TAKE>

<SYNTAX PLAY WITH OBJECT (FIND ACTORBIT) = V-PLAY-WITH>
<SYNTAX PLAY OBJECT WITH OBJECT (FIND ACTORBIT) = V-SPLAY-WITH>

<SYNTAX PLUG OBJECT IN OBJECT = V-CONNECT>

<SYNTAX POINT AT OBJECT = V-POINT>
<SYNTAX POINT TO OBJECT = V-POINT>
<SYNTAX POINT OBJECT AT OBJECT = V-POINT>
<SYNTAX POINT OBJECT ON OBJECT = V-POINT>
<SYNTAX POINT OBJECT IN OBJECT = V-POINT>
<VERB-SYNONYM POINT SHINE AIM>

<SYNTAX POUR OBJECT (HELD CARRIED) ON OBJECT = V-POUR>
<SYNTAX POUR OBJECT (HELD CARRIED) IN OBJECT = V-POUR>
<SYNTAX POUR OUT OBJECT (HELD CARRIED) IN OBJECT = V-POUR>
<SYNTAX POUR OBJECT (HELD CARRIED) FROM OBJECT = V-POUR>
<SYNTAX POUR OBJECT (HELD CARRIED) OUT OBJECT = V-POUR>
<VERB-SYNONYM POUR SPILL>

<SYNTAX PRAY = V-PRAY>
<SYNTAX PRAY FOR OBJECT = V-PRAY>

<SYNTAX PUSH OBJECT = V-PUSH>
<SYNTAX PUSH OBJECT OBJECT = V-PUSH-DIR>
<SYNTAX PUSH UP OBJECT = V-RAISE PRE-TOUCH>
<SYNTAX PUSH ON OBJECT (IN-ROOM ON-GROUND) = V-PUSH>
<SYNTAX PUSH OBJECT UNDER OBJECT = V-PUT-UNDER>
<SYNTAX PUSH OBJECT IN OBJECT = V-PUSH>
<SYNTAX PUSH OBJECT TO OBJECT = V-PUSH>
<VERB-SYNONYM PUSH PRESS IRON>

<SYNTAX RAISE OBJECT = V-RAISE PRE-TOUCH>
<SYNTAX RAISE UP OBJECT = V-RAISE PRE-TOUCH>
<VERB-SYNONYM RAISE LIFT BOOST>

;<SYNTAX RAPE OBJECT (FIND ACTORBIT) = V-RAPE>

<SYNTAX REACH IN OBJECT (ON-GROUND IN-ROOM) = V-REACH-IN>
<SYNTAX REACH UP OBJECT (ON-GROUND IN-ROOM) = V-REACH-IN>

<SYNTAX READ OBJECT (FIND READBIT) (TAKE) = V-READ PRE-LOOK>
<SYNTAX READ THROUGH OBJECT (FIND READBIT) (TAKE) = V-READ PRE-LOOK>
<SYNTAX READ OBJECT (FIND READBIT) (TAKE) THROUGH OBJECT = V-READ PRE-LOOK>
<SYNTAX READ OBJECT (FIND READBIT) (TAKE) WITH OBJECT = V-READ PRE-LOOK>  
<VERB-SYNONYM READ SKIM BROWSE>

<SYNTAX REMOVE OBJECT (FIND WORNBIT) (MANY) = V-REMOVE>
<SYNTAX REMOVE OBJECT (FIND TAKEBIT) (IN-ROOM CARRIED MANY)
	FROM OBJECT = V-TAKE PRE-TAKE>

<SYNTAX ROLL OBJECT (TAKE) = V-ROLL>

<SYNTAX SAVE OBJECT = V-SAVE-SOMETHING>
<VERB-SYNONYM SAVE RESCUE>

<SYNTAX SAY = V-SAY>

<SYNTAX SCARE OBJECT (FIND ACTORBIT) = V-SCARE>

<SYNTAX SCOLD OBJECT (FIND ACTORBIT) = V-SCOLD>

<SYNTAX SEARCH OBJECT = V-SEARCH PRE-TOUCH>
<SYNTAX SEARCH IN OBJECT = V-SEARCH PRE-TOUCH>
<SYNTAX SEARCH FOR OBJECT = V-FIND>
<SYNTAX SEARCH THROUGH OBJECT = V-SEARCH PRE-TOUCH>
<VERB-SYNONYM SEARCH RUMMAG>

<SYNTAX SHAKE OBJECT (TAKE) = V-SHAKE>
<SYNTAX SHAKE OBJECT WITH OBJECT = V-SHAKE-WITH>

<SYNTAX SHOOT OBJECT = V-SHOOT PRE-SHOOT>
<SYNTAX SHOOT OBJECT WITH OBJECT (HELD CARRIED) = V-SHOOT PRE-SHOOT>
<SYNTAX SHOOT OBJECT (HELD CARRIED) AT OBJECT = V-SSHOOT>
<VERB-SYNONYM SHOOT FIRE BLAST ZAP>

<SYNTAX SHOW OBJECT (HELD MANY) TO OBJECT (FIND ACTORBIT) = V-SHOW>
<SYNTAX SHOW OBJECT (FIND ACTORBIT) OBJECT (HELD MANY) = V-SSHOW>

<SYNTAX SIT ON OBJECT ;(FIND VEHBIT) (ON-GROUND IN-ROOM) = V-CLIMB-ON>
<SYNTAX SIT DOWN OBJECT (FIND RLANDBIT) (ON-GROUND IN-ROOM) = V-SIT>
<SYNTAX SIT IN OBJECT ;(FIND VEHBIT) (ON-GROUND IN-ROOM) = V-CLIMB-ON>

<SYNTAX SKIP = V-SKIP>
<VERB-SYNONYM SKIP HOP>

<SYNTAX SLEEP = V-SLEEP>
<SYNTAX SLEEP IN OBJECT (IN-ROOM ON-GROUND) = V-ENTER PRE-ENTER>
<SYNTAX SLEEP ON OBJECT (IN-ROOM ON-GROUND) = V-ENTER PRE-ENTER>
<VERB-SYNONYM SLEEP DOZE NAP SNOOZE>

<SYNTAX SLICE OBJECT WITH OBJECT (CARRIED HELD) = V-CUT>
<SYNTAX SLICE THROUGH OBJECT WITH OBJECT (CARRIED HELD) = V-CUT>
<VERB-SYNONYM SLICE CUT>

<SYNTAX SLIDE DOWN OBJECT (FIND RLANDBIT) (ON-GROUND IN-ROOM) = V-CLIMB-DOWN>

<SYNTAX SMELL = V-SMELL PRE-SMELL>
<SYNTAX SMELL OBJECT = V-SMELL PRE-SMELL>
<VERB-SYNONYM SMELL SNIFF WHIFF>

<SYNTAX SPRAY OBJECT (TAKE) = V-SPRAY>
<SYNTAX SPRAY OBJECT (TAKE HAVE) AT OBJECT = V-SPRAY>
<SYNTAX SPRAY OBJECT (TAKE HAVE) IN OBJECT = V-SPRAY>
<SYNTAX SPRAY OBJECT WITH OBJECT (TAKE HAVE) = V-SSPRAY>

<SYNTAX STAND = V-STAND>
<SYNTAX STAND UP OBJECT (FIND RLANDBIT) = V-STAND>
<SYNTAX STAND ON OBJECT = V-STAND-ON>
<SYNTAX STAND IN OBJECT = V-STAND-ON>
<SYNTAX STAND BEHIND OBJECT = V-HIDE>
<VERB-SYNONYM STAND RISE>

<SYNTAX START OBJECT = V-ON PRE-TOUCH>
<VERB-SYNONYM START ACTIVA>

<SYNTAX STICK OBJECT (HELD MANY) IN OBJECT = V-PUT PRE-PUT>
<SYNTAX STICK OBJECT (HELD MANY) ON OBJECT = V-PUT-ON PRE-PUT>
<SYNTAX STICK OBJECT (HELD MANY) DOWN OBJECT = V-PUT-ON PRE-PUT>
<SYNTAX STICK OBJECT (HELD CARRIED) AROUND OBJECT = V-SWRAP>
<SYNTAX STICK OBJECT (HELD MANY) OVER OBJECT = V-PUT-ON PRE-PUT>
<SYNTAX STICK DOWN OBJECT (HELD MANY HAVE) = V-DROP IDROP>
<SYNTAX STICK OBJECT UNDER OBJECT = V-PUT-UNDER> 
<SYNTAX STICK ON OBJECT (FIND WEARBIT) (HAVE) = V-WEAR>
<SYNTAX STICK OBJECT BEHIND OBJECT = V-PUT-BEHIND>
<SYNTAX STICK OUT OBJECT (FIND ONBIT) (TAKE) = V-OFF PRE-TOUCH>
<VERB-SYNONYM STICK PUT STUFF INSERT PLACE>

<SYNTAX SWING OBJECT (HELD CARRIED HAVE) = V-SWING>
<SYNTAX SWING OBJECT (HELD CARRIED HAVE) AT OBJECT (FIND ACTORBIT) = V-SWING>

<SYNTAX TAKE OBJECT (FIND TAKEBIT) (ON-GROUND IN-ROOM MANY) = V-TAKE PRE-TAKE>
<SYNTAX TAKE IN OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-ENTER PRE-ENTER>
<SYNTAX TAKE ON OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-ENTER PRE-ENTER>
<SYNTAX TAKE UP OBJECT (FIND RLANDBIT) = V-STAND>
<SYNTAX TAKE DRESSE OBJECT (FIND RLANDBIT) = V-GET-DRESSED>
<SYNTAX TAKE UNDRES OBJECT (FIND RLANDBIT) = V-GET-UNDRESSED>
<SYNTAX TAKE OBJECT (CARRIED IN-ROOM MANY) OUT OBJECT = V-TAKE PRE-TAKE>
<SYNTAX TAKE OBJECT (CARRIED IN-ROOM MANY) OFF OBJECT = V-TAKE PRE-TAKE>
<SYNTAX TAKE OBJECT (IN-ROOM CARRIED MANY) FROM OBJECT = V-TAKE PRE-TAKE>
<SYNTAX TAKE OBJECT (IN-ROOM CARRIED MANY) IN OBJECT = V-TAKE PRE-TAKE>
<SYNTAX TAKE OBJECT (IN-ROOM CARRIED MANY) ON OBJECT = V-TAKE PRE-TAKE>
<SYNTAX TAKE OBJECT (IN-ROOM CARRIED MANY) WITH OBJECT (HAVE) = V-TAKE-WITH>
<SYNTAX TAKE OFF OBJECT (FIND RLANDBIT) (MANY) = V-TAKE-OFF>
<SYNTAX TAKE OUT OBJECT (FIND VEHBIT) (ON-GROUND) = V-DISEMBARK>
<SYNTAX TAKE DOWN OBJECT (FIND VEHBIT) (ON-GROUND) = V-DISEMBARK>
<VERB-SYNONYM TAKE GET GRAB HOLD CARRY>

<SYNTAX TALK TO OBJECT (FIND ACTORBIT) (IN-ROOM) = V-TELL>
<VERB-SYNONYM TALK SPEAK>

<SYNTAX TAP OBJECT = V-TOUCH PRE-TOUCH>
<SYNTAX TAP ON OBJECT = V-KNOCK>

<SYNTAX TASTE OBJECT = V-TASTE>
<VERB-SYNONYM TASTE NIBBLE LICK>

<SYNTAX TELL OBJECT (FIND ACTORBIT) (IN-ROOM) = V-TELL>
<SYNTAX TELL OBJECT (FIND ACTORBIT) ABOUT OBJECT = V-TELL-ABOUT>
<SYNTAX TELL OBJECT OBJECT = V-STELL>

<SYNTAX THANKS OBJECT = V-THANK>
<SYNTAX THANKS = V-THANK>
<VERB-SYNONYM THANKS THANK>

<SYNTAX THROW OBJECT (HELD CARRIED TAKE) = V-THROW IDROP>
<SYNTAX THROW AWAY OBJECT (HELD CARRIED TAKE) = V-THROW IDROP>
<SYNTAX THROW OBJECT (HELD CARRIED) IN OBJECT = V-PUT PRE-PUT>
<SYNTAX THROW OBJECT (HELD CARRIED TAKE) DOWN OBJECT = V-THROW IDROP>
<SYNTAX THROW OBJECT (HELD CARRIED TAKE) AT OBJECT (ON-GROUND IN-ROOM)
	= V-THROW IDROP>
<SYNTAX THROW OBJECT (HELD CARRIED TAKE) TO OBJECT (ON-GROUND IN-ROOM)
	= V-THROW-TO IDROP>
<SYNTAX THROW OBJECT (HELD MANY) OVER OBJECT = V-PUT-ON PRE-PUT>
<SYNTAX THROW OBJECT (ON-GROUND IN-ROOM) OBJECT (HELD CARRIED TAKE) = V-STHROW>
<VERB-SYNONYM THROW HURL TOSS>

<SYNTAX TICKLE OBJECT (FIND ACTORBIT) = V-TICKLE PRE-TOUCH>

<SYNTAX TIE OBJECT (HELD) TO OBJECT = V-TIE>
<SYNTAX TIE OBJECT (HELD) AROUND OBJECT = V-TIE>

<SYNTAX TIME = V-TIME>
<VERB-SYNONYM TIME T>

<SYNTAX TOUCH OBJECT = V-TOUCH PRE-TOUCH>
<SYNTAX TOUCH OBJECT WITH OBJECT = V-TOUCH PRE-TOUCH>
<SYNTAX TOUCH OBJECT ON OBJECT = V-TOUCH PRE-TOUCH>
<SYNTAX TOUCH IN OBJECT (ON-GROUND IN-ROOM) = V-REACH-IN>
<VERB-SYNONYM TOUCH FEEL PAT PET POKE SCRATCH STROKE>

<SYNTAX TURN OBJECT = V-SET PRE-TOUCH> 
<SYNTAX TURN AROUND OBJECT (FIND RLANDBIT) = V-SET PRE-TOUCH>
<SYNTAX TURN OBJECT TO OBJECT = V-SET PRE-TOUCH>
<SYNTAX TURN OBJECT AT OBJECT = V-SET PRE-TOUCH>
<SYNTAX TURN OBJECT OBJECT = V-SET PRE-TOUCH>
<SYNTAX TURN ON OBJECT (FIND LIGHTBIT) = V-ON PRE-TOUCH>
<SYNTAX TURN OFF OBJECT (FIND ACTIVEBIT) (TAKE) = V-OFF PRE-TOUCH>
<VERB-SYNONYM TURN SET TUNE SPIN DIAL SWITCH ROTATE FLIP FLICK>

<SYNTAX TYPE = V-TYPE>
<SYNTAX TYPE OBJECT = V-TYPE>
<SYNTAX TYPE IN OBJECT = V-TYPE>
<SYNTAX TYPE ON OBJECT = V-PUSH> ;"see KEYPAD-F"
<SYNTAX TYPE OBJECT ON OBJECT = V-TYPE>

<SYNTAX UNDRES = V-UNDRESS>
<SYNTAX UNDRES OBJECT = V-UNDRESS>
<VERB-SYNONYM UNDRES STRIP>

<SYNTAX UNLOCK OBJECT = V-UNLOCK>
<SYNTAX UNLOCK OBJECT WITH OBJECT (HAVE) = V-UNLOCK>

<SYNTAX UNTIE OBJECT (ON-GROUND IN-ROOM HELD CARRIED) = V-UNTIE>

<SYNTAX USE OBJECT = V-USE>

<SYNTAX VALIDA OBJECT = V-VALIDATE PRE-VALIDATE>
<SYNTAX VALIDA OBJECT WITH OBJECT (HAVE TAKE) = V-VALIDATE PRE-VALIDATE>
<VERB-SYNONYM VALIDA STAMP>

<SYNTAX WAIT = V-WAIT>
<SYNTAX WAIT FOR OBJECT = V-WAIT-FOR>
<SYNTAX WAIT UNTIL OBJECT = V-WAIT-UNTIL>
<VERB-SYNONYM WAIT Z>

<SYNTAX WAKE OBJECT (FIND RLANDBIT) = V-ALARM>
<SYNTAX WAKE UP OBJECT (FIND RLANDBIT) = V-ALARM>
<VERB-SYNONYM WAKE AWAKE ROUSE>

<SYNTAX WALK = V-WALK-AROUND>
<SYNTAX WALK OBJECT = V-WALK>
<SYNTAX WALK IN OBJECT = V-ENTER>
<SYNTAX WALK OUT OBJECT = V-ENTER>
<SYNTAX WALK ON OBJECT = V-STAND-ON>
<SYNTAX WALK OVER OBJECT = V-ENTER>
<SYNTAX WALK THROUGH OBJECT = V-ENTER>
<SYNTAX WALK AROUND OBJECT (FIND RLANDBIT) = V-WALK-AROUND>
<SYNTAX WALK UNDER OBJECT = V-CRAWL-UNDER>
<SYNTAX WALK BEHIND OBJECT = V-HIDE>
<SYNTAX WALK UP OBJECT (ON-GROUND IN-ROOM) = V-CLIMB-UP>
<SYNTAX WALK DOWN OBJECT (ON-GROUND IN-ROOM) = V-CLIMB-DOWN>
<SYNTAX WALK TO OBJECT = V-WALK-TO>
<SYNTAX WALK AWAY OBJECT (FIND RLANDBIT) = V-LEAVE>
<SYNTAX WALK OBJECT OVER OBJECT = V-RUN-OVER> ;"run tongue over dots"
<VERB-SYNONYM WALK SIDLE RUN PROCEE STEP>

<SYNTAX WASH OBJECT = V-CLEAN>
<SYNTAX WASH UP OBJECT (FIND RLANDBIT) = V-CLEAN>
<SYNTAX WASH OFF OBJECT = V-CLEAN>
<VERB-SYNONYM WASH CLEAN WIPE>

<SYNTAX WEAR OBJECT (FIND WEARBIT) (HAVE) = V-WEAR>
<VERB-SYNONYM WEAR DON>

<SYNTAX WHAT OBJECT = V-WHAT>
<VERB-SYNONYM WHAT WHATS WHAT\' WHO WHOS>

<SYNTAX WHERE OBJECT = V-WHERE>
<VERB-SYNONYM WHERE WHERES>

<SYNTAX WRAP OBJECT IN OBJECT (HELD CARRIED) = V-WRAP>
<SYNTAX WRAP OBJECT (HELD CARRIED) AROUND OBJECT = V-SWRAP>

<SYNTAX YELL = V-YELL>
<SYNTAX YELL AT OBJECT = V-YELL>
<SYNTAX YELL TO OBJECT = V-YELL>
<VERB-SYNONYM YELL SCREAM SHOUT>

<SYNTAX YES = V-YES>
<VERB-SYNONYM YES Y YUP OK OKAY SURE>

<SYNTAX ZORK = V-ZORK>
<VERB-SYNONYM ZORK SNEEZE>