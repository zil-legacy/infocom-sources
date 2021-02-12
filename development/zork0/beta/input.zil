"INPUT for
				ZORK ZERO
	(c) Copyright 1988 Infocom, Inc. All Rights Reserved."

<GLOBAL WIDTH 80>

<CONSTANT TCHARS <TABLE (BYTE) 255 0>>

"table containing string definitions for each function key.
contiguous so it can be written out or read in."

<CONSTANT FLEN 30>	;"max length of a key definition"

<CONSTANT FKEYS-STRTABLE-LEN <* 14 <+ ,FLEN 2>>>

;"arrow keys"
<CONSTANT FKEY-UP ;129
	  <TABLE (STRING) ,FLEN 2 "n
                            ">>
<CONSTANT FKEY-DN ;130
	  <TABLE (STRING) ,FLEN 2 "s
                            ">>
<CONSTANT FKEY-LF ;131
	  <TABLE (STRING) ,FLEN 2 "w
                            ">>
<CONSTANT FKEY-RT ;132
	  <TABLE (STRING) ,FLEN 2 "e
                            ">>

;"vt100 keypad keys"
<CONSTANT FKEY-0 ;137
	  <TABLE (STRING) ,FLEN 0 "examine                       ">>
<CONSTANT FKEY-1 ;138
	  <TABLE (STRING) ,FLEN 3 "take                          ">>
<CONSTANT FKEY-2 ;139
	  <TABLE (STRING) ,FLEN 2 "take all
                     ">>
<CONSTANT FKEY-3 ;140
	  <TABLE (STRING) ,FLEN 3 "drop                          ">>
<CONSTANT FKEY-4 ;141
	  <TABLE (STRING) ,FLEN 2 "look around
                  ">>
<CONSTANT FKEY-5 ;142
	  <TABLE (STRING) ,FLEN 0 "inventory
                    ">>
<CONSTANT FKEY-6 ;143
	  <TABLE (STRING) ,FLEN 2 "unlock door                   ">>
<CONSTANT FKEY-7 ;144
	  <TABLE (STRING) ,FLEN 3 "jester,                       ">>
<CONSTANT FKEY-8 ;145
	  <TABLE (STRING) ,FLEN 2 "give magic locket to moose
   ">>
<CONSTANT FKEY-9 ;146
	  <TABLE (STRING) ,FLEN 3 "read about                    ">>

<CONSTANT FKEYS
	  <LTABLE
	  ;"arrow keys"
	   129 ,FKEY-UP
	   130 ,FKEY-DN
	   131 ,FKEY-LF
	   132 ,FKEY-RT
	  ;"vt100 keypad keys"
	   137 ,FKEY-0
	   138 ,FKEY-1 
	   139 ,FKEY-2
	   140 ,FKEY-3
	   141 ,FKEY-4
	   142 ,FKEY-5
	   143 ,FKEY-6
	   144 ,FKEY-7
	   145 ,FKEY-8
	   146 ,FKEY-9
	    -4 <TABLE "Save Defs" SOFT-SAVE-DEFS>
	    -5 <TABLE "Restore Defs" SOFT-RESTORE-DEFS>
	    -6 <TABLE "Reset Defaults" SOFT-RESET-DEFAULTS>
	    -2 <TABLE "Exit" SOFT-EXIT>>>

<CONSTANT FNAMES
	  <LTABLE 129 "UP"
		  130 "DN"
		  131 "LF"
		  132 "RT"
		;"vt100 keypad keys"
		  137 "F0"
		  138 "F1" 
		  139 "F2"
		  140 "F3"
		  141 "F4"
		  142 "F5"
		  143 "F6"
		  144 "F7"
		  145 "F8"
		  146 "F9">>

