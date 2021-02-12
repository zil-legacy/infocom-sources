;*****************************************************************************
; "game : SHERLOCK!"
; "file : SCHED.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   23 Oct 1987 19:53:10  $"
; "rev  : $Revision:   1.14  $"
; "vers : 1.00"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "clock constants"
;-----------------------------------------------------------------------------

; "offsets into time tables"

<CONSTANT K-SEC 0>			; "sec"
<CONSTANT K-MIN 1>			; "min"
<CONSTANT K-HRS 2>			; "hrs"
<CONSTANT K-DAY 3>			; "day"
<CONSTANT K-MON 4>			; "mon"
<CONSTANT K-YRS 5>			; "yrs"
<CONSTANT K-DOW 6>			; "dow"

; "time/date display control - used by rt-clk-nti-msg routines"

<CONSTANT K-NTI-SS 1>		; "disp sec - hh:mm:SS" 
<CONSTANT K-NTI-MM 2>		; "disp min - hh:MM:ss"
<CONSTANT K-NTI-HH 4>		; "disp hrs - HH:mm:ss"
<CONSTANT K-NTI-MT 8>		; "disp 24hr time instead of 12hr am/pm"

; "time/date display control - used by rt-clk-ndt-msg"

<CONSTANT K-NDT-YY 1>		; "disp yrs - mm/dd/YY"
<CONSTANT K-NDT-DD 2>		; "disp day - mm/DD/yy"
<CONSTANT K-NDT-MM 4>		; "disp mon - MM/dd/YY"

; "time/date display control - used by rt-clk-wdt-msg"

<CONSTANT K-WDT-YY  1>		; "disp yrs - month, dd YYYY"
<CONSTANT K-WDT-DD  2>		; "disp day - month, DD yyyy"
<CONSTANT K-WDT-MM  4>		; "disp mon - MONTH, dd yyyy"
<CONSTANT K-WDT-DS  8>		; "disp day suffix (DDst, DDnd, DDrd, DDth)"
<CONSTANT K-WDT-SN 16>		; "disp short month name"
<CONSTANT K-WDT-EN 32>		; "disp equal month name"

; "time/date display control - used by rt-clk-dow-msg"

<CONSTANT K-DOW-DW 1>		; "disp dow"
<CONSTANT K-DOW-SN 2>		; "disp short dow name"
<CONSTANT K-DOW-EN 4>		; "disp equal dow name"

;-----------------------------------------------------------------------------
; "alarm constants"
;-----------------------------------------------------------------------------

<CONSTANT K-A-RSIZE   50>	; "size of alarm routine table in words"
<CONSTANT K-A-TSIZE	350>	; "size of alarm time table in words"
<CONSTANT K-A-TWDTH	  7>	; "size of alarm time table entry in words"

;-----------------------------------------------------------------------------
; "event constants"
;-----------------------------------------------------------------------------

;<CONSTANT K-E-RSIZE   50>	; "size of event routine/move/flag tables in words"

;-----------------------------------------------------------------------------
; "clock globals"
;-----------------------------------------------------------------------------

<GLOBAL GL-CLOCK-WAIT:FLAG  <>>				; "flag to inhibit clock update"
<GLOBAL GL-CLOCK-STOP:FLAG  <>>				; "flag to stop    clock update"

<GLOBAL GL-TIME:TABLE							; "pri game time table"
	<TABLE
		0		; "sec 00-59"
		0		; "min 00-59"
		0 		; "hrs 00-23"
		0 		; "day 01-31"
		0		; "mon 01-12"
		0   	; "yrs 0001-9999"
		0		; "dow 0-6"
	>
>

<GLOBAL GL-TEMP-TIME:TABLE <ITABLE 7 0>>	; "table to hold time temporarily"

<GLOBAL GL-TIME-PARM:TABLE <ITABLE 7 0>>	; "Parameter table to all time routines"

<GLOBAL GL-TIME-UPDT-INC:TABLE			; "next time inc is kept here"
	<TABLE
		0		; "sec"
		0		; "min"
		0		; "hrs"
		0 		; "day"
		0		; "mon"
		0   	; "yrs"
		0		; "dow"
	>
>

<GLOBAL GL-TIME-UPDT-DEF:TABLE			; "default time inc is kept here"
	<TABLE
		0		; "sec"
		0		; "min"
		0		; "hrs"
		0 		; "day"
		0		; "mon"
		0   	; "yrs"
		0		; "dow"
	>
>

<GLOBAL GL-MONTH-LEN:TABLE					; "days per month"
	<PLTABLE
		31											; "offset of 1"
		28
		31
		30
		31
		30
		31
		31
		30
		31
		30
		31
	>
>

;<GLOBAL GL-MONTH-NAME:TABLE				; "long and short month names"
	<PLTABLE
		"January"								; "offset of 1"
		"February"
		"March"
		"April"
		"May"
		"June"
		"July"
		"August"
		"September"
		"October"
		"November"
		"December"
		"Jan"										; "offset of 13"
		"Feb"
		"Mar"
		"Apr"
		"May"
		"Jun"
		"Jul"
		"Aug"
		"Sep"
		"Oct"
		"Nov"
		"Dec"
		"January  "								; "offset of 25"
		"February "
		"March    "
		"April    "
		"May      "
		"June     "
		"July     "
		"August   "
		"September"
		"October  "
		"November "
		"December "
	>
>

<GLOBAL GL-DAY-NAME:TABLE					; "long and short day names"
	<PTABLE
		"Sunday"									; "offset of  0"
		"Monday"
		"Tuesday"
		"Wednesday"
		"Thursday"
		"Friday"
		"Saturday"
		"Sun"										; "offset of  7"
		"Mon"
		"Tue"
		"Wed"
		"Thu"
		"Fri"
		"Sat"
		"Sunday   "								; "offset of 14"
		"Monday   "
		"Tuesday  "
		"Wednesday"
		"Thursday "
		"Friday   "
		"Saturday "
	>
