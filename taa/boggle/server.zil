<FILE-FLAGS MDL-ZIL?>

<SETG MAX-ALLOWED 0>

<SETG CUR-TIMEOUT 0>

<CONSTANT PACKET <TABLE 0 0>>

<SETG MIN-PLAYERS 2>

<DEFINE I-SERVER ()
  <SETG INPUT-ABORTED? 1>
  T>

<DEFINE BOGGLE-SERVER S ("OPT" (MIN-TO-START:FIX 2) "AUX" (P ,PACKET))
  <COND (<N==? <SERVER 0> 1> <RETURN <> .S>)>
  <SETG MIN-PLAYERS .MIN-TO-START>
  <COND (<SETG MAX-ALLOWED <SERVER ,MAX-PLAYERS>>
	 <GAME4>
	 <REPEAT (IP)
	   <SETG INPUT-ABORTED? 0>
	   <COND (<G? ,CUR-TIMEOUT 0>
		  <SET IP <INPUT ,PLAYER-INPUT ,CUR-TIMEOUT I-SERVER .P>>)
		 (T
		  <SET IP <INPUT ,PLAYER-INPUT <> <> .P>>)>
	   <COND (<0? ,INPUT-ABORTED?>
		  <PROCESS-SERVER-MESSAGE .P>)
		 (T
		  <CHECK-TIMEOUT>)>>)
	(T
	 <TELL "Server initialization failed." CR>
	 <QUIT>)>>

<DEFINE CHECK-TIMEOUT ()
  <COND (<==? ,GAME-STATE ,GS-BOARD-OUT>
	 ; "Waiting for players' moves"
	 <COND (<G? <RTIME <>> <* 10 <+ <* 3 60> 20>>>
		;"Past 3:20, time some of these suckers out."
		<REPEAT ((OFFS 0) TAB)
		  <COND (<==? <ST-STATUS <SET TAB <ZGET ,STATUS-TABLE .OFFS>>>
			      ,ST-ACTIVE>
			 <ST-STATUS .TAB ,ST-BOARD-IN>
			 <COND (<G=? <SETG BOARDS-IN <+ ,BOARDS-IN 1>>
				     ,NACTIVE>
				<DO-DISPLAY>
				<RETURN>)>)>
		  <COND (<G=? <SET OFFS <+ .OFFS 1>> ,MAX-PLAYERS>
			 ; "Should never happen"
			 <DO-DISPLAY>
			 <RETURN>)>>)
	       (T
		; "Wait a little longer"
		<SETG CUR-TIMEOUT 100>)>)
	(<==? ,GAME-STATE ,GS-WAITING-FOR-CHALLENGE>
	 <COND (<G? <RTIME <>> 150>	; "Only 15-second timeout here"
		<DO-CHALLENGE>)>)
	(<==? ,GAME-STATE ,GS-WAITING-FOR-OK>
	 <COND (<AND <G? <RTIME <>> 150>
		     <G=? ,OKS-IN 2>>
		<REPEAT ((OFFS 0) TAB ST)
		  <COND (<AND <N==? <ST-USER-STATUS
				     <SET TAB <ZGET ,STATUS-TABLE .OFFS>>>
				    ,STU-WANT-GAME>
			      <==? <SET ST <ST-STATUS .TAB>>
				   ,ST-JUST-JOINED>>
			 ; "Disable this guy"
			 <ST-STATUS .TAB ,ST-SUSPENDED>
			 <COND (<N==? .ST ,ST-SUSPENDED>
				<SETG NACTIVE <- ,NACTIVE 1>>
				<DIROUT ,D-PLAYER-ON <+ .OFFS 1>>
				<TELL "Your process has been suspended.  Enter CR to rejoin for the next board." CR>
				<DIROUT ,D-PLAYER-OFF>
				<ENDMOVE <+ .OFFS 1>>)>)>
		  <COND (<G=? <SET OFFS <+ .OFFS 1>> ,NPLAYERS>
			 <RETURN>)>>
		<START-ROUND>)
	       (T
		<SETG CUR-TIMEOUT 50>)>)>>

<SETG NPLAYERS 0>
<SETG NACTIVE 0>
<SETG BOARDS-IN 0>
<SETG GAME-STATE 0>
<SETG CHALLENGES-IN 0>
<SETG CHALLENGING 0>
<SETG OKS-IN 0>
<MSETG GS-BOARD-OUT 1>
<MSETG GS-WAITING-FOR-CHALLENGE 2>
<MSETG GS-WAITING-FOR-OK 3>
<SETG ROUND 0>

