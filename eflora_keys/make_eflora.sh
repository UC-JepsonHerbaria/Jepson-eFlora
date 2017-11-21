#index_full.pl, make_IJM_index.pl, used to be run at this point.  These scripts have been depreciated due to the indices being created by the SQL script

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
echo "making JEPS_elev.hash"
perl get_elev.pl

echo "making tar file"   
tar -c -f IJM.tar -T IJM_tar_list

echo "making special request files"
perl make_for_GGNRA.pl

echo "moving output files to output directory"
mv IJM_stats.html output/
mv IJM_fam_key.html output/
mv IJM_key_Group1.html output/
mv IJM_key_Group10.html output/
mv IJM_key_Group11.html output/
mv IJM_key_Group12.html output/
mv IJM_key_Group13.html output/
mv IJM_key_Group14.html output/
mv IJM_key_Group15.html output/
mv IJM_key_Group16.html output/
mv IJM_key_Group17.html output/
mv IJM_key_Group18.html output/
mv IJM_key_Group19.html output/
mv IJM_key_Group2.html output/
mv IJM_key_Group20.html output/
mv IJM_key_Group21.html output/
mv IJM_key_Group22.html output/
mv IJM_key_Group23.html output/
mv IJM_key_Group24.html output/
mv IJM_key_Group3.html output/
mv IJM_key_Group4.html output/
mv IJM_key_Group5.html output/
mv IJM_key_Group6.html output/
mv IJM_key_Group7.html output/
mv IJM_key_Group8.html output/
mv IJM_key_Group9.html output/

