#!/usr/bin/env node
const fs = require('fs');
const Booklist = require('./lib/getZhtts.js')();
const booklistIds = Object.keys(Booklist);
const pairs = booklistIds.map( e => 
  Booklist[e].map(b => `${e} ${b}`).join('\n')
  ).join('\n');
fs.writeFileSync('./pages.txt', booklistIds.join('\n'));
fs.writeFileSync('./pairs.txt', pairs);
