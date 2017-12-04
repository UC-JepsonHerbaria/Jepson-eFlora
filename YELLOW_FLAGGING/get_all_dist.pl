#This reads the eFlora treatment file, storing bioregions against taxon IDs
#Species containing infras are given the sum of included infras
# Synonyms are assigned the range od the accepted name

use BerkeleyDB;

#Open file of tax syns in the form of syn [tab] accepted name

open(IN,"data_inputs/tax_syns_to_check") || die;
while(<IN>){
	chomp;
	($syn,$accepted)=split(/\t/);
	$TS{$accepted}.="$syn\t";
}
close(IN);

#tie the CCH nomenclatural synonym file
tie(%NS, "BerkeleyDB::Hash", -Filename=>"/usr/local/web/ucjeps_data/ucjeps_data/CDL_nomsyn")|| die "Stopped; couldnt open name_to_code\n";

#Read in the taxon ids
#open(IN,"data_inputs/smasch_taxon_ids.txt") || die;
#while(<IN>){
	#chomp;
	#s/× /&times;/;
	#($code,$name)=split(/\t/);
	#$TNOAN{$name}=$code;
	#$CODE_TO_NAME{$code}=$name;
#}
#close(IN);

tie(%TNOAN, "BerkeleyDB::Hash", -Filename=>"/usr/local/web/ucjeps_data/ucjeps_data/name_to_code", -Flags=>DB_RDONLY)|| die "$!";
#print "26556 $TNOAN{26556}\n";
#foreach (keys(%TNOAN)){
#next unless m/canariensis/;
#print "$_: $TNOAN{$_}\n";
#}
#die;


$nullvec="";
for $i (0 .. 39){
vec($nullvec,$i,1) = 0;
}


use flatten;

