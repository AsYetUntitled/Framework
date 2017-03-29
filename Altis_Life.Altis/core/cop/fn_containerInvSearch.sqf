#include "..\..\script_macros.hpp"
/*
    File: fn_containerInvSearch.sqf
    Author: NiiRoZz
    Inspired : Bryan "Tonic" Boardwine

    Description:
    Searches the container for illegal items.
*/

params [
    ["_container", objNull, [objNull]]
];

if (isNull _container) exitWith {};

private _containerInfo = _container getVariable ["Trunk",[]];
if (count _containerInfo isEqualTo 0) exitWith {hint localize "STR_Cop_ContainerEmpty"};

private _value = 0;
private _illegalValue = 0;
{
    _x params ["_var", "_val"];

    private _isIllegalItem = M_CONFIG(getNumber,"VirtualItems",_var,"illegal");
    if (_isIllegalItem isEqualTo 1) then {
        private _illegalPrice = M_CONFIG(getNumber,"VirtualItems",_var,"sellPrice");
        if (!isNull (missionConfigFile >> "VirtualItems" >> _var >> "processedItem")) then {
            private _illegalItemProcessed = M_CONFIG(getText,"VirtualItems",_var,"processedItem");
            _illegalPrice = M_CONFIG(getNumber,"VirtualItems",_illegalItemProcessed,"sellPrice");
        };

        _illegalValue = _illegalValue + (round(_val * _illegalPrice / 2));
    };
    true
} count (_containerInfo select 0);

_value = _illegalValue;

if (_value > 0) then {
    [0,"STR_NOTF_ContainerContraband",true,[[_value] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
    BANK = BANK + _value;
    [1] call SOCK_fnc_updatePartial;
    _container setVariable ["Trunk",[[],0],true];
    [_container] remoteExecCall ["TON_fnc_updateHouseTrunk",2];
} else {
    hint localize "STR_Cop_NoIllegalContainer";
};
