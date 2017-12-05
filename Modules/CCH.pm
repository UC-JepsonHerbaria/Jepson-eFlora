##################WARNING#############
#Smasch.pm and CCH.pm both have a subroutine called "load_noauth_name" and a "strip_name"
#the CCH versions should be used
#and ultimately Smasch.pm should be rolled into CCH.pm
#in particular, the Smasch load_noauth_name calls the hash PARENT, where CCH calls it TID

package CCH;
require Exporter;
use Text::Unidecode qw(unidecode);

@ISA = ('Exporter');
@EXPORT = qw(
&munge_collectors 
&prune_fields 
&strip_name 
%cult
%county_code
%max_elev 
%TID 
&is_bad_elev 
&verify_co 
&outside_CA_box  
&dg_to_dc 
&dms2decimal 
&dmsdecimal 
&parse_lat
&parse_long
&is_bad_elev
&get_TRS
&get_elev
%alter 
%exclude 
%LICENSE 
&load_noauth_name 
&check_file 
&parse_CNUM
&atomize_ISO_8601_date
&log_change
&log_skip 
&make_julian_days 
&get_today_julian_day
&check_julian_days
&validate_scientific_name
&month_hash
&get_month_number
&get_institution_acronym
&load_fips
);

###########
#month counting array
our @month= qw(
error
Jan
Feb
Mar
Apr
May
Jun
Jul
Aug
Sep
Oct
Nov
Dec
);
###########

our %vouchers=(
'Habitat'=>52,
'Color'=>50,
'Micromorphology'=>19,
'Macromorphology'=>20,
'Population_biology'=>24,
'Reproductive_biology'=>21,
'Associated_species'=>53,
'Physical_environment'=>66,
'Other_label_numbers'=>55,
'Type_status'=>56,
'Genbank_code'=>45,
'Verbatim_coordinates'=>73,
'Verbatim_elevation'=>74,
'Phenology'=>26,
'Odor'=>43,
'Other_data'=>72
);

#"16","secondary product chemistry",
#"17","cytology",
#"18","embryology",
#"19","micromorphology",
#"20","macromorphology",
#"21","reproductive biology",
#"24","population biology",
#"25","horticulture",
#"26","phenology",
#"27","illustration",
#"28","photograph",
#"29","nomenclature",
#"32","publication",
#"33","data in packet",
#"35","reference used for determination",
#36","none",
#"39","common name",
#"41","Vegetation Type Map Project",
#"43","odor",
#"44","ethnobotany",
#"47","map",
#"50","color",
#"52","habitat",
#"53","associated species",
#"55","other label numbers",
#"58","biotic interactions",
#"56","type",
#"23","biotic environment -inactive 7/93",
#"22","physical environment -inactive 7/93",
#"61","annotation history",
#"62","Expedition",
#"64","fruit removal",
#"65","physical enviroment",
#"66","physical environment",
#"67","SEM (Scanning Electron Micrograph)",
#"63","material removed",
#"15","nucleic acids",
#45","genbank code",
#"71","U.C. Botanical Garden",
#"72","other",
#"73","verbatim coordinates",


our %county_code=(
CAL=>'Calaveras',
ED=>'El Dorado',
LAS=>'Lassen',
NEV=>'Nevada',
PLA=>'Placer',
PLU=>'Plumas',
SAC=>'Sacramento',
SIE=>'Sierra',
SIS=>'Siskiyou',
TUO=>'Tuolumne'
);

our %cult=(
'Abelia X grandiflora'=>'P',
'Abelia floribunda'=>'P',
'Abies chensiensis subsp. salouenensis'=>'P',
'Abies chensiensis var. salouenensis'=>'P',
'Abies chensiensis'=>'P',
'Abies fabri'=>'P',
'Abies firma'=>'P',
'Abies nordmanniana'=>'P',
'Abutilon megapotamicum'=>'P',
'Abutilon pictum'=>'P',
'Acanthus mollis var. latifolius'=>'P',
'Acanthus mollis var. mollis'=>'P',
'Acanthus mollis'=>'P',
'Acer mono'=>'P',
'Aeonium X hybridum'=>'P',
'Aeonium decorum'=>'P',
'Aesculus neglecta'=>'P',
'Agave fourcroydes'=>'P',
'Agave gigantensis'=>'P',
'Agave jaiboli'=>'P',
'Agave patonii'=>'P',
'Agave polyacantha'=>'P',
'Agave tequilana'=>'P',
'Aletris japonica'=>'P',
'Aloe cameronii'=>'P',
'Aloe ukambensis'=>'P',
'Alsophila australis'=>'P',
'Anthyllis barba-jovis'=>'P',
'Antirrhinum molle'=>'P',
'Aristotelia macqui'=>'P',
'Asparagus scandens'=>'P',
'Asparagus virgatus'=>'P',
'Asplenium setisectum'=>'P',
'Athrotaxis cupressoides'=>'P',
'Athrotaxis selaginoides'=>'P',
'Audouinia capitata'=>'P',
'Austrocedrus chilensis'=>'P',
'Azara microphylla'=>'P',
'Berberis gagnepainii'=>'P',
'Blechnum polypodioides'=>'P',
'Boronia megastigma'=>'P',
'Brugmansia versicolor'=>'P',
'Brunfelsia latifolia'=>'P',
'Buddleja globosa'=>'P',
'Callitris cupressiformis'=>'P',
'Cantua buxifolia'=>'P',
'Cantua flexuosa'=>'P',
'Caprifolium conjugiale'=>'P',
'Capsella rubella'=>'P',
'Carlina acaulis'=>'P',
'Castanea crenata'=>'P',
'Cedrus libani'=>'P',
'Cenchrus laniflorus'=>'P',
'Chionanthus retusus'=>'P',
'Chloris pycnothrix'=>'P',
'Chrysanthemum cinerariifolium'=>'P',
'Clematis cirrhosa'=>'P',
'Clematis flammula'=>'P',
'Clematis heracleifolia var. davidiana'=>'P',
'Clematis jackmanii'=>'P',
'Clematis X jackmanii'=>'P',
'Clematis montana'=>'P',
'Cocculus laurifolius'=>'P',
'Conyza sumatrensis'=>'P',
'Cornus capitata'=>'P',
'Cornus florida'=>'P',
'Cornus florida var. rubra'=>'P',
'Cornus paucinervis'=>'P',
'Crassula hystrix'=>'P',
'Crataegus X lavallei'=>'P',
'Cupressocyparis leylandii'=>'P',
'Cyathea mollis'=>'P',
'Cytisus battandieri'=>'P',
'Dacrydium laxifolium'=>'P',
'Dalbergia sissoo'=>'P',
'Daphniphyllum macropodum'=>'P',
'Datura sanguinea'=>'P',
'Dianella revoluta'=>'P',
'Dieffenbachia picta'=>'P',
'Dietes vegeta'=>'P',
'Diospyros austroafricana'=>'P',
'Dorotheanthus bellidiformis'=>'P',
'Drimys winteri'=>'P',
'Enchylaena tomentosa var. glabra'=>'P',
'Enchylaena tomentosa'=>'P',
'Erica mediterranea'=>'P',
'Erica verticillata'=>'P',
'Euphorbia barrelieri'=>'P',
'Euphorbia characias subsp. wulfeni'=>'P',
'Euphorbia characias'=>'P',
'Euphorbia mauritanica'=>'P',
'Felicia bergeriana'=>'P',
'Ficus pumila var. minima'=>'P',
'Furcraea gigantea'=>'P',
'Furcraea foetida'=>'P',
'Geijera parviflora'=>'P',
'Genista X spachiana'=>'P',
'Geranium reuteri'=>'P',
'Goodia lotifolia'=>'P',
'Goniophlebium niponicum'=>'P',
'Grevillea thelemanniana'=>'P',
'Hakea drupacea'=>'P',
'Hakea gibbosa'=>'P',
'Hakea suaveolens'=>'P',
'Hebe elliptica'=>'P',
'Helleborus orientalis var. atrorubens'=>'P',
'Helleborus orientalis var. orientalis'=>'P',
'Helleborus orientalis'=>'P',
'Hibbertia cuneiformis'=>'P',
'Hibbertia volubilis'=>'P',
'Hymenanthera dentata'=>'P',
'Hyoscyamus pusillus'=>'P',
'Jacaranda acutifolia'=>'P',
'Juniperus virginiana'=>'P',
'Kennedia nigricans'=>'P',
'Koelreuteria'=>'P',
'Koelreuteria paniculata'=>'P',
'Lamprocapnos spectabilis'=>'P',
'Leucadendron reflexum'=>'P',
'Lonicera maackii f. podocarpa'=>'P',
'Lonicera maackii'=>'P',
'Lonicera morrowii'=>'P',
'Lophostemon confertus'=>'P',
'Lycium chinense var. inerme'=>'P',
'Lycium chinense'=>'P',
'Mahonia japonica'=>'P',
'Mahonia oiwakensis'=>'P',
'Malephora crocea var. purpureocrocea'=>'P',
'Malephora crocea var. purpureo-crocea'=>'P',
'Mandevilla laxa'=>'P',
'Megalastrum lunense'=>'P',
'Nierembergia coerulea'=>'P',
'Origanum vulgare var. prismaticum'=>'P',
'Osteomeles schwerinae'=>'P',
'Ozothamnus diosmifolius'=>'P',
'Paulownia kawakamii'=>'P',
'Paederia lanuginosa'=>'P',
'Pentas lanceolata var. coccinea'=>'P',
'Pentas lanceolata var. lanceolata'=>'P',
'Pentas lanceolata'=>'P',
'Phaedranthus buccinatorius'=>'P',
'Picea orientalis'=>'P',
'Picea smithiana'=>'P',
'Platycerium bifurcatum'=>'P',
'Pleioblastus humilis var. pumilus'=>'P',
'Podocarpus andinus'=>'P',
'Podocarpus aspleniifolius'=>'P',
'Polystichum setiferum'=>'P',
'Populus nigra var. italica'=>'P',
'Portulaca pilosa var. hortualis'=>'P',
'Pratia angulata'=>'P',
'Prinsepia uniflora'=>'P',
'Prunus mume'=>'P',
'Prunus yedoensis'=>'P',
'Prunus X domestica'=>'P',
'Prunus domestica'=>'P',
'Psoralea pinnata'=>'P',
'Pteris serrulata'=>'P',
'Pyracantha rogersiana'=>'P',
'Rauvolfia sumatrana'=>'P',
'Ranalisma rostrata'=>'P',
'Rhododendron ponticum'=>'P',
'Rorippa officinalis'=>'P',
'Rosa hybrida'=>'P',
'Rhynchospora tenuis'=>'P',
'Sanchezia spectabilis'=>'P',
'Sarcococca hookeriana'=>'P',
'Senecio argentinus'=>'P',
'Senecio chordifolia'=>'P',
'Spiraea cantoniensis'=>'P',
'Sterculia discolor'=>'P',
'Sutera grandiflora'=>'P',
'Sutherlandia frutescens'=>'P',
'Thea sinensis'=>'P',
'Thomasia macrocarpa'=>'P',
'Tilia dasystyla'=>'P',
'Tradescantia blossfeldiana'=>'P',
'Trachelospermum jasminoides'=>'P',
'Viburnum tinus var. lucidum'=>'P',
'Viburnum tinus var. strictum'=>'P',
'Viburnum tinus'=>'P',
'Watsonia meriana var. bulbillifera'=>'P',
'Watsonia meriana'=>'P',
'Wedelia pascalioides'=>'P',
'Widdringtonia cupressoides'=>'P',
'Widdringtonia dracomontana'=>'P',
'X Cupressocyparis leylandii'=>'P',
'Xanthoxalis fontana'=>'P',
'Xylosma congesta'=>'P',
'Zornia reticulata'=>'P',
'Zea diploperennis'=>'P',
'Zygocactus truncatus'=>'P'
);

