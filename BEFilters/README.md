BattlEye Filters
================
The BattlEye filters (.txt files) go into: 
```
%arma3server%\profiles\BattlEye\%missionName.mapName%
```

**OR** wherever you specified your BattlEye folder to be.

Example directory: 
```
arma3server\profiles\BattlEye\Altis_Life.Altis
```

If you are using [Tophe's Arma Dedicated Server Tool](https://forums.bistudio.com/topic/101123-tophes-arma-dedicated-server-tool-tadst/) (TADST) the folder structure will be: 
```
%arma3server%\TADST\%profileName%\BattlEye\Altis_Life.Altis
```

The following is required in the [server.cfg](https://community.bistudio.com/wiki/server.cfg) to enable BattlEye: 
```
BattlEye = 1;
```

<b>These BattlEye filters are a work in progress, and are only guaranteed to work with the latest vanilla release of [Altis Life RPG] (https://github.com/AsYetUntitled/Framework), on its respective targeted ARMA 3 version.</b> If you encounter an issue with the filters for the latest **vanilla** mission version, then please create an [issue](https://github.com/AsYetUntitled/Framework/issues) on the GitHub repository. 

<b>Modifications to the Altis Life RPG mission files will most likely require the BattlEye filters to be updated.</b>

Read [A Guide to BattlEye Filters](http://opendayz.net/threads/a-guide-to-battleye-filters.21066/) and [How To: BattlEye filters - DO IT YOURSELF!](https://www.exilemod.com/topic/74-how-to-battleye-filters-do-it-yourself/) to learn how to update your own BattlEye filters. See also [BattlEye Filters](https://github.com/AsYetUntitled/Framework/wiki/BattlEye-Filters) on the AsYetUntitled/Framework GitHub wiki, [BattlEye](https://community.bistudio.com/wiki/BattlEye) on the Bohemia Interactive Community Wiki, and the [BattlEye](https://www.battleye.com/) website. 

### Notes
1. For Linux servers, the filter file names **must** all be in lower case. For Windows servers the casing is irrelevant. 
