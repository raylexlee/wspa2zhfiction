#!/usr/bin/env bash
BOOK=${1?'missing book name...'}
LINK=${2?'missing hadoo book link ...'}
[ -d $BOOK ] || mkdir $BOOK
cd $BOOK
../getinputs.js $LINK | grep DownloadEpub  | sed 's#DownloadEpub..\(.\)\(.*\)..#wget https://www.haodoo.net/PDB/\1/\2.epub#' > qming.sh
rm -rf 'C:'*
bash qming.sh
cp /dev/null converted.txt
for i in $(ls *epub) 
do 
  ebook-convert $i t.txt  
  sed '1,/《好讀書櫃》/ d' < t.txt >> converted.txt
done 
../prepare_coverparameters ^[第]
#../prepare_coverparameters ^[引尾第]
#../prepare_coverparameters
../mov_with
bash raylex.sh
cd ..
./mk_text_subdir $BOOK
cd $BOOK
$HOME/text2raylexdebian
#$HOME/go2hanley