####patterns######
our $genus = '[A-Z][a-z-]+';
our $species = '[a-z-]+';
our $rank = 'subvar\.?|var\.?|ssp\.?|subsp\.?|f\.|forma|nothosp\.';
our $infra = '[a-z-]+';
our $author = '.*';


open(IN, "/Users/davidbaxter/DATA/collectors_id_new.txt") || die "CCH.pm couldnt open collectors_id_new\n";
while(<IN>){
	chomp;
	($collID,$orig,$standard)=split(/\t/);
	$primary_collector{$orig}=$standard;
	$orig_TID{$orig}=$collID;
	$stand_TID{$standard}=$collID;
	$coll_seen{$orig}++;
}
close(IN);

open(IN, "/Users/davidbaxter/DATA/Interchange/ICPN_accepted.txt") || die "CCH.pm couldnt open ICPN accepted names\n";
while(<IN>){
	chomp;
	($good,@rest)=split(/ /);
	$good =~ s/^([A-Z][a-z]+)/$1/; #for genus
	$include{$good}++;
}
close(IN);

open(IN, "/Users/davidbaxter/DATA/alter_names") || die "CCH.pm couldnt open alter_names\n";
while(<IN>){
	chomp;
	($bad, $good, $AltNote)=split(/\t/);
	$alter{$bad}=$good;
	$Talter{$bad} = "$good\t-$AltNote";
}
close(IN);


open(IN, "/Users/davidbaxter/DATA/orth_var.txt") || die "CCH.pm couldn't open orth_var\n";
while(<IN>){
	chomp;
	($orth, $accept)=split(/\t/);
	$orth_var{$orth}=$accept;
}
close(IN);

open(IN, "/Users/davidbaxter/DATA/nomen_rej.txt") || die "CCH.pm couldn't open illigitimate name file\n";
while(<IN>){
	chomp;
	($rejected, $accepted)=split(/\t/);
	$rej_var{$rejected}=$accepted;
}
close(IN);

open(IN, "/Users/davidbaxter/DATA/mosses") || die "CCH.pm couldnt open mosses for non-vascular exclusion $!\n";
while(<IN>){
	chomp;
	$exclude{$_}++;
s/\W.*//;
	$exclude{$_}++;
}
close(IN);

#load licenses from license file into %LICENSE
my $license_file = '/Users/davidbaxter/DATA/CCH_scripts/data_files/licenses.txt';
my $default_license = 'https://creativecommons.org/licenses/by-nd/4.0/';
open(IN,$license_file) or die "$!\n";
while(<IN>){
	chomp;
	($inst,$license_code)=split(/\t/);
	if ($license_code eq 'CC BY-NC'){
		$license_url = 'https://creativecommons.org/licenses/by-nd/4.0/';
	}
	elsif ($license_code eq 'CC BY'){
		$license_url = 'https://creativecommons.org/licenses/by/4.0/';
	}
	elsif ($license_code eq 'CC0'){
		$license_url = 'https://creativecommons.org/publicdomain/zero/1.0/';
	}
	elsif ($license_code){
		warn "license code $license_code for insitution $inst not recognized; applying default license\n";
		$license_url = $default_license;
	}
	else { #if it is blank in the license file, the inst has not communicated a license so the default license is used
		$license_url = $default_license;
	}
	$LICENSE{$inst}=$license_url;
}
close(IN);

open(IN, "/Users/davidbaxter/DATA/max_county_elev.txt") || die;
while(<IN>){
        @fields=split(/\t/);
        $fields[3]=~s/\+//;
        $fields[3]=~s/,//;
        $max_elev{$fields[1]}=$fields[3];
}
close(IN);

sub log_skip {	#for each skipped item...
	my $log_file = 'log.txt';
	open(my $log_file, '>>', $log_file);
	print $log_file "skipping: @_\n";	#print into the log file "skipping: "+[input]+new line
	close $log_file;
}

sub log_change {	#for each logged change...
	my $log_file = 'log.txt';
	open(my $log_file, '>>', $log_file);
	print $log_file "logging: @_\n";	#print into the ERR file "logging: "+[input]+new line
	close $log_file;
}

sub validate_scientific_name {
#usage: $scientificName=&validate_scientific_name($scientificName);
#given a scientific name without author
#validate that name for CCH
#either returns the scientific name, returns an altered scientific name, or skips the record
	my ($scientificName, $id) = @_;

	unless ($scientificName){ #skip and report id no name
		&log_skip("No name\t$id");
		++$skipped{one};
		next;
	}

	if ($scientificName=~/^No name$/i) {
		&log_skip("TAXON CCH.pm: No name\t$id");
		++$skipped{one};
		next;
	}

	#skip and report if the name matches a genus entry in the "mosses" file
	#note that this should be updated because "mosses" also has binomials
	($genus=$scientificName)=~s/ .*//;
	if($exclude{$genus}){	
		&log_skip("TAXON CCH.pm: Non-vascular plant: $scientificName\t$id",);
		++$skipped{one};
		next;
	}

	#if the name is found in the alter_names table, return the altered name
	if($alter{$scientificName}){
		&log_change ("TAXON CCH.pm: Spelling altered (1) from $scientificName to $Talter{$scientificName}\t--\t$id");
		$scientificName=$alter{$scientificName};
	}
		#if the name is found in the Orthographic variant table, return the Orthographic variant
	if($orth_var{$scientificName}){
		&log_change ("TAXON CCH.pm: Orthographic variant altered (1) from $scientificName to $orth_var{$scientificName}\t--\t$id");
		$scientificName=$orth_var{$scientificName};
	}
	#if the name is found in the nomen_rej table, return the eFlora accepted name
	if($rej_var{$scientificName}){
		&log_change ("TAXON CCH.pm: Name on JFP-1b list (unpublished, invalidly published, illegitimate, or rejected name), $scientificName changed accepted name - $rej_var{$scientificName}\t$id");
		$scientificName=$rej_var{$scientificName};
	}
	unless($TID{$scientificName}){ #if there's no TID matching the name
		$on=$scientificName;
		if($scientificName=~s/subsp\./var./){	#try switching subsp. for var.
			if($TID{$scientificName}){
				&log_change("TAXON CCH.pm: subsp. changed to var. (2) $on changed to $scientificName\t--\t$id");
			}
			elsif ($alter{$scientificName}){	#try using the alter table after switching rank
				&log_change ("TAXON CCH.pm: Spelling and rank altered  (2) from $on to $Talter{$scientificName}\t--\t$id");
				$scientificName=$alter{$scientificName};
			}
			else{ #if that doesn't work, skip it
				&log_skip("TAXON CCH.pm: Not yet entered into SMASCH taxon name table (2)\t$on\t$id");
				++$skipped{one};
				#++$badname{"$on"};
				next;
			}
		}
		elsif($scientificName=~s/var\./subsp./){	#try switching var. for subsp.
			if($TID{$scientificName}){
				&log_change("TAXON CCH.pm: var. changed to subsp. (3): $on changed to $scientificName\t--\t$id");
			}
			elsif ($alter{$scientificName}){	#try using the alter table after switching rank
				&log_change ("TAXON CCH.pm: Spelling and rank altered (3) from $on to $Talter{$scientificName}\t--\t$id");
				$scientificName=$alter{$scientificName};
			}
			else{	#or skip it
				&log_skip("TAXON CCH.pm: Not yet entered into SMASCH taxon name table (3)\t$on\t--\t$id");
				++$skipped{one};
				#++$badname{"$on"};
				next;
			}
		}
		else{ #if none of that works, also skip it.
			&log_skip("TAXON CCH.pm: Not yet entered into SMASCH taxon name table (4)\t$on\t--\t$id");
			++$skipped{one};
			#++$badname{"$on"};
			next;
		}
	}
	return ($scientificName);
}

sub get_today_julian_day {
#this is separated from check_julian_days
#so it doesn't need to be calculated for every record
#usage: add the following line before processing records:
#$today_JD = &get_today_julian_day;
	use Time::JulianDay;
	use Time::ParseDate;
	$today=`date "+%Y-%m-%d"`;
	chomp($today);
	($today_y,$today_m,$today_d)=split(/-/,$today);
	$today_JD=julian_day($today_y, $today_m, $today_d);
	return ($today_JD);
}

sub make_julian_days {
#this subroutine takes year, month, day as inputs, and returns early julian day and late julian day
#it relies on the Time::JulianDay and Time::ParseDate perl modules
#usage: ($EJD, $LJD)=&make_julian_days($YYYY, $MM, $DD, $id);
#year month and day must be formatted as ISO 8601 standard
#e.g. May 10, 2015 would take "2015", "05", "10" as input
#day or month and day may be blank and the range will be calculated
#all three may be blank but output will be null and no warning will be given
#use after &atomize_ISO_8601_date to ensure input is properly formatted
use Time::JulianDay;
use Time::ParseDate;
	my($YYYY, $MM, $DD, $MM2, $DD2, $id)=@_;
	unless ($YYYY || $MM || $DD) { #if there is no date entered, that is fine. Just return nothing
		$EJD=$LJD="";
		return($EJD,$LJD);
		&log_change("DATE CCH.pm (0): $id");
	}
	if ((length($YYYY) == 4) && (length($DD) >=1) && (length($MM) >=1) && (length($MM2) == 0) && (length($DD2) == 0)){ #if all three parts present and there is only 1 Collection Day, calculate accordingly
		$EJD=julian_day($YYYY, $MM, $DD);
		$LJD=$EJD;
		return($EJD,$LJD);
		&log_change("DATE CCH.pm (1): $id");
	}
	
	elsif ((length($YYYY) == 4) && (length($DD) >= 1) && (length($MM) >= 1) && (length($MM2) >= 1) && (length($DD2) >= 1)){ #if all three parts present and there are 2 Collection Days (4 April-6 April 2007), calculate accordingly
		$EJD=julian_day($YYYY, $MM, $DD);
		$LJD=julian_day($YYYY, $MM2, $DD2);
		return($EJD,$LJD);
		&log_change("DATE CCH.pm (2): $id");
	}
	
	elsif((length($YYYY) == 4) && (length($DD) == 0) && (length($MM) >= 1) && (length($MM2) == 0) && (length($DD2) == 0)){	#if only month and year,
		if($MM==12){	#if December, the early day is the 1st and the last day is the 31st
			$EJD=julian_day($YYYY, $MM, 1);	
			$LJD=julian_day($YYYY, $MM, 31);
			return($EJD,$LJD);
			&log_change("DATE CCH.pm (3): $id");
		}
		else{	#else, early day is the first and late day is "the day before the first of next month"
			$EJD=julian_day($YYYY, $MM, 1);
			$LJD=julian_day($YYYY, $MM+1, 1);
			$LJD -= 1;
			return($EJD,$LJD);
			&log_change("DATE CCH.pm (4): $id");
		}
	}
	elsif(length($YYYY) == 4){ #if year only,
		if ((length($DD) == 0) && (length($MM) == 0)) { #and month and day are NULL
			$EJD=julian_day($YYYY, 1, 1);	
			$LJD=julian_day($YYYY, 12, 31);
			return($EJD,$LJD);
			&log_change("DATE CCH.pm (5): $id");
		}
		else {
			$EJD=$LJD="";
			&log_change("DATE CCH.pm Bad DATE format, date has month or day problems ($YYYY-$MM-$DD)\t$id");
			return($EJD,$LJD);
		}
	}
	elsif ((length($YYYY) == 0) && ((length($MM) >= 1) || (length($DD) >= 1))) { 
		$EJD=$LJD="";
		&log_change("DATE CCH.pm: date nulled, month and/or day but no year ($YYYY-$MM-$DD)\t$id");
		return($EJD,$LJD);
	}
	else{
		$EJD=$LJD="";
		&log_change("DATE CCH.pm: date nulled, date contents not parsable ($YYYY-$MM-$DD)\t$id");
		return($EJD,$LJD); #no sense running the following check if dates are null
	}	
}

