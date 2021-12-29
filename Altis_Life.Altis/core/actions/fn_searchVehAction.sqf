#include "..\..\script_macros.hpp"
/*
    File: fn_searchVehAction.sqf
    Author: DomT602

    Description:
    Currently finds who has keys to the vehicle.
*/
params [
    ["_vehicle",objNull,[objNull]]
];
if (isNull _vehicle) exitWith {};

private _keyHolders = _vehicle getVariable ["vehicle_info_owners",[]];
if (_keyHolders isEqualTo []) exitWith {hint localize "STR_NOTF_VehCheat"; deleteVehicle _vehicle};

life_action_inUse = true;
hint localize "STR_NOTF_Searching";

sleep 3;
life_action_inUse = false;

if (!alive _vehicle || {player distance _vehicle > 10 || {!alive player}}) exitWith {hint localize "STR_NOTF_SearchVehFail"};

private _owners = "";
{
    private _name = _x select 1;
    _owners = format ["%1<br/>%2",_owners,_name];
} forEach _keyHolders;

hint parseText format [localize "STR_NOTF_SearchVeh",_owners];
