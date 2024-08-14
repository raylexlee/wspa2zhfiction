#!/usr/bin/env bash
GETLINK=$HOME/wspa2zhfiction/getlinks.js
AUTHOR=${1?'missing name of author ...'}
ALLBOOKS=yodu_triples.txt
[ -f $ALLBOOKS ] || touch $ALLBOOKS
for PAGE in $(seq 1000)
do
LINK="https://tw.yodu.org/modules/article/authorarticle.php?author=""$AUTHOR""&page=""$PAGE"
BOOKS=$($GETLINK "$LINK" | grep [^.][^.].https.*for-author$)
if [ "$BOOKS" = "" ]; then
   break
else
   echo $BOOKS | sed 's#for-author #for-author\n#g' | sed '/^[^h]\{21,\}/ d' | sed 's#\([^ ]*\)\s.*book.\([0-9]*\)..for.*#'"$AUTHOR"' \1 \2#'
fi 
done >> $ALLBOOKS
$HOME/wspa2zhfiction/CleanUpLighthouseWSL.sh