>

;-----------------------------------------------------------------------------
; "alarm globals"
;-----------------------------------------------------------------------------

<GLOBAL GL-ALARM-WAIT:FLAG  <>>			; "flag to inhibit alarm check"
<GLOBAL GL-ALARM-STOP:FLAG  <>>			; "flag to stop    alarm check"
<GLOBAL GL-ALARM-EXEC:FLAG  <>>			; "flag to show an alarm is executing"

<GLOBAL GL-A-ROUT:TABLE <ITABLE ,K-A-RSIZE 0>>	; "table of routines"
<GLOBAL GL-A-TIME:TABLE <ITABLE ,K-A-TSIZE 0>>	; "table of times (6 words)"

;-----------------------------------------------------------------------------
; "event globals"
;-----------------------------------------------------------------------------

;<GLOBAL GL-EVENT-WAIT:FLAG  <>>			; "flag to inhibit event check"
;<GLOBAL GL-EVENT-STOP:FLAG  <>>			; "flag to stop    event check"
;<GLOBAL GL-EVENT-EXEC:FLAG  <>>			; "flag to show an event is executing"

;<GLOBAL GL-E-ROUT:TABLE <ITABLE ,K-E-RSIZE 0>>	; "table of routines"
;<GLOBAL GL-E-MOVS:TABLE <ITABLE ,K-E-RSIZE 0>>	; "table of move numbers"

;-----------------------------------------------------------------------------
; "support routines use by clock/event/alarm"
;-----------------------------------------------------------------------------

;-----------------------------------------------------------------------------
; "RT-COPY-TIME"
; "Copy time table 1 to time table 2"
;-----------------------------------------------------------------------------

<ROUTINE RT-COPY-TIME (TBL1 TBL2)
	<COPYT .TBL1 .TBL2 14>
;	<PUT .TIME-TABLE2 ,K-SEC <GET .TIME-TABLE1 ,K-SEC>>
;	<PUT .TIME-TABLE2 ,K-MIN <GET .TIME-TABLE1 ,K-MIN>>
;	<PUT .TIME-TABLE2 ,K-HRS <GET .TIME-TABLE1 ,K-HRS>>
;	<PUT .TIME-TABLE2 ,K-DAY <GET .TIME-TABLE1 ,K-DAY>>
;	<PUT .TIME-TABLE2 ,K-MON <GET .TIME-TABLE1 ,K-MON>>
;	<PUT .TIME-TABLE2 ,K-YRS <GET .TIME-TABLE1 ,K-YRS>>
;	<PUT .TIME-TABLE2 ,K-DOW <GET .TIME-TABLE1 ,K-DOW>>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-NORM-TIME"
;-----------------------------------------------------------------------------

<ROUTINE RT-NORM-TIME (TIME-TABLE "AUX" TEMP M-LEN)

; "normalize seconds"

	<REPEAT ()
		<SET TEMP <GET .TIME-TABLE ,K-SEC>>
		<COND
			(<G? .TEMP 59>
				<PUT .TIME-TABLE ,K-SEC <- .TEMP 60>>
				<PUT .TIME-TABLE ,K-MIN <+ <GET .TIME-TABLE ,K-MIN> 1>>
			)
			(T
				<RETURN>
			)
		>
	>

; "normalize minutes"

	<REPEAT ()
		<SET TEMP <GET .TIME-TABLE ,K-MIN>>
		<COND
			(<G? .TEMP 59>
				<PUT .TIME-TABLE ,K-MIN <- .TEMP 60>>
				<PUT .TIME-TABLE ,K-HRS <+ <GET .TIME-TABLE ,K-HRS> 1>>
			)
			(T
				<RETURN>
			)
		>
	>

; "normalize hours"

	<REPEAT ()
		<SET TEMP <GET .TIME-TABLE ,K-HRS>>
		<COND
			(<G? .TEMP 23>
				<PUT .TIME-TABLE ,K-HRS <- .TEMP 24>>
				<PUT .TIME-TABLE ,K-DAY <+ <GET .TIME-TABLE ,K-DAY> 1>>
				<PUT .TIME-TABLE ,K-DOW <MOD <+ <GET .TIME-TABLE ,K-DOW> 1> 7>>
			)
			(T
				<RETURN>
			)
		>
	>

; "normalize day, month, and year (including leap years)"

	<REPEAT ()
		<SET M-LEN <GET ,GL-MONTH-LEN <GET .TIME-TABLE ,K-MON>>>
		<COND
			(<NOT <EQUAL? <GET .TIME-TABLE ,K-MON> 2>>
				T
			)
			(<ZERO? <MOD <GET .TIME-TABLE ,K-YRS> 100>>
				T
			)
			(<ZERO? <MOD <GET .TIME-TABLE ,K-YRS> 4>>
				<INC M-LEN>
			)
		>
		<SET TEMP <GET .TIME-TABLE ,K-DAY>>
		<COND
			(<G? .TEMP .M-LEN>
				<PUT .TIME-TABLE ,K-DAY <- .TEMP .M-LEN>>
				<PUT .TIME-TABLE ,K-MON <+ <GET .TIME-TABLE ,K-MON> 1>>
				<SET TEMP <GET .TIME-TABLE ,K-MON>>
				<COND
					(<G? .TEMP 12>
						<PUT .TIME-TABLE ,K-MON <- .TEMP 12>>
						<PUT .TIME-TABLE ,K-YRS <+ <GET .TIME-TABLE ,K-YRS> 1>>
					)
				>
			)
			(T
				<RETURN>
			)
		>
	>
>

