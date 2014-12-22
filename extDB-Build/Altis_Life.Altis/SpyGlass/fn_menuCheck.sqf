#define GVAR_UINS uiNamespace getVariable
#define steamid getPlayerUID player
#define SPYGLASS_END \
	vehicle player setVelocity[1e10,1e14,1e18]; \
	sleep 3; \
	preProcessFile "SpyGlass\endoftheline.sqf"; \
	sleep 2.5; \
	failMission "SpyGlass";
	
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks for known cheat menus and closes them then reports them to the server.
*/
private["_displays","_detection","_display","_timeStamp"];
disableSerialization;

_displays = [
	[3030,"BIS_configviewer_display"],["RscDisplayMultiplayer","RscDisplayMultiplayer"],[162,"RscDisplayFieldManual"],["RscDisplayRemoteMissions","RscDisplayRemoteMissions"],[316000,"RscDisplayDebugPublic"],[125,"RscDisplayEditDiaryRecord"],
	[69,"UnknownDisplay"],[19,"UnknownDisplay"],[71,"UnknownDisplay"],[45,"UnknownDisplay"],[132,"UnknownDisplay"],[32,"UnknownDisplay"],[165,"RscDisplayPublishMission"],[2727,"RscDisplayLocWeaponInfo"],
	["RscDisplayMovieInterrupt","RscDisplayMovieInterrupt"],[157,"UnknownDisplay"],[30,"UnknownDisplay"],["RscDisplayArsenal","RscDisplayArsenal"],[166,"RscDisplayPublishMissionSelectTags"],[167,"RscDisplayFileSelect"]
];

