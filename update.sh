#!/bin/bash

COMMENT=$1

#Local DIR
BASE_DIR=`pwd`
J_DIR="./jekyll"
PUBLISHING_DIR="./xuelianghan.github.com"

#excute git command
push() {
    git add -A .
    git commit -m "$COMMENT"
    git push origin master
}

echo "Jekyll is generating site..."
cd $J_DIR
jekyll

echo "Uploading website..."
cd $BASE_DIR
cd $PUBLISHING_DIR
git checkout master
cd $BASE_DIR
#rm -r $PUBLISHING_DIR/*
cp -r $J_DIR/_site/* $PUBLISHING_DIR/
cd $PUBLISHING_DIR
push

echo "Uploading blog source code..."
git submodule update
cd $BASE_DIR
push

exit $?