;-----------------------------------------------------------------------------
; "clock routines"
;-----------------------------------------------------------------------------

;-----------------------------------------------------------------------------
; "RT-CLOCK-INC-SET"
;-----------------------------------------------------------------------------

<ROUTINE RT-CLOCK-INC-SET (HRS MIN SEC "OPTIONAL" (YRS 0) (MON 0) (DAY 0) (DOW 0))
	<PUT ,GL-TIME-UPDT-INC ,K-SEC .SEC>
	<PUT ,GL-TIME-UPDT-INC ,K-MIN .MIN>
	<PUT ,GL-TIME-UPDT-INC ,K-HRS .HRS>
 	<PUT ,GL-TIME-UPDT-INC ,K-DAY .DAY>
 	<PUT ,GL-TIME-UPDT-INC ,K-MON .MON>
 	<PUT ,GL-TIME-UPDT-INC ,K-YRS .YRS>
 	<PUT ,GL-TIME-UPDT-INC ,K-DOW .DOW>
>

;-----------------------------------------------------------------------------
; "RT-CLOCK-DEF-SET"
;-----------------------------------------------------------------------------

<ROUTINE RT-CLOCK-DEF-SET (HRS MIN SEC "OPTIONAL" (YRS 0) (MON 0) (DAY 0) (DOW 0))
	<PUT ,GL-TIME-UPDT-DEF ,K-SEC .SEC>
	<PUT ,GL-TIME-UPDT-DEF ,K-MIN .MIN>
	<PUT ,GL-TIME-UPDT-DEF ,K-HRS .HRS>
 	<PUT ,GL-TIME-UPDT-DEF ,K-DAY .DAY>
 	<PUT ,GL-TIME-UPDT-DEF ,K-MON .MON>
 	<PUT ,GL-TIME-UPDT-DEF ,K-YRS .YRS>
 	<PUT ,GL-TIME-UPDT-DEF ,K-DOW .DOW>
>

;-----------------------------------------------------------------------------
; "RT-CLOCK-SET"
;-----------------------------------------------------------------------------

<ROUTINE RT-CLOCK-SET (HRS MIN SEC YRS MON DAY DOW)
	<PUT ,GL-TIME ,K-SEC .SEC>
	<PUT ,GL-TIME ,K-MIN .MIN>
	<PUT ,GL-TIME ,K-HRS .HRS>
	<PUT ,GL-TIME ,K-DAY .DAY>
	<PUT ,GL-TIME ,K-MON .MON>
	<PUT ,GL-TIME ,K-YRS .YRS>
	<PUT ,GL-TIME ,K-DOW .DOW>
>

;-----------------------------------------------------------------------------
; "RT-CLOCK-INC"
;-----------------------------------------------------------------------------

<ROUTINE RT-CLOCK-INC ()
	<COND
		(<MC-T? ,GL-CLOCK-WAIT>
			<SETG GL-CLOCK-WAIT <>>
			<RFALSE>
		)
		(<MC-T? ,GL-CLOCK-STOP>
			<RFALSE>
		)
	>

; "add gl-time-updt-inc to gl-time"

	<PUT ,GL-TIME ,K-SEC <+ <GET ,GL-TIME ,K-SEC> <GET ,GL-TIME-UPDT-INC ,K-SEC>>>
	<PUT ,GL-TIME ,K-MIN <+ <GET ,GL-TIME ,K-MIN> <GET ,GL-TIME-UPDT-INC ,K-MIN>>>
	<PUT ,GL-TIME ,K-HRS <+ <GET ,GL-TIME ,K-HRS> <GET ,GL-TIME-UPDT-INC ,K-HRS>>>
 	<PUT ,GL-TIME ,K-DAY <+ <GET ,GL-TIME ,K-DAY> <GET ,GL-TIME-UPDT-INC ,K-DAY>>>
 	<PUT ,GL-TIME ,K-MON <+ <GET ,GL-TIME ,K-MON> <GET ,GL-TIME-UPDT-INC ,K-MON>>>
 	<PUT ,GL-TIME ,K-YRS <+ <GET ,GL-TIME ,K-YRS> <GET ,GL-TIME-UPDT-INC ,K-YRS>>>
	<PUT ,GL-TIME ,K-DOW <+ <GET ,GL-TIME ,K-DOW> <GET ,GL-TIME-UPDT-INC ,K-DOW>>>

; "copy gl-time-updt-def into gl-time-updt-inc"

	<COPYT ,GL-TIME-UPDT-DEF ,GL-TIME-UPDT-INC 14>
;	<PUT ,GL-TIME-UPDT-INC ,K-SEC <GET ,GL-TIME-UPDT-DEF ,K-SEC>>
;	<PUT ,GL-TIME-UPDT-INC ,K-MIN <GET ,GL-TIME-UPDT-DEF ,K-MIN>>
;	<PUT ,GL-TIME-UPDT-INC ,K-HRS <GET ,GL-TIME-UPDT-DEF ,K-HRS>>
; 	<PUT ,GL-TIME-UPDT-INC ,K-DAY <GET ,GL-TIME-UPDT-DEF ,K-DAY>>
; 	<PUT ,GL-TIME-UPDT-INC ,K-MON <GET ,GL-TIME-UPDT-DEF ,K-MON>>
; 	<PUT ,GL-TIME-UPDT-INC ,K-YRS <GET ,GL-TIME-UPDT-DEF ,K-YRS>>

; "normalize the time in gl-time"

	<RT-NORM-TIME ,GL-TIME>
>

;-----------------------------------------------------------------------------
; "RT-PARM-SET"
;-----------------------------------------------------------------------------

