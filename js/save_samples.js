javascript:(function() {
  const paths = location.href.split('/');
  if (paths[2] != 'atcoder.jp' || paths[3] != 'contests') {
    return;
  }
  const contest = paths[4];
  const data = {};
  let downloaded = false;

  function downloadZipFile(rank, ranks) {
    console.log('downloadZipFile', rank, Object.keys(ranks));
    if (downloaded) { return; }

    data[rank] = ranks;
    if (Object.keys(data).length < 7) { return; }
    downloaded = true;
    console.log('downloadZipFile run');
    console.log(data);

    const script = document.createElement('script');
    script.src = 'https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js';
    script.onload = function() {
      const zip = new JSZip();
      for (let [rank, ns] of Object.entries(data)) {
        for (let [n, exts] of Object.entries(ns)) {
          for (let [ext, content] of Object.entries(exts)) {
            zip.file(contest + '/' + rank + '/test/sample-' + n + '.' + ext, content);
          }
        }
      }

      zip.generateAsync({type:"blob"}).then(function(content){
        const url = URL.createObjectURL(content);
        const a = document.createElement('a');
        a.href = url;
        a.download = `atcoder_samples_${new Date().toISOString()}.zip`;
        a.click();
        URL.revokeObjectURL(url);
      });
    };
    document.body.appendChild(script);
  }

  function request(rank, callback) {
    console.log('request', rank);
    const ranks = {};
    const req = new XMLHttpRequest();
    req.onreadystatechange = function() {
      if (req.readyState == 4) {
        if (req.status == 200) {
          const parser = new DOMParser();
          const doc = parser.parseFromString(req.responseText, 'text/html');
          const elements = doc.querySelectorAll('.lang-ja div.part section');
          elements.forEach((element, index) => {
            const h3 = element.querySelector('h3');
            const pre = element.querySelector('pre');
            const n = h3.innerText.split(' ')[1];
            if (h3.innerText.includes('入力例')) {
              if (!ranks[n]) { ranks[n] = {}; }
              ranks[n]['in'] = pre.innerText;
            }
            if (h3.innerText.includes('出力例')) {
              if (!ranks[n]) { ranks[n] = {}; }
              ranks[n]['out'] = pre.innerText;
            }
          });
          callback(rank, ranks);
        }
      }
    };
    const url = `/contests/${contest}/tasks/${contest}_${rank}`;
    req.open('GET', url, true);
    req.send(null);
  }

  let i = 0;
  ['a', 'b', 'c', 'd', 'e', 'f', 'g'].forEach((rank) => {
    setTimeout(() => {
      request(rank, downloadZipFile);
    }, 1000 * i);
    i++;
  });
})();
