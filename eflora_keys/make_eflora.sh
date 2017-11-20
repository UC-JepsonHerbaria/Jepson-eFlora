echo "making indexes from treatments"
perl index_full.pl
perl make_IJM_index.pl
echo "making hashes from treatments"
perl format_for_i.pl
echo "making key hashes from treatments"
perl format_family_key.pl > all_family_key.html
perl make_family_group_keys.pl
echo "making search word list"
perl make_search_word_list.pl
echo "making name table"
perl get_TJM2_names.pl | perl tabbify_names.pl
echo "making stats table"
perl get_summary_stats.pl > IJM_stats.html

