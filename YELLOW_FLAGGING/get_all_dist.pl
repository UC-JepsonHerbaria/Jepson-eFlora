#This reads the eFlora treatment file, storing bioregions against taxon IDs
#Species containing infras are given the sum of included infras
# Synonyms are assigned the range od the accepted name

use BerkeleyDB;

#Open file of tax syns in the form of syn [tab] accepted name

open(IN,"/users/richardmoe/4_CDL_buffer/buffer/tax_syns_to_check") || die;
while(<IN>){
	chomp;
	($syn,$accepted)=split(/\t/);
	$TS{$accepted}.="$syn\t";
}
close(IN);

#tie the CCH nomenclatural synonym file
tie(%NS, "BerkeleyDB::Hash", -Filename=>"/users/richardmoe/4_CDL_buffer/buffer/CDL_nomsyn")|| die "Stopped; couldnt open name_to_code\n";

#Read in the taxon ids
open(IN,"smasch_taxon_ids.txt") || die;
while(<IN>){
	chomp;
	s/× /&times;/;
	($code,$name)=split(/\t/);
	$TNOAN{$name}=$code;
	$CODE_TO_NAME{$code}=$name;
}
close(IN);

$nullvec="";
for $i (0 .. 39){
vec($nullvec,$i,1) = 0;
}


use flatten;

#Now get the names and ranges
$file="/users/richardmoe/4_IJM/eflora_treatments.txt";
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
		#s/([0-9])-([0-9])/$1&ndash;$2/g;
