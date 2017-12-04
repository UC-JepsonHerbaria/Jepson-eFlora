use BerkeleyDB;
 $file="/usr/local/web/ucjeps_data/nomsyn_hcode_hash";
        tie(%hcode_hash, "BerkeleyDB::Hash", -Filename=>$file)|| print "Couldnt open $file: $!";
      
while(<DATA>){
chomp;
($name,$hcode)=split(/\t/);
$hcode_hash{$name}=$hcode;
}
__END__
Abies amabilis	0001000000
Abies bracteata	0000020000
Abies concolor	447bc4d505
Abies grandis	003d000000
Abies lasiocarpa	0001000000
Abies lasiocarpa var. lasiocarpa	0001000000
Abies magnifica	0409c40102
Abies magnifica var. magnifica	0409c40102
Abies magnifica var. shastensis	0401000100
Abies procera	0401000000
Abronia alpina	0000000100
Abronia latifolia	0184000000
Abronia maritima	1980000000
Abronia nana	4000000402
Abronia nana subsp. covillei	4000000402
Abronia nana var. covillei	4000000402
Abronia pogonantha	6000003000
Abronia turbinata	6002240007
Abronia umbellata	8184000000
Abronia umbellata subsp. breviflora	0104000000
Abronia umbellata subsp. umbellata	8184000000
Abronia umbellata var. breviflora	0104000000
Abronia umbellata var. umbellata	8184000000
Abronia villosa	e080000000
Abronia villosa var. aurita	8080000000
Abronia villosa var. villosa	e000000000
Abutilon palmeri	80c0000000
Abutilon parvulum	4000000000
Abutilon theophrasti	f8d0027601
Acacia baileyana	0180001801
Acacia cyclops	00c0004000
Acacia dealbata	01a0001a01
Acacia decurrens	00c0004000
Acacia longifolia	01c0005800
Acacia mearnsii	0080000000
Acacia melanoxylon	09c4004800
Acacia paradoxa	0180000000
Acacia podalyriifolia	0080000000
Acacia pycnantha	1180000000
Acacia redolens	01c0004000
Acacia retinodes	0180000000
Acacia saligna	0080000001
Acacia verticillata	0180000800
Acaena novae-zelandiae	0184000000
Acaena pallida	0100000000
Acaena pinnatifida	0104030800
Acaena pinnatifida var. californica	0104030800
Acalypha californica	8040004000
Acamptopappus shockleyi	6000040002
Acamptopappus sphaerocephalus	e04004d402
Acamptopappus sphaerocephalus var. hirtellus	604004d402
Acamptopappus sphaerocephalus var. sphaerocephalus	e04000d400
Acanthomintha duttonii	0100000800
Acanthomintha ilicifolia	00c0000000
Acanthomintha lanceolata	0000010800
Acanthomintha obovata	0000030001
Acanthomintha obovata subsp. cordata	0000020001
Acanthomintha obovata subsp. obovata	0000010000
Acanthoscyphus parishii	0000021401
Acanthoscyphus parishii var. abramsii	0000020001
Acanthoscyphus parishii var. cienegensis	0000000400
Acanthoscyphus parishii var. goodmaniana	0000000400
Acanthoscyphus parishii var. parishii	0000001401
Acer campestre	0000000800
Acer circinatum	043d480000
Acer glabrum	4409c00502
Acer glabrum subsp. diffusum	4400000502
Acer glabrum subsp. glabrum	0409c00000
Acer glabrum var. diffusum	4400000502
Acer glabrum var. glabrum	0409c00000
Acer macrophyllum	1ffdfbdd01
Acer negundo	1ffdfbff01
Acer saccharinum	0000000200
Achillea millefolium	1fffffff07
Achlys californica	0025000000
Achlys triphylla	0025000000
Achlys triphylla subsp. triphylla	0025000000
Achyrachaena mollis	1ff13bfe01
Achyronychia cooperi	e000000000
Acleisanthes longiflora	8000000000
Acleisanthes nevadensis	4000000000
Acmispon americanus	7fffffff07
Acmispon americanus var. americanus	7fffffff07
Acmispon argophyllus	18c0fb5500
Acmispon argophyllus var. adsurgens	1000000000
Acmispon argophyllus var. argenteus	1800000000
Acmispon argophyllus var. argophyllus	00c0b35500
Acmispon argophyllus var. fremontii	0000480000
Acmispon argophyllus var. niveus	0800000000
Acmispon argyraeus	4000004400
Acmispon argyraeus var. argyraeus	4000004400
Acmispon argyraeus var. multicaulis	4000000000
Acmispon argyraeus var. notitius	4000000000
Acmispon brachycarpus	fffdfbff01
Acmispon cytisoides	0100020800
Acmispon dendroideus	1800000000
Acmispon dendroideus var. dendroideus	1800000000
Acmispon dendroideus var. traskiae	1000000000
Acmispon dendroideus var. veatchii	0800000000
Acmispon denticulatus	0227080a04
Acmispon glaber	81fc085c01
Acmispon glaber var. brevialatus	80c0005401
Acmispon glaber var. glaber	01fc084801
Acmispon grandiflorus	07fdfb5d01
Acmispon grandiflorus var. grandiflorus	01fd235d01
Acmispon grandiflorus var. macranthus	0600d80000
Acmispon haydonii	8040000000
Acmispon heermannii	81e4024400
Acmispon heermannii var. heermannii	80c0004400
Acmispon heermannii var. orbicularis	0124020000
Acmispon junceus	0124020000
Acmispon junceus var. biolettii	0124020000
Acmispon junceus var. junceus	0100020000
Acmispon maritimus	f9c0035c01
Acmispon maritimus var. brevivexillus	e000000000
Acmispon maritimus var. maritimus	99c0035c01
Acmispon micranthus	10c0034000
Acmispon nevadensis	47f9f8d501
Acmispon nevadensis var. davidsonii	0040005401
Acmispon nevadensis var. nevadensis	47f9f88100
Acmispon parviflorus	09fcdb4a00
Acmispon procumbens	6040235701
Acmispon procumbens var. jepsonii	0000200100
Acmispon procumbens var. procumbens	6040035601
Acmispon prostratus	0080000000
Acmispon rigidus	e040004000
Acmispon rubriflorus	0010000800
Acmispon strigosus	f9c0037e01
Acmispon wrangelianus	9ffffbff05
Aconitum columbianum	060bc40104
Aconitum columbianum subsp. columbianum	060bc40104
Aconitum columbianum subsp. viviparum	0601400000
Aconitum columbianum var. columbianum	060bc40104
Aconogonon davisiae	0409c00000
Aconogonon newberryi	0402c00004
Aconogonon phytolaccifolium	000bc00004
Acourtia microcephala	18c0035401
Acroptilon repens	ffffffff07
Actaea rubra	063dfa0d00
Adenocaulon bicolor	073df88900
Adenophyllum cooperi	6000000400
Adenophyllum porophylloides	e040000000
Adenostoma fasciculatum	1bf8fbdd01
Adenostoma fasciculatum var. fasciculatum	1bf8fbdd01
Adenostoma fasciculatum var. obtusifolium	00c0000000
Adenostoma fasciculatum var. prostratum	1900000000
Adenostoma sparsifolium	00c0024001
Adiantum aleuticum	0e3dc25d01
Adiantum capillus-veneris	fb7a0e7507
Adiantum jordanii	1ffd3bfe01
Adolphia californica	00c0004000
Adonis aestivalis	0002000004
Aegilops cylindrica	1ec2005605
Aegilops geniculata	0020000000
Aegilops neglecta	0005f88300
Aegilops triuncialis	03381b0a00
Aeonium arboreum	0080000000
Aeonium arboreum var. arboreum	0080000000
Aeonium haworthii	0080000000
Aeschynomene rudis	0000000200
Aesculus californica	673d3baa00
Agastache parvifolia	0402000004
Agastache urticifolia	0638de0504
Agave deserti	c000000000
Agave deserti subsp. deserti	8000000000
Agave deserti subsp. simplex	4000000000
Agave deserti var. deserti	8000000000
Agave deserti var. simplex	4000000000
Agave shawii	0080000000
Agave shawii var. shawii	0080000000
Agave utahensis	6000000000
Agave utahensis var. eborispina	6000000000
Agave utahensis var. nevadensis	4000000000
Ageratina adenophora	19c0025c01
Ageratina herbacea	4000000000
Ageratina occidentalis	043dfc8106
Ageratina shastensis	0600000000
Agoseris X dasycarpa	0002400004
Agoseris X elata	0000c00100
Agoseris apargioides	0104000000
Agoseris apargioides subsp. apargioides	0100000000
Agoseris apargioides subsp. maritima	0004000000
Agoseris apargioides var. apargioides	0100000000
Agoseris apargioides var. eastwoodiae	0104000000
Agoseris apargioides var. maritima	0004000000
Agoseris aurantiaca	040bc40106
Agoseris aurantiaca subsp. aurantiaca	040bc40106
Agoseris aurantiaca var. aurantiaca	040bc40106
Agoseris glauca	0002fc8106
Agoseris glauca var. glauca	0002fc8106
Agoseris grandiflora	07fffbdd05
Agoseris grandiflora var. grandiflora	07fffbdd05
Agoseris grandiflora var. leptophylla	003d000000
Agoseris heterophylla	0ffffbff05
Agoseris heterophylla subsp. heterophylla	0ffffbff05
Agoseris heterophylla var. cryptopleura	00103baa01
Agoseris heterophylla var. heterophylla	0ffffbff05
Agoseris hirsuta	0138030a00
Agoseris monticola	0401c00106
Agoseris parviflora	0002c40006
Agoseris retrorsa	0679fbdd01
Agrimonia gryposepala	0479404400
Agrimonia striata	0000000402
Agropyron cristatum	7ac3465407
Agropyron cristatum subsp. pectinatum	7ac3465407
Agrostemma githago	0090480a00
Agrostemma githago var. githago	0090480a00
Agrostis avenacea	01bc3b2a00
Agrostis blasdalei	0104000800
Agrostis capillaris	0781d80800
Agrostis densiflora	0104000800
Agrostis elliottiana	0210080200
Agrostis exarata	5fffffff07
Agrostis gigantea	1ffdfbff01
Agrostis hallii	01bd000801
Agrostis hendersonii	0200082200
Agrostis hooveri	0100020000
Agrostis humilis	0409800100
Agrostis idahoensis	063df8cd02
Agrostis microphylla	01bc002200
Agrostis oregonensis	0639f8c500
Agrostis pallens	1fffffff07
Agrostis scabra	0039fcd503
Agrostis stolonifera	47fd4b5c03
Agrostis tandilensis	0080002200
Agrostis variabilis	0409c00104
Ailanthus altissima	43f1fbff03
Aira caryophyllea	1ffdfbff01
Aira elegans	0060084a01
Aira praecox	0024000000
Albizia julibrissin	18c0005601
Albizia lophantha	19c0024801
Alcea rosea	18c0005c01
Alhagi maurorum	e000042202
Aliciella humillima	0002040006
Aliciella hutchinsifolia	6002040006
Aliciella latifolia	e000000002
Aliciella latifolia subsp. latifolia	e000000002
Aliciella leptomeria	4002040006
Aliciella lottiae	6002040006
Aliciella micromeria	0002040006
Aliciella monoensis	6000040002
Aliciella ripleyi	4000000000
Aliciella triodon	4000000000
Alisma gramineum	0002000004
Alisma lanceolatum	003d080200
Alisma triviale	1ffdfbff01
Allenrolfea occidentalis	e000042a02
Allionia incarnata	e000000000
Allionia incarnata var. incarnata	e000000000
Allionia incarnata var. villosa	e000000000
Allium abramsii	0000800100
Allium acuminatum	063f000804
Allium amplectens	1ffdfbff05
Allium anceps	0402c40006
Allium atrorubens	4002040006
Allium atrorubens subsp. atrorubens	4002040006
Allium atrorubens var. atrorubens	4002040006
Allium atrorubens var. cristatum	4000040002
Allium bisceptrum	0402c40106
Allium bolanderi	063d000800
Allium bolanderi var. bolanderi	063d000800
Allium bolanderi var. mirabile	0039000000
Allium burlewii	18c003d501
Allium campanulatum	1ee3c25505
Allium cepa	0000000000
Allium cratericola	003919c901
Allium crispum	0100032800
Allium denticulatum	6000208101
Allium diabolense	0000030801
Allium dichlamydeum	0104000000
Allium falcifolium	003d000800
Allium fimbriatum	f9f827dc03
Allium fimbriatum subsp. fimbriatum	f9f823dc01
Allium fimbriatum subsp. mohavense	6000040002
Allium fimbriatum subsp. purdyi	0010000000
Allium fimbriatum var. fimbriatum	f9f823dc01
Allium fimbriatum var. mohavense	6000040002
Allium fimbriatum var. purdyi	0010000000
Allium haematochiton	00c0024001
Allium hickmanii	0100000000
Allium hoffmanii	0009000000
Allium howellii	000023a801
Allium howellii subsp. howellii	000023a801
Allium howellii subsp. sanbenitense	0000010000
Allium howellii var. clokeyi	0000000001
Allium howellii var. howellii	000023a801
Allium howellii var. sanbenitense	0000010000
Allium hyalinum	0000382a00
Allium jepsonii	0000180000
Allium lacunosum	69c027e403
Allium lacunosum var. davisiae	6000040403
Allium lacunosum var. kernense	6000208000
Allium lacunosum var. lacunosum	0980032000
Allium lacunosum var. micranthum	0040034400
Allium lemmonii	0002c00004
Allium marvinii	00c0004400
Allium membranaceum	0201180100
Allium monticola	0040001401
Allium munzii	00c0000000
Allium neapolitanum	01bc000a00
Allium nevadense	4000000000
Allium obtusum	0410d80100
Allium obtusum var. conspicuum	0000d80000
Allium obtusum var. obtusum	0410d80100
Allium paniculatum	013d030800
Allium paniculatum var. paniculatum	013d030800
Allium parishii	6000000400
Allium parryi	0040004500
Allium parvum	0403c40106
Allium peninsulare	19c038de01
Allium peninsulare var. franciscanum	0100000800
Allium peninsulare var. peninsulare	18c038d601
Allium platycaule	0402400004
Allium praecox	18c0004001
Allium punctum	0002000004
Allium sanbornii	0200180000
Allium sanbornii subsp. sanbornii	0200180000
Allium sanbornii var. congdonii	0000180000
Allium sanbornii var. sanbornii	0200180000
Allium sativum	8000000000
Allium serra	0038010800
Allium sharsmithiae	0000000800
Allium shevockii	0000008100
Allium siskiyouense	0039000000
Allium tolmiei	0002000004
Allium tolmiei var. tolmiei	0002000004
Allium tribracteatum	0000800000
Allium triquetrum	0105000000
Allium tuolumnense	0000100000
Allium unifolium	013d030800
Allium validum	043dc00104
Allium vineale	01bd0b0a00
Allium yosemitense	0000900000
Allophyllum divaricatum	06513b5c01
Allophyllum gilioides	4678ffdd01
Allophyllum gilioides subsp. gilioides	0678fbdd01
Allophyllum gilioides subsp. violaceum	4078ffdd01
Allophyllum glutinosum	1040025401
Allophyllum integrifolium	0600c01501
Allotropa virgata	043dc00100
Almutaster pauciflorus	2000200000
Alnus cordata	0020000000
Alnus incana	0409c00100
Alnus incana subsp. tenuifolia	0409c00100
Alnus rhombifolia	9ffffbff05
Alnus rubra	0125000800
Alnus viridis	042d000000
Alnus viridis subsp. fruticosa	0004000000
Alnus viridis subsp. sinuata	0429000000
Alnus viridis var. sinuata	0429000000
Aloe X schoenlandii	0080000000
Aloe maculata	0100000000
Alopecurus aequalis	057ffcfd05
Alopecurus aequalis var. aequalis	047ffcf505
Alopecurus aequalis var. sonomensis	0100000800
Alopecurus carolinianus	03f8006200
Alopecurus geniculatus	05bffc0106
Alopecurus myosuroides	0080002000
Alopecurus pratensis	05fecb5405
Alopecurus saccatus	07fedb7e05
Aloysia wrightii	4000000000
Alternanthera caracasana	0080000000
Alternanthera philoxeroides	0080002000
Alyogyne huegelii	0080000000
Alyssum alyssoides	0001400000
Alyssum desertorum	0002010004
Alyssum simplex	0012010004
Amaranthus albus	ffffffff07
Amaranthus arenicola	0180000200
Amaranthus blitoides	fffdfbff03
Amaranthus blitum	0080000000
Amaranthus blitum subsp. emarginatus	0080000000
Amaranthus blitum var. emarginatus	0080000000
Amaranthus californicus	ffffffff07
Amaranthus caudatus	0080000200
Amaranthus cruentus	0100003a00
Amaranthus deflexus	19c0035e01
Amaranthus fimbriatus	e000000000
Amaranthus hybridus	19c0037e01
Amaranthus hypochondriacus	0080000600
Amaranthus palmeri	e180032a01
Amaranthus powellii	1de2fb7e07
Amaranthus retroflexus	19d4077e03
Amaranthus spinosus	6080000000
Amaranthus torreyi	6000000000
Amaranthus tuberculatus	0080000200
Amaranthus tuberculatus var. rudis	0080000200
Amaranthus viridis	0080000000
Amaranthus watsonii	8000001000
Amaryllis belladonna	0180000c00
Amauriopsis dissecta	4040000400
Amblyopappus pusillus	1980000000
Ambrosia X platyspina	e002040006
Ambrosia acanthicarpa	f9fafffd07
Ambrosia ambrosioides	0080000000
Ambrosia artemisiifolia	02c1da4200
Ambrosia chamissonis	1984000000
Ambrosia chenopodiifolia	0080000000
Ambrosia confertiflora	6180002000
Ambrosia dumosa	e000040002
Ambrosia eriocentra	6000000000
Ambrosia ilicifolia	8000000000
Ambrosia monogyra	98c0045403
Ambrosia psilostachya	1ffdfbff01
Ambrosia pumila	00c0000000
Ambrosia salsola	f8c2057407
Ambrosia salsola var. pentalepis	e000000000
Ambrosia salsola var. salsola	f8c2057407
Ambrosia trifida	19c2037c05
Amelanchier alnifolia	0025c00000
Amelanchier alnifolia var. pumila	0000c00000
Amelanchier alnifolia var. semiintegrifolia	0025000000
Amelanchier utahensis	5ffdffdd03
Ammannia coccinea	9bc03a7e01
Ammannia robusta	f1b8232a00
Ammi majus	0024000200
Ammi visnaga	0180000000
Ammophila arenaria	1184000000
Ammoselinum giganteum	8000000000
Amorpha californica	02f90b5e01
Amorpha californica var. californica	02d10b5601
Amorpha californica var. napensis	0038000800
Amorpha fruticosa	80c0004600
Amphipappus fremontii	6000000000
Amphipappus fremontii subsp. fremontii	6000000000
Amphipappus fremontii subsp. spinosus	6000000000
Amphipappus fremontii var. fremontii	6000000000
Amphipappus fremontii var. spinosus	6000000000
Amphiscirpus nevadensis	e602040006
Amsinckia douglasiana	0000030001
Amsinckia eastwoodiae	18d43bf601
Amsinckia furcata	0000012000
Amsinckia grandiflora	0000002000
Amsinckia intermedia	ffffffff07
Amsinckia lunaris	0138000a00
Amsinckia lycopsoides	1bfd3b6a00
Amsinckia menziesii	1ffffbff05
Amsinckia retrorsa	ffffffff07
Amsinckia spectabilis	1984000000
Amsinckia spectabilis var. microcarpa	0100000000
Amsinckia spectabilis var. spectabilis	1984000000
Amsinckia tessellata	e01227bc07
Amsinckia tessellata var. gloriosa	601003a801
Amsinckia tessellata var. tessellata	e00227bc07
Amsinckia vernicosa	6000232801
Amsonia tomentosa	e000000400
Anagallis arvensis	7ffdfbff01
Anagallis minima	0bfd0b6800
Anagallis monelli	0001020800
Anaphalis margaritacea	053fc30d04
Anchusa azurea	0100080800
Anchusa officinalis	0200000200
Ancistrocarphus filagineus	3ffffbff05
Ancistrocarphus keilii	0000020000
Andropogon glomeratus	78a4c81701
Andropogon glomeratus var. scabriglumis	78a4c81701
Andropogon virginicus	0220580a00
Andropogon virginicus var. virginicus	0220580a00
Androsace elongata	06d0216e01
Androsace elongata subsp. acuta	06d0216e01
Androsace filiformis	0400000000
Androsace occidentalis	0000400000
Androsace septentrionalis	0000840502
Androstephium breviflorum	e000000000
Anelsonia eurycarpa	0000c40102
Anemone deltoidea	0029000000
Anemone drummondii	0601f88100
Anemone drummondii subsp. drummondii	0601f88100
Anemone drummondii var. drummondii	0601f88100
Anemone grayi	0039020800
Anemone lyallii	0601480000
Anemone multifida	0001400000
Anemone multifida subsp. multifida	0001400000
Anemone multifida var. multifida	0001400000
Anemone occidentalis	0601f88100
Anemone oregana	0401000000
Anemone oregana var. oregana	0401000000
Anemone tuberosa	4000000000
Anemopsis californica	7dc0276b02
Anethum graveolens	18c0005401
Angelica arguta	0401000000
Angelica breweri	0400c00000
Angelica californica	0638080800
Angelica callii	0000000100
Angelica genuflexa	0021000000
Angelica hendersonii	0104000000
Angelica kingii	0000000002
Angelica lineariloba	0000840102
Angelica lucida	0004000000
Angelica tomentosa	0179025c00
Anisocarpus madioides	017d430800
Anisocarpus scabridus	0408000000
Anisocoma acaulis	e04227f507
Anisodontea capensis	0020000200
Anoda cristata	e080382200
Anoda pentaschista	8000000000
Anredera cordifolia	0080020800
Antennaria argentea	040bc00104
Antennaria corymbosa	0000c00100
Antennaria dimorpha	000bc41507
Antennaria flagellaris	0002000004
Antennaria geyeri	000b400004
Antennaria howellii	0001000000
Antennaria howellii subsp. howellii	0001000000
Antennaria howellii var. howellii	0001000000
Antennaria luzuloides	040a400004
Antennaria luzuloides subsp. aberrans	0402000004
Antennaria luzuloides subsp. luzuloides	000a400004
Antennaria luzuloides var. luzuloides	000a400004
Antennaria marginata	0000000400
Antennaria media	0409c00502
Antennaria microphylla	0000040002
Antennaria pulchella	0000c40100
Antennaria racemosa	0001000000
Antennaria rosea	0403c45506
Antennaria rosea subsp. confinis	0403c45506
Antennaria rosea subsp. rosea	0403c45506
Antennaria rosea var. rosea	0403c45506
Antennaria suffrutescens	0021000000
Antennaria umbrinella	0000c00102
Anthemis arvensis	0021800000
Anthemis cotula	01fffbff05
Anthoxanthum aristatum	033c000800
Anthoxanthum aristatum subsp. aristatum	033c000800
Anthoxanthum nitens	0400000000
Anthoxanthum nitens subsp. nitens	0400000000
Anthoxanthum occidentale	0124020800
Anthoxanthum odoratum	0134d80800
Anthriscus caucalis	1ffffbff05
Antirrhinum cornutum	0610000200
Antirrhinum coulterianum	80c0025401
Antirrhinum filipes	e000000000
Antirrhinum kelloggii	19e0035c01
Antirrhinum kingii	4000c40102
Antirrhinum leptaleum	0000f88100
Antirrhinum majus	0180000000
Antirrhinum multiflorum	08400b5c01
Antirrhinum nuttallianum	19c0004400
Antirrhinum nuttallianum subsp. nuttallianum	00c0004400
Antirrhinum nuttallianum subsp. subsessile	1980000000
Antirrhinum nuttallianum var. nuttallianum	00c0004400
Antirrhinum orontium	0100000200
Antirrhinum ovatum	0000012001
Antirrhinum subcordatum	0010000000
Antirrhinum vexillocalyculatum	0439d90a00
Antirrhinum vexillocalyculatum subsp. breweri	0429000000
Antirrhinum vexillocalyculatum subsp. intermedium	0000d80000
Antirrhinum vexillocalyculatum subsp. vexillocalyculatum	0038010a00
Antirrhinum virga	0018000000
Anulocaulis annulatus	6000000000
Apera interrupta	0603000006
Apera spica-venti	0000022000
Aphanes occidentalis	1bfd3b5e01
Aphanisma blitoides	1980000000
Apiastrum angustifolium	1ffdfbff01
Apium graveolens	ffffffff07
Apium nodiflorum	0100000800
Apocynum androsaemifolium	057fc95d06
Apocynum cannabinum	e47fc7ff07
Aponogeton distachyos	0080000800
Aptenia cordifolia	1180000000
Aquilegia eximia	0038030801
Aquilegia formosa	077fffdd07
Aquilegia pubescens	0000c00100
Aquilegia shockleyi	4000000002
Arabidopsis thaliana	06bd480a04
Arabis blepharophylla	0100000800
Arabis eschscholtziana	0621f88502
Arabis mcdonaldiana	0020000000
Arabis modesta	0011000000
Arabis oregana	0021000000
Arabis pycnocarpa	0621f88502
Arabis pycnocarpa var. pycnocarpa	0621f88502
Aralia californica	04794b5c01
Araujia sericifera	01c0020001
Arbutus menziesii	0d7dc35801
Arceuthobium americanum	0400c00100
Arceuthobium campylopodum	477fffdd07
Arceuthobium douglasii	0401000000
Arctium lappa	0010000800
Arctium minus	083f000004
Arctomecon merriamii	6000000000
Arctostaphylos andersonii	0000000800
Arctostaphylos auriculata	0000000800
Arctostaphylos bakeri	0020000000
Arctostaphylos bakeri subsp. bakeri	0020000000
Arctostaphylos bakeri subsp. sublaevis	0020000000
Arctostaphylos canescens	0039000800
Arctostaphylos canescens subsp. canescens	0039000800
Arctostaphylos canescens subsp. sonomensis	0021000800
Arctostaphylos canescens var. canescens	0039000800
Arctostaphylos canescens var. sonomensis	0021000800
Arctostaphylos catalinae	1000000000
Arctostaphylos columbiana	0025000000
Arctostaphylos confertiflora	0800000000
Arctostaphylos crustacea	0910030800
Arctostaphylos crustacea subsp. crinita	0100000800
Arctostaphylos crustacea subsp. crustacea	0910030800
Arctostaphylos crustacea subsp. eastwoodiana	0000000000
Arctostaphylos crustacea subsp. insulicola	0800000000
Arctostaphylos crustacea subsp. rosei	0100000000
Arctostaphylos crustacea subsp. subcordata	0800000000
Arctostaphylos crustacea var. crinita	0100000800
Arctostaphylos crustacea var. crustacea	0910030800
Arctostaphylos crustacea var. rosei	0100000000
Arctostaphylos cruzensis	0100000000
Arctostaphylos densiflora	0020000000
Arctostaphylos edmundsii	0100000000
Arctostaphylos franciscana	0100000000
Arctostaphylos gabilanensis	0000010000
Arctostaphylos glandulosa	00f9035c01
Arctostaphylos glandulosa subsp. adamsii	00c0005401
Arctostaphylos glandulosa subsp. crassifolia	0080000000
Arctostaphylos glandulosa subsp. cushingiana	0079034800
Arctostaphylos glandulosa subsp. gabrielensis	0000021000
Arctostaphylos glandulosa subsp. glandulosa	0079034800
Arctostaphylos glandulosa subsp. howellii	0000020000
Arctostaphylos glandulosa subsp. leucophylla	0040004400
Arctostaphylos glandulosa subsp. mollis	0040005401
Arctostaphylos glandulosa var. adamsii	00c0005401
Arctostaphylos glandulosa var. crassifolia	0080000000
Arctostaphylos glandulosa var. cushingiana	0079034800
Arctostaphylos glandulosa var. glandulosa	0079034800
Arctostaphylos glandulosa var. howellii	0000020000
Arctostaphylos glandulosa var. mollis	0040005401
Arctostaphylos glauca	4040035c01
Arctostaphylos glutinosa	0000000800
Arctostaphylos hispidula	0021000000
Arctostaphylos hookeri	0100000800
Arctostaphylos hookeri subsp. hearstiorum	0100000000
Arctostaphylos hookeri subsp. hookeri	0100000800
Arctostaphylos hooveri	0000020000
Arctostaphylos imbricata	0100000000
Arctostaphylos insularis	0800000000
Arctostaphylos klamathensis	0001000000
Arctostaphylos luciana	0000020000
Arctostaphylos malloryi	0011000000
Arctostaphylos manzanita	0239580a00
Arctostaphylos manzanita subsp. elegans	0039000000
Arctostaphylos manzanita subsp. glaucescens	0020000000
Arctostaphylos manzanita subsp. laevigata	0010000800
Arctostaphylos manzanita subsp. manzanita	0231580a00
Arctostaphylos manzanita subsp. roofii	0210000000
Arctostaphylos manzanita subsp. wieslanderi	0208000000
Arctostaphylos manzanita var. elegans	0039000000
Arctostaphylos manzanita var. manzanita	0231580a00
Arctostaphylos mewukka	0600780000
Arctostaphylos mewukka subsp. mewukka	0000780000
Arctostaphylos mewukka subsp. truei	0600080000
Arctostaphylos montana	0100000800
Arctostaphylos montana subsp. montana	0000000800
Arctostaphylos montana subsp. ravenii	0100000000
Arctostaphylos montaraensis	0100000800
Arctostaphylos montereyensis	0100020000
Arctostaphylos morroensis	0100000000
Arctostaphylos myrtifolia	0000080000
Arctostaphylos nevadensis	042bc40104
Arctostaphylos nevadensis subsp. knightii	0021000000
Arctostaphylos nevadensis subsp. nevadensis	040bc40104
Arctostaphylos nevadensis var. nevadensis	040bc40104
Arctostaphylos nissenana	0000580000
Arctostaphylos nortensis	0001000000
Arctostaphylos nummularia	0004000000
Arctostaphylos nummularia subsp. mendocinoensis	0004000000
Arctostaphylos nummularia subsp. nummularia	0000000000
Arctostaphylos nummularia var. nummularia	0000000000
Arctostaphylos obispoensis	0000020000
Arctostaphylos ohloneana	0000000800
Arctostaphylos osoensis	0100000000
Arctostaphylos otayensis	0040000000
Arctostaphylos pacifica	0100000000
Arctostaphylos pajaroensis	0100000800
Arctostaphylos pallida	0000000800
Arctostaphylos parryana	0040005401
Arctostaphylos parryana subsp. desertica	0040004000
Arctostaphylos parryana subsp. parryana	0000001401
Arctostaphylos parryana subsp. tumescens	0000001400
Arctostaphylos parryana var. parryana	0000001401
Arctostaphylos patula	0408c05500
Arctostaphylos pechoensis	0100000000
Arctostaphylos pilosula	0100020000
Arctostaphylos pringlei	0040004400
Arctostaphylos pringlei subsp. drupacea	0040004400
Arctostaphylos pringlei var. drupacea	0040004400
Arctostaphylos pumila	0100000000
Arctostaphylos pungens	4040034400
Arctostaphylos purissima	0100000000
Arctostaphylos rainbowensis	0040000000
Arctostaphylos refugioensis	0000000001
Arctostaphylos regismontana	0000000800
Arctostaphylos rudis	0100020000
Arctostaphylos sensitiva	0000000800
Arctostaphylos silvicola	0000000800
Arctostaphylos stanfordiana	0030000000
Arctostaphylos stanfordiana subsp. decumbens	0020000000
Arctostaphylos stanfordiana subsp. raichei	0010000000
Arctostaphylos stanfordiana subsp. stanfordiana	0030000000
Arctostaphylos stanfordiana var. stanfordiana	0030000000
Arctostaphylos tomentosa	0100000000
Arctostaphylos tomentosa subsp. bracteosa	0100000000
Arctostaphylos tomentosa subsp. daciticola	0100000000
Arctostaphylos tomentosa subsp. hebeclada	0100000000
Arctostaphylos tomentosa subsp. tomentosa	0100000000
Arctostaphylos tomentosa var. hebeclada	0100000000
Arctostaphylos tomentosa var. tomentosa	0100000000
Arctostaphylos uva-ursi	0104800000
Arctostaphylos virgata	0100000800
Arctostaphylos viridissima	0800000000
Arctostaphylos viscida	0239f88100
Arctostaphylos viscida subsp. mariposa	0000f88100
Arctostaphylos viscida subsp. pulchella	0039000000
Arctostaphylos viscida subsp. viscida	0211f88100
Arctotheca calendula	0104020000
Arctotheca prostrata	0184000000
Arctotis venusta	0080000000
Arenaria lanuginosa	0040004400
Arenaria lanuginosa subsp. saxosa	0040004400
Arenaria lanuginosa var. saxosa	0040004400
Arenaria paludicola	0180000800
Arenaria serpyllifolia	00bf180004
Arenaria serpyllifolia subsp. serpyllifolia	00bf180004
Arenaria serpyllifolia var. serpyllifolia	00bf180004
Argemone corymbosa	6000040002
Argemone munita	f9fba75d07
Argyranthemum foeniculaceum	0180000000
Argyrochosma jonesii	4000021102
Argyrochosma limitanea	4000000000
Argyrochosma limitanea subsp. limitanea	4000000000
Argyrochosma limitanea var. limitanea	4000000000
Arida arizonica	6000000000
Arida carnosa	6080042002
Aristida adscensionis	f1c0004001
Aristida californica	e000000000
Aristida dichotoma	0000080000
Aristida divaricata	00c0002000
Aristida oligantha	023f3a2204
Aristida purpurea	e0c0044402
Aristida purpurea var. fendleriana	6040044402
Aristida purpurea var. longiseta	e000000400
Aristida purpurea var. nealleyi	e0c0004400
Aristida purpurea var. parishii	e080000400
Aristida purpurea var. purpurea	40c0004400
Aristida purpurea var. wrightii	e040004000
Aristida ternipes	68d0207601
Aristida ternipes var. gentilis	68d0207601
Aristocapsa insignis	0000010000
Aristolochia californica	03381a2a00
Armeria maritima	0904000000
Armeria maritima subsp. californica	0904000000
Armeria maritima var. californica	0904000000
Armoracia rusticana	0100002a00
Arnica cernua	0001000000
Arnica chamissonis	0601fc8506
Arnica cordifolia	047bc24904
Arnica dealbata	0600d80000
Arnica discoidea	077fdb0d05
Arnica fulgens	0002400004
Arnica lanceolata	0401c40102
Arnica lanceolata subsp. prima	0401c40102
Arnica latifolia	0001800000
Arnica longifolia	040bc40106
Arnica mollis	0409c40106
Arnica nevadensis	0409c00100
Arnica ovata	0401c00100
Arnica parryi	0009c00102
Arnica sororia	0002040006
Arnica spathulata	0001000000
Arnica venosa	0401000000
Arnica viscosa	0601000000
Arrhenatherum elatius	073f980805
Artemisia annua	0080000000
Artemisia arbuscula	000bc40106
Artemisia arbuscula subsp. arbuscula	000bc40106
Artemisia arbuscula subsp. longiloba	0000040002
Artemisia arbuscula var. arbuscula	000bc40106
Artemisia arbuscula var. longiloba	0000040002
Artemisia biennis	41a2072e07
Artemisia bigelovii	4000000002
Artemisia borealis	0001000000
Artemisia borealis subsp. borealis	0001000000
Artemisia borealis var. borealis	0001000000
Artemisia californica	19c0035c01
Artemisia cana	0402e40106
Artemisia cana subsp. bolanderi	0402e40106
Artemisia douglasiana	1fffffff05
Artemisia dracunculus	f9e3ffff07
Artemisia ludoviciana	e4e3fcf507
Artemisia ludoviciana subsp. albula	e040004000
Artemisia ludoviciana subsp. candicans	0002400004
Artemisia ludoviciana subsp. incompta	4442fcd507
Artemisia ludoviciana subsp. ludoviciana	60e3fcf507
Artemisia ludoviciana var. albula	e040004000
Artemisia ludoviciana var. incompta	4442fcd507
Artemisia ludoviciana var. ludoviciana	60e3fcf507
Artemisia michauxiana	0000000002
Artemisia nesiotica	1000000000
Artemisia norvegica	0001c04102
Artemisia norvegica subsp. saxatilis	0001c04102
Artemisia norvegica var. saxatilis	0001c04102
Artemisia nova	4402044006
Artemisia palmeri	00c0004000
Artemisia pycnocephala	0104000000
Artemisia rothrockii	0000841502
Artemisia spiciformis	0000c00102
Artemisia spinescens	6002040406
Artemisia suksdorfii	1004000000
Artemisia tridentata	6482c53507
Artemisia tridentata subsp. parishii	6080010003
Artemisia tridentata subsp. tridentata	4402053407
Artemisia tridentata subsp. vaseyana	0400c41507
Artemisia tridentata subsp. wyomingensis	0002040006
Artemisia tridentata var. parishii	6080010003
Artemisia tridentata var. tridentata	4402053407
Artemisia tridentata var. vaseyana	0400c41507
Artemisia tridentata var. wyomingensis	0002040006
Arthrocnemum subterminale	f980002a00
Arum italicum	0024000a00
Arum palaestinum	0004000000
Aruncus dioicus	0625000000
Aruncus dioicus var. acuminatus	0625000000
Arundo donax	e184133200
Asarum caudatum	043d000800
Asarum hartwegii	0401c00100
Asarum lemmonii	0400c00100
Asarum marmoratum	0001000000
Asclepias albicans	e000000000
Asclepias asperula	6000000000
Asclepias asperula subsp. asperula	6000000000
Asclepias asperula var. asperula	6000000000
Asclepias californica	f9c0335c01
Asclepias cordifolia	073df88300
Asclepias cryptoceras	0000040002
Asclepias curassavica	18c0005401
Asclepias eriocarpa	1fffffff07
Asclepias erosa	f8c0207503
Asclepias fascicularis	fe7bffff07
Asclepias fruticosa	0100000000
Asclepias latifolia	0010000000
Asclepias linaria	ffffffff07
Asclepias nyctaginifolia	6000000000
Asclepias solanoana	0039000000
Asclepias speciosa	673fffab06
Asclepias subulata	e000000000
Asclepias vestita	6100033e01
Asparagus aethiopicus	0080000000
Asparagus asparagoides	01c0004000
Asparagus officinalis	1ffdfbff03
Asparagus officinalis subsp. officinalis	1ffdfbff03
Asparagus setaceus	0080000000
Asperugo procumbens	0002000004
Asphodelus fistulosus	1080002000
Aspidotis californica	1bf8fbff01
Aspidotis carlotta-halliae	0100030800
Aspidotis densa	077dfbc900
Asplenium septentrionale	0400000100
Asplenium trichomanes	0001000000
Asplenium trichomanes subsp. trichomanes	0001000000
Asplenium trichomanes var. trichomanes	0001000000
Asplenium vespertinum	00c0001000
Asplenium viride	0000400000
Astragalus accidens	0201000000
Astragalus accidens var. hendersonii	0201000000
Astragalus acutirostris	e000040002
Astragalus agnicidus	0020000000
Astragalus agrestis	0002040006
Astragalus albens	2000000400
Astragalus allochrous	6000000000
Astragalus allochrous var. playanus	6000000000
Astragalus andersonii	1fffffff07
Astragalus anxius	0002000004
Astragalus argophyllus	0002040006
Astragalus argophyllus var. argophyllus	0002040006
Astragalus aridus	8000000000
Astragalus asymmetricus	0010032a00
Astragalus atratus	4000000000
Astragalus atratus var. mensanus	4000000000
Astragalus austiniae	0000400000
Astragalus bernardinus	4000000400
Astragalus bicristatus	00c0005400
Astragalus bolanderi	0400c00100
Astragalus brauntonii	0040001001
Astragalus breweri	0038000800
Astragalus californicus	0403000004
Astragalus calycosus	4000040002
Astragalus calycosus var. calycosus	4000040002
Astragalus canadensis	0002440004
Astragalus canadensis var. brevidens	0002440004
Astragalus casei	4000040002
Astragalus cicer	0000500000
Astragalus cimae	4000000002
Astragalus cimae var. cimae	4000000000
Astragalus cimae var. sufflatus	0000000002
Astragalus claranus	0038000200
Astragalus clevelandii	0018000000
Astragalus coccineus	6040044402
Astragalus congdonii	0000300000
Astragalus crotalariae	8000000000
Astragalus curtipes	0980030000
Astragalus curvicarpus	0402040006
Astragalus curvicarpus var. curvicarpus	0402040006
Astragalus deanei	0040000000
Astragalus didymocarpus	f9c033fe01
Astragalus didymocarpus var. didymocarpus	79c033fe01
Astragalus didymocarpus var. dispermus	e000000000
Astragalus didymocarpus var. milesianus	0100000000
Astragalus didymocarpus var. obispoensis	18c0025400
Astragalus douglasii	61c0b3f701
Astragalus douglasii var. douglasii	6100b3b701
Astragalus douglasii var. parishii	00c0004400
Astragalus douglasii var. perstrictus	0040000000
Astragalus ertterae	0000000100
Astragalus filipes	0002004405
Astragalus funereus	4000000000
Astragalus gambelianus	1ffdfbff01
Astragalus geyeri	0002040006
Astragalus geyeri var. geyeri	0002040006
Astragalus gibbsii	0002440006
Astragalus gilmanii	4000000000
Astragalus hornii	2080002001
Astragalus hornii var. hornii	2080002001
Astragalus insularis	8000000000
Astragalus insularis var. harwoodii	8000000000
Astragalus inversus	0402000004
Astragalus inyoensis	0000000002
Astragalus iodanthus	0002040006
Astragalus iodanthus var. diaphanoides	0002000004
Astragalus iodanthus var. iodanthus	0000040002
Astragalus jaegerianus	6000000000
Astragalus johannis-howellii	0000040002
Astragalus kentrophyta	0000840102
Astragalus kentrophyta subsp. danaus	0000840102
Astragalus kentrophyta subsp. elatus	0000000002
Astragalus kentrophyta subsp. ungulatus	0000040002
Astragalus kentrophyta var. danaus	0000840102
Astragalus kentrophyta var. elatus	0000000002
Astragalus kentrophyta var. tegetarius	0000800002
Astragalus kentrophyta var. ungulatus	0000040002
Astragalus layneae	6000000002
Astragalus lemmonii	0002840006
Astragalus lentiformis	0000400000
Astragalus lentiginosus	e002e5b507
Astragalus lentiginosus var. albifolius	6000040002
Astragalus lentiginosus var. antonius	0000001000
Astragalus lentiginosus var. borreganus	e000000000
Astragalus lentiginosus var. chartaceus	0002000004
Astragalus lentiginosus var. coachellae	8000000000
Astragalus lentiginosus var. floribundus	0002440006
Astragalus lentiginosus var. fremontii	600005a003
Astragalus lentiginosus var. idriensis	0000010001
Astragalus lentiginosus var. ineptus	0000c40102
Astragalus lentiginosus var. kernensis	0000000100
Astragalus lentiginosus var. lentiginosus	0002000004
Astragalus lentiginosus var. micans	2000000000
Astragalus lentiginosus var. nigricalycis	0000212001
Astragalus lentiginosus var. piscinensis	0000040002
Astragalus lentiginosus var. salinus	0002000004
Astragalus lentiginosus var. semotus	0000000002
Astragalus lentiginosus var. sesquimetralis	2000000000
Astragalus lentiginosus var. sierrae	0000001401
Astragalus lentiginosus var. variabilis	600024a002
Astragalus leucolobus	000000d401
Astragalus macrodon	0000030000
Astragalus magdalenae	8000000000
Astragalus magdalenae var. peirsonii	8000000000
Astragalus malacus	6002040006
Astragalus miguelensis	1900000000
Astragalus minthorniae	4000000402
Astragalus minthorniae var. villosus	4000000402
Astragalus mohavensis	e000000000
Astragalus mohavensis var. hemigyrus	e000000000
Astragalus mohavensis var. mohavensis	6000000000
Astragalus monoensis	0000040002
Astragalus nevinii	1800000000
Astragalus newberryi	6000040002
Astragalus newberryi var. newberryi	6000040002
Astragalus nutans	c000000000
Astragalus nuttallianus	e000000000
Astragalus nuttallianus var. austrinus	0000000000
Astragalus nuttallianus var. cedrosensis	8000000000
Astragalus nuttallianus var. imperfectus	e000000000
Astragalus nuttallii	0104000000
Astragalus nuttallii var. nuttallii	0100000000
Astragalus nuttallii var. virgatus	0104000000
Astragalus obscurus	0603000004
Astragalus oocarpus	0040000000
Astragalus oophorus	4000040002
Astragalus oophorus var. lavinii	0000040002
Astragalus oophorus var. oophorus	4000040002
Astragalus oxyphysus	0000213001
Astragalus pachypus	a04001e001
Astragalus pachypus var. jaegeri	8040004000
Astragalus pachypus var. pachypus	a00001a001
Astragalus palmeri	a040004000
Astragalus panamintensis	4000000000
Astragalus pauperculus	0600080200
Astragalus platytropis	4000840002
Astragalus pomonensis	80c0024000
Astragalus preussii	e000000000
Astragalus preussii var. laxiflorus	e000000000
Astragalus preussii var. preussii	6000000000
Astragalus pseudiodanthus	0000040002
Astragalus pulsiferae	0402400004
Astragalus pulsiferae var. coronensis	0002400004
Astragalus pulsiferae var. pulsiferae	0002400004
Astragalus pulsiferae var. suksdorfii	0400000000
Astragalus purshii	640bc59507
Astragalus purshii var. lagopinus	0002000004
Astragalus purshii var. lectulus	0000c41500
Astragalus purshii var. purshii	0002000004
Astragalus purshii var. tinctus	640bc58507
Astragalus pycnostachyus	0184000000
Astragalus pycnostachyus var. lanosissimus	0080000000
Astragalus pycnostachyus var. pycnostachyus	0104000000
Astragalus rattanii	0038000000
Astragalus rattanii var. jepsonianus	0010000000
Astragalus rattanii var. rattanii	0038000000
Astragalus ravenii	0000000100
Astragalus sabulonum	e000000000
Astragalus sepultipes	0000840102
Astragalus serenoi	4000040002
Astragalus serenoi var. shockleyi	4000040002
Astragalus shevockii	0000000100
Astragalus subvestitus	0000000100
Astragalus tener	0180012a00
Astragalus tener var. ferrisiae	0000000200
Astragalus tener var. tener	0000012a00
Astragalus tener var. titi	0180000000
Astragalus tephrodes	0000000000
Astragalus tephrodes var. brachylobus	0000000000
Astragalus tidestromii	6000000000
Astragalus traskiae	1000000000
Astragalus tricarinatus	a000000400
Astragalus trichopodus	69c003e101
Astragalus trichopodus subsp. trichopodus	00c0000000
Astragalus trichopodus var. lonchus	69c0000000
Astragalus trichopodus var. phoxus	20c003e101
Astragalus trichopodus var. trichopodus	00c0000000
Astragalus umbraticus	0021000000
Astragalus webberi	0000400004
Astragalus whitneyi	040be40107
Astragalus whitneyi subsp. siskiyouensis	040b000004
Astragalus whitneyi subsp. whitneyi	0400e40103
Astragalus whitneyi var. confusus	0402400004
Astragalus whitneyi var. lenophyllus	0001400000
Astragalus whitneyi var. siskiyouensis	040b000004
Astragalus whitneyi var. whitneyi	0400e40103
Astrolepis cochisensis	4000000000
Asyneuma prenanthoides	043d020900
Athyrium distentifolium	0401c00106
Athyrium distentifolium subsp. americanum	0401c00106
Athyrium distentifolium var. americanum	0401c00106
Athyrium filix-femina	1f3ffa3d04
Athyrium filix-femina subsp. cyclosorum	1f3ffa3d04
Athyrium filix-femina var. cyclosorum	1f3ffa3d04
Athysanus pusillus	5ffffbff05
Athysanus unilateralis	020023a200
Atrichoseris platyphylla	e000000000
Atriplex amnicola	0080000000
Atriplex argentea	f9c2447e07
Atriplex argentea subsp. argentea	6002040006
Atriplex argentea subsp. expansa	f9c0007e01
Atriplex argentea var. argentea	6002040006
Atriplex argentea var. expansa	f9c0007e01
Atriplex argentea var. hillmanii	2002400004
Atriplex argentea var. longitrichoma	2000000000
Atriplex californica	1984000000
Atriplex canescens	e0c2c5d507
Atriplex canescens subsp. canescens	e0c2c5d507
Atriplex canescens subsp. linearis	e000000000
Atriplex canescens var. canescens	e0c2c5d507
Atriplex canescens var. laciniata	a000000001
Atriplex canescens var. linearis	e000000000
Atriplex canescens var. macilenta	8000000000
Atriplex confertifolia	6002c50106
Atriplex cordulata	0000002200
Atriplex cordulata var. cordulata	0000002200
Atriplex cordulata var. erecticaulis	0000002000
Atriplex coronata	0080012200
Atriplex coronata var. coronata	0000012200
Atriplex coronata var. notatior	0080000000
Atriplex coronata var. vallicola	0000002000
Atriplex coulteri	1880000000
Atriplex covillei	6000042002
Atriplex depressa	0000002200
Atriplex dioica	0180002a00
Atriplex elegans	e000040002
Atriplex elegans subsp. elegans	e000000000
Atriplex elegans subsp. fasciculata	e000040002
Atriplex elegans var. elegans	e000000000
Atriplex elegans var. fasciculata	e000040002
Atriplex fruticulosa	601001aa00
Atriplex gardneri	0002000004
Atriplex gardneri var. falcata	0002000004
Atriplex glauca	0080000001
Atriplex gmelinii	0104000800
Atriplex gmelinii var. gmelinii	0104000800
Atriplex hortensis	0086000804
Atriplex hymenelytra	e000040002
Atriplex joaquinana	0110012a00
Atriplex lentiformis	f0c0256303
Atriplex leucophylla	1984000800
Atriplex lindleyi	0080000000
Atriplex micrantha	0203042205
Atriplex minuscula	0000002000
Atriplex nummularia	0080000000
Atriplex pacifica	1880000000
Atriplex parishii	00c0004000
Atriplex parryi	e000040002
Atriplex patula	0304000800
Atriplex persistens	0000002200
Atriplex polycarpa	e040043403
Atriplex prostrata	1de60ffe05
Atriplex pusilla	0002040006
Atriplex rosea	ffffffff07
Atriplex semibaccata	f9fd23ff01
Atriplex serenana	f9c0277f03
Atriplex serenana var. davidsonii	0080000000
Atriplex serenana var. serenana	f9c0277f03
Atriplex spinifera	6000012001
Atriplex suberecta	90c0006801
Atriplex subtilis	0000002000
Atriplex torreyi	6000040002
Atriplex torreyi var. torreyi	6000040002
Atriplex truncata	6002c41507
Atriplex tularensis	0000002000
Atriplex watsonii	1980000000
Aubrieta deltoidea	0008000000
Avena barbata	7ffffbff05
Avena fatua	7ffffbff05
Avena sativa	1ffdfbff01
Avena sterilis	0180000000
Avicennia marina	0080000000
Avicennia marina var. australasica	0080000000
Ayenia compacta	c040000000
Azolla filiculoides	1fffffff07
Azolla microphylla	0100442f02
Baccharis brachyphylla	e000004400
Baccharis glutinosa	1be53b7e01
Baccharis malibuensis	0040004001
Baccharis pilularis	1bfd3b4a01
Baccharis pilularis subsp. consanguinea	1bfd3b4a01
Baccharis pilularis subsp. pilularis	0104000000
Baccharis pilularis var. consanguinea	1bfd3b4a01
Baccharis pilularis var. pilularis	0104000000
Baccharis plummerae	0980020001
Baccharis plummerae subsp. glabrata	0100020000
Baccharis plummerae subsp. plummerae	0980020001
Baccharis salicifolia	fbfd3bfe01
Baccharis salicifolia subsp. salicifolia	fbfd3bfe01
Baccharis salicina	e0c0014001
Baccharis sarothroides	e040004000
Baccharis sergiloides	e04000c000
Baccharis vanessae	00c0000000
Bacopa eisenii	0000042202
Bacopa monnieri	8080000000
Bacopa repens	0000000200
Bacopa rotundifolia	0002002204
Bahia neomexicana	4000000000
Bahiopsis laciniata	00c0000001
Bahiopsis parishii	e040000000
Bahiopsis reticulata	6000000000
Baileya multiradiata	e000020000
Baileya pauciradiata	e000000000
Baileya pleniradiata	e080040002
Balsamorhiza deltoidea	013ffb8905
Balsamorhiza hirsuta	0002000004
Balsamorhiza hookeri	0402400004
Balsamorhiza lanata	0401000000
Balsamorhiza macrolepis	0000b80a00
Balsamorhiza sagittata	0402c40106
Balsamorhiza sericea	0001000000
Balsamorhiza serrata	0002000004
Barbarea orthoceras	1fffffdd07
Barbarea verna	0000020000
Barbarea vulgaris	0002040006
Bassia hyssopifolia	ffc23ffe07
Batis maritima	0080000000
Bebbia juncea	f8c0005401
Bebbia juncea var. aspera	f8c0005401
Beckmannia syzigachne	073f4c0a04
Bellardia trixago	0124030a00
Bellis perennis	19fd037e01
Benitoa occidentalis	0000010000
Bensoniella oregona	0021000000
Berberis aquifolium	677fffdf07
Berberis aquifolium var. aquifolium	063bf89104
Berberis aquifolium var. dictyota	077dfbdf01
Berberis aquifolium var. repens	667bfcc106
Berberis darwinii	0104000000
Berberis fremontii	6040004000
Berberis haematocarpa	6000000000
Berberis harrisoniana	8000000000
Berberis higginsiae	0040004000
Berberis nervosa	003d430800
Berberis nevinii	18c0005401
Berberis pinnata	097d035801
Berberis pinnata subsp. insularis	0800000000
Berberis pinnata subsp. pinnata	017d035801
Berberis pinnata var. pinnata	017d035801
Berberis vulgaris	003d000000
Bergerocactus emoryi	1080000000
Bergia texana	0080002200
Bernardia incana	e000000000
Berteroa incana	0002000004
Berula erecta	ffffffff07
Beta vulgaris	19c0004801
Beta vulgaris subsp. maritima	19c0004801
Betula glandulosa	0400000004
Betula occidentalis	4403c40106
Bidens cernua	073b4c0006
Bidens frondosa	7ffffcf707
Bidens laevis	79c0077e03
Bidens pilosa	19c0035c01
Bidens tripartita	0000802000
Bidens vulgata	0038000200
Billardiera heterophylla	0180000000
Bistorta bistortoides	1ffdffff01
Bituminaria bituminosa	0080001000
Blechnum spicant	0124400800
Blennosperma bakeri	0020000800
Blennosperma nanum	0bfc3a6a00
Blennosperma nanum var. nanum	0bf83a6a00
Blennosperma nanum var. robustum	0104000000
Blepharidachne kingii	4000040002
Blepharipappus scaber	0403400004
Blepharizonia laxa	0000032800
Blepharizonia plumosa	0000002800
Bloomeria clevelandii	0080000000
Bloomeria crocea	19c003dc01
Bloomeria crocea var. aurea	0100030800
Bloomeria crocea var. crocea	19c0035c01
Bloomeria crocea var. montana	0000038001
Bloomeria humilis	0100030000
Boechera acutina	0001000000
Boechera arcuata	01803b1c01
Boechera bodiensis	0000040002
Boechera breweri	0619090a01
Boechera breweri subsp. breweri	0619090a01
Boechera breweri subsp. shastaensis	0611080200
Boechera calderi	0002c00106
Boechera californica	18c0005401
Boechera cobrensis	4000040002
Boechera constancei	0000400000
Boechera covillei	0400c00100
Boechera davidsonii	0000c00104
Boechera depauperata	0000000102
Boechera dispar	4000040402
Boechera divaricarpa	0402000004
Boechera elkoensis	0000c40000
Boechera evadens	0000000100
Boechera glaucovalvula	6000040002
Boechera hoffmannii	0800000000
Boechera howellii	0400c00100
Boechera inyoensis	4000c40102
Boechera johnstonii	0040004000
Boechera koehleri	0001000000
Boechera lemmonii	0400c40106
Boechera lincolnensis	4000000002
Boechera lyallii	0400c00106
Boechera parishii	0000000400
Boechera pauciflora	0402c40006
Boechera paupercula	0400c00106
Boechera peirsonii	0000000400
Boechera pendulina	0000000002
Boechera pendulocarpa	0002040006
Boechera perennans	e040041502
Boechera pinetorum	0001c00100
Boechera pinzliae	0000000002
Boechera platysperma	040bc41106
Boechera pratincola	0401c00100
Boechera puberula	0002c40106
Boechera pulchra	6040077603
Boechera pygmaea	0000000100
Boechera rectissima	0400c00500
Boechera repanda	0008c05501
Boechera retrofracta	040bc40106
Boechera rigidissima	0001000000
Boechera rollei	0001000000
Boechera rubicundula	0000000800
Boechera serpenticola	0001000000
Boechera shevockii	0000000100
Boechera shockleyi	4000000402
Boechera sparsiflora	060b0c0006
Boechera stricta	0002c40106
Boechera subpinnatifida	0029000000
Boechera suffrutescens	040bc00104
Boechera tiehmii	0000800000
Boechera tularensis	0000000100
Boechera ultraalsa	0008000000
Boechera xylopoda	e042040006
Boechera yorkii	4000000000
Boehmeria cylindrica	0000000200
Boerhavia coccinea	80c0006000
Boerhavia coulteri	d800000000
Boerhavia coulteri var. palmeri	d800000000
Boerhavia diffusa	0000000200
Boerhavia triquetra	c040000000
Boerhavia triquetra var. intermedia	c040000000
Boerhavia wrightii	e000000000
Bolandra californica	0000c00000
Bolboschoenus fluviatilis	0112400204
Bolboschoenus glaucus	0180002a00
Bolboschoenus maritimus	f9ff077e07
Bolboschoenus maritimus subsp. paludosus	f9ff077e07
Bolboschoenus maritimus var. paludosus	f9ff077e07
Bolboschoenus robustus	0180002a00
Borago officinalis	0180000800
Bothriochloa barbinodis	d0c0005001
Bothriochloa ischaemum	0200000000
Bothriochloa laguroides	0000120200
Bothriochloa laguroides subsp. torreyana	0000120200
Botrychium ascendens	0400840002
Botrychium crenulatum	0408c41506
Botrychium lineare	0000800100
Botrychium lunaria	0000800004
Botrychium minganense	0400c00104
Botrychium montanum	0400400104
Botrychium paradoxum	0000800000
Botrychium pinnatum	0401800000
Botrychium pumicola	0400000000
Botrychium simplex	0408c40507
Botrychium simplex subsp. simplex	0400c40507
Botrychium simplex var. compositum	0408c00104
Botrychium simplex var. simplex	0400c40507
Botrychium tunux	0000800000
Botrychium yaaxudakeit	0000800000
Botrypus virginianus	0601000000
Bouteloua aristidoides	e040000000
Bouteloua aristidoides var. aristidoides	e040000000
Bouteloua barbata	e0c0002000
Bouteloua barbata var. barbata	e0c0002000
Bouteloua curtipendula	c040000200
Bouteloua eriopoda	4000000000
Bouteloua gracilis	4000000400
Bouteloua trifida	6000000000
Bowlesia incana	79d0337c01
Boykinia major	0021c00000
Boykinia occidentalis	0335420801
Boykinia rotundifolia	0040025401
Brachypodium distachyon	93f8fbeb00
Brachypodium pinnatum	0004000800
Brachypodium sylvaticum	0000000800
Brandegea bigelovii	e000000000
Brasenia schreberi	043ac00300
Brassica fruticulosa	0080000000
Brassica juncea	0000002200
Brassica napus	0080002000
Brassica nigra	1ffdfbff01
Brassica oleracea	0104000000
Brassica rapa	1ffdffff03
Brassica tournefortii	f8c0005401
Brickellia atractyloides	e000000000
Brickellia atractyloides var. arguta	6000000000
Brickellia atractyloides var. atractyloides	6000000000
Brickellia atractyloides var. odontolepis	e000000000
Brickellia californica	fbfdfbfd01
Brickellia desertorum	e000000000
Brickellia frutescens	8000000000
Brickellia grandiflora	0409d00100
Brickellia greenei	041d400000
Brickellia incana	e000000000
Brickellia knappiana	c000000000
Brickellia longifolia	6000200002
Brickellia longifolia var. longifolia	6000200000
Brickellia longifolia var. multiflora	6000000002
Brickellia microphylla	6000e41106
Brickellia microphylla subsp. microphylla	6000e41106
Brickellia microphylla subsp. scabra	6000000000
Brickellia microphylla var. microphylla	6000e41106
Brickellia microphylla var. scabra	6000000000
Brickellia nevinii	6000011001
Brickellia oblongifolia	e000044002
Brickellia oblongifolia var. linifolia	e000044002
Briza maxima	01a40a0000
Briza minor	81241a2a00
Brodiaea appendiculata	0020182a00
Brodiaea californica	0200000200
Brodiaea coronaria	0200080200
Brodiaea elegans	0279f96f00
Brodiaea elegans subsp. elegans	0279f96f00
Brodiaea elegans var. elegans	0279f96f00
Brodiaea filifolia	00c0000400
Brodiaea insignis	0000200000
Brodiaea jolonensis	0000020000
Brodiaea kinkiensis	1000000000
Brodiaea leptandra	0010000000
Brodiaea minor	0200480200
Brodiaea nana	0200182200
Brodiaea orcuttii	0040000000
Brodiaea pallida	0000180000
Brodiaea rosea	0010000000
Brodiaea santarosae	0040000000
Brodiaea sierrae	0000080000
Brodiaea stellaris	0024000000
Brodiaea terrestris	016423de01
Brodiaea terrestris subsp. kernensis	004020d401
Brodiaea terrestris subsp. terrestris	0124030a00
Bromus arenarius	fffdfbff01
Bromus arizonicus	f8a0032a00
Bromus arvensis	0000000100
Bromus berteroanus	fbd0fffd03
Bromus briziformis	0603480004
Bromus carinatus	ffffffff07
Bromus carinatus var. carinatus	7fffffdf07
Bromus carinatus var. marginatus	ffffffff07
Bromus caroli-henrici	0000000200
Bromus catharticus	ffffffff07
Bromus catharticus var. catharticus	ffffffff07
Bromus catharticus var. elatus	093c182a00
Bromus ciliatus	0400c00502
Bromus commutatus	073fcc0b06
Bromus diandrus	ffffffff07
Bromus grandis	0140bb5d01
Bromus hallii	0000231501
Bromus hordeaceus	ffffffff07
Bromus inermis	04d7c65506
Bromus japonicus	ffffffff07
Bromus laevipes	1ffdfbcb01
Bromus madritensis	ffffffff07
Bromus madritensis subsp. madritensis	fffdfbff01
Bromus madritensis subsp. rubens	ffffffff07
Bromus maritimus	1984000800
Bromus orcuttianus	067ffad505
Bromus polyanthus	0000800000
Bromus porteri	0010250502
Bromus pseudolaevipes	1cd0025c01
Bromus racemosus	0133382e04
Bromus richardsonii	6040820500
Bromus secalinus	063fd80c04
Bromus sitchensis	18c0005401
Bromus squarrosus	0002000004
Bromus sterilis	12fd7a2a01
Bromus suksdorfii	060bc20104
Bromus tectorum	ffffffff07
Bromus vulgaris	073dda0800
Buddleja davidii	0001000800
Buddleja saligna	0000001001
Buddleja utahensis	6000000000
Bulbine semibarbata	0100000000
Bulbostylis capillaris	0400c80100
Bursera microphylla	8000000000
Cabomba caroliniana	0000002000
Cacaliopsis nardosmia	0439000000
Caesalpinia gilliesii	60c0005000
Caesalpinia spinosa	1080000000
Cakile edentula	0184000000
Cakile maritima	1984000000
Calamagrostis bolanderi	0004000000
Calamagrostis breweri	0001400000
Calamagrostis canadensis	0401c00100
Calamagrostis canadensis subsp. canadensis	0401c00100
Calamagrostis canadensis var. canadensis	0401c00100
Calamagrostis canadensis var. langsdorffii	0401c00100
Calamagrostis foliosa	0025000000
Calamagrostis koelerioides	017d034800
Calamagrostis muiriana	0000800100
Calamagrostis nutkaensis	0104000800
Calamagrostis ophitidis	0120000800
Calamagrostis purpurascens	0400fc8102
Calamagrostis rubescens	0924030800
Calamagrostis stricta	073dc00102
Calamagrostis stricta subsp. inexpansa	073dc00000
Calamagrostis stricta subsp. stricta	0000c00102
Calamagrostis stricta var. stricta	0000c00102
Calandrinia breweri	00b8120801
Calandrinia ciliata	5fffffff07
Calendula arvensis	0180120800
Calendula officinalis	0180020c00
Calia secundiflora	0080000000
California macrophylla	19d0236a01
Calliandra eriophylla	8000000000
Callitriche fassettii	0212902e00
Callitriche heterophylla	1ffffbff05
Callitriche heterophylla subsp. bolanderi	1ffffbff05
Callitriche heterophylla subsp. heterophylla	19fd037e01
Callitriche heterophylla var. bolanderi	1ffffbff05
Callitriche heterophylla var. heterophylla	19fd037e01
Callitriche longipedunculata	0250002a00
Callitriche marginata	1ffdfbff01
Callitriche palustris	1fffffff07
Callitriche stagnalis	003c080000
Callitriche trochlearis	013d030800
Callitropsis nootkatensis	0001000000
Calocedrus decurrens	067bfbd505
Calochortus albus	09401b4c01
Calochortus amabilis	0031000800
Calochortus amoenus	0000300100
Calochortus argillosus	0100030800
Calochortus bruneaunis	0002440006
Calochortus catalinae	1980000000
Calochortus clavatus	01000b3801
Calochortus clavatus subsp. clavatus	0000031001
Calochortus clavatus subsp. pallidus	0000012801
Calochortus clavatus subsp. recurvifolius	0100000000
Calochortus clavatus var. avius	0000080000
Calochortus clavatus var. clavatus	0000031001
Calochortus clavatus var. gracilis	0000001001
Calochortus clavatus var. pallidus	0000012801
Calochortus clavatus var. recurvifolius	0100000000
Calochortus coeruleus	063dc00100
Calochortus concolor	0040004400
Calochortus dunnii	0040000000
Calochortus elegans	0011000000
Calochortus excavatus	0000040002
Calochortus fimbriatus	0000020001
Calochortus flexuosus	e000000000
Calochortus greenei	0603000004
Calochortus invenustus	78c083dd01
Calochortus kennedyi	6000001403
Calochortus kennedyi var. kennedyi	6000001403
Calochortus kennedyi var. munzii	4000000000
Calochortus leichtlinii	0402c00104
Calochortus longebarbatus	0402000004
Calochortus longebarbatus var. longebarbatus	0402000004
Calochortus luteus	0d3d3b0a00
Calochortus macrocarpus	0602040006
Calochortus minimus	0000c00100
Calochortus monanthus	0001000000
Calochortus monophyllus	0200580000
Calochortus nudus	0401000000
Calochortus obispoensis	0000020000
Calochortus palmeri	010003dc01
Calochortus palmeri var. munzii	0000004000
Calochortus palmeri var. palmeri	010003dc01
Calochortus panamintensis	4000000000
Calochortus persistens	0001000000
Calochortus plummerae	00c0004000
Calochortus pulchellus	0000000800
Calochortus raichei	0020000000
Calochortus simulans	0000020000
Calochortus splendens	19d0035c01
Calochortus striatus	6000000000
Calochortus superbus	1bfd3b5d01
Calochortus syntrophus	0600000000
Calochortus tiburonensis	0100000000
Calochortus tolmiei	053d000a00
Calochortus umbellatus	0020000800
Calochortus uniflorus	013d000800
Calochortus venustus	01003b1901
Calochortus vestae	0039000000
Calochortus weedii	00c0024001
Calochortus weedii var. intermedius	00c0000000
Calochortus weedii var. weedii	00c0024001
Calochortus westonii	0000000100
Caltha leptosepala	0603c00104
Caltha palustris	013c000000
Calycadenia fremontii	063d080200
Calycadenia hooveri	0000182000
Calycadenia micrantha	0038020000
Calycadenia mollis	0000b02000
Calycadenia multiglandulosa	0038f9ab00
Calycadenia oppositifolia	0200080000
Calycadenia pauciflora	0010000200
Calycadenia spicata	0000382200
Calycadenia truncata	073dfb2a00
Calycadenia villosa	0000020000
Calycanthus occidentalis	0671b82100
Calycoseris parryi	e0c004d402
Calycoseris wrightii	e000000002
Calypso bulbosa	012d000800
Calypso bulbosa subsp. occidentalis	012d000800
Calypso bulbosa var. occidentalis	012d000800
Calyptridium monandrum	f8c027fd03
Calyptridium monospermum	060bfcdd07
Calyptridium parryi	c000065c03
Calyptridium parryi subsp. nevadense	4000040002
Calyptridium parryi subsp. parryi	0000025401
Calyptridium parryi var. arizonicum	8000000000
Calyptridium parryi var. hesseae	0000000800
Calyptridium parryi var. nevadense	4000040002
Calyptridium parryi var. parryi	0000025401
Calyptridium pulchellum	0000900000
Calyptridium pygmaeum	0000000500
Calyptridium quadripetalum	0018000000
Calyptridium roseum	0000c40102
Calyptridium umbellatum	060bfc8106
Calystegia atriplicifolia	0401000800
Calystegia atriplicifolia subsp. buttensis	0401000800
Calystegia collina	0038030800
Calystegia collina subsp. collina	0038020800
Calystegia collina subsp. oxyphylla	0038000000
Calystegia collina subsp. tridactylosa	0030000000
Calystegia collina subsp. venusta	0000030000
Calystegia longipes	fffdfbff01
Calystegia macrostegia	19c0031401
Calystegia macrostegia subsp. amplissima	1000000000
Calystegia macrostegia subsp. arida	0040001400
Calystegia macrostegia subsp. cyclostegia	0180000000
Calystegia macrostegia subsp. intermedia	10c0001001
Calystegia macrostegia subsp. macrostegia	0800000000
Calystegia macrostegia subsp. tenuifolia	00c0030000
Calystegia malacophylla	0600fb8901
Calystegia malacophylla subsp. malacophylla	0600f88100
Calystegia malacophylla subsp. pedicellata	0000030801
Calystegia malacophylla var. malacophylla	0600f88100
Calystegia occidentalis	047bf85d05
Calystegia occidentalis subsp. fulcrata	0040385401
Calystegia occidentalis subsp. occidentalis	043bc00904
Calystegia occidentalis var. occidentalis	043bc00904
Calystegia peirsonii	2000001000
Calystegia purpurata	01a4020a01
Calystegia purpurata subsp. purpurata	01a4020a01
Calystegia purpurata subsp. saxicola	0104000800
Calystegia sepium	6080033e01
Calystegia sepium subsp. binghamiae	0080000000
Calystegia sepium subsp. limnophila	6000033e01
Calystegia silvatica	0104000000
Calystegia silvatica subsp. disjuncta	0104000000
Calystegia soldanella	0184000000
Calystegia stebbinsii	0000080000
Calystegia subacaulis	0038020800
Calystegia subacaulis subsp. episcopalis	0000020000
Calystegia subacaulis subsp. subacaulis	0038000800
Camassia leichtlinii	063dc00000
Camassia leichtlinii subsp. suksdorfii	063dc00000
Camassia leichtlinii var. suksdorfii	063dc00000
Camassia quamash	063d400000
Camassia quamash subsp. breviflora	063d400000
Camassia quamash var. breviflora	063d400000
Camelina microcarpa	1ffffbff05
Camissonia benitensis	0000010000
Camissonia campestris	79c03b7e01
Camissonia campestris subsp. campestris	79c03b7e01
Camissonia campestris subsp. obispoensis	0000020000
Camissonia contorta	073f3b2a04
Camissonia integrifolia	0000200000
Camissonia kernensis	6000040102
Camissonia kernensis subsp. gilmanii	6000040102
Camissonia kernensis subsp. kernensis	6000000100
Camissonia kernensis var. gilmanii	6000040102
Camissonia kernensis var. kernensis	6000000100
Camissonia lacustris	0010380000
Camissonia parvula	0002040006
Camissonia pubens	2002040006
Camissonia pusilla	6002040406
Camissonia sierrae	0000900000
Camissonia sierrae subsp. alticola	0000800000
Camissonia sierrae subsp. sierrae	0000900000
Camissonia strigulosa	69c003dd01
Camissoniopsis bistorta	18c0005401
Camissoniopsis cheiranthifolia	1984000000
Camissoniopsis cheiranthifolia subsp. cheiranthifolia	1904000000
Camissoniopsis cheiranthifolia subsp. suffruticosa	0080000000
Camissoniopsis confusa	18c0005401
Camissoniopsis guadalupensis	1000000000
Camissoniopsis guadalupensis subsp. clementina	1000000000
Camissoniopsis hardhamiae	0000020000
Camissoniopsis hirtella	19fdfbdd01
Camissoniopsis ignota	19c0137e01
Camissoniopsis intermedia	19fd035c01
Camissoniopsis lewisii	00c0000000
Camissoniopsis luciae	0000020000
Camissoniopsis micrantha	19c0037e01
Camissoniopsis pallida	e000002400
Camissoniopsis pallida subsp. hallii	e000000400
Camissoniopsis pallida subsp. pallida	e000002400
Camissoniopsis robusta	1840004000
Campanula angustiflora	0010020800
Campanula californica	0104000000
Campanula exigua	0000010800
Campanula griffinii	0010030800
Campanula rotundifolia	0401000000
Campanula scabrella	0401000004
Campanula scouleri	0421400000
Campanula sharsmithiae	0000000800
Campanula shetleri	0001000000
Campanula wilkinsiana	0401000000
Campsis radicans	1ffdfbff01
Canbya candida	6000f88100
Cannabis sativa	1ffdfbff01
Capsella bursa-pastoris	ffffffff07
Cardamine angulata	003d000000
Cardamine bellidifolia	0400000000
Cardamine breweri	043dc40507
Cardamine californica	1ffdfbff01
Cardamine cordifolia	0601400000
Cardamine hirsuta	0101000000
Cardamine nuttallii	003dc00000
Cardamine occidentalis	003d000000
Cardamine oligosperma	1ffdfbff03
Cardamine pachystigma	0638ca0100
Cardamine pensylvanica	0600080000
Cardionema ramosissimum	09c4004000
Carduus acanthoides	01124a0004
Carduus acanthoides subsp. acanthoides	01124a0004
Carduus nutans	6683400404
Carduus pycnocephalus	03f83b5e01
Carduus pycnocephalus subsp. pycnocephalus	03f83b5e01
Carduus tenuiflorus	19fc3b5c01
Carex abrupta	4449c05507
Carex albonigra	0000800102
Carex alma	40c0827501
Carex amplifolia	053bc00904
Carex angustata	042bc00104
Carex aquatilis	053dc00506
Carex aquatilis subsp. aquatilis	0439c00506
Carex aquatilis var. aquatilis	0439c00506
Carex aquatilis var. dives	0525000000
Carex arcta	0024000000
Carex atherodes	0402000000
Carex athrostachya	047bc45506
Carex aurea	441ac41507
Carex barbarae	0bb9bb2a01
Carex bolanderi	1dfdc05d01
Carex brainerdii	0421c20000
Carex brevicaulis	0104000000
Carex breweri	0400c00102
Carex buxbaumii	013c800100
Carex californica	0024000000
Carex canescens	0420c00000
Carex canescens subsp. canescens	0420c00000
Carex canescens var. canescens	0420c00000
Carex capitata	0400c00102
Carex comosa	0512002e04
Carex concinnoides	0039000000
Carex congdonii	0000800100
Carex cusickii	0105c00000
Carex davyi	0000c00000
Carex deflexa	443fc01506
Carex deflexa var. boottii	443fc01506
Carex densa	07fdf8fb00
Carex diandra	0402c00004
Carex disperma	0400c00102
Carex divulsa	0100000200
Carex divulsa subsp. divulsa	0100000200
Carex douglasii	4043c77507
Carex duriuscula	0000000002
Carex echinata	0525c00500
Carex echinata subsp. echinata	0421c00500
Carex echinata subsp. phyllomanica	0104000000
Carex echinata var. echinata	0421c00500
Carex exsiccata	0105400000
Carex feta	067bc84d04
Carex filifolia	0000c00506
Carex filifolia var. erostrata	0000c00506
Carex filifolia var. filifolia	0000800000
Carex fissuricola	0000c00100
Carex fracta	0449fad501
Carex geyeri	0601480000
Carex globosa	19e4035c01
Carex gracilior	05204a0a00
Carex gynodynama	0125020800
Carex halliana	0401000000
Carex harfordii	1920030800
Carex hassei	454dc45d03
Carex haydeniana	4000800106
Carex helleri	0400c40102
Carex hendersonii	0124000800
Carex heteroneura	0401c45506
Carex hirtissima	0038d80000
Carex hoodii	0439c00506
Carex hystericina	0001000000
Carex idahoa	0000000002
Carex illota	0400c00504
Carex incurviformis	0000800102
Carex infirminervia	0400400100
Carex inops	0400000000
Carex inops subsp. inops	0400000000
Carex integra	0401c00504
Carex interior	0401000000
Carex inversa	0040004200
Carex jonesii	0439c01504
Carex klamathensis	0011000000
Carex laeviculmis	0021c00004
Carex lasiocarpa	0400400000
Carex leavenworthii	0080000000
Carex lemmonii	0431c04500
Carex lenticularis	053dc00904
Carex lenticularis var. impressa	0439c00104
Carex lenticularis var. limnophila	0004000000
Carex lenticularis var. lipocarpa	0539c00900
Carex leporina	0020000800
Carex leporinella	0001c40102
Carex leptalea	0124000000
Carex leptopoda	1dfdc05d01
Carex limosa	0000c00100
Carex livida	0004000000
Carex longii	0210000000
Carex luzulifolia	0401c00000
Carex luzulina	053dc00904
Carex lyngbyei	0104000000
Carex mariposana	0428c00500
Carex mendocinensis	0125420800
Carex mertensii	0001000000
Carex microptera	040bc40506
Carex multicaulis	047bc35505
Carex multicostata	0400c04500
Carex nebrascensis	4403c46307
Carex nervina	0439c02100
Carex neurophora	0009000000
Carex nigricans	0401c00100
Carex nudata	0125c30b01
Carex obispoensis	0040024000
Carex obnupta	0125000800
Carex occidentalis	0000005402
Carex pachycarpa	0409c00100
Carex pachystachya	0709400204
Carex pansa	0984000000
Carex pellita	6507c41d06
Carex pendula	0000000a00
Carex petasata	0402400004
Carex phaeocephala	0400c45506
Carex praeceptorum	0400800100
Carex praegracilis	5ffdfbff03
Carex praticola	002c800000
Carex preslii	0439c00100
Carex proposita	0000800100
Carex raynoldsii	0401c00104
Carex rossii	443fc01506
Carex saliniformis	0004000800
Carex sartwelliana	0040804100
Carex scabriuscula	0001400000
Carex schottii	00e0005c01
Carex scirpoidea	0000c00102
Carex scirpoidea subsp. pseudoscirpoidea	0000c00102
Carex scirpoidea var. pseudoscirpoidea	0000c00102
Carex scoparia	0000400000
Carex scoparia var. scoparia	0000400000
Carex scopulorum	0429c40106
Carex scopulorum var. bracteosa	0429c40106
Carex senta	19d0fbdf01
Carex serpenticola	0001000000
Carex serratodens	0439fb8900
Carex sheldonii	0002400004
Carex simulata	0503c40906
Carex specifica	0400c00100
Carex spectabilis	0401c00100
Carex spissa	01c0004000
Carex stevenii	0000000002
Carex stipata	003dc00800
Carex stipata var. stipata	003dc00800
Carex straminiformis	0409c40106
Carex subbracteata	09a4030801
Carex subfusca	4449ca5507
Carex subnigricans	0000c40102
Carex tahoensis	0000800100
Carex texensis	0080000200
Carex tiogana	0000800000
Carex tompkinsii	0000b00100
Carex triquetra	11c0005401
Carex tumulicola	193cf88b00
Carex unilateralis	0024000000
Carex utriculata	0539c40d02
Carex vallicola	0002c40002
Carex vernacula	0400c40106
Carex vesicaria	053fc00904
Carex viridula	0005800000
Carex viridula subsp. viridula	0005800000
Carex viridula var. viridula	0005800000
Carex vulpinoidea	0701082200
Carex whitneyi	0401c00004
Carlowrightia arizonica	8000000000
Carlquistia muirii	0000020100
Carnegiea gigantea	8000000000
Carpenteria californica	0000300000
Carpobrotus chilensis	0984000000
Carpobrotus edulis	1984000000
Carrichtera annua	0100000000
Carsonia sparsifolia	6000040002
Carthamus creticus	78f8107e01
Carthamus lanatus	0124122800
Carthamus leucocaulos	0038000000
Carthamus tinctorius	81b8006a00
Carya illinoinensis	0080002000
Cascadia nuttallii	0001000000
Cassiope mertensiana	0401c00100
Castela emoryi	a000000000
Castilleja affinis	1bf43b5c01
Castilleja affinis subsp. affinis	1bf43b5c01
Castilleja affinis subsp. litoralis	0004000000
Castilleja affinis subsp. neglecta	0010000800
Castilleja affinis var. affinis	1bf43b5c01
Castilleja ambigua	013c000000
Castilleja ambigua subsp. ambigua	013c000000
Castilleja ambigua subsp. humboldtiensis	0104000000
Castilleja ambigua subsp. insalutata	0100000000
Castilleja applegatei	46fbfddd07
Castilleja applegatei subsp. disticha	0000800100
Castilleja applegatei subsp. martinii	40f1055c03
Castilleja applegatei subsp. pallida	0002c40106
Castilleja applegatei subsp. pinetorum	460bfc8106
Castilleja applegatei var. pallida	0002c40106
Castilleja applegatei var. pinetorum	460bfc8106
Castilleja arachnoidea	040b400004
Castilleja attenuata	1ffdfbff01
Castilleja brevilobata	0001000000
Castilleja brevistyla	0000212000
Castilleja campestris	0612682204
Castilleja campestris subsp. campestris	0612482204
Castilleja campestris subsp. succulenta	0000202200
Castilleja chromosa	6402040506
Castilleja cinerea	0000000400
Castilleja densiflora	19f83b5c01
Castilleja densiflora subsp. densiflora	00383b0800
Castilleja densiflora subsp. gracilis	18c0035401
Castilleja densiflora subsp. obispoensis	0100000000
Castilleja exserta	79fd3b7e01
Castilleja exserta subsp. exserta	79fd3b7e01
Castilleja exserta subsp. latifolia	0104000000
Castilleja exserta subsp. venusta	6000000000
Castilleja exserta var. exserta	79fd3b7e01
Castilleja foliolosa	39f83b5c01
Castilleja gleasoni	0000001000
Castilleja grisea	1000000000
Castilleja hololeuca	0800000000
Castilleja lacera	0633f88104
Castilleja lasiorhyncha	0040000400
Castilleja latifolia	0100000000
Castilleja lemmonii	0400c00100
Castilleja linariifolia	4602c41507
Castilleja lineariloba	0000b80000
Castilleja mendocinensis	0004000000
Castilleja miniata	1fffc65507
Castilleja miniata subsp. elata	0001000000
Castilleja miniata subsp. miniata	1fffc65507
Castilleja miniata var. miniata	1fffc65507
Castilleja minor	01ba342806
Castilleja minor subsp. minor	0002040006
Castilleja minor subsp. spiralis	01b8302800
Castilleja minor var. minor	0002040006
Castilleja mollis	0800000000
Castilleja montigena	0000000400
Castilleja nana	0000c00102
Castilleja peirsonii	0400c00100
Castilleja pilosa	0402c40106
Castilleja plagiotoma	6000219501
Castilleja praeterita	0000000100
Castilleja pruinosa	063fd80004
Castilleja rubicundula	0338000a00
Castilleja rubicundula subsp. lithospermoides	0338000800
Castilleja rubicundula subsp. rubicundula	0010000a00
Castilleja schizotricha	0001000000
Castilleja subinclusa	0144399801
Castilleja subinclusa subsp. franciscana	0104000800
Castilleja subinclusa subsp. subinclusa	0040399001
Castilleja tenuis	067bc44504
Castilleja wightii	0104000800
Catalpa bignonioides	0080082000
Catalpa speciosa	0040084000
Catharanthus roseus	e080000000
Caulanthus amplexicaulis	0000021401
Caulanthus anceps	0000232001
Caulanthus californicus	ffffffff07
Caulanthus cooperi	e040041403
Caulanthus coulteri	200023a801
Caulanthus crassicaulis	4000000002
Caulanthus flavescens	0010010a00
Caulanthus glaucus	4000000002
Caulanthus hallii	c040000000
Caulanthus heterophyllus	18c0021401
Caulanthus inflatus	6000212001
Caulanthus lasiophyllus	fffdffff03
Caulanthus lemmonii	0000032800
Caulanthus major	4002401404
Caulanthus pilosus	4002840106
Caulanthus simulans	80c0000000
Ceanothus arboreus	1800000000
Ceanothus arcuatus	0039c00000
Ceanothus confusus	0038000000
Ceanothus cordulatus	403bc05505
Ceanothus crassifolius	0040025401
Ceanothus crassifolius var. crassifolius	0040005401
Ceanothus crassifolius var. planus	0000020001
Ceanothus cuneatus	07fffbff05
Ceanothus cuneatus subsp. cuneatus	07fffbff05
Ceanothus cuneatus subsp. fascicularis	0100000000
Ceanothus cuneatus var. cuneatus	07fffbff05
Ceanothus cuneatus var. fascicularis	0100000000
Ceanothus cuneatus var. ramulosus	0100021c01
Ceanothus cyaneus	0040000000
Ceanothus dentatus	0100020800
Ceanothus divergens	0038000000
Ceanothus diversifolius	0409c00100
Ceanothus ferrisiae	0000000800
Ceanothus foliosus	0078034800
Ceanothus foliosus subsp. foliosus	0078024800
Ceanothus foliosus subsp. medius	0000030800
Ceanothus foliosus subsp. vineatus	0038000000
Ceanothus foliosus var. foliosus	0078024800
Ceanothus foliosus var. medius	0000030800
Ceanothus foliosus var. vineatus	0038000000
Ceanothus fresnensis	0000d80000
Ceanothus gloriosus	0124000800
Ceanothus gloriosus subsp. exaltatus	0024000800
Ceanothus gloriosus subsp. gloriosus	0104000000
Ceanothus gloriosus subsp. porrectus	0100000000
Ceanothus gloriosus var. exaltatus	0024000800
Ceanothus gloriosus var. gloriosus	0104000000
Ceanothus gloriosus var. porrectus	0100000000
Ceanothus hearstiorum	0100000000
Ceanothus impressus	0100000000
Ceanothus impressus var. impressus	0100000000
Ceanothus impressus var. nipomensis	0100000000
Ceanothus incanus	013d000800
Ceanothus integerrimus	067bfbdd05
Ceanothus integerrimus var. integerrimus	0000000800
Ceanothus integerrimus var. macrothyrsus	067bfbdd05
Ceanothus jepsonii	0039000800
Ceanothus lemmonii	0211d80000
Ceanothus leucodermis	00403b5c01
Ceanothus maritimus	0100000000
Ceanothus masonii	0000000800
Ceanothus megacarpus	18c0001001
Ceanothus megacarpus subsp. insularis	1800000000
Ceanothus megacarpus subsp. megacarpus	10c0001001
Ceanothus megacarpus var. insularis	1800000000
Ceanothus megacarpus var. megacarpus	10c0001001
Ceanothus oliganthus	0178035c01
Ceanothus oliganthus subsp. oliganthus	0060025c01
Ceanothus oliganthus subsp. sorediatus	0178035c01
Ceanothus oliganthus var. oliganthus	0060025c01
Ceanothus oliganthus var. orcuttii	0040004000
Ceanothus oliganthus var. sorediatus	0178035c01
Ceanothus ophiochilus	0040000000
Ceanothus otayensis	0040000000
Ceanothus palmeri	00401b5401
Ceanothus papillosus	0040030801
Ceanothus parryi	003c000000
Ceanothus parvifolius	0000c00100
Ceanothus perplexans	0040005401
Ceanothus pinetorum	0001000100
Ceanothus prostratus	043bc00004
Ceanothus prostratus subsp. prostratus	043bc00004
Ceanothus prostratus var. occidentalis	0038000000
Ceanothus prostratus var. prostratus	043bc00004
Ceanothus pumilus	0039000000
Ceanothus purpureus	0010000000
Ceanothus rigidus	0100000000
Ceanothus roderickii	0000080000
Ceanothus sanguineus	0001000000
Ceanothus sonomensis	0020000000
Ceanothus spinosus	0040024001
Ceanothus thyrsiflorus	0135020800
Ceanothus thyrsiflorus var. griseus	0124000800
Ceanothus thyrsiflorus var. thyrsiflorus	0135020800
Ceanothus tomentosus	00c0d85400
Ceanothus velutinus	0421c40904
Ceanothus verrucosus	0080000000
Ceanothus vestitus	404004d503
Celtis australis	0080000200
Celtis reticulata	404024c402
Celtis sinensis	0080080200
Cenchrus echinatus	e0c0004200
Cenchrus incertus	e0c0006200
Cenchrus longispinus	e042026204
Centaurea benedicta	79fd3b7f01
Centaurea calcitrapa	1bfd7b7e01
Centaurea cineraria	1980000000
Centaurea cyanus	1ffffbff05
Centaurea diffusa	063fdb0e06
Centaurea diluta	0180030800
Centaurea iberica	01d01b6a00
Centaurea jacea	0625000000
Centaurea jacea nothosubsp. pratensis 	0620000000
Centaurea jacea subsp. jacea	0620000000
Centaurea jacea subsp. nigra	0225000000
Centaurea melitensis	fffdfbff01
Centaurea pouzinii	00b8000000
Centaurea solstitialis	7ffffbff05
Centaurea stoebe	077fffdf05
Centaurea stoebe subsp. micranthos	077fffdf05
Centaurea sulphurea	0000102a00
Centaurea virgata	0603400004
Centaurea virgata subsp. squarrosa	0603400004
Centaurea virgata var. squarrosa	0603400004
Centaurium erythraea	0004000000
Centaurium pulchellum	0000002000
Centaurium tenuiflorum	0337082204
Centranthus ruber	19c4387e01
Centromadia fitchii	0e301b2e00
Centromadia parryi	01b0032a00
Centromadia parryi subsp. australis	0080000000
Centromadia parryi subsp. congdonii	0100030800
Centromadia parryi subsp. parryi	0130000200
Centromadia parryi subsp. rudis	0010002200
Centromadia pungens	3ff2237e05
Centromadia pungens subsp. laevis	00c0004000
Centromadia pungens subsp. pungens	3ff2237e05
Centrostegia thurberi	e000053403
Cephalanthera austiniae	067dc24d00
Cephalanthus occidentalis	0013ba2204
Cerastium arvense	0001d00800
Cerastium arvense subsp. strictum	0001d00800
Cerastium beeringianum	0000c00002
Cerastium dichotomum	0400000000
Cerastium diffusum	0004000000
Cerastium fontanum	04fdd24400
Cerastium fontanum subsp. vulgare	04fdd24400
Cerastium glomeratum	9ffffbfe05
Cerastium viride	0104000800
Ceratophyllum demersum	a5ffff7f05
Cercis occidentalis	067ff8f704
Cercocarpus betuloides	1ffffbdd05
Cercocarpus betuloides subsp. blancheae	1800000001
Cercocarpus betuloides var. betuloides	1ffffbdd05
Cercocarpus betuloides var. blancheae	1800000001
Cercocarpus betuloides var. macrourus	0603000004
Cercocarpus ledifolius	444bc49507
Cercocarpus ledifolius var. intermontanus	444bc49507
Cercocarpus ledifolius var. intricatus	4000040102
Cercocarpus ledifolius var. ledifolius	0000000100
Cercocarpus minutiflorus	0040000000
Cercocarpus traskiae	1000000000
Cestrum elegans	0004000800
Cestrum nocturnum	0080000000
Cestrum parqui	0000000800
Chaenactis alpigena	0000c00102
Chaenactis artemisiifolia	00c0025401
Chaenactis carphoclinia	e040040002
Chaenactis carphoclinia var. carphoclinia	e000040002
Chaenactis carphoclinia var. peirsonii	8040000000
Chaenactis douglasii	441bc40106
Chaenactis douglasii var. alpina	4000400000
Chaenactis douglasii var. douglasii	441bc40106
Chaenactis fremontii	f8c025f401
Chaenactis glabriuscula	bfd9fbff01
Chaenactis glabriuscula var. glabriuscula	b9d0fbff01
Chaenactis glabriuscula var. heterocarpha	06199b0a01
Chaenactis glabriuscula var. lanosa	89c0035c01
Chaenactis glabriuscula var. megacephala	0000232001
Chaenactis glabriuscula var. orcuttiana	0080000000
Chaenactis macrantha	6000041403
Chaenactis nevadensis	0401400000
Chaenactis parishii	0040004000
Chaenactis santolinoides	0000029501
Chaenactis stevioides	e00205b507
Chaenactis suffrutescens	0401000000
Chaenactis xantiana	600227b507
Chaetadelpha wheeleri	2000040002
Chaetopappa ericoides	4000000002
Chamaebatia australis	0040000000
Chamaebatia foliolosa	0600f88100
Chamaebatiaria millefolium	4603fc8106
Chamaecyparis lawsoniana	0001000000
Chamaemelum fuscatum	0020000200
Chamaesaracha coronopus	4000000000
Chamaesaracha nana	0602c40106
Chamaesyce abramsiana	8000000000
Chamaesyce albomarginata	f8c0007401
Chamaesyce arizonica	8000000000
Chamaesyce fendleri	4000000002
Chamaesyce glyptosperma	0200000000
Chamaesyce hooveri	0000002200
Chamaesyce maculata	9ffdfbff01
Chamaesyce melanadenia	98c0005401
Chamaesyce micromera	e000000000
Chamaesyce nutans	99c0037e01
Chamaesyce ocellata	ffbdfbbf01
Chamaesyce ocellata subsp. arenicola	e000000000
Chamaesyce ocellata subsp. ocellata	1fbdfbbf01
Chamaesyce ocellata subsp. rattanii	0000000200
Chamaesyce ocellata var. ocellata	1fbdfbbf01
Chamaesyce parishii	e000000000
Chamaesyce parryi	6000000000
Chamaesyce pediculifera	8000000000
Chamaesyce platysperma	8000000000
Chamaesyce polycarpa	f8c0005401
Chamaesyce prostrata	1ffdfbff01
Chamaesyce revoluta	e040004000
Chamaesyce serpens	18c0037401
Chamaesyce serpyllifolia	ffffffff07
Chamaesyce serpyllifolia subsp. hirtula	18c0905401
Chamaesyce serpyllifolia subsp. serpyllifolia	ffffffff07
Chamaesyce serpyllifolia var. serpyllifolia	ffffffff07
Chamaesyce setiloba	e000000000
Chamaesyce vallis-mortae	6000040002
Chamelaucium uncinatum	0080000000
Chamerion angustifolium	4425c00502
Chamerion angustifolium subsp. circumvagum	4425c00502
Chamerion latifolium	0000c00000
Chasmanthe floribunda	0184000800
Cheilanthes clevelandii	1840004000
Cheilanthes cooperae	0690fa9d01
Cheilanthes covillei	4078ffdf03
Cheilanthes feei	4000001403
Cheilanthes gracillima	073fff8906
Cheilanthes intertexta	002ac30906
Cheilanthes newberryi	18c0005401
Cheilanthes parryi	e040044002
Cheilanthes viscida	c040000400
Cheilanthes wootonii	4000000000
Chenopodium album	ffffffff07
Chenopodium atrovirens	267ffcc506
Chenopodium berlandieri	fffdfbff01
Chenopodium berlandieri subsp. zschackei	1ffdfbff01
Chenopodium berlandieri var. sinuatum	fffdfbff01
Chenopodium berlandieri var. zschackei	1ffdfbff01
Chenopodium californicum	79f437fe03
Chenopodium capitatum	0042804006
Chenopodium capitatum var. capitatum	0040804002
Chenopodium capitatum var. parvicapitatum	0002800006
Chenopodium chenopodioides	0062fcc506
Chenopodium desiccatum	2002fcb507
Chenopodium foliosum	6402800004
Chenopodium fremontii	4042fcd507
Chenopodium glaucum	0602c40506
Chenopodium glaucum subsp. salinum	0602c40506
Chenopodium glaucum var. salinum	0602c40506
Chenopodium hians	067ffdd507
Chenopodium incanum	6002c40106
Chenopodium incanum var. occidentale	6002c40106
Chenopodium leptophyllum	2008b00102
Chenopodium littoreum	0100000000
Chenopodium macrospermum	0184002a00
Chenopodium missouriense	00c0286100
Chenopodium murale	fffdfbff01
Chenopodium nevadense	0000840002
Chenopodium polyspermum	0004040002
Chenopodium polyspermum var. acutifolium	0004040002
Chenopodium pratericola	e600ffab03
Chenopodium rubrum	67b204aa06
Chenopodium rubrum subsp. rubrum	67b204aa06
Chenopodium rubrum var. humile	67b204aa06
Chenopodium rubrum var. rubrum	67b204aa06
Chenopodium simplex	0002480006
Chenopodium strictum	4280faaf00
Chenopodium strictum subsp. glaucophyllum	4280faaf00
Chenopodium strictum var. glaucophyllum	4280faaf00
Chenopodium vulvaria	0300232b01
Chenopodium watsonii	0000001000
Chilopsis linearis	e040005401
Chilopsis linearis subsp. arcuata	e040005401
Chilopsis linearis var. arcuata	e040005401
Chimaphila menziesii	0479c25500
Chimaphila umbellata	0038f8c500
Chloracantha spinosa	80c0004000
Chloracantha spinosa var. spinosa	80c0004000
Chloris gayana	0080002200
Chloris truncata	6040006200
Chloris verticillata	0000080800
Chloris virgata	e0c0026200
Chlorogalum angustifolium	02b0380200
Chlorogalum grandiflorum	0000180000
Chlorogalum parviflorum	0080000000
Chlorogalum pomeridianum	19fd7b7e01
Chlorogalum pomeridianum var. divaricatum	0104000000
Chlorogalum pomeridianum var. minus	0010020800
Chlorogalum pomeridianum var. pomeridianum	19fd7b7e01
Chlorogalum purpureum	0000020000
Chlorogalum purpureum var. purpureum	0000020000
Chlorogalum purpureum var. reductum	0000020000
Chloropyron maritimum	2186040006
Chloropyron maritimum subsp. canescens	2002040006
Chloropyron maritimum subsp. maritimum	0180000000
Chloropyron maritimum subsp. palustre	0104000000
Chloropyron molle	0100002200
Chloropyron molle subsp. hispidum	0000002200
Chloropyron molle subsp. molle	0100002200
Chloropyron palmatum	0000002200
Chloropyron tecopense	2000040002
Chondrilla juncea	0484022a00
Chorispora tenella	0682042206
Chorizanthe angustifolia	0100000000
Chorizanthe biloba	0000030000
Chorizanthe biloba var. biloba	0000030000
Chorizanthe biloba var. immemora	0000010000
Chorizanthe blakleyi	0000020000
Chorizanthe brevicornu	e000040002
Chorizanthe brevicornu subsp. brevicornu	e000040002
Chorizanthe brevicornu subsp. spathulata	0000040002
Chorizanthe brevicornu var. brevicornu	e000040002
Chorizanthe brevicornu var. spathulata	0000040002
Chorizanthe breweri	0000020000
Chorizanthe clevelandii	013d238901
Chorizanthe corrugata	e000000000
Chorizanthe cuspidata	0100000800
Chorizanthe cuspidata var. cuspidata	0100000800
Chorizanthe cuspidata var. villosa	0100000000
Chorizanthe diffusa	0100020800
Chorizanthe douglasii	0000030000
Chorizanthe fimbriata	0040000000
Chorizanthe fimbriata var. fimbriata	0040000000
Chorizanthe fimbriata var. laciniata	0040000000
Chorizanthe howellii	0004000000
Chorizanthe leptotheca	0040000000
Chorizanthe membranacea	073d3baa01
Chorizanthe obovata	0000020000
Chorizanthe orcuttiana	0080000000
Chorizanthe palmeri	0000020000
Chorizanthe parryi	8080001401
Chorizanthe parryi var. fernandina	0000000001
Chorizanthe parryi var. parryi	8080001401
Chorizanthe polygonoides	077d0b4a00
Chorizanthe polygonoides subsp. longispina	0040004000
Chorizanthe polygonoides subsp. polygonoides	073d0b0a00
Chorizanthe polygonoides var. longispina	0040004000
Chorizanthe polygonoides var. polygonoides	073d0b0a00
Chorizanthe procumbens	00c0001401
Chorizanthe pungens	0100000800
Chorizanthe pungens var. hartwegiana	0100000000
Chorizanthe pungens var. pungens	0100000800
Chorizanthe rectispina	0000020000
Chorizanthe rigida	e000040002
Chorizanthe robusta	0100000800
Chorizanthe robusta var. hartwegii	0000000800
Chorizanthe robusta var. robusta	0100000800
Chorizanthe spinosa	6000000000
Chorizanthe staticoides	19c0025401
Chorizanthe stellulata	0210380800
Chorizanthe uniaristata	0100230901
Chorizanthe valida	0100000000
Chorizanthe ventricosa	0000010000
Chorizanthe watsonii	6002043407
Chorizanthe wheeleri	0800000000
Chorizanthe xanti	000025d503
Chorizanthe xanti subsp. leucotheca	0000004400
Chorizanthe xanti subsp. xanti	0000259503
Chorizanthe xanti var. leucotheca	0000004400
Chorizanthe xanti var. xanti	0000259503
Chrysanthemoides monilifera	0080000000
Chrysanthemoides monilifera subsp. monilifera	0080000000
Chrysolepis chrysophylla	073d420800
Chrysolepis chrysophylla var. chrysophylla	073d400800
Chrysolepis chrysophylla var. minor	013d020800
Chrysolepis sempervirens	044bc05504
Chrysosplenium glechomifolium	0004000000
Chrysothamnus depressus	4000000000
Chrysothamnus greenei	4000040002
Chrysothamnus humilis	0002400004
Chrysothamnus viscidiflorus	4603fc8507
Chrysothamnus viscidiflorus subsp. axillaris	4000000002
Chrysothamnus viscidiflorus subsp. lanceolatus	0002800004
Chrysothamnus viscidiflorus subsp. puberulus	4002fc8506
Chrysothamnus viscidiflorus subsp. viscidiflorus	4603fc8507
Chrysothamnus viscidiflorus var. lanceolatus	0002800004
Chrysothamnus viscidiflorus var. puberulus	4002fc8506
Chrysothamnus viscidiflorus var. viscidiflorus	4603fc8507
Chylismia arenaria	8000000000
Chylismia brevipes	e000000000
Chylismia brevipes subsp. arizonica	8000000000
Chylismia brevipes subsp. brevipes	e000000000
Chylismia brevipes subsp. pallidula	e000000000
Chylismia cardiophylla	e000000000
Chylismia cardiophylla subsp. cardiophylla	e000000000
Chylismia cardiophylla subsp. robusta	2000000000
Chylismia claviformis	e042044006
Chylismia claviformis subsp. aurantiaca	e000000000
Chylismia claviformis subsp. claviformis	6000000000
Chylismia claviformis subsp. cruciformis	0002000004
Chylismia claviformis subsp. funerea	2000000000
Chylismia claviformis subsp. integrior	0000040002
Chylismia claviformis subsp. lancifolia	4000040002
Chylismia claviformis subsp. peirsonii	8040004000
Chylismia claviformis subsp. yumae	8000000000
Chylismia heterochroma	4000040002
Chylismia munzii	6000000000
Chylismia walkeri	2000000002
Chylismia walkeri subsp. tortilis	2000000002
Chylismiella pterosperma	4000000002
Cicendia quadrangularis	0324182200
Cichorium intybus	5ffdfbff01
Cicuta douglasii	059ee40106
Cicuta maculata	01c3044606
Cicuta maculata var. angustifolia	0043044406
Cicuta maculata var. bolanderi	0180000200
Cinna bolanderi	0000800100
Cinna latifolia	0439c00000
Cinnamomum camphora	00c0002000
Circaea alpina	063dc80d04
Circaea alpina subsp. pacifica	063dc80d04
Circaea alpina var. pacifica	063dc80d04
Cirsium andersonii	0603f88104
Cirsium andrewsii	0104000000
Cirsium arizonicum	4000000102
Cirsium arizonicum var. arizonicum	0000000102
Cirsium arizonicum var. tenuisectum	4000000000
Cirsium arvense	06bffd8906
Cirsium brevistylum	09bd030800
Cirsium canescens	0002000004
Cirsium ciliolatum	0001000000
Cirsium crassicaule	0000002000
Cirsium cymosum	063b690904
Cirsium cymosum var. canovirens	0002000004
Cirsium cymosum var. cymosum	0639690900
Cirsium douglasii	073f410804
Cirsium douglasii var. breweri	063b400004
Cirsium douglasii var. douglasii	013c010800
Cirsium fontinale	0000020800
Cirsium fontinale var. campylon	0000000800
Cirsium fontinale var. fontinale	0000000800
Cirsium fontinale var. obispoense	0000020000
Cirsium hydrophilum	0000002a00
Cirsium hydrophilum var. hydrophilum	0000002200
Cirsium hydrophilum var. vaseyi	0000000800
Cirsium inamoenum	0002c40106
Cirsium inamoenum var. inamoenum	0002c40106
Cirsium mohavense	6000040002
Cirsium neomexicanum	e000000000
Cirsium occidentale	7ffffbdf07
Cirsium occidentale var. californicum	18c0fbd501
Cirsium occidentale var. candidissimum	073b480004
Cirsium occidentale var. compactum	0100000000
Cirsium occidentale var. coulteri	1980000000
Cirsium occidentale var. lucianum	0000020000
Cirsium occidentale var. occidentale	19c4035c01
Cirsium occidentale var. venustum	6038630b03
Cirsium ochrocentrum	0842004005
Cirsium ochrocentrum var. ochrocentrum	0842004005
Cirsium praeteriens	0000000800
Cirsium quercetorum	0124020800
Cirsium remotifolium	003d000800
Cirsium remotifolium subsp. remotifolium	0005000000
Cirsium remotifolium var. odontolepis	003d000800
Cirsium remotifolium var. remotifolium	0005000000
Cirsium remotifolium var. rivulare	003d000000
Cirsium rhothophilum	0100000000
Cirsium scariosum	0543c4c507
Cirsium scariosum var. americanum	0400c00104
Cirsium scariosum var. citrinum	004000c001
Cirsium scariosum var. congdonii	0000c40502
Cirsium scariosum var. loncholepis	0100000000
Cirsium scariosum var. robustum	0003000004
Cirsium scariosum var. scariosum	0001000000
Cirsium undulatum	0002000004
Cirsium vulgare	1fffffff07
Cissus antarctica	0080000000
Cistanthe ambigua	e000000000
Cistanthe maritima	1880000000
Cistus incanus	01c0005001
Cistus ladanifer	0180001001
Cistus monspeliensis	0104000000
Cistus psilosepalus	0100000800
Cistus salviifolius	0180001000
Citrullus lanatus	78c0005401
Citrullus lanatus var. citroides	78c0005401
Cladium californicum	e180020001
Clarkia affinis	0010130801
Clarkia amoena	0125000800
Clarkia amoena subsp. amoena	0104000000
Clarkia amoena subsp. huntiana	0021000800
Clarkia amoena subsp. whitneyi	0004000000
Clarkia amoena var. amoena	0104000000
Clarkia arcuata	0200d80000
Clarkia australis	0000d00000
Clarkia biloba	0000180800
Clarkia biloba subsp. australis	0000100000
Clarkia biloba subsp. biloba	0000180800
Clarkia biloba subsp. brandegeeae	0000080000
Clarkia borealis	0201000000
Clarkia borealis subsp. arida	0200000000
Clarkia borealis subsp. borealis	0001000000
Clarkia bottae	00c0020001
Clarkia breweri	0000010800
Clarkia concinna	013d080800
Clarkia concinna subsp. automixa	0000000800
Clarkia concinna subsp. concinna	003d080800
Clarkia concinna subsp. raichei	0100000000
Clarkia cylindrica	00003b8001
Clarkia cylindrica subsp. clavicarpa	0000388000
Clarkia cylindrica subsp. cylindrica	0000030001
Clarkia davyi	0904000000
Clarkia delicata	0040000000
Clarkia dudleyana	0000309401
Clarkia epilobioides	19c0035c01
Clarkia exilis	0000208000
Clarkia franciscana	0100000800
Clarkia gracilis	023f080a04
Clarkia gracilis subsp. albicaulis	0200000000
Clarkia gracilis subsp. gracilis	003f080a04
Clarkia gracilis subsp. sonomensis	0039000800
Clarkia gracilis subsp. tracyi	0010000000
Clarkia heterandra	0011fa9501
Clarkia imbricata	0020000000
Clarkia jolonensis	0000020000
Clarkia lassenensis	0613480004
Clarkia lewisii	0100030000
Clarkia lingulata	0000100000
Clarkia mildrediae	0600480000
Clarkia mildrediae subsp. lutescens	0000480000
Clarkia mildrediae subsp. mildrediae	0600480000
Clarkia modesta	0010330800
Clarkia mosquinii	0000080000
Clarkia prostrata	0100000000
Clarkia purpurea	1ffdfbff01
Clarkia purpurea subsp. purpurea	0100002200
Clarkia purpurea subsp. quadrivulnera	1ffdfbff01
Clarkia purpurea subsp. viminea	1ffdfbff01
Clarkia rhomboidea	1ffffbdf05
Clarkia rostrata	0000102000
Clarkia rubicunda	0100000800
Clarkia similis	18c0015401
Clarkia speciosa	010033a000
Clarkia speciosa subsp. immaculata	0100000000
Clarkia speciosa subsp. nitens	0000302000
Clarkia speciosa subsp. polyantha	0000208000
Clarkia speciosa subsp. speciosa	0000030000
Clarkia springvillensis	0000200000
Clarkia stellata	0401400000
Clarkia tembloriensis	0000212000
Clarkia tembloriensis subsp. calientensis	0000200000
Clarkia tembloriensis subsp. tembloriensis	0000212000
Clarkia unguiculata	00f83bca01
Clarkia virgata	0000d80000
Clarkia williamsonii	0000f88000
Clarkia xantiana	0000208101
Clarkia xantiana subsp. parviflora	0000200100
Clarkia xantiana subsp. xantiana	0000208101
Claytonia cordifolia	0009400000
Claytonia exigua	017d3b7e01
Claytonia exigua subsp. exigua	017d3b7e01
Claytonia exigua subsp. glauca	0039020800
Claytonia gypsophiloides	0038030800
Claytonia lanceolata	440bc01004
Claytonia megarhiza	0000c00004
Claytonia nevadensis	0401c40102
Claytonia palustris	0401c00100
Claytonia parviflora	7ffdffff03
Claytonia parviflora subsp. grandiflora	0000388000
Claytonia parviflora subsp. parviflora	1ffdfbff01
Claytonia parviflora subsp. utahensis	6000008000
Claytonia parviflora subsp. viridis	4040275503
Claytonia parviflora var. parviflora	1ffdfbff01
Claytonia perfoliata	7fffffff07
Claytonia perfoliata subsp. intermontana	6003fc8106
Claytonia perfoliata subsp. mexicana	0078035c01
Claytonia perfoliata subsp. perfoliata	1ffdfbff01
Claytonia perfoliata var. perfoliata	1ffdfbff01
Claytonia rubra	057fc7dd07
Claytonia rubra subsp. depressa	0105000800
Claytonia rubra subsp. rubra	057fc7dd07
Claytonia saxosa	0029000000
Claytonia sibirica	043d000800
Claytonia umbellata	0003040006
Claytonia washingtoniana	0004000000
Clematis lasiantha	1bd13b5e01
Clematis ligusticifolia	ffffffff07
Clematis pauciflora	58c0005401
Cleomella brevipes	2000040002
Cleomella hillmanii	0002000004
Cleomella hillmanii var. hillmanii	0002000004
Cleomella obtusifolia	e000040002
Cleomella parviflora	6002040006
Cleomella plocasperma	2002040406
Clinopodium chandleri	0040004000
Clinopodium douglasii	19fd435c01
Clinopodium mimuloides	0100021001
Clintonia andrewsiana	013d020800
Clintonia uniflora	0621f88100
Cneoridium dumosum	1080000000
Cochlearia groenlandica	0004000000
Coincya monensis	0004000000
Coincya monensis subsp. recurvata	0004000000
Coincya monensis var. recurvata	0004000000
Coleogyne ramosissima	e000040002
Collinsia antonina	0000020000
Collinsia bartsiifolia	6210b3be01
Collinsia bartsiifolia var. bartsiifolia	021032aa01
Collinsia bartsiifolia var. davidsonii	6000031401
Collinsia bartsiifolia var. stricta	0000800000
Collinsia callosa	4000229101
Collinsia childii	004082d501
Collinsia concolor	00c0004000
Collinsia corymbosa	0004000000
Collinsia grandiflora	0029000000
Collinsia greenei	0019000000
Collinsia heterophylla	1bf03b9e01
Collinsia heterophylla var. austromontana	0040001400
Collinsia heterophylla var. heterophylla	1bf03b8a01
Collinsia linearis	0021000000
Collinsia multicolor	0100000800
Collinsia parryi	0040005401
Collinsia parviflora	046bc45d07
Collinsia rattanii	0439400000
Collinsia sparsiflora	0330bb2a00
Collinsia sparsiflora var. collina	0330bb2a00
Collinsia sparsiflora var. sparsiflora	03301b2a00
Collinsia tinctoria	0230f80900
Collinsia torreyi	040bc09505
Collinsia torreyi var. brevicarinata	0000000100
Collinsia torreyi var. latifolia	040b000004
Collinsia torreyi var. torreyi	0000c00100
Collinsia torreyi var. wrightii	0408c09505
Collomia diversifolia	0018000800
Collomia grandiflora	1fffffff07
Collomia heterophylla	06397b0900
Collomia larsenii	0400000000
Collomia linearis	0603fc8506
Collomia rawsoniana	0000900000
Collomia tenella	0000000004
Collomia tinctoria	040bc60007
Collomia tracyi	0009000000
Colubrina californica	e000000000
Colutea arborescens	0000081000
Comandra umbellata	2601fc8102
Comandra umbellata subsp. californica	2601fc8102
Comandra umbellata var. californica	2601fc8102
Comarostaphylis diversifolia	18c0004001
Comarostaphylis diversifolia subsp. diversifolia	00c0004000
Comarostaphylis diversifolia subsp. planifolia	1800000001
Comarostaphylis diversifolia var. diversifolia	00c0004000
Comarostaphylis diversifolia var. planifolia	1800000001
Comarum palustre	0404400204
Comastoma tenellum	0000800102
Commelina benghalensis	0080000000
Condalia globosa	8000000000
Condalia globosa var. pubescens	8000000000
Conicosia pugioniformis	0100000000
Conioselinum pacificum	0104000000
Conium maculatum	1fffffff07
Conringia orientalis	8080040002
Consolida ajacis	0192000805
Constancea nevinii	1000000000
Convolvulus althaeoides	18c0385401
Convolvulus arvensis	ffffffff07
Convolvulus simulans	18c0224801
Convolvulus tricolor	0100000000
Coprosma repens	0100000000
Coptis laciniata	0005000000
Corallorhiza maculata	067ffa5d06
Corallorhiza maculata subsp. maculata	067ffa5d06
Corallorhiza maculata var. maculata	067ffa5d06
Corallorhiza maculata var. occidentalis	067ffa5d06
Corallorhiza mertensiana	002d000000
Corallorhiza striata	063ff80904
Corallorhiza trifida	0000400000
Cordylanthus capitatus	0000000004
Cordylanthus eremicus	4000000500
Cordylanthus eremicus subsp. eremicus	4000000400
Cordylanthus eremicus subsp. kernensis	0000000100
Cordylanthus kingii	0002040006
Cordylanthus kingii subsp. helleri	0002040006
Cordylanthus kingii var. helleri	0002040006
Cordylanthus nevinii	0040005501
Cordylanthus nidularius	0000000800
Cordylanthus parviflorus	4000000000
Cordylanthus pilosus	0639180800
Cordylanthus pilosus subsp. hansenii	0601180000
Cordylanthus pilosus subsp. pilosus	0038000800
Cordylanthus pilosus subsp. trifidus	0000180000
Cordylanthus pilosus var. pilosus	0038000800
Cordylanthus pilosus var. trifidus	0000180000
Cordylanthus pringlei	0018000000
Cordylanthus ramosus	4402040006
Cordylanthus rigidus	19c0b35d01
Cordylanthus rigidus subsp. brevibracteatus	0000000100
Cordylanthus rigidus subsp. littoralis	0100000000
Cordylanthus rigidus subsp. rigidus	0100b31901
Cordylanthus rigidus subsp. setigerus	18c0025401
Cordylanthus rigidus var. littoralis	0100000000
Cordylanthus rigidus var. rigidus	0100b31901
Cordylanthus tenuis	063bf88104
Cordylanthus tenuis subsp. barbatus	0000000100
Cordylanthus tenuis subsp. brunneus	0038000000
Cordylanthus tenuis subsp. capillaris	0020000000
Cordylanthus tenuis subsp. pallescens	0400000000
Cordylanthus tenuis subsp. tenuis	0001f88100
Cordylanthus tenuis subsp. viscidus	060b480004
Cordyline australis	0144004000
Coreopsis lanceolata	0180002000
Coreopsis tinctoria	19c0037e01
Corethrogyne filaginifolia	79e5b35d01
Coriandrum sativum	0010000200
Corispermum americanum	2000000000
Corispermum americanum var. americanum	2000000000
Cornus canadensis	003d000000
Cornus glabrata	1ffdfbff01
Cornus nuttallii	1ffdfbff01
Cornus sericea	1ffdfbff03
Cornus sericea subsp. occidentalis	1ffdfbff01
Cornus sericea subsp. sericea	1ffdfbff03
Cornus sericea var. sericea	1ffdfbff03
Cornus sessilis	063d480000
Coronilla valentina	0040004000
Coronilla valentina subsp. glauca	0040004000
Coronilla varia	0000480200
Cortaderia jubata	01a4000801
Cortaderia selloana	19840a0a01
Corydalis aurea	0002040006
Corydalis caseana	0402400104
Corydalis caseana subsp. caseana	0402400104
Corydalis caseana var. caseana	0402400104
Corylus cornuta	073df88900
Corylus cornuta subsp. californica	073df88900
Corylus cornuta var. californica	073df88900
Coryphantha alversonii	e000000000
Coryphantha chlorantha	4000000000
Coryphantha vivipara	4000000000
Coryphantha vivipara var. rosea	4000000000
Cosmos bipinnatus	1ffdfbff01
Cosmos sulphureus	1ffdfbff01
Cota tinctoria	0000400000
Cotoneaster franchetii	0125030800
Cotoneaster frigidus	0000000800
Cotoneaster hodjingensis	0100000000
Cotoneaster horizontalis	0004000000
Cotoneaster integrifolius	0040004800
Cotoneaster lacteus	03c5004800
Cotoneaster pannosus	03a40b1a01
Cotoneaster simonsii	0105030800
Cotula australis	19fc3b5c01
Cotula coronopifolia	01d40b4a00
Cotyledon orbiculata	0180000000
Cotyledon orbiculata var. oblonga	0180000000
Crassula aquatica	13c43b7e01
Crassula colligata	0080000000
Crassula colligata subsp. lamprosperma	0080000000
Crassula connata	fbfd3b7e01
Crassula multicava	0100000000
Crassula multicava subsp. multicava	0100000000
Crassula ovata	0080000000
Crassula solieri	02d0086200
Crassula tetragona	0180001000
Crassula tillaea	1bd01b7e01
Crataegus castlegarensis	0602000004
Crataegus douglasii	0601400000
Crataegus gaylussacia	0739c00100
Crataegus monogyna	003c000800
Crepis acuminata	040bc49507
Crepis bakeri	060bc00104
Crepis bakeri subsp. bakeri	060bc00104
Crepis bakeri subsp. cusickii	0400000000
Crepis bakeri subsp. idahoensis	0002000004
Crepis bursifolia	0100000800
Crepis capillaris	07bdd80800
Crepis intermedia	040bdc0006
Crepis modocensis	0402400004
Crepis modocensis subsp. modocensis	0402000004
Crepis modocensis subsp. subacaulis	0000400000
Crepis modocensis var. modocensis	0402000004
Crepis monticola	040b400804
Crepis nana	4000841102
Crepis occidentalis	040bc40d07
Crepis occidentalis subsp. conjuncta	0409c00004
Crepis occidentalis subsp. costata	0402400004
Crepis occidentalis subsp. occidentalis	0402c00504
Crepis occidentalis subsp. pumila	040a440807
Crepis occidentalis var. costata	0402400004
Crepis occidentalis var. occidentalis	0402c00504
Crepis occidentalis var. pumila	040a440807
Crepis pleurocarpa	0429c00000
Crepis runcinata	0002040006
Crepis runcinata subsp. andersonii	0002000004
Crepis runcinata subsp. hallii	0000040002
Crepis runcinata var. andersonii	0002000004
Crepis setosa	0020000000
Crepis tectorum	0000040402
Crepis vesicaria	00a0000800
Crepis vesicaria subsp. taraxacifolia	00a0000800
Crepis vesicaria var. taraxacifolia	00a0000800
Cressa truxillensis	b982072a06
Crocidium multicaule	023b3b0804
Crocosmia X crocosmiiflora	0084000800
Crossosoma bigelovii	e040000400
Crossosoma californicum	1080000000
Croton californicus	f180000000
Croton setiger	fffdfbff01
Croton wigginsii	8000000000
Crucianella angustifolia	0210080200
Crupina vulgaris	003a000004
Crypsis alopecuroides	05114c0202
Crypsis schoenoides	67d20b7a05
Crypsis vaginiflora	16fa0b7205
Cryptantha affinis	0679fad505
Cryptantha ambigua	0402c40004
Cryptantha angustifolia	e000040002
Cryptantha barbigera	e04024a502
Cryptantha barbigera var. barbigera	e00024a102
Cryptantha barbigera var. fergusoniae	e040040502
Cryptantha celosioides	0000000004
Cryptantha cinerea	4000040402
Cryptantha cinerea var. abortiva	4000040402
Cryptantha circumscissa	e0c2fdb507
Cryptantha circumscissa subsp. circumscissa	e0c2fdb507
Cryptantha circumscissa subsp. rosulata	0000c00100
Cryptantha circumscissa var. circumscissa	e0c2fdb507
Cryptantha circumscissa var. rosulata	0000c00100
Cryptantha clevelandii	19c0039801
Cryptantha clevelandii var. clevelandii	1080000000
Cryptantha clevelandii var. florosa	19c0039801
Cryptantha clokeyi	6000000000
Cryptantha confertiflora	4000040502
Cryptantha corollata	000023f801
Cryptantha costata	e000000000
Cryptantha crinita	0600000000
Cryptantha crymophila	0000c00000
Cryptantha decipiens	e040009502
Cryptantha dissita	0031000000
Cryptantha dumetorum	e000c49503
Cryptantha echinella	4002e49507
Cryptantha excavata	0010000000
Cryptantha fendleri	0000000002
Cryptantha flaccida	1ffffbff05
Cryptantha flavoculata	4000040002
Cryptantha ganderi	8000000000
Cryptantha glomeriflora	0000c40102
Cryptantha gracilis	6000040002
Cryptantha hispidula	0011000000
Cryptantha hoffmannii	4000000002
Cryptantha holoptera	e000000000
Cryptantha hooveri	0000002000
Cryptantha humilis	4002c40106
Cryptantha inaequata	e000000000
Cryptantha incana	0000000100
Cryptantha intermedia	1efffbdf05
Cryptantha intermedia var. hendersonii	063b400004
Cryptantha intermedia var. intermedia	18fdfbdf01
Cryptantha leiocarpa	0184000000
Cryptantha mariposae	0000180000
Cryptantha maritima	f8c0000400
Cryptantha micrantha	e0c024d503
Cryptantha micrantha subsp. lepida	004024d501
Cryptantha micrantha subsp. micrantha	e0c0045403
Cryptantha micrantha var. lepida	004024d501
Cryptantha micrantha var. micrantha	e0c0045403
Cryptantha micromeres	19c01a5c01
Cryptantha microstachys	00d023dd01
Cryptantha milobakeri	0639400000
Cryptantha mohavensis	6000009501
Cryptantha muricata	f9f8ffff03
Cryptantha muricata var. denticulata	e040c4d502
Cryptantha muricata var. jonesii	f9f83bde01
Cryptantha muricata var. muricata	18c0037c01
Cryptantha nemaclada	0010038801
Cryptantha nevadensis	e00023fd03
Cryptantha nevadensis var. nevadensis	e000009403
Cryptantha nevadensis var. rigida	600023fd01
Cryptantha nubigena	0000840102
Cryptantha oxygona	78c0f5f501
Cryptantha pterocarya	e04224b507
Cryptantha pterocarya var. cycloptera	e000000100
Cryptantha pterocarya var. pterocarya	e04224b507
Cryptantha pterocarya var. purpusii	4040000502
Cryptantha racemosa	e040000402
Cryptantha rattanii	0000030000
Cryptantha recurvata	6000040002
Cryptantha roosiorum	0000000002
Cryptantha rostellata	0012080204
Cryptantha schoolcraftii	0002000004
Cryptantha scoparia	6000040002
Cryptantha similis	6040001400
Cryptantha simulans	064bc89505
Cryptantha sparsiflora	0000338800
Cryptantha spithamaea	0000180000
Cryptantha subretusa	0403000004
Cryptantha torreyana	063bff8906
Cryptantha torreyana var. pumila	0000030800
Cryptantha torreyana var. torreyana	063bfc8106
Cryptantha traskiae	1000000000
Cryptantha tumulosa	6000000000
Cryptantha utahensis	e040241502
Cryptantha virginensis	6000040002
Cryptantha watsonii	0002c40106
Cryptogramma acrostichoides	0409c04500
Cryptogramma cascadensis	0401c00104
Cucumis melo	8000000000
Cucumis melo var. dudaim	8000000000
Cucumis myriocarpus	0000020000
Cucurbita digitata	80c0004000
Cucurbita foetidissima	f9c0037e01
Cucurbita palmata	f9c0037c01
Cucurbita pepo	0080000000
Cucurbita pepo var. pepo	0080000000
Cuniculotinus gramineus	4000000002
Cuscuta approximata	003a002204
Cuscuta brachycalyx	1ffdfbff01
Cuscuta californica	9ffdffff03
Cuscuta californica var. apiculata	8000000000
Cuscuta californica var. californica	1ffdffff03
Cuscuta californica var. papillosa	00903a2200
Cuscuta campestris	0194382200
Cuscuta cephalanthi	0601000004
Cuscuta denticulata	e000000002
Cuscuta howelliana	0212082204
Cuscuta indecora	e03cf8a300
Cuscuta indecora var. indecora	e03cf8a300
Cuscuta japonica	0000000200
Cuscuta japonica var. formosana	0000000200
Cuscuta jepsonii	0609c00100
Cuscuta nevadensis	4000000000
Cuscuta obtusiflora	0000000000
Cuscuta obtusiflora var. glandulosa	0000000000
Cuscuta occidentalis	013d872a02
Cuscuta pacifica	0184000000
Cuscuta pacifica var. pacifica	0184000000
Cuscuta pacifica var. papillata	0004000000
Cuscuta reflexa	0400001200
Cuscuta salina	0001002a02
Cuscuta suaveolens	0000002000
Cuscuta subinclusa	00baffeb06
Cuscuta suksdorfii	0001c00400
Cuscuta veatchii	8000000000
Cusickiella douglasii	003bfc8506
Cusickiella quadricostata	0000040002
Cycladenia humilis	0409461002
Cycladenia humilis var. humilis	0409420000
Cycladenia humilis var. jonesii	0000000002
Cycladenia humilis var. venusta	0000061002
Cycloloma atriplicifolium	60c0002200
Cyclospermum leptophyllum	01a0022a00
Cylindropuntia X fosbergii	8000000000
Cylindropuntia acanthocarpa	e000000000
Cylindropuntia acanthocarpa var. coloradensis	e000000000
Cylindropuntia bigelovii	e000000000
Cylindropuntia californica	80c0004000
Cylindropuntia californica subsp. californica	0080000000
Cylindropuntia californica subsp. parkeri	8040004000
Cylindropuntia californica var. californica	0080000000
Cylindropuntia californica var. parkeri	8040004000
Cylindropuntia echinocarpa	e000040002
Cylindropuntia ganderi	8040000000
Cylindropuntia munzii	8000000000
Cylindropuntia prolifera	1880000000
Cylindropuntia ramosissima	e000000000
Cylindropuntia wolfii	8040000000
Cymbalaria muralis	0184000000
Cymopterus aboriginum	4000000002
Cymopterus cinerarius	0000c40102
Cymopterus deserticola	6000000000
Cymopterus gilmanii	4000000000
Cymopterus globosus	0000040002
Cymopterus multinervatus	6000000000
Cymopterus panamintensis	6000000000
Cymopterus panamintensis var. acutifolius	6000000000
Cymopterus panamintensis var. panamintensis	4000000000
Cymopterus purpurascens	6000000002
Cymopterus ripleyi	4000040102
Cymopterus terebinthinus	0421c40102
Cymopterus terebinthinus var. californicus	0421c40100
Cymopterus terebinthinus var. petraeus	0000040002
Cynara cardunculus	19f83b7e01
Cynara cardunculus subsp. cardunculus	19c0237e01
Cynara cardunculus subsp. flavescens	19f83b7e01
Cynara cardunculus var. cardunculus	19c0237e01
Cynara cardunculus var. flavescens	19f83b7e01
Cynodon dactylon	fffdffff03
Cynoglossum grande	067dfbc900
Cynoglossum occidentale	041bc00104
Cynoglossum officinale	0401400000
Cynosurus cristatus	0184000000
Cynosurus echinatus	19fdfb5e01
Cyperus acuminatus	0001002201
Cyperus bipartitus	003d500000
Cyperus difformis	18c0007601
Cyperus eragrostis	1ffdfbff01
Cyperus erythrorhizos	9ffdfbff01
Cyperus esculentus	ffffffff07
Cyperus esculentus var. heermannii	0040004000
Cyperus esculentus var. leptostachyus	ffffffff07
Cyperus esculentus var. macrostachyus	0080000000
Cyperus flavescens	0000100200
Cyperus flavicomus	0000000200
Cyperus fuscus	0000002200
Cyperus involucratus	0080000000
Cyperus iria	0000000200
Cyperus laevigatus	f8c2045407
Cyperus niger	03f87f6a02
Cyperus odoratus	e080002200
Cyperus parishii	f8c0005401
Cyperus rotundus	8080002200
Cyperus squarrosus	ffffffff07
Cyperus strigosus	ffffffff07
Cypripedium californicum	0621480800
Cypripedium fasciculatum	063d480800
Cypripedium montanum	063fd80804
Cypripedium parviflorum	0000f88100
Cypripedium parviflorum var. makasin	0000f88100
Cypselea humifusa	0078036a00
Cyrtomium falcatum	00e0023401
Cystopteris fragilis	467bdf5d07
Cytisus multiflorus	0080000000
Cytisus proliferus	0100000800
Cytisus scoparius	02bd582e00
Cytisus striatus	00c0025800
Dactylis glomerata	1fffffff07
Dactyloctenium aegyptium	80c0006000
Dalea mollis	e000000000
Dalea mollissima	e000000000
Dalea ornata	0002000004
Dalea searlsiae	4000000002
Damasonium californicum	0012082a04
Danthonia californica	077ffb8d04
Danthonia decumbens	0004000000
Danthonia intermedia	040bc00104
Danthonia intermedia subsp. intermedia	040bc00104
Danthonia intermedia var. intermedia	040bc00104
Danthonia unispicata	043bc06505
Darlingtonia californica	0021400000
Darmera peltata	0621c80100
Dasiphora fruticosa	0401c00106
Dasyochloa pulchella	e000000000
Datisca glomerata	7ffdffff03
Datura discolor	8000000000
Datura ferox	00000a2000
Datura stramonium	19ff3bfe05
Datura wrightii	f9d033fe01
Daucus carota	1ffdffff03
Daucus pusillus	5ffdfbff01
Dedeckera eurekensis	4000000002
Deinandra arida	6000000000
Deinandra bacigalupii	0000002000
Deinandra clementina	1800000000
Deinandra conjugens	00c0000000
Deinandra corymbosa	0124020800
Deinandra fasciculata	19c0025401
Deinandra floribunda	0040000000
Deinandra halliana	0000012000
Deinandra increscens	0980030001
Deinandra increscens subsp. increscens	0980030000
Deinandra increscens subsp. villosa	0080000001
Deinandra kelloggii	38c0317c01
Deinandra lobbii	0402032800
Deinandra minthornii	0000000001
Deinandra mohavensis	2040004500
Deinandra pallida	000021a000
Deinandra paniculata	00c0024001
Deinandra pentactis	0000032800
Delairea odorata	19fc027e01
Delosperma litorale	1080000000
Delphinium andersonii	0402440006
Delphinium antoninum	0009000000
Delphinium bakeri	0100000800
Delphinium californicum	0100010800
Delphinium californicum subsp. californicum	0100000800
Delphinium californicum subsp. interius	0000010800
Delphinium californicum var. californicum	0100000800
Delphinium californicum var. interius	0000010800
Delphinium cardinale	98c0035401
Delphinium decorum	002d000800
Delphinium decorum subsp. decorum	0004000800
Delphinium decorum subsp. tracyi	0029000000
Delphinium decorum var. decorum	0004000800
Delphinium depauperatum	0400c00004
Delphinium glaucum	0001c41500
Delphinium gracilentum	0000f88100
Delphinium gypsophilum	000023a000
Delphinium hansenii	2210b8ab00
Delphinium hansenii subsp. ewanianum	0000382000
Delphinium hansenii subsp. hansenii	0210b80b00
Delphinium hansenii subsp. kernense	2000208100
Delphinium hansenii var. hansenii	0210b80b00
Delphinium hansenii var. kernense	2000208100
Delphinium hesperium	027d010a00
Delphinium hesperium subsp. cuyamacae	0040000000
Delphinium hesperium subsp. hesperium	003d000800
Delphinium hesperium subsp. pallescens	0210010a00
Delphinium hesperium var. hesperium	003d000800
Delphinium hutchinsoniae	0100000000
Delphinium inopinum	0000000100
Delphinium luteum	0100000000
Delphinium nudicaule	073fda0a04
Delphinium nuttallianum	003fc00104
Delphinium parishii	e00005b503
Delphinium parishii subsp. pallidum	0000012001
Delphinium parishii subsp. parishii	e000049503
Delphinium parishii subsp. subglobosum	8000000000
Delphinium parishii var. pallidum	0000012001
Delphinium parishii var. parishii	e000049503
Delphinium parryi	19c003fc01
Delphinium parryi subsp. blochmaniae	0180000000
Delphinium parryi subsp. eastwoodiae	0100020000
Delphinium parryi subsp. maritimum	1980000000
Delphinium parryi subsp. parryi	19c0037c01
Delphinium parryi subsp. purpureum	0000028001
Delphinium parryi var. blochmaniae	0180000000
Delphinium parryi var. parryi	19c0037c01
Delphinium patens	00f8fbff01
Delphinium patens subsp. hepaticoideum	00c0025401
Delphinium patens subsp. montanum	0040015501
Delphinium patens subsp. patens	0038fbab00
Delphinium polycladon	0000c00102
Delphinium purpusii	2000200100
Delphinium recurvatum	6000012200
Delphinium scaposum	8000000000
Delphinium stachydeum	0000000004
Delphinium trolliifolium	0024000000
Delphinium uliginosum	0010000000
Delphinium umbraculorum	0000020001
Delphinium variegatum	163c3b2a00
Delphinium variegatum subsp. kinkiense	1000000000
Delphinium variegatum subsp. thornei	1000000000
Delphinium variegatum subsp. variegatum	063c3b2a00
Delphinium variegatum var. variegatum	063c3b2a00
Dendromecon harfordii	1800000000
Dendromecon rigida	03fd3b5c01
Deschampsia cespitosa	073dfc9f07
Deschampsia cespitosa subsp. beringensis	0004000000
Deschampsia cespitosa subsp. cespitosa	073dfc9d07
Deschampsia cespitosa subsp. holciformis	0124000200
Deschampsia cespitosa var. cespitosa	073dfc9d07
Deschampsia danthonioides	1ffffbff05
Deschampsia elongata	057fffdd05
Descurainia adenophora	6040000000
Descurainia californica	4002c40106
Descurainia incana	0003fc8506
Descurainia incisa	0042045407
Descurainia incisa subsp. incisa	0042045407
Descurainia longipedicellata	0602040006
Descurainia nelsonii	6002040006
Descurainia paradisa	0002040006
Descurainia pinnata	ffffffff07
Descurainia pinnata subsp. brachycarpa	ffffffff07
Descurainia pinnata subsp. glabra	ffffffff07
Descurainia pinnata subsp. ochroleuca	ffffffff07
Descurainia pinnata var. brachycarpa	ffffffff07
Descurainia pinnata var. glabra	ffffffff07
Descurainia pinnata var. ochroleuca	ffffffff07
Descurainia sophia	ffffffff07
Desmazeria rigida	1184000800
Dianthus armeria	0671c44102
Dianthus armeria subsp. armeria	0671c44102
Dianthus barbatus	033d000000
Dianthus barbatus subsp. barbatus	033d000000
Dianthus deltoides	0402402104
Dianthus deltoides subsp. deltoides	0402402104
Dianthus plumarius	0080000000
Dianthus plumarius subsp. plumarius	0080000000
Dicentra formosa	073dc30900
Dicentra nevadensis	0000000100
Dicentra pauciflora	0401400101
Dicentra uniflora	040bc00104
Dichelostemma capitatum	ffffffff07
Dichelostemma capitatum subsp. capitatum	ffffffff07
Dichelostemma capitatum subsp. pauciflorum	e000040002
Dichelostemma congestum	063d480800
Dichelostemma ida-maia	003d000000
Dichelostemma multiflorum	003fd80a04
Dichelostemma volubile	0210380000
Dichondra donelliana	0105080800
Dichondra micrantha	0080080000
Dichondra occidentalis	19c0004000
Dicoria canescens	e080040000
Dicranostegia orcuttiana	0080000000
Dieteria asteroides	80c0004000
Dieteria asteroides var. asteroides	8080004000
Dieteria asteroides var. lagunensis	0040000000
Dieteria canescens	66cbfcd507
Dieteria canescens var. canescens	6682fcd507
Dieteria canescens var. incana	0001000000
Dieteria canescens var. leucanthemifolia	6040040002
Dieteria canescens var. shastensis	060bc80006
Dieteria canescens var. ziegleri	0040000000
Digitalis purpurea	0165d84901
Digitaria californica	c000000000
Digitaria californica var. californica	c000000000
Digitaria ciliaris	00c0000000
Digitaria ciliaris var. ciliaris	00c0000000
Digitaria ischaemum	e1a8202300
Digitaria sanguinalis	fffd3bfe01
Dimeresia howellii	0002000004
Dimorphotheca ecklonis	01c0004000
Dimorphotheca fruticosa	01c0004000
Dimorphotheca sinuata	f9c0037c01
Diodia teres	8000000000
Diplotaxis muralis	0080000000
Diplotaxis tenuifolia	0080000200
Dipsacus fullonum	0005300800
Dipsacus sativus	0164034800
Dirca occidentalis	0000000800
Dissanthelium californicum	1000000000
Distichlis littoralis	9880000000
Distichlis spicata	b9d6ffff07
Ditaxis claryana	8000000000
Ditaxis lanceolata	e000000000
Ditaxis neomexicana	a000000000
Ditaxis serrata	e000000000
Ditaxis serrata var. californica	e000000000
Ditaxis serrata var. serrata	e000000000
Dithyrea californica	e000000000
Dithyrea maritima	1980000000
Dittrichia graveolens	0180082a00
Dodecahema leptoceras	00c0005401
Dodecatheon alpinum	0009c44507
Dodecatheon clevelandii	19c0bb7e01
Dodecatheon clevelandii subsp. clevelandii	00c0005401
Dodecatheon clevelandii subsp. insulare	1800020000
Dodecatheon clevelandii subsp. patulum	0100bb2a00
Dodecatheon clevelandii subsp. sanctarum	0000031801
Dodecatheon clevelandii var. clevelandii	00c0005401
Dodecatheon clevelandii var. insulare	1800020000
Dodecatheon clevelandii var. patulum	0100bb2a00
Dodecatheon conjugens	0402000004
Dodecatheon hendersonii	073d7b2e00
Dodecatheon jeffreyi	063bf88104
Dodecatheon pulchellum	4402040006
Dodecatheon redolens	4000845502
Dodecatheon subalpinum	0000800100
Dopatrium junceum	0000000200
Downingia bacigalupii	0603400004
Downingia bella	0040002201
Downingia bicornuta	0612582204
Downingia bicornuta var. bicornuta	0612582204
Downingia bicornuta var. picta	0000082200
Downingia concolor	0078010a00
Downingia concolor subsp. brevior	0040000000
Downingia concolor subsp. concolor	0038010a00
Downingia concolor var. brevior	0040000000
Downingia concolor var. concolor	0038010a00
Downingia cuspidata	067a3a6a04
Downingia elegans	003d000000
Downingia insignis	0002002204
Downingia laeta	0002000004
Downingia montana	0600d80000
Downingia ornatissima	0000082200
Downingia ornatissima var. eximia	0000002200
Downingia ornatissima var. ornatissima	0000082200
Downingia pulchella	011001aa00
Downingia pulcherrima	0601000000
Downingia pusilla	0030002a00
Downingia willamettensis	003d000000
Downingia yina	0600000000
Draba albertina	0402c41106
Draba asterophora	0000c00000
Draba aureola	0001000000
Draba breweri	0400c40102
Draba californica	0000000002
Draba cana	0000000100
Draba carnosula	0001000000
Draba corrugata	0000001400
Draba cruciata	0000000100
Draba cuneifolia	f8c0207503
Draba densifolia	0000c40102
Draba howellii	0001000000
Draba incrassata	0000040000
Draba lemmonii	0000c00100
Draba lonchocarpa	0000800000
Draba longisquamosa	0000000100
Draba monoensis	0000000002
Draba nemorosa	0001000000
Draba novolympica	0000400000
Draba oligosperma	0000c40102
Draba praealta	0000800000
Draba pterosperma	0001000000
Draba reptans	4000400000
Draba saxosa	0040004000
Draba sharsmithii	0000000100
Draba sierrae	0000800000
Draba subumbellata	0000000102
Draba verna	1ffffbff05
Draperia systyla	0401f88100
Drosanthemum floribundum	1984000000
Drosera anglica	0601400004
Drosera rotundifolia	063dc00100
Drymocallis cuneifolia	0000001400
Drymocallis cuneifolia var. cuneifolia	0000000400
Drymocallis cuneifolia var. ewanii	0000001000
Drymocallis glandulosa	07fffbdf05
Drymocallis glandulosa var. glandulosa	067bf8d705
Drymocallis glandulosa var. reflexa	0449c05500
Drymocallis glandulosa var. viscida	0040005401
Drymocallis glandulosa var. wrangelliana	01a4030800
Drymocallis hansenii	0600f88100
Drymocallis lactea	063fc45507
Drymocallis lactea var. austiniae	063f400004
Drymocallis lactea var. lactea	0000c45503
Drymocallis pseudorupestris	043dc00106
Drymocallis pseudorupestris var. crumiana	0000c00102
Drymocallis pseudorupestris var. saxicola	043dc00106
Drymocallis rhomboidea	0409000000
Dryopteris arguta	19fffbdf01
Dryopteris expansa	0126000000
Dryopteris filix-mas	0000000402
Duchesnea indica	0180000200
Duchesnea indica var. indica	0180000200
Dudleya abramsii	0140024d00
Dudleya abramsii subsp. abramsii	0040004100
Dudleya abramsii subsp. affinis	0000000400
Dudleya abramsii subsp. bettinae	0100020000
Dudleya abramsii subsp. calcicola	0000000100
Dudleya abramsii subsp. murina	0000020000
Dudleya abramsii subsp. setchellii	0000000800
Dudleya arizonica	c040004000
Dudleya attenuata	0080000000
Dudleya attenuata subsp. attenuata	0080000000
Dudleya blochmaniae	0980000000
Dudleya blochmaniae subsp. blochmaniae	0980000000
Dudleya blochmaniae subsp. insularis	0800000000
Dudleya brevifolia	0080000000
Dudleya caespitosa	0984000000
Dudleya candelabrum	0800000000
Dudleya cymosa	0778fbfd01
Dudleya cymosa subsp. agourensis	0000000001
Dudleya cymosa subsp. costatifolia	0000000100
Dudleya cymosa subsp. crebrifolia	0000001000
Dudleya cymosa subsp. cymosa	0738fb8901
Dudleya cymosa subsp. marcescens	0000000001
Dudleya cymosa subsp. ovatifolia	0040000001
Dudleya cymosa subsp. paniculata	0000012800
Dudleya cymosa subsp. pumila	0040025401
Dudleya densiflora	0000001000
Dudleya edulis	00c0004000
Dudleya farinosa	0104000000
Dudleya gnoma	0800000000
Dudleya greenei	0800000000
Dudleya lanceolata	4140035c01
Dudleya multicaulis	0080000000
Dudleya nesiotica	0800000000
Dudleya palmeri	0180000800
Dudleya parva	0000000001
Dudleya pulverulenta	01c0025401
Dudleya saxosa	c040004000
Dudleya saxosa subsp. aloides	c040004000
Dudleya saxosa subsp. saxosa	4000000000
Dudleya stolonifera	0080000000
Dudleya traskiae	1000000000
Dudleya variegata	00c0000000
Dudleya verityi	0000000001
Dudleya virens	1080000000
Dudleya virens subsp. hassei	1000000000
Dudleya virens subsp. insularis	1080000000
Dudleya virens subsp. virens	1000000000
Dudleya viscida	0080000000
Dulichium arundinaceum	0621f88100
Dulichium arundinaceum var. arundinaceum	0621f88100
Dysphania ambrosioides	1ffdfbff01
Dysphania anthelmintica	0080020a00
Dysphania botrys	ffffffff07
Dysphania chilensis	0020080a00
Dysphania multifida	19bd130a01
Dysphania pumilio	06fbf8bf05
Dyssodia papposa	0080000000
Eastwoodia elegans	000023a801
Eatonella nivea	0002040006
Echinocactus polycephalus	e000000000
Echinocactus polycephalus var. polycephalus	e000000000
Echinocereus engelmannii	e040004402
Echinocereus mojavensis	e000000002
Echinochloa colona	dfd0607e01
Echinochloa crus-galli	ffffffff07
Echinochloa crus-pavonis	00f6006204
Echinochloa crus-pavonis var. crus-pavonis	00f6006204
Echinochloa esculenta	0182030804
Echinochloa muricata	00f70c6606
Echinochloa muricata var. microstachya	00f70c6606
Echinochloa oryzicola	0000000200
Echinochloa oryzoides	8000002200
Echinodorus berteroi	19d0037e01
Echinops sphaerocephalus	0002000004
Echium candicans	0180001800
Echium pininana	0104000000
Echium plantagineum	0180000000
Eclipta prostrata	98c0037601
Egeria densa	00023c6a06
Ehrendorferia chrysantha	19fdfbdd01
Ehrendorferia ochroleuca	19c0035c01
Ehrharta calycina	18f0025601
Ehrharta erecta	e184020801
Ehrharta longiflora	00c0004000
Eichhornia crassipes	00c0006a00
Elaeagnus angustifolia	6042045e06
Elatine ambigua	0000002200
Elatine brachysperma	ffffffff07
Elatine californica	0008002a00
Elatine chilensis	0042404004
Elatine heterandra	0038f88100
Elatine rubella	ffffffff07
Eleocharis acicularis	1ffffbff05
Eleocharis acicularis var. acicularis	1ffffbff05
Eleocharis acicularis var. gracilescens	003cf88300
Eleocharis acicularis var. occidentalis	0620f88300
Eleocharis atropurpurea	0080002600
Eleocharis bella	1efffed707
Eleocharis bernardina	0000001401
Eleocharis bolanderi	0002f88104
Eleocharis coloradoensis	84c2027605
Eleocharis decumbens	0411f88100
Eleocharis engelmannii	07bffc8106
Eleocharis engelmannii subsp. engelmannii 	003d040002
Eleocharis engelmannii var. detonsa	043ff88104
Eleocharis engelmannii var. engelmannii	03bffc8106
Eleocharis flavescens	0000482200
Eleocharis flavescens var. flavescens	0000482200
Eleocharis geniculata	8000000400
Eleocharis macrostachya	ffffffff07
Eleocharis montevidensis	9fd04b5601
Eleocharis obtusa	013df88100
Eleocharis ovata	0100040002
Eleocharis pachycarpa	00265a2204
Eleocharis palustris	18bfc00504
Eleocharis parishii	e2d3ee7a07
Eleocharis parvula	0084000800
Eleocharis quadrangulata	0000002200
Eleocharis quinqueflora	0613fec706
Eleocharis radicans	19fc007601
Eleocharis rostellata	67b7041807
Eleocharis suksdorfiana	443df89d01
Eleocharis tenuis	0020000000
Eleocharis tenuis var. tenuis	0020000000
Eleocharis torticulmis	0000400000
Eleusine coracana	00c0004001
Eleusine coracana subsp. africana	00c0004001
Eleusine indica	0080003a00
Eleusine tristachya	00801a0200
Elodea bifoliata	0002000004
Elodea canadensis	0422c43f06
Elodea nuttallii	0003c40706
Elymus X gouldii	01c0034e00
Elymus X vancouverensis	0104000000
Elymus californicus	0124000800
Elymus caput-medusae	063b3b2204
Elymus cinereus	4602fc9707
Elymus condensatus	79c0035c01
Elymus elymoides	e643fcdd07
Elymus elymoides subsp. brevifolius	6042004406
Elymus elymoides subsp. californicus	0601fcd502
Elymus elymoides subsp. elymoides	e002045c07
Elymus elymoides var. brevifolius	6042004406
Elymus elymoides var. californicus	0601fcd502
Elymus elymoides var. elymoides	e002045c07
Elymus glaucus	ffffffff07
Elymus glaucus subsp. glaucus	ffffffff07
Elymus glaucus subsp. virescens	0124030800
Elymus glaucus var. glaucus	ffffffff07
Elymus glaucus var. virescens	0124030800
Elymus hispidus	4653f8c505
Elymus lanceolatus	1ed3485505
Elymus lanceolatus subsp. lanceolatus	1ed3485505
Elymus lanceolatus var. lanceolatus	1ed3485505
Elymus mollis	0104000000
Elymus mollis subsp. mollis	0104000000
Elymus mollis var. mollis	0104000000
Elymus multisetus	ffffffff07
Elymus pacificus	0904000000
Elymus ponticus	18c2f8d705
Elymus repens	1fffffff07
Elymus salina	4000000000
Elymus scribneri	0000c40102
Elymus sierrae	0400c00100
Elymus smithii	4002440006
Elymus spicatus	063bd80004
Elymus stebbinsii	0050fbd501
Elymus trachycaulus	ffffffdd07
Elymus trachycaulus subsp. trachycaulus	ffffffdd07
Elymus trachycaulus var. trachycaulus	ffffffdd07
Elymus triticoides	ffffffff07
Emex australis	0100000000
Emex spinosa	0180000000
Emmenanthe penduliflora	f9d8bf7d03
Emmenanthe penduliflora var. penduliflora	f9d8bf7d03
Emmenanthe penduliflora var. rosea	0000010801
Empetrum nigrum	0004000000
Encelia actoni	e040243403
Encelia californica	01c0000001
Encelia farinosa	e0c0000000
Encelia frutescens	e000000000
Encelia virginensis	6000000000
Enceliopsis covillei	4000000000
Enceliopsis nudicaulis	4000000002
Enemion occidentale	0010fb8901
Enemion stipitatum	063f480804
Enneapogon desvauxii	4000000000
Ephedra aspera	e000044402
Ephedra californica	f8c023f401
Ephedra foeminea	0080000000
Ephedra funerea	6000000000
Ephedra nevadensis	e000241503
Ephedra trifurca	e000000000
Ephedra viridis	400227f407
Epilobium anagallidifolium	0401c00506
Epilobium brachycarpum	07fffbff07
Epilobium campestre	07fffbff05
Epilobium canum	5ffdfbff01
Epilobium canum subsp. canum	1ffdbbff01
Epilobium canum subsp. garrettii	4000000100
Epilobium canum subsp. latifolium	4649f8d501
Epilobium ciliatum	ffffffff07
Epilobium ciliatum subsp. ciliatum	ffffffff07
Epilobium ciliatum subsp. glandulosum	0639c01505
Epilobium ciliatum subsp. watsonii	0104000000
Epilobium ciliatum var. ciliatum	ffffffff07
Epilobium ciliatum var. glandulosum	0639c01505
Epilobium clavatum	0401c00004
Epilobium cleistogamum	00003a2200
Epilobium densiflorum	077ffbff05
Epilobium foliosum	0739ca1b01
Epilobium glaberrimum	0449c05507
Epilobium glaberrimum subsp. fastigiatum	0409c00104
Epilobium glaberrimum subsp. glaberrimum	0449c05507
Epilobium glaberrimum var. fastigiatum	0409c00104
Epilobium glaberrimum var. glaberrimum	0449c05507
Epilobium hallianum	067bc05d05
Epilobium hornemannii	0409c04506
Epilobium hornemannii subsp. hornemannii	0409c04506
Epilobium hornemannii var. hornemannii	0409c04506
Epilobium howellii	0000c00000
Epilobium lactiflorum	0401c00102
Epilobium leptophyllum	0410040002
Epilobium luteum	0001400000
Epilobium minutum	277fdf4e06
Epilobium nivium	0008000000
Epilobium obcordatum	0402c00104
Epilobium oreganum	0021000000
Epilobium oregonense	0401c45506
Epilobium pallidum	0613480204
Epilobium palustre	0000400004
Epilobium rigidum	0001000000
Epilobium saximontanum	0000840102
Epilobium septentrionale	0024000000
Epilobium siskiyouense	0001000000
Epilobium torreyi	663bfaab04
Epipactis gigantea	efffffdd07
Epipactis helleborine	0130800800
Equisetum X ferrissii	43e5c33b00
Equisetum arvense	3dfff8ff07
Equisetum hyemale	ede5df7f07
Equisetum hyemale subsp. affine	ede5df7f07
Equisetum hyemale var. affine	ede5df7f07
Equisetum laevigatum	fdffffff03
Equisetum palustre	0110000000
Equisetum telmateia	1dfdcb1c01
Equisetum telmateia subsp. braunii	1dfdcb1c01
Equisetum telmateia var. braunii	1dfdcb1c01
Eragrostis barrelieri	00c0026601
Eragrostis cilianensis	ffffffff07
Eragrostis curvula	6240026600
Eragrostis hypnoides	0039102a00
Eragrostis lehmanniana	6080000000
Eragrostis lutescens	0000202000
Eragrostis mexicana	ffffffff07
Eragrostis mexicana subsp. mexicana	0080002401
Eragrostis mexicana subsp. virescens	ffffffff07
Eragrostis minor	60a2182204
Eragrostis pectinacea	ffffffff07
Eragrostis pectinacea var. miserrima	0000082200
Eragrostis pectinacea var. pectinacea	ffffffff07
Eragrostis pilosa	0003002204
Eragrostis pilosa var. pilosa	0003002204
Eremalche exilis	f800013002
Eremalche parryi	000033a801
Eremalche parryi subsp. kernensis	0000012000
Eremalche parryi subsp. parryi	000033a801
Eremalche rotundifolia	e000000000
Eremogone aculeata	0602000004
Eremogone cliftonii	0000480000
Eremogone congesta	460bd40106
Eremogone congesta var. charlestonensis	4000000000
Eremogone congesta var. congesta	0408400004
Eremogone congesta var. crassula	000b000004
Eremogone congesta var. simulans	0002400004
Eremogone congesta var. subcongesta	440a440006
Eremogone congesta var. suffrutescens	4601d00100
Eremogone ferrisiae	0000844102
Eremogone kingii	4400c40102
Eremogone kingii var. glabrescens	4400c40102
Eremogone macradenia	6000241503
Eremogone macradenia var. arcuifolia	0000201101
Eremogone macradenia var. macradenia	6000241502
Eremogone ursina	0000000400
Eremothera boothii	e00225a907
Eremothera boothii subsp. alyssoides	0002000006
Eremothera boothii subsp. boothii	0000040002
Eremothera boothii subsp. condensata	e000000000
Eremothera boothii subsp. decorticans	000021a801
Eremothera boothii subsp. desertorum	6000040102
Eremothera boothii subsp. intermedia	4000040002
Eremothera chamaenerioides	e000000002
Eremothera minor	0002000004
Eremothera refracta	e000000000
Eriastrum abramsii	0010010800
Eriastrum brandegeeae	0010000000
Eriastrum densifolium	79c0275503
Eriastrum densifolium subsp. austromontanum	00c0205501
Eriastrum densifolium subsp. densifolium	0100000000
Eriastrum densifolium subsp. elongatum	38c0235501
Eriastrum densifolium subsp. mohavense	6000040002
Eriastrum densifolium subsp. sanctorum	0080000000
Eriastrum diffusum	e000040002
Eriastrum eremicum	e000040002
Eriastrum eremicum subsp. eremicum	e000040002
Eriastrum filifolium	18c0025401
Eriastrum harwoodii	e000000000
Eriastrum hooveri	0000202001
Eriastrum luteum	0000030000
Eriastrum pluriflorum	6000332901
Eriastrum pluriflorum subsp. pluriflorum	0000332901
Eriastrum pluriflorum subsp. sherman-hoytiae	6000000000
Eriastrum pluriflorum var. pluriflorum	0000332901
Eriastrum sapphirinum	e0c0205401
Eriastrum sapphirinum subsp. dasyanthum	e0c0205401
Eriastrum sapphirinum subsp. sapphirinum	e0c0005401
Eriastrum signatum	0402e41505
Eriastrum sparsiflorum	0002c40104
Eriastrum tracyi	0013200804
Eriastrum virgatum	0100030000
Eriastrum wilcoxii	4002c40106
Erica lusitanica	0104000000
Ericameria albida	2000040002
Ericameria arborescens	00393b0901
Ericameria bloomeri	0602f88104
Ericameria brachylepis	00c0000000
Ericameria cooperi	6000041003
Ericameria cooperi var. cooperi	6000041003
Ericameria cuneata	e040ffd103
Ericameria cuneata var. cuneata	0040fcd103
Ericameria cuneata var. macrocephala	0040000000
Ericameria cuneata var. spathulata	e000038000
Ericameria discoidea	0000c40106
Ericameria ericoides	0184022800
Ericameria fasciculata	0100000000
Ericameria gilmanii	4000000002
Ericameria greenei	0409400004
Ericameria laricifolia	4000000000
Ericameria linearifolia	e15023fe01
Ericameria nana	4000040002
Ericameria nauseosa	667fffdd07
Ericameria nauseosa var. bernardina	0040201503
Ericameria nauseosa var. ceruminosa	6000000000
Ericameria nauseosa var. hololeuca	6000c68103
Ericameria nauseosa var. leiosperma	4000040002
Ericameria nauseosa var. mohavensis	6000031c01
Ericameria nauseosa var. oreophila	0042fdc506
Ericameria nauseosa var. speciosa	063df88102
Ericameria nauseosa var. washoensis	0002000004
Ericameria ophitidis	0008000000
Ericameria palmeri	9880000001
Ericameria palmeri subsp. palmeri	0080000000
Ericameria palmeri var. pachylepis	9880000001
Ericameria palmeri var. palmeri	0080000000
Ericameria paniculata	e000000002
Ericameria parishii	0040005400
Ericameria parishii var. parishii	0040005400
Ericameria parryi	463bc40506
Ericameria parryi var. aspera	4000840502
Ericameria parryi var. imula	0000000400
Ericameria parryi var. latior	0639000000
Ericameria parryi var. monocephala	0000840000
Ericameria parryi var. nevadensis	0002c40006
Ericameria parryi var. vulcanica	0000800100
Ericameria pinifolia	80c0005001
Ericameria suffruticosa	0000c40102
Ericameria teretifolia	600004d403
Erigeron aequifolius	0000000100
Erigeron algidus	0000c40100
Erigeron aliceae	003d000000
Erigeron annuus	0001c00000
Erigeron aphanactis	4002840406
Erigeron aphanactis var. aphanactis	4002840406
Erigeron aphanactis var. congestus	0000000400
Erigeron argentatus	4000000002
Erigeron barbellulatus	0400c00000
Erigeron biolettii	0021000000
Erigeron blochmaniae	0100000000
Erigeron bloomeri	0603440006
Erigeron bloomeri var. bloomeri	0602440006
Erigeron bloomeri var. nudatus	0001000000
Erigeron bonariensis	5bc01b7e01
Erigeron breweri	6000c45502
Erigeron breweri var. bisanctus	0000001400
Erigeron breweri var. breweri	0000c00500
Erigeron breweri var. covillei	6000005500
Erigeron breweri var. jacinteus	0000005400
Erigeron breweri var. porphyreticus	6000040402
Erigeron calvus	0000040002
Erigeron canadensis	ffffffff07
Erigeron cervinus	0001000000
Erigeron chrysopsidis	0002000004
Erigeron chrysopsidis subsp. austiniae	0002000004
Erigeron chrysopsidis var. austiniae	0002000004
Erigeron clokeyi	4000040102
Erigeron clokeyi var. pinzliae	4000040102
Erigeron compactus	0000000002
Erigeron compositus	0000c40106
Erigeron concinnus	4000000000
Erigeron concinnus var. concinnus	4000000000
Erigeron coulteri	0000c00104
Erigeron divergens	e002fc5706
Erigeron eatonii	0603c40006
Erigeron eatonii subsp. plantagineus	0603000004
Erigeron eatonii var. nevadincola	0002000004
Erigeron eatonii var. plantagineus	0603000004
Erigeron eatonii var. sonnei	0000c40002
Erigeron elegantulus	0002000004
Erigeron elmeri	0000800000
Erigeron filifolius	0402000004
Erigeron flagellaris	0000000002
Erigeron foliosus	41617b7d01
Erigeron foliosus var. confinis	0001000000
Erigeron foliosus var. foliosus	4040627d01
Erigeron foliosus var. franciscensis	0100030800
Erigeron foliosus var. hartwegii	0000180000
Erigeron foliosus var. mendocinus	0021000000
Erigeron glacialis	0401c40106
Erigeron glacialis var. glacialis	0401c40106
Erigeron glacialis var. hirsutus	0001840102
Erigeron glaucus	0904020000
Erigeron greenei	0020000000
Erigeron inornatus	063ff88104
Erigeron inornatus var. calidipetris	0602000004
Erigeron inornatus var. inornatus	063df88104
Erigeron inornatus var. keilii	0000200100
Erigeron karvinskianus	0100100800
Erigeron klamathensis	0401000000
Erigeron lassenianus	0401400000
Erigeron lassenianus var. deficiens	0000400000
Erigeron lassenianus var. lassenianus	0401400000
Erigeron linearis	0002400004
Erigeron lonchophyllus	0000f88502
Erigeron maniopotamicus	0001000000
Erigeron mariposanus	0000380000
Erigeron miser	0000400000
Erigeron multiceps	0000000500
Erigeron nivalis	0600000000
Erigeron oxyphyllus	8000000000
Erigeron parishii	0000000400
Erigeron petrophilus	002b4b0804
Erigeron petrophilus var. petrophilus	0028030800
Erigeron petrophilus var. sierrensis	0000480000
Erigeron petrophilus var. viscidulus	000b000004
Erigeron philadelphicus	bfffffdd07
Erigeron philadelphicus subsp. philadelphicus	bfffffdd07
Erigeron philadelphicus var. philadelphicus	bfffffdd07
Erigeron pumilus	0602400006
Erigeron pumilus subsp. intermedius	0602400006
Erigeron pumilus var. intermedius	0602400006
Erigeron pygmaeus	0000840002
Erigeron reductus	0029400800
Erigeron reductus var. angustatus	0028000800
Erigeron reductus var. reductus	0001400000
Erigeron robustior	0020000000
Erigeron sanctarum	0900020000
Erigeron serpentinus	0020000000
Erigeron strigosus	1ffdfbff01
Erigeron strigosus subsp. strigosus	1ffdfbff01
Erigeron strigosus var. strigosus	1ffdfbff01
Erigeron sumatrensis	1bfd0b0a00
Erigeron supplex	0004000000
Erigeron tener	0003c00106
Erigeron uncialis	6000000002
Erigeron uncialis subsp. uncialis	6000000002
Erigeron uncialis var. uncialis	6000000002
Erigeron utahensis	4000000000
Erigeron vagus	0000800002
Eriobotrya japonica	0000000800
Eriochloa acuminata	98c0007601
Eriochloa acuminata var. acuminata	98c0007601
Eriochloa aristata	8000000000
Eriochloa aristata var. aristata	8000000000
Eriochloa contracta	98c0007601
Eriodictyon altissimum	0000020000
Eriodictyon angustifolium	4000000000
Eriodictyon californicum	073dfbab00
Eriodictyon capitatum	0100020001
Eriodictyon crassifolium	00c002d001
Eriodictyon crassifolium subsp. crassifolium	00c0005001
Eriodictyon crassifolium var. crassifolium	00c0005001
Eriodictyon crassifolium var. nigrescens	008002d001
Eriodictyon lobbii	0403400004
Eriodictyon parryi	c04022d501
Eriodictyon tomentosum	0000030000
Eriodictyon traskiae	1000020001
Eriodictyon traskiae subsp. smithii	0000020001
Eriodictyon traskiae subsp. traskiae	1000000000
Eriodictyon trichocalyx	a0c0005400
Eriodictyon trichocalyx subsp. lanatum	8040004000
Eriodictyon trichocalyx subsp. trichocalyx	a0c0005400
Eriodictyon trichocalyx var. lanatum	8040004000
Eriodictyon trichocalyx var. trichocalyx	a0c0005400
Eriogonum alpinum	0001000000
Eriogonum ampullaceum	0000040000
Eriogonum angulosum	614033bc01
Eriogonum apiculatum	4040000400
Eriogonum apricum	0000080000
Eriogonum apricum var. apricum	0000080000
Eriogonum apricum var. prostratum	0000080000
Eriogonum arborescens	19c0035c01
Eriogonum argillosum	0000010800
Eriogonum baileyi	60023f9407
Eriogonum baileyi subsp. baileyi	60023f9407
Eriogonum baileyi var. baileyi	60023f9407
Eriogonum baileyi var. praebens	0002040006
Eriogonum bifurcatum	6000000000
Eriogonum brachyanthum	6000040002
Eriogonum brachypodum	6000040002
Eriogonum breedlovei	0000000100
Eriogonum breedlovei var. breedlovei	0000000100
Eriogonum breedlovei var. shevockii	0000000100
Eriogonum butterworthianum	0000020000
Eriogonum caespitosum	0002040006
Eriogonum callistum	0000008000
Eriogonum cedrorum	0020000000
Eriogonum cernuum	0002c40006
Eriogonum cinereum	19c0035c01
Eriogonum cithariforme	0000031401
Eriogonum cithariforme var. agninum	0000030001
Eriogonum cithariforme var. cithariforme	0000031401
Eriogonum clavatum	f9c0075c03
Eriogonum collinum	0002000004
Eriogonum compositum	063d000000
Eriogonum compositum var. compositum	063d000000
Eriogonum congdonii	0401000000
Eriogonum contiguum	6000000000
Eriogonum covilleanum	0100030801
Eriogonum crocatum	0000000001
Eriogonum dasyanthemum	0038000000
Eriogonum davidsonii	78c0045403
Eriogonum deflexum	e00004b503
Eriogonum deflexum subsp. baratum	600000b501
Eriogonum deflexum subsp. deflexum	e000000000
Eriogonum deflexum var. baratum	600000b501
Eriogonum deflexum var. deflexum	e000000000
Eriogonum deflexum var. nevadense	0000040002
Eriogonum deserticola	8000000000
Eriogonum diclinum	0001000000
Eriogonum douglasii	0403400004
Eriogonum douglasii var. meridionale	0403400004
Eriogonum eastwoodianum	0000010000
Eriogonum elatum	ffffffff07
Eriogonum elatum subsp. elatum	ffffffff07
Eriogonum elatum subsp. villosum	0603480004
Eriogonum elatum var. elatum	ffffffff07
Eriogonum elatum var. villosum	0603480004
Eriogonum elegans	0000030801
Eriogonum elongatum	19c0035c01
Eriogonum elongatum var. elongatum	19c0035c01
Eriogonum eremicola	4000000002
Eriogonum esmeraldense	0000840002
Eriogonum esmeraldense var. esmeraldense	0000840002
Eriogonum evanidum	0040004400
Eriogonum exaltatum	6000000000
Eriogonum fasciculatum	f9fd275d03
Eriogonum fasciculatum subsp. fasciculatum	0100000000
Eriogonum fasciculatum subsp. flavoviride	e000000000
Eriogonum fasciculatum subsp. foliolosum	f9fd035c01
Eriogonum fasciculatum subsp. polifolium	e0c0251503
Eriogonum fasciculatum var. fasciculatum	0100000000
Eriogonum fasciculatum var. flavoviride	e000000000
Eriogonum fasciculatum var. foliolosum	f9fd035c01
Eriogonum fasciculatum var. polifolium	e0c0251503
Eriogonum giganteum	19c0035c01
Eriogonum giganteum subsp. compactum	1000000000
Eriogonum giganteum subsp. giganteum	19c0035c01
Eriogonum giganteum var. compactum	1000000000
Eriogonum giganteum var. formosum	1000000000
Eriogonum giganteum var. giganteum	19c0035c01
Eriogonum gilmanii	4000000000
Eriogonum glandulosum	4000000000
Eriogonum gossypinum	0000202000
Eriogonum gracile	1ffdfbff01
Eriogonum gracile var. gracile	1ffdfbff01
Eriogonum gracile var. incultum	0040004000
Eriogonum gracilipes	0000800102
Eriogonum gracillimum	0000231501
Eriogonum grande	1900030800
Eriogonum grande subsp. grande	1900030800
Eriogonum grande subsp. rubescens	0900030800
Eriogonum grande subsp. timorum	1000000000
Eriogonum grande var. grande	1900030800
Eriogonum grande var. rubescens	0900030800
Eriogonum grande var. timorum	1000000000
Eriogonum heermannii	4000879503
Eriogonum heermannii subsp. argense	4000000000
Eriogonum heermannii subsp. floccosum	4000000000
Eriogonum heermannii subsp. heermannii	0000029501
Eriogonum heermannii subsp. humilius	4000840102
Eriogonum heermannii subsp. sulcatum	4000000000
Eriogonum heermannii var. argense	4000000000
Eriogonum heermannii var. floccosum	4000000000
Eriogonum heermannii var. heermannii	0000029501
Eriogonum heermannii var. humilius	4000840102
Eriogonum heermannii var. occidentale	0000010000
Eriogonum heermannii var. sulcatum	4000000000
Eriogonum heracleoides	0000000004
Eriogonum heracleoides var. heracleoides	0000000004
Eriogonum hirtellum	0001000000
Eriogonum hirtiflorum	013dfb9d01
Eriogonum hoffmannii	4000000000
Eriogonum hoffmannii subsp. hoffmannii	4000000000
Eriogonum hoffmannii subsp. robustius	4000000000
Eriogonum hoffmannii var. hoffmannii	4000000000
Eriogonum hoffmannii var. robustius	4000000000
Eriogonum hookeri	0000040002
Eriogonum incanum	0000c00100
Eriogonum inerme	0138b38901
Eriogonum inerme subsp. hispidulum	0000b08100
Eriogonum inerme subsp. inerme	0138030801
Eriogonum inerme var. hispidulum	0000b08100
Eriogonum inerme var. inerme	0138030801
Eriogonum inflatum	e002040006
Eriogonum intrafractum	4000000000
Eriogonum kelloggii	0020000000
Eriogonum kennedyi	4000b41503
Eriogonum kennedyi subsp. austromontanum	0000000401
Eriogonum kennedyi subsp. kennedyi	0000000401
Eriogonum kennedyi subsp. purpusii	4000b40102
Eriogonum kennedyi var. alpigenum	0000001400
Eriogonum kennedyi var. austromontanum	0000000401
Eriogonum kennedyi var. kennedyi	0000000401
Eriogonum kennedyi var. pinicola	0000200000
Eriogonum kennedyi var. purpusii	4000b40102
Eriogonum latens	4000800102
Eriogonum latifolium	0104000000
Eriogonum libertini	0019000000
Eriogonum lobbii	063ffc8106
Eriogonum luteolum	073df80800
Eriogonum luteolum var. caninum	0110000800
Eriogonum luteolum var. luteolum	063d000800
Eriogonum luteolum var. pedunculatum	0000380000
Eriogonum luteolum var. saltuarium	0000c00000
Eriogonum maculatum	0002241507
Eriogonum marifolium	0401c00000
Eriogonum marifolium var. cupulatum	0400000000
Eriogonum marifolium var. marifolium	0401c00000
Eriogonum mensicola	4000000002
Eriogonum microthecum	6002c41506
Eriogonum microthecum subsp. ambiguum	0002c40106
Eriogonum microthecum subsp. laxiflorum	0002c40106
Eriogonum microthecum var. alpinum	0000c40000
Eriogonum microthecum var. ambiguum	0002c40106
Eriogonum microthecum var. corymbosoides	0000000400
Eriogonum microthecum var. johnstonii	0000001400
Eriogonum microthecum var. lacus-ursi	0000000400
Eriogonum microthecum var. lapidicola	0000000002
Eriogonum microthecum var. laxiflorum	0002c40106
Eriogonum microthecum var. panamintense	4000000002
Eriogonum microthecum var. schoolcraftii	0002000004
Eriogonum microthecum var. simpsonii	6000040002
Eriogonum mohavense	6000000000
Eriogonum molestum	0040004401
Eriogonum nervulosum	0018000000
Eriogonum nidularium	e002040006
Eriogonum nortonii	0000030000
Eriogonum nudum	677fffff07
Eriogonum nudum subsp. nudum	063df88900
Eriogonum nudum subsp. pauciflorum	0040005401
Eriogonum nudum var. auriculatum	013d030800
Eriogonum nudum var. decurrens	0000000800
Eriogonum nudum var. deductum	0002c40106
Eriogonum nudum var. indictum	0000010000
Eriogonum nudum var. murinum	0000200000
Eriogonum nudum var. nudum	063df88900
Eriogonum nudum var. oblongifolium	063d480000
Eriogonum nudum var. paralinum	0004000000
Eriogonum nudum var. pauciflorum	0040005401
Eriogonum nudum var. psychicola	0000002200
Eriogonum nudum var. pubiflorum	063dfa8b00
Eriogonum nudum var. regirivum	0000200000
Eriogonum nudum var. scapigerum	0000800100
Eriogonum nudum var. westonii	6100279d03
Eriogonum nummulare	0002040006
Eriogonum nutans	0002400004
Eriogonum nutans var. glabratum	0000400000
Eriogonum nutans var. nutans	0002400004
Eriogonum ochrocephalum	0002000004
Eriogonum ochrocephalum subsp. ochrocephalum	0002000004
Eriogonum ochrocephalum var. ochrocephalum	0002000004
Eriogonum ordii	0000218001
Eriogonum ovalifolium	0403c40506
Eriogonum ovalifolium subsp. eximium	0000400000
Eriogonum ovalifolium subsp. ovalifolium	0002c40106
Eriogonum ovalifolium subsp. vineum	0000000400
Eriogonum ovalifolium var. caelestinum	0000800000
Eriogonum ovalifolium var. depressum	0002000004
Eriogonum ovalifolium var. eximium	0000400000
Eriogonum ovalifolium var. monarchense	0000000100
Eriogonum ovalifolium var. nivale	0400c00102
Eriogonum ovalifolium var. ovalifolium	0002c40106
Eriogonum ovalifolium var. purpureum	0403c40106
Eriogonum ovalifolium var. vineum	0000000400
Eriogonum palmerianum	e000040002
Eriogonum panamintense	4000000002
Eriogonum parishii	0040205503
Eriogonum parvifolium	0180000000
Eriogonum pendulum	0001000000
Eriogonum plumatella	e000000000
Eriogonum polycladon	6000000000
Eriogonum polypodum	0000000100
Eriogonum prattenianum	0000d80100
Eriogonum prattenianum var. avium	0000800100
Eriogonum prattenianum var. prattenianum	0000d80000
Eriogonum prociduum	0002000004
Eriogonum pusillum	e002050007
Eriogonum pyrolifolium	0401000000
Eriogonum pyrolifolium var. coryphaeum	0001000000
Eriogonum pyrolifolium var. pyrolifolium	0400000000
Eriogonum reniforme	e000000000
Eriogonum rixfordii	6000000000
Eriogonum rosense	0000c40000
Eriogonum rosense var. rosense	0000c40000
Eriogonum roseum	013d3b9c01
Eriogonum rupinum	0000000002
Eriogonum saxatile	59c0275d03
Eriogonum shockleyi	4000040002
Eriogonum shockleyi subsp. shockleyi	4000040002
Eriogonum shockleyi var. shockleyi	4000040002
Eriogonum siskiyouense	0001000000
Eriogonum spectabile	0400000000
Eriogonum spergulinum	040afe9507
Eriogonum spergulinum subsp. reddingianum	040afe9507
Eriogonum spergulinum subsp. spergulinum	0000f88100
Eriogonum spergulinum var. pratense	0000000100
Eriogonum spergulinum var. reddingianum	040afe9507
Eriogonum spergulinum var. spergulinum	0000f88100
Eriogonum sphaerocephalum	0402400004
Eriogonum sphaerocephalum subsp. halimioides	0402400004
Eriogonum sphaerocephalum subsp. sphaerocephalum	0002400004
Eriogonum sphaerocephalum var. halimioides	0402400004
Eriogonum sphaerocephalum var. sphaerocephalum	0002400004
Eriogonum strictum	062b480004
Eriogonum strictum subsp. proliferum	062b400004
Eriogonum strictum var. anserinum	0602480004
Eriogonum strictum var. greenei	0001000000
Eriogonum strictum var. proliferum	062b400004
Eriogonum temblorense	0000010000
Eriogonum ternatum	0029000000
Eriogonum thomasii	e000000000
Eriogonum thornei	4000000000
Eriogonum thurberi	e040000000
Eriogonum trichopes	e000000000
Eriogonum tripodum	0010180000
Eriogonum truncatum	0000000a00
Eriogonum twisselmannii	0000000100
Eriogonum umbellatum	673bffdd07
Eriogonum umbellatum subsp. bahiiforme	0110030800
Eriogonum umbellatum subsp. covillei	0000800102
Eriogonum umbellatum subsp. dumosum	061b480004
Eriogonum umbellatum subsp. minus	0000001400
Eriogonum umbellatum subsp. munzii	0000005401
Eriogonum umbellatum subsp. polyanthum	0000000000
Eriogonum umbellatum subsp. subaridum	4000241503
Eriogonum umbellatum subsp. versicolor	4000000002
Eriogonum umbellatum var. ahartii	0000080000
Eriogonum umbellatum var. argus	0009000000
Eriogonum umbellatum var. bahiiforme	0110030800
Eriogonum umbellatum var. canifolium	4000000100
Eriogonum umbellatum var. chlorothamnus	6000040102
Eriogonum umbellatum var. covillei	0000800102
Eriogonum umbellatum var. dichrocephalum	0000000006
Eriogonum umbellatum var. dumosum	061b480004
Eriogonum umbellatum var. furcosum	0000c00100
Eriogonum umbellatum var. glaberrimum	0000000004
Eriogonum umbellatum var. goodmanii	0001000000
Eriogonum umbellatum var. humistratum	0401000000
Eriogonum umbellatum var. juniporinum	4000000000
Eriogonum umbellatum var. lautum	0001000000
Eriogonum umbellatum var. minus	0000001400
Eriogonum umbellatum var. modocense	0602480004
Eriogonum umbellatum var. munzii	0000005401
Eriogonum umbellatum var. nelsoniorum	0001000000
Eriogonum umbellatum var. nevadense	6002fc8106
Eriogonum umbellatum var. polyanthum	0000000000
Eriogonum umbellatum var. smallianum	0030000000
Eriogonum umbellatum var. speciosum	0001000000
Eriogonum umbellatum var. subaridum	4000241503
Eriogonum umbellatum var. torreyanum	0000400000
Eriogonum umbellatum var. versicolor	4000000002
Eriogonum ursinum	0601480000
Eriogonum ursinum var. erubescens	0001000000
Eriogonum ursinum var. ursinum	0600480000
Eriogonum vestitum	0000010000
Eriogonum vimineum	0603400004
Eriogonum viridescens	6000033401
Eriogonum wrightii	fffdffdd03
Eriogonum wrightii subsp. membranaceum	18c0005401
Eriogonum wrightii subsp. nodosum	e040000000
Eriogonum wrightii subsp. subscaposum	4140ff9d03
Eriogonum wrightii subsp. trachygonum	063d080000
Eriogonum wrightii subsp. wrightii	6000000000
Eriogonum wrightii var. membranaceum	18c0005401
Eriogonum wrightii var. nodosum	e040000000
Eriogonum wrightii var. olanchense	0000000100
Eriogonum wrightii var. subscaposum	4140ff9d03
Eriogonum wrightii var. trachygonum	063d080000
Eriogonum wrightii var. wrightii	6000000000
Erioneuron pilosum	4000040002
Eriophorum crinigerum	063dc00100
Eriophorum gracile	0600c00800
Eriophyllum ambiguum	e000248002
Eriophyllum ambiguum var. ambiguum	0000208000
Eriophyllum ambiguum var. paleaceum	e000248002
Eriophyllum confertiflorum	b9f8fbdd01
Eriophyllum confertiflorum var. confertiflorum	b9f8fbdd01
Eriophyllum confertiflorum var. tanacetiflorum	0000180000
Eriophyllum congdonii	0000100000
Eriophyllum jepsonii	0000010800
Eriophyllum lanatum	073fde8f06
Eriophyllum lanatum var. achilleoides	043b0a0804
Eriophyllum lanatum var. arachnoideum	0124000800
Eriophyllum lanatum var. croceum	0000c00100
Eriophyllum lanatum var. grandiflorum	0639d80200
Eriophyllum lanatum var. hallii	0000028000
Eriophyllum lanatum var. integrifolium	040bc40006
Eriophyllum lanatum var. lanceolatum	0009000000
Eriophyllum lanatum var. obovatum	0000000500
Eriophyllum lanosum	e000000000
Eriophyllum latilobum	0000000800
Eriophyllum mohavense	6000000000
Eriophyllum multicaule	00c0037000
Eriophyllum nubigenum	0000800000
Eriophyllum pringlei	e000279403
Eriophyllum staechadifolium	0904000000
Eriophyllum wallacei	e040045c02
Erodium botrys	1ffdfbff01
Erodium brachycarpum	1ffdfbff01
Erodium cicutarium	ffffffff07
Erodium cygnorum	0080000000
Erodium malacoides	0080002800
Erodium moschatum	1ffdfbff01
Erodium texanum	e0c0006000
Eruca vesicaria	8600032200
Eruca vesicaria subsp. sativa	8600032200
Erucastrum gallicum	0000000800
Eryngium alismifolium	0402400000
Eryngium aristulatum	00fc024a00
Eryngium aristulatum subsp. aristulatum	003c000a00
Eryngium aristulatum subsp. parishii	00c0004000
Eryngium aristulatum var. aristulatum	003c000a00
Eryngium aristulatum var. hooveri	0000020800
Eryngium aristulatum var. parishii	00c0004000
Eryngium armatum	01a4000a00
Eryngium articulatum	0623000204
Eryngium castrense	0200182a00
Eryngium constancei	0038000000
Eryngium jepsonii	0010002a00
Eryngium mathiasiae	0402000004
Eryngium pendletonense	0080000000
Eryngium pinnatisectum	0000180000
Eryngium racemosum	0000082000
Eryngium spinosepalum	0000202000
Eryngium vaseyi	00000a2200
Eryngium vaseyi var. vallicola	0000082200
Eryngium vaseyi var. vaseyi	0000020000
Erysimum ammophilum	0900000000
Erysimum capitatum	ffffffff07
Erysimum capitatum subsp. capitatum	ffffffff07
Erysimum capitatum var. capitatum	ffffffff07
Erysimum capitatum var. purshii	0000040002
Erysimum cheiranthoides	0000f8a300
Erysimum cheiri	1000000001
Erysimum concinnum	0104000000
Erysimum franciscanum	0104000800
Erysimum insulare	0800000000
Erysimum menziesii	0104000000
Erysimum perenne	0401c40100
Erysimum repandum	0002002004
Erysimum suffrutescens	0180000000
Erysimum teretifolium	0000000800
Erythronium californicum	0439000000
Erythronium citrinum	0001000000
Erythronium citrinum var. citrinum	0001000000
Erythronium citrinum var. roderickii	0001000000
Erythronium grandiflorum	0039000000
Erythronium grandiflorum subsp. grandiflorum	0039000000
Erythronium grandiflorum var. grandiflorum	0039000000
Erythronium helenae	0010000000
Erythronium hendersonii	0001000000
Erythronium klamathense	0401000000
Erythronium multiscapideum	0200180000
Erythronium oregonum	0020000000
Erythronium pluriflorum	0000800000
Erythronium purpurascens	0409c00000
Erythronium pusaterii	0000000100
Erythronium revolutum	0025000000
Erythronium taylorii	0000800000
Erythronium tuolumnense	0000100000
Eschscholzia caespitosa	01fcfbff01
Eschscholzia californica	7fffffff07
Eschscholzia glyptosperma	e000000000
Eschscholzia hypecoides	0000010000
Eschscholzia lemmonii	00003b8001
Eschscholzia lemmonii subsp. kernensis	0000008001
Eschscholzia lemmonii subsp. lemmonii	00003b8000
Eschscholzia lemmonii var. lemmonii	00003b8000
Eschscholzia lobbii	0000382200
Eschscholzia minutiflora	e000060002
Eschscholzia parishii	e000000000
Eschscholzia ramosa	1800000000
Eschscholzia rhombipetala	0000002800
Eucalyptus camaldulensis	09e0027e01
Eucalyptus citriodora	0080000000
Eucalyptus cladocalyx	01c0004000
Eucalyptus conferruminata	0180000000
Eucalyptus globulus	19e0037e01
Eucalyptus polyanthemos	1180022801
Eucalyptus pulchella	0000000800
Eucalyptus sideroxylon	0980020001
Eucalyptus tereticornis	08c0027401
Eucalyptus viminalis	01e0024000
Eucephalus breweri	0401c00500
Eucephalus engelmannii	0009000000
Eucephalus glabratus	0011000000
Eucephalus ledophyllus	0039000000
Eucephalus ledophyllus var. covillei	0039000000
Eucephalus tomentellus	0011000000
Eucephalus vialis	0001000000
Euchiton gymnocephalus	0021000000
Euchiton involucratus	0020000000
Euchiton sphaericus	0029000000
Euclidium syriacum	0002000004
Eucnide rupestris	8000000000
Eucnide urens	e000000000
Eucrypta chrysanthemifolia	f9c027fc03
Eucrypta chrysanthemifolia var. bipinnatifida	e040248402
Eucrypta chrysanthemifolia var. chrysanthemifolia	19c023fc01
Eucrypta micrantha	e000044002
Eulobus californicus	f8e0037401
Euonymus occidentalis	057d434800
Euonymus occidentalis subsp. occidentalis	053d430800
Euonymus occidentalis subsp. parishii	0040004000
Euonymus occidentalis var. occidentalis	053d430800
Euonymus occidentalis var. parishii	0040004000
Euphorbia crenulata	1ffdfbff01
Euphorbia cyathophora	0080000000
Euphorbia davidii	0000000200
Euphorbia dendroides	0080000001
Euphorbia dentata	0100002000
Euphorbia eriantha	8000000000
Euphorbia exstipulata	4000000000
Euphorbia exstipulata var. exstipulata	4000000000
Euphorbia helioscopia	00a4000800
Euphorbia lathyris	0184002200
Euphorbia lurida	18c0005401
Euphorbia misera	9080000000
Euphorbia oblongata	0000002a00
Euphorbia peplus	9ffdfbff01
Euphorbia schizoloba	4000000002
Euphorbia spathulata	1ffdfbff01
Euphorbia terracina	0080000000
Euphorbia virgata	0607000004
Euphrosyne acerosa	2000000000
Euphrosyne nevadensis	0000040002
Eurybia integrifolia	0600f88100
Eurybia merita	0001000000
Eurybia radulina	0e3ddb0800
Eustoma exaltatum	80c0004000
Eustoma exaltatum subsp. exaltatum	80c0004000
Euthamia occidentalis	ffffffff07
Fagonia laevis	e000000000
Fagonia pachyacantha	8000000000
Fallopia baldschuanica	0080000800
Fallopia convolvulus	1ffffbff05
Fallopia japonica	1ffdfbff01
Fallopia sachalinensis	0084000800
Fallugia paradoxa	4000000000
Fendlerella utahensis	4000000002
Ferocactus cylindraceus	e000000000
Ferocactus viridescens	0080000000
Festuca arundinacea	1ffdfbff03
Festuca brachyphylla	0000840102
Festuca brachyphylla subsp. breviculmis	0000840102
Festuca bromoides	7ffdfbff01
Festuca californica	073ddb0c00
Festuca elmeri	013d030800
Festuca idahoensis	073fdb0804
Festuca kingii	0002040506
Festuca microstachys	ffffffff07
Festuca minutiflora	0000800002
Festuca myuros	fffdfbff01
Festuca occidentalis	077ffbc904
Festuca octoflora	ffffffff07
Festuca perennis	5ffdfbff01
Festuca pratensis	1fffffff07
Festuca rubra	073ddb1c03
Festuca saximontana	0000800502
Festuca subulata	063dd80000
Festuca subuliflora	0025400800
Festuca temulenta	fffffbff05
Festuca trachyphylla	0020400000
Festuca viridula	0001400000
Ficus carica	0080382a00
Filago pyramidata	0110000800
Filago pyramidata var. pyramidata	0110000800
Fimbristylis autumnalis	0000000200
Fimbristylis thermalis	6000021402
Fimbristylis vahlii	8000202000
Flaveria trinervia	0080000000
Floerkea proserpinacoides	040bc00104
Foeniculum vulgare	1ffdfbff03
Forestiera pubescens	6050a7dd03
Fouquieria splendens	8000000000
Fouquieria splendens subsp. splendens	8000000000
Fragaria chiloensis	0104000000
Fragaria vesca	077dfbcd00
Fragaria virginiana	0403c00104
Frangula californica	7bfdffdf03
Frangula californica subsp. californica	59fd035c01
Frangula californica subsp. crassifolia	0011000000
Frangula californica subsp. cuspidata	6040b4d503
Frangula californica subsp. occidentalis	0021080000
Frangula californica subsp. tomentella	1af97b5e01
Frangula californica subsp. ursina	4000000400
Frangula purshiana	062dd80000
Frangula purshiana subsp. annonifolia	0601d80000
Frangula purshiana subsp. purshiana	002d000000
Frangula purshiana subsp. ultramafica	0000480000
Frangula rubra	060bc00004
Frangula rubra subsp. modocensis	0602000004
Frangula rubra subsp. obtusissima	0609c00000
Frangula rubra subsp. rubra	0609c00000
Frangula rubra subsp. yosemitana	0000800000
Frankenia palmeri	0080000000
Frankenia pulverulenta	0080000000
Frankenia salina	7980042202
Frasera albicaulis	063b480004
Frasera albicaulis subsp. nitida	063b480004
Frasera albicaulis var. modocensis	0402000004
Frasera albicaulis var. nitida	063b480004
Frasera albomarginata	4000000000
Frasera albomarginata var. albomarginata	4000000000
Frasera albomarginata var. induta	4000000000
Frasera neglecta	0000021401
Frasera parryi	00c0005400
Frasera puberulenta	0000800102
Frasera speciosa	0009c00104
Frasera tubulosa	0000200100
Frasera umpquaensis	0001000000
Fraxinus anomala	4000000000
Fraxinus dipetala	0378bb5d01
Fraxinus latifolia	063ff8ab04
Fraxinus parryi	0040000000
Fraxinus velutina	60c0245503
Freesia leichtlinii subsp. alba	0180000800
Fremontodendron californicum	0670fbdd01
Fremontodendron decumbens	0000080000
Fremontodendron mexicanum	0040000000
Fritillaria affinis	073d0a0800
Fritillaria agrestis	01203b2a00
Fritillaria atropurpurea	4603fc8106
Fritillaria biflora	19fc035c01
Fritillaria biflora var. biflora	19fc035c01
Fritillaria biflora var. ineziana	0000000800
Fritillaria brandegeei	0000208100
Fritillaria eastwoodiae	0600000000
Fritillaria falcata	0000010800
Fritillaria gentneri	0400000000
Fritillaria glauca	0039000000
Fritillaria liliacea	0100030a00
Fritillaria micrantha	0000f88100
Fritillaria ojaiensis	0000000001
Fritillaria pinetorum	0000809401
Fritillaria pluriflora	0010080200
Fritillaria pudica	0603480004
Fritillaria purdyi	003d000000
Fritillaria recurva	063df88100
Fritillaria striata	0000200000
Fritillaria viridea	0000030000
Fumaria capreolata	0100000000
Fumaria officinalis	19c0035c01
Fumaria parviflora	0180000000
Funastrum crispum	0040000000
Funastrum cynanchoides	e0c0004000
Funastrum cynanchoides var. hartwegii	e0c0004000
Funastrum hirtellum	e000000000
Funastrum utahense	e000000000
Gaillardia aristata	1ec0f8d501
Gaillardia pulchella	18c2385c05
Galinsoga parviflora	19c0845403
Galinsoga parviflora var. parviflora	19c0845403
Galium ambiguum	0029080000
Galium ambiguum subsp. ambiguum	0009080000
Galium ambiguum subsp. siskiyouense	0021000000
Galium ambiguum var. ambiguum	0009080000
Galium ambiguum var. siskiyouense	0021000000
Galium andrewsii	0050335c01
Galium andrewsii subsp. andrewsii	0050235401
Galium andrewsii subsp. gatense	0000010800
Galium andrewsii subsp. intermedium	0010121001
Galium andrewsii var. andrewsii	0050235401
Galium andrewsii var. gatense	0000010800
Galium angustifolium	d8c0235501
Galium angustifolium subsp. angustifolium	10c0235501
Galium angustifolium subsp. borregoense	8000000000
Galium angustifolium subsp. foliosum	0800000000
Galium angustifolium subsp. gabrielense	0000001000
Galium angustifolium subsp. gracillimum	c000004400
Galium angustifolium subsp. jacinticum	0000004000
Galium angustifolium subsp. nudicaule	0000001400
Galium angustifolium subsp. onycense	0000000100
Galium angustifolium var. angustifolium	10c0235501
Galium angustifolium var. foliosum	0800000000
Galium angustifolium var. onycense	0000000100
Galium aparine	7fffffff07
Galium argense	4000000000
Galium bifolium	441bc40105
Galium bolanderi	061b798004
Galium boreale	0403800004
Galium buxifolium	0800000000
Galium californicum	09b00b5801
Galium californicum subsp. californicum	0130030800
Galium californicum subsp. flaccidum	0800021001
Galium californicum subsp. luciense	0000020000
Galium californicum subsp. maritimum	0100020000
Galium californicum subsp. miguelense	0800000000
Galium californicum subsp. primum	0080004000
Galium californicum subsp. sierrae	0000080000
Galium californicum var. californicum	0130030800
Galium californicum var. miguelense	0800000000
Galium catalinense	1000000000
Galium catalinense subsp. acrispum	1000000000
Galium catalinense subsp. catalinense	1000000000
Galium catalinense var. catalinense	1000000000
Galium clementis	0000020000
Galium cliftonsmithii	0000020001
Galium divaricatum	0020180800
Galium glabrescens	0401000004
Galium glabrescens subsp. glabrescens	0401000000
Galium glabrescens subsp. modocense	0000000004
Galium grande	0000001000
Galium grayanum	0409400000
Galium grayanum subsp. grayanum	0409400000
Galium grayanum var. grayanum	0409400000
Galium grayanum var. nanum	0008000000
Galium hallii	0000001501
Galium hardhamiae	0000020000
Galium hilendiae	6000000000
Galium hilendiae subsp. carneum	4000000000
Galium hilendiae subsp. hilendiae	6000000000
Galium hilendiae subsp. kingstonense	4000000000
Galium hypotrichium	4000840102
Galium hypotrichium subsp. hypotrichium	0000840102
Galium hypotrichium subsp. inyoense	0000000100
Galium hypotrichium subsp. subalpinum	0000000100
Galium hypotrichium subsp. tomentellum	4000000000
Galium hypotrichium var. hypotrichium	0000840102
Galium hypotrichium var. tomentellum	4000000000
Galium jepsonii	0000001400
Galium johnstonii	0000001400
Galium magnifolium	4000000000
Galium matthewsii	6000c00102
Galium mexicanum	042b800004
Galium mexicanum subsp. asperulum	042b800004
Galium mexicanum var. asperulum	042b800004
Galium mollugo	0021000800
Galium multiflorum	4002440006
Galium munzii	4000000000
Galium murale	00d0182a00
Galium muricatum	0028000000
Galium nuttallii	18c0004001
Galium nuttallii subsp. insulare	1800000000
Galium nuttallii subsp. nuttallii	00c0004001
Galium nuttallii var. nuttallii	00c0004001
Galium oreganum	0001000000
Galium parishii	4040001400
Galium parisiense	00f9fb8901
Galium porrigens	0bf9fbdf01
Galium porrigens var. porrigens	09f1fbdf01
Galium porrigens var. tenue	02b9f98900
Galium proliferum	4000000000
Galium serpenticum	0001000004
Galium serpenticum subsp. scotticum	0001000000
Galium serpenticum subsp. warnerense	0000000004
Galium sparsiflorum	0218f88100
Galium sparsiflorum subsp. glabrius	0218000000
Galium sparsiflorum subsp. sparsiflorum	0000f88100
Galium stellatum	e000000000
Galium tricornutum	00385a2a00
Galium trifidum	1ffdfbff07
Galium trifidum subsp. columbianum	1ffdfbff03
Galium trifidum subsp. subbiflorum	0401c04504
Galium trifidum var. subbiflorum	0401c04504
Galium triflorum	053ffb8d04
Galium wrightii	4000000000
Gambelia speciosa	1000000000
Gamochaeta calviceps	0040087800
Gamochaeta coarctata	0020082000
Gamochaeta pensylvanica	01c0007401
Gamochaeta stachydifolia	0000080200
Gamochaeta stagnalis	00c0004000
Gamochaeta ustulata	19fd136800
Garrya buxifolia	003d000000
Garrya congdonii	003d180800
Garrya elliptica	01240a0a00
Garrya flavescens	59fdfbdd01
Garrya fremontii	067dc84a04
Garrya veatchii	18c0025401
Gastridium phleoides	1ffffbff05
Gaudinia fragilis	0020000000
Gaultheria humifusa	0401c00100
Gaultheria ovatifolia	0409400000
Gaultheria shallon	0125020800
Gayophytum decipiens	4002c01506
Gayophytum diffusum	067ffcd507
Gayophytum diffusum subsp. diffusum	0600400404
Gayophytum diffusum subsp. parviflorum	067ffcd507
Gayophytum diffusum var. diffusum	0600400404
Gayophytum eriospermum	0000f88100
Gayophytum heterozygum	0449c2d505
Gayophytum humile	067dfbd505
Gayophytum oligospermum	0040005401
Gayophytum racemosum	0400c08105
Gayophytum ramosissimum	04024c0006
Gazania linearis	01c0004800
Genista canariensis	0080000001
Genista linifolia	1020021000
Genista maderensis	00000a0800
Genista monosperma	0040001000
Genista monspessulana	1270420801
Gentiana affinis	0505000804
Gentiana affinis var. ovata	0505000804
Gentiana calycosa	0401c00100
Gentiana fremontii	0000000400
Gentiana newberryi	0401c00102
Gentiana newberryi var. newberryi	0401400000
Gentiana newberryi var. tiogana	0000c00102
Gentiana plurisetosa	0021000000
Gentiana prostrata	0000000002
Gentiana sceptrum	0024000000
Gentiana setigera	0020000000
Gentianella amarella	0401c00502
Gentianella amarella subsp. acuta	0401c00502
Gentianella amarella var. acuta	0401c00502
Gentianopsis holopetala	0000800102
Gentianopsis simplex	0409c00500
Geraea canescens	e000000000
Geraea viscida	0040000000
Geranium aequale	0080000000
Geranium bicknellii	0080000000
Geranium californicum	00c0c45501
Geranium carolinianum	1fffbb7e01
Geranium columbinum	0004000000
Geranium core-core	01e4080801
Geranium dissectum	1ffdfbff01
Geranium lucidum	0100000000
Geranium molle	1ffdfbff01
Geranium oreganum	0425000000
Geranium palmatum	0100000000
Geranium potentilloides	0100000800
Geranium purpureum	0130000800
Geranium pusillum	0104240802
Geranium pyrenaicum	0100000000
Geranium richardsonii	0000c05505
Geranium robertianum	0104000800
Geranium rotundifolium	0100031000
Geranium solanderi	0004000000
Geranium texanum	0100000000
Geranium viscosissimum	0403000004
Geum aleppicum	0402000004
Geum macrophyllum	043fc40506
Geum macrophyllum subsp. macrophyllum	0004000000
Geum macrophyllum subsp. perincisum	043bc40506
Geum macrophyllum var. macrophyllum	0004000000
Geum macrophyllum var. perincisum	043bc40506
Geum triflorum	0403c40006
Geum triflorum var. ciliatum	0403c40006
Gilia achilleifolia	1090030801
Gilia achilleifolia subsp. achilleifolia	0000030800
Gilia achilleifolia subsp. multicaulis	1090030801
Gilia achilleifolia var. achilleifolia	0000030800
Gilia aliquanta	6000201500
Gilia aliquanta subsp. aliquanta	6000201500
Gilia aliquanta subsp. breviloba	6000000000
Gilia angelensis	19c0035c01
Gilia austro-occidentalis	0000032001
Gilia brecciarum	6002849506
Gilia brecciarum subsp. brecciarum	4002049506
Gilia brecciarum subsp. neglecta	6000808100
Gilia cana	6000840503
Gilia cana subsp. bernardina	2000000400
Gilia cana subsp. cana	6000840100
Gilia cana subsp. speciformis	6000000100
Gilia cana subsp. speciosa	6000000100
Gilia cana subsp. triceps	6000000103
Gilia capitata	1ffdfbff01
Gilia capitata subsp. abrotanifolia	184033d501
Gilia capitata subsp. capitata	063d000800
Gilia capitata subsp. chamissonis	0100000000
Gilia capitata subsp. mediomontana	0000d80000
Gilia capitata subsp. pacifica	0025000000
Gilia capitata subsp. pedemontana	0200f82200
Gilia capitata subsp. staminea	0090002a00
Gilia capitata subsp. tomentosa	0114000000
Gilia capitata var. capitata	063d000800
Gilia clivorum	19f8034801
Gilia clokeyi	6000040002
Gilia diegensis	a040005400
Gilia inconspicua	0002040006
Gilia interior	0000208001
Gilia jacens	6000018001
Gilia latiflora	6000219401
Gilia latiflora subsp. cuyamensis	0000210001
Gilia latiflora subsp. davyi	6000010001
Gilia latiflora subsp. elongata	6000000000
Gilia latiflora subsp. latiflora	6000009401
Gilia latiflora var. latiflora	6000009401
Gilia leptantha	2000239501
Gilia leptantha subsp. leptantha	0000000400
Gilia leptantha subsp. pinetorum	0000038001
Gilia leptantha subsp. purpusii	0000200100
Gilia leptantha subsp. transversa	2000001400
Gilia malior	600005a003
Gilia millefoliata	0104000000
Gilia minor	6000033001
Gilia modocensis	4002069407
Gilia nevinii	1800000000
Gilia ochroleuca	e0c023d503
Gilia ochroleuca subsp. bizonata	6040235401
Gilia ochroleuca subsp. exilis	e0c0005400
Gilia ochroleuca subsp. ochroleuca	6000000102
Gilia ochroleuca subsp. vivida	0000009000
Gilia ophthalmoides	4000040002
Gilia salticola	0002c40106
Gilia scopulorum	e000040002
Gilia sinuata	6002264007
Gilia stellata	e000000002
Gilia tenuiflora	0900030000
Gilia tenuiflora subsp. amplifaucalis	0000010000
Gilia tenuiflora subsp. arenaria	0100000000
Gilia tenuiflora subsp. hoffmannii	0800000000
Gilia tenuiflora subsp. tenuiflora	0100030000
Gilia tenuiflora var. tenuiflora	0100030000
Gilia transmontana	6000060003
Gilia tricolor	623c3b2a00
Gilia tricolor subsp. diffusa	6234392a00
Gilia tricolor subsp. tricolor	02383b2a00
Gilia yorkii	0000000100
Gilmania luteola	6000000000
Githopsis diffusa	0a793b5c01
Githopsis diffusa subsp. candida	0040004000
Githopsis diffusa subsp. diffusa	0840235401
Githopsis diffusa subsp. filicaulis	0040000000
Githopsis diffusa subsp. robusta	02391b0800
Githopsis pulchella	0600d80000
Githopsis pulchella subsp. campestris	0600d80000
Githopsis pulchella subsp. pulchella	0000d80000
Githopsis pulchella subsp. serpentinicola	0000180000
Githopsis pulchella var. glabra	0000180000
Githopsis pulchella var. pulchella	0000d80000
Githopsis specularioides	06b9f98b00
Githopsis tenella	0000010100
Glaucium flavum	19c0035c01
Glaux maritima	0104042a02
Glebionis coronaria	19c0035c01
Glebionis segetum	0184000000
Glechoma hederacea	01bd3b0800
Gleditsia triacanthos	0040004200
Glehnia littoralis	0004000000
Glehnia littoralis subsp. leiocarpa	0004000000
Glehnia littoralis var. leiocarpa	0004000000
Glinus lotoides	00f8027a01
Glinus radiatus	0040004200
Glossopetalon pungens	4000000000
Glossopetalon spinescens	4001000502
Glossopetalon spinescens var. aridum	4001000502
Glyceria X occidentalis	013d400a00
Glyceria borealis	0639f88104
Glyceria declinata	06b8382200
Glyceria elata	003df8c504
Glyceria fluitans	0414000000
Glyceria grandis	003cfc8102
Glyceria leptostachya	053d000800
Glyceria striata	1ffffbff05
Glycyrrhiza glabra	0080000200
Glycyrrhiza lepidota	ffffffff07
Glyptopleura marginata	6002040106
Glyptopleura setulosa	6000000000
Gnaphalium palustre	ffffffff07
Goodmania luteola	6000042002
Goodyera oblongifolia	073ffb0904
Gossypium hirsutum	8000000200
Gratiola ebracteata	1ff7fbff05
Gratiola heterosepala	0612182204
Gratiola neglecta	0407c00004
Grayia spinosa	e002c4a107
Grevillea robusta	00c0024000
Grindelia X paludosa	0000002200
Grindelia camporum	7af87efe03
Grindelia fraxinipratensis	6000000000
Grindelia hallii	0040000000
Grindelia hirsutula	0138032a00
Grindelia nana	0602000004
Grindelia squarrosa	6402c41507
Grindelia squarrosa var. serrulata	6402c41507
Grindelia stricta	1984000000
Grindelia stricta subsp. stricta	0004000000
Grindelia stricta var. angustifolia	0100000000
Grindelia stricta var. platyphylla	1984000000
Grindelia stricta var. stricta	0004000000
Grusonia parishii	6000040002
Grusonia pulchella	0000040002
Guilleminea densa	0180000000
Guilleminea densa var. aggregata	0180000000
Gunnera tinctoria	0100000000
Gutierrezia californica	01d0037801
Gutierrezia microcephala	e0c0044402
Gutierrezia sarothrae	e0c0004001
Gymnosteris parvula	0002c40006
Gypsophila elegans	0000802201
Gypsophila paniculata	6592c62006
Gypsophila scorzonerifolia	0000040002
Hackelia amethystina	0008400000
Hackelia bella	0009000000
Hackelia brevicula	0000000002
Hackelia californica	040a400004
Hackelia cusickii	0002000004
Hackelia floribunda	0002c40106
Hackelia micrantha	040bc40104
Hackelia mundula	0001c00100
Hackelia nervosa	0400c00000
Hackelia setosa	0023400004
Hackelia sharsmithii	0000000100
Hackelia velutina	0000c00100
Hainardia cylindrica	0184082a00
Halimodendron halodendron	0080002200
Halimolobos jaegeri	6000000002
Halogeton glomeratus	6602040006
Harmonia doris-nilesiae	0001000000
Harmonia guggolziorum	0010000000
Harmonia hallii	0010000000
Harmonia nutans	0038000000
Harmonia stebbinsii	0011000000
Harpagonella palmeri	80c0004000
Hastingsia alba	063d400000
Hastingsia serpentinicola	043d000000
Hazardia brickellioides	6000000000
Hazardia cana	1000000000
Hazardia detonsa	0800000000
Hazardia orcuttii	0080000000
Hazardia squarrosa	18c0027401
Hazardia squarrosa var. grindelioides	18c0025401
Hazardia squarrosa var. obtusa	0000002001
Hazardia squarrosa var. squarrosa	0000020000
Hazardia stenolepis	0000030000
Hazardia whitneyi	003df88100
Hazardia whitneyi var. discoidea	003d000000
Hazardia whitneyi var. whitneyi	0000f88100
Hecastocleis shockleyi	4000040002
Hedeoma drummondii	4000000000
Hedeoma nana	4000000000
Hedeoma nana subsp. californica	4000000000
Hedeoma nana var. californica	4000000000
Hedera canariensis	18c4001c01
Hedera helix	01fc403e01
Hedychium flavescens	0100000000
Hedypnois cretica	9be43b7e01
Helenium amarum	0000002800
Helenium amarum var. amarum	0000002800
Helenium autumnale	0007000004
Helenium bigelovii	0779fbff01
Helenium bolanderi	0004000000
Helenium puberulum	05793b2a01
Helianthella californica	0679f88104
Helianthella californica subsp. californica	0038000000
Helianthella californica subsp. nevadensis	0650f88104
Helianthella californica subsp. shastensis	0601000000
Helianthella californica var. californica	0038000000
Helianthella californica var. nevadensis	0650f88104
Helianthella californica var. shastensis	0601000000
Helianthella castanea	0100000800
Helianthemum greenei	1800000000
Helianthemum scoparium	19f85b7c01
Helianthus annuus	ffffffff07
Helianthus bolanderi	07393b2a01
Helianthus californicus	19f8b37e01
Helianthus ciliaris	6180002200
Helianthus cusickii	0603000004
Helianthus exilis	0039000000
Helianthus gracilentus	18f803dc01
Helianthus inexpectatus	0000000001
Helianthus niveus	8000000000
Helianthus niveus subsp. tephrodes	8000000000
Helianthus nuttallii	78c2045407
Helianthus nuttallii subsp. nuttallii	6002041406
Helianthus nuttallii subsp. parishii	18c0005401
Helianthus nuttallii var. nuttallii	6002041406
Helianthus petiolaris	98c0005c01
Helianthus petiolaris subsp. canescens	8000000000
Helianthus petiolaris subsp. petiolaris	18c0005c01
Helianthus petiolaris var. canescens	8000000000
Helianthus petiolaris var. petiolaris	18c0005c01
Helichrysum petiolare	0180000000
Heliomeris multiflora	4000040002
Heliomeris multiflora var. nevadensis	4000040002
Heliotropium amplexicaule	0080000000
Heliotropium convolvulaceum	e000000000
Heliotropium convolvulaceum var. californicum	e000000000
Heliotropium curassavicum	fff67fff07
Heliotropium curassavicum subsp. oculatum	fff67fff07
Heliotropium curassavicum var. oculatum	fff67fff07
Heliotropium europaeum	0102182a04
Helminthotheca echioides	19fd0b7e01
Hemieva ranunculifolia	0001000000
Hemitomes congestum	0425420900
Hemizonella minima	067bfadd05
Hemizonia congesta	013d0a2a00
Hemizonia congesta subsp. calyculata	0038000000
Hemizonia congesta subsp. clevelandii	0039080200
Hemizonia congesta subsp. congesta	0130000800
Hemizonia congesta subsp. lutescens	0124000800
Hemizonia congesta subsp. luzulifolia	01300a2a00
Hemizonia congesta subsp. tracyi	0024000000
Heracleum maximum	1fffffff07
Herissantia crispa	8000000000
Herniaria hirsuta	00d178fa00
Herniaria hirsuta subsp. cinerea	008020a800
Herniaria hirsuta subsp. hirsuta	0051587200
Herniaria hirsuta var. cinerea	008020a800
Herniaria hirsuta var. hirsuta	0051587200
Hesperevax acaulis	02713b2b00
Hesperevax acaulis var. acaulis	00003a2a00
Hesperevax acaulis var. ambusticola	00501b2900
Hesperevax acaulis var. robustior	02313a2200
Hesperevax caulescens	02502a2200
Hesperevax sparsiflora	197c132a00
Hesperevax sparsiflora var. brevifolia	0104000000
Hesperevax sparsiflora var. sparsiflora	1978132a00
Hesperidanthus jaegeri	0000000002
Hesperis matronalis	0001400000
Hesperocallis undulata	e000000000
Hesperochiron californicus	6403c48507
Hesperochiron pumilus	2413c48107
Hesperocnide tenella	19d43b5c01
Hesperocyparis abramsiana	0000000800
Hesperocyparis abramsiana var. abramsiana	0000000800
Hesperocyparis abramsiana var. butanoensis	0000000800
Hesperocyparis bakeri	0403400004
Hesperocyparis forbesii	18c0001401
Hesperocyparis goveniana	0100000000
Hesperocyparis macnabiana	0238080000
Hesperocyparis macrocarpa	0184000000
Hesperocyparis nevadensis	0000200100
Hesperocyparis pygmaea	0004000000
Hesperocyparis sargentii	0038030800
Hesperocyparis stephensonii	0040000000
Hesperolinon adenophyllum	0038000000
Hesperolinon bicarpellatum	0010000000
Hesperolinon breweri	0010000800
Hesperolinon californicum	0210090800
Hesperolinon clevelandii	0010000800
Hesperolinon congestum	0000000800
Hesperolinon didymocarpum	0010000000
Hesperolinon disjunctum	0010010800
Hesperolinon drymarioides	0010000000
Hesperolinon micranthum	1ffdfbff01
Hesperolinon spergulinum	0038000800
Hesperolinon tehamense	0010000000
Hesperomecon linearis	010033a800
Hesperoyucca whipplei	38c0275503
Heteranthemis viscidihirta	0100000000
Heteranthera dubia	0006000204
Heteranthera limosa	0000000200
Heterocodon rariflorum	1ffdfbff01
Heteromeles arbutifolia	19fdfb7e01
Heteropogon contortus	8080000000
Heterotheca grandiflora	f9fd3bfe01
Heterotheca monarchensis	0000200100
Heterotheca oregona	073d5b2800
Heterotheca oregona var. compacta	073d5b2800
Heterotheca oregona var. oregona	073d030800
Heterotheca oregona var. rudis	073d0b0800
Heterotheca oregona var. scaberrima	0100032800
Heterotheca sessiliflora	e1c433fc01
Heterotheca sessiliflora subsp. bolanderi	0104000800
Heterotheca sessiliflora subsp. echioides	01c033fc01
Heterotheca sessiliflora subsp. fastigiata	e040005401
Heterotheca sessiliflora subsp. sessiliflora	0180000000
Heterotheca sessiliflora var. echioides	01c033fc01
Heterotheca sessiliflora var. fastigiata	e040005401
Heterotheca sessiliflora var. sessiliflora	0180000000
Heterotheca shevockii	0000200000
Heterotheca subaxillaris	8080008000
Heterotheca subaxillaris subsp. latifolia	8080008000
Heterotheca subaxillaris var. latifolia	8080008000
Heterotheca villosa	4402c00004
Heterotheca villosa var. minor	0402c00004
Heterotheca villosa var. scabra	4000000000
Heuchera abramsii	0000001000
Heuchera brevistaminea	0040000000
Heuchera caespitosa	0000021501
Heuchera cylindrica	0002000004
Heuchera hirsutissima	0040004000
Heuchera maxima	0800000000
Heuchera merriamii	0001000000
Heuchera micrantha	053dc20900
Heuchera parishii	0000000400
Heuchera parvifolia	0000040002
Heuchera pilosissima	0104020001
Heuchera rubescens	4040c44106
Hibiscus denudatus	8000000000
Hibiscus lasiocarpos	0200002200
Hibiscus lasiocarpos var. occidentalis	0200002200
Hibiscus trionum	1ffdfbff01
Hieracium albiflorum	1ffdfbff05
Hieracium argutum	0880121401
Hieracium aurantiacum	0000080000
Hieracium bolanderi	0039000000
Hieracium greenei	0409000000
Hieracium horridum	0403c45506
Hieracium nudicaule	0400c00100
Hieracium parryi	0001000000
Hieracium scouleri	040b400004
Hieracium triste	0401c00100
Hilaria jamesii	6000040002
Hilaria rigida	e040004000
Hippuris vulgaris	043ff8cd04
Hirschfeldia incana	67d53b6a00
Hoffmannseggia glauca	e080022001
Hoffmannseggia microphylla	8000040002
Hoita macrostachya	1ffdfbff01
Hoita orbicularis	1ffdfbdd01
Hoita strobilina	0000000800
Holcus lanatus	7fffffff07
Holcus mollis	0004400800
Hollisteria lanata	0000012000
Holmgrenanthe petrophila	2000000000
Holocarpha heermannii	000033a801
Holocarpha macradenia	0100000800
Holocarpha obconica	0000212800
Holocarpha virgata	02d01b2a00
Holocarpha virgata subsp. elongata	00c0000000
Holocarpha virgata subsp. virgata	02d01b2a00
Holodiscus discolor	5d7fc77f07
Holodiscus discolor subsp. discolor	197dc37b01
Holodiscus discolor var. discolor	197dc37b01
Holodiscus discolor var. glabrescens	040a000004
Holodiscus discolor var. microphyllus	4000c45502
Holosteum umbellatum	0703000004
Holosteum umbellatum subsp. umbellatum	0703000004
Holozonia filipes	02231a2a04
Hordeum arizonicum	8200800200
Hordeum brachyantherum	1fffffff07
Hordeum brachyantherum subsp. brachyantherum	1fffffff07
Hordeum brachyantherum subsp. californicum	1fffffff07
Hordeum depressum	7ffdfbff01
Hordeum intercedens	18c0026000
Hordeum jubatum	ffffffff07
Hordeum jubatum subsp. jubatum	ffffffff07
Hordeum jubatum var. jubatum	ffffffff07
Hordeum marinum	fffffbff05
Hordeum marinum subsp. gussoneanum	fffffbff05
Hordeum murinum	fffeffff07
Hordeum murinum subsp. glaucum	f9fefbff05
Hordeum murinum subsp. leporinum	fffeffff07
Hordeum murinum subsp. murinum	8500038a00
Hordeum vulgare	1ffdfbff01
Horkelia bolanderi	0010000000
Horkelia californica	013cb30d00
Horkelia californica subsp. californica	0104000000
Horkelia californica subsp. frondosa	0100030800
Horkelia californica var. californica	0104000000
Horkelia californica var. elata	0038b00d00
Horkelia californica var. frondosa	0100030800
Horkelia clevelandii	0040004000
Horkelia clevelandii var. clevelandii	0040004000
Horkelia congesta	0001000000
Horkelia congesta subsp. nemorosa	0001000000
Horkelia congesta var. nemorosa	0001000000
Horkelia cuneata	01c0024000
Horkelia cuneata subsp. cuneata	0180020000
Horkelia cuneata subsp. puberula	00c0024000
Horkelia cuneata subsp. sericea	0100000000
Horkelia cuneata var. cuneata	0180020000
Horkelia cuneata var. puberula	00c0024000
Horkelia cuneata var. sericea	0100000000
Horkelia daucifolia	0611000000
Horkelia daucifolia subsp. daucifolia	0401000000
Horkelia daucifolia var. daucifolia	0401000000
Horkelia daucifolia var. indicta	0210000000
Horkelia fusca	0603c40104
Horkelia fusca subsp. parviflora	0001c40100
Horkelia fusca subsp. pseudocapitata	0000000004
Horkelia fusca subsp. tenella	0400000000
Horkelia fusca var. brownii	0602000000
Horkelia fusca var. parviflora	0001c40100
Horkelia fusca var. pseudocapitata	0000000004
Horkelia fusca var. tenella	0400000000
Horkelia hendersonii	0001000000
Horkelia hispidula	0000000002
Horkelia howellii	0001000000
Horkelia marinensis	0104000000
Horkelia parryi	0000180000
Horkelia rydbergii	0000001401
Horkelia sericata	0001000000
Horkelia tenuiloba	0024000800
Horkelia tridentata	063bf88104
Horkelia tridentata subsp. flavescens	0039400000
Horkelia tridentata subsp. tridentata	0602f88104
Horkelia tridentata var. flavescens	0039400000
Horkelia tridentata var. tridentata	0602f88104
Horkelia truncata	0040004000
Horkelia tularensis	0000000100
Horkelia wilderae	0000000400
Horkelia yadonii	0000020000
Horkeliella congdonis	0000840002
Horkeliella purpurascens	0000000100
Hornungia procumbens	fffe3fff07
Horsfordia alata	8000000000
Horsfordia newberryi	8040004000
Hosackia crassifolia	04fbfb9d05
Hosackia crassifolia var. crassifolia	04fbfb9d05
Hosackia crassifolia var. otayensis	0040000000
Hosackia gracilis	0124020800
Hosackia incana	0000d80000
Hosackia oblongifolia	7fffffff07
Hosackia oblongifolia var. cuprea	00000c0102
Hosackia oblongifolia var. oblongifolia	7ffffbff05
Hosackia pinnata	0739c80000
Hosackia rosea	0024400000
Hosackia stipularis	073ddb0100
Hosackia stipularis subsp. stipularis	013c030000
Hosackia stipularis var. ottleyi	0601d80100
Hosackia stipularis var. stipularis	013c030000
Hosackia yollabolliensis	0008000000
Howellia aquatilis	0008000000
Hulsea algida	0000c40102
Hulsea brevifolia	0000800100
Hulsea californica	0040000000
Hulsea heterochroma	4040fb9d01
Hulsea mexicana	0040000000
Hulsea nana	0403000004
Hulsea vestita	4040841503
Hulsea vestita subsp. callicarpha	0040000000
Hulsea vestita subsp. gabrielensis	0000001001
Hulsea vestita subsp. inyoensis	4000040002
Hulsea vestita subsp. parryi	4000001400
Hulsea vestita subsp. pygmaea	0000000500
Hulsea vestita subsp. vestita	0000840100
Hulsea vestita var. callicarpha	0040000000
Hulsea vestita var. pygmaea	0000000500
Hulsea vestita var. vestita	0000840100
Humulus lupulus	06a0d81001
Hydrilla verticillata	e090180200
Hydrocotyle ranunculoides	3be4037e01
Hydrocotyle umbellata	38c0887601
Hydrocotyle verticillata	e1e0fb3e03
Hydrophyllum capitatum	0402400004
Hydrophyllum capitatum var. alpinum	0402400004
Hydrophyllum fendleri	0001000000
Hydrophyllum fendleri var. albifrons	0001000000
Hydrophyllum occidentale	043df88b00
Hydrophyllum tenuipes	0025000000
Hymenopappus filifolius	4040005403
Hymenopappus filifolius var. eriopodus	4000000000
Hymenopappus filifolius var. lugens	0040005401
Hymenopappus filifolius var. megacephalus	4000000000
Hymenopappus filifolius var. nanus	0000000002
Hymenothrix loomisii	18c0385401
Hymenothrix wrightii	0040000000
Hymenoxys cooperi	4000040002
Hymenoxys hoopesii	0001fc8104
Hymenoxys lemmonii	0003040006
Hymenoxys odorata	8000000000
Hyparrhenia hirta	0080000000
Hypericum anagalloides	077ff87f04
Hypericum androsaemum	0000000800
Hypericum calycinum	0120800800
Hypericum canariense	0180000000
Hypericum concinnum	0239d80a00
Hypericum hookerianum	0004000000
Hypericum mutilum	0000080200
Hypericum mutilum subsp. mutilum	0000080200
Hypericum mutilum var. mutilum	0000080200
Hypericum perforatum	077ffb4b04
Hypericum perforatum subsp. perforatum	077ffb4b04
Hypericum scouleri	047ffadd05
Hypochaeris glabra	1ffdfbff01
Hypochaeris radicata	1ffd4b5e01
Hyptis emoryi	e000000000
Iberis umbellata	0040004000
Idahoa scapigera	06126d0806
Ilex aquifolium	0104000800
Iliamna bakeri	060b000004
Iliamna latibracteata	0405000000
Iliamna rivularis	0004000000
Impatiens balfourii	0184000800
Impatiens capensis	0000000800
Impatiens glandulifera	0004000000
Imperata brevifolia	e2a0203401
Ionactis alpina	0000040006
Ipheion uniflorum	18c0007e01
Ipomoea cairica	0000020000
Ipomoea hederacea	1ffdfbff01
Ipomoea indica	0180000800
Ipomoea purpurea	0180000200
Ipomoea triloba	8000000000
Ipomopsis aggregata	040bc40106
Ipomopsis aggregata subsp. aggregata	040bc40006
Ipomopsis aggregata subsp. bridgesii	0000c00100
Ipomopsis aggregata var. aggregata	040bc40006
Ipomopsis arizonica	4000000000
Ipomopsis congesta	0403c40006
Ipomopsis congesta subsp. congesta	0403c40004
Ipomopsis congesta subsp. montana	0402c40006
Ipomopsis congesta var. congesta	0403c40004
Ipomopsis effusa	0040000000
Ipomopsis polycladon	6002040006
Ipomopsis tenuifolia	8040000000
Ipomopsis tenuituba	0402c40104
Iris bracteata	0001000000
Iris chrysophylla	0001000000
Iris douglasiana	013d030800
Iris fernaldii	0130000800
Iris foetidissima	0000000a00
Iris germanica	78c0095401
Iris hartwegii	0600f8d500
Iris hartwegii subsp. australis	0000005400
Iris hartwegii subsp. columbiana	0000800000
Iris hartwegii subsp. hartwegii	0600f88100
Iris hartwegii subsp. pinetorum	0600d80000
Iris hartwegii var. australis	0000005400
Iris hartwegii var. hartwegii	0600f88100
Iris innominata	0001000000
Iris longipetala	0124000800
Iris macrosiphon	0039180800
Iris missouriensis	007bfdd507
Iris munzii	0000200100
Iris pseudacorus	01901b3e01
Iris purdyi	0020000000
Iris tenax	0001000000
Iris tenax subsp. klamathensis	0001000000
Iris tenuissima	043d080000
Iris tenuissima subsp. purdyiformis	0400000000
Iris tenuissima subsp. tenuissima	003d080000
Iris tenuissima var. purdyiformis	0400000000
Iris tenuissima var. tenuissima	003d080000
Iris thompsonii	0005000000
Isatis tinctoria	0603400004
Isocoma acradenia	e10003a400
Isocoma acradenia subsp. acradenia	6000032400
Isocoma acradenia subsp. eremophila	e000018000
Isocoma acradenia var. acradenia	6000032400
Isocoma acradenia var. bracteosa	6100012000
Isocoma acradenia var. eremophila	e000018000
Isocoma arguta	0000000200
Isocoma menziesii	19c0034a00
Isocoma menziesii subsp. menziesii	10c0004000
Isocoma menziesii var. decumbens	10c0000000
Isocoma menziesii var. diabolica	0000010800
Isocoma menziesii var. menziesii	10c0004000
Isocoma menziesii var. sedoides	0980000000
Isocoma menziesii var. vernonioides	1980030a00
Isoetes bolanderi	0409c00d04
Isoetes echinospora	0001400000
Isoetes howellii	06f93b6a00
Isoetes nuttallii	07fafaeb04
Isoetes occidentalis	0001c00100
Isoetes orcuttii	01d0406b00
Isolepis carinata	0124000800
Isolepis cernua	0184002a00
Isolepis levynsiana	0004000000
Isolepis setacea	0004480000
Iva axillaris	65c2e77f07
Iva hayesiana	00c0000000
Ivesia aperta	0002400004
Ivesia aperta var. aperta	0002400004
Ivesia aperta var. canina	0000400000
Ivesia argyrocoma	0000000400
Ivesia argyrocoma var. argyrocoma	0000000400
Ivesia arizonica	4000000000
Ivesia arizonica var. arizonica	4000000000
Ivesia baileyi	0002c00104
Ivesia baileyi subsp. baileyi	0002c00104
Ivesia baileyi var. baileyi	0002c00104
Ivesia baileyi var. beneolens	0000000004
Ivesia callida	0000004000
Ivesia campestris	0000000100
Ivesia gordonii	0409c40006
Ivesia gordonii var. alpicola	0409c00000
Ivesia gordonii var. ursinorum	0001c40006
Ivesia jaegeri	4000000000
Ivesia kingii	0000040000
Ivesia kingii var. kingii	0000040000
Ivesia longibracteata	0001000000
Ivesia lycopodioides	0000c40102
Ivesia lycopodioides subsp. lycopodioides	0000c40000
Ivesia lycopodioides subsp. megalopetala	0000800100
Ivesia lycopodioides subsp. scandularis	0000800102
Ivesia lycopodioides var. lycopodioides	0000c40000
Ivesia lycopodioides var. megalopetala	0000800100
Ivesia lycopodioides var. scandularis	0000800102
Ivesia muirii	0000800100
Ivesia paniculata	0002000004
Ivesia patellifera	4000000000
Ivesia pickeringii	0001000000
Ivesia pygmaea	0000800100
Ivesia santolinoides	0000c05501
Ivesia saxosa	4040044502
Ivesia sericoleuca	0002400004
Ivesia shockleyi	0000c00002
Ivesia shockleyi var. shockleyi	0000c00002
Ivesia unguiculata	0000800100
Ivesia webberi	0002400004
Ixia maculata	0000000800
Jacaranda mimosifolia	0080000000
Jamesia americana	4000800102
Jamesia americana var. rosea	4000800102
Jaumea carnosa	0184000000
Jensia rammii	0000480000
Jensia yosemitana	0000c00100
Jepsonia heterandra	0000182000
Jepsonia malvifolia	1800000000
Jepsonia parryi	00c0004000
Johanneshowellia puberula	4000000000
Juglans californica	00c0025001
Juglans hindsii	0010002a00
Juglans regia	19e0037e01
Juncus acuminatus	0215482a00
Juncus acutus	9180000001
Juncus acutus subsp. leopoldii	9180000001
Juncus ambiguus	1b86003800
Juncus anthelatus	0020000000
Juncus articulatus	66256a2e00
Juncus articulatus subsp. articulatus	66256a2e00
Juncus articulatus var. articulatus	66256a2e00
Juncus balticus	ffffff7f07
Juncus balticus subsp. ater	ffffff7f07
Juncus bolanderi	053d000800
Juncus brachyphyllus	0402780004
Juncus breweri	0184000000
Juncus bryoides	0440c75503
Juncus bufonius	ffffffff07
Juncus bufonius var. bufonius	ffffffff07
Juncus bufonius var. congestus	0bf8037f01
Juncus bufonius var. occidentalis	ffffffff07
Juncus capillaris	0000c00100
Juncus capitatus	033c182a00
Juncus chlorocephalus	0000d80000
Juncus confusus	0411c00004
Juncus cooperi	e000000000
Juncus covillei	073df89d01
Juncus cyperoides	0000400000
Juncus diffusissimus	0000000200
Juncus digitatus	0200080000
Juncus drummondii	0601f88100
Juncus dubius	6260c25a00
Juncus dudleyi	0003400000
Juncus duranii	0000005400
Juncus effusus	87fdfbff01
Juncus effusus subsp. austrocalifornicus	80c0005401
Juncus effusus subsp. effusus	0400480200
Juncus effusus subsp. pacificus	073dfbab00
Juncus effusus subsp. solutus	0000002200
Juncus effusus var. effusus	0400480200
Juncus effusus var. pacificus	073dfbab00
Juncus effusus var. solutus	0000002200
Juncus ensifolius	073ffc9507
Juncus exiguus	0639c00100
Juncus falcatus	0104000000
Juncus falcatus subsp. falcatus	0100000000
Juncus falcatus subsp. sitchensis	0004000000
Juncus falcatus var. falcatus	0100000000
Juncus falcatus var. sitchensis	0004000000
Juncus gerardii	0100000000
Juncus gerardii subsp. gerardii	0100000000
Juncus gerardii var. gerardii	0100000000
Juncus hemiendytus	063ffc8504
Juncus hemiendytus var. abjectus	0402c40104
Juncus hemiendytus var. hemiendytus	063ff88504
Juncus hesperius	0105020000
Juncus howellii	0409400000
Juncus interior	4000000000
Juncus kelloggii	03380b0a00
Juncus laccatus	042dc00000
Juncus leiospermus	0212082204
Juncus leiospermus var. ahartii	0000002200
Juncus leiospermus var. leiospermus	0212080204
Juncus lescurii	0104000000
Juncus longistylis	0040c05507
Juncus luciensis	0442425405
Juncus macrandrus	0000c45503
Juncus macrophyllus	40c0221501
Juncus marginatus	0200080000
Juncus mertensianus	0409c40106
Juncus mexicanus	ffffffff07
Juncus nevadensis	041fcc1506
Juncus nevadensis var. inventus	0004000000
Juncus nevadensis var. nevadensis	041bcc1506
Juncus nodosus	4000001102
Juncus occidentalis	07fddb0a01
Juncus orthophyllus	466acc5505
Juncus oxymeris	0270f8f701
Juncus parryi	0401f88502
Juncus patens	1bb90b0801
Juncus phaeocephalus	09e4004e00
Juncus phaeocephalus var. paniculatus	01c4004e00
Juncus phaeocephalus var. phaeocephalus	09a4000000
Juncus planifolius	0004000000
Juncus regelii	0001000000
Juncus rugulosus	c1c0225401
Juncus saximontanus	4403c45506
Juncus supiniformis	0004000000
Juncus tenuis	073ff83304
Juncus textilis	00c0025401
Juncus tiehmii	0442c25504
Juncus torreyi	e1c204f003
Juncus triformis	06c0f8c500
Juncus uncialis	0290122200
Juncus usitatus	0200082200
Juncus xiphioides	f9fcfbff03
Juniperus californica	40503b5e01
Juniperus communis	0401c00104
Juniperus communis subsp. depressa	0000c00100
Juniperus communis var. depressa	0000c00100
Juniperus communis var. jackii	0401000000
Juniperus communis var. saxatilis	0001c00104
Juniperus grandis	4008c41502
Juniperus occidentalis	0402000004
Juniperus osteosperma	4002041406
Justicia californica	8040000000
Kallstroemia californica	e000000000
Kallstroemia grandiflora	8000000000
Kallstroemia parviflora	6040000000
Kalmia polifolia	0401c00104
Keckiella antirrhinoides	e0c0005401
Keckiella antirrhinoides subsp. antirrhinoides	00c0005401
Keckiella antirrhinoides subsp. microphylla	e040000000
Keckiella antirrhinoides var. antirrhinoides	00c0005401
Keckiella antirrhinoides var. microphylla	e040000000
Keckiella breviflora	0010fb8b01
Keckiella breviflora subsp. breviflora	0000fb8901
Keckiella breviflora subsp. glabrisepala	0010f98300
Keckiella breviflora var. breviflora	0000fb8901
Keckiella breviflora var. glabrisepala	0010f98300
Keckiella cordifolia	18c0025401
Keckiella corymbosa	033d0b0a00
Keckiella lemmonii	003d480000
Keckiella rothrockii	4000844102
Keckiella rothrockii subsp. jacintensis	0000004000
Keckiella rothrockii subsp. rothrockii	4000840102
Keckiella rothrockii var. jacintensis	0000004000
Keckiella rothrockii var. rothrockii	4000840102
Keckiella ternata	004000d401
Keckiella ternata subsp. septentrionalis	0000008001
Keckiella ternata subsp. ternata	0040005400
Keckiella ternata var. septentrionalis	0000008001
Keckiella ternata var. ternata	0040005400
Kelloggia galioides	044bc04504
Kickxia elatine	1ffd3bfe01
Kickxia spuria	00f0197e01
Kniphofia uvaria	0104000000
Kobresia myosuroides	0000800000
Kochia americana	6002040006
Kochia californica	6000002000
Kochia scoparia	e682fcaf06
Kochia scoparia subsp. scoparia	e682fcaf06
Kochia scoparia var. scoparia	e682fcaf06
Koeberlinia spinosa	8000000000
Koeberlinia spinosa subsp. tenuispina	8000000000
Koeberlinia spinosa var. tenuispina	8000000000
Koeleria gerardii	1a903bb601
Koeleria macrantha	477fffdf07
Kopsiopsis hookeri	0038000800
Kopsiopsis strobilacea	067d485c01
Krameria bicolor	e000000000
Krameria erecta	e040000000
Krascheninnikovia lanata	600204a007
Kyhosia bolanderi	0401c00100
Kyllinga brevifolia	18c0007e01
Lactuca biennis	013d000000
Lactuca canadensis	0001480000
Lactuca ludoviciana	02ba000004
Lactuca saligna	19f90b5e01
Lactuca serriola	ffffffff07
Lactuca tatarica	0402800004
Lactuca tatarica subsp. pulchella	0402800004
Lactuca tatarica var. pulchella	0402800004
Lactuca virosa	0000020800
Ladeania lanceolata	0002040006
Laennecia coulteri	f9c0277c01
Lagophylla dichotoma	0000312000
Lagophylla glandulosa	0230382200
Lagophylla minor	0010080000
Lagophylla ramosissima	07fbfbbf05
Lagunaria patersonia	0080000000
Lagurus ovatus	0104000a00
Lamarckia aurea	19f03bdc01
Lamiastrum galeobdolon	0004000000
Lamium amplexicaule	1ffdfbff01
Lamium purpureum	0104000000
Landoltia punctata	0584002a00
Langloisia setosissima	e000040002
Langloisia setosissima subsp. punctata	6000040002
Langloisia setosissima subsp. setosissima	e000040002
Langloisia setosissima var. setosissima	e000040002
Lantana camara	0080000200
Lantana montevidensis	0080000800
Lappula redowskii	6002c44506
Lappula redowskii var. cupulata	6002040006
Lappula redowskii var. redowskii	4002c44506
Lappula squarrosa	0082000204
Lapsana communis	19fdf8ff01
Larrea tridentata	e08004e002
Lasiospermum bipinnatum	0080000000
Lastarriaea coriacea	19c0fbff01
Lasthenia burkei	0010000000
Lasthenia californica	03b53b2a01
Lasthenia californica subsp. bakeri	0104000000
Lasthenia californica subsp. californica	03b53b2a01
Lasthenia californica subsp. macrantha	0104000000
Lasthenia chrysantha	0000002200
Lasthenia conjugens	01a4000a00
Lasthenia coronaria	e0c0005401
Lasthenia debilis	6000310000
Lasthenia ferrisiae	0000002200
Lasthenia fremontii	0200082200
Lasthenia glaberrima	013a032a04
Lasthenia glabrata	69d023ea00
Lasthenia glabrata subsp. coulteri	69d023ea00
Lasthenia glabrata subsp. glabrata	0110232a00
Lasthenia glabrata var. coulteri	69d023ea00
Lasthenia glabrata var. glabrata	0110232a00
Lasthenia gracilis	7bf53bfe01
Lasthenia leptalea	0000020000
Lasthenia maritima	0104000000
Lasthenia microglossa	6050235e01
Lasthenia minor	01043b2200
Lasthenia platycarpha	0000002a00
Lathrocasis tenerrima	0000040002
Lathyrus angulatus	1ffdfbff01
Lathyrus biflorus	0008000000
Lathyrus brownii	0605d80000
Lathyrus cicera	1ffdfbff01
Lathyrus delnorticus	0001000000
Lathyrus glandulosus	0038000000
Lathyrus hirsutus	1ffdfbff01
Lathyrus hitchcockianus	6000000000
Lathyrus japonicus	0004000000
Lathyrus jepsonii	07394b2a00
Lathyrus jepsonii subsp. californicus	07394b2a00
Lathyrus jepsonii subsp. jepsonii	0100002200
Lathyrus jepsonii var. californicus	07394b2a00
Lathyrus jepsonii var. jepsonii	0100002200
Lathyrus lanszwertii	003bc40106
Lathyrus lanszwertii subsp. aridus	0003c00104
Lathyrus lanszwertii subsp. lanszwertii	0003040006
Lathyrus lanszwertii var. aridus	0003c00104
Lathyrus lanszwertii var. lanszwertii	0003040006
Lathyrus lanszwertii var. tracyi	0039000000
Lathyrus latifolius	1ffdfbff01
Lathyrus littoralis	0104000000
Lathyrus nevadensis	0639d80000
Lathyrus nevadensis subsp. nevadensis	0639d80000
Lathyrus nevadensis var. nevadensis	0639d80000
Lathyrus odoratus	1ffdfbff01
Lathyrus palustris	0004000000
Lathyrus polyphyllus	0039000000
Lathyrus rigidus	0002000004
Lathyrus sphaericus	1ffdfbff01
Lathyrus splendens	00c0000000
Lathyrus sulphureus	0039f88100
Lathyrus tingitanus	1ffdfbff01
Lathyrus torreyi	003c000800
Lathyrus vestitus	19fd035c01
Lathyrus vestitus subsp. alefeldii	10c0004000
Lathyrus vestitus subsp. ochropetalus	0025000000
Lathyrus vestitus subsp. vestitus	19fc035c01
Lathyrus vestitus var. alefeldii	10c0004000
Lathyrus vestitus var. ochropetalus	0025000000
Lathyrus vestitus var. vestitus	19fc035c01
Laurus nobilis	0080000000
Lavatera olbia	0080000000
Lavatera trimestris	0080000001
Layia carnosa	0104000000
Layia chrysanthemoides	0134032a00
Layia discoidea	0000010000
Layia fremontii	0220382200
Layia gaillardioides	0134030800
Layia glandulosa	e5c2e7fd07
Layia heterotricha	000023a001
Layia hieracioides	0100030801
Layia jonesii	0100020000
Layia leucopappa	000000a000
Layia munzii	0000002000
Layia pentachaeta	000039a001
Layia pentachaeta subsp. albida	000021a000
Layia pentachaeta subsp. pentachaeta	0000392001
Layia pentachaeta var. pentachaeta	0000392001
Layia platyglossa	39d4037e01
Layia septentrionalis	0010000200
Leersia oryzoides	1efdf8f701
Legenere limosa	0038002a00
Lemna aequinoctialis	8180082200
Lemna gibba	fffefbff05
Lemna minor	e1fe086a04
Lemna minuta	e1fcf9f900
Lemna trisulca	6602fc8706
Lemna turionifera	e7ffffe906
Lemna valdiviana	01fcfbcd00
Lens culinaris	0100030800
Leontodon saxatilis	033d082a00
Leontodon saxatilis subsp. longirostris	0304082a00
Leontodon saxatilis subsp. saxatilis	013d080800
Lepechinia calycina	03381a0801
Lepechinia cardiophylla	0040004000
Lepechinia fragrans	0880001001
Lepechinia ganderi	0040000000
Lepechinia rossii	0000000001
Lepidium acutidens	1ed2007605
Lepidium appelianum	ffffffff07
Lepidium campestre	0601480000
Lepidium chalepense	1fffffff07
Lepidium coronopus	8000000a00
Lepidium densiflorum	6683c42206
Lepidium dictyotum	60923d2207
Lepidium didymum	ffffffff07
Lepidium draba	1fffffff07
Lepidium flavum	e000040002
Lepidium fremontii	e000041502
Lepidium heterophyllum	0600000000
Lepidium jaredii	0000012000
Lepidium lasiocarpum	f8c0005403
Lepidium lasiocarpum subsp. lasiocarpum	f8c0005403
Lepidium lasiocarpum var. lasiocarpum	f8c0005403
Lepidium latifolium	1ffeffff07
Lepidium latipes	01bc012a00
Lepidium montanum	6402040006
Lepidium nitidum	ffffffff07
Lepidium oblongum	19c0005401
Lepidium oxycarpum	0100032a00
Lepidium perfoliatum	e612452206
Lepidium pinnatifidum	0180000000
Lepidium ramosissimum	0040005000
Lepidium strictum	1ffdfbff01
Lepidium thurberi	6000000000
Lepidium virginicum	ffffffff07
Lepidium virginicum subsp. menziesii	ffffffff07
Lepidium virginicum subsp. virginicum	e042c45507
Lepidium virginicum var. menziesii	ffffffff07
Lepidium virginicum var. virginicum	e042c45507
Lepidospartum latisquamum	4000001002
Lepidospartum squamatum	f9c03b7c01
Leptochloa dubia	0000000200
Leptochloa fusca	f9e2277e07
Leptochloa fusca subsp. fascicularis	e122042206
Leptochloa fusca subsp. uninervia	f9c2277e07
Leptochloa panicea	e000000000
Leptochloa panicea subsp. brachiata	e000000000
Leptochloa viscida	8000002000
Leptosiphon acicularis	003c000800
Leptosiphon ambiguus	0000012800
Leptosiphon androsaceus	0038000800
Leptosiphon aureus	e000000001
Leptosiphon aureus subsp. aureus	e000000001
Leptosiphon aureus subsp. decorus	6000000000
Leptosiphon bicolor	10383b0801
Leptosiphon bolanderi	063fd80904
Leptosiphon breviculus	6000001400
Leptosiphon ciliatus	1ffdfbff01
Leptosiphon croceus	0100000000
Leptosiphon filipes	0238380000
Leptosiphon floribundus	0040005400
Leptosiphon floribundus subsp. floribundus	0040005400
Leptosiphon floribundus subsp. glaber	0040004400
Leptosiphon floribundus subsp. hallii	0040000000
Leptosiphon grandiflorus	0104030800
Leptosiphon harknessii	063bc40106
Leptosiphon jepsonii	0038000000
Leptosiphon latisectus	0038000000
Leptosiphon lemmonii	98c0005401
Leptosiphon liniflorus	7ffdfbff01
Leptosiphon minimus	003d000000
Leptosiphon montanus	0000300000
Leptosiphon nudatus	0000008100
Leptosiphon nuttallii	0429040006
Leptosiphon nuttallii subsp. howellii	0009000000
Leptosiphon nuttallii subsp. nuttallii	0421000004
Leptosiphon nuttallii subsp. pubescens	0000040002
Leptosiphon oblanceolatus	0000000100
Leptosiphon pachyphyllus	0000c40102
Leptosiphon parviflorus	1ffdfbff01
Leptosiphon pygmaeus	11c03b7e01
Leptosiphon pygmaeus subsp. continentalis	01c03b7e01
Leptosiphon pygmaeus subsp. pygmaeus	1000000000
Leptosiphon rattanii	0008000000
Leptosiphon rosaceus	0100000000
Leptosiphon septentrionalis	0002040006
Leptosiphon serrulatus	0000200000
Leptospermum laevigatum	0100000000
Leptosyne bigelovii	e000239401
Leptosyne californica	e080213401
Leptosyne calliopsidea	6000013c01
Leptosyne douglasii	0000030801
Leptosyne gigantea	1980000000
Leptosyne hamiltonii	0000000800
Leptosyne maritima	0080000000
Leptosyne stillmanii	0010392a00
Lessingia arachnoidea	0000000800
Lessingia germanorum	0100000800
Lessingia glandulifera	78c0247d03
Lessingia glandulifera var. glandulifera	78c0047d03
Lessingia glandulifera var. peirsonii	0000200001
Lessingia glandulifera var. tomentosa	0040000000
Lessingia hololeuca	0038030a00
Lessingia leptoclada	0000f88100
Lessingia micradenia	0000000800
Lessingia micradenia var. glabrata	0000000800
Lessingia micradenia var. micradenia	0000000800
Lessingia nana	0200180200
Lessingia nemaclada	063df9ab00
Lessingia pectinata	0100332800
Lessingia pectinata var. pectinata	0100000000
Lessingia pectinata var. tenuipes	0000332800
Lessingia ramulosa	0038000800
Lessingia tenuis	0000030801
Lessingia virgata	0200080200
Leucanthemum lacustre	0104000000
Leucanthemum maximum	0400400000
Leucanthemum vulgare	0767c04a04
Leucocrinum montanum	0403000004
Leucojum aestivum	0080002200
Leucothoe davisiae	0401c00104
Lewisia X whiteae	0001000000
Lewisia brachycalyx	0040004400
Lewisia cantelovii	0401400100
Lewisia congdonii	0000900000
Lewisia cotyledon	0401000000
Lewisia cotyledon var. cotyledon	0401000000
Lewisia cotyledon var. heckneri	0001000000
Lewisia cotyledon var. howellii	0401000000
Lewisia disepala	0000800100
Lewisia glandulosa	0000840102
Lewisia kelloggii	0001f80100
Lewisia kelloggii subsp. hutchisonii	0001480000
Lewisia kelloggii subsp. kelloggii	0000b00100
Lewisia leeana	0609800000
Lewisia longipetala	0000c00000
Lewisia nevadensis	0449c45507
Lewisia oppositifolia	0001000000
Lewisia pygmaea	0409c40507
Lewisia rediviva	4019fddd03
Lewisia rediviva subsp. minor	4000015403
Lewisia rediviva subsp. rediviva	0019fd8902
Lewisia rediviva var. minor	4000015403
Lewisia rediviva var. rediviva	0019fd8902
Lewisia serrata	0000400000
Lewisia stebbinsii	0008000000
Lewisia triphylla	0409f88104
Libertia formosa	0000000800
Ligusticum apiifolium	012d000000
Ligusticum californicum	0405480000
Ligusticum grayi	0403c00104
Ligustrum japonicum	0080000000
Ligustrum lucidum	0084000600
Ligustrum ovalifolium	0104000200
Lilaeopsis masonii	0100002a00
Lilaeopsis occidentalis	0504000000
Lilium bolanderi	0001000000
Lilium columbianum	003d000000
Lilium humboldtii	1dc0435c01
Lilium humboldtii subsp. humboldtii	0400400000
Lilium humboldtii subsp. ocellatum	19c0035c01
Lilium humboldtii var. humboldtii	0400400000
Lilium humboldtii var. ocellatum	19c0035c01
Lilium kelleyanum	0000800100
Lilium kelloggii	0021000000
Lilium maritimum	0104000000
Lilium occidentale	0004000000
Lilium pardalinum	1ffdfbff01
Lilium pardalinum subsp. pardalinum	1ffdfbff01
Lilium pardalinum subsp. pitkinense	0020000000
Lilium pardalinum subsp. shastense	0601400000
Lilium pardalinum subsp. vollmeri	0001000000
Lilium pardalinum subsp. wigginsii	0001000000
Lilium parryi	0040005401
Lilium parvum	0000c00000
Lilium rubescens	003d000800
Lilium washingtonianum	0601f88100
Lilium washingtonianum subsp. purpurascens	0001000000
Lilium washingtonianum subsp. washingtonianum	0600f88100
Lilium washingtonianum var. purpurascens	0001000000
Lilium washingtonianum var. washingtonianum	0600f88100
Limnanthes alba	0278586200
Limnanthes alba subsp. alba	0038182200
Limnanthes alba subsp. parishii	0040004000
Limnanthes alba subsp. versicolor	0200580000
Limnanthes alba var. alba	0038182200
Limnanthes alba var. versicolor	0200580000
Limnanthes bakeri	0020000000
Limnanthes douglasii	033d1b2a00
Limnanthes douglasii subsp. douglasii	0124000800
Limnanthes douglasii subsp. nivea	0038030a00
Limnanthes douglasii subsp. rosea	0210102200
Limnanthes douglasii subsp. striata	0001180000
Limnanthes douglasii subsp. sulphurea	0100000000
Limnanthes douglasii var. douglasii	0124000800
Limnanthes douglasii var. nivea	0038030a00
Limnanthes douglasii var. rosea	0210102200
Limnanthes douglasii var. striata	0001180000
Limnanthes douglasii var. sulphurea	0100000000
Limnanthes floccosa	0611000200
Limnanthes floccosa subsp. bellingeriana	0600000000
Limnanthes floccosa subsp. californica	0000000200
Limnanthes floccosa subsp. floccosa	0611000000
Limnanthes floccosa var. bellingeriana	0600000000
Limnanthes floccosa var. floccosa	0611000000
Limnanthes montana	0000300000
Limnanthes vinculans	0020000000
Limnobium spongia	0004000800
Limonium brassicifolium	0080000000
Limonium californicum	0184000000
Limonium duriusculum	00c0005000
Limonium otolepis	0080000800
Limonium perezii	18c0001401
Limonium preauxii	0040004000
Limonium ramosissimum	01c0004000
Limonium sinuatum	0180020800
Limonium sventenii	0040004000
Limosella acaulis	19c3c77f07
Limosella aquatica	0742c04d04
Limosella australis	0100002200
Linanthus arenicola	6000000000
Linanthus bellus	0040000000
Linanthus bigelovii	e000010803
Linanthus californicus	18c0025401
Linanthus campanulatus	0000040002
Linanthus concinnus	0000001000
Linanthus demissus	6000040002
Linanthus dianthiflorus	18c0004001
Linanthus dichotomus	fffdffff03
Linanthus dichotomus subsp. dichotomus	fffdffff03
Linanthus dichotomus subsp. meridianus	0038000800
Linanthus filiformis	6000000002
Linanthus inyoensis	0000040102
Linanthus jaegeri	0000004000
Linanthus jonesii	e000000000
Linanthus killipii	0000000400
Linanthus maculatus	c000000000
Linanthus orcuttii	e040004400
Linanthus parryae	6000212001
Linanthus pungens	ffffffff07
Linaria bipartita	11c0024000
Linaria dalmatica	1fff4f7e01
Linaria dalmatica subsp. dalmatica	1fff4f7e01
Linaria dalmatica var. dalmatica	1fff4f7e01
Linaria maroccana	e1e0033e01
Linaria pinifolia	0000020000
Linaria purpurea	0100000000
Linaria vulgaris	05a74a0a04
Lindernia dubia	0479fceb02
Linnaea borealis	063f400004
Linnaea borealis subsp. longiflora	063f400004
Linnaea borealis var. longiflora	063f400004
Linum bienne	033d0b2a00
Linum grandiflorum	01fc024c01
Linum lewisii	fffffbff07
Linum lewisii subsp. lewisii	fffffbff07
Linum lewisii var. lewisii	fffffbff07
Linum puberulum	4000000000
Linum usitatissimum	b9fd3b7e01
Lipocarpha aristulata	0020000200
Lipocarpha micrantha	0020382200
Lipocarpha occidentalis	0060f8c100
Listera banksiana	0005000000
Listera convallarioides	063fc04504
Listera cordata	0005000000
Lithophragma affine	11f1937e01
Lithophragma bolanderi	0630f8bb01
Lithophragma campanulatum	0439400000
Lithophragma cymbalaria	0800032801
Lithophragma glabrum	0403c40104
Lithophragma heterophyllum	0030430800
Lithophragma maximum	1000000000
Lithophragma parviflorum	061bc9ab05
Lithophragma parviflorum var. parviflorum	041bc18b05
Lithophragma parviflorum var. trifoliatum	0200082000
Lithophragma tenellum	0402401404
Lithospermum arvense	0002400804
Lithospermum californicum	0619400000
Lithospermum incisum	4000000000
Lithospermum ruderale	0402400004
Lobelia cardinalis	4040005400
Lobelia cardinalis var. pseudosplendens	4040005400
Lobelia dunnii	0040825401
Lobelia dunnii var. serrata	0040825401
Lobelia erinus	0080000000
Lobularia maritima	0184000800
Loeflingia squarrosa	60c204e806
Loeseliastrum depressum	2000040002
Loeseliastrum matthewsii	e040041403
Loeseliastrum schottii	e000072003
Logfia arizonica	90c0004000
Logfia depressa	e0c0244002
Logfia filaginoides	fffdffff03
Logfia gallica	1bf4fb7f01
Lomatium bicolor	0402000004
Lomatium bicolor var. leptocarpum	0402000004
Lomatium californicum	0039038901
Lomatium canbyi	0402000004
Lomatium caruifolium	1b38330a00
Lomatium caruifolium var. caruifolium	1938330800
Lomatium caruifolium var. denticulatum	0208000200
Lomatium ciliolatum	0018000000
Lomatium congdonii	0000100000
Lomatium dasycarpum	02783b6a00
Lomatium dasycarpum subsp. dasycarpum	0078034800
Lomatium dasycarpum subsp. tomentosum	0200382200
Lomatium dasycarpum var. dasycarpum	0078034800
Lomatium dissectum	0487d49506
Lomatium dissectum var. dissectum	0005100000
Lomatium dissectum var. multifidum	0483c49506
Lomatium engelmannii	0001000000
Lomatium foeniculaceum	4002040006
Lomatium foeniculaceum subsp. fimbriatum	4000040002
Lomatium foeniculaceum subsp. inyoense	0000000002
Lomatium foeniculaceum subsp. macdougalii	4002000004
Lomatium foeniculaceum var. macdougalii	4002000004
Lomatium grayi	0002000004
Lomatium hallii	0001000000
Lomatium hendersonii	0002000004
Lomatium hooveri	0010000000
Lomatium howellii	0001000000
Lomatium insulare	1000000000
Lomatium lucidum	0080005400
Lomatium macrocarpum	0685388800
Lomatium marginatum	0639180200
Lomatium marginatum var. marginatum	0601180200
Lomatium marginatum var. purpureum	0038000000
Lomatium martindalei	0001000000
Lomatium mohavense	e000030001
Lomatium nevadense	4402c41506
Lomatium nevadense var. nevadense	4402c40006
Lomatium nevadense var. parishii	4002841506
Lomatium nudicaule	043b080804
Lomatium observatorium	0000000800
Lomatium parryi	4000000000
Lomatium parvifolium	0100030000
Lomatium peckianum	0001000000
Lomatium piperi	0003400004
Lomatium plummerae	0402440006
Lomatium ravenii	0002000004
Lomatium repostum	0038000000
Lomatium rigidum	0000040002
Lomatium shevockii	0000000100
Lomatium stebbinsii	0000000000
Lomatium torreyi	0000c00100
Lomatium tracyi	0439000000
Lomatium triternatum	003b040006
Lomatium triternatum subsp. triternatum	0039000004
Lomatium triternatum var. macrocarpum	003b040006
Lomatium triternatum var. triternatum	0039000004
Lomatium utriculatum	5ffdfbff01
Lomatium vaginatum	003b000004
Lonicera cauriana	0400c00100
Lonicera ciliosa	063d000000
Lonicera conjugialis	063ff88104
Lonicera etrusca	0004000000
Lonicera hispidula	19fdfbdd01
Lonicera interrupta	1ffdfbdf01
Lonicera involucrata	011ef88104
Lonicera involucrata var. involucrata	0002f88104
Lonicera involucrata var. ledebourii	011c000000
Lonicera japonica	0180003200
Lonicera subspicata var. denudata	19c043dc01
Lonicera subspicata var. subspicata	1000000001
Lonicera tatarica	0600000000
Lotus angustissimus	0004000000
Lotus corniculatus	1fffffff07
Lotus tenuis	0104000800
Lotus uliginosus	0024000800
Ludwigia grandiflora	00c0004000
Ludwigia hexapetala	01a4002a00
Ludwigia palustris	01bdc82800
Ludwigia peploides	61a4382a01
Ludwigia peploides subsp. montevidensis	0084182200
Ludwigia peploides subsp. peploides	61a4382a01
Ludwigia peploides var. montevidensis	0084182200
Ludwigia peploides var. peploides	61a4382a01
Ludwigia repens	6040004400
Luetkea pectinata	0401000000
Luina hypoleuca	0439000800
Luma apiculata	0100000000
Lunaria annua	0780000800
Lupinus adsurgens	0038f88900
Lupinus affinis	013c000800
Lupinus albicaulis	0409c00101
Lupinus albifrons	09bd3b0800
Lupinus albifrons subsp. albifrons	01b83b0800
Lupinus albifrons var. abramsii	0000020000
Lupinus albifrons var. albifrons	01b83b0800
Lupinus albifrons var. collinus	013d3b0800
Lupinus albifrons var. douglasii	0900000800
Lupinus andersonii	003dc40503
Lupinus angustiflorus	0402c40006
Lupinus antoninus	0008000000
Lupinus apertus	0000400000
Lupinus arboreus	1984000800
Lupinus arbustus	0402c41106
Lupinus argenteus	4602c40106
Lupinus argenteus subsp. argenteus	4602440006
Lupinus argenteus var. argenteus	4602440006
Lupinus argenteus var. heteranthus	0002840006
Lupinus argenteus var. meionanthus	0000c40002
Lupinus argenteus var. montigenus	0000840002
Lupinus argenteus var. palmeri	0400c40106
Lupinus arizonicus	e000000000
Lupinus benthamii	00003aa200
Lupinus bicolor	7ffdfbff01
Lupinus brevicaulis	6002000006
Lupinus breweri	040bc41507
Lupinus breweri var. breweri	040bc41507
Lupinus breweri var. bryoides	0000040103
Lupinus breweri var. grandiflorus	0000c40502
Lupinus cervinus	0000020000
Lupinus chamissonis	0184000000
Lupinus citrinus	0000100000
Lupinus citrinus var. citrinus	0000100000
Lupinus citrinus var. deflexus	0000100000
Lupinus concinnus	f9c0235d01
Lupinus constancei	0020000000
Lupinus covillei	0000800100
Lupinus croceus	0601000000
Lupinus dalesiae	0000400000
Lupinus duranii	0000040002
Lupinus elatus	0000001501
Lupinus elmeri	0008000000
Lupinus excubitus	e04004d502
Lupinus excubitus subsp. austromontanus	0000009400
Lupinus excubitus subsp. excubitus	6000040102
Lupinus excubitus subsp. hallii	0040005400
Lupinus excubitus subsp. medius	8000000000
Lupinus excubitus var. austromontanus	0000009400
Lupinus excubitus var. excubitus	6000040102
Lupinus excubitus var. hallii	0040005400
Lupinus excubitus var. johnstonii	0000001400
Lupinus excubitus var. medius	8000000000
Lupinus flavoculatus	6000000002
Lupinus formosus	7ffdfbff01
Lupinus formosus subsp. formosus	7ffdfbff01
Lupinus formosus var. formosus	7ffdfbff01
Lupinus formosus var. robustus	18c0ba7601
Lupinus fulcratus	0000c00100
Lupinus gracilentus	0000800000
Lupinus grayi	0000f88100
Lupinus guadalupensis	1000000000
Lupinus hirsutissimus	19c0035c01
Lupinus holmgrenianus	4000000000
Lupinus hyacinthinus	0040005400
Lupinus lapidicola	0021000000
Lupinus latifolius	1fffffdd07
Lupinus latifolius subsp. dudleyi	0000000800
Lupinus latifolius subsp. latifolius	19fd035c01
Lupinus latifolius subsp. parishii	18c0a05501
Lupinus latifolius subsp. viridifolius	0603000004
Lupinus latifolius var. barbatus	0002000004
Lupinus latifolius var. columbianus	0000fc8102
Lupinus latifolius var. dudleyi	0000000800
Lupinus latifolius var. latifolius	19fd035c01
Lupinus latifolius var. parishii	18c0a05501
Lupinus latifolius var. viridifolius	0603000004
Lupinus lepidus	443fc40507
Lupinus lepidus subsp. confertus	4402c40507
Lupinus lepidus var. confertus	4402c40507
Lupinus lepidus var. culbertsonii	0000000100
Lupinus lepidus var. lobbii	0000840002
Lupinus lepidus var. ramosus	0000840102
Lupinus lepidus var. sellulus	043fc40106
Lupinus lepidus var. utahensis	0000000002
Lupinus leucophyllus	0403000004
Lupinus littoralis	0104000000
Lupinus longifolius	18c0005401
Lupinus ludovicianus	0000020000
Lupinus luteolus	023d010801
Lupinus magnificus	6000040102
Lupinus magnificus var. glarecola	6000000100
Lupinus magnificus var. magnificus	2000040002
Lupinus microcarpus	fffffbff05
Lupinus microcarpus subsp. microcarpus	7ffffbff05
Lupinus microcarpus var. densiflorus	c1ff3bfe05
Lupinus microcarpus var. horizontalis	6000202001
Lupinus microcarpus var. microcarpus	7ffffbff05
Lupinus milo-bakeri	0020000000
Lupinus nanus	1ffdfbff01
Lupinus nevadensis	4002040006
Lupinus nipomensis	0100000000
Lupinus obtusilobus	063d400000
Lupinus odoratus	e002040006
Lupinus onustus	0401400000
Lupinus pachylobus	02203a0800
Lupinus padre-crowleyi	0000840102
Lupinus peirsonii	0000001000
Lupinus polyphyllus	073fc65d07
Lupinus polyphyllus subsp. polyphyllus	013d020800
Lupinus polyphyllus var. burkei	0603c45507
Lupinus polyphyllus var. pallidipes	0609000000
Lupinus polyphyllus var. polyphyllus	013d020800
Lupinus pratensis	0000840102
Lupinus pratensis var. eriostachyus	0000040002
Lupinus pratensis var. pratensis	0000840102
Lupinus pusillus	0002040006
Lupinus pusillus subsp. intermontanus	0002040006
Lupinus pusillus var. intermontanus	0002040006
Lupinus rivularis	0004000000
Lupinus saxosus	0002000004
Lupinus sericatus	0010000000
Lupinus shockleyi	e000000000
Lupinus sparsiflorus	78c0035401
Lupinus spectabilis	0000100000
Lupinus stiversii	0000fa9500
Lupinus succulentus	19fd037e01
Lupinus tidestromii	0104000000
Lupinus tracyi	0001000000
Lupinus truncatus	19c0035c01
Lupinus uncialis	0002000004
Lupinus variicolor	0104000000
Luzula comosa	053ffc8906
Luzula comosa var. comosa	013df88900
Luzula comosa var. laxa	0403c40106
Luzula divaricata	0401c00100
Luzula orestera	0000c00100
Luzula parviflora	003df88104
Luzula parviflora subsp. fastigiata	0039800000
Luzula parviflora subsp. parviflora	002df88104
Luzula parviflora var. parviflora	002df88104
Luzula piperi	0001000000
Luzula spicata	0000c40106
Luzula subcongesta	0401c00100
Luzula subsessilis	0138f00100
Lychnis coronaria	06b8c80801
Lycium andersonii	e0c004e003
Lycium barbarum	0082202304
Lycium brevipes	9000000000
Lycium brevipes var. brevipes	9000000000
Lycium brevipes var. hassei	1000000000
Lycium californicum	1880000000
Lycium cooperi	e000c42102
Lycium fremontii	8040000000
Lycium pallidum	e000000000
Lycium pallidum var. oligospermum	e000000000
Lycium parishii	8080000000
Lycium torreyi	e000000000
Lycium verrucosum	1000000000
Lycopersicon esculentum	0080002a00
Lycopersicon peruvianum	0080000000
Lycopodiella inundata	0004400000
Lycopodium clavatum	0004000000
Lycopus americanus	1ffdffff03
Lycopus asper	1fffffff07
Lycopus uniflorus	063ff88104
Lyonothamnus floribundus	1800000000
Lyonothamnus floribundus subsp. aspleniifolius	1800000000
Lyonothamnus floribundus subsp. floribundus	1000000000
Lyonothamnus floribundus var. aspleniifolius	1800000000
Lyonothamnus floribundus var. floribundus	1000000000
Lyrocarpa coulteri	8000000000
Lysichiton americanus	0104000000
Lysimachia nummularia	0000480000
Lysimachia thyrsiflora	0603480004
Lythrum californicum	f9d03b7f03
Lythrum hyssopifolia	1ffdfbff01
Lythrum portula	0600480200
Lythrum salicaria	0126080204
Lythrum tribracteatum	0112002a04
Machaeranthera tanacetifolia	4000000000
Maclura pomifera	0080002201
Madia anomala	0130000a00
Madia citrigracilis	0402000004
Madia citriodora	0613480204
Madia elegans	1fffffff01
Madia exigua	1f7fdb1f05
Madia glomerata	0407c40c04
Madia gracilis	1fffffff05
Madia radiata	0000010000
Madia sativa	19b54b0a01
Madia subspicata	0200180200
Maianthemum dilatatum	013d000000
Maianthemum racemosum	073dfb9d01
Maianthemum stellatum	1ffdffdd07
Malacothamnus abbottii	0000030000
Malacothamnus aboriginum	0000132800
Malacothamnus clementinus	1000000000
Malacothamnus davidsonii	0080021801
Malacothamnus densiflorus	80c0004400
Malacothamnus fasciculatus	98c0025c01
Malacothamnus fasciculatus subsp. catalinensis	1000000000
Malacothamnus fasciculatus subsp. fasciculatus	80c0025401
Malacothamnus fasciculatus var. catalinensis	1000000000
Malacothamnus fasciculatus var. fasciculatus	80c0025401
Malacothamnus fasciculatus var. nesioticus	0800000000
Malacothamnus fasciculatus var. nuttallii	0000020801
Malacothamnus fremontii	0110793a00
Malacothamnus hallii	0030b82800
Malacothamnus jonesii	0010020000
Malacothamnus marrubioides	0040387801
Malacothamnus orbiculatus	4000381501
Malacothamnus palmeri	0100020000
Malacothamnus palmeri var. involucratus	0100020000
Malacothamnus palmeri var. palmeri	0100020000
Malacothrix californica	f9c0237c01
Malacothrix clevelandii	09fd3b7d01
Malacothrix coulteri	e940076803
Malacothrix floccifera	077dc34a01
Malacothrix foliosa	1800000000
Malacothrix foliosa subsp. crispifolia	0800000000
Malacothrix foliosa subsp. foliosa	1000000000
Malacothrix foliosa subsp. philbrickii	1000000000
Malacothrix foliosa subsp. polycephala	1000000000
Malacothrix foliosa var. foliosa	1000000000
Malacothrix glabrata	e000062003
Malacothrix incana	1980000000
Malacothrix indecora	0800000000
Malacothrix junakii	0800000000
Malacothrix phaeocarpa	0000030801
Malacothrix saxatilis	19c023d401
Malacothrix saxatilis var. arachnoidea	0100020001
Malacothrix saxatilis var. commutata	0080238001
Malacothrix saxatilis var. implicata	1800000000
Malacothrix saxatilis var. saxatilis	0080000001
Malacothrix saxatilis var. tenuifolia	10c0225401
Malacothrix similis	0880000000
Malacothrix sonchoides	6000040002
Malacothrix squalida	0800000000
Malacothrix stebbinsii	e000040002
Malacothrix torreyi	2002040006
Malaxis monophyllos	0000004400
Malaxis monophyllos subsp. brachypoda	0000004400
Malaxis monophyllos var. brachypoda	0000004400
Malephora crocea	1180000000
Malosma laurina	18c0005401
Malperia tenuis	8080000000
Malus fusca	0324000000
Malus pumila	1ffdfbff01
Malva arborea	0184000000
Malva assurgentiflora	1980000000
Malva neglecta	ffffffff07
Malva nicaeensis	1ffdfbff01
Malva parviflora	fffdfbff01
Malva pseudolavatera	0180000000
Malva sylvestris	01bd030800
Malva verticillata	0080000000
Malva verticillata var. crispa	0080000000
Malvella leprosa	ffffffff07
Mammillaria dioica	8080000000
Mammillaria grahamii	8000000000
Mammillaria grahamii var. grahamii	8000000000
Mammillaria tetrancistra	e000000000
Marah fabacea	7ffdfbff01
Marah horrida	0000308000
Marah macrocarpa	98c0005401
Marah oregana	003d000800
Marah watsonii	0210080200
Marina orcuttii	0040000000
Marina orcuttii var. orcuttii	0040000000
Marina parryi	e000000000
Marrubium vulgare	5ffdfbff01
Marsilea oligospora	0403400004
Marsilea vestita	87d3ea6f05
Marsilea vestita subsp. vestita	87d3ea6f05
Marsilea vestita var. vestita	87d3ea6f05
Matelea parvifolia	e000000000
Matricaria chamomilla	0000380000
Matricaria discoidea	7ffdffff03
Matricaria occidentalis	7da0c22b00
Matthiola incana	0184000000
Maurandella antirrhiniflora	4000000000
Mauranthemum paludosum	0000000800
Maytenus boaria	0000000800
Meconella californica	0300380800
Meconella denticulata	18c0025401
Meconella oregana	0000000800
Medicago arabica	033c4b0a00
Medicago lupulina	5fffffff07
Medicago minima	1ffdfbff01
Medicago orbicularis	0000000200
Medicago polymorpha	1ffdfbff01
Medicago praecox	0290f88900
Medicago rigidula	0040004000
Medicago sativa	5fffffff07
Medicago scutellata	0000020000
Medicago truncatula	0040024000
Melaleuca citrina	00c0004000
Melaleuca viminalis	0080000000
Melia azedarach	00c0005c00
Melica aristata	0639c00500
Melica bulbosa	241bfc8106
Melica californica	077dfbeb01
Melica frutescens	e0c022c003
Melica fugax	061bc40006
Melica geyeri	0439c20800
Melica harfordii	0439c32800
Melica imperfecta	79d0b35f01
Melica spectabilis	0039400004
Melica stricta	4609c79507
Melica subulata	0539c00804
Melica torreyana	0335db0a00
Melilotus albus	ffffffff07
Melilotus indicus	ffffffff07
Melilotus officinalis	ffffffff07
Melinis repens	01e0026001
Melinis repens subsp. repens	01e0026001
Melissa officinalis	033d0b0800
Menodora scabra	e040000000
Menodora scabra var. glabrescens	e040000000
Menodora scabra var. scabra	4000000000
Menodora spinescens	6000040402
Menodora spinescens var. mohavensis	6000000400
Menodora spinescens var. spinescens	4000040402
Mentha X gracilis	01b0802200
Mentha X piperita	65f67b7e05
Mentha X rotundifolia	0100003601
Mentha X smithiana	0984001401
Mentha X villosa	0000001401
Mentha aquatica	61e53a7403
Mentha arvensis	0000002000
Mentha canadensis	47fffb7f05
Mentha longifolia	0080001401
Mentha pulegium	0774fbeb00
Mentha spicata	ffffffff07
Mentha suaveolens	41bc3b1c03
Mentzelia affinis	f000217d01
Mentzelia albicaulis	e002049406
Mentzelia congesta	4040c4d103
Mentzelia crocea	0000300100
Mentzelia desertorum	e000000000
Mentzelia dispersa	1fffffff07
Mentzelia eremophila	6000000000
Mentzelia gracilenta	0000031801
Mentzelia hirsutissima	8000000000
Mentzelia involucrata	e000000000
Mentzelia inyoensis	0000000002
Mentzelia jonesii	e000000002
Mentzelia laevicaulis	7fffffff07
Mentzelia lindleyi	0000012800
Mentzelia longiloba	e000000000
Mentzelia micrantha	18f9035c01
Mentzelia montana	4640fcd503
Mentzelia nitens	2000040002
Mentzelia obscura	e000000000
Mentzelia oreophila	c000000002
Mentzelia pectinata	0000222001
Mentzelia polita	4000000000
Mentzelia pterosperma	4000000000
Mentzelia puberula	e000000000
Mentzelia ravenii	e040001000
Mentzelia reflexa	6000000002
Mentzelia torreyi	0000040002
Mentzelia tricuspis	e000000000
Mentzelia tridentata	6000000000
Mentzelia veatchiana	e04245f407
Menyanthes trifoliata	0705f80100
Menziesia ferruginea	0005000000
Mercurialis annua	0000000800
Mertensia bella	0001000000
Mertensia ciliata	0402c00106
Mertensia ciliata var. stomatechoides	0402c00106
Mertensia cusickii	0000000004
Mertensia longiflora	0002000004
Mertensia oblongifolia	0402c40004
Mertensia oblongifolia var. amoena	0000400004
Mertensia oblongifolia var. nevadensis	0400c40004
Mertensia oblongifolia var. oblongifolia	0002400004
Mesembryanthemum crystallinum	1984000000
Mesembryanthemum nodiflorum	1880000800
Micranthes aprica	0401c00100
Micranthes bryophora	0401c00100
Micranthes californica	1bf1fbff01
Micranthes ferruginea	0001000000
Micranthes fragosa	0603000000
Micranthes howellii	0001000000
Micranthes integrifolia	0231000200
Micranthes marshallii	0025000000
Micranthes nidifica	0023c00104
Micranthes odontoloma	0409c00500
Micranthes oregana	0403f88104
Micranthes tolmiei	0409c00100
Micromonolepis pusilla	0002440004
Micropus amphibolus	01300a0800
Micropus californicus	1ffdfbbf01
Micropus californicus var. californicus	1ffdfbbf01
Micropus californicus var. subvestitus	0100120800
Microseris acuminata	02381a2a00
Microseris bigelovii	0104000800
Microseris borealis	0020000000
Microseris campestris	01803b2a00
Microseris douglasii	1bf83bea00
Microseris douglasii subsp. douglasii	03b83baa00
Microseris douglasii subsp. platycarpha	10c0004000
Microseris douglasii subsp. tenella	0998032a00
Microseris douglasii var. douglasii	03b83baa00
Microseris douglasii var. platycarpha	10c0004000
Microseris elegans	1ab83b2a00
Microseris laciniata	043f000004
Microseris laciniata subsp. detlingii	0001000000
Microseris laciniata subsp. laciniata	043f000004
Microseris laciniata subsp. leptosepala	003d000000
Microseris laciniata subsp. siskiyouensis	0001000000
Microseris laciniata var. laciniata	043f000004
Microseris laciniata var. siskiyouensis	0001000000
Microseris nutans	040bc00104
Microseris paludosa	0100000800
Microseris sylvatica	60103b8b01
Microsteris gracilis	ffffffff07
Mimulus alsinoides	0001000000
Mimulus androsaceus	215003cc01
Mimulus angustatus	0230280000
Mimulus aurantiacus	59fd7b5d01
Mimulus aurantiacus subsp. aurantiacus	013d1b0800
Mimulus aurantiacus var. aridus	0040000000
Mimulus aurantiacus var. aurantiacus	013d1b0800
Mimulus aurantiacus var. grandiflorus	00004b0000
Mimulus aurantiacus var. parviflorus	1800000000
Mimulus aurantiacus var. pubescens	59c0235d01
Mimulus aurantiacus var. puniceus	18c0005401
Mimulus bicolor	0601f88100
Mimulus bigelovii	e000040002
Mimulus bigelovii var. bigelovii	e000000000
Mimulus bigelovii var. cuspidatus	e000040002
Mimulus bolanderi	0138fb8901
Mimulus breviflorus	0002400004
Mimulus brevipes	18c0025401
Mimulus breweri	063fc25505
Mimulus cardinalis	5ffdfbff03
Mimulus clevelandii	0040004000
Mimulus congdonii	00783a0801
Mimulus constrictus	0000208101
Mimulus cusickii	0000000004
Mimulus dentatus	0004000000
Mimulus douglasii	033d3b0804
Mimulus evanescens	0002000004
Mimulus exiguus	0000000400
Mimulus filicaulis	0000800000
Mimulus floribundus	5ffdfbff03
Mimulus fremontii	78c0035401
Mimulus fremontii var. fremontii	78c0035401
Mimulus fremontii var. vandenbergensis	0000020000
Mimulus glaucescens	0200080000
Mimulus gracilipes	0000100000
Mimulus guttatus	ffffffff07
Mimulus inconspicuus	0000380000
Mimulus johnstonii	0000001400
Mimulus kelloggii	023d180000
Mimulus laciniatus	0000d82100
Mimulus latidens	0190032a00
Mimulus latifolius	1800000000
Mimulus layneae	1efff8d505
Mimulus leptaleus	0000c00100
Mimulus lewisii	0401f88100
Mimulus mohavensis	6000000000
Mimulus montioides	0000b00102
Mimulus moschatus	1fffffff07
Mimulus nanus	043fc40106
Mimulus nanus subsp. nanus	043f040006
Mimulus nanus var. jepsonii	0403400004
Mimulus nanus var. mephiticus	0002c40106
Mimulus nanus var. nanus	043f040006
Mimulus norrisii	0000200000
Mimulus nudatus	0038000000
Mimulus palmeri	604022d401
Mimulus parishii	f8c0205501
Mimulus parryi	0000000002
Mimulus pictus	0000208000
Mimulus pilosus	5ffdffff03
Mimulus primuloides	063ffcc507
Mimulus primuloides subsp. linearifolius	0001000000
Mimulus primuloides subsp. primuloides	063ffcc507
Mimulus primuloides var. linearifolius	0001000000
Mimulus primuloides var. primuloides	063ffcc507
Mimulus pulchellus	0000180000
Mimulus pulsiferae	063fc00004
Mimulus purpureus	0000000400
Mimulus pygmaeus	0402400004
Mimulus rattanii	0150034800
Mimulus ringens	0000002000
Mimulus rubellus	4002041407
Mimulus rupicola	4000000000
Mimulus shevockii	2000200000
Mimulus suksdorfii	4400c44503
Mimulus tilingii	043dc44503
Mimulus torreyi	0400f88100
Mimulus traskiae	1000000000
Mimulus tricolor	0032002204
Mimulus viscidus	0000380000
Mimulus viscidus subsp. viscidus	0000380000
Mimulus viscidus var. compactus	0000380000
Mimulus viscidus var. viscidus	0000380000
Mimulus whitneyi	0000000100
Minuartia californica	073dbb0a00
Minuartia cismontana	0431ca2000
Minuartia decumbens	0008000000
Minuartia douglasii	1fffbb7e05
Minuartia howellii	0001000000
Minuartia nuttallii	043fc41106
Minuartia nuttallii subsp. fragilis	0002040006
Minuartia nuttallii subsp. gracilis	0401c41102
Minuartia nuttallii subsp. gregaria	043d800004
Minuartia nuttallii var. fragilis	0002040006
Minuartia nuttallii var. gracilis	0401c41102
Minuartia nuttallii var. gregaria	043d800004
Minuartia obtusiloba	0000800100
Minuartia pusilla	0154c36901
Minuartia rosei	0009000000
Minuartia rubella	0101c00102
Minuartia stolonifera	0001000000
Minuartia stricta	0000800102
Mirabilis albida	4000004402
Mirabilis alipes	4000000002
Mirabilis coccinea	4000000000
Mirabilis greenei	0011000000
Mirabilis jalapa	1ffdfbff01
Mirabilis jalapa subsp. jalapa	1ffdfbff01
Mirabilis jalapa var. jalapa	1ffdfbff01
Mirabilis laevis	f9c033d403
Mirabilis laevis var. crassifolia	b9c033d403
Mirabilis laevis var. retrorsa	e000000002
Mirabilis laevis var. villosa	e000000002
Mirabilis linearis	0080000000
Mirabilis linearis var. linearis	0080000000
Mirabilis multiflora	e040202002
Mirabilis multiflora var. glandulosa	2000000002
Mirabilis multiflora var. pubescens	e040202002
Mirabilis nyctaginea	0080000000
Mirabilis tenuiloba	8000000000
Mitellastra caulescens	002d000000
Modiola caroliniana	1ffdfbff01
Moehringia macrophylla	007d424900
Moenchia erecta	0100180000
Moenchia erecta subsp. erecta	0100180000
Mohavea breviflora	6000000000
Mohavea confertiflora	e000000000
Mollugo cerviana	e000004000
Mollugo verticillata	1ffdffff03
Moluccella laevis	0010000a00
Monarda pectinata	4000000000
Monardella australis	0080005400
Monardella australis subsp. australis	0000005400
Monardella australis subsp. cinerea	0000001000
Monardella australis subsp. jokerstii	0080001000
Monardella beneolens	0000000100
Monardella boydii	6000000000
Monardella breweri	1ec0fbdd01
Monardella breweri subsp. breweri	0000030801
Monardella breweri subsp. glandulifera	0000001000
Monardella breweri subsp. lanceolata	1ec0fad501
Monardella breweri subsp. microcephala	0040000000
Monardella candicans	0000382000
Monardella douglasii	0038010800
Monardella eremicola	4000000000
Monardella exilis	6000201501
Monardella follettii	0000400000
Monardella hypoleuca	0040020001
Monardella hypoleuca subsp. hypoleuca	0000020001
Monardella hypoleuca subsp. intermedia	0040000000
Monardella hypoleuca subsp. lanata	0040000000
Monardella leucocephala	0000002000
Monardella linoides	6040a4c503
Monardella linoides subsp. anemonoides	0000200100
Monardella linoides subsp. erecta	0000000400
Monardella linoides subsp. linoides	6040004000
Monardella linoides subsp. oblonga	0000008001
Monardella linoides subsp. sierrae	2000840102
Monardella macrantha	0040035401
Monardella macrantha subsp. hallii	0040004400
Monardella macrantha subsp. macrantha	0000031401
Monardella macrantha var. hallii	0040004400
Monardella macrantha var. macrantha	0000031401
Monardella mojavensis	4000000000
Monardella nana	0040004000
Monardella odoratissima	060bc40106
Monardella odoratissima subsp. glauca	060ac40106
Monardella odoratissima subsp. pallida	0409c00100
Monardella odoratissima var. glauca	060ac40106
Monardella palmeri	0000020000
Monardella pringlei	0080000000
Monardella purpurea	0021000800
Monardella robisonii	4000000000
Monardella saxicola	0000001000
Monardella sheltonii	0600480000
Monardella sinuata	0180020800
Monardella sinuata subsp. nigrescens	0100000800
Monardella sinuata subsp. sinuata	0180020000
Monardella stebbinsii	0000400000
Monardella stoneana	0040000000
Monardella undulata	0100000000
Monardella undulata subsp. arguelloensis	0100000000
Monardella undulata subsp. crispa	0100000000
Monardella undulata subsp. undulata	0100000000
Monardella undulata var. undulata	0100000000
Monardella venosa	0000180000
Monardella villosa	013d030800
Monardella villosa subsp. franciscana	0104000800
Monardella villosa subsp. obispoensis	0100020000
Monardella villosa subsp. villosa	013d030800
Monardella villosa var. franciscana	0104000800
Monardella villosa var. obispoensis	0100020000
Monardella villosa var. villosa	013d030800
Monardella viminea	0080000000
Monardella viridis	0010000000
Moneses uniflora	0425800000
Monochoria vaginalis	0000000200
Monolepis nuttalliana	ffc2ffff07
Monolepis spathulata	0000c40502
Monolopia congdonii	0000002000
Monolopia gracilens	0000030800
Monolopia lanceolata	20c023f001
Monolopia major	0010032a01
Monolopia stricta	000021a001
Monoptilon bellidiforme	6000000000
Monoptilon bellioides	e000000000
Monotropa hypopitys	002d000000
Monotropa uniflora	0005000000
Montia chamissoi	064bc45507
Montia dichotoma	0603000004
Montia diffusa	003d480800
Montia fontana	1fffffff07
Montia howellii	003d000000
Montia linearis	067bd85c05
Montia parvifolia	073df88900
Morella californica	01a5000800
Mortonia utahensis	4000000000
Morus alba	0000382201
Mucronea californica	19c0035c01
Mucronea perfoliata	600021a001
Muehlenbeckia complexa	0104000000
Muehlenbeckia hastulata	0000000800
Muhlenbergia alopecuroides	4000000000
Muhlenbergia andina	4011fd8502
Muhlenbergia appressa	5000000000
Muhlenbergia arsenei	4000000000
Muhlenbergia asperifolia	ffffffff07
Muhlenbergia californica	0080005400
Muhlenbergia filiformis	003ffcc507
Muhlenbergia fragilis	4000000000
Muhlenbergia jonesii	0401400000
Muhlenbergia mexicana	0021480000
Muhlenbergia microsperma	f9c0025401
Muhlenbergia minutissima	0001c44402
Muhlenbergia montana	0001c00100
Muhlenbergia pauciflora	4000000000
Muhlenbergia porteri	6040044402
Muhlenbergia richardsonis	4403c65507
Muhlenbergia rigens	6480fef703
Muhlenbergia schreberi	0000180200
Muhlenbergia utilis	0080020001
Muilla coronata	6000048102
Muilla maritima	e1f8037e01
Muilla transmontana	0002040006
Munroa squarrosa	4000000000
Munzothamnus blairii	1000000000
Myoporum laetum	1984000000
Myosotis discolor	077f584a04
Myosotis latifolia	0104000800
Myosotis laxa	0035400300
Myosotis micrantha	0023000004
Myosotis scorpioides	0000c00104
Myosotis verna	0001080000
Myosurus apetalus	0602c00504
Myosurus apetalus var. borealis	0602000004
Myosurus apetalus var. montanus	0002c00504
Myosurus cupulatus	4000000000
Myosurus minimus	1fffffff07
Myosurus sessilis	0000002200
Myrica hartwegii	0000d80000
Myriophyllum aquaticum	63bc382a00
Myriophyllum hippuroides	0130402800
Myriophyllum quitense	0400400400
Myriophyllum sibiricum	64d6425c04
Myriophyllum spicatum	00d2786e04
Myriophyllum verticillatum	0006440106
Myrtus communis	0010000000
Najas flexilis	0011000000
Najas gracillima	0000000200
Najas graminea	0000000200
Najas guadalupensis	e1a0032a00
Najas guadalupensis subsp. guadalupensis	e1a0032a00
Najas guadalupensis var. guadalupensis	e1a0032a00
Najas marina	e1f8234400
Nama aretioides	4002440006
Nama aretioides var. californicum	0002000000
Nama aretioides var. multiflorum	4002440006
Nama californicum	201021bd01
Nama demissum	e040049502
Nama demissum var. covillei	2000000000
Nama demissum var. demissum	e040049502
Nama densum	0402c40006
Nama densum var. densum	0402c40006
Nama densum var. parviflorum	0402000000
Nama depressum	6000048502
Nama dichotomum	4000000000
Nama dichotomum var. dichotomum	4000000000
Nama hispidum	e000000400
Nama hispidum var. spathulatum	e000000400
Nama pusillum	e000000402
Nama rothrockii	0000840502
Nama stenocarpum	90c0002000
Narcissus pseudonarcissus	0110000200
Narcissus tazetta	08c0004801
Narthecium californicum	0421c00000
Nasturtium gambelii	0180000000
Nasturtium officinale	5fffffff07
Navarretia atractyloides	1d7b135d05
Navarretia breweri	4002c40506
Navarretia capillaris	0459c04505
Navarretia cotulifolia	0010010a00
Navarretia divaricata	063ffe8306
Navarretia divaricata subsp. divaricata	063ffe8106
Navarretia divaricata subsp. vividior	063ff88304
Navarretia divaricata var. divaricata	063ffe8106
Navarretia divaricata var. vividior	063ff88304
Navarretia eriocephala	0000180a00
Navarretia filicaulis	0602f88104
Navarretia fossalis	78c0025401
Navarretia gowenii	0000002800
Navarretia hamata	19c0025c01
Navarretia hamata subsp. hamata	0040005401
Navarretia hamata subsp. leptantha	18c0004000
Navarretia hamata subsp. parviloba	0100020800
Navarretia hamata var. hamata	0040005401
Navarretia heterandra	0612010a04
Navarretia heterodoxa	0030000800
Navarretia intertexta	1efbfb7f05
Navarretia intertexta subsp. intertexta	1efb3b7e05
Navarretia intertexta subsp. propinqua	064ac04104
Navarretia intertexta var. intertexta	1efb3b7e05
Navarretia intertexta var. propinqua	064ac04104
Navarretia jepsonii	0010000000
Navarretia leptalea	0602f88104
Navarretia leptalea subsp. bicolor	0000c00100
Navarretia leptalea subsp. leptalea	0602f88104
Navarretia leucocephala	063bf8ab04
Navarretia leucocephala subsp. bakeri	0439000a00
Navarretia leucocephala subsp. leucocephala	0622f8a304
Navarretia leucocephala subsp. minima	0602c00004
Navarretia leucocephala subsp. pauciflora	0010000000
Navarretia leucocephala subsp. plieantha	0038000000
Navarretia mellita	00381b0801
Navarretia mitracarpa	18c0035401
Navarretia myersii	0010182200
Navarretia myersii subsp. deminuta	0010000000
Navarretia myersii subsp. myersii	0000182200
Navarretia nigelliformis	00103ba200
Navarretia nigelliformis subsp. nigelliformis	00103ba200
Navarretia nigelliformis subsp. radians	0000030000
Navarretia nigelliformis var. nigelliformis	00103ba200
Navarretia nigelliformis var. radians	0000030000
Navarretia ojaiensis	0000000001
Navarretia peninsularis	004000d401
Navarretia prolifera	0000780000
Navarretia prolifera subsp. lutea	0000480000
Navarretia prolifera subsp. prolifera	0000780000
Navarretia prolifera var. lutea	0000480000
Navarretia prolifera var. prolifera	0000780000
Navarretia prostrata	01c0032800
Navarretia pubescens	0638bb0a00
Navarretia rosulata	0010000800
Navarretia setiloba	0000202001
Navarretia sinistra	063b480004
Navarretia sinistra subsp. pinnatisecta	0011000000
Navarretia sinistra subsp. sinistra	063b480004
Navarretia squarrosa	013d0b0800
Navarretia subuligera	0610080200
Navarretia tagetina	067d186a00
Navarretia viscidula	0238380800
Nemacaulis denudata	99c0005401
Nemacaulis denudata var. denudata	0180000000
Nemacaulis denudata var. gracilis	98c0005401
Nemacladus calcaratus	0000000100
Nemacladus californicus	6000030001
Nemacladus capillaris	043aca0105
Nemacladus glanduliferus	e040044002
Nemacladus gracilis	0000232000
Nemacladus interior	0000d8a500
Nemacladus longiflorus	40c0005502
Nemacladus longiflorus var. breviflorus	4040005500
Nemacladus longiflorus var. longiflorus	00c0005402
Nemacladus montanus	0018000a00
Nemacladus orientalis	e000051002
Nemacladus pinnatifidus	80c0005000
Nemacladus ramosissimus	00c0025001
Nemacladus rigidus	0002040006
Nemacladus rubescens	e040040002
Nemacladus secundiflorus	0000030101
Nemacladus secundiflorus var. robbinsii	0000010101
Nemacladus secundiflorus var. secundiflorus	0000030100
Nemacladus sigmoideus	e040249503
Nemacladus tenuis	e000000000
Nemacladus tenuis var. aliformis	e000000000
Nemacladus tenuis var. tenuis	e000000000
Nemacladus twisselmannii	0000000100
Nemophila breviflora	0002000004
Nemophila heterophylla	073dfbab00
Nemophila maculata	0000f88300
Nemophila menziesii	7ffdffff03
Nemophila menziesii subsp. atomaria	013d000800
Nemophila menziesii subsp. integrifolia	79c0477403
Nemophila menziesii subsp. menziesii	7ffdfbff01
Nemophila menziesii var. atomaria	013d000800
Nemophila menziesii var. integrifolia	79c0477403
Nemophila menziesii var. menziesii	7ffdfbff01
Nemophila parviflora	013ff38904
Nemophila parviflora var. austiniae	000b400004
Nemophila parviflora var. parviflora	013d030800
Nemophila parviflora var. quercifolia	0000b08100
Nemophila pedunculata	1ffffbff05
Nemophila pulchella	000033b901
Nemophila pulchella var. fremontii	000023a901
Nemophila pulchella var. gracilis	0000300000
Nemophila pulchella var. pulchella	0000313100
Nemophila spatulata	0400e0d505
Neoholmgrenia andina	0402000004
Neostapfia colusana	0000002200
Nepeta cataria	1ffdfbff01
Nerium oleander	81c1085600
Nestotus stenophyllus	0002000004
Neviusia cliftonii	0001000000
Nicandra physalodes	0080000000
Nicolletia occidentalis	6000000100
Nicotiana acuminata	1ffffbff05
Nicotiana acuminata var. multiflora	1ffffbff05
Nicotiana attenuata	fe7bffff07
Nicotiana clevelandii	9880000000
Nicotiana glauca	f9d0337e01
Nicotiana obtusifolia	e000040002
Nicotiana quadrivalvis	fffdfbff01
Nicotiana sylvestris	0100000800
Nitrophila mohavensis	2000000000
Nitrophila occidentalis	60c2042206
Noccaea fendleri	042b400004
Noccaea fendleri subsp. californica	0020000000
Noccaea fendleri subsp. glauca	040b400004
Nolina bigelovii	c000000000
Nolina cismontana	00c0004001
Nolina interrata	0040000000
Nolina parryi	c040004500
Nothocalais alpestris	0001c00000
Nothocalais troximoides	0003400004
Nothochelone nemorosa	0401000000
Notholaena californica	d040005400
Notholithocarpus densiflorus	073dfb8901
Notholithocarpus densiflorus var. densiflorus	073dfb8901
Notholithocarpus densiflorus var. echinoides	0601f88100
Nothoscordum gracile	0180032a00
Nuphar polysepala	053fdb2a04
Nuttallanthus texanus	59fd3b3a01
Nymphaea mexicana	0000002000
Nymphaea odorata	0000c01300
Nymphoides peltata	0100400000
Odontostomum hartwegii	0611180000
Oemleria cerasiformis	073dfbab01
Oenanthe sarmentosa	63d4384c00
Oenothera biennis	19fd035c01
Oenothera californica	f9c0075c03
Oenothera californica subsp. avita	e000040002
Oenothera californica subsp. californica	59c0035c01
Oenothera californica subsp. eurekensis	6000000000
Oenothera californica var. californica	59c0035c01
Oenothera cavernae	4000000000
Oenothera cespitosa	e002040006
Oenothera cespitosa subsp. crinita	e002040006
Oenothera cespitosa subsp. marginata	e002040006
Oenothera cespitosa var. crinita	e002040006
Oenothera cespitosa var. marginata	e002040006
Oenothera curtiflora	18c0005c01
Oenothera deltoides	e002022204
Oenothera deltoides subsp. cognata	6000022000
Oenothera deltoides subsp. deltoides	e000000000
Oenothera deltoides subsp. howellii	0000002200
Oenothera deltoides subsp. piperi	0002000004
Oenothera deltoides var. cognata	6000022000
Oenothera deltoides var. deltoides	e000000000
Oenothera deltoides var. howellii	0000002200
Oenothera deltoides var. piperi	0002000004
Oenothera elata	ffffffff07
Oenothera elata subsp. hirsutissima	ffffffff07
Oenothera elata subsp. hookeri	19c0035c01
Oenothera elata var. hirsutissima	ffffffff07
Oenothera flava	0602400004
Oenothera glazioviana	19fd035c01
Oenothera laciniata	79c0035c01
Oenothera longissima	4000000000
Oenothera primiveris	e000000000
Oenothera primiveris subsp. bufonis	e000000000
Oenothera primiveris subsp. primiveris	e000000000
Oenothera primiveris var. bufonis	e000000000
Oenothera primiveris var. primiveris	e000000000
Oenothera pubescens	6000000000
Oenothera rosea	0080000000
Oenothera sinuosa	79c0037e01
Oenothera speciosa	0080000000
Oenothera stricta	0080000000
Oenothera stricta subsp. stricta	0080000000
Oenothera suffrutescens	58c000d401
Oenothera villosa	0413000004
Oenothera villosa subsp. strigosa	0413000004
Oenothera villosa var. strigosa	0413000004
Oenothera wolfii	0005000000
Oenothera xenogaura	19c0035c01
Oenothera xylocarpa	0000800100
Olea europaea	09b8022a00
Oligomeris linifolia	f8c0005401
Olneya tesota	8040004000
Olsynium douglasii	0623000004
Olsynium douglasii var. douglasii	0623000004
Oncosiphon piluliferum	80c0004000
Onobrychis viciifolia	0002400004
Onopordum acanthium	1ffffbfd05
Onopordum acanthium subsp. acanthium	1ffffbfd05
Onopordum illyricum	0000000800
Onopordum tauricum	00023a0004
Ophioglossum californicum	0180182000
Ophioglossum pusillum	0009400000
Opuntia X occidentalis	00c0000000
Opuntia X vaseyi	0080000000
Opuntia basilaris	e0c024b502
Opuntia basilaris var. basilaris	e0c0249502
Opuntia basilaris var. brachyclada	0000001400
Opuntia basilaris var. treleasei	000000a000
Opuntia chlorotica	4040000000
Opuntia engelmannii	4000004000
Opuntia engelmannii var. engelmannii	4000004000
Opuntia ficus-indica	11c0020001
Opuntia fragilis	0400000000
Opuntia leucotricha	0080000000
Opuntia littoralis	18c0000000
Opuntia microdasys	0040000000
Opuntia oricola	18c0000001
Opuntia phaeacantha	c040020400
Opuntia polyacantha	6000044502
Opuntia polyacantha var. erinacea	6000044502
Opuntia polyacantha var. hystricina	0000040002
Opuntia robusta	0080000000
Orcuttia californica	00c0005001
Orcuttia inaequalis	0000102000
Orcuttia pilosa	0000002200
Orcuttia tenuis	0612000204
Orcuttia viscida	0000000200
Oreonana clementis	0000000100
Oreonana purpurascens	0000000100
Oreonana vestita	0000001400
Oreostemma alpigenum	0639f8c106
Oreostemma alpigenum var. andersonii	0639f8c106
Oreostemma elatum	0000400000
Oreostemma peirsonii	0000000100
Origanum X majoricum	0000080200
Origanum vulgare	0186000804
Origanum vulgare subsp. hirtum	0186000804
Ornithopus pinnatus	0100000000
Ornithopus sativus	0100000000
Ornithostaphylos oppositifolia	0080000000
Orobanche bulbosa	1ef0fadd01
Orobanche californica	6fffffff07
Orobanche californica subsp. californica	0104000000
Orobanche californica subsp. condensa	0000010000
Orobanche californica subsp. feudgei	604004d503
Orobanche californica subsp. grandis	0980020000
Orobanche californica subsp. grayana	040ac00804
Orobanche californica subsp. jepsonii	06393b2a00
Orobanche californica var. californica	0104000000
Orobanche californica var. grayana	040ac00804
Orobanche cooperi	e000000000
Orobanche corymbosa	4602c40106
Orobanche fasciculata	5fffffff07
Orobanche parishii	58c000d503
Orobanche parishii subsp. brachyloba	1880000000
Orobanche parishii subsp. parishii	58c000d503
Orobanche pinorum	043d400800
Orobanche ramosa	0080012800
Orobanche uniflora	0fbdfb8b04
Orobanche valida	0018001001
Orobanche valida subsp. howellii	0018000000
Orobanche valida subsp. valida	0000001001
Orobanche vallicola	0378036a00
Orochaenactis thysanocarpha	0000000100
Orogenia fusiformis	0401400000
Orthilia secunda	0409c04504
Orthocarpus bracteosus	0602400004
Orthocarpus cuspidatus	063fc40006
Orthocarpus cuspidatus subsp. copelandii	0609400000
Orthocarpus cuspidatus subsp. cryptanthus	0402c40006
Orthocarpus cuspidatus subsp. cuspidatus	063d000000
Orthocarpus imbricatus	0621000000
Orthocarpus luteus	0002040006
Orthocarpus pachystachyus	0601000000
Oryctes nevadensis	0000040002
Oryza sativa	0000002200
Osmadenia tenella	00c0005401
Osmorhiza berteroi	1ffffbff05
Osmorhiza brachypoda	004073dc01
Osmorhiza depauperata	0002000004
Osmorhiza occidentalis	043bc40004
Osmorhiza purpurea	0004000000
Ottelia alismoides	0000000200
Oxalis articulata	09c4004a00
Oxalis articulata subsp. rubra	09c4004a00
Oxalis bowiei	0080000200
Oxalis californica	18c0001001
Oxalis corniculata	01e0186a00
Oxalis incarnata	0004000800
Oxalis micrantha	0100380200
Oxalis oregana	0125000800
Oxalis pes-caprae	19e40b1e01
Oxalis pilosa	01e40b0801
Oxalis purpurea	0100000800
Oxalis suksdorfii	0004000000
Oxalis trilliifolia	0025000000
Oxypolis occidentalis	0200f89502
Oxyria digyna	0401fcc506
Oxystylis lutea	6000000000
Oxytheca dendroidea	0002040106
Oxytheca dendroidea subsp. dendroidea	0002040106
Oxytheca perfoliata	6002042006
Oxytheca watsonii	0000000002
Oxytropis borealis	0000000102
Oxytropis borealis var. australis	0000000102
Oxytropis borealis var. viscida	0000000102
Oxytropis deflexa	0000000002
Oxytropis deflexa var. sericea	0000000002
Oxytropis oreophila	0000000400
Oxytropis oreophila var. oreophila	0000000400
Oxytropis parryi	0000840102
Ozomelis diversifolia	0429400000
Ozomelis trifida	0009400000
Packera bernardina	0000000400
Packera bolanderi	0004000000
Packera bolanderi var. bolanderi	0004000000
Packera breweri	010023a801
Packera cana	0603fc8106
Packera clevelandii	0038100000
Packera eurycephala	063f400004
Packera eurycephala var. eurycephala	063f400004
Packera eurycephala var. lewisrosei	0000400000
Packera ganderi	0040004000
Packera greenei	0039000000
Packera hesperia	0001000000
Packera indecora	0402c00104
Packera ionophylla	0000201500
Packera layneae	0000180000
Packera macounii	0001000000
Packera multilobata	4002c40106
Packera pauciflora	0400c00100
Packera pseudaurea	0400f88104
Packera pseudaurea subsp. pseudaurea	0400f88104
Packera pseudaurea var. pseudaurea	0400f88104
Packera streptanthifolia	0602c00104
Packera streptanthifolia var. streptanthifolia	0602c00104
Packera subnuda	0402c00004
Packera subnuda var. subnuda	0402c00004
Packera werneriifolia	0000c40102
Paeonia brownii	063bd80804
Paeonia californica	0140035401
Palafoxia arida	e000000000
Palafoxia arida var. arida	e000000000
Palafoxia arida var. gigantea	8000000000
Pancratium maritimum	0080000000
Panicum acuminatum	5ffdffff03
Panicum acuminatum var. fasciculatum	5ffdffff03
Panicum acuminatum var. lindheimeri	0204003200
Panicum acuminatum var. thermale	0410000000
Panicum antidotale	e000000000
Panicum capillare	ffffffff07
Panicum dichotomiflorum	02c0f86b00
Panicum dichotomiflorum subsp. dichotomiflorum	02c0f86b00
Panicum dichotomiflorum var. dichotomiflorum	02c0f86b00
Panicum hillmanii	80f8f86300
Panicum hirticaule	e000000000
Panicum hirticaule subsp. hirticaule	e000000000
Panicum hirticaule var. hirticaule	e000000000
Panicum miliaceum	e1fcfb7f01
Panicum miliaceum subsp. miliaceum	e1fcfb7f01
Panicum oligosanthes	063d000000
Panicum oligosanthes var. scribnerianum	063d000000
Panicum rigidulum	0000f8a300
Panicum rigidulum subsp. rigidulum	0000f8a300
Panicum rigidulum var. rigidulum	0000f8a300
Panicum urvilleanum	e080000000
Papaver argemone	0100030800
Papaver californicum	19c0035c01
Papaver heterophyllum	19fd337c01
Papaver hybridum	6100032800
Papaver rhoeas	1ffdfbff01
Papaver somniferum	1ffdfbff01
Parapholis incurva	1994002200
Parapholis strigosa	0004000000
Parentucellia latifolia	0100000000
Parentucellia viscosa	0334180200
Parietaria hespera	d9c0205c03
Parietaria hespera var. californica	19c0004800
Parietaria hespera var. hespera	d9c0205403
Parietaria judaica	0180000a00
Parietaria pensylvanica	0011204100
Parkinsonia aculeata	80c0006001
Parkinsonia florida	e000000000
Parkinsonia microphylla	e000000000
Parnassia cirrata	0401001400
Parnassia cirrata var. cirrata	0000001400
Parnassia cirrata var. intermedia	0401000000
Parnassia fimbriata	0001c00106
Parnassia palustris	0429c70d02
Parnassia parviflora	0000800000
Paronychia ahartii	0200000200
Paronychia echinulata	0000002000
Paronychia echinulata var. echinulata	0000002000
Paronychia franciscana	0104000800
Parthenocissus inserta	19c0037e01
Paspalum dilatatum	7ffdfbff01
Paspalum distichum	3fffffff07
Paspalum urvillei	0080000200
Paspalum vaginatum	8080000000
Passiflora caerulea	00c0004001
Passiflora tarminiana	0100000000
Pastinaca sativa	0533001605
Paxistima myrsinites	063fd80804
Pectiantia breweri	0400c00100
Pectiantia ovalis	0124000000
Pectiantia pentandra	0409c00104
Pectis papposa	e000000002
Pectis papposa var. papposa	e000000002
Pectocarya heterocarpa	f8c020d403
Pectocarya linearis	f9c023fe01
Pectocarya linearis subsp. ferocula	f9c023fe01
Pectocarya linearis var. ferocula	f9c023fe01
Pectocarya penicillata	fffffbff03
Pectocarya peninsularis	8000000000
Pectocarya platycarpa	f8c0005403
Pectocarya pusilla	073dfb0800
Pectocarya recurvata	e000201503
Pectocarya setosa	f9c2275d03
Pedicularis attollens	0603c00106
Pedicularis bracteosa	0001000000
Pedicularis bracteosa var. flavida	0001000000
Pedicularis centranthera	0002000004
Pedicularis contorta	0001000000
Pedicularis crenulata	0000040002
Pedicularis densiflora	1ffd3bdc01
Pedicularis dudleyi	0100020800
Pedicularis groenlandica	0601c00100
Pedicularis howellii	0001000000
Pedicularis racemosa	0601440002
Pedicularis semibarbata	0448f8d501
Pediomelum californicum	0150235c01
Pediomelum castoreum	6000000000
Peganum harmala	6000000000
Pelargonium X hortorum	1880000000
Pelargonium capitatum	0100000000
Pelargonium grossularioides	0184000800
Pelargonium inquinans	0000000800
Pelargonium panduriforme	0180000000
Pelargonium peltatum	1880000000
Pelargonium vitifolium	0104000000
Pelargonium zonale	0180000800
Pellaea andromedifolia	1bf8fbdd01
Pellaea brachyptera	0639400000
Pellaea breweri	4403c40106
Pellaea bridgesii	0000c00100
Pellaea mucronata	5ff8ffff03
Pellaea mucronata subsp. californica	4040845503
Pellaea mucronata subsp. mucronata	5ff8ffff03
Pellaea mucronata var. californica	4040845503
Pellaea mucronata var. mucronata	5ff8ffff03
Pellaea truncata	4000000000
Peltandra virginica	0000002000
Pennisetum ciliare	80c0004000
Pennisetum clandestinum	edc4104a00
Pennisetum setaceum	e1c0007e01
Pennisetum villosum	98c0fbdd01
Penstemon albomarginatus	6000000000
Penstemon anguineus	0009000000
Penstemon azureus	063dd80000
Penstemon azureus subsp. angustissimus	0608d80000
Penstemon azureus subsp. azureus	063dc00000
Penstemon azureus var. angustissimus	0608d80000
Penstemon azureus var. azureus	063dc00000
Penstemon barnebyi	0000000002
Penstemon bicolor	4000000000
Penstemon caesius	0000001500
Penstemon calcareus	4000000000
Penstemon californicus	0040004000
Penstemon centranthifolius	38f80b7e01
Penstemon cinicola	0002040006
Penstemon clevelandii	4040004000
Penstemon clevelandii subsp. clevelandii	0000000000
Penstemon clevelandii subsp. connatus	0040004000
Penstemon clevelandii subsp. mohavensis	4000000000
Penstemon clevelandii var. clevelandii	0000000000
Penstemon clevelandii var. connatus	0040004000
Penstemon clevelandii var. mohavensis	4000000000
Penstemon davidsonii	0401c40104
Penstemon davidsonii subsp. davidsonii	0401c40104
Penstemon davidsonii var. davidsonii	0401c40104
Penstemon deustus	043bc40006
Penstemon deustus subsp. deustus	043bc40006
Penstemon deustus var. deustus	043bc40006
Penstemon deustus var. pedicellatus	0402400004
Penstemon deustus var. suffrutescens	0409400000
Penstemon eatonii	e000000400
Penstemon eatonii subsp. eatonii	4000000000
Penstemon eatonii subsp. undosus	e000000400
Penstemon eatonii var. eatonii	4000000000
Penstemon eatonii var. undosus	e000000400
Penstemon filiformis	0401000000
Penstemon floridus	4000040002
Penstemon floridus subsp. austinii	4000000002
Penstemon floridus subsp. floridus	0000040002
Penstemon floridus var. austinii	4000000002
Penstemon floridus var. floridus	0000040002
Penstemon fruticiformis	4000040002
Penstemon fruticiformis subsp. amargosae	4000000000
Penstemon fruticiformis subsp. fruticiformis	4000040002
Penstemon fruticiformis var. amargosae	4000000000
Penstemon fruticiformis var. fruticiformis	4000040002
Penstemon gracilentus	0602400004
Penstemon grinnellii	6040237d01
Penstemon grinnellii subsp. grinnellii	6040207501
Penstemon grinnellii subsp. scrophularioides	0000231d01
Penstemon grinnellii var. grinnellii	6040207501
Penstemon grinnellii var. scrophularioides	0000231d01
Penstemon heterodoxus	0402c40106
Penstemon heterodoxus subsp. cephalophorus	0000400100
Penstemon heterodoxus subsp. heterodoxus	0000c40102
Penstemon heterodoxus var. cephalophorus	0000400100
Penstemon heterodoxus var. heterodoxus	0000c40102
Penstemon heterodoxus var. shastensis	0402000004
Penstemon heterophyllus	02784b5e01
Penstemon heterophyllus subsp. australis	0040035c01
Penstemon heterophyllus subsp. heterophyllus	0038030001
Penstemon heterophyllus subsp. purdyi	0238490a00
Penstemon heterophyllus var. australis	0040035c01
Penstemon heterophyllus var. heterophyllus	0038030001
Penstemon heterophyllus var. purdyi	0238490a00
Penstemon humilis	0402040006
Penstemon humilis subsp. humilis	0402040006
Penstemon humilis var. humilis	0402040006
Penstemon incertus	604000c500
Penstemon janishiae	0002400004
Penstemon labrosus	0040005401
Penstemon laetus	0603f88105
Penstemon laetus subsp. laetus	0000f88101
Penstemon laetus subsp. leptosepalus	0602480004
Penstemon laetus subsp. sagittatus	0601000000
Penstemon laetus var. laetus	0000f88101
Penstemon laetus var. leptosepalus	0602480004
Penstemon laetus var. sagittatus	0601000000
Penstemon monoensis	6000040002
Penstemon neotericus	0600480000
Penstemon newberryi	0439c08100
Penstemon newberryi subsp. berryi	0029000000
Penstemon newberryi subsp. newberryi	0400c08100
Penstemon newberryi subsp. sonomensis	0038000000
Penstemon newberryi var. berryi	0029000000
Penstemon newberryi var. newberryi	0400c08100
Penstemon newberryi var. sonomensis	0038000000
Penstemon pahutensis	4000000000
Penstemon palmeri	6000000000
Penstemon palmeri subsp. palmeri	6000000000
Penstemon palmeri var. palmeri	6000000000
Penstemon papillatus	0000840102
Penstemon parvulus	0001000100
Penstemon patens	0000840102
Penstemon personatus	0000480000
Penstemon procerus	0009c00100
Penstemon procerus subsp. brachyanthus	0009000000
Penstemon procerus subsp. formosus	0001c00100
Penstemon procerus var. brachyanthus	0009000000
Penstemon procerus var. formosus	0001c00100
Penstemon pseudospectabilis	c000000000
Penstemon purpusii	0009000000
Penstemon rattanii	0025000800
Penstemon rattanii subsp. kleei	0000000800
Penstemon rattanii subsp. rattanii	0025000000
Penstemon rattanii var. kleei	0000000800
Penstemon rattanii var. rattanii	0025000000
Penstemon roezlii	0603c00104
Penstemon rostriflorus	4040845503
Penstemon rupicola	0401000000
Penstemon rydbergii	0602c40106
Penstemon rydbergii var. oreocharis	0602c40106
Penstemon scapoides	4000000002
Penstemon speciosus	4603c41507
Penstemon spectabilis	0040005401
Penstemon spectabilis subsp. spectabilis	0040005400
Penstemon spectabilis subsp. subviscosus	0000001401
Penstemon spectabilis var. spectabilis	0040005400
Penstemon spectabilis var. subviscosus	0000001401
Penstemon stephensii	4000000000
Penstemon sudans	0402000004
Penstemon thompsoniae	4000000000
Penstemon thurberi	6040004000
Penstemon tracyi	0001000000
Penstemon utahensis	4000000000
Penstemon venustus	0400000000
Pentachaeta alsinoides	01383b0801
Pentachaeta aurea	00c0005400
Pentachaeta aurea subsp. allenii	00c0000000
Pentachaeta aurea subsp. aurea	00c0005400
Pentachaeta bellidiflora	0100000800
Pentachaeta exilis	01383b2a00
Pentachaeta exilis subsp. aeolica	0000030800
Pentachaeta exilis subsp. exilis	01383b2a00
Pentachaeta exilis var. exilis	01383b2a00
Pentachaeta fragilis	0000232101
Pentachaeta lyonii	1080000001
Pentagramma pallida	0000f98100
Pentagramma triangularis	5fffffff03
Pentagramma triangularis subsp. maxonii	4040004400
Pentagramma triangularis subsp. triangularis	5fffffff03
Pentagramma triangularis subsp. viscosa	1880000000
Peraphyllum ramosissimum	4402c40006
Pericome caudata	4000240102
Perideridia bacigalupii	0000180000
Perideridia bolanderi	0403dc0104
Perideridia bolanderi subsp. bolanderi	0403c40104
Perideridia bolanderi subsp. involucrata	0000180000
Perideridia californica	0000130800
Perideridia gairdneri	01bd000004
Perideridia gairdneri subsp. borealis	0009000004
Perideridia gairdneri subsp. gairdneri	01b4000000
Perideridia howellii	0621580000
Perideridia kelloggii	033d180800
Perideridia lemmonii	0000fc8100
Perideridia leptocarpa	0001000000
Perideridia oregana	043b010804
Perideridia parishii	0641c45503
Perideridia parishii subsp. latifolia	0641c45503
Perideridia parishii subsp. parishii	0000000400
Perideridia pringlei	0000038001
Peritoma arborea	f8c023f401
Peritoma arborea var. angustata	e000000000
Peritoma arborea var. arborea	10c0004000
Peritoma arborea var. globosa	788023b401
Peritoma jonesii	8000000000
Peritoma lutea	4000040002
Peritoma platycarpa	0402000004
Peritoma serrulata	01c2447004
Perityle emoryi	f8c0000000
Perityle intricata	4000000000
Perityle inyoensis	0000000002
Perityle megalocephala	4000000002
Perityle megalocephala var. megalocephala	0000000002
Perityle megalocephala var. oligophylla	4000000002
Perityle villosa	4000000002
Persea americana	0080000000
Persicaria amphibia	ffffffff07
Persicaria capitata	01c4004800
Persicaria hydropiper	1ffdfbff01
Persicaria hydropiperoides	9ffdfbff01
Persicaria lapathifolia	ffffffff07
Persicaria maculosa	ffffffff07
Persicaria orientalis	0000020200
Persicaria pensylvanica	0000000200
Persicaria punctata	ffffffff07
Persicaria wallichii	0104000000
Petalonyx linearis	e000000000
Petalonyx nitidus	6000000002
Petalonyx thurberi	e000000000
Petalonyx thurberi subsp. gilmanii	2000000000
Petalonyx thurberi subsp. thurberi	e000000000
Petalonyx thurberi var. gilmanii	2000000000
Petalonyx thurberi var. thurberi	e000000000
Petasites frigidus	013d430800
Petasites frigidus var. palmatus	013d430800
Peteria thompsoniae	4000000000
Petradoria pumila	4000000000
Petradoria pumila subsp. pumila	4000000000
Petradoria pumila var. pumila	4000000000
Petrophytum caespitosum	4000000102
Petrophytum caespitosum subsp. acuminatum	0000000100
Petrophytum caespitosum subsp. caespitosum	4000000002
Petrophytum caespitosum var. caespitosum	4000000002
Petrorhagia dubia	0378ca4200
Petrorhagia nanteuilii	0068000000
Petrorhagia prolifera	0000100000
Petroselinum crispum	0102080004
Petunia parviflora	89c0034800
Peucephyllum schottii	e000000000
Phacelia adenophora	0002400004
Phacelia affinis	e040015403
Phacelia amabilis	6000000000
Phacelia anelsonii	4000000000
Phacelia argentea	0004000000
Phacelia austromontana	4000b05503
Phacelia barnebyana	4000000002
Phacelia bicolor	6002c40106
Phacelia bicolor var. bicolor	6002c40106
Phacelia bolanderi	003d000000
Phacelia brachyloba	00c0035401
Phacelia breweri	0000010800
Phacelia californica	0124000800
Phacelia calthifolia	6000000000
Phacelia campanularia	e000000000
Phacelia campanularia subsp. campanularia	8000000000
Phacelia campanularia subsp. vasiformis	e000000000
Phacelia campanularia var. campanularia	8000000000
Phacelia campanularia var. vasiformis	e000000000
Phacelia cicutaria	f8c0bbd401
Phacelia cicutaria subsp. cicutaria	0000b88000
Phacelia cicutaria subsp. hispida	f8c0035401
Phacelia cicutaria var. cicutaria	0000b88000
Phacelia cicutaria var. hispida	f8c0035401
Phacelia ciliata	01f831fe01
Phacelia coerulea	6000000000
Phacelia congdonii	0000308001
Phacelia cookei	0400000000
Phacelia corymbosa	0439000000
Phacelia crenulata	e002040006
Phacelia crenulata var. ambigua	e000000000
Phacelia crenulata var. crenulata	6002040006
Phacelia crenulata var. minutiflora	8000000000
Phacelia cryptantha	6040255502
Phacelia curvipes	604024d503
Phacelia dalesiana	0001000000
Phacelia davidsonii	0040b2d501
Phacelia distans	f9f82f7f03
Phacelia divaricata	013d010800
Phacelia douglasii	718023ba01
Phacelia egena	063dfbbb01
Phacelia eisenii	0000f88100
Phacelia exilis	0000201501
Phacelia floribunda	1000000000
Phacelia fremontii	6000253d03
Phacelia glandulifera	0602040006
Phacelia grandiflora	18c0001001
Phacelia greenei	0001000000
Phacelia grisea	0000020001
Phacelia gymnoclada	0000040000
Phacelia hastata	0403c40506
Phacelia hastata subsp. compacta	0400c40106
Phacelia hastata subsp. hastata	0403c40506
Phacelia hastata var. compacta	0400c40106
Phacelia hastata var. hastata	0403c40506
Phacelia heterophylla	063fdc0006
Phacelia heterophylla subsp. virgata	063fdc0006
Phacelia heterophylla var. virgata	063fdc0006
Phacelia hubbyi	0880000001
Phacelia humilis	0002c48106
Phacelia humilis var. dudleyi	0000c08100
Phacelia humilis var. humilis	0002c40106
Phacelia hydrophylloides	0400c00100
Phacelia imbricata	01f8fbff01
Phacelia imbricata subsp. imbricata	01b8fbbf01
Phacelia imbricata subsp. patula	0040005400
Phacelia imbricata var. imbricata	01b8fbbf01
Phacelia imbricata var. patula	0040005400
Phacelia insularis	0904000000
Phacelia insularis var. continentis	0104000000
Phacelia insularis var. insularis	0800000000
Phacelia inundata	0002000004
Phacelia inyoensis	0000040002
Phacelia ivesiana	e000000000
Phacelia keckii	0040000000
Phacelia lemmonii	e040044002
Phacelia leonis	0001000000
Phacelia linearis	0603480004
Phacelia longipes	6000021001
Phacelia lyonii	1000000000
Phacelia malvifolia	0104030800
Phacelia marcescens	0000d80000
Phacelia minor	80c0005401
Phacelia mohavensis	0000001500
Phacelia monoensis	0000040000
Phacelia mustelina	4000000000
Phacelia mutabilis	043bc04104
Phacelia nashiana	2000008100
Phacelia neglecta	e000000000
Phacelia nemoralis	0124020800
Phacelia nemoralis subsp. nemoralis	0120020800
Phacelia nemoralis subsp. oregonensis	0024000000
Phacelia nemoralis var. nemoralis	0120020800
Phacelia nemoralis var. oregonensis	0024000000
Phacelia novenmillensis	2000000100
Phacelia orogenes	0000000100
Phacelia pachyphylla	e000000000
Phacelia parishii	6000000000
Phacelia parryi	b8c0015401
Phacelia pedicellata	e000000000
Phacelia peirsoniana	0000040000
Phacelia perityloides	6000000002
Phacelia perityloides var. jaegeri	4000000000
Phacelia perityloides var. perityloides	2000000002
Phacelia phacelioides	0000010800
Phacelia platyloba	0000300000
Phacelia pringlei	0401000000
Phacelia procera	0409400000
Phacelia pulchella	2000000000
Phacelia pulchella var. gooddingii	2000000000
Phacelia purpusii	0402f88104
Phacelia quickii	0000d80000
Phacelia racemosa	0601d80000
Phacelia ramosissima	4dfdffdd07
Phacelia rattanii	0639030800
Phacelia rotundifolia	e000000002
Phacelia saxicola	2000040002
Phacelia sericea	0001000004
Phacelia sericea subsp. ciliosa	0001000004
Phacelia sericea var. ciliosa	0001000004
Phacelia stebbinsii	0000480000
Phacelia stellaris	0080000000
Phacelia suaveolens	0010110800
Phacelia tanacetifolia	62f0fbff01
Phacelia tetramera	0000040002
Phacelia thermalis	0602000004
Phacelia umbrosa	0040004000
Phacelia vallicola	0600d80100
Phacelia vallis-mortae	e000042002
Phacelia viscida	1980020001
Phacelia viscida var. albiflora	0080020001
Phacelia viscida var. viscida	1980020001
Phalacroseris bolanderi	0000c00100
Phalaris angusta	60f0026b00
Phalaris aquatica	66fd424b01
Phalaris arundinacea	643ffaa306
Phalaris brachystachys	0000030a00
Phalaris californica	013d020800
Phalaris canariensis	41c5034a01
Phalaris caroliniana	19e40a7601
Phalaris coerulescens	9000020000
Phalaris lemmonii	60c04b6b01
Phalaris minor	f9fdfbff01
Phalaris paradoxa	81b0f8ab00
Phaseolus filiformis	8000000000
Philadelphus lewisii	067dd81300
Philadelphus microphyllus	4040004002
Phleum alpinum	053dc44506
Phleum pratense	1fffffff07
Phlox adsurgens	0629000000
Phlox austromontana	0040005400
Phlox condensata	0000c40502
Phlox diffusa	1fffffff07
Phlox dispersa	0000000100
Phlox dolichantha	0000000400
Phlox douglasii	0002840006
Phlox hirsuta	0400000000
Phlox hoodii	0002440006
Phlox hoodii subsp. canescens	0002440006
Phlox hoodii var. canescens	0002440006
Phlox muscoides	0400000000
Phlox pulvinata	0000c40102
Phlox speciosa	0639f88100
Phlox stansburyi	4002040006
Phlox stansburyi subsp. stansburyi	4002040006
Phlox stansburyi subsp. superba	0000000002
Phlox stansburyi var. brevifolia	4002040006
Phlox stansburyi var. stansburyi	4002040006
Phoenicaulis cheiranthoides	040bc40106
Phoenix canariensis	0080000800
Phoenix dactylifera	e080000000
Pholisma arenarium	e1c0004000
Pholisma sonorae	8000000000
Pholistoma auritum	99d033fd01
Pholistoma auritum var. arizonicum	8000000000
Pholistoma auritum var. auritum	19d033fd01
Pholistoma membranaceum	f9c033fc01
Pholistoma racemosum	18c0004000
Phoradendron bolleanum	e77bf75d07
Phoradendron californicum	e000000001
Phoradendron juniperinum	647bcd5507
Phoradendron serotinum	e7f9fbff01
Phoradendron serotinum subsp. macrophyllum	e1f03b7e01
Phoradendron serotinum subsp. tomentosum	66f9fbff01
Phragmites australis	ffffffff07
Phyla lanceolata	e180002a00
Phyla nodiflora	f9f4006a00
Phyllodoce breweri	0400c00500
Phyllodoce empetriformis	0401000000
Phyllospadix scouleri	1984000000
Phyllospadix torreyi	1984000000
Phyllostachys aurea	0100000000
Physalis acutifolia	8080002000
Physalis crassifolia	e040044002
Physalis hederifolia	6040040002
Physalis hederifolia var. fendleri	6000040002
Physalis hederifolia var. palmeri	4040000000
Physalis lancifolia	8000012a00
Physalis lobata	e000000000
Physalis longifolia	0400000000
Physalis philadelphica	01c03b6a00
Physalis pubescens	e020042002
Physalis pubescens var. grisea	e000040002
Physalis pubescens var. integrifolia	0020002000
Physalis viscosa	0080000000
Physaria chambersii	4000000000
Physaria cordiformis	4000000000
Physaria kingii	4000040402
Physaria kingii subsp. bernardina	0000000400
Physaria kingii subsp. kingii	4000040002
Physaria kingii subsp. latifolia	4000000000
Physaria ludoviciana	0000040002
Physaria occidentalis	040b400004
Physaria occidentalis subsp. occidentalis	040b400004
Physaria tenella	e000000000
Physocarpus alternans	4000000002
Physocarpus capitatus	1ffdfbdd01
Phytolacca americana	1ffdfbff01
Phytolacca americana var. americana	1ffdfbff01
Phytolacca heterotepala	0100000000
Phytolacca icosandra	00c0000000
Picea breweriana	0001000000
Picea engelmannii	0401000000
Picea sitchensis	0004000000
Pickeringia montana	08780b5c01
Pickeringia montana subsp. montana	08380b1c01
Pickeringia montana subsp. tomentosa	0040004400
Pickeringia montana var. montana	08380b1c01
Pickeringia montana var. tomentosa	0040004400
Pilostyles thurberi	8000000000
Pilularia americana	06d27b6a05
Pinguicula macroceras	0001000000
Pinus albicaulis	0401c40106
Pinus attenuata	067ffbcd04
Pinus balfouriana	0009000100
Pinus balfouriana subsp. austrina	0000000100
Pinus balfouriana subsp. balfouriana	0009000000
Pinus contorta	0407c45506
Pinus contorta subsp. bolanderi	0004000000
Pinus contorta subsp. contorta	0004000000
Pinus contorta subsp. murrayana	0403c45506
Pinus contorta var. bolanderi	0004000000
Pinus contorta var. contorta	0004000000
Pinus contorta var. murrayana	0403c45506
Pinus coulteri	19c0035c01
Pinus edulis	4000000000
Pinus flexilis	4040c45503
Pinus jeffreyi	067bfdd507
Pinus lambertiana	1efffed507
Pinus longaeva	4000000002
Pinus monophylla	404085d503
Pinus monticola	040bc40106
Pinus muricata	0904000800
Pinus ponderosa	067af8dd05
Pinus ponderosa subsp. ponderosa	0402400004
Pinus ponderosa subsp. washoensis	0400400004
Pinus ponderosa var. pacifica	0678f8dd01
Pinus ponderosa var. ponderosa	0402400004
Pinus ponderosa var. washoensis	0400400004
Pinus quadrifolia	0040004000
Pinus radiata	01c4000000
Pinus sabiniana	ffffffdf07
Pinus torreyana	0880000000
Pinus torreyana subsp. insularis	0800000000
Pinus torreyana subsp. torreyana	0080000000
Pinus torreyana var. insularis	0800000000
Pinus torreyana var. torreyana	0080000000
Piperia candida	003d000800
Piperia colemanii	0408f88100
Piperia cooperi	10c0005000
Piperia elegans	0125000800
Piperia elegans subsp. decurtata	0100000000
Piperia elegans subsp. elegans	0125000800
Piperia elegans var. elegans	0125000800
Piperia elongata	0ffdfbdd01
Piperia leptopetala	0679fbdd01
Piperia michaelii	0984380801
Piperia transversa	077dfbdd01
Piperia unalascensis	1ffff8dd05
Piperia yadonii	0100000000
Pistacia atlantica	0000000200
Pistia stratiotes	8000000000
Pisum sativum	00e4026200
Pittosporum crassifolium	0100000000
Pittosporum tenuifolium	0100000000
Pittosporum tobira	0080000000
Pittosporum undulatum	1180000000
Pityopus californicus	0125000900
Plagiobothrys acanthocarpus	0280022a00
Plagiobothrys arizonicus	f8d021fd03
Plagiobothrys austiniae	0200182200
Plagiobothrys bracteatus	67fffbea04
Plagiobothrys canescens	7bc07bfe01
Plagiobothrys canescens var. canescens	7bc07bfe01
Plagiobothrys canescens var. catalinensis	7800012000
Plagiobothrys chorisianus	0121020800
Plagiobothrys chorisianus var. chorisianus	0121000800
Plagiobothrys chorisianus var. hickmanii	0100020800
Plagiobothrys cognatus	0613dc0006
Plagiobothrys collinus	99c0037c01
Plagiobothrys collinus var. californicus	99c0037c01
Plagiobothrys collinus var. fulvescens	98c0035401
Plagiobothrys collinus var. gracilis	18c0000000
Plagiobothrys collinus var. ursinus	0040004400
Plagiobothrys cusickii	0412c40206
Plagiobothrys diffusus	0100000800
Plagiobothrys distantiflorus	0000180000
Plagiobothrys fulvus	02b83a0800
Plagiobothrys fulvus var. campestris	02b83a0800
Plagiobothrys glaber	0100000800
Plagiobothrys glyptocarpus	0610180200
Plagiobothrys glyptocarpus var. glyptocarpus	0610180200
Plagiobothrys glyptocarpus var. modestus	0010080000
Plagiobothrys greenei	0238782200
Plagiobothrys hispidulus	047bfcd507
Plagiobothrys hispidus	0603c40106
Plagiobothrys humistratus	02803a2200
Plagiobothrys hystriculus	0000000200
Plagiobothrys infectivus	0010032800
Plagiobothrys jonesii	e000040102
Plagiobothrys kingii	2002840006
Plagiobothrys kingii var. harknessii	0002840006
Plagiobothrys kingii var. kingii	2000040002
Plagiobothrys leptocladus	7ac2077e07
Plagiobothrys lithocaryus	0010000000
Plagiobothrys mollis	0402400800
Plagiobothrys mollis var. mollis	0402400000
Plagiobothrys mollis var. vestitus	0000000800
Plagiobothrys nitens	0000040002
Plagiobothrys nothofulvus	1ffdfbff01
Plagiobothrys parishii	6000040002
Plagiobothrys reticulatus	0125020800
Plagiobothrys reticulatus var. reticulatus	0125000000
Plagiobothrys reticulatus var. rossianorum	0104020800
Plagiobothrys salsus	6002000004
Plagiobothrys scriptus	0200180200
Plagiobothrys shastensis	023d1b0800
Plagiobothrys stipitatus	067bff6a06
Plagiobothrys stipitatus var. micranthus	067bff6a06
Plagiobothrys stipitatus var. stipitatus	02000a2a00
Plagiobothrys strictus	0010000000
Plagiobothrys tenellus	fffffbff05
Plagiobothrys tener	063a000004
Plagiobothrys tener var. subglaber	0010000000
Plagiobothrys tener var. tener	063a000004
Plagiobothrys torreyi	0000f28500
Plagiobothrys torreyi var. diffusus	0000c08500
Plagiobothrys torreyi var. perplexans	0000b20100
Plagiobothrys torreyi var. torreyi	0000c00100
Plagiobothrys trachycarpus	00c0026a01
Plagiobothrys uncinatus	0000020000
Plagiobothrys undulatus	01e4024a01
Plagiobothrys verrucosus	0000000800
Planodes virginicum	0080002200
Plantago arenaria	0180000800
Plantago aristata	0084002200
Plantago coronopus	1185082a00
Plantago elongata	1bfd1b7e01
Plantago erecta	1ffdfbff01
Plantago eriopoda	0601000000
Plantago lanceolata	1ffdfbff01
Plantago major	7fffc77f07
Plantago maritima	0904000800
Plantago ovata	f9c0077c03
Plantago ovata var. fastigiata	e1c0077c03
Plantago ovata var. insularis	1880000000
Plantago patagonica	e040005400
Plantago pusilla	0080002000
Plantago rhodosperma	0280000000
Plantago subnuda	0984000800
Plantago truncata	0000082a00
Plantago truncata subsp. firma	0000082a00
Plantago virginica	0280002200
Platanthera dilatata	5fffffdd07
Platanthera dilatata var. leucostachys	5fffffdd07
Platanthera sparsiflora	e6aff89505
Platanthera stricta	0603000004
Platanthera tescamnis	0002fc8106
Platanthera yosemitensis	0000800000
Platanus X hispanica	0200080200
Platanus racemosa	fbc033fe01
Platystemon californicus	fffdfbff01
Plecostachys serpyllifolia	0180000000
Plectritis ciliosa	1ffdfbff01
Plectritis congesta	1ffffbff05
Plectritis congesta subsp. brachystemon	1ffffbff05
Plectritis congesta subsp. congesta	013dfb8b00
Plectritis congesta var. congesta	013dfb8b00
Plectritis macrocera	1ffffbff05
Pleiacanthus spinosus	4002c41506
Pleuricospora fimbriolata	0425c00900
Pleurocoronis pluriseta	e000000000
Pleuropogon californicus	033d1a2a00
Pleuropogon californicus var. californicus	033d1a2a00
Pleuropogon californicus var. davyi	0030000000
Pleuropogon hooverianus	0034000800
Pleuropogon refractus	0025000000
Pluchea odorata	f9c0007601
Pluchea odorata var. odorata	f9c0007601
Pluchea sericea	f1c0037401
Plumbago auriculata	0080000000
Poa abbreviata	0000c00102
Poa abbreviata subsp. marshii	0000000002
Poa abbreviata subsp. pattersonii	0000c00102
Poa annua	ffffffff07
Poa atropurpurea	0040004400
Poa bigelovii	f8c0005401
Poa bolanderi	043fc04104
Poa bulbosa	ffffffff07
Poa bulbosa subsp. bulbosa	0000000800
Poa bulbosa subsp. vivipara	ffffffff07
Poa bulbosa var. bulbosa	0000000800
Poa bulbosa var. vivipara	ffffffff07
Poa compressa	ffffffff07
Poa confinis	0004000000
Poa cusickii	0003c40106
Poa cusickii subsp. cusickii	0003440006
Poa cusickii subsp. epilis	0000c00100
Poa cusickii subsp. pallida	0000800102
Poa cusickii subsp. purpurascens	0001400000
Poa cusickii var. cusickii	0003440006
Poa cusickii var. epilis	0000c00100
Poa cusickii var. purpurascens	0001400000
Poa diaboli	0100000000
Poa douglasii	0904000000
Poa fendleriana	4042c44506
Poa fendleriana subsp. fendleriana	0000004400
Poa fendleriana subsp. longiligula	4042c44506
Poa fendleriana var. fendleriana	0000004400
Poa fendleriana var. longiligula	4042c44506
Poa glauca	0000c00102
Poa glauca subsp. rupicola	0000c00102
Poa glauca var. rupicola	0000c00102
Poa howellii	1f7ddbde01
Poa infirma	19c0037e01
Poa keckii	0000c40102
Poa kelloggii	0104000000
Poa leptocoma	0403c40006
Poa leptocoma subsp. leptocoma	0403c40006
Poa leptocoma var. leptocoma	0403c40006
Poa lettermanii	0000000102
Poa macrantha	0004000000
Poa napensis	0020000000
Poa nemoralis	003df88100
Poa palustris	0402c41406
Poa piperi	0001000000
Poa pratensis	ffffffff07
Poa pratensis subsp. pratensis	ffffffff07
Poa pratensis var. pratensis	ffffffff07
Poa pringlei	0401400000
Poa rhizomata	0001000000
Poa secunda	ffffffff07
Poa secunda subsp. juncifolia	043fc40106
Poa secunda subsp. secunda	ffffffff07
Poa secunda var. secunda	ffffffff07
Poa sierrae	0000c80000
Poa stebbinsii	0000800100
Poa tenerrima	0000380000
Poa trivialis	0024000000
Poa unilateralis	0104000000
Poa unilateralis subsp. unilateralis	0104000000
Poa wheeleri	040bc40106
Podistera nevadensis	0000c00402
Pogogyne abramsii	0080000000
Pogogyne clareana	0000020000
Pogogyne douglasii	01303b2a00
Pogogyne floribunda	0002000004
Pogogyne nudiuscula	0080000000
Pogogyne serpylloides	00381a0800
Pogogyne zizyphoroides	0020182a00
Polanisia dodecandra	0612180204
Polanisia dodecandra subsp. trachysperma	0612180204
Polanisia dodecandra var. trachysperma	0612180204
Polemonium californicum	0401c00000
Polemonium carneum	013d000800
Polemonium chartaceum	0001040002
Polemonium eximium	0000800100
Polemonium micranthum	0403422005
Polemonium occidentale	0401fc8506
Polemonium occidentale subsp. occidentale	0401fc8506
Polemonium occidentale var. occidentale	0401fc8506
Polemonium pulcherrimum	040bc40004
Polemonium pulcherrimum subsp. pulcherrimum	040bc40004
Polemonium pulcherrimum var. pilosum	0402000004
Polemonium pulcherrimum var. pulcherrimum	040bc40004
Poliomintha incana	6000000000
Polycarpon depressum	1080020000
Polycarpon tetraphyllum	01a0981200
Polycarpon tetraphyllum subsp. tetraphyllum	01a0981200
Polycarpon tetraphyllum var. tetraphyllum	01a0981200
Polyctenium fremontii	0002040006
Polygala acanthoclada	6000000000
Polygala californica	093d020800
Polygala cornuta	0643da5105
Polygala cornuta subsp. cornuta	0603d80104
Polygala cornuta subsp. fishiae	0040025001
Polygala cornuta var. cornuta	0603d80104
Polygala cornuta var. fishiae	0040025001
Polygala heterorhyncha	4000000000
Polygala intermontana	0000040002
Polygala subspinosa	0002040006
Polygonum argyrocoleon	ffffffff07
Polygonum austiniae	0002000004
Polygonum aviculare	ffffffff07
Polygonum aviculare subsp. aviculare	ffffffff07
Polygonum aviculare subsp. buxiforme	ffffffff07
Polygonum aviculare subsp. depressum	ffffffff07
Polygonum aviculare subsp. neglectum	ffffffff07
Polygonum aviculare subsp. rurivagum	ffffffff07
Polygonum aviculare var. aviculare	ffffffff07
Polygonum bidwelliae	0600000200
Polygonum bolanderi	063dd80000
Polygonum californicum	063ff8a304
Polygonum douglasii	ffffffff07
Polygonum fowleri	0004000800
Polygonum fowleri subsp. fowleri	0004000800
Polygonum hickmanii	0000000800
Polygonum majus	063af88504
Polygonum marinense	0100000000
Polygonum minimum	063df88100
Polygonum paronychia	0104000000
Polygonum parryi	067df8c900
Polygonum polygaloides	067ff8d505
Polygonum polygaloides subsp. confertiflorum	063f480004
Polygonum polygaloides subsp. esotericum	0002000004
Polygonum polygaloides subsp. kelloggii	067df8d501
Polygonum ramosissimum	1ffdfbff01
Polygonum ramosissimum subsp. prolificum	0000400800
Polygonum ramosissimum subsp. ramosissimum	1ffdfbff01
Polygonum ramosissimum var. prolificum	0000400800
Polygonum ramosissimum var. ramosissimum	1ffdfbff01
Polygonum sawatchense	5cfffcf507
Polygonum sawatchense subsp. oblivium	043dc00004
Polygonum sawatchense subsp. sawatchense	5ccbfcf507
Polygonum shastense	0400c00100
Polygonum spergulariiforme	063f480804
Polypodium californicum	19c0025401
Polypodium calirhiza	033ddbab00
Polypodium glycyrrhiza	0125000800
Polypodium hesperium	4001c04402
Polypodium scouleri	09a4000800
Polypogon australis	03a4783e00
Polypogon imberbis	0100002800
Polypogon interruptus	bffdfb7f01
Polypogon maritimus	66fcf8eb01
Polypogon monspeliensis	ffffffff07
Polypogon viridis	f9e5fffe03
Polystichum californicum	0120fa8d00
Polystichum dudleyi	0120020800
Polystichum imbricans	04fbca5d05
Polystichum imbricans subsp. curtum	04d0c25c01
Polystichum imbricans subsp. imbricans	043bca0905
Polystichum kruckebergii	0401c00000
Polystichum lemmonii	0409400000
Polystichum lonchitis	0009400000
Polystichum munitum	0f3f4b0900
Polystichum scopulinum	442bc04504
Populus alba	0603040006
Populus angustifolia	0000040002
Populus fremontii	fffdffff03
Populus fremontii subsp. fremontii	fffdffff03
Populus fremontii var. fremontii	fffdffff03
Populus nigra	6080040802
Populus tremuloides	060bc40506
Populus trichocarpa	1fffffff07
Porophyllum gracile	e040004000
Porophyllum ruderale	0080000000
Porophyllum ruderale subsp. macrocephalum	0080000000
Porophyllum ruderale var. macrocephalum	0080000000
Porterella carnosula	0402c40106
Portulaca halimoides	e040004000
Portulaca oleracea	ffffffff07
Potamogeton alpinus	0103c00104
Potamogeton amplifolius	0438c00104
Potamogeton berchtoldii	0007ce2506
Potamogeton crispus	79b8403e00
Potamogeton diversifolius	0292586204
Potamogeton epihydrus	0022c00104
Potamogeton foliosus	e5ff7f7e07
Potamogeton foliosus subsp. fibrillosus	0006040006
Potamogeton foliosus subsp. foliosus	e5ff7f7e07
Potamogeton foliosus var. fibrillosus	0006040006
Potamogeton foliosus var. foliosus	e5ff7f7e07
Potamogeton gramineus	0413c40d06
Potamogeton illinoensis	077ac67f06
Potamogeton natans	047ec06d04
Potamogeton nodosus	63fa746e06
Potamogeton praelongus	0400c00000
Potamogeton pusillus	60c7cf7f07
Potamogeton richardsonii	0407d00004
Potamogeton robbinsii	0001800100
Potamogeton zosteriformis	0012002204
Potentilla anglica	0040004a00
Potentilla anserina	0186c40506
Potentilla anserina subsp. anserina	0002c40506
Potentilla anserina subsp. pacifica	0184000000
Potentilla anserina var. anserina	0002c40506
Potentilla basaltica	0002000004
Potentilla biennis	4002c41507
Potentilla breweri	0001c00104
Potentilla bruceae	0401c00104
Potentilla concinna	0000000002
Potentilla concinna var. proxima	0000000002
Potentilla cristae	0001000000
Potentilla drummondii	0009c00100
Potentilla flabellifolia	0401c00100
Potentilla glaucophylla	0000800100
Potentilla glaucophylla var. glaucophylla	0000800100
Potentilla gracilis	067fc4d507
Potentilla gracilis subsp. gracilis	0421000000
Potentilla gracilis var. elmeri	0000c4d503
Potentilla gracilis var. fastigiata	067fc4d507
Potentilla gracilis var. flabelliformis	0002000004
Potentilla gracilis var. gracilis	0421000000
Potentilla grayi	0000c00100
Potentilla hickmanii	0100000000
Potentilla jepsonii	0000800002
Potentilla millefolia	0402c40106
Potentilla morefieldii	0000800002
Potentilla multijuga	0080000000
Potentilla newberryi	0002000004
Potentilla norvegica	0040844202
Potentilla pensylvanica	0000800102
Potentilla pseudosericea	0000840102
Potentilla pulcherrima	0000000002
Potentilla recta	0400000a00
Potentilla rimicola	0000004000
Potentilla rivalis	0522fbaf04
Potentilla uliginosa	0020000800
Potentilla wheeleri	0000004500
Poteridium annuum	0543c04004
Poterium sanguisorba	1ffd3bfe01
Prenanthella exigua	e000040002
Primula suffrutescens	0001c00100
Proboscidea althaeifolia	e000000000
Proboscidea louisianica	00f0026200
Proboscidea louisianica subsp. louisianica	00f0026200
Proboscidea lutea	0000002a00
Prosartes hookeri	053dfb8900
Prosartes parvifolia	0001000000
Prosartes smithii	003d000800
Prosopis glandulosa	e0c0007400
Prosopis glandulosa var. torreyana	e0c0007400
Prosopis pubescens	e000002400
Prosopis strombulifera	8000000000
Prosopis velutina	01c0006000
Prunella vulgaris	07fffbc905
Prunella vulgaris subsp. lanceolata	077ffbc905
Prunella vulgaris subsp. vulgaris	0786f88104
Prunella vulgaris var. lanceolata	077ffbc905
Prunella vulgaris var. vulgaris	0786f88104
Prunus andersonii	4002c40106
Prunus cerasifera	0138080800
Prunus dulcis	0010122a00
Prunus emarginata	07ffffdd07
Prunus eremophila	6000000000
Prunus fasciculata	e140239401
Prunus fasciculata var. fasciculata	e040219401
Prunus fasciculata var. punctata	0100020000
Prunus fremontii	8040000000
Prunus ilicifolia	19f8035c01
Prunus ilicifolia subsp. ilicifolia	01f8035c01
Prunus ilicifolia subsp. lyonii	1800000000
Prunus persica	0480001000
Prunus subcordata	073ffb8904
Prunus virginiana	1e7bffdd07
Prunus virginiana subsp. demissa	1e7bffdd07
Prunus virginiana var. demissa	1e7bffdd07
Psathyrotes annua	6000040402
Psathyrotes ramosissima	e000040002
Pseudobahia bahiifolia	0000102000
Pseudobahia heermannii	0200380000
Pseudobahia peirsonii	0000202000
Pseudognaphalium beneolens	00f13a5b00
Pseudognaphalium biolettii	1900334000
Pseudognaphalium californicum	1ffdfbdd01
Pseudognaphalium canescens	40c0805400
Pseudognaphalium leucocephalum	00c0004400
Pseudognaphalium luteoalbum	19c43b7e01
Pseudognaphalium macounii	0000200000
Pseudognaphalium microcephalum	08c0024800
Pseudognaphalium ramosissimum	09fd035801
Pseudognaphalium roseum	0040004000
Pseudognaphalium stramineum	0184020c00
Pseudognaphalium thermale	0461f45502
Pseudorontium cyathiferum	8000000000
Pseudostellaria jamesiana	040bf08105
Pseudostellaria sierrae	0000c00000
Pseudotrillium rivale	0001000000
Pseudotsuga macrocarpa	0040025401
Pseudotsuga menziesii	0539c20800
Pseudotsuga menziesii var. menziesii	0539c20800
Psilocarphus brevissimus	1ffffbff01
Psilocarphus brevissimus var. brevissimus	1ffffbff01
Psilocarphus brevissimus var. multiflorus	0000002a00
Psilocarphus chilensis	0380392200
Psilocarphus elatior	0402000000
Psilocarphus oregonus	0733cb2a04
Psilocarphus tenellus	1ffdfb3b01
Psilostrophe cooperi	e000000000
Psorothamnus arborescens	e000040402
Psorothamnus arborescens var. arborescens	6000000000
Psorothamnus arborescens var. minutifolius	6000040002
Psorothamnus arborescens var. simplicifolius	e000000400
Psorothamnus emoryi	e000000000
Psorothamnus fremontii	e000000000
Psorothamnus fremontii var. attenuatus	8000000000
Psorothamnus fremontii var. fremontii	6000000000
Psorothamnus polydenius	e000040002
Psorothamnus schottii	8000000000
Psorothamnus spinosus	e000000000
Ptelea crenulata	0250384a00
Pteridium aquilinum	1ffdfbdd05
Pteridium aquilinum var. pubescens	1ffdfbdd05
Pteris cretica	0080001800
Pteris tremula	0100001000
Pteris vittata	0000001000
Pterocarya stenoptera	0000002200
Pterospora andromedea	0409c0d505
Pterostegia drymarioides	ffffffff07
Puccinellia distans	1fffffff07
Puccinellia howellii	0001000000
Puccinellia lemmonii	0603040006
Puccinellia nutkaensis	0004000000
Puccinellia nuttalliana	1fffffff07
Puccinellia parishii	6000000000
Puccinellia pumila	0004000000
Puccinellia simplex	600000aa00
Pulicaria paludosa	d8c0007401
Punica granatum	0180003000
Purshia stansburyana	4000000002
Purshia tridentata	464bc49507
Purshia tridentata var. glandulosa	4040849503
Purshia tridentata var. tridentata	060bc40106
Pycnanthemum californicum	067bf8d705
Pyracantha angustifolia	0120000000
Pyracantha atalantioides	0080000000
Pyracantha coccinea	0400000000
Pyracantha crenulata	0000000c00
Pyracantha fortuneana	01a1021e00
Pyracantha koidzumii	8180001e00
Pyrola asarifolia	0427c00504
Pyrola asarifolia subsp. asarifolia	0403c00504
Pyrola asarifolia subsp. bracteata	0025400000
Pyrola asarifolia var. asarifolia	0403c00504
Pyrola asarifolia var. bracteata	0025400000
Pyrola chlorantha	0008400000
Pyrola minor	0001804504
Pyrola picta	067dfadd05
Pyrrocoma apargioides	0000c40102
Pyrrocoma carthamoides	0402400004
Pyrrocoma carthamoides var. cusickii	0402400004
Pyrrocoma hirta	0002400004
Pyrrocoma hirta var. hirta	0002000004
Pyrrocoma hirta var. lanulosa	0002400004
Pyrrocoma lanceolata	0002040004
Pyrrocoma lanceolata var. lanceolata	0002040004
Pyrrocoma lanceolata var. subviscosa	0002000004
Pyrrocoma lucida	0000400000
Pyrrocoma racemosa	653b858306
Pyrrocoma racemosa var. congesta	0001000000
Pyrrocoma racemosa var. paniculata	6002858106
Pyrrocoma racemosa var. pinetorum	0001000000
Pyrrocoma racemosa var. racemosa	0538010200
Pyrrocoma racemosa var. sessiliflora	6000040002
Pyrrocoma uniflora	0002040406
Pyrrocoma uniflora var. gossypina	0000000400
Pyrrocoma uniflora var. uniflora	0002040006
Pyrus communis	4060085603
Quercus X acutidens	0040004000
Quercus X alvordiana	0000038001
Quercus X macdonaldii	1800000000
Quercus agrifolia	19f0035e01
Quercus agrifolia var. agrifolia	19f0035e01
Quercus agrifolia var. oxyadenia	0040005400
Quercus berberidifolia	1df93bde01
Quercus cedrosensis	0040000000
Quercus chrysolepis	5ffdfbdd01
Quercus cornelius-mulleri	c040001500
Quercus douglasii	12323baa05
Quercus dumosa	00c0004000
Quercus durata	01384b1801
Quercus durata var. durata	01384b0800
Quercus durata var. gabrielensis	0000001001
Quercus engelmannii	10c0005000
Quercus garryana	073f7a8905
Quercus garryana var. breweri	0109000000
Quercus garryana var. garryana	023d020800
Quercus garryana var. semota	04137a8905
Quercus ilex	18c0005401
Quercus john-tuckeri	2000219101
Quercus kelloggii	077ffbdd05
Quercus lobata	1ab83bbb01
Quercus pacifica	1800000000
Quercus palmeri	2050037d01
Quercus parvula	0914020801
Quercus parvula var. parvula	0800020001
Quercus parvula var. shrevei	0114020801
Quercus parvula var. tamalpaisensis	0000000800
Quercus sadleriana	0001000000
Quercus tomentella	1800000000
Quercus turbinella	6000000000
Quercus vacciniifolia	041bc00104
Quercus wislizeni	06f9ffff03
Quercus wislizeni var. frutescens	04f9c3ff01
Quercus wislizeni var. wislizeni	02783fdf03
Rafinesquia californica	fbfc3f5f03
Rafinesquia neomexicana	e000000502
Raillardella argentea	0401c40506
Raillardella pringlei	0001000000
Raillardella scaposa	0400c00100
Ranunculus acris	0004400000
Ranunculus alismifolius	003bc04504
Ranunculus alismifolius var. alismellus	003bc04504
Ranunculus alismifolius var. alismifolius	003b400004
Ranunculus alismifolius var. hartwegii	000ac00004
Ranunculus alismifolius var. lemmonii	0002400004
Ranunculus andersonii	4002c40106
Ranunculus aquatilis	1fffffff07
Ranunculus aquatilis var. aquatilis	077fffeb06
Ranunculus aquatilis var. diffusus	1fffffff07
Ranunculus arvensis	0613080204
Ranunculus bonariensis	0000082200
Ranunculus bonariensis var. trisepalus	0000082200
Ranunculus bulbosus	0004000000
Ranunculus californicus	19fd3b7e01
Ranunculus californicus var. californicus	19fd3b7e01
Ranunculus californicus var. cuneatus	0904000000
Ranunculus canus	021008af00
Ranunculus canus var. canus	0210082a00
Ranunculus canus var. ludovicianus	0000008500
Ranunculus cymbalaria	7ec2c45507
Ranunculus eschscholtzii	0001c44506
Ranunculus eschscholtzii var. eschscholtzii	0001c00100
Ranunculus eschscholtzii var. oxynotus	0000c44506
Ranunculus eschscholtzii var. suksdorfii	0001000000
Ranunculus flabellaris	000b000004
Ranunculus flammula	073ff88504
Ranunculus flammula var. flammula	003d000000
Ranunculus flammula var. ovalis	073ff88504
Ranunculus glaberrimus	0602440006
Ranunculus glaberrimus var. ellipticus	0002440006
Ranunculus glaberrimus var. glaberrimus	0602400004
Ranunculus gormanii	0001000000
Ranunculus hebecarpus	1bd03b5e01
Ranunculus hydrocharoides	0000040002
Ranunculus hystriculus	0000f88100
Ranunculus lobbii	0038000800
Ranunculus macounii	0002000004
Ranunculus muricatus	0080382a00
Ranunculus occidentalis	073ffb8904
Ranunculus occidentalis subsp. occidentalis	073ffb8904
Ranunculus occidentalis var. dissectus	0403000004
Ranunculus occidentalis var. howellii	0001000000
Ranunculus occidentalis var. occidentalis	073ffb8904
Ranunculus occidentalis var. ultramontanus	0401c00100
Ranunculus orthorhynchus	073fc02b04
Ranunculus orthorhynchus subsp. orthorhynchus	043fc00104
Ranunculus orthorhynchus subsp. platyphyllus	073d002a00
Ranunculus orthorhynchus var. bloomeri	0030000800
Ranunculus orthorhynchus var. orthorhynchus	043fc00104
Ranunculus orthorhynchus var. platyphyllus	073d002a00
Ranunculus parviflorus	003d000000
Ranunculus populago	0600400000
Ranunculus pusillus	0124100200
Ranunculus repens	0516c00804
Ranunculus sardous	0204180200
Ranunculus sceleratus	0447086604
Ranunculus sceleratus subsp. multifidus	0403000004
Ranunculus sceleratus subsp. sceleratus	0044086600
Ranunculus sceleratus var. multifidus	0403000004
Ranunculus sceleratus var. sceleratus	0044086600
Ranunculus testiculatus	4002248406
Ranunculus trilobus	0100000000
Ranunculus uncinatus	073fc00404
Raphanus raphanistrum	1fffffff07
Raphanus sativus	1ffdfbff01
Rapistrum rugosum	0100000000
Ratibida columnifera	0042004004
Reseda alba	19c0035c01
Reseda lutea	0010000000
Reseda luteola	01bc000000
Reseda odorata	0080000000
Rhagadiolus stellatus	0020000800
Rhamnus alaternus	0180000000
Rhamnus alnifolia	0000400000
Rhamnus crocea	19e1c35d01
Rhamnus ilicifolia	5ffdfbff01
Rhamnus pilosa	0040000000
Rhamnus pirifolia	1800000000
Rhodiola integrifolia	0001c00106
Rhodiola integrifolia subsp. integrifolia	0001c00106
Rhododendron columbianum	0525c50906
Rhododendron macrophyllum	0105000800
Rhododendron occidentale	0575c14900
Rhus aromatica	5ffdfbff01
Rhus integrifolia	18c0005401
Rhus ovata	18c0005401
Rhynchospora alba	0405c00000
Rhynchospora californica	0120080000
Rhynchospora capitellata	0021d80000
Rhynchospora globularis	0020000000
Ribes amarum	18c03adc01
Ribes aureum	1ed3c77d07
Ribes aureum var. aureum	0603c42106
Ribes aureum var. gracillimum	18d0035c01
Ribes binominatum	0009000000
Ribes bracteosum	0025000000
Ribes californicum	0078031801
Ribes californicum var. californicum	0038030800
Ribes californicum var. hesperium	0040001001
Ribes canthariforme	0040000000
Ribes cereum	4403c4d507
Ribes cereum var. cereum	4403c4d507
Ribes cereum var. inebrians	0000000102
Ribes divaricatum	07bd021800
Ribes divaricatum subsp. parishii	0080001000
Ribes divaricatum var. parishii	0080001000
Ribes divaricatum var. pubiflorum	073d020800
Ribes hudsonianum	0002000004
Ribes hudsonianum var. petiolare	0002000004
Ribes indecorum	00c0025401
Ribes inerme	0431c40106
Ribes inerme var. inerme	0401c40106
Ribes inerme var. klamathense	0431000000
Ribes lacustre	0409000000
Ribes lasianthum	0040c05100
Ribes laxiflorum	0004000000
Ribes lobbii	0009000000
Ribes malvaceum	18503b5c01
Ribes malvaceum var. malvaceum	18103b0801
Ribes malvaceum var. viridifolium	0040025401
Ribes marshallii	0001000000
Ribes menziesii	0124220800
Ribes menziesii var. ixoderme	0000200000
Ribes menziesii var. menziesii	0124020800
Ribes montigenum	4401c05505
Ribes nevadense	0649c0d505
Ribes quercetorum	a04033c801
Ribes roezlii	046bc2d505
Ribes roezlii var. amictum	0421000000
Ribes roezlii var. cruentum	0029000000
Ribes roezlii var. roezlii	0443c2d505
Ribes sanguineum	012d020800
Ribes sanguineum var. glutinosum	0124020800
Ribes sanguineum var. sanguineum	0009000000
Ribes sericeum	0000020000
Ribes speciosum	01c0024801
Ribes thacherianum	0800000000
Ribes tularense	0000000100
Ribes velutinum	4403c49507
Ribes viburnifolium	1040000000
Ribes victoris	0020000800
Ribes viscosissimum	040bc00104
Ricinus communis	0180002200
Rigiopappus leptocladus	073bfbbb05
Robinia neomexicana	4000000000
Robinia pseudoacacia	1fffffff07
Romanzoffia californica	013d000800
Romanzoffia sitchensis	0001000000
Romanzoffia tracyi	0004000000
Romneya coulteri	00c0004001
Romneya trichocalyx	00c0004001
Romulea rosea	0104000a00
Romulea rosea var. australis	0104000a00
Rorippa austriaca	0002000004
Rorippa columbiae	0002000004
Rorippa curvipes	1ffdffff03
Rorippa curvisiliqua	1ffffbff05
Rorippa palustris	ffffffff07
Rorippa palustris subsp. hispida	0002000004
Rorippa palustris subsp. palustris	ffffffff07
Rorippa palustris var. hispida	0002000004
Rorippa palustris var. palustris	ffffffff07
Rorippa sinuata	0002040006
Rorippa sphaerocarpa	0000004400
Rorippa subumbellata	0000400000
Rorippa tenerrima	0040004000
Rosa bridgesii	0600f88100
Rosa californica	1bfd3b7e01
Rosa canina	003d480000
Rosa gymnocarpa	077fdb4804
Rosa gymnocarpa var. gymnocarpa	077fdb4804
Rosa gymnocarpa var. serpentina	0001000000
Rosa minutifolia	0040000000
Rosa multiflora	0620001200
Rosa nutkana	0525000000
Rosa nutkana subsp. macdougalii	0421000000
Rosa nutkana subsp. nutkana	0124000000
Rosa nutkana var. nutkana	0124000000
Rosa pinetorum	0100030800
Rosa pisocarpa	063d480000
Rosa pisocarpa subsp. ahartii	0600480000
Rosa pisocarpa subsp. pisocarpa	063d000000
Rosa pisocarpa var. pisocarpa	063d000000
Rosa rubiginosa	0735d88800
Rosa spithamea	013f030804
Rosa woodsii	4402c49507
Rosa woodsii subsp. gratissima	4000849503
Rosa woodsii subsp. ultramontana	0402440004
Rosa woodsii var. gratissima	4000849503
Rosa woodsii var. ultramontana	0402440004
Rotala indica	0000000200
Rotala ramosior	0630d82200
Rubus armeniacus	1ffdfbff01
Rubus glaucifolius	007df8c100
Rubus laciniatus	067df8c900
Rubus lasiococcus	0009000000
Rubus leucodermis	1ffdfbdd01
Rubus nivalis	0001000000
Rubus parviflorus	1fffffdd07
Rubus pensilvanicus	1ffdfbff01
Rubus spectabilis	0125000800
Rubus ulmifolius	19fd035e01
Rubus ulmifolius var. anoplothyrsus	19fd035e01
Rubus ulmifolius var. ulmifolius	0010000000
Rubus ursinus	1ffdfbff01
Rudbeckia californica	0000c00100
Rudbeckia glaucescens	0005000000
Rudbeckia hirta	0000102200
Rudbeckia hirta var. pulcherrima	0000102200
Rudbeckia klamathensis	0001000000
Rudbeckia occidentalis	0009400000
Rumex acetosella	1fffffff07
Rumex britannica	0000400000
Rumex californicus	ffffffff07
Rumex conglomeratus	1ffdffff03
Rumex crassus	0104000000
Rumex crispus	ffffffff07
Rumex dentatus	0040006200
Rumex fueginus	ffffffff07
Rumex hymenosepalus	78c0007401
Rumex kerneri	0380032200
Rumex lacustris	0002040006
Rumex obtusifolius	01a4482a00
Rumex occidentalis	0507c42306
Rumex palustris	ffffffff07
Rumex paucifolius	0402c00106
Rumex persicarioides	0184000000
Rumex pulcher	ffffffff07
Rumex salicifolius	f9c0ffdd03
Rumex stenophyllus	0082002204
Rumex transitorius	010cc00300
Rumex triangulivalvis	0402fc9306
Rumex utahensis	0000800100
Rumex venosus	0002000004
Rumex violascens	e080032200
Rupertia hallii	0400000000
Rupertia physodes	01f9034c00
Rupertia rigida	00c0004400
Ruppia cirrhosa	e19607ac06
Ruppia maritima	1984032800
Ruta chalepensis	1ffdfbff01
Rytidosperma caespitosum	0180000000
Rytidosperma penicillatum	0124000001
Rytidosperma racemosum	0100000000
Saccharum ravennae	8010002200
Sagina apetala	0ffdda6200
Sagina decumbens	19ffd86a04
Sagina decumbens subsp. occidentalis	19ffd86a04
Sagina maxima	0104000000
Sagina maxima subsp. crassicaulis	0104000000
Sagina procumbens	0104000000
Sagina saginoides	046bfcd507
Sagina subulata	0000000000
Sagittaria cuneata	063ffc8506
Sagittaria latifolia	1fffffff07
Sagittaria longiloba	0000002200
Sagittaria montevidensis	0080002a00
Sagittaria montevidensis subsp. calycina	0080002a00
Sagittaria rigida	0500000200
Sagittaria sanfordii	0285002200
Salicornia bigelovii	0180000000
Salicornia depressa	2182000004
Salicornia pacifica	71c4006800
Salicornia perennis	0004000000
Salicornia rubra	0100000000
Salix alba	ffffffff07
Salix babylonica	0080000800
Salix bebbiana	0002000004
Salix boothii	0401440106
Salix brachycarpa	0000800000
Salix brachycarpa subsp. brachycarpa	0000800000
Salix brachycarpa var. brachycarpa	0000800000
Salix breweri	0038030800
Salix delnortensis	0001000000
Salix drummondiana	0000800102
Salix eastwoodiae	043bc00106
Salix exigua	f9fffbff05
Salix exigua subsp. exigua	e002f88104
Salix exigua var. exigua	e002f88104
Salix exigua var. hindsiana	19fd037e01
Salix geyeriana	0402c40506
Salix gooddingii	e2d23c6206
Salix hookeriana	0324000000
Salix jepsonii	0401c00100
Salix laevigata	7ffdffff03
Salix lasiandra	ffffffff07
Salix lasiandra subsp. caudata	0002c40506
Salix lasiandra subsp. lasiandra	ffffffff07
Salix lasiandra var. caudata	0002c40506
Salix lasiandra var. lasiandra	ffffffff07
Salix lasiolepis	ffffffff07
Salix lemmonii	0431c04500
Salix ligulifolia	0401c00104
Salix lutea	6002844506
Salix melanopsis	0607f80304
Salix nivalis	0000800000
Salix orestera	0000fc8102
Salix petrophila	0400800100
Salix planifolia	0000c40102
Salix prolixa	0401400000
Salix purpurea	0004000000
Salix scouleriana	073ffcdd06
Salix sitchensis	013d420801
Salix tracyi	0004000000
Salpichroa origanifolia	0184030800
Salsola australis	e180032a00
Salsola damascena	0000010000
Salsola gobicola	6000042003
Salsola paulsenii	e000000001
Salsola ryanii	0000012200
Salsola soda	0100000200
Salsola tragus	ffffffff07
Saltugilia australis	e040005401
Saltugilia caruifolia	0040004000
Saltugilia latimeri	e040005401
Saltugilia splendens	0000035401
Saltugilia splendens subsp. grantii	0000001400
Saltugilia splendens subsp. splendens	0000035401
Salvia aethiopis	0002000004
Salvia apiana	a0c0025401
Salvia brandegeei	0800000000
Salvia carduacea	f8c003fc01
Salvia clevelandii	00c0004000
Salvia columbariae	fbfebfff07
Salvia dorrii	644204c107
Salvia dorrii subsp. dorrii	6002040006
Salvia dorrii var. dorrii	6002040006
Salvia dorrii var. incana	0400000000
Salvia dorrii var. pilosa	204204c107
Salvia eremostachya	8000000000
Salvia funerea	6000000000
Salvia greatae	8000000000
Salvia leucophylla	0180031001
Salvia mellifera	19c0035c01
Salvia mohavensis	c000000000
Salvia munzii	0040000000
Salvia pachyphylla	404000c500
Salvia sonomensis	02b91b0800
Salvia spathacea	0180031e01
Salvia vaseyi	8000000000
Salvia virgata	0601480000
Salvinia minima	0080000000
Salvinia molesta	8080000000
Salvinia oblongifolia	0080000000
Sambucus nigra	5fffffff07
Sambucus nigra subsp. caerulea	5fffffff07
Sambucus racemosa	073df88d00
Sambucus racemosa subsp. racemosa	073df88d00
Sambucus racemosa var. melanocarpa	0600c00100
Sambucus racemosa var. racemosa	073df88d00
Samolus parviflorus	09c0036e01
Sanguisorba officinalis	0025000000
Sanicula arctopoides	0104000000
Sanicula arguta	19c0025401
Sanicula bipinnata	1ef83b5e01
Sanicula bipinnatifida	1dfffb5e05
Sanicula crassicaulis	19fd3b5f01
Sanicula graveolens	047fc24505
Sanicula hoffmannii	0980000000
Sanicula laciniata	013c020800
Sanicula maritima	0100000800
Sanicula peckiana	0001000000
Sanicula saxatilis	0000000800
Sanicula tracyi	022c000000
Sanicula tuberosa	067cfbcb01
Santolina chamaecyparissus	0080001000
Sanvitalia abertii	4000000000
Saponaria officinalis	04ff0e4806
Sarcobatus baileyi	4000040002
Sarcobatus vermiculatus	6002040006
Sarcodes sanguinea	046bc05505
Sarracenia purpurea	0005400000
Saussurea americana	0001000000
Saxifraga cespitosa	0001000004
Saxifraga hyperborea	0000800100
Saxifraga mertensiana	0025d80000
Saxifragopsis fragarioides	0001000000
Scabiosa atropurpurea	0140024c00
Scabiosa stellata	0080000000
Scandix pecten-veneris	1ffdfbff01
Sceptridium multifidum	053dc00904
Scheuchzeria palustris	0400000000
Schinus molle	19c03bfe01
Schinus polygamus	00c0004000
Schinus terebinthifolius	0080000000
Schismus arabicus	f180033c03
Schismus barbatus	f8c002f401
Schoenoplectus acutus	ffffffff07
Schoenoplectus acutus var. occidentalis	ffffffff07
Schoenoplectus americanus	fce3047e07
Schoenoplectus californicus	e9c4006a00
Schoenoplectus heterochaetus	0400000000
Schoenoplectus mucronatus	02b0400a01
Schoenoplectus pungens	e186ffa906
Schoenoplectus pungens var. longispicatus	e186ffa906
Schoenoplectus saximontanus	0040026001
Schoenoplectus subterminalis	0401c00100
Schoenoplectus tabernaemontani	98fd407e01
Schoenoplectus triqueter	0000000200
Schoenus nigricans	6000001400
Scirpus congdonii	063b000004
Scirpus cyperinus	0000800000
Scirpus diffusus	0601f88100
Scirpus microcarpus	ffffffff07
Scirpus pendulus	0400000000
Scleranthus annuus	0669584000
Scleranthus annuus subsp. annuus	0669584000
Sclerocactus johnsonii	2000000000
Sclerocactus polyancistrus	6000000002
Sclerochloa dura	0400000000
Sclerolinon digynum	0601f88100
Scleropogon brevifolius	4000000000
Scoliopus bigelovii	0120000800
Scolymus hispanicus	0100000a00
Scopulophila rixfordii	a000040002
Scorzonera hispanica	0021000000
Scribneria bolanderi	1ffffbff05
Scrophularia atrata	0100020000
Scrophularia californica	1ffdfbff01
Scrophularia desertorum	6002fc8106
Scrophularia lanceolata	0603000004
Scrophularia peregrina	0080000000
Scrophularia villosa	1000000000
Scutellaria antirrhinoides	063f000004
Scutellaria bolanderi	6040f9c500
Scutellaria bolanderi subsp. austromontana	6040004400
Scutellaria bolanderi subsp. bolanderi	0000f98100
Scutellaria californica	0239480800
Scutellaria galericulata	0002400004
Scutellaria lateriflora	0000042202
Scutellaria mexicana	e000040002
Scutellaria nana	0602000004
Scutellaria siphocampyloides	1ffdfbff01
Scutellaria tuberosa	1ffdfbff01
Searsia lancea	8080000000
Secale cereale	605340dc07
Sedella leiocarpa	0010000000
Sedella pentandra	0010032200
Sedella pumila	0230b92200
Sedum albomarginatum	0000400000
Sedum album	01c0f8c500
Sedum divergens	0001000000
Sedum lanceolatum	0601f88100
Sedum laxum	002d000000
Sedum laxum subsp. eastwoodiae	0020000000
Sedum laxum subsp. flavidum	0009000000
Sedum laxum subsp. heckneri	0021000000
Sedum laxum subsp. laxum	0005000000
Sedum niveum	4040000400
Sedum oblanceolatum	0001000000
Sedum obtusatum	0409f88100
Sedum obtusatum subsp. boreale	0400f88100
Sedum obtusatum subsp. obtusatum	0001f88100
Sedum obtusatum subsp. paradisum	0001000000
Sedum obtusatum subsp. retusum	0009000000
Sedum obtusatum var. retusum	0009000000
Sedum oreganum	0001000000
Sedum oregonense	0001000000
Sedum praealtum	0100000000
Sedum radiatum	0239fa8900
Sedum spathulifolium	077dfbdd01
Sedum stenopetalum	063ff88904
Selaginella asprella	0040a05501
Selaginella bigelovii	39fd235d01
Selaginella cinerascens	00c0004000
Selaginella eremophila	8040000000
Selaginella hansenii	0610fb8300
Selaginella leucobryoides	4000000000
Selaginella oregana	0025000000
Selaginella scopulorum	0001000000
Selaginella wallacei	003d480800
Selaginella watsonii	4041c45503
Senecio aphanactis	1980030800
Senecio aronicoides	073ffb8b04
Senecio astephanus	0000031401
Senecio blochmaniae	0100000000
Senecio californicus	99c023dd01
Senecio clarkianus	0000f00100
Senecio elegans	0180000800
Senecio flaccidus	fff8bfff03
Senecio flaccidus var. douglasii	1ff8bbff01
Senecio flaccidus var. monoensis	e000040002
Senecio fremontii	0400bc8506
Senecio fremontii subsp. fremontii	0400000004
Senecio fremontii subsp. occidentalis	0000bc8502
Senecio fremontii var. fremontii	0400000004
Senecio fremontii var. occidentalis	0000bc8502
Senecio glomeratus	0924030800
Senecio hydrophiloides	0402480004
Senecio hydrophilus	073affab06
Senecio integerrimus	063bfc8106
Senecio integerrimus var. exaltatus	0602fc8106
Senecio integerrimus var. major	0439f88102
Senecio integerrimus var. ochroleucus	0400000000
Senecio jacobaea	0605480a00
Senecio linearifolius	0040004000
Senecio linearifolius var. linearifolius	0040004000
Senecio lyonii	1000000000
Senecio minimus	0124030800
Senecio mohavensis	e000000000
Senecio pattersonensis	0000840002
Senecio quadridentatus	0080000001
Senecio scorzonella	0400c40102
Senecio serra	0402e40106
Senecio serra var. serra	0402e40106
Senecio spartioides	4000c40502
Senecio sylvaticus	0105000800
Senecio triangularis	0643fcd506
Senecio vulgaris	1fffffff07
Senegalia greggii	e040000000
Senna armata	e000000000
Senna artemisioides	8080001400
Senna covesii	8000000000
Senna didymobotrya	0100000000
Senna marilandica	0080000000
Senna multiglandulosa	0100000800
Sequoia sempervirens	0131020800
Sequoiadendron giganteum	0000c04100
Sericocarpus oregonensis	0639f88100
Sericocarpus oregonensis subsp. californicus	0220f88100
Sericocarpus oregonensis subsp. oregonensis	0639400000
Sericocarpus oregonensis var. californicus	0220f88100
Sericocarpus oregonensis var. oregonensis	0639400000
Sesbania herbacea	8000000000
Sesbania punicea	0020002a00
Sesuvium verrucosum	e0c6066207
Setaria adhaerens	8000002000
Setaria faberi	0180082200
Setaria parviflora	61c00b3e01
Setaria pumila	22e1fe6e02
Setaria pumila subsp. pumila	22e1fe6e02
Setaria sphacelata	0200002200
Setaria verticillata	80c0004001
Setaria viridis	e2fdfeff03
Shepherdia argentea	0003c70505
Shepherdia canadensis	0001000000
Sherardia arvensis	02b44a0a00
Sibara deserti	6000000000
Sibara filifolia	1800000000
Sibaropsis hammittii	0040000000
Sibbaldia procumbens	0401c40506
Sida rhombifolia	0000002200
Sida spinosa	0000002000
Sidalcea asprella	063dc00000
Sidalcea asprella subsp. asprella	063dc00000
Sidalcea asprella subsp. nana	063d400000
Sidalcea asprella var. asprella	063dc00000
Sidalcea calycosa	0324380a00
Sidalcea calycosa subsp. calycosa	0220380a00
Sidalcea calycosa subsp. rhizomata	0104000000
Sidalcea celata	0610000200
Sidalcea covillei	0000040002
Sidalcea diploscypha	0320180a00
Sidalcea elegans	0001000000
Sidalcea gigantea	0400400000
Sidalcea glaucescens	0401c00000
Sidalcea hartwegii	0210382200
Sidalcea hickmanii	0018020c01
Sidalcea hickmanii subsp. anomala	0000020000
Sidalcea hickmanii subsp. hickmanii	0000020000
Sidalcea hickmanii subsp. napensis	0010000000
Sidalcea hickmanii subsp. parishii	0000020401
Sidalcea hickmanii subsp. pillsburiensis	0008000000
Sidalcea hickmanii subsp. viridis	0000000800
Sidalcea hickmanii var. hickmanii	0000020000
Sidalcea hickmanii var. parishii	0000020401
Sidalcea hirsuta	0238182200
Sidalcea keckii	0010300000
Sidalcea malachroides	0124020800
Sidalcea malviflora	09bc030c01
Sidalcea malviflora subsp. californica	0000020001
Sidalcea malviflora subsp. dolosa	0000000400
Sidalcea malviflora subsp. laciniata	0138030800
Sidalcea malviflora subsp. malviflora	09a4000800
Sidalcea malviflora subsp. patula	0004000000
Sidalcea malviflora subsp. purpurea	0104000000
Sidalcea malviflora subsp. rostrata	0104000000
Sidalcea malviflora var. californica	0000020001
Sidalcea malviflora var. laciniata	0138030800
Sidalcea malviflora var. malviflora	09a4000800
Sidalcea multifida	0000840102
Sidalcea neomexicana	60c0005401
Sidalcea oregana	063fc40006
Sidalcea oregana subsp. eximia	0025000000
Sidalcea oregana subsp. hydrophila	0018000000
Sidalcea oregana subsp. oregana	063f000004
Sidalcea oregana subsp. spicata	040bc40006
Sidalcea oregana subsp. valida	0020000000
Sidalcea oregana var. oregana	063f000004
Sidalcea oregana var. spicata	040bc40006
Sidalcea pedata	0000000400
Sidalcea ranunculacea	0000000100
Sidalcea reptans	0000f88100
Sidalcea robusta	0200080000
Sidalcea setosa	0001000000
Sidalcea sparsifolia	18c0225401
Sidalcea stipularis	0000080000
Sidotheca caryophylloides	0000005501
Sidotheca emarginata	0040004000
Sidotheca trilobata	4040005400
Silene antirrhina	fffffbff05
Silene aperta	0000000100
Silene armeria	0040041002
Silene bernardina	463bfc8106
Silene bolanderi	0020000000
Silene bridgesii	063df88100
Silene campanulata	0639000000
Silene campanulata subsp. campanulata	0039000000
Silene campanulata subsp. glandulosa	0639000000
Silene campanulata var. campanulata	0039000000
Silene coniflora	19e0025c01
Silene conoidea	8080480000
Silene dichotoma	0680000800
Silene dichotoma subsp. dichotoma	0680000800
Silene douglasii	063bf88104
Silene douglasii var. douglasii	063bf88104
Silene gallica	1ffdfbff01
Silene grayi	0601000000
Silene hookeri	0039000000
Silene invisa	0401c00000
Silene laciniata	1ffdfadd01
Silene laciniata subsp. californica	07fdfad901
Silene laciniata subsp. laciniata	18c0025401
Silene laciniata var. laciniata	18c0025401
Silene latifolia	00a4602a00
Silene lemmonii	067ffbdd05
Silene marmorensis	0001000000
Silene menziesii	063bfc8506
Silene noctiflora	0680380000
Silene nuda	0002c00004
Silene occidentalis	0402400004
Silene oregana	0402c00006
Silene parishii	0040005400
Silene pendula	0100000000
Silene pseudatocion	0100000000
Silene salmonacea	0001000000
Silene sargentii	0000c40102
Silene scouleri	0104000800
Silene scouleri subsp. scouleri	0104000800
Silene scouleri var. scouleri	0104000800
Silene serpentinicola	0001000000
Silene suksdorfii	0400000000
Silene verecunda	59f8fbdf03
Silene vulgaris	0680002a00
Silybum marianum	1bfc1b7e01
Simmondsia chinensis	e0c0004000
Sinapis alba	0188000000
Sinapis arvensis	1ffd3bfe01
Sisymbrium altissimum	ffffffff07
Sisymbrium erysimoides	8080000000
Sisymbrium irio	f9c0037603
Sisymbrium loeselii	0002040006
Sisymbrium officinale	1ffdfbff01
Sisymbrium orientale	79c0037e01
Sisyrinchium bellum	ffffffff07
Sisyrinchium californicum	0115400800
Sisyrinchium elmeri	0401f88500
Sisyrinchium funereum	6000000000
Sisyrinchium halophilum	2002440106
Sisyrinchium hitchcockii	0004000000
Sisyrinchium idahoense	0603fc8106
Sisyrinchium idahoense var. idahoense	0603000004
Sisyrinchium idahoense var. occidentale	0000fc8102
Sisyrinchium longipes	0000000400
Sium suave	0402842206
Smelowskia ovalis	0400000000
Smilax californica	023d080000
Smilax jamesii	0601000000
Solanum americanum	1ffdfbff01
Solanum aviculare	0104000000
Solanum carolinense	00a0482200
Solanum dimidiatum	0080002200
Solanum douglasii	79c403dc01
Solanum dulcamara	0102000804
Solanum elaeagnifolium	fff8fbff01
Solanum furcatum	0104000800
Solanum lanceolatum	0080002a00
Solanum marginatum	0180000000
Solanum nigrum	0104000800
Solanum parishii	1ffffbdf05
Solanum physalifolium	0b85072a02
Solanum physalifolium var. nitidibaccatum	0b85072a02
Solanum rostratum	03a2022204
Solanum sisymbriifolium	0000002200
Solanum triflorum	2082440106
Solanum umbelliferum	19fd037e01
Solanum wallacei	1800000000
Solanum xanti	59fdfbdd01
Soleirolia soleirolii	1180000800
Solidago altissima	073fff8906
Solidago altissima subsp. altissima	073fff8906
Solidago altissima var. altissima	073fff8906
Solidago confinis	59c003dc03
Solidago elongata	073fffa906
Solidago guiradonis	0000010000
Solidago lepida	0002400004
Solidago lepida var. salebrosa	0002400004
Solidago multiradiata	0401fc8102
Solidago spathulata	0134000800
Solidago spectabilis	0403440006
Solidago velutina	1fffffff07
Solidago velutina subsp. californica	1ffffbff07
Solidago velutina subsp. sparsiflora	0002040006
Solidago velutina var. californica	1ffffbff07
Soliva sessilis	19fd3b5c01
Sonchus arvensis	0182000a04
Sonchus arvensis subsp. arvensis	0080000a00
Sonchus arvensis subsp. uliginosus	0102000004
Sonchus arvensis var. arvensis	0080000a00
Sonchus asper	ffffffff07
Sonchus asper subsp. asper	ffffffff07
Sonchus oleraceus	ffffffff07
Sonchus tenerrimus	18c0006200
Sorbus aucuparia	0000000400
Sorbus californica	0609c00100
Sorbus scopulina	063bc00104
Sorbus sitchensis	0001000000
Sorbus sitchensis subsp. grayi	0001000000
Sorbus sitchensis subsp. sitchensis	0001000000
Sorbus sitchensis var. grayi	0001000000
Sorbus sitchensis var. sitchensis	0001000000
Sorghum bicolor	e1bc002201
Sorghum halepense	fbfd3b7e01
Sparaxis grandiflora	0100000000
Sparaxis tricolor	0100000000
Sparganium angustifolium	0001c00100
Sparganium emersum	0027c00404
Sparganium eurycarpum	01a6402804
Sparganium eurycarpum subsp. eurycarpum	0126402804
Sparganium eurycarpum var. eurycarpum	0126402804
Sparganium eurycarpum var. greenei	0184000000
Sparganium natans	0402c00004
Spartina alterniflora	0100000000
Spartina densiflora	0104000000
Spartina foliosa	0184000000
Spartina gracilis	2000040002
Spartina patens	0100000000
Spartium junceum	12a03a0a01
Spergula arvensis	01a4422a00
Spergularia atrosperma	0042006204
Spergularia bocconi	7181102200
Spergularia canadensis	0004000000
Spergularia canadensis var. occidentalis	0004000000
Spergularia macrotheca	7994022a00
Spergularia macrotheca var. leucantha	6080022a00
Spergularia macrotheca var. longistyla	0010002200
Spergularia macrotheca var. macrotheca	1984000000
Spergularia marina	f9e4106a00
Spergularia media	0180000000
Spergularia media var. media	0180000000
Spergularia platensis	00c0004200
Spergularia platensis var. platensis	00c0004200
Spergularia rubra	47fdd35a00
Spergularia villosa	11e0004200
Spermolepis echinata	8000000000
Sphaeralcea ambigua	e000040002
Sphaeralcea ambigua subsp. ambigua	e000040002
Sphaeralcea ambigua subsp. rosacea	e000000000
Sphaeralcea ambigua subsp. rugosa	e000000000
Sphaeralcea ambigua var. ambigua	e000040002
Sphaeralcea ambigua var. rosacea	e000000000
Sphaeralcea ambigua var. rugosa	e000000000
Sphaeralcea angustifolia	e000000000
Sphaeralcea coulteri	8000000000
Sphaeralcea emoryi	e000000000
Sphaeralcea emoryi subsp. emoryi	e000000000
Sphaeralcea emoryi var. emoryi	e000000000
Sphaeralcea grossulariifolia	0002000004
Sphaeralcea munroana	0000400000
Sphaeralcea orcuttii	8000000000
Sphaeralcea rusbyi	4000000000
Sphaeralcea rusbyi subsp. eremicola	4000000000
Sphaeralcea rusbyi var. eremicola	4000000000
Sphaeromeria cana	4000840102
Sphaeromeria potentilloides	0002c40006
Sphaeromeria potentilloides var. nitrophila	0000840002
Sphaeromeria potentilloides var. potentilloides	0002c40006
Sphaerophysa salsula	0000002000
Sphenopholis obtusata	00c0080502
Sphenosciadium capitellatum	0652c45507
Spiraea douglasii	0607400004
Spiraea splendens	0601c00100
Spiranthes porrifolia	076dfad900
Spiranthes romanzoffiana	073ff8cd04
Spirodela polyrhiza	613afcab06
Sporobolus airoides	f8c23ef607
Sporobolus contractus	e000000002
Sporobolus cryptandrus	e2c0c65702
Sporobolus flexuosus	e000040002
Sporobolus indicus	01c0026a00
Sporobolus vaginiflorus	0001400000
Sporobolus wrightii	98c0005401
Stachys ajugoides	19fd835e01
Stachys albens	f9f8f8f703
Stachys bergii	0004000000
Stachys bullata	19c0035c01
Stachys chamissonis	0104030000
Stachys mexicana	003d000a00
Stachys pilosa	0002000004
Stachys pycnantha	017dfbc900
Stachys rigida	ffffffff07
Stachys rigida subsp. quercetorum	19fd037e01
Stachys rigida subsp. rigida	ffffffff07
Stachys rigida var. quercetorum	19fd037e01
Stachys rigida var. rigida	ffffffff07
Stachys stebbinsii	19c0035c01
Stachys stricta	0010182200
Stanleya elata	4000040002
Stanleya pinnata	60c2277007
Stanleya pinnata subsp. pinnata	60c2277007
Stanleya pinnata var. pinnata	60c2277007
Stanleya viridiflora	0002000004
Staphylea bolanderi	0600b00100
Stebbinsoseris decipiens	0100000000
Stebbinsoseris heterocarpa	19f83b6a01
Stellaria borealis	0524f00100
Stellaria borealis subsp. sitchana	0524f00100
Stellaria borealis var. sitchana	0524f00100
Stellaria calycantha	0231f8d506
Stellaria crispa	0505400000
Stellaria graminea	0080802800
Stellaria littoralis	0104000000
Stellaria longifolia	0400400000
Stellaria longipes	0511fc8506
Stellaria longipes subsp. longipes	0511fc8506
Stellaria longipes var. longipes	0511fc8506
Stellaria media	9dbd582a00
Stellaria neglecta	00e000fa00
Stellaria nitens	19fddb7f01
Stellaria obtusa	063ad00004
Stellaria pallida	11441a4200
Stellaria umbellata	0418c00104
Stemodia durantifolia	8040004000
Stenanthium occidentale	0001000000
Stenotaphrum secundatum	0180000000
Stenotus acaulis	4602fc8106
Stenotus lanuginosus	0002000004
Stenotus lanuginosus var. lanuginosus	0002000004
Stephanomeria cichoriacea	18c0035401
Stephanomeria diegensis	18c0004001
Stephanomeria elata	03bdfb8901
Stephanomeria exigua	f9c2f7f507
Stephanomeria exigua subsp. carotifera	0100030000
Stephanomeria exigua subsp. coronaria	5902c4b507
Stephanomeria exigua subsp. deanei	00c0004000
Stephanomeria exigua subsp. exigua	e002040006
Stephanomeria exigua subsp. macrocarpa	0000300000
Stephanomeria exigua var. coronaria	5902c4b507
Stephanomeria exigua var. deanei	00c0004000
Stephanomeria exigua var. exigua	e002040006
Stephanomeria lactucina	042bc00004
Stephanomeria paniculata	0403480004
Stephanomeria parryi	6000040002
Stephanomeria pauciflora	e0c007b503
Stephanomeria tenuifolia	6402c40106
Stephanomeria virgata	1fffffff07
Stephanomeria virgata subsp. pleurocarpa	1fffffff07
Stephanomeria virgata subsp. virgata	18c0025401
Stephanomeria virgata var. virgata	18c0025401
Stillingia linearifolia	f8c0005401
Stillingia paucidentata	e000000000
Stillingia spinulosa	e000000000
Stipa arida	6000000000
Stipa brachychaeta	0180032000
Stipa capensis	8000000000
Stipa cernua	1af82bfe01
Stipa chaetophora	0100000000
Stipa comata	4042fcd507
Stipa comata subsp. comata	4042fcd507
Stipa comata var. comata	4042fcd507
Stipa comata var. intermedia	0000400000
Stipa coronata	18c0034001
Stipa diegoensis	1840004000
Stipa divaricata	4000000002
Stipa exigua	0402000004
Stipa hymenoides	fec2fcf507
Stipa kingii	0000800100
Stipa latiglumis	0000b01501
Stipa lemmonii	067bfcdd07
Stipa lemmonii var. lemmonii	067bfcdd07
Stipa lemmonii var. pubescens	0018000000
Stipa lepida	19fd035c01
Stipa lettermanii	4643dc4406
Stipa manicata	0104080000
Stipa mauritanica	0010000000
Stipa miliacea	0184032a00
Stipa miliacea subsp. miliacea	0184032a00
Stipa miliacea var. miliacea	0184032a00
Stipa nelsonii	0602f88104
Stipa nelsonii subsp. dorei	0602f88104
Stipa nelsonii var. dorei	0602f88104
Stipa nevadensis	0402c40106
Stipa occidentalis	0643fcc506
Stipa occidentalis var. californica	0643fcc506
Stipa occidentalis var. occidentalis	0040fcc102
Stipa occidentalis var. pubescens	0601f88500
Stipa parishii	4040205503
Stipa parishii var. parishii	4040205503
Stipa pinetorum	4000fc8502
Stipa pulchra	19fd1b4a01
Stipa purpurata	0104000000
Stipa speciosa	18c227f507
Stipa stillmanii	0601480000
Stipa thurberiana	0403c48107
Stipa webberi	0402c00006
Streptanthella longirostris	e002052006
Streptanthus barbatus	0001000000
Streptanthus barbiger	0038000000
Streptanthus batrachopus	0020000800
Streptanthus bernardinus	0040005401
Streptanthus brachiatus	0010000000
Streptanthus breweri	0019010800
Streptanthus callistus	0000000800
Streptanthus campestris	0040005401
Streptanthus cordatus	4402040106
Streptanthus cordatus var. cordatus	4402040006
Streptanthus cordatus var. piutensis	0000000100
Streptanthus diversifolius	0000b80100
Streptanthus drepanoides	0019080000
Streptanthus farnsworthianus	0000b00100
Streptanthus fenestratus	0000000100
Streptanthus glandulosus	0138030800
Streptanthus glandulosus subsp. albidus	0000000800
Streptanthus glandulosus subsp. glandulosus	0038030800
Streptanthus glandulosus subsp. hoffmanii	0020000000
Streptanthus glandulosus subsp. niger	0100000000
Streptanthus glandulosus subsp. pulchellus	0000000800
Streptanthus glandulosus subsp. secundus	0030000800
Streptanthus glandulosus subsp. sonomensis	0020000000
Streptanthus glandulosus var. albidus	0000000800
Streptanthus glandulosus var. glandulosus	0038030800
Streptanthus glandulosus var. hoffmanii	0020000000
Streptanthus glandulosus var. niger	0100000000
Streptanthus glandulosus var. pulchellus	0000000800
Streptanthus glandulosus var. secundus	0030000800
Streptanthus glandulosus var. sonomensis	0020000000
Streptanthus gracilis	0000000100
Streptanthus hesperidis	0010000000
Streptanthus hispidus	0000000800
Streptanthus howellii	0001000000
Streptanthus insignis	0000010000
Streptanthus insignis subsp. insignis	0000010000
Streptanthus insignis subsp. lyonii	0000010000
Streptanthus longisiliquus	0600000000
Streptanthus morrisonii	0038020000
Streptanthus oblanceolatus	0001000000
Streptanthus oliganthus	0000840002
Streptanthus polygaloides	0000780000
Streptanthus tortuosus	0639fa8900
Streptanthus vernalis	0010000000
Streptanthus vimineus	0010000000
Streptopus amplexifolius	040b400004
Streptopus amplexifolius var. americanus	040b400004
Strigosella africana	6000040002
Stuckenia filiformis	0103842a06
Stuckenia filiformis subsp. alpina	0103842a06
Stuckenia pectinata	ffffffff07
Stuckenia striata	6002fcab06
Stylocline citroleum	0080002000
Stylocline gnaphaloides	b9d03b7c01
Stylocline intertexta	e000000000
Stylocline masonii	0000222001
Stylocline micropoides	e000040002
Stylocline psilocarphoides	e000041403
Stylocline sonorensis	8000000000
Styrax redivivus	0658fad501
Suaeda calceoliformis	ffffffff07
Suaeda californica	0100000000
Suaeda esteroa	0080000000
Suaeda nigra	f9c2047e07
Suaeda occidentalis	6002040006
Suaeda taxifolia	1980000000
Subularia aquatica	0000c00100
Subularia aquatica subsp. americana	0000c00100
Subularia aquatica var. americana	0000c00100
Swallenia alexandrae	6000000000
Swertia perennis	0001400100
Syagrus romanzoffiana	0080000000
Symphoricarpos albus	1ffd0b5c01
Symphoricarpos albus subsp. laevigatus	1ffd0b5c01
Symphoricarpos albus var. laevigatus	1ffd0b5c01
Symphoricarpos longiflorus	4002040006
Symphoricarpos mollis	1ffffbdd05
Symphoricarpos rotundifolius	5ec2fcd507
Symphoricarpos rotundifolius var. parishii	58c0045503
Symphoricarpos rotundifolius var. rotundifolius	0602fc8106
Symphyotrichum ascendens	0002c49506
Symphyotrichum bracteolatum	0602fc8106
Symphyotrichum campestre	0002c40106
Symphyotrichum chilense	09bd030800
Symphyotrichum defoliatum	0040005400
Symphyotrichum foliaceum	063df8c504
Symphyotrichum foliaceum var. apricum	0601f88100
Symphyotrichum foliaceum var. parryi	063df8c504
Symphyotrichum frondosum	0742ffdd07
Symphyotrichum greatae	0000001000
Symphyotrichum hendersonii	0001000000
Symphyotrichum lanceolatum	00c0044002
Symphyotrichum lanceolatum subsp. hesperium	00c0044002
Symphyotrichum lanceolatum var. hesperium	00c0044002
Symphyotrichum lentum	0100000a00
Symphyotrichum spathulatum	063ffcd507
Symphyotrichum spathulatum var. intermedium	063ffc8106
Symphyotrichum spathulatum var. spathulatum	063ffcd507
Symphyotrichum spathulatum var. yosemitanum	0601f88100
Symphyotrichum subspicatum	073f030804
Symphyotrichum subulatum	99c0037e01
Symphyotrichum subulatum var. elongatum	0080000000
Symphyotrichum subulatum var. parviflorum	99c0037e01
Symphyotrichum subulatum var. squamatum	0100000200
Symphytum X uplandicum	0024000200
Symphytum officinale	0400000000
Synthyris cordata	003d000000
Synthyris missurica	0000000004
Synthyris missurica subsp. missurica	0000000004
Synthyris missurica var. missurica	0000000004
Synthyris reniformis	003d000800
Syntrichopappus fremontii	e000000000
Syntrichopappus lemmonii	0000025401
Systenotheca vortriedei	0000020000
Syzygium australe	0080000000
Tagetes erecta	19c0035c01
Tagetes minuta	0080222801
Tamarix aphylla	e080000000
Tamarix chinensis	e0c0044402
Tamarix gallica	0180000800
Tamarix parviflora	e1ba25aa07
Tamarix ramosissima	f9c1067403
Tanacetum bipinnatum	0104000000
Tanacetum parthenium	00b94a7e01
Tanacetum vulgare	0426420404
Taraxacum californicum	0000000400
Taraxacum ceratophorum	0000000002
Taraxacum erythrospermum	1fffffff07
Taraxacum officinale	1fffffff07
Taraxia ovata	013d030800
Taraxia subacaulis	0002fc8106
Taraxia tanacetifolia	0602fc8106
Tauschia arguta	18c0025401
Tauschia glauca	0021000000
Tauschia hartwegii	0290bb0b01
Tauschia howellii	0001400000
Tauschia kelloggii	073c080800
Tauschia parishii	000004d503
Taxus brevifolia	063dd80800
Teesdalia coronopifolia	0020000000
Teesdalia nudicaulis	0100000000
Tellima grandiflora	0529400800
Tetracoccus dioicus	00c0000000
Tetracoccus hallii	e000000000
Tetracoccus ilicifolius	4000000000
Tetradymia argyraea	4000000000
Tetradymia axillaris	6000241003
Tetradymia axillaris var. axillaris	4000000002
Tetradymia axillaris var. longispina	6000241003
Tetradymia canescens	6442c41507
Tetradymia comosa	00c0005401
Tetradymia glabrata	6002040006
Tetradymia spinosa	0002040004
Tetradymia stenolepis	6000249003
Tetradymia tetrameres	0000040000
Tetragonia tetragonioides	0184000000
Tetraneuris acaulis	4000004000
Tetraneuris acaulis var. arizonica	4000004000
Tetrapteron graciliflorum	073d3b2a01
Tetrapteron palmeri	6040012203
Teucrium cubense	8000000000
Teucrium cubense subsp. depressum	8000000000
Teucrium glandulosum	8000000000
Thalictrum alpinum	0000c00002
Thalictrum fendleri	077fffdd07
Thalictrum fendleri var. fendleri	0643fedd07
Thalictrum fendleri var. polycarpum	017dfb9d01
Thalictrum occidentale	0005000000
Thalictrum sparsiflorum	0600dc4402
Thamnosma montana	e040004000
Thelesperma megapotamicum	10c0000000
Thelypodium brachycarpum	063b040006
Thelypodium crispum	0002c40106
Thelypodium flexuosum	0002000004
Thelypodium howellii	0002000004
Thelypodium howellii subsp. howellii	0002000004
Thelypodium howellii var. howellii	0002000004
Thelypodium integrifolium	6002040006
Thelypodium integrifolium subsp. affine	6000040002
Thelypodium integrifolium subsp. complanatum	0002040006
Thelypodium integrifolium var. affine	6000040002
Thelypodium integrifolium var. complanatum	0002040006
Thelypodium laciniatum	0402040006
Thelypodium milleflorum	0002040006
Thelypodium stenopetalum	0000000400
Thelypteris nevadensis	0021400000
Thelypteris puberula	0080005001
Thelypteris puberula var. sonorensis	0080005001
Thermopsis californica	077e030805
Thermopsis californica var. argentata	0602000005
Thermopsis californica var. californica	013c030800
Thermopsis californica var. semota	0040000000
Thermopsis gracilis	0639000000
Thermopsis macrophylla	0000000001
Thermopsis robusta	0021000000
Thlaspi arvense	ffffffff07
Thuja plicata	0025000000
Thymophylla pentachaeta	e080004000
Thymophylla pentachaeta var. belenidium	e080004000
Thymophylla tenuiloba	0080000000
Thymophylla tenuiloba var. tenuiloba	0080000000
Thysanocarpus conchuliferus	0800000000
Thysanocarpus curvipes	fffffbff05
Thysanocarpus laciniatus	f8d027de03
Thysanocarpus laciniatus subsp. laciniatus	f8d027de03
Thysanocarpus laciniatus var. hitchcockii	e000000000
Thysanocarpus laciniatus var. laciniatus	f8d027de03
Thysanocarpus laciniatus var. rigidus	e040004000
Thysanocarpus radians	023d392a00
Tiarella trifoliata	002d000800
Tiarella trifoliata subsp. trifoliata	0021000000
Tiarella trifoliata subsp. unifoliata	002d000800
Tiarella trifoliata var. trifoliata	0021000000
Tiarella trifoliata var. unifoliata	002d000800
Tidestromia lanuginosa	4000000000
Tidestromia suffruticosa	e000000000
Tidestromia suffruticosa var. oblongifolia	e000000000
Tiquilia canescens	c000000000
Tiquilia canescens var. canescens	c000000000
Tiquilia canescens var. pulchella	8000000000
Tiquilia nuttallii	6002248106
Tiquilia palmeri	e000000000
Tiquilia plicata	e000000000
Tolmiea diplomenziesii	013d000800
Tolpis barbata	0120000000
Tonella tenella	0639400800
Tonestus eximius	0000c00100
Tonestus lyallii	0001000000
Tonestus peirsonii	0000800002
Torilis arvensis	1ffdfbff01
Torilis nodosa	1ffdfbff01
Torreya californica	023cfb8900
Torreyochloa erecta	0400c00100
Torreyochloa pallida	073ff88104
Torreyochloa pallida var. pauciflora	073ff88104
Townsendia condensata	0000040000
Townsendia leptotes	0000000002
Townsendia scapigera	0002040006
Toxicodendron diversilobum	3ffdfbff01
Toxicoscordion brevibracteatum	6000008001
Toxicoscordion exaltatum	0000380000
Toxicoscordion fontanum	0038010800
Toxicoscordion fremontii	19fd135e01
Toxicoscordion micranthum	003d000000
Toxicoscordion paniculatum	063f440006
Toxicoscordion venenosum	477fffc907
Toxicoscordion venenosum var. venenosum	477fffc907
Tracyina rostrata	0030000000
Tradescantia fluminensis	0080022800
Tradescantia ohiensis	0004000000
Tragia ramosa	4000000000
Tragopogon dubius	05c3ffff07
Tragopogon porrifolius	99ff0b7e05
Tragopogon pratensis	0403c00104
Transberingia bursifolia	0000040002
Transberingia bursifolia subsp. virgata	0000040002
Trautvetteria caroliniensis	0601c00100
Triadica sebifera	0000082200
Triantha occidentalis	063dc00100
Triantha occidentalis subsp. occidentalis	063dc00100
Trianthema portulacastrum	e000002000
Tribulus terrestris	ffffffff07
Tricardia watsonii	e000040402
Trichocoronis wrightii	0080002200
Trichocoronis wrightii var. wrightii	0080002200
Trichophorum clementis	0000800100
Trichophorum pumilum	0000800002
Trichoptilium incisum	e000000000
Trichostema austromontanum	004084d403
Trichostema austromontanum subsp. austromontanum	004084d403
Trichostema austromontanum subsp. compactum	0000004000
Trichostema lanatum	00c0035001
Trichostema lanceolatum	1ffdfbff01
Trichostema laxum	003f000004
Trichostema micranthum	0000000401
Trichostema oblongum	063bf88104
Trichostema ovatum	0000002001
Trichostema parishii	0040005401
Trichostema rubisepalum	0000110000
Trichostema ruygtii	0000000000
Trichostema simulatum	0603480004
Tridens muticus	e000000000
Tridens muticus var. muticus	e000000000
Trientalis europaea	0004000000
Trientalis latifolia	053ddb0a00
Trifolium albopurpureum	1ffdfbff01
Trifolium alexandrinum	0000000200
Trifolium amoenum	0138000800
Trifolium andersonii	0002440006
Trifolium andersonii subsp. andersonii	0002400004
Trifolium andersonii subsp. beatleyae	0000040002
Trifolium andersonii var. andersonii	0002400004
Trifolium andersonii var. beatleyae	0000040002
Trifolium angustifolium	0100030000
Trifolium arvense	1ffdfbff01
Trifolium aureum	0000002000
Trifolium barbigerum	013ddb2a00
Trifolium beckwithii	0002400004
Trifolium bifidum	1ffd3b7e01
Trifolium bifidum var. bifidum	01380b2a00
Trifolium bifidum var. decipiens	1ffd3b7e01
Trifolium bolanderi	0000800000
Trifolium breweri	0601d80000
Trifolium buckwestiorum	0000000800
Trifolium campestre	1ffdfbff01
Trifolium cernuum	0120000a00
Trifolium ciliolatum	1ff8fbdf01
Trifolium cyathiferum	063ddc2200
Trifolium depauperatum	1bf8fbea00
Trifolium depauperatum subsp. amplectens	0000032a00
Trifolium depauperatum subsp. depauperatum	0238d82a00
Trifolium depauperatum var. amplectens	0000032a00
Trifolium depauperatum var. depauperatum	0238d82a00
Trifolium depauperatum var. truncatum	1bf83bea00
Trifolium dichotomum	003d932a00
Trifolium dubium	1ffdfbff01
Trifolium eriocephalum	063d480000
Trifolium eriocephalum subsp. eriocephalum	063d480000
Trifolium eriocephalum var. eriocephalum	063d480000
Trifolium fragiferum	18fa035607
Trifolium fucatum	1ebc002a00
Trifolium glomeratum	1ffdfbff01
Trifolium gracilentum	67fdfbff01
Trifolium grayi	0020da0a00
Trifolium gymnocarpon	0002000004
Trifolium gymnocarpon subsp. plummerae	0002000004
Trifolium gymnocarpon var. plummerae	0002000004
Trifolium hirtum	1ffdfbff01
Trifolium howellii	0639000000
Trifolium hybridum	003d000000
Trifolium hydrophilum	0100032a00
Trifolium incarnatum	1ffdfbff01
Trifolium jokerstii	0000000200
Trifolium kingii	0000040102
Trifolium kingii subsp. dedeckerae	0000040102
Trifolium lemmonii	0000400000
Trifolium longipes	063bfcc506
Trifolium longipes subsp. atrorubens	0000f8c500
Trifolium longipes subsp. elmeri	0639000000
Trifolium longipes subsp. hansenii	063bfc8106
Trifolium longipes subsp. multipedunculatum	0002000004
Trifolium longipes subsp. oreganum	0039000000
Trifolium longipes subsp. shastense	0601000000
Trifolium longipes var. atrorubens	0000f8c500
Trifolium longipes var. elmeri	0639000000
Trifolium longipes var. hansenii	063bfc8106
Trifolium longipes var. multipedunculatum	0002000004
Trifolium longipes var. oreganum	0039000000
Trifolium longipes var. shastense	0601000000
Trifolium macraei	1924000800
Trifolium macrocephalum	0603400004
Trifolium microcephalum	78fdf8ef00
Trifolium microdon	197c1b6a00
Trifolium monanthum	0600fcd502
Trifolium monanthum subsp. grantianum	0000005400
Trifolium monanthum subsp. monanthum	0600fc8102
Trifolium monanthum subsp. parvum	0600c40102
Trifolium monanthum subsp. tenerum	0000c00100
Trifolium monanthum var. grantianum	0000005400
Trifolium monanthum var. monanthum	0600fc8102
Trifolium monanthum var. parvum	0600c40102
Trifolium monanthum var. tenerum	0000c00100
Trifolium obtusiflorum	01fddb5800
Trifolium oliganthum	0039faab00
Trifolium olivaceum	0210082a00
Trifolium palmeri	1800000000
Trifolium polyodon	0100000000
Trifolium pratense	1fffffff07
Trifolium productum	0403c00004
Trifolium repens	1fffffff07
Trifolium resupinatum	0104000000
Trifolium retusum	0600000000
Trifolium siskiyouense	0001000000
Trifolium striatum	03100a0000
Trifolium subterraneum	00384b2200
Trifolium tomentosum	0038080a00
Trifolium trichocalyx	0100000000
Trifolium variegatum	1ffdffff03
Trifolium variegatum var. geminiflorum	017cdb4800
Trifolium variegatum var. major	19fcffff03
Trifolium variegatum var. variegatum	1ffdffff03
Trifolium vesiculosum	0114000a00
Trifolium willdenovii	1ffffbff05
Trifolium wormskioldii	07fdffe902
Triglochin concinna	6587040106
Triglochin concinna var. concinna	0184000000
Triglochin concinna var. debilis	6403040106
Triglochin maritima	0587fc8f06
Triglochin palustris	0000800100
Triglochin scilloides	01d6ffeb06
Triglochin striata	0184000000
Trillium albidum	063d480800
Trillium angustipetalum	0101fa0100
Trillium chloropetalum	0010000800
Trillium ovatum	013d030800
Trillium ovatum subsp. oettingeri	0001000000
Trillium ovatum subsp. ovatum	013d030800
Trillium ovatum var. oettingeri	0001000000
Trillium ovatum var. ovatum	013d030800
Triodanis biflora	19fdfbff01
Triodanis perfoliata	18fd405601
Triphysaria eriantha	03f63b6a04
Triphysaria eriantha subsp. eriantha	03763b6a04
Triphysaria eriantha subsp. rosea	0184000800
Triphysaria floribunda	0100000800
Triphysaria micrantha	0100332000
Triphysaria pusilla	013d3b2a00
Triphysaria versicolor	013c000a00
Triphysaria versicolor subsp. faucibarbata	0138000a00
Triphysaria versicolor subsp. versicolor	0104000000
Tripleurospermum inodorum	0604000000
Tripterocalyx crux-maltae	0002000004
Tripterocalyx micranthus	6000000000
Trisetum canescens	053fc34904
Trisetum cernuum	0024000000
Trisetum projectum	0400c00100
Trisetum spicatum	0401c45506
Trisetum wolfii	0400800100
Triteleia bridgesii	0239580000
Triteleia clementina	1000000000
Triteleia crocea	0401000000
Triteleia dudleyi	0000809501
Triteleia grandiflora	0601000000
Triteleia hendersonii	0001000000
Triteleia hyacinthina	073dfbaf00
Triteleia ixioides	0701fb8900
Triteleia ixioides subsp. anilina	0601f88100
Triteleia ixioides subsp. cookii	0000020000
Triteleia ixioides subsp. ixioides	0100010800
Triteleia ixioides subsp. scabra	0601f88100
Triteleia ixioides subsp. unifolia	0600d80000
Triteleia ixioides var. anilina	0601f88100
Triteleia ixioides var. cookii	0000020000
Triteleia ixioides var. ixioides	0100010800
Triteleia laxa	073dfb9d01
Triteleia lilacina	0200180000
Triteleia lugens	0038431100
Triteleia montana	0000c00000
Triteleia peduncularis	013d030800
Triticum aestivum	f9f8035e01
Trixis californica	e000000000
Trixis californica var. californica	e000000000
Tropaeolum majus	1184000800
Tropidocarpum californicum	0000002000
Tropidocarpum capparideum	0000022000
Tropidocarpum gracile	7bf03bfe01
Tsuga heterophylla	0025000000
Tsuga mertensiana	040bc40104
Tuberaria guttata	0000180200
Tuctoria greenei	0002002204
Tuctoria mucronata	0000000200
Tulipa clusiana	0040000000
Turritis glabra	1ffffbff05
Typha angustifolia	01bdf8ab00
Typha domingensis	f9e6077e07
Typha latifolia	ffffffff07
Ulex europaeus	01a4000000
Ulmus americana	0080000200
Ulmus minor	99d0385601
Ulmus parvifolia	19c2005407
Ulmus pumila	18c2fcd507
Umbellularia californica	027d3a5e01
Uropappus lindleyi	fffbffff07
Urospermum picroides	0180080801
Urtica dioica	7fffc7ff07
Urtica dioica subsp. gracilis	0105002000
Urtica dioica subsp. holosericea	7fffc7ff07
Urtica dioica var. gracilis	0105002000
Urtica dioica var. holosericea	7fffc7ff07
Urtica urens	99e62bfe05
Utricularia gibba	1ffdfbff01
Utricularia intermedia	0602c00104
Utricularia macrorhiza	663ffc8d06
Utricularia minor	0402c00104
Utricularia ochroleuca	0402400004
Utricularia subulata	0004000000
Vaccaria hispanica	05fb57ca06
Vaccinium cespitosum	052dc00904
Vaccinium deliciosum	0001400004
Vaccinium macrocarpon	0000400000
Vaccinium membranaceum	0009400004
Vaccinium ovatum	0965000801
Vaccinium parvifolium	0425c00800
Vaccinium scoparium	0001000000
Vaccinium uliginosum	0405c00100
Vaccinium uliginosum subsp. occidentale	0405c00100
Vaccinium uliginosum var. occidentale	0405c00100
Vachellia farnesiana	e0c0000000
Vachellia farnesiana var. farnesiana	e080000000
Vachellia farnesiana var. minuta	00c0000000
Vahlodea atropurpurea	0401000000
Valeriana californica	060bc00104
Valeriana occidentalis	0000000004
Valeriana pubicarpa	0000040002
Valeriana sitchensis	0025000000
Valeriana sitchensis subsp. scouleri	0025000000
Valeriana sitchensis subsp. sitchensis	0001000000
Valeriana sitchensis var. scouleri	0025000000
Valeriana sitchensis var. sitchensis	0001000000
Valerianella carinata	0000080000
Valerianella locusta	0021480a00
Vancouveria chrysantha	0005000000
Vancouveria hexandra	0025000000
Vancouveria planipetala	002d020800
Velezia rigida	0011182a00
Venegasia carpesioides	19c0025401
Ventenata dubia	040b400004
Veratrum californicum	047fc45507
Veratrum californicum var. californicum	047fc45507
Veratrum fimbriatum	0024000000
Veratrum insolitum	0001000000
Veratrum viride	0001000000
Verbascum blattaria	027f487a01
Verbascum bombyciferum	0020000000
Verbascum speciosum	0000000800
Verbascum thapsus	1fffffff05
Verbascum virgatum	00e03a3c01
Verbena bonariensis	0000002a00
Verbena bracteata	fec2077607
Verbena californica	0000100000
Verbena gooddingii	e000000000
Verbena hastata	0102002a04
Verbena lasiostachys	1ffdfbff01
Verbena lasiostachys var. lasiostachys	1ffdfbff01
Verbena lasiostachys var. scabrida	19fd238a01
Verbena litoralis	0000182200
Verbena menthifolia	80c0004000
Verbena pulchella	00c0000001
Verbena scabra	00c0001000
Verbesina dissita	0080000400
Verbesina encelioides	8180032000
Verbesina encelioides subsp. exauriculata	8180032000
Verbesina encelioides var. exauriculata	8180032000
Veronica americana	5fffffff07
Veronica anagallis-aquatica	ffffffff07
Veronica arvensis	e07b3a7e05
Veronica catenata	1ffdfbff01
Veronica copelandii	0001000000
Veronica cusickii	0600c00000
Veronica peregrina	fffdffff03
Veronica peregrina subsp. xalapensis	fffdffff03
Veronica peregrina var. xalapensis	fffdffff03
Veronica persica	9ffdfbff01
Veronica scutellata	0726f88504
Veronica serpyllifolia	073dfc8d02
Veronica serpyllifolia subsp. humifusa	073dfc8d02
Veronica serpyllifolia var. humifusa	073dfc8d02
Veronica triphyllos	0000000000
Veronica wormskjoldii	0603f88104
Viburnum edule	0400000000
Viburnum ellipticum	003d180800
Vicia americana	1fffffff01
Vicia americana subsp. americana	1fffffff01
Vicia americana var. americana	1fffffff01
Vicia benghalensis	19f4031a01
Vicia bithynica	0100000000
Vicia cracca	0022000a04
Vicia disperma	0000000800
Vicia faba	00d4000a01
Vicia gigantea	01a4020800
Vicia hassei	19e0030801
Vicia hirsuta	19e4185c01
Vicia lathyroides	0020000000
Vicia ludoviciana	19c0025001
Vicia ludoviciana subsp. ludoviciana	19c0025001
Vicia ludoviciana var. ludoviciana	19c0025001
Vicia lutea	0034000800
Vicia pannonica	00a0000000
Vicia sativa	1bf41b6e01
Vicia sativa subsp. nigra	19f41a6a00
Vicia sativa subsp. sativa	13f40b2e01
Vicia sativa var. nigra	19f41a6a00
Vicia sativa var. sativa	13f40b2e01
Vicia tetrasperma	0124000800
Vicia villosa	0bf75f7e07
Vicia villosa subsp. varia	03744f3e03
Vicia villosa subsp. villosa	09d7577a04
Vicia villosa var. villosa	09d7577a04
Viguiera purisimae	0040000000
Vinca major	01e44a5e00
Viola adunca	1ffdfbff05
Viola adunca subsp. adunca	1ffdfbff05
Viola adunca var. adunca	1ffdfbff05
Viola arvensis	0601382200
Viola bakeri	040bc00104
Viola beckwithii	0403400004
Viola cuneata	003d400000
Viola douglasii	057d7bfe00
Viola glabella	073dfb8904
Viola hallii	003d000000
Viola howellii	0001000000
Viola langsdorffii	0004000000
Viola lobata	067df8c100
Viola lobata subsp. integrifolia	067df8c100
Viola lobata subsp. lobata	067df8c100
Viola lobata var. integrifolia	067df8c100
Viola lobata var. lobata	067df8c100
Viola macloskeyi	1ffdffff07
Viola nephrophylla	0483441406
Viola ocellata	033d030800
Viola odorata	0104001a00
Viola palustris	0004000000
Viola pedunculata	19f0035c01
Viola pinetorum	0600f8c501
Viola pinetorum subsp. grisea	0000008501
Viola pinetorum subsp. pinetorum	0600f8c501
Viola pinetorum var. grisea	0000008501
Viola pinetorum var. pinetorum	0600f8c501
Viola praemorsa	063dc00004
Viola praemorsa subsp. linguifolia	063dc00004
Viola praemorsa subsp. praemorsa	063dc00004
Viola praemorsa var. linguifolia	063dc00004
Viola praemorsa var. praemorsa	063dc00004
Viola primulifolia	0001000000
Viola primulifolia subsp. occidentalis	0001000000
Viola purpurea	7fffffdd07
Viola purpurea subsp. aurea	6000040002
Viola purpurea subsp. dimorpha	0002440006
Viola purpurea subsp. integrifolia	063dc00000
Viola purpurea subsp. mesophyta	0600c04501
Viola purpurea subsp. mohavensis	6040045403
Viola purpurea subsp. purpurea	1ffffbdd05
Viola purpurea subsp. quercetorum	1ffffbdd05
Viola purpurea subsp. venosa	401a041006
Viola purpurea var. aurea	6000040002
Viola purpurea var. purpurea	1ffffbdd05
Viola purpurea var. venosa	401a041006
Viola sempervirens	013d030800
Viola sheltonii	007d431d05
Viola tomentosa	0000800000
Viscum album	0020000000
Vitis californica	033d3f2a02
Vitis girdiana	58c0005401
Vitis rupestris	0130032a00
Vitis vinifera	0100032a00
Volutaria muricata	0080000000
Washingtonia filifera	e080200000
Washingtonia robusta	0080000000
Watsonia marginata	0080000000
Watsonia meriana	0104000000
Whipplea modesta	003d020800
Wislizenia refracta	e000002000
Wislizenia refracta subsp. californica	0000002000
Wislizenia refracta subsp. palmeri	8000000000
Wislizenia refracta subsp. refracta	e000000000
Wislizenia refracta var. palmeri	8000000000
Wislizenia refracta var. refracta	e000000000
Wolffia arrhiza	0080000000
Wolffia borealis	04b8000000
Wolffia brasiliensis	0000000200
Wolffia columbiana	0180022000
Wolffia globosa	0080382000
Wolffiella lingulata	0184382a00
Wolffiella oblonga	0184382a00
Woodsia oregana	4443404506
Woodsia plummerae	4000000000
Woodsia scopulina	0403c00506
Woodwardia fimbriata	1ffdfbff01
Wyethia angustifolia	033ffbab04
Wyethia bolanderi	0010180000
Wyethia elata	0000900000
Wyethia glabra	0138030800
Wyethia helenioides	0339db2a00
Wyethia invenusta	0000200100
Wyethia longicaulis	0039000000
Wyethia mollis	060bdc0004
Wyethia ovata	18c0205501
Wyethia reticulata	0000080000
Xanthisma gracile	6000000000
Xanthisma junceum	0040004000
Xanthisma spinulosum	e000000000
Xanthisma spinulosum var. gooddingii	e000000000
Xanthium spinosum	1ffdfbff01
Xanthium strumarium	ffffffff07
Xerophyllum tenax	0521400800
Xylococcus bicolor	1080000000
Xylorhiza cognata	8000000000
Xylorhiza orcuttii	8000000000
Xylorhiza tortifolia	e000040002
Xylorhiza tortifolia var. tortifolia	e000040002
Yabea microcarpa	7ffdfbff01
Yucca baccata	4000000000
Yucca baccata var. baccata	4000000000
Yucca brevifolia	6000048102
Yucca schidigera	f8c0005401
Zannichellia palustris	ffff077e07
Zantedeschia aethiopica	01a4020800
Zeltnera arizonica	8000000000
Zeltnera davyi	1904020800
Zeltnera exaltata	8642075006
Zeltnera muehlenbergii	01003b0800
Zeltnera namophila	6000040002
Zeltnera trichantha	0010000800
Zeltnera venusta	72f13c7403
Zizania palustris	0002000204
Zizania palustris var. interior	0002000204
Ziziphus obtusifolia	e000000000
Ziziphus obtusifolia var. canescens	e000000000
Ziziphus parryi	e0c0004400
Ziziphus parryi var. parryi	e0c0004400
Ziziphus zizyphus	0000080200
Zostera japonica	0004000000
Zostera marina	1984000000
Zostera pacifica	1984000000
Zygophyllum fabago	e020002000
