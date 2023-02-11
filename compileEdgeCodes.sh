#!/usr/bin/env bash
for i in $(cat langs.txt) 
do  
CODE=$(egrep ^$i\\s codes.txt) 
if [ -z "$CODE" ]; then
echo $i
else
echo $CODE
fi
done > edgeCodes.txt
