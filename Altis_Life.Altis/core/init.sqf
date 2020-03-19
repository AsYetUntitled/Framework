#include "..\script_macros.hpp"
/*
    File: init.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Master client initialization file
*/
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting Altis Life Client Init ----------------------------------";
diag_log format["------------------------------------------ Version %1 -------------------------------------------",(LIFE_SETTINGS(getText,"framework_version"))];
diag_log "----------------------------------------------------------------------------------------------------";

0 cutText[localize "STR_Init_ClientSetup","BLACK FADED",99999999];
_timeStamp = diag_tickTime;

waitUntil {!isNull (findDisplay 46)};
[] call compile preprocessFileLineNumbers "core\clientValidator.sqf";
enableSentences false;

diag_log "[Life Client] Initialization Variables";
[] call compile preprocessFileLineNumbers "core\configuration.sqf";
diag_log "[Life Client] Variables initialized";

diag_log "[Life Client] Setting up Eventhandlers";
[] call life_fnc_setupEVH;
diag_log "[Life Client] Eventhandlers completed";

diag_log "[Life Client] Setting up user actions";
[] call life_fnc_setupActions;
diag_log "[Life Client] User actions completed";

diag_log "[Life Client] Waiting for the server to be ready...";
waitUntil {!isNil "life_server_isReady" && {!isNil "life_server_extDB_notLoaded"}};

if (life_server_extDB_notLoaded) exitWith {
    0 cutText [localize "STR_Init_ExtdbFail","BLACK FADED",99999999];
};

waitUntil {life_server_isReady};
diag_log "[Life Client] Server loading completed ";
0 cutText [localize "STR_Init_ServerReady","BLACK FADED",99999999];

[] call SOCK_fnc_dataQuery;
waitUntil {life_session_completed};
0 cutText[localize "STR_Init_ClientFinish","BLACK FADED",99999999];

switch (playerSide) do {
    case west: {
        life_paycheck = LIFE_SETTINGS(getNumber,"paycheck_cop");
        [] call life_fnc_initCop;
    };
    case civilian: {
        life_paycheck = LIFE_SETTINGS(getNumber,"paycheck_civ");
        [] call life_fnc_initCiv;
        (group player) deleteGroupWhenEmpty true;
    };
    case independent: {
        life_paycheck = LIFE_SETTINGS(getNumber,"paycheck_med");
        [] call life_fnc_initMedic;
    };
};
CONSTVAR(life_paycheck);

player setVariable ["restrained", false, true];
player setVariable ["Escorting", false, true];
player setVariable ["transporting", false, true];
player setVariable ["playerSurrender", false, true];
player setVariable ["realname", profileName, true];

diag_log "[Life Client] Past Settings Init";

(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
[player, life_settings_enableSidechannel, playerSide] remoteExecCall ["TON_fnc_manageSC", RSERV];

[] spawn life_fnc_survival;

0 cutText ["","BLACK IN"];

if (profileNamespace getVariable ["life_settings_revealObjects",true]) then {
    LIFE_ID_PlayerTags = addMissionEventHandler ["EachFrame", life_fnc_playerTags];
};
if (profileNamespace getVariable ["life_settings_revealObjects",true]) then {
    LIFE_ID_RevealObjects = addMissionEventHandler ["EachFrame", life_fnc_revealObjects];
};

if (LIFE_SETTINGS(getNumber,"enable_fatigue") isEqualTo 0) then {player enableFatigue false;};
if (LIFE_SETTINGS(getNumber,"pump_service") isEqualTo 1) then {
    [] execVM "core\fn_setupStationService.sqf";
};

life_fnc_RequestClientId = player;
publicVariableServer "life_fnc_RequestClientId";

/*
    https://feedback.bistudio.com/T117205 - disableChannels settings cease to work when leaving/rejoining mission
    Universal workaround for usage in a preInit function. - AgentRev
    Remove if Bohemia actually fixes the issue.
*/
{
    _x params [["_chan",-1,[0]], ["_noText","false",[""]], ["_noVoice","false",[""]]];

    _noText = [false,true] select ((["false","true"] find toLower _noText) max 0);
    _noVoice = [false,true] select ((["false","true"] find toLower _noVoice) max 0);

    _chan enableChannel [!_noText, !_noVoice];

} forEach getArray (missionConfigFile >> "disableChannels");

if (life_HC_isActive) then {
    [getPlayerUID player, player getVariable ["realname", name player]] remoteExec ["HC_fnc_wantedProfUpdate", HC_Life];
} else {
    [getPlayerUID player, player getVariable ["realname", name player]] remoteExec ["life_fnc_wantedProfUpdate", RSERV];
};

[] call life_fnc_hudUpdate;

diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["               End of Altis Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime - _timeStamp)];
diag_log "----------------------------------------------------------------------------------------------------";
