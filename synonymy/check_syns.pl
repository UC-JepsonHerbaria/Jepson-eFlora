#$lookfor=shift;
#chomp($lookfor);
#print "lookfor: $lookfor\n";


use BerkeleyDB;
$data_path	="/input/";
$CDL_taxsyn_file	="${data_path}CDL_taxsyn";
	tie(%taxsyns, "BerkeleyDB::Hash", -Filename=>"$CDL_taxsyn_file", -Flags=>DB_RDONLY)|| die "$!";

		foreach(keys(%taxsyns)){
			print "$_ $taxsyns{$_}\n";
		}
die;
if($lookfor){
	if($taxsyns{lc($lookfor)}){
		print "$taxsyns{lc($lookfor)}  \n";
				@taxsyns=split(/\t/,$taxsyns{lc($lookfor)});
				foreach(@taxsyns){
					print "found $_ :  $taxsyns{$_}\n";
				}
	}
	else{
print " not found $lookfor\n";
	}
}
