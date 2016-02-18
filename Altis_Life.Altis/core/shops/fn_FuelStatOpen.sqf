#include "..\..\script_macros.hpp"
/*
	File: fn_FuelStatOpen.sqf
	Author : NiiRoZz

	Description:
	Open dialog Pump.
*/
private["_shop","_sideCheck","_spawnPoints","_shopFlag","_disableBuy","_fuelCost"];

disableSerialization;
//Long boring series of checks
if (life_action_inUse) exitwith {};
if(dialog) exitWith {};
if(life_is_processing) exitwith {};
life_action_inUse = true;
_fuelstations = nearestobjects [player, ["Land_fs_feed_F"],10];
if (count _fuelstations == 0 ) exitwith {life_action_inUse = false;};
_vehicleList = nearestObjects [player, ["Car","air"], 10];
if (count _vehicleList < 1) exitwith {hint localize "STR_NOTF_VehicleNear";life_action_inUse = false;};
if(!createDialog "Life_FuelStat") exitWith {};
_fuelCost = LIFE_SETTINGS(getNumber,"fuel_cost");
[] spawn {waituntil {!dialog}; life_action_inUse = false;};
ctrlSetText [20301,"Fuel Station"];
if (isnil "life_fuelPrices") then {
	life_fuelPrices = _fuelCost;
};
//Fetch the shop config.
vehicleFuelList =[];
{
	_fuel = fuel _x;
	vehicleFuelList pushBack [_x,_fuel];
} foreach _vehicleList;

_control = ((findDisplay 20300) displayCtrl 20302);
lbClear _control; //Flush the list.

ctrlsettext [20322,format [localize "STR_Price_Fuel_Pump",life_fuelPrices]];
ctrlsettext [20323,format ["Total : %1$",life_fuelPrices * 0.1]];
//Loop through
{
	_className = typeof (_x select 0);
	_fuelleft = _x select 1;

	_vehicleInfo = [_className]call life_fnc_fetchVehInfo;
	_control lbAdd (_vehicleInfo select 3);
	_control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
	_control lbSetData [(lbSize _control)-1,_className];
	_control lbSetValue [(lbSize _control)-1,_ForEachIndex];
} foreach vehicleFuelList;
