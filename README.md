# Jepson-eFlora

Directories:

Modules - perl module files for parsing data

eflora_database - perl scripts for conversion of the eflora text file into a sqlite3 database

YELLOW_FLAGGING - perl scripts for the Yellow Flagging System.  

These scripts modify all records in the CCH database where the region of record  is not found in the 
allowable regions.  Their accession_ids are assigned to a yellow list, unless the ids are found on an exception list, and a number is added to
the 18th field in the database (the Yellow Flag Field).



GENERAL NOTES

How Search Works
-The search works like LIKE "Name%" instead of LIKE "%NAME%". The latter gives too much weirdness (e.g. "%Rosa%" retrieves Pinus ponderosa, Drosanthemum, Draba remorosa, Androsaceae, etc).
-Currently I have it set to sort by ScientificName, otherwise ferns and gymnosperms come out on top. This works because the genus name sorts above the lower taxa, and usually but not always the family before the genus (example exception, Rosaceae sorts below Rosa and Rosa spp.)


How taxonomy is represented
Taxonomy is handled using the data in IJM_sequence.txt. Here's an example chunk:
IJM_sequence content		What it refers to
18					Ophioglossaceae
18, 9037				Botrychium
18, 9037, 15946			Botrychium simplex
18, 9037, 15946, 55231		Botrychium simplex var. simplex
18, 9037, 15946, 55233		Botrychium simplex var. compositum

the script make_taxonomy_table.pl takes IJM_sequence.pl and parses it into INSERT statements for the eflora_taxonomy table, which represents the IJM_sequence in a rearranged form:
TID	FamTaxonID	GenTaxonID	SpecTaxonID

Then, the logic of the display page is:
If there is a $familyTID
	print all family paragraph
If there is a $genusTID
	print genus paragraph
if there is a $speciesTID
	print species paragraph
then: print focalTID paragraph



eFlora updating notes, written by Dick Moe in 2012:

Working backwards from CGI scripts

get_IJM.pl 
requires:
${data_path}IJM.hash
${data_path}IJM_key.hash
${data_path}TJM_treat_path (contains distribution codes)
${data_path}tnoan.out
IJM_sequence in DATA
links to http://herbaria4.herb.berkeley.edu/interchange/kmls/$TID.kml, http://herbaria4.herb.berkeley.edu/interchange/coords/$TID.kml, http://herbaria4.herb.berkeley.edu/cgi-bin/hb2.pl?name=$HB_name&FT=$ft, http://ucjeps.berkeley.edu/cgi-bin/draw_jmap.pl?$overlay_code, tp://ucjeps.berkeley.edu/cgi-bin/get_consort.pl?taxon_name=$NAN{$TID}, /cgi-bin/map_cch_elev.pl


search_IJM.pl
requires:
/usr/local/web/ucjeps_data/CDL_TID_TO_NAME
words_for_IJM_search.txt in DATA (like Acaena: 11687_11687 77205_77205 79220_79220)



DATA FILES
IJM.hash
taxon_id => formatted treatment
generated from format_for_i.pl
IJM_hash can be modified to incorporate glossary definitions via expand_gloss_2.pl



GENERATING SCRIPTS
format_for_i.pl
requires
eflora_treatments.txt
name_to_code.hash which stores /Users/rlmoe/data/interchange/_input/output/flat_dbm_4.txt
/Users/rlmoe/data/taxon_ids/smasch_taxon_ids.txt

make_IJM_index.pl
IN, "/Users/rlmoe/data/taxon_ids/smasch_taxon_ids.txt
IN,"index_suppl"
IN, "index_full.tmp"
OUT, ">>IJM_index_${i}.html"


eFlora database and eflora_display upgrade notes
written by David Baxter when he upgraded the webpages to php and the database to SQLlite in 2015

eFlora page to dos/unresolved things (not in any particular order):

Later on:
Quilt/Catalog pages for genera
A page like the table of families and genera, but an alphabetical list of all genera
Be able to search keys (how will this work? With Dick's current keys, since I don't load keys?)
Add synonyms from TJM1/ICPN?
Redesign front page. Specific request to "move up the search box so I don't have to scroll down"

Refactor opportunities
-Put html header into a separate PHP file
-refactor search_IJM.php and eflora_index.php to use same functions (they just use different inputs/queries. Everything else is the same).
-Other HTML refactoring? (The HTML is jenk in general)
-fix the if/while glitch in search_IJM and eflora_index.php


region_list.php
Given the code for a bioregion, this script will return a list of all accepted taxa from that bioregion. Hierarchy is supported (do we include California?)
-Options: return a plain text list that can be interfaced with/downloaded, or return html with hyperlinks
→Let's start with plain text 


Illustrations
-update illustration input file to get the currently missing names (Desktop/JepsImages/working_dir/missing_names.txt), and the infras and name changes that are unaccounted for (not_in_eflora.txt)

