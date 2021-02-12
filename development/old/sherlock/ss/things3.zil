;*****************************************************************************
; "game : SHERLOCK!"
; "file : THINGS3.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   22 Oct 1987 21:55:08  $"
; "rev  : $Revision:   1.56  $"
; "vers : 1.00"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "this file contains:"
; "  descfcn routines for generic objects"
; "  descfcn routines for game    objects"
;-----------------------------------------------------------------------------

;*****************************************************************************
; "generic objects"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-DF-TH-ROOM"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-ROOM ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-ROOM">
		)
		(T
		)
	>
	<COND
		(<MC-ISNOT? ,GL-PLACE-CUR ,FL-INDOORS>
			<TELL "You're not inside a room." CR>
		)
		(T
			<V-LOOK>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-CEILING"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-CEILING ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-CEILING">
		)
		(T
		)
	>
	<COND
		(<EQUAL? ,GL-PLACE-CUR ,RM-HENRY-VII-CHAPEL>
			<TELL ,K-BREATH-TAKING-MSG CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-WATERMARK"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-WATERMARK ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-DF "TH-WATERMARK">
		)
		(T
		)
	>
	<COND
		(<OR	<RT-VISIBLE? ,TH-GREEN-PAPER>
				<RT-VISIBLE? ,TH-WHITE-PAPER>
				<RT-VISIBLE? ,TH-BLUE-PAPER>
				<RT-VISIBLE? ,TH-ORANGE-PAPER>
				<RT-VISIBLE? ,TH-YELLOW-PAPER>
				<RT-VISIBLE? ,TH-BROWN-PAPER>
			>
			<RFALSE>
		)
		(T
			<RT-CYOU-MSG "do" "does">
			<TELL "not see any " D ,TH-WATERMARK "here." CR>
		)
	>
>

;*****************************************************************************
; "game objects"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "RT-DF-TH-GUN"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-GUN ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-GUN">
		)
		(T
		)
	>
	<TELL "The gun is a six-shot revolver." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-KNIFE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-KNIFE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-KNIFE">
		)
		(T
		)
	>
	<TELL "It's a nasty-looking jackknife." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-MAIL"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-TH-MAIL ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-MAIL">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-MAGNIFYING-GLASS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-MAGNIFYING-GLASS ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-MAGNIFYING-GLASS">
		)
		(T
		)
	>
	<TELL "It is of Swiss manufacture, with a precision-ground lens." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-NEWSPAPER"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-TH-NEWSPAPER ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-NEWSPAPER">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-VIOLIN"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-VIOLIN ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-VIOLIN">
		)
		(T
		)
	>
	<TELL "It is a Stradivarius violin of exceptional quality." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-WESTMINSTER-CLUE"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-TH-WESTMINSTER-CLUE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-WESTMINSTER-CLUE">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-TOBACCO"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-TH-TOBACCO ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-TOBACCO">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-PIPE"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-TH-PIPE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-PIPE">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-MATCH"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-TH-MATCH ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-MATCH">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-TORCH"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-TH-TORCH ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-TORCH">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-TELESCOPE"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-TH-TELESCOPE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-TELESCOPE">
		)
		(T
		)
	>
	<TELL
