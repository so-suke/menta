6章
###### 分かったこと
- コマンド説明
  -  `Ctrl + f` `Ctrl + b`
    それぞれ、ページの前後移動。
  -  `:number`
    number行へ移動。
  -  `nyy`
    n行ヤンク。
  -  `x`
    xコマンドで削除したものは、一時的な箱(バッファ)に入る。pで取り出せる。
  -  `u`
    undo。redoは `Ctrl + r`
  - 文字列置換
    -  `:ns/old/new` ・・・n行目の文字置換
    -  `:%s/old/new` ・・・ファイル全体の文字置換
      - gオプションで行の全ての文字置換。
      - cオプションで置換の度に確認してくれる。y=>yes, n=>no, q=>quit