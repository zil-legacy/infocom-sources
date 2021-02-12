"MOVE FILE for ARENA
Copyright (C) 1987 Infocom, Inc.  All rights reserved."

<CONSTANT DO-LAST <LTABLE ENTER-SF MOVE-WEST-SF MOVE-EAST-SF MOVE-NORTH-SF
			  MOVE-SOUTH-SF MOVE-NW-SF MOVE-NE-SF MOVE-SW-SF
			  MOVE-SE-SF MOVE-TO-GOAL-SF>>

<CONSTANT UNIMPLEMENTED <TABLE UNIMPLEMENTED-F "Unimplemented">>

<ROUTINE UNIMPLEMENTED-F ()
	 <TELL "Sorry, that command isn't implemented yet." CR>
	 <RFALSE>>

<CONSTANT REDRAW-SCREEN <TABLE REDRAW-SCREEN-F "Redraw Screen">>

<ROUTINE REDRAW-SCREEN-F ()
	 <CLEAR -1>
	 <SPLIT 17>
	 <FSET ,PLAYER ,MAP-ALTERED>
	 <UPDATE-SCREEN>
	 <FSET ,PLAYER ,STATUS-ALTERED>
	 <UPDATE-STATUS>
	 <RFALSE>>

<CONSTANT QUIT-TABLE <TABLE QUIT-F "Quit">>

<ROUTINE QUIT-F ()
	 <COND (<YES? "Do you really want to quit? ">
		<TELL "Be seeing you ..." CR>
		<SEND ,M-QUIT>
		<QUIT>)
	       (T
		<TELL "Ok" CR>
		<RFALSE>)>>

<CONSTANT REST-TABLE <TABLE REST-F "Rest">>

<ROUTINE REST-F ()
	 <PUTP ,PLAYER ,P?COMMAND ,REST-SF>
	 <RTRUE>>

<ROUTINE REST-SF (P)
	 <TELL-PLAYER .P "zzz ..." CR>>

<CONSTANT HELP <TABLE HELP-F "Help">>

<ROUTINE HELP-F ()
	 <TELL
".=rest A=attack C=cast D=drop E=enter/exit G=get I=inventory" CR
"L=look at P=put on Q=quit R=remove(unwear) T=talk W=wield" CR>
	 <RFALSE>>

<CONSTANT ENTER <TABLE ENTER-F "Enter/exit">>

<ROUTINE ENTER-F ()
	 <PUTP ,PLAYER ,P?COMMAND ,ENTER-SF>
	 <RTRUE>>

<ROUTINE ENTER-SF (P "AUX" X Y HERE EXITS MAP COL GOAL TMP)
	 <SET X <GETP .P ,P?X>>
	 <SET Y <GETP .P ,P?Y>>
	 <SET HERE <LOC .P>>
	 <SET EXITS <GETP .HERE ,P?EXITS>>
	 <SET MAP <GETP .HERE ,P?MAP>>
	 <SET COL <GETP .HERE ,P?COLUMNS>>
	 <SET GOAL <+ <* 256 <GETB .MAP <+ .X <* .Y .COL>>>>
		      ,ENTER-E>>
	 <COND (<OR <NOT .EXITS>
		    <NOT <SET EXITS <INTBL? .GOAL
					    <REST .EXITS 2>
					    </ <GET .EXITS 0> 4>
					    136>>>>
		<TELL-PLAYER .P "There is nothing here to enter." CR>
		<RFALSE>)>
	 <COND (<SET TMP <MAKE-DAEMON ,EXIT-DAE .X .Y>>
		<MOVE .TMP .HERE>)>
	 <COND (<FSET? <SET HERE <GET .EXITS 1>> ,SPECIAL-ROOMS>
		<MOVE .P .HERE>
		<COND (<GETP .P ,P?ID>
		       <ENDMOVE <GETP .P ,P?ID>>
		       <SERVER <- <GETP .P ,P?ID>>>)>)
	       (T
	 <PUT-ON-MAP .P .HERE <GET .EXITS 2> <GET .EXITS 3>>)>>

<CONSTANT INVENTORY <TABLE INVENTORY-F "Inventory">>

<ROUTINE INVENTORY-F ()
	 <CHOOSE-ONE ,INVENTORY-CH-F ,PRINT-NAME-WEAR>
	 <RFALSE>>

<ROUTINE INVENTORY-CH-F ("AUX" CUR CNT)
	 <SET CNT 0>
	 <SET CUR <FIRST? ,PLAYER>>
	 <REPEAT ()
	   <COND (<NOT .CUR>
		  <RETURN>)>
	   <COND (<NOT <FSET? .CUR ,DAEMON-TYPE>>
		  <SET CNT <+ 1 .CNT>>
		  <COND (<G? .CNT ,G-TABLE-MAX>
			 <TELL "Too many items in the inventory !!!" CR>
			 <SET CNT <- .CNT 1>>
			 <RETURN>)>
		  <PUT ,G-TABLE .CNT .CUR>)>
	   <SET CUR <NEXT? .CUR>>>
	 <COND (<L? .CNT 1>
		<TELL "You are empty handed." CR>
		<RFALSE>)>
	 <PUT ,G-TABLE 0 .CNT>
	 <RTRUE>>

<CONSTANT CAST <TABLE CAST-F "Cast">>

<ROUTINE CAST-F ("AUX" SPELL L)
	 <COND (<NOT <SET SPELL <CHOOSE-ONE ,CAST-CH-F ,PRINT-SPELL>>>
		<RFALSE>)>
	 <SET SPELL <GET ,G-TABLE .SPELL>>
	 <COND (<G? <GET .SPELL 2> <GETP ,PLAYER ,P?MG>>
		<TELL "You don't have enough magic points to cast this spell."
		      CR>
		<RFALSE>)>
	 <COND (<NOT <APPLY <GET .SPELL 0>>>
		<RFALSE>)>
	 <PUTP ,PLAYER ,P?MG <- <GETP ,PLAYER ,P?MG> <GET .SPELL 2>>>
	 <FSET ,PLAYER ,STATUS-ALTERED>
	 <RTRUE>>

<ROUTINE CAST-CH-F ("AUX" SPELL L)
	 <SET SPELL <GETP ,PLAYER ,P?SPELLS>>
	 <COND (<EQUAL? 0 <SET L <GET .SPELL 0>>>
		<TELL "You don't know any spells." CR>
		<RFALSE>)>
	 <COPYT .SPELL ,G-TABLE <* 2 <+ 1 .L>>>
	 <RTRUE>>

<CONSTANT WIELD <TABLE WIELD-F "Wield">>

