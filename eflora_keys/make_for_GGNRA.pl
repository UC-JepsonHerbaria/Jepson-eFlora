#make taxon id hashes
open(IN, "/Users/davidbaxter/DATA/smasch_taxon_ids.txt") || die;
while(<IN>){
	chomp;
	s/X /&times;/;
	($smasch_code,$smasch_name,@residue)=split(/\t/);
	$TID{$smasch_name}=$smasch_code;
	$TNOAN{$smasch_code}=$smasch_name;
}
close(IN);

#add taxon_ids to the accepted names file. Print as new file
open (OUT, ">accepted_names_with_tids.txt") || die;
open (OUT2, ">eFlora_name_list_tids.txt") || die;
open(OUT3, ">/Users/davidbaxter/DATA/bulkload_data/CDL_name_to_code.in") || die;

open(IN, "/Users/davidbaxter/DATA/eflora/accepted_names.out") || die;
Record: while(<IN>){
	chomp;
	@columns=split(/\t/,$_,100);
	
	$noauth_name=$columns[8];
		#$noauth_name=$columns[9]; #use this if the Zero column is a the value '0' that is needed for the cgi script's version
#	foreach ($noauth_name) {
#		s/ nothosubsp\. / subsp. /; #because Centaurea jacea nothosubsp. pratensis in eFlora = subsp. pratensis in taxon id file--deleted this is no longer the case
#	}
	#$taxon_id=$TID{$noauth_name};
	print OUT join("\t",$TID{$noauth_name},@columns[1 .. $#columns]),"\n";
	print OUT2 join("\t",$TID{$noauth_name},$noauth_name),"\n";
	print OUT3 join(" ",$noauth_name,$TID{$noauth_name},),"\n";
}
close (IN);
close (OUT);
close (OUT2);
close (OUT3);

#create file with rarity and flowering period keyed to tid. Adapted from eflora_getter.pl and I should probably refactor subroutines into a perl module


#as such, it needs to be designated after the TID file is processed
$/=""; #this function indicates the record delimiter. In this case, an empty line

open(IN, "/Users/davidbaxter/DATA/eflora/eflora_treatments.txt") || die;
open(OUT, ">/Users/davidbaxter/DATA/eflora/GGNRA.txt") || die;
print OUT "taxon_id\ttaxon_name\trarity\tflowering_period\n";
while(<IN>){
     next if m/^#/; #skip lines that are commented out
     next if m/^Admin/;	#skip lines that start with Admin
     
	$taxon_name=&get_taxon_name($_);
	$rarity = &get_rarity($_);
	$flow_per=&get_flowering($_);

	if ($taxon_name =~ /([^ ]+) (.*)/){ #titlecase the genus, keep rest intact
		$genus = ucfirst(lc($1));
		$rest = $2;
		$taxon_name = "$genus $rest";
	}

$taxon_name=&strip_name($taxon_name); #this removes species authors from single infras
	
	$tid = $TID{$taxon_name};
	
	next unless &is_terminal_taxon($_); #skip it unless it is a terminal taxon
	
	print OUT "$tid\t$taxon_name\t$rarity\t$flow_per\n";
}
close (IN);

sub get_taxon_name {
    my $par = shift; #each paragraph is separated by a blank line
    @lines=split(/\n/,$par); #the array of lines within a paragraph are values separated by a new line
    if( $lines[0]=~/^NATIVE|NATURALIZED/){ #if the first line starts with...
        return $lines[1]; #the name is the contents of the second line
    }
    if( $lines[0]=~/^WAIF/){ #if the first line starts with...
        return $lines[1]; #the name is what's on the second line
    }
    elsif($lines[1]=~/^(WAIF|AGRICULTURAL WEED|URBAN WEED|EXTIRPATED ALIEN|HISTORICAL WAIF|JFP-4|SPONTANEOUS HYBRID|JFP-8, does not occur in CA|GARDEN AND URBAN WEED|EXTIRPATED WAIF|AGRICULTURAL, GARDEN, OR URBAN WEED|URBAN WEED EXPECTED IN WILDLANDS|JFP-8, accepted name for taxon not occurring in California|JFP-4, URBAN WEED|GARDEN WEED|EXTIRPATED WEED|CULTIVATED PLANT|EXTIRPATED)/){
        return $lines[2]; #elsif the second line starts with any of the above values, the name is what's on the third line
    }
    elsif($lines[0]=~/UNABRIDGED/){ #elsif the first line starts with "UNABRIDGED"
        return $lines[1]; #the name is what's on the second line
    }
    elsif( $lines[0]=~/^[A-Z][A-Z][A-Z]/){ #elsif the first line starts with three capital letters...
        return $lines[0] #the name is what's on the first line
    }
    else{ #otherwise...
        return ""; #don't return anything for that paragraph
    }
}

sub get_rarity {
		my $par = shift;
		if($par=~/RARITY STATUS: SYMBOL 1/){
			return "CNPS List";
		}
		else {
			return "";
		}
}

sub get_flowering {
		my $par = shift;
		if($par=~/FLOWERING TIME: *(.*)/){
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

sub strip_name{
local($_) = @_;
s/^([A-Z][-a-z]+) (X?[-a-z]+).*(subsp\.|ssp\.|var\.|f\.) ([-a-z]+).*/$1 $2 $3 $4/ ||
s/^([A-Z][a-z]+) ([x ]*[-a-z]+).*/$1 $2/;
s/ssp\./subsp./;
return ($_);
}