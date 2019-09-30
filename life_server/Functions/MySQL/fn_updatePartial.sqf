/*
    File: fn_updatePartial.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Takes partial data of a player and updates it, this is meant to be
    less network intensive towards data flowing through it for updates.
*/
params [
    ["_uid","",[""]],
    ["_side",sideUnknown,[civilian]],
    ["_mode",-1,[0]]
];

if (_uid isEqualTo "" || _side isEqualTo sideUnknown) exitWith {}; //Bad.

switch (_mode) do {
    case 0: {
        params [
            "",
            "",
            ["_value",0,[0]]
        ];
        _value = [_value] call DB_fnc_numberSafe;
        [format ["UPDATE players SET cash='%1' WHERE pid='%2'",_value,_uid],1] call DB_fnc_asyncCall;
    };

    case 1: {
        params [
            "",
            "",
            ["_value",0,[0]]
        ];
        _value = [_value] call DB_fnc_numberSafe;
        [format ["UPDATE players SET bankacc='%1' WHERE pid='%2'",_value,_uid],1] call DB_fnc_asyncCall;
    };

    case 2: {
        params [
            "",
            "",
            ["_value",[],[[]]]
        ];
        //Does something license related but I can't remember I only know it's important?
        private "_bool";
        for "_i" from 0 to count(_value)-1 do {
            _bool = [(_value select _i) select 1] call DB_fnc_bool;
            _value set[_i,[(_value select _i) select 0,_bool]];
        };
        _value = [_value] call DB_fnc_mresArray;
        switch (_side) do {
            case west: {[format ["UPDATE players SET cop_licenses='%1' WHERE pid='%2'",_value,_uid],1] call DB_fnc_asyncCall;};
            case civilian: {[format ["UPDATE players SET civ_licenses='%1' WHERE pid='%2'",_value,_uid],1] call DB_fnc_asyncCall;};
            case independent: {[format ["UPDATE players SET med_licenses='%1' WHERE pid='%2'",_value,_uid],1] call DB_fnc_asyncCall;};
        };
    };

    case 3: {
        params [
            "",
            "",
            ["_value",[],[[]]]
        ];
        _value = [_value] call DB_fnc_mresArray;
        switch (_side) do {
            case west: {[format ["UPDATE players SET cop_gear='%1' WHERE pid='%2'",_value,_uid],1] call DB_fnc_asyncCall;};
            case civilian: {[format ["UPDATE players SET civ_gear='%1' WHERE pid='%2'",_value,_uid],1] call DB_fnc_asyncCall;};
            case independent: {[format ["UPDATE players SET med_gear='%1' WHERE pid='%2'",_value,_uid],1] call DB_fnc_asyncCall;};
        };
    };

    case 4: {
        params [
            "",
            "",
            ["_value",false,[true]],
            "",
            ["_value1",[],[[]]]
        ];
        _value = [_value] call DB_fnc_bool;
        _value1 = if (count _value1 isEqualTo 3) then {_value2} else {[0,0,0]};
        _value1 = [_value1] call DB_fnc_mresArray;
        [format ["UPDATE players SET civ_alive='%1', civ_position='%2' WHERE pid='%3'",_value,_value1,_uid],1] call DB_fnc_asyncCall;
    };

    case 5: {
        params [
            "",
            "",
            ["_value",false,[true]]
        ];
        _value = [_value] call DB_fnc_bool;
        [format ["UPDATE players SET arrested='%1' WHERE pid='%2'",_value,_uid],1] call DB_fnc_asyncCall;
    };

    case 6: {
    params [
            "",
            "",
            ["_value",0,[0]],
            "",
            ["_value1",0,[0]]
        ];
        _value = [_value] call DB_fnc_numberSafe;
        _value1 = [_value1] call DB_fnc_numberSafe;
        [format ["UPDATE players SET cash='%1', bankacc='%2' WHERE pid='%3'",_value,_value1,_uid],1] call DB_fnc_asyncCall;
    };

    case 7: {
        params [
            "",
            "",
            ["_array",[],[[]]]
        ];
        [_uid,_side,_array,0] call TON_fnc_keyManagement;
    };
};
