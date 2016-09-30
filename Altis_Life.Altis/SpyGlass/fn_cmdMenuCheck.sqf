#include "..\script_macros.hpp"
/*
    File: fn_cmdMenuCheck.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Checks to see which commandingMenu is currently active,
    if a non white-listed menu is active it will close it and report it
    to the server and active admins.
*/
private ["_validMenus", "_lastMenu"];
_validMenus = [
    "RscMainMenu", "RscMoveHigh", "#WATCH", "#WATCH0", "RscWatchDir", "RscWatchMoveDir", "#GETIN", "#RscStatus", "RscCallSupport", "#ACTION",
    "RscCombatMode", "RscFormations", "RscTeam", "RscSelectTeam", "RscReply", "#User:BIS_Menu_GroupCommunication", "#CUSTOM_RADIO",
    "RscRadio", "RscGroupRootMenu", "RscMenuReply", "RscMenuStatus", "", "#User:BIS_fnc_addCommMenuItem_menu", "RscMenuMove", "RscMenuFormations"
];

_lastMenu = "";
for "_i" from 0 to 1 step 0 do {
    waitUntil {commandingMenu != _lastMenu};
    _lastMenu = commandingMenu;

    if (!(commandingMenu in _validMenus)) then {
        [profileName, getPlayerUID player, _lastMenu] remoteExecCall ["SPY_fnc_observe", RSERV];
        [[0,1],format [localize "STR_SpyDetect_cmdMenuCheck", profileName, _lastMenu]] remoteExecCall ["life_fnc_broadcast", RCLIENT];
        showCommandingMenu "";
    };
};
