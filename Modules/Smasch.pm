package Smasch;
#mod Feb 11, 2004
use Exporter;
@ISA = ('Exporter');
@EXPORT = qw(&strip_name @S_accession %S_accession_length %S_accession @S_folder %S_folder_length %S_folder %vouchers %magic_no @month &process_name &verify_bioname &get_TRS &get_elev &parse_lat &parse_long &load_data &load_cal &load_be &load_noauth_name %seen %datafile %coll_comm &load_collectors %PARENT);
####patterns######
$genus = '[A-Z][a-z-]+';
$species = '[a-z-]+';
$rank = 'var\.?|ssp\.?|subsp\.?|f\.|forma';
$infra = '[a-z-]+';
$author = '.*';
########
sub load_collectors {
$collector_file= "collectors_id";
warn "Loading collectors\n";
	my($name);
	open(COLL,"$collector_file") || die "couldn't open $collector_file";
	while(<COLL>){
		chomp;
		($collector,$collector_id)=split(/\t/);
		$coll_comm{$collector}=$collector_id;
		$coll_comm{uc($collector)}=$collector_id;
	}
}

sub load_data {
	$datafile=shift;
		%datafile=();
%seen=();
warn "I need to load data from several files.\nLoading specimen data from $datafile\n";
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

sub load_cal {
$calif_tax= "c:/jepson/bioregions.out";
warn "Loading California names\n";
	my($name);
	open(CALIF,"$calif_tax") || die "couldn't open $calif_tax\n";
	while(<CALIF>){
		chomp;
s/\t.*//;
s/^([A-Z])([A-Z]+)/$1\L$2/;
		$name=&strip_name($_);
		$calif{$name}++;
	}
}

sub load_be{
	open(IN,"tnoan.out") || die;
warn "Loading name elements recognized by SMASCH\n";
	while(<IN>){
		chomp;
		($id,$name)=split(/\t/);
next if $id==115;
next if $id==12460;
next if $id==134;
next if $id==166;
next if $id==3746;
next if $id==173;
next if $id==26133;
next if $id==26165;
next if $id==34925;
next if $id==48758;
next if $id==50604;
next if $id==51994;
next if $id==62854;
next if $id==58558;
next if $id==76428;
next if $id==77465;
next if $id==77466;
next if $id==77474;
next if $id==77475;
next if $id==77476;
next if $id==77477;
next if $id==78287;
next if $id==78297;
next if $id==78431;
next if $id==78990;
		@BE=split(/ /,$name);
		grep($BE{$_}++,@BE);
	}
warn "OK. I'm ready to record numbers.\n";
}
sub load_noauth_name {
	open(IN,"tnoan.out") || die;
	while(<IN>){
		chomp;
		($id,$name)=split(/\t/);
		$PARENT{$name}=$id;
	}
}

sub process_name{
	local($_)=@_;
s/ +$//;
	s/ ssp\./ subsp\. /;
	@name_fields= ();
#Planta alba Linnaeus var. nigra Gmelin
	if(@name_fields= m/^((($genus +$species) .* +($rank) +($infra)) +($author))/o){
		&verify_bioname($name_fields[2]);# check to see that bioname is valid;
		&verify_bioname($name_fields[4]);
		&verify_bioname("$name_fields[2] $name_fields[3] $name_fields[4]");
}
#Planta alba Linnaeus var. alba
	if(@name_fields= m/^((($genus +$species).* +($rank) +($infra)))/o){
		&verify_bioname($name_fields[2]);
		&verify_bioname($name_fields[4]);
		&verify_bioname("$name_fields[2] $name_fields[3] $name_fields[4]");
}
#Planta alba Linnaeus
	elsif( (@name_fields= m/^((($genus)() +($species)) +($author))/o)){
		&verify_bioname($name_fields[2]);
		&verify_bioname($name_fields[4]);
		&verify_bioname("$name_fields[2] $name_fields[4]");
}

	elsif( (@name_fields= m/^((($genus)() +× *($species)) +($author))/o)){
		&verify_bioname($name_fields[2]);
		&verify_bioname($name_fields[4]);
		&verify_bioname("$name_fields[2] $name_fields[4]");
}
#Planta sp\.
	elsif( (@name_fields= m/^($genus) sp\./o)){
		&verify_bioname($name_fields[0]);# check to see that bioname is valid;
}
#Planta alba
	elsif( (@name_fields= m/^((($genus)() +($species)))/o)){
		&verify_bioname($name_fields[2]);
		&verify_bioname($name_fields[4]);
		&verify_bioname("$name_fields[2] $name_fields[4]");
}
#Planta
	elsif( (@name_fields= m/^($genus)$/o)){
		&verify_bioname($name_fields[0]);# check to see that bioname is valid;
}
	elsif( (@name_fields= m/^((($genus)() +× *($species)))/o)){
		&verify_bioname($name_fields[2]);
		&verify_bioname($name_fields[4]);
		&verify_bioname("$name_fields[2] \327 $name_fields[4]");
}
else{
warn $_, " namely, $name_fields[0]", " is strange\n";
}
}

@month= qw(
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
%vouchers=(
Habitat=>52,
Color=>50,
Macromorphology=>20,
Population_biology=>24,
Associated_species=>53,
Micromorphology=>19,
Other_label_numbers=>55,
);
%magic_no =(
'Mounted_on_paper'=>1,
'types_cabinet'=>2,
'main_coll'=>1,
'reference_coll'=>4,
);
while(<DATA>){
chomp;
($name,$length)=split(/\t/);
if($name=~s/accession:://){
push(@S_accession,$name);
$S_accession_length{$name}=$length;
$S_accession{$name}="";
}
elsif( $name=~s/folder:://){
push(@S_folder,$name);
$S_folder_length{$name}=$length;
$S_folder{$name}="";
}
}
#set defaults
@S_folder{$S_folder[6], $S_folder[7], $S_folder[9], $S_folder[11]} = ("0") x 4;
sub verify_bioname{
my($tnum)=$main::tnum;
open(OUT,">>bulkload.err") || die "couldn't open the error file\n";
	$old_outfile = select(OUT);
	local($_)=@_;
#print "$_\n";
	if(m/ /){
		unless ($PARENT{$_}){
			$NO_PARENT{$_}++;
			print "$tnum: not found >$_<\n";
			warn "$tnum: 1 not found in name list >$_<\n";
#foreach(keys(%PARENT)){
#warn "$_\n" if m/^[A-Z]/;
#}
		}
		else{
		#print "found >$_<\n";
		}
		foreach(split(/ /)){
			next if m/(f\.|subsp\.|var\.)/;
			print "$tnum: $_ is unrecognized BE\n" unless $BE{$_};
			warn "$tnum: $_ is unrecognized name element\n" unless $BE{$_};
			$NO_BE{$_}++ unless $BE{$_};
		}
	}
	elsif(m/^[A-Z]/){
		unless ($PARENT{$_}){
			$NO_PARENT{$_}++;
			print "$tnum: not found >$_<\n";
			warn "$tnum: 2 not found in name list >$_<\n";
		}
		else{
			#print "found >$_<\n";
		}
		$NO_BE{$_}++ unless $BE{$_};
		print "$tnum: $_ is unrecognized BE\n" unless $BE{$_};
			warn "$tnum: $_ is unrecognized name element\n" unless $BE{$_};
	}
select($old_outfile);
}
#	
sub strip_name{
local($_) = @_;
s/Hook\. f./Hook./g;
s/Rech\. f./Rech./g;
s/Schult\. f./Schult./g;
s/Schultes f./Schultes/g;
#Name: Quercus ×macdonaldii Greene
s/^([A-Z][A-Za-z]+) (X?[-a-z]+).*(subsp\.|ssp\.|var\.|f\.) ([-a-z]+).*/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z]+) × ?([-a-z]+) .+/$1 × $2/||
s/^([A-Z][A-Za-z]+) × ?([-a-z]+)/$1 × $2/||
s/^([A-Z][A-Za-z]+) (X?[-a-z]+) .+/$1 $2/||
s/^([A-Z][A-Za-z]+) (indet\.|sp\.)/$1 indet./||
s/^([A-Z][A-Za-z]+) (X?[-a-z]+)/$1 $2/||
s/^([A-Z][A-Za-z]+) (.+)/$1/;
s/ssp\./subsp./;
s/ +$//;
$_;
}
sub get_authors{
	local($_)=@_;
	s/ in .*//;
	$expair = "(.*) ex (.*)";
	$basionym_ascribed_a= $basio_pub_a= $ascribed_a= $pub_a="unknown";
	if(m/$expair/o){
		if(($basionym_ascribed_a, $basio_pub_a, $ascribed_a, $pub_a) = m/\($expair\) +$expair/o){
			return($basionym_ascribed_a,$basio_pub_a,$ascribed_a,$pub_a);
		}
		elsif(($basio_pub_a, $ascribed_a, $pub_a) = m/\([^)]+\) +$expair/o){
			return($basionym_ascribed_a,$basio_pub_a,$ascribed_a,$pub_a);
		}
		elsif(($basionym_ascribed_a, $basio_pub_a, $pub_a) = m/\($expair\) +(.*)/o){
			return($basionym_ascribed_a,$basio_pub_a,$ascribed_a,$pub_a);
		}
		elsif(($ascribed_a, $pub_a) = m/$expair/o){
			return($basionym_ascribed_a,$basio_pub_a,$ascribed_a,$pub_a);
		}
		else{
			warn "strange ex $_\n";
			return($basionym_ascribed_a,$basio_pub_a,$ascribed_a,$pub_a);
		}
	}
	else{
		if(($basio_pub_a, $pub_a) = m/\(([^)]+)\) +(.*)/o){
			return($basionym_ascribed_a,$basio_pub_a,$ascribed_a,$pub_a);
		}
		elsif(($pub_a) = m/(.*)/o){
			return($basionym_ascribed_a,$basio_pub_a,$ascribed_a,$pub_a);
		}
		else{
			return($basionym_ascribed_a,$basio_pub_a,$ascribed_a,$pub_a);
			warn "This is impossible: $_\n";
		}
	}
}
sub verify_author{
##%committee contains valid author strings
	local($_)=@_;
	$all_auts=$_;
	@authors=();
	push(@authors,$_);
	if(s/,? & (.*)//){
		$NO_COMM{$all_auts}++ unless $committee{$_};
		push(@authors,$1);
		foreach(split(/, +/,$_)){
			push(@authors,$_);
		}
	}
	foreach (@authors){
		s/ in .*//;
		$NO_COMM{$_}++ unless $committee{$_};
	}
	@authors;
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


sub get_elev{
	local($_) = shift;
s/about //;
				s/feet/ft/ ||
				s/meters?/m/ ||
				s/([-\d]+)\.?0*$/$1 ft/;
				s/(\d+) (ft|m) below .*/-$1 $2/;
$_;
}
sub parse_lat {
local($decimal)="";
local($degree)="";
local($_)=shift;
					s/ca\. //;
					s/;$//;
					$old=$_;
s/ (\d) *([NS])/ 0$1$2/;
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
$decimal=&convert_to_decimal($degree);
return($decimal, $degree);
}
elsif(m/^(\d\d?) +([0-5]\d?) ([0-5]\d?) *([NS])$/){
$degree="$1 $2 $3$4";
$decimal=&convert_to_decimal($degree);
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
$degree="$1 $2 ${second}$5";
$decimal=&convert_to_decimal($degree);
return($decimal, $degree);
}
else{
warn "Unanticipated latitude nulled: $_\n";
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
local($decimal)="";
local($degree)="";
local($_)=shift;
#print "Starting long: $_\n";
					s/ca\. //;
					s/;$//;
					$old=$_;
s/ (\d) *([EW])/ 0$1$2/;
s/ (\d\.\d+) *([EW])/ 0$1$2/;
if(m/\d+ (\d) \d+/){
s/(\d+) (\d) (\d+)/$1 0$2 $3/;
}
if(m/^([01]?\d\d?) *([EW])$/){
$decimal=$1; $degree="$1$2";
if($decimal > 180){
$decimal=$degree="";
warn "Unanticipated longitude nulled: $_\n";
}
$decimal="-$decimal";
return($decimal, $degree);
}
elsif(m/^([01]?\d\d?) +([0-5]\d?) *([EW])$/){
$degree="$1 $2$3";
$decimal=&convert_to_decimal($degree);
if($decimal > 180){
$decimal=$degree="";
warn "Unanticipated longitude nulled: $_\n";
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
warn "Unanticipated longitude nulled: $_\n";
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
warn "Unanticipated longitude nulled: $_\n";
}
$decimal="-$decimal";
return($decimal, $degree);
}
elsif(m/^([01]?\d\d?) ([0-5]\d?)(\.\d+) *([EW])$/){
$second= int(60 * $3);
$degree="$1 $2 ${second}$5";
$decimal=&convert_to_decimal($degree);
if($decimal > 180){
$decimal=$degree="";
warn "Unanticipated longitude nulled: $_\n";
}
$decimal="-$decimal";
return($decimal, $degree);
}
else{
warn "Unanticipated longitude nulled: $_\n";
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
	
1;
__DATA__
accession::accession_id	15
accession::specimen_id	0
accession::coll_committee_id	100
accession::coll_num_person_id	60
accession::objkind_id	20	Mounted on Paper Stored in a Box or Bag Preserved in Liquid Microscope Slide Preparation Photograph Illustration Photocopy
accession::inst_abbr	8
accession::coll_num_prefix	5
accession::coll_num_suffix	5
accession::coll_number	6
accession::loc_country	20
accession::loc_state	20
accession::loc_county	60
accession::loc_other	60
accession::loc_place	60
accession::loc_distance	160
accession::loc_elevation	30
accession::loc_coords	25
accession::loc_verbatim	255
accession::phenology	10
accession::notes	255
accession::loc_coords_trs	8
accession::loc_meridian	20
accession::loc_lat_deg	10
accession::loc_long_deg	11
accession::loc_lat_decimal	10
accession::loc_long_decimal	10
accession::coord_flag	8	None TRS Degrees Decimal TRS/Deg
accession::catalog_date	11
accession::catalog_by	30
accession::datestring	40
accession::early_jdate	7
accession::late_jdate	7
accession::bioregion	5
accession::mod_date	11
accession::mod_by	30
accession::datum	10
accession::lat_long_ref_source	20
accession::max_error_distance	10
accession::max_error_units	10
folder::accession_id	15
folder::folder_name_date	10
folder::taxon_id	160	full taxon name minus ex author	
folder::taxon_modifier_id	45
folder::genus_id	35
folder::anno_note	255
folder::addl_taxon_id	160
folder::parent_name_id	160
folder::parent_name_modifier	10
folder::parent_seqno	1
folder::inhouse_notes	255
folder::collectionkind_id	1
folder::mod_date	11
folder::mod_by	30
folder::CA	30
