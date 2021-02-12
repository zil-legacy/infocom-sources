"EXTENDED"
<VERSION XZIP>
<ID 0>

<DEFINE STR (TBL)
	<MAPF ,STRING
	      <FUNCTION (C)
		   <COND (<==? .C 0> <MAPSTOP>)
			 (ELSE <ASCII .C>)>>
	      .TBL>>

<BUZZ \. \,>

<ADD-TELL-TOKENS T * *	<PRINT-TABLE .TBL .LEN>
		 B *	<PRINT-BUFFER .TBL>>

;<NEWTYPE STAR ATOM>
;<NEWTYPE MINE ATOM>

<CONSTANT REGION-YPOS 8>
<CONSTANT REGION-XPOS 40>
<CONSTANT REGION-WIDTH 10>
<CONSTANT REGION-HEIGHT 10>

<GLOBAL TREK-GAME
	<TABLE (BYTE LENGTH)
	       %<ASCII !\T> %<ASCII !\R> %<ASCII !\E> %<ASCII !\K> 0>>

<GLOBAL PLAYER <>>

<GLOBAL GALAXY
	<TABLE <ITABLE 100 <>>>>

<GLOBAL REGION <>>

<ROUTINE GO () <TREK>>

<ROUTINE RREF? (Y:FIX X:FIX)
	 <AND <G=? .X 1> <L=? .X ,REGION-WIDTH>
	      <G=? .Y 1> <L=? .Y ,REGION-HEIGHT>>>

<ROUTINE RREF (V:TABLE Y:FIX X:FIX "AUX" O:FIX)
	 <COND (<RREF? .Y .X>
		<SET O <+ <* <- .Y 1> ,REGION-WIDTH> <- .X 1>>>
		<GET .V .O>)>>

<ROUTINE RPUT (V:TABLE Y:FIX X:FIX VAL "AUX" O:FIX)
	 <COND (<RREF? .Y .X>
		<SET O <+ <* <- .Y 1> ,REGION-WIDTH> <- .X 1>>>
		<PUT .V .O .VAL>)>>

<ROUTINE NEW-SHIP (ID:FIX)
	 <SET ID <GET ,SHIPS .ID>>
	 <PUTP .ID ,P?POWER 5000>
	 .ID>

<GLOBAL PLAYERS <ITABLE 8 <>>>

<OBJECT ENTERPRISE
	(DESC "Enterprise")
	(NICK "E")
	(FLAGS CRUISER)
	(POWER 0)
	(SHIPXLOC 0)
	(SHIPYLOC 0)>

<OBJECT LEXINGTON
	(DESC "Lexington")
	(NICK "L")
	(FLAGS CRUISER)
	(POWER 0)
	(SHIPXLOC 0)
	(SHIPYLOC 0)>

<OBJECT HOOD
	(DESC "Hood")
	(NICK "H")
	(FLAGS CRUISER)
	(POWER 0)
	(SHIPXLOC 0)
	(SHIPYLOC 0)>

<OBJECT KENTUCKY
	(DESC "Kentucky")
	(NICK "K")
	(FLAGS CRUISER)
	(POWER 0)
	(SHIPXLOC 0)
	(SHIPYLOC 0)>

<OBJECT DISCOVERY
	(DESC "Discovery")
	(NICK "D")
	(FLAGS CRUISER)
	(POWER 0)
	(SHIPXLOC 0)
	(SHIPYLOC 0)>

<OBJECT CHALLENGER
	(DESC "Challenger")
	(NICK "C")
	(FLAGS CRUISER)
	(POWER 0)
	(SHIPXLOC 0)
	(SHIPYLOC 0)>

<OBJECT ATLANTIS
	(DESC "Atlantis")
	(NICK "A")
	(FLAGS CRUISER)
	(POWER 0)
	(SHIPXLOC 0)
	(SHIPYLOC 0)>

