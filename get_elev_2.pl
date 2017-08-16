open(IN,"tnoan.out") || die;
open (OUT, ">CCH_elev_min_max.txt") || die;
while(<IN>){
chomp;
($code,$name)=split(/\t/);
$TNOAN{$name}=$code;
}
foreach $file (@ARGV){
	undef($/);
	open(IN,$file) || die "couldn't open $file\n";
	$all_lines=<IN>;
#converts windows line ends#
	$all_lines=~s/\xEF\xBB\xBF//;
	$all_lines=~s/ *\r\n/\n/g;
	$all_lines=~s/ +/ /g;
	@all_pars=split(/\n\n+/,$all_lines);
	foreach(@all_pars){
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
#warn "skipping $first_line following $name\n";
#next;
}
#print "$name\n" if $nativity eq "N";
#next;
			if(($elevation)=m/ELEVATION: (.*)/){
if(m/UNABR.*elevation/){
$comment=2;
#print "$name\n";
}
else{
$comment=1;
}
#next;
$max_e=$min_e="";
				if($elevation=~m/([0-9-]+)--([0-9-]+)/){
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
print OUT "$name $elevation\n";
}
					$max_e=0 if $max_e <0;
					$min_e=0 if $min_e <0;
					$max_e= $min_e=0 if $elevation=~/below.*tide/;
				$native{$name}{max}=$max_e;
				$native{$name}{min}=$min_e;
				print OUT "$name\tACC\t$min_e\t$max_e\t$comment\t$nativity\n";
print OUT "$name -> $name\n";
				if(m/SYNONYMS: (.*)/){
					while(s/SYNONYMS: +(.*)//){
                                		@syns=split(/; +/,$1);
                                		foreach(@syns){
                                        		s/Expanded author citation: //;
                                        		s/_//g;
s/, ined.*//;
s/, inval.*//;
s/, illeg.*//;
next if s/, .*//;
                                        		$_= &strip_name($_);
print OUT "$_ -> $name\n";
                                        		#print &strip_name($_), "\tSYN\t$min_e\t$max_e\t$comment\t$nativity\n";
                                		}
                        		}
				}
			}
		}
	}
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
