"ANIMATED WORDS by SWG
Copyright (C) 1987 Infocom, Inc.  All rights reserved."

	<SYNTAX $CURSET = V-$CURSET>
	<SYNTAX $DISSOLVE = V-$DISSOLVE>
	<SYNTAX $FILL OBJECT (FIND RMUNGBIT) = V-$FILL>
	<SYNTAX $FOO OBJECT (FIND RMUNGBIT) = V-$FOO>
	<SYNTAX $FUN OBJECT (FIND RMUNGBIT) = V-$FUN>
	<SYNTAX $FLOAT OBJECT OBJECT (FIND RMUNGBIT) = V-$FLOAT>
	<SYNTAX $BOUNCE OBJECT OBJECT (FIND RMUNGBIT) = V-$BOUNCE>

<CONSTANT FUDGES	;"difference between screen height and bottom line"
	<PTABLE (BYTE)	0	;"ZIL"
			0	;"ZIP20"
			0	;"APPLE II"
			0	;"MAC"
			0	;"AMIGA"
			0	;"ST"
			1	;"COMPAQ/IBM-PC"
			0	;"128"
			0	;"64...">>

<GLOBAL CURTBL <TABLE 0 0>>

<ROUTINE V-$CURSET ("AUX" LEN ROW COL N)
	<CURGET ,CURTBL>
	<SET LEN <GET ,CURTBL 0>>
	<COND (<0? .LEN>
	       <SET LEN <+ <LOWCORE SCRV> <GETB ,FUDGES <LOWCORE INTID>>>>)>
	<COND (T ;<T? ,DBUG>
	       <TELL "[V=" N .LEN "]">)>
	<SPLIT <- .LEN 1>>
	<SCREEN ,S-WINDOW>
	<BUFOUT <>>
	<REPEAT ()
		<CURSET <- .LEN 1> 1>
		<SET N <INPUT 1>>
		<PRINTC .N>
		<SET N <- .N %<ASCII !\0>>>
		<COND (<OR <L? .N 0> <G? .N 9>>
		       <RETURN>)>
		<SET ROW <* 10 .N>>
		<SET N <INPUT 1>>
		<PRINTC .N>
		<SET ROW <+ .ROW <- .N %<ASCII !\0>>>>
		<SET N <INPUT 1>>
		<PRINTC .N>
		<SET COL <* 10 <- .N %<ASCII !\0>>>>
		<SET N <INPUT 1>>
		<PRINTC .N>
		<SET COL <+ .COL <- .N %<ASCII !\0>>>>
		<CURSET .ROW .COL>
		<TELL !\X>>
	<CURSET .LEN 1>
	<SPLIT 2>
	<BUFOUT T>
	<SCREEN ,S-TEXT>
	<CRLF>>

<GLOBAL DISSOLVING:FLAG <>>
<ROUTINE V-$DISSOLVE ()
 <COND (<SETG DISSOLVING <NOT ,DISSOLVING>>
	<CLEAR-DISSOLVE-TBL>
	<TELL "(Dissolving.)" CR>)
       (T
	<DIROUT ,D-TABLE-OFF>
	<DIROUT ,D-SCREEN-ON>
	<TELL "(Normal.)" CR>)>>

<ROUTINE CLEAR-DISSOLVE-TBL ("AUX" ICNT)
	<SET ICNT ,DISSOLVE-TBL-LENGTH>
	<REPEAT ()
		<COND (<DLESS? .ICNT 2> <RETURN>)
		      (T <PUTB ,DISSOLVE-TBL .ICNT 32>)>>
	<PUT ,DISSOLVE-TBL 0 0>
	<DIROUT ,D-SCREEN-OFF>
	<DIROUT ,D-TABLE-ON ,DISSOLVE-TBL>>

<GLOBAL XCHAR %<ASCII !\X>>
<ROUTINE FILLCHAR (ROW COL) ,XCHAR>

<CONSTANT DISSOLVE-TBL-LENGTH %<+ 2 <* 22 80>>>
<GLOBAL DISSOLVE-TBL <ITABLE %<+ 2 <* 22 80>> (BYTE) 32>>
<GLOBAL DISSOLVE-TBL-INDEX <ITABLE 22>>

