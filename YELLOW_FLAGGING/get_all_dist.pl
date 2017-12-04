open(IN,"/Users/rlmoe/CDL_buffer/buffer/tnoan.out") || die;
while(<IN>){
chomp;
($code,$name)=split(/\t/);
$TNOAN{$name}=$code;
}
close(IN);
use BerkeleyDB;
tie(%NAME_CODE, "BerkeleyDB::Hash", -Filename=>"name_to_code.hash")|| die "Stopped; couldnt open name_to_code\n";
$file="eflora.tmp";
	undef($/);
	open(IN,$file) || die "couldn't open $file\n";

	$all_lines=<IN>;
#converts windows line ends#
	$all_lines=~s/\xEF\xBB\xBF//;
	$all_lines=~s/ *\r\n/\n/g;
	$all_lines=~s/ +/ /g;
	$all_lines=~s/UNABRIDGED REFERENCES/UNABRIDGED REFERENCE/g;
	
	@all_pars=split(/\n\n+/,$all_lines);
	$element=0;
	foreach(@all_pars){
		s/{\/.*?}//g;
		s/([0-9])-([0-9])/$1&ndash;$2/g;
s/PROOF:.*\n?//g;
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
		elsif(s/^UNABRIDGED\nHISTORICAL WAIF//){
			$nativity=qq{HISTORICAL WAIF};
		$exclude=1;
		}
		elsif(s/^WAIF//){
			$nativity=qq{WAIF};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\nJFP-[78], (.*)//){
			$nativity=qq{$1};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\nJFP-4, (URBAN WEED)//){
			$nativity=qq{$1};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\s+JFP-4//){
			$nativity=qq{AGRICULTURAL, GARDEN, OR URBAN WEED};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\n(CULTIVATED PLANT|AGRICULTURAL WEED)//){
			$nativity=qq{$1};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\nEXTIRPATED (WAIF|ALIEN)//){
			$nativity=qq{$1 (extirpated)};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\nNATURALIZED\nEXTIRPATED//){
			$nativity=qq{NATURALIZED (extirpated)};
		$exclude=1;
		}
		elsif(s/NATIVE OR NATURALIZED//){
			$nativity=qq{NATIVE OR NATURALIZED};
		}
		elsif(s/NATURALIZED//){
			$nativity=qq{NATURALIZED};
		}
		elsif(s/NATIVE\nEXTIRPATED//){
			$nativity=qq{NATIVE (extirpated)};
		}
		elsif(s/NATIVE//){
			$nativity=qq{NATIVE};
		}
		elsif(s/^UNABRIDGED *\n//){$exclude=1;};
		s|^([A-Z]+ACEAE) $|<center><font size="4"><b>$1</b></font>|ms;
		s|^([A-Z]+ACEAE) \((.*)\)$|<center><font size="4"><b>$1 ($2)</b></font>|ms;
if(m/\n([A-Z][A-Z-]+ [a-z&][;a-z-]+.*)/){
$name_for_hc=&strip_name($1);
#print "$name_for_hc\n";
}
if(m/([A-Z]+ACEAE)/){
$family=$1;
}
	if (m/DISTRIBUTION/){
($cal_dist)=m/BIOREGIONAL DISTRIBUTION: (.*)/;
($extra_cal_dist)=m/OUTSIDE CALIFORNIA: (.*)/;
print "$name_for_hc\t$cal_dist\t$extra_cal_dist\n";
}
}
sub strip_name{
local($_) = @_;
       s/^([A-Z][-A-Za-z]+) (X?[-a-z]+).*\b(nothosubsp\.|subsp\.|ssp\.|var\.|f\.) ([-a-z]+).*/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z]+) ([a-z&][a-z;-]+).*/$1 $2/;
s/ssp\./subsp./;
return (ucfirst(lc($_)));
}
