#!/usr/bin/bash
LINK=$(echo $1 | $HOME/wspa2zhfiction/decodeURI)
TITLE=$(echo $LINK | sed 's#.*/\([^/]*\)#\1#')
TEXT=$TITLE.txt
$HOME/wspa2zhfiction/getbwsk.js $LINK > raylex.txt
rm -rf 'C:'*
FIRST=$(grep $TITLE raylex.txt | head -1)
LEAD=$(echo $FIRST | sed 's/\(.*'"$TITLE"'\).*/\1/')
sed -e '1,/^'"$LEAD"'/ d' -e '/^/,$ d'
