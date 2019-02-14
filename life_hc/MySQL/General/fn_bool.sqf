/*
    File: fn_bool.sqf
    Author: TAW_Tonic

    Description:
    Handles bool conversion for MySQL since MySQL doesn't support 'true' or 'false'
    instead MySQL uses Tinyint for BOOLEAN (0 = false, 1 = true)
*/
params [
    ["_bool",0,[false,0]],
    ["_mode",0,[0]]
];

switch (_mode) do {
    case 0: {
        if (_bool isEqualType 0) exitWith {0};
        if (_bool) then {1} else {0};
    };

    case 1: {
        if (!(_bool isEqualType 0)) exitWith {false};
        switch (_bool) do {
            case 0: {false};
            case 1: {true};
        };
    };
};