Photos:
Later on
-figure out a method for how we would manage our own chosen photos
>Export CalPhotos image hash to create image table? At least to start/for proof of concept?	
>>Perhaps the logic could be:
1.	Query our own table of IDs (in the sqlite database), LIMIT 6
2.	Print them out, counting the number that are printed out is some $n variable
3.	Use $n to determine the LIMIT for the CalPhotos random picks (e.g. 6-n= 6-3 = 3)
4.	Print out random ones
-Images are not displayed on family pages. This will be tricky since CalPhotos photos are not named by taxon name. Brent suggested having six photos from six different genera. These will definitely require picking, but for families is actually a pretty doable-scale job.

To-Dos that have been put off
-Expand bioregion codes to full text for displaying (not actually done but decided against?)


To-Dos tracked in PivotalTracker
-if there is no match. Needs a search box and also link to ICPN/JOI
>Taxonomy
-Make a fall-through if the input is not a valid TID?



To-Dos that have been done
-also, test if my SQLite/PHP connection actually works on darwin. May need to update php.ini if not (refer to SQLite chapter in PHP: The Good Parts)

make page work by GETting tid from URL
-include the A-Z index at the top
-Taxon name at top (without author) then again at terminal treatment w/ author
-Family and Genus paragraphs replaced with just name and common name, and a link that goes to the full description (old eFlora display)
-Terminal treatment information parsed onto separate lines as detailed by Staci's outline
→need to split up Synonyms and Unabridged Synonyms in the SQL export.
-do something with map legend, either display it directly or link to a version of the map with the legend
fix loader so that it generates ready-to-go INSERT statements
-Make illustration table that the database joins to and pulls from
-Make main display file pull from illustrations table and display appropriate image
→If no illustration, spread the text across the page
-Create if-then logic using taxonomy to handle both terminal and non-terminal taxa 
-figure out a query to pull photos meeting certain criteria from CalPhotos and display (limit by 6)
-put photos closer together so as to fit 6 across
Move photo display table into the main display php file.
-Infras with no species treatment (e.g. Pteridium aquilinum var. pubescens) aren't parsing right in the loader. They don't capitalize right due to having the authority in the name line, and also the TIDs aren't coming though. I fixed this with the strip_name subroutine
Refine CalPhotos query to include State=California (decided against for now).
→ For interest, run a query to figure out how many photos we have for each eFlora accepted name
-cut up remaining images
>>Create links for any non-terminal species (e.g. so the illustration for Clarkia amoena subsp. amoena shows up on the page for Clarkia amoena. In the case of multiple options for infra illustrations, it should show the one with the autonyms (decided against)
-Make families with alternate names load properly
-Split out Key Group numbers into a separate field. These tags that are put on the COMMON NAME line (e.g. Phacelia vallicola) or if there's no common name, the TAXON AUTHOR line (e.g. Phacelia umbrosa).
Substitutions for italics, which are indicated like _Garrya elliptica_ in the raw file
-Need a field for revision number. This is determined by whether the par has a TJM2, TJMX or TJMXX author. Display accordingly in citation
Search function, both to get to the page and put a search box on the page too
>Requested to have genus links come up in search results. I think this will happen automatically
>Add hex_dist_code getter to database so the gif maps work
Search fallthrough:  if nothing is input, i.e. if someone just navigates straight to the URL. Needs a search box.
-Add more info to search results: common name and NATIVE/NATURALIZED status
-Format illustrations for proper online resolution; add copyright
-Link taxon page to interchange?
-Determine if anything else should be added to search results (photos, illustrations, non-terminal taxa, keys for non-terminal taxa, etc.)
-How will we handle previousID/nextID? Since we are always reloading the database from scratch, we could use the primary key "ID" field for the sequence. → I think this could be done by calculating "ID+1" and "ID-1" and then querying for the TaxonID (and maybe sci-name too) for each one. This seems really ghetto but I think it will work.
-Need to atomize months for the heath bars. The phenology input format is "Apr--Jun" where the hb script needs "4,5,6"
-Link taxon page to CNPS
-Translate WEEDINESS symbol to "{Listed on Cal_IPC}" or something
-Search needs to pick up syns, and link them to the accepted name/accepted TID. This will be done with a separate synonymy table (separate from the taxonomy table)

-refactor config files



Notes About the export from eflora_treatments.txt, Written by David Baxter in 2015

The parser that converts the eflora raw file into one giant table is eflora_db_loader.pl

List of treatment fields that are exported
(is_terminal -> inferred)
(Native Status -> above name for term taxa)
(Scientific Name -> no field title since at top of paragraph)
"TAXON AUTHOR",
"COMMON NAME", (incl "UNABRIDGED COMMON NAME")
"KEY GROUP", (pulled from Common Name line)
"TJM2 AUTHOR", (replaced by "TJMX AUTHOR", if available. Sometimes there is only TJMX AUTHOR so in that case use.
"HABIT+", (concat UNABRIDGED HABIT+ if exists. None yet)
"PLANT BODY",
"STEM", (incl. STEMS)
"STERILE STEM",
"FERTILE STEM",
"LEAF", (incl. LEAVES)
"SPINES", (incl. SPINE, of which there are none)
"INFLORESCENCE",
"STAMINATE HEAD",
"RAY OR PISTILLATE FLOWER",
"PISTILLATE HEAD",
"STAMINATE INFLORESCENCE",
"PISTILLATE OR BISEXUAL INFLORESCENCE",
"PISTILLATE INFLORESCENCE",
"SPIKELET",
"FERTILE SPIKELET",
"STERILE SPIKELET",
"DISTAL SPIKELET",
"CENTRAL SPIKELET",
"LATERAL SPIKELET",
"STAMINATE SPIKELET",
"PISTILLATE SPIKELET",
"FLOWER", (or UNABRIDGED FLOWER. Treatments currently have one or the other)
"STAMINATE FLOWER",
"PISTILLATE FLOWER",
"RAY FLOWER",
"DISK FLOWER", (with UNABRIDGED DISK FLOWER appended)
"CONE", (incl. CONES, it's always one or the other)
"POLLEN CONE",
"SEED CONE",
"BISEXUAL FLOWER",
"FRUIT",
"SEED", (incl. SEEDS, it's always one or the other)
"SPORANGIA", (incl. SPORANGIUM, it's one or the other. Check on this since SPORANGIUM is unique to Isoetes)
"SPORANGIUM CASE", (Incl. SPORANGIUM CASES, even though I can see why the distinction is made)
"MALE SPORANGIUM CASE",
"FEMALE SPORANGIUM CASE",
"SPORES",
"ECOLOGY", (replaced by UNABRIDGED ECOLOGY if both available)
"RARITY STATUS",
"ELEVATION",
"BIOREGIONAL DISTRIBUTION", (replaced by UNABRIDGED BIOREGIONAL DISTRIBUTION if available)
"DISTRIBUTION OUTSIDE CALIFORNIA", (replaced by UNABRIDGED DISTRIBUTION OUTSIDE CALIFORNIA if available)
"SPECIES IN GENUS",  (replaced by UNABRIDGED SPECIES IN GENUS if available. May not use)
"GENERA IN FAMILY", (replaced by UNABRIDGED GENERA IN FAMILY if available. May not use)
"ETYMOLOGY", (replaced by UNABRIDGED ETYMOLOGY. Will include but prob will not use for species page)
"TOXICITY",
"SYNONYMS", 
"UNABRIDGED SYNONYMS",
"NOTE",
"UNABRIDGED NOTE", for now load separate from "Note"
"FLOWERING TIME",
"FRUITING TIME",
"CONING TIME",
"WEEDINESS",


One complication from using my usual line matching subroutines in the full getter is that, since you are unable to match against the beginning of a line in the paragraph matching, you cannot get "STEM:" without also getting "STERILE STEM:", "FERTILE STEM:" etc.

To circumvent this, I matched affected paragraphs like:
		if($par =~ ([\H])INFLORESCENCE: *(.*)/){
			return $2;
		}
Where \H is any non-horizontal whitespace character (i.e. not a space, which is what would be there in "PISTILLATE INFLORESCENCE:", etc.).

This appears to work, because e.g. for INFLORESCENCE the usual way retrieved 7390 lines and the above way retrieved 7296 lines.

Terms for which this is done:
STEM: STERILE STEM; FERTILE STEM
INFLORESCENCE: STAMINATE; PISTILLATE; PISTILLATE OR BISEXUAL
SPIKELET: FERTILE; STERILE; DISTAL; CENTRAL; LATERAL; STAMINATE; PISTILLATE
CONE: POLLEN; SEED
FLOWER: RAY OR PISTILLATE; STAMINATE; PISTILLATE; RAY; DISK; BISEXUAL
(also UNABRIDGED FLOWER, UNABRIDGED DISK FLOWER)

However, I'm not 100% confident in my results because I get the following results from grepping the treatments file:
grep "^INFLORESCENCE:" eflora_treatments.txt | wc  yields 7726 lines
grep "INFLORESCENCE:" eflora_treatments.txt | wc  yields 7883 lines
I'm not sure what it is but it looks like my subroutines aren't picking everything up, but in the meantime I will continue scripting the full getter and once I make a full results table I can try to figure out what the discrepancy is. 

The exporting script is eflora_db_loader.sql. The script has been completed and now runs and makes good-looking results, but I haven't 100% confirmed.

>>>> MORE PROBLEMS:  I noticed in Selaginella: Etymology, is not coming across in the parser, although the note, unabridged note and common name is. Also it thinks S. asprella is not a terminal taxon. My feeling is that the key might be messing with things



Fields that will be used for the quilt page:

	TaxonID
	ScientificName
	CommonName  
	TaxonAuthor 
	FloweringTime 
	NativeStatus 
	IsTerminalTaxon 
Genus and Family will be grabbed using the eflora_taxonomy table

