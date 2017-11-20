open(ERR, ">fam_key_error.txt") || die;









open(IN, "/Users/richardmoe/4_data/taxon_ids/smasch_taxon_ids.txt") || die;
local($/)="\n";
while(<IN>){
	chomp;
	s/X /&times;/;
	($code,$name,@residue)=split(/\t/);
$name=uc($name) if $name=~/aceae$/;
	$TNOAN{$name}=$code;
	$NAN{$code}=$name;
}
$file="eflora_family_key.txt";
	undef($/);
	open(IN,$file) || die "couldn't open $file\n";
print <<EOP;
<html xmlns="http://www.w3.org/1999/xhtml">


<head><title>Jepson Herbarium: Jepson Flora Project: Jepson eFlora: Key to Families</title> 
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
        <a href="http://ucjeps.berkeley.edu/jeps/"><img src="http://ucjeps.berkeley.edu/common/images/logo_jeps_80.png" alt="Jepson Herbarium (JEPS)" width="80" height="79" border="0" /></a></td>
    <td align="center">&nbsp;</td>
    <td rowspan="3" width="120" align="center" valign="middle"></td>
    <td rowspan="4" width="12" align="center" valign="middle"></td>
  </tr>
    <tr>
    <td align="center" valign="middle"><span class="bannerTitle">The Jepson Herbarium</span><br /></td>
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
    <td colspan="6"><img src="http://ucjeps.berkeley.edu/common/images/common_spacer.gif" alt="" width="1" height="1" border="0" /></td>
  </tr>
  </table>
  <!-- End banner -->

 <table border="0">
   <tr>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
     </tr>
   <tr>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td width="100%"><span class="pageName"><a href="/IJM.html">Jepson eFlora</a></span><br /><br />
       <br />
   	  
Contact: Comments on these keys should be sent to Tom Rosatti, Scientific Editor (rosatti\@berkeley.edu).
<br>
Citation for the whole project: Jepson Flora Project (eds.) [year] Jepson eFlora, http://ucjeps.berkeley.edu/IJM.html [accessed on month, day, year] 



</td>
</tr>
</table>
EOP

	$all_lines=<IN>;
