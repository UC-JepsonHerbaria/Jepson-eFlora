

#use warnings;
use lib "/Users/Shared/Jepson-Master/Jepson-eFlora/Modules/";
use CCH;

my $todayJD = &CCH::get_today_julian_day;
my $log_file = 'output/eflora_log'.$todayJD.'.txt';
	open(LOG, '>>', $log_file);


####make the IJM_sequence files used for the second part 
#this used to be created with format_for_i and added to the IJM.hash file

open(IN, "/Users/Shared/Jepson-Master/Jepson-eFlora/synonymy/input/smasch_taxon_ids.txt") || die;
local($/)="\n";
while(<IN>){
	chomp;
	
	($code,$name,@residue)=split(/\t/);

$name=~s/ X / &times;/;

	$NAME_TO_CODE{$name}=$code;
	$CODE_TO_NAME{$code}=$name;
}


open(OUT, ">output/load_taxonomy_table.sql") || die;

open(IN, "/Users/Shared/Jepson-Master/Jepson-eFlora/eflora_keys/output/IJM_sequence.txt") || die;
while(<IN>){
	$TaxonID = $FamilyID = $GenusID = $SpeciesID = "";
	chomp;
	
	($lines) = split(/\t/);
	++$total;
	#As the sequence file comes directly out of the make_eflora_keys.sh parser (specifically format_for_i.pl), 
	#each line ends with a comma and a space. These are manually clipped off when the sequence 
	#is copied to the END of the old search script (search_IJM.pl), 
	#so you might need to put them back on in IJM_sequence.txt to make this script work
	
	#since format_for_i.pl is a very confusing script, instead of tackling it to handle unnamed hybrids
	#I am adding a kluge at the end of this script to handle the one and only unnamed hybrid in the flora
	
	
	#18, 						Family
	#18, 9037, 					Genus
	#18, 9037, 15910, 			Species 1
	#18, 9037, 15946, 			Species 2
	#18, 9037, 15946, 55231, 	Infra in Species 2
	#18, 9037, 15946, 55233, 	Infra in Species 2

	if ($lines =~ /^(\d+), $/){
		$FamilyID = "NULL";
		$GenusID = "NULL";
		$SpeciesID = "NULL";
		$TaxonID = $1;
		++$one;
	}
	elsif ($lines =~ /^(\d+), (\d+), $/){
		$FamilyID = $1;
		$GenusID = "NULL";
		$SpeciesID = "NULL";
		$TaxonID = $2;
		++$two;
	}
	elsif ($lines =~ /^(\d+), (\d+), (\d+), $/){
		$FamilyID = $1;
		$GenusID = $2;
		$SpeciesID = "NULL";
		$TaxonID = $3;
		++$three;
	}
	elsif ($lines =~ /^(\d+), (\d+), (\d+), (\d+), $/){
		$FamilyID = $1;
		$GenusID = $2;
		$SpeciesID = $3;
		$TaxonID = $4;
		++$four;
	}
	else {
		$TaxonID = $FamilyID = $GenusID = $SpeciesID = "";
		++$null;
	}

print OUT <<EOP;
INSERT INTO eflora_taxonomy(TaxonID, FamilyID, GenusID, SpeciesID)
VALUES($TaxonID, $FamilyID, $GenusID, $SpeciesID)
;

EOP

}

print OUT <<EOP;
INSERT INTO eflora_taxonomy(TaxonID, FamilyID, GenusID, SpeciesID)
VALUES(100435, 28, 423, NULL)
;

EOP




print LOG <<EOP;
BEGIN EFLORA TAXONOMY STATS

TOTAL LINES: $total

Lines with one TID: $one
Lines with two TID's: $two
Lines with three TID's: $three
Lines with four TID's: $four

Lines with no TID's: $null

END EFLORA TAXONOMY STATS
EOP

print <<EOP;
TOTAL LINES: $total

Lines with one TID: $one
Lines with two TID's: $two
Lines with three TID's: $three
Lines with four TID's: $four

Lines with no TID's: $null

END EFLORA TAXONOMY STATS
EOP

close (OUT);
close (IN);