"The telescope looks just like the one Nelson held to his blind eye
at the Battle of Copenhagen." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-BOAT"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-BOAT ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-BOAT">
		)
		(T
		)
	>
	<TELL "It's an incredibly old rowboat that ">
	<COND
		(<AND <IN? ,TH-OAR-1 ,TH-BOAT>
				<NOT <IN? ,TH-OAR-2 ,TH-OAR-LOCK>>
			>
			<TELL "has one empty oarlock and ">
		)
	>
	<TELL "probably leaks. But it looks as if it might float">
	<COND
		(<NOT <OR
					<IN? ,TH-BOAT ,RM-THE-EMBANKMENT>
					<IN? ,TH-BOAT ,RM-OUTSIDE-TRAITORS-GATE>
				>
			>
			<TELL " a little while longer">
		)
	>
	<TELL "." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-OAR-1"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-OAR-1 ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-OAR-1">
		)
		(T
		)
	>
	<TELL "The oar is hopelessy jammed into the oarlock." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-CLAPPER"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-CLAPPER ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-CLAPPER">
		)
		(T
		)
	>
	<COND
		(<IN? ,TH-SAPPHIRE ,TH-CLAPPER>
			<TELL "The clapper hangs from the centre of the bell. There
is a beautiful blue sapphire glued to the end of it." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-COTTON-BALLS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-COTTON-BALLS ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-COTTON-BALLS">
		)
		(T
		)
	>
	<COND
		(<IN? ,TH-COTTON-BALLS ,TH-EARS>
			<TELL "You can't see them because they're in your ears." CR>
		)
		(T
			<TELL "They're soft and fluffy."	CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-BELL"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-BELL ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-BELL">
		)
		(T
		)
	>
	<TELL "The huge bell hangs over the hollow shaft of the tower." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-STETHOSCOPE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-STETHOSCOPE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-STETHOSCOPE">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,TH-STETHOSCOPE ,FL-WORN>
			<TELL "The stethoscope is hanging from your ears." CR>
		)
		(T
			<TELL "It looks just like any other late-Victorian-era
stethoscope." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-DIAL"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-TH-DIAL ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-DIAL">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-SAFETY-DEPOSIT-BOX"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-TH-SAFETY-DEPOSIT-BOX ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-SAFETY-DEPOSIT-BOX">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-MALMSEY"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-TH-MALMSEY ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-MALMSEY">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-BUTT-OF-MALMSEY"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-TH-BUTT-OF-MALMSEY ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-BUTT-OF-MALMSEY">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-SUIT-OF-ARMOUR"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-TH-SUIT-OF-ARMOUR ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-SUIT-OF-ARMOUR">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-TEETER-TOTTER"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-TH-TEETER-TOTTER ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-TEETER-TOTTER">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-PORTCULLIS-CHAIN"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-TH-PORTCULLIS-CHAIN ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-PORTCULLIS-CHAIN">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-WATSONS-HAT"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-WATSONS-HAT ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-WATSONS-HAT">
		)
		(T
		)
	>
	<COND
		(<MC-IS? ,TH-WATSONS-HAT ,FL-WORN>
			<TELL
"You can't look at your hat while it's on the top of your head." CR
			>
		)
		(T
			<TELL
"It's a rather large hat with plenty of room inside it for your rather
large head." CR
			>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-HANSOM-CAB"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-TH-HANSOM-CAB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-HANSOM-CAB">
		)
		(T
		)
	>
	<TELL
"It is a small cab with two wheels and room for only two persons,
drawn by a single horse." CR CR

"Unfortunately, the cab is off-duty, and will remain so until we
implement it." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-GROWLER-CAB"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-TH-GROWLER-CAB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-GROWLER-CAB">
		)
		(T
		)
	>
	<TELL
"It is a large cab with four wheels and room for four persons,
drawn by a single horse." CR CR

"Unfortunately, the cab is off-duty, and will remain so until we
implement it." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-CAB-WHISTLE"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-TH-CAB-WHISTLE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-CAB-WHISTLE">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-EMERALD"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-EMERALD ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-EMERALD">
		)
		(T
		)
	>
	<RT-EXAMINE-GEM ,TH-EMERALD>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-SAPPHIRE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-SAPPHIRE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-SAPPHIRE">
		)
		(T
		)
	>
	<COND
		(<MC-T? <RT-EXAMINE-GEM ,TH-SAPPHIRE>>
			<RTRUE>
		)
		(<IN? ,TH-SAPPHIRE ,TH-CLAPPER>
			<TELL "The sapphire is hanging from the end of the clapper." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-OPAL"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-OPAL ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-OPAL">
		)
		(T
		)
	>
	<RT-EXAMINE-GEM ,TH-OPAL>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-RUBY"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-RUBY ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-RUBY">
		)
		(T
		)
	>
	<RT-EXAMINE-GEM ,TH-RUBY>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-TOPAZ"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-TOPAZ ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-TOPAZ">
		)
		(T
		)
	>
	<RT-EXAMINE-GEM ,TH-TOPAZ>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-GARNET"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-TH-GARNET ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-GARNET">
		)
		(T
		)
	>
	<RT-EXAMINE-GEM ,TH-GARNET>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-RUBY-SCRATCH"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-RUBY-SCRATCH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-DF "TH-RUBY-SCRATCH">
		)
		(T
		)
	>
	<RT-EXAMINE-SCRATCH ,TH-RUBY>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-EMERALD-SCRATCH"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-EMERALD-SCRATCH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-DF "TH-EMERALD-SCRATCH">
		)
		(T
		)
	>
	<RT-EXAMINE-SCRATCH ,TH-EMERALD>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-SAPPHIRE-SCRATCH"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-SAPPHIRE-SCRATCH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-DF "TH-SAPPHIRE-SCRATCH">
		)
		(T
		)
	>
	<RT-EXAMINE-SCRATCH ,TH-SAPPHIRE>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-OPAL-SCRATCH"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-OPAL-SCRATCH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-DF "TH-OPAL-SCRATCH">
		)
		(T
		)
	>
	<RT-EXAMINE-SCRATCH ,TH-OPAL>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-GARNET-SCRATCH"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-GARNET-SCRATCH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-DF "TH-GARNET-SCRATCH">
		)
		(T
		)
	>
	<RT-EXAMINE-SCRATCH ,TH-GARNET>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-TOPAZ-SCRATCH"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-TOPAZ-SCRATCH ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-DF "TH-TOPAZ-SCRATCH">
		)
		(T
		)
	>
	<RT-EXAMINE-SCRATCH ,TH-TOPAZ>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-CRAYON"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-CRAYON ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-CRAYON">
		)
		(T
		)
	>
	<TELL "It looks just like any other Victorian-era crayon." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-WATSONS-COAT"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-WATSONS-COAT ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-WATSONS-COAT">
		)
		(T
		)
	>
	<TELL "It's a wool greatcoat." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-EDWARD-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-EDWARD-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-EDWARD-TOMB">
		)
		(T
		)
	>
	<TELL 
