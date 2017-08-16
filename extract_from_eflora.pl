$/="";
open(IN, "eflora_treatments.txt") || die;
while(<IN>){
	next if m/^#/;
	next if m/^Admin/;
	next unless &is_native($_);
	next unless &is_endemic($_);
	next unless &is_terminal_taxon($_);
	$name= &get_taxon_name($_);
	if($name=~/[A-Z] [a-z]/){
		$ecol=&get_ecology($_);
print "$name\t$ecol\n";
	}
}

sub get_taxon_name {
	my $par = shift;
	@lines=split(/\n/,$par);
	if( $lines[0]=~/^NATIVE|NATURALIZED/){
		return $lines[1];
	}
	if( $lines[0]=~/^WAIF/){
		return $lines[1];
	}
	elsif($lines[1]=~/^(WAIF|AGRICULTURAL WEED|URBAN WEED|EXTIRPATED ALIEN|HISTORICAL WAIF|JFP-4|SPONTANEOUS HYBRID|JFP-8, does not occur in CA|GARDEN AND URBAN WEED|EXTIRPATED WAIF|AGRICULTURAL, GARDEN, OR URBAN WEED|URBAN WEED EXPECTED IN WILDLANDS|JFP-8, accepted name for taxon not occurring in California|JFP-4, URBAN WEED|GARDEN WEED|EXTIRPATED WEED|CULTIVATED PLANT)/){
	return $lines[2];
	}
	elsif($lines[0]=~/UNABRIDGED/){
		return $lines[1];
	}
	elsif( $lines[0]=~/^[A-Z][A-Z][A-Z]/){
		return $lines[0]
	}
	else{
		return "";
	}
}

sub is_native {
	my $par = shift;
	return 1 if $par=~ m/NATIVE/;
}

sub is_endemic {
	my $par = shift;
	if($par=~ m/DISTRIBUTION OUTSIDE CALIFORNIA: .../){
		return 0;
	}
	else{
		return 1;
	}
}

sub get_ecology {
	my $par = shift;
	if($par=~/ECOLOGY: *(.*)/){
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
