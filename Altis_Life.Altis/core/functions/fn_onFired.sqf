#include "..\..\script_macros.hpp"
/*
    File: fn_onFired.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Handles various different ammo types being fired.
*/
params [
    "",
    "",
    "",
    "",
    ["_ammoType","",[""]],
    "",
    ["_projectile",objNull,[objNull]]
];

if (_ammoType isEqualTo "GrenadeHand_stone") then {
    [_projectile] spawn {
        params [
            ["_projectile",objNull,[objNull]]
        ];
        private "_position";
        while {!isNull _projectile} do {
            _position = ASLtoATL (visiblePositionASL _projectile);
            sleep 0.1;
        };
        [_position] remoteExec ["life_fnc_flashbang",RCLIENT];
    };
};
