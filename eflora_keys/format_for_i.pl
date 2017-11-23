#formatter for eFlora that expects input with expanded abbreviations


#Zeltnera arizonica is a native that is extirpated.  It is not parsing into the index or onto species pages in the flora.  This code below does not accept this format:
#NATIVE
#EXTIRPATED
#ZELTNERA arizonica
#TAXON AUTHOR: (A. Gray) G. Mans.
#Native species check for Native on line 0 and report the name on line 1, this is skipping the taxon name in this case.



open(warn_cnps, ">output/CNPS_warning.txt") || die;
warn <<EOP;
NEED TO ADD IN AUTHORS WHERE THEY WERE DEEMED UNNECESSARY FOR PRINTED BOOK
EOP
use BerkeleyDB;
open (ERR, ">output/ijm_error.txt");
use lib "/JEPS-master/Jepson-eFlora/Modules/";
use flatten;
$genus="AA";
$unlinked= unlink 'IJM.hash', 'IJM_key.hash', 'name_to_code.hash';
#die "failed to unlink hashes\n" unless $unlinked==2;

#http://www.rareplants.cnps.org/detail/65.html
open(IN, "/Users/davidbaxter/DATA/Interchange/CNPS_ID.txt") || die;
while(<IN>){
	chomp;
	($id,$name)=split(/\t/);
#$name=~s/ssp\./subsp./;
	$CNPS_URL{$name}="http://www.rareplants.cnps.org/detail/${id}.html";
}

tie(%IJM, "BerkeleyDB::Hash", -Filename=>"output/IJM.hash", -Flags      => DB_CREATE)|| die "Stopped; couldnt open IJM\n";
$IJM=();
tie(%IJM_key, "BerkeleyDB::Hash", -Filename=>"output/IJM_key.hash", -Flags      => DB_CREATE )|| die "Stopped; couldnt open IJM_key\n";
tie(%NAME_CODE, "BerkeleyDB::Hash", -Filename=>"output/name_to_code.hash" , -Flags      => DB_CREATE )|| die "Stopped; couldnt open name code\n";
open(IN, "/Users/davidbaxter/DATA/Interchange/_input/output/flat_dbm_4.txt") || die;
$/="";
while(<IN>){
	chomp;
	($name, $code)=split(/\n/);
	$NAME_CODE{$name}=$code;
}
#These not in ICPN yet

#
foreach(keys(%NAME_CODE)){
print <<EOP;
name: $_
code: $NAME_CODE{$_}

EOP
}
#die;


open(IN, "/JEPS-master/Jepson-eFlora/synonymy/input/smasch_taxon_ids.txt") || die;
local($/)="\n";
while(<IN>){
	chomp;
	  s/&times; */X /;
	($code,$name,@residue)=split(/\t/);
	$TNOAN{$name}=$code;
	$NAN{$code}=$name;
$name=~s/ X / &times;/;
	$TNOAN{$name}=$code;
}

close(IN);

foreach(keys(%TNOAN)){
print "$_\n" if m/acutidens/;
print "$_\n";
}
#die;


@field_list=(
"UNABRIDGED KEY LEAD",
"TAXON AUTHOR",
"COMMON NAME",
"UNABRIDGED COMMON NAME",
"TJM1 AUTHOR",
"TJM2 AUTHOR",
"TJMX AUTHOR",
"TJMXX AUTHOR",
"TJMXXX AUTHOR",
"AUTHORSHIP COMMENT",  #this was out of order in this file compared to sanity.pl and eflora_display.php, added here DEC2016
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
"RAY OR PISTILLATE FLOWER", #this was out of order in this file compared to sanity.pl and eflora_display.php, added here DEC2016
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
"UNABRIDGED FLOWER", #this was present in sanity.pl and eflora_display.php, added here DEC2016
"FLOWER",
"STAMINATE FLOWER",  #this was out of order in this file compared to sanity.pl and eflora_display.php, added here DEC2016
"PISTILLATE FLOWER",  #this was out of order in this file compared to sanity.pl and eflora_display.php, added here DEC2016, "RAY OR PISTILLATE FLOWER",
"RAY FLOWER",
"DISK FLOWER",
"UNABRIDGED DISK FLOWER",
"CONE",
"CONES",
"POLLEN CONE",
"SEED CONE",
"BISEXUAL FLOWER", #"STAMINATE FLOWER", "PISTILLATE FLOWER", "PISTILLATE OR BISEXUAL FLOWER",  this is not even a tag in the current eflora_treatments, DEC2016
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
"ECOLOGY",
"UNABRIDGED ECOLOGY", #Rarity Status used to be below Ecology in eflora_display.php and this file; however 90% of all records in Eflora_treatments had RarityStatus above ecology. #This file and others will be changed to match Eflora_treatments, which was the easiest change to make.  There are 2090+ records out of order otherwise. JAA, Nov 2016
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
"UNABRIDGED SYNONYMS", #"SYNONYM", There is no field for SYNONYM in eflora_treatments, JAA DEC2016
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
"REFERENCE",
"UNABRIDGED REFERENCE",
"HORTICULTURAL INFORMATION",
"UNABRIDGED HORTICULTURAL INFORMATION",
"NOTE",
"NOTES", #"AUTHORSHIP COMMENT",  
"UNABRIDGED NOTE",
"FLOWERING TIME",
"FRUITING TIME",#this was out of order in this file compared to sanity.pl and eflora_display.php, added here DEC2016
"CONING TIME", #"FLOWERING TIMES",this is not even a tag in the current eflora_treatments, DEC2016, #"FRUITING TIME", #"WEEDINESS",
"AUTHORSHIP OF PARTS",
"WEEDINESS",#this was out of order in this file compared to sanity.pl and eflora_display.php, added here DEC2016
"SCIED"
);


%terms=(
"PISTILLATE FLS","<b>Pistillate flowers</b>",
"SPORANGIUM CASE","<b>Sporangium case</b>",
"POLLEN CONES","<b>Pollen cones</b>",
"PISTILLATE INFL","<b>Pistillate inflorescence</b>",
"SPORANGIA","<b>Sporangia</b>",
"CONE","<b>Cone</b>",
"LATERAL SPIKELET","<b>Lateral spikelet</b>",
"STAMINATE SPIKELET","<b>Staminate spikelet</b>",
"ST","<b>Stem</b>",
"INFL","<b>Inflorescence</b>", #"PISTILLATE OR BISEXUAL FL","<b>Pistillate or bisexual flower</b>",
"STAMINATE FLS","<b>Staminate flowers</b>",
"FERTILE SPIKELET","<b>Fertile spikelet</b>",
"PISTILLATE FL","<b>Pistillate flower</b>",
"POLLEN CONE","<b>Pollen cone</b>",
"DISK FLS","<b>Disk flowers</b>",
"RAY FLS","<b>Ray flowers</b>",
"PL BODIES","<b>Plant bodies</b>",
"FL","<b>Flower</b>",
"LF","<b>Leaf</b>",
"SPIKELETS","<b>Spikelets</b>",
"SEEDS","<b>Seeds</b>",
"PISTILLATE INFLS","<b>Pistillate inflorescences</b>",
"FR","<b>Fruit</b>",
"LATERAL SPIKELETS","<b>Lateral spikelets</b>",
"STERILE SPIKELET","<b>Sterile spikelet</b>",
"SESSILE SPIKELET","<b>Sessile spikelet</b>",
"PISTILLATE SPIKELET","<b>Pistillate spikelet</b>",
"STERILE FLS","<b>Sterile flowers</b>",
"DISK FL","<b>Disk flower</b>",
"MALE SPORANGIUM CASE","<b>Male sporangium case</b>",
"SPIKELET","<b>Spikelet</b>",
"SEED","<b>Seed</b>",
"STAMINATE INFLS","<b>Staminate inflorescences</b>",
"SPORANGIUM","<b>Sporangium</b>",
"FLS","<b>Flowers</b>",
"SEED CONE","<b>Seed cone</b>",
"STALKED SPIKELET","<b>Stalked spikelet</b>",
"CENTRAL SPIKELET","<b>Central spikelet</b>",
"PL BODY","<b>Plant body</b>",
"FEMALE SPORANGIUM CASE","<b>Female sporangium case</b>",
"FRS","<b>Fruits</b>",
"BISEXUAL FL","<b>Bisexual flower</b>",
"STAMINATE INFL","<b>Staminate inflorescence</b>",
"FERTILE ST","<b>Fertile stem</b>",
"SPORANGIUM CASES","<b>Sporangium cases</b>",
"LVS","<b>Leaves</b>",
"CONES","<b>Cones</b>",
"STAMINATE FL","<b>Staminate flower</b>",
"SEED CONES","<b>Seed cones</b>",
"STS","<b>Stems</b>",
"PISTILLATE OR RAY FLS","<b>Pistillate or ray flowers</b>",
"RAY OR PISTILLATE FL","<b>Ray or pistillate flower</b>",
"INFLS","<b>Inflorescences</b>",
"SPORES","<b>Spores</b>",
"STERILE ST","<b>Sterile stem</b>",
);




