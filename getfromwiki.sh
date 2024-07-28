#!/usr/bin/bash
LINK=$(echo $1 | $HOME/wspa2zhfiction/decodeURI)
TEXT=$(echo $LINK | sed 's#.*/\([^/]*\)#\1#').txt
$HOME/wspa2zhfiction/getbwsk.js $LINK > $TEXT
vim $TEXT
rm -rf 'C:'*
