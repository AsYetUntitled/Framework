#include "..\..\script_macros.hpp"
/*
    File: fn_vehicleShopBuy.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Does something with vehicle purchasing.
*/
private["_mode","_vIndex","_spawnPoints","_className","_purchasePrice","_buyMultiplier","_rentMultiplier","_colorIndex","_spawnPoint","_vehicle","_vehicleList","_shopSide","_licenses","_licensesName","_exit","_initalPrice"];
_mode = _this select 0;
_exit = false;
if ((lbCurSel 2302) isEqualTo -1) exitWith {hint localize "STR_Shop_Veh_DidntPick";closeDialog 0;};
_className = lbData[2302,(lbCurSel 2302)];
_vIndex = lbValue[2302,(lbCurSel 2302)];
_vehicleList = M_CONFIG(getArray,"CarShops",(life_veh_shop select 0),"vehicles");
_shopSide = M_CONFIG(getText,"CarShops",(life_veh_shop select 0),"side");

_licenses = switch (playerSide) do {
    case civilian: {(M_CONFIG(getArray,"LifeCfgVehicles",_className,"licenses") select 0)};
    case west: {(M_CONFIG(getArray,"LifeCfgVehicles",_className,"licenses") select 1)};
    case independent: {(M_CONFIG(getArray,"LifeCfgVehicles",_className,"licenses") select 2)};
    case east: {(M_CONFIG(getArray,"LifeCfgVehicles",_className,"licenses") select 3)};
};

_initalPrice = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"price");

switch (playerSide) do {
    case civilian: {
        _buyMultiplier = LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
        _rentMultiplier = LIFE_SETTINGS(getNumber,"vehicle_rental_multiplier_CIVILIAN");
    };
    case west: {
        _buyMultiplier = LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_COP");
        _rentMultiplier = LIFE_SETTINGS(getNumber,"vehicle_rental_multiplier_COP");
    };
    case independent: {
        _buyMultiplier = LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_MEDIC");
        _rentMultiplier = LIFE_SETTINGS(getNumber,"vehicle_rental_multiplier_MEDIC");
    };
    case east: {
        _buyMultiplier = LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_OPFOR");
        _rentMultiplier = LIFE_SETTINGS(getNumber,"vehicle_rental_multiplier_OPFOR");
    };
};

 if (_mode) then {
     _purchasePrice = round(_initalPrice * _buyMultiplier);
 } else {
     _purchasePrice = round(_initalPrice * _rentMultiplier);
 };
_colorIndex = lbValue[2304,(lbCurSel 2304)];

_licensesName = "";
{
    if (!(_x isEqualTo "") && {!(LICENSE_VALUE(_x,_shopSide))}) then {
        _licensesName = _licensesName + localize M_CONFIG(getText,"Licenses",_x,"displayName") + "<br/>";
        _exit = true;
    };
} forEach _licenses;

if (_exit) exitWith {hint parseText format[(localize "STR_Shop_Veh_NoLicense")+ "<br/><br/>%1",_licensesName];closeDialog 0;};

if (_purchasePrice < 0) exitWith {closeDialog 0;}; //Bad price entry
if (CASH < _purchasePrice) exitWith {hint format[localize "STR_Shop_Veh_NotEnough",[_purchasePrice - CASH] call life_fnc_numberText];closeDialog 0;};

_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";

if (((life_veh_shop select 0) == "med_air_hs")) then {
    if ((nearestObjects[(getMarkerPos _spawnPoints),["Air"],35]) isEqualTo []) exitWith {_spawnPoint = _spawnPoints};
} else {
    //Check if there is multiple spawn points and find a suitable spawnpoint.
    if (_spawnPoints isEqualType []) then {
        //Find an available spawn point.
        {if ((nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) isEqualTo []) exitWith {_spawnPoint = _x};} forEach _spawnPoints;
    } else {
        if ((nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5]) isEqualTo []) exitWith {_spawnPoint = _spawnPoints};
    };
};


if (_spawnPoint isEqualTo "") exitWith {hint localize "STR_Shop_Veh_Block";closeDialog 0;};
CASH = CASH - _purchasePrice;
hint format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_purchasePrice] call life_fnc_numberText];

//Spawn the vehicle and prep it.
if ((life_veh_shop select 0) == "med_air_hs") then {
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
switch (playerSide) do {
    case west: {
        [_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
    };
    case civilian: {
        if ((life_veh_shop select 2) isEqualTo "civ" && {_className == "B_Heli_Light_01_F"}) then {
            [_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
        };
    };
    case independent: {
        [_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;
    };
};

_vehicle allowDamage true;

life_vehicles pushBack _vehicle;

//Always handle key management by the server
[getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",RSERV];

if (_mode) then {
    if (!(_className in ["B_G_Offroad_01_armed_F","B_MRAP_01_hmg_F"])) then {
        if (life_HC_isActive) then {
            [(getPlayerUID player),playerSide,_vehicle,_colorIndex] remoteExecCall ["HC_fnc_vehicleCreate",HC_Life];
        } else {
            [(getPlayerUID player),playerSide,_vehicle,_colorIndex] remoteExecCall ["TON_fnc_vehicleCreate",RSERV];
        };
    };
};

if (LIFE_SETTINGS(getNumber,"player_advancedLog") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        advanced_log = format ["bought vehicle %1 for $%2. On Hand Cash: $%3  Bank Balance: $%4",_className,[_purchasePrice] call life_fnc_numberText,[CASH] call life_fnc_numberText,[BANK] call life_fnc_numberText];
    } else {
        advanced_log = format ["%1 - %2 bought vehicle %3 for $%4. On Hand Cash: $%5  Bank Balance $%6",profileName,(getPlayerUID player),_className,[_purchasePrice] call life_fnc_numberText,[CASH] call life_fnc_numberText,[BANK] call life_fnc_numberText];
    };
    publicVariableServer "advanced_log";
};

[0] call SOCK_fnc_updatePartial;
closeDialog 0; //Exit the menu.
true;
