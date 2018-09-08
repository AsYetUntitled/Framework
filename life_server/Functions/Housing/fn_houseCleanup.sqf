/*
    File: fn_houseCleanup.sqf
    Author: NiiRoZz

    Description:
    Cleans up containers inside in house of player.
*/
params [
    ["_uid","",[""]]
];

private _query = format ["SELECT pos FROM containers WHERE pid='%1' AND owned='1'",_uid];
private _containers = [_query,2,true] call DB_fnc_asyncCall;

{
    private _pos = call compile format ["%1",_x select 0];
    {
        deleteVehicle _x;
    } forEach (nearestObjects[_pos,["Box_IND_Grenades_F","B_supplyCrate_F"],12]);
} forEach _containers;
    