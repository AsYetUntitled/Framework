<h1 align="center">Headless Client</h1>
<p align="center">
    <a href="https://github.com/ArmaLife/Altis">
        <img src="https://img.shields.io/badge/Version-v1.0-green.svg" alt="HC Version">
    </a>
    &nbsp;&nbsp;&nbsp;
    <a href="http://dev.arma3.com/post/spotrep-00052">
        <img src="https://img.shields.io/badge/arma%203-1.56-orange.svg" alt="Arma 3 Version">
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
> Headless Client optimize +80% of arma3server.exe. He takes actually 100% of MySQL request and 80% of ServerSide's scripts.

How to install it
----------------------

> Put in your config.cfg
headlessClients[] = {IP¨of headless}; for exemple if you have your headless in the same computer  : headlessClients[] = {127.0.0.1};

> life_hc.pbo need to be signed if verifysignature=2 !!!

> My Start-HC.bat :

```
@echo off
::timeout 20
:: Modify your folders etc!
set armapath="D:\SteamGames\steamapps\common\Arma 3"
set armaparams=-client -connect=127.0.0.1 -port=2302 -password=dev -name=HC -profiles=HC -mod=@extDB2;@life_hc;
set serverexe=arma3.exe
echo.
echo Restarting
:: start the servers..
cd /d %armapath%
start "" %serverexe% %armaparams%
exit
```
<br/>

---------------------------