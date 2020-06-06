#include "..\..\script_macros.hpp"
/*
    File: fn_gather.sqf
    Author: Devilfloh

    Description:
    Main functionality for gathering.
*/

scopeName "main";

if (life_action_inUse) exitWith {};
if !(isNull objectParent player) exitWith {};
if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};

life_action_inUse = true;
private _zone = "";
private _requiredItem = "";

private _resourceCfg = missionConfigFile >> "CfgGather" >> "Resources";

private "_curConfig";
private "_resource";
private "_maxGather";
private "_zoneSize";
private "_resourceZones";

for "_i" from 0 to (count _resourceCfg)-1 do {

    _curConfig = _resourceCfg select _i;
    _resource = configName _curConfig;
    _maxGather = getNumber(_curConfig >> "amount");
    _zoneSize = getNumber(_curConfig >> "zoneSize");
    _resourceZones = getArray(_curConfig >> "zones");
    _requiredItem = getText(_curConfig >> "item");

    {
        if ((player distance (getMarkerPos _x)) < _zoneSize) exitWith {_zone = _x;};
        true
    } count _resourceZones;

    if !(_zone isEqualTo "") exitWith {};
};

if (_zone isEqualTo "") exitWith {life_action_inUse = false;};

if !(_requiredItem isEqualTo "") then {
    private _valItem = missionNamespace getVariable [format["life_inv_%1", _requiredItem], 0];

    if (_valItem < 1) exitWith {
        switch (_requiredItem) do {
         //Messages here
        };
        life_action_inUse = false;
        breakOut "main";
    };
};

private _amount = round(random(_maxGather)) + 1;
private _diff = [_resource,_amount,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if (_diff isEqualTo 0) exitWith {
    hint localize "STR_NOTF_InvFull";
    life_action_inUse = false;
};

switch (_requiredItem) do {
    case "pickaxe": {[player,"mining",35,1] remoteExecCall ["life_fnc_say3D",RCLIENT]};
    default {[player,"harvest",35,1] remoteExecCall ["life_fnc_say3D",RCLIENT]};
};

for "_i" from 0 to 4 do {
    player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
    waitUntil {animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
    sleep 0.5;
};

if ([true,_resource,_diff] call life_fnc_handleInv) then {
    private _itemName = M_CONFIG(getText,"VirtualItems",_resource,"displayName");
    titleText[format [localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
};

sleep 1;
life_action_inUse = false;
