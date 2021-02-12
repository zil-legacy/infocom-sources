"CONTROLS for
		      		JOURNEY
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<CONSTANT SERIAL 0>

<ROUTINE TELL-GAME-ID ("AUX" (CNT 17))
	 <TELL "Release " N <BAND <GET 0 1> *3777*>
	       " / Serial number ">
	 <REPEAT ()
		 <COND (<G? <SET CNT <+ .CNT 1>> 23>
			<RETURN>)
		       (T
			<TELL C <GETB 0 .CNT>>)>>
	 <TELL " / ">
	 <TELL <GET ,MACHINES <LOWCORE INTID>> " Interpreter version "
	       N <LOWCORE (ZVERSION 0)> "." N <LOWCORE INTVR>>>

<CONSTANT MACHINES
	  <LTABLE "Dec-20"
		  "Apple IIe"
		  "Macintosh"
		  "Amiga"
		  "Atari ST"
		  "IBM"
		  "Commodore 128"
		  "Commodore 64"
		  "Apple IIc"
		  "Apple IIgs">><GLOBAL DONT-SCRIPT-INPUT <>>

<COMMAND STORY-ONLY>

<GLOBAL GRAPHICS-FLAG T>
<GLOBAL SCRIPTING-FLAG <>>
<GLOBAL DEBUG <>>



 