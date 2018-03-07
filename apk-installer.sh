#!/usr/bin/fish
read --prompt "echo 'Project Ref #: ' " -l ref
adb shell "busybox hwclock --systohc"
adb install TeamViewerHost12.apk
adb install base.apk
adb install smwatchdog_1_0_4.apk
adb install smbridge_1_2_1.apk
adb install smplayer_1_0_4.apk
adb shell "am startservice com.sminfinity.smwatchdog/.MainService"
#Begin SM Bridge initialization
#Sets Project reference from $ref (Line2) and default credentials
adb shell sleep 60
adb shell am start -a android.intent.action.VIEW -d http://localhost:8080
adb shell input keyevent KEYCODE 61
adb shell input text $ref
adb shell input keyevent KEYCODE 61
adb shell input text "admin"
adb shell input keyevent KEYCODE 61
adb shell input text "VANtageLED123"
adb shell input keyevent KEYCODE 61
adb shell input text "user"
adb shell input keyevent KEYCODE 61
adb shell input text "user"
adb shell input keyevent KEYCODE 61
adb shell input text "readonly"
adb shell input keyevent KEYCODE 61
adb shell input text "readonly"
adb shell input keyevent KEYCODE 61
adb shell input keyevent KEYCODE 66
adb shell input tap 945 615
adb shell input text "admin"
adb shell input keyevent KEYCODE 61
adb shell input text "VANtageLED123"
adb shell input keyevent KEYCODE 61
adb shell input keyevent KEYCODE 66
#Begin TeamViewer initalization & registration
#Need to note future clicks for further automation
adb shell sleep 45
adb shell am start com.teamviewer.host.market/com.teamviewer.host.ui.HostActivity
adb shell am start -a android.intent.action.VIEW -d https://get.teamviewer.com/sm-android