<ROUTINE RT-PARM-SET (HRS MIN SEC "OPTIONAL" (YRS 0) (MON 0) (DAY 0) (DOW 0))
	<PUT ,GL-TIME-PARM ,K-SEC .SEC>
	<PUT ,GL-TIME-PARM ,K-MIN .MIN>
	<PUT ,GL-TIME-PARM ,K-HRS .HRS>
	<PUT ,GL-TIME-PARM ,K-DAY .DAY>
	<PUT ,GL-TIME-PARM ,K-MON .MON>
	<PUT ,GL-TIME-PARM ,K-YRS .YRS>
	<PUT ,GL-TIME-PARM ,K-DOW .DOW>
	<RETURN ,GL-TIME-PARM>
>

;-----------------------------------------------------------------------------
; "RT-CLOCK-CMP"
; "Returns -1 if arg time < current time."
; "Returns  0 if arg time = current time."
; "Returns  1 if arg time > current time."
;-----------------------------------------------------------------------------

<ROUTINE RT-CLOCK-CMP (HRS MIN SEC "OPTIONAL" (YRS 0) (MON 0) (DAY 0))
	<COND
		(<ZERO? .YRS>
			T
		)
		(<G? .YRS <GET ,GL-TIME ,K-YRS>>
			<RETURN 1>
		)
		(<L? .YRS <GET ,GL-TIME ,K-YRS>>
			<RETURN -1>
		)
	>
	<COND
		(<ZERO? .MON>
			T
		)
		(<G? .MON <GET ,GL-TIME ,K-MON>>
			<RETURN 1>
		)
		(<L? .MON <GET ,GL-TIME ,K-MON>>
			<RETURN -1>
		)
	>
	<COND
		(<ZERO? .DAY>
			T
		)
		(<G? .DAY <GET ,GL-TIME ,K-DAY>>
			<RETURN 1>
		)
		(<L? .DAY <GET ,GL-TIME ,K-DAY>>
			<RETURN -1>
		)
	>
	<COND
		(<G? .HRS <GET ,GL-TIME ,K-HRS>>
			<RETURN 1>
		)
		(<L? .HRS <GET ,GL-TIME ,K-HRS>>
			<RETURN -1>
		)
		(<G? .MIN <GET ,GL-TIME ,K-MIN>>
			<RETURN 1>
		)
		(<L? .MIN <GET ,GL-TIME ,K-MIN>>
			<RETURN -1>
		)
		(<G? .SEC <GET ,GL-TIME ,K-SEC>>
			<RETURN 1>
		)
		(<L? .SEC <GET ,GL-TIME ,K-SEC>>
			<RETURN -1>
		)
		(T
			<RETURN 0>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-CLOCK-JMP"
;-----------------------------------------------------------------------------

<ROUTINE RT-CLOCK-JMP (HRS MIN SEC "OPTIONAL" (YRS 0) (MON 0) (DAY 0) (DOW 0))
	<RT-CLOCK-INC-SET .HRS .MIN .SEC .YRS .MON .DAY .DOW>
	<RT-CLOCK-INC>
	<RT-ALARM-CHK
		<COND
			(<MC-VERB? WAIT WAIT-FOR>
				2
			)
			(T
				1
			)
		>
	>
	<SETG GL-CLOCK-WAIT T>
>

;-----------------------------------------------------------------------------
; "RT-CLK-NTI-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-CLK-NTI-MSG ("OPTIONAL" (FMT 7) "AUX" HRS MIN SEC MSD MER)
	<SET HRS <GET ,GL-TIME ,K-HRS>>
	<SET MIN <GET ,GL-TIME ,K-MIN>>
	<SET SEC <GET ,GL-TIME ,K-SEC>>

	<COND
		(<BAND .FMT ,K-NTI-HH>
			<COND
				(<BAND .FMT ,K-NTI-MT>
					<SET MSD "0">
					<SET MER " ">
				)
				(<EQUAL? .HRS 0>
					<SET HRS <+ .HRS 12>>
					<SET MSD " ">
					<SET MER " a.m.">
				)
				(<L? .HRS 12>
					<SET MSD " ">
					<SET MER " a.m.">
				)
				(<EQUAL? .HRS 12>
					<SET MSD " ">
					<SET MER " p.m.">
				)
				(T
					<SET HRS <- .HRS 12>>
					<SET MSD " ">
					<SET MER " p.m.">
				)
			>
			<COND
				(<L? .HRS 10>
					<TELL .MSD>
				)
			>
			<TELL N .HRS>
		)
	>

	<COND
		(<BAND .FMT ,K-NTI-MM>
			<COND
				(<BAND .FMT ,K-NTI-HH>
					<TELL ":">
				)
			>
			<COND
				(<L? .MIN 10>
					<TELL "0">
				)
			>
			<TELL N .MIN>
		)
	>

	<COND
		(<BAND .FMT ,K-NTI-SS>
			<COND
				(<OR	<BAND .FMT ,K-NTI-HH>
						<BAND .FMT ,K-NTI-MM>
					>
					<TELL ":">
				)
			>
			<COND
				(<L? .SEC 10>
					<TELL "0">
				)
			>
			<TELL N .SEC>
		)
	>

	<COND
		(<BAND .FMT 4>
			<TELL .MER>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-CLK-NDT-MSG"
;-----------------------------------------------------------------------------

;<ROUTINE RT-CLK-NDT-MSG ("OPTIONAL" (FMT 7) "AUX" YRS MON DAY)
	<SET YRS <GET ,GL-TIME ,K-YRS>>
	<SET MON <GET ,GL-TIME ,K-MON>>
	<SET DAY <GET ,GL-TIME ,K-DAY>>

	<SET YRS <MOD .YRS 100>>

	<COND
		(<BAND .FMT ,K-NDT-MM>
			<COND
				(<L? .MON 10>
					<TELL "0">
				)
			>
			<TELL N .MON>
		)
	>

	<COND
		(<BAND .FMT ,K-NDT-DD>
			<COND
				(<BAND .FMT ,K-NDT-MM>
					<TELL "/">
				)
			>
			<COND
				(<L? .DAY 10>
					<TELL "0">
				)
			>
			<TELL N .DAY>
		)
	>

	<COND
		(<BAND .FMT ,K-NDT-YY>
			<COND
				(<OR	<BAND .FMT ,K-NDT-MM>
						<BAND .FMT ,K-NDT-DD>
						>
							<TELL "/">
				)
			>
			<COND
				(<L? .YRS 10>
					<TELL "0">
				)
			>
			<TELL N .YRS>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-CLK-WDT-MSG"
;-----------------------------------------------------------------------------

;<ROUTINE RT-CLK-WDT-MSG ("OPTIONAL" (FMT 15) "AUX" YRS MON DAY WMON)
	<SET YRS <GET ,GL-TIME ,K-YRS>>
	<SET MON <GET ,GL-TIME ,K-MON>>
	<SET DAY <GET ,GL-TIME ,K-DAY>>

	<COND
		(<BAND .FMT ,K-WDT-MM>
			<COND
				(<BAND .FMT ,K-WDT-EN>
					<SET WMON <GET ,GL-MONTH-NAME <+ .MON 24>>>
				)
				(<BAND .FMT ,K-WDT-SN>
					<SET WMON <GET ,GL-MONTH-NAME <+ .MON 12>>>
				)
				(T
					<SET WMON <GET ,GL-MONTH-NAME .MON>>
				)
			>
			<TELL .WMON>
		)
	>

	<COND
		(<BAND .FMT ,K-WDT-DD>
			<COND
				(<BAND .FMT ,K-WDT-MM>
					<TELL ", ">
				)
			>
			<TELL N .DAY>
			<COND
				(<BAND .FMT ,K-WDT-DS>
					<COND
						(<EQUAL? .DAY 1 21 31>
							<TELL "st">
						)
						(<EQUAL? .DAY 2 22>
							<TELL "nd">
						)
						(<EQUAL? .DAY 3 23>
							<TELL "rd">
						)
						(T
							<TELL "th">
						)
					>
				)
			>
		)
	>

	<COND
		(<BAND .FMT ,K-WDT-YY>
			<COND
				(<OR	<BAND .FMT ,K-WDT-MM>
						<BAND .FMT ,K-WDT-DD>
						>
							<TELL " ">
				)
			>
			<TELL N .YRS>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-CLK-DOW-MSG"
;-----------------------------------------------------------------------------

<ROUTINE RT-CLK-DOW-MSG ("OPTIONAL" (FMT 1) "AUX" DOW WDOW)
	<SET DOW <GET ,GL-TIME ,K-DOW>>
	<COND
		(<BAND .FMT ,K-DOW-DW>
			<COND
				(<BAND .FMT ,K-DOW-EN>
					<SET WDOW <GET ,GL-DAY-NAME <+ .DOW 14>>>
				)
				(<BAND .FMT ,K-DOW-SN>
					<SET WDOW <GET ,GL-DAY-NAME <+ .DOW  7>>>
				)
				(T
					<SET WDOW <GET ,GL-DAY-NAME .DOW>>
				)
			>
			<TELL .WDOW>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-TIME"
;-----------------------------------------------------------------------------

;<ROUTINE RT-TIME ("AUX" HRS MIN SEC)
	<SET SEC <* <GET ,GL-TIME ,K-SEC>   0>>
	<SET MIN <* <GET ,GL-TIME ,K-MIN>   1>>
	<SET HRS <* <GET ,GL-TIME ,K-HRS> 100>>
	<RETURN <+ <+ .HRS .MIN> .SEC>>
>

;-----------------------------------------------------------------------------
; "RT-DATE"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DATE ("AUX" YRS MON DAY)
	<SET DAY <* <GET ,GL-TIME ,K-DAY>   0>>
	<SET MON <* <GET ,GL-TIME ,K-MON>   1>>
	<SET YRS <* <GET ,GL-TIME ,K-YRS> 100>>
	<RETURN <+ <+ .YRS .MON> .DAY>>
>

;-----------------------------------------------------------------------------
; "alarm routines"
;-----------------------------------------------------------------------------

;-----------------------------------------------------------------------------
; "RT-ALARM-SET?"
;-----------------------------------------------------------------------------

<ROUTINE RT-ALARM-SET? (RTN "AUX" (R-PTR 0) T-PTR)
	<REPEAT ()
		<COND
			(<EQUAL? .R-PTR ,K-A-RSIZE>
				<RFALSE>
			)
		   (<EQUAL? .RTN <GET ,GL-A-ROUT .R-PTR>>
				<SET T-PTR <* .R-PTR ,K-A-TWDTH>>
				<RT-COPY-TIME <REST ,GL-A-TIME <* .T-PTR 2>> ,GL-TIME-PARM>
				<RTRUE>
			)
			(T
				<INC R-PTR>
			)
		>
	>
>

;-----------------------------------------------------------------------------
; "RT-ALARM-SET-REL"
;-----------------------------------------------------------------------------

<ROUTINE RT-ALARM-SET-REL (RTN TIME "AUX" (R-PTR 0) T-PTR)
	<REPEAT ()
		<COND
			(<EQUAL? .R-PTR ,K-A-RSIZE>
				<TELL CR "*** TOO MANY ALARMS (REL) ***" CR CR>
				<RFALSE>
			)
		   (<ZERO? <GET ,GL-A-ROUT .R-PTR>>
				<PUT ,GL-A-ROUT .R-PTR .RTN>

				<SET T-PTR <* .R-PTR ,K-A-TWDTH>>
				<COND
					(<OR	;<MC-T? ,GL-EVENT-EXEC>
							<MC-T? ,GL-ALARM-EXEC>
						>
						<PUT ,GL-A-TIME <+ .T-PTR ,K-SEC> <+ <GET ,GL-TIME ,K-SEC> <GET .TIME ,K-SEC>>>
						<PUT ,GL-A-TIME <+ .T-PTR ,K-MIN> <+ <GET ,GL-TIME ,K-MIN> <GET .TIME ,K-MIN>>>
						<PUT ,GL-A-TIME <+ .T-PTR ,K-HRS> <+ <GET ,GL-TIME ,K-HRS> <GET .TIME ,K-HRS>>>
						<PUT ,GL-A-TIME <+ .T-PTR ,K-DAY> <+ <GET ,GL-TIME ,K-DAY> <GET .TIME ,K-DAY>>>
						<PUT ,GL-A-TIME <+ .T-PTR ,K-MON> <+ <GET ,GL-TIME ,K-MON> <GET .TIME ,K-MON>>>
						<PUT ,GL-A-TIME <+ .T-PTR ,K-YRS> <+ <GET ,GL-TIME ,K-YRS> <GET .TIME ,K-YRS>>>
						<PUT ,GL-A-TIME <+ .T-PTR ,K-DOW> <+ <GET ,GL-TIME ,K-DOW> <GET .TIME ,K-DOW>>>
					)
					(T
						<PUT ,GL-A-TIME <+ .T-PTR ,K-SEC> <+ <+ <GET ,GL-TIME ,K-SEC> <GET .TIME ,K-SEC>> <GET ,GL-TIME-UPDT-INC ,K-SEC>>>
						<PUT ,GL-A-TIME <+ .T-PTR ,K-MIN> <+ <+ <GET ,GL-TIME ,K-MIN> <GET .TIME ,K-MIN>> <GET ,GL-TIME-UPDT-INC ,K-MIN>>>
						<PUT ,GL-A-TIME <+ .T-PTR ,K-HRS> <+ <+ <GET ,GL-TIME ,K-HRS> <GET .TIME ,K-HRS>> <GET ,GL-TIME-UPDT-INC ,K-HRS>>>
						<PUT ,GL-A-TIME <+ .T-PTR ,K-DAY> <+ <+ <GET ,GL-TIME ,K-DAY> <GET .TIME ,K-DAY>> <GET ,GL-TIME-UPDT-INC ,K-DAY>>>
						<PUT ,GL-A-TIME <+ .T-PTR ,K-MON> <+ <+ <GET ,GL-TIME ,K-MON> <GET .TIME ,K-MON>> <GET ,GL-TIME-UPDT-INC ,K-MON>>>
						<PUT ,GL-A-TIME <+ .T-PTR ,K-YRS> <+ <+ <GET ,GL-TIME ,K-YRS> <GET .TIME ,K-YRS>> <GET ,GL-TIME-UPDT-INC ,K-YRS>>>
						<PUT ,GL-A-TIME <+ .T-PTR ,K-DOW> <+ <+ <GET ,GL-TIME ,K-DOW> <GET .TIME ,K-DOW>> <GET ,GL-TIME-UPDT-INC ,K-DOW>>>
					)
				>
				<RT-NORM-TIME <REST ,GL-A-TIME <* .T-PTR 2>>>

				<RTRUE>
			)
			(T
				<INC R-PTR>
			)
		>
	>
>

;-----------------------------------------------------------------------------
; "RT-ALARM-SET-ABS"
;-----------------------------------------------------------------------------

<ROUTINE RT-ALARM-SET-ABS (RTN TIME "AUX" (R-PTR 0) T-PTR)
	<REPEAT ()
		<COND
			(<EQUAL? .R-PTR ,K-A-RSIZE>
				<TELL CR "*** TOO MANY (ABS) ALARMS ***" CR CR>
				<RFALSE>
			)
		   (<ZERO? <GET ,GL-A-ROUT .R-PTR>>
				<PUT ,GL-A-ROUT .R-PTR .RTN>

				<SET T-PTR <* .R-PTR ,K-A-TWDTH>>

				<COPYT .TIME <REST ,GL-A-TIME <* .T-PTR 2>> 14>
;				<PUT ,GL-A-TIME <+ .T-PTR ,K-SEC> <GET .TIME ,K-SEC>>
;				<PUT ,GL-A-TIME <+ .T-PTR ,K-MIN> <GET .TIME ,K-MIN>>
;				<PUT ,GL-A-TIME <+ .T-PTR ,K-HRS> <GET .TIME ,K-HRS>>
;				<PUT ,GL-A-TIME <+ .T-PTR ,K-DAY> <GET .TIME ,K-DAY>>
;				<PUT ,GL-A-TIME <+ .T-PTR ,K-MON> <GET .TIME ,K-MON>>
;				<PUT ,GL-A-TIME <+ .T-PTR ,K-YRS> <GET .TIME ,K-YRS>>
;				<PUT ,GL-A-TIME <+ .T-PTR ,K-DOW> <GET .TIME ,K-DOW>>

				<RTRUE>
			)
			(T
				<INC R-PTR>
			)
		>
	>
>

;-----------------------------------------------------------------------------
; "RT-ALARM-CLR"
;-----------------------------------------------------------------------------

<ROUTINE RT-ALARM-CLR (RTN "AUX" (R-PTR 0) T-PTR)
	<REPEAT ()
		<COND
			(<EQUAL? .R-PTR ,K-A-RSIZE>
				<RFALSE>
			)
		   (<EQUAL? .RTN <GET ,GL-A-ROUT .R-PTR>>
				<PUT ,GL-A-ROUT .R-PTR 0>

				<SET T-PTR <* .R-PTR ,K-A-TWDTH>>

				<PUT ,GL-A-TIME <+ .T-PTR ,K-SEC> 0>
				<PUT ,GL-A-TIME <+ .T-PTR ,K-MIN> 0>
				<PUT ,GL-A-TIME <+ .T-PTR ,K-HRS> 0>
				<PUT ,GL-A-TIME <+ .T-PTR ,K-DAY> 0>
				<PUT ,GL-A-TIME <+ .T-PTR ,K-MON> 0>
				<PUT ,GL-A-TIME <+ .T-PTR ,K-YRS> 0>
				<PUT ,GL-A-TIME <+ .T-PTR ,K-DOW> 0>
			)
		>
		<INC R-PTR>
	>
>

;-----------------------------------------------------------------------------
; "RT-ALARM-CHK"
;-----------------------------------------------------------------------------

<ROUTINE RT-ALARM-CHK ("OPTIONAL" (PARM 0) "AUX" VAL (RTN -1) (R-PTR 0) (R-CNT 0) T-PTR HRS MIN SEC YRS MON DAY DOW)
	<COND
		(<MC-T? ,GL-ALARM-WAIT>
			<SETG GL-ALARM-WAIT <>>
			<RFALSE>
		)
		(<MC-T? ,GL-ALARM-STOP>
			<RFALSE>
		)
	>

	<RT-COPY-TIME ,GL-TIME ,GL-TEMP-TIME>

	<REPEAT ()
		<COND
			(<EQUAL? .R-PTR ,K-A-RSIZE>
				<COND
					(<EQUAL? .RTN -1>
						<RETURN .R-CNT>
					)
					(T
						; "Time to run it"

						<SET R-PTR .RTN>	; "Get the offset stored in RTN"

						<SET RTN <GET ,GL-A-ROUT .R-PTR>>
						<SET T-PTR <* .R-PTR ,K-A-TWDTH>>
						<PUT ,GL-A-ROUT .R-PTR 0>
						<SET SEC <GET ,GL-A-TIME <+ .T-PTR ,K-SEC>>>
						<SET MIN <GET ,GL-A-TIME <+ .T-PTR ,K-MIN>>>
						<SET HRS <GET ,GL-A-TIME <+ .T-PTR ,K-HRS>>>
						<SET DAY <GET ,GL-A-TIME <+ .T-PTR ,K-DAY>>>
						<SET MON <GET ,GL-A-TIME <+ .T-PTR ,K-MON>>>
						<SET YRS <GET ,GL-A-TIME <+ .T-PTR ,K-YRS>>>
						<SET DOW <GET ,GL-A-TIME <+ .T-PTR ,K-DOW>>>
						<PUT ,GL-A-TIME <+ .T-PTR ,K-SEC> 0>
						<PUT ,GL-A-TIME <+ .T-PTR ,K-MIN> 0>
						<PUT ,GL-A-TIME <+ .T-PTR ,K-HRS> 0>
						<PUT ,GL-A-TIME <+ .T-PTR ,K-DAY> 0>
						<PUT ,GL-A-TIME <+ .T-PTR ,K-MON> 0>
						<PUT ,GL-A-TIME <+ .T-PTR ,K-YRS> 0>
						<PUT ,GL-A-TIME <+ .T-PTR ,K-DOW> 0>

						<COND
							(<MC-ISNOT? ,CH-PLAYER ,FL-ASLEEP>
								<RT-UPDATE-STATUS-LINE>
							)
						>

						<SETG GL-ALARM-EXEC T>
						<SET VAL <APPLY .RTN>>
						<SETG GL-ALARM-EXEC <>>

						<INC R-CNT>

						<RT-COPY-TIME ,GL-TEMP-TIME ,GL-TIME>

					; "If alarm time != new time, ask for key to cont."

						<COND
							(<AND	<MC-T? .VAL>
									<EQUAL? <RT-CLOCK-CMP .HRS .MIN .SEC .YRS .MON .DAY> -1>
								>
								<COND
									(<EQUAL? .PARM 1>
										<TELL "[Press any key to continue.]" CR>
										<INPUT 1>
									)
									(<EQUAL? .PARM 2>
										<REPEAT ()
											<BUFOUT <>>
											<TELL CR
"Do you want to continue waiting?" CR
"Please press Y or N > "
											>
											<BUFOUT T>
											<SET VAL <INPUT 1>>
											<CRLF>
											<COND
												(<OR	<EQUAL? .VAL %<ASCII !\N>>
														<EQUAL? .VAL %<ASCII !\n>>
													>
													<SET RTN -1>
													<SET R-PTR ,K-A-RSIZE>
													<RT-CLOCK-SET .HRS .MIN .SEC .YRS .MON .DAY .DOW>
													<RETURN>
												)
												(<OR	<EQUAL? .VAL %<ASCII !\Y>>
														<EQUAL? .VAL %<ASCII !\y>>
													>
													<RETURN>
												)
											>
										>
									)
								>
							)	
						>

						; "Reset and start loop again."

						<COND
							(<EQUAL? .RTN -1>
								<AGAIN>
							)
						>
						<SET RTN -1>
						<SET R-PTR 0>
						<AGAIN>
					)
				>
			)
		>
		<COND
			(<MC-T? <GET ,GL-A-ROUT .R-PTR>>
				<SET T-PTR <* .R-PTR ,K-A-TWDTH>>
				<SET SEC <GET ,GL-A-TIME <+ .T-PTR ,K-SEC>>>
				<SET MIN <GET ,GL-A-TIME <+ .T-PTR ,K-MIN>>>
				<SET HRS <GET ,GL-A-TIME <+ .T-PTR ,K-HRS>>>
				<SET DAY <GET ,GL-A-TIME <+ .T-PTR ,K-DAY>>>
				<SET MON <GET ,GL-A-TIME <+ .T-PTR ,K-MON>>>
				<SET YRS <GET ,GL-A-TIME <+ .T-PTR ,K-YRS>>>
				<SET DOW <GET ,GL-A-TIME <+ .T-PTR ,K-DOW>>>
				<COND
					(<OR	<AND	<MC-T? .PARM>
									<EQUAL? <RT-CLOCK-CMP .HRS .MIN .SEC .YRS .MON .DAY> -1>
							>
							<AND	<MC-F? .PARM>
							  		<EQUAL? <RT-CLOCK-CMP .HRS .MIN .SEC .YRS .MON .DAY> -1 0>
							>
						>
						<PUT ,GL-TIME ,K-SEC .SEC>
						<PUT ,GL-TIME ,K-MIN .MIN>
						<PUT ,GL-TIME ,K-HRS .HRS>
						<PUT ,GL-TIME ,K-DAY .DAY>
						<PUT ,GL-TIME ,K-MON .MON>
						<PUT ,GL-TIME ,K-YRS .YRS>
						<PUT ,GL-TIME ,K-DOW .DOW>

						<SET RTN .R-PTR>
					)
				>
			)	
		>
		<INC R-PTR>
	>
>

;-----------------------------------------------------------------------------
; "event routines"
;-----------------------------------------------------------------------------

;-----------------------------------------------------------------------------
; "RT-EVENT-SET?"
;-----------------------------------------------------------------------------

;<ROUTINE RT-EVENT-SET? (RTN "AUX" (R-PTR 0))
	<REPEAT ()
		<COND
			(<EQUAL? .R-PTR ,K-E-RSIZE>
				<RFALSE>
			)
		   (<EQUAL? .RTN <GET ,GL-E-ROUT .R-PTR>>
				<RTRUE>
			)
			(T
				<INC R-PTR>
			)
		>
	>
>

;-----------------------------------------------------------------------------
; "RT-EVENT-SET-REL"
;-----------------------------------------------------------------------------

;<ROUTINE RT-EVENT-SET-REL (RTN MOV "AUX" (R-PTR 0))
	<REPEAT ()
		<COND
			(<EQUAL? .R-PTR ,K-E-RSIZE>
				<TELL CR "*** TOO MANY (REL) EVENTS ***" CR CR>
				<RFALSE>
			)
		   (<ZERO? <GET ,GL-E-ROUT .R-PTR>>
				<PUT ,GL-E-ROUT .R-PTR .RTN>
				<COND
					(<OR 	<MC-T? ,GL-EVENT-EXEC>
							<MC-T? ,GL-ALARM-EXEC>>
						<PUT ,GL-E-MOVS .R-PTR <+ 0 <+ .MOV ,GL-MOVES-CUR>>>
					)
					(T
						<PUT ,GL-E-MOVS .R-PTR <+ 1 <+ .MOV ,GL-MOVES-CUR>>>	
					)
				>
				<RTRUE>
			)
			(T
				<INC R-PTR>
			)
		>
	>
>

;-----------------------------------------------------------------------------
; "RT-EVENT-SET-ABS"
;-----------------------------------------------------------------------------

;<ROUTINE RT-EVENT-SET-ABS (RTN MOV "AUX" (R-PTR 0))
	<REPEAT ()
		<COND
			(<EQUAL? .R-PTR ,K-E-RSIZE>
				<TELL CR "*** TOO MANY (ABS) EVENTS ***" CR CR>
				<RFALSE>
			)
		   (<ZERO? <GET ,GL-E-ROUT .R-PTR>>
				<PUT ,GL-E-ROUT .R-PTR .RTN>
				<PUT ,GL-E-MOVS .R-PTR .MOV>
				<RTRUE>
			)
			(T
				<INC R-PTR>
			)
		>
	>
>

;-----------------------------------------------------------------------------
; "RT-EVENT-CLR"
;-----------------------------------------------------------------------------

;<ROUTINE RT-EVENT-CLR (RTN "AUX" (R-PTR 0))
	<REPEAT ()
		<COND
			(<EQUAL? .R-PTR ,K-E-RSIZE>
				<RFALSE>
			)
		   (<EQUAL? .RTN <GET ,GL-E-ROUT .R-PTR>>
				<PUT ,GL-E-ROUT .R-PTR 0>
				<PUT ,GL-E-MOVS .R-PTR 0>
			)
		>
		<INC R-PTR>
	>
>

;-----------------------------------------------------------------------------
; "RT-EVENT-CHK"
;-----------------------------------------------------------------------------

;<ROUTINE RT-EVENT-CHK ("AUX" MOV RTN (R-PTR 0) (R-CNT 0))
	<COND
		(<MC-T? ,GL-EVENT-WAIT>
			<SETG GL-EVENT-WAIT <>>
			<RFALSE>
		)
		(<MC-T? ,GL-EVENT-STOP>
			<RFALSE>
		)
	>

	<REPEAT ()
		<COND
			(<EQUAL? .R-PTR ,K-E-RSIZE>
				<RETURN .R-CNT>
			)
		>
		<SET RTN <GET ,GL-E-ROUT .R-PTR>>
		<SET MOV <GET ,GL-E-MOVS .R-PTR>>
		<COND
		   (<ZERO? .RTN>
				T
			)
			(<EQUAL? .MOV ,GL-MOVES-CUR>
				<PUT ,GL-E-ROUT .R-PTR 0>
				<PUT ,GL-E-MOVS .R-PTR 0>

				<SETG GL-EVENT-EXEC T>
				<APPLY .RTN>
				<SETG GL-EVENT-EXEC <>>

				<INC R-CNT>
			)	
		>
		<INC R-PTR>
	>
>

;*****************************************************************************
; "end of file"
;*****************************************************************************

