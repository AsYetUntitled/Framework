/*
	File: fn_menuCheck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks for known cheat menus and closes them then reports them to the server.
*/
//Wookie Menu V1-3 and other Copy-Pasted menu-based cheats.
[] spawn {
	waitUntil {!isNull (findDisplay 3030)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_3030"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 3030 (Wookie Menu etc)"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
	closeDialog 0;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

//Some other old copy-pasted menu/display
[] spawn {
	waitUntil {!isNull ((findDisplay 64) displayCtrl 101)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_64_C_101"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 64 CONTROL 101"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
	closeDialog 0;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

//Lystic's Unreleased menu & Bobby's Unreleased menu (Field Menu, if you are not using my client-side code to disable that button prepare for a lot of false-positives.).
[] spawn {
	waitUntil {!isNull (findDisplay 162)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_162"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 162 (Lystic & Bobby Menu Hack)"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
	closeDialog 0;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
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
	[[profileName,getPlayerUID player,"MenuBasedHack_RscDisplayRemoteMissions"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
	[[profileName,"Menu Hack: RscDisplayRemoteMissions"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
	closeDialog 0;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

//Debug Menu
[] spawn {
	waitUntil {!isNull (uiNamespace getVariable "RscDisplayDebugPublic")};
	closeDialog 0;
	[[profileName,getPlayerUID player,"MenuBasedHack_RscDisplayDebugPublic"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
	[[profileName,"Menu Hack: RscDisplayDebugPublic"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
	closeDialog 0;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

/*
	JME 313 Menu Check.
	Hey you know what I had a feeling from the picture awhile ago it was the controllers display but because it was so mangled I couldn't really tell..
	At least you can spell my name correct unlike that retard extasy hosting who is all butt hurt because griffin released a pbo hider so now he can't 
	sell darky's old pbo hider and make money from it or take credit bahahahaha.
	
	Before I conclude this small conversation I have embedded in my code be sure to look at fn_payLoad.sqf, if you guys would stop with the copy-pasting and 
	actually figure out something you could disable spyglass 4 different ways and then make me stop being lazy to patch out those 4 methods.
	Until next time JME.
*/
[] spawn {
	while {true} do {
		waitUntil {!isNull (findDisplay 148)};
		sleep 0.5;
		if((lbSize 104)-1 > 3) exitWith {
			[[profileName,getPlayerUID player,"MenuBasedHack_RscDisplayConfigureControllers"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
			[[profileName,"Menu Hack: RscDisplayConfigureControllers (JME 313)"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
			closeDialog 0;
			["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
		};
	};
};

[] spawn {
	while {true} do {
		waitUntil {!isNull (uiNamespace getVariable "RscDisplayArsenal")};
		[[profileName,getPlayerUID player,"MenuBasedHack_RscDisplayArsenal"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
		[[profileName,"Menu Hack: BIS Arsenal"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
		closeDialog 0;
		["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
	};
};

//Gladtwoown's Script Executor
[] spawn {
	waitUntil {!isNull (findDisplay 125)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_125"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 125"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
	closeDialog 0;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

//Itsyuka's List of possible executor displays
[] spawn {
	waitUntil {!isNull (findDisplay 69)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_69"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 69"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
	closeDialog 0;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn {
	waitUntil {!isNull (findDisplay 19)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_19"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 19"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
	closeDialog 0;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn {
	waitUntil {!isNull (findDisplay 71)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_71"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 71"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
	closeDialog 0;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn {
	waitUntil {!isNull (findDisplay 45)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_45"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 45"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
	closeDialog 0;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn {
	waitUntil {!isNull (findDisplay 132)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_132"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 132"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
	closeDialog 0;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn {
	waitUntil {!isNull (findDisplay 32)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_32"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 32"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
	closeDialog 0;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn {
	waitUntil {!isNull (findDisplay 165)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_165"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 165"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
	closeDialog 0;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn {
	waitUntil {!isNull ((findDisplay 49) displayCtrl 0)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_49_C_0"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 49 CONTROL 0"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
	closeDialog 0;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

//Itsyuka's List of possible menu displays
[] spawn {
	waitUntil {!isNull (findDisplay 157)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_157"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 157"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
	closeDialog 0;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn {
	waitUntil {!isNull (findDisplay 2727)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_2727"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 2727"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
	closeDialog 0;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn {
	waitUntil {!isNull (findDisplay 30)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_30"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 30"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
	closeDialog 0;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

//A menu that had eluded my attention for quite some time.
[] spawn {
	disableSerialization;
	private "_display";
	while {true} do {
		waitUntil {_display = uiNamespace getVariable ["RscDisplayInsertMarker", displayNull]; !isNull _display};
		sleep 0.5;
		{
			if (_x && !isNull _display) exitWith {
				[[profileName,getPlayerUID player,"MenuBasedHack_RscDisplayInsertMarker"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
				[[profileName,"Menu Hack: RscDisplayInsertMarker"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
				closeDialog 0;
				["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
			};
		} forEach [
			(toLower ctrlText (_display displayCtrl 1001) != toLower localize "STR_A3_RscDisplayInsertMarker_Title"),
			{if (buttonAction (_display displayCtrl _x) != "") exitWith {true}; false} forEach [1,2]
		];
	};
};

//Oh look..
[] spawn {
	disableSerialization;
	private "_display";
	while {true} do {
		waitUntil {_display = uiNamespace getVariable ["RscDisplayConfigureAction", displayNull]; !isNull _display};
		sleep 0.5;
		
		//These shouldn't be here...
		(_display displayCtrl 102) ctrlRemoveAllEventHandlers "LBDblClick";
		(_display displayCtrl 102) ctrlRemoveAllEventHandlers "LBSelChanged";
		
		{
			if (_x && !isNull _display) exitWith {
				[[profileName,getPlayerUID player,"MenuBasedHack_RscDisplayConfigureAction"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
				[[profileName,"Menu Hack: RscDisplayConfigureAction"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
				closeDialog 0;
				["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
			};
		} forEach [
			(toLower ctrlText (_display displayCtrl 1000) != toLower localize "STR_A3_RscDisplayConfigureAction_Title"),
			{if (buttonAction (_display displayCtrl _x) != "") exitWith {true}; false} forEach [1,104,105,106,107,108,109]
		];
	};
};

//JME Lite
[] spawn {
	disableSerialization;
	private "_display";
	while {true} do {
		waitUntil {_display = uiNamespace getVariable ["RscDisplayControlSchemes", displayNull]; !isNull _display};
		sleep 0.5;
		
		(_display displayCtrl 101) ctrlRemoveAllEventHandlers "LBDblClick";
		(_display displayCtrl 101) ctrlRemoveAllEventHandlers "LBSelChanged";
		
		{
			if (_x && !isNull _display) exitWith {
				[[profileName,getPlayerUID player,"MenuBasedHack_RscDisplayControlSchemes"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
				[[profileName,"Menu Hack: RscDisplayControlSchemes"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
				closeDialog 0;
				["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
			};
		} forEach [
			(toLower ctrlText (_display displayCtrl 1000) != toLower localize "STR_DISP_OPTIONS_SCHEME"),
			{if (buttonAction (_display displayCtrl _x) != "") exitWith {true}; false} forEach [1,2]
		];
	};
};