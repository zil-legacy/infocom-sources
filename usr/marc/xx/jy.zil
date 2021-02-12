"JY for
		      		JOURNEY
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

;"Machine version: sets other flags"

<COMPILATION-FLAG MVER YZIP>

<IFFLAG (<==? MVER YZIP55>
	 <COMPILATION-FLAG YFLAG T>
	 <COMPILATION-FLAG 55FLAG T>)
	(<==? MVER YZIP>
	 <COMPILATION-FLAG YFLAG T>
	 <COMPILATION-FLAG 55FLAG <>>)
	(<==? MVER MAC>
	 <COMPILATION-FLAG YFLAG T>
	 <COMPILATION-FLAG 55FLAG <>>)
	(T
	 <COMPILATION-FLAG YFLAG <>>
	 <COMPILATION-FLAG 55FLAG <>>)>

<IFFLAG (YFLAG <VERSION YZIP>)
	(T <VERSION XZIP>)>

<ZIP-OPTIONS COLOR MOUSE DISPLAY>
                                  
<FREQUENT-WORDS?>

<SET REDEFINE!- T>
<SET ZREDEFINE T>

<DIRECTIONS MOVE>

<IFFLAG (55FLAG
	 <CONSTANT INIT-TEXT-LEFT 23>)
	(T
	 <CONSTANT INIT-TEXT-LEFT 32>)>

<IFFLAG (<==? MVER MAC>
	 <CONSTANT COMMAND-START-LINE 20>)
	(T
	 <CONSTANT COMMAND-START-LINE 19>)>

<IFFLAG (55FLAG
	 <CONSTANT COMMAND-WIDTH 11>)
	(T
	 <CONSTANT COMMAND-WIDTH 16>)>

<IFFLAG (55FLAG
	 <CONSTANT NAME-WIDTH 10>)
	(<==? MVER MAC>
	 <CONSTANT NAME-WIDTH 15>)
	(T
	 <CONSTANT NAME-WIDTH 14>)>

<IFFLAG (<==? MVER MAC>
	 <CONSTANT TOP-SCREEN-LINE 1>)
	(T
	 <CONSTANT TOP-SCREEN-LINE 2>)>

;"Differs"
<CONSTANT PARTY-COMMAND-COLUMN 2>
<CONSTANT NAME-COLUMN <+ ,PARTY-COMMAND-COLUMN ,COMMAND-WIDTH>>
<CONSTANT CHR-COMMAND-COLUMN <+ ,NAME-COLUMN ,NAME-WIDTH>>
<CONSTANT COMMAND-OBJECT-COLUMN <+ ,CHR-COMMAND-COLUMN ,COMMAND-WIDTH>>
<CONSTANT SCREEN-WIDTH <+ <+ <* ,COMMAND-WIDTH 4> ,NAME-WIDTH> 1>>

<GLOBAL PARTY-MAX 4>

<PROPDEF KBD <> (KBD X:FIX = 1 <BYTE .X>)>
<PROPDEF TRAVEL-COMMANDS <>
	 (TRAVEL-COMMANDS "MANY" CMD:FCN = <> "MANY" <WORD .CMD>)>
<PROPDEF PROVISION-COMMANDS <>
	 (PROVISION-COMMANDS "MANY" CMD:FCN = <> "MANY" <WORD .CMD>)>
<PROPDEF FIGHT-COMMANDS <>
	 (FIGHT-COMMANDS "MANY" CMD:FCN = <> "MANY" <WORD .CMD>)>
<PROPDEF OPTION-COMMANDS <>
	 (OPTION-COMMANDS "MANY" CMD:FCN = <> "MANY" <WORD .CMD>)>
<PROPDEF CONTROL-COMMANDS <>
	 (CONTROL-COMMANDS "MANY" CMD:FCN = <> "MANY" <WORD .CMD>)>
<PROPDEF MODE-COMMANDS <>
	 (MODE-COMMANDS "MANY" CMD:FCN = <> "MANY" <WORD .CMD>)>
<PROPDEF ATTACK <> (ATTACK "MANY" NUM:FIX = <> "MANY" <BYTE .NUM>)>
<PROPDEF DEFEND <> (DEFEND "MANY" NUM:FIX = <> "MANY" <BYTE .NUM>)>

<DEFMAC IN-PARTY? ('FOO)
	<FORM FSET? .FOO ',IN-PARTY>>

<DEFMAC ACTION? (FOO)
	<FORM EQUAL?
	      ',ACTION
	      <FORM GVAL
		    <PARSE <STRING <SPNAME .FOO> "-COMMAND">>>>>

<DEFMAC OBJECT? (FOO)
	<FORM EQUAL?
	      ',ACTION-OBJECT
	      <FORM GVAL .FOO>>>

<DEFMAC SET-TEMP ('FOO) <FORM PUTP ',HERE ',P?TEMP .FOO>>
<DEFMAC GET-TEMP () '<GETP ,HERE ,P?TEMP>>
<DEFMAC CLEAR-TEMP () '<PUTP ,HERE ,P?TEMP 0>>

;"Common"

<INSERT-FILE "OUTPUT" T>
<INSERT-FILE "INPUT" T>
<INSERT-FILE "INTRO" T>
<INSERT-FILE "COMMANDS" T>
<INSERT-FILE "CONTROLS" T>
<INSERT-FILE "CHARACTERS" T>
<INSERT-FILE "SPELLS" T>
<INSERT-FILE "COMBAT" T>

;"Part I"

<INSERT-FILE "LAVOS" T>
<INSERT-FILE "DWARVES" T>
<INSERT-FILE "TALES" T>
<INSERT-FILE "FOREST" T>
<INSERT-FILE "RIVER" T>
<INSERT-FILE "PRISON" T>
<INSERT-FILE "STAIR" T>
<INSERT-FILE "LAKE" T>
<INSERT-FILE "HERMIT" T>
<INSERT-FILE "ASTRIX" T>
	
;"Part II (a)"

<INSERT-FILE "PART2" T>
<INSERT-FILE "MINES" T>
<INSERT-FILE "FLUME" T>
<INSERT-FILE "TOMB" T>

;"Part II (b)"

<INSERT-FILE "FOG" T>
<INSERT-FILE "TRAP" T>

;"Part III"

<INSERT-FILE "ZAN" T>
<INSERT-FILE "WHARF" T>
<INSERT-FILE "VOYAGE" T>
<INSERT-FILE "ISLAND" T>

;"Hints"

<INSERT-FILE "HINTS" T>

;"Graphics"

<INSERT-FILE "GRAPHICS" T>