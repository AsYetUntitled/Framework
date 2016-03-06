#include "..\..\script_macros.hpp"
/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Does something with vehicle purchasing.
*/
private["_mode","_spawnPoints","_className","_basePrice","_multiplicator","_colorIndex","_spawnPoint","_vehicle","_shopSide","_licenses","_licensesName","_exit"];
_mode = SEL(_this,0);
_exit = false;
if((lbCurSel 2302) == -1) exitWith {hint localize "STR_Shop_Veh_DidntPick";closeDialog 0;};
_className = lbData[2302,(lbCurSel 2302)];
_vIndex = lbValue[2302,(lbCurSel 2302)];
_classNameLife = _className;
_vehicleList = M_CONFIG(getArray,"CarShops",SEL(life_veh_shop,0),"vehicles");
_shopSide = M_CONFIG(getText,"CarShops",SEL(life_veh_shop,0),"side");

_licenses = switch(playerSide) do {
	case civilian: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"licenses"),0)};
	case west: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"licenses"),1)};
	case independent: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"licenses"),2)};
	case east: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"licenses"),3)};
};

hint format ["%1",_licenses];

_basePrice = switch(playerSide) do {
	case civilian: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"rentalprice"),0)};
	case west: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"rentalprice"),1)};
	case independent: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"rentalprice"),2)};
	case east: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"rentalprice"),3)};
};

_multiplicator = LIFE_SETTINGS(getNumber,"vehicleShop_BuyMultiplicator");
 if(_mode) then {_basePrice = round(_basePrice * _multiplicator)};
_colorIndex = lbValue[2304,(lbCurSel 2304)];

_licensesName = "";
{
	if(!(EQUAL(_x,"")) && {!(LICENSE_VALUE(_x,_shopSide))}) then {
		ADD(_licensesName,localize M_CONFIG(getText,"Licenses",_x,"displayName") + "<br/>");
		_exit = true;
	};
} foreach _licenses;

if(_exit) exitWith {hint parseText format[(localize "STR_Shop_Veh_NoLicense")+ "<br/><br/>%1",_licensesName];closeDialog 0;};

if(_basePrice < 0) exitWith {closeDialog 0;}; //Bad price entry
if(CASH < _basePrice) exitWith {hint format[localize "STR_Shop_Veh_NotEnough",[_basePrice - CASH] call life_fnc_numberText];closeDialog 0;};

_spawnPoints = SEL(life_veh_shop,1);
_spawnPoint = "";

if((SEL(life_veh_shop,0) == "med_air_hs")) then {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],35]) == 0) exitWith {_spawnPoint = _spawnPoints};
} else {
	//Check if there is multiple spawn points and find a suitable spawnpoint.
	if(EQUAL(typeName _spawnPoints,typeName [])) then {
		//Find an available spawn point.
		{if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
	} else {
		if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
	};
};


if(EQUAL(_spawnPoint,"")) exitWith {hint localize "STR_Shop_Veh_Block";closeDialog 0;};
SUB(CASH,_basePrice);
hint format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_numberText];

//Spawn the vehicle and prep it.
if((life_veh_shop select 0) == "med_air_hs") then {
	_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; //Wait?
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
	_vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
	sleep 0.6;
} else {
	_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; //Wait?
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle setPos (getMarkerPos _spawnPoint);
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
};
_vehicle lock 2;
[_vehicle,_colorIndex] call life_fnc_colorVehicle;
[_vehicle] call life_fnc_clearVehicleAmmo;
[_vehicle,"trunk_in_use",false,true] remoteExecCall ["TON_fnc_setObjVar",RSERV];
[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] remoteExecCall ["TON_fnc_setObjVar",RSERV];
_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.

//Side Specific actions.
switch(playerSide) do {
	case west: {
		[_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
	};

	case civilian: {
		if(EQUAL(SEL(life_veh_shop,2),"civ") && {_className == "B_Heli_Light_01_F"}) then {
			[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
		};
	};

	case independent: {
		[_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;
	};
};

_vehicle allowDamage true;

//life_vehicles set[count life_vehicles,_vehicle]; //Add err to the chain.
life_vehicles pushBack _vehicle;

/*if(life_HC_isActive) then {
	[getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ["HC_fnc_keyManagement",HC_Life];
} else {
	[getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",RSERV];
};

Always handle key management by the server */
[getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",RSERV];

if(_mode) then {
	if(!(_className in ["B_G_Offroad_01_armed_F","B_MRAP_01_hmg_F"])) then {
	
		if(life_HC_isActive) then {
			[(getPlayerUID player),playerSide,_vehicle,_colorIndex] remoteExecCall ["HC_fnc_vehicleCreate",HC_Life];
		} else {
			[(getPlayerUID player),playerSide,_vehicle,_colorIndex] remoteExecCall ["TON_fnc_vehicleCreate",RSERV];
		};
	};
};

[0] call SOCK_fnc_updatePartial;
closeDialog 0; //Exit the menu.
true;
