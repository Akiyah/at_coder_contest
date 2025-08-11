javascript:(function(){
  const task = location.pathname.split('/').pop();
  const [contest, rank] = task.split('_');

  const samples = JSON.parse(localStorage.getItem('at_coder_samples')) || {};
  if (!samples[contest]) { samples[contest] = {}; }
  if (!samples[contest][rank]) { samples[contest][rank] = {}; }

  const elements = document.querySelectorAll('.lang-ja [id^="pre-sample"]');
  elements.forEach((el, index) => {
    const content = el.innerText;
    const n = Math.floor(index / 2) + 1;
    const ext = index % 2 == 0 ? 'in' : 'out';
    if (!samples[contest][rank][n]) { samples[contest][rank][n] = {}; }
    samples[contest][rank][n][ext] = content;
  });
  localStorage.setItem('at_coder_samples', JSON.stringify(samples));
})();
