;*****************************************************************************
; "game : SHERLOCK!"
; "file : WINDOW.ZIL"
; "auth :   $Author:   RAB  $"
; "date :     $Date:   23 Oct 1987 20:01:26  $"
; "rev  : $Revision:   1.13  $"
; "vers : 1.00"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "routines"
;-----------------------------------------------------------------------------

;" RT-WINDOW [table] [left-margin]"
;"   where [table] is a global PLTABLE with the 1st element = width of window"
;"   followed by strings (0 for a blank line)"
;"   if [left-margin] is not specified, window is centered"

<ROUTINE RT-WINDOW (TABLE "OPTIONAL" (MARGIN 0) "AUX" (Y 8) (I 2) WIDTH LINES STR PLINES)

	<SET LINES <GET .TABLE 0>>
	<SET WIDTH <GET .TABLE 1>>

	<SET PLINES .LINES>

	<COND 
		(<G? .WIDTH ,GL-ALLSCREEN>
			<TELL "[*** Window too wide ***]" CR>
			<RTRUE>
		)
	>

	<COND
		(<ZERO? .MARGIN>
			<SET MARGIN <- ,GL-MIDSCREEN </ .WIDTH 2>>>
		)
	>
	 	 
	<BUFOUT <>>
	<SPLIT <+ .LINES 6>>
	<SCREEN ,K-S-WIN>
	<HLIGHT ,K-H-INV>
	 
	<CURSET .Y .MARGIN>
	<RT-PRINT-SPACES .WIDTH>
	 
	<REPEAT ()
		<INC Y>
		<CURSET .Y .MARGIN>
		<DEC LINES>
		<COND
			(<ZERO? .LINES>
				<RT-PRINT-SPACES .WIDTH>
				<RETURN>
			)
		>
		<SET STR <GET .TABLE .I>>
		<COND
			(<ZERO? .STR>
				<RT-PRINT-SPACES .WIDTH>
			)
			(T
				<TELL " " .STR " ">
			)
		>
		<INC I>
	>
	 
	<HLIGHT ,K-H-NRM>
	<SCREEN ,K-S-NOR>
	<SPLIT 1>
	<BUFOUT T>

; "send window to printer"
	
	<DIROUT ,K-D-SCR-OFF>
	<SET I 2>
	<TELL CR "[">

	<REPEAT ()
		<DEC PLINES>
		<COND
			(<ZERO? .PLINES>
				<RETURN>
			)
		>
		<SET STR <GET .TABLE .I>>
		<COND
			(<NOT <ZERO? .STR>>
				<COND
					(<NOT <EQUAL? .I 2>>
						<TELL " ">
					)
				>
				<TELL .STR>
				<COND
					(<EQUAL? .PLINES 1>
						<TELL "]">
					)
				>
			)
		>
		<CRLF>
		<INC I>
	>

	<CRLF>

	<DIROUT ,K-D-SCR-ON>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "constants used with table"
;-----------------------------------------------------------------------------

<CONSTANT K-SIGN-ABBEY     0>
<CONSTANT K-SIGN-QUIET     1>
<CONSTANT K-SIGN-HORRORS   2>
<CONSTANT K-SIGN-MUSEUM    3>
<CONSTANT K-SIGN-MONUMENT  4>
<CONSTANT K-SIGN-BLIGH     5>
<CONSTANT K-SIGN-BANK      6>
<CONSTANT K-SIGN-TOWER     7>
<CONSTANT K-SIGN-NELSON    8>
<CONSTANT K-SIGN-LOITER    9>
<CONSTANT K-SIGN-GOLDBAR  10>
<CONSTANT K-SIGN-HENRY    11>
<CONSTANT K-SIGN-MARQUEES 12>
<CONSTANT K-SIGN-HERRING  13>
<CONSTANT K-SIGN-BLANK    14>

;-----------------------------------------------------------------------------
; "table used by window routine"
;-----------------------------------------------------------------------------

; "extra space added to each line that ends in a period followed by a space."

<GLOBAL GL-QUOTES:TABLE
	<PTABLE
		<PLTABLE 38
			"Visiting Hours: 7:00 a.m - 6:00 p.m."
		>
		<PLTABLE 18
			"\"Quiet, please.\""
		>
		<PLTABLE 36
			"        CHAMBER OF HORRORS        "
			"ABANDON HOPE ALL YE WHO ENTER HERE"
		>
		<PLTABLE 32
			"MUSEUM HOURS:  8 a.m. - 6 p.m."
		>
		<PLTABLE 8
			"\"1666\""
		>
		<PLTABLE 38
			"This a replica of the rowboat in    "
			"which Captain Bligh was set adrift  "
			"after the infamous Mutiny on the    "
			"Bounty. Bligh and his men rowed 3600"
			"miles in 45 days, and lived to see  "
			"the mutineers brought to justice.    "
		>
		<PLTABLE 38
			"For your convenience, the Bank shall"
			"be closed for the entire Jubilee    "
			"weekend. Thank you for your         "
			"patronage.                           "
		>
		<PLTABLE 38
			"        THE TOWER IS CLOSED.         "
			0
			"    WE REGRET ANY INCONVENIENCE.     "
			0
			"          HAVE A NICE DAY.           "
		>
		<PLTABLE 38
			"During the battle of Copenhagen,    "
			"Lord Nelson's commander-in-chief ran"
			"the signal to \"discontinue action\"  "
         "up his mast. Knowing the battle     "
			"could yet be won, said, \"I do not   "
			"see the signal.\" His subsequent     "
			"attack led to victory and a secure  "
			"place for Nelson in British history."
		>
		<PLTABLE 17
			" No Loitering. "
			0
			"This means YOU!"
		>
		<PLTABLE 13
			"BAR OF GOLD"
		>
		<PLTABLE 38
			"\"Many monarchs are buried in        "
			"Westminster. But only one died here."
			"It happened on March 20th, 1413, and"
			"the event was later made famous in a"
			"scene written by Shakespeare:\"      "
			0
			"\"It hath been prophesied to me many "
			"   years                            "
			"I should not die but in Jerusalem,  "
			"Which vainly I supposed the Holy    "
			"   Land.                             "
			"But bear me to that chamber, there  "
			"   I'll lie,                        "
			"In that Jerusalem shall Harry die.\" "
			0
			"\"Henry IV, Part II, Act V\"          "
		>
		<PLTABLE 17
			"   HELD OVER   "
			0
			"SIXTH BIG WEEK!"
			0
			"THE MOUSETRAP!!"
		>
		<PLTABLE 29
			"THE SIGN OF THE RED HERRING"
		>
		<PLTABLE 39
			"This sign unintentionally left blank."
		>
	>
>

;-----------------------------------------------------------------------------
; "global used by invocation code fragment"
;-----------------------------------------------------------------------------

<GLOBAL GL-WINDOW:NUMBER 0>

;-----------------------------------------------------------------------------
; "setting of global with value from table"
;-----------------------------------------------------------------------------

;<SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-HENRY>>

;-----------------------------------------------------------------------------
; "invocation code fragment"
;-----------------------------------------------------------------------------

;<COND
	(<MC-T? ,GL-WINDOW>
		<RT-WINDOW ,GL-WINDOW>
		<SETG GL-WINDOW <>>
		<CRLF>
	)
>

;*****************************************************************************
; "end of file"
;*****************************************************************************
