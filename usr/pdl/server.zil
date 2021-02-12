"SERVER FILE for ARENA
Copyright (C) 1987 Infocom, Inc.  All rights reserved."

<GLOBAL NOISY-SERVER? <>>

<CONSTANT B-WAITING 0>	;"waiting to enter a game"
<CONSTANT B-READY 1>	;"ready for next game"
			;"tray is set up"
<CONSTANT B-MOVED 2>	;"sent words to server"
			;"score and results sent"
<CONSTANT B-CHALLENGE 3>	;"challenging words"

<GLOBAL STATE-NAMES <TABLE "not in" "waiting" "ready" "moved" "challenge">>

<ROUTINE GO-SERVER ("AUX" CUR-MAP TEMP ID (1ST? T))
	 <GAME4>
	 <COMPUTER-JOINS>
	 <REPEAT ()
		 <COND (.1ST?
			<SET 1ST? <>>
			<COND (,NOISY-SERVER?
			       <TELL "Waiting for " N ,MIN-PLAYERS "." CR>)>
			<WAIT-FOR ,B-WAITING 3000 ,MIN-PLAYERS>
			<SET-STATE ,B-WAITING ,B-READY>)
		       (ELSE
			<COND (,NOISY-SERVER?
			       <TELL "Waiting for players to be ready." CR>)>
			<WAIT-FOR ,B-READY>)>
		 <SHAKE>
		 <COND (,NOISY-SERVER?
			<TELL "Waiting for players' words." CR>)>
		 <COMPUTER-WORDS>
		 <WAIT-FOR ,B-MOVED 2100>
		 <CHECK-ALL-WORDS>
		 <CHECK-DUPS>
		 <SCORE-ALL-WORDS>
		 <COND (,NOISY-SERVER?
			<TELL "Waiting for challenges." CR>)>
		 <WAIT-FOR ,B-CHALLENGE 150>>>

"read moves from players, waiting for all players to be in a particular
state. players in the -1 or the b-waiting states are ignored."

<GLOBAL DELAY-TIME <>>

<ROUTINE WAIT-FOR (N "OPT" (TIM 0) (M 0))
	 <UNHANG-ALL>
	 <RTIME T>
	 <SETG DELAY-TIME .TIM>
	 <REPEAT ()
		 <CHECK-SENDS>
		 <COND (<ALL-MOVES? .N .M> <RTRUE>)>>>

"return t if all players in state given, or if second arg non-zero,
return t when m players are in that state."

<ROUTINE ALL-MOVES? (N M "AUX" (ID <GET ,MOVE-TABLE 0>) S (CNT 0))
	 <REPEAT ()
		 <COND (<AND <NOT <EQUAL? .ID ,COMPUTER-ID>>
			     <EQUAL? <SET S <GET ,MOVE-TABLE .ID>> .N>>
			<SET CNT <+ .CNT 1>>
			<COND (<AND <NOT <ZERO? .M>>
				    <EQUAL? .CNT .M>>
			       <RTRUE>)>)
		       (<G? .S 0> <RFALSE>)>
		 <COND (<ZERO? <SET ID <- .ID 1>>>
			<RTRUE>)>>>

"unhang all players"

<ROUTINE UNHANG-ALL ("AUX" (ID <GET ,MOVE-TABLE 0>))
	 <REPEAT ()
		 <COND (<AND <NOT <EQUAL? .ID ,COMPUTER-ID>>
			     <G? <GET ,MOVE-TABLE .ID> 0>>
			<SERVER <- .ID>>)>
		 <COND (<ZERO? <SET ID <- .ID 1>>>
			<RTRUE>)>>>

<ROUTINE SET-STATE (OLD NEW "AUX" (ID <GET ,MOVE-TABLE 0>))
	 <REPEAT ()
		 <COND (<AND <NOT <EQUAL? .ID ,COMPUTER-ID>>
			     <EQUAL? <GET ,MOVE-TABLE .ID> .OLD>>
			<PUT ,MOVE-TABLE .ID .NEW>)>
		 <COND (<ZERO? <SET ID <- .ID 1>>>
			<RTRUE>)>>>

<GLOBAL SERVER-INPUT-TABLE <TABLE 0 0>>

<GLOBAL SERVER-TIMED-OUT <>>

<ROUTINE SERVER-TIMEOUT-HANDLER ()
	 <SETG SERVER-TIMED-OUT T>
	 <RTRUE>>