#converts windows line ends#
	$all_lines=~s/\xEF\xBB\xBF//;
	$all_lines=~s/ *\r\n/\n/g;
	$all_lines=~s/ +/ /g;
	
	@all_pars=split(/\n\n+/,$all_lines);
	$element=0;
	foreach(@all_pars){
s/\nPROOF: .*//;
		@lines=split("\n",$_);
		if(m/&mathx[^;]/){
			die "MATHX $_\n";
		}
		s/{\/.*?}//g;
		next if m/^[aA]dmin/;
		s/([0-9])-([0-9])/$1&ndash;$2/g;
		s/—/&ndash;/g;
		s/â€™/'/;
		s/’/'/g;
		s/</&lt;/g;
		s//-/g;
if(s/(Key to California Plant Families)\nTJMX AUTHOR: (.*)/<h3 align=center>$1<\/h3><h4 align=center>$2<\/h4>/){
print;
}
if(s/KEY_PAR: /<P>/){
while(s/_/<i>/){
s/_/<\/i>/;
}
print "$_</P>";
}
if(s/SCI_ED: //){
print "&mdash; $_";
}
###################### KEYS ##########################
if( m/^1\./ || m/^UNABRIDGED KEY/ || m/^Group \d+[A-Z]?[.:]/ || m/^Key to Groups/ || m/^Key to Groups Based Primarily on Flowering Material/|| m/^Key to Groups Based on Fruiting Material/|| m/^Key to Pistillate Plants/|| m/^Key to Staminate Plants/|| m/^Key to Vegetative Plants/ || m/^Group \d+ *\n/){

	$uk="";
	print ERR "$file KEY $&\n\n";
print "\n\n\n";
	++$genus;
	@lines=split(/\n/);
$indent_level=-1;
		if ($lines[0]=~/^(Key to Group)/){
			print ERR "KEY $lines[0]\n\n";
			$uk=shift(@lines);
			print ERR "KEY $lines[0]\n\n";
		}
		if ($lines[0]=~/^(Group) (\d+)/){
print qq{<a name="$1$2"></a>};
			print ERR "KEY $lines[0]\n\n";
			$uk=shift(@lines);
			print ERR "KEY $lines[0]\n\n";
		}
		foreach(@lines[0 .. $#lines]){
			if(m/--[0-9]+\(--[0-9]/ || m/[0-9]--\)[0-9]+--/){
				s/(--[0-9]+\()--([0-9]+)/$1$2/g;
				s/([0-9]+)--\)([0-9]+--)/$1)$2/g;
			}

			s/([0-9])-([0-9])/$1&ndash;$2/;
			s/---/&mdash;/g;
			s/\.+[-_]*>/--&gt;/g;
			s/-->/--&gt;/g;
			if(s|^(\d+)([.])|<a href="#$genus${1}'">$1$2</a><a name="$genus$1$2"> </a>|){
				#$indent=$1;
				#$indent-=1;
$indent_level +=1;
$indent_level{$1}=$indent_level;
print nowhere <<EOP;
$1$2
$indent_level

EOP
$indent=$indent_level;
			}
			if(s|^(\d+)(['])|<a href="#$genus${1}.">$1$2</a><a name="$genus$1$2"> </a>|){
				#$indent=$1;
				#$indent-=1;
$indent_level = $indent_level{$1};
print nowhere <<EOP;
$1$2
$indent_level

EOP
$indent=$indent_level;
			}
			#$indent= "&nbsp;" x $indent;
			$indent*=7;

 #CUPRESSACEAE (_Juniperus_)
 #MYRTACEAE ([_Chamelaucium_])
 ##ONAGRACEAE (_Epilobium_, _Neoholmgrenia_)
 ##ALLIACEAE ([_Allium sativum_], _Allium vineale_)
 #PAPAVERACEAE (Fumarioideae)
 #[BASELLACEAE]
 #ALISMATACEAE or HYDROCHARITACEAE


 ##WOODSIACEAE (_Athyrium filix-femina_ var. _cyclosporum_)
 ##POACEAE (_Poa bulbosa_ subsp. _vivipara_)
			if(m!--&gt;.*([A-Z][a-z-]+ [a-z-]+)_ (nothosubsp\.|subsp\.|var\.) _([a-z-]+)!){
				$goto_code= $TNOAN{"$1 $2 $3"} || "C4";
				s!--&gt; (.*[A-Z][a-z-]+ [a-z-]+_ (nothosubsp\.|subsp\.|var\.) _[a-z-]+.*)!<a href="/cgi-bin/get_IJM.pl?tid=$goto_code">.....&nbsp;$1</a>!;
#warn "1 $_\n";
			}
 ##ONAGRACEAE (_Ludwigia_) or PLANTAGINACEAE (_Veronica_)

elsif(m/--&gt; [A-Z]+CEAE \(_([A-Z][a-z]+)_\) or [A-Z]+CEAE \(_([A-Z][a-z]+)_\)/){
				$goto_code_A= $TNOAN{"$1"} || "C4";
				$goto_code_B= $TNOAN{"$2"} || "C4";
				s!--&gt; (.*)([A-Z][a-z-]+\]?)(.*)([A-Z][a-z]+)(.*)!.....&nbsp;$1 <a href="/cgi-bin/get_IJM.pl?tid=$goto_code_A">$2</a>$3<a href="/cgi-bin/get_IJM.pl?tid=$goto_code_B">$4</a>$5!;
			}
elsif(m/--&gt; ([A-Z]+ACEAE) or ([A-Z]+ACEAE)/){
				$goto_code_A= $TNOAN{"$1"} || "C4";
				$goto_code_B= $TNOAN{"$2"} || "C4";
				s!--&gt; ([A-Z]+ACEAE)( or )([A-Z]+ACEAE)(.*)!.....&nbsp; <a href="/cgi-bin/get_IJM.pl?tid=$goto_code_A">$1</a>$2<a href="/cgi-bin/get_IJM.pl?tid=$goto_code_B">$3</a>$4!;
			}

 ##EUPHORBIACEAE (_Croton setigerus_)
 ##BALSAMINACEAE ([_Impatiens capensis_])
			elsif(m!--&gt;.*ACEAE \(\[?_([A-Z][a-z-]+ [a-z-]+)!){
				$goto_code= $TNOAN{"$1"} || "C4";
				s!--&gt; (.*[A-Z][a-z-]+ [a-z-]+_\]?\))!<a href="/cgi-bin/get_IJM.pl?tid=$goto_code">.....&nbsp;$1</a>!;
#warn "2 $_\n";
			}
 ##PLANTAGINACEAE (_Antirrhinum_, _Dopatrium_, _Nuttallanthus_)
			elsif(m!--&gt; .*([A-Z][a-z-]+), ([A-Z][a-z]+), (A-Z][a-z-]+)!){
				$goto_code_A= $TNOAN{"$1"} || "C4";
				$goto_code_B= $TNOAN{"$2"} || "C4";
				$goto_code_C= $TNOAN{"$3"} || "C4";
				s!--&gt; (.*)([A-Z][a-z-]+), ([A-Z][a-z]+), (A-Z][a-z-]+)(.*)!.....&nbsp;$1 <a href="/cgi-bin/get_IJM.pl?tid=$goto_code_A">$2</a>, <a href="/cgi-bin/get_IJM.pl?tid=$goto_code_B">$3</a>, <a href="/cgi-bin/get_IJM.pl?tid=$goto_code_C">$4</a>$5!;
#warn "3 $_\n";
			}
			elsif(m!--&gt; .*([A-Z][a-z-]+)_, ([A-Z][a-z]+ [a-z]+)!){
				$goto_code_A= $TNOAN{"$1"} || "C4";
				$goto_code_B= $TNOAN{"$2"} || "C4";
				s!--&gt; (.*)([A-Z][a-z-]+_\]?), (_[A-Z][a-z]+ [a-z]+)(.*)!.....&nbsp;$1 <a href="/cgi-bin/get_IJM.pl?tid=$goto_code_A">$2</a>, <a href="/cgi-bin/get_IJM.pl?tid=$goto_code_B">$3</a>$4!;
#warn "4 $_\n";
			}
 ##BRASSICACEAE (_Nasturtium_, _Rorippa_)
			elsif(m!--&gt; .*([A-Z][a-z-]+)_, ([A-Z][a-z]+)!){
				$goto_code_A= $TNOAN{"$1"} || "C4";
				$goto_code_B= $TNOAN{"$2"} || "C4";
				s!--&gt; (.*)([A-Z][a-z-]+_\]?), (_[A-Z][a-z]+)(.*)!.....&nbsp;$1 <a href="/cgi-bin/get_IJM.pl?tid=$goto_code_A">$2</a>, <a href="/cgi-bin/get_IJM.pl?tid=$goto_code_B">$3</a>$4!;
#warn "5 $_\n";
			}
 #Group 10
			elsif( m!--&gt; (Group) (\d+)!){
				s!--&gt; *(Group) (\d+)!<a href="#$1$2">.....&nbsp;$1 $2</a>!;
			}
			elsif(m!--&gt; .*_([A-Z][a-z-]+)_!){
				$goto_code= $TNOAN{"$1"} || "C4";
				s!--&gt; (.*)([A-Z][a-z-]+)(.*)!<a href="/cgi-bin/get_IJM.pl?tid=$goto_code">.....&nbsp;$1$2$3</a>!;
			}
			elsif( m!--&gt; *([A-Z]+) or ([A-Z]+ACEAE)!){
				$goto_code_A= $TNOAN{"$1"} || "C4";
				$goto_code_B= $TNOAN{"$2"} || "C4";
				s!--&gt; *([A-Z]+) or ([A-Z]+ACEAE)!.....&nbsp;<a href="/cgi-bin/get_IJM.pl?tid=$goto_code_A">$1 or <a href="/cgi-bin/get_IJM.pl?tid=$goto_code_B"</a>!;
			}
