#include "..\..\script_macros.hpp"
/*
    File: fn_freezePlayer.sqf
    Author: ColinM9991

    Description:
    Freezes selected player.
*/
params [
    ["_admin",objNull,[objNull]];
];

if (life_frozen) then {
    hint localize "STR_NOTF_Unfrozen";
    [1,format [localize "STR_ANOTF_Unfrozen",profileName]] remoteExecCall ["life_fnc_broadcast",_admin];
    disableUserInput false;
    life_frozen = false;
} else {
    hint localize "STR_NOTF_Frozen";
    [1,format [localize "STR_ANOTF_Frozen",profileName]] remoteExecCall ["life_fnc_broadcast",_admin];
    disableUserInput true;
    life_frozen = true;
};
