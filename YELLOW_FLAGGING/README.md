# Yellow Flag Scripts

## Detailed List of Files and Notes

### alter_nomsyn_hcodes.pl

- Jepson Manual First Edition version of the script.
- Does not convert the eflora text file distribution string.
- Convert names to the `taxon_id`.
- Stores the names and the HCODE strings in the hash file `nomsyn_hcode_hash`.
- Script remained unchanged from 2008 until early 2013.
- Superseded by `alter_hcode.pl` around 2013.

### bioreg_plus_hcode.pl
- Jepson Manual First Edition version of the script.
- Seems to have been superseded by `alter_nomsyn_hcodes.pl`.
- An output of the eflora names and the distribution string from the eflora text file was added to the DATA section.
- Converted the string as is into a formatted bioregion hcode.

### get_all_dist.pl

This reads the eFlora treatment file, storing bioregions against taxon IDs. 
Species containing infras are given the sum of included infras. 
Synonyms are assigned the range of the accepted name. 

#### April 2012 Version, written by Dick Moe

Extracts the Distribution string from the eflora_treatments.txt file. 
Outputs the data to the screen for copying to a file for the next step of yellow-flag processing.

- Does not convert the string to a hexadecimal or expanded presence/absence code.
- Does not use the module `flatten.pm`.
- Does not appear to convert names to the `taxon_id`, although the code is present to do so.
- Does not label the distribution string as the variable, HCODE.

Input files:

`name_to_code.hash`

`tnoan.out`

Output to screen:

`$name_for_hc\t$cal_dist\t$extra_cal_dist\n`

`$name_for_hc` = taxon name, no authors, from the `eflora_treatments`

`$cal_dist` = California distribution, raw data from `eflora_treatments`, no conversion

`$extra_cal_dist` = distribution outside California, raw data from `eflora_treatments`, no conversion

#### March 2013 Version, written by Dick Moe

- Now converts the string to a hexadecimal or expanded presence/absence code.
- Uses the module `flatten.pm`.
- Convert names to the `taxon_id`.
- The output was added to the end of the `alter_hcode.pl` and `alter_nomsyn_hcode.pl` to create various hcode hash files used by othe processing scripts
- The bioregion.hode output file had at least 6 updates.  Only the last version (bioregion.hcode6) of this script was recovered in the archives.
- The exact `get_all_dist.pl` script that created bioregion.hcode6 was not saved to the archive, the 2013 version is an intermediate version that David was in the middle of modifying
- This script opens the CCH hash database CDL_DBM, looks for all the species in fields[0] and assigns biocodes to the names
- Apparently under development at this stage, "do some map thing" is not explained if the HCODE string is found for a name.

Input files:

`CDL_nomsyn` = hash file of taxon_id's and nomenclatural synonyms, created by CCH bulkloader

`tax_syns_to_check` = file of taxonomic synonyms from the ICPN

`smasch_taxon_ids.txt` = table of taxon_id's and taxon names

`region_table.txt` = table of california bioregions, for conversion of distribution string to hexadecimal and expanded presence/absence code

Outputs to file: `bioregion.hcode6'

#### 2014 Version, modified by David Baxter

- Continues to convert the string to a hexadecimal or expanded presence/absence code.
- Uses the module `flatten.pm`.
- Convert names to the `taxon_id`.
- Useage of the term `HCODE` or `hcode` replaced with `dist_string`
- bioregion.hcode6 superseded by `tid_dist_string.out`
- Output no longer to the end of the `alter_hcode.pl` and `alter_nomsyn_hcode.pl` to create various hcode hash files used by othe processing scripts
- The CDL_DBM section is commented out and appears further development was stopped

Input files:

`CDL_nomsyn` = hash file of taxon_id's and nomenclatural synonyms, created by CCH bulkloader

`tax_syns_to_check` = file of taxonomic synonyms from the ICPN

`smasch_taxon_ids.txt` = table of taxon_id's to taxon names

`region_table.txt` = table of california bioregions, for conversion of distribution string to hexadecimal and expanded presence/absence code

Outputs to file: `tid_dist_string.out'


#### 2015 Version, modified by David Baxter

- Continues to convert the string to a hexadecimal or expanded presence/absence code.
- Uses the module `flatten.pm`.
- Convert names to the `taxon_id`.
- Comments out usage of `smasch_taxon_ids.txt` and uses the hash file `name_to_code`
- revises the the nativity status from If-then statements to perl 's/' replace strings
- adds a new section that exludes synonyms with an indication of misapplication or other synonym qualifier
- removes the data section at the end that converts the `dist_string` into a hex code

