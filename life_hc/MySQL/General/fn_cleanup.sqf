#include "\life_hc\hc_macros.hpp"
/*
    File: fn_cleanup.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Server-side cleanup script on vehicles.
    Sort of a lame way but whatever.
*/
for "_i" from 0 to 1 step 0 do {
    uiSleep (60 * 60);
    {
        private _veh = _x;
        private _vehicleClass = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "vehicleClass");
        private _fuel = (if (LIFE_SETTINGS(getNumber,"save_vehicle_fuel") isEqualTo 1) then {fuel _veh} else {1});;
        private _protect = _veh getVariable ["NPC",false];

        if ((_vehicleClass in ["Car","Air","Ship","Armored","Submarine"]) && {!(_protect)}) then {
            private _dbInfo = _veh getVariable ["dbInfo",[]];
            private _noUnitsNear = ((nearestObjects [_veh, ["CAManBase"], _minUnitDistance]) findIf {isPlayer _x && {alive _x}} isEqualTo -1);

            if (count crew _x isEqualTo 0 && {_noUnitsNear}) then {
                deleteVehicle _x;

                if (count _dbInfo < 1) exitWith {};

                waitUntil {uiSleep 1; isNull _veh};

                _dbInfo params [
                    "_uid",
                    "_plate"
                ];

                private _query = format ["cleanupVehicle:%1:%2:%3", _fuel, _uid, _plate];
                [_query, 1] call HC_fnc_asyncCall;
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
