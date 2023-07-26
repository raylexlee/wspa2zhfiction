#!/usr/bin/env bash
printifexist () {
[ -d text/$1 ] && echo $1
}
for i in $(awk '{print $2;}' < dpairs.txt)
do
printifexist $i
done
