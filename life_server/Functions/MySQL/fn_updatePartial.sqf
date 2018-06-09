/*
    File: fn_updatePartial.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Takes partial data of a player and updates it, this is meant to be
    less network intensive towards data flowing through it for updates.
*/

params [
    ["_uid", "", [""]],
    ["_side", sideUnknown, [civilian]],
    "_value",
    ["_mode", -1, [0]],
    "_value1"
];

if (_uid isEqualTo "" || {_side isEqualTo sideUnknown}) exitWith {}; //Bad.
private _query = "";

switch (_mode) do {
    case 0: {
        _query = format ["updateCash:%1:%2", _value, _uid];
    };

    case 1: {
        _query = format ["updateBank:%1:%2",_value,_uid];
    };

    case 2: {
        for "_i" from 0 to (count _value) -1 do {
            (_value select _i) params ["_license", "_owned"];
            _value set[_i, [_license, [0, 1] select _owned]];
        };

        switch (_side) do {
            case west: {_query = format ["updateWestLicenses:%1:%2", _value, _uid];};
            case civilian: {_query = format ["updateCivLicenses:%1:%2", _value, _uid];};
            case independent: {_query = format ["updateIndepLicenses:%1:%2", _value, _uid];};
        };
    };

    case 3: {
        switch (_side) do {
            case west: {_query = format ["updateWestGear:%1:%2", _value, _uid];};
            case civilian: {_query = format ["updateCivGear:%1:%2", _value, _uid];};
            case independent: {_query = format ["updateIndepGear:%1:%2", _value, _uid];};
        };
    };

    case 4: {
        _value = [0, 1] select _value;
        _value1 = if (count _value1 isEqualTo 3) then {_value1} else {[0,0,0]};
        _query = format ["updateCivPosition:%1:%2:%3", _value, _value1, _uid];
    };

    case 5: {
        _value = [0, 1] select _value;
        _query = format ["updateArrested:%1:%2",_value,_uid];
    };

    case 6: {
        _query = format ["updateCashAndBank:%1:%2:%3", _value, _value1, _uid];
    };

    case 7: {
        [_uid, _side, _value, 0] call TON_fnc_keyManagement;
    };
};

if (_query isEqualTo "") exitWith {};

[_query, 1] call DB_fnc_asyncCall;
