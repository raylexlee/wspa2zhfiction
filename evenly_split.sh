#!/usr/bin/env bash
MAX=6500
TXTFILE=${1?"missing filename ###.txt, eg 001.txt, 012.txt etc"}
CHAPTER=$(echo $TXTFILE | tr -d .tx)
readarray -t a < $TXTFILE
SIZE=0
for i in ${!a[@]}
do
#echo $i ${a[$i]}
SIZE=$(( $SIZE + ${#a[$i]} ))
done
let NFILES=(SIZE+MAX-1)/MAX
let NMAX=(SIZE+NFILES-1)/NFILES
#let NMAX=MAX
#echo $MAX $SIZE $NFILES $NMAX
let START=1
let j=1
SPLITNAME="$CHAPTER"_$j
if [ $NFILES -eq 1 ]; then 
SPLITNAME="$CHAPTER"__
cp $TXTFILE $SPLITNAME
exit 0
fi
let n=0
for i in ${!a[@]}
do
L=${#a[$i]}
a[$i]="${a[$i]}\n"
let FINAL=i
let n=n+L 
if [ $n -ge $NMAX ]; then
echo -e ${a[@]:$START:$FINAL} > $SPLITNAME
let j=j+1
SPLITNAME="$CHAPTER"_$j
[ $NFILES -eq 1 ] && SPLITNAME="$CHAPTER"__
let START=FINAL+1
let n=0
fi
done
if [ $START -lt ${#a[@]} ]; then
echo -e ${a[@]:$START:$FINAL} > $SPLITNAME
fi
