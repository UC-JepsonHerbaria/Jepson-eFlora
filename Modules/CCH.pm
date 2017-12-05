package CCH;
use Exporter;
@ISA = ('Exporter');
#@EXPORT = qw(%alter %ignore &strip_name &verify_co @month &get_TRS &get_elev &parse_lat &parse_long &load_data &load_cal &load_be &load_noauth_name %seen %datafile %coll_comm &load_collectors %PARENT);
@EXPORT = qw(&munge_collectors &prune_fields &strip_name %max_elev %TID &is_bad_elev &verify_co &outside_CA_box  &dg_to_dc &dms2decimal &dmsdecimal &is_bad_elev %alter %exclude &load_noauth_name );

open(IN, "/Users/richardmoe/4_DATA/CDL/alter_names") || die "couldnt open alter_names\n";
while(<IN>){
	chomp;
	($bad, $good)=split(/\t/);
	$alter{$bad}=$good;
}
close(IN);

open(IN, "/Users/richardmoe/4_CDL_BUFFER/smasch/mosses") || die "couldnt open mosses for non vascular exclusion $!\n";
while(<IN>){
	chomp;
	$exclude{$_}++;
s/\W.*//;
	$exclude{$_}++;
}
close(IN);

open(IN, "/Users/richardmoe/4_DATA/CDL/max_county_elev.txt") || die;
while(<IN>){
        @fields=split(/\t/);
        $fields[3]=~s/\+//;
        $fields[3]=~s/,//;
        $max_elev{$fields[1]}=$fields[3];
}
close(IN);

sub is_bad_elev {
	my($elev, $e_units)=@_;
	$Mt_Whitney="4420";
	$Death_Valley="-90";

	if($e_units =~/^[Mm]/){
    		if(($elev > $Mt_Whitney) || ($elev < $Death_Valley)){
			return 1;
    		}
	}
	elsif($e_units =~/^[Ff]/){
    		if(($elev_ft > ($Mt_Whitney * 3.28)) || ($elev_ft < ($Death_Valley * 3.28))){
			return 1;
    		}
    	}
}


sub outside_CA_box {
	my($latitude, $longitude)=@_;
	my $CA_west_long=-124.43;
	my $CA_east_long=-114.13;
	my $CA_north_lat=42.01;
	my $CA_south_lat=32.53;
	if($latitude > $CA_north_lat){
		#print "$latitude > $CA_north_lat\n";
		return 1;
	}
	if($latitude < $CA_south_lat ){
		#print "$latitude < $CA_south_lat\n";
		return 1;
	}
	if($longitude > $CA_east_long ){
		#print "$longitude > $CA_east_long\n";
		return 1;
	}
	if($longitude < $CA_west_long){
		#print "$longitude < $CA_west_long\n";
		return 1;
	}
}



