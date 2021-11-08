# pot

## potとは
C#で読み込んでランタイムから実行できる `sumi` という独自言語を使用して<br>
コンソール上で動作するアプリケーションを作成しました<br>

sumi: [github](https://github.com/theta1220/sumi)

### 動作サンプル
```bash
[sumi info]:[echo]:hello octopus.
> echo hello
[sumi info]:[echo]:hello
> exit
```

## 動作環境
OS: Mac OS X 10.15.6<br>
.NET Core 3.1.0<br>

windows/ubuntuはサポートしていません<br>

## テスト方法
注意： `master` は開発中だったので
動作が確認できるブランチは `test/20211108` のみです
```bash
dotnet run
```

## ここからは蛇足
### pot, octopus, sumiの由来
* pot: タコツボ<br>
* octopus: タコ<br>
* sumi: タコスミ<br>

`octpus` というシステムを `pot` という環境の上で `sumi` を使って動作させているので、<br>
こんな名前構成になりました。

### 想定
Unity(C#)上でアセットとしてスクリプトを動的にロード。<br>
ゲームシステムを一部コンパイル不要にして動作させることで<br>
データ配布で挙動を修正できたり（AppStoreの規約的にはスクリプトをビルドインしないとNG)<br>
パフォーマンスが必要な部分とそうでない部分で、処理を分けた設計にできます。<br>
それにより sumi で書かれた部分ではビルド待ち時間がゼロになるため、<br>
開発イテレーションが向上すると考えました。<br>

というのは立て前で

本当は面白そうだから言語つくってみたいと思って作成しました。<br>
とてもおもしろかったですね。<br>
