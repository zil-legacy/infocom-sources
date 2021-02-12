;******************************************************************************
; "game : SHERLOCK!"
; "file : PLACES3.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   28 Oct 1987 15:53:12  $"
; "rev  : $Revision:   1.80  $"
; "vers : 1.00"
;******************************************************************************

;-----------------------------------------------------------------------------
; "this file contains:"
; "  the descfcn routines for all rooms"
;-----------------------------------------------------------------------------

;-----------------------------------------------------------------------------
; "context value meanings for descfcn (so far):"
; "  1 = The desc upon entering when the room is not touched (first time)"
; "  2 = The desc upon entering when the room is touched & the desc-level is verbose"
; "  3 = The desc of the room when the player types LOOK"
; "return value meanings for descfcn routines (so far):"
; "  RTRUE  means RT-DESCRIBE-PLACE-CONTENTS will NOT be executed"
; "  RFALSE means RT-DESCRIBE-PLACE-CONTENTS will     be executed"
;-----------------------------------------------------------------------------

;-----------------------------------------------------------------------------
; "TIME-OF-DAY-NUMBERS: 0=DARK 1=SUNRISE 2=DAY 3=SUNSET"
;-----------------------------------------------------------------------------

;-----------------------------------------------------------------------------
; "RT-DF-RM-221B-BAKER-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-221B-BAKER-ST (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-221B-BAKER-ST" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 2>
			<COND
				(<EQUAL? ,GL-PLACE-PRV ,RM-ENTRY-HALL>
					<TELL "You emerge from the house into">
				)
				(T
					<TELL "You">
					<RT-DRIVE-WALK-MSG?>
					<TELL "into">
				)
			>
			<TELL " Baker Street." CR CR>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2 3>
			<TELL "You are">
			<RT-IN-VEHICLE-MSG>
			<COND
				(<EQUAL? <RT-TIME-OF-DAY> 0 1 3>
					<TELL "in the spill of a gas streetlight ">
				)
			>
			<TELL	"outside Holmes's house. The street ">
			<COND
				(<EQUAL? <RT-TIME-OF-DAY> 0>
					<TELL "disappears into the fog">
				)
				(T
					<TELL "continues">
				)
			>
			<TELL " to the north and south. The door to the house is to
the west." CR
			>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,LG-BAKER-ST-DOOR ,FL-SEEN>
			<MC-MAKE ,CH-PLAYER ,FL-SEEN>
			<TELL	CR
"You have come in response to an urgent summons from your old landlady,
Mrs. Hudson. As the fog swirls around you, you huddle into your coat and
shiver in the predawn chill." CR
			>
			<RTRUE>
		)
		(<EQUAL? .CONTEXT 2>
			<COND
				(<IN? ,CH-HOLMES ,RM-221B-BAKER-ST>
					<COND
						(<MC-F? ,GL-PUPPY>
							<TELL
CR
CTHE ,CH-HOLMES " says, \"Ah, there you are Watson. While you were inside
I gave our little problem some thought. Obviously the person who stole the
Crown Jewels wanted the authorities to turn to me for help, and it is equally
obvious that the thief has laid down a trail for me to follow, in hopes of
somehow entrapping me." CR CR

"\"So let's play his game, Doctor. But let's play it by our rules. The thief
will have tried to anticipate the sequence of my actions, and I'm sure he has
laid his trap accordingly. But if "
							>
							<HLIGHT ,K-H-ITL>
							<TELL "you">
							<HLIGHT ,K-H-NRM>
							<TELL " were to guide the course of our
investigations, he will certainly be thrown off the scent." CR CR

"\"Therefore, let us take surprise onto our side and rely on your instincts
as the man of action I know you to be - despite your frequent modest
assertions to the contrary.\" He steps to one side and says, \"Lead on, good
Doctor. I will follow.\" Holmes gestures for you to lead the way." CR
							>
							<SETG GL-PUPPY ,CH-HOLMES>
							<SETG GL-PUPPY-MSG? <>>
							<RTRUE>
						)
						(T
							<RFALSE>
						)
					>
				)
			>
		)
		(<EQUAL? .CONTEXT 2 3>
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-ENTRY-HALL"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-ENTRY-HALL (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-ENTRY-HALL" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,CH-HUDSON ,FL-SEEN>
			<MC-MAKE ,TH-GAS-LIGHT ,FL-SEEN>
			<MC-MAKE ,TH-HUDSON-BODY ,FL-SEEN>
			<MC-MAKE ,RM-ENTRY-HALL ,FL-TOUCHED>
			<TELL
CR "You step inside and Mrs. Hudson closes the door behind you. The entry
hall is just as you remember it - small, underheated, and
lit by a feeble gas light. "

,K-WELL-WORN-MSG
			>
			<RTRUE>
		) 
		(<EQUAL? .CONTEXT 2>
			<COND
				(<EQUAL? ,GL-PLACE-PRV ,RM-221B-BAKER-ST>
					<TELL
"You enter the house and pause in the entry hall. " ,K-WELL-WORN-MSG CR
					>
				)
				(<EQUAL? ,GL-PLACE-PRV ,RM-VESTIBULE>
					<TELL
"You descend the stairs into the entry hall. The parlour door is to
the north. "
               >
					<RT-OPEN-CLOSED-MSG ,LG-BAKER-ST-DOOR>
					<CRLF>
				)
				(T
					<TELL "You walk out into the entry hall. ">
					<RT-OPEN-CLOSED-MSG ,LG-BAKER-ST-DOOR>
					<CRLF>
				)
			>
			<RFALSE>
		)
		(T
			<TELL ,K-WELL-WORN-MSG " ">
			<RT-OPEN-CLOSED-MSG ,LG-BAKER-ST-DOOR>
			<CRLF>
			<RFALSE>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-PARLOUR"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-PARLOUR (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-PARLOUR" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-MATCHBOOK ,FL-SEEN>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "You walk into">
		)
		(T
			<TELL "You are in">
		)		
	>
 	<TELL " a dreary, late Victorian Era parlour." CR>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-VESTIBULE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-VESTIBULE (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-VESTIBULE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<COND
				(<EQUAL? ,GL-PLACE-PRV ,RM-ENTRY-HALL>
					<TELL "You climb the stairs">
				)
				(T
					<TELL "You leave the study">
				)
			>
			<TELL " and pause outside the door">
			<COND
				(<EQUAL? .CONTEXT 1>
					<MC-MAKE ,LG-HOLMES-STUDY-DOOR ,FL-SEEN>
					<TELL " to Holmes's study, nervous about what you might
find inside. " 
					>
				)
				(T
					<TELL ". ">
				)
			>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 2 3>
			<TELL	"You are on a landing at the top of the stairs.">
		)
	>
	<TELL CR CR "Holmes's study is to the north." CR>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-HOLMES-STUDY"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-HOLMES-STUDY (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-HOLMES-STUDY" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<TELL
"You step back through time to your bachelor days, when you shared
these cluttered digs with the world's only consulting detective. Despite
the mess, you can see that the room is unchanged. A pile of letters is
transfixed to the mantelpiece with a jackknife. Next to them lies Holmes's
six-shot revolver, the tobacco slipper, and Holmes's favorite pipe. The
violin has been carelessly tossed onto a stack of obviously
unread newspapers." CR CR
			>
		 	<RT-DF-CH-HOLMES>
			<CRLF>
			<MC-MAKE ,TH-MANTELPIECE ,FL-SEEN>
			<MC-MAKE ,TH-VIOLIN ,FL-SEEN>
			<MC-MAKE ,TH-NEWSPAPER ,FL-SEEN>
			<MC-MAKE ,TH-SYRINGE ,FL-SEEN>
			<MC-MAKE ,TH-PHIAL ,FL-SEEN>
			<MC-MAKE ,TH-MAIL ,FL-SEEN>
			<MC-MAKE ,TH-FIRE ,FL-SEEN>
			<MC-MAKE ,TH-FIREPLACE ,FL-SEEN>
			<MC-MAKE ,TH-GUN ,FL-SEEN>
			<MC-MAKE ,TH-KNIFE ,FL-SEEN>
			<MC-MAKE ,TH-PERSIAN-SLIPPER ,FL-SEEN>
			<MC-MAKE ,TH-PIPE ,FL-SEEN>
			<MC-MAKE ,TH-LIQUID ,FL-SEEN>
			<MC-MAKE ,TH-MOROCCO-CASE ,FL-SEEN>
			<MC-MAKE ,TH-SOFA ,FL-SEEN>
			<MC-MAKE ,CH-HOLMES ,FL-SEEN>
			<MC-MAKE ,TH-HOLMES-BODY ,FL-SEEN>
			<MC-MAKE ,LG-HOLMES-BEDROOM-DOOR ,FL-SEEN>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 2>
			<TELL "You return to Holmes's study, which">
		)
		(<EQUAL? .CONTEXT 3>
			<TELL "The study">
		)
	>
	<COND
		(<EQUAL? .CONTEXT 2 3>
			<TELL " is in its usual disarray." CR>
			<COND
				(<MC-IS? ,CH-HOLMES ,FL-ASLEEP>
					<CRLF>
					<RT-DF-CH-HOLMES>
				)
			>
			<COND
				(<IN? ,CH-PRIME-MINISTER ,RM-HOLMES-STUDY>
					<CRLF>
					<COND
						(<MC-ISNOT? ,CH-PRIME-MINISTER ,FL-SEEN>
							<MC-MAKE ,CH-PRIME-MINISTER ,FL-SEEN>
							<RT-THIS-IS-IT ,CH-PRIME-MINISTER>
							<TELL
"You see a distinguished-looking visitor sitting in the armchair. "
							>
						)
						(T
							<TELL "The visitor fidgets nervously in his chair. ">
						)
					>
				)
				(T
					<CRLF>
				)
			>
		)
	>
	<TELL CTHE ,LG-HOLMES-BEDROOM-DOOR>
	<TELL " to the west is ">
	<COND
		(<MC-IS? ,LG-HOLMES-BEDROOM-DOOR ,FL-OPENED>
			<TELL "open">
		)
		(T
			<TELL "closed">
		)
	>
	<TELL ". The only other exit is the door to the south." CR>
	<COND
		(<EQUAL? .CONTEXT 1>
			<RTRUE>
		)
		(<EQUAL? .CONTEXT 2 3>
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-HOLMES-BEDROOM"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-HOLMES-BEDROOM (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-HOLMES-BEDROOM" .CONTEXT>
		)
		(T
		)
	>
	<TELL
