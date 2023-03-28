#!/usr/bin/env node
/* Created by Raylex Lee on 23 August 2022
   Purpose : Turn entts.txt to entts.js
   Usage : node turn_entts_txt2js.js
*/
const fs = require('fs');
const AuthorBooks = fs.readFileSync('./entts.txt', {encoding:'utf8', flag:'r'}).replace(/\n+$/, "").split('\n');
const book = {};
AuthorBooks.forEach(AuthorBook => {
  const [Author, Book] = AuthorBook.split(" ");
  if (Author in book) {
    book[Author].push(Book);
  } else {  
      book[Author] = [ Book ];
    }
});
fs.writeFileSync('../raylexlee.github.io/entts/entts.js', `const book=${JSON.stringify(book)}`);


