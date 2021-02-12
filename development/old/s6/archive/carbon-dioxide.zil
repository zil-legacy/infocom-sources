;<OBJECT BOTTLE
	(IN TRADING-POST)
	(DESC "bottle")
	(DESCFCN BOTTLE-F)
	(SYNONYM BOTTLE DIOXIDE LABEL)
	(ADJECTIVE BOTTLE CARBON ICE LIQUID GAS)
	(FLAGS TAKEBIT CONTBIT TRANSBIT READBIT SEARCHBIT)
	(CAPACITY 10)
	(PLATO-ASK-ABOUT
"Carbon dioxide! Don't use it myself. The only form I've ever seen it
in is dry ice.")
	(ACTION BOTTLE-F)>

;<GLOBAL FROZEN-LEVEL 0>

;<GLOBAL CARBON-DIOXIDE-GONE <>>

;<ROUTINE BOTTLE-F ("OPTIONAL" (OARG <>))
	 <COND (.OARG
		<COND (<NOT <FSET? ,BOTTLE ,TOUCHBIT>>
		       <COND (<EQUAL? .OARG ,M-OBJDESC?>
			      <RTRUE>)>
		       <TELL
"   One of the wares for sale is a sealed bottle with a
rather plain-looking label.">)
		      (<G? ,FROZEN-LEVEL 4>
		       <COND (<EQUAL? .OARG ,M-OBJDESC?>
			      <RTRUE>)>
		       <TELL "   There is a transparent bottle here. ">
		       <DESCRIBE-BOTTLE>)
		      (T
		       <RFALSE>)>)
	       (<VERB? EXAMINE>
		<COND (<NOUN-USED ,W?LABEL ,BOTTLE>
		       <PERFORM ,V?READ ,BOTTLE>
		       <RTRUE>)>
		<TELL "The bottle is transparent and has a label.">
		<COND (<G? ,FROZEN-LEVEL 4>
		       <TELL " ">
		       <DESCRIBE-BOTTLE>)>
		<COND (<IN? ,EXPLOSIVE ,BOTTLE>
		       <TELL " There's an explosive within the ">
		       <COND (<G? ,FROZEN-LEVEL 10>
			      <TELL "ice">)
			     (<G? ,FROZEN-LEVEL 4>
			      <TELL "liquid">)
			     (T
			      <TELL "bottle">)>
		       <TELL ".">)>
		<CRLF>)
	       (<AND <VERB? LOOK-INSIDE>
		     <G? ,FROZEN-LEVEL 4>>
		<PERFORM ,V?EXAMINE ,BOTTLE>
		<RTRUE>)
	       (<AND <VERB? POUR>
		     <PRSO? ,BOTTLE>
		     <G? ,FROZEN-LEVEL 4>
		     <L? ,FROZEN-LEVEL 11>>
		<COND (<FSET? ,BOTTLE ,OPENBIT>
		       <SETG CARBON-DIOXIDE-GONE T>
		       <SETG FROZEN-LEVEL 0>
		       <DEQUEUE I-MELT-CARBON-DIOXIDE>
		       <TELL "The liquid instantly evaporates." CR>)
		      (T
		       <DO-FIRST "open the bottle">)>)
	       (<VERB? READ>
		<TELL
"\"PLANTS-LUV-IT (tm) Carbon Dioxide|
Two liters, guaranteed 99.7% pure\"" CR>)
	       (<AND <VERB? PUT>
		     <PRSI? ,BOTTLE>
		     <FSET? ,BOTTLE ,OPENBIT>>
		<COND (<NOT <PRSO? ,EXPLOSIVE>>
		       <TELL "The bottle's mouth is too narrow for" TR ,PRSO>)
		      (<G? ,FROZEN-LEVEL 10>
		       <TELL "You can't; the bottle is filled with ice." CR>)>)
	       (<AND <VERB? OPEN>
		     <NOT <FSET? ,BOTTLE ,OPENBIT>>
		     <NOT ,CARBON-DIOXIDE-GONE>
		     <L? ,FROZEN-LEVEL 5>>
		<SETG CARBON-DIOXIDE-GONE T>
		<FSET ,BOTTLE ,OPENBIT>
		<FSET ,BOTTLE ,TOUCHBIT>
		<DEQUEUE I-FREEZE-CARBON-DIOXIDE>
		<SETG FROZEN-LEVEL 0>
		<TELL "You ">
		<COND (<IN-VACUUM?>
		       <TELL "see">)
		      (T
		       <TELL "feel">)>
		<TELL " a puff of gas from the bottle as you open it.">
		<COND (<EQUAL? ,HERE ,DOME>
		       <TELL
" The nearby plants rustle happily; or perhaps it was just a draft
from the ventilation system." CR>)>
		<CRLF>)>>

;<ROUTINE DESCRIBE-BOTTLE ()
	 <TELL "The bottle is mostly filled with some kind of ">
	 <COND (<G? ,FROZEN-LEVEL 10>
		<TELL "ice.">)
	       (T
		<TELL "liquid.">)>>

;<ROUTINE I-FREEZE-CARBON-DIOXIDE ()
	 <SETG FROZEN-LEVEL <+ ,FROZEN-LEVEL 1>>
	 <COND (,DEBUG
		<TELL "[Carbon Diox FROZEN-LEVEL = " N ,FROZEN-LEVEL ".]" CR>)>
	 <COND (<AND <IN? ,EXPLOSIVE ,BOTTLE>
		     <EQUAL? ,FROZEN-LEVEL 11>>
		<FSET ,EXPLOSIVE ,TRYTAKEBIT>)>
	 <COND (<OR <NOT <VISIBLE? ,BOTTLE>>
		    <NOT ,LIT>>
		<RFALSE>)>
	 <COND (<EQUAL? ,FROZEN-LEVEL 5>
		<TELL
"   The gas in the bottle suddenly liquifies, leaving the bottle mostly
full of a sloshy fluid." CR>)
	       (<EQUAL? ,FROZEN-LEVEL 11>
		<TELL
"   The liquid suddenly crystalizes into a solid hunk of carbon dioxide ice, ">
		<COND (<IN? ,EXPLOSIVE ,BOTTLE>
		       <TELL "surrounding the explosive and ">)>
		<TELL "occupying a good portion of the bottle." CR>)>>

;<ROUTINE I-MELT-CARBON-DIOXIDE ()
	 <SETG FROZEN-LEVEL <- ,FROZEN-LEVEL 1>>
	 <COND (,DEBUG
		<TELL "[Carbon Diox FROZEN-LEVEL = " N ,FROZEN-LEVEL ".]" CR>)>
	 <COND (<EQUAL? ,FROZEN-LEVEL 4>
		<SETG FROZEN-LEVEL 0>
		<DEQUEUE I-MELT-CARBON-DIOXIDE>
		<COND (<FSET? ,BOTTLE ,OPENBIT>
		       <SETG CARBON-DIOXIDE-GONE T>)>
		<COND (<IN? ,EXPLOSIVE ,BOTTLE>
		       <QUEUE I-EXPLOSIVE-MELT 100>)>
		<COND (<VISIBLE? ,BOTTLE>
		       <TELL
"   The liquid carbon dioxide boils, and the resulting puff of steam quickly ">
		       <COND (<FSET? ,BOTTLE ,OPENBIT>
			      <TELL "dissipates into the air">)
			     (T
			      <TELL "becomes clear within the bottle">)>
		       <TELL ,PERIOD-CR>)>)
	       (<EQUAL? ,FROZEN-LEVEL 10>
		<COND (<IN? ,EXPLOSIVE ,BOTTLE>
		       <FCLEAR ,EXPLOSIVE ,TRYTAKEBIT>)>
		<COND (<VISIBLE? ,BOTTLE>
		       <TELL
"   The dry ice in the bottle has melted, leaving you with a bottle full of
liquid carbon dioxide." CR>)>)>>