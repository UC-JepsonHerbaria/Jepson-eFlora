#This script write synonyms and noted names into the main eflora_taxa field
#A lot of the script is written to avoid duplication
#because the same name can be a synonym and noted, or noted and an accepted name, etc.
#(most names in the NOTES fields are accepted names)
#So the script first loads all accepted names into an array
#then prints out the synonyms, skipping any that match accepted names or previously listed synonyms
#then prints out the noted names, skipping any that match accepted names
#We allow noted names to appear multiple times in the search results, under different names
#But if a name is under both SYNONYMS and NOTE in the same entry, it is recorded as a synonym

use BerkeleyDB;
use lib "/JEPS-master/Jepson-eFlora/Modules/";
use CCH;

#Load master taxon list for taxon ID matching
open(IN, "/JEPS-master/Jepson-eFlora/synonymy/input/smasch_taxon_ids.txt") || die;
while(<IN>){
	chomp;
	#s/X /&times;/;
	($smasch_code,$smasch_name,@residue)=split(/\t/);
	$TID{$smasch_name}=$smasch_code;
	$TNOAN{$smasch_code}=$smasch_name;
}
close(IN);

#Load accepted name list generated by main loading script
#then create an "$accepted_name_list" variable used later
my $synfile = "output/EFLORA_tax_syns_list.txt";
my $misapplied_file = "output/EFLORA_misapplied_list.txt";
my $file = "output/accepted_name_list.txt";
open(FILE, "< $file") or die "Can't open $file for read: $!";
my @names;
while (<FILE>) {
	push (@names, $_);
}
$accepted_name_list = join ('$|^',@names);
$accepted_name_list =~ s/\n//g;
$accepted_name_list =~ s/&times;/X /;
close FILE or die "Cannot close $file: $!";


#this function indicates the record delimiter. In this case, an empty line
$/="";

open(OUT, ">output/load_synonymy_table.sql") || die;
open(OUT2, ">$synfile") || die;
open(OUT3, ">$misapplied_file") || die;
open(ERR, ">output/duplicated_synonyms_report.txt") || die;


print OUT2 "#synonym[\t]accepted name\n";
print OUT2 "#Names extracted from the Notes field of the eFlora, many false positives, are culled from this output by make_synonymy_table.pl\n";
print OUT2 "#The following are synonyms of accepted names of CA species in eFlora, abridged and unabridged\n";


print OUT3 "#synonym[\t]accepted name\n";
print OUT3 "#Names extracted from the Notes field of the eFlora, many false positives, are culled from this output by make_synonymy_table.pl\n";
print OUT3 "#The following are misapplied names with the eFlora accepted names\n";

