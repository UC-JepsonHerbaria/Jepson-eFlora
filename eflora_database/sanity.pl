open(IN,"/JEPS-master/Jepson-eFlora/synonymy/input/smasch_taxon_ids_CCH.txt") || die;
while(<IN>){
chomp;
($code,$name)=split(/\t/);
$TNOAN{$name}=$code;
}
use BerkeleyDB;

%proscribed=(
"woodlands","woodland",
"woods","woodland",
"pinyon-juniper","pinyon/juniper",
"grasslands","grassland",
"faces","surfaces",
"solitary","1",
"very","[delete]",
"sometimes","occ",
"often","gen",
"Shrubs","Shrub",
"tiny","minute",
"waste places","disturbed areas",
);

@field_list=(
"CAPTION",
"UNABRIDGED KEY LEAD",
"TAXON AUTHOR",
"COMMON NAME",
"UNABRIDGED COMMON NAME",
"TJM1 AUTHOR",
"TJM2 AUTHOR",
"TJMX AUTHOR",
"TJMXX AUTHOR",
"TJMXXX AUTHOR",
"TJM4X AUTHOR",
"TJM5X AUTHOR",
"AUTHORSHIP COMMENT",
"HABIT+",
"UNABRIDGED HABIT+",
"PLANT BODY",
"STEM",
"STEMS",
"STERILE STEM",
"FERTILE STEM",
"LEAF",
"LEAVES",
"SPINE",
"SPINES",
"FROND",
"FRONDS",
"INFLORESCENCE",
"STAMINATE HEAD",
"RAY OR PISTILLATE FLOWER",
"PISTILLATE OR BISEXUAL HEAD",
"PISTILLATE HEAD",
"STAMINATE INFLORESCENCE",
"PISTILLATE OR BISEXUAL INFLORESCENCE",
"PISTILLATE INFLORESCENCE",
"SPIKELET",
"FERTILE SPIKELET",
"STERILE SPIKELET",
"DISTAL SPIKELET",
"CENTRAL SPIKELET",
"LATERAL SPIKELET",
"STAMINATE SPIKELET",
"PISTILLATE SPIKELET",
"UNABRIDGED FLOWER",
"FLOWER",
"STAMINATE FLOWER",
"PISTILLATE FLOWER",
"RAY FLOWER",
"DISK FLOWER",
"UNABRIDGED DISK FLOWER",
"CONE",
"CONES",
"POLLEN CONE",
"SEED CONE",
"BISEXUAL FLOWER",
"FRUIT",
"SEED",
"SEEDS",
"SPORANGIUM",
"SPORANGIA",
"SPORANGIUM CASES",
"SPORANGIUM CASE",
"MALE SPORANGIUM CASE",
"FEMALE SPORANGIUM CASE",
"SPORES",
"CHROMOSOMES",
"UNABRIDGED CHROMOSOMES",
"RARITY STATUS",
#Rarity Status used to be below Ecology in eflora_display.php and this file; however 90% of all records in Eflora_treatments had RarityStatus above ecology.
"ECOLOGY",
"UNABRIDGED ECOLOGY",
"ELEVATION",
"BIOREGIONAL DISTRIBUTION",
"UNABRIDGED BIOREGIONAL DISTRIBUTION",
"DISTRIBUTION OUTSIDE CALIFORNIA",
"UNABRIDGED DISTRIBUTION OUTSIDE CALIFORNIA",
"SPECIES IN GENUS",
"UNABRIDGED SPECIES IN GENUS",
"GENERA IN FAMILY",
"UNABRIDGED GENERA IN FAMILY",
"ETYMOLOGY",
"UNABRIDGED ETYMOLOGY",
"TOXICITY",
"SYNONYMS",
"UNABRIDGED SYNONYMS",
"REFERENCE",
"UNABRIDGED REFERENCE",
"HORTICULTURAL INFORMATION",
"UNABRIDGED HORTICULTURAL INFORMATION",
"NOTE",
"NOTES",
"UNABRIDGED NOTE",
"FLOWERING TIME",
"FRUITING TIME",
"CONING TIME",
"AUTHORSHIP OF PARTS",
"WEEDINESS",
"SCIED",
);
$field_order=1;
grep($field_list{$_}=$field_order++,@field_list);
foreach(keys(%field_list)){
#print "$_: $field_list{$_}\n";
}
#die;
open(OUT, ">eflora.in");



