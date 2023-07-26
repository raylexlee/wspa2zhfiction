#!/usr/bin/env bash
REGEX=第.*章$
CONVERTED=$1
sed 's/　　/\n　　/g' < $CONVERTED.txt > converted.txt
BOOK=$2
[ -d text ] || mkdir text
[ -d text/$BOOK ] || mkdir text/$BOOK
grep $REGEX converted.txt | nl -n rz -w 3 -s " " > text/$BOOK/coverparameters.txt 
csplit -k -n 3 converted.txt "/$REGEX/" '{9999}'
if [[ -s xx000 ]] 
then
START=0
else
rm xx000
START=1
fi
ls -l xx??? | awk '{print $9;}' | nl -n rz -w 3 -v $START -s " " | awk '{printf("mv %s 'text/$BOOK/'%s.txt\n",$2,$1);}' > raylex.sh
bash raylex.sh
cd text/$BOOK
$HOME/wspa2zhfiction/cp_dog9_text_subdir
