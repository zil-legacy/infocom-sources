"MAIN FILE
Copyright (C) 1987 Infocom, Inc.  All rights reserved."

<CONSTANT MAX-LINES 6>
<CONSTANT MAX-PLAYERS 5>
<CONSTANT MAX-NAME-LENGTH 10>
<CONSTANT INBUF-LENGTH 90>
<CONSTANT LEXV-LENGTH 90>

<GLOBAL ID 0>

<GLOBAL ROUND 0>

<GLOBAL ROUND-TABLE <TABLE (SHARED) 0>>

<GLOBAL MOVE-TABLE
	<ITABLE ,MAX-PLAYERS (SHARED LENGTH)
		'-1>>

<GLOBAL PLAYER-TABLE
	<ITABLE ,MAX-PLAYERS (SHARED LENGTH)
		'<ITABLE ,MAX-NAME-LENGTH (SHARED) 0>>>

<GLOBAL SCORE-TABLE
	<ITABLE ,MAX-PLAYERS (SHARED LENGTH)
		'0>>

<GLOBAL TOTAL-TABLE
	<ITABLE ,MAX-PLAYERS (SHARED LENGTH)
		'0>>

<GLOBAL ROUNDS-TABLE
	<ITABLE ,MAX-PLAYERS (SHARED LENGTH)
		'0>>

<GLOBAL INBUF-TABLE
	<ITABLE ,MAX-PLAYERS (SHARED LENGTH)
		'<ITABLE ,MAX-LINES
			 (SHARED LENGTH)
			 '<ITABLE ,INBUF-LENGTH
				  (SHARED BYTE LENGTH)
				  0>>>>

<GLOBAL LEXV-TABLE
	<ITABLE ,MAX-PLAYERS (SHARED LENGTH)
		'<ITABLE ,MAX-LINES
			 (SHARED LENGTH)
			 '<ITABLE ,LEXV-LENGTH
				  (SHARED LEXV)
				  0 #BYTE 0 #BYTE 0>>>>

<ROUTINE GO ()
	 <REAL-GO>>

<GLOBAL PLMAX ,MAX-PLAYERS>
<GLOBAL MIN-PLAYERS 2>

<ROUTINE REAL-GO ()
	 <CLEAR -1>
	 <COND (<EQUAL? <SERVER 0> 1> ;"am I the server?"
		<COND (<SETG PLMAX <SERVER <- ,MAX-PLAYERS 1>>>
		       <TELL "Server started!  Player limit is " N ,PLMAX CR>
		       <SETG NOISY-SERVER?
			     <YES? "Do you want a noisy server (default N)?">>
		       <SETG MIN-PLAYERS
			     <NUMBER? "Wait for how many players?">>
		       <GO-SERVER>)
		      (T
		       <TELL "Error initializing server!" CR>
		       <QUIT>)>)
	       (T
		<GO-PLAYER>)>>

