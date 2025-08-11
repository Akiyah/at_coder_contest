javascript:(function(){
  const script = document.createElement('script');
  script.src = 'https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js';
  script.onload = function() {
    const samples = JSON.parse(localStorage.getItem('at_coder_samples'));
    if (!samples) { return; }

    const zip = new JSZip();
    for (let [contest, ranks] of Object.entries(samples)) {
      for (let [rank, ns] of Object.entries(ranks)) {
        for (let [n, exts] of Object.entries(ns)) {
          for (let [ext, content] of Object.entries(exts)) {
            zip.file(contest + '/' + rank + '/test/sample-' + n + '.' + ext, content);
          }
        }
      }
    }

    zip.generateAsync({type:"blob"}).then(function(content){
      const url = URL.createObjectURL(content);
      const a = document.createElement('a');
      a.href = url;
      a.download = 'atcoder_samples.zip';
      a.click();
      URL.revokeObjectURL(url);
    });
  };
  document.body.appendChild(script);
})();
