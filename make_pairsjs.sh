#!/usr/bin/env bash
echo const data=\`>pairs.js
cat $1 >> pairs.js
echo \`\;>> pairs.js
