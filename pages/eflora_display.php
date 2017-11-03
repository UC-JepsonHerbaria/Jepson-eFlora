<?php
date_default_timezone_set('America/Los_Angeles');
$TaxonID = htmlspecialchars($_GET["tid"]);

require 'config/config.php';
$db = new SQLite3($database_location);

$results = $db->query('SELECT ID, ScientificName, TaxonAuthor, FormattedDisplayName, CommonName, NativeStatus, TJM2Author, ScientificEditor, Habit, PlantBody, Stem, SterileStem, FertileStem, Leaf, Spines, Inflorescence, StaminateHead, RayOrPistillateFlower, PistillateHead, StaminateInflorescence, PistillateOrBisexualInflorescence, PistillateInflorescence, Spikelet, FertileSpikelet, SterileSpikelet, DistalSpikelet, CentralSpikelet, LateralSpikelet, StaminateSpikelet, PistillateSpikelet, Flower, StaminateFlower, PistillateFlower, RayFlower, DiskFlower, Cone, PollenCone, SeedCone, BisexualFlower, Fruit, Seed, Sporangia, SporangiumCase, MaleSporangiumCase, FemaleSporangiumCase, Spores, Chromosomes, RarityStatus, Ecology, Elevation, BioregionalDistribution, OutsideCA, SpeciesInGenus, GeneraInFamily, Etymology, Toxicity, Synonyms, UnabridgedSynonyms, Note, UnabridgedNote, FloweringTime, FloweringTimeCode, FruitingTime, ConingTime, Weediness, IsTerminalTaxon, RevisionNumber, DistCode, HasKey 
						FROM eflora_taxa
						WHERE TaxonID='.$TaxonID.''); //16711 is the TaxonID for Calochortus amabilis, for example

while ($row = $results->fetchArray()) {

$ID = $row['ID'];
$ScientificName = $row['ScientificName'];
$TaxonAuthor = $row['TaxonAuthor'];
$FormattedDisplayName = $row['FormattedDisplayName'];
$CommonName = $row['CommonName'];
$NativeStatus = $row['NativeStatus'];
$TJM2Author = $row['TJM2Author'];
$ScientificEditor = $row['ScientificEditor'];
$Habit = $row['Habit'];
$PlantBody = $row['PlantBody'];
$Stem = $row['Stem'];
$SterileStem = $row['SterileStem'];
$FertileStem = $row['FertileStem'];
$Leaf = $row['Leaf'];
$Spines = $row['Spines'];
$Inflorescence = $row['Inflorescence'];
$StaminateHead = $row['StaminateHead'];
$RayOrPistillateFlower = $row['RayOrPistillateFlower'];
$PistillateHead = $row['PistillateHead'];
$StaminateInflorescence = $row['StaminateInflorescence'];
$PistillateOrBisexualInflorescence = $row['PistillateOrBisexualInflorescence'];
$PistillateInflorescence = $row['PistillateInflorescence'];
$Spikelet = $row['Spikelet'];
$FertileSpikelet = $row['FertileSpikelet'];
$SterileSpikelet = $row['SterileSpikelet'];
$DistalSpikelet = $row['DistalSpikelet'];
$CentralSpikelet = $row['CentralSpikelet'];
$LateralSpikelet = $row['LateralSpikelet'];
$StaminateSpikelet = $row['StaminateSpikelet'];
$PistillateSpikelet = $row['PistillateSpikelet'];
$Flower = $row['Flower'];
$StaminateFlower = $row['StaminateFlower'];
$PistillateFlower = $row['PistillateFlower'];
$RayFlower = $row['RayFlower'];
$DiskFlower = $row['DiskFlower'];
$Cone = $row['Cone'];
$PollenCone = $row['PollenCone'];
$SeedCone = $row['SeedCone'];
$BisexualFlower = $row['BisexualFlower'];
$Fruit = $row['Fruit'];
$Seed = $row['Seed'];
$Sporangia = $row['Sporangia'];
$SporangiumCase = $row['SporangiumCase'];
$MaleSporangiumCase = $row['MaleSporangiumCase'];
$FemaleSporangiumCase = $row['FemaleSporangiumCase'];
$Spores = $row['Spores'];
$Chromosomes = $row['Chromosomes'];
//Rarity Status used to be below Ecology in sanity.pl and this file; however 90% of all records in Eflora_treatments had RarityStatus above ecology.
//This file and others will be changed to match Eflora_treatments, which was the easiest change to make.  There are 2090+ records out of order otherwise.
//JAA, Nov 2016
$RarityStatus = $row['RarityStatus'];
$Ecology = $row['Ecology'];
$Elevation = $row['Elevation'];
$BioregionalDistribution = $row['BioregionalDistribution'];
$OutsideCA = $row['OutsideCA'];
$SpeciesInGenus = $row['SpeciesInGenus'];
$GeneraInFamily = $row['GeneraInFamily'];
$Etymology = $row['Etymology'];
$Toxicity = $row['Toxicity'];
$Synonyms = $row['Synonyms'];
$UnabridgedSynonyms = $row['UnabridgedSynonyms'];
$Note = $row['Note'];
$UnabridgedNote = $row['UnabridgedNote'];
$FloweringTime = $row['FloweringTime'];
$FloweringTimeCode = $row['FloweringTimeCode'];
$FruitingTime = $row['FruitingTime'];
$ConingTime = $row['ConingTime'];
$Weediness = $row['Weediness'];
$IsTerminalTaxon  = $row['IsTerminalTaxon'];
$RevisionNumber  = $row['RevisionNumber'];
$DistCode = $row['DistCode'];
$HasKey = $row['HasKey'];

//var_dump($row); 
/*var_dump prints the whole row in a databased format
which is useful for seeing what you're getting
but is pretty ugly
*/

}

//get previous and next info based on ID
$previousID = $ID-1;
$nextID = $ID+1;

$results = $db->query('SELECT TaxonID, ScientificName
						FROM eflora_taxa
						WHERE ID='.$previousID.'');

while ($row = $results->fetchArray()) {
	$previousTaxonID = $row['TaxonID'];
	$previousName = $row['ScientificName'];
}

$results = $db->query('SELECT TaxonID, ScientificName
						FROM eflora_taxa
						WHERE ID='.$nextID.'');

while ($row = $results->fetchArray()) {
	$nextTaxonID = $row['TaxonID'];
	$nextName = $row['ScientificName'];
}


//query and assign family info
//Note that only Family has "GeneraInFamily" and "ScientificEditor"
$results = $db->query('SELECT t.TaxonID, t.FamilyID, f.TaxonID, f.ScientificName, f.TaxonAuthor, f.CommonName, f.TJM2Author, f.ScientificEditor, f.Habit, f.PlantBody, f.Stem, f.SterileStem, f.FertileStem, f.Leaf, f.Spines, f.Inflorescence, f.StaminateHead, f.RayOrPistillateFlower, f.PistillateHead, f.StaminateInflorescence, f.PistillateOrBisexualInflorescence, f.PistillateInflorescence, f.Spikelet, f.FertileSpikelet, f.SterileSpikelet, f.DistalSpikelet, f.CentralSpikelet, f.LateralSpikelet, f.StaminateSpikelet, f.PistillateSpikelet, f.Flower, f.StaminateFlower, f.PistillateFlower, f.RayFlower, f.DiskFlower, f.Cone, f.PollenCone, f.SeedCone, f.BisexualFlower, f.Fruit, f.Seed, f.Sporangia, f.SporangiumCase, f.MaleSporangiumCase, f.FemaleSporangiumCase, f.Spores, f.Chromosomes, f.GeneraInFamily, f.Etymology, f.Toxicity, f.Synonyms, f.UnabridgedSynonyms, f.Note, f.UnabridgedNote, f.RevisionNumber, f.HasKey
						from eflora_taxonomy t, eflora_taxa f
						WHERE t.TaxonID='.$TaxonID.' AND t.FamilyID=f.TaxonID');

while ($row = $results->fetchArray()) {
	$FamTaxonID = $row['TaxonID'];
	$FamScientificName = $row['ScientificName'];
	$FamTaxonAuthor = $row['TaxonAuthor'];
	$FamCommonName = $row['CommonName'];
	$FamTJM2Author = $row['TJM2Author'];
	$FamScientificEditor = $row['ScientificEditor'];
	$FamHabit = $row['Habit'];
	$FamPlantBody = $row['PlantBody'];
	$FamStem = $row['Stem'];
	$FamSterileStem = $row['SterileStem'];
	$FamFertileStem = $row['FertileStem'];
	$FamLeaf = $row['Leaf'];
	$FamSpines = $row['Spines'];
	$FamInflorescence = $row['Inflorescence'];
	$FamStaminateHead = $row['StaminateHead'];
	$FamRayOrPistillateFlower = $row['RayOrPistillateFlower'];
	$FamPistillateHead = $row['PistillateHead'];
	$FamStaminateInflorescence = $row['StaminateInflorescence'];
	$FamPistillateOrBisexualInflorescence = $row['PistillateOrBisexualInflorescence'];
	$FamPistillateInflorescence = $row['PistillateInflorescence'];
	$FamSpikelet = $row['Spikelet'];
	$FamFertileSpikelet = $row['FertileSpikelet'];
	$FamSterileSpikelet = $row['SterileSpikelet'];
	$FamDistalSpikelet = $row['DistalSpikelet'];
	$FamCentralSpikelet = $row['CentralSpikelet'];
	$FamLateralSpikelet = $row['LateralSpikelet'];
	$FamStaminateSpikelet = $row['StaminateSpikelet'];
	$FamPistillateSpikelet = $row['PistillateSpikelet'];
	$FamFlower = $row['Flower'];
	$FamStaminateFlower = $row['StaminateFlower'];
	$FamPistillateFlower = $row['PistillateFlower'];
	$FamRayFlower = $row['RayFlower'];
	$FamDiskFlower = $row['DiskFlower'];
	$FamCone = $row['Cone'];
	$FamPollenCone = $row['PollenCone'];
	$FamSeedCone = $row['SeedCone'];
	$FamBisexualFlower = $row['BisexualFlower'];
	$FamFruit = $row['Fruit'];
	$FamSeed = $row['Seed'];
	$FamSporangia = $row['Sporangia'];
	$FamSporangiumCase = $row['SporangiumCase'];
	$FamMaleSporangiumCase = $row['MaleSporangiumCase'];
	$FamFemaleSporangiumCase = $row['FemaleSporangiumCase'];
	$FamSpores = $row['Spores'];
	$FamChromosomes = $row['Chromosomes'];
	$FamGeneraInFamily = $row['GeneraInFamily'];
	$FamEtymology = $row['Etymology'];
	$FamToxicity = $row['Toxicity'];
	$FamNote = $row['Note'];
	$FamUnabridgedNote = $row['UnabridgedNote'];
	$FamRevisionNumber  = $row['RevisionNumber'];
	$FamHasKey = $row['HasKey'];

}

//query and assign genus info
//Note that only Genus has "SpeciesInGenus"
$results = $db->query('SELECT t.TaxonID, t.GenusID, g.TaxonID, g.ScientificName, g.TaxonAuthor, g.CommonName, g.TJM2Author, g.Habit, g.PlantBody, g.Stem, g.SterileStem, g.FertileStem, g.Leaf, g.Spines, g.Inflorescence, g.StaminateHead, g.RayOrPistillateFlower, g.PistillateHead, g.StaminateInflorescence, g.PistillateOrBisexualInflorescence, g.PistillateInflorescence, g.Spikelet, g.FertileSpikelet, g.SterileSpikelet, g.DistalSpikelet, g.CentralSpikelet, g.LateralSpikelet, g.StaminateSpikelet, g.PistillateSpikelet, g.Flower, g.StaminateFlower, g.PistillateFlower, g.RayFlower, g.DiskFlower, g.Cone, g.PollenCone, g.SeedCone, g.BisexualFlower, g.Fruit, g.Seed, g.Sporangia, g.SporangiumCase, g.MaleSporangiumCase, g.FemaleSporangiumCase, g.Spores, g.Chromosomes, g.SpeciesInGenus, g.Etymology, g.Toxicity, g.Synonyms, g.UnabridgedSynonyms, g.Note, g.UnabridgedNote, g.RevisionNumber, g.HasKey
						from eflora_taxonomy t, eflora_taxa g
						WHERE t.TaxonID='.$TaxonID.' AND t.GenusID=g.TaxonID');

while ($row = $results->fetchArray()) {
	$GenTaxonID = $row['TaxonID'];
	$GenScientificName = $row['ScientificName'];
	$GenTaxonAuthor = $row['TaxonAuthor'];
	$GenCommonName = $row['CommonName'];
	$GenTJM2Author = $row['TJM2Author'];
	$GenHabit = $row['Habit'];
	$GenPlantBody = $row['PlantBody'];
	$GenStem = $row['Stem'];
	$GenSterileStem = $row['SterileStem'];
	$GenFertileStem = $row['FertileStem'];
	$GenLeaf = $row['Leaf'];
	$GenSpines = $row['Spines'];
	$GenInflorescence = $row['Inflorescence'];
	$GenStaminateHead = $row['StaminateHead'];
	$GenRayOrPistillateFlower = $row['RayOrPistillateFlower'];
	$GenPistillateHead = $row['PistillateHead'];
	$GenStaminateInflorescence = $row['StaminateInflorescence'];
	$GenPistillateOrBisexualInflorescence = $row['PistillateOrBisexualInflorescence'];
	$GenPistillateInflorescence = $row['PistillateInflorescence'];
	$GenSpikelet = $row['Spikelet'];
	$GenFertileSpikelet = $row['FertileSpikelet'];
	$GenSterileSpikelet = $row['SterileSpikelet'];
	$GenDistalSpikelet = $row['DistalSpikelet'];
	$GenCentralSpikelet = $row['CentralSpikelet'];
	$GenLateralSpikelet = $row['LateralSpikelet'];
	$GenStaminateSpikelet = $row['StaminateSpikelet'];
	$GenPistillateSpikelet = $row['PistillateSpikelet'];
	$GenFlower = $row['Flower'];
	$GenStaminateFlower = $row['StaminateFlower'];
	$GenPistillateFlower = $row['PistillateFlower'];
	$GenRayFlower = $row['RayFlower'];
	$GenDiskFlower = $row['DiskFlower'];
	$GenCone = $row['Cone'];
	$GenPollenCone = $row['PollenCone'];
	$GenSeedCone = $row['SeedCone'];
	$GenBisexualFlower = $row['BisexualFlower'];
	$GenFruit = $row['Fruit'];
	$GenSeed = $row['Seed'];
	$GenSporangia = $row['Sporangia'];
	$GenSporangiumCase = $row['SporangiumCase'];
	$GenMaleSporangiumCase = $row['MaleSporangiumCase'];
	$GenFemaleSporangiumCase = $row['FemaleSporangiumCase'];
	$GenSpores = $row['Spores'];
	$GenChromosomes = $row['Chromosomes'];
	$GenSpeciesInGenus = $row['SpeciesInGenus'];
	$GenEtymology = $row['Etymology'];
	$GenToxicity = $row['Toxicity'];
	$GenNote = $row['Note'];
	$GenUnabridgedNote = $row['UnabridgedNote'];
	$GenRevisionNumber = $row['RevisionNumber'];
	$GenHasKey = $row['HasKey'];
}

//query and assign species info
//Species has neither GeneraInFamily nor SpeciesInGenus
$results = $db->query('SELECT t.TaxonID, t.SpeciesID, s.TaxonID, s.ScientificName, s.TaxonAuthor, s.CommonName, s.TJM2Author, s.Habit, s.PlantBody, s.Stem, s.SterileStem, s.FertileStem, s.Leaf, s.Spines, s.Inflorescence, s.StaminateHead, s.RayOrPistillateFlower, s.PistillateHead, s.StaminateInflorescence, s.PistillateOrBisexualInflorescence, s.PistillateInflorescence, s.Spikelet, s.FertileSpikelet, s.SterileSpikelet, s.DistalSpikelet, s.CentralSpikelet, s.LateralSpikelet, s.StaminateSpikelet, s.PistillateSpikelet, s.Flower, s.StaminateFlower, s.PistillateFlower, s.RayFlower, s.DiskFlower, s.Cone, s.PollenCone, s.SeedCone, s.BisexualFlower, s.Fruit, s.Seed, s.Sporangia, s.SporangiumCase, s.MaleSporangiumCase, s.FemaleSporangiumCase, s.Spores, s.Chromosomes, s.Etymology, s.Toxicity, s.Synonyms, s.UnabridgedSynonyms, s.Note, s.UnabridgedNote, s.RevisionNumber
						from eflora_taxonomy t, eflora_taxa s
						WHERE t.TaxonID='.$TaxonID.' AND t.SpeciesID=s.TaxonID');

while ($row = $results->fetchArray()) {
	$SpecTaxonID = $row['TaxonID'];
	$SpecScientificName = $row['ScientificName'];
	$SpecTaxonAuthor = $row['TaxonAuthor'];
	$SpecCommonName = $row['CommonName'];
	$SpecTJM2Author = $row['TJM2Author'];
	$SpecHabit = $row['Habit'];
	$SpecPlantBody = $row['PlantBody'];
	$SpecStem = $row['Stem'];
	$SpecSterileStem = $row['SterileStem'];
	$SpecFertileStem = $row['FertileStem'];
	$SpecLeaf = $row['Leaf'];
	$SpecSpines = $row['Spines'];
	$SpecInflorescence = $row['Inflorescence'];
	$SpecStaminateHead = $row['StaminateHead'];
	$SpecRayOrPistillateFlower = $row['RayOrPistillateFlower'];
	$SpecPistillateHead = $row['PistillateHead'];
	$SpecStaminateInflorescence = $row['StaminateInflorescence'];
	$SpecPistillateOrBisexualInflorescence = $row['PistillateOrBisexualInflorescence'];
	$SpecPistillateInflorescence = $row['PistillateInflorescence'];
	$SpecSpikelet = $row['Spikelet'];
	$SpecFertileSpikelet = $row['FertileSpikelet'];
	$SpecSterileSpikelet = $row['SterileSpikelet'];
	$SpecDistalSpikelet = $row['DistalSpikelet'];
	$SpecCentralSpikelet = $row['CentralSpikelet'];
	$SpecLateralSpikelet = $row['LateralSpikelet'];
	$SpecStaminateSpikelet = $row['StaminateSpikelet'];
	$SpecPistillateSpikelet = $row['PistillateSpikelet'];
	$SpecFlower = $row['Flower'];
	$SpecStaminateFlower = $row['StaminateFlower'];
	$SpecPistillateFlower = $row['PistillateFlower'];
	$SpecRayFlower = $row['RayFlower'];
	$SpecDiskFlower = $row['DiskFlower'];
	$SpecCone = $row['Cone'];
	$SpecPollenCone = $row['PollenCone'];
	$SpecSeedCone = $row['SeedCone'];
	$SpecBisexualFlower = $row['BisexualFlower'];
	$SpecFruit = $row['Fruit'];
	$SpecSeed = $row['Seed'];
	$SpecSporangia = $row['Sporangia'];
	$SpecSporangiumCase = $row['SporangiumCase'];
	$SpecMaleSporangiumCase = $row['MaleSporangiumCase'];
	$SpecFemaleSporangiumCase = $row['FemaleSporangiumCase'];
	$SpecSpores = $row['Spores'];
	$SpecChromosomes = $row['Chromosomes'];
	$SpecEtymology = $row['Etymology'];
	$SpecToxicity = $row['Toxicity'];
	$SpecNote = $row['Note'];
	$SpecUnabridgedNote = $row['UnabridgedNote'];
	$SpecRevisionNumber  = $row['RevisionNumber'];
}

//get the illustration
$results = $db->query('SELECT FileName 
						FROM eflora_illustrations
						WHERE TaxonID='.$TaxonID.''); //16711 is the TID for Calochortus amabilis, for example

while ($row = $results->fetchArray()) {
	$IllustrationFile = $row['FileName'];
}

//assign the JM author and revision number
//JMAuthor is inherited from the next highest up. Note that "except where noted" will be inherited by terminals which might be unacceptable
if (isset($TJM2Author)){ $JMAuthor = $TJM2Author;}
	elseif (isset($SpecTJM2Author)){ $JMAuthor = $SpecTJM2Author;}
	elseif (isset($GenTJM2Author)){ $JMAuthor = $GenTJM2Author;}
	elseif (isset($FamTJM2Author)){ $JMAuthor = $FamTJM2Author;}
	else {$JMAuthor = "";}
$JMAuthor = str_replace(", except as noted", "", $JMAuthor);

//RevNumber is inherited by species or genus, but not from the family
//Because a family revision does not affect all species/genera within the family
if (isset($RevisionNumber)){ $RevNumber = $RevisionNumber;}
	elseif (isset($SpecRevisionNumber)){ $RevNumber = $SpecRevisionNumber;}
	elseif (isset($GenRevisionNumber)){ $RevNumber = $GenRevisionNumber;}
	else {$RevNumber = "";}


//Before doing anything, if the TID isn't recognized, give a plain error screen
if (!$ID){ //if TaxonID (pulled from URL) did not match a line in the database...
//	echo "<html xmlns='http://www.w3.org/1999/xhtml'>";
//	echo "Taxon not recognized TID=".$TaxonID.":  <a href='http://ucjeps.berkeley.edu/IJM.html'>Return to main search page</a>";
//	echo "</html>";
//	die();

header("Location: http://ucjeps.berkeley.edu/cgi-bin/get_cpn.pl?".$TaxonID, true, 301);
exit();

}
?>



<html xmlns="http://www.w3.org/1999/xhtml">
<?php 
// TID is passed to JS by using PHP to echo the value of $TaxonID to a JS variable TaxID 
// Apparently there are better ways to do this using AJAX
// Also, the header needs some work
?>

<head><title>Jepson Herbarium: Jepson Flora Project: Jepson eFlora: <?php echo "$ScientificName"?></title> 
<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
<link href="http://ucjeps.berkeley.edu/common/styles/dropdowns.css" rel="stylesheet" type="text/css" />
<link href="common/css/jepson_eflora.css" rel="stylesheet" type="text/css" />

<!--jquery script files-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<!-- google maps files and scripts -->
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript"> 
function initialize() {
  var myOptions = {
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }

  var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

	var TaxID = <?php echo "$TaxonID"?>;

  var kmlLayer = new google.maps.KmlLayer("http://ucjeps.berkeley.edu/jepcodes-v7.kmz", { suppressInfoWindows: true });
  kmlLayer.setMap(map);
//  var pmlLayer = new google.maps.KmlLayer("http://herbaria4.herb.berkeley.edu/interchange/coords/"+TaxID+".kml", { });
  var pmlLayer = new google.maps.KmlLayer("http://ucjeps.berkeley.edu/eflora/KMLs/"+TaxID+".kml?122", { });
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
</style>

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

<!-- jquery functions -->
<script>
//jquery ui functions that make the hidden higher taxonomy descriptions appear
$(document).ready(function(){
    $("#familylink").click(function(){
        $("#familydesc").slideToggle(500);
    });
    $("#genuslink").click(function(){
        $("#genusdesc").slideToggle(500);
    });
    $("#specieslink").click(function(){
        $("#speciesdesc").slideToggle(500);
    });
});

$(document).ready(function(){
//jquery functions that grab the column widths from the hidden table
//so they can be applied as a standard to the higher taxonomy table, which is made up of three separate tables
	var width1 = $("#check1").width() + 1; // width() function turns out to be one pixel too small, so add 1
	var width2 = $("#check2").width() + 1;
	var width3 = $("#check3").width() + 1;
	$(".column1").attr("width", width1);
	$(".column2").attr("width", width2);
	$(".column3").attr("width", width3);
});
</script>
</head>

<body onload="initialize()">
<!-- Begin banner -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/header_jeps.php'); ?>
<!-- End banner -->

<!-- Beginning of horizontal menu -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/globalnav.php'); ?> 
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
       <td><span class="pageName"><a href="http://ucjeps.berkeley.edu/eflora/">Jepson eFlora:</a> Taxon page</span>
		<br>
			<span class="pageAuthorLine">
				<a href="http://ucjeps.berkeley.edu/IJM_fam_key.html">Key to families</a>
				|
				<a href="http://ucjeps.berkeley.edu/IJM_toc.html">Table of families and genera</a>
			</span>	  
		</td>

	</tr>
</table>

<table align="center" width="100%"><tr><td>
<?php echo '<a href="eflora_display.php?tid='.$previousTaxonID.'"><IMG SRC="http://ucjeps.berkeley.edu/icons/left.gif" BORDER=2 ALT="Previous taxon"></a>'?>
</td>
<td width=90%">
<!--eFlora index-->
<?php include('common/eflora_index_bar.php'); ?>
<!--end eFlora index-->
<hr width="10%">
</td>
<td align="right">
<?php echo '<a href="eflora_display.php?tid='.$nextTaxonID.'"><IMG SRC="http://ucjeps.berkeley.edu/icons/right.gif" BORDER=2 ALT="Next taxon"></a>'?>
</td></tr>
</table>

<center><span align ='center' class='pageLargeHeading'><?php echo "{$ScientificName}"?></span></center>
<center><span align ='center' class='pageMajorHeading'><?php echo "{$CommonName}"?></span></center>
<br>


<!-- this hidden table provides the column width values (check1 through check3) which are used to assign consistent widths to the actual higher taxonomy tables-->
<div class="hidden">
	<table class='taxonomy_table'>
	<tr><td id='check1'><b>Family: <?php if(isset($FamScientificName)){ echo"{$FamScientificName}";}?></b></td><td id='check2'><a href="#">View Description</a></b></td><td id='check3'><a href='#'>Dichotomous Key</a></td></tr>
	<tr><td><b>Genus: <?php if(isset($GenScientificName)){ echo"{$GenScientificName}";}?></b></td><td><a href="#">View Description</a></b></td><td><a href='#'>Dichotomous Key</a></td></tr>
	<tr><td><b>Species: <?php if(isset($SpecScientificName)){ echo"{$SpecScientificName}";}?></b></td><td><a href="#">View Description</a></b></td><td><a href='#'>Dichotomous Key</a></td></tr>
	</table>
</div>


	
<?php
//actual higher taxonomy table
//if there is no higher taxonomy (i.e. family entries), skip this section
if (isset($FamScientificName)){
	echo '<table width=100%><tr><td width=100%>';
	echo "<div class='pageMajorHeading'><b>Higher Taxonomy</b><br></div>";
	echo "<table class='taxonomy_table'><tr><td class='column1'><b>Family: {$FamScientificName}</b></td><td class='column2'><a id='familylink'>View Description</a></b></td>";
	
	if (isset($FamHasKey)){
		echo "<td class='column3'><a href='http://ucjeps.berkeley.edu/cgi-bin/get_IJM.pl?key={$FamTaxonID}'>Dichotomous Key</a></td></tr></table>";
	}
	else{ echo "<td class='column3'>&nbsp;</td></tr></table>"; }

echo '<div id="familydesc" class="initiallyHidden">';
echo "<blockquote class='bodyText'><br>";
if ($FamCommonName){ echo "<b>Common Name:</b> {$FamCommonName}<br>";}

if ($FamHabit){ echo "<b>Habit:</b> {$FamHabit} ";}
if ($FamPlantBody){ echo "<b>Plant Body:</b> {$FamPlantBody} ";}
if ($FamStem){ echo "<b>Stem:</b> {$FamStem} ";}
if ($FamSterileStem){ echo "<b>Sterile Stem:</b> {$FamSterileStem} ";}
if ($FamFertileStem){ echo "<b>Fertile Stem:</b> {$FamFertileStem} ";}
if ($FamLeaf){ echo "<b>Leaf:</b> {$FamLeaf} ";}
if ($FamSpines){ echo "<b>Spines:</b> {$FamSpines} ";}
if ($FamInflorescence){ echo "<b>Inflorescence:</b> {$FamInflorescence} ";}
if ($FamStaminateHead){ echo "<b>Staminate Head:</b> {$FamStaminateHead} ";}
if ($FamRayOrPistillateFlower){ echo "<b>Ray Or Pistillate Flower:</b> {$FamRayOrPistillateFlower} ";}
if ($FamPistillateHead){ echo "<b>Pistillate Head:</b> {$FamPistillateHead} ";}
if ($FamStaminateInflorescence){ echo "<b>Staminate Inflorescence:</b> {$FamStaminateInflorescence} ";}
if ($FamPistillateOrBisexualInflorescence){ echo "<b>Pistillate Or Bisexual Inflorescence:</b> {$FamPistillateOrBisexualInflorescence} ";}
if ($FamPistillateInflorescence){ echo "<b>Pistillate Inflorescence:</b> {$FamPistillateInflorescence} ";}
if ($FamSpikelet){ echo "<b>Spikelet:</b> {$FamSpikelet} ";}
if ($FamFertileSpikelet){ echo "<b>Fertile Spikelet:</b> {$FamFertileSpikelet} ";}
if ($FamSterileSpikelet){ echo "<b>Sterile Spikelet:</b> {$FamSterileSpikelet} ";}
if ($FamDistalSpikelet){ echo "<b>Distal Spikelet:</b> {$FamDistalSpikelet} ";}
if ($FamCentralSpikelet){ echo "<b>Central Spikelet:</b> {$FamCentralSpikelet}";}
if ($FamLateralSpikelet){ echo "<b>Lateral Spikelet:</b> {$FamLateralSpikelet}";}
if ($FamStaminateSpikelet){ echo "<b>Staminate Spikelet:</b> {$FamStaminateSpikelet} ";}
if ($FamPistillateSpikelet){ echo "<b>Pistillate Spikelet:</b> {$FamPistillateSpikelet} ";}
if ($FamFlower){ echo "<b>Flower:</b> {$FamFlower} ";}
if ($FamStaminateFlower){ echo "<b>Staminate Flower:</b> {$FamStaminateFlower} ";}
if ($FamPistillateFlower){ echo "<b>Pistillate Flower:</b> {$FamPistillateFlower} ";}
if ($FamRayFlower){ echo "<b>Ray Flower:</b> {$FamRayFlower} ";}
if ($FamDiskFlower){ echo "<b>Disk Flower:</b> {$FamDiskFlower} ";}
if ($FamCone){ echo "<b>Cone:</b> {$FamCone} ";}
if ($FamPollenCone){ echo "<b>Pollen Cone:</b> {$FamPollenCone} ";}
if ($FamSeedCone){ echo "<b>Seed Cone:</b> {$FamSeedCone} ";}
if ($FamBisexualFlower){ echo "<b>Bisexual Flower:</b> {$FamBisexualFlower} ";}
if ($FamFruit){ echo "<b>Fruit:</b> {$FamFruit} ";}
if ($FamSeed){ echo "<b>Seed:</b> {$FamSeed} ";}
if ($FamSporangia){ echo "<b>Sporangia:</b> {$FamSporangia} ";}
if ($FamSporangiumCase){ echo "<b>Sporangium Case:</b> {$FamSporangiumCase} ";}
if ($FamMaleSporangiumCase){ echo "<b>Male Sporangium Case:</b> {$FamMaleSporangiumCase} ";}
if ($FamFemaleSporangiumCase){ echo "<b>Female Sporangium Case:</b> {$FamFemaleSporangiumCase} ";}
if ($FamSpores){ echo "<b>Spores:</b> {$FamSpores} ";}
if ($FamChromosomes){ echo "<b>Chromosomes:</b> {$FamChromosomes}";}
echo "<br>"; //break between morphological fields and rest of fields

if ($FamGeneraInFamily){ echo "<b>Genera In Family:</b> {$FamGeneraInFamily} ";}
if ($FamEtymology){ echo "<b>Etymology:</b> {$FamEtymology} ";}
if ($FamToxicity){ echo "<b>Toxicity:</b> {$FamToxicity} ";}
if ($FamNote){ echo "<b>Note:</b> {$FamNote} ";}
echo "<br>";

if ($FamUnabridgedNote){ echo "<font color='blue'><b>Unabridged Note:</b> {$FamUnabridgedNote}</font><br>";}
if ($FamTJM2Author){ echo "<b>eFlora Treatment Author:</b> {$FamTJM2Author}<br>";}
if ($FamScientificEditor){ echo "<b>Scientific Editor:</b> {$FamScientificEditor}<br>";}
echo "</blockquote></div>";

	if (isset($GenScientificName)){
		echo "<table class='taxonomy_table'><tr><td class='column1'><b>Genus: {$GenScientificName}</b></td><td class='column2'><a id='genuslink'>View Description</a></b></td>";
		if (isset($GenHasKey)){
			echo "<td class='column3'><a href='http://ucjeps.berkeley.edu/cgi-bin/get_IJM.pl?key={$GenTaxonID}'>Dichotomous Key</a></td></tr></table>";
		}
		else{ 
			echo "<td class='column3'>&nbsp;</td></tr></table>"; 
		}
echo '<div id="genusdesc" class="initiallyHidden">';
echo "<blockquote class='bodyText'><br>";

if ($GenCommonName){ echo "<b>Common Name:</b> {$GenCommonName}<br>";}

if ($GenHabit){ echo "<b>Habit:</b> {$GenHabit} ";}
if ($GenPlantBody){ echo "<b>Plant Body:</b> {$GenPlantBody} ";}
if ($GenStem){ echo "<b>Stem:</b> {$GenStem} ";}
if ($GenSterileStem){ echo "<b>Sterile Stem:</b> {$GenSterileStem} ";}
if ($GenFertileStem){ echo "<b>Fertile Stem:</b> {$GenFertileStem} ";}
if ($GenLeaf){ echo "<b>Leaf:</b> {$GenLeaf} ";}
if ($GenSpines){ echo "<b>Spines:</b> {$GenSpines} ";}
if ($GenInflorescence){ echo "<b>Inflorescence:</b> {$GenInflorescence} ";}
if ($GenStaminateHead){ echo "<b>Staminate Head:</b> {$GenStaminateHead} ";}
if ($GenRayOrPistillateFlower){ echo "<b>Ray Or Pistillate Flower:</b> {$GenRayOrPistillateFlower} ";}
if ($GenPistillateHead){ echo "<b>Pistillate Head:</b> {$GenPistillateHead} ";}
if ($GenStaminateInflorescence){ echo "<b>Staminate Inflorescence:</b> {$GenStaminateInflorescence} ";}
if ($GenPistillateOrBisexualInflorescence){ echo "<b>Pistillate Or Bisexual Inflorescence:</b> {$GenPistillateOrBisexualInflorescence} ";}
if ($GenPistillateInflorescence){ echo "<b>Pistillate Inflorescence:</b> {$GenPistillateInflorescence} ";}
if ($GenSpikelet){ echo "<b>Spikelet:</b> {$GenSpikelet} ";}
if ($GenFertileSpikelet){ echo "<b>Fertile Spikelet:</b> {$GenFertileSpikelet} ";}
if ($GenSterileSpikelet){ echo "<b>Sterile Spikelet:</b> {$GenSterileSpikelet} ";}
if ($GenDistalSpikelet){ echo "<b>Distal Spikelet:</b> {$GenDistalSpikelet} ";}
if ($GenCentralSpikelet){ echo "<b>Central Spikelet:</b> {$GenCentralSpikelet}";}
if ($GenLateralSpikelet){ echo "<b>Lateral Spikelet:</b> {$GenLateralSpikelet}";}
if ($GenStaminateSpikelet){ echo "<b>Staminate Spikelet:</b> {$GenStaminateSpikelet} ";}
if ($GenPistillateSpikelet){ echo "<b>Pistillate Spikelet:</b> {$GenPistillateSpikelet} ";}
if ($GenFlower){ echo "<b>Flower:</b> {$GenFlower} ";}
if ($GenStaminateFlower){ echo "<b>Staminate Flower:</b> {$GenStaminateFlower} ";}
if ($GenPistillateFlower){ echo "<b>Pistillate Flower:</b> {$GenPistillateFlower} ";}
if ($GenRayFlower){ echo "<b>Ray Flower:</b> {$GenRayFlower} ";}
if ($GenDiskFlower){ echo "<b>Disk Flower:</b> {$GenDiskFlower} ";}
if ($GenCone){ echo "<b>Cone:</b> {$GenCone} ";}
if ($GenPollenCone){ echo "<b>Pollen Cone:</b> {$GenPollenCone} ";}
if ($GenSeedCone){ echo "<b>Seed Cone:</b> {$GenSeedCone} ";}
if ($GenBisexualFlower){ echo "<b>Bisexual Flower:</b> {$GenBisexualFlower} ";}
if ($GenFruit){ echo "<b>Fruit:</b> {$GenFruit} ";}
if ($GenSeed){ echo "<b>Seed:</b> {$GenSeed} ";}
if ($GenSporangia){ echo "<b>Sporangia:</b> {$GenSporangia} ";}
if ($GenSporangiumCase){ echo "<b>Sporangium Case:</b> {$GenSporangiumCase} ";}
if ($GenMaleSporangiumCase){ echo "<b>Male Sporangium Case:</b> {$GenMaleSporangiumCase} ";}
if ($GenFemaleSporangiumCase){ echo "<b>Female Sporangium Case:</b> {$GenFemaleSporangiumCase} ";}
if ($GenSpores){ echo "<b>Spores:</b> {$GenSpores} ";}
if ($GenChromosomes){ echo "<b>Chromosomes:</b> {$GenChromosomes}";}
echo "<br>"; //break between morphological fields and rest of fields

if ($GenSpeciesInGenus){ echo "<b>Species In Genus:</b> {$GenSpeciesInGenus} ";}
if ($GenEtymology){ echo "<b>Etymology:</b> {$GenEtymology} ";}
if ($GenToxicity){ echo "<b>Toxicity:</b> {$GenToxicity} ";}
if ($GenNote){ echo "<b>Note:</b> {$GenNote} ";}
echo "<br>";

if ($GenUnabridgedNote){ echo "<font color='blue'><b>Unabridged Note:</b> {$GenUnabridgedNote}</font><br>";}
if ($GenTJM2Author){ echo "<b>eFlora Treatment Author:</b> {$GenTJM2Author}<br>";}
echo "</div>";
	
	}
	
	if (isset($SpecScientificName)){ 
		echo "<table class='taxonomy_table'><tr><td class='column1'><b>Species: {$SpecScientificName}</b></td><td class='column2'><a id='specieslink'>View Description</a></b></td><td class='column3'>&nbsp;</td></tr></table>";
		echo '<div id="speciesdesc" class="initiallyHidden">';
echo "<blockquote class='bodyText'><br>";

if ($SpecCommonName){ echo "<b>Common Name:</b> {$SpecCommonName}<br>";}
if ($SpecHabit){ echo "<b>Habit:</b> {$SpecHabit} ";}
if ($SpecPlantBody){ echo "<b>Plant Body:</b> {$SpecPlantBody} ";}
if ($SpecStem){ echo "<b>Stem:</b> {$SpecStem} ";}
if ($SpecSterileStem){ echo "<b>Sterile Stem:</b> {$SpecSterileStem} ";}
if ($SpecFertileStem){ echo "<b>Fertile Stem:</b> {$SpecFertileStem} ";}
if ($SpecLeaf){ echo "<b>Leaf:</b> {$SpecLeaf} ";}
if ($SpecSpines){ echo "<b>Spines:</b> {$SpecSpines} ";}
if ($SpecInflorescence){ echo "<b>Inflorescence:</b> {$SpecInflorescence} ";}
if ($SpecStaminateHead){ echo "<b>Staminate Head:</b> {$SpecStaminateHead} ";}
if ($SpecRayOrPistillateFlower){ echo "<b>Ray Or Pistillate Flower:</b> {$SpecRayOrPistillateFlower} ";}
if ($SpecPistillateHead){ echo "<b>Pistillate Head:</b> {$SpecPistillateHead} ";}
if ($SpecStaminateInflorescence){ echo "<b>Staminate Inflorescence:</b> {$SpecStaminateInflorescence} ";}
if ($SpecPistillateOrBisexualInflorescence){ echo "<b>Pistillate Or Bisexual Inflorescence:</b> {$SpecPistillateOrBisexualInflorescence} ";}
if ($SpecPistillateInflorescence){ echo "<b>Pistillate Inflorescence:</b> {$SpecPistillateInflorescence} ";}
if ($SpecSpikelet){ echo "<b>Spikelet:</b> {$SpecSpikelet} ";}
if ($SpecFertileSpikelet){ echo "<b>Fertile Spikelet:</b> {$SpecFertileSpikelet} ";}
if ($SpecSterileSpikelet){ echo "<b>Sterile Spikelet:</b> {$SpecSterileSpikelet} ";}
if ($SpecDistalSpikelet){ echo "<b>Distal Spikelet:</b> {$SpecDistalSpikelet} ";}
if ($SpecCentralSpikelet){ echo "<b>Central Spikelet:</b> {$SpecCentralSpikelet}";}
if ($SpecLateralSpikelet){ echo "<b>Lateral Spikelet:</b> {$SpecLateralSpikelet}";}
if ($SpecStaminateSpikelet){ echo "<b>Staminate Spikelet:</b> {$SpecStaminateSpikelet} ";}
if ($SpecPistillateSpikelet){ echo "<b>Pistillate Spikelet:</b> {$SpecPistillateSpikelet} ";}
if ($SpecFlower){ echo "<b>Flower:</b> {$SpecFlower} ";}
if ($SpecStaminateFlower){ echo "<b>Staminate Flower:</b> {$SpecStaminateFlower} ";}
if ($SpecPistillateFlower){ echo "<b>Pistillate Flower:</b> {$SpecPistillateFlower} ";}
if ($SpecRayFlower){ echo "<b>Ray Flower:</b> {$SpecRayFlower} ";}
if ($SpecDiskFlower){ echo "<b>Disk Flower:</b> {$SpecDiskFlower} ";}
if ($SpecCone){ echo "<b>Cone:</b> {$SpecCone} ";}
if ($SpecPollenCone){ echo "<b>Pollen Cone:</b> {$SpecPollenCone} ";}
if ($SpecSeedCone){ echo "<b>Seed Cone:</b> {$SpecSeedCone} ";}
if ($SpecBisexualFlower){ echo "<b>Bisexual Flower:</b> {$SpecBisexualFlower} ";}
if ($SpecFruit){ echo "<b>Fruit:</b> {$SpecFruit} ";}
if ($SpecSeed){ echo "<b>Seed:</b> {$SpecSeed} ";}
if ($SpecSporangia){ echo "<b>Sporangia:</b> {$SpecSporangia} ";}
if ($SpecSporangiumCase){ echo "<b>Sporangium Case:</b> {$SpecSporangiumCase} ";}
if ($SpecMaleSporangiumCase){ echo "<b>Male Sporangium Case:</b> {$SpecMaleSporangiumCase} ";}
if ($SpecFemaleSporangiumCase){ echo "<b>Female Sporangium Case:</b> {$SpecFemaleSporangiumCase} ";}
if ($SpecSpores){ echo "<b>Spores:</b> {$SpecSpores} ";}
if ($SpecChromosomes){ echo "<b>Chromosomes:</b> {$SpecChromosomes}";}
echo "<br>"; //break between morphological fields and rest of fields

if ($SpecSpeciesInGenus){ echo "<b>Species In Genus:</b> {$SpecSpeciesInGenus} ";}
if ($SpecGeneraInFamily){ echo "<b>Genera In Family:</b> {$SpecGeneraInFamily} ";}
if ($SpecEtymology){ echo "<b>Etymology:</b> {$SpecEtymology} ";}
if ($SpecToxicity){ echo "<b>Toxicity:</b> {$SpecToxicity} ";}
if ($SpecNote){ echo "<b>Note:</b> {$SpecNote} ";}
echo "<br>";

if ($SpecUnabridgedNote){ echo "<font color='blue'><b>Unabridged Note:</b> {$SpecUnabridgedNote}</font><br>";}
if ($SpecJMAuthor){ echo "<b>eFlora Treatment Author:</b> {$SpecJMAuthor}<br>";}
echo "</div>";
	}
	echo "<br>";
echo '</table></tr></td>';
}



//if illustration exists, there are two table cells, else there is one
if (isset($IllustrationFile)){
	echo '<table width="100%"><tr><td width="60%" valign="top">';
}
else {
	echo '<table width="100%"><tr><td width="100%" valign="top">';
}


//then finally, print the focal taxonID block
echo "<div class='pageMajorHeading'><b>{$FormattedDisplayName}</b><br></div>";
echo "<div class='bodyText'>";
if ($NativeStatus){ echo "<b>{$NativeStatus}</b><br>";}

if ($Habit){ echo "<b>Habit:</b> {$Habit} ";}
if ($PlantBody){ echo "<b>Plant Body:</b> {$PlantBody} ";}
if ($Stem){ echo "<b>Stem:</b> {$Stem} ";}
if ($SterileStem){ echo "<b>Sterile Stem:</b> {$SterileStem} ";}
if ($FertileStem){ echo "<b>Fertile Stem:</b> {$FertileStem} ";}
if ($Leaf){ echo "<b>Leaf:</b> {$Leaf} ";}
if ($Spines){ echo "<b>Spines:</b> {$Spines} ";}
if ($Inflorescence){ echo "<b>Inflorescence:</b> {$Inflorescence} ";}
if ($StaminateHead){ echo "<b>Staminate Head:</b> {$StaminateHead} ";}
if ($RayOrPistillateFlower){ echo "<b>Ray Or Pistillate Flower:</b> {$RayOrPistillateFlower} ";}
if ($PistillateHead){ echo "<b>Pistillate Head:</b> {$PistillateHead} ";}
if ($StaminateInflorescence){ echo "<b>Staminate Inflorescence:</b> {$StaminateInflorescence} ";}
if ($PistillateOrBisexualInflorescence){ echo "<b>Pistillate Or Bisexual Inflorescence:</b> {$PistillateOrBisexualInflorescence} ";}
if ($PistillateInflorescence){ echo "<b>Pistillate Inflorescence:</b> {$PistillateInflorescence} ";}
if ($Spikelet){ echo "<b>Spikelet:</b> {$Spikelet} ";}
if ($FertileSpikelet){ echo "<b>Fertile Spikelet:</b> {$FertileSpikelet} ";}
if ($SterileSpikelet){ echo "<b>Sterile Spikelet:</b> {$SterileSpikelet} ";}
if ($DistalSpikelet){ echo "<b>Distal Spikelet:</b> {$DistalSpikelet} ";}
if ($CentralSpikelet){ echo "<b>Central Spikelet:</b> {$CentralSpikelet}";}
if ($LateralSpikelet){ echo "<b>Lateral Spikelet:</b> {$LateralSpikelet}";}
if ($StaminateSpikelet){ echo "<b>Staminate Spikelet:</b> {$StaminateSpikelet} ";}
if ($PistillateSpikelet){ echo "<b>Pistillate Spikelet:</b> {$PistillateSpikelet} ";}
if ($Flower){ echo "<b>Flower:</b> {$Flower} ";}
if ($StaminateFlower){ echo "<b>Staminate Flower:</b> {$StaminateFlower} ";}
if ($PistillateFlower){ echo "<b>Pistillate Flower:</b> {$PistillateFlower} ";}
if ($RayFlower){ echo "<b>Ray Flower:</b> {$RayFlower} ";}
if ($DiskFlower){ echo "<b>Disk Flower:</b> {$DiskFlower} ";}
if ($Cone){ echo "<b>Cone:</b> {$Cone} ";}
if ($PollenCone){ echo "<b>Pollen Cone:</b> {$PollenCone} ";}
if ($SeedCone){ echo "<b>Seed Cone:</b> {$SeedCone} ";}
if ($BisexualFlower){ echo "<b>Bisexual Flower:</b> {$BisexualFlower} ";}
if ($Fruit){ echo "<b>Fruit:</b> {$Fruit} ";}
if ($Seed){ echo "<b>Seed:</b> {$Seed} ";}
if ($Sporangia){ echo "<b>Sporangia:</b> {$Sporangia} ";}
if ($SporangiumCase){ echo "<b>Sporangium Case:</b> {$SporangiumCase} ";}
if ($MaleSporangiumCase){ echo "<b>Male Sporangium Case:</b> {$MaleSporangiumCase} ";}
if ($FemaleSporangiumCase){ echo "<b>Female Sporangium Case:</b> {$FemaleSporangiumCase} ";}
if ($Spores){ echo "<b>Spores:</b> {$Spores} ";}
if ($Chromosomes){ echo "<b>Chromosomes:</b> {$Chromosomes}";}
echo "<br>"; //break between morphological fields and rest of fields

if ($Ecology){ echo "<b>Ecology:</b> {$Ecology} ";}

if ($Elevation){ echo "<b>Elevation:</b> {$Elevation} ";}
if ($BioregionalDistribution){ echo "<b>Bioregional Distribution:</b> {$BioregionalDistribution} ";}
if ($OutsideCA){ echo "<b>Distribution Outside California:</b> {$OutsideCA} ";}
if ($SpeciesInGenus){ echo "<b>Species In Genus:</b> {$SpeciesInGenus} ";}
if ($GeneraInFamily){ echo "<b>Genera In Family:</b> {$GeneraInFamily} ";}
if ($Etymology){ echo "<b>Etymology:</b> {$Etymology} ";}
if ($Toxicity){ echo "<b>Toxicity:</b> {$Toxicity} ";}
if ($FloweringTime){ echo "<b>Flowering Time:</b> {$FloweringTime} ";}
if ($FruitingTime){ echo "<b>Fruiting Time:</b> {$FruitingTime} ";}
if ($ConingTime){ echo "<b>Coning Time:</b> {$ConingTime} ";}
if ($Note){ echo "<b>Note:</b> {$Note} ";}
echo "<br>";

if ($Synonyms){ echo "<b>Synonyms:</b> {$Synonyms}<br>";}
if ($UnabridgedSynonyms){ echo "<b>Unabridged Synonyms:</b> {$UnabridgedSynonyms}<br>";}
if ($UnabridgedNote){ echo "<font color='blue'><b>Unabridged Note:</b> {$UnabridgedNote}</font><br>";}
if ($JMAuthor){ echo "<b>eFlora Treatment Author:</b> {$JMAuthor}<br>";}
if ($ScientificEditor){ echo "<b>Scientific Editor:</b> {$ScientificEditor}<br>";}
echo '<a href="http://ucjeps.berkeley.edu/cgi-bin/get_cpn.pl?'.$TaxonID.'"><b>Jepson Online Interchange</b></a><br>';
if (isset($HasKey)){ echo "<b><a href='http://ucjeps.berkeley.edu/cgi-bin/get_IJM.pl?key=".$TaxonID."'>Key to <i>".$ScientificName."</i></a></b></br>"; }
if (strpos($Weediness, 'SYMBOL 1') !== false){ echo "<a href='http://www.cdfa.ca.gov/plant/ipc/weedinfo/winfo_table-sciname.html'><b>Noxious Weed</b></a><br>";}
elseif (strpos($Weediness, 'SYMBOL 2') !== false){ echo "<a href='http://www.cal-ipc.org/paf/'><b>Weed listed by Cal-IPC</b></a> <br>";}
if ($RarityStatus){ 
	if (strpos($RarityStatus, '+') !== false){ echo '<a href="http://www.rareplants.cnps.org/result.html?fulldata='.$RarityStatus.'"><b>Listed on CNPS Rare Plant Inventory</b></a><br>';}
	else { echo '<a href="http://www.rareplants.cnps.org/detail/'.$RarityStatus.'.html"><b>Listed on CNPS Rare Plant Inventory</b></a><br>';}
}


//get and print list of taxa within the genus (if a species or infra), or list of species within genus (if a genus)
if (isset($GenTaxonID)) { //i.e. if the rank is lower than genus
echo '<P><FORM>';
echo '<SELECT WIDTH=20 onChange="JumpToIt(this)">';
echo '<OPTION VALUE="None">List of species';

$results = $db->query('SELECT a.TaxonID as TaxonID, a.ScientificName as ScientificName, b.TaxonID, b.GenusID as GenusID
						FROM eflora_taxa a
						INNER JOIN eflora_taxonomy b on a.TaxonID = b.TaxonID
						WHERE GenusID='.$GenTaxonID.''); //$GenTaxonID for focal taxon determined in an earlier query
	while ($row = $results->fetchArray()) {
		if ($row['TaxonID']){
			echo ' <OPTION VALUE="eflora_display.php?tid='.$row['TaxonID'].'">'.$row['ScientificName'];
		}

	}
echo '</SELECT></FORM>';
}

elseif (isset($FamTaxonID)) { //i.e. if the rank is otherwise lower than family, and therefore at rank genus
echo '<P><FORM>';
echo '<SELECT WIDTH=20 onChange="JumpToIt(this)">';
echo '<OPTION VALUE="None">List of species';
$results = $db->query('SELECT a.TaxonID as TaxonID, a.ScientificName as ScientificName, b.TaxonID, b.GenusID as GenusID
						FROM eflora_taxa a
						INNER JOIN eflora_taxonomy b on a.TaxonID = b.TaxonID
						WHERE GenusID='.$TaxonID.''); //$in this case, the $TaxonID is the ID for a genus
	while ($row = $results->fetchArray()) {
		if ($row['TaxonID']){
			echo ' <OPTION VALUE="eflora_display.php?tid='.$row['TaxonID'].'">'.$row['ScientificName'];
		}

	}
echo '</SELECT></FORM>';	
}
else {
	echo '<br>';
}


if (isset ($previousTaxonID)) { //i.e. always, except for the very first page
	echo '<a href="eflora_display.php?tid='.$previousTaxonID.'">Previous taxon: '.$previousName.'</a><br>';
}
if (isset ($nextTaxonID)) { //i.e. always, except for the very last page
	echo '<a href="eflora_display.php?tid='.$nextTaxonID.'">Next taxon: '.$nextName.'</a><br>';
}
?>

<?php //Search box, which probably needs some flavour and/or relocation ?>
<br>
<form action="search_eflora.php" method="POST">
<b>Name Search </b>		<input type="text" id="query_text" name="query"></input>
		<input type="submit" value="Submit Name" />
</form>

<?php

echo "</td>";

//add second cell for illustration, if one is available
if (isset($IllustrationFile)) {
	echo '<td valign="top">';
	echo '<center><img src="http://ucjeps.berkeley.edu/images/illustrations/'.$IllustrationFile.'" alt="botanical illustration including '.$ScientificName.'" height="475" border="0" align="center"/></center>';
	echo '</td>';
}
?>
</tr>
</table>




<table width="100%">
<tr>
<td width="100%" valign="top">



<P>
<a href="&#109;&#97;&#105;&#108;to:interchange&#064;lists.berkeley.edu?subject=new eFlora comment"><font size=3 color="red">Contact/Feedback</font></a>


<?php //citation lines ?>

<P class=bodyText>
<?php echo "Citation for this treatment: ".$JMAuthor." ".date ("Y").". <i>".$ScientificName."</i>, ";
	  echo "in Jepson Flora Project (eds.) <em>Jepson eFlora</em>, ";
	  	if ($RevNumber){ echo $RevNumber.", ";}
	  echo "http://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=".$TaxonID.", accessed on "?> <?php echo date ("F d, Y") ?>.
</P>
<P class=bodyText>Citation for the whole project: Jepson Flora Project (eds.) <?php echo date ("Y")?>. <em>Jepson eFlora</em>,  http://ucjeps.berkeley.edu/eflora/, accessed on <?php echo date ("F d, Y")?>.</P>


<?php
//for family treatments, photos and distribution pages are excluded
//so exit out at this point
if (is_null ($FamTaxonID)){
	include('common/eflora_footer.php');
 	exit();
 }
?>

<?php


//for genus treatments, distribution and image pages are now excluded, they use to be displayed
// Too many cultivated random images are showing non-california species on Genus pages
//so exit out at this point
if (is_null ($GenTaxonID)){
	include('common/eflora_footer.php');
 	exit();
 }
?>

<hr width=80%> 

<?php //photos from CalPhotos.
require "$config_path"."calphotos_database_connection.php";

$cp_ssp_name = str_replace(" subsp. ", " ssp. ", $ScientificName); //CalPhotos uses "ssp." and not "subsp."


$result = mysqli_query($mysqli, "SELECT taxon, kwid, copyright FROM img 
WHERE genre = 'Plant' 
AND photographer IN ('Vernon Smith', 'Aaron E. Sims', 'Aaron Schusteff', 'Barry Breckling', 'Barry Rice', 'Carol W. Witham', 'Christopher Christie', 'Dana York', 'Dr. David A. Charlet', 'David Graber', 'Dean Kelch', 'Dieter Wilken', 'Gary A. Monroe', 'George W. Hartwell', 'Gerald and Buff Corsi', 'Harlan Lewis', 'Janell Hillman', 'James M. Andre', 'James Morefield', 'John Game', 'Julie Kierstead Nelson', 'Keir Morse', 'Larry Blakely', 'Lech Naumovich', 'Len Lindstrand III', 'Michael Charters', 'Michael G. Simpson', 'Neal Kramer', 'Bob Patterson', 'Robert E. Preston, Ph.D.', 'Roxanne Bittman', 'Ryan O\'Dell', 'Steve Matson', 'Steve Schoenig', 'Thomas M. Elder, M.D.', 'Thomas Stoughton', 'Toni Corelli', 'Tony Morosco', 'Dylan Neubauer')
AND taxon LIKE '$cp_ssp_name%' 
AND taxon NOT LIKE 'Echinopsis%'
ORDER BY RAND() LIMIT 6;");

//CalPhotos has specimens of the south American Cactus genus Echinopsis which the code above cannot distinguish from Echinops (asteraceae) at the genus level.
//pcitures of the cactus are displaying on the genus page for Echinops
//NOT LIKE line added to eliminate specimens of this genus from genus pages in the eFlora
//AND state = '267588'
//AND state LIKE 'CA'
//AND captivity = '0'
 if (!$result) {
    die("<p>Error in executing the CalPhotos query : " .
        mysql_error() . "</p>");
  }

echo "<table>";
echo "<tr>";
while ($row = mysqli_fetch_array($result))	{
	$raw_taxon = $row['taxon'];
	$taxon = str_replace(" ssp. ", " subsp. ", $raw_taxon);
	$kwid = $row['kwid'];
	$copyright = $row['copyright'];
	$enlarge = str_replace(" ", "+", $kwid); //full image links in format 0000+1111+2222+3333
	$kwidarray = explode(" ",$kwid);
	$kwid4thumb = "{$kwidarray[0]}_{$kwidarray[1]}/{$kwidarray[2]}/{$kwidarray[3]}"; //thumbnail links in format 0000_1111/2222/3333
	
	echo "<td width='200px'><i>{$taxon}</i><br>";
	echo '<a href="http://calphotos.berkeley.edu/cgi/img_query?query_src=ucjeps&enlarge='.$enlarge.'"><img border="0" src=http://calphotos.berkeley.edu/imgs/128x192/'.$kwid4thumb.'.jpeg alt="click for enlargement"></img></a><br>';
	echo "&copy; {$copyright}<br>";
	echo '</td>';	
}

echo "</tr></table>";
if (isset($kwid)){ //if there is no $kwid (i.e. no photos), do not print the "see more" link or the extra divider
	$cp_search_name = str_replace(" ", "+", $cp_ssp_name);
	echo '<p><a href="http://calphotos.berkeley.edu/cgi/img_query?query_src=ucjeps&where-genre=Plant&where-taxon='.$cp_ssp_name.'&title_tag='.$ScientificName.'">More photos of <i>'.$ScientificName.'</i> in CalPhotos</a></p>';
	echo "<hr width=80%>";
}
?>

<!--distribution panes-->
<table border=0>
<tr><td valign='bottom'>Geographic subdivisions for <?php echo "$ScientificName"?>:
<br><?php echo "$BioregionalDistribution"?>
</td>
<td>Markers link to CCH specimen records. Yellow markers indicate records that may provide evidence for eFlora range revision or may have georeferencing or identification issues. Purple markers indicate specimens collected from a garden, greenhouse, or other non-wild location.
<br><b><a href="http://ucjeps.berkeley.edu/consortium/about_yellow.html">READ ABOUT YELLOW FLAGS</a></b>
</td></tr>
<tr>
<td valign="top">
<?php echo '<img src="http://ucjeps.berkeley.edu/cgi-bin/new_jmap.pl?'.$DistCode.'" border="0" alt="map of distribution 1">' ?>
</td>
<td>
	<div id="map_canvas"></div>
</td>
</tr>

<tr><td valign="top">
(Note: any qualifiers in the taxon distribution description, such as 'northern', 'southern', 'adjacent' etc., are not reflected in the map above, and in some cases indication of a taxon in a subdivision is based on a single collection or author-verified occurence).
<br><br>
<?php echo '<a href="http://ucjeps.berkeley.edu/cgi-bin/map_cch_elev.pl?taxon_name='.$ScientificName.'&t=&g=">View elevation by latitude chart</a>'?>
</td>
<td valign="top">Data provided by the participants of the Consortium of California Herbaria.
<br>
<?php echo '<a href="http://ucjeps.berkeley.edu/cgi-bin/get_consort.pl?taxon_name='.$ScientificName.'">View all CCH records</a>'?>

<br><br>
CCH collections by month<br> 

<?php
//a.k.a. "heath bars"
//infra rank must be removed for the heath bar script
$hb_name = str_replace(" subsp.", "", $ScientificName);
$hb_name = str_replace(" var.", "", $hb_name);
//the hb2 script takes the flowering time as input, e.g. "&FT=3,4,5" for Mar-May. This is pre-loaded in the FloweringTimeCode field
if (isset($FloweringTimeCode)){
	echo '<img border=1 src="http://ucjeps.berkeley.edu/cgi-bin/hb2.pl?name='.$hb_name.'&FT='.$FloweringTimeCode.'">';
}	
else {
	echo '<img border=1 src="http://ucjeps.berkeley.edu/cgi-bin/hb2.pl?name='.$hb_name.'&FT=">';
}	
?>

<br>Duplicates counted once; synonyms included.
<br>Species do not include records of infraspecific taxa.
<br>Blue line denotes eFlora flowering time.

</td></tr>
</table>

<!--Begin footer-->
<?php include('common/eflora_footer.php'); ?>
<!--End footer-->
