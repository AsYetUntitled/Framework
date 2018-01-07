#include "\life_server\script_macros.hpp"
/*
    File: fn_cleanup.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Server-side cleanup script on vehicles.
    Sort of a lame way but whatever. Yep someone should look at it!
*/
private _deleted = false;
for "_i" from 0 to 1 step 0 do {
    uiSleep (60 * 60);
    {
        private _protect = false;
        private _veh = _x;
        private _vehicleClass = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "vehicleClass");
        private _fuel = 1;

        if (!isNil {_veh getVariable "NPC"} && {_veh getVariable "NPC"}) then {_protect = true;};

        if ((_vehicleClass in ["Car","Air","Ship","Armored","Submarine"]) && {!(_protect)}) then {
            if (LIFE_SETTINGS(getNumber,"save_vehicle_fuel") isEqualTo 1) then {_fuel = (fuel _veh);};
            _dbInfo = _veh getVariable ["dbInfo",[]];
            _units = {(_x distance _veh < 300)} count playableUnits;
            if (count crew _x isEqualTo 0) then {
                call {
                    if ((_x getHitPointDamage "HitEngine") > 0.7 && _units isEqualTo 0) exitWith {deleteVehicle _x; _deleted = true};
                    if ((_x getHitPointDamage "HitLFWheel") > 0.98 && _units isEqualTo 0) exitWith {deleteVehicle _x; _deleted = true};
                    if ((_x getHitPointDamage "HitLF2Wheel") > 0.98 && _units isEqualTo 0) exitWith {deleteVehicle _x; _deleted = true};
                    if ((_x getHitPointDamage "HitRFWheel") > 0.98 && _units isEqualTo 0) exitWith {deleteVehicle _x; _deleted = true};
                    if ((_x getHitPointDamage "HitRF2Wheel") > 0.98 && _units isEqualTo 0) exitWith {deleteVehicle _x; _deleted = true};
                    if (_units isEqualTo 0) exitWith {deleteVehicle _x; _deleted = true};
                };
            };

            if (_deleted) then {
                waitUntil {isNull _veh};
                _deleted = false;
            };

            if (isNull _veh) then {
                if !(_dbInfo isEqualTo []) then {
                    _dbInfo params ["_uid", "_plate"];

                    _query = format ["UPDATE vehicles SET active='0', fuel='%3' WHERE pid='%1' AND plate='%2'",_uid,_plate,_fuel];

                    [_query,1] call DB_fnc_asyncCall;
                };
            };
        };
    } forEach vehicles;

    uiSleep (3 * 60); //3 minute cool-down before next cycle.
    {
        if ((typeOf _x) in ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F", "Land_Can_V3_F","Land_Money_F","Land_Suitcase_F"]) then {
            deleteVehicle _x;
        };
    } forEach (allMissionObjects "Thing");

    uiSleep (2 * 60);
    {
        deleteVehicle _x;
    } forEach (allMissionObjects "GroundWeaponHolder");
};
