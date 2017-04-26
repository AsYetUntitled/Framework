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
if (!isNull _unit && {!isNull _source} && {player isEqualTo _unit} && {!(player isEqualTo _source)}) then {
    if ((side _source) isEqualTo west) then {
        if (currentWeapon _source in ["hgun_P07_snds_F","arifle_SDAR_F"] && _projectile in ["B_9x21_Ball","B_556x45_dual"]) then {
            if (_part isEqualTo "") then { 
                _damage = (damage player);
            }else{
                _damage = (player getHit _part);
            };
            if (playerSide isEqualTo civilian || {playerSide isEqualTo east}) then {
                if (alive player && {!life_istazed} && {!life_isknocked} && {!(player getVariable ["restrained",false])}) then {
                    private _distance = 35;
                    if (_projectile isEqualTo "B_556x45_dual") then {_distance = 100;};
                    if (_distance >= (player distance _source)) then {
                        if (!isNull (objectParent player)) then {
                            if (typeOf (vehicle player) isEqualTo "B_Quadbike_01_F") then {
                                player action ["Eject",vehicle player];
                                [player,_source] spawn life_fnc_tazed;
                            };
                        } else {
                            [player,_source] spawn life_fnc_tazed;
                        };
                    };
                };
            };
        };
    };
};

[] spawn life_fnc_hudUpdate;
_damage;