sub check_julian_days {
#test if julian day makes sense compared to $today_JD
#this subroutine requires today's julian day as an input
#because otherwise it calculates today's JD every time
#Which is much slower
use Time::JulianDay;
	my($EJD, $LJD, $today_JD, $id)=@_;
	my($year,$month,$day)="";
	unless ($EJD && $LJD){
		return($EJD,$LJD); #if there's no date, that's fine, just send it back
	}
	unless ($today_JD){
		die "DATE CCH.pm: stopped because &check_julian_days requires today's julian day. Add the following line before record processing:\n\$today_JD = &get_today_julian_day;\nthen use &check_julian_days function as follows:\n(\$EJD, \$LJD)=&check_julian_days(\$EJD, \$LJD, \$today_JD, \$id);\n"; 
	}
	if ($LJD > $today_JD){	#If $LJD is later than today's JD (calculated at the top of the script)
		($year, $month, $day) = inverse_julian_day($LJD);
		&log_change("DATE CCH.pm: date nulled, $year-$month-$day ($LJD) is later than today's date ($today_JD)\t$id");	#Add this error message to the log, then start a new line on the log...
		$EJD=$LJD="";	#...then null the date
	}
	elsif($EJD < 2378496){	#elsif the year is earlier than 1800-01-01
		($year, $month, $day) = inverse_julian_day($EJD);
		&log_change("DATE CCH.pm: date nulled, $year-$month-$day ($EJD) earlier than 1800\t$id");	#Add this error message to the log, then start a new line on the log...
		#$EJD=$LJD=""; #...then null the date
	}	
	return($EJD,$LJD);
}






sub check_file {
#Check if file is in UTF-16, or has windows line breaks
	if (m/\000.\000/) {
		die "CCH.pm parse failure: you may have a UTF-16 file\n";
	}

	if (m/\cM/)	{
		die "CCH.pm parse failure: check line breaks for ^M\nOr use Save As in TextWrangler to insert Unix line breaks\n";
	}
}

sub is_bad_elev {

our ($elev, $e_units)=@_;
our $Mt_Whitney="4420";
our $Death_Valley="-90";

	if($e_units =~/^[Mm]/){
    		if(($elev > $Mt_Whitney) || ($elev < $Death_Valley)){
			return 1;
			&log_change("ELEV CCH.pm: bad elevation in meters ($elev)");
    		}
	}
	elsif($e_units =~/^[Ff]/){
    		if(($elev_ft > ($Mt_Whitney * 3.2808)) || ($elev_ft < ($Death_Valley * 3.2808))){
			return 1;
			&log_change("ELEV CCH.pm: bad elevation in feet ($elev)");
    		}
    	}
}

sub atomize_ISO_8601_date {
#this subroutine doesn't report, i.e. it doesn't write to the log file if it gets nothing
#that might be useful
	local($_)=shift;
	if (m/(\d{4})-(\d{2})-(\d{2})/){
		return ($1,$2,$3);
	}
	elsif (m/(\d{4})-(\d{2})/){
		return ($1,$2,"");
	}
	elsif (m/(\d{4})/){
		return ($1,"","");
	}
	else {
		return ("","","");
		warn "CCH.pm: date not in ISO 8601 format: $_";
	}	
}

sub parse_CNUM{
#usage: ($prefix, $CNUM,$suffix)=&parse_CNUM($recordNumber);
#takes one collector number field as input
#outputs three values: prefix, numerical collector number, and suffix
#if can't be parsed, the input value is output as a prefix

	local($_)=shift;
	if(m/^ +$/){
		return("","","");
	}
 	s/ *$//;
    s/^ *//;
	if(s| *1/2||){ #CAS has a few of these with a CNUM followed by "1/2" as a suffix
		$SUFFIX="1/2";
	}
	else {$SUFFIX=""}
	
	if(m/^([0-9+])$/){
		return("",$1,"");
	}
    elsif(m/^([0-9+]) (1\/2)/){
    	return("",$1,"$2");
    }
#    elsif(m/^([0-9+])\.([0-9+])$/){
 #   	return("",$1,"\.$2");
  #  }
    elsif(m/^([^0-9]*)([0-9]+)([^0-9]*)$/){
		return("$1",$2,$3);
    }
    elsif(m/^(\d\d+)-(\d+)$/){
		return("",$1,"-$2");
    }

    elsif(m/(.*[12]\d\d\d[^0-9])(\d+)([^0-9]*)/){
		return("$1",$2,$3);
    }
    elsif(m/(.*[-\/ ])(\d+)([^0-9].*)/){
		return("$1",$2,$3);
    }
    elsif(m/([A-Z]+)(\d+)$/){
		return("$1",$2,"");
    }
    elsif(m/([A-Z]+) *(\d+) *([^0-9].*)/){
		return("$1",$2,$3);
    }
    elsif(m/^(\d+) *(.*)/){
    	return("",$1,"$2");
    }
	else{
		return ("$_","","");
		&log_change ("CCH.pm: CNUM '$_' could not be parsed, returning as prefix\n");
	}
}


sub outside_CA_box {
#usage: ($decimalLatitude,$decimalLongitude)=&outside_CA_box($decimalLatitude,$decimalLongitude,$id);
#input a properly formatted decimalLatitude and longitude, or blank values
#if lat and long are both numeric, it checks if they fall within a rough CA box.
#if they are outside, the routine nulls the values and logs this
#otherwise the values pass through
	my($decimalLatitude, $decimalLongitude, $id)=@_;
	if($decimalLatitude=~/\d/ && $decimalLongitude=~/\d/){
		if($decimalLatitude > 42.01 || $decimalLatitude < 32.53 || $decimalLongitude > -114.13 || $decimalLongitude < -124.43){ #if the coordinate range is not within the rough box of california...
			&log_change("COORDS CCH.pm: coordinates set to null, Outside California: >$decimalLatitude< >$decimalLongitude<\t$id"); #print this message in the error log...
			return("",""); #and set $decLat and $decLong to ""
		}
		else { return ($decimalLatitude, $decimalLongitude) }
	}
}


sub degrees_to_decimalLat {


if ($verbatimLatitude =~ m/^\d+/){
	if ($verbatimLatitude =~ m/(\d\d) +(\d\d?) (\d\d?\.?\d*)/){ #if there are seconds
		$lat_degrees = $1;
		$lat_minutes = ($2/60);
		$lat_seconds = ($3/3600);
			if($lat_seconds == 60){ #translating 60 seconds into +1 minute
				$lat_seconds == 0;
				$lat_minutes += 1;
			}
			if($lat_minutes == 60){
				$lat_minutes == 0;
				$lat_degrees += 1;
			}
			if(($lat_degrees > 90) || $lat_minutes > 60 || $lat_seconds > 60){
				&log_change("COORDS CCH.pm: Latitude problem, set to null,\t$id\t$verbatimLatitude\n");
				$decimalLongitude="";
			}
			
# DMS to Decimal
  		$lat_decimal = $lat_degrees + $lat_minutes + $lat_seconds;
		$decimalLatitude = sprintf ("%.6f",$lat_decimal);
		$georeferenceSources = "DMS conversion by CCH loading script"; #only needed to be stated once, if lat id converted, so is long
	}	
	elsif ($verbatimLatitude =~ m/^(\d\d) *.* +(\d\d\.?\d*).? *.*/){
		$lat_degrees= $1;
		$lat_minutes= $2;
		$lat_decimal= $lat_degrees+($lat_minutes/60);
			if($lat_minutes == 60){
				$lat_minutes == 0;
				$lat_degrees += 1;
			}
			if(($lat_degrees > 90) || ($lat_minutes > 60) ){
				&log_change("COORDS CCH.pm: Latitude problem, set to null,\t$id\t$verbatimLatitude\n");
				$decimalLatitude="";
			}
		$decimalLatitude=sprintf ("%.6f",$lat_decimal);
		$georeferenceSources = "DMS conversion by CCH loading script";
	}
	elsif ($verbatimLatitude =~m /^(\d\d\.?\d*) *.* *.*/){
		$decimalLatitude=sprintf ("%.4f",$1);
			if($decimalLatitude > 90){
				&log_change("COORDS CCH.pm: Latitude problem, set to null,\t$id\t$verbatimLatitude\n");
				$decimalLatitude="";		
			}
	}
}
elsif (length($verbatimLatitude == 0)) {
		$decimalLatitude=""
}
else {
	&log_change("COORDS CCH.pm: check latitude format: $verbatimLatitude $id");
	}
}

sub degrees_to_decimalLong {

if ($verbatimLongitude =~ m/^-?1\d\d +\d\d?.? +\d\d?\.?\d*.? *[wW]?/ || $verbatimLongitude =~ m/^-?1\d\d *.* +\d\d?.? *[wW]?/ || $verbatimLongitude =~ m/^-?1\d\d *.* +\d\d\.\d+ *[wW]?/ || $verbatimLongitude =~ m/^-?1\d\d\.?\d* *.* *[wW]?/){
	if ($verbatimLongitude =~ m/^(-?1\d\d) *.* +(\d\d)?.? +(\d\d?\.?\d*).? *.*/){ #if there are seconds
		$long_degrees = $1;
		$long_minutes = $2;
		$long_seconds = sprintf ("%.2f",$long_seconds);
			if($long_seconds == 60){ #translating 60 seconds into +1 minute
				$long_seconds == 0;
				$long_minutes += 1;
			}
			if($long_minutes == 60){
				$long_minutes == 0;
				$long_degrees += 1;
			}
			if(($long_degrees > 90) || $long_minutes > 60 || $long_seconds > 60){
				&log_change("COORDS CCH.pm: Longitude problem, set to null,\t$id\t$verbatimLongitude\n");
				$decimalLongitude="";
			}
			
# DMS to Decimal
  		$long_decimal = $long_degrees + ($long_minutes/60) + ($long_seconds/3600);
		$decimalLongitude=sprintf ("%.6f",$long_decimal);
		$georeferenceSources = "DMS conversion by CCH loading script"; #only needed to be stated once, if lat id converted, so is long
	}	
	elsif ($verbatimLongitude =~m /^(-?1\d\d).* +(\d\d?\.?\d*).? *.*/){
		$long_degrees= $1;
		$long_minutes= $2;
		$long_decimal= $long_degrees+($long_minutes/60);
			if($long_minutes == 60){
				$long_minutes == 0;
				$long_degrees += 1;
			}
			if(($long_degrees > 90) || ($long_minutes > 60) ){
				&log_change("COORDS CCH.pm: Longitude problem, set to null,\t$id\t$verbatimLongitude\n");
				$decimalLongitude="";
			}
		$decimalLongitude = sprintf ("%.6f",$long_decimal);
		$georeferenceSources = "DMS conversion by CCH loading script";
	}
	elsif ($verbatimLongitude =~m /^(-?1\d\d\.?\d*).* *.*/){
		$decimalLongitude=sprintf ("%.6f",$1);
			if($decimalLongitude > 180){
				&log_change("COORDS CCH.pm: Latitude problem, set to null,\t$id\t$verbatimLongitude\n");
				$decimalLongitude="";		
			}
	}
}
elsif (length($verbatimLongitude == 0)) {
		$decimalLongitude="";
}
else {
	&log_change("COORDS CCH.pm: check longitude format: $verbatimLongitude $id");
	}
}

