/*
        File : fn_setPlayTime.sqf
        Author : NiiRoZz

        Description :
        Sets gathered time of player

        GATHERED - Loaded from DB and NOT changed
        JOIN - Time, the player joined - the newly gathered playtime will be calculated using difference

*/

params [
    ["_uid","",[""]],
    ["_timeGathered",0,[0]]
];
_timeGathered = (_timeGathered * 60);

//create value using get
[_uid] call TON_fnc_getPlayTime;

//set value no 1
{
    _x params [
        ["_timeUID","",[""]]
    ];
    if (_timeUID isEqualTo _uid) exitWith {
        _x set [1, _timeGathered];
        _x set [2, time];
    };
} forEach TON_fnc_playtime_values;