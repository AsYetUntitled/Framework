#include "\life_server\script_macros.hpp"
/*
    File: fn_cleanup.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Server-side cleanup script on vehicles.
*/
private _saveFuel = LIFE_SETTINGS(getNumber,"save_vehicle_fuel") isEqualTo 1;
private _minUnitDistance = LIFE_SETTINGS(getNumber,"vehicles_despawn_max_distance");

for "_i" from 0 to 1 step 0 do {
    uiSleep (60 * 60);
    {
        private _vehicleClass = getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "vehicleClass");
        private _protect = _x getVariable ["NPC",false];

        if ((_vehicleClass in ["Car","Air","Ship","Armored","Submarine"]) && {!(_protect)}) then {
            private _noUnitsNear = ((nearestObjects [_x, ["CAManBase"], _minUnitDistance]) findIf {isPlayer _x && {alive _x}} isEqualTo -1);

            if (crew _x isEqualTo [] && {_noUnitsNear}) then {
                private _fuel = if (_saveFuel) then {fuel _x} else {1};
                private _ownerInfo = (_x getVariable ["vehicle_info_owners",[]]) select 0;
                _ownerInfo params ["_uid"];
                private _plate = _x getVariable ["plate",""];
                
                deleteVehicle _x;

                if (_plate isEqualTo "") exitWith {};

                waitUntil {uiSleep 1; isNull _x};

                private _query = format ["cleanupVehicle:%1:%2:%3", _fuel, _uid, _plate];
                [_query, 1] call DB_fnc_asyncCall;
            };
        };
    } forEach vehicles;

    {
        if (!isNil {_x getVariable "item"}) then {
            deleteVehicle _x;
        };
        true
    } count (allMissionObjects "Thing");
};
