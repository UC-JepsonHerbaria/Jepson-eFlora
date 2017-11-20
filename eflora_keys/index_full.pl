#3. Basal vestigial spikelets 1(2); spikelets gradually narrowing distally .....-> [A. geniculata, incl A. ovata]


open(IN, "/Users/rlmoe/data/taxon_ids/smasch_taxon_ids.txt") || die;
local($/)="\n";
while(<IN>){
	chomp;
	s/X /&times;/;
	($code,$name,@residue)=split(/\t/);
	$TNOAN{$name}=$code;
	$NAN{$code}=$name;
}
$TNOAN{"Centaurea jacea nothosubsp. pratensis"}=93858;
$NAN{93858}="Centaurea jacea nothosubsp. pratensis";
close(IN);

$/="";
	$filename=$ARGV;
while(<>){
		if(m/([A-Z]+ACEAE)/){
			$family=$1;
			#print "$family\n";
		}
    		if(m/([A-Z-]+ .*)\nTAXON AUTHOR/){
        		$name=&strip_name($1);
			print "$name\n";
			$LAN=$name;
        		$TJM2{$name}="$filename\n";
        		while(s/SYNONYMS: +(.*)//){
s/Sedum dendroideum .* subsp. praealtum.*/Sedum dendroideum subsp. praealtum/;
s/Gaura odorata Sess&eacute; ex Lag., misappl./Gaura odorata/;
            			@syns=split(/; +/,$1);
            			foreach(@syns){
s/probably //;
					s/Expanded author citation: //;
                			s/_//g;
                			$TJM2{&strip_name($_)}.="$LAN\n";
                			print &strip_name($_),"*\n";
            			}
        		}
			if(m/NOTE:.*_/){
				while(s/_([A-Z][a-z-]+ [a-z-]+)_[^_]+(var\.|subsp\.|nothosubsp\.|f\.) _([a-z-]+)_//){
					$TJM2{"$1 $2 $3"}.="$LAN\n";
				}
				while(s/_([A-Z][a-z-]+ [a-z-]+)_//){
					$TJM2{$1}.="$LAN\n";
				}
				if(m/_/){
					#"print $line$_\n";
				}
			}
    		}
    		elsif(m/(NATIVE|NATURALIZED)\n([A-Z-]+ .*)/){
        		$name=&strip_name($2);
			print "$name\n";
			$LAN=$name;
        		$TJM2{$name}="$filename\n";
        		while(s/SYNONYMS: +(.*)//){
            			@syns=split(/; +/,$1);
            			foreach(@syns){
					s/Expanded author citation: //;
                			s/_//g;
                			$TJM2{&strip_name($_)}.="$LAN\n";
                			print &strip_name($_), "*\n";
            			}
        		}
			if(m/NOTE:.*_/){
				while(s/_([A-Z][a-z-]+ [a-z-]+)_[^_]+(var\.|subsp\.|nothosubsp\.|f\.) _([a-z-]+)_//){
					$TJM2{"$1 $2 $3"}.="$LAN\n";
				}
				while(s/_([A-Z][a-z-]+ [a-z-]+)_//){
					$TJM2{$1}.="$LAN\n";
				}
				if(m/_/){
					"print $line$_\n";
				}
			}
		}
else{
@lines=split(/\n/,$_);
unless($lines[0]=~m/^[A-Z]+ *$/ || m/^1/ || m/^Group/ || m/^[Aa]dmin/){
#print "1 >$lines[0]<\n2 >$lines[1]<\n";
}
#next;
}
}
#die;
foreach(sort(keys(%TJM2))){
	$key_name=$_;
	@names=split(/\n/,$TJM2{$_});
	$url="";
	%seen=();
	if($names[0]=~/all_files.all/){
		$names[0]=~s/.*\///;
		$names[0]=~s/all/html/;
		$url="/tjm2/review/treatments/" . lc($names[0]);
		$URL{$key_name}=$url;
		$anchor=$TNOAN{$key_name};
$storeit=qq{<a href="$url#$anchor">\t&nbsp;&nbsp;$key_name</a><br>};
$store{$storeit}=$key_name;
	}
}

