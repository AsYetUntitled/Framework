Spyglass
================
<b>Spyglass an anti-cheat system for [Altis Life RPG](https://github.com/ArmaLife/Framework)</b>.</br></br>
<b>Any modification</b> to the Altis Life RPG mission files will require changes to Config_Spyglass.

<b>Notes</b>
If Spyglass is kicking on join, make sure that all functions that you have changed in Altis Life have been whitelisted. 
Check Client RPT to find notes on why you are being kicked. 

Example:
 4:50:48 "Variable: reb_1_4 is not allowed TYPE: OBJECT NS: MN"
 4:50:48 "Variable: ggs_shop is not allowed TYPE: OBJECT NS: MN"
 4:50:48 "Variable: reb_helicopter_1 is not allowed TYPE: OBJECT NS: MN"
 // Variable: VARIABLENAME is not allowed TYPE: (STRING, CODE, OBJECT, DISPLAY, SCALAR, BOOL)
 
If you encounter errors regarding variables, whitelist them via Config_Spyglass under allowedVariables

allowedVariables[] = { { "reb_1_4", "OBJECT" }, { "ggs_shop", "OBJECT" },{ "reb_helicopter_1", "OBJECT" }};
 
If Arma 3 has updated, it may be possible Bohemia Interactive have included new files into the game. 
If this is the case then launch Arma 3 and go to the editor (you do not need to load a mission.)
Press escape and put into init: 

_cfgPatches = [];	_binConfigPatches = configFile >> "CfgPatches";	for "_i" from 0 to count (_binConfigPatches)-1 do {		_patchEntry = _binConfigPatches select _i;		if(isClass _patchEntry) then {			_cfgPatches set[count _cfgPatches,(configName _patchEntry)];		};	};	copyToClipboard str(_cfgPatches);

Paste the results into a notepad. 
Open Mission fn_initSpy.sqf and find 
_patchList =
Edit the result that you got from your notepad to include at the start ["life_server",
Paste in your results and follow the existing structure.
This should fix any issues. Any other problems, refer to (https://gitter.im/ArmaLife/Framework/Support) for help. 
