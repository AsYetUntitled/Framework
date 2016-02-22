<h1 align="center">Headless Client</h1>
<p align="center">
    <a href="https://github.com/ArmaLife/Altis">
        <img src="https://img.shields.io/badge/Version-v0.5-green.svg" alt="HC Version">
    </a>
    &nbsp;&nbsp;&nbsp;
    <a href="http://dev.arma3.com/post/spotrep-00052">
        <img src="https://img.shields.io/badge/AltisLife%20-4.5-orange.svg" alt="Altis Life Version">
    </a>
    &nbsp;&nbsp;&nbsp;
    <a href="https://gitter.im/ArmaLife/Altis?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge">
        <img src="https://badges.gitter.im/ArmaLife/Altis.svg" alt="Join the chat at https://gitter.im/ArmaLife/Altis">
    </a>
    &nbsp;&nbsp;&nbsp;
    <a href="https://gitter.im/ArmaLife/Altis/Support?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge">
        <img src="https://img.shields.io/badge/support-on%20gitter-blue.svg" alt="Join the support chat at https://gitter.im/ArmaLife/Altis/Support">
    </a>
</p>

About Headless Client
----------------------
> Headless Client optimize +70% of arma3server.exe. He takes actually 75% of MySQL request and 65% of ServerSide's scripts.

<br/>

How to install it
----------------------

> 
@echo off
:start
C:\Windows\System32\tasklist /FI "IMAGENAME eq arma3.exe" 2>NUL | C:\Windows\System32\find /I /N "arma3.exe">NUL
if "%ERRORLEVEL%"=="0" goto loop
echo Server is not running, will be started now 
start "" /wait "C:\Steam\SteamApps\common\Arma 3\arma3.exe" -client -connect=127.0.0.1 -port=2302 -password=XXXX -name=HC -profiles=HC -mod=@extDB2;@life_hc
timeout 30
echo Server started succesfully
goto started
:loop
cls
echo Server is already running, running monitoring loop
C:\Windows\System32\timeout /t 420
goto started
:started
taskkill /f /im WerFault.exe /fi "WINDOWTITLE eq Arma 3"
C:\Windows\System32\timeout /t 80
C:\Windows\System32\tasklist /FI "IMAGENAME eq arma3.exe" 2>NUL | C:\Windows\System32\find /I /N "arma3.exe">NUL
if "%ERRORLEVEL%"=="0" goto loop
goto start

---------------------------