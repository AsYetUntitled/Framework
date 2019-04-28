#include "script_macros.hpp"
/*
    File: initPlayerServer.sqf
    Author:

    Description:
    Executed only on server when a player joins mission.
*/
if (LIFE_SETTINGS(getNumber,"player_deathLog") isEqualTo 0) exitWith {};
_this select 0 addMPEventHandler ["MPKilled", {_this call fn_whoDoneIt}];
