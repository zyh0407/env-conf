#!/usr/bin/env bash

BGN_TIME=$(date)
echo "beginning at " $BGN_TIME
echo

PAF_CORE=../../..
APP_FILE=$PAF_CORE/build/libs/ui-test.jar
FTP_SCRIPT=put-files.txt

> $FTP_SCRIPT
echo "put $APP_FILE" >> $FTP_SCRIPT
echo "quit" >> $FTP_SCRIPT

#psftp LC5285430@paf-server.com -b $FTP_SCRIPT
sftp -b $FTP_SCRIPT LC5285430@paf-server.com

rm $FTP_SCRIPT

CMD_FILE=refresh-ui-test.txt
> $CMD_FILE
echo "docker cp ui-test.jar paf-app:/opt/paf/ui-test.jar" >> $CMD_FILE
echo "docker exec paf-app bash /opt/paf/refresh-ui-test.sh" >> $CMD_FILE
echo "docker stop paf-app" >> $CMD_FILE
echo "docker start paf-app" >> $CMD_FILE

#plink LC5285430@paf-server.com -m $CMD_FILE
ssh LC5285430@paf-server.com 'bash -s' < $CMD_FILE

rm $CMD_FILE

echo
echo "bgn at " $BGN_TIME
echo "end at " $(date)
