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

if !(isClass (missionConfigFile >> "ProcessAction" >> _type)) exitWith {
    diag_log format ["%1: Processor class doesn't exist",_type];
};

private _materialsRequired = M_CONFIG(getArray,"ProcessAction",_type,"MaterialsReq");
if (_materialsRequired isEqualTo []) exitWith {};

life_action_inUse = true;
private _materialsGiven = M_CONFIG(getArray,"ProcessAction",_type,"MaterialsGive");
private _noLicenseCost = M_CONFIG(getNumber,"ProcessAction",_type,"NoLicenseCost");
private _text = M_CONFIG(getText,"ProcessAction",_type,"Text");

private _totalConversions = [];
{
    _x params [
        "_var",
        "_noRequired"
    ];

    private _var = ITEM_VALUE(_var);

    if (_var isEqualTo 0 || {_var < _noRequired}) then {
        hint localize "STR_NOTF_NotEnoughItemProcess";
        life_action_inUse = false;
        breakOut "main";
    };
    _totalConversions pushBack (floor (_var / _noRequired));

    true
} count _materialsRequired;

private _hasLicense = true;
if !(_vendor in [mari_processor,coke_processor,heroin_processor]) then {
    _hasLicense = LICENSE_VALUE(_type,"civ");
};

_noLicenseCost = _noLicenseCost * (count _materialsRequired);

private _minimumConversions = selectMin _totalConversions;
private _materialsRequiredWeight = 0;
{
    _x params ["_item","_count"];
    private _weight = ([_item] call life_fnc_itemWeight) * _count;
    _materialsRequiredWeight = _materialsRequiredWeight + _weight;
    true
} count _materialsRequired;

private _materialsGivenWeight = 0;
{
    _x params ["_item","_count"];
    private _weight = ([_item] call life_fnc_itemWeight) * _count;
    _materialsGivenWeight = _materialsGivenWeight + _weight;
    true
} count _materialsGiven;

if (_materialsGivenWeight > _materialsRequiredWeight) then {
    private _netChange = _materialsGivenWeight - _materialsRequiredWeight;
    private _freeSpace = life_maxWeight - life_carryWeight;

    if (_freeSpace < _netChange) then {
        hint localize "STR_Process_Weight";
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
_pgText ctrlSetText format ["%2 (1%1)...","%",_text];
_progress progressSetPosition 0.01;
private _cP = 0.01;

life_is_processing = true;

if (_hasLicense) then {
    for "_i" from 0 to 1 step 0 do {
        uiSleep  0.28;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_text];
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
        _x params ["_item","_count"];
        [false,_item,_count * (_minimumConversions)] call life_fnc_handleInv;
        true
    } count _materialsRequired;

    {
        _x params ["_item","_count"];
        [true,_item,_count * (_minimumConversions)] call life_fnc_handleInv;
        true
    } count _materialsGiven;

    "progressBar" cutText ["","PLAIN"];
    if (_minimumConversions isEqualTo (selectMin _totalConversions)) then {
        hint localize "STR_NOTF_ItemProcess";
    } else {
        hint localize "STR_Process_Partial";
    };

    life_is_processing = false;
    life_action_inUse = false;
} else {
    if (CASH < _noLicenseCost) exitWith {
        hint format [localize "STR_Process_License",[_noLicenseCost] call life_fnc_numberText];
        "progressBar" cutText ["","PLAIN"];
        life_is_processing = false;
        life_action_inUse = false;
    };

    for "_i" from 0 to 1 step 0 do {
        uiSleep  0.9;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_text];
        if (_cP >= 1) exitWith {};
        if (player distance _vendor > 10) exitWith {};
    };

    if (player distance _vendor > 10) exitWith {
        hint localize "STR_Process_Stay";
        "progressBar" cutText ["","PLAIN"];
        life_is_processing = false;
        life_action_inUse = false;
    };

    if (CASH < _noLicenseCost) exitWith {
        hint format [localize "STR_Process_License",[_noLicenseCost] call life_fnc_numberText];
        "progressBar" cutText ["","PLAIN"];
        life_is_processing = false;
        life_action_inUse = false;
    };

    {
        _x params ["_item","_count"];
        [false,_item,_count * (_minimumConversions)] call life_fnc_handleInv;
        true
    } count _materialsRequired;

    {
        _x params ["_item","_count"];
        [true,_item,_count * (_minimumConversions)] call life_fnc_handleInv;
        true
    } count _materialsGiven;

    "progressBar" cutText ["","PLAIN"];
    if (_minimumConversions isEqualTo (selectMin _totalConversions)) then {
        hint localize "STR_NOTF_ItemProcess";
    } else {
        hint localize "STR_Process_Partial";
    };
    CASH = CASH - _noLicenseCost;
    [0] call SOCK_fnc_updatePartial;
    life_is_processing = false;
    life_action_inUse = false;
};