"It's the tomb of Edward the Confessor, the founder of Westminster Abbey,
and the only English king ever to be canonized. Around the tomb is a frieze
that shows scenes from Edward's life, and on the base there is a faded
inscription." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-ELIZABETH-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-ELIZABETH-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-ELIZABETH-TOMB">
		)
		(T
		)
	>
	<TELL
"The tomb is that of Elizabeth I and her half-sister, Mary Tudor. It is
surrounded by twelve black marble pillars, and on the base is an inscription." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-NEWTON-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-NEWTON-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-NEWTON-TOMB">
		)
		(T
		)
	>
	<TELL
"It's a white marble sarcophagus with \"ISAACVS NEWTON   Eques Auratus\"
written on the front. Above it is a marble statue of Newton, and a carving
of two cherubs who are holding a diagram of the solar system."	CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-HENRY-V-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-HENRY-V-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-HENRY-V-TOMB">
		)
		(T
		)
	>
	<TELL
"It's an old wooden coffin on a raised platform. On the top is an effigy of
Henry V, and there is an inscription carved into the side." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-POPE-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-POPE-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-POPE-TOMB">
		)
		(T
		)
	>
	<TELL ,K-SIMPLE-TOMB-MSG CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-DICKENS-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-DICKENS-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-DICKENS-TOMB">
		)
		(T
		)
	>
	<TELL ,K-SIMPLE-TOMB-MSG CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-CHAUCER-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-CHAUCER-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-CHAUCER-TOMB">
		)
		(T
		)
	>
	<TELL
"It's the tomb of Geoffrey Chaucer, who died in 1400 and became the first
person to be buried in Poet's Corner. The inscription above the sarcophagus
is so faded that it is almost illegible."  CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-ANNE-OF-CLEVES-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-ANNE-OF-CLEVES-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-ANNE-OF-CLEVES-TOMB">
		)
		(T
		)
	>
	<TELL ,K-SIMPLE-TOMB-MSG CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-LITTLE-PRINCES-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-LITTLE-PRINCES-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-LITTLE-PRINCES-TOMB">
		)
		(T
		)
	>
	<TELL
"According to the inscription, the urn contains the remains of the Little
Princes in the Tower." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-MARY-QUEEN-OF-SCOTS-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-MARY-QUEEN-OF-SCOTS-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-MARY-QUEEN-OF-SCOTS-TOMB">
		)
		(T
		)
	>
	<TELL
"The tomb is a simple sarcophagus with a marble effigy of Mary, Queen of
Scots on it." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-HENRY-VII-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-HENRY-VII-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-HENRY-VII-TOMB">
		)
		(T
		)
	>
	<TELL
