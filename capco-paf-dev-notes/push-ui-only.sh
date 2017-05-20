#!/bin/bash

BGN_TIME=$(date)
echo "beginning at " $BGN_TIME
echo

PAF_APP=../../..
APP_FILE=$PAF_APP/build/libs/ui.jar
FTP_SCRIPT=put-files.txt

> $FTP_SCRIPT
echo "cd paf-2"      >> $FTP_SCRIPT
echo "put $APP_FILE" >> $FTP_SCRIPT
echo "quit" >> $FTP_SCRIPT

#psftp LC5285430@paf-server.com -b $FTP_SCRIPT
sftp -b $FTP_SCRIPT LC5285430@paf-server.com

rm $FTP_SCRIPT

CMD_FILE=refresh-ui.txt
> $CMD_FILE
echo "docker cp paf-2/ui.jar paf-app-2:/opt/paf/ui.jar" >> $CMD_FILE
echo "docker exec paf-app-2 bash /opt/paf/refresh-ui.sh" >> $CMD_FILE
echo "docker stop paf-app-2" >> $CMD_FILE
echo "docker start paf-app-2" >> $CMD_FILE

#plink LC5285430@paf-server.com -m $CMD_FILE
ssh LC5285430@paf-server.com 'bash -s' < $CMD_FILE

rm $CMD_FILE

echo
echo "bgn at " $BGN_TIME
echo "end at " $(date)
