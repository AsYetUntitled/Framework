#include "..\..\script_macros.hpp"
/*
    File: fn_vehicleShopMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Blah
*/
private["_shop","_sideCheck","_spawnPoints","_shopFlag","_shopTitle","_disableBuy"];
(_this select 3) params [
    ["_shop","",[""]],
    ["_sideCheck",sideUnknown,[civilian]],
    ["_spawnPoints","",["",[]]],
    ["_shopFlag","",[""]],
    ["_shopTitle","",[""]],
    ["_disableBuy",false,[true]]
];

disableSerialization;
//Long boring series of checks
if (dialog) exitWith {};
if (_shop isEqualTo "") exitWith {};
if (_sideCheck != sideUnknown && {playerSide != _sideCheck}) exitWith {hint localize "STR_Shop_Veh_NotAllowed"};
if (LIFE_SETTINGS(getNumber,"vehicleShop_3D") isEqualTo 1) then {
  createDialog "Life_Vehicle_Shop_v2_3D";
} else {
  createDialog "Life_Vehicle_Shop_v2";
};

life_veh_shop = [_shop,_spawnpoints,_shopFlag,_disableBuy]; //Store it so so other parts of the system can access it.

ctrlSetText [2301,_shopTitle];

if (_disableBuy) then {
    //Disable the buy button.
    ctrlEnable [2309,false];
};

//Fetch the shop config.
_vehicleList = M_CONFIG(getArray,"CarShops",_shop,"vehicles");

_control = CONTROL(2300,2302);
lbClear _control; //Flush the list.
ctrlShow [2330,false];
ctrlShow [2304,false];

//Loop through
{
    _className = _x select 0;
    _levelAssert = _x select 1;
    _levelName = _levelAssert select 0;
    _levelType = _levelAssert select 1;
    _levelValue = _levelAssert select 2;
    _showall = true;

    if (!(_levelValue isEqualTo -1)) then {
        _level = missionNamespace getVariable _levelName;
        if (_level isEqualType {}) then {_level = FETCH_CONST(_level);};

        _showall = switch (_levelType) do {
            case "SCALAR": {_level >= _levelValue};
            case "BOOL": {_level};
            case "EQUAL": {_level isEqualTo _levelValue};
            default {false};
        };
    };

    if (_showall) then {
        _vehicleInfo = [_className] call life_fnc_fetchVehInfo;
        _control lbAdd (_vehicleInfo select 3);
        _control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
        _control lbSetData [(lbSize _control)-1,_className];
        _control lbSetValue [(lbSize _control)-1,_ForEachIndex];
    };
} forEach _vehicleList;

if (LIFE_SETTINGS(getNumber,"vehicleShop_3D") isEqualTo 1) then {
  [] call life_fnc_vehicleShopInit3DPreview;
};
((findDisplay 2300) displayCtrl 2302) lbSetCurSel 0;
