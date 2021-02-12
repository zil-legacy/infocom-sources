;*****************************************************************************
; "game : SHERLOCK!"
; "file : HINTS.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   26 Oct 1987  7:41:14  $"
; "rev  : $Revision:   1.20  $"
; "vers : 1.00"
;*****************************************************************************

;"HINTS for
	       SHERLOCK: The Riddle of the Crown Jewels.
	(c) Copyright 1987 Infocom, Inc.  All Rights Reserved."
 
<FILE-FLAGS CLEAN-STACK?>

<GLOBAL GL-HINT-WARNING <>>

<GLOBAL GL-HINTS-OFF <>>

;*****************************************************************************
; "SYNTAX.ZIL"
;*****************************************************************************

<SYNTAX HELP = V-HINT>
<SYNTAX HELP OFF OBJECT (FIND FL-LOCATION) = V-HINTS-NO>
<VERB-SYNONYM HELP HINT HINTS CLUE CLUES INVISICLUES>

;*****************************************************************************
; "VERBS1.ZIL"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "V-HINTS-NO"
;-----------------------------------------------------------------------------

<ROUTINE V-HINTS-NO ()
	<COND
		(<NOT <MC-PRSO? ,ROOMS>>
			<TELL ,K-DONT-UNDERSTAND-MSG CR>
		)
		(T
			<SETG GL-HINTS-OFF T>
			<TELL "[Hints have been disallowed for this session.]" CR>
		)
	>
	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "V-HINT"
;-----------------------------------------------------------------------------

<ROUTINE V-HINT ("AUX" CHR MAXC (C <>) Q (WHO <>) POS)
	<COND
;		(<EQUAL? ,GL-PLACE-CUR ,GL-STARTING-ROOM>
			<TELL "You must be in one of the scenarios to ask for hints." CR>
			<RTRUE>
		)
		(,GL-HINTS-OFF
			<RT-PERFORM ,V?HINTS-NO ,ROOMS>
			<MC-RFATAL>
		)
		(<NOT ,GL-HINT-WARNING>
			<SETG GL-HINT-WARNING T>
			<TELL
"[Warning: It is recognized that the temptation for help may at times be so
exceedingly strong that you might fetch hints prematurely. Therefore, you may
at any time during the story type HINTS OFF, and this will disallow the
seeking out of help for the present session of the story. If you still want a
hint now, indicate HINT.]" CR
			>
			<MC-RFATAL>
		)
		(<NOT .WHO>
			<SET WHO <RT-WHO-SAYS?>>
			<COND
				(<EQUAL? .WHO ,CH-HOLMES ,CH-WIGGINS>
					<COND
						(<EQUAL? .WHO ,CH-HOLMES>
							<TELL
"Holmes looks at you impatiently and sighs, \"Very well, Watson. If you
must.\""
							>
						)
						(T
							<TELL
"Wiggins looks up at you with relief and says, \"Good idea, guv. We'll never
work this out on our own.\""
							>
						)
					>
					<TELL CR CR "[Press any key to continue.]" CR>
					<INPUT 1>
				)
			>
		)
	>
	<BUFOUT <>>
	<SET MAXC <GET ,K-HINTS 0>>
	<RT-INIT-HINT-SCREEN>
	<CURSET 5 1>
	<RT-PUT-UP-CHAPTERS>
	<SET POS <- ,GL-CHAPT-NUM 1>>
;	<SETG GL-CHAPT-NUM 1>
;	<CURSET 5 2>
	<RT-NEW-CURSOR .POS>
;	<PRINTI ">">
	<REPEAT ()
		<SET CHR <INPUT 1>>
		<COND
			(<EQUAL? .CHR %<ASCII !\Q> %<ASCII !\q>>
				<SET Q T>
				<RETURN>
			)
			(<EQUAL? .CHR %<ASCII !\N> %<ASCII !\n>>
				<COND
					(<EQUAL? ,GL-CHAPT-NUM .MAXC>
						T
					)
					(T
						<RT-ERASE-CURSOR .POS>
						<SET POS <+ .POS 1>>
						<SETG GL-CHAPT-NUM <+ ,GL-CHAPT-NUM 1>>
						<RT-NEW-CURSOR .POS>
						<SETG GL-QUEST-NUM 1>
					)
				>
			)
			(<EQUAL? .CHR %<ASCII !\P> %<ASCII !\p>>
				<COND
					(<EQUAL? ,GL-CHAPT-NUM 1>
						T
					)
					(T
						<RT-ERASE-CURSOR .POS>
						<SET POS <- .POS 1>>
						<SETG GL-CHAPT-NUM <- ,GL-CHAPT-NUM 1>>
						<RT-NEW-CURSOR .POS>
						<SETG GL-QUEST-NUM 1>
					)
				>
			)
			(<EQUAL? .CHR 13 10>
;				<PUTP ,GL-SCENE ,P?SCENE-CUR .POS>
				<RT-PICK-QUESTION>
				<RETURN>
			)
		>
	>
	<COND
		(<NOT .Q>
			<AGAIN>	;"AGAIN does whole routine?"
		)
	>
