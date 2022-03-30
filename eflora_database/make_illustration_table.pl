use strict;
#use warnings;
use lib "/Users/Shared/Jepson-Master/Jepson-eFlora/Modules/";
use CCH;

my ($TaxonID, $TID_name, $image_file_name, $image_taxon_name, $large_image_name, $acc_name, $syn) ="";
my ($taxon_name, $file_name, $image_name_large, $image_name_small, $small_image_name, %seen, %NAME_TO_CODE) ="";
my ($image_taxon_id, $TName, @rest, $old, $revised, $log_file, $todayJD) ="";

$todayJD = &CCH::get_today_julian_day;
$log_file = 'output/eflora_log'.$todayJD.'.txt';
	open(LOG, '>>', $log_file);

open(OUT, ">output/load_illustration_table.sql") || die;

#load Taxon IDs for all taxa
open(IN, "/Users/Shared/Jepson-Master/Jepson-eFlora/synonymy/input/smasch_taxon_ids.txt") || die;
while(<IN>){
	chomp;


	#25206	Eschscholzia californica	Eschscholzia	californica	unknown	Cham.	sp	0
	($TaxonID,$TName,@rest) = split(/\t/);

	$NAME_TO_CODE{$TName} = $TaxonID;
	}

close (IN);



#process the hi rez image files

open(IN, "input/name_illus_pairs_hi_res.txt") || die;
while(<IN>){
	chomp;

next if (m/^#/);

	#f01287-01.txt	Agave shawii var. shawii
	($acc_name,$syn,$image_name_large,$image_name_small) = split(/\t/);

	$seen{$acc_name}++;

$large_image_name = $image_name_large.".png";
$small_image_name = $image_name_small.".png";

	#single quotes for SQL are added in the print OUT
	if ($NAME_TO_CODE{$acc_name}){
		++$revised;
		$image_taxon_id = $NAME_TO_CODE{$acc_name};
		print OUT <<EOP;
INSERT INTO eflora_illustrations(TaxonID, FileName, LargeFileName)
VALUES($image_taxon_id, '$small_image_name', '$large_image_name')
;

EOP
	}
	else {
		print "no taxon id for $acc_name\t$small_image_name\n";
		print LOG "no taxon id for $acc_name\t$small_image_name\n";
	}
}
close (IN);

#process the 2014 image files

open(IN, "input/name_illus_pairs.txt") || die;
while(<IN>){
	chomp;
	
next if (m/^#/);
	
	#f01287-01.txt	Agave shawii var. shawii
	($image_file_name,$image_taxon_name) = split(/\t/);

	next if $image_taxon_name =~ /aceae$/; #We skip pairing the images with the family caption, since they don't properly represent the family

	unless ($seen{$image_taxon_name}){
	#single quotes for SQL are added in the print OUT
		if ($NAME_TO_CODE{$image_taxon_name}){
			++$old;
			$image_taxon_id = $NAME_TO_CODE{$image_taxon_name};
		
			print OUT <<EOP;
INSERT INTO eflora_illustrations(TaxonID, FileName, LargeFileName)
VALUES($image_taxon_id, '$image_file_name', NULL)
;

EOP
		}
		else {
		print "no taxon id for $image_file_name\t$image_taxon_name\n";
		print LOG "no taxon id for $image_file_name\t$image_taxon_name\n";
		}
	}
}	

print LOG <<EOP;
BEGIN EFLORA ILLUS STATS

Records with revised LARGE res Images: $revised

Records with original low res Imagess: $old

END EFLORA ILLUS STATS
EOP

print <<EOP;
Records with revised LARGE res Images: $revised

Records with original low res Imagess: $old

END EFLORA ILLUS STATS
EOP


close (IN);
close (OUT);