#!/usr/bin/env bash
#sed -e '1h;2,$H;$!d;g' -e 's/__YOUR_REGEX_GOES_HERE__...'
sed -e '1h;2,$H;$!d;g' -e 's/\([^。”]\)\n/\1/g'