<OBJECT POTEMKIN
	(DESC "Potemkin")
	(NICK "P")
	(FLAGS CRUISER)
	(POWER 0)
	(SHIPXLOC 0)
	(SHIPYLOC 0)>

<OBJECT YAMATO
	(DESC "Yamato")
	(NICK "Y")
	(FLAGS CRUISER)
	(POWER 0)
	(SHIPXLOC 0)
	(SHIPYLOC 0)>

<OBJECT RESOLUTE
	(DESC "Resolute")
	(NICK "R")
	(FLAGS CRUISER)
	(POWER 0)
	(SHIPXLOC 0)
	(SHIPYLOC 0)>

<GLOBAL SHIPS
	<LTABLE ENTERPRISE LEXINGTON HOOD KENTUCKY DISCOVERY
		CHALLENGER ATLANTIS POTEMKIN YAMATO RESOLUTE>>

\

<GLOBAL CMD-LEXV <ITABLE 59 (LEXV) 0 <BYTE 0> <BYTE 0>>>
<GLOBAL CMD-INBUF <ITABLE 127 (BYTE LENGTH) 0>>
<GLOBAL GAME-INBUF <ITABLE 127 (BYTE LENGTH) 0>>

<GLOBAL ID 0>	;"id of player"

<ROUTINE TREK ("AUX" RES (MOVED? T))
	 <DIRIN 5 ,TREK-GAME>
	 <SET RES <GETB ,TREK-GAME 1>>
	 <COND (<L? .RES 100>
		<SETG ID <MAKE-ID <GETB ,TREK-GAME 1>>>
		<SETG REGION <GET ,GALAXY 0>>
		<SETG PLAYER <NEW-SHIP ,ID>>
		<PUT ,PLAYERS ,ID ,PLAYER>
		<CLEAR -1>
		<SPLIT 22>
		<SCREEN 1>
		<NEXT-MESSAGE>
		<TELL "Star Fleet: \"" D ,PLAYER ", welcome to Star Fleet.\"" CR>
		<REGION-PRINT>
		<DIROUT 5 ,GAME-INBUF>
		<TELL " E " N <MOD <GETB 0 56> 10> ;<RANDOM 10>
			"," N <MOD <GETB 0 57> 10> ;<RANDOM 10>>
		<DIROUT -5>
		<REPEAT ()
			<SET MOVED? <TREK-LOOP .MOVED?>>>)
	       (<EQUAL? .RES 101>
		<TELL "Can't establish connection to Star Fleet." CR>
		<QUIT>)
	       (<EQUAL? .RES 102>
		<TELL "Star Fleet: Too late too join task force." CR>
		<QUIT>)
	       (<EQUAL? .RES 103>
		<TELL "Star Fleet: Task force already full." CR>
		<QUIT>)
	       (ELSE <QUIT>)>>

<ROUTINE TREK-LOOP (MOVED? "AUX" CNT)
	 <COND (<READY? 0>
		<SET CNT <READ-COMMAND ,BASIC-CMDS>>
		<COND (<AND .CNT <G? .CNT 0>>
		       <DIROUT 5 ,GAME-INBUF>
		       <TELL " " T ,CMD-INBUF .CNT>
		       <DIROUT -5>)>
		<SET MOVED? T>)
	       (<READY? 5>
		<DIRIN 5>
		<READ ,CMD-INBUF ,CMD-LEXV>
		<DIRIN 0>
		<COND (<G? <GETB ,CMD-LEXV 1> 0>
		       <TREK-COMMAND>)>
		<SET MOVED? T>)>
	 <COND (.MOVED?
		<CMD-PROMPTS <GET ,BASIC-CMDS 1>
			     <GET ,BASIC-CMDS 2>>
		<SET MOVED? <>>)
	       (ELSE
		<WAIT 250>)>
	 .MOVED?>