else{
				s!--&gt; \[?([A-Z][A-Z]+ACEAE)\]?!.....&nbsp;<a href="/cgi-bin/get_IJM.pl?tid=$TNOAN{$1}">$1</a>!;
}
			if(m/--[0-9]+\(--[0-9]/ || m/[0-9]--\)[0-9]+--/){
				s/(--[0-9]+\()--([0-9]+)/$1$2/g;
				s/([0-9]+)--\)([0-9]+--)/$1)$2/g;
			}
			s/--([^&])/&ndash;$1/g;
			s|\+/-|&plusmn;|g;
			s|\+-|&plusmn;|g;
			s/ > or =/ &ge;/g;
			if($exclude || m/UNABRIDGED KEY LEAD/){
				s!^!\n<P class="keyText" style="padding-left : 10 ; color:blue">!;
			}
			else{
				s!^!\n<P class="keyText" style="padding-left : $indent ;">!;
			}
			#s!^!\n<br>$indent!;
			s/([A-Za-z])_([A-Za-z])/$1&95;$2/g;
			while(s/_/<I>/){
				s/_/<\/I>/;
			}
 			s/&95;/_/g;
			s/\.\.\.\.\.&nbsp; +/.....&nbsp;/;
		}
		$_=join("\n",@lines);

##1' Involucel tube with 8 valve-like openings; st shaggy-hairy; corolla blue; pl gen ann...-> [S. stellata]

		s/UNABRIDGED KEY LEAD: (.*)/<font color=\"blue\">$1<\/font>/g;
		if(s/UNABRIDGED KEY/<br>Unabridged key/g){
			#s/$/<\/font>/gm;
			$exclude=1;
		}
		s/UNABRIDGED\n//;
		s/  +/ /g;
			#print OUT "flabba1<blockquote>$_<\/blockquote>\n";
		if($exclude==1){
			print ERR "KEY: $name_anchor\n\n";
			$IJM_key{$name_anchor} = "<font color=\"blue\"><blockquote>$_<\/blockquote></font>";
		}
		else{
foreach($uk){
			while(s/_/<I>/){
				s/_/<\/I>/;
			}
s/---/&mdash;/g;
s/--/&ndash;/g;
			s|\+-|&plusmn;|g;
s/Group (\d+[A-Z]?)/<a name=Group$1>Group $1<\/a>/;
}
			print ERR "KEY: $name_anchor\n\n";
$_=&il_to_html($_);
			print "<blockquote><h3>$uk</h3>$_<\/blockquote>";
		}
	}
