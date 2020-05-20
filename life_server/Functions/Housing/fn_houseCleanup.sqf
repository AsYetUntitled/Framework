/*
    File: fn_houseCleanup.sqf
    Author: NiiRoZz
    Description:
    Cleans up containers inside in house of player.
*/
params [
    ["_uid","",[""]]
];

private _query = format ["selectHousesCleanup:%1", _uid];
private _houses = [_query,2,true] call DB_fnc_asyncCall;

{
    _x params ["_pos"];
    private _house = nearestObject [_pos, "House"];
    private _containers = _house getVariable ["containers",[]];

    if !(_containers isEqualTo []) then {
        {
            deleteVehicle _x;
        } forEach _containers;
        _house setVariable ["containers",nil,true];
    };
} forEach _houses;
