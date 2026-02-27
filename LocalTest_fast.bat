@echo off

echo [---------------------------]
echo [-VRChat-LocalTest-Launcher-]
echo [-Author---Eeacks.cc--------]
echo [---------------------------]

REM string randomDigits = Tools.GetRandomDigits(10);
REM string text4 = "--url=create?roomId=" + randomDigits + "&hidden=true&name=BuildAndRun&url=file:///" + text;
set /a "randomid_a=10000+%random%"
set /a "randomid_b=10000+%random%"
set "randomid=%randomid_a%%randomid_b%"

dir /s /b *.vrcw > temp.txt
set /p path=<temp.txt
del temp.txt

set "GameDir=F:\SteamLibrary\steamapps\common\VRChat\"

set ClientCount=1
for /l %%i in (1, 1, %ClientCount%) do (
	start "" /D %GameDir% "%GameDir%VRChat.exe" "--url=create?roomId=%randomid%&hidden=true&name=BuildAndRun&url=file:///%path%" --enable-debug-gui --enable-sdk-log-levels --enable-udon-debug-logging  --no-vr --watch-worlds
)
