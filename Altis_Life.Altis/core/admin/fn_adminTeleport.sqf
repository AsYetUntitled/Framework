#include "..\..\script_macros.hpp"
/*
    File: fn_adminTeleport.sqf
    Author: ColinM9991
    Credits: To original script author(s)
    Description:
    Teleport to chosen position.
*/
if (FETCH_CONST(life_adminlevel) < 3) exitWith {closeDialog 0;};

closeDialog 0;

openMap [true, false];
onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call life_fnc_teleport";