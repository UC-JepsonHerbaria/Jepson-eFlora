# eFlora, Interchange and CCH Modules

The modules in this directory are used to centralize certain common data parsing tasks with respect to taxon names, elevations, coordinates, collectors, and other minor tasks.
These were centralized within these modules to reduce the size of perl scripts by eliminating common repetitive processes of scripts that all imports need for these projects.

## Detailed List of Files and Notes

### flatten.pm

- This code takes the California Bioregion String from the eflora and converts them into presence-absence numerical code and hexadecimal code.
- For the most pat, the script remained unchanged from creation until 2016.
- Revisions to the script were made in late 2016 and early 2017 because it was found by Tom Rosatti that agreed-upon changes to some bioregion parsing (i.e. PR exc SnJt versus PR) were not made.

### Smasch.pm

- This is the original module created for use with the SMASCH database.
- This file was been edited from 2013-2016, removing key sections of code and adding it to CCH.pm.
- It is unclear why CCH.pm was created such that two modules are now required to do overlapping tasks.
The merge appears to be unfinished
- The last revision of this file removed overlapping tasks and now CCH.pm and SMASCH.pm do not overlap.
- Eventually SMASCH.pm will be superseded entirely by CCH.pm.

### CCH.pm

- This is the original module created for use with the first versions of the CCH database.
- This is now the combined, replacement module for use in all databases.
- Most features of Smasch.pm have been added to this module.
- New code has been added by removing repetitive code from CCH loading modules.