<ROUTINE FIND-CR (PTR END "AUX" CHAR)
	<REPEAT ()
		<COND (<IGRTR? PTR .END>
		       <RFALSE>)
		      (<EQUAL? <GETB ,DISSOLVE-TBL .PTR> 13>
		       <SET CHAR <GETB ,DISSOLVE-TBL <+ 1 .PTR>>>
		       <COND (<AND <L? .CHAR 31>	;"LF or whatever"
				   <NOT <EQUAL? .CHAR 13>>>
			      <INC PTR>)>
		       <RETURN .PTR>)>>>

<ROUTINE INDEX-DISSOLVE-TBL (WID "AUX" (LIN 1) (PTR 1) END MAX)
 <SET MAX <GET ,DISSOLVE-TBL 0>>
 <COND (<T? ,P-DBUG>
	<DIROUT ,D-SCREEN-ON>
	<TELL "[">
	<SET END 0>
	<REPEAT ()
		<COND (<IGRTR? END .MAX> <RETURN>)>
		<PRINTN <GETB ,DISSOLVE-TBL <+ 1 .END>>>
		<PRINTC 32>>
	<TELL "]|">
	<DIROUT ,D-SCREEN-OFF>)>
 <REPEAT ()
	<SET END <+ 1 <+ .PTR .WID>>>
	<COND (<G? .END .MAX>
	       <SET END .MAX>)>
	<COND (<SET PTR <FIND-CR .PTR .END>>
	       <PUT ,DISSOLVE-TBL-INDEX .LIN .PTR>
	       <INC LIN>
	       <AGAIN>)>
	<SET PTR .END>
	<COND (<G=? .PTR .MAX>
	       <PUT ,DISSOLVE-TBL-INDEX .LIN <+ 1 .MAX>>
	       <RETURN <- .LIN 1>>)>
	<REPEAT ()
		<COND (<NOT <EQUAL? <GETB ,DISSOLVE-TBL .PTR> 32>>
		       <DEC PTR>)
		      (T
		       <PUT ,DISSOLVE-TBL-INDEX .LIN .PTR>
		       <INC LIN>
		       <RETURN>)>>>>

<ROUTINE DISSOLVE (ROW COL "AUX" N)
	<SET N <+ 1 <+ .COL <GET ,DISSOLVE-TBL-INDEX .ROW>>>>
	<COND (<NOT <L? .N <GET ,DISSOLVE-TBL-INDEX <+ 1 .ROW>>>>
	       <RETURN 32>)>
	<COND (<ZERO? .ROW>
	       <INC N>)>
	<GETB ,DISSOLVE-TBL .N>>

<ROUTINE FOOCHAR (ROW COL "AUX" R C)
	 <SET R </ <* 5 .ROW> ,P-NUMBER>>
	 <SET C </ .COL 3>>
	 <COND (<EQUAL? .C 0 9 16 18 25>
		%<ASCII !\X>)
	       (<EQUAL? .R 0>
		<COND (<NOT <EQUAL? .C 8 17>>
		       %<ASCII !\X>)
		      (T %<ASCII !\ >)>)
	       (<EQUAL? .R 4>
		<COND (<L? .C 9>
		       %<ASCII !\ >)
		      (<NOT <EQUAL? .C 17>>
		       %<ASCII !\X>)
		      (T %<ASCII !\ >)>)
	       (<AND <==? .R 2>
		     <L? .C 8>>
		%<ASCII !\X>)
	       (T %<ASCII !\ >)>>

<ROUTINE V-$FUN () <FILL ,DISSOLVE>>

<ROUTINE V-$FOO () <FILL ,FOOCHAR>>

<ROUTINE V-$FILL () <FILL ,FILLCHAR>>

<ROUTINE FILL (RTN "AUX" WID ROWS)
	<COND (<NOT <EQUAL? ,PRSO ,INTNUM>>
	       <TELL "[Please use a number.]" CR>
	       <RTRUE>)>
	<COND (<EQUAL? .RTN ,DISSOLVE>
	       <SET WID ,P-NUMBER>
	       <SET ROWS <INDEX-DISSOLVE-TBL .WID>>)
	      (T
	       <SET WID ,SCREENWIDTH>
	       <SET ROWS ,P-NUMBER>)>
	<FILL2 .RTN .ROWS .WID>>

