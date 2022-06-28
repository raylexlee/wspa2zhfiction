#!/usr/bin/env node
const CDP = require('chrome-remote-interface');
const chromeLauncher = require('chrome-launcher');
const fs = require('fs');

function launchChrome(headless=true) {
  const chromeParams = {};
  chromeParams['chromeFlags'] = [
      '--window-size=412,732',
      '--disable-gpu',
      headless ? '--headless' : ''
    ];
  if (fs.existsSync('/usr/bin/google-chrome')) {
    chromeParams['chromePath'] = '/usr/bin/google-chrome';
  }  
  return chromeLauncher.launch(chromeParams);
}


(async function() {

const chrome = await launchChrome();
const protocol = await CDP({port: chrome.port});

// Extract the DevTools protocol domains we need and enable them.
// See API docs: https://chromedevtools.github.io/devtools-protocol/
const {Page, Runtime} = protocol;
await Promise.all([Page.enable(), Runtime.enable()]);

Page.navigate({url: process.argv[2]});

// Wait for window.onload before doing stuff.
Page.loadEventFired(async () => {
  const js = "document.querySelector('body').textContent";
  // Evaluate the JS expression in the page.
  const result = await Runtime.evaluate({expression: js});

  console.log(result.result.value);

  protocol.close();
  chrome.kill(); // Kill Chrome.
});

})();
