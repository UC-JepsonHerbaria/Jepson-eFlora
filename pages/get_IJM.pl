#!/usr/bin/perl
use BerkeleyDB;
use CGI;
$query = new CGI;                        # create new CGI object
$data_path	="/Library/WebServer/ucjeps_data/";

tie(%IJM, "BerkeleyDB::Hash", -Filename=>"${data_path}IJM.hash")|| die "Stopped; couldnt open IJM\n";
tie(%IJM_key, "BerkeleyDB::Hash", -Filename=>"${data_path}IJM_key.hash")|| die "Stopped; couldnt open IJM_key\n";

tie (%store_treat_path, "BerkeleyDB::Hash", -Filename => "${data_path}TJM_treat_path", -Flags=>DB_RDONLY) or die "Cannot open file treat path" ;

$today=localtime();






open(IN,"/Users/rlmoe/data/taxon_ids/smasch_taxon_ids.txt") || die;
while(<IN>){
	chomp;
	($code,$name,@residue)=split(/\t/);
	$TNOAN{$name}=$code;
	$NAN{$code}=$name;
}
close(IN);

if($query->param('tid')){
	$TID= $query->param('tid');
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

  var pmlLayer = new google.maps.KmlLayer("http://herbaria4.herb.berkeley.edu/interchange/coords/$TID.kml", { });
  pmlLayer.setMap(map);
  var kmlLayer = new google.maps.KmlLayer("http://herbaria4.herb.berkeley.edu/interchange/kmls/$TID.kml", { suppressInfoWindows: true });
  kmlLayer.setMap(map);





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
      width: 567px;
      height: 600px;
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
       <td width="100%"><span class="pageName"><a href="/IJM.html">Jepson eFlora</a></span><br /><br />
         <!-- <span class="pageAuthorLine">Treatments for public viewing </span><br /> -->
       <br />
   	  
  <p class="bodyText">This text currently parallels  <i>The Jepson Manual: Vascular Plants of California, Second Edition</i> that is now in press at the University of California Press.

<P class="bodyText">
Text appearing in blue on this page will not appear in the printed book; it will be displayed only on the Web. In the future, corrections and updates to the printed text may be made by the author and if so will be clearly marked as a revised version, including date of change. Specimen numbers are hyperlinked to records in the Consortium of California Herbaria data view where possible. Taxa are hyperlinked to entries in the Jepson Interchange via the "[Online Interchange]" link. 

  <br><b> Citation: [Author] 2011. [Genus]. The Jepson eFlora:</b> ucjeps.berkeley.edu/IJM.html, retrieved $today
<P>
Indexes to accepted names and synonyms:<br>| $alpha_index_string
</td>
</tr>
</table>
<P>
<hr width="10%">



EOP

@IJMs= split(/, */, $IJM_entry{$TID});
	foreach(@IJMs){
	$entry= $IJM{$_};
	$entry=~s!/cgi-bin/get_cpn!http://ucjeps.berkeley.edu/cgi-bin/get_cpn!;
	$entry=~s!/cgi-bin/get_consort!http://ucjeps.berkeley.edu/cgi-bin/get_consort!;
	$entry=~s/&Ccaron;/C/g;
	$entry=~s/SCIED:/<br>&mdash;/;

$entry=~s/WEEDINESS: SYMBOL 1/{Noxious weed}/g;
$entry=~s/WEEDINESS: SYMBOL 2/{Weed listed by BAEDN and Cal-IPCI}/g;
			if($entry=~s/<sp_list>(.*)<\/sp_list>//){
				@taxa=split(/,/,$1);
					foreach(@taxa){
						s!.*!<OPTION VALUE="http://herbaria4.herb.berkeley.edu/cgi-bin/get_IJM.pl?tid=$&">$NAN{$&}\n!;
					}
}
	print $entry;
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
print <<EOP;
<a href="get_IJM.pl?tid=$previous_tid"> Previous taxon: $previous_taxon</a>
<br>
<a href="get_IJM.pl?tid=$next_tid"> Next taxon: $next_taxon</a>
<P>
<a href="http://ucjeps.berkeley.edu/cgi-bin/get_JM_treatment.pl?$NAN{$TID}">See also TJM (1993) treatment</a>
<br>
<a href="&#109;&#97;&#105;&#108;to:rosatti&#064;berkeley.edu?subject=eFlora comment">Contact</a>
    <br><span class="copyrightText">&nbsp;&nbsp;Copyright &copy; 2011 Regents of the University of California</span>
	
<hr>
EOP

if($NAN{$TID}=~/ [a-z]/ && $entry=~m/<map>/ ){
print <<EOP;
<table>
<tr><td>Bioregions in which taxon occurs</td><td>Red area is the part of the bioregion lying between the upper and lower elevation limits of the taxon;<br>markers link to CCH specimen records.</td></tr>
<tr>
<td>
<img src="http://ucjeps.berkeley.edu/cgi-bin/draw_jmap.pl?$overlay_code" border="0" alt="map of distribution">
</td>
<td>
	<div id="map_canvas"></div>
</td>

</tr>
<tr><td></td><td>Map made in collaboration with Scott Loarie</td></tr>
</table></body></html>
EOP
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


<head><title>Jepson Herbarium: Jepson Flora Project: Jepson eFlora 1.0.0</title> 
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
  var pmlLayer = new google.maps.KmlLayer("http://herbaria4.herb.berkeley.edu/interchange/coords/$TID.kml", { });
  pmlLayer.setMap(map);
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
         <!-- <span class="pageAuthorLine">Treatments for public viewing </span><br /> -->
       <br />
   	  
  <p class="bodyText">This text currently parallels  <i>The Jepson Manual: Vascular Plants of California, Second Edition</i> that is now in press at the University of California Press.

<P class="bodyText">
Text appearing in blue on this page will not appear in the printed book; it will be displayed only on the Web. In the future, corrections and updates to the printed text may be made by the author and if so will be clearly marked as a revised version, including date of change. Specimen numbers are hyperlinked to records in the Consortium of California Herbaria data view where possible. Taxa are hyperlinked to entries in the Jepson Interchange via the "[Online Interchange]" link. 

  <br><b> Citation: [Author] 2011. [Genus]. The Jepson eFlora:</b> ucjeps.berkeley.edu/IJM.html, retrieved $today
</td>
</tr>
</table>

EOP

	if($IJM_key{$TID}){
	$key= $IJM_key{$TID};
	$key=~s!<a href="#(\d+)!<a href="/cgi-bin/get_IJM.pl?tid=$1!g;
print "<P>&nbsp;<P>$IJM{$TID}";
	print "<h2>Key to $NAN{$TID}</h2>";
	print $key;
	}
		}
	}
}
__END__
#add IJM_sequence.txt output file here