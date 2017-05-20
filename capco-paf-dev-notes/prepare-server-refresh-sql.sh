#!/usr/bin/env bash

PAF_APP=../../../
PAF_CORE=../../../../paf-core
OUT_FILE=$PAF_APP/tmp/refresh-server.sql
PAF_SQL=$PAF_APP/../paf-sql

> $OUT_FILE
cat $PAF_SQL/mysql/paf-core/paf.mysql.drop.list.group.sql >> $OUT_FILE
cat $PAF_SQL/mysql/paf-core/paf.mysql.drop.ref.table.sql >> $OUT_FILE
cat $PAF_SQL/mysql/paf-core/paf.mysql.drop.pattern.process.sql >> $OUT_FILE
cat $PAF_SQL/mysql/paf-core/paf.mysql.drop.sql >> $OUT_FILE

cat $PAF_SQL/mysql/paf-core/paf.mysql.create.sql >> $OUT_FILE
cat $PAF_SQL/mysql/paf-core/paf.mysql.create.pattern.process.sql >> $OUT_FILE
cat $PAF_SQL/mysql/paf-core/paf.mysql.create.ref.table.sql >> $OUT_FILE
cat $PAF_SQL/mysql/paf-core/paf.mysql.create.list.group.sql >> $OUT_FILE

cat $PAF_CORE/src/test/resources/mysql-db/for-integration-test.sql >> $OUT_FILE
cat $PAF_CORE/src/test/resources/mysql-db/config-mvp001-account-maintenance.sql >> $OUT_FILE

cat $PAF_SQL/mysql/paf-core/process-def-and-config-points-for_orchestration-mvp001.sql >> $OUT_FILE

cat $PAF_SQL/mysql/paf-core/account-audit-multi-item-setup.sql >> $OUT_FILE
