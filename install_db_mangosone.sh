#!/bin/bash

cd playerbot

function run_world_sql
{
	echo "Running $1..."
	mysql -uroot -p1 mangosone_world < $1
}

function run_characters_sql
{
	echo "Running $1..."
	mysql -uroot -p1 mangosone_characters < $1
	mysql -uroot -p1 mangosone_characters_19 < $1
	mysql -uroot -p1 mangosone_characters_60 < $1
	mysql -uroot -p1 mangosone_characters_70 < $1
}

function run_realm_sql
{
	echo "Running $1..."
	mysql -uroot -p1 mangosone_realm < $1
}

function run_sd2_sql
{
	echo "Running $1..."
	mysql -uroot -p1 mangosone_scripts < $1
}

cd sql
run_characters_sql characters_armory.sql
run_characters_sql characters_armory_2.sql
run_characters_sql characters_auctionhousebot.sql
run_characters_sql characters_ai_playerbot.sql
run_characters_sql characters_ai_playerbot_names.sql

cd updates
run_world_sql s1886_12349_01_mangos_dbscripts_on_creature_death.sql
run_world_sql s1894_12364_01_mangos_spell_script_target.sql
run_world_sql s1900_12370_01_mangos_npc_vendor.sql
run_world_sql s1900_12370_02_mangos_npc_vendor_template.sql

cd ..

cd ../src/bindings/scriptdev1/sql
run_world_sql mangos_scriptname_clear.sql
run_world_sql mangos_scriptname_full.sql

run_sd2_sql scriptdev2_create_structure_mysql.sql
run_sd2_sql scriptdev2_script_full.sql

echo "Done. Press ENTER"
read