#!/bin/bash

cd playerbot

function run_world_sql
{
	echo "Running $1..."
	mysql -uroot -p1 cmangos_world < $1
}

function run_characters_sql
{
	echo "Running $1..."
	mysql -uroot -p1 cmangos_characters < $1
	mysql -uroot -p1 cmangos_characters_19 < $1
	mysql -uroot -p1 cmangos_characters_60 < $1
	mysql -uroot -p1 cmangos_characters_70 < $1
}

function run_realm_sql
{
	echo "Running $1..."
	mysql -uroot -p1 cmangos_realm < $1
}

function run_sd2_sql
{
	echo "Running $1..."
	mysql -uroot -p1 cmangos_scripts < $1
}

cd sql
run_characters_sql characters_armory.sql
run_characters_sql characters_armory_2.sql
run_characters_sql characters_auctionhousebot.sql
run_characters_sql characters_ai_playerbot.sql
run_characters_sql characters_ai_playerbot_names.sql

cd updates/0.17
run_world_sql 12112_01_mangos_spell_template.sql
run_world_sql 12113_01_mangos_spell_template.sql
run_world_sql 12148_01_mangos_areatrigger_teleport.sql
run_world_sql 12148_02_mangos_mangos_string.sql
run_world_sql 12188_01_mangos_vehicle_accessory.sql
run_world_sql 12189_01_mangos_creature_template_spells.sql
run_world_sql 12233_01_mangos_mangos_string.sql
run_world_sql 12235_01_mangos_mangos_string.sql
run_world_sql 12258_01_mangos_mangos_string.sql
run_world_sql 12268_01_mangos_dbscripts.sql
run_world_sql 12269_01_mangos_creature_loot_template.sql
run_world_sql 12269_02_mangos_gameobject_loot_template.sql
run_world_sql 12269_03_mangos_fishing_loot_template.sql
run_world_sql 12269_04_mangos_reference_loot_template.sql
run_world_sql 12269_05_mangos_skinning_loot_template.sql
run_world_sql 12269_06_mangos_item_loot_template.sql
run_world_sql 12269_07_mangos_disenchant_loot_template.sql
run_world_sql 12269_08_mangos_milling_loot_template.sql
run_world_sql 12269_09_mangos_spell_loot_template.sql
run_world_sql 12269_10_mangos_prospecting_loot_template.sql
run_world_sql 12269_11_mangos_mail_loot_template.sql
run_world_sql 12269_12_mangos_pickpocketing_loot_template.sql
run_world_sql 12269_13_mangos_gossip_menu.sql
run_world_sql 12269_14_mangos_gossip_menu_option.sql

cd ..
run_world_sql 12278_01_mangos_creature_template.sql
run_world_sql 12279_01_mangos_creature_template.sql
run_world_sql 12338_01_mangos_character_calendar.sql
run_world_sql 12339_01_mangos_calendar.sql
run_world_sql 12344_01_mangos_command.sql
run_world_sql 12349_01_mangos_dbscripts_on_creature_death.sql
run_world_sql 12357_01_mangos_spell_script_target.sql
run_world_sql 12363_01_mangos_npc_vendor.sql
run_world_sql 12363_02_mangos_npc_vendor_template.sql

run_characters_sql 12339_01_characters_calendar_events.sql
run_characters_sql 12339_02_characters_calendar_invites.sql
cd ..

cd ../src/bindings/scriptdev2/sql
run_world_sql mangos_scriptname_clear.sql
run_world_sql mangos_scriptname_full.sql

run_sd2_sql scriptdev2_create_structure_mysql.sql
run_sd2_sql scriptdev2_script_full.sql

echo "Done. Press ENTER"
read