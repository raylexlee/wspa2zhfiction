#!/usr/bin/env bash
for TXT in $(tree -f | grep 魔獸 | awk '{print $4;}' | grep "[0-9].txt")
do
#sed '/×××/ d' < $TXT > t
sed -e '/\*\*\*/ d' -e '/×××/ d'  < $TXT > t
mv t $TXT
done
