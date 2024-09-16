#!/usr/bin/env bash
PARENT=$HOME/wspa2zhfiction
for BOOK in $(awk '{print $2;}' < $PARENT/public/pairs.txt)
do
  SRC=$PARENT/public/text/$BOOK
  DEST=$PARENT/yodu/js/$BOOK
  [ -d $DEST ] || mkdir $DEST
  cd $DEST
  $PARENT/data2js.sh $SRC/coverparameters.txt
  for i in $(awk '{print $1;}' < $SRC/coverparameters.txt)
  do
    $PARENT/data2js.sh $SRC/$i.txt
  done
done