<ROUTINE WIELD-F ("AUX" CNT)
	 <COND (<NOT <SET .CNT <CHOOSE-ONE ,WIELD-CH-F ,PRINT-NAME-WEAR>>>
		<RFALSE>)
	       (<EQUAL? .CNT 1>
		<PUT <GETP ,PLAYER ,P?COMMAND-AUX> 0 0>)
	       (T
		<PUT <GETP ,PLAYER ,P?COMMAND-AUX> 0 <GET ,G-TABLE .CNT>>)>
	 <PUTP ,PLAYER ,P?COMMAND ,WIELD-SF>
	 <RTRUE>>

<ROUTINE WIELD-CH-F ("AUX" CNT CUR)
	 <SET CNT 1>
	 <PUT ,G-TABLE .CNT ,NOTHING>
	 <SET CUR <FIRST? ,PLAYER>>
	 <REPEAT ()
	   <COND (<NOT .CUR>
		  <RETURN>)>
	   <COND (<AND <FSET? .CUR ,WEAPONBIT>
		       <BAND <GETP <GETP .CUR ,P?TYPE> ,P?USABLE>
			     <PROF <GETP ,PLAYER ,P?CLASS>>>>
		  <SET CNT <+ 1 .CNT>>
		  <COND (<G? .CNT ,G-TABLE-MAX>
			 <TELL "Too many items in the inventory !!!" CR>
			 <SET CNT <- .CNT 1>>
			 <RETURN>)>
		  <PUT ,G-TABLE .CNT .CUR>)>
	   <SET CUR <NEXT? .CUR>>>
	 <COND (<L? .CNT 2>
		<TELL "You have no weapons." CR>
		<RFALSE>)>
	 <PUT ,G-TABLE 0 .CNT>
	 <RTRUE>>

<ROUTINE WIELD-SF (P "AUX" WEAP ID)
	 <SET ID <GETP .P ,P?ID>>
	 <COND (<SET WEAP <FIND-WEAPON .P>>
		<FCLEAR .WEAP ,BEING-WIELDED>)>
	 <COND (<NOT <SET WEAP <GET <GETP .P ,P?COMMAND-AUX> 0>>>
		<TELL-PLAYER .P "You are now wielding nothing." CR>)
	       (<EQUAL? <LOC .WEAP> .P>
		<FSET .WEAP ,BEING-WIELDED>
		<COND (<G? .ID 0>
		       <DIROUT 6 .ID>
		       <TELL "You are now wielding ">
		       <PRINT-NAME .WEAP T T>
		       <TELL "." CR>
		       <DIROUT -6>)>)
	       (<G? .ID 0>
		<DIROUT 6 .ID>
		<TELL "Strangely enough, you no longer have ">
		<PRINT-NAME .WEAP T T>
		<TELL "." CR>
		<DIROUT -6>)>>

<CONSTANT USE-IT <TABLE USE-F "Use">>

<ROUTINE USE-F ("AUX" CNT)
	 <COND (<NOT <SET .CNT <CHOOSE-ONE ,USE-CH-F ,PRINT-NAME-WEAR>>>
		<RFALSE>)
	       (T
		<PUT <GETP ,PLAYER ,P?COMMAND-AUX> 0 <GET ,G-TABLE .CNT>>)>
	 <PUTP ,PLAYER ,P?COMMAND ,USE-SF>
	 <RTRUE>>

<ROUTINE USE-CH-F ("AUX" CNT CUR)
	 <SET CNT 0>
	 <SET CUR <FIRST? ,PLAYER>>
	 <REPEAT ()
	   <COND (<NOT .CUR>
		  <RETURN>)>
	   <COND (<AND <FSET? .CUR ,USEBIT>
		       <BAND <GETP <GETP .CUR ,P?TYPE> ,P?USABLE>
			     <PROF <GETP ,PLAYER ,P?CLASS>>>>
		  <SET CNT <+ 1 .CNT>>
		  <COND (<G? .CNT ,G-TABLE-MAX>
			 <TELL "Too many items in the inventory !!!" CR>
			 <SET CNT <- .CNT 1>>
			 <RETURN>)>
		  <PUT ,G-TABLE .CNT .CUR>)>
	   <SET CUR <NEXT? .CUR>>>
	 <COND (<L? .CNT 1>
		<TELL "You have no usable items." CR>
		<RFALSE>)>
	 <PUT ,G-TABLE 0 .CNT>
	 <RTRUE>>

<ROUTINE USE-SF (P "AUX" OBJ ID)
	 <SET ID <GETP .P ,P?ID>>
	 <COND (<EQUAL? <LOC <SET OBJ <GET <GETP .P ,P?COMMAND-AUX> 0>>> .P>
		<APPLY <GETP .OBJ ,P?ACTION> .P>
		<MOVE .OBJ ,OBJECT-DUMP>)
	       (<G? .ID 0>
		<DIROUT 6 .ID>
		<TELL "Strangely enough, you no longer have ">
		<PRINT-NAME .OBJ T T>
		<TELL "." CR>
		<DIROUT -6>)>>

<CONSTANT WEAR <TABLE WEAR-F "Wear">>

<ROUTINE WEAR-F ("AUX" CUR CNT)
	 <COND (<NOT <SET .CNT <CHOOSE-ONE ,WEAR-CH-F ,PRINT-NAME-WEAR>>>
		<RFALSE>)>
	 <SET CNT <GET ,G-TABLE .CNT>>
	 <SET CUR <FIRST? ,PLAYER>>
	 <REPEAT ()
	   <COND (<NOT .CUR>
		  <RETURN>)
		 (<AND <FSET? .CUR ,BEING-WORN>
		       <EQUAL? <GETP <GETP .CUR ,P?TYPE> ,P?CLASS>
			       <GETP <GETP .CNT ,P?TYPE> ,P?CLASS>>>
		  <TELL "You'll have to take off ">
		  <PRINT-NAME .CUR T T>
		  <TELL " before putting on ">
		  <PRINT-NAME .CNT T T>
		  <CRLF>
		  <RFALSE>)>
	   <SET CUR <NEXT? .CUR>>>
	 <PUT <GETP ,PLAYER ,P?COMMAND-AUX> 0 .CNT>
	 <PUTP ,PLAYER ,P?COMMAND ,WEAR-SF>
	 <RTRUE>>

