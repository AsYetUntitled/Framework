/*
    File: fn_updatePartial.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Takes partial data of a player and updates it, this is meant to be
    less network intensive towards data flowing through it for updates.
*/
params [
    ["_uid","",[""]],
    ["_side",sideUnknown,[civilian]],
    ["_value",0,[0]],
    ["_mode",-1,[0]]
];

if (_uid isEqualTo "" || _side isEqualTo sideUnknown) exitWith {}; //Bad.
private _query = "";

switch (_mode) do {
    case 0: {
        _value = [_value] call HC_fnc_numberSafe;
        _query = format ["UPDATE players SET cash='%1' WHERE pid='%2'",_value,_uid];
    };

    case 1: {
        _value = [_value] call HC_fnc_numberSafe;
        _query = format ["UPDATE players SET bankacc='%1' WHERE pid='%2'",_value,_uid];
    };

    case 2: {
        params [
            ["_uid","",[""]],
            ["_side",sideUnknown,[civilian]],
            ["_value",[],[[]]]
        ];
        //Does something license related but I can't remember I only know it's important?
        for "_i" from 0 to count(_value)-1 do {
            _bool = [(_value select _i) select 1] call HC_fnc_bool;
            _value set[_i,[(_value select _i) select 0,_bool]];
        };
        _value = [_value] call HC_fnc_mresArray;
        switch (_side) do {
            case west: {_query = format ["UPDATE players SET cop_licenses='%1' WHERE pid='%2'",_value,_uid];};
            case civilian: {_query = format ["UPDATE players SET civ_licenses='%1' WHERE pid='%2'",_value,_uid];};
            case independent: {_query = format ["UPDATE players SET med_licenses='%1' WHERE pid='%2'",_value,_uid];};
        };
    };

    case 3: {
        params [
            ["_uid","",[""]],
            ["_side",sideUnknown,[civilian]],
            ["_value",[],[[]]]
        ];
        _value = [_value] call HC_fnc_mresArray;
        switch (_side) do {
            case west: {_query = format ["UPDATE players SET cop_gear='%1' WHERE pid='%2'",_value,_uid];};
            case civilian: {_query = format ["UPDATE players SET civ_gear='%1' WHERE pid='%2'",_value,_uid];};
            case independent: {_query = format ["UPDATE players SET med_gear='%1' WHERE pid='%2'",_value,_uid];};
        };
    };

    case 4: {
        params [
            ["_value",false,[true]],
            ["_value2",[],[[]]]
        ];
        _value = [_value] call HC_fnc_bool;
        _value2 = if (count _value2 isEqualTo 3) then {_value2} else {[0,0,0]};
        _value2 = [_value2] call HC_fnc_mresArray;
        _query = format ["UPDATE players SET civ_alive='%1', civ_position='%2' WHERE pid='%3'",_value,_value2,_uid];
    };

    case 5: {
        params [
            ["_value",false,[true]]
        ];
        _value = [_value] call HC_fnc_bool;
        _query = format ["UPDATE players SET arrested='%1' WHERE pid='%2'",_value,_uid];
    };

    case 6: {
        params [
            ["_value1",0,[0]],
            ["_value2",0,[0]]
        ];
        _value1 = [_value1] call HC_fnc_numberSafe;
        _value2 = [_value2] call HC_fnc_numberSafe;
        _query = format ["UPDATE players SET cash='%1', bankacc='%2' WHERE pid='%3'",_value1,_value2,_uid];
    };

    case 7: {
        params [
            ["_array",[],[[]]]
        ];
        [_uid,_side,_array,0] remoteExecCall ["TON_fnc_keyManagement",RSERV];
    };
};

if (_query isEqualTo "") exitWith {};

[_query,1] call HC_fnc_asyncCall;
