"1DUNGEON for
	        Zork I: The Great Underground Empire
	(c) Copyright 1983 Infocom, Inc. All Rights Reserved."

<DIRECTIONS NORTH EAST WEST SOUTH NE NW SE SW UP DOWN IN OUT LAND>

<GLOBAL SCORE-MAX 350>

"SUBTITLE OBJECTS"

<OBJECT GAS
        (IN LOCAL-GLOBALS)
        (SYNONYM GAS GASOLINE PETROL)
        (DESC "Gasoline")
        (FLAGS NDESCBIT)>


<OBJECT ED
        (IN SANDY-BEACH)
        (SYNONYM ED ANGER COLUMNIST)
        (ADJECTIVE ED ANGRY CONSERVATIVE)
        (DESC "Ed Anger")
        (ACTION ED-FCN)
        (FLAGS ACTORBIT)
        (TEXT
"Ed says, 'I'm madder than a hog in a hottub at those prancing pharoahs of
fashion who have suddenly decreed that white socks are 'in' for men. This
red-blooded American has been wearing white socks since for as long as he can
remember. It'll be a cold day in hell before I let some French sissy tell me
how to dress, dammit! No real man needs some idiot with manicured nails and
blow-dried hair telling him what to do! Let's face it, wearing hair-do's
and worrying about clothes is for sissy women. Us real men should be doing more
important things like running the country, and shooting guns!'")>


<OBJECT GARLIC
	(IN SANDWICH-BAG)
	(SYNONYM FART)
	(DESC "small fart")
	(FLAGS TAKEBIT FOODBIT)
	(ACTION GARLIC-F)>
        (TEXT "You must be pretty weird to want to examine a fart!")

<OBJECT JADE
	(IN BAT-ROOM)
	(SYNONYM RECORD HITS COPY ALBUM)
	(ADJECTIVE ELVIS FLATHEAD GREATEST HITS)
	(DESC "Elvis album")
	(FLAGS TAKEBIT)
	(LDESC "There is a copy of Elvis Flathead's greatest hits here.")
	(SIZE 10)
	(VALUE 5)
	(TVALUE 5)>

<OBJECT INFLATED-BOAT
	(SYNONYM CAR AUTO AUTOMO VEHICLE)
	(ADJECTIVE SHINY NEW AUTO)
	(DESC "shiny autombile")
	(FLAGS TRYTAKEBIT BURNBIT VEHBIT OPENBIT SEARCHBIT)
	(ACTION RBOAT-FUNCTION)
	(CAPACITY 100)
	(SIZE 20)
	(VTYPE NONLANDBIT)>
        (TEXT "The automobile looks shiny and new. It seems to be a 1984
Cadillac Capris, shiny and black. The interior upholstery is of the finest
grade leather. A voice inside the car seems to be panting in a soft, soothing
tone.")


<OBJECT PUNCTURED-BOAT
	(SYNONYM CAR AUTO AUTOMOBILE VEHICLE)
	(ADJECTIVE SMASHED BROKEN YUCKED)
	(DESC "yucked-up car")
	(FLAGS TRYTAKEBIT BURNBIT)
	(ACTION DBOAT-FUNCTION)
	(SIZE 20)>
        (TEXT "This car is so yucked up that you can hardly recognize it as
your previous Cadillac Capris, shiny and new. Now it looks like a cross
between a Pinto and an erupting volcano.")

<OBJECT INFLATABLE-BOAT
	(IN DAM-BASE)
	(SYNONYM CAR AUTO AUTOMO VEHICLE)
	(ADJECTIVE SHINY AUTO NEW)
	(DESC "somewhat out-of-gas car")
	(FLAGS TRYTAKEBIT BURNBIT)
	(ACTION IBOAT-FUNCTION)
	(LDESC
"There is a somewhat out-of-gas car here. The car, angered and distraught that
it should be left without fuel, has insolently locked all of the doors and
closed all of its windows.")
	(SIZE 20)>

<OBJECT RIVER
	(IN LOCAL-GLOBALS)
	(DESC "Santa Monica freeway")
	(SYNONYM FREEWAY HIGHWAY WAY STREET)
	(ADJECTIVE HIGH FREE SANTA MONICA)
	(ACTION RIVER-FUNCTION)
	(FLAGS NDESCBIT)>

<OBJECT BUOY
	(IN RIVER-4)
	(SYNONYM CAT ANIMAL)
	(ADJECTIVE DEAD BLOODY)
	(DESC "dead cat")
	(FLAGS TAKEBIT CONTBIT)
	(FDESC "There is a dead cat, lying in a pool of blood, here.")
	(CAPACITY 20)
	(SIZE 10)
	(ACTION TREASURE-INSIDE)>
        (TEXT "The dead cat is in several peices. There seems to be something
pumping inside of it though. Maybe you could reach it.")

<ROUTINE TREASURE-INSIDE ()
	 <COND (<VERB? OPEN>
		<SCORE-OBJ ,EMERALD>
		<RFALSE>)>>

<OBJECT BOAT-LABEL
	(IN INFLATED-BOAT)
	(SYNONYM LABEL FINEPRINT PRINT)
	(ADJECTIVE TAN FINE)
	(DESC "tan label")
	(FLAGS READBIT TAKEBIT BURNBIT)
	(SIZE 2)
	(TEXT
"	  !!!! 	HONDA MAGIC CAR COMPANY  !!!!|
|
Hello, Driver|
|
Instructions for use:|
|
   To get onto the freeway, say \"Drive\".|
   To get to an exit ramp, say the direction in which you want
to maneuver the car.|
|
Warranty:|
|
  This car is guaranteed against all defects for a period of 76
milliseconds from date of purchase or until first used, whichever comes first.|
|
Warning:|
   This car has is very sensitive to insults, and has a very bad temper.|
   Good Luck!|
" )>


<OBJECT TEETH
	(IN GLOBAL-OBJECTS)
	(SYNONYM OVERBOARD TEETH)
	(DESC "set of teeth")
	(FLAGS NDESCBIT)
	(ACTION TEETH-F)>

<OBJECT WALL
	(IN GLOBAL-OBJECTS)
	(SYNONYM WALL WALLS)
	(ADJECTIVE SURROUNDING)
	(DESC "surrounding wall")>
        
<OBJECT GRANITE-WALL
	(IN GLOBAL-OBJECTS)
	(SYNONYM WALL)
	(ADJECTIVE GRANITE)
	(DESC "granite wall")
	(ACTION GRANITE-WALL-F)>

<OBJECT SONGBIRD
	(IN LOCAL-GLOBALS)
	(SYNONYM SIREN AMBULANCE)
	(ADJECTIVE LOUD)
	(DESC "loud siren of an ambulance")
	(FLAGS NDESCBIT)
	(ACTION SONGBIRD-F)>

<OBJECT WHITE-HOUSE	
	(IN LOCAL-GLOBALS)
	(SYNONYM TERMINAL)
	(ADJECTIVE CEMENT LARGE GREYHOUND)
	(DESC "large Greyhound terminal")
	(FLAGS NDESCBIT)
	(ACTION WHITE-HOUSE-F)>

<OBJECT GLOBAL-WATER
	(IN LOCAL-GLOBALS)
	(SYNONYM WATER)
	(DESC "water")
	(FLAGS DRINKBIT)
	(ACTION WATER-F)>

<OBJECT WATER
	(IN BOTTLE)
	(SYNONYM VODKA LIQUID QUANTITY)
	(DESC "quantity of vodka")
	(FLAGS TRYTAKEBIT TAKEBIT DRINKBIT)
	(ACTION WATER-F)
	(SIZE 4)>

<OBJECT	KITCHEN-WINDOW
	(IN LOCAL-GLOBALS)
	(SYNONYM DOOR)
	(ADJECTIVE GLASS SHINY)
	(DESC "shiny glass door")
	(FLAGS DOORBIT NDESCBIT)
	(ACTION KITCHEN-WINDOW-F)>

<OBJECT CHIMNEY
	(IN LOCAL-GLOBALS)
	(SYNONYM DROP MAIL)
	(ADJECTIVE MAIL)
	(DESC "mail drop")
	(FLAGS CLIMBBIT NDESCBIT)>

<OBJECT GHOSTS
	(IN ENTRANCE-TO-HADES)
	(SYNONYM GHOSTS SPIRITS FIENDS FORCE)
	(ADJECTIVE INVISIBLE EVIL)
	(DESC "number of ghosts")
	(FLAGS ACTORBIT NDESCBIT)
	(ACTION GHOSTS-F)>

<OBJECT SKULL
	(IN LAND-OF-LIVING-DEAD)
	(SYNONYM WEIGHT PAPERW)
	(ADJECTIVE PAPER RAINBO COLORE)
	(DESC "rainbow-colored paperweight")
	(FDESC
"Lying in one corner of the room is a glowing, psychadelic paperweight,
radiating all colors of the rainbow.")
	(FLAGS TAKEBIT)
	(VALUE 10)
	(TVALUE 10)>

<OBJECT LOWERED-BASKET
	(IN LOWER-SHAFT)
	(SYNONYM MOTOTRC CYCLE BIKE)
	(ADJECTIVE MOTOR EVIL'S)
	(LDESC "Evil tears out of the tunnel at top speed. When he sees you he locks up the brakes and skids to a halt.")
	(DESC "very small motorcycle")
	(FLAGS TRYTAKEBIT)
	(ACTION BASKET-F)>

<OBJECT RAISED-BASKET
	(IN SHAFT-ROOM)
	(SYNONYM MOTORC CYCLE BIKE)
	(ADJECTIVE SMALL EVIL'S MOTOR)
        (DESC "very small motorcycle")
	(FLAGS TRANSBIT TRYTAKEBIT CONTBIT OPENBIT)
	(ACTION BASKET-F)
	(LDESC "This is the coolest, smallest motorcycle you have ever seen.")
	(CAPACITY 50)>

<OBJECT LUNCH
	(IN SANDWICH-BAG)
	(SYNONYM COCAINE POWDER COKE PILE)
	(ADJECTIVE WHITE)
	(DESC "pile of white powder")
	(FLAGS TAKEBIT FOODBIT)
	(LDESC "A pile of suspicious-looking white powder is here.")>
        (ACTION COKE-FCN)
        (TEXT "This suspicious pile closely resembles some sort of highly
effective stimulant-drug. Cocaine, maybe. (obviously)")


<OBJECT BAT
	(IN BAT-ROOM)
	(SYNONYM DOORMAN MAN)
	(ADJECTIVE DOOR DERANGED)
	(DESC "deranged doorman")
	(FLAGS ACTORBIT TRYTAKEBIT)
	(DESCFCN BAT-D)
	(ACTION BAT-F)>

<OBJECT BELL
	(IN NORTH-TEMPLE)
	(SYNONYM BELL)
	(ADJECTIVE SMALL BRASS)
	(DESC "brass bell")
	(FLAGS TAKEBIT)
	(ACTION BELL-F)>

<OBJECT HOT-BELL
	(SYNONYM BELL)
	(ADJECTIVE BRASS HOT RED SMALL)
	(DESC "red hot brass bell")
	(FLAGS TRYTAKEBIT)
	(ACTION HOT-BELL-F)
	(LDESC "On the ground is a red hot bell.")>

<OBJECT AXE
	(IN TROLL)
	(SYNONYM FISH HERRING)
	(ADJECTIVE NASTY NASTY- RED BLOODY)
	(DESC "nasty-looking fish")
	(FLAGS WEAPONBIT TRYTAKEBIT TAKEBIT NDESCBIT)
	(ACTION AXE-F)
	(SIZE 25)>

<OBJECT BOLT
	(IN DAM-ROOM)
	(SYNONYM BOLT NUT)
	(ADJECTIVE METAL LARGE)
	(DESC "bolt")
	(FLAGS NDESCBIT TURNBIT TRYTAKEBIT)
	(ACTION BOLT-F)>

<OBJECT BUBBLE
	(IN DAM-ROOM)
	(SYNONYM BUBBLE)
	(ADJECTIVE SMALL GREEN PLASTIC)
	(DESC "green bubble")
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION BUBBLE-F)>

<OBJECT ALTAR
	(IN SOUTH-TEMPLE)
	(SYNONYM ALTAR)
	(DESC "altar")
	(FLAGS NDESCBIT SURFACEBIT CONTBIT OPENBIT)
	(CAPACITY 50)>

<OBJECT BOOK
	(IN ALTAR)
	(SYNONYM BOOK PRAYER PAGE BOOKS)
	(ADJECTIVE LARGE BLACK)
	(DESC "black book")
	(FLAGS READBIT TAKEBIT CONTBIT BURNBIT TURNBIT)
	(ACTION BLACK-BOOK)
	(FDESC "On the altar is a large black book, open to page 569.")
	(SIZE 10)
	(TEXT
"Commandment 12592|
|
Oh ye who go about saying unto each:  \"Go screw\"|
Dost thou know the magnitude of thy sin before the gods?|
Yea, verily, thou shalt be ground between two pebbles.|
Shall the angry gods cast thy body into the puddle?|
Surely, thy eye shall be put out with a blunt twig!|
Even unto the ends of Frobville shalt thou wander and|
Unto the bum's wretched flat shalt thou be sent at last.|
Surely thou shalt repent of thy cunning." )>

<OBJECT BROKEN-LAMP
	(SYNONYM LAMP LANTERN)
	(ADJECTIVE BROKEN)
	(DESC "broken lantern")
	(FLAGS TAKEBIT)>

<OBJECT SCEPTRE
	(IN COFFIN)
	(SYNONYM SCEPTRE SCEPTER TREASURE)
	(ADJECTIVE SHARP EGYPTIAN ANCIENT ENAMELED)
	(DESC "sceptre")
	(FLAGS TAKEBIT WEAPONBIT)
	(ACTION SCEPTRE-FUNCTION)
	(LDESC
"An ornamented sceptre, tapering to a sharp point, is here.")
	(FDESC
"A sceptre, possibly that of ancient Egypt itself, is in the coffin. The
sceptre is ornamented with colored enamel, and tapers to a sharp point.")
	(SIZE 3)
	(VALUE 4)
	(TVALUE 6)>

<OBJECT TIMBERS
	(IN TIMBER-ROOM)
	(SYNONYM TIMBERS PILE)
	(ADJECTIVE WOODEN BROKEN)
	(DESC "broken timber")
	(FLAGS TAKEBIT)
	(SIZE 50)>

<OBJECT	SLIDE
	(IN LOCAL-GLOBALS)
	(SYNONYM CHUTE RAMP SLIDE)
	(ADJECTIVE STEEP METAL TWISTING)
	(DESC "chute")
	(FLAGS CLIMBBIT)
	(ACTION SLIDE-FUNCTION)>

<OBJECT KITCHEN-TABLE
	(IN KITCHEN)
	(SYNONYM COUNTER)
	(ADJECTIVE TICKET)
	(DESC "ticket counter")
	(FLAGS NDESCBIT CONTBIT OPENBIT SURFACEBIT)
	(CAPACITY 50)>

<OBJECT ATTIC-TABLE
	(IN ATTIC)
	(SYNONYM TABLE)
	(DESC "table")
	(FLAGS NDESCBIT CONTBIT OPENBIT SURFACEBIT)
	(CAPACITY 40)>

<OBJECT SANDWICH-BAG
	(IN CLIFF-MIDDLE)
	(SYNONYM BAG BAGGIE)
	(ADJECTIVE PLASTIC)
	(DESC "plastic baggie")
	(FLAGS TAKEBIT CONTBIT BURNBIT)
	(FDESC
"Among the trash and debris is a small plastic baggie.")
	(CAPACITY 15)
	(SIZE 3)
	(ACTION SANDWICH-BAG-FCN)>

<OBJECT TOOL-CHEST
	(IN MAINTENANCE-ROOM)
	(SYNONYM CHEST CHESTS GROUP TOOLCHESTS)
	(ADJECTIVE TOOL)
	(DESC "group of tool chests")
	(FLAGS CONTBIT OPENBIT TRYTAKEBIT SACREDBIT)
	(ACTION TOOL-CHEST-FCN)>

<OBJECT YELLOW-BUTTON
	(IN MAINTENANCE-ROOM)
	(SYNONYM BUTTON SWITCH)
	(ADJECTIVE YELLOW)
	(DESC "yellow button")
	(FLAGS NDESCBIT)
	(ACTION BUTTON-F)>

<OBJECT BROWN-BUTTON
	(IN MAINTENANCE-ROOM)
	(SYNONYM BUTTON SWITCH)
	(ADJECTIVE BROWN)
	(DESC "brown button")
	(FLAGS NDESCBIT)
	(ACTION BUTTON-F)>

<OBJECT RED-BUTTON
	(IN MAINTENANCE-ROOM)
	(SYNONYM BUTTON SWITCH)
	(ADJECTIVE RED)
	(DESC "red button")
	(FLAGS NDESCBIT)
	(ACTION BUTTON-F)>

<OBJECT BLUE-BUTTON
	(IN MAINTENANCE-ROOM)
	(SYNONYM BUTTON SWITCH)
	(ADJECTIVE BLUE)
	(DESC "blue button")
	(FLAGS NDESCBIT)
	(ACTION BUTTON-F)>

<OBJECT TROPHY-CASE	;"first obj so L.R. desc looks right."
	(IN STUDIO)
	(SYNONYM TOILET)
	(ADJECTIVE PORCELAIN)
	(DESC "porcelain toilet")
	(FLAGS TRANSBIT CONTBIT NDESCBIT TRYTAKEBIT SEARCHBIT)
	(ACTION TROPHY-CASE-FCN)
	(CAPACITY 10000)>

<OBJECT CHALICE
	(IN TREASURE-ROOM)
	(SYNONYM CHALICE CUP SILVER TREASURE)
	(ADJECTIVE SILVER ENGRAVINGS) ;"engravings exists..."
	(DESC "chalice")
	(FLAGS TAKEBIT TRYTAKEBIT CONTBIT)
	(ACTION CHALICE-FCN)
	(LDESC "There is a silver chalice, intricately engraved, here.")
	(CAPACITY 5)
	(SIZE 10)
	(VALUE 10)
	(TVALUE 5)>

<OBJECT TRIDENT
	(IN ATLANTIS-ROOM)
	(SYNONYM TRIDENT FORK TREASURE)
	(ADJECTIVE POSEIDON OWN CRYSTAL)
	(DESC "crystal trident")
	(FLAGS TAKEBIT)
	(FDESC "On the shore lies Poseidon's own crystal trident.")
	(SIZE 20)
	(VALUE 4)
	(TVALUE 11)>

<OBJECT CYCLOPS
	(IN MOUNTAINS)
	(SYNONYM PROPRIETOR SALESMAN CLERK MAN)
	(ADJECTIVE CHEESE SHOP)
	(DESC "cheese shop proprietor")
	(FLAGS ACTORBIT NDESCBIT TRYTAKEBIT)
	(ACTION CYCLOPS-FCN)
	(STRENGTH 10000)>

<OBJECT DAM
	(IN DAM-ROOM)
	(SYNONYM DAM GATE GATES)
	(DESC "dam")
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION DAM-FUNCTION)>

<OBJECT TRAP-DOOR
	(IN GRATING-CLEARING)
	(SYNONYM MANHOLE COVER HOLE)
	(ADJECTIVE MAN MANHOLE)
	(DESC "manhole")
	(FLAGS DOORBIT NDESCBIT INVISIBLE)
	(ACTION TRAP-DOOR-FCN)>

<OBJECT BOTTLE
	(IN NORTH-OF-HOUSE)
	(SYNONYM BOTTLE CONTAINER)
	(ADJECTIVE CLEAR GLASS)
	(DESC "glass bottle")
	(FLAGS TAKEBIT TRANSBIT CONTBIT)
	(ACTION BOTTLE-FUNCTION)
	(FDESC "A bottle is sitting in the lot, precariously close to a
huge parking block.")
	(CAPACITY 4)>

<OBJECT CRACK
	(IN LOCAL-GLOBALS)
	(SYNONYM CRACK)
	(ADJECTIVE NARROW)
	(DESC "crack")
	(FLAGS NDESCBIT)
	(ACTION CRACK-FCN)>

<OBJECT COFFIN
	(IN EGYPT-ROOM)
	(SYNONYM COFFIN CASKET TREASURE)
	(ADJECTIVE SOLID GOLD)
	(DESC "gold coffin")
	(FLAGS TAKEBIT CONTBIT SACREDBIT SEARCHBIT)
	(LDESC
"The solid-gold coffin used for the burial of Ramses II is here.")
	(CAPACITY 35)
	(SIZE 55)
	(VALUE 10)
	(TVALUE 15)>

<OBJECT PUMP
	(IN DAM-BASE)
	(SYNONYM PUMP GAS-PUMP)
	(ADJECTIVE GAS LARGE ARCO)
	(DESC "Arco gas-pump")
	(FLAGS TRYTAKEBIT TOOLBIT)>

<OBJECT DIAMOND
	(SYNONYM DIAMOND TREASURE)
	(ADJECTIVE HUGE ENORMOUS)
	(DESC "huge diamond")
	(FLAGS TAKEBIT)
	(LDESC "There is an enormous diamond (perfectly cut) here.")
	(VALUE 10)
	(TVALUE 10)>

<OBJECT KNIFE
	(IN ATTIC-TABLE)
	(SYNONYM BATTLE BURGER)
	(ADJECTIVE BATTLE)
	(DESC "battle burger")
	(FLAGS TAKEBIT WEAPONBIT TRYTAKEBIT)
	(FDESC "On the table is a nasty-looking battle burger.")
	(LDESC "There is a nasty-looking battle burger here.")
        (ACTION KNIFE-F)>
        (TEXT "This is a battle burger of the finest workmanship. The meat has
been sharpened and honed into a fine, sharp blade. The highly acidic mustard
is the result of the hybridization between Dijon and Hydrochloric acid. The
ketchup has been crafted into a fine poison, using over three hundred roots
and berries (all from your back yard). Even the pickles are highly explosive,
assuring even the most cautious user of complete destruction of any creature
once he's been hit by the burger. And the plastique cheese has a reputation
bettered only by the SS-20 thermonuclear warhead.")


<OBJECT BONES
	(IN MAZE-5)
	(SYNONYM BONES SKELETON BODY)
        (DESC "skeleton")
	(FLAGS TRYTAKEBIT NDESCBIT)
	(ACTION SKELETON)>

<OBJECT BURNED-OUT-LANTERN
	(IN MAZE-5)
	(SYNONYM LANTERN LAMP)
	(ADJECTIVE RUSTY BURNED DEAD USELESS)
	(DESC "burned-out lantern")
	(FLAGS TAKEBIT)
	(FDESC "The deceased adventurer's useless lantern is here.")
	(SIZE 20)>

<OBJECT BAG-OF-COINS
	(IN MAZE-5)
	(SYNONYM BAG COINS TREASURE)
	(ADJECTIVE OLD LEATHER)
	(DESC "leather bag of coins")
	(FLAGS TAKEBIT)
	(LDESC "An old leather bag, bulging with coins, is here.")
	(ACTION BAG-OF-COINS-F)
	(SIZE 15)
	(VALUE 10)
	(TVALUE 5)>

<OBJECT LAMP
	(IN PLAYER)
	(SYNONYM STICK LIGHTSTICK)
	(ADJECTIVE GREEN LIGHT)
	(DESC "green lightstick")
	(FLAGS TAKEBIT LIGHTBIT)
	(ACTION LANTERN)
	(FDESC "There is a green-glowing lightstick, sitting among the refuse.")
	(LDESC "There is a lightstick, emanating green light, here.")
	(SIZE 15)>

<OBJECT EMERALD
	(IN BUOY)
	(SYNONYM EMERALD TREASURE)
	(ADJECTIVE LARGE)
	(DESC "large emerald")
	(FLAGS TAKEBIT)
	(VALUE 5)
	(TVALUE 10)>

<OBJECT ADVERTISEMENT
	(IN MAILBOX)
	(SYNONYM BOMB)
	(ADJECTIVE BLACK LARGE)
	(DESC "large bomb")
	(FLAGS TAKEBIT BURNBIT)
	(LDESC "A large bomb is sitting on the ground.")
	(SIZE 40)>

<OBJECT LEAK
	(IN MAINTENANCE-ROOM)
	(SYNONYM LEAK DRIP PIPE)
	(DESC "leak")
	(FLAGS NDESCBIT INVISIBLE)
	(ACTION LEAK-FUNCTION)>

<OBJECT MACHINE
	(IN MACHINE-ROOM)
	(SYNONYM MACHINE PDP10 DRYER LID)
	(DESC "machine")
	(FLAGS CONTBIT NDESCBIT TRYTAKEBIT)
	(ACTION MACHINE-F)
	(CAPACITY 50)>

<OBJECT MAILBOX
	(IN WEST-OF-HOUSE)
	(SYNONYM MAILBOX BOX)
	(ADJECTIVE SMALL)
	(DESC "small mailbox")
	(FLAGS CONTBIT TRYTAKEBIT)
	(CAPACITY 45)
	(ACTION MAILBOX-F)>

<OBJECT MATCH
	(IN DAM-LOBBY)
	(SYNONYM MATCH MATCHES MATCHBOOK)
	(ADJECTIVE MATCH)
	(DESC "matchbook")
	(FLAGS READBIT TAKEBIT)
	(ACTION MATCH-FUNCTION)
	(LDESC
"There is a matchbook whose cover says \"Visit Beautiful FCD3\" here.")
	(SIZE 2)
	(TEXT
"|
(Close cover before striking)|
|
YOU too can make BIG MONEY in the exciting field of PAPER SHUFFLING!|
|
Mr. Anderson of Muddle, Mass. says: \"Before I took this course I
was a lowly bit twiddler. Now with what I learned at GUE Tech
I feel really important and can obfuscate and confuse with the best.\"|
|
Dr. Blank had this to say: \"Ten short days ago all I could look
forward to was a dead-end job as a doctor. Now I have a promising
future and make really big Zorkmids.\"|
|
GUE Tech can't promise these fantastic results to everyone. But when
you earn your degree from GUE Tech, your future will be brighter.|" )>

<OBJECT MIRROR-2
	(IN MIRROR-ROOM-2)
	(SYNONYM REFLECTION MIRROR ENORMOUS)
	(DESC "mirror")
	(FLAGS TRYTAKEBIT NDESCBIT)
	(ACTION MIRROR-MIRROR)>

<OBJECT MIRROR-1
	(IN MIRROR-ROOM-1)
	(SYNONYM REFLECTION MIRROR ENORMOUS)
	(DESC "mirror")
	(FLAGS TRYTAKEBIT NDESCBIT)
	(ACTION MIRROR-MIRROR)>

<OBJECT PAINTING
	(IN DAMP-CAVE)
	(SYNONYM POSTER PICTURE)
	(ADJECTIVE ROCK WILD FROBLESS BANSHEES)
	(DESC "rock poster")
	(FLAGS TAKEBIT BURNBIT)
	(ACTION PAINTING-FCN)
	(FDESC
"Fortunately, there is still one chance for you to be a punker, for on
the far wall is a rock poster depicting the Wild Frobless Banshees.")
	(LDESC "A rock poster depicting the Wild Frobless Banshees is here.")
	(SIZE 15)
	(VALUE 4)
	(TVALUE 6)>

<OBJECT CANDLES
	(IN SOUTH-TEMPLE)
	(SYNONYM CANDLES PAIR)
	(ADJECTIVE BURNING)
	(DESC "pair of candles")
	(FLAGS TAKEBIT FLAMEBIT ONBIT LIGHTBIT)
	(ACTION CANDLES-FCN)
	(FDESC "On the two ends of the altar are burning candles.")
	(SIZE 10)>

<OBJECT BODIES
	(IN LOCAL-GLOBALS)
	(SYNONYM BODIES BODY REMAINS PILE)
	(ADJECTIVE MANGLED)
	(DESC "pile of bodies")
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION BODY-FUNCTION)>

<OBJECT LEAVES
	(IN GRATING-CLEARING)
	(SYNONYM HAIR PILE)
	(DESC "pile of hair")
	(FLAGS TAKEBIT BURNBIT TRYTAKEBIT)
	(ACTION LEAF-PILE)
	(LDESC "On the ground is a pile of hair.")
	(SIZE 25)>

<OBJECT BAR
	(IN LOUD-ROOM)
	(SYNONYM BAR PLATINUM TREASURE)
	(ADJECTIVE PLATINUM LARGE)
	(DESC "platinum bar")
	(FLAGS TAKEBIT SACREDBIT)
	(LDESC "On the ground is a large platinum bar.")
	(SIZE 20)
	(VALUE 10)
	(TVALUE 5)>

<OBJECT POT-OF-GOLD
	(IN END-OF-RAINBOW)
	(SYNONYM POT GOLD TREASURE)
	(ADJECTIVE GOLD)
	(DESC "pot of gold")
	(FLAGS TAKEBIT INVISIBLE)
	(FDESC "At the end of the rainbow is a pot of gold.")
	(SIZE 15)
	(VALUE 10)
	(TVALUE 10)>

<OBJECT PRAYER
	(IN NORTH-TEMPLE)
	(SYNONYM PRAYER INSCRIPTION)
	(ADJECTIVE ANCIENT OLD)
	(DESC "prayer")
	(FLAGS READBIT SACREDBIT NDESCBIT)
	(TEXT
"The prayer is inscribed in an ancient script, rarely used today. It seems
to be a philippic against small insects, absent-mindedness, and the picking
up and dropping of small objects. The final verse consigns trespassers to
the land of the dead. All evidence indicates that the beliefs of the ancient
Zorkers were obscure." )>

<OBJECT RAILING
	(IN DOME-ROOM)
	(SYNONYM RAILING RAIL)
	(ADJECTIVE WOODEN)
	(DESC "wooden railing")
	(FLAGS NDESCBIT)>

<OBJECT RAINBOW
	(IN LOCAL-GLOBALS)
	(SYNONYM RAINBOW)
	(DESC "rainbow")
	(FLAGS NDESCBIT CLIMBBIT)
	(ACTION RAINBOW-FCN)>

<OBJECT ROPE
	(IN CANYON-BOTTOM)
	(SYNONYM BALL TWINE STRING)
	(ADJECTIVE STRING TWINE)
	(DESC "ball of twine")
	(FLAGS TAKEBIT SACREDBIT TRYTAKEBIT)
	(ACTION ROPE-FUNCTION)
	(FDESC "A ball of twine is sitting here, among the ashes.")
	(SIZE 10)>

<OBJECT RUSTY-KNIFE
	(IN MAZE-5)
	(SYNONYM KNIVES KNIFE)
	(ADJECTIVE RUSTY)
	(DESC "rusty knife")
	(FLAGS TAKEBIT TRYTAKEBIT WEAPONBIT TOOLBIT)
	(ACTION RUSTY-KNIFE-FCN)
	(FDESC "Beside the skeleton is a rusty knife.")
	(SIZE 20)>

<OBJECT SAND
	(IN SANDY-CAVE)
	(SYNONYM SAND)
	(DESC "sand")
	(FLAGS NDESCBIT)
	(ACTION SAND-FUNCTION)>

<OBJECT BRACELET
	(IN GAS-ROOM)
	(SYNONYM EDITION INFODOPE DOPE RAG)
	(ADJECTIVE INFO LATEST)
	(DESC "copy of the latest edition of InfoDope")
	(FLAGS TAKEBIT)
	(SIZE 10)
	(VALUE 5)
	(TVALUE 5)>

<OBJECT SCREWDRIVER
	(IN MAINTENANCE-ROOM)
	(SYNONYM SCREWDRIVER TOOL TOOLS DRIVER)
	(ADJECTIVE SCREW)
	(DESC "screwdriver")
	(FLAGS TAKEBIT TOOLBIT)>

<OBJECT KEYS
	(IN MAZE-5)
	(SYNONYM KEY)
	(ADJECTIVE SKELETON)
	(DESC "skeleton key")
	(FLAGS TAKEBIT TOOLBIT)
	(SIZE 10)>

<OBJECT SHOVEL
	(IN SANDY-BEACH)
	(SYNONYM SHOVEL TOOL TOOLS)
	(DESC "shovel")
	(FLAGS TAKEBIT TOOLBIT)
	(SIZE 15)>

<OBJECT COAL
	(IN DEAD-END-5)
	(SYNONYM EVIL COAL PILE HEAP)
	(ADJECTIVE SMALL)
	(DESC "There is a small man, about 10-inches tall, dressed in red, white and blue leathers with lots of long fringe.")
	(FLAGS TAKEBIT BURNBIT)
	(SIZE 20)>

<OBJECT LADDER
	(IN LOCAL-GLOBALS)
	(SYNONYM LADDER)
	(ADJECTIVE WOODEN RICKETY NARROW)
	(DESC "wooden ladder")
	(FLAGS NDESCBIT CLIMBBIT)>

<OBJECT SCARAB
	(IN SANDY-CAVE)
	(SYNONYM SCARAB BUG BEETLE TREASURE)
	(ADJECTIVE BEAUTI CARVED JEWELED)
	(DESC "beautiful jeweled scarab")
	(FLAGS TAKEBIT INVISIBLE)
	(SIZE 8)
	(VALUE 5)
	(TVALUE 5)>

<OBJECT LARGE-BAG
	(IN THIEF)
	(SYNONYM BAG)
	(ADJECTIVE LARGE THIEFS)
	(DESC "large bag")
	(ACTION LARGE-BAG-F)
	(FLAGS TRYTAKEBIT NDESCBIT)>  

<OBJECT STILETTO
	(IN THIEF)
	(SYNONYM STILETTO)
	(ADJECTIVE VICIOUS)
	(DESC "stiletto")
	(ACTION STILETTO-FUNCTION)
	(FLAGS WEAPONBIT TRYTAKEBIT TAKEBIT NDESCBIT)
	(SIZE 10)>

<OBJECT MACHINE-SWITCH
	(IN MACHINE-ROOM)
	(SYNONYM SWITCH)
	(DESC "switch")
	(FLAGS NDESCBIT TURNBIT)
	(ACTION MSWITCH-FUNCTION)>

<OBJECT SWORD
	(IN LIVING-ROOM)
	(SYNONYM PILLOW CUSHION)
	(ADJECTIVE BIG FLUFFY ELVEN)
	(DESC "pillow")
	(LDESC "There is a fluffy, elven pillow of the highest workmanship
here.")
        (FLAGS TAKEBIT WEAPONBIT TRYTAKEBIT)
	(ACTION SWORD-FCN)
	(SIZE 30)
	(TVALUE 0)>

<OBJECT MAP
	(IN TROPHY-CASE)
	(SYNONYM PARCHMENT MAP)
	(ADJECTIVE ANTIQUE OLD ANCIENT)
	(DESC "ancient map")
	(FLAGS INVISIBLE READBIT TAKEBIT)
	(FDESC
"In the trophy case is an ancient parchment which appears to be a map.")
	(SIZE 2)
	(TEXT
"The map shows a forest with three clearings. The largest clearing contains
a house. Three paths leave the large clearing. One of these paths, leading
southwest, is marked \"To Stone Barrow\".")>

<OBJECT THIEF
	(IN ROUND-ROOM)
	(SYNONYM THIEF ROBBER CRIMINAL INDIVIDUAL)
	(ADJECTIVE SHADY SUSPICIOUS SEEDY)
	(DESC "thief")
	(FLAGS ACTORBIT INVISIBLE CONTBIT OPENBIT TRYTAKEBIT)
	(ACTION ROBBER-FUNCTION)
	(LDESC
"There is a suspicious-looking individual, holding a large bag, leaning
against one wall. He is armed with a deadly stiletto.")
	(STRENGTH 5)>

<OBJECT PEDESTAL
	(IN TORCH-ROOM)
	(SYNONYM PEDESTAL)
	(ADJECTIVE WHITE MARBLE)
	(DESC "pedestal")
	(FLAGS NDESCBIT CONTBIT OPENBIT SURFACEBIT)
	(ACTION DUMB-CONTAINER)
	(CAPACITY 30)>

<OBJECT TORCH
	(IN PEDESTAL)
	(SYNONYM TORCH IVORY TREASURE)
	(ADJECTIVE FLAMING IVORY)
	(DESC "torch")
	(FLAGS TAKEBIT FLAMEBIT ONBIT LIGHTBIT)
	(ACTION TORCH-OBJECT)
	(FDESC "Sitting on the pedestal is a flaming torch, made of ivory.")
	(SIZE 20)
	(VALUE 14)
	(TVALUE 6)>

<OBJECT GUIDE
	(IN DAM-LOBBY)
	(SYNONYM GUIDE BOOK BOOKS GUIDEBOOKS)
	(ADJECTIVE TOUR GUIDE)
	(DESC "tour guidebook")
	(FLAGS READBIT TAKEBIT BURNBIT)
	(FDESC
"Some guidebooks entitled \"Flood Control Dam #3\" are on the reception
desk.")
	(TEXT
"\"	Flood Control Dam 3|
|
FCD3 was constructed in year 783 of the Great Underground Empire to
harness the mighty Frigid River. This work was supported by a grant of
37 million zorkmids from your omnipotent local tyrant Lord Dimwit
Flathead the Excessive. This impressive structure is composed of
370,000 cubic feet of concrete, is 256 feet tall at the center, and 193
feet wide at the top. The lake created behind the dam has a volume
of 1.7 billion cubic feet, an area of 12 million square feet, and a
shore line of 36 thousand feet.|
|
We will now point out some of the more interesting features
of FCD3 as we conduct you on a guided tour of the facilities:|
        1) You start your tour here in the Dam Lobby. You will notice
on your right that...." )>

;"  The construction of FCD3 took 112 days from ground breaking to
the dedication. It required a work force of 384 slaves, 34 slave
drivers, 12 engineers, 2 turtle doves, and a partridge in a pear
tree. The work was managed by a command team composed of 2345
bureaucrats, 2347 secretaries (at least two of whom can type),
12,256 paper shufflers, 52,469 rubber stampers, 245,193 red tape
processors, and nearly one million dead trees.|"

<OBJECT TROLL
	(IN TROLL-ROOM)
	(SYNONYM MUGGER)
	(ADJECTIVE NASTY MEAN BIG)
	(DESC "mugger")
	(FLAGS ACTORBIT OPENBIT TRYTAKEBIT)
	(ACTION TROLL-FCN)
	(LDESC
"A mean and nasty mugger has stepped into your path. It doesn't look like he'll
let you leave this area without leaving your money with him.")
	(STRENGTH 2)>

<OBJECT TRUNK
	(IN RESERVOIR)
	(SYNONYM TRUNK CHEST JEWELS TREASURE)
	(ADJECTIVE OLD)
	(DESC "trunk of jewels")
	(FLAGS TAKEBIT INVISIBLE)
	(FDESC
"Lying half buried in the mud is an old trunk, bulging with jewels.")
	(LDESC "There is an old trunk here, bulging with assorted jewels.")
	(ACTION TRUNK-F)
	(SIZE 35)
	(VALUE 15)
	(TVALUE 5)>

<OBJECT TUBE
	(IN MAINTENANCE-ROOM)
	(SYNONYM TUBE TOOTH PASTE)
	(DESC "tube")
	(FLAGS TAKEBIT CONTBIT READBIT)
	(ACTION TUBE-FUNCTION)
	(LDESC
	 "There is an object which looks like a tube of toothpaste here.")
	(CAPACITY 7)
	(SIZE 5)
	(TEXT
"---> Frobozz Magic Gunk Company <---|
	  All-Purpose Gunk")>

<OBJECT PUTTY
	(IN TUBE)
	(SYNONYM MATERIAL GUNK)
	(ADJECTIVE VISCOUS)
	(DESC "viscous material")
	(FLAGS TAKEBIT TOOLBIT)
	(SIZE 6)
	(ACTION PUTTY-FCN)>

<OBJECT ENGRAVINGS
	(IN ENGRAVINGS-CAVE)
	(SYNONYM WALL ENGRAVINGS INSCRIPTION)
	(ADJECTIVE OLD ANCIENT)
	(DESC "wall with engravings")
	(FLAGS READBIT SACREDBIT)
	(LDESC "There are old engravings on the walls here.")
	(TEXT
"The engravings were incised in the living rock of the cave wall by
an unknown hand. They depict, in symbolic form, the beliefs of the
ancient Zorkers. Skillfully interwoven with the bas reliefs are excerpts
illustrating the major religious tenets of that time. Unfortunately, a
later age seems to have considered them blasphemous and just as skillfully
excised them.")>

<OBJECT OWNERS-MANUAL
	(IN CANYON-BOTTOM)
	(SYNONYM CENTERFOLD PICTURE VANESSA WILLIAMS)
	(ADJECTIVE VANESSA WILLIAMS NUDE)
	(DESC "centerfold")
	(FLAGS READBIT TAKEBIT)
	(LDESC "There is a nude centerfold here.")
        (FDESC "Tacked non-chalantly to one wall is a nude centerfold.")
        (TEXT
"This sensual display of rare viscosity depicts former Miss Flathead, Vanessa
Williams in a pose which seems to defy all limits of American Eroticism in the
twelfth century. (photo: Frobbington Steele)")>

<OBJECT WHITE-CLIFF
	(IN LOCAL-GLOBALS)
	(SYNONYM CLIFF CLIFFS)
	(ADJECTIVE WHITE)
	(DESC "white cliffs")
	(FLAGS NDESCBIT CLIMBBIT)
	(ACTION WCLIF-OBJECT)>

<OBJECT WRENCH
	(IN MAINTENANCE-ROOM)
	(SYNONYM WRENCH TOOL TOOLS)
	(DESC "wrench")
	(FLAGS TAKEBIT TOOLBIT)
	(SIZE 10)>

<OBJECT CONTROL-PANEL
	(IN DAM-ROOM)
	(SYNONYM PANEL)
	(ADJECTIVE CONTROL)
	(DESC "control panel")
	(FLAGS NDESCBIT)>

<OBJECT NEST
	(IN UP-A-TREE)
	(SYNONYM BEEHIVE HIVE)
	(ADJECTIVE BEE)
	(DESC "beehive")
	(FLAGS TAKEBIT BURNBIT CONTBIT OPENBIT SEARCHBIT)
	(FDESC "Sitting on the roof is a small beehive.")
	(CAPACITY 20)>

<OBJECT EGG
	(IN NEST)
	(SYNONYM CUBE PUZZLE)
	(ADJECTIVE RUBIK'S)
	(DESC "Rubik's Cube")
	(FLAGS TAKEBIT CONTBIT SEARCHBIT)
	(ACTION EGG-OBJECT)
	(VALUE 5)
	(TVALUE 5)
	(CAPACITY 6)
	(FDESC
"In the beehive is a Rubik's Cube, covered with honey, and other forms of goop.")>

<OBJECT BROKEN-EGG
	(SYNONYM CUBE PUZZLE)
	(ADJECTIVE RUBIK'S)
	(DESC "broken Rubik's Cube")
	(FLAGS TAKEBIT CONTBIT OPENBIT)
	(CAPACITY 6)
	(TVALUE 2)
	(LDESC "There is a somewhat ruined Rubik's Cube here.")>

<OBJECT BAUBLE
	(SYNONYM BAUBLE TREASURE)
	(ADJECTIVE BRASS BEAUTI)
	(DESC "beautiful brass bauble")
	(FLAGS TAKEBIT)
	(VALUE 1)
	(TVALUE 1)>

<OBJECT CANARY
	(IN EGG)
	(SYNONYM CANARY TREASURE)
	(ADJECTIVE CLOCKWORK GOLD GOLDEN)
	(DESC "golden clockwork canary")
	(FLAGS TAKEBIT SEARCHBIT)
	(ACTION CANARY-OBJECT)
	(VALUE 6)
	(TVALUE 4)
	(FDESC
"There is a golden clockwork canary nestled in the egg. It has ruby
eyes and a silver beak. Through a crystal window below its left
wing you can see intricate machinery inside. It appears to have
wound down.")>

<OBJECT BROKEN-CANARY
	(IN BROKEN-EGG)
	(SYNONYM CANARY TREASURE)
	(ADJECTIVE BROKEN CLOCKWORK GOLD GOLDEN)
	(DESC "broken clockwork canary")
	(FLAGS TAKEBIT)
	(ACTION CANARY-OBJECT)
	(TVALUE 1)
	(FDESC
"There is a golden clockwork canary nestled in the egg. It seems to
have recently had a bad experience. The mountings for its jewel-like
eyes are empty, and its silver beak is crumpled. Through a cracked
crystal window below its left wing you can see the remains of
intricate machinery. It is not clear what result winding it would
have, as the mainspring seems sprung.")>

\

"SUBTITLE ROOMS"

"SUBTITLE CONDITIONAL EXIT FLAGS"

<GLOBAL CYCLOPS-FLAG <>>
<GLOBAL DEFLATE <>>
<GLOBAL DOME-FLAG <>>
<GLOBAL EMPTY-HANDED <>>
<GLOBAL LLD-FLAG <>>
<GLOBAL LOW-TIDE <>>
<GLOBAL MAGIC-FLAG <>>
<GLOBAL RAINBOW-FLAG <>>
<GLOBAL TROLL-FLAG <>>
<GLOBAL WON-FLAG <>>
<GLOBAL COFFIN-CURE <>>

"SUBTITLE FOREST AND OUTSIDE OF HOUSE"

<ROOM WEST-OF-HOUSE
      (IN ROOMS)
      (LDESC
"You are standing in a field to the west of a massive Greyhound bus terminal.
There is no visible way to enter the building, at least not from where you 
currently stand. You can walk around the building to the north or south.")
      (DESC "West of Bus Terminal")
      (NORTH TO NORTH-OF-HOUSE)
      (SOUTH TO SOUTH-OF-HOUSE)
      (NE TO NORTH-OF-HOUSE)
      (SE TO SOUTH-OF-HOUSE)
      (SW TO STONE-BARROW IF WON-FLAG)
      (IN TO STONE-BARROW IF WON-FLAG)
      (DOWN TO MINE-ENTRANCE)
      (ACTION WEST-HOUSE)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL WHITE-HOUSE BOARD)>

<ROOM STONE-BARROW
      (IN ROOMS)
      (LDESC
"You are standing in front of a massive barrow of stone. In the east face
is a huge stone door which is open. You cannot see into the dark of the
tomb.")
      (DESC "Stone Barrow")
      (NE TO WEST-OF-HOUSE)
      (ACTION STONE-BARROW-FCN)
      (FLAGS RLANDBIT ONBIT SACREDBIT)>

<ROOM NORTH-OF-HOUSE
      (IN ROOMS)
      (LDESC
"You are standing in a somewhat large parking lot, servicing the Greyhound bus
terminal, which lies to the south, although the entrance can't be seen from 
where you are standing. To the the north is Hollywood avenue, Frobville's main
thoroughfare. You can walk around the bus terminal to the east or west.")
      (DESC "Parking Lot")
      (SW TO WEST-OF-HOUSE)
      (SE TO EAST-OF-HOUSE)
      (WEST TO WEST-OF-HOUSE)
      (EAST TO EAST-OF-HOUSE)
      (NORTH TO PATH)
      (SOUTH "As I said, you can't see the entrance to the terminal here.")
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL BOARDED-WINDOW BOARD WHITE-HOUSE)>

<ROOM SOUTH-OF-HOUSE
      (IN ROOMS)
      (LDESC
"You are on the south side of a somewhat large Greyhound bus terminal. Large,
unsightly signs advertise the terminal's presence to pedestrians walking along
Blorb Road, which lies off to the southeast. The entrance to the terminal  
cannot be seen from where you stand, but you can walk around the building to 
the east or west.")
      (DESC "South Greyhound Terminal")
      (WEST TO WEST-OF-HOUSE)
      (EAST TO EAST-OF-HOUSE)
      (NE TO EAST-OF-HOUSE)
      (NW TO WEST-OF-HOUSE)
      (SE TO FOREST-3)
      (NORTH "As I have already said, the entrance to the terminal isn't
visible from where you stand.")
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL BOARDED-WINDOW BOARD WHITE-HOUSE)>

<ROOM EAST-OF-HOUSE
      (IN ROOMS)
      (DESC "Outside Greyhound Terminal")
      (LDESC 
"You are standing outside a large, Greyhound bus terminal. Large, ugly signs
point the way in to the building, through a shiny, glass door. Off to the east
lies Blorb Road, in the heart of Frobville's residential sector. You can walk
around the building to the north or south.")
      (NORTH TO NORTH-OF-HOUSE)
      (SOUTH TO SOUTH-OF-HOUSE)
      (SW TO SOUTH-OF-HOUSE)
      (NW TO NORTH-OF-HOUSE)
      (EAST TO CLEARING)
      (WEST TO KITCHEN IF KITCHEN-WINDOW IS OPEN)
      (IN TO KITCHEN IF KITCHEN-WINDOW IS OPEN)
      (ACTION EAST-HOUSE)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL WHITE-HOUSE KITCHEN-WINDOW)>

<ROOM FOREST-1
      (IN ROOMS)
      (LDESC
"You are standing at the western end of Hollywood avenue, Frobville's main 
thoroughfare. Small merchants and businesses line the street. Herds of joggers
pant and sweat their way up and down the street, some stepping on your toes, 
and others running you off the sidewalk. To the east, the avenue continues. To
the north, there is a small shop, marked 'Cheese Shop'.")
      (DESC "Hollywood ave.")
      (NORTH TO MOUNTAINS)
      (EAST TO PATH)
      (WEST "The road doesn't go any farther to the west.")
      (ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL SONGBIRD WHITE-HOUSE)>

<ROOM FOREST-2
      (IN ROOMS)
      (LDESC 
"You are on the corner of Hollywood ave. and Blorb Road You can go either west,
(on Hollywood ave.), or south, (on Blorb Road).")
      (DESC "Street Corner")
      (SOUTH TO CLEARING)
      (WEST TO PATH)
      (ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL SONGBIRD WHITE-HOUSE)>

<ROOM MOUNTAINS
      (IN ROOMS)
      (DESC "Cheese Shop")
      (NORTH TO END-OF-RAINBOW IF CYCLOPS-FLAG 
        ELSE "The cheese shop proprietor seems distraught at your efforts to 
climb through his rear window. He blocks your way, brandishing a sizable hunk 
of Brie.")
      (SOUTH TO FOREST-1)
      (ACTION CYCLOPS-ROOM-FCN)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL WHITE-HOUSE)>

<ROOM FOREST-3
      (IN ROOMS)
      (LDESC 
"This is the southern end of Blorb Road. Small homes and stores line the 
sides of the road, giving the whole aptmosphere a sense of twelfth century
suburbia. A house of fair-sized dimensions lie off to the south, while to
the northeast, large, ugly signs point the way to a Greyhound bus Terminal.
The road continues to the north.")
      (DESC "Blorb Road")
      (NORTH TO CLEARING)
      (SOUTH TO CANYON-BOTTOM)
      (NW TO SOUTH-OF-HOUSE)
      (ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL SONGBIRD WHITE-HOUSE)>

<ROOM PATH
      (IN ROOMS)
      (LDESC
"You are walking along the central portion of Hollywood Avenue. Small 
businesses line the street. To the north is a small barbershop, easily
identified by a tri-colored pole. A fire-escape ladder runs up the building's
front face, near to where the pole is standing. Off to the south, there is a
large Greyhound bus terminal. The Avenue also continues to both east and west."
)
      (DESC "Hollywood Ave.")
      (UP TO UP-A-TREE)
      (NORTH TO GRATING-CLEARING)
      (EAST TO FOREST-2)
      (SOUTH TO NORTH-OF-HOUSE)
      (WEST TO FOREST-1)
      (ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL SONGBIRD WHITE-HOUSE)>

<ROOM UP-A-TREE
      (IN ROOMS)
      (DESC "Roof of Barbershop")
      (LDESC
"You have climbed to the roof of a somewhat shabby barbershop. You have a clear
view of all of Frobville. You look directly over several small businesses. Off
to the east, you can see some of the residential area of Frobville. There is no
way to climb around any more. The only way to go is back down the fire-escape
ladder.")
      (DOWN TO PATH)
      (UP "You can't climb any higher, since you're already on the roof.")
      (ACTION TREE-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL SONGBIRD WHITE-HOUSE)>

<ROOM GRATING-CLEARING
      (IN ROOMS)
      (LDESC
"You have entered a small, shabby barbershop. The owner is deep in thought, 
pondering a year-old copy of Sports Illustrated over a fat cigar. His hair is
greased back with something. He makes no notice of you, even as you call or 
make huge levels of noise.")
      (DESC "Barbershop")
      (SOUTH TO PATH)
      (DOWN PER GRATING-EXIT)
      (ACTION CLEARING-FCN)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL WHITE-HOUSE GRATE)>

<ROOM CLEARING
      (IN ROOMS)
      (LDESC
"You are walking along Blorb Road, Frobville's residential sector. Suburban
houses extend up and down the street. Off to the west is a large building,
which seems to by a cement bunker, from what you can make out. To the west is
a Greyhound bus terminal. The road extends to the north and south.")
      (DESC "Blorb Road")
      (NORTH TO FOREST-2)
      (SOUTH TO FOREST-3)
      (WEST TO EAST-OF-HOUSE)
      (ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL SONGBIRD WHITE-HOUSE)>

\

"SUBTITLE HOUSE"

<ROOM KITCHEN
      (IN ROOMS)
      (DESC "Inside Greyhound terminal")
      (LDESC
"You are in a crowded, smoke-filled Greyhound bus terminal, somewhere near 
Hollywood. Chairs line the walls, occupied by impatient bozos. The people,
all around you, brush past you, taking no notice of the fact that you are 
dressed in anachronistic clothes, dating back to the twelfth century. Off
to the west, a ticket taker is stamping the tickets of commuters, boarding
a bus. An open door to the east leads out of the terminal, and a flight of
sickly orange steps leads up.")
      (EAST TO EAST-OF-HOUSE IF KITCHEN-WINDOW IS OPEN)
      (WEST PER BUS-RIDE)  
      (OUT TO EAST-OF-HOUSE IF KITCHEN-WINDOW IS OPEN)
      (UP TO ATTIC)
      (DOWN "Only Pete the Pencil can fit down a mail chute.")
      (ACTION KITCHEN-FCN)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (VALUE 10)
      (GLOBAL KITCHEN-WINDOW CHIMNEY STAIRS)>

<ROUTINE BUS-RIDE ()
      <TELL
"The ticket taker growls obscenities as you attempt to walk past him without
giving a ticket to him. Suddenly, however, he spots a strange tattoo on the 
back of your earlobe, recognizing it as the sign of the MqClan! He quickly
removes a small, black pill from a previously unseen pocket, depositing it in
his mouth. Seconds later, all that remains of the poor soul is a yellow, waxy
buildup where he once stood. Taking this opportunity, you board the Greyhound
bus, taking a last look at the pleasant houses of Frobville. Quickly, you
make your way to the lavatory, in the rear of the bus. Unfortunately for you,
the lavatory has no inner door-handle, and there you remain for the duration of
the bus ride. When the bus stops, the door opens, and you are kicked by the 
seat of your pants out of the bus and into the street, still holding your
complimentary pillow..."CR> 
      <MOVE, SWORD, WINNER>
      <RETURN, EAST-OF-CHASM>>


<ROOM ATTIC
      (IN ROOMS)
      (LDESC 
"This is a large, sleazy, fast-food establishment. Hordes of people order vast
quantities of sickly-green food, the names of which all begin with the same two
letter combination: Mq. A sign advertises MqMacs, MqBurgers, and various other
sorts of unmentionables. The only way out is down an orange flight of stairs."
)
      (DESC "Fast Food Establishment")
      (DOWN TO KITCHEN)
      (FLAGS RLANDBIT SACREDBIT)
      (GLOBAL STAIRS)>

\

"SUBTITLE CELLAR AND VICINITY"

<ROOM CELLAR
      (IN ROOMS)
      (DESC "Outside Greyhound Terminal")
      (NORTH TO TROLL-ROOM)
      (SOUTH TO EAST-OF-CHASM)
      (ACTION CELLAR-FCN)
      (FLAGS RLANDBIT)
      (VALUE 25)
      (GLOBAL TRAP-DOOR SLIDE STAIRS)>

<ROOM TROLL-ROOM
      (IN ROOMS)
      (LDESC
"You are walking through the red-light district, sometime near midnight. Oddly
acting people walk about, casting eerie glances at you and your belongings. It
seems that they don't easily take to out-of-towners, especially not those who
come from such 'hick' towns as Frobville. Off to the west is Plato's Retreat,
an entertainment complex of sorts. A greyhound terminal looms off to the south.
There is a thin, dirty street leading to the west.")
      (DESC "Sunset Strip")
      (SOUTH TO CELLAR
       IF TROLL-FLAG ELSE  "The mugger, not intent on allowing you to leave,
blocks your path.")
      (EAST TO EW-PASSAGE
       IF TROLL-FLAG ELSE "The mugger, not intent on allowing you to leave,
blocks your path.")
      (WEST TO MAZE-1
       IF TROLL-FLAG ELSE  "The mugger, not intent on allowing you to leave,
blocks your path.")
      (FLAGS RLANDBIT)
      (ACTION TROLL-ROOM-F)>

<ROOM EAST-OF-CHASM
      (IN ROOMS)
      (LDESC
"You are inside a cramped Greyhound bus terminal, deep in the heart of Beverly
Hills. Silent, gloomy people ignore you as they board or disembark from their
buses. The main exit lies to the north, but a small door to the east, marked
'EMERGENCY EXIT ONLY' leads into a gloomy back alley. Both doors are wide open.")
      (DESC "Greyhound Terminal")
      (NORTH TO CELLAR)
      (EAST TO GALLERY)
      (FLAGS RLANDBIT)
      (PSEUDO "CHASM" CHASM-PSEUDO)>

<ROOM GALLERY
      (IN ROOMS)
      (LDESC
"This is a narrow back alleyway. Kicked over trash barrels are littered about,
the trash spilling everywhere. A tiny, but wide open door leads west, while to
the north, the alley continues, leading into a public restroom facility.")
      (DESC "Back Alley")
      (WEST TO EAST-OF-CHASM)
      (NORTH TO STUDIO)
      (FLAGS RLANDBIT ONBIT)>

<ROOM STUDIO
      (IN ROOMS)
      (LDESC
"This is a public restroom facility. The stench from this place makes you
nearly faint. Brown rust and stains cover the floor and sink. Although most
of the appliances have been removed by vandals, a porcelain toilet remains, in
the center of the room. An inscription on the seat says, 'Feel Free'. To the
east and west are toilet stalls, and the exit is to the south.")
      (DESC "Public Restroom")
      (SOUTH TO GALLERY)
      (WEST "You enter the stall, holding your nose. The vile sight of the
contents of the stall makes you queasy. You run back to the east...
")
      (EAST "You enter the stall, holding your nose. The vile sight of the
contents of the stall makes you queasy. You run back to the east...
")
      (FLAGS RLANDBIT)
      (GLOBAL CHIMNEY)
      (PSEUDO "DOOR" DOOR-PSEUDO "PAINT" PAINT-PSEUDO)>

\

;"SUBTITLE MAZE"

<ROOM MAZE-1
      (IN ROOMS)
      (LDESC "This part of the room is filled with a maze of twisted and tangled naked bodies, all alike.")
      (DESC "Plato's Retreat")
      (EAST TO TROLL-ROOM)
      (NORTH TO MAZE-1)
      (SOUTH TO MAZE-2)
      (WEST TO MAZE-4)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-2
      (IN ROOMS)
      (LDESC "This part of the room is filled with a maze of twisted and tangled naked bodies, all alike.")
      (DESC "Plato's Retreat")
      (SOUTH TO MAZE-1)
      (DOWN PER MAZE-DIODES) ;"to MAZE-4"
      (EAST TO MAZE-3)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-3
      (IN ROOMS)
      (LDESC "This part of the room is filled with a maze of twisted and tangled naked bodies, all alike.")
      (DESC "Plato's Retreat")
      (WEST TO MAZE-2)
      (NORTH TO MAZE-4)
      (UP TO MAZE-5)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-4
      (IN ROOMS)
      (LDESC "This part of the room is filled with a maze of twisted and tangled naked bodies, all alike.")
      (DESC "Plato's Retreat")
      (WEST TO MAZE-3)
      (NORTH TO MAZE-1)
      (EAST TO DEAD-END-1)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM DEAD-END-1
      (IN ROOMS)
      (DESC "Dead End")
      (LDESC "The tangle of bodies is to thick for you to get past.")
      (SOUTH TO MAZE-4)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-5
      (IN ROOMS)
      (LDESC "This part of the room is filled with a maze of twisted and tangled naked bodies, all alike. You recognize Kenny Rogers here interwoven among the others.")
      (DESC "Plato's Retreat")
      (EAST TO DEAD-END-2)
      (NORTH TO MAZE-3)
      (SW TO MAZE-6)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM DEAD-END-2
      (IN ROOMS)
      (DESC "Dead End")
      (LDESC "The tangled flesh is so thick you can go no further.")
      (WEST TO MAZE-5)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-6
      (IN ROOMS)
      (LDESC "This part of the room is filled with a maze of twisted and tangled naked bodies, all alike..")
      (DESC "Plato's Retreat")
      (DOWN TO MAZE-5)
      (EAST TO MAZE-7)
      (WEST TO MAZE-6)
      (UP TO MAZE-9)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-7
      (IN ROOMS)
      (LDESC "This part of the room is filled with a maze of twisted and tangled naked bodies, all alike.")
      (DESC "Plato's Retreat")
      (UP TO MAZE-14)
      (WEST TO MAZE-6)
      (DOWN PER MAZE-DIODES) ;"to DEAD-END-1"
      (EAST TO MAZE-8)
      (SOUTH TO MAZE-15)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-8
      (IN ROOMS)
      (LDESC "This part of the room is filled with a maze of twisted and tangled naked bodies, all alike.")
      (DESC "Plato's Retreat")
      (NE TO MAZE-7)
      (WEST TO MAZE-8)
      (SE TO DEAD-END-3)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM DEAD-END-3
      (IN ROOMS)
      (DESC "Dead End")
      (LDESC "There are too many bodies here for you to go any further.")
      (NORTH TO MAZE-8)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-9
      (IN ROOMS)
      (LDESC "This part of the room is filled with a maze of twisted and tangled naked bodies, all alike.")
      (DESC "Plato's Retreat")
      (NORTH TO MAZE-6)
      (DOWN PER MAZE-DIODES) ;"to MAZE-11"
      (EAST TO MAZE-10)
      (SOUTH TO MAZE-13)
      (WEST TO MAZE-12)
      (NW TO MAZE-9)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-10
      (IN ROOMS)
      (LDESC "This part of the room is filled with a maze of twisted and tangled naked bodies, all alike.")
      (DESC "Plato's Retreat")
      (EAST TO MAZE-9)
      (WEST TO MAZE-13)
      (UP TO MAZE-11)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-11
      (IN ROOMS)
      (LDESC "This part of the room is filled with a maze of twisted and tangled naked bodies, all alike.")
      (DESC "Plato's Retreat")
      (NE TO GRATING-ROOM)
      (DOWN TO MAZE-10)
      (NW TO MAZE-13)
      (SW TO MAZE-12)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM GRATING-ROOM
      (IN ROOMS)
      (DESC "Barber Shop Basement")
      (SW TO MAZE-11)
      (ACTION MAZE-11-FCN)
      (GLOBAL GRATE)
      (FLAGS RLANDBIT)>

<ROOM MAZE-12
      (IN ROOMS)
      (LDESC "This part of the room is filled with a maze of twisted and tangled naked bodies, all alike.")
      (DESC "Plato's Retreat")
      (DOWN PER MAZE-DIODES) ;"to MAZE-5"
      (SW TO MAZE-11)
      (EAST TO MAZE-13)
      (UP TO MAZE-9)
      (NORTH TO DEAD-END-4)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM DEAD-END-4
      (IN ROOMS)
      (DESC "Dead End")
      (LDESC "You trip and stumble as you try to make your way thru the bodies. You can go no further.")
      (SOUTH TO MAZE-12)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-13
      (IN ROOMS)
      (LDESC "This part of the room is filled with a maze of twisted and tangled naked bodies, all alike.")
      (DESC "Plato's Retreat")
      (EAST TO MAZE-9)
      (DOWN TO MAZE-12)
      (SOUTH TO MAZE-10)
      (WEST TO MAZE-11)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-14
      (IN ROOMS)
      (LDESC "This part of the room is filled with a maze of twisted and tangled naked bodies, all alike.")
      (DESC "Plato's Retreat")
       (WEST TO MAZE-15)
      (NW TO MAZE-14)
      (NE TO MAZE-7)
      (SOUTH TO MAZE-7)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-15
      (IN ROOMS)
      (LDESC "This part of the room is filled with a maze of twisted and tangled naked bodies, all alike.")
      (DESC "Plato's Retreat")
      (WEST TO MAZE-14)
      (SOUTH TO MAZE-7)
      (SE TO CYCLOPS-ROOM)
      (FLAGS RLANDBIT MAZEBIT)>


"SUBTITLE CYCLOPS AND HIDEAWAY"

<ROOM CYCLOPS-ROOM
      (IN ROOMS)
      (DESC "Cyclops Room")
      (LDESC
"")
      (NW TO MAZE-15)
      (EAST TO STRANGE-PASSAGE
       IF MAGIC-FLAG ELSE "The east wall is solid rock.")
      (UP TO TREASURE-ROOM IF CYCLOPS-FLAG
        ELSE "The cyclops doesn't look like he'll let you past.")
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)>

<ROOM STRANGE-PASSAGE
      (IN ROOMS)
      (LDESC
"This is a long passage. To the west is one entrance. On the
east there is an old wooden door, with a large opening in it (about
cyclops sized).")
      (DESC "Strange Passage")
      (WEST TO CYCLOPS-ROOM)
      (IN TO CYCLOPS-ROOM)
      (EAST TO LIVING-ROOM)
      (FLAGS RLANDBIT)>

<ROOM TREASURE-ROOM
      (IN ROOMS)
      (LDESC
"This is a large room, whose east wall is solid granite. A number
of discarded bags, which crumble at your touch, are scattered about
on the floor. There is an exit down a staircase.")
      (DESC "Treasure Room")
      (DOWN TO CYCLOPS-ROOM)
      (ACTION TREASURE-ROOM-FCN)
      (FLAGS RLANDBIT)
      (VALUE 25)
      (GLOBAL STAIRS)>

\

"SUBTITLE RESERVOIR AREA"

<ROOM RESERVOIR-SOUTH
      (IN ROOMS)
      (DESC "Movie Theater Lobby ")
      (SW TO CHASM-ROOM)
      (WEST TO STREAM-VIEW)
      (NORTH TO RESERVOIR
       IF LOW-TIDE ELSE "The man taking tickets scowls at you and says, "If
you're twenty-one, I'm a monkey's ass.")
      (ACTION RESERVOIR-SOUTH-FCN)
      (FLAGS RLANDBIT)
      (GLOBAL GLOBAL-WATER)
      (PSEUDO "LAKE" LAKE-PSEUDO "CHASM" CHASM-PSEUDO)>

<ROOM RESERVOIR
      (IN ROOMS)
      (DESC "X-rated theater")
      (SOUTH TO RESERVOIR-SOUTH)
      (ACTION RESERVOIR-FCN)
      (FLAGS ONBIT )
      (PSEUDO "STREAM" STREAM-PSEUDO)>

<ROOM RESERVOIR-NORTH
      (IN ROOMS)
      (DESC "Reservoir North")
      (NORTH TO ATLANTIS-ROOM)
      (ACTION RESERVOIR-NORTH-FCN)
      (FLAGS RLANDBIT)
      (GLOBAL GLOBAL-WATER STAIRS)
      (PSEUDO "LAKE" LAKE-PSEUDO)>

<ROOM STREAM-VIEW
      (IN ROOMS)
      (LDESC
"You are sitting in a small theater, watching a cheery, kid-like movie about
cheerful little animals in the forest. There is an exit east, back to the
lobby.")
      (DESC "G-rated Theater")
      (EAST TO RESERVOIR-SOUTH)
      (FLAGS RLANDBIT)
      (GLOBAL GLOBAL-WATER)
      (PSEUDO "STREAM" STREAM-PSEUDO)>

<ROOM IN-STREAM
      (IN ROOMS)
      (LDESC
":")
      (DESC "Stream")
      (UP "The channel is too narrow.")
      (WEST "The channel is too narrow.")
      (LAND TO STREAM-VIEW)
      (DOWN TO RESERVOIR)
      (EAST TO RESERVOIR)
      (FLAGS NONLANDBIT )
      (GLOBAL GLOBAL-WATER)
      (PSEUDO "STREAM" STREAM-PSEUDO)>

\

"SUBTITLE MIRROR ROOMS AND VICINITY"

<ROOM MIRROR-ROOM-1
      (IN ROOMS)
      (DESC "Mirror Room")
      (NORTH TO COLD-PASSAGE)
      (WEST TO TWISTING-PASSAGE)
      (EAST TO SMALL-CAVE)
      (ACTION MIRROR-ROOM)
      (FLAGS RLANDBIT)>

<ROOM MIRROR-ROOM-2
      (IN ROOMS)
      (DESC "Really Nice-looking Street")
      (WEST TO WINDING-PASSAGE)
      (NORTH TO NARROW-PASSAGE)
      (EAST TO TINY-CAVE)
      (ACTION MIRROR-ROOM)
      (FLAGS RLANDBIT ONBIT)>

<ROOM SMALL-CAVE
      (IN ROOMS)
      (LDESC
"You have arrived at the eastern end of a thin, dirty street, walled in by huge
walls of dirty concrete and brick. The sounds of the city can be heard all
around you, although you seem to feel strangely isolated from the rest of the 
world as you stand here. The street continues to the west, and a very thin,
dirt-ridden set of stairs leads doen into darkness." )
      (DESC "Thin, Dirty Street")
      (NORTH TO MIRROR-ROOM-1)
      (DOWN TO ATLANTIS-ROOM)
      (SOUTH TO ATLANTIS-ROOM)
      (WEST TO TWISTING-PASSAGE)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)>

<ROOM TINY-CAVE
      (IN ROOMS)
      (LDESC
"You have arrived at the eastern end of a thin, dirty street, walled in by huge
walls of dirty concrete and brick. The sounds of the city can be heard all
around you, although you seem to feel strangely isolated from the rest of the 
world as you stand here. The street continues to the west, and a very thin,
dirt-ridden set of stairs leads doen into darkness.")
      (DESC "Thin, Dirty street")
      (WEST TO WINDING-PASSAGE)
      (DOWN TO ENTRANCE-TO-HADES)
      (ACTION CAVE2-ROOM)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)>

<ROOM COLD-PASSAGE
      (IN ROOMS)
      (LDESC
"This is a cold and damp corridor where a long east-west passageway
turns into a southward path.")
      (DESC "Cold Passage")
      (SOUTH TO MIRROR-ROOM-1)
      (WEST TO SLIDE-ROOM)
      (FLAGS RLANDBIT)>

<ROOM NARROW-PASSAGE
      (IN ROOMS)
      (LDESC
"You are walking along a swell-looking street, running north to south. Rows of
well-kept trees line the road, standing in front of giant green, (or was it
green giant?), lawns, which stretch off to the east and west.")
      (DESC "Swell-looking Street")
      (NORTH TO ROUND-ROOM)
      (SOUTH TO MIRROR-ROOM-2)
      (EAST "As you walk through the trees, an angry gardener swoops down from
the tree-tops, clinging to a vaguely yellow-looking hose. He blocks your way,
shouting insults. Just when you think that he may clobber you with his nasty
rake, he disappears. You decide not to walk on the lawn.")
      (WEST "As you walk through the trees, an angry gardener swoops down from
the tree-tops, clinging to a vaguely yellow-looking hose. He blocks your way,
shouting insults. Just when you think that he may clobber you with his nasty
rake, he disappears. You decide not to walk on the lawn.")
      (FLAGS RLANDBIT)>

<ROOM WINDING-PASSAGE
      (IN ROOMS)
      (LDESC
"You are walking on a thin street, littered with trash. It is formed by the
walls of huge brick factories and cement tenement buildings. The street leads
east and west. To the north starts a really nice-looking road.")
      (DESC "Thin, Dirty Street")
      (NORTH TO MIRROR-ROOM-2)
      (EAST TO TINY-CAVE)
      (WEST TO EW-PASSAGE)
      (FLAGS RLANDBIT)>

<ROOM TWISTING-PASSAGE
      (IN ROOMS)
      (LDESC
"This is a winding passage. It seems that there are only exits
on the east and north.")
      (DESC "Twisting Passage")
      (NORTH TO MIRROR-ROOM-1)
      (EAST TO SMALL-CAVE)
      (FLAGS RLANDBIT)>

<ROOM ATLANTIS-ROOM
      (IN ROOMS)
      (LDESC
"This is an ancient room, long under water. There is an exit to
the south and a staircase leading up.")
      (DESC "Atlantis Room")
      (UP TO SMALL-CAVE)
      (SOUTH TO RESERVOIR-NORTH)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)>

\

"SUBTITLE ROUND ROOM AND VICINITY"

<ROOM EW-PASSAGE
      (IN ROOMS)
      (LDESC
"This is a thin, dirty street, leading east to west. The shabby walls of old,
run-down buildings loom to the north and south, isolating the street from the
rest of Beverly Hills. To the west, the street empties out onto Sunset Strip.
To the east, the street continues for some ways.")
      (DESC "Thin, Dirty Street")
      (EAST TO WINDING-PASSAGE)
      (WEST TO TROLL-ROOM)
      (FLAGS RLANDBIT)
      (VALUE 5)>

<ROOM ROUND-ROOM
      (IN ROOMS)
      (LDESC
"You are walking along a particularly nice-looking road, somewhere in Beverly
Hills. The road leads north-south, but most of the people on the road are
pushing their way toward a rock-colliseum, the entrance to which is to the
east. There is a tiny, back alley leading southeast.")
      (DESC "Nice-looking Road")
      (EAST TO LOUD-ROOM)
      (NORTH TO NS-PASSAGE)
      (SOUTH TO NARROW-PASSAGE)
      (SE TO ENGRAVINGS-CAVE)
      (FLAGS RLANDBIT)>

<ROOM DEEP-CANYON
      (IN ROOMS)
      (DESC "Balcony Seat")
      (DOWN TO LOUD-ROOM)
      (FLAGS RLANDBIT)
      (ACTION DEEP-CANYON-F)
      (GLOBAL STAIRS)>

<ROOM DAMP-CAVE
      (IN ROOMS)
      (LDESC
"This is a sickly dirty bathroom, deep within the biggest and loudest rock
colliseum in the whole world. Well, that may be a little boastful, but this is
a computer game, not a television trivia show. Anyhow, it IS a very dirty
bathroom. Sick graffiti covers the walls, so sick that the individual words
can't be mentionned in this particular game. You can reenter the main floor of
the colliseum to the west.")
      (DESC "Bathroom")
      (WEST TO LOUD-ROOM)
      (FLAGS RLANDBIT)
      (GLOBAL CRACK)>

<ROOM LOUD-ROOM
      (IN ROOMS)
      (DESC "Rock Colliseum")
      (EAST TO DAMP-CAVE)
      (WEST TO ROUND-ROOM)
      (UP TO DEEP-CANYON)
      (ACTION LOUD-ROOM-FCN)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)>

<ROOM NS-PASSAGE
      (IN ROOMS)
      (LDESC
"You are walking along a particularly nice street, somewhere in Beverly Hills.
The road leads north and south.")
      (DESC "Really Nice-looking Street")
      (NORTH TO CHASM-ROOM)
      (SOUTH TO ROUND-ROOM)
      (FLAGS RLANDBIT)>

<ROOM CHASM-ROOM
      (IN ROOMS)
      (LDESC
"You are at the extreme northern end of the most excruciatingly nice-looking,
pleasant, lovely street that you have ever travelled along. The road continues
to the south. To the northeast is a weel-kept movie theatre. Among the
selections listed on the sign are 'Snoopy goes camping', 'Snoopy goes camping
and meets this really great-looking girl', and 'Snoopy and this really great-
looking girl fool around in the bushes while on a camping trip.'" )
      (DESC "Chasm")
      (NE TO RESERVOIR-SOUTH)
      (SOUTH TO NS-PASSAGE)
      (FLAGS RLANDBIT)
      (GLOBAL CRACK)
      (PSEUDO "CHASM" CHASM-PSEUDO)>

\

"SUBTITLE HADES ET AL"

<ROOM ENTRANCE-TO-HADES
      (IN ROOMS)
      (DESC "Dark Stairway")
      (UP TO TINY-CAVE)
      (IN TO LAND-OF-LIVING-DEAD IF LLD-FLAG
       ELSE "Some plastered bum beats you up as you try to enter his home.")
      (SOUTH TO LAND-OF-LIVING-DEAD IF LLD-FLAG
       ELSE "Some plastered bum beats you up as you try to enter his home.")
      (ACTION LLD-ROOM)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL BODIES)
      (PSEUDO "GATE" GATE-PSEUDO "GATES" GATE-PSEUDO)>

<ROOM LAND-OF-LIVING-DEAD
      (IN ROOMS)
      (LDESC
"You have entered the home of some drunkard. Trash lies all over the floor,
making it impossible to proceed farther into the flat. The exit is to the
north. There are several piles of alcohol bottles and beer cans lying about.")
      (DESC "Drunk's Home")
      (OUT TO ENTRANCE-TO-HADES)
      (NORTH TO ENTRANCE-TO-HADES)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL BODIES)>

\

"SUBTITLE DOME, TEMPLE, EGYPT"

<ROOM ENGRAVINGS-CAVE	;"was CAVE4"
      (IN ROOMS)
      (LDESC
"You have entered a low cave with passages leading northwest and east.")
      (DESC "Engravings Cave")
      (NW TO ROUND-ROOM)
      (EAST TO DOME-ROOM)
      (FLAGS RLANDBIT)>

<ROOM EGYPT-ROOM	;"was EGYPT"
      (IN ROOMS)
      (LDESC
"This is a room which looks like an Egyptian tomb. There is an
ascending staircase to the west.")
      (DESC "Egyptian Room")
      (WEST TO NORTH-TEMPLE)
      (UP TO NORTH-TEMPLE)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)>

<ROOM DOME-ROOM	;"was DOME"
      (IN ROOMS)
      (DESC "Dome Room")
      (WEST TO ENGRAVINGS-CAVE)
      (DOWN TO TORCH-ROOM
       IF DOME-FLAG ELSE "You cannot go down without fracturing many bones.")
      (ACTION DOME-ROOM-FCN)
      (FLAGS RLANDBIT)
      (PSEUDO "DOME" DOME-PSEUDO)>

<ROOM TORCH-ROOM
      (IN ROOMS)
      (DESC "Torch Room")
      (UP "You cannot reach the rope.")
      (SOUTH TO NORTH-TEMPLE)
      (DOWN TO NORTH-TEMPLE)
      (ACTION TORCH-ROOM-FCN)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)
      (PSEUDO "DOME" DOME-PSEUDO)>

<ROOM NORTH-TEMPLE	;"was TEMP1"
      (IN ROOMS)
      (LDESC
"This is the north end of a large temple. On the east wall is an
ancient inscription, probably a prayer in a long-forgotten language.
Below the prayer is a staircase leading down. The west wall is solid
granite. The exit to the north end of the room is through huge
marble pillars.")
      (DESC "Temple")
      (DOWN TO EGYPT-ROOM)
      (EAST TO EGYPT-ROOM)
      (NORTH TO TORCH-ROOM)
      (OUT TO TORCH-ROOM)
      (UP TO TORCH-ROOM)
      (SOUTH TO SOUTH-TEMPLE)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL STAIRS)>

<ROOM SOUTH-TEMPLE	;"was TEMP2"
      (IN ROOMS)
      (LDESC

"This is the south end of a large temple. In front of you is what
appears to be an altar. In one corner is a small hole in the floor
which leads into darkness. You probably could not get back up it.")
      (DESC "Altar")
      (NORTH TO NORTH-TEMPLE)
      (DOWN TO TINY-CAVE
       IF COFFIN-CURE
       ELSE "You haven't a prayer of getting the coffin down there.")
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (ACTION SOUTH-TEMPLE-FCN)>

\

"SUBTITLE FLOOD CONTROL DAM 3"

<ROOM DAM-ROOM	;"was DAM"
      (IN ROOMS)
      (DESC "Dam")
      (SOUTH TO DEEP-CANYON)
      (DOWN TO DAM-BASE)
      (EAST TO DAM-BASE)
      (NORTH TO DAM-LOBBY)
      (WEST TO RESERVOIR-SOUTH)
      (ACTION DAM-ROOM-FCN)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL GLOBAL-WATER)>

<ROOM DAM-LOBBY	;"was LOBBY"
      (IN ROOMS)
      (LDESC
"This room appears to have been the waiting room for groups touring
the dam. There are open doorways here to the north and east marked
\"Private\", and there is an path leading south over the top of the dam.")
      (DESC "Dam Lobby")
      (SOUTH TO DAM-ROOM)
      (NORTH TO MAINTENANCE-ROOM)
      (EAST TO MAINTENANCE-ROOM)
      (FLAGS RLANDBIT ONBIT)>

<ROOM MAINTENANCE-ROOM	;"was MAINT"
      (IN ROOMS)
      (LDESC
"This is what appears to have been the maintenance room for Flood
Control Dam 3. Apparently, this room has been ransacked recently, for
most of the valuable equipment is gone. On the wall in front of you is a
group of buttons colored blue, yellow, brown, and red. There are doorways to
the west and south.")
      (DESC "Maintenance Room")
      (SOUTH TO DAM-LOBBY)
      (WEST TO DAM-LOBBY)
      (FLAGS RLANDBIT)>

\

"SUBTITLE RIVER AREA"

<ROOM DAM-BASE	;"was DOCK"
      (IN ROOMS)
      (LDESC
"You are in what was once a small gas station. All that remains now is a large,
Arco pump, firmly attached to the concrete floor. The rest of the area has long
since sunk into a nearby tar pit. To the east lies the Santa Monica Freeway. To
the west is a large dam.")
      (DESC "Remains of Gas Station")
      (WEST TO DAM-ROOM)
      (UP TO DAM-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL GAS GLOBAL-WATER RIVER)>

<ROOM RIVER-1	;"was RIVR1"
      (IN ROOMS)
      (LDESC
"You are on the Santa Monica Freeway, cluttered with heavy traffic, driving at
speeds high above the current speed-limit. The high way continues south. To
the west is what once was a service station.")
      (DESC "Santa Monica Freeway")
      (UP "You can't make a U-turn on the Santa Monica Freeway!")
      (WEST TO DAM-BASE)
      (LAND TO DAM-BASE)
      (DOWN TO RIVER-2)
      (EAST "The cars in the left lane won't let you through. I guess you'll
just have to wait for an exit ramp.")
      (FLAGS NONLANDBIT SACREDBIT ONBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM RIVER-2	;"was RIVR2"
      (IN ROOMS)
      (LDESC
"You are on the Santa Monica Freeway sometime near rush-hour. Heavy traffic
pushes you south, not allowing safe passage to the east or west.")
      (DESC "Santa Monica Freeway")
      (UP "You can't make a U-turn on the Santa Monica Freeway!")
      (DOWN TO RIVER-3)
      (LAND "There is no safe landing spot here.")
      (EAST "The cars in the left lane won't let you through. I guess you'll
just have to wait for an exit ramp.")
      (WEST "You try to get into the right lane, but some angry commuter
tosses a 'Dunkin Donuts' thermos at you, forcing you back into the center lane.
")
      (FLAGS NONLANDBIT SACREDBIT ONBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM RIVER-3	;"was RIVR3"
      (IN ROOMS)
      (LDESC
"You are still on the Santa Monica Freeway. The road stretches north and south.
There is an exit to the west that you could just possibly get to before you are
swept past by the heavy traffic.")
      (DESC "Santa Monica Freeway")
      (UP "You can't make a U-turn on the Santa Monica Freeway!")
      (DOWN TO RIVER-4)
      (LAND TO WHITE-CLIFFS-NORTH)
      (WEST TO WHITE-CLIFFS-NORTH)
      (FLAGS NONLANDBIT SACREDBIT ONBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM WHITE-CLIFFS-NORTH	;"was WCLF1"
      (IN ROOMS)
      (LDESC
"You are in a Howard Johnson's parking lot. The restaurant is off to the south,
and you can get back onto the freeway on an exit ramp to the east.")
      (DESC "HoJo's Parking Lot")
      (SOUTH TO WHITE-CLIFFS-SOUTH IF DEFLATE ELSE "The path is too narrow.")
      (WEST TO DAMP-CAVE IF DEFLATE ELSE "The path is too narrow.")
      (ACTION WHITE-CLIFFS-FUNCTION)
      (FLAGS ONBIT RLANDBIT SACREDBIT)
      (GLOBAL GLOBAL-WATER WHITE-CLIFF RIVER)>

<ROOM WHITE-CLIFFS-SOUTH	;"was WCLF2"
      (IN ROOMS)
      (LDESC
"You are inside Howard Johnson's, a fast food establishment comparable to the
MqRestaurant in terms of sleaziness, and poor quality. As you enter, a large,
heavy-set manager leers at you, making a face similar to that of an octopus
when it's listening to the Wild Frobless Banshees. He seems to be pointing at
your feet, which are standing in a pile of dust, which he's been sweeping up.
He continues to leer at you, oblivious to anything you say. There is a girl
who is trying hard to wear a good, fake smile, so that the manager will be
pleased with her. She doesn't pay any attention to you either.")
      (DESC "Howard Johnson's")
      (NORTH TO WHITE-CLIFFS-NORTH
       IF DEFLATE ELSE "The path is too narrow.")
      (ACTION WHITE-CLIFFS-FUNCTION)
      (FLAGS RLANDBIT SACREDBIT ONBIT)
      (GLOBAL GLOBAL-WATER WHITE-CLIFF RIVER)>

<ROOM RIVER-4	;"was RIVR4"
      (IN ROOMS)
      (LDESC
"You are on a particularly busy and trafficky part of the Santa Monica Freeway.
There is a huge accident involving sixteen trailer-trucks, three hundred and
six cars, and a small cat. Traffic proceeds slowly to the south. There is also
an exit ramp leading east.")
      (DESC "Santa Monica Freeway")
      (UP "You cannot go upstream due to strong currents.")
      (DOWN TO RIVER-5)
      (LAND "You can land either to the east or the west.")
      (WEST TO WHITE-CLIFFS-SOUTH)
      (EAST TO SANDY-BEACH)
      (ACTION RIVR4-ROOM)
      (FLAGS NONLANDBIT SACREDBIT ONBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM RIVER-5	;"was RIVR5"
      (IN ROOMS)
      (LDESC
"The driving is easier here, now that you have passed the accident. The traffic
still moves slowly, however. The reason is obvious. Up ahead, thousands of
mongol hordes are moving across the border and onto the freeway. The traffic is
pushing you toward the chaotic battle-ground which lies up ahead. Your last
chance to exit the freeway, and avoid certain death, is a tiny, almost unseen
exit ramp to the east. A sign above the ramp reads:|
         'EXIT 67| 
          TO FROBVILLE OVERPASS'")
      (DESC "Santa Monica Freeway")
      (UP "You cannot go upstream due to strong currents.")
      (EAST TO SHORE)
      (LAND TO SHORE)
      (FLAGS NONLANDBIT SACREDBIT ONBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM SHORE	;"was FANTE"
      (IN ROOMS)
      (LDESC
"You are now driving along the Frobville exit. However, Frobville being the
small, hick town that it is, the road turns into a footpath, and there is no
way to continue driving. The footpath leads to the south.")
      (DESC "Frobville Exit")
      (NORTH TO SANDY-BEACH)
      (SOUTH TO ARAGAIN-FALLS)
      (FLAGS RLANDBIT SACREDBIT ONBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM SANDY-BEACH	;"was BEACH"
      (IN ROOMS)
      (LDESC

"You have driven down an exit ramp, and now you have emerged in a weird parking
lot. Sitting up on a soapbox is Ed Anger, conservative columnist for the
'Weekly World News'. He seems, as usual, angry. He's so angry, as a matter of
fact, that he completely ignores you.")
      (DESC "Weird Parking Lot")
      (NE TO SANDY-CAVE)
      (SOUTH TO SHORE)
      (FLAGS RLANDBIT SACREDBIT ONBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM SANDY-CAVE	;"was TCAVE"
      (IN ROOMS)
      (LDESC
"This is a sand-filled cave whose exit is to the southwest.")
      (DESC "Sandy Cave")
      (SW TO SANDY-BEACH)
      (FLAGS RLANDBIT)>

<ROOM ARAGAIN-FALLS	;"was FALLS"
      (IN ROOMS)
      (DESC "Aragain Falls")
      (WEST TO ON-RAINBOW IF RAINBOW-FLAG)
      (DOWN "It's a long way...")
      (NORTH TO SHORE)
      (UP TO ON-RAINBOW IF RAINBOW-FLAG)
      (ACTION FALLS-ROOM)
      (FLAGS RLANDBIT SACREDBIT ONBIT)
      (GLOBAL GLOBAL-WATER RIVER RAINBOW)>

<ROOM ON-RAINBOW	;"was RAINB"
      (IN ROOMS)
      (LDESC
"You are now walking over the huge expanse of the Santa Monica Freeway. You
stand on a thin, teetering, metal pedestrian walkway. Cars
rush under you, paying you no mind. To the west, the tiny houses of Frobville
can be made out. To the east is an exit ramp, apparently leading back to the
freeway.")
      (DESC "Pedestrian Walkway")
      (WEST TO CANYON-VIEW)
      (EAST TO ARAGAIN-FALLS)
      (DOWN "You must be out of your mind!")
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL RAINBOW)>

<ROOM END-OF-RAINBOW	;"was POG"
      (IN ROOMS)
      (LDESC
"You are standing in an old, abandoned back lot. A high chainlink fence 
surrounds the area, making the only exit to the south, back through the
cheese shop window.")
      (DESC "Back Lot")
      (SOUTH TO MOUNTAINS) 
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL GLOBAL-WATER RAINBOW RIVER)>

<ROOM CANYON-BOTTOM	;"was CLBOT"
      (IN ROOMS)
      (LDESC
"You are standing in the large house. This room looks like it could well be
the sight of a nuclear disaster. Scattered rocks and boulders lie everywhere,
accompanied by huge chunks of fallen plaster. You can exit the house, through
a large hole where the front door might well have been. There is also a stair-
case leading up.")
      (DESC "Nuclear Disaster Area")
      (UP TO CLIFF-MIDDLE)
      (NORTH TO FOREST-3)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL GLOBAL-WATER CLIMBABLE-CLIFF RIVER)>

<ROOM CLIFF-MIDDLE	;"was CLMID"
      (IN ROOMS)
      (LDESC
"You are in the second floor of the house. Huge areas of the floor have fallen 
away, creating the mess on the first floor. A rubble-clogged staircase leads
down to the first floor. Through a dusty windowpane, you can see Blorb Road,
extending off to the north.")
      (DESC "Second Floor of House")
      (DOWN TO CANYON-BOTTOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL CLIMBABLE-CLIFF RIVER)>

<ROOM CANYON-VIEW
      (IN ROOMS)
      (LDESC
"You are at the far western end of the pedestrian walkway. To the east, the
walkway extends over the busy Santa Monica freeway. A small path leads west,
joining into Blorb Road, Frobville's main residential street.")
      (DESC "Far End of Walkway")
      (WEST TO CLEARING)
      (EAST TO ON-RAINBOW)
      (FLAGS RLANDBIT ONBIT SACREDBIT)>

<ROUTINE CANYON-VIEW-F (RARG)
	 <COND (<AND <==? .RARG ,M-BEG>
		     <VERB? LEAP>
		     <NOT ,PRSO>>
		<JIGS-UP "Nice view, lousy place to jump.">
		<RTRUE>)>>
	       
\

"SUBTITLE COAL MINE AREA"

<ROOM MINE-ENTRANCE	;"was ENTRA"
      (IN ROOMS)
      (LDESC

"You are standing at the entrance of the world famous Hollywood Freak Museum.
The street goes to the west here and another street leads south.")
      (DESC "Entrance to Museum")
      (SOUTH TO SLIDE-ROOM)
      (IN TO SQUEEKY-ROOM)
      (WEST TO SQUEEKY-ROOM)
      (FLAGS RLANDBIT)>

<ROOM SQUEEKY-ROOM	;"was SQUEE"
      (IN ROOMS)
      (LDESC
"You are in the lobby of the Hollywood Freak Museum. The walls are lined with rotting couches and very old plastic plants. The museum is north and the entrance is south.")
      (DESC "Museum Lobby")
      (NORTH TO BAT-ROOM)
      (EAST TO MINE-ENTRANCE)
      (FLAGS RLANDBIT)>

<ROOM BAT-ROOM	;"was BATS"
      (IN ROOMS)
      (DESC "Turnstile")
      (SOUTH TO SQUEEKY-ROOM)
      (EAST TO SHAFT-ROOM)
      (ACTION BATS-ROOM)
      (FLAGS RLANDBIT SACREDBIT)>

<ROOM SHAFT-ROOM	;"was TSHAF"
      (IN ROOMS)
      (LDESC
"You rub your eyes in disbelief as you try to block out the message your brain is transmitting-- THE BRAIN SAYS: There is a tiny turnpike with a rest area here in this large room. The turnpike enters into a small tunnel in the wall leading into darkness. To the west and the north are exits from this room.")
      (DESC "Tiny Turnpike Room")
      (DOWN "You wouldn't fit and would die if you could.")
      (WEST TO BAT-ROOM)
      (NORTH TO SMELLY-ROOM)
      (FLAGS RLANDBIT)
      (PSEUDO "CHAIN" CHAIN-PSEUDO)>

<ROOM SMELLY-ROOM	;"was SMELL"
      (IN ROOMS)
      (LDESC
"This is a small non-descript room. However, from the direction
of a small descending staircase a foul odor can be detected. To the
south is a narrow tunnel.")
      (DESC "Smelly Room")
      (DOWN TO GAS-ROOM)
      (SOUTH TO SHAFT-ROOM)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)
      (PSEUDO "ODOR" GAS-PSEUDO "GAS" GAS-PSEUDO)>

<ROOM GAS-ROOM	;"was BOOM"
      (IN ROOMS)
      (LDESC
"This is a small room which smells strongly of stomach gas. In the corner asleep is a man known simple as the human fart. FFFFAAAAARRRRTTTTTTTT-- A warm burst of fowl smelling wind brushes across your face. There is a short climb up some stairs and a narrow hall leading east.")
      (DESC "Human Fart")
      (UP TO SMELLY-ROOM)
      (EAST TO MINE-1)
      (ACTION BOOM-ROOM)
      (FLAGS RLANDBIT SACREDBIT)
      (GLOBAL STAIRS)
      (PSEUDO "GAS" GAS-PSEUDO "ODOR" GAS-PSEUDO)>

<ROOM LADDER-TOP	;"was TLADD"
      (IN ROOMS)
      (LDESC
"In this room is the most obese man you have ever set eyes upon, and that's not all -- he is so fat only half of him fits in this room, the other half is in another room, to the south. There are also stairs leading up.")
      (DESC "Half of Fat Man")
      (DOWN TO LADDER-BOTTOM)
      (UP TO MINE-4)
      (FLAGS RLANDBIT)
      (GLOBAL LADDER STAIRS)>

<ROOM LADDER-BOTTOM	;"was BLADD"
      (IN ROOMS)
      (LDESC
"This is the other half of an extremely over weight man. There are exits north,south and west.")
      (DESC "Other Half of Fat Man")
      (SOUTH TO DEAD-END-5)
      (WEST TO TIMBER-ROOM)
      (UP TO LADDER-TOP)
      (FLAGS RLANDBIT)
      (GLOBAL LADDER)>

<ROOM DEAD-END-5	;"was DEAD7"
      (IN ROOMS)
      (DESC "Evil's Room")
      (LDESC "As you enter the room you notice a tiny figure, about 10 inches tall, scurrying about trying to avoid being stepped on by you. As he pauses against the wall to catch his breath, you recognize the face on his olive pit-sized head -- it's Evil Kneivel.")
      (NORTH TO LADDER-BOTTOM)
      (FLAGS RLANDBIT)>

<ROOM TIMBER-ROOM	;"was TIMBE"
      (IN ROOMS)
      (LDESC
"This room is filled with brightly costumed dwarf break dancers who are doing everything from shoulder spins to moon walking. Against the wall several dwarfs a sitting with neck braces. There is a very narrow passage to the west. You can here the roar of a major highway to the west. There is an exit to the east.")
      (DESC "Dwarf Breakdancers")
      (EAST TO LADDER-BOTTOM)
      (WEST TO LOWER-SHAFT
       IF EMPTY-HANDED
       ELSE "You cannot fit through this passage with that load.")
      (ACTION NO-OBJS)
      (FLAGS RLANDBIT SACREDBIT)>

<ROOM LOWER-SHAFT	;"was BSHAF"
      (IN ROOMS)
      (LDESC
"This is a small drafty room in which a tiny turnpike enters the room from a small tunnel. To the south is a passageway and to the east a very narrow
passage.")
      (DESC "Drafty Room")
      (SOUTH TO MACHINE-ROOM)
      (OUT TO TIMBER-ROOM
       IF EMPTY-HANDED
       ELSE "You cannot fit through this passage with that load.")
      (EAST TO TIMBER-ROOM
       IF EMPTY-HANDED
       ELSE "You cannot fit through this passage with that load.")
      (ACTION NO-OBJS)
      (FLAGS RLANDBIT SACREDBIT)
      (PSEUDO "CHAIN" CHAIN-PSEUDO)>

<ROOM MACHINE-ROOM	;"was MACHI"
      (IN ROOMS)
      (DESC "Machine Room")
      (NORTH TO LOWER-SHAFT)
      (ACTION MACHINE-ROOM-FCN)
      (FLAGS RLANDBIT)>

\

"SUBTITLE COAL MINE"

<ROOM MINE-1	;"was MINE1"
      (IN ROOMS)
      (LDESC "In the corner of this room is a large piece of hairy cheese with a pair of arms and legs. It's mold man!")
      (DESC "Mold Man")
      (NORTH TO GAS-ROOM)
      (EAST TO MINE-1)
      (NE TO MINE-2)
      (FLAGS RLANDBIT)>

<ROOM MINE-2	;"was MINE2"
      (IN ROOMS)
      (LDESC "This room is considerably larger than the others because the entire state of Rhode Island is in this room.")
      (DESC "Rhode Island")
      (NORTH TO MINE-2)
      (SOUTH TO MINE-1)
      (SE TO MINE-3)
      (FLAGS RLANDBIT)>

<ROOM MINE-3	;"was MINE3"
      (IN ROOMS)
      (LDESC "In this room is a most unusual site. There is a man here who is part human, part vending machine. A museum patron drops two quarters in a slot in his fore-head and a can of Coke drops out of his pants.")
      (DESC "Vending Man")
      (SOUTH TO MINE-3)
      (SW TO MINE-4)
      (EAST TO MINE-2)
      (FLAGS RLANDBIT)>

<ROOM MINE-4	;"was MINE4"
      (IN ROOMS)
      (LDESC "As you enter this room you're taken aback. Standing in the middle of the room admiring a cardboard box is a man that appears to be half Mr. T and half Mike Dornbrook. He sneers at you and shouts in gruff voice, 'I pity the foo' who don't like the new packagin'.'")
      (DESC "Mr. D.")
      (NORTH TO MINE-3)
      (WEST TO MINE-4)
      (DOWN TO LADDER-TOP)
      (FLAGS RLANDBIT)>

<ROOM SLIDE-ROOM	;"was SLIDE"
      (IN ROOMS)
      (LDESC
"This is a small chamber, which appears to have been part of a
coal mine. On the south wall of the chamber the letters \"Granite
Wall\" are etched in the rock. To the east is a long passage, and
there is a steep metal slide twisting downward. To the north is
a small opening.")
      (DESC "Slide Room")
      (EAST TO COLD-PASSAGE)
      (NORTH TO MINE-ENTRANCE)
      (DOWN TO CELLAR)
      (FLAGS RLANDBIT)
      (GLOBAL SLIDE)>

\

;"RANDOM TABLES FOR WALK-AROUND"

<GLOBAL HOUSE-AROUND
  <LTABLE WEST-OF-HOUSE NORTH-OF-HOUSE EAST-OF-HOUSE SOUTH-OF-HOUSE
	  WEST-OF-HOUSE>>

<GLOBAL FOREST-AROUND
  <LTABLE FOREST-1 FOREST-2 FOREST-3 PATH CLEARING FOREST-1>>

<GLOBAL IN-HOUSE-AROUND
  <LTABLE LIVING-ROOM KITCHEN ATTIC KITCHEN>>

<GLOBAL ABOVE-GROUND
  <LTABLE WEST-OF-HOUSE NORTH-OF-HOUSE EAST-OF-HOUSE SOUTH-OF-HOUSE
	  FOREST-1 FOREST-2 FOREST-3 PATH CLEARING GRATING-CLEARING
	  CANYON-VIEW>>

;"The GO routine must live here."

<ROUTINE GO ()
	<ENABLE <QUEUE I-FIGHT -1>>
	<QUEUE I-SWORD -1>
	<ENABLE <QUEUE I-THIEF -1>>
	<QUEUE I-CANDLES 40>
	<QUEUE I-LANTERN 200>
	<PUTP ,INFLATED-BOAT ,P?VTYPE ,NONLANDBIT>
	<PUT ,DEF1-RES 1 <REST ,DEF1 2>>
	<PUT ,DEF1-RES 2 <REST ,DEF1 4>>
	<PUT ,DEF2-RES 2 <REST ,DEF2B 2>>
	<PUT ,DEF2-RES 3 <REST ,DEF2B 4>>
	<PUT ,DEF3-RES 1 <REST ,DEF3A 2>>
	<PUT ,DEF3-RES 3 <REST ,DEF3B 2>>
	<SETG HERE ,WEST-OF-HOUSE>
	<THIS-IS-IT ,MAILBOX>
	<COND (<NOT <FSET? ,HERE ,TOUCHBIT>>
	       <V-VERSION>
	       <CRLF>)>
	<SETG LIT T>
	<SETG WINNER ,ADVENTURER>
	<SETG PLAYER ,WINNER>
	<MOVE ,WINNER ,HERE>
	<V-LOOK>
	<MAIN-LOOP>>

