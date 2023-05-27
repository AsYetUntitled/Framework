#include "..\..\script_macros.hpp"
/*
    File: fn_fuelLBChange.sqf
    Author: NiiRoZz

    Description:
    Changes when slider is changed.
*/
params [
    ["_control",controlNull,[controlNull]],
    ["_index",-1,[0]]
];

//Fetch some information.
private _className = _control lbData _index;
private _vehicleFuelList = uiNamespace getVariable ["fuel_list",[]];
(_vehicleFuelList select _index) params ["_vehicle"];
private _vehicleInfo = [_className] call life_fnc_fetchVehInfo;

private _fuel = fuel _vehicle;
private _fuelTank = _vehicleInfo select 12;
if (_vehicle isKindOf "B_Truck_01_box_F" || _vehicle isKindOf "B_Truck_01_transport_F") then {_fuelTank = 350};//hemtt
if (_vehicle isKindOf "C_Van_01_box_F") then {_fuelTank = 100};
if (_vehicle isKindOf "I_Truck_02_covered_F" || _vehicle isKindOf "I_Truck_02_transport_F") then {_fuelTank = 175};
ctrlShow [20330,true];

(CONTROL(20300,20303)) ctrlSetStructuredText parseText format [
    (localize "STR_Shop_Veh_UI_Fuel")+ " %1l<br/>" +
    (localize "STR_Fuel_Tank_Vehicle")+ " %2l",
    _fuelTank,
    round(_fuelTank * _fuel)
];

sliderSetRange [20901,(floor(_fuel * _fuelTank)),_fuelTank];
sliderSetPosition [20901 ,(floor(_fuel * _fuelTank))];

ctrlSetText [20323,format ["Total : %1$",(uiNamespace getVariable ["fuel_cost",0]) * ((SliderPosition 20901) -(floor(_fuel * _fuelTank))) ]];
true;
