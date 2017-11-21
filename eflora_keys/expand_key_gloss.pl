#Replace the DATA section with a new glossary, or make changes to the data section
#The first_term second term cleverness is not necessary for this pruned version. It should handle sporangium (sporangia)

$/="";
while(<DATA>){
($term,$desc)=m/^(.*)\n([^\000]+)/;
++$termcount;
$desc=~s/\n/ /g;
$desc=~s/ *$//;
if ($desc=~/1\./ && $desc !~/2\./){
print;
}
if ($term=~/[()]/){
($first,$second)=m/(.*) \((.*)\)/;
$first_term=$termcount;
$second_term=++$termcount;
$ucf=ucfirst($first);
$ucs=ucfirst($second);
print <<EOP;
$first_term\t$first\t$desc
$second_term\t$second\t$desc
EOP
$prog.=<<EOP;
if(s|\\b$first\\b|<$first_term>|){next;}
if(s|\\b$ucf\\b|<$first_term>|){next;}
if(s|\\b$second\\b|<$second_term>|){next;}
if(s|\\b$ucs\\b|<$second_term>|){next;}
EOP
}
else{
$uterm=ucfirst($term);
print <<EOP;
$termcount\t$term\t$desc
EOP
$prog.=<<EOP;
if(s|\\b$term\\b|<$termcount>|){next;}
if(s|\\b$uterm\\b|<$termcount>|){next;}
EOP
}
}
$prog = <<EOP;
while((\$key,\$value)=each(\%TREAT)){
\@words=split(/\\n/,\$value);
foreach(\@words){
last if m/<JDS/;
last if m/<SP_IN/;
next if m/"/;
if(m/^[A-Za-z]/){
$prog
}
}
\$contents=join("",\@words);
\$NEWTREAT{\$key}=\$contents;
print \$key\\n;
}
EOP
print $prog;
#$/="";
#die;
use BerkeleyDB;
$file="output/IJM_key.hash";
$newfile="output/IJM_expanded.hash";
tie(%TREAT, "BerkeleyDB::Hash", -Filename=>$file, -Flags=>DB_RDONLY)|| die "$file: $!";
tie(%NEWTREAT, "BerkeleyDB::Hash", -Filename=>$newfile, -Flags=>DB_CREATE)|| die "$newfile: $!";
eval ($prog);

__END__
abaxial
Side or surface of a structure away from the axis distal to the point at which the structure is borne (e.g., lower surface of a leaf, outer surface of a petal). (see adaxial)

achene
Dry, indehiscent, 1-seeded fruit from a 1-chambered ovary in which the fruit wall is free from the seed, sometimes winged; often appearing to be a naked seed. 1-seeded dry fruit derived from an inferior ovary of > 1 carpel (e.g., Asteraceae, Dipsacaceae, Valerianaceae) is sometimes called a cypsela

acid
Soil or water with a low pH, often found in habitats such as coniferous forests and bogs where decomposition of plant remains liberates an excess of hydrogen ions

acidic
Soil or water with a low pH, often found in habitats such as coniferous forests and bogs where decomposition of plant remains liberates an excess of hydrogen ions

acroscopic
In ferns, facing or directed toward the tip of the leaf (e.g., on any pinna, acroscopic pinnules are those on the side closest to the leaf tip). (see basiscopic, distal)

acuminate
Having a long-tapered, sharp tip, the sides concave. (see acute, awl-like)

acute
Having a short-tapered, sharp tip, the sides convex or straight and converging at less than a right angle. (see acuminate, obtuse)

adaxial
Side or surface of a structure toward the axis distal to the point at which the structure is borne (e.g., upper surface of a leaf, inner surface of a petal). (see abaxial)

adherent
Sticking to and sometimes appearing fused to another part of like or unlike kind, but separable from it, such as 'perianth adherent to fruit'. (see appressed, fused)

adventitious
Arising at unusual times or places, such as roots on aerial stems

aggressive
Growing or spreading rapidly or invasively, outcompeting other plants, difficult to control

alien
Not native; introduced purposely or accidentally into an area. (see native, naturalized, ruderal, waif)

alkali
Soil or water with a high pH (i.e., basic), often found in areas where evaporation concentrates dissolved solutes

alkaline
Soil or water with a high pH (i.e., basic), often found in areas where evaporation concentrates dissolved solutes

alkali sink
Basin area in region of interior drainage characterized by soils with high salinity and high pH

alluvial
Pertaining to sediments deposited by flowing water

alluvial fan
Fan-shaped deposit of rocks, gravel, and finer sediments, in California generally on lower slopes of mountains

alpine
Pertaining to the vegetational/altitudinal zone above timberline; zone above the subalpine

alternate
1. Arranged singly, often spirally, along an axis (e.g., one leaf per node). (see opposite, whorled) 2. Occurring in different ranks, appearing to be between, not directly above or below, as 'stamens alternate petals'. (see rank)

angiosperm
Plant that bears flowers (hence, 'flowering plant'), in which 'vesseled seeds' (hence, angio-sperm) are enclosed in an ovary; woody to herbaceous

annual
Completing life cycle (germination through death) in one year or growing season, generally non-woody. (see biennial, herb, perennial)

anther
Pollen-bearing portion of a stamen, including one, two, or four pollen sacs. (see filament)

apogamous
Forming a sporophyte (the generation in a vascular plant life cycle that is conspicuous, 2n, and produces spores, which give rise to gametophytes) from a gametophyte (the generation in a vascular plant life cycle that is inconspicuous, n, and produces sperms and eggs, which usually unite in fertilization to give rise to sporophytes) by direct, asexual development, rather than by fertilization of eggs by sperms

appressed
Parallel or nearly parallel to and often in contact with surface of origin; used to describe the disposition of hairs, leaves, pedicels, etc. (see adherent, fused)

aquatic
Growing under, in, or on water (generally fresh; if brackish, saline, or marine, so indicated), whether rooted in bottom or floating, and including plants with parts of shoots submersed but with other parts above water (e.g., Potamogeton gramineus); excluding plants of seeps or wet rocks. (see emersed, submersed)

areole
1. In Cactaceae, a well-defined, axillary area (short shoot) generally bearing one to many spines and other, shorter structures (e.g., Ferocactus cylindraceus glands, Opuntia glochids). 2. In general, each of many areas defined by smallest veins on a leaf

aril
Fleshy, corky, or bony appendage arising at or near the point of seed attachment, sometimes completely covering the seed

armed
Bearing prickles, spines, or thorns

ascending
Curving or angling upward from base, or about 30---60 degrees less than vertical or away from axis of attachment. (see decumbent, erect)

auricle
In Poaceae, a structure, often lanceolate, projecting from both margins of the leaf lateral to the ligule. (see ligule)

awl-like
Narrow throughout, but broader at the base and tapered to a sharp tip. (see acuminate)

awn
1. Bristle-like appendage or elongation, generally terminal. 2. Stiff, needle-like pappus element in Asteraceae

axil
Distal, adaxial angle between an appendage or branch and a main axis (e.g., between leaf and stem, or between lateral vein and midrib on a leaf)

axile
Pertaining to an axis, as of a placenta along the central axis in a compound ovary with more than one chamber

axillary
Pertaining to or within an axil, especially a leaf axil

axis
Line of direction, growth, or extension; structure occupying such a position (e.g., the main stem of a plant or inflorescence, the midrib of a leaf)

axes
Line of direction, growth, or extension; structure occupying such a position (e.g., the main stem of a plant or inflorescence, the midrib of a leaf)

banner
Uppermost, often largest petal of many members of Fabaceae

bar
Mound-like temporary deposit of sand or gravel in the channel or mouth of a waterway

barbed
Having sharp, normally downward- or backward-pointing projections. Said of an awn, bristle, or other structure

bark
Tough tissue (including phloem) covering the wood (hardened xylem) of subshrubs, shrubs, trees, and some vines. (see wood)

barren
Area in which vegetation is sparse due to harsh or limiting growing conditions, such as those associated with shallow, infertile, rocky soil

basal
At or near the base of a plant or plant part. Especially said of leaves clustered near the ground or of a placenta confined to the base of an ovary

basiscopic
In ferns, facing or directed toward the base of the leaf (e.g., on any pinna, basiscopic pinnules are those on the side closest to the leaf base). (see acroscopic, proximal)

beak
Generally distal or terminal, narrowed, generally sterile part of fruit or surrounding structures (e.g., Ambrosia bur, Carex perigynium)

bell-shaped
Widening more or less abruptly at the base and then generally more gradually toward the tip. (see funnel-shaped, rotate, salverform, urn-shaped)

