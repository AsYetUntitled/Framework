#include "..\..\script_macros.hpp"
/*
    File: fn_handleInv.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Do I really need one?
*/
private ["_return","_diff"];
params [
    ["_math",false,[false]]; //true = add; false = SUB;
    ["_item","",[""]]; //The item we are using to add or remove.
    ["_num",0,[0]]; //Number of items to add or remove.
];
if (_item isEqualTo "" || _num isEqualTo 0) exitWith {false};

private _var = ITEM_VARNAME(_item);

if (_math) then {
    _diff = [_item,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
    _num = _diff;
    if (_num <= 0) exitWith {false};
};
private _weight = ([_item] call life_fnc_itemWeight) * _num;
private _value = ITEM_VALUE(_item);

if (_math) then {
    //Lets add!
    if ((life_carryWeight + _weight) <= life_maxWeight) then {
        missionNamespace setVariable [_var,(_value + _num)];

        if ((missionNamespace getVariable _var) > _value) then {
            life_carryWeight = life_carryWeight + _weight;
            _return = true;
        } else {
            _return = false;
        };
    } else {_return = false;};
} else {
    //Lets SUB!
    if ((_value - _num) < 0) then { _return = false;} else {
        missionNamespace setVariable [_var,(_value - _num)];

        if ((missionNamespace getVariable _var) < _value) then {
            life_carryWeight = life_carryWeight - _weight;
            _return = true;
        } else {_return = false;};
    };
};

_return;