else{
warn "NOT A KEY $_";
}
#print;
}
######################################################
######################################################

sub format_syns {
	local($syns)=shift;
	#print "$syns\n";
	$syns=~s/ &#215; / X_/g;
	#print "$syns\n";
	@syns=split(/; +/,$syns);
	foreach(@syns){
		s/ *$//;
		s/<\/?b>//g;
		s/^([^ ]+ X +)/<i>$1<\/i>/;
		s/^([^ ]+ [^ ]+)/<i>$1<\/i>/;
		s/subsp. ([^ ]+)/subsp. <i>$1<\/i>/;
		s/var. ([^ ]+)/var. <i>$1<\/i>/;
		s/f. ex /f._ex /;
		s/f. ([^ ]+)/f. <i>$1<\/i>/;
		s/f._ex /f. ex /;
	}
	$syns=join("; ", @syns);
	$syns=~s/^\[//;
	$syns=~s/\]//;
	#print "$syns\n";
	$syns=~s/ X_/ &#215;/g;
	#print "$syns\n";
	$syns;
}
sub dist_expand{
local($_)=@_;
s/\bAR\b/Arkansas/g;
s/\bTN\b/Tennessee/g;
s/\bNB\b/New Brunswick/g;
s/\bNC\b/North carolina/g;
s/\bMO\b/Missouri/g;
s/\bHI\b/Hawaii/g;
s/\bFL\b/Florida/g;
s/\bPE\b/Prince Edward Island/g;
s/\bQC\b/Quebec/g;
s/\bS.Africa\b/South Africa/g;
s/\bWY\b/Wyoming/g;
s/\bMI\b/Michigan/g;
s/\bMA\b/Massachusetts/g;
s/\bIN\b/Indiana/g;
s/\bIL\b/Illinois/g;
s/\bNJ\b/New Jersey/g;
s/\bMN\b/Minnesota/g;
s/\bMS\b/Mississippi/g;
s/\bNY\b/New York/g;
s/\bSK\b/Saskatchewan/g;
s/\bMB\b/Manitoba/g;
s/\bNL\b/Newfoundland/g;
s/\bAB\b/Alberta/g;
s/\bYT\b/Yukon/;
s/\bNS\b/Nova Scotia/;
s/\bON\b/Ontario/;
s/\bVA\b/Virginia/;
s/\bNE\b/Nebraska/;
s/subtrop\./subtropics./;
s/C\.Am/Central America/;
s/\bWA\b/Washington/g;
s/\bw-+c/west-central/g;
s/\bUT\b/Utah/g;
s/\bTX\b/Texas/g;
s/\btemp\b/temperate/g;
s/\bSD\b/South Dakota/g;
s/\bND\b/North Dakota/g;
s/\bs-+c/south-central/g;
s/\bLA\b/Louisiana/g;
s/\bOR\b/Oregon/g;
s/\bOK\b/Oklahoma/g;
s/\bNV\b/Nevada/g;
s/\bPA\b/Pennsylvania/g;
s/\bNM\b/New Mexico/g;
s/\bn-+c/north-central/g;
s/\bMT\b/Montana/g;
s/\bID\b/Idaho/g;
s/\bOH\b/Ohio/g;
s/\bSC\b/South Carolina/g;
s/\bKS\b/Kansas/g;
s/\be-+c/east-central/g;
s/\bCan\b/Canada/g;
s/\bEur\b/Europe/g;
s/\bN\.Am\b/North America/g;
s/\bS\.Am\b/South America/g;
s/\bBC\b/British Columbia/g;
s/Rocky Mtns/Rocky Mountains/;
s/\bBaja CA\b/Baja California/g;
s/\bAZ\b/Arizona/g;
s/\bCO\b/Colorado/g;
s/\bAK\b/Alaska/g;
s/Mex\b/Mexico/g;
s/Medit\b/Mediterranean/g;
s/CA-FP/California Floristic Province/g;
s/\bNCo\b/North Coast/g;
s/\bNCoR\b/North Coast Ranges/g;
s/\bNCoRO\b/Outer North Coast Ranges/g;
s/\bNCoRI\b/Inner North Coast Ranges/g;
s/\bNCoRH\b/High North Coast Ranges/g;
s/\bCaR\b/Cascade Range/g;
s/\bCaRF\b/Cascade Range Foothills/g;
s/\bCaRH\b/High Cascade Range/g;
s/\bSN\b/Sierra Nevada/g;
s/\bSNE\b/East of Sierra Nevada/g;
s/\bSNF\b/Sierra Nevada Foothills/g;
s/\bSNH\b/High Sierra Nevada/g;
s/\bTeh\b/Tehachapi Mountain Area/g;
s/\bGV\b/Great Central Valley/g;
s/\bScV\b/Sacramento Valley/g;
s/\bSnJV\b/San Joaquin Valley/g;
s/\bSnGb\b/San Gabriel Mountains/g;
s/\bSW\b/Southwestern California/g;
s/\bSCo\b/South Coast/g;
s/\bChI\b/Channel Islands/g;
s/\bPR\b/Peninsular Ranges/g;
s/\bWTR\b/Western Transverse Ranges/g;
s/\bTR\b/Transverse Ranges/g;
s/\bSnJt\b/San Jacinto Mountains/g;
s/\bSCoR\b/South Coast Ranges/g;
s/\bSCoRO\b/Outer South Coast Ranges/g;
s/\bSCoRI\b/Inner South Coast Ranges/g;
s/\bCW\b/Central Western California/g;
s/\bSCoR\b/South Coast Ranges/g;
s/\bCCo\b/Central Coast/g;
s/\bSnFrB\b/San Francisco Bay Area/g;
s/\bNW\b/Northwestern California/g;
s/\bKR\b/Klamath Ranges/g;
s/\bGB\b/Great Basin Floristic Province/g;
s/\bWrn\b/Warner Mountains/g;
s/\bMP\b/Modoc Plateau/g;
s/\bW&I\b/White and Inyo Mountains/g;
s/\bD\b/Desert/g;
s/\bDMoj\b/Mojave Desert/g;
s/\bDMtns\b/Desert Mountains/g;
s/\bDSon\b/Sonoran Desert/g;
s/\bCA\b/California/g;
s/\bSnBr\b/San Bernardino Mountains/g;
s/\bUS\b/United States/g;
s/$/<map>/;
$_;
}

