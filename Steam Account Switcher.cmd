@echo off
TITLE Steam Account Switcher
TASKKILL /F /IM steam.exe
REM Replace 'MainName' and 'AltName' below with the name of your steam accounts.
SET Main_Account=MainName
SET Alt_Account=AltName

:START
REG COMPARE HKCU\Software\Valve\Steam HKCU\Software\Valve\AccountSwitcher /v AutoLoginUser
IF ERRORLEVEL 2 goto :MAIN
IF ERRORLEVEL 1 goto :INIT
IF ERRORLEVEL 0 goto :ALT

:MAIN
echo switching to main Account...
REG ADD HKCU\Software\Valve\Steam /v AutoLoginUser /t REG_SZ /d %Main_Account% /F
REG ADD HKCU\Software\Valve\Steam /v RememberPassword /t REG_DWORD /d 1 /F
goto END

:ALT
echo switching to Alt Account...
REG ADD HKCU\Software\Valve\Steam /v AutoLoginUser /t REG_SZ /d %Alt_Account% /F
REG ADD HKCU\Software\Valve\Steam /v RememberPassword /t REG_DWORD /d 1 /F
goto END

:END
IF ERRORLEVEL
ECHO Account Switch successful, Opening steam...
start steam:\\open\main
timeout /T 5 /nobreak
EXIT


:INIT
echo Initialising...
REG ADD HKCU\Software\valve\AccountSwitcher /v AutoLoginUser /d %Main_Account%
goto :start
