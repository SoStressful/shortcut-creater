@echo off
if not exist "%LocalAppData%\FiveM" (
  cls
  echo FiveM location not found
  pause
  goto end
)

if exist "%USERPROFILE%\Desktop\FiveM Nodus.lnk" (
  cls
  echo Shortcut already exists
  pause
  goto end
)

echo This script will create a desktop shortcut named "FiveM Nodus" that opens the FiveM application
echo and connects to the Nodus server automatically. No other files will be modified created or deleted.
echo.
echo Do you want to continue?
echo.
echo Press Y to continue or N to cancel.
echo.

choice /C YN /M "Continue?"
if errorlevel 2 goto cancel

set appPath=%LocalAppData%\FiveM\FiveM.exe
set shortcutPath=%USERPROFILE%\Desktop\FiveM Nodus.lnk
set targetArgument=fivem://connect/141.11.231.162 -pure_1
set iconPath=%appPath%,0

echo Set oWS = WScript.CreateObject("WScript.Shell") > createShortcut.vbs
echo sLinkFile = "%shortcutPath%" >> createShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> createShortcut.vbs
echo oLink.TargetPath = "%appPath%" >> createShortcut.vbs
echo oLink.Arguments = "%targetArgument%" >> createShortcut.vbs
echo oLink.IconLocation = "%iconPath%" >> createShortcut.vbs
echo oLink.Save >> createShortcut.vbs

cscript createShortcut.vbs
del createShortcut.vbs
cls
echo The shortcut was created on your desktop. It is named "FiveM Nodus" and will open the FiveM application and connect you to nodus after a few seconds.
echo.
echo You may now delete this script. It is no longer needed. You do not need to run it again.
echo.
echo.
echo.
echo.
pause
goto end

:cancel
cls
echo.
echo The script has been cancelled. No shortcut was created.
pause
:end
