"GRAPHICS for
		      		JOURNEY
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<CONSTANT STAMP-RIGHT 1>
<CONSTANT STAMP-BOTTOM 2>
<CONSTANT STAMP-BASE <XORB 7 -1>>
<CONSTANT TOP-LEFT 0>
<CONSTANT TOP-RIGHT <ORB ,STAMP-BASE ,STAMP-RIGHT>>
<CONSTANT BOTTOM-RIGHT <ORB ,STAMP-BASE <+ ,STAMP-RIGHT ,STAMP-BOTTOM>>>
<CONSTANT BOTTOM-LEFT <ORB ,STAMP-BASE ,STAMP-BOTTOM>>

;"Picture stuff here..."

;"Part I"

<GDEF G-LAVOS
"Aerial view of the town of Lavos, with a single dirt path running down
a road. Two buildings, one on either side in the 'center' of town, are
the shop and tavern. Other smaller buildings and houses can be spotted
nearby, preferably off of the main path. In the distance, the road descends
and winds its way down a steep canyon. Taller mountains are in the
background." 1>

<GDEF G-WEBBA
"Inside the provisioner's shop; a portly fellow is standing at the counter.
A variety of odds and ends, mostly foods, would be behind him." 42>

<GDEF G-MAP
"The map, old and crude, on parchment. Important are a river with mountains
behind. A path from the river and leading into the mountains branches twice
to the left and right (i.e. the second branch is a fork, the first an
intersection of sorts.) All paths are winding and appear to go up to the
highest peak, the Sunrise Mountain (not labelled.) At all four branches,
the same rune (arbitrary) appears in red." 43>

<GDEF G-TAVERN
"Inside the tavern; smoky, men at tables or at the bar. No particular
details are important here." 44>

<GDEF G-FORK
"In the canyon, the narrow path forks to the left and right; the left path
follows along the near side of the mountains, in the foothills; the right
path wins its way behind the mountains and out of sight." 2>

<GDEF G-BEHIND-MOUNTAINS
"We are now behind (south) of the mountains, having descended a steep
path. I think the view should be back toward the north and the back side
of the mountains, maybe showing in the distance the winding path that
led here." >

<GDEF G-CANYON
"A canyon at the base of the foothills; perhaps another aerial view.
The mountains should rise fairly steeply on the right side of the path.
Gradually, as the path winds into the distance, we should see another range
of mountains ahead in the far perhaps fainly, as in a mist. The terrain
in the canyon is scrubby, arid: almost desert-like." 45>

;<GDEF G-MOUNTAIN-PATH
"A long, winding path leading up into the mountains; I think this picture
has been drawn already as G-CANYON."> 

<GDEF G-BANDITS
"A fight in desert-like terrain, accented with odd rock projections and
boulders. View of our opponents, a group of human thugs brandishing crude
weapons (knives, clubs, etc.)" 3>

<GDEF G-FOREST-RIDGE
"From a hilltop, a path leads down into a vast forest,
thick with evergreens and less familiar trees. Beyond, a wide river flows
across our view, disappearing into a deep canyon to the right. Beyond that,
a mountain range, the largest of which is the Sunrise Mtn whose jagged peak
towers above the others. I think the Sunrise Mtn is always shrouded in
cloud; mysterious." 4>

<GDEF G-GATE-RUNES
"Close-in at base of hills, rock wall in foreground with scruby vegetation;
chiselled in the rock are some strange runes (different style than that
of the map.) Perhaps the shadow of Tag cast across the rock." 5>

<GDEF G-GATE-OPENS
"Same as before, but a previously unseen, perfectly round door in the rock
is open; it is dark inside. Shadows of the group now; three people should be
enough." 6>

