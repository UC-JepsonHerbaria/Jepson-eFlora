#!/usr/bin/perl
use BerkeleyDB;
use CGI;
$query = new CGI;                        # create new CGI object
$data_path	="/Library/WebServer/ucjeps_data/";

#tie(%IJM, "BerkeleyDB::Hash", -Filename=>"${data_path}IJM_expanded_hash")|| die "Stopped; couldnt open IJM\n";
tie(%IJM, "BerkeleyDB::Hash", -Filename=>"${data_path}IJM.hash")|| die "Stopped; couldnt open IJM\n";
tie(%IJM_key, "BerkeleyDB::Hash", -Filename=>"${data_path}IJM_key.hash")|| die "Stopped; couldnt open IJM_key\n";

tie (%store_treat_path, "BerkeleyDB::Hash", -Filename => "${data_path}TJM_treat_path", -Flags=>DB_RDONLY) or die "Cannot open file treat path" ;

$today=localtime();
$today=~s/^[^ ]* //;
$today=~s/\d\d:\d\d:\d\d //;






open(IN,"/Users/richardmoe/4_data/taxon_ids/smasch_taxon_ids.txt") || die "cant open taxon ID file\n";
while(<IN>){
	chomp;
	($code,$name,@residue)=split(/\t/);
	$TNOAN{$name}=$code;
	$NAN{$code}=$name;
}
#open(IN,"${data_path}tnoan.out") || die;
#while(<IN>){
	#chomp;
	#($code,$name)=split(/\t/);
	#$TNOAN{$name}=$code;
	#$NAN{$code}=$name;
#}
close(IN);

	$TID= $query->param('tid') || $query->param('key');

($cite_name=$NAN{$TID})=~s/ .*//;
if($cite_name=~m/(Extriplex|Stutzia|Euphorbia|Leucosyris|Asclepias|Atriplex|Sphaeropteris|Primula|Gamochaeta|Crocanthemum|Condea|Navarretia|Phacelia|Howellanthus|Phoradendron|Thysanocarpus)/){
$citation=<<EOP;
Citation for this treatment:  [Author of taxon treatment] 2013. $NAN{$TID}, Revision 1, in Jepson Flora Project (eds.) <em>Jepson eFlora</em>, http://ucjeps.berkeley.edu/cgi-bin/get_IJM.pl?tid=$TID, accessed on $today
EOP
}
else{
$citation=<<EOP;
Citation for this treatment:  [Author of taxon treatment] 2012. $NAN{$TID}, in Jepson Flora Project (eds.) <em>Jepson eFlora</em>, http://ucjeps.berkeley.edu/cgi-bin/get_IJM.pl?tid=$TID, accessed on $today
EOP
}