;	<SET POS 0>
;	<SETG GL-CHAPT-NUM 1>
;	<PUTP ,GL-SCENE ,P?SCENE-CUR .POS>
	<SPLIT 0>
	<CLEAR -1>
	<BUFOUT T>
	<V-REFRESH>
	<SET WHO <RT-WHO-SAYS?>>
	<COND
		(<EQUAL? .WHO ,CH-HOLMES>
			<TELL
"Holmes barely glances at you and snaps, \"At last. Now may we proceed?\"" CR
			>
		)
		(<EQUAL? .WHO ,CH-WIGGINS>
			<TELL
"Wiggins tugs your sleeve and asks hopefully, \"Learn anything?\"" CR
			>
		)
		(T
			<TELL CR "Back to the story..." CR>
		)
	>
	<MC-RFATAL>
>

;-----------------------------------------------------------------------------
; "RT-PICK-QUESTION"
;-----------------------------------------------------------------------------

<ROUTINE RT-PICK-QUESTION ("AUX" CHR MAXQ (Q <>) POS)
	<RT-INIT-HINT-SCREEN <>>
	<RT-LEFT-LINE 3 " RETURN = see hint" %<LENGTH " RETURN = see hint">>
	<RT-RIGHT-LINE 3 "Q = main menu" %<LENGTH "Q = main menu">>

	<SET MAXQ
		<- <GET <GET ,K-HINTS ,GL-CHAPT-NUM> 0> 1>
	>
	<CURSET 5 1>
	<RT-PUT-UP-QUESTIONS>
	<SET POS <- ,GL-QUEST-NUM 1>>
;	<SETG GL-QUEST-NUM 1>
;	<CURSET 5 2>
	<RT-NEW-CURSOR .POS>
;	<PRINTI ">">
	<REPEAT ()
		<SET CHR <INPUT 1>>
		<COND
			(<EQUAL? .CHR %<ASCII !\Q> %<ASCII !\q>>
				<SET Q T>
				<RETURN>
			)
			(<EQUAL? .CHR %<ASCII !\N> %<ASCII !\n>>
				<COND
					(<EQUAL? ,GL-QUEST-NUM .MAXQ>
						T
					)
					(T
						<RT-ERASE-CURSOR .POS>
						<SET POS <+ .POS 1>>
						<SETG GL-QUEST-NUM <+ ,GL-QUEST-NUM 1>>
						<RT-NEW-CURSOR .POS>
					)
				>
			)
			(<EQUAL? .CHR %<ASCII !\P> %<ASCII !\p>>
				<COND
					(<EQUAL? ,GL-QUEST-NUM 1>
						T
					)
					(T
						<RT-ERASE-CURSOR .POS>
						<SET POS <- .POS 1>>
						<SETG GL-QUEST-NUM <- ,GL-QUEST-NUM 1>>
						<RT-NEW-CURSOR .POS>
					)
				>
			)
			(<EQUAL? .CHR 13 10>
				<RT-DISPLAY-HINT>
				<RETURN>
			)
		>
	>
	<COND
		(<NOT .Q>
			<AGAIN>
		)
	>
>

;*****************************************************************************
; "Globals"
;*****************************************************************************

;"zeroth (first) element is 5"
<GLOBAL GL-LINE-TABLE
	<PTABLE
		 5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22
		 5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22
	>
>

;"zeroth (first) element is 4"
<GLOBAL GL-COLUMN-TABLE
	<PTABLE
		 4  4  4  4  4  4  4  4  4  4  4  4  4  4  4  4  4  4
		24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24
	>
>

;"four and nineteen are where the text of questions start"

;<GLOBAL GL-CUR-POS 0>	;"determines where to place the highlight cursor
							     Can go up to 34, that is 17 slots in each row"

<GLOBAL GL-QUEST-NUM 1> ;"shows in HINT-TBL ltable which QUESTION it's on"

<GLOBAL GL-CHAPT-NUM 1>	;"shows in HINT-TBL ltable which CHAPTER it's on"

;-----------------------------------------------------------------------------
; "RT-ERASE-CURSOR"
;-----------------------------------------------------------------------------

<ROUTINE RT-ERASE-CURSOR (POS)
	<CURSET
		<GET ,GL-LINE-TABLE .POS>
		<- <GET ,GL-COLUMN-TABLE .POS> 2 ;1>
	>
	<TELL " ">	;"erase previous highlight cursor"
>

;-----------------------------------------------------------------------------
; "RT-NEW-CURSOR"
;-----------------------------------------------------------------------------

;"go back 2 spaces from question text, print cursor and flash is between
the cursor and text"

<ROUTINE RT-NEW-CURSOR (POS)
	<CURSET
		<GET ,GL-LINE-TABLE .POS>
		<- <GET ,GL-COLUMN-TABLE .POS> 2 ;1>
	>
	<TELL ">">	;"print the new cursor"
