/*
    File: fn_entityKilled.sqf
    Author: DomT602
    Description:
    Called when an entity dies
*/
params [
    ["_killed",objNull,[objNull]],
    ["_killer",objNull,[objNull]]
];

if (isPlayer _killed) then {
    private _killedName = name _killed;
    private _killerName = name _killer;
    private _message = format ["Death Message: %1 has killed %2", _killerName, _killedName];
    if (_killed isEqualTo _killer) then {
        _message = format ["Suicide Message: %1 committed suicide (or disconnected)", _killedName];
    } else {
        private _weapon = currentWeapon _killer;
        if (_weapon isEqualTo "") then {
            private _vehicle = vehicle _killer;
            if (_vehicle isKindOf "Car") then {
                _message = format ["Vehicle Death Message: %1 has knocked down %2 with a %3", _killerName, _killedName, (getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"))];
            } else {
                if (_vehicle isKindOf "Air") then {
                    _message = format ["Aircraft Death Message: %1 has obliterated %2 with a %3", _killerName, _killedName, (getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"))];
                };
            };
        } else {
            _message = format ["Weapon Death Message: %1 has killed %2 with Weapon %3 from %4 Meters", _killerName, _killedName, (getText(configFile >> "cfgWeapons" >> _weapon >> "displayName")), floor(_killer distance _killed)];
        };
    };
    diag_log format ["death_log: %1",_message];
};