#Now get the names and ranges
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
	$all_lines=~s/\xEF\xBB\xBF//;
	$all_lines=~s/ *\r\n/\n/g;
	$all_lines=~s/ +/ /g;
	$all_lines=~s/UNABRIDGED REFERENCES/UNABRIDGED REFERENCE/g;
	
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
		s/^UNABRIDGED\nHISTORICAL WAIF//;
		s/^WAIF//;
		s/UNABRIDGED\nJFP-[78], (.*)//;
		s/UNABRIDGED\nJFP-4, (URBAN WEED)//;
		s/UNABRIDGED\s+JFP-4//;
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
		if(m/\n([A-Z][A-Z-]+ [a-z&][;a-z-]+.*)/){
			$name_for_hc=&strip_name($1);
		}

		if (m/DISTRIBUTION/){
			($cal_dist)=m/BIOREGIONAL DISTRIBUTION: (.*)/;
			$cal_dist=~s/[.; ]*$//;
			$cal_dist=~s/\//, /g;
			$hc=&get_hcode($cal_dist);
#if( $name_for_hc=~/Eriogonum.*polyanthum/i){
if ($TNOAN{$name_for_hc}){
#print "$TNOAN{$name_for_hc} eflora_treatments.txt\t$hc\n";
}
else{
warn "$name_for_hc no code\n";
}
##################### $hc becomes a bit-vector here!
			$hc = pack("b*", unpack("b*",pack("H*",$hc)));
#if( $name_for_hc=~/Eriogonum.*polyanthum/i){
#$hstr= unpack("H*", pack("b*",unpack ("b*", $hc)));
#print "1. $name_for_hc : $hstr\n";
#}

#Taxon ids index the DIST_STRING hash, which contains a bit-vector; "|=" adds to the vector if it already exists
					if($TNOAN{$name_for_hc}){
						if($DIST_STRING{$TNOAN{$name_for_hc}}){
							$DIST_STRING{$TNOAN{$name_for_hc}}|=$hc;
						}
						else{
							$DIST_STRING{$TNOAN{$name_for_hc}}=$hc;
						}
					}
					else{
						if($DIST_STRING{$name_for_hc}){
							$DIST_STRING{$name_for_hc}|=$hc;
						}
						else{
							$DIST_STRING{$name_for_hc}=$hc;
						}
						#print "$name_for_hc not found (TS name)\n"
					}
#also store under subsp. if var. and vice versa
					if($name_for_hc=~s/var\./subsp\./){
#print "$name_for_hc\n";
						if($DIST_STRING{$TNOAN{$name_for_hc}}){
							$DIST_STRING{$TNOAN{$name_for_hc}}|=$hc;
						}
						else{
							$DIST_STRING{$TNOAN{$name_for_hc}}=$hc;
						}
						if(($name_for_infra=$name_for_hc)=~s/ (var\.|subsp\.).*//){
#print "$name_for_infra\n";
							if($DIST_STRING{$TNOAN{$name_for_infra}}){
								$DIST_STRING{$TNOAN{$name_for_infra}}|=$hc;
							}
							else{
								$DIST_STRING{$TNOAN{$name_for_infra}}=$hc;
							}
						}
					}
					elsif($name_for_hc=~s/subsp\./var\./){
						if($DIST_STRING{$TNOAN{$name_for_hc}}){
							$DIST_STRING{$TNOAN{$name_for_hc}}|=$hc;
						}
						else{
							$DIST_STRING{$TNOAN{$name_for_hc}}=$hc;
						}
						if(($name_for_infra=$name_for_hc)=~s/ (var\.|subsp\.).*//){
							if($DIST_STRING{$TNOAN{$name_for_infra}}){
								$DIST_STRING{$TNOAN{$name_for_infra}}|=$hc;
							}
							else{
								$DIST_STRING{$TNOAN{$name_for_infra}}=$hc;
							}
						}
					}
#if( $name_for_hc=~/Eriogonum.*polyanthum/i){
#$hstr= unpack("H*", pack("b*",unpack ("b*", $hc)));
#print "2. $name_for_hc : $hstr\n";
#}
	

#Synonym lines from eFlora
        		while(s/SYNONYMS: +(.*)//){
				#s/Sedum dendroideum .* subsp. praealtum.*/Sedum dendroideum subsp. praealtum/;
				#s/Gaura odorata Sess&eacute; ex Lag., misappl./Gaura odorata/;
            			@syns=split(/; +/,$1);
            			foreach(@syns){
#Skip synonyms with an indication of misapplication or other synonym qualifier
next if m/, misappl/;
next if m/, as treated by Munz/;
next if m/, illeg/;
next if m/, in part/;
next if m/, incl vars/;
next if m/, ined/;
next if m/, inval/;
next if m/, nom\. ambig/;
next if m/, nom\. nud/;
next if m/, nom\. rej/;
next if m/, nom\. superfl/;
next if m/, not Hemsl/;
next if m/, orth\. var/;
next if m/, poss\. illeg/;
next if m/, possibly misappl/;
#s/\327/X/g;
					s/probably //;
					s/Expanded author citation: //;
                			s/_//g;
                			$TJM2{&strip_name($_)}.="$LAN\n";
                			#print &strip_name($_),"\t$cal_dist\t$hc\n";
					if($TNOAN{&strip_name($_)}){
						if($DIST_STRING{$TNOAN{&strip_name($_)}}){
							$DIST_STRING{$TNOAN{&strip_name($_)}}|=$hc;
						}
						else{
							$DIST_STRING{$TNOAN{&strip_name($_)}}=$hc;
						}
					}
					else{
						#print &strip_name($_), "  not found (main SYN name)\n"
						if($DIST_STRING{&strip_name($_)}){
							$DIST_STRING{&strip_name($_)}|=$hc;
						}
						else{
							$DIST_STRING{&strip_name($_)}=$hc;
						}
					}
            			}
        		}
#if( $name_for_hc=~/Eriogonum.*polyanthum/i){
#$hstr= unpack("H*", pack("b*",unpack ("b*", $hc)));
#print "3. $_ $name_for_hc : $hstr\n";
#}
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
					if($TNOAN{$_}){
						if($DIST_STRING{$TNOAN{$_}}){
							$DIST_STRING{$TNOAN{$_}}|=$hc;
						}
						else{
							$DIST_STRING{$TNOAN{$_}}=$hc;
						}

					}
					else{
						if($DIST_STRING{$_}){
							$DIST_STRING{$_}|=$hc;
						}
						else{
							$DIST_STRING{$_}=$hc;
						}
					}
				}
			}


			($ns=$name_for_hc)=~s/(var\.|subsp\.|f\.) //;
			$ns=lc($ns);