<ROUTINE READ-INPUT ("AUX" TRM TMP N M FDEF)
	 <PUTB ,P-INBUF 1 0>
	 <REPEAT ()
		 <SET TRM <READ ,P-INBUF <>>>
		 <COND (<EQUAL? .TRM 13 10> <RETURN>)
		       (<AND <SET TMP
				  <INTBL? .TRM <REST ,FKEYS 2> <GET ,FKEYS 0>>>
			     <SET FDEF <GET .TMP 1>> ;"key def"
			     <SET M <GETB .FDEF 1>>> ;"number chars in def"
			<SET N <GETB ,P-INBUF 1>> ;"number chars already"
			<SET FDEF <REST .FDEF>>
			<COND (<EQUAL? <GETB .FDEF .M> 13 10>
			       <SET TRM 13> ;"this def is a terminator"
			       <SET M <- .M 1>>)>
			<SET FDEF <REST .FDEF>>
			<SET TMP <REST ,P-INBUF <+ .N 2>>>
			<COPYT .FDEF .TMP .M>
			<PUTB .TMP .M 0>
			<WINATTR -3 ,A-SCRIPT ,O-CLEAR>
			<PRINTT .FDEF .M>
			<PUTB ,P-INBUF 1 <+ .N .M>>
			<COND (<EQUAL? .TRM 13 10> <CRLF>)>
			<WINATTR -3 ,A-SCRIPT ,O-SET>
			<COND (<EQUAL? .TRM 13 10> <RETURN>)>)
		       (ELSE <SOUND ,S-BEEP>)>>
	 <SCRIPT-INBUF>
	 <LEX ,P-INBUF ,P-LEXV>>

<ROUTINE SCRIPT-INBUF ("AUX" BUF (CNT 0) (N <GETB ,P-INBUF 1>) CHR)
	 <DIROUT ,D-SCREEN-OFF>
	 <SET BUF <REST ,P-INBUF>>
	 <REPEAT ()
		 <COND (<IGRTR? CNT .N> <RETURN>)
		       (ELSE
			<SET CHR <GETB .BUF .CNT>> 
			<COND (<AND <G=? .CHR !\a>
				    <L=? .CHR !\z>>
			       <PRINTC <- .CHR 32>>)
			      (ELSE <PRINTC .CHR>)>)>>
	 <CRLF>
	 <DIROUT ,D-SCREEN-ON>>

<CONSTANT SOFT-WINDOW 2>

<SYNTAX DEFINE = V-DEFINE>

<ROUTINE V-DEFINE ("AUX" (LINE 0) LINMAX CHR TMP NLINE FKEY FDEF LEFT)
	 <CLEAR 0>
	 <SET FKEY <REST ,FKEYS <+ 2 <* 4 .LINE>>>>
	 <SET FDEF <GET .FKEY 1>>
	 <SET LEFT </ <- ,WIDTH <GETB .FDEF 0>> 2>>
	 <CWINPOS ,SOFT-WINDOW ,SOFT-TOP .LEFT>
	 <SET LINMAX </ <GET ,FKEYS 0> 2>>
	 <CWINSIZE ,SOFT-WINDOW <+ .LINMAX 1> ,FLEN>
	 <SCREEN ,SOFT-WINDOW>
	 <DISPLAY-SOFTS .LINE>
	 <DISPLAY-SOFT .FKEY .LINE <>>
	 <REPEAT ()
		 <SET CHR <INPUT 1>>
		 <SET NLINE .LINE>
		 <COND (<AND <EQUAL? .CHR 13>
			     <L? <GET .FKEY 0> 0>>
			<SET NLINE 0>
			<COND (<APPLY <GET .FDEF 1>>
			       <SCREEN 0>
			       <CLEAR 0>
			       <RTRUE>)
			      (ELSE
			       <DISPLAY-SOFTS .LINE>)>)
		       (<EQUAL? .CHR ,DOWN-ARROW 13>
			<COND (<L? <SET NLINE <+ .NLINE 1>> .LINMAX>)
			      (ELSE <SET NLINE 0>)>)
		       (<EQUAL? .CHR ,UP-ARROW>
			<COND (<G=? <SET NLINE <- .NLINE 1>> 0>)
			      (ELSE
			       <SET NLINE <- .LINMAX 1>>)>)
		       (<SET TMP
			     <INTBL? .CHR <REST ,FKEYS 4> <GET ,FKEYS 1>>>
			<SET NLINE </ <- .TMP ,FKEYS> 4>>)
		       (<EQUAL? .CHR 127>
			<SET TMP <GETB .FDEF 1>>
			<COND (<NOT <ZERO? .TMP>>
			       <SET TMP <- .TMP 1>>
			       <PUTB .FDEF 1 .TMP>
			       <PUTB .FDEF <+ .TMP 2> !\ >
			       <CCURSET <+ .LINE 2>
				       <+ .TMP 4>>
			       <ERASE 1>)
			      (ELSE <SOUND ,S-BEEP>)>)
		       (<G=? .CHR !\ >
			<SET TMP <GETB .FDEF 1>>
			<COND (<EQUAL? .TMP <GETB .FDEF 0>>
			       <SOUND ,S-BEEP>)
			      (<INTBL? 13
				       <REST .FDEF 2>
				       <GETB .FDEF 1>
				       1>
			       <SOUND ,S-BEEP>)
			      (ELSE
			       <COND (<EQUAL? .CHR !\|> <SET CHR 13>)>
			       <PUTB .FDEF 1 <+ .TMP 1>>
			       <COND (<AND <G=? .CHR !\A>
					   <L=? .CHR !\Z>>
				      <SET CHR <+ .CHR 32>>)>
			       <PUTB .FDEF <+ .TMP 2> .CHR>
			       <COND (<EQUAL? .CHR 13>
				      <PRINTC !\|>)
				     (ELSE <PRINTC .CHR>)>)>)
		       (ELSE <SOUND ,S-BEEP>)>
		 <COND (<NOT <EQUAL? .LINE .NLINE>>
			<DISPLAY-SOFT .FKEY .LINE T>
			<DISPLAY-SOFT <REST ,FKEYS <+ 2 <* 4 .NLINE>>>
				      .NLINE <>>
			<SET LINE .NLINE>
			<SET FKEY <REST ,FKEYS <+ 2 <* 4 .LINE>>>>
			<SET FDEF <GET .FKEY 1>>)>>
	 <SCREEN 0>>

