make_eflora.sh
main script

Table of families and genera: IJM_toc.html
Apparently generated and maintained separately
Suppl 1.
Dodecatheon, Chamaesyce removed;
Extriplex, Stutzia added
Cyathaceae, Sphaeropteris
Crocanthemum added; Helianthemum deleted
Condea added, Hyptis deleted
Howellanthus added



Errata files: Also maintained separately
using generate_errata.pl in the local eFlora directory

accepted_names.out
used in Retrieve names from eFlora
add to END of get_JM_name_data.pl
also add to herbaria4.herb.berkeley.edu/JM_accepted_names.txt, which is used by GGNRA (alison_forrestel@nps.gov)

name_list_for_search
add to END of search_IJM.pl

make_for_GGNRA.pl makes special request files accepted_names_with_tids.txt and GGNRA.txt
put these in Library/WebServer/Documents on herbaria4 for their pickup


IJM_fam_key.html
Key to families
Auto generated by main script

IJM_stats.html
Summary statistics
Auto generated by main script

Keys to families
IJM_key_Group*.html
Auto generated by main script

Keys to primary family groups
all_family_key.html
Auto generated by main script

IJM_sequence.txt
add to end of get.pl
This is sequence of taxon IDs in manual order
Auto generated by main script

name_to_code.hash
taxon name to taxon_ID crosswalk
Auto generated by main script

IJM.hash
Main data file keyed by taxon_id
Auto generated by main script

IJM_update_history.html
Auto generated by main script

IJM_key.hash
Main key data file keyed by taxon_id
Auto generated by main script

IJM_index_*.html
Indexes to all sci names
Auto generated by main script

install
script to copy necessary files to sandbox

format_family_key.pl
eflora_family_key.txt
make_family_group_keys.pl
README.txt
eflora_treatments.txt
index_suppl
format_for_i.pl
tabbify_names.pl
make_eflora.sh
make_IJM_index.pl
flatten.pm
check_IJM.pl
get_JM_name_data.pl
get_TJM2_names.pl
get_summary_stats.pl
index_full.pl
make_genus_lists.pl
make_search_word_list.pl
sanity.pl
unabridged_extract
exclude_unabridged.pl
treatments_plus_unabridged.txt
compare
euph.out
get_weed
get_weed.txt
round
expansion_modifications
eflora_treatments_july_hold
common_genera
bio_paren
check_author
eflora.in
eflora_fam_key.tmp