# Jepson-eFlora

Directories:

Modules - perl module files for parsing data

eflora_database - perl scripts for conversion of the eflora text file into a sqlite3 database

YELLOW_FLAGGING - perl scripts for the Yellow Flagging System.  

These scripts modify all records in the CCH database where the region of record  is not found in the 
allowable regions.  Their accession_ids are assigned to a yellow list, unless the ids are found on an exception list, and a number is added to
the 18th field in the database (the Yellow Flag Field).



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
