#!/usr/bin/env bash
start_time=$SECONDS
BASEURL=https://ja.wikisource.org/wiki/Page%3ABasho_Haiku_Zenshu.djvu
for i in $(seq 215)
do
../getbwsk.js $BASEURL/$i | sed -e '1,/このページは校正済/ d' -e '/ja.wikisource/,$ d' | sed -e '/\/\*/,/.mw-parser/ d' -e '/^\ *$/ d' > $(printf "%03d.txt" $i)
done
find . -empty -exec rm '{}' \;
rm 004.txt
ls -1b [0-2]* | nl -n rz -w 3 -s " " > qming.txt 
[ -d text ] || mkdir text
awk '{printf("cp %s text/%s.txt\n",$2,$1);}' < qming.txt > raylex.sh
sh raylex.sh
awk '{print $1,$1;}' < qming.txt > text/coverparameters.txt
rm *txt
rm *sh
rm -rf 'C:'*
elapsed=$(( SECONDS - start_time ))
eval "echo Elapsed time: $(date -ud "@$elapsed" +'$((%s/3600/24)) days %H hr %M min %S sec')"
#Elapsed time: 0 days 00 hr 04 min 04 sec
#debian 11 subsystem on Windows 11 Home of Dell Vostro 3710 16GB RAM
