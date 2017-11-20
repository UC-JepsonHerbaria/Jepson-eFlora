#<a name="Group1"></a><blockquote><h3><a name=Group1>Group 1</a>: Herbs; bulblets dispersed in place of seeds or frs; available specimens without fls</h3></blockquote>
open(IN, "family_keys.html") || die;
open(OUT, ">IJM_fam_key.html") || die;

while(<IN>){
	if(m/<a name="Group(\d+)/){
		$gp=$1;
print OUT <<EOP;
</body>
</html>
EOP
		open(OUT, ">IJM_key_Group${gp}.html") || die;
		print OUT<<EOP;
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>Jepson Herbarium: Jepson Flora Project: Jepson eFlora: Key to Group$gp</title> 
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
<a href="/IJM_fam_key.html">Key to groups</a>
       <br />

<h3>Family key to Group $gp</h3>
EOP
}
print OUT;
}
print OUT <<EOP;
</body>
</html>
EOP
