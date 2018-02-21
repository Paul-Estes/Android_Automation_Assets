echo "---- ANDROID INSTALLATION AND SETUP ----"
echo "Preparing to launch..."
timeout  3s
echo "---- ANDROID INSTALLATION AND SETUP ----"
echo "Turning on hardware timer"
adb shell busybox hwclock --systohc
timeout  2s 
echo "---- ANDROID INSTALLATION AND SETUP ----"
echo "Installing Terminal"
adb install terminal.apk
echo "---- ANDROID INSTALLATION AND SETUP ----"
echo "Installing TeamViewer"
adb install TeamViewerHost12.apk
echo "---- ANDROID INSTALLATION AND SETUP ----"
echo "Installing TeamViewer-Add-On"
adb install base.apk
echo "---- ANDROID INSTALLATION AND SETUP ----"
echo "Installing Watchdog"
adb install smwatchdog_1_0_4.apk
echo "---- ANDROID INSTALLATION AND SETUP ----"
echo "Installing Bridge"
adb install smbridge_1_1_0.apk
echo "---- ANDROID INSTALLATION AND SETUP ----"
echo "Installing SM Player"
adb install smplayer_1_0_3.apk
echo "---- ANDROID INSTALLATION AND SETUP ----"
echo "Android Setup and Installation Complete!"
echo "Starting SM Suite..."
adb shell am startservice com.sminfinity.smwatchdog/.MainService
timeout  5s
echo "---- ANDROID INSTALLATION AND SETUP ----"
echo "Batch Complete!"