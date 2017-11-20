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
echo "making JEPS_elev.hash"
perl get_elev.pl

echo "making tar file"   
tar -c -f IJM.tar -T IJM_tar_list

#The below commented out commands are no longer used in the Baxter version of the eFlora.  

echo "making special request files"
perl make_for_GGNRA.pl

echo "moving output files to output directory"
mv IJM_stats.html outputs/
mv IJM_fam_key.html outputs/
mv IJM_key_Group1.html outputs/
mv IJM_key_Group10.html outputs/
mv IJM_key_Group11.html outputs/
mv IJM_key_Group12.html outputs/
mv IJM_key_Group13.html outputs/
mv IJM_key_Group14.html outputs/
mv IJM_key_Group15.html outputs/
mv IJM_key_Group16.html outputs/
mv IJM_key_Group17.html outputs/
mv IJM_key_Group18.html outputs/
mv IJM_key_Group19.html outputs/
mv IJM_key_Group2.html outputs/
mv IJM_key_Group20.html outputs/
mv IJM_key_Group21.html outputs/
mv IJM_key_Group22.html outputs/
mv IJM_key_Group23.html outputs/
mv IJM_key_Group24.html outputs/
mv IJM_key_Group3.html outputs/
mv IJM_key_Group4.html outputs/
mv IJM_key_Group5.html outputs/
mv IJM_key_Group6.html outputs/
mv IJM_key_Group7.html outputs/
mv IJM_key_Group8.html outputs/
mv IJM_key_Group9.html outputs/
mv IJM_index_A.html outputs/
mv IJM_index_B.html outputs/
mv IJM_index_C.html outputs/
mv IJM_index_D.html outputs/
mv IJM_index_E.html outputs/
mv IJM_index_F.html outputs/
mv IJM_index_G.html outputs/
mv IJM_index_H.html outputs/
mv IJM_index_I.html outputs/
mv IJM_index_J.html outputs/
mv IJM_index_K.html outputs/
mv IJM_index_L.html outputs/
mv IJM_index_M.html outputs/
mv IJM_index_N.html outputs/
mv IJM_index_O.html outputs/
mv IJM_index_P.html outputs/
mv IJM_index_Q.html outputs/
mv IJM_index_R.html outputs/
mv IJM_index_S.html outputs/
mv IJM_index_T.html outputs/
mv IJM_index_U.html outputs/
mv IJM_index_V.html outputs/
mv IJM_index_W.html outputs/
mv IJM_index_X.html outputs/
mv IJM_index_Y.html outputs/
mv IJM_index_Z.html outputs/

#echo "add accepted_names_with_tids.txt and GGNRA.txt to /Library/WebServer/Documents on herbaria4"
#echo "add eflora_treatments.txt to /cdl_buffer/region_gif/data_inputs on annie"
