"THINGS for RAGER
Copyright (C) 1988 Infocom, Inc.  All rights reserved."

<OBJECT PSEUDO-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "pseudo")		;"Place holder (MUST BE 6 CHARACTERS!!!!!)"
	(ACTION NULL-F)		;"Place holder"
	(FLAGS SEENBIT)>

<ROUTINE RANDOM-PSEUDO ()
 <COND (<VERB? ASK-ABOUT ASK-CONTEXT-ABOUT LOOK-BEHIND LOOK-UNDER TELL-ABOUT>
	<RFALSE>)
       (<VERB? EXAMINE LOOK-INSIDE SEARCH>
	<NOTHING-SPECIAL>
	<RTRUE>)
       (T
	<WONT-HELP>
	;<TELL "You can't do anything useful with that." CR>)>>

<OBJECT GAME
	(LOC GLOBAL-OBJECTS)
	(DESC "RAGER")
	(SYNONYM GAME RAGER)
	(FLAGS NARTICLEBIT)
	(ACTION GAME-F)>

<ROUTINE GAME-F ()
 	 <COND (<VERB? EXAMINE FIND LAMP-ON PLAY READ THROUGH>
	        <SETG CLOCK-WAIT T>
	        <TELL "[You're playing it now!]" CR>)>>