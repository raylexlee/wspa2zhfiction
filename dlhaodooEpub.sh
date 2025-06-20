#!/usr/bin/env bash
BOOKNAME=${1?'missing book name...'}
LINK=${2?'missing hadoo book link ...'}
BOOK=raytemp
[ -d $BOOK ] || mkdir $BOOK
cd $BOOK
rm *epub
../getinputs.js $LINK | grep DownloadEpub  | sed 's#DownloadEpub..\(.\)\(.*\)..#wget https://www.haodoo.net/PDB/\1/\2.epub#' > qming.sh
rm -rf 'C:'*
cat qming.sh