berry
Fleshy, indehiscent fruit in which the seeds are generally more than 1 and are not encased in a stone (e.g., Solanum americanum). (see drupe, pome)

biennial
Completing life cycle (germination through death) in two years or growing seasons (generally flowering only in the second), non-woody (at least above ground), often with a rosette the first growing season. (see annual, herb, perennial)

bilateral
Divisible into mirror-image halves in only one way. (see asymmetric, biradial, radial)

biradial
Divisible into mirror-image halves in two ways; isobilateral. (see asymmetric, bilateral, radial)

bisexual
Both male and female reproductive parts occurring and functional in the same plant or structure (e.g., flower, spikelet, inflorescence). (see unisexual, pistillate, staminate, dioecious, monoecious)

blade
Expanded portion of a leaf, petal, or other structure, generally flat but sometimes rolled, cylindric, wavy, or cupped

brackish
Somewhat salty, generally a mixture of saline and fresh water

bract
1. Generally reduced, leaf- or scale-like structure subtending a branch, cone scale, inflorescence (infl bract), or sessile flower or pedicel (fl bract). 2. Generally reduced, leaf- or scale-like structure on a peduncle or scape that may or may not subtend another structure. (see bractlet)

bractlet
1. Relatively small, generally secondary bract within an inflorescence. 2. Bract-like structure on a pedicel that may or may not subtend another structure. (see bract)

bristle
1. Relatively large, generally stiff, more or less straight hair (e.g., Navarretia breweri). 2. In Asteraceae, fine, cylindric or minutely flattened pappus element (e.g., Calycoseris parryi) or epidermal outgrowth on the receptacle (e.g., Centaurea solstitialis)

bud
1. Incompletely developed, more or less embryonic shoot, usually covered with bud scales. 2. Unopened flower, often protected by sepals

bulb
Short underground stem and the fleshy leaves or leaf bases attached to and surrounding it (e.g., an onion). (see stem, corm, caudex, tuber)

bulblet
1. Small bulb generally produced at the base of a bulb. 2. Any small, bulb-like structure that propagates a plant, often in a leaf or bract axil

bur
Fruit or fruiting inflorescence with awns or bristles, often barbed (e.g., Xanthium strumarium)

callus
1. In some Poaceae, enlarged or projected hard base of floret; sometimes hairy or sharp-pointed. (see floret) 2. Firm protuberance

calyx
Collective term for sepals; outermost or lowermost whorl of flower parts, generally green and enclosing remainder of flower in bud. Sometimes indistinguishable from corolla

calyces
Collective term for sepals; outermost or lowermost whorl of flower parts, generally green and enclosing remainder of flower in bud. Sometimes indistinguishable from corolla

canescent
Covered with dense, fine, generally grayish white hairs (e.g., Phoenicaulis cheiranthoides leaf)

capsule
Dry fruit from compound pistil, nearly always dehiscent (irregularly or by pores, slits, or lines of separation). (see circumscissile, loculicidal, septicidal)

carpel
Basic female structure of a flower, evolved from a fertile leaf. Carpels are free or variously fused into a compound pistil, the number of carpels then often equal to the number of stigmas, styles, or chambers of the ovary. (see pistil)

cartilaginous
Thickened, usually whitish, sometimes flexible; in ferns, applied especially to margins of blades

catkin
Spike or spike-like (e.g., Alnus) inflorescence of unisexual flowers with inconspicuous perianths (generally wind-pollinated), usually pendent and often with conspicuous bracts

caudex
Generally short, sometimes woody, more or less vertical stem of a perennial, at or beneath ground level. (see stem, bulb, corm, tuber)

caudices
Generally short, sometimes woody, more or less vertical stem of a perennial, at or beneath ground level. (see stem, bulb, corm, tuber)

cauline
Pertaining to structures, especially leaves, borne along (i.e., not confined to the base of) an elongate, above-ground stem; not basal

cespitose
Having a densely clumped, tufted, matted, or cushion-like growth form

chamber
Compartment or cavity within an ovary, capsule, or other hollow structure

chaparral
Vegetation characterized by mostly evergreen shrubs with thick, leathery leaves and stiff branches

ciliate
Having generally straight, conspicuous hairs (cilia) along margins or edges

circumboreal
Occurring around the world at northern latitudes

circumscissile
Dehiscence, usually of a fruit (capsule), by a transverse line, the top coming off as a lid. (see loculicidal, septicidal)

claw
Stalk-like base of some free or nearly free sepals or petals. (see limb)

cleistogamous
Bud-like, unopening flowers that are generally self-fertilized

clone
Genetically identical individuals resulting from asexual reproduction (fragmentation of rhizomes or stolons, budding, etc.); often used for an apparent population, the members of which are or were connected (e.g., aspens, cattails, duckweeds, sumacs)

coastal scrub
Coastal vegetation characterized by shrubs with flexible branches (e.g., Baccharis pilularis, Artemisia californica)

coastal strand
Beach and foredune habitat, characterized by sandy soils, strong winds, salt spray, and wave action

collar
1. In Poaceae, the abaxial junction of leaf sheath and blade. 2. Raised, inflated, or wing-like, encircling projection (e.g., seeds of Delphinium luteum, D. nudicaule)

column
Structure at the center of an orchid flower formed by fusion of stamen(s) and style

common
Likely present in appropriate habitats. (see abundant, rare, uncommon)

compound
1. Composed of two or more parts, as a compound leaf composed of leaflets (see compound leaf) or a compound pistil composed of fused or partly fused carpels. 2. Repeating a structural pattern (a compound umbel is an umbel of umbels). (see simple)

compound leaf
Leaf divided into distinct parts. In a 1-compound leaf, the blade is divided into primary leaflets connected by an axis but no blade material, in a 2-compound leaf, the primary leaflets are so divided into secondary leaflets, etc. (see palmate, pinnate, lobed, dissected)

compressed
Flattened side-to-side (laterally compressed) or front-to-back. (see depressed)

concave
Hollowed or indented, as the interior of a curved surface. (see convex)

cone
Reproductive structure composed of an axis, scales, and sometimes bracts. 1. Non-woody structure producing spores (e.g., clubmosses, horsetails) or pollen (e.g., male cone of conifers). 2. Generally woody structure producing seeds (e.g., female cones of most conifers)

conic
Three-dimensional, defined by a wide, more or less round base, the sides evenly tapered to a narrow tip

conifer forest
Vegetation characterized by trees belonging to various species of conifers (e.g., firs, pines, redwoods)

continuous
Having parts spaced evenly and without interruption, not clumped; pertaining especially to inflorescences in which the flowers are evenly spaced. (see interrupted)

convex
Rounded outward, as the exterior of a curved surface. (see concave)

cordate
Heart-shaped; often pertaining to a leaf in which the blade base on both sides of the petiole is rounded and convex. (see reniform)

corm
Short, thick, unbranched, underground stem often surrounded by dry (not fleshy) leaves or leaf bases (e.g., Muilla maritima). (see bulb, stem)

corolla
Collective term for petals; whorl of flower parts immediately inside or above calyx, often large and brightly colored. Sometimes indistinguishable from calyx

costa
In ferns, primary axis of a pinna

costae
In ferns, primary axis of a pinna

cotyledon
Seed-leaf; a modified leaf present in the seed, often functioning for food storage. Persistent in some annuals and of aid in their identification (e.g., Lupinus microcarpus)

crenate
Pertaining to margins with shallow, rounded teeth, between which are usually acute sinuses (i.e., scalloped)

cylindric
Elongate, with parallel sides and, at any point, round in transverse section

cyme
1. In flowering plants excluding Asteraceae and some other groups, a branched inflorescence in which the central or uppermost flower opens before the peripheral or lowermost flowers on any axis. (see panicle) 2. In Asteraceae and some other groups, a cyme-like inflorescence is one in which the central or uppermost inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, develop and mature before the peripheral or lowermost inflorescence units on any axis

cypsela
(see achene)

deciduous
Falling off naturally. 1. Pertaining to leaves that all fall seasonally, or to plants that are seasonally leafless. (see evergreen) 2. Pertaining to structures, such as hairs or flower parts, that fall early or readily

decumbent
Lying mostly flat on the ground but with tips curving up. (see ascending, prostrate)

decurrent
Pertaining to a wing-like or ridge-like extension basal to the apparent or actual point of attachment, particularly a leaf base that appears to continue onto the stem

dehiscent
Opening at maturity to release contents; usually pertaining to anthers or fruits. (see indehiscent)