>

;-----------------------------------------------------------------------------
; "RT-INVERSE-LINE"
;-----------------------------------------------------------------------------

<ROUTINE RT-INVERSE-LINE ("AUX" (CENTER-HALF <>)) 
	<HLIGHT ,K-H-INV>
	<ERASE 1>
	<HLIGHT ,K-H-NRM>
>

;-----------------------------------------------------------------------------
; "RT-DISPLAY-HINT"
;-----------------------------------------------------------------------------

<ROUTINE RT-DISPLAY-HINT ("AUX" H MX (CNT 2 ;,K-HINT-HINTS) CHR (FLG T) N POS)
	<SPLIT 0>
	<CLEAR -1>
	<SPLIT 3>
	<SCREEN ,K-S-WIN>
	<CURSET 1 1>
	<RT-INVERSE-LINE>
	<RT-CENTER-LINE 1 "INVISICLUES (tm)" %<LENGTH "INVISICLUES (tm)">>
	<CURSET 3 1>
	<RT-INVERSE-LINE>
;	<COND
		(,WIDE
			<TELL " ">
		)
	>
	<RT-LEFT-LINE 3 "RETURN = see new hint">
	<RT-RIGHT-LINE 3 "Q = see hint menu" %<LENGTH "Q = see hint menu">>
	<HLIGHT ,K-H-BLD>
	<SET H <GET <GET ,K-HINTS ,GL-CHAPT-NUM> <+ ,GL-QUEST-NUM 1>>>
	<RT-CENTER-LINE 2 <GET .H 1 ;,K-HINT-QUESTION>>
	<HLIGHT ,K-H-NRM>
	<SET MX <GET .H 0>>
;	<CURSET 5 2>	;"instead of CRLF"
	<SCREEN ,K-S-NOR>
	<BUFOUT T>
	<CRLF>
	<REPEAT ()
		<COND
			(.FLG
				<SET N <+ <- .MX .CNT> 1>>
				<TELL "[" N .N " hint">
				<COND
					(<NOT <EQUAL? .N 1>>
						<TELL "s">
					)
				>
				<TELL " left.]" CR CR " -> ">
				<SET FLG <>>
			)
		>
		<SET CHR <INPUT 1>>
		<COND
			(<EQUAL? .CHR %<ASCII !\Q> %<ASCII !\q>>
;				<PUT .H ,GL-HINT-SEEN .CNT>
;				<SET POS <GET ,GL-SCENE ,P?SCENE-CUR>>
				<RETURN>
			)
			(<EQUAL? .CHR 13 10>
				<COND
					(<G? .CNT .MX>
						T
					)
					(T
						<SET FLG T>	;".cnt starts as 2"
						<TELL <GET .H .CNT>>
						<CRLF>
						<CRLF>
						<SET CNT <+ .CNT 1>>
;						<CURSET <+ <* .CNT 2> 1> 2>
; "3rd = line 7, 4th = line 9, ect"
						<COND
							(<G? .CNT .MX>
								<SET FLG <>>
								<TELL "[Final hint]" CR>
;								<CURSET <* .CNT 2> 1>
							)
						>
					)
				>
			)
		>
	>
>

;-----------------------------------------------------------------------------
; "RT-PUT-UP-QUESTIONS"
;-----------------------------------------------------------------------------

<ROUTINE RT-PUT-UP-QUESTIONS ("AUX" (ST 1) MXQ MXL)
	<SET MXQ
		<-
			<GET
				<GET ,K-HINTS ,GL-CHAPT-NUM>
				0
			>
			1
		>
	>
	<SET MXL <- <GETB 0 32> 1>>
	<REPEAT ()
		<COND
			(<G? .ST .MXQ>
;				<TELL CR "[Last question]" CR>
				<RETURN>
			)
			(T                        ;"zeroth"
				<CURSET
					<GET ,GL-LINE-TABLE <- .ST 1>>
					<- <GET ,GL-COLUMN-TABLE <- .ST 1>> 1>
				>
			) 
;			(<G? .LN .MXL>
				<TELL CR "[More questions follow]" CR>
				<RETURN <- .ST 1>>
			)
		>
		<TELL " "
			<GET
				<GET
					<GET ,K-HINTS ,GL-CHAPT-NUM>
					<+ .ST 1>
				>
				1
			>
		>
;		<CRLF>	;"above curset will do the trick?"
		<SET ST <+ .ST 1>>
	>
>

;-----------------------------------------------------------------------------
; "RT-PUT-UP-CHAPTERS"
;-----------------------------------------------------------------------------

<ROUTINE RT-PUT-UP-CHAPTERS ("AUX" (ST 1) MXC MXL)
	<SET MXC <GET ,K-HINTS 0>>
	<SET MXL <- <GETB 0 32> 1>>
	<REPEAT ()
		<COND
			(<G? .ST .MXC>
;				<TELL CR "[Last chapter]" CR>
				<RETURN>
			)
			(T                        ;"zeroth"
				<CURSET
					<GET ,GL-LINE-TABLE <- .ST 1>>
					<- <GET ,GL-COLUMN-TABLE <- .ST 1>> 1>
				>
			) 
