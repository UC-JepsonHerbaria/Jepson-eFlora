# Yellow Flag Scripts

The Yellow Flagging System by Dick Moe

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


The GD_lib module is used to construct the map out of the KML polygons.
This is the base map.

Each taxon in the eFlora is associated with the string of ultimate
bioregions inferred from the distribution statement. Non-minimal-rank
taxa are given the sum of the distributions of their included MRT.

The coordinates of each record are plotted out on the base map
with the color of the pixel of the coordinates detected and converted
to the pertinent bioregion. If the color is black, the coordinates are on
a line, and an attempt is made to move off the line.

There is an intermediate file constructed that consists of all records with coordinates
in this form:
Accession_id    taxon_id      region_of_record      Allowable_regions_for_taxon


All records where the region of record  is not found in the allowable regions
have their accession_ids assigned to a yellow list, unless the ids are found on an exception list

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