"It's an incredibly lavish tomb which is surmounted by gilt effigies of Henry
VII and his wife Elizabeth of York." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-PITT-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-PITT-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-PITT-TOMB">
		)
		(T
		)
	>
	<TELL
"It's a huge monument to William Pitt. On the base of the monument are five "
D ,TH-FIGURES " and an elaborate inscription." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-FIGURES"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-FIGURES ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-FIGURES">
		)
		(T
		)
	>
	<TELL
"You've never understood allegorical figures before. What makes you think you
can start now?" CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-VERE-TOMB"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-VERE-TOMB ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-VERE-TOMB">
		)
		(T
		)
	>
	<TELL
"It's an effigy of a man surrounded by four knights, who are holding up
a marble slab on their shoulders. On the slab is the dead man's armour." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-LAMP"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-LAMP ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-LAMP">
		)
		(T
		)
	>
	<TELL "It is a battered old brass lamp that has accompanied you on
many adventures in the past." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-CLUMP-OF-MOSS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-CLUMP-OF-MOSS ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-CLUMP-OF-MOSS">
		)
		(T
		)
	>
	<TELL "The clump of moss is a slightly different colour than the
other lichen that surrounds it." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-BLIGH-BOAT"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-BLIGH-BOAT ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-BLIGH-BOAT">
		)
		(T
		)
	>
	<TELL "The boat is a true-to-life replica of the rowboat that
Captain Bligh sailed to Pitcairn Island after the mutiny on the Bounty." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-ANCHOR"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-ANCHOR ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-ANCHOR">
		)
		(T
		)
	>
	<COND
		(<IN? ,TH-ANCHOR ,TH-BOAT>
			<TELL "It's slimy and green and covered with river crud. Yuck!" CR>
		)
		(T
			<TELL "It's in the water." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-NELSON-STATUE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-NELSON-STATUE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-NELSON-STATUE">
		)
		(T
		)
	>
	<TELL CTHE ,TH-NELSON-STATUE " is perched high above you, on top of the column.">
	<COND
		(<AND <MC-IS? ,TH-NELSON-STATUE ,FL-OPENED>
				<IN? ,TH-RUBY ,TH-NELSON-STATUE>
			>
			<TELL " " ,K-GLINT-MSG>
		)
	>
	<CRLF>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-BUNG"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-TH-BUNG ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-BUNG">
		)
		(T
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-MACE"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-TH-MACE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-MACE">
		)
		(T
		)
	>
	<TELL "It's big. It's heavy. It's perfect for knocking bungs out
of butts." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-CROWN-JEWELS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-CROWN-JEWELS ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-CROWN-JEWELS">
		)
		(T
		)
	>
	<TELL
"Despite its adventures, the Regalia doesn't look any the worse for
wear." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-ETHERIUM-GAS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-ETHERIUM-GAS ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-DF "TH-ETHERIUM-GAS">
		)
		(T
		)
	>
	<TELL "Etherium is a colourless gas, which">
	<RT-YOU-MSG>
	<TELL "cannot see." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-LAB-EQUIPMENT"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-LAB-EQUIPMENT ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-DF "TH-LAB-EQUIPMENT">
		)
		(T
		)
	>
	<TELL "The equipment is a jumble of test tubes, beakers, and pipettes." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-BLACK-BAG"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-BLACK-BAG ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-BLACK-BAG">
		)
		(T
		)
	>
	<TELL
"It's the black medical bag your aunt gave you when you graduated
from medical school." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-CHARLES-STATUE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-CHARLES-STATUE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-CHARLES-STATUE">
		)
		(T
		)
	>
	<MC-MAKE ,TH-WAX-AX ,FL-SEEN>
	<COND
		(<IN? ,TH-WAX-HEAD ,TH-CHARLES-STATUE>
			<TELL
"Charles I is shown kneeling, with his head resting on a
chopping block. Above him stands a masked executioner"
			>
			<COND
				(<IN? ,TH-WAX-AX ,TH-CHARLES-STATUE>
					<TELL ", with his axe held
high over his head, ready to strike the deathblow"
					>
				)
			>
			<TELL "." CR>
		)
		(T
			<TELL "The statue looks grotesque without the head." CR>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-WILLIAM-STATUE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-WILLIAM-STATUE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-WILLIAM-STATUE">
		)
		(T
		)
	>
	<TELL
