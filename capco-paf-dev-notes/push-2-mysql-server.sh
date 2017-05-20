#!/bin/bash

BGN_TIME=$(date)
echo "beginning at " $BGN_TIME
echo

./prepare-server-refresh-sql.sh

PAF_APP=../../..
SQL_FILE=$PAF_APP/tmp/refresh-server.sql
FTP_SCRIPT=put-files-for-db.txt

> $FTP_SCRIPT
echo "cd paf-2"      >> $FTP_SCRIPT
echo "put $SQL_FILE" >> $FTP_SCRIPT
echo "quit"          >> $FTP_SCRIPT

#psftp LC5285430@paf-server.com -b $FTP_SCRIPT
sftp -b $FTP_SCRIPT LC5285430@paf-server.com

rm $FTP_SCRIPT

CMD_FILE=refresh-db.txt
> $CMD_FILE
echo "docker cp paf-2/refresh-server.sql paf-mysql-2:/opt/paf/refresh-server.sql" >> $CMD_FILE
echo "docker exec  paf-mysql-2 bash /opt/paf/refresh-paf-db.sh" >> $CMD_FILE
#plink LC5285430@paf-server.com -m $CMD_FILE
ssh LC5285430@paf-server.com 'bash -s' < $CMD_FILE

rm $CMD_FILE

echo
echo "bgn at " $BGN_TIME
echo "end at " $(date)
