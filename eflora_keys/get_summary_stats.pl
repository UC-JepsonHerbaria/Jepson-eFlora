#NATIVE	ISOETACEAE	Isoetes	bolanderi	Engelm.				Isoetes bolanderi	Isoetes bolanderi Engelm.		syn: Isoetes bolanderi var. pygmaea (Engelm.) Clute		TJM1	LYCOPHYTES	0
open(IN, "accepted_names.out") || die;
while(<IN>){
next unless m/ACEAE/;
unshift(@AA,$_);
}
foreach(@AA){
#print;
	($nativity, $family, $genus, $species, $species_author, $infraspecific_rank, $infraspecific_epithet, $infraspecific_author, $name_minus_authors, $name_plus_authors, $expanded_name, $synonyms, $common, $TJM1_TJM2, $major_clade, $endemicity)=split(/\t/);
	$MC{$family}=$major_clade;
	$genus_count++ unless $seen{$genus}++;
	if($nativity=~/NATIVE/){
		$native_species{$family}++ unless $seen{"$genus $species"}++;
		if($infraspecific_epithet){
			$native_MRT{$family}++;
			$seen_MRT{"$genus $species"}++;
		}
		else{
			$native_MRT{$family}++ unless $seen_MRT{"$genus $species"};
		}
		$count_NNGenera{$family}++ unless $seen_NNG{$genus}++;
$NN{$family}{$genus}++;
	}
	if($nativity=~/NATURALIZED/){
		$naturalized_species{$family}++ unless $seen{"$genus $species"}++;
		if($infraspecific_epithet){
			$naturalized_MRT{$family}++;
			$seen_MRT{"$genus $species"}++;
		}
		else{
			$naturalized_MRT{$family}++ unless $seen_MRT{"$genus $species"};
		}
		$count_NNGenera{$family}++ unless $seen_NNG{$genus}++;
$NN{$family}{$genus}++;
	}
	if($nativity!~/NATIVE|NATURALIZED/){
		$waif_species{$family}++ unless $seen{"$genus $species"}++;
		if($infraspecific_epithet){
			$waif_MRT{$family}++;
			$seen_MRT{"$genus $species"}++;
		}
		else{
			$waif_MRT{$family}++ unless $seen_MRT{"$genus $species"};
		}
		#$count_WAIFGenera{$family}++ unless $seen_WAIF{$genus}++;
$WAIF{$family}{$genus}++;
	}
	if($endemicity ==1){
		if($infraspecific_epithet){
			$endemic_MRT{$family}++;
		}
		else{
			$endemic_MRT{$family}++ unless $seen_MRT{"$genus $species"};
		}
	}
}






print <<EOP;
<html xmlns="http://www.w3.org/1999/xhtml">


<head><title>Jepson Herbarium: Jepson Flora Project: Jepson eFlora: Table of Contents</title> 
<link href="http://ucjeps.berkeley.edu/common/styles/style_main_tjm2.css" rel="stylesheet" type="text/css" />
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

       <td width="100%"><span class="pageName"><a href="/IJM.html">Jepson eFlora:</a> Summary of taxa</span><br /><br />

</td>
</tr>
</table>
<table cellpadding=15><tr><td>
<table cellspacing="0" class="bodyText">
     <tr bgcolor="#ffffff"><th colspan="11">&nbsp;</th></tr>
     <tr bgcolor="#9FBFFF"><th>family</th><th bgcolor="#ffffff">major clade</th><th>genera with<br>native or naturalized<br>species</th><th bgcolor="#ffffff">genera without<br>native or<br>naturalized<br>species*</th><th>native<br>species</th><th bgcolor="#ffffff">naturalized<br>species</th><th>species<br>not native or<br>naturalized*</th><th bgcolor="#ffffff">native <br>minimum-rank<br>taxa</th><th>naturalized<br>minimum-rank<br>taxa</th><th bgcolor="#ffffff">minimum-rank<br>taxa not native<br> or naturalized*</th><th>endemic<br>minimum-rank<br>taxa</tr>
EOP
foreach $family(sort(keys(%MC))){
$waif_genus_count=0;
	++$family_count;
	$native_sp_count += $native_species{$family};
	$native_MRT_count += $native_MRT{$family};
	$naturalized_sp_count += $naturalized_species{$family};
	$naturalized_MRT_count += $naturalized_MRT{$family};
	$waif_sp_count += $waif_species{$family};
	$waif_MRT_count += $waif_MRT{$family};
	$genus_NN_count += $count_NNGenera{$family};
	$endem_total += $endemic_MRT{$family};

foreach $waif_genus (keys %{$WAIF{$family}}){
$waif_genus_count+=1 unless $NN{$family}{$waif_genus};
}


	if($lc++ % 2){
		$color=" bgcolor='FFFFFF'";
	}
	else{
		$color="";
	}
	$line= join("</td><td align='center'>", 
	$family,
	$MC{$family},
	$count_NNGenera{$family} || 0,
	$waif_genus_count,
	$native_species{$family} || 0,
	$naturalized_species{$family} || 0,
	$waif_species{$family} || 0,
	$native_MRT{$family} || 0,
	$naturalized_MRT{$family} || 0,
	$waif_MRT{$family} || 0,
	$endemic_MRT{$family} || 0);
print "<tr$color><td>$line</td></tr>\n";
$waif_genus_total += $waif_genus_count;
}

$line= join("</td><td align='center'>", 
"",
"",
$genus_NN_count,
$waif_genus_total,
$native_sp_count,
	$naturalized_sp_count,
	$waif_sp_count,
	$native_MRT_count,
	$naturalized_MRT_count,
	$waif_MRT_count,
$endem_total
);
print "<tr><td>$line</td></tr>\n";

print <<EOP;
</table>

*Generally waifs; names are enclosed in square brackets in keys; descriptions appear only online.  
<br>
Minimum-rank taxa uncertain as to nativity: Typha angustifolia   (TYPHACEAE), Xanthium spinosum   (ASTERACEAE), Trichocoronis wrightii var. wrightii (ASTERACEAE) <br>
<table class="bodyText">
<tr><th>Families:</th><td>$family_count</td></tr>
<tr><th>Genera:</th><td>$genus_count</td></tr>
<tr><th>Species:</th><td>$native_sp_count ($naturalized_sp_count) [$waif_sp_count]</td></tr>
<tr><th>Minimum-rank taxa:</th><td>$native_MRT_count ($naturalized_MRT_count) [$waif_MRT_count]</td></tr>
</table>
</td></tr></table>




</table></body></html>

EOP
