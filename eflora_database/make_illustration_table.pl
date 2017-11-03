#use warnings;

open(OUT, ">outputs/load_illustration_table.sql") || die;
$data_path="/Users/davidbaxter/DATA";

#load Taxon IDs for all taxa
open(IN, "$data_path/smasch_taxon_ids.txt") || die;
while(<IN>){
	$TaxonID=$TID_name="";
	chomp;

	#25206	Eschscholzia californica	Eschscholzia	californica	unknown	Cham.	sp	0
	($TaxonID,
	$TID_Name,
	@rest) = split(/\t/);

	$TID{$TID_Name} = "$TaxonID";
	}

open(IN, "name_illus_pairs.txt") || die;
while(<IN>){
	$image_file_name=$image_taxon_name="";
	chomp;
	
	#f01287-01.txt	Agave shawii var. shawii
	($image_file_name,
	$image_taxon_name) = split(/\t/);

	next if $image_taxon_name =~ /aceae$/; #We skip pairing the images with the family caption, since they don't properly represent the family

	foreach ($image_file_name){
		s/\.txt/.png/;
	}

	#single quotes for SQL are added in the print OUT
	if ($TID{$image_taxon_name}){
		print OUT <<EOP;
INSERT INTO eflora_illustrations(TaxonID, FileName)
VALUES($TID{$image_taxon_name}, '$image_file_name')
;

EOP
	}
	else {
		print "no taxon id for $image_file_name\t$image_taxon_name\n";
	}
}	