<GDEF G-NIGHTFANG
"Forest scene; trees all around, but we're in a small clearing. An evil
snake, perhaps with sharp spines, lies dead on the ground; one of our group
(can't identify him from the picture!) lies slumped against a tree." 7>

<GDEF G-PRAXIX-HEALS-BITE
"Praxix healing the bite victim by applying a poultice to his leg." 46>

<GDEF G-ELF-HEALS-BITE
"Elf healing the bite victim with her touch." 8>

<GDEF G-TANGLEWOOD
"Forest of 'snaketrees'; close together, slimy, sinewy branches that
undulate, as if alive. They are very evil, and capable of strangling
anything that gets in their path. Perhaps some dead animal crushed in
a tree could indicate the danger (scary, but not gross.)" 9>

<GDEF G-TANGLEWOOD-BURNS
"Same view, with path 'burned out' in front of us by Praxix' spell.
These trees recoil from fire, and a fireball has just shot through." 10>

<GDEF G-WATERFALL
"A stream running through the forest tumbles down a ca. 6 foot waterfall
and into a pool. At the edge of the pool, facing away from us, kneeling, is a
Wood Elf: skinny, tall, long flowing brown hair, giving the appearance of
great beauty and grace." 12>

<GDEF G-WATERFALL-NO-ELF
"Stream, waterfall, and pool; without the elf." 11>

<GDEF G-ELF
"Tag has approached the Elf, who has turned to face him. She is hideous, face
leathery and brown, more like a gnarled tree than a person. Her arms are
outstretched toward him; eyes clear, large, and fathomless." 13>

<GDEF G-GLADE
"Praxix is in a glade in the forest, filled with tall grasses and wildflowers
(which can be quite imaginative; they are harmless, however.) A large tree
stump should be partially revealed through the tops of the grass." 14>

<GDEF G-STUMP
"In the glade, the stump is broken in two, revealing a dark passage
leading downward. Probably best to be a view angling down on it." 15>

;<GDEF G-FOREST-TUNNEL
"A dark tunnel under the forest, covered in mosses and other strange
plants. The only light is cast by Praxix' staff, which glows a pale
red." 60>

<GDEF G-WARREN
"Same sort of tunnel, but with passages leading in various directions;
the impression is one of confusion, not knowing which is the right one
to take. Perhaps looking down Praxix' arm, staff lit, outlining a couple
of similar looking passages." 16>

<GDEF G-WARREN-LIGHT
"Darkness, except for a ring of light above, outlining a hidden exit." 17>  

<GDEF G-FALLS
"View from rocks atop a waterfall; below, the turbulent river courses
through smooth rock walls, disappearing into an underground cavern.
At the bottom of the falls, a misty rainbow." 18>

<GDEF G-RIVER
"View of river from the shore, running left to right, then around
a corner and out of view. This will be used in a number of places,
so it might be an aerial shot. Forest would be in the foreground,
mountains background.">

<GDEF G-MOUNTAIN
"View from path approaching Sunrise Mountain, the tallest peak in
the range that's dead ahead. It's possibly snow covered, or at
least shrouded in cloud. Its peak should be jagged, somewhat
frightening. Somewhere atop the peak is the Sunrise Tower, made of
stone." 19>

<GDEF G-ASTRIX
"Astrix in the Sunrise Tower; stone room with windows looking out
into the sky. The group (not pictures) is in a semi-circle around a
blazing fire, listening to him. It could be nighttime if that is
desierable. Astrix must be imposing, though perhaps not by
virtue of his size; he is an old man, though, with a stringy gray
beard. Perhaps something in his eyes?" 20> 

<GDEF G-FOUR-STONES
"Astrix' hands outstretched, holding four stones (blue, brown, green,
and red.) I imagine the stones as gem-like, though shape is indeterminate.
The red stone is glowing in with a warm red glow." 21>

<GDEF G-ELF-HOME
"The Elves home, in the forest. Hammocks are strung between the trees
fairly high up; this is where they sleep. There is a fire in the
forest in the background; lots of Elvish activity, if that can be
conveyed." 47>

<GDEF G-FOREST-FIRE
"A great wall of fire before us; the forest is aflame!" 48>

<GDEF G-FIRE-RAINS
"Same scene, but dark clouds above, rain falling in sheets, quenching
fire." 49>

<GDEF G-HIGH-PLAIN
"High in the mountains; a lake below us, in a bowl in the mountains.
Sunlight plays on its surface; a path leads down to the lake and a
stream crosses the path about halfway down." 50>