###Loop through to load synonyms into the array, and print them to output
open(IN, "eflora_treatments.txt") || die;
while(<IN>){
     next if m/^#/; #skip lines that are commented out
     next if m/^Admin/;	#skip lines that start with Admin

#Escaping single quotes for SQL insert
	s/'/''/g;

$taxon_name= &get_taxon_name($_);
$syn_string=&get_synonyms($_);
$unabridged_syn_string=&get_unabridged_synonyms($_);

#Process accepted names to match with TIDs
$taxon_name=~s/&times;/X /;
$taxon_name=ucfirst(lc($taxon_name));
$taxon_name=&strip_name($taxon_name);

#No need to clean alternate names for families, since family treatments don't have synonyms

$name_for_matching = $taxon_name;
foreach ($name_for_matching){
	s/ \(.*\)//;
	
}
$taxon_id=$TID{$name_for_matching};
next unless $taxon_id;




#This is to remove some HTML entities which otherwise mess with the semicolon delimiting
#Those in author names don't matter since they are being stripped for searching
$syn_string=~s/&times;/X /g;
$syn_string=~s/&eacute;/e/g;
$unabridged_syn_string=~s/&times;/X /g;
$unabridged_syn_string=~s/&eacute;/e/g;

#Process synonyms as an array
@synonyms=split(/; /,$syn_string,100);

foreach $syn (@synonyms){

		#remove exceptional cases
		#Eriogonum luteolum (Coville) M.E. Jones is ilegitimate, not to be confused with the legitimate Eriogonum luteolum Greene. Skip the illegitimate synonym
		#Eriogonum denudatum (Nutt.) Curran is ilegitimate [=Nemacaulis denudata], not to be confused with the legitimate Eriogonum denudatum Nutt. which is a synonym of Eriogonum elongatum
		if ($syn =~ /^Eriogonum luteolum \(Coville\) M\.E\. Jones|Eriogonum denudatum \(Nutt\.\) Curran/){
			print ERR "exceptional case skipped for synonymy: $syn\n";
			next;
		}

		if ($syn =~ /^Cyanopsis$/){
			print ERR "exceptional case skipped for synonymy: $syn\n";
			next;
		}



	#remove cases where a name is not acually a synonym in the synonym field, it is a misapplied name or an "in part" name, we only want full synonyms here
	#these cases should be noted names instead.
	#this has to be done before stripping to preserve the phrase.
	$stripped = &strip_name($syn);
	if ($syn =~ m/ in part/){ 
		print ERR "synonym is an 'in part' name: $stripped\n";
		 #convert hybrid X to html
		 $stripped=~s/X /&times;/;
	print OUT <<EOP;
INSERT INTO eflora_taxa(ScientificName, NativeStatus, AcceptedNameTID)
VALUES('$stripped', 'Noted Name', $taxon_id)
;

EOP
#then skip the name so it is not in the file as a synonym
	++$skipped{one};
	next;
	}
	elsif ($syn =~ m/ misappl/){ 
		print ERR "synonym is a misapplied name: $stripped\n";
		 #convert hybrid X to html
		 $stripped=~s/X /&times;/;
		
		print OUT3 "$stripped\t$taxon_name\tMISAPPL in EFLORA\n"; 
		 
	print OUT <<EOP;
INSERT INTO eflora_taxa(ScientificName, NativeStatus, AcceptedNameTID)
VALUES('$stripped', 'Noted Name', $taxon_id)
;

EOP
#then skip the name so it is not in the file as a synonym
	++$skipped{one};
	next;
	}	
	
	else{
#process the rest as per normal
		
	if($seen{"$stripped\t$taxon_id"}++){
		++$skipped{one};
		print ERR "synonym repeated within the same entry: $stripped\n";
		next;
	}
	elsif ($stripped =~ /^$accepted_name_list$/){
		print ERR "synonym is an accepted name: $stripped\n";
		next;
	}
	else{
				foreach ($stripped){ #ICPN has some inconsistencies like authors on genus names and other notations that cause problems with strip name, fix these
					#these show up only as a warning in terminal
					s/, Modoc cypress|, Siskiyou cypress//; #delete common name entered into Synonym line
					s/, illeg\.?//; #delete illeg phrase entered into Synonym line
					s/, ined\.?//; #delete ined phrase entered into Synonym line
					s/, orth\.? var\.?//; #delete orthographic phrase entered into Synonym line
					s/, nom\.? nud\.?//; #delete nomen nudum phrase entered into Synonym line
					s/  +/ /;
					s/ +$//;
					s/^ +//;



				}
				
					unless($TID{$stripped}){
						warn "$.-->no code for $syn ==> stripped as $stripped\n";
					}



#Load the synonym name and the accepted name TID into ScientificName and AcceptedNameTID in the eflora_taxa table
#By virtue of having an AcceptedTaxonTID, the webapps know they are not accepted names
#The NativeStatus column is used to differentiate synonyms from noted names


print OUT2 "$stripped\t$taxon_name\tTJM2\n";

		 #convert hybrid X to html
		 $stripped=~s/X /&times;/;

print OUT <<EOP;
INSERT INTO eflora_taxa(ScientificName, NativeStatus, AcceptedNameTID)
VALUES('$stripped', 'Synonym (TJM2)', $taxon_id)
;

EOP
	}

	}
}
#don't print outside this loop, otherwise you get one line per accepted taxon and not one per synonym

#Process synonyms as an array
@unabridgedsynonyms=split(/; /,$unabridged_syn_string,100);

foreach $unabsyn (@unabridgedsynonyms){

		#remove exceptional cases
		#Eriogonum luteolum (Coville) M.E. Jones is ilegitimate, not to be confused with the legitimate Eriogonum luteolum Greene. Skip the illegitimate synonym
		#Eriogonum denudatum (Nutt.) Curran is ilegitimate [=Nemacaulis denudata], not to be confused with the legitimate Eriogonum denudatum Nutt. which is a synonym of Eriogonum elongatum
		if ($syn =~ /^Eriogonum luteolum \(Coville\) M\.E\. Jones|Eriogonum denudatum \(Nutt\.\) Curran/){
			print ERR "exceptional case skipped for synonymy: $syn\n";
			next;
		}
	
		if ($unabsyn =~ /^Cyanopsis$/){
			print ERR "exceptional case skipped for synonymy: $unabsyn\n";
			next;
		}

		if ($unabsyn =~ /not (Juncus nodatus Coville)/){
			print ERR "exceptional case modified as $1 for synonymy: $unabsyn\n";
			$unabsyn = "Juncus nodatus Coville misappl"; #change 'not' to 'misappl' so that is become a noted name and not a synonym
		}

		if ($unabsyn =~ /probably (Opuntia mojavensis) Engelm/){
			print ERR "exceptional case modified as $1 for synonymy: $unabsyn\n";
			$unabsyn = "Opuntia mojavensis";
		}

		if ($unabsyn =~ /Polygonum sect\. Aconogonon Meisn/){
			print ERR "exceptional case skipped for synonymy: $unabsyn\n";
			next;
		}

		if ($unabsyn =~ /Arenaria subg\. Eremogon/){
			print ERR "exceptional case skipped for synonymy: $unabsyn\n";
			next;
		}


	#remove cases where a name is not acually a synonym in the synonym field, it is a misapplied name or an "in part" name, we only want full synonyms here
	#these cases should be noted names instead.
	#this has to be done before stripping to preserve the phrase.
		$unabstripped = &strip_name($unabsyn); #strip the name

	if ($unabsyn =~ /(not | in part| misappl)/){ 
		print ERR "synonym is an misapplied or 'in part' name: $unabstripped\n";
		
		 #convert hybrid X to html
		 $unabstripped=~s/X /&times;/;
		 
	print OUT <<EOP;
INSERT INTO eflora_taxa(ScientificName, NativeStatus, AcceptedNameTID)
VALUES('$unabstripped', 'Noted Name', $taxon_id)
;

EOP
#then skip the name so it is not in the file as a synonym
	++$skipped{one};
	next;
	}
	else{
#process the rest as per normal

	#remove exceptional cases
	#Eriogonum luteolum (Coville) M.E. Jones is ilegitimate, not to be confused with the legitimate Eriogonum luteolum Greene. Skip the illegitimate synonym
	if ($unabstripped =~ /^Eriogonum luteolum$/){
		print ERR "exceptional case skipped for synonymy: $unabstripped\n";
		next;
	}
	
	if($seen_unab{"$unabstripped\t$taxon_id"}++){
		++$skipped{one};
		print ERR "synonym repeated within the same entry: $unabstripped\n";
		next;
	}
	elsif ($unabstripped =~ /^$accepted_name_list$/){
		print ERR "synonym is an accepted name: $unabstripped\n";
	}
	else{
				foreach ($unabstripped){ #ICPN has some inconsistencies like authors on genus names and other notations that cause problems with strip name, fix these
					#these show up only as a warning in terminal
					s/, illeg\.?//; #delete illegitimate phrase entered into Synonym line
					s/, ined\.?//; #delete ined phrase entered into Synonym line
					s/, orth\.? var\.?//; #delete orthographic phrase entered into Synonym line
					s/, nom\.? nud\.?//; #delete nomen nudum phrase entered into Synonym line
					s/  +/ /;
					s/ +$//;
					s/^ +//;
				}
				
					unless($TID{$unabstripped}){
						warn "$.-->no code for $unabsyn ==> stripped as $unabstripped\n";
					}
#Load the synonym name and the accepted name TID into ScientificName and AcceptedNameTID in the eflora_taxa table
#By virtue of having an AcceptedTaxonTID, the webapps know they are not accepted names
#The NativeStatus column is used to differentiate synonyms from noted names
print OUT2 "$unabstripped\t$taxon_name\tunabridged\n";

		 #convert hybrid X to html
		 $unabstripped=~s/X /&times;/;

print OUT <<EOP;
INSERT INTO eflora_taxa(ScientificName, NativeStatus, AcceptedNameTID)
VALUES('$unabstripped', 'Synonym', $taxon_id)
;

EOP
	}

	}
}
#don't print outside this loop, otherwise you get one line per accepted taxon and not one per synonym

++$count_record;
warn "$count_record\n" unless $count_record % 100;

if(m/NOTE:.*_/){
#OUT2 file is not printed to in this loop because these are just mentioned names and not true synonyms.
				s/&times;/X /;

				while(s/_([A-Z][a-z-]+ [a-z-]+)_[^_]+(var\.|subsp\.|nothosubsp\.|f\.) _([a-z-]+)_//){ #underscores (italics indicators) are used to identify names in the notes fields
					$noted_name = "$1 $2 $3";
					$noted_name =~ s/ *$//;
					if ($noted_name =~ /^$accepted_name_list$/){
						print ERR "noted name is an accepted name: $noted_name\n";
					}
					elsif($seen{"$noted_name\t$taxon_id"}++){
						++$skipped{one};
						print ERR "noted name repeated within the same entry: $noted_name\n";
						next;
					}
					else{

		 				#convert hybrid X to html
		 				$noted_name=~s/X /&times;/;

print OUT <<EOP;
INSERT INTO eflora_taxa(ScientificName, NativeStatus, AcceptedNameTID)
VALUES('$noted_name', 'Noted Name', $taxon_id)
;

EOP
					}#don't print outside this loop, otherwise you get one line per accepted taxon and not one per synonym
				}

				while(s/_([A-Z][a-z-]+ [a-z-]+)_//){ #then grab the binomial names from the notes fields.
					$noted_name = "$1";
					if ($noted_name =~ /^$accepted_name_list$/){
						print ERR "noted name is an accepted name: $noted_name\n";
					}
					elsif($seen{"$noted_name\t$taxon_id"}++){
						++$skipped{one};
						print ERR "noted name repeated within the same entry: $noted_name\n";
						next;
					}
					else{
					
						#convert hybrid X to html
		 				$noted_name=~s/X /&times;/;
print OUT <<EOP;
INSERT INTO eflora_taxa(ScientificName, NativeStatus, AcceptedNameTID)
VALUES('$noted_name', 'Noted Name', $taxon_id)
;

EOP
					}
				}
			}
#don't print outside this loop, otherwise you get one line per accepted taxon and not one per synonym
}