Input files:

`CDL_nomsyn` = hash file of taxon_id's and nomenclatural synonyms, created by CCH bulkloader

`tax_syns_to_check` = file of taxonomic synonyms from the ICPN

`name_to_code` = hash table of names to taxon_id's

`region_table.txt` = table of california bioregions, for conversion of distribution string to hexadecimal and expanded presence/absence code

Outputs to file: `tid_dist_string.out'

#### 2016 Version, modified by Jason Alexander

- Continues to convert the string to a hexadecimal or expanded presence/absence code.
- Uses the module `flatten.pm`.
- Convert names to the `taxon_id`.
- Uses the hash file `name_to_code` and the hash file `CDL_TID_TO_NAME`
- Replaces the old strip name function with the revised, and expanded strip name function from CCH.pm

Input files:

`CDL_nomsyn` = hash file of taxon_id's and nomenclatural synonyms, created by CCH bulkloader

`tax_syns_to_check` = file of taxonomic synonyms from the ICPN

`name_to_code` = hash table of names to taxon_id's

`CDL_TID_TO_NAME` = hash table of taxon_id's to taxon names

`region_table.txt` = table of california bioregions, for conversion of distribution string to hexadecimal and expanded presence/absence code

Outputs to file: `tid_dist_string.out'


### get_all_dist_local.pl

- Modernizes the code to add names and synonyms across all databases, not just CCH.
- re-adds some code comparing and printing to screen how old the eflora SQLite database is compared to the eflora treatments file.  
This was coded by David and added to some of the previous verions of `get_all_dist.pl`.
- added some additional perl replace lines above the misapplied synonym section to correct some long-standing errors
- removes the `strip_name` function at the end of the file and uses `strip_name` from the `CCH.pm` module instead
- prints hcode output to 5 different versions of the tid/taxon anme/hcode file
	*this was done to accomodate the needs of other scripts that no longer had updated text or hash files.
	*the way these 5 were originally created by Dick Moe has been lost and David never attempted to recreate them

Input files:

`CDL_nomsyn` = hash file of taxon_id's and nomenclatural synonyms, created by CCH bulkloader

`ICPN_tax_syns_list.txt` = file of taxonomic synonyms from the ICPN

`EFLORA_tax_syns_list.txt` = file of taxonomic synonyms from the eFlora

`tax_syns_to_check` = file of taxonomic synonyms not in ICPN or eFlora

`smasch_taxon_ids_CCH.txt` = text file of taxon id's to taxon names, pared down to just those used in ICPN, CCH, and eflora.
Full file is `smasch_taxon_ids.txt`

`name_to_code` = hash table of names to taxon_id's

`CDL_TID_TO_NAME` = hash table of taxon_id's to taxon names

`eflora_treatments.txt`

`eflora.db`

`region_table.txt` = table of california bioregions, for conversion of distribution string to hexadecimal and expanded presence/absence code

Output files: `cumulative_synonym_file.txt` = text file of all the synonyms processed by the above files, for reference and error checking purposes

`nomsyn_HCODE_cch_out.txt` = tab file of all names plus synonyms versus the hcode of the accepted name in the eFlora

`tid_HCODE_cch_out.txt` = tab file of the `taxon_id` versus the hcode of all the synonyms and accepted names in above table

`tid_DIST_STRING_cch_out.txt`	= tab file of the `taxon_id` versus the full text distribution string for all taxa in the eflora

`tnoan_DIST_STRING_out.txt`	= tab file of the taxon name (no authors) versus the full text distribution string for all taxa in the eflora


### get_all_dist_annie.pl

- Same as `get_all_dist_local.pl`, but has the directory structure for Annie.  
This is for running the script during yellow flag creation after updating the CCH
- Outputs the print lines of the code to a file for uploading to BIM to document changes and look for errors after each CCH and eflora refresh


### region_table.txt

