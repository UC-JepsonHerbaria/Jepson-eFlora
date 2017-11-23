use BerkeleyDB;

open(IN, "/Users/rlmoe/data/taxon_ids/smasch_taxon_ids.txt") || die;
local($/)="\n";
while(<IN>){
	chomp;
	s/X /&times;/;
	($code,$name,@residue)=split(/\t/);
	$TNOAN{$name}=$code;
	$NAN{$code}=$name;
}
$TNOAN{"Centaurea jacea nothosubsp. pratensis"}=93858;
$NAN{93858}="Centaurea jacea nothosubsp. pratensis";
close(IN);

open(IN, "index_full.tmp") || die;
while(<IN>){
	next if m/\*/;
	chomp;
	($genus=$_)=~s/ .*//;
s/&times;/\327 /;
	if($TNOAN{$_}){
		$g_list{$TNOAN{$genus}}.="$TNOAN{$_},";
	}
else{
warn "$_\n";
}
}
tie(%IJM, "BerkeleyDB::Hash", -Filename=>"IJM.hash", -Flags      => DB_CREATE)|| die "Stopped; couldnt open IJM\n";
foreach(keys(%g_list)){
$g_list{$_}="<sp_list>".join(",",sort {$NAN{$a} cmp $NAN{$b}}(split(/,/,$g_list{$_})))."</sp_list>";
print "$NAN{$_}: $g_list{$_}\n";
if($IJM{$_}){
$IJM{$_}.= $g_list{$_};
#$IJM{$_}=~ s/<\/splist>/<\/sp_list>/;
}
else{
print "$NAN{$_}: $g_list{$_}\n";
}
}
