#!/usr/bin/env bash
TXT=${1?"missing path to *.txt"}
JS=$(sed 's#.*/\([^/]*\).txt#\1.js#' <<< $TXT)
echo data=\`> $JS
cat $TXT >> $JS
echo \`\;>> $JS
