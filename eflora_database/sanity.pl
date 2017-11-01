open(IN,"/Users/davidbaxter/DATA/smasch_taxon_ids.txt") || die;
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
				print "$file\nDistribution outside California but no Bioregional Distribution $doc\n\n";
				
			}
		}
		elsif(m/BIOREGIONAL/){
			unless(m/BIOREGIONAL.*\. *$/m){
				$punct="no dist";
				($punct)=m/(BIOREGIONAL.*)/;
				print "$file\nBioregional punctuation $punct\n\n";
				 
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
				
				if(($sortline =~ m/(Argus|Cascade|Coso|Diablo|La Panza|Last Chance|Hamilton|Panamint|Santa Lucia|Temblor|Kingston|Clark) .*[Mm]tns/) && ($sortline =~ m/(Clark. *\(.*;|Clark Mtn Range|Clark Mtn.?,? .*range|Kingston.?,? .*[Mm]tns|Last Chance Range.?,? .*[Mm]tns|Panamint Range.?,? .*[Mm]tns|Santa Lucia Range.?,? .*[Mm]tns)/)){				
					print "known false positive: mountain range problem\t--\t$sortline\n";
				}	
					elsif ($sortline =~ m/(Argus|Cascade|Coso|Diablo|La Panza|Last Chance|Hamilton|Panamint|Santa Lucia|Temblor|Kingston|Clark) .*[Mm]tns?/){
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
					print "known false positive: probable paren spacing error1 =$1: $sortline\n";
					;
				}
					elsif($sortline =~ m/([^-]\)[^\[\])0-9,.;: -])/){
					print "$file - probable paren spacing error1 =$1: $sortline\n\n";
				}
				
				($open_brace)=($sortline=~s/([\[({])/$1/g);
				($close_brace)=($sortline=~s/([)\]}])/$1/g);
				unless($open_brace==$close_brace){
					print "$file - probable paren match error2: $sortline\n\n";
				}
				
				if($sortline =~ m/\( /){
					print "$file - probable paren spacing error3: $sortline\n\n";
				}
				
				if(($sortline =~ m/(\d---\d)/) && ($sortline =~ m/(-\d-pin)/)){
					print "known false positive: probable en-dash error4: $sortline\n\n";
				}
					elsif($sortline =~ m/(\d---\d)/){
					print "$file - probable en-dash error4: $sortline\n\n";
					}
					
				if(($sortline=~m/(\d-\d)/) && ($sortline =~ m/\/\d+-\d+\//)){
					print "known false positive (dash in URL), probable en-dash error5: $sortline\n";
				}
					elsif(($sortline=~m/(\d-\d)/) && ($sortline =~ m/Phytoneuron \d+-\d+/)){
						print "known false positive (dash in Phytoneruron online volume no.), probable en-dash error5: $sortline\n";
					}
					elsif($sortline=~m/(\d-\d)/){
						print "$file - probable en-dash error5: $sortline\n\n";
					}
				
				if(($sortline =~ m/([A-Za-z]--[A-Za-z])/) && (($sortline =~ m/[A-Z][a-z][a-z]--[A-Z][a-z][a-z]/ || $sortline =~ m/TIME:/ || $sortline =~ m/few--/ || $sortline =~ m/ummer--fall-flower/ || $sortline =~ m/winter--spring-flower/ ))){
					print "known false positive: probable en-dash error6 =$1: $sortline\n";
					
				}
					elsif($sortline =~ m /([A-Za-z]--[A-Za-z])/){
						print "$file - probable en-dash error6 =$1: $sortline\n\n";
					}
					
				if(($sortline =~ m/(few-? to [a-z]+-)/) && ($sortline =~ m/(few-.*to.*many-|few-.*to.*several-)/)){
					print "known false positive: probable en-dash error7 =$1: $sortline\n";
					;
				}
					elsif($sortline =~ m/(few-? to [a-z]+-)/){
						print "$file - probable en-dash error7 =$1: $sortline\n\n";
					}
				
				if($sortline=~m/\blanceolate-(ovate|linear|elliptic|oblong|deltate)/ ){
					print "$file - lanceolate dash problem $1: $sortline\n\n";
				}
				
				if($sortline=~m/([\200-\377])/ ){
					print "$file - possible font problem $1: $sortline\n\n"
				}
				#exclude taxa already in TJM2 in brackets and non-taxon bracketed info
				unless($sortline=~m/(\[GALENIA|\[GUILLEMINEA|\[PETROSELINUM|\[THELESPERMA|\[SANTOLINA|\[COTA|\[ECHINOPS|\[GAILLARDIA|\[MAURANTHEMUM|\[DYSSODIA|\[GAILLARDIA|\[CARRICHTERA|\[ERUCASTRUM|\[AUBRIETA|\[CARRICHTERA|\[IBERIS|\[IPOMOEA|\[LUMA|\[SYZYGIUM|\[CHAMELAUCIUM|\[GLAUCIUM|\[LAMIASTRUM|\[PLUMBAGO|\[COPROSMA|\[DIODIA|\[NICANDRA|\[LEUCOJUM|\[LANTANA|\[BULBINE|\[SPARAXIS|\[\d+|\[[a-z]+\]|\[[A-Z][a-z]+\]|\[[A-Z].*:)/){ 
				
					if(($sortline =~ m/-> \[[A-Z]{2,}/) && ($sortline !~ m/UNABRIDGED KEY LEAD/)){
						print "$file - possible UNABRIDGED KEY LEAD tag missing: $sortline\n\n";
					}
					
					elsif(($sortline =~ m/-> \[[A-Z]\. [a-z]+/) && ($sortline !~ m/UNABRIDGED KEY LEAD/)){
						print "$file - possible UNABRIDGED KEY LEAD tag missing2: $sortline\n\n";
					}
					elsif(($sortline =~ m/-> [A-Z]\. [a-z]+/) && ($sortline =~ m/UNABRIDGED KEY LEAD/)){
						print "known UNABRIDGED KEY LEAD tag $sortline\n";
					}
					
					elsif(($sortline =~ m/-> \[[A-Z]+\]/) && ($sortline !~ m/UNABRIDGED KEY LEAD/)){
						print "$file - possible UNABRIDGED KEY LEAD tag missing3: $sortline\n\n"	
					}
					elsif(($sortline =~ m/\[[varsubp]{3,5}\. /) && ($sortline !~ m/UNABRIDGED KEY LEAD/)){
						print "$file - possible UNABRIDGED KEY LEAD tag missing4: $sortline\n\n"	
						}
				}	
				if($sortline=~m/TIME: [a-z]/ ){
					unless($sortline=~m/(TIME: (Jun|Jul|Jan|Feb|Mar|Apr|May|Aug|Sep|Oct|Nov|Dec|Summer|Fall|Winter|Spring))/ ){
						print "$file  -possible date capitalization problem $1: $sortline\n\n";
					}
					if($sortline=~m/Jan--Dec/ ){
						print "$file Jan--Dec -> All yr $sortline\n\n";
					}
					if($sortline=~m/All year/ ){
						print "$file All year -> All yr $sortline\n\n";
					}
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