sub il_to_html {
local($_) = @_;

s/Eur\./Europe./;
s/\ball yr\b/all year/;
s/trop, subtrop S.Am/tropical, subtropical South America/;
s/subtrop, trop mtns/subtropical, tropical mountains/;
s/trop\) regions/tropical) regions/;
s/trop spp.\]/tropical spp.]/;
s/subtrop Am\b/subtropical America/;
s/trop Afr\b/tropical Africa/;
s/trop s hemisphere/tropical southern hemisphere/;
s/trop S.Am\b/tropical South America/;
s/trop Am\b/tropical America/;
s/temp Am\b/temperate America/;
s/temp, subtrop n hemisphere/temperate, subtropical northern hemisphere/;
s/subtrop coasts,/subtropical coasts/;
s/\bpantrop\b/pantropical/;
s/trop Asia/tropical Asia/;
s/subtrop mtns/subtropical mountains/;
s/trop mtns/tropical mountains/;
s/trop Australia/tropical Australia/;
s/trop, subtrop e Asia/tropical, subtropical eastern Asia/;
s/subtrop Asia/subtropical Asia/;
s/subtrop sw US/subtropical southwestern United States/;
s/trop N.Am\b/tropical North America/;
s/subtrop N.Am\b/subtropical North America/;
s/trop Am/tropical America/;
s/trop areas/tropical areas/;
s/trop and s Afr\b/tropical and southern Africa/;
s/trop weed/tropical weed/;
s/trop, subtrop Am\b/tropical, subtropical America/;
s/trop, temp Am\b/tropical, temperate America/;
s/trop Eurasia/tropical Eurasia/;
s/\btrop\b/tropics/;
s/\btrops\b/tropics/;
s/ temp\b/ temperate/;


