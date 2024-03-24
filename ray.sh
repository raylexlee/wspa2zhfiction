#!/usr/bin/env bash
while read -r line
do
txt=$(echo $line | awk '{print $1;}').txt
echo $line$(head -1 < $txt)
done < coverparameters.txt