- Text file, tab delimited
- field[0] = List of all the California bioregion codes
- field[1] = X,Y pixel coordinate for each of the regions to fill in on the `gd1.gif` pixel boundary-line map of California
- field[2] = color code to apply for each whitespace region on `gd1.gif` map
- field[3] = full name of the bioregion
- field[4] = full name of the province the bioregion is within
- gd1.gif map superseded in late 2015 by `gd1_2015.gif` map, changed to revise the KR - CaRF boundary
- David Baxter's version of `gd1_2015.gif` was corrupted sometime in 2016, when the line turned a shade of grey instead of black
	* the lines must be black (0,0,0) for the yellow flagging script to detect points that fall on black lines so it can reposition them to colored pixels
- `gd1_2015.gif` superseded by `gd1_2015_black.gif` in Jan 2017 after the lines were converted to black (0,0,0) in Photoshop.
- additional rows added in 2017 to fill in whitespace after the map was further edited to eliminate white pixel block present due to conversion from the original KML map


# Yellow Flag Archived Notes

## The Yellow Flagging System by Dick Moe (circa 2012)

here is how the yellow flags get assigned.

Conceptually there is a map colored according to bioregions.
Records are associated with regions corresponding to the
color of the map where their coordinates place them.
If the region associated with a record does not correspond to 
a region assigned to the taxon of the record, the record is yellow flagged.


The map is a GIF image 7600 pixels tall made from
the KML file of the regions. Each ultimate region is separately
colored and everything outside California has a common color.

The map is reprojected (longitude modified) as it is drawn,
and the same projection is used for record-coordinates placed on the map.


The `GD_lib` module is used to construct the map out of the KML polygons.
This is the base map.

Each taxon in the eFlora is associated with the string of ultimate
bioregions inferred from the distribution statement. Non-minimal-rank
taxa are given the sum of the distributions of their included MRT.

The coordinates of each record are plotted out on the base map with the color of the pixel of the coordinates detected and converted to the pertinent bioregion. 
If the color is black, the coordinates are on a line, and an attempt is made to move off the line.

There is an intermediate file constructed that consists of all records with coordinates
in this form:
`Accession_id    taxon_id      region_of_record      Allowable_regions_for_taxon`


All records where the region of record  is not found in the allowable regions
have their `accession_ids` assigned to a yellow list, unless the ids are found on an exception list

When the CCH display is refreshed, the yellow list is remade, and after the list is
remade, each record in the database that is on the list has a flag set in its final field

Here are some problems with the process:
Since the pixel-density is not high
(each pixel is about .003 sq. mi; the north to south dimension of a pixel is about 165 meter) the ratio of border to
content is high as the regions become small (as in the desert mountains).

Some of the smallest pieces of regions were not colored, so records falling there will never be
yellowed because they won't be assigned to a region.

Records falling outside california won't be yellowed because the coastal layer doesn't
fit the coastline perfectly and to avoid having spurious yellow records along the beaches,
I have to live with obviously erroneous records well offshore.

I used this method
1. because I can understand it
2. because it is quite fast (2 or 3  minutes compared with hours when I tried a real GIS solution)
3. because it can be run without additional software (but that additional software would no doubt speed up a real GIS solution)

## Notes on The Yellow Flagging System by David Baxter (circa 2015)

### (David Baxter's December 2015 Notes on his modification of Dick Moe's original scripts)

Heath bars:
The script that generates the heath bar script `make_heath_bars.pl` needs to be automated.

Right now:
- the live `hb2.pl` script lives on annie (i.e. `ucjeps.berkeley.edu` cgi-bin)
- The files used to regenerate the script include `CDL_nomsyn` and `CDL_taxsyn`. 

These files are not generated on my computer, afaik. 
They are on herbaria4 under `/Users/richardmoe/4_CDL_BUFFER/buffer/stats/`, however `CDLnomsyn` was last updated Mar 2014 and `CDLtaxsyn` on Dec 2011, so I don't know how they are updated. 
However, these syn files are also in `ucjeps_data`. `CDLnomsyn` was updated Apr 27 2015 (a month ago, owner = rlmoe) but taxsyn has the same 2011 date, so something is updating the file on there.

So, I need to figure out what is updating those files, and if there's any way to update the taxsyns. 
From there, I need to decide where hb2 will be regenerated (either on my machine or on the server), make sure the required files are also in that place, then automate. 
It uses those files but also uses the smasch_taxon_ids.txt file, which normally only lives on my machine

My current (i.e. what I did in Dec 2013) junky solution was to just copy all the required files into one directory and run it there. I currently have this in davidbaxter/DATA/Requests/heath_bars/

Ultimately: would it make sense to have the script pull directly from a CCH database instead of pre-rendering?


