Configuration Instructions

Choose a location outside the site root directory to keep config files.
Rename config_template.php to config.php
In config.php, record your desired external path in $config_path
If for some reason the  eflora database name is changed from "eflora.db"
that change must also be recorded in config.php 

move calphotos_database_connection.php to the $config_path directory
move eflora.db to the $config_path directory

rename app_config_template.php to app_config.php
move to the $config_path directory and insert calphotos database credentials