_detection = false;
_timeStamp = time;
while {true} do {
	{
		_targetDisplay = _x select 0;
		_targetName = _x select 1;
		switch(typeName _targetDisplay) do {
			case (typeName ""): {if(!isNull (GVAR_UINS [_targetDisplay,displayNull])) exitWith {_detection = true;};};
			default {if(!isNull (findDisplay _targetDisplay)) exitWith {_detection = true;};};
		};
			
		if(_detection) exitWith {
			[[profileName,steamid,format["MenuBasedHack_%1",_targetName]],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
			[[profileName,format["Menu Hack: %1",_targetName]],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
			sleep 0.5;
			SPYGLASS_END
		};
	} foreach _displays;
		
	if(_detection) exitWith {};

	/* A very old menu that can cause false-positives so we close it */
	if(!isNull (findDisplay 129)) then {
		closeDialog 0;
	};
		
	if(!isNull (findDisplay 148)) then {
		sleep 0.5;
		if((lbSize 104)-1 > 3) exitWith {
			[[profileName,steamid,"MenuBasedHack_RscDisplayConfigureControllers"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
			[[profileName,"Menu Hack: RscDisplayConfigureControllers (JME 313)"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
			closeDialog 0;
			SPYGLASS_END
		};
	};
	
	//_display = uiNamespace getVariable ["RscDisplayInsertMarker", displayNull];
	_display = findDisplay 54;
	if(!isNull _display) then {
		{
			if (_x && !isNull _display) exitWith {
				[[profileName,steamid,"MenuBasedHack_RscDisplayInsertMarker"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
				[[profileName,"Menu Hack: RscDisplayInsertMarker"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
				closeDialog 0;
				SPYGLASS_END
			};
		} forEach [
			(toLower ctrlText (_display displayCtrl 1001) != toLower localize "STR_A3_RscDisplayInsertMarker_Title"),
			{if (buttonAction (_display displayCtrl _x) != "") exitWith {true}; false} forEach [1,2]
		];
	};
		
	_display = findDisplay 131;
	if(!isNull _display) then {
		//These shouldn't be here...
		(_display displayCtrl 102) ctrlRemoveAllEventHandlers "LBDblClick";
		(_display displayCtrl 102) ctrlRemoveAllEventHandlers "LBSelChanged";
		
		{
			if (_x && !isNull _display) exitWith {
				[[profileName,steamid,"MenuBasedHack_RscDisplayConfigureAction"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
				[[profileName,"Menu Hack: RscDisplayConfigureAction"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
				closeDialog 0;
				SPYGLASS_END
			};
		} forEach [
			(toLower ctrlText (_display displayCtrl 1000) != toLower localize "STR_A3_RscDisplayConfigureAction_Title"),
			{if (buttonAction (_display displayCtrl _x) != "") exitWith {true}; false} forEach [1,104,105,106,107,108,109]
		];
	};
		
	_display = findDisplay 163;
	if(!isNull _display) then {
		(_display displayCtrl 101) ctrlRemoveAllEventHandlers "LBDblClick";
		(_display displayCtrl 101) ctrlRemoveAllEventHandlers "LBSelChanged";
		
		{
			if (_x && !isNull _display) exitWith {
				[[profileName,steamid,"MenuBasedHack_RscDisplayControlSchemes"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
				[[profileName,"Menu Hack: RscDisplayControlSchemes"],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
				closeDialog 0;
				SPYGLASS_END
			};
		} forEach [
			(toLower ctrlText (_display displayCtrl 1000) != toLower localize "STR_DISP_OPTIONS_SCHEME"),
			{if (buttonAction (_display displayCtrl _x) != "") exitWith {true}; false} forEach [1,2]
		];
	};
	
	/* We'll just move the no-recoil check into this thread. */
	if((unitRecoilCoefficient player) < 1) then {
		[[profileName,steamid,"No_recoil_hack"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
		[[profileName,"No recoil hack"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
		sleep 0.5;
		failMission "SpyGlass";
	};
	
	/*
		Display Validator
		Loops through and makes sure none of the displays were modified..
		
		Checks every 5 minutes.
	*/
	if((time - _timeStamp) > 300) then {
		_timeStamp = time;
		{
			_onLoad = getText(configFile >> (_x select 0) >> "onLoad");
			_onUnload = getText(configFile >> (_x select 0) >> "onUnload");
			if(_onLoad != (_x select 1) OR _onUnload != (_x select 2)) exitWith {
				[[profileName,steamid,format["Modified_Method_%1",_x select 0]],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
				[[profileName,format["Modified Display Method %1 (Memory Edit)",_x select 0]],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
				sleep 0.5;
				SPYGLASS_END
			};
		}
		foreach [
			["RscDisplayMainMap","[""onLoad"",_this,""RscDiary"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""","[""onUnload"",_this,""RscDiary"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""],
			["RscDisplayGetReady","[""onLoad"",_this,""RscDiary"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""","[""onUnload"",_this,""RscDiary"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""],
			["RscDisplayInventory","[""onLoad"",_this,""RscDisplayInventory"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""","[""onUnload"",_this,""RscDisplayInventory"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""],
			["RscDisplayLoadMission","[""onLoad"",_this,""RscDisplayLoading"",'Loading'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""","[""onUnload"",_this,""RscDisplayLoading"",'Loading'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""],
			["RscDisplayInterrupt","[""onLoad"",_this,""RscDisplayInterrupt"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""","[""onUnload"",_this,""RscDisplayInterrupt"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""],
			["RscDisplayOptionsVideo","[""onLoad"",_this,""RscDisplayOptionsVideo"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""","[""onUnload"",_this,""RscDisplayOptionsVideo"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""],
			["RscDisplayOptions","[""onLoad"",_this,""RscDisplayOptions"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""","[""onUnload"",_this,""RscDisplayOptions"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""],
			["RscDisplayAVTerminal","[""onLoad"",_this,""RscDisplayAVTerminal"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""","[""onUnload"",_this,""RscDisplayAVTerminal"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""],
			["RscDisplayConfigureAction","[""onLoad"",_this,""RscDisplayConfigureAction"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""","[""onUnload"",_this,""RscDisplayConfigureAction"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""],
			["RscDisplayConfigureControllers","[""onLoad"",_this,""RscDisplayConfigureControllers"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""","[""onUnload"",_this,""RscDisplayConfigureControllers"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""],
			["RscDisplayControlSchemes","[""onLoad"",_this,""RscDisplayControlSchemes"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""","[""onUnload"",_this,""RscDisplayControlSchemes"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""],
			["RscDisplayCustomizeController","[""onLoad"",_this,""RscDisplayCustomizeController"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""","[""onUnload"",_this,""RscDisplayCustomizeController"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""],
			["RscDisplayDebriefing","[""onLoad"",_this,""RscDisplayDebriefing"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""","[""onUnload"",_this,""RscDisplayDebriefing"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""],
			["RscDisplayDiary","[""onLoad"",_this,""RscDiary"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""","[""onUnload"",_this,""RscDiary"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""],
			["RscDisplayGameOptions","[""onLoad"",_this,""RscDisplayGameOptions"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""","[""onUnload"",_this,""RscDisplayGameOptions"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""],
			["RscDisplayJoystickSchemes","[""onLoad"",_this,""RscDisplayJoystickSchemes"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""","[""onUnload"",_this,""RscDisplayJoystickSchemes"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""],
			["RscDisplayLoading","[""onLoad"",_this,""RscDisplayLoading"",'Loading'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""","[""onUnload"",_this,""RscDisplayLoading"",'Loading'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""],
			["RscDisplayMicSensitivityOptions","[""onLoad"",_this,""RscDisplayMicSensitivityOptions"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""","[""onUnload"",_this,""RscDisplayMicSensitivityOptions"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""],
			["RscDisplayOptionsAudio","[""onLoad"",_this,""RscDisplayOptionsAudio"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""","[""onUnload"",_this,""RscDisplayOptionsAudio"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""],
			["RscDisplayOptionsLayout","[""onLoad"",_this,""RscDisplayOptionsLayout"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""","[""onUnload"",_this,""RscDisplayOptionsLayout"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""],
			["RscDisplayStart","[""onLoad"",_this,""RscDisplayLoading"",'Loading'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""","[""onUnload"",_this,""RscDisplayLoading"",'Loading'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""],
			["RscDisplayVehicleMsgBox","[""onLoad"",_this,""RscDisplayVehicleMsgBox"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""","[""onUnload"",_this,""RscDisplayVehicleMsgBox"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""],
			["RscDisplayInsertMarker","[""onLoad"",_this,""RscDisplayInsertMarker"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""","[""onUnload"",_this,""RscDisplayInsertMarker"",'GUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""]
		];
	};
		
	uiSleep 1;
};