<ROUTINE FILL2 (RTN ROWS WID "AUX" (NUM 1) ROW COL MASK OFS LEN CH)
	<SET MASK <* .ROWS .WID>>
	<COND (<L? .MASK 128>
	       <SET MASK *140*>)
	      (<L? .MASK 256>
	       <SET MASK *270*>)
	      (<L? .MASK 512>
	       <SET MASK *420*>)
	      (<L? .MASK 1024>
	       <SET MASK *1100*>)
	      (T
	       <SET MASK *2400*>)>
	<SET ROW .ROWS>
	<REPEAT ()
		<CRLF>
		<COND (<DLESS? ROW 1> <RETURN>)>>
	<CURGET ,CURTBL>
	<SET LEN <GET ,CURTBL 0>>
	<COND (<0? .LEN>
	       <SET LEN <+ <LOWCORE SCRV> <GETB ,FUDGES <LOWCORE INTID>>>>)>
	;<TELL "[V=" N .LEN "]">
	<SPLIT <- .LEN 1>>
	<SCREEN ,S-WINDOW>
	<BUFOUT <>>
	<SET OFS <- .LEN .ROWS>>
	<CURSET .OFS 1>
	<PRINTC <APPLY .RTN 0 0>>
	<REPEAT ()
		<SET ROW <DIV .NUM .WID>>
		<SET COL <MOD .NUM .WID>>
		<COND (<AND <L? .ROW .ROWS>
			    <NOT <EQUAL? <SET CH <APPLY .RTN .ROW .COL>>
					 32 13>>>
		       <CURSET <+ .OFS .ROW> <+ 1 .COL>>
		       <PRINTC .CH>)>
		<COND (<T? <BAND .NUM 1>>
		       <SET NUM <BXOR .MASK <SHIFT .NUM -1>>>)
		      (T <SET NUM <SHIFT .NUM -1>>)>
		<COND (<1? .NUM>
		       <RETURN>)>>
	<CURSET .LEN 1>
	<SPLIT 2>
	<BUFOUT T>
	<SCREEN ,S-TEXT>>

<COND (<CHECK-VERSION? XZIP> T)
      (T
       <ROUTINE SHIFT (X Y)
		<COND (<==? .Y -1>
		       <BAND *77777* </ .X 2>>)>>)>

<ROUTINE BXOR (X Y)
	<BAND <BOR .X .Y> <BCOM <BAND .X .Y>>>>

<ROUTINE V-$FLOAT ("AUX" B E C N NN N0 X X0 OX)
	<SET E <* 2 <+ <GET ,OOPS-TABLE ,O-START> ,P-LEXELEN>>>	;"temporary"
	<SET B <GETB ,P-LEXV <+ 3 .E>>>			;"beg'g of input word"
	<SET E <- <+ .B <GETB ,P-LEXV <+ 2 .E>>> 1>>	;"end of input word"
	<COND (<EQUAL? ,PRSI ,INTNUM>
	       <SET X0 <- ,P-NUMBER 2>>)
	      (T <SET X0 .B>)>			;"target X-coord"
	<SET N0 ,SCREENWIDTH>	;"temporary"
	<COND (<L? .N0 <- <+ .X0 .E> .B>>
	       <SET X0 <- <+ .N0 .B> .E>>)>
	<COND (<L? .X0 .B>
	       <SET N0 <+ 2 <- .B .X0>>>)
	      (T <SET N0 <+ 2 <- .X0 .B>>>)>	;"line where skew begins"
	<CURGET ,CURTBL>
	<SET N <GET ,CURTBL 0>>
	<COND (<0? .N>
	       <SET N <+ <LOWCORE SCRV> <GETB ,FUDGES <LOWCORE INTID>>>>)>
	<COND (T ;<T? ,DBUG>
	       <TELL "[V=" N .N "]">)>
	<DEC N>
	<SET NN <- .N 1>>
	<SPLIT .N>
	<SCREEN ,S-WINDOW>
	<BUFOUT <>>
	<SET X .B>	;"init'z for OX"
	<REPEAT ()
		<COND (<DLESS? N 2> <RETURN>)>
		<SET OX .X>
		<COND (<L? .X0 .B>	;"skew to left?"
		       <COND (<L? .N .N0>
			      <SET X <- <+ .X0 .N> 1>>)
			     (T <SET X .B>)>)
		      (T		;"skew to right!"
		       <COND (<L? .N .N0>
			      <SET X <+ <- .X0 .N> 3>>)
			     (T <SET X .B>)>)>	;"X-coord. of first letter"
		<CURSET .N <+ 1 .X>>
		<HLIGHT ,H-INVERSE>
		<SET C .B>
		<REPEAT ()
			<PRINTC <GETB ,P-INBUF .C>>
			<COND (<IGRTR? C .E> <RETURN>)>>
		<COND (<EQUAL? .N .NN>
		       <AGAIN>)>	;"Don't erase original."
		<CURSET <+ 1 .N> <+ 1 .OX>>
		<HLIGHT ,H-NORMAL>
		<SET C .B>
		<REPEAT ()	;"Erase previous display."
			<PRINTC 32>
			<COND (<IGRTR? C .E> <RETURN>)>>>
	<CURSET <GET ,CURTBL 0> ;23 1>
	<SPLIT 2>
	<BUFOUT T>
	<HLIGHT ,H-NORMAL>
	<SCREEN ,S-TEXT>>