s/PROOF:.*\n?//g;
#next unless m/lemmonii/;
		$exclude=0;
		#if(m/^UNABRIDGED/){$exclude=1;};
		if(s/UNABRIDGED\nURBAN WEED EXPECTED IN WILDLANDS//){
			$nativity=qq{URBAN WEED (expected in wildlands)};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\n(AGRICULTURAL, GARDEN, OR URBAN WEED)//){
			$nativity=qq{$1};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\nSPONTANEOUS HYBRID//){
			$nativity=qq{SPONTANEOUS HYBRID};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\nGARDEN WEED//){
			$nativity=qq{GARDEN WEED};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\nGARDEN AND URBAN WEED//){
			$nativity=qq{GARDEN AND URBAN WEED};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\nURBAN WEED//){
			$nativity=qq{URBAN WEED};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\s+WAIF//){
			$nativity=qq{WAIF};
		$exclude=1;
		}
		elsif(s/^UNABRIDGED\nHISTORICAL WAIF//){
			$nativity=qq{HISTORICAL WAIF};
		$exclude=1;
		}
		elsif(s/^WAIF//){
			$nativity=qq{WAIF};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\nJFP-[78], (.*)//){
			$nativity=qq{$1};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\nJFP-4, (URBAN WEED)//){
			$nativity=qq{$1};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\s+JFP-4//){
			$nativity=qq{AGRICULTURAL, GARDEN, OR URBAN WEED};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\n(CULTIVATED PLANT|AGRICULTURAL WEED)//){
			$nativity=qq{$1};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\nEXTIRPATED (WAIF|ALIEN)//){
			$nativity=qq{$1 (extirpated)};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\nNATURALIZED\nEXTIRPATED//){
			$nativity=qq{NATURALIZED (extirpated)};
		$exclude=1;
		}
		elsif(s/NATIVE OR NATURALIZED//){
			$nativity=qq{NATIVE OR NATURALIZED};
		}
		elsif(s/NATURALIZED//){
			$nativity=qq{NATURALIZED};
		}
		elsif(s/NATIVE\nEXTIRPATED//){
			$nativity=qq{NATIVE (extirpated)};
		}
		elsif(s/NATIVE//){
			$nativity=qq{NATIVE};
		}
		elsif(s/^UNABRIDGED *\n//){$exclude=1;};
		s|^([A-Z]+ACEAE) $|<center><font size="4"><b>$1</b></font>|ms;
		s|^([A-Z]+ACEAE) \((.*)\)$|<center><font size="4"><b>$1 ($2)</b></font>|ms;
		if(m/\n([A-Z][A-Z-]+ [a-z&][;a-z-]+.*)/){
			$name_for_hc=&strip_name($1);
		}

		if (m/DISTRIBUTION/){
			($cal_dist)=m/BIOREGIONAL DISTRIBUTION: (.*)/;
			$cal_dist=~s/[.; ]*$//;
			$hc=&get_hcode($cal_dist);
##################### $hc becomes a bit-vector here!
			$hc = pack("b*", unpack("b*",pack("H*",$hc)));

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
					if($name_for_hc=~s/var\./subsp./){
						if($DIST_STRING{$TNOAN{$name_for_hc}}){
							$DIST_STRING{$TNOAN{$name_for_hc}}|=$hc;
						}
						else{
							$DIST_STRING{$TNOAN{$name_for_hc}}=$hc;
						}
						if(($name_for_infra=$name_for_hc)=~s/ (var\.|subsp.).*//){
							if($DIST_STRING{$TNOAN{$name_for_infra}}){
								$DIST_STRING{$TNOAN{$name_for_infra}}|=$hc;
							}
							else{
								$DIST_STRING{$TNOAN{$name_for_infra}}=$hc;
							}
						}
					}
					elsif($name_for_hc=~s/subsp\./var./){
						if($DIST_STRING{$TNOAN{$name_for_hc}}){
							$DIST_STRING{$TNOAN{$name_for_hc}}|=$hc;
						}
						else{
							$DIST_STRING{$TNOAN{$name_for_hc}}=$hc;
						}
						if(($name_for_infra=$name_for_hc)=~s/ (var\.|subsp.).*//){
							if($DIST_STRING{$TNOAN{$name_for_infra}}){
								$DIST_STRING{$TNOAN{$name_for_infra}}|=$hc;
							}
							else{
								$DIST_STRING{$TNOAN{$name_for_infra}}=$hc;
							}
						}
					}
#moved to later to accumulate properly
			if($TS{$name_for_hc}){
				@TS=split(/\t/,$TS{$name_for_hc});
				foreach(@TS){
##warn "TS is $_  AN=$name_for_hc\n";
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
			#warn "$ns\n";
			if($NS{$ns}){
				#warn "$NS{$ns}\n";
				@NS=split(/\t/,$NS{$ns});
				foreach(@NS){
					$_=ucfirst($_);
					s/([A-Z][a-z]+) ([a-z]+) ([a-z]+)/$1 $2 subsp. $3/;
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
					s/([A-Z][a-z]+) ([a-z]+) subsp. ([a-z]+)/$1 $2 var. $3/;
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
	

#Synonym lines from eFlora
        		while(s/SYNONYMS: +(.*)//){
				s/Sedum dendroideum .* subsp. praealtum.*/Sedum dendroideum subsp. praealtum/;
				s/Gaura odorata Sess&eacute; ex Lag., misappl./Gaura odorata/;
            			@syns=split(/; +/,$1);
            			foreach(@syns){
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
					s/([A-Z][a-z]+) ([a-z]+) ([a-z]+)/$1 $2 subsp. $3/;
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
					s/([A-Z][a-z]+) ([a-z]+) subsp. ([a-z]+)/$1 $2 var. $3/;
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



###############################assign string of regions to TID
open(OUT, ">tid_dist_string.out") || die;

{
local($/="\n");
open(IN, "region_table.txt") || die;
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
##die;

tie %DBM, "BerkeleyDB::Hash", -Filename => "/users/richardmoe/Desktop/CDL_DBM" or die "Cannot open file CDL_DBM: $! $BerkeleyDB::Error\n" ;
while(($key,$value)=each(%DBM)){
#print "$key: $value\n";
	@fields=split(/\t/,$value);
	if($fields[12]){
#skip genera;
		next if $CODE_TO_NAME{$fields[0]}=~/[A-Z][a-z-]+ *$/;
#Use the species if there's a dist for the hybrid
		if($CODE_TO_NAME{$fields[0]}=~/ X /){
			($species=$CODE_TO_NAME{$fields[0]})=~s/ X / /;
			if($DIST_STRING{$TNOAN{$species}}){
				$fields[0]=$TNOAN{$species};
			}
		}

		if($DIST_STRING{$fields[0]}){
##do some map thing
		}
		else{
			#print "$CODE_TO_NAME{$fields[0]}\n"
		}
	}
#print "$key $fields[0]\n" unless $CODE_TO_NAME{$fields[0]};
}

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

__END__
$nullvec="";
for $i (0 .. 39){
vec($nullvec,$i,1) = 0;
}
$hc ="0000000000";
$distvec = $nullvec;
	#translate hex code to bit vector
print unpack("b*",pack("H*",$hc)), "\n";
$testvec{'SP'} = pack("b*", unpack("b*",pack("H*",$hc)));
$hc ="ff00000000";
$distvec2 = pack("b*", unpack("b*",pack("H*",$hc)));
$testvec{'SP'} |= $distvec2;
$bitstr = unpack ("b*", $testvec{'SP'});
print $bitstr, "\n";
$hc ="ffff000000";
$testvec{'SP'}  |= pack("b*", unpack("b*",pack("H*",$hc)));
$bitstr = unpack ("b*", $testvec{'SP'});
print $bitstr, "\n";
$hstr= unpack("H*", pack("b*",unpack ("b*", $testvec{'SP'})));
print "$hstr\n";