<ROUTINE MAKE-ID (N:FIX)
	 <COND (<OR <==? .N 1> <==? .N 2>>
		.N)
	       (<==? .N 4> 3)
	       (<==? .N 8> 4)
	       (<==? .N 16> 5)
	       (<==? .N 32> 6)
	       (<==? .N 64> 7)
	       (<==? .N 128> 8)>>

<GLOBAL MSG-YPOS 1>
<CONSTANT BEG-MSG-YPOS 2>
<CONSTANT END-MSG-YPOS 8>

<ROUTINE NEXT-MESSAGE ()
	 <BUFOUT 0>
	 <CURSET <SETG MSG-YPOS <+ ,MSG-YPOS 1>> 0>
	 <COND (<G? ,MSG-YPOS ,END-MSG-YPOS>
		<SETG MSG-YPOS ,BEG-MSG-YPOS>)>>

\

"READING COMMANDS FROM GAME STREAM"

<ROUTINE TREK-COMMAND ("AUX" LEXV:TABLE CNT:FIX ID:FIX WHO:<OR FALSE OBJECT>
		       TBL:<OR FALSE TABLE>)
	 <SET CNT <GETB ,CMD-LEXV 1>>
	 <SET ID <MAKE-ID <GETB ,CMD-INBUF 1>>>
	 <COND (<NOT .ID>
		<NEXT-MESSAGE>
		<TELL "**BAD ID: " N <GETB ,CMD-INBUF 1> CR>)
	       (ELSE
		<COND (<NOT <SET WHO <NTH ,PLAYERS .ID>>>
		       <PUT ,PLAYERS .ID <SET WHO <NEW-SHIP .ID>>>)>
		<SET LEXV <REST ,CMD-LEXV 6>>
		<COND (<SET TBL
			    <INTBL? <GET .LEXV 0>
				    <REST ,TREK-TABLE 2>
				    <GET ,TREK-TABLE 0>>>
		       <APPLY <GET .TBL 1> .WHO <REST .LEXV 4> <- .CNT 1>>)
		      (ELSE
		       <NEXT-MESSAGE>
		       <TELL "**BAD MESSAGE: \"">
		       <PRINT-BUFFER ,CMD-INBUF>
		       <TELL "\" **" CR>)>)>>

\

"COMMANDS FROM GAME STREAM"

<GLOBAL TREK-TABLE
	<LTABLE <VOC "E" BUZZ>  TREK-ENTER
		<VOC "H" BUZZ>  TREK-TALK
		<VOC "M" BUZZ>  TREK-MOVE
		<VOC "P" BUZZ>	TREK-PHASER
		<VOC "T" BUZZ>  TREK-TORP
		<VOC "Q" BUZZ>  TREK-QUIT>>

"Initial appearance"

<ROUTINE TREK-ENTER (WHO BUF:TABLE CNT:FIX)
	 <NEXT-MESSAGE>
	 <TELL D .WHO ": \"Joining the task force.\"" CR>
	 <MOVE-OBJECT .WHO 0 0
		    <NUMBER? .BUF ,CMD-INBUF>
		    <NUMBER? <REST .BUF 8>  ,CMD-INBUF>>>

"Final appearance"

<ROUTINE TREK-QUIT (WHO BUF CNT)
	 <NEXT-MESSAGE>
	 <TELL "Star Fleet: \"" D .WHO " leaving the task force.\"" CR>>

"Ship to Ship"

<ROUTINE TREK-TALK (WHO BUF CNT "AUX" START)
	 <SET START <- <GETB .BUF 3> 1>>
	 <NEXT-MESSAGE>
	 <TELL D .WHO ": \""
	       B <REST ,CMD-INBUF .START>
	       "\"" CR>>

"Move a ship"

<ROUTINE TREK-MOVE (WHO BUF CNT
		    "AUX" TMP (DIR 0) (DST 0))
	 <COND (<SET TMP <NUMBER? .BUF ,CMD-INBUF>>
		<SET DIR .TMP>)>
	 <COND (<SET TMP <NUMBER? <REST .BUF 8> ,CMD-INBUF>>
		<SET DST .TMP>)>
	 <COND (<PROPEL-OBJECT .WHO .DIR .DST>
		<NEXT-MESSAGE>
		<TELL "** Navigation Error **" CR>)>>

