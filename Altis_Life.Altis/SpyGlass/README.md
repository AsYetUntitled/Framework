SpyGlass
================
<b>SpyGlass is an anti-cheat system for [Altis Life RPG](https://github.com/AsYetUntitled/Framework)</b>.</br></br>
<b>Any modification</b> to the Altis Life RPG mission files will require changes to [Config_SpyGlass](https://github.com/AsYetUntitled/Framework/blob/master/Altis_Life.Altis/config/Config_SpyGlass.hpp). SpyGlass can be disabled in Altis_Life.Altis/config/Config_Master.hpp → `spyGlass_toggle`. This is **not** recommended. 

<b>Notes</b>

If SpyGlass is kicking on join then make sure that all functions that you have changed in the mission have been whitelisted. Check your *Arma 3* [client RPT](https://community.bistudio.com/wiki/Crash_Files) log file to find message outputs as to why you are being kicked. 

Example:

```
"Variable: reb_1_4 is not allowed TYPE: OBJECT NS: MN"
"Variable: ggs_shop is not allowed TYPE: OBJECT NS: MN"
"Variable: reb_helicopter_1 is not allowed TYPE: OBJECT NS: MN"
// Variable: VARIABLENAME is not allowed TYPE: (STRING, CODE, OBJECT, DISPLAY, SCALAR, BOOL)
 ```

If you encounter errors regarding variables then whitelist them via Config_SpyGlass under `allowedVariables`. 

```cpp
allowedVariables[] = { { "reb_1_4", "OBJECT" }, { "ggs_shop", "OBJECT" },{ "reb_helicopter_1", "OBJECT" }};
```

If there are Bohemia Interactive [functions](https://community.bistudio.com/wiki/Functions) - `bis_fnc_` - then add them to: 

```cpp
BIS_Functions[] = {"",""};
```

... and so on.

If *Arma 3* has updated then it may be possible that the developers have included new files into the game. 
If this is the case then launch *Arma 3* and go to the editor (you do not need to load a mission.)
Open the debug console and paste in the following code, then locally execute: 

```sqf
_cfgPatches = []; _binConfigPatches = configFile >> "CfgPatches"; for "_i" from 0 to count (_binConfigPatches)-1 do { _patchEntry = _binConfigPatches select _i; if (isClass _patchEntry) then { _cfgPatches set [count _cfgPatches,(configName _patchEntry)]; }; }; copyToClipboard str(_cfgPatches);
```

1. Paste the results into a source code editor such as [Notepad++](https://notepad-plus-plus.org/) or [Atom](https://atom.io/). 
2. Open SpyGlass/[fn_initSpy.sqf](https://github.com/AsYetUntitled/Framework/blob/master/Altis_Life.Altis/SpyGlass/fn_initSpy.sqf) and find `_patchList =`
3. Edit the result that you got from executing the code to include this at the start: `["life_server",`
4. Paste in your results and follow the existing structure.

This should fix any issues with SpyGlass. If you continue to experience issues then please see [contact on Contributing to AsYetUntitled](https://github.com/AsYetUntitled/Framework/blob/master/.github/CONTRIBUTING.md#contact). 