sub dg_to_dc {
	local($_)=@_;
	my $decimal="";
	$deg_max{"W"}= $deg_max{"E"}=180;
	$deg_max{"N"}= $deg_max{"S"}=90;
	if(($deg,$min,$sec,$hem)=m/^(\d+) (\d+) ([0-9.]+) *([WwEeNnSs])$/){
		$decimal=dms2decimal($deg, $min, $sec);
		if(($deg > $deg_max{uc($hem)}) || $min >= 60 || $sec >= 60){
			$decimal="";
		}
	}
	elsif(($deg,$min,$hem)=m/^(\d+) ([0-9.]+) *([WwEeNnSs])$/){
		$decimal=dm2decimal($deg, $min);
		if(($deg > $deg_max{uc($hem)} || $min >= 60 )){
			$decimal="";
		}
	}
	elsif(($deg,$hem)=m/^([0-9.]+) *([WwEeNnSs])$/){
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
return "$decimal";
}


sub dms2decimal {
    my ($degrees, $minutes, $seconds) = @_;
    my $decimal;

    if ($degrees >= 0) {
        $decimal = $degrees + $minutes/60 + $seconds/3600;
    }
    else {
        $decimal = $degrees - $minutes/60 - $seconds/3600;
    }

    return $decimal;
}

sub dm2decimal {
    my ($degrees, $minutes) = @_;
    return dms2decimal($degrees, $minutes, 0);
}

sub verify_co {
local($_)=shift;
s/ (Co\.|County).*//;
s| */.*||;
s/\cK//g;
s/^ *//;
s/-.*//;
s/ and.*//;
s/^'$/unknown/;
s/^:ale$/unknown/;
s/^4$/unknown/;
s/  / /g;
s/ (and|or|to|&) .*//;
s/ *$//;
s/ *\(.*//;
s/ *\.$//;
s/ *\/.*//;
s/ *\?$//;
s/ ?- .*//;
s/ (&|and) .*//;
s/ or .*//;
s/-.*//;
s/\?//;
s/\[//;
s/\]//;
s/[,;] .*//;
s/^ *$/unknown/;
s/^SL:O/San Luis Obispo/;
s/^Fresno line/Fresno/;
s/^Butte VHO$/Butte/;
s/^Jct  Alpine, Amador, El Dorado$/Alpine/;
s/^NE San Bernardino$/San Bernardino/;
s/^aIWEE$/unknown/;
s/^UC Davis Campus/Yolo/;
s/^Yolo Grasslands Park/Yolo/;
s/^boundary between //;
s/^San Bernardino NE$/San Bernardino/;
s/\.\.\..*//;
s/ +$//;
s/Santa BarbaraSanta Barbara/Santa Barbara/;
s/:.*//;

$_=ucfirst(lc($_));
s/ (.)/ \u$1/g;

s/^ *$/Unknown/;
s/^$/unknown/;
s/^Alemeda/Alameda/;
s/^Ange;es/Angeles/;
s/^Angelos/Angeles/;
s/^Armador/Amador/;
s/^Barbarba/Barbara/;
s/^Benito/San Benito/;
s/^Berbardino/Bernardino/;
s/^Bernadino/Bernardino/;
s/^Bernadrino/Bernardino/;
s/^Brenardino/Bernardino/;
s/^Butte`$/Butte/;
s/^Calavaras/Calaveras/;
s/^Calaveris/Calaveras/;
s/^Calveras/Calaveras/;
s/^Can Bernardino$/San Bernardino/;
s/^Clousa$/Colusa/;
s/^Colusaq$/Colusa/;
s/^Conta Costa$/Contra Costa/;
s/^Contra Costra$/Contra Costa/;
s/^Del Monte/Del Norte/;
s/^East //;
s/^East San Diego/San Diego/;
s/^El ?[dD]or[ao]do/El Dorado/;
s/^El Dorada$/El Dorado/;
s/^El Dorata$/El Dorado/;
s/^El Dorodo/El Dorado/;
s/^El[Dd]orado/El Dorado/;
s/^Eldorado$/El Dorado/;
s/^Eldorado/El Dorado/;
s/^Elorado$/El Dorado/;
s/^Frensno$/Fresno/;
s/^Fresno to Monterey/Fresno/;
s/^Fresno-Inyo/Fresno/;
s/^Genn$/Glenn/;
s/^Glen$/Glenn/;
s/^Humbloldt/Humboldt/;
s/^Humbodt/Humboldt/;
s/^Humbolt/Humboldt/;
s/^Hunmboldt$/Humboldt/;
s/^Imperial San Diego/Imperial/;
s/^Imperial.+/Imperial/;
s/^Inyo San Bernardino/Inyo/;
s/^Inyo.+/Inyo/;
s/^Inyoinyo/Inyo/;
s/^Inyp/Inyo/;
s/^Kern Inyo/Kern/;
s/^Kern.*/Kern/;
s/^King$/Kings/;
s/^Lassen`$/Lassen/;
s/^Lassrn$/Lassen/;
s/^Los Angeles.+/Los Angeles/;
s/^Los Angelos/Los Angeles/;
s/^Maraposa$/Mariposa/;
s/^Mateo/San Mateo/;
s/^Mendecino$/Mendocino/;
s/^Mendicino$/Mendocino/;
s/^Mendicino/Mendocino/;
s/^Merved$/Merced/;
s/^Mododc/Modoc/;
s/^Mondocino$/Mendocino/;
s/^Mono.*/Mono/;
s/^Monterery/Monterey/;
s/^Monterey SE$/Monterey/;
s/^Monterey`/Monterey/;
s/^Monterrey/Monterey/;
s/^Montery/Monterey/;
s/^Not Given/Unknown/;
s/^Olumas$/Plumas/;
s/^Orange.*/Orange/;
s/^Placer.*/Placer/;
s/^Pluams$/Plumas/;
s/^Plumus$/Plumas/;
s/^Riveride/Riverside/;
s/^Riverside originally San Diego/Riverside/;
s/^Riverside.*/Riverside/;
s/^Riveside/Riverside/;
s/^Rvierside/Riverside/;
s/^S\. ?E\. ?//;
s/^San Barbara$/Santa Barbara/;
s/^San Barbara/Santa Barbara/;
s/^San Ben$/San Benito/;
s/^San Beradino/San Bernardino/;
s/^Sasn Bernardino/San Bernardino/;
s/^Sierra Nevada/Sierra/;
s/^San Berardino/San Bernardino/;
s/^San Berdo$/San Bernardino/;
s/^San Bernadino/San Bernardino/;
s/^San Bernadion/San Bernardino/;
s/^San Bernardino Los Angeles/San Bernardino/;
s/^San Bernardinoo/San Bernardino/;
s/^San Bernarndino$/San Bernardino/;
s/^San Bernidino/San Bernardino/;
s/^San Bernadiino/San Bernardino/;
s/^San Clara/Santa Clara/;
s/^San Cruz$/Santa Cruz/;
s/^San Deigo/San Diego/;
s/^San Diego Riverside/San Diego/;
s/^San Diego.*/San Diego/;
s/^San Diegosan Diego/San Diego/;
s/^San Fransisco$/San Francisco/;
s/^San Joaqu.n/San Joaquin/;
s/^San Juaquin$/San Joaquin/;
s/^San Lius Obispo$/San Luis Obispo/;
s/^San Louis Obispo$/San Luis Obispo/;
s/^Santa Barabara/Santa Barbara/;
s/^Santa BarbaraSanta Barbara/Santa Barbara/;
s/^Santa Barbara`$/Santa Barbara/;
s/^Santa Cruz`$/Santa Cruz/;
s/^Santa Mateo/San Mateo/;
s/^Santo Cruz/Santa Cruz/;
s/^Shassta/Shasta/;
s/^Shasta`$/Shasta/;
s/^Shata$/Shasta/;
s/^Siera$/Sierra/;
s/^Sierra-Plumas/Sierra/;
s/^Siiskiyou$/Siskiyou/;
s/^Sikiyou/Siskiyou/;
s/^Sisikiyou$/Siskiyou/;
s/^Siskyou$/Siskiyou/;
s/^Sntna Barbara$/Santa Barbara/;
s/^Solana/Solano/;
s/^Solona/Solano/;
s/^Stanilaus$/Stanislaus/;
s/^Stansilaus$/Stanislaus/;
s/^Sutter`$/Sutter/;
s/^Tehana$/Tehama/;
s/^Tehema$/Tehama/;
s/^Toulomne/Tuolumne/;
s/^Toulumne$/Tuolumne/;
s/^Trinity ()$/Trinity/;
s/^Trinuty/Trinity/;
s/^Tulare .*/Tulare/;
s/^Tuolmne/Tuolumne/;
s/^Tuolomne/Tuolumne/;
s/^Ventura.*/Ventura/;
s/^VenturaVentura/Ventura/;
s/^Western //;
s/^[Uu][nN][Kk]$/Unknown/;
s/^\?$/Unknown/;
s|Colusa/Lake|Colusa|;
s/San Benrardino/San Bernardino/;
s/San Beranrdino/San Bernardino/;

s/Davis Yolo/Yolo/;
s/Loa Angeles/Los Angeles/;
s/Los Aneles/Los Angeles/;
s/Medocino/Mendocino/;
s/Mendocina/Mendocino/;
s/Mendoncino/Mendocino/;
s/Plumos/Plumas/;
s/Rivrside/Riverside/;
s/San Bernardino Basin Region/San Bernardino/;
s/San Bernardio/San Bernardino/;
s/San Bernarino/San Bernardino/;
s/San Bernerdino/San Bernardino/;
s/San Bernrdino/San Bernardino/;
s/SanBernardino/San Bernardino/;
s/Sandiego/San Diego/;
s/Sonoa/Sonoma/;
s/Talure/Tulare/;
s/Trinit/Trinity/;
s/Tuolumme/Tuolumne/;
s/Urodoc/Modoc/;


if(m/^(Alameda|Alpine|Amador|Butte|Calaveras|Colusa|Contra Costa|Del Norte|El Dorado|Fresno|Glenn|Humboldt|Imperial|Inyo|Kern|Kings|Lake|Lassen|Los Angeles|Madera|Marin|Mariposa|Mendocino|Merced|Modoc|Mono|Monterey|Napa|Nevada|Orange|Placer|Plumas|Riverside|Sacramento|San Benito|San Bernardino|San Diego|San Francisco|San Joaquin|San Luis Obispo|San Mateo|Santa Barbara|Santa Clara|Santa Cruz|Shasta|Sierra|Siskiyou|Solano|Sonoma|Stanislaus|Sutter|Tehama|Trinity|Tulare|Tuolumne|Unknown|Ventura|Yolo|Yuba)$/){
return($_);
}
else{
return("SKIP");
}
}

####patterns######
$genus = '[A-Z][a-z-]+';
$species = '[a-z-]+';
$rank = 'subvar\.?|var\.?|ssp\.?|subsp\.?|f\.|forma';
$infra = '[a-z-]+';
$author = '.*';
########
sub load_collectors {
$collector_file= "collectors_id";
$time= -C "$collector_file";
print "Collector file ", int($time)," days old\n";
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
$time= -C "/Users/richardmoe/4_DATA/taxon_ids/smasch_taxon_ids.txt";

print "TNOAN file ", int($time)," days old\n";
	open(IN,"/Users/richardmoe/4_DATA/taxon_ids/smasch_taxon_ids.txt") || die;
	while(<IN>){
		chomp;
next if m/^#/;
		($id,$name,@residue)=split(/\t/);
#next if $id==115;
next if $id==12460;
#next if $id==134;
next if $id==3746;
#next if $id==173;
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
		$TID{$name}=$id;
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
#	
sub strip_name{
local($_) = @_;
   s/× /X /g;
#print "$_ \t";

s/'//g;
s/`//g;
s/\?//g;
s/ *$//;
s/  +/ /g;
s/ spp\./ subsp./;
s/ssp\./subsp./;
s/ ssp / subsp. /;
s/ subsp / subsp. /;
s/ var / var. /;
s/ var. $//;
s/ sp\..*//;
s/ sp .*//;
s/ [Uu]ndet.*//;
s/ x / X /;
s/ . / X /;
s/ *$//;


s/Hook\. f./Hook./g;
s/Rech\. f./Rech./g;
s/Schult\. f./Schult./g;
s/Schultes f./Schultes/g;
s/Hallier f\./Hallier/g;
#Name: Quercus ×macdonaldii Greene
s/^([A-Z][A-Za-z]+) (X?[-a-z]+).*? (subvar\.|subsp\.|ssp\.|var\.|f\.) ([-a-z]+).*/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z]+) X ([-a-z]+) .+/$1 X $2/||
s/^([A-Z][A-Za-z]+) × ?([-a-z]+) .+/$1 X $2/||
s/^([A-Z][A-Za-z]+) × ?([-a-z]+)/$1 X $2/||
s/^([A-Z][A-Za-z]+) (X?[-a-z]+) .+/$1 $2/||
s/^([A-Z][A-Za-z]+) (indet\.|sp\.)/$1 indet./||
s/^([A-Z][A-Za-z]+) (X?[-a-z]+)/$1 $2/||
s/^([A-Z][A-Za-z]+) (X [-a-z]+)/$1 $2/||
s/^([A-Z][A-Za-z]+) (.+)/$1/;
s/ssp\./subsp./;
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


sub get_elev{
	local($_) = shift;
s/about //;
   s/[\[\]]//g;
   s/ca\.//;
   s/Â±//;
   s/&lt;</;
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
	s/\xB0/&deg;/g;
	s/\cK+$//;
	s/\cK//g;
	s/\cM/ /g;
	s/\x91/'/g;
	s//'/g;
	s/Õ/'/g;
	s/Ò/"/g;
	s/Ó/"/g;
s/\222/'/g;
return($_);
}
sub munge_collectors{
my ($Collector_full_name)=shift;
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
                s/  */ /g; 
                s/^J\. ?C\. $/J. C./;
                s/John A. Churchill M. ?D. $/John A. Churchill M. D./;
                s/L\. *F\. *La[pP]r./L. F. LaPre/;
                s/B\. ?G\. ?Pitzer/B. Pitzer/;
                s/J. André/J. Andre/;
                s/Jim André/Jim Andre/;
                s/ *$//;
                $_= $alter_coll{$_} if $alter_coll{$_};                        ++$collector{$_};
                if($Associated_collectors){
			$Associated_collectors=~s/D. *Charlton, *B. *Pitzer, *J. *Kniffen, *R. *Kniffen, *W. *W. *Wright, *Howie *Weir, *D. *E. *Bramlet/D. Charlton, et al./;
			$Associated_collectors=~s/Mark *Elvin, *Cathleen *Weigand, *M. *S. *Enright, *Michelle *Balk, *Nathan *Gale, *Anuja *Parikh, *K. *Rindlaub/Mark Elvin, et al./;
			$Associated_collectors=~s/P. *Mackay/P. MacKay/;
			$Associated_collectors=~s/P. *J. *Mackay/P. J. MacKay/;
			$Associated_collectors=~s/.*Boyd.*Bramlet.*Kashiwase.*LaDoux.*Provance.*Sanders.*White/et al./;
			$Associated_collectors=~s/.*Boyd.*Bramlet.*Kashiwase.*LaDoux.*Provance.*Sanders.*White/et al./;
			$Associated_collectors=~s/.*Boyd.*Kashiwase.*LaDoux.*Provance.*Sanders.*White.*Bramlet/et al./;
                        $Associated_collectors=~s/ \./\./g;
                        $Associated_collectors=~s/^w *\/ *//;
                        $Associated_collectors=~s/([A-Z]\.)([A-Z]\.)([A-Z]\.)/$1 $2 $3 /g; 
                        $Associated_collectors=~s/([A-Z]\.)([A-Z]\.)/$1 $2 /g; 
                        $Associated_collectors=~s/([A-Z]\.)([A-Z]\.)/$1 $2/g;
                        $Associated_collectors=~s/([A-Z]\.) ([A-Z]\.)([A-Z])/$1 $2 $3/g;
                        $Associated_collectors=~s/([A-Z]\.)([A-Z])/$1 $2/g;
                        $Associated_collectors=~s/,? (&|and) /, /g; 
                        $Associated_collectors=~s/([A-Z])([A-Z]) ([A-Z][a-z])/$1. $2. $3/g;
                        $Associated_collectors=~s/([A-Z]) ([A-Z][a-z])/$1. $2/g;
                        $Associated_collectors=~s/, ,/,/g;
                        $Associated_collectors=~s/,([^ ])/, $1/g;
                	$Associated_collectors=~s/et\. ?al/et al/;
                	$Associated_collectors=~s/et all/et al/;
                	$Associated_collectors=~s/et al\.?/et al./;
                	$Associated_collectors=~s/etal\.?/et al./;
                	$Associated_collectors=~s/([^,]) et al\./$1, et al./;
                	$Associated_collectors=~s/ & others/, et al./;
                	$Associated_collectors=~s/, others/, et al./;
                	$Associated_collectors=~s/L\. *F\. *La[pP]r./L. F. LaPre/;
                	$Associated_collectors=~s/B\. ?G\. ?Pitzer/B. Pitzer/;
                	$Associated_collectors=~s/ +,/, /g; 
                	$Associated_collectors=~s/  */ /g; 
                	$Associated_collectors=~s/,,/,/g;
                	$Associated_collectors=~s/J. André/J. Andre/;
                	$Associated_collectors=~s/Jim André/Jim Andre/;
                #warn $Associated_collectors;
                        if(length($_) > 1){ 
                                $combined_collectors="$_, $Associated_collectors";
                                if($alter_coll{$combined_collectors}){
                                	$combined_collectors= $alter_coll{$combined_collectors};
                                }   
                                ++$collector{"$combined_collectors"};
                                #warn $Associated_collectors, $combined_collectors;
                        }   
                        else{
                                if($alter_coll{$Associated_collectors}){
                                $Associated_collectors= $alter_coll{$Associated_collectors};
                                }   
                                ++$collector{$Associated_collectors};
                        }   
                        #++$collector{$_};
                }   
                else{
                        #if($alter_coll{$_}){
                        #$_= $alter_coll{$_};
                        #}  
                        #++$collector{$_};
                }   
        }   
return($Collector_full_name,$Associated_collectors);
}
	
1;
__DATA__
