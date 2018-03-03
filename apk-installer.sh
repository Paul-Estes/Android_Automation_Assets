#!/usr/bin/fish
adb shell "busybox hwclock --systohc"
adb install TeamViewerHost12.apk
adb install base.apk
adb install smwatchdog_1_0_4.apk
adb install smbridge_1_2_1.apk
adb install smplayer_1_0_4.apk
adb shell "am startservice com.sminfinity.smwatchdog/.MainService"
