#takes input from get_TJM2_names.pl

open(IN, "/Users/Shared/Jepson-Master/Interchange/input/TJM1_NAMES.txt") || die; #file not updated since 2014, no record how it was created
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

my $LN = 0;

open(OUT, ">output/accepted_names.out");
		print OUT  <<EOP;
LN\tnativity\tfamily\tgenus\tspecies\tspecies_author\tinfraspecific_rank\tinfraspecific_epithet\tinfraspecific_author\tname_minus_authors\tname_plus_authors\texpanded_name\tsynonyms\tcommon\tTJM1/TJM2\tmajor_clade\tendemicity
EOP
open(OUT2, ">output/eFlora_name_list.txt");#creates file for use in KML creation
open(OUT3, ">output/eFlora_names_problems.txt");


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
$common =~ s/ \(Group[^)]+\)//;

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


#kluge for the one problem names
#ENCELIA farinosa &times; E. frutescens
if(m/ENCELIA farinosa &times; /){
	print OUT2 "Encelia farinosa X Encelia frutescens\n";
	print OUT  <<EOP;
$LN\tSPONTANEOUS HYBRID\tASTERACEAE\tEncelia\tfarinosa &times; E. frutescens\t\t\t\t\tEncelia farinosa &times; E. frutescens\tEncelia farinosa &times; E. frutescens\t\t\t\tTJM1\tEUDICOTS\t0
EOP
++$count;
}
#skip the one CULTIVATED PLANT from JFP-9 that has a species page
elsif(m/Asclepias curassavica/i){
	next;

}

#Downingia yina, Astragalus nuttallianus var. austrinus, Astragalus tephrodes var. brachylobus are JFP-8 taxa that are not in California and should not be on the accepted names list
elsif(m/(Downingia yina|Astragalus nuttallianus var\. austrinus|Astragalus tephrodes var. brachylobus)/i){
	next;

}

#ANACARDIACEAE RHUS integrifolia (Nutt.) Benth. & Hook. f. ex Rothr.
#PLANTAGINACEAE KECKIELLA ternata (A. Gray) Straw
#RANUNCULACEAE THALICTRUM sparsiflorum Fisch. & C.A. Mey.
elsif(m/^[A-Z][A-Z-]+ ([^ ]+)(.*)/ &! m/^.* (subvar\.|var\.|subsp\.|f\.|nothosubsp\.) [a-z]/){
	if (m/RHUS integrifolia/){ #fix one problematic 'filius' author name that does not parse correctly
++$count;
		print OUT2	"Rhus integrifolia\n";
		print OUT  <<EOP;
$LN\tNATIVE\tANACARDIACEAE\tRhus\tintegrifolia\t(Nutt.) Benth. & Hook. filius ex Rothr.\t\t\t\tRhus integrifolia\tRhus integrifolia (Nutt.) Benth. & Hook. f. ex Rothr.\t\t\tLEMONADE BERRY\tTJM2\tEUDICOTS\t0
EOP
		}
	else{
++$count;
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
			print OUT2 "$nan\t$TJM1\n";
			print OUT  <<EOP;
$LN\t$nativity\t$family\t$genus\t$species\t$b_author\t$infra_rank\t$infra\t$infra_author\t$nan\t$fullname\t$ename\t$syn\t$common\t$TJM1\t$clade\t$endemicity
EOP
		$binomial_author{"$name_atoms[1] $name_atoms[2]"}= $b_author;
	}
}

#AUTONYM
elsif(m/^([A-Z][A-Z-]+) ([^ ]+)(.*) (var\.|subsp\.|f\.|nothosubsp\.) \2\b/){
++$countBB;
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
	print OUT2 "$nan\t$TJM1\n";
	print OUT  <<EOP;
$LN\t$nativity\t$family\t$genus\t$species\t$b_author\t$infra_rank\t$infra\t$infra_author\t$nan\t$fullname\t$ename\t$syn\t$common\t$TJM1\t$clade\t$endemicity
EOP

	$binomial_author{"$name_atoms[1] $name_atoms[2]"}= $b_author;
}

elsif(m/^([A-Z][A-Z-]+) ([^ ]+)(.*) (var\.|subsp\.|f\.|nothosubsp\.) ([^ ]+) (.*)/){
	if (m/RHUS integrifolia/){ #fix one problematic filius author name that does not parse correctly
++$count;
		print OUT2	"Rhus integrifolia\n";
		print OUT  <<EOP;
$LN\tNATIVE\tANACARDIACEAE\tRhus\tintegrifolia\t(Nutt.) Benth. & Hook. filius ex Rothr.\t\t\t\tRhus integrifolia\tRhus integrifolia (Nutt.) Benth. & Hook. f. ex Rothr.\t\t\tLEMONADE BERRY\tTJM2\tEUDICOTS\t0
EOP
		}
	else{
++$count;
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
	
		print OUT2 "$nan\t$TJM1\n";
		
		print OUT  <<EOP;
$LN\t$nativity\t$family\t$genus\t$species\t$b_author\t$infra_rank\t$infra\t$infra_author\t$nan\t$fullname\t$ename\t$syn\t$common\t$TJM1\t$clade\t$endemicity
EOP

		$binomial_author{"$name_atoms[1] $name_atoms[2]"}= $b_author;
	}
}

else{

	if ($aname !~ m/[A-Z]+ACEAE/i){#skip families
		warn "problems---$aname\n$_\n\n";
		print OUT3 "problems\t$aname\t$_\n";
	}
}


}

print "TOTAL EFLORA TAXA 'Possibly NOT IN CA': $OOCA\n";
print "TOTAL EFLORA TAXA (TABBIFY): $count\n";
print "TOTAL EFLORA TAXA AUTONYM: $countBB\n";
print "TOTAL EFLORA TAXA HYBRID: $countHH\n";
close(IN);
close(OUT);
close(OUT2);
close(OUT3);
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

