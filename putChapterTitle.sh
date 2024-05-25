#!/usr/bin/env bash
for FILE in $(ls [0-9]*)
do
  NUMBER=$(echo $FILE | tr -d .xt)
  TITLE=$(grep ^$NUMBER coverparameters.txt | sed 's#^[0-9]*\s\(.*\)#\1#')
  FIRSTLINE=$(head -1 $FILE)
  if [[ "$TITLE" == "$FIRSTLINE" ]]; then
    echo $NUMBER has title
  else
    echo $TITLE> t.txt
    cat $FILE >> t.txt
    mv t.txt $FILE
  fi
done