$field_order=1;
grep($field_list{$_}=$field_order++,@field_list);

$pageAuthorLine=qq{<span class="pageAuthorLine">Treatments for public viewing </span><br />};

$file="/JEPS-master/Jepson-eFlora/eflora_database/eflora_treatments.txt";
	undef($/);
	open(IN,$file) || die "couldn't open $file\n";
warn "reading from $file\n";

	$all_lines=<IN>;
	
#converts windows line ends#
	$all_lines=~s/\xEF\xBB\xBF//;
	$all_lines=~s/ *\r\n/\n/g;
	$all_lines=~s/ +/ /g;
	$all_lines=~s/UNABRIDGED REFERENCES/UNABRIDGED REFERENCE/g;
	
	@all_pars=split(/\n\n+/,$all_lines);
	$element=0;
	foreach(@all_pars){
	
#$name_anchor= "999999";
next if m/^#/;
warn "$_\n" if $seen_line{$_}++;
next if m/^Admin/;
next if m/^PROOF:/;
next if m/^CAPTION:/;
next if m/ENCELIA farinosa &times; E. frutescens/;
s/\nPROOF: .*//;
		$nds=$hc="";
		next if m/^[Aa]dmin/;
		@lines=split("\n",$_);
		$last_tag="UNABRIDGED KEY LEAD";
		foreach $sort_line (@lines[3 .. $#lines]){
			s/ +$//;
			($tag=$sort_line)=~s/:.*//;
			$tag=~s/^([A-Z_\+]+) [^A-Z].*/$1/;
			unless($field_list{$tag} > $field_list{$last_tag}){
				unless ($sort_line =~/^\w*[0-9]['.]/ || $last_tag =~/RARITY/){
					print ERR "$file Out of order: $sort_line : $field_list{$tag} tag=$tag last tag=$last_tag\n\n";
				}
			}
			$last_tag=$tag;
		}
		if(m/&mathx[^;]/){
			die "MATHX $_\n";
		}
	#$_=join("\n",@lines[0 .. 3], sort(@lines[3 .. $#lines]));
		s/{\/.*?}//g;
		$nativity="";
		next if m/^[aA]dmin/;
		s/([0-9])-([0-9])/$1&ndash;$2/g;
		s/—/&ndash;/g;
		s/â€™/'/;
		s/’/'/g;
		s/</&lt;/g;
		s//-/g;
###################### KEYS ##########################
if( m/^1\./ || m/^UNABRIDGED KEY/ || m/^Group \d+[A-Z]?[.:]/ || m/^Key to Groups/ || m/^Key to Groups Based Primarily on Flowering Material/|| m/^Key to Groups Based on Fruiting Material/|| m/^Key to Pistillate Plants/|| m/^Key to Staminate Plants/|| m/^Key to Vegetative Plants/ || m/^Group \d+ *\n/){
	$uk="";
	print ERR "$file KEY $&\n\n";
	++$genus;
	@lines=split(/\n/);
	$lines[$#lines]="" if $lines[$#lines]=~/^PROOF:/;
	$indent_level=-1;
	if ($lines[0]=~s/UNABRIDGED KEY/Unabridged key/){
		print "$lines[0]\n";
		$uk=shift(@lines);
		print ERR "UK: $uk\n\n";
		$exclude=1;
	}
	if ($lines[0]=~/Group \d+/ && $lines[1]=~/^[A-Z]/){
		print ERR "KEY $lines[0] $lines[0]\n\n";
		$uk=shift(@lines);
		$uk .= " ";
		$uk .= shift(@lines);
		print ERR "KEY $lines[0] $lines[0]]\n\n";
	}
	if ($lines[0]=~/Key to (Groups|genera|California|pistillate|staminate)/i){
		print ERR "KEY $lines[0]\n\n";
		$uk=shift(@lines);
		print ERR "KEY $lines[0]\n\n";
	}
	if ($lines[0]=~/^Group \d/){
		print ERR "KEY $lines[0]\n\n";
		$uk=shift(@lines);
		print ERR "KEY $lines[0]\n\n";
	}
	if ($lines[0]=~/^SALIX Key/){
		print ERR "KEY $lines[0]\n\n";
		$uk=shift(@lines);
		print ERR "KEY $lines[0]\n\n";
	}
	
	
	foreach(@lines[0 .. $#lines]){
		if(m/--[0-9]+\(--[0-9]/ || m/[0-9]--\)[0-9]+--/){
			s/(--[0-9]+\()--([0-9]+)/$1$2/g;
			s/([0-9]+)--\)([0-9]+--)/$1)$2/g;
		}
		s/([0-9])-([0-9])/$1&ndash;$2/;
		s/---/&mdash;/g;
		s/\.+[-_]*>/--&gt;/g;
		s/-->/--&gt;/g;
		
		########setting the indent level for the line
		#if it starts with a number followed by a period, increase the $indent_level by one and set the $indent
		if(s|^(\d+)([.])|<a href="#$genus${1}'">$1$2</a><a name="$genus$1$2"> </a>|){
			#$indent=$1;
			#$indent-=1;
			$indent_level +=1;
			$indent_level{$1}=$indent_level;
			print nowhere "$1$2\n$indent_level\n\n";
			$indent=$indent_level;
		}
		#if it starts with a number followed by a prime symbol ('), set $indent_level to $indent_level{$1} (i.e. the same as the indent level in the previous block of code
		if(s|^(\d+)(['])|<a href="#$genus${1}.">$1$2</a><a name="$genus$1$2"> </a>|){
			#$indent=$1;
			#$indent-=1;
			$indent_level = $indent_level{$1};
			print nowhere "$1$2\n$indent_level\n\n";
			$indent=$indent_level;
		}
		###NOTE: Leads beginning with "UNABRIDGED KEY LEAD: " are skipped here, and given a default indent level later on
		#############
		
		
		#indent is multiplied by 7 to give the amount of indent	
		$indent*=7;
		if(m!--&gt; *(\d*)([A-Z]). ([a-z-]+) (nothosubsp\.|subsp\.|var\.) ([a-z-]+)!){
			$key_species=$3;
			$key_rank=$4;
			$key_infra=$5;
			$goto_code= $TNOAN{"$key_genus $key_species $key_rank $key_infra"} || "C4";
			#$goto_code=$NAME_CODE{"$key_genus $key_species $key_rank $key_infra"}|| $TNOAN{"$key_genus $key_species $key_rank $key_infra"} || "C4";
			s!--&gt; *(\d*)([A-Z]). ([a-z-]+) (nothosubsp\.|subsp\.|var\.) ([a-z-]+)!<a href="#$goto_code">.....&nbsp;$1 $2. $3 $4 $5</a>!;
			print ERR qq{1 $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
		}
		#1' Ann; lvs narrowly elliptic to ovate or obovate.....-> [P. ruderale var. macrocephalum]
		elsif(m!--&gt; *(\d*)\[([A-Z]). ([a-z-]+) (nothosubsp\.|subsp\.|var\.) ([a-z-]+)\]!){
			$key_species=$3;
			$key_rank=$4;
			$key_infra=$5;
			$goto_code= $TNOAN{"$key_genus $key_species $key_rank $key_infra"} || "C5";
			#$goto_code=$NAME_CODE{"$key_genus $key_species $key_rank $key_infra"}|| $TNOAN{"$key_genus $key_species $key_rank $key_infra"} || "C5";
			s!--&gt; *(\d*)\[([A-Z]). ([a-z-]+) (nothosubsp\.|subsp\.|var\.) ([a-z-]+)\]!<a href="#$goto_code">.....&nbsp;$1 [$2. $3 $4 $5]</a>!;
			print ERR qq{2 $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
		}
		elsif( m!--&gt; *(most )([A-Z]). ([&;a-z-]+)!){
			$key_species=$3;
			#$key_species=~s/&times;/× /;
			$goto_code=$TNOAN{"$key_genus $key_species"} || "C6";
			if($goto_code eq "C6"){
				print qq{3 >$key_genus $key_species< code=$goto_code\n\n};
			}
			#$goto_code=$NAME_CODE{"$key_genus $key_species"} || $TNOAN{"$key_genus $key_species"} || "C6";
			print ERR qq{3 $key_genus $key_species code=$goto_code\n\n};
			s!--&gt; *(most )([A-Z]). ([&;a-z-]+)!<a href="#$goto_code">.....&nbsp;$1 $2. $3</a>!;
		}
		elsif( m!--&gt; *(\d*)([A-Z]). ([&;a-z-]+)!){
			$key_species=$3;
			$goto_code=$TNOAN{"$key_genus $key_species"} || "C6";
			#$goto_code=$NAME_CODE{"$key_genus $key_species"} || $TNOAN{"$key_genus $key_species"} || "C6";
			if($goto_code eq "C6"){
				#print qq{3.1 >$key_genus $key_species< code=$goto_code\n\n};
				#die;
			}
			print ERR qq{3 $key_genus $key_species code=$goto_code\n\n};
			s!--&gt; *(\d*)([A-Z]). ([&;a-z-]+)!<a href="#$goto_code">.....&nbsp;$1 $2. $3</a>!;
		}
		elsif(m!--&gt; *(\d*)([A-Z][A-Z]+)!){
			$key_genus=ucfirst(lc($2));
			$goto_code= $TNOAN{$key_genus} || "C7";
			#$goto_code=$NAME_CODE{$key_genus} || $TNOAN{$key_genus} || "C7";
			print ERR qq{4 $key_genus code=$goto_code\n\n};
			s!--&gt; *(\d*)([A-Z][A-Z]+)!<a href="#$goto_code">.....&nbsp;$1 $2</a>!;
		}
		elsif(m!--&gt; *\[(\d*)([A-Z][A-Z]+).*\]!){
			$key_genus=ucfirst(lc($2));
			$goto_code=$TNOAN{$key_genus} || "C8";
			#$goto_code=$NAME_CODE{$key_genus} || $TNOAN{$key_genus} || "C8";
			print ERR qq{5 $key_genus code=$goto_code\n\n};
			s!--&gt; *\[(\d*)([A-Z][A-Z]+)(.*\])!<a href="#$goto_code">.....&nbsp;[$2$3</a>!;
		}
		elsif(m!--&gt; *(nothosubsp\.|subsp\.|var\.) ([a-z-]+)!){
			$key_rank=$1;
			$key_infra=$2;
			$goto_code= $TNOAN{"$key_genus $key_species $key_rank $key_infra"} || "flabba : $key_genus : $key_species : $key_rank $key_infra";
			#$goto_code=$NAME_CODE{"$key_genus $key_species $key_rank $key_infra"} || $TNOAN{"$key_genus $key_species $key_rank $key_infra"} || "flabba : $key_genus : $key_species : $key_rank $key_infra";
			print ERR qq{6 $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
			s!--&gt; *(nothosubsp\.|subsp\.|var\.) ([a-z-]+)!<a href="#$goto_code">.....&nbsp;$1 $2</a>! ;
		}
		elsif(m!--&gt; *\[(nothosubsp\.|subsp\.|var\.) ([a-z-]+)\]!){
			$key_rank=$1;
			$key_infra=$2;
			$goto_code= $TNOAN{"$key_genus $key_species $key_rank $key_infra"} || "flabba : $key_genus : $key_species : $key_rank $key_infra";
			#$goto_code=$NAME_CODE{"$key_genus $key_species $key_rank $key_infra"} || $TNOAN{"$key_genus $key_species $key_rank $key_infra"} || "flabba : $key_genus : $key_species : $key_rank $key_infra";
			print ERR qq{7 $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
			s!--&gt; *\[(nothosubsp\.|subsp\.|var\.) ([a-z-]+\])!<a href="#$goto_code">.....&nbsp;[$1 $2]</a>! ;
		}
		elsif( m!--&gt; *\[(\d*)([A-Z]). ([&;a-z-]+)\]!){
			$key_species=$3;
			#$key_species=~s/&times;/× /;
			$goto_code= $TNOAN{"$key_genus $key_species"} || "C9";
			#$goto_code=$NAME_CODE{"$key_genus $key_species"} || $TNOAN{"$key_genus $key_species"} || "C9";
			print ERR qq{8 $key_genus $key_species code=$goto_code\n\n};
			s!--&gt; *\[(\d*)([A-Z]). ([&;a-z-]+)\]!<a href="#$goto_code">.....&nbsp;$1 [$2. $3]</a>!;
		}
		elsif( m!--&gt; *\[(\d*)([A-Z]). ([&;a-z-]+);.*\]!){
			$key_species=$3;
			#$key_species=~s/&times;/× /;
			$goto_code= $TNOAN{"$key_genus $key_species"} || "C10";
			#$goto_code=$NAME_CODE{"$key_genus $key_species"} || $TNOAN{"$key_genus $key_species"} || "C10";
			print ERR qq{9 $key_genus $key_species code=$goto_code\n\n};
			s!--&gt; *\[(\d*)([A-Z]). ([&;a-z-]+)(;.*)\]!<a href="#$goto_code">.....&nbsp;$1 [$2. $3$4]</a>!;
		}
		elsif(m!--&gt; *\[(\d*)([A-Z][a-z]+).*\]!){
			$key_genus=ucfirst(lc($2));
			$goto_code=$TNOAN{$key_genus} || "C11a";
			#$goto_code=$NAME_CODE{$key_genus} || $TNOAN{$key_genus} || "C11a";
			print ERR qq{10 $key_genus code=$goto_code\n\n};
			s!--&gt; *\[(\d*)([A-Z][a-z]+)(.*\])!<a href="#$goto_code">.....&nbsp;[$2$3</a>!;
		}
		elsif(m!--&gt; *(\d*)([A-Z][a-z]+) ([^ ]+) *\(.*!){
			$key_genus=ucfirst(lc($2));
			$key_species=$3;
			#$key_species=~s/ *$//;
			$goto_code= $TNOAN{"$key_genus $key_species"} || "C11";
			#$goto_code=$NAME_CODE{"$key_genus $key_species"} || $TNOAN{"$key_genus $key_species"} || "C11";
			print ERR qq{11 $key_genus code=$goto_code\n\n};
			s!--&gt; *(\d*)([A-Z][a-z]+)(.*)(\(.*)!<a href="#$goto_code">.....&nbsp;$2$3</a>$4!;
		}
		elsif(m!--&gt; *(Group) (.*)!){
			#$key_genus=ucfirst(lc($1)) . "$2";
			#$goto_code=$key_genus;
			print ERR qq{12 $key_genus code=$goto_code\n\n};
			s!--&gt; *(\d*)([A-Z][a-z]+) (.*)!<a href="#Group$3">.....&nbsp;$2 $3</a>!;
		}
		elsif(m!--&gt; *(\d*)([A-Z][a-z]+) ([a-z]+) (var\.|subsp\.) ([a-z]+)(.*)!){
			$key_genus=ucfirst(lc($2));
			$target="$2 $3 $4 $5";
			$goto_code= $TNOAN{$target} || "C2a";
			print ERR qq{12a $target code=$goto_code   $_\n\n};
			s!--&gt; *(\d*)([A-Z][a-z]+) ([a-z]+)(.*)!<a href="#$goto_code">.....&nbsp;$2 $3$4</a>!;
		}
		elsif(m!--&gt; *(\d*)([A-Z][a-z]+) ([a-z]+)(.*)!){
			$key_genus=ucfirst(lc($2));
			$target="$2 $3";
			$goto_code= $TNOAN{$target} || "C2b";
			print ERR qq{12b $target code=$goto_code $_\n\n};
			##s!--&gt; *(\d*)([A-Z][a-z]+) (a-z]+)(.*)!<a href="#$goto_code">.....&nbsp;$2 $3$4</a>!;
			#s!--&gt; *(\d*)([A-Z][a-z]+) (a-z]+)(.*)!<a href="#$goto_code">.....&nbsp;$2 $3$4</a>!;
			#print ERR qq{12b $target code=$goto_code $_\n\n};
			s!--&gt; *(\d*)([A-Z][a-z]+ [a-z]+)!<a href="#$goto_code">.....&nbsp;$2</a>!;
			#print ERR qq{12b $target code=$goto_code $_\n\n};

			#12b Elymus multisetus code=24122 <a href="#ALE33.">33'</a><a name="ALE33'"> </a> Per; spikelets 2(3--4) per node --&gt; Elymus multisetus
		}
		elsif(m!--&gt; *(\d*)([A-Z][a-z]+) (.*)!){
			$key_genus=ucfirst(lc($2));
			$goto_code= $TNOAN{$key_genus} || "C2";
			#$goto_code=$NAME_CODE{"$key_genus $3"} || $TNOAN{"$key_genus $3"} || "C2";
			print ERR qq{12 $key_genus code=$goto_code\n\n};
			s!--&gt; *(\d*)([A-Z][a-z]+)(.*)!<a href="#$goto_code">.....&nbsp;$2$3</a>!;
		}

		#13. Pinnae fan-shaped, texture delicate, deep green; outer margins finely toothed or crenate; occurring in or very near saturated substrate .....-> sun forms of B. crenulatum(2), see also lead 9
		#6. Trophophore and sporophore joined well below mid-lf, gen at ground level.....-> small or shade pls of _Botrychium simplex_(2) or _Botrychium pumicola_(2), see lead 3 for separation of taxa
		#<a href="#AO6'">6.</a><a name="AO6."> </a> Trophophore and sporophore joined well below mid-lf, gen at ground level--&gt; small or shade pls of _Botrychium simplex_(2) or _Botrychium pumicola_(2), see lead 3 for separation of taxa
		elsif( m!--&gt;.*_([A-Z].) ([&;a-z-]+)_!){
			$key_species=$2;
			#$key_species=~s/&times;/× /;
			$goto_code= $TNOAN{"$key_genus $key_species"} || "C12";
			#$goto_code=$NAME_CODE{"$key_genus $key_species"} || $TNOAN{"$key_genus $key_species"} || "C12";
			print ERR qq{13 $key_genus $key_species code=$goto_code\n\n};
			s!--&gt; (.*)_([A-Z]). ([&;a-z-]+)_!<a href="#$goto_code">.....&nbsp;$1 $2. $3</a>!;
		}
		#1. Fl radial; calyx, corolla gen inconspicuous; petals free or fused, lobes not overlapped in bud; stamens 5--many, often long-exserted; lf 2-pinnate (simple in alien _Acacia_).....-> Group 1: Mimosoideae
		elsif( m!--&gt; *Group \d+: ([^ ]+)!){
			$goto_code=$1;
			s!--&gt; *(Group \d+: )([A-Z][a-z]+) *(.*)!<a href="#$goto_code">.....&nbsp;$1 $2 $3</a>!;
		}
		elsif( m!--&gt; \[(.*) &times; (.*)!){
			s!--&gt; *(.*)! .....&nbsp;$1!;
		}
		elsif( m!--&gt; .*see .*lead \d!){
			s!--&gt; *(.*)! .....&nbsp;$1!;
		}
		elsif( m!--&gt; .*see _[A-Z]!){
			s!--&gt; *(.*)! .....&nbsp;$1!;
		}
		else{
			print ERR "$_ C4\n\n" if m/--&gt;/;
		}
		
		if(m/--[0-9]+\(--[0-9]/ || m/[0-9]--\)[0-9]+--/){
			s/(--[0-9]+\()--([0-9]+)/$1$2/g;
			s/([0-9]+)--\)([0-9]+--)/$1)$2/g;
		}
		s/--([^&])/&ndash;$1/g;
		s|\+/-|&plusmn;|g;
		s|\+-|&plusmn;|g;
		s/ > or =/ &ge;/g;
		
		########Substitute in the correct indent and styling (based on $indent, or if UNABRIDGED KEY LEAD
		if($exclude){
			s!^!\n<P class="keyText" style="padding-left : $indent ; color:blue">!;
		}
		elsif(m/UNABRIDGED KEY LEAD/){
			#s!^!\n<P class="keyText" style="padding-left : $indent ; color:blue">!;
		}
		else{
			s!^!\n<P class="keyText" style="padding-left : $indent ;">!;
		}
		#######
		
		#s!^!\n<br>$indent!;
		s/([A-Za-z])_([A-Za-z])/$1&95;$2/g;
		while(s/_/<I>/){
			s/_/<\/I>/;
		}
		s/&95;/_/g;
		s/\.\.\.\.\.&nbsp; +/.....&nbsp;/;
	}
	$_=join("\n",@lines);


	#substitute out the "UNABRIDGED KEY LEAD: " prefix and make the text blue 
	s/UNABRIDGED KEY LEAD: (.*)/<font color=\"blue\">$1<\/font>/g;
	if(s/UNABRIDGED KEY/<br>Unabridged key/g){
		#s/$/<\/font>/gm;
		#$exclude=1;
	}
	s/UNABRIDGED\n//;
	s/  +/ /g;
	#print OUT "flabba1<blockquote>$_<\/blockquote>\n";
	if($exclude==1){
		print ERR "KEY: $name_anchor\n\n";
		$IJM_key{$name_anchor} = "<font color=\"blue\"><blockquote>$_<\/blockquote></font>";
	}
	else{
		foreach($uk){
			while(s/_/<I>/){
				s/_/<\/I>/;
			}
			s/---/&mdash;/g;
			s/--/&ndash;/g;
			s|\+-|&plusmn;|g;
			s/Group (\d+[A-Z]?)/<a name=Group$1>Group $1<\/a>/;
		}
		print ERR "KEY: $name_anchor\n\n";
		$IJM_key{$name_anchor}.= "<blockquote><h3>$uk</h3>$_<\/blockquote>";
	}
	next;
}
######################################################
######################################################
		$exclude=0;
		#if(m/^UNABRIDGED/){$exclude=1;};
		if(s/UNABRIDGED\nURBAN WEED EXPECTED IN WILDLANDS//){
			$nativity=qq{URBAN WEED (expected in wildlands)};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\n(AGRICULTURAL, GARDEN, OR URBAN WEED)//){
			$nativity=qq{$1};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\nSPONTANEOUS HYBRID//){
			$nativity=qq{SPONTANEOUS HYBRID};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\nGARDEN WEED//){
			$nativity=qq{GARDEN WEED};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\nGARDEN AND URBAN WEED//){
			$nativity=qq{GARDEN AND URBAN WEED};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\nURBAN WEED//){
			$nativity=qq{URBAN WEED};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\s+WAIF//){
			$nativity=qq{WAIF};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\nPOSSIBLY IN CA//){
			$nativity=qq{POSSIBLY IN CA};
		$exclude=1;
		}
		elsif(s/^UNABRIDGED\nHISTORICAL WAIF//){
			$nativity=qq{HISTORICAL WAIF};
		$exclude=1;
		}
		elsif(s/^WAIF//){
			$nativity=qq{WAIF};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\n(CULTIVATED PLANT|AGRICULTURAL WEED)//){
			$nativity=qq{$1};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\nEXTIRPATED (WAIF|ALIEN)//){
			$nativity=qq{$1 (EXTIRPATED)};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\nNATURALIZED\nEXTIRPATED//){
			$nativity=qq{NATURALIZED (EXTIRPATED)};
		$exclude=1;
		}
		elsif(s/NATIVE OR NATURALIZED//){
			$nativity=qq{NATIVE OR NATURALIZED};
		}
		elsif(s/NATURALIZED//){
			$nativity=qq{NATURALIZED};
		}
		elsif(s/NATIVE\nEXTIRPATED//){
			$nativity=qq{NATIVE (EXTIRPATED)};
		}
		elsif(s/NATIVE//){
			$nativity=qq{NATIVE};
		}
		elsif(s/^UNABRIDGED *\n//){$exclude=1;};
		$nativity=qq{<font size="1"><b>$nativity</b></font>} if $nativity;
if(m/TJMX AUTHOR/i){
		s|(TJM2 AUTHOR:.*\n)||i; #TJMX AUTHOR line has priority over TJM2 AUTHOR
}

if(m/TJMXX AUTHOR/i){
		s|(TJM2 AUTHOR:.*\n)||i; #TJMXX AUTHOR line has priority over both TJM2 AUTHOR and TJMX AUTHOR
		s|(TJMX AUTHOR:.*\n)||i;
}

if(m/TJMXXX AUTHOR/i){ #this was not added to this file when the XXX authors were added by David to sanity.pl and eFlora_display.php, DEC2016
		s|(TJM2 AUTHOR:.*\n)||i; #TJM4X AUTHOR line has priority over both TJM2 AUTHOR and TJMX and TJMXX AUTHOR
		s|(TJMX AUTHOR:.*\n)||i;
		s|(TJMXX AUTHOR:.*\n)||i;
}

if(m/TJM4X AUTHOR/i){ #this was not added to this file when the XXX authors were added by David to sanity.pl and eFlora_display.php, DEC2016
		s|(TJM2 AUTHOR:.*\n)||i; #TJM4X AUTHOR line has priority over both TJM2 AUTHOR and TJMX and TJMXX AUTHOR
		s|(TJMX AUTHOR:.*\n)||i;
		s|(TJMXX AUTHOR:.*\n)||i;
		s|(TJMXXX AUTHOR:.*\n)||i;
}
		s/TJM(4X|2|X+) AUTHOR:(.*)/<h4>$2<\/h4>/i; # "TJM2 AUTHOR", "TJMX AUTHOR" or "TJMXX AUTHOR" "TJM4X AUTHOR"
		s|(TJM1 AUTHOR:.*)||i;
		s|(TJM\(1993\) AUTHOR:.*)||i;
		s|^FAMILY: *||;
		s|SCIED: *|&mdash;|;
		s|UNABRIDGED COMMON NAME: (.*)|<font size="3" color="blue">\U$1\E</font>|;
		s|COMMON NAME: (.*) (\(Group.*\))|<font size="3">\U$1\E $2</font>| or
		s|COMMON NAME: (.*)|<font size="3">\U$1\E</font>|;
		s|(<font size="3">.*) OR |$1 or |;
		
s/FR&EACUTE/FR&Eacute/;
		if(s|^([A-Z]+ACEAE) \(([A-Z][a-z]+)\)$|<center><font size="4"><b>$1 ($2)</b></font>|ms){
			$key_genus=$1;
			$key_genus=ucfirst(lc($key_genus));

			if($TNOAN{$key_genus}){
				#s/<center>/<a name="$TNOAN{$key_genus}"> <\/a>\n\n<center>/;
				$name_anchor=  $TNOAN{$key_genus};
#print "2\n" if $name_anchor==76377;
				if($key_genus=~/aceae\b/){
					$last_family=$name_anchor;
$last_genus="";
				}
				else{
					$last_genus=$name_anchor;
#$last_species="";
				}
			}
			
			else {print ERR "$key_genus not found in lists\n\n";}
		}
		if(s|^([A-Z]+)$|<center><font size="4"><b>$1</b></font>|ms){
			$key_genus=$1;
			$key_genus=ucfirst(lc($key_genus));


			if($TNOAN{$key_genus}){
				#s/<center>/<a name="$TNOAN{$key_genus}"> <\/a>\n\n<center>/;
				$name_anchor=   $TNOAN{$key_genus};
#print "4\n" if $name_anchor==76377;
				if($key_genus=~/aceae\b/){
					$last_family=$name_anchor;
$last_genus="";
				}
				else{
					$last_genus=$name_anchor;
#$last_species="";
				}
			}
			
			else {print ERR "$key_genus not found in lists\n\n";}
		}

		s|^([A-Z]+ +\[[A-Z][a-z]+\])$|<center><font size="4"><b>$1</b></font>|ms;
		s|UNABRIDGED HABIT\+: *(.*)|<font color="blue">$1</font>|;
		s|UNABRIDGED ECOLOGY: *(.*)|<font color="blue">$1</font>|;
		s|HABIT\+: *|<br>$nativity</center><blockquote>| && s/$/\n$unabridged_lines<\/blockquote>/;
		s/FLOWERING TIMES?: of sp./Flowering times of sp./;
		s/FLOWERING TIMES?: *//;
		s/FRUITING TIMES?: *//;
		s/CONING TIMES?: *//;
		s!^((STAMINATE|PISTILLATE|BISEXUAL|RAY|DISK) ?FLOWER(S?:?))!"<br><b>" . ucfirst(lc($1)) .  "</b> "!msge;
		s!^(RAY OR PISTILLATE FLOWER(S?:?))!"<br><b>" . ucfirst(lc($1)) .  "</b> "!msge;
		s!^(SPIKELET):? +!<br><b>Spikelet:</b> !msg;
		s!^((CENTRAL|LATERAL|DISTAL|FERTILE|STERILE|STAMINATE|PISTILLATE) SPIKELET):? +!"<br><b>" . ucfirst(lc($1)) .  ":</b> "!msge;
		s!^((STAMINATE|PISTILLATE) HEAD):? +!"<br><b>" . ucfirst(lc($1)) .  "</b> "!msge;
		s|^STEMS?: *|<br><b>Stem:</b> |m;
		s|^STEMS? +|<br><b>Stem:</b> |m;
		s|^FERTILE STEM(S?:?) *|<br><b>Fertile stem:</b> |m;
		s|^STERILE STEM(S?:?) *|<br><b>Sterile stem:</b> |m;
		s|^PLANT BODY: *|<br><b>Plant body:</b> |m;
		s|^PLANT BODIES: *|<br><b>Plant body:</b> |m;
		s|^CONE(S?:?) *|<br><b>Cone:</b> |m;
		s|^SEED CONE(S?:?) *|<br><b>Seed cone:</b> |m;
		s|^FROND(S?:?)* |<br><b>Frond:</b> |m;
		s|^MALE SPORANGIUM CASES?:? |<br><b>Male sporangium case:</b> |m;
		s|^FEMALE SPORANGIUM CASES?:? |<br><b>Female sporangium case:</b> |m;
		s|^SPORANGIUM CASES:? |<br><b>Sporangium cases:</b> |m;
		s|^SPORANGIUM CASE:? |<br><b>Sporangium case:</b> |m;
		s|^SPORANGIA:? |<br><b>Sporangia:</b> |m;
		s|^SPORANGIUM:? |<br><b>Sporangium:</b> |m;
		s|^SPORES:? |<br><b>Spores:</b> |m;
		s|^POLLEN CONE(S?:?) *|<br><b>Pollen cone:</b> |m;
		s|^SEED(S?:?) *|<br><b>Seed:</b> |m;
		s|^LEAVES:?|<br><b>Leaf:</b> |m;
		s|^LEAF:?|<br><b>Leaf:</b> |m;
		s|^SPINES:?|<br><b>Spines:</b> |m;
		s|^SPINE:?|<br><b>Spine:</b> |m;
		s|^FLOWER:?|<br><b>Flower:</b> |m;
		s|^INFLORESCENCE:?|<br><b>Inflorescence:</b> |m;
		s!((PISTILLATE OR BISEXUAL) INFLORESCENCES?:?)!"<br><b>" . ucfirst(lc($1)) .  "</b> "!msge;
		s!((STAMINATE|PISTILLATE) ?INFLORESCENCE(S?:?))!"<br><b>" . ucfirst(lc($1)) .  "</b> "!msge;
		s|^FRUIT(S?:?)|<br><b>Fruit:</b> |m;
		s/UNABRIDGED GENERA IN FAMILY: *(.*)/<br><font color="blue">Unabridged genera in family: $1<\/font><br>/;

		s/GENERA IN FAMILY: /<br> /;

		s/UNABRIDGED CHROMOSOMES: *(.*)/<br><font color="blue">Unabridged chromosomes: $1<\/font><br>/;
		s/(CHROMOSOMES|ECOLOGY)/<br>$1/;
		s/(CHROMOSOMES: .*)([xn]) ?= ?/$1<i>$2<\/i>=/;
		s/CHROMOSOMES: //;
		s|^([A-Z]+)$|<center><font size="3"><b>$1</b></font>|ms;
		s/UNABRIDGED SPECIES IN GENUS: *\[(.*)\]/<br><font color="blue">Unabridged species in genus: [$1]<\/font><br>/;
		s/UNABRIDGED SPECIES IN GENUS: *(.*)/<br><font color="blue">Unabridged species in genus: [$1]<\/font><br>/;
		s/UNABRIDGED (DISK|PISTILLATE) FLOWER: *(.*)/<br><font color="blue">Unabridged \L$1 fl: $2<\/font><br>/;

		s/SPECIES IN GENUS: /<br> /;

		s/UNABRIDGED REFERENCE[()S]*?: *\[(.*)\]/<br><font color="blue">Unabridged references: [$1]<\/font><br>/;
		s/UNABRIDGED REFERENCE[()S]*?: *(.*)/<br><font color="blue">Unabridged references: [$1]<\/font><br>/;
		s/REFERENCE[S()]*: \[(.*)\]/[$1]/;
		s/REFERENCE[S()]*: (.*)/[$1]/;
		while(s/UNABRIDGED NOTE[()S]*:(.*)/<br><font color="blue">Unabridged note: $1<\/font><br>/){

	 @accessions=m!((?:UCR|UCD|JEPS|UC|CHSC|RSA|POM|SD|CAS-BOT-BC|SJSU|HSC|PGM|SBBG|UCSB|UCSC|CDA|IRVC)\d+)!g;
grep(s/^/&dup=/,@accessions);
if(@accessions){
$accessions[0]=~s/&//;
	 $URL=qq{<a href="/cgi-bin/get_consort.pl?} . join("",@accessions) ."\"";

	 s/(The following .*if verified,)/$URL>$1<\/a>/;
}
	 }
		if(m/UNABRIDGED SYNONYMS?: *(.+)/){
			$syns=&format_syns($1);
			s/(UNABRIDGED SYNONYMS?:).*/<font color="blue">Unabridged synonyms: [$syns]<\/font><br>/;
		}
		if(m/^MISAPPLIED NAMES?: *(.+)/m){
			$syns=&format_syns($1);
			s/^(MISAPPLIED NAMES?:).*/$1 [$syns]/m;
		}
		if(m/UNABRIDGED MISAPPLIED NAMES?: *(.+)/){
			$syns=&format_syns($1);
			s/(UNABRIDGED MISAPPLIED NAMES?:).*/<br><font color="blue">Unabridged misapplied names: [$syns]<\/font>/;
		}
		s/UNABRIDGED ETYMOLOGY[()S]*?:(.*)/<br><font color="blue">Unabridged etymology: $1<\/font><br>/;
		s|ETYMOLOGY:||;
		s/HORTICULTURAL INFORMATION: ...*/{hort link}/;
############GET infra name for links
		if(m/^([A-Z][A-Z]+) +([a-z-]+).*(var\.|nothosubsp\.|subsp\.) ([a-z-]+) *\n/m){
#SAGITTARIA montevidensis Cham. & Schltdl. subsp. calycina
$key_species=$2;
			$name_link=ucfirst(lc("$1 $2 $3 $4"));
			$name_link=~s/ x / X /;
#print "1 NL $name_link\n";
$name_for_hc=$name_link;
				($consort_link=$name_link)=~s/ /%20/g;
s!(if verified,) !<a href="/cgi-bin/get_consort.pl?taxon_name=$consort_link">$1</a> !;


			if($TNOAN{$name_link}){
$name_anchor=  $TNOAN{$name_link};
#print "6\n" if $name_anchor==76377;
unless($name_link=~/\b(subsp\.|var\.|f\.)\b/){$last_species=$name_anchor;}
$name_link= <<EOP;
<a href="/cgi-bin/get_cpn.pl?$TNOAN{$name_link}">[Online Interchange]</a>
EOP

				print ERR "1. NO $name_link: >$TNOAN{$name_link}<\n\n";
			}
			else{
				print ERR "2. NO $name_link\n\n";
$name_link= "flabba0";
			}
#print "$name_link\n";
		}
############GET hybrid name for links
		elsif(m|^([A-Z][A-Z]+) +(&times;[a-z-]+) *\n|m){
			$trinomial="$1 $2";
$trinomial=~s/&times;/X /;
#print "flabba $trinomial\n";
			$epithet=$2;
			$name_link=ucfirst(lc($trinomial));
			$name_link=~s/ x / X /;
#print "2 NL $name_link\n";
$name_for_hc=$name_link;
			if($TNOAN{$name_link}){
		$name_anchor=   $TNOAN{$name_link};
unless($name_link=~/\b(subsp\.|var\.|f\.)\b/){$last_species=$name_anchor;}
				($consort_link=$name_link)=~s/ /%20/g;
				s!(if verified,) !<a href="/cgi-bin/get_consort.pl?taxon_name=$consort_link">$1</a> !;
				$name_link= <<EOP;
<a href="/cgi-bin/get_cpn.pl?$TNOAN{$name_link}">[Online Interchange]</a>
EOP
			}
			elsif($NAME_CODE{$name_link}){
		$name_anchor=   $NAME_CODE{$name_link};
unless($name_link=~/\b(subsp\.|var\.|f\.)\b/){$last_species=$name_anchor;}
				($consort_link=$name_link)=~s/ /%20/g;
				s!(if verified,) !<a href="/cgi-bin/get_consort.pl?taxon_name=$consort_link">$1</a> !;
				$name_link= <<EOP;
<a href="/cgi-bin/get_cpn.pl?$NAME_CODE{$name_link}">[Online Interchange]</a>
EOP
			}
else{
if($name_link=~/Quercus x/i){
warn "$name_link\n";
}
}
}
############GET name for links
		elsif(m|^([A-Z][A-Z]+) +([a-z-]+) *\n|m){
			$trinomial="$1 $2";
$key_species=$2;
#print "flabba $trinomial\n";
			$epithet=$2;
			$name_link=ucfirst(lc($trinomial));
			$name_link=~s/ x / X /;
#print "2 NL $name_link\n";
$name_for_hc=$name_link;
		if($TNOAN{$name_link}){
			$name_anchor=   $TNOAN{$name_link};
#print "8\n" if $name_anchor==76377;
unless($name_link=~/\b(subsp\.|var\.|f\.)\b/){$last_species=$name_anchor;}

				$name_link= <<EOP;
<a href="/cgi-bin/get_cpn.pl?$TNOAN{$name_link}">[Online Interchange]</a>
EOP
#print "3 NA $name_anchor\n";
			}
			elsif($NAME_CODE{$name_link}){
		$name_anchor=   $NAME_CODE{$name_link};
#print "NAME CODE USED >$name_link< <$name_anchor> <$name_for_hc>\n";
unless($name_link=~/\b(subsp\.|var\.|f\.)\b/){$last_species=$name_anchor;}

#print "3 NA $name_anchor\n";
				($consort_link=$name_link)=~s/ /%20/g;
				s!(if verified,) !<a href="/cgi-bin/get_consort.pl?taxon_name=$consort_link">$1</a> !;
				$name_link= <<EOP;
<a href="/cgi-bin/get_cpn.pl?$NAME_CODE{$name_link}">[Online Interchange]</a>
EOP
			}
			else{
				print ERR "1. NO TNOAN ${name_link}<\n\n";
die "Missing name in TNOAN: $name_link. Terminating load\n";
$name_link= "flabba2";
			}

		}
else{#print ">>>$_\n";
}
if(m/$trinomial .* $epithet/ && $trinomial && $epithet){
s/\n(TAXON AUTHOR.*)//;
#print "BEGIN: >$trinomial< >$epithet< $1\n$_\n";
}
		if(s|^(([A-Z])[A-Z]+) (([a-z-]+).*)|<center><font size="4"><b>$2. $3</b></font>|m ||
		s|^(([A-Z])[A-Z]+) ((&times;[a-z-]+).*)|<center><font size="4"><b>$2. $3</b></font>|m){

			if(m!^<center><font size="4"><b>([A-Z].) ([^ ]+) (nothosubsp\.|subsp\.|var\.|f\.) \2!m){
#print "1: $&\n";
			#if(m!^([A-Z]+) ([^ ]+) (subsp\.|var\.|f\.) \2!m){
				if(s!\nTAXON AUTHOR: *(.*)!!){
					$taxaut=$1;
					s!([A-Z]\.) ([^ ]+) (nothosubsp\.|subsp\.|var\.|f\.) \2!$1 $2</b> $taxaut $3 <b>$2!;
#print "flabba0";
				}
else{
#print "$_\n";
					s!([A-Z]\.) ([^ ]+) (nothosubsp\.|subsp\.|var\.|f\.) \2!$1 $2</b> $3 <b>$2!;
#print "$_\n";
}
#print "flabba1";
			}
			else{
#print "flabba2 $_";
s!(<center><font size="4"><b>[A-Z]\. [a-z-]+)(.*(nothosubsp\.|subsp\.|var\.|f\.)) (.*)</b>!$1</b>$2 <b>$4</b>! ||
			s!(<center.*) (nothosubsp\.|subsp\.|var\.|f\.) ([^ ]+)!$1</b> $2 <b>$3!;
#print "2: $&\n";
			}
		}
		s!\nTAXON AUTHOR: *(.*)! <font size="4">$1</font>!;
		s/ECOLOGY: *\n/ /;
		s/ECOLOGY: of sp./Ecology of sp./;
		s/ECOLOGY: / /;
		if(s/RARITY STATUS: (SYMBOL \d).?//){
			($cnps_name=$name_for_hc)=~s/subsp\./ssp./;
			if($CNPS_URL{$cnps_name}){
				$rarity="<a href=\"$CNPS_URL{$cnps_name}\">{CNPS list}</a>";
			}
			else{
				print warn_cnps "no URL for $cnps_name\n";
				$rarity="{CNPS listed}";
			}
		}
		else{
			$rarity="";
		}
		s/ELEVATION: *of sp./Elevation of sp./;
		s/ELEVATION: *//;
	if (m/^BIOREGIONAL DISTRIBUTION: (.*)/m){
		$nds=$1;
		$nds=~s/[.; ]*$//;
		$hc=&get_hcode($nds);
		die "$nds: $hc return hcode problem\n" unless length($hc)==10;

if($hc){
#print "$hc\t";
	if($name_for_hc){
		$name_for_hc=~s/ . / X /;
#print "$name_for_hc\t";
		if($NAME_CODE{$name_for_hc}){
			#print "$NAME_CODE{$name_for_hc}";
			$new_hc{$NAME_CODE{$name_for_hc}}=$hc;
		}
	else{
		print ERR <<EOP;
HC=$hc
name_link=$name_for_hc
NAME_CODE= $NAME_CODE{$name_for_hc}  NO NAME CODE FOR $name_for_hc

EOP
		}
	}
	else{
		print ERR <<EOP;
HC=$hc
name_link=$name_for_hc NO NAME FOR HC
NAME_CODE= $NAME_CODE{$name_for_hc}

EOP
	}
}
else{
print ERR <<EOP;
HC=$hc NO HC
name_link=$name_for_hc
NAME_CODE= $NAME_CODE{$name_for_hc}

EOP
}
#print "\n";
}
else{
($ceae)=m/(.*ACEAE)/;
print ERR "$ceae $name_for_hc  NO Bioregional distribution line\n\n";
#print "$_";
		if(m|^([A-Z][A-Z]+) +([a-z-]+) *\n|m){
			#$trinomial="$1 $2";
}
}

		s/UNABRIDGED BIOREGIONAL DISTRIBUTION:(.*)/<br><font color="blue">Unabridged bioregional distribution: $1<\/font><br>/;
		s/BIOREGIONAL DISTRIBUTION: of sp./Distribution in CA of sp./;
		s/BIOREGIONAL DISTRIBUTION: (.*)/$1/;
		s/UNABRIDGED DISTRIBUTION OUTSIDE CALIFORNIA:(.*)/<br><font color="blue">Unabridged distribution outside California: $1<\/font><br>/;
		s/DISTRIBUTION OUTSIDE CALIFORNIA: of sp./Distribution outside CA of sp./;
		s/DISTRIBUTION OUTSIDE CALIFORNIA:(.*)/$1/;
		s/^NOTE[()S]*: (.*)/$1/em;
		s/AUTHORSHIP OF PARTS: /<P>/;
		s/AUTHORSHIP COMMENT: /<P>/;
		s//-/g;
		s|\+/-|&plusmn;|g;
		s|\+-|&plusmn;|g;
		s/---/&mdash;/g;
			if(m/--[0-9]+\(--[0-9]/ || m/[0-9]--\)[0-9]+--/){
				s/(--[0-9]+\()--([0-9]+)/$1$2/g;
				s/([0-9]+)--\)([0-9]+--)/$1)$2/g;
			}
		s/--/&ndash;/g;
		s/&mathx;/&#215;/g;
		s/&times;/&#215;/g;
		s/([0-9])-([0-9])/$1&ndash;$2/;
s/Madrono/Madro&ntilde;o/g;
s/\xf6/&ouml;/g;
s/Ú/&eacute;/g;
s/Ž/&eacute;/g;
s/([A-Za-z])_([A-Za-z])/$1&95;$2/g;
		while(s/_/<I>/){
			s/_/<\/I>/;
		}
 s/&95;/_/g;
		if(m/^SYNONYMS?: *(.+)/m){
			$syns=&format_syns($1);
			s/^SYNONYMS?:.*/[$syns]/m;
		}
$_=&il_to_html($_);
#kluge that became necessary when file was read in as unit
		s/<\/blockquote>\]/]<\/blockquote>/;
		#s/<\/blockquote>\]/]flabba3<\/blockquote>/;
s/  +/ /g;
		s/TOXICITY: //;
if(m/NATURALIZED|NATIVE|WAIF/){
#warn "$name_anchor name_link is $name_link\n";
unless ($name_link=~/(×|&times;)/){
s/<\/blockquote>/$name_link<\/blockquote>/ if $name_link=~/cgi-bin/;
#s/^/$name_anchor/;
#$name_anchor="";
}
}
s/<br>\n<br>/\n<br>/g;
#s!There are Consortium records!<a href="/cgi-bin/get_consort.pl?taxon_name=$consort_link">$&</a>!;
#print "NAME ANCHOR: $name_anchor $NAN{$name_anchor}\n";
$sequence_string="$last_family, $last_genus";
$nan=$NAN{$name_anchor};
print "$nan => $sequence_string \n";
if($nan=~m/(.*) (subsp\.|var\.|f\.).*/){
	$nan_species=$TNOAN{$1};
	if($IJM{$nan_species}){
		$sequence_string .= ", $nan_species, $name_anchor";
print "$nan => $sequence_string \n";
	}
	else{
		$sequence_string .= ", $name_anchor";
print "$nan => $sequence_string \n";
		#push(@name_sequence,$name_anchor);
	}
}
else{
		$sequence_string .= ", $name_anchor";
print "$nan => $sequence_string \n";
}
push(@name_sequence,$sequence_string);
s/<\/blockquote/$rarity<\/blockquote/;
		if($exclude){
$IJM{$name_anchor}= "<font color=\"blue\">$_</font>\n<P>";
		}
		else{
if((@blue)=m!([<>br]*<font color="blue">Unabridged.*)!g){
s!([<>br]*<font color="blue">Unabridged.*\n)!!g;
grep(s/^<font/<br><font/,@blue);
grep(s/<br>$//,@blue);
s/<\/blockquote/@blue<\/blockquote/;
}
$IJM{$name_anchor}= "$_\n<P>";
		}
++$element;
	}
#}
open(OUT, ">IJM_sequence.txt");
foreach(@name_sequence){
	@elements=split(/, /,$_);
	%seen=();
	foreach(@elements){
		next unless /\d/;
		next if $seen{$_}++;
		print OUT "$_, ";
	}
	print OUT "\n";
}

open(OUT, ">IJM_sequence_names.txt");
foreach(@name_sequence){
	@elements=split(/, /,$_);
	%seen=();
	foreach(@elements){
		print OUT "$NAN{$name_anchor} => ";
		next unless /\d/;
		next if $seen{$_}++;
		print OUT "$_, ";
	}
	print OUT "\n";
}


untie(%IJM);
untie(%IJM_key);

print <<EOP;
Provide a brief precis of the changes.
Default, if you provide nothing, will be "Minor corrections"
EOP
$/="\n";
$precis=<>;
$precis="Minor corrections" unless $precis=~/../;
$date=localtime();
open(HISTORY, ">>IJM_update_history.html") || die;
print HISTORY <<EOP;
<br>$date: $precis
EOP
close(HISTORY);
print <<EOP;
Now I'll try to make a list of species for each genus
using the index.
EOP
system "perl make_genus_lists.pl";


sub format_syns {
	local($syns)=shift;
	#print "$syns\n";
	$syns=~s/ &#215; / X_/g;
	#print "$syns\n";
	@syns=split(/; +/,$syns);
	foreach(@syns){
		s/ *$//;
		s/<\/?b>//g;
		s/^([^ ]+ X +)/<i>$1<\/i>/;
		s/^([^ ]+ [^ ]+)/<i>$1<\/i>/;
		s/subsp. ([^ ]+)/subsp. <i>$1<\/i>/;
		s/var. ([^ ]+)/var. <i>$1<\/i>/;
		s/ f\. ex /filius ex /;
		s/ f\. ([^ ]+)/ f. <i>$1<\/i>/;
#		s/f\._ex /f. ex /;
	}
	$syns=join("; ", @syns);
	$syns=~s/^\[//;
	$syns=~s/\]//;
	#print "$syns\n";
	$syns=~s/ X_/ &#215;/g;
	#print "$syns\n";
	$syns;
}
sub dist_expand{
local($_)=@_;
s/\bAR\b/Arkansas/g;
s/\bTN\b/Tennessee/g;
s/\bNB\b/New Brunswick/g;
s/\bNC\b/North Carolina/g;
s/\bMO\b/Missouri/g;
s/\bHI\b/Hawaii/g;
s/\bFL\b/Florida/g;
s/\bPE\b/Prince Edward Island/g;
s/\bQC\b/Quebec/g;
s/\bS.Africa\b/South Africa/g;
s/\bWY\b/Wyoming/g;
s/\bMI\b/Michigan/g;
s/\bMA\b/Massachusetts/g;
s/\bIN\b/Indiana/g;
s/\bIL\b/Illinois/g;
s/\bNJ\b/New Jersey/g;
s/\bMN\b/Minnesota/g;
s/\bMS\b/Mississippi/g;
s/\bNY\b/New York/g;
s/\bSK\b/Saskatchewan/g;
s/\bMB\b/Manitoba/g;
s/\bNL\b/Newfoundland/g;
s/\bAB\b/Alberta/g;
s/\bYT\b/Yukon/;
s/\bNS\b/Nova Scotia/;
s/\bON\b/Ontario/;
s/\bVA\b/Virginia/;
s/\bNE\b/Nebraska/;
s/subtrop\./subtropics./;
s/C\.Am/Central America/;
s/\bWA\b/Washington/g;
s/\bw-+c/west-central/g;
s/\bUT\b/Utah/g;
s/\bTX\b/Texas/g;
s/\btemp\b/temperate/g;
s/\bSD\b/South Dakota/g;
s/\bND\b/North Dakota/g;
s/\bs-+c/south-central/g;
s/\bLA\b/Louisiana/g;
s/\bOR\b/Oregon/g;
s/\bOK\b/Oklahoma/g;
s/\bNV\b/Nevada/g;
s/\bPA\b/Pennsylvania/g;
s/\bNM\b/New Mexico/g;
s/\bn-+c/north-central/g;
s/\bMT\b/Montana/g;
s/\bID\b/Idaho/g;
s/\bOH\b/Ohio/g;
s/\bSC\b/South Carolina/g;
s/\bKS\b/Kansas/g;
s/\be-+c/east-central/g;
s/\bCan\b/Canada/g;
s/\bEur\b/Europe/g;
s/\bN\.Am\b/North America/g;
s/\bS\.Am\b/South America/g;
s/\bBC\b/British Columbia/g;
s/Rocky Mtns/Rocky Mountains/;
s/\bBaja CA\b/Baja California/g;
s/\bAZ\b/Arizona/g;
s/\bCO\b/Colorado/g;
s/\bAK\b/Alaska/g;
s/Mex\b/Mexico/g;
s/Medit\b/Mediterranean/g;
s/CA-FP/California Floristic Province/g;
s/\bNCo\b/North Coast/g;
s/\bNCoR\b/North Coast Ranges/g;
s/\bNCoRO\b/Outer North Coast Ranges/g;
s/\bNCoRI\b/Inner North Coast Ranges/g;
s/\bNCoRH\b/High North Coast Ranges/g;
s/\bCaR\b/Cascade Range/g;
s/\bCaRF\b/Cascade Range Foothills/g;
s/\bCaRH\b/High Cascade Range/g;
s/\bSN\b/Sierra Nevada/g;
s/\bSNE\b/East of Sierra Nevada/g;
s/\bSNF\b/Sierra Nevada Foothills/g;
s/\bSNH\b/High Sierra Nevada/g;
s/\bTeh\b/Tehachapi Mountain Area/g;
s/\bGV\b/Great Central Valley/g;
s/\bScV\b/Sacramento Valley/g;
s/\bSnJV\b/San Joaquin Valley/g;
s/\bSnGb\b/San Gabriel Mountains/g;
s/\bSW\b/Southwestern California/g;
s/\bSCo\b/South Coast/g;
s/\bChI\b/Channel Islands/g;
s/\bPR\b/Peninsular Ranges/g;
s/\bWTR\b/Western Transverse Ranges/g;
s/\bTR\b/Transverse Ranges/g;
s/\bSnJt\b/San Jacinto Mountains/g;
s/\bSCoR\b/South Coast Ranges/g;
s/\bSCoRO\b/Outer South Coast Ranges/g;
s/\bSCoRI\b/Inner South Coast Ranges/g;
s/\bCW\b/Central Western California/g;
s/\bSCoR\b/South Coast Ranges/g;
s/\bCCo\b/Central Coast/g;
s/\bSnFrB\b/San Francisco Bay Area/g;
s/\bNW\b/Northwestern California/g;
s/\bKR\b/Klamath Ranges/g;
s/\bGB\b/Great Basin Floristic Province/g;
s/\bWrn\b/Warner Mountains/g;
s/\bMP\b/Modoc Plateau/g;
s/\bW&I\b/White and Inyo Mountains/g;
s/\bD\b/Desert/g;
s/\bDMoj\b/Mojave Desert/g;
s/\bDMtns\b/Desert Mountains/g;
s/\bDSon\b/Sonoran Desert/g;
s/\bCA\b/California/g;
s/\bSnBr\b/San Bernardino Mountains/g;
s/\bUS\b/United States/g;
s/$/<map>/;
$_;
}

sub il_to_html {
local($_) = @_;

s/Eur\./Europe./;
s/\ball yr\b/all year/;
s/ yr\b/ year/g;
s/ yrs\b/ years/g;
s/trop, subtrop S.Am/tropical, subtropical South America/;
s/subtrop, trop mtns/subtropical, tropical mountains/;
s/trop\) regions/tropical) regions/;
s/trop spp.\]/tropical spp.]/;
s/subtrop Am\b/subtropical America/;
s/trop Afr\b/tropical Africa/;
s/trop s hemisphere/tropical southern hemisphere/;
s/trop S.Am\b/tropical South America/;
s/trop Am\b/tropical America/;
s/temp Am\b/temperate America/;
s/temp, subtrop n hemisphere/temperate, subtropical northern hemisphere/;
s/subtrop coasts,/subtropical coasts/;
s/\bpantrop\b/pantropical/;
s/trop Asia/tropical Asia/;
s/subtrop mtns/subtropical mountains/;
s/trop mtns/tropical mountains/;
s/trop Australia/tropical Australia/;
s/trop, subtrop e Asia/tropical, subtropical eastern Asia/;
s/subtrop Asia/subtropical Asia/;
s/subtrop sw US/subtropical southwestern United States/;
s/trop N.Am\b/tropical North America/;
s/subtrop N.Am\b/subtropical North America/;
s/trop Am/tropical America/;
s/trop areas/tropical areas/;
s/trop and s Afr\b/tropical and southern Africa/;
s/trop weed/tropical weed/;
s/trop, subtrop Am\b/tropical, subtropical America/;
s/trop, temp Am\b/tropical, temperate America/;
s/trop Eurasia/tropical Eurasia/;
s/\btrop\b/tropics/;
s/\btrops\b/tropics/;
s/ temp\b/ temperate/;


s/ in fl arran/ in floral arran/g;
s/ fl tube/ floral tube/g;
s/ fl sts/ flowering stems/g;
s/ fl stalks/ flowering stalks/g;
s/ fl season/ flowering season/g;
s/ fl pls/ flowering plants/g;
s/ fl pl/ flowering plant/g;
s/ fl once/ flowering once/g;
s/ fl lst/ flowering first/g;
s/ fl late/ flowering late/g;
s/ after fl in/ after flowering in/g;
s/may fl 1st/may flower first/g;
s/ fl first/ flowering first/g;
s/ fl 1st/ flowering first/g;
s/ fl at / flowering at /g;
s/ by fl\b/ by flowering/;

s/(summer|spring|fall)-fl\b/$1-flowering/g;
s/\bst\b/stem/g;
s/\bsts\b/stems/g;
s/\bfl\b/flower/g;
s/\bfls\b/flowers/g;
s/\bfld\b/flowered/g;
s/\b([Pp]l)(s?)\b/$1ant$2/g;
s/\.plant/.pl/g;
s/\bfr\b/fruit/g;
s/\bfrs\b/fruits/g;
s/\be\b/eastern/g unless m/e[.;]/ ;
s/\blflets\b/leaflets/g;
s/\blfy\b/leafy/g;
s/\blflet\b/leaflet/g;
s/\blvs\b/leaves/g;

s/\bann\b/annual/g;
s/\b([Bb])ien\b/$1iennial/g;
if(m/....\bper\b......../i){
$per=$&;
s/\(Per\)/(Perennial herb)/g;

s/Per vine/Perennial vine/g;
s/Per mat/Perennial mat/g;
s/Per /Perennial herb /g;
s/\bper\?/perennial herb?/g;
s/\[([pP])er\]/[$1erennial herb]/g;
s/\b([pP])er([.;,])/$1erennial herb$2/g;
s/\b([pP])er (to|from|in|with|or|and|gen|\[|\()\b/$1erennial herb $2/g;
s/\bper\)/perennial herb)/g;
s/\bor per\b/or perennial herb/g;
s/\band per\b/and perennial herb/g;
s/\bif per\b/if perennial herb/g;
s/([,;]) per\b/$1 perennial herb/g;
s/ to per\b/ to perennial herb/g;
s/\[to per\]/[to perennial herb]/g;
s/montane per\b/montane perennial herb/g;
s/lived per\b/lived perennial herb/g;
s/Rhizomed per\b/Rhizomed perennial herb/g;
s/slender per\b/slender perennial herb/g;
s/\bper \[/perennial herb [/g;
#unless(m/erennial/){
#print "$per\n";
#}
}
s/\bexc\.?\b/except/g;
if(m/\bincl\b/){
s/\(incl\)/(included)/g;
	s/incl albino/including albino/;
	s/incl within/included within/g;
	s/reports not incl CA/reports not including California/;
	s/Plants incl hybrids/Plants including hybrids/;
	s/not incl in /not included in /g;
	s/Previously incl in/Previously included in/g;
	s/not incl phyllary/not including phyllary/;
	s/monophyly incl recognition/monophyly include recognition/;



	s/or incl /or included /g;
	s/([Ss]tigmas) incl or /$1 included or /g;
	s/Stamens incl or /Stamens included or /g;
	s/Stamens incl$/Stamens included/g;
	s/incl *<a /included <a /g;





s/not incl app/not including app/g;
s/\bincl([<,.,;])/included$1/g;
s/genus incl taxa/genus includes taxa/;
s/\bincls spur/includes spur/g;
s/\bincl (at|as)/included $1/g;
s/not incl _/not include _/g;
s/previously incl _/previously included _/g;
s/\bincl hybrids/include hybrids/g;
s/\bincl here/included here/g;
s/\bincl several/include several/g;
s/\bincl \.\.\.\.\./included ...../g;
s/\bincl \(/included (/g;
s/(that|May|to|not|Previously) incl /$1 include /g;
s/\bincl in /included in /g;
s/\bincl or /included or /g;
s/\bincl to /included to /g;
s/\bincl,/included,/g;
s/\bincl;/included;/g;
s/spp\. incl/spp. included/g;
s/or incl exc/or included exc/g;
s/netted with incl/netted with included/;
s/\bincl stamens/included stamens/g;
s/_ incl pls that/_ includes plants that/g;
s/stamens incl within/stamens included within/g;
s/previously incl genera/previously included genera/g;
s/([Cc]haracters) incl relative/$1 include relative/;
s/style incl\b/style included/g;
s/ and incl / and included /g;
s/, incl under/, included under/g;
s/subsp. incl the/subsp. include the/g;
s/would incl var/would include var/g;
s/incl genes/includes genes/g;
s/Characters incl calyx/Characters include calyx/g;
s/\bincl\b/including/g;
s/Anthers incl\b/Anthers included/g;
}
s/\bincls/includes/g;
s/\bAnn\b/Annual/g;
s/\bAnnual ([A-Z])/Ann $1/g;
s/\bPer\b/Perennial/g;
s/\b([Gg])en\b/$1enerally/g;
s/\besp\b/especially/g;
s/\blf\b/leaf/g;
s|([Ii])n cult\b|$1n cultivation|;
s/rice cult /rice cultivation /;
s/(escapes?) cult\b/$1 cultivation/;
s/(of|into|outside|after|in|In|from) cult\b/$1 cultivation/;
s/\bcult\b/cultivated/;
s/infl(s)?\b/inflorescence$1/g;
s/Vars\./Varieties/g;
s/\blfless\b/leafless/g;
s/\bocc\b (agricultural|escape|waif|weed)\b/occasional $1/g;
s/\bocc\b/occasionally/g;
s/\born\b/ornamental/g;

s/\bAfr\b/Africa/g;
s/N\. ?Am\b/North America/g;
s/S\. ?Am\b/South America/g;
s/\bssp\./subsp./g;
s/\bspp\.(\s+[A-Z])/species.$1/g;
s/\bspp\./species/g;
s/\bsspp\./subspp./g;
s|</?quote>|"|g;
$_;
}
