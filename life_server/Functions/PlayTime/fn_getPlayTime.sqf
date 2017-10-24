/*
        File : fn_getPlayTime.sqf
        Author : NiiRoZz

        Description :
        Gets playtime for player with UID

        GATHERED - Loaded from DB and NOT changed
        JOIN - Time, the player joined - the newly gathered playtime will be calculated using difference

*/
params [
    ["_uid","",[""]]
];

private _timeGathered = nil;
private _timeJoin = nil;

{
    _x params [
        ["_timeUID","",[""]]
    ];
    if (_timeUID isEqualTo _uid) exitWith {
        _x params [
            "",
            ["_timeGathered",0,[0]],
            ["_timeJoin",0,[0]]
        ];
    };
} forEach TON_fnc_playtime_values;

if (isNil "_timeGathered" || isNil "_timeJoin") then {
    _timeGathered = 0;
    _timeJoin = time;
    TON_fnc_playtime_values pushBack [_uid, _timeGathered, _timeJoin];
};

publicVariable "TON_fnc_playtime_values";

private _time = (time - _timeJoin); //return time
_time = _time + _timeGathered;
_time = round (_time/60);

_time;