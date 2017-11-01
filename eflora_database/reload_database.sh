#echo "refresh distribution code file first"  #this is a second version of the file used by yellow flag processing, but it is different and has the same name
#perl get_all_dist.pl	#this is confusing and the two files produce different results at this time for some reason, use the output from yellow flag only here?
# a solution is to copy the output from yellow flag processing on annie to outputs, reverse of what we do with eflora_treatments.txt
echo "drop and recreate tables"
sqlite3 eflora.db < create_statements.sql
echo "refresh insert statements"
perl make_main_table.pl
perl make_illustration_table.pl
perl make_taxonomy_table.pl
perl make_distribution_table.pl
perl make_synonymy_table.pl
echo "insert taxa into main table"
sqlite3 eflora.db < outputs/load_main_table.sql
echo "insert illustration table"
sqlite3 eflora.db < outputs/load_illustration_table.sql
echo "insert taxonomy table"
sqlite3 eflora.db < outputs/load_taxonomy_table.sql
echo "insert bioregion distribution table"
sqlite3 eflora.db < outputs/load_distribution_table.sql
echo "insert synonyms into main table"
sqlite3 eflora.db < outputs/load_synonymy_table.sql
echo "create database indexes"
sqlite3 eflora.db < create_indexes.sql

#echo "cleaning up intermediate files"
#rm -v outputs/accepted_name_list.txt
#rm -v outputs/dist_codes.txt
