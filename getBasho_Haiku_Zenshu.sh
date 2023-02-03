#!/usr/bin/env bash
BASEURL=https://ja.wikisource.org/wiki/Page%3ABasho_Haiku_Zenshu.djvu
for i in $(seq 215)
do
../getbwsk.js $BASEURL/$i | sed -e '1,/このページは校正済/ d' -e '/ja.wikisource/,$ d' > $(printf "%03d.txt" $i)
done
seq 215 | nl -n rz -w 3 -s " " > coverparameters.txt
rm -rf 'C:'*