;			(<G? .LN .MXL>
				<TELL CR "[More chapters follow]" CR>
				<RETURN <- .ST 1>>
			)
		>
		<TELL " " <GET <GET ,K-HINTS .ST> 1 ;,GL-HINT-QUEST>>
;		<CRLF>	;"above curset will do the trick?"
		<SET ST <+ .ST 1>>
	>
>

;"Invisiclues Stuff"

;-----------------------------------------------------------------------------
; "K-HINTS"
;-----------------------------------------------------------------------------

;"longest hint topic can be 17 chars"
<CONSTANT K-HINTS
	<PLTABLE
;		"Table of clues for STARTERS chapter."
		<PLTABLE
			"STARTERS"
			<PLTABLE
				"How do I get into the house?"
				"Mrs Hudson is expecting you, so you shouldn't have to do
anything too unusual."
				"Have you tried kicking down the door?"
				"KNOCK ON THE DOOR."
			>
			<PLTABLE
				"Will Mrs. Hudson ever let me into the parlour?"
				"Not until you get Holmes's mind off the drug."
			>
			<PLTABLE
				"How do I get into the kitchen?"
				"Don't look at the next clue until you have opened the trap door in the hall."
				"You're cheating, aren't you?"
				"There is no trap door."
				"There is no kitchen."
				"Don't let the existence of these questions influence your playing of the game."
			>
			<PLTABLE
				"How do I get into the bedroom?"
				"Only Holmes can open that door."
				"When the visitor leaves, Holmes will open it."
			>
			<PLTABLE
				"How do I get onto the roof?"
				"The same way you got into the kitchen."
			>
			<PLTABLE
				"How can I get Mrs. Hudson to do something for me?"
				"Have you tried kissing her?"
				"Have you tried bribing her?"
				"The sad fact is that she won't do anything for you."
			>
			<PLTABLE
				"How do I get Holmes to stop staring at the drug?"
				"Holmes is bored with the commonplace events of everyday life."
				"He needs some mental excitement."
				"Newspapers generally contain interesting items."
				"For a doctor, you're not too bright. Read him the newspaper. (Or tell him about the visitor)."
			>
			<PLTABLE
				"What is the significance of the verses on the clue paper?"
				"It looks like the thief is challenging Sherlock Holmes to a duel of wits."
				"Unlike yourself, Sherlock is not unarmed for such a duel."
				"The thief is laying down a trail of clues for Holmes to follow."
			>
			<PLTABLE
				"What is the answer to the first riddle on the thief's clue paper?"
				"The verse refers to a particular place."
				"The place is the spot where most English royalty is buried."
				"Westminster Abbey."
			>
			<PLTABLE
				"What is the answer to the second riddle?"
				"The verse refers to the last of the Tudor monarchs."
				"She was called the 'Virgin Queen.'"
				"Elizabeth I."
			>
			<PLTABLE
				"What is the answer to the third riddle?"
				"The discoverer of the law of gravity."
				"Sir Isaac Newton."
			>
			<PLTABLE
				"What is the answer to the fourth riddle?"
				"Don't read the next clue until you have thoroughly explored Westminster Abbey."
				"Have you looked around in the Jerusalem Chamber?"
				"The fourth verse refers to Henry V."
			>
			<PLTABLE
				"Where is the lamp?"
				"It's in Holmes's bedroom."
			>
			<PLTABLE
				"Who is the thief?"
				"Who do you think?"
			>
		>
		<PLTABLE
			"CABS"
			<PLTABLE
				"How do I hail a cab?"
				"Consult the sample transcript in your game manual."
			>
			<PLTABLE
				"Why won't the growler cabbie take me where I want to go?"
	         "He's friendly, but stupid."
				"He's stupid, but friendly."
				"Give up.  He'll never take you where you want to go."
			>
		>
		<PLTABLE
			"WESTMINSTER ABBEY"
			<PLTABLE
				"Are the tombs important?"
				"They are to the people buried in them."
				"Yes."
			>
			<PLTABLE
				"How do I make a brass rubbing?"
				"Take a piece of paper from the pacquet of paper, put it on the tomb of your choice, and then rub it with the crayon."
			>
			<PLTABLE
				"How do I know which tombs to make rubbings of?"
				"Do not read the next clue until you have solved the verses on the thief's clue paper."
				"Elizabeth I, Sir Isaac Newton, Henry V."
			>
			<PLTABLE
				"What is the significance of my brass rubbings?"
				"The thief is trying to send messages to Sherlock."
				"He wouldn't want his messages to be visible to everyone, now would he?"
				"Have you visited the British Museum yet?"
				"The book on the table in the British Museum contains a clue that will help you."
				"There is some invisible writing on some of the tombs."
				"When you make a rubbing, the invisible ink is transferred onto the back of the paper."
				"Invisible ink usually becomes visible when heated."
				"Heat the paper over the candles in the Evangelist Chapel."
				"Turn the paper over."
			>
			<PLTABLE
				"Where is the Stone of Scone?"
				"It belongs under the Coronation Chair in Edward the
