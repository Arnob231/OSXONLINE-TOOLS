@echo off
color 2
title bruteforce
cd winrar-opt
:wbru
cls
echo --------------------------------------
echo         WINRAR BRUTE-FORCE
echo --------------------------------------
SET PASS=0
SET TMP=TempFold
MD %TMP%
:RAR
echo.
cls
echo --------------------------------------
echo         WINRAR BRUTE-FORCE
echo --------------------------------------
echo.
SET/P "NAME=File Name  : "
IF "%NAME%"=="" goto ProblemDetected
goto GPATH
:ProblemDetected
echo You can't leave this blank.
pause
goto RAR
:GPATH
goto NEXT
:PERROR
echo You can't leave this blank.
pause
goto RAR
:NEXT
IF EXIST "%NAME%" GOTO word
goto PATH
:PATH
cls
echo File couldn't be found. Make sure you include the (.RAR) extension at the end of the file's name.
pause
goto RAR
:word
set /p word=Enter a wordlist name:
if exist %word% goto SP
echo The wordlist name enter cannot be found. Try to add the full path to it.
goto word
:SP
cls
echo Breaking Password...
echo.
echo Trying the passwords .....
for /F "tokens=1" %%i in (%word%) do call :process %%i
goto thenextstep
:START
title Processing...
echo %time%>"rarattack.hype"
:process
set VAR1=%1
echo %VAR1%
UNRAR E -INUL -P%VAR1% "%NAME%" "%TMP%"
IF /I %ERRORLEVEL% EQU 0 GOTO FINISH
GOTO :eof
:FINISH
RD %TMP% /Q /S
cls
title 1 Password Found
echo.
echo File = %NAME%
echo Stable Password= %VAR1%
echo.
echo Press any key to exit.
pause>NUL
exit
:timeCount
set thetimenow=%time%
set /p thetimebefore=<"rarattack.hype"
set /a hours=%thetimenow:~0,2% - %thetimebefore:~0,2%
set /a mins=%thetimenow:~3,2% - %thetimebefore:~3,2%
set /a seconds=%thetimenow:~6,2% - %thetimebefore:~6,2%
set /a minsecs=%thetimenow:~9,2% - %thetimebefore:~9,2%
if %minsecs% lss 0 (set /a seconds-=1
set /a minsecs+=100)
if %seconds% lss 0 (set /a mins-=1
set /a seconds+=60)
if %mins% lss 0 (set /a hours-=1
set /a mins+=60)
if %hours% lss 0 (set /a days=1
set /a hours+=24)
if not "%days%" == "1" (set days=) else (set days=1 or more days, )
echo It took to crack about %seconds% secound(s)
