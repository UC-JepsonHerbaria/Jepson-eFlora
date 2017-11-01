use warnings;

open(OUT, ">outputs/load_taxonomy_table.sql") || die;
$data_path="/Users/davidbaxter/DATA";

open(IN, "$data_path/eFlora/IJM_sequence.txt") || die;
while(<IN>){
	$TaxonID = $FamilyID = $GenusID = $SpeciesID = "";
	chomp;
	
	($lines) = split(/\t/);

	#As the sequence file comes directly out of the make_eflora.sh parser (specifically format_for_i.pl), 
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
	}
	elsif ($lines =~ /^(\d+), (\d+), $/){
		$FamilyID = $1;
		$GenusID = "NULL";
		$SpeciesID = "NULL";
		$TaxonID = $2;
	}
	elsif ($lines =~ /^(\d+), (\d+), (\d+), $/){
		$FamilyID = $1;
		$GenusID = $2;
		$SpeciesID = "NULL";
		$TaxonID = $3;
	}
	elsif ($lines =~ /^(\d+), (\d+), (\d+), (\d+), $/){
		$FamilyID = $1;
		$GenusID = $2;
		$SpeciesID = $3;
		$TaxonID = $4;
	}
	else {
		$TaxonID = $FamilyID = $GenusID = $SpeciesID = "";
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
