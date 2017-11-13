#make_heath_bar.pl was integrated into the install-cch.sh script by David Baxter.
#the commands are as follows:
#perl make_heath_bar.pl
#mv hb2.pl /usr/local/web/ucjeps_cgi/hb2.pl
#chmod a+x /usr/local/web/ucjeps_cgi/hb2.pl
#echo "heath bars script refreshed and moved to ucjeps_cgi"


open(IN, "_hb2.pl") || die;
open(OUT, ">hb2.pl") || die;
	while(<IN>){
		print OUT;
		last if m/^__END__/; # exit when at end of the script portion of the file
	}
close(IN);

use BerkeleyDB;

$data_path	="/usr/local/web/ucjeps_data/ucjeps_data";

#data files
$CDL_DBM_file	="${data_path}/CDL_DBM";
$CDL_nomsyn_file	="${data_path}/CDL_nomsyn";
#$CDL_taxsyn_file	="${data_path}/CDL_taxsyn";  #this has not been modified since 2011, check to see how created
#this file had errors in it that could not be resolved.  This file has been a source of error in the heath bars for a number of years
#there is no record of its creation and David Baxter could not recreate it during his tenure.  
#The tax syn file and code below is now replaced with the same synonymy file that is used to create the KML's, CDL_nomsyn and 
#tie(%taxsyns, "BerkeleyDB::Hash", -Filename=>"$CDL_taxsyn_file", -Flags=>DB_RDONLY)|| die "$!";
#	while(($key,$value)=each(%taxsyns)){
#		@syns=split(/\t/,$value);
#			foreach $syn (@syns){
#				$syn=~s/f\. //;
#				$taxsyn{$syn}=$key;
#				print "$syn becomes $key\n";
#			}
#	}

tie(%nomsyns, "BerkeleyDB::Hash", -Filename=>"$CDL_nomsyn_file", -Flags=>DB_RDONLY)|| die "$!";
	while(($key,$value)=each(%nomsyns)){
		print "$key $value\n" if $key=~/carnosa/;

		@syns=split(/\t/,$value);
			foreach $syn (@syns){
				$NOMSYN{$syn}=$key;
				print "$syn becomes $key\n";
			}
}
	#die;


open(IN, "eflora_KML_Moe/data_inputs/tax_syns_to_check") || die;
while(<IN>){
chomp;
$_ = lc($_);
$_ = s/ (nothosubsp\.|f\.|var\.|subsp\.) / /g;

($syn, $accepted)=split(/\t/);
	print "$syn $accepted\n" if $syn=~/littoralis/;
			$accepted=$TAX_SYNS{$syn};
}

close (IN);


tie %CDL, "BerkeleyDB::Hash", -Filename=>"$CDL_DBM_file", -Flags=>DB_RDONLY or die "Cannot open file CDL_DBM: $! $BerkeleyDB::Error\n" ;

open(IN, "${data_path}/smasch_taxon_ids.txt") || die "Couldn't open the TID file\n";
	while(<IN>){
		chomp;
		($code,$name,@residue)=split(/\t/);
		$TNOAN{$code}=$name;
	}

#get list of relevent names, this is the old format that predates the eflora php scripts
#<a href="/cgi-bin/get_IJM.pl?tid=29483">        Jacaranda mimosifolia</a><br>
#<a href="/cgi-bin/get_IJM.pl?tid=4770"> Jacobaea vulgaris*</a><br>

#list of accession IDs associated with mexican records, not updated since 2012
#this file is now out of date and no longer removes RSA and CAS records due to the accession number change
#this needs re-created, but in a new format, mainly a list of the specimens that have no coordinates and are from Mexico but the municipality is 'unknown'
#these are the new problems taxa.  The rest of the Mexico specimens are removed based on the coordinates and county fields.
open(IN,"eflora_KML_Moe/data_inputs/all_mex.txt") || die;
	while(<IN>){
		chomp;
		$exclude_mexican_records{$_}++;
	}
	close(IN);

while(($key,$value)=each(%CDL)){
	@fields=split(/\t/,$value);
	($taxon=$fields[0])=~s/.* //;
	($taxon=$TNOAN{$taxon})=~s/(nothosubsp\.|subsp\.|var\.|f\.) //;
	#three criteria to exclude Baja California records based on accession_id, county and/or latitude
	next if $exclude_mexican_records{$key};
	
		if ($fields[8] =~ /(Ensenada|Mexicali|Tecate|Tijuana|Rosarito)/){
			#warn "$taxon skipped, Mexican county\n";
			next;
		}

		if ($fields[11] < 32.53){
			#warn "$taxon skipped, latitude south of California\n";
			next;
		}
		
	$taxon=lc($taxon);

		if($NOMSYN{$taxon}){
			$taxon = $NOMSYN{$taxon};
		}
		elsif ($TAX_SYNS{$taxon})
			$taxon = $TAX_SYNS{$taxon};
		}
	
	$fields[3] = =~s/ +//;
	$collector=$fields[1];
	$collector=~s/,? (and|&).*//;
	$collector=~s/,.*//;
	$collector=~s/^.*[A-Z][a-z].*//;
	$collector=~s/ +//;
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

#fields[1] = collectors
#fields[2] = CNUM_prefix
#fields[3] = CNUM
#fields[4] = CNUM_suffix
#fields[5] = EJD
#fields[6] = LJD

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

        carp("warning: julian date $jd pre-dates British use of Gregorian calendar\n") if ($jd < $brit_jd);

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


