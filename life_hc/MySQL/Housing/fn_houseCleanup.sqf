/*
    File: fn_houseCleanup.sqf
    Author: NiiRoZz

    This file is for Nanou's HeadlessClient.

    Description:
    Cleans up containers inside in house of player.
*/
private["_query","_containers"];
_query = format["SELECT pid, pos FROM containers WHERE pid='%1' AND owned='1'",_this];

_containers = [_query,2,true] call HC_fnc_asyncCall;

if (_containers isEqualTo []) exitWith {};
{
    _pos = call compile format["%1",_x select 1];
    _container = nearestObjects[_pos,["Box_IND_Grenades_F","B_supplyCrate_F"],12];
    {
        deleteVehicle _x;
    } forEach _container;
} forEach _containers;