<CONSTANT SOFT-TOP 5>

<ROUTINE DISPLAY-SOFTS (LINE "AUX" (L <GET ,FKEYS 0>) (F 0) N FKEY (CNT 0))
	 <SET L </ .L 2>>
	 <SCREEN ,SOFT-WINDOW>
	 <CCURSET 1 <- </ ,FLEN 2> 7>>
	 <TELL "Function Keys">
	 <SET FKEY <REST ,FKEYS 2>>
	 <REPEAT ()
		 <COND (<L? .CNT .L>
			<DISPLAY-SOFT .FKEY .CNT
				      <COND (<EQUAL? .CNT .LINE> <>)
					    (ELSE T)>>
			<SET FKEY <REST .FKEY 4>>)
		       (ELSE <RETURN>)>
		 <SET CNT <+ .CNT 1>>>>

<ROUTINE DISPLAY-SOFT (FKEY CNT INV?
		       "AUX" (FDEF <GET .FKEY 1>) S N M TMP
		       (Y <+ .CNT 2>) X)
	 <COND (<L? <GET .FKEY 0> 0> ;"constant string"
		<CCURSET .Y
			<+ </ ,FLEN 2>
			   <GET .FKEY 0> ;"-1/2 length of string">>
		<COND (.INV? <HLIGHT ,H-INVERSE>)>
		<TELL <GET .FDEF 0>>)
	       (ELSE
		<SET S <GETB .FDEF 0>>
		<SET N <GETB .FDEF 1>>
		<CCURSET .Y 1>
		<COND (<SET TMP
			    <INTBL? <GET .FKEY 0>
				    <REST ,FNAMES 2>
				    <GET ,FNAMES 0>>>
		       <COND (.INV? <HLIGHT ,H-NORMAL>)
			     (ELSE <HLIGHT ,H-INVERSE>)>
		       <TELL <GET .TMP 1>>
		       <HLIGHT ,H-NORMAL>
		       <TELL " ">
		       <COND (.INV? <HLIGHT ,H-INVERSE>)
			     (ELSE <HLIGHT ,H-NORMAL>)>)>
		<SET FDEF <REST .FDEF 2>> ;"get past header bytes"
		<COND (.N ;"any definition?"
		       <SET M <- .N 1>>
		       <COND (<EQUAL? <GETB .FDEF .M> 13> ;"last character CR?"
			      <PRINTT .FDEF .M>
			      <PRINTC !\|>
			      <SET FDEF <REST .FDEF .N>>
			      <SET S <- .S .N>>)>)>
		<PRINTT .FDEF .S>
		<COND (<NOT .INV?>
		       <CCURSET .Y <+ .N 4>>)>)>
	 <HLIGHT ,H-NORMAL>>