<ROUTINE TREK-PHASER (WHO BUF CNT:FIX)
	<NEXT-MESSAGE>
	<TELL "[Ineffective phaser fire from " D .WHO "]" CR>>

<ROUTINE TREK-TORP (WHO BUF CNT:FIX
		    "AUX" TMP (DIR 0) TORP:OBJECT HIT)
	 <COND (<SET TMP <NUMBER? .BUF ,CMD-INBUF>>
		<SET DIR .TMP>)>
	 <SET TORP <MAKE-TORPEDO .WHO>>
	 <COND (<SET HIT <PROPEL-OBJECT .TORP .DIR <>>>
		<TORP-HITS .HIT>)>>

<ROUTINE DISPLAY-SHIP (WHO "OPT" (HIGH <>))
	 <BUFOUT 0>
	 <COND (.HIGH <HLIGHT .HIGH>)>
	 <CURSET <+ ,REGION-YPOS <GETP .WHO ,P?SHIPYLOC>>
		 <+ ,REGION-XPOS <* 2 <GETP .WHO ,P?SHIPXLOC>>>>
	 <DISPLAY-SECTOR .WHO>
	 <COND (.HIGH <HLIGHT 0>)>>

<CONSTANT REVERSE 1>
<CONSTANT BOLD 2>
<CONSTANT UNDERLINE 4>
;<CONSTANT BLINK 8>

