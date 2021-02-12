<ROUTINE PRESIDENT-F ("OPTIONAL" (ARG 0) "AUX" OBJ X)
 <COND (<==? .ARG ,M-WINNER>
	<COND (<P? FOLLOW>
	       <TELL "\"This administration will set its own course.\"" CR>)
	      (<SET X <COM-CHECK ,PRESIDENT>>
	       <COND (<==? .X ,M-FATAL> <>)
		     (<==? .X ,M-OTHER> ,M-FATAL)
		     (T)>)
	      (T <WHY-ME> ,M-FATAL)>)
       (<P? TELL>
	<COND (<NOT <GRAB-ATTENTION ,PRESIDENT>>
	       ,M-FATAL)>)
       (<P? (ASK-ABOUT CONFRONT SHOW) PRESIDENT>
	<COND (<NOT <GRAB-ATTENTION ,PRESIDENT ,PRSI>>
	       ,M-FATAL)
	      (<EQUAL? ,PRSI ,BUDGET ,POLICY ,FIRST-LADY>
	       <TELL "\"A thousand points of light!\"" CR>)
	      (<SET X <COMMON-ASK-ABOUT ,PRESIDENT ,PRSI>>
	       <COND (<==? .X ,M-FATAL> <>) (T)>)
	      (T <TELL-DUNNO ,PRESIDENT ,PRSI>)>)
       (<VERB? KISS>
	<TELL "\"You're sweet.\"" CR>)
       (T <PERSON-F ,PRESIDENT .ARG>)>>

<ROUTINE COM-CHECK (PER "AUX" W)
	 <COND (<OR <P? HELLO (ROOMS .PER)>
		    <P? DANCE PLAYER>>
		<SET W ,WINNER>
		<SETG WINNER ,PLAYER>
		<PERFORM ,PRSA .PER>
		<SETG WINNER .W>
		T)
	       (<P? (ARREST NO THANKS YES)>
		,M-FATAL)	;"let thru to next handler"
	       (<P? (FOLLOW WALK-TO)>
		<COND (<==? .PER ,BUTLER>
		       <>)
		      (T
		       <TELL
"\"I will go where I please, thank you very much.\"" CR>)>)
	       (<P? LISTEN>
		<COND (<OR <P? * PLAYER>
			   <NOT <IN? ,PRSO ,GLOBAL-OBJECTS>>>
		       <TELL "\"I'm trying to!\"" CR>)>)
	       (<P? SIGN>
		<TELL "You notice that" HE .PER " is ">
		<COND (<EQUAL? .PER ,PRESIDENT> <TELL "lef">)
		      (T <TELL "righ">)>
		<TELL "t-handed." CR>)
	       (<P? KISS>
		<WAKE-UP .PER>
		<TELL
"\"I really don't think this is the proper time or place.\"" CR>)
	       (<P? TAKE>
		<COND (<IN? ,PRSO ,PLAYER>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?GIVE ,PRSO .PER>
		       <RTRUE>)>)
	       (<VERB? EXAMINE LOOK-INSIDE READ>
		<COND (<IN? ,PRSO ,PLAYER>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?SHOW .PER ,PRSO>
		       <RTRUE>)>)
	       (<VERB? FORGIVE>
		<SETG WINNER ,PRSO>
		<PERFORM ,V?SORRY .PER>
		<RTRUE>)
	       (<AND <VERB? GIVE THROW-AT> <FSET? ,PRSI ,PERSONBIT>>
		<SETG WINNER ,PRSI>
		<PERFORM ,V?ASK-FOR .PER ,PRSO>
		<RTRUE>)
	       (<AND <VERB? SGIVE> <FSET? ,PRSO ,PERSONBIT>>
		<SETG WINNER ,PRSO>
		<PERFORM ,V?ASK-FOR .PER ,PRSI>
		<RTRUE>)
	       (<VERB? HELP>
		<COND (<EQUAL? ,PRSO <> ,PLAYER ,PLAYER-NAME>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?ASK .PER>
		       <RTRUE>)
		      (T <RFATAL>)>)
	       (<VERB? FIND SHOW SSHOW>
		<COND (<VERB? SHOW>
		       <SETG PRSA ,V?SSHOW>
		       <SET N ,PRSI>
		       <SETG PRSI ,PRSO>
		       <SETG PRSO .N>)>
		<COND (<IN? ,PRSO ,ROOMS>	;"SHOW ME MY ROOM"
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?WALK-TO ,PRSO>
		       <RTRUE>)
		      (<IN? ,PRSO .PER>
		       <COND (<==? <ITAKE> T>
			      <TELL
CHE .PER " fumbles in" HIS .PER " pocket and produces" HIM ,PRSO "." CR>)>
		       <RTRUE>)
		      (<VERB? FIND>
		       ;<SETG WINNER ,PLAYER>
		       ;<PERFORM ,PRSA ,PRSO>
		       <RFATAL>)>)
	       (<VERB? PLAY>
		<COND (<DOBJ? PIANO>
		       <TELL
"\"I'm not very good at this sort of thing, but...\"|">
		       <RFATAL>)
		      (T <RFALSE>)>)
	       (<VERB? TELL>
		<COND (<DOBJ? PLAYER PLAYER-NAME>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?ASK .PER>
		       <RTRUE>)>)
	       (<VERB? TELL-ABOUT>
		<COND (<FSET? ,PRSO ,PERSONBIT>
		       ;<DOBJ? PLAYER PLAYER-NAME>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?ASK-ABOUT .PER ,PRSI>
		       <RTRUE>)>)
	       (<VERB? STOP WAIT-FOR>
		<COND (<DOBJ? HERE GLOBAL-HERE PLAYER PLAYER-NAME ROOMS>
		       <COND (<==? .PER ,FOLLOWER>
			      <SETG FOLLOWER 0>
			      <TELL "\"As you wish, ">
			      <COND (<PRINT-NAME ,FIRST-NAME> <TELL !\.>)>
			      <TELL "\"" CR>)
			     (T
			      <SETG WINNER ,PLAYER>
			      <PERFORM ,V?$CALL .PER>
			      <RTRUE>)>)>)
	       (<VERB? ;WHAT TALK-ABOUT>
		<SETG WINNER ,PLAYER>
	        <PERFORM ,V?ASK-ABOUT .PER ,PRSO>
		<RTRUE>)>>