use BerkeleyDB;
tie(%IJM, "BerkeleyDB::Hash", -Filename=>"output/IJM_key.hash", -Flags      => DB_CREATE)|| die "Stopped; couldnt open IJM\n";
#tie(%IJM, "BerkeleyDB::Hash", -Filename=>"output/IJM.hash", -Flags      => DB_CREATE)|| die "Stopped; couldnt open IJM\n";
#tie(%IJM, "BerkeleyDB::Hash", -Filename=>"output/IJM_expanded.hash", -Flags      => DB_CREATE)|| die "Stopped; couldnt open IJM\n";
while(($key,$value)=each(%IJM)){
#print $IJM{302};
#die;
#print "$key\t$value\n";

#print "$key\t";
#print $IJM{3801};
print $IJM{9712};
}
