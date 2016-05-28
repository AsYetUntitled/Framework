#include "..\..\script_macros.hpp"
/*
    File: fn_containerInvSearch.sqf
    Author: NiiRoZz
    Inspired : Bryan "Tonic" Boardwine

    Description:
    Searches the container for illegal items.
*/
private["_container","_containerInfo","_value"];
_container = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (isNull _container) exitWith {};

_containerInfo = _container getVariable ["Trunk",[]];
if (count _containerInfo isEqualTo 0) exitWith {hint localize "STR_Cop_ContainerEmpty"};

_value = 0;
_illegalValue = 0;
{
    _var = _x select 0;
    _val = _x select 1;
    _isIllegalItem = M_CONFIG(getNumber,"VirtualItems",_var,"illegal");
    if (_isIllegalItem isEqualTo 1 ) then {
        _illegalPrice = M_CONFIG(getNumber,"VirtualItems",_var,"sellPrice");
        if (!isNull (missionConfigFile >> "VirtualItems" >> _var >> "processedItem")) then {
            _illegalItemProcessed = M_CONFIG(getText,"VirtualItems",_var,"processedItem");
            _illegalPrice = M_CONFIG(getNumber,"VirtualItems",_illegalItemProcessed,"sellPrice");
        };

        _illegalValue = _illegalValue + (round(_val * _illegalPrice / 2));
    };
} forEach (_containerInfo select 0);
_value = _illegalValue;
if (_value > 0) then {
    [0,"STR_NOTF_ContainerContraband",true,[[_value] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
    BANK = BANK + _value;
    _container setVariable ["Trunk",[[],0],true];
    [_container] remoteExecCall ["TON_fnc_updateHouseTrunk",2];
} else {
    hint localize "STR_Cop_NoIllegalContainer";
};
