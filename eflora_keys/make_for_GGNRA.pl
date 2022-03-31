#make taxon id hashes
open(IN, "/Users/Shared/Jepson-Master/Jepson-eFlora/synonymy/input/smasch_taxon_ids.txt") || die;
while(<IN>){
	chomp;
	s/X /&times;/;
	($smasch_code,$smasch_name,@residue)=split(/\t/);
	$TID{$smasch_name}=$smasch_code;
	$TNOAN{$smasch_code}=$smasch_name;
}
close(IN);

#add taxon_ids to the accepted names file. Print as new file
open (OUT, ">output/accepted_names_with_tids.txt") || die;
open (ENDEM, ">output/eFlora_endemic_name_list.txt") || die;
open (OUT2, ">output/eFlora_name_list_tids.txt") || die;
open (OUT3, ">/Users/Shared/Jepson-Master/CCHV2/bulkload/input/CCH1_hash_files/CDL_name_to_code.txt") || die;

open(IN, "output/accepted_names.out") || die;
Record: while(<IN>){
	chomp;
	@columns=split(/\t/,$_,100);
	
	#$noauth_name=$columns[8];
	$noauth_name=$columns[9]; #use this if the Zero column is a the value '0' that is needed for the cgi script's version
#	foreach ($noauth_name) {
#		s/ nothosubsp\. / subsp. /; #because Centaurea jacea nothosubsp. pratensis in eFlora = subsp. pratensis in taxon id file--deleted this is no longer the case
#	}
	#$taxon_id=$TID{$noauth_name};
	++$count;
	print OUT join("\t",$TID{$noauth_name},@columns[1 .. $#columns]),"\n";
	print OUT2 join("\t",$TID{$noauth_name},$noauth_name),"\n";
	print OUT3 join(" ",$noauth_name,$TID{$noauth_name},),"\n";
}
close (IN);
close (OUT);
close (OUT2);
close (OUT3);

#DBaxter note: creates file GGNRA with rarity and flowering period keyed to tid. 
#Adapted from eflora_getter.pl and I should probably refactor subroutines into a perl module

$/=""; #this function indicates the record delimiter. In this case, an empty line

open(OUT, ">output/GGNRA.txt") || die;
open(ERR, ">output/GGNRA_error_log.txt") || die;
print OUT "taxon_id\ttaxon_name\trarity\tflowering_period\n";

open(IN,"/Users/Shared/Jepson-Master/Jepson-eFlora/eflora_database/input/eflora_treatments.txt") || die;
while(<IN>){
     next if m/^#/; #skip lines that are commented out
     next if m/^Admin/;	#skip lines that start with Admin
     
	$temp_name = &get_taxon_name($_);
	$rarity = &get_rarity($_);
	$flow_per = &get_flowering($_);
	$nativity = &get_native_status($_);
	my $bioregional_distribution = &get_bioregion($_);
	my $outside_CA = &get_outside_CA($_);
	my $endem;


#Process accepted names to match with accepted name list and TIDs

if ($taxon_name =~ m/ENCELIA farinosa A\. Gray ex Torr\. &times; E\. frutescens/){ #the spontaneous hybrid is kluged because there is only one and it's awkward
	$name = "Encelia farinosa X Encelia frutescens";
	$full_formatted_display_name = "<i>Encelia farinosa</i> &times; <i>Encelia frutescens</i>";
	$tid = "100435";
}
else{

	$temp_name=~s/&times;/X /;
	$temp_name=~s/ f\. ex A\. Gray//;#get rid of filial name for Verbesina that is causing strip name failure
	$taxon_name=ucfirst(lc($temp_name));
	$taxon_name =~ s/  +/ /g;

#print "$taxon_name\n";

	$name=&strip_nameEF($taxon_name); #this removes species authors from single infras
	
	$tid = $TID{$name};
	
	next unless &is_terminal_taxon($_); #skip it unless it is a terminal taxon
	
}

#Notes on the MAJOR ERROR in old code.  It has been present in this script since it was first created, and has been overlooked
#Non-terminal taxon names, like Prunella vulgaris are getting labeled as "endemic" because they dont have this line
#Prunella vulgaris is not native, therefore cannot be endemic
#it also has two subtaxa that are non-native and not endemic, therefore the species entry cannot be endemic
#Salvia dorrii is a native and the species is getting labeled as endemic.
#it has three subtaxa, all of which are not endemic, therefore the species cannot be endemic.
#species that have two or more subtaxa where one subtaxon is endemic and others are not, are getting labeled as endemic
#even species where one one subtaxon is in California and it is endemic, the species entry, if present, should not be labeled as endemic since there should be subtaxa outside of CA
#this oversight is pervasive and has been happening for some time.  multiple places in this code and most other eflora scripts need to be altered, essentially wherever endemic is calculated based on
#presence of these text lines

#also, the old code would add endemic to Naturalized taxa that do not have a OUTSIDE CA line. These are mostly escaped cultivars
#We only want Native taxa as endemic.
#we also want to exclude the NATIVE or NATURALIZED taxa.

	#if(($outside_CA !~ m/^ *$/)){ 
	#	print  "$outside_CA\n" unless $seen{$outside_CA}++;
	#}
	
	if(($outside_CA =~ m/NULL/)){ 
		print ERR "OUT NULL: $name\t$nativity\t$outside_CA\t$bioregional_distribution\n";
	}	

	#if(($outside_CA =~ m/^ *$/)){ 
	#	print  "OUT blank: $name\t$outside_CA\t$bioregional_distribution\n";
	#}

	#if(($bioregional_distribution !~ m/^ *$/)){ 
	#	print  "$bioregional_distribution\n" unless $seen{$bioregional_distribution}++;
	#}
	
	if(($bioregional_distribution =~ m/NULL/)){ 
		print ERR "CA NULL: $name\t$nativity\t$outside_CA\t$bioregional_distribution\n";
	}
	
	#if(($bioregional_distribution =~ m/^ *$/)){ 
	#	print  "CA blank: $name\t$outside_CA\t$bioregional_distribution\n";
	#}
	
			if(($outside_CA !~ m/NULL/) && ($bioregional_distribution !~ m/NULL/)){  
				#If there is a OUTSIDE CA line and a BIOREGIONAL LINE, set endemicity to 0; SQL adds values for empty or missing lines as NULL
				$endem = "0";
				print ERR "NOT ENDEMIC: $name\t$nativity\n";
				++$not_count1;
			}
			elsif (($outside_CA =~ m/NULL/) && ($bioregional_distribution =~ m/NULL/)){  
				#if there is neither an OUTSIDE CA line and a BIOREGIONAL LINE, set endemicity to 0
				#these are mostly binomial name entry that have 2 or more, separate subtaxa entries in california
				#the '..' are in here without '?' because there are no OUTSIDE CA lines that are blank entries, any that are blank are errors that need to be fixed
				$endem = "0";
				print ERR "NOT ENDEMIC: $name\t$nativity\n";
				++$not_count2;
			}
			elsif (($outside_CA !~ m/NULL/) && ($bioregional_distribution =~ m/NULL/)){  
				#if there is an OUTSIDE CA line but not a BIOREGIONAL LINE, set endemicity to 0
				#these are mostly binomial name entry that have 2 or more, separate subtaxa entries in california
				#the '..' are in here without '?' because there are no OUTSIDE CA lines that are blank entries, any that are blank are errors that need to be fixed
				$endem = "0";
				print ERR "NOT ENDEMIC: $name\t$nativity\n";
				++$not_count3;
			}
			elsif (($outside_CA =~ m/NULL/) && ($bioregional_distribution !~ m/NULL/)){ 
				#records of Native taxa with only a BIOREGION line are the only names that should be marked as endemic.
				if ($nativity =~ m/^\'NATIVE\'$/){
					#if the taxon is Native and there is not an OUTSIDE CA line, but a BIOREGIONAL LINE is present, set endemicity to 1
					$endem = "1";
					print ERR "ENDEMIC: $name\t$nativity\n";
					++$endem_count;
				}
				elsif ($nativity =~ m/^\'NATIVE OR /){
					$endem = "0";
					print ERR "NOT ENDEMIC: $name\t$nativity\n";
					++$not_count4;
				}
				elsif ($name =~ m/^(Salsola ryanii|Pelargonium [Xx] hortorum|Pterocarya stenoptera|Allium cepa)$/){
					#Salsola ryanii, Pelargonium x hortorum, Pterocarya stenoptera, Allium cepa
					#all have been counted as Endemic, but should not be.
					#this excludes them from counts
					$endem = "0";
					print ERR "NOT ENDEMIC: $name\t$nativity\n";
					++$not_count5;
				}
				else {
					print "$name==>NAT:$nativity==>CA: $bioregional_distribution==>OUT: $outside_CA\t1. PROBLEM TAXON, CHECK DIST and BIOREG line in eflora_treatments\n";
					$endem="";
					++$prob1;
				}
			}
			else{
				print "$name==>NAT:$nativity==>CA: $bioregional_distribution==>OUT: $outside_CA\t2. PROBLEM TAXON, CHECK DIST and BIOREG line in eflora_treatments\n";
				$endem="";
				++$prob2;
			}

	if ($endem =~ m/^1$/){
		print ENDEM "$name\n";
	}
	
	print OUT "$tid\t$name\t$rarity\t$flow_per\t$nativity\t$endem\n";
}
close (IN);

print "TOTAL EFLORA TAXA (GGNRA): $count\n";

print "TOTAL ENDEMIC EFLORA TAXA (GGNRA): $endem_count\n";

print <<EOP;

NOT ENDEMIC(1): $not_count1
NOT ENDEMIC(2): $not_count2
NOT ENDEMIC(3): $not_count3
NOT ENDEMIC(4): $not_count4
NOT ENDEMIC(5): $not_count5

Problem Names(1): $prob1
Problem Names(2): $prob2
EOP

sub get_taxon_name {
    my $par = shift; #each paragraph is separated by a blank line
    @lines=split(/\n/,$par); #the array of lines within a paragraph are values separated by a new line
	if($lines[1]=~/^(POSSIBLY IN CA|CULTIVATED PLANT|WAIF|EXTIRPATED ALIEN|EXTIRPATED WAIF|EXTIRPATED WEED|EXTIRPATED|HISTORICAL WAIF|SPONTANEOUS HYBRID|AGRICULTURAL WEED|GARDEN WEED|URBAN WEED|GARDEN AND URBAN WEED|AGRICULTURAL, GARDEN, OR URBAN WEED|URBAN WEED EXPECTED IN WILDLANDS)/){
        return $lines[2]; #elsif the second line starts with any of the above values, the name is what's on the third line
		#ASCLEPIAS curassavica is also an anomaly here as Line 0 is UNABRIDGED and Line 1 CULTIVATED PLANT
		#this was also not parsing correctly in the old way
    }
    elsif( $lines[0]=~/^WAIF/){ #if the first line starts with...
        return $lines[1]; #the name is what's on the second line
    }
    elsif( $lines[0]=~/^(NATIVE|NATURALIZED)/){ #if the first line starts with...
        return $lines[1]; #the name is the contents of the second line
        #The name for Zeltnera arizonica is on line 2, Line 0 is NATIVE and line 1 is EXTIRPATED
        #in the old code, this was first as 'if', but Zeltnera arizonica was always and error, 
        #since line 1 is not the name
    }
    elsif($lines[0]=~/UNABRIDGED/){ #elsif the first line starts contains "UNABRIDGED"
        return $lines[1]; #the name is what's on the second line
    }
    elsif( $lines[0]=~/^[A-Z][A-Z][A-Z]/){ #elsif the first line starts with three capital letters...
        return $lines[0] #the name is what's on the first line
    }
    else{ #otherwise...
        return "NULL"; #don't return anything for that paragraph
    }
}

sub get_rarity {
		my $par = shift;
		if($par=~/\HRARITY STATUS: SYMBOL 1/){
			return "CNPS List";
		}
		else {
			return "";
		}
}

sub get_flowering {
		my $par = shift;
		if($par=~/\HFLOWERING TIME: *(.*)/){
			return $1;
		}
		else{
			return "";
		}
}

sub is_terminal_taxon {
        my $par = shift;
        return 1 if $par=~ m/BIOREGIONAL DISTR/;
}

sub get_native_status {
    my $par = shift; #each paragraph is separated by a blank line
    @lines=split(/\n/,$par); #the array of lines within a paragraph are values separated by a new line
    if( $lines[0]=~/^WAIF/){ #if the first line starts with...
        return "\'$lines[0]\'"; #the nativity is that line value
    }
    elsif($lines[1]=~/^(POSSIBLY IN CA|WAIF|EXTIRPATED ALIEN|EXTIRPATED WAIF|EXTIRPATED WEED|EXTIRPATED|HISTORICAL WAIF|SPONTANEOUS HYBRID|AGRICULTURAL WEED|GARDEN WEED|URBAN WEED|GARDEN AND URBAN WEED|AGRICULTURAL, GARDEN, OR URBAN WEED|URBAN WEED EXPECTED IN WILDLANDS)/){
        return "\'$lines[1]\'";
    } 
    elsif( $lines[0]=~/^(NATIVE|NATURALIZED)/){ #if the first line starts with...
        return "\'$lines[0]\'"; #the name is the contents of the second line
    }
    else {
    	return "NULL";
    }
}

sub get_bioregion {
		my $par = shift;
		if($par=~/\HUNABRIDGED BIOREGIONAL DISTRIBUTION: *(.+)/){ 
		#select unabridged distribution line when present, theoretically this should have everything that the normal BIO DIST line has
		#there is currently only one case of this and it has same regions on both lines
			return "\'$1\'";
		}
		elsif($par=~/\HBIOREGIONAL DISTRIBUTION: *(.+)/){
			return "\'$1\'";
		}
		else{
		return "NULL";
		}
}

sub get_outside_CA {
		my $par = shift;
        if($par=~ m/\HUNABRIDGED DISTRIBUTION OUTSIDE CALIFORNIA: *(.+)/){
                return "\'$1\'";
        }
        elsif($par=~ m/\HDISTRIBUTION OUTSIDE CALIFORNIA: *(.+)/){
                return "\'$1\'";
        }
        else{
                return "NULL";
        }
}

sub strip_nameEF{
local($_) = @_;

if(m/(Encelia californica)( ?.* ?Encelia farinosa)/){
	return($1);
		warn "Hybrid modified\t$_";
	&log_change ("TAXON CCH.pm: Hybrid modified\t$scientificName\t$id\n");
}
if(m/(Encelia farinosa)( ?.* ?Encelia frutescens)/){
	return($1);
		warn "Hybrid modified\t$_";
	&log_change ("TAXON CCH.pm: Hybrid modified\t$scientificName\t$id\n");
}
if(m/(Aloe saponaria)( ?.* ?A.* striata.*)/){
	return($1);
		warn "Hybrid modified\t$_";
	&log_change ("TAXON CCH.pm: Hybrid modified\t$scientificName\t$id\n");
}

#Lotus argophyllus (A. Gray) Greene var. ornithopus (Greene) Ottley X L. dendroideus (Greene) Greene var. traskiae (Noddin) Isely
if(m/^Lotus argophyllus \(A\. Gray\) Greene var\. ornithopus \(Greene\) Ottley X L\. /){
	s/^Lotus argophyllus ?.* ?var. ornithopus ?.*/Lotus argophyllus var. ornithopus/;
	warn "Hybrid modified\t$_";
	&log_change ("TAXON CCH.pm: Hybrid modified\t$scientificName\t$id\n");
}

if(m/^Fragaria ?.* ?ananassa Duchesne var. cuneifolia ?.*/){
	s/^Fragaria ?.* ?ananassa Duchesne var. cuneifolia ?.*/Fragaria X ananassa var. cuneifolia/;
	warn "Hybrid modified\t$_";
	&log_change ("TAXON CCH.pm: Hybrid modified\t$scientificName\t$id\n");
}	
#if(m/^Aplopappus/){	
#	s/^Aplopappus /Haplopappus /;
#	warn "Genus modified\t$_";
#	&log_change ("Genus modified\t$scientificName\t$id\n");
#}
#encelioides (Cav.) Benth. & Hook. f. ex A. Gray subsp. exauriculata
s/Hook\. f\. ex A\. Gray/Hook. filius ex A. Gray/i;

s/"//g;
$_=ucfirst($_);

s/\?//g;

#s/Uva-Ursi pechoensis.*/Uva-Ursi pechoensis/;
s/ spp\./ subsp./;
s/ssp\./subsp./;
s/ ssp / subsp. /;
s/ subsp / subsp. /;
s/ var / var. /;
s/ var. $//;
s/ sp\..*//;
s/ sp .*//;
s/ ?[Uu]ndet\.?.*//;
s/ ?[Ii]ndet\.?.*//;
s/  +/ /g;
s/^ +//;
s/ +$//;

s/ aff\. / /;
s/ cf\. / /;
s/ c\. *f\.? / /;

#add additional 'filial' authorities at this point so they parse correctly, JAA
s/Ait\. f\./Ait. filius/g;
s/Backh\. f\./Backh. filius/g;
s/Baker f\./Baker filius/g;
s/Bakh\. f\./Bakh. filius/g;
s/Balf\. f\./Balf. filius/g;
s/Burm\. f\./Burm. filius/g;
s/Brunner,? f\./Brunner filius/g;
s/Celakovsky f\./L.F. Celak./g;
s/Delar\. f\./Delar. filius/g;
s/Forst\. f\./Forst. filius/g;
s/Gaertn\. f\./Gaertn. filius/g;
s/Gagnaire f\./Gagnaire filius/g;
s/Haage f\./Haage filius/g;
s/Haller f\./Haller filius/g;
s/Hallier f\./Hallier filius/g;
s/Harr\. f\./Harr. filius/g;
s/Hedw\. f\./Hedw. filius/g;
s/Hirats\. f\./Hirats. filius/g;
s/Hook\. f\./Hook. filius/g;
s/Hooker f\./Hooker filius/g; #some people dont abbreviate Hooker
s/Jacq\. f\./Jacq. filius/g;
s/Kickx f\./Kickx filius/g;
s/Kampm\. f\./Kampm. filius/g;
s/Keng f\./Keng filius/g;
s/Klokov f\./Klokov filius/g;
#s/L\. f\. sulcat/f. sulcat/g;

s/L\. f\. var./L. filius var./g;
s/L\. f\. subsp./L. filius subsp./g;
s/L\. f\./L. filius/g;
s/L\. *filius azure/L. f. azure/g; #fix special cases where L. f. is a forma name not filius, Anagallis arvensis L. f. azurea Hyl.
s/L\. *filius vine/L. f. vine/g; #fix special cases where L. f. is a forma name not filius, Allium vineale L. f. vineale
s/L\. *filius comp/L. f. comp/g; #fix special cases where L. f. is a forma name not filius, Allium vineale L. f. compactum L.
s/L\. *filius tome/L. f. tome/g; #fix special cases where L. f. is a forma name not filius, Acer rubrum L. f. tomemtosum L. 
s/L\. *filius sang/L. f. sang/g; #fix special cases where L. f. is a forma name not filius, Acer negundo L. f. sanguineum L. Martin
s/L\. *filius masc/L. f. masc/g; #fix special cases where L. f. is a forma name not filius, Orchis morio L. f. mascula L.
s/L\. *filius lute/L. f. lute/g; #fix special cases where L. f. is a forma name not filius, Ophrys insectifera L. f. luteomarginata L. Lewis
s/L\. *filius micr/L. f. micr/g; #fix special cases where L. f. is a forma name not filius, Jasminum humile L. f. microphyllum L.C. Chia
s/L\. *filius sask/L. f. sask/g; #fix special cases where L. f. is a forma name not filius, Carex capillaris L. f. saskatschewana (Boeckeler) L.H. Bailey
s/L\. *filius negl/L. f. negl/g; #fix special cases where L. f. is a forma name not filius, Celtis occidentalis L. f. neglecta L.
s/L\. *filius duri/L. f. duri/g; #fix special cases where L. f. is a forma name not filius, Eryngium campestre L. f. duriberum L.
s/L\. *filius glab/L. f. glab/g; #fix special cases where L. f. is a forma name not filius, Dioscorea villosa L. f. glabrata L.
s/L\. *filius prae/L. f. prae/g; #fix special cases where L. f. is a forma name not filius, Silphium trifoliatum L. f. praecisum L.M. Perry
s/L\. *filius pinn/L. f. pinn/g; #fix special cases where L. f. is a forma name not filius, Quercus alba L. f. pinntifida L.
s/L\. *filius sulc/L. f. sulc/g; #fix special cases where L. f. is a forma name not filius, Zostera marina L. f. sulcatifolia Setchell
s/L\. *filius pinn/L. f. vill/g; #fix special cases where L. f. is a forma name not filius, Cardiospermum corindum L. f. villosum (Mill.) Radlk
s/Lestib\. f\./Lestib. filius/g;
s/Lindb\. f\./Lindb. filius/g;
s/Lindm\. f\./Lindm. filius/g;
s/Luer f\./Luer filius/g;
s/Michx\. f\./F. Michx./g;
s/Michaux f\./F. Michx./g;
s/Occhioni f\./Occhioni filius/g;
s/Pearsall f\./Pearsall filius/g;
s/Phil\. f\./Phil. filius/g;
s/Rchb\. f\./Rchb. filius/g;
s/Rech\. f\./Rech. filius/g;
s/Rehb\. f\./Rehb. filius/g;
s/Reichenb\. f\./Reichenb. filius/g;
s/Reichenbach f\./Reichenbach filius/g;
s/Scheuchzer f\./Scheuchzer filius/g;
s/Schultes f\./Schultes filius/g;
s/Schult\. f\./Schult. filius/g;
s/Wallr\. f\./Wallr. filius/g;
s/Wendl\. f\./Wendl. filius/g;



#s/^([A-Z][A-Za-z]+) (X?[-a-z]+).*? (subvar\.|subsp\.|ssp\.|var\.|subvar\.|f\.|nothosubsp\.) ([-a-z]+).*/$1 $2 $3 $4/ ||
#s/^([A-Z][A-Za-z]+) X ([-a-z]+) .+/$1 X $2/||
#s/^([A-Z][A-Za-z]+) × ?([-a-z]+) .+/$1 X $2/||
#s/^([A-Z][A-Za-z]+) × ?([-a-z]+)/$1 X $2/||
#s/^([A-Z][A-Za-z]+) (X?[-a-z]+) .+/$1 $2/||
#s/^([A-Z][A-Za-z]+) (indet\.|sp\.)/$1 indet./||
#s/^([A-Z][A-Za-z]+) (X?[-a-z]+)/$1 $2/||
#s/^([A-Z][A-Za-z]+) (X [-a-z]+)/$1 $2/||
#s/^X (A-Z][a-z]+) ([-a-z]+) (.+)/X $2 $3/||
#s/^([A-Z][A-Za-z]+) (.+)/$1/;
#s/ssp\./subsp./;
#s/ +$//;

s/^([A-Z][A-Za-z-]+) ([-a-z]+) .* (subvar\.|subsp\.|var\.|f\.|nothosubsp\.) ([-a-z]+) .*/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z-]+) ([-a-z]+) .* (subvar\.|subsp\.|var\.|f\.|nothosubsp\.) ([-a-z]+)/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z-]+) ([-a-z]+) (subvar\.|subsp\.|var\.|f\.|nothosubsp\.) ([-a-z]+) .*/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z-]+) ([-a-z]+) (subvar\.|subsp\.|var\.|f\.|nothosubsp\.) ([-a-z]+)/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z-]+) [×Xx] ([-a-z]+) .+/$1 X $2/||
s/^([A-Z][A-Za-z-]+) [×Xx] ([-a-z]+)/$1 X $2/||
s/^([A-Z][A-Za-z-]+) ×([-a-z]+) .+/$1 X $2/||
s/^([A-Z][A-Za-z-]+) ×([-a-z]+)/$1 X $2/||
s/^([A-Z][A-Za-z-]+) ([-a-z]+) .+/$1 $2/||
s/^([A-Z][A-Za-z-]+) ([-a-z]+)/$1 $2/||
s/^([A-Z][A-Za-z-]+) (X [-a-z]+)/$1 $2/||
s/^X ([A-Z][a-z-]+) ([-a-z]+) (.+)/X $1 $2/||
s/^X ([A-Z][a-z-]+) ([-a-z]+)/X $1 $2/||
s/  +/ /;
s/ +$//;


s/,.+$//; #delete misappl. orth. var. etc artifacts from names

#print "$_ \n";
$_;
}