<GDEF G-GOLD-STREAM
"At the side of the stream; the sky is dark and very threatening.
Lightning, perhaps, in the distance." 51>

<GDEF G-BLACK
"Pitch black." 59>

<GDEF G-DARK-CAVERN
"Darkness on bare cavern walls, but for the red glow of Praxix' staff." 52>

<GDEF G-DWARVES-FV
"In the caverns, darkness before us, except for some shadowy human
shapes in the distance, illuminated as if by fire.">

<GDEF G-DWARVES
"In the caverns, surrounded by Dwarves, carrying torches and swords.
The Dwarves are heavily built, but not short; neither do they necessarily have
beards and axes.  However, they should look somehow distinctive, as
if from a pretty closely related race. One Dwarf is important; he
is older, more dignified (this is Agrith.)" 22>

<GDEF G-PRISON-RUNES
"In the caverns, a smooth stone wall with a single word, in Dwarvish
runes, carved into the stone." 61>

<GDEF G-PRISON
"A large chamber, with identical passages leading away on both sides
into dark tunnels." 53>

<GDEF G-PRISON-FV
"Same chamber, with a ball of flame coming toward the foreground,
our group having fallen to the ground in fear of it." 23>

<GDEF G-D-STAIR-BOTTOM
"In the caverns, the bottom of a wide stairs, roughly hewn into the rock." 24>

<GDEF G-OVER-FALLS
"The log raft going over the falls; perhaps, looking down over the front
of the raft into the churning waters and rocks below." 54>

<GDEF G-STAIR-JUNCTION
"The stairs reach a junction with narrower stairs leading up to the
left and right." 25>

<GDEF G-STAIR-CHASM
"The stairs here have become narrow and are spiralling upward; before us,
the stairs are broken, leaving a ten foot gap before the stairs continue
farther up." 26>

<GDEF G-CROSS-STAIR-CHASM 
"Someone (unclear) is in midair across the chasm, in the process of being
literally blown across it by Praxix' wind spell." 27>

<GDEF G-SUNSET-TOWER
"Inside the Sunset Tower, a stone tower at the top of the stairs. Through
a window looking east, over foothills and forests (easier still, over
low lying clouds,) lies the Sunrise Mountain (and tower,) its jagged
peak shrouded in cloud." 62>

<GDEF G-STAIR-GATE
"At top of stairs, round Dwarvish door open to a darkening sky; a star or
two in the sky; viwe should be looking outward through door." 28>  

<GDEF G-HIGH-GATE
"Nighttime scene, high in the mountains. Dazzling stars; full moon, perhaps
glistening off of a lake that's far below." 29>

<GDEF G-ORC-FORK
"In the caverns, a fork of two paths; from the right path, a dim glow
against the walls." 63>

<GDEF G-ORC-ANTE
"The passage ahead opens into a vestibule, in the middle of which five
grotesque figures (orcs) huddling around an open fire. Someone is bound
and gagged on the ground nearby." 30>

<GDEF G-ORC-FIGHT
"Bitter fighting with the orcs, who use clubs, swords, and knives." 31>

<GDEF G-HURTH-DIES
"Agrith (described before) kneeling with his dead son, Hurth, in his arms.
Since Hurth is in the party, his face should not be visible. He has
suffered fatal wounds to the head and torso." 32>

<GDEF G-PLAIN-RIDGE
"Looking over a rise; behind the NEXT rise, smoke is rising into the
sky." 65>

<GDEF G-HERMIT-HILL
"Looking down from a hill in the mountains down to a small ramshackle
shack; smoke is coming from a makeshift chimney." 33>

<GDEF G-HERMIT
"Inside the shack, a hermit is standing before us. He is old and stooped,
one eye gone, the other nearly blind with cataracts. His clothes are torn
and bloodied. The hut itself is a disaster area." 34>

<GDEF G-LAKE-SHORE
"At the shore of the lake, a crystal clear blue. The shore here is sandy,
but becomes more rocky elsewhere. Perhaps some air bubbles rising from
the water where one of the party has dived in." 56> 

