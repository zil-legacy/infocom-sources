;*****************************************************************************
; "file : GO.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   19 Oct 1987 23:13:06  $"
; "revs : $Revision:   1.9  $"
; "vers : 1.00"
;*****************************************************************************

;******************************************************************************
; "directions"
;******************************************************************************

<DIRECTIONS NORTH NE EAST SE SOUTH SW WEST NW UP DOWN IN OUT>

;-----------------------------------------------------------------------------
; "game configuration constants"
;-----------------------------------------------------------------------------

<CONSTANT K-STAT-S-POS   11>				; "offset from right for stat score"
<CONSTANT K-STAT-M-POS   25>				; "offset from right for stat moves"
<CONSTANT K-STAT-T-POS   40>				; "offset from right for stat time"

<CONSTANT K-SUNRISE 630>					; "6:30am for <RT-TIME>"
<CONSTANT K-DAYTIME 700>					; "7:00am for <RT-TIME>"
<CONSTANT K-SUNSET 1930>					; "7:30pm for <RT-TIME>"
<CONSTANT K-NIGHT  2000>					; "8:00pm for <RT-TIME>"

;-----------------------------------------------------------------------------
; "GO"
;-----------------------------------------------------------------------------

<ROUTINE GO ()
	<SETG GL-CLOCK-DSP  T >
	<SETG GL-CLOCK-FMT  0 >

	<SETG GL-MOVES-DSP <> >

	<SETG GL-SCORE-DSP  T >
	<SETG GL-SCORE-MSG  T >
	<SETG GL-SCORE-MAX 100>

   <SETG GL-PLACE-CUR ,RM-221B-BAKER-ST>

	<RT-CLOCK-INC-SET 0 1 0>				; "hrs min sec"
	<RT-CLOCK-DEF-SET 0 1 0>				; "hrs min sec"

	<RT-CLOCK-SET 5 0 0 1887 6 18 6>		; "hrs min sec yrs mon day dow"

	<RT-ALARM-SET-ABS ,RT-I-BIGBEN <RT-PARM-SET 6 0 0 1887 6 18 6>>

	<RT-ALARM-SET-ABS ,RT-I-SUN-UP-DOWN-MSG <RT-PARM-SET 6 30 0 1887 6 18 6>>

	<RT-ALARM-SET-ABS ,RT-I-PM-QUITS <RT-PARM-SET 6 30 0 1887 6 18 6>>

	<RT-ALARM-SET-ABS ,RT-I-OPEN-WESTMINSTER-DOOR    <RT-PARM-SET  7  0 0 1887 6 18 6>>
	<RT-ALARM-SET-ABS ,RT-I-WESTMINSTER-LIGHTS-ON    <RT-PARM-SET  6 55 0 1887 6 18 6>>
	<RT-ALARM-SET-ABS ,RT-I-FLASH-WESTMINSTER-LIGHTS <RT-PARM-SET 17 50 0 1887 6 18 6>>
	<RT-ALARM-SET-ABS ,RT-I-WESTMINSTER-LIGHTS-OFF   <RT-PARM-SET 18  5 0 1887 6 18 6>>
	<RT-ALARM-SET-ABS ,RT-I-WESTMINSTER-LIGHTS-ON    <RT-PARM-SET  6 55 0 1887 6 19 0>>
	<RT-ALARM-SET-ABS ,RT-I-FLASH-WESTMINSTER-LIGHTS <RT-PARM-SET 17 50 0 1887 6 19 0>>
	<RT-ALARM-SET-ABS ,RT-I-LOCKED-IN-END-GAME       <RT-PARM-SET 18  1 0 1887 6 19 0>>

	<RT-ALARM-SET-ABS ,RT-I-OPEN-MUSEUM-DOOR <RT-PARM-SET 8 0 0 1887 6 18 6>>

	<RT-ALARM-SET-ABS ,RT-I-OUT-OF-TIME <RT-PARM-SET 9 0 0 1887 6 20 1>>

;-----------------------------------------------------------------------------
; "the following will normally not have to changed from game to game"
;-----------------------------------------------------------------------------

	<SETG GL-SCORE-CUR   0>
	<SETG GL-MOVES-CUR   0>

	<SETG GL-SCORE-STS  -1>
	<SETG GL-MOVES-STS  -1>
   <SETG GL-PLACE-STS  -1>

   <SETG GL-PLACE-PRV  -1>

	<SETG GL-NOW-LIT? <RT-IS-LIT?>>

   <SETG GL-WINNER ,CH-PLAYER>

   <SETG GL-ALLSCREEN <GETB 0 33>>
   <SETG GL-MIDSCREEN </ ,GL-ALLSCREEN 2>>
	<SETG GL-SPLIT-ROW 1>

   <MOVE ,CH-PLAYER ,GL-PLACE-CUR>

   <CLEAR -1>

	<CRLF>
	<RT-GAMETITLE-MSG>
	<CRLF>
	<RT-COPYRIGHT-MSG>
	<CRLF>
   <RT-TRADEMARK-MSG>
	<CRLF>
	<RT-GET-ANY-KEY>

   <RT-INIT-SCREEN>
	<RT-UPDATE-STATUS-LINE>
   <RT-DESC-ALL>

;	<PUTB ,GL-INSAVE-A 0 0>
;	<PUTB ,GL-INSAVE-B 0 0>
;	<PUTB ,GL-INSAVE-C 0 0>

   <RT-P-CLEAR>
	<RT-DO-MAIN-LOOP>
	<AGAIN>
>

;*****************************************************************************
; "end of file"
;*****************************************************************************

