#include "..\script_macros.hpp"
/*
    File: fn_menuCheck.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Checks for known cheat menus and closes them then reports them to the server.
*/
private ["_displays","_detection","_display","_timeStamp"];
disableSerialization;

_displays = [
    [3030,"BIS_configviewer_display"],["RscDisplayMultiplayer","RscDisplayMultiplayer"],[162,"RscDisplayFieldManual"],["RscDisplayRemoteMissions","RscDisplayRemoteMissions"],[125,"RscDisplayEditDiaryRecord"],
    [69,"UnknownDisplay"],[19,"UnknownDisplay"],[71,"UnknownDisplay"],[45,"UnknownDisplay"],[132,"UnknownDisplay"],[32,"UnknownDisplay"],[165,"RscDisplayPublishMission"],[2727,"RscDisplayLocWeaponInfo"],
    ["RscDisplayMovieInterrupt","RscDisplayMovieInterrupt"],[157,"UnknownDisplay"],[30,"UnknownDisplay"],["RscDisplayArsenal","RscDisplayArsenal"],[166,"RscDisplayPublishMissionSelectTags"],[167,"RscDisplayFileSelect"]
];

_detection = false;
_timeStamp = time;
for "_i" from 0 to 1 step 0 do {
    {
        _targetDisplay = _x select 0;
        _targetName = _x select 1;
        switch (typeName _targetDisplay) do {
            case ("STRING"): {if (!isNull (uiNamespace getVariable [_targetDisplay,displayNull])) exitWith {_detection = true;};};
            default {if (!isNull (findDisplay _targetDisplay)) exitWith {_detection = true;};};
        };

        if (_detection) exitWith {
            [profileName,getPlayerUID player,format ["MenuBasedHack_%1",_targetName]] remoteExecCall ["SPY_fnc_cookieJar",RSERV];
            [profileName,format ["Menu Hack: %1",_targetName]] remoteExecCall ["SPY_fnc_notifyAdmins",RCLIENT];
            sleep 0.5;
            SPYGLASS_END
        };
    } forEach _displays;

    if (_detection) exitWith {};

    /* A very old menu that can cause false-positives so we close it */
    if (!isNull (findDisplay 129)) then {
        closeDialog 0;
    };

    /* Check to see if RscDisplayInventory has more controls then it should */
    _display = findDisplay 602;
    if (!isNull _display && {count (allControls _display) > 87}) then {
        _count = count allControls _display;
        [profileName,getPlayerUID player,format ["MenuBasedHack_RscDisplayInventory_Controls_%1",_count]] remoteExecCall ["SPY_fnc_cookieJar",RSERV];
        [profileName,format ["Menu Hack: RscDisplayInventory number of controls do not match (Count %1)",_count]] remoteExecCall ["SPY_fnc_notifyAdmins",RCLIENT];
        closeDialog 0;
        SPYGLASS_END
    };

    if (!isNull (findDisplay 148)) then {
        sleep 0.5;
        if ((lbSize 104)-1 > 3) exitWith {
            [profileName,getPlayerUID player,"MenuBasedHack_RscDisplayConfigureControllers"] remoteExecCall ["SPY_fnc_cookieJar",RSERV];
            [profileName,"Menu Hack: RscDisplayConfigureControllers (JME 313)"] remoteExecCall ["SPY_fnc_notifyAdmins",RCLIENT];
            closeDialog 0;
            SPYGLASS_END
        };
    };

    _display = findDisplay 54;
    if (!isNull _display) then {
        {
            if (_x && !isNull _display) exitWith {
                [profileName,getPlayerUID player,"MenuBasedHack_RscDisplayInsertMarker"] remoteExecCall ["SPY_fnc_cookieJar",RSERV];
                [profileName,"Menu Hack: RscDisplayInsertMarker"] remoteExecCall ["SPY_fnc_notifyAdmins",RCLIENT];
                closeDialog 0;
                SPYGLASS_END
            };
        } forEach [
            (toLower ctrlText (_display displayCtrl 1001) != toLower localize "STR_A3_RscDisplayInsertMarker_Title"),
            {if (buttonAction (_display displayCtrl _x) != "") exitWith {true}; false} forEach [1,2]
        ];
    };

    _display = findDisplay 131;
    if (!isNull _display) then {
        //These shouldn't be here...
        (_display displayCtrl 102) ctrlRemoveAllEventHandlers "LBDblClick";
        (_display displayCtrl 102) ctrlRemoveAllEventHandlers "LBSelChanged";

        {
            if (_x && !isNull _display) exitWith {
                [profileName,getPlayerUID player,"MenuBasedHack_RscDisplayConfigureAction"] remoteExecCall ["SPY_fnc_cookieJar",RSERV];
                [profileName,"Menu Hack: RscDisplayConfigureAction"] remoteExecCall ["SPY_fnc_notifyAdmins",RCLIENT];
                closeDialog 0;
                SPYGLASS_END
            };
        } forEach [
            (toLower ctrlText (_display displayCtrl 1000) != toLower localize "STR_A3_RscDisplayConfigureAction_Title"),
            {if (buttonAction (_display displayCtrl _x) != "") exitWith {true}; false} forEach [1,104,105,106,107,108,109]
        ];
    };

    _display = findDisplay 163;
    if (!isNull _display) then {
        (_display displayCtrl 101) ctrlRemoveAllEventHandlers "LBDblClick";
        (_display displayCtrl 101) ctrlRemoveAllEventHandlers "LBSelChanged";

        {
            if (_x && !isNull _display) exitWith {
                [profileName,getPlayerUID player,"MenuBasedHack_RscDisplayControlSchemes"] remoteExecCall ["SPY_fnc_cookieJar",RSERV];
                [profileName,"Menu Hack: RscDisplayControlSchemes"] remoteExecCall ["SPY_fnc_notifyAdmins",RCLIENT];
                closeDialog 0;
                SPYGLASS_END
            };
        } forEach [
            (toLower ctrlText (_display displayCtrl 1000) != toLower localize "STR_DISP_OPTIONS_SCHEME"),
            {if (buttonAction (_display displayCtrl _x) != "") exitWith {true}; false} forEach [1,2]
        ];
    };

    _display = findDisplay 316000;
    if (!isNull _display && !isNil "life_admin_debug" && !life_admin_debug) exitWith {
        [profileName,getPlayerUID player,"MenuBasedHack_RscDisplayDebugPublic"] remoteExecCall ["SPY_fnc_cookieJar",RSERV];
        [profileName,"Menu Hack: RscDisplayDebugPublic"] remoteExecCall ["SPY_fnc_notifyAdmins",RCLIENT];
        closeDialog 0;
        SPYGLASS_END
    };

    /* We'll just move the no-recoil check into this thread. */
    if ((unitRecoilCoefficient player) < 1) then {
        [profileName,getPlayerUID player,"No_recoil_hack"] remoteExec ["SPY_fnc_cookieJar",RSERV];
        [profileName,"No recoil hack"] remoteExec ["SPY_fnc_notifyAdmins",RCLIENT];
        sleep 0.5;
        failMission "SpyGlass";
    };

    /*
        Display Validator
        Loops through and makes sure none of the displays were modified..

        Checks every 5 minutes.
    */
    if ((time - _timeStamp) > 300) then {
        _timeStamp = time;
        {
            _onLoad = getText(configFile >> (_x select 0) >> "onLoad");
            _onUnload = getText(configFile >> (_x select 0) >> "onUnload");
            if (_onLoad != _x select 1 || _onUnload != _x select 2) exitWith {
                [profileName,getPlayerUID player,format ["Modified_Method_%1",_x select 0]] remoteExecCall ["SPY_fnc_cookieJar",RSERV];
                [profileName,format ["Modified Display Method %1 (Memory Edit)",_x select 0]] remoteExecCall ["SPY_fnc_notifyAdmins",RCLIENT];
                sleep 0.5;
                SPYGLASS_END
            };
        }
        forEach [
            ["RscDisplayMainMap","[""onLoad"",_this,""RscDiary"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDiary"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
            ["RscDisplayGetReady","[""onLoad"",_this,""RscDiary"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDiary"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
            ["RscDisplayInventory","[""onLoad"",_this,""RscDisplayInventory"",'IGUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayInventory"",'IGUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
            ["RscDisplayLoadMission","[""onLoad"",_this,""RscDisplayLoading"",'3DENDisplaysTemp'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayLoading"",'3DENDisplaysTemp'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
            ["RscDisplayInterrupt","[""onLoad"",_this,""RscDisplayInterrupt"",'3DENDisplaysTemp'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayInterrupt"",'3DENDisplaysTemp'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
            ["RscDisplayOptionsVideo","[""onLoad"",_this,""RscDisplayOptionsVideo"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayOptionsVideo"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
            ["RscDisplayOptions","[""onLoad"",_this,""RscDisplayOptions"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayOptions"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
            ["RscDisplayAVTerminal","[""onLoad"",_this,""RscDisplayAVTerminal"",'IGUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayAVTerminal"",'IGUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
            ["RscDisplayConfigureAction","[""onLoad"",_this,""RscDisplayConfigureAction"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayConfigureAction"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
            ["RscDisplayConfigureControllers","[""onLoad"",_this,""RscDisplayConfigureControllers"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayConfigureControllers"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
            ["RscDisplayControlSchemes","[""onLoad"",_this,""RscDisplayControlSchemes"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayControlSchemes"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
            ["RscDisplayCustomizeController","[""onLoad"",_this,""RscDisplayCustomizeController"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayCustomizeController"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
            ["RscDisplayDebriefing","[""onLoad"",_this,""RscDisplayDebriefing"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayDebriefing"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
            ["RscDisplayDiary","[""onLoad"",_this,""RscDiary"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDiary"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
            ["RscDisplayGameOptions","[""onLoad"",_this,""RscDisplayGameOptions"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayGameOptions"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
            ["RscDisplayJoystickSchemes","[""onLoad"",_this,""RscDisplayJoystickSchemes"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayJoystickSchemes"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
            ["RscDisplayLoading","[""onLoad"",_this,""RscDisplayLoading"",'3DENDisplaysTemp'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayLoading"",'3DENDisplaysTemp'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
            ["RscDisplayMicSensitivityOptions","[""onLoad"",_this,""RscDisplayMicSensitivityOptions"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayMicSensitivityOptions"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
            ["RscDisplayOptionsAudio","[""onLoad"",_this,""RscDisplayOptionsAudio"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayOptionsAudio"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
            ["RscDisplayOptionsLayout","[""onLoad"",_this,""RscDisplayOptionsLayout"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayOptionsLayout"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
            ["RscDisplayStart","[2] call compile preprocessFileLineNumbers getText (configfile >> 'CfgFunctions' >> 'init'); ['onLoad',_this,'RscDisplayLoading','Loading'] call (uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayLoading"",'3DENDisplaysTemp'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
            ["RscDisplayInsertMarker","[""onLoad"",_this,""RscDisplayInsertMarker"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayInsertMarker"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"]
        ];
    };
    uiSleep 1;
};
