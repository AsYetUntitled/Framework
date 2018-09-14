#include "..\..\script_macros.hpp"
/*
    File: fn_handleDamage.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
params [
    ["_unit",objNull,[objNull]],
    ["_part","",[""]],
    ["_damage",0,[0]],
    ["_source",objNull,[objNull]],
    ["_projectile","",[""]],
    ["_index",0,[0]]
];

//Handle the tazer first (Top-Priority).
if (!isNull _source && {_source != _unit}) then {
    if (side _source isEqualTo west) then {
        if (currentWeapon _source in ["hgun_P07_snds_F","arifle_SDAR_F"] && _projectile in ["B_9x21_Ball","B_556x45_dual"]) then {
            if (playerSide isEqualTo civilian) then {
                private _distance = 35;
                if (_projectile == "B_556x45_dual") then {_distance = 100};
                if (_unit distance _source < _distance) then {
                    if !(isNull objectParent _unit) then {
                        if (typeOf (vehicle _unit) isEqualTo "B_Quadbike_01_F") then {
                            _unit action ["Eject",vehicle _unit];
                            [_unit,_source] spawn life_fnc_tazed;
                        };
                    } else {
                        [_unit,_source] spawn life_fnc_tazed;
                    };
                };
            };
            _damage = false;
        };
    };
};

[] spawn life_fnc_hudUpdate;
_damage;