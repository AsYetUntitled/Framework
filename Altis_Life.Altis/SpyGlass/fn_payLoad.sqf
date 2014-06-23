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

if(!(__GETC__(SPY_cfg_enableSys))) exitWith {}; //Don't waste anymore time since it was disabled.
if(__GETC__(life_adminlevel) != 0) exitWith {}; //Don't run this for admins?

//Make sure all functions were offloaded to the client..
waitUntil {!isNil "SPY_fnc_menuCheck" && !isNil "SPY_fnc_variablecheck" && !isNil "SPY_fnc_cmdMenuCheck"};

//Browse through the CfgPatches and check if any patches not white-listed by the server admin exist. Default configuration allows no extra addons.
if(__GETC__(SPY_cfg_runPatchCheck)) then {
	_binConfigPatches = configFile >> "CfgPatches";
	for "_i" from 0 to count (_binConfigPatches)-1 do {
		_patchEntry = _binConfigPatches select _i;
		if(isClass _patchEntry) then {
			if(!((configName _patchEntry) in (call SPY_cfg_patchList))) exitWith {
				[[player getVariable["realname",name player],getPlayerUID player,(configName _patchEntry)],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
				[[player getVariable["realname",name player],format["Unknown Addon Patch: %1",(configName _patchEntry)]],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
				sleep 0.5;
				["SpyGlass",false,true] call BIS_fnc_endMission;
			};
		};
	};
};

//Launch our workers
[] call SPY_fnc_menuCheck;
[] spawn SPY_fnc_cmdMenuCheck;
[] spawn SPY_fnc_variableCheck;

//Create a no-recoil hack check.
[] spawn {
	while {true} do {
		if((unitRecoilCoefficient player) < 1) then {
			[[player getVariable["realname",name player],getPlayerUID player,"No_recoil_hack"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
			[[player getVariable["realname",name player],"No recoil hack"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
			sleep 0.5;
			["SpyGlass",false,false] call BIS_fnc_endMission;
		};
		sleep 1.5;
	};
};