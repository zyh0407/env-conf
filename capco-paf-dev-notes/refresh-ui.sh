#!/bin/bash

ROOT=/opt/paf
UI_JAR=$ROOT/ui.jar
APP_JAR=$ROOT/uwork-0.0.1-SNAPSHOT.jar
BKUP_JAR=$ROOT/uwork-0.0.1-SNAPSHOT.jar.bkup
cp $APP_JAR $BKUP_JAR 

cd $ROOT
rm -rf tmp
mkdir tmp
cd tmp
jar xvf $APP_JAR
cd BOOT-INF/classes/static
cp -R test ../test
rm -rf *
mv ../test .
unzip $UI_JAR

cd ../../..
jar cvfm0 $APP_JAR META-INF/MANIFEST.MF .

cd $ROOT
rm -rf tmp
