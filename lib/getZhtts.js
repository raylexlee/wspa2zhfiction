const fs = require('fs');

module.exports = () => {
  const zhttsJSONpath = './zhtts.json';
  let Zhtts = {};
  if (fs.existsSync(zhttsJSONpath)) {
    const rawdata = fs.readFileSync(zhttsJSONpath);
    Zhtts = JSON.parse(rawdata);
  } 
  return Zhtts;
};
