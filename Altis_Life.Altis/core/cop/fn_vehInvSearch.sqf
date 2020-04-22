#include "..\..\script_macros.hpp"
/*
    File: fn_vehInvSearch.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Searches the vehicle for illegal items.
*/

private _vehicle = cursorObject;
private _typeList = ["Air","Ship","LandVehicle"];

if (isNull _vehicle || {!(KINDOF_ARRAY(_vehicle, _typeList))}) exitWith {};

private _vehicleInfo = _vehicle getVariable ["Trunk",[]];
if (_vehicleInfo isEqualTo []) exitWith {hint localize "STR_Cop_VehEmpty"};
_vehicleInfo params ["_items"];

private _value = 0;
private _illegalValue = 0;
{
    _x params ["_var", "_val"];
    private _isIllegalItem = M_CONFIG(getNumber,"VirtualItems",_var,"illegal");
    if (_isIllegalItem isEqualTo 1) then {
        private _illegalPrice = M_CONFIG(getNumber,"VirtualItems",_var,"sellPrice");
        if !(isNull (missionConfigFile >> "VirtualItems" >> _var >> "processedItem")) then {
            private _illegalItemProcessed = M_CONFIG(getText,"VirtualItems",_var,"processedItem");
            _illegalPrice = M_CONFIG(getNumber,"VirtualItems",_illegalItemProcessed,"sellPrice");
        };

        _illegalValue = _illegalValue + round(_val * _illegalPrice / 2);
    };
    true
} count _items;

if (_illegalValue > 0) then {
    [0, "STR_NOTF_VehContraband", true, [[_illegalValue] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast", RCLIENT];
    BANK = BANK + _illegalValue;
    [1] call SOCK_fnc_updatePartial;
    _vehicle setVariable ["Trunk", [[],0], true];
} else {
    hint localize "STR_Cop_NoIllegalVeh";
};
