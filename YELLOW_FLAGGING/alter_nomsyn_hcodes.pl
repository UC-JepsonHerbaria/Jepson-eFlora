#SMASCH TAXON IDS
open(IN,"tnoan.out") || die;
while(<IN>){
chomp;
($id,$name)=split(/\t/);
$TID{$name}=$id;
$NAME{$id}=$name;
}
#
open (IN, "../newdist") || die;
#Generated from TJM2 treatments. SMASCH taxon id -> hcode
while(<IN>){
next if m/^ *#/;
chomp;
($id,$hcode)=split(/\t/);
$newdist{$NAME{$id}}=$hcode;

}
use BerkeleyDB;
#master nomenclatural synonym hash

#hash of names and hcodes used by get_cpn.pl
$file="/usr/local/web/ucjeps_data/nomsyn_hcode_hash";
tie(%hcode_hash, "BerkeleyDB::Hash", -Filename=>$file)|| print "Couldnt open $file: $!";
foreach(keys(%hcode_hash)){

 #if ($newdist{$_}){
#unless($hcode_hash{$_} == $newdist{$_}){
print "$_ $hcode_hash{$_} $newdist{$_}\n";#
#}
#}
}
