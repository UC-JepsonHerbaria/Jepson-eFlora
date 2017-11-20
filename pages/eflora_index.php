<?php
date_default_timezone_set('America/Los_Angeles');
$SearchTerm = htmlspecialchars($_GET["index"]);

//connect to the database
require 'config/config.php';
$db = new SQLite3($database_location);
?>

<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>Jepson Herbarium: Jepson Flora Project: Jepson eFlora Search</title>
<!--<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">--> 
<!--This above line has been in here for an unknown length of time, but it effectively stops all search engines from indexing this page for display in searches
no eFlora pages will come up in searches in Google with this in here, and neither will species pages from eFlora.  CalFlora will remain the top result if this is kept.
The alternate search, like search_IJM.pl, is the only one comming up
in google as of August 2017.  This alternate page, however, is dated and a bit ugly, especially compared to CalFlora.  I am sprucing it up with images from CalPhotos, so it will remain.
This is now commented out so this page will be indexed and species pages will now hopefully be included in Google searches -->
<link href="http://ucjeps.berkeley.edu/common/styles/dropdowns.css" rel="stylesheet" type="text/css" />

<!-- Google analytics -->
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
<?php include($_SERVER['DOCUMENT_ROOT'].'/header_jeps.php'); ?>
<!-- End banner -->

<!-- Beginning of horizontal menu -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/globalnav.php'); ?> 
<!-- End of horizontal menu -->

<table border="0">
   <tr>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td width="100%"><span class="pageName"><a href="http://ucjeps.berkeley.edu/IJM.html">Jepson eFlora:</a> Search page</span>
		<br>
			<span class="pageAuthorLine">
				<a href="http://ucjeps.berkeley.edu/IJM_fam_key.html">Key to families</a>
				<a href="http://ucjeps.berkeley.edu/IJM_toc.html">Table of families and genera</a>
			</span>	  
		</td>
	</tr>
</table>

<table align="center" width="100%"><tr><td>
&nbsp;
</td>
<td width=90%">
<!--eFlora index-->
<?php //include($_SERVER['DOCUMENT_ROOT'].'/eflora_index_bar.php'); 
include('common/eflora_index_bar.php'); ?>
<hr width="10%">
</td>

<td align="right">
&nbsp;
</td></tr>
</table>

<br>

<table width="100%">
<tr>
<td width="100%" valign="top">

<form action="search_eflora.php" method="POST">
<b>Scientific Name<br></b>		<input type="text" id="query_text" name="query"></input>
		<input type="submit" value="Submit Name" />
</form>

<?php
//$SearchTerm must be a single capital letter
if (preg_match("/^[A-Z]$/", $SearchTerm)) {
	echo '<p class="bodyText">Index Page: '.$SearchTerm.'<p>';

//perform a search that returns all names that start with a letter
//this is the same query as in search_eflora.php, but with a different WHERE clause
	$stmt = $db->prepare("SELECT a.ScientificName as ScientificName, a.TaxonID as TaxonID, a.CommonName as CommonName, a.NativeStatus as NativeStatus, a.IsTerminalTaxon as IsTerminalTaxon, a.HasKey as HasKey, a.AcceptedNameTID as AcceptedNameTID, b.ScientificName as AcceptedName
						FROM eflora_taxa a
						LEFT OUTER JOIN eflora_taxa b on a.AcceptedNameTID = b.TaxonID
						WHERE a.ScientificName LIKE '".$SearchTerm."%'
						ORDER BY ScientificName");
	$results = $stmt->execute();

//in the following "if" paragraph, the row needs to be printed before the while loop
//because when the while loop runs fetchArray, it is moving on to the second row
//so if the first row isn't printed before the while loop, the results will start with the second row.
	if ($row = $results->fetchArray()) {
		echo '<div class="eFloraTable"><table border="1">';
		echo '<tr><td>Scientific Name</td><td>Common Name</td><td></td></tr>';
		if ($row['AcceptedNameTID']){ //if it has an AcceptedNameTID, then it's a synonym, so print the synonym line
			$row['NativeStatus'] = str_replace("Noted Name", "Mentioned in<br>a note", $row['NativeStatus']);
			echo '<tr><td><a href="eflora_display.php?tid='.$row['AcceptedNameTID'].'">'.$row['ScientificName'].'</a><br>(Under '.$row['AcceptedName'].')</td>';
			echo '<td>'.$row['CommonName'].'</td>';
			echo '<td>'.ucfirst(strtolower($row['NativeStatus'])).'</td>';
			echo '</tr>';
		}
		else { //else it is an accepted name, so print the full line
			echo '<tr><td><a href="eflora_display.php?tid='.$row['TaxonID'].'">'.$row['ScientificName'].'</a>';
			if ($row['HasKey']){ //if it has a key, add the key text under the name
				echo '<br>&nbsp;&nbsp;<a href="http://ucjeps.berkeley.edu/cgi-bin/get_IJM.pl?key='.$row['TaxonID'].'">&#x21b3;&nbsp;&nbsp;Key to '.$row['ScientificName'].'</td>';
			}
			else {
				echo '</td>';
			}
			echo '<td>'.$row['CommonName'].'</td>';
			echo '<td>'.ucfirst(strtolower($row['NativeStatus'])).'</td>';
		}
		while ($row = $results->fetchArray()) {
		if ($row['AcceptedNameTID']){ //if it has an AcceptedNameTID, then it's a synonym, so print the synonym line
			$row['NativeStatus'] = str_replace("Noted Name", "Mentioned in<br>a note", $row['NativeStatus']);			
			echo '<tr><td><a href="eflora_display.php?tid='.$row['AcceptedNameTID'].'">'.$row['ScientificName'].'</a><br>(Under '.$row['AcceptedName'].')</td>';
			echo '<td>'.$row['CommonName'].'</td>';
			echo '<td>'.ucfirst(strtolower($row['NativeStatus'])).'</td>';
			echo '</tr>';		
		}
		else { //else it is an accepted name, so print the full line
			echo '<tr><td><a href="eflora_display.php?tid='.$row['TaxonID'].'">'.$row['ScientificName'].'</a>';
			if ($row['HasKey']){ //if it has a key, add the key text under the name
				echo '<br>&nbsp;&nbsp;<a href="http://ucjeps.berkeley.edu/cgi-bin/get_IJM.pl?key='.$row['TaxonID'].'">&#x21b3;&nbsp;&nbsp;Key to '.$row['ScientificName'].'</td>';
			}
			else {
				echo '</td>';
			}
			echo '<td>'.$row['CommonName'].'</td>';
			echo '<td>'.ucfirst(strtolower($row['NativeStatus'])).'</td>';
		}	
		}
		echo '</table></div>';
	}
}

else {
	echo 'Invalid index URL. Please use the index links above<br>';
}

?>
<br>
<a href="mailto:interchange@lists.berkeley.edu"><span class="feedbackLink">Feedback/Contact<span></a><br>
</td>
</tr>
</table>



<!--Begin footer-->
<?php include('common/eflora_footer.php'); ?>
<!--End footer-->
