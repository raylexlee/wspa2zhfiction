let data, chapterStr;
let myContent;
let nDigits = 3;
let title, chapters;
let activeEpisode;
const querystring = location.search;
const params = (querystring != '') ? (new URL(document.location)).searchParams : 'none';
if (params === 'none') window.location = 'book.html?title=阿Q正傳';
title =  params.get('title');
title = title ? title : '阿Q正傳';
document.addEventListener("DOMContentLoaded", function(event) {
  myInit();
});
const contentUrl = chapter => `js/${title}/${chapter.substring(0,nDigits)}.js`;
const coverparametersUrl = `js/${title}/coverparameters.js`;
function onloadCoverparameters(){
      chapters = data.replace(/^\n+/, "").replace(/\n+$/, "").split("\n");
      nDigits = chapters[0].indexOf(" ");      
      const chapter = getLastChapter();
      gotoChapter(chapter); 
}
function myInit() {
  myContent = document.getElementById('myContent');
  staticScript(coverparametersUrl, onloadCoverparameters);
}
function prevChapter() {
    const idx =chapters.findIndex(c => c.startsWith(activeEpisode));
    let i = idx - 1;
    i = (i === -1) ? (chapters.length - 1) : i;
    const chapter = chapters[i];
    gotoChapter(chapter);
}
function nextChapter() {
    const idx =chapters.findIndex(c => c.startsWith(activeEpisode));
    let i = idx + 1;
    i = (i === chapters.length) ? 0 : i;
    const chapter = chapters[i];
    gotoChapter(chapter);
}
function onloadChapter() {
   const headline=isHead => `<h5>
     <a href="javascript:prevChapter()" style="color:cyan;">&lArr;</a> 
     ${isHead ? chapterStr.substring(1 + nDigits).replace("_"," ") : '&nbsp'}
     <a href="javascript:nextChapter()" style="color:cyan;">&rArr;</a> 
     </h5>`;
       const paragraphs = data.replace(/^\n+/, "").replace(/\n+$/, "").split("\n");
       myContent.innerHTML = `
${headline(true)}
${paragraphs.map(e => `<p>${e}</p>`).join('\n')}
${headline(false)}
`;
}
function gotoChapter(chapter) {
   chapterStr = chapter;
   activeEpisode = chapter.substring(0,nDigits);
   localStorage.setItem('book_activeEpisode'+title, activeEpisode);
   document.title = `${title} ${chapter.substring(1 + nDigits)}`;
   dynamicScript(contentUrl(chapter), onloadChapter);
}
function getLastChapter() {
  if (!localStorage.getItem('book_activeEpisode'+title)) {
    const start_episode = chapters[0].substring(0,nDigits);
    localStorage.setItem('book_activeEpisode'+title,start_episode);
  }
  activeEpisode = localStorage.getItem('book_activeEpisode'+title);
  return chapters.find(c => c.startsWith(activeEpisode)); 
}
