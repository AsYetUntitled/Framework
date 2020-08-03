/*
    Author: Nanou
    File: fn_initHC.sqf

    Description:
    Written for Altis Life RPG.
*/

HC_UID = nil;

// JIP integration of an hc
"life_HC_isActive" addPublicVariableEventHandler {
    if (_this select 1) then {
        HC_UID = getPlayerUID hc_1;
        HC_Life = owner hc_1;
        publicVariable "HC_Life";
        HC_Life publicVariableClient "serv_sv_use";
        terminate cleanup;
        terminate aiSpawn;
        [true] call TON_fnc_transferOwnership;
        HC_Life publicVariableClient "animals";
        diag_log "Headless client is connected and ready to work!";
    };
};

HC_DC = addMissionEventHandler ["PlayerDisconnected",
    {
        if (!isNil "HC_UID" && {_uid == HC_UID}) then {
            life_HC_isActive = false;
            publicVariable "life_HC_isActive";
            HC_Life = false;
            publicVariable "HC_Life";
            cleanup = [] spawn TON_fnc_cleanup;
            [false] call TON_fnc_transferOwnership;
            aiSpawn = ["hunting_zone",30] spawn TON_fnc_huntingZone;
            diag_log "Headless client disconnected! Broadcasted the vars!";
            diag_log "Ready for receiving queries on the server machine.";
        };
    }
];