<GDEF G-LAKE-SHORE-CAVE
"Another point along the lake; a rocky cave leads into darkness." 58>

<GDEF G-LAKE-POOL
"Inside the cave, a small warm-water pool; perhaps steam is rising
from it. Crystal clear, it is possible to see far down into it." 64>

<GDEF G-UNDERPOOL
"Tag is here underwater, at the poit where the natural rock forming
the pool transforms into a perfectly smooth tube continuing downward.
The idea is to emphasize the fact that the tube is clearly unnatural
(i.e. built.)" 35>

<GDEF G-UNDERPOOL-TUBE
"The tube ends here; below, open waters. Tag will have to decide whether to
ascend here or risk the unknown." 36>

;<GDEF G-NYMPH-POOL
"Tag has now surfaced at another, larger pool and onto a sandy area. The
chamber was wide, and carved into the rock; however,, a finely carved
archway leads into a dimly glowing passage. On the archway are runes
unlike others we have seen." 37> 

<GDEF G-NYMPH-CHAMBER
"We're now in a grander chamber adorned with colorful
banners. Lying on a bed of straw and covered in a heavy
woolen blanket is one of our party (undetermined.)" 38>

<GDEF G-LIURA
"In the grander chamber, Tag is with a small, thin man, who is a Nymph;
Nymphs should, like Dwarves,
appear to be a different, but related, race to humans. They are adapted
to long times underwater, but aren't anything so obvious as mermaids and
such like." 39>

;"Part II"

;<GDEF G-FOREST-FORK
"In a forest, two paths lead off in roughly the same direction." 66>

<GDEF G-HURTH-SHADOW
"In the caverns, a path continues before us; also, a stair is here,
leading down.  A person's shadow is visible near the stair." 67>

<GDEF G-MID-STAIR
"On the stairs, a landing; they continue downward, but there is
also a path leading away from the landing." 68>

<GDEF G-ORC-VIEW
"The path ahead curves to the right; around the curve are a group
of orcs; the picture might include a bit of the near walls in the
foreground, to give the impression of peeking around the corner.
In front of us is a narrow slit in the rock, just barely large enough
to go into." 69>

<GDEF G-PRAXIX-DIVERSION
"Looking down a darkened cavern toward the group of orcs, lit by
torchlight." 70>

<GDEF G-CHARGING-ORCS
"Same view, but orcs are now approaching, and they are angry." 71>

<GDEF G-CHARGING-ORCS-FROM-ABOVE
"Praxix looking down on orcs charging by beneath him." 72> 

<GDEF G-NARROW-SLIT
"Going through a narrow slit in the rocks; ahead, it appears the
path widens." 73>

<GDEF G-DEAD-END
"The path dead-ends here in a wide chamber; the view should be
looking back toward the narrow slit through which we entered." 74>

<GDEF G-DEAD-END-ORCS
"Same view, but orc(s) are starting to come through slit." 75>

<GDEF G-FLUME
"The party, having fallen into a raging underground river
through twisting caves, are taking the flume ride of their lives." 76>

<GDEF G-FLUME-POOL
"At the side of a pool, where the group has escaped the raging
river. One of the group is injured badly, and is unconscious on
the ground. A passage climbs along the side of the river." 77>  

<GDEF G-ALONG-FLUME
"Along the river (on the right,), the path continues upward.
A well-constructed tunnel leads into more caverns." 78> 

;<GDEF G-LOWER-STAIR
"In the caverns, the bottom of the stairs we saw previously.
On either side, passages lead off." 79>

<GDEF G-MINE-JUNCTION
"A small, open chamber from which two passages lead.
One, supported by old wooden beams, appears to be an abandoned mine
of some sort. The other appears to be a more recent excavation." 80>

<GDEF G-MINE-JUNCTION-2
"Previous image of two mines, but this time the old mine has collapsed,
making it impassable." 81	; "Stamp in bottom-left">

<GDEF G-OLD-MINE
"The ancient wooden beams which were intended to hold up the walls and roof
appear ready to collapse. Small pieces of rock fall from above; a cave-in
is imminent." 82>

