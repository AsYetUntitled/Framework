Altis-Life
==========

<b>Altis Life</b> or <b>[Altis Life RPG] (http://www.altisliferpg.com)</b> is developed by <b>Tonic</b> AKA <b>[TAW_Tonic] (https://github.com/TAWTonic)</b>.<br/>
This contains primarily the release contain and on-going development changes to the mission.<br/>
Altis Life RPG by Tonic is licensed under a [Creative Commons Attribution-NonCommercial-NoDerivs 3.0 Unported License] (http://creativecommons.org/licenses/by-nc-nd/3.0/deed.en_US)
<br/><br/>
<b>Usage / Terms of agreement:</b>
>   The branding of the mission is to stay ‘Altis Life RPG’. This means you cannot modify it to say something else. i.e Atlis Life by YOURCOMMUNITYNAME/TAG. Everything about the naming / branding is to be left untouched.

>   Naturally all credit is to remain intact on all files. Author cannot be modified via Description.ext but can be extended in briefing.sqf

>   All of my code is not to be used outside of the mission in another ‘Life’ like mission. It is to stay the Altis Life RPG Framework / my framework or you don’t use it and direct branding.

>   Some of my code can be used outside of the mission / framework but permission is to be asked first, if no response is received then it is a automatic NO.

>   Core configuration is allowed to be modified (i.e Prices and expansion of items / features).

>   Altis-Life RPG Framework is only allowed to be used with the Arma 3 vanilla maps with no extensions or mods (with the exception of server sided mods, and direct permission from author).

>   All edits made inside the framework is fine as long as it stays in the vanilla maps that Bohemia Interactive has released, past, present and future.

>   Features added by you to the mission are to stay to your modification in your server, distribution is not allowed without my permission, if you would like your feature to be added to the Altis Life RPG main distribution (by me) you can submit your changes and will be fully credited.

>   This is not be used commercially and is to remain freeware, this includes requiring donations / payment to be able to ‘play’ in your server with this mission. Playability of it is to remain free and open.

By using the framework and/or code inside the framework, you agree to the terms of agreement.<br/>
The terms are subjected to be changed over time.
<br/><br/>
<b>Disclaimer:</b><br/>
The vast majority of the code / framework has been written by me.<br/>
Any additional code / content used is fully credited and owned by it’s author as well as linked to the authors content (Forums,Media,etc).<br/>
The additional content used within the framework either has the expressed permission of the content creators permission or was automatically used under the GPU (General Purpose License) from public posting with no usage / TOA / Disclaimer, however they still own the rights to their content.<br/>
If in any case that content is being used within this mission / framework that the content creator doesn’t wish for it to be used due to my strict TOA / Agreement all you need to do is ask for it to be removed and it will be honored.
<br/>
<b>This build is for [extDB2] (https://github.com/Torndeco/extdb2)</b>
=============================
<br/>
To setup extDB2 you need to use the Windows/Linux pre-compiled build and edit the extdb-conf.ini "MySQL_Example" field to "AltisLife" with your Database name and login SQL user details, like this:
```
[MySQL_Example]
Type = MySQL
Name = Database_Name

Username = root
Password = password

IP = 127.0.0.1
Port = 3306
```
To something like this:
```
[AltisLife]
Type = MySQL
Name = arma3life

Username = MyDatabaseLogin
Password = MyDatabasePassword

IP = 127.0.0.1
Port = 3306
```
<br/>
Make sure the following files/folders are in the root directory of your ARMA 3 server files (where the exe is):<br/>
<b>Windows:</b>
```
@extDB2 (Inside it: extDB2.dll + extdb-conf.ini)
tbbmalloc.dll
```
<b>Linux:</b>
```
@extDB2 (Inside it: extDB2.so + extdb-conf.ini)
```
You can drag the extDB2.dll & extdb-conf.ini to root folder as well or you can copy over @extDB2 over as a regular mod. If you choose to use @extDB2 as a regular mod your commandline will be:
-mod=@life_server;@extDB2
<br/>
If you are not using @extDB2 as a mod and choose to drag extDB2.dll into the main arma 3 server directory then you only need @life_server in the commandline.
<br/>
For Linux
=========
<b>Requirements:</b><br/>
Working Linux Arma3Server
<br/><br/>
<b>Debian/Ubuntu</b><br/>
apt-get install libtbb2:i386
<br/>
<b>RedHat/CentOS</b><br/>
yum install tbb.i686
<br/>
Extract the static build (if you do not know how to build on a linux os) to the root directory.