"This is a sparsely furnished room, whose walls are adorned
only by scores of pictures of famous criminals. On a disorderly workbench
in the corner, a jumble of laboratory equipment suggests that Holmes is in
the middle of one of his chemical experiments. "
	>
	<COND
		(<IN? ,TH-ETHERIUM-AMPOULE ,TH-WORKBENCH>
			<TELL
"Set off to one side is a single ampoule with a neatly lettered label
affixed to it. "
			>
		)
	>
	<TELL "The room's only exit is to the east." CR>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-BED ,FL-SEEN>
			<MC-MAKE ,TH-BEDSIDE-TABLE ,FL-SEEN>
			<MC-MAKE ,TH-ETHERIUM-AMPOULE ,FL-SEEN>
			<MC-MAKE ,TH-LAB-EQUIPMENT ,FL-SEEN>
			<MC-MAKE ,TH-WORKBENCH ,FL-SEEN>
			<MC-MAKE ,TH-LAMP ,FL-SEEN>
			<MC-MAKE ,TH-MAGNIFYING-GLASS ,FL-SEEN>
			<MC-MAKE ,TH-PICTURES ,FL-SEEN>
			<TELL CR "Next to the bed there is a table, on which you see a
lamp and Holmes's favorite magnifying glass. " CR
			>
			<RTRUE>
		)
		(<EQUAL? .CONTEXT 2 3>
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-YORK-PLACE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-YORK-PLACE (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-YORK-PLACE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2 3>
			<COND
				(<EQUAL? <RT-TIME-OF-DAY> 0>
					<TELL "Through the mist you see">
				)
				(T
					<TELL "This is">
				)
			>
			<TELL " a quiet, residential street, lined with
undistinguished, four storey Georgian houses. To the south, York Place
opens up into Baker Street, and Marylebone Road comes in from the east." CR
			>
		)
	>
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 1 2 3>
			<TELL CR "The street isn't as quiet as usual, due to the surging
crowds of tourists." CR>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-MARYLEBONE-RD"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-MARYLEBONE-RD (CONTEXT "AUX" WHO)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-MARYLEBONE-RD" .CONTEXT>
		)
		(T
		)
	>
	<SET WHO <RT-WHO-SAYS?>>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<COND
				(<EQUAL? ,GL-PLACE-PRV ,RM-MADAME-TUSSAUDS>
					<TELL "You go out the door and are now">
				)
				(T
					<TELL "You find yourself">
				)
			>
		)
		(T
			<TELL "You are">
		)
	>
	<RT-IN-VEHICLE-MSG>
	<TELL "in front of Madame Tussaud's famous wax
museum. From here the street continues east and west."  CR CR
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "The museum is closed for renovations, and there is a
guard and a dog patrolling the street outside the entrance, which is just
to the north of you. The guard puts out a cigarette, tips his hat, and
says, \""
			>
			<COND
				(<EQUAL? ,GL-PLACE-PRV ,RM-MADAME-TUSSAUDS>
					<TELL "Goodbye">
				)
				(<EQUAL? <RT-TIME-OF-DAY> 0>
					<TELL "Hello">
				)
				(<EQUAL? <RT-TIME-OF-DAY> 1>
					<TELL "Top of the morning to you">
				)
				(<EQUAL? <RT-TIME-OF-DAY> 2>
					<TELL "Good day">
				)
				(<EQUAL? <RT-TIME-OF-DAY> 3>
					<TELL "Good evening">
				)
			>
			<COND
				(<EQUAL? .WHO ,CH-HOLMES>
					<TELL ", Mr. Holmes">
				)
				(T
					<TELL ", Doctor Watson">
				)
			>
			<TELL ".\"" CR>
		)
		(<EQUAL? .CONTEXT 3>
			<TELL	"The guard and the dog are still here, and they show
no signs of leaving." CR
			>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,CH-TUSSAUDS-GUARD ,FL-SEEN>
			<MC-MAKE ,CH-MATCH-SNIFFING-DOG ,FL-SEEN>
			<MC-MAKE ,TH-CIGARETTE ,FL-SEEN>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-MADAME-TUSSAUDS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-MADAME-TUSSAUDS (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-MADAME-TUSSAUDS" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-ASH ,FL-SEEN>
         <MC-MAKE ,TH-WILLIAM-STATUE ,FL-SEEN>
         <MC-MAKE ,TH-WALTER-STATUE ,FL-SEEN>
         <MC-MAKE ,TH-ELIZABETH-STATUE ,FL-SEEN>
         <MC-MAKE ,TH-DRAKE-STATUE ,FL-SEEN>
         <MC-MAKE ,TH-JOHN-STATUE ,FL-SEEN>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<COND
				(<EQUAL? ,GL-PLACE-PRV ,RM-MARYLEBONE-RD>
					<TELL "You come in off the street and are now standing in">
				)
				(T
					<TELL "You leave the Chamber of Horrors and go back into">
				)
			>
		)
		(T
			<TELL "You are in">
		)
	>
	<TELL " the lobby." CR CR "All around you are wax statues of famous
people. To the west is a dark and ominous-looking doorway with a sign
over it. The exit to the street is to the south." CR
	>
   <COND
      (<AND <MC-IS? ,TH-ASH ,FL-ASLEEP>
            <IN? ,CH-HOLMES ,GL-PLACE-CUR>
         >
         <MC-MAKE ,TH-ASH ,FL-SEEN>
         <MC-UNMAKE ,TH-ASH ,FL-ASLEEP>
         <MC-UNMAKE ,TH-ASH ,FL-NODESC>
         <TELL
CR CTHE ,CH-HOLMES " drops to his hands and knees and
begins a minute examination of the floor. After a few moments he
cries, \"Aha! Look here, Watson.\" He points to a miniscule speck of
ash on the floor." CR
         >
			<SETG GL-PUPPY-MSG? <>>
         <RTRUE>
      )
      (T
      	<RFALSE>
      )
   >
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-CHAMBER-OF-HORRORS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-CHAMBER-OF-HORRORS (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-CHAMBER-OF-HORRORS" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
         <MC-MAKE ,TH-CHARLES-STATUE ,FL-SEEN>
         <MC-MAKE ,TH-THOMAS-STATUE ,FL-SEEN>
         <MC-MAKE ,TH-FAWKES-STATUE ,FL-SEEN>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "You enter">
		)
		(T
			<TELL "You are in">
		)
	>
	<TELL " the Chamber of Horrors. Scattered around the room are wax
groupings of some of the most gruesome scenes from English history. The
only exit is to the east." CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-TOTTENHAM-COURT-RD"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-TOTTENHAM-COURT-RD (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-TOTTENHAM-COURT-RD" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,LG-SHOPS ,FL-SEEN>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2 3>
			<TELL "This part of London is known for its furniture dealers, but
all the shops seem to be closed for the Jubilee." CR CR

"Marylebone Road goes off to the west here, and Tottenham Court
Road continues to the south." CR
			>
		)
	>
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 1 2 3>
			<TELL CR "Throngs of shoppers peer in the windows of the
closed shops." CR
			>
		)
		(T
			<CRLF>
			<RT-FOG-MSG>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-ST-GILES-CIRCUS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-ST-GILES-CIRCUS (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-ST-GILES-CIRCUS" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2 3>
			<TELL "You are">
			<RT-IN-VEHICLE-MSG>
			<TELL
"in St. Giles Circus. Roads lead off in many directions." CR
			>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-OXFORD-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-OXFORD-ST (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-OXFORD-ST" .CONTEXT>
		)
		(T
		)
	>
	<TELL "Oxford Street is London's busiest shopping
thoroughfare"
	>
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 0>
			<TELL ", although at this hour the street is deserted">
		)
	>
	<TELL ". Fashionable emporiums line the street on either side, offering
goods from all over the British Empire. Unfortunately, they all seem
to be closed for the Jubilee." CR CR
	>
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 1 2 3>
			<TELL "Hoards of frustrated tourists mill about, peering in the
windows of the closed shops." CR CR
			>
		)
	>
	<TELL "The street continues to the east and west." CR>
	<COND
		(<EQUAL? .CONTEXT 1>
;			<TELL CR "At a cab-stand along the curb you see a growler cab." CR>
			<MC-MAKE ,LG-SHOPS ,FL-SEEN>
;			<MC-MAKE ,TH-GROWLER-CAB ,FL-SEEN>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-ORCHARD-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-ORCHARD-ST (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-ORCHARD-ST" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2 3>
			<TELL "Orchard Street is the southern extension of Baker Street.
From here you can see Oxford Street off to the east,
Baker Street to the north, and Audley Street "
			>
			<COND
				(<EQUAL? <RT-TIME-OF-DAY> 0>
					<TELL "fading into the mists">
				)
				(T
					<TELL "continuing">
				)
			>
			<TELL " to the south." CR CR>
		)
	>
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 1 2>
			<TELL "Crowds of tourists stream eastward, ">
			<COND
				(<EQUAL? <RT-TIME-OF-DAY> 1>
					<TELL "looking forward to spending the day in the shops along
Oxford Street." CR
					>
				)
				(T
					<TELL "intent on finding some bargains in the shops on Oxford
Street." CR
					>
				)
			>
		)
		(<EQUAL? <RT-TIME-OF-DAY> 3>
			<TELL "Frustrated tourists stream westward, angered by the closed
shops in Oxford Street." CR
			>
		)
		(T
			<RT-FOG-MSG>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-AUDLEY-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-AUDLEY-ST (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-AUDLEY-ST" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2 3>
			<TELL "This is a pleasant street that winds through Mayfair,
a fashionable district which takes its name from an ancient fair
held there in May of each year." CR CR

"To the south is Hyde Park Corner, and to the north is Orchard
Street." CR
			>
		)
	>
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 0>
			<CRLF>
			<RT-FOG-MSG>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-HYDE-PARK-CORNER"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-HYDE-PARK-CORNER (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-HYDE-PARK-CORNER" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-ARCH ,FL-SEEN>
			<MC-MAKE ,TH-CHARIOT ,FL-SEEN>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2 3>
			<TELL "Hyde Park Corner is dominated by the Wellington Arch, a
soaring monument to the \"Iron Duke,\" who defeated Napoleon at the Battle
of Waterloo." CR CR
			>
		)
	>
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 1 2 3>
			<TELL "Huge crowds of tourists gape up at the Arch." CR CR>
		)
		(T
			<TELL "The arch is enshrouded in fog." CR CR>
		)
	>
	<TELL "Roads lead off in many directions." CR>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-KENSINGTON-GARDENS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-KENSINGTON-GARDENS (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-KENSINGTON-GARDENS" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,CH-NANNIES ,FL-SEEN>
			<MC-MAKE ,TH-PRAMS ,FL-SEEN>
			<MC-MAKE ,TH-PARK-FLOWERS ,FL-SEEN>
		)
	>
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 1 2 3>
			<TELL "A tide of perambulators pushed by well-starched nannies