<GDEF G-MINER-PASSAGE
"A smallish, round chamber, and the end of which, a narrow slit in the
rock continues onward. Maybe some signs of this place having been mined;
rocks on the ground, etc." 83>

<GDEF G-ACTIVE-MINE
"Another small chamber, recently mined; perhaps it's a view back to
the narrow slit." 84>

<GDEF G-MINER
"Same picture, but with Miner having appeared from nowhere; he has a
sack filled with rocks." 85	; "stamp; don't know position">

<GDEF G-GATE-JUNCTION
"A wide vestibule with paths leading both left
and right; while the right path is wide and ornate, the one to the
left is crudely constructed." 86>

<GDEF G-MINE-HOLE
"A small, crude chamber with a crack in the earth leading down into
darkness." 87>

<GDEF G-MINE-FIND
"View of someone holding up a human bone and an large iron key to the
view of the others, above him. Perhaps they are holding a torch near
the hole, so that we can't see them. The someone holding the bone and
key's cloak is glowing a faint red." 88 ; "stamp; don't know position">

<GDEF G-MASSIVE-DOOR
"Our chosen path led through a richly carved vestibule, at the end of
which sat a formidable wooden door, which would be impossible to break
through. An equally formidable lock with keyhole is imbedded in the door." 89>

<GDEF G-VAULT
"A tall, rounded chamber.  A beam of light from high
above illuminates a metallic vault inset into the floor of the
chamber. Inscribed in the stone around the vault are runes which
look to be Dwarvish, but are somehow different." 90>

<GDEF G-COFFIN
"The same scene, but the vault has been magically revealed to be a
magnificent coffin, of polished stone." 91	; "stamp; don't know position">

<CONSTANT G-COFFIN-WHERE 105>

<GDEF G-CEDRITH
"Inside the coffin, a Dwarvish body, perfectly preserved; he wears a
long, white robe which glistens in the light of Praxix' staff. Around his
neck, a round white stone hung at the end of a golden chain." 92>

<GDEF G-TALKING-TREE
"Praxix, in the forest; nearby a very chatty tree. Now, it turns out
that this is a singular talking tree, but it should look quite similar
to the trees around it, with some human facial features and possibly
an arm (branch) gesture. The effect should be somewhat comical." 93>

<GDEF G-FOREST
"Generic forest scene with a couple of paths leading off through
it." 94>

<GDEF G-MILL
"A mill (grains), alongside a river; it is old and abandoned." 95>

<GDEF G-MOAT
"A moat lies before us with a badly damaged bridge leading across; in
the background, a castle, also old and badly broken. Of the towers that
may have been there, only one remains standing. The moat is described
as having a greenish cast with red weedy things on the surface." 96>

<GDEF G-COURTYARD
"The castle courtyard, perhaps from above; on one side, the standing
tower, and on the other, the bridge and moat. Ruins of the castle are
all around." 97>

<GDEF G-UMBER
"Atop the remaining tower; standing there is a young man who should bear
a striking resemblance to the talking tree from before (in fact, the
talking tree was a hallucination.) Prehaps his arms are in the same
position, etc." 98>

<GDEF G-DUNGEON
"A dungeon of crumbling prison cells. The oppressive
moisture and the passage of time has taken a heavy toll on the
wooden prison doors, which stand open in ghostly silence." 99>

<GDEF G-TROVE
"A large room behind one of the prison cells in the dungeon; the room
is bare except for a large chest, brimming with precious stones." 100>

<GDEF G-TROVE-STONE
"Same picture except a single black stone is glowing powerfully from
within the chest." 101	; "stamp; don't know position">

<CONSTANT G-TROVE-STONE-WHERE 106>

