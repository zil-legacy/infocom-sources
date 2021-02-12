<DEFINE RED-O-NP ("OPT" N:FIX TYP:FIX "AUX" A NP (PP <>) WD)
 <COND (<EQUAL? .N 3>
	<SET PP <POP-PSTACK ,DATA-STACK>>)>
 <SET NP <POP-PSTACK ,DATA-STACK>>
 <COND (<AND <PMEM-TYPE? .NP NOUN-PHRASE>
	     <EQUAL? <NOUN-PHRASE-OBJ1 .NP> ,INTQUOTE>>
	<SET NP <NOUN-PHRASE-NP1 .NP>>
	<COND (<G=? 0 ,P-OFLAG>	;"was ZERO? but Yabu scene changed it"
	       <SET PP </ <- <NP-LEXBEG .NP> ,P-LEXV> 2>>
	       <MAKE-ROOM-FOR-TOKENS 1 ,G-LEXV .PP>
	       <ZPUT ,G-LEXV .PP ,W?SAY>
	       <COPY-INPUT>
	       <SETG P-OFLAG 0>
	       <THROW ,PARSER-RESULT-AGAIN ,PARSE-SENTENCE-ACTIVATION>)>)>
 <COND (<T? ,P-OFLAG>
	<COND (<AND <ZERO? .PP>
		    <IFFLAG (P-ZORK0
			     <WORD-TYPE? <NP-NAME .NP> ,P-ADJ-CODE>)
			    (T
			     <COMPARE-WORD-TYPES <WCN <NP-NAME .NP>>
						 <GET-CLASSIFICATION ADJ>>)>    
		    ;<ZERO? <NP-LOC .NP>>
		    <ZERO? <NP-QUANT .NP>>
		    <SET A <TEST-SR .NP>>>	;"Try as adjective instead."
	       <PUSH-PSTACK ,DATA-STACK .A>
	       <RED-O-ADJ 1 .TYP>		;"Never returns?"
	       <RFALSE>)>
	<COPYT ,O-LEXV ,G-LEXV ,LEXV-LENGTH-BYTES>
	<COPYT ,O-INBUF ,G-INBUF <+ 1 ,INBUF-LENGTH>>
	<SET N <ABS ,P-OFLAG>>
	<COND (<EQUAL? <SET WD <ZGET ,G-LEXV .N>>
		       ,W?NO.WORD <SET A <NP-NAME .NP>>>
	       ;<PUTB ,G-LEXV ,P-LEXWORDS <- <GETB ,G-LEXV ,P-LEXWORDS> 1>>
	       <INSERT-NP 0 .NP>)
	      (T
	       <PROG ((A1 <>))
		;<COND (<IFFLAG (P-ZORK0
				<WORD-TYPE? .WD ,P-ADJ-CODE>)
			       (T
				<COMPARE-WORD-TYPES <WCN .WD>
						    <GET-CLASSIFICATION ADJ>>)>
		       <SET N <+ .N ,P-LEXELEN>>)>	;"Skip over adjective."
		<COND (<T? .A>
		       <MAKE-ROOM-FOR-TOKENS 1 ,G-LEXV .N>
		       <ZPUT ,G-LEXV .N .A>
		       <SET A <NP-LEXEND .NP>>
		       <INBUF-ADD <LEXV-WORD-LENGTH .A>
				  <LEXV-WORD-OFFSET .A>
				  <+ 3 <* .N 2>>>)>
		<COND (<SET A <NP-ADJS .NP>>
		       <INSERT-ADJS .A>)>
		<COND (<T? .PP>
		       ;<SET PP <NP-LOC .NP>>
		       <MAKE-ROOM-FOR-TOKENS 2 ,G-LEXV <+ .N ,P-LEXELEN>>
		       <ZPUT ,G-LEXV <+ .N ,P-LEXELEN> <LOCATION-PREP .PP>>
		       <SET A <LOCATION-OBJECT .PP>>
		       <COND (<PMEM-TYPE? .A NOUN-PHRASE>
			      <SET A <NOUN-PHRASE-NP1 .A>>)
			     (<PMEM-TYPE? .A NPP>
			      <SET A <NPP-NOUN .A>>)>
		       <ZPUT ,G-LEXV <+ .N <* 2 ,P-LEXELEN>> <NP-NAME .A>>)>
		<COND (<AND <SET A <NP-QUANT .NP>>
			    ;<T? <NP-NAME .NP>>>
		       <PROG ((PTR .N))
			<REPEAT (WD)
			 <COND (<G? 0 <SET PTR <- .PTR ,P-LEXELEN>>>
				<SET PTR <OR .A1 .N>>
				<MAKE-ROOM-FOR-TOKENS 1 ,G-LEXV .PTR>
				<RETURN>)
			       (<OR <EQUAL? <SET WD <ZGET ,G-LEXV .PTR>>
					    ,W?THE>
				    <IFFLAG (P-ZORK0
					     <WORD-TYPE? .WD ,P-QUANT-CODE>)
					    (T
					     <COMPARE-WORD-TYPES
					      <WCN .WD>
					      <GET-CLASSIFICATION QUANT>>)>>
				<RETURN>)
			       (<IFFLAG (P-ZORK0
					 <WORD-TYPE? .WD ,P-ADJ-CODE>)
					(T
					 <COMPARE-WORD-TYPES <WCN .WD>
							     <GET-CLASSIFICATION ADJ>>)>
				
				<SET A1 .PTR>)
			       (T
				<SET PTR <OR .A1 .N>>
				<MAKE-ROOM-FOR-TOKENS 1 ,G-LEXV .PTR>
				<RETURN>)>>
			<ZPUT ,G-LEXV .PTR <GET-QUANTITY-WORD .A>>>)>>)>
	<ZPUT ,OOPS-TABLE ,O-START <ZGET ,OOPS-TABLE ,O-AGAIN>>
	<COPY-INPUT ;T>
	<SETG P-OFLAG 0>
	<THROW ,PARSER-RESULT-AGAIN ,PARSE-SENTENCE-ACTIVATION>)>>