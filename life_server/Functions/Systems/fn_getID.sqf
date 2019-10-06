#include "\life_server\script_macros.hpp"
/*
    File: fn_getID.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Used for the admin menu returns the player ID for in-game bans/kicks.
    https://community.bistudio.com/wiki/Multiplayer_Server_Commands
*/
[owner (_this select 0)] remoteExecCall ["life_fnc_adminID",owner (_this select 1)];