#!/bin/bash
. ./dbs.sh

for db in $dbs
do
	echo "Dropping $db..."
	mysql -u$user -p$password -e "drop database $db"
	mysql -u$user -p$password -e "create database $db"
done

for db in $dbs
do
	echo "Restoring $db..."
	mysql -u$user -p$password $db < dump/$db.sql &
done

wait