surges along the crowded walk. Everywhere you look there are rows and rows
of beautiful flowers." CR
			>
		)
		(T
			<TELL "The flower gardens are deserted." CR>
			<CRLF>
			<RT-FOG-MSG>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-TRAFALGAR-SQUARE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-TRAFALGAR-SQUARE (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-TRAFALGAR-SQUARE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-PIGEONS ,FL-SEEN>
			<MC-MAKE ,TH-NELSON-COLUMN ,FL-SEEN>
			<MC-MAKE ,TH-NELSON-EYE ,FL-SEEN>
			<MC-MAKE ,TH-NELSON-STATUE ,FL-SEEN>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2 3>
			<TELL "Pigeons, pigeons, everywhere. You are">
			<RT-IN-VEHICLE-MSG>
			<TELL "in one of the great open spaces of London, named for
Nelson's naval victory over Napoleon in 1805. Streets come in and go
out at all angles, and everywhere you look there are "
			>
			<COND
				(<EQUAL? <RT-TIME-OF-DAY> 1 2 3>
					<TELL "people feeding ">
				)
			>
			<TELL "pigeons." CR CR

"The square is dominated by Nelson's Column, a 167 foot tall
Corinthian column with"

,K-NELSON-STATUE-MSG CR CR

"The entrance to the Diogenes Club is to the west." CR
			>
		)
	>
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 0>
			<CRLF>
			<RT-FOG-MSG>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-DIOGENES-CLUB"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-DIOGENES-CLUB (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-DIOGENES-CLUB" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL
"You enter the hushed atmosphere of the Diogenes Club. The furnishings are
aging and opulent. The members are aging and asleep. The only exit is
to the east." CR CR
			>
			<COND
				(<MC-ISNOT? ,CH-BUTLER ,FL-ASLEEP>
					<TELL 
"An ancient butler totters forward to greet you and says in a barely audible
whisper, \"May I be of some assistance?\"" CR
					>
				)
				(T
					<TELL ,K-EVERYONE-OUT-MSG CR>
				)
			>
		)
		(T
			<TELL
"You are in the Diogenes Club. "
			>
			<COND
				(<MC-ISNOT? ,CH-BUTLER ,FL-ASLEEP>
					<TELL
"The butler is here, waiting to serve you."
					>
				)
				(T
					<TELL ,K-EVERYONE-OUT-MSG>
				)
			>
			<TELL CR>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,CH-BUTLER ,FL-SEEN>
			<MC-MAKE ,CH-MEMBERS ,FL-SEEN>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-GREAT-RUSSELL-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-GREAT-RUSSELL-ST (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-GREAT-RUSSELL-ST" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2 3>
			<TELL "Great Russell Street is the home of the British Museum, the
entrance of which is to the north. There is a sign next to the door." CR CR

"To the southwest you can see St. Giles Circus." CR
			>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-BRITISH-MUSEUM"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-BRITISH-MUSEUM (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-BRITISH-MUSEUM" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<COND
				(<EQUAL? ,GL-PLACE-PRV ,RM-GREAT-RUSSELL-ST>
					<TELL "You walk up the grand staircase and into">
				)
				(T
					<TELL "You walk back down the long corridor and return to">
				)
			>
		)
		(T
			<TELL "You are standing in">
		)
	>
	<TELL " the entrance hall of the museum. All the corridors
leading to the exhibit halls are packed with tourists, and there is a
steady stream of people going in and out of the street entrance to the
south. Only the corridor to the east seems to be of no interest to
the sightseers." CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-MANUSCRIPT-ROOM"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-MANUSCRIPT-ROOM (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-MANUSCRIPT-ROOM" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "The deserted corridor leads to">
		)
		(T
			<TELL "You are in">
		)
	>
	<TELL
" the manuscript room, which contains a dusty collection of
old books on obscure subjects. "
	>
	<COND
		(<IN? ,CH-LIBRARIAN ,RM-MANUSCRIPT-ROOM>
			<TELL
"There is an old librarian here, on whose desk sits a handwritten sign that
reads \"Quiet, please.\" "
			>
		)
	>
	<TELL "There are thousands of books behind glass cases">
	<COND
		(<EQUAL? .CONTEXT 1>
			<TELL ", but one is lying unattended on a table">
		)
	>
	<TELL
". The only exit is to the west." CR
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,CH-LIBRARIAN ,FL-SEEN>
			<MC-MAKE ,TH-CLUE-BOOK ,FL-SEEN>
			<MC-MAKE ,TH-LIBRARY-OBJ ,FL-SEEN>
			<MC-MAKE ,TH-LIBRARY-TABLE ,FL-SEEN>
			<TELL
CR "The librarian - who is as dusty as the books - looks up in surprise as
you come in. He "
			>
			<COND
				(<IN? ,TH-COTTON-BALLS ,TH-EARS>
					<TELL "whispers">
				)
				(T
					<TELL "says loudly">
				)
			>
			<TELL
", \"Oh, I say! Hello! I don't get many visitors here. Is there
something I can help you with? Some information about the Jubilee,
perhaps? It's quite rare, you know, for a British ruler to
celebrate 50 years on the throne. Unique, in fact. The closest anyone
else came was Elizabeth I, who ruled 45 years - although our records are
somewhat vague before the year 900. The Anglo-Saxon chronicles do get rather
sketchy, what? Still, they're the best we have. I think I can find a copy
for you somewhere here.\"" CR CR

"The librarian's voice trails off as he bustles from shelf to shelf,
squinting at the books to find the one he thinks you want." CR
			>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-GROSVENOR-PLACE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-GROSVENOR-PLACE (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-GROSVENOR-PLACE" .CONTEXT>
		)
		(T
		)
	>
	<TELL
"This is a pleasant but out-of-the-way street that runs northwest to
southeast. Few tourists ever visit here. "
	>
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 1 3>
			<TELL "Despite the ">
			<COND
				(<EQUAL? <RT-TIME-OF-DAY> 1>
					<TELL "early">
				)
				(T
					<TELL "late">
				)
			>
			<TELL " hour, some">
		)
		(<EQUAL? <RT-TIME-OF-DAY> 2>
			<TELL "Some">
		)
	>
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 1 2 3>
			<TELL " people are standing on the corner." CR>
		)
		(T
			<RT-FOG-MSG>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-VICTORIA-SQUARE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-VICTORIA-SQUARE (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-VICTORIA-SQUARE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "You come upon">
		)
		(T
			<TELL "You are in">
		)
	>
	<TELL " Victoria Square. Streets go off in many directions." CR> 
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-VICTORIA-STREET"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-VICTORIA-STREET (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-VICTORIA-STREET" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "You enter">
		)
		(T
			<TELL "You are loitering in">
		)
	>
	<TELL
