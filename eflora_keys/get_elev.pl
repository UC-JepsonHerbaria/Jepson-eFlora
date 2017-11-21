use BerkeleyDB;
 my $filename = "JEPS_elev.hash";
    tie %jeps_elev, "BerkeleyDB::Hash",
                -Filename => $filename,
        or die "Cannot open file $filename: $! $BerkeleyDB::Error\n" ;

open(IN,"/Users/davidbaxter/DATA/smasch_taxon_ids.txt") || die;
while(<IN>){
chomp;
($code,$name)=split(/\t/);
$TNOAN{$name}=$code;
}
open(WARNING,">stderr.txt") || die;
$/="";
$file="eflora_treatments.txt";
open(IN,$file) || die "couldn't open $file\n";
while(<IN>){
	($first_line)=m/^(.*)/;
	if(m/([A-Z]+ACEAE)/){
		$family=$1;
		#print "$family\n";
	}
	if( m/NATIVE/){
		$nativity="N";
	}
	else{
		$nativity="A";
	}
    	if(m/([A-Z-]+ .*)\nTAXON AUTHOR/){
        	$name=&strip_name($1);
    	}
    	elsif(m/(NATIVE|NATURALIZED)\n([A-Z-]+ .*)/){
        	$name=&strip_name($2);
	}
	else{
		print WARNING "skipping $first_line following $name\n";
		next;
	}
#print "$name\n" if $nativity eq "N";
#next;
	if(($elevation)=m/ELEVATION: (.*)/){
		if(m/UNABR.*elevation/){
			$comment=2;
		}
		else{
			$comment=1;
		}
		$max_e=$min_e="";
				if($elevation=~m/([0-9-]+)--([0-9-]+)/){
					$max_e=$2; $min_e=$1;
				}
				elsif($elevation=~m/([0-9-]+), ([0-9-]+)/){ #added to parse the elevation range for B. serpenticola which is 1100, 2100 m
					$max_e=$2; $min_e=$1;
				}
				elsif($elevation=~m/<=? *([0-9]+)/){
					$max_e=$1; $min_e=0;
				}
				elsif($elevation=~m/>=? *([0-9]+)/){
					$max_e=4300; $min_e=$1;
				}
				elsif($elevation=~m/\+- *([0-9]+)/){
					$max_e=$1; $min_e=$1;
				}
				elsif($elevation=~m/(^[0-9]+) m/){
					$max_e=$1; $min_e=$1;
				}
				else{
					print "$name $elevation\n";
				}
				$max_e=0 if $max_e <0;
				$min_e=0 if $min_e <0;
				$max_e= $min_e=0 if $elevation=~/below.*tide/;
				$native{$name}{max}=$max_e;
				$native{$name}{min}=$min_e;
				#print "$name\t$min_e\t$max_e\n";
$jeps_elev{$name}="$min_e\t$max_e";
				if(m/SYNONYMS: (.*)/){
					while(s/SYNONYMS: +(.*)//){
                                		@syns=split(/; +/,$1);
                                		foreach(@syns){
                                        		s/Expanded author citation: //;
                                        		s/_//g;
							next if s/, .*//;
                                        		$name= &strip_name($_);
$jeps_elev{$name}="$min_e\t$max_e";
                                        		#print "$name\t$min_e\t$max_e\n";
                                		}
                        		}
				}
			}
		}
untie(%jeps_elev);

foreach $name (sort(keys(%native))){
#print "$TNOAN{$name} $native{$name}{max}\n" if ($native{$name}{max} && $native{$name}{max}< 300);
}
sub strip_name{
local($_) = @_;
			s/ {\/.*//;
			s/\/{.*//;
			s/ *{.*//;
s/&times;/× /;
       s/^([A-Z][-A-Za-z]+) (X?[-a-z]+).*\b(nothosubsp\.|subsp\.|ssp\.|var\.|f\.) ([-a-z]+).*/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z]+) ([x ]*[-a-z]+).*/$1 $2/;
s/ (subsp\.|var\.|f\.) / /;
#return ucfirst((lc($_)));
return (lc($_));
}
