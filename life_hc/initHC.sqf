#include "hc_macros.hpp"
/*
    File: fn_initHC.sqf
    Author: Nanou

    Description:
    Initialize the headless client.
*/
private "_timeStamp";
if (EXTDB_SETTING(getNumber,"HeadlessSupport") isEqualTo 0) exitWith {};

[] execVM "\life_hc\KRON_Strings.sqf";

life_HC_server_extDB_notLoaded = "";

life_save_civilian_position = if (LIFE_SETTINGS(getNumber,"save_civilian_position") isEqualTo 0) then {false} else {true};

if (isNil {uiNamespace getVariable "life_sql_id"}) then {
    life_sql_id = round(random(9999));
    CONSTVAR(life_sql_id);
    uiNamespace setVariable ["life_sql_id",life_sql_id];

    try {
        _result = EXTDB format ["9:ADD_DATABASE:%1",EXTDB_SETTING(getText,"DatabaseName")];
        if (!(_result isEqualTo "[1]")) then {throw "extDB2: Error with Database Connection"};
        _result = EXTDB format ["9:ADD_DATABASE_PROTOCOL:%2:SQL_RAW_V2:%1:ADD_QUOTES",FETCH_CONST(life_sql_id),EXTDB_SETTING(getText,"DatabaseName")];
        if (!(_result isEqualTo "[1]")) then {throw "extDB2: Error with Database Connection"};
    } catch {
        diag_log _exception;
        life_HC_server_extDB_notLoaded = [true, _exception];
    };

    publicVariable "life_HC_server_extDB_notLoaded";
    if (life_HC_server_extDB_notLoaded isEqualType []) exitWith {};
    EXTDB "9:LOCK";
    diag_log "extDB2: Connected to Database";
} else {
    life_sql_id = uiNamespace getVariable "life_sql_id";
    CONSTVAR(life_sql_id);
    diag_log "extDB2: Still Connected to Database";
};

if (life_HC_server_extDB_notLoaded isEqualType []) then {
    [] spawn {
        for "_i" from 0 to 1 step 0 do {
            [0,"There is a problem with the Headless Client, please contact an administrator."] remoteExecCall ["life_fnc_broadcast",RCLIENT];
            sleep 120;
        };
    };
};

if (life_HC_server_extDB_notLoaded isEqualType []) exitWith {}; //extDB2-HC did not fully initialize so terminate the rest of the initialization process.

[] spawn {
    for "_i" from 0 to 1 step 0 do {
        publicVariableServer "serv_sv_use";
        uiSleep 60;
    };
};

["CALL resetLifeVehicles",1] call HC_fnc_asyncCall;
["CALL deleteDeadVehicles",1] call HC_fnc_asyncCall;
["CALL deleteOldHouses",1] call HC_fnc_asyncCall;
["CALL deleteOldGangs",1] call HC_fnc_asyncCall;

_timeStamp = diag_tickTime;
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "------------------------------------ Starting Altis Life HC Init -----------------------------------";
diag_log "-------------------------------------------- Version 4.5 -----------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";

[] execFSM "\life_hc\FSM\cleanup.fsm";

[] spawn HC_fnc_cleanup;

/* Initialize hunting zone(s) */
["hunting_zone",30] spawn HC_fnc_huntingZone;

// A list of allowed funcs to be passed on the hc (by external sources)
// Have to be written in only lower capitals
HC_MPAllowedFuncs = [
    "hc_fnc_insertrequest",
    "hc_fnc_insertvehicle",
    "hc_fnc_queryrequest",
    "hc_fnc_updatepartial",
    "hc_fnc_updaterequest",
    "hc_fnc_cleanup",
    "hc_fnc_huntingzone",
    "hc_fnc_setplaytime",
    "hc_fnc_getplaytime",
    "hc_fnc_insertgang",
    "hc_fnc_queryplayergang",
    "hc_fnc_removegang",
    "hc_fnc_updategang",
    "hc_fnc_addcontainer",
    "hc_fnc_addhouse",
    "hc_fnc_deletedbcontainer",
    "hc_fnc_fetchplayerhouses",
    "hc_fnc_housecleanup",
    "hc_fnc_sellhouse",
    "hc_fnc_sellhousecontainer",
    "hc_fnc_updatehousecontainers",
    "hc_fnc_updatehousetrunk",
    "hc_fnc_keymanagement",
    "hc_fnc_vehiclecreate",
    "hc_fnc_spawnvehicle",
    "hc_fnc_vehiclestore",
    "hc_fnc_chopshopsell",
    "hc_fnc_getvehicles",
    "hc_fnc_vehicledelete",
    "hc_fnc_vehicleupdate",
    "hc_fnc_jailsys",
    "hc_fnc_spikestrip",
    "hc_fnc_wantedadd",
    "hc_fnc_wantedbounty",
    "hc_fnc_wantedcrimes",
    "hc_fnc_wantedfetch",
    "hc_fnc_wantedperson",
    "hc_fnc_wantedprofupdate",
    "hc_fnc_wantedremove"
];

CONSTVAR(HC_MPAllowedFuncs);

life_HC_isActive = true;
publicVariable "life_HC_isActive";
life_HC_server_isReady = true;
publicVariable "life_HC_server_isReady";
diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["                 End of Altis Life HC Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";
