/*
    File: fn_cleanupRequest.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Client sends a cleanup request when they hit Abort,
    the server will then monitor when that client aborts and
    delete the weapon holders.
*/
params [
    ["_client",objNull,[objNull]]
];
if (isNull _client) exitWith {};

private _loops = 0;
for "_i" from 0 to 1 step 0 do {
    if (_loops >= 25) exitWith {};
    if (!alive _client) exitWith {
        private _containers = nearestObjects[(getPosATL _client),["WeaponHolderSimulated"],5];
        if (count _containers > 0) then {
            {deleteVehicle _x;} forEach _containers; //Delete the containers.
        };
        deleteVehicle _client; //Get rid of the corpse.
    };

    _loops = _loops + 1;
    uiSleep 1;
};