undef ($/);
foreach(@ARGV){
	$file=$_;
	open(IN,$file) || die "couldn't open $file\n";
	$all_lines=<IN>;

#converts windows line ends#

	$all_lines=~s/ *\r\n/\n/g;
	if($all_lines=~s/\xEF\xBB\xBF//){
		print "$file Open Office Text tag\n";
	}
	@all_pars=split(/\n\n+/,$all_lines);

	foreach(@all_pars){      
print OUT;
++$lc;


next if m/^[aA]dmin/;
next if m/^CAPTION/;
next if m/^#/;
if (m/\b([A-Za-z]+) \1\b/){
			print "ECHO $file $& \n\n";
}
		if(m/\n +/){
			print "$file Space in blank line $_\n\n";
			
		}
				if(m/eceased/){
					print "$file deceased\n\n";
				}


		unless(m/HABIT\+:/){
			unless (m/\.\.\.\./){
				unless (m/Group/){
					unless (m/(Key to Vegetative|Key to Pistillate|Key to Staminate)/){
				print "$file No HABIT line $_$lc\n\n";
				
		}
			}
				}
					}
s/\[\[[^]]+\]//;
		if(m/\[\[/){
			print "$file unstripped comment $_\n\n";
		}
		if(m/^[A-Z][A-Z-]+ [a-z][a-z-]+/){
			print "$file No designation of nativity $_\n\n";
			
		}

if(m/(.*)\nTAXON AUTHOR: (.*)/){
$tax_name="$1 $2";
$tax_name=~s/^([A-Z])([A-Z]+)/$1\L$2/;
}
###We used to remove expanded author names for the purpose of TJM2 book length
###This is no longer a consideration, so the routine is removed

		if(m/DISTRIBUTION OUTSIDE CALIFORNIA: (.+)/){
			$doc=$&;
			$end_doc=$1;
			unless($end_doc=~/\. *$/){
					print "$file\tDist outside California punct\t$end_doc\n\n";
					;
			}
			if(m/BIOREGIONAL/){
				unless(m/BIOREGIONAL.*; *$/m){
					($punct)=m/(BIOREGIONAL.*\n.*)/;
					print "$file -- Dist outside California punct -- $punct\n\n";
					
				}
			}	
			elsif(m/UNABRIDGED DISTRIBUTION OUTSIDE/){
				print "known false positive: Distribution outside California but no Bioregional Distribution $doc\n";
			}
			else{
				print "$file\tDistribution outside California but no Bioregional Distribution $doc\n\n";
				
			}
		}
		elsif(m/BIOREGIONAL/){
			unless(m/BIOREGIONAL.*[^;]$/m){
				$punct="no dist";
				($punct)=m/(BIOREGIONAL.*)/;
				print "$file\tBioregional punctuation $punct\n\n";
				 
			}
		}
		s/([A-Za-z])_([A-Za-z])/$1&95;$2/g;
		$open_i=0;
		while(s/_/<I>/){
			++$open_i;
			s/_/<\/I>/;
			--$open_i;
		}
 		s/&95;/_/g;
		unless($open_i==0){
			print "$file underline problem $_\n\n";
		}
		#print;
		next if m/^[Aa]dmin/;
		@lines=split("\n",$_);

$field_order=1;
grep($field_list{$_}=$field_order++,@field_list);
foreach(keys(%field_list)){
#print "$_: $field_list{$_}\n";
}

		
		
		
		if(m|^([A-Z][A-Z]+) +([a-z-]+) *\n|m){
			$trinomial="$1 $2";
#warn "flabba $trinomial\n";
			$epithet=$2;
			$name_link=ucfirst(lc($trinomial));
			$name_for_hc=$name_link;
			if($TNOAN{$name_link}){
				$name_anchor=<<EOP;
<a name="$TNOAN{$name_link}"> </a>
EOP
				$store_treat_path{$TNOAN{$name_link}}=$outfile;
				($consort_link=$name_link)=~s/ /%20/g;
				s!(if verified,) !<a href="/cgi-bin/get_consort.pl?taxon_name=$consort_link">$1</a> !;
				$name_link= <<EOP;
<a href="/cgi-bin/get_cpn.pl?$TNOAN{$name_link}">[ICPN]</a>
EOP
				}
				else{
					print "1. NO ${name_link}\t--\t1. NO TNOAN\n\n" unless $TNOAN{${name_link}};
					$name_link= "";
				}

			}
			elsif(m/^([A-Z][A-Z]+) +([a-z-]+).*(var\.|nothosubsp\.|subsp\.) ([a-z-]+) *\n/m){
				$name_link=ucfirst(lc("$1 $2 $3 $4"));
				($consort_link=$name_link)=~s/ /%20/g;
s!(if verified,) !<a href="/cgi-bin/get_consort.pl?taxon_name=$consort_link">$1</a> !;
				if($TNOAN{$name_link}){
					$name_anchor=<<EOP;
<a name="$TNOAN{$name_link}"> </a>
EOP
				$store_treat_path{$TNOAN{$name_link}}=$outfile;
				$name_link= <<EOP;
<a href="/cgi-bin/get_cpn.pl?$TNOAN{$name_link}">[ICPN]</a>
EOP
				}
				else{
					print "2. NO $name_link\t--\tNO TNOAN\n\n" unless $TNOAN{${name_link}};
					$name_link= "";
				}
#$store_treat_path{$name_link}=$outfile;
#print "$name_link\n";
			}
			$last_tag="UNABRIDGED KEY LEAD";
			
			
			
			foreach $sortline (@lines[3 .. $#lines]){
				$sortline=~s/ +$//;
				if($sortline=~m/(pediceled|pedicle)/){
					print "$file $1 Spelling problem $sortline\n\n";
				}
				if($sortline=~m/(FLOWERING TIME|NOTE): [a-z]/){
					print "$file Capitalization problem $sortline\n\n";
				}
				if($sortline=~m/(FLOWERING TIME): ...*(Spring|Summer|Fall|Winter)/){
					print "$file SEASONCapitalization problem $sortline\n\n";
				}
				if($sortline=~m/(....,;)/){
					print "$file punctuation problem $1 $sortline\n\n";
					
				}
				if($sortline=~m/\d(mm|cm|m|dm)/){
					print "$file missing space? $1 $sortline\n\n";
				}
				if($sortline=~m/(HABIT\+|FLOWERS?|INFLORESCENCE|FRUIT|SEEDS?|STEMS?|CHROMOSOMES|SPECIES IN GENUS|GENERA IN FAMILY|NOTE|TOXICITY|ELEVATION): .+[^.] *$/){
					print "$file EOL punctuation problem\t$sortline\n\n" unless $sortline=~/UNABRIDGED/;
					
				}
				if($sortline=~/ELEVATION/){
#print "LAST: $last_line\n";
					unless($last_line=~/; *$/ || $last_line=~/^RARITY STATUS/){
							print "$file line before ELEV punctuation problem\t$last_line$sortline\n\n";
					}
				}
				if($sortline=~m/HABIT\+: [a-z]/){
					print "$file Capitalization problem $sortline\n\n";
				}
				
				if(($sortline =~ m/(Argus|Cascade|Coso|Diablo|La Panza|Last Chance|Hamilton|Panamint|Santa Lucia|Temblor|Kingston|Clark)/) && ($sortline =~ m/(Clark. *\(.*;|Clark Mtn Range|Clark Mtn.?,? .*range|Kingston.?,? .*[Mm]tns|Last Chance Range.?,? .*[Mm]tns|Panamint Range.?,? .*[Mm]tns|Santa Lucia Range.?,? .*[Mm]tns?)/)){				
					print "known false positive: mountain range problem\t--\t$sortline\n";
				}	
				elsif ($sortline =~ m/(Clark Mtn|Argus|Cascade|Coso|Diablo|La Panza|Last Chance|Hamilton|Panamint|Santa Lucia|Temblor|Kingston) .*[Mm]tns?/){
						print "$file - mountain range problem\t--\t$sortline\n\n";
				}
				if($sortline=~m/HABIT\+: \d/){
					print "$file \"Pl\" problem - $sortline\n\n";
				}
				if($sortline=~m/TJM \(/){
					#print "$file TJM space $sortline\n\n" unless $sortline=~/AUTHOR/;
				}
				if($sortline=~m/TJM1/){
					print "$file TJM1 $sortline\n\n" unless $sortline=~/AUTHOR/;
				}
				if($sortline=~m/rrr/){
					print "$file rrr $sortline\n\n";
				}
				if($sortline=~m/_/){
					if(m/(var\.|nothosubsp\.|subsp\.) [a-z]+/){
						print "$file  - variety underline problem $_\n\n";
					}
				}
				if($sortline=~m/ [,.;:] /){
					print "$file  punctuation spacing  $sortline\n\n";
				}
				if($sortline=~m/[A-Z][a-z]+ Mt[^n]/){
					print "$file  - Mountain abbreviation - $sortline\n\n";
					
				}
				if($sortline=~m/ Mtns?\.[ ;,.:]./){
					print "$file  - Mountain punctuation - $sortline\n\n";
				}
				if($sortline=~m/ et al[^.]/){
					print "$file  - et al - $sortline\n\n";
				}
				if($sortline=~m/ (var|subspp*|spp*)\b[^.]/){
					print "$file   - species abbreviation - $sortline\n\n";
				}
				if($sortline=~m/&mathx[^;]/){
					print "$file MATHX $sortline\n\n";
				}
				
				if(($sortline =~ m/([^-]\)[^\[\])0-9,.;: -])/) && ($sortline =~ m/(\(\d+\)\+- \d|\([01]\)few|\([01]\)several|\(mis\)|\)&deg|\)%|\(ob\)|\(un\)|\(sub\)|\(hemi\)|\(Dec\)Mar|\(Jan--Feb\)Mar|\(Jan\)Mar|\(Jan\)Apr|\(Feb\)Apr|\(Mar\)Apr|\(Apr\)May|\(May\)Jun|\(May\)Jul|\(May\)Aug|\(Jun\)Jul|\(Jun\)Aug|\(Jul\)Aug)/)){
					#print "known false positive: probable paren spacing error1 =$1: $sortline\n";
					
				}
					elsif($sortline =~ m/([^-]\)[^\[\])0-9,.;: -])/){
					print "$file - probable paren spacing error (1) =$1: $sortline\n\n";
				}
				
				($open_brace)=($sortline=~s/([\[({])/$1/g);
				($close_brace)=($sortline=~s/([)\]}])/$1/g);
				unless($open_brace==$close_brace){
					print "$file - probable paren match error (2): $sortline\n\n";
				}
				
				if($sortline =~ m/\( /){
					print "$file - probable paren spacing error (3): $sortline\n\n";
				}
				
				if(($sortline =~ m/(\d---\d)/) && ($sortline =~ m/(-\d-pin)/)){
					print "known false positive: probable en-dash error (4): $sortline\n\n";
				}
					elsif($sortline =~ m/(\d---\d)/){
					print "$file - probable en-dash error (4): $sortline\n\n";
					}
					
				if(($sortline=~m/(\d-\d)/) && ($sortline =~ m/\/\d+-\d+\//)){
					print "known false positive (dash in URL), probable en-dash error5: $sortline\n";
				}
					elsif(($sortline=~m/(\d-\d)/) && ($sortline =~ m/Phytoneuron \d+-\d+/)){
						print "known false positive (dash in Phytoneuron online volume no.), probable en-dash error5: $sortline\n";
					}
					elsif($sortline=~m/(\d-\d)/){
						print "$file - probable en-dash error (5): $sortline\n\n";
					}
				
				if(($sortline =~ m/([A-Za-z]--[A-Za-z])/) && (($sortline =~ m/[A-Z][a-z][a-z]--[A-Z][a-z][a-z]/ || $sortline =~ m/TIME:/ || $sortline =~ m/few--/ || $sortline =~ m/ummer--fall-flower/ || $sortline =~ m/winter--spring-flower/ ))){
					#print "known false positive: probable en-dash error6 =$1: $sortline\n";
					
				}
					elsif($sortline =~ m /([A-Za-z]--[A-Za-z])/){
						print "$file - probable en-dash error (6) =$1: $sortline\n\n";
					}
					
				if(($sortline =~ m/(few-? to [a-z]+-)/) && ($sortline =~ m/(few-.*to.*many-|few-.*to.*several-)/)){
					print "known false positive: probable en-dash error (7) =$1: $sortline\n";
					;
				}
					elsif($sortline =~ m/(few-? to [a-z]+-)/){
						print "$file - probable en-dash error (7) =$1: $sortline\n\n";
					}
				
				if($sortline=~m/\blanceolate-(ovate|linear|elliptic|oblong|deltate)/ ){
					print "$file - lanceolate dash problem $1: $sortline\n\n";
				}
				
				if($sortline=~m/([\200-\377])/ ){
					print "$file - possible font problem $1: $sortline\n\n"
				}
				#exclude taxa already in TJM2 in brackets and non-taxon bracketed info
				unless($sortline=~m/(\[GALENIA|\[GUILLEMINEA|\[PETROSELINUM|\[THELESPERMA|\[SANTOLINA|\[COTA|\[ECHINOPS|\[GAILLARDIA|\[MAURANTHEMUM|\[DYSSODIA|\[GAILLARDIA|\[CARRICHTERA|\[ERUCASTRUM|\[AUBRIETA|\[CARRICHTERA|\[IBERIS|\[IPOMOEA|\[LUMA|\[SYZYGIUM|\[CHAMELAUCIUM|\[GLAUCIUM|\[LAMIASTRUM|\[PLUMBAGO|\[COPROSMA|\[DIODIA|\[NICANDRA|\[LEUCOJUM|\[LANTANA|\[BULBINE|\[SPARAXIS|\[GAUDINIA|\[ZIZANIA|\[\d+|\[[a-z]+\]|\[[A-Z][a-z]+\]|\[[A-Z].*:)/){ 
				#\[\d+|\[[a-z]+\]|\[[A-Z][a-z]+\]|\[[A-Z].*: this part of the above is supposed to kick out untagged unabridged lines in key that were printed in the manual, I think.  If so, it is not working for all cases.  For some reason, some are passing thick check. New code was added below to skip these other "known" unabridged key leads
				#This script is skipping some of the first bracketed unabridged lines, but not all. For example, see Papaver and Limonium.
					if(($sortline =~ m/-> \[[A-Z-]{2,}/) && ($sortline !~ m/UNABRIDGED KEY LEAD/)){
						print "$file - possible UNABRIDGED KEY LEAD tag missing: $sortline\n\n";
					}
					
					elsif(($sortline =~ m/-> \[[A-Z]\. [a-z-]+\]/) && ($sortline !~ m/UNABRIDGED KEY LEAD/)){
						unless ($sortline =~ m/\[(A\. spinosus|A\. blitum|A\. caudatus|A\. viridis|A\. cruentus|A\. hypochondriacus|A\. fruticosa|A. &times;platyspina|A\. trifida|A\. annua|C\. bursifolia|G\. stachydifolia|M\. verna|D\. reptans|D\. nemorosa|O\. robusta|L\. erinus|L\. etrusca|C\. diffusum|D\. plumarius|S\. subulata|S\. pendula|S\. pseudatocion|C\. tricolor|C\. multicava|C\. ovata|E\. cyathophora|E\. davidii|E\. dentata|E\. rigida|E\. myrsinites|A\. decurrens|A\. mearnsii|A\. paradoxa|A\. podalyriifolia|A\. verticillata|A\. pycnantha|A\. retinodes|G\. maderensis|M\. scutellata|T\. resupinatum|T\. alexandrinum|V\. lathyroides|V\. pannonica|V\. disperma|V\. bithynica|V\. cracca|Q\. robur|E\. cygnorum|G\. texanum|P\. zonale|P\. capitatum|P\. vitifolium|H\. androsaemum|H\. hookerianum|L\. monelli|M\. nyctaginea|O\. rosea|O\. stricta|O\. bowiei|O\. purpurea|P\. argemone|P\. heterotepala|P\. tenuifolium|A\. orontium|A\. majus|L\. purpurea|V\. triphyllos|L\. brassicifolium|L\. preauxii|L\. sventenii|E\. polycladon|var\. glabratum|P\. orientalis|P\. fowleri|subsp\. buxiforme|subsp\. neglectum|subsp\. rurivagum|R\. acris|R\. bulbosus|R\. odorata|P\. coccinea|P\. crenulata|P\. atalantioides|A\. campestre|C\. parqui|P\. viscosa|P\. longifolia|U\. americana|U\. minor|A\. cepa|A\. aethiopicus|J\. anthelatus|A\. geniculata|B\. arvensis|M\. schreberi|subsp\. bulbosa)\]/g){
								#known non-tagged unabridged key leads from the printed manual, skip these false positives;
							print "$file - possible UNABRIDGED KEY LEAD tag missing (2): $sortline\n\n";
								#print only untagged and unabridged key lines that dont match the unabridged lines printed in the manual
						}
					}
					elsif(($sortline =~ m/-> \[(subsp\.|var\.|nothosubsp\.|f\.) [a-z-]+\]/) && ($sortline !~ m/UNABRIDGED KEY LEAD/)){
						unless ($sortline =~ m/\[(var\. glabratum|subsp\. buxiforme|subsp\. neglectum|subsp\. rurivagum|subsp\. bulbosa)\]/g){
								#known non-tagged unabridged key leads from the printed manual, skip these false positives;
							print "$file - possible UNABRIDGED KEY LEAD tag missing (4): $sortline\n\n";
								#print only untagged and unabridged key lines that dont match the unabridged lines printed in the manual
						}
#known unabridged taxa from the printed manual, skip these false positives
#AMARANTHUS
#A. spinosus|A. blitum|A. caudatus|A. viridis|A. cruentus|A. hypochondriacus|A. fruticosa
#AMBROSIA
#A. &times;platyspina|A\. trifida
#ARTEMISIA
#A. annua					
#CREPIS
#C. bursifolia
#GAMOCHAETA
#G. stachydifolia
#MYOSOTIS
#M. verna
#DRABA
#D. reptans|D. nemorosa
#OPUNTIA
#O. robusta
#LOBELIA
#L. erinus
#LONICERA
#L. etrusca
#CERASTIUM
#C. diffusum
#DIANTHUS
#D. plumarius
#SAGINA
#S. subulata
#SILENE
#S. pendula|S. pseudatocion
#CONVOLVULUS
#C. althaeoides|C. tricolor
#CRASSULA
#C. multicava|C. ovata
#EUPHORBIA
#E. cyathophora|E. davidii|E. dentata|E. rigida|E. myrsinites
#ACACIA
#A. decurrens|A. mearnsii|A. paradoxa|A. podalyriifolia|A. verticillata|A. pycnantha|A. retinodes
#GENISTA
#G. maderensis
#MEDICAGO
#M. scutellata
#TRIFOLIUM
#T. resupinatum|T. alexandrinum
#VICIA
#V. lathyroides|V. pannonica|V. disperma|V. bithynica|V. cracca
#QUERCUS
#Q. ribur
#ERODIUM
#E. cygnorum
#GERANIUM
#G. texanum
#PELARGONIUM
#P. zonale|P. capitatum|P. vitifolium
#HYPERICUM
#H. androsaemum|H. hookerianum
#LYSIMACHIA
#L. monelli
#MIRABILIS
#M. nyctaginea
#OENOTHERA    
#O. rosea|O. stricta
#OXALIS
#O. bowiei|O. purpurea
#PAPAVER
#P. argemone
#PHYTOLACCA
#P. heterotepala
#PITTOSPORUM
#P. tenuifolium
#ANTIRRHINUM
#A. orontium|A. majus
#LINARIA
#L. purpurea
#VERONICA
#V. triphyllos
#LIMONIUM
#L. brassicifolium|L. preauxii|L. sventenii
#ERIOGONUM
#E. polycladon|var. glabratum|
#PERSICARIA
#P. orientalis
#POLYGONUM
#P. fowleri|subsp. buxiforme|subsp. neglectum|subsp. rurivagum
#RANUNCULUS
#R. acris|R. bulbosus
#RESEDA
#R. odorata
#PYRACANTHA
#P. coccinea|P. crenulata|P. atalantioides
#ACER
#A. campestre
#CESTRUM
#C. parqui
#PHYSALIS
#P. viscosa|P. longifolia
#ULMUS
#U. americana|U. minor
#ALLIUM
#A. cepa
#ASPARAGUS
#A. aethiopicus
#JUNCUS
#J. anthelatus
#AEGILOPS
#A. geniculata
#BROMUS
#B. arvensis
#MUHLENBERGIA
#M. schreberi
#POA
#subsp. bulbosa
#Eriogonum nutans
#var. glabratum

#Anisodontea capensis

					}
					elsif(($sortline =~ m/-> \[[A-Z]\. [a-z-]+/) && ($sortline =~ m/UNABRIDGED KEY LEAD/)){
						print "known UNABRIDGED KEY LEAD tag==>$sortline\n";
					}
					elsif(($sortline =~ m/-> \[[A-Z][a-z-]+ [a-z-]+/) && ($sortline =~ m/UNABRIDGED KEY LEAD/)){
						print "known UNABRIDGED KEY LEAD tag==>$sortline\n";
					}
					
					elsif(($sortline =~ m/-> \[[A-Z-]+\]/) && ($sortline !~ m/UNABRIDGED KEY LEAD/)){
						print "$file - possible UNABRIDGED KEY LEAD tag missing (3): $sortline\n\n"	
					}
					elsif(($sortline !~ m/-> \[/) && ($sortline =~ m/UNABRIDGED KEY LEAD/)){
						print "known UNABRIDGED KEY LEAD without square brackets, double check to see if paired with a bracketed taxon==>$sortline\n";	
					}
					elsif($sortline =~ m/UNABRIDGED KEY LEAD/){
						print "$file - possible poorly formatted UNABRIDGED KEY LEAD: $sortline\n\n"	
					}
				}	
				if($sortline=~m/TIME: [A-Z]/ ){
					unless($sortline=~m/(TIME: (All|Jun|Jul|Jan|Feb|Mar|Apr|May|Aug|Sep|Oct|Nov|Dec|Summer|Fall|Winter|Spring))/ ){
								#known properly formatted time formats from printed manual, skip these false positives;
						unless ($sortline =~ m/TIME: (Evidently unrecorded in California,|After summer rain,|Generally|Late|Early|Probably|Mostly|Mid) /g){
								#known oddly formatted time formats from recent treatments, skip these false positives;
							print "$file  -possible date problem $1: $sortline\n\n";
						}
					}
					if($sortline=~m/Jan--Dec/ ){
						print "$file Jan--Dec -> All year $sortline\n\n";
					}
					if($sortline=~m/All yr/ ){
						print "$file All yr -> All year $sortline\n\n";
					}
				}
				elsif($sortline=~m/TIME: [a-z]/ ){
					print "$file  -possible date capitalization problem: $sortline\n\n";
				}
				if($sortline=~m/( _ )/ ){
					print "$file  - possible underline spacing problem $1: $sortline\n\n";
				}

				($tag=$sortline)=~s/:.*//;
				$tag=~s/^([A-Z_\+]+) [^A-Z].*/$1/;
				unless($field_list{$tag}){
					unless ($sortline =~/^\w*[0-9]['.]/ || $last_tag =~/RARITY/){
						print "$file - unrecognized tag $tag $sortline\n\n" unless $tag=~/^\d+['.]/;
					}
				}
				unless($field_list{$tag} > $field_list{$last_tag}){
					unless ($sortline =~/^\w*[0-9]['.]/ || $last_tag =~/RARITY/ || $sortline=~/HORTIC/ || $last_tag=~/UNABRIDGED KEY LEAD/){
						print "$file - Out of order: $sortline : $field_list{$tag} tag=$tag last tag=$last_tag $lc\n\n";
						#I have no clue what this line is doing.. dont think it works.. it is tossing out error for all unabridged key leads

						if($last_tag=~/UNABRIDGED KEY LEAD/){print " (default last tag\n\n" unless $sortline=~/UNABR/;} 						
						
						else{print "\n\n";}
					}
				}
				$last_tag=$tag;
$last_line=$sortline;
			}
		}
	}

