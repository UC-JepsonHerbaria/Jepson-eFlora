<?php
date_default_timezone_set('America/Los_Angeles');
$URL_TaxonID = htmlspecialchars($_GET["tid"]);

require 'config/config.php';
$db = new SQLite3($database_location);

if (preg_match('/^[0-9]+/', $URL_TaxonID)) {
	$results = $db->query('SELECT ID, TaxonID, ScientificName, TaxonAuthor, NativeStatus, KeyCharacteristics, Status, Habitat, LifeHistory, Conservation, DistributionNotes, MACDescription, MACNotes, VerticalDistribution, Frequency, Substrate, Associates, Epiphytes, TypeLocality 
							FROM eflora_taxa
							WHERE TaxonID='.$URL_TaxonID.';'); //10 is the TaxonID for Lessoniopsis littoralis, for example
}
else { //Else, process URL_TaxonID as a string and check if there's a matching name
	$URL_Name = ucwords($URL_TaxonID);
	$URL_Name = str_replace("-", " ", $URL_Name);
	$URL_Name = str_replace("_", " ", $URL_Name);
	$results = $db->query('SELECT ID, TaxonID, ScientificName, TaxonAuthor, NativeStatus, KeyCharacteristics, Status, Habitat, LifeHistory, Conservation, DistributionNotes, MACDescription, MACNotes, VerticalDistribution, Frequency, Substrate, Associates, Epiphytes, TypeLocality 
							FROM eflora_taxa
							WHERE ScientificName IN ("'.$URL_Name.'");');
}


while ($row = $results->fetchArray()) {

$ID = $row['ID'];
$ScientificName = $row['ScientificName'];
$TaxonAuthor = $row['TaxonAuthor'];
$NativeStatus = $row['NativeStatus'];
$KeyCharacteristics = $row['KeyCharacteristics'];
$Status = $row['Status'];
$Habitat = $row['Habitat'];
$LifeHistory = $row['LifeHistory'];
$Conservation = $row['Conservation'];
$DistributionNotes = $row['DistributionNotes'];
$MACDescription = $row['MACDescription'];
$MACNotes = $row['MACNotes'];
$VerticalDistribution = $row['VerticalDistribution'];
$Frequency = $row['Frequency'];
$Substrate = $row['Substrate'];
$Associates = $row['Associates'];
$Epiphytes = $row['Epiphytes'];
$TypeLocality = $row['TypeLocality'];
//var_dump($row); 
/*var_dump prints the whole row in a databased format
which is useful for seeing what you're getting
but is pretty ugly
*/
}

//get the audio clip from the media table
$results = $db->query('SELECT ID, FileName 
						FROM eflora_media
						WHERE TaxonID='.$URL_TaxonID.' AND MediaType LIKE "Audio";'); //10 is the TaxonID for Lessoniopsis littoralis, for example

while ($row = $results->fetchArray()) {
	$AudioFile= $row['FileName'];
}

//get illustration and photo results
$illustration_results = $db->query('SELECT FileName
									from eflora_media
									WHERE TaxonID='.$URL_TaxonID.' AND MediaType LIKE "Illustration";');
$photo_results = $db->query('SELECT FileName
							from eflora_media
							WHERE TaxonID='.$URL_TaxonID.' AND MediaType LIKE "Photo";');


//Before doing anything, if the TID isn't recognized, give a plain error screen
if (!$ID){ //if TaxonID (pulled from URL) did not match a line in the database...
	echo "<html xmlns='http://www.w3.org/1999/xhtml'>";
	echo "Taxon not recognized TID=".$TaxonID.":  <a href='http://ucjeps.berkeley.edu/seaweedflora/'>Return to the front page</a>";
	echo "</html>";
	die();
}
?>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>University Herbarium: California Seaweed eFlora: <?php echo "$ScientificName"?></title> 
<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
<link href="http://ucjeps.berkeley.edu/common/styles/dropdowns.css" rel="stylesheet" type="text/css" />
<link href="common/css/seaweed.css" rel="stylesheet" type="text/css" />

<!--jquery/jquery-ui script files-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<!-- fancybox files -->
<link rel="stylesheet" href="fancybox/source/jquery.fancybox.css" type="text/css" media="screen" />
<script type="text/javascript" src="fancybox/source/jquery.fancybox.pack.js"></script>

<!-- google maps files and scripts -->
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>

<?php 
// TID is passed to JS by using PHP to echo the value of $TaxonID to a JS variable TaxID 
// Apparently there are better ways to do this using AJAX
$name4GoogleMap = str_replace(" ", '_', $ScientificName);
?>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript"> 
function initialize() {
  var myOptions = {
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }

  var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

	var MapName = "<?php echo $name4GoogleMap;?>";

  var pmlLayer = new google.maps.KmlLayer("http://herbaria4.herb.berkeley.edu/SW_coords/"+MapName+".kml", { });
  pmlLayer.setMap(map);

}

function JumpToIt(list) {
    var newPage = list.options[list.selectedIndex].value
    if (newPage != "None") {
        location=newPage
    }
}
</script>

<!-- Google analytics -->
<!-- goes here, once it is made -->

<!-- jquery functions -->
<!--JQ Tabs-->
<script>
  $(function() {
    $( "#tabs" ).tabs();
  });
</script>


<!-- fancybox -->
<script>
   $(document).ready(function() {
	   $(".fancybox").fancybox({
		    type        : 'image',
	    	openEffect  : 'none',
	    	closeEffect : 'none'
		});
    });
    $(document).ready(function() {
		$('.fancybox2').fancybox();
    });
</script>
<!-- end fancybox-->
</head>

<body onload="initialize()">
<div id="wrapper">
<!-- Begin banner -->
<?php include('common/php/seaweed_header.php'); ?>
<!-- End banner -->

<!-- Beginning of horizontal menu -->
<?php include('common/php/globalnav.php'); ?> 
<!-- End of horizontal menu -->

<div id="content">
<div id="content-left">


	<?php
	echo "<h2><a href='http://ucjeps.berkeley.edu/cgi-bin/porp_cgi.pl?139507'><i>".$ScientificName."</i> ".$TaxonAuthor."</a>";
	if (isset($AudioFile)){ // AudioFile is included as part of the heading
		echo '<audio controls>';
		echo '<source src="audio/'.$AudioFile.'" type="audio/ogg">';
		echo 'Your browser does not support the audio element.';
		echo '</audio>';
	}
	echo "</h2>";
	if (isset($KeyCharacteristics)){ //print KeyCharacteristics block, if any
		$KeyCharacteristics = str_replace("|",'</li><li>',$KeyCharacteristics); //process lists by turning the pipe delimiter into list tags
		echo "<h3>Key Characteristics</h3>";
		echo '<ul><li>'.$KeyCharacteristics.'</li></ul>';
	}
	
	//load image gallery, if any
	if ($row = $photo_results->fetchArray()) { //this if statement loads the first image, which is not hidden
		echo '<h3>Image Gallery (click for more)</h3>';
		$photo_name = $row['FileName'];
		echo '<a href="images/'.$photo_name.'" class="fancybox" rel="gallery"><img width=210px src="images/'.$photo_name.'" /></a>';
	}
	echo '<div class="hidden">';
	while ($row = $photo_results->fetchArray()) { //this while statement loops through the remaining images, which are not hidden
		$photo_name = $row['FileName'];
		echo '<a href="images/'.$photo_name.'" class="fancybox" rel="gallery"><img width=210px src="images/'.$photo_name.'" /></a>';
	}
	echo '</div>';
	?>
	
	<h3>Database links</h3>
	<ul>
		<?php $name4CSpace = str_replace(" ", '%20', $ScientificName);
		echo '<li><a href="https://webapps.cspace.berkeley.edu/ucjeps/publicsearch/publicsearch/?country=USA&determination='.$name4CSpace.'&displayType=grid&maxresults=10000">UC Specimens</a></li>';
		$name4Smithso = str_replace(" ", '+', $ScientificName);
		echo '<li><a href="http://collections.si.edu/search/results.htm?q='.$name4Smithso.'&tag.cstype=all">Smithsonian Institution</a></li>';
		echo '<li><a href="http://macroalgae.org/">Macroalgal Herbarium Portal</a></li>';
		?>
	</ul>
</div>

<div id="content-main">
	<div id="tabs">
		  <ul>
		    <li><a href="#tabs-1">Distribution</a></li>
		    <li><a href="#tabs-2">Notes</a></li>
		    <li><a href="#tabs-3">Illustrations</a></li>
		    <li><a href="#tabs-4">Description</a></li>
		    <!-- <li><a href="#tabs-5">Similar Species</a></li> --> <!-- SIMILAR SPECIES not in CALIFORNIA_SEAWEEDS.txt yet -->
		  </ul>
		<div id="tabs-1"> <!-- map tab -->
			<p><div id="map_canvas"></div></p>
			<p>UC specimens and range limits for <?php echo "$ScientificName"; ?></p>
			<?php 
				$name_for_pnw_link = str_replace(" ", '&Species1=', $ScientificName);
    			echo '<p><a class="internal" href="http://www.pnwherbaria.org/data/results.php?DisplayAs=WebPage&ExcludeCultivated=Y&GroupBy=ungrouped&SortBy=Year&SortOrder=DESC&SearchAllHerbaria=Y&QueryCount=1&IncludeSynonyms1=Y&Genus1='.$name_for_pnw_link.'&Zoom=4&Lat=55&Lng=-135&PolygonCount=0">Map from Pacific Northwest Herbaria</a>';
				if(isset($DistributionNotes)){
					$DistributionNotes = str_replace("|",'</p><p>',$DistributionNotes);
					echo '<p><b>Notes: </b>'.$DistributionNotes.'</p>';
				}
			?>
		</div>
		<div id="tabs-2"> <!-- notes tab -->
			<?php
				if (isset($Status)) { echo '<p><b>Status:</b> '.$Status.'</p>'; }
				if (isset($Habitat)) { echo '<p><b>Habitat:</b> '.$Habitat.'</p>'; }
				if (isset($LifeHistory)) { echo '<p><b>Life History:</b> '.$LifeHistory.'</p>'; }
				if (isset($Conservation)) { echo '<p><b>Conservation:</b> '.$Conservation.'</p>'; }
				if (isset($Associates)) { echo '<p><b>Associated Taxa:</b> '.$Associates.'</p>'; }
				if (isset($Epiphytes)) { echo '<p><b>Status:</b> '.$Epiphytes.'</p>'; }
				// GENBANK LINK to be imported from Dick Moe's SW table
			?>
		</div>
		<div id="tabs-3"> <!-- illustrations tab -->
			<p>Illustrations are from <a href="http://ucjeps.berkeley.edu/guide/">DeCew's Guide to the Seaweeds of British Columbia, Washington, Oregon, and Northern California</a>, unless otherwise stated.</p>
			<?php
		    	while ($row = $illustration_results->fetchArray()) {
					$illu_name = $row['FileName'];
					echo '<img style="max-width:528px;" src="http://ucjeps.berkeley.edu/guide/'.$illu_name.'"><br><br>';
				}
			?>
		</div>
		<div id="tabs-4"> <!-- MAC Tab -->
			<?php
				if (isset($MACDescription)) {
					$MACDescription = str_replace("|",'</p><p>',$MACDescription);
					echo '<p>'.$MACDescription.'</p>';
					echo '<p>Excerpt from Abbott, I. A., & Hollenberg, G. J. (1976). <i><a href="http://www.sup.org/books/title/?id=2401">Marine algae of California</a></i>. Stanford University Press, Stanford, California. xii [xiii] + 827 pp., 701 figs.<p>';
				}
				if (isset($MACNotes)) {
					echo '<p><b>Notes:</b> '.$MACNotes.'</p>';
				}
			?>
		</div>
		<!-- <div id="tabs-5"></div> --> <!-- similar species tab -->
	</div>	
</div>


<div id="content-right">
	<?php
		
		echo '<p><a href="http://www.algaebase.org/search/?species='.$name4CSpace.'"><b>Classification & Synonyms: Algaebase</b></a></p>';
		echo '<p><b>'.$NativeStatus.'</b></p>';
		if (isset($VerticalDistribution)) { echo '<p><b>Vertical Distribution:</b> '.$VerticalDistribution.'</p>'; }
		if (isset($Frequency)) { echo '<p><b>Frequency:</b> '.$Frequency.'</p>'; }
		if (isset($Substrate)) { echo '<p><b>Substrate:</b> '.$Substrate.'</p>'; }
		if (isset($TypeLocality)) { 
			$TypeLocality = str_replace("|", '</p><p>', $TypeLocality);
			echo '<p><b>Type locality (first collection site):</b> '.$TypeLocality.'</p>'; 
		}
		// Phenology: Link to DeCew's guide
	?>
</div>
</div>
<div id="footer">

</div>
<div id="bottom"></div>
</div>
</body></html>
