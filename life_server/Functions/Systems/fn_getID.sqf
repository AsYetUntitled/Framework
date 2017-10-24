/*
    File: fn_getID.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Used for the admin menu returns the player ID for in-game bans/kicks.
    https://community.bistudio.com/wiki/Multiplayer_Server_Commands
*/
params [
    ["_id",objNull,[objNull]],
    ["_ret",objNull,[objNull]]
];
_id = owner _id;
_ret = owner _ret;

[_id] remoteExecCall ["life_fnc_adminID",_ret];
