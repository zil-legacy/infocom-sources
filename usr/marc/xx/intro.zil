"INTRO for
		      		JOURNEY
	(c) Copyright 1988 by Infocom, Inc.  All Rights Reserved."

<GLOBAL XVWRD 0>
<GLOBAL XHWRD 0>
<GLOBAL XFWRD 0>

<ROUTINE GO () ;"NOTE: this routine CANNOT have any local variables" 
	 <SETG XFWRD <LOWCORE FWRD>>
	 <SETG XVWRD <LOWCORE VWRD>>
	 <SETG XHWRD <LOWCORE HWRD>>
	 <SETG CHRV <LOWCORE (FWRD 0)>>
	 <SETG CHRH <LOWCORE (FWRD 1)>>
	 <COND (<NOT <BTST <LOWCORE ZVERSION> 4>>
		;"For now..."
		<SETG H-BOLD ,H-INVERSE>)>
	 <SETG HERE ,START-LOC>
	 <SETG LEADER <GET ,PARTY 1>>
	 <SETG SUBGROUP-MODE T> ;"No character commands initially"
	 <INIT-SCREEN>
	 <NEXT-DAY>
	 <INTRO>
	 <SETG SCENE-OBJECT ,DEFAULT-SCENE>
	 <SCENE ,DEFAULT-SCENE>
	 <MODE ,TRAVEL-MODE T>
	 <PRINT-CHARACTER-COMMANDS>
	 <NEW-DEFAULT 1 -1>
	 <SETG ACTION ,BUSY-COMMAND>
	 <COND (<BAND <LOWCORE FLAGS> 1>
		<SETG SCRIPTING-FLAG T>)>
	 <INIT-SPELLS>
	 <PARTY-INPUT>
	 <IFN-YFLAG <SELECT-SCREEN 0>>
	 <AGAIN>>

<ROUTINE INIT-SPELLS ("AUX" (TPC 4) FP F NUM OFF)
	 <SET FP <FIRST? ,TAG-POWDERS>>
	 <REPEAT ()
		 <COND (<NOT .FP> <RETURN>)
		       (T
			<SET NUM <RANDOM .TPC>>
			<SET F <FIRST? ,ESSENCES>>
			<SET OFF 1>
			<REPEAT ()
				<COND (<EQUAL? .OFF .NUM>
				       <PUTP .FP ,P?ESSENCE .F>
				       <PUTP .F ,P?COLOR .FP>
				       <REMOVE .F>
				       <RETURN>)
				      (T
				       <SET OFF <+ .OFF 1>>
				       <SET F <NEXT? .F>>)>>
			<SET TPC <- .TPC 1>>
			<SET FP <NEXT? .FP>>)>>
	 <MOVE ,ESSENCE-EARTH ,ESSENCES>
	 <MOVE ,ESSENCE-AIR ,ESSENCES>
	 <MOVE ,ESSENCE-WATER ,ESSENCES>
	 <MOVE ,ESSENCE-FIRE ,ESSENCES>>

<GLOBAL INTRO-PICS <LTABLE G-FORK G-CANYON G-FOREST-RIDGE>>
<ROUTINE I-RTRUE () <RTRUE>>

<ROUTINE INTRO  ("AUX" CHR F)
	 <SET CHR <INPUT 1 1 ,I-RTRUE>>
	 <GRAPHIC <GET ,INTRO-PICS <RANDOM <GET ,INTRO-PICS 0>>>>
	 <IFFLAG (<==? MVER MAC>
		  <SET F <FONT 4>>)>
	 <TELL WRAP CR CR>
	 <COND (<NOT <EQUAL? ,H-BOLD ,H-INVERSE>>
		<HLIGHT ,H-BOLD>)>
	 <WCENTER "JOURNEY" 7>
	 <HLIGHT ,H-NORMAL>
	 <TELL CR>
	 <WCENTER "Part One of" 11>
	 <TELL CR>
	 <WCENTER "The Golden Age Trilogy"
		  %<LENGTH "The Golden Age Trilogy">>
	 <TELL CR CR>
	 <WCENTER "Created by Marc Blank"
		  %<LENGTH "Created by Marc Blank">>
	 <TELL CR CR>
	 <WCENTER "Illustrations by Donald Langosy"
		  %<LENGTH "Illustrations by Donald Langosy">>
	 <TELL CR CR>
	 <WCENTER "Copyright (c) 1988 Infocom, Inc."
		  %<LENGTH "Copyright (c) 1988 Infocom, Inc.">>
	 <TELL CR>
	 <WCENTER "All rights reserved."
		  %<LENGTH "All rights reserved.">>
	 <IFFLAG (YFLAG <SET CHR <INPUT 1>>)
		 (T <SET CHR <WMORE>>)>
	 <IFFLAG (<==? MVER MAC>
		  <FONT .F>)>
	 <TELL CLEAR SCROLL>
	 <COND (<EQUAL? .CHR !\0>
		<RTRUE>)>
	 <TELL
"It was a Golden Age, or so it now seems; and there are but a few who can
recall those years, and fewer still who would not tremble to speak of what
followed." CR CR>
	 <TELL
"But we were younger then, and less wise. It seems strange now to think
that I had never set foot outside our village when I was called upon to
take part in a great adventure - that fateful Journey which changed our
lives forever...." CR>
	 <TELL MORE CLEAR>>

<CONSTANT BAD-GUY "Dread Lord">