#!/bin/sh
JAVA_CMD="java -cp target/playerbot-transfer-utils-0.0.1-SNAPSHOT-with-dependencies.jar org.playerbot.ai.Main"
JAVA_OPTS=""
CMDLINE_PARAMS="-mode update -config src/main/resources/config.xml"
#CMDLINE_PARAMS="-mode replace -config src/main/resources/config.xml"
CMDLINE="$JAVA_CMD $JAVA_OPTS $CMDLINE_PARAMS"

cd playerbot-utils/transfer

$CMDLINE -source r2_Eversong -destination r2_Wetlands -name Cali -name Eleya -name Siri -name Alaine -name Aelas
#$CMDLINE -source r2_Eversong -destination r2_Wetlands -name Aelas

echo "Done. Press ENTER"
read
