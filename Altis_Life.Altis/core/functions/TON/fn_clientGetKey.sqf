/*
    File: fn_clientGetKey.sqf
    Author: Bryan "Tonic" Boardwine

    Description: TODO
*/
private ["_vehicle","_unit","_giver"];
_vehicle = _this select 0;
_unit = _this select 1;
_giver = _this select 2;
if (isNil "_unit" || isNil "_giver") exitWith {};
if (player isEqualTo _unit && !(_vehicle in life_vehicles)) then {
    _name = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
    hint format [localize "STR_NOTF_gaveKeysFrom",_giver,_name];
    life_vehicles pushBack _vehicle;
    [getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",2];
};
