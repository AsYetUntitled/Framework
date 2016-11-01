BattlEye Filters
================
The BattlEye filters (.txt files) go into: 
```
%arma3server%\profiles\BattlEye\%missionName.mapName%
```

Example directory: 
```
arma3server\profiles\BattlEye\Altis_Life.Altis
```

If you are using [Tophe's Arma Dedicated Server Tool](https://forums.bistudio.com/topic/101123-tophes-arma-dedicated-server-tool-tadst/) (TADST) the folder structure will be: 
```
%arma3server%\TADST\%profileName%\BattlEye\Altis_Life.Altis
```

The following is required in the [server.cfg](https://community.bistudio.com/wiki/server.cfg): 
```
BattlEye = 1;                   // Server to use BattlEye system.
```

<b>These BattlEye filters are a work-in-progress and are only applicable to the latest vanilla release of [Altis Life RPG] (https://github.com/AsYetUntitled/Framework) / ArmA RPG Life</b>. If you encounter an issue with the latest filters for the latest mission version then please create an [issue](https://github.com/AsYetUntitled/Framework/issues) on the GitHub repository. 

<b>Any modification</b> to the Altis Life RPG mission files will require the BattlEye filters to be updated. 

Read [A Guide to BattlEye Filters](http://opendayz.net/threads/a-guide-to-battleye-filters.21066/) and [How To: BattlEye filters - DO IT YOURSELF!](https://www.exilemod.com/topic/74-how-to-battleye-filters-do-it-yourself/) to learn how to update your own BattlEye filters for your own custom mission or mod. See also [BattlEye Filters](https://github.com/AsYetUntitled/Framework/wiki/BattlEye-Filters) on the AsYetUntitled/Framework GitHub wiki, [BattlEye](https://community.bistudio.com/wiki/BattlEye) on the Bohemia Interactive Community Wiki, and the [BattlEye](https://www.battleye.com/) website. 

### Notes
1. For Linux servers the filter file names **must** be in all lower case. For Windows servers the case is irrelevant. 
2. The `publicVariableVar.txt` file was removed as it had no purpose. 