<DEFINE PROCESS-SERVER-MESSAGE (P "AUX" (MT <ZGET .P 0>) (ID <ZGET .P 1>)
				(TAB <ZGET ,STATUS-TABLE <- .ID 1>>)
				(ST <ST-STATUS .TAB>)
				(UST <ST-USER-STATUS .TAB>))
  <COND (<==? .MT ,M-JOIN>
	 <SETG NPLAYERS <+ ,NPLAYERS 1>>
	 <ST-ROUNDS .TAB 0>
	 <ST-SCORE .TAB 0>
	 <ST-LAST-ROUND .TAB 0>
	 <ST-STATUS .TAB 0>
	 <ST-USER-STATUS .TAB 0>
	 <COND (<==? ,GAME-STATE ,GS-BOARD-OUT>
		<ST-STATUS .TAB ,ST-JUST-JOINED>
		<DIROUT ,D-PLAYER-ON .ID>
		<TELL "The current board has about "
		      N <- 200 </ <RTIME <>> 10>> " seconds left." CR>
		<DIROUT ,D-PLAYER-OFF>
		<ENDMOVE .ID>)
	       (T
		<SETG NACTIVE <+ ,NACTIVE 1>>
		<DIROUT ,D-PLAYER-ON .ID>
		<TELL "A new game will be starting soon." CR>
		<DIROUT ,D-PLAYER-OFF>
		<ENDMOVE .ID>
		<COND (<AND <0? ,ROUND>
			    <G=? ,NPLAYERS ,MIN-PLAYERS>>
		       <START-ROUND>)>)>)
	(<==? .MT ,M-SUSP>
	 <COND (<G? <ST-STATUS .TAB> 0>
		<ST-STATUS .TAB ,ST-SUSPENDED>
		<SETG NACTIVE <- ,NACTIVE 1>>)>)
	(<==? .MT ,M-REJO>
	 <COND (<==? ,GAME-STATE ,GS-BOARD-OUT>
		<ST-STATUS .TAB ,ST-JUST-JOINED>
		<DIROUT ,D-PLAYER-ON .ID>
		<TELL "The current board has about "
		      N <- 200 </ <RTIME <>> 10>> " seconds left." CR>
		<DIROUT ,D-PLAYER-OFF>
		<ENDMOVE .ID>)
	       (T
		<SETG NACTIVE <+ ,NACTIVE 1>>
		<DIROUT ,D-PLAYER-ON .ID>
		<TELL "A new game will be starting soon." CR>
		<DIROUT ,D-PLAYER-OFF>
		<ENDMOVE .ID>)>)
	(<==? .MT ,M-QUIT>
	 <SETG NPLAYERS <- ,NPLAYERS 1>>
	 <COND (<N==? .ST ,ST-SUSPENDED>
		<SETG NACTIVE <- ,NACTIVE 1>>)>)
	(<==? .MT ,M-MOVE>
	 <COND (<==? .ST ,ST-SUSPENDED>
		<ST-STATUS .TAB ,ST-JUST-JOINED>)
	       (<AND <==? .UST ,STU-BOARD-IN>
		     <==? ,GAME-STATE ,GS-BOARD-OUT>>
		; "Claims to have sent us a move"
		<ST-STATUS .TAB ,ST-BOARD-IN>
		<COND (<G=? <SETG BOARDS-IN <+ ,BOARDS-IN 1>>
			    ,NACTIVE>
		       <DO-DISPLAY>)>)
	       (<AND <EQUAL? .UST ,STU-CHALLENGING ,STU-NOT-CHALLENGING>
		     <L? ,GAME-STATE ,GS-WAITING-FOR-OK>>
		<COND (<==? .UST ,STU-CHALLENGING>
		       <SET CHALLENGING <+ ,CHALLENGING 1>>)>
		<COND (<G=? <SETG CHALLENGES-IN <+ ,CHALLENGES-IN 1>> ,NACTIVE>
		       <DO-CHALLENGE>)>)
	       (<==? .UST ,STU-WANT-GAME>
		<COND (<G=? <SETG OKS-IN <+ ,OKS-IN 1>> ,NACTIVE>
		       <START-ROUND>)>)>)>>

