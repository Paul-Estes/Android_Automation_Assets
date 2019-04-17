#region InstallApks
adb install TeamViewerHost12.apk
adb install teamvieweraddon.apk
adb install terminal.apk
adb install smbridge_4_0_1.apk
adb install smplayer_4_0_1.apk
adb install smwatchdog_4_0_1.apk
#endregion InstallApks


#region CollectVars
$date = date
$ref = Read-Host -Prompt 'Please Enter Vantage Reference Number'
$smpass = Read-Host -Prompt 'Please Enter Spectacular Media Password'
$lbc = Read-Host -Prompt 'Please Enter Ammount of Logic Boards for Project'
$tz = @("US/Central", "US/Eastern", "US/Mountain", "US/Pacific")

$menuIndex = 1
Write-Host "Chose the project's Time Zone"
$tz | ForEach-Object {
    Write-Host $menuIndex " - $_";
    $menuIndex += 1;
 }


 $ChosenItem = [int](Read-Host "Your choice (1 to $($menuIndex-1))")

 $tz = $tz[$ChosenItem-1]

 Write-Output "$tz=$tz"
#endregion CollectVars


#region DiagSetup
adb shell am start -a android.intent.action.VIEW -d https://sminfinity.com/diagnostics/internal/website/display-hardware-settings.php?displaySerialID=$ref
adb shell sleep 4
adb shell input text "fernando@vantageled.com"
adb shell input keyevent 61
adb shell input text "Md1AzZ6XVV"
adb shell input keyevent 61
adb shell input keyevent 61
adb shell input keyevent 66
adb shell sleep 10
foreach($i in 1..13){
    adb shell input keyevent 61
}

adb shell input keyevent 66
adb shell sleep 10
foreach($i in 1..14){
    adb shell input keyevent 61
}
adb shell input text $lbc
adb shell input keyevent 66
adb shell sleep 10
adb shell am start -a android.intent.action.VIEW -d https://sminfinity.com/diagnostics/internal/website/display-diagnostics-settings.php?displaySerialID=$ref
adb shell sleep 6
adb shell input swipe 617 652 617 139 200
adb shell sleep 4
adb shell input tap 148 566
adb shell sleep 4adb shell input tap 148 524
#endregion DiagSetup


#region TeamViewer
adb shell am start -a android.intent.action.VIEW -d https://get.teamviewer.com/bbfxpc5qwnyl
adb shell sleep 20
adb shell input keyevent 61
adb shell input keyevent 61
adb shell input keyevent 66
#endregion TeamViewer


#region SMRegistration
adb shell am start air.com.sminfinity.smplayer/.AppEntry filter 3018539a
adb shell sleep 10
adb shell input keyevent 61
adb shell input keyevent 61
adb shell input text $smpass
adb shell input keyevent KEYCODE_BACK
adb shell input tap 612 413 
adb shell am startservice com.sminfinity.smwatchdog/.MainService
#endregion SMRegistration


#region LocalHost
#Seting up local user accounts
adb shell am start -a android.intent.action.VIEW -d http://localhost:8080
adb shell sleep 4
adb shell input keyevent 61
adb shell input text $ref
adb shell input keyevent 61
adb shell input text "admin"
adb shell input keyevent 61
adb shell input text "VANtageLED123"
adb shell input keyevent 61
adb shell input text "user"
adb shell input keyevent 61
adb shell input text "user"
adb shell input keyevent 61
adb shell input text "readonly"
adb shell input keyevent 61
adb shell input text "readonly"
adb shell input keyevent 61
adb shell input keyevent 66
adb shell sleep 3
adb shell input keyevent 61
adb shell input text "admin"
adb shell input keyevent 61
adb shell input text "VANtageLED123"
adb shell input keyevent 61
adb shell input keyevent 66
adb shell sleep 10
#finished user setup, continuing to SMBridge to set timezone.
foreach($i in 1..6){
    adb shell input keyevent 61
}
adb shell input text $tz
adb shell input keyevent 61
adb shell input keyevent 66 
#endregion LocalHost


#region InfoandClose
Write-Host $ref >> android.txt
Write-Host $date >> android.txt
Write-Host TeamViewer ID >> android.txt
adb shell busybox grep 'ClientID =' /data/data/com.teamviewer.host.market/files/global.conf >> android.txt
Write-Host Mac Address >> android.txt
adb shell netcfg >> android.txt
Write-Host TeamViewer ID
adb shell busybox grep 'ClientID =' /data/data/com.teamviewer.host.market/files/global.conf
Write-Host Mac Address
adb shell netcfg
adb shell pm clear com.android.browser
adb shell sleep 3
adb shell input keyevent KEYCODE_APP_SWITCH
adb shell sleep
foreach($i in 1..7){
    adb shell input swipe 520 482 100 482 100
}
adb shell svc power reboot initialization configuration
Write-Host TeamViewer
adb shell busybox grep 'ClientID =' /data/data/com.teamviewer.host.market/files/global.conf
Write-Host Mac Address
adb shell netcfg
adb shell pm clear com.android.browser
adb shell sleep 3
adb shell input keyevent KEYCODE_APP_SWITCH
adb shell sleep 3
foreach($i in 1..7){
    adb shell input swipe 520 482 100 482 100
}
#endregion InfoandClose



