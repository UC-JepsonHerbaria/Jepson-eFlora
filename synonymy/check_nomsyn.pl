#$lookfor=shift;
#chomp($lookfor);
#print "lookfor: $lookfor\n";


use BerkeleyDB;
$data_path	="/input/";
$CDL_nomsyn_file	="${data_path}CDL_nomsyn";
	tie(%nomsyns, "BerkeleyDB::Hash", -Filename=>"$CDL_nomsyn_file", -Flags=>DB_RDONLY)|| die "$!";
foreach(keys(%nomsyns)){
print "$_ $nomsyns{$_}\n";
}
die;
if($lookfor){
	#$lookfor=~s/ [xX] / $times /;
	#$lookfor=~s/ $times([a-z])/ $times $1/;
	if($nomsyns{lc($lookfor)}){
		print "$nomsyns{lc($lookfor)}  \n";
				@nomsyns=split(/\t/,$nomsyns{lc($lookfor)});
				foreach(@nomsyns){
					print "found $_ :  $nomsyns{$_}\n";
				}
		}
	else{
print " not found $lookfor\n";
	}
	}
