/*
	File: fn_menuCheck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks for known cheat menus and closes them then reports them to the server.
*/
//Wookie Menu V1-3 and other Copy-Pasted menu-based cheats.
[] spawn {
	waitUntil {!isNull (findDisplay 3030)};
	[[name player,getPlayerUID player,"MenuBasedHack_DISPLAY_3030"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[name player,"Menu Hack: DISPLAY 3030 (Wookie Menu etc)"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call BIS_fnc_endMission;
};

//Some other old copy-pasted menu/display
[] spawn {
	waitUntil {!isNull ((findDisplay 64) displayCtrl 101)};
	[[name player,getPlayerUID player,"MenuBasedHack_DISPLAY_64_C_101"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[name player,"Menu Hack: DISPLAY 64 CONTROL 101"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call BIS_fnc_endMission;
};

//Lystic's Unreleased menu & Bobby's Unreleased menu (Field Menu, if you are not using my client-side code to disable that button prepare for a lot of false-positives.).
[] spawn {
	waitUntil {!isNull (findDisplay 162)};
	[[name player,getPlayerUID player,"MenuBasedHack_DISPLAY_162"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[name player,"Menu Hack: DISPLAY 162 (Lystic & Bobby Menu Hack)"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call BIS_fnc_endMission;
};

//Another menu-based cheat by Wookie but it can cause false positives so we just close it.
[] spawn {
	while {true} do {
		waitUntil {!isNull (findDisplay 129)};
		closeDialog 0;
	};
};

//Wookie Menu V4-5 and all other copy-pasted ones from it.
[] spawn {
	waitUntil {!isNull (uiNamespace getVariable "RscDisplayRemoteMissions")};
	[[name player,getPlayerUID player,"MenuBasedHack_RscDisplayRemoteMissions"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[name player,"Menu Hack: RscDisplayRemoteMissions"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call BIS_fnc_endMission;
};