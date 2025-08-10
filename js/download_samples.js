javascript:(function(){
  // class="lang-ja" 内にあって、idが "pre-sample" で始まる要素だけ取得
  const elements = document.querySelectorAll('.lang-ja [id^="pre-sample"]');

  // URLの末尾のパス部分を取得
  var prefix = location.pathname.split('/').filter(Boolean).pop() || 'prefix';

  elements.forEach((el, index) => {
    const content = el.innerText + '\n'; // 中身を取得 (タグも含めるなら innerHTML に変更)

    // Blob を生成
    const blob = new Blob([content], { type: 'text/plain' });
    const url = URL.createObjectURL(blob);

    const ext = index % 2 == 0 ? 'in' : 'out';
    const n = Math.floor(index / 2) + 1;
    const filename = `${prefix}_${n}.${ext}`;

    // ダウンロードリンクを作成
    const a = document.createElement('a');
    a.href = url;
    a.download = filename;

    // Safari対策として一時的にDOMに追加してクリック
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);

    // URLを解放
    URL.revokeObjectURL(url);
  });
})();