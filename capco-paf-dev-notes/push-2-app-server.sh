#!/bin/bash

LOCAL_APP_FILE=paf-app-0.0.1-SNAPSHOT.jar
REMOTE_APP_FILE=uwork-0.0.1-SNAPSHOT.jar

BGN_TIME=$(date)
echo "beginning at " $BGN_TIME
echo

APP_FILE=../../../build/libs/$LOCAL_APP_FILE
FTP_SCRIPT=put-files.txt

> $FTP_SCRIPT
echo "cd paf-2"      >> $FTP_SCRIPT
echo "put $APP_FILE" >> $FTP_SCRIPT
echo "quit"          >> $FTP_SCRIPT

#psftp LC5285430@paf-server.com -b $FTP_SCRIPT
sftp -b $FTP_SCRIPT LC5285430@paf-server.com 

rm $FTP_SCRIPT

CMD_FILE=refresh-app.txt
> $CMD_FILE
echo "docker cp paf-2/$LOCAL_APP_FILE paf-app-2:/opt/paf/$REMOTE_APP_FILE" >> $CMD_FILE
echo "docker stop paf-app-2" >> $CMD_FILE
echo "docker start paf-app-2" >> $CMD_FILE

#plink LC5285430@paf-server.com -m $CMD_FILE
ssh LC5285430@paf-server.com 'bash -s' < $CMD_FILE

rm $CMD_FILE

echo
echo "bgn at " $BGN_TIME
echo "end at " $(date)
