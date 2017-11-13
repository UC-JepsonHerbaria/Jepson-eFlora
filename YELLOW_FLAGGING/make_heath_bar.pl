open(IN, "/Library/Webserver/CGI-Executables/HB2.pl") || die;
open(OUT, ">HB2.pl") || die;
while(<IN>){
print OUT;
last if m/^__END__/;
}
close(IN);
use BerkeleyDB;
$data_path	="/Users/rlmoe/CDL_buffer/buffer/";
#data files
$CDL_name_list_file	="${data_path}CDL_name_list.txt";
$CDL_DBM_file	="${data_path}CDL_DBM";
$CDL_nomsyn_file	="/Users/rlmoe/CDL_buffer/buffer/stats/CDL_nomsyn";
$CDL_taxsyn_file	="/Users/rlmoe/CDL_buffer/buffer/stats/CDL_taxsyn";
tie(%nomsyns, "BerkeleyDB::Hash", -Filename=>"$CDL_nomsyn_file", -Flags=>DB_RDONLY)|| die "$!";
tie(%taxsyns, "BerkeleyDB::Hash", -Filename=>"$CDL_taxsyn_file", -Flags=>DB_RDONLY)|| die "$!";
while(($key,$value)=each(%taxsyns)){
@syns=split(/\t/,$value);
			foreach $syn (@syns){
$syn=~s/f\. //;
$taxsyn{$syn}=$key;
#print "$syn becomes $key\n";
}
}

open(IN, "/Users/rlmoe/data/taxon_ids/smasch_taxon_ids.txt") || die "Couldn't open the TID file\n";;
while(<IN>){
chomp;
($code,$name,@residue)=split(/\t/);
$TNOAN{$code}=$name;
}
#get list of relevent names
#<a href="/cgi-bin/get_IJM.pl?tid=29483">        Jacaranda mimosifolia</a><br>
#<a href="/cgi-bin/get_IJM.pl?tid=4770"> Jacobaea vulgaris*</a><br>
foreach $letter (A .. Z){
	open(IN, "/Users/rlmoe/IJM/IJM_index_${letter}.html") || die;
	while(<IN>){
		next unless /tid=\d/;
		next if m/\*<\/a>/;
		chomp;
		s/^.*">[ 	]*//;
		s/<\/a>.*//;
		s/(subsp\.|var\.|f\.) //;
s/&times;/X /;
$name=lc($_);
		$wanted_name{$name}=$name;
		if($nomsyns{$name}){
			#print "$name: $nomsyns{$name}\n";
			@syns=split(/\t/,$nomsyns{$name});
			foreach $syn (@syns){
				$wanted_name{$syn}=$name;
#print <<EOP;
				#>$syn< -> >$wanted_name{$syn}<
#EOP
			}
		}
	}
}

foreach $name(%wanted_name){
#print ">$name< -> >$wanted_name{$name}<\n";
}
#die;



open(IN, "/Users/rlmoe/CDL_buffer/buffer/CDL_main.in") || die;
while(<IN>){
	@fields=split(/\t/);
	($taxon=$fields[0])=~s/.* //;
	($taxon=$TNOAN{$taxon})=~s/(subsp\.|var\.|f\.) //;
$taxon=lc($taxon);
#print <<EOP;
#$taxon
#EOP
if($taxsyn{$taxon}){
#print <<EOP;
#TAX $taxon=$taxsyn{$taxon};
#EOP
$taxon=$taxsyn{$taxon};
}
if($wanted_name{$taxon}){
$taxon=$wanted_name{$taxon};
#print <<EOP;
#WANT $taxon=$wanted_name{$taxon};
#EOP
}
else{
#print "$taxon not wanted\n";
next;
}
$collector=$fields[1];
$collector=~s/,? (and|&).*//;
$collector=~s/,.*//;
$collector=~s/^.*[A-Z][a-z].*//;
next if $seen{"$collector$taxon$fields[5]$fields[3]"}++;
	next unless $fields[5];
	if($fields[3]){
		#next if $seen{$fields[3].$fields[5]}++;
			if ($year > $this_year){
				warn "$year $_\n";
				next;
			}
			if($fields[5]==$fields[6]){
				my ($year,$month,$day)=inverse_julian_day($fields[5]);
        			$month=("",Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec)[$month];
				warn "$fields[5]>>>$_\n" unless $month;
				$store{$taxon}{$month}++;
				$total{$taxon}++;
			}

	}
}
#die;
foreach $taxon (sort(keys(%store))){
print OUT "$taxon\t";
#print "$TNOAN{$taxon}\t";
foreach $month (Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec){
#print  int(100 * $store{$taxon}{$month}/$total{$taxon}),"\t";
print OUT  $store{$taxon}{$month},"\t";
}
print OUT "($total{$taxon})\n";
}
sub inverse_julian_day {
        use integer;
        my($jd) = @_;
        my($jdate_tmp);
        my($m,$d,$y);

        #carp("warning: julian date $jd pre-dates British use of Gregorian calendar\n") if ($jd < $brit_jd);

        $jdate_tmp = $jd - 1721119;
        $y = (4 * $jdate_tmp - 1)/146097;
        $jdate_tmp = 4 * $jdate_tmp - 1 - 146097 * $y;
        $d = $jdate_tmp/4;
        $jdate_tmp = (4 * $d + 3)/1461;
        $d = 4 * $d + 3 - 1461 * $jdate_tmp;
        $d = ($d + 4)/4;
        $m = (5 * $d - 3)/153;
        $d = 5 * $d - 3 - 153 * $m;
        $d = ($d + 5) / 5;
        $y = 100 * $y + $jdate_tmp;
        if($m < 10) {
                $m += 3;
        }
        else {
                $m -= 9;
                ++$y;
        }
        return ($y, $m, $d);
}


