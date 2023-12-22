#!/usr/bin/env node
/* Modified by Raylex Lee on 3 September 2022
   Purpose : Split ###.txt into ###.1, ###.2, ###.3, ..., each of which < 6500 chinese characters
             and evenly.
   Usage : node split_dog9chapter.js ###.txt
*/
const fs = require('fs');
const prefix = process.argv[2].split('.')[0];
//const Sentences = fs.readFileSync(process.argv[2], {encoding:'utf8', flag:'r'}).split('。');
const Sentences = fs.readFileSync(process.argv[2], {encoding:'utf8', flag:'r'}).split('\n');
const max = 5700;
//const max = 7500;
const size = Sentences.map(e => e.length).reduce((a, c) => a + c);
const nFiles = Math.ceil(size / max);
//const nMax = Math.ceil(size / nFiles);
const nMax = max;
//console.log(max,' ',size,' ',nFiles,' ',nMax)
//const Digit='@ABCDEFGHIJKLMNOPQRSTUVWXYZ';
const Digit='0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
let start = 0;
let p = 0;
let i ,n;
do { 
p++;
n = Sentences[start].length;
i = 1;
while (( n < nMax) && ( (start + i) < Sentences.length)) {
  n += Sentences[start + i].length;
  i++;
}
const filename = ((start === 0) && ((start + i) === Sentences.length)) ? `${prefix}__` : `${prefix}_${Digit[p]}`; 
//fs.writeFileSync(filename, Sentences.slice(start, start + i).join('。\n')+'。');
fs.writeFileSync(filename, Sentences.slice(start, start + i).join('\n'));
start += i;
} while (start < Sentences.length);