"The statue is of William The Conqueror kneeling on the sand
at Pevensey, where he landed before the Battle of Hastings in 1066." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-WALTER-STATUE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-WALTER-STATUE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-WALTER-STATUE">
		)
		(T
		)
	>
	<TELL
"The sculpture shows Sir Walter Raleigh spreading his cloak
across a mud puddle so Elizabeth I could walk across without dirtying
her shoes." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-ELIZABETH-STATUE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-ELIZABETH-STATUE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-ELIZABETH-STATUE">
		)
		(T
		)
	>
	<TELL
"She is smiling at Sir Walter." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-THOMAS-STATUE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-THOMAS-STATUE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-THOMAS-STATUE">
		)
		(T
		)
	>
	<TELL
"The sculpture shows four knights with swords drawn, advancing
on Thomas Becket as he stands before the High Altar of Canterbury
Cathedral." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-DRAKE-STATUE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-DRAKE-STATUE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-DRAKE-STATUE">
		)
		(T
		)
	>
	<TELL
"The statue is of Sir Francis Drake finishing his game of bowls
before sailing off to defeat the Spanish Armada." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-JOHN-STATUE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-JOHN-STATUE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-JOHN-STATUE">
		)
		(T
		)
	>
	<TELL
"King John is depicted signing the Magna Carta in the
meadow at Runnymeade in June of 1215." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-FAWKES-STATUE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-FAWKES-STATUE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-FAWKES-STATUE">
		)
		(T
		)
	>
	<TELL
"The statue depicts Guy Fawkes crouched behind some barrels of gunpowder. He
is awaiting the signal to light his torch and set off the trail of gunpowder
that will blow up Parliament"
	>
	<COND
		(<OR	<IN? ,TH-TORCH ,TH-FAWKES-STATUE>
				<IN? ,TH-BURNT-TORCH ,TH-FAWKES-STATUE>
			>
			<TELL ". The torch he holds looks like a real one">
		)
		(T
			<TELL " - but he seems to be missing the torch">
		)
	>
	<TELL "." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-NELSON-COLUMN"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-NELSON-COLUMN ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-NELSON-COLUMN">
		)
		(T
		)
	>
	<TELL "The column has" ,K-NELSON-STATUE-MSG CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-ROPE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-ROPE ("AUX" T1 T2)
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-ROPE">
		)
		(T
		)
	>
	<SET T1 <GETP ,TH-ROPE ,P?AUX1>>
	<SET T2 <GETP ,TH-ROPE ,P?AUX2>>
	<COND
		(<EQUAL? .T1 -1>
			<RFALSE>
		)
		(T
			<TELL CTHE ,TH-ROPE " is securely bound to " THE .T1>
		)
	>
	<COND
		(<NOT <EQUAL? .T2 -1>>
			<TELL " and " THE .T2>
		)
	>
	<TELL "." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-LIQUID"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-LIQUID ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-LIQUID">
		)
		(T
		)
	>
	<TELL "It's a clear, colourless liquid." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-PIGEONS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-PIGEONS ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-DF "TH-PIGEONS" .CONTEXT>
		)
		(T
		)
	>
	<TELL "The pigeons strut around the square as if they own it." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-RED-GLASS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-RED-GLASS ("OPTIONAL" (CONTEXT <>))
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-DF "TH-RED-GLASS" .CONTEXT>
		)
		(T
		)
	>
	<TELL "It's just a worthless bauble." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-PICTURES"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-PICTURES ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-PICTURES">
		)
		(T
		)
	>
	<TELL "They look just like some of your relatives." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-CLUE-BOOK"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-CLUE-BOOK ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-DF "TH-CLUE-BOOK">
		)
		(T
		)
	>
	<TELL "It looks like a very old book." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-BOOK-PAGE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-BOOK-PAGE ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-DF "TH-BOOK-PAGE">
		)
		(T
		)
	>
	<TELL "It has writing on it." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-ARCH"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-ARCH ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-ARCH">
		)
		(T
		)
	>
	<TELL "It's a large triumphal arch, surmounted by a bronze chariot." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-PARK-FLOWERS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-PARK-FLOWERS ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-PARK-FLOWERS">
		)
		(T
		)
	>
	<TELL
"You see daisies, petunias, roses, peonies, marigolds, and a host of golden
daffodils." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-JEWEL-CASE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-JEWEL-CASE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-JEWEL-CASE">
		)
		(T
		)
	>
	<TELL 
