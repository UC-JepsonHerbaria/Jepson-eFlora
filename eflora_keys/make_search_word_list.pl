open(IN, "/Users/richardmoe/4_data/taxon_ids/smasch_taxon_ids.txt") || die;
while(<IN>){
	chomp;
	s/X /&times;/;
	($code,$name,@residue)=split(/\t/);
	$TNOAN{$name}=$code;
	$NAN{$code}=$name;

}
close(IN);

while(<DATA>){
#print;
	chomp;
	open(IN,$_) || die;
	while(<IN>){
#print;
s/&times;//;
		if(m/.*=(\d+)">\s+(.*)\*/){
			$accepted_code=$1;
			$synonym_code=$TNOAN{$2};
			unless($synonym_code){
				$tn=$2;
				$otn=$2;
				if($tn=~s/subsp\./var./){
					$synonym_code=$TNOAN{$tn};
				}
				elsif($tn=~s/var\./subsp./){
					$synonym_code=$TNOAN{$tn};
				}
			}
			unless($synonym_code){
				$synonym_code="199999";
				#print "NC: $otn\n";
			}
			$name=$2;
		}
		elsif(m/.*=(\d+)">\s+(.*)<\//){
			$accepted_code=$1;
			$synonym_code=$1;
			$name=$2;
		}
		else{
			next;
		}
#print "$name $accepted_code $synonym_code\n";
		@name_words=split(/ /,$name);
		foreach(@name_words){
			next unless m/^[A-Za-z][a-z-]+$/;
			$store_words{$_}.="${synonym_code}_$accepted_code " unless $seen{"$_$accepted_code$synonym_code"}++;
		}
	}
}
open(OUT, ">name_list_for_search") || die;
foreach(sort(keys(%store_words))){
	$sw=join(" ", sort {$a <=> $b} (split(/ /,$store_words{$_})));
#print "$_: $store_words{$_}\n";
	print OUT  "$_: $sw\n";
}
#<a href="/cgi-bin/get_IJM.pl?tid=11537">	Abronia alpina</a><br>
#<a href="/cgi-bin/get_IJM.pl?tid=8780">	Abronia gracilis*</a> (under Abronia)<br>
__END__
IJM_index_A.html
IJM_index_B.html
IJM_index_C.html
IJM_index_D.html
IJM_index_E.html
IJM_index_F.html
IJM_index_G.html
IJM_index_H.html
IJM_index_I.html
IJM_index_J.html
IJM_index_K.html
IJM_index_L.html
IJM_index_M.html
IJM_index_N.html
IJM_index_O.html
IJM_index_P.html
IJM_index_Q.html
IJM_index_R.html
IJM_index_S.html
IJM_index_T.html
IJM_index_U.html
IJM_index_V.html
IJM_index_W.html
IJM_index_X.html
IJM_index_Y.html
IJM_index_Z.html
