#!/usr/bin/env bash
if grep -qi microsoft /proc/version; then
WINUSER=$(/mnt/c/Windows/System32/whoami.exe | sed -e 's#.*\\##' -e 's#\r##')
rm -rf 'C:\Users\'"$WINUSER"'\AppData\Local\lighthouse'*
fi
