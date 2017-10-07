#include "..\..\script_macros.hpp"
/*
    File: fn_processAction.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : NiiRoZz

    Description:
    Master handling for processing an item.
    NiiRoZz : Added multiprocess
*/

scopeName "main";

params [
    ["_vendor", objNull, [objNull]],
    "",
    "",
    ["_type", "", [""]]

];

//Error check
if (isNull _vendor || {_type isEqualTo ""} || {player distance _vendor > 10}) exitWith {};
life_action_inUse = true;

if (isClass (missionConfigFile >> "ProcessAction" >> _type)) then {
    _materialsRequired = M_CONFIG(getArray,"ProcessAction",_type,"MaterialsReq");
    _materialsGiven = M_CONFIG(getArray,"ProcessAction",_type,"MaterialsGive");
    _noLicenseCost = M_CONFIG(getNumber,"ProcessAction",_type,"NoLicenseCost");
    _text = M_CONFIG(getText,"ProcessAction",_type,"Text");
} else {
    life_action_inUse = false;
    breakOut "main";
};

if (isLocalized _text) then {
    _text = localize _text;
};

private _itemInfo = [_materialsRequired, _materialsGiven, _noLicenseCost, _text];
if (count _itemInfo isEqualTo 0) exitWith {
    life_action_inUse = false;
};

//Setup vars.

_itemInfo params [
    "_oldItems",
    "_newItems",
    "_cost",
    "_upp"
];

if (count _oldItems isEqualTo 0) exitWith {
    life_action_inUse = false;
};

private _totalConversions = [];
{
    _x params [
        "_var",
        "_noRequired"
    ];

    private _var = ITEM_VALUE(_var);

    if (_var isEqualTo 0 || {_var < _noRequired}) then {
        life_is_processing = false;
        hint localize "STR_NOTF_NotEnoughItemProcess";
        life_action_inUse = false;
        breakOut "main";
    };
    _totalConversions pushBack (floor (_var/_noRequired));

    true
} count _oldItems;

private "_hasLicense";
if (_vendor in [mari_processor,coke_processor,heroin_processor]) then {
    _hasLicense = true;
} else {
    _hasLicense = LICENSE_VALUE(_type,"civ");
};

_cost = _cost * (count _oldItems);

private _minimumConversions = selectMin _totalConversions;
private _oldItemsWeight = 0;
private "_weight";
{
    _weight = (([_x select 0] call life_fnc_itemWeight) * (_x select 1));
    _oldItemsWeight = _oldItemsWeight + _weight;
    true
} count _oldItems;

_noRequired _newItemsWeight = 0;
{
    _weight = ([_x select 0] call life_fnc_itemWeight) * (_x select 1);
    _newItemsWeight = _newItemsWeight + _weight;
    true
} count _newItems;

if (_newItemsWeight > _oldItemsWeight) then {
    _netChange = _newItemsWeight - _oldItemsWeight;
    _freeSpace = life_maxWeight - life_carryWeight;

    if (_freeSpace < _netChange) then {
        hint localize "STR_Process_Weight";
        life_is_processing = false;
        life_action_inUse = false;
        breakOut "main";
    };

    private _estConversions = floor(_freeSpace / _netChange);
    if (_estConversions < _minimumConversions) then {
        _minimumConversions = _estConversions;
    };
};

//Setup our progress bar.
disableSerialization;
"progressBar" cutRsc ["life_progress","PLAIN"];
private _ui = uiNamespace getVariable "life_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format ["%2 (1%1)...","%",_upp];
private _progress progressSetPosition 0.01;
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
    if (player distance _vendor > 10) exitWith {
        hint localize "STR_Process_Stay";
        "progressBar" cutText ["","PLAIN"];
        life_is_processing = false;
        life_action_inUse = false;
    };

    {
        [false,_x select 0,(_x select 1)*(_minimumConversions)] call life_fnc_handleInv;
        true
    } count _oldItems;

    {
        [true,_x select 0,(_x select 1)*(_minimumConversions)] call life_fnc_handleInv;
        true
    } count _newItems;

    "progressBar" cutText ["","PLAIN"];
    if (_minimumConversions isEqualTo (selectMin _totalConversions)) then {
        hint localize "STR_NOTF_ItemProcess";
    } else {
        hint localize "STR_Process_Partial";
    };

    life_is_processing = false;
    life_action_inUse = false;

} else {
    if (CASH < _cost) exitWith {
        hint format [localize "STR_Process_License",[_cost] call life_fnc_numberText];
        "progressBar" cutText ["","PLAIN"];
        life_is_processing = false;
        life_action_inUse = false;
    };

    for "_i" from 0 to 1 step 0 do {
        uiSleep  0.9;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_upp];
        if (_cP >= 1) exitWith {};
        if (player distance _vendor > 10) exitWith {};
    };

    if (player distance _vendor > 10) exitWith {
        hint localize "STR_Process_Stay";
        "progressBar" cutText ["","PLAIN"];
        life_is_processing = false;
        life_action_inUse = false;
    };

    if (CASH < _cost) exitWith {
        hint format [localize "STR_Process_License",[_cost] call life_fnc_numberText];
        "progressBar" cutText ["","PLAIN"];
        life_is_processing = false;
        life_action_inUse = false;
    };

    {
        [false,_x select 0,((_x select 1)*_minimumConversions)] call life_fnc_handleInv;
    } count _oldItems;

    {
        [true,_x select 0,((_x select 1)*_minimumConversions)] call life_fnc_handleInv;
    } count _newItems;

    "progressBar" cutText ["","PLAIN"];
    if (_minimumConversions isEqualTo (selectMin _totalConversions)) then {
        hint localize "STR_NOTF_ItemProcess";
    } else {
        hint localize "STR_Process_Partial";
    };
    CASH = CASH - _cost;
    [0] call SOCK_fnc_updatePartial;
    life_is_processing = false;
    life_action_inUse = false;
};
