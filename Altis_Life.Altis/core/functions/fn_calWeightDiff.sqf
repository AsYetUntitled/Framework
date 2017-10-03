#include "..\..\script_macros.hpp"
/*
    File: fn_calWeightDiff.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Calculates weight differences in the _cWeight (current Weight) against the _mWeight (Max Weight)
    Multiple purpose system for this life mission.
*/
params [
    ["_item","",[""]],
    ["_value",-1,[0]],
    ["_cWeight",-1,[0]],
    ["_mWeight",-1,[0]]
];

if (_item isEqualTo "" || _value isEqualTo -1 || _cWeight isEqualTo -1 || _mWeight isEqualTo -1) exitWith {};
private _weight = ([_item] call life_fnc_itemWeight) * _value;
private _sum = _value;

if ((_cWeight + _weight) > _mWeight) then {
    for "_i" from 0 to 1 step 0 do {
        _sum = _sum - 1;
        if (_sum < 1) exitWith {};
        _weight = ([_item] call life_fnc_itemweight) * _sum;
        if ((_cWeight + _weight) <= _mWeight) exitWith {};
    };
};

_sum;
