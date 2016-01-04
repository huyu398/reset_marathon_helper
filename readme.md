# reset_marathon_helper

内xx彩さんのためにグxxブル始めるけど，リセマラ面倒くさいから半自動化する．
Nexus 9 上で動作．
他端末においては， `/dev/input/event0` や `/sdcard/` や `analyze.rb` の画面解像度などを読み替える必要あり．

## Usage
```sh
./adb shell getevent /dev/input/event0 | ruby getevent.rb > touch.sh
ruby analyze.rb touch.txt > trace.sh
./adb push trace.sh /sdcard/
./adb shell
sh /sdcard/trace.sh
```

## Ref
[getevent/sendeventでAndroid端末の操作自動化](http://techblog.qoncept.jp/?p=356)