<ROUTINE WEAR-CH-F ("AUX" CNT CUR)
	 <SET CNT 0>
	 <SET CUR <FIRST? ,PLAYER>>
	 <REPEAT ()
	   <COND (<NOT .CUR>
		  <RETURN>)>
	   <COND (<AND <AND <FSET? .CUR ,WEARBIT>
			    <NOT <FSET? .CUR ,BEING-WORN>>>
		       <BAND <GETP <GETP .CUR ,P?TYPE> ,P?USABLE>
			     <PROF <GETP ,PLAYER ,P?CLASS>>>>
		  <SET CNT <+ 1 .CNT>>
		  <COND (<G? .CNT ,G-TABLE-MAX>
			 <TELL "Too many items in the inventory !!!" CR>
			 <SET CNT <- .CNT 1>>
			 <RETURN>)>
		  <PUT ,G-TABLE .CNT .CUR>)>
	   <SET CUR <NEXT? .CUR>>>
	 <COND (<L? .CNT 1>
		<TELL "You have nothing to wear." CR>
		<RFALSE>)>
	 <PUT ,G-TABLE 0 .CNT>
         <RTRUE>>

<ROUTINE WEAR-SF (P "AUX" CUR ID TMP)
	 <SET ID <GETP .P ,P?ID>>
	 <COND (<NOT <SET CUR <GET <GETP .P ,P?COMMAND-AUX> 0>>>
		<TELL-PLAYER .P "Error in wear: null object put on." CR>)
	       (<EQUAL? <LOC .CUR> .P>
		<FSET .CUR ,BEING-WORN>
		<RECALCULATE-AC .P>
		<COND (<SET TMP <GETP <GETP .CUR ,P?TYPE> ,P?WEAR-F>>
		       <APPLY .TMP .P>)>
		<COND (<G? .ID 0>
		       <DIROUT 6 .ID>
		       <TELL "You are now wearing ">
		       <PRINT-NAME .CUR T T>
		       <TELL "." CR>
		       <DIROUT -6>)>)
	       (<G? .ID 0>
		<DIROUT 6 .ID>
		<TELL "Strangely enough, you no longer have ">
		<PRINT-NAME .CUR T T>
		<TELL "." CR>
		<DIROUT -6>)>>

<CONSTANT REMOVE-TABLE <TABLE REMOVE-F "Remove">>

<ROUTINE REMOVE-F ("AUX" CNT)
	 <COND (<NOT <SET .CNT <CHOOSE-ONE ,REMOVE-CH-F ,PRINT-NAME-WEAR>>>
		<RFALSE>)>
	 <PUT <GETP ,PLAYER ,P?COMMAND-AUX> 0 <GET ,G-TABLE .CNT>>
	 <PUTP ,PLAYER ,P?COMMAND ,REMOVE-SF>
	 <RTRUE>>

<ROUTINE REMOVE-CH-F ("AUX" CNT CUR)
	 <SET CNT 0>
	 <SET CUR <FIRST? ,PLAYER>>
	 <REPEAT ()
	   <COND (<NOT .CUR>
		  <RETURN>)>
	   <COND (<FSET? .CUR ,BEING-WORN>
		  <SET CNT <+ 1 .CNT>>
		  <COND (<G? .CNT ,G-TABLE-MAX>
			 <TELL "Too many items in the inventory !!!" CR>
			 <SET CNT <- .CNT 1>>
			 <RETURN>)>
		  <PUT ,G-TABLE .CNT .CUR>)>
	   <SET CUR <NEXT? .CUR>>>
	 <COND (<L? .CNT 1>
		<TELL "You aren't wearing anything." CR>
		<RFALSE>)>
	 <PUT ,G-TABLE 0 .CNT>>

<ROUTINE REMOVE-SF (P "AUX" CUR ID TMP)
	 <SET ID <GETP .P ,P?ID>>
	 <COND (<NOT <SET CUR <GET <GETP .P ,P?COMMAND-AUX> 0>>>
		<TELL-PLAYER .P "Error in remove: null object put on." CR>)
	       (<EQUAL? <LOC .CUR> .P>
		<FCLEAR .CUR ,BEING-WORN>
		<RECALCULATE-AC .P>
		<COND (<SET TMP <GETP <GETP .CUR ,P?TYPE> ,P?REMOVE-F>>
		       <APPLY .TMP .P>)>
		<COND (<G? .ID 0>
		       <DIROUT 6 .ID>
		       <TELL "You have removed ">
		       <PRINT-NAME-WEAR .CUR T T>
		       <TELL "." CR>
		       <DIROUT -6>)>)
	       (<G? .ID 0>
		<DIROUT 6 .ID>
		<TELL "Strangely enough, you no longer have ">
		<PRINT-NAME-WEAR .CUR T T>
		<TELL "." CR>
		<DIROUT -6>)>>

<CONSTANT DROP <TABLE DROP-F "Drop">>

<ROUTINE DROP-F ("AUX" CNT)
	 <COND (<NOT <SET .CNT <CHOOSE-ONE ,DROP-CH-F ,PRINT-NAME-WEAR>>>
		<RFALSE>)
	       (T
		<PUT <GETP ,PLAYER ,P?COMMAND-AUX> 0 <GET ,G-TABLE .CNT>>)>
	 <PUTP ,PLAYER ,P?COMMAND ,DROP-SF>
	 <RTRUE>>

<ROUTINE DROP-CH-F ("AUX" CUR CNT)
	 <SET CNT 0>
	 <SET CUR <FIRST? ,PLAYER>>
	 <REPEAT ()
	   <COND (<NOT .CUR>
		  <RETURN>)>
	   <COND (<AND <NOT <FSET? .CUR ,DAEMON-TYPE>>
		       <NOT <FSET? .CUR ,BEING-WORN>>
		       <NOT <EQUAL? .CUR <FIND-WEAPON ,PLAYER>>>>
		  <SET CNT <+ 1 .CNT>>
		  <COND (<G? .CNT ,G-TABLE-MAX>
			 <TELL "Too many items in the inventory !!!" CR>
			 <SET CNT <- .CNT 1>>
			 <RETURN>)>
		  <PUT ,G-TABLE .CNT .CUR>)>
	   <SET CUR <NEXT? .CUR>>>
	 <COND (<L? .CNT 1>
		<TELL "You have nothing to drop." CR>
		<RFALSE>)>
	 <PUT ,G-TABLE 0 .CNT>>

<ROUTINE DROP-SF (P "AUX" CUR ID)
	 <SET ID <GETP .P ,P?ID>>
	 <COND (<NOT <SET CUR <GET <GETP .P ,P?COMMAND-AUX> 0>>>
		<TELL-PLAYER .P "Error in drop: null object dropped." CR>)
	       (<EQUAL? <LOC .CUR> .P>
		<PUT-ON-MAP .CUR <LOC .P> <GETP .P ,P?X> <GETP .P ,P?Y>>
		<COND (<G? .ID 0>
		       <DIROUT 6 .ID>
		       <TELL "You have dropped ">
		       <PRINT-NAME-WEAR .CUR T T>
		       <TELL "." CR>
		       <DIROUT -6>)>)
	       (<G? .ID 0>
		<DIROUT 6 .ID>
		<TELL "Strangely enough, you no longer have ">
		<PRINT-NAME-WEAR .CUR T T>
		<TELL "." CR>
		<DIROUT -6>)>>

