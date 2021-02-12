"CLUES for LIBRARY
(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

"To install:
Add <XFLOAD <ZILLIB>CLUES> to your GAME.ZIL file.
Modify ROUTINE FINISH in VERBS to include Hint.
Add HINT syntaxes (be careful -- you might already have some variety).
Add verb routines for V-HINT and V-HINTS-OFF.
Add HINT to list of verbs in CLOCKER-VERB (a.k.a. GAME-VERB?).
Make sure flag in V-HINTS-OFF syntax is correct (RLANDBIT, KLUDGEBIT, etc.)."

<FILE-FLAGS CLEAN-STACK? MDL-ZIL? ;ZAP-TO-SOURCE-DIRECTORY?>

<DEFAULTS-DEFINED
	FIRST-HINT-POS
	INIT-HINT-SCREEN>

<CONSTANT RETURN-SEE-HINT " Hit RETURN to see hints.">
<CONSTANT RETURN-SEE-HINT-LEN <LENGTH " Hit RETURN to see hints.">>

<CONSTANT RETURN-SEE-NEW-HINT "Hit RETURN to see new hint.">
<CONSTANT RETURN-SEE-NEW-HINT-LEN <LENGTH "Hit RETURN to see new hint.">>

<CONSTANT INVISICLUES "INVISICLUES (tm)">
<CONSTANT INVISICLUES-LEN <LENGTH "INVISICLUES (tm)">>

<CONSTANT M-MAIN-MENU "Hit M to see main menu.">
<CONSTANT M-MAIN-MENU-LEN <LENGTH "Hit M to see main menu.">>

<CONSTANT M-SEE-HINT-MENU "Hit M to see hint menu.">
<CONSTANT M-SEE-HINT-MENU-LEN <LENGTH "Hit M to see hint menu.">>

<CONSTANT PREVIOUS "Hit P for previous item.">
;<CONSTANT PREVIOUS-LEN <LENGTH "Hit P for previous item.">>

<CONSTANT H-NEXT "Hit N for next item.">
;<CONSTANT H-NEXT-LEN <LENGTH "Hit N for next item.">>

<CONSTANT Q-RESUME-STORY "Hit Q to resume story.">
<CONSTANT Q-RESUME-STORY-LEN <LENGTH "Hit Q to resume story.">>

"If the first argument is non-false, build a parallel impure table
   for storing the count of answers already seen; make it a constant
   under the given name."

<DEFINE20 CONSTRUCT-HINTS (COUNT-NAME "TUPLE" STUFF "AUX" (SS <>)
			   (HL (T)) (HLL .HL) V
			   (CL (T)) (CLL .CL)
			   TCL TCLL)
   <REPEAT ((CT 0))
     <COND (<OR <EMPTY? .STUFF>
		<TYPE? <1 .STUFF> STRING>>
	    ;"Chapter break"
	    <COND
	     (<NOT .SS>
	      ;"First one, just do setup"
	      <SET SS .STUFF>
	      <SET TCL (T)>
	      <SET TCLL .TCL>
	      <SET CT 0>)
	     (T
	      <SET V <SUBSTRUC .SS 0 <- <LENGTH .SS> <LENGTH .STUFF>>>>
	      ;"One chapter's worth"
	      <SET HLL <REST <PUTREST .HLL (<EVAL <FORM PLTABLE !.V>>)>>>
	      <COND (.COUNT-NAME
		     <SET CLL <REST <PUTREST .CLL
					     (<EVAL <FORM TABLE (BYTE)
							  !<REST .TCL>>>)>>>
		     <SET TCL (T)>
		     <SET TCLL .TCL>
		     <SET CT 0>)>
	      <SET SS .STUFF>)>
	    <COND (<EMPTY? .STUFF> <RETURN>)>
	    <SET STUFF <REST .STUFF>>)
	   (T
	    <COND (.COUNT-NAME
		   <COND (<1? <MOD <SET CT <+ .CT 1>> 2>>
			  <SET TCLL <REST <PUTREST .TCLL
						   (0)>>>)>)>
	    <SET STUFF <REST .STUFF>>)>>
   <COND (.COUNT-NAME
	  <EVAL <FORM CONSTANT .COUNT-NAME
		      <EVAL <FORM PTABLE !<REST .CL>>>>>)>
   <EVAL <FORM PLTABLE !<REST .HL>>>>

"Longest hint topic can be 17 chars.
Longest question can be 36 chars.
Question can't have more than 32 answers."

;<CONSTANT HINTS
  <CONSTRUCT-HINTS HINT-COUNTS ;"Put topics in Quotes - followed by PLTABLEs
				 of Questions and Answers in quotes"
	;"17 character wide"
	;"this set of quotes is 36 chars. wide"
	"Topic/Chapter"
	<PLTABLE "Question"
		 "Hint 1"
		 "Hint 2">>>

<GLOBAL HINT-POS 0>	;"determines where to place the highlight cursor
			  Can go up to 17 Questions"

<GLOBAL QUEST-NUM 1>    ;"shows in HINTS LTABLE which question it's on"

<GLOBAL CHAPT-NUM 1>	;"shows in HINTS LTABLE which chapter it's on"

<DEFAULT-DEFINITION FIRST-HINT-POS
<CONSTANT FIRST-HINT-LINE 5>
<CONSTANT FIRST-HINT-COLUMN 4>>

<DEFINE DO-HINTS ("AUX" MAXC Q)
  <IF-SOUND <SETG SOUND-QUEUED? <>>
	    <KILL-SOUNDS>>
  <SET MAXC <GET ,HINTS 0>>
  <INIT-HINT-SCREEN>
  <HINT-TITLE ,INVISICLUES ,INVISICLUES-LEN>
  <CCURSET ,FIRST-HINT-LINE 1>
  <PUT-UP-CHAPTERS>
  <SETG HINT-POS <- ,CHAPT-NUM 1>>
  <NEW-CURSOR>
  <REPEAT (CHR)
	  <SET CHR <INPUT 1>>
	  <COND (<EQUAL? .CHR !\M !\m !\Q !\q ;,ESCAPE-KEY>
		 <SET Q T>
		 <RETURN>)
		(<EQUAL? .CHR !\N !\n ,DOWN-ARROW>
		 <NEW-CURSOR " ">
		 <COND (<EQUAL? ,CHAPT-NUM .MAXC>
			<SETG HINT-POS 0>
			<SETG CHAPT-NUM 1>
			<SETG QUEST-NUM 1>)
		       (T
			<SETG HINT-POS <+ ,HINT-POS 1>>
			<SETG CHAPT-NUM <+ ,CHAPT-NUM 1>>
			<SETG QUEST-NUM 1>)>
		 <NEW-CURSOR>)
		(<EQUAL? .CHR !\P !\p ,UP-ARROW>
		 <NEW-CURSOR " ">
		 <COND (<EQUAL? ,CHAPT-NUM 1>
			<SETG CHAPT-NUM .MAXC>
			<SETG HINT-POS <- .MAXC 1>>)
		       (T
			<SETG HINT-POS <- ,HINT-POS 1>>
			<SETG CHAPT-NUM <- ,CHAPT-NUM 1>>)>
		 <SETG QUEST-NUM 1>
		 <NEW-CURSOR>)
		(<EQUAL? .CHR 13 10 32>
		 <SET Q <PICK-QUESTION>>
		 <RETURN>)
		(T
		 <SOUND ,S-BEEP>)>>
  <COND (<NOT .Q>
	 <AGAIN>)>
  <CLEAR -1>
  <INIT-STATUS-LINE>
  <TELL "Back to the story..." CR>
  <IF-SOUND <COND (,SOUND-ON?
		   <CHECK-LOOPING>)>>
  <RFATAL>>

<DEFINE PICK-QUESTION ("AUX" CHR MAXQ (Q <>))
  <SETG PARSE-SENTENCE-ACTIVATION <CATCH>>	;"for Q command"
  <INIT-HINT-SCREEN>
  <HINT-TITLE <GET <GET ,HINTS ,CHAPT-NUM> 1> ;<>>
  ;<HLIGHT ,H-BOLD>
  ;<CENTER-LINE 1 <GET <GET ,HINTS ,CHAPT-NUM> 1>>
  ;<HLIGHT ,H-NORMAL>
  ;<RIGHT-LINE 2 ,RETURN-SEE-HINT ,RETURN-SEE-HINT-LEN>
  <CENTER-LINE 3 ,M-MAIN-MENU ,M-MAIN-MENU-LEN>
  ;<RIGHT-LINE 3 ,Q-RESUME-STORY ,Q-RESUME-STORY-LEN>
  <SET MAXQ <- <GET <GET ,HINTS ,CHAPT-NUM> 0> 1>>
  <CCURSET ,FIRST-HINT-LINE 1>
  <PUT-UP-QUESTIONS>
  <SETG HINT-POS <- ,QUEST-NUM 1>>
  <NEW-CURSOR>
  <REPEAT ()
    <SET CHR <INPUT 1>>
    <COND (<EQUAL? .CHR !\Q !\q ;,ESCAPE-KEY>
	   <RTRUE>)
	  (<EQUAL? .CHR !\M !\m>
	   <SET Q T>
	   <RETURN>)
	  (<EQUAL? .CHR !\N !\n ,DOWN-ARROW>
	   <NEW-CURSOR " ">
	   <COND (<EQUAL? ,QUEST-NUM .MAXQ> ;"Wrap around on N"
		  <SETG HINT-POS 0>
		  <SETG QUEST-NUM 1>)
		 (T
		  <SETG HINT-POS <+ ,HINT-POS 1>>
		  <SETG QUEST-NUM <+ ,QUEST-NUM 1>>)>
	   <NEW-CURSOR>)
	  (<EQUAL? .CHR !\P !\p ,UP-ARROW>
	   <NEW-CURSOR " ">
	   <COND (<EQUAL? ,QUEST-NUM 1>
		  <SETG QUEST-NUM .MAXQ>
		  <SETG HINT-POS <- .MAXQ 1>>)
		 (T
		  <SETG HINT-POS <- ,HINT-POS 1>>
		  <SETG QUEST-NUM <- ,QUEST-NUM 1>>)>
	   <NEW-CURSOR>)
	  (<EQUAL? .CHR 13 10 32>
	   <DISPLAY-HINT>
	   <RETURN>)
	  (T
	   <SOUND ,S-BEEP>)>>
  <COND (<NOT .Q>
	 <AGAIN>)>>

"Go back 2 spaces from question text, print cursor and flash in between
the cursor and text:"

<DEFINE NEW-CURSOR ("OPT" (CH ">") "AUX" Y X
		    (MXL <- </ <WINPROP -3 ,WHIGH>
			       <SHIFT <WINPROP -3 ,WFSIZE> -8>>
			    ;<LOWCORE SCRV>
			    <+ 1 ,FIRST-HINT-LINE>>))
    <COND (<G? ,HINT-POS .MXL>
	   <SET Y <- <+ ,FIRST-HINT-LINE <- ,HINT-POS .MXL>> 1>>
	   <SET X <- </ <LOWCORE SCRH> ;<WINPROP -3 ,WWIDE> 2> 2>>)
	  (T
	   <SET Y <+ ,FIRST-HINT-LINE ,HINT-POS>>
	   <SET X <- ,FIRST-HINT-COLUMN 2>>)>
    <CCURSET .Y .X>
    <FONT 4> ;"fixed font on MAC-otherwise all of cursor isn't erased by space"
    <TELL ;C .CH> ;"print the new cursor"
    <FONT 1>>

<DEFINE INVERSE-LINE ("OPT" (LN 0))
	<COND (<T? .LN>
	       <CCURSET .LN 1>)>
	<HLIGHT ,H-INVERSE>
	<FONT 4>
	<SET LN <LOWCORE (FWRD 1)>>
	<PRINT-SPACES </ <WINPROP -3 ,WWIDE> .LN>
		      ;<LOWCORE SCRH>>
	<FONT 1>
	<HLIGHT ,H-NORMAL>>

<DEFINE DISPLAY-HINT ("AUX" H MX (CNT 2) CV SHIFT? COUNT-OFFS)
  <CLEAR -3 ;-1>
  ;<CSPLIT 3>
  ;<SCREEN ,S-WINDOW>
  ;<CCURSET 1 1>
  <INVERSE-LINE 1>
  ;<HLIGHT ,H-BOLD>
  ;<CENTER-LINE 1 ,INVISICLUES ,INVISICLUES-LEN>
  ;<HLIGHT ,H-NORMAL>
  ;<CCURSET 3 1>
  <INVERSE-LINE 3>
  <CENTER-LINE 3 ,M-SEE-HINT-MENU ,M-SEE-HINT-MENU-LEN>
  <RIGHT-LINE 3 ,Q-RESUME-STORY ,Q-RESUME-STORY-LEN>
  ;<CCURSET 2 1>
  <INVERSE-LINE 2>
  <RIGHT-LINE 2 ,RETURN-SEE-NEW-HINT ,RETURN-SEE-NEW-HINT-LEN>
  ;<CCURSET 1 1>
  <INVERSE-LINE 1>
  <HLIGHT ,H-BOLD>
  <SET H <GET <GET ,HINTS ,CHAPT-NUM> <+ ,QUEST-NUM 1>>>
  ;"Byte table to use for showing questions already seen.
    Actually a nibble table.  The high four bits of each byte are for
    QUEST-NUM odd; the low four bits are for QUEST-NUM even.  See SHIFT?
    and COUNT-OFFS."
  <SET CV <GET ,HINT-COUNTS <- ,CHAPT-NUM 1>>>
  <CENTER-LINE 1 ;2 <GET .H 1>>
  <HLIGHT ,H-NORMAL>
  <SET MX <GET .H 0>>
  ;<SCREEN ,S-TEXT>
  <CCURSET ,FIRST-HINT-LINE 1>
  <CRLF>
  <SET SHIFT? <MOD ,QUEST-NUM 2>>
  <SET COUNT-OFFS </ <- ,QUEST-NUM 1> 2>>
  <REPEAT ((CURCX <GETB .CV .COUNT-OFFS>)
	   (CURC <+ 2 <ANDB <COND (.SHIFT? <LSH .CURCX -4>)
				  (T .CURCX)> *17*>>))
    <COND (<==? .CNT .CURC>
	   <RETURN>)
	  (T
	   <TELL <GET .H .CNT> CR>
	   <SET CNT <+ .CNT 1>>)>>
  <REPEAT (CHR N (FLG T))
     <COND (<AND .FLG <G? .CNT .MX>>
	    <SET FLG <>>
	    <TELL "[That's all.]" CR>)
	   (.FLG
	    <SET N <+ <- .MX .CNT> 1>>
	    <TELL "[" N .N " hint">
	    <COND (<NOT <EQUAL? .N 1>>
		   <TELL "s">)>
	    <TELL " left.] -> ">
	    <SET FLG <>>)>
     <SET CHR <INPUT 1>>
     <COND (<EQUAL? .CHR !\M !\m !\Q !\q ;,ESCAPE-KEY>
	    <COND (.SHIFT?
		   <PUTB .CV .COUNT-OFFS
			 <ORB <ANDB <GETB .CV .COUNT-OFFS> *17*>
			      <LSH <- .CNT 2> 4>>>)
		  (T
		   <PUTB .CV .COUNT-OFFS
			 <ORB <ANDB <GETB .CV .COUNT-OFFS> *360*>
			      <- .CNT 2>>>)>
	    <COND (<EQUAL? .CHR !\Q !\q ;,ESCAPE-KEY>
		   <THROW T ,PARSE-SENTENCE-ACTIVATION>)
		  (T
		   <RETURN>)>)
	   (<EQUAL? .CHR 13 10 32>
	    <COND (<L=? .CNT .MX>
		   <SET FLG T>	;"CNT starts as 2"
		   <TELL <GET .H .CNT> CR>
		   ;"3rd = line 7, 4th = line 9, etc."
		   <COND (<G? <SET CNT <+ .CNT 1>> .MX>
			  <SET FLG <>>
			  <TELL "[Final hint]" CR>)>)
		  (T
		   <SOUND ,S-BEEP>)>)
	   (T
	    <SOUND ,S-BEEP>)>>>

<DEFINE PUT-UP-QUESTIONS ("AUX" (ST 0) MXQ MXL)
  <SET MXQ <- <GET <GET ,HINTS ,CHAPT-NUM> 0> 1>>
  <SET MXL <- </ <WINPROP -3 ,WHIGH> <SHIFT <WINPROP -3 ,WFSIZE> -8>>
	      ;<LOWCORE SCRV> 1>>
  <REPEAT ()
	  <COND (<G? <SET ST <+ .ST 1>> .MXQ>
		 <RETURN>)
		(T                        ;"zeroth"
		 <CCURSET <+ ,FIRST-HINT-LINE <- .ST 1>>
			  <- ,FIRST-HINT-COLUMN 1>>)>
	  <TELL " " <GET <GET <GET ,HINTS ,CHAPT-NUM> <+ .ST 1>> 1>>>>

<DEFINE PUT-UP-CHAPTERS ("AUX" (ST 0) MXC MXL)
  <SET MXC <GET ,HINTS 0>>
  <SET MXL <- </ <WINPROP -3 ,WHIGH> <SHIFT <WINPROP -3 ,WFSIZE> -8>>
	      ;<LOWCORE SCRV>
	      ,FIRST-HINT-LINE ;1>>
  <REPEAT (X Y)
    <COND (<G? <SET ST <+ .ST 1>> .MXC>
	   <RETURN>)
	  (<G? .ST .MXL>
	   <SET Y <+ ,FIRST-HINT-LINE <- <- .ST 1> .MXL>>>
	   <SET X <- </ <LOWCORE SCRH> ;<WINPROP -3 ,WWIDE> 2> 1>>)
	  (T
	   <SET Y <+ ,FIRST-HINT-LINE <- .ST 1>>>
	   <SET X <- ,FIRST-HINT-COLUMN 1>>)>
    <CCURSET .Y .X>
    <TELL " " <GET <GET ,HINTS .ST> 1>>>>

<DEFAULT-DEFINITION INIT-HINT-SCREEN
<DEFINE INIT-HINT-SCREEN ()
  <CLEAR -1>
  <SCREEN 0>
  ;<CSPLIT <- <LOWCORE SCRV> 1>>>>

<DEFINE HINT-TITLE (TITLE "OPTIONAL" (TITLEN 0) (THIRD T))
  ;<SCREEN ,S-WINDOW>
  ;<CCURSET 1 1>
  <INVERSE-LINE 1>
  ;<CCURSET 2 1>
  <INVERSE-LINE 2>
  ;<CCURSET 3 1>
  <INVERSE-LINE 3>
  <HLIGHT ,H-BOLD>
  <CENTER-LINE 1 .TITLE .TITLEN>
  <HLIGHT ,H-NORMAL>
  <LEFT-LINE 2 ,H-NEXT T ;,H-NEXT-LEN>
  <LEFT-LINE 3 ,PREVIOUS T ;,PREVIOUS-LEN>
  <COND (.THIRD
	 <RIGHT-LINE 2 ,RETURN-SEE-HINT ,RETURN-SEE-HINT-LEN>
	 <RIGHT-LINE 3 ,Q-RESUME-STORY ,Q-RESUME-STORY-LEN>)>>

<DEFINE LEFT-LINE (LN STR "OPTIONAL" (INV T))
	<CCURSET .LN 1>
	<COND (.INV
	       <HLIGHT ,H-INVERSE>)>
	<TELL .STR>
	<COND (.INV
	       <HLIGHT ,H-NORMAL>)>>

<DEFINE CENTER-LINE (LN STR "OPTIONAL" (LEN 0) ;(INV T))
  <COND (<ZERO? .LEN>
	 <DIROUT ,D-TABLE-ON ,SLINE>
	 <TELL .STR>
	 <DIROUT ,D-TABLE-OFF>
	 <SET LEN <GET ,SLINE 0>>)>
  <CCURSET .LN </ <- <LOWCORE SCRH> ;<WINPROP -3 ,WWIDE> .LEN> 2>>
  <COND (T ;.INV
	 <HLIGHT ,H-INVERSE>)>
  <TELL .STR>
  <COND (T ;.INV
	 <HLIGHT ,H-NORMAL>)>>

<DEFINE RIGHT-LINE (LN STR "OPTIONAL" (LEN 0) ;(INV T))
	<COND (<ZERO? .LEN>
	       <DIROUT ,D-TABLE-ON ,SLINE>
	       <TELL .STR>
	       <DIROUT ,D-TABLE-OFF>
	       <SET LEN <GET ,SLINE 0>>)>
	<CCURSET .LN <- <LOWCORE SCRH> ;<WINPROP -3 ,WWIDE> .LEN>>
	<COND (T ;.INV
	       <HLIGHT ,H-INVERSE>)>
	<TELL .STR>
	<COND (T ;.INV
	       <HLIGHT ,H-NORMAL>)>>
