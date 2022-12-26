#!/usr/bin/env node
/* Modified by Raylex Lee on 3 September 2022
   Purpose : Split ###.txt into ###.1, ###.2, ###.3, ..., each of which < 7500 chinese characters
   Usage : node split_dog9chapter.js ###.txt
*/
const fs = require('fs');
const prefix = process.argv[2].split('.')[0];
const Sentences = fs.readFileSync(process.argv[2], {encoding:'utf8', flag:'r'}).split('。');
const max = 7500;
let start = 0;
let p = 0;
let i ,n;
do { 
p++;
n = Sentences[start].length;
i = 1;
while (( n < max) && ( (start + i) < Sentences.length)) {
  n += Sentences[start + i].length;
  i++;
}
const filename = ((start === 0) && ((start + i) === Sentences.length)) ? `${prefix}__` : `${prefix}_${p}`; 
fs.writeFileSync(filename, Sentences.slice(start, start + i).join('。\n')+'。');
start += i;
} while (start < Sentences.length);
