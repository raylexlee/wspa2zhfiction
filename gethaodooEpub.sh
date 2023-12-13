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
../prepare_coverparameters ^[卷第]
../mov_with
bash raylex.sh
awk '{ print $2;}' < coverparameters.txt | awk -f ../fillSection.awk  | nl -n rz -w 3 -s " " > t
cp coverparameters.txt coverparameters.txt.original
mv t coverparameters.txt
cd ..
./mk_text_subdir $BOOK
