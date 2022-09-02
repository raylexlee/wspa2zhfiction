#!/usr/bin/env node
/* Modified by Raylex Lee on 3 September 2022
   Purpose : Split ###.txt into ###.1, ###.2, ###.3, ..., each of which < 30000 chinese characters
   Usage : node split_dog9chapter.js ###.txt
*/
const fs = require('fs');
const prefix = process.argv[2].split('.')[0];
const Sentences = fs.readFileSync(process.argv[2], {encoding:'utf8', flag:'r'}).split('。');
const max = 27000;
let start = 0;
let n = Sentences[start].length;
let i = 0;
while (( n < max) && ( i < Sentences.length)) {
  i++;
  n += Sentences[start + i].length;
}
console.log(start,' ' ,start + i,' ', n, ' ', Sentences.length);

