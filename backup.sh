#!/bin/bash
. ./dbs.sh

for db in $dbs
do
	echo "Dumping $db..."
	mysqldump -u$user -p$password $db > dump/$db.sql
done

cd dump
7z a dump.zip -y *.sql
for db in $dbs
do
	rm $db.sql
done
