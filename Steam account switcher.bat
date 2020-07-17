@echo off
TITLE Steam Account Switcher
TASKKILL /F /IM steam.exe
REG COMPARE HKCU\Software\Valve\Steam HKCU\Software\Valve\AccountSwitcher /v AutoLoginUser
IF NOT ERRORLEVEL 1 goto smurf

echo Opening miloman_23
REG ADD HKCU\Software\Valve\Steam /v AutoLoginUser /t REG_SZ /d miloman_23 /F
REG ADD HKCU\Software\Valve\Steam /v RememberPassword /t REG_DWORD /d 1 /F
goto END

:smurf
echo opening mr0cket234
REG ADD HKCU\Software\Valve\Steam /v AutoLoginUser /t REG_SZ /d mr0cket234 /F
REG ADD HKCU\Software\Valve\Steam /v RememberPassword /t REG_DWORD /d 1 /F
goto END

:END

start steam:\\open\main
ECHO Account Switch successful 
timeout /T 2 /nobreak
EXIT