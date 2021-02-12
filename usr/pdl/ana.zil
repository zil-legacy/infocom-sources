<VERSION XZIP>

<SINGLE-FILE? T>

<CONSTANT INBUF <ITABLE 40 (BYTE LENGTH) 0>>
<CONSTANT ABUF <ITABLE 40 (BYTE LENGTH) 0>>
<CONSTANT UBUF <ITABLE 40 (BYTE) 0>>

<ROUTINE CLEARBUF (BUF)
	 <PUTB .BUF 1 0>
	 <COPYT <REST .BUF> <REST .BUF 2>
		<- <- <GETB .BUF 0> 2>>>>

<ROUTINE TPUSH (CHR BUF "AUX" (TMP <GETB .BUF 0>))
	 <SET TMP <+ .TMP 1>>
	 <PUTB .BUF .TMP .CHR>
	 <PUTB .BUF 0 .TMP>>

<ROUTINE TPOP (BUF "AUX" CHR (TMP <GETB .BUF 0>))
	 <SET CHR <GETB .BUF .TMP>>
	 <SET TMP <- .TMP 1>>
	 <PUTB .BUF 0 .TMP>
	 .CHR>

<ROUTINE PUNCTUATION? (CHR)
	 <EQUAL? .CHR !\  !\: !\' !\, !\: !\; !\- !\. !\! !\?>>

<ROUTINE ALPHA? (CHR)
	 <COND (<AND <G=? .CHR !\A>
			 <L=? .CHR !\Z>>
		<RETURN <+ .CHR !\ >>)
	       (<AND <G=? .CHR !\a>
		     <L=? .CHR !\z>>
		<RETURN .CHR>)
	       (ELSE <RFALSE>)>>

<ROUTINE REPLACE (CHR "AUX" (CNT <GETB ,INBUF 1>))
	 <REPEAT ()
		 <COND (<ZERO? .CNT> <RFALSE>)
		       (<AND <EQUAL? .CHR <GETB <REST ,INBUF> .CNT>>
			     <EQUAL? !\  <GETB <REST ,ABUF> .CNT>>>
			<RETURN <REST ,ABUF <+ .CNT 1>>>)
		       (ELSE
			<SET CNT <- .CNT 1>>)>>>

<CONSTANT YX-TBL <TABLE 0 0>>

<ROUTINE SHOWCHR (BUF CHR)
	 <PUTB .BUF 0 .CHR>
	 <CURGET ,YX-TBL>
	 <CURSET 8
		 <+ 20 <- .BUF <REST ,ABUF 2>>>>
	 <PRINTC .CHR>
	 <CURSET <GET ,YX-TBL 0> <GET ,YX-TBL 1>>>

<CONSTANT H-INVERSE 1>
<CONSTANT H-NORMAL 0>

<ROUTINE PUSHCHR (CHR)
	 <TPUSH .CHR ,UBUF>
	 <HLIGHT ,H-INVERSE>
	 <PRINTC .CHR>
	 <HLIGHT ,H-NORMAL>>

<ROUTINE GO ()
	 <CLEAR -1>
	 <SPLIT 12>
	 <REPEAT () <ANA>>>

<ROUTINE ANA ("AUX" TMP CHR ACHR)
	 <CLEARBUF ,ABUF>
	 <CLEARBUF ,INBUF>
	 <PUTB ,UBUF 0 0>
	 <SCREEN 0>
	 <CLEAR 0>
	 <TELL ">">
	 <PUTB ,INBUF 1 0>
	 <READ ,INBUF <>>
	 <COPYT ,INBUF ,ABUF <GETB ,INBUF 0>>
	 <SCREEN 1>
	 <CURSET 8 20>
	 <ERASE 1>
	 <PRINTT <REST ,ABUF 2> <GETB ,ABUF 1>>
	 <CURSET 10 20>
	 <ERASE 1>
	 <REPEAT ()
		 <SCREEN 0>
		 <SET CHR <INPUT 1>>
		 <SCREEN 1>
		 <COND (<EQUAL? .CHR 13 10>
			<RTRUE>)
		       (<ALPHA? .CHR>
			<SET ACHR <ALPHA? .CHR>>
			<COND (<SET TMP
				    <INTBL? .ACHR
					    <REST ,ABUF 2>
					    <GETB ,ABUF 1>
					    1>>
			       <PUSHCHR .CHR>
			       <SHOWCHR .TMP !\ >)>)
		       (<EQUAL? .CHR 127>
			<COND (<G? <GETB ,UBUF 0> 0>
			       <SET CHR <TPOP ,UBUF>>
			       <COND (<SET ACHR <ALPHA? .CHR>>
				      <SET TMP <REPLACE .ACHR>>
				      <SHOWCHR .TMP .ACHR>)>
			       <CURGET ,YX-TBL>
			       <CURSET <GET ,YX-TBL 0>
				       <- <GET ,YX-TBL 1> 1>>
			       <ERASE 1>)>)
		       (<PUNCTUATION? .CHR>
			<PUSHCHR .CHR>)>>>
