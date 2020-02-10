#include "\life_server\script_macros.hpp"
/*
    File: fn_cleanup.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Server-side cleanup script on vehicles.
    Sort of a lame way but whatever. Yep someone should look at it!
*/
for "_i" from 0 to 1 step 0 do {
    uiSleep (60 * 60);
    {
        private _veh = _x;
        private _vehicleClass = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "vehicleClass");
        private _fuel = (if (LIFE_SETTINGS(getNumber,"save_vehicle_fuel") isEqualTo 1) then {fuel _veh} else {1});
        private _protect = _veh getVariable ["NPC",false];

        if ((_vehicleClass in ["Car","Air","Ship","Armored","Submarine"]) && {!(_protect)}) then {
            private _dbInfo = _veh getVariable ["dbInfo",[]];
            private _units = {(_x distance _veh < 300)} count playableUnits;

            if (count crew _x isEqualTo 0 && {_units isEqualTo 0}) then {
                deleteVehicle _x;
                waitUntil {isNull _veh};

                if (count _dbInfo > 0) then {
                    _uid = _dbInfo select 0;
                    _plate = _dbInfo select 1;

                    _query = format ["UPDATE vehicles SET active='0', fuel='%3' WHERE pid='%1' AND plate='%2'",_uid,_plate,_fuel];

                    [_query,1] call DB_fnc_asyncCall;
                };
            };
        };
    } forEach vehicles;

    uiSleep (3 * 60); //3 minute cool-down before next cycle.
    {
        if (!isNil {_x getVariable "item"}) then {
            deleteVehicle _x;
        }
    } forEach (allMissionObjects "Thing");

    uiSleep (2 * 60);
    {
        deleteVehicle _x;
    } forEach (allMissionObjects "GroundWeaponHolder");
};
