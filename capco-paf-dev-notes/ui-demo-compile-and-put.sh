#!/usr/bin/env bash

CUR_DIR=$(pwd)
cd ../../../..
PAF_ROOT=$(pwd)
PAF_UI_DEMO=$PAF_ROOT/paf-ui-demo
PAF_APP=$PAF_ROOT/paf-app

cd $PAF_UI_DEMO
ng build --base-href /test/ --target=production
mv dist test

mkdir -p $PAF_APP/src/main/resources/static
cd $PAF_APP/src/main/resources/static
rm -rf test

mv $PAF_UI_DEMO/test test

cd $CUR_DIR


