use BerkeleyDB;
tie(%IJM, "BerkeleyDB::Hash", -Filename=>"ijm.hash")|| die "Stopped; couldnt open IJM\n";
tie(%IJM_key, "BerkeleyDB::Hash", -Filename=>"ijm_key.hash")|| die "Stopped; couldnt open IJM_key\n";
open(IN,"tnoan.out") || die;
while(<IN>){
chomp;
($code,$name)=split(/\t/);
$TNOAN{$name}=$code;
$NAN{$code}=$name;
}
close(IN);
$TID=shift;
if($TID=~/^\d[ 0-9,]*$/){
while(<DATA>){
	chomp;
	$string=$_;
	s/.* //;
	$IJM_entry{$_}=$string;
	$IJM_seq_hash{$_}=$.;
	$IJM_list[$.]=$_;
}
print $IJM{$TID};
$previous_tid=$IJM_list[$IJM_seq_hash{$TID}-1];
$next_tid=$IJM_list[$IJM_seq_hash{$TID}+1];
$previous_taxon=$NAN{$previous_tid};
$next_taxon=$NAN{$next_tid};
print <<EOP;
<a href="get_IJM.pl?tid=$previous_tid"> Previous taxon: $previous_taxon</a>
<br>
<a href="get_IJM.pl?tid=$next_tid"> Next taxon: $next_taxon</a>
EOP
}
else{
warn "bad input\n";
}
__END__
#add IJM_treatments.txt text here
