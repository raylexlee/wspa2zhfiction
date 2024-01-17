#!/usr/bin/env bash
AUTHOR=${1-金庸}
LANG=${2-zho}
BOOK=$(pwd | sed 's#.*/\([^/]*\)#\1#')
TXT=$BOOK.txt
cp /dev/null $TXT
for i in $(ls [0-9]*txt)
do
  cat $i >> $TXT
done
ebook-convert $TXT $BOOK.epub --authors $AUTHOR --language $LANG
