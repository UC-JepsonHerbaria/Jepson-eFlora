#dist_codes are a shorter hexidecimal representation of a 40-character binary vector
#the 40 character vector indicates the presence or absence of a taxon in a bioregion
#the first 35 represent the 35 lowest-rank bioregions; the last five are blank spots (always 0)
#refer to the print OUT to see what what bioregions each position represents
#get_all_dist.pl translates bioregion distribution strings into the binary vector and packs it into hex
#here we unpack the hex so we can store the binary vector values in a table
#the table is used by the online "checklist builder" pages

#David called these dist_codes.txt  and Dick called them hcodes.txt  

use lib "/JEPS-master/Jepson-eFlora/Modules/";
use flatten;
use BerkeleyDB;

open(OUT, ">output/load_distribution_table.sql") || die;

#process the bioregion hex code file, generated by get_all_dist_local.pl
open(IN, "/JEPS-master/Jepson-eFlora/YELLOW_FLAGGING/output/nomsyn_HCODE_cch_out.txt") || die;
#$file="/JEPS-master/Jepson-eFlora/synonymy/input/nomsyn_hcode_hash"; #this was a has file created by make_nomsym_hcode.pl, could still use this but it needs updated
#	tie %HEX, "BerkeleyDB::Hash", -Filename => $file, -Flags    => DB_CREATE or die "Cannot open file $filename: $! $BerkeleyDB::Error\n" ;

while(<IN>){
	chomp;
	($key,$hex_code)=split(/\t/);
#	print "TaxonID\tCCo	CaRF	CaRH	nChI	sChI	DMojexcDMtns	DMtns	DSon	KR	MPexcWrn	NCo	NCoRH	NCoRI	NCoRO	PRexcSnJt	SCo	SCoRI	SCoRO	SNEexcWaI	nSNF	cSNF	sSNF	nSNH	cSNH	sSNH	ScV	SnBr	SnFrB	SnGb	SnJV	SnJt	Teh	WTR	WaI	Wrn\n";
	if ($key =~ m/^\d+/){ #include only records that are numerical	
		$HEX{$key}=$hex_code;
#$hname = $TNOAN{$id_H};
		$dist_array = unpack("b*",pack("H*",$hex_code));
		@region_dist=split(//,$dist_array);
		#print join("\t",@hv[0 .. 34]), "\n";

		#format for SQLite insert (presence, i.e. "1", does not need to be changed)
			foreach (@region_dist) {
				s/0/NULL/;
			}


print "$_ $HEX{$_}\n" if m/^1831/;
print "$_ $HEX{$_}\n" if m/eria naus/;
print "$_ $HEX{$_}\n" if m/ X /;
print "$_ $HEX{$_}\n" if m/ &times;/;


print "TEST RECORD FOUND: $key $HEX{$key}\n" if ($hex_code =~ m/6000048102/);



	print OUT "INSERT INTO eflora_distributions(TaxonID, CCo, CaRF, CaRH, nChI, sChI, DMojexcDMtns, DMtns, DSon, KR, MPexcWrn, NCo, NCoRH, NCoRI, NCoRO, PRexcSnJt, SCo, SCoRI, SCoRO, SNEexcWaI, nSNF, cSNF, sSNF, nSNH, cSNH, sSNH, ScV, SnBr, SnFrB, SnGb, SnJV, SnJt, Teh, WTR, WaI, Wrn)\n";
	print OUT "VALUES($key, ", join(", ",@region_dist[0 .. 34]), ")\n";
	print OUT ";\n";
		
		#print "$hex_ID\t", join("\t",@region_dist[0 .. 34]), "\n";
	}
}

close(IN);