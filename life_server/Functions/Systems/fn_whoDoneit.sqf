/*
    File: fn_whoDoneit.sqf
    Description: Save log file of units killed.
    Author: Å  ColinM - Help of BI Wiki & Forums.

    Credits:    KillzoneKid for his Debug_Console v3.0 file. Cuel from the BI Forums for his current & previous posts.
*/
params [
    ["_victim",objNull,[objNull]],
    ["_killer",objNull,[objNull]]
];

if (isServer) then {
    private["_killerWep","_killerVeh","_distance","_message"];
    if (isNull _victim || isNull _killer) exitWith {};

    _killerWep = currentWeapon _killer;
    _killerVeh = vehicle _killer;
    _distance = _killer distance _victim;
    _distance = floor(_distance);

    _message = "";
    if (_victim == _killer) then {
        _message = format["Suicide Message: %1 committed suicide (or disconnected)", (name _victim)];
    };
    if (_killerWep != "") then {
        _message = format["Weapon Death Message: %1 has killed %2 with Weapon %3 from %4 Meters", (name _killer), (name _victim), (getText(configFile >> "cfgWeapons" >> _killerWep >> "displayName")), _distance];
    };
    if (_killerVeh isKindOf "Car" && _killerWep isEqualTo "") then {
        _message = format["Vehicle Death Message: %1 has knocked down %2 with a %3", (name _killer), (name _victim), (getText(configFile >> "CfgVehicles" >> (typeOf _killerVeh) >> "displayName"))];
    };
    if (_killerVeh isKindOf "Air" && _killerWep isEqualTo "") then {
        _message = format["Aircraft Death Message: %1 has obliterated %2 with a %3", (name _killer), (name _victim), (getText(configFile >> "CfgVehicles" >> (typeOf _killerVeh) >> "displayName"))];
    };
    if (_message isEqualTo "") then {
        _message = format["Death Message: %1 has killed %2", (name _killer), (name _victim)];
    };

    diag_log format["death_log: %1",_message];
};