<ROUTINE CHECK-SENDS ("AUX" (TIME-LEFT 0))
	 <COND (,DELAY-TIME
		<SET TIME-LEFT <- ,DELAY-TIME <RTIME 0>>>)>
	 <COND (<G=? .TIME-LEFT 0>
		<SETG SERVER-TIMED-OUT <>>
		<INPUT ,D-MESSAGE-ON
		       .TIME-LEFT
		       <COND (<ZERO? .TIME-LEFT> 0)
			     (ELSE ,SERVER-TIMEOUT-HANDLER)>
		       ,SERVER-INPUT-TABLE>
		<COND (<NOT ,SERVER-TIMED-OUT>
		       <PROCESS-SEND>)>)
	       (ELSE
		<RTRUE>)>>

<ROUTINE PN (ID ACT)
	 <TELL "Player " N .ID " (">
	 <PRINT-NAME <GET ,PLAYER-TABLE .ID>>
	 <TELL ") " .ACT ", state is "
	       <GET ,STATE-NAMES <+ 1 <GET ,MOVE-TABLE .ID>>>
	       "." CR>>

<ROUTINE PROCESS-SEND ("AUX" ID TYPE)
	 <SET ID <GET ,SERVER-INPUT-TABLE 1>>
	 <SET TYPE <GET ,SERVER-INPUT-TABLE 0>>
	 <COND (<EQUAL? .TYPE ,M-JOIN>
		<COND (,NOISY-SERVER? <PN .ID "joining">)>
		<PUT ,MOVE-TABLE .ID ,B-WAITING>
		<ENDMOVE .ID>)
	       (<EQUAL? .TYPE ,M-SUSP>
		<COND (,NOISY-SERVER? <PN .ID "suspended">)>
		<PUT ,MOVE-TABLE .ID -1>)
	       (<EQUAL? .TYPE ,M-REJO>
		<PUT ,MOVE-TABLE .ID ,B-WAITING>
		<COND (,NOISY-SERVER? <PN .ID "re-joining the game">)>)
	       (<EQUAL? .TYPE ,M-QUIT>
		<PUT ,MOVE-TABLE .ID -1>
		<COND (,NOISY-SERVER? <PN .ID "quitting">)>)
	       (<EQUAL? .TYPE ,M-MOVE>
		<COND (,NOISY-SERVER? <PN .ID "sent a move">)>
		<ENDMOVE .ID>)
	       (T
		<TELL "** Bad send: ID=" N .ID "  TYPE=" N .TYPE " **" CR>)>>

<ROUTINE NUMBER? (STR1 "AUX" (C 0))
	 <REPEAT ()
	   <TELL "[" .STR1 " (2-8)] ">
	   <SET C <INPUT 1>>
	   <PRINTC .C>
	   <CRLF>
	   <COND (<AND <G=? .C !\0>
		       <L=? .C !\9>>
		  <SET C <- .C !\0>>
		  <RETURN .C>)
		 (T
		  <TELL "[Please type a number between 2 and 8] ">)>>>

<ROUTINE YES? (STR1 "AUX" (C 0))
	 <REPEAT ()
	   <TELL "[" .STR1 " (Y or N)] ">
	   <SET C <INPUT 1>>
	   <PRINTC .C>
	   <CRLF>
	   <COND (<EQUAL? .C !\N !\n>
		  <RFALSE>)
		 (<EQUAL? .C !\Y !\y>
		  <RTRUE>)
		 (T
		  <TELL "[Please answer yes or no (Y or N)] ">)>>>

<ROUTINE CHECK-ALL-WORDS ("AUX" (ID <GET ,MOVE-TABLE 0>))
	 <REPEAT ()
		 <COND (<G? <GET ,MOVE-TABLE .ID> 0>
			<CHECK-WORDS .ID>)>
		 <COND (<ZERO? <SET ID <- .ID 1>>>
			<RTRUE>)>>>

<ROUTINE SCORE-ALL-WORDS ("AUX" (ID <GET ,MOVE-TABLE 0>))
	 <REPEAT ()
		 <COND (<G? <GET ,MOVE-TABLE .ID> 0>
			<SCORE-WORDS .ID>)>
		 <COND (<ZERO? <SET ID <- .ID 1>>>
			<RTRUE>)>>>