Confessor's Chapel - but we knew it was going to be stolen in 1950 and
then returned several months later.  We figured that was enough
excitement for any one rock, so we left it out of the game, safe from your
grubby paws."
			>
			<PLTABLE
				"What is the answer to the Son of Mars riddle?"
				"Admiral Lord Nelson."
			>
			<PLTABLE
				"What is the answer to the Chopper riddle?"
				"Charles I."
			>
			<PLTABLE
				"What is the answer to the London Bridge riddle?"
				"Under London Bridge."
			>
			<PLTABLE
				"What is the answer to life's eternal riddle?"
				"If we knew that, do you think we'd be sitting around writing games?"
			>
			<PLTABLE
				"What is the answer to the Pussycat riddle?"
				"Go to the Tower of London."
			>
			<PLTABLE
				"What is the answer to the Number riddle?"
				"Have you looked at the statue of William The Conqueror?"
				"Have you read the sign on the Monument?"
				"Have you ever read the Charge of the Light Brigade?"
				"600."
			>
			<PLTABLE
				"What is the answer to the Hickory Dickory Dock riddle?"
				"Big Ben."
			>
		>
		<PLTABLE
			"BRITISH MUSEUM"
			<PLTABLE
				"How do I get past the insistent librarian?"
				"Think of the room not as a museum, but as a library."
				"Have you read the sign on the librarian's desk?"
				"Has it occurred to you that he's doing an awful lot of talking?"
				"Tell him to be quiet."
			>
		>
		<PLTABLE
			"ST. PAUL'S"
			<PLTABLE
				"What is a Whispering Gallery?"
				"It is a place where you can eavesdrop on other people from far away."
			>
			<PLTABLE
				"How do I get up there?"
				"Take the stairs up from the clerestory."
			>
			<PLTABLE
				"How do I get to the clerestory?"
				"You can't. St. Paul's isn't even in the game."
				"We just like the word clerestory and wanted to work it into the game somehow."
			>
		>
		<PLTABLE
			"TRAFALGAR SQUARE"
			<PLTABLE
				"Are the pigeons important?"
				"Only to other pigeons."
			>
			<PLTABLE
				"Is the statue important?"
				"Yes."
				"Have you looked at it?"
				"Have you looked at it closely?"
				"Have you looked at it through a telescope?"
			>
			<PLTABLE
				"Is the column important?"
				"Yes."
				"If it wasn't there, we'd have to come up with some other way of keeping the statue out of your reach."
			>
			<PLTABLE
				"Is anything important?"
				"Like, wow, man.  Heavy question!"
			>
		>
		<PLTABLE
			"ON THE THAMES"
			<PLTABLE
				"How do I stop rowing in circles?"
				"Has anyone ever told you that you're not playing with a full deck?"
				"Has anyone ever told you that you're not rowing with both oars in the water?"
				"You need two oars to steer the boat."
				"Don't read the next two clues unless you want to know where the other oar is."
				"The other oar is in another boat."
				"It's in Captain Bligh's boat in the Black Museum."
			>
			<PLTABLE
				"How do I stop the boat?"
				"Type, 'Whoa, Boat!'"
				"Just kidding.  Drop the anchor."
			>
			<PLTABLE
				"How do I launch the boat?"
				"Got any rocket fuel?"
				"Type, 'Launch boat.'"
				"(Make sure you're in the boat and the anchor's up first.)"
			>
			<PLTABLE
				"How do I land the boat?"
				"You can only land the boat at the Embankment or outside Traitor's Gate."
				"Type, 'N' or 'Land boat.'"
			>
			<PLTABLE
				"How do I get the paddle?"
				"You can't get the paddle when you're outside Traitor's Gate."
				"If you don't have the paddle, you need two oars to row back up the river."
				"If you're on the river without a paddle or both oars, you're making a big mistake."
				"You can only take the paddle after you've entered the Tower."
			>
			<PLTABLE
				"How do I stop the man from taking the boat?"
				"Insult him."
				"Insult his mother."
				"You can't.  After all, it's his boat."
			>
		>
		<PLTABLE
			"VICTORIA STATION"
			<PLTABLE
				"What time does the last train leave for Woolwich?"
				"The timetable is posted on the wall."
				"9:15 p.m."
			>
			<PLTABLE
				"What track does it leave from?"
				"Track 29."
			>
			<PLTABLE
				"How much is a first-class round-trip ticket?"
				"When did you ever travel first-class?"
				"Why are you reading clues about a place that isn't even in the game?"
			>
		>
		<PLTABLE
			"COVENT GARDEN"
			<PLTABLE
				"What is the matter with the girl?"
				"She has a bad heart."
				"Perhaps some medicine...."
				"Be careful.  Drugs are dangerous."
			>
			<PLTABLE
				"How do I revive her?"
				"Have you made a positive diagnosis?"
				"Listen to the girl with your stethoscope."
				"If her heart is abnormally fast, give her something to slow it down."
				"An unusually fast heartbeat is known as tachycardia."
				"If her heart is abnormally slow, give her something to speed it up."
				"An unusually slow heartbeat is know as bradycardia."
				"Belladonna will speed up a slow heart."
				"Digitalis will slow down a fast heart."
				"The drugs are in your medicine bag."
			>
			<PLTABLE
				"Where is the stethoscope?"
				"Where do most doctors carry their stethoscopes?"
				"You are not most doctors."
				"You have it when you start the game."
				"Sorry about this.  It turns out that Watson always carries his stethoscope in his hat.  Really. (SCANDAL IN BOHEMIA)"
			>
		>
		<PLTABLE
			"MADAME TUSSAUD'S"
			<PLTABLE
				"How do I get past the guard dog?"
				"He won't let you carry any matches inside."
				"OK. So you already knew that."
				"He won't let you carry in any flames that he can see."
				"Alright, so you knew that too.  How about flames that he can't see?"
				"Something that burns without a flame, for example."
				"Like tobacco maybe."
				"Light the pipe, drop the match, and go on in."
			>
			<PLTABLE
				"What do I do with the axe?"
				"The axe doesn't do much except cut down on the number of other things you can carry."
			>
			<PLTABLE
				"How can I light the torch?"
				"Light it from something that's already burning."
				"Light it from a burning piece of paper."
				"Light a piece of paper from the pipe, and then use it to light the torch."
			>
		>
		<PLTABLE
			"SCOTLAND YARD"
			<PLTABLE
				"Why won't Inspector Lestrade talk to me when I'm in his office?"
				"He doesn't like you."
				"He really doesn't like you."
				"What office?"
			>
		>
		<PLTABLE
			"BANK OF ENGLAND"
			<PLTABLE
				"How do I get inside the bank?"
				"Despite the guard's assertions to the contrary, he can be bribed."
				"Give him something valuable."
				"Some gems might do the trick."
				"Give him the ruby, the sapphire, the emerald and the opal."
			>
			<PLTABLE
				"How do I get inside the vault?"
				"The door has a combination lock on it."
				"The tumblers turn too quietly for you to hear without amplification."
				"Listen to the door with the stethoscope, and then turn the dial left or right."
				"A 'clunk' means you're going the wrong way."
				"A 'whirr' means you're going the right way."
				"A 'click' means you should reverse directions."
				"The combination is right twice, left once, right twice."
			>
			<PLTABLE
				"Which box should I open?"
				"Have you solved the second clue on Sir Isaac Newton's tomb?"
				"Open box 600."
			>
			<PLTABLE
				"How do I open the safety deposit box?"
				"Do you have any dynamite?"
				"Try using a key."
				"The bank guard has it."
				"It's in his pocket."
				"How good a pickpocket are you?"
				"How good a pickpocket are the people you know?"
				"Ask Wiggins to steal it."
			>
			<PLTABLE
				"How can I keep Holmes from getting kidnapped?"
				"Hire bodyguards."
				"Put him in your medical bag."
				"Kill him."
				"You can't."
			>
		>
		<PLTABLE
			"DIOGENES CLUB"
			<PLTABLE
				"What does Mycroft want from me?"
				"Your blood?"
				"Your first-born male child?"
				"Sherlock's ring."
			>
			<PLTABLE
				"How do I get the token?"
				"Show any of the gems you have found to Sherlock."
			>
		>
		<PLTABLE
			"TOWER OF LONDON"
			<PLTABLE
				"How do I get into the Tower?"
				"Give the password to the beefeater."
				"You must get the password from someone who has government connections."
				"Mycroft Holmes knows the password."
				"Do not read the next clue unless Sherlock Holmes has been kidnapped."
				"Go to the Diogenes Club and ask for Mycroft. The butler will