" Victoria Street, which runs east and west between Victoria Square
and Broad Sanctuary." CR CR

"You see a sign outside one of the shops." CR>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-BROAD-SANCTUARY"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-BROAD-SANCTUARY (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-BROAD-SANCTUARY" .CONTEXT>
		)
		(T
		)
	>
	<MC-MAKE ,LG-WESTMINSTER-DOOR ,FL-SEEN>
	<COND
		(<EQUAL? .CONTEXT 1 2 3>
			<TELL "You are">
			<RT-IN-VEHICLE-MSG>
			<COND
				(<EQUAL? <RT-TIME-OF-DAY> 1 2 3>
					<TELL "in the midst of a crowd of tourists ">
				)
			>
			<TELL "in front of the west door of Westminster
Abbey. The towers of the Abbey"
			>
			<COND
				(<EQUAL? <RT-TIME-OF-DAY> 0>
					<TELL " loom in the fog">
				)
				(T
					<TELL " soar high">
				)
			>
			<TELL " above you, and you marvel at
this perfect example of Gothic architecture, as generations have done
before you." CR CR
			>
			<RT-OPEN-CLOSED-MSG ,LG-WESTMINSTER-DOOR>
			<CRLF>
			<CRLF>
			<TELL "On the wall next to the door is a small, discrete sign." CR>
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-PARLIAMENT-SQUARE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-PARLIAMENT-SQUARE (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-PARLIAMENT-SQUARE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2 3>
			<TELL "This is an attractive square at the foot of Whitehall. ">
			<COND
				(<EQUAL? <RT-TIME-OF-DAY> 1 2 3>
					<TELL "Large crowds mill around">
				)
				(T
					<TELL "Through the mist you see">
				)
			>
			<TELL " the entrance to the Houses of Parliament to the
southeast. To the west is Birdcage Walk. Broad Sanctuary goes off to
the southwest, and Whitehall ">
			<COND
				(<EQUAL? <RT-TIME-OF-DAY> 0>
					<TELL "disappears into the gloom">
				)
				(T
					<TELL "is">
				)
			>
			<TELL " to the north." CR
			>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-PARLIAMENT"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-PARLIAMENT (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-PARLIAMENT" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<COND
				(<EQUAL? ,GL-PLACE-PRV ,RM-PARLIAMENT-SQUARE>
					<COND
						(<EQUAL? <RT-TIME-OF-DAY> 0>
							<TELL "You enter">
						)
						(T
							<TELL "You push your way into">
						)
					>
				)
				(T
					<TELL "You descend the stairs into">
				)
			>
		)
		(T
			<TELL "You are standing in">
		)
	>
	<TELL " the ">
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 1 2 3>
			<TELL "jam-packed ">
		)
	>
	<TELL "entrance hall of the House of Commons." CR CR>
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 1 2 3>
			<COND
				(<EQUAL? <RT-TIME-OF-DAY> 1 3>
					<TELL "Despite the ">
					<COND
						(<EQUAL? <RT-TIME-OF-DAY> 1>
							<TELL "early">
						)
						(T
							<TELL "late">
						)
					>
					<TELL " hour, there">
				)
				(T
					<TELL "There">
				)
			>
			<TELL " are hundreds of people lined up to get in. But">
		)
		(T
			<TELL "The Chamber is closed, but">
		)
	>
	<TELL " off to one side you see a flight of old stone steps leading
up into the darkness." CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-CLOCK-TOWER"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-CLOCK-TOWER (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-CLOCK-TOWER" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "The stairs seem to wind up forever. Finally, you emerge
into"
			>
		)
		(T
			<TELL "You are in">
		)
	>
	<TELL " the interior of the clock tower, high above the Houses
of Parliament." CR CR

"The immense bell known as Big Ben is hanging from the
ceiling, suspended over a hollow shaft that is so deep it might as
well be bottomless. A wooden railing runs around the shaft
for safety." CR CR

"Inside the bell, you see an enormous clapper"
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-BELL ,FL-SEEN>
			<MC-MAKE ,TH-SAPPHIRE ,FL-SEEN>
			<MC-MAKE ,TH-CLAPPER ,FL-SEEN>
			<MC-MAKE ,TH-SHAFT ,FL-SEEN>
			<MC-MAKE ,TH-RAILING ,FL-SEEN>
			<TELL ,K-SAPPHIRE-MSG CR
			>
			<RTRUE>
		)
		(T
			<COND
				(<IN? ,TH-SAPPHIRE ,TH-CLAPPER>
					<TELL ,K-SAPPHIRE-MSG CR>
				)
				(T
					<TELL "." CR>
				)
			>
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-BUCKINGHAM-PALACE-RD"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-BUCKINGHAM-PALACE-RD (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-BUCKINGHAM-PALACE-RD" .CONTEXT>
		)
		(T
		)
	>
	<TELL
"Buckingham Palace Road connects Queens Gardens to the northeast
with Victoria Square to the southwest." CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-QUEENS-GARDENS"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-QUEENS-GARDENS (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-QUEENS-GARDENS" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,CH-PALACE-GUARD ,FL-SEEN>
		)
	>
	<TELL "You are">
	<RT-IN-VEHICLE-MSG>
	<TELL "outside the gate to Buckingham Palace." CR>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-BUCKINGHAM-PALACE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-BUCKINGHAM-PALACE (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-BUCKINGHAM-PALACE" .CONTEXT>
		)
		(T
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-BIRDCAGE-WALK"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-BIRDCAGE-WALK (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-BIRDCAGE-WALK" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "As you enter Birdcage Walk, your attention is diverted
to"
			>
		)
		(T
			<TELL "You see">
		)
	>
	<TELL " a man who has set up a small souvenir stand near where the
parade will pass on Tuesday. "
	>
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 0>
			<TELL "Oblivious to the fact that there are no crowds here to
buy his wares"
			>
		)
		(T
			<TELL "Hoping to attract the attention of the crowd">
		)
	>
	<TELL
", he is waving a handful of overpriced trinkets over his head." CR
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,CH-VENDOR ,FL-SEEN>
			<MC-MAKE ,TH-TELESCOPE ,FL-SEEN>
			<MC-MAKE ,TH-TRINKETS ,FL-SEEN>
			<TELL CR "As soon as he sees you, the salesman ">
			<COND
				(<EQUAL? <RT-TIME-OF-DAY> 1 2 3>
					<TELL "ignores everyone else and ">
				)
			>
			<TELL "says, \"'Ere, Guv. Come early for the parade, 'ave
you? There'll be thousands of people, you know. Now at the last
Jubilee - about a year and a 'alf ago, as I remembers it - I could 'ardly
see a fing. But if you was to buy one of my telescopes, you wouldn't
'ardly 'ave any problem, now would you? 'Ow 'bout it, Guv?\"" CR  
			>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>	 	

;-----------------------------------------------------------------------------
; "RT-DF-RM-THE-MALL"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-THE-MALL (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-THE-MALL" .CONTEXT>
		)
		(T
		)
	>
	<TELL
"The Mall runs southwest to northeast between the Queens Gardens
and Trafalgar Square." CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-WHITEHALL"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-WHITEHALL (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-WHITEHALL" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2 3>
			<TELL "Impressive government buildings line the street on either
side. The street continues north and south, and the entrance to
Scotland Yard is to the east." CR
			>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-SCOTLAND-YARD"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-SCOTLAND-YARD (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-SCOTLAND-YARD" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<COND
				(<EQUAL? ,GL-PLACE-PRV ,RM-WHITEHALL>
					<TELL
"You walk up the steps and into the building. Inside, it"
					>
				)
				(<EQUAL? ,GL-PLACE-PRV ,RM-THE-BLACK-MUSEUM>
					<TELL
"You return to the ground floor. It"
					>
				)
			>
		)
		(T
			<TELL "It">
		)
	>
	<TELL " looks just like any other government building - drab and
