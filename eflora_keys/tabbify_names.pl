#takes input from get_TJM2_names.pl
open(IN, "/Users/richardmoe/4_IJM/post/TJM1_NAMES") || die;
#Abies	magnifica	Andr. Murray	var.	shastensis	Lemmon	PINACEAE
while(<IN>){
chomp;
($genus,$species,$binomial_author,$infra_rank, $infra)=split(/\t/);
$tjm1_name="$genus $species $infra_rank $infra";
$tjm1_name=~s/ssp\./subsp./;
$tjm1_name=~s/  *$//;
$tjm1_name=~s/  / /g;
$TJM1{$tjm1_name}++;
}
$/="";
open(OUT, ">accepted_names.out");
		print OUT  <<EOP;
nativity\tfamily\tgenus\tspecies\tspecies_author\tinfraspecific_rank\tinfraspecific_epithet\tinfraspecific_author\tname_minus_authors\tname_plus_authors\texpanded_name\tsynonyms\tcommon\tTJM1/TJM2\tmajor_clade\tendemicity
EOP
while(<>){
if(s/clade: (.+)\n//){
$clade=$1;
}
if(s/\nendemicity: (.+)//){
$endemicity=$1;
}
if(s/\nnativity: (.+)//){
$nativity=$1;
}
else{
$nativity="";
}
if(s/\nCommon: (.+)//){
$common=$1;
}
else{
$common="";
}
s/ \(Group[^)]+\)//;
s/  +/ /g;
	$genus= $species= $rank= $infra_author=$b_author=$infra=$infra_rank=$nan=$fullname=$ename="";
if(@syn=m/\n(syn.*)/g){
$syn=join("; ",@syn);
s/\n(syn.*)//g;
}
else{
$syn="";
}
	($aname,$ename)=split(/\n/);
	@name_atoms=split(/ +/,$aname);
		($family, $genus, $species)=@name_atoms[0 .. 2];
$genus=ucfirst(lc($genus));
	s/^[^ ]+ //;
