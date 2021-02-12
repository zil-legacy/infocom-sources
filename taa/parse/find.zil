<ZZSECTION "FIND">

<INCLUDE "BASEDEFS" "PARSERDEFS" "PARSER-BITDEFS">

<USE "PARSER">

<USE "PMEM">

<USE "NEWSTRUC">

<FILE-FLAGS MDL-ZIL? CLEAN-STACK?>

<PUT-DECL BOOLEAN '<OR ATOM FALSE>>

<MSETG FD-INCLUDE? 1>
<MSETG FD-SEARCH? 2>
<MSETG FD-NEST? 4>
<MSETG FD-NOTOP? 8>
<DEFMAC FD-FLAG (WHICH 'VAL "OPT" 'NEW)
  <COND (<ASSIGNED? NEW>
	 <COND (<OR <TYPE? .NEW ATOM FALSE>
		    <AND <TYPE? .NEW FORM>
			 <EMPTY? .NEW>>>
		<COND (<TYPE? .NEW ATOM>
		       ; "Just turning flag on"
		       <FORM ORB ,.WHICH .VAL>)
		      (T
		       <FORM ANDB .VAL <XORB ,.WHICH -1>>)>)
	       (<TYPE? .VAL FIX LVAL GVAL>
		<FORM COND
		      (.NEW
		       <FORM ORB .VAL ,.WHICH>)
		      (T
		       <FORM ANDB .VAL <XORB ,.WHICH -1>>)>)
	       (T
		<FORM BIND ((FLAG .VAL))
		  <FORM COND
			(.NEW
			 <FORM ORB ,.WHICH '.FLAG>)
			(T
			 <FORM ANDB '.FLAG <XORB ,.WHICH -1>>)>>)>)
	(T
	 <FORM NOT <FORM 0? <FORM ANDB .VAL ,.WHICH>>>)>>

<MSETG FIND-FLAGS-GWIM 1>
<DEFMAC FIND-GWIM? ('F)
  <FORM NOT <FORM 0? <FORM ANDB <FORM FIND-FLAGS .F> ,FIND-FLAGS-GWIM>>>>

<DEFMAC FIND-COUNT ('F)
  <FORM FIND-RES-COUNT <FORM FIND-RES .F>>>

"FIND-DESCENDANTS, MATCH-OBJECT, and ADD-OBJECT all return false when the
 search should be stopped prematurely because some object was an exact
 match.  If there's a big red book and a big ugly red book, big red book
 will get the former, since it's the only way to do so."
<DEFINE FIND-DESCENDANTS FD (PARENT:OBJECT FLAGS:FIX ; "INCLUDE, SEARCH, NEST,
						     NOTOP"
			  "AUX" (F <FINDER>) FOBJ:<OR FALSE OBJECT>)
  <COND (<SET FOBJ <FIRST? .PARENT>>
	 ; "This guy contains something"
	 <REPEAT ()
	   ; "See if the current object matches; if so, add it to the list"
	   <COND
	    (<VISIBLE? .FOBJ>
	     <COND (<AND <NOT <FD-FLAG FD-NOTOP? .FLAGS>>
			 <NOT <MATCH-OBJECT .FOBJ .F <FD-FLAG FD-INCLUDE?
							      .FLAGS>>>>
		    <RETURN <> .FD>)>
	     <COND (<AND <FD-FLAG FD-NEST? .FLAGS>
			 <N==? .FOBJ ,WINNER>
			 <OR <AND <FSET? .FOBJ ,SEARCHBIT>
				  <OR <FSET? .FOBJ ,OPENBIT>
				      <FSET? .FOBJ ,TRANSBIT>>>
			     <FSET? .FOBJ ,SURFACEBIT>>>
		    ; "Check its contents"
		    <COND (<NOT <FIND-DESCENDANTS .FOBJ
						  <FD-FLAG FD-INCLUDE?
							   ,FD-NEST?
							   <FD-FLAG FD-INCLUDE?
								    .FLAGS>>>>
			   <RETURN <> .FD>)>)>)>
	   ; "Check next sibling"
	   <COND (<NOT <SET FOBJ <NEXT? .FOBJ>>>
		  <RETURN T .FD>)>>)
	(T)>>

<DEFINE EXCLUDED? EX (FOBJ:OBJECT F:FINDER
			  "AUX" (EXC:<OR FALSE PMEM> <FIND-EXCEPTIONS .F>))
  <COND (<NOT .EXC> <>)
	(T
	 <REPEAT ((PHRASE:PMEM <NPP-NOUN-PHRASE .EXC>)
		  (CT:FIX <NOUN-PHRASE-COUNT .PHRASE>)
		  (VEC <REST-TO-SLOT .PHRASE NOUN-PHRASE-OBJ1>) VV)
	   <REPEAT ()
	       <COND (<0? .CT>
		      <SET VV <>>
		      <RETURN>)>
	       <COND (<==? .FOBJ <ZGET .VEC 0>>
		      <SET VV T>
		      <RETURN>)>
	       <SET VEC <ZREST .VEC 2>>
	       <SET CT <- .CT 1>>>
	   <COND
	    (.VV
	     <RETURN T .EX>)
	    (<SET EXC <NPP-NEXT .EXC>>
	     <SET PHRASE <NPP-NOUN-PHRASE .EXC>>
	     <SET CT <NOUN-PHRASE-COUNT .PHRASE>>
	     <SET VEC <REST-TO-SLOT .PHRASE NOUN-PHRASE-OBJ1>>)
	    (T
	     <RETURN <> .EX>)>>)>>

<DEFINE MATCH-OBJECT (FOBJ:OBJECT F:FINDER INCLUDE?:BOOLEAN
		      "AUX" NOUN ADJS APP TB)
  <COND (<AND <VISIBLE? .FOBJ>
	      <OR <NOT <SET NOUN <FIND-NOUN .F>>>
		  <ZMEMQ .NOUN <SET TB <GETPT .FOBJ ,P?SYNONYM>>
			 </ <PTSIZE .TB>:FIX 2>>>
	      <OR <NOT <SET ADJS <FIND-ADJS .F>>>
		  <CHECK-ADJS .FOBJ .ADJS>>
	      <NOT <EXCLUDED? .FOBJ .F>>>
	 ; "This object matches the words used..."
	 <COND (<NOT .INCLUDE?>
		<FOUND-IN-WRONG-PLACE <+ <FOUND-IN-WRONG-PLACE> 1>>)
	       (<AND <T? <SET APP <FIND-APPLIC .F>>>
		     <NOT <FIND-GWIM? .F>>>
		; "We're not GWIMming, so apply the test only if there's an
		   ambiguity"
		<COND (<OR <0? <FIND-COUNT .F>>
			   <FIND-QUANT .F>>
		       ; "Don't have anything yet"
		       <ADD-OBJECT .FOBJ .F>)
		      (<TEST-OBJECT .FOBJ .APP .F>
		       ; "We already have something, so first find out if
			  this one's OK"
		       <COND (<1? <FIND-COUNT .F>>
			      ; "There's only one other object"
			      <COND (<TEST-OBJECT <FIND-RES-OBJ1 <FIND-RES .F>>
						  .APP .F>
				     ; "The other object also matches, so
					we're stuck"
				     <ADD-OBJECT .FOBJ .F>)
				    (T
				     ; "The other object doesn't, so just
					replace it"
				     <FIND-RES-OBJ1 <FIND-RES .F> .FOBJ>)>)
			     (T
			      ; "We already have more than one object, so
				 we're losing"
			      <ADD-OBJECT .FOBJ .F>)>)>)
	       (<F? .APP>
		; "No test, so just do it"
		<ADD-OBJECT .FOBJ .F>)
	       (<TEST-OBJECT .FOBJ .APP .F>
		<ADD-OBJECT .FOBJ .F>)
	       (T)>)
	(T)>>

<DEFINE TEST-OBJECT TO (FOBJ:OBJECT APP:<OR FIX TABLE> F:FINDER)
  <COND (<NOT <TABLE? .APP>>
	 <COND (<NOT <0? <ANDB .APP ,SYN-FIND-NEGATE>>>
		<NOT <FSET? .FOBJ <ANDB .APP *77*>>>)
	       (T
		<FSET? .FOBJ .APP>)>)
	(T
	 <REPEAT ((N:FIX <ZGET .APP 0>) NN)
	   <COND (<NOT <0? <ANDB <SET NN <ZGET .APP .N>> ,SYN-FIND-NEGATE>>>
		  <COND (<NOT <FSET? .FOBJ <ANDB .NN *77*>>>
			 <RETURN T .TO>)>)
		 (<FSET? .FOBJ .NN>
		  <RETURN T .TO>)>
	   <COND (<0? <SET N <- .N 1>>> <RETURN <> .TO>)>>)>>

; "Object matches all other tests.  Here do checks with quantities
   (all, one, etc.), then add if OK."
<DEFINE ADD-OBJECT (OBJ:OBJECT F:FINDER "AUX" (VEC <FIND-RES .F>) NC
		    (DOIT? T) (SYN <FIND-SYNTAX .F>) (WHICH <FIND-WHICH .F>))
  <COND (<AND <NOT <FIND-QUANT .F>>
	      .SYN
	      <==? <FIND-RES-COUNT .VEC>:FIX 1>>
	 <COND (<MULTIPLE-EXCEPTION? .OBJ .SYN .WHICH>
		<SET DOIT? <>>)
	       (<MULTIPLE-EXCEPTION? <FIND-RES-OBJ1 .VEC> .SYN .WHICH>
		<FIND-RES-OBJ1 .VEC .OBJ>
		<SET DOIT? <>>)>)>
  <COND (<AND .DOIT?
	      <OR <NOT <FIND-QUANT .F>>
		  <NOT <FIND-SYNTAX .F>>
		  <NOT <MULTIPLE-EXCEPTION? .OBJ
					    <FIND-SYNTAX .F>
					    <FIND-WHICH .F>>>>>
	 <FIND-RES-COUNT .VEC <SET NC <+ <FIND-RES-COUNT .VEC>:FIX 1>>>
	 <COND (<L=? .NC <FIND-RES-SIZE .VEC>>
		<ZPUT <REST-TO-SLOT .VEC FIND-RES-OBJ1>
		      <- .NC 1>
		      .OBJ>)>
	 <N==? <FIND-QUANT .F> ,NP-QUANT-A>)
	(T)>>

"MULTIPLE-EXCEPTION? -- return true if an object found by all should not
be include when the crunch comes."

<DEFINE MULTIPLE-EXCEPTION? (OBJ:OBJECT SYNTAX:VERB-SYNTAX WHICH:FIX
			     "AUX" (L <LOC .OBJ>) (VB <SYNTAX-ID .SYNTAX>))
	 <COND (<EQUAL? .OBJ ,NOT-HERE-OBJECT>
		<P-NOT-HERE <+ <P-NOT-HERE> 1>>
		T)
	       (<NOT <ACCESSIBLE? .OBJ>>
		;"can't get at object"
		T)
	       (<AND <==? .VB ,V?TAKE>
		     <OR <AND <NOT <EQUAL? .L ,WINNER ,HERE>>
			      <NOT <EQUAL? .L <LOC ,WINNER>>>
			      <NOT <FSET? .L ,SURFACEBIT>>
			      <NOT <FSET? .L ,SEARCHBIT>>>
			 <AND <NOT <FSET? .OBJ ,TAKEBIT>>
			      <NOT <FSET? .OBJ ,TRYTAKEBIT>>>>>
		       ;"TAKE ALL and object not accessible or takeable"
		       T)
		      (<AND <==? .VB ,V?DROP>
			    <NOT <IN? .OBJ ,WINNER>>>
		       ;"DROP ALL and object not held"
		       T)
		      ;(<AND ,PRSI
			    <==? ,PRSO ,PRSI>>
		       ;"VERB ALL and prso = prsi"
		       <RTRUE>)
		      ;(<AND <==? .VB ,V?PUT>
			    <NOT <IN? .OBJ ,WINNER>>
			    <HELD? ,PRSO ,PRSI>>
		       ;"PUT ALL IN X and object already in x"
		       <RTRUE>)>>

<DEFINE CHECK-ADJS CA (OBJ:OBJECT ADJS:PMEM
		    "AUX" TB (AV <REST-TO-SLOT .ADJS ADJ*-COUNT 1>))
  <REPEAT ((CT <ADJ*-COUNT .ADJS>) ADJ FL ID
	   (OADJS <GETPT .OBJ ,P?ADJECTIVE>) (OADJCT:FIX <PTSIZE .OADJS>))
    <VERSION?
     (ZIP
      <COND (<0? <SET ID <WORD-ADJ-ID <SET ADJ <ZGET .AV <- .CT 1>>>>>>
	     <COND (<NOT <IF-MUDDLE <COND (<GASSIGNED? SPECIAL-ADJ-CHECK>
					   <SPECIAL-ADJ-CHECK .ADJ .OBJ>)>
				    <SPECIAL-ADJ-CHECK .ADJ .OBJ>>>
		    <RETURN <> .CA>)>)>)
     (T
      <SET ID <ZGET .AV <- .CT 1>>>)>
    <COND (<VERSION? (ZIP <ZMEMQB .ID .OADJS .OADJCT>)
		     (T <ZMEMQ .ID .OADJS .OADJCT>)>)
	  (<NOT <0? <ANDB <SET FL <WORD-FLAGS .ADJ>> <ORB ,PERSON-PNF
							  ,THING-PNF>>>>
	   ; "This is something like his, hers,..."
	   ;<COND (<COND (<NOT <0? <ANDB .FL ,FIRST-PERSON-SINGULAR>>>
			 ; "Mine"
			 <IN? .OBJ ,WINNER>)
			(<NOT <0? <ANDB .FL ,THIRD-PERSON-SINGULAR>>>
			 ; "Somewhat bogus, but you get the idea..."
			 <OR <AND ,THING-PN
				  <NOT <0? <ANDB .FL ,THING-PNF>>>
				  <IN? <1 <NP-OBJECTS ,THING-PN>> .OBJ>>
			     <AND ,PERSON-PN
				  <NOT <0? <ANDB .FL ,PERSON-PNF>>>
				  <IN? <1 <NP-OBJECTS ,PERSON-PN>> .OBJ>>>)>)
		 (T
		  <RETURN <> .CA>)>)
	  (<NOT <0? <ANDB .FL ,POSSESSIVE>>>
	   <COND (<AND <LOC .OBJ>
		       <ZMEMQ .ADJ
			      <SET TB <GETPT <LOC .OBJ> ,P?SYNONYM>>
			      </ <PTSIZE .TB>:FIX 2>>>)
		 (T
		  <RETURN <> .CA>)>)
	  (<VERSION? (ZIP <>)
		     (T
		      <IF-MUDDLE <AND <GASSIGNED? SPECIAL-ADJ-CHECK>
				      <SPECIAL-ADJ-CHECK .ADJ .OBJ>>
				 <SPECIAL-ADJ-CHECK .ADJ .OBJ>>)>)
	  (T
	   <RETURN <> .CA>)>
    <COND (<0? <SET CT <- .CT 1>>> <RETURN T .CA>)>>>

<DEFINE FIND-OBJECTS (SEARCH:FIX "OPT" (PARENT:<OR OBJECT FALSE> <>)
		      "AUX" (F <FINDER>) GLBS (CONT? T)
			    (RES <FIND-RES .F>))
  <FOUND-IN-WRONG-PLACE 0>
  <MAKE-FIND-RES 'FIND-RES .RES 'FIND-RES-COUNT 0>
  ; "Initialize world"
  <COND (.PARENT
	 ; "In case we have `the foo in the bar'"
	 <SET CONT? <>>
	 <FIND-DESCENDANTS .PARENT <ORB ,FD-INCLUDE? ,FD-SEARCH? ,FD-NEST?>>)
	(T
	 <PROG ((LOSING? <>))
	   <COND
	    (<OR <AND <NOT .LOSING?>
		      <NOT <0? <ANDB .SEARCH ,SEARCH-CARRIED>>>>
		 .LOSING?>
	     <SET CONT? <FIND-DESCENDANTS ,WINNER
					  <FD-FLAG FD-NOTOP?
					   <FD-FLAG FD-INCLUDE?
					    <FD-FLAG FD-NEST?
						     ,FD-SEARCH?
						     <OR
						      .LOSING?
						      <NOT
						       <0?
							<ANDB
							 .SEARCH
							 ,SEARCH-POCKETS>>>>>
					    <OR
					     .LOSING?
					     <NOT
					      <0? <ANDB .SEARCH
							,SEARCH-CARRIED>>>>>
					   <AND <NOT .LOSING?>
					       <0? <ANDB .SEARCH
							,SEARCH-HELD>>>>>>)>
	   <COND
	    (<OR .LOSING?
		 <NOT <0? <ANDB .SEARCH ,SEARCH-IN-ROOM>>>>
	     <SET CONT?
		  <FIND-DESCENDANTS ,HERE
				    <FD-FLAG FD-NOTOP?
				     <FD-FLAG FD-NEST?
				      <FD-FLAG FD-INCLUDE? ,FD-SEARCH?
				       <AND ,LIT
					    <OR .LOSING?
						<NOT <0? <ANDB
							  .SEARCH
							  ,SEARCH-IN-ROOM>>>>>>
				      <OR .LOSING?
					  <NOT
					   <0? <ANDB .SEARCH
						     ,SEARCH-OFF-GROUND>>>>>
				     <AND <NOT .LOSING?>
					  <0? <ANDB
					       .SEARCH
					       ,SEARCH-ON-GROUND>>>>>>)>
	   <COND (<AND <NOT .LOSING?>
		       <0? <FIND-RES-COUNT .RES>>>
		  ; "Chomping, try again..."
		  <SET LOSING? T>
		  <AGAIN>)>
	   <COND (<NOT .LOSING?>
		  <RETURN>)>
	   <COND (<SET GLBS <GETPT ,HERE ,P?GLOBAL>>
		  <REPEAT ((N:FIX <PTSIZE .GLBS>) O:OBJECT)
		    <COND (<0? .N> <RETURN>)>
		    <COND (<NOT <SET CONT?
				     <MATCH-OBJECT
				      <SET O <GETB .GLBS
						   <SET N <- .N 1>>>>
				      .F T>>>
			   <RETURN>)>
		    <COND (<NOT <0? <ANDB .SEARCH ,SEARCH-OFF-GROUND>>>
			   <COND
			    (<NOT
			      <SET CONT?
				   <FIND-DESCENDANTS .O ,FD-INCLUDE?>>>
			     <RETURN>)>)>>)>
	   <COND (<AND .CONT? <SET GLBS <GETP ,HERE ,P?THINGS>>>
		  ; "Here handle pseudos")>
	   <COND (.CONT?
		  <FIND-DESCENDANTS ,GLOBAL-OBJECTS
				    <FD-FLAG FD-NEST? ,FD-INCLUDE?
					     <NOT
					      <0? <ANDB
						   .SEARCH
						   ,SEARCH-OFF-GROUND>>>>>)>>)>
  <1? <FIND-RES-COUNT .RES>:FIX>>

<DEFINE LIT? ("OPT" (RM <>) (RMBIT T) "AUX" OHERE (LIT <>)
	      (RES <SEARCH-RES>))
	<COND (<NOT .RM> <SET RM ,HERE>)>
	<SET OHERE ,HERE>
	<SETG HERE .RM>
	<COND (<AND .RMBIT
		    <FSET? .RM ,ONBIT>>
	       <SET LIT ,HERE>)
	      (<AND <FSET? ,WINNER ,ONBIT>
		    <HELD? ,WINNER .RM>>
	       <SET LIT ,WINNER>)
	      (T
	       <MAKE-FIND-RES 'FIND-RES .RES 'FIND-RES-COUNT 0>
	       <MAKE-FINDER 'FINDER <FINDER> 'FIND-APPLIC ,ONBIT
			    'FIND-RES .RES
			    'FIND-FLAGS ,FIND-FLAGS-GWIM>
	       <COND (<EQUAL? .OHERE .RM>
		      <FIND-DESCENDANTS ,WINNER
					%<ORB ,FD-INCLUDE? ,FD-SEARCH?
					      ,FD-NEST? ,FD-NOTOP?>>
		      <COND (<AND <NOT <EQUAL? ,WINNER ,PLAYER>>
				  <IN? ,PLAYER .RM>>
			     <FIND-DESCENDANTS ,PLAYER
					       %<ORB ,FD-INCLUDE? ,FD-SEARCH?
						     ,FD-NEST? ,FD-NOTOP?>>)>)>
	       <COND (<0? <FIND-RES-COUNT .RES>:FIX>
		      <COND (<AND <FSET? <LOC ,WINNER> ,VEHBIT>
				  <NOT <FSET? <LOC ,WINNER> ,OPENBIT>>>
			     <FIND-DESCENDANTS <LOC ,WINNER>
					       %<ORB ,FD-INCLUDE? ,FD-SEARCH?
						     ,FD-NEST? ,FD-NOTOP?>>)>
		      <FIND-DESCENDANTS .RM %<ORB ,FD-INCLUDE? ,FD-SEARCH?
						  ,FD-NEST? ,FD-NOTOP?>>)>
	       <COND (<G? <FIND-RES-COUNT .RES>:FIX 0>
		      <SET LIT <FIND-RES-OBJ1 .RES>>)>)>
	<SETG HERE .OHERE>
	.LIT>

<END-DEFINITIONS>
