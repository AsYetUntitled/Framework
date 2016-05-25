#include "..\..\script_macros.hpp"
/*
    File: fn_inventoryOpened.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    For the mean time it blocks the player from opening another persons backpack
*/
private["_container","_unit","_list"];
if (count _this isEqualTo 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;

_isPack = FETCH_CONFIG2(getNumber,"CfgVehicles",typeOf _container,"isBackpack");
if (_isPack isEqualTo 1) exitWith {
    hint localize "STR_MISC_Backpack";
    true;
};

if ((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
    _house = nearestObject [player, "House"];
    if (!(_house in life_vehicles) && (_house getVariable ["locked",true])) exitWith {
        hint localize "STR_House_ContainerDeny";
        true;
    };
};

_list = ["LandVehicle","Ship","Air"];
if (KINDOF_ARRAY(_container,_list)) exitWith {
    if (!(_container in life_vehicles) && (_container getVariable ["locked",true])) exitWith {
        hint localize "STR_MISC_VehInventory";
        true;
    };
};

//Allow alive players who've been knocked out to be looted, just not the dead ones
if (_container isKindOf "Man" && !alive _container) exitWith {
    hint localize "STR_NOTF_NoLootingPerson";
    true;
};
