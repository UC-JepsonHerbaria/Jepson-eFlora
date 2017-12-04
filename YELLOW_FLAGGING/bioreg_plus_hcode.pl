#!/usr/local/bin/perl
while(<DATA>){
chomp;
s/^\*//;
($complete_name,$range,$hcode)=split(/\t+/);
$complete_name=~s/&Euml;/E/;
if(m/(ssp\.|var\.)/){
$complete_name=~s/^([A-Z]+) +([-a-zX]+).*(ssp\.|var\.) +([-a-z]+).*/$1 $2 $3 $4/;
}
else{
$complete_name=~s/^([A-Z]+) +([-a-zX]+).*/$1 $2/;
}
$complete_name=~s/ +/ /g;
#$range{$complete_name}="$range\t$hcode";
$range{$complete_name}="$range";
$hcode{$complete_name}="$hcode";
}
$/="";
#open(IN,"5000.xml") || die;
open(IN,"4000.out") || die;
while(<IN>){
	if (m/<genus_name>([^<]+)/){
		$genus=$1;
	}

	if(m/sp_par/){
		if(m/<sp_name origin="(native|intro)">([^<]+)/){
			$spname=$2;
			$complete_name="$genus $spname";
			$_=&check($_, $complete_name);
		}
		elsif(m/<infrasp_name origin="(native|intro)">([^<]+)/){
			$complete_name="$genus $spname $2";
			$_=&check($_, $complete_name);
		}

		#elsif(m/<(native|intro)_infrasp_name>([^<]+)/){
			#$complete_name="$genus $spname $2";
			#$_=&check($_, $complete_name);
		#}
		elsif(m/<infrasp_name origin="(native|intro)">([^<]+)/){
			$complete_name="$genus $spname $2";
			$_=&check($_, $complete_name);
		}
#<infrasp_name origin="native" style="full_name">A. alpestre  (D.H. Hoppe) Clairv.  var. americanum</infrasp_name>
elsif(m/<infrasp_name origin="(native|intro)" style="full_name">[A-Z]\. +([a-z-]+).*(var\.|ssp\.) (.*)/){
			$complete_name="$genus $2 $3 $4";
			$_=&check($_, $complete_name);
		}

		#elsif(m/<(intro|native)_infrasp_full_name>([^<]+)/){
			#$complete_name="$genus $2";
			#$_=&check($_, $complete_name);
		#}
		elsif(m/<phase_name>([^<]+)/){
			$complete_name="$genus $1";
			$_=&check($_, $complete_name);
		}
		else{
			($name)=m/^(.*\n.*)/;
			warn "$name sp_par without species element\n";
		}
	}

print;
}
close(IN);

sub check{
local($_,$complete_name)=@_;
$complete_name=~s/&Euml;/E/;
$complete_name=~s/  */ /g;
$complete_name=~s/[A-Z]\. //;
$complete_name=~s/^([A-Z]+) +([-a-z]+).*(ssp\.|var\.) +([-a-z]+).*/$1 $2 $3 $4/;
if(($range)=m/<JDS>(.*)<\/JDS>/){
$range=~s/&plus_minus;/+\/-/g;
$range=~s/&gt;/>/g;
$range=~s/&lt;/</g;
#$range =~ s/;[^)]+$//;

}
$complete_name=~s/&mathx.;/X-/g;
unless($range{$complete_name}){
warn "$complete_name\t$range\n";
}
#unless($range{$complete_name} eq $range){
if($range{$complete_name} ){
#print  "$complete_name\n\t<NDS>$range{$complete_name}\n\t<ODS>$range\n";
s/<\/JDS>/<\/JDS>\n<NDS>$range{$complete_name}<\/NDS>\n<HCODE>$hcode{$complete_name}<\/HCODE>/;
}
$_;
}
__END__
ABIES amabilis (Douglas) James Forbes	KR (w Siskiyou Co., 2 populations)	0001000000
ABIES bracteata (D. Don) Nutt.	n SCoRO (Santa Lucia Range)	0000020000
ABIES concolor (Gordon & Glend.) Lindley	KR, NCoR, CaRH, SNH, Teh, TR, PR, MP, n SNE, DMtns	447bc4d505
ABIES grandis (Douglas) Lindley	NCo, NCoR	003c000000
ABIES lasiocarpa (Hook.) Nutt. var. lasiocarpa	KR (w Siskiyou Co., 6 populations)	0001000000
ABIES magnifica Andr. Murray	KR, NCoRH, CaRH, SNH, SNE	0409c40102
ABIES magnifica Andr. Murray var. magnifica	KR, NCoRH, CaRH, n&c SNH, SNE	0409c40002
ABIES magnifica Andr. Murray var. shastensis Lemmon	KR, CaRH, s SNH	0401000100
ABIES procera Rehder	n KR, CaRH	0401000000
ABRONIA alpina M.K. Brandegee	s SNH (Ramshaw and Templeton meadows, Tulare Co.)	0000000100
ABRONIA gracilis Benth.	SCo (San Diego Co.), s DSon	8080000000
ABRONIA latifolia Eschsch.	NCo, CCo, n SCo (Santa Barbara Co.)	0184000000
ABRONIA maritima S. Watson	s CCo, SCo	0180000000
ABRONIA nana S. Watson ssp. covillei (Heimerl) Munz	DMtns	4000000000
ABRONIA pogonantha Heimerl	s SnJV, DMoj (and adjacent margins of SN)	6000f8a100
ABRONIA turbinata S. Watson	SNE, DMoj	6000040002
ABRONIA umbellata Lam.	NCo, CCo, SCo	0184000000
ABRONIA umbellata Lam. ssp. breviflora (Standley) Munz	NCo, CCo (Marin Co)	0104000000
ABRONIA umbellata Lam. ssp. umbellata	NCo (Sonoma Co.), CCo, SCo	0184000000
ABRONIA villosa S. Watson	SCo, D	e080000000
ABRONIA villosa S. Watson var. aurita (Abrams) Jepson	c&s SCo, w DSon	8080000000
ABRONIA villosa S. Watson var. villosa	D	e000000000
ABUTILON palmeri A. Gray	DSon, adjacent PR	8040000000
ABUTILON parvulum A. Gray	DMtns (Providence Mtns)	4000000000
ABUTILON theophrasti Medikus	GV (esp ScV), SW	18c0007601
ACACIA baileyana F. Muell.	SnFrB, SCoRO, WTR	0000020801
ACACIA cyclops G. Don	SCo	0080000000
ACACIA dealbata Link	NCoRO, SnFrB, SCoRO, SCo	00a0020800
ACACIA elata Benth.	SCoRO (Santa Barbara Co.)	0000020000
ACACIA farnesiana (L.) Willd. var. farnesiana	SCo (s San Diego Co.)	0080000000
ACACIA greggii A. Gray	D	e000000000
ACACIA longifolia (Andrews) Willd.	SnFrB, SCoRO, SCo	0080020800
ACACIA melanoxylon R.Br.	NCo, CCo, SnFrB, SCoRO, SCo, s ChI	1184020800
ACACIA paradoxa DC.	SnFrB, SCoRO, SCo	0080020800
ACACIA pycnantha Benth.	SCoRO, SCo	0080020000
ACACIA retinodes Schldl.	SnFrB, SCoRO, SCo, WTR	0080020801
ACACIA verticillata (L'Her.) Willd.	SnFrB, SCoRO, SCo	0080020800
ACAENA novae-zelandiae Kirk	NCo, CCo, n SCo	0184000000
ACAENA pinnatifida Ru<#ed>z Lopez & Pav<#f3>n var. californica (Bitter) Jepson	s NCo, CCo, w SnFrB	0104000800
ACALYPHA californica Benth.	PR (San Diego Co.), w DSon	8040000000
ACAMPTOPAPPUS shockleyi A. Gray	SNE, DMoj	6000040002
ACAMPTOPAPPUS sphaerocephalus (A. Gray) A. Gray	Teh, SnGb, SnBr, PR, SNE, D	e04004d402
ACAMPTOPAPPUS sphaerocephalus (A. Gray) A. Gray var. hirtellus S.F. Blake	Teh, SnGb, SnBr, SNE, DMoj	6000049402
ACAMPTOPAPPUS sphaerocephalus (A. Gray) A. Gray var. sphaerocephalus	Teh, SnGb, SnBr, PR, D	e04000d400
ACANTHOMINTHA duttonii (Abrams) Jokerst	CCo, SnFrB (San Mateo Co.)	0100000800
ACANTHOMINTHA ilicifolia (A. Gray) A. Gray	s SCo, sw PR (sw San Diego Co)	00c0000000
ACANTHOMINTHA lanceolata Curran	SnFrB, SCoRI	0000010800
ACANTHOMINTHA obovata Jepson	SCoR, w&c WTR	0000030001
ACANTHOMINTHA obovata Jepson ssp. cordata Jokerst	SCoRO, w&c WTR (San Luis Obispo to Ventura cos.)	0000020001
ACANTHOMINTHA obovata Jepson ssp. obovata	SCoRI (San Benito, Monterey cos.)	0000010000
ACER circinatum Pursh	n&c NW, CaRH, n SN	043d480000
ACER glabrum Torrey	KR, CaRH, SN, SnJt, MP, SNE, DMtns	4403fcc106
ACER glabrum Torrey var. diffusum (E. Greene) F.J. Smiley	SnJt, SNE, DMtns	4000044002
ACER glabrum Torrey var. greenei A.C. Keller	s SN (esp Tulare Co)	0000200100
ACER glabrum Torrey var. torreyi (E. Greene) F.J. Smiley	KR, CaRH, SNH, MP	0403c00104
ACER macrophyllum Pursh	CA-FP (exc GV)	1ffdfbdd01
ACER negundo L. var. californicum (Torrey & A. Gray) Sarg.	CA-FP	1ffdfbff01
ACHILLEA millefolium L.	CA (exc D)	1fffffff07
ACHLYS californica I. Fukuda & H.G. Baker	NCo, w KR, w NCoRO	0025000000
ACHLYS triphylla (Smith) DC. ssp. triphylla	NCo, w KR, w NCoRO	0025000000
ACHNATHERUM aridum (M.E. Jones) Barkworth	e DMoj	6000000000
ACHNATHERUM brachychaetum (Godron) Barkworth	nw SnJV (eradicated from SnJV in Fresno Co.), n SCo	0080002000
ACHNATHERUM coronatum (Thurber) Barkworth	SCoR, SW	18c0035401
ACHNATHERUM diegoense (Swallen) Barkworth	ChI, PR	1840004000
ACHNATHERUM hymenoides (Roemer & Schultes) Barkworth	CaR, SN, SW, GB, D	fec2fcd507
ACHNATHERUM latiglume (Swallen) Barkworth	c&s SN, TR	0000b01501
ACHNATHERUM lemmonii (Vasey) Barkworth	KR, NCoR, CaR, SN, Teh, GB	063bfc8106
ACHNATHERUM lettermanii (Vasey) Barkworth	n&c SN, SnBr, MP	0002d80404
ACHNATHERUM nelsonii (Scribner) Barkworth ssp. dorei (Barkworth & J. Maze) Barkworth	CaR, SN, MP	0602f88104
ACHNATHERUM nevadense (B. Johnson) Barkworth	SNE	0000040002
ACHNATHERUM occidentale (Thurber) Barkworth	CA-FP (exc GV, CW, PR), GB	1ebffc9507
ACHNATHERUM occidentale (Thurber) Barkworth ssp. californicum (Merr. & Burtt Davy) Barkworth	KR, CaR, SN, SnBr, PR, GB	0643fcc506
ACHNATHERUM occidentale (Thurber) Barkworth ssp. occidentale	SN, PR	0040f8c100
ACHNATHERUM occidentale (Thurber) Barkworth ssp. pubescens (Vasey) Barkworth	KR, CaR, SN, SnBr	0601f88500
ACHNATHERUM parishii (Vasey) Barkworth	s SN, TR, PR, W&I	0040205503
ACHNATHERUM pinetorum (M.E. Jones) Barkworth	SN, W&I, DMtns	4000f88102
ACHNATHERUM speciosum (Trin. & Rupr.) Barkworth	s SN, SCoRO, SW, s SNE, D	f8c0265503
ACHNATHERUM stillmanii (Bolander) Barkworth	n SNH	0000400000
ACHNATHERUM thurberianum (Piper) Barkworth	SN, WTR, GB	0002fc8107
ACHNATHERUM webberi (Thurber) Barkworth	SN, MP, W&I	0002f88106
ACHRACHNE racemosa (Roem. & Schult.) Ohwi	DSon (Riverside Co.)	8000000000
ACHYRACHAENA mollis Schauer	CA-FP	1ffdfbff01
ACHYRONYCHIA cooperi Torrey & A. Gray	D	e000000000
ACLEISANTHES longiflora A. Gray	e DSon (Maria Mtns, e Riverside Co.)	8000000000
ACONITUM columbianum Nutt.	NW (exc NCo), CaR, SNH, MP, SNE (Sweetwater Mtns)	063bc40106
ACORUS calamus L.	n NCo (Humboldt Co.), NCoRI (Lake Co.), expected elsewhere	0014000000
ACOURTIA microcephala DC.	SCoR, SW	18c0035401
ACROPTILON repens (L.) DC.	CA (exc wettest NW, driest GB, D)	1fffffff07
ACTAEA rubra (Aiton) Willd.	NW, CaR, SN (exc Teh), SnFrB, SCoRO, SnBr	063dfa0d00
ADENOCAULON bicolor Hook.	NW, CaR, SN, nw CW	073dfb8900
ADENOPHYLLUM cooperi (A. Gray) Strother	DMoj	6000000000
ADENOPHYLLUM porophylloides (A. Gray) Strother	s DMoj, DSon	e000000000
ADENOSTOMA fasciculatum Hook. & Arn.	s NCoR, SN, CW, SW	19f8fbdd01
ADENOSTOMA sparsifolium Torrey	s CCo, s SCoRO, TR, PR	0140025401
ADIANTUM aleuticum (Rupr.) C.A. Paris	NW, CaR, n&c SNH, SnFrB, SCoRO, n ChI, TR	0e3dc21c01
ADIANTUM capillus-veneris L.	NCoR, CaRF, n SNF, s SNH, CCo, SCoRO, SW (exc SCo), SNE, D	fb780e5503
ADIANTUM jordanii C. Mueller	CA-FP (exc uncommon or absent > 1200 m in CaR, SNH)	1ffd3bfe01
ADOLPHIA californica S. Watson	SCo, PR	00c0004000
ADONIS aestivalis L.	MP	0002000004
AEGILOPS cylindrica Host	CaR, ScV, SW, MP	1ec2005605
AEGILOPS ovata L.	NCoR (Mendocino Co.), expected elsewhere	0038000000
AEGILOPS triuncialis L.	s NCoR, CaRF, n&c SNF, ScV, n CW	03381b0a00
AEONIUM arboreum (L.) Webb. & Berth. var. arboreum	SCo	0080000000
AEONIUM haworthii Salm-Dyck	c&s SCo	0080000000
AESCHYNOMENE rudis Benth.	ScV (ne Colusa Co.), expected more widely	0000000200
AESCULUS californica (Spach) Nutt.	c&s NW, n&c CW, s CaR, SNF, Teh, sw DMoj, scattered in GV near foothills	673d3baa00
AGASTACHE parvifolia Eastw.	CaRH, Wrn	0400000004
AGASTACHE urticifolia (Benth.) Kuntze	NCoR, CaR, n&c SNF, SNH, SCoRO, SnBr, Wrn, n SNE	0638de0504
AGAVE deserti Engelm.	s DMtns, DSon	c000000000
AGAVE shawii Engelm.	s SCo (San Diego Co.)	0080000000
AGAVE utahensis Engelm.	n&e DMtns	4000000000
AGERATINA adenophora (Sprengel) R. King & H. Robinson	CCo, SnFrB, SCoRO, SCo	0180020800
AGERATINA herbacea (A. Gray) R. King & H. Robinson	e DMtns (Clark, New York, Providence mtns)	4000000000
AGERATINA occidentalis (Hook.) R. King & H. Robinson	NW, CaRH, SN, Wrn, n SNE, W&I	043dfc8104
AGERATINA shastensis (D. Taylor & Stebb.) R. King & H. Robinson	CaR	0600000000
AGOSERIS apargioides (Less.) E. Greene	NCo, NCoRO, CCo, SnFrB, SCoRO, n ChI	0924020800
AGOSERIS apargioides (Less.) E. Greene var. apargioides	NCo, CCo, SnFrB (less common in NCoRO, SCoRO, n ChI)	0924020800
AGOSERIS apargioides (Less.) E. Greene var. eastwoodiae (Fedde) Munz	NCo, CCo	0104000000
AGOSERIS aurantiaca (Hook.) E. Greene	KR, NCoRH, CaRH, SNH, GB (exc W&I)	040bc40104
AGOSERIS elata (Nutt.) E. Greene	SNH	0000c00100
AGOSERIS glauca (Pursh) Raf.	KR, CaRH, SNH, GB	0403c40106
AGOSERIS glauca (Pursh) Raf. var. glauca	MP, W&I	0002000006
AGOSERIS glauca (Pursh) Raf. var. laciniata (D. Eaton) F.J. Smiley	CaRH, SNH, GB	0402c40106
AGOSERIS glauca (Pursh) Raf. var. monticola (E. Greene) Q. Jones	KR, CaRH, SNH, GB	0403c40106
AGOSERIS grandiflora (Nutt.) E. Greene	CA-FP (exc SnJV)	1ffdfbdf01
AGOSERIS heterophylla (Nutt.) E. Greene	CA (exc SNE, D)	1ffffbff05
AGOSERIS retrorsa (Benth.) E. Greene	CA-FP (exc coast, GV), MP	1e7bfbdd05
AGRIMONIA gryposepala Wallr.	NW, CaRH, n SN, SnBr, PR	047d484400
AGROPYRON desertorum (Fischer) Schultes	CaRF, n SNH, GB	0202440006
AGROSTEMMA githago L.	NCoRI, n SN, ScV, SCo	0090480200
AGROSTIS avenacea Gmelin	s NCo, s NCoR, SNF, GV, CW, n SCo	01bc3b2a00
AGROSTIS blasdalei A. Hitchc.	s NCo, n CCo, n SnFrB	0104000800
AGROSTIS capillaris L.	KR, CaR, n&c SN, CCo, SnFrB, SCo	0781d80800
AGROSTIS densiflora Vasey	NCo, CCo, w SnFrB	0104000800
AGROSTIS elliottiana Schultes	NCoRI, CaRF, n SNF, n ScV	0210080200
AGROSTIS exarata Trin.	CA-FP, W&I	1ffdfbff03
AGROSTIS gigantea Roth	CA-FP	1ffdfbff01
AGROSTIS hallii Vasey	w NW, CCo, SnFrB, n SCo, WTR	01bd000801
AGROSTIS hendersonii A. Hitchc.	CaRF, n SNF, ScV, n SnJV	0200082200
AGROSTIS hooveri Swallen	s CCo, s SCoRO (San Luis Obispo, Santa Barbara cos.)	0100020000
AGROSTIS humilis Vasey	c&s SNH	0000800100
AGROSTIS idahoensis Nash	NW, CaR, SN, n SnFrB, SnBr, SnJt, W&I	063df8cd02
AGROSTIS microphylla Steudel	NCo, s NCoR, CCo, SCo	01bc000000
AGROSTIS oregonensis Vasey	KR, NCoR, CaR, SN, SnBr?, SnJt?	0639f8c500
AGROSTIS pallens Trin.	CA-FP, GB	1fffffff07
AGROSTIS scabra Willd.	KR, NCoR, SN, TR, SnJt, SNE	0039fcd503
AGROSTIS semiverticillata (Forsskal) C. Chr.	CA	ffffffff07
AGROSTIS stolonifera L.	NW, CaR, n SN, CW, SW (exc ChI), W&I, DMtns	47fd4b5c03
AGROSTIS tandilensis (Kuntze) L. Parodi	Deltaic GV (Solano Co.), s SCo (San Diego Co.), expected elsewhere	0080002200
AGROSTIS thurberiana A. Hitchc.	KR, NCoRH, CaRH, SNH	0409c00100
AGROSTIS variabilis Rydb.	KR, NCoRH, CaRH, SN, Wrn	0409f88104
AILANTHUS altissima (Miller) Swingle	CA-FP	1ffdfbff01
AIRA caryophyllea L.	NW, w CaR, SNF, GV, CW, e SW	1ffd3b7e01
AIRA elegantissima Schur	c&s NCoRO, ScV, SnFrB	0020000a00
AIRA praecox L.	NCo, s NCoRO	0024000000
ALBIZIA lophantha (Willd.) Benth.	CCo, SnFrB, SCoRO, SCo	0180020800
ALCEA rosea L.	SnFrB, CCo	0100000800
ALHAGI pseudalhagi (M. Bieb.) Desv.	GV, s SNE, D	e000042202
ALISMA gramineum Lej.	MP	0002000004
ALISMA lanceolatum With.	NW, n SNF, ScV	003d080200
ALISMA plantago-aquatica L.	CA-FP	1ffdfbff01
ALLENROLFEA occidentalis (S. Watson) Kuntze	SnJV, e SnFrB, SCoRI, n WTR, e PR, s SNE, D	e040052803
ALLIONIA incarnata L.	D	e000000000
ALLIUM abramsii (Traub) D. McNeal	c&s SNH	0000800100
ALLIUM acuminatum Hook.	NW, CaR, ne SnFrB (Mount Diablo), MP	063f000804
ALLIUM amplectens Torrey	CA-FP (exc SNH)	1ffdfbff01
ALLIUM anceps S. Watson	MP	0002000004
ALLIUM atrorubens S. Watson	GB	0002040006
ALLIUM atrorubens S. Watson var. atrorubens	GB	0002040006
ALLIUM atrorubens S. Watson var. cristatum (S. Watson) D. McNeal	SNE	0000040002
ALLIUM bisceptrum S. Watson var. bisceptrum	GB	0002040006
ALLIUM bolanderi S. Watson	NW, se SnFrB (Mount Hamilton)	003d000800
ALLIUM bolanderi S. Watson var. bolanderi	NW, se SnFrB (Mount Hamilton)	003d000800
ALLIUM bolanderi S. Watson var. mirabile (L. Henderson) D. McNeal	KR, n NCoR	0039000000
ALLIUM burlewii Davidson	s SNH, Teh, SCoRI, SW	18c001d501
ALLIUM campanulatum S. Watson	CA-FP (exc SCoR)	1ffdf8ff01
ALLIUM cratericola Eastw.	KR, NCoR, n&c SNF, s SNH, Teh, WTR, SnJt	003918c101
ALLIUM crispum E. Greene	CW	0100030800
ALLIUM denticulatum (Traub) D. McNeal	s SN, Teh, w DMoj	6000208100
ALLIUM diabloense (Traub) D. McNeal	SCoR, WTR	0000030001
ALLIUM dichlamydeum E. Greene	NCo, n CCo	0104000000
ALLIUM falcifolium Hook. & Arn.	NW, SnFrB	003d000800
ALLIUM fimbriatum S. Watson	s NCoR, s SNF, Teh, CW, SW, SNE, w DMoj	79f827dc03
ALLIUM fimbriatum S. Watson var. fimbriatum	s NCoR, s SNF, Teh, CW, SW	19f823dc01
ALLIUM fimbriatum S. Watson var. mohavense Jepson	SNE, w DMoj	6000040002
ALLIUM fimbriatum S. Watson var. purdyi (Eastw.) D. McNeal	c NCoRI (w Colusa, e Lake cos.)	0010000000
ALLIUM haematochiton S. Watson	SCoRO, SCo, WTR, PR	00c0024001
ALLIUM hickmanii Eastw.	c CCo (Monterey Peninsula: Arroyo de la Cruz, San Luis Obispo Co.)	0100000000
ALLIUM hoffmanii Traub	s KR, n NCoRH	0009000000
ALLIUM howellii Eastw.	s SNF, Teh, SnJV, SnFrB, SCoR, WTR, SnBr?	000023ac01
ALLIUM howellii Eastw. var. clokeyi Traub	n WTR (Mount Pinos region)	0000000001
ALLIUM howellii Eastw. var. howellii	s SNF, Teh, SnJV, SnFrB, SCoR, WTR, SnBr?	000023ac01
ALLIUM howellii Eastw. var. sanbenitense (Traub) F. Ownbey & Aase	SCoRI (se San Benito, w Fresno cos.)	0000010000
ALLIUM hyalinum Curran	SNF, SnJV	0000382000
ALLIUM jepsonii (Traub) S. Denison & D. McNeal	n&c SNF (Butte, Tuolumne cos.)	0000180000
ALLIUM lacunosum S. Watson	s SNF, Teh, SnFrB, SCoR, SCo, n ChI, WTR, SnBr, SNE, DMoj	6880278c03
ALLIUM lacunosum S. Watson var. davisiae (M.E. Jones) D. McNeal & F. Ownbey	WTR, SnBr, SNE, DMoj	6000040403
ALLIUM lacunosum S. Watson var. kernensis D. McNeal & F. Ownbey	s SNF, Teh, w DMoj	6000208000
ALLIUM lacunosum S. Watson var. lacunosum	SnFrB, SCoR, SCo, n ChI	0880030800
ALLIUM lacunosum S. Watson var. micranthum Eastw.	SCoRI	0000010000
ALLIUM lemmonii S. Watson	n&c SNH, MP	0002c00004
ALLIUM membranaceum Traub	KR, CaRF, n&c SNF	0201180000
ALLIUM monticola Davidson	TR, nw PR (Orange Co.)	0040001401
ALLIUM munzii (Traub) D. McNeal	e SCo, nw PR (w Riverside Co)	00c0000000
ALLIUM neapolitanum Cirillo	NCo, NCoR, ScV, CCo, SnFrB, SCo	01bc000a00
ALLIUM nevadense S. Watson	DMtns	4000000000
ALLIUM obtusum Lemmon	CaRH, n&c SNF, SNH	0400d80100
ALLIUM obtusum Lemmon var. conspicuum W. Mortola & D. McNeal	n&c SNF, n&c SNH	0000d80000
ALLIUM obtusum Lemmon var. obtusum	CaRH, n&c SNF, SNH	0400d80100
ALLIUM paniculatum L. var. paniculatum	s NW, n CW	013d030800
ALLIUM parishii S. Watson	DMoj	6000000000
ALLIUM parryi S. Watson	s SNH, SnBr, PR	0040004500
ALLIUM parvum Kellogg	KR, CaRH, n&c SNH, MP, n SNE	0403c40004
ALLIUM peninsulare Lemmon	SNF, Teh, ScV, CCo, SnFrB, SCoR, SW	19c03bde01
ALLIUM peninsulare Lemmon var. franciscanum D. McNeal & F. Ownbey	CCo, SnFrB	0100000800
ALLIUM peninsulare Lemmon var. peninsulare	SNF, Teh, ScV, CCo, SnFrB, SCoR, SW	19c03bde01
ALLIUM platycaule S. Watson	n SNH, MP	0002400004
ALLIUM praecox Brandegee	SW (exc SnGb, SnBr)	18c0004001
ALLIUM punctum L. Henderson	MP	0002000004
ALLIUM sanbornii A.W. Wood	CaRF, n&c SNF	0200180000
ALLIUM sanbornii A.W. Wood var. congdonii Jepson	n & c SNF	0000100000
ALLIUM sanbornii A.W. Wood var. sanbornii	CaRF, n&c SNF	0200180000
ALLIUM serra D. McNeal & F. Ownbey	NCoR, SnFrB, SCoRI	0038010800
ALLIUM sharsmithae (Traub) D. McNeal	se SnFrB (Mount Hamilton Range)	0000000800
ALLIUM shevockii D. McNeal	s SNH (Spanish Needle Peak, ne Kern Co.)	0000000100
ALLIUM siskiyouense Traub	KR, NCoR	0039000000
ALLIUM tolmiei Baker & S. Watson var. tolmiei	MP	0002000004
ALLIUM tribracteatum Torrey	c SNH (Tuolumne Co)	0000800000
ALLIUM triquetrum L.	NCo, CCo	0104000000
ALLIUM tuolumnense (Traub) S. Denison & D. McNeal	c SNF (Rawhide Hill, Redhills, Tuolumne Co.)	0000100000
ALLIUM unifolium Kellogg	w NW, w CW	013d030800
ALLIUM validum S. Watson	NW, CaRH, SNH, Wrn	043dc00104
ALLIUM vineale L.	s NW, n SNF, ScV, n CW	013d0b0a00
ALLIUM yosemitense Eastw.	c SN (Tuolumne, Mariposa cos.)	0000900000
ALLOPHYLLUM divaricatum (Nutt.) A.D. Grant & V. Grant	KR, NCoRI, s CaR, SNF, SnFrB, SCoR, TR	06113b1c01
ALLOPHYLLUM gilioides (Benth.) A.D. Grant & V. Grant	NCoR, CaR, SN, SnFrB, SCoR, TR, PR, n SNE, DMtns	4678ffdd01
ALLOPHYLLUM gilioides (Benth.) A.D. Grant & V. Grant ssp. gilioides	NCoR, CaR, SN, SnFrB, SCoR, TR, PR	0678fbdd01
ALLOPHYLLUM gilioides (Benth.) A.D. Grant & V. Grant ssp. violaceum (A.A. Heller) A.G. Day	NCoR, SN, SnFrB, SCoR, TR, PR, n SNE, DMtns	4078ffdd01
ALLOPHYLLUM glutinosum (Benth.) A.D. Grant & V. Grant	SCoRO, s ChI (Santa Catalina Island), TR, PR	1040025401
ALLOPHYLLUM integrifolium (Brand) A.D. Grant & V. Grant	CaR, SNH, TR	0600c01501
ALLOTROPA virgata A. Gray	NW, CaRH, SNH	043dc00100
ALNUS incana (L.) Moench ssp. tenuifolia (Nutt.) Breitung	KR, NCoRH, CaRH, SNH	0409c00100
ALNUS rhombifolia Nutt.	CA-FP, MP (uncommon), w DSon	9ffffbff05
ALNUS rubra Bong.	NCo, NCoRO, CCo, SnFrB	0124000800
ALNUS viridis (Chaix) DC. ssp. sinuata (Regel) A. L<#f6>ve & D. L<#f6>ve	KR, NCoRO, NCoRH	0029000000
ALO<#cb> saponaria (Aiton) Haw. X- A. striata Haw.	s SCo (La Jolla, San Diego Co.)
ALOE saponaria (Aiton) Haw. X- A. striata Haw.		0080000000
ALOPECURUS aequalis Sobol.	CA-FP, GB	1fffffff07
ALOPECURUS carolinianus Walter	NW, GV, SW	18fd007601
ALOPECURUS geniculatus L.	NW, CaR, SN, CW, MP	073ffb8904
ALOPECURUS myosuroides Hudson	SnJV, SCo	0080002000
ALOPECURUS pratensis L.	NW, CaR, SN, CW	073dfb8900
ALOPECURUS saccatus Vasey	NW, c SN, CW, GV, SW	19fd937e01
ALOYSIA wrightii Abrams	s&e DMtns	4000000000
ALTERNANTHERA caracasana Kunth	SCo	0080000000
ALTERNANTHERA philoxeroides (C. Martius) Griseb.	SnJV, SCo	0080002000
ALYSSUM alyssoides (L.) L.	e KR, n SNH, expected elsewhere	0001400000
ALYSSUM desertorum Stapf	MP	0002000004
ALYSSUM minus (L.) Roth ssp. micranthum (C. Meyer) Dudley	MP	0002000004
ALYSSUM strigosum Banks & Sol.	SnFrB	0000000800
AMARANTHUS albus L.	CA	ffffffff07
AMARANTHUS arenicola I.M. Johnston	ScV, CCo, SCo	0180000200
AMARANTHUS blitoides S. Watson	CA-FP, W&I, D	fffdfbff03
AMARANTHUS californicus (Moq.) S. Watson	CA	ffffffff07
AMARANTHUS caudatus L.	GV, SnFrB (expected elsewhere)	0000002a00
AMARANTHUS cruentus L.	GV, SnFrB	0000002a00
AMARANTHUS deflexus L.	CW, SW	19c0035c01
AMARANTHUS fimbriatus (Torrey) Benth.	D	e000000000
AMARANTHUS hybridus L.	GV, CW, SW	19c0037e01
AMARANTHUS palmeri S. Watson	SnJV, CW, D	e100032800
AMARANTHUS powellii S. Watson	SNF, GV, CW, SW, W&I	19c03b7e03
AMARANTHUS retroflexus L.	GV, CW, SW	19c0037e01
AMARANTHUS spinosus L.	SCo, w DMoj	6080000000
AMARANTHUS torreyi (A. Gray) Benth.	DMoj	6000000000
AMARANTHUS watsonii Standley	s DSon (Imperial Co.)	8000000000
AMBLYOPAPPUS pusillus Hook. & Arn.	s CCo, SCo, ChI	1980000000
AMBROSIA acanthicarpa Hook.	NCoR, SN, SW, GB, D	f8fafcd507
AMBROSIA ambrosioides (Cav.) Payne	s SCo (near San Diego)	0080000000
AMBROSIA artemisiifolia L.	NW, e ScV, SCo, SNE	00bd040202
AMBROSIA chamissonis (Less.) E. Greene	NCo, CCo, SCo, ChI	1984000000
AMBROSIA chenopodiifolia (Benth.) Payne	s SCo (sw San Diego Co.)	0080000000
AMBROSIA confertiflora DC.	SNF, SnJV, SnFrB, SCo	0080382800
AMBROSIA dumosa (A. Gray) Payne	W&I, D	e000000002
AMBROSIA eriocentra (A. Gray) Payne	e DMoj, DMtns	6000000000
AMBROSIA ilicifolia (A. Gray) Payne	SnGb, SnBr, s D	e000001400
AMBROSIA psilostachya DC.	CA-FP	1ffdfbff01
AMBROSIA pumila (Nutt.) A. Gray	s SCo (Riverside & San Diego cos.)	0080000000
AMBROSIA trifida L.	n SnJV, n CW, SW, MP	19c2037c05
AMELANCHIER alnifolia (Nutt.) Nutt.	NCo, KR, n NCoRO, n&c SNH (e slope)	0025c00000
AMELANCHIER alnifolia (Nutt.) Nutt. var. pumila (Nutt.) Nelson	n&c SNH (e slope)	0000c00000
AMELANCHIER alnifolia (Nutt.) Nutt. var. semiintegrifolia (Hook.) C. Hitchc.	NCo, KR, n NCoRO	0025000000
AMELANCHIER utahensis Koehne	NW, CaR, SN, CW, SW, SNE, DMtns	5ffdffdd03
AMMANNIA coccinea Rottb.	CaRF, c&s SNF, GV, SnFrB, SW, DSon	9ac0307e01
AMMANNIA robusta Heer & Regel	NCoR, s SNF, GV, CW, SCo, s ChI (Santa Catalina Island), DSon	91b8232a00
AMMI majus L.	NCo	0004000000
AMMI visnaga L.	CCo, SCo	0180000000
AMMOPHILA arenaria (L.) Link	NCo, CCo, SCo	0184000000
AMMOSELINUM giganteum J. Coulter & Rose	DSon (Hayfield Lake, Riverside Co., 1922)	8000000000
AMORPHA californica Nutt.	s NCoR, CaRF, n SNF, n SnFrB, SCoR, TR, n&e PR	02780b5c01
AMORPHA californica Nutt. var. californica	s NCoR, CaRF, n SNF, n SnFrB, SCoR, TR, n&e PR	02780b5c01
AMORPHA californica Nutt. var. napensis Jepson	s NCoR (Napa, Sonoma cos.), n SnFrB (Marin Co.)	0038000800
AMORPHA fruticosa L.	c&s SCo, SnBr, PR	00c0004400
AMPELODESMOS mauritanica (Poiret) Durand & Schinz	NCoRO (Napa Co.)	0020000000
AMPHIPAPPUS fremontii Torrey & A. Gray	c&e DMoj	6000000000
AMPHIPAPPUS fremontii Torrey & A. Gray var. fremontii	ne DMoj	6000000000
AMPHIPAPPUS fremontii Torrey & A. Gray var. spinosus (Nelson) C.L. Porter	e-c DMoj	6000000000
AMSINCKIA douglasiana A. DC.	SCoR, WTR	0000030001
AMSINCKIA eastwoodiae J.F. Macbr.	NCoRI, SNF, Teh, GV, SCoR, SW	18d03bf601
AMSINCKIA grandiflora A. Gray	c-w GV (near Corral Hollow, San Joaquin Co.; presumed extinct near Antioch, Contra Costa Co.)	0000002200
AMSINCKIA lunaris J.F. Macbr.	NCoRI, w-c GV, SnFrB	0010002a00
AMSINCKIA lycopsoides Lehm.	CA-FP	1ffdfbff01
AMSINCKIA menziesii (Lehm.) Nelson & J.F. Macbr.	CA	ffffffff07
AMSINCKIA menziesii (Lehm.) Nelson & J.F. Macbr. var. intermedia (Fischer & C. Meyer) Ganders	CA	ffffffff07
AMSINCKIA menziesii (Lehm.) Nelson & J.F. Macbr. var. menziesii	CA	ffffffff07
AMSINCKIA spectabilis Fischer & C. Meyer	NCo, CCo, SCo, ChI	1984000000
AMSINCKIA spectabilis Fischer & C. Meyer var. microcarpa (E. Greene) Jepson & Hoover	s CCo (< 20 km inland from coast, San Luis Obispo, Santa Barbara cos.)	0100000000
AMSINCKIA spectabilis Fischer & C. Meyer var. spectabilis	NCo, CCo, SCo, ChI	1984000000
AMSINCKIA tessellata A. Gray	NCoRI (Colusa Co.), GV, SnFrB, SCoR, WTR, GB, D	e012072a07
AMSINCKIA tessellata A. Gray var. gloriosa (Suksd.) Hoover	NCoRI, ScV (Colusa Co.), SnFrB, SCoR, WTR, DMoj	6010030a01
AMSINCKIA tessellata A. Gray var. tessellata	SnJV, SnFrB, SCoR, GB, D	e002072806
AMSINCKIA vernicosa Hook. & Arn.	s SNF, w SnJV, SnFrB, SCoR, DMoj	6000232800
AMSINCKIA vernicosa Hook. & Arn. var. furcata (Suksd.) Hoover	w SnJV, SCoRI (San Benito Co. to Kern Co.)	0000012000
AMSINCKIA vernicosa Hook. & Arn. var. vernicosa	s SNF, w SnJV, SnFrB, SCoR, DMoj	6000232800
AMSONIA tomentosa Torrey & Fr<#e9>mont	SnBr (n slope), s DMtns, DSon	c000000400
ANAGALLIS arvensis L.	CA-FP	1ffdfbff01
ANAPHALIS margaritacea (L.) Benth. & Hook.	NW, CaRH, SNH, CW, SnBr, MP	053fc30d04
ANCHUSA arvensis (L.) M. Bieb.	n SNF, c SCo, SnGb	0080081000
ANCHUSA azurea Miller	CCo, SnFrB	0100000800
ANCHUSA officinalis L.	KR, CaRH	0401000000
ANCISTROCARPHUS filagineus A. Gray	CA-FP (exc coast), MP, sw DMoj	7e7bfbff05
ANDROPOGON glomeratus (Walter) Britton, Sterns, & Pogg. var. scabriglumis C.S. Campbell	TR, DMoj, naturalized in NCo, NCoRO, n SNF, SNH, ScV, SCo	60a4c81701
ANDROPOGON virginicus L. var. virginicus	NCoRO, CaRF, n&c SNF, ScV	0220180200
ANDROSACE elongata L. ssp. acuta (E. Greene) G. Robb.	SnJV, SnFrB, SCoRI, SCo	0080012800
ANDROSACE filiformis Retz.	CaRH (s slope Willow Creek Mtn, n Siskiyou Co.)	0400000000
ANDROSACE occidentalis Pursh var. simplex (Rydb.) St. John	n SNH (Emigrant Gap, Placer Co.)	0000400000
ANDROSACE septentrionalis L. ssp. subumbellata G. Robb.	c&s SNH, SnBr, SNE	0000840502
ANDROSTEPHIUM breviflorum S. Watson	e D?	e000000000
ANELSONIA eurycarpa (A. Gray) J.F. Macbr. & Payson	SN, SNE	0000fc8102
ANEMONE deltoidea Hook.	n NCo, KR, NCoRH	000d000000
ANEMONE drummondii S. Watson	KR, CaR, SN	0601f88100
ANEMONE multifida Poiret	KR (Marble Mtns, Siskiyou Co.), n SNH (The Dardanelles, Alpine Co.)	0001400000
ANEMONE occidentalis S. Watson	KR, CaR, SN	0601f88100
ANEMONE oregana A. Gray	NW, CaR, n SN	063d480000
ANEMONE tuberosa Rydb.	e DMtns	4000000000
ANEMOPSIS californica (Nutt.) Hook. & Arn.	sw ScV, SnJV, SnFrB, SCoR, SCo, n&s ChI, PR, W&I, DMoj	60c0036a02
ANETHUM graveolens L.	SW	18c0005401
ANGELICA arguta Nutt.	KR	0001000000
ANGELICA breweri A. Gray	CaRH, n&c SNH	0400c00000
ANGELICA californica Jepson	NCoR, n SNF	0038080000
ANGELICA callii Mathias & Constance	s SNH (Tulare, Kern cos.)	0000000100
ANGELICA genuflexa Nutt.	KR, NCoRO	0021000000
ANGELICA hendersonii J. Coulter & Rose	NCo, CCo	0104000000
ANGELICA kingii (S. Watson) J. Coulter & Rose	W&I (White Mtns)	0000000002
ANGELICA lineariloba A. Gray	c&s SNH, SNE	0000840102
ANGELICA lucida L.	NCo, KR	0005000000
ANGELICA tomentosa S. Watson	NCoRO, SCoRO, SnFrB	0020020800
ANISOCOMA acaulis Torrey & A. Gray	s SN, Teh, SnJV, SCoRO, TR, PR, SNE, D	e04026f503
ANODA cristata (L.) Schldl.	GV, SNF	0000382200
ANREDERA cordifolia (Ten.) Steenis	CCo, SCo	0180000000
ANTENNARIA argentea Benth.	KR, NCoRH, CaRH, MP	040b000004
ANTENNARIA corymbosa E. Nelson	SNH	0000c00100
ANTENNARIA dimorpha (Nutt.) Torrey & A. Gray	KR, NCoRH, SNH, TR, MP	000bc01505
ANTENNARIA flagellaris (A. Gray) A. Gray	MP	0002000004
ANTENNARIA geyeri A. Gray	KR, NCoRH, n SNH, MP	000b400004
ANTENNARIA howellii E. Greene ssp. howellii	KR	0001000000
ANTENNARIA luzuloides Torrey & A. Gray	n SNH, MP	0002400004
ANTENNARIA marginata E. Greene	SnBr (s Fork Santa Ana River)	0000000400
ANTENNARIA media E. Greene	KR, NCoRH, CaRH, SNH, SnBr, W&I	0409c00502
ANTENNARIA pulchella E. Greene	SNH	0000c00100
ANTENNARIA racemosa Hook.	KR	0001000000
ANTENNARIA rosea E. Greene	KR, CaRH, SNH, SnGb, SnBr, SnJt, GB	0403c45506
ANTENNARIA rosea E. Greene ssp. confinis (E. Greene) R. Bayer	KR, CaRH, SNH, SnGb, SnBr, SnJt, GB	0403c45506
ANTENNARIA rosea E. Greene ssp. rosea	KR, CaRH, SNH, SnGb, SnBr, SnJt, GB	0403c45506
ANTENNARIA suffrutescens E. Greene	KR, NCoRH	0009000000
ANTENNARIA umbrinella Rydb.	n SNH (Plumas Co.), W&I	0000400002
ANTHEMIS arvensis L.	KR, NCoRO, c SNH, expected more widely	0021800000
ANTHEMIS cotula L.	NW, c SN, GV, CW, SCo, TR, PR	01fd937e01
ANTHEMIS tinctoria L.	NCoRI, CaRF, n SNH	0210400000
ANTHOXANTHUM aristatum Boiss.	NCo, NCoR, n CaRF, CCo, SnFrB	033c000800
ANTHOXANTHUM odoratum L.	NCo, NCoRO, NCoRI, CCo, SnFrB, n&c SN	0134d80800
ANTHRISCUS caucalis M. Bieb.	w CA-FP	1ffdfbff01
ANTIRRHINUM cornutum Benth.	NCoRI, w CaR, n ScV	0610000200
ANTIRRHINUM coulterianum Benth.	s SCoRO, SW (exc ChI), nw edge DSon	80c0025401
ANTIRRHINUM cyathiferum Benth.	w DSon (Deep Canyon, Riverside Co.)	8000000000
ANTIRRHINUM filipes A. Gray	D	e000000000
ANTIRRHINUM kelloggii E. Greene	s NCoRO, CW, SW	19e0035c01
ANTIRRHINUM kingii S. Watson	SNE, DMtns (esp ne San Bernardino Co.)	4000040002
ANTIRRHINUM leptaleum A. Gray	SN (esp SNF)	0000f88100
ANTIRRHINUM majus L.	CA-FP	1ffdfbff01
ANTIRRHINUM multiflorum Pennell	c SNF (Calaveras Co.), s SnFrB, SCoR, n ChI, TR	0800131c01
ANTIRRHINUM nuttallianum Benth.	s CCo, SCo, ChI, SnBr, PR	19c0004400
ANTIRRHINUM nuttallianum Benth. ssp. nuttallianum	s SCo, SnBr, PR	00c0004400
ANTIRRHINUM nuttallianum Benth. ssp. subsessile (A. Gray) D. Thompson	s CCo, SCo, ChI	1980000000
ANTIRRHINUM orontium L.	CA-FP	1ffdfbff01
ANTIRRHINUM ovatum Eastw.	s SnJV (esp w Kern, e San Luis Obispo cos.), s SCoRI	0000012000
ANTIRRHINUM subcordatum A. Gray	n&c NCoRI	0010000000
ANTIRRHINUM vexillo-calyculatum Kellogg	KR, NCoR, c CaRH, n&c SN, ScV (Sutter Buttes), SnFrB, n SCoRI	0439d90a00
ANTIRRHINUM vexillo-calyculatum Kellogg ssp. breweri (A. Gray) D. Thompson	KR, n NCoRO, NCoRH, c CaRH	0429000000
ANTIRRHINUM vexillo-calyculatum Kellogg ssp. intermedium D. Thompson	n&c SN	0000d80000
ANTIRRHINUM vexillo-calyculatum Kellogg ssp. vexillo-calyculatum	s NCoR, ScV (Sutter Buttes), SnFrB, n SCoRI	0038010a00
ANTIRRHINUM virga A. Gray	s NCoRH, s NCoRI	0018000000
ANULOCAULIS annulatus (Cov.) Standley	ne DMoj (Death Valley region)	6000000000
APERA interrupta (L.) P. Beauv.	MP (w of Alturas, Modoc, Co.), DMtns (Furnace Creek, e Inyo Co.)	4002000004
APERA spica-venti (L.) P. Beauv.	n SnJV (near La Grange, e Stanislaus Co.), s SCoRO (Cuyama Valley, Santa Barbara Co.)	0000022000
APHANES occidentalis (Nutt.) Rydb.	NW, SNF, ScV, CW, SW	19fd3b5e01
APHANISMA blitoides Moq.	s CCo, SCo, ChI	1980000000
APIASTRUM angustifolium Nutt.	CA-FP	1ffdfbff01
APIUM graveolens L.	CA	ffffffff07
APIUM nodiflorum (L.) Lagasca	e SnFrB (reported from Niles Canyon, Alameda Co., 1933)	0000000800
APOCYNUM androsaemifolium L.	KR, NCoRH, NCoRI, CaRH, SNH, SnFrB, SCoRI, SnBr, SnJt, MP, W&I	041bc14d06
APOCYNUM cannabinum L.	KR, NCoR, CaRH, SNH, Teh, SnJV, SnFrB, SCoR, TR, PR, GB	047bc7fd07
APONOGETON distachyon L.f.	c-w SnFrB, s SCo, expected elsewhere	0080000800
APTENIA cordifolia (L.f.) N.E. Br.	CCo, SCo, s ChI	1180000000
AQUILEGIA eximia Planchon	NCoR, SnFrB, SCoR, w WTR	0038030801
AQUILEGIA formosa Fischer	CA-FP (exc GV, SCo, ChI), GB, DMtns	477fffdd07
AQUILEGIA pubescens Cov.	SNH	0000c00100
ARABIDOPSIS thaliana (L.) Heynh.	NCo, NCoRI, SnFrB, expected elsewhere	0014000800
ARABIS X-divaricarpa Nelson	CaR, SN, GB	0602fc8106
ARABIS aculeolata E. Greene	KR (n Del Norte Co.)	0001000000
ARABIS blepharophylla Hook. & Arn.	NCoRO, SnFrB	0020000800
ARABIS bodiensis Rollins	SNE (n Mono Co.)	0000040002
ARABIS breweri S. Watson	KR, NCoRI, CaR, n SNF, ScV, SnFrB, SCoRI, SnBr	0611090e00
ARABIS breweri S. Watson var. austiniae (E. Greene) Rollins	CaRF, n SNF, ScV	0200080200
ARABIS breweri S. Watson var. breweri	KR, NCoRI, CaR, SnFrB, SCoRI	0611010800
ARABIS breweri S. Watson var. pecuniaria Rollins	SnBr (Dollar Lake)	0000000400
ARABIS cobrensis M.E. Jones	n SNE (Mono Co.), n DMtns (Panamint Mtns)	4000040000
ARABIS constancei Rollins	n SN (Plumas Co.)	0000480000
ARABIS davidsonii E. Greene	SN	0000f88100
ARABIS dispar M.E. Jones	s SNH, n SnBr, SNE, DMtns	4000040502
ARABIS drummondii A. Gray	SN, GB	0002fc8106
ARABIS fernaldiana Rollins var. stylosa (S. Watson) Rollins	GB	0002040006
ARABIS glabra (L.) Benth.	CA-FP	1ffdfbff01
ARABIS glabra (L.) Benth. var. furcatipilis M. Hopk.	s SnFrB (Santa Cruz Co.), SCoRO (Santa Lucia Mtns)	0000020800
ARABIS glabra (L.) Benth. var. glabra	CA-FP	1ffdfbff01
ARABIS glaucovalvula M.E. Jones	e SNE, DMoj	6000040002
ARABIS hirsuta (L.) Scop.	KR, NCoRO, CaR, SN, SnBr, W&I	0621f88502
ARABIS hirsuta (L.) Scop. var. glabrata Torrey & A. Gray	KR, NCoRO, CaR, SN, SnBr, W&I	0621f88502
ARABIS hirsuta (L.) Scop. var. pycnocarpa (M. Hopk.) Rollins	CaR, SN, SnBr, W&I	0600f88502
ARABIS hoffmannii (Munz) Rollins	n ChI (Santa Cruz Island)	0800000000
ARABIS holboellii Hornem.	NW, CaR, SN, SnFrB, GB	063ffc8906
ARABIS holboellii Hornem. var. pendulocarpa (Nelson) Rollins	c SNH, GB	0002840006
ARABIS holboellii Hornem. var. pinetorum (Tidestrom) Rollins	CaR, SN	0600f88100
ARABIS holboellii Hornem. var. retrofracta (Graham) Rydb.	NW, CaR, SN, SnFrB, GB	063ffc8906
ARABIS inyoensis Rollins	SNH, SNE, DMtns	4000c40102
ARABIS johnstonii Munz	SnJt	0000004000
ARABIS koehleri Howell var. stipitata Rollins	nw KR (n Del Norte Co.)	0001000000
ARABIS lemmonii S. Watson	CaR, SNH, W&I	0600c00102
ARABIS lemmonii S. Watson var. depauperata (Nelson & Kenn.) Rollins	SNH, W&I	0000c00102
ARABIS lemmonii S. Watson var. lemmonii	CaR, SNH, W&I	0600c00102
ARABIS lyallii S. Watson	CaRH, SNH, Wrn, W&I	0400c00106
ARABIS lyallii S. Watson var. lyallii	CaRH, SNH, Wrn	0400c00104
ARABIS lyallii S. Watson var. nubigena (J.F. Macbr. & Payson) Rollins	SNH, W&I	0000c00102
ARABIS macdonaldiana Eastw.	NCoRO	0020000000
ARABIS microphylla Nutt. var. microphylla	n SNH, GB	0002440006
ARABIS modesta Rollins	KR, NCoR	0039000000
ARABIS oregana Rollins	KR, NCoRO	0021000000
ARABIS parishii S. Watson	SnBr	0000000400
ARABIS perennans S. Watson	SnGb, SnBr, e PR, SNE, DMtns	4040041402
ARABIS pinzlae Rollins	W&I (White Mtns)	0000000002
ARABIS platysperma A. Gray	NCoRO, CaR, SNH, GB	0622c40106
ARABIS platysperma A. Gray var. howellii (S. Watson) Jepson	NCoRO, CaR, SNH, GB	0622c40106
ARABIS platysperma A. Gray var. platysperma	s SNH, W&I	0000000102
ARABIS puberula Torrey & A. Gray	GB	0002040006
ARABIS pulchra M.E. Jones	SN, GB, D	e002fc8106
ARABIS pulchra M.E. Jones var. gracilis M.E. Jones	SN, W&I, D	e000f88102
ARABIS pulchra M.E. Jones var. munciensis M.E. Jones	GB, DMoj	6002040006
ARABIS pulchra M.E. Jones var. pulchra	GB, DMoj	6002040006
ARABIS pygmaea Rollins	s SNH (Tulare Co.)	0000000100
ARABIS rectissima E. Greene var. rectissima	SN, SnBr, MP	0002f88504
ARABIS repanda S. Watson	SNH, e WTR, SnGb, SnBr, SnJt	0000c05501
ARABIS repanda S. Watson var. greenei Jepson	c SNH	0000800000
ARABIS repanda S. Watson var. repanda	SNH, e WTR, SnGb, SnBr, SnJt	0000c05501
ARABIS rigidissima Rollins var. rigidissima	KR	0001000000
ARABIS rollei Rollins	n KR (n Siskiyou Co.)	0001000000
ARABIS shockleyi Munz	SnBr, DMoj	6000000400
ARABIS sparsiflora Torrey & A. Gray	CaR, SNF, SW, GB, n DMtns	5ec23c5407
ARABIS sparsiflora Torrey & A. Gray var. arcuata (Nutt.) Rollins	CaR, SNF, SW	1ec0385401
ARABIS sparsiflora Torrey & A. Gray var. californica Rollins	SCo, SnGb, PR	00c0005000
ARABIS sparsiflora Torrey & A. Gray var. sparsiflora	GB, n DMtns	4002040006
ARABIS sparsiflora Torrey & A. Gray var. subvillosa (S. Watson) Rollins	CaR, n SNF	0600080000
ARABIS subpinnatifida S. Watson	KR, NCoR, Wrn	0039000004
ARABIS suffrutescens S. Watson	e KR, n NCoRH, CaR, SN	0609f88100
ARABIS suffrutescens S. Watson var. horizontalis (E. Greene) Rollins	n NCoRH (Grouse Mtn), n CaR	0608000000
ARABIS suffrutescens S. Watson var. suffrutescens	e KR, CaR, SN	0601f88100
ARABIS tiehmii Rollins	n SNH	0000400000
ARALIA californica S. Watson	CA-FP	1ffdfbff01
ARAUJIA sericifera Brot.	CA-FP	1ffdfbff01
ARBUTUS menziesii Pursh	NW, CaRH, n&c SNH, CW, n ChI (Santa Cruz Island), WTR, SnGb, PR	0d7dc35801
ARCEUTHOBIUM abietinum (Engelm.) Hawksw. & Wiens	KR, NCoR, CaRH, SNH, TR, PR	0479c05501
ARCEUTHOBIUM americanum Engelm.	CaRH, SNH	0400c00100
ARCEUTHOBIUM californicum Hawksw. & Wiens	KR, NCoR, CaR, SN, TR, PR	0679f8d501
ARCEUTHOBIUM campylopodum Engelm.	KR, NCoR, CaR, SN, TR, PR, MP	067bf8d505
ARCEUTHOBIUM cyanocarpum J. Coulter & Nelson	KR, NCoR, c&s SNH, SnBr	0039800500
ARCEUTHOBIUM divaricatum Engelm.	c&s SNH, TR, PR, SNE, DMtns	4040845503
ARCEUTHOBIUM douglasii Engelm.	KR, CaRH	0401000000
ARCEUTHOBIUM littorum Hawksw. & D. Nickrent	NCo, CCo	0104000000
ARCEUTHOBIUM monticola Hawksw., Wiens, & D. Nickrent	KR	0001000000
ARCEUTHOBIUM occidentale Engelm.	NW, CaR, SN, CW, WTR	073dfb8901
ARCEUTHOBIUM siskiyouense Hawksw., Wiens, & D. Nickrent	KR	0001000000
ARCEUTHOBIUM tsugense (C. Rosend.) G. Jones	NW, CaRH	043d000000
ARCEUTHOBIUM tsugense (C. Rosend.) G. Jones ssp. mertensianae Hawksw. & D. Nickrent	KR, NCoR, CaRH	0439000000
ARCEUTHOBIUM tsugense (C. Rosend.) G. Jones ssp. tsugense	NCo	0004000000
ARCTIUM lappa L.	CA-FP	1ffdfbff01
ARCTIUM minus (Hill) Bernh.	NW	003d000000
ARCTOMECON merriamii Cov.	ne DMoj	6000000000
ARCTOSTAPHYLOS andersonii A. Gray	w SnFrB (Santa Cruz Mtns)	0000000800
ARCTOSTAPHYLOS auriculata Eastw.	e SnFrB (Mount Diablo)	0000000800
ARCTOSTAPHYLOS bakeri Eastw.	s NCoRO (Sonoma Co.)	0020000000
ARCTOSTAPHYLOS bakeri Eastw. ssp. bakeri	s NCoRO (between Camp Meeker and Occidental, Sonoma Co.)	0020000000
ARCTOSTAPHYLOS bakeri Eastw. ssp. sublaevis P. Wells	s NCoRO (between The Cedars and Healdsburg, Sonoma Co.)	0020000000
ARCTOSTAPHYLOS canescens Eastw.	w KR, NCoR, w SnFrB	0039000800
ARCTOSTAPHYLOS canescens Eastw. ssp. canescens	NCoR, w SnFrB (Mount Tamalpais, Loma Prieta)	0038000800
ARCTOSTAPHYLOS canescens Eastw. ssp. sonomensis (Eastw.) P. Wells	w KR, NCoRO	0021000000
ARCTOSTAPHYLOS catalinae P. Wells	s ChI (Santa Catalina Island)	1000000000
ARCTOSTAPHYLOS columbiana Piper	NCo, w KR, NCoRO	0025000000
ARCTOSTAPHYLOS confertiflora Eastw.	n ChI (Santa Rosa Island)	0800000000
ARCTOSTAPHYLOS cruzensis Roof	c CCo (s Monterey, nw San Luis Obispo cos.)	0100000000
ARCTOSTAPHYLOS densiflora Baker	s NCoRO (Vine Hill, near Forestville, Sonoma Co.)	0020000000
ARCTOSTAPHYLOS edmundsii J. Howell	c CCo (nw Monterey Co.)	0100000000
ARCTOSTAPHYLOS gabrielensis P. Wells	SnGb (Mill Creek Summit)	0000001000
ARCTOSTAPHYLOS glandulosa Eastw.	KR, NCoR, SnFrB, SCoRO, SW (exc ChI)	00f9025c01
ARCTOSTAPHYLOS glandulosa Eastw. ssp. adamsii (Munz) Munz	e PR	0040000000
ARCTOSTAPHYLOS glandulosa Eastw. ssp. crassifolia (Jepson) P. Wells	s SCo (San Diego Co.)	0080000000
ARCTOSTAPHYLOS glandulosa Eastw. ssp. glandulosa	KR, NCoR, SnFrB	0039000800
ARCTOSTAPHYLOS glandulosa Eastw. ssp. glaucomollis P. Wells	SnGb, w SnBr	0000001400
ARCTOSTAPHYLOS glandulosa Eastw. ssp. mollis (J. Adams) P. Wells	WTR (Santa Ynez, Santa Monica mtns)	0000000001
ARCTOSTAPHYLOS glandulosa Eastw. ssp. zacaensis (Eastw.) P. Wells	SCoRO (Santa Lucia, San Rafael Mtns), w PR	0040020000
ARCTOSTAPHYLOS glauca Lindley	ne SnFrB (Mount Diablo), SCoRI, TR, PR, sw DMtns (Little San Bernardino Mtns)	4040015c01
ARCTOSTAPHYLOS glutinosa B. Schreiber	sw SnFrB (The Chalks, nw Santa Cruz Co.)	0000000800
ARCTOSTAPHYLOS hispidula Howell	KR, NCoRO	0021000000
ARCTOSTAPHYLOS hookeri G. Don	n&c CCo, w SnFrB	0100000800
ARCTOSTAPHYLOS hookeri G. Don ssp. franciscana (Eastw.) Munz	n CCo (San Francisco Peninsula)	0100000000
ARCTOSTAPHYLOS hookeri G. Don ssp. hearstiorum (Hoover & Roof) P. Wells	c CCo (Arroyo de la Cruz, nw San Luis Obispo Co.)	0100000000
ARCTOSTAPHYLOS hookeri G. Don ssp. hookeri	n&c CCo, w SnFrB (Santa Cruz Mtns s to Carmel)	0100000800
ARCTOSTAPHYLOS hookeri G. Don ssp. montana (Eastw.) P. Wells	n CCo, nw SnFrB (Mount Tamalpais, Marin Co.)	0100000800
ARCTOSTAPHYLOS hookeri G. Don ssp. ravenii P. Wells	n CCo (San Francisco Presidio)	0100000000
ARCTOSTAPHYLOS hooveri P. Wells	SCoRO (Santa Lucia Mtns)	0000020000
ARCTOSTAPHYLOS imbricata Eastw.	w SnFrB (San Bruno Mtn)	0000000800
ARCTOSTAPHYLOS insularis E. Greene	n ChI (Santa Cruz Island)	0800000000
ARCTOSTAPHYLOS klamathensis S. Edwards, T. Keeler-Wolf & W. Knight	e KR (Scott Mtn Divide, Slate Mtn)	0001000000
ARCTOSTAPHYLOS luciana P. Wells	SCoRO (se of Cuesta Pass, Santa Lucia Mtns, near San Luis Obispo)	0000020000
ARCTOSTAPHYLOS malloryi (W. Knight & R. Gankin) P. Wells	n&c NCoRI (Colusa, Shasta, Trinity cos.)	0010000000
ARCTOSTAPHYLOS manzanita C. Parry	s NCoRO, NCoRI, s CaRF, n&c SNF, SnFrB	0230180800
ARCTOSTAPHYLOS manzanita C. Parry ssp. elegans (Jepson) P. Wells	s NCoRO	0020000000
ARCTOSTAPHYLOS manzanita C. Parry ssp. glaucescens P. Wells	s NCoRO	0020000000
ARCTOSTAPHYLOS manzanita C. Parry ssp. laevigata (Eastw.) Munz	e SnFrB (Mount Diablo), s NCoRI (Vaca Mtns)	0010000800
ARCTOSTAPHYLOS manzanita C. Parry ssp. manzanita	NCoRI, s CaRF, n&c SNF	0210180000
ARCTOSTAPHYLOS manzanita C. Parry ssp. roofii (R. Gankin) P. Wells	NCoRI (nw Glenn Co.), s CaRF (n Butte Co.)	0210000000
ARCTOSTAPHYLOS manzanita C. Parry ssp. wieslanderi P. Wells	CaRF (Shasta, Tehama cos.)	0200000000
ARCTOSTAPHYLOS mendocinoensis P. Wells	c NCo (Mendocino Co.)	0004000000
ARCTOSTAPHYLOS mewukka Merriam	SN	0000f88100
ARCTOSTAPHYLOS mewukka Merriam ssp. mewukka	SN	0000f88100
ARCTOSTAPHYLOS mewukka Merriam ssp. truei (W. Knight) P. Wells	n SNF	0000080000
ARCTOSTAPHYLOS montaraensis Roof	w SnFrB (San Bruno, Montara mtns)	0000000800
ARCTOSTAPHYLOS montereyensis Hoover	c CCo (Fort Ord), n SCoRO (Toro Mtn, nw Monterey Co.)	0100020000
ARCTOSTAPHYLOS morroensis Wiesl. & B. Schreiber	s CCo (Morro Bay, San Luis Obispo Co.)	0100000000
ARCTOSTAPHYLOS myrtifolia C. Parry	c SNF (Amador, Calaveras cos.)	0000100000
ARCTOSTAPHYLOS nevadensis A. Gray	KR, NCoRH, CaRH, SNH	0409c00100
ARCTOSTAPHYLOS nissenana Merriam	n&c SNF (El Dorado Co. to Tuolumne Co.)	0000180000
ARCTOSTAPHYLOS nortensis (P. Wells) P. Wells	nw KR (n Del Norte Co.)	0001000000
ARCTOSTAPHYLOS nummularia A. Gray	NCo, NCoRO, w SnFrB (Mount Tamalpais, Santa Cruz Mtns)	0024000800
ARCTOSTAPHYLOS obispoensis Eastw.	s SCoRO (s Santa Lucia Mtns)	0000020000
ARCTOSTAPHYLOS osoensis P. Wells	s CCo (w Los Osos Valley, San Luis Obispo Co.)	0100000000
ARCTOSTAPHYLOS otayensis Wiesl. & B. Schreiber	sw PR (mtns near San Diego)	0040000000
ARCTOSTAPHYLOS pajaroensis J. Adams	n-c CCo, s SnFrB (Pajaro Hills)	0100000800
ARCTOSTAPHYLOS pallida Eastw.	e SnFrB (Sobrante, Huckleberry ridges, Berkeley-Oakland hills; Alameda and Contra Costa cos.)	0000000800
ARCTOSTAPHYLOS parryana Lemmon	n WTR, SnGb	0000001001
ARCTOSTAPHYLOS patula E. Greene	NCoRH, CaRH, SNH, SnGb, SnBr, SnJt	0408c05500
ARCTOSTAPHYLOS pechoensis Abrams	s CCo (Pecho Hills, sw of San Luis Obispo)	0100000000
ARCTOSTAPHYLOS pilosula Jepson & Wiesl.	s SCoRO (near Santa Margarita, San Luis Obispo Co.)	0000020000
ARCTOSTAPHYLOS pringlei C. Parry ssp. drupacea (C. Parry) P. Wells	SnBr, PR	0040004400
ARCTOSTAPHYLOS pumila Nutt.	c CCo (around Monterey Bay)	0100000000
ARCTOSTAPHYLOS pungens Kunth	SCoRI (Monterey, San Benito cos.), SnBr, PR, e DMtns (New York, Providence mtns)	4040014400
ARCTOSTAPHYLOS purissima P. Wells	s SCoRO (w Santa Barbara Co.)	0000020000
ARCTOSTAPHYLOS refugioensis R. Gankin	s SCoRO, w WTR (Santa Ynez Mtns)	0000020001
ARCTOSTAPHYLOS regismontana Eastw.	w SnFrB (n Santa Cruz Mtns)	0000000800
ARCTOSTAPHYLOS rudis Jepson & Wiesl.	s CCo (Nipomo, Burton mesas, Point Sal, sw San Luis Obispo, nw Santa Barbara cos.)	0100000000
ARCTOSTAPHYLOS silvicola Jepson & Wiesl.	sw SnFrB (s Santa Cruz Mtns)	0000000800
ARCTOSTAPHYLOS stanfordiana C. Parry	c&s NCoRO	0020000000
ARCTOSTAPHYLOS stanfordiana C. Parry ssp. decumbens (P. Wells) P. Wells	s NCoRO (Rincon Ridge, near Santa Rosa, Sonoma Co.)	0020000000
ARCTOSTAPHYLOS stanfordiana C. Parry ssp. raichei W. Knight	s NCoRO (s Mendocino, w Lake cos.)	0020000000
ARCTOSTAPHYLOS stanfordiana C. Parry ssp. stanfordiana	c&s NCoRO	0020000000
ARCTOSTAPHYLOS tomentosa (Pursh) Lindley	CCo, SnFrB, SCoRO, n ChI, WTR	0900020801
ARCTOSTAPHYLOS tomentosa (Pursh) Lindley ssp. bracteosa (DC.) J. Adams	c CCo (Jack's Peak, near Monterey)	0100000000
ARCTOSTAPHYLOS tomentosa (Pursh) Lindley ssp. crinita (McMinn) R. Gankin	sw SnFrB (Santa Cruz Mtns)	0000000800
ARCTOSTAPHYLOS tomentosa (Pursh) Lindley ssp. crustacea (Eastw.) P. Wells	CCo, SnFrB, SCoRO, WTR	0100020801
ARCTOSTAPHYLOS tomentosa (Pursh) Lindley ssp. daciticola P. Wells	s CCo (w Los Osos Valley, San Luis Obispo Co.)	0100000000
ARCTOSTAPHYLOS tomentosa (Pursh) Lindley ssp. eastwoodiana P. Wells	s CCo (nw Santa Barbara Co.)	0100000000
ARCTOSTAPHYLOS tomentosa (Pursh) Lindley ssp. insulicola P. Wells	n ChI (Santa Cruz, Santa Rosa islands)	0800000000
ARCTOSTAPHYLOS tomentosa (Pursh) Lindley ssp. rosei (Eastw.) P. Wells	n CCo (Lake Merced, San Francisco Co.), c CCo (Monterey Co.), nw SnFrB (Mount Tamalpais)	0100000800
ARCTOSTAPHYLOS tomentosa (Pursh) Lindley ssp. subcordata (Eastw.) P. Wells	n ChI (Santa Cruz, Santa Rosa islands)	0800000000
ARCTOSTAPHYLOS tomentosa (Pursh) Lindley ssp. tomentosa	c&s CCo (Monterey, San Luis Obispo cos.)	0100000000
ARCTOSTAPHYLOS uva-ursi (L.) Sprengel	NCo, c SNH (above Convict Lake, Mono Co.), CCo, SnFrB	0104800800
ARCTOSTAPHYLOS virgata Eastw.	n CCo, nw SnFrB (Marin Co.)	0100000800
ARCTOSTAPHYLOS viridissima (Eastw.) McMinn	n ChI (e Santa Cruz Island)	0800000000
ARCTOSTAPHYLOS viscida C. Parry	KR, NCoR, CaRF, SN	0239f88100
ARCTOSTAPHYLOS viscida C. Parry ssp. mariposa (Dudley) P. Wells	SN	0000f88100
ARCTOSTAPHYLOS viscida C. Parry ssp. pulchella (Howell) P. Wells	KR, NCoR	0039000000
ARCTOSTAPHYLOS viscida C. Parry ssp. viscida	KR, CaRF, SN	0201f88100
ARCTOSTAPHYLOS wellsii W. Knight	s CCo (hills se of San Luis Obispo)	0100000000
ARCTOTHECA calendula (L.) Levyns	NCo, SnFrB	0004000800
ARCTOTIS stoechadifolia P. Bergius	SCo	0080000000
ARENARIA aculeata S. Watson	n SNH, MP	0002400004
ARENARIA congesta Nutt.	KR, NCoRH, CaRH, SNH, GB, DMtns	440bc40106
ARENARIA congesta Nutt. var. charlestonensis Maguire	DMtns (New York Mtns)	4000000000
ARENARIA congesta Nutt. var. congesta	CaRH, n SNH, Wrn	0400400004
ARENARIA congesta Nutt. var. crassula Maguire	KR, NCoRH, MP	000b000004
ARENARIA congesta Nutt. var. simulans Maguire	n SNH, MP	0002400004
ARENARIA congesta Nutt. var. subcongesta (S. Watson) S. Watson	CaRH, n SNH, GB	0402440006
ARENARIA congesta Nutt. var. suffrutescens (A. Gray) Robinson	KR, SNH	0001c00100
ARENARIA kingii (S. Watson) M.E. Jones var. glabrescens (S. Watson) Maguire	CaRH, SNH, SNE	0400c40102
ARENARIA lanuginosa (Michaux) Rohrb. ssp. saxosa (A. Gray) Maguire	SnBr, PR	0040004400
ARENARIA macradenia S. Watson	c&s SNH, SnJV, SnGb, SnBr, SNE, DMoj	6000843502
ARENARIA macradenia S. Watson ssp. ferrisiae Abrams	c&s SNH, SNE	0000840102
ARENARIA macradenia S. Watson var. arcuifolia Maguire	s SN, SnGb	0000201100
ARENARIA macradenia S. Watson var. kuschei (Eastw.) Maguire	DMoj (Forest Camp, Inyo Co.)	6000000000
ARENARIA macradenia S. Watson var. macradenia	SnJV, SnBr, SnGb, SNE, DMoj	6000043402
ARENARIA paludicola Robinson	s CCo (Nipomo Mesa, San Luis Obispo Co.), SCo (Santa Ana River)	0180000000
ARENARIA serpyllifolia L. ssp. serpyllifolia	NW, c SNF, SCo	00bd100000
ARENARIA ursina Robinson	e SnBr (Bear Valley, s San Bernardino Co.)	0000000400
ARGEMONE corymbosa E. Greene	SNE, DMoj	6000040002
ARGEMONE munita Durand & Hilg.	NW (exc NCo), CW, SW, GB, D	f9fb075c07
ARGYRANTHEMUM foeniculaceum (Willd.) Schultz-Bip.	SnFrB, SCo	0080000800
ARGYROCHOSMA jonesii (Maxon) M.D. Windham	s SNH, SCoRO, SnGb, W&I, DMtns	4000021102
ARGYROCHOSMA limitanea (Maxon) M.D. Windham var. limitanea	e DMtns (New York Mtns, San Bernardino Co.)	4000000000
ARISTIDA adscensionis L.	CCo, SCo, s ChI, WTR, PR, D	f1c0004001
ARISTIDA californica Thurber var. californica	D	e000000000
ARISTIDA divaricata Willd.	s SnJV, SCo, s PR	00c0002000
ARISTIDA oligantha Michaux	NW, CaRF, SNF, GV, MP	023f382204
ARISTIDA purpurea Nutt.	SCo, SnBr, PR, SNE, D	e0c0044402
ARISTIDA purpurea Nutt. var. fendleriana (Steudel) Vasey	SnBr, PR, SNE, DMoj	6040044402
ARISTIDA purpurea Nutt. var. longiseta (Steudel) Vasey	SnBr, D	e000000400
ARISTIDA purpurea Nutt. var. nealleyi (Vasey) K.W. Allred	SCo, SnBr, PR, D	e0c0004400
ARISTIDA purpurea Nutt. var. parishii (A. Hitchc.) K.W. Allred	SCo, SnBr, D	e080000400
ARISTIDA purpurea Nutt. var. purpurea	SCo, SnBr, PR, DMtns	40c0004400
ARISTIDA purpurea Nutt. var. wrightii (Nash) K.W. Allred	PR, D	e040004000
ARISTIDA ternipes Cav. var. hamulosa (Henrard) J.S. Trent	GV, SCo, TR, PR, DMoj	60c0007601
ARISTOCAPSA insignis (Curran) Rev. & Hardham	SCoRI (Monterey, San Luis Obispo cos.)	0000010000
ARISTOLOCHIA californica Torrey	NCoR, CaRF, n&c SNF, ScV, SnFrB, n SCoRO	02381a0a00
ARMERIA maritima (Miller) Willd. ssp. californica (Boiss.) Pors.	NCo (common), CCo, SCo (uncommon)	0184000000
ARMORACIA rusticana P. Gaertner, Meyer, & Scherb.	CCo, GV, SnFrB, expected elsewhere	0100002a00
ARNICA amplexicaulis Nutt.	KR, CaRH, SNH, SNE	0401c40102
ARNICA cernua Howell	KR	0001000000
ARNICA chamissonis Less. ssp. foliosa (Nutt.) Maguire	KR, CaR, SN, SnBr, Wrn, n SNE, W&I	0601fc8504
ARNICA cordifolia Hook.	KR, NCoR, CaRH, n&c SNH, e SnFrB, MP	043bc00804
ARNICA discoidea Benth.	NW, CaR, n&c SN, CW, WTR, w PR	077ddb0801
ARNICA diversifolia E. Greene	KR, CaRH, SNH	0401c00100
ARNICA fulgens Pursh	n SNH (e slope), MP	0002400004
ARNICA latifolia Bong.	KR, c SNH	0001800000
ARNICA longifolia D. Eaton	KR, s NCoRH, CaRH, SNH, GB	040bc40106
ARNICA mollis Hook.	KR, s NCoRH, CaRH, SNH, MP, n SNE, W&I	040bc40104
ARNICA nevadensis A. Gray	KR, CaRH, n&c SNH	0401c00000
ARNICA parryi A. Gray	s NCoRH, n&c SNH, W&I	0008c00002
ARNICA sororia E. Greene	GB	0002040006
ARNICA spathulata E. Greene	KR	0001000000
ARNICA tomentella E. Greene	KR, CaRH, n SNH (Truckee River), s SNH (Middle Tule River)	0401400100
ARNICA venosa H.M. Hall	KR	0001000000
ARNICA viscosa A. Gray	KR, nw CaR	0601000000
ARRHENATHERUM elatius (L.) J.S. Presl & C. Presl	NW, CaR, n&c SNF, c SNH, CCo, SnFrB	073d980800
ARTEMISIA annua L.	GV	0000002200
ARTEMISIA arbuscula Nutt.	NCoRH, SNH, MP, W&I	000ac00106
ARTEMISIA arbuscula Nutt. ssp. arbuscula	NCoRH, SNH, MP, W&I	000ac00106
ARTEMISIA arbuscula Nutt. ssp. thermopola Beetle	NCoRH, n&c SNH	0008c00000
ARTEMISIA biennis Willd.	NCoRO, SnJV, CW, SCo, WTR, SnBr, GB, DMtns	41a2072c07
ARTEMISIA bigelovii A. Gray	W&I, DMtns	4000000002
ARTEMISIA californica Less.	CW, SW	19c0035c01
ARTEMISIA campestris L. ssp. borealis (Pallas) H.M. Hall & Clements	KR	0001000000
ARTEMISIA cana Pursh ssp. bolanderi (A. Gray) G. Ward	CaRH, s SNF, SNH, GB	0402e40106
ARTEMISIA douglasiana Besser	CA-FP, SNE	1ffdffff03
ARTEMISIA dracunculus L.	CA	ffffffff07
ARTEMISIA ludoviciana Nutt.	NCoRO, SN, SnJV, SW (exc ChI), GB, D	e0e2fcf507
ARTEMISIA ludoviciana Nutt. ssp. albula (Wooton) Keck	PR, D	e040004000
ARTEMISIA ludoviciana Nutt. ssp. candicans (Rydb.) Keck	n SNH, MP	0002400004
ARTEMISIA ludoviciana Nutt. ssp. incompta (Nutt.) Keck	SN, TR, PR, GB, DMtns	4042fcd507
ARTEMISIA ludoviciana Nutt. ssp. ludoviciana	NCoRO, SN, SnJV, SW (exc ChI), GB, DMoj	60e2fcf507
ARTEMISIA michauxiana Besser	W&I	0000000002
ARTEMISIA nesiotica Raven	s ChI	1000000000
ARTEMISIA norvegica Fries ssp. saxatilis (Besser) H.M. Hall & Clements	KR, SNH, SnJt, W&I	0001c04102
ARTEMISIA nova Nelson	CaRH, SnJt, GB, DMtns	4402044006
ARTEMISIA palmeri A. Gray	SCo, PR	00c0004000
ARTEMISIA pycnocephala (Less.) DC.	NCo, CCo	0104000000
ARTEMISIA rothrockii A. Gray	c&s SNH, SnGb, SnBr, n SNE, W&I	0000841500
ARTEMISIA spiciformis Osterh.	c&s SNH, W&I	0000800102
ARTEMISIA spinescens D. Eaton	SnBr, SNE, DMoj	6000040402
ARTEMISIA suksdorfii Piper	NCo, s ChI	1004000000
ARTEMISIA tridentata Nutt.	CaRH, SNH, SCoRI, s SnJV, SCo, TR, GB, DMoj	6482c53507
ARTEMISIA tridentata Nutt. ssp. parishii (A. Gray) H.M. Hall & Clements	SCoRI, SCo, WTR, W&I, DMoj	6080010003
ARTEMISIA tridentata Nutt. ssp. tridentata	CaRH, s SnJV, SCoRI, WTR, GB	0402052007
ARTEMISIA tridentata Nutt. ssp. vaseyana (Rydb.) Beetle	CaRH, SNH, TR, n SNE, W&I	0400c41501
ARTEMISIA tridentata Nutt. ssp. wyomingensis Beetle & A. Young	MP	0002000004
ARUM italicum Miller	NCo, NCoRO, ScV, SnFrB	0024000a00
ARUNCUS dioicus (Walter) Fern. var. pubescens (Rydb.) Fern.	NCo, KR, n NCoRO, CaR	0625000000
ARUNDO donax L.	c SNF, CCo, SCo, SnGb, D	e180101000
ASARUM caudatum Lindley	KR, NCoR, SnFrB	0039000800
ASARUM hartwegii S. Watson	KR, CaRH, SNH	0401c00100
ASARUM lemmonii S. Watson	SNH	0000c00100
ASARUM marmoratum Piper	KR (n Del Norte, Siskiyou cos.)	0001000000
ASCLEPIAS albicans S. Watson	D	e000000000
ASCLEPIAS asperula (Decne.) Woodson ssp. asperula	DMoj	6000000000
ASCLEPIAS californica E. Greene	c&s SNF, CW, SW, D	f9c0335c01
ASCLEPIAS cordifolia (Benth.) Jepson	NW, CaR, SN	063df88100
ASCLEPIAS cryptoceras S. Watson	SNE (Mono Co.)	0000040002
ASCLEPIAS curassavica L.	SW	18c0005401
ASCLEPIAS eriocarpa Benth.	CA	ffffffff07
ASCLEPIAS erosa Torrey	SW, W&I, D	f8c0005403
ASCLEPIAS fascicularis Decne.	CA (exc NCo, CCo, SCo)	fe7bffff07
ASCLEPIAS linaria Cav.	D	e000000000
ASCLEPIAS nyctaginifolia A. Gray	DMoj	6000000000
ASCLEPIAS solanoana Woodson	NCoR	0038000000
ASCLEPIAS speciosa Torrey	CA	ffffffff07
ASCLEPIAS subulata Decne.	D	e000000000
ASCLEPIAS vestita Hook. & Arn.	GV, CW, TR, DMoj	6100033e01
ASPARAGUS asparagoides (L.) Druce	CCo, n SCo	0180000000
ASPARAGUS officinalis L. ssp. officinalis	CA-FP, W&I	1ffdfbff03
ASPERUGO procumbens L.	MP	0002000004
ASPHODELUS fistulosus L.	s SnJV, SCo (expected elsewhere)	0080002000
ASPIDOTIS californica (Hook.) Copel.	NCoR, CaR, SN, GV (Sutter Buttes), CW, SW	1ff8fbff01
ASPIDOTIS carlotta-halliae (W. H. Wagner & E. Gilbert) Lellinger	CW	0100030800
ASPIDOTIS densa (Brackenr.) Lellinger	NW, CaR, SN, CW	073dfb8900
ASPLENIUM septentrionale (L.) Hoffm.	CaRH, s SNH	0400000100
ASPLENIUM trichomanes L. ssp. trichomanes	nw KR (Del Norte Co)	0001000000
ASPLENIUM trichomanes-ramosum L.	n SNH (Sierra Co., e side of Sierra Buttes)	0000400000
ASPLENIUM vespertinum Maxon	SCo, SnGb, PR	00c0005000
ASTER alpigenus (Torrey & A. Gray) A. Gray var. andersonii (A. Gray) M. Peck	KR, NCoR, CaR, SN, SnJt, Wrn, n SNE, W&I	0639fcc104
ASTER ascendens Lindley	SN (e slope), Teh, SnGb, SnBr, GB	0002fc9506
ASTER bernardinus H.M. Hall	SnGb, SnBr, PR	0040005400
ASTER breweri (A. Gray) Semple	KR, CaRH, SNH, SnBr	0401c00500
ASTER brickellioides E. Greene	KR, NCoRI	0011000000
ASTER campestris Nutt.	SNE	0000040002
ASTER chilensis Nees	w&c NW, w&c CW, n SCo, n ChI	09bd030800
ASTER eatonii (A. Gray) Howell	CaR, SN, GB	0602fc8106
ASTER engelmannii (Eaton) A. Gray	KR, NCoRH	0009000000
ASTER foliaceus Lindley	NW, CaR, SN, SnBr, SnJt, Wrn	063df8c504
ASTER foliaceus Lindley var. lyallii (A. Gray) Cronq.	KR, CaR, c SN (Tuolumne Co.)	0601900000
ASTER foliaceus Lindley var. parryi (Eaton) A. Gray	NW, CaR, SN, SnBr, SnJt, Wrn	063df8c504
ASTER frondosus (Nutt.) Torrey & A. Gray	CaR, SN, TR, PR, GB	0642fcd507
ASTER greatae Parish	SnGb (s slope)	0000001000
ASTER integrifolius Nutt.	CaR, SN	0600f88100
ASTER lanceolatus Willd. ssp. hesperius (A. Gray) Semple & J. Chmielewski	SCo, PR, SNE	00c0044002
ASTER ledophyllus A. Gray	KR, NCoR	0039000000
ASTER lentus E. Greene	s ScV, CCo, SnFrB	0100000a00
ASTER occidentalis (Nutt.) Torrey & A. Gray	NW, CaR, SN, TR, SnJt, GB	063ffcd507
ASTER occidentalis (Nutt.) Torrey & A. Gray var. occidentalis	NW, CaR, SN, TR, SnJt, GB	063ffcd507
ASTER occidentalis (Nutt.) Torrey & A. Gray var. yosemitanus (A. Gray) Cronq.	KR, CaR, SN	0601f88100
ASTER oregonensis (Nutt.) Cronq.	KR, NCoR (Humboldt Co.), CaR, SN	0639f88100
ASTER pauciflorus Nutt.	n DMoj (Inyo Co)	2000000000
ASTER peirsonii Sharsm.	c&s SNH	0000800100
ASTER radulinus A. Gray	NW, CaR, n&c SN, SCoR, n ChI, SnFrB	0e3ddb0800
ASTER scopulorum A. Gray	Wrn, n SNE, W&I	0000040004
ASTER subulatus Michaux var. ligulatus Shinn.	GV, CW, SW, DSon	99c0037e01
ASTRAGALUS accidens S. Watson var. hendersonii (S. Watson) M.E. Jones	KR, CaRF	0201000000
ASTRAGALUS acutirostris S. Watson	SNE, DMoj	6000040002
ASTRAGALUS agnicidus Barneby	NCoRO (s Humboldt Co.)	0020000000
ASTRAGALUS agrestis G. Don	MP	0002000004
ASTRAGALUS albens E. Greene	Cushenbury Canyon (ne SnBr, adjacent DMoj)	2000000400
ASTRAGALUS allochrous A. Gray var. playanus (M.E. Jones) Isely	e DMoj	6000000000
ASTRAGALUS andersonii A. Gray	n&e-c SNE, MP	0002040006
ASTRAGALUS anxius R. Meinke & T. Kaye	MP (Lassen Co.)	0002000004
ASTRAGALUS argophyllus Torrey & A. Gray var. argophyllus	MP (e Lassen Co.), SNE (nw Inyo Co.)	0002040006
ASTRAGALUS aridus A. Gray	DSon	8000000000
ASTRAGALUS asymmetricus E. Sheldon	SnJV, SnFrB, SCoRI	0000012800
ASTRAGALUS atratus S. Watson var. mensanus M.E. Jones	DMtns (n and w of Panamint Valley, Inyo Co.)	4000000000
ASTRAGALUS austiniae Brewer & S. Watson	n SNH (near Lake Tahoe)	0000400000
ASTRAGALUS bernardianus M.E. Jones	SnBr, DMtns (New York, Ivanpah mtns)	4000000400
ASTRAGALUS bicristatus A. Gray	SCo (w Riverside and San Bernardino cos.), SnGb, SnBr	0080001400
ASTRAGALUS bolanderi A. Gray	n&c SNH	0000c00000
ASTRAGALUS brauntonii Parish	c SCo, n PR (Los Angeles Basin)	00c0000000
ASTRAGALUS breweri A. Gray	c&s NCoR, n SnFrB	0038000800
ASTRAGALUS californicus (A. Gray) E. Greene	e KR, n CaRH	0401000000
ASTRAGALUS calycosus S. Watson var. calycosus	SNE, n DMtns	4000040002
ASTRAGALUS canadensis L. var. brevidens (Gand.) Barneby	MP, n SNE, adjacent CA-FP	1fffffff05
ASTRAGALUS casei A. Gray	SNE, DMtns (Inyo Co.)	4000040002
ASTRAGALUS cimae M.E. Jones	W&I (Inyo Mtns), e DMtns	4000000002
ASTRAGALUS cimae M.E. Jones var. cimae	e DMtns (e San Bernardino Co.)	4000000000
ASTRAGALUS cimae M.E. Jones var. sufflatus Barneby	W&I (e slope Inyo Mtns)	0000000002
ASTRAGALUS clarianus Jepson	s NCoR (Sonoma, Napa cos.)	0038000000
ASTRAGALUS clevelandii E. Greene	s NCoRI, e SCoRI	0010010000
ASTRAGALUS coccineus Brandegee	SNE, w edge D	a000040002
ASTRAGALUS congdonii S. Watson	c&s SNF	0000300000
ASTRAGALUS crotalariae (Benth.) A. Gray	DSon	8000000000
ASTRAGALUS curtipes A. Gray	s CCo, w SCoR, n ChI	0900030000
ASTRAGALUS curvicarpus (A.A. Heller) Macbr. var. curvicarpus	GB	0002040006
ASTRAGALUS deanei (Rydb.) Barneby	sw PR (sw San Diego Co.)	0040000000
ASTRAGALUS didymocarpus Hook. & Arn.	c&s SNF, Teh, GV, CW, SW, D	f9c033fe01
ASTRAGALUS didymocarpus Hook. & Arn. var. didymocarpus	c&s SNF, Teh, GV, CW, SW exc ChI, DMoj	01c033fe01
ASTRAGALUS didymocarpus Hook. & Arn. var. dispermus (A. Gray) Jepson	D	e000000000
ASTRAGALUS didymocarpus Hook. & Arn. var. milesianus (Rydb.) Jepson	s SCo	0080000000
ASTRAGALUS didymocarpus Hook. & Arn. var. obispoensis (Rydb.) Jepson	SW exc WTR	18c0005400
ASTRAGALUS douglasii (Torrey & A. Gray) A. Gray	c&s SN, Teh, GV, CW, SW	19c0b3ff01
ASTRAGALUS douglasii (Torrey & A. Gray) A. Gray var. douglasii	c&s SN, Teh, s ScV, SnJV, SCoR	0000b3a300
ASTRAGALUS douglasii (Torrey & A. Gray) A. Gray var. parishii (A. Gray) M.E. Jones	SCo, SnBr, PR	00c0004400
ASTRAGALUS douglasii (Torrey & A. Gray) A. Gray var. perstrictus (Rydb.) Munz	e PR	0040000000
ASTRAGALUS ertterae Barneby & J.R. Shevock	s SNH (Kern Co.)	0000000100
ASTRAGALUS filipes A. Gray	WTR, SnBr, SnJt, MP	0002004405
ASTRAGALUS funereus M.E. Jones	ne DMtns (Grapevine Mtns)	4000000000
ASTRAGALUS gambelianus E. Sheldon	CA-FP	1ffdfbff01
ASTRAGALUS geyeri A. Gray var. geyeri	e SNE	0000040002
ASTRAGALUS gibbsii Kellogg	n SNH, GB	0002440006
ASTRAGALUS gilmanii Tidestrom	n DMtns (Panamint Mtns)	4000000000
ASTRAGALUS hornii A. Gray var. hornii	s SnJV, WTR, w edge DMoj	2000002001
ASTRAGALUS insularis Kellogg var. harwoodii Munz	DSon	8000000000
ASTRAGALUS inversus M.E. Jones	e CaRH, MP	0402000004
ASTRAGALUS inyoensis Cov.	W&I	0000000002
ASTRAGALUS iodanthus S. Watson var. iodanthus	se MP, SNE	0002040006
ASTRAGALUS jaegerianus Munz	c DMoj (near Barstow)	6000000000
ASTRAGALUS johannis-howellii Barneby	SNE (sw Mono Co.)	0000040002
ASTRAGALUS kentrophyta A. Gray	SNH, SNE	0000c40102
ASTRAGALUS kentrophyta A. Gray var. danaus (Barneby) Barneby	c&s SNH, SNE	0000840102
ASTRAGALUS kentrophyta A. Gray var. elatus S. Watson	W&I	0000000002
ASTRAGALUS kentrophyta A. Gray var. tegetarius (S. Watson) Dorn	W&I	0000000002
ASTRAGALUS layneae E. Greene	W&I, DMoj	6000000002
ASTRAGALUS lemmonii A. Gray	GB (lower in MP), adjacent edge c SNH	0002840006
ASTRAGALUS lentiformis Brewer & S. Watson	n SNH (se Plumas Co.)	0000400000
ASTRAGALUS lentiginosus Hook.	CA	ffffffff07
ASTRAGALUS lentiginosus Hook. var. albifolius M.E. Jones	SNE, w DMoj (Los Angeles Co.)	6000040002
ASTRAGALUS lentiginosus Hook. var. antonius Barneby	SnGb	0000001000
ASTRAGALUS lentiginosus Hook. var. borreganus M.E. Jones	e DMoj, s DSon	e000000000
ASTRAGALUS lentiginosus Hook. var. coachellae F. Shreve & Wiggins	DSon (Coachella Valley)	8000000000
ASTRAGALUS lentiginosus Hook. var. floribundus A. Gray	n SNH s MP, SNE	0002440006
ASTRAGALUS lentiginosus Hook. var. fremontii (A. Gray) S. Watson	SNE, e DMoj	6000040002
ASTRAGALUS lentiginosus Hook. var. idriensis M.E. Jones	SnFrB, SCoRI, WTR	0000010801
ASTRAGALUS lentiginosus Hook. var. ineptus (A. Gray) M.E. Jones	SNH (barely in n SNH), SNE	0000c40102
ASTRAGALUS lentiginosus Hook. var. kernensis (Jepson) Barneby	s SNH	0000000100
ASTRAGALUS lentiginosus Hook. var. lentiginosus	MP	0002000004
ASTRAGALUS lentiginosus Hook. var. micans Barneby	n DMoj (Eureka Valley)	2000000000
ASTRAGALUS lentiginosus Hook. var. nigricalycis M.E. Jones	s SNF, SnJV, SCoRI	0000212000
ASTRAGALUS lentiginosus Hook. var. piscinensis Barneby	c SNE (Mono, Inyo cos., near Bishop)	0000040002
ASTRAGALUS lentiginosus Hook. var. platyphyllidius (Rydb.) M. Peck	MP	0002000004
ASTRAGALUS lentiginosus Hook. var. salinus (Howell) Barneby	MP	0002000004
ASTRAGALUS lentiginosus Hook. var. semotus Jepson	W&I	0000000002
ASTRAGALUS lentiginosus Hook. var. sesquimetralis (Rydb.) Barneby	n DMoj (n Death Valley, e slope Last Chance Mtns)	2000000000
ASTRAGALUS lentiginosus Hook. var. sierrae M.E. Jones	SnBr	0000000400
ASTRAGALUS lentiginosus Hook. var. variabilis Barneby	s SNF, Teh, s SnJV, s-most SNE, w&s DMoj	600024a002
ASTRAGALUS leucolobus M.E. Jones	SnGb, SnBr, SnJt	0000005400
ASTRAGALUS macrodon (Hook. & Arn.) A. Gray	c SCoR	0000030000
ASTRAGALUS magdalenae E. Greene var. peirsonii (Munz & J. McBurney) Barneby	DSon	8000000000
ASTRAGALUS malacus A. Gray	e MP, SNE	0002040006
ASTRAGALUS miguelensis E. Greene	n ChI, s ChI (San Clemente Island)	1800000000
ASTRAGALUS minthorniae (Rydb.) Jepson var. villosus Barneby	SnBr, W&I, DMtns	4000000402
ASTRAGALUS mohavensis S. Watson	DMoj	6000000000
ASTRAGALUS mohavensis S. Watson var. hemigyrus (Clokey) Barneby	DMtns (Darwin Mesa, w of Death Valley, Inyo Co., in 1941)	4000000000
ASTRAGALUS mohavensis S. Watson var. mohavensis	DMoj	6000000000
ASTRAGALUS monoensis Barneby	SNE (c Mono Co)	0000040002
ASTRAGALUS nevinii A. Gray	ChI (San Clemente Island)	1800000000
ASTRAGALUS newberryi A. Gray var. newberryi	SNE, ne DMoj	6000040002
ASTRAGALUS nutans M.E. Jones	se DMtns, DSon	c000000000
ASTRAGALUS nuttallianus A. DC.	D	e000000000
ASTRAGALUS nuttallianus A. DC. var. austrinus (Small) F. Shreve & Wiggins	Approaches DSon near AZ border, possibly a waif	8000000000
ASTRAGALUS nuttallianus A. DC. var. cedrosensis M.E. Jones	DSon	8000000000
ASTRAGALUS nuttallianus A. DC. var. imperfectus (Rydb.) Barneby	e DMoj	6000000000
ASTRAGALUS nuttallii (Torrey & A. Gray) J. Howell	c&s NCo, CCo	0104000000
ASTRAGALUS nuttallii (Torrey & A. Gray) J. Howell var. nuttallii	c&s CCo	0100000000
ASTRAGALUS nuttallii (Torrey & A. Gray) J. Howell var. virgatus (A. Gray) Barneby	c&s NCo, n CCo	0104000000
ASTRAGALUS obscurus S. Watson	se KR, CaR, MP	0603000004
ASTRAGALUS oocarpus A. Gray	PR (c San Diego Co.)	0040000000
ASTRAGALUS oophorous S. Watson	SNE, n DMtns	4000040002
ASTRAGALUS oophorous S. Watson var. lavinii Barneby	SNE (Bodie Hills, Mono Co.)	0000040002
ASTRAGALUS oophorous S. Watson var. oophorous	SNE, n DMtns	4000040002
ASTRAGALUS oxyphysus A. Gray	s SNF, SnJV, SCoRI	0000212000
ASTRAGALUS pachypus E. Greene	Teh, s SnJV, SCoRI, WTR, PR, w edge D	a04001e001
ASTRAGALUS pachypus E. Greene var. jaegeri Munz	n PR (incl SnJt), nw edge DSon	8040004000
ASTRAGALUS pachypus E. Greene var. pachypus	Teh, s SnJV, SCoRI, WTR, w edge D	a00001a001
ASTRAGALUS palmeri A. Gray	w edge DSon, adjacent foothills of SnBr, PR	8040004400
ASTRAGALUS panamintensis E. Sheldon	n DMtns (Inyo Co.)	4000000000
ASTRAGALUS pauperculus E. Greene	CaRF, n ScV	0200000200
ASTRAGALUS platytropis A. Gray	DMtns, SNE	4000040002
ASTRAGALUS pomonensis M.E. Jones	s SCoRO, SCo, PR	00c0024000
ASTRAGALUS preussii A. Gray	DMoj	6000000000
ASTRAGALUS preussii A. Gray var. laxiflorus A. Gray	sw DMoj (Antelope Valley)	6000000000
ASTRAGALUS preussii A. Gray var. preussii	e DMoj (se Inyo, ne San Bernardino cos.)	6000000000
ASTRAGALUS pseudiodanthus Barneby	SNE (e Mono Co.)	0000040002
ASTRAGALUS pulsiferae A. Gray	s CaRH, n SNH, MP	0402400004
ASTRAGALUS pulsiferae A. Gray var. pulsiferae	n SNH, e MP	0002400004
ASTRAGALUS pulsiferae A. Gray var. suksdorfii (Howell) Barneby	s CaRH	0400000000
ASTRAGALUS purshii Hook.	KR, NCoRH, CaRH, SNH, Teh, SCoRI, SnBr, GB, DMoj	640bc58506
ASTRAGALUS purshii Hook. var. lagopinus (Rydb.) Barneby	ne MP	0002000004
ASTRAGALUS purshii Hook. var. lectulus (S. Watson) M.E. Jones	SNH, SnBr, perhaps w edge SNE	0000c40500
ASTRAGALUS purshii Hook. var. purshii	MP	0002000004
ASTRAGALUS purshii Hook. var. tinctus M.E. Jones	KR, NCoRH, CaRH, n&s SNH, Teh, SCoRI, GB, w DMoj	640b458106
ASTRAGALUS pycnostachyus A. Gray	NCo, n CCo, c SCo	0184000000
ASTRAGALUS pycnostachyus A. Gray var. lanosissimus (Rydb.) Munz	c SCo	0080000000
ASTRAGALUS pycnostachyus A. Gray var. pycnostachyus	NCo, n CCo	0104000000
ASTRAGALUS rattanii A. Gray	c&s NCoR	0038000000
ASTRAGALUS rattanii A. Gray var. jepsonianus Barneby	s NCoRI	0010000000
ASTRAGALUS rattanii A. Gray var. rattanii	n&c NCoR	0038000000
ASTRAGALUS ravenii Barneby	s SNH (Sawmill Pass, Fresno and Inyo cos.)	0000000100
ASTRAGALUS sabulonum A. Gray	D	e000000000
ASTRAGALUS sepultipes (Barneby) Barneby	SNE, perhaps e edge c&s SNH	0000840102
ASTRAGALUS serenoi (Kuntze) E. Sheldon var. shockleyi (M.E. Jones) Barneby	W&I, n DMtns (Inyo Co.)	4000000002
ASTRAGALUS shevockii Barneby	s SNH (se Tulare Co.)	0000000100
ASTRAGALUS subvestitus (Jepson) Barneby	s SNH (Tulare, Kern cos.)	0000000100
ASTRAGALUS tener A. Gray	GV, CCo, SnFrB, SCo	0180002a00
ASTRAGALUS tener A. Gray var. ferrisiae A. Liston	n ScV	0000000200
ASTRAGALUS tener A. Gray var. tener	s ScV, n SnJV, e SnFrB (where mostly extirpated)	0000002a00
ASTRAGALUS tener A. Gray var. titi (Eastw.) Barneby	c CCo (Monterey Co.), SCo (where possibly extirpated)	0180000000
ASTRAGALUS tephrodes A. Gray var. brachylobus (Gray) Barneby	se DMoj (near Needles, San Bernardino Co.)	6000000000
ASTRAGALUS tidestromii (Rydb.) Clokey	DMoj (extreme e-c DMtns and mouth of Cushenbury Canyon near n edge SnBr)	6000000400
ASTRAGALUS traskiae Eastw.	s ChI (San Nicolas, Santa Barbara islands)	1000000000
ASTRAGALUS tricarinatus A. Gray	e SnBr (Whitewater, Morongo Valley), adjacent edges D	a000000400
ASTRAGALUS trichopodus (Nutt.) A. Gray	SCoRO, s SCoRI, SCo, ChI, WTR, w PR, w edge DMoj	38c0034001
ASTRAGALUS trichopodus (Nutt.) A. Gray var. lonchus (M.E. Jones) Barneby	SCo, n ChI, w PR	08c0000000
ASTRAGALUS trichopodus (Nutt.) A. Gray var. phoxus (M.E. Jones) Barneby	s SCoR, n SCo (Santa Barbara, Ventura cos.), WTR, w edge DMoj	2080030001
ASTRAGALUS trichopodus (Nutt.) A. Gray var. trichopodus	n half SCo	0080000000
ASTRAGALUS umbraticus E. Sheldon	w KR, n NCoRO (Humboldt Co.)	0021000000
ASTRAGALUS webberi Brewer & S. Watson	n SNH (Plumas, Sierra cos.)	0000400000
ASTRAGALUS whitneyi A. Gray	KR, NCoRH, s SNF, SNH, w WTR, MP, n SNE, W&I	000be40105
ASTRAGALUS whitneyi A. Gray var. confusus Barneby	n SNH, MP	0002400004
ASTRAGALUS whitneyi A. Gray var. lenophyllus (Rydb.) Barneby	n SNH	0000400000
ASTRAGALUS whitneyi A. Gray var. siskiyouensis (Rydb.) Barneby	KR, n NCoRH	0009000000
ASTRAGALUS whitneyi A. Gray var. whitneyi	s SNF, SNH, n WTR, n SNE, W&I	0000e40101
ASTROLEPIS cochisensis (Goodd.) D.M. Benham & M.D. Windham	DMtns	4000000000
ATHYRIUM alpestre (D.H. Hoppe) Clairv. var. americanum F.K. Butters	KR, CaRH, SNH, Wrn	0401c00104
ATHYRIUM filix-femina (L.) Roth var. cyclosorum Rupr.	CA (exc GV, PR, D)	1fbfff9d07
ATHYSANUS pusillus (Hook.) E. Greene	CA-FP (exc SN)	1ffdfbff01
ATRICHOSERIS platyphylla A. Gray	D	e000000000
ATRIPLEX argentea Nutt.	n SNH, GV, e SnFrB, e SCo, GB, D	e082442a06
ATRIPLEX argentea Nutt. var. argentea	GB	0002040006
ATRIPLEX argentea Nutt. var. hillmanii M.E. Jones	n SNH, e&s MP	0002400004
ATRIPLEX argentea Nutt. var. mohavensis M.E. Jones	GV, e SnFrB, e SCo, D	e080002a00
ATRIPLEX californica Moq.	s NCo, CCo, SCo, ChI	1984000000
ATRIPLEX canescens (Pursh) Nutt.	SNH (e slope), Teh, SCoRI, SCo, n TR, PR, GB, D	e0c2c5d507
ATRIPLEX canescens (Pursh) Nutt. ssp. canescens	SNH (e slope), Teh, SCoRI, SCo, n TR, PR, GB, D	e0c2c5d507
ATRIPLEX canescens (Pursh) Nutt. ssp. linearis (S. Watson) H.M. Hall & Clements	n WTR?, DSon	8000000001
ATRIPLEX confertifolia (Torrey & Fr<#e9>mont) S. Watson	SNH (e slope), GB, DMoj	6002c40106
ATRIPLEX cordulata Jepson	s ScV, SnJV	0000002200
ATRIPLEX coronata S. Watson	s ScV, SnJV, e SCoRI, e SCo	0080012200
ATRIPLEX coronata S. Watson var. coronata	s ScV, SnJV, e SCoRI	0000012200
ATRIPLEX coronata S. Watson var. notatior Jepson	e SCo (San Jacinto Valley, Riverside Co.)	0080000000
ATRIPLEX coulteri (Moq.) D. Dietr.	SCo, ChI	1880000000
ATRIPLEX depressa Jepson	s ScV, SnJV	0000002200
ATRIPLEX elegans (Moq.) D. Dietr.	s SNE, D	e000040002
ATRIPLEX elegans (Moq.) D. Dietr. var. elegans	e D	e000000000
ATRIPLEX elegans (Moq.) D. Dietr. var. fasciculata (S. Watson) M.E. Jones	s SNE, D	e000040002
ATRIPLEX fruticulosa Jepson	Teh, s ScV, SnJV, SnFrB, SCoRI, w DMoj	600001aa00
ATRIPLEX gardneri (Moq.) D. Dietr. var. falcata (M.E. Jones) Welsh	MP	0002000004
ATRIPLEX heterosperma Bunge	NCo, NCoRO, CaRF, GV (expected elsewhere)	0224002200
ATRIPLEX hortensis L.	NCo, SnFrB, SCo, MP (expected elsewhere)	0086000804
ATRIPLEX hymenelytra (Torrey) S. Watson	se PR, SNE, D	e040040002
ATRIPLEX joaquiniana Nelson	s ScV, SnJV, SCoRI (e slope)	0000012200
ATRIPLEX lentiformis (Torrey) S. Watson	s SN, deltaic GV, SnJV, SCoRI, SCo, n WTR, SNE, D	e080252303
ATRIPLEX lentiformis (Torrey) S. Watson ssp. lentiformis	s SN, deltaic GV, SnJV, SCoRI, SCo, n WTR, SNE, D	e080252303
ATRIPLEX lentiformis (Torrey) S. Watson ssp. torreyi (S. Watson) H.M. Hall & Clements	SNE, n DMoj	2000040002
ATRIPLEX leucophylla (Moq.) D. Dietr.	NCo, CCo, SnFrB, SCo, ChI	1984000800
ATRIPLEX lindleyi DC.	SnJV, s SCo (expected elsewhere)	0080002000
ATRIPLEX minuscula Standley	s SnJV	0000002000
ATRIPLEX muelleri Benth.	DSon (Imperial Co.)	8000000000
ATRIPLEX nummularia Lindley	SCo	0080000000
ATRIPLEX pacifica Nelson	SCo, ChI	1880000000
ATRIPLEX parishii S. Watson	SW (exc ChI), w DMoj	60c0005401
ATRIPLEX parryi S. Watson	s SNE, DMoj, n DSon	e000040002
ATRIPLEX patula L.	NCo, CaRF, CCo, SnFrB	0304000800
ATRIPLEX patula L. var. obtusa (Cham.) C. Hitchc.	NCo, CCo, SnFrB	0104000800
ATRIPLEX patula L. var. patula	NCo, CaRF, CCo, SnFrB	0304000800
ATRIPLEX phyllostegia (Torrey) S. Watson	SnJV, SNE, DMoj	6000042002
ATRIPLEX polycarpa (Torrey) S. Watson	SnJV and margins, n TR, e PR, s SNE, D	e040043403
ATRIPLEX pusilla (Torrey) S. Watson	MP, n SNE	0002040004
ATRIPLEX rosea L.	CA-FP, D (uncommon)	fffdfbff01
ATRIPLEX semibaccata R.Br.	+/- CA-FP (exc CaR, n&c SN), D	f9fd23ff01
ATRIPLEX serenana Nelson	s SN, SnJV, SCoRO, SW, SNE (naturalized), w DMoj, DSon	f8c0267503
ATRIPLEX serenana Nelson var. davidsonii (Standley) Munz	s SCo	0080000000
ATRIPLEX serenana Nelson var. serenana	s SN, SnJV, SCoRO, SW, SNE (naturalized), w DMoj, DSon	f8c0267503
ATRIPLEX spinifera J.F. Macbr.	s SnJV, SCoRI, n WTR, DMoj	6000012001
ATRIPLEX suberecta I. Verd.	SnJV, n SCo (Ventura Co.), DSon	8080002000
ATRIPLEX subspicata (Nutt.) Rydb.	s ScV, SnJV, CCo, SnFrB	0100002a00
ATRIPLEX triangularis Willd.	NCo, s NCoRO, GV, CCo, SCo, ChI	19a4002200
ATRIPLEX truncata (Torrey) A. Gray	SNH (e slope), TR (desert slopes), SNE, DMoj	6000c41503
ATRIPLEX tularensis Cov.	s SnJV (Kern Lake bed, sw Kern Co.)	0000002000
ATRIPLEX vallicola Hoover	SnJV	0000002000
ATRIPLEX watsonii Nelson	s CCo, SCo, ChI	1980000000
AUBRIETA deltoidea (L.) DC.	c NCoR (Lake, Mendocino cos.)	0038000000
AVENA barbata Link	CA-FP, MP, DMoj	7ffffbff05
AVENA fatua L.	CA-FP, MP, DMoj	7ffffbff05
AVENA sativa L.	CA-FP	1ffdfbff01
AVENA sterilis L.	SnFrB	0000000800
AVENA strigosa Schreber	s NCo (Pt. Reyes, Marin Co.)	0004000000
AVICENNIA marina (Forskal) Vierh. var. resinifera (Forster f.) Bakh.	SCo (Mission Bay, San Diego Co.)	0080000000
AXONOPUS affinis Chase	SCo, expected elsewhere	0080000000
AYENIA compacta Rose	e DMtns (Providence Mtns), w&c DSon (incl Eagle Mtns)	c000000000
AZOLLA filiculoides Lam.	+/- CA exc D	1fffffff07
AZOLLA mexicana C. Presl	ScV, possibly n SN	0000480200
BACCHARIS brachyphylla A. Gray	SnBr, SnJt, D	e000004400
BACCHARIS douglasii DC.	w NW, SNF, GV, CW, SCo	01bd3b2a00
BACCHARIS emoryi A. Gray	SCoRI, SCo, WTR, PR, D	e0c0014001
BACCHARIS pilularis DC.	NW, SNF, w CW, SCo, ChI, WTR, PR	19fd3b4801
BACCHARIS plummerae A. Gray	CCo, SCoRO, SCo, n ChI, WTR	0980020001
BACCHARIS plummerae A. Gray ssp. glabrata Hoover	c CCo (nw San Luis Obispo Co.)	0100000000
BACCHARIS plummerae A. Gray ssp. plummerae	CCo, SCoRO, SCo, n ChI, WTR	0980020001
BACCHARIS salicifolia (Ru<#ed>z Lopez & Pav<#f3>n) Pers.	NW, CaRF, SNF, GV, Teh, CW, SW, D	fbfd3bfe01
BACCHARIS sarothroides A. Gray	PR, D	e040004000
BACCHARIS sergiloides A. Gray	Teh, PR, D	e04000c000
BACCHARIS vanessae Beauch.	s SCo, nw PR (San Diego Co.)	00c0000000
BACOPA eisenii (Kellogg) Pennell	GV, s CW, SNE	0100072a02
BACOPA monnieri (L.) Wettst.	DSon (e Riverside Co.)	8000000000
BACOPA repens (Sw.) Wettst.	ScV (Butte Co)	0000000200
BACOPA rotundifolia (Michaux) Wettst.	GV	0000002200
BAHIA dissecta (A. Gray) Britton	SnBr, e PR (Santa Rosa Mtns)	0040000400
BAILEYA multiradiata A. Gray var. multiradiata	DMoj	6000000000
BAILEYA pauciradiata A. Gray	D	e000000000
BAILEYA pleniradiata A. Gray	SNE, D	e000040002
BALSAMORHIZA deltoidea Nutt.	NW, CW, WTR	013d030801
BALSAMORHIZA hirsuta Nutt.	MP	0002000004
BALSAMORHIZA hookeri Nutt. var. lanata W. Sharp	n CaR (Shasta Valley, Siskiyou Co.)	0600000000
BALSAMORHIZA macrolepis W. Sharp	e CaR, SNF, ScV, SnFrB, MP	0602380a04
BALSAMORHIZA macrolepis W. Sharp var. macrolepis	SNF, ScV, SnFrB	0000380a00
BALSAMORHIZA macrolepis W. Sharp var. platylepis (W. Sharp) Ferris	e CaR, MP	0602000004
BALSAMORHIZA sagittata (Pursh) Nutt.	SNH, GB	0002c40106
BALSAMORHIZA sericea W.A. Weber	e KR (Siskiyou, Trinity cos.)	0001000000
BALSAMORHIZA serrata Nelson & J.F. Macbr.	n MP	0002000004
BARBAREA orthoceras Ledeb.	CA-FP (exc SN, GV), n SNE, W&I	1ffdffff01
BARBAREA verna (Miller) Asch.	CCo (Monterey Co.), expected elsewhere	0100000000
BARBAREA vulgaris R.Br.	GB, expected elsewhere	0002040006
BASSIA hyssopifolia (Pallas) Kuntze	CA (exc NW, SNH)	ffc23ffe07
BATIS maritima L.	SCo	0080000000
BEBBIA juncea (Benth.) E. Greene var. aspera E. Greene	SW, SNE, D	f8c0045403
BECKMANNIA syzigachne (Steudel) Fern.	NW, CaR, n SN, n CCo, SnFrB, MP, n SNE	073f4c0804
BELLARDIA trixago (L.) All.	NCoRO, CCo, SnFrB	0120000800
BELLIS perennis L.	NW, CW, SW	19fd035c01
BENSONIELLA oregona (Abrams & Bacigal.) C. Morton	KR	0001000000
BERBERIS aquifolium Pursh	CA-FP, GB, DMoj	7fffffff07
BERBERIS aquifolium Pursh var. aquifolium	KR, NCoR, CaR, SN	0639f88100
BERBERIS aquifolium Pursh var. dictyota (Jepson) Jepson	SN, ScV (Sutter Buttes), SCoR, TR, PR	0040fbd701
BERBERIS aquifolium Pursh var. repens (Lindley) H. Scoggan	KR, NCoR, CaR, SN, PR, GB, DMoj	667bfcc106
BERBERIS fremontii Torrey	e&s DMoj, PR	6040004000
BERBERIS haematocarpa Wooton	e&s DMoj	6000000000
BERBERIS nervosa Pursh	NW, n SNH (Sierra Co.), SnFrB, n SCoR	003d430800
BERBERIS nevinii A. Gray	SW	18c0005401
BERBERIS pinnata Lagasca	NW, CW, n ChI, WTR, SnGb, PR	097d035801
BERBERIS pinnata Lagasca ssp. insularis Munz	n ChI	0800000000
BERBERIS pinnata Lagasca ssp. pinnata	NW, CW, WTR, SnGb, PR	017d035801
BERGEROCACTUS emoryi (Engelm.) Britton & Rose	SCo (San Diego Co.), s ChI	1080000000
BERGIA texana (Hook.) Seub.	GV, SCo	0080002200
BERNARDIA myricifolia (Scheele) S. Watson	s DMoj, DSon	e000000000
BERULA erecta (Hudson) Cov.	CA	ffffffff07
BETA vulgaris L.	CCo, SnFrB, SCo, ChI	1980000800
BETULA glandulosa Michaux	CaRH, Wrn	0400000004
BETULA occidentalis Hook.	KR, CaRH, SNH, GB, DMtns	4403c40106
BIDENS cernua L. var. cernua	KR, NCoR, CaR, n SN, SnFrB, MP	063b480804
BIDENS frondosa L.	NCoR, GV, SW, GB	18fa047607
BIDENS laevis (L.) Britton, Sterns & Pogg.	GV, SCoR, SW, SNE, DMoj (Mojave River)	78c0077603
BIDENS pilosa L. var. pilosa	SCoR, SW	18c0035401
BIDENS tripartita L.	c SN, SnJV	0000902000
BIDENS vulgata E. Greene	NCoR, ScV	0038000200
BLECHNUM spicant (L.) Smith	NCo, NCoRO, n SNH, SnFrB	0024400800
BLENNOSPERMA bakeri Heiser	NCoR, ne SnFrB (s Sonoma Co.)	0038000800
BLENNOSPERMA nanum (Hook.) S.F. Blake	NCoR, SNF, GV, CW, SCo, ChI	19b83b2a00
BLENNOSPERMA nanum (Hook.) S.F. Blake var. nanum	NCoR, SNF, GV, CW, SCo, ChI	19b83b2a00
BLENNOSPERMA nanum (Hook.) S.F. Blake var. robustum J. Howell	n CCo (Point Reyes peninsula, Marin Co.)	0100000000
BLEPHARIDACHNE kingii (S. Watson) Hackel	SNE (Inyo, Mono cos.)	0000040002
BLEPHARIPAPPUS scaber Hook.	KR, CaR, n SN, MP	0603480004
BLEPHARIZONIA plumosa (Kellogg) E. Greene	w SnJV, e SnFrB, SCoR	0000032800
BLEPHARIZONIA plumosa (Kellogg) E. Greene ssp. plumosa	nw SnJV (n of Alameda Co.), e SnFrB	0000002800
BLEPHARIZONIA plumosa (Kellogg) E. Greene ssp. viscida Keck	w SnJV (Alameda Co. s), e SnFrB, SCoR	0000032800
BLOOMERIA crocea (Torrey) Cov.	SCoR, TR, PR	0040035401
BLOOMERIA humilis Hoover	c&s CCo, adjacent c SCoR (Monterey, n San Luis Obispo cos.)	0100030000
BOEHMERIA nivea (L.) Gaudich.	GV, SW	18c0007601
BOERHAVIA coccinea Miller	s SnJV, SCo, DSon	8080002000
BOERHAVIA coulteri (Hook.) S. Watson	DMtns (Clark Mtns), DSon	c000000000
BOERHAVIA intermedia M.E. Jones	DMtns (Clark and Kingston mtns), e DSon	c000000000
BOERHAVIA triquetra S. Watson	e PR (n base Santa Rosa Mtns), DMtns (Little San Bernardino Mtns), DSon	c040000000
BOERHAVIA wrightii A. Gray	D	e000000000
BOLANDRA californica A. Gray	n&c SNH (Eldorado to Mariposa cos.)	0000c00000
BORAGO officinalis L.	NCo, n&c SNF, CCo, SnFrB, SCo	0184180800
BOSCHNIAKIA hookeri Walp.	NCoRO (1 site, Humboldt Co.), SnFrB (Mount Tamalpais, Marin Co.)	0020000800
BOSCHNIAKIA strobilacea A. Gray	CA-FP (exc s SW)	1ffdfbff01
BOTHRIOCHLOA barbinodis (Lagasca) Herter	SCo, s ChI, WTR, SnGb, PR	10c0005001
BOTHRIOCHLOA ischaemum (L.) Keng var. songarica (Fischer & C. Meyer) Celarier & Harlan	CaRF (Shasta Co.), expected more widely	0200000000
BOTHRIOCHLOA laguroides (DC.) Herter ssp. torreyana (Steudel) Allred & Gould	c SNF (Mariposa Co.), SnFrB (Alameda Co.), expected elsewhere	0000100800
BOTRYCHIUM ascendens W.H. Wagner	s CaRH (near Jonesville, Butte, Tehama cos.)	0400000000
BOTRYCHIUM crenulatum W.H. Wagner	NCoRH, CaR, SN, SnGb, SnBr	0608f89500
BOTRYCHIUM lunaria (L.) Sw.	c SNH (e slope, Tuolumne Co.), n SNE (Mono Co.)	0000840000
BOTRYCHIUM minganense Victorin	CaRH, s SNH	0400000100
BOTRYCHIUM montanum W.H. Wagner	s CaRH (near Jonesville, Butte, Tehama cos.)	0400000000
BOTRYCHIUM multifidum (S. Gmelin) Rupr.	NCo, CaR, SNH, CCo, MP	0706c00104
BOTRYCHIUM pinnatum H. St. John	KR (near Etna Mills, Siskiyou Co.), CaRH (Mt. Shasta)	0401000000
BOTRYCHIUM simplex Hitchc.	NCoRH, CaR, SN, SnBr, W&I	0608f88502
BOUTELOUA aristidoides (Kunth) Griseb. var. aristidoides	e PR, e&s DMoj, DSon	e040000000
BOUTELOUA barbata Lagasca var. barbata	SnJV, e PR, D	e040002000
BOUTELOUA curtipendula (Michaux) Torrey	s ScV (Yolo Co. as roadside waif), PR (Santa Rosa, Cuyamaca mtns), e&s DMtns	4040000200
BOUTELOUA eriopoda (Torrey) Torrey	e DMtns	4000000000
BOUTELOUA gracilis (Kunth) Griffiths	SnBr, e DMtns (Ivanpah, New York, Clark mtns), waif elsewhere	4000000400
BOUTELOUA trifida Thurber	e DMtns	4000000000
BOWLESIA incana Ruiz Lopez & Pavon	c&s SNF, CW, SCo, ChI, TR	1980331c01
BOYKINIA major A. Gray	KR, CaR, SN	0601f88100
BOYKINIA occidentalis Torrey & A. Gray	NW, n&c SNF, CW, WTR	013d1b0801
BOYKINIA rotundifolia C. Parry	s SCoRO, TR, PR	0040025401
BRACHYPODIUM distachyon (L.) P. Beauv.	s NCoR, s CaRF, SNF, GV, CW, SCo, s ChI (Santa Catalina Island)	13b83b2a00
BRACHYPODIUM pinnatum (L.) P. Beauv.	s NCo, expected elsewhere	0004000000
BRANDEGEA bigelovii (S. Watson) Cogn.	D	e000000000
BRASENIA schreberi J. Gmelin	NW, SNF, SNH, ScV, MP	003ff80304
BRASSICA fruticulosa Cyrillo	SCo (Los Angeles, Riverside, and San Bernardino cos.)	0080000000
BRASSICA juncea (L.) Czernov	GV	0000002200
BRASSICA napus L.	SnJV, SCo	0080002000
BRASSICA nigra (L.) Koch	CA-FP	1ffdfbff01
BRASSICA rapa L.	CA-FP, SNE	1ffdffff03
BRASSICA tournefortii Gouan	SW, D	f8c0005401
BRICKELLIA arguta Robinson	D	e000000000
BRICKELLIA arguta Robinson var. arguta	D	e000000000
BRICKELLIA arguta Robinson var. odontolepis Robinson	DSon	8000000000
BRICKELLIA atractyloides A. Gray	DMoj	6000000000
BRICKELLIA californica (Torrey & A. Gray) A. Gray	NW, CaRF, SN, SnJV, CW, SW, PR, W&I, D	fbfdfbfd03
BRICKELLIA desertorum Cov.	D	e000000000
BRICKELLIA frutescens A. Gray	DSon	8000000000
BRICKELLIA grandiflora (Hook.) Nutt.	NCoRH, CaRH, c SNF, s SNH	0408100100
BRICKELLIA greenei A. Gray	NW (exc NCoRO), CaRH, n SNH	041d400000
BRICKELLIA incana A. Gray	D	e000000000
BRICKELLIA knappiana Drew	n&e DMtns (Panamint, n Kingston mtns)	4000000000
BRICKELLIA longifolia S. Watson	n&w DMoj	6000000000
BRICKELLIA microphylla (Nutt.) A. Gray	s SNF, SnGb, Wrn, SNE, DMoj	6000241006
BRICKELLIA multiflora Kellogg	W&I, DMoj	6000000002
BRICKELLIA nevinii A. Gray	SCoRI, WTR, SnGb, DMoj	6000011001
BRICKELLIA oblongifolia Nutt. var. linifolia (D. Eaton) Robinson	SnJt, SNE, D	e000044002
BRICKELLIA watsonii Robinson	DMoj	6000000000
BRIZA maxima L.	NCo, NCoRO, n SNF, n CCo, n&c SCoRO, n SCo	01a40a0000
BRIZA minor L.	NCo, NCoRO, CCo, n SCoRO, n&c SNF, s ScV, n SnJV, DSon (Rancho Mirage), SnFrB	81241a2a00
BRODIAEA appendiculata Hoover	s NCoRI, c SNF, SnFrB	0010100800
BRODIAEA californica Lindley	NCoR, n SN	0038480000
BRODIAEA californica Lindley var. californica	NCoR, n SN	0038480000
BRODIAEA californica Lindley var. leptandra (E. Greene) Hoover	c NCoRI (Napa, Lake, Sonoma cos.)	0010000000
BRODIAEA coronaria (Salisb.) Engl.	NW, CaR, n&c SN	063dd80000
BRODIAEA coronaria (Salisb.) Engl. ssp. coronaria	NW, CaR, n&c SN	063dd80000
BRODIAEA coronaria (Salisb.) Engl. ssp. rosea (E. Greene) T. Niehaus	NCoRI (Tehama, Glenn, Lake cos.)	0010000000
BRODIAEA elegans Hoover	KR, n&c NCoR, SN, SnFrB	0039f88900
BRODIAEA elegans Hoover ssp. elegans	KR, n&c NCoR, SN, SnFrB	0039f88900
BRODIAEA elegans Hoover ssp. hooveri T. Niehaus	nw KR?	0001000000
BRODIAEA filifolia S. Watson	s SCo (w San Diego Co.), w PR (Riverside, San Diego cos.)	00c0000000
BRODIAEA insignis (Jepson) T. Niehaus	s SNF (Kaweah and Tule river drainages, Tulare Co.)	0000200000
BRODIAEA jolonensis Eastw.	SCoRO, w SW (incl Santa Cruz Island)	18c0025401
BRODIAEA kinkiensis T. Niehaus	s ChI (San Clemente Island)	1000000000
BRODIAEA minor (Benth.) S. Watson	n&c SNF, e ScV, ne SnJV	0000182200
BRODIAEA orcuttii (E. Greene) Baker	PR (s Riverside, San Diego cos.)	0040000000
BRODIAEA pallida Hoover	c SNF (near Chinese Camp, Tuolumne Co.)	0000100000
BRODIAEA purdyi Eastw.	s CaRF, n SNF	0200080000
BRODIAEA stellaris S. Watson	c&s NCo, NCoRO	0024000000
BRODIAEA terrestris Kellogg	NCo, w NCoRO, s SNF, Teh, CW, TR, PR	016423dc01
BRODIAEA terrestris Kellogg ssp. kernensis (Hoover) T. Niehaus	s SNF, Teh, SCoR, TR, PR	004023d401
BRODIAEA terrestris Kellogg ssp. terrestris	NCo, w NCoRO, CW (exc SCoRI)	0124020800
BROMUS alopecuros Poiret	e ScV	0000000200
BROMUS anomalus Fourn.	W&I (reported from n SNH, SnBr)	0000400402
BROMUS arenarius Labill.	CA-FP, D	fffdfbff01
BROMUS arizonicus (Shear) Stebb.	SnJV, s SCoR, SCo, ChI, D	f880032000
BROMUS briziformis Fischer & C. Meyer	KR, CaR, n SN, MP	0603480004
BROMUS carinatus Hook. & Arn.	CA (exc GV, DSon)	7fffffdd07
BROMUS carinatus Hook. & Arn. var. carinatus	CA (exc GV, DSon)	7fffffdd07
BROMUS carinatus Hook. & Arn. var. maritimus (Piper) C. Hitchc.	NCo, CCo, SnFrB, n SCo, ChI	1984000800
BROMUS catharticus Vahl	CA	ffffffff07
BROMUS ciliatus L.	SNH, SnBr, n W&I	0000c00502
BROMUS diandrus Roth	CA	ffffffff07
BROMUS grandis (Shear) A. Hitchc.	c&s SN, CW, TR, PR	0140b35d01
BROMUS hordeaceus L.	CA (uncommon D)	ffffffff07
BROMUS inermis Leysser ssp. inermis	SNH (e slope), SCoRO, SCo, PR, GB	00c2c64106
BROMUS japonicus Murr.	CA	ffffffff07
BROMUS laevipes Shear	NW, CaR, SN, CW, SCo, ChI, WTR, PR	1ffdfbc901
BROMUS madritensis L.	CA	ffffffff07
BROMUS madritensis L. ssp. madritensis	CA-FP, D (uncommon)	fffdfbff01
BROMUS madritensis L. ssp. rubens (L.) Husnot	CA	ffffffff07
BROMUS orcuttianus Vasey	NW, CaR, SN, SCoRO, TR, PR, MP	067ffad505
BROMUS secalinus L.	NW, CaR, n&c SN, MP	063fd80004
BROMUS stamineus Desv.	s NCo, s NCoR, n&c SNF, deltaic GV, CCo, SnFrB, n ChI	093c182a00
BROMUS sterilis L.	NW, SNF, SnFrB, SCoRO, s ChI	103d3a0800
BROMUS suksdorfii Vasey	KR, NCoRH, CaR, SNH, SCoRO, MP	060bc20104
BROMUS tectorum L.	CA	ffffffff07
BROMUS trinii Desv.	NCoRI, CaRF, SN, SnJV, CW, SW, SNE, D	fbd0fffd03
BROMUS vulgaris (Hook.) Shear	NW, CaR, n&c SN, SnFrB	063dd80800
BRYONIA dioica Jacq.	n CCo (San Francisco)	0100000000
BUDDLEJA davidii Franchet	NCo, CCo, SnFrB	0104000800
BUDDLEJA saligna Willd.	SCo (Santa Monica Mtns.)	0080000000
BUDDLEJA utahensis Cov.	DMoj	6000000000
BULBOSTYLIS capillaris (L.) C.B. Clarke	c SNH (Mariposa, Tuolumne cos.)	0000800000
BUPLEURUM lancifolium Hornem.	CA	ffffffff07
BURSERA microphylla A. Gray	w edge DSon (San Diego Co.)	8000000000
CACALIOPSIS nardosmia (A. Gray) A. Gray	KR, NCoR	0039000000
CAESALPINIA gilliesii (Hook.) D. Dietr.	SnJV, expected elsewhere	0000002000
CAESALPINIA spinosa (Molina) Kuntze	SCo (Ventura Co.), expected elsewhere	0080000000
CAESALPINIA virgata E.M. Fisher	DSon	8000000000
CAKILE edentula (Bigelow) Hook.	NCo, CCo, SCo	0184000000
CAKILE maritima Scop.	NCo, CCo, SCo	0184000000
CALAMAGROSTIS bolanderi Thurber	NCo	0004000000
CALAMAGROSTIS breweri Thurber	KR, SNH	0001c00100
CALAMAGROSTIS canadensis (Michaux) P. Beauv.	KR, CaRH, SNH	0401c00100
CALAMAGROSTIS foliosa Kearney	NCo, NCoRO	0024000000
CALAMAGROSTIS koelerioides Vasey	NW, CW, PR	017d034800
CALAMAGROSTIS nutkaensis (C. Presl) Steudel	NCo, CCo, SnFrB	0104000800
CALAMAGROSTIS ophitidis (J. Howell) Nygren	s NCoRO, n CCo, n SnFrB	0120000800
CALAMAGROSTIS purpurascens R.Br.	CaRH, SN, W&I	0400f88102
CALAMAGROSTIS rubescens Buckley	NCo, NCoRO, CW, n ChI (Santa Cruz Island)	0924030800
CALAMAGROSTIS stricta (Timm) Koeler	NW, CaR, SNH, CCo	073dc00100
CALAMAGROSTIS stricta (Timm) Koeler ssp. inexpansa (A. Gray) C.W. Greene	NW, CaR, n&c SNH, CCo	073dc00000
CALAMAGROSTIS stricta (Timm) Koeler ssp. stricta	SNH	0000c00100
CALANDRINIA ambigua (S. Watson) Howell	D	e000000000
CALANDRINIA breweri S. Watson	NCoR, c SNF, SnFrB, SCoRO, SCo, WTR	00b8120801
CALANDRINIA ciliata (Ru<#ed>z Lopez & Pav<#f3>n) DC.	CA-FP, w MP, s SNE, n DMtns (Coso Range)	5fffffff07
CALANDRINIA maritima Nutt.	SCo, ChI	1880000000
CALENDULA arvensis L.	NCo, CCo, SCoRO, expected more widely	0104020000
CALENDULA officinalis L.	CCo, SCoRO	0100020000
CALLIANDRA eriophylla Benth.	DSon	8000000000
CALLITRICHE hermaphroditica L.	SN, GV, CW, MP	0102fbab04
CALLITRICHE heterophylla Pursh	CA-FP, MP	1ffffbff05
CALLITRICHE heterophylla Pursh var. bolanderi (Hegelm.) Fassett	CA-FP, MP	1ffffbff05
CALLITRICHE heterophylla Pursh var. heterophylla	NW, GV, CW, SW	19fd037e01
CALLITRICHE marginata Torrey	CA-FP	1ffdfbff01
CALLITRICHE stagnalis Scop.	NCo, NCoR, n SNF	003c080000
CALLITRICHE trochlearis Fassett	NW, CW	013d030800
CALLITRICHE verna L.	CA-FP, GB	1fffffff07
CALOCEDRUS decurrens (Torrey) Florin	KR, NCoR, CaR, SN, SCoR, TR, PR, MP	067bfbd505
CALOCHORTUS albus Benth.	n&c SNF, CW, WTR, n ChI	09001b0801
CALOCHORTUS amabilis Purdy	NCoRO, nw SnFrB	0020000800
CALOCHORTUS amoenus E. Greene	c SNF (Madera, Fresno cos.), s SNF	0000300000
CALOCHORTUS argillosus (Hoover) R. Zebell & P. Fiedler	w CW	0100030800
CALOCHORTUS bruneaunis Nelson & J.F. Macbr.	s SNE	0000040002
CALOCHORTUS catalinae S. Watson	s CCo, w SCo, esp ChI	1980000000
CALOCHORTUS clavatus S. Watson	n&c SNF, w SnGb, s-c CCo, e SnFrB, SCoR, n WTR, SnGb	01001b1801
CALOCHORTUS clavatus S. Watson ssp. clavatus	s SCoRO, n SCoRI	0000030000
CALOCHORTUS clavatus S. Watson ssp. pallidus (Hoover) Munz	w SnJV (and adjacent e SnFrB, SCoRI), n WTR	0000012801
CALOCHORTUS clavatus S. Watson ssp. recurvifolius (Hoover) Munz	s-c CCo (nw San Luis Obispo Co.)	0100000000
CALOCHORTUS clavatus S. Watson var. avius Jepson	n&c SNF (El Dorado, Amador cos.)	0000180000
CALOCHORTUS clavatus S. Watson var. gracilis F. Ownbey	SnGb	0000001000
CALOCHORTUS coeruleus (Kellogg) S. Watson	NW, CaR, SNH	063dc00100
CALOCHORTUS concolor (Baker) Purdy	SnBr (s slope), PR	0040004400
CALOCHORTUS dunnii Purdy	s PR (s San Diego Co.)	0040000000
CALOCHORTUS elegans Pursh	e KR	0001000000
CALOCHORTUS excavatus E. Greene	w SNE (Mono, Inyo cos.)	0000040002
CALOCHORTUS flexuosus S. Watson	e D	e000000000
CALOCHORTUS greenei S. Watson	e KR, nw CaR, w MP	0603000004
CALOCHORTUS invenustus E. Greene	c SNH, Teh, se SnFrB, SCoR, SW	18c083dc01
CALOCHORTUS kennedyi Porter	n TR, W&I, DMoj	6000001403
CALOCHORTUS kennedyi Porter var. kennedyi	n TR, W&I, DMoj	6000001403
CALOCHORTUS kennedyi Porter var. munzii Jepson	n&e DMtns (Panamint, Clark, Providence mtns)	4000000000
CALOCHORTUS leichtlinii Hook. f.	SNH, MP	0002c00104
CALOCHORTUS longebarbatus S. Watson var. longebarbatus	CaRH, MP	0402000004
CALOCHORTUS luteus Lindley	c&s NW, SNF, ScV, CW, n ChI	093d3b0a00
CALOCHORTUS macrocarpus Douglas	n CaR, GB	0602040006
CALOCHORTUS minimus F. Ownbey	SNH	0000c00100
CALOCHORTUS monanthus F. Ownbey	ne KR (near Yreka, Siskiyou Co.)	0001000000
CALOCHORTUS monophyllus (Lindley) Lemaire	CaRF, n&c SNF	0200180000
CALOCHORTUS nudus S. Watson	KR, CaRH	0401000000
CALOCHORTUS obispoensis Lemmon	s SCoRO (San Luis Obispo Co.)	0000020000
CALOCHORTUS palmeri S. Watson	Teh, s CW, TR, SnJt	010003dc01
CALOCHORTUS palmeri S. Watson var. munzii F. Ownbey	SnJt	0000004000
CALOCHORTUS palmeri S. Watson var. palmeri	Teh, s CW, TR, SnJt	010003dc01
CALOCHORTUS panamintensis (F. Ownbey) Rev.	n DMtns (Panamint Mtns)	4000000000
CALOCHORTUS persistens F. Ownbey	ne KR (Siskiyou Co.)	0001000000
CALOCHORTUS plummerae E. Greene	SCo, PR	00c0004000
CALOCHORTUS pulchellus Benth.	ne SnFrB (Mount Diablo, Contra Costa Co.)	0000000800
CALOCHORTUS raichei S. Farwig & V. Girard	s NCoRO (Big Austin Creek, Sonoma Co.)	0020000000
CALOCHORTUS simulans (Hoover) Munz	se SCoRO (c San Luis Obispo Co.)	0000020000
CALOCHORTUS splendens Benth.	c&s NCoRI, CW, w SW	19d0035c01
CALOCHORTUS striatus Parish	w DMoj	6000000000
CALOCHORTUS superbus J. Howell	NW, CaRF, SNF, CW, SW	1bfd3b5c01
CALOCHORTUS tiburonensis A.J. Hill	nw SnFrB (Ring Mtn, Marin Co.)	0000000800
CALOCHORTUS tolmiei Hook. & Arn.	NW, n ScV, n CCo, SnFrB	013d000a00
CALOCHORTUS umbellatus Alph. Wood	s NCoRO, SnFrB	0020000800
CALOCHORTUS uniflorus Hook. & Arn.	NW, SnFrB, n&c CCo	013d000800
CALOCHORTUS venustus Benth.	SNF, CW, WTR, SnGb	01003b1801
CALOCHORTUS vestae Purdy	s KR, NCoR	0039000000
CALOCHORTUS weedii Alph. Wood	SCoRO, SCo, WTR, PR	00c0024001
CALOCHORTUS weedii Alph. Wood var. intermedius F. Ownbey	c SCo & n PR (Orange Co.)	00c0000000
CALOCHORTUS weedii Alph. Wood var. vestus Purdy	SCoRO, WTR	0000020001
CALOCHORTUS weedii Alph. Wood var. weedii	SCoRO, SCo, WTR, PR	00c0024001
CALOCHORTUS westonii Eastw.	s SNF (Greenhorn Mtns)	0000200000
CALTHA leptosepala DC. var. biflora (DC.) G. Lawson	KR, CaR, SNH, MP	0603c00104
CALYCADENIA fremontii A. Gray	NW, CaR, n SNF, ScV	063d080200
CALYCADENIA hooveri G. Carr	n&c SNF	0000180000
CALYCADENIA mollis A. Gray	c&s SNF, SnJV	0000302000
CALYCADENIA multiglandulosa DC.	NCoR, SN, GV, SnFrB, SCoRI	0038f9ab00
CALYCADENIA oppositifolia (E. Greene) E. Greene	CaRF, n SNF	0200080000
CALYCADENIA pauciflora A. Gray	NCoR	0038000000
CALYCADENIA spicata (E. Greene) E. Greene	SNF, GV	0000382200
CALYCADENIA truncata DC.	NW, CaR, SNF, GV, CW	073d3b2a00
CALYCADENIA villosa DC.	c&s SCoRO	0000020000
CALYCANTHUS occidentalis Hook. & Arn.	s NCoRO, NCoRI, s CaR, SNF, c&s SNH, apparently naturalized in n PR (Palomar Mtns.)	0670b80100
CALYCOSERIS parryi A. Gray	Teh, PR, SNE, D	e04004c002
CALYCOSERIS wrightii A. Gray	W&I, D	e000000002
CALYPSO bulbosa (L.) Oakes	NW (exc NCoRI), sw SnFrB	002d000800
CALYPTRIDIUM monandrum Nutt.	s SN, Teh, s SnJV, SCoRI, SW, SNE, D	f8c025f503
CALYPTRIDIUM monospermum E. Greene	KR, NCoRH, CaR, SN, TR, SNE	0609fc9503
CALYPTRIDIUM parryi A. Gray	s SNH, s SnFrB, n SCoRI, TR, SNE, n DMtns	4000051d03
CALYPTRIDIUM parryi A. Gray var. hesseae J.H. Thomas	s SnFrB (Mount Hamilton, Santa Cruz Mtns), n SCoRI	0000010800
CALYPTRIDIUM parryi A. Gray var. nevadense J. Howell	SNE, n DMtns	4000040002
CALYPTRIDIUM parryi A. Gray var. parryi	s SNH (Fresno, Inyo cos.), TR	0000001501
CALYPTRIDIUM pulchellum (Eastw.) Hoover	c SN (s Mariposa, Madera, n Fresno cos.)	0000900000
CALYPTRIDIUM pygmaeum Rydb.	s SNH, SnBr	0000000500
CALYPTRIDIUM quadripetalum S. Watson	NCoRH, NCoRI	0018000000
CALYPTRIDIUM roseum S. Watson	e slope SNH, n SNE, W&I	0000c40100
CALYPTRIDIUM umbellatum (Torrey) E. Greene	KR, NCoRH, CaR, SN, sw SnFrB (Santa Cruz Mtns), GB	060bfc8906
CALYSTEGIA atriplicifolia Hallier f. ssp. buttensis Brummitt	KR (Del Norte Co.), CaRF (Butte Co.), SnFrB (Mt. Diablo)	0201000800
CALYSTEGIA collina (E. Greene) Brummitt	NCoR, SnFrB, SCoR	0038030800
CALYSTEGIA collina (E. Greene) Brummitt ssp. collina	NCoR, SnFrB	0038000800
CALYSTEGIA collina (E. Greene) Brummitt ssp. oxyphylla Brummitt	NCoR (Lake, Sonoma, Napa cos.)	0038000000
CALYSTEGIA collina (E. Greene) Brummitt ssp. tridactylosa (Eastw.) Brummitt	NCoR (Mendocino, Lake cos.)	0038000000
CALYSTEGIA collina (E. Greene) Brummitt ssp. venusta Brummitt	SCoR	0000030000
CALYSTEGIA longipes (S. Watson) Brummitt	s CA-FP, D	fffdfbff01
CALYSTEGIA macrostegia (E. Greene) Brummitt	CCo, SCoR, SW	19c0035401
CALYSTEGIA macrostegia (E. Greene) Brummitt ssp. amplissima Brummitt	s ChI	1000000000
CALYSTEGIA macrostegia (E. Greene) Brummitt ssp. arida (E. Greene) Brummitt	SnGb, SnBr, n PR	0040001400
CALYSTEGIA macrostegia (E. Greene) Brummitt ssp. cyclostegia (House) Brummitt	CCo, n SCo	0180000000
CALYSTEGIA macrostegia (E. Greene) Brummitt ssp. intermedia (Abrams) Brummitt	SCo, s ChI, s WTR, SnGb, n PR	10c0001001
CALYSTEGIA macrostegia (E. Greene) Brummitt ssp. macrostegia	n ChI	0800000000
CALYSTEGIA macrostegia (E. Greene) Brummitt ssp. tenuifolia (Abrams) Brummitt	c&s SCoR, SCo, w PR	00c0030000
CALYSTEGIA malacophylla (E. Greene) Munz	CaR, SN, SnFrB, SCoR, WTR	0600fb8901
CALYSTEGIA malacophylla (E. Greene) Munz ssp. malacophylla	CaR, SN	0600f88100
CALYSTEGIA malacophylla (E. Greene) Munz ssp. pedicellata (Jepson) Munz	SnFrB, SCoR, WTR	0000030801
CALYSTEGIA occidentalis (A. Gray) Brummitt	CA-FP, MP	1ffffbff05
CALYSTEGIA occidentalis (A. Gray) Brummitt ssp. fulcrata (A. Gray) Brummitt	SNF, TR, PR	0040385401
CALYSTEGIA occidentalis (A. Gray) Brummitt ssp. occidentalis	KR, NCoR, CaRH, SNH, SnFrB, MP	043bc00904
CALYSTEGIA peirsonii (Abrams) Brummitt	n SnGb, adjacent DMoj (Antelope Valley)	2000001000
CALYSTEGIA purpurata (E. Greene) Brummitt	NCo, NCoRO, GV (Sutter Buttes), CCo, SnFrB, SCoRO, n SCo, w WTR	01a4022a01
CALYSTEGIA purpurata (E. Greene) Brummitt ssp. purpurata	NCo, NCoRO, GV (Sutter Buttes), CCo, SnFrB, SCoRO, n SCo, w WTR	01a4022a01
CALYSTEGIA purpurata (E. Greene) Brummitt ssp. saxicola (Eastw.) Brummitt	s&c NCo, n SnFrB	0004000800
CALYSTEGIA sepium (L.) R.Br.	Deltaic GV, SnFrB, SCoR, SCo, TR, e DMoj	6080033e01
CALYSTEGIA sepium (L.) R.Br. ssp. binghamiae (E. Greene) Brummitt	n&c SCo	0080000000
CALYSTEGIA sepium (L.) R.Br. ssp. limnophila (E. Greene) Brummitt	Deltaic GV, SnFrB, SCoR, TR, e DMoj (Amargosa River, 500 m)	6000033e01
CALYSTEGIA soldanella (L.) R.Br.	NCo, CCo, n&c SCo	0184000000
CALYSTEGIA stebbinsii Brummitt	n SNF (El Dorado Co.)	0000080000
CALYSTEGIA subacaulis Hook. & Arn.	s NCoR, SnFrB, c SCoRO	0038020800
CALYSTEGIA subacaulis Hook. & Arn. ssp. episcopalis Brummitt	c SCoRO (San Luis Obispo Co.)	0000020000
CALYSTEGIA subacaulis Hook. & Arn. ssp. subacaulis	s NCoR, SnFrB	0038000800
CAMASSIA quamash (Pursh) E. Greene	NW, CaR, SNH, n SnFrB, MP	063fc00904
CAMASSIA quamash (Pursh) E. Greene ssp. breviflora Gould	MP, adjacent n SNH	0002400004
CAMASSIA quamash (Pursh) E. Greene ssp. quamash	NW, CaR, SNH, n SnFrB, MP	063fc00904
CAMELINA microcarpa Andrz.	CA-FP	1ffdfbff01
CAMISSONIA andina (Nutt.) Raven	CaRH (Sierra, Plumas cos.), MP	0402000004
CAMISSONIA arenaria (Nelson) Raven	DSon	8000000000
CAMISSONIA benitensis Raven	SCoRI (lower Clear Creek drainage, San Benito Co.)	0000010000
CAMISSONIA bistorta (Torrey & A. Gray) Raven	SW	18c0005401
CAMISSONIA boothii (Douglas) Raven	s SN, CW, WTR, GB, D	e102270907
CAMISSONIA boothii (Douglas) Raven ssp. alyssoides (Hook. & Arn.) Raven	MP, W&I	0002000006
CAMISSONIA boothii (Douglas) Raven ssp. boothii	SNE	0000040002
CAMISSONIA boothii (Douglas) Raven ssp. condensata (Munz) Raven	D	e000000000
CAMISSONIA boothii (Douglas) Raven ssp. decorticans (Hook. & Arn.) Raven	s SNF, Teh, s SnJV, SnFrB, SCoRI, WTR	000021a801
CAMISSONIA boothii (Douglas) Raven ssp. desertorum (Munz) Raven	s SNH, s SNE, DMoj	6000040102
CAMISSONIA boothii (Douglas) Raven ssp. intermedia (Munz) Raven	SNE (ne Inyo Co.), e DMtns (Kingston Mtns)	4000040002
CAMISSONIA brevipes (A. Gray) Raven	D	e000000000
CAMISSONIA brevipes (A. Gray) Raven ssp. arizonica (Raven) Raven	se DSon (Imperial Co.)	8000000000
CAMISSONIA brevipes (A. Gray) Raven ssp. brevipes	D	e000000000
CAMISSONIA brevipes (A. Gray) Raven ssp. pallidula (Munz) Raven	D (se Inyo, ne Imperial cos.)	e000000000
CAMISSONIA californica (Torrey & A. Gray) Raven	s NCoRO (Sonoma Co.), SnJV (Fresno Co.), SCoR, SW, D	f8e0037401
CAMISSONIA campestris (E. Greene) Raven	SNF, GV, CW, e SW, w DMoj	79c03b7e01
CAMISSONIA campestris (E. Greene) Raven ssp. campestris	SNF, GV, CW, e SW, w DMoj	79c03b7e01
CAMISSONIA campestris (E. Greene) Raven ssp. obispoensis Raven	SCoRO	0000020000
CAMISSONIA cardiophylla (Torrey) Raven	D	e000000000
CAMISSONIA cardiophylla (Torrey) Raven ssp. cardiophylla	c&s DMoj (San Bernardino Co.), DSon	e000000000
CAMISSONIA cardiophylla (Torrey) Raven ssp. robusta (Raven) Raven	n DMoj (Inyo Co.)	2000000000
CAMISSONIA chamaenerioides (A. Gray) Raven	W&I, D	e000000002
CAMISSONIA cheiranthifolia (Sprengel) Raim	NCo, CCo, SCo, ChI	1984000000
CAMISSONIA cheiranthifolia (Sprengel) Raim ssp. cheiranthifolia	NCo, CCo, ChI	1904000000
CAMISSONIA cheiranthifolia (Sprengel) Raim ssp. suffruticosa (S. Watson) Raven	SCo	0080000000
CAMISSONIA claviformis (Torrey & Fr<#e9>mont) Raven	PR, GB, D	e042044006
CAMISSONIA claviformis (Torrey & Fr<#e9>mont) Raven ssp. aurantiaca (S. Watson) Raven	D	e000000000
CAMISSONIA claviformis (Torrey & Fr<#e9>mont) Raven ssp. claviformis	DMoj and edges	6000000000
CAMISSONIA claviformis (Torrey & Fr<#e9>mont) Raven ssp. cruciformis (Kellogg) Raven	MP (Lassen Co.)	0002000004
CAMISSONIA claviformis (Torrey & Fr<#e9>mont) Raven ssp. funerea (Raven) Raven	n DMoj (Eureka, Saline, Death valleys)	2000000000
CAMISSONIA claviformis (Torrey & Fr<#e9>mont) Raven ssp. integrior (Raven) Raven	SNE	0000040002
CAMISSONIA claviformis (Torrey & Fr<#e9>mont) Raven ssp. lancifolia (A.A. Heller) Raven	SNE	0000040002
CAMISSONIA claviformis (Torrey & Fr<#e9>mont) Raven ssp. peirsonii (Munz) Raven	PR, DSon (Imperial Co.)	8040004000
CAMISSONIA claviformis (Torrey & Fr<#e9>mont) Raven ssp. yumae (Raven) Raven	se DSon (se Imperial Co.)	8000000000
CAMISSONIA confusa Raven	SW	18c0005401
CAMISSONIA contorta (Douglas) Raven	NW, CaR, SNF, GV, CW, MP	073f3b2a04
CAMISSONIA graciliflora (Hook. & Arn.) Raven	NW, CaR, SNF, GV, CW, WTR	073d3b2a01
CAMISSONIA guadalupensis (S. Watson) Raven ssp. clementina (Raven) Raven	s ChI (San Clemente Island)	1000000000
CAMISSONIA hardhamiae Raven	SCoRO (Monterey, San Luis Obispo cos.)	0000020000
CAMISSONIA heterochroma (S. Watson) Raven	SNE, n DMtns (Grapevine Mtns)	4000040002
CAMISSONIA hirtella (E. Greene) Raven	NW, SN, CW, SW	19fdfbdd01
CAMISSONIA ignota (Jepson) Raven	c SNH (Madera Co.), ScV (uncommon), CW, SW (incl Santa Cruz Island)	19c0835e01
CAMISSONIA integrifolia Raven	s SNF (Kern River area, Kern Co.)	0000200000
CAMISSONIA intermedia Raven	NW, CW, SW	19fd035c01
CAMISSONIA kernensis (Munz) Raven	se SNH, s SNE (esp Inyo Co.), n&w DMoj	6000040102
CAMISSONIA kernensis (Munz) Raven ssp. gilmanii (Munz) Raven	s SNE (esp Inyo Co.), n&w DMoj	6000040002
CAMISSONIA kernensis (Munz) Raven ssp. kernensis	se SNH, w DMoj (Piute Mtns, El Paso Mtns, Grapevine Canyon, Kern Co.)	6000000100
CAMISSONIA lacustris Raven	s NCoRI (c Lake Co.) SNF	0010380000
CAMISSONIA lewisii Raven	SCo, w PR	00c0000000
CAMISSONIA luciae Raven	SCoRO	0000020000
CAMISSONIA micrantha (Sprengel) Raven	w margin GV, CW, SW	19c0037e01
CAMISSONIA minor (Nelson) Raven	ne MP (Surprise Valley, ne Modoc Co.)	0002000004
CAMISSONIA munzii (Raven) Raven	ne DMoj	6000000000
CAMISSONIA ovata (Torrey & A. Gray) Raven	NW, CW	013d030800
CAMISSONIA pallida (Abrams) Raven	s SnJV (Kern Co.), n slope SnBr, D	e000002400
CAMISSONIA pallida (Abrams) Raven ssp. hallii (Davidson) Raven	n slope SnBr	0000000400
CAMISSONIA pallida (Abrams) Raven ssp. pallida	s SnJV (Kern Co.), n slope SnBr, D	e000002400
CAMISSONIA palmeri (S. Watson) Raven	s GV, SCoRI, WTR (Tejon Pass), PR (Jacumba), W&I, DMoj	6040012203
CAMISSONIA parvula (Torrey & A. Gray) Raven	GB	0002040006
CAMISSONIA pterosperma (S. Watson) Raven	s W&I (Inyo Mtns), n DMtns (Panamint Mtns)	4000000002
CAMISSONIA pubens (S. Watson) Raven	GB, n DMoj (scattered)	2002040006
CAMISSONIA pusilla Raven	n slope SnBr (Cactus Flats), GB, DMoj (scattered)	6002040406
CAMISSONIA refracta (S. Watson) Raven	D	e000000000
CAMISSONIA robusta Raven	ChI (Santa Cruz, San Clemente, Santa Catalina islands) PR	1840004000
CAMISSONIA sierrae Raven	c SNF (Madera, Mariposa cos.), s SNH (ne Fresno Co.)	0000100100
CAMISSONIA sierrae Raven ssp. alticola Raven	s SNH (ne Fresno Co.)	0000000100
CAMISSONIA sierrae Raven ssp. sierrae	c SNF (Madera, Mariposa cos.)	0000100000
CAMISSONIA strigulosa (Fischer & C. Meyer) Raven	s edge s SNH, Teh, CW, SW, n ChI (Santa Rosa Island), w DMoj	79c003dd01
CAMISSONIA subacaulis (Pursh) Raven	SN, GB	0002fc8106
CAMISSONIA tanacetifolia (Torrey & A. Gray) Raven	CaR, SN, GB	0602fc8106
CAMISSONIA tanacetifolia (Torrey & A. Gray) Raven ssp. quadriperforata Raven	n SNH (Plumas, Sierra cos.), MP (Lassen Co.)	0002400004
CAMISSONIA tanacetifolia (Torrey & A. Gray) Raven ssp. tanacetifolia	CaR, SN, GB	0602fc8106
CAMISSONIA walkeri (Nelson) Raven ssp. tortilis (Jepson) Raven	W&I, n DMoj (Inyo, ne San Bernardino cos.)	2000000002
CAMPANULA angustiflora Eastw.	NCoRI, SnFrB	0010000800
CAMPANULA californica (Kellogg) A.A. Heller	s NCo, n CCo	0104000000
CAMPANULA exigua Rattan	e SnFrB, n SCoRI	0000010800
CAMPANULA griffinii N. Morin	NCoRI, SnFrB, n SCoR	0010030800
CAMPANULA prenanthoides Durand	NW, CaRH, w-n&c SN, w SnFrB, n SCoRO	043dda0800
CAMPANULA rotundifolia L.	e KR (Siskiyou Co.)	0001000000
CAMPANULA scabrella Engelm.	KR, CaRH, Wrn	0401000004
CAMPANULA scouleri A. DC	KR, n NCoRO, CaRH (Mount Shasta, Lassen Peak)	0421000000
CAMPANULA sharsmithiae N. Morin	s SnFrB, n SCoRI (Mount Hamilton Range)	0000010800
CAMPANULA shetleri Heckard	CaRH (Shasta Co.)	0400000000
CAMPANULA wilkinsiana E. Greene	KR (Trinity Mtns), CaRH (Mount Shasta), n SNH (reported from Deer Creek Meadows, Plumas Co.)	0401400000
CANBYA candida C. Parry	w DMoj, adjacent SN	6000f88100
CANNABIS sativa L.	CA-FP	1ffdfbff01
CAPSELLA bursa-pastoris (L.) Medikus	CA	ffffffff07
CARAGANA arborescens Lam.	PR	0040004000
CARDAMINE angulata Hook.	NW	003d000000
CARDAMINE bellidifolia L. var. pachyphylla Cov. & Leiberg	CaR	0600000000
CARDAMINE breweri S. Watson	n NW, CaRH, SNH, WTR, SnBr, SNE	043dc40503
CARDAMINE breweri S. Watson var. breweri	CaRH, SNH, WTR, SnBr, SNE	0400c40503
CARDAMINE breweri S. Watson var. orbicularis (E. Greene) Detl.	n NW (Humboldt Co.)	003d000000
CARDAMINE californica (Torrey & A. Gray) E. Greene	CA-FP	1ffdfbff01
CARDAMINE californica (Torrey & A. Gray) E. Greene var. californica	CA-FP	1ffdfbff01
CARDAMINE californica (Torrey & A. Gray) E. Greene var. cardiophylla (E. Greene) Rollins	NW	003d000000
CARDAMINE californica (Torrey & A. Gray) E. Greene var. cuneata (E. Greene) Rollins	SCoR	0000030000
CARDAMINE californica (Torrey & A. Gray) E. Greene var. integrifolia (Torrey & A. Gray) Rollins	CA-FP	1ffdfbff01
CARDAMINE californica (Torrey & A. Gray) E. Greene var. sinuata (E. Greene) O. Schulz	NW	003d000000
CARDAMINE cordifolia A. Gray var. lyallii (S. Watson) Nelson & J.F. Macbr.	KR, CaR, n SNH	0601400000
CARDAMINE hirsuta L.	KR, expected elsewhere	0001000000
CARDAMINE nuttallii E. Greene	NW	003d000000
CARDAMINE nuttallii E. Greene var. covilleana (O. Schulz) Rollins	KR, NCoR	0039000000
CARDAMINE nuttallii E. Greene var. dissecta (O. Schulz) Rollins	NW	003d000000
CARDAMINE nuttallii E. Greene var. gemmata (E. Greene) Rollins	NCo (Del Norte Co.)	0004000000
CARDAMINE nuttallii E. Greene var. nuttallii	NW	003d000000
CARDAMINE occidentalis (Robinson) Howell	NW	003d000000
CARDAMINE oligosperma Torrey & A. Gray	CA-FP, W&I	1ffdfbff03
CARDAMINE pachystigma (S. Watson) Rollins	NCo, NCoR, CaR, SN, ScV	063cf88300
CARDAMINE pachystigma (S. Watson) Rollins var. dissectifolia (Detl.) Rollins	NCo (Mendocino Co.), ScV (Butte Co.)	0004000200
CARDAMINE pachystigma (S. Watson) Rollins var. pachystigma	NCoR, CaR, SN	0638f88100
CARDAMINE pensylvanica Willd.	CaR, n SNF	0600080000
CARDARIA chalepensis (L.) Hand.-Mazz.	CA (exc D)	1fffffff07
CARDARIA draba (L.) Desv.	CA (exc D)	1fffffff07
CARDARIA pubescens (C. Meyer) Jarmol.	CA	ffffffff07
CARDIONEMA ramosissimum (J.A. Weinm.) Nelson & J.F. Macbr.	NCo, CCo, SCo	0184000000
CARDUUS acanthoides L.	NCoRI, n SN, SnFrB, n SCoRO, MP	00124a0804
CARDUUS nutans L.	KR, CaR, n SNH, SCo, MP, DMoj	6683400004
CARDUUS pycnocephalus L.	s NCo, s NCoR, SNF, CW	013c3b0800
CARDUUS tenuiflorus Curtis	NCo, NCoR, SNF, CW, SW	19fc3b5c01
CAREX abrupta Mackenzie	KR, NCoR, CaRH, SN, TR, PR, MP, SNE (Sweetwater Mtns), DMtns	447bfcd507
CAREX albida L. Bailey	s NCoRO (Pitkin Marsh, Sonoma Co.)	0020000000
CAREX albonigra Mackenzie	c&s SNH, W&I	0000800102
CAREX alma L. Bailey	c&s SNH, SnJV, CCo, SCo, TR, PR, DMtns	41c0807501
CAREX amplectens Mackenzie	CaRH, SNH	0400c00100
CAREX amplifolia Boott	KR, NCoR, CaRH, SNH, CCo, SnFrB, MP	053bc00904
CAREX angustata Boott	KR, NCoRO, NCoRH, CaRH, SNH, MP	042bc00104
CAREX aquatilis Wahlenb.	NW, CaRH (Butte Co.), SNH, CCo, SnBr, Wrn, W&I	053dc00506
CAREX aquatilis Wahlenb. var. aquatilis	KR, NCoR, SNH, SnBr, Wrn, W&I	0039c00506
CAREX aquatilis Wahlenb. var. dives (Holm) L. Standley	NCo, KR, CaRH (Butte Co.), CCo	0505000000
CAREX arcta Boott	NCoRO	0020000000
CAREX atherodes Sprengel	MP (Alturas)	0002000004
CAREX athrostachya Olney	KR, NCoR, CaR, SN, SnBr, MP, W&I	063bf88506
CAREX aurea Nutt.	NCoRH, CaRH, SNH, TR, MP, n SNE, W&I, DMtns	440ac41505
CAREX barbarae Dewey	KR, NCoR, CaRF, SNF, GV, SCo, SnFrB	02b9382a00
CAREX bolanderi Olney	NCo, KR, NCoR, CaRH, SNH, CCo, SnFrB, SW	1dfdc05d01
CAREX brainerdii Mackenzie	KR, NCoRO, CaRH, n&c SNH, SCoRO (San Luis Obispo Co.)	0421c20000
CAREX brevicaulis Mackenzie	NCo, CCo	0104000000
CAREX breweri Boott var. breweri	CaRH, SNH, W&I	0400c00102
CAREX buxbaumii Wahlenb.	NCo, NCoR, c&s SNH, CCo	013c800100
CAREX californica L. Bailey	NCo	0004000000
CAREX canescens L.	NCoRO, n&c SNH	0020c00000
CAREX capitata L.	CaRH, SNH, W&I	0400c00102
CAREX cephalophora Muhlenb.	c SCo (Pasadena, Los Angeles Co.)	0080000000
CAREX comosa Boott	NCoRI, CaRH, GV, n CCo (Bodega Bay), SnFrB, SnBr, MP (Shasta Co.)	0512002e04
CAREX concinnoides Mackenzie	KR, NCoR	0039000000
CAREX congdonii L. Bailey	c&s SNH	0000800100
CAREX cusickii Mackenzie	NCo, n&c SNH, CCo	0104c00000
CAREX davyi Mackenzie	n&c SNH	0000c00000
CAREX densa L. Bailey	NW, CaR, SN, GV, CCo, SnFrB, SCo, SnGb	07bdf8bb00
CAREX deweyana Schwein. ssp. leptopoda (Mackenzie) Calder & R. Taylor	NW, CaRH, SNH, CCo, SnFrB, SW	1dfdc05d01
CAREX diandra Schrank	NCoR, n SNH (El Dorado Co.), CW, SW, MP	19fa435c05
CAREX disperma Dewey	SNH, W&I	0000c00102
CAREX douglasii Boott	KR, SNH, SnJV, SCoR, TR, PR, GB	0043c77507
CAREX dudleyi Mackenzie	NCo, NCoR, GV, SN, CW, WTR, MP, DMtns	413efbab05
CAREX echinata Murray	NCo, KR, NCoRO, CaRH, SNH, CCo, SnBr	0525c00500
CAREX echinata Murray ssp. echinata	KR, NCoRO, CaRH, SNH, SnBr	0421c00500
CAREX echinata Murray ssp. phyllomanica (W. Boott) A.A. Reznicek	NCo, CCo	0104000000
CAREX eleocharis L. Bailey	W&I	0000000002
CAREX feta L. Bailey	KR, NCoR, CaRH, SNH, SnFrB, SnBr, MP	043bc00d04
CAREX filifolia Nutt.	SNH, SnBr, W&I	0000c00502
CAREX filifolia Nutt. var. erostrata K<#fc>k.	SNH, SnBr, W&I	0000c00502
CAREX filifolia Nutt. var. filifolia	c SNH (Inyo Co.)	0000800000
CAREX fissuricola Mackenzie	c&s SNH	0000800100
CAREX fracta Mackenzie	KR, NCoR, CaRH, SNH, TR, PR	0479c05501
CAREX garberi Fern.	NCo (Marin, Humboldt cos.), SnFrB (Santa Cruz Mtns)	0004000800
CAREX geyeri Boott	KR	0001000000
CAREX gigas (Holm) Mackenzie	KR, n SNH (Plumas Co.)	0001400000
CAREX globosa Boott	NCo, NCoRO, CW, SW	19e4035c01
CAREX gracilior Mackenzie	c&s NCo, c&s NCoR, SNF, CCo, SnFrB, SCoR	013c3b0800
CAREX gynodynama Olney	NCo, NCoRO, n CCo (Marin, Santa Cruz cos.), SCoRO	0124020000
CAREX halliana L. Bailey	KR (Medicine Lake, Siskiyou Co.)	0001000000
CAREX harfordii Mackenzie	NCoR, CW, ChI	1938030800
CAREX hassei L. Bailey	NCo, KR, SNH, CCo, SnFrB, SnGb, SnBr, SNE, DMtns	4105c41d02
CAREX haydeniana Olney	c&s SNH, W&I, Wrn	0000800106
CAREX helleri Mackenzie	CaRH, SNH, SNE (Sweetwater Mtns), W&I	0400c40102
CAREX hendersonii L. Bailey	NCo, CCo	0104000000
CAREX heteroneura W. Boott	KR, CaRH, SNH, SnGb, SnBr, SnJt, Wrn, SNE (Sweetwater Mtns), W&I	0401c45506
CAREX heteroneura W. Boott var. epapillosa (Mackenzie) F. Herm.	KR (Medicine Lake, Siskiyou Co.), CaRH, n&c SNH, Wrn, SNE (Sweetwater Mtns)	0401c40006
CAREX heteroneura W. Boott var. heteroneura	KR, CaRH, SNH, SnGb, SnBr, SnJt, Wrn, SNE (Sweetwater Mtns), W&I	0401c45506
CAREX hirtissima W. Boott	NCoR (Lake, Mendocino cos.), n&c SN	0038d80000
CAREX hoodii Boott	KR, NCoR, CaRH, SNH, SnBr, Wrn, W&I	0439c00506
CAREX hystricina Muhlenb.	KR (Trinity Co.)	0001000000
CAREX illota L. Bailey	CaRH, SNH, SnBr, Wrn	0400c00504
CAREX incurviformis MacKenzie var. danaensis (Stacey) F. Herm.	c&s SNH, W&I	0000800102
CAREX inops L. Bailey ssp. inops	CaRH (Mount Shasta area)	0400000000
CAREX integra Mackenzie	KR, NCoR, CaRH, SN, SnBr, PR, MP	047bf8c504
CAREX interior L. Bailey	KR, CaRH	0401000000
CAREX jonesii L. Bailey	KR, NCoR, CaRH, SNH, SnBr, Wrn	0439c00504
CAREX laeviculmis Meinsh.	KR, NCoRO, n&c SNH, Wrn	0021c00004
CAREX lanuginosa Michaux	NCo, KR, CaRH, SNH, CCo, SnFrB, SnGb, SnBr, GB, DMoj	6507c41d06
CAREX lasiocarpa Ehrh.	CaRH (nw Plumas Co.), n SNH (s Plumas Co.)	0400400000
CAREX leavenworthii Dewey	SnFrB (Alameda Co.), SCo (Santa Barbara, Los Angeles cos.)	0080000800
CAREX lemmonii W. Boott	KR, NCoR, CaRH, SNH, SnBr, SnJt	0439c04500
CAREX lenticularis Michaux	NW, CaRH, SNH, CCo, SnFrB, Wrn	053dc00904
CAREX lenticularis Michaux var. impressa (L. Bailey) L. Standley	KR, NCoR, CaRH, SNH, Wrn	0439c00104
CAREX lenticularis Michaux var. limnophila (Holm) Cronq.	NCo	0004000000
CAREX lenticularis Michaux var. lipocarpa (Holm) L. Standley	KR, NCoR, CaRH, SNH, CCo, SnFrB	0539c00900
CAREX leporinella Mackenzie	KR, CaRH, SNH, Wrn, SNE (Sweetwater Mtns), W&I	0401c40106
CAREX leptalea Wahlenb.	NCo, NCoRO, CCo	0124000000
CAREX limosa L.	SNH	0000c00100
CAREX livida (Wahlenb.) Willd.	NCo (Mendocino Co.)	0004000000
CAREX luzulifolia W. Boott	CaRH (near Lassen Peak), n SNH, c SNH (n Tuolumne Co.)	0400c00000
CAREX luzulina Olney	NCo, KR, CaRH, n&c SNH, CCo, SnBr, Wrn	0505c00404
CAREX luzulina Olney var. ablata (L. Bailey) F. Herm.	KR, CaRH, n&c SNH, Wrn	0401c00004
CAREX luzulina Olney var. luzulina	NW, CaRH, n SNH, CCo, SnBr	053d400400
CAREX lyngbyei Hornem.	NCo, CCo	0104000000
CAREX mariposana L. Bailey	NW, CaRH, SN	043df88100
CAREX mendocinensis Olney	NCo, KR, n SNH (Butte, El Dorado cos.), CCo	0105400000
CAREX mertensii Prescott	KR	0001000000
CAREX microptera Mackenzie	KR, NCoRH, CaRH, SNH, TR, PR, Wrn, SNE (Sweetwater Mtns), W&I, DMtns	4449c45507
CAREX molesta Mackenzie	SCo (Santa Barbara Co.)	0080000000
CAREX multicaulis L. Bailey	KR, NCoR, CaRH, SNH, SCoR, TR, PR, MP	047bc35505
CAREX multicostata Mackenzie	KR, n&c NCoR, CaRH, SNH, SnFrB, TR, PR	0479c05d01
CAREX nebrascensis Dewey	KR, CaRH, SNH, GV, WTR, SnJt, GB, DMtns	4403c46307
CAREX nervina L. Bailey	KR, NCoR, CaRH, SNH, SnJV	0439c02100
CAREX neurophora Mackenzie	NCoR	0038000000
CAREX nigricans C. Meyer	KR, CaRH, SNH	0401c00100
CAREX norvegica Retz.	W&I (White Mtns)	0000000002
CAREX nudata W. Boott	NCo, KR, NCoRO, SNH, ScV, CCo, SCoR	0125c30300
CAREX obispoensis Stacey	s CCo (San Luis Obispo Co.)	0100000000
CAREX obnupta L. Bailey	NCo, nw KR, CCo, SnFrB	0105000800
CAREX occidentalis L. Bailey	SnBr, W&I	0000000402
CAREX ovalis Good	NCoR, SnFrB, Wrn	0038000804
CAREX pachystachya Cham.	KR, NCoR, CaRH	0439000000
CAREX pansa L. Bailey	NCo, CCo, SnFrB, ChI	1904000800
CAREX parryana Dewey var. hallii (Olney) K<#fc>k.	W&I (White Mtns)	0000000002
CAREX petasata Dewey	e KR, CaRH (Lassen Co.), n SNH (Alpine Co.), MP, W&I	0403400006
CAREX phaeocephala Piper	CaRH, SN, Wrn, SNE (Sweetwater Mtns), W&I	0400fc8106
CAREX praeceptorum Mackenzie	CaRH, c&s SNH	0400800100
CAREX praegracilis W. Boott	CA-FP, W&I, DMtns	5ffdfbff03
CAREX praticola Rydb.	NCo (Humboldt Co.), c&s SNH	0004800100
CAREX preslii Steudel	KR, NCoR, SNH, Wrn	0039c00104
CAREX proposita Mackenzie	c&s SNH	0000800100
CAREX raynoldsii Dewey	KR, CaRH, SNH, Wrn	0401c00104
CAREX retroflexa Willd. var. texensis (Torrey) Fern.	ScV (Butte Co.), SCo (Santa Barbara, Los Angeles cos.)	0080000200
CAREX rossii Boott	NW, CaRH, SNH, SnGb, SnBr, MP, W&I, DMtns	443fc01506
CAREX saliniformis Mackenzie	CCo	0100000000
CAREX sartwelliana Olney	c&s SNH, SnJt	0000804100
CAREX schottii Dewey	NCoRO, SnFrB, SCo, WTR, PR	00e0004801
CAREX scirpoidea Michaux var. pseudoscirpoidea (Rydb.) Cronq.	c SNH	0000800000
CAREX scoparia Schk.	CaRF (Shasta Co.), n SNH (Plumas Co.)	0200400000
CAREX scopulorum Holm var. bracteosa (L. Bailey) F. Herm.	KR, NCoRO, NCoRH, CaRH, SNH, Wrn, SNE (Sweetwater Mtns.)	0429c40106
CAREX senta Boott	n&c SNH, s ScV, CCo, SCo, ChI, TR, SnJt	1980c05601
CAREX serratodens W. Boott	NCoR, SN, SnFrB, SCoR	0038fb8900
CAREX sheldonii Mackenzie	n SNH (Plumas, Placer cos.), MP	0002400004
CAREX simulata Mackenzie	KR, CaRH, SNH, CCo, SnFrB, GB	0503c40906
CAREX specifica L. Bailey	KR, CaRH, SNH	0401c00100
CAREX spectabilis Dewey	KR, CaRH, SNH	0401c00100
CAREX spissa L. Bailey	CCo, SCo	0180000000
CAREX stipata Muhlenb. var. stipata	NW, n&c SNH, SnFrB	003dc00800
CAREX straminiformis L. Bailey	KR, NCoRI, CaRH, SNH, MP, SNE (Sweetwater Mtns), W&I	0413c40106
CAREX subbracteata Mackenzie	NCo, NCoR, CCo, SnFrB, SCoR	013c030800
CAREX subfusca W. Boott	KR, NCoR, CaRH, SN, SnFrB, SCoR, TR, PR, Wrn, DMtns	4479fbdd05
CAREX subnigricans Stacey	SNH, SNE (Sweetwater Mtns), W&I	0000c40102
CAREX tahoensis F.J. Smiley	SNH, SNE (Sweetwater Mtns)	0000c40102
CAREX tiogana D. Taylor & J. Mastrogiuseppe	c SNH (Mono Co.)	0000800000
CAREX tompkinsii J. Howell	c SNF (near El Portal, Mariposa Co.), s SNH (near Kings Canyon, Fresno Co.)	0000100100
CAREX triquetra Boott	CCo, SCo, s ChI, WTR, SnBr, PR	11c0004401
CAREX tumulicola Mackenzie	NCo, NCoR, SN, CCo, SnFrB, ChI	193cf88900
CAREX unilateralis Mackenzie	n&c NCoR	0038000000
CAREX utriculata Boott	KR, NCoR, CaRH, SNH, CCo, SnFrB, SnBr, SNE	0539c40d02
CAREX vallicola Dewey	SNE (Sweetwater Mtns)	0000040002
CAREX vernacula L. Bailey	CaRH, SNH, Wrn, SNE (Sweetwater Mtns), W&I	0400c40106
CAREX vesicaria L.	NW, CaRH, SNH, CCo, SnFrB, MP	053fc00904
CAREX vesicaria L. var. major Boott	NCo, s KR, n SN (Plumas Co.), CCo	0105480000
CAREX vesicaria L. var. vesicaria	KR, NCoR, CaRH, SNH, SnFrB, MP	043bc00904
CAREX viridula Michaux var. viridula	NCo, n SNH (1 site)	0004400000
CAREX vulpinoidea Michaux	se KR, n CaRH, n ScV	0401000200
CAREX whitneyi Olney	KR, CaRH, n&c SNH, Wrn	0401c00004
CARLOWRIGHTIA arizonica A. Gray	w DSon (Palm Canyon, Borrego Springs)	8000000000
CARNEGIEA gigantea (Engelm.) Britton & Rose	e DSon	8000000000
CARPENTERIA californica Torrey	c&s SNF (between Kings & San Joaquin Rivers, Fresno Co.)	0000300000
CARPOBROTUS chilensis (Molina) N.E. Br.	NCo, CCo, SCo, n ChI	0984000000
CARPOBROTUS edulis (L.) N.E. Br.	NCo, CCo, SCo, ChI	1984000000
CARTHAMUS baeticus (Boiss. & Reuter) Nyman	c SNF, c GV, SnFrB, s SCoR, SW, w DMoj	78c0137e01
CARTHAMUS lanatus L.	+/- NW, c SN, +/- CW	013d930800
CARTHAMUS leucocaulos Sibth. & Smith	s NCoR (expected more widely)	0038000000
CARTHAMUS tinctorius L.	GV and margins (esp SnJV)	0000002200
CASSIOPE mertensiana (Bong.) Don	KR, CaRH, SNH	0401c00100
CASTELA emoryi (A. Gray) Moran & Felger	D	e000000000
CASTILLEJA affinis Hook. & Arn.	n&c NCo, n&s NCoRO, s NCoRI, n CaRF, SNF, CW, SW	1bf43b5c01
CASTILLEJA affinis Hook. & Arn. ssp. affinis	c NCo (Mendocino Co.), n NCoRO (Humboldt Co.), s NCoRO, n CaRF, SNF, CW, SW	1be43b5c01
CASTILLEJA affinis Hook. & Arn. ssp. litoralis (Pennell) Chuang & Heckard	n&c NCo	0004000000
CASTILLEJA affinis Hook. & Arn. ssp. neglecta (E.M. Zeile) Chuang & Heckard	s NCoRI (Napa Co.), nw SnFrB (Marin Co.)	0010000800
CASTILLEJA ambigua Hook. & Arn.	NCo, s NCoR, n&c CCo	013c000000
CASTILLEJA ambigua Hook. & Arn. ssp. ambigua	NCo, s NCoR, n&c CCo	013c000000
CASTILLEJA ambigua Hook. & Arn. ssp. humboldtiensis (Keck) Chuang & Heckard	n NCo (Humboldt Bay), n CCo (Point Reyes)	0104000000
CASTILLEJA ambigua Hook. & Arn. ssp. insalutata (Jepson) Chuang & Heckard	c CCo (Monterey, San Luis Obispo cos.)	0100000000
CASTILLEJA angustifolia (Nutt.) G. Don	ne SnBr, GB, w DMoj	6002040406
CASTILLEJA applegatei Fern.	KR, NCoRH, NCoRI, CaR, SN, e SnFrB, SCoRI, SW, GB, DMtns	5edbfddd07
CASTILLEJA applegatei Fern. ssp. disticha (Eastw.) Chuang & Heckard	c&s SNH	0000800100
CASTILLEJA applegatei Fern. ssp. martinii (Abrams) Chuang & Heckard	NCoRI, e SnFrB, SCoRI, SW, SNE, DMtns	58d0055c03
CASTILLEJA applegatei Fern. ssp. pallida (Eastw.) Chuang & Heckard	SNH	0000c00100
CASTILLEJA applegatei Fern. ssp. pinetorum (Fern.) Chuang & Heckard	KR, NCoRH, CaR, SN, GB, n DMtns	460bfc8106
CASTILLEJA arachnoidea Greenman	KR, s CaRH, MP	0403000004
CASTILLEJA attenuata (A. Gray) Chuang & Heckard	CA-FP	1ffdfbff01
CASTILLEJA brevistyla (Hoover) Chuang & Heckard	s SNF, s SCoRI	0000210000
CASTILLEJA campestris (Benth.) Chuang & Heckard	s NCoRI, CaR, n SN, GV, MP	0612482204
CASTILLEJA campestris (Benth.) Chuang & Heckard ssp. campestris	s NCoRI, CaR, n SN, GV, MP	0612482204
CASTILLEJA campestris (Benth.) Chuang & Heckard ssp. succulenta (Hoover) Chuang & Heckard	s SNF, e SnJV	0000202000
CASTILLEJA chrymactis Pennell	n CCo (Point Reyes)	0100000000
CASTILLEJA cinerea A. Gray	SnBr	0000000400
CASTILLEJA densiflora (Benth.) Chuang & Heckard	NCoR, c SNF, s CCo, SCoR, SW	19f8135401
CASTILLEJA densiflora (Benth.) Chuang & Heckard ssp. densiflora	NCoR, c SNF, SCoR	0038130000
CASTILLEJA densiflora (Benth.) Chuang & Heckard ssp. gracilis (Benth.) Chuang & Heckard	SCoR, SW	18c0035401
CASTILLEJA densiflora (Benth.) Chuang & Heckard ssp. obispoensis (Keck) Chuang & Heckard	s CCo (San Luis Obispo Co.)	0100000000
CASTILLEJA exserta (A.A. Heller) Chuang & Heckard	NW, SNF, GV, CW, SW, w DMoj	79fd3b7e01
CASTILLEJA exserta (A.A. Heller) Chuang & Heckard ssp. exserta	NW, SNF, GV, CW, SW, w DMoj	79fd3b7e01
CASTILLEJA exserta (A.A. Heller) Chuang & Heckard ssp. latifolia (S. Watson) Chuang & Heckard	NCo, n&c CCo	0104000000
CASTILLEJA exserta (A.A. Heller) Chuang & Heckard ssp. venusta (A.A. Heller) Chuang & Heckard	w DMoj	6000000000
CASTILLEJA foliolosa Hook. & Arn.	NCoR, SNF, CW, s ChI (Santa Catalina Island)	11383b0800
CASTILLEJA grisea Dunkle	s ChI (San Clemente Island)	1000000000
CASTILLEJA hispida Benth. ssp. brevilobata (Piper) Chuang & Heckard	nw KR	0001000000
CASTILLEJA lacera (Benth.) Chuang & Heckard	CaR, n&c SN, MP	0602d80004
CASTILLEJA lanata A. Gray ssp. hololeuca (E. Greene) Chuang & Heckard	n ChI (all islands)	0800000000
CASTILLEJA lasiorhyncha (A. Gray) Chuang & Heckard	SnBr, n&c PR	0040000400
CASTILLEJA latifolia Hook. & Arn.	n&c CCo	0100000000
CASTILLEJA lemmonii A. Gray	CaRH, SNH	0400c00100
CASTILLEJA linariifolia Benth.	CaR, TR, GB, s edge DMoj	2602041407
CASTILLEJA lineariloba (Benth.) Chuang & Heckard	SNF	0000380000
CASTILLEJA mendocinensis (Eastw.) Pennell	c NCo (Mendocino Co.)	0004000000
CASTILLEJA miniata Hook.	NW, CaR, SNH, c-w CW, SW, GB	1fffc75d07
CASTILLEJA miniata Hook. ssp. elata (Piper) Munz	nw KR (Del Norte, Siskiyou cos.)	0001000000
CASTILLEJA miniata Hook. ssp. miniata	NW, CaR, SNH, c-w CW, SW, GB	1fffc75d07
CASTILLEJA minor (A. Gray) A. Gray	NCoR, SnJV, c&s SNF, CCo, n SnFrB, SCo, GB	01ba342806
CASTILLEJA minor (A. Gray) A. Gray ssp. minor	GB	0002040006
CASTILLEJA minor (A. Gray) A. Gray ssp. spiralis (Jepson) Chuang & Heckard	NCoR, c&s SNF, SnJV, CCo, n SnFrB, SCo	01b8302800
CASTILLEJA mollis Pennell	n ChI (Santa Rosa, e San Miguel islands)	0800000000
CASTILLEJA nana Eastw.	SNH, W&I	0000c00102
CASTILLEJA parviflora Bong.	CaRH, c&s SNH	0400800100
CASTILLEJA pilosa (S. Watson) Rydb.	n&c SNH, GB	0002c40006
CASTILLEJA plagiotoma A. Gray	s SN, s SnJV, SCoRI, TR, DMoj	6000213501
CASTILLEJA praeterita Heckard & Bacigal.	s SNH	0000000100
CASTILLEJA pruinosa Fern.	NW, CaR, n&c SN, SnGb, MP	063fd81004
CASTILLEJA rubicundula (Jepson) Chuang & Heckard	NCoR, SnFrB	0038000800
CASTILLEJA rubicundula (Jepson) Chuang & Heckard ssp. lithospermoides (Benth.) Chuang & Heckard	NCoR, SnFrB	0038000800
CASTILLEJA rubicundula (Jepson) Chuang & Heckard ssp. rubicundula	s NCoRI	0010000000
CASTILLEJA schizotricha Greenman	KR (Siskiyou Co.)	0001000000
CASTILLEJA subinclusa E. Greene	s NCo, SNF, Teh, n CCo, w SnFrB, SCoRI, WTR, SnGb, s PR	0144399801
CASTILLEJA subinclusa E. Greene ssp. franciscana (Pennell) Chuang & Heckard	s NCo (s Mendocino, Sonoma cos.), n CCo (to Santa Cruz Co.), w SnFrB	0104000800
CASTILLEJA subinclusa E. Greene ssp. subinclusa	SNF, Teh, SCoRI, WTR, SnGb, s PR	0040399001
CASTILLEJA tenuis (A.A. Heller) Chuang & Heckard	NCoR, CaR, SNH, MP, n SNE, rare in SnBr and PR	067ac40506
CASTILLEJA wightii Elmer	c&s NCo, n CCo, SnFrB	0104000800
CATHARANTHUS roseus (L.) G. Don	DSon (Borrego Springs, San Diego Co.)	8000000000
CAULANTHUS amplexicaulis S. Watson	s SCoRO, TR	0000021401
CAULANTHUS amplexicaulis S. Watson var. amplexicaulis	TR	0000001401
CAULANTHUS amplexicaulis S. Watson var. barbarae (J. Howell) Munz	s SCoRO (San Rafael Mtns)	0000020000
CAULANTHUS californicus (S. Watson) Payson	s SnJV	0000002000
CAULANTHUS cooperi (S. Watson) Payson	n TR, e PR, s SNE, D	e040041403
CAULANTHUS coulteri S. Watson	s SNF, Teh, sw SnJV, se SnFrB, e SCoRO, SCoRI, nw WTR, sw edge DMoj (Kern Co.)	200023a801
CAULANTHUS coulteri S. Watson var. coulteri	s SNF, Teh, se SCoRO, nw WTR, sw edge DMoj (Kern Co.)	2000228001
CAULANTHUS coulteri S. Watson var. lemmonii (S. Watson) Munz	sw SnJV, se SnFrB, e SCoRO, SCoRI	0000032800
CAULANTHUS crassicaulis (Torrey) S. Watson	W&I, n&c DMtns	4000000002
CAULANTHUS crassicaulis (Torrey) S. Watson var. crassicaulis	W&I, n&c DMtns	4000000002
CAULANTHUS crassicaulis (Torrey) S. Watson var. glaber M.E. Jones	e DMtns (Providence Mtns)	4000000000
CAULANTHUS glaucus S. Watson	W&I, n DMtns (Grapevine, Last Chance Mtns)	4000000002
CAULANTHUS hallii Payson	e PR, s DMtns (Little San Bernardino Mtns), w edge DSon	c040000000
CAULANTHUS heterophyllus (Nutt.) Payson	SCoRO (La Panza Range), SW	18c0025401
CAULANTHUS heterophyllus (Nutt.) Payson var. heterophyllus	e SCoRO (La Panza Range), SCo and s PR (common), ChI and TR (uncommon)	18c0021401
CAULANTHUS heterophyllus (Nutt.) Payson var. pseudosimulans R. Buck	TR, n PR	0040001401
CAULANTHUS inflatus S. Watson	s SNF (Kern Co.), c&s SnJV (w edge), SCoRI, n WTR (+/- uncommon in preceeding), sw DMoj (common)	6000212001
CAULANTHUS major (M.E. Jones) Payson	n SNH (Alpine Co.), SnGb, SnBr, s MP, e DMtns (Providence, New York mtns)	4002401404
CAULANTHUS major (M.E. Jones) Payson var. major	SnGb, SnBr, e DMtns (Providence, New York mtns)	4000001400
CAULANTHUS major (M.E. Jones) Payson var. nevadensis Rollins	n SNH (Alpine Co.), s MP	0002400004
CAULANTHUS pilosus S. Watson	c&s SNH (e slope), s MP (Honey Lake), SNE, n DMtns	4002840106
CAULANTHUS simulans Payson	e SCo (w Riverside Co.), e PR, w edge DSon	80c0000000
CAULOSTRAMINA jaegeri (Rollins) Rollins	s W&I (Inyo Mtns)	0000000002
CEANOTHUS arboreus E. Greene	ChI	1800000000
CEANOTHUS confusus J. Howell	s NCoR (esp Sonoma Co.)	0038000000
CEANOTHUS cordulatus Kellogg	KR, NCoR, SN, SnGb, SnBr, SnJt	0039f8d500
CEANOTHUS crassifolius Torrey	SCoRO (Santa Barbara Co.), TR, PR	0040025401
CEANOTHUS cuneatus (Hook.) Nutt.	CA-FP (exc GV)	1ffdfbdd01
CEANOTHUS cuneatus (Hook.) Nutt. var. cuneatus	CA-FP (exc GV)	1ffdfbdd01
CEANOTHUS cuneatus (Hook.) Nutt. var. fascicularis (McMinn) Hoover	s CCo (Santa Barbara, San Luis Obispo cos.)	0100000000
CEANOTHUS cuneatus (Hook.) Nutt. var. rigidus (Nutt.) Hoover	s SnFrB, CCo (near Hazard Canyon, San Luis Obispo Co.)	0100000800
CEANOTHUS cyaneus Eastw.	s PR (San Diego Co.)	0040000000
CEANOTHUS dentatus Torrey & A. Gray	CCo, SCoRO	0100020000
CEANOTHUS divergens C. Parry	NCoR	0038000000
CEANOTHUS diversifolius Kellogg	KR, NCoRH, CaRH, SNH, Teh	0409c08100
CEANOTHUS ferrisae McMinn	se SnFrB (Santa Clara Co.)	0000000800
CEANOTHUS foliosus C. Parry	NCoRO, SnFrB, SCoR, PR	0060034800
CEANOTHUS foliosus C. Parry var. foliosus	NCoRO, SnFrB, PR	0060004800
CEANOTHUS foliosus C. Parry var. medius McMinn	SnFrB, SCoR	0000030800
CEANOTHUS foliosus C. Parry var. vineatus McMinn	NCoRO	0020000000
CEANOTHUS fresnensis Abrams	c SN	0000900000
CEANOTHUS gloriosus J. Howell	NCo, NCoRO, CCo, SnFrB	0124000800
CEANOTHUS gloriosus J. Howell var. exaltatus J. Howell	NCo, NCoRO, n SnFrB	0024000800
CEANOTHUS gloriosus J. Howell var. gloriosus	s NCo, n CCo (Marin Co.)	0104000000
CEANOTHUS gloriosus J. Howell var. porrectus J. Howell	SnFrB (Point Reyes)	0000000800
CEANOTHUS greggii A. Gray	Teh, TR, PR, W&I, DMtns	404000d403
CEANOTHUS greggii A. Gray var. perplexans (Trel.) Jepson	SnBr, SnJt, PR	0040004400
CEANOTHUS greggii A. Gray var. vestitus (E. Greene) McMinn	Teh, TR, W&I, DMtns	4000009403
CEANOTHUS griseus (Trel.) McMinn	NCo, NCoRO, CCo, SnFrB, SCoRO	0124020800
CEANOTHUS hearstiorum Hoover & Roof	CCo (near Arroyo de la Cruz, San Luis Obispo Co.)	0100000000
CEANOTHUS impressus Trel.	CCo	0100000000
CEANOTHUS incanus Torrey & A. Gray	KR, NCoRO, SnFrB	0021000800
CEANOTHUS integerrimus Hook. & Arn.	KR, NCoR, CaR, SN, SnFrB, SCoR, TR, PR	0679fbdd01
CEANOTHUS jepsonii E. Greene	NCoR, SnFrB	0038000800
CEANOTHUS jepsonii E. Greene var. albiflorus J. Howell	NCoRH, NCoRI	0018000000
CEANOTHUS jepsonii E. Greene var. jepsonii	NCoRO, SnFrB	0020000800
CEANOTHUS lemmonii C. Parry	NCoRI, CaRF, n&c SNF	0210180000
CEANOTHUS leucodermis E. Greene	SNF, SnFrB, SCoR, TR, PR	00403b5c01
CEANOTHUS maritimus Hoover	CCo (Hearst Ranch, n San Luis Obispo Co.)	0100000000
CEANOTHUS masonii McMinn	SnFrB (Bolinas Ridge, sw Marin Co.)	0000000800
CEANOTHUS megacarpus Nutt.	CCo, SCoRO, ChI	1900020000
CEANOTHUS megacarpus Nutt. var. insularis (Eastw.) Munz	ChI	1800000000
CEANOTHUS megacarpus Nutt. var. megacarpus	CCo, SCoRO, s ChI (Catalina Island)	1100020000
CEANOTHUS oliganthus Nutt.	NCoR, SnFrB, SCoR, TR, PR	0078035c01
CEANOTHUS oliganthus Nutt. var. oliganthus	SCoR, TR, PR	0040035401
CEANOTHUS oliganthus Nutt. var. sorediatus (Hook. & Arn.) Hoover	NCoR, SnFrB, SCoR, TR	0038031c01
CEANOTHUS ophiochilus S. Boyd, T. Ross, & L. Arnseth	n PR (near Vail Lake, Riverside Co.)	0040000000
CEANOTHUS palmeri Trel.	c SNF, SnJt, PR	0040104000
CEANOTHUS papillosus Torrey & A. Gray	SnFrB, SCoR, WTR, PR	0040034801
CEANOTHUS papillosus Torrey & A. Gray var. papillosus	SnFrB, SCoRO	0000020800
CEANOTHUS papillosus Torrey & A. Gray var. roweanus McMinn	SCoR, WTR, nw PR (Orange Co.)	0040030001
CEANOTHUS parryi Trel.	NCoR	0038000000
CEANOTHUS parvifolius (S. Watson) Trel.	SNH	0000c00100
CEANOTHUS pinetorum Cov.	s SNH (Kern Plateau)	0000000100
CEANOTHUS prostratus Benth.	KR, NCoR, CaRH, n&c SNH, MP	043bc00004
CEANOTHUS pumilus E. Greene	KR, NCoRO, NCoRH	0029000000
CEANOTHUS purpureus Jepson	NCoRI	0010000000
CEANOTHUS roderickii W. Knight	n SNF (Pine Hill, w El Dorado Co.)	0000080000
CEANOTHUS sanguineus Pursh	KR	0001000000
CEANOTHUS sonomensis J. Howell	NCoRO (Hood Mtn Range, Sonoma & Napa cos.)	0020000000
CEANOTHUS spinosus Nutt.	SCoRO, WTR, PR	0040024001
CEANOTHUS thyrsiflorus Eschsch.	NCo, KR, NCoRO, SnFrB, SCoRO	0025020800
CEANOTHUS tomentosus C. Parry	n&c SN, SCo, SnBr, PR	00c0d84400
CEANOTHUS velutinus Dougl.	KR, NCoRO, CaRH, SNH, n SnFrB, Wrn, SNE (exc W&I).	0421c40904
CEANOTHUS velutinus Dougl. var. hookeri M. Johnston	KR, NCoRO, n SnFrB	0021000800
CEANOTHUS velutinus Dougl. var. velutinus	KR, CaRH, SNH, Wrn, SNE (exc W&I)	0401c40104
CEANOTHUS verrucosus Nutt.	s SCo (San Diego Co.)	0080000000
CELTIS reticulata Torrey	s SNF, Teh, SnBr, PR, s SNE, e DMtns	404024c402
CENCHRUS ciliaris L.	SCo (Los Angeles Co.)	0080000000
CENCHRUS echinatus L.	s ScV (Solano Co.), SCo (San Diego), DSon	8080000200
CENCHRUS incertus M. Curtis	GV, SCo, DMoj (near Daggett)	6080002200
CENCHRUS longispinus (Hackel) Fern.	s ScV, SnJV, SCo, MP (Lassen Co.), DMoj	6082002204
CENTAUREA X-pratensis Thuill.	NW, s SnFrB	003d000800
CENTAUREA calcitrapa L.	NW, s CaRF, SNF, GV, CW, SW	1bfd3b7e01
CENTAUREA cyanus L.	CA-FP, MP	1ffffbff05
CENTAUREA diffusa Lam.	NW, CaR, n&c SN, SCoR, MP, W&I	063fdb0006
CENTAUREA diluta Aiton	w CW, SCo	0180030800
CENTAUREA iberica Spreng.	s NCoRI, n&c SNF, c GV, CW, s SCo, PR	01d01b6a00
CENTAUREA maculosa Lam.	NW, CaR, SN, n ScV, n CW, MP, n SNE, s PR	077fff8b06
CENTAUREA melitensis L.	CA-FP, D (uncommon)	fffdfbff01
CENTAUREA nigra L.	NW, SnFrB	003d000800
CENTAUREA solstitialis L.	CA-FP, DMoj	7ffdfbff01
CENTAUREA squarrosa Willd.	KR, CaR, MP	0603000004
CENTAUREA sulphurea Willd.	c SNF, c GV, s SnFrB	0000102a00
CENTAURIUM calycosum (Buckley) Fern.	e DSon	8000000000
CENTAURIUM davyi (Jepson) Abrams	NCo, w CW, n ChI (Santa Cruz Island)	0904030800
CENTAURIUM erythraea Raf.	n&c NCo (esp near Crescent City, Eureka, Fort Bragg)	0004000000
CENTAURIUM exaltatum (Griseb.) Piper	SCoR, SnGb, PR, GB, DMoj, DSon (w edge)	e042075006
CENTAURIUM muehlenbergii (Griseb.) Piper	NW (esp Humboldt Co.), CaRF, n SNF, s ScV, n SnJV, n&c CW, n MP	033f0b2a04
CENTAURIUM trichanthum (Griseb.) Robinson	NCoRI, SnFrB	0010000800
CENTAURIUM venustum (A. Gray) Robinson	e KR, NCoRI, s NCoRO, CaRF, SNF, e SnJV, SW (exc n ChI, esp San Diego Co.), DMoj	72f1387401
CENTRANTHUS ruber (L.) DC.	s NCo, GV, CCo, SnFrB, cult elsewhere	0104002a00
CENTROSTEGIA thurberi Benth.	s SnJV, e SCoRI, TR, SNE, D	e000053403
CENTUNCULUS minimus L.	NCo, n SNF (Calaveras Co.), CCo, SnFrB, SCo	0184080800
CEPHALANTHERA austiniae (A. Gray) A.A. Heller	NW, CaR, SNH, SnFrB, n SCoRO, SnBr, PR	067dc24d00
CEPHALANTHUS occidentalis L. var. californicus Benth.	NCoRI, SNF, ScV, SnJV (common)	0010382200
CERASTIUM arvense L.	NCo, KR, NCoRO, c SNF, n&c SNH, CCo	0125d00000
CERASTIUM beeringianum Cham. & Schldl. var. capillare Fern. & Wieg.	c SNH, W&I	0000800002
CERASTIUM dichotomum L.	e KR (Siskiyou Co.)	0001000000
CERASTIUM fontanum Baumg. ssp. vulgare (Hartman) Greuter & Burdet	NW, CaRH, c SNF, n&c SNH	043dd00000
CERASTIUM glomeratum Thuill.	CA-FP (exc s SNH)	1ffdfbfe01
CERATOPHYLLUM demersum L.	CA	ffffffff07
CERCIDIUM floridum A. Gray ssp. floridum	DSon	8000000000
CERCIDIUM microphyllum (Torrey) Rose & I.M. Johnston	DMoj	6000000000
CERCIS occidentalis Torrey	NW, CaR, SN, SnJV, PR	067df8e100
CERCOCARPUS betuloides Torrey & A. Gray	NW, CaR, SN, CW, ChI, TR, PR, MP	1f7ffbdd05
CERCOCARPUS betuloides Torrey & A. Gray var. betuloides	NW, CaR, SN, CW, TR, PR, MP	077ffbdd05
CERCOCARPUS betuloides Torrey & A. Gray var. blancheae (C. Schneider) Little	ChI (exc San Clemente Island), s WTR	1800000001
CERCOCARPUS betuloides Torrey & A. Gray var. macrourus (Rydb.) Jepson	KR, CaR, MP	0603000004
CERCOCARPUS intricatus S. Watson	s SNH, SNE, DMtns	4000040102
CERCOCARPUS ledifolius Nutt.	KR, NCoRH, CaRH, SNH, Teh, TR, n PR, GB, DMtns	444bc49507
CERCOCARPUS ledifolius Nutt. var. intermontanus N. Holmgren	KR, NCoRH, CaRH, SNH, Teh, TR, n PR, GB, DMtns	444bc49507
CERCOCARPUS ledifolius Nutt. var. ledifolius	s SNH	0000000100
CERCOCARPUS minutiflorus Abrams	s PR (San Diego Co.)	0040000000
CERCOCARPUS traskiae Eastw.	s ChI (Santa Catalina Island)	1000000000
CESTRUM fasciculatum (Schldl.) Miers	n NCo, SnFrB, expected elsewhere	0004000800
CHAENACTIS alpigena Sharsm.	c&s SNH, W&I (n White Mtns.)	0000800102
CHAENACTIS artemisiifolia (A. Gray) A. Gray	TR, PR	0040005401
CHAENACTIS carphoclinia A. Gray	e PR, SNE, D	e040040002
CHAENACTIS carphoclinia A. Gray var. carphoclinia	SNE, D	e000040002
CHAENACTIS carphoclinia A. Gray var. peirsonii (Jepson) Munz	e PR (e Santa Rosa Mtns), adjacent w DSon?	8040000000
CHAENACTIS douglasii (Hook.) Hook. & Arn.	NW, CaR, SN, GB, n DMtns	463ffc8106
CHAENACTIS douglasii (Hook.) Hook. & Arn. var. alpina A. Gray	n SNH (Alpine, El Dorado cos., esp Freel Peak area), n DMtns (Panamint Mtns)	4000400000
CHAENACTIS douglasii (Hook.) Hook. & Arn. var. douglasii	NW, CaR, SN, GB, n DMtns	463ffc8106
CHAENACTIS fremontii A. Gray	Teh, s SnJV, SCoRI, more common in s SNE, D	e00005a002
CHAENACTIS glabriuscula DC.	NCoR, SNF, Teh, GV, CW, SW, w edge D	b9f83bfe01
CHAENACTIS glabriuscula DC. var. glabriuscula	s SNF, Teh, CW, SW, w edge D	b9c023dc01
CHAENACTIS glabriuscula DC. var. heterocarpha (A. Gray) H.M. Hall	NCoR, SNF, GV, CW, most common n	01383b2a00
CHAENACTIS glabriuscula DC. var. lanosa (DC.) H.M. Hall	SCoRI, SCo, TR, nw edge DSon	8080011401
CHAENACTIS glabriuscula DC. var. megacephala A. Gray	s SNF, Teh, SnJV, CW, n SW	19c023fc01
CHAENACTIS glabriuscula DC. var. orcuttiana (E. Greene) H.M. Hall	SCo	0080000000
CHAENACTIS macrantha D. Eaton	GB, n DMoj	2002040006
CHAENACTIS nevadensis (Kellogg) A. Gray	CaRH, n SNH	0400400000
CHAENACTIS parishii A. Gray	PR	0040004000
CHAENACTIS santolinoides E. Greene	s-most SN, TR	0000f89501
CHAENACTIS stevioides Hook. & Arn.	SCoRI, SNE, D	e000050002
CHAENACTIS suffrutescens A. Gray	KR, CaR	0601000000
CHAENACTIS xantiana A. Gray	s SN, SCoR, TR, GB, w DMoj	6002271507
CHAETADELPHA wheeleri A. Gray	W&I, n DMoj (Eureka Valley)	2000000002
CHAETOPAPPA ericoides (Torrey) G. Nesom	SN (e slope), W&I, DMtns	4000f88102
CHAMAEBATIA australis (Brandegee) Abrams	s PR	0040000000
CHAMAEBATIA foliolosa Benth.	CaR, SN	0600f88100
CHAMAEBATIARIA millefolium (Torrey) Maxim.	KR, CaR, SN (e slope), GB, ne DMtns	4603fc8106
CHAMAECYTISUS proliferus (L.) Link	CCo, SnFrB	0100000800
CHAMAEMELUM fuscatum (Brot.) Carv. Vasc.	s NCoRO (Sonoma Co.)	0020000000
CHAMAEMELUM nobile (L.) All.	NCo, expected more widely	0004000000
CHAMAESARACHA coronopus (Dunal) A. Gray	e DMtns (New York Mtns)	4000000000
CHAMAESARACHA nana (A. Gray) A. Gray	CaR, SNH, GB	0602c40106
CHAMAESYCE abramsiana (Wheeler) Koutnik	DSon	8000000000
CHAMAESYCE albomarginata (Torrey & A. Gray) Small	s SnJV, SW, D	f8c0007401
CHAMAESYCE arizonica (Engelm.) J.C. Arthur	DSon	8000000000
CHAMAESYCE fendleri (Torrey & A. Gray) Small	W&I, DMtns	4000000002
CHAMAESYCE glyptosperma (Engelm.) Small	n CaRF (near Redding)	0200000000
CHAMAESYCE hooveri (Wheeler) Koutnik	GV (Butte, Tehama, Tulare cos.)	0000002200
CHAMAESYCE maculata (L.) Small	CA-FP, DSon	9ffdfbff01
CHAMAESYCE melanadenia (Torrey) Millsp.	SW, DSon	98c0005401
CHAMAESYCE micromera (Engelm.) Wooton & Standley	D	e000000000
CHAMAESYCE nutans (Lagasca) Small	GV, CW, SW, DSon	99c0037e01
CHAMAESYCE ocellata (Durand & Hilg.) Millsp.	CA-FP, D	fffdfbff01
CHAMAESYCE ocellata (Durand & Hilg.) Millsp. ssp. arenicola (Parish) Thorne	D	e000000000
CHAMAESYCE ocellata (Durand & Hilg.) Millsp. ssp. ocellata	CA-FP (exc PR)	1ffdfbbf01
CHAMAESYCE ocellata (Durand & Hilg.) Millsp. ssp. rattanii (S. Watson) Koutnik	n ScV (Glenn, Tehama cos.)	0000000200
CHAMAESYCE parishii (E. Greene) Millsp.	D	e000000000
CHAMAESYCE parryi (Engelm.) Rydb.	DMoj	6000000000
CHAMAESYCE pediculifera (Engelm.) Rose & Standley	DSon	8000000000
CHAMAESYCE platysperma (S. Watson) Shinn.	DSon (Coachella Valley)	8000000000
CHAMAESYCE polycarpa (Benth.) Millsp.	SW, D	f8c0005401
CHAMAESYCE prostrata (Aiton) Small	s CA-FP	1ffdfbff01
CHAMAESYCE revoluta (Engelm.) Small	PR, D	e040004000
CHAMAESYCE serpens (Kunth) Small	SnJV, s SCoR, SW (expected elsewhere)	18c0037401
CHAMAESYCE serpyllifolia (Pers.) Small	CA	ffffffff07
CHAMAESYCE serpyllifolia (Pers.) Small ssp. hirtula (S. Watson) Koutnik	c SN, SW	18c0905401
CHAMAESYCE serpyllifolia (Pers.) Small ssp. serpyllifolia	CA	ffffffff07
CHAMAESYCE setiloba (Torrey) Millsp.	D	e000000000
CHAMAESYCE vallis-mortae Millsp.	SNE, DMoj	6000040002
CHAMOMILLA occidentalis (E. Greene) Rydb.	NCoRO, CaRH, SNH, SnJV, SnFrB, SCoRO, SCo	04a0c22900
CHAMOMILLA suaveolens (Pursh) Rydb.	KR, NCoR, CaRH, SN, GV, w CW, SCo	05b9fbab00
CHASMANTHE floribunda (Salisb.) N.E. Br.	CCo, SnFrB	0100000800
CHEILANTHES clevelandii D. Eaton	n ChI, PR	0840004000
CHEILANTHES cooperae D. Eaton	SN, SnFrB, TR	0000f89d01
CHEILANTHES covillei Maxon	NCoR, SN, SnFrB, SCoR, TR, PR, SNE, DMtns	4078ffdd03
CHEILANTHES feei T. Moore	W&I, DMtns	4000000002
CHEILANTHES gracillima D. Eaton	NW, CaR, SN, CW, SNE	073dff8902
CHEILANTHES intertexta (Maxon) Maxon	NCoRO, NCoRH, SNH, SnFrB, SCoR, W&I	0028c30902
CHEILANTHES newberryi (D. Eaton) Domin	SW	18c0005401
CHEILANTHES parryi (D. Eaton) Domin	PR, SNE, D	e040044002
CHEILANTHES viscida Davenp.	e edge SnBr, SnJt, e PR, DMtns, w edge DSon	c040000400
CHEILANTHES wootonii Maxon	SNE, DMtns	4000040002
CHENOPODIUM album L.	CA	ffffffff07
CHENOPODIUM ambrosioides L.	CA-FP	1ffdfbff01
CHENOPODIUM atrovirens Rydb.	NW, CaR, SN, SnBr, PR, GB, n DMoj	267ffcc506
CHENOPODIUM berlandieri Moq.	CA	ffffffff07
CHENOPODIUM botrys L.	Most of CA	ffffffff07
CHENOPODIUM californicum (S. Watson) S. Watson	s NCo, NCoRO, c&s SNF, Teh, GV, CW, SW, s SNE, w DMoj	79e437fe03
CHENOPODIUM carnosulum Moq. var. patagonicum (Philippi) Wahl	s CCo, n SCo	0180000000
CHENOPODIUM chenopodioides (L.) Aellen	NCoRO, SN, SnBr, PR, MP, expected elsewhere	0062f8c504
CHENOPODIUM desiccatum Nelson	SN, SnJV, GB, n DMoj	2002fca106
CHENOPODIUM foliosum (Moench) Asch.	NCoR, CaRF, c SNH, TR, GB, w DMoj	623a841407
CHENOPODIUM fremontii S. Watson	SN, TR, PR, GB, DMtns	4042fcd507
CHENOPODIUM glaucum L.	CaR, SNH (e slope), SnBr, GB, expected elsewhere	0602c40506
CHENOPODIUM hians Standley	SN, SCoRI, TR, PR, GB	0042fdd507
CHENOPODIUM incanum (S. Watson) A.A. Heller var. occidentale D.J. Crawford	SNH (e slope), GB, DMoj	6002c40106
CHENOPODIUM incognitum Wahl	NW, CaR, SN, SCoR, TR, PR, MP	067ffbd505
CHENOPODIUM leptophyllum Moq.	s NCoRH, c&s SN, W&I, n DMoj	2008b00102
CHENOPODIUM macrospermum Hook. f. var. halophilum (Philippi) Standley	NCo, deltaic GV, CCo, SnFrB, SCo	0184002a00
CHENOPODIUM missouriense Aellen	n SNF, s SN, SnJV, SCo, PR	00c0286100
CHENOPODIUM multifidum L.	NW, c SNF, CW, SCo, ChI (San Nicolas, Santa Rosa islands), s WTR	19bd130801
CHENOPODIUM murale L.	CA-FP, D (uncommon)	fffdfbff01
CHENOPODIUM nevadense Standley	c SNH (e slope), SNE	0000840002
CHENOPODIUM pratericola Rydb.	CaR, SN, GV, e SnFrB, SCoR, WTR, SNE, D	e600ffab03
CHENOPODIUM pumilio R. Br.	KR, NCoR, CaR, SN, GV, SnFrB, SCo, TR, w PR, MP	06fbf8bf05
CHENOPODIUM rubrum L.	NCoRO, CaR, Teh, GV, CCo, SnFrB, SCo, GB, DMoj	67a204aa06
CHENOPODIUM simplex (Torrey) Raf.	n SN, MP, W&I	0002480006
CHENOPODIUM strictum Roth var. glaucophyllum (Aellen) Wahl	CaRF, SN, GV, SnFrB, SCoRO, SCo, SnBr, DMtns (uncommon)	4280faaf00
CHENOPODIUM vulvaria L.	CaRF, s SN, GV, CW, WTR	0300232b01
CHILOPSIS linearis (Cav.) Sweet ssp. arcuata (Fosb.) Henrickson	D, adjacent TR, PR	e040005401
CHIMAPHILA menziesii (D. Don) Sprengel	KR, NCoR, CaRH, SNH, SCoRO, SnBr, SnGb, PR	0479c25500
CHIMAPHILA umbellata (L.) Bartram	NCoR, SN, SnBr, SnJt	0038f8c500
CHLORACANTHA spinosa (Benth.) G. Nesom var. spinosa	PR, DSon	8040004000
CHLORIS gayana Kunth	SnJV, SCo, expected elsewhere	0080002000
CHLORIS truncata R. Br.	SCo (Riverside Co.)	0080000000
CHLORIS verticillata Nutt.	SnFrB, expected elsewhere	0000000800
CHLORIS virgata Sw.	GV, SCo, D	e080002200
CHLOROGALUM angustifolium Kellogg	n&c NCoRI, SNF (esp n&c)	0010380000
CHLOROGALUM grandiflorum Hoover	n SNF (Placer, El Dorado cos.), c SNF (Tuolumne Co.)	0000180000
CHLOROGALUM parviflorum S. Watson	c&s SCo	0080000000
CHLOROGALUM pomeridianum (DC.) Kunth	w CA-FP	1ffdfbff01
CHLOROGALUM pomeridianum (DC.) Kunth var. divaricatum (Lindley) Hoover	s NCo, CCo	0104000000
CHLOROGALUM pomeridianum (DC.) Kunth var. minus Hoover	NCoRI, SnFrB, SCoRO	0010020800
CHLOROGALUM pomeridianum (DC.) Kunth var. pomeridianum	NW, SNF, w GV, CW, SW	19fd3b7e01
CHLOROGALUM purpureum Brandegee	e SCoRO	0000020000
CHLOROGALUM purpureum Brandegee var. purpureum	ne SCoRO (e side Santa Lucia Mtns, Monterey Co.)	0000020000
CHLOROGALUM purpureum Brandegee var. reductum Hoover	se SCoRO (ne La Panza Range, San Luis Obispo Co.)	0000020000
CHONDRILLA juncea L.	NCo, n SN, GV, SnFrB, SCoRO, n SCo	00844a2a00
CHORISPORA tenella (Pallas) DC.	CaR, GV, SCo, GB	0682042206
CHORIZANTHE angustifolia Nutt.	s CCo (San Luis Obispo, Santa Barbara cos.)	0100000000
CHORIZANTHE biloba Goodman	SCoR	0000030000
CHORIZANTHE biloba Goodman var. biloba	e SCoRO, w SCoRI (e SCoRI near Parkfield Grade, w Fresno Co.)	0000030000
CHORIZANTHE biloba Goodman var. immemora Rev. & Hardham	e SCoRI (se San Benito, adjacent Monterey cos)	0000010000
CHORIZANTHE blakleyi Hardham	WTR (n slope, Sierra Madre Mtns, Santa Barbara Co.)	0000000001
CHORIZANTHE brevicornu Torrey	SNE, D	e000040002
CHORIZANTHE brevicornu Torrey var. brevicornu	s SNE, D	e000040002
CHORIZANTHE brevicornu Torrey var. spathulata (Rydb.) C. Hitchc.	SNE, DMtns	4000040002
CHORIZANTHE breweri S. Watson	SCoRO (sw San Luis Obispo Co.)	0000020000
CHORIZANTHE clevelandii C. Parry	NW, CW, s SN, Teh, n WTR	013d238901
CHORIZANTHE corrugata (Torrey) Torrey & A. Gray	D	e000000000
CHORIZANTHE cuspidata S. Watson	n CCo, SnFrB	0100000800
CHORIZANTHE diffusa Benth.	CCo, w SnFrB, w SCoRO	0100020800
CHORIZANTHE douglasii Benth.	e SCoRO, SCoRI	0000030000
CHORIZANTHE fimbriata Nutt.	PR	0040004000
CHORIZANTHE fimbriata Nutt. var. fimbriata	w PR	0040000000
CHORIZANTHE fimbriata Nutt. var. laciniata (Torrey) Jepson	e PR	0040000000
CHORIZANTHE howellii Goodman	c NCo (c Mendocino Co.)	0004000000
CHORIZANTHE leptotheca Goodman	e PR	0040000000
CHORIZANTHE membranacea Benth.	NW, CaR, SNF, Teh, GV, CW, n WTR	073d3baa01
CHORIZANTHE obovata Goodman	s SCoRO	0000020000
CHORIZANTHE orcuttiana C. Parry	s SCo (Del Mar to Point Loma, San Diego Co.)	0080000000
CHORIZANTHE palmeri S. Watson	SCoRO (w Monterey, w San Luis Obispo cos.)	0000020000
CHORIZANTHE parryi S. Watson	SCo, e TR, nw edge DSon	8080001401
CHORIZANTHE parryi S. Watson var. fernandina (S. Watson) Jepson	SCo, e WTR, SnGb	0080001001
CHORIZANTHE parryi S. Watson var. parryi	c&e SCo, e TR, nw edge DSon	8080001401
CHORIZANTHE polygonoides Torrey & A. Gray	NW, CaR, n SNF, ScV, CW, PR	077d0b4a00
CHORIZANTHE polygonoides Torrey & A. Gray var. longispina (Goodman) Munz	PR	0040004000
CHORIZANTHE polygonoides Torrey & A. Gray var. polygonoides	NW, CaR, n SNF, ScV, CW	073d0b0a00
CHORIZANTHE procumbens Nutt.	c&s SCo, s TR, w PR	00c0001401
CHORIZANTHE pungens Benth.	n&c CCo, SnFrB	0100000800
CHORIZANTHE rectispina Goodman	SCoRO (s Monterey, San Luis Obispo cos.)	0000020000
CHORIZANTHE rigida (Torrey) Torrey & A. Gray	SNE, D	e000040002
CHORIZANTHE robusta C. Parry	n-c CCo, sw SnFrB (s San Mateo, Santa Cruz, n Monterey cos., extirpated in Alameda Co.)	0100000800
CHORIZANTHE spinosa S. Watson	w DMoj	6000000000
CHORIZANTHE staticoides Benth.	c&s CCo, SCoRO, SW (exc e PR)	19c0021401
CHORIZANTHE stellulata Benth.	NCoRI, CaRF, SNF, e SnFrB	0210380800
CHORIZANTHE uniaristata Torrey & A. Gray	e CW, s SN, n WTR	0100230901
CHORIZANTHE valida S. Watson	n CCo (Point Reyes Peninsula, Marin Co.)	0100000000
CHORIZANTHE ventricosa Goodman	SCoRI (s San Benito, se Monterey, ne San Luis Obispo, w Fresno cos.)	0000010000
CHORIZANTHE watsonii Torrey & A. Gray	sw SnJV, n edge TR, GB, w DMoj	6002043407
CHORIZANTHE wheeleri S. Watson	n ChI (Santa Cruz, Santa Rosa Islands)	0800000000
CHORIZANTHE xanti S. Watson	s SN, Teh, s SCoRI, n&e TR, SnJt, SNE (s Mono Co.)	000025d503
CHORIZANTHE xanti S. Watson var. leucotheca Goodman	e SnBr, n SnJt	0000004400
CHORIZANTHE xanti S. Watson var. xanti	s SN, Teh, s SCoRI, n&e TR, SnJt, SNE (s Mono Co.)	000025d503
CHRYSANTHEMUM carinatum Schousboe	CCo, SCo	0180000000
CHRYSANTHEMUM coronarium L.	CCo, SCo, expected more widely	0180000000
CHRYSANTHEMUM segetum L.	NCo, NCoRO, n CW, expected more widely	0124030800
CHRYSOLEPIS chrysophylla (Hook.) Hjelmq.	NW, n CaR, n SNH (El Dorado Co.), CW (exc SCoRI)	073d420800
CHRYSOLEPIS chrysophylla (Hook.) Hjelmq. var. chrysophylla	NW, n CaR, n SNH (El Dorado Co.), CW (exc SCoRI, SCoRO)	073d400800
CHRYSOLEPIS chrysophylla (Hook.) Hjelmq. var. minor (Benth.) Munz	NW, CW (exc SCoRI)	013d020800
CHRYSOLEPIS sempervirens (Kellogg) Hjelmq.	KR, NCoRH, CaRH, SNH, SnGb, SnBr, SnJt, w MP	040bc05504
CHRYSOSPLENIUM glechomifolium Nutt.	NCo	0004000000
CHRYSOTHAMNUS albidus (A. Gray) E. Greene	SNE, n DMoj	2000040002
CHRYSOTHAMNUS depressus Nutt.	DMtns	4000000000
CHRYSOTHAMNUS gramineus H.M. Hall	s W&I, n DMtns (Panamint Mtns)	4000000002
CHRYSOTHAMNUS greenei (A. Gray) E. Greene	SNE (Fish Lake Valley), n DMtns (Cottonwood Mtns)	4000040002
CHRYSOTHAMNUS humilis E. Greene	ne SNH, MP	0002400004
CHRYSOTHAMNUS nauseosus (Pallas) Britton	NW, CaR, SN, SCoR, TR, PR, GB, DMoj	667fffd507
CHRYSOTHAMNUS nauseosus (Pallas) Britton ssp. albicaulis (Nutt.) H.M. Hall & Clements	NW, CaR, SN, W&I	063df88102
CHRYSOTHAMNUS nauseosus (Pallas) Britton ssp. bernardinus (H.M. Hall) H.M. Hall & Clements	s SN, TR, n PR, W&I	0040201503
CHRYSOTHAMNUS nauseosus (Pallas) Britton ssp. ceruminosus (Durand & Hilg.) H.M. Hall & Clements	DMoj	6000000000
CHRYSOTHAMNUS nauseosus (Pallas) Britton ssp. consimilis (E. Greene) H.M. Hall & Clements	SN (e slope) Teh, s SCoRI, SnBr, PR, GB	0042fdc506
CHRYSOTHAMNUS nauseosus (Pallas) Britton ssp. hololeucus (A. Gray) H.M. Hall & Clements	SNH, Teh, SCoRO, WTR, SNE, DMtns	4000c68103
CHRYSOTHAMNUS nauseosus (Pallas) Britton ssp. leiospermus (A. Gray) H.M. Hall & Clements	SNE, DMtns	4000040002
CHRYSOTHAMNUS nauseosus (Pallas) Britton ssp. mohavensis (E. Greene) H.M. Hall & Clements	SCoRO, TR, DMoj	6000021401
CHRYSOTHAMNUS nauseosus (Pallas) Britton ssp. washoensis L. Anderson	MP	0002000004
CHRYSOTHAMNUS paniculatus (A. Gray) H.M. Hall	W&I, D	e000000002
CHRYSOTHAMNUS parryi (A. Gray) E. Greene	KR, NCoR, CaR, SNH, SnBr, GB, DMtns	463bc40506
CHRYSOTHAMNUS parryi (A. Gray) E. Greene ssp. asper (E. Greene) H.M. Hall & Clements	c&s SNH, SnBr, SNE, DMtns	4000840502
CHRYSOTHAMNUS parryi (A. Gray) E. Greene ssp. imulus H.M. Hall & Clements	SnBr (Bear Valley)	0000000400
CHRYSOTHAMNUS parryi (A. Gray) E. Greene ssp. latior H.M. Hall & Clements	KR, NCoR, CaR	0639000000
CHRYSOTHAMNUS parryi (A. Gray) E. Greene ssp. monocephalus (Nelson & Kenn.) H.M. Hall & Clements	c SNH, n SNE (Sweetwater Mtns)	0000840000
CHRYSOTHAMNUS parryi (A. Gray) E. Greene ssp. nevadensis (A. Gray) H.M. Hall & Clements	n&c SNH, GB	0002c40006
CHRYSOTHAMNUS parryi (A. Gray) E. Greene ssp. vulcanicus (E. Greene) H.M. Hall & Clements	c&s SNH	0000800100
CHRYSOTHAMNUS teretifolius (Durand & Hilg.) H.M. Hall	Teh, TR, SnJt, SNE, DMoj	600004d403
CHRYSOTHAMNUS viscidiflorus (Hook.) Nutt.	KR, CaR, SN, n WTR, SnGb, GB, DMtns	4603fc9107
CHRYSOTHAMNUS viscidiflorus (Hook.) Nutt. ssp. axillaris (Keck) L. Anderson	s W&I, ne DMtns	4000000002
CHRYSOTHAMNUS viscidiflorus (Hook.) Nutt. ssp. lanceolatus (Nutt.) H.M. Hall & Clements	c SNH, MP	0002800004
CHRYSOTHAMNUS viscidiflorus (Hook.) Nutt. ssp. puberulus (D.C. Eaton) H.M. Hall & Clements	SN (e slope), SnBr, GB, DMtns	4002fc8506
CHRYSOTHAMNUS viscidiflorus (Hook.) Nutt. ssp. viscidiflorus	KR, CaR, SN, n WTR, SnBr, GB, s DMtns	4603fc8507
CICENDIA quadrangularis (Lam.) Griseb.	NCo, NCoRO, c SNF, GV, CCo, SnFrB	0124102a00
CICHORIUM endiva L.	SnFrB, SCoRI (Salinas Valley)	0000010800
CICHORIUM intybus L.	CA-FP, n DMtns (Panamint Mtns)	5ffdfbff01
CICLOSPERMUM leptophyllum (Pers.) Britton & E. Wilson	CA	ffffffff07
CICUTA douglasii (DC.) J. Coulter & Rose	NCo, CaRH, SNH, CCo, SCo, GB	0586c40106
CICUTA maculata L.	s ScV (Suisun Marshes), CCo, SCo, SnBr, GB	0182040606
CICUTA maculata L. var. angustifolia Hook.	SnBr, GB	0002040406
CICUTA maculata L. var. bolanderi (S. Watson) Mulligan	s ScV (Suisun Marshes), CCo, SCo	0180000200
CINNA bolanderi Scribner	c&s SNH	0000800100
CINNA latifolia (Goeppert) Griseb.	KR, NCoR, CaRH, n&c SNH	0439c00000
CIRCAEA alpina L. ssp. pacifica (Asch. & Magnus) Raven	NW, CaR, n SNF, SNH, SnFrB, SnBr, Wrn	063dc80d04
CIRSIUM andersonii (A. Gray) Jepson	KR, CaR, SN	0601f88100
CIRSIUM andrewsii A. Gray	s NCo, n CCo	0104000000
CIRSIUM arizonicum (A. Gray) Petrak	s SNH, W&I	0000000102
CIRSIUM arvense (L.) Scop.	CA-FP (exc SnJV, s SN), SNE, w DMoj	7ffddfde03
CIRSIUM brevistylum Cronq.	NCo, NCoRO, CCo, SnFrB, SCo	01a4000800
CIRSIUM canovirens Rydb.	e SNH, MP, n SNE	0002c40104
CIRSIUM ciliolatum (L. Henderson) J. Howell	KR	0001000000
CIRSIUM crassicaule (E. Greene) Jepson	SnJV	0000002000
CIRSIUM cymosum (E. Greene) Jepson	KR, NCoR, CaR, n&s SN, SnFrB, n SCoRI, MP	063b690904
CIRSIUM douglasii DC.	NCo, KR, NCoR, CaR, n SN, n CCo, SnFrB, n SCoR, MP	073f4b0804
CIRSIUM douglasii DC. var. breweri (A. Gray) Keil & C. Turner	KR, n NCoR, CaR, n SN, MP	063b480004
CIRSIUM douglasii DC. var. douglasii	NCo, NCoR, n CCo, SnFrB, n SCoR	013c030800
CIRSIUM fontinale E. Greene	SnFrB, c SCoRO	0000020800
CIRSIUM fontinale E. Greene var. campylon (H. Sharsm.) Keil & C. Turner	e SnFrB	0000000800
CIRSIUM fontinale E. Greene var. fontinale	sw SnFrB (San Mateo Co.)	0000000800
CIRSIUM fontinale E. Greene var. obispoense J. Howell	c SCoRO (San Luis Obispo Co.)	0000020000
CIRSIUM hydrophilum (E. Greene) Jepson	Deltaic GV, n SnFrB	0000002a00
CIRSIUM hydrophilum (E. Greene) Jepson var. hydrophilum	Deltaic GV (Suisun Marsh, Solano Co.)	0000002200
CIRSIUM hydrophilum (E. Greene) Jepson var. vaseyi (A. Gray) J. Howell	n SnFrB (Mount Tamalpais)	0000000800
CIRSIUM loncholepis Petrak	s CCo (s San Luis Obispo, n Santa Barbara cos.)	0100000000
CIRSIUM mohavense (E. Greene) Petrak	SNE, DMoj	6000040002
CIRSIUM neomexicanum A. Gray	e DMoj	6000000000
CIRSIUM nidulum (M.E. Jones) Petrak	e DMtns (Clark, New York Mtns)	4000000000
CIRSIUM occidentale (Nutt.) Jepson	CA-FP (exc SnJV), MP, W&I, w DMoj	7ffffbdf07
CIRSIUM occidentale (Nutt.) Jepson var. californicum (A. Gray) Keil & C. Turner	SN, c&s SCoR, SW	18c0fbd501
CIRSIUM occidentale (Nutt.) Jepson var. candidissimum (E. Greene) J.F. Macbr.	KR, NCoR, CaR, n SN, MP	063b480004
CIRSIUM occidentale (Nutt.) Jepson var. compactum Hoover	CCo (n San Luis Obispo, Monterey cos., formerly San Francisco)	0100000000
CIRSIUM occidentale (Nutt.) Jepson var. occidentale	s NCo, CW, SW	19c4035c01
CIRSIUM occidentale (Nutt.) Jepson var. venustum (E. Greene) Jepson	NCoR, s SN, ScV, SnFrB, SCoR, WTR, W&I, w DMoj	6038230b03
CIRSIUM ochrocentrum A. Gray	n NCo, KR, e SN, n ChI, TR, PR, MP, W&I	0847f8d507
CIRSIUM quercetorum (A. Gray) Jepson	c&s NCo, NCoRO, n&c CCo, SnFrB, n SCoRO	0124020800
CIRSIUM remotifolium (Hook.) DC.	NW, n CCo, SnFrB	013d000800
CIRSIUM rhothophilum S.F. Blake	s CCo (s San Luis Obispo and n Santa Barbara cos.)	0100000000
CIRSIUM scariosum Nutt.	KR, CaR, SN, SCoR (very uncommon), TR, PR, GB	0643ffd507
CIRSIUM undulatum (Nutt.) Spreng.	s CaR, SnFrB, s SCoRO, SCo, MP	0682020804
CIRSIUM vulgare (Savi) Ten.	CA-FP, GB	1fffffff07
CISTUS creticus L.	n&s CCo, n SCo	0180000000
CISTUS ladanifer L.	s CCo, SnGb	0100001000
CISTUS monspeliensis L.	NCo	0004000000
CISTUS salvifolius L.	s CCo	0100000000
CITRULLUS colocynthis (L.) Schrader var. lanatus (Thunb.) Matsum. & Nakai	CA-FP	1ffdfbff01
CLADIUM californicum (S. Watson) O'Neill	s CCo, SCoRO, SCo, WTR, D	e180020001
CLARKIA affinis Harlan Lewis & M. Lewis	NCoRI, c SNF, SnFrB, SCoR, WTR	0010130801
CLARKIA amoena (Lehm.) Nelson & J.F. Macbr.	NCo, KR, NCoRO, n SnFrB	0025000800
CLARKIA amoena (Lehm.) Nelson & J.F. Macbr. ssp. amoena	NCo	0004000000
CLARKIA amoena (Lehm.) Nelson & J.F. Macbr. ssp. huntiana (Jepson) Harlan Lewis & M. Lewis	KR, NCoRO, n SnFrB	0021000800
CLARKIA amoena (Lehm.) Nelson & J.F. Macbr. ssp. whitneyi (A. Gray) Harlan Lewis & M. Lewis	NCo (formerly n of Fort Bragg to Shelter Cove, Humboldt, Mendocino cos.)	0004000000
CLARKIA arcuata (Kellogg) Nelson & J.F. Macbr.	CaRF, n&c SNF	0200180000
CLARKIA australis E. Small	c SN (Tuolumne, Madera, Mariposa cos.)	0000900000
CLARKIA biloba (Durand) Nelson & J.F. Macbr.	n&c SNF, e SnFrB	0000180800
CLARKIA biloba (Durand) Nelson & J.F. Macbr. ssp. australis Harlan Lewis & M. Lewis	c SNF (Merced River drainage, Tuolumne, Mariposa cos.)	0000100000
CLARKIA biloba (Durand) Nelson & J.F. Macbr. ssp. biloba	n&c SNF, e SnFrB	0000180800
CLARKIA biloba (Durand) Nelson & J.F. Macbr. ssp. brandegeae (Jepson) Harlan Lewis & M. Lewis	n SNF	0000080000
CLARKIA borealis E. Small	KR, CaRF	0201000000
CLARKIA borealis E. Small ssp. arida E. Small	CaRF (known only from type, s Shasta Co.)	0200000000
CLARKIA borealis E. Small ssp. borealis	KR (e Trinity, w Shasta cos.)	0001000000
CLARKIA bottae (Spach) Harlan Lewis & M. Lewis	SCoRO, SCo, WTR, nw PR	00c0020001
CLARKIA breweri (A. Gray) E. Greene	se SnFrB (Mount Hamilton), SCoRI	0000010800
CLARKIA concinna (Fischer & C. Meyer) E. Greene	NW, n SNF, n CCo, SnFrB	013d080800
CLARKIA concinna (Fischer & C. Meyer) E. Greene ssp. automixa R.N. Bowman	s SnFrB (foothills, Santa Clara Valley, s Alameda Co.)	0000000800
CLARKIA concinna (Fischer & C. Meyer) E. Greene ssp. concinna	NW, n SNF, e SnFrB (Oakland Hills, Mount Diablo)	003d080800
CLARKIA concinna (Fischer & C. Meyer) E. Greene ssp. raichei G. Allen, V.S. Ford, & Gottlieb	n CCo (known only from type locality near Tomales, Marin Co.)	0100000000
CLARKIA cylindrica (Jepson) Harlan Lewis & M. Lewis	c&s SNF, Teh, SCoR, WTR	0000338001
CLARKIA cylindrica (Jepson) Harlan Lewis & M. Lewis ssp. clavicarpa W. Davis	SNF, Teh	0000388000
CLARKIA cylindrica (Jepson) Harlan Lewis & M. Lewis ssp. cylindrica	SCoR, WTR	0000030001
CLARKIA davyi (Jepson) Harlan Lewis & M. Lewis	NCo, n CCo, n ChI (Santa Rosa Island)	0904000000
CLARKIA delicata (Abrams) Nelson & J.F. Macbr.	s PR (San Diego Co.)	0040000000
CLARKIA dudleyana (Abrams) J.F. Macbr.	c&s SNF, Teh, TR	0000309401
CLARKIA epilobioides (Nutt.) Nelson & J.F. Macbr.	CW, SW, ChI (Santa Cruz, Santa Catalina islands)	19c0035c01
CLARKIA exilis Harlan Lewis & Vasek	s SNF, Teh	0000208000
CLARKIA franciscana Harlan Lewis & Raven	SnFrB (Presidio, San Francisco; Oakland hills)	0000000800
CLARKIA gracilis (Piper) Nelson & J.F. Macbr.	NW, CaRF, n SNF, ScV, SnFrB, MP	023f080a04
CLARKIA gracilis (Piper) Nelson & J.F. Macbr. ssp. albicaulis (Jepson) Harlan Lewis & M. Lewis	s CaRF (Butte Co.)	0200000000
CLARKIA gracilis (Piper) Nelson & J.F. Macbr. ssp. gracilis	NW, n SNF, ScV, SnFrB, MP	003f080a04
CLARKIA gracilis (Piper) Nelson & J.F. Macbr. ssp. sonomensis (C. Hitchc.) Harlan Lewis & M. Lewis	KR, NCoR, n SnFrB	0039000800
CLARKIA gracilis (Piper) Nelson & J.F. Macbr. ssp. tracyi (Jepson) Abdel-Hameed & R. Snow	NCoRI	0010000000
CLARKIA heterandra (Torrey) Harlan Lewis & Raven	KR, SN, s SCoRO, TR	0001fa9501
CLARKIA imbricata Harlan Lewis & M. Lewis	NCoRO (Sonoma Co.)	0020000000
CLARKIA jolonensis D. Parnell	n SCoRO (near Jolon, Monterey Co.)	0000020000
CLARKIA lassenensis (Eastw.) Harlan Lewis & M. Lewis	KR, NCoRI, CaR, n SN, MP	0613480004
CLARKIA lewisii Raven & D. Parnell	CCo, n SCoR (Monterey, San Benito cos.)	0100030000
CLARKIA lingulata Harlan Lewis & M. Lewis	c SNF (2 sites, Merced River Canyon, Mariposa Co.)	0000100000
CLARKIA mildrediae (A.A. Heller) Harlan Lewis & M. Lewis	s CaR, n SN (Feather River drainage)	0600480000
CLARKIA modesta Jepson	NCoRI, c&s SNF, SnFrB, SCoR	0010330800
CLARKIA mosquinii E. Small	n SNF (ne Butte. Co.)	0000080000
CLARKIA mosquinii E. Small ssp. mosquinii	n SNF (known only from type, in 1959, Feather River Canyon near Pulga, border with CaR)	0600080000
CLARKIA mosquinii E. Small ssp. xerophylla E. Small	n SNF (known only from type, now under Lake Oroville)	0000080000
CLARKIA prostrata Harlan Lewis & M. Lewis	s CCo (San Luis Obispo Co.)	0100000000
CLARKIA purpurea (Curtis) Nelson & J.F. Macbr.	CA-FP	1ffdfbff01
CLARKIA purpurea (Curtis) Nelson & J.F. Macbr. ssp. purpurea	GV, CCo	0100002200
CLARKIA purpurea (Curtis) Nelson & J.F. Macbr. ssp. quadrivulnera (Douglas) Harlan Lewis & M. Lewis	CA-FP	1ffdfbff01
CLARKIA purpurea (Curtis) Nelson & J.F. Macbr. ssp. viminea (Douglas) Harlan Lewis & M. Lewis	CA-FP	1ffdfbff01
CLARKIA rhomboidea Douglas	CA-FP	1ffdfbff01
CLARKIA rostrata W. Davis	c SNF (Hell Hollow near Bear Valley, Mariposa Co.), SnJV (Merced River drainage, probably ephemeral populations)	0000102000
CLARKIA rubicunda (Lindley) Harlan Lewis & M. Lewis	CCo, SnFrB	0100000800
CLARKIA similis Harlan Lewis & Ernst	SCoRI (uncommon), SW	18c0015401
CLARKIA speciosa Harlan Lewis & M. Lewis	c&s SNF, s CCo, SCoR	0100330000
CLARKIA speciosa Harlan Lewis & M. Lewis ssp. immaculata Harlan Lewis & M. Lewis	s CCo (+/- Pismo to Edna, San Luis Obispo Co.)	0100000000
CLARKIA speciosa Harlan Lewis & M. Lewis ssp. nitens (Harlan Lewis & M. Lewis) Harlan Lewis	c&s SNF	0000300000
CLARKIA speciosa Harlan Lewis & M. Lewis ssp. polyantha Harlan Lewis & M. Lewis	s SNF	0000200000
CLARKIA speciosa Harlan Lewis & M. Lewis ssp. speciosa	SCoR	0000030000
CLARKIA springvillensis Vasek	s SNF (Springville, Tulare Co.)	0000200000
CLARKIA stellata Mosq.	CaRH, n SNH	0400400000
CLARKIA tembloriensis Vasek	s SNF, SnJV, SCoRI	0000212000
CLARKIA tembloriensis Vasek ssp. calientensis (Vasek) Holsinger	s SNF (Caliente Hills, Kern Co.)	0000200000
CLARKIA tembloriensis Vasek ssp. tembloriensis	s SNF, SnJV, SCoRI	0000212000
CLARKIA unguiculata Lindley	NCoR, SNF, Teh, SnFrB, SCoR, SCo, WTR, PR	00f83bc801
CLARKIA virgata E. Greene	n&c SN (Eldorado to Tuolumne cos.)	0000d80000
CLARKIA williamsonii (Durand & Hilg.) Harlan Lewis & M. Lewis	n&c SNF	0000180000
CLARKIA xantiana A. Gray	s SN, Teh, WTR	0000208101
CLARKIA xantiana A. Gray ssp. parviflora (Eastw.) Harlan Lewis	s SNF (Kern River drainage)	0000200000
CLARKIA xantiana A. Gray ssp. xantiana	s SN (esp Kern River drainage), Teh, WTR	0000208101
CLAYTONIA cordifolia S. Watson	KR, NCoRH, n SNH	0009400000
CLAYTONIA exigua Torrey & A. Gray	NW, SNF, GV, CW, TR, PR	017d3b7e01
CLAYTONIA exigua Torrey & A. Gray ssp. exigua	NW, SNF, GV, CW, TR, PR	017d3b7e01
CLAYTONIA exigua Torrey & A. Gray ssp. glauca (Torrey & A. Gray) John M. Miller & Chambers	KR, NCoR, SnFrB, SCoRO	0039020800
CLAYTONIA gypsophiloides Fischer & C. Meyer	NCoR, SnFrB, SCoR (Santa Lucia, Temblor mtns)	0038030800
CLAYTONIA lanceolata Pursh	KR, NCoRH, CaRH, n&c SNH, SnGb, MP, DMtns (Panamint Mtns)	440bc01004
CLAYTONIA megarhiza (A. Gray) S. Watson	n&c SNH, Wrn	0000c00004
CLAYTONIA nevadensis S. Watson	KR, CaRH, SNH, SNE	0401c40102
CLAYTONIA palustris Swanson & Kelley	KR, CaRH, n&c SNH	0401c00000
CLAYTONIA parviflora Hook.	CA-FP, GB, DMtns	5fffffff07
CLAYTONIA parviflora Hook. ssp. grandiflora John M. Miller & Chambers	SNF, Teh	0000388000
CLAYTONIA parviflora Hook. ssp. parviflora	CA-FP, GB, DMtns	5fffffff07
CLAYTONIA parviflora Hook. ssp. viridis (Davidson) John M. Miller & Chambers	s SN, SCoR, TR, PR, SNE, DMtns	4040275503
CLAYTONIA perfoliata Willd.	CA-FP, GB, DMtns	5fffffff07
CLAYTONIA perfoliata Willd. ssp. mexicana (Rydb.) John M. Miller & Chambers	NW, CW, SW	19fd035c01
CLAYTONIA perfoliata Willd. ssp. perfoliata	CA-FP, GB, DMtns	5fffffff07
CLAYTONIA rubra (Howell) Tidestrom	NW, CaRH, SNH, Teh, w CW, GB	053fc78906
CLAYTONIA rubra (Howell) Tidestrom ssp. depressa (A. Gray) John M. Miller & Chambers	NCo, KR, n CCo, SnFrB	0105000800
CLAYTONIA rubra (Howell) Tidestrom ssp. rubra	NW (exc NCo), CaRH, SNH, Teh, w CW (exc CCo), GB	043fc78906
CLAYTONIA saxosa Brandegee	KR, NCoRO, NCoRH	0029000000
CLAYTONIA sibirica L.	NW, CaRH, SnFrB	043d000800
CLAYTONIA umbellata S. Watson	KR, GB	0003040006
CLAYTONIA washingtoniana (Suksd.) Suksd.	NCo	0004000000
CLEMATIS lasiantha Nutt.	SNF, CW, SW	19c03b5c01
CLEMATIS ligusticifolia Nutt.	CA	ffffffff07
CLEMATIS pauciflora Nutt.	SW, DMtns (Little San Bernardino Mtns)	58c0005401
CLEOME lutea Hook.	SNE, DMtns	4000040002
CLEOME platycarpa Torrey	KR, CaR, n SN, MP	0603480004
CLEOME serrulata Pursh	KR, occasional waif in s CA	ffffffff07
CLEOME sparsifolia S. Watson	SNE, DMoj	6000040002
CLEOMELLA brevipes S. Watson	SNE, DMoj	6000040002
CLEOMELLA obtusifolia Torrey & Fr<#e9>mont	SNE, D	e000040002
CLEOMELLA parviflora A. Gray	GB, DMoj	6002040006
CLEOMELLA plocasperma S. Watson	GB, DMoj	6002040006
CLINTONIA andrewsiana Torrey	NCo, KR, NCoR, CCo, w SnFrB, n SCoRO	013d020800
CLINTONIA uniflora (Schultes) Kunth	KR, NCoRO, CaR, SN	0621f88100
CNEORIDIUM dumosum (Nutt.) Baillon	s SCo, s ChI (San Clemente Island)	1080000000
CNICUS benedictus L.	NCoR, GV, CW, SCo, w DMoj	61b8032a00
COCHLEARIA officinalis L. var. arctica (DC.) Gelert	n NCo (Del Norte Co.)	0004000000
COLEOGYNE ramosissima Torrey	SNE, D (esp DMtns)	e000040002
COLLINSIA bartsiifolia Benth.	NW, CaRF, SNF, CW, w DMoj	633d3b0800
COLLINSIA bartsiifolia Benth. var. bartsiifolia	NW, CaRF, SNF, CW	033d3b0800
COLLINSIA bartsiifolia Benth. var. davidsonii (Parish) V. Newsom	s SNF, SCoRI, w DMoj	6000210000
COLLINSIA callosa Parish	s SNH, Teh, TR, nw DMtns	4000009501
COLLINSIA childii A. Gray	c&s SN, Teh, SCoRO, TR, PR	0040b2d501
COLLINSIA concolor E. Greene	SnBr, PR	0040004400
COLLINSIA corymbosa Herder	NCo (scattered)	0004000000
COLLINSIA grandiflora Lindley	w NW	003d000000
COLLINSIA greenei A. Gray	NW	003d000000
COLLINSIA heterophylla Graham	CA-FP	1ffdfbff01
COLLINSIA linearis A. Gray	KR, c SNH (near Wawona, Mariposa Co.)	0001800000
COLLINSIA multicolor Lindley & Paxton	n&c CCo, n SCoRO	0100020000
COLLINSIA parryi A. Gray	c SCoRO, TR	0000021401
COLLINSIA parviflora Lindley	CA-FP, GB	1fffffff07
COLLINSIA rattanii A. Gray	NW	003d000000
COLLINSIA sparsiflora Fischer & C. Meyer	NW, CaR, SNF, GV, CW	073d3b2a00
COLLINSIA sparsiflora Fischer & C. Meyer var. arvensis (E. Greene) Jepson	s NCoR	0038000000
COLLINSIA sparsiflora Fischer & C. Meyer var. collina (Jepson) Newsom	SNF, GV, SnFrB, SCoR	00003b2a00
COLLINSIA sparsiflora Fischer & C. Meyer var. sparsiflora	NW, CaR, n&c SNF, ScV, n CW	073d1b0a00
COLLINSIA tinctoria Benth.	e NW, CaR, SN, SnFrB	063df88900
COLLINSIA torreyi A. Gray	KR, NCoRH, CaRH, SNH, TR, MP	040bc01505
COLLINSIA torreyi A. Gray var. brevicarinata V. Newsom	s SNH (rare in n SNH, Placer Co.), SnGb	0000401100
COLLINSIA torreyi A. Gray var. latifolia V. Newsom	KR, NCoRH, CaRH, MP	040b000004
COLLINSIA torreyi A. Gray var. torreyi	NCoRH, CaRH, SNH, MP	040ac00104
COLLINSIA torreyi A. Gray var. wrightii (S. Watson) I.M. Johnston	NCoRH, CaRH, SNH, TR	0408c01501
COLLOMIA diversifolia E. Greene	NCoRI, ne SnFrB (Contra Costa Co.)	0010000800
COLLOMIA grandiflora Lindley	CA-FP, n SNE	1ffdffff01
COLLOMIA heterophylla Hook.	KR, NCoR, CaR, SNF, SnFrB, SCoR	06393b0800
COLLOMIA larsenii (A. Gray) Payson	CaRH (Mt. Lassen)	0400000000
COLLOMIA linearis Nutt.	KR, CaR, SN, SnBr, GB	0603fc8506
COLLOMIA rawsoniana E. Greene	c SNF (Mariposa, Madera cos.)	0000100000
COLLOMIA tinctoria Kellogg	KR, NCoRH, CaRH, n&c SNH, WTR, GB	040bc40007
COLLOMIA tracyi H. Mason	KR, n NCoRH	0009000000
COLUBRINA californica I.M. Johnston	DSon	8000000000
COLUTEA arborescens L.	n SNF, SnFrB	0000080800
COMANDRA umbellata (L.) Nutt. ssp. californica (Rydb.) Piehl	KR, CaR, SN, SNE, n DMoj?	2601fc8102
COMAROSTAPHYLIS diversifolia (C. Parry) E. Greene	SCo, ChI, WTR, PR	18c0004001
COMAROSTAPHYLIS diversifolia (C. Parry) E. Greene ssp. diversifolia	SCo, PR	00c0004000
COMAROSTAPHYLIS diversifolia (C. Parry) E. Greene ssp. planifolia (Jepson) G.D. Wallace	n ChI (Santa Rosa, Santa Cruz islands), s ChI (Santa Catalina Island), WTR	1800000001
COMMELINA benghalensis L.	SCo	0080000000
CONDALIA globosa I.M. Johnston var. pubescens I.M. Johnston	DSon	8000000000
CONICOSIA pugioniformis (L.) N.E. Br.	CCo	0100000000
CONIOSELINUM pacificum (S. Watson) J. Coulter & Rose	NCo, CCo	0104000000
CONIUM maculatum L.	CA-FP	1ffdfbff01
CONRINGIA orientalis (L.) Dumort.	SCo, SNE, DSon, expected elsewhere	8080040002
CONSOLIDA ambigua (L.) P. Ball & Heyw.	NCoRI, n&c SNF, GV, SnFrB, SCo	0090182a00
CONVOLVULUS althaeoides L.	n SNF (Nevada Co.), SW	18c0085401
CONVOLVULUS arvensis L.	CA	ffffffff07
CONVOLVULUS simulans Perry	SnJV, CW, SW, s ChI	19c0037c01
CONYZA bilbaoana E.J. Remy	SnFrB	0000000800
CONYZA bonariensis (L.) Cronq.	CW, SW	19c0035c01
CONYZA canadensis (L.) Cronq.	CA	ffffffff07
CONYZA coulteri A. Gray	s SNF, SnJV, CW, SW, W&I, D	f9c0237c03
CONYZA floribunda Kunth	NW, ScV, SW	18fd005601
COPTIS laciniata A. Gray	n NCo, w KR	0005000000
CORALLORHIZA maculata Raf.	NW, CaR, SN (exc Teh), sw SnFrB, SnGb, SnBr, PR, W&I	067df85d02
CORALLORHIZA mertensiana Bong.	NW (exc NCoRI)	002d000000
CORALLORHIZA striata Lindley	NW (exc NCoRI), CaR, SN (exc Teh), sw SnFrB	063df80900
CORALLORHIZA trifida Chatel.	n SNH (Plumas Co.)	0000400000
CORDYLANTHUS capitatus Benth.	Wrn	0000000004
CORDYLANTHUS eremicus (Cov. & C. Morton) Munz	s SNH, n SnBr, n DMtns	4000000500
CORDYLANTHUS eremicus (Cov. & C. Morton) Munz ssp. eremicus	n SnBr (near Cushenbury, 1000 m), n DMtns	4000000400
CORDYLANTHUS eremicus (Cov. & C. Morton) Munz ssp. kernensis Chuang & Heckard	s SNH (Kern Plateau, Tulare, and Inyo cos.)	0000000100
CORDYLANTHUS kingii S. Watson ssp. helleri (Ferris) Chuang & Heckard	s MP, SNE	0002040006
CORDYLANTHUS maritimus Benth.	n NCo, n CCo, SCo, SNE	0184040002
CORDYLANTHUS maritimus Benth. ssp. canescens (A. Gray) Chuang & Heckard	SNE	0000040002
CORDYLANTHUS maritimus Benth. ssp. maritimus	SCo	0080000000
CORDYLANTHUS maritimus Benth. ssp. palustris (Behr) Chuang & Heckard	n NCo (Humboldt Co.), n CCo (Marin, Sonoma cos.)	0104000000
CORDYLANTHUS mollis A. Gray	c&s GV, n CCo	0100002200
CORDYLANTHUS mollis A. Gray ssp. hispidus (Pennell) Chuang & Heckard	c&s GV (Solano, Merced, Kern cos.)	0000002200
CORDYLANTHUS mollis A. Gray ssp. mollis	n CCo	0100000000
CORDYLANTHUS nevinii A. Gray	s SNH (Piute Mtns), TR, PR	0040005501
CORDYLANTHUS nidularius J. Howell	ne SnFrB (e slope Mount Diablo)	0000000800
CORDYLANTHUS orcuttianus A. Gray	s SCo (sw San Diego Co.)	0080000000
CORDYLANTHUS palmatus (Ferris) J.F. Macbr.	GV (Colusa, Yolo, Alameda, San Joaquin, Madera, Fresno cos.)	0000002200
CORDYLANTHUS parviflorus (Ferris) Wiggins	e DMtns (New York, Providence mtns)	4000000000
CORDYLANTHUS pilosus A. Gray	NCoR, s CaR, n&c SNF, SnFrB	0638180800
CORDYLANTHUS pilosus A. Gray ssp. hansenii (Ferris) Chuang & Heckard	s CaR, n SNF	0600080000
CORDYLANTHUS pilosus A. Gray ssp. pilosus	NCoR, SnFrB	0038000800
CORDYLANTHUS pilosus A. Gray ssp. trifidus (Robinson & Greenman) Chuang & Heckard	n&c SNF	0000180000
CORDYLANTHUS pringlei A. Gray	NCoRH, NCoRI	0018000000
CORDYLANTHUS ramosus Benth.	n CaRH (Shasta Valley), GB	0402040006
CORDYLANTHUS rigidus (Benth.) Jepson	c&s SN, CW (exc n SnFrB), SW	19c0b35d01
CORDYLANTHUS rigidus (Benth.) Jepson ssp. brevibracteatus (A. Gray) Munz	s SNH (Kern Plateau, Tulare and Kern cos.)	0000000100
CORDYLANTHUS rigidus (Benth.) Jepson ssp. littoralis (Ferris) Chuang & Heckard	c CCo (s Monterey Bay and Peninsula), s CCo (w Santa Barbara Co.)	0100000000
CORDYLANTHUS rigidus (Benth.) Jepson ssp. rigidus	c&s SN, CW (exc n SnFrB), WTR	0100b30901
CORDYLANTHUS rigidus (Benth.) Jepson ssp. setigerus Chuang & Heckard.	SW (exc WTR)	18c0005400
CORDYLANTHUS tecopensis Munz & Roos	s SNE, n DMoj	2000040002
CORDYLANTHUS tenuis A. Gray	KR, NCoR, CaR, SN	0639f88100
CORDYLANTHUS tenuis A. Gray ssp. barbatus Chuang & Heckard	s SNF (Fresno Co.)	0000200000
CORDYLANTHUS tenuis A. Gray ssp. brunneus (Jepson) Munz	s NCoR (Lake, Sonoma, Napa cos.)	0038000000
CORDYLANTHUS tenuis A. Gray ssp. capillaris (Pennell) Chuang & Heckard	sw NCoRO (near Occidental, Sonoma Co)	0020000000
CORDYLANTHUS tenuis A. Gray ssp. pallescens (Pennell) Chuang & Heckard	CaRH (near Black Butte, Siskiyou Co.)	0400000000
CORDYLANTHUS tenuis A. Gray ssp. tenuis	SN	0000f88100
CORDYLANTHUS tenuis A. Gray ssp. viscidus (Howell) Chuang & Heckard	KR, NCoRH, CaR, n SN	0609480000
COREOPSIS bigelovii (A. Gray) H.M. Hall	SCoRI, TR, Teh, s SNF, DMoj, n DSon	e000219401
COREOPSIS californica (Nutt.) H. Sharsm. var. californica	s SnJV, s SCoRI, TR, D	e000013401
COREOPSIS calliopsidea (DC.) A. Gray	SCoRI, TR, w DMoj	6000011401
COREOPSIS douglasii (DC.) H.M. Hall	SCoRI, n WTR	0000010001
COREOPSIS gigantea (Kellogg) H.M. Hall	s CCo, n&c SCo, ChI	1980000000
COREOPSIS hamiltonii (Elmer) H. Sharsm.	e SnFrB (Diablo Range)	0000000800
COREOPSIS lanceolata L.	CCo, SCo	0180000000
COREOPSIS maritima (Nutt.) Hook. f.	s SCo (San Diego Co.)	0080000000
COREOPSIS stillmanii (A. Gray) S.F. Blake	NCoRI, SNF, GV, n SCoRI	0010392200
COREOPSIS tinctoria Nutt.	CA-FP	1ffdfbff01
COREOPSIS wrightii (A. Gray) H. Parker	s SCo (San Diego Co.)	0080000000
CORIANDRUM sativum L.	CA-FP	1ffdfbff01
CORISPERMUM hyssopifolium L.	n SNE, n DSon, n DMoj	a000040002
CORNUS canadensis L.	NW	003d000000
CORNUS glabrata Benth.	CA-FP (uncommon in s CA)	1ffdfbff01
CORNUS nuttallii Audubon	CA-FP (less common in s CA)	1ffdfbff01
CORNUS sericea L.	CA-FP, W&I	1ffdfbff03
CORNUS sericea L. ssp. occidentalis (Torrey & A. Gray) Fosb.	CA-FP	1ffdfbff01
CORNUS sericea L. ssp. sericea	CA-FP (uncommon in s CA), W&I	1ffdfbff03
CORNUS sessilis Durand	NW, CaR, n SN	063d480000
CORONOPUS didymus (L.) Smith	CA	ffffffff07
CORONOPUS squamatus (Forsskal) Asch.	SnFrB, ScV, DSon	8000000a00
CORTADERIA jubata (Lemoine) Stapf	NCo, NCoRO, CCo, SnFrB, SCo, WTR	01a4000801
CORTADERIA selloana (Schultes) Asch. & Graebner	SnFrB, SCo (Orange Co.), cult elsewhere	0080000800
CORYDALIS aurea Willd.	GB	0002040006
CORYDALIS caseana A. Gray ssp. caseana	CaRH, n SNH, s MP	0402400004
CORYLUS cornuta Marsh. var. californica (A. DC.) W. Sharp	NW, CaR, SN, SnFrB	063df88900
COSMOS bipinnatus Cav.	CA-FP	1ffdfbff01
COSMOS sulphureus Cav.	CA-FP	1ffdfbff01
COTONEASTER franchetii Boiss.	n CW, expected elsewhere	0100030800
COTONEASTER pannosa Franchet	NCo, n CW, c WTR, expected elsewhere	0104030801
COTULA australis (Sieber) Hook. f.	NCo, CCo, SCo	0184000000
COTULA coronopifolia L.	NCo, CW, SCo	0184030800
COTYLEDON orbiculata L. var. oblonga (Haw.) DC.	c SCo (Newport Beach, Orange Co.)	0080000000
CRASSULA aquatica (L.) Sch<#f6>nl.	NCo, SNF, GV, CW, SW (exc n ChI)	11c43b7e01
CRASSULA connata (Ru<#ed>z Lopez & Pav<#f3>n) A. Berger	NW, SNF, GV, CW, SW, DSon	99fd3b7e01
CRASSULA solieri (C. Gay) F. Meigen	NCoRI, CaRF, n SNF, GV, SCo	0290082200
CRASSULA tillaea Lester-Garl.	NCoRI, n&c SNF, GV, CCo, SCoR, SW	19d01b7601
CRATAEGUS douglasii Lindley	MP	0002000004
CRATAEGUS suksdorfii (Sarg.) Kruschke	KR, NCoR, CaR, n SnFrB	0639000800
CREPIS acuminata Nutt.	KR, NCoRH, CaRH, SNH, Teh, TR, GB	040bc49507
CREPIS bakeri E. Greene	KR, CaRH, n&c SNH, MP	0403c00004
CREPIS bursifolia L.	SnFrB	0000000800
CREPIS capillaris (L.) Wallr.	NW, CaR, n&c SN, SnFrB, SCo	06bdd80800
CREPIS intermedia A. Gray	KR, NCoRH, CaRH, NCoRH, n&c SN, GB	040bdc0006
CREPIS modocensis E. Greene	CaRH, n&c SNH, SnBr, MP	0402c00404
CREPIS monticola Cov.	KR, NCoRH, CaRH, n SNH, se SnFrB (Mount Hamilton)	0409400800
CREPIS nana A. Richards	c&s SNH, SnGb, SNE, n DMtns (Panamint Mtns)	4000841102
CREPIS occidentalis Nutt.	KR, NCoRH, CaRH, SNH, Teh, se SnFrB (Mount Hamilton), WTR, SnBr, GB	040bc48d07
CREPIS pleurocarpa A. Gray	KR, NCoRO, NCoRH, CaRH, n SNH	0429400000
CREPIS runcinata Torrey & A. Gray	SNE, s MP	0002040006
CREPIS runcinata Torrey & A. Gray ssp. andersonii (A. Gray) Babc. & Stebb.	s MP (Sierra Valley, se Plumas Co.)	0002000004
CREPIS runcinata Torrey & A. Gray ssp. hallii Babc. & Stebb.	SNE (Benton, s Mono Co. to Bishop, n Inyo Co.)	0000040002
CREPIS setosa Haller f.	NCoRO	0020000000
CREPIS vesicaria L. ssp. taraxacifolia (Thuill.) Thell.	NCoRO, SnFrB, SCo	00a0000800
CRESSA truxillensis Kunth	CA-FP, D	fffdfbff01
CROCIDIUM multicaule Hook.	NCoR, SNF, e SnFrB, SCoR (very uncommon), MP	003a3b0804
CROCOSMIA X-crocosmiiflora (Lemoine) N.E. Br.	NCo, SnFrB, SCo, expected elsewhere	0084000800
CROSSOSOMA bigelovii S. Watson	e SnBr, D	e000000400
CROSSOSOMA californicum Nutt.	c SCo (Palos Verdes Peninsula), s ChI (San Clemente, Santa Catalina islands)	1080000000
CROTON californicus Muell. Arg.	CCo, SCo, s ChI (Santa Catalina Island), D	f180000000
CROTON wigginsii Wheeler	se DSon (se Imperial Co.)	8000000000
CRUCIANELLA angustifolia L.	CaRF, n SNF SCoRI	0200090000
CRUPINA vulgaris Cass.	s NCoR (Sonoma Co.), MP	003a000004
CRYPSIS alopecuroides (Piller & Mitterp.) Schrader	KR, NCoRI, CaRH, CCo (Marin Co.), SNE	0511040002
CRYPSIS schoenoides (L.) Lam.	CA-FP	1ffdfbff01
CRYPSIS vaginiflora (Forsskal) Opiz	NCoR, CaR, GV, SW (Los Angeles Co.)	1ef8007601
CRYPTANTHA affinis (A. Gray) E. Greene	KR, NCoR, CaR, SN, SnBr, PR	0679f8c500
CRYPTANTHA ambigua (A. Gray) E. Greene	CaR, n&c SN, GB	0602dc0006
CRYPTANTHA angustifolia (Torrey) E. Greene	SNE, D	e000040002
CRYPTANTHA barbigera (A. Gray) E. Greene	s SN, Teh, SNE, D	e000248102
CRYPTANTHA cinerea (E. Greene) Cronq. var. abortiva (E. Greene) Cronq.	SNE, DMtns	4000040002
CRYPTANTHA circumscissa (Hook. & Arn.) I.M. Johnston	SN, s SnJV, SCoRI (se Monterey Co.), e SCo, TR, e PR, GB, D	e0c2fdb507
CRYPTANTHA clevelandii E. Greene	s NCo, s NCoRI, CW, SCo, ChI	1994030800
CRYPTANTHA clokeyi I.M. Johnston	c DMoj (near Barstow)	6000000000
CRYPTANTHA confertiflora (E. Greene) Payson	SNE, DMtns	4000040002
CRYPTANTHA costata Brandegee	e DMoj, DSon	e000000000
CRYPTANTHA crinita E. Greene	n CaRF (Shasta, Tehama cos.)	0200000000
CRYPTANTHA crymophila I.M. Johnston	n&c SNH (Alpine, Tuolumne cos.)	0000c00000
CRYPTANTHA decipiens (M.E. Jones) A.A. Heller	Teh, SnFrB, s SnJV, SCoR, WTR, W&I, DMoj, n DSon	e00003a803
CRYPTANTHA dumetorum (A. Gray) E. Greene	SNH (e slope), TR (n slope), SNE, DMoj, n DSon	e000c41503
CRYPTANTHA echinella E. Greene	SN, TR, GB, n DMtns	4002fc9507
CRYPTANTHA excavata Brandegee	s NCoRI (Colusa, Lake, Yolo cos.)	0010000000
CRYPTANTHA flaccida (Lehm.) E. Greene	CA-FP	1ffdfbff01
CRYPTANTHA flavoculata (Nelson) Payson	SNE, DMtns	4000040002
CRYPTANTHA ganderi I.M. Johnston	w DSon (Borrego Valley)	8000000000
CRYPTANTHA glomeriflora E. Greene	SNH (e slope), W&I	0000c00102
CRYPTANTHA gracilis Osterh.	GB, e DMoj	6002040006
CRYPTANTHA hispidula Brand	KR (near Peanut, Trinity Co.), s NCoRI (Colusa, Lake, Napa cos.)	0011000000
CRYPTANTHA holoptera (A. Gray) J.F. Macbr.	e DMoj, DSon	e000000000
CRYPTANTHA hooveri I.M. Johnston	n&c SnJV	0000002000
CRYPTANTHA humilis (E. Greene) Payson	GB	0002040006
CRYPTANTHA incana E. Greene	s SN (Tulare Co.)	0000200100
CRYPTANTHA intermedia (A. Gray) E. Greene	CA (exc coast, GV, D)	1e7bffdd07
CRYPTANTHA leiocarpa (Fischer & C. Meyer) E. Greene	NCo, CCo, n SCo	0184000000
CRYPTANTHA mariposae I.M. Johnston	n&c SN (Calaveras, Mariposa, Tuolumne cos.)	0000d80000
CRYPTANTHA maritima (E. Greene) E. Greene	SW, D	f8c0005401
CRYPTANTHA micrantha (Torrey) I.M. Johnston	c&s SN (e slope), SW (exc ChI), SNE, D	e0c0b45503
CRYPTANTHA micromeres (A. Gray) E. Greene	SNF, SnJV, CW, SW	19c03b7c01
CRYPTANTHA microstachys (A. Gray) E. Greene	NCoRI, s SN, SnFrB, SCoR, SW (exc ChI)	00d0235d01
CRYPTANTHA milobakeri I.M. Johnston	NW, CaR, n SNH	063d400000
CRYPTANTHA mohavensis (E. Greene) E. Greene	c&s SNH (e slope), Teh, w DMoj	6000808100
CRYPTANTHA muricata (Hook. & Arn.) Nelson & J.F. Macbr.	CA-FP (exc NCo, KR)	1ff8fbff01
CRYPTANTHA nemaclada E. Greene	s NCoRI, n Teh, SnFrB, SCoRI, n WTR (ne Ventura Co.)	0010018801
CRYPTANTHA nevadensis Nelson & Kenn.	s SNF, SnFrB, Teh, SnJV, SCoR, W&I, D	e00023a802
CRYPTANTHA nubigena (E. Greene) Payson	c&s SNH (e slope), W&I, n DMtns	4000800102
CRYPTANTHA oxygona (A. Gray) E. Greene	c&s SNF, SNH (e slope), Teh, SnJV, SCoRI, SW (exc ChI), w DMoj	60c0f1f501
CRYPTANTHA pterocarya (Torrey) E. Greene	s SN, s SnJV, e PR, GB, D	e042242106
CRYPTANTHA racemosa (S. Watson) E. Greene	SnBr (n slope), PR, s SNE, D	e040044402
CRYPTANTHA recurvata Cov.	SNE, DMoj	6000040002
CRYPTANTHA roosiorum Munz	W&I (n Inyo Mtns)	0000000002
CRYPTANTHA simulans E. Greene	KR, NCoRH, CaR, SN, TR, PR, GB	064bfcd507
CRYPTANTHA sobolifera Payson	KR, CaRH, MP, ne SNE (Sweetwater Mtns)	0403000004
CRYPTANTHA torreyana (A. Gray) E. Greene	KR, NCoR, CaRF, SN, SnFrB, GB	023bfc8906
CRYPTANTHA traskiae I.M. Johnston	s ChI (San Clemente, San Nicolas islands)	1000000000
CRYPTANTHA tumulosa (Payson) Payson	n&e DMtns	4000000000
CRYPTANTHA utahensis (A. Gray) E. Greene	s SNE, D	e000040002
CRYPTANTHA virginensis (M.E. Jones) Payson	W&I, DMtns	4000000002
CRYPTANTHA watsonii (A. Gray) E. Greene	e SNH, GB	0002c40106
CRYPTOGRAMMA acrostichoides R. Br.	KR, NCoRH, CaRH, SNH, SnBr, SnJt	0409c04500
CRYPTOGRAMMA cascadensis E. Alverson	KR, CaRH, SNH, Wrn	0401c00104
CUCUMIS melo L. var. dudaim (L.) Naudin	n SCo (Santa Barbara Co.), se DSon (Imperial Co.)	8080000000
CUCUMIS myriocarpus Naudin	c&s SnJV, s SCoRO (Santa Barbara Co.)	0000022000
CUCURBITA digitata A. Gray	PR, DSon	8040004000
CUCURBITA foetidissima Kunth	GV, CW, SW, D	f9c0037e01
CUCURBITA palmata S. Watson	SnJV, CW, SW, D	f9c0037c01
CUPRESSUS abramsiana C. Wolf	SnFrB (Santa Cruz Mtns)	0000000800
CUPRESSUS arizonica E. Greene	s SNH, Teh, PR	004000c100
CUPRESSUS arizonica E. Greene ssp. arizonica	PR (Cuyamaca Mtns)	0040000000
CUPRESSUS arizonica E. Greene ssp. nevadensis (Abrams) E. Murray	s SNH (Kern, Tulare cos.), Teh	0000008100
CUPRESSUS bakeri Jepson	KR, CaRH, n SNH	0401400000
CUPRESSUS forbesii Jepson	w PR	0040000000
CUPRESSUS goveniana Gordon	c&s NCo, c CCo	0104000000
CUPRESSUS goveniana Gordon ssp. goveniana	c CCo (Monterey Peninsula)	0100000000
CUPRESSUS goveniana Gordon ssp. pigmaea (Lemmon) J. Bartel	c&s NCo (Mendocino, Sonoma cos.)	0004000000
CUPRESSUS lawsoniana A. Murray	NCo, KR, NCoRO	0025000000
CUPRESSUS macnabiana A. Murray	NCoRI, CaRH, n SNF	0410080000
CUPRESSUS macrocarpa Gordon	NCo, CCo	0104000000
CUPRESSUS nootkatensis D. Don	KR	0001000000
CUPRESSUS sargentii Jepson	NCoR, SnFrB, SCoR	0038030800
CUSCUTA approximata Bab.	NCoR, GV, MP	003a002204
CUSCUTA californica Hook. & Arn.	CA-FP, DSon	9ffdfbff01
CUSCUTA californica Hook. & Arn. var. apiculata Engelm.	e DSon (near Colorado River)	8000000000
CUSCUTA californica Hook. & Arn. var. breviflora Engelm.	CA-FP	1ffdfbff01
CUSCUTA californica Hook. & Arn. var. californica	CA-FP	1ffdfbff01
CUSCUTA californica Hook. & Arn. var. papillosa Yuncker	SNF, GV, SCoRO, SCo	00803a2200
CUSCUTA cephalanthi Engelm.	KR, CaR, Wrn	0601000004
CUSCUTA denticulata Engelm.	W&I, D	e000000002
CUSCUTA howelliana Rubtzoff	NCoRI, CaRF, n SNF, GV	0210082200
CUSCUTA indecora Choisy	NCo, NCoR, SN, GV, D	e03cf8a300
CUSCUTA indecora Choisy var. indecora	NCo, NCoR, SN, GV, D	e03cf8a300
CUSCUTA indecora Choisy var. neuropetala (Engelm.) Hitchc.	SNF, GV, D	e000382200
CUSCUTA pentagona Engelm.	NCo, SNF, GV, CCo, SCo	0184382200
CUSCUTA salina Engelm.	NCo, KR, GV, CCo, SnFrB, SCo	0185002a00
CUSCUTA salina Engelm. var. major Yuncker	NCo, CCo, SCo	0184000000
CUSCUTA salina Engelm. var. papillata Yuncker	NCo	0004000000
CUSCUTA salina Engelm. var. salina	KR, GV, SnFrB,	0001002a00
CUSCUTA subinclusa Durand & Hilg.	NCoR, SN, GV, SnFrB, SCoR, SNE	0038ffab02
CUSICKIELLA douglasii (A. Gray) Rollins	KR, NCoR, SN, SnBr, GB	003bfc8506
CUSICKIELLA quadricostata (Rollins) Rollins	SNE (Mono Co.)	0000040002
CYCLADENIA humilis Benth.	KR, NCoRH, CaRH, n SNH, SCoRO, SnGb, SNE	0409461002
CYCLADENIA humilis Benth. var. humilis	KR, NCoRH, CaRH, n SNH (Plumas, Sierra cos.)	0409400000
CYCLADENIA humilis Benth. var. venusta (Eastw.) Munz	SCoRO (Santa Lucia Range), SnGb, SNE	0000061002
CYCLOLOMA atriplicifolium (Sprengel) J. Coulter	GV, s SCo, w PR, e DMoj	60c0002200
CYMBALARIA muralis Gaertner, Meyer, & Scherb.	NCo, CCo, SCo	0184000000
CYMOPTERUS aboriginum M.E. Jones	DMtns, W&I	4000000002
CYMOPTERUS cinerarius A. Gray	SNH, SNE	0000c40102
CYMOPTERUS deserticola Brandegee	w DMoj	6000000000
CYMOPTERUS gilmanii C. Morton	ne DMtns	4000000000
CYMOPTERUS globosus (S. Watson) S. Watson	SNE	0000040002
CYMOPTERUS multinervatus (J. Coulter & Rose) Tidestrom	DMoj	6000000000
CYMOPTERUS panamintensis J. Coulter & Rose	DMoj	6000000000
CYMOPTERUS panamintensis J. Coulter & Rose var. acutifolius (J. Coulter & Rose) Munz	DMoj	6000000000
CYMOPTERUS panamintensis J. Coulter & Rose var. panamintensis	DMtns	4000000000
CYMOPTERUS purpurascens (A. Gray) M.E. Jones	e DMoj, W&I	6000000002
CYMOPTERUS ripleyi Barneby	s SNH, s SNE, n DMtns	4000040102
CYMOPTERUS terebinthinus (Hook.) M.E. Jones	KR, CaRH, SNH, SNE	0401c40102
CYMOPTERUS terebinthinus (Hook.) M.E. Jones var. californicus (J. Coulter & Rose) Jepson	KR, CaRH, SNH, n SNE	0401c40100
CYMOPTERUS terebinthinus (Hook.) M.E. Jones var. petraeus (M.E. Jones) Goodrich	c SNE, W&I	0000040002
CYNANCHUM louiseae Kartesz & Gandhi	SCo (Riverside Co.)	0080000000
CYNANCHUM utahense (Engelm.) Woodson	DMoj	6000000000
CYNARA cardunculus L.	CA-FP	1ffdfbff01
CYNARA scolymus L.	CA-FP	1ffdfbff01
CYNODON dactylon (L.) Pers.	CA-FP, W&I, D	fffdfbff03
CYNODON plectostachyus (Schumann) Englem.	SnJV (Merced Co.)	0000002000
CYNODON transvalensis Burtt Davy	DSon (Imperial Co.)	8000000000
CYNOGLOSSUM grande Lehm.	NW (exc NCoRH), CaR, SNF (uncommon), n SNH, SnFrB, SCoR	06357b0800
CYNOGLOSSUM occidentale A. Gray	KR, NCoRH, NCoRI, CaRH, SNH, MP	041bc00104
CYNOGLOSSUM officinale L.	CaRH (se Siskiyou, adjacent Shasta cos.)	0400000000
CYNOSURUS cristatus L.	NCo, CCo, SCo	0184000000
CYNOSURUS echinatus L.	NW, SNF, CW, WTR	013d3b0801
CYPERUS acuminatus Torrey & Hook.	KR, GV, WTR	0001002201
CYPERUS bipartitus Torrey	NW, c SNF, n SNH	003d500000
CYPERUS difformis L.	GV, SW	18c0007601
CYPERUS eragrostis Lam.	CA-FP	1ffdfbff01
CYPERUS erythrorhizos Muhlenb.	CA	ffffffff07
CYPERUS esculentus L.	CA	ffffffff07
CYPERUS fuscus L.	SnJV	0000002000
CYPERUS involucratus Rottb.	SCo	0080000000
CYPERUS laevigatus L.	SW, GB, D	f8c2045407
CYPERUS ligularis L.	w SnFrB (San Francisco), s SCo (San Diego)	0080000800
CYPERUS niger Ru<#ed>z Lopez & Pav<#f3>n	NCoR, CaRF, SNF, n SNH, GV, CW, SCo, PR, SNE	03f87f6a02
CYPERUS odoratus L.	GV, SCo, D	e080002200
CYPERUS parishii Britton	SW, D	f8c0005401
CYPERUS rotundus L.	GV, SCo, DSon	8080002200
CYPERUS squarrosus L.	CA	ffffffff07
CYPERUS strigosus L.	CA	ffffffff07
CYPRIPEDIUM californicum A. Gray	KR, n NCoRO, w CaR, n SN, nw SnFrB	0621480800
CYPRIPEDIUM fasciculatum S. Watson	NW, CaR, n SN, sw SnFrB	063d480800
CYPRIPEDIUM montanum Lindley	NW, CaR, n&c SN, sw SnFrB, MP	063fd80804
CYPSELEA humifusa Turpin	NCoR, GV, SnFrB, PR	0078006a00
CYRTOMIUM falcatum (L.f.) C. Presl	n SNF, SCo, WTR, SnGb	0080081001
CYSTOPTERIS fragilis (L.) Bernh.	KR, NCoRO, NCoRH, CaR, n&c SNF, SNH, SnFrB, SCoR, TR, PR, GB, DMtns	466bdf5d07
CYTISUS multiflorus (L'Heritier) Sweet	SCoRO (Monterey Co.)	0000020000
CYTISUS scoparius (L.) Link	NW, CaRF, n&c SNF, GV, SnFrB, SCo	02bd182a00
CYTISUS striatus (Hill) Rothm.	SnFrB, SCo, PR, expected elsewhere	00c0004800
DACTYLIS glomerata L.	CA-FP, GB	1fffffff07
DACTYLOCTENIUM aegyptium (L.) Willd.	SnJV (Kern Co.), SCo, PR, DSon	80c0006000
DALEA mollis Benth.	D	e000000000
DALEA mollissima (Rydb.) Munz	D	e000000000
DALEA ornata (Hook.) Eaton & J. Wright	MP (Shaffer Mtn, Lassen Co.)	0002000004
DALEA searlsiae (A. Gray) Barneby	W&I (Inyo Mtns), DMtns	4000000002
DAMASONIUM californicum Benth.	NCoRI, n SNF, ScV, MP	0012080204
DANTHONIA californica Bolander	NW, CaR, SN, CW, SnBr, s PR, MP	077ffb8d04
DANTHONIA californica Bolander var. americana (Scribner) A. Hitchc.	NCo, NCoR, CaRH, SN, CCo, SnBr, s PR, MP	057ef88504
DANTHONIA californica Bolander var. californica	NW, CaR, SN, CW	073dfb8900
DANTHONIA intermedia Vasey	KR, NCoRH, CaRH, SNH, MP	040bc00104
DANTHONIA pilosa R.Br.	NCo, KR, NCoRO, CCo, SnFrB	0125000800
DANTHONIA unispicata (Thurber) Macoun	KR, NCoR, CaRH, SNH, MP	043bc00104
DARLINGTONIA californica Torrey	KR, CaRH?, n SNH (c Plumas, Sierra, Nevada cos.)	0401400000
DARMERA peltata (Torrey) Voss	KR, CaR, SN	0601f88100
DATISCA glomerata (C. Presl) Baillon	CA-FP (exc GV)	1ffdfbdd01
DATURA discolor Bernh.	DSon	8000000000
DATURA ferox L.	n SNF (Amador Co.), n SnJV	0000082000
DATURA stramonium L.	CA-FP (exc KR, CaR, SNH)	19fc3bfe01
DATURA wrightii Regel	NCoRI, c&s SNF, Teh, GV, CW, SW, D	f9d033fe01
DAUCUS carota L.	w CA-FP	1ffdfbff01
DAUCUS pusillus Michaux	CA-FP (esp coastal), DMtns	5ffdfbff01
DEDECKERA eurekensis Rev. & J. Howell	W&I, DMtns (Last Chance, Panamint Mtns)	4000000002
DELOSPERMA litorale (Kensit) L. Bolus	SCo, s ChI	1080000000
DELPHINIUM andersonii A. Gray	ne SNH, GB	0002440006
DELPHINIUM antoninum Eastw.	KR, NCoRH	0009000000
DELPHINIUM bakeri Ewan	n SnFrB, n CCo, (s Sonoma Co.)	0100000800
DELPHINIUM californicum Torrey & A. Gray	CCo, SnFrB	0100000800
DELPHINIUM californicum Torrey & A. Gray ssp. californicum	CCo, w SnFrB	0100000800
DELPHINIUM californicum Torrey & A. Gray ssp. interius (Eastw.) Ewan	e SnFrB	0000000800
DELPHINIUM cardinale Hook.	SCoR, SW, w edge DSon	98c0035401
DELPHINIUM decorum Fischer & C. Meyer	NCo, KR, NCoRO, NCoRH, SnFrB	002d000800
DELPHINIUM decorum Fischer & C. Meyer ssp. decorum	NCo, SnFrB	0004000800
DELPHINIUM decorum Fischer & C. Meyer ssp. tracyi Ewan	KR, NCoRO, NCoRH	0029000000
DELPHINIUM depauperatum Torrey & A. Gray	n&c SNH, Wrn	0000c00004
DELPHINIUM glaucum S. Watson	KR, SNH, SnGb, SnBr, n SNE	0001c41500
DELPHINIUM gracilentum E. Greene	SN	0000f88100
DELPHINIUM gypsophilum Ewan	s SNF, Teh, SnJV, SCoR	000023a000
DELPHINIUM gypsophilum Ewan ssp. gypsophilum	s SNF, Teh, SnJV, SCoRI	000021a000
DELPHINIUM gypsophilum Ewan ssp. parviflorum Harlan Lewis & Epling	SCoRO	0000020000
DELPHINIUM hansenii (E. Greene) E. Greene	NCoRI, CaRF, SNF, c&s SNH, Teh, GV, w edge DMoj	2210b8a300
DELPHINIUM hansenii (E. Greene) E. Greene ssp. ewanianum M.J. Warnock	SNF, SnJV	0000382000
DELPHINIUM hansenii (E. Greene) E. Greene ssp. hansenii	NCoRI, CaRF, SNF, c&s SNH, ScV	0210b80300
DELPHINIUM hansenii (E. Greene) E. Greene ssp. kernense (Davidson) Ewan	s SN, Teh, w edge DMoj	2000208100
DELPHINIUM hesperium A. Gray	NW, CaRF, ScV, SnFrB, PR	027d004a00
DELPHINIUM hesperium A. Gray ssp. cuyamacae (Abrams) Harlan Lewis & Epling	c PR	0040000000
DELPHINIUM hesperium A. Gray ssp. hesperium	NW, SnFrB	003d000800
DELPHINIUM hesperium A. Gray ssp. pallescens (Ewan) Harlan Lewis & Epling	NCoRI, CaRF, ScV, SnFrB, SCoRI	0210010a00
DELPHINIUM hutchinsoniae Ewan	c CCo (c Monterey Co)	0100000000
DELPHINIUM inopinum (Jepson) Harlan Lewis & Epling	s SNH	0000000100
DELPHINIUM luteum A.A. Heller	n CCo (Marin, Sonoma cos.)	0100000000
DELPHINIUM nudicaule Torrey & A. Gray	NW, CaR, n&c SN, CW (exc SCoRI), nw MP	073fda0804
DELPHINIUM nuttallianum Walp.	KR, CaR, SNH, MP	0603c00104
DELPHINIUM parishii A. Gray	Teh, TR, SNE, D	e000049403
DELPHINIUM parishii A. Gray ssp. pallidum (Munz) M.J. Warnock	WTR	0000000001
DELPHINIUM parishii A. Gray ssp. parishii	Teh, e TR, SNE, D	e000049403
DELPHINIUM parishii A. Gray ssp. subglobosum (Wiggins) Harlan Lewis & Epling	w DSon	8000000000
DELPHINIUM parryi A. Gray	Teh, CW, SW	19c003dc01
DELPHINIUM parryi A. Gray ssp. blochmaniae (E. Greene) Harlan Lewis & Epling	s CCo	0100000000
DELPHINIUM parryi A. Gray ssp. eastwoodiae Ewan	s CCo, SCoRO (San Luis Obispo Co?)	0100020000
DELPHINIUM parryi A. Gray ssp. maritimum (Davidson) M.J. Warnock	CCo, SCo, ChI	1980000000
DELPHINIUM parryi A. Gray ssp. parryi	CW, SW	19c0035c01
DELPHINIUM parryi A. Gray ssp. purpureum (Harlan Lewis & Epling) M.J. Warnock	Teh, WTR	0000008001
DELPHINIUM patens Benth.	s NCoR, GV, SnFrB, SCoR, SW	18f8037e01
DELPHINIUM patens Benth. ssp. hepaticoideum Ewan	SCoRO, SW (exc ChI)	00c0025401
DELPHINIUM patens Benth. ssp. montanum (Munz) Ewan	TR, PR	0040005401
DELPHINIUM patens Benth. ssp. patens	s NCoR, GV, SnFrB, n SCoR	0038032a00
DELPHINIUM polycladon Eastw.	SNH, W&I	0000c00102
DELPHINIUM purpusii Brandegee	s SN, w edge DMoj	2000200100
DELPHINIUM recurvatum E. Greene	GV	0000002200
DELPHINIUM stachydeum (A. Gray) Tidestrom	Wrn	0000000004
DELPHINIUM trolliifolium A. Gray	NCo, n&c NCoRO	0024000000
DELPHINIUM uliginosum Curran	s NCoRI	0010000000
DELPHINIUM umbraculorum Harlan Lewis & Epling	SCoRO, WTR	0000020001
DELPHINIUM variegatum Torrey & A. Gray	NCo, NCoR, CaR, SNF, GV, SnFrB, SCoR, ChI	1e3c3b2a00
DELPHINIUM variegatum Torrey & A. Gray ssp. kinkiense (Munz) M.J. Warnock	s ChI (San Clemente Island)	1000000000
DELPHINIUM variegatum Torrey & A. Gray ssp. thornei Munz	ChI (San Clemente Island)	1800000000
DELPHINIUM variegatum Torrey & A. Gray ssp. variegatum	NCo, NCoR, CaR, SNF, GV, SnFrB, SCoR	063c3b2a00
DENDROMECON harfordii Kellogg	ChI	1800000000
DENDROMECON rigida Benth.	s NW, CaRF, SNF, CW, SW	1bfd3b5c01
DESCHAMPSIA atropurpurea (Wahlenb.) Scheele	KR (Marble Mtns, Trinity Alps), CaRH (Mt Shasta)	0401000000
DESCHAMPSIA cespitosa (L.) P. Beauv.	NW, CaR, SN, CCo, SnFrB, TR, Wrn, n SNE, W&I	073dfc9d05
DESCHAMPSIA cespitosa (L.) P. Beauv. ssp. cespitosa	NW, CaR, SN, CCo, SnFrB, TR, Wrn, n SNE, W&I	073dfc9d05
DESCHAMPSIA cespitosa (L.) P. Beauv. ssp. holciformis (C. Presl) W.E. Lawr.	NCo, NCoRO, CCo	0124000000
DESCHAMPSIA danthonioides (Trin.) Munro	CA-FP, MP, DMtns (uncommon)	5ffffbff05
DESCHAMPSIA elongata (Hook.) Munro	CA-FP, GB	1fffffff07
DESCURAINIA californica (A. Gray) O. Schulz	SNH, GB, DMtns	4002c40106
DESCURAINIA incana (Fischer & C. Meyer) Dorn	KR, SN, SnBr, GB	0003fc8506
DESCURAINIA incisa (A. Gray) Britton	CaR, TR, PR, GB	0642045407
DESCURAINIA incisa (A. Gray) Britton ssp. filipes (A. Gray) Rollins	CaR, GB	0602040006
DESCURAINIA incisa (A. Gray) Britton ssp. incisa	CaR, TR, PR, GB	0642045407
DESCURAINIA obtusa (E. Greene) O. Schulz ssp. adenophora (Wooton & Standley) Detl.	e PR, DMoj	6040000000
DESCURAINIA paradisa (Nelson & Kenn.) O. Schulz	GB	0002040006
DESCURAINIA pinnata (Walter) Britton	CaR, s SNH, GV, CCo, SnFrB, SCoR, SW, GB, DMoj	7fc2077f07
DESCURAINIA pinnata (Walter) Britton ssp. glabra (Wooton & Standley) Detl.	s SnJV, SCoR, W&I, DMoj	6000032002
DESCURAINIA pinnata (Walter) Britton ssp. halictorum (Cockerell) Detl.	CaR, SW, GB, DMoj	7ec2045407
DESCURAINIA pinnata (Walter) Britton ssp. intermedia (Rydb.) Detl.	GB	0002040006
DESCURAINIA pinnata (Walter) Britton ssp. menziesii (DC.) Detl.	s SNH, GV, CCo, SnFrB, SW, DMtns	59c0007f01
DESCURAINIA sophia (L.) Webb	CA	ffffffff07
DESMAZERIA rigida (L.) Tutin	s NCo, CCo, SnFrB, SCo, s ChI (Santa Catalina Island)	1184000800
DIANTHUS armeria L. ssp. armeria	KR, NCoRO, CaR, c SNH	0621800000
DIANTHUS barbatus L. ssp. barbatus	NW, CaRF, CCo	033d000000
DIANTHUS deltoides L. ssp. deltoides	CaRH, n&s SNH, SnJV, MP	0402402104
DICENTRA chrysantha (Hook. & Arn.) Walp.	NW, CW, SN, SW	19fdfbdd01
DICENTRA formosa (Haw.) Walp.	NW, CaR, SNH, n CW	073dc30900
DICENTRA nevadensis Eastw.	s SNH (Sequoia & Kings Canyon National Parks, Tulare Co.)	0000000100
DICENTRA ochroleuca Engelm.	s CW, SW	19c0035c01
DICENTRA pauciflora S. Watson	KR, n&s SNH	0001400100
DICENTRA uniflora Kellogg	KR, NCoRH, CaRH, SNH	0409c00100
DICHELOSTEMMA capitatum (Benth.) A.W. Wood	CA	ffffffff07
DICHELOSTEMMA capitatum (Benth.) A.W. Wood ssp. capitatum	CA	ffffffff07
DICHELOSTEMMA capitatum (Benth.) A.W. Wood ssp. pauciflorum (Torrey) Keator	SNE, D	e000040002
DICHELOSTEMMA congestum (Sm.) Kunth	NW, CaR, n SN, SnFrB	063d480800
DICHELOSTEMMA ida-maia (A.W. Wood) E. Greene	NCo, KR, n&c NCoR	003d000000
DICHELOSTEMMA multiflorum (Benth.) A.A. Heller	NW, n SN, uncommon in n&w SnFrB	003d480800
DICHELOSTEMMA volubile (Kellogg) A.A. Heller	NCoRI, CaRF, SNF	0210380000
DICHONDRA donelliana Tharp & M. Johnston	NCo, n SN, CW, probably introduced in SCo, n ChI	09844b0800
DICHONDRA occidentalis House	SCo, s ChI	1080000000
DICORIA canescens A. Gray	D	e000000000
DIGITALIS purpurea L.	NCo, NCoRO, n SNF, SnFrB, SCoRO	00240a0800
DIGITARIA ischaemum (Schreber) Muhlenb.	SnJV, CCo, SCo, expected elsewhere	0180002000
DIGITARIA sanguinalis (L.) Scop.	NCo, s CaRF, SNF, CW, SCo, expected elsewhere	03843b0800
DIMERESIA howellii A. Gray	MP	0002000004
DIMORPHOTHECA sinuata DC.	SnJV, SCoRO, SCo, PR	00c0026000
DIODIA teres Walter	DSon (sw Imperial Co)	8000000000
DIPLOTAXIS muralis (L.) DC.	SCo, expected elsewhere	0080000000
DIPLOTAXIS tenuifolia (L.) DC.	ScV, SCo, expected elsewhere	0080000200
DIPSACUS fullonum L.	NCo, KR, c&s SNF, SnFrB	0005300800
DIPSACUS sativus (L.) Honck.	NCo, NCoRO, SnFrB, SCoR, PR	0064034800
DIRCA occidentalis A. Gray	SnFrB	0000000800
DISPORUM hookeri (Torrey) Nicholson	NW, SN, CW	013dfb8900
DISPORUM smithii (Hook.) Piper	w NW, SnFrB	003d000800
DISSANTHELIUM californicum (Nutt.) Benth.	s ChI (Santa Catalina, San Clemente islands)	1000000000
DISTICHLIS spicata (L.) E. Greene	CA	ffffffff07
DITAXIS californica (Brandegee) Pax & K. Hoffm.	DMoj (Eagle Mtn), nw DSon (Coachella Valley)	e000000000
DITAXIS clariana (Jepson) Webster	DSon (Coachella Valley)	8000000000
DITAXIS lanceolata (Benth.) Pax & K. Hoffm.	DMoj (Eagle Mtn), DSon	e000000000
DITAXIS neomexicana (Muell. Arg.) A.A. Heller	DMoj (s edge), DSon	a000000000
DITAXIS serrata (Torrey) A.A. Heller	D	e000000000
DITHYREA californica Harvey	D	e000000000
DITHYREA maritima (Davidson) Davidson	s CCo, SCo	0180000000
DODECAHEMA leptoceras (A. Gray) Rev. & Hardham	c&e SCo, adjacent foothills of TR, PR	00c0005401
DODECATHEON alpinum (A. Gray) E. Greene	KR, NCoRH, SNH, n WTR (Mt. Pinos), SnBr, SnJt, Wrn, SNE	0009c44507
DODECATHEON clevelandii E. Greene	n&c SNF, c SNH, GV, CW, SW	19c09b7e01
DODECATHEON clevelandii E. Greene ssp. clevelandii	SCo, SnBr, SnJt, PR	00c0004400
DODECATHEON clevelandii E. Greene ssp. insulare H.J. Thompson	SCoRO, ChI	1800020000
DODECATHEON clevelandii E. Greene ssp. patulum (E. Greene) H.J. Thompson	n&c SNF, c SNH, GV, SnFrB, SCoRI	0000992a00
DODECATHEON clevelandii E. Greene ssp. sanctarum (E. Greene) Abrams	SnFrB, SCoR, WTR	0000030801
DODECATHEON conjugens E. Greene	MP	0002000004
DODECATHEON hendersonii A. Gray	NW (exc NCo), CaR, SNF, GV, SnFrB, n SCoRI, SnBr	0639392e00
DODECATHEON jeffreyi Van Houtte	NW (exc NCo), CaR, SN	0639f88100
DODECATHEON pulchellum (Raf.) Merr.	GB, DMtns	4002040006
DODECATHEON redolens (H.M. Hall) H.J. Thompson	c&s SNH, SnGb, SnBr, SnJt, SNE, DMtns	4000845502
DODECATHEON subalpinum Eastw.	c&s SNH	0000800100
DOPATRIUM junceum (Roxb.) Buch.-Ham.	ScV (Butte Co.)	0000000200
DOWNINGIA bacigalupii Weiler	CaR, n SNH, MP	0602400004
DOWNINGIA bella Hoover	GV (Colusa to Tulare cos), SCo (Santa Rosa Plateau, Riverside Co.), WTR (extreme n Ventura, s Kern cos.)	0080002201
DOWNINGIA bicornuta A. Gray	NCoRI (sporadic), CaRF, SN, MP	0212f88104
DOWNINGIA bicornuta A. Gray var. bicornuta	NCoRI (sporadic), CaRF, SN, MP	0212f88104
DOWNINGIA bicornuta A. Gray var. picta Hoover	CaRF, n&c SNF	0200180000
DOWNINGIA concolor E. Greene	s NCoR, w ScV, s SnFrB, c PR	0078000a00
DOWNINGIA concolor E. Greene var. brevior McVaugh	c PR (Cuyamaca Lake)	0040000000
DOWNINGIA concolor E. Greene var. concolor	s NCoR, w ScV (Lake to Solano cos.) SnFrB (Monterey Co.)	0038000a00
DOWNINGIA cuspidata (E. Greene) E. Greene	NW, c SNF, SnJV, SCoRO, PR	007d126000
DOWNINGIA elegans (Lindley) Torrey	NW	003d000000
DOWNINGIA insignis E. Greene	n SNH, c GV (Glenn to Stanislaus cos.), MP	0002402204
DOWNINGIA laeta (E. Greene) E. Greene	MP	0002000004
DOWNINGIA montana E. Greene	CaRH, n&c SN	0400d80000
DOWNINGIA ornatissima E. Greene	GV	0000002200
DOWNINGIA ornatissima E. Greene var. eximia (Hoover) McVaugh	ScV, SnJV	0000002200
DOWNINGIA ornatissima E. Greene var. ornatissima	ScV, n SnJV	0000002200
DOWNINGIA pulchella (Lindley) Torrey	s Teh, c&s ScV, n SnJV, s SnFrB	000000aa00
DOWNINGIA pusilla (Don) Torrey	NCoRI, s ScV, n&c SnJV	0010002200
DOWNINGIA yina Appleg.	KR, CaR	0601000000
DRABA albertina E. Greene	CaRH, SNH, SnGb, MP, n SNE, W&I	0402c41104
DRABA asterophora Payson	n&c SNH	0000c00000
DRABA asterophora Payson var. asterophora	n&c SNH	0000c00000
DRABA asterophora Payson var. macrocarpa C. Hitchc.	n SNH (near Cup Lake, El Dorado Co.)	0000400000
DRABA aureola S. Watson	KR, s CaRH (Lassen Peak)	0401000000
DRABA breweri S. Watson	CaRH, SNH, n SNE, W&I	0400c40100
DRABA californica (Jepson) Rollins & R.A. Price	n W&I (White Mtns, Mono Co.)	0000000002
DRABA cana Rydb.	s SNH (e slope, Inyo Co.)	0000000100
DRABA carnosula O. Schulz	KR (Mount Eddy area, Trinity and Siskiyou cos.)	0001000000
DRABA corrugata S. Watson	TR, PR	0040005401
DRABA corrugata S. Watson var. corrugata	SnGb, SnBr	0000001400
DRABA corrugata S. Watson var. saxosa (Davidson) Munz & I.M. Johnston	e PR (San Jacinto, Santa Rosa mtns)	0040004000
DRABA cruciata Payson	s SNH (near Mineral King, Tulare Co.; doubtfully near Lake Tahoe)	0000000100
DRABA cuneifolia Torrey & A. Gray	s SN, SnJV, SW, W&I, D	f8c0207503
DRABA densifolia Nutt.	SNH, n SNE, W&I	0000c40100
DRABA howellii S. Watson	KR	0001000000
DRABA incrassata (Rollins) Rollins & R.A. Price	n SNE (Sweetwater Mtns, Mono Co.)	0000040000
DRABA lemmonii S. Watson var. lemmonii	SNH	0000c00100
DRABA lonchocarpa Rydb. var. lonchocarpa	c SNH (Convict Creek Basin, Mono Co.)	0000800000
DRABA monoensis Rollins & R.A. Price	n W&I (White Mtns, Mono Co.), probably also in SNH	0000000002
DRABA nemorosa L.	e KR (Siskiyou Co.)	0001000000
DRABA oligosperma Hook. var. oligosperma	SNH, n SNE, W&I	0000c40100
DRABA paysonii J.F. Macbr. var. treleasei (O. Schulz) C. Hitchc.	n SNH	0000400000
DRABA praealta E. Greene	c SNH (e slope, Mono and Inyo cos.)	0000800000
DRABA pterosperma Payson	c KR (Marble Mtns, Siskiyou Co.)	0001000000
DRABA reptans (Lam.) Fern.	n SNH (Emigrant Gap, n Placer Co.), n DMtns (w Panamint Mtns)	4000400000
DRABA sharsmithii Rollins & R.A. Price	s SNH (Fresno, Inyo cos.)	0000000100
DRABA sierrae Sharsm.	c SNH (Fresno, Inyo cos.), W&I	0000800002
DRABA subumbellata Rollins & R.A. Price	s SNH (e slope, nw Inyo Co.), n W&I (White Mtns, Mono Co.)	0000000102
DRABA verna L.	CA-FP, MP	1ffffbff05
DRAPERIA systyla (A. Gray) Torrey	KR, CaRH, SN	0401f88100
DROSANTHEMUM floribundum (Haw.) Schwantes	NCo, CCo, SCo, ChI	1984000000
DROSERA anglica Hudson	Scattered in KR, CaRH, n SNH (n of Lake Tahoe), s Wrn	0401400004
DROSERA rotundifolia L.	Scattered in NW (esp near coast), CaR, SNH	063dc00100
DRYOPTERIS arguta (Kaulf.) Maxon	NW, SN, CW, SW	19fdfbdd01
DRYOPTERIS expansa (C. Presl) C.R. Fraser-Jenkins & Jermy	NCo, NCoRO, CCo	0124000000
DRYOPTERIS filix-mas (L.) Schott	SnBr, W&I	0000000402
DUCHESNEA indica L.	CA-FP	1ffdfbff01
DUDLEYA abramsii Rose	s SCoRO, SW	18c0025401
DUDLEYA abramsii Rose ssp. abramsii	PR	0040004000
DUDLEYA abramsii Rose ssp. affinis K. Nakai	SnBr, sw edge DMoj	2000000400
DUDLEYA abramsii Rose ssp. bettinae (Hoover) J. Bartel	s SCoRO (San Luis Obispo Co.)	0000020000
DUDLEYA abramsii Rose ssp. murina (Eastw.) Moran	s SCoRO (San Luis Obispo Co.)	0000020000
DUDLEYA abramsii Rose ssp. parva (Rose & Davidson) J. Bartel	s WTR (w Santa Monica Mtns, Ventura Co.)	0000000001
DUDLEYA attenuata (S. Watson) Moran ssp. orcuttii (Rose) Moran	s SCo (San Diego Co.)	0080000000
DUDLEYA blochmaniae (Eastw.) Moran	s CCo, SCo, n ChI	0980000000
DUDLEYA blochmaniae (Eastw.) Moran ssp. blochmaniae	s CCo, SCo	0180000000
DUDLEYA blochmaniae (Eastw.) Moran ssp. brevifolia Moran	s SCo (San Diego Co.)	0080000000
DUDLEYA blochmaniae (Eastw.) Moran ssp. insularis Moran	n ChI (Santa Rosa Island)	0800000000
DUDLEYA caespitosa (Haw.) Britton & Rose	CCo, SCo, n ChI	0980000000
DUDLEYA calcicola J. Bartel & J.R. Shevock	s SNH, Teh, w edge DMoj	2000008100
DUDLEYA candelabrum Rose	n ChI (Santa Cruz, Santa Rosa islands)	0800000000
DUDLEYA cymosa (Lemaire) Britton & Rose	NW, CaR, SN, CW, SW	1ffdfbdd01
DUDLEYA cymosa (Lemaire) Britton & Rose ssp. costafolia J. Bartel & J.R. Shevock	s SNH (Tule River, Tulare Co.)	0000000100
DUDLEYA cymosa (Lemaire) Britton & Rose ssp. crebrifolia K. Nakai & Verity	SnGb (Fish Canyon, Los Angeles Co.)	0000001000
DUDLEYA cymosa (Lemaire) Britton & Rose ssp. cymosa	NCoR, CaR, SN, SnFrB	0638f88900
DUDLEYA cymosa (Lemaire) Britton & Rose ssp. marcescens Moran	s WTR (Santa Monica Mtns)	0000000001
DUDLEYA cymosa (Lemaire) Britton & Rose ssp. ovatifolia (Britton) Moran	s WTR (Santa Monica Mtns)	0000000001
DUDLEYA cymosa (Lemaire) Britton & Rose ssp. paniculata (Jepson) K. Nakai	SnFrB, SCoRI	0000010800
DUDLEYA cymosa (Lemaire) Britton & Rose ssp. pumila (Rose) K. Nakai	SCoRO, TR	0000021401
DUDLEYA densiflora (Rose) Moran	SnGb (Los Angeles Co.)	0000001000
DUDLEYA edulis (Nutt.) Moran	SCo, PR	00c0004000
DUDLEYA farinosa (Lindley) Britton & Rose	NCo, n&c CCo	0104000000
DUDLEYA greenei Rose	ChI (San Miguel, Santa Rosa, Santa Cruz islands.)	1800000000
DUDLEYA hassei (Rose) Moran	s ChI (Santa Catalina Island)	1000000000
DUDLEYA lanceolata (Nutt.) Britton & Rose	SCoR, TR, PR, DMtns	4040035401
DUDLEYA multicaulis (Rose) Moran	SCo (Los Angeles, Orange, Riverside, San Diego, San Bernardino cos.)	0080000000
DUDLEYA nesiotica Moran	n ChI (Fraser Point, Santa Cruz Island)	0800000000
DUDLEYA palmeri (S. Watson) Britton & Rose	CCo, SCo (San Luis Obispo, Santa Barbara cos.)	0180000000
DUDLEYA pulverulenta (Nutt.) Britton & Rose	c&s CCo, SCoRO, SCo, TR, PR, DMtns	41c0025401
DUDLEYA pulverulenta (Nutt.) Britton & Rose ssp. arizonica (Rose) Moran	DMtns	4000000000
DUDLEYA pulverulenta (Nutt.) Britton & Rose ssp. pulverulenta	c&s CCo, SCoRO, SCo, TR, PR	01c0025401
DUDLEYA saxosa (M.E. Jones) Britton & Rose	PR, DMtns	4040004000
DUDLEYA saxosa (M.E. Jones) Britton & Rose ssp. aloides (Rose) Moran	PR, DMtns	4040004000
DUDLEYA saxosa (M.E. Jones) Britton & Rose ssp. saxosa	n DMtns (w Panamint Mtns)	4000000000
DUDLEYA setchellii (Jepson) Britton & Rose	se SnFrB (Santa Clara Co.)	0000000800
DUDLEYA stolonifera Moran	c SCo (San Joaquin Hills, Orange Co.)	0080000000
DUDLEYA traskiae (Rose) Moran	s ChI (Santa Barbara Island)	1000000000
DUDLEYA variegata (S. Watson) Moran	s SCo, s PR (San Diego Co.)	00c0000000
DUDLEYA verityi K. Nakai	s WTR (w Santa Monica Mtns, Ventura Co.)	0000000001
DUDLEYA virens (Rose) Moran	c SCo (Los Angeles Co.), s ChI (San Clemente, San Nicolas, Santa Catalina islands)	1080000000
DUDLEYA viscida (S. Watson) Moran	s SCo (Orange, San Diego cos.)	0080000000
DUGALDIA hoopesii (A. Gray) Rydb.	KR, SN, Wrn, n SNE	0001fc8104
DULICHIUM arundinaceum (L.) Britton	KR, CaR, SN	0601f88100
DYSSODIA papposa (Vent.) A. Hitchc.	e SCo (sw San Bernardino Co.)	0080000000
EASTWOODIA elegans Brandegee	Teh, s SnJV, se SnFrB, SCoRI	000001a800
EATONELLA nivea (D.C. Eaton) A. Gray	GB	0002040006
ECHINOCACTUS polycephalus Engelm. & J. Bigelow var. polycephalus	e SnBr, DMoj, n DSon	e000000400
ECHINOCEREUS engelmannii (Engelm.) Lemaire	SnBr, PR, W&I, D	e040004402
ECHINOCEREUS triglochidiatus Engelm.	W&I, D	e000000002
ECHINOCHLOA colona (L.) Link	s SnFrB, DSon, expected elsewhere	8000000800
ECHINOCHLOA crus-galli (L.) P. Beauv.	CA (esp CA-FP)	ffffffff07
ECHINOCHLOA crus-pavonis (Kunth) Schultes	GV, SCo, expected elsewhere	0080002200
ECHINOCHLOA muricata (P. Beauv.) Fern.	CA (esp CA-FP)	ffffffff07
ECHINOCHLOA oryzoides (Ard.) Fritsch	s ScV	0000000200
ECHINODORUS berteroi (Sprengel) Fassett	NCoRI, GV, CW, SW	19d0037e01
ECHINOPS sphaerocephalus L.	MP	0002000004
ECHIUM candicans L.f.	CCo, SnFrB, SCo	0180000800
ECHIUM plantagineum L.	c CCo, SCo	0180000000
ECLIPTA prostrata (L.) L.	GV, SCoR, SW, DSon	98c0037601
EGERIA densa Planchon	n&s SNF, SnJV, SnFrB, SnJt, SNE (expected elsewhere)	00002c6802
EHRHARTA calycina Smith	n CCo (Bodega Bay), SCoRO (Nipomo Mesa), WTR (Casitas Pass), expected elsewhere	0100020001
EHRHARTA erecta Lam.	e SnFrB, n SCo (Santa Barbara, Ventura cos.)	0080000800
EICHHORNIA crassipes (C. Martius) Solms-Laubach	GV, SnFrB, SCo, PR	00c0006a00
ELAEAGNUS angustifolius L.	SnJV, SnFrB, SNE, DMoj	6000042802
ELATINE ambigua Wight	GV	0000002200
ELATINE brachysperma A. Gray	CA	ffffffff07
ELATINE californica A. Gray	s NCoRH (Snow Mtn), GV, SnFrB	0008002a00
ELATINE chilensis C. Gay	n SNH, MP (Madeline Plains, Lassen Co.; Sierra Valley, Plumas Co.), PR	0042404004
ELATINE heterandra H. Mason	NCoR, SN	0038f88100
ELATINE rubella Rydb.	CA	ffffffff07
ELEOCHARIS acicularis (L.) Roemer & Schultes	CA-FP, MP	1ffffbff05
ELEOCHARIS acicularis (L.) Roemer & Schultes var. acicularis	CA-FP	1ffdfbff01
ELEOCHARIS acicularis (L.) Roemer & Schultes var. bella Piper	NW, CaR, SN, MP	063ff88104
ELEOCHARIS atropurpurea (Retz.) Kunth	SCo, GV	0080002200
ELEOCHARIS bolanderi A. Gray	SN, Wrn	0000f88104
ELEOCHARIS geniculata (L.) Roemer & Schultes	SW, D	f8c0005401
ELEOCHARIS macrostachya Britton	CA	ffffffff07
ELEOCHARIS montevidensis Kunth	NW, CW, SW	19fd035c01
ELEOCHARIS obtusa (Willdenow) Schultes	NW, SN, MP	003ff88104
ELEOCHARIS obtusa (Willdenow) Schultes var. engelmannii (Steudel) Gilly	s NW (Marin, Lake cos.), SN, n MP	003ff88104
ELEOCHARIS obtusa (Willdenow) Schultes var. obtusa	NW	003d000000
ELEOCHARIS pachycarpa Desv.	n NCoRO (Humboldt Co.), SN (Amador, El Dorado cos.)	0020f88100
ELEOCHARIS parishii Britton	CA (exc MP)	fffdffff03
ELEOCHARIS parvula (Roemer & Schultes) Link	NCo, GB, D	e006040006
ELEOCHARIS pauciflora (Light.) Link	NW, CaR, SN, SnBr, SnJt, MP	063ff8c504
ELEOCHARIS quadrangulata (Michaux) Roemer & Schultes	GV (Butte, Merced cos.)	0000002200
ELEOCHARIS radicans (Poiret) Kunth	NW, SnJV, CW, SW	19fd037c01
ELEOCHARIS rostellata (Torrey) Torrey	SnFrB, SW, SNE, D	f8c0045c03
ELEOCHARIS thermalis Rydb.	SNF, GV	0000382200
ELEUSINE indica (L.) Gaertner	CA-FP	1ffdfbff01
ELEUSINE tristachya (Lam.) Lam.	GV	0000002200
ELODEA canadensis Rich.	NCoRO, CaRH, SNH, GV, SnFrB, SnGb, SnBr, GB	0422c43f06
ELODEA nuttallii (Planchon) H. St. John	KR, SNH, ScV, SnBr, GB	0003c40706
ELYMUS arizonicus (Scribner & J.G. Smith) Gould	NCoRO (Mendocino Co.)	0020000000
ELYMUS californicus (Bolander) Gould	NCo, NCoRO, n CCo, SnFrB (Santa Cruz Mtns)	0124000800
ELYMUS canadensis L.	NCoRO (Sonoma Co.), expected elsewhere	0020000000
ELYMUS elymoides (Raf.) Swezey	KR, CaR, SN, TR, PR, GB, D, SnFrB	e643fcdd07
ELYMUS elymoides (Raf.) Swezey ssp. brevifolius (J.G. Smith) Barkworth	SnBr, PR, MP, W&I, DMoj	6042004406
ELYMUS elymoides (Raf.) Swezey ssp. californicus (J.G. Smith) Barkworth	KR, CaR, SN, SnGb, SnBr, SnJt, SNE	0601fcd502
ELYMUS elymoides (Raf.) Swezey ssp. elymoides	TR, SnJt, GB, D, SnFrB	e002045c07
ELYMUS elymoides (Raf.) Swezey ssp. hordeoides (Suksd.) Barkworth	KR (Siskiyou Co.)	0001000000
ELYMUS glaucus Buckley	CA	ffffffff07
ELYMUS glaucus Buckley ssp. glaucus	CA	ffffffff07
ELYMUS glaucus Buckley ssp. jepsonii (Burtt Davy) Gould	KR, NCoR, CaR, n SN, SCoR, TR, PR	06794b5401
ELYMUS glaucus Buckley ssp. virescens (Piper) Gould	NCo, NCoRO, CW	0124030800
ELYMUS lanceolatus (Scribner & J.G. Smith) Gould ssp. lanceolatus	CaR, n SN, MP	0602480004
ELYMUS multisetus (J.G. Smith) Burtt Davy	CA	ffffffff07
ELYMUS scribneri (Vasey) M.E. Jones	n SNE, W&I	0000040000
ELYMUS sierrus Gould	SNH	0000c00100
ELYMUS stebbinsii Gould	NCoRI, SN, SCoR, TR, PR	0050fbd501
ELYMUS trachycaulus (Link) Shinn.	CA (exc GV)	ffffffdd07
ELYMUS trachycaulus (Link) Shinn. ssp. subsecundus (Link) Gould	SN, MP	0002f88104
ELYMUS trachycaulus (Link) Shinn. ssp. trachycaulus	CA (exc GV)	ffffffdd07
ELYTRIGIA elongata (Host) Nevski	s SNF, n SNH, Teh, MP	0002608004
ELYTRIGIA intermedia (Host) Nevski ssp. intermedia	KR, NCoRI (Yolo Co.), CaR, SN, WTR, SnBr, DMtns	4611f88501
ELYTRIGIA juncea (L.) Nevski ssp. boreali-atlantica (Simonet & Guin.) Hylander	n CCo (San Francisco)	0100000000
ELYTRIGIA pontica (Podp.) Holub ssp. pontica	CA (exc NW)	ffc2ffff07
ELYTRIGIA repens (L.) Nevski	CA (exc D)	1fffffff07
EMEX australis Steinh.	CCo, expected elsewhere	0100000000
EMEX spinosa (L.) Campdera	SCo, expected elsewhere	0080000000
EMMENANTHE penduliflora Benth.	NCoRH, NCoRI, c&s SN, SnJV, CW, SW, SNE, D	f9d8b77d03
EMMENANTHE penduliflora Benth. var. penduliflora	NCoRH, NCoRI, c&s SN, SnJV, CW, SW, SNE, D	f9d8b77d03
EMMENANTHE penduliflora Benth. var. rosea Brand	SnFrB, SCoRI, n WTR (Mount Pinos)	0000010801
EMPETRUM nigrum L.	n NCo (Del Norte, Humboldt cos.)	0004000000
ENCELIA actoni Elmer	sw SnJV and adjacent WTR (Cuyama Valley), w D and adjacent CA-FP, W&I, DMtns	e04020f503
ENCELIA californica Nutt.	SCo, s CCo, w PR, WTR	01c0000001
ENCELIA farinosa Torrey & A. Gray	e SCo and adjacent PR, D	e0c0000000
ENCELIA farinosa X- E. frutescens	D	e000000000
ENCELIA frutescens (A. Gray) A. Gray	D	e000000000
ENCELIA virginensis Nelson	e DMoj, DMtns	6000000000
ENCELIOPSIS covillei (Nelson) S.F. Blake	n DMtns (w side Panamint Mtns)	4000000000
ENCELIOPSIS nudicaulis (A. Gray) Nelson	W&I, DMtns	4000000002
ENNEAPOGON desvauxii P. Beauv.	e DMoj (DMtns)	6000000000
EPHEDRA aspera S. Watson	D	e000000000
EPHEDRA californica S. Watson	s SNF, Teh, w SnJV, SCoR, SW, D	f8c023f401
EPHEDRA fasciculata Nelson	D	e000000000
EPHEDRA fasciculata Nelson var. clokeyi (Cutler) Clokey	D	e000000000
EPHEDRA fasciculata Nelson var. fasciculata	D	e000000000
EPHEDRA funerea Cov. & C. Morton	DMoj	6000000000
EPHEDRA nevadensis S. Watson	s SN, SNE, D	e000240102
EPHEDRA trifurca Torrey	DSon	8000000000
EPHEDRA viridis Cov.	s SNF, Teh, SnJV, SCoR, WTR, GB, DMtns	400227a007
EPILOBIUM anagallidifolium Lam.	KR, CaRH, SNH, SnBr, n W&I	0401c00502
EPILOBIUM angustifolium L. ssp. circumvagum Mosq.	NCo, KR, NCoRO, CaRH, SNH, SnBr, W&I, ne DMtns	4425c00502
EPILOBIUM brachycarpum C. Presl	CA-FP (exc ChI), MP, W&I	07fffbff07
EPILOBIUM canum (E. Greene) Raven	CA-FP (exc NCo, NCoRH)	1ff1fbff01
EPILOBIUM canum (E. Greene) Raven ssp. canum	CA-FP (exc SNH)	1ffdfbff01
EPILOBIUM canum (E. Greene) Raven ssp. latifolium (Hook.) Raven	KR, CaR, c&s SNF, SNH, Teh, SnJV, TR	0601f0b501
EPILOBIUM ciliatum Raf.	+/- CA	ffffffff07
EPILOBIUM ciliatum Raf. ssp. ciliatum	+/- CA	ffffffff07
EPILOBIUM ciliatum Raf. ssp. glandulosum (Lehm.) P. Hoch & Raven	KR, NCoR, CaR, SNH, TR, Wrn	0639c01505
EPILOBIUM ciliatum Raf. ssp. watsonii (Barbey) P. Hoch & Raven	NCo, CCo	0104000000
EPILOBIUM clavatum Trel.	KR, CaRH, c SNH, Wrn	0401800004
EPILOBIUM cleistogamum (Curran) P. Hoch & Raven	SNF, GV, SCoRO	00003a2200
EPILOBIUM densiflorum (Lindley) P. Hoch & Raven	CA-FP (exc SCo, ChI)	077dfbff01
EPILOBIUM foliosum (Torrey & A. Gray) Suksd.	KR, NCoR, CaRH, n SNF, SNH, ScV, CCo, SnFrB, SCoRO, WTR, SnGb	0539ca1b01
EPILOBIUM glaberrimum Barbey	KR, NCoRH, CaRH, SNH, TR, PR, Wrn, n W&I	0449c05507
EPILOBIUM glaberrimum Barbey ssp. fastigiatum (Nutt.) P. Hoch & Raven	KR, NCoRH, CaRH, SNH, Wrn	0409c00104
EPILOBIUM glaberrimum Barbey ssp. glaberrimum	KR, NCoRH, CaRH, SNH, TR, PR, Wrn, n W&I	0449c05507
EPILOBIUM halleanum Hausskn.	KR, NCoR, CaR, SNH, SnFrB, TR, PR, MP	067bc05d05
EPILOBIUM hornemannii Reichb. ssp. hornemannii	KR, NCoRH, CaRH, SNH, SnBr, SnJt, Wrn, n W&I	0409c04506
EPILOBIUM howellii P. Hoch	n&c SNH (Yuba Pass, Sierra Co.)	0000c00000
EPILOBIUM lactiflorum Hausskn.	KR, CaRH, SNH, n W&I	0401c00102
EPILOBIUM latifolium L.	n&c SNH	0000c00000
EPILOBIUM leptophyllum Raf.	s SNE	0000040002
EPILOBIUM luteum Pursh	n KR	0001000000
EPILOBIUM minutum Lehm.	NW, CaR, n&c SN, ScV, CW, MP	073fdb0a04
EPILOBIUM nivium Brandegee	s NCoRH	0008000000
EPILOBIUM obcordatum A. Gray	CaRH, SNH, MP	0402c00104
EPILOBIUM oreganum E. Greene	KR, NCoRO	0021000000
EPILOBIUM oregonense Hausskn.	KR, CaRH, SNH, SnBr, SnJt, Wrn	0401c04504
EPILOBIUM pallidum (Eastw.) P. Hoch & Raven	CaR, n SNF, ScV, MP	0602080204
EPILOBIUM palustre L.	c SNH (Grass Lake, El Dorado Co.)	0000800000
EPILOBIUM pygmaeum (Speg.) P. Hoch & Raven	CA-FP (exc ChI, e TR), MP	07fffbff05
EPILOBIUM rigidum Hausskn.	nw KR (Del Norte Co.)	0001000000
EPILOBIUM saximontanum Hausskn.	c&s SNH, SNE	0000840102
EPILOBIUM septentrionale (Keck) Raven	NCo, NCoRO	0024000000
EPILOBIUM siskiyouense (Munz) P. Hoch & Raven	n KR	0001000000
EPILOBIUM torreyi (S. Watson) P. Hoch & Raven	NW (exc NCo), CaR, SN, GV, SnFrB, SCoRO, MP, sw DMoj	663bfaab04
EPIPACTIS gigantea Hook.	CA-FP (exc GV, s ChI), SNE, D	effdffdd03
EPIPACTIS helleborine (L.) Crantz	s NCoRO, c SNH, CCo, SnFrB (expected elsewhere)	0120800800
EQUISETUM arvense L.	CA-FP, MP, W&I	1ffffbff07
EQUISETUM hyemale L. ssp. affine (Engelm.) Calder & R.H. Taylor	CA-FP, MP, W&I	1ffffbff07
EQUISETUM laevigatum A. Braun	CA-FP, MP, W&I, DMtns	5ffffbff07
EQUISETUM palustre L.	SnFrB (San Francisco)	0000000800
EQUISETUM telmateia Ehrh. ssp. braunii (Milde) R.L. Hauke	NW, CW, SW	19fd035c01
ERAGROSTIS barrelieri Daveau	GV, SCoRO, SCo, WTR, SnBr, PR	00c0026601
ERAGROSTIS cilianensis (All.) Janchen	CA	ffffffff07
ERAGROSTIS curvula (Schrad.) Nees var. conferta Nees	SCo (Riverside Co.)	0080000000
ERAGROSTIS curvula (Schrader) Nees var. curvula	CaRF, GV, SCoRO, SnBr, PR, DMoj	6240026600
ERAGROSTIS hypnoides (Lam.) Britton, Sterns, & Pogg.	KR, NCoR, c SNF, GV, SnFrB	0039102a00
ERAGROSTIS lehmanniana Nees	SCo, DMoj	6080000000
ERAGROSTIS lutescens Scribner	c SNF, SnJV	0000102000
ERAGROSTIS mexicana (Hornem.) Link	CA	ffffffff07
ERAGROSTIS mexicana (Hornem.) Link ssp. mexicana	SnJV, SCo, WTR, SnBr	0080002401
ERAGROSTIS mexicana (Hornem.) Link ssp. virescens (J.S. Presl) Koch & E. S<#e1>nchez	CA	ffffffff07
ERAGROSTIS minor Host	NCoRO, n&c SNF, GV, SCo, MP, DMoj	60a2182204
ERAGROSTIS pectinacea (Michaux) Nees	CA	ffffffff07
ERAGROSTIS pectinacea (Michaux) Nees var. miserrima (Fourn.) Reeder	n SNF, GV	0000082200
ERAGROSTIS pectinacea (Michaux) Nees var. pectinacea	CA	ffffffff07
ERAGROSTIS pilosa (L.) P. Beauv. var. pilosa	KR, GV, MP	0003002204
ERECHTITES glomerata (Poiret) DC.	NCo, NCoRO, CCo, SCoRO	0124020000
ERECHTITES hieracifolia (L.) DC. var. hieracifolia	NCo, n CCo	0104000000
ERECHTITES minima (Poiret) DC.	NCo, NCoRO, CCo, SCoRO	0124020000
EREMALCHE exilis (A. Gray) E. Greene	W&I, D	e000000002
EREMALCHE parryi (E. Greene) E. Greene	c&s SNF, Teh, SnJV, e SnFrB, SCoRI, WTR	000031a801
EREMALCHE parryi (E. Greene) E. Greene ssp. kernensis (C. Wolf) D. Bates	s SnJV, s SCoRI (Kern, San Luis Obispo cos.)	0000012000
EREMALCHE parryi (E. Greene) E. Greene ssp. parryi	c&s SNF, Teh, n SnJV, e SnFrB, n SCoRI, WTR	000031a801
EREMALCHE rotundifolia (A. Gray) E. Greene	D	e000000000
EREMOCARPUS setigerus (Hook.) Benth.	CA-FP, w D	fffdfbff01
ERIASTRUM abramsii (Elmer) H. Mason	NCoRI, SnFrB, SCoRI	0010010800
ERIASTRUM brandegeae H. Mason	n&c NCoRI	0010000000
ERIASTRUM densifolium (Benth.) H. Mason	s SN, s CW, SW, SNE, w DMoj	79c0275d03
ERIASTRUM densifolium (Benth.) H. Mason ssp. austromontanum (Craig) H. Mason	s SN, w SCoR, TR, PR	0040235501
ERIASTRUM densifolium (Benth.) H. Mason ssp. densifolium	s CCo	0100000000
ERIASTRUM densifolium (Benth.) H. Mason ssp. elongatum (Benth.) H. Mason	s SCoRO, SW, w edge DMoj	38c0025401
ERIASTRUM densifolium (Benth.) H. Mason ssp. mohavense (Craig) H. Mason	SNE, w DMoj	6000040002
ERIASTRUM densifolium (Benth.) H. Mason ssp. sanctorum (Milliken) H. Mason	e SCo (along Santa Ana River, sw San Bernardino Co.)	0080000000
ERIASTRUM diffusum (A. Gray) H. Mason	W&I, D	e000000002
ERIASTRUM eremicum (Jepson) H. Mason ssp. eremicum	W&I, D	e000000002
ERIASTRUM filifolium (Nutt.) Wooton & Standley	SCo	0080000000
ERIASTRUM hooveri (Jepson) H. Mason	s&e SCoR	0000030000
ERIASTRUM luteum (Benth.) H. Mason	SCoR (Monterey, San Luis Obispo cos.)	0000030000
ERIASTRUM pluriflorum (A.A. Heller) H. Mason	c&s SNF, SnJV, SnFrB, e SCoR, w DMoj	6000332800
ERIASTRUM sapphirinum (Eastw.) H. Mason	s CA-FP, w D	fffdfbff01
ERIASTRUM sparsiflorum (Eastw.) H. Mason	s SNH, Teh, SNE, DMtns	4000048102
ERIASTRUM virgatum (Benth.) H. Mason	s CCo, n SCoRO (Monterey Co.)	0100020000
ERIASTRUM wilcoxii (Nelson) H. Mason	SNE, n DMtns	4000040002
ERICA lusitanica Rudolphi	NCo (Humboldt Co.)	0004000000
ERICAMERIA arborescens (A. Gray) E. Greene	KR, NCoR, SNF, s SNH (<2900 m), SCoR, WTR, SnFrB	00393b0901
ERICAMERIA bloomeri (A. Gray) J.F. Macbr.	CaR, SN, MP	0602f88104
ERICAMERIA brachylepis (A. Gray) H.M. Hall	s PR, s SCo	00c0000000
ERICAMERIA cooperi (A. Gray) H.M. Hall var. cooperi	SNE, DMoj	6000040002
ERICAMERIA cuneata (A. Gray) McClatchie	SN, SCoR, TR, PR, SNE, D	e040ffd503
ERICAMERIA cuneata (A. Gray) McClatchie var. cuneata	SN, WTR, SnGb, PR, SNE	0040fcd103
ERICAMERIA cuneata (A. Gray) McClatchie var. macrocephala Urb.	c PR (Laguna Mtns, San Diego Co.)	0040000000
ERICAMERIA cuneata (A. Gray) McClatchie var. spathulata (A. Gray) H.M. Hall	Teh, SCoRI, D	e000018000
ERICAMERIA discoidea (Nutt.) G. Nesom	SNH, Wrn, n SNE (Sweetwater Mtns)	0000c40104
ERICAMERIA ericoides (Less.) Jepson	s NCo, CCo, SCoRO, c SCo	0184020000
ERICAMERIA fasciculata (Eastw.) J.F. Macbr.	c CCo (n Monterey Co.)	0100000000
ERICAMERIA gilmanii (S.F. Blake) G. Nesom	W&I, n DMtns (Panamint Mtns)	4000000002
ERICAMERIA greenei (A. Gray) G. Nesom	KR, NCoRH, CaRH, n SNH, Wrn	0409400004
ERICAMERIA laricifolia (A. Gray) Shinn.	DMtns	4000000000
ERICAMERIA linearifolia (DC.) Urb. & J. Wussow	s SNF, ScV (Sutter Buttes), s SnJV, e CW, WTR, DMoj, w DSon	e100232a01
ERICAMERIA nana Nutt.	c SNE, DMtns	4000040002
ERICAMERIA ophitidis (J. Howell) G. Nesom	n NCoR (s Trinity, sw Shasta, w Tehama cos)	0038000000
ERICAMERIA palmeri (A. Gray) H.M. Hall	SCo, w DSon	8080000000
ERICAMERIA palmeri (A. Gray) H.M. Hall var. pachylepis (H.M. Hall) G. Nesom	n SCo, ChI, w DSon	9880000000
ERICAMERIA palmeri (A. Gray) H.M. Hall var. palmeri	s SCo (s San Diego Co.)	0080000000
ERICAMERIA parishii (E. Greene) H.M. Hall var. parishii	SnGb, SnBr, PR	0040005400
ERICAMERIA pinifolia (A. Gray) H.M. Hall	WTR, PR, w DSon	8040004001
ERICAMERIA suffruticosa (Nutt.) G. Nesom	SNH, n SNE (Sweetwater Mtns), W&I	0000c40100
ERIGERON aequifolius H.M. Hall	s SNH	0000000100
ERIGERON algidus Jepson	SNH, SNE	0000c40102
ERIGERON aliceae Howell	NW	003d000000
ERIGERON angustatus E. Greene	s NCoRO	0020000000
ERIGERON annuus (L.) Pers.	KR, n&c SNH	0001c00000
ERIGERON aphanactis (A. Gray) E. Greene	SnBr, SNE, DMtns	4000040402
ERIGERON aphanactis (A. Gray) E. Greene var. aphanactis	SnBr, SNE, DMtns	4000040402
ERIGERON aphanactis (A. Gray) E. Greene var. congestus (E. Greene) Cronq.	SnBr	0000000400
ERIGERON argentatus A. Gray	W&I, ne DMtns (Last Chance Mtns)	4000000002
ERIGERON austiniae E. Greene	MP	0002000004
ERIGERON barbellulatus E. Greene	CaRH, n&c SNH	0400c00000
ERIGERON biolettii E. Greene	NCoRO	0020000000
ERIGERON blochmaniae E. Greene	s CCo	0100000000
ERIGERON bloomeri A. Gray	KR, CaR, n SNH, GB	0603440006
ERIGERON bloomeri A. Gray var. bloomeri	CaR, n SNH, GB	0602440006
ERIGERON bloomeri A. Gray var. nudatus (A. Gray) Cronq.	KR	0001000000
ERIGERON breweri A. Gray	KR, SNH, TR, SnJt, SNE, DMoj	6001c45503
ERIGERON breweri A. Gray var. bisanctus G. Nesom	SnGb, SnBr	0000001400
ERIGERON breweri A. Gray var. breweri	n&s SNH, SnBr	0000400500
ERIGERON breweri A. Gray var. covillei (E. Greene) G. Nesom	s SNH (e slope), SnGb, SnBr, SnJt, DMoj	6000005500
ERIGERON breweri A. Gray var. jacinteus (H.M. Hall) Cronq.	SnBr, SnGb, SnJt	0000005400
ERIGERON breweri A. Gray var. klamathensis G. Nesom	KR	0001000000
ERIGERON breweri A. Gray var. porphyreticus (M.E. Jones) Cronq.	SnBr, SNE, DMoj	6000040402
ERIGERON calvus Cov.	s SNE (w base Inyo Mtns)	0000040002
ERIGERON cervinus E. Greene	KR	0001000000
ERIGERON clokeyi Cronq.	s SNH, SNE, DMtns	4000040102
ERIGERON compactus S.F. Blake	W&I	0000000002
ERIGERON compositus Pursh	SNH, Wrn, SNE	0000c40106
ERIGERON concinnus (Hook. & Arn.) Torrey & A. Gray	DMtns	4000000000
ERIGERON concinnus (Hook. & Arn.) Torrey & A. Gray var. concinnus	DMtns	4000000000
ERIGERON concinnus (Hook. & Arn.) Torrey & A. Gray var. condensatus D. Eaton	DMtns	4000000000
ERIGERON coulteri Porter	SNH, Wrn	0000c00104
ERIGERON decumbens Nutt. var. robustior (Cronq.) Cronq.	NCoRO	0020000000
ERIGERON divergens Torrey & A. Gray	s SN, SnGb, SnBr, SnJt, GB, D	e002245506
ERIGERON eatonii A. Gray	CaR, n&c SNH, MP, SNE	0602c40006
ERIGERON eatonii A. Gray var. nevadincola (S.F. Blake) G. Nesom	MP	0002000004
ERIGERON eatonii A. Gray var. plantagineus (E. Greene) Cronq.	CaR, MP	0602000004
ERIGERON eatonii A. Gray var. sonnei (E. Greene) G. Nesom	n&c SNH, SNE	0000c40002
ERIGERON elegantulus E. Greene	MP	0002000004
ERIGERON elmeri (E. Greene) E. Greene	c SNH	0000800000
ERIGERON filifolius Nutt. var. filifolius	MP	0002000004
ERIGERON foliosus Nutt.	CA-FP (exc GV)	1ffdfbdd01
ERIGERON foliosus Nutt. var. confinis (Howell) Jepson	KR	0001000000
ERIGERON foliosus Nutt. var. foliosus	s SN, SCoRO, TR, PR	0040225501
ERIGERON foliosus Nutt. var. franciscensis G. Nesom	SnFrB, n SCoR (scattered)	0000030800
ERIGERON foliosus Nutt. var. hartwegii (E. Greene) Jepson	n&c SNF	0000180000
ERIGERON foliosus Nutt. var. mendocinus E. Greene	NCoRO	0020000000
ERIGERON glaucus Ker-Gawler	NCo, CCo, SCoRO, n ChI	0904020000
ERIGERON inornatus A. Gray	NW, CaR, SN, MP	063ff88104
ERIGERON inornatus A. Gray var. calidipetris G. Nesom	CaR, MP	0602000004
ERIGERON inornatus A. Gray var. inornatus	NW, CaR, SN	063df88100
ERIGERON inornatus A. Gray var. keilii G. Nesom	s SN (Tulare Co.)	0000200100
ERIGERON karvinskianus DC.	c SNF, CCo, SnFrB	0100100800
ERIGERON lassenianus E. Greene	KR, CaRH, n SNH	0401400000
ERIGERON lassenianus E. Greene var. deficiens Cronq.	n SNH (Plumas Co.)	0000400000
ERIGERON lassenianus E. Greene var. lassenianus	KR, CaRH, n SNH	0401400000
ERIGERON linearis (Hook.) Piper	n SNH, MP	0002400004
ERIGERON lobatus Nelson	DMoj (e San Bernardino Co.)	6000000000
ERIGERON mariposanus Congdon	SNF	0000380000
ERIGERON miser A. Gray	n SNH	0000400000
ERIGERON multiceps E. Greene	s SNH, SnBr	0000000500
ERIGERON parishii A. Gray	n SnBr (Cushenbury Canyon)	0000000400
ERIGERON peregrinus (Pursh) E. Greene	KR, CaRH, SNH, Wrn, SNE	0401c40106
ERIGERON peregrinus (Pursh) E. Greene var. callianthemus (E. Greene) Cronq.	KR, CaRH, SNH, Wrn, SNE	0401c40106
ERIGERON peregrinus (Pursh) E. Greene var. hirsutus Cronq.	c&s SNH, SNE	0000840102
ERIGERON petrophilus E. Greene	KR, NCoRO, n SNF, SnFrB, SCoRO	00210a0800
ERIGERON petrophilus E. Greene var. petrophilus	NCoRO, SnFrB, SCoRO	0020020800
ERIGERON petrophilus E. Greene var. sierrensis G. Nesom	n SNF	0000080000
ERIGERON petrophilus E. Greene var. viscidulus (A. Gray) G. Nesom	KR	0001000000
ERIGERON philadelphicus L.	CA (exc GV, DMtns)	bfffffdd07
ERIGERON pumilus Nutt. var. intermedius Cronq.	CaR, n SNH, MP, W&I	0602400006
ERIGERON pygmaeus (A. Gray) E. Greene	c SNH, SNE	0000840002
ERIGERON reductus (Cronq.) G. Nesom	KR, NCoRO, NCoRH, n SNH, SnFrB	0029400800
ERIGERON reductus (Cronq.) G. Nesom var. angustatus (A. Gray) G. Nesom	NCoRO, NCoRH, SnFrB	0028000800
ERIGERON reductus (Cronq.) G. Nesom var. reductus	KR, n SNH	0001400000
ERIGERON sanctarum S. Watson	s CCo, s SCoRO, n ChI	0900020000
ERIGERON serpentinus G. Nesom	NCoRO (nw Sonoma Co.)	0020000000
ERIGERON strigosus Willd.	CA-FP	1ffdfbff01
ERIGERON supplex A. Gray	n&c NCo	0004000000
ERIGERON tener A. Gray	KR, SNH, MP, W&I	0003c00106
ERIGERON uncialis S.F. Blake var. uncialis	W&I, DMoj	6000000002
ERIGERON utahensis A. Gray	e DMtns (Providence Mtns)	4000000000
ERIGERON vagus Payson	c SNH, W&I	0000800002
ERIOCHLOA acuminata (C. Presl) A. Hitchc. var. acuminata	SW, DSon	98c0005401
ERIOCHLOA aristata Vasey var. aristata	DSon (Imperial Co.)	8000000000
ERIOCHLOA contracta A. Hitchc.	Deltaic GV (Solano Co.), SW, DSon	98c0007601
ERIODICTYON altissimum P. Wells	SCoRO (sw San Luis Obispo Co.)	0000020000
ERIODICTYON angustifolium Nutt.	e DMtns (New York, Grapevine mtns)	4000000000
ERIODICTYON californicum (Hook. & Arn.) Torrey	NW, CaR, SN, GV, CW	073dfbab00
ERIODICTYON capitatum Eastw.	s CCo, s SCoRO, n SCo, w WTR (all Santa Barbara Co.)	0180020001
ERIODICTYON crassifolium Benth.	Teh, SCoRO, SCo, WTR, SnGb, PR	00c002d001
ERIODICTYON crassifolium Benth. var. crassifolium	SCo, WTR, SnGb, PR	00c0005001
ERIODICTYON crassifolium Benth. var. nigrescens Brand	Teh, SCoRO, SCo, WTR, SnGb, SnJt	008002d001
ERIODICTYON tomentosum Benth.	SCoR	0000030000
ERIODICTYON traskiae Eastw.	SCoRO, s ChI (Santa Catalina Island), WTR	1000020001
ERIODICTYON trichocalyx A.A. Heller	SCo, SnGb, SnBr, PR, D (w edge)	a0c0005400
ERIODICTYON trichocalyx A.A. Heller var. lanatum (Brand) Jepson	PR, DSon (w edge)	8040004000
ERIODICTYON trichocalyx A.A. Heller var. trichocalyx	SCo, SnGb, SnBr, PR, D (w edge)	a0c0005400
ERIOGONUM alpinum Engelm.	e KR (Mount Eddy area, s Siskiyou, ne Trinity cos.)	0001000000
ERIOGONUM ampullaceum J. Howell	n SNE	0000040000
ERIOGONUM angulosum Benth.	c&s SNF, Teh, SnJV, CW, TR, s PR, w DMoj	614033bc01
ERIOGONUM apiculatum S. Watson	c&s PR (Santa Rosa, Palomar, Cuyamaca mtns), sw DMtns (Little San Bernardino Mtns)	4040000000
ERIOGONUM apricum J. Howell	n SNF (w Amador Co.)	0000080000
ERIOGONUM apricum J. Howell var. apricum	n SNF (w Amador Co.)	0000080000
ERIOGONUM apricum J. Howell var. prostratum R. Myatt	n SNF (w Amador Co.)	0000080000
ERIOGONUM arborescens E. Greene	n ChI (exc San Miguel Island)	0800000000
ERIOGONUM argillosum J. Howell	s SnFrB, n SCoRI	0000010800
ERIOGONUM baileyi S. Watson	SNF, Teh, s SCoR, TR, GB, w DMoj	60023f9407
ERIOGONUM baileyi S. Watson var. baileyi	SNF, Teh, s SCoR, TR, GB, w DMoj	60023f9407
ERIOGONUM baileyi S. Watson var. praebens (Gand.) Rev.	GB	0002040006
ERIOGONUM beatleyae Rev.	n SNE	0000040000
ERIOGONUM bifurcatum Rev.	ne DMoj (s Inyo, ne San Bernardino cos.)	6000000000
ERIOGONUM brachyanthum Cov.	SNE, DMoj	6000040002
ERIOGONUM brachypodum Torrey & A. Gray	SNE, DMoj	6000040002
ERIOGONUM breedlovei (J. Howell) Rev.	s SNH	0000000100
ERIOGONUM breedlovei (J. Howell) Rev. var. breedlovei	s SNH (Piute Mtn, Kern Co.)	0000000100
ERIOGONUM breedlovei (J. Howell) Rev. var. shevockii J. Howell	s SNH (The Needles, Baker Point, Little Kern River gorge, Kern & Tulare cos.)	0000000100
ERIOGONUM butterworthianum J. Howell	n SCoRO (The Indians, Santa Lucia Mtns, c Monterey Co.)	0000020000
ERIOGONUM cernuum Nutt.	c SNH (e slope), GB	0002840006
ERIOGONUM cernuum Nutt. var. cernuum	c SNH (e slope), W&I	0000800002
ERIOGONUM cernuum Nutt. var. viminale (S. Stokes) Rev.	GB	0002040006
ERIOGONUM cespitosum Nutt.	GB	0002040006
ERIOGONUM cinereum Benth.	s CCo, w SCo, n ChI (Santa Rosa Island)	0980000000
ERIOGONUM cithariforme S. Watson	SCoR, TR	0000031401
ERIOGONUM compositum Benth. var. compositum	NW, CaR	063d000000
ERIOGONUM congdonii (S. Stokes) Rev.	KR	0001000000
ERIOGONUM contiguum (Rev.) Rev.	e DMoj (se Inyo, ne San Bernardino cos.)	6000000000
ERIOGONUM covilleanum Eastw.	c&s CW, WTR	0100030801
ERIOGONUM crocatum Davidson	s WTR (nw Santa Monica Mtns, Ventura Co.)	0000000001
ERIOGONUM dasyanthemum Torrey & A. Gray	c&s NCoR	0038000000
ERIOGONUM davidsonii E. Greene	SW, SNE, DMoj	78c0045403
ERIOGONUM deflexum Torrey	Teh, s SnJV, TR, SNE, D	e00004b403
ERIOGONUM deflexum Torrey var. baratum (Elmer) Rev.	Teh, s SnJV, TR, W&I, n&w DMoj	600000b403
ERIOGONUM deflexum Torrey var. deflexum	W&I, D	e000000002
ERIOGONUM deflexum Torrey var. nevadense Rev.	SNE	0000040002
ERIOGONUM deflexum Torrey var. rectum Rev.	s DMoj, DSon	e000000000
ERIOGONUM deserticola S. Watson	s DSon (Imperial Co.)	8000000000
ERIOGONUM diclinum Rev.	KR (Siskiyou, Trinity cos.)	0001000000
ERIOGONUM douglasii Benth. var. douglasii	e CaRH, n SNH, MP	0402400004
ERIOGONUM eastwoodianum J. Howell	s SCoRI (Fresno, Monterey cos.)	0000010000
ERIOGONUM elatum Benth.	n CA	ffffffff07
ERIOGONUM elatum Benth. var. elatum	n CA	ffffffff07
ERIOGONUM elatum Benth. var. villosum Jepson	KR, CaR, n SN, MP	0603480004
ERIOGONUM elegans E. Greene	SnFrB, SCoR, WTR	0000030801
ERIOGONUM elongatum Benth. var. elongatum	c&s CW, SW	19c0035c01
ERIOGONUM eremicola J. Howell & Rev.	s W&I (Inyo Mtns), n DMtns (Panamint Mtns)	4000000002
ERIOGONUM ericifolium Torrey & A. Gray var. thornei Rev. & Henrickson	e DMtns (New York Mtns)	4000000000
ERIOGONUM esmeraldense S. Watson var. esmeraldense	c SNH (e slope), SNE	0000840002
ERIOGONUM fasciculatum (Benth.) Torrey & A. Gray	c&s CA-FP, SNE, D	fffdffff03
ERIOGONUM fasciculatum (Benth.) Torrey & A. Gray var. fasciculatum	CCo	0100000000
ERIOGONUM fasciculatum (Benth.) Torrey & A. Gray var. flavoviride Munz & I.M. Johnston	D	e000000000
ERIOGONUM fasciculatum (Benth.) Torrey & A. Gray var. foliolosum (Nutt.) Abrams	CW, SW	19c0035c01
ERIOGONUM fasciculatum (Benth.) Torrey & A. Gray var. polifolium (Benth.) Torrey & A. Gray	s SN, SCoRI, e SCo, TR, e PR, SNE, D	e0c0251503
ERIOGONUM foliosum S. Watson	SnBr (Bear Valley), PR (scattered)	0040004400
ERIOGONUM giganteum S. Watson	s ChI	1000000000
ERIOGONUM giganteum S. Watson var. compactum Dunkle	s ChI (Santa Barbara Island)	1000000000
ERIOGONUM giganteum S. Watson var. formosum M.K. Brandegee	s ChI (San Clemente Island)	1000000000
ERIOGONUM giganteum S. Watson var. giganteum	s ChI (Santa Catalina Island)	1000000000
ERIOGONUM gilmanii S. Stokes	n DMtns (Panamint, Last Chance mtns)	4000000000
ERIOGONUM glandulosum (Nutt.) Benth.	n&ne DMtns	4000000000
ERIOGONUM gossypinum Curran	s SNF (Greenhorn Mtns), sw SnJV	0000202000
ERIOGONUM gracile Benth.	CA-FP (exc w SW)	1ffdfbff01
ERIOGONUM gracile Benth. var. gracile	CA-FP (exc w SW)	1ffdfbff01
ERIOGONUM gracile Benth. var. incultum Rev.	PR	0040004000
ERIOGONUM gracilipes S. Watson	c&s SNH (e slope), n W&I (White Mtns)	0000800102
ERIOGONUM gracillimum S. Watson	s SN, SCoR, TR, DMoj	6000231501
ERIOGONUM grande E. Greene	ChI	1800000000
ERIOGONUM grande E. Greene var. grande	ChI (Santa Cruz, Anacapa, Santa Catalina, San Clemente Islands)	1800000000
ERIOGONUM grande E. Greene var. rubescens (E. Greene) Munz	n ChI	0800000000
ERIOGONUM grande E. Greene var. timorum Rev.	s ChI (San Nicolas Island)	1000000000
ERIOGONUM heermannii Durand & Hilg.	c&s SNH (e slope), Teh, SCoR, TR, SNE, esp DMtns	4000879503
ERIOGONUM heermannii Durand & Hilg. var. argense (M.E. Jones) Munz	W&I, DMtns	4000000002
ERIOGONUM heermannii Durand & Hilg. var. floccosum Munz	e DMtns	4000000000
ERIOGONUM heermannii Durand & Hilg. var. heermannii	s SNH (Kern Co.), Teh, n TR, se SCoRO (se San Luis Obispo Co.)	0000029501
ERIOGONUM heermannii Durand & Hilg. var. humilius (S. Stokes) Rev.	c&s SNH (e slope), SNE, n DMtns	4000840102
ERIOGONUM heermannii Durand & Hilg. var. occidentale S. Stokes	+/- c SCoRI (San Benito, e Monterey cos.)	0000010000
ERIOGONUM heermannii Durand & Hilg. var. sulcatum (S. Watson) Munz & Rev	DMtns	4000000000
ERIOGONUM heracleoides Nutt. var. heracleoides	Wrn	0000000004
ERIOGONUM hirtellum J. Howell & Bacigal.	n KR (e Del Norte, Siskiyou cos)	0001000000
ERIOGONUM hirtiflorum S. Watson	NW, SN, n CW, TR	013dfb9d01
ERIOGONUM hoffmannii S. Stokes	n DMtns (Death Valley region, Inyo Co.)	4000000000
ERIOGONUM hoffmannii S. Stokes var. hoffmannii	n DMtns (w slope Panamint Mtns)	4000000000
ERIOGONUM hoffmannii S. Stokes var. robustius S. Stokes	ne DMtns (Black, Funeral mtns)	4000000000
ERIOGONUM hookeri S. Watson	SNE	0000040002
ERIOGONUM incanum Torrey & A. Gray	SNH	0000c00100
ERIOGONUM inerme (S. Watson) Jepson	s NCoR, c&s SN, Teh, CW, WTR	0138b38901
ERIOGONUM inflatum Torrey & Fr<#e9>mont	GB, D	e002040006
ERIOGONUM inflatum Torrey & Fr<#e9>mont var. deflatum I.M. Johnston	s DMoj, DSon	e000000000
ERIOGONUM inflatum Torrey & Fr<#e9>mont var. inflatum	GB, D	e002040006
ERIOGONUM intrafractum Cov. & C. Morton	n DMtns (Grapevine, Panamint mtns)	4000000000
ERIOGONUM kelloggii A. Gray	c NCoRO (Red Mtn, Mendocino Co.)	0020000000
ERIOGONUM kennedyi S. Watson	c&s SN, TR, SNE, nw DMtns	4000b41503
ERIOGONUM kennedyi S. Watson var. alpigenum (Munz & I.M. Johnston) Munz & I.M. Johnston	SnGb, SnBr	0000001400
ERIOGONUM kennedyi S. Watson var. austromontanum Munz & I.M. Johnston	n WTR (Mount Pinos), SnBr (Bear Valley)	0000000401
ERIOGONUM kennedyi S. Watson var. kennedyi	n WTR (Mount Pinos), SnBr	0000000401
ERIOGONUM kennedyi S. Watson var. pinicola Rev.	se-most SNF (s of Cache Peak, se Kern Co.)	0000380000
ERIOGONUM kennedyi S. Watson var. purpusii (Brandegee) Rev.	c&s SN (e slope), SNE, nw DMtns (Argus, Coso mtns)	4000b40102
ERIOGONUM latens Jepson	c&s SNH (e slope), W&I, n DMtns (Panamint Mtns)	4000800102
ERIOGONUM latifolium Smith	NCo, n&c CCo	0104000000
ERIOGONUM libertini Rev.	s KR, n NCoRH, n NCoRI (Trinity, Shasta, Tehama cos.)	0019000000
ERIOGONUM lobbii Torrey & A. Gray	NW, CaR, SN, GB	063ffc8106
ERIOGONUM luteolum E. Greene	n CA-FP	1ffdfbff01
ERIOGONUM luteolum E. Greene var. caninum (E. Greene) Rev.	c NCoRI (Colusa Co.), n CCo, n SnFrB (Marin, formerly Alameda cos.)	0110000800
ERIOGONUM luteolum E. Greene var. luteolum	NW, CaR, n&c SN, SnFrB	063dd80800
ERIOGONUM maculatum A.A. Heller	s SN, TR, GB, D	e002241507
ERIOGONUM marifolium Torrey & A. Gray	e KR, CaRH, n&c SNH	0401c00000
ERIOGONUM microthecum Nutt.	SN, SnGb, SnBr, GB, DMoj	6002fc9506
ERIOGONUM microthecum Nutt. var. alpinum Rev.	c SNH (Alpine Co.), n SNE	0000840000
ERIOGONUM microthecum Nutt. var. ambiguum (M.E. Jones) Rev.	SN (e slope), GB	0002fc8106
ERIOGONUM microthecum Nutt. var. corymbosoides Rev.	SnBr	0000000400
ERIOGONUM microthecum Nutt. var. johnstonii Rev.	SnGb, SnBr	0000001400
ERIOGONUM microthecum Nutt. var. lapidicola Rev.	s W&I (Inyo Mtns)	0000000002
ERIOGONUM microthecum Nutt. var. laxiflorum Hook.	SN (e slope), GB, DMtns	4002fc8106
ERIOGONUM microthecum Nutt. var. panamintense S. Stokes	s W&I (Inyo Mtns), n DMtns (Panamint Mtns)	4000000002
ERIOGONUM microthecum Nutt. var. simpsonii (Benth.) Rev.	s SNE, DMoj	6000040002
ERIOGONUM mohavense S. Watson	DMoj	6000000000
ERIOGONUM molestum E. Greene	n WTR, SnBr, PR	0040004401
ERIOGONUM nervulosum (S. Stokes) Rev.	s NCoRH, c&s NCoRI	0018000000
ERIOGONUM nidularium Cov.	GB, D	e002040006
ERIOGONUM nortonii E. Greene	n SCoR (Gabilan, e Santa Lucia Mtns, San Benito and Monterey cos.)	0000030000
ERIOGONUM nudum Benth.	CA (exc ChI)	e7ffffff07
ERIOGONUM nudum Benth. var. auriculatum (Benth.) Jepson	NW, CW	013d030800
ERIOGONUM nudum Benth. var. decurrens (S. Stokes) M. Bowerman	SnFrB (near Mount Diablo, Contra Costa Co.; Ben Lomond Hills, Santa Cruz Co.)	0000000800
ERIOGONUM nudum Benth. var. deductum (E. Greene) Jepson	SN, w SNE	0000fc8102
ERIOGONUM nudum Benth. var. indictum (Jepson) Rev.	e SCoRI	0000010000
ERIOGONUM nudum Benth. var. murinum Rev.	s SNF (Kaweah River drainage, Tulare Co.)	0000200000
ERIOGONUM nudum Benth. var. nudum	NW, CaR, SN, SnFrB	063df88900
ERIOGONUM nudum Benth. var. oblongifolium S. Watson	NW, CaR, n SN	063d480000
ERIOGONUM nudum Benth. var. paralinum Rev.	n NCo (Del Norte Co.)	0004000000
ERIOGONUM nudum Benth. var. pauciflorum S. Watson	TR, PR	0040005401
ERIOGONUM nudum Benth. var. pubiflorum Benth.	NW, CaR, SN, ScV, SnFrB	063df88b00
ERIOGONUM nudum Benth. var. regirivum Rev. & J. Stebb.	s SNF (Kings River near Pine Flat Reservoir, Fresno Co.)	0000200000
ERIOGONUM nudum Benth. var. scapigerum (Eastw.) Jepson	c&s SNH	0000800100
ERIOGONUM nudum Benth. var. westonii (S. Stokes) J. Howell	s SN, Teh, s CW, TR, s SNE, w DMoj	6100279d03
ERIOGONUM nummulare M.E. Jones	s MP, SNE, DMtns (Last Chance Mtns)	4002040006
ERIOGONUM nutans Torrey & A. Gray	e MP (ne Lassen Co.), n SNE (e Mono Co.)	0002040004
ERIOGONUM ochrocephalum S. Watson	GB	0002040006
ERIOGONUM ochrocephalum S. Watson var. alexanderae Rev.	n SNE (e Mono Co.)	0000040000
ERIOGONUM ochrocephalum S. Watson var. ochrocephalum	MP	0002000004
ERIOGONUM ordii S. Watson	s SNF, Teh, SCoRI, n WTR, sw DSon?	8000218001
ERIOGONUM ovalifolium Nutt.	KR, CaRH, SNH, ne SnBr, GB, DMtns	4403c40506
ERIOGONUM ovalifolium Nutt. var. eximium (Tidestrom) J. Howell	n SNH (El Dorado, Alpine cos.)	0000400000
ERIOGONUM ovalifolium Nutt. var. nivale (Canby) M.E. Jones	CaRH, SNH, n SNE, W&I	0400c40100
ERIOGONUM ovalifolium Nutt. var. ovalifolium	SNH (e slope), GB, DMtns	4002c40106
ERIOGONUM ovalifolium Nutt. var. purpureum (Nelson) Durand	KR, CaRH, SNH (e slope), GB	0403c40106
ERIOGONUM ovalifolium Nutt. var. vineum (Small) Jepson	ne SnBr (Cushenbury Canyon)	0000000400
ERIOGONUM palmerianum Rev.	SNE, D	e000040002
ERIOGONUM panamintense C. Morton	W&I, DMtns	4000000002
ERIOGONUM parishii S. Watson	s SN, TR, PR, n W&I (White Mtns)	0040205503
ERIOGONUM parvifolium Smith	CCo, SCo	0180000000
ERIOGONUM pendulum S. Watson	nw KR (n Del Norte Co.)	0001000000
ERIOGONUM plumatella Durand & Hilg.	D	e000000000
ERIOGONUM polypodum Small	s SNH (esp Tulare Co.)	0000000100
ERIOGONUM prattenianum Durand	SN	0000f88100
ERIOGONUM prattenianum Durand var. avium Rev. & J.R. Shevock	c&s SNH (Madera, Fresno cos.)	0000800100
ERIOGONUM prattenianum Durand var. prattenianum	n&c SN	0000d80000
ERIOGONUM prociduum Rev.	MP	0002000004
ERIOGONUM puberulum S. Watson	n DMtns (Cottonwood Mtns, Death Valley region, Inyo Co.)	4000000000
ERIOGONUM pusillum Torrey & A. Gray	SCoRI, WTR, GB, D	e002050007
ERIOGONUM pyrolifolium Hook.	CaRH	0400000000
ERIOGONUM reniforme Torrey & Fr<#e9>mont	D	e000000000
ERIOGONUM rixfordii S. Stokes	ne DMoj (Death Valley)	6000000000
ERIOGONUM rosense Nelson & Kenn.	s CaRH (Lassen Peak), n&c SNH, n SNE	0400c40000
ERIOGONUM roseum Durand & Hilg.	NW, SNF, Teh, CW, TR	013d3b9c01
ERIOGONUM saxatile S. Watson	s SN, CW, SW, SNE, DMtns	59c0275d03
ERIOGONUM shockleyi S. Watson var. shockleyi	SNE, n DMtns (Last Chance Mtns)	4000040002
ERIOGONUM siskiyouense Small	e KR (Mount Eddy, Scott Mtns)	0001000000
ERIOGONUM spergulinum A. Gray	NCoRH, CaRH, SN, n SCoRO, TR, GB	040afe9507
ERIOGONUM spergulinum A. Gray var. pratense (S. Stokes) J. Howell	s SNH	0000000100
ERIOGONUM spergulinum A. Gray var. reddingianum (M.E. Jones) J. Howell	NCoRH, CaRH, SN, n SCoRO, TR, GB	040afe9507
ERIOGONUM spergulinum A. Gray var. spergulinum	SN	0000f88100
ERIOGONUM sphaerocephalum Benth.	CaRH, n SNH, MP	0402400004
ERIOGONUM sphaerocephalum Benth. var. halimioides S. Stokes	CaRH, n SNH, MP	0402400004
ERIOGONUM sphaerocephalum Benth. var. sphaerocephalum	n SNH, MP	0002400004
ERIOGONUM strictum Benth.	KR, n NCoRO, NCoRH, CaR, ne SN, MP	062b480004
ERIOGONUM strictum Benth. var. anserinum (E. Greene) R. Davis	CaR, ne SN, MP	0602480004
ERIOGONUM strictum Benth. var. greenei (A. Gray) Rev.	KR	0001000000
ERIOGONUM strictum Benth. var. proliferum (Torrey & A. Gray) Rev.	KR, n NCoRO, NCoRH, CaR, ne SNH, w MP	062b400004
ERIOGONUM temblorense J. Howell & Twisselm.	s SCoRI (e Monterey, e San Luis Obispo, w Kern cos.)	0000010000
ERIOGONUM ternatum Howell	n KR, s NCoRO (nw Sonoma Co.), n NCoRH	0029000000
ERIOGONUM thomasii Torrey	D	e000000000
ERIOGONUM thurberi Torrey	e PR, s DMoj, DSon	e040000000
ERIOGONUM trichopes Torrey	SCoRI, n WTR, D	e000010001
ERIOGONUM trichopes Torrey var. hooveri Rev.	SCoRI, n WTR	0000010001
ERIOGONUM trichopes Torrey var. trichopes	D	e000000000
ERIOGONUM tripodum E. Greene	NCoRI, n&c SNF	0010180000
ERIOGONUM truncatum Torrey & A. Gray	deltaic ScV (Suisun, Solano Co.) (formerly ne SnFrB (Alameda and Contra Costa cos., esp e slope Mount Diablo))	0000000200
ERIOGONUM twisselmannii (J. Howell) Rev.	s SNH (The Needles and Slate Mtn, Tulare Co.)	0000000100
ERIOGONUM umbellatum Torrey	CA (exc coast)	fe7bffff07
ERIOGONUM umbellatum Torrey var. argus Rev.	KR, c NCoRH	0009000000
ERIOGONUM umbellatum Torrey var. bahiiforme (Torrey & A. Gray) Jepson	s NCoR, SnFrB, n SCoR	0038030800
ERIOGONUM umbellatum Torrey var. chlorothamnus Rev.	s SNH, SNE, nw DMoj	6000040102
ERIOGONUM umbellatum Torrey var. covillei (Small) Munz & Rev.	c&s SNH (esp Tulare, Inyo cos.), W&I	0000800102
ERIOGONUM umbellatum Torrey var. dichrocephalum Gand.	Wrn, W&I	0000000006
ERIOGONUM umbellatum Torrey var. furcosum Rev.	SNH	0000c00100
ERIOGONUM umbellatum Torrey var. glaberrimum (Gand.) Rev.	Wrn	0000000004
ERIOGONUM umbellatum Torrey var. humistratum Rev.	KR (esp Mount Eddy), n NCoRH (Yolla Bolly Mtns), n CaRH (Mount Shasta)	0409000000
ERIOGONUM umbellatum Torrey var. juniporinum Rev.	e DMtns (e San Bernardino Co.)	4000000000
ERIOGONUM umbellatum Torrey var. minus I.M. Johnston	SnGb, SnBr	0000001400
ERIOGONUM umbellatum Torrey var. munzii Rev.	TR, SnJt	0000005401
ERIOGONUM umbellatum Torrey var. nevadense Gand.	SN (e slope), GB, nw DMoj	6002fc8106
ERIOGONUM umbellatum Torrey var. polyanthum (Benth.) M.E. Jones	KR, CaR, n SN, MP	0603480004
ERIOGONUM umbellatum Torrey var. speciosum (Drew) S. Stokes	KR, n SNF (Butte Co.)	0001080000
ERIOGONUM umbellatum Torrey var. subaridum S. Stokes	se SN, TR, SNE, DMtns	4000241503
ERIOGONUM umbellatum Torrey var. torreyanum (A. Gray) M.E. Jones	n SNH (Sierra, Nevada, Placer cos.)	0000400000
ERIOGONUM umbellatum Torrey var. versicolor S. Stokes	s W&I (Inyo Mtns), DMtns	4000000002
ERIOGONUM ursinum S. Watson	s KR, s CaR, n SN	0601480000
ERIOGONUM vestitum J. Howell	ne SCoRI (Merced, San Benito, Fresno cos.)	0000010000
ERIOGONUM vimineum Benth.	ne KR, CaR, n SNH, MP	0603400004
ERIOGONUM viridescens A.A. Heller	SnJV, SCoR, TR, w DMoj	6000033401
ERIOGONUM wrightii Benth.	NW, s CaR, SN, CW, SW, W&I, D	fffdfbdd03
ERIOGONUM wrightii Benth. var. membranaceum Jepson	SW	18c0005401
ERIOGONUM wrightii Benth. var. nodosum (Small) Rev.	e PR, s-most DMoj, w DSon	e040000000
ERIOGONUM wrightii Benth. var. olanchense (J. Howell) Rev.	s SNH (Olancha Peak, Tulare Co.)	0000000100
ERIOGONUM wrightii Benth. var. subscaposum S. Watson	SN, CW, TR, e PR, W&I	0140fb9d03
ERIOGONUM wrightii Benth. var. trachygonum (Benth.) Jepson	NW, s CaR, n SNF	063d080000
ERIOGONUM wrightii Benth. var. wrightii	DMoj	6000000000
ERIONEURON pilosum (Buckley) Nash	SNE, e DMtns	4000040002
ERIONEURON pulchellum (Kunth) Tateoka	D	e000000000
ERIOPHORUM criniger (A. Gray) Beetle	NW, CaR, SNH	063dc00100
ERIOPHORUM gracile Koch	NW, CaR, n&c SNH	063dc00000
ERIOPHYLLUM ambiguum (A. Gray) A. Gray	s SNF, Teh, SNE, D	e000248002
ERIOPHYLLUM ambiguum (A. Gray) A. Gray var. ambiguum	s SNF, Teh	0000208000
ERIOPHYLLUM ambiguum (A. Gray) A. Gray var. paleaceum (Brandegee) Ferris	s SNF, Teh, SNE, D	e000248002
ERIOPHYLLUM confertiflorum (DC.) A. Gray	NCoR, SN, CW, SW, w edge D	b9f8fbdd01
ERIOPHYLLUM confertiflorum (DC.) A. Gray var. confertiflorum	NCoR, SN, CW, SW, w edge DMoj, w edge DSon	b9f8fbdd01
ERIOPHYLLUM confertiflorum (DC.) A. Gray var. tanacetiflorum (E. Greene) Jepson	c SNF	0000100000
ERIOPHYLLUM congdonii Brandegee	c SNF (Mariposa Co.)	0000100000
ERIOPHYLLUM jepsonii E. Greene	e CW	0100030800
ERIOPHYLLUM lanatum (Pursh) James Forbes	CA (exc SnJV, D)	1fffffdf07
ERIOPHYLLUM lanatum (Pursh) James Forbes var. achillaeoides (DC.) Jepson	KR, NCoR, CaRH, n&c SNF, c SNH, w CW, MP	053b9b0804
ERIOPHYLLUM lanatum (Pursh) James Forbes var. arachnoideum (Fischer & Av<#e9>-Lall.) Jepson	NCo, NCoRO, SnFrB, SCoRO?	0024020800
ERIOPHYLLUM lanatum (Pursh) James Forbes var. croceum (E. Greene) Jepson	SNH	0000c00100
ERIOPHYLLUM lanatum (Pursh) James Forbes var. grandiflorum (A. Gray) Jepson	KR, NCoRI, CaR, n&c SN, ScV	0611d80200
ERIOPHYLLUM lanatum (Pursh) James Forbes var. hallii Constance	s Teh (near Fort Tejon), se SCoRO (Sierra Madre Mtns)	0000028000
ERIOPHYLLUM lanatum (Pursh) James Forbes var. integrifolium (Hook.) F.J. Smiley	KR?, CaRH, n&c SNH, GB	0403c40006
ERIOPHYLLUM lanatum (Pursh) James Forbes var. lanceolatum (Howell) Jepson	KR	0001000000
ERIOPHYLLUM lanatum (Pursh) James Forbes var. obovatum (E. Greene) H.M. Hall	s SNH, SnBr	0000000500
ERIOPHYLLUM lanosum (A. Gray) A. Gray	D	e000000000
ERIOPHYLLUM latilobum Rydb.	cw SnFrB (San Mateo Co.)	0000000800
ERIOPHYLLUM mohavense (I.M. Johnston) Jepson	c DMoj (wc San Bernardino Co.)	6000000000
ERIOPHYLLUM multicaule (DC.) A. Gray	sw SnJV (e San Luis Obispo, ne Santa Barbara cos.), SCoR, SCo, SnGb, PR	00c0037000
ERIOPHYLLUM nevinii A. Gray	s ChI (Santa Barbara, Santa Catalina, San Clemente Islands)	1000000000
ERIOPHYLLUM nubigenum A. Gray	c SNH (Mariposa Co.)	0000800000
ERIOPHYLLUM pringlei A. Gray	s SNF, Teh, s SCoRO, SCoRI, TR, SNE, D	e000279403
ERIOPHYLLUM staechadifolium Lagasca	NCo, CCo, n ChI	0904000000
ERIOPHYLLUM wallacei (A. Gray) A. Gray	e SnFrB, SnGb, SnBr, PR, SNE, D	e040045c02
ERODIUM botrys (Cav.) Bertol.	CA-FP	1ffdfbff01
ERODIUM brachycarpum (Godron) Thell.	CA-FP	1ffdfbff01
ERODIUM cicutarium (L.) L'H<#e9>r.	CA	ffffffff07
ERODIUM cygnorum Nees	SCo	0080000000
ERODIUM macrophyllum Hook. & Arn.	ScV, n SnJV, CW, SCo, n ChI (Santa Cruz Island)	0980032a00
ERODIUM malacoides (L.) Willd.	n SnJV, SnFrB	0000002800
ERODIUM moschatum (L.) L'H<#e9>r.	CA-FP	1ffdfbff01
ERODIUM texanum A. Gray	s SnJV, s SCo, D	e080002000
ERUCA vesicaria (L.) Cav. ssp. sativa (Miller) Thell.	CaR, GV, SCoR, DSon	8600032200
ERUCASTRUM gallicum (Willd.) O. Schulz	s SnFrB	0000000800
ERYNGIUM alismaefolium E. Greene	CaRH, MP	0402000004
ERYNGIUM aristulatum Jepson	NCoR, SnFrB, SCoR, SCo, PR	00f8034800
ERYNGIUM aristulatum Jepson var. aristulatum	NCoR, SnFrB	0038000800
ERYNGIUM aristulatum Jepson var. hooveri Y. Sheikh	SnFrB, SCoR	0000030800
ERYNGIUM aristulatum Jepson var. parishii (J. Coulter & Rose) Jepson	s SCo, PR (San Diego, Riverside cos.)	00c0000000
ERYNGIUM armatum (S. Watson) J. Coulter & Rose	NCo, CCo	0104000000
ERYNGIUM articulatum Hook.	KR, NCoR, CaRH, deltaic ScV (Suisun Marshes), MP	043b000204
ERYNGIUM castrense Jepson	CaRF, n&c SNF, adjacent GV, SnFrB	0200182a00
ERYNGIUM constancei Y. Sheikh	NCoR (Lake Co.)	0038000000
ERYNGIUM mathiasiae Y. Sheikh	MP	0002000004
ERYNGIUM pinnatisectum Jepson	Near boundary of n&c SNF, adjacent GV (Sacramento, Amador, Calaveras, Tuolumne cos.)	0000182200
ERYNGIUM racemosum Jepson	n SnJV, adjacent SNF	0000382000
ERYNGIUM spinosepalum Mathias	e SnJV, adjacent SNF	0000382000
ERYNGIUM vaseyi J. Coulter & Rose	ScV, SCoRI, SCo	0080010200
ERYSIMUM ammophilum A.A. Heller	c CCo (Monterey Bay), n ChI (Santa Rosa Island)	0900000000
ERYSIMUM capitatum (Douglas) E. Greene	CA (exc GV)	ffffffdd07
ERYSIMUM capitatum (Douglas) E. Greene ssp. angustatum (E. Greene) R.A. Price	ne CCo (Antioch Dunes, Contra Costa Co.)	0100000000
ERYSIMUM capitatum (Douglas) E. Greene ssp. capitatum	CA (exc GV, SNH)	ffff3fdc07
ERYSIMUM capitatum (Douglas) E. Greene ssp. lompocense (Rossbach) R.A. Price	s SCoRO (San Luis Obispo, Santa Barbara cos.)	0000020000
ERYSIMUM capitatum (Douglas) E. Greene ssp. perenne (Cov.) R.A. Price	KR, CaRH, SNH	0401c00100
ERYSIMUM cheiranthoides L.	SN, GV, expected elsewhere	0000f8a300
ERYSIMUM cheiri (L.) Crantz	s ChI (Santa Catalina Island), e WTR	1000000001
ERYSIMUM franciscanum Rossbach	NCo, n&c CCo, SnFrB	0104000800
ERYSIMUM insulare E. Greene	s CCo, n SCo, n ChI	0980000000
ERYSIMUM insulare E. Greene ssp. insulare	n ChI	0800000000
ERYSIMUM insulare E. Greene ssp. suffrutescens (Abrams) R.A. Price	s CCo, n SCo	0180000000
ERYSIMUM menziesii (Hook.) Wettst.	NCo, CCo	0104000000
ERYSIMUM menziesii (Hook.) Wettst. ssp. concinnum (Eastw.) R.A. Price	NCo, n CCo (Point Reyes)	0104000000
ERYSIMUM menziesii (Hook.) Wettst. ssp. eurekense R.A. Price	n NCo (Humboldt Bay, Humboldt Co.)	0004000000
ERYSIMUM menziesii (Hook.) Wettst. ssp. menziesii	c NCo (near Fort Bragg, Mendocino Co.), c CCo (Monterey Bay Area, s of Point Pinos)	0104000000
ERYSIMUM menziesii (Hook.) Wettst. ssp. yadonii R.A. Price	c CCo (+/- c Monterey Bay, Monterey Co.)	0100000000
ERYSIMUM repandum L.	n&c SnJV, MP, expected elsewhere	0002002004
ERYSIMUM teretifolium Eastw.	sw SnFrB (Santa Cruz Co.)	0000000800
ERYTHRONIUM californicum Purdy	KR, NCoR	0039000000
ERYTHRONIUM citrinum S. Watson	KR	0001000000
ERYTHRONIUM grandiflorum Pursh	KR, NCoR	0039000000
ERYTHRONIUM helenae Appleg.	s NCoRI (near Mt. St. Helena)	0010000000
ERYTHRONIUM hendersonii S. Watson	KR	0001000000
ERYTHRONIUM klamathense Appleg.	KR, CaRH	0401000000
ERYTHRONIUM multiscapoideum (Kellogg) Nelson & Kenn.	CaRF, n&c SNF	0200180000
ERYTHRONIUM oregonum Appleg.	NCoRO	0020000000
ERYTHRONIUM pluriflorum J.R. Shevock, J. Bartel & G. Allen	c SNH (Madera Co.)	0000800000
ERYTHRONIUM purpurascens S. Watson	CaRH, n&c SNH	0400c00000
ERYTHRONIUM pusaterii (Munz & J. Howell) J.R. Shevock, J. Bartel, & G. Allen	s SNH (Tulare Co.)	0000000100
ERYTHRONIUM revolutum Smith	NCo, NCoRO	0024000000
ERYTHRONIUM tuolumnense Appleg.	c SNF (Tuolumne Co.)	0000100000
ESCHSCHOLZIA caespitosa Benth.	CA-FP (exc ChI)	07fdfbff01
ESCHSCHOLZIA californica Cham.	CA-FP, w SNE, DMoj	7ffdffff03
ESCHSCHOLZIA glyptosperma E. Greene	D	e000000000
ESCHSCHOLZIA hypecoides Benth.	SCoRI	0000010000
ESCHSCHOLZIA lemmonii E. Greene	s-most SNF, w Teh, e SCoRO, SCoRI, n WTR	00003b8001
ESCHSCHOLZIA lemmonii E. Greene ssp. kernensis (Munz) C. Clark	sw Teh, n WTR	0000008001
ESCHSCHOLZIA lemmonii E. Greene ssp. lemmonii	s-most SNF, w Teh, e SCoRO, SCoRI	00003b8000
ESCHSCHOLZIA lobbii E. Greene	SNF, GV	0000382200
ESCHSCHOLZIA minutiflora S. Watson	SNE, D	e000040002
ESCHSCHOLZIA parishii E. Greene	s DMoj, DSon	e000000000
ESCHSCHOLZIA ramosa E. Greene	ChI	1800000000
ESCHSCHOLZIA rhombipetala E. Greene	(Formerly known from 7 sites in NCoRI, e SnFrB, e SCoRO, SCoRI)	0000000000
ESCOBARIA vivipara (Nutt.) F. Buxb.	D	e000000000
ESCOBARIA vivipara (Nutt.) F. Buxb. var. alversonii (J. Coulter) D. Hunt	s DMoj, DSon	e000000000
ESCOBARIA vivipara (Nutt.) F. Buxb. var. deserti (Engelm.) D. Hunt	DMtns (e San Bernardino Co.)	4000000000
ESCOBARIA vivipara (Nutt.) F. Buxb. var. rosea (Clokey) D. Hunt	DMtns (ne San Bernardino Co.)	4000000000
EUCALYPTUS camaldulensis Dehnh.	NCoRO, SnFrB, GV, SCoRO, WTR, SCo, n ChI (Santa Cruz Island), PR	08e0026a01
EUCALYPTUS citriodora Hook.	SCo	0080000000
EUCALYPTUS cladocalyx F. Muell.	SCo	0080000000
EUCALYPTUS globulus Labill.	NCoRO, GV, SnFrB, SCoRO, SCo, n ChI (Santa Cruz Island), WTR, PR	08e0026a01
EUCALYPTUS polyanthemos Schauer	SnJV, SnFrB, SCo, WTR	0080002801
EUCALYPTUS pulverulenta Sims	SnFrB	0000000800
EUCALYPTUS sideroxylon Cunn.	SCo	0080000000
EUCALYPTUS tereticornis Smith	SnJV, SCo, WTR	0080002001
EUCALYPTUS viminalis Labill.	CCo	0100000000
EUCLIDIUM syriacum (L.) R.Br.	s MP (Lassen Co.)	0002000004
EUCNIDE rupestris (Baillon) H.J. Thompson & W.R. Ernst	s DSon (Painted Gorge, Imperial Co.)	8000000000
EUCNIDE urens (A. Gray) C. Parry	D	e000000000
EUCRYPTA chrysanthemifolia (Benth.) E. Greene	s SNF, Teh, SnJV, CW, SW, SNE, D	f9c027fc03
EUCRYPTA chrysanthemifolia (Benth.) E. Greene var. bipinnatifida (Torrey) Constance	s SNF, Teh, SnBr, e PR, SNE, D	e040248402
EUCRYPTA chrysanthemifolia (Benth.) E. Greene var. chrysanthemifolia	Teh, s SnJV, CW, SW	19c003fc01
EUCRYPTA micrantha (Torrey) A.A. Heller	SnJt, SNE, D	e000044002
EUONYMUS occidentalis Torrey	NW, CW, PR	017d034800
EUONYMUS occidentalis Torrey var. occidentalis	NW, CW	013d030800
EUONYMUS occidentalis Torrey var. parishii (Trel.) Jepson	PR	0040004000
EUPHORBIA crenulata Engelm.	CA-FP	1ffdfbff01
EUPHORBIA dentata Michaux	SnJV, CCo, SnFrB	0100002800
EUPHORBIA eriantha Benth.	DSon	8000000000
EUPHORBIA esula L.	s NCo (Sonoma Co.), e KR, CaR, MP	0607000004
EUPHORBIA exstipulata Engelm. var. exstipulata	e DMtns (Clark Mtns)	4000000000
EUPHORBIA helioscopia L.	n&c NCo, n&c NCoRO, SnFrB, SCo	00a4000800
EUPHORBIA incisa Engelm.	W&I, DMtns	4000000002
EUPHORBIA lathyris L.	NCo, CCo, GV, SCo (expected elsewhere)	0184002200
EUPHORBIA misera Benth.	SCo, s ChI, w DSon	9080000000
EUPHORBIA oblongata Griseb.	GV, SnFrB (expected elsewhere)	0000002a00
EUPHORBIA palmeri S. Watson	SW	18c0005401
EUPHORBIA peplus L.	CA-FP, DSon	9ffdfbff01
EUPHORBIA serrata L.	SnFrB	0000000800
EUPHORBIA spathulata Lam.	CA-FP	1ffdfbff01
EUSTOMA exaltatum (L.) Don	SCo, PR, DSon	80c0004000
EUTHAMIA occidentalis Nutt.	CA (exc D)	1fffffff07
FAGONIA laevis Standley	s DMoj, DSon	e000000000
FAGONIA pachyacantha Rydb.	DSon	8000000000
FAGOPYRUM esculentum Moench	SCo	0080000000
FALLUGIA paradoxa (D. Don) Endl.	e DMtns	4000000000
FATOUA villosa (Thunb.) Nakai	SCo (Riverside Co.)	0080000000
FENDLERELLA utahensis (S. Watson) A.A. Heller	DMtns	4000000000
FEROCACTUS cylindraceus (Engelm.) Orc.	D (esp e DMoj, w DSon)	e000000000
FEROCACTUS cylindraceus (Engelm.) Orc. var. cylindraceus	D	e000000000
FEROCACTUS cylindraceus (Engelm.) Orc. var. lecontei (Engelm.) H. Brav.-Holl.	D	e000000000
FEROCACTUS viridescens (Torrey & A. Gray) Britton & Rose	SCo (San Diego Co)	0080000000
FESTUCA arundinacea Schreber	CA-FP, W&I	1ffdfbff03
FESTUCA brachyphylla Schultes & Schultes f. ssp. coloradensis S. Frederiksen	c&s SNH, n SNE, W&I	0000840100
FESTUCA californica Vasey	NW, CaR, n&c SN, CW, SnBr	073ddb0c00
FESTUCA elmeri Scribner & Merr.	NW, CW	013d030800
FESTUCA idahoensis Elmer	NW, CaR, n&c SN, n&c CW, MP	073fdb0804
FESTUCA kingii (S. Watson) Cassidy	s SNH, SnBr, GB	0002040506
FESTUCA minutiflora Rydb.	c SNH (Mt. Dana, Tuolumne-Mono Co. line)	0000800000
FESTUCA occidentalis Hook.	NW, CaR, SN, n&c CW, PR, MP	077ffbc904
FESTUCA pratensis Hudson	CA (exc D), less common in SW	1fffffff07
FESTUCA rubra L.	NW, CaR, n&c SN, CW, TR, W&I	073ddb1c03
FESTUCA saximontana Rydb. var. purpusiana (St.-Yves) S. Frederiksen & L.E. Pavlick	c&s SNH, SnBr	0000800500
FESTUCA subulata Trin.	NW, CaR, n&c SN	063dd80000
FESTUCA subuliflora Scribner	NCo, KR, NCoRO, n SNH, SnFrB	0025400800
FESTUCA trachyphylla (Hackel) Kraj.	NCoRO, n SNH, expected elsewhere	0020400000
FESTUCA viridula Vasey	KR, n SNH	0001400000
FICUS carica L.	n SNF, GV, SnFrB, SCo	0080082a00
FILAGO arizonica A. Gray	SCo, s ChI, PR, w-most DSon	90c0004000
FILAGO californica Nutt.	CA-FP (most common s), SNE, D (esp DMtns)	fffdffff03
FILAGO depressa A. Gray	s SNE, D (rare s SnJV margin, SCo)	e080042002
FILAGO gallica L.	CA-FP (where possibly naturalized)	1ffdfbff01
FILAGO pyramidata L. var. pyramidata	NCoR, n&c SnFrB	0038000800
FIMBRISTYLIS miliacea (L.) Vahl	GV	0000002200
FIMBRISTYLIS thermalis S. Watson	W&I, DMoj	6000000002
FIMBRISTYLIS vahlii (Lambert) Link	SnJV, e DSon	8000002000
FLAVERIA trinervia (Sprengel) C. Mohr	e SCo	0080000000
FLOERKEA proserpinacoides Willd.	KR, NCoRH, CaRH, SNH, MP	040bc00104
FOENICULUM vulgare Miller	CA-FP, W&I	1ffdfbff03
FORESTIERA pubescens Nutt.	s SNF, c&s SNH (e slope), Teh, e SnFrB, SCoRO (e slope), SCoRI, TR, PR, s SNE, DMoj	6040a7dd03
FOUQUIERIA splendens Engelm. ssp. splendens	DSon	8000000000
FRAGARIA chiloensis (L.) Duchesne	NCo, CCo	0104000000
FRAGARIA vesca L.	NW, CaR, SN, CW, SnBr, PR	077dfbcd00
FRAGARIA virginiana Duchesne	KR, CaRH, SNH, MP	0403c00104
FRANKENIA palmeri S. Watson	SCo (sw San Diego Co.)	0080000000
FRANKENIA salina (Molina) I.M. Johnston	GV, CCo, SCo, ChI, SNE, DMoj	7980042202
FRAXINUS anomala S. Watson	n&e DMtns	4000000000
FRAXINUS dipetala Hook. & Arn.	NCoR, CaRF, n SNF, c&s SN, CW, TR, PR	0378bb5d01
FRAXINUS latifolia Benth.	NW, CaR, SN, GV, SnFrB, MP	063ff8ab04
FRAXINUS velutina Torrey	s SN, SCo, TR, PR, s SNE, DMoj	60c0245503
FREESIA alba (G.L. Meyer) Gumbleton	CCo, SnFrB, SCo	0180000800
FREMONTODENDRON californicum (Torrey) Cov.	CA-FP	1ffdfbff01
FREMONTODENDRON californicum (Torrey) Cov. ssp. californicum	CA-FP	1ffdfbff01
FREMONTODENDRON californicum (Torrey) Cov. ssp. decumbens (R. Lloyd) Munz	n SNH (Pine Hill, El Dorado Co.)	0000400000
FREMONTODENDRON mexicanum Davidson	PR (Orange, San Diego, sw Imperial cos.)	0040000000
FRITILLARIA affinis (Schultes) Sealy	KR, NCoR, CaR, n SNF, n CCo (w Marin Co.), SnFrB	0739080800
FRITILLARIA affinis (Schultes) Sealy var. affinis	KR, NCoR, CaR, n SNF, SnFrB	0639080800
FRITILLARIA affinis (Schultes) Sealy var. tristulis (A.L. Grant) B. Ness	n CCo (w Marin Co.)	0100000000
FRITILLARIA agrestis E. Greene	NCoRO (Mendocino Co.), SNF, GV, CW	01203b2a00
FRITILLARIA atropurpurea Nutt.	KR, CaR, SN, GB, DMtns	4603fc8106
FRITILLARIA biflora Lindley	NCoR (Mendocino, Napa cos.), CW, SW	19f8035c01
FRITILLARIA biflora Lindley var. biflora	NCoR (Mendocino, Napa cos.), CW, SW	19f8035c01
FRITILLARIA biflora Lindley var. ineziana Jepson	SnFrB (Hillsborough, San Mateo Co)	0000000800
FRITILLARIA brandegei Eastw.	s SN (esp Greenhorn Mtns), Teh	0000208100
FRITILLARIA eastwoodiae MacFarl.	CaR (Shasta, Tehama, Butte cos.)	0600000000
FRITILLARIA falcata (Jepson) D. Beetle	SnFrB, SCoRI (San Benito Co.)	0000010800
FRITILLARIA glauca E. Greene	NW	003d000000
FRITILLARIA liliacea Lindley	CW	0100030800
FRITILLARIA micrantha A.A. Heller	SN	0000f88100
FRITILLARIA ojaiensis A. Davids.	SCoRO (San Luis Obispo, Santa Barbara cos.), WTR (Ventura Co.)	0000020001
FRITILLARIA pinetorum A. Davids.	c SNH (Mono Co.), Teh, TR	0000809401
FRITILLARIA pluriflora Benth.	NCoRI, n SNF, edges of ScV	0010080200
FRITILLARIA pudica (Pursh) Sprengel	KR, CaR, n SN, MP	0603480004
FRITILLARIA purdyi Eastw.	NW	003d000000
FRITILLARIA recurva Benth.	NW, CaR, SN	063df88100
FRITILLARIA striata Eastw.	s SN (Tulare, Kern cos., esp Greenhorn Mtns)	0000200100
FRITILLARIA viridea Kellogg	SCoR (San Benito, San Luis Obispo cos.)	0000030000
FUMARIA officinalis L.	SCo	0080000000
FUMARIA parviflora Lam.	CCo, SCo	0180000000
GAILLARDIA aristata Pursh	e CaR, SN, SW	1ec0f8d501
GAILLARDIA pulchella Foug.	SnFrB, SW	18c0005c01
GALINSOGA parviflora Cav. var. parviflora	SnFrB, SW, SNE	18c0045c03
GALINSOGA quadriradiata Ruiz Lopez & Pavon	SnFrB	0000000800
GALIUM ambiguum Wight	KR, NCoRO, NCoRH, n SNF	0029080000
GALIUM ambiguum Wight var. ambiguum	NCoRH, n SNF (Eldorado Co)	0008080000
GALIUM ambiguum Wight var. siskiyouense Ferris	KR (Del Norte Co), NCoRO (uncommon)	0021000000
GALIUM andrewsii A. Gray	CW, SW exc ChI	01c0035c01
GALIUM andrewsii A. Gray ssp. andrewsii	SCoR, SnBr, PR	0040034400
GALIUM andrewsii A. Gray ssp. gatense (Dempster) Dempster & Stebb.	SnFrB, SCoRI	0000010800
GALIUM andrewsii A. Gray ssp. intermedium Dempster & Stebb.	SCoRO, WTR, SnGb	0000021001
GALIUM angustifolium Nutt.	s SN, SCoRO, SW, DMtns, DSon	d8c0225501
GALIUM angustifolium Nutt. ssp. angustifolium	s SN, SCoRO, s ChI	1000220100
GALIUM angustifolium Nutt. ssp. borregoense Dempster & Stebb.	DSon (Palm Canyon, Hellhole Canyon, Pinyon Mtn Valley; San Diego Co.)	8000000000
GALIUM angustifolium Nutt. ssp. foliosum (Hilend & Howell) Dempster & Stebb.	n ChI	0800000000
GALIUM angustifolium Nutt. ssp. gabrielense (Munz & I.M. Johnston) Dempster & Stebb.	SnGb (near San Antonio Canyon; Los Angeles, San Bernardino cos.)	0000001000
GALIUM angustifolium Nutt. ssp. gracillimum Dempster & Stebb.	DMtns (Providence, Little San Bernardino mtns)	4000000000
GALIUM angustifolium Nutt. ssp. jacinticum Dempster & Stebb.	w SnJt	0000004000
GALIUM angustifolium Nutt. ssp. nudicaule Dempster & Stebb.	SnGb, SnBr	0000001400
GALIUM angustifolium Nutt. ssp. onycense (Dempster) Dempster & Stebb.	s SNH (Onyx Peak area, e Kern Co)	0000000100
GALIUM aparine L.	CA-FP, SNE, DMoj	7ffdffff03
GALIUM argense Dempster & Ehrend.	DMtns (Argus, Nelson ranges; Inyo Co.)	4000000000
GALIUM bifolium S. Watson	KR, NCoRI, SNH, WTR, MP, n SNE (Bodie Hills)	0013c40105
GALIUM bolanderi A. Gray	KR, CaRF, SNF, Teh, n SCoRI	0201398000
GALIUM boreale L. ssp. septentrionale (Roemer & Schultes) Iltis	KR	0001000000
GALIUM buxifolium E. Greene	n ChI	0800000000
GALIUM californicum Hook. & Arn.	NCoRO, NCoRI, n SNF, SnFrB, SCoRO, n ChI, WTR, SnGb, SnJt	08300a5801
GALIUM californicum Hook. & Arn. ssp. californicum	NCoRO, NCoRI, SnFrB	0030000800
GALIUM californicum Hook. & Arn. ssp. flaccidum (E. Greene) Dempster & Stebb.	SCoRO, n ChI, WTR, SnGb	0800021001
GALIUM californicum Hook. & Arn. ssp. luciense Dempster & Stebb.	SCoRO (n Santa Lucia Mtns)	0000020000
GALIUM californicum Hook. & Arn. ssp. maritimum Dempster & Stebb.	SCoRO	0000020000
GALIUM californicum Hook. & Arn. ssp. miguelense (E. Greene) Dempster & Stebb.	n ChI	0800000000
GALIUM californicum Hook. & Arn. ssp. primum Dempster & Stebb.	SnJt	0000004000
GALIUM californicum Hook. & Arn. ssp. sierrae Dempster & Stebb.	n SNF (Eldorado Co.)	0000080000
GALIUM catalinense A. Gray	s ChI	1000000000
GALIUM catalinense A. Gray ssp. acrispum Dempster	s ChI (San Clemente Island)	1000000000
GALIUM catalinense A. Gray ssp. catalinense	s ChI (Santa Catalina Island)	1000000000
GALIUM clementis Eastw.	SCoRO (n Santa Lucia Mtns)	0000020000
GALIUM cliftonsmithii (Dempster) Dempster & Stebb.	SCoRO, WTR	0000020001
GALIUM divaricatum Lam.	NCoRO, n&c SNF, SnFrB	0020180800
GALIUM glabrescens (Ehrend.) Dempster & Ehrend.	KR, Wrn	0001000004
GALIUM glabrescens (Ehrend.) Dempster & Ehrend. ssp. glabrescens	KR	0001000000
GALIUM glabrescens (Ehrend.) Dempster & Ehrend. ssp. modocense Dempster & Ehrend.	Wrn	0000000004
GALIUM grande McClatchie	SnGb	0000001000
GALIUM grayanum Ehrend.	KR, NCoRH, CaRH, n SNH	0409400000
GALIUM grayanum Ehrend. var. grayanum	KR, NCoRH, CaRH, n SNH	0409400000
GALIUM grayanum Ehrend. var. nanum Dempster & Ehrend.	NCoRH	0008000000
GALIUM hallii Munz & I.M. Johnston	s SNH, TR	0000001501
GALIUM hardhamiae Dempster	SCoRO (Santa Lucia Range)	0000020000
GALIUM hilendiae Dempster & Ehrend.	DMoj	6000000000
GALIUM hilendiae Dempster & Ehrend. ssp. carneum (Hilend & J. Howell) Dempster & Ehrend.	DMtns (Panamint Mtns)	4000000000
GALIUM hilendiae Dempster & Ehrend. ssp. hilendiae	DMoj	6000000000
GALIUM hilendiae Dempster & Ehrend. ssp. kingstonense (Dempster) Dempster & Ehrend.	DMtns (Kingston Mtns, ne San Bernardino Co.)	4000000000
GALIUM hypotrichium A. Gray	c&s SNH, SNE, DMtns	4000840102
GALIUM hypotrichium A. Gray ssp. hypotrichium	c&s SNH, SNE (White, Sweetwater Mtns)	0000840102
GALIUM hypotrichium A. Gray ssp. inyoense Dempster & Ehrend.	s SNH	0000000100
GALIUM hypotrichium A. Gray ssp. subalpinum (Hilend & J. Howell) Ehrend.	s SNH	0000000100
GALIUM hypotrichium A. Gray ssp. tomentellum Ehrend.	DMtns (Telescope Peak, Panamint Mtns)	4000000000
GALIUM jepsonii Hilend & J. Howell	SnGb, SnBr	0000001400
GALIUM johnstonii Dempster & Stebb.	SnGb, SnBr	0000001400
GALIUM magnifolium (Dempster) Dempster	DMtns (Clark Mtn)	4000000000
GALIUM matthewsii A. Gray	SNH, W&I, DMoj	6000c00102
GALIUM mexicanum Kunth var. asperulum (A. Gray) Dempster	KR, NCoRO, c SNH	0021800000
GALIUM mollugo L.	NCoRO, SnFrB	0020000800
GALIUM multiflorum Kellogg	n SNH, GB	0002440006
GALIUM munzii Hilend & J. Howell	DMtns	4000000000
GALIUM murale (L.) All.	c SNF, SnFrB	0000100800
GALIUM muricatum Wight	NCoRO	0020000000
GALIUM nuttallii A. Gray	SCo, s ChI, WTR, PR	10c0004001
GALIUM nuttallii A. Gray ssp. insulare Ferris	s ChI	1000000000
GALIUM nuttallii A. Gray ssp. nuttallii	SCo, WTR, PR	00c0004001
GALIUM oreganum Britton	KR (Del Norte Co.)	0001000000
GALIUM parishii Hilend & J. Howell	SnGb, SnBr, SnJt, DMtns	4000005400
GALIUM parisiense L.	KR, NCoRO, SN, SnFrB, SCo	00a1f88900
GALIUM porrigens Dempster	CA-FP	1ffdfbff01
GALIUM porrigens Dempster var. porrigens	CA-FP (gen w of GV)	1ffdfbff01
GALIUM porrigens Dempster var. tenue (Dempster) Dempster	NCoRI, CaRF, SNF, SCoRI	0210390000
GALIUM proliferum A. Gray	DMtns	4000000000
GALIUM saxatile L.	SnFrB	0000000800
GALIUM schultesii Vest	SnFrB (Santa Clara Co.)	0000000800
GALIUM serpenticum Dempster	KR, Wrn	0001000004
GALIUM serpenticum Dempster ssp. scotticum Dempster & Ehrend.	KR	0001000000
GALIUM serpenticum Dempster ssp. warnerense Dempster & Ehrend.	Wrn	0000000004
GALIUM sparsiflorum Wight	CaRF, SN, n SCoRI	0200f98100
GALIUM sparsiflorum Wight ssp. glabrius Dempster & Stebb.	CaRF, n SCoRI	0200010000
GALIUM sparsiflorum Wight ssp. sparsiflorum	SN	0000f88100
GALIUM stellatum Kellogg var. eremicum Hilend & J. Howell	D	e000000000
GALIUM tricornutum Dandy	c SNF, GV	0000102200
GALIUM trifidum L.	CA exc D	1fffffff07
GALIUM trifidum L. var. pacificum Wieg.	CA exc D	1fffffff07
GALIUM trifidum L. var. pusillum A. Gray.	KR, CaRH, SNH, SnBr, SnJt, MP	0403c04504
GALIUM triflorum Michaux	KR, NCoRO, SN, SnFrB, SnBr, MP	0023f88d04
GALIUM verum L.	SnFrB	0000000800
GALIUM wrightii A. Gray	DMtns (Clark Mtn)	4000000000
GALVEZIA speciosa (Nutt.) A. Gray	s ChI	1000000000
GARRYA buxifolia A. Gray	NW	003d000000
GARRYA congdonii Eastw.	NW, n&c SNF, SnFrB	003d180800
GARRYA elliptica Lindley	NCo, NCoRO, n SNF, ScV, CCo, SnFrB, SCoRO	01240a0a00
GARRYA flavescens S. Watson	NW, SN, CW, SW, DMtns	59fdfbdd01
GARRYA fremontii Torrey	NW, CaR, n SNF, n&c SNH, ScV, SnFrB, PR, Wrn	067dc84a04
GARRYA veatchii Kellogg	SCoRO, SW	18c0025401
GASTRIDIUM ventricosum (Gouan) Schinz & Thell.	CA-FP, MP	1ffffbff05
GAULTHERIA humifusa (Graham) Rydb.	KR, SNH	0001c00100
GAULTHERIA ovatifolia A. Gray	KR, n NCoRH, CaRH, n SNH	0409400000
GAULTHERIA shallon Pursh	NCo, KR, NCoRO, CCo, SnFrB, s SCoRO	0125020800
GAURA coccinea Pursh	DMtns (naturalized in Teh, SW)	58c000d401
GAURA drummondii (Spach) Torrey & A. Gray	CW, SW	19c0035c01
GAURA parviflora Douglas	SnFrB, SW	18c0005c01
GAURA sinuata Ser.	GV, CW, SW, DMoj	79c0037e01
GAYOPHYTUM decipiens Harlan Lewis & J. Szweykowski	SNH, SnGb, SnBr, Wrn, W&I, DMtns (Panamint Mtns)	4000c01506
GAYOPHYTUM diffusum Torrey & A. Gray	NW, CaR, SN, TR, PR, GB	067ffcd507
GAYOPHYTUM diffusum Torrey & A. Gray ssp. diffusum	CaR, SnBr, Wrn, n SNH (Plumas Co.)	0600400404
GAYOPHYTUM diffusum Torrey & A. Gray ssp. parviflorum Harlan Lewis & J. Szweykowski	NW, CaR, SN, TR, PR, GB	067ffcd507
GAYOPHYTUM eriospermum Cov.	SN (s of Placer Co.)	0000f88100
GAYOPHYTUM heterozygum Harlan Lewis & J. Szweykowski	KR, NCoRH, CaRH, SNH, Teh, SCoRO, TR, PR, Wrn	0449c2d505
GAYOPHYTUM humile A.L. Juss.	NW, CaR, SN, SCoR, TR, Wrn	063dfb9505
GAYOPHYTUM oligospermum Harlan Lewis & J. Szweykowski	TR, PR	0040005401
GAYOPHYTUM racemosum Torrey & A. Gray	CaRH, SNH, Teh, WTR, Wrn, W&I	0400c08107
GAYOPHYTUM ramosissimum Torrey & A. Gray	CaRH, n SN, GB	04024c0006
GAZANIA linearis (Thunb.) Druce	CCo, SnFrB, SCo	0180000800
GENISTA canariensis L.	WTR	0000000001
GENISTA linifolia L.	SCoRO (Santa Barbara Co.), s ChI (Catalina Island)	1000020000
GENISTA maderensis (Webb & Berth.) Lowe	Reported but unconfirmed in SnFrB (Santa Clara Co.), SCoRO (Monterey Co.)	0000020800
GENISTA monspessulana (L.) L. Johnson	NCoRO, NCoRI, SnFrB, SCoRO, s ChI, WTR, PR (San Diego Co.)	1070020801
GENISTA stenopetala Webb & Berth.	SCoRO	0000020000
GENTIANA affinis Griseb. var. ovata A. Gray	NCo, KR, CaRH, CCo, SnFrB, Wrn	0505000804
GENTIANA calycosa Griseb.	KR, CaRH, SNH	0401c00100
GENTIANA fremontii Torrey	SnBr	0000000400
GENTIANA newberryi A. Gray	KR, CaRH, SNH, W&I	0401c00102
GENTIANA newberryi A. Gray var. newberryi	KR, CaRH, n SNH	0401400000
GENTIANA newberryi A. Gray var. tiogana (A.A. Heller) J. Pringle	SNH, W&I	0000c00102
GENTIANA plurisetosa C. Mason	KR, NCoRO	0021000000
GENTIANA prostrata Haenke	W&I (White Mtns)	0000000002
GENTIANA sceptrum Griseb.	NCo, NCoRO	0024000000
GENTIANA setigera A. Gray	NCoRO (Red Mtn, Mendocino Co.)	0020000000
GENTIANELLA amarella (L.) Boerner ssp. acuta (Michaux) J.M. Gillett	KR, CaRH, SNH, SnBr, W&I	0401c00502
GENTIANELLA tenella (Rottb.) Boerner ssp. tenella	c&s SNH, W&I	0000800102
GENTIANOPSIS holopetala (A. Gray) Iltis	c&s SNH, W&I	0000800102
GENTIANOPSIS simplex (A. Gray) Iltis	KR, NCoRH, CaRH, SNH, SnBr	0409c00500
GERAEA canescens A. Gray	D	e000000000
GERAEA viscida (A. Gray) S.F. Blake	s PR (s San Diego Co.)	0040000000
GERANIUM anemonifolium L'H<#e9>r.	SnFrB	0000000800
GERANIUM bicknellii Britton	NW, CCo, SnFrB	013d000800
GERANIUM californicum G. Jones & F. Jones	c&s SN, TR, PR	0040b05501
GERANIUM carolinianum L.	CA-FP, MP	1ffffbff05
GERANIUM dissectum L.	CA-FP	1ffdfbff01
GERANIUM molle L.	CA-FP	1ffdfbff01
GERANIUM oreganum Howell	NCo, KR, NCoRO	0025000000
GERANIUM potentilloides DC.	NCo, SnFrB	0004000800
GERANIUM pusillum Burm. f.	NCo, s SNF, CCo, s MP, s SNE	0106240006
GERANIUM retrorsum L'H<#e9>r.	NCo, SNF, CCo, n SCo, c PR	01c4380000
GERANIUM richardsonii Fischer & Trautv.	SNH, TR, SnJt, Wrn	0000c05505
GERANIUM robertianum L.	SnFrB	0000000800
GERANIUM viscosissimum Fischer & C. Meyer	e KR (Quartz Valley), MP	0003000004
GEUM aleppicum Jacq.	n CaRH (Mount Shasta), MP (Susanville)	0402000004
GEUM macrophyllum Willd.	NW, CaRH, SNH, SnBr, GB	043fc40506
GEUM triflorum Pursh	c KR (Marble Mtns), CaRH, n&c SNH, GB	0403c40006
GILIA achilleifolia Benth.	s NCoRI (Solano Co.), SnFrB, SCoR	0010030800
GILIA achilleifolia Benth. ssp. achilleifolia	SnFrB, SCoR	0000030800
GILIA achilleifolia Benth. ssp. multicaulis (Benth.) V. Grant & A.D. Grant	s NCoRI (Solano Co.), SnFrB, SCoR	0010030800
GILIA aliquanta A.D. Grant & V. Grant	s SN, n SnGb, n SnBr, DMoj	6000201500
GILIA aliquanta A.D. Grant & V. Grant ssp. aliquanta	s SN, n SnGb, n SnBr, DMoj	6000201500
GILIA aliquanta A.D. Grant & V. Grant ssp. breviloba A.D. Grant & V. Grant	DMoj	6000000000
GILIA angelensis V. Grant	e SnFrB (Mount Hamilton Range), SCoRI, SW	18c0015c01
GILIA australis (H. Mason & A.D. Grant) V. Grant & A.D. Grant	TR, PR, DMtns	4040005401
GILIA austro-occidentalis (A.D. Grant & V. Grant) A.D. Grant & V. Grant	SCoR	0000030000
GILIA brecciarum M.E. Jones	c&s SNH, Teh, SCoRI, TR (n edges), GB, DMoj	6002859507
GILIA brecciarum M.E. Jones ssp. brecciarum	s SNH, Teh, n edges SnGb, GB	0002049106
GILIA brecciarum M.E. Jones ssp. jacens (A.D. Grant & V. Grant) A.G. Day	Teh, SCoRI, WTR	0000018001
GILIA brecciarum M.E. Jones ssp. neglecta A.D. Grant & V. Grant	c&s SNH, Teh, DMoj	6000808100
GILIA campanulata A. Gray	SNE	0000040002
GILIA cana (M.E. Jones) A.A. Heller	SnBr, e slope s SNH, W&I, DMoj	6000000502
GILIA cana (M.E. Jones) A.A. Heller ssp. bernardina A.D. Grant & V. Grant	n SnBr, sw edge DMoj	2000000400
GILIA cana (M.E. Jones) A.A. Heller ssp. cana	e slope s SNH, DMtns (Coso Mtns)	4000000100
GILIA cana (M.E. Jones) A.A. Heller ssp. speciformis A.D. Grant & V. Grant	e DMtns	4000000000
GILIA cana (M.E. Jones) A.A. Heller ssp. speciosa (Jepson) A.D. Grant & V. Grant	e slope s SNH, w edge DMoj	2000000100
GILIA cana (M.E. Jones) A.A. Heller ssp. triceps (Brand) A.D. Grant & V. Grant	W&I, DMoj	6000000002
GILIA capillaris Kellogg	KR, CaRH, SNH, WTR, SnBr, PR, Wrn	0441c04505
GILIA capitata Sims	NW, CaR, SN, SnJV, n CCo, SnFrB, SCoR, ChI, TR, PR	1f7dfbfd01
GILIA capitata Sims ssp. abrotanifolia (E. Greene) V. Grant	s SN, Teh, SCoR, ChI, TR, PR	184023d501
GILIA capitata Sims ssp. capitata	NW, CaR, SnFrB	063d000800
GILIA capitata Sims ssp. chamissonis (E. Greene) V. Grant	n CCo	0100000000
GILIA capitata Sims ssp. mediomontana V. Grant	n&c SN	0000d80000
GILIA capitata Sims ssp. pacifica V. Grant	n&c NCo	0004000000
GILIA capitata Sims ssp. pedemontana V. Grant	SNF	0000380000
GILIA capitata Sims ssp. staminea (E. Greene) V. Grant	SnJV, SCoRI	0000012000
GILIA capitata Sims ssp. tomentosa (Brand) V. Grant	NCo	0004000000
GILIA caruifolia Abrams	PR	0040004000
GILIA clivorum (Jepson) V. Grant	s NCoR, CW, ChI, WTR	1938030801
GILIA clokeyi H. Mason	e DMoj, DMtns	6000000000
GILIA diegensis (Munz) A.D. Grant & V. Grant	SnGb, SnBr, PR, s edge DMoj, w edge DSon	a040005400
GILIA filiformis A. Gray	W&I, DMoj	6000000002
GILIA hutchinsifolia Rydb.	GB, DMoj	6002040006
GILIA inconspicua (Smith) Sweet	GB	0002040006
GILIA interior (H. Mason & A.D. Grant) A.D. Grant	s SNF, Teh	0000208000
GILIA inyoensis I.M. Johnston	s SNH, SNE	0000040102
GILIA latiflora (A. Gray) A. Gray	SCoRI, n TR, s&w DMoj	6000011401
GILIA latiflora (A. Gray) A. Gray ssp. cuyamensis A.D. Grant & V. Grant	s SCoRI, n WTR	0000010001
GILIA latiflora (A. Gray) A. Gray ssp. davyi (Milliken) A.D. Grant & V. Grant	SCoRI, s&w DMoj	6000010000
GILIA latiflora (A. Gray) A. Gray ssp. elongata A.D. Grant & V. Grant	w DMoj (Rand & El Paso ranges, Black Rock Hills)	6000000000
GILIA latiflora (A. Gray) A. Gray ssp. latiflora	sw DMoj, n base SnGb & SnBr	6000001400
GILIA latifolia S. Watson	W&I, D	e000000002
GILIA leptalea (A. Gray) E. Greene	CaR, s SNF, SNH	0600e00100
GILIA leptalea (A. Gray) E. Greene ssp. bicolor H. Mason & A.D. Grant	SNH	0000c00100
GILIA leptalea (A. Gray) E. Greene ssp. leptalea	CaR, s SNF, n SNH	0600600000
GILIA leptantha Parish	s SN, SCoR, WTR, n slope SnGb, SnBr, sw edge DMoj	2000231501
GILIA leptantha Parish ssp. leptantha	SnBr	0000000400
GILIA leptantha Parish ssp. pinetorum A.D. Grant & V. Grant	SCoR, WTR (Mt. Pinos)	0000030001
GILIA leptantha Parish ssp. purpusii (Milliken) A.D. Grant & V. Grant	s SN	0000200100
GILIA leptantha Parish ssp. transversa A.D. Grant & V. Grant	n slope SnGb, SnBr, sw edge DMoj	2000001400
GILIA leptomeria A. Gray	GB, DMtns (uncommon)	4002040006
GILIA lottiae A.G. Day	GB, e DMtns (Clark Mtns)	4002040006
GILIA maculata Parish	s DMtns (Little San Bernardino Mtns)	4000000000
GILIA malior Day & V. Grant	Teh, s SnJV, SCoRI, SNE, DMoj	600005a002
GILIA micromeria A. Gray	GB (Modoc, Inyo cos.)	0002040006
GILIA millefoliata Fischer & C. Meyer	NCo	0004000000
GILIA minor A.D. Grant & V. Grant	SCoR, DMoj	6000030000
GILIA modocensis Eastw.	Teh, WTR, SnBr, GB, DMtns	4002048407
GILIA nevinii A. Gray	ChI	1800000000
GILIA ochroleuca M.E. Jones	SCoRI, TR, PR, W&I, w D	e040015403
GILIA ochroleuca M.E. Jones ssp. bizonata A.D. Grant & V. Grant	SCoRI, TR (n slope), w DMoj	6000011401
GILIA ochroleuca M.E. Jones ssp. exilis (A. Gray) A.D. Grant & V. Grant	s SnBr, PR, w D	e040004400
GILIA ochroleuca M.E. Jones ssp. ochroleuca	W&I, w DMoj	6000000002
GILIA ochroleuca M.E. Jones ssp. vivida (A.D. Grant & V. Grant) A.D. Grant & V. Grant	SnGb	0000001000
GILIA ophthalmoides Brand	n SNE, W&I, DMtns	4000040000
GILIA ripleyi Barneby	n DMtns (Inyo Co.)	4000000000
GILIA salticola Eastw.	n&c SNH, w MP, nw SNE (Mono Co.)	0002c00004
GILIA scopulorum M.E. Jones	s SNE, e DMoj, DSon	e000040002
GILIA sinistra M.E. Jones	KR, NCoR, CaR, SN, SnBr, Wrn	0639f88504
GILIA sinistra M.E. Jones ssp. pinnatisecta (H. Mason & A.D. Grant) A.G. Day	NCoRI	0010000000
GILIA sinistra M.E. Jones ssp. sinistra	KR, NCoR, CaR, SN, SnBr, Wrn	0639f88504
GILIA sinuata Benth.	GB, DMoj	6002040006
GILIA splendens Lindl.	SCoR, TR, SnJt	0000035401
GILIA splendens Lindl. ssp. grantii (Brand) V. Grant & A.D. Grant	SnGb, SnBr	0000001400
GILIA splendens Lindl. ssp. splendens	SCoR, TR, SnJt	0000035401
GILIA stellata A.A. Heller	W&I, D	e000000002
GILIA subacaulis Rydb.	SNE, DMoj	6000040002
GILIA tenerrima A. Gray	SNH, SNE	0000c40102
GILIA tenuiflora Benth.	CCo, SCoR, n ChI	0900030000
GILIA tenuiflora Benth. ssp. amplifaucalis A.D. Grant & V. Grant	SCoRI	0000010000
GILIA tenuiflora Benth. ssp. arenaria (Benth.) A.D. Grant & V. Grant	c CCo (Monterey Bay)	0100000000
GILIA tenuiflora Benth. ssp. hoffmannii (Eastw.) A.D. Grant & V. Grant	n ChI (Santa Rosa Island)	0800000000
GILIA tenuiflora Benth. ssp. tenuiflora	CCo, SCoR	0100030000
GILIA transmontana (H. Mason & A.D. Grant) A.D. Grant & V. Grant	DMoj	6000000000
GILIA tricolor Benth.	NCoR, SNF, SnFrB, SnJV, SCoR	00383b2800
GILIA tricolor Benth. ssp. diffusa (Congdon) H. Mason & A.D. Grant	SNF, SnFrB, SnJV, SCoRI	0000392800
GILIA tricolor Benth. ssp. tricolor	NCoR, SNF, SnFrB, SnJV, SCoR	00383b2800
GILIA triodon Eastw.	e DMtns (Clark Mtns)	4000000000
GILMANIA luteola (Cov.) Cov.	DMoj (Death Valley, Inyo Co.)	6000000000
GITHOPSIS diffusa A. Gray	KR, NCoR, CaRF, SNF, SnFrB, SCoR, n ChI, TR, PR	0a793b5c01
GITHOPSIS diffusa A. Gray ssp. candida (Ewan) N. Morin	s PR	0040000000
GITHOPSIS diffusa A. Gray ssp. diffusa	s SNF, SCoR (Monterey Co.), n ChI, TR, PR	0840235401
GITHOPSIS diffusa A. Gray ssp. filicaulis (Ewan) N. Morin	PR (San Diego, Riverside cos.)	0040000000
GITHOPSIS diffusa A. Gray ssp. robusta N. Morin	KR, NCoR, CaRF, n&c SNF, SnFrB, SCoR	02391b0800
GITHOPSIS pulchella Vatke	CaRH, n&c SN	0400d80000
GITHOPSIS pulchella Vatke ssp. campestris N. Morin	CaRH, n&c SNH	0400c00000
GITHOPSIS pulchella Vatke ssp. pulchella	n&c SN	0000d80000
GITHOPSIS pulchella Vatke ssp. serpentinicola N. Morin	c SNF (esp Amador Co.)	0000100000
GITHOPSIS specularioides Nutt.	KR, NCoR, CaR, SN, ScV, SnFrB, s SCoRI (San Luis Obispo, Kern cos.), e SCo (San Bernardino Co.)	06b9f98b00
GITHOPSIS tenella N. Morin	s SNH (Kern, Tulare cos.). Possibly also in s SCoRI (Cholame Hills, Monterey Co.)	0000010100
GLADIOLUS italicus Miller	NCoRO, SCo	00a0000000
GLADIOLUS tristis L.	SCo	0080000000
GLAUCIUM flavum Crantz	CA-FP	1ffdfbff01
GLAUX maritima L.	NCo, KR, deltaic GV, CCo, SCo, e-most MP, SNE	0187042206
GLECHOMA hederacea L.	NW, SNF, CW, SCo	01bd3b0800
GLEHNIA littoralis (A. Gray) Miq. ssp. leiocarpa (Mathias) Hult<#e9>n	NCo	0004000000
GLINUS lotoides L.	NCoR, GV, SnFrB, SCoRO, SCo, WTR, SnGb, PR	00f8027a01
GLOSSOPETALON pungens Brandegee	e DMtns (Clark Mtns)	4000000000
GLOSSOPETALON spinescens A. Gray	s KR, s SNH (Piute Mtns, Kern Co.), SnBr (n base), W&I, DMtns	4001000502
GLYCERIA borealis (Nash) Batch.	CaR, SN	0600f88100
GLYCERIA elata (Nash) M.E. Jones	NCo, SN, SnBr, SnJt	0004f8c500
GLYCERIA grandis S. Watson	NCo, NCoR	003c000000
GLYCERIA leptostachya Buckley	NW, CCo, SnFrB	013d000800
GLYCERIA occidentalis (Piper) J.C. Nelson	NCo, NCoRO, n SNH, ScV, CCo	0124400200
GLYCERIA striata (Lam.) A. Hitchc.	KR, NCoR, CaR, n&c SNH, MP	063bc00004
GLYCYRRHIZA glabra L.	CA-FP	1ffdfbff01
GLYCYRRHIZA lepidota Pursh	CA	ffffffff07
GLYPTOPLEURA marginata D. Eaton	s SNH, SNE, DMoj	6000040102
GNAPHALIUM bicolor Bioletti	c&s SNF, CCo, SCoR, SCo, SnJt, ChI	1980334000
GNAPHALIUM californicum DC.	CA-FP (exc GV)	1ffdfbdd01
GNAPHALIUM canescens DC.	CA (exc DSon)	7fffffff07
GNAPHALIUM canescens DC. ssp. beneolens (Davidson) Stebb. & Keil	NCo, NCoRO, n&c SNF, CCo, SnFrB, SCoRO, SCo, n ChI, SnBr, PR	09e41a4c00
GNAPHALIUM canescens DC. ssp. canescens DC.	DMtns	4000000000
GNAPHALIUM canescens DC. ssp. microcephalum (Nutt.) Stebb. & Keil	CCo, SCoRO, SCo, n ChI, SnBr, PR	09c0024400
GNAPHALIUM canescens DC. ssp. thermale (E. Nelson) Stebb. & Keil	KR, CaRH, SNH, SnBr, SnJt, MP, W&I	0403c04506
GNAPHALIUM collinum Labill.	NCo, NCoRO	0024000000
GNAPHALIUM japonicum Thunb.	NCo, NCoRI, s SnJV	0014002000
GNAPHALIUM leucocephalum A. Gray	SCo	0080000000
GNAPHALIUM luteo-album L.	NCoRO, c&s SN, GV, w CW, SW, SNE, D	f9e0b77f03
GNAPHALIUM palustre Nutt.	Most of CA (exc MP)	fffdffff03
GNAPHALIUM purpureum L.	NCo, NCoRO, c SNF, SnJV, w CW, ChI	1924132800
GNAPHALIUM ramosissimum Nutt.	w NW, w CW, SCo, n ChI, SnGb, PR	09fd035800
GNAPHALIUM stramineum Kunth	CA	ffffffff07
GOODMANIA luteola (C. Parry) Rev. & B. Ertter	s SnJV, SNE, w DMoj	6000042002
GOODYERA oblongifolia Raf.	NW, CaR, n&c SNH, sw SnFrB, MP	063fc00804
GRATIOLA ebracteata Benth.	n&c CA-FP	1ffdfbff01
GRATIOLA heterosepala H. Mason & Bacigal.	NCoRI, c SNF, ScV, MP	0012100204
GRATIOLA neglecta Torrey	c NCo (Mendocino Co.), w KR (Humboldt Co.), CaRH, n&c SNH, MP	0407c00004
GRAYIA spinosa (Hook.) Moq.	SNH (e slope), Teh, s SCoRI, WTR (n slope), GB, DMoj, nw DSon	e002c58107
GRINDELIA camporum E. Greene	NCoRI, GV, SnFrB, SCoRO, SW	18d0027e01
GRINDELIA camporum E. Greene var. bracteosum (J. Howell) M.A. Lane	sw GV, s SCoRO, SCo, WTR, PR	00c0026201
GRINDELIA camporum E. Greene var. camporum	NCoRI, GV, SnFrB, SCoRO, SW	18d0027e01
GRINDELIA fraxino-pratensis Rev. & Beatley	e DMoj (Ash Meadows, Inyo Co.)	6000000000
GRINDELIA hirsutula Hook. & Arn.	NCoR, n&c SNF, ScV, CW, WTR, PR, DSon	81781b4a01
GRINDELIA hirsutula Hook. & Arn. var. davyi (Jepson) M.A. Lane	NCoR, n&c SNF, ScV	0038180200
GRINDELIA hirsutula Hook. & Arn. var. hallii (Steyerm.) M.A. Lane	PR, w DSon (San Diego Co.)	8040004000
GRINDELIA hirsutula Hook. & Arn. var. hirsutula	CW, WTR	0100030801
GRINDELIA hirsutula Hook. & Arn. var. maritima (E. Greene) M.A. Lane	n CCo (San Francisco, San Mateo cos.)	0100000000
GRINDELIA nana Nutt.	CaR, MP, (introduced elsewhere)	0602000004
GRINDELIA squarrosa (Pursh) Dunal var. serrulata (Rydb.) Steyerm.	SN (e slope), c ScV, SCo, SNE, DMoj	6080fc8302
GRINDELIA stricta DC.	NCo, CCo, SCo, ChI	1984000000
GRINDELIA stricta DC. var. angustifolia (A. Gray) M.A. Lane	n CCo	0100000000
GRINDELIA stricta DC. var. platyphylla (E. Greene) M.A. Lane	NCo, CCo, SCo, ChI	1984000000
GRINDELIA stricta DC. var. stricta	NCo	0004000000
GUILLEMINEA densa (Willd.) Moq. var. aggregata Uline & Bray	s CCo, SCo	0180000000
GUILLENIA flavescens (Hook.) E. Greene	s NCoRI, ScV (Montezuma Hills), se SnFrB, SCoRI	0010010a00
GUILLENIA lasiophylla (Hook. & Arn.) E. Greene	CA (exc MP)	fffdffff03
GUILLENIA lemmonii (E. Greene) R. Buck	s SNF, sw SnJV, se SCoRO, SCoRI, n WTR	0000232001
GUIZOTIA abyssinica (L.f.) Cass.	SnFrB, SCo	0080000800
GUNNERA tinctoria (Molina) Mirbel	CCo (Marin, San Francisco cos.)	0100000000
GUTIERREZIA californica (DC.) Torrey & A. Gray	NCoRI, SnJV, CW, SCo, WTR, SnGb, PR	01d0037801
GUTIERREZIA microcephala (DC.) A. Gray	SCo, SnBr, PR, SNE, D	e0c0044402
GUTIERREZIA sarothrae (Pursh) Britton & Rusby	SCo, WTR, PR, D	e0c0004001
GYMNOSTERIS parvula A.A. Heller	n&c SNH, SNE	0000c40002
GYPSOPHILA elegans M. Bieb. var. elegans	n SNH (Placer Co.)	0000400000
GYPSOPHILA paniculata L. var. paniculata	NCoRI, CaRH, n SNH, SnJV, SCoRO, SCo, MP, DMoj	6492422004
GYPSOPHILA scorzonerifolia Ser.	SNE (Inyo Co.)	0000040002
HACKELIA amethystina Eastw.	NCoRH, n SNH (Plumas Co.)	0008400000
HACKELIA bella (J.F. Macbr.) I.M. Johnston	KR, NCoR	0039000000
HACKELIA brevicula (Jepson) J. Gentry	W&I (Mono Co.)	0000000002
HACKELIA californica (A. Gray) I.M. Johnston	NCoRH, CaRH, n SNH	0408400000
HACKELIA cusickii (Piper) Brand	MP	0002000004
HACKELIA floribunda (Lehm.) I.M. Johnston	SN, SNE, Wrn	0000fc8106
HACKELIA micrantha (Eastw.) J. Gentry	KR, NCoR, CaR, SN, MP, n SNE (Sweetwater Mtns)	063bfc8104
HACKELIA mundula (Jepson) Ferris	SN	0000f88100
HACKELIA nervosa (Kellogg) I.M. Johnston	CaRH, SN	0400f88100
HACKELIA setosa (Piper) I.M. Johnston	KR, n SNH (Sierra Valley)	0001400000
HACKELIA sharsmithii I.M. Johnston	s SNH (near Mount Whitney; Fresno, Inyo, Tulare cos.)	0000000100
HACKELIA velutina (Piper) I.M. Johnston	CaRH, SN	0400f88100
HAINARDIA cylindrica (Willd.) Greuter	n SNF (Amador Co.), deltaic GV, CCo, SnFrB, SCo	0180082a00
HALIMODENDRON halodendron (L.) Voss	GV, c SCo (Los Angeles basin)	0080002200
HALIMOLOBOS jaegeri (Munz) Rollins	W&I, DMoj	6000000002
HALIMOLOBOS virgata (Nutt.) Schulz	SNE	0000040002
HALODULE wrightii (Asch.) Asch.	DSon (Salton Sea, where presumed extinct), expected in warm, coastal, marine habitats	8000000000
HALOGETON glomeratus (M. Bieb.) C. Meyer	CaR, GB, DMoj	6602040006
HALORAGIS erecta (Murray) Eichler	SnFrB	0000000800
HARPAGONELLA palmeri A. Gray	SCo, PR, sw DSon	80c0004000
HASTINGSIA alba (Durand) S. Watson	NW, CaR, n SNH	063d400000
HASTINGSIA serpentinicola R. Becking	n&c NW	003d000000
HAZARDIA brickellioides (S.F. Blake) W. Clark	DMoj	6000000000
HAZARDIA cana (A. Gray) E. Greene	s ChI	1000000000
HAZARDIA detonsa (E. Greene) E. Greene	n ChI	0800000000
HAZARDIA orcuttii (A. Gray) E. Greene	s SCo (San Diego Co.)	0080000000
HAZARDIA squarrosa (Hook. & Arn.) E. Greene	s SnJV, CW, SW	19c0037c01
HAZARDIA squarrosa (Hook. & Arn.) E. Greene var. grindelioides (DC.) W. Clark	s SCoRO, SW	18c0025401
HAZARDIA squarrosa (Hook. & Arn.) E. Greene var. obtusa (E. Greene) Jepson	s SnJV, WTR	0000002001
HAZARDIA squarrosa (Hook. & Arn.) E. Greene var. squarrosa	SCoRO	0000020000
HAZARDIA stenolepis (H.M. Hall) Hoover	SCoR	0000030000
HAZARDIA whitneyi (A. Gray) E. Greene	NW, CaR, SN	063df88100
HAZARDIA whitneyi (A. Gray) E. Greene var. discoidea (J. Howell) W. Clark	NW	003d000000
HAZARDIA whitneyi (A. Gray) E. Greene var. whitneyi	SN	0000f88100
HEBE X-franciscana (Eastw.) Souster	SnFrB	0000000800
HEBE speciosa (Cunn.) Cockayne & Allan	SnFrB	0000000800
HECASTOCLEIS shockleyi A. Gray	SNE, DMtns	4000040002
HEDEOMA drummondii Benth.	e DMtns (New York Mtns)	4000000000
HEDEOMA nanum (Torrey) Briq. ssp. californicum W.S. Stewart	e DMtns (Providence, New York, Nopah mtns)	4000000000
HEDERA helix L.	CA-FP	1ffdfbff01
HEDYPNOIS cretica (L.) Dum.-Cours.	NCoRO, SNF, SnJV, SnFrB, SCoRO, SCo	00a03a2800
HELENIUM amarum (Raf.) Rock	SnJV, SnFrB	0000002800
HELENIUM autumnale L.	NCo, KR, MP	0007000004
HELENIUM autumnale L. var. grandiflorum (Nutt.) Torrey & A. Gray	n NCo, w KR	0005000000
HELENIUM autumnale L. var. montanum (Nutt.) Fern.	e KR, MP	0003000004
HELENIUM bigelovii A. Gray	KR, NCoR, CaR, SN, SCoR, TR, PR	0679fbd501
HELENIUM bolanderi A. Gray	NCo	0004000000
HELENIUM puberulum DC.	NCoR, SNF, SnJV, SCoR, WTR, w PR, SnFrB	00783b2801
HELIANTHELLA californica A. Gray	KR, NCoR, CaR, SN, s PR	0679f88100
HELIANTHELLA californica A. Gray var. californica	NCoR	0038000000
HELIANTHELLA californica A. Gray var. nevadensis (E. Greene) Jepson	NCoRI, CaR, SN, s PR	0650f88100
HELIANTHELLA californica A. Gray var. shastensis W.A. Weber	KR, CaR	0601000000
HELIANTHELLA castanea E. Greene	n SnFrB	0000000800
HELIANTHEMUM greenei Robinson	ChI	1800000000
HELIANTHEMUM scoparium Nutt.	NCoR, n&c SNF, n SNH, SnJV, CW, SCo, ChI, SnBr, PR	19f85b6c00
HELIANTHUS annuus L.	CA	ffffffff07
HELIANTHUS bolanderi A. Gray	KR, NCoR, CaR, SNF, GV, SCoR	06393b2200
HELIANTHUS californicus DC.	s NCoR, c SNF, ScV, n CW, SCo, PR	01f8134a00
HELIANTHUS ciliaris DC.	ScV, SnFrB, SCo, w D	e080000a00
HELIANTHUS cusickii A. Gray	e CaR, MP	0602000004
HELIANTHUS gracilentus A. Gray	s CW, SW	19c0035c01
HELIANTHUS maximilianii Schrader	s SnJV (Fresno Co.)	0000002000
HELIANTHUS niveus (Benth.) Brandegee	SCo, DSon	8080000000
HELIANTHUS niveus (Benth.) Brandegee ssp. canescens (A. Gray) Heiser	SCo, DSon	8080000000
HELIANTHUS niveus (Benth.) Brandegee ssp. tephrodes (A. Gray) Heiser	s DSon (Imperial Co.)	8000000000
HELIANTHUS nuttallii Torrey & A. Gray	c-w CW, SnGb, SnBr, GB	0102071c06
HELIANTHUS nuttallii Torrey & A. Gray ssp. nuttallii	SnGb, SnBr, GB	0002041406
HELIANTHUS nuttallii Torrey & A. Gray ssp. parishii (A. Gray) Heiser	c-w SW	18c0005401
HELIANTHUS petiolaris Nutt. ssp. petiolaris	SnFrB, SW	18c0005c01
HELIOMERIS hispida (A. Gray) Cockerell	SW	18c0005401
HELIOMERIS multiflora Nutt. var. nevadensis (Nelson) Yates	SNE, DMtns	4000040002
HELIOTROPIUM amplexicaule M. Vahl	n&c SCo	0080000000
HELIOTROPIUM convolvulaceum (Nutt.) A. Gray var. californicum (E. Greene) I.M. Johnston	D	e000000000
HELIOTROPIUM curassavicum L.	CA	ffffffff07
HELIOTROPIUM europaeum L.	n&c SNF, GV, CCo, SnFrB, MP	0102182a04
HEMITOMES congestum A. Gray	NCo, KR, NCoRO, CaRH, n&s SNH, SnFrB, SCoRO	0425420900
HEMIZONIA arida Keck	w DMoj (Red Rock Canyon, e Kern Co.)	6000000000
HEMIZONIA clementina Brandegee	n ChI (Anacapa Island), s ChI	1800000000
HEMIZONIA congesta DC.	NCoR, w&c GV, CW	0138032a00
HEMIZONIA congesta DC. ssp. calyculata Babc. & H.M. Hall	NCoRI, n ScV	0010000200
HEMIZONIA congesta DC. ssp. clevelandii (E. Greene) Babc. & H.M. Hall	NCoR	0038000000
HEMIZONIA congesta DC. ssp. congesta	s NCoR, n CW	0138030800
HEMIZONIA congesta DC. ssp. leucocephala (B.D. Tanowitz) Keil	NCoR, SnFrB	0038000800
HEMIZONIA congesta DC. ssp. luzulifolia (DC.) Babc. & H.M. Hall	NCoRI, c GV, CW	0110032a00
HEMIZONIA congesta DC. ssp. tracyi Babc. & H.M. Hall	n&c NCoR	0038000000
HEMIZONIA conjugens Keck	s PR (s San Diego Co.)	0040000000
HEMIZONIA corymbosa (DC.) Torrey & A. Gray	c NCo, n CW	0104030800
HEMIZONIA corymbosa (DC.) Torrey & A. Gray ssp. corymbosa	c NCo, SnFrB, n&c CCo	0104000800
HEMIZONIA corymbosa (DC.) Torrey & A. Gray ssp. macrocephala (Nutt.) Keck	c CCo	0100000000
HEMIZONIA fasciculata (DC.) Torrey & A. Gray	s CCo, s SCoRO, SW	19c0025401
HEMIZONIA fitchii A. Gray	NW, CaRF, n&c SNF, n&c GV, SCoR, n ChI (Santa Cruz Island), n SnBr, SnFrB	0a3d1b2e00
HEMIZONIA floribunda A. Gray	s PR (s San Diego Co.)	0040000000
HEMIZONIA halliana Keck	c SCoRI	0000010000
HEMIZONIA increscens (Keck) B.D. Tanowitz	CW, n SCo, n ChI	0980030800
HEMIZONIA increscens (Keck) B.D. Tanowitz ssp. foliosa (Hoover) B.D. Tanowitz	s SCoR	0000030000
HEMIZONIA increscens (Keck) B.D. Tanowitz ssp. increscens	CCo, SnFrB (uncommon), SCoR, n SCo, n ChI	0980030800
HEMIZONIA increscens (Keck) B.D. Tanowitz ssp. villosa B.D. Tanowitz	n SCo (w Santa Barbara Co.)	0080000000
HEMIZONIA kelloggii E. Greene	s SNF, SnJV, e SnFrB, SW, alien in s NCoRI	18d0207c01
HEMIZONIA lobbii E. Greene	CaRF, e SnFrB, SCoRI	0200010800
HEMIZONIA minthornii Jepson	s WTR (Santa Susana, Santa Monica mtns)	0000000001
HEMIZONIA mohavensis Keck	SnJt, s PR, sw edge DMoj	2040004000
HEMIZONIA pallida Keck	s SNF, s SnJV, s SCoRI, w DMoj (Kern Co.)	6000212000
HEMIZONIA paniculata A. Gray	SCo, sw PR	00c0000000
HEMIZONIA parryi E. Greene	sw NCoR, w CW, w SW, c-w GV	19f8037e01
HEMIZONIA parryi E. Greene ssp. australis Keck	SCo	0080000000
HEMIZONIA parryi E. Greene ssp. congdonii (Robinson & Greenman) Keck	c&s CW	0100030800
HEMIZONIA parryi E. Greene ssp. parryi	s NCoR, s ScV, n&c CW	0138030a00
HEMIZONIA parryi E. Greene ssp. rudis (E. Greene) Keck	c-w GV	0000002200
HEMIZONIA pentactis (Keck) Keck	CW	0100030800
HEMIZONIA pungens (Hook. & Arn.) Torrey & A. Gray	s NCoR, CaRF, GV, n CCo, SnFrB, SCoR, alien in SW	1bf8037e01
HEMIZONIA pungens (Hook. & Arn.) Torrey & A. Gray ssp. laevis Keck	SCo, PR	00c0004000
HEMIZONIA pungens (Hook. & Arn.) Torrey & A. Gray ssp. maritima (E. Greene) Keck	s NCoR, GV, n CCo, SnFrB	0138002a00
HEMIZONIA pungens (Hook. & Arn.) Torrey & A. Gray ssp. pungens	SnJV, SCoR, alien in SW	18c0037401
HEMIZONIA pungens (Hook. & Arn.) Torrey & A. Gray ssp. septentrionalis Keck	CaRF, ScV	0200000200
HERACLEUM lanatum Michaux	CA-FP, GB	1fffffff07
HERISSANTIA crispa (L.) Briz.	e PR (se San Diego Co.)	0040000000
HERNIARIA hirsuta L.	KR, c&s SNF, c SNH, SnJV, SnFrB, SCo	0081b02800
HERNIARIA hirsuta L. ssp. cinerea (DC.) Cout.	s SNF, c SNH, SnJV, SnFrB, SCo	0080a02800
HERNIARIA hirsuta L. ssp. hirsuta	KR, c SNF	0001100000
HESPEREVAX acaulis (Kellogg) E. Greene	NW, SNF, GV, CW, PR	017d3b6a00
HESPEREVAX acaulis (Kellogg) E. Greene var. acaulis	SNF, e GV	0000382200
HESPEREVAX acaulis (Kellogg) E. Greene var. ambusticola J. Morefield	s NCoRI, c-s SNF, e SnFrB, SCoRO, PR	0050224800
HESPEREVAX acaulis (Kellogg) E. Greene var. robustior J. Morefield	NW, c-n SNF, ScV margin, CW	013d0b0a00
HESPEREVAX caulescens (Benth.) A. Gray	s SNF, n&c GV, sw PR	0040202200
HESPEREVAX sparsiflora (A. Gray) E. Greene	NCo, s NCoR, deltaic GV, CW, ChI, sw PR	197c032a00
HESPEREVAX sparsiflora (A. Gray) E. Greene var. brevifolia (A. Gray) J. Morefield	NCo, n-most CCo	0104000000
HESPEREVAX sparsiflora (A. Gray) E. Greene var. sparsiflora	s NCoR, deltaic GV, CW, ChI, sw PR	1978032a00
HESPERIS matronalis L.	KR (Trinity Co.), n SNH (Plumas Co.), expected elsewhere	0001400000
HESPEROCALLIS undulata A. Gray	D	e000000000
HESPEROCHIRON californicus (Benth.) S. Watson	KR, CaRH, SNH, Teh, WTR, SnBr, GB	0403c48507
HESPEROCHIRON pumilus (Griseb.) Porter	KR, NCoRI, CaRH, SNH, Teh, WTR, GB, n DMoj (Death Valley)	2413c48107
HESPEROCNIDE tenella Torrey	NCoRI, CW, SW	19d0035c01
HESPEROLINON adenophyllum (A. Gray) Small	n&c NCoR (esp Lake, Mendocino cos.)	0038000000
HESPEROLINON bicarpellatum (H. Sharsm.) H. Sharsm.	s NCoRI	0010000000
HESPEROLINON breweri (A. Gray) Small	s NCoRI (Napa, Solano cos.), ne SnFrB (Mount Diablo area, Contra Costa Co.)	0010000800
HESPEROLINON californicum (Benth.) Small	c&s NCoRI, s CaRF, n SNF, e SnFrB, ne SCoRI	0210090800
HESPEROLINON clevelandii Small	c&s NCoRI, e SnFrB	0010000800
HESPEROLINON congestum (A. Gray) Small	nw SnFrB	0000000800
HESPEROLINON didymocarpum H. Sharsm.	NCoRI (Big Canyon Creek, near Middletown, Lake Co.)	0010000000
HESPEROLINON disjunctum H. Sharsm.	NCoRI, e SnFrB, SCoRI	0010010800
HESPEROLINON drymarioides (Curran) Small	c NCoRI (Colusa, Glenn, Lake cos.)	0010000000
HESPEROLINON micranthum (A. Gray) Small	CA-FP	1ffdfbff01
HESPEROLINON serpentinum N. McCarten	s NCoRI (esp Napa & Lake cos.)	0010000000
HESPEROLINON spergulinum (A. Gray) Small	c&s NCoR, w SnFrB	0038000800
HESPEROLINON tehamense H. Sharsm.	n&c NCoRI (Tehama, Glenn cos.)	0010000000
HESPEROSTIPA comata (Trin. & Rupr.) Barkworth	SN, TR, PR, GB, DMtns	4042fcd507
HESPEROSTIPA comata (Trin. & Rupr.) Barkworth ssp. comata	SN, TR, PR, GB, DMtns, introduced elsewhere	4042fcd507
HESPEROSTIPA comata (Trin. & Rupr.) Barkworth ssp. intermedia (Scribner & Tweedy) Barkworth	n SNH	0000400000
HETERANTHEMIS viscidehirta Schott	CCo	0100000000
HETERANTHERA dubia (Jacq.) MacMillan	NCo, ScV, MP	0006000204
HETERANTHERA limosa (Sw.) Willd.	ScV	0000000200
HETEROCODON rariflorum Nutt.	CA-FP	1ffdfbff01
HETERODRABA unilateralis (M.E. Jones) E. Greene	CaRF, s SNF, Teh, GV, SCoR	020023a200
HETEROMELES arbutifolia (Lindley) Roemer	CA-FP	1ffdfbff01
HETEROPOGON contortus (L.) Roemer & Schultes	DSon, naturalized in SCo (San Diego Co.)	8080000000
HETEROTHECA grandiflora Nutt.	s NW, SNF, s Teh, GV, CW, D (uncommon)	e13d3baa00
HETEROTHECA oregona (Nutt.) Shin.	NW, CaR, n SNF, CW	073d0b0800
HETEROTHECA oregona (Nutt.) Shin. var. compacta (Keck) Semple	NW, CaR, n SNF, CW	073d0b0800
HETEROTHECA oregona (Nutt.) Shin. var. oregona	NW, CaR, CW	073d030800
HETEROTHECA oregona (Nutt.) Shin. var. rudis (E. Greene) Semple	NW, CaR, n SNF, CW	073d0b0800
HETEROTHECA oregona (Nutt.) Shin. var. scaberrima (A. Gray) Semple	+/- CW	0100030800
HETEROTHECA psammophila B. Wagenkn.	SCo, e DSon	8080000000
HETEROTHECA sessiliflora (Nutt.) Shinn.	+/- c&s CA-FP	1ffdfbff01
HETEROTHECA sessiliflora (Nutt.) Shinn. ssp. bolanderi (A. Gray) Semple	c&s NCo, n CCo	0104000000
HETEROTHECA sessiliflora (Nutt.) Shinn. ssp. echioides (Benth.) Semple	c&s SNF, Teh, SnJV, CW, SCo, TR, PR	01c033fc01
HETEROTHECA sessiliflora (Nutt.) Shinn. ssp. fastigiata (E. Greene) Semple	TR, c PR, SnJt	0040001401
HETEROTHECA sessiliflora (Nutt.) Shinn. ssp. sessiliflora	s CCo, SCo	0180000000
HETEROTHECA villosa (Pursh) Shinn.	KR, CaR, n&c SNH, s SNF, MP, sw DMtns	4603e00004
HETEROTHECA villosa (Pursh) Shinn. var. hispida (Hook.) V. Harms	CaRH, n&c SNH, MP	0402c00004
HETEROTHECA villosa (Pursh) Shinn. var. scabra (Eastw.) Semple	sw DMtns (Little San Bernardino Mtns)	4000000000
HETEROTHECA villosa (Pursh) Shinn. var. shevockii Semple	s SNF (Kern River Canyon)	0000200000
HETEROTHECA villosa (Pursh) Shinn. var. villosa	KR, CaR	0601000000
HEUCHERA abramsii Rydb.	SnGb	0000001000
HEUCHERA brevistaminea Wiggins	PR (Laguna Mtns, San Diego Co.)	0040000000
HEUCHERA cespitosa Eastw.	s SN (Kern, Tulare cos.), s SCoRO (Big Pine Mtn)	0000220100
HEUCHERA cylindrica Hook. var. alpina S. Watson	MP	0002000004
HEUCHERA duranii Bacigal.	n SNE (Sweetwater Mtns), W&I (White Mtns)	0000040000
HEUCHERA elegans Abrams	SnGb	0000001000
HEUCHERA hirsutissima C. Rosend., F.K. Butters, & Lakela	SnJt	0000004000
HEUCHERA maxima E. Greene	n ChI	0800000000
HEUCHERA merriamii Eastw.	KR	0001000000
HEUCHERA micrantha Lindley	NW, CaR, SN, CW (exc SCoRI)	073dfa8900
HEUCHERA parishii Rydb.	SnBr	0000000400
HEUCHERA pilosissima Fischer & C. Meyer	NCo, CCo, SCoRO	0104020000
HEUCHERA rubescens Torrey	SN, PR, GB (exc n MP), DMtns	4042fcc106
HEUCHERA rubescens Torrey var. alpicola Jepson	s SN, SNE, DMtns	4000240102
HEUCHERA rubescens Torrey var. glandulosa Kellogg	n SN	0000480000
HEUCHERA rubescens Torrey var. rydbergiana C. Rosend, F.K. Butters, & Lakela	c SN	0000900000
HEUCHERA rubescens Torrey var. versicolor (E. Greene) M.G. Stewart	PR (Cuyamaca Peak, San Diego Co.)	0040000000
HIBISCUS denudatus Benth.	DSon	8000000000
HIBISCUS lasiocarpus Cav.	c&s ScV, deltaic GV	0000002200
HIBISCUS trionum L.	CA-FP	1ffdfbff01
HIERACIUM albiflorum Hook.	CA-FP, Wrn	1ffdfbff05
HIERACIUM argutum Nutt.	c SNF, SCoRO, SCo, n ChI, WTR, SnGb	0880121001
HIERACIUM aurantiacum L.	n SNF (Grass Valley, Nevada Co.), expected more widely	0000080000
HIERACIUM bolanderi A. Gray	KR, NCoR	0039000000
HIERACIUM gracile Hook.	KR, CaRH, SNH	0401c00100
HIERACIUM greenei A. Gray	KR, NCoRH, CaRH	0409000000
HIERACIUM horridum Fries	KR, CaRH, SNH, SnJt, GB	0403c44106
HIERACIUM scouleri Hook.	KR, NCoRH, CaRH, n SNH, GB	040b440006
HIEROCHLO<#cb> occidentalis Buckley	NCo, NCoRO, CCo, SnFrB, SCoRO
HIEROCHLO<#cb> odorata (L.) P. Beauv.	n CaRH (Ball Mtn, Siskiyou Co.)
HIEROCHLOE occidentalis Buckley		0124020800
HIEROCHLOE odorata (L.) P. Beauv.		0400000000
HIPPURIS vulgaris L.	NW, CaRH, SN, SnFrB, SnBr, SnJt, MP	043ff8cd04
HIRSCHFELDIA incana (L.) Lagr.-Fossat	NCo, SNF, GV, CW, SCo	01843b2a00
HOFFMANNSEGGIA glauca (Ortega) Eifert	SnJV, SCoRO, SCo, WTR, D	e080022001
HOITA macrostachya (DC.) Rydb.	CA-FP (exc GV)	1ffdfbdd01
HOITA orbicularis (Lindley) Rydb.	CA-FP (exc GV)	1ffdfbdd01
HOITA strobilina (Hook. & Arn.) Rydb.	SnFrB	0000000800
HOLCUS lanatus L.	CA exc DSon	7fffffff07
HOLCUS mollis L.	NCo	0004000000
HOLLISTERIA lanata S. Watson	s SnJV, SCoRI	0000012000
HOLOCARPHA heermannii (E. Greene) Keck	SNF, Teh, SnJV, e SnFrB, SCoR, n WTR	00003ba801
HOLOCARPHA macradenia (DC.) E. Greene	n CCo (n&c Monterey Bay), sw SnFrB	0100000800
HOLOCARPHA obconica (J. Clausen & Keck) Keck	s SNF, nw SnJV, ne CW	0100232800
HOLOCARPHA virgata (A. Gray) Keck	NCoRI, n&c SNF, GV, ne CW, c&s SCo	01901b2a00
HOLOCARPHA virgata (A. Gray) Keck ssp. elongata Keck	c&s SCo	0080000000
HOLOCARPHA virgata (A. Gray) Keck ssp. virgata	NCoRI, n&c SNF, GV, ne CW	01101b2a00
HOLODISCUS discolor (Pursh) Maxim.	NW, SNH, GV (Sutter Buttes), CW, ChI, WTR, SnGb (300-1300 m), PR	197dc37b01
HOLODISCUS microphyllus Rydb.	NCoRH, SNH (2700-4000 m), SnGb (1800-3300 m), SnBr, SnJt, MP, SNE, DMtns	400ac45506
HOLODISCUS microphyllus Rydb. var. glabrescens (Greenman) Ley	NCoRH (Mendocino Co.), MP	000a000004
HOLODISCUS microphyllus Rydb. var. microphyllus	SNH (2700-4000 m), SnGb (1800-3300 m), SnBr, SnJt, SNE, DMtns	4000c45502
HOLOSTEUM umbellatum L. ssp. umbellatum	KR, CaR, CCo	0701000000
HOLOZONIA filipes (Hook. & Arn.) E. Greene	NCoR, CaRF, n&c SNF, GV (edge), SnFrB, c SCoRO	02381a2a00
HORDEUM arizonicum Covas	DSon	8000000000
HORDEUM brachyantherum Nevski	CA (exc D)	1fffffff07
HORDEUM brachyantherum Nevski ssp. brachyantherum	CA (exc D)	1fffffff07
HORDEUM brachyantherum Nevski ssp. californicum (Covas & Stebb.) v. Bothmer, N. Jacobsen & O. Seberg	CA-FP	1ffdfbff01
HORDEUM depressum (Scribner & J.G. Smith) Rydb.	CA (exc Mtns)	ffffffff07
HORDEUM intercedens Nevski	SW	18c0005401
HORDEUM jubatum L.	CA	ffffffff07
HORDEUM marinum Hudson ssp. gussoneanum (Parl.) Thell.	CA (exc mtns)	ffffffff07
HORDEUM murinum L.	CA	ffffffff07
HORDEUM murinum L. ssp. glaucum (Steudel) Tzvelev	CA	ffffffff07
HORDEUM murinum L. ssp. leporinum (Link) Arcang.	CA	ffffffff07
HORDEUM murinum L. ssp. murinum	CA	ffffffff07
HORKELIA bolanderi A. Gray	NCoRI (Colusa, Lake, Mendocino? cos.)	0010000000
HORKELIA californica Cham. & Schldl.	NCo, NCoR, SNF, CW, SnBr	013c3b0c00
HORKELIA californica Cham. & Schldl. ssp. californica	NCo, CCo	0104000000
HORKELIA californica Cham. & Schldl. ssp. dissita (Crum) B. Ertter	NCoR, SNF, SnFrB, SnBr	0038380c00
HORKELIA californica Cham. & Schldl. ssp. frondosa (E. Greene) B. Ertter	CW	0100030800
HORKELIA clevelandii (E. Greene) Rydb.	PR	0040004000
HORKELIA congesta Hook. ssp. nemorosa Keck	nw KR (Del Norte Co.)	0001000000
HORKELIA cuneata Lindley	CCo, SCoRO, SCo	0180020000
HORKELIA cuneata Lindley ssp. cuneata	CCo, SCoRO, SCo	0180020000
HORKELIA cuneata Lindley ssp. puberula (E. Greene) Keck	SCoRO, SCo (esp foothill edge of Los Angeles Basin)	0080020000
HORKELIA cuneata Lindley ssp. sericea (A. Gray) Keck	CCo	0100000000
HORKELIA daucifolia (E. Greene) Rydb.	w KR, CaRH (esp Shasta, Scott valleys), n NCoRI?	0411000000
HORKELIA fusca Lindley	e KR, CaRH, SNH, GB	0403c40106
HORKELIA fusca Lindley ssp. capitata (Lindley) Keck	Wrn	0000000004
HORKELIA fusca Lindley ssp. parviflora (Nutt.) Keck	e KR, n CaRH, SNH, MP (exc Wrn), n SNE	0403c40104
HORKELIA fusca Lindley ssp. tenella (S. Watson) Keck	s CaRH	0400000000
HORKELIA hendersonii Howell	ne KR	0001000000
HORKELIA hispidula Rydb.	n W&I (White Mtns)	0000000002
HORKELIA marinensis (Elmer) Crum	c NCo (Fort Bragg), n CCo (Point Reyes to Santa Cruz)	0104000000
HORKELIA parryi E. Greene	n&c SNF (esp Ione Formation)	0000180000
HORKELIA rydbergii Elmer	TR	0000001401
HORKELIA sericata S. Watson	w KR	0001000000
HORKELIA tenuiloba (Torrey) A. Gray	c&s NCo, c&s NCoRO, nw SnFrB	0024000800
HORKELIA tridentata Torrey	KR, NCoR, CaR, SN, MP	063bf88104
HORKELIA tridentata Torrey ssp. flavescens (Rydb.) Keck	KR, NCoR, n SNH (esp Plumas Co.)	0039400000
HORKELIA tridentata Torrey ssp. tridentata	CaR, SN, MP	0602f88104
HORKELIA truncata Rydb.	PR	0040004000
HORKELIA tularensis (J. Howell) Munz	s SNH (Bald Mtn area, Tulare Co.)	0000000100
HORKELIA wilderae Parish	SnBr (Barton Flats area)	0000000400
HORKELIA yadonii B. Ertter	SCoRO	0000020000
HORKELIELLA congdonis (Rydb.) Rydb.	c SNH (e slope), w SNE	0000840002
HORKELIELLA purpurascens (S. Watson) Rydb.	s SNH (w slope)	0000000100
HORSFORDIA alata (S. Watson) A. Gray	DSon	8000000000
HORSFORDIA newberryi (S. Watson) A. Gray	PR, w DSon	8040004000
HULSEA algida A. Gray	SNH, n SNE, W&I	0000c40100
HULSEA brevifolia A. Gray	c&s SNH	0000800100
HULSEA californica Torrey & A. Gray	s PR (Laguna, Cuyamaca Mtns, San Diego Co.)	0040000000
HULSEA heterochroma A. Gray	SN, SCoRO, TR, n PR, n DMtns (Panamint Mtns)	4040fa9501
HULSEA mexicana Rydb.	se PR (se San Diego Co.)	0040000000
HULSEA nana A. Gray	CaRH, MP	0402000004
HULSEA vestita A. Gray	c&s SNH, TR, PR, SNE, DMtns	4040845503
HULSEA vestita A. Gray ssp. callicarpha (H.M. Hall) Wilken	n PR	0040000000
HULSEA vestita A. Gray ssp. gabrielensis Wilken	e WTR, SnGb	0000001001
HULSEA vestita A. Gray ssp. inyoensis (Keck) Wilken	W&I, n DMtns	4000000002
HULSEA vestita A. Gray ssp. parryi (A. Gray) Wilken	SnBr, sw DMtns (Little San Bernardino Mtns)	4000000400
HULSEA vestita A. Gray ssp. pygmaea (A. Gray) Wilken	s SNH, SnBr	0000000500
HULSEA vestita A. Gray ssp. vestita	c&s SNH, n SNE	0000840100
HUMULUS lupulus L.	NCoRO, n&c SNF, SCo, WTR	00a0180001
HUTCHINSIA procumbens (L.) Desv.	CA (exc KR, SNH)	fffe3ffe07
HYDRILLA verticillata (L.f.) Caspary	NCoRI, n&c SNF, ScV, SCo, D	e090180200
HYDROCOTYLE moschata Forster f.	SCo (Brentwood, Los Angeles Co.)	0080000000
HYDROCOTYLE ranunculoides L.f.	Sporadic in CA-FP	1ffdfbff01
HYDROCOTYLE sibthorpioides Lam.	SCo (Pasadena, Los Angeles Co.)	0080000000
HYDROCOTYLE umbellata L.	CA-FP (esp s)	1ffdfbff01
HYDROCOTYLE verticillata Thunb.	CA-FP, W&I	1ffdfbff03
HYDROPHYLLUM capitatum Douglas var. alpinum S. Watson	CaRH, n SNH, MP	0402400004
HYDROPHYLLUM fendleri (A. Gray) var. albifrons (A.A. Heller) J.F. Macbr.	KR	0001000000
HYDROPHYLLUM occidentale (S. Watson) A. Gray	NW, CaRH, SN, ScV, SnFrB	043df88b00
HYDROPHYLLUM tenuipes A.A. Heller	NCo, KR, NCoRO	0025000000
HYMENOCLEA monogyra A. Gray	SW, SNE, DSon	98c0045403
HYMENOCLEA salsola A. Gray	s SnJV, s SCoRI, SW, SNE, D	f8c0057403
HYMENOCLEA salsola A. Gray var. fasciculata (Nelson) Peterson & Payne	s SnJV, SCoRI, SCo, WTR, DMoj	6080012001
HYMENOCLEA salsola A. Gray var. pentalepis (Rydb.) L. Benson	SW, D	f8c0005401
HYMENOCLEA salsola A. Gray var. salsola	s SnJV, s SCoRI, SW, SNE, D	f8c0057403
HYMENOPAPPUS filifolius Hook.	TR, PR, W&I, DMtns	4040005403
HYMENOPAPPUS filifolius Hook. var. eriopodus (Nelson) B. Turner	e DMtns (Clark, New York mtns)	4000000000
HYMENOPAPPUS filifolius Hook. var. lugens (E. Greene) Jepson	TR, PR	0040005401
HYMENOPAPPUS filifolius Hook. var. megacephalus B. Turner	e DMtns (Providence Mtns)	4000000000
HYMENOPAPPUS filifolius Hook. var. nanus (Rydb.) B. Turner	W&I	0000000002
HYMENOTHRIX loomisii S.F. Blake	SNF, SW	18c0385401
HYMENOTHRIX wrightii A. Gray	s PR (Cuyamaca, Laguna mtns)	0040000000
HYMENOXYS acaulis (Pursh) K. Parker var. arizonica (E. Greene) K. Parker	SnJt, DMtns	4000004000
HYMENOXYS cooperi (A. Gray) Cockerell	DMtns	4000000000
HYMENOXYS lemmonii (E. Greene) Cockerell	e KR, GB	0003040006
HYMENOXYS odorata DC.	e DSon	8000000000
HYPARRHENIA hirta (L.) Stapf	SCo (Los Angeles)	0080000000
HYPERICUM anagalloides Cham. & Schldl.	NW, CaR, SN (exc Teh), CCo, SnGb, SnBr, PR, Wrn	077df85504
HYPERICUM canariense L.	SCo	0080000000
HYPERICUM concinnum Benth.	NW, CaRH, n&c SN, ScV, SnFrB	043dd80a00
HYPERICUM formosum Kunth var. scouleri (Hook.) J. Coulter	NW, CaRH, SN, ScV, SnFrB, SCoRI, TR, PR, GB	047ffddf07
HYPERICUM mutilum L.	e-c ScV, adjacent n SNF (Butte, Glenn cos.)	0000080200
HYPERICUM perforatum L.	NW, CaRH, n&c SN, ScV, CCo, SnFrB, PR	057dd84a00
HYPOCHAERIS glabra L.	CA-FP	1ffdfbff01
HYPOCHAERIS radicata L.	NW, CaRF, n SNF, ScV, CW, SCo	03bd0b0a00
HYPTIS emoryi Torrey	s DMoj, DSon	e000000000
IDAHOA scapigera (Hook.) Nelson & J.F. Macbr.	CaR, SnFrB (Mount Hamilton), NCoRI (Mount Saint Helena), n SN, s SNF, SCoRI, GB	06126d0806
ILEX aquifolium L.	NCoRO, SnFrB, expected elsewhere	0020000800
ILIAMNA bakeri (Jepson) Wiggins	CaR, MP	0602000004
ILIAMNA latibracteata Wiggins	nw KR (Humboldt, Del Norte cos.)	0001000000
IMPERATA brevifolia Vasey	SnJV, SCo, SnGb, SnBr, DMoj, cult elsewhere	6080003400
IPHEION uniflorum Raf.	SW	18c0005401
IPOMOEA cairica (L.) Sweet	SCoRO (Santa Margarita Lake, San Luis Obispo Co.)	0000020000
IPOMOEA mutabilis Lindley	CW, SW	19c0035c01
IPOMOEA nil (L.) Roth	s CA-FP	1ffdfbff01
IPOMOEA purpurea (L.) Roth	SNF, GV, CW, SW	19c03b7e01
IPOMOEA triloba L.	DSon	8000000000
IPOMOPSIS aggregata (Pursh) V. Grant	KR, CaRH, n&c SNH, MP	0403c00004
IPOMOPSIS aggregata (Pursh) V. Grant ssp. bridgesii (A. Gray) V. Grant & A.D. Grant	n&c SNH	0000c00000
IPOMOPSIS aggregata (Pursh) V. Grant ssp. formosissima (E. Greene) Wherry	KR, CaRH, n&c SNH, MP	0403c00004
IPOMOPSIS arizonica (E. Greene) Wherry	DMtns	4000000000
IPOMOPSIS congesta (Hook.) V. Grant	KR, n CaR, n&c SNH, GB	0603c40006
IPOMOPSIS congesta (Hook.) V. Grant ssp. congesta	KR, n CaR, n&c SNH, MP, n SNE	0603c40004
IPOMOPSIS congesta (Hook.) V. Grant ssp. montana (Nelson & Kenn.) V. Grant	n&c SNH, GB	0002c40006
IPOMOPSIS congesta (Hook.) V. Grant ssp. palmifrons (Brand) A.G. Day	GB	0002040006
IPOMOPSIS depressa (M.E. Jones) V. Grant	SNE, n DMoj	2000040002
IPOMOPSIS effusa (A. Gray) Moran	se PR (Pinto Wash, sw Imperial Co.)	0040000000
IPOMOPSIS polycladon (Torrey) V. Grant	SNE, DMoj	6000040002
IPOMOPSIS tenuifolia (A. Gray) V. Grant	se PR (s San Diego Co)	0040000000
IPOMOPSIS tenuituba (Rydb.) V. Grant	n-c SNH, e MP, n SNE	0002840004
IRIS bracteata S. Watson	KR (Del Norte Co.)	0001000000
IRIS chrysophylla Howell	w&s KR	0001000000
IRIS douglasiana Herbert	NW, CW, n SW	19fd035c01
IRIS fernaldii R. Foster	s NCo, s NCoRI, sw ScV, n CCo, SnFrB	0114000a00
IRIS hartwegii Baker	s CaR, SN, SnGb, SnBr, SnJt	0600f8d500
IRIS hartwegii Baker ssp. australis (Parish) L. Lenz	e SnGb, SnBr, SnJt	0000005400
IRIS hartwegii Baker ssp. columbiana L. Lenz	c SNH (Tuolumne Co.)	0000800000
IRIS hartwegii Baker ssp. hartwegii	s CaR, SN	0600f88100
IRIS hartwegii Baker ssp. pinetorum (Eastw.) L. Lenz	s CaR, n&c SN	0600d80000
IRIS innominata L. Henderson	NCo, KR (Del Norte Co.)	0005000000
IRIS longipetala Herbert	c&s NCo, s NCoRO, n&c CCo, SnFrB	0124000800
IRIS macrosiphon Torrey	CaRF, n&c SNF, NCoRI, SnFrB	0210180800
IRIS missouriensis Nutt.	NCoR, SN, SCoRI, TR, PR, GB	007afdd507
IRIS munzii R. Foster	s SNF (Tule River, Tulare Co.)	0000200000
IRIS pseudacorus L.	SnFrB, s SnJV	0000002800
IRIS purdyi Eastw.	NCo, s KR, NCoRO	0025000000
IRIS tenax Douglas ssp. klamathensis L. Lenz	w KR (near Orleans, Humboldt Co.)	0001000000
IRIS tenuissima Dykes	NW, CaR, n SNH, ScV	063d400200
IRIS tenuissima Dykes ssp. purdyiformis (R. Foster) L. Lenz	se KR (Shasta Co.), CaR, n SNH	0601400000
IRIS tenuissima Dykes ssp. tenuissima	NW, ScV	003d000200
ISATIS tinctoria L.	KR, CaR, n SNH, MP	0603400004
ISOCOMA acradenia (E. Greene) E. Greene	Teh, SnJV, SCoR, SnBr, D	e00003a400
ISOCOMA acradenia (E. Greene) E. Greene var. acradenia	SnJV, SCoR, SnBr, DMoj	6000032400
ISOCOMA acradenia (E. Greene) E. Greene var. bracteosa (E. Greene) G. Nesom	SnJV, SCoRI, nw DMoj	6000012000
ISOCOMA acradenia (E. Greene) E. Greene var. eremophila (E. Greene) G. Nesom	Teh, SCoRI, D	e000018000
ISOCOMA arguta E. Greene	Deltaic ScV (Suisun Slough)	0000000200
ISOCOMA menziesii (Hook. & Arn.) G. Nesom	sw ScV, CW, SCo, ChI, WTR, PR	19c0034a01
ISOCOMA menziesii (Hook. & Arn.) G. Nesom var. menziesii	SCo, s ChI, PR	10c0004000
ISOCOMA menziesii (Hook. & Arn.) G. Nesom var. sedoides (E. Greene) G. Nesom	CCo, SCo, n ChI	0980000000
ISOCOMA menziesii (Hook. & Arn.) G. Nesom var. vernonioides (Nutt.) G. Nesom	sw ScV, CW, SCo, s ChI	1180030a00
ISOETES bolanderi Engelm.	KR, NCoRH, CaRH, SNH, SnBr, Wrn	0409c00504
ISOETES echinospora Durieu	KR, n SNH	0001400000
ISOETES howellii Engelm.	NCoR, CaRF, SNF, SnFrB, SCoR, SCo, PR	02f83b4800
ISOETES nuttallii Engelm.	NCoR, CaRF, SN, n SnJV, SnFrB, SCoRO, SCo, PR	02f8fae900
ISOETES occidentalis L. Henderson	KR, SNH	0001c00100
ISOETES orcuttii A.A. Eaton	n SNH, GV, SCo, PR	00c0406200
ISOMERIS arborea Nutt.	s SNF, Teh, SnJV, CCo, SCo, ChI, D	f98020a000
ISOPYRUM occidentale Hook. & Arn.	NCoRI, SN, CW (exc CCo), n WTR	0010fb8901
ISOPYRUM stipitatum A. Gray	NW, CaR, n SN, se SnFrB (Mount Hamilton Range), MP	063f480804
IVA acerosa (Nutt.) R. Jackson	n DMoj	2000000000
IVA axillaris Pursh ssp. robustior (Hook.) Bassett	CA	ffffffff07
IVA hayesiana A. Gray	s SCo (sw San Diego Co.)	0080000000
IVA nevadensis M.E. Jones	nw W&I	0000000002
IVESIA aperta (J. Howell) Munz	n SNH, s MP	0002400004
IVESIA aperta (J. Howell) Munz var. aperta	n SNH (exc Dog Valley), s MP	0002400004
IVESIA aperta (J. Howell) Munz var. canina B. Ertter	n SNH (Dog Valley, e Sierra Co.)	0000400000
IVESIA argyrocoma (Rydb.) Rydb.	SnBr	0000000400
IVESIA arizonica (J. Howell) B. Ertter var. arizonica	n DMtns (Inyo Co.)	4000000000
IVESIA baileyi S. Watson	MP, adjacent SNH	0002c00104
IVESIA baileyi S. Watson var. baileyi	s MP, adjacent SNH	0002c00104
IVESIA baileyi S. Watson var. beneolens (Nelson & J.F. Macbr.) B. Ertter	Wrn	0000000004
IVESIA callida (H.M. Hall) Rydb.	SnJt	0000004000
IVESIA campestris (M.E. Jones) Rydb.	s SNH	0000000100
IVESIA gordonii (Hook.) Torrey & A. Gray	e KR (Mount Eddy), NCoRH, n&c SNH, Wrn, n SNE (Sweetwater Mtns)	0009c40004
IVESIA jaegeri Munz & I.M. Johnston	e DMtns (Clark Mtn)	4000000000
IVESIA kingii S. Watson var. kingii	n SNE (Mono Co.)	0000040000
IVESIA longibracteata B. Ertter	e KR (Castle Crags, Shasta Co.)	0001000000
IVESIA lycopodioides A. Gray	SNH, SNE	0000c40102
IVESIA lycopodioides A. Gray ssp. lycopodioides	n&c SNH, n SNE (Sweetwater Mtns)	0000c40000
IVESIA lycopodioides A. Gray ssp. megalopetala (Rydb.) Keck	c&s SNH	0000800100
IVESIA lycopodioides A. Gray ssp. scandularis (Rydb.) Keck	c&s SNH, W&I	0000800102
IVESIA muirii A. Gray	c&s SNH	0000800100
IVESIA paniculata T. Nelson & J. Nelson	MP (Ash Valley, n-c Lassen Co.)	0002000004
IVESIA patellifera (J. Howell) B. Ertter	e DMtns (Kingston Mtns)	4000000000
IVESIA pickeringii A. Gray	c KR	0001000000
IVESIA pygmaea A. Gray	c&s SNH	0000800100
IVESIA santolinoides A. Gray	SNH, TR, SnJt	0000c05501
IVESIA saxosa (E. Greene) B. Ertter	s SNH, SnBr, PR, SNE, DMtns	4040044502
IVESIA sericoleuca (Rydb.) Rydb.	n SNH, s MP (Sierra Valley)	0002400004
IVESIA shockleyi S. Watson var. shockleyi	n&c SNH, W&I	0000c00002
IVESIA unguiculata A. Gray	c&s SNH	0000800100
IVESIA webberi A. Gray	n SNH (Dog Valley, e Sierra Co.), s MP (Sierra Valley)	0002400004
IXIA maculata L.	SnFrB	0000000800
JAMESIA americana Torrey & A. Gray var. rosea C. Schneider	c&s SNH, W&I, n DMtns (Grapevine Mtns)	4000800102
JAUMEA carnosa (Less.) A. Gray	NCo, CCo, SCo	0184000000
JEPSONIA heterandra Eastw.	c SNF	0000100000
JEPSONIA malvifolia (E. Greene) Small	ChI	1800000000
JEPSONIA parryi (Torrey) Small	SCo, PR	00c0004000
JUGLANS californica S. Watson	s NCoRI, s ScV, n SnJV, SnFrB, SCoRO, SCo, s TR, n PR	00d0023e01
JUGLANS californica S. Watson var. californica	SCoRO (Santa Lucia Mtns where perhaps cult), SCo, s TR, n PR (Santa Ana Mtns)	00c0021401
JUGLANS californica S. Watson var. hindsii Jepson	s NCoRI, s ScV, n SnJV, SnFrB	0010002a00
JUGLANS regia L.	GV, CW, SW	19c0037e01
JUNCUS acuminatus Michaux	NCo, KR, CaRF, GV, SnFrB	0205002a00
JUNCUS acutus L. ssp. leopoldii (Parl.) Snog.	CCo, SCo, s ChI, DSon	9180000000
JUNCUS ambiguus Guss.	NCo, CCo	0104000000
JUNCUS articulatus L.	NCo, s ScV	0004000200
JUNCUS balticus Willd.	CA	ffffffff07
JUNCUS bolanderi Engelm.	NW	003d000000
JUNCUS brachyphyllus Wieg.	MP	0002000004
JUNCUS breweri Engelm.	NCo, CCo	0104000000
JUNCUS bryoides F.J. Herm.	SNH, SCoRO, TR, PR, W&I	0040c25503
JUNCUS bufonius L.	CA	ffffffff07
JUNCUS bufonius L. var. bufonius	CA	ffffffff07
JUNCUS bufonius L. var. congestus Wahlenb.	c GV, CW	0100032a00
JUNCUS bufonius L. var. occidentalis F.J. Herm.	CA	ffffffff07
JUNCUS capillaris F.J. Herm.	SNH	0000c00100
JUNCUS capitatus Weigel	CaRF, n SNF, GV	0200082200
JUNCUS chlorocephalus Engelm.	n&c SN	0000d80000
JUNCUS confusus Cov.	KR, NCoRI, CaRH, n&c SNH	0411c00000
JUNCUS cooperi Engelm.	D	e000000000
JUNCUS covillei Piper	NW, CaR, SN, SnGb, SnBr	063df89500
JUNCUS covillei Piper var. covillei	NCo	0004000000
JUNCUS covillei Piper var. obtusatus (Engelm.) C. Hitchc.	KR, NCoR, CaR, SN, SnGb, SnBr	0639f89500
JUNCUS cyperoides Laharpe	n SNH (Butte Co)	0000400000
JUNCUS diffusissimus Buckley	e ScV	0000000200
JUNCUS drummondii E. Meyer	KR, CaR, SN	0601f88100
JUNCUS dubius Engelm.	CaRF, c&s SNF, SnFrB, SCoRO, PR	0240324800
JUNCUS dudleyi Wieg.	KR	0001000000
JUNCUS duranii Ewan	SnGb, SnBr, SnJt	0000005400
JUNCUS effusus L.	CA exc D	1fffffff07
JUNCUS effusus L. var. brunneus Engelm.	NCo, CCo, SCo	0184000000
JUNCUS effusus L. var. exiguus Fern. & Wieg.	KR, NCoR, CaR, n&c SN, SnBr	0639d80400
JUNCUS effusus L. var. gracilis Hook.	NW, CaR, SN	063df88100
JUNCUS effusus L. var. pacificus Fern. & Wieg.	CA exc D	1fffffff07
JUNCUS ensifolius Wikstr<#f6>m	NW, CaR, SN, CCo, SnBr, W&I	073df88502
JUNCUS falcatus E. Meyer var. falcatus	NCo, CCo, SCo	0184000000
JUNCUS hemiendytus F.J. Herm.	NW, SN, SnBr, GB	003ffc8506
JUNCUS hemiendytus F.J. Herm. var. abjectus (F.J. Herm.) B. Ertter	SNH	0000c00100
JUNCUS hemiendytus F.J. Herm. var. hemiendytus	NW, SN, SnBr, GB	003ffc8506
JUNCUS howellii F.J. Herm.	CaRH, n SNH	0400400000
JUNCUS kelloggii Engelm.	NCo, NCoR, ScV, CCo	013c000200
JUNCUS leiospermus F.J. Herm.	CaRF, n SNF, ScV, ne SnJV	0200082200
JUNCUS leiospermus F.J. Herm. var. ahartii B. Ertter	e ScV (Butte Co.), ne SnJV, n SNF (Calaveras Co.)	0000082200
JUNCUS leiospermus F.J. Herm. var. leiospermus	CaRF, n ScV (Shasta, Tehama, Butte cos.)	0200000200
JUNCUS lesueurii Bolander	NCo, CCo	0104000000
JUNCUS longistylis Torrey	SNH, TR, PR, Wrn, W&I	0040c05507
JUNCUS luciensis B. Ertter	n SNH, SCoRO, TR, PR	0040425401
JUNCUS macrandrus Cov.	SNH, TR, W&I	0000c01503
JUNCUS macrophyllus Cov.	SCoRO, TR, DMtns	4000021401
JUNCUS marginatus Rostkov var. marginatus	n SNF	0000080000
JUNCUS mertensianus Bong.	KR, NCoRI, CaRH, SNH, Wrn, W&I	0411c00106
JUNCUS mexicanus Willd.	CA (exc GV)	ffffffdd07
JUNCUS nevadensis S. Watson	KR, NCoRH, NCoRI, CaRH, SNH, SnGb, SnBr, GB	041bc41506
JUNCUS nodosus L.	se SNH, W&I, n DMtns	4000000102
JUNCUS occidentalis (Cov.) Wieg.	NCo, CCo, n&c SN	0104d80000
JUNCUS orthophyllus Cov.	NCoRH, CaRH, SNH, TR, DMtns	4408c01501
JUNCUS oxymeris Engelm.	NCoRI, SN, GV, TR	0010f8b701
JUNCUS parryi Engelm.	KR, SN, SnBr, W&I	0001f88502
JUNCUS patens E. Meyer	KR, NCoR, CW, SCo, ChI, WTR	19b9030801
JUNCUS phaeocephalus Engelm.	NCo, n SNH, CCo, SnFrB, SCo, n ChI, SnBr, PR	09c4404c00
JUNCUS phaeocephalus Engelm. var. paniculatus Engelm.	NCo, n SNH, SnFrB, SnBr, PR	0044404c00
JUNCUS phaeocephalus Engelm. var. phaeocephalus	NCo, CCo, SCo, n ChI	0984000000
JUNCUS regelii Buchenau	KR	0001000000
JUNCUS rugulosus Engelm.	s SNF, CCo, TR, PR, DMtns	4140205401
JUNCUS saximontanus Nelson	KR, CaRH, SNH, SnGb, SnBr, W&I	0401c01502
JUNCUS supiniformis Engelm.	n&c NCo	0004000000
JUNCUS tenuis Willd.	NW, CW	013d030800
JUNCUS textilis Buchenau	s SCoRO, n&c SW	18c0025401
JUNCUS tiehmii B. Ertter	SN, SCoR, TR, PR, n SNE (Bodie Hills)	0040ffd501
JUNCUS torreyi Cov.	SW, GB, D	f8c2045407
JUNCUS triformis Engelm.	SN, SnJV, SCo, PR	00c0f8e100
JUNCUS uncialis E. Greene	KR, NCoRI, GV, SCoRO, SCo, MP	0093022204
JUNCUS xiphioides E. Meyer	CA	ffffffff07
JUNIPERUS californica Carri<#e8>re	NCoRI, SNF, SCoRI, TR, PR, DMtns, SnFrB	4050395c01
JUNIPERUS communis L.	NCo, KR, CaRH, SNH, Wrn	0405c00104
JUNIPERUS occidentalis Hook.	NCoRH, CaRH, SNH, SnGb, SnBr, GB, DMtns	440ac41506
JUNIPERUS occidentalis Hook. var. australis (Vasek) A. Holmgren & N. Holmgren	NCoRH, SNH, SnGb, SnBr, SNE, DMtns	4008c41502
JUNIPERUS occidentalis Hook. var. occidentalis	CaRH, MP	0402000004
JUNIPERUS osteosperma (Torrey) Little	SnGb, SnBr, GB, DMtns	4002041406
JUSTICIA californica (Benth.) D. Gibson	w PR (San Diego River e of Wildcat Canyon), DSon	8040000000
KALLSTROEMIA californica (S. Watson) Vail	D	e000000000
KALLSTROEMIA grandiflora A. Gray	DSon (near Desert Center, Riverside Co.; Jacumba, San Diego Co.; expected elsewhere)	8000000000
KALLSTROEMIA parviflora Norton	c PR (near Warner Hot Springs, San Diego Co.), e DMtns (Clark Mtns, San Bernardino Co.), expected elsewhere	4040000000
KALMIA polifolia Wangenh.	KR, CaRH, SNH, Wrn	0401c00104
KALMIA polifolia Wangenh. ssp. microphylla (Hook.) Calder & Roy Taylor	e KR, CaRH, SNH	0401c00100
KALMIA polifolia Wangenh. ssp. polifolia	KR, n SNH, Wrn	0001400004
KECKIELLA antirrhinoides (Benth.) Straw	SnBr, PR, D	e040004400
KECKIELLA antirrhinoides (Benth.) Straw var. antirrhinoides	SnBr, PR	0040004400
KECKIELLA antirrhinoides (Benth.) Straw var. microphylla (A. Gray) N. Holmgren	D	e000000000
KECKIELLA breviflora (Lindley) Straw	NCoRI, SN, ScV, SCoRO, WTR	0010fa8301
KECKIELLA breviflora (Lindley) Straw var. breviflora	SN, SCoRO, WTR	0000fa8101
KECKIELLA breviflora (Lindley) Straw var. glabrisepala (Keck) N. Holmgren	NCoRI, SN, ScV	0010f88300
KECKIELLA cordifolia (Benth.) Straw	s SCoRO, SW	18c0025401
KECKIELLA corymbosa (Benth.) Straw	NW, n&c CW	013d030800
KECKIELLA lemmonii (A. Gray) Straw	NW, n SN	003d480000
KECKIELLA rothrockii (A. Gray) Straw	SnJt, SNE, DMtns	4000044002
KECKIELLA rothrockii (A. Gray) Straw var. jacintensis (Abrams) N. Holmgren	SnJt	0000004000
KECKIELLA rothrockii (A. Gray) Straw var. rothrockii	SNE, DMtns	4000040002
KECKIELLA ternata (Torrey) Straw	Teh, TR, PR	004000d401
KECKIELLA ternata (Torrey) Straw var. septentrionalis (Munz & I.M. Johnston) N. Holmgren	Teh, WTR	0000008001
KECKIELLA ternata (Torrey) Straw var. ternata	SnGb, SnBr, PR	0040005400
KELLOGGIA galioides Torrey	KR, NCoRH, CaRH, SNH, SnBr, SnJt, MP	040bc04504
KICKXIA elatine (L.) Dumort.	CA-FP	1ffdfbff01
KICKXIA spuria (L.) Dumort.	CA-FP	1ffdfbff01
KOBRESIA bellardii (All.) Degl.	c SNH (Convict & Virginia Creek Basins, Mono Co.)	0000800000
KOCHIA americana S. Watson	GB, DMoj	6002040006
KOCHIA californica S. Watson	s SnJV, DMoj	6000002000
KOCHIA scoparia (L.) Schrader	GV, n SnFrB, SCo, GB, DMoj, DSon, expected elsewhere	e082042a06
KOEBERLINIA spinosa Zucc. ssp. tenuispina (Kearney & Peebles) E. Murray	DSon (Chocolate Mtns.)	8000000000
KOELERIA macrantha (Ledeb.) J. A. Schultes	NW, CaR, SN, CW, TR, PR, GB, DMtns	477fffdd07
KOELERIA phleoides (Villars) Pers.	NCoRI, CaRF, SNF, Teh, GV, s SCoRO, SCoRI	02103ba200
KRAMERIA erecta Schultes	e PR (Santa Rosa Mtns), c&s DMoj, DSon	e040000000
KRAMERIA grayi Rose & Painter	c&s DMoj, DSon	e000000000
KRASCHENINNIKOVIA lanata (Pursh) A.D.J. Meeuse & Smit	SNH (e slope), Teh, s SnJV, s SCoRI, WTR (n slope), GB, DMoj	6002c5a107
KUMLIENIA hystricula (A. Gray) E. Greene	SN (exc Teh)	0000f80100
KYLLINGA brevifolia Rottb.	GV, SW, D	f8c0007601
LACTUCA biennis (Moench) Fern.	NCo, NCoRO, SnFrB	0024000800
LACTUCA canadensis L.	KR, n SN	0001480000
LACTUCA ludoviciana (Nutt.) DC.	CaRF, SCo	0280000000
LACTUCA saligna L.	NCoR, s ScV, CCo, SnFrB, SCoRO	0138020a00
LACTUCA serriola L.	CA	ffffffff07
LACTUCA tatarica (L.) C. Meyer ssp. pulchella (Pursh) Stebb.	CaRH, GB	0402040006
LACTUCA virosa L.	SnFrB, SCoRO	0000020800
LAGOPHYLLA dichotoma Benth.	n SCoRI, e SnJV, w SNF	0000392000
LAGOPHYLLA glandulosa A. Gray	c NCoRI, CaRF, SNF, n GV	0210382200
LAGOPHYLLA minor (Keck) Keck	NCoRI, n SNF (El Dorado Co.)	0010080000
LAGOPHYLLA ramosissima Nutt.	CA-FP, MP	1ffffbff05
LAGOPHYLLA ramosissima Nutt. ssp. congesta (E. Greene) Keck	NCoRI, SNF, sw ScV, e SnFrB	0010380a00
LAGOPHYLLA ramosissima Nutt. ssp. ramosissima	CA-FP, MP	1ffffbff05
LAGURUS ovatus L.	s NCo, CCo, SnFrB	0104000800
LAMARCKIA aurea (L.) Moench	CA	ffffffff07
LAMIUM amplexicaule L.	CA-FP	1ffdfbff01
LAMIUM purpureum L.	NCo, CCo	0104000000
LANGLOISIA setosissima (Torrey & A. Gray) E. Greene	SNE, D	e000040002
LANGLOISIA setosissima (Torrey & A. Gray) E. Greene ssp. punctata (Cov.) S. Timbrook	SNE, DMoj	6000040002
LANGLOISIA setosissima (Torrey & A. Gray) E. Greene ssp. setosissima	SNE, D	e000040002
LANTANA camara L.	SCo as waif	0080000000
LANTANA montevidensis (Sprengel) Briq.	SCo as waif	0080000000
LAPPULA redowskii (Hornem.) E. Greene	SNH, SnBr, SnJt, GB, DMoj	6002c44506
LAPPULA redowskii (Hornem.) E. Greene var. cupulata (A. Gray) M.E. Jones	GB, DMoj	6002040006
LAPPULA redowskii (Hornem.) E. Greene var. redowskii	SNH, SnBr, SnJt, GB, DMtns	4002c44506
LAPPULA squarrosa (Retz.) Dumort.	SCo (Santa Monica, Upland)	0080000000
LAPSANA communis L.	NW, n SNF, n CW	013d0b0800
LARREA tridentata (DC.) Cov.	SNE, D, (uncommon in Teh, SnJV, SCo, SnJt)	e08004e002
LASTARRIAEA coriacea (Goodman) Hoover	SN, GV, CW, SW	19c0fbff01
LASTHENIA burkei (E. Greene) E. Greene	s NCoRI (s Mendocino, s Lake and ne Sonoma cos.)	0010000000
LASTHENIA californica Lindley	CA-FP, w DMoj	7ffdfbff01
LASTHENIA chrysantha (A. Gray) E. Greene	s ScV, SnJV	0000002200
LASTHENIA conjugens E. Greene	+/- deltaic ScV (Napa, Solano cos.) (formerly NCo, s ScV, SnFrB, SCo)	0000000200
LASTHENIA coronaria (Nutt.) Ornd.	SCo, PR, w D	e0c0004000
LASTHENIA debilis (A. Gray) Ornd.	c&s SNF, Teh, SCoRI	0000318000
LASTHENIA ferrisiae Ornd.	ScV (2 stations), SnJV	0000002200
LASTHENIA fremontii (A. Gray) E. Greene	GV	0000002200
LASTHENIA glaberrima A.DC.	NCoR, ScV, n SnJV, CW, MP (rare)	013a032a04
LASTHENIA glabrata Lindley	NCoRI, Teh, ScV, n SnJV, SnFrB, SCoRO, SCo, n ChI (Santa Rosa Island), PR, w DMoj	68d002ea00
LASTHENIA glabrata Lindley ssp. coulteri (A. Gray) Ornd.	Teh (1 station), s SCoRO, SCo, n ChI (Santa Rosa Island), PR, w DMoj	68c002c000
LASTHENIA glabrata Lindley ssp. glabrata	NCoRI, ScV, n SnJV, SnFrB, n SCoRO	0010022a00
LASTHENIA leptalea (A. Gray) Ornd.	SCoR (Monterey, San Luis Obispo cos.)	0000030000
LASTHENIA macrantha (A. Gray) E. Greene	NCo, CCo	0104000000
LASTHENIA macrantha (A. Gray) E. Greene ssp. bakeri (J. Howell) Ornd.	c&s NCo (Mendocino, Sonoma cos.)	0004000000
LASTHENIA macrantha (A. Gray) E. Greene ssp. macrantha	NCo, CCo (2 stations)	0104000000
LASTHENIA maritima (A. Gray), M.C. Vasey	NCo, CCo	0104000000
LASTHENIA microglossa (A.DC.) E. Greene	NCoRI, ScV (1 collection), SnFrB, SCoR, TR, PR, DMoj	6050035e01
LASTHENIA minor (A.DC.) Ornd.	NCo, s ScV, SnJV, CCo	0104002200
LASTHENIA platycarpha (A. Gray) E. Greene	ScV, n SnJV, SnFrB (very uncommon)	0000002a00
LATHYRUS angulatus L.	CA-FP	1ffdfbff01
LATHYRUS aphaca L.	NW	003d000000
LATHYRUS biflorus T.W. Nelson & J.P. Nelson	NCoRH (Lassics Range, Humboldt Co.)	0008000000
LATHYRUS brownii Eastw.	NCo, KR, CaR, n&c SN	0605d80000
LATHYRUS cicera L.	CA-FP	1ffdfbff01
LATHYRUS delnorticus C. Hitchc.	nw KR (Del Norte, w Siskiyou cos.)	0001000000
LATHYRUS glandulosus Broich	NCoR (Humboldt, n Mendocino cos.)	0038000000
LATHYRUS hirsutus L.	SnFrB, sporadic elsewhere in CA-FP	1ffdfbff01
LATHYRUS hitchcockianus Barneby & Reveal	ne DMoj (Grapevine Mtns, Inyo Co.)	6000000000
LATHYRUS japonicus Willd.	NCo (Del Norte Co.)	0004000000
LATHYRUS jepsonii E. Greene	KR, NCoR, CaR, n SN, GV, CW, SCoRO	07394b2a00
LATHYRUS jepsonii E. Greene var. californicus (S. Watson) Hoover	KR, NCoR, CaR, n SN, GV, CW, SCoRO	07394b2a00
LATHYRUS jepsonii E. Greene var. jepsonii	GV, esp SnFrB	0000002a00
LATHYRUS lanszwertii Kellogg	KR, NCoR, SNH, GB	003bc40106
LATHYRUS lanszwertii Kellogg var. aridus (Piper) Jepson	KR, SNH, MP	0003c00104
LATHYRUS lanszwertii Kellogg var. lanszwertii	KR, NCoR, GB	003b040006
LATHYRUS lanszwertii Kellogg var. tracyi (Bradshaw) Isely	KR, NCoR	0039000000
LATHYRUS latifolius L.	CA-FP	1ffdfbff01
LATHYRUS littoralis (Nutt.) Endl.	NCo, n&c CCo	0104000000
LATHYRUS nevadensis S. Watson var. nevadensis	KR, NCoR, CaR, n&c SN	0639d80000
LATHYRUS odoratus L.	CA-FP	1ffdfbff01
LATHYRUS palustris L.	n NCo	0004000000
LATHYRUS polyphyllus Nutt.	KR, n&c NCoR	0039000000
LATHYRUS rigidus T. White	MP (Modoc Co.)	0002000004
LATHYRUS sphaericus Retz.	CA-FP	1ffdfbff01
LATHYRUS splendens Kellogg	s SCo, PR (San Diego Co.)	00c0000000
LATHYRUS sulphureus A. Gray	KR, NCoR, SN	0039f88100
LATHYRUS tingitanus L.	CA-FP	1ffdfbff01
LATHYRUS torreyi A. Gray	NCo, NCoR, n SnFrB	003c000800
LATHYRUS vestitus Nutt.	NCo, KR, NCoR, CW, SW	19fd035c01
LATHYRUS vestitus Nutt. var. alefeldii (T. White) Isely	SCo, s ChI, PR	10c0004000
LATHYRUS vestitus Nutt. var. ochropetalus (Piper) Isely	NCo, KR, NCoRO	0025000000
LATHYRUS vestitus Nutt. var. vestitus	NCo, NCoR, CW, SW	19fc035c01
LAVATERA arborea L.	n CCo, SCo	0180000000
LAVATERA assurgentiflora Kellogg	ChI	1800000000
LAVATERA cretica L.	CCo, SCo	0180000000
LAYIA carnosa (Nutt.) Torrey & A. Gray	n NCo, CCo	0104000000
LAYIA chrysanthemoides (DC.) A. Gray	NCo, NCoR, GV, CW	013c032a00
LAYIA discoidea Keck	SCoRI (San Benito Co.)	0000010000
LAYIA fremontii (Torrey & A. Gray) A. Gray	c NCoR (Mendocino Co.), CaRF, SNF, GV	0238382200
LAYIA gaillardioides (Hook. & Arn.) DC.	NCo, NCoR, CW	013c030800
LAYIA glandulosa (Hook.) Hook. & Arn.	CaRH, SNH, Teh, SnJV, CW, SW, GB, D	fdc2c7fd07
LAYIA heterotricha (DC.) Hook. & Arn.	s Teh, w SnJV, SCoR, n WTR	000003a001
LAYIA hieracioides (DC.) Hook. & Arn.	CW, WTR	0100030801
LAYIA jonesii A. Gray	c CCo, c SCoRO (San Luis Obispo Co.)	0100020000
LAYIA leucopappa Keck	w Teh (Kern Co.)	0000008000
LAYIA munzii Keck	SnJV	0000002000
LAYIA pentachaeta A. Gray	SNF, n SNH, Teh, SnJV, SCoRI	000079a000
LAYIA pentachaeta A. Gray ssp. albida Keck	s SNF, Teh, SnJV, SCoRI	000021a000
LAYIA pentachaeta A. Gray ssp. pentachaeta	SNF, n SNH, SnJV, rare in SCoRI	0000792000
LAYIA platyglossa (Fischer & C. Meyer) A. Gray	NW, GV, CW, SW	19fd037e01
LAYIA septentrionalis Keck	c&s NCoRI, ScV (Sutter Buttes)	0010000200
LEDUM glandulosum Nutt.	NCo, KR, s NCoRO, CaRH, SNH, CCo, SnFrB, n SCoRI, SNE	0525c50902
LEERSIA oryzoides (L.) Sw.	NW, ne SCo, SNE (Owens Valley)	00bd040002
LEGENERE limosa (E. Greene) McVaugh	s NCoR, s ScV, n SnJV, SnFrB (Santa Cruz Mtns)	0038002a00
LEMBERTIA congdonii (A. Gray) E. Greene	sw SnJV	0000002000
LEMNA aequinoctialis Welw.	GV, CCo, SCo, DSon	8180002200
LEMNA gibba L.	CA	ffffffff07
LEMNA minor L.	CA	ffffffff07
LEMNA minuta Kunth	CA except MP	ffffffff07
LEMNA trisulca L.	CaR, SN, SCo?, SnBr, GB, DMoj?	6682fc8506
LEMNA turionifera Landolt	Most of CA	ffffffff07
LEMNA valdiviana Philippi	NCo, NCoR, CCo, SCoR, SCo, SnFrB	01bc030800
LENS culinaris Medikus	CW	0100030800
LEONTODON taraxacoides (Villars) M<#e9>rat	NW, n SN, SnJV, CCo, SnFrB	013d482800
LEONTODON taraxacoides (Villars) M<#e9>rat ssp. longirostris Finch & Sell	NW, n SN, SnJV, CCo, SnFrB	013d482800
LEONTODON taraxacoides (Villars) M<#e9>rat ssp. taraxacoides	NCo	0004000000
LEPECHINIA calycina (Benth.) Epling	NCoR, n&c SNF, SnFrB, SCoRO, WTR	00381a0801
LEPECHINIA cardiophylla Epling	PR (Santa Ana Mtns)	0040000000
LEPECHINIA fragrans (E. Greene) Epling	SCo, n ChI	0880000000
LEPECHINIA ganderi Epling	PR (Otay Mtns)	0040000000
LEPIDIUM campestre (L.) R.Br.	KR, CaR, n SNF, expected elsewhere	0601080000
LEPIDIUM densiflorum Schrader	KR, CaR, n SNH, GV, SCo, GB, DMoj	6683442206
LEPIDIUM densiflorum Schrader var. densiflorum	CaR, GV, DMoj, expected elsewhere	6600002200
LEPIDIUM densiflorum Schrader var. elongatum (Rydb.) Thell.	SCo, GB	0082040006
LEPIDIUM densiflorum Schrader var. macrocarpum G. Mulligan	KR, n SNH, ScV, SNE, expected elsewhere	0001440202
LEPIDIUM densiflorum Schrader var. pubicarpum (Nelson) Thell.	KR, CaR, GB, DMtns, expected elsewhere	4603040006
LEPIDIUM densiflorum Schrader var. ramosum (Nelson) Thell.	SNE, DMoj	6000040002
LEPIDIUM dictyotum A. Gray	CA (exc NW, SN)	ffc2077e07
LEPIDIUM dictyotum A. Gray var. acutidens A. Gray	CaR, GV, SW, MP	1ec2007605
LEPIDIUM dictyotum A. Gray var. dictyotum	CaR, GV, SnFrB, SCoR, SW, MP, W&I, DMoj	7ec2037e07
LEPIDIUM flavum Torrey	W&I, D	e000000002
LEPIDIUM flavum Torrey var. felipense C. Hitchc.	DSon (Borrego Valley)	8000000000
LEPIDIUM flavum Torrey var. flavum	W&I, D	e000000002
LEPIDIUM fremontii S. Watson	s SNE, D	e000040002
LEPIDIUM fremontii S. Watson var. fremontii	s SNE, D	e000040002
LEPIDIUM fremontii S. Watson var. stipitatum Rollins	W&I, ne DMtns (Last Chance Mtns), DSon	c000000002
LEPIDIUM heterophyllum Benth.	CaR	0600000000
LEPIDIUM jaredii Brandegee	SCoRI, SnJV	0000012000
LEPIDIUM lasiocarpum Torrey & A. Gray var. lasiocarpum	CCo, SW, W&I, D	f9c0005403
LEPIDIUM latifolium L.	CA (exc KR, D)	1ffeffff07
LEPIDIUM latipes Hook.	NCo, NCoR, GV, CCo, SnFrB, SCoRI, SCo	01bc012a00
LEPIDIUM latipes Hook. var. heckardii Rollins	s ScV (Yolo Co.)	0000000200
LEPIDIUM latipes Hook. var. latipes	NCo, NCoR, GV, CCo, SnFrB, SCoRI, SCo	01bc012a00
LEPIDIUM montanum Nutt.	CaR, GB, DMoj	6602040006
LEPIDIUM montanum Nutt. var. canescens (Thell.) C. Hitchc.	CaR, MP	0602000004
LEPIDIUM montanum Nutt. var. cinereum (C. Hitchc.) Rollins	DMoj	6000000000
LEPIDIUM montanum Nutt. var. montanum	GB	0002040006
LEPIDIUM nitidum Torrey & A. Gray	CA (exc e D)	ffffffff07
LEPIDIUM nitidum Torrey & A. Gray var. howellii C. Hitchc.	w DMoj	6000000000
LEPIDIUM nitidum Torrey & A. Gray var. nitidum	CA (exc e D)	ffffffff07
LEPIDIUM nitidum Torrey & A. Gray var. oreganum (E. Greene) C. Hitchc.	NCo, GV, CCo, SCoRO	0104022200
LEPIDIUM oblongum Small	GV, s CCo, SW	19c0007601
LEPIDIUM oblongum Small var. insulare C. Hitchc.	s CCo, SCo, ChI	1980000000
LEPIDIUM oblongum Small var. oblongum	GV, SW	18c0007601
LEPIDIUM oxycarpum Torrey & A. Gray	GV, CW	0100032a00
LEPIDIUM perfoliatum L.	CaR, GV, SCoRI, GB, D	e602052206
LEPIDIUM pinnatifidum Ledeb.	CCo, SCo (expected elsewhere)	0180000000
LEPIDIUM ramosissimum Nelson var. bourgeauanum (Thell.) Rollins	CaR, n ScV, SW	1ec0005601
LEPIDIUM strictum (S. Watson) Rattan	CA (exc D)	1fffffff07
LEPIDIUM thurberi Wooton	DMoj	6000000000
LEPIDIUM virginicum L.	CA (exc KR, SNH)	fffe3ffe07
LEPIDIUM virginicum L. var. medium (E. Greene) C. Hitchc.	NW, CaR, MP	063f000004
LEPIDIUM virginicum L. var. pubescens (E. Greene) Thell.	CA (exc KR, SNH)	fffe3ffe07
LEPIDIUM virginicum L. var. robinsonii (Thell.) C. Hitchc.	SW	18c0005401
LEPIDIUM virginicum L. var. virginicum	CA (exc KR, SNH)	fffe3ffe07
LEPIDOSPARTUM latisquamum S. Watson	SnGb (n slope), W&I, DMtns	4000001002
LEPIDOSPARTUM squamatum (A. Gray) A. Gray	SNF, SCoRI, SCoRO, SW, D	f8c03b5401
LEPTOCHLOA fascicularis (Lam.) A. Gray	GV, GB, D	e002042206
LEPTOCHLOA filiformis (Pers.) P. Beauv.	DSon (Imperial Co.)	8000000000
LEPTOCHLOA uninervia (C. Presl) A. Hitchc. & Chase	s SNF, SnJV, SW, GB, D	f8c2247407
LEPTOCHLOA viscida (Scribner) Beal	SnJV (Kern Co.)	0000002000
LEPTODACTYLON californicum Hook. & Arn.	s SCoRO, n&c SW	18c0025401
LEPTODACTYLON jaegeri (Munz) Wherry	SnJt	0000004000
LEPTODACTYLON pungens (Torrey) Rydb.	CA	ffffffff07
LEPTOSPERMUM laevigatum (Gaertner) F. Muell.	CCo	0100000000
LESQUERELLA kingii (S. Watson) S. Watson	SnBr, SNE, DMtns	4000040402
LESQUERELLA kingii (S. Watson) S. Watson ssp. bernardina (Munz) Munz	SnBr (Bear Valley)	0000000400
LESQUERELLA kingii (S. Watson) S. Watson ssp. kingii	SNE, DMtns	4000040002
LESQUERELLA kingii (S. Watson) S. Watson ssp. latifolia (Nelson) Rollins & E. Shaw	DMtns	4000000000
LESQUERELLA occidentalis (S. Watson) S. Watson ssp. occidentalis	KR, NCoRH, CaRH, n SNH, MP	040b400004
LESQUERELLA tenella Nelson	D	e000000000
LESSINGIA arachnoidea E. Greene	sw SnFrB (San Mateo Co., near Crystal Springs Reservoir)	0000000800
LESSINGIA filaginifolia (Hook. & Arn.) M.A. Lane	NCo, KR, NCoRO, s SN, SnJV, CW, SW	19e5237d01
LESSINGIA filaginifolia (Hook. & Arn.) M.A. Lane var. californica (DC.) M.A. Lane	NCo, KR, NCoRO, CW	0125030800
LESSINGIA filaginifolia (Hook. & Arn.) M.A. Lane var. filaginifolia	s SN, SnJV, CW, SW	19c0237d01
LESSINGIA germanorum Cham.	SnFrB	0000000800
LESSINGIA glandulifera A. Gray	SNF, SnJV, CW, SCo, TR, PR	01c03b7c01
LESSINGIA glandulifera A. Gray var. glandulifera	SNF, SnJV, SnFrB, SCoR, SCo, TR, PR	00c03b7c01
LESSINGIA glandulifera A. Gray var. pectinata (E. Greene) Jepson	CCo, SnFrB, SCoRO	0100020800
LESSINGIA glandulifera A. Gray var. tomentosa (E. Greene) Ferris	e PR (Warner's Ranch, San Diego Co.)	0040000000
LESSINGIA hololeuca E. Greene	s NCoR, s ScV, n SnFrB	0038000a00
LESSINGIA lemmonii A. Gray	TR, W&I, DMoj	6000001403
LESSINGIA lemmonii A. Gray var. lemmonii	TR, W&I, DMoj	6000001403
LESSINGIA lemmonii A. Gray var. peirsonii (J. Howell) Ferris	e WTR, w DMoj	6000000001
LESSINGIA lemmonii A. Gray var. ramulosissima (Nelson) Ferris	TR, W&I, DMoj	6000001403
LESSINGIA leptoclada A. Gray	SN	0000f88100
LESSINGIA micradenia E. Greene	SnFrB	0000000800
LESSINGIA micradenia E. Greene var. glabrata (Keck) Ferris	s SnFrB (Santa Clara Co.)	0000000800
LESSINGIA micradenia E. Greene var. micradenia	n SnFrB (Mount Tamalpais, Marin Co.)	0000000800
LESSINGIA nana A. Gray	CaRF, SNF, GV	0200382200
LESSINGIA nemaclada E. Greene	NW, CaR, SN, GV, SnFrB, SCoRI	063df9ab00
LESSINGIA occidentalis (H.M. Hall) M.A. Lane	SCoRI (areas of Parkfield, se Monterey Co., and New Idria, se San Benito Co.)	0000010000
LESSINGIA ramulosa A. Gray	NCoR, n SnFrB	0038000800
LESSINGIA tenuis (A. Gray) Cov.	SnFrB, SCoR, WTR	0000030801
LESSINGIA virgata A. Gray	CaRF, n&c SNF, e GV	0200182200
LEUCANTHEMUM maximum (Ramond) DC.	NCo, CCo, SCoRO, WTR	0104020001
LEUCANTHEMUM vulgare Lam.	KR, NCoRO, n&c SNH, SnFrB, WTR, PR	0061c04801
LEUCOCRINUM montanum Nutt.	KR, CaRH, MP	0403000004
LEUCOTHOE davisiae Torrey	KR, SNH, Wrn	0001c00104
LEWISIA brachycalyx A. Gray	SnBr, PR	0040004400
LEWISIA cantelovii J. Howell	KR, CaRH, n SNH	0401400000
LEWISIA columbiana (Howell) Robinson	KR (Trinity Co.)	0001000000
LEWISIA congdonii (Rydb.) J. Howell	c SN (Fresno, Mariposa cos.?)	0000900000
LEWISIA cotyledon (S. Watson) Robinson	KR, CaRH	0401000000
LEWISIA cotyledon (S. Watson) Robinson var. cotyledon	KR, CaRH?	0401000000
LEWISIA cotyledon (S. Watson) Robinson var. heckneri (C. Morton) Munz	KR (n Trinity, e Humboldt cos.)	0001000000
LEWISIA cotyledon (S. Watson) Robinson var. howellii (S. Watson) Jepson	KR, CaRH (Shasta Co.)	0401000000
LEWISIA disepala Rydb.	c&s SNH	0000800100
LEWISIA glandulosa (Rydb.) Dempster	c&s SNH, SNE	0000840102
LEWISIA kelloggii M.K. Brandegee	n&c SNH	0000c00000
LEWISIA kelloggii ssp. hutchisonii Dempster	n SNH (Sierra Co.)	0000400000
LEWISIA leana (Porter) Robinson	KR, NCoRH, SNH (Fresno Co.)	0009c00100
LEWISIA longipetala (Piper) Clay	n SNH (Nevada, Eldorado cos.)	0000400000
LEWISIA nevadensis (A. Gray) Robinson	KR, NCoRH, CaRH, SNH, TR	0409c01501
LEWISIA oppositifolia (S. Watson) Robinson	KR (n Del Norte Co.)	0001000000
LEWISIA pygmaea (A. Gray) Robinson	KR, NCoRH, CaRH, SNH, WTR (Mt. Pinos), SnBr, Wrn, W&I	0409c00507
LEWISIA rediviva Pursh	KR, NCoRH, NCoRI, SN, SnFrB, SCoRI, TR, SnJt, MP, SNE	001bfddd07
LEWISIA stebbinsii R. Gankin & W.R. Hildreth	NCoRH (se Trinity, ne Mendocino cos.)	0008000000
LEWISIA triphylla (S. Watson) Robinson	KR, NCoRH, CaRH, SNH, Wrn	0409c00104
LEYMUS X-multiflorus (Gould) Barkworth & D.R. Dewey	SnJV, CW	0100032800
LEYMUS X-vancouverensis (Vasey) Pilger	NCo, n CCo	0104000000
LEYMUS cinereus (Scribner & Merr.) A. L<#f6>ve	CaR, SN, Teh, ScV, TR, GB, e DMtns (Kingston Mtns)	4602fc9707
LEYMUS condensatus (C. Presl) A. L<#f6>ve	CW, SW, DMoj	79c0035c01
LEYMUS mollis (Trin.) Pilger ssp. mollis	NCo, CCo	0104000000
LEYMUS pacificus (Gould) D.R. Dewey	s NCo, CCo, n ChI	0904000000
LEYMUS salinus (M.E. Jones) A. L<#f6>ve ssp. mojavensis Barkworth & R.J. Atkins	DMtns	4000000000
LEYMUS triticoides (Buckley) Pilger	CA (exc D)	1fffffff07
LIBERTIA formosa Graham	SnFrB	0000000800
LIGUSTICUM apiifolium (Nutt.) A. Gray	NCo, CCo	0104000000
LIGUSTICUM californicum J. Coulter & Rose	NCo, KR, CaRH, n SNF	0405080000
LIGUSTICUM grayi J. Coulter & Rose	KR, CaRH, SNH, MP	0403c00104
LILAEA scilloides (Poiret) Hauman	NCo, NCoRI, SN, GV, CW, SCo, PR, GB	01d6ffeb06
LILAEOPSIS masonii Mathias & Constance	s ScV, ne SnFrB	0000000a00
LILAEOPSIS occidentalis J. Coulter & Rose	NCo, CCo	0104000000
LILIUM bolanderi S. Watson	KR	0001000000
LILIUM columbianum Baker	NW	003d000000
LILIUM humboldtii Roezl & Leichtlin	s CaRH, SNH, SW	1cc0c05501
LILIUM humboldtii Roezl & Leichtlin ssp. humboldtii	s CaRH, SNH	0400c00100
LILIUM humboldtii Roezl & Leichtlin ssp. ocellatum (Kellogg) Thorne	SCoRO, SW	18c0025401
LILIUM kelleyanum Lemmon	c&s SNH	0000800100
LILIUM kelloggii Purdy	KR, n NCoRO	0021000000
LILIUM maritimum Kellogg	s NCo (extirpated in n CCo)	0104000000
LILIUM occidentale Purdy	n NCo (Humboldt Bay, Humboldt Co.)	0004000000
LILIUM pardalinum Kellogg	CA-FP	1ffdfbff01
LILIUM pardalinum Kellogg ssp. pardalinum	CA-FP	1ffdfbff01
LILIUM pardalinum Kellogg ssp. pitkinense (Beane & Vollmer) M. Skinner	s NCoRO (Pitkin Marsh, Sonoma Co.)	0020000000
LILIUM pardalinum Kellogg ssp. shastense (Eastw.) M. Skinner	KR, CaR, n SNH	0601400000
LILIUM pardalinum Kellogg ssp. vollmeri (Eastw.) M. Skinner	KR	0001000000
LILIUM pardalinum Kellogg ssp. wigginsii (Beane & Vollmer) M. Skinner	KR	0001000000
LILIUM parryi S. Watson	TR, PR	0040005401
LILIUM parvum Kellogg	n&c SNH	0000c00000
LILIUM rubescens S. Watson	NW, SnFrB	003d000800
LILIUM washingtonianum Kellogg	KR, CaR, SN	0601f88100
LILIUM washingtonianum Kellogg ssp. purpurascens (Stearn) M. Skinner	KR	0001000000
LILIUM washingtonianum Kellogg ssp. washingtonianum	CaR, SN	0600f88100
LIMNANTHES alba Benth.	s NCoR, CaRF, n&c SNF, n SNH, GV	0238582200
LIMNANTHES alba Benth. ssp. alba	s NCoR, n&c SNF, GV	0038182200
LIMNANTHES alba Benth. ssp. versicolor (E. Greene) C. Mason	CaRF, n&c SNF, n SNH	0200580000
LIMNANTHES bakeri J. Howell	c NCoRO (near Willits, Mendocino Co.)	0020000000
LIMNANTHES douglasii R.Br.	NCo, NCoR, CaRF, c SNF, GV, CCo, SnFrB, SCoR	033c132a00
LIMNANTHES douglasii R.Br. ssp. douglasii	NCo, NCoRO, CCo, SnFrB	0124000800
LIMNANTHES douglasii R.Br. ssp. nivea (C. Mason) C. Mason	NCoR, SnFrB, SCoR	0038030800
LIMNANTHES douglasii R.Br. ssp. rosea (Benth.) C. Mason	NCoRI, CaRF, c SNF, GV	0210102200
LIMNANTHES douglasii R.Br. ssp. sulphurea (C. Mason) C. Mason	NCo (Marin Co.), CCo (San Mateo Co.)	0104000000
LIMNANTHES floccosa Howell	KR, NCoRI (near Kelseyville, Lake Co.), CaR, ScV	0611000200
LIMNANTHES floccosa Howell ssp. californica Arroyo	ScV (Butte Co.)	0000000200
LIMNANTHES floccosa Howell ssp. floccosa	KR, NCoRI (near Kelseyville, Lake Co.), CaR	0611000000
LIMNANTHES gracilis Howell ssp. parishii (Jepson) Beauch.	PR	0040004000
LIMNANTHES montana Jepson	c&s SNF	0000300000
LIMNANTHES striata Jepson	KR, n&c SNF	0001180000
LIMNANTHES vinculans Ornd.	s NCoRO (s Sonoma Co)	0020000000
LIMONIUM arborescens (Brouss.) Kuntze	SCo	0080000000
LIMONIUM californicum (Boiss.) A.A. Heller	NCo, CCo, SCo	0184000000
LIMONIUM otolepis (Schrenk) Kuntze	SnFrB, SCo	0080000800
LIMONIUM perezii (Stapf) Hubb.	SCoRO, SCo	0080020000
LIMONIUM sinuatum (L.) Miller	SnFrB, SCoRO, SCo	0080020800
LIMOSELLA acaulis Sess<#e9> & Moci<#f1>o	SNH, GV, SnFrB, SW, MP	18c2c07f05
LIMOSELLA aquatica L.	CaR, SNH, CCo, SnFrB, SnBr, MP	0702c00d04
LIMOSELLA subulata Ives	Deltaic GV (Contra Costa, Sacramento cos.)	0000002200
LINANTHUS acicularis E. Greene	NCo, NCoR, SnFrB	003c000800
LINANTHUS ambiguus (Rattan) E. Greene	SnFrB, SCoRI	0000010800
LINANTHUS androsaceus (Benth.) E. Greene	NCoR, SnFrB	0038000800
LINANTHUS arenicola (M.E. Jones) Jepson & V. Bailey	DMoj	6000000000
LINANTHUS aureus (Nutt.) E. Greene	D	e000000000
LINANTHUS aureus (Nutt.) E. Greene ssp. aureus	D	e000000000
LINANTHUS aureus (Nutt.) E. Greene ssp. decorus (A. Gray) H. Mason	D	e000000000
LINANTHUS bellus (A. Gray) E. Greene	se PR (se San Diego Co.)	0040000000
LINANTHUS bicolor (Nutt.) E. Greene	NCoR, SNF, SnFrB, SCoR, s ChI, WTR	10383b0801
LINANTHUS bigelovii (A. Gray) E. Greene	SCoRI, WTR, W&I, D	e000010003
LINANTHUS bolanderi (A. Gray) E. Greene	NCoR, n SNF, SnFrB	0038080800
LINANTHUS breviculus (A. Gray) E. Greene	SnGb, SnBr, DMoj	6000001400
LINANTHUS ciliatus (Benth.) E. Greene	CA-FP	1ffdfbff01
LINANTHUS concinnus Milliken	SnGb	0000001000
LINANTHUS demissus (A. Gray) E. Greene	DMoj	6000000000
LINANTHUS dianthiflorus (Benth.) E. Greene	SCo, ChI, WTR, PR	18c0004001
LINANTHUS dichotomus Benth.	CA-FP, W&I, D	fffdfbff03
LINANTHUS filipes (Benth.) E. Greene	NCoR, CaRF, SNF	0238380000
LINANTHUS floribundus (A. Gray) Milliken	SnGb, SnBr, SnJt, PR	0040005400
LINANTHUS floribundus (A. Gray) Milliken ssp. floribundus	SnGb, SnBr, SnJt, PR	0040005400
LINANTHUS floribundus (A. Gray) Milliken ssp. glaber R. Patterson	SnBr, PR	0040004400
LINANTHUS floribundus (A. Gray) Milliken ssp. hallii (Jepson) H. Mason	e PR (Santa Rosa Mtns)	0040000000
LINANTHUS grandiflorus (Benth.) E. Greene	NCo, CCo, SnFrB	0104000800
LINANTHUS harknessii (Curran) E. Greene	NCoR, CaR, SNH, GB	063ac40106
LINANTHUS jepsonii D.W. Schemske & C. Goodwillie	NCoR (Napa, Lake, and Sonoma cos.)	0038000000
LINANTHUS jonesii (A. Gray) E. Greene	D	e000000000
LINANTHUS killipii H. Mason	c SnBr (Baldwin Lake).	0000000400
LINANTHUS lemmonii (A. Gray) E. Greene	SW, w DSon	98c0005401
LINANTHUS liniflorus (Benth.) E. Greene	n&c CA-FP, w DMoj	7ffdfbff01
LINANTHUS montanus (E. Greene) E. Greene	c&s SNF	0000300000
LINANTHUS nudatus E. Greene	s SNH, Teh	0000008100
LINANTHUS nuttallii (A. Gray) Milliken	KR, NCoRO, NCoRH, CaRH, Wrn, SNE	0429040006
LINANTHUS nuttallii (A. Gray) Milliken ssp. howellii T.W. Nelson & R. Patterson	NCoRH	0008000000
LINANTHUS nuttallii (A. Gray) Milliken ssp. nuttallii	KR, NCoRO, CaRH, Wrn	0421000004
LINANTHUS nuttallii (A. Gray) Milliken ssp. pubescens R. Patterson	SNE	0000040002
LINANTHUS oblanceolatus (Brand) Jepson	s SNH	0000000100
LINANTHUS orcuttii (C. Parry & A. Gray) Jepson	PR	0040004000
LINANTHUS pachyphyllus R. Patterson	SNH	0000c00100
LINANTHUS parryae (A. Gray) E. Greene	s SNF, s SnJV, SCoRI, WTR, DMoj	6000212001
LINANTHUS parviflorus (Benth.) E. Greene	CA-FP	1ffdfbff01
LINANTHUS pygmaeus (Brand) J. Howell	SNF, GV, CW, SW	19c03b7e01
LINANTHUS pygmaeus (Brand) J. Howell ssp. continentalis Raven	SNF, GV, CW, SW (exc ChI)	01c03b7e01
LINANTHUS pygmaeus (Brand) J. Howell ssp. pygmaeus	s ChI (San Clemente)	1000000000
LINANTHUS rattanii (A. Gray) E. Greene	NCoRH	0008000000
LINANTHUS septentrionalis H. Mason	GB	0002040006
LINANTHUS serrulatus E. Greene	s SNF	0000200000
LINARIA bipartita Willd.	SW	18c0005401
LINARIA canadensis (L.) Dum.-Cours.	NCo, NCoR, SNF, GV, CW, WTR, PR	017c3b6a01
LINARIA genistifolia (L.) Miller ssp. dalmatica (L.) Maire & Petitm.	CA-FP	1ffdfbff01
LINARIA maroccana Hook. f.	CW, SW	19c0035c01
LINARIA pinifolia (Poiret) Thell.	s CW	0100030800
LINARIA purpurea (L.) Miller	CW, SW	19c0035c01
LINARIA supina (L.) Chaz.	s CW	0100030800
LINARIA vulgaris Miller	CA-FP	1ffdfbff01
LINDERNIA dubia (L.) Pennell	KR, SN, GV, SnFrB, SNE	0001fcab02
LINDERNIA dubia (L.) Pennell var. anagallidea (Michaux) Cooperr.	SN, GV	0000f8a300
LINDERNIA dubia (L.) Pennell var. dubia	KR, SN, GV, SnFrB, SNE	0001fcab02
LINNAEA borealis L. var. longiflora Torrey	NW, CaR, n SNH, MP	063f400004
LINUM bienne Miller	NCo, CCo	0104000000
LINUM grandiflorum Desf.	CCo	0100000000
LINUM lewisii Pursh	CA-FP, n SNE, W&I, D	fffdffff01
LINUM lewisii Pursh var. alpicola Jepson	SNH, W&I	0000c00102
LINUM lewisii Pursh var. lewisii	CA-FP, n SNE, D	fffdffff01
LINUM puberulum (Engelm.) A.A. Heller	e DMtns	4000000000
LINUM usitatissimum L.	CA-FP	1ffdfbff01
LIPOCARPHA aristulata (Cov.) G.C. Tucker	NCoRO, ScV	0020000200
LIPOCARPHA micrantha (M. Vahl) G.C. Tucker	NCoRO, SNF, GV	0020382200
LIPOCARPHA occidentalis (A. Gray) G.C. Tucker	NCoRO, SN, PR	0060f8c100
LISTERA caurina Piper	KR	0001000000
LISTERA convallarioides (Sw.) Nutt.	KR, NCoRH, CaR, SNH, SnBr, SnJt, MP	060bc04504
LISTERA cordata (L.) R.Br.	KR	0001000000
LITHOCARPUS densiflorus (Hook. & Arn.) Rehder	NW, CaR, SN, CW, WTR	073dfb8901
LITHOCARPUS densiflorus (Hook. & Arn.) Rehder var. densiflorus	NW, CaR, SN, CW, WTR	073dfb8901
LITHOCARPUS densiflorus (Hook. & Arn.) Rehder var. echinoides (R.Br. Campst.) Abrams	KR, CaR, SN	0601f88100
LITHOPHRAGMA affine A. Gray	KR, NCoR, c SNF, SnFrB, SCoR, s ChI, TR, PR	1079135c01
LITHOPHRAGMA bolanderi A. Gray	NCoR, CaRF, SNF, SnFrB, SnGb	0238381800
LITHOPHRAGMA campanulatum T.J. Howell	KR, NCoR, CaR, n SN	0639480000
LITHOPHRAGMA cymbalaria Torrey & A. Gray	SnFrB, SCoR, WTR, SnGb, n ChI	0800031801
LITHOPHRAGMA glabrum Nutt.	KR, CaRH, SNH, MP, n SNE	0403c40104
LITHOPHRAGMA heterophyllum (Hook. & Arn.) Torrey & A. Gray	NCoR, SnFrB, SCoR, w WTR	0038030801
LITHOPHRAGMA maximum Bacigal.	s ChI (San Clemente Island)	1000000000
LITHOPHRAGMA parviflorum (Hook.) Torrey & A. Gray	KR, NCoR, SN, CaRF, SnFrB, SCoR, WTR, MP	023bfb8905
LITHOPHRAGMA parviflorum (Hook.) Torrey & A. Gray var. parviflorum	KR, NCoR, SN, CaRF, SnFrB, SCoR, WTR, MP	023bfb8905
LITHOPHRAGMA parviflorum (Hook.) Torrey & A. Gray var. trifoliatum (Eastw.) Jepson	CaRF, SNF	0200380000
LITHOPHRAGMA tenellum Nutt.	CaR, n SN, MP, SnGb, SnBr	0602481404
LITHOSPERMUM arvense L.	SnFrB, MP(?)	0000000800
LITHOSPERMUM californicum A. Gray	KR, NCoRH, NCoRI, CaRH, n SNH, Wrn(?)	0419400000
LITHOSPERMUM incisum Lehm.	DMtns (Keystone Canyon, New York Mtns, San Bernardino Co.)	4000000000
LITHOSPERMUM ruderale Lehm.	CaRH, n SNH, MP	0402400004
LOBELIA cardinalis L. var. pseudosplendens McVaugh	SnGb, SnBr, PR, DMtns (Panamint Mtns)	4040005400
LOBELIA dunnii E. Greene var. serrata (A. Gray) McVaugh	SCoRO, TR, SnJt	0000025401
LOBULARIA maritima (L.) Desv.	NCo, CCo, SnFrB, SCo	0184000800
LOEFLINGIA squarrosa Nutt.	Teh, SnJV, SnFrB, SCo, PR, GB, DMoj	60c204e806
LOEFLINGIA squarrosa Nutt. var. artemisiarum (Barneby & Twisselm.) R. Dorn	GB, DMoj (se Kern, ne Los Angeles cos.)	6002040006
LOEFLINGIA squarrosa Nutt. var. squarrosa	Teh, SnJV, SnFrB (Santa Cruz Co.), SCo, PR	00c000e800
LOESELIASTRUM matthewsii (A. Gray) S. Timbrook	SNE, DMoj, w DSon (e San Diego Co.)	e000040002
LOESELIASTRUM schottii (Torrey) S. Timbrook	sw SnJV, SNE, D	e000042002
LOLIUM multiflorum Lam.	CA-FP	1ffdfbff01
LOLIUM perenne L.	CA-FP	1ffdfbff01
LOLIUM temulentum L.	CA-FP, MP	1ffffbff05
LOMATIUM bicolor (S. Watson) J. Coulter & Rose var. leptocarpum (Torrey & A. Gray) M. Schlessman	CaRH, MP	0402000004
LOMATIUM californicum (Torrey & A. Gray) Mathias & Constance	KR, NCoR, s SNH, Teh, SCoR, WTR, SnFrB	0039038901
LOMATIUM canbyi (J. Coulter & Rose) J. Coulter & Rose	CaRH, MP	0402000004
LOMATIUM caruifolium (Hook. & Arn.) J. Coulter & Rose	NCoR (Mendocino Co), CaRF, c&s SNF, ScV, SnFrB, SCoR, ChI	1a38330a00
LOMATIUM caruifolium (Hook. & Arn.) J. Coulter & Rose var. caruifolium	NCoR (Mendocino Co), c&s SNF, SnFrB, SCoR, ChI	1838330800
LOMATIUM caruifolium (Hook. & Arn.) J. Coulter & Rose var. denticulatum Jepson	NCoRH, CaRF, ScV	0208000200
LOMATIUM ciliolatum Jepson	NCoRH, NCoRI, se SnFrB (Mount Hamilton), SCoRI	0018010800
LOMATIUM ciliolatum Jepson var. ciliolatum	NCoRH, se SnFrB (Mount Hamilton), SCoRI	0008010800
LOMATIUM ciliolatum Jepson var. hooveri Mathias & Constance	s NCoRI	0010000000
LOMATIUM congdonii J. Coulter & Rose	c SNF (Tuolumne, Mariposa cos.)	0000100000
LOMATIUM dasycarpum (Torrey & A. Gray) J. Coulter & Rose	NCoR, CaRF, SNF, GV, SnFrB, SCoR, PR	02783b6a00
LOMATIUM dasycarpum (Torrey & A. Gray) J. Coulter & Rose ssp. dasycarpum	NCoR, SnFrB, SCoR, PR	0078034800
LOMATIUM dasycarpum (Torrey & A. Gray) J. Coulter & Rose ssp. tomentosum (Benth.) Theob.	CaRF, SNF, GV	0200382200
LOMATIUM dissectum (Torrey & A. Gray) Mathias & Constance		NCo, KR, CaRH, c SNF, SNH, Teh, SCo, SnGb, SnBr, GB	0483d49506
LOMATIUM dissectum (Torrey & A. Gray) Mathias & Constance var. dissectum	NCo, KR, c SNF	0005100000
LOMATIUM dissectum (Torrey & A. Gray) Mathias & Constance var. multifidum (Torrey & A. Gray) Mathias & Constance	KR, CaRH, SNH, Teh, SCo, SnGb, SnBr, GB	0483c49506
LOMATIUM engelmannii Mathias	KR (Siskiyou, Trinity cos.)	0001000000
LOMATIUM foeniculaceum (Nutt.) J. Coulter & Rose	SNE, DMtns (Last Chance Mtns)	4000040002
LOMATIUM foeniculaceum (Nutt.) J. Coulter & Rose ssp. fimbriatum Theob.	SNE, DMtns (Last Chance Mtns)	4000040002
LOMATIUM foeniculaceum (Nutt.) J. Coulter & Rose ssp. inyoense (Mathias & Constance) Theob.	W&I (Inyo Mtns)	0000000002
LOMATIUM grayi (J. Coulter & Rose) J. Coulter & Rose	MP (Modoc Co.)	0002000004
LOMATIUM hallii (S. Watson) J. Coulter & Rose	nw KR (Del Norte Co.)	0001000000
LOMATIUM hendersonii (J. Coulter & Rose) J. Coulter & Rose	MP (Modoc Co.)	0002000004
LOMATIUM howellii (S. Watson) Jepson	KR (Del Norte, Siskiyou cos.)	0001000000
LOMATIUM insulare (Eastw.) Munz	s ChI (San Nicolas Island)	1000000000
LOMATIUM lucidum (Torrey & A. Gray) Jepson	SCo, SnGb, SnBr, SnJt	0080005400
LOMATIUM macrocarpum (Torrey & A. Gray) J. Coulter & Rose	NCo, KR, CaR, SNF, Teh, SnFrB, SCo	0685388800
LOMATIUM marginatum (Benth.) J. Coulter & Rose	KR, NCoR, CaR, ScV, n&c SNF	0639180200
LOMATIUM marginatum (Benth.) J. Coulter & Rose var. marginatum	KR, CaR, ScV, n&c SNF	0601180200
LOMATIUM marginatum (Benth.) J. Coulter & Rose var. purpureum (Jepson) Jepson	NCoR	0038000000
LOMATIUM martindalei (J. Coulter & Rose) J. Coulter & Rose	KR (Del Norte, Siskiyou cos.)	0001000000
LOMATIUM mohavense (J. Coulter & Rose) J. Coulter & Rose	SCoR, WTR, D	e000030001
LOMATIUM nevadense (S. Watson) J. Coulter & Rose	CaRH, SNH, SnGb, SnBr, GB, DMtns	4402c41506
LOMATIUM nevadense (S. Watson) J. Coulter & Rose var. nevadense	CaRH, n&c SNH, GB, DMtns	4402c40006
LOMATIUM nevadense (S. Watson) J. Coulter & Rose var. parishii (J. Coulter & Rose) Jepson	c&s SNH, SnGb, SnBr, GB, DMtns	4002841506
LOMATIUM nudicaule (Pursh) J. Coulter & Rose	KR, NCoR, CaRH, n SNF, SnFrB, MP	043b080804
LOMATIUM observatorium Constance & Ertter	SnFrB (Santa Clara and Stanislaus cos.)	0000000800
LOMATIUM parryi (S. Watson) J.F. Macbr.	DMtns	4000000000
LOMATIUM parvifolium (Hook. & Arn.) Jepson	CCo, SCoR	0100030000
LOMATIUM peckianum Mathias & Constance	KR (Siskiyou Co.)	0001000000
LOMATIUM piperi J. Coulter & Rose	KR, n SNH, MP	0003400004
LOMATIUM plummerae J. Coulter & Rose	CaRH, n SNH, GB	0402440006
LOMATIUM ravenii Mathias & Constance	MP (e Lassen Co.)	0002000004
LOMATIUM repostum (Jepson) Mathias	s NCoR	0038000000
LOMATIUM rigidum (M.E. Jones) Jepson	SNE (Big Pine, Bishop creeks, Inyo Co.)	0000040002
LOMATIUM shevockii R.L. Hartman & Constance	s SNH (Kern Co.)	0000000100
LOMATIUM stebbinsii M. Schlessman & Constance	Near border of n&c SNH (Calaveras, Tuolumne cos.)	0000c00000
LOMATIUM torreyi (J. Coulter & Rose) J. Coulter & Rose	SNH	0000c00100
LOMATIUM tracyi Mathias & Constance	KR, n NCoR, CaRH	0439000000
LOMATIUM triternatum (Pursh) J. Coulter & Rose	KR, NCoR, GB	003b040006
LOMATIUM triternatum (Pursh) J. Coulter & Rose var. macrocarpum (J. Coulter & Rose) Mathias	KR, NCoR, GB	003b040006
LOMATIUM triternatum (Pursh) J. Coulter & Rose var. triternatum	KR, NCoR, Wrn	0039000004
LOMATIUM utriculatum (Torrey & A. Gray) J. Coulter & Rose	CA-FP, DMtns	5ffdfbff01
LOMATIUM vaginatum (M.E. Jones) J. Coulter & Rose	KR, NCoR (serpentine), MP	003b000004
LONICERA cauriana Fern.	c&s SNH	0000800100
LONICERA ciliosa (Pursh) Poiret	NW, CaR	063d000000
LONICERA conjugialis Kellogg	NW, SN, MP	003ff88104
LONICERA etrusca Santi	NCo (Del Norte, Humboldt cos.)	0004000000
LONICERA hispidula Douglas var. vacillans A. Gray	NW, SN, CW, SW	19fdfbdd01
LONICERA interrupta Benth.	NW, w CaR, SN, CW, SW	1ffdfbdd01
LONICERA involucrata (Richardson) Banks	NCo, SN, CCo, MP	0106f88104
LONICERA involucrata (Richardson) Banks var. involucrata	SN, MP	0002f88104
LONICERA involucrata (Richardson) Banks var. ledebourii (Eschsch.) Jepson	NCo, CCo	0104000000
LONICERA japonica Thunb.	CA	ffffffff07
LONICERA subspicata Hook. & Arn.	n SNH (Butte Co.), Teh, CW, SW	19c043dc01
LONICERA subspicata Hook. & Arn. var. denudata Rehder	n SNH (Butte Co.), Teh, CW, SW	19c043dc01
LONICERA subspicata Hook. & Arn. var. subspicata	WTR (Santa Ynez Mtns, Santa Barbara Co.)	0000000001
LONICERA tatarica L.	w CaR	0600000000
LOTUS aboriginus Jepson	NCo, NCoRO	0024000000
LOTUS angustissimus L.	NCo (Sonoma Co.)	0004000000
LOTUS argophyllus (A. Gray) E. Greene	SN, SCoR, SCo, SnGb, SnBr, PR, ChI	18c0fbd500
LOTUS argophyllus (A. Gray) E. Greene var. adsurgens Dunkle	s ChI (San Clemente Island)	1000000000
LOTUS argophyllus (A. Gray) E. Greene var. argenteus Dunkle	ChI (exc Santa Cruz Island)	1800000000
LOTUS argophyllus (A. Gray) E. Greene var. argophyllus	c&s SN, SCoR, SCo, SnGb, SnBr, PR	00c0b35500
LOTUS argophyllus (A. Gray) E. Greene var. fremontii (A. Gray) Ottley	n SN	0000480000
LOTUS argophyllus (A. Gray) E. Greene var. niveus (E. Greene) Ottley	ChI (Santa Cruz Island)	1800000000
LOTUS argyraeus (E. Greene) E. Greene	SnBr, SnJt, DMtns	4000004400
LOTUS argyraeus (E. Greene) E. Greene var. argyraeus	SnBr, SnJt, DMtns	4000004400
LOTUS argyraeus (E. Greene) E. Greene var. multicaulis (Ottley) Isely	DMtns (New York Mtns)	4000000000
LOTUS argyraeus (E. Greene) E. Greene var. notitius Isely	DMtns (Providence Mtns)	4000000000
LOTUS benthamii E. Greene	CCo, SnFrB, SCoRO	0100020800
LOTUS corniculatus L.	CA (exc D)	1fffffff07
LOTUS crassifolius (Benth.) E. Greene	KR, NCoR, SN, SnFrB, SCoR, SCo, TR, PR (Riverside Co.)	00f9fb9d01
LOTUS crassifolius (Benth.) E. Greene var. crassifolius	KR, NCoR, SN, SCoR, SCo, TR, n PR (Riverside Co.), SnFrB	00f9fb9d01
LOTUS crassifolius (Benth.) E. Greene var. otayensis Isely	s PR (Otay Mtn, San Diego Co.)	0040000000
LOTUS dendroideus (E. Greene) E. Greene	ChI	1800000000
LOTUS dendroideus (E. Greene) E. Greene var. dendroideus	ChI (exc San Miguel, San Clemente islands)	1800000000
LOTUS dendroideus (E. Greene) E. Greene var. traskiae (Noddin) Isely	ChI (San Clemente Island)	1800000000
LOTUS dendroideus (E. Greene) E. Greene var. veatchii (E. Greene) Isely	ChI (San Miguel Island)	1800000000
LOTUS denticulatus (Drew) E. Greene	NCo, KR, NCoRO, CaRF, n SNF, ScV, e SnFrB, MP	0227080a04
LOTUS formosissimus E. Greene	NCo, NCoRO, n CCo, SnFrB, n SCoRO	0124020800
LOTUS grandiflorus (Benth.) E. Greene	NCo, NCoR, CaR, SN, CW, SW (exc ChI)	07fcfbdd01
LOTUS grandiflorus (Benth.) E. Greene var. grandiflorus	NCo, NCoR, s SN, CW, SW (exc ChI)	01fc235d01
LOTUS grandiflorus (Benth.) E. Greene var. macranthus (E. Greene) Isely	CaR, n&c SN	0600d80000
LOTUS hamatus E. Greene	s SCoR, SCo, s ChI, PR	10c0034000
LOTUS haydonii (Orc.) E. Greene	se PR, sw DSon (esp San Diego Co.)	8040000000
LOTUS heermannii (Durand & Hilg.) E. Greene	NCo, NCoRO, CCo, SCoRO, SCo, SnBr, PR, DSon	81e4024400
LOTUS heermannii (Durand & Hilg.) E. Greene var. heermannii	SCo, SnBr, PR, DSon	80c0004400
LOTUS heermannii (Durand & Hilg.) E. Greene var. orbicularis (A. Gray) Isely	NCo, NCoRO, CCo, SCoRO	0124020000
LOTUS humistratus E. Greene	CA (exc GB)	fffdfbff01
LOTUS incanus (Torrey) E. Greene	n&c SN	0000d80000
LOTUS junceus (Benth.) E. Greene	NCo, NCoRO, CCo, SCoRO	0124020000
LOTUS junceus (Benth.) E. Greene var. biolettii (E. Greene) Ottley	NCo, NCoRO, CCo, SCoRO	0124020000
LOTUS junceus (Benth.) E. Greene var. junceus	CCo, SCoRO	0100020000
LOTUS micranthus Benth.	NCo, NCoR, n&c SN, ScV, CCo, SCoR, SCo, n ChI, PR, SnFrB	09fcdb4a00
LOTUS nevadensis (S. Watson) E. Greene	KR, NCoR, CaR, SN, CCo, SCo, TR, ne PR, DMtns	47f9f8d501
LOTUS nevadensis (S. Watson) E. Greene var. davidsonii (E. Greene) Isely	TR, ne PR	0040005401
LOTUS nevadensis (S. Watson) E. Greene var. nevadensis	KR, NCoR, CaR, SN, CCo, SCo, w PR, DMtns	47f9f88100
LOTUS nuttallianus E. Greene	s SCo (w San Diego Co.)	0080000000
LOTUS oblongifolius (Benth.) E. Greene	CA-FP, DMoj	7ffdfbff01
LOTUS oblongifolius (Benth.) E. Greene var. cupreus (E. Greene) Ottley	s SNH (Tulare Co.)	0000000100
LOTUS oblongifolius (Benth.) E. Greene var. oblongifolius	CA-FP, DMoj	7ffdfbff01
LOTUS pinnatus Hook.	KR, NCoR, CaR, n SN, CCo	0739480000
LOTUS procumbens (E. Greene) E. Greene	s SN, ScV, SCoR, TR, PR, DMoj	6040235701
LOTUS procumbens (E. Greene) E. Greene var. jepsonii (Ottley) Ottley	s SN (Tulare, Kern cos.)	0000200100
LOTUS procumbens (E. Greene) E. Greene var. procumbens	ScV, SCoR, TR, PR, DMoj	6040035601
LOTUS purshianus (Benth.) Clements & E.G. Clements var. purshianus	CA (exc DSon)	7fffffff07
LOTUS rigidus (Benth.) E. Greene	PR, D	e040004000
LOTUS rubriflorus Sharsm.	NCoRI (Colusa Co.), SnFrB (Stanislaus Co.)	0010000800
LOTUS salsuginosus E. Greene	CW, SCo, TR, PR, D	e1c0035c01
LOTUS salsuginosus E. Greene var. brevivexillus Ottley	D	e000000000
LOTUS salsuginosus E. Greene var. salsuginosus	CW, SCo, TR, PR, DSon	81c0035c01
LOTUS scoparius (Nutt.) Ottley	NCo, NCoR, n SNF, CCo, SCo, TR, PR, DSon, SnFrB	81fc085c01
LOTUS scoparius (Nutt.) Ottley var. brevialatus Ottley	SCo, TR, PR, DSon	80c0005401
LOTUS scoparius (Nutt.) Ottley var. scoparius	Common. NCo, NCoR, n SNF, CCo, SCo, WTR, PR, SnFrB	01fc084801
LOTUS stipularis (Benth.) E. Greene	NW, CaR, n&c SN, CCo, SCoR	073ddb0000
LOTUS stipularis (Benth.) E. Greene var. ottleyi Isely	KR, CaR, n&c SN	0601d80000
LOTUS stipularis (Benth.) E. Greene var. stipularis	NCo, NCoR, CCo, SCoR	013c030000
LOTUS strigosus (Nutt.) E. Greene	GV, CW, SW, D	f9c0037e01
LOTUS uliginosus Schk.	NCo, NCoRO, SnFrB, probably elsewhere	0024000800
LOTUS wrangelianus Fischer & C. Meyer	CA-FP, probably naturalized in MP, DSon through agriculture	9ffffbff05
LOTUS yollabolliensis Munz	n NCoRH (Yolla Bolly Mtns, S. Fork Mtn, Trinity and Humboldt cos.)	0008000000
LUDWIGIA hexapetala (Hook. & Arn.) Zardini, Gu, & Raven	NCo, s NCoRO, CCo, SnFrB, SCo	01a4000800
LUDWIGIA palustris (L.) Elliott	w NW, n SN, c SNH, SnJV, CCo, SnFrB, SCo	01bdc82800
LUDWIGIA peploides (Kunth) Raven	NCo, NCoRO, SNF, GV, CCo, SnFrB, SCo, WTR, sw DMoj	61a4382a01
LUDWIGIA peploides (Kunth) Raven ssp. montevidensis (Spreng.) Raven	s NCo, n&c SNF, GV, SCo	0084182200
LUDWIGIA peploides (Kunth) Raven ssp. peploides	NCo, NCoRO, SNF, GV, CCo, SnFrB, SCo, WTR, sw DMoj	61a4382a01
LUDWIGIA repens Forster	SnBr, PR, sw DMoj	6040004400
LUETKEA pectinata (Pursh) Kuntze	KR, CaRH	0401000000
LUINA hypoleuca Benth.	KR, NCoR, sw SnFrB	0039000800
LUMA apiculata (DC.) Burret	CCo	0100000000
LUNARIA annua L.	SnFrB, SCo, expected elsewhere	0080000800
LUPINUS adsurgens E. Drew	NCoR, SnFrB (Santa Clara Co.), SN	0038f88900
LUPINUS affinis J. Agardh	NCoR, SnFrB	0038000800
LUPINUS albicaulis Hook	KR, SNH, WTR	0001c00101
LUPINUS albifrons Benth.	CA-FP	1ffdfbff01
LUPINUS albifrons Benth. var. abramsii (C.P. Smith) Hoover	SCoRO (Santa Lucia Mtns)	0000020000
LUPINUS albifrons Benth. var. albifrons	NCoR, SNF, CW, SCo	01b83b0800
LUPINUS albifrons Benth. var. collinus E. Greene	NW, SNF, CW	013d3b0800
LUPINUS albifrons Benth. var. douglasii (J. Agardh) C.P. Smith	CCo, nw SnFrB, n ChI	0900000800
LUPINUS andersonii S. Watson	NW, SNH, WTR, SnBr, SNE	003dc40503
LUPINUS angustiflorus Eastw.	CaRH, n&c SNH, GB	0402c40006
LUPINUS antoninus Eastw.	NCoRH (Anthony Peak, Mendocino Co.)	0008000000
LUPINUS apertus A.A. Heller	n SNH	0000400000
LUPINUS arboreus Sims	NCo, CCo (probably native Sonoma to Ventura cos., naturalized farther n)	0104000000
LUPINUS arbustus Lindley	SNH, SnGb, GB	0002c41106
LUPINUS argenteus Pursh	CaR, SNH, GB, DMtns	4602c40106
LUPINUS argenteus Pursh var. argenteus	CaR, n SNH, GB, DMtns	4602440006
LUPINUS argenteus Pursh var. heteranthus (S. Watson) Barneby	GB	0002040006
LUPINUS argenteus Pursh var. meionanthus (A. Gray) Barneby	n&c SNH, SNE	0000c40002
LUPINUS argenteus Pursh var. montigenus (A.A. Heller) Barneby	c SNH, SNE	0000840002
LUPINUS argenteus Pursh var. palmeri (S. Watson) Barneby	SNH, SNE	0000c40102
LUPINUS arizonicus (S. Watson) S. Watson	e DMoj, DSon	e000000000
LUPINUS benthamii A.A. Heller	SNF, Teh, deltaic GV, SCoRO	00003aa200
LUPINUS bicolor Lindley	CA-FP	1ffdfbff01
LUPINUS brevicaulis S. Watson	MP (Lassen Co.), W&I, e DMoj	6002000006
LUPINUS breweri A. Gray	CA-FP, SNE	1ffdffff03
LUPINUS breweri A. Gray var. breweri A. Gray	CA-FP	1ffdfbff01
LUPINUS breweri A. Gray var. bryoides C.P. Smith	s SNH, WTR, SNE	0000040103
LUPINUS breweri A. Gray var. grandiflorus C.P. Smith	SN, SnBr, SNE	0000fc8502
LUPINUS cervinus Kellogg	SCoRO (Santa Lucia Mtns)	0000020000
LUPINUS chamissonis Eschsch	s NCo, CCo, SCo	0184000000
LUPINUS citrinus Kellogg	c SNF	0000100000
LUPINUS citrinus Kellogg var. citrinus	c SNF (Fresno, Madera cos.)	0000100000
LUPINUS citrinus Kellogg var. deflexus (Congdon) Jepson	c SNF (Mariposa Co.)	0000100000
LUPINUS concinnus J. Agardh	c&s CW, SW, D	f9c0035c01
LUPINUS constancei T.W. Nelson & J.P. Nelson	n NCoRH (Lassics range, se Humboldt and nw Trinity cos.)	0008000000
LUPINUS covillei E. Greene	c&s SNH	0000800100
LUPINUS croceus Eastw.	KR, CaR	0601000000
LUPINUS dalesiae Eastw.	n SNH (Plumas Co.)	0000400000
LUPINUS duranii Eastw.	SNE (Mono Co.)	0000040002
LUPINUS elatus I.M. Johnston	s SNH, TR	0000001501
LUPINUS elmeri E. Greene	nw NCoRH (South Fork Mtn, Humboldt and Trinity cos.)	0008000000
LUPINUS excubitus M.E. Jones	s SNH, Teh, SW, SNE, D	f8c004d503
LUPINUS excubitus M.E. Jones var. austromontanus (A.A. Heller) C.P. Smith	Teh, SnGb, SnBr	0000009400
LUPINUS excubitus M.E. Jones var. excubitus	DMoj, adjacent s SNH, SNE	6000040102
LUPINUS excubitus M.E. Jones var. hallii (Abrams) C.P. Smith	SnGb, SnBr, PR	0040005400
LUPINUS excubitus M.E. Jones var. johnstonii C.P. Smith	SnGb, SnBr	0000001400
LUPINUS excubitus M.E. Jones var. medius (Jepson) Munz	sw DSon (se San Diego, sw Imperial cos.)	8000000000
LUPINUS flavoculatus A.A. Heller	W&I, e DMoj	6000000002
LUPINUS formosus E. Greene	CA-FP	1ffdfbff01
LUPINUS formosus E. Greene var. formosus	CA-FP	1ffdfbff01
LUPINUS formosus E. Greene var. robustus C.P. Smith	SNF, c SNH, GV, SCoRO, SW	18c0ba7601
LUPINUS fulcratus E. Greene	SN	0000f88100
LUPINUS gracilentus E. Greene	c SNH (Yosemite National Park)	0000800000
LUPINUS grayi S. Watson	SN	0000f88100
LUPINUS guadalupensis E. Greene	s ChI (San Clemente Island)	1000000000
LUPINUS hirsutissimus Benth	c&s CW, SW	19c0035c01
LUPINUS holmgrenanus C.P. Smith	ne DMtns (Last Chance, Grapevine mtns, Inyo Co.)	4000000000
LUPINUS hyacinthinus E. Greene	SnGb, SnBr, PR	0040005400
LUPINUS lapidicola A.A. Heller	e KR (Mount Eddy, Siskiyou Co.), NCoRO (King Range, sw Humboldt Co)	0021000000
LUPINUS latifolius J. Agardh	CA (exc GV, D)	1fffffdd07
LUPINUS latifolius J. Agardh var. barbatus (L. Henderson) Munz	MP	0002000004
LUPINUS latifolius J. Agardh var. columbianus (A.A. Heller) C.P. Smith	SNH	0000c00100
LUPINUS latifolius J. Agardh var. dudleyi C.P. Smith	SnFrB	0000000800
LUPINUS latifolius J. Agardh var. latifolius	NW, CW, SW	19fd035c01
LUPINUS latifolius J. Agardh var. parishii C.P. Smith	s SN, SW	18c0205501
LUPINUS latifolius J. Agardh var. viridifolius (A.A. Heller) C.P. Smith	KR, CaR, MP	0603000004
LUPINUS lepidus Douglas	NW, CaRH, SNH, WTR, SnBr, GB, DMtns	443fc40507
LUPINUS lepidus Douglas var. confertus (Kellogg) C.P. Smith	CaRH, SNH, WTR, SnBr, GB, DMtns	4402c40507
LUPINUS lepidus Douglas var. culbertsonii (E. Greene) C.P. Smith	s SNH (Kaweah River, Tulare and Fresno cos.)	0000000100
LUPINUS lepidus Douglas var. lobbii (S. Watson) C. Hitchc	c SNH, SNE	0000840002
LUPINUS lepidus Douglas var. ramosus Jepson	c&s SNH, SNE	0000840102
LUPINUS lepidus Douglas var. sellulus (Kellogg) Barneby	NW, CaRH, SN, GB	043ffc8106
LUPINUS lepidus Douglas var. utahensis (S. Watson) C. Hitchc	n W&I (White Mtns)	0000000002
LUPINUS leucophyllus Lindley	NW, CaRH, MP	043f000004
LUPINUS littoralis Douglas	n&c NCo	0004000000
LUPINUS longifolius (S. Watson) Abrams	SW	18c0005401
LUPINUS ludovicianus E. Greene	s SCoRO (San Luis Obispo Co.)	0000020000
LUPINUS luteolus Kellogg	NW, e SnFrB and n SCoRI (Diablo Range), w WTR	003d010801
LUPINUS magnificus M.E. Jones	SNE, n DMoj	2000040002
LUPINUS microcarpus Sims	CA-FP, MP, w DMoj	7ffffbff05
LUPINUS microcarpus Sims var. densiflorus (Benth.) Jepson	NW (exc Siskiyou Co.), SNF, ScV, CW, e SCo, TR	01bd3b1e01
LUPINUS microcarpus Sims var. horizontalis (A.A. Heller) Jepson	s SnJV, e DMoj	6000002000
LUPINUS microcarpus Sims var. microcarpus	CA-FP, MP, w DMoj	7ffffbff05
LUPINUS nanus Benth.	CA-FP (exc s SW)	1ffdfbff01
LUPINUS nevadensis A.A. Heller	GB, DMtns	4002040006
LUPINUS nipomensis Eastw.	s CCo (Nipomo Dunes, sw San Luis Obispo Co.)	0100000000
LUPINUS obtusilobus A.A. Heller	NW, CaR, n SNH	063d400000
LUPINUS odoratus A.A. Heller	GB, DMoj	6002040006
LUPINUS onustus S. Watson	KR, CaRH, n SNH	0401400000
LUPINUS pachylobus E. Greene	NCoRO, CaRF, SNF, SCoRO, SnFrB	02203a0800
LUPINUS padre-crowleyi C.P. Smith	s SNH, SNE (n Inyo, Tulare cos.)	0000040102
LUPINUS peirsonii H. Mason	SnGb	0000001000
LUPINUS polyphyllus Lindley	NW, CaR, SNH, CCo, SnFrB, SCoRO, SnGb, SnBr, SnJt, GB	073fc65d06
LUPINUS polyphyllus Lindley var. burkei (S. Watson) C. Hitchc.	SNH, SnGb, SnBr, SnJt, GB	0002c45506
LUPINUS polyphyllus Lindley var. pallidipes (A.A. Heller) C.P. Smith	KR, NCoRH, CaR	0609000000
LUPINUS polyphyllus Lindley var. polyphyllus	NW, CCo, SnFrB, SCoRO	013d020800
LUPINUS pratensis A.A. Heller	c&s SNH, SNE	0000840102
LUPINUS pratensis A.A. Heller var. eriostachyus C.P. Smith	SNE (Big Pine Creek, Inyo Co.)	0000040002
LUPINUS pratensis A.A. Heller var. pratensis	c&s SNH, SNE	0000840102
LUPINUS pusillus Pursh var. intermontanus (A.A. Heller)	GB (Modoc, Inyo cos.)	0002040006
LUPINUS rivularis Lindley	NCo	0004000000
LUPINUS saxosus Howell	MP	0002000004
LUPINUS sericatus Kellogg	s NCoRI (Napa, Lake, Sonoma cos.)	0010000000
LUPINUS shockleyi S. Watson	D	e000000000
LUPINUS sparsiflorus Benth.	s SCoR, SW, DMoj	78c0035401
LUPINUS spectabilis Hoover	c SNF (Mariposa, Tuolumne cos)	0000100000
LUPINUS stiversii Kellogg	SN, n SCoRO (Monterey Co.), SnGb, SnBr	0000fa9500
LUPINUS succulentus Koch	c&s NW, GV, CW, SW	19fd037e01
LUPINUS tidestromii E. Greene	s NCo (Sonoma Co.), n&c CCo (Marin, Monterey cos.)	0104000000
LUPINUS tracyi Eastw.	KR	0001000000
LUPINUS truncatus Hook. & Arn.	c&s CW, SW	19c0035c01
LUPINUS variicolor Steudel	NCo, n&c CCo	0104000000
LUZULA comosa E. Meyer	NW, CaRH, SN (exc Teh), CCo, SnFrB, ChI, SnGb, SnBr, SnJt, MP	1d3ff85d04
LUZULA divaricata S. Watson	CaRH, SNH	0400c00100
LUZULA orestera Sharsm.	SNH	0000c00100
LUZULA parviflora (Ehrh.) Desv.	NW (exc NCoRI), SN	002df88100
LUZULA piperi (Cov.) M.E. Jones	KR	0001000000
LUZULA spicata (L.) DC.	SNH, SNE (Wrn, Sweetwater Mtns)	0000c40102
LUZULA subcongesta (S. Watson) Jepson	KR, CaRH, SNH	0401c00100
LYCHNIS coronaria (L.) Desr.	NCoR, SnFrB, WTR	0038000801
LYCIUM andersonii A. Gray	s Teh, s SnJV, SCo, n WTR, PR, SNE, D	e0c004e003
LYCIUM barbarum L.	s SN, GV, SCo, MP, expected elsewhere	0082202304
LYCIUM brevipes Benth.	s ChI, w DSon	9000000000
LYCIUM brevipes Benth. var. brevipes	s ChI (San Clemente Island), w DSon	9000000000
LYCIUM brevipes Benth. var. hassei (E. Greene) C. Hitchc.	s ChI (Santa Catalina, San Clemente islands)	1000000000
LYCIUM californicum Nutt.	s SCo, ChI	1880000000
LYCIUM cooperi A. Gray	SNH (e slope), s SnJV, SNE, DMoj (incl w margins)	6000c42102
LYCIUM fremontii A. Gray	PR (e slope), s DSon	8040000000
LYCIUM pallidum Miers var. oligospermum C. Hitchc.	DMoj, n DSon	e000000000
LYCIUM parishii A. Gray	e SCo, w DSon	8080000000
LYCIUM torreyi A. Gray	s DMoj, DSon	e000000000
LYCIUM verrucosum Eastw.	s ChI (San Nicolas Island)	1000000000
LYCOPERSICON esculentum L.	GV, SnFrB, SCo	0080002a00
LYCOPERSICON peruvianum (L.) Miller	s SCo	0080000000
LYCOPODIELLA inundata (L.) Holub	NCo, n SNH (Nevada Co.)	0004400000
LYCOPODIUM clavatum L.	NCo	0004000000
LYCOPUS americanus W.C. Barton	CA-FP, SNE	1ffdffff03
LYCOPUS asper E. Greene	Deltaic GV, SnFrB, GB	0002042a06
LYCOPUS uniflorus Michaux	NCo, n&c SNH (Tuolumne, Plumas cos.)	0004c00000
LYCURUS phleoides Kunth var. phleoides	e DMtns (New York Mtns)	4000000000
LYONOTHAMNUS floribundus A. Gray	ChI	1800000000
LYONOTHAMNUS floribundus A. Gray ssp. aspleniifolius (E. Greene) Raven	ChI (Santa Cruz, Santa Rosa, San Clemente islands)	1800000000
LYONOTHAMNUS floribundus A. Gray ssp. floribundus	s ChI (Santa Catalina Island)	1000000000
LYROCARPA coulteri Hook. & Harvey var. palmeri (S. Watson) Rollins	DSon	8000000000
LYSICHITON americanum Hult<#e9>n & St. John	NCo, SnFrB	0004000800
LYSIMACHIA nummularia L.	n SNH (near Quincy, Plumas Co.)	0000400000
LYSIMACHIA thyrsiflora L.	KR, CaR, c SNF (Calaveras Co.), n SNH (Plumas Co.)	0601500000
LYTHRUM californicum Torrey & A. Gray	s NCoRI, SNF, s SNH, GV, CW, SW, W&I, D	f9d03b7f03
LYTHRUM hyssopifolia L.	CA-FP	1ffdfbff01
LYTHRUM portula (L.) D. Webb	n SNH	0000400000
LYTHRUM salicaria L.	s NCo, NCoRO, n SNF, ScV, SnFrB, nw MP	0026080a04
LYTHRUM tribracteatum Sprengel	GV, SnFrB, n MP	0002002a04
MACHAERANTHERA arida B. Turner & D. Horne	D	e000000000
MACHAERANTHERA asteroides (Torrey) E. Greene	PR, DSon	8040004000
MACHAERANTHERA asteroides (Torrey) E. Greene var. asteroides	e DSon (near Colorado River)	8000000000
MACHAERANTHERA asteroides (Torrey) E. Greene var. lagunensis (Keck) B. Turner	PR (Laguna Mtns, San Diego Co.)	0040000000
MACHAERANTHERA canescens (Pursh) A. Gray	KR, CaR, SN, TR, PR, GB, DMtns	4643fcd507
MACHAERANTHERA canescens (Pursh) A. Gray var. canescens	CaR, SN, TR, SNE	0600fc9503
MACHAERANTHERA canescens (Pursh) A. Gray var. incana (Lindley) A. Gray	KR	0001000000
MACHAERANTHERA canescens (Pursh) A. Gray var. leucanthemifolia (E. Greene) Welsh	e PR, W&I, DMtns	4040000002
MACHAERANTHERA canescens (Pursh) A. Gray var. shastensis (A. Gray) B. Turner	KR, CaR, n SN, MP, W&I	0603480006
MACHAERANTHERA canescens (Pursh) A. Gray var. ziegleri (Munz) B. Turner	PR (Santa Rosa Mtns)	0040000000
MACHAERANTHERA carnosa (A. Gray) G. Nesom	SnJV, SNE, DMoj	6000042002
MACHAERANTHERA gracilis (Nutt.) Shinn.	D	e000000000
MACHAERANTHERA juncea (E. Greene) Shinn.	PR	0040004000
MACHAERANTHERA pinnatifida (Hook.) Shinn. var. gooddingii (Nelson) B. Turner & R. Hartman	D	e000000000
MACHAERANTHERA tanacetifolia (Kunth) Nees	e DMtns (New York Mtns.)	4000000000
MACLURA pomifera (Raf.) C. Schneider	SnJV, WTR	0000002001
MADIA anomala E. Greene	NCoR, s ScV, SnFrB	0038000a00
MADIA bolanderi (A. Gray) A. Gray	KR, NCoRH, CaRH, SNH	0409c00100
MADIA citrigracilis Keck	e CaRH, n SNH (n Plumas Co.), MP	0402400004
MADIA citriodora E. Greene	KR, NCoRI, n SNF, MP	0013080004
MADIA doris-nilesiae T.W. Nelson & J.P. Nelson	s KR (Trinity Co.)	0001000000
MADIA elegans Lindley	CA-FP, GB	1fffffff07
MADIA elegans Lindley ssp. densifolia (E. Greene) Keck	CA-FP, GB	1fffffff07
MADIA elegans Lindley ssp. elegans	CA-FP (exc GV), SNE (uncommon)	1ffdffdd03
MADIA elegans Lindley ssp. vernalis Keck	CA-FP	1ffdfbff01
MADIA elegans Lindley ssp. wheeleri (A. Gray) Keck	s SN, WTR, SnBr, SnJt	0000204501
MADIA exigua (Smith) A. Gray	CA-FP	1ffdfbff01
MADIA glomerata Hook.	CaR, c&n SNH, SnBr, GB	0602c40406
MADIA gracilis (Smith) Keck	CA-FP, MP	1ffffbff05
MADIA hallii Keck	s NCoRI	0010000000
MADIA madioides (Nutt.) E. Greene	NW, n SNH, SnFrB, SCoRO	003d420800
MADIA minima (A. Gray) Keck	KR, NCoR, CaR, SN, se SnFrB, n WTR, SnBr, PR, MP, w DMoj	667bf8cd05
MADIA nutans (E. Greene) Keck	s NCoR, n SnFrB	0038000800
MADIA radiata Kellogg	w SnJV, e SnFrB, SCoRI	0000012800
MADIA rammii E. Greene	n SN	0000480000
MADIA sativa Molina	NW, CW, SW	19fd035c01
MADIA stebbinsii T.W. Nelson & J.P. Nelson	NCoRI (Trinity & Tehama cos.)	0010000000
MADIA subspicata Keck	n&c SNF	0000180000
MADIA yosemitana A. Gray	SN (exc Teh)	0000f80100
MAIANTHEMUM dilatatum (Alph. Wood) Nelson & J.F. Macbr.	w NW	003d000000
MALACOTHAMNUS abbottii (Eastw.) Kearney	SCoR (Salinas River, Sargent Creek, Hesperia, all s Monterey Co.)	0000030000
MALACOTHAMNUS aboriginum (Robinson) E. Greene	SCoRI (s San Benito, e Monterey, w Fresno cos.), PR (Laguna Mtns, San Diego Co.)	0040010000
MALACOTHAMNUS clementinus (Munz & I.M. Johnston) Kearney	s ChI (San Clemente Island)	1000000000
MALACOTHAMNUS davidsonii (Robinson) E. Greene	c SCoRO (s Monterey, nw San Luis Obispo cos.), SCo (e San Fernando Valley, Los Angeles Co.)	0080020000
MALACOTHAMNUS densiflorus (S. Watson) E. Greene	PR	0040004000
MALACOTHAMNUS fasciculatus (Torrey & A. Gray) E. Greene	NCoRI (Mendocino Co.), interior SnFrB, SCoRO, SW, sw edge DMoj	38d0025c01
MALACOTHAMNUS fremontii A. Gray	NCoRH, NCoRI, SNF, Teh, e SnFrB, TR, SnJt, SNE, DMtns (Panamint Mtns)	40183cdc03
MALACOTHAMNUS jonesii (Munz) Kearney	SCoRO (Monterey, San Luis Obispo cos.)	0000020000
MALACOTHAMNUS marrubioides (Durand & Hilg.) E. Greene	c SNF?, WTR, SnGb	0000101001
MALACOTHAMNUS palmeri (S. Watson) E. Greene	s CCo, SCoRO (Monterey, San Luis Obispo cos)	0100020000
MALACOTHRIX californica DC.	SnJV, CW, SW, DMoj	79c0037c01
MALACOTHRIX clevelandii A. Gray	NW, SNF, SnJV, CW, n ChI (Santa Rosa Island)	093d3b2800
MALACOTHRIX coulteri A. Gray	SnJV, CW, (formerly n ChI), WTR, PR, SNE, DMoj	6140076803
MALACOTHRIX floccifera (DC.) S.F. Blake	NW, CaR, n&c SNH, ScV, CW, WTR	073dc30a01
MALACOTHRIX foliosa A. Gray	n ChI (Anacapa Island), s ChI	1800000000
MALACOTHRIX glabrata A. Gray	SnJV, SNE, D	e000042002
MALACOTHRIX incana (Nutt.) Torrey & A. Gray	CCo, SCo, n ChI, s ChI (San Nicolas Island)	1980000000
MALACOTHRIX indecora E. Greene	n ChI (1 extant population on Santa Cruz Island)	0800000000
MALACOTHRIX phaeocarpa W. Davis	SnFrB, SCoR, WTR	0000030801
MALACOTHRIX saxatilis (Nutt.) Torrey & A. Gray	SCoR, SCo, ChI, WTR	1880030001
MALACOTHRIX saxatilis (Nutt.) Torrey & A. Gray var. arachnoidea (McGregor) E. Williams	c SCoRO (Carmel Valley, Monterey Co.)	0000020000
MALACOTHRIX saxatilis (Nutt.) Torrey & A. Gray var. commutata Ferris	SCoR	0000030000
MALACOTHRIX saxatilis (Nutt.) Torrey & A. Gray var. implicata (Eastw.) H.M. Hall	n ChI, s ChI (San Nicolas Island)	1800000000
MALACOTHRIX saxatilis (Nutt.) Torrey & A. Gray var. saxatilis	n SCo, sw WTR (Santa Barbara Co.)	0080000001
MALACOTHRIX saxatilis (Nutt.) Torrey & A. Gray var. tenuifolia (Nutt.) A. Gray	SCo, s ChI (Santa Catalina Island; introduced on San Clemente and San Nicolas islands), TR	1080001401
MALACOTHRIX sonchoides (Nutt.) Torrey & A. Gray	SNE, DMoj	6000040002
MALACOTHRIX squalida E. Greene	n ChI (Anacapa, Santa Cruz islands)	0800000000
MALACOTHRIX stebbinsii W. Davis & Raven	SNE, D	e000040002
MALACOTHRIX torreyi A. Gray	GB	0002040006
MALAXIS monophyllos (L.) Sw. ssp. brachypoda (A. Gray) A. L<#f6>ve & D. L<#f6>ve	SnBr, SnJt (where presumed extinct)	0000004400
MALCOLMIA africana R.Br.	SNE	0000040002
MALEPHORA crocea (Jacq.) Schwantes	CCo, SCo, s ChI	1180000000
MALOSMA laurina (Nutt.) Abrams	SW	18c0005401
MALPERIA tenuis S. Watson	DSon	8000000000
MALUS fusca (Raf.) C. Schneider	NCo, NCoRO, CaRF, n CCo	0324000000
MALUS sylvestris Miller	n CA	ffffffff07
MALVA neglecta Wallr.	n&c CA	ffffffff07
MALVA nicaeensis All.	CA-FP	1ffdfbff01
MALVA parviflora L.	CA-FP, D	fffdfbff01
MALVA sylvestris L.	NW, CW, SCo	01bd030800
MALVELLA leprosa (Ortega) Krapov.	CA (esp GV)	ffffffff07
MAMMILLARIA dioica M.K. Brandegee	SCo, w edge DSon	8080000000
MAMMILLARIA milleri (Britton & Rose) Boed.	ne DSon (se San Bernardino Co.)	8000000000
MAMMILLARIA tetrancistra Engelm.	D	e000000000
MARAH fabaceus (Naudin) E. Greene	CA-FP (exc n NW, n CaR)	1ffdfbff01
MARAH horridus (Congdon) Dunn	c&s SNF, Teh	0000308000
MARAH macrocarpus (E. Greene) E. Greene	SW, DSon	98c0005401
MARAH macrocarpus (E. Greene) E. Greene var. macrocarpus	SW mainland, DSon	98c0005401
MARAH macrocarpus (E. Greene) E. Greene var. major (Dunn) K.M. Stocking	ChI	1800000000
MARAH oreganus (Torrey & A. Gray) Howell	NW, SnFrB	003d000800
MARAH watsonii (Cogn.) E. Greene	NCoRI, CaRF, n SNF, ScV	0210080200
MARINA orcuttii (S. Watson) Barneby var. orcuttii	e PR (Santa Rosa Mtns)	0040000000
MARINA parryi (Torrey & A. Gray) Barneby	D	e000000000
MARRUBIUM vulgare L.	CA-FP, DMtns (uncommon)	5ffdfbff01
MARSILEA oligospora Goodd.	KR, n SNH, MP	0003400004
MARSILEA vestita Hook. & Grev. ssp. vestita	KR, NCoRI, CaR, s SNF, SNH, GV, CCo, SnFrB, SCoRO, SCo, WTR, SnBr, PR, MP, DSon	87d3e26f05
MATELEA parvifolia (Torrey) Woodson	D	e000000000
MATRICARIA globifera (Thunb.) Fenzl in Harv. & Sond.	SCo (Riverside Co.)	0080000000
MATTHIOLA incana (L.) R.Br.	s NCo, CCo, SCo	0184000000
MAURANDYA antirrhiniflora Willd. ssp. antirrhiniflora	e DMtns (Providence Mtns, e San Bernardino Co.)	4000000000
MAURANDYA petrophila Cov. & C. Morton	n DMoj (Titus, Fall canyons, Death Valley region, Inyo Co.)	2000000000
MECONELLA californica Torrey	CaRF, SNF, n CCo, SnFrB	0300380800
MECONELLA denticulata E. Greene	w CW, w SW	19c0035c01
MECONELLA linearis (Benth.) Nelson & J.F. Macbr.	w NW, s SNF, CW, w SW	19fd235c01
MEDICAGO arabica (L.) Hudson	NCo, NCoR, n SN, CW, probably elsewhere	013c4b0800
MEDICAGO lupulina L.	CA-FP, GB	1fffffff07
MEDICAGO minima (L.) Bartal.	CA-FP	1ffdfbff01
MEDICAGO orbicularis (L.) Bartal.	CA-FP	1ffdfbff01
MEDICAGO polymorpha L.	CA-FP	1ffdfbff01
MEDICAGO praecox DC.	SN, SnFrB, SCo, perhaps elsewhere	0080f88900
MEDICAGO sativa L.	CA (exc D)	1fffffff07
MELIA azedarach L.	SnJV, SCo	0080002000
MELICA aristata Bolander	KR, NCoR, CaR, SN, SCoR, SnBr	0639fb8500
MELICA bulbosa Geyer	CA-FP (exc GV, SW)	073dfb8900
MELICA californica Scribner	NW, SNF, Teh, CW, WTR	013d3b8801
MELICA frutescens Scribner	s SCoRI, TR, PR, D	e040015401
MELICA fugax Bolander	KR, NCoR, CaR, n&c SN, MP	063bd80004
MELICA geyeri Bolander	NW, CaR, n&c SN, n SCoRO	063dda0000
MELICA harfordii Bolander	NW, CaRF, n&c SN, SnFrB, n SCoRO	023dda0800
MELICA imperfecta Trin.	c&s SN, SnFrB, SCoR, SW, w DMoj	78c0b35d01
MELICA spectabilis Scribner	KR, n NCoR	0039000000
MELICA stricta Bolander	KR, NCoRO, SN, Teh, TR, n SNE, W&I, DMtns	4021fc9501
MELICA subulata (Gris.) Scribner	NW, CaR, n&c SN, SnFrB (Santa Cruz Mtns), n SCoRO, MP	063fda0804
MELICA torreyana Scribner	NW, SN, CW	013dfb8900
MELILOTUS alba Medikus	CA	ffffffff07
MELILOTUS indica (L.) All.	CA, most common s	ffffffff07
MELILOTUS officinalis (L.) Pall.	CA	ffffffff07
MELISSA officinalis L.	NW, CaRF, n SNF, CW	033d0b0800
MENODORA scabra A. Gray	e DMtns (Clark, Eagle, New York mtns)	4000000000
MENODORA scoparia A. Gray	e&s DMoj, w DSon, e PR	e040000000
MENODORA spinescens A. Gray	SnBr (n slope), s SNE, DMtns	4000040402
MENTHA X-piperita L.	CA-FP, cult elsewhere	1ffdfbff01
MENTHA arvensis L.	CA-FP, GB	1fffffff07
MENTHA pulegium L.	NW, SnJV, CW, SCo	01bd032800
MENTHA spicata L. var. spicata	CA-FP, W&I, DMtns (uncommon), cult elsewhere	5ffdfbff03
MENTHA suaveolens Ehrh.	NW, SN, CW, SCo, SNE, expected elsewhere	01bdff8902
MENTZELIA affinis E. Greene	s SN, SnJV, se SnFrB (Mount Hamilton), SCoRI, TR, SnJt, D	e000217d01
MENTZELIA albicaulis Hook	Teh, SnGb, SnBr, GB, D	e002049406
MENTZELIA congesta Torrey & A. Gray	SNH (e slope), Teh, WTR, SnGb, PR, SNE, DMtns	4040c4d103
MENTZELIA crocea Kellogg	c&s SNF	0000300000
MENTZELIA desertorum (Davidson) H. J. Thompson & Joyce Roberts	D	e000000000
MENTZELIA dispersa S. Watson	CA-FP, GB	1fffffff07
MENTZELIA eremophila (Jepson) H.J. Thompson & Joyce Roberts	s DMoj	6000000000
MENTZELIA gracilenta Torrey & A. Gray	SCoR, WTR	0000030001
MENTZELIA hirsutissima S. Watson	DSon	8000000000
MENTZELIA involucrata S. Watson	D	e000000000
MENTZELIA inyoensis B. Prigge	n W&I (White Mtns.)	0000000002
MENTZELIA jonesii (Urb. & Gilg) H.J. Thompson & Joyce Roberts	W&I, D	e000000002
MENTZELIA laevicaulis (Hook.) Torrey & A. Gray	CA (exc GV, DSon)	7fffffdd07
MENTZELIA lindleyi Torrey & A. Gray	SnJV, e SnFrB, n SCoRI	0000012800
MENTZELIA micrantha (Hook. & Arn.) Torrey & A. Gray	NCoRO, SnFrB, SCoRO, s ChI, WTR, SnGb, PR	1060025801
MENTZELIA montana (Davidson) Davidson	CaR, SN, WTR, SnJt, n SNE, W&I, n DMtns	4600fcc101
MENTZELIA multiflora (Nutt.) A. Gray ssp. longiloba (Darl.) Felger	s DMoj, DSon	e000000000
MENTZELIA nitens E. Greene	n DMoj, SNE	2000040002
MENTZELIA obscura H.J. Thompson & Joyce Roberts	D	e000000000
MENTZELIA oreophila Darl.	W&I, DMtns	4000000002
MENTZELIA pectinata Kellogg	s SNF, Teh, SCoRI	0000218000
MENTZELIA polita Nelson	e DMtns (Clark Mtns)	4000000000
MENTZELIA pterosperma Eastw.	e DMtns (Clark Mtns)	4000000000
MENTZELIA reflexa Cov	W&I, DMoj	6000000002
MENTZELIA torreyi A. Gray	SNE	0000040002
MENTZELIA tricuspis A. Gray	e DSon, DMtns	c000000000
MENTZELIA tridentata (Davidson) H.J. Thompson & Joyce Roberts	c DMoj	6000000000
MENTZELIA veatchiana Kellogg	n SNH, Teh, SnJV, SCoRI, TR, PR, GB, D	e04245f407
MENYANTHES trifoliata L.	CaR, SN (exc Teh), reported from c NCo, SnFrB	0604f80900
MENZIESIA ferruginea Smith	NCo, KR	0005000000
MERCURIALIS annua L.	SnFrB	0000000800
MERTENSIA bella Piper	nw KR	0001000000
MERTENSIA ciliata (Torrey) G. Don	n SNH, MP, W&I	0002400006
MERTENSIA cusickii Piper	Wrn	0000000004
MERTENSIA longiflora E. Greene	MP	0002000004
MERTENSIA oblongifolia (Nutt.) G. Don	CaRH, n&c SNH, MP, n SNE (Sweetwater Mtns)	0402c40004
MERTENSIA oblongifolia (Nutt.) G. Don var. amoena (Nelson) L.O. Williams	Wrn	0000000004
MERTENSIA oblongifolia (Nutt.) G. Don var. nevadensis (Nelson) L.O. Williams	CaRH, n&c SNH, Wrn, n SNE (Sweetwater Mtns)	0400c40004
MERTENSIA oblongifolia (Nutt.) G. Don var. oblongifolia	MP (esp Wrn)	0002000004
MESEMBRYANTHEMUM crystallinum L.	NCo, CCo, SCo, ChI	1984000000
MESEMBRYANTHEMUM nodiflorum L.	SnFrB, SCo, ChI	1880000800
MICROPUS amphibolus A. Gray	s NCoR, SnFrB, s SCoRO (Santa Barbara Co.), rare in n SNF	00380a0800
MICROPUS californicus Fischer & C. Meyer	CA-FP	1ffdfbff01
MICROPUS californicus Fischer & C. Meyer var. californicus	CA-FP	1ffdfbff01
MICROPUS californicus Fischer & C. Meyer var. subvestitus A. Gray	c SNF (very uncommon), CW (exc SCoRI)	0100120800
MICROSERIS acuminata E. Greene	NCoR, n&c SNF, ScV, n SnJV, e SnFrB	0038182a00
MICROSERIS bigelovii (A. Gray) Schultz-Bip.	NCo, CCo	0104000000
MICROSERIS borealis (Bong.) Schultz-Bip.	NCoRO (Bald Mtn., Humboldt Co.)	0020000000
MICROSERIS campestris E. Greene	c&s SNF, SnJV, e CW	0100332800
MICROSERIS douglasii (DC.) Schultz-Bip.	NCoR, SNF, Teh, GV, CW, SCo, ChI	19b83baa00
MICROSERIS douglasii (DC.) Schultz-Bip. ssp. douglasii	NCoR, SNF, Teh, GV, CW, SCo	01b83baa00
MICROSERIS douglasii (DC.) Schultz-Bip. ssp. platycarpha (A. Gray) Chambers	c&s SCo, s ChI	1080000000
MICROSERIS douglasii (DC.) Schultz-Bip. ssp. tenella (A. Gray) Chambers	w-c GV, CW, SCo, n ChI	0980032a00
MICROSERIS elegans A. Gray	NCoR, SNF, GV, CW, SCo, ChI	19b83b2a00
MICROSERIS laciniata (Hook.) Schultz-Bip.	NW, CaRH, MP	043f000004
MICROSERIS laciniata (Hook.) Schultz-Bip. ssp. laciniata	NW, CaRH, MP	043f000004
MICROSERIS laciniata (Hook.) Schultz-Bip. ssp. leptosepala (Nutt.) Chambers	NW	003d000000
MICROSERIS laciniata (Hook.) Schultz-Bip. ssp. siskiyouensis Chambers	KR	0001000000
MICROSERIS nutans (Hook.) Schultz-Bip.	KR, NCoRH, CaRH, SNH, MP	040bc00104
MICROSERIS paludosa (E. Greene) J. Howell	CCo, SnFrB	0100000800
MICROSERIS sylvatica (Benth.) Schultz-Bip.	NCoRI, ScV, SNF, Teh, e SnFrB, SCoR	00103b8a00
MIMULUS alsinoides Benth.	KR	0001000000
MIMULUS androsaceus E. Greene	NCoRI, Teh, CW, WTR, SnBr, e PR (Santa Rosa Mtns, Riverside Co.), w edge DMoj	215003cc01
MIMULUS angustatus (A. Gray) A. Gray	c NCoRO (Longvale, Mendocino Co.), s NCoRI, s CaRF, n SNF, SnJV (Pinehurst, Fresno Co.)	0230082000
MIMULUS aurantiacus Curtis	CA-FP, nw edge DSon	9ffdfbff01
MIMULUS bicolor Benth.	se KR, s CaR, SN	0601f88100
MIMULUS bigelovii (A. Gray) A. Gray	s SNE, D	e000040002
MIMULUS bigelovii (A. Gray) A. Gray var. bigelovii	D	e000000000
MIMULUS bigelovii (A. Gray) A. Gray var. cuspidatus A.L. Grant	s SNE, n D	e000040002
MIMULUS bolanderi A. Gray	NCoR, SN (common in c SNF), CW, WTR	0138fb8901
MIMULUS breviflorus Piper	n SNH (El Dorado, Alpine, Amador cos.), MP	0002400004
MIMULUS brevipes Benth.	SW	18c0005401
MIMULUS breweri (E. Greene) Cov.	NW, CaR, SNH, SnBr, SnJt, MP	063fc04504
MIMULUS cardinalis Benth.	CA-FP, W&I	1ffdfbff03
MIMULUS clevelandii Brandegee	PR	0040004000
MIMULUS congdonii Robinson	SNF, uncommon in s NCoR, SnFrB, single localities in SCoRO (Monterey Co.), WTR (Ventura Co.), PR (San Diego Co.)	00783a0801
MIMULUS constrictus (A.L. Grant) Pennell	s SNF, Teh, n WTR	0000208001
MIMULUS cusickii (E. Greene) Rattan	s Wrn	0000000004
MIMULUS dentatus Benth.	n NCo (Del Norte, Humboldt cos.)	0004000000
MIMULUS douglasii (Benth.) A. Gray	NW, CaRF, SNF, CW	033d3b0800
MIMULUS exiguus A. Gray	SnBr	0000000400
MIMULUS filicaulis S. Watson	c SNH (Tuolumne, Mariposa cos.)	0000800000
MIMULUS floribundus Lindley	CA-FP (esp c&s SNF), W&I	1ffdfbff03
MIMULUS fremontii (Benth.) A. Gray	SCoR, SW, s DMoj	78c0035401
MIMULUS glaucescens E. Greene	s CaRF, adjacent n SNF	0200080000
MIMULUS gracilipes Robinson	c SNF (Mariposa, Fresno cos.)	0000100000
MIMULUS guttatus DC.	CA	ffffffff07
MIMULUS inconspicuus A. Gray	SNF (s of El Dorado Co.)	0000380000
MIMULUS jepsonii A.L. Grant	CaRH, n SNH, w MP	0402400004
MIMULUS johnstonii A.L. Grant	SnGb, SnBr	0000001400
MIMULUS kelloggii (E. Greene) A. Gray	NW, CaRF, n&c SNF	023d180000
MIMULUS laciniatus A. Gray	SNH	0000c00100
MIMULUS latidens (A. Gray) E. Greene	NCoRI, GV, CW, e SCo (Menifee Valley, w Riverside Co.)	0190032a00
MIMULUS latifolius A. Gray	n ChI (Santa Cruz Island)	0800000000
MIMULUS layneae (E. Greene) Jepson	NW, CaR, SN	063df88100
MIMULUS leptaleus A. Gray	SNH	0000c00100
MIMULUS lewisii Pursh	CaRH, SN	0400f88100
MIMULUS mephiticus E. Greene	SN, s MP, SNE	0002fc8106
MIMULUS mohavensis Lemmon	DMoj (near Barstow, San Bernardino Co.)	6000000000
MIMULUS montioides A. Gray	c&s SN (s of Madera Co.)	0000b00100
MIMULUS moschatus Lindley	CA-FP, n SNE	1ffdffff01
MIMULUS nanus Hook. & Arn.	NW, CaRH, GB	043f040006
MIMULUS norrisii Heckard & J.R. Shevock	s SNF (Kaweah River drainage, Tulare Co.)	0000200000
MIMULUS nudatus E. Greene	s NCoRI (Lake, Napa cos.)	0010000000
MIMULUS palmeri A. Gray	s SNF, Teh (and adjacent w DMoj), n SCoRO, TR, PR	204022d401
MIMULUS parishii E. Greene	s SN, SW (and adjacent w D), n&e DMtns (Granite, New York, Panamint mtns)	f8c0205501
MIMULUS parryi A. Gray	W&I (esp Inyo Mtns)	0000000002
MIMULUS pictus (E. Greene) A. Gray	s SNF, Teh	0000208000
MIMULUS pilosus (Benth.) S. Watson	Mostly CA-FP, SNE, DMtns	5ffdffff03
MIMULUS primuloides Benth.	NW, CaR, SN, SnBr, SnJt, GB	063ffcc506
MIMULUS primuloides Benth. ssp. linearifolius (A.L. Grant) Munz	KR	0001000000
MIMULUS primuloides Benth. ssp. primuloides	NW, CaR, SN, SnBr, SnJt, GB	063ffcc506
MIMULUS pulchellus (E. Greene) A.L. Grant	n&c SNF (Calaveras, Tuolumne, Mariposa cos.)	0000180000
MIMULUS pulsiferae A. Gray	NW, CaR, MP	063f000004
MIMULUS purpureus A.L. Grant	SnBr	0000000400
MIMULUS pygmaeus A.L. Grant	s CaRH, n SNH (Lake Almanor region, Plumas Co.), MP (Egg Lake, Modoc Co., w of Eagle Lake, Lassen Co.)	0402400004
MIMULUS rattanii A. Gray	NCoRI, CW	0110030800
MIMULUS ringens L.	ne SnJV (near La Grange, Stanislaus Co.)	0000002000
MIMULUS rubellus A. Gray	W&I, n SNE (Sweetwater Mtns), DMtns	4000040000
MIMULUS rupicola Cov. & A.L. Grant	n DMtns (Cottonwood, Funeral, Grapevine, Last Chance, n Panamint ranges)	4000000000
MIMULUS shevockii Heckard & Bacigal.	s SNF (Cortez, Cyrus canyons, Kern Co.), w edge DMoj (Kelso Creek)	2000200000
MIMULUS suksdorfii A. Gray	CaRH, SNH, WTR, SnBr, SnJt, n SNE (Sweetwater Mtns), n DMtns (Grapevine Mtns, Inyo Co.)	4400c44501
MIMULUS tilingii Regel	NW, CaRH, SNH, SnBr, SnJt, n SNE (Sweetwater Mtns), W&I	043dc44500
MIMULUS torreyi A. Gray	s CaRH, SN	0400f88100
MIMULUS traskiae A.L. Grant	s ChI (Avalon, Santa Catalina Island)	1000000000
MIMULUS tricolor Lindley	s NCoRO (s Sonoma Co.), NCoRI, e GV, sw MP	0032002204
MIMULUS viscidus Congdon	SNF (El Dorado Co. to n Tulare Co.)	0000380000
MIMULUS whitneyi A. Gray	s SNH	0000000100
MINUARTIA californica (A. Gray) Mattf.	NW, CaRF, SNF, c SNH, ScV, CW, TR	033dbb1e01
MINUARTIA decumbens T.W. Nelson & J.P. Nelson	n NCoRH (Mule Ridge, Trinity Co.)	0008000000
MINUARTIA douglasii (Torrey & A. Gray) Mattf.	NW, CaR, SNF, c SNH, GV, CW, SW, MP	1fffbb7e05
MINUARTIA howellii (S. Watson) Mattf.	KR	0001000000
MINUARTIA nuttallii (Pax) Briq.	NW, CaRH, SNH, GB	043fc40106
MINUARTIA nuttallii (Pax) Briq. ssp. fragilis (Maguire & A. Holmgren) McNeill	GB	0002040006
MINUARTIA nuttallii (Pax) Briq. ssp. gracilis (Robinson) McNeill	SNH, SNE	0000c40102
MINUARTIA nuttallii (Pax) Briq. ssp. gregaria (A.A. Heller) McNeill	NW, CaRH, Wrn	043d000004
MINUARTIA obtusiloba (Rydb.) House	c&s SNH	0000800100
MINUARTIA pusilla (S. Watson) Mattf.	KR, n SNH, SnFrB	0001400800
MINUARTIA rosei (Maguire & Barneby) McNeill	KR, NCoRH	0009000000
MINUARTIA rubella (Wahlenb.) Hiern	KR, c&s SNH	0001800100
MINUARTIA stolonifera T.W. Nelson & J.P. Nelson	s KR (Scott Mtn, Siskiyou Co.)	0001000000
MINUARTIA stricta (Sw.) Hiern	c&s SNH, W&I	0000800102
MIRABILIS alipes (S. Watson) Pilz	W&I, DMtns (Panamint Mtns)	4000000002
MIRABILIS bigelovii A. Gray	W&I, D	e000000002
MIRABILIS bigelovii A. Gray var. bigelovii	W&I, D, esp e D	e000000002
MIRABILIS bigelovii A. Gray var. retrorsa (A.A. Heller) Munz	W&I, D	e000000002
MIRABILIS californica A. Gray	CCo, SCoR, SW, w edge D	b9c0035401
MIRABILIS coccinea (Torrey) Benth. & Hook.	DMtns	4000000000
MIRABILIS greenei S. Watson	e KR, n&c NCoRI	0011000000
MIRABILIS jalapa L.	CA-FP (esp SnFrB)	1ffdfbff01
MIRABILIS linearis (Pursh) Heimerl	SCo (Orange, Riverside cos.)	0080000000
MIRABILIS multiflora (Torrey) A. Gray	s SnJV, W&I, D	e000002002
MIRABILIS multiflora (Torrey) A. Gray var. glandulosa (Standley) J.F. Macbr.	W&I, n DMoj (Inyo Co.)	2000000002
MIRABILIS multiflora (Torrey) A. Gray var. pubescens S. Watson	s SnJV, W&I, D	e000002002
MIRABILIS nyctaginea (Michaux) MacMillan	e SCo (esp San Bernardino Co.)	0080000000
MIRABILIS oblongifolia (A. Gray) Heimerl	DMtns (Ivanpah & New York mtns, ne San Bernardino Co.)	4000000000
MIRABILIS pumila (Standley) Standley	SnBr, SnJt, W&I, DMtns	4000004402
MIRABILIS tenuiloba S. Watson	w DSon (Imperial, Riverside, San Diego cos.)	8000000000
MISCANTHUS sinensis Andersson	n SNF (El Dorado Co.)	0000080000
MITELLA breweri A. Gray	KR, CaRH, SNH	0401c00100
MITELLA caulescens Nutt.	NCo, KR	0005000000
MITELLA diversifolia E. Greene	KR	0001000000
MITELLA ovalis E. Greene	NCo, NCoRO, n CCo	0124000000
MITELLA pentandra Hook.	KR, NCoRH, CaRH, SNH	0409c00100
MITELLA trifida Graham	KR, NCoRO	0021000000
MODIOLA caroliniana (L.) Don	CA-FP	1ffdfbff01
MOEHRINGIA macrophylla (Hook.) Fenzl	NW, n&s SNH, SnFrB, SCoRO, PR	007d424900
MOENCHIA erecta (L.) P. Gaertner, Meyer, & Scherb. ssp. erecta	n SNF (Butte Co.)	0000080000
MOHAVEA breviflora Cov.	n&e DMoj	6000000000
MOHAVEA confertiflora (Benth.) A.A. Heller	D (exc Inyo Co.)	e000000000
MOLLUGO cerviana (L.) Ser.	SnJt, D	e000004000
MOLLUGO verticillata L.	CA-FP (exc D)	1ffdfbff01
MOLUCCELLA laevis L.	NW, SNF, GV, CW, SCo	01bd3b2a00
MONANTHOCHLO<#cb> littoralis Engelm.	SCo, ChI
MONANTHOCHLOE littoralis Engelm.		1880000000
MONARDA pectinata Nutt.	e DMtns (New York Mtns)	4000000000
MONARDELLA antonina Hardham	c SCoR	0000030000
MONARDELLA antonina Hardham ssp. antonina	c SCoR (s Monterey Co.)	0000030000
MONARDELLA antonina Hardham ssp. benitensis (Hardham) Jokerst	c SCoRI (near New Idria, San Benito Co.)	0000010000
MONARDELLA australis Abrams	TR	0000001401
MONARDELLA beneolens J.R. Shevock, B. Ertter & Jokerst	s SNH	0000000100
MONARDELLA breweri A. Gray	SnFrB, SCoR, WTR	0000030801
MONARDELLA candicans Benth.	SNF	0000380000
MONARDELLA cinerea Abrams	s SCoRO?, e SnGb, SnJt?	0000025000
MONARDELLA crispa Elmer	s CCo (San Luis Obispo, Santa Barbara cos.)	0100000000
MONARDELLA douglasii Benth.	NCoRO, n&c SNF, ScV, SnFrB, SCoRI	0020190a00
MONARDELLA douglasii Benth. ssp. douglasii	NCoRO, SnFrB, SCoRI	0020010800
MONARDELLA douglasii Benth. ssp. venosa (Torrey) Jokerst	n&c SNF (Butte, Tuolumne cos.), ScV (Sutter Co.)	0000180200
MONARDELLA exilis E. Greene	s SnJV, DMoj	6000002000
MONARDELLA follettii (Jepson) Jokerst	n SNH (Plumas Co.)	0000400000
MONARDELLA frutescens (Hoover) Jokerst	s CCo (San Luis Obispo, Santa Barbara cos.)	0100000000
MONARDELLA glauca E. Greene	KR, NCoRH, CaRH, SNH, GB	040bc40106
MONARDELLA hypoleuca A. Gray	SCoRO, SCo, WTR, SnGb, PR	00c0025001
MONARDELLA hypoleuca A. Gray ssp. hypoleuca	SCoRO, SCo, WTR, SnGb, PR	00c0025001
MONARDELLA hypoleuca A. Gray ssp. lanata (Abrams) Munz	w PR (Orange, San Diego cos.)	0040000000
MONARDELLA lanceolata A. Gray	SN, CW, SW	19c0fbdd01
MONARDELLA leucocephala A. Gray	n SnJV (Stanislaus, Merced cos.)	0000002000
MONARDELLA linoides A. Gray	s SNH, Teh, s SCo, SnGb, SnBr, PR, SNE, DMtns	40c004d502
MONARDELLA linoides A. Gray ssp. linoides	s SNH, e SnBr, SnJt, SNE, DMtns	4000044502
MONARDELLA linoides A. Gray ssp. oblonga (E. Greene) Abrams	s SNH, Teh	0000008100
MONARDELLA linoides A. Gray ssp. stricta (Parish) Epling	SnGb, SnBr	0000001400
MONARDELLA linoides A. Gray ssp. viminea (E. Greene) Abrams	s SCo, sw PR (San Diego Co.)	00c0000000
MONARDELLA macrantha A. Gray	SCoR, TR, PR	0040035401
MONARDELLA macrantha A. Gray ssp. hallii Abrams	SnGb, SnBr, PR	0040005400
MONARDELLA macrantha A. Gray ssp. macrantha	SCoR, TR, PR	0040035401
MONARDELLA nana A. Gray	PR	0040004000
MONARDELLA nana A. Gray ssp. arida H.M. Hall	e PR (SnJt, Santa Rosa Mtns)	0040004000
MONARDELLA nana A. Gray ssp. leptosiphon (Torrey) Abrams	c PR (Palomar Mtns)	0040000000
MONARDELLA nana A. Gray ssp. nana	PR	0040004000
MONARDELLA nana A. Gray ssp. tenuiflora (S. Watson) Abrams	n PR (incl SnJt)	0040004000
MONARDELLA odoratissima Benth.	KR, NCoRH, CaRH, SNH, nw MP, W&I	040bc00106
MONARDELLA odoratissima Benth. ssp. odoratissima	nw MP (Lava Beds National Monument, Modoc Co.)	0002000004
MONARDELLA odoratissima Benth. ssp. pallida (A.A. Heller) Epling	KR, NCoRH, CaRH, SNH, W&I	0409c00102
MONARDELLA palmeri A. Gray	n SCoRO (Santa Lucia Mtns)	0000020000
MONARDELLA pringlei A. Gray	e SCo (near Colton)	0080000000
MONARDELLA purpurea Howell	KR, NCoRO, SnFrB, SCoRO	0021020800
MONARDELLA robisonii Epling	DMtns	4000000000
MONARDELLA sheltonii Torrey	KR, NCoRO, n&c SNH	0021c00000
MONARDELLA siskiyouensis Hardham	s KR	0001000000
MONARDELLA stebbinsii Hardham & J. Bartel	n SNH (Plumas Co.)	0000400000
MONARDELLA undulata Benth.	CCo, SnFrB	0100000800
MONARDELLA villosa Benth.	NCo, NCoR, SNF, CW	013c3b0800
MONARDELLA villosa Benth. ssp. franciscana (Elmer) Jokerst	NCo, CCo, SnFrB	0104000800
MONARDELLA villosa Benth. ssp. globosa (Jepson) Jokerst	NCoRO, SnFrB	0020000800
MONARDELLA villosa Benth. ssp. obispoensis (Hoover) Jokerst	SCoR	0000030000
MONARDELLA villosa Benth. ssp. villosa	NCo, NCoR, SNF, CW	013c3b0800
MONARDELLA viridis Jepson	s NCoRI, SnGb	0010001000
MONARDELLA viridis Jepson ssp. saxicola (Ewan) I.M. Johnston	SnGb	0000001000
MONARDELLA viridis Jepson ssp. viridis Jepson	s NCoRI	0010000000
MONESES uniflora (L.) A. Gray	n NCo, w KR, n NCoRO, CaRH, c SNH (Fresno Co.)	0425800000
MONOCHORIA vaginalis (Burm. f.) Kunth	ScV	0000000200
MONOLEPIS nuttalliana (Schultes) E. Greene	CA (exc NW)	ffc2ffff07
MONOLEPIS pusilla S. Watson	n SNH (e slope), MP, n SNE	0002440004
MONOLEPIS spathulata A. Gray	SNH, SnBr, SNE	0000c40502
MONOLOPIA gracilens A. Gray	SnFrB, SCoR	0000030800
MONOLOPIA lanceolata Nutt.	s SNF, Teh, c SCo, WTR, SnGb, nw PR, w edge DMoj	20c020d001
MONOLOPIA major DC.	NCoRI, sw ScV, n SnJV, SnFrB, n SCoR	0010032a00
MONOLOPIA stricta Crum	s SNF, Teh, w&s SnJV, SCoRI, n WTR	000021a001
MONOPTILON bellidiforme A. Gray	DMoj	6000000000
MONOPTILON bellioides (A. Gray) H.M. Hall	D	e000000000
MONOTROPA hypopitys L.	NCo, KR, NCoRO, NCoRH	002d000000
MONOTROPA uniflora L.	NCo, KR	0005000000
MONTIA chamissoi (Sprengel) E. Greene	KR, NCoRH, CaR, SNH, TR, PR, GB	064bc45507
MONTIA dichotoma (Nutt.) Howell	KR, CaR, MP	0603000004
MONTIA diffusa (Nutt.) E. Greene	NW, n SN, SnFrB	003d480800
MONTIA fontana L.	CA (exc D)	1fffffff07
MONTIA howellii S. Watson	NW	003d000000
MONTIA linearis (Hook.) E. Greene	KR, NCoR, CaR, n&c SN, SnFrB, TR, PR, MP	067bd85c05
MONTIA parvifolia (DC.) E. Greene	NW, CaR, SN, CCo, SnFrB	073df88900
MORTONIA utahensis (Trel.) Nelson	DMtns (Inyo, ne San Bernardino cos.)	4000000000
MORUS alba L.	s SNF, SnJV, WTR	0000202001
MUCRONEA californica Benth.	s CW, SW	19c0035c01
MUCRONEA perfoliata (A. Gray) A.A. Heller	s SNF, Teh, SnJV, SCoRI, n WTR, w DMoj	600021a001
MUEHLENBECKIA complexa Meissner	NCo, SnFrB	0004000800
MUEHLENBECKIA hastatula (Smith) I.M. Johnston	SnFrB, expected elsewhere	0000000800
MUHLENBERGIA andina (Nutt.) A. Hitchc.	KR, NCoRI, SN, SCoRI, SnBr, SNE, DMtns	4011fd8502
MUHLENBERGIA appressa C.O. Goodd.	s ChI (San Clemente Island), DMtns (Providence Mtns)	5000000000
MUHLENBERGIA arsenei A. Hitchc.	DMtns (Clark Mtns)	4000000000
MUHLENBERGIA asperifolia (Nees & Meyen) L. Parodi	CA	ffffffff07
MUHLENBERGIA californica Vasey	SCo, SnGb, SnBr, SnJt	0080005400
MUHLENBERGIA filiformis (Thurber) Rydb.	NW, SN, SnBr, SnJt, GB	003ffcc506
MUHLENBERGIA fragilis Swallen	e DMtns (Clark, New York mtns)	4000000000
MUHLENBERGIA jonesii (Vasey) A. Hitchc.	KR, CaRH, n SNH	0401400000
MUHLENBERGIA mexicana (L.) Trin.	KR, NCoRO, n SN	0021480000
MUHLENBERGIA microsperma (DC.) Trin.	CCo, SCoRO, SW, D	f9c0025401
MUHLENBERGIA minutissima (Steudel) Swallen	KR, n&c SNH, SnBr, SnJt, SNE	0001c44402
MUHLENBERGIA montana (Nutt.) A. Hitchc.	KR, SNH	0001c00100
MUHLENBERGIA pauciflora Buckley	e DMtns (New York Mtns)	4000000000
MUHLENBERGIA porteri Beal	SnBr, SnJt, SNE, DMoj	6000044402
MUHLENBERGIA richardsonis (Trin.) Rydb.	KR, CaRH, SNH, SCoRO, TR, SnJt, GB, DMtns	4403c65507
MUHLENBERGIA rigens (Benth.) A. Hitchc.	CaRH, SN, GV, SCoRO, SCo, TR, SnJt, SNE, DMoj	6480fef703
MUHLENBERGIA schreberi S. Gmelin	n&c SNF, ScV	0000180200
MUHLENBERGIA utilis (Torrey) A. Hitchc.	SCoRO, SCo, WTR	0080020001
MUILLA clevelandii (S. Watson) Hoover	s SCo (sw San Diego Co.)	0080000000
MUILLA coronata E. Greene	s SNH (e slope), SNE, n&w DMoj	6000040102
MUILLA maritima (Torrey) S. Watson	c&s NW, CW, SW, uncommon in c SNF, GV, w D	f9fd137e01
MUILLA transmontana E. Greene	GB	0002040006
MUNROA squarrosa (Nutt.) Torrey	DMtns (Clark Mtn.)	4000000000
MUSCARI botryoides (L.) Miller	CCo (expected elsewhere)	0100000000
MYOPORUM laetum Forster f.	SnFrB, CCo, SCo	0180000800
MYOSOTIS discolor Pers.	CA-FP (esp NCoR, SN)	1ffdfbff01
MYOSOTIS latifolia Poiret	Scattered in CA-FP	1ffdfbff01
MYOSOTIS laxa Lehm.	NW (Del Norte Co.), SN (El Dorado, Kern cos.)	003df88100
MYOSOTIS micrantha Lehm.	KR (1 locality in Siskiyou Co.)	0001000000
MYOSOTIS scorpioides L.	NW, SN (esp Plumas Co.)	003df88100
MYOSOTIS verna Nutt.	s KR	0001000000
MYOSURUS apetalus C. Gay	KR, CaR, SN (exc Teh), ScV, SnBr, MP	0603f80704
MYOSURUS cupulatus S. Watson	e DMtns	4000000000
MYOSURUS minimus L.	NCoR, CaRF, SNF, GV, SnFrB, s SCoRO, SCo, SnJt, MP	02ba3a6a04
MYOSURUS sessilis S. Watson	GV	0000002200
MYRICA californica Cham.	NCo, w KR, NCoRO, CCo, w SnFrB, SCo	01a5000800
MYRICA hartwegii S. Watson	n&c SN	0000d80000
MYRIOPHYLLUM aquaticum (Vell. Conc.) Verdc.	NCo, CaRF, CW, SCo	0384030800
MYRIOPHYLLUM hippuroides Torrey & A. Gray	NCo, NCoRI, n SNH, SnJV	0014402000
MYRIOPHYLLUM sibiricum V. Komarov	NCo, KR, CaR, n SN, SnJV, CCo, SnFrB, GB, s DMoj (Mojave River)	67074c2806
MYRIOPHYLLUM spicatum L.	SnFrB, SnJV	0000002800
MYRIOPHYLLUM verticillatum L.	KR, n SNH, MP	0003400004
NAJAS flexilis (Willd.) Rostkov & Schmidt	KR, NCoRI (expected elsewhere)	0011000000
NAJAS gracillima (A. Braun) Magnus	n ScV, expected elsewhere	0000000200
NAJAS graminea Del.	ScV (Butte, Colusa cos.)	0000000200
NAJAS guadalupensis (Sprengel) Magnus	NCoRO, GV, CW, SCo, D	e1a0032a00
NAJAS marina L.	NCoR, s SNF, CCo, SCoR, SCo, SnBr, PR, D	e1f8234400
NAMA aretioides (Hook. & Arn.) Brand	KR, NCoRO, CaR, n SNH, GB	0623440006
NAMA aretioides (Hook. & Arn.) Brand var. californicum (Brand) Jepson	MP	0002000004
NAMA aretioides (Hook. & Arn.) Brand var. multiflorum (A.A. Heller) Jepson	KR, NCoRO, CaR, n SNH, GB	0623440006
NAMA californicum (A. Gray) J. Bacon	NCoRI, Teh, GV, e SnFrB, SCoRI, SW, DMoj	78d001fe01
NAMA demissum A. Gray	SNH, SW, SNE, D	f8c0c45503
NAMA demissum A. Gray var. covillei Brand	n DMoj (Death Valley region)	2000000000
NAMA demissum A. Gray var. demissum	s SNH, SW, SNE, D	f8c0045503
NAMA densum Lemmon	NW, CaR, n&c SNH, GB	063fc40006
NAMA densum Lemmon var. densum	NW, CaR, n&c SNH, GB	063fc40006
NAMA densum Lemmon var. parviflorum (Greenman) C. Hitchc.	NW, CaR, GB	063f040006
NAMA depressum A. Gray	s SNH, SNE, DMoj	6000040102
NAMA dichotomum (Ruiz Lopez & Pavon) Choisy var. dichotomum	e DMtns (New York Mtns)	4000000000
NAMA hispidum A. Gray var. spathulatum (Torrey) C. Hitchc.	SW, D	f8c0005401
NAMA lobbii A. Gray	CaR, n&c SNH	0600c00000
NAMA pusillum A. Gray	SNE, DMoj	6000040002
NAMA rothrockii A. Gray	c&s SNH, SnBr, W&I	0000800502
NAMA stenocarpum A. Gray	SW	18c0005401
NARTHECIUM californicum Baker	KR, NCoRO, CaRH, n&c SNH	0421c00000
NASSELLA cernua (Stebb. & L<#f6>ve) Barkworth	NCoRI, e SnFrB, SCoR, TR, PR	0050035c01
NASSELLA formicara (Del.) Barkworth	s NCoRO (Sonoma Co.), s ScV, n SnFrB	0020000a00
NASSELLA lepida (A. Hitchc.) Barkworth	NW, CW, SCo, ChI, WTR, w PR	19fd030801
NASSELLA pulchra (A. Hitchc.) Barkworth	NW, n&c SNF, s ScV, CW, SCo, ChI, WTR, w PR	19fd1b0a01
NAVARRETIA atractyloides (Benth.) Hook. & Arn.	NCoR, SnFrB, SCoR, ChI, TR, PR	1878035c01
NAVARRETIA breweri (A. Gray) E. Greene	SNH, GB	0002c40106
NAVARRETIA cotulifolia (Benth.) Hook. & Arn.	NCoRI, ScV, SnFrB, SCoRI	0010010a00
NAVARRETIA divaricata (A. Gray) E. Greene	NW, CaR, SN, s SCoRO (Santa Barbara Co.), MP	063ffa8104
NAVARRETIA divaricata (A. Gray) E. Greene ssp. divaricata	NW, CaR, SN, s SCoRO (Santa Barbara Co.), MP	063ffa8104
NAVARRETIA divaricata (A. Gray) E. Greene ssp. vividior (Jepson & V. Bailey) H. Mason	NW, CaR, SN, MP	063ff88104
NAVARRETIA eriocephala H. Mason	n&c SNF, e ScV	0000180200
NAVARRETIA filicaulis (A. Gray) E. Greene	CaRF, n&c SNF	0200180000
NAVARRETIA fossalis Moran	s SCoRO (San Luis Obispo Co.), SW	18c0025401
NAVARRETIA hamata E. Greene	SnFrB, SCoRO, SW	18c0025c01
NAVARRETIA hamata E. Greene ssp. hamata	TR, PR	0040005401
NAVARRETIA hamata E. Greene ssp. leptantha (E. Greene) H. Mason	SCo, ChI	1880000000
NAVARRETIA hamata E. Greene ssp. parviloba A.G. Day	SnFrB (Santa Cruz Mtns), SCoRO	0000020800
NAVARRETIA heterandra H. Mason	NCoRI, CaRF, w ScV, e SnFrB, SCoRI, MP	0212010a04
NAVARRETIA heterodoxa (E. Greene) E. Greene	SnFrB	0000000800
NAVARRETIA intertexta (Benth.) Hook.	KR, NCoR, CaR, SNF, SNH, GV, SnFrB, SCoR, MP	063bfb2b04
NAVARRETIA intertexta (Benth.) Hook. ssp. intertexta	KR, NCoR, CaR, SNF, GV, SnFrB, SCoR	06393b2a00
NAVARRETIA intertexta (Benth.) Hook. ssp. propinqua (Suksd.) A.G. Day	CaR, SNH, MP	0602c00104
NAVARRETIA jaredii Eastw.	SCoR, n SW	18c0035401
NAVARRETIA jepsonii V. Bailey	NCoRI	0010000000
NAVARRETIA leucocephala Benth.	NCoR, CaR, n SNH, GV, GB	063a442206
NAVARRETIA leucocephala Benth. ssp. bakeri (H. Mason) A.G. Day	NCoRI, w ScV	0010000200
NAVARRETIA leucocephala Benth. ssp. leucocephala	GV	0000002200
NAVARRETIA leucocephala Benth. ssp. minima (Nutt.) A.G. Day	CaR, n&c SNH, MP	0602c00004
NAVARRETIA leucocephala Benth. ssp. pauciflora (H. Mason) A.G. Day	s NCoRI (Lake, Napa cos.)	0010000000
NAVARRETIA leucocephala Benth. ssp. plieantha (H. Mason) A.G. Day	s NCoR (Lake, Sonoma cos.)	0038000000
NAVARRETIA mellita E. Greene	NCoRI, SCoRI, c SNF (Tuolumne Co.), SnFrB	0010110800
NAVARRETIA myersii P.S. Allen & A.G. Day	c SNF, c GV (4 sites: Sacramento, Amador, Merced cos.)	0000102200
NAVARRETIA nigelliformis E. Greene	SNF, GV, SCoRI	0000392200
NAVARRETIA nigelliformis E. Greene ssp. nigelliformis	SNF, GV, SCoRI	0000392200
NAVARRETIA nigelliformis E. Greene ssp. radians (J. Howell) A.G. Day	SCoRI	0000010000
NAVARRETIA peninsularis E. Greene	Teh, TR, PR	004000d401
NAVARRETIA prolifera E. Greene	SNF	0000380000
NAVARRETIA prolifera E. Greene ssp. lutea (Brand) Mason	n SNF (El Dorado Co.)	0000080000
NAVARRETIA prolifera E. Greene ssp. prolifera	SNF	0000380000
NAVARRETIA prostrata (A. Gray) E. Greene	w SnJV (Merced Co.), SCoRI, c SCo (Los Angeles Co.), PR (Santa Rosa Plateau)	00c0012000
NAVARRETIA pubescens (Benth.) Hook. & Arn.	SNF, NCoR, SnFrB, SCoRI	0038390800
NAVARRETIA rosulata Brand	s NCoRI (Napa Co.), n SnFrB (Marin Co)	0010000800
NAVARRETIA setiloba Cov.	s SNH, Teh (Tulare, Kern cos.)	0000008100
NAVARRETIA squarrosa (Eschsch.) Hook. & Arn.	NCoR, n SNF (Sacramento, Amador cos.) SnFrB, SCoR	00380b0800
NAVARRETIA subuligera E. Greene	NCoRI, n SNF (Amador Co.), ScV	0010080200
NAVARRETIA tagetina E. Greene	n&c SNF, NCoRI, GV	0010182200
NAVARRETIA viscidula Benth.	NCoR, SNF, SnFrB	0038380800
NEMACAULIS denudata Nutt.	SW, DMoj (Devil's Playground), DSon	f8c0005401
NEMACAULIS denudata Nutt. var. denudata	SCo	0080000000
NEMACAULIS denudata Nutt. var. gracilis Goodman & L. Benson	SW, DSon	98c0005401
NEMACLADUS capillaris E. Greene	NCoR, CaRH, n SNF, SNH, MP, DMoj	643ac80104
NEMACLADUS glanduliferus Jepson	SNE, D	e000040002
NEMACLADUS glanduliferus Jepson var. glanduliferus	s SNE, D	e000040002
NEMACLADUS glanduliferus Jepson var. orientalis McVaugh	SNE, D	e000040002
NEMACLADUS gracilis Eastw.	Teh, SnJV (sw Merced Co.), s SCoRO, WTR, w DMoj (Los Angeles Co.)	600002a001
NEMACLADUS interior (Munz) G. Robb.	c SNF, SNH, Teh	0000d08100
NEMACLADUS longiflorus A. Gray	s SNH, SCoR, SCo, SnGb, SnBr, PR	00c0035500
NEMACLADUS longiflorus A. Gray var. breviflorus McVaugh	s SNH, SnGb, SnBr, PR	0040005500
NEMACLADUS longiflorus A. Gray var. longiflorus	SCoR, SCo, SnGb, PR	00c0035000
NEMACLADUS montanus E. Greene	s NCoRI, n ScV, se SnFrB (Mount Hamilton)	0010000a00
NEMACLADUS pinnatifidus E. Greene	SCo, SnGb, PR	00c0005000
NEMACLADUS ramosissimus Nutt.	SnFrB (Mount Hamilton), SCoRO, SCo, WTR, SnGb, PR	00c0025801
NEMACLADUS rigidus Curran	GB	0002040006
NEMACLADUS rubescens E. Greene	PR (e slope), SNE, D	e040040002
NEMACLADUS secundiflorus G. Robb.	s SNH, SCoR	0000030100
NEMACLADUS sigmoideus G. Robb.	s SNH (e slope), Teh, e PR, SNE, DMoj, nw DSon	e040048102
NEMACLADUS twisselmannii J. Howell	s SNH (n Kern Co.)	0000000100
NEMOPHILA breviflora A. Gray	MP	0002000004
NEMOPHILA heterophylla Fischer & C. Meyer	NW, CaR, SN, GV, CW	073dfbab00
NEMOPHILA maculata Lindley	SN, ScV	0000f88300
NEMOPHILA menziesii Hook. & Arn.	CA-FP, SNE, DMoj	7ffdffff03
NEMOPHILA menziesii Hook. & Arn. var. atomaria (Fischer & C. Meyer) Chandler	NW, CCo, SnFrB	013d000800
NEMOPHILA menziesii Hook. & Arn. var. integrifolia Parish	CCo, SCoR, SW, SNE, DMoj	79c0075403
NEMOPHILA menziesii Hook. & Arn. var. menziesii	CA-FP, DMoj	7ffdfbff01
NEMOPHILA parviflora Benth.	NW, SN, CW, MP	013ffb8904
NEMOPHILA parviflora Benth. var. austinae (Eastw.) Brand	KR, NCoRH, n SNH, MP	000b400004
NEMOPHILA parviflora Benth. var. parviflora	NW, CW	013d030800
NEMOPHILA parviflora Benth. var. quercifolia (Eastw.) Chandler	c SN, s SNF, Teh	0000b08000
NEMOPHILA pedunculata Benth.	CA-FP, MP	1ffffbff05
NEMOPHILA pulchella Eastw.	s SN, c SNF, Teh, SnJV, SnFrB, SCoR, WTR, SnGb	000033b901
NEMOPHILA pulchella Eastw. var. fremontii (Elmer) Constance	s SN, Teh, SnJV, SnFrB, SCoR, WTR	000023a901
NEMOPHILA pulchella Eastw. var. gracilis (Eastw.) Constance	c&s SNF	0000300000
NEMOPHILA pulchella Eastw. var. pulchella	s SN, c SNF, SnJV, SnGb	0000303100
NEMOPHILA spatulata Cov.	CaRH, s SNF, SNH, Teh, WTR, SnBr, SnJt, Wrn	0400e0c505
NEOSTAPFIA colusana (Burtt Davy) Burtt Davy	GV (Colusa, Merced, Solano, Stanislaus cos.)	0000002200
NEPETA cataria L.	CA-FP	1ffdfbff01
NEVIUSIA cliftonii J.R. Shevock, B. Ertter, & D. Taylor	CaR (near Lake Shasta)	0600000000
NICANDRA physalodes (L.) Gaertner	SCo	0080000000
NICOLLETIA occidentalis A. Gray	s SNH, DMoj	6000000100
NICOTIANA acuminata Hook. var. multiflora (Philippi) Reiche	CA-FP (exc SW), MP	073ffbab04
NICOTIANA attenuata Torrey	CA (exc coast)	fe7bffff07
NICOTIANA clevelandii A. Gray	SCo, ChI (Santa Catalina, Santa Cruz islands), DSon	9880000000
NICOTIANA glauca Graham	NCoRI, c&s SNF, GV, CW, SW, D	f9d0337e01
NICOTIANA obtusifolia Martens & Galeotti	s SNE, D	e000040002
NICOTIANA quadrivalvis Pursh	CA-FP, uncommon in SNE and DMoj	7ffdffff01
NICOTIANA sylvestris Speg. & O. Comes	n CCo, SnFrB	0100000800
NITROPHILA mohavensis Munz & Roos	n DMoj (Amargosa Desert)	2000000000
NITROPHILA occidentalis (Nutt.) Moq.	CaRF, GV, SCo, w PR, SNE, DMoj	62c0042202
NOLINA bigelovii (Torrey) S. Watson	DMtns, DSon	c000000000
NOLINA interrata H. Gentry	sw PR (sw San Diego Co.)	0040000000
NOLINA parryi S. Watson	s SNH (Kern Plateau), e SnBr, PR, DMtns, DSon	c040004500
NOTHOCALAIS alpestris (A. Gray) Chambers	KR, n SNH (El Dorado Co.)	0001400000
NOTHOCALAIS troximoides (A. Gray) E. Greene	KR, MP	0003000004
NOTHOCHELONE nemorosa (Lindley) Straw	KR, n CaRH	0401000000
NOTHOLAENA californica D. Eaton	s ChI, SnGb, SnBr, PR, DMtns, DSon	d040005400
NOTHOSCORDUM inodorum (Aiton) Nicholson	GV, CW, SCo	0180032a00
NUPHAR lutea (L.) Sibth. & Sm. ssp. polysepala (Engelm.) E. Beal	NW, n&c SN, n&c CW, MP	013fdb0804
NYMPHAEA mexicana Zucc.	SnJV (Merced, Madera, Fresno, Kings cos.)	0000002000
NYMPHAEA odorata Aiton	Widely scattered, SNH (Lake Tahoe), ScV (Butte Co.), SnBr, expected elsewhere	0000c00700
NYMPHOIDES peltata (S. Gmelin) Kuntze	n SNH (Trout Lake, El Dorado Co.)	0000400000
ODONTOSTOMUM hartwegii Torrey	NCoRI, n&c SNF	0010180000
OEMLERIA cerasiformis (Hook. & Arn.) J.W. Landon	NW, w CaR, w SN, ScV (Sutter Buttes), s-c SnJV, w CW, sw WTR	073dfbab01
OENANTHE pimpinelloides L.	n NCoRO (Humboldt Co.)	0020000000
OENANTHE sarmentosa J.S. Presl	NCo, SNF (uncommon), CCo, SnFrB, SCo	0184380800
OENOTHERA biennis L.	NW, CW, SW	19fd035c01
OENOTHERA caespitosa Nutt.	MP (likely), SNE, D	e002040006
OENOTHERA caespitosa Nutt. ssp. crinita (Rydb.) Munz	MP (likely), SNE, D	e002040006
OENOTHERA caespitosa Nutt. ssp. marginata (Hook. & Arn.) Munz	MP (likely), SNE, D	e002040006
OENOTHERA californica (S. Watson) S. Watson	CW, SW, SNE, D	f9c0075c03
OENOTHERA californica (S. Watson) S. Watson ssp. avita Klein	SNE, D	e000040002
OENOTHERA californica (S. Watson) S. Watson ssp. californica	CW (San Luis Obispo Co. s), SW, s DMtns (Little San Bernardino Mtns)	59c0035c01
OENOTHERA californica (S. Watson) S. Watson ssp. eurekensis (Munz & Roos) Klein	n-most DMoj (Eureka Valley, ne Inyo Co.)	6000000000
OENOTHERA deltoides Torrey & Fr<#e9>mont	SnJV, ne SnFrB, MP, D	e002002804
OENOTHERA deltoides Torrey & Fr<#e9>mont ssp. cognata (Jepson) Klein	SnJV, w DMoj	6000002000
OENOTHERA deltoides Torrey & Fr<#e9>mont ssp. deltoides	D	e000000000
OENOTHERA deltoides Torrey & Fr<#e9>mont ssp. howellii (Munz) Klein	ne SnFrB (Antioch, Contra Costa Co.)	0000000800
OENOTHERA deltoides Torrey & Fr<#e9>mont ssp. piperi (Munz) Klein	MP	0002000004
OENOTHERA elata Kunth	CA	ffffffff07
OENOTHERA elata Kunth ssp. hirsutissima (S. Watson) W. Dietr.	CA	ffffffff07
OENOTHERA elata Kunth ssp. hookeri (Torrey & A. Gray) W. Dietr. & W.L. Wagner	CW, SW	19c0035c01
OENOTHERA flava (Nelson) A.O. Garrett	CaR, n SNH, MP	0602400004
OENOTHERA glazioviana Micheli	NW, CW, SW	19fd035c01
OENOTHERA laciniata Hill	CW, SW, DMoj	79c0035c01
OENOTHERA longissima Rydb.	e DMtns (New York Mtns)	4000000000
OENOTHERA primiveris A. Gray	D	e000000000
OENOTHERA primiveris A. Gray ssp. bufonis (M.E. Jones) Munz	D	e000000000
OENOTHERA primiveris A. Gray ssp. primiveris	D	e000000000
OENOTHERA pubescens Sprengel	c DMoj (Newberry Springs, San Bernardino Co.)	6000000000
OENOTHERA rosea L'H<#e9>r.	WTR	0000000001
OENOTHERA speciosa Nutt.	WTR	0000000001
OENOTHERA stricta Link ssp. stricta	SCoRO	0000020000
OENOTHERA villosa Thunb. ssp. strigosa (Rydb.) W. Dietr. & Raven	KR, NCoRI (Tehama Co.), CaRH (Plumas Co.), MP	0413000004
OENOTHERA wolfii (Munz) Raven, W. Dietr. & W. Stubbe	n NCo, w KR (Del Norte, Humboldt cos.), e KR (Carrville, +/- 800 m, Trinity Co.)	0005000000
OENOTHERA xylocarpa Cov.	c&s SNH	0000800100
OLEA europaea L.	s NCoR, GV, SnFrB, SCo, n ChI (Santa Cruz Island)	08b8002a00
OLIGOMERIS linifolia (M. Vahl) J.F. Macbr.	SW, D	f8c0005401
OLNEYA tesota A. Gray	PR, DSon	8040004000
ONOBRYCHIS viciifolia Scopoli	n SNF	0000080000
ONOPORDUM acanthium L. ssp. acanthium	NW, CaR, SN, SnJV, CW, SW, MP	1ffffbfd05
ONOPORDUM illyricum L.	s SnFrB	0000000800
ONOPORDUM tauricum Willd.	SNF, n SCoRI, MP	0002390004
OPHIOGLOSSUM californicum Prantl	n&c SNF, CCo, SCo	0180180000
OPHIOGLOSSUM pusillum Raf.	e KR (Siskiyou Co.), n SN (El Dorado Co.)	0001480000
OPUNTIA X-fosbergii C. Wolf	DSon (e San Diego Co.)	8000000000
OPUNTIA X-munzii C. Wolf	DSon (Chocolate & Chuckwalla Mtns, Imperial & Riverside cos.)	8000000000
OPUNTIA X-occidentalis Engelm.	SCo, w edge PR	00c0000000
OPUNTIA X-vaseyi (J. Coulter) Britton & Rose	SCo (edges of adjacent zones)	0080000000
OPUNTIA acanthocarpa Engelm. & J. Bigelow var. coloradensis L. Benson	D	e000000000
OPUNTIA basilaris Engelm. & J. Bigelow	s SN, Teh, se SnJV, SnGb, SnBr (and adjacent SCo), e PR, s SNE, D	e04024b502
OPUNTIA basilaris Engelm. & J. Bigelow var. basilaris	s SN, Teh, SnGb, SnBr (and adjacent SCo), e PR, s SNE, D	e040249502
OPUNTIA basilaris Engelm. & J. Bigelow var. brachyclada (Griffiths) Munz	SnGb, SnBr	0000001400
OPUNTIA basilaris Engelm. & J. Bigelow var. treleasei (J. Coulter) Toumey	Teh, se SnJV (Kern Co.)	000000a000
OPUNTIA bigelovii Engelm.	DMoj (Kelso Dunes), DSon	e000000000
OPUNTIA chlorotica Engelm. & J. Bigelow	e PR, DMtns	4040000000
OPUNTIA echinocarpa Engelm. & J. Bigelow	W&I, D	e000000002
OPUNTIA engelmannii Engelm. var. engelmannii	SnJt, DMtns	4000004000
OPUNTIA erinacea Engelm. & J. Bigelow	se SNH, SnBr, SnJt, SNE, DMoj (esp DMtns)	6000044502
OPUNTIA erinacea Engelm. & J. Bigelow var. erinacea	se SNH, SnBr, SnJt, SNE, DMoj (esp DMtns)	6000044502
OPUNTIA erinacea Engelm. & J. Bigelow var. utahensis (Engelm.) L. Benson	GB (Mono, nw Inyo cos.)	0002040006
OPUNTIA ficus-indica (L.) Miller	s CCo, s SCoRO, SCo, w WTR, w PR, s ChI	11c0020001
OPUNTIA fragilis (Nutt.) Haw.	w CaRH (Shasta Valley, Siskiyou Co.)	0400000000
OPUNTIA littoralis (Engelm.) Cockerell	SCo, s PR, ChI	18c0000000
OPUNTIA oricola Philbr.	SCo, ChI, WTR, w PR	18c0000001
OPUNTIA parishii Orc.	e&s DMoj	6000000000
OPUNTIA parryi Engelm.	s SCoRI, SW (exc ChI)	00c0015401
OPUNTIA phaeacantha Engelm.	SCoRO, SnBr, e PR, DMtns, DSon	c040020400
OPUNTIA prolifera Engelm.	SCo, ChI	1880000000
OPUNTIA pulchella Engelm.	SNE	0000040002
OPUNTIA ramosissima Engelm.	D	e000000000
OPUNTIA wolfii (L. Benson) M. Baker	w edge DSon	8000000000
ORCUTTIA californica Vasey	SW (Los Angeles, Riverside, San Diego cos.)	18c0005401
ORCUTTIA inaequalis Hoover	SnJV (Fresno, Madera, Merced, Stanislaus, Tulare cos.)	0000002000
ORCUTTIA pilosa Hoover	GV (Madera, Merced, Stanislaus, Tehama cos.)	0000002200
ORCUTTIA tenuis A. Hitchc.	NCoRI (Lake Co), CaRF (Shasta, Tehama cos.)	0210000000
ORCUTTIA viscida (Hoover) Reeder	ScV (Sacramento Co.)	0000000200
OREONANA clementis (M.E. Jones) Jepson	s SNH	0000000100
OREONANA purpurascens J.R. Shevock & Constance	s SNH	0000000100
OREONANA vestita (S. Watson) Jepson	SnGb, SnBr	0000001400
ORIGANUM vulgare L.	NCo, SnFrB, n SCo (near Ventura)	0084000800
ORNITHOPUS pinnatus (Miller) Druce	CCo (Santa Cruz Co.)	0100000000
ORNITHOPUS sativus Brot.	CCo (Santa Cruz Co.)	0100000000
ORNITHOSTAPHYLOS oppositifolia (C. Parry) Small	SCo (San Diego Co.)	0080000000
OROBANCHE bulbosa G. Beck	s NCoRO, NCoRI, SNF (Eldorado Co. s), SnFrB, SCoRO, SW	18f03a5c01
OROBANCHE californica Cham. & Schldl.	CA-FP, GB	1fffffff07
OROBANCHE californica Cham. & Schldl. ssp. californica	NCo, n&c CCo	0104000000
OROBANCHE californica Cham. & Schldl. ssp. feudgei (Munz) Heckard	s SNH, Teh, TR, PR, s SNE	004004d503
OROBANCHE californica Cham. & Schldl. ssp. grandis Heckard	s CCo, s SCoRO (Santa Barbara Co.), c SCo (Los Angeles Co.), n ChI (Santa Rosa Island)	0980020000
OROBANCHE californica Cham. & Schldl. ssp. grayana (G. Beck) Heckard	NCoRH, n&c SNH, SnFrB (s Sonoma Co., +/- 60 m), MP	000ac00804
OROBANCHE californica Cham. & Schldl. ssp. jepsonii (Munz) Heckard	KR, NCoR, CaR, SNF, GV, SnFrB, SCoR	06393b2a00
OROBANCHE cooperi (A. Gray) A.A. Heller	D	e000000000
OROBANCHE corymbosa (Rydb.) Ferris	n CaR, SNH, GB, n DMtns (Panamint Mtns)	4602c40106
OROBANCHE fasciculata Nutt.	CA-FP, GB, DMtns	5fffffff07
OROBANCHE parishii (Jepson) Heckard	SNH, Teh, CCo, SW, W&I, DMtns	59c0c0d503
OROBANCHE parishii (Jepson) Heckard ssp. brachyloba Heckard	CCo, SCo, ChI	1980000000
OROBANCHE parishii (Jepson) Heckard ssp. parishii	s SNH, Teh, SW, W&I, DMtns	58c000d503
OROBANCHE pinorum Hook.	NW, CaRH, SnFrB	043d000800
OROBANCHE ramosa L.	n SnJV, SnFrB, SCoRI, SCo	0080012800
OROBANCHE uniflora L.	NW, CaR, SN, ScV (Sutter Buttes), CW, SCo, n ChI, Wrn	0fbdfb8b04
OROBANCHE valida Jepson	NCoRH, NCoRI, WTR, SnGb	0018001001
OROBANCHE valida Jepson ssp. howellii Heckard & L.T. Collins	s NCoRH, c&s NCoRI	0018000000
OROBANCHE valida Jepson ssp. valida	c WTR (Topatopa Mtns), SnGb	0000001001
OROBANCHE vallicola (Jepson) Heckard	NCoR, CaRF, GV, CW, SCo (Los Angeles Co.)	03b8032a00
OROCHAENACTIS thysanocarpha (A. Gray) Cov.	s SNH	0000000100
OROGENIA fusiformis S. Watson	KR, CaRH, n SNH	0401400000
ORTHILIA secunda (L.) House	KR, NCoRH, s CaRH, SNH, SnBr, SnJt, Wrn	0409c04504
ORTHOCARPUS bracteosus Benth.	NW, CaR, MP	063f000004
ORTHOCARPUS cuspidatus E. Greene	NW, CaR, SN, GB	063ffc8106
ORTHOCARPUS cuspidatus E. Greene ssp. copelandii (Eastw.) Chuang & Heckard	NW, CaR	063d000000
ORTHOCARPUS cuspidatus E. Greene ssp. cryptanthus (Piper) Chuang & Heckard	SN, GB	0002fc8106
ORTHOCARPUS cuspidatus E. Greene ssp. cuspidatus	NW, CaR	063d000000
ORTHOCARPUS imbricatus S. Watson	NW, CaR	063d000000
ORTHOCARPUS luteus Nutt.	GB	0002040006
ORTHOCARPUS pachystachyus A. Gray	e KR, adjacent w CaR (c Siskiyou Co.)	0601000000
ORYCTES nevadensis S. Watson	s SNE (Inyo Co.)	0000040002
ORYZA sativa L.	GV	0000002200
OSMADENIA tenella Nutt.	SW (exc ChI)	00c0005401
OSMORHIZA brachypoda Torrey	c&s SNF, Teh, SnFrB, SCoR, TR, PR	004033dc01
OSMORHIZA chilensis Hook. & Arn.	CA-FP	1ffdfbff01
OSMORHIZA depauperata Philippi	Wrn	0000000004
OSMORHIZA occidentalis (Nutt.) Torrey	KR, NCoR, CaRH, n&c SNH, GB	043bc40006
OSMORHIZA purpurea (J. Coulter & Rose) Suksd.	NCo (Del Norte Co.)	0004000000
OSTEOSPERMUM ecklonis (DC.) Norlindh	SCoRO, WTR, expected more widely	0000020001
OTTELIA alismoides (L.) Pers.	Formerly e ScV (Butte Co.), presumed extirpated	0000000000
OXALIS albicans Kunth	NCo, NCoRO, CCo, SnFrB, SCoRO, SCo, ChI, WTR	19a4020801
OXALIS albicans Kunth ssp. californica (Abrams) Eiten	SCo, ChI	1880000000
OXALIS albicans Kunth ssp. pilosa (Nutt.) Eiten	NCo, NCoRO, CCo, SnFrB, SCoRO, SCo, WTR	01a4020801
OXALIS corniculata L.	CA	ffffffff07
OXALIS hirta L.	CCo, SCo	0180000000
OXALIS incarnata L.	NCo, SnFrB	0004000800
OXALIS latifolia Kunth	NCo, CCo, SCoRO	0104020000
OXALIS laxa Hook. & Arn.	NCo, c SNF	0004100000
OXALIS oregana Nutt.	NCo, NCoRO, CCo, SnFrB	0124000800
OXALIS pes-caprae L.	NCo, NCoRO, CCo, SnFrB, SCoRO, SCo	01a4020800
OXALIS purpurea L.	NCo, SnFrB	0004000800
OXALIS rubra A. St. Hil.	NCo, SnFrB	0004000800
OXALIS suksdorfii Trel.	NCo	0004000000
OXALIS trilliifolia Hook.	NCo, KR, NCoRO	0025000000
OXYPOLIS occidentalis J. Coulter & Rose	CaRF, SN, c SnBr, W&I	0200f88502
OXYRIA digyna (L.) Hill	CA	ffffffff07
OXYSTYLIS lutea Torrey & Fr<#e9>mont	DMoj	6000000000
OXYTHECA caryophylloides C. Parry	s SNH (Tulare Co.), TR, SnJt	0000005501
OXYTHECA dendroidea Nutt. ssp. dendroidea	GB	0002040006
OXYTHECA emarginata H.M. Hall	e PR (SnJt, Santa Rosa Mtns, Riverside Co.)	0040004000
OXYTHECA parishii C. Parry	s SCoRO, TR	0000021401
OXYTHECA parishii C. Parry var. abramsii (McGregor) Munz	s SCoRO (San Rafael Mtns), WTR (Topatopa Mtns, Mt. Pinos)	0000020001
OXYTHECA parishii C. Parry var. cienegensis B. Ertter	e SnBr (Cienega Seca Creek, Coon Creek)	0000000400
OXYTHECA parishii C. Parry var. goodmaniana B. Ertter	n SnBr (Greenlead Mine, Holcomb Valley, Cushenbury Canyon)	0000000400
OXYTHECA parishii C. Parry var. parishii	TR	0000001401
OXYTHECA perfoliata Torrey & A. Gray	s SnJV, GB, DMoj	6002042006
OXYTHECA trilobata A. Gray	SnGb, SnBr, PR, w DMtns (Little San Bernardino Mtns)	4040005400
OXYTHECA watsonii Torrey & A. Gray	se W&I (Santa Rosa Hills, Inyo Co.)	0000000002
OXYTROPIS borealis DC. var. viscida (Nutt.) Welsh	s SNH, W&I	0000000102
OXYTROPIS deflexa (Pall.) DC. var. sericea Torrey & A. Gray	W&I (White Mtns, Mono Co.)	0000000002
OXYTROPIS oreophila A. Gray	SnBr, W&I	0000000402
OXYTROPIS parryi A. Gray	SNE, W&I	0000040002
PAEONIA brownii Hook.	KR, NCoR, CaR, n&n-c SN, se SnFrB (Mount Hamilton)	0639d80800
PAEONIA californica Torrey & A. Gray	SCoR, TR, PR	0040035401
PALAFOXIA arida B. Turner & M. Morris	D	e000000000
PALAFOXIA arida B. Turner & M. Morris var. arida	D	e000000000
PALAFOXIA arida B. Turner & M. Morris var. gigantea (M.E. Jones) B. Turner & M. Morris	DSon (se Imperial Co.)	8000000000
PANICUM acuminatum Sw.	NW, CaR, SN, GV, CCo, SnFrB, SCoRO, SW	1ffdfaff01
PANICUM acuminatum Sw. var. acuminatum	NW, CaR, SN, GV, CCo, SnFrB, SCoRO, SW	1ffdfaff01
PANICUM acuminatum Sw. var. lindheimeri (Nash) Beetle	GV	0000002200
PANICUM antidotale Retz.	s DMoj, DSon	e000000000
PANICUM capillare L.	CA	ffffffff07
PANICUM dichotomiflorum Michaux	SnJV, SCo	0080002000
PANICUM hillmanii Chase	s ScV	0000000200
PANICUM hirticaule C. Presl	DSon	8000000000
PANICUM maximum Jacq.	SCo (Riverside Co.)	0080000000
PANICUM miliaceum L.	GV, SnFrB, SW, DSon	98c0007e01
PANICUM oligosanthes Schultes var. scribnerianum (Nash) Fern.	NW, n CaR	063d000000
PANICUM urvilleanum Kunth	e SCo, D	e080000000
PAPAVER argemone L.	CA-FP	1ffdfbff01
PAPAVER californicum A. Gray	CW, SW	19c0035c01
PAPAVER rhoeas L.	CA-FP	1ffdfbff01
PAPAVER somniferum L.	CA-FP	1ffdfbff01
PARAPHOLIS incurva (L.) C.E. Hubb.	NCo, CCo, SCo, ChI	1984000000
PARAPHOLIS strigosa (Dumort.) C.E. Hubb.	NCo (esp n Humboldt Bay)	0004000000
PARENTUCELLIA latifolia (L.) Caruel	NCoRO, n CCo	0120000000
PARENTUCELLIA viscosa (L.) Caruel	NCo, NCoRO, CaRF, CCo, SCo	03a4000000
PARIETARIA hespera B.D. Hinton	SnFrB, SW, D	f8c0005c01
PARIETARIA hespera B.D. Hinton var. californica B.D. Hinton	SnFrB, SW	18c0005c01
PARIETARIA hespera B.D. Hinton var. hespera	SnFrB, SW, D	f8c0005c01
PARIETARIA judaica L.	CCo, SCo	0180000000
PARIETARIA pensylvanica Willd.	CA-FP	1ffdfbff01
PARISHELLA californica A. Gray	sw SnJV (Caliente Mtns), se SCoRO, DMoj (San Bernardino Co.)	6000022000
PARKINSONIA aculeata L.	SnJV, SCo, WTR, PR	00c0006001
PARNASSIA californica (A. Gray) E. Greene	KR, NCoRI, CaRH, SNH, SCoR	0411c30100
PARNASSIA cirrata Piper	SnGb, SnBr	0000001400
PARNASSIA fimbriata K<#f6>nig	KR, n SNH, Wrn	0001400004
PARNASSIA parviflora DC	SNE, W&I	0000040002
PARONYCHIA ahartii B. Ertter	CaRF, ScV	0200000200
PARONYCHIA echinulata Chater var. echinulata	n SnJV (La Grange, Stanislaus Co.)	0000002000
PARONYCHIA franciscana Eastw.	n CCo (around San Francisco Bay), SnFrB	0100000800
PARTHENOCISSUS vitacea (Knerr) Hitchc.	GV, CW, SW	19c0037e01
PARVISEDUM congdonii (Eastw.) R.T. Clausen	SN	0000f88100
PARVISEDUM leiocarpum (H. Sharsm.) R.T. Clausen	s NCoRI (Lake Co.)	0010000000
PARVISEDUM pentandrum (H. Sharsm.) R.T. Clausen	NCoRI, e ScV, ne SnJV, CW	0110032a00
PARVISEDUM pumilum (Benth.) R.T. Clausen	s NCoRO, NCoRI, n&c SNF, GV	0030182200
PASCOPYRUM smithii (Rydb.) A. L<#f6>ve	GB	0002040006
PASPALUM dilatatum Poiret	CA-FP, DMoj	7ffdfbff01
PASPALUM distichum L.	CA-FP (exc mtns), GB, n DMoj	3fffffff07
PASPALUM notatum J. Fleugge	SnJV, expected elsewhere	0000002000
PASPALUM urvillei Steudel	ScV, SCo, expected elsewhere	0080000200
PASTINACA sativa L.	CA-FP	1ffdfbff01
PAXISTIMA myrsinites (Pursh) Raf.	NW, CaR, n&c SN, n SnFrB (Marin Co.), MP	063fd80804
PECTIS papposa Harvey & A. Gray var. papposa	SNE, D	e000040002
PECTOCARYA heterocarpa (I.M. Johnston) I.M. Johnston	SW, D, W&I	f8c0005403
PECTOCARYA linearis (Ruiz Lopez & Pavon) DC. ssp. ferocula (I.M. Johnston) Thorne	GV, CW, SW, DMoj	79c0037e01
PECTOCARYA penicillata (Hook. & Arn.) A. DC.	CA-FP, W&I, D	fffdfbff03
PECTOCARYA peninsularis I.M. Johnston	DSon	8000000000
PECTOCARYA platycarpa (Munz & I.M. Johnston) Munz & I.M. Johnston	SW, W&I, D	f8c0005403
PECTOCARYA pusilla (A. DC.) A. Gray	NW, SNF, CW	013d3b0800
PECTOCARYA recurvata I.M. Johnston	W&I, D	e000000002
PECTOCARYA setosa A. Gray	s SN, CW, SW, SNE, D	f9c0275d03
PEDICULARIS attollens A. Gray	KR, CaR, SNH, MP, W&I	0603c00106
PEDICULARIS bracteosa Benth. var. flavida (Pennell) Cronq.	KR	0001000000
PEDICULARIS centranthera A. Gray	se MP (e Lassen Co.)	0002000004
PEDICULARIS contorta Benth.	KR	0001000000
PEDICULARIS crenulata Benth.	SNE (Convict Creek, Mono Co)	0000040002
PEDICULARIS densiflora Hook.	NW, CaR, SNF, Teh, CW, SW	1ffd3bdc01
PEDICULARIS dudleyi Elmer	CW (exc SCoRO)	0100010800
PEDICULARIS groenlandica Retz.	KR, CaR, SNH	0601c00100
PEDICULARIS howellii A. Gray	n KR	0001000000
PEDICULARIS racemosa Hook.	KR, CaR, n SNH, SNE	0601440002
PEDICULARIS semibarbata A. Gray	NCoRH, CaRH, SN, SnGb, SnBr, PR	0448f8d500
PEDIOMELUM californicum (S. Watson) Rydb.	NCoRI, CW, TR, SnJt	0110035c01
PEDIOMELUM castoreum (S. Watson) Rydb.	DMoj (San Bernardino Co.)	6000000000
PELARGONIUM X-domesticum L. Bailey	CCo, SCo	0180000000
PELARGONIUM X-hortorum L. Bailey	SCo, ChI	1880000000
PELARGONIUM grossularioides (L.) L'H<#e9>r.	NCo, SnFrB, CCo, SCo	0184000800
PELARGONIUM inquinans (L.) L'H<#e9>r.	SnFrB	0000000800
PELARGONIUM panduriforme Ecklon & Zeyher	CCo, SCo	0180000000
PELARGONIUM peltatum (L.) L'H<#e9>r.	CCo, SCo	0180000000
PELARGONIUM quercifolium (L.) L'H<#e9>r.	CCo, SCo	0180000000
PELARGONIUM vitifolium (L.) L'H<#e9>r.	NCo, SnFrB	0004000800
PELARGONIUM zonale (L.) L'H<#e9>r.	CCo, SnFrB, SCo	0180000800
PELLAEA andromedifolia (Kaulf.) F<#e9>e	NCoR, SN, CW, SW	19f8fbdd01
PELLAEA brachyptera (T. Moore) Baker	KR, NCoR, CaR, n SNH	0639400000
PELLAEA breweri D. Eaton	KR, SNH, GB, DMtns	4003c40106
PELLAEA bridgesii Hook.	SNH	0000c00100
PELLAEA mucronata (D. Eaton) D. Eaton	NCoR, CaR, SN, GV (Sutter Buttes), CW, SW, SNE, DMtns	5ff8ffff03
PELLAEA mucronata (D. Eaton) D. Eaton var. californica (Lemmon) Munz & I.M. Johnston	c SNH, TR, PR, SNE, DMtns	4040845403
PELLAEA mucronata (D. Eaton) D. Eaton var. mucronata	NCoR, CaR, SN, GV (Sutter Buttes), CW, SW, DMtns	5ff8fbff01
PELLAEA truncata Goodd.	e DMtns (Providence Mtns, New York Mtns)	4000000000
PELTANDRA virginica (L.) Schott & Endl.	sw SnJV (ne San Luis Obispo Co.)	0000002000
PENNISETUM clandestinum Chiov.	NCo, CCo, SnFrB, SCo, n ChI (Santa Cruz Island)	0984000800
PENNISETUM setaceum (Forssk.) Chiov.	Deltaic GV, CCo, SnFrB, SCo, expected elsewhere	0180002a00
PENNISETUM villosum R.Br.	SW, DSon, expected elsewhere	98c0005401
PENSTEMON albomarginatus M.E. Jones	DMoj	6000000000
PENSTEMON anguineus Eastw.	NW	003d000000
PENSTEMON azureus Benth.	NW, CaR, n&c SN	063dd80000
PENSTEMON azureus Benth. var. angustissimus A. Gray	NCoRH, n&c SN	0008d80000
PENSTEMON azureus Benth. var. azureus	NW, CaR, n&c SNH	063dc00000
PENSTEMON barnebyi N. Holmgren	W&I	0000000002
PENSTEMON bicolor (Brandegee) Clokey & Keck	ne DMtns (Castle Mtns)	4000000000
PENSTEMON caesius A. Gray	s SNH, SnGb, SnBr	0000001500
PENSTEMON calcareus Brandegee	n DMtns	4000000000
PENSTEMON californicus (Munz & I.M. Johnston) Keck	PR	0040004000
PENSTEMON centranthifolius (Benth.) Benth.	NCoR, n SNF, GV (margins), CW, SW	19f80b7e01
PENSTEMON cinicola Keck	MP	0002000004
PENSTEMON clevelandii A. Gray	PR, s DMtns, w DSon	c040004000
PENSTEMON clevelandii A. Gray var. clevelandii	PR, w DSon	8040004000
PENSTEMON clevelandii A. Gray var. connatus Munz & I.M. Johnston	e PR (e slope SnJt, Santa Rosa mtns)	0040004000
PENSTEMON clevelandii A. Gray var. mohavensis (Keck) McMinn	s DMtns (Little San Bernardino, Granite mtns)	4000000000
PENSTEMON davidsonii E. Greene var. davidsonii	KR, CaRH, SNH, Wrn, n SNE (Sweetwater Mtns)	0401c40104
PENSTEMON deustus Lindley	KR, NCoRH, CaR, SNH, MP, n SNE (Sweetwater Mtns)	060bc40104
PENSTEMON deustus Lindley var. pedicellatus M.E. Jones	CaR, SNH, MP, n SNE (Sweetwater Mtns)	0602c40104
PENSTEMON deustus Lindley var. suffrutescens L. Henderson	KR, NCoRH, s CaRH, n SNH	0409400000
PENSTEMON eatonii A. Gray	SnBr, DMtns	4000000400
PENSTEMON eatonii A. Gray var. eatonii	DMtns	4000000000
PENSTEMON eatonii A. Gray var. undosus M.E. Jones	SnBr, DMtns	4000000400
PENSTEMON filiformis (Keck) Keck	e KR (n Trinity, nw Shasta cos.)	0001000000
PENSTEMON floridus Brandegee	SNE, n DMtns	4000040002
PENSTEMON floridus Brandegee var. austinii (Eastw.) N. Holmgren	W&I, n DMtns	4000000002
PENSTEMON floridus Brandegee var. floridus	SNE	0000040002
PENSTEMON fruticiformis Cov.	s SNE, n DMtns	4000040002
PENSTEMON fruticiformis Cov. var. amargosae (Keck) N. Holmgren	ne DMtns (Kingston Mtns)	4000000000
PENSTEMON fruticiformis Cov. var. fruticiformis	s SNE, n DMtns	4000040002
PENSTEMON gracilentus A. Gray	CaR, n SNH, MP	0602400004
PENSTEMON grinnellii Eastw.	s SN, SW (exc SCo, ChI)	0040205501
PENSTEMON grinnellii Eastw. var. grinnellii	SW (exc SCo, ChI)	0040005401
PENSTEMON grinnellii Eastw. var. scrophularioides (M.E. Jones) N. Holmgren	s SN, WTR	0000200101
PENSTEMON heterodoxus A. Gray	KR, CaRH, SN, n SNE, W&I	0401fc8100
PENSTEMON heterodoxus A. Gray var. cephalophorus (E. Greene) N. Holmgren	s SNH	0000000100
PENSTEMON heterodoxus A. Gray var. heterodoxus	KR, SN, n SNE, W&I	0001fc8100
PENSTEMON heterodoxus A. Gray var. shastensis (Keck) N. Holmgren	CaRH	0400000000
PENSTEMON heterophyllus Lindley	NW, CaRF, n SNF, ScV, CW, SW	1bfd0b5e01
PENSTEMON heterophyllus Lindley var. australis Munz & I.M. Johnston	CW, SW	19c0035c01
PENSTEMON heterophyllus Lindley var. heterophyllus	NW, CW, WTR	013d030801
PENSTEMON heterophyllus Lindley var. purdyi (Keck) McMinn	NCoR, CaRF, n SNF, ScV, SnFrB, SCoRI	0238090a00
PENSTEMON humilis A. Gray var. humilis	CaRH, n&c SNH, GB	0402c40006
PENSTEMON incertus Brandegee	s SNH, Teh, SnBr, nw DMtns	4000008500
PENSTEMON janishiae N. Holmgren	MP	0002000004
PENSTEMON labrosus (A. Gray) Hook.f.	TR, PR	0040005401
PENSTEMON laetus A. Gray	KR, CaR, SN, WTR	0601f88101
PENSTEMON laetus A. Gray var. laetus	SN, WTR	0000f88101
PENSTEMON laetus A. Gray var. leptosepalus A. Gray	s CaR, n SN	0600480000
PENSTEMON laetus A. Gray var. sagittatus (Keck) McMinn	KR, CaR	0601000000
PENSTEMON monoensis A.A. Heller	W&I	0000000002
PENSTEMON neotericus Keck	CaR, n SN	0600480000
PENSTEMON newberryi A. Gray	KR, NCoR, CaRH, SNH, n Teh	0439c08100
PENSTEMON newberryi A. Gray var. berryi (Eastw.) N. Holmgren	KR	0001000000
PENSTEMON newberryi A. Gray var. newberryi	NCoRH, CaRH, SNH, n Teh	0408c08100
PENSTEMON newberryi A. Gray var. sonomensis (E. Greene) Jepson	NCoR (peaks of Lake, Napa, Sonoma cos.)	0038000000
PENSTEMON pahutensis N. Holmgren	ne DMtns (Grapevine Mtns)	4000000000
PENSTEMON palmeri A. Gray var. palmeri	e DMoj	6000000000
PENSTEMON papillatus J. Howell	c&s SNH, SNE	0000840102
PENSTEMON parvulus (A. Gray) Krautter	KR, s SNH	0001000100
PENSTEMON patens (M.E. Jones) N. Holmgren	c&s SNH, s SNE	0000840102
PENSTEMON personatus Keck	n SN (Butte, Plumas cos.)	0000480000
PENSTEMON procerus Graham	KR, NCoRH, n&c SNH	0009c00000
PENSTEMON procerus Graham var. brachyanthus (Pennell) Cronq.	KR, NCoRH	0009000000
PENSTEMON procerus Graham var. formosus (Nelson) Cronq.	KR, n&c SNH	0001c00000
PENSTEMON pseudospectabilis M.E. Jones	s DMtns, ne DSon	c000000000
PENSTEMON purpusii Brandegee	w KR, NCoRH	0009000000
PENSTEMON rattanii A. Gray	n NCo, w KR, n NCoRO, SnFrB	0025000800
PENSTEMON rattanii A. Gray var. kleei (E. Greene) A. Gray	SnFrB	0000000800
PENSTEMON rattanii A. Gray var. rattanii	n NCo, w KR, n NCoRO	0025000000
PENSTEMON roezlii Regel	KR, CaR, n&c SNH, MP	0603c00004
PENSTEMON rostriflorus Kellogg	c&s SNH, SW, SNE, DMtns	58c0845503
PENSTEMON rupicola (Piper) Howell	KR	0001000000
PENSTEMON rydbergii Nelson var. oreocharis (E. Greene) N. Holmgren	CaR, SNH, GB	0602c40106
PENSTEMON scapoides Keck	W&I, n DMtns (Last Chance Mtns)	4000000002
PENSTEMON speciosus Lindley	KR, CaR, SNH, WTR, SnGb, GB, n DMtns	4603c41107
PENSTEMON spectabilis Thurber	TR, PR	0040005401
PENSTEMON spectabilis Thurber var. spectabilis	SnGb, SnBr, PR	0040005400
PENSTEMON spectabilis Thurber var. subviscosus (Keck) McMinn	TR	0000001401
PENSTEMON stephensii Brandegee	DMtns	4000000000
PENSTEMON sudans M.E. Jones	s CaRH, MP	0402000004
PENSTEMON thompsoniae (A. Gray) Rydb.	e DMtns (New York, Clark mtns)	4000000000
PENSTEMON thurberi Torrey	PR, DMoj	6040004000
PENSTEMON tracyi Keck	s KR (n Trinity Co.)	0001000000
PENSTEMON utahensis Eastw.	e DMtns (Kingston, New York mtns)	4000000000
PENSTEMON venustus Lindley	s CaRH (sw Lassen Co.)	0400000000
PENTACHAETA alsinoides E. Greene	NCoRO, SNF, SnFrB, SCoR, w WTR	00203b0801
PENTACHAETA aurea Nutt.	SnGb, SnBr, PR	0040005400
PENTACHAETA bellidiflora E. Greene	SnFrB	0000000800
PENTACHAETA exilis (A. Gray) A. Gray	NCoR, SNF, GV, SnFrB, SCoR	00383b2a00
PENTACHAETA exilis (A. Gray) A. Gray ssp. aeolica Van Horn & Ornd.	SCoR	0000030000
PENTACHAETA exilis (A. Gray) A. Gray ssp. exilis	NCoR, SNF, GV, SnFrB	0038382a00
PENTACHAETA fragilis Brandegee	s SNF, se SCoRO	0000220000
PENTACHAETA lyonii A. Gray	c SCo (Los Angeles Co.), s ChI (Santa Catalina Island)	1080000000
PENTAGRAMMA pallida (Weath.) G. Yatskievych, M.D. Windham & E. Wollenweber	SN	0000f88100
PENTAGRAMMA triangularis (Kaulf.) G. Yatskievych, M.D. Windham & E. Wollenweber	CA-FP, SNE, DMtns	5ffdffff03
PENTAGRAMMA triangularis (Kaulf.) G. Yatskievych, M.D. Windham & E. Wollenweber ssp. maxonii (Weath.) G. Yatskievych, M.D. Windham & E. Wollenweber	SnBr, SnJt, DMtns	4000004400
PENTAGRAMMA triangularis (Kaulf.) G. Yatskievych, M.D. Windham & E. Wollenweber ssp. triangularis	CA-FP, SNE, DMtns	5ffdffff03
PENTAGRAMMA triangularis (Kaulf.) G. Yatskievych, M.D. Windham & E. Wollenweber ssp. viscosa (D. Eaton) G. Yatskievych, M.D. Windham & E. Wollenweber	SCo, ChI	1880000000
PERAPHYLLUM ramosissimum Nutt.	e CaRH, n&c SNH (e slope), GB	0402c40006
PERICOME caudata A. Gray	s SN, SNE	0000240102
PERIDERIDIA bacigalupii Chuang & Constance	n&c SNF	0000180000
PERIDERIDIA bolanderi (A. Gray) Nelson & J.F. Macbr.	KR, CaRH, n&c SNF, SNH, MP, n SNE	0403dc0104
PERIDERIDIA bolanderi (A. Gray) Nelson & J.F. Macbr. ssp. bolanderi	KR, CaRH, SNH, GB	0403c40106
PERIDERIDIA bolanderi (A. Gray) Nelson & J.F. Macbr. ssp. involucrata Chuang & Constance	n&c SNF	0000180000
PERIDERIDIA californica (Torrey) Nelson & J.F. Macbr.	c SNF, SnFrB, n SCoR, s SCoR	0000130800
PERIDERIDIA gairdneri (Hook. & Arn.) Mathias	s NCo, KR, NCoRH, CCo, SCo, Wrn	018d000004
PERIDERIDIA gairdneri (Hook. & Arn.) Mathias ssp. borealis Chuang & Constance	KR, NCoRH, Wrn	0009000004
PERIDERIDIA gairdneri (Hook. & Arn.) Mathias ssp. gairdneri	s NCo (Sonoma Co.), CCo (scarce s of Monterey Co.), SCo	0184000000
PERIDERIDIA howellii (J. Coulter & Rose) Mathias	KR, NCoRO, CaR, n&c SNF	0621180000
PERIDERIDIA kelloggii (A. Gray) Mathias	NCo, CaRF, n&c SNF, CCo, SnFrB	0304180800
PERIDERIDIA lemmonii (J. Coulter & Rose) Chuang & Constance	SN, n SNE	0000fc8100
PERIDERIDIA leptocarpa Chuang & Constance	KR	0001000000
PERIDERIDIA oregana (S. Watson) Mathias	KR, NCoR, CaRH, SnFrB, SCoRI, MP	043b010804
PERIDERIDIA parishii (J. Coulter & Rose) Nelson & J.F. Macbr.	KR, CaR, SNH, TR, PR	0641c05501
PERIDERIDIA parishii (J. Coulter & Rose) Nelson & J.F. Macbr. ssp. latifolia (A. Gray) Chuang & Constance	KR, CaR, SNH, TR, PR	0641c05501
PERIDERIDIA parishii (J. Coulter & Rose) Nelson & J.F. Macbr. ssp. parishii	SnBr	0000000400
PERIDERIDIA pringlei (J. Coulter & Rose) Nelson & J.F. Macbr.	Teh, SCoR, WTR	0000038001
PERITYLE emoryi Torrey	D (uncommon SCo, ChI)	f880000000
PERITYLE inyoensis (Ferris) A. Powell	W&I (s Inyo Mtns)	0000000002
PERITYLE megalocephala (S. Watson) J.F. Macbr.	W&I, DMtns	4000000002
PERITYLE megalocephala (S. Watson) J.F. Macbr. var. megalocephala	W&I, DMtns	4000000002
PERITYLE megalocephala (S. Watson) J.F. Macbr. var. oligophylla A. Powell	W&I, DMtns	4000000002
PERITYLE villosa (S.F. Blake) Shinn.	W&I (Inyo Mtns), n DMtns (Panamint, Grapevine mtns)	4000000002
PETALONYX linearis E. Greene	se DMoj, DSon	e000000000
PETALONYX nitidus S. Watson	W&I, DMtns	4000000002
PETALONYX thurberi A. Gray	D	e000000000
PETALONYX thurberi A. Gray ssp. gilmanii (Munz) W.S. Davis & H.J. Thompson	n DMoj	2000000000
PETALONYX thurberi A. Gray ssp. thurberi	D	e000000000
PETASITES frigidus (L.) Fries var. palmatus (Aiton) Cronq.	NW, nw&nc CW	013d030800
PETERIA thompsoniae S. Watson	DMtns (California Valley, se Inyo Co.)	4000000000
PETRADORIA pumila (Nutt.) E. Greene ssp. pumila	DMtns	4000000000
PETROPHYTON caespitosum (Nutt.) Rydb.	s SNH, W&I, DMtns	4000000102
PETROPHYTON caespitosum (Nutt.) Rydb. ssp. acuminatum (Rydb.) Munz	s SNH	0000000100
PETROPHYTON caespitosum (Nutt.) Rydb. ssp. caespitosum	W&I, DMtns	4000000002
PETRORHAGIA dubia (Raf.) G. Lopez & Romo	NCoR, CaRF, n SNF, n&c SNH, ScV, SCoRO	0238ca0200
PETRORHAGIA nanteuilii (Burnat) P. Ball & Heyw.	s NCoRO (Sonoma Co.)	0020000000
PETRORHAGIA prolifera (L.) P. Ball & Heyw.	c SNH (Mariposa Co.)	0000800000
PETROSELINUM crispum (Miller) A.W. Hill	CA-FP	1ffdfbff01
PETUNIA parviflora A.L. Juss.	CW, SCo, n ChI (Santa Rosa Island), PR, DSon	89c0034800
PEUCEPHYLLUM schottii A. Gray	D	e000000000
PHACELIA adenophora J. Howell	n SNH, MP	0002400004
PHACELIA affinis A. Gray	s SCoRI (Caliente Mtn), TR, PR, W&I, D	e040015403
PHACELIA amabilis Constance	s W&I (Inyo Mtns)	0000000002
PHACELIA anelsonii J.F. Macbr.	e DMtns (New York Mtns)	4000000000
PHACELIA argentea A. Nelson & J.F. Macbr	n NCo (Del Norte Co.)	0004000000
PHACELIA austromontana J. Howell	c&s SN, TR, SnJt, W&I, DMtns	4000b05503
PHACELIA barnebyana J. Howell	W&I, ne DMtns (Clark Mtns)	4000000002
PHACELIA bicolor S. Watson var. bicolor	SNH (e slope), GB, DMoj	6002c40106
PHACELIA bolanderi A. Gray	NW	003d000000
PHACELIA brachyloba (Benth.) A. Gray	SCoR, SW (exc ChI)	00c0035401
PHACELIA breweri A. Gray	e SnFrB, n SCoRI	0000010800
PHACELIA californica Cham.	NCo, NCoRO, CCo, SnFrB	0124000800
PHACELIA calthifolia Brand	n DMoj	2000000000
PHACELIA campanularia A. Gray	DMoj, n&w DSon	e000000000
PHACELIA campanularia A. Gray ssp. campanularia	w DSon	8000000000
PHACELIA campanularia A. Gray ssp. vasiformis G. Gillett	DMoj, n DSon	e000000000
PHACELIA cicutaria E. Greene	SNF, Teh, SCoR, SW, w D	f8c03bd401
PHACELIA cicutaria E. Greene var. cicutaria	SNF, Teh	0000388000
PHACELIA cicutaria E. Greene var. hispida (A. Gray) J. Howell	SCoR, SW, w D	f8c0035401
PHACELIA cicutaria E. Greene var. hubbyi (J.F. Macbr.) J. Howell	n SCo, n ChI (Santa Cruz Island), WTR	0880000001
PHACELIA ciliata Benth	s NCoR, c&s SNF, Teh, s ScV (Sutter Buttes), SnJV, SnFrB, SCoRI, SW (exc ChI)	00f831fe01
PHACELIA coerulea E. Greene	e DMoj	6000000000
PHACELIA congdonii E. Greene	c&s SNF, Teh, e WTR	0000308001
PHACELIA cookei Constance & Heckard	n CaRH (Mount Shasta)	0400000000
PHACELIA corymbosa Jepson	KR, NCoR, CaRH	0439000000
PHACELIA crenulata Torrey	se MP, SNE, D	e002040006
PHACELIA crenulata Torrey var. ambigua (M.E. Jones) J.F. Macbr.	D	e000000000
PHACELIA crenulata Torrey var. crenulata	se MP, SNE, e DMoj	6002040006
PHACELIA crenulata Torrey var. minutiflora (J. Voss) Jepson	DSon	8000000000
PHACELIA cryptantha E. Greene	s SN, SNE, n DMoj	2000240102
PHACELIA curvipes S. Watson	s SN, Teh, TR, SNE, DMoj	6000249503
PHACELIA dalesiana J. Howell	KR	0001000000
PHACELIA davidsonii A. Gray	c&s SN, Teh, TR, PR	0040b0d501
PHACELIA distans Benth.	s NCoR, s ScV (Sutter Buttes), SnJV, CW, SW, SNE, D	f9f8077e03
PHACELIA divaricata (Benth.) A. Gray	s NW, SnFrB, n SCoRI	003d010800
PHACELIA douglasii (Benth.) Torrey	s SNF, Teh, s ScV, SnJV, CW, WTR, w DMoj	610023aa01
PHACELIA egena (Brand) J. Howell	NW (exc NCo), CaR, SN, GV, CW (exc CCo), WTR, SnGb	063dfbbb01
PHACELIA eisenii Brandegee	SN	0000f88100
PHACELIA exilis (A. Gray) G.J. Lee	s SN, WTR (Lockwood Valley), SnGb, SnBr	0000201501
PHACELIA floribunda E. Greene	s ChI (San Clemente Island)	1000000000
PHACELIA fremontii Torrey	s SN, SnJV, e SnFrB, SCoRI, TR, SNE, DMoj	6000253d03
PHACELIA glandulifera Piper	CaR, GB	0602040006
PHACELIA grandiflora (Benth.) A. Gray	SCo, ChI, WTR (s slope), SnGb (s slope)	1880001001
PHACELIA greenei J. Howell	KR	0001000000
PHACELIA grisea A. Gray	SCoRO, w WTR	0000020001
PHACELIA gymnoclada S. Watson	n SNE (Mono Co.)	0000040000
PHACELIA hastata Lehm.	KR, CaRH, SNH, SnBr, GB	0403c40506
PHACELIA hastata Lehm. ssp. compacta (Brand) Heckard	CaRH, SNH, Wrn, SNE	0400c40106
PHACELIA hastata Lehm. ssp. hastata	KR, CaRH, SNH, SnBr, GB	0403c40506
PHACELIA heterophylla Pursh ssp. virgata (E. Greene) Heckard	NW, CaR, n&c SN, GB	063fdc0006
PHACELIA humilis Torrey & A. Gray	SNH (e slope), Teh, GB	0002c48106
PHACELIA humilis Torrey & A. Gray var. dudleyi J. Howell	SNH (Mono Co.), Teh	0000c08100
PHACELIA humilis Torrey & A. Gray var. humilis	SNH (e slope), GB	0002c40106
PHACELIA hydrophylloides A. Gray	CaRH, SNH	0400c00100
PHACELIA imbricata E. Greene	NCoR, SN, GV, CW, SCo, TR, PR	01f8fbff01
PHACELIA imbricata E. Greene ssp. imbricata	NCoR, SN, GV, CW, SCo, TR	01b8fbbf01
PHACELIA imbricata E. Greene ssp. patula (Brand) Heckard	SnGb, SnBr, PR	0040005400
PHACELIA insularis Munz	NCo, n ChI	0804000000
PHACELIA insularis Munz var. continentis J. Howell	NCo	0004000000
PHACELIA insularis Munz var. insularis	n ChI (Santa Rosa, San Miguel Islands)	0800000000
PHACELIA inundata J. Howell	MP	0002000004
PHACELIA inyoensis (J.F. Macbr.) J. Howell	SNE	0000040002
PHACELIA ivesiana Torrey	D	e000000000
PHACELIA ixodes Kellogg	s SCo (San Diego Co.)	0080000000
PHACELIA lemmonii A. Gray	ne PR, SNE, DMoj, n DSon	e040044002
PHACELIA leonis J. Howell	KR	0001000000
PHACELIA linearis (Pursh) Holzinger	e KR, CaR, n SN, MP	0603480004
PHACELIA longipes A. Gray	WTR, SnGb, sw DMoj	6000001001
PHACELIA lyonii A. Gray	s ChI	1000000000
PHACELIA malvifolia Cham.	NCo, CW	0104030800
PHACELIA marcescens J.F. Macbr.	n&c SN	0000d80000
PHACELIA minor (Harvey) Thell	SCo, e WTR, SnGb, SnBr, PR, w DSon	80c0005401
PHACELIA mohavensis A. Gray	SnGb, SnBr	0000001400
PHACELIA monoensis R. Halse	n SNE (Mono Co.)	0000040000
PHACELIA mustelina Cov.	DMtns	4000000000
PHACELIA mutabilis E. Greene	KR, NCoR, CaRH, SNH, SnJt, MP	043bc04104
PHACELIA nashiana Jepson	s SNH, Teh (e slope)	0000008100
PHACELIA neglecta M.E. Jones	D	e000000000
PHACELIA nemoralis E. Greene	NCo, NCoRO, CW (exc SCoRI)	0124020800
PHACELIA nemoralis E. Greene ssp. nemoralis	NCoRO, CCo, SnFrB, SCoRO	0120020800
PHACELIA nemoralis E. Greene ssp. oregonensis Heckard	NCo, NCoRO	0024000000
PHACELIA novenmillensis Munz	s SNH (e slope)	0000000100
PHACELIA orogenes Brand	s SNH (Mineral King, Tulare Co.)	0000000100
PHACELIA pachyphylla A. Gray	D	e000000000
PHACELIA parishii A. Gray	w DMoj (nw San Bernardino Co)	6000000000
PHACELIA parryi Torrey	SCoRI, SW (exc ChI, w WTR)	00c0015401
PHACELIA pedicellata A. Gray	D	e000000000
PHACELIA peirsoniana J. Howell	n SNE, w NV	0000040000
PHACELIA perityloides Cov.	n W&I, n&e DMoj	6000000002
PHACELIA perityloides Cov. var. jaegeri Munz	e DMtns (Clark Mtn)	4000000000
PHACELIA perityloides Cov. var. perityloides	n W&I, n DMoj	2000000002
PHACELIA phacelioides (Benth.) Brand	e SnFrB, SCoRI	0000010800
PHACELIA platyloba A. Gray	c SNF	0000100000
PHACELIA pringlei A. Gray	KR	0001000000
PHACELIA procera A. Gray	KR, NCoRH, CaRH, n SNH	0409400000
PHACELIA pulchella A. Gray var. gooddingii (Brand) J. Howell	ne DMoj (Mesquite Valley, Kingston Range)	6000000000
PHACELIA purpusii Brandegee	s CaRH, SN, MP	0402f88104
PHACELIA quickii J. Howell	n&c SN	0000d80000
PHACELIA racemosa (Kellogg) Brandegee	CaR, n&c SN	0600d80000
PHACELIA ramosissima Lehm.	CA	ffffffff07
PHACELIA ramosissima Lehm. var. austrolitoralis Munz	CCo, SCo, n ChI	0980000000
PHACELIA ramosissima Lehm. var. eremophila (E. Greene) J.F. Macbr.	CaRH, SNH, Wrn, SNE	0400c40106
PHACELIA ramosissima Lehm. var. latifolia (Torrey) Cronq.	Teh, SnFrB, SCoR, SCo, TR, PR, n DMtns (Panamint Range)	40c003dc01
PHACELIA ramosissima Lehm. var. montereyensis Munz	NCo, CCo, n ChI	0904000000
PHACELIA ramosissima Lehm. var. ramosissima	KR, NCoRH, NCoRI, SN, Teh, CW, WTR, SnBr, DMtns (Panamint Range)	4119fb8d01
PHACELIA ramosissima Lehm. var. subglabra M. Peck	SNH, Teh, SnGb, SNE	0000c49102
PHACELIA rattanii A. Gray	KR, NCoR, s CaR, SnFrB, n SCoRI	0639010800
PHACELIA rotundifolia S. Wats.	W&I, D	e000000002
PHACELIA saxicola A. Gray	SNE, n DMoj	2000040002
PHACELIA sericea (Graham) A. Gray var. ciliosa Rydb	n KR (China Peak), Wrn	0001000004
PHACELIA stebbinsii Constance & Heckard	n SN (El Dorado Co.)	0000480000
PHACELIA stellaris Brand	SCo	0080000000
PHACELIA suaveolens E. Greene	NCoRI, c SNF, SnFrB, SCoRI, nw PR	0050110800
PHACELIA suaveolens E. Greene var. keckii (Munz & I. M. Johnston) J. Howell	nw PR (Santa Ana Mtns)	0040000000
PHACELIA suaveolens E. Greene var. suaveolens	NCoRI, c SNF (Ione), SnFrB, SCoRI	0010110800
PHACELIA tanacetifolia Benth.	s NCoRO, c&s SNF, Teh, s ScV (Sutter Buttes), SnJV, e SnFrB, SCoR, SW (exc ChI), DMoj	60e033fe01
PHACELIA tetramera J. Howell	SNE	0000040002
PHACELIA thermalis E. Greene	e CaR, MP	0602000004
PHACELIA umbrosa E. Greene	PR	0040004000
PHACELIA vallicola Brand	s CaR, n&c SN	0600d80000
PHACELIA vallis-mortae J. Voss	w SnJV, SNE, e DMoj, n DSon	e000042002
PHACELIA viscida (Benth.) Torrey	s CCo, SCoRO, SCo, ChI (exc San Clemente Island), WTR	1980020001
PHALACROSERIS bolanderi A. Gray	n&c SNH	0000c00000
PHALARIS angusta Nees	CA-FP	1ffdfbff01
PHALARIS aquatica L.	NW, c SN, CCo, SCo	01bd900000
PHALARIS arundinacea L.	CA-FP	1ffdfbff01
PHALARIS brachystachys Link	ScV (Butte Co.), SnFrB, SCoRO (San Luis Obispo Co.)	0000020a00
PHALARIS californica Hook. & Arn.	NCo, NCoRO, CCo, SnFrB, SCoRO	0124020800
PHALARIS canariensis L.	NCo, CCo, SnFrB, SCo	0184000800
PHALARIS caroliniana Walter	NCo, c SNF, CCo, SCoRO, SW	19c4125401
PHALARIS lemmonii Vasey	NCoRO, c SN, GV, SnFrB, SCoR, SCo	00a0932a00
PHALARIS minor Retz.	CA-FP	1ffdfbff01
PHALARIS paradoxa L.	GV, SW	18c0007601
PHASEOLUS filiformis Benth.	DSon (Coachella Valley, Riverside Co.)	8000000000
PHILADELPHUS lewisii Pursh	NW, CaR, SN	063df88100
PHILADELPHUS microphyllus A. Gray	e PR (San Jacinto, Santa Rosa mtns), W&I, e DMtns	4040004002
PHLEUM alpinum L.	NCo, KR, n&c NCoR, CaRH, SNH, SnBr, SnJt, SNE	043dc44502
PHLEUM pratense L.	CA-FP, GB	1fffffff07
PHLOX adsurgens A. Gray	NCoR	0038000000
PHLOX austromontana Cov.	SnGb, SnBr, PR	0040005400
PHLOX cespitosa Nutt.	GB	0002040006
PHLOX condensata (A. Gray) E. Nelson	SNH, SnBr, SNE	0000c40502
PHLOX diffusa Benth.	CA (exc SW, D)	073fffab06
PHLOX dispersa Sharsm.	s SNH (Tulare, Inyo cos.)	0000000100
PHLOX dolichantha A. Gray	SnBr	0000000400
PHLOX gracilis (Hook.) E. Greene	CA	ffffffff07
PHLOX hirsuta E. Nelson	n CaRH (Siskiyou Co.)	0400000000
PHLOX hoodii Richardson ssp. canescens (Torrey & A. Gray) Wherry	n SNH, GB	0002440006
PHLOX muscoides Nutt.	CaRH (Mount Lassen), nw MP (ne Siskiyou Co.)	0402000004
PHLOX pulvinata (Wherry) Cronq.	SNH, SNE	0000c40102
PHLOX speciosa Pursh	KR, NCoR, CaR, SN	0639f88100
PHLOX speciosa Pursh ssp. nitida (Suksd.) Wherry	KR, NCoR, CaR	0639000000
PHLOX speciosa Pursh ssp. occidentalis (Torrey) Wherry	KR, NCoR, CaR, SN	0639f88100
PHLOX stansburyi (Torrey) A.A. Heller	SNE, DMtns	4000040002
PHOENICAULIS cheiranthoides Torrey & A. Gray	NW, CaR, GB	063f040006
PHOENIX canariensis Chabaud	SnFrB, SCo	0080000800
PHOENIX dactylifera L.	SCo, DSon	8080000000
PHOLISMA arenarium Hook.	CCo, SCo, PR, D	e1c0004000
PHOLISMA sonorae (A. Gray) G. Yatskievych	DSon (se Imperial Co.)	8000000000
PHOLISTOMA auritum (Lindley) Lilja	NCoRI, s SN, c SNF, Teh, SnJV, CW, SW, ne DSon	99d033fd01
PHOLISTOMA auritum (Lindley) Lilja var. arizonicum (M.E. Jones) Constance	ne DSon (Whipple Mtns)	8000000000
PHOLISTOMA auritum (Lindley) Lilja var. auritum	NCoRI, s SN, c SNF, Teh, SnJV, CW, SW	19d033fd01
PHOLISTOMA membranaceum (Benth.) Constance	c&s SNF, Teh, SnJV, CW, SW, D	f9c033fc01
PHOLISTOMA racemosum (Nutt.) Constance	SCo, ChI, PR	18c0004000
PHORADENDRON californicum Nutt.	D	e000000000
PHORADENDRON densum Trel.	KR, NCoR, CaR, CW, TR, PR, GB, DMtns	477b075c07
PHORADENDRON juniperinum A. Gray	CaRH, SNH, SnBr, MP, W&I, DMtns	4402c00506
PHORADENDRON libocedri (Engelm.) Howell	KR, NCoR, CaRH, SNH, SCoRI, TR, PR	0479c15501
PHORADENDRON macrophyllum (Engelm.) Cockerell	NCoRO, NCoRI, SNF, GV, CW, SCo, TR, PR, D	e1f03b7e01
PHORADENDRON pauciflorum Torrey	c&s SN, TR	0000b01501
PHORADENDRON villosum (Nutt.) Nutt.	KR, NCoR, SNF, ScV, SCoR, SCo, TR, PR, SnFrB	00f93b5e01
PHRAGMITES australis (Cav.) Steudel	CA	ffffffff07
PHYLA lanceolata (Michaux) E. Greene	GV, CCo, SnFrB, SCo, D	e180002a00
PHYLA nodiflora (L.) E. Greene	NW (exc KR, NCoRH), GV, CCo, SnFrB, SCo, ChI (Santa Cruz, Santa Catalina islands), PR, DSon	99f4006a00
PHYLA nodiflora (L.) E. Greene var. incisa (Small) Mold.	SnJV, SCo, DSon	8080002000
PHYLA nodiflora (L.) E. Greene var. nodiflora	NW (exc KR, NCoRH), GV, CCo, SnFrB, SCo, ChI (Santa Cruz, Santa Catalina islands), PR, DSon	99f4006a00
PHYLLODOCE breweri (A. Gray) Maxim.	s CaRH (Magee Peak, nnw of Lassen Peak), SNH, SnBr	0400c00500
PHYLLODOCE empetriformis (Smith) D. Don	KR, n CaRH (Mount Shasta)	0401000000
PHYLLOSPADIX scouleri Hook.	NCo, CCo, SCo	0184000000
PHYLLOSPADIX torreyi S. Watson	NCo, CCo, SCo	0184000000
PHYSALIS acutifolia (Miers) Sandw.	s SnJV, SCo, DSon	8080002000
PHYSALIS crassifolia Benth.	PR, s SNE, D	e040044002
PHYSALIS hederifolia A. Gray	s PR, s SNE, DMoj	6040040002
PHYSALIS hederifolia A. Gray var. fendleri (A. Gray) Cronq.	s SNE (incl Inyo Mtns), DMoj	6000040002
PHYSALIS hederifolia A. Gray var. palmeri (A. Gray) C. Hitchc.	s PR, DMtns	4040000000
PHYSALIS lancifolia Nees	GV, SnFrB, SCoRI, DSon	8000012a00
PHYSALIS lobata Torrey	se DMoj, ne DSon	e000000000
PHYSALIS longifolia Nutt.	n CaRH (Shasta Valley) as waif	0400000000
PHYSALIS philadelphica Lam.	SNF, GV, CW, SCo, PR	01c03b6a00
PHYSALIS pubescens L.	s NCoRO, SnJV, s SNE, D, expected elsewhere	e020042002
PHYSALIS pubescens L. var. grisea Waterf.	s SNE, D	e000040002
PHYSALIS pubescens L. var. integrifolia (Dunal) Waterf.	s NCoRO, SnJV, expected elsewhere	0020002000
PHYSALIS viscosa L.	SCo	0080000000
PHYSARIA chambersii Rollins	n DMtns (Clark, Grapevine mtns)	4000000000
PHYSOCARPUS alternans (M.E. Jones) J. Howell	W&I, n DMtns	4000000002
PHYSOCARPUS capitatus (Pursh) Kuntze	CA-FP (exc GV)	1ffdfbdd01
PHYTOLACCA americana L.	CA-FP	1ffdfbff01
PICEA breweriana S. Watson	KR	0001000000
PICEA engelmannii Engelm.	KR, CaRH	0401000000
PICEA sitchensis (Bong.) Carri<#e8>re	NCo	0004000000
PICKERINGIA montana Nutt.	NCoR, n SNF, SnFrB, SCoR, n ChI, TR, PR	08780b5c01
PICKERINGIA montana Nutt. var. montana	NCoR, n SNF, SnFrB, SCoR, n ChI, TR	08380b1c01
PICKERINGIA montana Nutt. var. tomentosa (Abrams) I.M. Johnston	SnBr, PR	0040004400
PICRIS echioides L.	CA-FP	1ffdfbff01
PILOSTYLES thurberi A. Gray	s DSon (Riverside, San Diego, Imperial cos.)	8000000000
PILULARIA americana A. Braun	NCoRI, CaRF, n&c SNF, n SNH, GV, SCoR, SCo, WTR, PR	02d05b6201
PINGUICULA vulgaris L. ssp. macroceras (Link) Calder & Roy Taylor	n KR (n Del Norte, w Siskiyou cos.)	0001000000
PINUS albicaulis Engelm.	KR, CaRH, SNH, Wrn, SNE	0401c40106
PINUS attenuata Lemmon	NW, CaR, SN, e SnFrB, SCoR, SnBr, PR, MP	067ffbcd04
PINUS balfouriana Grev. & Balf.	KR, NCoRH, s SNH	0009000100
PINUS balfouriana Grev. & Balf. ssp. austrina Mastrogiuseppe & Mastrogiuseppe	s SNH	0000000100
PINUS balfouriana Grev. & Balf. ssp. balfouriana	KR, NCoRH	0009000000
PINUS contorta Loudon	NCo, KR, CaRH, SNH, SnGb, SnBr, SnJt, GB	0407c45506
PINUS contorta Loudon ssp. bolanderi (Parl.) Critchf.	NCo (Mendocino Co.)	0004000000
PINUS contorta Loudon ssp. contorta	NCo	0004000000
PINUS contorta Loudon ssp. murrayana (Grev. & Balf.) Critchf.	KR, CaRH, SNH, SnGb, SnBr, SnJt, GB	0403c45506
PINUS coulteri D. Don	CW, SW	19c0035c01
PINUS edulis Engelm.	DMtns (New York Mtns)	4000000000
PINUS flexilis James	SNH, TR, PR, SNE	0040c45503
PINUS jeffreyi Grev. & Balf.	KR, NCoR, CaR, SN, SCoRI, TR, PR, GB	067bfdd507
PINUS lambertiana Douglas	NW, CaR, SN, SW, w GB	1efffcd507
PINUS longaeva D. Bailey	W&I	0000000002
PINUS monophylla Torrey & Fr<#e9>mont	c&s SNH, Teh, se SCoRO, TR, PR, SNE, DMtns	404086d503
PINUS monticola Douglas	KR, NCoRH, CaRH, SNH, SNE, MP	040bc40106
PINUS muricata D. Don	NCo, CCo, n SnFrB, n ChI	0904000800
PINUS ponderosa Laws.	CA-FP (exc NCo, GV, SCo), SNE	1f79ffdd03
PINUS quadrifolia Parl.	SnJt, s PR	0040000000
PINUS radiata D. Don	CCo	0100000000
PINUS sabiniana Douglas	CA-FP (exc n NW, n CaR, SnJV), w GB, w D	ffffffdf07
PINUS torreyana Carri<#e8>re	s SCo, n ChI (Santa Rosa Island)	0880000000
PINUS washoensis H. Mason & Stockw.	CaRH, n SNH, Wrn	0400400004
PIPERIA candida R. Morgan & J. Ackerman	NW, sw SnFrB	003d000800
PIPERIA cooperi (S. Watson) Rydb.	SCo, s ChI (Santa Catalina Island), SnGb, PR	10c0005000
PIPERIA elegans (Lindley) Rydb.	NCo, w KR, NCoRO, CCo, SnFrB	0125000800
PIPERIA elongata Rydb.	CA-FP (exc GV, s ChI)	0ffdfbdd01
PIPERIA leptopetala Rydb.	NCoR, CaR, SN, SCoR, TR, PR	0678fbd501
PIPERIA michaelii (E. Greene) Rydb.	NCo, SNF, CCo, SnFrB, n SCo, n ChI (Santa Cruz Island), WTR	0984380801
PIPERIA transversa Suksd.	NW, SN, CW, TR, PR	017dfbdd01
PIPERIA unalascensis (Sprengel) Rydb.	CA-FP (exc SW), MP	073ffbab04
PIPERIA yadonii R. Morgan & J. Ackerman	c CCo (n Monterey Co.)	0100000000
PIPTATHERUM micranthum (Trin. & Rupr.) Barkworth	W&I, DMtns	4000000002
PIPTATHERUM miliaceum (L.) Cosson	NCo, GV, CW, SCo	0184032a00
PIPTOCHAETIUM setosum (Trin.) Arechav.	n SnFrB (Marin Co.)	0000000800
PISTACIA atlantica Desf.	ScV, expected elsewhere	0000000200
PISTIA stratiotes L.	e DSon (Colorado River), expected elsewhere	8000000000
PISUM sativum L.	CA-FP	1ffdfbff01
PITTOSPORUM crassifolium Cunn.	CCo, expected elsewhere	0100000000
PITTOSPORUM tenuifolium Gaertner	CCo (San Francisco Peninsula), expected elsewhere	0100000000
PITTOSPORUM tobira (Thunb.) Aiton	SCo	0080000000
PITTOSPORUM undulatum Vent.	CCo, SCo	0180000000
PITYOPUS californicus (Eastw.) H. Copel.	NCo, KR, NCoRO, s SNH, CCo, SnFrB	0125000900
PLAGIOBOTHRYS acanthocarpus (Piper) I.M. Johnston	s ScV, SnJV, SCo (mesas near San Diego), SnFrB	0080002a00
PLAGIOBOTHRYS arizonicus (A. Gray) A. Gray	Teh, e SnFrB, SCoRI, TR, W&I, D	e000019c03
PLAGIOBOTHRYS austinae (E. Greene) I.M. Johnston	CaRF, SNF, e ScV, ne SnJV	0200382200
PLAGIOBOTHRYS bracteatus (T.J. Howell) I.M. Johnston	CA-FP (esp SW)	1ffdfbff01
PLAGIOBOTHRYS canescens Benth.	CaRF, SNF, GV, SW, w DMoj	7ac0387601
PLAGIOBOTHRYS chorisianus (Cham.) I.M. Johnston	CCo, SnFrB	0100000800
PLAGIOBOTHRYS chorisianus (Cham.) I.M. Johnston var. chorisianus	CCo, sw SnFrB	0100000800
PLAGIOBOTHRYS chorisianus (Cham.) I.M. Johnston var. hickmanii (E. Greene) I.M. Johnston	c CCo	0100000000
PLAGIOBOTHRYS cognatus (E. Greene) I.M. Johnston	c SN, NCoRI	0010900000
PLAGIOBOTHRYS collinus (Phil.) I.M. Johnston	s SN, s SnJV, CW, SW, nw DSon (San Gorgonio Pass)	99c0237d01
PLAGIOBOTHRYS collinus (Phil.) I.M. Johnston var. californicus (A. Gray) Higgins	s SN, s SnJV, CW, SW, nw DSon (San Gorgonio Pass)	99c0237d01
PLAGIOBOTHRYS collinus (Phil.) I.M. Johnston var. fulvescens (I.M. Johnston) Higgins	SCoRO, SW	18c0025401
PLAGIOBOTHRYS collinus (Phil.) I.M. Johnston var. gracilis (I.M. Johnston) Higgins	s SCo (near San Diego), ChI	1880000000
PLAGIOBOTHRYS collinus (Phil.) I.M. Johnston var. ursinus (A. Gray) Higgins	SnBr, SnJt	0000004400
PLAGIOBOTHRYS cusickii (E. Greene) I.M. Johnston	GB	0002040006
PLAGIOBOTHRYS distantiflorus (Piper) M. Peck	n&c SNF	0000180000
PLAGIOBOTHRYS fulvus (Hook. & Arn.) I.M. Johnston	NCoR, SNF, SnFrB	0038380800
PLAGIOBOTHRYS glaber (A. Gray) I.M. Johnston	CCo, s SnFrB (esp near Hollister)	0100000800
PLAGIOBOTHRYS glyptocarpus (Piper) I.M. Johnston	NW, CaR, n SNF	063d080000
PLAGIOBOTHRYS glyptocarpus (Piper) I.M. Johnston var. glyptocarpus	NW, CaR	063d000000
PLAGIOBOTHRYS glyptocarpus (Piper) I.M. Johnston var. modestus I.M. Johnston	n SNF (near Grass Valley, Nevada Co.)	0000080000
PLAGIOBOTHRYS greenei (A. Gray) I.M. Johnston	NCoR, CaRF, SNF, ScV, n SnJV	0238382200
PLAGIOBOTHRYS hispidulus (E. Greene) I.M. Johnston	KR, SN, TR, PR	0041f8d501
PLAGIOBOTHRYS hispidus A. Gray	CaR, GB	0602040006
PLAGIOBOTHRYS humistratus (E. Greene) I.M. Johnston	GV (foothills)	0000002200
PLAGIOBOTHRYS hystriculus (Piper) I.M. Johnston	sw ScV (Solano Co.)	0000000200
PLAGIOBOTHRYS infectivus I.M. Johnston	SnFrB, SCoRI	0000010800
PLAGIOBOTHRYS jonesii A. Gray	SNE, D	e000040002
PLAGIOBOTHRYS kingii (S. Watson) A. Gray	GB, DMoj	6002040006
PLAGIOBOTHRYS kingii (S. Watson) A. Gray var. harknessii (E. Greene) Jepson	GB	0002040006
PLAGIOBOTHRYS kingii (S. Watson) A. Gray var. kingii	SNE, DMoj	6000040002
PLAGIOBOTHRYS leptocladus (E. Greene) I.M. Johnston	SW, w DMoj	78c0005401
PLAGIOBOTHRYS lithocaryus (E. Greene) I.M. Johnston	s NCoRI (valleys near Mayacamas Range)	0010000000
PLAGIOBOTHRYS mollis (A. Gray) I.M. Johnston	n SNH, SnFrB	0000400800
PLAGIOBOTHRYS mollis (A. Gray) I.M. Johnston var. mollis	n SNH	0000400000
PLAGIOBOTHRYS mollis (A. Gray) I.M. Johnston var. vestitus (E. Greene) I.M. Johnston	SnFrB (near Petaluma, s Sonoma Co)	0000000800
PLAGIOBOTHRYS myosotoides (Lehm.) Brand	s SNF (Fresno, Tulare cos.), SnFrB (Santa Clara Co.)	0000200800
PLAGIOBOTHRYS nothofulvus (A. Gray) A. Gray	CA-FP, rarely edge of D	bffdfbff01
PLAGIOBOTHRYS parishii I.M. Johnston	SNE, DMoj	6000040002
PLAGIOBOTHRYS reticulatus (Piper) I.M. Johnston	NW, SnFrB	003d000800
PLAGIOBOTHRYS reticulatus (Piper) I.M. Johnston var. reticulatus	NW, SnFrB	003d000800
PLAGIOBOTHRYS reticulatus (Piper) I.M. Johnston var. rossianorum I.M. Johnston	NW, SnFrB	003d000800
PLAGIOBOTHRYS salsus (Brandegee) I.M. Johnston	ne DMoj (e Inyo Co)	6000000000
PLAGIOBOTHRYS scriptus (E. Greene) I.M. Johnston	n SNF, c SNF (Stanislaus Co.)	0000180000
PLAGIOBOTHRYS shastensis A. Gray	NW, n&c SNF, SnFrB, SCoRI	003d190800
PLAGIOBOTHRYS stipitatus (E. Greene) I.M. Johnston	CA-FP, GB	1fffffff07
PLAGIOBOTHRYS stipitatus (E. Greene) I.M. Johnston var. micranthus (Piper) I.M. Johnston	CA-FP, GB	1fffffff07
PLAGIOBOTHRYS stipitatus (E. Greene) I.M. Johnston var. stipitatus	CA-FP (esp GV, NW)	1ffdfbff01
PLAGIOBOTHRYS strictus (E. Greene) I.M. Johnston	s NCoRI (Calistoga, Napa Co.)	0010000000
PLAGIOBOTHRYS tenellus (Nutt.) A. Gray	CA-FP, GB (uncommon), D	ffffffff07
PLAGIOBOTHRYS tener (E. Greene) I.M. Johnston	NCoR, CaR, n SN, MP	063a480004
PLAGIOBOTHRYS torreyi (A. Gray) A. Gray	SNH, SnBr	0000c00500
PLAGIOBOTHRYS torreyi (A. Gray) A. Gray var. diffusus I.M. Johnston	SNH, SnBr	0000c00500
PLAGIOBOTHRYS torreyi (A. Gray) A. Gray var. torreyi	SNH (Yosemite Valley area)	0000c00100
PLAGIOBOTHRYS trachycarpus (A. Gray) I.M. Johnston	SnJV, SnFrB, SCo, WTR	0080002801
PLAGIOBOTHRYS uncinatus J. Howell	n SCoR (Gabilan Range, Santa Lucia Mtns)	0000030000
PLAGIOBOTHRYS undulatus (Piper) I.M. Johnston	NCo, NCoRO, s ScV, CCo, SnFrB, SCoRO, SCo, WTR, PR	01e4024a01
PLANTAGO aristata Michaux	NCo, GV, SCo (expected elsewhere)	0084002200
PLANTAGO coronopus L.	NCo, n SNF (Amador Co.), ScV, CCo, SCo (Ventura Co.), s ChI (Santa Catalina Island)	1184080200
PLANTAGO elongata Pursh	CA-FP (exc CaR, SN)	19fd037e01
PLANTAGO erecta E. Morris	CA-FP	1ffdfbff01
PLANTAGO eriopoda Torrey	KR, n CaR, SNE (Mono Co.)	0601040002
PLANTAGO indica L.	CCo, SnFrB, SCo	0180000800
PLANTAGO lanceolata L.	CA-FP	1ffdfbff01
PLANTAGO major L.	CA-FP (exc SN), GB	1fffffff07
PLANTAGO maritima L.	NCo, CCo, SnFrB, n ChI	0904000800
PLANTAGO ovata Forsskal	CW, SW, SNE, D	f9c0075c03
PLANTAGO patagonica Jacq.	SnBr, SnJt, DMoj	6000004400
PLANTAGO pusilla Nutt.	SCo (San Diego Co.)	0080000000
PLANTAGO subnuda Pilger	NCo, CCo, SnFrB, SCo, n ChI	0984000800
PLANTAGO truncata Cham. ssp. firma (Kunze) Pilger	ScV, SnFrB	0000000a00
PLANTAGO virginica L.	CaRF (Shasta Co.), SCo	0280000000
PLATANTHERA hyperborea (L.) Lindley	KR, SNH (e slope), n W&I	0001c00102
PLATANTHERA leucostachys Lindley	CA-FP (exc GV), GB	1fffffdd07
PLATANTHERA sparsiflora (S. Watson) Schltr.	NW (exc NCoRI), SNH, TR, PR, SNE	006dc45503
PLATANTHERA stricta Lindley	KR, CaR, MP	0603000004
PLATANUS racemosa Nutt.	c&s SNF, Teh, GV, CW, SW, w DSon	99c033fe01
PLATYSTEMON californicus Benth.	CA-FP, w D	fffdfbff01
PLECTRITIS brachystemon Fischer & C. Meyer	NW, CaR, n SN, GV, CW, SCo	07bd4b2a00
PLECTRITIS ciliosa (E. Greene) Jepson	CA-FP (exc NCo)	1ff9fbff01
PLECTRITIS ciliosa (E. Greene) Jepson ssp. ciliosa	CA-FP (exc NCo, SW)	0739fbab00
PLECTRITIS ciliosa (E. Greene) Jepson ssp. insignis (Suksd.) D. Morey	CA-FP (exc NCo)	1ff9fbff01
PLECTRITIS congesta (Lindley) A. DC.	NW, CW	013d030800
PLECTRITIS macrocera Torrey & A. Gray	CA-FP (exc SW)	073dfbab00
PLEURAPHIS jamesii Torrey	SNE, n&e DMtns	4000040002
PLEURAPHIS rigida Thurber	PR, e&s DMoj, DSon	e040004000
PLEURICOSPORA fimbriolata A. Gray	NCo, KR, NCoRO, CaRH, SNH, SnFrB	0425c00900
PLEUROCORONIS pluriseta (A. Gray) R. King & H. Robinson	D	e000000000
PLEUROPOGON californicus (Nees) Vasey	NW, CaRF, n&c SNF, SnFrB	023d180800
PLEUROPOGON hooverianus (L. Benson) J. Howell	s NCo, n CCo	0104000000
PLEUROPOGON refractus (A. Gray) Benth.	NCo, KR, NCoRO	0025000000
PLUCHEA odorata (L.) Cass.	s SNF, GV, SnFrB, SCo, ChI, D	f880202a00
PLUCHEA sericea (Nutt.) Cov.	SnJV, SCoRI, SCo, s ChI, TR, PR, D	f0c0017401
POA annua L.	CA (esp near coast)	ffffffff07
POA atropurpurea Scribner	SnBr, PR	0040004400
POA bigelovii Vasey & Scribner	SW, D	f8c0005401
POA bolanderi Vasey	NW, SNH, SnJt	003dc04100
POA bulbosa L.	CA	ffffffff07
POA compressa L.	CA	ffffffff07
POA confinis Vasey	NCo	0004000000
POA cusickii Vasey	KR, SNH, GB	0003c40106
POA cusickii Vasey ssp. cusickii	e KR, n SNH, GB	0003440006
POA cusickii Vasey ssp. epilis (Scribner) W.A. Weber	SNH	0000c00100
POA cusickii Vasey ssp. pallida R. Soreng	c&s SNH, W&I	0000800102
POA cusickii Vasey ssp. purpurascens (Vasey) R. Soreng	KR, n SNH	0001400000
POA douglasii Nees	s NCo, CCo, n ChI	0904000000
POA fendleriana (Steudel) Vasey ssp. longiligula (Scribner & Williams) R. Soreng	s SNH, GB, DMtns	4002040106
POA glauca M. Vahl. ssp. rupicola (Nash) W.A. Weber	c&s SNH, W&I	0000800102
POA howellii Vasey & Scribner	CA-FP	1ffdfbff01
POA infirma Kunth	s GV, s CW, SW	19c0037e01
POA keckii R. Soreng	SNH, SNE (White, Sweetwater Mtns)	0000c40102
POA kelloggii Vasey	NCo, n CCo	0104000000
POA leptocoma Trin. ssp. leptocoma	KR, CaRH, n&c SNH, GB	0403c40006
POA lettermanii Vasey	s SNH, W&I	0000000102
POA macrantha Vasey	n&c NCo	0004000000
POA napensis Beetle	se NCoRO (near Calistoga, Napa Co.)	0020000000
POA nemoralis L.	NW, SN	003df88100
POA palustris L.	NW, CaRH, SnGb, SnBr, SNE	043d041402
POA pattersonii Vasey	SNH, W&I	0000c00102
POA piperi A. Hitchc.	nw KR (Del Norte Co.)	0001000000
POA pratensis L. ssp. pratensis	CA	ffffffff07
POA pringlei Scribner	KR, CaRH, n SNH, W&I	0401400002
POA rhizomata A. Hitchc.	KR (Siskiyou, n Trinity cos.)	0001000000
POA secunda J.S. Presl	CA	ffffffff07
POA secunda J.S. Presl ssp. juncifolia (Scribner) R. Soreng	CaRH, SNH (esp e slope), GB	0402c40106
POA secunda J.S. Presl ssp. secunda	CA	ffffffff07
POA sierrae J. Howell	n SNF	0000080000
POA stebbinsii R. Soreng	c&s SNH	0000800100
POA tenerrima Scribner	SNF, se SnFrB, SCoR, WTR	00003b0801
POA trivialis L.	NCo, NCoRO, probably elsewhere	0024000000
POA unilateralis Vasey	NCo, n&c CCo	0104000000
POA wheeleri Vasey	KR, NCoRH, CaRH, SNH, GB	040bc40106
PODISTERA nevadensis (A. Gray) S. Watson	n&c SNH, SnBr, W&I	0000c00402
POGOGYNE abramsii J. Howell	s SCo (San Diego Co.)	0080000000
POGOGYNE clareana J. Howell	SCoRO (Ft. Hunter-Liggett, Monterey Co., only known locality)	0000020000
POGOGYNE douglasii Benth.	NCoRO, NCoRI, SNF, GV, CW	01303b2a00
POGOGYNE floribunda Jokerst	MP	0002000004
POGOGYNE nudiuscula A. Gray	s SCo (San Diego Co.)	0080000000
POGOGYNE serpylloides (Torrey) A. Gray	NCoR, n&c SNF, SnFrB, SCoRO	00381a0800
POGOGYNE zizyphoroides Benth.	NCoRO, n&c SNF, GV, SnFrB	0020182a00
POLANISIA dodecandra (L.) DC. ssp. trachysperma (Torrey & A. Gray) Iltis	ScV, MP	0002000204
POLEMONIUM californicum Eastw.	KR, CaRH, n&c SNH	0401c00000
POLEMONIUM carneum A. Gray	w NW, CCo, SnFrB	013d000800
POLEMONIUM chartaceum H. Mason	KR, SNE (Sweetwater Mtns), W&I	0001040002
POLEMONIUM eximium E. Greene	c&s SNH	0000800100
POLEMONIUM micranthum Benth.	KR, CaRH, n SNH, s SnJV, se SCoRO, n WTR, MP	0403422005
POLEMONIUM occidentale E. Greene	KR, SN, SnBr, SNE	0001fc8502
POLEMONIUM pulcherrimum Hook.	KR, NCoRH, CaRH, n&c SNH, MP, n SNE	040bc40004
POLEMONIUM pulcherrimum Hook. var. pilosum (E. Greene) Brand	CaRH, MP	0402000004
POLEMONIUM pulcherrimum Hook. var. pulcherrimum	KR, NCoRH, n&c SNH, n SNE	0009c40000
POLIOMINTHA incana (Torrey) A. Gray	s DMoj (Cushenbury Springs)	6000000000
POLYCARPON depressum Nutt.	SCoRO, SCo, s ChI (Santa Catalina Island)	1080020000
POLYCARPON tetraphyllum (L.) L.	NCoRO, n SNF, ScV, CCo, SCo, SnGb	01a0081200
POLYCTENIUM fremontii (S. Watson) E. Greene	GB	0002040006
POLYCTENIUM fremontii (S. Watson) E. Greene var. confertum Rollins	SNE	0000040002
POLYCTENIUM fremontii (S. Watson) E. Greene var. fremontii	MP	0002000004
POLYGALA acanthoclada A. Gray	DMoj (Eagle and New York Mtns, Lucerne Valley)	6000000000
POLYGALA californica Nutt.	NW, CW, n ChI	093d030800
POLYGALA cornuta Kellogg	KR, CaR, SN, s SCoRO, TR, PR	0641fad501
POLYGALA cornuta Kellogg var. cornuta	KR, CaR, SN	0601f88100
POLYGALA cornuta Kellogg var. fishiae (C. Parry) Jepson	s SCoRO, TR, PR	0040025401
POLYGALA heterorhyncha (Barneby) T. Wendt	DMtns (Funeral Mtns, Inyo Co)	4000000000
POLYGALA intermontana T. Wendt	SNE (n Mono Co)	0000040002
POLYGALA subspinosa S. Watson	MP (Lassen Co)	0002000004
POLYGONUM amphibium L.	CA-FP, w DMoj	7ffdfbff01
POLYGONUM amphibium L. var. emersum Michaux	CA-FP, w DMoj	7ffdfbff01
POLYGONUM amphibium L. var. stipulaceum Coleman	CA-FP	1ffdfbff01
POLYGONUM arenastrum Boreau	CA	ffffffff07
POLYGONUM argyrocoleon Kunze	CA (esp s)	ffffffff07
POLYGONUM baldschuanicum Regel	SnFrB, SCo, expected elsewhere	0080000800
POLYGONUM bidwelliae S. Watson	CaR, ne ScV (Butte, Tehama, Shasta cos.)	0600000200
POLYGONUM bistortoides Pursh	CA-FP	1ffdfbff01
POLYGONUM bolanderi Brewer	NW (esp Napa Co.), CaR, n&c SN	063dd80000
POLYGONUM californicum Meissner	NW, CaR, SN, GV, sw MP	063ff8a304
POLYGONUM capitatum D. Don	NW, CW, SW	19fd035c01
POLYGONUM convolvulus L.	CA-FP	1ffdfbff01
POLYGONUM cuspidatum Siebold & Zucc.	n CA-FP (esp s NCoR, SnFrB)	1ffdfbff01
POLYGONUM davisiae A. Gray	KR, NCoRH, CaRH, n&c SNH	0409c00000
POLYGONUM douglasii E. Greene	CA (esp mtns, coast)	ffffffff07
POLYGONUM douglasii E. Greene ssp. austiniae (E. Greene) E. Murray	MP	0002000004
POLYGONUM douglasii E. Greene ssp. douglasii	CA	ffffffff07
POLYGONUM douglasii E. Greene ssp. johnstonii (Munz) J. Hickman	KR, CaR, SN, TR, PR	0641f8d501
POLYGONUM douglasii E. Greene ssp. majus (Meissner) J. Hickman	NCoR, CaR, SN, SnBr?, w MP	063af88504
POLYGONUM douglasii E. Greene ssp. spergulariiforme (Meissner) J. Hickman	NW, CaR, n SN, SnFrB, w MP	063f480804
POLYGONUM hydropiper L.	n&c CA-FP	1ffdfbff01
POLYGONUM hydropiperoides Michaux	CA-FP	1ffdfbff01
POLYGONUM lapathifolium L.	CA	ffffffff07
POLYGONUM marinense T. Mert. & Raven	SnFrB (esp Marin Co.)	0000000800
POLYGONUM minimum S. Watson	NW, CaR, SN	063df88100
POLYGONUM newberryi Small	CaRH (esp Mount Shasta), n&c SNH, MP	0402c00004
POLYGONUM paronychia Cham. & Schldl.	NCo, CCo	0104000000
POLYGONUM parryi E. Greene	NW, CaR, SN, SnFrB, PR	067df8c900
POLYGONUM patulum M. Bieb.	Deltaic GV, SnFrB	0000002a00
POLYGONUM pensylvanicum L.	e ScV, expected elsewhere	0000000200
POLYGONUM persicaria L.	CA	ffffffff07
POLYGONUM phytolaccifolium Meissner	KR, NCoRH, n&c SNH, MP	000bc00004
POLYGONUM polygaloides Meissner	NW, CaR, SN, TR, PR, MP	067ff8d505
POLYGONUM polygaloides Meissner ssp. confertiflorum (Piper) J. Hickman	NW, CaR, n SN, MP	063f480004
POLYGONUM polygaloides Meissner ssp. esotericum (Wheeler) J. Hickman	MP (near Goose Lake, Modoc Co.; Sierra Valley, s Plumas Co.)	0002000004
POLYGONUM polygaloides Meissner ssp. kelloggii (E. Greene) J. Hickman	NW, CaR, SN, TR, PR	067df8d501
POLYGONUM polystachyum Meissner	NCo (esp Del Norte, Humboldt cos.), n CCo	0104000000
POLYGONUM prolificum (Small) Robinson	n SNH (Lake Tahoe Area), SnFrB (Napa Co.), expected elsewhere	0000400800
POLYGONUM punctatum Elliott	CA	ffffffff07
POLYGONUM ramosissimum Michaux	n CA-FP	1ffdfbff01
POLYGONUM sachalinense Maxim.	n CA-FP	1ffdfbff01
POLYGONUM shastense A. Gray	CaRH, SNH	0400c00100
POLYPODIUM californicum Kaulf.	NCo, CCo, SCoRO, SW (exc SnJt)	19c4021401
POLYPODIUM calirhiza S. Whitmore & A. R. Smith	NW (exc NCoRH), CaRF, SN (exc s SNF), ScV (Sutter Buttes), CW	033ddb8b00
POLYPODIUM glycyrrhiza D. Eaton	NCo, KR, NCoRO, NCoRI, n SNF, n&c SNH, CCo, SnFrB	0135c80800
POLYPODIUM hesperium Maxon	KR, n&c SNH, SnBr, SnJt, W&I, e DMtns (New York Mtns)	4001c04402
POLYPODIUM scouleri Hook. & Grev.	NCo, NCoRO, CCo, SnFrB	0124000800
POLYPOGON australis Brongn.	NCoRO, SN, GV, SW	18e0f8f701
POLYPOGON elongatus Kunth	SnFrB, SCoR	0000030800
POLYPOGON interruptus Kunth	CA	ffffffff07
POLYPOGON maritimus Willd.	NW, SNF, GV	003d382200
POLYPOGON monspeliensis (L.) Desf.	CA	ffffffff07
POLYSTICHUM californicum (D. Eaton) Diels	NCoRO, SN (1 site), CCo, SnFrB, SCoRO, SnBr (1 site)	0120fa8d00
POLYSTICHUM dudleyi Maxon	NCoRO, CCo, SnFrB, SCoRO	0120020800
POLYSTICHUM imbricans (D. Eaton) D.H. Wagner	KR, NCoR, CaRH, n SNF, SNH, SnFrB, SCoRO, SCo, TR, PR, MP	04fbca5d05
POLYSTICHUM imbricans (D. Eaton) D.H. Wagner ssp. curtum (Ewan) D.H. Wagner	n&c SNH, SnFrB, SCoRO, SCo, TR, PR	00c0c25c01
POLYSTICHUM imbricans (D. Eaton) D.H. Wagner ssp. imbricans	KR, NCoR, CaRH, n SNF, SNH, SnFrB, SCoRO, WTR, MP	043bca0905
POLYSTICHUM kruckebergii W. Wagner	CaRH, n&c SNH, SnBr	0400c00400
POLYSTICHUM lemmonii L. Underw.	KR, NCoRH, CaRH, n SNH	0409400000
POLYSTICHUM lonchitis (L.) Roth	KR, NCoRH (Yolla Bolly Mtns), n SNH	0009400000
POLYSTICHUM munitum (Kaulf.) C. Presl	NW, CaR, s SNH, CW, n ChI	0f3d030900
POLYSTICHUM scopulinum (D. Eaton) Maxon	KR, NCoRO, NCoRH, CaRH, n&c SNH, SnBr, SnJt	0429c04400
POPULUS alba L.	KR, CaR, GB, expected elsewhere	0603040006
POPULUS angustifolia James	SNE	0000040002
POPULUS balsamifera L. ssp. trichocarpa (Torrey & A. Gray) Brayshaw	CA-FP, GB	1fffffff07
POPULUS fremontii S. Watson ssp. fremontii	CA (exc MP)	fffdffff03
POPULUS tremuloides Michaux	KR, NCoRH, CaR, SNH, SnBr, GB	060bc40506
POROPHYLLUM gracile Benth.	D	e000000000
PORTERELLA carnosula (Hook. & Arn.) Torrey	CaRH, n SNH, GB	0402440006
PORTULACA halimoides L.	DMtns (Little San Bernardino Mtns, New York Mtns)	4000000000
PORTULACA oleracea L.	CA	ffffffff07
POTAMOGETON alpinus Balbis ssp. tenuifolius (Raf.) Hult<#e9>n	KR, SNH, CCo, MP	0103c00104
POTAMOGETON amplifolius Tuckerman	NCoR, CaRH, SNH	0438c00100
POTAMOGETON crispus L.	NCoR, GV, CCo, SnFrB, SCo, ChI, SnGb, SnBr, DMoj	79b8003e00
POTAMOGETON diversifolius Raf.	NCoRI, c SNF, n SNH, GV, SCo, SnJt, MP	0092506204
POTAMOGETON epihydrus Raf. ssp. nuttallii (Cham. & Schldl.) Calder & Roy Taylor	NCoRO, SNH, MP	0022c00104
POTAMOGETON filiformis Pers.	c SNH, SnJV, SnFrB, MP	0002802804
POTAMOGETON foliosus Raf.	CA	ffffffff07
POTAMOGETON foliosus Raf. var. fibrillosus (Fern.) R. Haynes & Rev.	n NCo (Crescent City), w MP, s SNE	0006040006
POTAMOGETON foliosus Raf. var. foliosus	NW, CaRH, SNF, n SNH, GV, CW, SW (exc ChI), GB, D	e5ff7f7e07
POTAMOGETON gramineus L.	KR, NCoRI, CaRH, SNH, SnFrB, SnBr, GB	0413c40d06
POTAMOGETON illinoensis Morong	NCoR, CaR, SNH, SnJV, CCo, SnFrB, SCoRO, SnGb, SnBr, PR, GB	077ac67d06
POTAMOGETON latifolius (Robb.) Morong	c SnJV, GB, DMoj	6002042006
POTAMOGETON natans L.	NCo, NCoRO, CaRH, SNH, SnJV, SnFrB, SnBr, PR, MP	0466c06d04
POTAMOGETON nodosus Poiret	NCoR, s SNF, n SNH, GV, CCo, SnFrB, SCo, SnBr, PR, GB, DMoj	61fa646e06
POTAMOGETON pectinatus L.	CA	ffffffff07
POTAMOGETON praelongus Wulfen	CaRH, n&c SNH	0400c00000
POTAMOGETON pusillus L.	NCo, KR, n SNF, SNH, GV, SnFrB, SCoR, SW (exc ChI), GB, DMoj	60c7cf7f07
POTAMOGETON pusillus L. var. pusillus	NCo, KR, n SNF, SNH, GV, SnFrB, SCoR, SW (exc ChI), GB, DMoj	60c7cf7f07
POTAMOGETON pusillus L. var. tenuissimus Mert. & Koch	NCo, KR, n SNF, SNH, SnJV, SCoRO, SnBr, GB	0007ce2506
POTAMOGETON richardsonii (A. Bennett) Rydb.	NCo, KR, CaRH, c SN, n SNH, MP	0407d00004
POTAMOGETON robbinsii Oakes	KR, c&s SNH	0001800100
POTAMOGETON zosteriformis Fern.	s NCoRI (Clear Lake), GV, MP	0012002204
POTENTILLA anserina L.	NCo, s SNH, CCo, SCo, SnBr, GB	0186040506
POTENTILLA anserina L. ssp. anserina	s SNH, SnBr, GB	0002040506
POTENTILLA anserina L. ssp. pacifica (Howell) Rousi	NCo, CCo, SCo	0184000000
POTENTILLA biennis E. Greene	SNH, TR, GB, DMtns	4002c41507
POTENTILLA concinna Richardson	n W&I (White Mtns)	0000000002
POTENTILLA cristae W. Ferlatte & Strother	KR	0001000000
POTENTILLA diversifolia Lehm. var. diversifolia	c&s SNH	0000800100
POTENTILLA drummondii Lehm.	KR, CaRH, SNH, Wrn, W&I	0401c00106
POTENTILLA drummondii Lehm. ssp. breweri (S. Watson) B. Ertter	c KR, SNH, Wrn	0001c00104
POTENTILLA drummondii Lehm. ssp. bruceae (Rydb.) Keck	KR, CaRH, SNH, Wrn, W&I	0401c00106
POTENTILLA drummondii Lehm. ssp. drummondii	KR, n&c SNH	0001c00000
POTENTILLA flabellifolia Hook.	KR, CaRH, SNH	0401c00100
POTENTILLA fruticosa L.	KR, CaRH, SNH, Wrn, W&I	0401c00106
POTENTILLA glandulosa Lindley	CA-FP (exc GV), GB	1fffffdd07
POTENTILLA glandulosa Lindley ssp. ashlandica (E. Greene) Keck	NW, CaR, n SNH, MP	063f400004
POTENTILLA glandulosa Lindley ssp. ewanii Keck	SnGb (Mount Islip area)	0000001000
POTENTILLA glandulosa Lindley ssp. glandulosa	NW, SNF, CW, SW	19fd3b5c01
POTENTILLA glandulosa Lindley ssp. globosa Keck	KR, NCoRH, n CaRH	0409000000
POTENTILLA glandulosa Lindley ssp. hansenii (E. Greene) Keck	CaR, SN	0600f88100
POTENTILLA glandulosa Lindley ssp. nevadensis (S. Watson) Keck	SNH, TR, SnJt, SNE	0000c45503
POTENTILLA glandulosa Lindley ssp. pseudorupestris (Rydb.) Keck	NW, CaRH, SNH, Wrn, W&I	043dc00106
POTENTILLA glandulosa Lindley ssp. reflexa (E. Greene) Keck	NW, CaRH, SN, TR, PR, Wrn	047df8d505
POTENTILLA gracilis Hook.	NW (exc sw), CaR, SNH, Teh, TR, PR, GB	067fc4d507
POTENTILLA gracilis Hook. var. elmeri (Rydb.) Jepson	SNH, Teh, TR, SnJt, SNE	0000c4d503
POTENTILLA gracilis Hook. var. fastigiata (Nutt.) S. Watson	NW (exc sw), CaR, SNH, Teh, TR, PR, GB	067fc4d507
POTENTILLA gracilis Hook. var. flabelliformis (Lehm.) Torrey & A. Gray	MP	0002000004
POTENTILLA gracilis Hook. var. gracilis	nw KR, n NCoRO	0021000000
POTENTILLA grayi S. Watson	SNH	0000c00100
POTENTILLA hickmanii Eastw.	n&c CCo, s NCoRO?	0120000000
POTENTILLA millefolia Rydb.	CaRH, GB, ne-most SNH	0402c40106
POTENTILLA morefieldii B. Ertter	n W&I (n White Mtns, Mono Co.)	0000000002
POTENTILLA multijuga Lehm.	c SCo (Ballona Marsh, Los Angeles Co.)	0080000000
POTENTILLA newberryi A. Gray	MP	0002000004
POTENTILLA norvegica L.	c SNH, ScV, SNE	0000840202
POTENTILLA palustris (L.) Scop.	NCo, CaRH, n SNH, ScV, Wrn	0404400204
POTENTILLA pensylvanica L.	c SNH, W&I	0000800002
POTENTILLA pseudosericea Rydb.	c&s SNH, n SNE (Sweetwater Mtns), W&I	0000840100
POTENTILLA recta L.	CaRH, ScV, SnFrB	0400000a00
POTENTILLA rimicola (Munz & I.M. Johnston) B. Ertter	SnJt	0000004000
POTENTILLA rivalis Nutt.	s NCoRO, CaRH, SN, GV, CW, SnBr, MP	0522fbaf04
POTENTILLA wheeleri S. Watson	s SNH, SnBr, SnJt	0000004500
PRENANTHELLA exigua (A. Gray) Rydb.	SNE, D	e000040002
PRIMULA suffrutescens A. Gray	KR, SNH, SNE	0001c40102
PRIONOPSIS ciliata (Nutt.) Nutt.	SnFrB, SCo	0080000800
PROBOSCIDEA althaeifolia (Benth.) Decne.	DSon	8000000000
PROBOSCIDEA louisianica (Miller) Thell. ssp. louisianica	esp GV (also NCoR, CW, SCo)	01b8032a00
PROBOSCIDEA lutea (Lindley) Stapf	GV, CW, SW	19c0037e01
PROBOSCIDEA parviflora (Wooton) Wooton & Standley ssp. parviflora	SW, D	f8c0005401
PROSOPIS glandulosa Torrey var. torreyana (L. Benson) M. Johnston	SnJV, PR, D	e040006000
PROSOPIS pubescens Benth.	SnBr, D	e000000400
PROSOPIS strombulifera (Lam.) Benth.	se DSon (Bard, Imperial Co.)	8000000000
PROSOPIS velutina Wooton	SnJV, CCo, SCo	0180002000
PRUNELLA vulgaris L.	CA-FP, SNE	1ffdffff03
PRUNELLA vulgaris L. var. lanceolata (Barton) Fern.	CA-FP, SNE	1ffdffff03
PRUNELLA vulgaris L. var. vulgaris	NCo, CCo, SCo	0184000000
PRUNUS andersonii A. Gray	SNH (e slope), GB, n DMtns (Last Chance Range)	4002c40106
PRUNUS cerasifera Ehrh.	SnFrB	0000000800
PRUNUS dulcis (Miller) D. Webb	GV, e SnFrB, s SCoRO (expected elsewhere)	0000022a00
PRUNUS emarginata (Hook.) Walp.	CA-FP (exc GV, ChI), MP	07fffbdd05
PRUNUS fasciculata (Torrey) A. Gray	s SNH, Teh, s CCo, s SCoRI, n TR, e PR, D	e140019501
PRUNUS fasciculata (Torrey) A. Gray var. fasciculata	s SNH, Teh, s SCoRI, n TR, e PR, D	e040019501
PRUNUS fasciculata (Torrey) A. Gray var. punctata Jepson	s CCo, e WTR	0100000001
PRUNUS fremontii S. Watson	e PR, w DSon	8040000000
PRUNUS ilicifolia (Nutt.) Walp.	s NCoR, CW, SW	19f8035c01
PRUNUS ilicifolia (Nutt.) Walp. ssp. ilicifolia	s NCoR, CW, SW (exc ChI)	01f8035c01
PRUNUS ilicifolia (Nutt.) Walp. ssp. lyonii (Eastw.) Raven	ChI	1800000000
PRUNUS subcordata Benth.	NW, CaR, SN, CW, MP	073ffb8904
PRUNUS virginiana L. var. demissa (Nutt.) Torrey	CA-FP (exc coast, GV), GB	1e7bffdd07
PSATHYROTES annua (Nutt.) A. Gray	SNE, DMoj	6000040002
PSATHYROTES ramosissima (Torrey) A. Gray	s SNE, D	e000040002
PSEUDOBAHIA bahiifolia (Benth.) Rydb.	c SNF (Madera Co.), e SnJV	0000102000
PSEUDOBAHIA heermannii (Durand) Rydb.	CaRF (Butte Co.), SNF, SCoRO	02003a0000
PSEUDOBAHIA peirsonii Munz	s SNF (Kern Co.), se SnJV (Fresno, Tulare cos.)	0000202000
PSEUDOROEGNERIA spicata (Pursh) A. L<#f6>ve	NCoR, CaR, n&c SN, MP	063ad80004
PSEUDOSTELLARIA jamesiana (Torrey) W.A. Weber & R.L. Hartman	KR, NCoRH, CaRH, c&s SNF, SNH, Teh, WTR, MP	040bf08105
PSEUDOTSUGA macrocarpa (Vasey) Mayr	s SCoRO, TR, PR	0040025401
PSEUDOTSUGA menziesii (Mirbel) Franco var. menziesii	KR, NCoR, CaRH, n&c SNH, CCo, SnFrB, n SCoRO	0539c20800
PSILOCARPHUS brevissimus Nutt.	CA-FP, MP	1ffffbff05
PSILOCARPHUS brevissimus Nutt. var. brevissimus	CA-FP, MP	1ffffbff05
PSILOCARPHUS brevissimus Nutt. var. multiflorus Cronq.	Deltaic GV, SnFrB	0000002a00
PSILOCARPHUS elatior (A. Gray) A. Gray	KR, CaR, MP	0603000004
PSILOCARPHUS oregonus Nutt.	n CA-FP (rare and doubtful in s CA-FP), MP	1ffffbff05
PSILOCARPHUS tenellus Nutt.	CA-FP	1ffdfbff01
PSILOCARPHUS tenellus Nutt. var. globiferus (DC.) Morefield	c&s SNF, SnJV, CCo, SnFrB	0100302800
PSILOCARPHUS tenellus Nutt. var. tenellus	CA-FP	1ffdfbff01
PSILOSTROPHE cooperi (A. Gray) E. Greene	e DMoj, DSon	e000000000
PSORALIDIUM lanceolatum (Pursh) Rydb.	GB	0002040006
PSOROTHAMNUS arborescens (A. Gray) Barneby	SnBr, SNE, DMoj	6000040402
PSOROTHAMNUS arborescens (A. Gray) Barneby var. arborescens	sw DMoj (Kern, San Bernardino cos.)	6000000000
PSOROTHAMNUS arborescens (A. Gray) Barneby var. minutifolius (Parish) Barneby	SNE (Mono Co.), n&c DMoj	6000040002
PSOROTHAMNUS arborescens (A. Gray) Barneby var. simplicifolius (Parish) Barneby	SnBr, adjacent DMoj (s San Bernardino, adjacent Riverside cos.)	2000000400
PSOROTHAMNUS emoryi (A. Gray) Rydb.	s DMoj, DSon	e000000000
PSOROTHAMNUS fremontii (A. Gray) Barneby	DMtns, e DSon	c000000000
PSOROTHAMNUS fremontii (A. Gray) Barneby var. attenuatus Barneby	e DSon (se San Bernardino Co.)	8000000000
PSOROTHAMNUS fremontii (A. Gray) Barneby var. fremontii	e DMtns (ne San Bernardino Co.)	4000000000
PSOROTHAMNUS polydenius (S. Watson) Rydb.	SNE, DMoj	6000040002
PSOROTHAMNUS schottii (Torrey) Barneby	DSon	8000000000
PSOROTHAMNUS spinosus (A. Gray) Barneby	D	e000000000
PTELEA crenulata E. Greene	NCoRI, CaRF, SNF, SnFrB	0210380800
PTERIDIUM aquilinum (L.) Kuhn var. pubescens L. Underw.	CA-FP (exc GV)	1ffdfbdd01
PTERIS cretica L.	Reported from SnFrB, elsewhere in Am	0000000800
PTERIS tremula R.Br.	SnGb (1 collection)	0000001000
PTERIS vittata L.	SnGb	0000001000
PTEROSPORA andromedea Nutt.	KR, NCoRH, CaRH, SNH, Teh, TR, SnJt, Wrn	0409c0d505
PTEROSTEGIA drymarioides Fischer & C. Meyer	CA	ffffffff07
PTILAGROSTIS kingii (Bolander) Barkworth	c&s SNH	0000800100
PUCCINELLIA distans (Jacq.) Parl.	CA-FP, GB	1fffffff07
PUCCINELLIA howellii J.I Davis	KR (Shasta Co.)	0001000000
PUCCINELLIA lemmonii (Vasey) Scribner	KR, CaR, GB	0603040006
PUCCINELLIA nutkaensis (J.S. Presl) Fern. & Weath.	CCo	0100000000
PUCCINELLIA nuttalliana (Schultes) A. Hitchc.	CA-FP, GB	1fffffff07
PUCCINELLIA parishii A. Hitchc.	w DMoj (sw San Bernardino Co.)	6000000000
PUCCINELLIA pumila (Vasey) A. Hitchc.	NCo	0004000000
PUCCINELLIA simplex Scribner	Teh, GV, SnFrB, w DMoj	600000aa00
PULICARIA paludosa Link	w SnJV, SW, e DSon	98c0007401
PUNICA granatum L.	s SnJV, s CCo, n SCo	0180002000
PURSHIA mexicana (D. Don) Welsh var. stansburyana (Torrey) Welsh	W&I, DMtns	4000000002
PURSHIA tridentata (Pursh) DC.	KR, NCoRH, CaR, SNH (e slope), Teh, n TR and e PR (D edge), GB, DMtns	464bc49507
PURSHIA tridentata (Pursh) DC. var. glandulosa (Curran) M.E. Jones	c&s SNH (e slope), Teh, n TR & e PR (D edge), SNE, DMtns	4040849503
PURSHIA tridentata (Pursh) DC. var. tridentata	KR, NCoRH, CaR, SNH (e slope), GB	060bc40106
PYCNANTHEMUM californicum Torrey	KR, n NCoR, CaR, SN, n ScV, TR, PR, MP	067bf8d705
PYRACANTHA angustifolia (Franchet) C. Schneider	s NCoRO, CCo, SnFrB, SCo, expected elsewhere	01a0000800
PYROLA asarifolia Michaux	NCo, KR, NCoRO, CaRH, SNH, SnBr, MP	0427c00504
PYROLA asarifolia Michaux ssp. asarifolia	KR, CaRH, SNH, SnBr, MP	0403c00504
PYROLA asarifolia Michaux ssp. bracteata (Hook.) E. Haber	NCo, KR, NCoRO, n SNH	0025400000
PYROLA chlorantha Sw.	n SNH (near Downieville, Sierra Co.)	0000400000
PYROLA minor L.	KR, c&s SNH, SnBr, SnJt, Wrn	0001804504
PYROLA picta Smith	NW, CaR, SN, SnFrB, SCoRO, TR, PR, Wrn	067dfadd05
PYRROCOMA apargioides (A. Gray) E. Greene	SN, SNE	0000fc8102
PYRROCOMA carthamoides Hook. var. cusickii (A. Gray) J. Kartesz & K. Gandhi	CaRH, n SNH, MP	0402400004
PYRROCOMA hirta (A. Gray) E. Greene	MP	0002000004
PYRROCOMA hirta (A. Gray) E. Greene var. hirta	MP	0002000004
PYRROCOMA hirta (A. Gray) E. Greene var. lanulosa (E. Greene) G. Brown & Keil	MP	0002000004
PYRROCOMA lanceolata (Hook.) E. Greene	MP, n SNE	0002040004
PYRROCOMA lanceolata (Hook.) E. Greene var. lanceolata	MP, n SNE	0002040004
PYRROCOMA lanceolata (Hook.) E. Greene var. subviscosa (E. Greene) G. Brown & Keil	MP	0002000004
PYRROCOMA lucida (Keck) J. Kartesz & K. Gandhi	n SNH	0000400000
PYRROCOMA racemosa (Nutt.) Torrey & A. Gray	KR, NCoR, c&s SNH, Teh, s ScV, SnFrB, SCoRI, SCo, GB, DMoj	60bb858b06
PYRROCOMA racemosa (Nutt.) Torrey & A. Gray var. congesta (E. Greene) G. Brown & Keil	nw KR	0001000000
PYRROCOMA racemosa (Nutt.) Torrey & A. Gray var. paniculata (Nutt.) J. Kartesz & K. Gandhi	c&s SNH, Teh, GB, DMoj	6002848106
PYRROCOMA racemosa (Nutt.) Torrey & A. Gray var. pinetorum (Keck) J. Kartesz & K. Gandhi	KR	0001000000
PYRROCOMA racemosa (Nutt.) Torrey & A. Gray var. racemosa	NCoR, s ScV, SnFrB, SCoRI, SCo	00b8010a00
PYRROCOMA racemosa (Nutt.) Torrey & A. Gray var. sessiliflora (E. Greene) G. Brown & Keil	se SNE, DMoj	6000000000
PYRROCOMA uniflora (Hook.) E. Greene	SnBr, GB	0002040406
PYRROCOMA uniflora (Hook.) E. Greene var. gossypina (E. Greene) J. Kartesz & K. Gandhi	SnBr (near Baldwin Lake)	0000000400
PYRROCOMA uniflora (Hook.) E. Greene var. uniflora	GB	0002040006
QUERCUS X-acutidens Torrey	PR	0040004000
QUERCUS X-alvordiana Eastw.	Teh, SCoRI	0000018000
QUERCUS X-macdonaldii E. Greene	ChI (exc San Clemente Island)	1800000000
QUERCUS agrifolia Nee	NCoRO, CW, SW	19e0035c01
QUERCUS agrifolia Nee var. agrifolia	NCoRO, CW, SW	19e0035c01
QUERCUS agrifolia Nee var. oxyadenia (Torrey) J. Howell	PR	0040004000
QUERCUS berberidifolia Liebm.	NCoR, SNF, Teh, CW, SW	19f83bdc01
QUERCUS chrysolepis Liebm.	CA-FP (exc GV), e DMtns	5ffdfbdd01
QUERCUS cornelius-mulleri K. Nixon & K. Steele	SnBr (n slope), PR (e slope), s DMtns (Little San Bernardino Mtns)	4040000400
QUERCUS douglasii Hook. & Arn.	NCoRI, CaRF, SNF, Teh, n SnJV, SnFrB, SCoRI, WTR (n slope)	021039a801
QUERCUS dumosa Nutt.	SCo	0080000000
QUERCUS durata Jepson	NCoR, n SNF, SnFrB, SCoR, SnGb	00380b1800
QUERCUS durata Jepson var. durata	NCoR, n SNF, SnFrB, SCoR	00380b0800
QUERCUS durata Jepson var. gabrielensis K. Nixon & C.H. Muller	SnGb (s slope)	0000001000
QUERCUS engelmannii E. Greene	SCo, s ChI (1 tree on Santa Catalina Island), SnGb, PR	10c0005000
QUERCUS garryana Hook.	NW, CaRF, SNF, Teh, SnFrB, ne WTR (Liebre Mtn)	023d388801
QUERCUS garryana Hook. var. breweri (Engelm.) Jepson	KR, NCoRH, SNF, Teh, ne WTR (Liebre Mtn)	0009388001
QUERCUS garryana Hook. var. garryana	NW, CaRF, SnFrB	023d000800
QUERCUS john-tuckeri K. Nixon & C.H. Muller	Teh (e slope), SCoRI, WTR (n slope), SnGb (n slope), sw edge DMoj	2000019001
QUERCUS kelloggii Newb.	CA-FP (exc GV, SCo, ChI)	077dfbdd01
QUERCUS lobata Nee	NCoR, CaRF, SNF, Teh, GV, SnFrB, SCoR, nw SCo, ChI (Santa Cruz, Santa Catalina islands), WTR, w SnGb	1ab83bba01
QUERCUS palmeri Engelm.	e NCoRI (Colusa Co.), nw SnJV (Alameda, Contra Costa cos.), SCoR (San Luis Obispo, Santa Barbara cos.), SnGb (n slope), e PR, DMtns (Little San Bernardino Mtns)	4050033000
QUERCUS parvula E. Greene	w SnFrB, SCoRO, n ChI (Santa Cruz Island), e WTR	0800020801
QUERCUS parvula E. Greene var. parvula	SCoRO (Santa Barbara Co.), n ChI (Santa Cruz Island), e WTR	0800020001
QUERCUS parvula E. Greene var. shrevei (C.H. Muller) K. Nixon	w SnFrB, SCoRO	0000020800
QUERCUS sadleriana R.Br. Campst.	KR	0001000000
QUERCUS tomentella Engelm.	ChI	1800000000
QUERCUS turbinella E. Greene	e DMtns (New York Mtns)	4000000000
QUERCUS vaccinifolia Kellogg	KR, NCoRH, SNH	0009c00100
QUERCUS wislizeni A.DC.	NCoR, CaRF, SNF, Teh, SnFrB, SCoR, SW (exc ChI), SnFrB	02f83bdc01
QUERCUS wislizeni A.DC. var. frutescens Engelm.	NCoR, Teh, SnFrB, SCoR, SW (exc ChI)	00f803dc01
QUERCUS wislizeni A.DC. var. wislizeni	NCoR, CaRF, SNF, SCoR, TR, PR, SnFrB	02783b5c01
RAFINESQUIA californica Nutt.	NCoR, SNF, SnFrB, SCoR, SW, W&I, D	f8f83b5c03
RAFINESQUIA neomexicana A. Gray	D	e000000000
RAILLARDELLA argentea (A. Gray) A. Gray	CaRH, SNH, SnBr, Wrn, SNE	0400c40506
RAILLARDELLA pringlei E. Greene	KR (Trinity Alps, Scott Mtns)	0001000000
RAILLARDELLA scaposa (A. Gray) A. Gray	SNH	0000c00100
RAILLARDIOPSIS muirii (A. Gray) Rydb.	s SNH, SCoRO (Ventana Double Cone, Monterey Co.)	0000020100
RAILLARDIOPSIS scabrida (Eastw.) Rydb.	NCoRH, CaRH (Shasta Co.)	0408000000
RANUNCULUS acris L.	n NCo (waif)	0004000000
RANUNCULUS alismifolius Benth.	KR, NCoRH, CaRH, SNH, SnBr, SnJt, MP, n W&I	040bc04506
RANUNCULUS alismifolius Benth. var. alismellus A. Gray	KR, NCoRH, CaRH, SNH, SnBr, SnJt, n W&I	0409c04502
RANUNCULUS alismifolius Benth. var. alismifolius	KR, NCoRH, CaRH, n&c SNH, MP	040bc00004
RANUNCULUS andersonii A. Gray	SNH (e slope), MP, W&I, n DMtns (Grapevine, Panamint Mtns)	4002c00106
RANUNCULUS aquatilus L.	CA-FP (exc ChI), GB	07ffffff07
RANUNCULUS aquatilus L. var. capillaceus (Thuill.) DC.	CA-FP (exc ChI), GB	07ffffff07
RANUNCULUS aquatilus L. var. hispidulus E. Drew	NW, CaR, SN (exc Teh), CCo, SnFrB, PR, MP	077ff84904
RANUNCULUS aquatilus L. var. subrigidus (Drew) Breitung	n CaR, CCo, n SNH, SnJt, MP	0702404004
RANUNCULUS arvensis L.	KR, NCoRO, CaR, SNF, SCoRO, expected elsewhere	06213a0000
RANUNCULUS bonariensis Poiret var. trisepalus (Gill.) Lourt.	n&c SNF, e GV (exc s SnJV)	0000182200
RANUNCULUS bulbosus L.	n NCo (waif)	0004000000
RANUNCULUS californicus Benth.	CA-FP	1ffdfbff01
RANUNCULUS canus Benth.	s NCoRI, SNF, GV, e SnFrB, SCoR, TR, PR	00503b7e01
RANUNCULUS cymbalaria Pursh var. saximontanus Fern.	NW (exc NCo), CaR, SN, e SCo, TR, PR, GB, DMoj	66fbfcd507
RANUNCULUS eschscholtzii Schldl.	KR, CaR, SNH, SnBr, SnJt, GB	0603c44506
RANUNCULUS eschscholtzii Schldl. var. oxynotus (A. Gray) Jepson	CaR, SNH, SnBr, SnJt, GB	0602c44506
RANUNCULUS eschscholtzii Schldl. var. suksdorfii (A. Gray) L. Benson	KR	0001000000
RANUNCULUS flabellaris Raf.	KR, n SNH, MP	0003400004
RANUNCULUS flammula L.	NW, CaR, n&c SN, CCo, SnFrB, SnBr	073dd80c00
RANUNCULUS glaberrimus Hook.	CaR, n SNH, MP, n SNE	0602440004
RANUNCULUS glaberrimus Hook. var. ellipticus (E. Greene) E. Greene	n SNH (e slope), MP, n SNE	0002440004
RANUNCULUS glaberrimus Hook. var. glaberrimus	CaR, n SNH, MP	0602400004
RANUNCULUS gormanii E. Greene	KR	0001000000
RANUNCULUS hebecarpus Hook. & Arn.	NCoRI, CaR, SN, ScV (Sutter Buttes), CW, SW (exc n ChI), MP	17d2fbdf05
RANUNCULUS hydrocharoides A. Gray	c SNH, s SNE (Mono Co.)	0000840002
RANUNCULUS lobbii (Hiern) A. Gray	NCo, s NCoR, CCo, SnFrB	013c000800
RANUNCULUS macounii Britton	MP	0002000004
RANUNCULUS muricatus L.	NW, CaR, SNF, GV, SnFrB, SCoRO	063d3a2a00
RANUNCULUS occidentalis Nutt.	CA-FP (exc GV, SW)	073dfb8900
RANUNCULUS orthorhynchus Hook.	CA-FP (exc s SnJV, SCoR, SW), MP	073ff8ab04
RANUNCULUS orthorhynchus Hook. var. bloomeri (S. Watson) L. Benson	NCo, NCoR, deltaic GV, CCo, SnFrB	013c002a00
RANUNCULUS orthorhynchus Hook. var. orthorhynchus	NW, CaR, SN, w ScV, n SnJV, n SnFrB, MP	063ff8ab04
RANUNCULUS parviflorus L.	NCo, w KR, s NCoRO, CCo (Monterey), expected elsewhere	0125000000
RANUNCULUS populago E. Greene	KR, CaR, n SNH	0601400000
RANUNCULUS pusillus Poiret	NCo, NCoRO, n&c SNF, SnFrB	0024180800
RANUNCULUS repens L.	NCo, CaR, c&s SNF, CCo, SnFrB, n SCo, expected elsewhere	0784300800
RANUNCULUS sardous Crantz	n NCo	0004000000
RANUNCULUS sceleratus L.	CaR, GV, MP	0602002204
RANUNCULUS testiculatus Crantz	CaR, s SNH, GB, expected elsewhere	0602040106
RANUNCULUS uncinatus D. Don	KR, NCoR, CaR, SN, n SnFrB, SnBr, MP	063bf88d04
RAPHANUS raphanistrum L.	CA (exc D, mtns)	1fffffff07
RAPHANUS sativus L.	CA-FP (exc mtns)	1ffdfbff01
RAPISTRUM rugosum (L.) All.	SnFrB	0000000800
RESEDA alba L.	CW, SW (gen coastal)	19c0035c01
RESEDA lutea L.	NCoRI (s Lake Co)	0010000000
RESEDA luteola L.	NCo, NCoR, CCo, s SCo (San Diego)	01bc000000
RESEDA odorata L.	CCo, SCo	0180000000
RHAGADIOLUS stellatus (L.) Gaertner	s NCoRO (Napa Co.), SnFrB	0020000800
RHAMNUS alnifolia L'Her.	n SNH (Nevada, Placer cos.)	0000400000
RHAMNUS californica Eschsch.	NW, n SNF, CW, SW	19fd0b5c01
RHAMNUS californica Eschsch. ssp. californica	NW, CW, SW	19fd035c01
RHAMNUS californica Eschsch. ssp. occidentalis (T.J. Howell) C. Wolf	KR, NCoRO, n SNF	0021080000
RHAMNUS crocea Nutt.	NCoRO (Sonoma, Mendocino cos.), CW, SW	19e0035c01
RHAMNUS ilicifolia Kellogg	CA-FP, DMtns	5ffdfbff01
RHAMNUS pilosa (Trel.) Abrams	PR	0040004000
RHAMNUS pirifolia E. Greene	ChI	1800000000
RHAMNUS purshiana DC.	NCo, KR, NCoRO, NCoRH, CaR, n&c SN	062dd80000
RHAMNUS rubra E. Greene	KR, NCoRH, CaR, n&c SNH, MP	060bc00004
RHAMNUS tomentella Benth.	KR, NCoRH, NCoR, CaRF, SN, ScV, SnFrB, SCoR, SW, DMtns	5af9fbdf01
RHAMNUS tomentella Benth. ssp. crassifolia (Jepson) J.O. Sawyer	s KR, NCoRI	0011000000
RHAMNUS tomentella Benth. ssp. cuspidata (E. Greene) J.O. Sawyer	c&s SN, Teh, TR, nw PR, SnJt, SNE, DMoj	6040b49503
RHAMNUS tomentella Benth. ssp. tomentella	s KR, NCoR, CaRF, SNF, ScV, SnFrB, SCoR, SW	1af93b5e01
RHAMNUS tomentella Benth. var. ursina (E. Greene) J.O. Sawyer	DMtns (Clark, New York, Providence Mtns)	4000000000
RHODODENDRON macrophyllum D. Don	NCo, KR, CCo, SnFrB	0105000800
RHODODENDRON occidentale (Torrey & A. Gray) A. Gray	NCo, KR, NCoRO, NCoRI, CaRH, SNH, CCo, SnFrB, n SCoRI, PR, SnJt	0575c14900
RHUS integrifolia (Nutt.) Brewer & S. Watson	SW	18c0005401
RHUS ovata S. Watson	SW	18c0005401
RHUS trilobata Torrey & A. Gray	CA-FP, DMtns	5ffdfbff01
RHYNCHELYTRUM repens (Willd.) C.E. Hubb.	NCoRO, SnJV, s CCo, SCoRO, SCo	01a0022000
RHYNCHOSPORA alba (L.) M. Vahl	c&s NW (Mendocino, Sonoma cos.), se CaRH (Lassen Co.)	043d000000
RHYNCHOSPORA californica Gale	s NW (Sonoma Co.), n&c SNF (Butte, Mariposa? cos.), n SnFrB	003d180800
RHYNCHOSPORA capitellata (Michaux) M. Vahl	NW (Sonoma, Trinity cos.), n SNF (Butte Co.)	003d080000
RHYNCHOSPORA globularis (Chapman) Small var. globularis	s NCoRO (Pitkin Marsh, Sonoma Co.)	0020000000
RIBES amarum McClatchie	SNF, Teh, SnFrB, SCoRO, SW	18c03adc01
RIBES aureum Pursh	KR, NCoRI, CaR, SNH, SnJV, SnFrB, SCoR, SW, GB	1ed3c77d07
RIBES aureum Pursh var. aureum	KR, CaR, SNH, SnJV, GB	0603c42106
RIBES aureum Pursh var. gracillimum (Cov. & Britton) Jepson	NCoRI, SnFrB, SCoR, SW	18d0035c01
RIBES binominatum A.A. Heller	KR, NCoRH	0009000000
RIBES bracteosum Douglas	NCo, w KR, NCoRO	0025000000
RIBES californicum Hook. & Arn.	NCoR, SnFrB, SCoR, WTR, SnGb, w PR	0078031801
RIBES californicum Hook. & Arn. var. californicum	NCoR, SnFrB, SCoR	0038030800
RIBES californicum Hook. & Arn. var. hesperium (McClatchie) Jepson	WTR, SnGb, w PR (Santa Ana Mtns)	0040001001
RIBES canthariforme Wiggins	sw PR (near Moreno Dam, sw San Diego Co.)	0040000000
RIBES cereum Douglas	KR, CaRH, SNH, Teh, TR, SnJt, GB, DMtns	4403c4d507
RIBES cereum Douglas var. cereum	KR, CaRH, SNH, Teh, TR, SnJt, GB, DMtns	4403c4d507
RIBES cereum Douglas var. inebrians (Lindley) C. Hitchc.	s SNH, W&I	0000000102
RIBES divaricatum Douglas	NW (exc NCoRI), CaR, CW (exc SCoRI), e SCo	07bd020800
RIBES divaricatum Douglas var. parishii (A.A. Heller) Jepson	e SCo	0080000000
RIBES divaricatum Douglas var. pubiflorum Koehne	NW (exc NCoRI), CaR, CW (exc SCoRI)	073d020800
RIBES hudsonianum A. Richards var. petiolare (Douglas) Jancz.	n MP	0002000004
RIBES indecorum Eastw.	SCoRO, SCo, WTR, PR	00c0024001
RIBES inerme Rydb.	KR, NCoRO, CaRH, SNH, Wrn, SNE	0421c40106
RIBES inerme Rydb. var. inerme	KR, CaRH, SNH, Wrn, SNE	0401c40106
RIBES inerme Rydb. var. klamathense (Cov. & Britton) Jepson	KR, NCoRO, CaRH	0421000000
RIBES lacustre (Pers.) Poiret	KR	0001000000
RIBES lasianthum E. Greene	SNH, SnGb	0000c01100
RIBES laxiflorum Pursh	n NCo	0004000000
RIBES lobbii A. Gray	KR, NCoRH	0009000000
RIBES malvaceum Sm.	NCoRI, SNF, SnFrB, SCoR, ChI, TR, PR	18503b5c01
RIBES malvaceum Sm. var. malvaceum	SNF, NCoRI, SnFrB, SCoR, ChI, WTR	18103b0801
RIBES malvaceum Sm. var. viridifolium Abrams	SCoRO, TR, PR	0040025401
RIBES marshallii E. Greene	KR	0001000000
RIBES menziesii Pursh	NCo, NCoRO, s SNF, CCo, SnFrB, SCoRO	0124220800
RIBES montigenum McClatchie	KR, CaRH, TR, SnJt, Wrn, n DMtns	4401005405
RIBES nevadense Kellogg	KR, NCoRH, CaR, SNH, Teh, TR, PR, Wrn	0649c0d505
RIBES quercetorum E. Greene	c&s SNF, Teh, SnFrB, SCoR, WTR, PR, w edge D	a04033c801
RIBES roezlii Regel	KR, NCoRO, NCoRH, CaRH, SNH, Teh, TR, PR, MP	046bc0d505
RIBES roezlii Regel var. amictum (E. Greene) Jepson	c NCoRO, NCoRH	0028000000
RIBES roezlii Regel var. cruentum (E. Greene) Rehder	KR, NCoRO, NCoRH	0029000000
RIBES roezlii Regel var. roezlii	KR, CaRH, SNH, Teh, TR, PR, MP	0443c0d505
RIBES sanguineum Pursh	NW (exc NCoRI), CW (exc SCoRI)	013d020800
RIBES sanguineum Pursh var. glutinosum (Benth.) Loudon	NCo, NCoRO, CW (exc SCoRI)	0124020800
RIBES sanguineum Pursh var. sanguineum	KR, NCoRH	0009000000
RIBES sericeum Eastw.	SCoRO	0000020000
RIBES speciosum Pursh	CCo, SCoRO, SCo, WTR, PR	01c0024001
RIBES thacherianum (Jepson) Munz	n ChI (Santa Cruz Island)	0800000000
RIBES tularense (Cov.) Fedde	s SNH (Tulare Co.)	0000000100
RIBES velutinum E. Greene	KR, CaRH, SNH, Teh, TR, GB, DMtns	4403c49507
RIBES viburnifolium A. Gray	PR (sw San Diego Co.), s ChI (Santa Catalina Island)	1040000000
RIBES victoris E. Greene	NCoRO, SnFrB	0020000800
RIBES viscosissimum Pursh	KR, NCoRH, CaRH, n&c SNH, MP	040bc00004
RICINUS communis L.	GV, CCo, SCo, expected elsewhere	0180002200
RIGIOPAPPUS leptocladus A. Gray	NW, CaR, SN, GV, CW, WTR, SnGb, MP	073ffbbb05
ROBINIA neomexicana A. Gray	e DMoj (Mid Hills, ne San Bernardino Co.)	6000000000
ROBINIA pseudoacacia L.	CA-FP, GB	1fffffff07
ROMANZOFFIA californica E. Greene	NW, n CCo, SnFrB	013d000800
ROMANZOFFIA sitchensis Bong.	KR	0001000000
ROMANZOFFIA tracyi Jepson	NCo	0004000000
ROMNEYA coulteri Harvey	e SCo, PR	00c0004000
ROMNEYA trichocalyx Eastw.	w SCo, PR	00c0004000
ROMULEA rosea (L.) Ecklon var. australis (Ewart) De Vos	NCo, CCo, SnFrB	0104000800
RORIPPA austriaca (Crantz) Besser	MP	0002000004
RORIPPA columbiae (Robinson) Howell	MP	0002000004
RORIPPA curvipes E. Greene	CA-FP, SNE	1ffdffff03
RORIPPA curvipes E. Greene var. curvipes	SN, SNE	0000fc8102
RORIPPA curvipes E. Greene var. truncata (Jepson) Rollins	CA-FP	1ffdfbff01
RORIPPA curvisiliqua (Hook.) Britton	CA-FP	1ffdfbff01
RORIPPA gambelii (S. Watson) Rollins & Al-Shehbaz	s CCo, SCo	0180000000
RORIPPA nasturtium-aquaticum (L.) Hayek	CA-FP, n SNE, W&I, DMtns	5ffdffff01
RORIPPA palustris (L.) Besser	CA	ffffffff07
RORIPPA palustris (L.) Besser var. hispida (Desv.) Rydb.	MP	0002000004
RORIPPA palustris (L.) Besser var. occidentalis (S. Watson) Rollins	CA	ffffffff07
RORIPPA sinuata (Torrey & A. Gray) A. Hitchc.	GB	0002040006
RORIPPA sphaerocarpa (A. Gray) Britton	SW	18c0005401
RORIPPA subumbellata Rollins	n SNH (Lake Tahoe Basin)	0000400000
RORIPPA tenerrima E. Greene	CW, SW	19c0035c01
ROSA bridgesii Cr<#e9>pin	CaR, SN	0600f88100
ROSA californica Cham. & Schldl.	CA-FP (exc CaRH, SNH)	1bfd3bfe01
ROSA canina L.	NW, n SN	003d480000
ROSA eglanteria L.	NW, SNF, CW	013d3b0800
ROSA gymnocarpa Nutt.	NW, CaR, n&c SN, CW, PR, MP	077fdb4804
ROSA minutifolia Engelm.	s PR (Otay Mesa)	0040000000
ROSA nutkana Presl var. nutkana	w NW	003d000000
ROSA pinetorum A.A. Heller	w-c CW	0100030800
ROSA pisocarpa A. Gray	NW, CaR	063d000000
ROSA spithamea S. Watson	NW, CW	013d030800
ROSA woodsii Lindley var. ultramontana (S. Watson) Jepson	CaRH, SNH, SnGb, SnBr, GB, DMtns	4402c41506
ROTALA indica (Willd.) Koehne	ScV (Butte Co.)	0000000200
ROTALA ramosior (L.) Koehne	NCoRI, n&c SN, GV	0010d82200
RUBUS discolor Weihe & Nees	CA-FP	1ffdfbff01
RUBUS glaucifolius Kellogg	NW, SN, PR	007df8c100
RUBUS laciniatus Willd.	NW, CaR, SN, SnFrB, PR	067df8c900
RUBUS lasiococcus A. Gray	KR, n NCoRH	0009000000
RUBUS leucodermis Torrey & A. Gray	CA-FP (exc coast, GV)	1e79fbdd01
RUBUS nivalis Douglas	nw KR (Del Norte Co.)	0001000000
RUBUS parviflorus Nutt.	CA-FP (exc GV), MP	1ffffbdd05
RUBUS pensilvanicus Poiret	CA-FP	1ffdfbff01
RUBUS spectabilis Pursh	NCo, nw KR, n NCoRO, n CCo, w SnFrB	0125000800
RUBUS ulmifolius Schott var. inermis (Willd.) W.O. Focke	s NW, ScV, CW, n SW	19fd035e01
RUBUS ursinus Cham. & Schldl.	CA-FP	1ffdfbff01
RUDBECKIA californica A. Gray	KR, NCo, SNH	0005c00100
RUDBECKIA californica A. Gray var. californica	KR, SNH	0001c00100
RUDBECKIA californica A. Gray var. glauca S.F. Blake	n NCo, w KR	0005000000
RUDBECKIA californica A. Gray var. intermedia R. Perdue	KR	0001000000
RUDBECKIA hirta L. var. pulcherrima Farw.	c SNF, GV	0000102200
RUDBECKIA occidentalis Nutt. var. occidentalis	KR, n SNH	0001400000
RUMEX acetosella L.	Common. CA-FP	1ffdfbff01
RUMEX conglomeratus Murray	CA-FP	1ffdfbff01
RUMEX crispus L.	CA	ffffffff07
RUMEX dentatus L.	n SnJV	0000002000
RUMEX hymenosepalus Torrey	SW, DMoj	78c0005401
RUMEX kerneri Borbas	CCo (San Luis Obispo Co.), SCo (Santa Barbara Co.)	0180000000
RUMEX maritimus L.	CA	ffffffff07
RUMEX obtusifolius L.	CA	ffffffff07
RUMEX occidentalis S. Watson	CA	ffffffff07
RUMEX orbiculatus A. Gray	n SNH (one site known near Taylorsville, Plumas Co.)	0000400000
RUMEX paucifolius S. Watson	CaR, SN, MP, W&I	0602f88106
RUMEX pulcher L.	CA	ffffffff07
RUMEX salicifolius J.A. Weinm.	CA	ffffffff07
RUMEX salicifolius J.A. Weinm. var. crassus (Rech.f.) J. Howell	NCo, CCo, SCo	0184000000
RUMEX salicifolius J.A. Weinm. var. denticulatus Torrey	CA (esp montane, coastal)	ffffffff07
RUMEX salicifolius J.A. Weinm. var. lacustris (E. Greene) J. Hickman	GB (esp MP)	0002040006
RUMEX salicifolius J.A. Weinm. var. salicifolius	CA-FP	1ffdfbff01
RUMEX salicifolius J.A. Weinm. var. transitorius (Rech.f.) J. Hickman	CA-FP (esp NCo, SN, CCo)	1ffdfbff01
RUMEX salicifolius J.A. Weinm. var. triangulivalvis (Danser) C. Hitchc.	CA (esp SN)	ffffffff07
RUMEX stenophyllus Ledeb.	n SnJV (Gustine, Merced Co.)	0000002000
RUMEX venosus Pursh	MP	0002000004
RUMEX violascens Rech.f.	s ScV, SnJV, PR, D	e040006200
RUPERTIA hallii (Rydb.) Grimes	SNF (Butte, Tehama cos.)	0000380000
RUPERTIA physodes (Hook.) Grimes	KR, NCoR, CW, SCo	01b9030800
RUPERTIA rigida (Parish) Grimes	SnBr, PR	0040004400
RUPPIA cirrhosa (Petagna) Grande	NCo, NCoRI, Teh, SnJV, CW, SCo, SnBr, GB, D	e19607ac06
RUPPIA maritima L.	NCo, CW, SCo, ChI	1984030800
RUTA chalepensis L.	CA-FP (esp near coast)	1ffdfbff01
SACCHARUM ravennae (L.) Murray	s DSon (Imperial Co.)	8000000000
SAGINA apetala Ard.	NW, CaR, n&c SN, GV, CCo, SCo, n ChI	0fbdd82200
SAGINA decumbens (Elliott) Torrey & A. Gray ssp. occidentalis (S. Watson) G. Crow	NW, n&c SN, GV, CCo, SCo, ChI, PR, SnFrB	19fdd86a00
SAGINA maxima A. Gray ssp. crassicaulis (S. Watson) G. Crow	NCo, CCo	0104000000
SAGINA procumbens L.	NCo, CCo	0104000000
SAGINA saginoides (L.) Karsten	KR, NCoRO, CaRH, SN, TR, PR, GB	0463fcd507
SAGITTARIA cuneata E. Sheldon	NW, CaR, SN, SnBr, GB	063ffc8506
SAGITTARIA latifolia Willd.	CA-FP, GB	1fffffff07
SAGITTARIA longiloba Engelm.	GV	0000002200
SAGITTARIA montevidensis Cham. & Schldl. ssp. calycina (Engelm.) C. Bogin	GV, SnFrB (Sonoma Co.), c SCo (Los Angeles Co.)	0080002a00
SAGITTARIA sanfordii E. Greene	n NCo (Del Norte Co.), GV (where mostly extirpated), n SCo (Ventura Co.)	0084002200
SALAZARIA mexicana Torrey	s SNE, D	e000040002
SALICORNIA bigelovii Torrey	SCo	0080000000
SALICORNIA europaea L.	Teh, CCo, SCo, MP	0182008004
SALICORNIA subterminalis Parish	SnJV, CCo, SnFrB, SCo, ChI, w DMoj, DSon	f980002800
SALICORNIA utahensis Tidestrom	ne DMoj (Death Valley)	6000000000
SALICORNIA virginica L.	NCo, SnJV, CCo, SCo, ChI	1984002000
SALIX alba L.	CA	ffffffff07
SALIX arctica Pallas	CaRH (Lassen Peak), c&s SNH	0400800100
SALIX babylonica L.	CA	ffffffff07
SALIX bebbiana Sarg.	n MP (Lower Klamath Lake, Siskiyou Co.; Goose Lake, Modoc Co.)	0002000004
SALIX boothii Dorn	KR, CaRH, n SNH, Wrn, W&I	0401400006
SALIX brachycarpa Nutt. ssp. brachycarpa	c SNH (Mono Co)	0000800000
SALIX breweri Bebb	NCoR, SnFrB, n&c SCoR	0038030800
SALIX delnortensis C. Schneider	nw KR (near Gasquet, Del Norte Co.)	0001000000
SALIX drummondiana Hook.	c&s SNH	0000800100
SALIX eastwoodiae A.A. Heller	KR, CaRH, SNH, W&I	0401c00102
SALIX exigua Nutt.	CA	ffffffff07
SALIX geyeriana Andersson	s CaRH, n SNH, s SNH (esp Kern Plateau), SnBr, SNE	0400440502
SALIX gooddingii C. Ball	NCoRI, CaRF, SNF, GV, SCo, PR, D	e2d0386200
SALIX hookeriana Hook.	NCo (< 100 m), n NCoRO (500-1000 m)	0024000000
SALIX jepsonii C. Schneider	CaRH, SNH	0400c00100
SALIX laevigata Bebb	CA	ffffffff07
SALIX lasiolepis Benth.	CA	ffffffff07
SALIX lemmonii Bebb	e KR, CaRH, SNH, SnBr, MP, W&I	0403c00506
SALIX ligulifolia (C. Ball) C. Ball	CaRH, SNH, Wrn	0400c00104
SALIX lucida Muhlenb.	CA	ffffffff07
SALIX lucida Muhlenb. ssp. caudata (Nutt.) E. Murray	SNH, SnBr, GB	0002c40506
SALIX lucida Muhlenb. ssp. lasiandra (Benth.) E. Murray	CA (less common in s CA, D)	ffffffff07
SALIX lutea Nutt.	c&s SNH (esp e slope), SnBr, SnJt, GB, w DMoj	6002844506
SALIX melanopsis Nutt.	KR, SNH, MP	0003c00104
SALIX orestera C. Schneider	SNH, W&I	0000c00102
SALIX planifolia Cham. ssp. planifolia	c SNH, SNE	0000840002
SALIX prolixa Andersson	KR, CaRH, n SNH	0401400000
SALIX reticulata L. ssp. nivalis (Hook.) L<#f6>ve et al.	c SNH (near Mount Dana)	0000800000
SALIX scouleriana Hook.	NW, CaRH, SN, n CCo, SnGb, SnBr, SnJt, MP	053ff8d504
SALIX sessilifolia Nutt.	NCo, w KR	0005000000
SALIX sitchensis Bong.	NW, CW, (exc SCoRI), w WTR	013d020801
SALPICHROA origanifolia (Lam.) Baillon	NCo, w CW, SCo	0184030800
SALSOLA damascena V.P.	se SCoRI (Temblor Range)	0000010000
SALSOLA paulsenii Litv.	n WTR, SNE, DMoj	6000040003
SALSOLA soda L.	n CCo (San Francisco Bay)	0100000000
SALSOLA tragus L.	CA	ffffffff07
SALVIA aethiopis L.	MP	0002000004
SALVIA apiana Jepson	SCo, TR, PR, w edge D	a0c0005401
SALVIA brandegei Munz	n ChI (Santa Rosa Island)	0800000000
SALVIA carduacea Benth.	Teh, SnJV, e SnFrB, SCoRI, SW, w D	f8c001fc01
SALVIA clevelandii (A. Gray) E. Greene	s SCo, s PR (San Diego Co.)	00c0000000
SALVIA columbariae Benth.	CA (exc KR, CaR, n SN)	f9feb7ff07
SALVIA dorrii (Kellogg) Abrams	nw CaRH, s SNH ( e slope), Teh, GB, n DMoj	2402048106
SALVIA dorrii (Kellogg) Abrams var. dorrii (Kellogg) Abrams	GB, n DMoj	2002040006
SALVIA dorrii (Kellogg) Abrams var. incana (A. Gray) J.L. Strachan	nw CaRH (near Hornbrook, Siskiyou Co.)	0400000000
SALVIA dorrii (Kellogg) Abrams var. pilosa (A. Gray) J.L. Strachan & Rev.	s SNH ( e slope), Teh, GB, DMoj	6002048106
SALVIA eremostachya Jepson	w edge DSon	8000000000
SALVIA funerea M.E. Jones	ne DMoj (Death Valley, Amargosa & Panamint Mtns)	6000000000
SALVIA greatae Brandegee	se DSon (Orocopia, Chocolate Mtns)	8000000000
SALVIA leucophylla E. Greene	SCoRO, SCo, WTR, SnGb	0080021001
SALVIA mellifera E. Greene	CW, SW	19c0035c01
SALVIA mohavensis E. Greene	DMtns	4000000000
SALVIA munzii Epling	s PR (San Miguel Mtns, San Diego Co.)	0040000000
SALVIA pachyphylla Munz	s SNH, Teh, SnBr, PR, DMtns	404000c500
SALVIA sonomensis E. Greene	KR, NCoR, CaRF, n SNF, SCoR, SCo	02b90b0000
SALVIA spathacea E. Greene	s ScV (Solano Co.), CW, SCo, TR	0180031e01
SALVIA vaseyi (Porter) Parish	w edge DSon	8000000000
SALVIA verbenacea L.	e SnFrB (Alameda Co.)	0000000800
SAMBUCUS melanocarpa A. Gray	CaR, SNH	0600c00100
SAMBUCUS mexicana C. Presl	CA-FP, GB, DMtns	5fffffff07
SAMBUCUS racemosa L.	CA-FP	1ffdfbff01
SAMBUCUS racemosa L. var. microbotrys (Rydb.) Kearney & Peebles	NW, CaR, SN, SnBr	063df88500
SAMBUCUS racemosa L. var. racemosa	NCo, w KR, NCoRO, SnFrB	0025000800
SAMOLUS parviflorus Raf.	SnJV, CCo, SnFrB, SCoR, SCo, n ChI, WTR	0980032801
SANGUISORBA minor Scop. ssp. muricata Briq.	CA-FP (exc SNH)	1ffdfbff01
SANGUISORBA occidentalis Nutt.	KR, CaRH, n&c SNH, n CCo, PR, MP	0543c04004
SANGUISORBA officinalis L.	c NCo, nw KR, n NCoRO	0025000000
SANICULA arctopoides Hook. & Arn.	NCo, CCo	0104000000
SANICULA arguta J. Coulter & Rose	SW	18c0005401
SANICULA bipinnata Hook. & Arn.	NCoR, SNF, ScV, SnFrB, SCoR, n&c SW	18f83b5e01
SANICULA bipinnatifida Hook.	NW, SNF, CW, SW	19fd3b5c01
SANICULA crassicaulis DC.	NW, CW, SW, SNF	19fd3b5c01
SANICULA graveolens DC.	NW, SNH	003dc00100
SANICULA hoffmannii (Munz) C. Bell	CCo (Santa Cruz Co.), SCo, n ChI	0980000000
SANICULA laciniata Hook. & Arn.	NCo, CCo	0104000000
SANICULA maritima S. Watson	SnFrB (apparently extirpated), CCo (1 site, San Luis Obispo Co.)	0100000800
SANICULA peckiana J.F. Macbr.	nw KR (Del Norte Co.)	0001000000
SANICULA saxatilis E. Greene	e&s SnFrB (Mount Diablo, Contra Costa Co.; Mount Hamilton, Santa Clara Co.)	0000000800
SANICULA tracyi Shan & Constance	NCo (Humboldt, Trinity cos.), CaRF (Butte Co.)	0204000000
SANICULA tuberosa Torrey	NCoR, CaR, SN, SCoR, WTR, PR	0678fbc101
SANTOLINA chamaecyparisus L.	NCoRO, SnFrB, SCoRI, SCo	00a0010800
SANVITALIA abertii A. Gray	DMtns (Clark, New York mtns)	4000000000
SAPONARIA officinalis L.	NW, CaRH, n SNF, SnFrB, SCoRO, SCo, PR, GB	04ff0e4806
SARCOBATUS vermiculatus (Hook.) Torrey	GB, DMoj	6002040006
SARCODES sanguinea Torrey	KR, NCoRO, NCoRH, CaRH, SNH, TR, SnJt	0429c05501
SARCOSTEMMA cynanchoides Decne. ssp. hartwegii (Vail) R. Holm	D	e000000000
SARCOSTEMMA hirtellum (A. Gray) R. Holm	D	e000000000
SARRACENIA purpurea L.	n SNH (Butterfly Valley, Plumas Co.)	0000400000
SATUREJA chandleri (Brandegee) Druce	PR (San Miguel, Santa Ana mtns)	0040000000
SATUREJA douglasii (Benth.) Briq.	KR, NCoR, CW, TR	0139031c01
SATUREJA mimuloides (Benth.) Briq.	CCo, SCoRO, TR	0100021401
SAUSSUREA americana D. Eaton	KR	0001000000
SAXIFRAGA aprica E. Greene	KR, CaRH, SNH	0401c00100
SAXIFRAGA bryophora A. Gray	KR, CaRH, SNH	0401c00100
SAXIFRAGA californica E. Greene	CA-FP	1ffdfbff01
SAXIFRAGA cespitosa L.	KR (Marble Mtns)	0001000000
SAXIFRAGA ferruginea Graham	KR, s NCoRH	0009000000
SAXIFRAGA howellii E. Greene	KR	0001000000
SAXIFRAGA integrifolia Hook.	KR, NCoR, ScV	0039000200
SAXIFRAGA marshallii E. Greene	NCo, KR, NCoRO	0025000000
SAXIFRAGA mertensiana Bong.	NCo, KR, NCoRO, uncommon in n&c SN	0025d80000
SAXIFRAGA nidifica E. Greene var. nidifica	KR, NCoR, CaR, SNH, MP	063bc00104
SAXIFRAGA nuttallii Small	NCo (Del Norte Co.)	0004000000
SAXIFRAGA odontoloma Piper	KR, NCoRH, CaRH, SNH, SnBr	0409c00500
SAXIFRAGA oregana J. Howell	KR, CaRH, SN, MP	0403f88104
SAXIFRAGA rivularis L.	c&s SNH	0000800100
SAXIFRAGA rufidula (Small) Macoun	KR (Marble Mtns, Siskiyou Co.)	0001000000
SAXIFRAGA stolonifera Meerb.	s NCoRO, expected more widely	0020000000
SAXIFRAGA tolmiei Torrey & A. Gray	KR, NCoRH, CaRH, SNH	0409c00100
SAXIFRAGOPSIS fragarioides (E. Greene) Small	KR	0001000000
SCABIOSA atropurpurea L.	CCo, SnFrB, SCoRO, SnBr, PR	0140024c00
SCABIOSA stellata L.	SCo	0080000000
SCANDIX pecten-veneris L.	CA-FP, esp NCo, SnFrB	1ffdfbff01
SCHEUCHZERIA palustris L. ssp. americana (Fern.) Hult<#e9>n	s CaRH	0400000000
SCHINUS molle L.	SNF, Teh, GV, CW, SW	19c03bfe01
SCHINUS polygamus (Cav.) Cabr.	SCo (Los Angeles, Riverside, and San Bernardino cos.)	0080000000
SCHINUS terebinthifolius Raddi	s SCo	0080000000
SCHISMUS arabicus Nees	SnJV, CW, s ChI, W&I, D	f100032802
SCHISMUS barbatus (L.) Thell.	Teh, SnJV, SW, D	f8c000f401
SCHIZACHYRIUM scoparium (Michaux) Nash	ScV (Solano Co.)	0000000200
SCHKUHRIA multiflora Hook. & Arn. var. multiflora	e DMoj	6000000000
SCHOENUS nigricans L.	SnBr, DMoj	6000000400
SCIRPUS acutus Bigelow var. occidentalis (S. Watson) Beetle	CA (exc e D)	ffffffff07
SCIRPUS americanus Pers.	CA (exc SNH)	ffffffff07
SCIRPUS californicus (C. Meyer) Steudel	NCo, GV, CCo, SnFrB, SCo, e D (Colorado River)	e184002a00
SCIRPUS cernuus (Roemer & Schultes)Vahl	NCo, deltaic GV, CCo, SnFrB, SCo, SnBr	0184002e00
SCIRPUS clementis M.E. Jones	c&s SNH	0000800100
SCIRPUS congdonii Britton	KR, NCoR, CaR, MP	063b000004
SCIRPUS diffusus Schuyler	KR, s CaR, SN	0601f88100
SCIRPUS fluviatilis (Torrey) A. Gray	NCoR, n SNH, ScV, SnFrB, MP	003a400a04
SCIRPUS heterochaetus A. Chase	s CaRH (Wilson Lake)	0400000000
SCIRPUS koilolepis (Steudel) Gleason	NCo, NCoRO, CCo, SnFrB	0124000800
SCIRPUS maritimus L.	NW, GV, CW, SW, MP, D	f9ff037e05
SCIRPUS microcarpus C. Presl	CA (exc D)	1fffffff07
SCIRPUS mucronatus L.	NCoRO, ScV, SnFrB, SCo	00a0000a00
SCIRPUS nevadensis S. Watson	GB	0002040006
SCIRPUS pendulus Muhl.	n CaRH (near Yreka)	0400000000
SCIRPUS pumilus Vahl	c SNH (Convict Creek, Mono Co.)	0000800000
SCIRPUS pungens Vahl	NCo, SN, SnJV, CW, SCo, GB, DMoj	6186ffa906
SCIRPUS robustus Pursh	KR, SnFrB, SCo	0081000800
SCIRPUS saximontanus Fern.	GV, WTR	0000002201
SCIRPUS setaceus L.	NCo, n SN	0004480000
SCIRPUS subterminalis Torrey	KR, n SNH	0001400000
SCIRPUS tabernaemontani C. Gmelin	NW, SnJV, SnFrB, SCo, DSon	80bd002800
SCIRPUS tuberosus Desf.	GV, SnFrB	0000002a00
SCLERANTHUS annuus L. ssp. annuus	KR, NCoRH, NCoRO, CaR, n SN, PR	0669484000
SCLEROCACTUS johnsonii (Engelm.) N.P. Taylor	n DMoj (Inyo Co.)	2000000000
SCLEROCACTUS polyancistrus (Engelm. & J. Bigelow) Britton & Rose	W&I, DMoj	6000000002
SCLEROCHLOA dura (L.) P. Beauv.	w CaRH (Shasta Valley)	0400000000
SCLEROLINON digynum (A. Gray) C. Rogers	KR, CaR, SN	0601f88100
SCLEROPOGON brevifolius Philippi	e DMtns (New York Mtns)	4000000000
SCOLIOPUS bigelovii Torrey	NCoRO, SnFrB	0020000800
SCOLYMUS hispanicus L.	se ScV, SnFrB	0000000a00
SCOPULOPHILA rixfordii (Brandegee) Munz & I.M. Johnston	SNE, n DMoj	2000040002
SCORZONERA hispanica L.	NCoRO	0020000000
SCRIBNERIA bolanderi (Thurber) Hackel	CA-FP (exc most SW)	1ffdfbff01
SCROPHULARIA atrata Pennell	s SCoRO (Santa Barbara, s San Luis Obispo cos.)	0000020000
SCROPHULARIA californica Cham. & Schldl.	NW, SN, CW, SCo, WTR	01bdfb8901
SCROPHULARIA californica Cham. & Schldl. ssp. californica	w NW, w CW, WTR	013d030801
SCROPHULARIA californica Cham. & Schldl. ssp. floribunda (E. Greene) Shaw	e NW, s SN, e CW, SCo	01bd230900
SCROPHULARIA desertorum (Munz) Shaw	SN, SNE, n DMtns	4000fc8102
SCROPHULARIA lanceolata Pursh	KR, CaR	0601000000
SCROPHULARIA villosa Pennell	s ChI (Santa Catalina, San Clemente islands)	1000000000
SCUTELLARIA antirrhinoides Benth.	NW, CaR, n SNF, MP	063f080004
SCUTELLARIA bolanderi A. Gray	SN, SCoRI, SnBr, PR, s DMoj	6040f9c500
SCUTELLARIA bolanderi A. Gray ssp. austromontana Epling	SnBr, PR, s DMoj	6040004400
SCUTELLARIA bolanderi A. Gray ssp. bolanderi	SN, SCoRI (Santa Clara Co.)	0000f98100
SCUTELLARIA californica A. Gray	KR, NCoR, n SN	0039480000
SCUTELLARIA galericulata L.	n SNH (Tahoe Basin), MP (Fall River)	0002400004
SCUTELLARIA lateriflora L.	n SnJV, SNE (Saline Valley)	0000042002
SCUTELLARIA nana A. Gray	CaR, n SN, MP	0602480004
SCUTELLARIA siphocampyloides Vatke	CA-FP (exc GV)	1ffdfbdd01
SCUTELLARIA tuberosa Benth.	CA-FP (exc GV)	1ffdfbdd01
SECALE cereale L.	n SNH, sw SnFrB, s MP, expected elsewhere	0002400804
SEDUM albomarginatum R.T. Clausen	n SNF (Plumas Co.)	0000080000
SEDUM divergens S. Watson	KR	0001000000
SEDUM eastwoodiae (Britton) A. Berger	c NCoRO (Red Mtn, Mendocino Co.)	0020000000
SEDUM lanceolatum Torrey	KR, CaR, SN	0601f88100
SEDUM laxum (Britton) A. Berger	NCo, n NCoR, KR	003d000000
SEDUM laxum (Britton) A. Berger ssp. flavidum Denton	n NCoRH, KR	0009000000
SEDUM laxum (Britton) A. Berger ssp. heckneri (M. Peck) R.T. Clausen	n NCoRO, KR	0021000000
SEDUM laxum (Britton) A. Berger ssp. laxum	NCo, KR	0005000000
SEDUM niveum Davidson	SnBr, e PR (Santa Rosa Mtns)	0040000400
SEDUM oblanceolatum R.T. Clausen	n KR (nw Siskiyou Co.)	0001000000
SEDUM obtusatum A. Gray	NCoRH, KR, CaRH, SN	0409f88100
SEDUM obtusatum A. Gray ssp. boreale R.T. Clausen	CaRH, SN	0400f88100
SEDUM obtusatum A. Gray ssp. obtusatum	KR, SN	0001f88100
SEDUM obtusatum A. Gray ssp. retusum (Rose) R.T. Clausen	NCoRH, KR	0009000000
SEDUM oreganum Nutt.	n KR	0001000000
SEDUM oregonense (S. Watson) M. Peck	KR	0001000000
SEDUM paradisum (Denton) Denton	se KR (Trinity Co.)	0001000000
SEDUM radiatum S. Watson	KR, NCoR, SNH, SnFrB, SCoRO	0039c20900
SEDUM roseum (L.) Scop. ssp. integrifolium (Raf.) Hult<#e9>n	KR, c SNF, SNH, Wrn, W&I	0001d00106
SEDUM spathulifolium Hook.	NW, CaR, SN, CW, TR	073dfb9d01
SEDUM stenopetalum Pursh	KR, CaR, n SNH, MP	0603400004
SELAGINELLA asprella Maxon	s SNF, TR, PR	0040205401
SELAGINELLA bigelovii L. Underw.	s NW, s SN, CW, SW, sw edge DMoj	39fd235d01
SELAGINELLA cinerascens Maxon	s SCo (San Diego Co.)	0080000000
SELAGINELLA densa Rydb. var. scopulorum (Maxon) Tryon	n KR	0001000000
SELAGINELLA eremophila Maxon	e PR, DSon	8040000000
SELAGINELLA hansenii Hieron.	s NCoRI, CaR, SN, ScV (Sutter Buttes), n SCoR	0610fb8300
SELAGINELLA leucobryoides Maxon	DMtns (Panamint, Kingston, Providence Mtns)	4000000000
SELAGINELLA oregana D. Eaton	NCo	0004000000
SELAGINELLA wallacei Hieron.	NW, nnw SNF (Butte Co)	003d080000
SELAGINELLA watsonii L. Underw.	KR (Trinity Alps), SNH, TR, PR, n SNE, W&I	0041c45501
SELINOCARPUS nevadensis (Standley) Fowler & B. Turner	DMtns (ne Kingston Range, se Inyo Co.)	4000000000
SENECIO aphanactis E. Greene	CW, SCo, ChI	1980030800
SENECIO aronicoides DC.	NW, CaR, SN (exc Teh), n CW	073dfb0900
SENECIO astephanus E. Greene	s SCoRO, TR	0000021401
SENECIO bernardinus E. Greene	e SnBr	0000000400
SENECIO blochmaniae E. Greene	s CCo	0100000000
SENECIO bolanderi A. Gray var. bolanderi	NCo	0004000000
SENECIO breweri Burtt Davy	s SNF, Teh, e SnJV, c&s CW, n WTR	010023a801
SENECIO californicus DC.	s SN, Teh, CW, SW, w DSon	99c023dd01
SENECIO canus Hook.	e KR, CaR, SN, GB	0603fc8106
SENECIO clarkianus A. Gray	c&s SN	0000b00100
SENECIO clevelandii E. Greene	s NCoRI (Napa, Lake cos.), c SNF (Tuolumne Co.)	0010100000
SENECIO cymbalarioides J.N. Buek	s CaRH, n&c SNH, MP	0402c00004
SENECIO elegans L.	CCo, SnFrB, SCo	0180000800
SENECIO eurycephalus A. Gray	e NW, CaR, n SNH, MP	063f400004
SENECIO eurycephalus A. Gray var. eurycephalus	e NW, CaR, MP	063f000004
SENECIO eurycephalus A. Gray var. lewisrosei (J. Howell) T. Barkley	n SNH (Feather River drainage, e Butte, Plumas cos.)	0000400000
SENECIO flaccidus Less.	CA-FP (exc NCo, KR), SNE, D	fff8ffff03
SENECIO flaccidus Less. var. douglasii (DC.) B. Turner & T. Barkley	CA-FP (exc NCo, KR)	1ff8fbff01
SENECIO flaccidus Less. var. monoensis (E. Greene) B. Turner & T. Barkley	SNE, D	e000040002
SENECIO fremontii Torrey & A. Gray	CaRH, SN, SnBr, Wrn, SNE	0400fc8506
SENECIO fremontii Torrey & A. Gray var. fremontii	CaRH, Wrn	0400000004
SENECIO fremontii Torrey & A. Gray var. occidentalis A. Gray	SN, SnBr, SNE	0000fc8502
SENECIO ganderi T. Barkley & Beauch.	sw PR (sw San Diego Co.)	0040000000
SENECIO greenei A. Gray	s KR, NCoR	0039000000
SENECIO hybridus Regel	SnFrB	0000000800
SENECIO hydrophiloides Rydb.	e CaRH, n SN, MP	0402480004
SENECIO hydrophilus Nutt.	s NCoR, CaR, SN, deltaic GV, n CW, GB	073affab06
SENECIO indecorus E. Greene	s MP (Pine Creek, Lassen Co.)	0002000004
SENECIO integerrimus Nutt.	KR, NCoRI, CaR, SN (exc Teh), GB	0613fc0106
SENECIO integerrimus Nutt. var. exaltatus (Nutt.) Cronq.	CaR, SN (exc Teh), GB	0602fc0106
SENECIO integerrimus Nutt. var. major (A. Gray) Cronq.	KR, NCoRI, CaRH, SN, W&I	0411f88102
SENECIO integerrimus Nutt. var. ochroleucus (A. Gray) Cronq.	KR	0001000000
SENECIO ionophyllus E. Greene	s SN, SnGb, SnBr	0000201500
SENECIO jacobaea L.	NCo, w KR, sw CaR, n SN, n ScV, SnFrB	0605480a00
SENECIO layneae E. Greene	n SNF (El Dorado, Tuolumne cos.)	0000080000
SENECIO lyonii A. Gray	s ChI (Santa Catalina, San Clemente islands)	1000000000
SENECIO macounii E. Greene	nw KR (Del Norte Co.)	0001000000
SENECIO mikanioides Walp.	NCo, CCo, SnFrB	0104000800
SENECIO mohavensis A. Gray	D	e000000000
SENECIO multilobatus A. Gray	SNH (e slope), SNE, DMtns	4000c40102
SENECIO pattersonensis Hoover	c SNH, SNE	0000840002
SENECIO pauciflorus Pursh	SNH	0000c00100
SENECIO pseudaureus Rydb. var. pseudaureus	CaRH, SN, Wrn	0400f88104
SENECIO scorzonella E. Greene	CaRH, SNH, n SNE, n W&I	0400c40100
SENECIO serra Hook. var. serra	s SNF, SNE	0000240002
SENECIO spartioides Torrey & A. Gray	SNH (e slope), SnBr, SNE, n DMtns	4000c40502
SENECIO streptanthifolius E. Greene	CaR, SNH, MP	0602c00104
SENECIO sylvaticus L.	NCo, n CCo, SnFrB	0104000800
SENECIO triangularis Hook.	KR, CaR, SN, SnGb, SnBr, PR, MP	0643f8d504
SENECIO vulgaris L.	CA (exc D)	1fffffff07
SENECIO werneriifolius A. Gray	n&c SNH, n SNE, n W&I	0000c40000
SENNA armata (S. Watson) H. Irwin & Barneby	D	e000000000
SENNA covesii (A. Gray) H. Irwin & Barneby	DSon	8000000000
SENNA didymobotrya (Fresen.) H. Irwin & Barneby	s CCo, expected elsewhere	0100000000
SENNA multiglandulosa (Jacq.) H. Irwin & Barneby	CCo, SnFrB	0100000800
SENNA obtusifolia (L.) Irwin & Barneby	DSon (Riverside Co.)	8000000000
SEQUOIA sempervirens (D. Don) Endl.	NCo, w KR, NCoRO, w NCoRI, CCo, SnFrB, n SCoRO	0135020800
SEQUOIADENDRON giganteum (Lindley) Buchholz	c&s SNH	0000800100
SESBANIA exaltata (Raf.) Cory	DSon, probably elsewhere	8000000000
SESUVIUM verrucosum Raf.	GV, SCoRO, SCo, WTR, PR, SNE, D	e0c0066203
SETARIA faberi R. Herrm.	Deltaic GV, CCo, SCo	0180002200
SETARIA gracilis Kunth	GV, CW, SCo, SNE (very uncommon), DMoj	6180072a02
SETARIA pumila (Poiret) Roemer & Schultes	e KR, CaRF, SNF, GV, CW, SCo, SNE, DMoj	63813f2a02
SETARIA sphacelata (Schum.) Moss	GV	0000002200
SETARIA verticillata (L.) P. Beauv.	SnJV, SW	18c0007401
SETARIA viridis (L.) P. Beauv.	CA-FP, DSon	9ffdfbff01
SHEPHERDIA argentea Nutt.	c SNH, SCoR, WTR, SnBr, n SNE	0000870401
SHEPHERDIA canadensis (L.) Nutt.	KR (Siskiyou Co.)	0001000000
SHERARDIA arvensis L.	NCoRO, CaRF, n SNF, SnFrB, SCoRO, SCo	02a00a0800
SIBARA deserti (M.E. Jones) Rollins	n DMoj	2000000000
SIBARA filifolia (E. Greene) E. Greene	ChI (Santa Catalina, Santa Cruz islands)	1800000000
SIBARA rosulata Rollins	e DMoj	6000000000
SIBARA virginica (L.) Rollins	GV	0000002200
SIBBALDIA procumbens L.	KR, CaRH, SNH, SnBr, Wrn, SNE	0401c40506
SIDA rhombifolia L.	GV	0000002200
SIDALCEA calycosa M.E. Jones	NCo, NCoRO, CaRF, SNF, CCo, n SnFrB	0324380800
SIDALCEA calycosa M.E. Jones ssp. calycosa	NCoRO, CaRF, SNF, n SnFrB	0220380800
SIDALCEA calycosa M.E. Jones ssp. rhizomata (Jepson) Munz	c&s NCo (Mendocino, Sonoma cos.), n CCo (Marin Co.)	0104000000
SIDALCEA covillei E. Greene	SNE (Owens Valley, Inyo Co.)	0000040002
SIDALCEA diploscypha (Torrey & A. Gray) Benth.	NCoRO, CaRF, n&c SNF, ScV, CCo, SnFrB	0320180a00
SIDALCEA glaucescens E. Greene	CaRH, n&c SNH	0400c00000
SIDALCEA hartwegii Benth.	NCoRI, CaRF, ScV, n&c SNF	0210180200
SIDALCEA hickmanii E. Greene	s NCo, n CCo, SCoRO, w WTR, SnBr	0104020401
SIDALCEA hickmanii E. Greene ssp. anomala C. Hitchc.	SCoRO (near Cuesta Pass, San Luis Obispo Co.)	0000020000
SIDALCEA hickmanii E. Greene ssp. hickmanii	SCoRO (Santa Lucia Mtns, Monterey Co.)	0000020000
SIDALCEA hickmanii E. Greene ssp. parishii (Robinson) C. Hitchc.	SCoRO & WTR (Santa Barbara Co.), SnBr	0000020401
SIDALCEA hickmanii E. Greene ssp. viridis C. Hitchc.	s NCo (Sonoma Co.), n CCo (Marin, San Francisco, San Mateo cos.)	0104000000
SIDALCEA hirsuta A. Gray	NCoR, CaRF, n&c SNF, GV	0238182200
SIDALCEA keckii Wiggins	s SNF (White River region, s Tulare Co.)	0000200000
SIDALCEA malachroides (Hook. & Arn.) A. Gray	NCo, NCoRO, n&c CCo, SnFrB, n SCoRO	0124020800
SIDALCEA malviflora (DC.) Benth.	CA-FP	1ffdfbff01
SIDALCEA malviflora (DC.) Benth. ssp. asprella (E. Greene) C. Hitchc.	NW, CaR, n&c SN	063dd80000
SIDALCEA malviflora (DC.) Benth. ssp. californica (Torrey & Gray) C. Hitchc.	s SCoRO, WTR	0000020001
SIDALCEA malviflora (DC.) Benth. ssp. dolosa C. Hitchc.	SnBr	0000000400
SIDALCEA malviflora (DC.) Benth. ssp. laciniata C. Hitchc.	s NCoRO, CW, nw SnJV	0120032800
SIDALCEA malviflora (DC.) Benth. ssp. malviflora	s NCo, NCoRO, CCo, SnFrB, SCo, n ChI	09a4000800
SIDALCEA malviflora (DC.) Benth. ssp. patula C. Hitchc.	n NCo (Del Norte, Humboldt cos.)	0004000000
SIDALCEA malviflora (DC.) Benth. ssp. purpurea C. Hitchc.	c NCo (n Sonoma, s Mendocino cos.), n CCo (San Mateo Co.)	0104000000
SIDALCEA malviflora (DC.) Benth. ssp. sparsifolia C. Hitchc.	s SNF, SCoRO, SW	18c0225401
SIDALCEA multifida E. Greene	SNE, c&s SNH	0000840102
SIDALCEA neomexicana A. Gray	SCo, PR, SnGb, SnBr, sw DMoj	60c0005400
SIDALCEA oregana (Torrey & A. Gray) A. Gray	NW, CaR, n&c SNH, GB	063fc40006
SIDALCEA oregana (Torrey & A. Gray) A. Gray ssp. eximia (E. Greene) C. Hitchc.	n NCo, NCoRO	0024000000
SIDALCEA oregana (Torrey & A. Gray) A. Gray ssp. hydrophila (A.A. Heller) C. Hitchc.	NCoRH, NCoRI	0018000000
SIDALCEA oregana (Torrey & A. Gray) A. Gray ssp. oregana	NW, CaR, MP	063f000004
SIDALCEA oregana (Torrey & A. Gray) A. Gray ssp. spicata (Regel) C. Hitchc.	KR, n NCoRH, CaRH, n&c SNH, GB	040bc40006
SIDALCEA oregana (Torrey & A. Gray) A. Gray ssp. valida (E. Greene) C. Hitchc.	s NCoRO (near Kenwood, Sonoma Co.)	0020000000
SIDALCEA pedata A. Gray	SnBr (Bear Valley, Bluff Lake)	0000000400
SIDALCEA ranunculacea E. Greene	s SNF (Greenhorn Mtns, Tulare and Kern cos.)	0000200000
SIDALCEA reptans E. Greene	SN (esp c SNH)	0000f88100
SIDALCEA robusta E.M. Roush	s CaRF, n SNF (Butte Co.)	0200080000
SIDALCEA stipularis J. Howell & True	n SNF (Scadden Flat, Grass Valley, Nevada Co.)	0000080000
SILENE antirrhina L.	CA-FP, D (uncommon)	fffdfbff01
SILENE aperta E. Greene	s SNH (Tulare Co.)	0000000100
SILENE bernardina S. Watson	KR, NCoR, CaR, SN, GB, n DMtns	463bfc8106
SILENE bridgesii Rohrb.	s CaR, SN	0600f88100
SILENE californica Durand	NW, CaR, SN, CCo, SnFrB, n SCoRO, WTR (n slope), w SnGb	073dfa9901
SILENE campanulata S. Watson	KR, NCoR, n CaR	0639000000
SILENE campanulata S. Watson ssp. campanulata	c NCoR (Red Mtn, Mendocino Co.; Cook's Springs, Colusa Co.)	0038000000
SILENE campanulata S. Watson ssp. glandulosa C. Hitchc. & Maguire	KR, NCoR, n CaR	0639000000
SILENE conoidea L.	n SN, SCo, DSon	8080480000
SILENE dichotoma Ehrh.	CaR, SnFrB, SCo	0680000800
SILENE douglasii Hook.	KR, n NCoR, CaR, n&c SN, MP	063bd80004
SILENE gallica L.	CA-FP	1ffdfbff01
SILENE grayi S. Watson	KR, n CaR	0601000000
SILENE hookeri Nutt.	n NW	003d000000
SILENE invisa C. Hitchc. & Maguire	s CaRH, n SNH	0400400000
SILENE laciniata Cav. ssp. major C. Hitchc. & Maguire	s SCoRO, SW	18c0025401
SILENE latifolia Poiret ssp. alba (Miller) Greuter & Burdet	NCo, NCoRO, s SNF, GV, SnFrB	0024202a00
SILENE lemmonii S. Watson	NW, CaR, SN, w SnFrB (Santa Cruz Mtns), SCoR, TR, PR, MP	067ffbdd05
SILENE marmorensis Kruckeb.	KR (Humboldt, Siskiyou cos.)	0001000000
SILENE menziesii Hook.	KR, NCoR, CaR, SN, SnBr, GB	063bfc8506
SILENE multinervia S. Watson	s NCoRO, CCo, SnFrB, SCoRO, SW	19e0025c01
SILENE noctiflora L.	CaR, SNF, SCo (expected elsewhere)	0680380000
SILENE nuda (S. Watson) C. Hitchc. & Maguire	n&c SNH, MP	0002c00004
SILENE occidentalis S. Watson	s CaRH, n SNH, MP	0402400004
SILENE occidentalis S. Watson ssp. longistipitata C. Hitchc. & Maguire	s CaRH (Butte, Tehama cos.)	0400000000
SILENE occidentalis S. Watson ssp. occidentalis	s CaRH, n SNH, MP	0402400004
SILENE oregana S. Watson	Wrn	0000000004
SILENE parishii S. Watson	SnGb, SnBr, e PR (SnJt, Santa Rosa Mtns, Hot Springs Mtn)	0040005400
SILENE sargentii S. Watson	SNH, SNE (Sweetwater & White Mtns)	0000c40102
SILENE scouleri Hook. ssp. grandis (Eastw.) Hitchc. & Maguire	NCo, CCo, SnFrB	0104000800
SILENE suksdorfii Robinson	CaRH (Mount Shasta, Lassen Peak)	0400000000
SILENE verecunda S. Watson	c&s NCoR, SN, CW, TR, PR, W&I, DMtns	4178fbdd03
SILENE verecunda S. Watson ssp. andersonii (Clokey) C. Hitchc. & Maguire	SNH (e slope), W&I, DMtns	4000c00102
SILENE verecunda S. Watson ssp. platyota (S. Watson) C. Hitchc. & Maguire	c&s NCoR, c&s SN, SnFrB, SCoR, TR, PR	0078b35d01
SILENE verecunda S. Watson ssp. verecunda	n CCo, SnFrB	0100000800
SILENE vulgaris (Moench) Garcke	CaR, GV, SnFrB, SCo (expected elsewhere)	0680002a00
SILYBUM marianum (L.) Gaertner	NCo, NCoR, GV, SnFrB, SCoR, SCo, ChI	18bc032a00
SIMMONDSIA chinensis (Link) C. Schneider	w PR, SnJt, DSon	8040000000
SINAPIS alba L.	CCo, SCo, expected elsewhere	0180000000
SINAPIS arvensis L.	CA-FP (exc SNH)	1ffdfbff01
SISYMBRIUM altissimum L.	CA	ffffffff07
SISYMBRIUM erysimoides Desf.	SCo	0080000000
SISYMBRIUM irio L.	GV, SW, W&I, DMtns	58c0007603
SISYMBRIUM loeselii L.	GB	0002040006
SISYMBRIUM officinale L.	CA-FP	1ffdfbff01
SISYMBRIUM orientale L.	CA (exc NW, CaR, SN)	f9c2077e07
SISYRINCHIUM bellum S. Watson	CA	ffffffff07
SISYRINCHIUM californicum (Ker Gawler) Dryander	NCo, n&c CCo, SnFrB	0104000800
SISYRINCHIUM douglasii A. Dietr. var. douglasii	KR, n NCoRO, CaR, MP	0623000004
SISYRINCHIUM elmeri E. Greene	s KR, s CaRH, SN, SnBr	0401f88500
SISYRINCHIUM funereum E. Bickn.	ne DMoj (Death Valley region)	6000000000
SISYRINCHIUM halophilum E. Greene	SNE, adjacent DMoj	2000040002
SISYRINCHIUM idahoense E. Bickn.	KR, CaR, SN, GB	0603fc8106
SISYRINCHIUM idahoense E. Bickn. var. idahoense	KR, CaR, MP	0603000004
SISYRINCHIUM idahoense E. Bickn. var. occidentale (E. Bickn.) D. Henderson	SN, SNE	0000fc8102
SIUM suave Walter	SnFrB (Suisun Marshes), GB	0002040806
SMELOWSKIA ovalis M.E. Jones var. congesta Rollins	CaRH (Lassen Peak)	0400000000
SMILACINA racemosa (L.) Link	NW, CaR, SN, CW, TR	073dfb9d01
SMILACINA stellata (L.) Desf.	CA-FP, W&I	1ffdfbff03
SMILAX californica (A. DC.) A. Gray	NW, CaRF, n SNF	023d080000
SMILAX jamesii G.A. Wallace	KR, CaR?	0601000000
SOLANUM americanum Miller	CA-FP, DMoj (uncommon)	7ffdfbff01
SOLANUM aviculare Forst. f.	NCo, n CCo	0104000000
SOLANUM carolinense L.	s NCoRO, n SN, GV, SCo	00a0482200
SOLANUM dimidiatum Raf.	GV, SCo	0080002200
SOLANUM douglasii Dunal	s NCo, Teh, CW, SW, DMoj	79c403dc01
SOLANUM dulcamara L.	CCo, SnFrB, MP	0102000804
SOLANUM elaeagnifolium Cav.	CA (exc NCo, KR, GB)	fff8fbff01
SOLANUM furcatum Dunal	NCo, CCo, SnFrB	0104000800
SOLANUM lanceolatum Cav.	GV, SnFrB, SCo	0080002a00
SOLANUM marginatum L.	CCo, SCo	0180000000
SOLANUM mauritianum Scop.	SCo (Riverside Co.)	0080000000
SOLANUM nigrum L.	NCo, n CCo, SnFrB (expected elsewhere)	0104000800
SOLANUM parishii A.A. Heller	CA-FP (exc GV), MP	1ffffbdd05
SOLANUM rostratum Dunal	s NCoRO, CaRF, GV, CCo, s SCoRO, SCo	03a0022200
SOLANUM sarrachoides Sendtner	NCo, KR, CaRF, GV, w CW, SCo, n ChI (Santa Cruz Island), SNE	0b85072a02
SOLANUM sisymbriifolium Lam.	GV (expected elsewhere)	0000002200
SOLANUM triflorum Nutt.	s SNH (e slope), SCo, GB, n DMoj	2082040106
SOLANUM umbelliferum Eschsch.	NW (uncommon), deltaic GV, CW, SW	19fd037e01
SOLANUM wallacei (A. Gray) Parish	ChI	1800000000
SOLANUM xanti A. Gray	CA-FP (exc CaR, GV), n DMtns	59fdfbdd01
SOLEIROLIA soleirolii (Req.) Dandy	CCo, SnFrB, SCo, s ChI	1180000800
SOLIDAGO altissima L. var. altissima	NW, CaR, SN, CW, GB	073fff8906
SOLIDAGO californica Nutt.	CA-FP, MP, W&I	1ffffbff07
SOLIDAGO canadensis L. ssp. elongata (Nutt.) Keck	NW, CaR, SN, CW, GB	073fff8906
SOLIDAGO confinis A. Gray	Teh, CCo (formerly SnFrB), SCoR, SW, W&I, n DMtns	59c003d403
SOLIDAGO gigantea Aiton	n SNH, MP	0002400004
SOLIDAGO guiradonis A. Gray	s SCoRI (San Benito, Fresno cos.)	0000010000
SOLIDAGO multiradiata Aiton	KR, CaRH, SN, n SNE, W&I	0401fc8100
SOLIDAGO sparsiflora A. Gray	GB	0002040006
SOLIDAGO spathulata DC. ssp. spathulata	NCo, CCo	0104000000
SOLIDAGO spectabilis (D. Eaton) A. Gray	CaRH, n SNH (e slope), GB	0402440006
SOLIVA sessilis Ruiz Lopez & Pavon	NW, SNF, CW, SW, expected elsewhere	19fd3b5c01
SOLLYA heterophylla Lindley	CCo, SCo	0180000000
SONCHUS arvensis L.	KR, CaRH, ScV, SCo	0481000200
SONCHUS asper (L.) Hill ssp. asper	CA	ffffffff07
SONCHUS oleraceus L.	CA	ffffffff07
SONCHUS tenerrimus L.	SnJV, ChI, PR	1840006000
SORBUS aucuparia L.	SnFrB, SnBr (expected elsewhere)	0000000c00
SORBUS californica E. Greene	KR, NCoRH, CaR, SNH, SnFrB, Wrn?	0609c00904
SORBUS scopulina E. Greene	KR, NCoR, CaR, SNH, MP	063bc00104
SORBUS scopulina E. Greene var. cascadensis (G. Jones) C. Hitchc.	KR, n NCoR, CaR, n SNH, MP	063b400004
SORBUS scopulina E. Greene var. scopulina	KR, NCoR, CaR, SNH, MP	063bc00104
SORBUS sitchensis K.F. Roemer var. grayi (Wenzig) C. Hitchc.	c KR (Salmon Mtns)	0001000000
SORGHUM bicolor (L.) Moench	NCo, NCoR, GV, CCo, SCo, D	e1bc002200
SORGHUM halepense (L.) Pers.	NW, CaRF, SNF, GV, CW, SW, DSon	9bfd3b7e01
SPARAXIS grandiflora (Delaroche) Ker Gawler	CCo	0100000000
SPARAXIS tricolor (Schneev.) Ker Gawler	CCo	0100000000
SPARGANIUM angustifolium Michaux	KR, SNH	0001c00100
SPARGANIUM emersum Rehmann ssp. emersum	NCo, KR, NCoRO, CaRH, SNH, SnBr, MP	0427c00504
SPARGANIUM erectum L. ssp. stoloniferum (Graebner) C. Cook & M.S. Nicholls	NCo, NCoR, n SNH, GV, CCo, SnFrB, SCoRO, SCo, PR, MP	01fe426a04
SPARGANIUM eurycarpum Engelm. ssp. eurycarpum	NCoRI, s SNF, GV, CCo, SnFrB, SCoRI, MP	0112212a04
SPARGANIUM natans L.	CaRH, n&c SNH, MP	0402c00004
SPARTINA alterniflora Lois.	CCo (San Francisco Bay)	0100000000
SPARTINA densiflora Brongn.	NCo, CCo	0104000000
SPARTINA foliosa Trin.	NCo, CCo, SCo	0184000000
SPARTINA gracilis Trin.	SNE, n DMoj	2000040002
SPARTINA patens (Aiton) Muhlenb.	CCo	0100000000
SPARTIUM junceum L.	NCoRO, ScV, SnFrB, SCoRO, SCo, s ChI, WTR	10a0020a01
SPERGULA arvensis L. ssp. arvensis	NCo, NCoRO, SnJV, CCo, SnFrB, SCoRO, SCo	01a4022800
SPERGULARIA atrosperma R. Rossbach	GV, PR, MP	0042006204
SPERGULARIA bocconei (Scheele) Merino	c SNF, GV, CCo, SCo, s ChI	1180102200
SPERGULARIA canadensis (Pers.) G. Don var. occidentalis R. Rossbach	n NCo (Humboldt Bay)	0004000000
SPERGULARIA macrotheca (Hornem.) Heynh.	NCo, NCoRI, GV, CCo, SnFrB, SCoRO, SCo, ChI, DMoj	7994022a00
SPERGULARIA macrotheca (Hornem.) Heynh. var. leucantha (E. Greene) Robinson	GV, SnFrB, SCoRO, SCo, DMoj	6080022a00
SPERGULARIA macrotheca (Hornem.) Heynh. var. longistyla R. Rossbach	NCo, NCoRI, GV	0014002200
SPERGULARIA macrotheca (Hornem.) Heynh. var. macrotheca	NCo, CCo, SCo, ChI	1984000000
SPERGULARIA marina (L.) Griseb.	NCo, NCoRO, c SNF, GV, CCo, SnFrB, SCo, ChI, PR, D	f9e4106a00
SPERGULARIA media (L.) Griseb.	n CCo (Marin, Contra Costa cos.)	0100000000
SPERGULARIA platensis (Cambess.) Fenzl	SCo, PR	00c0004000
SPERGULARIA rubra (L.) J.S. Presl & C. Presl	NW, CaR, c SNF, n&c SNH, ScV, CW, SCo, SnGb, PR	07fdd35a00
SPERGULARIA villosa (Pers.) Cambess.	NCoRO, n SNF, ScV, CCo, SCoRI, s ChI	1120090200
SPERMOLEPIS echinata (DC.) A.A. Heller	DSon (Borrego Valley)	8000000000
SPHAERALCEA ambigua A. Gray	s SNE, D	e000040002
SPHAERALCEA ambigua A. Gray var. ambigua	s SNE, D	e000040002
SPHAERALCEA ambigua A. Gray var. rosacea (Munz & I.M. Johnston) Kearney	D (esp DSon)	e000000000
SPHAERALCEA ambigua A. Gray var. rugosa (Kearney) Kearney	D	e000000000
SPHAERALCEA angustifolia (Cav.) G. Don	DMoj, n DSon	e000000000
SPHAERALCEA coulteri (S. Watson) A. Gray	s DSon	8000000000
SPHAERALCEA emoryi Torrey var. emoryi	s DMoj, DSon	e000000000
SPHAERALCEA grossulariifolia (Hook. & Arn.) Rydb.	se MP (Lassen Co.), naturalized in Santa Barbara Co	0002000004
SPHAERALCEA munroana (Douglas) Spach	n SNH (Squaw Creek, Placer Co.)	0000400000
SPHAERALCEA orcuttii Rose	s DSon	8000000000
SPHAERALCEA rusbyi A. Gray var. eremicola (Jepson) Kearney	n DMtns (Death Valley region, e Inyo Co.; Clark Mtns, ne San Bernardino Co.)	4000000000
SPHAEROMERIA cana (D.C. Eaton) A.A. Heller	c&s SNH, SNE, n DMtns	4000840102
SPHAEROMERIA potentilloides (A. Gray) A.A. Heller	n&c SNH, MP	0002c00004
SPHAEROMERIA potentilloides (A. Gray) A.A. Heller var. nitrophila (Cronq.) A. Holmgren, L. Schultz & T. Lowrey	c SNH	0000800000
SPHAEROMERIA potentilloides (A. Gray) A.A. Heller var. potentilloides	n&c SNH, MP	0002c00004
SPHAEROPHYSA salsula (Pall.) DC.	s SnJV, possibly elsewhere	0000002000
SPHENOPHOLIS obtusata (Michaux) Scribner	n SNH (Amador Co.), s SNH (Fresno Co.), ne SCo (Santa Ana River), sc PR (Cuyamaca Mtns)	00c0400100
SPHENOSCIADIUM capitellatum A. Gray	NCoRI, CaR, SNH, SW, GB	1ed2c45507
SPIRAEA densiflora Torrey & A. Gray	KR, CaR, SNH	0601c00100
SPIRAEA douglasii Hook.	n NCo, KR, CaR, n SNH, w MP	0607400004
SPIRANTHES porrifolia Lindley	NW (exc NCoRI), CaR, SN, SnFrB, SnGb, PR	066df8d900
SPIRANTHES romanzoffiana Cham.	NW, CaR, SN, CCo, SnFrB, MP	073ff88904
SPIRODELA polyrrhiza (L.) Schleiden	CA	ffffffff07
SPIRODELA punctata (G. Meyer) C. Thompson	NCo, GV, CCo, SnFrB, SCo	0184002a00
SPOROBOLUS airoides (Torrey) Torrey	SNF, Teh, s ScV, SnJV, s SCoRO, SW, GB, D	f8c23ef607
SPOROBOLUS contractus A. Hitchc.	W&I, e D	e000000002
SPOROBOLUS cryptandrus (Torrey) A. Gray	e-c SNH, SnBr, PR, SNE, D	e040844402
SPOROBOLUS flexuosus (Vasey) Rydb.	SNE, D	e000040002
SPOROBOLUS indicus (L.) R.Br.	s CCo, SCo, s PR	01c0000000
SPOROBOLUS vaginiflorus (A. Gray) Alph. Wood	e KR (nw Shasta Co.), n SNH (Grass Valley, Truckee Canyon)	0001400000
STACHYS ajugoides Benth.	CA	ffffffff07
STACHYS ajugoides Benth. var. ajugoides	NW, CW, SW	19fd035c01
STACHYS ajugoides Benth. var. rigida Jepson & Hoover	CA (very uncommon in D)	ffffffff07
STACHYS albens A. Gray	NCoR, c&s SN, Teh, GV, CCo, SW, W&I, rarely D	f9f8b0f703
STACHYS arvensis L.	NW, CW	013d030800
STACHYS bullata Benth.	CW, SW	19c0035c01
STACHYS chamissonis Benth.	NCo, CCo	0104000000
STACHYS palustris L. ssp. pilosa (Nutt.) Epling	MP	0002000004
STACHYS pycnantha Benth.	NW, CW, SN (uncommon)	013dfb8900
STACHYS stricta E. Greene	c&s NCoRI, n&c SNF, adjacent GV	0010182200
STANLEYA elata M.E. Jones	SNE, DMtns	4000040002
STANLEYA pinnata (Pursh) Britton	SCo (Conejo Valley), WTR, GB, DMoj	6082040007
STANLEYA pinnata (Pursh) Britton var. inyoensis (Munz & Roos) Rev.	W&I, n DMoj	2000000002
STANLEYA pinnata (Pursh) Britton var. pinnata	SCo (Conejo Valley), WTR, GB, DMoj	6082040007
STANLEYA viridiflora Torrey & A. Gray	s MP (Lassen Co.)	0002000004
STAPHYLEA bolanderi A. Gray	KR, CaR, SN	0601f88100
STEBBINSOSERIS decipiens (Chambers) Chambers	n&c CCo	0100000000
STEBBINSOSERIS heterocarpa (Nutt.) Chambers	NCoR, SNF, SnJV, CW, SCo, ChI, PR	19f83b6800
STELLARIA borealis Bigelow ssp. sitchana (Steudel) Piper	NCo, NCoRO, CaRH, c&s SNF, SNH	0424f00100
STELLARIA calycantha (Ledeb.) Bong.	KR, NCoRO, CaRF, n&c SN, Teh, SnGb, MP, W&I	0223d89006
STELLARIA crispa Cham. & Schldl.	NCo, KR, CaRH, n&c SNH	0405c00000
STELLARIA graminea L.	SnJV, SnFrB, SCo	0080002800
STELLARIA littoralis Torrey	NCo, CCo	0104000000
STELLARIA longifolia Willd.	CaRH (Goose Valley, Shasta Co.)	0400000000
STELLARIA longipes Goldie var. longipes	KR, NCoRI, CaRH, SN, SnBr, Wrn, n SNE, W&I	0411fc8504
STELLARIA media (L.) Villars	NW, CaRH, c SNF, GV, CCo, SnFrB, SCo, ChI, DSon	9dbd102a00
STELLARIA nitens Nutt.	NCo, KR, NCoR, n&c SNF, SNH, SnJV, CW, SW	19fddb7d01
STELLARIA obtusa Engelm.	NCoRO, CaR, c SNF, n&c SNH, MP	0622d00004
STELLARIA pallida (Dumort.) Pir<#e9>	c SNF, ScV, CCo, s ChI, PR	1140104200
STELLARIA umbellata Karelin & Kir.	CaRH, c&s SNH	0400800100
STEMODIA durantifolia (L.) Sw.	SnJt, DSon	8000004000
STENANTHIUM occidentale A. Gray	KR	0001000000
STENOTAPHRUM secundatum (Walter) Kuntze	CCo, SCo	0180000000
STENOTUS acaulis Nutt.	CaR, SN, GB, DMtns	4602fc8106
STENOTUS lanuginosus A. Gray	s MP (Lassen Co.)	0002000004
STENOTUS stenophyllus (A. Gray) E. Greene	MP	0002000004
STEPHANOMERIA blairii Munz & I.M. Johnston	s ChI (San Clemente Island)	1000000000
STEPHANOMERIA cichoriacea A. Gray	SCoR, SCo, ChI, TR	1880031401
STEPHANOMERIA diegensis Gottlieb	SCo, s ChI, WTR, PR	10c0004001
STEPHANOMERIA elata Nutt.	NW, CaRF, SN, CW	033dfb8900
STEPHANOMERIA exigua Nutt.	CA	ffffffff07
STEPHANOMERIA exigua Nutt. ssp. carotifera (Hoover) Gottlieb	CCo, SCoR, WTR	0100030001
STEPHANOMERIA exigua Nutt. ssp. coronaria (E. Greene) Gottlieb	KR, SNH, Teh, SnJV, CCo, ChI, TR, MP, n SNE	1903c4b505
STEPHANOMERIA exigua Nutt. ssp. deanei (J.F. Macbr.) Gottlieb	SCo, PR	00c0004000
STEPHANOMERIA exigua Nutt. ssp. exigua	GB, D	e002040006
STEPHANOMERIA exigua Nutt. ssp. macrocarpa Gottlieb	c&s SNF	0000300000
STEPHANOMERIA lactucina A. Gray	KR, NCoRO, CaRH, n&c SNH, MP	0423c00004
STEPHANOMERIA paniculata Nutt.	CaRH, n SNH	0400400000
STEPHANOMERIA parryi A. Gray	SNE, DMoj	6000040002
STEPHANOMERIA pauciflora (Torrey) Nelson	s SNH, Teh, SnJV, SCoRI, TR, SNE, D	e00005b503
STEPHANOMERIA pauciflora (Torrey) Nelson var. parishii (Jepson) Munz	DMoj	6000000000
STEPHANOMERIA pauciflora (Torrey) Nelson var. pauciflora	s SNH, Teh, SnJV, SCoRI, TR, SNE, D	e00005b503
STEPHANOMERIA spinosa (Nutt.) Tomb	SNH, SnGb, SnBr, MP, n SNE, W&I, DMtns	4002c41504
STEPHANOMERIA tenuifolia (Torrey) H.M. Hall	CaRH, SNH, MP	0402c00104
STEPHANOMERIA virgata Benth.	CA-FP	1ffdfbff01
STEPHANOMERIA virgata Benth. ssp. pleurocarpa (E. Greene) Gottlieb	CA-FP (exc. SCoRO, SCo, TR)	1f7df9eb00
STEPHANOMERIA virgata Benth. ssp. virgata	SCoRO, SW	18c0025401
STILLINGIA linearifolia S. Watson	SW, D	f8c0005401
STILLINGIA paucidentata S. Watson	DMoj, n DSon	e000000000
STILLINGIA spinulosa Torrey	D	e000000000
STREPTANTHELLA longirostris (S. Watson) Rydb.	s SnJV, SCoRI, SW, W&I, D	f8c0017403
STREPTANTHUS albidus E. Greene	e SnFrB, c SCoRO	0000020800
STREPTANTHUS albidus E. Greene ssp. albidus	se SnFrB (Santa Clara Co.)	0000000800
STREPTANTHUS albidus E. Greene ssp. peramoenus (E. Greene) Kruckeb.	e SnFrB, c SCoRO	0000020800
STREPTANTHUS barbatus S. Watson	KR	0001000000
STREPTANTHUS barbiger E. Greene	s NCoR, NCoRH	0038000000
STREPTANTHUS batrachopus J. Morrison	s NCoRO, nw SnFrB (Mount Tamalpais)	0020000800
STREPTANTHUS bernardinus (E. Greene) Parish	e TR, PR	0040005401
STREPTANTHUS brachiatus F.W. Hoffm.	s NCoRI	0010000000
STREPTANTHUS brachiatus F.W. Hoffm. ssp. brachiatus	sw NCoRI (Mayacamas Mtns, Sonoma Co.)	0010000000
STREPTANTHUS brachiatus F.W. Hoffm. ssp. hoffmanii R. Dolan & L. LaPr<#e9>	s NCoRI (Sonoma, Lake cos.)	0010000000
STREPTANTHUS breweri A. Gray	s-most KR, NCoRH, c&s NCoRI, e SnFrB, SCoRI	0019010800
STREPTANTHUS breweri A. Gray var. breweri	s-most KR, NCoRH, c&s NCoRI, e SnFrB, SCoRI	0019010800
STREPTANTHUS breweri A. Gray var. hesperidis (Jepson) Jepson	s NCoRI (Napa, s Lake cos.)	0010000000
STREPTANTHUS callistus J. Morrison	se SnFrB (Arroyo Bayo, Mount Hamilton Range)	0000000800
STREPTANTHUS campestris S. Watson	TR, PR	0040005401
STREPTANTHUS cordatus Nutt.	e CaRH, s SNH, GB, DMtns	4402040106
STREPTANTHUS cordatus Nutt. var. cordatus	e CaRH, MP, n SNE, e DMtns	4402040004
STREPTANTHUS cordatus Nutt. var. duranii Jepson	s SNE, W&I	0000040002
STREPTANTHUS cordatus Nutt. var. piutensis J. Howell	s SNH (Piute Mtns)	0000000100
STREPTANTHUS diversifolius S. Watson	c&s SNF	0000300000
STREPTANTHUS drepanoides Kruckeb. & J. Morrison	s-most KR, NCoRH, n NCoRI, n SNF (Butte Co.)	0019080000
STREPTANTHUS farnsworthianus J. Howell	c SNF (Madera, Fresno cos.), s SNF	0000300000
STREPTANTHUS fenestratus (E. Greene) J. Howell	c SNH (Kings River Canyon, Fresno Co.)	0000800000
STREPTANTHUS glandulosus Hook.	s NCoR, SnFrB, n&c SCoR	0038030800
STREPTANTHUS glandulosus Hook. ssp. glandulosus	s NCoRO (uncommon), s-most NCoRH, s NCoRI, SnFrB, n SCoRO (uncommon), n&c SCoRI	0038030800
STREPTANTHUS glandulosus Hook. ssp. pulchellus (E. Greene) Kruckeb.	nw SnFrB (Marin Co.)	0000000800
STREPTANTHUS glandulosus Hook. ssp. secundus (E. Greene) Kruckeb.	s NCoRO, sw NCoRI, nw SnFrB	0030000800
STREPTANTHUS gracilis Eastw.	se SNH (Kings-Kern Divide region)	0000000100
STREPTANTHUS hispidus A. Gray	ne SnFrB (Mount Diablo)	0000000800
STREPTANTHUS howellii S. Watson	n KR (Del Norte, Siskiyou cos.)	0001000000
STREPTANTHUS insignis Jepson	SCoRI	0000010000
STREPTANTHUS insignis Jepson ssp. insignis	SCoRI	0000010000
STREPTANTHUS insignis Jepson ssp. lyonii Kruckeb. & J. Morrison	SCoRI (near Ortigalita Peak, w Merced Co.)	0000010000
STREPTANTHUS morrisonii F.W. Hoffm.	c&s NCoR, c SCoRO?	0038020000
STREPTANTHUS niger E. Greene	n CCo (Tiburon Peninsula, Marin Co.)	0100000000
STREPTANTHUS oliganthus Rollins	n&c SNE (Sweetwater, Masonic mtns), n W&I (n White Mtns)	0000040002
STREPTANTHUS polygaloides A. Gray	SNF	0000380000
STREPTANTHUS tortuosus Kellogg	KR, NCoR, CaRH, SN, n SnFrB, SCoRO	0439fa8900
STREPTANTHUS tortuosus Kellogg var. flavescens Jepson	s SNH (Kings Canyon, Fresno Co.; Sawtooth Range, Tulare Co.)	0000000100
STREPTANTHUS tortuosus Kellogg var. orbiculatus (E. Greene) H.M. Hall	KR, NCoRH, CaRH, SN	0409f88100
STREPTANTHUS tortuosus Kellogg var. suffrutescens (E. Greene) Jepson	s NCoR (ne Sonoma Co.), n&c SNF, SCoRO (Santa Lucia Mtns)	00381a0000
STREPTANTHUS tortuosus Kellogg var. tortuosus	NCoR, CaRF, SNF, n SnFrB	0238380800
STREPTOPUS amplexifolius (L.) DC. var. americanus Schultes	KR, NCoRH, CaRH	0409000000
STYLOCLINE citroleum Morefield	s SnJV (Kern Co.), s SCo (San Diego Co.)	0080002000
STYLOCLINE gnaphaloides Nutt.	s NCoRI, SNF, Teh, SnJV, CW, SW, sw D	f9d03bfc01
STYLOCLINE intertexta Morefield	ne DMoj, nw DSon	e000000000
STYLOCLINE masonii Morefield	nw Teh, s SnJV, c&s SCoRO, WTR	000002a001
STYLOCLINE micropoides A. Gray	s SNE, ne DMoj, nw DSon	e000040002
STYLOCLINE psilocarphoides M. Peck	SNE, DMoj, w edge DSon	e000040002
STYLOCLINE sonorensis Wiggins	DSon (Hayfields, Riverside Co., in 1930)	8000000000
STYLOMECON heterophylla (Benth.) G.C. Taylor	s NW, s SNF, SnJV, CW, SW	19fd237c01
STYRAX officinalis L. var. redivivus (Torrey) H. Howard	NCoRH, NCoRI, CaR, SN, SCoRO, w WTR, SnBr, PR	0658fac501
SUAEDA calceoliformis (Hook.) Moquin	CA	ffffffff07
SUAEDA californica S. Watson	CCo	0100000000
SUAEDA esteroa W. Ferren & S. Whitmore	SCo	0080000000
SUAEDA moquinii (Torrey) E. Greene	GV, SnFrB, SW, GB, D	f8c2047e07
SUAEDA taxifolia (Standley) Standley	SCo, ChI	1880000000
SUBULARIA aquatica L. var. americana (G. Mulligan & Calder) Boivin	SNH	0000c00100
SUKSDORFIA ranunculifolia (Hook.) Engl.	KR, CaRH, n SNH (Plumas Co.)	0401400000
SWALLENIA alexandrae (Swallen) S<#f6>derstrom & Decker	W&I (Eureka Valley, ne Inyo Co.)	0000000002
SWERTIA albicaulis (Griseb.) Kuntze	KR, NCoR, CaR, n SN, MP	063b480004
SWERTIA albicaulis (Griseb.) Kuntze var. albicaulis	CaRH, MP	0402000004
SWERTIA albicaulis (Griseb.) Kuntze var. nitida (Benth.) Jepson	KR, NCoR, CaR, n SN, MP	063b480004
SWERTIA albomarginata (S. Watson) Kuntze	DMtns	4000000000
SWERTIA fastigiata Pursh	KR	0001000000
SWERTIA neglecta (H.M. Hall) Jepson	SCoRO, TR	0000021401
SWERTIA parryi (Torrey) Kuntze	SCo, SnGb, SnBr, PR	00c0005400
SWERTIA perennis L.	s SNH	0000000100
SWERTIA puberulenta (Davidson) Jepson	c&s SNH, W&I	0000800102
SWERTIA radiata (Kellogg) Kuntze	KR, NCoRH, SNH, Wrn	0009c00104
SWERTIA tubulosa (Cov.) Jepson	s SN	0000200100
SYMPHORICARPOS albus (L.) S.F. Blake var. laevigatus (Fern.) S.F. Blake	NW, w edge CaR, n SNF, CW, SW	1ffd0b5c01
SYMPHORICARPOS longiflorus A. Gray	GB, DMtns	4002040006
SYMPHORICARPOS mollis Nutt.	NW, CaR, SN, CW, SW, MP	1ffffbdd05
SYMPHORICARPOS rotundifolius A. Gray	CaR, SN, SW, GB, DMtns	5ec2fcd507
SYMPHORICARPOS rotundifolius A. Gray var. parishii (Rydb.) Dempster	s SNH, SW, SNE, DMtns	58c0045503
SYMPHORICARPOS rotundifolius A. Gray var. rotundifolius	CaR, SN, GB	0602fc8106
SYMPHYTUM asperum Lepechin	NCo, n NCoRO, waif elsewhere (ScV, Yolo Co.)	0024000000
SYMPHYTUM officinale L.	SnFrB, expected elsewhere	0000000800
SYNTHYRIS missurica (Raf.) Pennell	Wrn	0000000004
SYNTHYRIS reniformis (Douglas) Benth.	NCo, NCoRO, SnFrB	0024000800
SYNTRICHOPAPPUS fremontii A. Gray	DMoj	6000000000
SYNTRICHOPAPPUS lemmonii (A. Gray) A. Gray	SCoRI (Monterey Co.), e WTR, SnGb, SnBr, SnJt	0000015401
SYSTENOTHECA vortriedei (Brandegee) Rev. & Hardham	SCoRO (Santa Lucia Mtns, Monterey, San Luis Obispo cos.)	0000020000
TAENIATHERUM caput-medusae (L.) Nevski	NCoR, CaR, SNF, GV, n SCo, expected elsewhere	06b8382200
TAGETES erecta L.	CW, SW	19c0035c01
TAGETES minuta L.	s SNF, s SnJV (esp Tulare Co.), SnFrB, s SCoR, w WTR	0000232801
TAMARIX aphylla (L.) Karsten	SnJV, e SCo, D	e080002000
TAMARIX chinensis Lour.	SCo, D	e080000000
TAMARIX gallica L.	s NCoR, SnJV, SnFrB, SCo, n DMoj (Death Valley)	20b8002800
TAMARIX parviflora DC.	s NCoR, s SNF, Teh, GV, CCo, SnFrB, SCoRI, SCo, SNE, D	e1b825aa02
TAMARIX ramosissima Ledeb.	Teh, SnJV, SCo, WTR, SNE, D	e08004a003
TANACETUM camphoratum Less.	NCo, n CCo	0104000000
TANACETUM parthenium (L.) Schultz-Bip.	KR, NCoR, n SNF, GV, SnFrB, SCoRO, SCo	00b90a2a00
TANACETUM vulgare L.	NCo, NCoRO, CaRH, SCoRO	0424020000
TARAXACUM californicum Munz & I.M. Johnston	SnBr	0000000400
TARAXACUM officinale Wigg.	CA-FP, GB	1fffffff07
TAUSCHIA arguta (Torrey & A. Gray) J.F. Macbr.	SCoRO, SW	18c0025401
TAUSCHIA glauca (J. Coulter & Rose) Mathias & Constance	NCo	0004000000
TAUSCHIA hartwegii (A. Gray) J.F. Macbr.	n SNF, SnFrB, SCoRO	00000a0800
TAUSCHIA howellii (J. Coulter & Rose) J.F. Macbr.	KR (Salmon Mtns)	0001000000
TAUSCHIA kelloggii (A. Gray) J.F. Macbr.	NCo, NCoR, s CaR,  n SNF, n CCo, SnFrB	073c080800
TAUSCHIA parishii (J. Coulter & Rose) J.F. Macbr.	Teh, SnGb, SnBr, SnJt, SNE	000004d402
TAXUS brevifolia Nutt.	NW, CaR, n&c SN, SnFrB	063dd80800
TEESDALIA coronopifolia (Bergeret) Thell.	s NCoRO (Sonoma Co.)	0020000000
TELLIMA grandiflora (Pursh) Lindley	NW, CaR, n SN, n&c CW	073d4b0800
TETRACOCCUS dioicus C. Parry	s SCo (San Diego Co.), w PR	00c0000000
TETRACOCCUS hallii Brandegee	se DMoj, DSon	e000000000
TETRACOCCUS ilicifolius Cov. & Gilman	n DMtns (Grapevine, Panamint mtns)	4000000000
TETRADYMIA argyraea Munz & Roos	DMtns	4000000000
TETRADYMIA axillaris Nelson	s SNE, DMoj	6000040002
TETRADYMIA axillaris Nelson var. axillaris	ne DMoj	6000000000
TETRADYMIA axillaris Nelson var. longispina (M.E. Jones) Strother	s SNE, w DMoj	6000040002
TETRADYMIA canescens DC.	TR, s PR, GB, DMoj	6042041407
TETRADYMIA comosa A. Gray	TR, PR	0040005401
TETRADYMIA glabrata Torrey & A. Gray	GB, DMoj	6002040006
TETRADYMIA spinosa Hook. & Arn.	s MP, n SNE	0002040004
TETRADYMIA stenolepis E. Greene	SNE, DMoj	6000040002
TETRADYMIA tetrameres (S.F. Blake) Strother	n SNE	0000040000
TETRAGONIA tetragonioides (Pallas) Kuntze	NCo, CCo, SCo	0184000000
TEUCRIUM cubense Jacq. ssp. depressum McClint. & Epling	DSon	8000000000
TEUCRIUM glandulosum Kellogg	ne DSon (Whipple Mtns)	8000000000
THALICTRUM alpinum L.	n&c SNH, n W&I	0000c00002
THALICTRUM fendleri A. Gray	CA-FP (exc GV, ChI), GB	07ffffdd07
THALICTRUM fendleri A. Gray var. fendleri	KR, CaR (very uncommon), SN, SnFrB, SCoRO, TR, PR, GB	0643fedd07
THALICTRUM fendleri A. Gray var. polycarpum Torrey	NCo, w KR, NCoR, SN (very uncommon), CW, TR, w PR	017dfb9d01
THALICTRUM occidentale A. Gray	n NCo, nw KR	0005000000
THALICTRUM sparsiflorum Fischer & C. Meyer	CaR, c&n SN, SnBr, SnJt, n SNE (Sweetwater, White mtns)	0600dc4400
THAMNOSMA montana Torrey & Fr<#e9>mont	D	e000000000
THELESPERMA megapotamicum (Sprengel) Kuntze	SCo, s ChI (Santa Catalina Island)	1080000000
THELYPODIUM brachycarpum Torrey	KR, NCoR, CaR	0639000000
THELYPODIUM crispum Payson	SNH, GB	0002c40106
THELYPODIUM flexuosum Robinson	MP	0002000004
THELYPODIUM howellii S. Watson ssp. howellii	MP	0002000004
THELYPODIUM integrifolium (Torrey & A. Gray) Endl.	GB, DMoj	6002040006
THELYPODIUM integrifolium (Torrey & A. Gray) Endl. ssp. affine (E. Greene) Al-Shehbaz	SNE, DMoj	6000040002
THELYPODIUM integrifolium (Torrey & A. Gray) Endl. ssp. complanatum Al-Shehbaz	GB	0002040006
THELYPODIUM laciniatum (Hook.) Endl.	CaR, GB	0602040006
THELYPODIUM milleflorum Nelson	GB	0002040006
THELYPODIUM stenopetalum S. Watson	SnBr (Bear Valley)	0000000400
THELYPTERIS nevadensis (Baker) C. Morton	KR, NCoRO, n SNH, n SNE	0021440000
THELYPTERIS puberula (Baker) C. Morton var. sonorensis A. R. Smith	SCo, WTR, SnGb, SnJt	0080005001
THERMOPSIS macrophylla Hook. & Arn.	NW, CaR, CW, SW, MP	1fff035c05
THERMOPSIS macrophylla Hook. & Arn. var. argentata (E. Greene) Jepson	CaR (Siskiyou, Shasta cos.), MP (Modoc, Lassen cos.)	0602000004
THERMOPSIS macrophylla Hook. & Arn. var. macrophylla	NW, CW, n SW	19fd035c01
THERMOPSIS macrophylla Hook. & Arn. var. semota Jepson	s PR (San Diego Co.)	0040000000
THERMOPSIS macrophylla Hook. & Arn. var. venosa (Eastw.) Isely	KR, NCoR	0039000000
THLASPI arvense L.	CA	ffffffff07
THLASPI californicum S. Watson	NCoRO (Kneeland Prairie)	0020000000
THLASPI montanum L. var. montanum	KR, CaR, MP	0603000004
THUJA plicata D. Don	NCo, KR, NCoRO	0025000000
THYMOPHYLLA pentachaeta (DC.) Small var. belenidium (DC.) Strother	SnJt, e DMoj	6000004000
THYSANOCARPUS conchuliferus E. Greene	n ChI (Santa Cruz Island)	0800000000
THYSANOCARPUS curvipes Hook.	CA-FP, D	fffdfbff01
THYSANOCARPUS laciniatus Torrey & A. Gray	s SNF, Teh, SnFrB, SCoR, SW, SNE, D	f8c027dc03
THYSANOCARPUS radians Benth.	NW, ScV, SnFrB	003d000a00
TIARELLA trifoliata L.	NW, n CCo, SnFrB	013d000800
TIARELLA trifoliata L. var. trifoliata	KR (Humboldt-Trinity Co. line)	0001000000
TIARELLA trifoliata L. var. unifoliata (Hook.) Kurtz	NW, n CCo, SnFrB	013d000800
TIDESTROMIA lanuginosa (Nutt.) Standley	e DMtns (Granite Mtns)	4000000000
TIDESTROMIA oblongifolia (S. Watson) Standley	D	e000000000
TIQUILIA canescens (DC.) A. Richardson	DMtns, DSon	c000000000
TIQUILIA canescens (DC.) A. Richardson var. canescens	DMtns, DSon	c000000000
TIQUILIA canescens (DC.) A. Richardson var. pulchella (I.M. Johnston) A. Richardson	DSon (Imperial, Riverside cos.)	8000000000
TIQUILIA nuttallii (Hook.) A. Richardson	Teh, e MP, SNE, DMoj	6002048006
TIQUILIA palmeri (A. Gray) A. Richardson	D (esp w edge DSon and near Colorado River)	e000000000
TIQUILIA plicata (Torrey) A. Richardson	D	e000000000
TOFIELDIA occidentalis S. Watson ssp. occidentalis	NW, SNH	003dc00100
TOLMIEA menziesii (Pursh) Torrey & A. Gray	NW, n CCo, SnFrB	013d000800
TOLPIS barbata (L.) Gaertner	NCoRO, n CCo	0120000000
TONELLA tenella (Benth.) A.A. Heller	KR, NCoR, CaR, n SNH, ScV, SnFrB, SCoRI	0639410a00
TONESTUS eximius (H.M. Hall) Nelson & J.F. Macbr.	n SNH (Alpine, El Dorado, Inyo cos.)	0000400000
TONESTUS lyallii (A. Gray) Nelson	c KR (Trinity Alps)	0001000000
TONESTUS peirsonii (Keck) G. Nesom & R. Morgan	c SNH (Inyo, Fresno cos.), W&I	0000800002
TORILIS arvensis (Hudson) Link	CA-FP (esp NW, CW, n SNF)	1ffdfbff01
TORILIS nodosa (L.) Gaertner	n&c CA-FP, s ChI	1ffdfbff01
TORREYA californica Torrey	NCo, NCoR, CaRF, SnFrB, SN, SCoRO	023cfa8900
TORREYOCHLOA erecta (A. Hitchc.) Church	CaRH, SNH	0400c00100
TORREYOCHLOA pallida (J.S. Presl) Church var. pauciflora (J.S. Presl) J. I Davis	NW, CaR, SN, CCo, MP	073ff88104
TOWNSENDIA condensata Eaton	n SNE (Mono Co)	0000040000
TOWNSENDIA leptotes (A. Gray) G.E. Osterh.	W&I	0000000002
TOWNSENDIA parryi Eaton	n SNE (Sweetwater Mtns, Mono Co.)	0000040000
TOWNSENDIA scapigera Eaton	SNE	0000040002
TOXICODENDRON diversilobum (Torrey & A. Gray) E. Greene	CA-FP, se edge DMoj	3ffdfbff01
TRACYINA rostrata S.F. Blake	NCoR (Humboldt, Lake cos.)	0038000000
TRADESCANTIA fluminensis Vell. Conc.	SnFrB, SCo	0080000800
TRAGIA ramosa Torrey	DMtns (Clark, New York, Providence mtns)	4000000000
TRAGOPOGON dubius Scop.	n SN, SnJV, SnFrB, SCoRO, SnBr, GB	00024e2c06
TRAGOPOGON porrifolius L.	Most of CA-FP	1ffdfbff01
TRAGOPOGON pratensis L.	KR, CaRH, SNH, MP	0403c00104
TRAUTVETTERIA caroliniensis (Walter) Vail var. occidentalis (A. Gray) C. Hitchc.	KR, CaR (uncommon), c&n SNH	0601c00000
TRIANTHEMA portulacastrum L.	SnJV, D	e000002000
TRIBULUS terrestris L.	CA	ffffffff07
TRICARDIA watsonii S. Watson	SnBr, SNE, D	e000040402
TRICHOCORONIS wrightii (A. Gray) A. Gray var. wrightii	GV, SCo	0080002200
TRICHOPTILIUM incisum A. Gray	s DMoj, DSon	e000000000
TRICHOSTEMA austromontanum Harlan Lewis	Teh, TR, PR, SNE	004004d403
TRICHOSTEMA austromontanum Harlan Lewis ssp. austromontanum	Teh, TR, PR, SNE	004004d403
TRICHOSTEMA austromontanum Harlan Lewis ssp. compactum Harlan Lewis	SnJt (Hidden Lake)	0000004000
TRICHOSTEMA lanatum Benth.	SCoR, SCo, WTR, SnGb, PR	00c0035001
TRICHOSTEMA lanceolatum Benth.	CA-FP	1ffdfbff01
TRICHOSTEMA laxum A. Gray	NW	003d000000
TRICHOSTEMA micranthum A. Gray	SnBr	0000000400
TRICHOSTEMA oblongum Benth.	KR, NCoR, CaR, SN, MP	063bf88104
TRICHOSTEMA ovatum Curran	s SnJV	0000002000
TRICHOSTEMA parishii Vasey	TR, PR	0040005401
TRICHOSTEMA rubisepalum Elmer	s NCoRI (Napa Co.), c SNF (Tuolumne, Mariposa cos.), SCoRI (San Benito Co.)	0010110000
TRICHOSTEMA simulatum Jepson	KR, CaR, n SN, MP	0603480004
TRIDENS muticus (Torrey) Nash	SNE, DMtns	4000040002
TRIENTALIS arctica Hook.	NCo (near Crescent City, Del Norte Co.)	0004000000
TRIENTALIS latifolia Hook.	NCo, NCoR, CaRH (Mount Shasta), SN, SnJV, SnFrB, SCoR	043cfba900
TRIFOLIUM albopurpureum Torrey & A. Gray	CA-FP	1ffdfbff01
TRIFOLIUM albopurpureum Torrey & A. Gray var. albopurpureum	CA-FP	1ffdfbff01
TRIFOLIUM albopurpureum Torrey & A. Gray var. dichotomum (Hook. & Arn.) Isely	NW, c SN, GV, SnFrB, SCoR	003d932a00
TRIFOLIUM albopurpureum Torrey & A. Gray var. olivaceum (E. Greene) Isely	NCoRI, CaR, n SN, GV, SnFrB	0610482a00
TRIFOLIUM amoenum E. Greene	s NCoR, SnFrB	0038000800
TRIFOLIUM andersonii A. Gray	n SNH, GB	0002440006
TRIFOLIUM andersonii A. Gray var. andersonii	n SNH, MP	0002400004
TRIFOLIUM andersonii A. Gray var. beatleyae (J.M. Gillett) Isely	SNE (Mono Co.)	0000040002
TRIFOLIUM angustifolium L.	CCo, SCoR	0100030000
TRIFOLIUM arvense L.	CA-FP	1ffdfbff01
TRIFOLIUM aureum Pollich	SnJV	0000002000
TRIFOLIUM barbigerum Torrey	NW, n&c SN, GV, CW	013ddb2a00
TRIFOLIUM barbigerum Torrey var. andrewsii A. Gray	NCoRO, n&c SN, ScV, SnFrB, SCoRO	0020da0a00
TRIFOLIUM barbigerum Torrey var. barbigerum	NW, n&c SN, GV, CW	013ddb2a00
TRIFOLIUM beckwithii S. Watson	n SN, MP	0002480004
TRIFOLIUM bifidum A. Gray	CA-FP (exc SNH, Teh)	1ffdfbff01
TRIFOLIUM bifidum A. Gray var. bifidum	NCoR, n SNF, GV, CW	01380b2a00
TRIFOLIUM bifidum A. Gray var. decipiens E. Greene	NCoR, n SNF, GV, CW	01380b2a00
TRIFOLIUM bolanderi A. Gray	c SNH	0000800000
TRIFOLIUM breweri S. Watson	KR, CaR, n&c SN	0601d80000
TRIFOLIUM buckwestiorum Isely	sw SnFrB (Santa Cruz Co.)	0000000800
TRIFOLIUM campestre Schreber	Gen n CA-FP	1ffdfbff01
TRIFOLIUM ciliolatum Benth.	NCoR, CaR, n SN, ScV, CW, SW	1ff84b5e01
TRIFOLIUM cyathiferum Lindley	NW, CaR, n&c SN, GV, n SNE	063ddc2200
TRIFOLIUM depauperatum Desv.	NCoR, CaRF, SNF, n&c SNH, Teh, GV, CW, SCo, ChI, PR	1bf8fbea00
TRIFOLIUM depauperatum Desv. var. amplectens (Torrey & A. Gray) L.F. McDermott	GV, SnFrB, SCoR	0000032a00
TRIFOLIUM depauperatum Desv. var. depauperatum	NCoR, CaRF, n&c SN, GV, SnFrB	0238d82a00
TRIFOLIUM depauperatum Desv. var. hydrophilum (E. Greene) Isely	ScV, CW	0100030a00
TRIFOLIUM depauperatum Desv. var. truncatum (E. Greene) Isely	NCoR, CaRF, SNF, Teh, GV, CW, SCo, ChI, PR	1bf83bea00
TRIFOLIUM dubium Sibth.	Esp CA-FP	1ffdfbff01
TRIFOLIUM eriocephalum Nutt. var. eriocephalum	NW, CaR, n SN	063d480000
TRIFOLIUM fragiferum L.	NCoR, ScV, SCoR, SW, MP, W&I	18fa035607
TRIFOLIUM fucatum Lindley	NCo, NCoR, CaR, GV, SCo, ChI, SnFrB	1ebc002a00
TRIFOLIUM glomeratum L.	CA-FP	1ffdfbff01
TRIFOLIUM gracilentum Torrey & A. Gray	CA-FP	1ffdfbff01
TRIFOLIUM gracilentum Torrey & A. Gray var. gracilentum	CA-FP (exc ChI)	07fdfbff01
TRIFOLIUM gracilentum Torrey & A. Gray var. palmeri (S. Watson) L.F. McDermott	ChI	1800000000
TRIFOLIUM gymnocarpon Nutt. var. plummerae (S. Watson) J.S. Martin	MP	0002000004
TRIFOLIUM hirtum All.	CA-FP	1ffdfbff01
TRIFOLIUM howellii S. Watson	n KR, n NCoR, n CaR	0639000000
TRIFOLIUM hybridum L.	NW, sporadic elsewhere	003d000000
TRIFOLIUM incarnatum L.	CA-FP	1ffdfbff01
TRIFOLIUM kingii S. Watson var. productum (E. Greene) Jepson	KR, CaRH, n&c SN, MP	0403d80004
TRIFOLIUM lemmonii S. Watson	n SNH	0000400000
TRIFOLIUM longipes Nutt.	KR, NCoR, CaR, SN, SnBr, SnJt, GB	063bfcc506
TRIFOLIUM longipes Nutt. var. elmeri (E. Greene) L.F. McDermott	KR, NCoR, CaR	0639000000
TRIFOLIUM longipes Nutt. var. nevadense Jepson	KR, NCoR, CaR, SN, SnBr, SnJt, GB	063bfcc506
TRIFOLIUM longipes Nutt. var. oreganum (Howell) Isely	KR, NCoR	0039000000
TRIFOLIUM longipes Nutt. var. shastense (House) Jepson	KR, CaR, GB	0603040006
TRIFOLIUM macilentum E. Greene var. dedeckerae (J.M. Gillett) Barneby	s SNH, SNE	0000040102
TRIFOLIUM macraei Hook. & Arn.	NCo, NCoRO, CCo, SnFrB, ChI	1924000800
TRIFOLIUM macrocephalum (Pursh) Poiret	KR, CaR, n SNH, MP	0603400004
TRIFOLIUM microcephalum Pursh	NW, SN, GV, SCo, ChI, SnBr, PR, DMoj, SnFrB	78fdf8ef00
TRIFOLIUM microdon Hook. & Arn.	NCo, NCoR, n&c SNF, GV, CW, ChI, PR	197c1b6a00
TRIFOLIUM monanthum A. Gray	CaR, SN, SCo, SnGb, SnBr, SnJt, SNE	0680fcd502
TRIFOLIUM monanthum A. Gray var. grantianum (A.A. Heller) Parish	SCo, SnGb, SnBr, SnJt	0080005400
TRIFOLIUM monanthum A. Gray var. monanthum	CaR, SN, SNE	0600fc8102
TRIFOLIUM obtusiflorum Hook. & Arn.	NW, n&c SN, SnJt, CW, SCo, SnGb, PR	01fddb5800
TRIFOLIUM oliganthum Steudel	KR, NCoR, SN, GV, SnFrB, SCoRO	0039faab00
TRIFOLIUM pratense L.	CA-FP, GB, esp n	1fffffff07
TRIFOLIUM repens L.	CA-FP, GB, esp n	1fffffff07
TRIFOLIUM subterraneum L.	NCoR, n SN, GV, SCoR, probably elsewhere	00384b2200
TRIFOLIUM trichocalyx A.A. Heller	CCo (Monterey Peninsula, Monterey Co.)	0100000000
TRIFOLIUM variegatum Nutt.	CA-FP, SNE	1ffdffff03
TRIFOLIUM variegatum Nutt. phase 1	CA-FP, SNE	1ffdffff03
TRIFOLIUM variegatum Nutt. phase 2	NCo, NCoR, SN, GV, CW, SW, SNE	19fcffff03
TRIFOLIUM variegatum Nutt. phase 3	SN, CW	0100fb8900
TRIFOLIUM variegatum Nutt. phase 4	CCo (Monterey Peninsula, Monterey Co.)	0100000000
TRIFOLIUM variegatum Nutt. phase 5	NCo, NCoR, n&c SN, CW, PR	017cdb4800
TRIFOLIUM willdenovii Sprengel	CA-FP, MP	1ffffbff05
TRIFOLIUM wormskioldii Lehm.	NW, CaR, SN, SnJV, CW, SCo, PR, SNE	07fdffe902
TRIGLOCHIN concinna Burtt Davy	NCo, s SNH, CCo, SCo, GB, DMoj	6186040106
TRIGLOCHIN concinna Burtt Davy var. concinna	NCo, CCo, SCo	0184000000
TRIGLOCHIN concinna Burtt Davy var. debilis (M.E. Jones) J. Howell	s SNH, GB, DMoj	6002040106
TRIGLOCHIN maritima L.	NCo, SN, CCo, SCo, SnBr, GB	0186fc8506
TRIGLOCHIN palustris L.	c&s SNH	0000800100
TRIGLOCHIN striata Ruiz Lopez & Pavon	NCo, CCo, SCo	0184000000
TRILLIUM albidum Freeman	NW, CaR, n SN, SnFrB	063d480800
TRILLIUM angustipetalum (Torrey) Freeman	w KR, SN (exc Teh), SCoRO	0001fa0100
TRILLIUM chloropetalum (Torrey) Howell	NCoRI, SnFrB	0010000800
TRILLIUM ovatum Pursh	NW, CW	013d030800
TRILLIUM ovatum Pursh ssp. oettingeri Munz & Thorne	c KR (esp Marble Mtns, Siskiyou Co.)	0001000000
TRILLIUM ovatum Pursh ssp. ovatum	NW, CW	013d030800
TRILLIUM rivale S. Watson	KR	0001000000
TRIMORPHA acris (L.) S.F. Gray var. debilis (A. Gray) G. Nesom	CaR	0600000000
TRIMORPHA lonchophylla (Hook.) G. Nesom	SN, SnBr, W&I	0000f88502
TRIODANIS biflora (Ruiz Lopez & Pavon) E. Greene	NW, SN GV, CW, SW	19fdfbff01
TRIODANIS perfoliata (L.) Nieuwl.	NW, n SNH (Plumas Co.), SW (uncommon)	18fd405401
TRIPHYSARIA eriantha (Benth.) Chuang & Heckard	CA-FP	1ffdfbff01
TRIPHYSARIA eriantha (Benth.) Chuang & Heckard ssp. eriantha	CA-FP	1ffdfbff01
TRIPHYSARIA eriantha (Benth.) Chuang & Heckard ssp. rosea (A. Gray) Chuang & Heckard	NCo, CCo, SCo	0184000000
TRIPHYSARIA floribunda (Benth.) Chuang & Heckard	n CCo, w SnFrB	0100000800
TRIPHYSARIA micrantha (A. Gray) Chuang & Heckard	c&s SNF, SnJV, SCoR	0000332000
TRIPHYSARIA pusilla (Benth.) Chuang & Heckard	NCoR, c SNF, CW	0138130800
TRIPHYSARIA versicolor Fischer & C. Meyer	NCo, NCoR, ScV (Solano Co.), CCo	013c000200
TRIPHYSARIA versicolor Fischer & C. Meyer ssp. faucibarbata (A. Gray) Chuang & Heckard	NCoR, ScV (Solano Co.), CCo	0138000200
TRIPHYSARIA versicolor Fischer & C. Meyer ssp. versicolor	NCo, CCo	0104000000
TRIPTEROCALYX crux-maltae (Kellogg) Standley	MP (Lassen Co.)	0002000004
TRIPTEROCALYX micranthus (Torrey) Hook.	se DMoj (Kelso, San Bernardino Co.)	6000000000
TRISETUM canescens Buckley	NW, CaR, SN, CW, MP	073ffb8904
TRISETUM cernuum Trin.	NCo, NCoRO	0024000000
TRISETUM flavescens (L.) P. Beauv.	NCo	0004000000
TRISETUM spicatum (L.) Richter	KR, CaRH, SN, n SNE, W&I	0401fc8100
TRISETUM wolfii Vasey	c&s SNH, CaRH	0400800100
TRITELEIA bridgesii (S. Watson) E. Greene	KR, NCoR, CaRF, n&c SNF	0239180000
TRITELEIA clementina Hoover	s ChI (San Clemente Island)	1000000000
TRITELEIA crocea (A.W. Wood) E. Greene	KR	0001000000
TRITELEIA crocea (A.W. Wood) E. Greene var. crocea	KR	0001000000
TRITELEIA crocea (A.W. Wood) E. Greene var. modesta (H.M. Hall) Hoover	c KR (Trinity Mtns)	0001000000
TRITELEIA dudleyi Hoover	s SNH, TR	0000001501
TRITELEIA grandiflora Lindley ssp. howellii (S. Watson) Hoover	n CaRH (Hornbrook, n-c Siskiyou Co.)	0400000000
TRITELEIA hyacinthina (Lindley) E. Greene	NW, CaR, SN, GV, n&c CW	073dfbab00
TRITELEIA ixioides (S. Watson) E. Greene	KR, CaRF, SN, cw CW	0301fb8900
TRITELEIA ixioides (S. Watson) E. Greene ssp. anilina (E. Greene) L. Lenz	n KR, SN	0001f88100
TRITELEIA ixioides (S. Watson) E. Greene ssp. cookii (Hoover) L. Lenz	w-c SCoRO (s Santa Lucia Mtns)	0000020000
TRITELEIA ixioides (S. Watson) E. Greene ssp. ixioides	c&s CCo, sw SnFrB, w SCoRO	0100020800
TRITELEIA ixioides (S. Watson) E. Greene ssp. scabra (E. Greene) L. Lenz	s CaRF, SNF	0200380000
TRITELEIA laxa Benth.	NW, CaR, SN, CW, TR	073dfb9d01
TRITELEIA lilacina E. Greene	s CaRF, n&c SNF, e ScV, ne SnJV	0200182200
TRITELEIA lugens E. Greene	s NCoR, SnGb?	0038001000
TRITELEIA montana Hoover	n&c SNH	0000c00000
TRITELEIA peduncularis Lindley	NW, n&c CW	013d030800
TRIXIS californica Kellogg var. californica	D	e000000000
TROPAEOLUM majus L.	NCo, SnFrB, SCo, s ChI	1084000800
TROPIDOCARPUM capparideum E. Greene	nw SnJV (near Mount Diablo)	0000002000
TROPIDOCARPUM gracile Hook.	NCoRI, CaRF, SNF, Teh, GV, SnFrB, SCoRI, SW, w DMoj	7ad039fe01
TSUGA heterophylla (Raf.) Sarg.	NCo, w KR, NCoRO	0025000000
TSUGA mertensiana (Bong.) Carri<#e8>re	KR, NCoRH, CaRH, SNH, MP, n SNE	040bc40104
TUBERARIA guttata (L.) Fourr.	c SNF	0000100000
TUCTORIA greenei (Vasey) Reeder	GV (Butte, Fresno, Madera, Merced, San Joaquin, Stanislaus, Tehama, Tulare cos.)	0000002200
TUCTORIA mucronata (Crampton) Reeder	sw ScV (Solano Co.)	0000000200
TURRICULA parryi (A. Gray) J.F. Macbr.	s SN, s SnJV, s SCoRO, SW, n DMtns (Panamint Mtns)	58c0227501
TYPHA angustifolia L.	n SNH (Lake Tahoe), GV, CCo, SnFrB, SCo	0180402a00
TYPHA domingensis Pers.	NCo, NCoRO, GV, CW, SW, GB, D	f9e6077e07
TYPHA latifolia L.	CA	ffffffff07
ULEX europaea L.	NCo, NCoRO, CaRF, n&c SNF, SnFrB, SCoRI, SCo, PR	02e4194800
ULMUS minor Miller	n&c SNF, SnJV, SnFrB, SCo	0080182800
ULMUS parvifolia Jacq.	s SNF, Teh, s SnJV, SnFrB, SCo	008020a800
ULMUS pumila L.	SNF, GV, SNE, n DMoj	20003c2202
UMBELLULARIA californica (Hook. & Arn.) Nutt.	NW, CaRF, SNF, SnFrB, SCoRO, scattered in TR, PR	027d3a5c01
UROPAPPUS lindleyi (DC.) Nutt.	CA (exc NCo)	fffbffff07
UROSPERMUM picroides (L.) Schmidt	n SNF, SnFrB, SCo	0080080800
URTICA dioica L.	CA-FP, W&I, DMtns	5ffdfbff03
URTICA dioica L. ssp. gracilis (Aiton) Selander	NW, n CCo	013d000000
URTICA dioica L. ssp. holosericea (Nutt.) Thorne	CA-FP (+/- exc NW), W&I, DMtns	5fc0fbff03
URTICA urens L.	CA-FP (+/- exc NW, CaRH)	1bc0fbff01
UTRICULARIA gibba L.	n&c CA-FP	1ffdfbff01
UTRICULARIA intermedia Hayne	CaR, SNH, MP	0602c00104
UTRICULARIA minor L.	CaRH, SNH, MP	0402c00104
UTRICULARIA vulgaris L.	NW, CaR, SN, SnFrB, SnBr, GB, w DMoj	663ffc8d06
VACCARIA hispanica (Miller) Rauschert	KR, NCoR, CaRH, c SNF, n SNH, Teh, ScV, CW, SCo, PR, GB	05fb57ca06
VACCINIUM caespitosum Michaux	NCo, KR, NCoRO, NCoRH, CaRH, SNH, CCo, SnFrB, Wrn	052dc00904
VACCINIUM deliciosum Piper	KR, n SNH, Wrn	0001400004
VACCINIUM macrocarpon Aiton	n SNH (near North Columbia, n Nevada Co.)	0000400000
VACCINIUM membranaceum Hook.	KR, NCoRH, n SNH, Wrn	0009400004
VACCINIUM ovatum Pursh	NCo, KR, NCoRO, CCo, SnFrB, n ChI (Santa Cruz, Santa Rosa islands), WTR, PR (uncommon)	0965000801
VACCINIUM parvifolium Smith	NCo, KR, NCoRO, CaRH, n&c SNH, SnFrB	0425c00800
VACCINIUM scoparium Cov.	KR	0001000000
VACCINIUM uliginosum L. ssp. occidentale (A. Gray) Hult<#e9>n	NCo, KR, CaRH, SNH	0405c00100
VALERIANA californica A.A. Heller	KR, NCoRH, CaR, SNH, MP	060bc00104
VALERIANA occidentalis A.A. Heller	Wrn	0000000004
VALERIANA pubicarpa Rydb.	W&I	0000000002
VALERIANA sitchensis Bong.	NCo, KR, n NCoRO	0025000000
VALERIANA sitchensis Bong. ssp. scouleri (Rydb.) F. Meyer	NCo, KR, n NCoRO	0025000000
VALERIANA sitchensis Bong. ssp. sitchensis	KR	0001000000
VALERIANELLA locusta (L.) Betcke	KR, NCoRO, n SN, n ScV, SnFrB	0021480a00
VANCOUVERIA chrysantha E. Greene	n NCo, w KR	0005000000
VANCOUVERIA hexandra (Hook.) Morren & Decne.	NCo, w KR, n NCoRO	0025000000
VANCOUVERIA planipetala Calloni	NW (exc NCoRI), SnFrB, SCoRO (Santa Lucia Mtns)	002d020800
VELEZIA rigida L.	KR, n&c SNF	0001180000
VENEGASIA carpesioides DC.	SCoRO, SW	18c0025401
VENIDIUM fastuosum (Jacq.) Stapf	SCo	0080000000
VENTENATA dubia (Leers) Durieu.	KR (Siskiyou Co.), n SNH (s Nevada Co.)	0001400000
VERATRUM californicum Durand var. californicum	CA-FP, GB	1fffffff07
VERATRUM fimbriatum A. Gray	c NCo (Mendocino, Sonoma cos.)	0004000000
VERATRUM insolitum Jepson	KR	0001000000
VERATRUM viride Aiton	KR	0001000000
VERBASCUM blattaria L.	CA-FP	1ffdfbff01
VERBASCUM speciosum Schrader.	SnFrB	0000000800
VERBASCUM thapsus L.	CA-FP, n SNE	1ffdffff01
VERBASCUM virgatum Stokes	NCoRO, c SnJV, SnFrB, SW	18e0007c01
VERBENA bonariensis L.	s ScV, n SnJV, n SnFrB	0000002a00
VERBENA bracteata Lagasca & J.D. Rodriguez	CaR, GV, SCoR, SW, GB, D	fec2077607
VERBENA californica Mold.	c SNF (Tuolumne Co.)	0000100000
VERBENA gooddingii Briq.	e DMoj, ne DSon	e000000000
VERBENA hastata L.	GV, CCo, SnFrB, MP	0102002a04
VERBENA lasiostachys Link	CA-FP	1ffdfbff01
VERBENA lasiostachys Link var. lasiostachys	CA-FP	1ffdfbff01
VERBENA lasiostachys Link var. scabrida Mold.	s NW, s SNF, Teh, CW, SCo, ChI (exc San Clemente Island), WTR, w PR	19fd238801
VERBENA litoralis Kunth	n&c SNF, ScV, n SnJV	0000182200
VERBENA menthifolia Benth.	SCo, w PR	00c0000000
VERBENA scabra M. Vahl	s SCo	0080000000
VERBENA tenuisecta Briq.	SCo, SnJV	0080002000
VERBESINA dissita A. Gray	s SCo (Orange Co.), naturalized in SnBr	0080000400
VERBESINA encelioides (Cav.) A. Gray ssp. exauriculata (Robinson & Greenman) J. Coleman	SnJV, SCoR (Salinas Valley), SCo, DSon	8080032000
VERONICA americana (Raf.) Benth.	CA-FP, SNE, DMtns (uncommon)	5ffdffff03
VERONICA anagallis-aquatica L.	CA-FP, W&I, DMtns (uncommon)	5ffdfbff03
VERONICA arvensis L.	KR, NCoR, SNF, GV, WTR	0039382201
VERONICA beccabunga L.	SNE (near Bridgeport)	0000040002
VERONICA catenata Pennell	CA-FP	1ffdfbff01
VERONICA chamaedrys L.	SnFrB	0000000800
VERONICA copelandii Eastw.	e KR (Trinity, Siskiyou cos.)	0001000000
VERONICA cusickii A. Gray	CaR, n&c SNH	0600c00000
VERONICA filiformis Sm.	SnFrB	0000000800
VERONICA hederifolia L.	ScV	0000000200
VERONICA peregrina L. ssp. xalapensis (Kunth) Pennell	CA-FP, W&I	1ffdfbff03
VERONICA persica Poiret	CA-FP	1ffdfbff01
VERONICA scutellata L.	CaR, SN, SnBr	0600f88500
VERONICA serpyllifolia L. ssp. humifusa (Dickson) Syme	CaR, SN, SnBr, SNE	0600fc8502
VERONICA triphyllos L.	KR	0001000000
VERONICA wormskjoldii Roemer & Schultes	CaR, SN, MP	0602f88104
VIBURNUM ellipticum Hook.	NW, n&c SNF, SnFrB	003d180800
VICIA americana Willd. var. americana	CA-FP, GB	1fffffff07
VICIA benghalensis L.	CA-FP	1ffdfbff01
VICIA cracca L.	NCoR, MP	003a000004
VICIA disperma DC.	n CCo, SnFrB	0100000800
VICIA faba L.	NW, CW, SW, probably elsewhere	19fd035c01
VICIA gigantea Hook.	NCo, CCo, SnFrB, SCo	0184000800
VICIA hassei S. Watson	NCo, NCoR, GV, CW, SW, PR	19fc037e01
VICIA hirsuta (L.) S.F. Gray	NCo, NCoR, SnFrB, SW, probably elsewhere	18fc005c01
VICIA lathyroides L.	c SNF, probably elsewhere	0000100000
VICIA ludoviciana Nutt. var. ludoviciana	SCo, ChI, PR, SnFrB	18c0004800
VICIA lutea L.	SnFrB	0000000800
VICIA pannonica Crantz	NCoRO (Sonoma Co.), probably elsewhere	0020000000
VICIA sativa L.	CA-FP	1ffdfbff01
VICIA sativa L. ssp. nigra (L.) Erhart	CA-FP	1ffdfbff01
VICIA sativa L. ssp. sativa	CA-FP	1ffdfbff01
VICIA tetrasperma (L.) Schreber	NW, SnFrB, PR, probably elsewhere	007d004800
VICIA villosa Roth	CA-FP	1ffdfbff01
VICIA villosa Roth ssp. varia (Host) Corbi<#e8>re	CA-FP	1ffdfbff01
VICIA villosa Roth ssp. villosa	CA-FP	1ffdfbff01
VIGUIERA laciniata A. Gray	s SCo, sw PR (sw San Diego Co.)	00c0000000
VIGUIERA parishii E. Greene	D	e000000000
VIGUIERA reticulata S. Watson	DMoj	6000000000
VINCA major L.	NCoRO, SnFrB, s SCoRO, SCo	00a0020800
VIOLA adunca Smith	CA-FP (gen mtns)	1ffdfbff01
VIOLA arvensis Murray	CaR, SNF, GV, waif from cult elsewhere	0600382200
VIOLA aurea Kellogg	SNE, DMoj	6000040002
VIOLA bakeri E. Greene	KR, SNH	0001c00100
VIOLA beckwithii Torrey & A. Gray	n SNH, MP	0002400004
VIOLA cuneata S. Watson	NW	003d000000
VIOLA douglasii Steudel	NW, CaRH, n&c SNF, SnJV, CW, SnGb, SnBr, PR	057d1b7c00
VIOLA glabella Nutt.	NW, CaR, SN, CW, Wrn	073dfb8904
VIOLA hallii A. Gray	NW	003d000000
VIOLA lobata Benth.	NW, CaR, SN, PR	067df8c100
VIOLA lobata Benth. ssp. integrifolia (S. Watson) R.J. Little	NW, CaR, SN, PR	067df8c100
VIOLA lobata Benth. ssp. lobata	NW, CaR, SN, PR	067df8c100
VIOLA macloskeyi F. Lloyd	n&c CA-FP (mtns), SnBr, SnJt	1ffdfbff01
VIOLA ocellata Torrey & A. Gray	NW, CaRF, n&s CW	033d030800
VIOLA odorata L.	SnFrB, SCo	0080000800
VIOLA palustris L.	NCo	0004000000
VIOLA pedunculata Torrey & A. Gray	NCoRO, NCoRI, SnFrB, CW, SW	19f0035c01
VIOLA pinetorum E. Greene	CaR, SN, WTR, SnBr, SnJt	0600f8c501
VIOLA pinetorum E. Greene ssp. grisea (Jepson) R.J. Little	s SNH	0000000100
VIOLA pinetorum E. Greene ssp. pinetorum	CaR, SN, WTR, SnBr, SnJt	0600f8c501
VIOLA praemorsa Douglas	NW, CaR n&c SNH, Wrn	063dc00004
VIOLA praemorsa Douglas ssp. linguifolia (Torrey & A. Gray) M. Baker & J. Clausen	NW, CaR n&c SNH, Wrn	063dc00004
VIOLA praemorsa Douglas ssp. praemorsa	NW, CaR n&c SNH, Wrn	063dc00004
VIOLA primulifolia L. ssp. occidentalis (A. Gray) L.E. McKinney & R.J. Little	nw KR (near Gasquet, Del Norte Co.)	0001000000
VIOLA purpurea Kellogg	NW, CaR, SN, CW, SW, GB	1fffffdd07
VIOLA purpurea Kellogg ssp. integrifolia M. Baker & J. Clausen	NW, CaR, n&c SNH	063dc00000
VIOLA purpurea Kellogg ssp. mohavensis (M. Baker & J. Clausen) J. Clausen	TR, PR, SNE	0040045403
VIOLA purpurea Kellogg ssp. purpurea	NW, CaR, SN, CW, SW	1ffdfbdd01
VIOLA purpurea Kellogg ssp. quercetorum (M. Baker & J. Clausen) R.J. Little	NW, CaR, SN, CW, SW	1ffdfbdd01
VIOLA purpurea Kellogg ssp. venosa (S. Watson) M. Baker & J. Clausen	GB	0002040006
VIOLA sempervirens E. Greene	NW, CW	013d030800
VIOLA sheltonii Torrey	NW, n SNH, SCoR, n WTR, SnBr, nw PR, Wrn, SnFrB	007d430c05
VIOLA sororia Willd. ssp. affinis (Le Conte) R.J. Little	KR, SnBr, Wrn, SNE	0001040406
VIOLA tomentosa M. Baker & J. Clausen	n-c SNH	0000800000
VIOLA tricolor L.	CCo, SnFrB	0100000800
VISCUM album L.	NCoRO (Sebastopol, Santa Rosa, Sonoma Co.)	0020000000
VITIS californica Benth.	NW, CaRF, SNF, GV, CW, SNE	033d3f2a02
VITIS girdiana Munson	SW, s SNE, D	f8c0045403
VITIS vinifera L.	GV, CW	0100032a00
VULPIA bromoides (L.) S.F. Gray	CA-FP	1ffdfbff01
VULPIA microstachys (Nutt.) Munro	CA	ffffffff07
VULPIA microstachys (Nutt.) Munro var. ciliata (Beal) Lonard & Gould	CA (esp CA-FP)	ffffffff07
VULPIA microstachys (Nutt.) Munro var. confusa (Piper) Lonard & Gould	CA-FP	1ffdfbff01
VULPIA microstachys (Nutt.) Munro var. microstachys	CA (esp CA-FP)	ffffffff07
VULPIA microstachys (Nutt.) Munro var. pauciflora (Beal) Lonard & Gould	CA-FP, D	fffdfbff01
VULPIA myuros (L.) C. Gmelin	CA-FP, D	fffdfbff01
VULPIA myuros (L.) C. Gmelin var. hirsuta Hack.	CA-FP, uncommon in D	fffdfbff01
VULPIA myuros (L.) C. Gmelin var. myuros	CA-FP	1ffdfbff01
VULPIA octoflora (Walter) Rydb.	CA	ffffffff07
VULPIA octoflora (Walter) Rydb. var. hirtella (Piper) Henrard	CA (esp s CA-FP)	ffffffff07
VULPIA octoflora (Walter) Rydb. var. octoflora	s CA-FP, D	fffdfbff01
WASHINGTONIA filifera (L. Linden) H.A. Wendl.	DSon	8000000000
WATSONIA marginata (L.f.) Ker Gawler	SCo	0080000000
WATSONIA meriana (L.) Miller	NCo	0004000000
WHIPPLEA modesta Torrey	NW, w SnFrB (Santa Cruz Mtns), n SCoRO	003d020800
WHITNEYA dealbata A. Gray	CaR, n&c SN	0600d80000
WISLIZENIA refracta Engelm.	c&s SNF, SnJV, D	e000302000
WISLIZENIA refracta Engelm. ssp. californica (E. Greene) C.S. Keller	c&s SNF, SnJV	0000302000
WISLIZENIA refracta Engelm. ssp. palmeri (A. Gray) C.S. Keller	DSon	8000000000
WISLIZENIA refracta Engelm. ssp. refracta	DMoj, n DSon	e000000000
WOLFFIA arrhiza (L.) Wimmer	SCo (San Diego Co.)	0080000000
WOLFFIA borealis (Hegelm.) Landolt & O. Wildi	NCoR, CaRH, SCo	04b8000000
WOLFFIA brasiliensis Wedd.	ScV (near Sacramento River)	0000000200
WOLFFIA columbiana Karsten	SnJV, CCo, SCoRO, SCo	0180022000
WOLFFIA globosa (Roxb.) Hartog & Plas	SNF, SnJV, SCo	0080382000
WOLFFIELLA lingulata (Hegelm.) Hegelm.	NCo, SNF, GV, CCo, SnFrB, SCo?	0184382a00
WOLFFIELLA oblonga (Philippi) Hegelm.	NCo, SNF, GV, CCo, SnFrB, SCo?	0184382a00
WOODSIA oregana D. Eaton	KR, CaRH, n&s SNH, SnBr, PR, MP?, W&I, DMtns	4443404506
WOODSIA plummerae Lemmon	DMtns	4000000000
WOODSIA scopulina D. Eaton	KR (Trinity Co.), CaRH, SNH, SnBr, W&I	0401c00502
WOODWARDIA fimbriata Smith	CA-FP (exc GV)	1ffdfbdd01
WYETHIA angustifolia (DC.) Nutt.	NW, SN, SCoR	003dfb8100
WYETHIA bolanderi (A. Gray) W.A. Weber	n&c SNF	0000180000
WYETHIA elata H.M. Hall	c SNF	0000100000
WYETHIA glabra A. Gray	s NCoR, CW	0138030800
WYETHIA helenioides (DC.) Nutt.	s NCoR, c SNF, CW	0138130800
WYETHIA invenusta (E. Greene) W.A. Weber	s SN	0000200100
WYETHIA longicaulis A. Gray	KR, n NCoR	0039000000
WYETHIA mollis A. Gray	KR, CaR, n&c SN, n SNE	0601dc0000
WYETHIA ovata Torrey & A. Gray	s SN, SW	18c0205501
WYETHIA reticulata E. Greene	n SNF (El Dorado Co.)	0000080000
XANTHIUM spinosum L.	CA-FP	1ffdfbff01
XANTHIUM strumarium L.	CA	ffffffff07
XEROPHYLLUM tenax (Pursh) Nutt.	KR, NCoRO, CaRH, n SNH, CCo, SnFrB	0521400800
XYLOCOCCUS bicolor Nutt.	SCo, s ChI (Santa Catalina Island)	1080000000
XYLORHIZA cognata (H.M. Hall) T.J. Watson	n DSon (Riverside Co.)	8000000000
XYLORHIZA orcuttii (Vasey & Rose) E. Greene	s DSon (Imperial, San Diego cos.)	8000000000
XYLORHIZA tortifolia (Torrey & A. Gray) E. Greene var. tortifolia	s SNE, DMoj, n DSon	e000040002
YABEA microcarpa (Hook. & Arn.) Koso-Polj.	CA-FP, esp coast, SNF, SnGb, SnBr, SnJt	1ffdfbff01
YUCCA baccata Torrey	e DMtns (Clark, New York, Providence mtns)	4000000000
YUCCA brevifolia Engelm.	W&I, DMoj	6000000002
YUCCA schidigera K.E. Ortgies	s SW (San Diego Co.), s DMoj, nw DSon	f8c0005401
YUCCA whipplei Torrey	s SN (esp e slope), s SCoR, SW	18c0235501
ZANNICHELLIA palustris L.	CA	ffffffff07
ZANTEDESCHIA aethiopica (L.) Sprengel	NCo, NCoRO, SnFrB, SCoRO, SCo	00a4020800
ZIGADENUS brevibracteatus (M.E. Jones) H.M. Hall	Teh, WTR, DMoj	6000008001
ZIGADENUS exaltatus Eastw.	SNF	0000380000
ZIGADENUS fremontii (Torrey) S. Watson	NW, ScV, CW, SW	19fd035e01
ZIGADENUS micranthus Eastw.	NW, SnFrB, SCoRI	003d010800
ZIGADENUS micranthus Eastw. var. fontanus (Eastw.) D. McNeal	NCoR, SnFrB, SCoRI	0038010800
ZIGADENUS micranthus Eastw. var. micranthus	NW	003d000000
ZIGADENUS paniculatus (Nutt.) S. Watson	NW, CaR, n SNH, GB	063f440006
ZIGADENUS venenosus S. Watson var. venenosus	NW, CaR, SN, CW, WTR, PR, GB, DMtns	477fffc907
ZIZANIA palustris L. var. interior (Fassett) W. Dore	NCoRI, ScV, MP	0012000204
ZIZIPHUS obtusifolia (Torrey & A. Gray) A. Gray var. canescens (A. Gray) M. Johnston	DSon	8000000000
ZIZIPHUS parryi Torrey var. parryi	w edge DSon	8000000000
ZOSTERA marina L.	NCo, CCo, SCo, ChI	1984000000
ZOSTERA pacifica S. Watson	NCo, CCo, SCo	0184000000
ZYGOPHYLLUM fabago L.	NCoRO, SnJV, D	e020002000
