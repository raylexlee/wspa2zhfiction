#!/usr/bin/env bash
LINK=${1?'missing haodoo page link ...'}
../getlinks.js $LINK | grep ^[【《] | sed "s#.\(.*\).\s\(.*\)#./gethaodooEpub.sh \1 '\2'#" 
rm -rf 'C:'*