s/ in fl arran/ in floral arran/g;
s/ fl tube/ floral tube/g;
s/ fl sts/ flowering stems/g;
s/ fl stalks/ flowering stalks/g;
s/ fl season/ flowering season/g;
s/ fl pls/ flowering plants/g;
s/ fl pl/ flowering plant/g;
s/ fl once/ flowering once/g;
s/ fl lst/ flowering first/g;
s/ fl late/ flowering late/g;
s/ after fl in/ after flowering in/g;
s/may fl 1st/may flower first/g;
s/ fl first/ flowering first/g;
s/ fl 1st/ flowering first/g;
s/ fl at / flowering at /g;

s/(summer|spring|fall)-fl\b/$1-flowering/g;
s/\bst\b/stem/g;
s/\bsts\b/stems/g;
s/\bfl\b/flower/g;
s/\bfls\b/flowers/g;
s/\bfld\b/flowered/g;
s/\b([Pp]l)(s?)\b/$1ant$2/g;
s/\.plant/.pl/g;
s/\bfr\b/fruit/g;
s/\bfrs\b/fruits/g;
s/\be\b/eastern/g unless m/e[.;]/ ;
s/\blflets\b/leaflets/g;
s/\blfy\b/leafy/g;
s/\blflet\b/leaflet/g;
s/\blvs\b/leaves/g;