; "Display everybody's moves in screen 0, then do SERVERs to turn them loose."
<DEFINE DO-DISPLAY ()
  <REPEAT ((OFFS 0))
    <COND (<==? <ST-STATUS <ZGET ,STATUS-TABLE .OFFS>> ,ST-BOARD-IN>
	   <DIROUT ,D-PLAYER-ON <+ .OFFS 1>>
	   <DISPLAY-WORDS>
	   <DIROUT ,D-PLAYER-OFF>
	   <ENDMOVE <+ .OFFS 1>>)>
    <COND (<G=? <SET OFFS <+ .OFFS 1>> ,NPLAYERS> <RETURN>)>>
  <REPEAT ((OFFS 0))
    <COND (<==? <ST-STATUS <ZGET ,STATUS-TABLE .OFFS>>
		,ST-BOARD-IN>
	   <SERVER <- <+ .OFFS 1>>>)>>
  <SETG GAME-STATE ,GS-WAITING-FOR-CHALLENGE>
  <SETG CUR-TIMEOUT 150>>

<DEFINE START-ROUND ()
  <SETG ROUND <+ ,ROUND 1>>
  <SHAKE>
  <REPEAT ((OFFS 0) TAB ST)
    <COND (<OR <G? <SET ST <ST-STATUS <SET TAB <ZGET ,STATUS-TABLE .OFFS>>>> 0>
	       <==? .ST ,ST-JUST-JOINED>>
	   <COND (<==? .ST ,ST-JUST-JOINED>
		  <SETG NACTIVE <+ ,NACTIVE 1>>)>
	   <ST-STATUS .TAB ,ST-ACTIVE>
	   <ST-ROUNDS .TAB <+ <ST-ROUNDS .TAB> 1>>
	   <SERVER <- <+ .OFFS 1>>>)>
    <COND (<G=? <SET OFFS <+ .OFFS 1>> ,MAX-ALLOWED>
	   <RETURN>)>>
  <RTIME T>
  ; "Timeout after three minutes, if nothing comes in.  We can then start
     timing out individual boards if needed."
  <SETG CUR-TIMEOUT 1800>
  <SETG GAME-STATE ,GS-BOARD-OUT>
  <SETG CHALLENGES-IN 0>
  <SETG CHALLENGING 0>
  <SETG BOARDS-IN 0>
  <SETG OKS-IN 0>>

<DEFINE DISPLAY-WORDS ("AUX" (ID 0) TAB)
	<REPEAT ()
		<SET TAB <ZGET ,STATUS-TABLE .ID>>
		<HLIGHT ,H-UNDER>
		<PRINT-NAME <ST-NAME .TAB>>
		<HLIGHT ,H-NORMAL>
		<TELL ":  ">
		<REPRINT-WORDS <ST-BUFS .TAB>>
		<COND (<G=? <SET ID <+ .ID 1>> ,NACTIVE>
		       <RETURN>)>>>

<DEFINE PRINT-NAME (TBL "AUX" (CNT 0) CHR)
	<REPEAT ()
		<COND (<ZERO? <SET CHR <GETB .TBL 0>>> <RETURN>)
		      (ELSE
		       <PRINTC .CHR>
		       <COND (<G? <SET CNT <+ .CNT 1>> 8>
			      <RETURN>)>)>>>

<MSETG SCORE-Y 2>
<MSETG SCORE-X 50>

<DEFINE DISPLAY-SCORES ("AUX" (ID 0) TAB (Y ,SCORE-Y))
	<SCREEN 1>
	<CURSET .Y <+ 10 ,SCORE-X>>
	<HLIGHT ,H-UNDER>
	<TELL "Last Tot. Games">
	<HLIGHT ,H-NORMAL>
	<REPEAT ()
		<CURSET <SET Y <+ .Y 1>> ,SCORE-X>
		<ERASE 1>
		<SET TAB <ZGET ,STATUS-TABLE .ID>>
		<PRINT-NAME <ST-NAME .TAB>>
		<CURSET .Y <+ ,SCORE-X 10>>
		<PRINT-NUM <ST-LAST-ROUND .TAB>>
		<PRINT-NUM <ST-SCORE .TAB>>
		<PRINT-NUM <ST-ROUNDS .TAB>>
		<COND (<G=? <SET ID <+ .ID 1>> ,NACTIVE>
		       <RETURN>)>>
	<SCREEN 0>>

<DEFINE PRINT-NUM (N)
	<COND (<L? .N 10> <TELL "   ">)
	      (<L? .N 100> <TELL "  ">)
	      (<L? .N 1000> <TELL " ">)>
	<PRINTN .N>>

<DEFINE DO-CHALLENGE ()
	<>>