<GDEF G-ORC-TRAP
"In the forest, one of the party has been caught in a net trap,
and is dangling in the trees above the group. Orcs are coming to
nab their prey (they needn't be in the picture.)" 102>   

<GDEF G-OUTSIDE-ORC-CAMP
"The orcs camp; dozens of orcs here, living out in the open or in
makeshift tents of rotten cloth. It should be squalorous." 103>

<GDEF G-ORC-TENT
"Inside one of the orcs' tents, the trap victim is bound and gagged." 104>

;"Part III"

<GDEF G-PART-THREE
"Astrix took the Two stones in his hand, and it seemed that they became
one, occupying the same space, and suffused with a brilliant white glow.
Peering into the glow, Astrix went into a trance....">

<GDEF G-ZAN-DEMON
"In an open plain, the group is approaching the seaport of Zan; high above,
a large, black shadow is circling." 109>

<GDEF G-FOG-CLEARS
"Through breaks in the fog, the black shadow can be seen heading south
towards Zan." 110>

<GDEF G-DEMON
"The demon, standing before the party, rides a large black bird. His
dress is like that of a Wizard, but a dark hood covers his face. This
scene should be quite frightning; he is the emissary of the Dread Lord." 111>

<GDEF G-DEMON-KILLS-SOMEONE
"The demon kills one of the party simply by stretching his arm out toward the
person, hand open, and then slowly closing his hand into a fist, which
effectively crushes the person to death. [This could be one of a couple of
people.]" ; "I think this is a stamp, # 112, at upper-left corner">

;<GDEF G-ZAN-1
"The main street in Zan, facing the wharf. On one side of the road is a
general store; on the other, a curio shop; it is quite late in the day.">

;<GDEF G-ZAN-2
"The main street in Zan, closer to the wharf. On one side is a tavern, on
the other is an inn.  According to the story, each has a sign in front of
it: the tavern is called Stormy Seas, and the inn is called Rest Easy;
again, it is twilight or later.">

<GDEF G-ZAN
"The main street in Zan - on one side, a general store; on the other,
a curio shop.  Down the road, closer to a wharf, are a tavern and
an inn; it is twilight." 113>

<GDEF G-CURIO-SHOP
"Inside the curio shop; lots of bric-a-brac, assorted junk. An ornery
fellow is behind a counter." 114>

<GDEF G-GRAY-STONE
"Praxix is at the counter, intently examining a gray stone that has been
shown to him by the proprietor; the stone is pyramidal in shape. The
proprietor is standing by; on the counter, perhaps, is a small case
holding other, less interesting, stones and gems." 115
;"Sticker; lower-right">

<GDEF G-ZAN-TAVERN
"Inside the tavern at Zan, a smoky room; the party (at least four people
including Bergon, Praxix, and Tag) is sitting at a table. The crowd is
mostly sailors and other assorted townspeople." 116>