deltate
More or less equilaterally triangular, with the corners rounded or not

dentate
Having margins with sharp, relatively coarse teeth pointing outward, not tipward. (see serrate)

depressed
Flattened from above and below, or with the center lower than the margins. (see compressed)

desert
Region and associated communities characterized by low and irregular precipitation and prolonged periods of drought

desert woodland
Vegetation in desert region or on slopes of adjacent mountains characterized by small, drought-tolerant trees; may be classified by characteristic species (e.g., Joshua tree woodland characterized by Yucca brevifolia, pinyon/juniper woodland characterized by Pinus monophylla and Juniperus)

digitate
In Poaceae, pertaining to an inflorescence of two or more spike-like branches attached at the same point at the apex of the inflorescence stalk

dioecious
Pertaining to a taxon in which individuals produce either male or female reproductive structures, and do not produce bisexual reproductive structures (e.g., Salix laevigata). (see monoecious)

diploid
Having two sets of chromosomes (maternal and paternal); 2n. (see haploid, n, polyploid)

disciform head
In Asteraceae, a head composed of disk flowers and marginal pistillate (or sterile) flowers with minute or missing rays, superficially similar to discoid head. (see discoid head, liguliflorous head, radiant head, radiate head)

discoid head
In Asteraceae, a head composed entirely of disk flowers. (see disciform head, liguliflorous head, radiant head, radiate head)

disk
1. Fleshy, often nectar-secreting structure near (often surrounding) an ovary or style base. 2. In Asteraceae, the aggregation of disk flowers in the center of a discoid or radiate head

disk flower
In Asteraceae, a generally bisexual (occasionally staminate or sterile, never pistillate), generally radial flower with a 5- (rarely 4-) lobed corolla; appearing without other flower types (in discoid head), or with marginal flowers of a different type (in radiate, radiant, or disciform heads). (see ligulate flower, ray flower)

dissected
Deeply, often sharply cut but not compound; usually pertaining to leaves (e.g., Cymopterus deserticola). (see compound leaf, leaflet, lobe, segment)

distal
Farther away from the base, origin, or point of attachment, or closer to the edge or tip. (see proximal)

drupe
Fleshy or pulpy, indehiscent, superficially berry-like fruit in which 1 seed is encased in a stone (as in cherries; e.g., Prunus emarginata fruit), or more than 1 seed is encased in an equal number of free or variously fused stones (as in manzanitas). (see berry, nut, pome, stone)

dune
Hill or ridge of sand formed by the wind

ellipsoid
In the shape of a flattened or elongated sphere, widest at the middle and tapered equally to both ends, as a fruit; wider than linear. (see elliptic, linear, oblong)

elliptic
In the shape of a flattened or elongated circle, widest at the middle and tapered equally to both ends, as a leaf; wider than linear. (see ellipsoid, linear, oblong)

emergent
Pertaining to a plant normally rooted underwater and extending above the water surface, or to a part of such a plant normally held above the water surface (e.g., Persicaria amphibia). (see aquatic, submersed)

endemic
Native to and restricted to a defined geographic area

entire
Having margins that are continuous and smooth (i.e., without teeth, lobes, etc.)

ephemeral
Lasting a short time. 1. Pertaining to individual plants, completing the life cycle (germination through death) or growth cycle in much less than one year. 2. Pertaining to plant parts, falling early or remaining functional for a relatively short time (e.g., less than a day for flower parts)

epidermis
Outermost cell layer (or layers) of non-woody plant parts

epipetalous
Pertaining to stamens that are fused to the petals to various extents and therefore appear to arise from them

erect
Upright; vertically oriented. (see ascending)

estuarine
Pertaining to aquatic habitats where freshwater from streams mixes with sea water in a protected area, resulting in a gradation of brackish waters with varying degrees of salinity

evergreen
Never leafless; usually pertaining to leaves that remain green and on the plant for more than one season, and that do not all fall seasonally, or to plants that are never leafless. (see deciduous)

exceeding
Surpassing tipward, due to relative orientation or length of the structures involved (e.g., lateral branches exceeding inflorescences; hoods exceeded by anther head in Asclepias californica; hoods slightly exceeding anther head in Asclepias erosa). (see exserted)

exserted
Protruding out of surrounding structure(s) (e.g., stamens exserted from corolla). (see exceeding, included)

extant
Currently existing or surviving somewhere. (see extinct, extirpated)

extinct
No longer existing or surviving anywhere. (see extant, extirpated)

extirpated
No longer existing or surviving in a defined geographic area, as either a direct or indirect result of human activity. (see extant, extinct)

exudate
Material discharged (exuded) from a plant, often with characteristic odor, color, or texture (e.g., sticky, gummy, slippery)

false indusium
In many ferns, but especially Pteridaceae and Dennstaedtiaceae, a reflexed or rolled under, often modified leaf blade margin that covers a sorus and protects the young sporangia; also called a marginal indusium. (see indusium)

false indusia
In many ferns, but especially Pteridaceae and Dennstaedtiaceae, a reflexed or rolled under, often modified leaf blade margin that covers a sorus and protects the young sporangia; also called a marginal indusium. (see indusium)

fertile
Reproductively functional; pertaining to a plant or plant part that produces or is associated with the production of functional spores, pollen, ovules, or seeds (e.g., fertile leaf, fertile stamen, fertile flower, fertile floret). (see sterile)

fibrous
1. Pertaining to structures that are composed at least in part of more or less thread-like but usually tough elements (e.g., Yucca leaves). 2. Pertaining to a root system composed of many roots similar in length and thickness (e.g., grass roots). (see taproot)

filament
Anther-stalk portion of a stamen, often thread-like

fleshy
Thick and juicy; succulent (e.g., Sesuvium verrucosum)

floret
In Poaceae, a single flower and its immediately subtending bracts (lemma and generally palea, the lemma subtending the palea when the latter is present); in a sterile floret, the flower and sometimes palea are rudimentary or absent. (see glume, lemma, palea, spikelet)

flower
Primary reproductive structure of angiosperms, with stamens and/or carpels and usually a perianth of sepals and/or petals. (see stamen, carpel, perianth, sepal, petal)

follicle
Dry fruit from a simple pistil, dehiscent on generally only one side, along a single suture. A single flower may develop into a simple fruit of 1 follicle or an aggregate fruit of several follicles. (see capsule, legume)

foothill
Slope at the base of a mountain; especially applied to such features in CA-FP

foothill woodland
Vegetation in foothills characterized by small- to medium-sized trees, composed of one or more species of Quercus, often mixed with Pinus sabiniana and/or Aesculus californica

forest
Vegetation characterized by closely spaced � tall trees; with more canopy cover than a woodland (canopies often overlap)

forked
Pertaining to a hair or other structure that branches into two parts. (see stellate)

free
Neither fused to nor adherent to other parts; distinct, separate

free-central
Pertaining to a placenta along the central axis in a compound ovary with only one chamber. (see axile, basal, parietal)

fringed
Having ragged or finely cut margins

fruit
Ovary or ovaries and sometimes associated structures after ovule fertilization (i.e., seed initiation). A simple fruit develops from one ovary (e.g., cherry, apple, the latter derived largely from the hypanthium); aggregate and multiple fruits develop from ovaries of one and more than one flower, respectively, that remain distinct yet held together as a unit (e.g., a strawberry is an aggregate fruit of achenes held together by a juicy, red flower receptacle; a fig is a multiple fruit of achenes surrounded by a fleshy inflorescence receptacle)

funnel-shaped
Widening from the base more or less gradually through the throat into an ascending, spreading, or recurved limb; often applied to a fused calyx or corolla. (see bell-shaped, rotate, salverform, urn-shaped)

fused
United, as the petals together into a corolla tube or stamens onto petals; neither free nor adherent

fusiform
Elongate, widest at the middle, tapered to both ends

glabrous
Without hairs

gland
Small, often spheric body, on or embedded in the epidermis or at the tip of a hair, that exudes a generally sticky substance (e.g., Psorothamnus arborescens)

glandular
Small, often spheric body, on or embedded in the epidermis or at the tip of a hair, that exudes a generally sticky substance (e.g., Psorothamnus arborescens)

glaucous
Covered with a generally whitish or bluish, waxy or powdery film that is sometimes easily rubbed off

glochid
In Cactaceae, reduced, barbed, deciduous, bristle-like spine (e.g., Opuntia)

glume
In Poaceae, each of generally two sheathing bracts that are the lowermost parts of a spikelet, subtending one or more florets. (see floret, lemma, palea, spikelet)

