#!/usr/bin/env bash
CATEGORY=${1?'missing category eg mystery, martial ..'}
PAGE=${2-1}
../getlinks.js 'https://www.haodooclassic.net/?M=hd&P='"$CATEGORY"-"$PAGE" | grep ^[【《] | sed "s#.\(.*\).\s\(.*\)#./getclassichaodooEpub.sh \1 '\2'#" > "$CATEGORY""$PAGE".txt 
rm -rf 'C:'*