<ROUTINE WAIT (N "AUX" X)
	 %<COND (<GASSIGNED? ZILCH>
		 '<DO (I 1 .N) <SET X 0>>)
		(ELSE '<SLEEP </ <FLOAT .X> 1000.0>>)>>

<ROUTINE TORP-HITS (WHO "AUX" X)
	<DISPLAY-SHIP .WHO ,BOLD>
	<WAIT 500>
	<DISPLAY-SHIP .WHO>>

<OBJECT TORPEDO-1
	(DESC "photon torpedo")
	(NICK "o")
	(FLAGS TORPEDO)
	(POWER 500)
	(SHIPXLOC 0)
	(SHIPYLOC 0)>

<ROUTINE MAKE-TORPEDO (FROM)
	 <PUTP ,TORPEDO-1 ,P?SHIPXLOC <GETP .FROM ,P?SHIPXLOC>>
	 <PUTP ,TORPEDO-1 ,P?SHIPYLOC <GETP .FROM ,P?SHIPYLOC>>
	 <PUTP ,TORPEDO-1 ,P?POWER 500>
	 ,TORPEDO-1>

\

"FAKE TRIG"

<DEFINE SINES ("AUX" (DEG -1.0))
	<MAPF ,VECTOR
	      <FUNCTION ("AUX" RAD)
		   <COND (<G? <SET DEG <+ .DEG 1.0>> 90.0>
			  <MAPSTOP>)>
		   <FIX <+ <* <SIN <SET RAD <* .DEG %</ 3.14159 180.0>>>>
			      <FLOAT *77777*>>
			   0.5>>>>>

<GLOBAL SINE-TABLE
	<TABLE !<SINES>>>

<ROUTINE SINE (X)
	 <REPEAT ()
		 <COND (<L? .X 0> <SET X <+ .X 360>>)
		       (<G=? .X 360> <SET X <- .X 360>>)
		       (ELSE <RETURN>)>>
	 <COND (<L? .X 90> <SET X <GET ,SINE-TABLE .X>>)
	       (<L? .X 180> <SET X <GET ,SINE-TABLE <- 180 .X>>>)
	       (<L? .X 270> <SET X <- <GET ,SINE-TABLE <- .X 180>>>>)
	       (ELSE <SET X <- <GET ,SINE-TABLE <- 360 .X>>>>)>
	 <SET X <* 2 .X>>>

<ROUTINE COSINE (X)
	 <SINE <+ .X 90>>>

<GLOBAL X <TABLE 0 0 0 0 0 0>>
<GLOBAL Y <TABLE 0 0 0 0 0 0>>
<GLOBAL DIS <TABLE 0 0 0 0 0 0>>

"Utility for moving things. Returns object hit if hit something, else <>"

<ROUTINE PROPEL-OBJECT (WHO DIR DST
		       "AUX" (1ST? T) (FX <GETP .WHO ,P?SHIPXLOC>)
		       (FY <GETP .WHO ,P?SHIPYLOC>) DX DY R NFX NFY)
	<PUT ,Y 0 <- .FY 1>>
	<PUT ,Y 1 *77777*>
	<PUT ,X 0 <- .FX 1>>
	<PUT ,X 1 *77777*>
	<PUT ,DIS 0 .DST>
	<PUT ,DIS 1 0>
	<SET DX <COSINE .DIR>>
	<SET DY <SINE .DIR>>
	<REPEAT ()
		<COND (<NOT <FSET? .WHO ,TORPEDO>>
		       <PUT ,DIS 2 0>
		       <PUT ,DIS 3 0>
		       <XARITH ,XGRTR? ,DIS>
		       <COND (<ZERO? <GET ,DIS 5>>
			      <RETURN <>>)>)>
		<PUT ,X 2 <COND (<G=? .DX 0> 0)
				(ELSE -1)>>
		<PUT ,X 3 .DX>
		<XARITH ,XADD ,X>
		<PUT ,X 0 <GET ,X 4>>
		<PUT ,X 1 <GET ,X 5>>
		<SET NFX <+ 1 <GET ,X 4>>>
		<PUT ,Y 2 <COND (<G=? .DY 0> 0)
				(ELSE -1)>>
		<PUT ,Y 3 .DY>
		<XARITH ,XSUB ,Y>
		<PUT ,Y 0 <GET ,Y 4>>
		<PUT ,Y 1 <GET ,Y 5>>
		<SET NFY <+ 1 <GET ,Y 4>>>
		<COND (<OR <N==? .FX .NFX>
			   <N==? .FY .NFY>>
		       <COND (<AND .1ST? <FSET? .WHO ,TORPEDO>>
			      <SET FY 0>
			      <SET FX 0>
			      <SET 1ST? <>>)>
		       <COND (<SET R <MOVE-OBJECT .WHO .FY .FX .NFY .NFX>>
			      <COND (<==? .R T> <RETURN <>>)
				    (ELSE <RETURN .R>)>)>
		       <SET FX .NFX>
		       <SET FY .NFY>)>
		<PUTP .WHO ,P?POWER <- <GETP .WHO ,P?POWER> 10>>
		<COND (<NOT <FSET? .WHO ,TORPEDO>>
		       <PUT ,DIS 2 1>
		       <PUT ,DIS 3 0>
		       <XARITH ,XSUB ,DIS>
		       <PUT ,DIS 0 <GET ,DIS 4>>
		       <PUT ,DIS 1 <GET ,DIS 5>>)>>>

"Utility for actually moving a ship/torpedo/etc."

<ROUTINE MOVE-OBJECT (WHO:OBJECT Y:FIX X:FIX NY:FIX NX:FIX "AUX" HIT)
	<COND (<OR <AND <==? .X 0> <==? .Y 0>>
		   <==? <RREF ,REGION .Y .X> .WHO>>
	       <COND (<NOT <RREF? .NY .NX>>
		      <COND (<AND <G? .X 0> <FSET? .WHO ,TORPEDO>>
			     <UPDATE-SECTOR ,REGION .Y .X <>>
			     T)>)
		     (<SET HIT <RREF ,REGION .NY .NX>>
		      <COND (<AND <G? .X 0> <FSET? .WHO ,TORPEDO>>
			     <UPDATE-SECTOR ,REGION .Y .X <>>
			     <PUTP .HIT ,P?POWER
				   <- <GETP .HIT ,P?POWER>
				      <GETP .WHO ,P?POWER>>>)>
		      .HIT)
		     (ELSE
		      <COND (<AND <G? .X 0>
				  <==? <RREF ,REGION .Y .X> .WHO>>
			     <UPDATE-SECTOR ,REGION .Y .X <>>)>
		      <UPDATE-SECTOR ,REGION .NY .NX .WHO>
		      <>)>)>>

<ROUTINE UPDATE-SECTOR (V:TABLE Y:FIX X:FIX WHO)
	<COND (.WHO
	       <PUTP .WHO ,P?SHIPYLOC .Y>
	       <PUTP .WHO ,P?SHIPXLOC .X>)>
	<RPUT .V .Y .X .WHO>
	<BUFOUT 0>
	<CURSET <+ ,REGION-YPOS .Y>
		<+ ,REGION-XPOS <* 2 .X>>>
	<DISPLAY-SECTOR .WHO>>

<ROUTINE REGION-PRINT ("OPT" (R:TABLE <>)
		      "AUX" CNT (RY:FIX ,REGION-YPOS) (RX:FIX ,REGION-XPOS))
	<COND (<NOT .R> <SET R ,REGION>)>
	<BUFOUT 0>
	<CURSET .RY .RX>
	<TELL "   1 2 3 4 5 6 7 8 9 10">
	<DO (CNT 0 99)
	    <COND (<0? <MOD .CNT 10>>
		   <CURSET <SET RY <+ .RY 1>> .RX>
		   <COND (<L? </ .CNT 10> 9>
			  <TELL " ">)>
		   <TELL N <+ 1 </ .CNT 10>>>)>
	    <DISPLAY-SECTOR <GET .R .CNT>>>>

<ROUTINE DISPLAY-SECTOR (E)
	 <TELL " ">
	 <COND (.E
		<COND (.E <TELL <GETP .E ,P?NICK>>)
		      ;(<TYPE? .E STAR> <TELL "*">)
		      ;(<TYPE? .E MINE> <TELL "+">)
		      (ELSE
		       <TELL "?">)>)
	       (ELSE <TELL ".">)>>

<ROUTINE NUMBER? (PTR BUF "AUX" CNT BPTR CHR (SUM 0))
	 <SET CNT <GETB .PTR 2>>
	 <SET BPTR <GETB .PTR 3>>
	 <REPEAT ()
		 <COND (<L? <SET CNT <- .CNT 1>> 0> <RETURN>)
		       (T
			<SET CHR <GETB .BUF .BPTR>>
			<COND (<G? .SUM 10000> <RFALSE>)
			      (<AND <L? .CHR 58> <G? .CHR 47>>
			       <SET SUM <+ <* .SUM 10> <- .CHR 48>>>)
			      (T <RFALSE>)>
			<SET BPTR <+ .BPTR 1>>)>>
	 <COND (<G? .SUM 10000> <RFALSE>)>
	 .SUM>

<ROUTINE PRINT-TABLE (TBL CNT "AUX" WRD)
	 <DO (N 1 .CNT)
	     <PRINTC <GETB .TBL .N>>>>

<ROUTINE PRINT-BUFFER (BUF "AUX" CHR)
	 <REPEAT ()
		 <SET CHR <GETB .BUF 1>>
		 <COND (<ZERO? .CHR> <RETURN>)
		       (ELSE <PRINTC .CHR>)>
		 <SET BUF <REST .BUF>>>>

<ROUTINE COPY-BUFFER (BUF "OPT" (L 2) "AUX" CHR)
	 <PUTB ,CMD-INBUF .L %<ASCII !\ >>
	 <SET L <+ .L 1>>
	 <REPEAT ()
		 <SET CHR <GETB .BUF 1>>
		 <PUTB ,CMD-INBUF .L .CHR>
		 <COND (<EQUAL? .CHR 0 13 10> <RETURN>)>
		 <SET L <+ .L 1>>
		 <SET BUF <REST .BUF>>>
	 .L>

\

"USER COMMAND READING"

<GLOBAL P-LEXV <ITABLE 59 (<BYTE LENGTH> <BYTE ZERO>) 0 <BYTE 0> <BYTE 0>>>
<GLOBAL P-INBUF <ITABLE 127 (BYTE LENGTH) 0>>

<ROUTINE READ-COMMAND (CMDS "AUX" CHR TBL R)
	 <REPEAT ()
		 <CMD-PROMPTS <GET .CMDS 1> <GET .CMDS 2>>
		 <COND (<AND <G=? <SET CHR <INPUT 1>> %<ASCII !\a>>
			     <L=? .CHR %<ASCII !\z>>>
			<SET CHR <- .CHR 32>>)>
		 <COND (<SET TBL
			     <INTBL? .CHR
				     <REST .CMDS 2>
				     <GET .CMDS 0>>>
			<COND (<SET R <APPLY <GET .TBL 1>>>
			       <RETURN .R>)>)>>>

<CONSTANT CMD-YPOS 22>

<ROUTINE CMD-PROMPTS (PROMPT HELP)
	 <SPLIT 24>
	 <BUFOUT 0>
	 <CURSET <+ ,CMD-YPOS 1> 0>
	 <TELL .HELP>
	 <ERASE 1>
	 <CURSET ,CMD-YPOS 0>
	 <TELL .PROMPT>
	 <ERASE 1>
	 <BUFOUT 1>
	 <SPLIT 22>>

<GLOBAL BASIC-CMDS
	<LTABLE "Command? "
		"\"=TALK M=MOVE T=TORP P=PHASER R=REDISP Q=QUIT"
		%<ASCII !\"> READ-TALK
		%<ASCII !\M> READ-MOVE
		%<ASCII !\T> READ-TORP 
		%<ASCII !\P> READ-PHASER
		%<ASCII !\R> READ-REDISPLAY
		%<ASCII !\Q> READ-QUIT>>

<ROUTINE READ-REDISPLAY ()
	 <CLEAR 1>
	 <REGION-PRINT>
	 0>

<ROUTINE READ-QUIT ()
	 <NEXT-MESSAGE>
	 <TELL D ,PLAYER ": Leaving the game." CR>
	 <DIROUT 5 ,GAME-INBUF>
	 <TELL " Q">
	 <DIROUT -5>
	 <DIRIN 5 0>
	 <QUIT>
	 0>

<ROUTINE READ-TALK ()
	 <CMD-PROMPTS "Message? "
		      "(Type message followed by CR)">
	 <READ ,P-INBUF ,P-LEXV>
	 <PUTB ,CMD-INBUF 1 %<ASCII !\H>>
	 <COPY-BUFFER ,P-INBUF>>

<ROUTINE READ-MOVE ()
	 <CMD-PROMPTS "Move? "
		      "(Direction, Distance)">
	 <READ ,P-INBUF ,P-LEXV>
	 <PUTB ,CMD-INBUF 1 %<ASCII !\M>>
	 <COPY-BUFFER ,P-INBUF>>

<ROUTINE READ-TORP ()
	 <CMD-PROMPTS "Torpedo? "
		      "(Direction)">
	 <READ ,P-INBUF ,P-LEXV>
	 <PUTB ,CMD-INBUF 1 %<ASCII !\T>>
	 <COPY-BUFFER ,P-INBUF>>

<ROUTINE READ-PHASER ()
	 <CMD-PROMPTS "Phaser? "
		      "(Power)">
	 <READ ,P-INBUF ,P-LEXV>
	 <PUTB ,CMD-INBUF 1 %<ASCII !\P>>
	 <COPY-BUFFER ,P-INBUF>>
