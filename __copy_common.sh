#!/bin/sh
shared="libeay32.dll libmySQL.dll ACE.dll tbbmalloc.dll"
realmd="realmd.exe"
mangosd="dbghelp.dll mangosd.exe mangosscript.dll mangosscriptr2.dll tbb.dll"
	
function copyall
{
	for f in $1
	do
		cp -v -f ./$f -t $dest/$2
	done
}

function copy_realmd
{
	copyall "$realmd"
	copyall "$shared"
}

function copy_mangosd
{
	echo "--- $1 ---"
	copyall "$shared" $1
	copyall "$mangosd" $1
}

cd playerbot/bin/$config
copy_realmd
for realm in $realms
do
	copy_mangosd $realm
done

echo "Done."