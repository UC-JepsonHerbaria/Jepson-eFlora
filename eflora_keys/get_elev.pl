$/="";
open(IN, "update/flat_dbm_6") || die;
open(OUT, ">get_elev.out") || die;
@treat=(<IN>);
@treat=reverse(@treat);

$complete_name="";

foreach(@treat){
	if(m|<family_name>\s*(.*)\s*</family_name>|){
next;
	}
	if (m/<genus_name>([^<]+)/){
		$genus=$1;
next;
	}

	if(m/sp_par/){
		$taxaut="";
	#<sp_name origin="native">A. septentrionale</sp_name>
#<taxaut>(L.) Hoffm.</taxaut>
		if(m/<sp_name origin="(native|intro)">([^<]+)/){
			($spname=$2)=~s/[A-Z]\. +//;
			($taxaut)=m|<taxaut>\s*(.*)\s*</taxaut>|;
			$complete_name="$genus $spname $taxaut";
			$spname .= " $taxaut";
		}
		elsif(m/<infrasp_name origin="(native|intro)">([^<]+)/){
			$i_n=$2;
			($taxaut)=m|<taxaut>\s*(.*)\s*</taxaut>|;
			$complete_name="$genus $spname $i_n $taxaut";
	#<infrasp_name origin="native">var. tenuissimus</infrasp_name>
#<taxaut>Mert. & Koch</taxaut>&quad;
		}

		elsif(m/<infrasp_name origin="(native|intro)" style="full_name">[A-Z]\. +([a-z-]+.*?(var\.|ssp\.) [^<]+)/){
			$i_n=$2;
			($taxaut)=m|<taxaut>\s*(.*)\s*</taxaut>|;
			$complete_name="$genus $i_n $taxaut";
#<infrasp_name origin="native" style="full_name">A. trichomanes  L.  ssp. trichomanes</infrasp_name>
		}

		elsif(m/<phase_name>([^<]+)/){
			$complete_name="$genus $1";
		}
		else{
			($name)=m/^(.*\n.*)/;
			warn "$name sp_par without species element\n";
		}
$elev="";
$range=$max=$min="";
	if(m/<elevation>([^<]+)/){
$range=$elev=$1;
$max=$min="";
$range=~s/&lt; /0--/;
$range=~s/&plus_minus; //;
$range=~s/gen //;
$range=~s/&gt; (\d+)/$1--4300/;
$range=~s/probably //;
if($range=~/([-\d]+)--([-\d]+)/){
$min=$1; $max=$2;
}
elsif($range=~/([-\d]+)/){
$min=$1; $max=$1;
}
$range= "$min\t$max\t$elev";
print "$range\n" unless $seen{$range}++;
}
	elsif(m/<elevation asin/){
$range="\t\tas in species";
}
	elsif(m/Habitat.*of sp\b/){
$range="\t\tas in species";
}
	elsif(m/Range.*of sp\b/){
$range="\t\tas in species";
}
$complete_name=~s/  */ /g;
$complete_name=~s/  *$//g;
$complete_name=~s/&mathx;/X-/g;
$complete_name=~s/ssp\./subsp./g;
$complete_name=&strip_name($complete_name);
$range=~s/&gt;/>/;
$range=~s/&lt;/</;
print OUT "$complete_name\t$range\n";
	}
}
sub strip_name{
#Aloe saponaria (Aiton) Haw. x A. striata Haw.
#Encelia farinosa x Encelia frutescens
#Trifolium variegatum Nutt. phase 1
#Fragaria x ananassa Duchesne var. cuneifolia (Nutt. ex Howell) Staudt, pro nm.
	local($_) = @_;
s/^([A-Z])([^ ]+)/$1\L$2/;
#warn "SAPONARIA: $_" if m/saponaria/;
	s/^ *//;
	s/ x / × /;
s/^([A-Z])([A-Z]+)/$1\L$2/;
s/^x ([A-Z][a-z]+ [a-z]+).*/× $1/;
s/Fragaria × ananassa Duchesne var. cuneifolia.*/Fragaria × ananassa var. cuneifolia/ ||
s/Trifolium variegatum Nutt. phase (\d)/Trifolium variegatum phase $1/ ||
s/Aloe saponaria.*striata.*/Aloe saponaria × Aloe striata/ ||
s/Encelia farinosa . Encelia frutescens/Encelia farinosa × Encelia frutescens/ ||
	s/^([A-Z][a-z]+) (X?[-a-z]+).*(subsp.) ([-a-z]+).*(var\.) ([-a-z]+).*/$1 $2 $3 $4 $5 $6/ ||
	s/^([A-Z][a-z]+ [a-z]+) (× [-A-Z][a-z]+ [a-z]+).*/$1 $2/ ||
	s/^([A-Z][a-z]+) (× [-a-z]+).*/$1 $2/ ||
	s/^([A-Z][a-z]+) (X?[-a-z]+).*(ssp\.|var\.|f\.|subsp.) ([-a-z]+).*/$1 $2 $3 $4/ ||
	s/^([A-Z][a-z]+) (X?[-a-z]+).*/$1 $2/||
	s/^([A-Z][a-z]+) [A-Z(].*/$1/;
warn "SAPONARIA: $_" if m/saponaria/;
	return ($_);
}