if($query->param('tid')){







	if($TID=~/[A-Za-z]+/){
		($lookfor=$TID)=~s/%20/ /g;
		$lookfor=~s/\+/ /g;
		$lookfor=~s/ X / \327 /g;
		$lookfor=~s/ %[Dd]7 / \327 /g;
		$lookfor=~s/ x / \327 /g;
		$lookfor=~s/^([A-Z]+)/\u\L$1/g;
		$lookfor=~s/[Ss]sp\./subsp./;
		$TID=$TNOAN{$lookfor} || 0;
	}
	foreach $i (A .. Z){
	$alpha_index_string.= <<EOP;
	<a href="/IJM_index_${i}.html">$i</a> | 
EOP
	}

if($TID=~/^\d[ 0-9,]*$/){
	while(<DATA>){
		chomp;
		$string=$_;
		s/.* //;
		$IJM_entry{$_}=$string;
		$IJM_seq_hash{$_}=$.;
		$IJM_list[$.]=$_;
	}
	$previous_tid=$IJM_list[$IJM_seq_hash{$TID}-1];
	$next_tid=$IJM_list[$IJM_seq_hash{$TID}+1];


unless($IJM_entry{$TID}){
print $query->header;                    # create the HTTP header
print <<EOP;
<html xmlns="http://www.w3.org/1999/xhtml">
Taxon not recognized: <a href="/IJM.html">Main search page</a>
</html>
EOP
die;
}
print $query->header;                    # create the HTTP header
print <<EOP;
<html xmlns="http://www.w3.org/1999/xhtml">


<head><title>Jepson Herbarium: Jepson Flora Project: Jepson eFlora</title> 
<link href="http://ucjeps.berkeley.edu/common/styles/style_main_tjm2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
function initialize() {
  var myOptions = {
    mapTypeId: google.maps.MapTypeId.TERRAIN
  }

  var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

  var kmlLayer = new google.maps.KmlLayer("http://herbaria4.herb.berkeley.edu/interchange/kmls/$TID.kml", { suppressInfoWindows: true });
  kmlLayer.setMap(map);
  var pmlLayer = new google.maps.KmlLayer("http://herbaria4.herb.berkeley.edu/interchange/coords/$TID.kml?$$", { });
  pmlLayer.setMap(map);

}

function JumpToIt(list) {
    var newPage = list.options[list.selectedIndex].value
    if (newPage != "None") {
        location=newPage
    }
}

</script>

<style type="text/css" media="screen">
    #map_canvas {
      margin-left: auto;
      margin-right: auto;
      display: block;
      float: left;
      width: 467px;
      height: 445px;
      padding: 10px;
    }
	.inat-widget {
		font-family: Georgia, serif;
		font-size: smaller;
		padding: 10px;
		line-height: 1;
	}
	.inat-widget a img {
		border:none;
	}

</style>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-27128382-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</head>

<body onload="initialize()">


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
    <td align="center" valign="middle"><span class="bannerTitle">Jepson Herbarium</span><br /></td>
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

  <!-- Beginning of horizontal menu -->
  <table class=horizMenu width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td height="21" width="640" align="right">
      <a href="http://ucjeps.berkeley.edu/main/directory.html" class="horizMenuActive">Directory</a>
  	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="http://ucjeps.berkeley.edu/news/" class="horizMenuActive">News</a>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="http://ucjeps.berkeley.edu/main/sitemap.html" class="horizMenuActive">Site Map</a>	
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="http://ucjeps.berkeley.edu/" class="horizMenuActive">Home</a>	
    </td>
<td />
  </tr>
   <tr>
       <td colspan="6" bgcolor="#9FBFFF"><img src="http://ucjeps.berkeley.edu/common/images/common_spacer.gif" alt="" width="1" height="1" border="0" /></td>
     </tr>
 </table>
 <!-- End of horizontal menu -->

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
       <td width="100%"><span class="pageName"><a href="/IJM.html">Jepson eFlora:</a> Taxon page</span>
<br>
<span class="pageAuthorLine">
<a href="/IJM_fam_key.html">Key to families</a>
|
<a href="/IJM_toc.html">Table of families and genera</a>
</span>
   	  
</td>
</tr>
</table>
<P>
<table align="center" width="100%"><tr><td>
<a href	="/cgi-bin/get_IJM.pl?tid=$previous_tid">
	<IMG SRC="/icons/left.gif" BORDER=2 ALT="Previous taxon"></a>
</td>
<td width=90%">
Indexes to all accepted names and synonyms:<br>| $alpha_index_string
<hr width="10%">
</td>
<td align="right">
<a href	="/cgi-bin/get_IJM.pl?tid=$next_tid"><IMG SRC="/icons/right.gif" BORDER=2 ALT="Previous taxon"></a>
</td></tr>
</table>



EOP
print "<H2>$NAN{$TID}</H2>";

@IJMs= split(/, */, $IJM_entry{$TID});
	foreach(@IJMs){
print "<h3>$_</h3>";
	$entry= $IJM{$_} || "NO ENTRY";
	if($entry=~/([A-Z][a-z][a-z])&ndash;([A-Z][a-z][a-z])/){
		%monthno=("Jan",0,"Feb",1,"Mar",2,"Apr",3,"May",4,"Jun",5,"Jul",6,"Aug",7,"Sep",8,"Oct",9,"Nov",10,"Dec",11);
		if($monthno{$1} > $monthno{$2}){
			foreach $no (0 .. $monthno{$2}){
				$FT{$no}++;
			}
			foreach $no ($monthno{$1} .. 11){
				$FT{$no}++;
			}
		}
		else{
			foreach $no ($monthno{$1} .. $monthno{$2}){
				$FT{$no}++;
				#print "FLABBA $no";
			}
		}
	}
	else{
		%FT=();
	}
	$entry=~s!/cgi-bin/get_cpn!http://ucjeps.berkeley.edu/cgi-bin/get_cpn!;
	$entry=~s!/cgi-bin/get_consort!http://ucjeps.berkeley.edu/cgi-bin/get_consort!;
	$entry=~s/&Ccaron;/C/g;
	$entry=~s/SCIED:/<br>&mdash;/;

$entry=~s/WEEDINESS: SYMBOL 1/{Noxious weed}/g;
$entry=~s/WEEDINESS SYMBOL 1/Noxious weed/g;
$entry=~s/WEEDINESS: SYMBOL 2/{Weed listed by Cal-IPC}/g;
$entry=~s/WEEDINESS SYMBOL 2/Weed listed by Cal-IPC/g;
$entry=~s/{hort link}//;
$entry=~s!<br></center>!</center>!;


#list of taxon ids for included species
 if($entry=~s/<sp_list>(.*)<\/sp_list>//){
	@taxa=split(/,/,$1);
	foreach(@taxa){
		s!.*!<OPTION VALUE="http://herbaria4.herb.berkeley.edu/cgi-bin/get_IJM.pl?tid=$&">$NAN{$&}\n!;
                                        }
}



$entry=~s/detail\.plant/detail.pl/g;
($cnps_name=lc($NAN{$TID}))=~s/ /_/g;
($cnps_search= $cnps_name)=~s/_.*//;
$cnps_name=~s/subsp\./ssp./;
$entry=~s!{CNPS listed}!<a href="http://cnps.site.aplus.net/cgi-bin/inv/inventory.cgi/Go?_id=$cnps_name&sort=DEFAULT&search=$cnps_search">{CNPS listed}</a>!;
$entry=~s/<br><b>/<b>/g;
	print $entry;

#drop-down list of species in genus
	if($IJM_key{$_}){

 		unless($NAN{$_}=~/aceae$/){
                	print <<EOP;
<FORM>
<SELECT WIDTH=20 onChange="JumpToIt(this)">
<OPTION VALUE="None">List of species
@taxa
</SELECT>
</FORM>
EOP
        }




	print <<EOP;
	<a href="/cgi-bin/get_IJM.pl?key=$_"><b>Key to $NAN{$_}</b></a>
	<P>
EOP
	}
	}

	$previous_tid=$IJM_list[$IJM_seq_hash{$TID}-1];
	$next_tid=$IJM_list[$IJM_seq_hash{$TID}+1];
	$previous_taxon=$NAN{$previous_tid};
	$next_taxon=$NAN{$next_tid};
if($store_treat_path{$TID}=~/\d/){
$overlay_code= $store_treat_path{$TID};
$overlay_code=~s/.*\t//;
}


#added from get_cpn on Jan 5 2013
unless($overlay_code){
	$file="${data_path}nomsyn_hcode_hash";
	#tie(%hcode_hash, "BerkeleyDB::Hash", -Filename=>$file, -Flags=>DB_RDONLY)|| print "Couldnt open $file: $!";
	$overlay_name=ucfirst(lc($NAN{$TID}));

	$overlay_name=~s/\+/ /g;
#print "OLN: $overlay_name OLC$overlay_code: ";
	if($overlay_name){
		$overlay_code=$hcode_hash{$overlay_name};
#print "OLN: $overlay_name OLC$overlay_code: ";
	}
	else{
		$overlay_code="0000000000";
	}
#print "OLN: $overlay_name OLC$overlay_code: ";
}



#else{
#$overlay_code="null$TID";
#}



print <<EOP;
<a href="get_IJM.pl?tid=$previous_tid"> Previous taxon: $previous_taxon</a>
<br>
<a href="get_IJM.pl?tid=$next_tid"> Next taxon: $next_taxon</a>
<P>
<a href="&#109;&#97;&#105;&#108;to:rosatti&#064;berkeley.edu?subject=eFlora comment"><font size=3 color="red">Contact/Feedback</font></a>
<FORM action="http://ucjeps.berkeley.edu/cgi-bin/search_IJM.pl" method=post> <STRONG>Name search</STRONG> <INPUT name=genus size=30> <INPUT type=submit value="Submit Name"> </FORM>
<P class=bodyText>
Citation for the whole project: Jepson Flora Project (eds.) 2013. <em>Jepson eFlora</em>,  http://ucjeps.berkeley.edu/IJM.html, accessed on $today
<br>
$citation
<br>
<P>Copyright &copy; 2013 Regents of the University of California
<br>
We encourage links to these pages, but the content may not be downloaded for reposting, repackaging, redistributing, or sale in any form, without written permission from The Jepson Herbarium.

	
<hr>
EOP

#if($NAN{$TID}=~/ [a-z]/ && $entry=~m/<map>/ ){
unless($NAN{$TID}=~/aceae/){
#if($NAN{$TID}=~/ /){
if($NAN{$TID}){
$map_canvas="map_canvas";
}
else{
$map_canvas="";
}
if($map_canvas){
($name_for_elev_map=$NAN{$TID})=~s/ (subsp\.|var\.)//;
if($name_for_elev_map=~/ /){
$ft=join(",",keys(%FT));
($HB_name=$name_for_elev_map)=~s/ . / X /;
$HB=<<EOP;
<P>
CCH collections by month<br>
<img border=1 src="http://ucjeps.berkeley.edu/cgi-bin/hb2.pl?name=$HB_name&FT=$ft">
<br>
Duplicates counted once; synonyms included.
<br>Species do not include records of infraspecific taxa.
<br>Blue line denotes Manual flowering time.
EOP
}
else{
$HB="";
}
$name_for_elev_map=lc($name_for_elev_map);
print <<EOP;
<table border=0>
<tr><td>Bioregions in which taxon occurs</td><td>Red area (if present) is the part of the bioregion lying between the upper and lower elevation limits of the taxon;<br>markers link to CCH specimen records. If the markers are obscured, reload the page [or change window size and reload]. Yellow markers indicate records that may have georeferencing or identification issues.</td></tr>
<tr>
<td valign="top">
<img src="http://ucjeps.berkeley.edu/cgi-bin/draw_jmap.pl?$overlay_code" border="0" alt="map of distribution 1">
</td>
<td>
	<div id="$map_canvas"></div>
</td>

</tr>
<tr><td>
<img src="http://ucjeps.berkeley.edu/cgi-bin/map_cch_elev.pl?taxon_name=$name_for_elev_map&t=&g="</img>
<br>
Chart based on elevation range in Manual and elevations and coordinates of CCH records.
<br>
Data provided by the participants of the Consortium of California Herbaria.
<br>
Note: About half of the CCH records include both elevation and coordinates.
</td><td valign="top">Map made in collaboration with Scott Loarie. Data provided by the participants of the Consortium of California Herbaria.
<br>
<a href="http://ucjeps.berkeley.edu/cgi-bin/get_consort.pl?taxon_name=$NAN{$TID}">View all CCH records</a>
<P>
&nbsp;
</P>
<P>
$HB
</td></tr>
</table>
</body></html>
EOP
}
else{
print <<EOP;
<table>
<tr>
<td>
<img src="http://ucjeps.berkeley.edu/cgi-bin/draw_jmap.pl?$overlay_code" border="0" alt="map of distribution 2">
</td>
<td>
</td>

</tr>
</table></body></html>
EOP
}
}
}
else{
warn "bad input\n";
}
}
else{
if($query->param('key')){
	$TID= $query->param('key');
		if($TID=~/^\d[ 0-9,]*$/){
print $query->header;                    # create the HTTP header
print <<EOP;
<html xmlns="http://www.w3.org/1999/xhtml">


<head><title>Jepson Herbarium: Jepson Flora Project: Jepson eFlora Keys</title> 
<link href="http://ucjeps.berkeley.edu/common/styles/style_main_tjm2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
function initialize() {
  var myOptions = {
    mapTypeId: google.maps.MapTypeId.TERRAIN
  }

  var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
  var kmlLayer = new google.maps.KmlLayer("http://herbaria4.herb.berkeley.edu/interchange/kmls/$TID.kml", { suppressInfoWindows: true });
  kmlLayer.setMap(map);

  var pmlLayer = new google.maps.KmlLayer("http://herbaria4.herb.berkeley.edu/interchange/coords/$TID.kml?$$", {  });
  pmlLayer.setMap(map);

}
function JumpToIt(list) {
    var newPage = list.options[list.selectedIndex].value
    if (newPage != "None") {
        location=newPage
    }
}
</script>

<style type="text/css" media="screen">
    #map_canvas {
      margin-left: auto;
      margin-right: auto;
      display: block;
      float: left;
 width: 378px;
      height: 400px;
      padding: 10px;
    }
	.inat-widget {
		font-family: Georgia, serif;
		font-size: smaller;
		padding: 10px;
		line-height: 1;
	}
	.inat-widget a img {
		border:none;
	}

</style>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-27128382-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</head>

<body onload="initialize()">

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

  <!-- Beginning of horizontal menu -->
  <table class=horizMenu width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td height="21" width="640" align="right">
      <a href="http://ucjeps.berkeley.edu/main/directory.html" class="horizMenuActive">Directory</a>
  	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="http://ucjeps.berkeley.edu/news/" class="horizMenuActive">News</a>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="http://ucjeps.berkeley.edu/main/sitemap.html" class="horizMenuActive">Site Map</a>	
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="http://ucjeps.berkeley.edu/" class="horizMenuActive">Home</a>	
    </td>
<td />
  </tr>
   <tr>
       <td colspan="6" bgcolor="#9FBFFF"><img src="http://ucjeps.berkeley.edu/common/images/common_spacer.gif" alt="" width="1" height="1" border="0" /></td>
     </tr>
 </table>
 <!-- End of horizontal menu -->

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
       <td width="100%"><span class="pageName"><a href="/IJM.html">Jepson eFlora</a></span>
<span class="pageAuthorLine">
<br>
<a href="/IJM_fam_key.html">Key to families</a>
|
<a href="/IJM_toc.html">Table of families and genera</a>
</span>
   	  
  <!-- <p class="bodyText">This text currently parallels  <i>The Jepson Manual: Vascular Plants of California, Second Edition</i> that is now <a href="http://www.ucpress.edu/book.php?isbn=9780520253124">available at the University of California Press.</a> -->

<P class="bodyText">
<!-- Text appearing in blue on this page will not appear in the printed book; it will be displayed only on the Web. -->
Specimen numbers are hyperlinked to records in the Consortium of California Herbaria data view where possible. Taxa are hyperlinked to entries in the Jepson Interchange via the "[Online Interchange]" link. 

</td>
</tr>
</table>

EOP

	if($IJM_key{$TID}){
	$key= $IJM_key{$TID};
	$key=~s!<a href="#(\d+)!<a href="/cgi-bin/get_IJM.pl?tid=$1!g;
$entry=$IJM{$TID};
 if($entry=~s/<sp_list>(.*)<\/sp_list>//){
	@taxa=split(/,/,$1);
	foreach(@taxa){
		s!.*!<OPTION VALUE="http://herbaria4.herb.berkeley.edu/cgi-bin/get_IJM.pl?tid=$&">$NAN{$&}\n!;
                                        }
}
$entry=~s/<br><b>/<b>/g;
print "<P>&nbsp;<P>$entry";
 		unless($NAN{$TID}=~/aceae$/){
                	print <<EOP;
<FORM>
<SELECT WIDTH=20 onChange="JumpToIt(this)">
<OPTION VALUE="None">List of species in $NAN{$TID}
@taxa
</SELECT>
</FORM>
EOP
        }
	print "<h2>Key to $NAN{$TID}</h2>";
	print $key;
print <<EOP;
<P>
<a href="&#109;&#97;&#105;&#108;to:rosatti&#064;berkeley.edu?subject=eFlora comment"><font size=3 color="red">Contact/Feedback</font></a>
<P class=bodyText>
Citation for the whole project: Jepson Flora Project (eds.) 2013. <em>Jepson eFlora</em>,  http://ucjeps.berkeley.edu/IJM.html on $today
<br>
Citation for this treatment:  $citation
<br>
We encourage links to these pages, but the content may not be downloaded for reposting, repackaging, redistributing, or sale in any form, without written permission from The Jepson Herbarium.

        
<hr>

EOP
	}
else{
}
		}
	}
}
__END__
#add IJM_sequence.txt output file here