graduated
In Asteraceae, pertaining to an involucre in which the phyllaries are of unequal length, with the outer shortest, the inner longest, and a gradual transition through multiple series between

grain
In Poaceae, dry, indehiscent, 1-seeded fruit in which the fruit wall is fused to the seed; often appearing to be a naked seed

granular
Covered with minute bumps. (see papillate, tubercle)

grassland
Vegetation characterized by various species of grasses, often mixed with various other kinds of herbs (not grasses) and sometimes scattered, low-growing shrubs

gymnosperm
Plant that bears woody or fleshy cones, not flowers, in which 'naked seeds' (hence, gymno-sperm) are not enclosed in an ovary; woody (e.g., pine, sequoia, ephedra, yew)

habit
Characteristic mode of growth, general form, or shape of a plant (e.g., cespitose, herb, scapose, shrub)

habitat
Natural setting or conditions under which a plant lives (e.g., saltbush scrub, vernal pool, granitic soil among pines, montane forest)

hair
Thread-like epidermal outgrowth. (see glabrous, canescent, ciliate, prickle, puberulent, scabrous, scale, strigose, tomentose)

haploid
Having one set of chromosomes (maternal or paternal); n. (see diploid, n, polyploid)

hastate
Arrowhead-shaped, with two basal lobes oriented more or less perpendicularly to the long axis. (see sagittate)

head
1. In flowering plants excluding Asteraceae and some other groups, a dense, often spheric inflorescence of sessile or subsessile flowers. 2. In Asteraceae and some other groups, a head-like inflorescence is one in which sessile or subsessile inflorescence units (e.g., heads in Asteraceae, fl clusters enclosed by involucres in Eriogonum), instead of individual flowers, are attached in a short dense cluster without an evident axis or branches

hemispheric
Shaped like a dome or half sphere

herb
Plant that, at least above ground, is generally non-woody and of less than one year or growing season in duration. (see annual, biennial, perennial, subshrub)

herbaceous
Lacking wood; having the characteristics of an herb

herbage
Above-ground, non-woody parts of a plant, including especially the leaves and young stems taken together, excluding flowers and fruits

heterostylous
Pertaining to a taxon in which individual plants produce only one of two or more flower types, each type differing in the lengths of styles relative to stamens; a rare condition in angiosperms. (see homostylous)

homostylous
Pertaining to a taxon in which only one type of flower is produced, in which there is no significant variation in the lengths of styles relative to stamens; the usual condition in angiosperms. (see heterostylous)

hypanthium
Structure generally in the shape of a tube, cup, or bowl, derived from the fused lower portions of the perianth and stamens, from which these parts seem to arise, and to which the ovary wall is fused in an inferior ovary (to which the ovary wall is partially fused in a half-inferior ovary; from which the ovary is free in a superior ovary)

hypanthia
Structure generally in the shape of a tube, cup, or bowl, derived from the fused lower portions of the perianth and stamens, from which these parts seem to arise, and to which the ovary wall is fused in an inferior ovary (to which the ovary wall is partially fused in a half-inferior ovary; from which the ovary is free in a superior ovary)

included
Not protruding out of surrounding structure(s) (e.g., stamens included in corolla). (see exserted)

indehiscent
Not opening inherently to release contents; usually pertaining to fruits. (see dehiscent)

indusium
In many ferns, a usually thin, often scale-like outgrowth of the leaf blade surface that covers a sorus and protects the young sporangia; also called a true indusium. (see false indusium)

indusia
In many ferns, a usually thin, often scale-like outgrowth of the leaf blade surface that covers a sorus and protects the young sporangia; also called a true indusium. (see false indusium)

inferior ovary
Ovary that is fused to the fused lower portions of the perianth and stamens (i.e., to the hypanthium), to the extent that these structures appear to arise at or above its summit. (see superior ovary)

inflorescence
Entire aggregation of flowers or flower clusters and associated structures (e.g., axes, bracts, bractlets, pedicels); often difficult to determine as to type and boundaries but generally excluding full-sized foliage leaves

infraspecific
Below the species level or within a species; pertaining to variation within a species, whether taxonomically significant (e.g., characterizing subspecies or varieties) or not (e.g., characterizing forms or minor variants)

intergrade
To merge gradually from one extreme to another through a more or less continuous series of intermediates

intermediate
Between extremes or parental taxa in size, shape, color, flowering time, habitat preferences, geographic ranges, or other ways

internode
Segment of an axis (generally a stem) between successive positions (nodes) from which one or more structures (especially leaves, buds, branches, or flowers) arise

interrupted
Having parts spaced unevenly, clustered; pertaining especially to inflorescences in which the flowers are clustered. (see continuous)

intertidal
Pertaining to marine habitats that are submerged at high tide and exposed at low tide

involucel
Secondary involucre (group of bracts) within an inflorescence (e.g., those subtending the secondary umbels in members of Apiaceae)

involucre
Group of bracts more or less held together as a unit, subtending a flower, fruit (acorn cup), or inflorescence

keel
1. Ridge or crease more or less centrally located on the long axis of a structure, generally on the abaxial side. 2. Two lowermost, fused petals of many members of Fabaceae

lanceolate
Narrowly elongate, widest in the basal half, often tapered to an acute tip

lateral
Pertaining to the side(s) of a structure (e.g., laterally compressed, meaning flattened side-to-side; lateral branch; lateral appendage). (see terminal)

leaf
Organ arising from a stem, generally composed of a stalk (petiole) and a flat, expanded, green, photosynthetic area (blade); distinguished from a leaflet by the presence in its axil of a bud, branch, thorn, or flower; sometimes with lateral, basal appendages (stipules); either simple (toothed, lobed, or dissected but not divided into leaflets) or compound (divided into leaflets)

leaflet
Leaf-like unit of a compound leaf; distinguished from a leaf by the absence in its axil of a bud, branch, thorn, or flower; either simple (leaf 1-compound, with 1&deg; leaflets) or compound (leaf 2-compound, with 1&deg; and 2&deg; leaflets; 3-compound, with 1&deg;, 2&deg;, and 3&deg; leaflets; etc.)

legume
In Fabaceae (legume family), a dry or somewhat fleshy, 1- to many-seeded fruit from a simple pistil, typically dehiscent longitudinally along two sutures and splitting into halves that remain joined at the base, sometimes indehiscent or breaking crosswise into 1-seeded segments; a plant with such a fruit

lemma
In Poaceae, the lower, generally larger of two sheathing bracts subtending a flower, generally ensheathing the palea (in a sterile lemma, the associated flower and sometimes palea are rudimentary or absent); with the palea and flower, comprising the floret. (see floret, glume, palea, spikelet)

lenticel
Each of many spongy or callused areas of various shapes, sizes, and colors, most commonly on surfaces of young stems (including twigs) or fruits

lenticular
Lens- or discus-shaped, with both major sides convex

ligulate flower
In Asteraceae, a bisexual, bilateral flower with the outer portion of the corolla (the ligule) strap- or fan-shaped, 5-lobed; appearing only with other ligulate flowers in a liguliflorous head. (see disk flower, ray flower)

ligule
1. In Asteraceae, the 5-lobed, strap- or fan-shaped outer portion of the corolla of a ligulate flower. 2. In most Poaceae and some other grass-like plants, an appendage at the adaxial junction of leaf sheath and blade, generally membranous, sometimes formed of hairs. 3. In Isoetes and, more obscurely, in Selaginella, a membrane that wholly or partially covers a sporangium

liguliflorous head
In Asteraceae, a head composed entirely of ligulate flowers. (see disciform head, discoid head, radiant head, radiate head)

limb
In calyces or corollas with fused sepals or petals, the expanded, often lobed portion distal to the tube or throat; in some free or nearly free sepals and petals, the expanded portion distal to the stalk-like base (claw)

linear
Elongate, with nearly parallel sides; narrower than elliptic or oblong

lip
1. Upper or lower of two parts in a bilateral, unequally divided calyx or corolla. 2. In Orchidaceae, generally the largest, lowest, most highly modified perianth part

lobe
1. Major expansion or bulge, such as on the margin of a leaf, sepal, or petal, or on the surface of an ovary. 2. Free tips of otherwise fused structures, such as sepals or petals; larger than teeth

loculicidal
Pertaining to dehiscence of a fruit (capsule) by a longitudinal line through the wall at or near the center of each chamber, such that each resulting segment corresponds to the two adjacent halves of two adjacent chambers, usually with a placenta-bearing septum centrally. (see circumscissile, septicidal)

