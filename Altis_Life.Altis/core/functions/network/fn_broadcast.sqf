/*
    File: fn_broadcast.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Broadcast system used in the life mission for multi-notification purposes.
*/
params [
    ["_type", 0, [0, []]],
    ["_message", "", [""]],
    ["_localize", false, [false]],
    ["_arr", [], [[]]]
];

if (_message isEqualTo "") exitWith {};

if (_localize) exitWith {
    private _msg = switch (count _arr) do {
        case 0: {localize _message;};
        case 1: {format [localize _message,_arr select 0];};
        case 2: {format [localize _message,_arr select 0, _arr select 1];};
        case 3: {format [localize _message,_arr select 0, _arr select 1, _arr select 2];};
        case 4: {format [localize _message,_arr select 0, _arr select 1, _arr select 2, _arr select 3];};
    };

    if (_type isEqualType []) then {
        {
            switch (_x) do {
                case 0: {systemChat _msg;};
                case 1: {hint _msg;};
                case 2: {titleText[_msg,"PLAIN"];};
            };
            true
        } count _type;
    } else {
        switch (_type) do {
            case 0: {systemChat _msg;};
            case 1: {hint _msg;};
            case 2: {titleText[_msg,"PLAIN"];};
        };
    };
};

if (_type isEqualType []) then {
    {
        switch (_x) do {
            case 0: {systemChat _message};
            case 1: {hint format ["%1", _message]};
            case 2: {titleText[format ["%1",_message],"PLAIN"];};
            case 3: {hint parseText format ["%1", _message]};
        };
        true
    } count _type;
} else {
    switch (_type) do {
        case 0: {systemChat _message};
        case 1: {hint format ["%1", _message]};
        case 2: {titleText[format ["%1",_message],"PLAIN"];};
        case 3: {hint parseText format ["%1", _message]};
    };
};
