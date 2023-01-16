#!/usr/bin/env bash
BOOKID=${1?"missing book id eg 313,314"}
LASTCHAPTER=${2?"missing last chapter number eg 32,25"}
HAOBOOK=https://www.haobook123.com/content
for i in $(seq $LASTCHAPTER)
do
../getbwsk.js $HAOBOOK/$BOOKID/$i | sed -e '1,/東野圭吾/ d' -e '/adsbygoogle/,$ d' >  $(printf "%03d.txt" $i)
done
rm -rf 'C:'*
