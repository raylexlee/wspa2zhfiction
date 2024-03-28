#!/usr/bin/env node
const fs=require('fs');
let punctuationPosition=[];
let punctuationArray=[];
let positionIndex = 0;
const punctuationRegex = /[；。！？，,;.!?]/gm;
function Process(data) {
       punctuationArray = data.match(punctuationRegex);
       punctuationPosition=[];
       let punctuationIndex = 0;
       for (let valueIndex=0; valueIndex < data.length; valueIndex++) 
         if (data[valueIndex] === punctuationArray[punctuationIndex]) {
           punctuationPosition.push(valueIndex);
           punctuationIndex++;
         }
}
const data=fs.readFileSync('001.txt','utf8');
Process(data);
const width=punctuationPosition.map((e,i) => i===0 ? e : (e - punctuationPosition[i-1]))
width.forEach((e,i) => { if (e > 50) console.log(e,data.substring(punctuationPosition[i-1],punctuationPosition[i]));})   