<CONSTANT GET-TABLE <TABLE GET-F "Get">>

<ROUTINE GET-F ("AUX" CUR INP)
	 <COND (<NOT <SET INP <CHOOSE-TARGET "Get what? " 1 ,T-OBJS>>>
		<RFALSE>)>
	 <SET CUR <GET ,G-TABLE .INP>>
	 <COND (<NOT <FSET? .CUR ,TAKEBIT>>
		<TELL "You can't take this object." CR>
		<RFALSE>)>
	 <PUT <GETP ,PLAYER ,P?COMMAND-AUX> 0 .CUR>
	 <PUTP ,PLAYER ,P?COMMAND ,GET-SF>
	 <RTRUE>>

<ROUTINE GET-SF (P "AUX" CUR ID TMP)
	 <SET ID <GETP .P ,P?ID>>
	 <COND (<NOT <SET CUR <GET <GETP .P ,P?COMMAND-AUX> 0>>>
		<TELL-PLAYER .P "Error in get: null object taken." CR>)
	       (<EQUAL? <LOC .CUR> <LOC .P>>
		<COND (<SET TMP <MAKE-DAEMON ,EXIT-DAE
					     <GETP .CUR ,P?X>
					     <GETP .CUR ,P?Y>>>
		       <MOVE .TMP <LOC .CUR>>)>
		<COND (<EQUAL? ,GOLD <GETP .CUR ,P?TYPE>>
		       <PUTP .P ,P?GOLD <+ <GETP .P ,P?GOLD>
					   <GETP .CUR ,P?QUANTITY>>>
		       <FSET .P ,STATUS-ALTERED>
		       <MOVE .CUR ,OBJECT-DUMP>)
		      (T
		       <MOVE .CUR .P>)>
		<COND (<G? .ID 0>
		       <DIROUT 6 .ID>
		       <TELL "You have taken ">
		       <PRINT-NAME-WEAR .CUR T T>
		       <TELL "." CR>
		       <DIROUT -6>)>)
	       (<G? .ID 0>
		<DIROUT 6 .ID>
		<TELL "Strangely enough, you no longer see ">
		<PRINT-NAME-WEAR .CUR T T>
		<TELL "." CR>
		<DIROUT -6>)>>

<CONSTANT LOOK-AT <TABLE LOOK-AT-F "Look at">>

<ROUTINE LOOK-AT-F ("AUX" INP CUR)
	 <COND (<NOT <SET INP <CHOOSE-TARGET "Look at what? "
					     1000
					     <+ ,T-CHARS ,T-OBJS>>>>
		<RFALSE>)>
	 <SET CUR <GET ,G-TABLE .INP>>
	 <TELL "You see ">
	 <PRINT-NAME-WEAR .CUR T>
	 <COND (<FSET? .CUR ,CHAR-TYPE>
		<COND (<SET INP <GETP .CUR ,P?CLASS>>
		       <TELL " the " <PROFSTR .INP>>)>
		<COND (<SET INP <FIND-WEAPON .CUR>>
		       <TELL " wielding ">
		       <PRINT-NAME .INP T>)>
		<TELL "." CR>
		<COND (<FSET? .CUR ,HUMANOID> <TELL "He">)
		      (ELSE <TELL "It">)>
		<TELL " is ">
		<SET INP </ <* 10 <GETP .CUR ,P?HP>> <GETP .CUR ,P?MAX-HP>>>
		<COND (<L? .INP 0>
		       <TELL "dead." CR>)
		      (T
		       <TELL <GET ,HEALTH-TABLE .INP>>
		       <COND (<FSET? .CUR ,POISONED>
			      <TELL ", but it doesn't look well">)>
		       <TELL "." CR>)>)
	       (T
		<TELL "." CR>)>
	 <RFALSE>>

<CONSTANT HEALTH-TABLE <TABLE "almost dead" "gravely wounded"
			      "very badly wounded" "badly wounded"
			      "seriously wounded" "wounded" "hurt"
			      "slightly wounded" "nicked once or twice"
			      "in excellent health" "in perfect health">>

<CONSTANT TALK <TABLE TALK-F "Talk">>

<ROUTINE TALK-F ("AUX" INP CUR L)
	 <COND (<NOT <SET INP <CHOOSE-TARGET "Talk to who? "
					     1000 ,T-CHARS>>>
		<RFALSE>)>
	 <SET CUR <GET ,G-TABLE .INP>>
	 <TELL "What do you wish to say to ">
	 <PRINT-NAME .CUR T>
	 <TELL "?" CR>
	 <PUTB ,INBUF 1 0>
	 <SETG ABORT <>>
	 <READ ,INBUF <> 1 ,INPUT-TIMEOUT>
	 <PUTB ,INBUF 1 0>
	 <REPEAT ()
	   <TELL "->">
	   <COND (<GETB ,INBUF 1>
		  <PRINTT <REST ,INBUF 2> <GETB ,INBUF 1>>)>
	   <SETG ABORT <>>
	   <READ ,INBUF <> <TIME-LEFT> ,INPUT-TIMEOUT>
	   <COND (,ABORT
		  <CRLF>
		  <FINISH-ROUND>)
		 (T
		  <RETURN>)>>
	 <COND (<G? <SET L <GETB ,INBUF 1>> ,MAX-TALK-LENGTH>
		<SET L ,MAX-TALK-LENGTH>)>
	 <PUTB <GET ,TALK-TABLE <- ,ID 1>> 0 .L>
	 <COPYT <REST ,INBUF 2> <REST <GET ,TALK-TABLE <- ,ID 1>> 1> .L>
	 <PUT <GETP ,PLAYER ,P?COMMAND-AUX> 0 .CUR>
	 <PUTP ,PLAYER ,P?COMMAND ,TALK-SF>
	 <RTRUE>>

<ROUTINE TALK-SF (P "AUX" CUR P-ID ID TMP)
	 <COND (<NOT <SET CUR <GET <GETP .P ,P?COMMAND-AUX> 0>>>
		<TELL-PLAYER .P "You feel rather silly talking to yourself.">
		<RFALSE>)>
	 <COND (<SET P-ID <GETP .P ,P?ID>>
		<DIROUT 6 .P-ID>
		<PRINT-NAME .CUR T T T>
		<TELL " heard you." CR>
		<DIROUT -6>)>
	 <COND (<SET ID <GETP .CUR ,P?ID>>
		<SET TMP <GET ,TALK-TABLE <- .P-ID 1>>>
		<DIROUT 6 .ID>
		<PRINT-NAME .P T T T>
		<TELL " says, `">
		<PRINTT <REST .TMP 1> <GETB .TMP 0>>
		<TELL "'" CR>
		<DIROUT -6>)>>

