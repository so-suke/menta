11章
###### 分からなかったこと
・現段階ではひとまず無さそうです。今後、学習を進めていく中で、出てくると思います。

###### 分かったこと
- プロセス・・・プログラムの実行単位。
- ジョブ・・・シェルが管理するプログラムの単位。
- プロセスとジョブの違い・・・パイプでつなげた時、コマンド一つ一つがプロセス。全体がジョブ。
- nice値・・・プロセスの優先順位。-20〜19。数値が低いほど高い。
- フォアグラウンドとバックグラウンドジョブ・・・画面に見えているのがフォア。そうでないのがバック。
  - バックグラウンドの使いみち・・・別の作業をしたい時。中断して別のことをやる時。など。
  - バック実行するには、 `&` をコマンドの後ろに付ける。または、 `Ctrl+z` からの `bg` 。
- プロセスID・・・プロセスの一意なID。 `ps` で確認できる。
- シグナル・・・プロセスに対して送信する信号。 `kill` に続けて番号を指定することで送信できる。
  - `2` は、割り込み。 `Ctrl+c` と同じ。
  - `9` は、強制終了。最終手段。あまり使用しない方が良い。
  - `15` は、終了。デフォルト番号。
  - `20` は、一時停止。 `Ctrl+z` と同じ。 `fg` や `bg` で再開できる。

  ※シェルスクリプトに `trap` を記載しておくと、シグナルの送信を無視できる。
  ただし、`SIGKILL` は `trap` 出来ない。

- `top` の利用。プロセスの状態を動的に表示。更新時間、プロセスIDの指定などが出来る。
  実行中に `k` を押すことでシグナルを送信できる。
  `pstree` はプロセスの親子関係をツリー表示できる。