foreach(sort(keys(%TJM2))){
	$key_name=$_;
	@names=split(/\n/,$TJM2{$_});
	$url="";
	%seen=();
	foreach(@names){
		if (m/all_files.all/){
			$seen{$key_name}++;
			next;
		}
		unless($seen{$_}++){
$anchor=$TNOAN{$_};
$storeit=qq{<a href="$URL{$_}#$anchor">\t*$key_name</a> (under $_)<br>};
$store{$storeit}=$key_name;
		}
	}
}
open(OUT, ">complete_index.html") || die;
print OUT <<EOP;
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Jepson Herbarium: Jepson Flora Project Public Review -->

<head><title>Jepson Herbarium: Jepson Flora Project: Public Review</title> 
<link href="http://ucjeps.berkeley.edu/common/styles/style_main_tjm2.css" rel="stylesheet" type="text/css" />
</head>

<body>

<!-- Begin banner -->
<table class="banner" width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td colspan="5" align="center" valign="middle">&nbsp;</td>
</tr>

<tr>
<td rowspan="4" width="12" align="center" valign="middle"></td>
<td rowspan="3" width="120" align="center" valign="middle">
<a href="http://ucjeps.berkeley.edu/jeps/"><img src="http://ucjeps.berkeley.edu/common/images/logos/logo_jeps_80.png" alt="Jepson Herbarium (JEPS)" width="80" height="79" border="0" /></a>
</td>
<td align="center">&nbsp;</td>
<td rowspan="3" width="120" align="center" valign="middle"></td>
<td rowspan="4" width="12" align="center" valign="middle"></td>
</tr>
<tr>
<td align="center" valign="middle"><span class="bannerTitle">The Jepson Herbarium</span>, </td>
</tr>

<tr>
<td align="center" valign="top"><a href="http://www.berkeley.edu" class="bannerTagLine">University of California, Berkeley</a></td>

</tr>

<tr>
<td colspan="3" align="center"></td>
</tr>

<tr>
<td height="8" colspan="5" align="center">&nbsp;</td>
</tr>
<tr class="bannerBottomBorder">
	<td colspan="6" height="3"></td>
</tr>

<tr>
<td colspan="6"><img src="/common/images/common_spacer.gif" alt="" width="1" height="1" border="0" /></td>
</tr>

</table>
<!-- End banner -->

<h2>
Index to names in the new online treatments from the Jepson Manual
<h2>
<h3>
Names with asterisks are not primary entries: that is, they are synonyms or names (accepted or not) referred to in notes.
</h3>
<a href="http://ucjeps.berkeley.edu/jepsonmanual/review/index.html">Index to on-line treatments</a>
<hr width="30%">

EOP
foreach(sort{$store{$a} cmp $store{$b} || $a cmp $b}(keys(%store))){
next if m/r\.t\. clausen/;
next if m/d\.r\. dewey/;
print OUT "$_\n";
}
print OUT <<EOP;
</body>
</html>
EOP
close(OUT);

  #system "rsync -e 'ssh -ax' -avz complete_index.html  rlmoe\@darwin.berkeley.edu:/usr/local/web/ucjeps_web/";

sub strip_name{
local($_) = @_;
s/ ex [A-Z][a-z.]+//;
       s/^([A-Z][-A-Za-z]+) (X?[-a-z]+).*\b(nothosubsp\.|subsp\.|ssp\.|var\.|f\.) ([-a-z]+).*/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z]+) ([x ]*[-a-z]+).*/$1 $2/;
s/ssp\./subsp./;
s/ C.E. B.*//;
s/ Thuill.,.*//;
s/ A. Nelson.*//;
s/Probably //;
s/ Engelm\..*//;
s/ Gankin .*//;
s/ Roof.*//;
s/ Borb&aacute;s.*//;
s/ \(Aiton.*//;
s/ Brot.*//;
s/ \(Gould.*//;
s/ \(Vasey.*//;
return (ucfirst(lc($_)));
}
