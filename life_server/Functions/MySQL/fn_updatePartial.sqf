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
        _value = [_value] call DB_fnc_numberSafe;
        _query = format ["updateCash:%1:%2", _value, _uid];
    };

    case 1: {
        _value = [_value] call DB_fnc_numberSafe;
        _query = format ["updateBank:%1:%2",_value,_uid];
    };

    case 2: {
        //Does something license related but I can't remember I only know it's important?
        for "_i" from 0 to count(_value)-1 do {
            _bool = [(_value select _i) select 1] call DB_fnc_bool;
            _value set[_i,[(_value select _i) select 0,_bool]];
        };
        _value = [_value] call DB_fnc_mresArray;
        switch (_side) do {
            case west: {_query = format ["updateWestLicenses:%1:%2", _value, _uid];};
            case civilian: {_query = format ["updateCivLicenses:%1:%2", _value, _uid];};
            case independent: {_query = format ["updateIndepLicenses:%1:%2", _value, _uid];};
        };
    };

    case 3: {
        _value = [_value] call DB_fnc_mresArray;
        switch (_side) do {
            case west: {_query = format ["updateWestGear:%1:%2", _value, _uid];};
            case civilian: {_query = format ["updateCivGear:%1:%2", _value, _uid];};
            case independent: {_query = format ["updateIndepGear:%1:%2", _value, _uid];};
        };
    };

    case 4: {
        _value = [_value] call DB_fnc_bool;
        _value1 = if (count _value1 isEqualTo 3) then {_value1} else {[0,0,0]};
        _value1 = [_value1] call DB_fnc_mresArray;
        _query = format ["updateCivPosition:%1:%2:%3", _value, _value1, _uid];
    };

    case 5: {
        _value = [_value] call DB_fnc_bool;
        _query = format ["updateArrested:%1:%2",_value,_uid];
    };

    case 6: {
        _value = [_value] call DB_fnc_numberSafe;
        _value1 = [_value1] call DB_fnc_numberSafe;
        _query = format ["updateCashAndBank:%1:%2:%3", _value, _value1, _uid];
    };

    case 7: {
        [_uid, _side, _value, 0] call TON_fnc_keyManagement;
    };
};

if (_query isEqualTo "") exitWith {};

[_query,1] call DB_fnc_asyncCall;
