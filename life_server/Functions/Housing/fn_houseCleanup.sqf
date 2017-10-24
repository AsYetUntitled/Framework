/*
    File: fn_houseCleanup.sqf
    Author: NiiRoZz

    Description:
    Cleans up containers inside in house of player.
*/
private _query = format ["SELECT pid, pos FROM containers WHERE pid='%1' AND owned='1'",_this];

private _containers = [_query,2,true] call DB_fnc_asyncCall;

if (count _containers isEqualTo 0) exitWith {};
{
	_x params [
	    "",
	    "_pos"
	];
    _position = call compile format ["%1",_pos];
    _container = nearestObjects[_position,["Box_IND_Grenades_F","B_supplyCrate_F"],12];
    {
        deleteVehicle _x;
    } forEach _container;
} forEach _containers;
