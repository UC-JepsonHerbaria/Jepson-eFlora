package flatten;
use Exporter;
@ISA = ('Exporter');
@EXPORT = qw(&get_hcode %qualified $nullvec @CA);
#flatten6
#assumes hierarchicality of SNE, DMoj, and MP
#adds n & s ChI
#sorts differently, ignoring latitudinal descriptors
@NCoR = ('NCoRO','NCoRI','NCoRH');
@CaR = ('CaRF','CaRH');
@cSN = ('cSNF', 'cSNH');
@nSN = ('nSNF', 'nSNH');
@sSN = ('sSNF', 'sSNH');
@SNF=('nSNF','cSNF','sSNF');
@SNH=('nSNH','cSNH','sSNH');
@SN = (@SNF,@SNH,'Teh');
@GV = ('ScV','SnJV');
@TR = ('WTR','SnGb','SnBr');
@ChI = ('nChI','sChI');
@PR = ('PR', 'SnJt');
@SW = ('SCo',@ChI,@PR,@TR);
@SCoR =  ('SCoRO','SCoRI');
@CW = (@SCoR, 'CCo','SnFrB');
@NW = (@NCoR, 'KR', 'NCo');
@MP = ('Wrn','MP');
@SNE = ('WaI','SNE');
@GB = (@MP, @SNE);
@DMoj = ('DMoj', 'DMtns');
@D = (@DMoj,'DSon');
@CA_FP = (@NW, @CaR, @SN, @GV, @CW, @SW);
@CA = (@CA_FP, @D, @GB);
foreach (@CA){
if(m/^([a-z])(.*)/){
$sortstring{$_} = "$2$1";
$sortstring{$_} =~ s/c$/o/;
}
else{
$sortstring{$_} = $_;
}
}
@CA = sort bycaps (@CA);
sub bycaps {
$sortstring{$a} cmp $sortstring{$b} ||
$a cmp $b
}
grep($qualified{$_}++,@CA);
foreach $i (0 .. $#CA){
$qualified{$CA[$i]} = $i;
}
#print join ("\n",sort bycaps keys %qualified);

for $i (0 .. 34){
vec($nullvec,$i,1) = 0;
}
#print &get_hcode("CaRH, SNH (esp e slope), GB"), "\n";
#die

#open(IN,"markup_plusFT") || die;
#$/="";
#while(<IN>){
#if(m/NDS>(.*)<\/NDS>/){
#$nds=$1;
#if(m/<HCODE>(.*)<\/HCODE>/){
#$hcode=$1;
#$new_hcode=&get_hcode($nds);
#unless($hcode eq $new_hcode){
#($comment)=m/<comment>(.*)<\/comment>/;
#print <<EOP;
#$nds
#$hcode
#$new_hcode
#$comment
#
#EOP
#}
#}
#}
#}
#



sub get_hcode {
%rawlocs=();
local($_)=shift;
return "0000000000" if m/[Ff]ormerly\)/;
$line=$_;
#take care of n SN, n & c SNF etc
if(m/[scnwe] SN[^E]/ ||  m/[scnwe] SN$/){
#this added June 27,1998
		$_ = &SNkludge($_);
	}


#############
#edge kludges
	if(m/edge/){
		$_ = &edgekludge($_);
	}
#############

#adjacent kludges
	elsif(m/adjacent/){
		$_ = &adjkludge($_);
	}

	if(m/PR/){
		$_ = &PRkludge($_);
	}

#############
	s/s CA([^-])/sCA$1/;
s/waif in [^ ]+//;
	s/ ?\(?[Ff]ormerly[^)]+\)//;
	s/([ns]) ChI/$1ChI/g;
	s/n (DMoj)/$1 (exc DMtns)/ unless m/DMtns/;
	s/(n SNE)/$1 (exc WaI)/ unless m/W&I/;
s/MP \(caves in Lava[^)]+\)/MP (exc Wrn)/ unless m/Wrn/;
	s/CA-FP/CA_FP/;
	s/W&I/WaI/;
	s/[?;]//g;
	#($name,$string) = m/(^.*?) *\t *(.*)/;
	s/\. *$//;
	@poslocs = split(/[ .;,]+/,$_);
	#s SN, Teh, SnGb, SnBr (and adjacent SCo), e PR, s SNE, D
