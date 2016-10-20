#include "..\..\script_macros.hpp"
/*
    Author: Daniel Stuart
    File: fn_vCustomPrice.sqf

    Description:
    Checks if the vehicle has a custom price in its shop, and return if it does.

    Parameter(s):
        0: STRING - Vehicle Class
        1: STRING - Vehicle Shop

    Returns:
    NUMBER
*/
private ["_array","_index","_price"];
params [
    ["_class","",[""]],
    ["_shop","",[""]]
];
_return = -1;

if (!(_shop isEqualTo "" || _class isEqualTo "")) then {
    if (isClass (missionConfigFile >> "CarShops" >> _shop)) then {
        _array = M_CONFIG(getArray,"CarShops",_shop,"vehicles");
        _index = [_class,_array] call life_fnc_getIndex;
        if (!(_index isEqualTo -1)) then {
            _price = (_array select _index) select 1;
                _return = _price;
        };
    };
};

_return;
