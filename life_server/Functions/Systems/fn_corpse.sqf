/*
    File: fn_cleanupRequest.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Client sends a cleanup request when they hit Abort,
    the server will then monitor when that client aborts and
    delete the weapon holders.
*/
params [
    "_uid",
    "_corpse",
    "_action"    
];

if (_action) then {
    server_corpses pushBack [_uid,_corpse]
} else {
    {
        _x params ["_corpseuid"];
        if (_corpseuid isEqualTo _uid) exitWith {
            server_corpses deleteAt _forEachIndex;
        };
    } forEach server_corpses;   
};