<CONSTANT YELL <TABLE YELL-F "Yell">>

<ROUTINE YELL-F ("AUX" INP L)
	 <TELL "What do you wish to yell ?" CR>
	 <PUTB ,INBUF 1 0>
	 <SETG ABORT <>>
	 <READ ,INBUF <> 1 ,INPUT-TIMEOUT>
	 <PUTB ,INBUF 1 0>
	 <REPEAT ()
	   <TELL "->">
	   <COND (<GETB ,INBUF 1>
		  <PRINTT <REST ,INBUF 2> <GETB ,INBUF 1>>)>
	   <SETG ABORT <>>
	   <READ ,INBUF <> <TIME-LEFT> ,INPUT-TIMEOUT>
	   <COND (,ABORT
		  <CRLF>
		  <FINISH-ROUND>)
		 (T
		  <RETURN>)>>
	 <COND (<G? <SET L <GETB ,INBUF 1>> ,MAX-TALK-LENGTH>
		<SET L ,MAX-TALK-LENGTH>)>
	 <PUTB <GET ,TALK-TABLE <- ,ID 1>> 0 .L>
	 <COPYT <REST ,INBUF 2> <REST <GET ,TALK-TABLE <- ,ID 1>> 1> .L>
	 <PUTP ,PLAYER ,P?COMMAND ,YELL-SF>
	 <RTRUE>>

<ROUTINE YELL-SF (P "AUX" CUR ID TMP)
	 <COND (<NOT <SET TMP <GETP .P ,P?ID>>>
		<TELL "Wierdness in yell!  Yeller ID = 0" CR>
		<RTRUE>)>
	 <SET TMP <GET ,TALK-TABLE <- .TMP 1>>>
	 <SET CUR <FIRST? <LOC .P>>>
	 <REPEAT ()
	   <COND (<NOT .CUR>
		  <RETURN>)>
	   <COND (<AND <FSET? .CUR ,CHAR-TYPE>
		       <SET ID <GETP .CUR ,P?ID>>>
		  <DIROUT 6 .ID>
		  <PRINT-NAME .P T T T>
		  <TELL " yells, `">
		  <PRINTT <REST .TMP 1> <GETB .TMP 0>>
		  <TELL "'" CR>
		  <DIROUT -6>)>
	   <SET CUR <NEXT? .CUR>>>>

<CONSTANT ATTACK <TABLE ATTACK-F "Attack">>

<ROUTINE ATTACK-F ("AUX" W RANGE CUR)
	 <SET W <FIND-WEAPON ,PLAYER>>
	 <COND (.W
		<SET RANGE <GETP <GETP .W ,P?TYPE> ,P?RANGE>>)
	       (T
		<SET RANGE 1>)>
	 <COND (<NOT <SET CUR <CHOOSE-TARGET "Attack who? " .RANGE ,T-CHARS>>>
		<RFALSE>)>
	 <SET CUR <GET ,G-TABLE .CUR>>
	 <PUT <GETP ,PLAYER ,P?COMMAND-AUX> 0 .CUR>
	 <PUTP ,PLAYER ,P?COMMAND ,ATTACK-SF>
	 <RTRUE>>

<ROUTINE ATTACK-SF (P "AUX" CUR P-ID ID TMP WEAP KILLED?)
	 <COND (<NOT <SET CUR <GET <GETP .P ,P?COMMAND-AUX> 0>>>
		<TELL-PLAYER .P "You deal a death blow to the open air.">
		<RFALSE>)>
	 <SET P-ID <GETP .P ,P?ID>>
	 <SET ID <GETP .CUR ,P?ID>>
	 <FCLEAR .P ,INVISIBLE>
	 <COND (<SET WEAP <FIND-WEAPON .P>>
		<SET TMP <GETP <GETP .WEAP ,P?TYPE> ,P?DAMAGE>>)
	       (T
		<SET TMP <GETP .P ,P?RACE>>)>
	 <COND (<HIT? .P .CUR>
		<COND (.WEAP
		       <SET KILLED? <DAMAGE-CHARACTER .CUR
						      <ROLL <WEAPNDICE .TMP>
							    <WEAPDDICE .TMP>>
						      .P>>)
		      (T
		       <SET KILLED? <DAMAGE-CHARACTER .CUR
						      <ROLL <RACENDICE .TMP>
							    <RACEDDICE .TMP>>
						      .P>>)>
		<COND (.P-ID
		       <DIROUT 6 .P-ID>
		       <TELL "You " <HIT-OR-KILLED .KILLED?> " ">
		       <PRINT-NAME .CUR T T>
		       <TELL "." CR>
		       <DIROUT -6>)>
		<COND (.ID
		       <DIROUT 6 .ID>
		       <TELL "You were " <HIT-OR-KILLED .KILLED?> " by ">
		       <PRINT-NAME .P T>
		       <COND (.WEAP
			      <TELL "'s ">
			      <PRINT-NAME .WEAP>)>
		       <TELL "." CR>
		       <DIROUT -6>)>
		<FSET .CUR ,STATUS-ALTERED>)
	       (T
		<COND (.P-ID
		       <DIROUT 6 .P-ID>
		       <TELL "You missed ">
		       <PRINT-NAME .CUR T T>
		       <TELL "." CR>
		       <DIROUT -6>)>
		<COND (.ID
		       <DIROUT 6 .ID>
		       <TELL "You were missed by ">
		       <PRINT-NAME .P T>
		       <COND (.WEAP
			      <TELL "'s ">
			      <PRINT-NAME .WEAP>)>
		       <TELL "." CR>
		       <DIROUT -6>)>)>>

<CONSTANT SPECIAL-TABLE <TABLE SPECIAL-F "Special commands">>

<ROUTINE SPECIAL-F ("AUX" CLASS)
	 <COND (<EQUAL? <SET CLASS <GETP ,PLAYER ,P?CLASS>> ,THIEF>
		<TELL "The only special command thus far is pickpocket, so ..."
		      CR>
		<RETURN <PICK-POCKET-F>>)
	       (T
		<TELL "There are no special commands for " <PROFSTR .CLASS>
		      "s yet." CR>
		<RFALSE>)>>
		      
