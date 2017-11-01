use BerkeleyDB;
tie(%NAME_CODE, "BerkeleyDB::Hash", -Filename=>"name_to_code", -Flags=>DB_RDONLY)|| die "$!";
@field_list=(
"UNABRIDGED KEY LEAD",
"TAXON AUTHOR",
"COMMON NAME",
"TJM1 AUTHOR",
"TJM2 AUTHOR",
"HABIT+",
"UNABRIDGED HABIT+",
"PLANT BODY",
"STEM",
"STEMS",
"STERILE STEM",
"FERTILE STEM",
"LEAF",
"LEAVES",
"FROND",
"FRONDS",
"INFLORESCENCE",
"SPIKELET",
"FLOWER",
"RAY FLOWER",
"DISK FLOWER",
"POLLEN CONE",
"SEED CONE",
"CONE",
"CONES",
"STAMINATE INFLORESCENCE",
"PISTILLATE INFLORESCENCE",
"BISEXUAL FLOWER",
"STAMINATE FLOWER",
"PISTILLATE FLOWER",
"FRUIT",
"SEED",
"SEEDS",
"SPORANGIUM",
"SPORANGIA",
"CHROMOSOMES",
"UNABRIDGED CHROMOSOMES",
"ECOLOGY",
"RARITY STATUS",
"ELEVATION",
"BIOREGIONAL DISTRIBUTION",
"DISTRIBUTION OUTSIDE CALIFORNIA",
"UNABRIDGED DISTRIBUTION OUTSIDE CALIFORNIA",
"SPECIES IN GENUS",
"UNABRIDGED SPECIES IN GENUS",
"GENERA IN FAMILY",
"UNABRIDGED GENERA IN FAMILY",
"ETYMOLOGY",
"UNABRIDGED ETYMOLOGY",
"TOXICITY",
"WEEDINESS",
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
"CONING TIME",
"FLOWERING TIMES",
"AUTHORSHIP OF PARTS"
);
$field_order=1;
grep($field_list{$_}=$field_order++,@field_list);
foreach(keys(%field_list)){
#print "$_: $field_list{$_}\n";
}
#die;

undef ($/);
foreach(@ARGV){
$file=$_;
	open(IN,$file) || die "couldn't open $file\n";
	$all_lines=<IN>;
#converts windows line ends#
	$all_lines=~s/ *\r\n/\n/g;
	
	@all_pars=split(/\n\n+/,$all_lines);
shift(@all_pars) if $all_pars[0]=~/UNABRIDGED/;
	foreach(@all_pars){
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
		if(m|^([A-Z][A-Z]+) +([a-z-]+) *\n|m){
			$trinomial="$1 $2";
#warn "flabba $trinomial\n";
			$epithet=$2;
			$name_link=ucfirst(lc($trinomial));
$name_for_hc=$name_link;
			if($NAME_CODE{$name_link}){
		$name_anchor=<<EOP;
<a name="$NAME_CODE{$name_link}"> </a>
EOP
				$store_treat_path{$NAME_CODE{$name_link}}=$outfile;
				($consort_link=$name_link)=~s/ /%20/g;
				s!(if verified,) !<a href="/cgi-bin/get_consort.pl?taxon_name=$consort_link">$1</a> !;
				$name_link= <<EOP;
<a href="/cgi-bin/get_cpn.pl?$NAME_CODE{$name_link}">[ICPN]</a>
EOP
			}
			else{
				print "1. NO ${name_link}<\n";
$name_link= "";
			}

		}
		elsif(m/^([A-Z][A-Z]+) +([a-z-]+).*(var\.|subsp\.) ([a-z-]+) *\n/m){
			$name_link=ucfirst(lc("$1 $2 $3 $4"));
				($consort_link=$name_link)=~s/ /%20/g;
s!(if verified,) !<a href="/cgi-bin/get_consort.pl?taxon_name=$consort_link">$1</a> !;
			if($NAME_CODE{$name_link}){
$name_anchor=<<EOP;
<a name="$NAME_CODE{$name_link}"> </a>
EOP
				$store_treat_path{$NAME_CODE{$name_link}}=$outfile;
$name_link= <<EOP;
<a href="/cgi-bin/get_cpn.pl?$NAME_CODE{$name_link}">[ICPN]</a>
EOP
			}
			else{
				print "2. NO $name_link\n";
$name_link= "";
			}
#$store_treat_path{$name_link}=$outfile;
#print "$name_link\n";
		}
		$last_tag="UNABRIDGED KEY LEAD";
		foreach $sortline (@lines[3 .. $#lines]){
			$sortline=~s/ +$//;
		if($sortline=~m/rrr/){
			print "$file rrr $sortline\n\n";
		}
		if($sortline=~m/&mathx[^;]/){
			print "$file MATHX $sortline\n\n";
		}
		if($sortline=~m/\)[^0-9,.;: ]/){
			print "$file probable paren spacing error: $sortline\n\n";
		}
($open_brace)=($sortline=~s/([\[({])/$1/g);
($close_brace)=($sortline=~s/([)\]}])/$1/g);
unless($open_brace==$close_brace){
			print "$file probable paren error: $sortline\n\n";
}
		if($sortline=~m/\( /){
			print "$file probable paren spacing error: $sortline\n\n";
		}
		if($sortline=~m/(\d-\d)/){
			print "$file probable en-dash error: $sortline\n\n";
		}
		if($sortline=~m/[A-Za-z]--[A-Za-z]/){
unless ($sortline=~m/[A-Z][a-z][a-z]--[A-Z][a-z][a-z]/){
			print "$file probable en-dash error: $sortline\n\n";
}
		}
		if($sortline=~m/([\200-\377])/ ){
			print "$file possible font problem $1: $sortline\n\n";
		}
		if($sortline=~m/( _ )/ ){
			print "$file possible underline spacing problem $1: $sortline\n\n";
		}
		#if($sortline=~m/( _ )/ ){
			#print "$file possible underline spacing problem $1: $sortline\n\n";
		#}
			($tag=$sortline)=~s/:.*//;
			$tag=~s/^([A-Z_\+]+) [^A-Z].*/$1/;
			unless($field_list{$tag}){
				unless ($sortline =~/^\w*[0-9]['.]/ || $last_tag =~/RARITY/){
				print "$file unrecognized tag $tag $sortline\n\n" unless $tag=~/^\d+['.]/;
}
			}
			unless($field_list{$tag} > $field_list{$last_tag}){
				unless ($sortline =~/^\w*[0-9]['.]/ || $last_tag =~/RARITY/){
					print "$file Out of order: $sortline : $field_list{$tag} tag=$tag last tag=$last_tag";
if($last_tag=~/UNABRIDGED KEY LEAD/){print " (default last tag\n\n";}
else{print "\n\n";}
				}
			}
			$last_tag=$tag;
		}
}
}
