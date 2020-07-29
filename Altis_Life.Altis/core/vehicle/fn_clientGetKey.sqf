/*
    File: fn_clientGetKey.sqf
    Author: Bryan "Tonic" Boardwine

    Description: adds key to keychain and displays a message
*/
params [
    ["_vehicle", objNull, [objNull]],
    ["_from", "", [""]]
];

if (_vehicle in life_vehicles) exitWith {};

private _name = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
hint format [localize "STR_NOTF_gaveKeysFrom",_from,_name];
life_vehicles pushBack _vehicle;
[getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",2];
