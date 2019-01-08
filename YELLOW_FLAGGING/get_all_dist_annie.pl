#This reads the eFlora treatment file, storing bioregions against taxon IDs
#Species containing infras are given the sum of included infras
# Synonyms are assigned the range of the accepted name

use BerkeleyDB;
use lib "data_inputs/";
use flatten;
#Open file of tax syns in the form of syn [tab] accepted name

my $today=scalar(localtime());
#my $date = localtime->ymd;
warn "Today is $today\n";

open(OUT6, ">get_all_dist_output_$today.txt") || die;

open(IN,"data_inputs/ICPN_tax_syns_list.txt") || die;
while(<IN>){
	chomp;
next if (m/^#/);
s/X /&times;/;
	($syn,$accepted)=split(/\t/);
	$TS_ICPN{$accepted}.="$syn\t";

next unless m/canariensis/;
print "ICPN: $_: $NS{$_}\n";

}
close(IN);

open(IN,"data_inputs/EFLORA_tax_syns_list.txt") || die;
while(<IN>){
	chomp;
next if (m/^#/);
s/X /&times;/;
	($syn,$accepted)=split(/\t/);
	$TS_EF{$accepted}.="$syn\t";

next unless m/accharis pil /;
print "EFLORA: $_: $NS{$_}\n";

}
close(IN);

open(IN,"data_inputs/tax_syns_to_check") || die;
while(<IN>){
	chomp;
next if (m/^#/);
next if (m/^2/);
next if (m/^Current/);
s/X /&times;/;
	($syn,$accepted)=split(/\t/);
	$TS{$accepted}.="$syn\t";

next unless m/robanche /;
print "CCH: $_: $NS{$_}\n";

}
close(IN);

#tie the CCH nomenclatural synonym file
tie(%NS, "BerkeleyDB::Hash", -Filename=>"/usr/local/web/ucjeps_data/ucjeps_data/CDL_nomsyn", -Flags=>DB_RDONLY)|| die "$!";
foreach (keys(%NS)){
	$NS =~ s/X /&times;/;
#next unless m/juncus /;
#print "$_: $NS{$_}\n";

#next unless m/baccharis /;
#print "$_: $NS{$_}\n";
}

#Read in the taxon ids
open(IN,"/usr/local/web/ucjeps_data/ucjeps_data/smasch_taxon_ids.txt") || die;
while(<IN>){
	chomp;
	s/X /&times;/;
	($code,$name)=split(/\t/);
	$NAME_TO_CODE{$name}=$code; #TNOAN in original
	$CODE_TO_NAME{$code}=$name;

foreach ($name){
next unless m/Zostera pacifica/;
$test = "Zostera pacifica";
print "48951: $NAME_TO_CODE{$test}\n";

$id_test = "48951";
print "Zostera pacifica: $CODE_TO_NAME{$id_test}\n";
}

foreach ($name){
next unless m/canariensis/;
print "$name: $CODE_TO_NAME{$code}\n";
}

foreach ($name){
next unless m/pilularis/;
print "$name: $CODE_TO_NAME{$code}\n";
}

}
close(IN);

#hash of names and hcodes used by get_cpn.pl and eflora_display.php
$file="output/nomsyn_hcode_hash";
tie(%hcode_hash, "BerkeleyDB::Hash", -Filename=>$file)|| print "Couldnt open $file: $!";
	$hcode_hash =~ s/X /&times;/;
foreach(keys(%hcode_hash)){
print "HCODE: $_ $hcode_hash{$_}\n" if m/48951/;
print "HCODE: $_ $hcode_hash{$_}\n" if m/eria naus/;
print "HCODE: $_ $hcode_hash{$_}\n" if m/Baccharis pil/;

}

#die;


$nullvec="";
for $i (0 .. 39){
vec($nullvec,$i,1) = 0;
}

#Now get the names and ranges
open(OUT3, ">outputs/cumulative_synonym_file.txt") || die;
$file="data_inputs/eflora_treatments.txt";
$raw_mod_time=(stat($file))[9];
$db_file="/usr/local/web/ucjeps_data/ucjeps_data/eflora.db";
$db_mod_time=(stat($db_file))[9];
$time_diff=($db_mod_time - $raw_mod_time)/86400;
print <<EOP;
eflora_treatments.txt is $time_diff days older than working database
EOP
#die;
	undef($/);
	open(IN,$file) || die "couldn't open $file\n";

	$all_lines=<IN>;
#converts windows line ends#
	$all_lines =~ s/\xEF\xBB\xBF//;
	$all_lines =~ s/ *\r\n/\n/g;
	$all_lines =~ s/ +/ /g;
	$all_lines =~ s/UNABRIDGED REFERENCES/UNABRIDGED REFERENCE/g;
	
	@all_pars=split(/\n\n+/,$all_lines);
	$element=0;
	foreach(@all_pars){
		s/{\/.*?}//g;
		s/PROOF:.*\n?//g;
		s/UNABRIDGED\nURBAN WEED EXPECTED IN WILDLANDS//;
		s/UNABRIDGED\n(AGRICULTURAL, GARDEN, OR URBAN WEED)//;
		s/UNABRIDGED\nSPONTANEOUS HYBRID//;
		s/UNABRIDGED\nGARDEN WEED//;
		s/UNABRIDGED\nGARDEN AND URBAN WEED//;
		s/UNABRIDGED\nURBAN WEED//;
		s/UNABRIDGED\s+WAIF//;
		s/UNABRIDGED\nHISTORICAL WAIF//;
		s/^WAIF//;
		s/UNABRIDGED\nPOSSIBLY IN CA//;
		s/UNABRIDGED\n(CULTIVATED PLANT|AGRICULTURAL WEED)//;
		s/UNABRIDGED\nEXTIRPATED (WAIF|ALIEN)//;
		s/UNABRIDGED\nNATURALIZED\nEXTIRPATED//;
		s/NATIVE OR NATURALIZED//;
		s/NATURALIZED//;
		s/NATIVE\nEXTIRPATED//;
		s/NATIVE//;
		s/^UNABRIDGED *\n//;
		s|^([A-Z]+ACEAE) $|<center><font size="4"><b>$1</b></font>|ms;
		s|^([A-Z]+ACEAE) \((.*)\)$|<center><font size="4"><b>$1 ($2)</b></font>|ms;
		if(m/\n([A-Z][A-Z-]+ [a-z-]+.*)/){
			$name_1 = ucfirst(lc($1));
			$name_for_hc=&strip_name($name_1);

			print OUT6 "before==>$1\n";
			#fix some names that dont strip correctly
			$name_for_hc =~ s/^Festuca brachyphylla$/Festuca brachyphylla subsp. breviculmis/;
			$name_for_hc =~ s/^Stuckenia filiformis$/Stuckenia filiformis subsp. alpina/;
			$name_for_hc =~ s/^Andropogon glomeratus$/Andropogon glomeratus var. scabriglumis/;
			$name_for_hc =~ s/^Schoenoplectus acutus$/Schoenoplectus acutus var. occidentalis/;

			print OUT6 "after==>$name_for_hc\n";

		}
		elsif (m/\n([&times]*[A-Z][A-Z-]+ [a-z&][;a-z-]+.*)/){
			$name_1 = ucfirst(lc($1));
			$name_for_hc=&strip_name($name_1);
			print "HYBRID==>$name_for_hc\n";
		}

		if (m/DISTRIBUTION/){
			($cal_dist)=m/BIOREGIONAL DISTRIBUTION: (.*)/;
			$cal_dist=~s/[.; ]*$//;
			$cal_dist=~s/\//, /g;
			$cal_dist=~s/possibly //; #delete possibly from 'exc possibly'
									# which is messing up the hcode process for the region just after this but before the ','
			$hc=&get_hcode($cal_dist);
print OUT3 "01-$name_for_hc\taccepted\teflora\n";	

	if( $name_for_hc=~/Eriogonum.*polyanthum/i){
		if ($NAME_TO_CODE{$name_for_hc}){
		print "$name_for_hc\t($NAME_TO_CODE{$name_for_hc})\t$hc\t($cal_dist)\t$file\n";
		}
		else{
		warn "$name_for_hc no code\n";
		}
	}
	
	if( $name_for_hc=~/Baccharis.*pilularis/i){
		if ($NAME_TO_CODE{$name_for_hc}){
		print "$name_for_hc\t($NAME_TO_CODE{$name_for_hc})\t$hc\t($cal_dist)\t$file\n";
		}
		else{
		warn "$name_for_hc no code\n";
		}
	}
##################### $hc becomes a bit-vector here!
			$hc = pack("b*", unpack("b*",pack("H*",$hc)));

	if( $name_for_hc=~/Eriogonum.*polyanthum/i){
		$hstr= unpack("H*", pack("b*",unpack ("b*", $hc)));
		print OUT6 "1. $name_for_hc : $hstr\n";
		warn "1. $name_for_hc : $hstr\n";
	}
	
	if( $name_for_hc=~/Baccharis.*pilularis/i){
		$hstr= unpack("H*", pack("b*",unpack ("b*", $hc)));
		print OUT6 "1. $name_for_hc : $hstr\n";
		warn "1. $name_for_hc : $hstr\n";
	}


#Taxon ids index the DIST_STRING hash, which contains a bit-vector; "|=" adds to the vector if it already exists
					if($NAME_TO_CODE{$name_for_hc}){
						if($DIST_STRING{$NAME_TO_CODE{$name_for_hc}}){
							$DIST_STRING{$NAME_TO_CODE{$name_for_hc}}|=$hc;
						}
						else{
							$DIST_STRING{$NAME_TO_CODE{$name_for_hc}}=$hc;
						}
					}
					else{
						if($DIST_STRING{$name_for_hc}){
							$DIST_STRING{$name_for_hc}|=$hc;
						}
						else{
							$DIST_STRING{$name_for_hc}=$hc;
						}
						
					}
#also store under subsp. if var. and vice versa
					if(($name_for_altA=$name_for_hc)=~s/var\./subsp./){
#print "$name_for_hc\n";
						if($DIST_STRING{$NAME_TO_CODE{$name_for_altA}}){
							$DIST_STRING{$NAME_TO_CODE{$name_for_altA}}|=$hc;
print OUT3 "$name_for_altA\t$name_for_hc\teflora_synonyms==>alternate infra rank11\n";
						}
						else{
							$DIST_STRING{$NAME_TO_CODE{$name_for_altA}}=$hc;
						}
						if(($name_for_infra=$name_for_hc)=~s/ (var\.|subsp.).*//){
#print "$name_for_infra\n";
							if($DIST_STRING{$NAME_TO_CODE{$name_for_infra}}){

								$DIST_STRING{$NAME_TO_CODE{$name_for_infra}}|=$hc;
							}
							else{
								$DIST_STRING{$NAME_TO_CODE{$name_for_infra}}=$hc;
							}
						}
					}
					elsif(($name_for_altB=$name_for_hc)=~s/subsp\./var./){
						if($DIST_STRING{$NAME_TO_CODE{$name_for_altB}}){
							$DIST_STRING{$NAME_TO_CODE{$name_for_altB}}|=$hc;
print OUT3 "$name_for_altB\t$name_for_hc\teflora_synonyms==>alternate infra rank12\n";
						}
						else{
							$DIST_STRING{$NAME_TO_CODE{$name_for_altB}}=$hc;
						}
						if(($name_for_infra=$name_for_hc)=~s/ (var\.|subsp.).*//){
#print "$name_for_infra\n";
							if($DIST_STRING{$NAME_TO_CODE{$name_for_infra}}){
								$DIST_STRING{$NAME_TO_CODE{$name_for_infra}}|=$hc;
							}
							else{
								$DIST_STRING{$NAME_TO_CODE{$name_for_infra}}=$hc;
							}
						}
					
	if( $name_for_hc=~/Eriogonum.*polyanthum/i){
		$hstr= unpack("H*", pack("b*",unpack ("b*", $hc)));
		print OUT6 "2. $name_for_hc : $hstr\n";
		warn "2. $name_for_hc : $hstr\n";
	}

	if( $name_for_hc=~/Baccharis.*pilularis/i){
		$hstr= unpack("H*", pack("b*",unpack ("b*", $hc)));
		print OUT6 "2. $name_for_hc : $hstr\n";
		warn "2. $name_for_hc : $hstr\n";
	}

					}	
                }                                                            
          }

#now add synonyms from supplementary synonym files
	foreach $name_for_hc (keys(%DIST_STRING)){
			$hc=$DIST_STRING{$name_for_hc};
			$name_for_hc=~s/(\d+)/$CODE_TO_NAME{$1}/;

			if($TS{$name_for_hc}){
#print "TS FOUND FOR $name_for_hc\n";
				@TS=split(/\t/,$TS{$name_for_hc});
				foreach(@TS){
#print "TS is $_  AN=$name_for_hc\n";
					if($NAME_TO_CODE{$TS{$name_for_hc}}){
print OUT3 "$TS{$name_for_hc}\t$name_for_hc\tsuppl_syn_file3\n";
						if($DIST_STRING{$NAME_TO_CODE{$TS{$name_for_hc}}}){
							$DIST_STRING{$NAME_TO_CODE{$TS{$name_for_hc}}}|=$hc;
						}
						else{
							$DIST_STRING{$NAME_TO_CODE{$TS{$name_for_hc}}}=$hc;
						}
					}
					else{
print OUT3 "$TS{$name_for_hc}\t$name_for_hc\tsuppl_syn_file4\n";
						if($DIST_STRING{$TS{$name_for_hc}}){
							$DIST_STRING{$TS{$name_for_hc}}|=$hc;
						}
						else{
							$DIST_STRING{$TS{$name_for_hc}}=$hc;
						}
					}
				}
			}


	} 
#now add synonyms from ICPN synonym file
	foreach $name_for_hc (keys(%DIST_STRING)){
			$hc=$DIST_STRING{$name_for_hc};
			$name_for_hc=~s/(\d+)/$CODE_TO_NAME{$1}/;

			if($TS_ICPN{$name_for_hc}){
#print "TS FOUND FOR $name_for_hc\n";
				@TS_ICPN=split(/\t/,$TS_ICPN{$name_for_hc});
				foreach(@TS_ICPN){
#print "TS is $_  AN=$name_for_hc\n";
					if($NAME_TO_CODE{$TS_ICPN{$name_for_hc}}){
print OUT3 "$_\t$name_for_hc\tICPN_nomsyn_file3\n";
						if($DIST_STRING{$NAME_TO_CODE{$TS_ICPN{$name_for_hc}}}){
							$DIST_STRING{$NAME_TO_CODE{$TS_ICPN{$name_for_hc}}}|=$hc;
						}
						else{
							$DIST_STRING{$NAME_TO_CODE{$TS_ICPN{$name_for_hc}}}=$hc;
						}
					}
					else{
print OUT3 "$_\t$name_for_hc\tICPN_nomsyn_file3a\n";
						if($DIST_STRING{$TS_ICPN{$name_for_hc}}){
							$DIST_STRING{$TS_ICPN{$name_for_hc}}|=$hc;
						}
						else{
							$DIST_STRING{$TS_ICPN{$name_for_hc}}=$hc;
						}
					}
				}
			}
			
		if( $name_for_hc=~/Eriogonum.*polyanthum/i){
			$hstr= unpack("H*", pack("b*",unpack ("b*", $hc)));
			print OUT6 "7. $_ $name_for_hc : $hstr\n";
			warn "7. $_ $name_for_hc : $hstr\n";
		}

	if( $name_for_hc=~/Baccharis.*pilularis/i){
		$hstr= unpack("H*", pack("b*",unpack ("b*", $hc)));
		print OUT6 "7. $name_for_hc : $hstr\n";
		warn "7. $name_for_hc : $hstr\n";
	}
			

	}	

#now add synonyms from EFLORA synonym file
	foreach $name_for_hc (keys(%DIST_STRING)){
			$hc=$DIST_STRING{$name_for_hc};
			$name_for_hc=~s/(\d+)/$CODE_TO_NAME{$1}/;

			if($TS_EF{$name_for_hc}){
#print "TS FOUND FOR $name_for_hc\n";
				@TS_EF=split(/\t/,$TS_EF{$name_for_hc});
				foreach(@TS_EF){
#print "TS is $_  AN=$name_for_hc\n";
					if($NAME_TO_CODE{$TS_EF{$name_for_hc}}){
print OUT3 "$_\t$name_for_hc\tEFLORA_nomsyn_file4\n";
						if($DIST_STRING{$NAME_TO_CODE{$TS_EF{$name_for_hc}}}){
							$DIST_STRING{$NAME_TO_CODE{$TS_EF{$name_for_hc}}}|=$hc;
						}
						else{
							$DIST_STRING{$NAME_TO_CODE{$TS_EF{$name_for_hc}}}=$hc;
						}
					}
					else{
print OUT3 "$_\t$name_for_hc\tEFLORA_nomsyn_file4a\n";
						if($DIST_STRING{$TS_EF{$name_for_hc}}){
							$DIST_STRING{$TS_EF{$name_for_hc}}|=$hc;
						}
						else{
							$DIST_STRING{$TS_EF{$name_for_hc}}=$hc;
						}
					}
				}
			}
			
	if( $name_for_hc=~/Eriogonum.*polyanthum/i){
		$hstr= unpack("H*", pack("b*",unpack ("b*", $hc)));
		print OUT6 "8. $_ $name_for_hc : $hstr\n";
		warn "8. $_ $name_for_hc : $hstr\n";
	}

	if( $name_for_hc=~/Baccharis.*pilularis/i){
		$hstr= unpack("H*", pack("b*",unpack ("b*", $hc)));
		print OUT6 "8. $name_for_hc : $hstr\n";
		warn "8. $name_for_hc : $hstr\n";
	}			

	}	
	

###############################assign string of regions to TID
open(OUT4, ">outputs/nomsyn_HCODE_cch_out.txt") || die;
open(OUT2, ">outputs/tid_HCODE_cch_out.txt") || die;
open(OUT, ">outputs/tid_DIST_STRING_cch_out.txt") || die;
open(OUT5, ">outputs/tnoan_DIST_STRING_out.txt") || die;
{
local($/="\n");
open(IN, "data_inputs/region_table.txt") || die;
@regions=();
#print join(" ",@regions),"\n";
while(<IN>){
	chomp;
	($region,$mapcoord, $mapcolor,$longregion,$province) = split(/\t/, $_);
	$prov{$region}=$sort_order++;
	$parent{$region}=$province;
	$expand{$region}=$longregion;
	push(@regions,$region);
	#hash with colors associated with region
	$colors{$region} = $mapcolor;
	#hash withcoordinates associated with region
	$coord{$region} = $mapcoord;
	$region{$mapcolor}=$region;
}
close(IN);
}
#print OUT6 join(" ",@regions),"\n";

#this sort is important, since it establishes the order of the bit vector,
#which should have been generated following a similar sort
#make sure here's not a blank line at data's end
#print join(" ",@regions),"\n";
foreach (@regions){
	if(m/^([a-z])(.*)/){
		$sortstring{$_} = "$2$1";
		$sortstring{$_} =~ s/c$/o/;
	}
	else{
		$sortstring{$_} = $_;
	}
}
print OUT6 join(" ",@regions),"\n";
@regions=sort bycaps (@regions);
#print join(" ",@regions),"\n";
sub bycaps {
	$sortstring{$a} cmp $sortstring{$b} ||
	$a cmp $b
}

	foreach(keys(%DIST_STRING)){
		$tname_list=$_;
print OUT6 "$_\n";
		#$tname=$_;

		@tnames=split(/\t/,$tname_list);
		foreach $tname (@tnames[0 .. $#tnames]){		
		#print $tname."\n";

##skip genera;
next if $tname=~/[A-Z][a-z-]+ *$/;	

		%prov=();
		$distvec = $nullvec;
$hstr= unpack("H*", pack("b*",unpack ("b*", $DIST_STRING{$_})));
#print "-->$hstr\n";
$bitstr = unpack ("b*", $DIST_STRING{$_});
#print $bitstr, "\n";
		$distvec = pack("b*", unpack("b*",pack("H*",$hstr)));

if ($NAME_TO_CODE{$tname}){
	print OUT "$NAME_TO_CODE{$tname}\t";
		foreach $r (sort {$prov{$regions[$a]} <=> $prov{$regions[$b]}}(0 .. 34)){
				if(vec($distvec,$r,1)){
	print OUT "$regions[$r],";
				}
		}
print OUT  "\n";
}
else{
	print OUT "$tname\t";
		foreach $r (sort {$prov{$regions[$a]} <=> $prov{$regions[$b]}}(0 .. 34)){
				if(vec($distvec,$r,1)){
	print OUT "$regions[$r],";
				}
		}
print OUT  "\n";
}

if ($CODE_TO_NAME{$tname}){
	print OUT5 $CODE_TO_NAME{$tname}."\t";
		foreach $r (sort {$prov{$regions[$a]} <=> $prov{$regions[$b]}}(0 .. 34)){
				if(vec($distvec,$r,1)){
	print OUT5 "$regions[$r],";
				}
		}
print OUT5  "\n";
}
else{
	next if $tname=~/[A-Z][a-z-]+ *$/;
	$tname =~ s/=+>\d+//;
	print OUT5 "$tname\t";
		foreach $r (sort {$prov{$regions[$a]} <=> $prov{$regions[$b]}}(0 .. 34)){
				if(vec($distvec,$r,1)){
	print OUT5 "$regions[$r],";
				}
		}
print OUT5  "\n";
}

#$DIST_STRING{$_}=$hstr;
$DIST_STRING{$tname}=$hstr;

if ($NAME_TO_CODE{$tname}){
	print OUT2 "$NAME_TO_CODE{$tname}\t";
	print OUT4 "$tname\t";
	print OUT6 "1. $tname\t";
	print OUT2 "$DIST_STRING{$tname}";
	print OUT4 "$DIST_STRING{$tname}";
	print OUT6 "$DIST_STRING{$tname}\n";
	print OUT2  "\n";
	print OUT4  "\n";
	++$count_new1;
}
else{
	print OUT2 "$tname\t";
	print OUT4 "$tname\t";
	print OUT6 "2. $tname\t";
	print OUT2 "$DIST_STRING{$tname}";
	print OUT4 "$DIST_STRING{$tname}";
	print OUT6 "$DIST_STRING{$tname}\n";
	print OUT2  "\n";
	print OUT4  "\n";
	++$count_new2;
}

#for each taxon name
print OUT6 $tname."--->".$NAME_TO_CODE{$tname}."==>".$DIST_STRING{$tname}."\n";
}
}
close(OUT2);
close(OUT);
close(OUT3);
close(OUT4);
close(OUT5);
close(OUT6);

$newcount = $count_new2+$count_new1;
print "new nomsyn_hcode count (including duplicates): $newcount\n\n";


#hash of names and hcodes used by get_cpn.pl and eflora_display.php
$file="/usr/local/web/ucjeps_data/ucjeps_data/nomsyn_hcode_hash";
tie(%hcode_hash, "BerkeleyDB::Hash", 	
	-Filename => $file,
	-Flags => DB_CREATE)
	|| print "Couldnt open $file: $!\n\n";

foreach(keys(%hcode_hash)){
print "HCODE: $_ $hcode_hash{$_}\n" if m/48951/;
print "HCODE: $_ $hcode_hash{$_}\n" if m/eria naus/;
print "HCODE: $_ $hcode_hash{$_}\n" if m/Baccharis pil/;

++$count_old;
}

undef %hcode_hash;

open(IN,"data_inputs/nomsyn_HCODE_cch_out.txt") || die;
while(<IN>){
	chomp;
s/X /&times;/;
	($tax,$hcode)=split(/\t/);

foreach($tax){

	$hcode_hash{$tax}=$hcode;

++$count_new;



}

}
print "old nomsyn_hcode count: $count_old\n\n";
print "new nomsyn_hcode count: $count_new\n\n";
close(IN);



sub strip_name{
local($_) = @_;

#s/filiformis\b .+ .+ \bsubsp/filiformis subsp./;


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




s/,//g; #delete stray commas
s/^([A-Z][A-Za-z-]+) (\b[-a-z]+) [\w&;'().\- ]+ (\bsubvar\.|\bsubsp\.|\bvar\.|\bf\.|\bnothosubsp\.) (\b[a-z-]+) [\w&;'().\- ]+/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z-]+) (\b[-a-z]+) [\w&;'().\- ]+ (\bsubvar\.|\bsubsp\.|\bvar\.|\bf\.|\bnothosubsp\.) ([-a-z]+)/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z-]+) (\b[-a-z]+) (\bsubvar\.|\bsubsp\.|\bvar\.|\bf\.|\bnothosubsp\.) ([-a-z]+) [\w&;'().\- ]+/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z-]+) (\b[-a-z]+) (\bsubvar\.|\bsubsp\.|\bvar\.|\bf\.|\bnothosubsp\.) ([-a-z]+)/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z-]+) (\b&times;)([-a-z]+) [\w&;'().\- ]+/$1 $2$3/||
s/^([A-Z][A-Za-z-]+) (\b&times;)([-a-z]+)/$1 $2$3/||
s/^([A-Z][A-Za-z-]+) (\b[-a-z]+) [\w&;'().\- ]+/$1 $2/||
s/^([A-Z][A-Za-z-]+) (\b[-a-z]+)/$1 $2/||
s/^(&times;)([A-Z]?[A-Za-z-]+) (\b[-a-z]+) [\w&;'().\- ]+/$1$2 $3/||
s/^(&times;)([A-Z]?[A-Za-z-]+) (\b[-a-z]+)/$1$2 $3/;
s/ +/ /;
s/ +$//;
s/^ +//;

#s/^([A-Z][A-Za-z-]+) (.+)/$1/;

#problem names
#s/ .pers.. b.*rner / /;
#s/palustris l\. var\./palustris var./;
#s/ \(torr\.\) g\.l\. church / /;
#s/ scribn. var. / /;
#s/ schult. var. / /;
#s/ \(retz.) ohwi subsp. / /;
#s/ schult. & schult. f. subsp. / /;
#s/ (p. beauv.) fernald var. / /;
#s/ (l.) gaertn. subsp. / /;
#s/ (michx.) p. beauv. var. / /;
#s/ (dc.) herter subsp. / /;
#s/ cav. var. / /;
#s/ (walter) britton, sterns, & poggenb. [vs]var. / /;



#print "$_ \n";
$_;
}
