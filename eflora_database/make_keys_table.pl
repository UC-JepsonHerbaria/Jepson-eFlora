#use strict;
#use warnings;
use lib "/Users/Shared/Jepson-Master/Jepson-eFlora/Modules/";
use CCH;


$todayJD = &CCH::get_today_julian_day;
$log_file = 'output/eflora_log'.$todayJD.'.txt';
	open(LOG, '>>', $log_file);


open(OUT, ">output/load_keys_table.sql") || die;
$data_path="../eflora_keys/input";


open(IN, "/Users/Shared/Jepson-Master/Jepson-eFlora/synonymy/input/smasch_taxon_ids.txt") || die;
while(<IN>){
	chomp;
	s/X /&times;/;
	($code,$name,@residue)=split(/\t/);
	$NAME_TO_CODE{$name}=$code;
	$CODE_TO_NAME{$code}=$name;
	
}
close(IN);


my %k;
open(IN, "../eflora_keys/output/eflora_keys_expanded.html") || die;
while(<IN>){
		s/ (\d+) px ;/ $1px ;/g;
    chomp;
    my ($k,$v) = (split /\t/,$_);
    if (exists $HASH{$k} ) {
        $HASH{$k}.= $v;
    }
    else{
        $HASH{$k} = $v;
    }    
}
close(IN);

# write output to file so that there is only one line per Taxon ID
open(EXP,">output/eflora_keys_expanded_combined.txt");
while (my ($k,$v) = each %HASH) {
    print EXP "$k\t$v\n";
	++$hash_lines;
}
close(EXP);




#open(IN, $data_path."/text.txt") || die;
open(IN, "output/eflora_keys_expanded_combined.txt") || die;
while(<IN>){
	$tid=$key_text="";
	chomp;
	
	#f01287-01.txt	Agave shawii var. shawii
	($tid,$key_text) = split(/\t/);

#Escaping single quotes for SQL insert
	$key_text =~ s/'/''/g;
	
	
	#this used to be done by get_IJM.pl, but it is converted here so that PHP does not have to do the conversion
	$key_text=~s!<a href="#(\d+)!<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=$1!g;

	#this used to be done by get_IJM.pl, but this does not seem to be a issue anymore.  There does not seem to be any section of
	#the format_for_i script that makes a <sp_list> tag, commented out for now
			#if($entry=~s/<sp_list>(.*)<\/sp_list>//){
			#	@taxa=split(/,/,$1);
			#	foreach(@taxa){
			#	s!.*!<OPTION VALUE="http://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=$&">$NAN{$&}\n!;
			#	}
			#}

	
$taxon = $CODE_TO_NAME{$tid};
$HasKey = "1";
	#single quotes for SQL are added in the print OUT
	if ($tid =~ /\d+/){
		print OUT <<EOP;
INSERT INTO eflora_keys(TaxonID, ScientificName, HasKey, KeyText)
VALUES($tid, '$taxon', $HasKey, '$key_text')
;

EOP


++$key_count;
	}
	else {
		print "badly formatted or no taxon id: $tid==>$key_text\n";
		print LOG "badly formatted or no taxon id: $tid==>$key_text\n";
	}
}	



print LOG <<EOP;
IJM Keys Sep 2016: 899
IJM Keys Jan 2017: 898
IJM Keys Dec 2017: 898
IJM Keys Jan 2018: 898
IJM Keys Apr 2019: 900
IJM Keys Jan 2020: 901

Current Numer of keys: $key_count
eflora keys expanded combined lines: $hash_lines

EOP

print <<EOP;
IJM Keys Sep 2016: 899
IJM Keys Jan 2017: 898
IJM Keys Dec 2017: 898
IJM Keys Jan 2018: 898
IJM Keys Apr 2019: 900
IJM Keys Jan 2020: 901

Current Numer of keys: $key_count
eflora keys expanded combined lines: $hash_lines

EOP

close(IN);
close(OUT);