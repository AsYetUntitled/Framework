/*
    File: fn_houseCleanup.sqf
    Author: NiiRoZz

    Description:
    Cleans up containers inside in house of player.
*/

private _query = format ["selectContainerPositions:%1", _this];
private _containers = [_query, 2, true] call DB_fnc_asyncCall;

if (_containers isEqualTo []) exitWith {};
{
    _pos = call compile format ["%1", _x select 1];
    _container = nearestObjects[_pos, ["Box_IND_Grenades_F", "B_supplyCrate_F"], 12];
    {
        deleteVehicle _x;
    } forEach _container;
} forEach _containers;