worn. The door to the street is to the west, and you see some steps
leading down." CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-THE-BLACK-MUSEUM"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-THE-BLACK-MUSEUM (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-THE-BLACK-MUSEUM" .CONTEXT>
		)
		(T
		)
	>
	<MC-MAKE ,TH-BLIGH-BOAT ,FL-SEEN>
	<COND
		(<EQUAL? .CONTEXT 1 2 3>
			<TELL "This is the Black Museum, where the Yard keeps relics
and mementos of famous crimes." CR CR

"Along one wall is a full-size rowboat with a small sign attached to
it." CR
			>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-NEW-OXFORD-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-NEW-OXFORD-ST (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-NEW-OXFORD-ST" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<COND
				(<EQUAL? ,GL-PLACE-PRV ,RM-CHEAPSIDE ,RM-ST-GILES-CIRCUS>
					<TELL "The quality of the neighborhood seems to be ">
	 				<COND
	 					(<EQUAL? ,GL-PLACE-PRV ,RM-ST-GILES-CIRCUS>
	 						<TELL "deteriorating">
	 					)
	 					(T
	 						<TELL "improving">
	 					)
	 				>
					<TELL " as you">
					<RT-DRIVE-WALK-MSG?>
	 				<COND
	 					(<EQUAL? ,GL-PLACE-PRV ,RM-ST-GILES-CIRCUS>
	 						<TELL "eastward">
	 					)
	 					(T
	 						<TELL "westward">
	 					)
	 				>
					<TELL " along">
				)
				(<EQUAL? ,GL-PLACE-PRV ,RM-COVENT-GARDEN>
					<TELL "You leave Covent Garden and enter">
				)
				(T
					<TELL "The cab stops in">
				)
			>
		)		
		(T
			<TELL "You are">
			<RT-IN-VEHICLE-MSG>
			<TELL "in">
		)
	>
	<TELL " New Oxford Street." CR>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-COVENT-GARDEN"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-COVENT-GARDEN (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-COVENT-GARDEN" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "You enter">
		)
		(T
			<TELL "You are in">
		)
	>
	<TELL " Covent Garden, which is the central market for all of
London. Everywhere you look there are stalls packed with produce
from the English countryside." CR CR
	>
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 0>
			<TELL "Despite the hour, the">
		)
		(T
			<TELL "The">
		)
	>
	<TELL " open-air market is crowded with housewives who are shopping
for fruits and vegetables." CR
	>
	<COND
		(<IN? ,CH-ELIZA-DOOLITTLE ,RM-COVENT-GARDEN>
			<CRLF>
			<COND
				(<EQUAL? .CONTEXT 1 2>
					<TELL "After looking around for a few moments, you">
				)
				(T
					<TELL "You">
				)
			>
			<TELL " see a crowd of women gathered around a girl who
has collapsed on the ground. Her lifeless hand clutches a bunch of
flowers." CR
			>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,CH-ELIZA-DOOLITTLE ,FL-SEEN>
			<MC-MAKE ,CH-HOUSEWIVES ,FL-SEEN>
			<MC-MAKE ,TH-ELIZAS-FLOWERS ,FL-SEEN>
			<MC-MAKE ,TH-ELIZA-BODY ,FL-SEEN>
			<MC-MAKE ,TH-ELIZAS-MOUTH ,FL-SEEN>
			<MC-MAKE ,TH-PRODUCE ,FL-SEEN>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-THE-STRAND"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-THE-STRAND (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-THE-STRAND" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-MARQUEES ,FL-SEEN>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "You enter">
		)
		(T
			<TELL "You are lingering in">
		)
	>
	<TELL " the Strand, which is the heart of London's theatre district">
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 3>
			<COND
				(<EQUAL? .CONTEXT 1 2>
					<TELL ", and fight your way through">
				)
				(T
					<TELL ", and you are enjoying being in the midst of"
					>
				)
			>
			<TELL " the crowds of happy theatre-goers">
		)
		(<EQUAL? <RT-TIME-OF-DAY> 1 2>
			<TELL "." CR CR "Crowds are gathering in front of the theatres,
trying to select a show to see later in the day"
			>
		) 
	>
	<TELL ". Streets lead off to the north, east, and southwest." CR>
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 0>
			<TELL CR "As you">
			<RT-DRIVE-WALK-MSG?>
			<TELL
"through the fog, the empty streets seem
haunted by the ghosts of actors from years gone by." CR
			>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-FLEET-STREET"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-FLEET-STREET (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-FLEET-STREET" .CONTEXT>
		)
		(T
		)
	>
	<TELL
"Fleet Street is the centre of London's thriving newspaper industry"
	>
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 0>
			<TELL
". The presses roar all night, turning out papers that will
be delivered by train around the country the next day." CR
			>
		)
		(T
			<TELL ", and it is crowded with the thousands of people
who put out the nation's newspapers." CR
			>
		)
	>	
	<TELL CR
"Streets lead off to the east and west, and there is a passage
south to the Embankment." CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-THE-EMBANKMENT"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-THE-EMBANKMENT (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-THE-EMBANKMENT" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "You arrive at">
		)
		(T
			<TELL "You are">
			<RT-IN-VEHICLE-MSG>
			<TELL "on">
		)
	>
	<TELL " the Victoria Embankment, on the left bank of the Thames. ">
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 1>
			<TELL
"The early morning mist clings to the water and muffles
the sounds of the river."
			>
		)
		(<EQUAL? <RT-TIME-OF-DAY> 2>
			<TELL
"The river is crowded with pleasure boats here for the Jubilee."
			>
		)
		(<EQUAL? <RT-TIME-OF-DAY> 3>
			<TELL
"The river looks quiet and peaceful in the fading light."
			>
		)
		(T
			<TELL
"The river is barely visible through the thick fog."
			>
		)
	>
	<CRLF>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-BOAT ,FL-SEEN>
			<MC-MAKE ,TH-OAR-1 ,FL-SEEN>
			<MC-MAKE ,TH-OAR-LOCK ,FL-SEEN>
			<TELL CR
"There is an incredibly old rowboat here. It's got one
empty oarlock, and it probably leaks, but it looks as if it might
float." CR
			>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-THAMES-ONE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-THAMES-ONE (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-THAMES-ONE" .CONTEXT>
		)
		(T
		)
	>
	<TELL "You are">
	<RT-IN-VEHICLE-MSG>
	<TELL "on the Thames, just south of the embankment." CR>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-THAMES-TWO"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-THAMES-TWO (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-THAMES-TWO" .CONTEXT>
		)
		(T
		)
	>
	<TELL "You are">
	<RT-IN-VEHICLE-MSG>
	<TELL "on the Thames. Downstream you can see London Bridge." CR>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-THAMES-THREE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-THAMES-THREE (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-THAMES-THREE" .CONTEXT>
		)
		(T
		)
	>
	<TELL "You are">
	<RT-IN-VEHICLE-MSG>
	<TELL "underneath London Bridge." CR>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-THAMES-FOUR"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-THAMES-FOUR (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-THAMES-FOUR" .CONTEXT>
		)
		(T
		)
	>
	<TELL "You are">
	<RT-IN-VEHICLE-MSG>
	<TELL "on the Thames, just south of Traitor's Gate." CR>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-THAMES-FIVE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-THAMES-FIVE (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-THAMES-FIVE" .CONTEXT>
		)
		(T
		)
	>
	<TELL "You are">
	<RT-IN-VEHICLE-MSG>
	<TELL "on the Thames, in danger of drifting out to sea." CR>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-UPPER-THAMES-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-UPPER-THAMES-ST (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-UPPER-THAMES-ST" .CONTEXT>
		)
		(T
		)
	>
	<TELL
"Upper Thames Street runs east and west between the Embankment and Lower
Thames Street." CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-BLIND-ALLEY"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-BLIND-ALLEY (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-BLIND-ALLEY" .CONTEXT>
		)
		(T
		)
	>
	<TELL
"This is a sinister-looking alley that runs west from Fleet Street to what
looks like an abandoned pub. On the wall above you is a faded sign." CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-SIGN-OF-RED-HERRING"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-SIGN-OF-RED-HERRING (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-SIGN-OF-RED-HERRING" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-UNINTERESTING-OBJECT ,FL-SEEN>
		)
	>
	<TELL
