#!/usr/bin/env bash

ROOT=/opt/paf
UI_TEST_JAR=$ROOT/ui-test.jar
APP_JAR=$ROOT/uwork-0.0.1-SNAPSHOT.jar
BKUP_JAR=$ROOT/uwork-0.0.1-SNAPSHOT.jar.bkup
cp $APP_JAR $BKUP_JAR

cd $ROOT
rm -rf tmp
mkdir tmp
cd tmp
jar xvf $APP_JAR
cd BOOT-INF/classes/static
rm -rf test
mkdir test
cd test
unzip $UI_TEST_JAR
cd ..

cd ../../..
jar cvfm0 $APP_JAR META-INF/MANIFEST.MF .

cd $ROOT
rm -rf tmp
