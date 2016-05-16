#include "..\..\script_macros.hpp"
/*
    File: fn_processAction.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : NiiRoZz

    Description:
    Master handling for processing an item.
    NiiRoZz : Added multiprocess
*/
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP","_matsReq","_matsGive","_noliccost","_text","_filter"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if (isNull _vendor || _type isEqualTo "" || (player distance _vendor > 10)) exitWith {};


if (isClass (missionConfigFile >> "ProcessAction" >> _type)) then {

    _filter = false;
    _matsReq = M_CONFIG(getArray,"ProcessAction",_type,"MaterialsReq");
    _matsGive = M_CONFIG(getArray,"ProcessAction",_type,"MaterialsGive");
    _noliccost = M_CONFIG(getNumber,"ProcessAction",_type,"NoLicenseCost");
    _text = M_CONFIG(getText,"ProcessAction",_type,"Text");

} else {_filter = true;};

if (_filter) exitWith {};

_itemInfo = [_matsReq,_matsGive,_noliccost,(localize format["%1",_text])];

//Error checking
if (count _itemInfo isEqualTo 0) exitWith {};

//Setup vars.
_oldItem = SEL(_itemInfo,0);
_newItem = SEL(_itemInfo,1);
_cost = SEL(_itemInfo,2);
_upp = SEL(_itemInfo,3);
_exit = false;

_AllNumber = [];
{
    _var = ITEM_VALUE(_x select 0);
    if (_var isEqualTo 0) exitWith {_exit = true;};
    if (_var < (_x select 1)) exitWith {_exit = true;};
    _calcul = (floor (_var/(_x select 1)));
    _AllNumber pushBack _calcul;
} forEach _oldItem;
if (_exit) exitWith {life_is_processing = false;hint localize "STR_NOTF_NotEnoughItemProcess";};

if (_vendor in [mari_processor,coke_processor,heroin_processor]) then {
    _hasLicense = true;
} else {
    _hasLicense = LICENSE_VALUE(_type,"civ");
};

_oldVal = count _oldItem;

_cost = _cost * _oldVal;
//Some more checks
if (_oldVal isEqualTo 0) exitWith {};

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;

if (_hasLicense) then {
    for "_i" from 0 to 1 step 0 do {
        sleep  0.28;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
        if (_cP >= 1) exitWith {};
        if (player distance _vendor > 10) exitWith {};
    };
    if (player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
    _NumberMin = (_AllNumber call BIS_fnc_sortNum) select 0;
    {
        [false,(_x select 0),((_x select 1)*(_NumberMin))] call life_fnc_handleInv;
    } forEach _oldItem;
    {
        [true,(_x select 0),((_x select 1)*(_NumberMin))] call life_fnc_handleInv;
    } forEach _newItem;
    5 cutText ["","PLAIN"];
    hint localize "STR_NOTF_ItemProcess";
    life_is_processing = false;
} else {
    if (CASH < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};

    for "_i" from 0 to 1 step 0 do {
        sleep  0.9;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
        if (_cP >= 1) exitWith {};
        if (player distance _vendor > 10) exitWith {};
    };

    if (player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
    if (CASH < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
    _NumberMin = (_AllNumber call BIS_fnc_sortNum) select 0;
    {
        [false,(_x select 0),((_x select 1)*(_NumberMin))] call life_fnc_handleInv;
    } forEach _oldItem;
    {
        [true,(_x select 0),((_x select 1)*(_NumberMin))] call life_fnc_handleInv;
    } forEach _newItem;
    5 cutText ["","PLAIN"];
    hint localize "STR_NOTF_ItemProcess";
    CASH = CASH - _cost;
    life_is_processing = false;
};