ask you for a token. Give him the token. Mycroft will appear and give
you the password."
				"Return to the Tower and type GUARD, THE PASSWORD IS _____."
			>
			<PLTABLE
				"How do I get out of the Tower?"
				"The beefeater won't let you out.  You must find another exit."
				"The only other way out is through Traitor's Gate."
				"The portcullis is operated by the chain above it."
				"You do not weigh enough to pull down the chain."
				"Put on the suit of armour in the dungeon of the White Tower and then pull on the chain."
			>
		>
		<PLTABLE
			"GEMS"
			<PLTABLE
				"Where is the diamond?"
				"What diamond?"
			>
			<PLTABLE
				"How do I get the diamond?"
				"See previous hint."
			>
			<PLTABLE
				"Where is the sapphire?"
				"Did you solve the Hickory Dickory Dock riddle?"
				"It's stuck to the clapper of Big Ben."
			>
			<PLTABLE
				"How do I get the sapphire?"
				"Have you tried driving a hook into the ceiling,
throwing a rope over the hook, climbing up onto
the rail, swinging across the hollow shaft while
screaming like Tarzan, and grabbing the sapphire
as you swing by?"
				"Just asking."
				"Wait until the hour strikes. The clapper will swing your way."
				"You need to regain the use of your hands while the bell is ringing."
				"Put the cotton balls in your ears before the bell starts to ring."
				"The cotton balls are in the blue pill bottle."
			>
			<PLTABLE
				"Where is the ruby?"
				"Did you solve the Son of Mars riddle?"
				"It's somewhere in Trafalgar Square."
				"It's on the statue in Trafalgar Square."
				"It's in Nelson's blind eye."
				"You can discover it only by looking through the telescope."
			>
			<PLTABLE
				"How do I get the ruby?"
				"You can't get up there."
				"Someone - or something - else will have to get it for you."
				"Some kind of trained bird might do it."
				"Old Sherman, who lives in Pinchin Lane, trains animals."
				"Get the bird from Sherman. Take it to Trafalgar Square. Show
