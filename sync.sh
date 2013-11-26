#!/bin/sh
JAVA_CMD="java -cp target/playerbot-transfer-utils-0.0.1-SNAPSHOT-with-dependencies.jar org.playerbot.ai.Main"
JAVA_OPTS=""
CMDLINE_PARAMS="-mode update -config src/main/resources/config.xml"
#CHARACTERS="-name Cali -name Eleya -name Siri -name Alaine -name Aelas"
CHARACTERS="-name Aelas"
CMDLINE="$JAVA_CMD $JAVA_OPTS $CMDLINE_PARAMS"

cd playerbot-utils/transfer

$CMDLINE -source r2_Eversong -destination r2_Wetlands $CHARACTERS
$CMDLINE -source r2_Wetlands -destination r2_Stranglethorn $CHARACTERS
$CMDLINE -source r2_Stranglethorn -destination r2_Tanaris $CHARACTERS
$CMDLINE -source r2_Tanaris -destination r2_Plaguelands $CHARACTERS
$CMDLINE -source r2_Plaguelands -destination r2_Outland $CHARACTERS
$CMDLINE -source r2_Outland -destination r2_Crystalsong $CHARACTERS

echo "Done. Press ENTER"
read