#$ns=~s/\327/X/g;
			#warn "$ns\n";
#TIED NOM SYNS
			if($NS{$ns}){
#print "NS FOUND FOR $name_for_hc = $ns\n";
				#warn "$NS{$ns}\n";
				@NS=split(/\t/,$NS{$ns});
				foreach(@NS){
s/ *\327 */ /g;
					$_=ucfirst($_);
					s/([A-Z][a-z]+) ([a-z]+) ([a-z]+)/$1 $2 subsp\. $3/;
					#print "$_\t$cal_dist\t$hc\n" if m/../;
					if($TNOAN{$_}){
						if($DIST_STRING{$TNOAN{$_}}){
							$DIST_STRING{$TNOAN{$_}}|=$hc;
						}
						else{
							$DIST_STRING{$TNOAN{$_}}=$hc;
						}
					}
					else{
						if($DIST_STRING{$_}){
							$DIST_STRING{$_}|=$hc;
						}
						else{
							$DIST_STRING{$_}=$hc;
						}
					}
					s/([A-Z][a-z]+) ([a-z]+) subsp\. ([a-z]+)/$1 $2 var. $3/;
					#print "$_\t$cal_dist\t$hc\n" if m/../;
					if($TNOAN{$_}){
						if($DIST_STRING{$TNOAN{$_}}){
							$DIST_STRING{$TNOAN{$_}}|=$hc;
						}
						else{
							$DIST_STRING{$TNOAN{$_}}=$hc;
						}
					}
					else{
						if($DIST_STRING{$_}){
							$DIST_STRING{$_}|=$hc;
						}
						else{
							$DIST_STRING{$_}=$hc;
						}
					}
				}
			}

	}
if( $name_for_hc=~/Eriogonum.*polyanthum/i){
$hstr= unpack("H*", pack("b*",unpack ("b*", $hc)));
print "4. $_ $name_for_hc : $hstr\n";
}



###############################assign string of regions to TID
open(OUT, ">outputs/tid_dist_string.out") || die;

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
#print join(" ",@regions),"\n";

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
#print join(" ",@regions),"\n";
@regions=sort bycaps (@regions);
#print join(" ",@regions),"\n";
sub bycaps {
	$sortstring{$a} cmp $sortstring{$b} ||
	$a cmp $b
}

	foreach(keys(%DIST_STRING)){
		$tid=$_;
##skip genera;
		next if $CODE_TO_NAME{$tid}=~/[A-Z][a-z-]+ *$/;
		%prov=();
		$distvec = $nullvec;
$hstr= unpack("H*", pack("b*",unpack ("b*", $DIST_STRING{$_})));
#print "$hstr\n";
$bitstr = unpack ("b*", $DIST_STRING{$_});
#print $bitstr, "\n";
		$distvec = pack("b*", unpack("b*",pack("H*",$hstr)));
print OUT "$tid\t";
		foreach $r (sort {$prov{$regions[$a]} <=> $prov{$regions[$b]}}(0 .. 34)){
				if(vec($distvec,$r,1)){
print OUT "$regions[$r],";
				}
		}
#$DIST_STRING{$_}=$hstr;
print OUT  "\n";
}
close(OUT);

sub strip_name{
local($_) = @_;
s/&times;([a-z-]+).*/X $1/||
       s/^([A-Z][-A-Za-z]+) (X?[-a-z]+).*\b(nothosubsp\.|subsp\.|ssp\.|var\.|f\.) ([-a-z]+).*/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z]+) ([a-z&][a-z;-]+).*/$1 $2/;
s/ssp\./subsp./;
$_= ucfirst(lc($_));
$_=~s/ x / X /;
s/\327/X/;
$_;
}

