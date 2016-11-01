#include "..\..\script_macros.hpp"
/*
    File: fn_vehicleShopMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Blah
*/

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
if (!(_sideCheck isEqualTo sideUnknown) && {!(playerSide isEqualTo _sideCheck)}) exitWith {hint localize "STR_Shop_Veh_NotAllowed"};

private _conditions = M_CONFIG(getText,"CarShops",_shop,"conditions");
if !([_conditions] call life_fnc_levelCheck) exitWith {hint localize "STR_Shop_Veh_NotAllowed"};

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

private _control = CONTROL(2300,2302);
lbClear _control; //Flush the list.
ctrlShow [2330,false];
ctrlShow [2304,false];

//Loop through
{
    _x params["_className"];

    private _toShow = [_x] call life_fnc_levelCheck;

    if (_toShow) then {
        _vehicleInfo = [_className] call life_fnc_fetchVehInfo;
        _control lbAdd (_vehicleInfo select 3);
        _control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
        _control lbSetData [(lbSize _control)-1,_className];
        _control lbSetValue [(lbSize _control)-1,_forEachIndex];
    };
} forEach _vehicleList;

if (LIFE_SETTINGS(getNumber,"vehicleShop_3D") isEqualTo 1) then {
  [] call life_fnc_vehicleShopInit3DPreview;
};

((findDisplay 2300) displayCtrl 2302) lbSetCurSel 0;
