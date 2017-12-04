use BerkeleyDB;
 $file="/usr/local/web/ucjeps_data/nomsyn_hcode_hash";
        tie(%hcode_hash, "BerkeleyDB::Hash", -Filename=>$file)|| print "Couldnt open $file: $!";
      
while(<DATA>){
chomp;
($name,$hcode)=split(/\t/);
$hcode_hash{$name}=$hcode;
}
__END__
