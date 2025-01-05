#!/usr/bin/env node
const CDP = require('chrome-remote-interface');
const chromeLauncher = require('chrome-launcher');
const fs = require('fs');

function launchChrome(headless=true) {
  const chromeParams = {
    port: 9222,
    chromeFlags: [
      '--window-size=412,732',
      '--disable-gpu',
      headless ? '--headless' : ''
    ]
  };
  if (process.platform === 'darwin') {
    chromeParams.chromePath = '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome';
  } else if (fs.existsSync('/usr/bin/microsoft-edge')) {
    chromeParams.chromePath = '/usr/bin/microsoft-edge';
  }
  return chromeLauncher.launch(chromeParams);
}


(async function() {

const chrome = await launchChrome();
const protocol = await CDP({port: 9222});

// Extract the DevTools protocol domains we need and enable them.
// See API docs: https://chromedevtools.github.io/devtools-protocol/
const {Page, Runtime} = protocol;
await Promise.all([Page.enable(), Runtime.enable()]);

Page.navigate({url: process.argv[2]});

// Wait for window.onload before doing stuff.
Page.loadEventFired(async () => {
 // const js = "document.getElementsByTagName('a')";
  const js = `
    b=document.getElementsByTagName('a').length; 
    `;
  // Evaluate the JS expression in the page.
  const res_js = await Runtime.evaluate({expression: js});
  let i;
  for (i=0; i<res_js.result.value; i++) {
    const js = `
    b=document.getElementsByTagName('a')[${i}]; 
    c=b.innerText+' '+b.href;
    `;
    const result = await Runtime.evaluate({expression: js});
    console.log(result.result.value);
  }

  protocol.close();
  chrome.kill(); // Kill Chrome.
});

})();