<GLOBAL BOUNCE-TIME:NUMBER 5>
<ROUTINE TRUE-F () <RTRUE>>

<ROUTINE V-$BOUNCE ("AUX" B E C LEN N PTR)
	<CURGET ,CURTBL>
	<SET LEN <GET ,CURTBL 0>>	;"length of screen"
	<COND (<0? .LEN>
	       <SET LEN <+ <LOWCORE SCRV> <GETB ,FUDGES <LOWCORE INTID>>>>)>
	<COND (T ;<T? ,DBUG>
	       <TELL "[V=" N .LEN "]">)>
	<DEC LEN>
	<SPLIT .LEN ;<-  1>>
	<SCREEN ,S-WINDOW>
	<BUFOUT <>>
	<SET N <GETB ,P-LEXV ,P-LEXWORDS>>
	<SET PTR <* 2 <+ <GET ,OOPS-TABLE ,O-START> ,P-LEXELEN>>>
	<REPEAT ()
		<COND (<DLESS? N 1>
		       <RETURN>)
		      (<G? ,P-NUMBER 0>
		       <SETG BOUNCE-TIME ,P-NUMBER>)>
		<SET B <GETB ,P-LEXV <+ 3 .PTR>>>	;"beg'g of input word"
		<SET E <- <+ .B <GETB ,P-LEXV <+ 2 .PTR>>> 1>>	;"end of same"
		<CURSET <- .LEN 1> <+ 1 .B>>
		<SET C .B>
		<REPEAT ()	;"Copy original word."
			<PRINTC <GETB ,P-INBUF .C>>
			<COND (<IGRTR? C .E> <RETURN>)>>
		<CURSET .LEN <+ 1 .B>>
		<SET C .B>
		<REPEAT ()	;"Erase original word."
			<PRINTC 32>
			<COND (<IGRTR? C .E> <RETURN>)>>
		<INPUT 1 ,BOUNCE-TIME ,TRUE-F>
		<CURSET <- .LEN 1> <+ 1 .B>>
		<SET C .B>
		<REPEAT ()	;"Erase copy."
			<PRINTC 32>
			<COND (<IGRTR? C .E> <RETURN>)>>
		<CURSET .LEN <+ 1 .B>>
		<SET C .B>
		<REPEAT ()	;"Restore original word."
			<PRINTC <GETB ,P-INBUF .C>>
			<COND (<IGRTR? C .E> <RETURN>)>>
		<INPUT 1 ,BOUNCE-TIME ,TRUE-F>
		<SET PTR <+ .PTR ,P-WORDLEN>>>
	<CURSET <+ .LEN 1> 1>
	<SPLIT 2>
	<BUFOUT T>
	<SCREEN ,S-TEXT>>
