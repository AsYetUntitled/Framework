#include "..\..\script_macros.hpp"
/*
    File: fn_fuelLBChange.sqf
    Author: NiiRoZz

    Description:
    Change when slide change. That descripotion
*/
disableSerialization;
private["_control","_index","_className","_basePrice","_vehicleInfo","_colorArray","_ctrl"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_className = _control lbData _index;
_vIndex = _control lbValue _index;
_vehicle = (vehiclefuelList select _vindex) select 0;
_vehicleInfo = [_className] call life_fnc_fetchVehInfo;

_fuel = fuel _vehicle;
_fueltank = (_vehicleInfo select 12);
if (_vehicle isKindOf "B_Truck_01_box_F" || _vehicle isKindOf "B_Truck_01_transport_F") then {_fueltank = 350;};//hemtt
if (_vehicle isKindOf "C_Van_01_box_F") then {_fueltank = 100;};
if (_vehicle isKindOf "I_Truck_02_covered_F" || _vehicle isKindOf "I_Truck_02_transport_F") then {_fueltank = 175;};
ctrlShow [20330,true];

(CONTROL(20300,20303)) ctrlSetStructuredText parseText format[
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