the ruby to the pigeon, ask him to get it, and then let him go."
				"Do not read the next clue until you have done all of the above."
				"Did we mention that it's a homing pigeon?"
				"Return to Sherman's shop and ask him about the bird."
			>
			<PLTABLE
				"Where is the emerald?"
				"Did you solve the Chopper riddle?"
				"It's in the Chamber of Horrors."
				"It's hidden in one of the statues."
				"It's in the wax head of Charles I."
			>
			<PLTABLE
				"How do I get the emerald?"
				"It's encased in wax.  What springs to mind?"
				"You need to melt the head."
				"You can't melt the head unless you remove it from the statue."
				"You need something that puts out enough heat to melt a big gob of wax."
				"The torch will melt the wax head."
			>
			<PLTABLE
				"Where is the sceptre?"
				"In the sceptre tank?"
				"Sorry about that."
				"There is no sceptre."
			>
			<PLTABLE
				"How do I get the sceptre?"
				"Dive into the sceptre tank."
				"Don't blame us. You're the one who keeps reading these bogus clues."
			>
		>
		<PLTABLE
			"MORE GEMS"
			<PLTABLE
				"Where is the opal?"
				"Have you solved the London Bridge riddle?"
				"It's in the clump of moss under London Bridge."
			>
			<PLTABLE
				"How do I get the opal?"
				"Can you lower the bridge?"
				"Can you raise the water?"
				"Wait for high tide."
				"The newspaper that came with your game contains the tide tables for the weekend."
			>
			<PLTABLE
				"Where is the zorkmid?"
				"It's in the... oops.  Sorry.  Wrong game."
			>
			<PLTABLE
				"How do I get the zorkmid?"
				"Buy Zork I."
				"Buy Enchanter."
				"Buy Sorcerer."
				"You get the idea."
			>
			<PLTABLE
				"Where is the topaz?"
				"In a safety deposit box in the Bank of England."
				"Have you solved the number riddle?"
				"It's in box 600."
			>
			<PLTABLE
				"How do I get the topaz?"
				"See the clues for the Bank of England."
			>
			<PLTABLE
				"Where is the garnet?"
				"Did you solve the Tower of London riddle?"
				"It's in the butt of malmsey in the Bowyer Tower."
			>
			<PLTABLE
				"How do I get the garnet?"
				"Have you tried drinking the wine?"
				"Pretty tasty stuff, isn't it?"
				"You need to drain the keg somehow."
				"You need to remove the bung."
				"Knock out the bung with the mace."
				"Don't read the next clue until you have done all of the above."
				"Ask Wiggins to get the garnet for you."
			>
			<PLTABLE
				"Why are the gems important?"
				"You don't think the thief has beem hiding gems all over London just for the fun of it, do you?"
				"Perhaps he is trying to send Sherlock yet another message."
				"Have you looked at any of the gems?"
				"Have you looked at any of them closely?"
				"Look at each of the gems through the magnifying glass."
			>
		>
		<PLTABLE
			"THE LAIR"
			<PLTABLE
				"How can I stop Moriarty's henchman from knocking me out?"
				"Knock him out first."
				"Perhaps you could smuggle something in."
				"Have you noticed the henchman's religion?"
				"He probably won't disturb your hat."
				"Perhaps the etherium ampoule...."
			>
			<PLTABLE
				"How do I keep Moriarty from winning when I wake up?"
				"If he is free to move around, he will always win."
				"Tie him up."
				"Don't forget to tie up the henchman, too."
			>
		>
		<PLTABLE
			"MISCELLANEOUS"
			<PLTABLE
				"What is the significance of the uninteresting object?"
				"What street did you walk down to get to the old pub?"
				"What is the name of the pub?"
				"We at Infocom would like to apologize for this lame