"The case is bent and twisted where the thief attacked it with the mace." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-ELIZAS-HEART"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-ELIZAS-HEART ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-ELIZAS-HEART">
		)
		(T
		)
	>
	<TELL "You don't have X-Ray vision." CR> 
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-RUBBINGS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-RUBBINGS ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-RUBBINGS">
		)
		(T
		)
	>
	<TELL
"They are brass rubbings made from various inscriptions around
the abbey." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-NEWTON-STATUE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-NEWTON-STATUE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-NEWTON-STATUE">
		)
		(T
		)
	>
	<TELL
"The great mathematician is shown reclining in a pensive mood." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-CHERUBS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-CHERUBS ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-CHERUBS">
		)
		(T
		)
	>
	<TELL
"Cute, aren't they?" CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-MARQUEES"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-MARQUEES ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-MARQUEES">
		)
		(T
		)
	>
	<SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-MARQUEES>>
	<RT-WINDOW ,GL-WINDOW>
	<SETG GL-WINDOW <>>
	<RTRUE>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-ASH"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-ASH ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-ASH">
		)
		(T
		)
	>
   <TELL "It is dark, almost black, in colour, and quite flakey." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-WAX-OBJECT-1"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-WAX-OBJECT-1 ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-WAX-OBJECT-1">
		)
		(T
		)
	>
	<TELL "You see nothing unusual about">
	<RT-CLAUSE-PRINT ,K-P-NC1 ,K-P-NC1L>
	<TELL "." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-WAX-OBJECT-2"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-WAX-OBJECT-2 ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-WAX-OBJECT-2">
		)
		(T
		)
	>
	<TELL "You see nothing unusual about">
	<RT-CLAUSE-PRINT ,K-P-NC1 ,K-P-NC1L>
	<TELL "." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-LIBRARY-OBJ"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-LIBRARY-OBJ (PTR "AUX" BUF MSG)
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-LIBRARY-OBJ">
		)
		(T
		)
	>
	<TELL "You see nothing unusual about">
	<RT-CLAUSE-PRINT ,K-P-NC1 ,K-P-NC1L>
	<TELL "." CR>

>

;-----------------------------------------------------------------------------
; "RT-DF-TH-OPIUM-GAS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-OPIUM-GAS ()
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-OB-DF "TH-OPIUM-GAS">
		)
		(T
		)
	>
	<TELL "The fumes hang thick in the air." CR>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-PRODUCE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-PRODUCE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-PRODUCE">
		)
		(T
		)
	>
	<TELL
"All the produce looks good. But the giant peas look especially
delicious." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-TRINKETS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-TRINKETS ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-TRINKETS">
		)
		(T
		)
	>
	<TELL
"They're mostly just baubles. He's obviously charging way too much for them."
CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-GUARDS-KEYS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-GUARDS-KEYS ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-GUARDS-KEYS">
		)
		(T
		)
	>
	<RT-CYOU-MSG>
	<TELL
"can't see them. They're in the guard's pocket." CR
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-NELSON-EYE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-NELSON-EYE ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-NELSON-EYE">
		)
		(T
		)
	>
	<COND
		(<AND <MC-IS? ,TH-NELSON-STATUE ,FL-OPENED>
				<IN? ,TH-RUBY ,TH-NELSON-STATUE>
			>
			<TELL " " ,K-GLINT-MSG>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-TH-UNINTERESTING-OBJECT"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-TH-UNINTERESTING-OBJECT ()
	%<COND
		(,GL-DEBUG?
		   <RT-DEBUG-OB-DF "TH-UNINTERESTING-OBJECT">
		)
		(T
		)
	>
	<TELL
"It's not very interesting." CR
	>
>

;*****************************************************************************
; "CONSTANTS"
;*****************************************************************************

<CONSTANT K-SIMPLE-TOMB-MSG
"It's a simple tomb, with a brief inscription written on it."
>

<CONSTANT K-BREATH-TAKING-MSG
"The ceiling is breath-takingly beautiful."
>

<CONSTANT K-GLINT-MSG
"Now that you know what to look for, you see a glint coming from Nelson's
blind eye."
>

<CONSTANT K-NELSON-STATUE-MSG
" a statue of Nelson on the top and a bronze relief on the pedestal at
the bottom."
>

;*****************************************************************************
; "end of file"
;*****************************************************************************

