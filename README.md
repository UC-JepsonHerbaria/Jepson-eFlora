# Jepson-eFlora

Directories:

Modules - perl module files for parsing data

eflora_database - perl scripts for conversion of the eflora text file into a sqlite3 database

YELLOW_FLAGGING - perl scripts for the Yellow Flagging System.  

These scripts modify all records in the CCH database where the region of record  is not found in the 
allowable regions.  Their accession_ids are assigned to a yellow list, unless the ids are found on an exception list, and a number is added to
the 18th field in the database (the Yellow Flag Field).