attempt at humor on the part of the author. You see, he thought it would
be cute to plant a false clue at the end of a blind alley in a place called
the Red Herring. We know better - and so do you - but there was just no
talking him out of it. Please do not let this deter you from buying our
other, far more sophisticated games."
			>
			<PLTABLE
				"What if I finish the game with fewer than 100 points?"
				"If you play the game from start to finish and solve all
the puzzles, you will end up with 100 points. If, however, you start the
game and play through it using information you acquired in a previous
session, you may have neglected to perform a few actions for which you
received points. This should not be of concern to anyone who is content
with failing to discover the highest ranking available to the game player."
			>
			<PLTABLE
				"Do I have to keep typing out the full word 'stethoscope?'"
				"No. It can be abbreviated to 'steth' or 'ss.'"
			>
			<PLTABLE
				"What is the square root of 64?"
				"Eight."
			>
		>
	>
>

;-----------------------------------------------------------------------------
; "RT-INIT-HINT-SCREEN"
;-----------------------------------------------------------------------------

<ROUTINE RT-INIT-HINT-SCREEN ("OPTIONAL" (THIRD T) "AUX" WID LEN)
	<SET WID <GETB 0 33>>
	<SPLIT 0>
	<CLEAR -1>
;	<SPLIT <GETB 0 32>>
	<SPLIT <- <GETB 0 32> 1>>
	<SCREEN ,K-S-WIN>
	<BUFOUT <>>
	<CURSET 1 1>
	<RT-INVERSE-LINE>
	<CURSET 2 1>
	<RT-INVERSE-LINE>
	<CURSET 3 1>
	<RT-INVERSE-LINE>
	<RT-CENTER-LINE 1 "INVISICLUES (tm)" 16>
	<RT-LEFT-LINE 2 " N = next">
	<RT-RIGHT-LINE 2 "P = previous" %<LENGTH "P = previous">>
	<COND
		(<MC-T? .THIRD>
			<RT-LEFT-LINE 3 " RETURN = See hint">
			<RT-RIGHT-LINE 3 "Q = Resume story" %<LENGTH "Q = Resume story">>
		)
	>
>

;<CONSTANT K-HINT-COUNT 0>
;<CONSTANT K-HINT-QUESTION 1>
;<CONSTANT K-HINT-SEEN 2>
;<CONSTANT K-HINT-OFF 3>
;<CONSTANT K-HINT-HINTS 4>

;<DEFINE NEW-HINT (NAME Q "ARGS" HINTS)
	<SETG .NAME 1>
	<COND
		(<G? <LENGTH .Q> 39>
			<ERROR QUESTION-TOO-LONG!-ERRORS NEW-HINT .Q>
		)
	>
	<LTABLE
		.Q
		4
		.NAME
		!.HINTS
	>
>

;<GLOBAL GL-HINT-FLAG-TBL
	<TABLE 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1>
>

;-----------------------------------------------------------------------------
; "RT-CENTER-LINE"
;-----------------------------------------------------------------------------

<ROUTINE RT-CENTER-LINE (LN STR "OPTIONAL" (LEN 0) (INV T))
	<COND
		(<ZERO? .LEN>
			<DIROUT ,K-D-TBL-ON ,GL-DIROUT-TBL ;,SLINE>
			<TELL .STR>
			<DIROUT ,K-D-TBL-OFF>
			<SET LEN <GET ,GL-DIROUT-TBL ;,SLINE 0>>
		)
	>
	<CURSET .LN </ <- <GETB 0 33> .LEN> 2>>
	<COND
		(.INV
			<HLIGHT ,K-H-INV>
		)
	>
	<TELL .STR>
	<COND
		(.INV
			<HLIGHT ,K-H-NRM>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-LEFT-LINE"
;-----------------------------------------------------------------------------

<ROUTINE RT-LEFT-LINE (LN STR "OPTIONAL" (INV T))
	<CURSET .LN 1>
	<COND
		(.INV
			<HLIGHT ,K-H-INV>
		)
	>
	<TELL .STR>
	<COND
		(.INV
			<HLIGHT ,K-H-NRM>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-RIGHT-LINE"
;-----------------------------------------------------------------------------

<ROUTINE RT-RIGHT-LINE (LN STR "OPTIONAL" (LEN 0) (INV T))
	<COND
		(<ZERO? .LEN>
			<DIROUT 3 ,GL-DIROUT-TBL ;,SLINE>
			<TELL .STR>
			<DIROUT -3>
			<SET LEN <GET ,GL-DIROUT-TBL ;,SLINE 0>>
		)
	>
	<CURSET .LN <- <GETB 0 33> .LEN>>
	<COND
		(.INV
			<HLIGHT ,K-H-INV>
		)
	>
	<TELL .STR>
	<COND
		(.INV
			<HLIGHT ,K-H-NRM>
		)
	>
>

;-----------------------------------------------------------------------------
; "GL-DIROUT-TBL"
;-----------------------------------------------------------------------------
	 
<GLOBAL GL-DIROUT-TBL
	<TABLE
		0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	>
>

;*****************************************************************************
; "end of file"
;*****************************************************************************

