/*
	File: fn_payLoad.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	This is the payload that is sent to the client and forces them
	to initialize key functions.
*/
private["_binConfigPatches","_cfgPatches"];
#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})

//First null out some very harmful known functions.
__CONST__(W_O_O_K_I_E_ANTI_ANTI_HAX,"No");
__CONST__(W_O_O_K_I_E_FUD_ANTI_ANTI_HAX,"No");
__CONST__(E_X_T_A_S_Y_ANTI_ANTI_HAX,"CopyPasta");
__CONST__(E_X_T_A_S_Y_Pro_RE,"Iswhat");
__CONST__(E_X_T_A_S_Y_Car_RE,"Youdo");
__CONST__(DO_NUKE,"LOL");

//Check for DevCon because some communities are morons, SET VerifySignatures = 2; IN YOUR SERVER CONFIG!!!!!
_binConfigPatches = configFile >> "CfgPatches";
_cfgPatches = [];
for "_i" from 0 to count (_binConfigPatches)-1 do {
	_patchEntry = _binConfigPatches select _i;
	if(isClass _patchEntry) then {
		_cfgPatches set[count _cfgPatches,configName _patchEntry];
	};
};

if("DevCon" in _cfgPatches) then {
	[[name player,getPlayerUID player,"DevCon"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[name player,"DevCon"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	disableUserInput true;
	["SpyGlass",false,true] call BIS_fnc_endMission;
};

//Make sure all functions were offloaded to the client..
waitUntil {!isNil "SPY_fnc_menuCheck" && !isNil "SPY_fnc_variablecheck" && !isNil "SPY_fnc_cmdMenuCheck"};

//Launch our workers
[] call SPY_fnc_menuCheck;
[] spawn SPY_fnc_cmdMenuCheck;
[] spawn SPY_fnc_variableCheck;

//Create a no-recoil hack check.
[] spawn {
	while {true} do {
		if((unitRecoilCoefficient player) < 1) then {
			[[name player,getPlayerUID player,"No_recoil_hack"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
			[[name player,"No recoil hack"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;

			["SpyGlass",false,false] call BIS_fnc_endMission;
		};
		sleep 1.5;
	};
};