"You peer through the gloom and discover that all the furnishings of the
alehouse have been removed. Nothing remains except an uninteresting object
on the floor."
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-PINCHIN-LANE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-PINCHIN-LANE (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-PINCHIN-LANE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<COND
				(<EQUAL? ,GL-PLACE-PRV ,RM-CHEAPSIDE>
					<TELL "You enter">
				)
				(<EQUAL? ,GL-PLACE-PRV ,RM-SHERMANS-HOUSE>
					<TELL "You emerge from Sherman's shop into">
				)
				(T
					<TELL "The cab stops in">
				)
			>
		)
		(T
			<TELL "You are">
			<RT-IN-VEHICLE-MSG>
			<TELL "in">
		)
	>
	<TELL " Pinchin Lane, a dingy little alley that runs">
	<COND
		(<EQUAL? ,GL-PLACE-PRV ,RM-CHEAPSIDE>
			<TELL " south from">
		)
		(T
			<TELL " north to">
		)
	>
	<TELL " Cheapside." CR CR "To the west is the entrance to ">	
	<COND
		(<OR
			<EQUAL? .CONTEXT 1>
			<MC-ISNOT? ,RM-SHERMANS-HOUSE ,FL-SEEN>
			>
				<TELL "what looks like a pet shop">
		)
		(T
			<TELL "Sherman's shop">
		)
	>
	<TELL ".">
	<COND
		(<AND
			<EQUAL? <RT-TIME-OF-DAY> 0>
			<NOT <EQUAL? ,GL-PLACE-PRV ,RM-SHERMANS-HOUSE>>
			>
				<TELL " Despite the hour, you see a light shining inside." CR>
		)
		(T
			<CRLF>
		)
	>			
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-SHERMANS-HOUSE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-SHERMANS-HOUSE (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-SHERMANS-HOUSE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<RT-THIS-IS-IT ,CH-SHERMAN>
			<MC-MAKE ,CH-SHERMAN ,FL-SEEN>
			<MC-MAKE ,RM-SHERMANS-HOUSE ,FL-SEEN>
			<TELL	"You enter the cramped quarters of Sherman's shop. The old
animal-trainer's eyes brighten up when he sees you." CR CR

"\"You've probably come looking for Toby,\" he says. \"But I'm afraid I
won't be able to help you this time. Toby's not feeling too well, and all my
other animals are already out on loan. All I have left is a half-trained
pigeon.\"" CR
			>
			<RTRUE>
		)
		(<EQUAL? .CONTEXT 2 3>
			<TELL	"Sherman's shop is dingy and cramped. Dozens of empty
cages are stacked up against the walls." CR
			>
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-CHEAPSIDE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-CHEAPSIDE (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-CHEAPSIDE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2 3>
			<TELL "This is a ramshackle part of town, with dark alleys
leading off the main street, which continues east and west. Pinchin Lane
leads off to the south." CR
			>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-THREADNEEDLE-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-THREADNEEDLE-ST (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-THREADNEEDLE-ST" .CONTEXT>
		)
		(T
		)
	>
	<MC-MAKE ,CH-BANK-GUARD ,FL-SEEN>
	<MC-MAKE ,CH-URCHINS ,FL-SEEN>
	<MC-MAKE ,TH-GUARDS-POCKET ,FL-SEEN>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<COND
				(<EQUAL? ,GL-PLACE-PRV ,RM-BANK-OF-ENGLAND>
					<TELL "You emerge into">
				)
				(T
					<TELL "You enter">
				)
			>
			<TELL " Threadneedle Street and are now">
		)
		(T
			<TELL "You are">
		)
	>
	<TELL " in front of the Bank of England. The entrance to
the bank is to the north, Cheapside leads off to the west, and King
William Street "
	>
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 0>
			<TELL "disappears off into the darkness">
		)
		(T
			<TELL "continues">
		)
	>
	<TELL " to the southeast. On the wall is a small sign." CR>
	<COND
		(<OR	<EQUAL? .CONTEXT 1>
				<IN? ,CH-BANK-GUARD ,RM-THREADNEEDLE-ST>
			>
			<TELL
CR "A bank guard is lounging up against the wall, idly jangling some keys
in his pocket while he watches a group of urchins playing in the street." CR
			>
			<COND
				(<MC-IS? ,CH-WIGGINS ,FL-BROKEN>
					<TELL CR ,K-URCHIN-MSG CR>
					<RTRUE>
				)
			>
		)
		(T
			<TELL CR "A group of urchins is playing in the street." CR>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-BANK-OF-ENGLAND"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-BANK-OF-ENGLAND (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-BANK-OF-ENGLAND" .CONTEXT>
		)
		(T
		)
	>
	<MC-MAKE ,LG-BANK-VAULT-DOOR ,FL-SEEN>
	<MC-MAKE ,TH-DIAL ,FL-SEEN>
	<COND
		(<EQUAL? .CONTEXT 1 2 3>
			<TELL "The bank has the eerie silence that normally crowded
places have when no one is there. The door to the vault is set into
the west wall." CR
			>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-BANK-VAULT"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-BANK-VAULT (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-BANK-VAULT" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-BOXES-TOMB ,FL-SEEN>
			<MC-MAKE ,TH-BOX-LOCK ,FL-SEEN>
			<MC-MAKE ,TH-SAFETY-DEPOSIT-BOX ,FL-SEEN>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "Upon entering, you">
		)
		(T
			<TELL "You">
		)
	>
	<TELL " see rows upon rows of safety deposit boxes." CR>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-KING-WILLIAM-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-KING-WILLIAM-ST (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-KING-WILLIAM-ST" .CONTEXT>
		)
		(T
		)
	>
	<TELL
"King William Street runs northwest to southeast, from Threadneedle
Street to Monument." CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-MONUMENT"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-MONUMENT (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-MONUMENT" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2 3>
			<TELL "The intersection is dominated by the Monument, a huge obelisk
that commemorates the Great Fire of London. On the side of the monument
is a plaque." CR
			>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-LOWER-THAMES-ST"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-LOWER-THAMES-ST (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-LOWER-THAMES-ST" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "You enter">
		)
		(T
			<TELL "You are in">
		)
	>
	<TELL
" Lower Thames Street. Roads lead off in many directions, some
more savory than others. There is a set of particularly slovenly stairs
leading down to an alley that runs alongside the river." CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-LONDON-BRIDGE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-LONDON-BRIDGE (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-LONDON-BRIDGE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<COND
				(<EQUAL? ,GL-PLACE-PRV ,RM-LAIR>
					<TELL
"When you emerge from the lair you are momentarily disoriented, blinking
your eyes in the bright sunlight. After a few moments, you realize you
are standing on London bridge, but you have no idea from which direction
you came." CR
					>
					<RTRUE>
				)
				(T
					<TELL "You">
					<RT-DRIVE-WALK-MSG?>
					<TELL "up onto">
				)
			>
		)
		(T
			<TELL "You are">
			<RT-IN-VEHICLE-MSG>
			<TELL "on">
		)
	>
	<TELL " London Bridge. ">
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 1 2 3>
			<TELL "The view of the river from here is spectacular, and