s/\bann\b/annual/g;
s/\b([Bb])ien\b/$1iennial/g;
if(m/\bper\b/){
s/\bper\)/perennial herb)/;
s/\bper to\b/perennial herbs to/;
s/\bor per\b/or perennial herb/;
s/\band per\b/and perennial herb/;
s/\bif per\b/if perennial herb/;
s/([,;]) per\b/$1 perennial herb/;
s/\bper([.,])/perennial herb$1/;
s/ to per\b/ to perennial herb/;
s/montane per\b/montane perennial herb/;
s/lived per\b/lived perennial herb/;
s/Rhizomed per\b/Rhizomed perennial herb/;
s/slender per\b/slender perennial herb/;
}
s/\bexc\.?\b/except/g;
if(m/\bincl\b/){
s/not incl app/not including app/;
s/\bincl([<,.,;])/included$1/g;
#s/\bincl (in|to|or)\b/included $1/g;
#s/\bwith incl\b/with included/g;
##s\b/CVS incl\b\./CVS including/; # error in JM
##s/\bincl\. var\./including var./; # error in JM
##s/\bincl\.GR/including GR/; # error in JM
#s/are not incl\b/are not included/g;
#s/does not incl\b/does not include/g;
#s/\bincl\b/including/g;
s/genus incl taxa/genus includes taxa/;
s/\bincls spur/includes spur/;
s/\bincl (at|as)/included $1/;
s/not incl _/not include _/;
s/previously incl _/previously included _/;
s/\bincl hybrids/include hybrids/;
s/\bincl here/included here/;
s/\bincl several/include several/;
s/\bincl \.\.\.\.\./included ...../;
s/\bincl \(/included (/;
s/(that|May|to|not|Previously) incl /$1 include /;
s/\bincl in /included in /;
s/\bincl or /included or /;
s/\bincl to /included to /;
s/\bincl,/included,/;
s/\bincl;/included;/;
s/spp\. incl/spp. included/;
s/or incl exc/or included exc/;
s/netted with incl/netted with included/;
s/\bincl stamens/included stamens/;
s/_ incl pls that/_ includes plants that/;
s/stamens incl within/stamens included within/;
s/previously incl genera/previously included genera/;
s/([Cc]haracters) incl relative/$1 include relative/;
s/style incl\b/style included/;
s/ and incl / and included /;
s/, incl under/, included under/;
s/subsp. incl the/subsp. include the/;
s/would incl var/would include var/;
s/incl genes/includes genes/;
s/Characters incl calyx/Characters include calyx/;
s/\bincl\b/including/;
s/Anthers incl\b/Anthers included/;
}
s/\bincls/includes/g;
s/\bAnn\b/Annual/g;
s/\bAnnual ([A-Z])/Ann $1/g;
s/\bPer\b/Perennial/g;
s/\b([Gg])en\b/$1enerally/g;
s/\besp\b/especially/g;
s/\blf\b/leaf/g;
s|([Ii])n cult\b|$1n cultivation|;
#s/\bcult\b/cultivated/g;
s/rice cult /rice cultivation /;
s/(escapes?) cult\b/$1 cultivation/;
s/(of|into|outside|after|in|In|from) cult\b/$1 cultivation/;
s/\bcult\b/cultivated/;
s/infl(s)?\b/inflorescence$1/g;
s/Vars\./Varieties/g;
s/\blfless\b/leafless/g;
s/\bocc\b (agricultural|escape|waif|weed)\b/occasional $1/g;
s/\bocc\b/occasionally/g;
s/\born\b/ornamental/g;

s/\bAfr\b/Africa/g;
s/N\. ?Am\b/North America/g;
s/S\. ?Am\b/South America/g;
s/\bssp\./subsp./g;
s/\bspp\.(\s+[A-Z])/species.$1/g;
s/\bspp\./species/g;
s/\bsspp\./subspp./g;
s|</?quote>|"|g;
$_;
}
