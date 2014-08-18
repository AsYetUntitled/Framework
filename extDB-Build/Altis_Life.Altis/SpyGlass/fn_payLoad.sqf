/*
	File: fn_payLoad.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	This is the payload that is sent to the client and forces them
	to initialize key functions.
*/
private["_binConfigPatches","_cfgPatches"];
#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
#define __GETC__(var) (call var)

//First null out some very harmful known functions.
__CONST__(W_O_O_K_I_E_ANTI_ANTI_HAX,"No");
__CONST__(W_O_O_K_I_E_FUD_ANTI_ANTI_HAX,"No");
__CONST__(E_X_T_A_S_Y_ANTI_ANTI_HAX,"CopyPasta");
__CONST__(E_X_T_A_S_Y_Pro_RE,"Iswhat");
__CONST__(E_X_T_A_S_Y_Car_RE,"Youdo");
__CONST__(DO_NUKE,"LOL");
__CONST__(JxMxE_spunkveh,"Blah");
__CONST__(JxMxE_spunkveh2,"Blah");
__CONST__(JxMxE_spunkair,"Blah");
__CONST__(JJJJ_MMMM___EEEEEEE_LLYYSSTTIICCC_SHIT_RE,"No");
__CONST__(JJJJ_MMMM___EEEEEEE_LLYYSSTTIICCC_SHIT_RE_OLD,"No");
__CONST__(JJJJ_MMMM___EEEEEEE_SPAWN_VEH,"No");
__CONST__(JJJJ_MMMM___EEEEEEE_SPAWN_WEAPON,"No");

//Make sure all functions were offloaded to the client..
waitUntil {!isNil "SPY_fnc_menuCheck" && !isNil "SPY_fnc_variablecheck" && !isNil "SPY_fnc_cmdMenuCheck"};

//Browse through the CfgPatches and check if any patches not white-listed by the server admin exist. Default configuration allows no extra addons.

if(__GETC__(SPY_cfg_runPatchCheck)) then {
	_binConfigPatches = configFile >> "CfgPatches";
	for "_i" from 0 to count (_binConfigPatches)-1 do {
		_patchEntry = _binConfigPatches select _i;
		if(isClass _patchEntry) then {
			if(!((configName _patchEntry) in (call SPY_cfg_patchList))) exitWith {
				[[profileName,getPlayerUID player,(configName _patchEntry)],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
				[[profileName,format["Unknown Addon Patch: %1",(configName _patchEntry)]],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
				sleep 0.5;
				["SpyGlass",false,false] call BIS_fnc_endMission;
			};
		};
	};
};

//Check for copy-pasters of Dev-Con styled execution.
private["_children","_allowedChildren"];
_children = [configFile >> "RscDisplayMPInterrupt" >> "controls",0] call BIS_fnc_returnChildren;
_allowedChildren = [
"Title","MissionTitle","DifficultyTitle","PlayersName","ButtonCancel","ButtonSAVE","ButtonSkip","ButtonRespawn","ButtonOptions",
"ButtonVideo","ButtonAudio","ButtonControls","ButtonGame","ButtonTutorialHints","ButtonAbort","DebugConsole","Feedback","MessageBox"
];

{
	if(!((configName _x) in _allowedChildren)) exitWith {
		[[profileName,getPlayerUID player,"Modified_MPInterrupt"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
		[[profileName,"Devcon like executor detected"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
		sleep 0.5;
		["SpyGlass",false,false] call BIS_fnc_endMission;
	};
} foreach _children;

//Validate that RscDisplayInventory is not modified common cheat-engine sqf executor method.
private["_onLoad","_onUnload"];
_onLoad = getText(configFile >> "RscDisplayInventory" >> "onLoad");
_onUnload = getText(configFile >> "RscDisplayInventory" >> "onUnload");

if(_onLoad != "[""onLoad"",_this,""RscDisplayInventory"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""") exitWith {
	[[profileName,getPlayerUID player,"Modified_RscDisplayInventory_onLoad"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,"Modified RscDisplayInventory_onLoad (CheatEngine injection)"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call BIS_fnc_endMission;
};
if(_onUnload != "[""onUnload"",_this,""RscDisplayInventory"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""") exitWith {
	[[profileName,getPlayerUID player,"Modified_RscDisplayInventory_onUnload"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,"Modified RscDisplayInventory_onUnload (CheatEngine injection)"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call BIS_fnc_endMission;
};

	
//Launch our workers
[] call SPY_fnc_menuCheck;
[] spawn SPY_fnc_cmdMenuCheck;
[] spawn SPY_fnc_variableCheck;

//Create a no-recoil hack check.
[] spawn {
	waitUntil {(!isNil "life_fnc_moveIn")};
	while {true} do {
		if((unitRecoilCoefficient player) < 1) then {
			[[profileName,getPlayerUID player,"No_recoil_hack"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
			[[profileName,"No recoil hack"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
			sleep 0.5;
			["SpyGlass",false,false] call BIS_fnc_endMission;
		};
		sleep 1.5;
	};
};