longitudinal
Pertaining to length or the lengthwise dimension; parallel to the axis. (see transverse)

margin
Edge, generally of a leaf or perianth part

marsh
Permanently or periodically inundated, mostly or completely treeless vegetation characterized by semi-aquatic herbs or subshrubs

meadow
Open grass- or sedge-characterized vegetation more or less surrounded by woodland or forest; meadow soils are generally seasonally moist and frequently are composed of fine-grained sediments

membranous
Thin, dry or moist, pliable, often more or less translucent or variously colored, sometimes green (e.g., Elymus cinereus ligule). (see scarious)

mericarp
One of the generally dry, generally indehiscent, 1--few-seeded, 1-carpelled segments into which certain fruits separate at maturity (e.g., those of Apiaceae)

mixed-evergreen forest
Vegetation characterized by a variable mixture of mostly or only hardwood tree species, most of which retain their leaves throughout the year

monoecious
Pertaining to a taxon in which individuals produce both male and female reproductive structures and do not produce bisexual reproductive structures (e.g., Alnus rhombifolia). (see dioecious)

montane
Pertaining to mountains; vegetational/altitudinal zone between the foothill and subalpine zones

mucro
Abrupt, short, sharp, narrow, terminal point, tip, or projection (e.g., Isolepis fruit)

mucronate
Abrupt, short, sharp, narrow, terminal point, tip, or projection (e.g., Isolepis fruit)

native
Occurring naturally in an area, as neither a direct nor indirect consequence of human activity; indigenous; not alien. (see naturalized, waif)

naturalized
Alien (not native) and reproducing either sexually (e.g., by spores, seeds) or vegetatively (e.g., by sprouts, suckers) in the absence of any benefit, intentional or not, direct or indirect, of human activity, and thereby persisting beyond initial generation or establishment. (see native, waif)

nectar
Sugary solution, produced in nectaries, consumed primarily as an energy source by animal visitors, usually pollinators

nectary
Variously shaped, nectar-producing structure(s) usually at or near the base of the inside of a flower (or sometimes elsewhere, such as in a perianth spur or on a petiole) (e.g., Symphoricarpos rotundifolius)

needle
Narrowly linear, often waxy, generally evergreen leaf, especially of conifers

nodding
Pertaining to a structure (e.g., flower, fruit) borne on a stalk that is curved downward (e.g., Aquilegia formosa flower)

node
Position on a stem from which one or more structures (especially leaves, buds, branches, or flowers) arise. (see internode)

nut
Mostly dry, sometimes fleshy or pulpy, usually indehiscent fruit in which a single seed is encased in a hard shell (e.g., Quercus palmeri). (see drupe)

nutlet
Small, dry nut or nut-like fruit, usually several of which are produced by a single flower (e.g., Boraginaceae, Lamiaceae). (see nut, drupe)

oblique
Having unequal sides or an asymmetric base

oblong
Longer than wide, with nearly parallel sides; wider than linear. (see elliptic)

obtuse
Having a short-tapered, blunt tip or base, the sides convex or straight and converging at more than a right angle. (see acute)

ocrea, ochrea
In Polygonaceae, generally scarious sheath around the stem formed by the fusion of stipules

ocreae
In Polygonaceae, generally scarious sheath around the stem formed by the fusion of stipules

ochreae
In Polygonaceae, generally scarious sheath around the stem formed by the fusion of stipules

open
Uncongested or diffuse; especially pertaining to the disposition of flowers in an inflorescence. (see dense)

opposite
1. Arranged in pairs along an axis (e.g., two leaves per node). (see alternate, whorled) 2. Occurring in the same rank, directly above or below, as 'stamens opposite petals'. 3. Located directly across from

ovary
Ovule-bearing, usually wider, basal portion of pistil, normally developing into a fruit as ovules become seeds; may be simple (one carpel, one chamber) or compound (two or more carpels, one or more chambers)

ovary stalk
Pedestal-like, apical prolongation of a floral receptacle (often termed elsewhere a carpophore) or basal constriction of an ovary (often termed elsewhere a gynophore), above the level of perianth insertion, each with the result that the ovary or fruit appears to be stalked over and above the pedicel (whereas the demarcation between pedicel and ovary- or fruit-stalk is observable as the point of perianth insertion, carpophores generally are distinguished from gynophores only by anatomical study)

fruit stalk
Pedestal-like, apical prolongation of a floral receptacle (often termed elsewhere a carpophore) or basal constriction of an ovary (often termed elsewhere a gynophore), above the level of perianth insertion, each with the result that the ovary or fruit appears to be stalked over and above the pedicel (whereas the demarcation between pedicel and ovary- or fruit-stalk is observable as the point of perianth insertion, carpophores generally are distinguished from gynophores only by anatomical study)

ovate
Egg-shaped (i.e., widest below the middle) in two dimensions (i.e., in one plane), as a leaf. (see ovoid)

ovoid
Egg-shaped (i.e., widest below the middle) in three dimensions, as a fruit. (see ovate)

ovule
In gymnosperms and angiosperms, structure containing an egg, and normally developing into a seed after fertilization

palea
1. In Asteraceae, a scale-like bract that subtends an individual flower on the receptacle (equal to 'chaff scale' in TJM,1993), absent in some genera, restricted to a ring separating ray and disk flowers in most tarweed species. 2. In Poaceae, the distal, generally smaller of two sheathing bracts subtending a flower, generally 2-veined and -keeled and ensheathed by the lemma; with the lemma and flower, comprising the floret. (see floret, glume, lemma, spikelet)

paleae
1. In Asteraceae, a scale-like bract that subtends an individual flower on the receptacle (equal to 'chaff scale' in TJM,1993), absent in some genera, restricted to a ring separating ray and disk flowers in most tarweed species. 2. In Poaceae, the distal, generally smaller of two sheathing bracts subtending a flower, generally 2-veined and -keeled and ensheathed by the lemma; with the lemma and flower, comprising the floret. (see floret, glume, lemma, spikelet)

paleate
1. In Asteraceae, a scale-like bract that subtends an individual flower on the receptacle (equal to 'chaff scale' in TJM,1993), absent in some genera, restricted to a ring separating ray and disk flowers in most tarweed species. 2. In Poaceae, the distal, generally smaller of two sheathing bracts subtending a flower, generally 2-veined and -keeled and ensheathed by the lemma; with the lemma and flower, comprising the floret. (see floret, glume, lemma, spikelet)

palmate
More than two structures or parts (e.g., veins, lobes, or leaflets) radiating from a common point in two dimensions (i.e., in one plane). (see pinnate, ternate)

panicle
1. In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, a branched inflorescence in which the basal or lateral flowers (or some of them) open before the terminal or central flowers on any axis. (see cyme) 2. In Asteraceae, Cyperaceae, Poaceae, and some other groups, a panicle-like inflorescence is one in which at least some of the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae), instead of individual flowers, are attached (stalked or unstalked) to branches and not directly to the main axis of the inflorescence and in which floral development may or may not proceed as in 1

papillate
Pertaining to a surface (e.g., of a leaf, stigma, fruit) bearing small, rounded or conic protuberances (papillae; singular papilla)

pappus
In Asteraceae, the aggregate of structures such as awns, bristles, or scales arising from the top of the inferior ovary, in place of the calyx

parasite
Plant that benefits by taking resources from a physical connection to a host plant of another species; green parasites (hemiparasites) derive water and dissolved inorganic substances (e.g., mineral nutrients) from the connection and often are able to survive without it, while non-green parasites (holoparasites) obtain in addition energy-rich, organic compounds (products of photosynthesis) from the connection and cannot survive without it; the connection may or may not involve a fungal intermediate, and may or may not be detrimental to the host

parietal
Pertaining to placentas on the inside surface of the ovary wall in a compound ovary with one or more chambers

peat
Material formed by the partial decomposition in water of plant tissues, especially mosses (Sphagnum) or sedges

peatland
Moss- or herb-characterized freshwater wetland with nutrient-deficient substrate and accumulated peat; often said elsewhere to be bogs if acidic, fens if basic

pedicel
Stalk of an individual flower in an inflorescence, or the corresponding structure in fruit. (see peduncle, ray)

peduncle
Stalk of an individual flower borne singly, not in an inflorescence, or of an entire inflorescence, or the corresponding structure in fruit; the stalk subtending an involucre (e.g., in Asteraceae, Polygonaceae). (see pedicel, ray)

peltate
With the stalk attached toward the middle, not at a margin, of a flat structure such as an indusium, scale, or leaf

