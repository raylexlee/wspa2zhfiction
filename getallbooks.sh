#!/usr/bin/env bash
GETLINK=$HOME/wspa2zhfiction/getlinks.js
AUTHOR=${1?'missing name of author ...'}
ALLBOOKS=$AUTHOR.txt
cp /dev/null raylex.sh
for PAGE in $(seq 3)
do
LINK='https://tw.yodu.org/modules/article/authorarticle.php?author='"$AUTHOR"'&page='"$PAGE"
PASS="'""$LINK""'"
echo $GETLINK $PASS >> raylex.sh
done
bash raylex.sh | grep [^.][^.].https.*for-author$ > $ALLBOOKS
rm -rf 'C:'*