sub lat_long_seperate_to_decimalLat {
$long_minutes=~ s/['`]//g;
$lat_minutes=~ s/['`]//g;
$lat_degrees=~ s/^(\d\d)[^\d]$/$1/g;
$long_degrees=~ s/^(\d\d\d)[^\d]$/$1/g;
if($long_minutes=~ s/^(\d*)(\.\d+)$/$1/){
	$long_minutes="00" if $long_minutes eq "";
	$minute_decimal=$2;
	$long_seconds= int($minute_decimal * 60);
}
if($lat_minutes=~ s/^(\d*)(\.\d+)$/$1/){
	$lat_minutes="00" if $lat_minutes eq "";
	$minute_decimal=$2;
	$lat_seconds= int($minute_decimal * 60);
}

if($lat_seconds=~/(\d+)\.[01234].*/){ #rounding down lat seconds
	$lat_seconds=$1;
}
elsif($lat_seconds=~/(\d+)\.[56789].*/){ #rounding up lat seconds
	$lat_seconds=${1}+1;
}
if($long_seconds=~/(\d+)\.[01234].*/){
	$long_seconds=$1;
}
elsif($long_seconds=~/(\d+)\.[56789].*/){
	$long_seconds=${1}+1;
}
if($lat_seconds && $lat_seconds==60){ #translating 60 seconds into +1 minute
	$lat_seconds="00";
	$lat_minutes +=1;
	if($lat_minutes==60){
		$lat_minutes="00";
		$lat_degrees +=1;
	}
}
if($long_seconds && $long_seconds==60){
	$long_seconds="00";
	$long_minutes +=1;
	if($long_minutes==60){
		$long_minutes="00";
		$long_degrees +=1;
	}
}
$lat_minutes=~ s/^ *(\d)\./0$1./;
$lat_seconds=~ s/^ *(\d)\./0$1./;
$long_minutes=~ s/^ *(\d)\./0$1./;
$long_seconds=~ s/^ *(\d)\./0$1./;
$lat_minutes=~ s/^ *(\d) *$/0$1/;
$lat_seconds=~ s/^ *(\d) *$/0$1/;
$long_minutes=~ s/^ *(\d) *$/0$1/;
$long_seconds=~ s/^ *(\d) *$/0$1/;
unless($lat_minutes eq $orig_lat_min){ #if lat minutes were modified, report it
	$coord_alter{"$orig_lat_min -> $lat_minutes $lat_seconds"}++;
}
unless($long_minutes eq $orig_long_min){
	$coord_alter{"$orig_long_min -> $long_minutes $long_seconds"}++;
}


$lat=$long="";
($lat= "${lat_degrees} ${lat_minutes} ${lat_seconds}$N_or_S")=~s/ ([EWNS])/$1/;
($long= "${long_degrees} ${long_minutes} ${long_seconds}$E_or_W")=~s/ ([EWNS])/$1/;
$lat=~s/^ *([EWNS])//;
$long=~s/^ *([EWNS])//;
$lat=~s/^ *//;
$long=~s/^ *//;

if($long){
	unless ($long=~/\d\d\d \d\d? \d\d?W/ || $long=~/\d\d\d \d\d?W/ || $long=~/\d\d\d \d\d? \d\d?\.\dW/){
		&log_change("$id: Longitude $long config problem; lat and long nulled");
		$long="";
		$lat="";
	}
	unless($lat =~ /\d/){
		$long="";
		&log_change("$id: Longitude no latitude config problem; long nulled");
	}
}
if($lat){
	unless ($lat=~/\d\d \d\d? \d\d?N/ || $lat=~/\d\d \d\d?N/ || $lat=~/\d\d \d\d? \d\d?\.\dN/){
		&log_change("COORDS CCH.pm: $id\tLatitude $lat config problem; Lat and long nulled");
		$lat="";
		$long="";
	}
	unless($long=~/\d/){
		$lat="";
		&log_change("COORDS CCH.pm: $id\tLatitude no longitude config problem; lat nulled");
	}
}


}


sub dg_to_dd {

#usage: $decimal = degrees_to_decimal($deg,$min,$sec,$hem);

	local($_)=@_;
	my $decimal="";
	$deg_max{"W"}= $deg_max{"E"}=180;
	$deg_max{"N"}= $deg_max{"S"}=90;
	if(($deg,$min,$sec,$hem)=m/^(\d+) (\d+) ([0-9.]+) *([WwEeNnSs]?)$/){
		$decimal=dms2decimal($deg, $min, $sec);
		if(($deg > $deg_max{uc($hem)}) || $min >= 60 || $sec >= 60){
			$decimal="";
		}
	}
	elsif(($deg,$min,$hem)=m/^(\d+) ([0-9.]+) *([WwEeNnSs]?)$/){
		$decimal=dm2decimal($deg, $min);
		if(($deg > $deg_max{uc($hem)} || $min >= 60 )){
			$decimal="";
		}
	}
	elsif(($deg,$hem)=m/^([0-9.]+) *([WwEeNnSs]?)$/){
		$decimal=$deg;
		if($deg > $deg_max{uc($hem)}){
			$decimal="";
		}
	}
	elsif(m/^0$/){
		$decimal="0";
	}
	else{
		$decimal="";
	}
	if($decimal){
		if($hem=~/[Ww]/){
			$decimal=-$decimal;
		}
		elsif($hem=~/[Ss]/){
			$decimal=-$decimal;
		}
	}
return $decimal;
}

sub dms2decimal {
#converts three numeric input values into one decimal degree value
#does not deal with DMS direction (NSEW)
#for California, lat should always be positive and long always negative
#so for longitude, take the output of this script and make it negative
    my ($degrees, $minutes, $seconds) = @_;
    my $decimal;

	if ($degrees && $minutes && $seconds){
		$decimal= sprintf "%.6f",(($degrees)+($minutes/60)+($seconds/3600));
	}
	elsif ($degrees && $minutes){
		$decimal= sprintf "%.6f",(($degrees)+($minutes/60));
	}
	elsif ($degrees){
		$decimal= sprintf "%.6f",$degrees;
	}
	else{ $decimal=""; }

	if ($decimal==0){
		$decimal="";
	}
    return $decimal;
}



sub format_county {
#common string transformations to isolate a county name
	my ($county,$id) = @_;
	foreach($county){

		s/://g;
		s/ *\/ */--/;
		s/\)//g;	#remove all instances of the literal characters "(" and ")"
		s/\(//g;
		s/ +municip[a-z]+$//i;	#substitute the end of a field with a space followed by the word, including misspellings, "municipality" with "" (case insensitive)
		s/ +[Cc]ount[iy][es]*$//i;	#substitute a space followed by the word "county" with "" (case insensitive)
		s/ +co\.$//i;	#substitute " co." with "" (case insensitive)
		s/ +co$//i;		#substitute " co" with "" (case insensitive)	
		s/^$/Unknown/;
		s/^unk$/Unknown/;
		s/[cC]ounty [uU]nknown/Unknown/;	#"County unknown" => "Unknown"
		s/Unplaced/Unknown/;	#"Unplaced" => "Unknown"
		s/ +(&|and|or) +/--/ig;
		s/^boundary between +//i;
		s/extreme//i;
		s/[eE]ither //;
		s/ originally.*//;
		s/. VHO//i; #odd data in county field in CHSC record:  'Butte? VHO'
		s/, +/--/g;
		s/(\w) ?- ?(\w)/$1--$2/g;  #Lake-Colusa-Glenn or Lake - Colusa - Glenn  ==>Lake--Colusa--Glenn
		s/ jct\. ?//i;
		s/^USA$//i;
		s/Rosarito--Playas de/Rosarito, Playas de/; #fix the one allowed county with comma that this script corrupts
		s/^United States$//i;
		s/ +[Cc]ount[ry]+[^ ]*//i; #County? or County or Country
		s/ line//i;
		s/ co\.? *$//i;
		s/ Count?ry$//i; 
		s/ Coun?ty?$//i; 
		s/^[jJ]ct //;
		s/^[SN][WE] //;
		s/^aIWEE$/Unknown/;


		s/[pP]robably//;
		s/[mM]aybe//;
		s/^[nN]one.?$/Unknown/;
		s/^ +$/Unknown/;
		s/^$/Unknown/;
		s/^Not Given/Unknown/;
		s/^U[nN][Kk]$/Unknown/;

		
		s/^(south|north|west|east|western|eastern|southwestern|southeastern) (\w+)/$2/i;
		s/^(\w+) (south|north|west|east|northwest|western|eastern|southwestern|southeastern)/$1/i;
		s/\./ /; #get rid of stray periods
		s/\?+$//; #get rid of stray '?' at end of lines
		s/ ?- ?/--/;#standardize multi-county dashes
		s/ +-+ +/--/;
		s/-+/--/;
	s/  +/ /g;
		s/ +$//g;
		s/^ +//g;
			#convert 3 or more counties to Unknown, add to this when when discovered
		if(m/^(Mono--Tuolumne--Alpine|Alpine--Amador--El.?[dD]orado|Mendocin[eao]--Humboldt.?--Del.?[nN]orte|Lake--Colusa--Glenn)/i){
			&log_change("COUNTY (1): MULTI-CA COUNTY, changed to 'Unknown' from \t$county\t$id");		#call the &log function to print this log message into the change log...
			$county="Unknown";
		}

s/^(ALAMEDA|Almeda|Alemeda|Alameda.?)$/Alameda/;

s/^(ALPINE|Alipne|Alpin|Alpine.?)$/Alpine/;

s/^(AMADOR|Armador|Amador.?)$/Amador/;

s/^(BUTTE|Butte VHO|Butte.?)$/Butte/;

s/^(Contra costa|Conta Cost|Contra Cost|Contrasta|Contra.?|Costa.?|Contra Costa.?|CONTRA ?COSTA)$/Contra Costa/;

s/^(Calvaras.?|Claveras|Calavers|Calveras|Calvaras|Calaveris|Calvaveras|Calavares|Calavaras|Calaveras.?|CALA?VARAS|CALA?VERAS)$/Calaveras/;

s/^(Calousa|Clousa|Colusa.?|COLUSA)$/Colusa/;

s/^(El ?[dD]or[ao]do|Edorado|El Dorada|El Dorata|El Dorodo|ElDorado|Eldorado|Elorado|El Dorado.?|Dorado.?|EL DORADO|ELDORADO)$/El Dorado/;

s/^(del Norte|Del norte|Del [nN]otre|EL Norte|El Norte|El *norte|Dol Norte|Del Monte|Delnorte|DelNorte|Del Norte.?|DEL NORTE)$/Del Norte/;

s/^(Humbloldt|Humbodt|Humbol|Humbolt|Hunboldt|Hunmboldt|Humbolddt|Humboldt.?|HUMBOLDT)$/Humboldt/;

s/^(Genn|Glen*|Gle+n+|Glenn.?|GLENN)$/Glenn/;

s/^(FresnoFresno|Fresno.?|fresno|FRESNO)$/Fresno/;

s/^(Inye|Inyoinyo|Inyp|Inyo.?|INYO)$/Inyo/;

s/^(Ipmerial|Imperial.?|IMPERIAL)$/Imperial/;

s/^(Ern|KRN|Kern.?|KERN)$/Kern/;

s/^(King|Kings.?|KINGS)$/Kings/;

s/^(Lake.?|LAKE)$/Lake/;

s/^(Lassrn|Lassen.?|LASSEN)$/Lassen/;

s/^(Los Angelesos Angeles|los Angeles|[lL][Oo][Ss] *[Aa]|[lL][Oo][Ss]|Los Aneles|Loa Angeles|Los angeles|Los Angelesos angeles|L *A|Los Angales|Los Angel[ao]s|Los Angeles.?|LOS ?ANGELES)$/Los Angeles/;

s/^(Madero|Madera.?|MADERA)$/Madera/;

s/^(Maraposa|Mariposa.?|MARIPOSA)$/Mariposa/;

s/^(Marine||Marin.?|MARIN)$/Marin/;

s/^(Merved|Merced.?|MERCED)$/Merced/;

s/^(Modac|Mododc|Urodoc|Modoc.?|MODOC)$/Modoc/;

s/^(Mono?|Mono.?|MONO)$/Mono/;

s/^(Mondocino|Medocino|Mendocina|Mendoncino|Mendocine|Medocine|Mendo|Mendicino|Mendicino|Mendecino|Mendocino.?|MENDOCINO)$/Mendocino/;

s/^(Monterery|Monterey_.*|Montery|Monter+ey|Monterey.?|MONTEREY)$/Monterey/;

s/^(NAPA|Napa.?)$/Napa/;

s/^(NEV|Nevada.?|NEVADA)$/NEVADA/;

s/^(ORANGE|Orange.?)$/Orange/;

s/^(Olumas|Pluams|Plum[aou]+s|PLUMAS|Plumas.?)$/Plumas/;

s/^(PLACER|Placer.?)$/Placer/;

s/^(Rvierside|Rivrside|River|RIV|Riv|Riveside|Rivers?ide.?|RIVERSIDE)$/Riverside/;

s/^(Sacromento|Sacramento.?|SACRAMENTO)$/Sacramento/;

s/^(San benito|San Ben|San Bento|San Beuito|SAN ?BENITO|BENITO|SanBenito.?|Benito|San Benito.?)$/San Benito/;

s/^(San Bernadino|S\. Bernardo|Santa Bernardino|San Beradino|San Berardino|San Berbardino|San Berdadino|Bernardino.?|San ?Bernardino.?|SAN BERNARDINO|BERNARDINO)$/San Bernardino/;
s/^(San Bernarndino|San Bernardo|San Bernardinio|San Bernandino|San Bernaedino|San Bernadion|San Bernadio|San Bernadiino|San Berd.?)$/San Bernardino/;
s/^(San Bernidino|San Benrardino|San Beranrdino|San BernardinoSan Bernardino|San Bernarino|San Bernarrdino|San Bernerdino|SanBernardino|San Bernrdino|SAN BENRARDINO)$/San Bernardino/;
s/^(san Bernardino|Sanbernardino|San bernardino|San Bernardina|SAN BENRARDINO|San BErnardino|San Bernardine|San Bernardio|S Bernardo)$/San Bernardino/;

s/^(San luis obispo|San Luis|San Luis+ Obispo|SLO|SL.O|San Luis Opispo|San Luis Obsipo|San Luis Obisfpo|San Lius Obispo|San Louis Obispo|San Lous Obispo|San Luis Obiapo|Obispo|San Luis Obisbo|San Luis Obispo.?|SAN LUIS OBISPO)$/San Luis Obispo/;

s/^(San Clara|Santa Clara.?|SANTA CLARA)$/Santa Clara/;

s/^(San francisco|San Fransisco|San Fraancisco|San Fransisco|San Francisco.?|SAN FRANCISCO)$/San Francisco/;

s/^(Sant Cruz|Santo Cruz|SANTA CRUZ|San Cruz+|Santa Cru;|SantaCruz.?|Santa cruz|Santa Cruz.?)$/Santa Cruz/;

s/^(San Barbara|Santa barbara|Santa BarbaraSanta Barbara|San ?Barbara|Santa barbera|Sntna Barbara|Santa Barabra.?|Santa Barbra.?)$/Santa Barbara/;

s/^(San mateo|Mateo|Santa Mateo|San Mateo.?|SAN MATEO)$/San Mateo/;

s/^(Shast.?|Shasta.?|SHASTA)$/Shasta/;

s/^(SanDiego|San DiegoSan Diego|San diego|San DIego|San Deigo|San Diago|San Diegosan Diego|Sandiego|San Deigo|Sand Diego|Santa Diego|San Diego.?|SAN ?DIEGO)$/San Diego/;

s/^(San juaquin|San joaquin|San Joaq...?n|San Juaquin|Joaquin|San Joaquin.?|SAN ?JOAQUIN|SAN JUAQUIN)$/San Joaquin/;

s/^(Solana|Solona|Solon.?|Solano.?|SOLANO)$/Solano/;

s/^(sonom|Sonoa|Sononia|Somona|Sonora|Sonoma.?|SONOMA)$/Sonoma/;

s/^(Stansilaus|Sanislaus|Santislaus|St ?anislaus|Stanilaus|Stanislaus.?|STANISLAUS)$/Stanislaus/;

s/^(Suter|Sutter.?|SUTTER)$/Sutter/;

s/^(Seir+a|Sierra.?|SIERRA)$/Sierra/;

s/^(Siiskiyou|Sikiyou|Siskyou|Sisikiyou|Sisshij|Siskiyou.?|SISKIYOU)$/Siskiyou/;

s/^(Tehame|Tehema|Tehema|Jehama|Tehana|Tehama.?|TEHAMA)$/Tehama/;

s/^(trinity|Trinuty|Trinit.?|TRINITY)$/Trinity/;

s/^(Tuolumme|Tuolume|Tulonmne|Tolumni.?|Toulumne|Toulomne|Tuol|Olumn.*|Tuolmne|Tuolmune|Tuolomne|Tuolomne|Toulumine|Tuolumne.?|TUOLUMNE)$/Tuolumne/;

s/^(Turlare|Tulane|Talure|Tualre|Tulare.?|TULARE)$/Tulare/;

s/^(Davis|Yolo.?|YOLO)$/Yolo/;

s/^(VenturaVentura|Vemtura|Verntura|Ventura.?|ventura.?|VENTURA)$/Ventura/;

s/^(Yuba.?|YUBA)$/Yuba/;


		s/^Tulareern/Kern/i;	
		s/^Alpine--El Dorado/Alpine/i;
		s/^Colusa--Lake/Colusa/i;
		s/^Butte--Tehama/Butte/i;
		s/^Butte--Tehama/Butte/i;
		s/^Butte--Plumas/Butte/i;
		s/^Davis--Yolo/Yolo/i;
		s/^Del Norte--Siskiyou/Del Norte/i;
		s/^El Dorado--LIME/El Dorado/i;
		s/^Fresno--Inyo/Fresno/i;
		s/^Fresno--Monterey/Fresno/i;
		s/^FRESNO TO MONTEREY/Fresno/i;
		s/^Humboldt--Del.Norte/Del Norte/i;
		s/^Humboldt--Trinity/Humboldt/i;
		s/^Imperial--San.Diego/Imperial/i;
		s/^Inyo--Kern/Inyo/i;
		s/^Inyo--San.Bernardino/Inyo/i;
		s/^Kern--Inyo/Inyo/i;
		s/^Kern--Ventura/Kern/i;
		s/^KeRN--LOS AnGELES/Kern/i;
		s/^LaKE--NAPA/Lake/i;
		s/^Lake--Colusa/Colusa/i;
		s/^Los Angeles--Ventura/Los Angeles/i;
		s/^LoS Angeles--SAN Bernardino/Los Angeles/i;
		s/^LoS ANGELESUBESCENT/Los Angeles/i;
		s/^Marin--Sonoma/Marin/i;
		s/^MaRIPOSA--MERCED/Mariposa/i;
		s/^Mendocino--Tehama/Mendocino/i;
		s/^Mendocino--Lake/Lake/i;
		s/^Mono--Inyo/Inyo/i;
		s/^Mono--Alpine/Alpine/i;
		s/^Mono--Tuolumne/Mono/i;
		s/^Monterey--Alpine/Alpine/i;
		s/^Monterey--Tuolumne/Monterey/i;
		s/^Monterey--San L[oui]+s Obispo/Monterey/i;
		s/^Napa--Sonoma/Napa/i;
		s/^Napa--Solano/Napa/i;
		s/^Napa--Lake/Lake/i;
		s/^Nevada--Sierra/Nevada/i;
		s/^OrANGE--RIVERSIDE/Orange/i;
		s/^PlACER--EL DoRADO/El Dorado/i;
		s/^Placer--Tulare/Placer/i;
		s/^Placer--Sierra/Placer/i;
		s/^Placer--Nevada/Nevada/i;
		s/^Plumas--Butte/Butte/i;
		s/^Plumas--Sierra/Plumas/i;
		s/^Plumas--Lassen/Lassen/i;
		s/^Riverside--Imperial/Imperial/i;
		s/^Riverside--San Diego/Riverside/i;
		s/^Riverside--San Bernardino/Riverside/i;
		s/^San Francisco--California/San Francisco/i;
		s/^San L[oui]+s Obispo--SANTA.BARBARA/Santa Barbara/i;
		s/^Santa Barbara--San L[oui]+s Obispo/Santa Barbara/i;
		s/^Santa Cruz--Santa Clara/Santa Clara/i;
		s/^San Bernardino--Inyo/Inyo/i;
		s/^San Bernardino--Los Angeles/Los Angeles/i;
		s/^San Bernardino--Riverside/Riverside/i;
		s/^San Diego--Riverside/Riverside/i;
		s/^San Diego--Imperial/Imperial/i;
		s/^Shasta--Lassen/Lassen/i;
		s/^Shasta--Trinity/Shasta/i;
		s/^Shasta--Tehama/Shasta/i;
		s/^Siskiyou--Trinity/Siskiyou/i;
		s/^Sierra--Plumas/Plumas/i;
		s/^Sierra--Nevada/Nevada/i;
		s/^Solano--Napa/Napa/i;
		s/^Solano--Yolo/Solano/i;
		s/^Sonoma--Lake/Lake/i;
		s/^Tehama--Trinity/Tehama/i;
		s/^Tehama--Shasta/Shasta/i;
		s/^Tuolumne--Mariposa/Mariposa/i;
		s/^Trinity--Siskiyou/Siskiyou/i;
		s/^Trinity--Tehama/Tehama/i;
		s/^Trinity--Humboldt/Humboldt/i;
		s/^Tulare--Fresno/Fresno/i;
		s/^Tulare--Kern/Kern/i;
		s/^Tulare--Inyo/Inyo/i;
		s/^Yolo--Solano/Solano/i;
		s/^Yuba--Butte/Butte/i;


	}
	return "$county";

#Example County Combinations Captured:
#Colusa or/and/- Lake
#Davis or/and/- Yolo
#Fresno or/and/- Inyo
#Fresno or/and/- Monterey
#Humboldt or/and/- Del Norte
#Imperial or/and/- San Diego
#Inyo or/and/- Kern
#Inyo or/and/- San Bernardino
#Kern or/and/- Inyo
#Lake, Colusa, Glenn
#Lake or/and/- Colusa or/and/- Glenn
#Lake-Colusa-Glenn
#Los AngelesVentura (no spaces, special case)
#Monterey or/and/- Alpine
#Monterey or/and/- Tuolumne
#Monterey or/and/- San Luis Obispo
#Placer or/and/- Tulare
#Plumas or/and/- Sierra
#Riverside or/and/- Imperial
#Riverside or/and/- San Bernardino
#Riverside or/and/- San Diego #added June 2017
#San Bernardino or/and/- Inyo
#San Diego or/and/- Imperial
#San Diego or/and/- Riverside
#Shasta or/and/- Trinity
#Shasta or/and/- Tehama
#Siskiyou or/and/- Trinity
#Sierra or/and/- Plumas
#Sierra or/and/- Nevada
#Solano or/and/- Napa
#Tuolumne or/and/- Mariposa
#Trinity or/and/- Siskiyou
#Tulare or/and/- Inyo



}

sub verify_co {
local($_)=shift;
$_=ucfirst(lc($_));

	s/^NULL//;
	s/^ +//;
	s/ +$//;


#Baja California records
s/Ensenda/Ensenada/;
#s/Guadalupe Island/Ensenada/;
#s/^Playas De Rosarito/Rosarito, Playas de/;
#s/Playas [ deRosa]+rito$/Rosarito, Playas de/;
#s/Playas/Rosarito,/;
#s/De Rosarito/Playas de/;
s/^Rosarito$/Rosarito, Playas de/;
#s/Cerro Donaldo/Mexicali/;
s/Comondú/Comondu/;
s/Mulegé/Mulege/;

#s/^(Alameda|Alpine|Amador|Butte|Calaveras|Colusa|Contra Costa|Del Norte|El Dorado|Fresno|Glenn|Humboldt|Imperial|Inyo|Kern|Kings|Lake|Lassen|Los Angeles|Madera|Marin|Mariposa|Mendocino|Merced|Modoc|Mono|Monterey|Napa|Nevada|Orange|Placer|Plumas|Riverside|Sacramento|San Benito|San Bernardino|San Diego|San Francisco|San Joaquin|San Luis Obispo|San Mateo|Santa Barbara|Santa Clara|Santa Cruz|Shasta|Sierra|Siskiyou|Solano|Sonoma|Stanislaus|Sutter|Tehama|Trinity|Tulare|Tuolumne|Unknown|Ventura|Yolo|Yuba|Ensenada|Mexicali|Rosarito, Playas de|Tecate|Tijuana) .*/$1/;
#will get rid of anything following a legitimate name





if(m/^(Alameda|Alpine|Amador|Butte|Calaveras|Colusa|Contra Costa|Del Norte|El Dorado|Fresno|Glenn|Humboldt|Imperial|Inyo|Kern|Kings|Lake|Lassen|Los Angeles|Madera|Marin|Mariposa|Mendocino|Merced|Modoc|Mono|Monterey|Napa|Nevada|Orange|Placer|Plumas|Riverside|Sacramento|San Benito|San Bernardino|San Diego|San Francisco|San Joaquin|San Luis Obispo|San Mateo|Santa Barbara|Santa Clara|Santa Cruz|Shasta|Sierra|Siskiyou|Solano|Sonoma|Stanislaus|Sutter|Tehama|Trinity|Tulare|Tuolumne|Unknown|Ventura|Yolo|Yuba|Ensenada|Mexicali|Rosarito, Playas de|Tecate|Tijuana)$/){
return($_);
}
else{
return("SKIP");
}
}


########
sub validate_collectors {

#NOTE: collectors_id was a file that Dick used to try to standardize collector names
###similar to how smasch_taxon_ids.txt works

	my ($collectors, $id) = @_;


	if(length($collectors) == 0){
		&log_change("COLLECTOR CCH.pm: No Collector Name\t$id");
	}
	elsif ($collectors =~ m/(null|no name|none|unknown|anonymous)/i) {
		&log_change("COLLECTOR CCH.pm: name entered as Unknown, none, or etc.\t$id");
	}
	elsif(length($collectors) > 1){ #names with length of 1 are always errors
	#if the name is found in the collectors_id table, return the altered name
		if(length($primary_collector{$collectors}) > 1){
			$recordedBy = $primary_collector{$collectors};
			return ($recordedBy);
		}
		elsif(length($primary_collector{$collectors}) == 0){
			&log_change ("COLLECTOR CCH.pm(1): Name string not found in Collectors ID table\t$collectors"); #normal output
			#&log_change ("1) Collector Verbatim Name string not found in Collectors ID table\t$collector\t$id"); #output for detecting records with problematic names
		}		
		elsif(length ($orig_TID{$collectors}) == 0){
			#if there's no TID matching the original name
			&log_change("COLLECTOR CCH.pm(2): Combined string not found in Collectors ID table: $collectors");
		}
		else{
			&log_change ("COLLECTOR CCH.pm(3): Name not found in Collectors ID table, check for possible error\t$collectors"); 
		}	
	}
	else{
		&log_change ("COLLECTOR CCH.pm(4): Name Problem\t$collectors\t$id");
		return "Unknown";
	}
	
}

sub validate_single_collector {

	my ($collector, $id) = @_;

	if(length($collector) == 0){
		&log_change("COLLECTOR CCH.pm(7): Name NULL:\t$collector");
	}
	elsif ($collector=~/(null|no name|none|unknown|anonymous)/i) {
		&log_change("COLLECTOR CCH.pm: name entered as Unknown, none, or etc.\t$id");
	}
	elsif(length($collector) > 1){ #names with length of 1 are always errors
	#if the name is found in the collectors_id table, return the altered name
		if(length($primary_collector{$collector}) > 1){
			$recordedBy = $primary_collector{$collector};
			return ($recordedBy);
		}
		elsif(length($primary_collector{$collector}) == 0){
			&log_change ("COLLECTOR CCH.pm(5): Name string not found in Collectors ID table\t$collector"); #normal output
			#&log_change ("1) Collector Verbatim Name string not found in Collectors ID table\t$collector\t$id"); #output for detecting records with problematic names
		}		
		else{
			&log_change ("COLLECTOR CCH.pm(6): Name not found in Collectors ID table, check for possible error\t$collector");
		}	
	}
	else{
		&log_change ("COLLECTOR CCH.pm(7): Name Problem\t$collector\t$id");
		return "Unknown";
	}

}
sub load_data {
	$datafile=shift;
		%datafile=();
%seen=();
warn "I need to load data from several files.\nLoading specimen data from $datafile\n";
$time= -C "$datafile";
print "Data file ", int($time)," days old\n";
	open (DATA_FILE,$datafile) || die "couldn't open $datafile\n";
	local($/)="";
	while(<DATA_FILE>){
		if(m/CNUM: *(.*)/){
			($cnum=$1)=~s/ *$//;
$cnum=uc($cnum);
			$datafile{$cnum}=$_;
			if($seen{$cnum}++){
				#warn "$cnum is used more than once\n";
			}
		}
	}
}

sub load_noauth_name {
$time2= -C "/Users/davidbaxter/DATA/smasch_taxon_ids.txt";
$time= -C "/Users/davidbaxter/DATA/smasch_taxon_ids_CCH.txt";

print "Master Taxon name file ", int($time2)," days old\n";
print "CCH Taxon name file ", int($time)," days old\n";
	open(IN,"/Users/davidbaxter/DATA/smasch_taxon_ids_CCH.txt") || die;
	while(<IN>){
		chomp;
next if m/^#/;
		($id,$TName,$TNAuth,$Tnote,@residue)=split(/\t/);#used to skip known cultivars or other names not wanted in Jepson Interchange
		#use this now for name that are problematic and need to be skipped for other reasons.  The numbers below have been deleted
		#from smasch_taxon_ids.txt, so these ID's are commented out
		#cultivars are being included and being delt with a purple flag in each parser, as of Jan 2017.
#next if $id==115;
#next if $id==12460;
#next if $id==134;
#next if $id==3746;
#next if $id==173;
#next if $id==26133;
#next if $id==26165;
#next if $id==34925;
#next if $id==48758;
#next if $id==50604;
#next if $id==51994;
#next if $id==62854;
#next if $id==58558;
#next if $id==76428;
#next if $id==77465;
#next if $id==77466;
#next if $id==77474;
#next if $id==77475;
#next if $id==77476;
#next if $id==77477;
#next if $id==78287;
#next if $id==78297;
#next if $id==78431;
#next if $id==78990;
#next if $id==101638;
		$TID{$TName} = $id;
		$TIDNOTE{$TName} = "$TNote\t$id";

	}


	open(IN2,"/Users/davidbaxter/DATA/smasch_taxon_ids.txt") || die;
	while(<IN2>){
		chomp;
next if m/^#/;
		($Sid,$SName)=split(/\t/);

		$TNOAN{$Sid} = $SName;
	}
}
######################################
sub month_hash {
#returns a month number hash from the various strings that are used to represent months
#use as input for the get_month_number subroutine

my %month_number=(
'1'=>1,
'01'=>1,
'jan'=>1,
'Jan'=>1,
'January'=>1,
'I'=>1,

'2'=>2,
'02'=>2,
'feb'=>2,
'Feb'=>2,
'February'=>2,
'II'=>2,

'3'=>3,
'03'=>3,
'mar'=>3,
'Mar'=>3,
'March'=>3,
'III'=>3,

'4'=>4,
'04'=>4,
'apr'=>4,
'Apr'=>4,
'April'=>4,
'Arpil'=>4,
'IV'=>4,

'5'=>5,
'05'=>5,
'may'=>5,
'May'=>5,
'nay'=>5,
'V'=>5,

'6'=>6,
'06'=>6,
'jun'=>6,
'Jun'=>6,
'June'=>6,
'VI'=>6,

'7'=>7,
'07'=>7,
'jul'=>7,
'Jul'=>7,
'July'=>7,
'VII'=>7,

'8'=>8,
'08'=>8,
'aug'=>8,
'Aug'=>8,
'August'=>8,
'VIII'=>8,

'9'=>9,
'09'=>9,
'sep'=>9,
'Sep'=>9,
'sept'=>9,
'Sept'=>9,
'September'=>9,
'IX'=>9,

'10'=>10,
'oct'=>10,
'Oct'=>10,
'october'=>10,
'October'=>10,
'X'=>10,

'11'=>11,
'nov'=>11,
'Nov'=>11,
'november'=>11,
'November'=>11,
'XI'=>11,

'12'=>12,
'dec'=>12,
'Dec'=>12,
'december'=>12,
'December'=>12,
'XII'=>12
);

return %month_number; 
}
######################################

sub get_month_number {
#takes a month string as input
#if the month string is not recognized, add it to the %month_number translation table
#if a numeric month is input, that is fine
#however leading zeroes are removed
#if a null month is put in, a null value is returned
#the %month_number was previously on its own in this perl module as %monthno
#if a script is trying to call that, use this subroutine instead

my ($month_string, $id, %month_number) = @_;

#check that the number of input arguments is correct
#each key-value pair in a hash is counted as two arguments
#so the total should be double the hash keys count, plus 2
$hash_count = keys %month_number;
$expected_total = (($hash_count * 2) + 2);

if (@_ != $expected_total){
	print "&get_month_number used incorrectly\n";
	print 'proper usage is &get_month_number ($month_string, %month_number, $id);'."\n";
	print "get %month_number by running &month_hash\n";
	die;
}
elsif (@_ < 12){
	print "too few arguments in the hash sent to &get_month_number\n"; 
	print "Is the %month_number hash being properly generated by &month_hash?\n";
	die;
}

if ($month_string){
	#convert month string to number
	$monthno = $month_number{$month_string};
}
else {
	return ""; # if input month is null, output is null, and that's fine
}

#check if result is a number between 1 and 12, null and report if not.
unless ($monthno=~/^(\d+)$/){
	unless ($monthno >= 1 || $monthno <=12){
		&log_change ("DATE CCH.pm: month string ($month_string) in record $id not translated to numeric month, month nulled\t--\tplease add the string ($month_string) to the translation table in &month_hash\n");
		return "";
	}
}
return "$monthno";
}
	
sub strip_name{
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

s/^([A-Z][A-Za-z-]+) ([-a-z]+) ?.* (subvar\.|subsp\.|var\.|f\.|nothosubsp\.) ([-a-z]+).*/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z-]+) [×Xx] ([-a-z]+) .+/$1 X $2/||
s/^([A-Z][A-Za-z-]+) [×Xx] ([-a-z]+)/$1 X $2/||
s/^([A-Z][A-Za-z-]+) ×([-a-z]+) .+/$1 X $2/||
s/^([A-Z][A-Za-z-]+) ×([-a-z]+)/$1 X $2/||
s/^([A-Z][A-Za-z-]+) ([-a-z]+) .+/$1 $2/||
s/^([A-Z][A-Za-z-]+) ([-a-z]+)/$1 $2/||
s/^([A-Z][A-Za-z-]+) (X [-a-z]+)/$1 X $2/||
s/^X ([A-Z][a-z-]+) ([-a-z]+) (.+)/X $1 $2/||
s/^X ([A-Z][a-z-]+) ([-a-z]+)/X $1 $2/||
s/^([A-Z][A-Za-z-]+) (.+)/$1/;
s/  +/ /;
s/ +$//;




#print "$_ \n";
$_;
}
sub get_TRS{
#T/R/Section: 3S 30E 24 SE/4
local($_)=@_;
my($coords)="";
my($coord_notes)="";
				if(m/T(\d+[NSEW]) +R(\d+[NSEW])/){
					$coords= $1 . $2;
					if(m/R\d+[NSEW] (.*[Ss]ect[.ion]+ (\d+))/){
						if($coords){$coords .= $2;}else{$coords=$2;}
						if($coord_notes){
							$coord_notes .= "<coords cont.: $1>; ";
						}
						else{$coord_notes = "<coords cont.: $1>; ";}
					}
					elsif(m/R\d+[NSEW] S(\d+)$/){
						if($coords){$coords .= $1;}else{$coords=$1;}
					}
					elsif(m/R\d+[NSEW] S(\d+)(.*)/){
						if($coords){$coords .= $1;}else{$coords=$1;}
						if($coord_notes){
							$coord_notes .= "<coords cont.: $2>; ";
						}
						else{$coord_notes = "<coords cont.: $2>; ";}
					}
				}
				elsif(m/^(\d+[NS]) *(\d+[EW]) *(\d+)$/){
				
					$coords = $1 . $2 .$3;
				}
				elsif(m/^(\d+[NS]) *(\d+[EW]) *(\d+) (.*)$/){
					$coords = $1 . $2 .$3;
							$coord_notes .= "<coords cont.: $4>; ";
				}
				elsif(m/T(\d+[NSEW]), R(\d+[NSEW])/){
				
					$coords = $1 . $2;
					if(m/R\d+[NSEW],? (.*[Ss]ect[.ion]+ (\d+))/){
						if($coords){$coords .= $2;}else{$coords=$2;}
						if($coord_notes){
							$coord_notes.= "<coords cont.: $1>; ";
						}
						else{
							$coord_notes= "<coords cont.: $1>; ";
						}
					}
				}
				elsif(m/^([NSEW]+1\/4)/){
					$coords= "";
					if($coord_notes){
						$coord_notes.= "<coords cont.: $1>; ";
					}
					else{
						$coord_notes= "<coords cont.: $1>; ";
					}
				}
				else{
if(m/(...+)/){
					$coords= "";
					if($coord_notes){
						$coord_notes .= "<coords cont.: $1>; ";
					}
					else{
						$coord_notes = "<coords cont.: $1>; ";
					}
}
				}
$coords=~s/^(\d+)([NWSE])(\d+)([NWSE])$/0$1${2}0$3$4/;
$coords=~s/^(\d+)([NWSE])(\d+)([NWSE])(\d+)$/0$1${2}0${3}${4}0$5/;
$coords=~s/0(\d\d)/$1/g;
			return($coords, $coord_notes);
}

