#!/usr/bin/env bash
AUTHOR=${1-松本清張}
LANG=${2-zho}
BOOK=$(pwd | sed 's#.*/\([^/]*\)#\1#')
TXT=$BOOK.md
cp /dev/null $TXT
for i in $(ls [0-9]*txt) 
do 
j=$(echo $i | tr -d .tx)
echo $(grep ^$j coverparameters.txt | sed 's/^[0-9]*/####/') >> $TXT
sed 's/$/\n/' $i >> $TXT 
done
ebook-convert $TXT $BOOK.pdf --title $BOOK --authors $AUTHOR --language $LANG --level1-toc //h:h4