<ROUTINE SOFT-RESET-DEFAULTS ("AUX" K L KEYS DEF KL TMP)
	 <SET KL <GET ,FKEYS 0>>
	 <SET DEF ,DEFAULT-FKEYS>
	 <REPEAT ()
		 <SET K <GETB .DEF 0>>
		 <COND (<ZERO? .K> <RETURN>)>
		 <SET DEF <REST .DEF>>
		 <SET L <+ 1 <GETB .DEF 0>>>
		 <COND (<SET KEYS <INTBL? .K <REST ,FKEYS 2> .KL>>
			<SET KEYS <GET .KEYS 1>>
			<SET TMP <REST .KEYS>>
			<PUTB .TMP 0 !\ >
			<COPYT .TMP <REST .TMP> <- <GETB .KEYS 0>>>
			<COPYT .DEF <REST .KEYS> .L>)>
		 <SET DEF <REST .DEF .L>>>
	 <RFALSE>>

<CONSTANT DEFAULT-FKEYS
	  <TABLE (STRING)
	  ;"arrow keys"
	   129 2 "n
"
	   130 2 "s
"
	   131 2 "w
"
	   132 2 "e
"
	  ;"vt100 keypad keys"
	   137 0 ""
	   138 3 "sw
" 
	   139 2 "s
"
	   140 3 "se
"
	   141 2 "w
"
	   142 0 ""
	   143 2 "e
"
	   144 3 "nw
"
	   145 2 "n
"
	   146 3 "ne
"
	     0>>

<CONSTANT DEFS-NAME <LTABLE (STRING) "DEFS">>

<ROUTINE SOFT-SAVE-DEFS ()
	 <CLEAR 0>
	 <SCREEN 0>
	 <COND (<NOT <SAVE ,FKEY-UP
			   ,FKEYS-STRTABLE-LEN
			   ,DEFS-NAME>>
	        <TELL "Failed.">)>
	 <SCREEN ,SOFT-WINDOW>
	 <RFALSE>>

<ROUTINE SOFT-RESTORE-DEFS ()
	 <CLEAR 0>
	 <SCREEN 0>
	 <COND (<RESTORE ,FKEY-UP ,FKEYS-STRTABLE-LEN ,DEFS-NAME>
		<DISPLAY-SOFTS 0>)
	       (ELSE
		<TELL "Failed.">)>
	 <SCREEN ,SOFT-WINDOW>
	 <RFALSE>>

<ROUTINE SOFT-EXIT ()
	 <RTRUE>>

<ROUTINE Y? ("AUX" X)
	 <REPEAT ()
	     <SET X <INPUT 1>>
	     <COND (<EQUAL? .X !\Y !\y>
		    <SET X T>
		    <RETURN>)
		   (<EQUAL? .X !\N !\n>
		    <SET X <>>
		    <RETURN>)
		   (T
		    <TELL CR "[Please type Y or N] >">)>>
	 <CRLF>
	 <RETURN .X>>

<ROUTINE BLINK-WHILE-AWAITING-INPUT (PIC1 PIC2 Y X SCR "AUX" CHAR LAST)
	 <SET LAST .PIC1> ;"PIC1 should always be the unhighlighted pic"
	 <REPEAT ()
		 <SETG TYPED-TIMED-OUT <>>
		 <SET CHAR <INPUT 1 5 ;"half a second" ,TYPED?>>
		 <COND (,TYPED-TIMED-OUT
			<SCREEN .SCR>
			<DISPLAY <COND (<EQUAL? .LAST .PIC1>
					<SET LAST .PIC2>
					.PIC2)
				       (T
					<SET LAST .PIC1>
					.PIC1)> .Y .X>
			<SCREEN ,S-TEXT>)
		       (T
			<COND (<EQUAL? .LAST .PIC2> ;"leave unhighlited pic up"
			       <SCREEN .SCR>
			       <DISPLAY .PIC1 .Y .X>
			       <SCREEN ,S-TEXT>)>
			<RETURN .CHAR>)>>>

<GLOBAL TYPED-TIMED-OUT <>>

<ROUTINE TYPED? ()
	 <SETG TYPED-TIMED-OUT T>
	 <RTRUE>>

<ROUTINE PICINF-PLUS-ONE (PIC)
	 <PICINF .PIC ,PICINF-TBL>
	 <PUT ,PICINF-TBL 0 <+ <GET ,PICINF-TBL 0> 1>>
	 <PUT ,PICINF-TBL 1 <+ <GET ,PICINF-TBL 1> 1>>>