<GDEF G-OTHER-TABLE
"Another table in the eating area of the tavern; a group of four is
sitting there. The one facing away from our party, it turns out, is the
demon (although you can't see his face, of course) - the other three are
hired assassins." 117>

;<GDEF G-EAVESDROPPING
"Tag is now invisible, eavesdropping on the other table, so this is a
closer view; he still can't see the face of the demon; it is covered
by a dark hood.  They are discussing plans to kill the party in their
sleep later that night." 118>

<GDEF G-INNKEEPER
"Inside the inn; an old, toothless man is behind the counter." 119>

;<GDEF G-INNKEEPER-HITS-ESHER
"The innkeeper, in a seeming stupor, has come from behind the counter and
socked Esher, knocking him to the ground." 120>

<GDEF G-WHARF
"At the wharf, looking toward the boats; there are a number of slips, but
only three are occupied.  Two of the sailing ships are ketches, one is a yawl.
Each is supposed to have a name and an emblem; clearly three names on boats
won't be visible; however, the names are Elfentide, Zephyr, and South Seas."
121>

<GDEF G-ELFENTIDE
"On board the Elfentide, one of the ketches; it is a fishing vessel. We're
talking (actually, Bergon's talking) to the captain; he can look any way
you like, but, I expect he's the old salt type." 122>

<GDEF G-ZEPHYR
"On board the Zephyr, the other ketch; Bergon is talking to the captain, who is
standing at the wheelhouse. This fellow's another old salt type, but comes
across as being somewhat depressed or fatalistic about something that may be
about to happen." 123>

<GDEF G-SOUTH-SEAS
"This is the yawl; Bergon again talking to the captain. This boat is in
much better repair than the others, the captain more polished. He is anxious
to take the party for a ride..." 124>

<GDEF G-ZAN-FIRE
"Camping outside of town in the pre-dawn darkness, we can see that something
in town is ablaze (in fact, it is the inn.)" 125>

<GDEF G-ASSASSINS
"Camping outside of town, a group of assassins has just ruthlessly murdered
one of the party in his sleep; perhaps we see them by the glow of a campfire.
The others will eventually get away unharmed." 126>

;<GDEF G-INN-FIRE
"Sleeping at the inn, a fire has been set; flames and smoke are coming into
the one of the rooms in which the party is sleeping (they have two.)" 127> 

<GDEF G-JAIL
"Inside a bare jail cell; bars on the window and door; the group is looking
for some way to escape." 128>

<GDEF G-SHERIFF
"In the cell, but now the sheriff is standing outside, looking quite
angry at having been disturbed from his slumber." 129 ; "STAMP; upper-right">

;<GDEF G-SHERIFF-AND-TAG
"The sheriff, startled by the materialization of Tag, whose fingers are
grapsing for the cell door key which is hanging on the sheriff's belt."> 

<GDEF G-SHERIFF-OPENS-CELL
"The sheriff, in a trance, has opened the jail cell door, allowing the
group to escape." 130>

<GDEF G-BOAT
"On board the chosen boat (could be any of the three,) looking out
over the seas toward the Twin Islands, one on either side of the
bow, in the distance. The sky is dark and threatening." 131>

<GDEF G-TREACHERY
"On board, under dark skies, the crew attacks our party, catching
us completely by surprise; everyone is killed in the melee except
Tag." 132>

<GDEF G-MAST-FALLS
"A bolt of lightning has hit the main mast, which is falling directly
at Bergon; a terrible storm has engulfed the ship." 133>

;<GDEF G-DEMON-KILLED
"A bolt of lightning, cast magically by Tag, strikes the demon, leaving
only smoking remains." 134>

<GDEF G-EVIL-ONE
"As the smoking remains of this messenger of evil rises into the sky,
so does another shape, forming itself from the very ashes. Its face is
a pale gray, its eyes a fiery red; this is the Dread Lord himself." 135>

<GDEF G-BOAT-FOG
"The boat has now entered a thick, unearthly fog." 136>

<GDEF G-ABOVE-FOG
"Tag has now risen straight up from the deck of the boat (Praxix has
levitated him) and is now just above the top of the fog layer, looking
at the Misty Isle, which is, in fact, sun-drenched. A large castle
sits atop the highest point on the island." 137>

<GDEF G-ALMOST
"In the high castle, a large and beautiful chamber with a large table
in the center. Astrix is there, despondent, for we have failed at the
end of our long journey." 138>

<GDEF G-WIZARDS
"In the high castle, a large and beautiful chamber with a large table
in the center. Astrix is there, elated; he is holding the One stone.
Around the table are five other Wizards like himself, standing; their
form seems to shimmer, as if they are not entirely of this earth." 139
;"stamp; upper-left">
 
;"Recently added graphics"

<GDEF G-MINAR
"Minar offers his services outside of the tavern in Lavos; also in
scene are Bergon, Praxix, Esher, and Tag.">

<GDEF G-LAKE-SHORE-3
"As far as we can go along the shore of the lake; a steeply climbing
path leads upward, out of the bowl that the lake sits in.">

<GDEF G-PARTY-RESCUES-PRAXIX
"Tag and whomever is left alive of the party arrive at the castle
moat and rescue Praxix, and possibly Umber, with their rope. There are
a number of possible ways of depicting this....">

;<GDEF G-CAIRN
"A shaded spot in the canyon (part one); a rock cairn lies on the
ground. Beside it, the party has opened up a shallow grave in which
lie the still clothed remains of Garlimon's party - three people in
all.">

<GDEF G-ZAN-CAVE
"It's pouring outside; the party is here waiting out the storm.">