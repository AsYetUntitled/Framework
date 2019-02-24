#include "..\..\script_macros.hpp"
/*
    File: fn_processAction.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : NiiRoZz

    Description:
    Master handling for processing an item.
    NiiRoZz : Added multiprocess
*/
private ["_hasLicense","_materialsRequired","_materialsGiven","_noLicenseCost","_text","_filter"];
params [
    ["_vendor",objNull,[objNull]],
    "",
    "",
    ["_type","",[""]]
];

//Error check
if (isNull _vendor || _type isEqualTo "" || (player distance _vendor > 10)) exitWith {};
life_action_inUse = true;//Lock out other actions during processing.

if (isClass (missionConfigFile >> "ProcessAction" >> _type)) then {
    _filter = false;
    _materialsRequired = M_CONFIG(getArray,"ProcessAction",_type,"MaterialsReq");
    _materialsGiven = M_CONFIG(getArray,"ProcessAction",_type,"MaterialsGive");
    _noLicenseCost = M_CONFIG(getNumber,"ProcessAction",_type,"NoLicenseCost");
    _text = M_CONFIG(getText,"ProcessAction",_type,"Text");
} else {_filter = true;};

if (_filter) exitWith {life_action_inUse = false;};

private _itemInfo = [_materialsRequired,_materialsGiven,_noLicenseCost,(localize format ["%1",_text])];
if (count _itemInfo isEqualTo 0) exitWith {life_action_inUse = false;};

//Setup vars.
_itemInfo params ["_oldItem","_newItem","_cost","_upp"];
private _exit = false;
if (count _oldItem isEqualTo 0) exitWith {life_action_inUse = false;};

private _totalConversions = [];
{
    _var = ITEM_VALUE(_x select 0);
    if (_var isEqualTo 0) exitWith {_exit = true;};
    if (_var < (_x select 1)) exitWith {_exit = true;};
    _totalConversions pushBack (floor (_var/(_x select 1)));
} forEach _oldItem;

if (_exit) exitWith {life_is_processing = false; hint localize "STR_NOTF_NotEnoughItemProcess"; life_action_inUse = false;};

if (_vendor in [mari_processor,coke_processor,heroin_processor]) then {
    _hasLicense = true;
} else {
    _hasLicense = LICENSE_VALUE(_type,"civ");
};

_cost = _cost * (count _oldItem);

private _minimumConversions = _totalConversions call BIS_fnc_lowestNum;
private _oldItemWeight = 0;
{
    _weight = ([_x select 0] call life_fnc_itemWeight) * (_x select 1);
    _oldItemWeight = _oldItemWeight + _weight;
} count _oldItem;

private _newItemWeight = 0;
{
    _weight = ([_x select 0] call life_fnc_itemWeight) * (_x select 1);
    _newItemWeight = _newItemWeight + _weight;
} count _newItem;

_exit = false;

if (_newItemWeight > _oldItemWeight) then {
    _netChange = _newItemWeight - _oldItemWeight;
    _freeSpace = life_maxWeight - life_carryWeight;
    if (_freeSpace < _netChange) exitWith {_exit = true;};
    private _estConversions = floor(_freeSpace / _netChange);
    if (_estConversions < _minimumConversions) then {
        _minimumConversions = _estConversions;
    };
};

if (_exit) exitWith {hint localize "STR_Process_Weight"; life_is_processing = false; life_action_inUse = false;};

//Setup our progress bar.
disableSerialization;
"progressBar" cutRsc ["life_progress","PLAIN"];
private _ui = uiNamespace getVariable "life_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format ["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
private _cP = 0.01;

life_is_processing = true;

if (_hasLicense) then {
    for "_i" from 0 to 1 step 0 do {
        uiSleep  0.28;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_upp];
        if (_cP >= 1) exitWith {};
        if (player distance _vendor > 10) exitWith {};
    };
    if (player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; "progressBar" cutText ["","PLAIN"]; life_is_processing = false; life_action_inUse = false;};

    {
        [false,(_x select 0),((_x select 1)*(_minimumConversions))] call life_fnc_handleInv;
    } count _oldItem;

    {
        [true,(_x select 0),((_x select 1)*(_minimumConversions))] call life_fnc_handleInv;
    } count _newItem;

    "progressBar" cutText ["","PLAIN"];
    if (_minimumConversions isEqualTo (_totalConversions call BIS_fnc_lowestNum)) then {hint localize "STR_NOTF_ItemProcess";} else {hint localize "STR_Process_Partial";};
    life_is_processing = false; life_action_inUse = false;
} else {
    if (CASH < _cost) exitWith {hint format [localize "STR_Process_License",[_cost] call life_fnc_numberText]; "progressBar" cutText ["","PLAIN"]; life_is_processing = false; life_action_inUse = false;};

    for "_i" from 0 to 1 step 0 do {
        uiSleep  0.9;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_upp];
        if (_cP >= 1) exitWith {};
        if (player distance _vendor > 10) exitWith {};
    };

    if (player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; "progressBar" cutText ["","PLAIN"]; life_is_processing = false; life_action_inUse = false;};
    if (CASH < _cost) exitWith {hint format [localize "STR_Process_License",[_cost] call life_fnc_numberText]; "progressBar" cutText ["","PLAIN"]; life_is_processing = false; life_action_inUse = false;};

    {
        [false,(_x select 0),((_x select 1)*(_minimumConversions))] call life_fnc_handleInv;
    } count _oldItem;

    {
        [true,(_x select 0),((_x select 1)*(_minimumConversions))] call life_fnc_handleInv;
    } count _newItem;

    "progressBar" cutText ["","PLAIN"];
    if (_minimumConversions isEqualTo (_totalConversions call BIS_fnc_lowestNum)) then {hint localize "STR_NOTF_ItemProcess";} else {hint localize "STR_Process_Partial";};
    CASH = CASH - _cost;
    [0] call SOCK_fnc_updatePartial;
    life_is_processing = false;
    life_action_inUse = false;
};