hoards of sightseers are here with you to share the view." CR
			>
		)
		(T
			<TELL
"The fog is so dense you can barely see the river from here." CR
			>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-TOWER-STREET"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-RM-TOWER-STREET (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-TOWER-STREET" .CONTEXT>
		)
		(T
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-TOWER-ENTRANCE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-TOWER-ENTRANCE (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-TOWER-ENTRANCE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2 3>
			<TELL "You are">
			<RT-IN-VEHICLE-MSG>
			<TELL "outside the entrance to the Tower of
London. Next to the entrance there is a sign." CR
			>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-SWAN-LANE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-SWAN-LANE (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-SWAN-LANE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<COND
				(<EQUAL? ,GL-PLACE-PRV ,RM-LOWER-THAMES-ST>
					<TELL "With increasing apprehension, you descend">
				)
				(T
					<TELL "With considerable relief, you emerge">
				)
			>
			<TELL " into">
		)
		(T
			<TELL "With increasing apprehension, you are standing in">
		)
	>
	<TELL " Swan Lane, which runs along the waterfront of the Thames." CR CR>
	<COND
		(<EQUAL? .CONTEXT 1>
			<TELL "It is a seedy, disreputable, run-down part of town that
normally you wouldn't be caught dead in. After a moment's reflection,
you wish you hadn't thought of it in quite those terms."	CR CR
			>
		)
	>	
	<TELL
"To the west is the entrance to one of the least savory buildings
you have ever seen. There is a faded sign above the door that informs
you that the establishment was, in better days, known as the Bar
of Gold." CR CR

"Fortunately, it is only a short walk back up the stairs to Lower
Thames Street." CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-BAR-OF-GOLD"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-BAR-OF-GOLD (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-BAR-OF-GOLD" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,CH-DENKEEPER ,FL-SEEN>
			<MC-MAKE ,TH-OPIUM-GAS ,FL-SEEN>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL
"After fighting the urge to turn and run, you enter and find yourself "
			>
		)
		(T
			<TELL "You are standing - rather nervously - ">
		)
	>
	<TELL
"in the Bar of Gold, the most infamous opium den in London. The
proprietor is a most unsavory character who "
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL
"gives you a sidelong glance as you enter and then ignores you"
			>
		)
		(T
			<TELL "hasn't given you a second look since you came in">
		)
	>
	<TELL "." CR>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-LAIR"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-LAIR (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-LAIR" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,CH-MORIARTY ,FL-SEEN>
			<MC-MAKE ,TH-LAIR-KEY ,FL-SEEN>
			<MC-MAKE ,TH-CROWN-JEWELS ,FL-SEEN>
			<MC-MAKE ,TH-MORIARTY-DESK ,FL-SEEN>
			<MC-MAKE ,TH-ROPE ,FL-SEEN>
			<TELL "At last you come face to face with the evil Professor. He
is sitting placidly behind his desk, looking at you as if you were some
botanical specimen." CR CR

"As you look around the room, you see Sherlock Holmes tied to a
chair. He is only inches away from the crown jewels, which Moriarty has
spread out on his desk, the better to taunt Holmes." CR CR

"Holmes looks up and says, \"Ah, there you are Watson.\" He turns his head
towards Moriarty and says, \"You see, Professor, you grossly underestimate
the intelligence and determination of your fellow countrymen.\"" CR CR

"\"Watson,\" he continues. \"The Professor and I have just been chatting about
why he led us on this merry chase. If you care to ask him, I'm sure he would
be happy to fill you in as well.\"" CR
			>
			<RTRUE>
		)
		(<EQUAL? .CONTEXT 3>
			<TELL "The room is simply, but elegantly, furnished.">
			<COND
				(<MC-IS? ,CH-HOLMES ,FL-LOCKED>
					<SETG GL-PUPPY-MSG? <>>
					<TELL " "
						<RT-PICK-NEXT ,GL-HOLMES-DESC-TXT>
							,K-SECURELY-BOUND-MSG "."
					>
				)
			>
			<CRLF>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-NAVE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-NAVE (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-NAVE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-NEWTON-TOMB ,FL-SEEN>
			<MC-MAKE ,TH-NEWTON-STATUE ,FL-SEEN>
			<MC-MAKE ,TH-DIAGRAM ,FL-SEEN>
			<MC-MAKE ,TH-CHERUBS ,FL-SEEN>
			<TELL
"You enter the Abbey and pause in the Nave, struck by
the sheer magnificence of the building. Massive Purbeck columns march
the length of the Nave, and they rise in perfect proportion to meet each
other in a series of pointed arches that are the hallmark of the Gothic
style." CR CR

"The interior of the Abbey is dark, cold, and gloomy - but after a few
moments your eyes adjust and you can make out a tomb at the far end of
the room." CR
			>
			<RTRUE>
		)
		(<EQUAL? .CONTEXT 2 3>
			<COND
				(<EQUAL? .CONTEXT 2>
					<COND
						(<EQUAL? ,GL-PLACE-PRV ,RM-BROAD-SANCTUARY>
							<TELL
"You walk through the massive door and find yourself once again in"
							>
						)
						(T
							<TELL "You return to">
						)
					>
				)
				(<EQUAL? .CONTEXT 3>
					<TELL "You are standing in">
				)
			>
			<TELL
" the Nave. Amidst the massive columns, one tomb in particular catches your
attention." CR
			>
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-SOUTH-AISLE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-SOUTH-AISLE (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-SOUTH-AISLE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-POPE-TOMB ,FL-SEEN>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "You enter">
		)
		(T
			<TELL "You are in">
		)
	>
	<TELL " the South Aisle of the Nave. ">
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL
"In the gloom, you bump into one of the tombs. "
			>
		)
	>
	<TELL
"There is an exit to the southeast and a door set into the south
wall." CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-JERICHO-PARLOUR"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-JERICHO-PARLOUR (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-JERICHO-PARLOUR" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<COND
				(<EQUAL? ,GL-PLACE-PRV ,RM-SOUTH-AISLE>
					<TELL
"From the vastness of the Nave, you pass into"
					>
				)
				(T
					<TELL "You leave the Chamber for">
				)
			>
			<TELL " the more intimate">
		)
		(T
			<TELL "You are in the">
		)
	>
	<TELL " Jericho Parlour">
	<COND
		(<AND
			<EQUAL? .CONTEXT 2>
			<EQUAL? ,GL-PLACE-PRV ,RM-JERUSALEM-CHAMBER>
			>
				<TELL "." CR>
		)
		(T
			<TELL
", which is the anteroom to the famous Jerusalem Chamber just
to the west." CR
			>
		)
	>
	<TELL CR "The exit to the Nave is to the north." CR>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-JERUSALEM-CHAMBER"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-JERUSALEM-CHAMBER (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-JERUSALEM-CHAMBER" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-PANELLING ,FL-SEEN>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "You enter">
		)
		(T
			<TELL "You are standing in">
		)
	>
	<TELL " the Jerusalem Chamber, one of the oldest
parts of the Abbey. In contrast to the cold and forbidding stone
elsewhere in the Abbey, this room is panelled in oak and cedar. Just
inside the entrance you see a small sign." CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-NORTH-CLOISTER"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-NORTH-CLOISTER (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-NORTH-CLOISTER" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-PACQUET-OF-PAPER ,FL-SEEN>
			<MC-MAKE ,TH-CRAYON ,FL-SEEN>
			<MC-MAKE ,TH-RUBBINGS ,FL-SEEN>
			<TELL "You enter">
		)
		(T
			<TELL "You are now in">
		)
	>
	<TELL
" the North Cloister, which is the brass-rubbing centre of the
abbey. On the walls are completed rubbings that others have
made."
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<TELL
"  Someone has left a pacquet of paper and a rubbing crayon here." CR
			>
			<RTRUE>
		)
		(T
			<CRLF>
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-SOUTH-TRANSEPT"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-SOUTH-TRANSEPT (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-SOUTH-TRANSEPT" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-DICKENS-TOMB ,FL-SEEN>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "You enter">
		)
		(T
			<TELL "You are in">
		)
	>
	<TELL
" the South " ,K-TRANSEPT-MSG CR
	>
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 1 2 3>
			<TELL CR ,K-SHAFT-OF-LIGHT-MSG CR>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-NORTH-TRANSEPT"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-NORTH-TRANSEPT (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-NORTH-TRANSEPT" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-PITT-TOMB ,FL-SEEN>
			<MC-MAKE ,TH-FIGURES ,FL-SEEN>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "You enter">
		)
		(T
			<TELL "You are in">
		)
	>
	<TELL
" the North " ,K-TRANSEPT-MSG CR
	>
	<COND
		(<EQUAL? <RT-TIME-OF-DAY> 1 2 3>
			<TELL CR ,K-SHAFT-OF-LIGHT-MSG CR>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-POETS-CORNER"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-POETS-CORNER (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-POETS-CORNER" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-CHAUCER-TOMB ,FL-SEEN>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "You walk into">
		)
		(T
			<TELL "You are in">
		)
	>
	<TELL "
the hushed, secluded part of the Abbey known as Poets' Corner. The
monuments here are dedicated to Britain's literary giants. The oldest
of the tombs is that of Geoffrey Chaucer, who died in the year 1400." CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-SOUTH-AMBULATORY"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-SOUTH-AMBULATORY (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-SOUTH-AMBULATORY" .CONTEXT>
		)
		(T
		)
	>
	<TELL ,K-AMBULATORY-MSG CR>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-SANCTUARY"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-SANCTUARY (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-SANCTUARY" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-ANNE-OF-CLEVES-TOMB ,FL-SEEN>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "You walk into">
		)
		(T
			<TELL "You are in">
		)
	>
	<TELL
" the Sanctuary. This is where the actual Coronation Ceremony
takes place whenever a new monarch is crowned. A modest tomb is near
the south wall." CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-NORTH-AMBULATORY"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-NORTH-AMBULATORY (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-NORTH-AMBULATORY" .CONTEXT>
		)
		(T
		)
	>
	<TELL ,K-AMBULATORY-MSG CR>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-EVANGELIST-CHAPEL"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-EVANGELIST-CHAPEL (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-EVANGELIST-CHAPEL" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-BANK-OF-CANDLES ,FL-SEEN>
			<MC-MAKE ,TH-VERE-TOMB ,FL-SEEN>
			<TELL
"You enter the Evangelist Chapel and wonder what it is
about this room that makes you feel it is somehow different from the
rest of the Abbey." CR
			>
		)
		(<EQUAL? .CONTEXT 2>
			<TELL "You return to the welcome warmth provided by the array of
candles in the Evangelist Chapel." CR>
		)
		(T
			<TELL "Light! Warmth! There is a bank of candles
here lit by devoted worshippers. The candles warm the room so effectively
that after a few moments you actually become uncomfortable." CR CR

"One of the most unusual tombs in the Abbey is here." CR
			>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-HENRY-VII-CHAPEL"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-HENRY-VII-CHAPEL (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-HENRY-VII-CHAPEL" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-HENRY-VII-TOMB ,FL-SEEN>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "You enter">
		)
		(T
			<TELL "You are in">
		)
	>
	<TELL
" Henry VII's chapel, which is one of the most beautiful chapels
in the world. The ceiling is a masterpiece of delicate fan vaulting, and
the Renaissance gilt-bronze tomb is obviously the work of one of the
Italian masters." CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-CONFESSOR-CHAPEL"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-CONFESSOR-CHAPEL (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-CONFESSOR-CHAPEL" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-EDWARD-TOMB ,FL-SEEN>
			<MC-MAKE ,TH-HENRY-V-TOMB ,FL-SEEN>
		)
	>
	<TELL
"The Confessor Chapel is dominated by the tomb of the founder
of the Abbey, although there are several other tombs here. It is this
chapel that first gave Westminster the name \"Burial place of kings.\"" CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-SOUTH-CHAPEL-AISLE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-SOUTH-CHAPEL-AISLE (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-SOUTH-CHAPEL-AISLE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-MARY-QUEEN-OF-SCOTS-TOMB ,FL-SEEN>
		)
	>
	<TELL
