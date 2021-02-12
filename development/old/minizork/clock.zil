
<CONSTANT C-TABLELEN 180>

<GLOBAL C-TABLE <ITABLE NONE 90>>

<GLOBAL C-INTS 90>

<CONSTANT C-INTLEN 6>

<CONSTANT C-ENABLED? 0>

<CONSTANT C-TICK 1>

<CONSTANT C-RTN 2>

<ROUTINE QUEUE (RTN TICK "AUX" CINT)
	 #DECL ((RTN) ATOM (TICK) FIX (CINT) <PRIMTYPE VECTOR>)
	 <PUT <SET CINT <INT .RTN>> ,C-TICK .TICK>
	 .CINT>

<ROUTINE INT (RTN "AUX" E C INT)
	 #DECL ((RTN) ATOM (E C INT) <PRIMTYPE VECTOR>)
	 <SET E <REST ,C-TABLE ,C-TABLELEN>>
	 <SET C <REST ,C-TABLE ,C-INTS>>
	 <REPEAT ()
		 <COND (<==? .C .E>
			<SETG C-INTS <- ,C-INTS ,C-INTLEN>>
			<SET INT <REST ,C-TABLE ,C-INTS>>
			<PUT .INT ,C-RTN .RTN>
			<RETURN .INT>)
		       (<==? <GET .C ,C-RTN> .RTN> <RETURN .C>)>
		 <SET C <REST .C ,C-INTLEN>>>>

<GLOBAL CLOCK-WAIT <>>

<ROUTINE CLOCKER ("AUX" C E TICK (FLG <>))
	 #DECL ((C E) <PRIMTYPE VECTOR> (TICK) FIX (FLG) <OR FALSE ATOM>)
	 <COND (,CLOCK-WAIT <SETG CLOCK-WAIT <>> <RFALSE>)>
	 <SET C <REST ,C-TABLE ,C-INTS>>
	 <SET E <REST ,C-TABLE ,C-TABLELEN>>
	 <REPEAT ()
		 <COND (<==? .C .E> <RETURN .FLG>)
		       (<NOT <0? <GET .C ,C-ENABLED?>>>
			<SET TICK <GET .C ,C-TICK>>
			<COND (<0? .TICK>)
			      (T
			       <PUT .C ,C-TICK <- .TICK 1>>
			       <COND (<NOT <G? .TICK 1>>
				      <SET FLG T>
				      <APPLY <GET .C ,C-RTN>>)>)>)>
		 <SET C <REST .C ,C-INTLEN>>>>
