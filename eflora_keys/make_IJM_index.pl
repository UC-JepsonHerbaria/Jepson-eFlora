open(IN, "tnoan.out") || die;
while(<IN>){
chomp;
s/� /&times;/;
($tid,$name)=split(/\t/);
$TID{$name}=$tid;
}
close(IN);
$TID{"Centaurea jacea nothosubsp. pratensis"}=93858;
open(IN, "index_full2.tmp") || die;
while(<IN>){
chomp;
if(m/\*/){
$code{$_}=$last_code;
}
else{
if($TID{$_}){
$code{$_}= $TID{$_};
$last_code= $TID{$_};
}
else{
warn "No code for $_\n";
}
}
}
foreach $i (A .. Z){
open($i, ">IJM_index_${i}.html");
print $i <<EOP;
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Jepson Herbarium: Jepson Flora Project: eFlora index for $i</title> 
	<link href="http://ucjeps.berkeley.edu/common/styles/style_main_tjm2.css" rel="stylesheet" type="text/css" />
</head>

<body>

<!-- Begin banner -->
<table class="banner" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> <td colspan="5" align="center" valign="middle">&nbsp;</td> </tr>

  <tr>
      <td rowspan="4" width="12" align="center" valign="middle"></td>
      <td rowspan="3" width="120" align="center" valign="middle">
        <a href="http://ucjeps.berkeley.edu/jeps/"><img src="http://ucjeps.berkeley.edu/common/images/logo_jeps_80.png" alt="Jepson Herbarium (JEPS)" width="80" height="79" border="0" /></a></td>
    <td align="center">&nbsp;</td>
    <td rowspan="3" width="120" align="center" valign="middle"></td>
    <td rowspan="4" width="12" align="center" valign="middle"></td>
  </tr>

    <tr> <td align="center" valign="middle"><span class="bannerTitle">The Jepson Herbarium</span><br /></td> </tr>

    <tr> <td align="center" valign="top"><a href="http://www.berkeley.edu" class="bannerTagLine">University of California, Berkeley</a></td> </tr>

     <tr> <td colspan="3" align="center"></td> </tr>
     
   <tr> <td height="8" colspan="5" align="center">&nbsp;</td> </tr>
   <tr class="bannerBottomBorder"> <td colspan="6" height="3"></td> </tr>

    <tr> <td colspan="6"><img src="http://ucjeps.berkeley.edu/common/images/common_spacer.gif" alt="" width="1" height="1" border="0" /></td> </tr>
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

       <td width="100%"><span class="pageName"><a href="/IJM.html">Jepson eFlora</a></span></td>
</tr>
   <tr>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td width="100%">Indexes to accepted names and synonyms:</td>
</tr>
   <tr>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td width="100%">(synonyms indicated with asterisks)</td>
</tr>
   	  
   <tr>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>
	|<a href="/IJM_index_A.html">A</a> | 
	<a href="/IJM_index_B.html">B</a> | 
	<a href="/IJM_index_C.html">C</a> | 
	<a href="/IJM_index_D.html">D</a> | 
	<a href="/IJM_index_E.html">E</a> | 
	<a href="/IJM_index_F.html">F</a> | 
	<a href="/IJM_index_G.html">G</a> | 
	<a href="/IJM_index_H.html">H</a> | 
	<a href="/IJM_index_I.html">I</a> | 
	<a href="/IJM_index_J.html">J</a> | 
	<a href="/IJM_index_K.html">K</a> | 
	<a href="/IJM_index_L.html">L</a> | 
	<a href="/IJM_index_M.html">M</a> | 
	<a href="/IJM_index_N.html">N</a> | 
	<a href="/IJM_index_O.html">O</a> | 
	<a href="/IJM_index_P.html">P</a> | 
	<a href="/IJM_index_Q.html">Q</a> | 
	<a href="/IJM_index_R.html">R</a> | 
	<a href="/IJM_index_S.html">S</a> | 
	<a href="/IJM_index_T.html">T</a> | 
	<a href="/IJM_index_U.html">U</a> | 
	<a href="/IJM_index_V.html">V</a> | 
	<a href="/IJM_index_W.html">W</a> | 
	<a href="/IJM_index_X.html">X</a> | 
	<a href="/IJM_index_Y.html">Y</a> | 
	<a href="/IJM_index_Z.html">Z</a> | 
</td>
</tr>
</table>


EOP
}
#<a href="/cgi-bin/get_IJM.pl?tid=11531">	*Abies magnifica var. shastensis</a> (under Abies procera)<br>
foreach (sort(keys(%code))){
$outfile=substr($_,0,1);
print $outfile <<EOP;
<a href="/cgi-bin/get_IJM.pl?tid=$code{$_}">	$_</a><br>
EOP
}
foreach $i (A .. Z){
print "$i\n";
close($i);
open(OUT, ">>IJM_index_${i}.html")|| die;
print OUT qq{<br><span class="copyrightText">&nbsp;&nbsp;Copyright &copy; 2011 Regents of the University of California</span></body></html>};
close(OUT);
}