<ROUTINE PICK-POCKET-F ("AUX" CUR)
	 <COND (<NOT <SET CUR <CHOOSE-TARGET "Pick pocket who? " 1 ,T-CHARS>>>
		<RFALSE>)>
	 <SET CUR <GET ,G-TABLE .CUR>>
	 <PUT <GETP ,PLAYER ,P?COMMAND-AUX> 0 .CUR>
	 <PUTP ,PLAYER ,P?COMMAND ,PICK-POCKET-SF>
	 <RTRUE>>

<ROUTINE PICK-POCKET-SF (P "AUX" CUR P-ID ID PROB R)
	 <COND (<NOT <SET CUR <GET <GETP .P ,P?COMMAND-AUX> 0>>>
		<TELL-PLAYER .P "It helps if there is a pocket here to pick.">
		<RFALSE>)>
	 <SET P-ID <GETP .P ,P?ID>>
	 <SET ID <GETP .CUR ,P?ID>>
	 <SET PROB <+ <- <+ <GETP .P ,P?LEVEL> <ABIL-ADJUST .P 3>>
			 <ABIL-ADJUST .CUR 1>> 5>>
	 <SET R <RANDOM 20>>
	 <COND (<G? .R .PROB>
		<TELL-PLAYER .P "Your pickpocketing attempt was unsuccessful." CR>
		<COND (<G? .R <+ .PROB 4>>
		       <TELL-PLAYER .P "In fact, your victim noticed the attempt!" CR>
		       <FCLEAR .P ,INVISIBLE>
		       <PUTP .CUR ,P?ANGRY-AT .P>
		       <COND (.ID
			      <DIROUT 6 .ID>
			      <PRINT-NAME .P T T>
			      <TELL " just attempted to pick your pocket !" CR>
			      <DIROUT -6>)>)>)
	       (T
		<COND (<NOT <EQUAL? .P .CUR>>
		       <SET PROB <- <GETP .CUR ,P?LEVEL>
				    <GETP .P ,P?LEVEL>>>
		       <COND (<L? .PROB 1> <SET PROB 1>)>
		       <PUTP .P ,P?XP
			     <+ <* 3 .PROB>
				<GETP .P ,P?XP>>>
		       <FSET .P ,STATUS-ALTERED>)>
		<SET PROB 0>
		<SET R <FIRST? .CUR>>
		<REPEAT ()
		  <COND (<NOT .R>
			 <RETURN>)>
		  <SET PROB <+ 1 .PROB>>
		  <PUT ,G-TABLE .PROB .R>
		  <SET R <NEXT? .R>>>
		<SET R <RANDOM <+ .PROB 2>>>
		<COND (<G? .R .PROB>
		       <SET R 0>)
		      (T
		       <SET R <GET ,G-TABLE .R>>
		       <COND (<OR <NOT <FSET? .R ,OBJ-TYPE>>
				  <OR <FSET? .R ,BEING-WORN>
				      <FSET? .R ,BEING-WIELDED>>>
			      <SET R 0>)>)>
		<COND (.R
		       <MOVE .R .P>
		       <FCLEAR .R ,NAMED>
		       <COND (.P-ID
			      <DIROUT 6 .P-ID>
			      <TELL "Your nimble fingers netted you ">
			      <PRINT-NAME .R T>
			      <TELL "." CR>
			      <DIROUT -6>)>)
		      (T
		       <COND (<GETP .CUR ,P?GOLD>
			      <SET R <RANDOM <GETP .CUR ,P?GOLD>>>)
			     (T
			      <SET R 0>)>
		       <PUTP .P ,P?GOLD <+ .R <GETP .P ,P?GOLD>>>
		       <FSET .P ,STATUS-ALTERED>
		       <PUTP .CUR ,P?GOLD <- <GETP .CUR ,P?GOLD> .R>>
		       <TELL-PLAYER .P "Your nimble fingers netted you "
				    N .R " gold." CR>)>)>>

<ROUTINE MOVE-ALL (P DX DY "AUX" HERE TO-X TO-Y
		     SCR-X SCR-Y X Y FROM TO MAP COL)
	 <SET SCR-X <GETP .P ,P?SCR-X>>
	 <SET SCR-Y <GETP .P ,P?SCR-Y>>
	 <SET X <GETP .P ,P?X>>
	 <SET Y <GETP .P ,P?Y>>
	 <SET TO-X <+ .DX .X>>
	 <SET TO-Y <+ .DY .Y>>
	 <SET HERE <LOC .P>>
	 <SET MAP <GETP .HERE ,P?MAP>>
	 <SET COL <GETP .HERE ,P?COLUMNS>>
	 <COND (<OR <L? .TO-X 0>
		    <L? .TO-Y 0>
		    <G? .TO-X <- .COL 1>>
		    <G? .TO-Y <- <GETP .HERE ,P?ROWS> 1>>>
		<TELL-PLAYER .P "You've reached the end of the world!" CR>
		<RFALSE>)>
	 <SET FROM <GETB .MAP <+ .X <* .Y .COL>>>>
	 <SET TO <GETB .MAP <+ .TO-X <* .TO-Y .COL>>>>
	 <COND (<NOT <TRY-MOVE .P .FROM .TO>>
		<RFALSE>)>
	 <COND (<APPLY <GETP .P ,P?ENTANGLED> .P>
		<RFALSE>)>
	 <FSET .P ,MOVED>
	 <COND (<NOT <EQUAL? .DX 0>>
		<PUTP .P ,P?X .TO-X>
		<SET SCR-X <+ .SCR-X .DX>>
		<PUTP .P ,P?SCR-X .SCR-X>
		<COND (<OR <L? .SCR-X ,X-DIST>
			   <G? .SCR-X <- ,MAP-COLUMNS ,X-DIST>>>
		       <COND (<CENTER-X .P>
			      <FSET .P ,MAP-ALTERED>)>)>)>
	 <COND (<NOT <EQUAL? .DY 0>>
		<PUTP .P ,P?Y .TO-Y>
		<SET SCR-Y <+ .SCR-Y .DY>>
		<PUTP .P ,P?SCR-Y .SCR-Y>
		<COND (<OR <L? .SCR-Y ,Y-DIST>
			   <G? .SCR-Y <- ,MAP-ROWS ,Y-DIST>>>
		       <COND (<CENTER-Y .P>
			      <FSET .P ,MAP-ALTERED>)>)>)>
	 <COND (<SET COL <LOOK-HERE-FOR .P ,P?ENTANGLED>>
		<APPLY .COL .P T>)>
	 <RTRUE>>

