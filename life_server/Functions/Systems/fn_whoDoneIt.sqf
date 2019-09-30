/*
    File: fn_whoDoneIt.sqf
    Description: Save log file of units killed.
    Author: Å  ColinM - Help of BI Wiki & Forums.

    Credits:    KillzoneKid for his Debug_Console v3.0 file. Cuel from the BI Forums for his current & previous posts.
*/
params [
    ["_victim",objNull,[objNull]],
    ["_killer",objNull,[objNull]]
];

if (isServer) then {
    if (isNull _victim || isNull _killer) exitWith {};

    private _killerWep = currentWeapon _killer;
    private _killerVeh = vehicle _killer;
    private _distance = _killer distance _victim;
    private _distance = floor(_distance);

    if (_victim IsEqualTo _killer) exitWith {
        diag_log format ["death_log: Suicide Message: %1 committed suicide (or disconnected)", (name _victim)];
    };
    if (_killerWep != "") exitWith {
        diag_log format ["death_log: Weapon Death Message: %1 has killed %2 with Weapon %3 from %4 Meters", (name _killer), (name _victim), (getText(configFile >> "cfgWeapons" >> _killerWep >> "displayName")), _distance];
    };
    if (_killerVeh isKindOf "Car" && _killerWep isEqualTo "") exitWith {
        diag_log format ["death_log: Vehicle Death Message: %1 has knocked down %2 with a %3", (name _killer), (name _victim), (getText(configFile >> "CfgVehicles" >> (typeOf _killerVeh) >> "displayName"))];
    };
    if (_killerVeh isKindOf "Air" && _killerWep isEqualTo "") exitWith {
        diag_log format ["death_log: Aircraft Death Message: %1 has obliterated %2 with a %3", (name _killer), (name _victim), (getText(configFile >> "CfgVehicles" >> (typeOf _killerVeh) >> "displayName"))];
    } else {
        diag_log format ["death_log: Death Message: %1 has killed %2", (name _killer), (name _victim)];
    };
};
