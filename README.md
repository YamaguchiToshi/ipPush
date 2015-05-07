# ipPush
FlashAirを複数のSSIDに接続できるようにする．
固定IPに対応していないルータ用に割り振られたIPアドレスをPushOver(https://pushover.net)で通知する．

「参考」に挙げてある情報の1と2を合体させたやつ．

## Requirement

FlashAir W-03
: Luaに対応したW-03

## Usage

デジカメとかに差し込んで，
PushOverから通知が来るの待つ．

接続できなかったときは自らがホストになるので，
PCやスマホでFlashAirのSSIDに直接つないで使いましょう．

SSIDとkeyの組み合わせが平文なので，FlashAir自体の取り扱いに注意しましょう．

## Install

### `/SD_WLAN/CONFIG`の変更

    -APPMODE=4
    +LUA_RUN_SCRIPT=/SD_WLAN/ipPush.lua

### `ipPush.lua`にパラメータ追加
PushOverにユーザ登録すると`API_KEY`と`USER_KEY`が発行されるので，それをコードに書き込みます．

### `ssids.json`にSSIDを書く
登録したいSSIDとkeyをJSON形式で書いておきます．

### FlashAirにファイルを配置する
`/SD_WLAN/`に`ipPush.lua`と`ssids.json`を配置します．

## 参考
1. [FlashAirを複数の無線LANアクセスポイントに対応させる](http://database-tearoom.seesaa.net/article/416577571.html)
2. [ここにチャイムのボタンがあるじゃろ？](http://www.nicovideo.jp/watch/sm25985896)
3. [Lua機能(FlashAir Developers)](https://flashair-developers.com/ja/documents/api/lua/)