<ROUTINE TRY-MOVE (P FROM TO "AUX" PAIRS TMP TYPE ACTION HERE)
	 <SET HERE <LOC .P>>
	 <SET PAIRS <GETP .HERE ,P?PAIRS>>
	 <COND (<NOT <SET TMP <INTBL? .TO
				      <REST .PAIRS 2>
				      </ <GET .PAIRS 0> 2> 132>>>
		<RTRUE>)>
	 <SET PAIRS <GET .TMP 1>>
	 <COND (<NOT <OR <SET TMP <INTBL? .FROM
					  <REST .PAIRS 2>
					  </ <GET .PAIRS 0> 3> 134>>
			 <SET TMP <INTBL? 255
					  <REST .PAIRS 2>
					  </ <GET .PAIRS 0> 3> 134>>>>
		<RTRUE>)>
	 <SET TYPE <GET .TMP 1>>
	 <SET ACTION <GET .TMP 2>>
	 <COND (<EQUAL? .TYPE ,FREE-M>
		<TELL-PLAYER .P .ACTION CR>
		<RTRUE>)
	       (<EQUAL? .TYPE ,BLOCK>
		<TELL-PLAYER .P .ACTION CR>
		<RFALSE>)
	       (<EQUAL? .TYPE ,FUNC>
		<COND (<APPLY .ACTION .P>
		       <RTRUE>)
		      (T
		       <RFALSE>)>)
	       (<EQUAL? .TYPE ,ENTER-M>
		<COND (<SET TYPE <MAKE-DAEMON ,EXIT-DAE
					     <GETP .P ,P?X>
					     <GETP .P ,P?Y>>>
		       <MOVE .TYPE .HERE>)>
		<COND (<FSET? <GET .ACTION 0> ,SPECIAL-ROOMS>
		       <MOVE .P <GET .ACTION 0>>
		       <COND (<GETP .P ,P?ID>
			      <ENDMOVE <GETP .P ,P?ID>>
			      <SERVER <- <GETP .P ,P?ID>>>)>)
		      (T
		       <PUT-ON-MAP .P
				   <GET .ACTION 0>
				   <GET .ACTION 1>
				   <GET .ACTION 2>>)>
		<RFALSE>)
	       (T
		<TELL-PLAYER .P "Bad pairs type: "N .TYPE CR>
		<RFALSE>)>>

<ROUTINE CENTER-X (P "AUX" HERE COL SCR-X X)
	 <SET HERE <LOC .P>>
	 <SET COL <GETP .HERE ,P?COLUMNS>>
	 <SET SCR-X </ ,MAP-COLUMNS 2>>
	 <SET X <GETP .P ,P?X>>
	 <COND (<G? .SCR-X .X>
		<SET SCR-X .X>)
	       (<L? <- .COL .X> <- ,MAP-COLUMNS .SCR-X>>
		<SET SCR-X <+ ,MAP-COLUMNS <- .X .COL>>>)>
	 <COND (<EQUAL? .SCR-X <GETP .P ,P?SCR-X>>
		<RFALSE>)
	       (T
		<PUTP .P ,P?SCR-X .SCR-X>
		<RTRUE>)>>
	  
<ROUTINE CENTER-Y (P "AUX" HERE ROW SCR-Y Y)
	 <SET HERE <LOC .P>>
	 <SET ROW <GETP .HERE ,P?ROWS>>
	 <SET SCR-Y </ ,MAP-ROWS 2>>
	 <SET Y <GETP .P ,P?Y>>
	 <COND (<G? .SCR-Y .Y>
		<SET SCR-Y .Y>)
	       (<L? <- .ROW .Y> <- ,MAP-ROWS .SCR-Y>>
		<SET SCR-Y <+ ,MAP-ROWS <- .Y .ROW>>>)>
	 <COND (<EQUAL? .SCR-Y <GETP .P ,P?SCR-Y>>
		<RFALSE>)
	       (T
		<PUTP .P ,P?SCR-Y .SCR-Y>
		<RTRUE>)>>

<CONSTANT MOVE-WEST <TABLE MOVE-WEST-F "West">>

<ROUTINE MOVE-WEST-F ()
	 <PUTP ,PLAYER ,P?COMMAND ,MOVE-WEST-SF>
	 <RTRUE>>

<ROUTINE MOVE-WEST-SF (P)
	 <MOVE-ALL .P -1 0>>

<CONSTANT MOVE-EAST <TABLE MOVE-EAST-F "East">>

<ROUTINE MOVE-EAST-F ()
	 <PUTP ,PLAYER ,P?COMMAND ,MOVE-EAST-SF>
	 <RTRUE>>

<ROUTINE MOVE-EAST-SF (P)
	 <MOVE-ALL .P 1 0>>

<CONSTANT MOVE-NORTH <TABLE MOVE-NORTH-F "North">>

<ROUTINE MOVE-NORTH-F ()
	 <PUTP ,PLAYER ,P?COMMAND ,MOVE-NORTH-SF>
	 <RTRUE>>

<ROUTINE MOVE-NORTH-SF (P)
	 <MOVE-ALL .P 0 -1>>

<CONSTANT MOVE-SOUTH <TABLE MOVE-SOUTH-F "South">>

<ROUTINE MOVE-SOUTH-F ()
	 <PUTP ,PLAYER ,P?COMMAND ,MOVE-SOUTH-SF>
	 <RTRUE>>

<ROUTINE MOVE-SOUTH-SF (P)
	 <MOVE-ALL .P 0 1>>

<CONSTANT MOVE-NW <TABLE MOVE-NW-F "Northwest">>

<ROUTINE MOVE-NW-F ()
	 <PUTP ,PLAYER ,P?COMMAND ,MOVE-NW-SF>
	 <RTRUE>>

<ROUTINE MOVE-NW-SF (P)
	 <MOVE-ALL .P -1 -1>>

<CONSTANT MOVE-NE <TABLE MOVE-NE-F "Northeast">>

<ROUTINE MOVE-NE-F ()
	 <PUTP ,PLAYER ,P?COMMAND ,MOVE-NE-SF>
	 <RTRUE>>

<ROUTINE MOVE-NE-SF (P)
	 <MOVE-ALL .P 1 -1>>

<CONSTANT MOVE-SW <TABLE MOVE-SW-F "Southwest">>

<ROUTINE MOVE-SW-F ()
	 <PUTP ,PLAYER ,P?COMMAND ,MOVE-SW-SF>
	 <RTRUE>>

<ROUTINE MOVE-SW-SF (P)
	 <MOVE-ALL .P -1 1>>

<CONSTANT MOVE-SE <TABLE MOVE-SE-F "Southeast">>

<ROUTINE MOVE-SE-F ()
	 <PUTP ,PLAYER ,P?COMMAND ,MOVE-SE-SF>
	 <RTRUE>>

