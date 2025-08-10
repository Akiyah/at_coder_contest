javascript:(function(){
  const elements = document.querySelectorAll('.lang-ja [id^="pre-sample"]');
  var prefix = location.pathname.split('/').filter(Boolean).pop() || 'prefix';
  elements.forEach((el, index) => {
    const content = el.innerText + '\n';
    const blob = new Blob([content], { type: 'text/plain' });
    const url = URL.createObjectURL(blob);
    const ext = index % 2 == 0 ? 'in' : 'out';
    const n = Math.floor(index / 2) + 1;
    const filename = `${prefix}_${n}.${ext}`;
    const a = document.createElement('a');
    a.href = url;
    a.download = filename;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
  });
})();