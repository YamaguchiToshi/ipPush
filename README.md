# ipPush
FlashAirを複数のSSIDに接続できるようにする．
固定IPに対応していないルータ用に割り振られたIPアドレスをPushOverで通知する．

## Requirement

FlashAir W-03
: Luaに対応したW-03

## Usage

デジカメとかに差し込んで，
PushOverから通知が来るの待つ．

接続できなかったときは自らがホストになるので，
PCやスマホでFlashAirのSSIDに直接つないで使いましょう．

## Install

1. `/SD_WLAN/CONFIG`の変更

    -APPMODE=4
    
    +LUA_RUN_SCRIPT=/SD_WLAN/ipPush.lua

2. `ipPush.lua`にPushOverの`API_KEY`と`USER_KEY`を追加

3. `ssids.json`に登録したいSSIDとkeyを書く．

2. `/SD_WLAN/`に本体とSSIDが書かれたJSONファイルを置く
