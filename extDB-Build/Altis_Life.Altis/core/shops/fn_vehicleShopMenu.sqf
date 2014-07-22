/*
	File: fn_vehicleShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blah
*/
private["_shop","_sideCheck","_spawnPoints","_shopFlag","_disableBuy"];
_shop = [(_this select 3),0,"",[""]] call BIS_fnc_param;
_sideCheck = [(_this select 3),1,sideUnknown,[civilian]] call BIS_fnc_param;
_spawnPoints = [(_this select 3),2,"",["",[]]] call BIS_fnc_param;
_shopFlag = [(_this select 3),3,"",[""]] call BIS_fnc_param;
_disableBuy = [(_this select 3),5,false,[true]] call BIS_fnc_param;

disableSerialization;
//Long boring series of checks
if(dialog) exitWith {};
if(_shop == "") exitWith {};
if(_sideCheck != sideUnknown && {playerSide != _sideCheck}) exitWith {hint localize "STR_Shop_Veh_NotAllowed"};

if(!createDialog "Life_Vehicle_Shop_v2") exitWith {};

life_veh_shop = [_shop,_spawnpoints,_shopFlag,_disableBuy]; //Store it so so other parts of the system can access it.

ctrlSetText [2301,((_this select 3) select 4)];

if(_disableBuy) then {
	//Disable the buy button.
	ctrlEnable [2309,false];
};

//Fetch the shop config.
_vehicleList = [_shop] call life_fnc_vehicleListCfg;

_control = ((findDisplay 2300) displayCtrl 2302);
lbClear _control; //Flush the list.
ctrlShow [2330,false];
ctrlShow [2304,false];

//Loop through
{
	_className = _x select 0;
	_basePrice = _x select 1;
	
	_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
	_control lbAdd (_vehicleInfo select 3);
	_control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
	_control lbSetData [(lbSize _control)-1,_className];
	_control lbSetValue [(lbSize _control)-1,_ForEachIndex];
} foreach _vehicleList;