############################

sub get_taxon_name {
    my $par = shift; #each paragraph is separated by a blank line
    @lines=split(/\n/,$par); #the array of lines within a paragraph are values separated by a new line
    if( $lines[0]=~/^(NATIVE|NATURALIZED)/){ #if the first line starts with...
        return $lines[1]; #the name is the contents of the second line
    }
    if( $lines[0]=~/^WAIF/){ #if the first line starts with...
        return $lines[1]; #the name is what's on the second line
    }
    elsif($lines[1]=~/^(POSSIBLY IN CA|WAIF|EXTIRPATED ALIEN|EXTIRPATED WAIF|EXTIRPATED WEED|EXTIRPATED|HISTORICAL WAIF|SPONTANEOUS HYBRID|AGRICULTURAL WEED|GARDEN WEED|URBAN WEED|GARDEN AND URBAN WEED|AGRICULTURAL, GARDEN, OR URBAN WEED|URBAN WEED EXPECTED IN WILDLANDS)\n/){
        return $lines[2]; #elsif the second line starts with any of the above values, the name is what's on the third line
    }
    elsif($lines[0]=~/UNABRIDGED/){ #elsif the first line starts with "UNABRIDGED"
        return $lines[1]; #the name is what's on the second line
    }
    elsif( $lines[0]=~/^[A-Z][A-Z][A-Z]/){ #elsif the first line starts with three capital letters...
        return $lines[0] #the name is what's on the first line
    }
    else{ #otherwise...
        return "NULL"; #don't return anything for that paragraph
    }
}



sub get_synonyms {
		my $par = shift;
		if($par =~ /([\H])SYNONYMS: *(.+)/){
			return "$2";
		}
		else {
			return "";
		}
}

sub get_unabridged_synonyms {
		my $par = shift;
		if($par =~ /([\H])UNABRIDGED SYNONYMS: *(.+)/){
			return "$2";
		}
		else {
			return "";
		}
}
