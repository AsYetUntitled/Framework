#include "\life_server\script_macros.hpp"
/*
    File: fn_entityKilled.sqf
    Author: DomT602
    Description:
    Called when an entity dies
*/
params [
    ["_killed", objNull, [objNull]],
    ["_killer", objNull, [objNull]],
    ["_instigator", objNull, [objNull]],
    ["_useEffects", true, [true]]
];

if (isPlayer _killed) exitWith {
    if (LIFE_SETTINGS(getNumber,"player_deathLog") isEqualTo 0) exitWith {};
    private _killedName = name _killed;

    if (_killed isEqualTo _killer) exitWith {
        diag_log format ["death_log: Suicide Message: %1 committed suicide (or disconnected)", _killedName];
    };

    //instigator is null -> indicated Roadkill
    //reference: https://community.bistudio.com/wiki/Arma_3:_Event_Handlers/addMissionEventHandler#EntityKilled
    if (isNull _instigator) exitWith {
        private _vehicle = vehicle _killer;
        private _vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
        (UAVControl _vehicle) params ["_instigator"];

        if !(isNull _instigator) exitWith {
            diag_log format ["death_log: UAV Death Message: %1 has knocked down %2 with a %3", name _instigator, _killedName, _vehicleName];
        };

        if (_vehicle isKindOf "Air") exitWith {
            diag_log format ["death_log: Aircraft Death Message: %1 has obliterated %2 with a %3", name _killer, _killedName, _vehicleName];
        };
        diag_log format ["death_log: Vehicle Death Message: %1 has knocked down %2 with a %3", name _killer, _killedName, _vehicleName];
    };

    private _weaponName = getText(configFile >> "cfgWeapons" >> (currentWeapon _instigator) >> "displayName");
    private _distance = floor(_killer distance _killed);

    diag_log format ["death_log: Weapon Death Message: %1 has killed %2 with Weapon %3 from %4 Meters", name _instigator, _killedName, _weaponName, _distance];
};

private _vehicleClass = getText(configFile >> "CfgVehicles" >> (typeOf _killed) >> "vehicleClass");

if (_vehicleClass in ["Air","Armored","Car","Ship","Submarine"]) exitWith {
    private _dbInfo = _killed getVariable ["dbInfo",[]];

    if (count _dbInfo > 0) then {
        _dbInfo params [
            "_uid",
            "_plate"
        ];

        private _query = format ["deleteVehicle:%1:%2", _uid, _plate];
        [_query,1] call DB_fnc_asyncCall;
    };

    if (!isNull _killed) then {

        [_killed] spawn {
            private _startTime = serverTime;
            private _delay = LIFE_SETTINGS(getNumber,"dead_vehicles_despawn_delay");
            private _minUnitDistance = LIFE_SETTINGS(getNumber,"dead_vehicles_max_units_distance");
            params [
                ["_killed", objNull, [objNull]]
            ];

            waitUntil {
                uiSleep 1;
                ((nearestObjects [_killed, ["CAManBase"], _minUnitDistance]) findIf {isPlayer _x && {alive _x}} isEqualTo -1) || {serverTime - _startTime >= _delay}
            };
            deleteVehicle _killed;
        };
    };
};
