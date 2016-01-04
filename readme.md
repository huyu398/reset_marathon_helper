# reset_marathon_helper

内xx彩さんのためにグxxブル始めるけど，リセマラ面倒くさいから半自動化する．

## Usage
```sh
./adb shell getevent /dev/input/event0 | ruby getevent.rb > touch.sh
ruby analyze.rb touch.txt > trace.sh
./adb push trace.sh /sdcard/
./adb shell
sh /sdcard/trace.sh
```