"The South Chapel Aisle is the final resting place of Mary, Queen
of Scots." CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-NORTH-CHAPEL-AISLE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-NORTH-CHAPEL-AISLE (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-NORTH-CHAPEL-AISLE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-ELIZABETH-TOMB ,FL-SEEN>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "You enter">
		)
		(T
			<TELL "You are in">
		)
	>
	<TELL " the North Chapel Aisle. There is a very large tomb here." CR>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-INNOCENTS-CORNER"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-INNOCENTS-CORNER (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-INNOCENTS-CORNER" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-LITTLE-PRINCES-TOMB ,FL-SEEN>
		)
	>
	<TELL
"This is Innocents' corner, the traditional burial site of
royalty who die in infancy. There are several tombs here." CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-DRAWBRIDGE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-DRAWBRIDGE (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-DRAWBRIDGE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<TELL
"So far, so good. No one has challenged your right to be here. Maybe the
Tower has been left unguarded."
			>
		)
		(<EQUAL? .CONTEXT 2>
			<COND
				(<EQUAL? ,GL-PLACE-PRV ,RM-TOWER-ENTRANCE>
					<TELL "You walk back up onto the drawbridge.">
				)
				(T
					<TELL
"Stung by the guard's rejection, you retrace your steps to the drawbridge."
					>
				)
			>
		)
		(T
			<TELL "You are standing on the drawbridge to the Tower of London.">
		)
	>
	<TELL CR CR
"To the east you see the Byward Tower, and to the west is the Tower
Entrance." CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-BYWARD-TOWER"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-BYWARD-TOWER (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-BYWARD-TOWER" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,CH-TOWER-GUARD ,FL-SEEN>
			<TELL "Your luck runs out. ">
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL
"A costumed Yeoman of the Guard steps forward to challenge you." CR
			>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 3>
			<TELL
"You are standing in the Byward Tower, which was built by Edward I in the
thirteenth century to control access to the fortress.  A burly Beefeater
stands in your path." CR
			>
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-OUTER-WARD"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-OUTER-WARD (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-OUTER-WARD" .CONTEXT>
		)
		(T
		)
	>
	<TELL
"This is the Outer Ward. From here you can go north, south, or west." CR CR

"A few of the Tower's famous ravens are perched here, watching your
every move." CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-BLOODY-TOWER"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-BLOODY-TOWER (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-BLOODY-TOWER" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "You enter">
		)
		(T
			<TELL "You are in">
		)
	>
	<TELL
" the Bloody Tower where, allegedly, the \"Little Princes in the
Tower\" met their death. One exit leads north. The other leads south." CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-OUTSIDE-BELL-TOWER"
;-----------------------------------------------------------------------------

;<ROUTINE RT-DF-RM-OUTSIDE-BELL-TOWER (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-OUTSIDE-BELL-TOWER" .CONTEXT>
		)
		(T
		)
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-WAKEFIELD-TOWER"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-WAKEFIELD-TOWER (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-WAKEFIELD-TOWER" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? ,GL-PLACE-PRV ,RM-TOWER-GREEN>
			<COND
				(<EQUAL? .CONTEXT 1 2>
					<TELL "You leave the">
					<COND
						(<EQUAL? <RT-TIME-OF-DAY> 0 1 3>
							<TELL " gloom of the">
						)
					>
					<TELL " Tower Green for the gloom of the Wakefield Tower.">
				)
			>
		)
		(T
			<COND
				(<EQUAL? .CONTEXT 1 2>
					<TELL "You descend the stairs into the ground floor of the
Wakefield Tower.">
				)
			>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 3>
			<TELL "You see only the thick stone walls of the Wakefield Tower.">
		)
	>
	<CRLF>
	<CRLF>
	<TELL "There is a dark stone staircase leading up, and the only other
exit is to the northwest." CR>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-JEWEL-ROOM"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-JEWEL-ROOM (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-JEWEL-ROOM" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "The stairs take you up to">
		)
		(T
			<TELL "You are in">
		)
	>
	<TELL
" the Jewel Room of the Tower of London. The case that once
held the Regalia is twisted and smashed"
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-MACE ,FL-SEEN>
			<MC-MAKE ,TH-JEWEL-CASE ,FL-SEEN>
			<TELL
", and the weapon that the thief used is lying on the ground nearby." CR
			>
			<RTRUE>
		)
		(T
			<TELL "." CR>
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-DUNGEON"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-DUNGEON (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-DUNGEON" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "You inch your way down the dark stairs and arrive">
		)
		(T
			<TELL "You are">
		)
	>
	<TELL " in the oldest part of the Tower, the Dungeon." CR>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-SUIT-OF-ARMOUR ,FL-SEEN>
			<TELL
CR "The room has been converted into museum space, and prominently featured
is a man-size suit of armour." CR
			>
			<RTRUE>
		)
		(T
			<RFALSE>
		)
	>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-TORTURE-ROOM"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-TORTURE-ROOM (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-TORTURE-ROOM" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-INSTRUMENTS ,FL-SEEN>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "You enter">
		)
		(T
			<TELL "You are in">
		)
	>
	<TELL
" the torture room below the Bowyer Tower. Around the walls are hung
various instruments of torture. The stairs leading up are the only way
out." CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-WHITE-TOWER"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-WHITE-TOWER (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-WHITE-TOWER" .CONTEXT>
		)
		(T
		)
	>
	<TELL
"This is the White Tower, which was started by William the
Conqueror in 1078. Exits lead out and down." CR
	>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-TOWER-GREEN"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-TOWER-GREEN (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-TOWER-GREEN" .CONTEXT>
		)
		(T
		)
	>
	<TELL
"You are on Tower Green, which is at the centre of the Tower of
London. Entrances to various towers lie to the northeast, east, southeast,
and south. A few ravens are strolling around the green, eyeing you with
interest." CR
	> 
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-BOWYER-TOWER"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-BOWYER-TOWER (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-BOWYER-TOWER" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-BUNG ,FL-SEEN>
			<MC-MAKE ,TH-BUTT-OF-MALMSEY ,FL-SEEN>
			<MC-MAKE ,TH-MALMSEY ,FL-SEEN>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<TELL "You enter">
		)
		(T
			<TELL "You are in">
		)
	>
	<TELL
" the Bowyer Tower. It was in this room that the Duke of Clarence
was drowned in a Butt of Malmsey in 1478. The keg still stands over in
the corner." CR CR
	>
	<TELL "Exits lead out and down." CR>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-INSIDE-TRAITORS-GATE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-INSIDE-TRAITORS-GATE (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-INSIDE-TRAITORS-GATE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1>
			<MC-MAKE ,TH-PORTCULLIS-CHAIN ,FL-SEEN>
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<COND
				(<EQUAL? ,GL-PLACE-PRV ,RM-OUTSIDE-TRAITORS-GATE>
					<TELL "You pass under the portcullis">
				)
				(T
					<TELL "You walk south from the Outer Ward">
				)
			>
			<TELL " and find yourself">
		)
		(T
			<TELL "You are">
		)
	>
	<TELL
" just north of Traitors Gate. The portcullis is "
	>
	<COND
		(<MC-IS? ,LG-PORTCULLIS-DOOR ,FL-OPENED>
			<TELL "up">
		)
		(T
			<TELL "down">
		)
	>
	<TELL ". From the wall near the portcullis hangs a chain, and perched
on top of the wall are some ravens." CR>
	<RFALSE>
>

;-----------------------------------------------------------------------------
; "RT-DF-RM-OUTSIDE-TRAITORS-GATE"
;-----------------------------------------------------------------------------

<ROUTINE RT-DF-RM-OUTSIDE-TRAITORS-GATE (CONTEXT)
	%<COND
		(,GL-DEBUG?
			<RT-DEBUG-RM-DF "RM-OUTSIDE-TRAITORS-GATE" .CONTEXT>
		)
		(T
		)
	>
	<COND
		(<EQUAL? .CONTEXT 1 2>
			<COND
				(<EQUAL? ,GL-PLACE-PRV ,RM-INSIDE-TRAITORS-GATE>
					<TELL "You pass under the portcullis">
				)
				(T
					<TELL "You leave the boat">
				)
			>
			<TELL " and find yourself">
		)
		(T
			<TELL "You are">
		)
	>
	<TELL
" just south of Traitors Gate, through which condemned prisoners
were brought in to the Tower prior to being executed. The massive iron
portcullis is "
	>
	<COND
		(<MC-IS? ,LG-PORTCULLIS-DOOR ,FL-OPENED>
			<TELL "up">
		)
		(T
			<TELL "down">
		)
	>
	<TELL "." CR>
	<RFALSE>
>

;*****************************************************************************
; "CONSTANTS"
;*****************************************************************************

<CONSTANT K-WELL-WORN-MSG
"The door to the parlour is to the north, and
a flight of well-worn stairs leads up to the first floor."
>

<CONSTANT K-URCHIN-MSG
"One of the urchins looks strangely familiar to you."
>



;******************************************************************************
; "end of file"
;******************************************************************************