#ANACARDIACEAE RHUS integrifolia (Nutt.) Rothr.
#PLANTAGINACEAE KECKIELLA ternata (A. Gray) Straw
#RANUNCULACEAE THALICTRUM sparsiflorum Fisch. & C.A. Mey.
	if(m/^[A-Z][A-Z-]+ [a-z&;-]+ (.*)/ &! m/^.* (var\.|subsp\.|f\.) [a-z]/){
		$b_author=$binomial_author{"$name_atoms[1] $name_atoms[2]"}= join(" ",@name_atoms[3 .. $#name_atoms]);
$nan="$genus $species";
$fullname= "$nan $b_author";
foreach($family, $genus, $species, $b_author, $infra_rank, $infra, $infra_author, $nan, $fullname, $ename){
s/^ *//;
s/ *$//;
s/  +/ /g;
s/ The following.*//;
s/ There are .*//;
s/ If .*//;
s/; proposed.*//;
s/ used for.*//;
s/_//g;
}
if($TJM1{$nan}){
$TJM1="TJM1";
}
else{
$TJM1="TJM2";
}

		print OUT  <<EOP;
$nativity\t$family\t$genus\t$species\t$b_author\t$infra_rank\t$infra\t$infra_author\t$nan\t$fullname\t$ename\t$syn\t$common\t$TJM1\t$clade\t$endemicity
EOP
		$binomial_author{"$name_atoms[1] $name_atoms[2]"}= $b_author;
}
#AUTONYM
elsif(m/^([A-Z][A-Z-]+) ([^ ]+)(.*) (var\.|subsp\.|f\.) \2\b/){
$infra_rank=$4;
$infra=$2;
$b_author=$3;
unless(length($b_author)>1){
		$b_author= join(" ",@name_atoms[5 .. $#name_atoms]);
}
unless(length($b_author)>1){
		$b_author=$binomial_author{"$name_atoms[1] $name_atoms[2]"};
}
unless(length($b_author)>1){
print "NO BA $aname\n";
}
$nan="$genus $species $infra_rank $infra";
$fullname= "$genus $species $b_author $infra_rank $infra";
foreach($family, $genus, $species, $b_author, $infra_rank, $infra, $infra_author, $nan, $fullname, $ename){
s/^ *//;
s/ *$//;
s/  +/ /g;
s/ The following.*//;
s/ There are .*//;
s/ If .*//;
s/; proposed.*//;
s/ used for.*//;
s/_//g;
}
if($TJM1{$nan}){
$TJM1="TJM1";
}
else{
$TJM1="TJM2";
}
				print OUT  <<EOP;
$nativity\t$family\t$genus\t$species\t$b_author\t$infra_rank\t$infra\t$infra_author\t$nan\t$fullname\t$ename\t$syn\t$common\t$TJM1\t$clade\t$endemicity
EOP

		$binomial_author{"$name_atoms[1] $name_atoms[2]"}= $b_author;
}



elsif(m/^([A-Z][A-Z-]+) ([^ ]+)(.*) (var\.|subsp\.|f\.) ([^ ]+) (.*)/){
	$infra_rank=$4;
	$infra=$5;
	$infra_author=$6;
	$b_author=$3;
	unless(length($b_author)>1){
		$b_author=$binomial_author{"$name_atoms[1] $name_atoms[2]"};
		#print "NEW BA $aname\n";
	}
$nan="$genus $species $infra_rank $infra";
$fullname= "$genus $species $b_author $infra_rank $infra $infra_author";

foreach($family, $genus, $species, $b_author, $infra_rank, $infra, $infra_author, $nan, $fullname, $ename){
s/^ *//;
s/ *$//;
s/  +/ /g;
s/ The following.*//;
s/ There are .*//;
s/ If .*//;
s/; proposed.*//;
s/ used for.*//;
s/_//g;
}
if($TJM1{$nan}){
$TJM1="TJM1";
}
else{
$TJM1="TJM2";
}
				print OUT  <<EOP;
$nativity\t$family\t$genus\t$species\t$b_author\t$infra_rank\t$infra\t$infra_author\t$nan\t$fullname\t$ename\t$syn\t$common\t$TJM1\t$clade\t$endemicity
EOP

		$binomial_author{"$name_atoms[1] $name_atoms[2]"}= $b_author;
}
else{
print "$aname\n$_\n\n";
}


}
#	if(m/ (var\.|subsp\.) /){
##ASPLENIACEAE ASPLENIUM trichomanes subsp. trichomanes L.
##OPHIOGLOSSACEAE BOTRYCHIUM simplex var. compositum (Lasch) Milde
#		if($name_atoms[3]=~/(var\.|subsp\.|f\.)/){
#			$infra_rank=$1;
#			$infra_author=join(" ", @name_atoms[5 .. $#name_atoms]);
#			if($species eq $name_atoms[4]){
#				if($binomial_author{"$name_atoms[1] $name_atoms[2]"}){
#					$b_author=$binomial_author{"$name_atoms[1] $name_atoms[2]"};
#				}
#				else{
#					$b_author=$infra_author;
#				}
#				print  <<EOP;
#1
#FAMILY $family
#GENUS $genus
#SPECIES $species
#BINOMIAL AUTHOR $b_author
#RANK $infra_rank
#INFRA $name_atoms[4]
#INFRA AUTHOR 
#
#EOP
#				}
#				else{
#			print  <<EOP;
#2
#FAMILY $family
#GENUS $genus
#SPECIES $species
#BINOMIAL AUTHOR $binomial_author{"$name_atoms[1] $name_atoms[2]"}
#RANK $infra_rank
#INFRA $name_atoms[4]
#INFRA AUTHOR $infra_author
#
#EOP
#				}
##improper authors
#		if($binomial_author{"$name_atoms[1] $name_atoms[2]"}){
#			unless(m/[A-Z][A-Z] ([a-z][a-z]+) .*\1 /){
#				#print join(" ",@name_atoms), "\n";
#			}
#		}
#}
#}
#else{
#		$b_author=join(" ",@name_atoms[3 .. $#name_atoms]);
#		$binomial_author{"$name_atoms[1] $name_atoms[2]"}= join(" ",@name_atoms[3 .. $#name_atoms]);
#	}
