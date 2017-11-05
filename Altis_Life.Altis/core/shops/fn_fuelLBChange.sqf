#include "..\..\script_macros.hpp"
/*
    File: fn_fuelLBChange.sqf
    Author: NiiRoZz

    Description:
    Change when slide change. That descripotion
*/
disableSerialization;
params [
    ["_control",controlNull,[controlNull]],
    ["_index",-1,[0]]
];

//Fetch some information.
private _className = _control lbData _index;
private _vIndex = _control lbValue _index;
private _vehicle = (vehiclefuelList select _vindex) select 0;
private _vehicleInfo = [_className] call life_fnc_fetchVehInfo;

private _fuel = fuel _vehicle;
_fueltank = (_vehicleInfo select 12);
if (_vehicle isKindOf "B_Truck_01_box_F" || _vehicle isKindOf "B_Truck_01_transport_F") then {_fueltank = 350;};//hemtt
if (_vehicle isKindOf "C_Van_01_box_F") then {_fueltank = 100;};
if (_vehicle isKindOf "I_Truck_02_covered_F" || _vehicle isKindOf "I_Truck_02_transport_F") then {_fueltank = 175;};
ctrlShow [20330,true];

(CONTROL(20300,20303)) ctrlSetStructuredText parseText format [
    (localize "STR_Shop_Veh_UI_Fuel")+ " %1l<br/>" +
    (localize "STR_Fuel_Tank_Vehicle")+ " %2l",
    _fueltank,
    round(_fueltank * _fuel)
];

{
    slidersetRange [_x,(floor(_fuel * _fueltank)),_fueltank];
} forEach [20901];

{
    sliderSetPosition[_x ,(floor(_fuel * _fueltank))];
} forEach [20901];

ctrlSetText [20323,format ["Total : %1$",life_fuelPrices * ((SliderPosition 20901) -(floor(_fuel * _fueltank))) ]];
true;
