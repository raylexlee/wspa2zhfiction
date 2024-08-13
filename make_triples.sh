#!/usr/bin/env bash
for AUTHORTXT in $(ls [东松森]*)
do
AUTHOR=$(echo $AUTHORTXT | tr -d .tx)
sed 's#\([^ ]*\)\s.*book.\([0-9]*\)..for.*#'"$AUTHOR"' \1 \2#' < $AUTHORTXT
done
