/*
    File: fn_keyManagement.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Keeps track of an array locally on the server of a players keys.
*/
params [
    ["_uid","",[""]],
    ["_side",sideUnknown,[sideUnknown]],
    "",
    ["_mode",0,[0]]
];

if (_uid isEqualTo "" || _side isEqualTo sideUnknown) exitWith {}; //BAAAAAAAAADDDDDDDD

switch (_mode) do {
    case 0: {
        params [
            "",
            "",
            ["_input",[],[[]]]
        ];
        private _arr = [];
        {
            if (!isNull _x && {!(_x isKindOf "House")}) then {
                _arr pushBack _x;
            };
        } forEach _input;

        _arr = _arr - [objNull];
        missionNamespace setVariable [format ["%1_KEYS_%2",_uid,_side],_arr];
    };

    case 1: {
        params [
            "",
            "",
            ["_input",objNull,[objNull]]
        ];
        if (isNull _input || _input isKindOf "House") exitWith {};
        private _arr = missionNamespace getVariable [format ["%1_KEYS_%2",_uid,_side],[]];
        _arr pushBack _input;
        _arr = _arr - [objNull];
        missionNamespace setVariable [format ["%1_KEYS_%2",_uid,_side],_arr];
    };

    case 2: {
        private _arr = missionNamespace getVariable [format ["%1_KEYS_%2",_uid,_side],[]];
        _arr = _arr - [objNull];
        missionNamespace setVariable [format ["%1_KEYS_%2",_uid,_side],_arr];
    };
};