pendent
Drooping, hanging, or suspended from a point of attachment above (e.g., Amelanchier utahensis fruit)

perennial
Completing life cycle (germination through death) in more than two years or growing seasons, generally non-woody (at least above ground) to woody; includes perennial herbs as well as subshrubs to trees; the abbreviation 'per' only refers to perennial herb, not to the word 'perennial' alone. (see annual, biennial)

perianth
Calyx and corolla collectively, whether or not they are distinguishable

perianth part
Individual member of a perianth; used whether or not calyx and corolla are distinguishable, but usually when they are not

perigynium
Variously shaped, sac-like structure enclosing the ovary and achene in Carex and Kobresia

persistent
Not falling off; remaining attached. (see deciduous, ephemeral)

petal
Individual member of the corolla, whether fused or not; if fused, often equal in number to the number of corolla lobes; often conspicuously colored. (see sepal)

petiole
Leaf stalk, connecting leaf blade to stem; sometimes more or less indistinct

phyllary
In Asteraceae, a bract of the involucre

pinna
In ferns, primary division of a compound or dissected leaf blade

pinnae
In ferns, primary division of a compound or dissected leaf blade

pinnate
Feather-like; pertaining to veins, lobes, leaflets, or other structures arranged in two dimensions (i.e., in one plane) along either side of an axis; a leaf is odd-pinnate if there is a terminal leaflet, even-pinnate if there is not, and either odd- or even-pinnate may be 1-pinnate (blade divided into primary leaflets), 2-pinnate (primary leaflets divided into secondary leaflets), 3-pinnate (secondary leaflets divided into tertiary leaflets), etc. (see compound leaf, palmate, ternate, plumose)

pinnule
In ferns, secondary division of a compound or dissected leaf blade, primary division of a pinna

pistil
Female reproductive structure of a flower, composed of an ovule-containing ovary at the base, one or more pollen-receiving stigmas at the tip, and generally one or more styles between ovary and stigma. A flower may have one or more simple pistils (each a single, free carpel with a single ovary chamber, placenta, and stigma) or one compound pistil (two or more fused or partially fused carpels, the exact number often equaling the number of ovary lobes, ovary chambers, placentas, styles, or stigmas)

pistillate
Pertaining to flowers, inflorescences, or plants with fertile pistils but sterile or missing stamens (e.g., Salix laevigata pistillate flower). (see staminate)

placenta
Structure or area to which ovules are attached in an ovary; variously shaped and positioned

planoconvex
Flat or nearly so on one side, rounded on the other (e.g., Carex harfordii perigynium)

pleated
Having accordion-like folds

plumose
Plume-like, usually with the parts arrayed in three dimensions around an axis, or in tufts held together at the base; usually pertaining to small, finely divided structures, such as certain stigmas and pappus elements. (see pinnate)

pollen
In gymnosperms and angiosperms, structure containing the sperm; when sperm fertilizes an egg, the egg and surrounding ovule normally develop into a seed

pollen grain
In gymnosperms and angiosperms, structure containing the sperm; when sperm fertilizes an egg, the egg and surrounding ovule normally develop into a seed

pollen sac
Each of the one, two, or four pollen-bearing portion(s) of an anther

pollination
Placement of pollen, by an insect, the wind, or other vector, on a stigmatic or ovular surface, through which pollen tube growth and fertilization may occur; self-pollination involves only one plant, cross-pollination occurs between plants

pollinium
Especially in Asclepias and related genera, and in Orchidaceae, a mass of adherent pollen grains disseminated as a unit

pollinia
Especially in Asclepias and related genera, and in Orchidaceae, a mass of adherent pollen grains disseminated as a unit

polyploid
Having three or more sets of chromosomes; 3n, 4n, etc. (see diploid, haploid, n)

pome
In Rosaceae, a fleshy, indehiscent fruit, such as an apple or pear; derived from a hypanthium (represented as outer fleshy material and skin) surrounding and +- fused to a compound ovary (represented as (1)2--5 papery-walled, radiating segments alternating with fleshy material, as in, e.g., Amelanchier utahensis fruit) or to (1)2--5 free ovaries, each with a +- stony outer layer. (see berry, drupe)

prickle
Sharp-pointed, stiff or somewhat flexible projection, originating at or near the surface and neither subtending an axillary bud or branch nor subtended by a leaf or leaf scar, without leaves, leaf scars, buds, or branches (e.g., Rosa woodsii stem); loosely used for any sharp projection. (see armed, spine, thorn)

prostrate
Lying flat on the ground. (see ascending, decumbent)

protandrous
Pertaining to a bisexual flower in which pollen release precedes stigma receptivity, or to a plant with staminate and pistillate flowers in which this is true, with the result that cross-pollination is favored

protogynous
Pertaining to a bisexual flower in which stigma receptivity precedes pollen release, or to a plant with staminate and pistillate flowers in which this is true, with the result that cross-pollination is favored

proximal
Closer to the base, origin, or point of attachment, or farther away from the edge or tip. (see distal)

puberulent
Minutely hairy

raceme
1. In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, an unbranched inflorescence in which the flowers are borne on pedicels and nearly always open from the bottom to the top of the inflorescence. (see panicle, spike) 2. In Asteraceae, Cyperaceae, Poaceae, and some other groups, a raceme-like inflorescence is one in which the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae), instead of individual flowers, are stalked and attached directly to the main axis of the inflorescence, not to branches, and in which floral development may or may not proceed as in 1

rachis
In ferns, primary axis of a compound or dissected leaf blade

radial
Divisible into mirror-image halves in three or more ways. (see asymmetric, bilateral, biradial)

radiant head
In Asteraceae, a discoid head with a peripheral ring of flowers having much enlarged, often bilateral corollas

radiate head
In Asteraceae, a head composed of central disk flowers and marginal ray flowers. (see disciform head, discoid head, liguliflorous head, radiant head)

rank
1. Row or column of parts along an axis (e.g., leaves on an erect stem arranged in four vertical rows are 4-ranked). (see alternate, opposite) 2. In classification, a taxonomic level (e.g., family, genus, species, subspecies, variety). (see taxon)

rare
Extremely unlikely to be present in appropriate habitats, often restricted to a small number of sites. (see endangered, threatened, uncommon)

ray
1. Each of a number of radiating axes, as a primary branch in a compound umbel. (see pedicel, peduncle) 2. In Asteraceae, the flat, strap- or fan-shaped, often 3-lobed outer portion of the corolla of a ray flower

ray flower
In Asteraceae, a generally pistillate or sterile, bilateral flower with a flat, strap- or fan-shaped, often 3-lobed outer portion of the corolla (ray); appearing in a ring around a central cluster of disk flowers. (see ligulate flower, disk flower)

receptacle
1. In individual flowers, the structure to which flower parts are attached. 2. In heads or head-like inflorescences, especially in Asteraceae, the structure to which flowers or sometimes heads are attached

recurved
Gradually curved downward or backward

reduced
Smaller, less lobed, simpler, etc

redwood forest
Vegetation characterized by Sequoia sempervirens, occurring on slopes and canyons of coastal mountain ranges

reflexed
Abruptly bent or curved downward or backward

reniform
Kidney-shaped; often pertaining to a leaf in which the blade base on both sides of the petiole is rounded and concave. (see cordate)

rhizome
1. In seed plants, stem that is often elongate, generally more or less horizontal and underground; distinguished from roots by bearing of leaves, leaf scars, axillary buds, etc. (see stolon) 2. In ferns, stem that is located underground, embedded in leaf litter, on rocks or in rock crevices, or on trees or tree branches, often scaly or hairy; distinguished from roots by bearing of leaves (roots rarely bear leaves) and their greater diameter

rib
1. Ridge, as on a fruit. 2. Raised vein, as on a leaf or other part (e.g., Carex hendersonii perigynium)

riparian
Pertaining to communities that occupy the banks, channels, and flood plains of waterways

root
Generally underground axis or axes of a plant; distinguished from stems by not bearing leaves, leaf scars, axillary buds, flowers, etc.; generally growing into the ground from the base of a stem, its functions include anchorage, absorption of water and nutrients, and food storage. (see bulb, corm, rhizome, caudex, tuber, stolon)

rosette
Radiating cluster of leaves generally at or near ground level

rotate
Wheel-shaped, spreading, or saucer-shaped; often applied to a fused corolla with a short or nonexistent tube and a spreading limb. (see bell-shaped, funnel-shaped, salverform, urn-shaped)

ruderal
Plant, usually alien, occurring in waste areas, along roadsides, and in other places disturbed by humans; pertaining to such a plant