#this is for consort_bulkload for the datasets that are not converted to modern loader; minimal processing, including shorting "meters" to "m"; "feet" to "ft"
sub get_elev{


	local($_) = shift;
s/about //;
   s/[\[\]]//g;
   s/ca\.//;
   s/Â±//;
   s/&lt;<//;
   s/.plusmn;//;
  s/.quot;//g;
   s/(\d),(\d)/$1$2/;
   s/(\d)-(\d)/$1 - $2/;
				unless(m/(feet|ft|m|meters)\.? *$/){
					return("");
				}
				unless(m/\d/){
					return("");
				}
				s/feet/ft/;
				s/ft\./ft/;
				s/m\./m/;
				s/meters?/m/;
				s/([-\d]+)\.?0* *ft/$1 ft/;
				s/(\d+) (ft|m) below .*/-$1 $2/;
$_;
}


sub parse_lat {

#used in consort_bulkload.pl

local($decimal)="";
local($degree)="";
local($_)=shift;
$ls=$_;
if(s/^(\d+)[^0-9]+ (\d+)[^0-9]+ /$1 $2 /){
warn "Starting lat: $ls :  $_\n";
}
					s/ca\. //;
					s/;$//;
					$old=$_;
s/NN/N/;
s/WW/W/;
s/ (\d) *([NS])/ 0$1$2/;
s/0(\d\d)/$1/g;
s/ 60 *([NS])/ 59.5$1/;
s/ (\d\.\d+) *([NS])/ 0$1$2/;
if(m/\d+ (\d) \d+/){
s/(\d+) (\d) (\d+)/$1 0$2 $3/;
}
if(m/^(\d\d?) *([NS])$/){
$decimal=$1; $degree="$1$2";
return($decimal, $degree);
}
elsif(m/^(\d\d?) +([0-5]\d?) *([NS])$/){
$degree="$1 $2$3";
$decimalLatitude=&convert_to_decimal($degree);
return($decimal, $degree);
}
elsif(m/^(\d\d?) +([0-5]\d?) ([0-5]\d?) *([NS])$/){
$degree="$1 $2 $3$4";
$decimalLatitude=&convert_to_decimal($degree);
return($decimal, $degree);
}
elsif(m/^(\d\d+) +([0-5]\d?) ([0-5]\d?)(\.\d+) *([NS])$/){
$degree="$1 $2 $3$5";
$decimal=&convert_to_decimal($degree);
$ch=1/3600 * $4;
$decimal=$decimal + $ch;
return($decimal, $degree);
}
elsif(m/^(\d\d?) ([0-5]\d?)(\.\d+) *([NS])$/){
$second= int(60 * $3);
$degree="$1 $2 ${second}$4";
$decimal=&convert_to_decimal($degree);
return($decimal, $degree);
}
else{
warn "7 Unanticipated latitude nulled: $_\n";
return ("","");
}
				s!\.(\d+)['m]!"m" . int($1/100 * 60) ."s"!e;
#Latitude: 37 45.79N

				s!^(\d+) (\d+)(\.\d+) *([NS])$!$1 ." $2 " . int($3 * 60) . $4!e;
				#warn "$old : $_\n" unless $old eq $_;
				if(m/\d\.\d/){
					s/ *([NS])//;
					$decimal=$_;
				}
				else{
					s/ ?([dms'"]) */ /g;
					s/ +/ /g;
					s/(.*) *S/-$1/;
					s/(.*) +N/$1N/;
					$degree=$_;
				}
$degree=~s/ (\d)([EWNS])/ 0$1$2/g;
$degree=~s/ (\d) (\d\d)([EWNS])/ 0$1$2$3/g;
return($decimal, $degree);
}

sub convert_to_decimal{

#used in consort_bulkload.pl

my $decimal="";
local($_)=shift;
#print "convert1: $_\n";
	if(s/S$//){
		$sign="-";
	}
	else{
		$sign="";
		s/N$//;
	}
if(m/^(\d+) (\d+) (\d+)/){
$decimal=$1 + $2/60 + $3/3600;
#print "convert1: $_ $decimal\n";
}
elsif(m/^(\d+) (\d+)/){
$decimal=$1 + $2/60;
#print "convert1: $_ $decimal\n";
}
return ("$sign$decimal");
}

sub parse_long {

#used in consort_bulkload.pl


local($decimal)="";
local($degree)="";
local($_)=shift;
s/ to *$//;
$ls=$_;
if(s/^-//){
warn "$ls :  $_\n";
}
if(s/^(\d+)[^0-9]+ (\d+)[^0-9]+ /$1 $2 /){
warn "Starting long: $ls :  $_\n";
}
					s/ca\. //;
					s/;$//;
					$old=$_;
s/ (\d) *([EW])/ 0$1$2/;
s/ 60 *([EW])/ 59.5$1/;
s/ (\d\.\d+) *([EW])/ 0$1$2/;
if(m/\d+ (\d) \d+/){
s/(\d+) (\d) (\d+)/$1 0$2 $3/;
}
s/0(\d\d)/$1/g;
if(m/^([01]?\d\d?) *([EW])$/){
$decimal=$1; $degree="$1$2";
if($decimal > 180){
$decimal=$degree="";
warn "1 Unanticipated longitude nulled: $_\n";
}
$decimal="-$decimal";
return($decimal, $degree);
}
elsif(m/^([01]?\d\d?) +([0-5]\d?) *([EW])$/){
$degree="$1 $2$3";
$decimal=&convert_to_decimal($degree);
if($decimal > 180){
$decimal=$degree="";
warn "2 Unanticipated longitude nulled: $_\n";
}
$decimal="-$decimal";
return($decimal, $degree);
}
elsif(m/^([01]?\d\d?) +([0-5]\d?) ([0-5]\d?) *([EW])$/){
$degree="$1 $2 $3$4";
$decimal=&convert_to_decimal($degree);
#print "converted: $decimal\n";
if($decimal > 180){
$decimal=$degree="";
warn "3 Unanticipated longitude nulled: $_\n";
}
$decimal="-$decimal";
return($decimal, $degree);
}
elsif(m/^([01]?\d\d?) +([0-5]\d?) ([0-5]\d?)(\.\d+) *([EW])$/){
$degree="$1 $2 $3$5";
$decimal=&convert_to_decimal($degree);
$ch=1/3600 * $4;
$decimal=$decimal + $ch;
if($decimal > 180){
$decimal=$degree="";
warn "4 Unanticipated longitude nulled: $_\n";
}
$decimal="-$decimal";
return($decimal, $degree);
}
elsif(m/^([01]?\d\d?) ([0-5]\d?)(\.\d+) *([EW])$/){
$second= int(60 * $3);
$degree="$1 $2 ${second}$4";
$decimal=&convert_to_decimal($degree);
if($decimal > 180){
$decimal=$degree="";
warn "5 Unanticipated longitude nulled: $_\n";
}
$decimal="-$decimal";
return($decimal, $degree);
}
else{
warn "6 Unanticipated longitude nulled: $_\n";
return ("","");
}
				s!\.(\d+)['m]!"m" . int($1/100 * 60) ."s"!e;
				s!^(\d+) (\d+)(\.\d+) *([EW])$!$1 ." $2 " . int($3 * 60) . $4!e;
				warn "$old : $_\n" unless $old eq $_;
				if(m/\d\.\d/){
					s/(.*) *W/-$1/;
					s/(.*) *E/$1/;
					$decimal=$_;
#warn "decimal: $decimal\n";
				}
				else{
					s/ ?([dms'"]) */ /g;
					s/ +/ /g;
					s/ *([EW])/$1/;
					$degree=$_;
				}
$degree=~s/ (\d)([ EW])/ 0$1$2/g;
return($decimal, $degree);
}
			
sub prune_fields{
local($_)=shift;
s/\xE2\x80\x99/'/g;
s/\xE2\x80\x9C/"/g;
s/\xE2\x80\x9D/"/g;
	s/ *$//;
        s/^ *//;
	s/\x94/"/g;
	s/\x93/"/g;
	s/\xB1/+-/g;
	s/\xB0/ deg. /g;

	s/\x91/'/g;
	s//'/g;
	s/Õ/'/g;
	s/Ò/"/g;
	s/Ó/"/g;
s/\222/'/g;
return($_);

#chars = {
#    '\xc2\x82' : ',',        # High code comma
#    '\xc2\x84' : ',,',       # High code double comma
#    '\xc2\x85' : '...',      # Tripple dot
#    '\xc2\x88' : '^',        # High carat
#    '\xc2\x91' : '\x27',     # Forward single quote
#    '\xc2\x92' : '\x27',     # Reverse single quote
#    '\xc2\x93' : '\x22',     # Forward double quote
#    '\xc2\x94' : '\x22',     # Reverse double quote
#    '\xc2\x95' : ' ',
#    '\xc2\x96' : '-',        # High hyphen
#    '\xc2\x97' : '--',       # Double hyphen
#    '\xc2\x99' : ' ',
#    '\xc2\xa0' : ' ',
#    '\xc2\xa6' : '|',        # Split vertical bar
#    '\xc2\xab' : '<<',       # Double less than
#    '\xc2\xbb' : '>>',       # Double greater than
#    '\xc2\xbc' : '1/4',      # one quarter
#    '\xc2\xbd' : '1/2',      # one half
#    '\xc2\xbe' : '3/4',      # three quarters
#    '\xca\xbf' : '\x27',     # c-single quote
#    '\xcc\xa8' : '',         # modifier - under curve
#    '\xcc\xb1' : ''          # modifier - under line
#}

}

sub correct_format{

local($_)=shift;
		s/\cK+$//;
		s/\cK//g;
		s/\cM/ /g;

return($_);
  }

sub munge_collectors{
#usage: ($Collector_full_name,$Associated_collectors)=&munge_collectors ($Collector,$Other_coll)

	my($Collector_full_name)=shift;
	my($Associated_collectors)=shift;
    foreach($Collector_full_name){
    
    
		
    	s/ \./\./g;
		s/([A-Z]\.)([A-Z]\.)([A-Z]\.)/$1 $2 $3 /g; 
		s/([A-Z]\.)([A-Z]\.)/$1 $2 /g; 
        s/([A-Z]\.)([A-Z][a-z])/$1 $2/g;
        s/([A-Z]\.) ([A-Z]\.)([A-Z])/$1 $2 $3/g;
        s/([A-Z]\.)([A-Z])/$1 $2/g;
        s/,? (&|and) /, /;
        s/([A-Z])([A-Z]) ([A-Z][a-z])/$1. $2. $3/g;
        s/([A-Z]) ([A-Z][a-z])/$1. $2/g;
        s/,([^ ])/, $1/g;
        s/ *, *$//;
        s/, ,/,/g;
        s/  +/ /g; 
        s/^J\. ?C\. $/J. C./;
        s/John A. Churchill M. ?D. $/John A. Churchill M. D./;
        s/L\. *F\. *La[pP]r./L. F. LaPre/;
        s/B\. ?G\. ?Pitzer/B. Pitzer/;
       # s/J. André/J. Andre/;
      #  s/Jim André/Jim Andre/;
        s/ *$//;
        $_= $alter_coll{$_} if $alter_coll{$_};
        ++$collector{$_};
        
        if($Associated_collectors){
			$Associated_collectors=~s/P. *Mackay/P. MacKay/;
			$Associated_collectors=~s/P. *J. *Mackay/P. J. MacKay/;
                        $Associated_collectors=~s/ \./\./g;
                        $Associated_collectors=~s/^w *\/ *//;
                        $Associated_collectors=~s/([A-Z]\.)([A-Z]\.)([A-Z]\.)/$1 $2 $3 /g; 
                        $Associated_collectors=~s/([A-Z]\.)([A-Z]\.)/$1 $2 /g; 
                        $Associated_collectors=~s/([A-Z]\.)([A-Z]\.)/$1 $2/g;
                        $Associated_collectors=~s/([A-Z]\.) ([A-Z]\.)([A-Z])/$1 $2 $3/g;
                        $Associated_collectors=~s/([A-Z]\.)([A-Z])/$1 $2/g;
                        $Associated_collectors=~s/,? (&|and|\|) /, /g; 
                        $Associated_collectors=~s/([A-Z])([A-Z]) ([A-Z][a-z])/$1. $2. $3/g;
                        $Associated_collectors=~s/([A-Z]) ([A-Z][a-z])/$1. $2/g;
                        $Associated_collectors=~s/, ,/,/g;
                        $Associated_collectors=~s/,([^ ])/, $1/g;
                	$Associated_collectors=~s/et. ?al/et al/;
                	$Associated_collectors=~s/et all/et al/;
                	$Associated_collectors=~s/et al\.?/et al/;
                	$Associated_collectors=~s/etal\.?/et al/;
                	$Associated_collectors=~s/([^,]) et al\./$1, et al/;
                	$Associated_collectors=~s/ & others/, et al/;
                	$Associated_collectors=~s/, others/, et al/;
                	$Associated_collectors=~s/L\. *F\. *La[pP]r./L. F. LaPre/;
                	$Associated_collectors=~s/B\. ?G\. ?Pitzer/B. Pitzer/;
                	$Associated_collectors=~s/ +, +/, /g; 
                	$Associated_collectors=~s/ +/ /g; 
                	$Associated_collectors=~s/,+/,/g;
                #warn $Associated_collectors;
                        if(length($_) > 1){ 
                               my $combined_collectors="$_, $Associated_collectors";
                                if($alter_coll{$combined_collectors}){
                                	$combined_collectors= $alter_coll{$combined_collectors};
                                }   
                                #++$collector{"$combined_collectors"};
                                warn $Associated_collectors, $combined_collectors;
                        }   
                        else{
                                if($alter_coll{$Associated_collectors}){
                                $Associated_collectors= $alter_coll{$Associated_collectors};
                                }   
                                #++$collector{$Associated_collectors};
                        }   
                        #++$collector{$_};
                }   
                #else{
                   #     if($alter_coll{$_}){
                       # $_= $alter_coll{$_};
                       # }  
                        #++$collector{$_};
                #}   
        }   
return($Collector_full_name,$Associated_collectors);
}

sub get_institution_acronym { #where is this used because we dont want acronyms with "/" in them in most places in CCH
	my ($acronym) = @_;
	$acronym =~s/\d.*//;
	$acronym =~s/-.*//;
	
	#if ($acronym eq "UC" || $acronym eq "JEPS" || $acronym eq "UCLA"){
	#	$acronym = 'UC/JEPS';
	#}
	#elsif ($acronym eq "CAS" || $acronym eq "DS"){
	#	$acronym = 'CAS';
	#}
	#elsif ($acronym eq "RSA" || $acronym eq "POM"){
	#	$acronym = 'RSA/POM';
	#}
	#elsif ($acronym eq "A" || $acronym eq "AMES" || $acronym eq "ECON" || $acronym eq "GH"){
	#	$acronym = 'HUH';
	#}
	return ($acronym);
}

sub load_fips{
#fips are these weird five digit codes for counties that are used by the old smasch maps on the Interchange
	return (
	"06001","ALAMEDA",
	"06003","ALPINE",
	"06005","AMADOR",
	"06007","BUTTE",
	"06009","CALAVERAS",
	"06011","COLUSA",
	"06013","CONTRA COSTA",
	"06015","DEL NORTE",
	"06017","EL DORADO",
	"06019","FRESNO",
	"06021","GLENN",
	"06023","HUMBOLDT",
	"06025","IMPERIAL",
	"06027","INYO",
	"06029","KERN",
	"06031","KINGS",
	"06033","LAKE",
	"06035","LASSEN",
	"06037","LOS ANGELES",
	"06039","MADERA",
	"06041","MARIN",
	"06043","MARIPOSA",
	"06045","MENDOCINO",
	"06047","MERCED",
	"06049","MODOC",
	"06051","MONO",
	"06053","MONTEREY",
	"06055","NAPA",
	"06057","NEVADA",
	"06059","ORANGE",
	"06061","PLACER",
	"06063","PLUMAS",
	"06065","RIVERSIDE",
	"06067","SACRAMENTO",
	"06069","SAN BENITO",
	"06071","SAN BERNARDINO",
	"06073","SAN DIEGO",
	"06075","SAN FRANCISCO",
	"06077","SAN JOAQUIN",
	"06079","SAN LUIS OBISPO",
	"06081","SAN MATEO",
	"06083","SANTA BARBARA",
	"06085","SANTA CLARA",
	"06087","SANTA CRUZ",
	"06089","SHASTA",
	"06091","SIERRA",
	"06093","SISKIYOU",
	"06095","SOLANO",
	"06097","SONOMA",
	"06099","STANISLAUS",
	"06101","SUTTER",
	"06103","TEHAMA",
	"06105","TRINITY",
	"06107","TULARE",
	"06109","TUOLUMNE",
	"06111","VENTURA",
	"06113","YOLO",
	"06115","YUBA"
	);
}


sub make_license_hash {

}