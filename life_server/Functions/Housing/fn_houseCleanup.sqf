/*
    File: fn_houseCleanup.sqf
    Author: NiiRoZz

    Description:
    Cleans up containers inside in house of player.
*/
params [
    ["_uid","",[""]]
];
if (_uid isEqualTo "") exitWith {};

{
    _x params [["_pos","",[""]]];
    _pos = parseSimpleArray _pos;
    {
        deleteVehicle _x;
    } forEach nearestObjects [_pos,["Box_IND_Grenades_F","B_supplyCrate_F"],12];
} forEach ([format ["SELECT pos FROM containers WHERE pid='%1' AND owned='1'",_uid],2,true] call DB_fnc_asyncCall);