<ROUTINE MOVE-SE-SF (P)
	 <MOVE-ALL .P 1 1>>

<ROUTINE MOVE-TO-GOAL-SF (P "AUX" TMP)
	 <SET TMP <GET-MOVES-FOR-GOAL .P <GET <GETP .P ,P?COMMAND-AUX> 0>
				      <GET <GETP .P ,P?COMMAND-AUX> 1>>>
	 <COND (<LEGAL-MOVE? .P <GET .TMP 0> <GET .TMP 1>>
		<MOVE-ALL .P <GET .TMP 0> <GET .TMP 1>>)
	       (<LEGAL-MOVE? .P <GET .TMP 2> <GET .TMP 3>>
		<MOVE-ALL .P <GET .TMP 2> <GET .TMP 3>>)
	       (<LEGAL-MOVE? .P <GET .TMP 4> <GET .TMP 5>>
		<MOVE-ALL .P <GET .TMP 4> <GET .TMP 5>>)>>

<GLOBAL COMMANDS <TABLE
		  <> ;0
		  <> ;1
		  <> ;2
		  <> ;3
		  <> ;4
		  <> ;5
		  <> ;6
		  <> ;7
		  <> ;8
		  <> ;9
		  <> ;10
		  <> ;11
		  REDRAW-SCREEN ;12
		  <> ;13
		  <> ;14
		  <> ;15
		  <> ;16
		  <> ;17
		  REDRAW-SCREEN ;18
		  <> ;19
		  <> ;20
		  <> ;21
		  <> ;22
		  <> ;23
		  <> ;24
		  <> ;25
		  <> ;26
		  <> ;27
		  <> ;28
		  <> ;29
		  <> ;30
		  <> ;31
		  <> ;32
		  <> ;33
		  <> ;34
		  <> ;35
		  <> ;36
		  <> ;37
		  <> ;38
		  <> ;39
		  <> ;40
		  <> ;41
		  <> ;42
		  <> ;43
		  <> ;44
		  <> ;45
		  REST-TABLE ;46
		  <> ;47
		  <> ;48
		  <> ;49
		  <> ;50
		  <> ;51
		  <> ;52
		  <> ;53
		  <> ;54
		  <> ;55
		  <> ;56
		  <> ;57
		  <> ;58
		  <> ;59
		  <> ;60
		  <> ;61
		  <> ;62
		  HELP ;63
		  <> ;64
		  ATTACK ;65
		  <> ;66
		  CAST ;67
		  DROP ;68
		  ENTER ;69
		  <> ;70
		  GET-TABLE ;71
		  <> ;72
		  INVENTORY ;73
		  <> ;74
		  <> ;75
		  LOOK-AT ;76
		  <> ;77
		  <> ;78
		  <> ;79
		  WEAR ;80
		  QUIT-TABLE ;81
		  REMOVE-TABLE ;82
		  SPECIAL-TABLE ;83
		  TALK ;84
		  USE-IT ;85
		  <> ;86
		  WIELD ;87
		  <> ;88
		  YELL ;89
		  <> ;90
		  <> ;91
		  <> ;92
		  <> ;93
		  <> ;94
		  <> ;95
		  <> ;96
		  ATTACK ;97
		  <> ;98
		  CAST ;99
		  DROP ;100
		  ENTER ;101
		  <> ;102
		  GET-TABLE ;103
		  <> ;104
		  INVENTORY ;105
		  <> ;106
		  <> ;107
		  LOOK-AT ;108
		  <> ;109
		  <> ;110
		  <> ;111
		  WEAR ;112
		  QUIT-TABLE ;113
		  REMOVE-TABLE ;114
		  SPECIAL-TABLE ;115
		  TALK ;116
		  USE-IT ;117
		  <> ;118
		  WIELD ;119
		  <> ;120
		  YELL ;121
		  <> ;122
		  <> ;123
		  <> ;124
		  <> ;125
		  <> ;126
		  <> ;127
		  <> ;128
		  MOVE-NORTH ;129
		  MOVE-SOUTH ;130
		  MOVE-WEST ;131
		  MOVE-EAST ;132
		  <> ;133
		  <> ;134
		  <> ;135
		  <> ;136
		  <> ;137
		  MOVE-SW ;138
		  MOVE-SOUTH ;139
		  MOVE-SE ;140
		  MOVE-WEST ;141
		  <> ;142
		  MOVE-EAST ;143
		  MOVE-NW ;144
		  MOVE-NORTH ;145
		  MOVE-NE ;146
		  <> ;147
		  <> ;148
		  <> ;149
		  <> ;150
		  <> ;151
		  <> ;152
		  <> ;153
		  <> ;154
		  <> ;155
		  <> ;156
		  <> ;157
		  <> ;158
		  <> ;159
		  <> ;160
		  <> ;161
		  <> ;162
		  <> ;163
		  <> ;164
		  <> ;165
		  <> ;166
		  <> ;167
		  <> ;168
		  <> ;169
		  <> ;170
		  <> ;171
		  <> ;172
		  <> ;173
		  <> ;174
		  <> ;175
		  <> ;176
		  <> ;177
		  <> ;178
		  <> ;179
		  <> ;180
		  <> ;181
		  <> ;182
		  <> ;183
		  <> ;184
		  <> ;185
		  <> ;186
		  <> ;187
		  <> ;188
		  <> ;189
		  <> ;190
		  <> ;191
		  <> ;192
		  <> ;193
		  <> ;194
		  <> ;195
		  <> ;196
		  <> ;197
		  <> ;198
		  <> ;199
		  <> ;200
		  <> ;201
		  <> ;202
		  <> ;203
		  <> ;204
		  <> ;205
		  <> ;206
		  <> ;207
		  <> ;208
		  <> ;209
		  <> ;210
		  <> ;211
		  <> ;212
		  <> ;213
		  <> ;214
		  <> ;215
		  <> ;216
		  <> ;217
		  <> ;218
		  <> ;219
		  <> ;220
		  <> ;221
		  <> ;222
		  <> ;223
		  <> ;224
		  <> ;225
		  <> ;226
		  <> ;227
		  <> ;228
		  <> ;229
		  <> ;230
		  <> ;231
		  <> ;232
		  <> ;233
		  <> ;234
		  <> ;235
		  <> ;236
		  <> ;237
		  <> ;238
		  <> ;239
		  <> ;240
		  <> ;241
		  <> ;242
		  <> ;243
		  <> ;244
		  <> ;245
		  <> ;246
		  <> ;247
		  <> ;248
		  <> ;249
		  <> ;250
		  <> ;251
		  <> ;252
		  <> ;253
		  <> ;254
		  <> ;255>>
