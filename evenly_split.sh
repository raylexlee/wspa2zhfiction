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
let N=(SIZE+MAX-1)/MAX
let max=SIZE/s