###
#print " START $line\n";
	foreach $loc (@poslocs){
###
#print "posloc: $loc\n";
		$temploc=quotemeta($loc);
unless(m/\(exc[^)]+$temploc/){

if($loc=~s/\)//){ push(@parenstr, "$name:$string") if defined($qualified{$loc});}
}




		if (defined($qualified{$loc} )){
			$rawlocs{$loc}++;

		}
 		if (@$loc){
			grep($rawlocs{$_}++,@$loc);
###
#print "RL begin:", join("\t",sort(keys(%rawlocs))),"\n";
###
 		}
	}
	
	if( m/exc\.? /){
#warn "$_\n" if m/exc.*exc/;
##print "\nEL: $line\n$_\n";
		s/except/exc/;
		($exception_string = $_)=~ s/.*exc[. ]+//;
		$exception_string =~ s/.*except //;

##print "ES: $exception_string\n";

		$exception_string =~ s/\).*//;

#NB the exception would be n NW following the split, 
# this is how partial regions are not excluded

		@all_exceptions = split(/, /,$exception_string);

#print "AE: ", join(" ",@all_exceptions),"\n";

		foreach $exception (@all_exceptions){
			if($exception eq "coast"){
				undef($rawlocs{"CCo"});
				undef($rawlocs{"SCo"});
				undef($rawlocs{"NCo"});
				next;
			}
			undef($rawlocs{$exception}) if defined($qualified{$exception});
			grep(undef($rawlocs{$_}),@$exception) if @$exception;
		}
	}
#print "$_\nRL end:", join("\t",sort(keys(%rawlocs))),"\n";

	$distvec = $nullvec;
	 foreach( keys(%rawlocs)){
 		if (defined($rawlocs{$_})){
			vec($distvec,$qualified{$_},1) = 1;
		}
	}
	$bitstr = unpack ("b*", $distvec);
	$hstr= unpack("H*", pack("b*",unpack ("b*", $distvec)));
	$bitstr2 =unpack("b*",pack("H*",$hstr));
#
#print "$bitstr\n";
##print "$hstr\n$bitstr\n$bitstr2\n";
#

###warn "$line" if $hstr =~ /^0+$/;
#return $line;
return unpack("H*", pack("b*",unpack ("b*", $distvec)));




}

sub PRkludge{
local($_)=@_;
$prev=$_;
				unless(m/exc[e ]+PR/){
	if(m/PR \(/){
		if (m/PR (\([^)]+\))/){
			$parens=$1;
			unless($parens =~ /San J|SnJt|scattered|desert slope/){
s/PR (\([^)]+\))/$& (exc SnJt)/ unless m/SnJt/;
				}
			}
		}
				elsif(m/n&?e PR/){
s/PR/PR (incl SnJt)/;
		}
				else{
					s/([a-z] PR)/$1 (exc SnJt)/ unless m/SnJt/;
				}
}
#print "\n\n$prev\n$_\n" unless $_ eq $prev;

$_;
}
sub edgekludge {
local($_)=@_;
$prev=$_;
s/([swen]* edge D\b)/$1 (exc DMtns)/;
s/([swen]* edge DMoj)/$1 (exc DMtns)/;
s/(D \([swen]* edge\))/$1 (exc DMtns)/;
s/(DMoj \([swen]* edge\))/$1 (exc DMtns)/;
s/PR \(D edge\)/PR (exc SnJt)/;
s/(adjacent edges D\b)/$1 (exc DMtns)/;
s/(edge of D\b)/$1 (exc DMtns)/;
s/(w edge SNE)/$1 (exc WaI)/;
###warn "$prev\n";
###warn "$_\n" unless $_ eq $prev;
$_;
}
	#s SN, Teh, SnGb, SnBr (and adjacent SCo), e PR, s SNE, D
sub adjkludge {
local($_)=@_;
$prev=$_;
s/(adjacent [snew ]*DMoj)/$1 (exc DMtns)/;
s/ D and adjacent CA.FP/ D, PR, TR, Teh, sSN/;
s/nSNE, adjacent CA.FP/nSNE, sSNH/;
###warn "$prev\n";
###warn "$_\n" unless $_ eq $prev;
$_;
}

#sub SNkludge {
#local($_)=@_;
#s/([scn])([scnwe]+) (SN[HF]?)/$1$3/;
#s/[nwsec]-([snc])\b/$1/g;
#s/([scn]) (SN[^E])/$1$2/g;
#s/([scn]) (SN)$/$1$2/g;
#s/([scn])&([scn])(SN[HF]?)/$1$3, $2$3/g;
#$_;
#}
sub SNkludge {
local($_)=@_;
#$key=$_;
s/SNE/XXX/;
s/([scn])([scnwe]+) (SN[HF]?)/$1$3/;
s/[nwsec]-([snc])\b/$1/g;
s/([scn]) (SN[^E])/$1$2/g;
s/([scn]) (SN)$/$1$2/g;
s/([scn])&([scn])(SN[HF]?)/$1$3, $2$3/g;
s/XXX/SNE/;
#$SN{$key}=$_;
s/excSN/exc SN/;
$_;
}
1;