sagittate
Arrowhead-shaped, with two basal lobes oriented nearly parallel to the long axis. (see hastate)

salverform
Having a slender tube and an abruptly spreading, flat limb; often applied to a fused corolla. (see bell-shaped, funnel-shaped, rotate, urn-shaped)

savanna
Vegetation characterized by various species of grasses with scattered individual trees; with less canopy cover than a woodland (canopies do not touch)

scabrous
Rough to the touch, generally owing to short stiff hairs (e.g., Brickellia pappus)

scale
1. Wide, appressed, membranous, epidermal outgrowth (e.g., Cheilanthes covillei). (see hair) 2. Structure (bud scale) partially or entirely covering an over-wintering bud (e.g., Salix gooddingii bud). 3. In gymnosperms, a woody, seed-bearing structure (cone scale) attached to the cone axis (e.g., Abies magnifica). 4. In Asteraceae, flat, membranous pappus element (e.g., Hymenoxys hoopesii). Leaves or bracts may be scale-like in one or more of the preceding ways

scapose
Pertaining to a plant or an inflorescence in which a relatively long peduncle (scape) arises, sometimes with leaf- or scale-like bracts but without true foliage leaves, from a rosette or other arrangement of leaves at ground level

scar
Mark left by the natural separation of two structures, as a leaf scar on a stem

scarious
Thin, dry, pliable, translucent or variously colored but not green (e.g., Carex incurviformis pistillate flower bract). (see membranous)

scree
Relatively unstable, sloping accumulation of small rock fragments, often at a cliff base. (see talus)

scrub
Vegetation characterized by shrubs; may be classified by habitat type or by characteristic species; shrubland

sculpture
Surface ornamentation or topography, often visible only when magnified, as on a seed or pollen grain (e.g., Plagiobothrys nothofulvus nutlet)

seed
Any fertilized ovule, but in descriptions pertaining to the fully mature condition (i.e., at full cone or fruit maturation), unless noted otherwise

segment
1. Ultimate or smallest division of a compound leaf (then the segment is also a leaflet) or dissected leaf �ۥ not a marginal lobe, tooth, bristle, etc. 2. Part into which an organ is naturally or apparently divisible, such as of a calyx, corolla, fruit, etc. 3. Specified length, such as of a stem, root, style, etc

sepal
Individual member of the calyx, whether fused or not; if fused, often equal in number to the number of calyx lobes; generally green. (see petal)

septicidal
Pertaining to dehiscence of a fruit (capsule) by a longitudinal line through the wall at or near the center of each septum, such that each resulting segment corresponds to a single chamber, with placentas placed variously. (see circumscissile, loculicidal)

septum
Wall between chambers in a hair, root, compound ovary, or other structure

septa
Wall between chambers in a hair, root, compound ovary, or other structure

septate
Wall between chambers in a hair, root, compound ovary, or other structure

series
Group of structures of one kind (e.g., involucral bracts, sepals, petals, stamens) of similar size or shape, usually more or less in a row or whorl

serpentine
Pertaining to rocks, or soils derived from them, with generally low levels of calcium and other nutrients, and high levels of magnesium, iron, and certain toxic metals; many plant taxa are restricted to or excluded from serpentine

serrate
Having margins with sharp, fine to coarse teeth generally pointing tipward, not outward; margins with such teeth on such primary teeth are doubly serrate. (see dentate)

sessile
Without a petiole, peduncle, pedicel, or other kind of stalk

sheath
Surrounding or partially surrounding, often tubular structure or part of a structure, such as a leaf base in Apiaceae or Poaceae

shoot
Pertaining collectively to a young stem or twig and its appendages (e.g., new growth in the spring), or to all above-ground parts of a plant (i.e., shoot system). A short-shoot (i.e., spur) is a shoot on some woody plants that undergoes only limited elongation, so that the internodes between appendages (leaves, flowers, etc.) are very short

shrub
Woody plant of relatively short maximum height, with generally many branches from the base. (see tree, subshrub, perennial)

simple
Composed of a single part; undivided; unbranched. (see compound)

sinus
Usually pertaining to margins of leaves, sepals, petals, or other parts, an indentation between adjacent lobes or teeth

sorus
In many ferns, a distinct cluster of sporangia

sori
In many ferns, a distinct cluster of sporangia

spheric
Globe- or ball-shaped; circular in three dimensions

spike
1. In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, an unbranched inflorescence in which the flowers are sessile and nearly always open from the bottom to the top of the inflorescence. (see panicle, raceme, head) 2. In Asteraceae, Cyperaceae, Poaceae, and some other groups, a spike-like inflorescence is one in which the inflorescence units (e.g., heads in Asteraceae; spikelets in Poaceae and most Cyperaceae), instead of individual flowers, are sessile and attached directly to the main axis of the inflorescence, not to branches, and in which floral development may or may not proceed as in 1. (see spikelet)

spikelet
1. In Poaceae, one or more florets (each a flower with subtending lemma and generally palea) and generally two subtending glumes; in a sterile spikelet, the flower(s) and sometimes palea(e) are rudimentary or absent. (see floret, glume, lemma, palea) 2. For definitions in Cyperaceae, see note after family description

spine
Sharp-pointed, usually stiff projection, derived from a leaf or leaf part (e.g., stipule, vein tip), and therefore often subtending an axillary bud or branch, without buds of its own (e.g., marginal spine of Cirsium arvense leaf); loosely used for any sharp projection. (see armed, prickle, thorn)

sporangium
In non-seed plants, a case or sac in which spores are produced, and from which they are released

sporangia
In non-seed plants, a case or sac in which spores are produced, and from which they are released

spore
In non-seed plants, one of very many minute, haploid cells (in mass, often appearing dust-like) dispersed from sporangia on a diploid parent plant (sporophyte), normally developing into a small haploid plant (gametophyte) that produces eggs, sperm, or both, the fusion of which results in new diploid offspring

spreading
Oriented more or less perpendicularly to the axis of attachment; often, more or less horizontal

spur
1. Hollow projection or expansion, generally of a perianth part and containing nectar (e.g., Aquilegia formosa petals). 2. Shoot on some woody plants that undergoes only limited elongation, so that the internodes between appendages (leaves, flowers, etc.) are very short. (see shoot)

stamen
Male reproductive structure of a flower, typically composed of a stalk-like filament and a terminal, pollen-producing anther. Filaments sometimes partly fuse to the corolla, or to other filaments to form a tube. (see anther, filament, pistil)

staminate
Pertaining to flowers, inflorescences, or plants with fertile stamens but sterile or missing pistils (e.g., Salix laevigata staminate flower). (see pistillate)

staminode
Sterile stamen, usually modified in appearance, sometimes petal-like or elaborate in structure (e.g., Penstemon palmeri var. palmeri)

stellate
Pertaining to a hair or other structure with three or more branches radiating in two or three dimensions from a common point. (see forked)

stem
Generally above-ground but sometimes below-ground axis or axes of a plant; distinguished from roots by bearing leaves, leaf scars, axillary buds, flowers, nodes, etc. (see bulb, caudex, corm, rhizome, root, stolon, tuber)

sterile
Not reproductively functional; pertaining to a plant or plant part that does not produce or is not associated with the production of functional spores, pollen, ovules, or seeds (e.g., sterile leaf, sterile stamen, sterile flower, sterile floret). (see fertile)

stigma
Part of a pistil on which pollen germinates, generally terminal and elevated above the ovary on a style, usually sticky or hairy, sometimes lobed

stipe
1. In ferns, a leaf stalk (analogous to a petiole of a leaf), connecting blade to rhizome. 2. In some Polygonaceae, a stalk-like base of a flower or of a hypanthium, distal to pedicel (stipe and pedicel separated by line of dehiscence or a bulge, or differences in thickness; if no such demarcation exists, the structure throughout is a pedicel, not in part a stipe)

stipule
Appendage at base of a petiole, generally paired, variable in form but often leaf- or scale-like, sometimes a spine

stolon
Normally thin, elongate stem lying more or less flat on the ground and forming roots as well as erect stems or shoots (which become new, clonal plants) at generally widely spaced nodes; runner. (see rhizome)

stomate
Minute pore on a leaf (less often, stem or other structure) through which gases pass into or out of a plant (generally, carbon dioxide in, oxygen and water vapor out); generally closed during times of water stress; sometimes used in identification

stoma
Minute pore on a leaf (less often, stem or other structure) through which gases pass into or out of a plant (generally, carbon dioxide in, oxygen and water vapor out); generally closed during times of water stress; sometimes used in identification

