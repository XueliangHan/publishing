#!/bin/bash

COMMENT=$1
URL="git@github.com:XueliangHan/publishing.git"

git pull $URL
git add .
git commit -m "$COMMENT"
git push $URL
