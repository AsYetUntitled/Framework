/*
    File: fn_updatePartial.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Takes partial data of a player and updates it, this is meant to be
    less network intensive towards data flowing through it for updates.
*/

params [
    ["_unit",objNull,[objNull]],
    ["_mode", -1, [0]],
    "_value",
    "_value1"
];

if (isNull _unit) exitWith {}; //Bad.
private _uid = getPlayerUID _unit;
private _side = side _unit;
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
        private _alive = alive _unit;
        if ((getMarkerPos "respawn_civilian" distance _position) < 300) then {
            _alive = false;
        };
        _alive = [0, 1] select _alive;
        private _position = getPosATL _unit;
        _query = format ["updateCivPosition:%1:%2:%3", _alive, _position, _uid];
    };

    case 5: {
        _value = [0, 1] select _value;
        _query = format ["updateArrested:%1:%2",_value,_uid];
    };

    case 6: {
        _query = format ["updateCashAndBank:%1:%2:%3", _value, _value1, _uid];
    };
};

if (_query isEqualTo "") exitWith {};

[_query, 1] call DB_fnc_asyncCall;