stomata
Minute pore on a leaf (less often, stem or other structure) through which gases pass into or out of a plant (generally, carbon dioxide in, oxygen and water vapor out); generally closed during times of water stress; sometimes used in identification

stone
In a drupe, the very hard inner ovary wall and the generally single seed it surrounds; occurring one or more per flower, free or variously fused (e.g., Prunus emarginata fruit)

stout
Thick, sturdy, not slender

striate
With fine, longitudinal channels, lines, or ridges

strigose
With stiff, straight, sharp, appressed hairs

style
In many but not all pistils, the stalk-like part that connects ovary to stigma

subalpine
Pertaining to the vegetational/altitudinal zone just below timberline, between the montane and the alpine

submersed
Pertaining to a plant normally rooted and remaining underwater, or to a part of such a plant normally held underwater. (see aquatic, emergent)

subshrub
Plant with the proximal above-ground stems woody, the distal stems and twigs not woody (or less so) and dying back seasonally. (see perennial, shrub)

subtend
Occurring immediately below, as sepals subtending petals or leaves subtending axillary buds

subtidal
Pertaining to marine aquatic habitats that are continuously submerged, even at low tide

superior ovary
Ovary that is free from the perianth and stamens, or free from the fused lower portions of these structures (i.e., free from the hypanthium), to the extent that these structures appear to arise at its base, and it appears to arise from the top of the receptacle. (see hypanthium, inferior ovary)

suture
Groove or line of dehiscence or fusion

swamp
Shrub- or tree-characterized vegetation that occurs in permanently wet soils with standing water

talus
Relatively stable, sloping accumulation of large rock fragments, often at a cliff base. (see scree)

tapered
Gradually (not abruptly) narrower or smaller at base or tip. (see truncate)

taproot
Primary root that grows more or less straight down into soil, is tapered to the end, and has smaller, lateral branches (e.g., carrot). (see fibrous)

taxon
In classification, a group of organisms (such as plants) at any rank (e.g., species, genus, family); taxonomy is the science of classifying organisms. (see rank)

taxa
In classification, a group of organisms (such as plants) at any rank (e.g., species, genus, family); taxonomy is the science of classifying organisms. (see rank)

tendril
Slender, generally coiling structure (generally stem, stipule, or leaf tip) by which a climbing plant becomes attached to its support (e.g., Lathyrus lanszwertii leaf)

terminal
Pertaining to the tip of a structure (e.g., terminal bud). (see lateral)

ternate
Lobed, dissected, or compound into three parts, once, as a clover leaf (e.g., Trifolium wormskioldii), or more than once; in a ternate-pinnate leaf, the leaf is divided into three leaflets, each of which is pinnately compound (e.g., Aralia californica); three structures or parts (e.g., veins, lobes, or leaflets) radiating from a common point. (see palmate, pinnate)

thorn
Sharp-pointed, usually stiff projection, derived from a branch and therefore often subtended by a leaf or leaf scar, sometimes with leaf scars and buds of its own (e.g., Castela emoryi); loosely used for any sharp projection. (see armed, prickle, spine)

throat
In calyces or corollas with fused sepals or petals, the expanded, fused portion distal to the tube and proximal to the limb

timberline
Region in high mountains where subalpine forests give way to treeless alpine vegetation

tomentose
Covered with densely interwoven, generally matted hairs

tooth
1. Small, pointed projection, such as on the margin of a leaf, sepal, or petal. 2. Free tips of otherwise fused structures, such as sepals or petals (somewhat archaic usage); smaller than lobes. (see dentate, serrate)

teeth
1. Small, pointed projection, such as on the margin of a leaf, sepal, or petal. 2. Free tips of otherwise fused structures, such as sepals or petals (somewhat archaic usage); smaller than lobes. (see dentate, serrate)

transverse
Pertaining to width or the widthwise dimension; perpendicular to the axis. (see longitudinal)

tree
Woody plant of medium to tall maximum height, with generally one trunk from the base (e.g., Sequoia sempervirens). (see shrub, perennial)

truncate
Abruptly (not gradually) narrower or smaller at base or tip, as if cut straight across or nearly so. (see tapered)

tube
In calyces or corollas with fused sepals or petals, the often more or less cylindric, fused portion at the base, proximal to the throat and limb

tuber
Short, thickened, fleshy, usually starchy, underground stem for storage (of water, food, or both) and sometimes propagation (e.g., potato). (see stem)

tubercle
Small, wart-like projection (e.g., Cryptantha muricata nutlet)

twig
In woody plants, a terminal stem segment, produced during the current or most recent growth period

twining
Climbing by the twisting or coiling of stems, tendrils, or other structures (e.g., Antirrhinum filipes)

ultimate
Last, most distal, or smallest, as all the tips of a branching stem or the smallest divisions (segments) of a compound leaf or dissected leaf

umbel
1. In flowering plants excluding Asteraceae and some other groups, an inflorescence in which three to many pedicels and, if compound, branches (rays) radiate from a common point; characteristic of but not confined to Apiaceae. (see ray) 2. In Asteraceae and some other groups, an umbel-like inflorescence is one in which three to many stalked inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, radiate from a common point of attachment without an evident axis or branches

uncommon
Unlikely to be encountered; sometimes not present in appropriate habitats. (see abundant, common, rare)

understory
Layer of vegetation growing beneath a canopy of taller plants

unisexual
Either male or female reproductive parts occurring and functional in the same plant or structure (e.g., flower, spikelet, inflorescence). (see bisexual, pistillate, staminate, dioecious, monoecious)

urn-shaped
Widening more or less abruptly at the base and then gradually or abruptly narrowed toward the tip. (see bell-shaped, funnel-shaped, rotate, salverform)

utricle
Mostly dry, dehiscent or indehiscent fruit from a generally compound pistil in which a balloon- or bladder-like ovary wall loosely encloses (or, in some Chenopodiaceae, is adherent to) a single seed

valve
1. In legumes or capsules opening by longitudinal lines, one of the parts into which the fruit is dehiscent (such fruits valvate). 2. In anthers, the flap of tissue resulting from dehiscence by a curved line (e.g., Lauraceae, some Berberidaceae). 3. In Ophioglossaceae, one of the parts into which the sporangium is dehiscent

vascular
Pertaining to plant veins or to plants with veins

vein
1. Tissue specialized for transport of substances within a plant: water and dissolved inorganic substances (e.g., mineral nutrients) through the xylem; energy-rich, organic compounds (products of photosynthesis) through the phloem. 2. Strand of such tissue, often seen as a line in surface view and as a bundle in transverse section

vernal
Pertaining to the spring season

vernal pool
Shallow, ephemeral body of water (i.e., one that becomes dry by spring or early summer) that occupies a depression, with underlying hardpan, claypan, or bedrock, in a grassland, foothill woodland, or chaparral

vestigial
Rudimentary; pertaining to a structure that is undeveloped, poorly developed, or degenerate and therefore non-functional

vine
Trailing, twining, or climbing plant, usually attached to its support by the twisting or coiling of stems, tendrils, or other structures (e.g., Phaseolus filiformis)

waif
Alien, adventive; reproducing neither sexually (e.g., by spores, seeds) nor vegetatively (e.g., by sprouts, suckers) in the absence of any benefit, intentional or not, direct or indirect, of human activity, and therefore not persisting beyond initial generation or establishment, or reproducing to some extent but not persisting for more than a few generations or well beyond initial establishment and therefore not completely naturalized; generally not considered to be part of the flora, but of interest because of their potential to become naturalized, and thereby to have become so. (see alien, naturalized)

wash
Normally dry drainage channel with only occasional surface flow (e.g., flash floods), in some cases with water movement and availability below in times of no surface flow

whorled
Arranged in groups of three or more at nodes or positions along an axis (e.g., three leaves per node). (see alternate, opposite)

whorl
Arranged in groups of three or more at nodes or positions along an axis (e.g., three leaves per node). (see alternate, opposite)

wing
1. Thin, flat extension or appendage of a surface or margin. 2. In many members of Fabaceae and in some other groups, each of the two lateral petals

wiry
Pertaining to roots, stems, hairs, and other structures that are slender, stiff, and tough

wood
Hardened, thickened, vascular tissue (xylem) under the bark of subshrubs, shrubs, trees, and some vines; number of concentric rings in wood often corresponds to years or growing seasons. (see bark)

woodland
Vegetation characterized by small- to medium-sized trees, often with less continuous canopy cover than a forest and more than a savanna (canopies do not always touch)
